/*******************************************************************************
  Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This file contains the "main" function for a project.

  Description:
    This file contains the "main" function for a project, interrupt handler 
	callback functions and Temperature conversion function. The "main" 
	function calls the "SYS_Initialize" function to initialize all peripherals 
	utilized in this project, calls the different interrupt handler callback 
	initialiaztions and the "main" function have the application code to 
	toggles an LED on a timeout basis and to print the LED toggling rate 
	(or current temperature value if a I/01 Xplained Pro Extension Kit board 
	is connected) on the serial terminal.
*******************************************************************************/

//DOM-IGNORE-BEGIN 
/*******************************************************************************
* Copyright (C) 2020 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
*******************************************************************************/
//DOM-IGNORE-END 

#pragma config DEBUG =      OFF
#pragma config JTAGEN =     OFF
#pragma config ICESEL =     ICS_PGx1
#pragma config TRCEN =      OFF
#pragma config BOOTISA =    MIPS32
#pragma config FECCCON =    OFF_UNLOCKED
#pragma config FSLEEP =     OFF
#pragma config DBGPER =     PG_ALL
#pragma config SMCLR =      MCLR_NORM
#pragma config SOSCGAIN =   GAIN_LEVEL_3
#pragma config SOSCBOOST =  ON
#pragma config POSCGAIN =   GAIN_LEVEL_3
#pragma config POSCBOOST =  ON
#pragma config EJTAGBEN =   NORMAL
#pragma config CP =         OFF

/*** DEVCFG1 ***/
#pragma config FNOSC =      SPLL
#pragma config DMTINTV =    WIN_127_128
#pragma config FSOSCEN =    ON
#pragma config IESO =       OFF
#pragma config POSCMOD =    OFF
#pragma config OSCIOFNC =   OFF
#pragma config FCKSM =      CSECME
#pragma config WDTPS =      PS1048576
#pragma config WDTSPGM =    STOP
#pragma config FWDTEN =     OFF
#pragma config WINDIS =     NORMAL
#pragma config FWDTWINSZ =  WINSZ_25
#pragma config DMTCNT =     DMT31
#pragma config FDMTEN =     OFF

/*** DEVCFG2 ***/
#pragma config FPLLIDIV =   DIV_1
#pragma config FPLLRNG =    RANGE_5_10_MHZ
#pragma config FPLLICLK =   PLL_FRC
#pragma config FPLLMULT =   MUL_50
#pragma config FPLLODIV =   DIV_2
#pragma config UPLLFSEL =   FREQ_24MHZ

/*** DEVCFG3 ***/
#pragma config USERID =     0xffff
#pragma config FMIIEN =     ON
#pragma config FETHIO =     ON
#pragma config PGL1WAY =    ON
#pragma config PMDL1WAY =   ON
#pragma config IOL1WAY =    ON
#pragma config FUSBIDIO =   ON

/*** BF1SEQ0 ***/

#pragma config TSEQ =       0xffff
#pragma config CSEQ =       0x0



// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************






//#define PMD_CAN_INTERFACE
#define PMD_SPI_INTERFACE

#ifdef PMD_SPI_INTERFACE
#define USE_SPI_INTERFACE
#endif

//#define PMD_W32SERIAL_INTERFACE
#include "C-Motion.h"
#include "PMDutil.h"
#include "PMDsys.h"
#include "PMDdiag.h"
#include "PMDsys.h"
#include "Examples.h"
#include "PMDperiph.h"
#include "PMDdevice.h"
#include "DBPrint.h"

#include <stdio.h>
#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include <string.h>
#include "definitions.h"                // SYS function prototypes
#include "device_cache.h"
#include <xc.h>

#define TEMP_SENSOR_SLAVE_ADDR                  0x004F
#define TEMP_SENSOR_REG_ADDR                    0x00

#define SWITCH_PRESSED_STATE                    0   // Active LOW switch

#define SWITCH_1                                1   // Switch 1 is pressed
#define SWITCH_3                                3   // Switch 1 is pressed

/* Timer Counter Time period match values for input clock of 4096 Hz */
#define PERIOD_500MS                            2048
#define PERIOD_1S                               4096
#define PERIOD_2S                               8192
#define PERIOD_4S                               16384


static volatile uint8_t currSwitchPressedState = SWITCH_1;

void IOExample(PMDDeviceHandle* phDevice);

#define BUFSIZE 32
int main ( void )
{
	   
    PMDuint16 generation, motorType, numberAxes, chip_count, custom, major, minor;
	PMDAxisHandle hAxis1; 
	PMDresult result;
    PMDuint32 vmajor; 
    PMDuint32 vminor;
       
    // If this is a host computer open the local peripheral and device handle that is connected to the ION device.
    PMDPeriphHandle hPeriph;
    PMDDeviceHandle *phDevice = NULL;
    PMDDeviceHandle hDevice;
    PMDInterfaceType Interface = InterfaceSPI;
    PMDDeviceType DeviceType = PMDDeviceTypeResourceProtocol;
    

#if(0)    
     // TODO: select one of the following interfaces to connect to the device
    if (Interface == InterfaceSerial)
    {
        int serialport = 1;
        PMDprintf("ION/CME example connecting to COM%d\r\n", serialport);
        PMD_ABORTONERROR(PMDPeriphOpenCOM( &hPeriph, NULL, serialport-1, 57600, PMDSerialParityNone, PMDSerialStopBits1))
        //PMD_ABORTONERROR(PMDPeriphOpenMultiDrop(&hPeriph, &hPeriph, nodeID)) enable this line if multidrop mode (RS485)
    }
    else
    if (Interface == InterfaceTCP)
    {
        PMDprintf("Connecting via TCP\r\n");
        PMD_ABORTONERROR(PMDPeriphOpenTCP( &hPeriph, NULL, PMD_IP4_ADDR(192,168,2,2), 40100, 0 ))
    }
    else
    if (Interface == InterfaceCAN)
    {
        PMDprintf("Connecting via CAN\r\n");
        PMD_ABORTONERROR(PMDPeriphOpenCANFD(&hPeriph, NULL, PMDCANPort1, PMDCANBaud20000, 0x600, 0x580, 0))
    }
    
    else
#endif    
    if (Interface == InterfaceSPI)
    {
        PMDprintf("Connecting via SPI\r\n");
        //PMDuint8 port, PMDuint8 chipselect, PMDuint8 mode, PMDuint8 datasize, PMDparam bitrate)
        PMD_ABORTONERROR(PMDPeriphOpenSPI(&hPeriph, NULL, 0, 1, 0, 16, 10000));
        DeviceType = PMDDeviceTypeResourceProtocol;
    }
    
   
  
    // Open a handle to a PRP (PMD Resource Protocol) device. Also referred as CME (C-Motion Engine)
    PMD_ABORTONERROR(PMDRPDeviceOpen(&hDevice, &hPeriph))	
    phDevice = &hDevice;
    
    // It will not return PMD_ERR_RP_Reset a second time, so abort on any other error.
    PMDDeviceGetVersion(phDevice, &vmajor, &vminor);
    PMD_RESULT(PMDDeviceGetVersion(phDevice, &vmajor, &vminor))
    PMD_ABORTONERROR(PMDDeviceGetVersion(phDevice, &vmajor, &vminor))
    
    PMDAxisOpen(&hAxis1,phDevice,PMDAxis1);    
    
    PMDTaskWait(100);
    result=PMDGetVersion( &hAxis1, &generation, &motorType, &numberAxes, &chip_count, &custom, &major, &minor );
    if(result)
	{
		printf("result=%x\n",result);
		return -1;
	}
	else
	{	
	printf("PMD Motion Processor MC%d%d%d%d0 v%d.%d\n\n", generation, motorType, numberAxes, chip_count, major, minor);

	}
 
    
    PMDprintf("Calling MemoryExample() from Examples.c\r\n");
    MemoryExample(phDevice, PMDMemoryAddress_RAM);

    // N-Series ION specific example functions
 //   ReadTime(phDevice);
    //  PMDTaskWait(240);
      IOExample(phDevice);
//    MailboxExample(phDevice);
//	  AutoAddressingExample(phDevice);
//    AttachedIONviaExpSPI(phDevice);

    // Motion IC example functions
   

    PMDprintf("Calling SetupAxis1() from Pro-MotionExport.c\r\n");
    SetupAxis1(&hAxis1);

    PMDprintf("Calling ProfileMove() from Examples.c\r\n");
    ProfileMove(&hAxis1);

    PMDprintf("Done\r\n");


    PMD_ABORTONERROR(PMDDeviceClose(&hDevice));
    PMD_ABORTONERROR(PMDPeriphClose(&hPeriph));
         

    return ( EXIT_FAILURE );
}

#if(0)

void ReadTime(PMDDeviceHandle* phDevice)
{
    SYSTEMTIME systime;
    int i = 0;
    PMDresult result;

    PMD_RESULT(PMDDeviceGetSystemTime(phDevice, &systime))
    PMDprintf("Device time: %02u/%02u/%0u  %02u:%02u:%02u:%03u\r\n", 
     systime.wYear, systime.wMonth, systime.wDay,
     systime.wHour, systime.wMinute, systime.wSecond,
     systime.wMilliseconds);
#ifndef CME
    // Set the ION time to the PC time.
    GetSystemTime(&systime);
    PMDprintf("PC time: %u/%u/%u  %u:%u:%u:%u\r\n", 
     systime.wYear, systime.wMonth, systime.wDay,
     systime.wHour, systime.wMinute, systime.wSecond,
     systime.wMilliseconds);

    PMDprintf("Press 'y' to set ION time to PC time\r\n");
    {
    char ch = _getch();
    if (ch == 'y')
    {
        GetSystemTime(&systime);
        PMD_RESULT(PMDDeviceSetSystemTime(phDevice, &systime))
        PMD_RESULT(PMDDeviceGetSystemTime(phDevice, &systime))
        PMDprintf("Device time: %u/%u/%u  %u:%u:%u:%u\r\n", 
         systime.wYear, systime.wMonth, systime.wDay,
         systime.wHour, systime.wMinute, systime.wSecond,
         systime.wMilliseconds);
    }
    }
#else
    for (int j=0; j < 2; j++)
    {
        PMDuint32 Microsecs[40];
        for (i=0; i < 20; i++)
            Microsecs[i] = PMDDeviceGetMicroseconds();
        for (i=0; i < 20; i++)
            PMDprintf("Microsecs[%d] %u\r\n", i, Microsecs[i]);
    }
#endif

}

#endif  

void IOExample(PMDDeviceHandle* phDevice)
{
    PMDPeriphHandle hPeriph;
    BYTE eventIRQ = 0;
    PMDDataSize datasize = PMDDataSize_16Bit;
//    PMDparam offset = 0;
    PMDparam length = 1;
    PMDuint16 data;
    PMDresult result;
    
    PMDprintf("nION/CME digital IO example\r\n");

    // Read digital inputs
    PMD_ABORTONERROR(PMDPeriphOpenPIO(&hPeriph, phDevice, 0, eventIRQ, datasize));
    PMD_RESULT(PMDPeriphRead(&hPeriph, &data, PMDPIO_DIO_IN_READ, length));
    PMDprintf("DII input read 0x%04X\r\n", data);

    // Read digital outputs
    // Digital IOs 1-4 are push-pull
    // Digital IOs 5-8 are open collector. If they are set to 1 (not pulled to GND) they can be read as digital inputs.
    PMD_RESULT(PMDPeriphRead(&hPeriph, &data, PMDPIO_DIO_OUT_READ, length));
    PMDprintf("DIO output read 0x%04X\r\n", data);

    // Read digital IO direction 
    // Digital IOs 1-4 are push-pull bi-directional
    PMD_RESULT(PMDPeriphRead(&hPeriph, &data, PMDPIO_DIO_DIR_READ, length));
    PMDprintf("DIO direction read 0x%04X\r\n", data);

    // Read digital IO signal selection register
/*  
    DIO_SIG_SEL values
    bits         0               1               2             3
    15:14    DigitalIO8    HostSPIStatus Out
    13:12    DigitalIO7    SynchOut          ExpSPICS4   EthernetSpeedLED
    11:10    DigitalIO6    HostInterrupt     ExpSPICS3   EthernetLinkLED
    9:8      DigitalIO5    AxisOut           ExpSPICS2   
    7:6      DigitalIO4    SynchIn           ExpSPICS1   
    5:4      DigitalIO3    AxisIn            ExpSPIClk   
    3:2      DigitalIO2    Srl3Rcv           ExpSPIRcv   
    1:0      DigitalIO1    Srl3Xmt           ExpSPIXmt   
*/
    PMD_RESULT(PMDPeriphRead(&hPeriph, &data, PMDPIO_DIO_SIG_SEL, length));
    PMDprintf("DIO signal selection 0x%04X\r\n", data);

    // Read general purpose analog input
    PMD_RESULT(PMDPeriphRead(&hPeriph, &data, PMDPIO_AICh1, length));
    // Read AI returns 0x0000 = -10V 0xFFFF,= +10V 
    PMDprintf("AI read 0x%04X\r\n", data);

    PMD_RESULT(PMDPeriphClose(&hPeriph));
}

typedef struct tagMailObject
{
    int dataTx;
    int dataRx;
    char string1[20];
} MailObject;

// The Mailbox example receives mailbox items from mailbox1 and sends items to mailbox 2 that are created on the device in user code.
void MailboxExample(PMDDeviceHandle* phDevice)
{
    PMDresult result;
    PMDuint32 timeout = 5000;
    PMDMailboxHandle hMailbox1;
    PMDMailboxHandle hMailbox2;
    MailObject mail;
    int mailboxId1 = 1;
    int mailboxId2 = 2;
    int depth = 2;
    int itemsize = sizeof(MailObject);
    int i;

    mail.dataTx = 1;
    mail.dataRx = 1;
    strcpy(mail.string1, "Consumer.");

    PMDprintf("Starting Mailbox Example\r\n");

    PMD_ABORTONERROR(PMDMailboxOpen(&hMailbox1, phDevice, mailboxId1, depth, itemsize))
    PMD_ABORTONERROR(PMDMailboxOpen(&hMailbox2, phDevice, mailboxId2, depth, itemsize))

    for (i=0; i<100; i++)
    {
        PMD_RESULT(PMDMailboxReceive(&hMailbox1, &mail, timeout))
        if (result == PMD_ERR_OK)
        {
            PMDprintf("Consumer Tx = %3d, Rx = %3d, string %20s\r\n", mail.dataTx, mail.dataRx, mail.string1 );
        }
        PMDTaskWait(500);
    }
}

void AttachedIONviaExpSPI(PMDDeviceHandle *phDevice)
{
    PMDPeriphHandle hPeriph;
    PMDDeviceHandle hDevice;
    PMDInterfaceType Interface = InterfaceSPI;
    PMDuint8 ChipSelect = 0;
    PMDuint8 mode = PMDSPIModeRisingEdge;
    PMDuint8 datasize = 8;
    PMDuint8 bitrate = PMDSPIBitRate_1250kHz;
    PMDuint8 port = PMDSPIPort_Exp;
    PMDresult result;
    
    PMDprintf("Starting RemoteSPInION Example\r\n");

    // Open the SPI peripheral on the master N-Series ION
    PMD_RESULT(PMDPeriphOpenSPI(&hPeriph, phDevice, port, ChipSelect, mode, datasize, bitrate))
    // Open a handle to a PRP device via the SPI peripheral 
    PMD_RESULT(PMDRPDeviceOpen(&hDevice, &hPeriph)) 

 //   TestCommunications(&hDevice);
 //   ReadTime(&hDevice);

    PMD_RESULT(PMDDeviceClose(&hDevice));
    PMD_RESULT(PMDPeriphClose(&hPeriph));
}



// DO is a value between 1 and 8.
void SetDIO(PMDDeviceHandle* phDevice, int DIO, int state)
{
    PMDPeriphHandle hPeriphPIO;
    PMDuint16 mask, mux = 0;
    PMDresult result;

    DIO--; 
    PMD_RESULT(PMDPeriphOpenPIO(&hPeriphPIO, phDevice, 0, 0, PMDDataSize_16Bit));
    PMD_RESULT(PMDPeriphRead(&hPeriphPIO, &mux, PMDPIO_DIO_SIG_SEL, 1));
    // Set the mux for the selected DO
    mask = 3 << (DIO * 2);
    mask = ~mask;
    mux &= mask;
    PMD_RESULT(PMDPeriphWrite(&hPeriphPIO, &mux, PMDPIO_DIO_SIG_SEL,  1));
    mask = 1 << DIO;
    PMD_RESULT(PMDPeriphWrite(&hPeriphPIO, &mask, PMDPIO_DIO_OUT_MASK,  1));
    PMD_RESULT(PMDPeriphWrite(&hPeriphPIO, &state, PMDPIO_DIO_OUT_WRITE,  1));
    PMD_RESULT(PMDPeriphClose(&hPeriphPIO))
}

/*
    The Auto-Addressing example below uses the SynchIn and SynchOut signals, although any two DIOs can be used. 
    The SynchIn (DIO4) signal is internally pulled low by 2.2k and the SynchOut (DIO7) signal is internally pulled high by a 1k 
    resulting in SynchIn seeing 3.4V high level input so the auto-addressing signal sense should be set to low. 
    On power-up, all SynchIn signals will see a high level except for the first one. 
    This example expects each SynchOut signal to be connected to the SynchIn input of the next nION in the chain.
    ex. nION1 SynchOutn ---> SynchIn nION2 SynchOutn ---> SynchIn nION2 SynchOutn ---> SynchIn nION3 SynchOutn 
    
    3 connection mode examples:

      ___________________________________CANbus________________________
      |                   |                |                |
    Host                nION1            nION2            nION3
                       hDevice[0]       hDevice[1]       hDevice[2]        
                       phDevice

                          _______________CANbus________________________
          any interface   |                |                |
    Host -------------> nION1            nION2            nION3
                       phDevice         hDevice[0]       hDevice[1]        


    No host               _______________CANbus________________________
                          |                |                |
                        nION1            nION2            nION3
                                       hDevice[0]       hDevice[1]        
*/
#define NUMDEVICES 4
void AutoAddressingExample(PMDDeviceHandle* phDevice)
{
    int numDevices = NUMDEVICES;
    int numDevicesFound = 0;
    PMDDeviceHandle hDevice[NUMDEVICES];
    PMDPeriphHandle hPeriph[NUMDEVICES];
    PMDPeriphHandle hPeriphMaster; // When nION1 is the master this is the nodeID 0 peripheral handle
    PMDDeviceHandle hDeviceMaster;
    PMDDeviceHandle* phDeviceMaster = phDevice;
    int i;
    PMDuint8 nodeID = 1; // start at any nodeID except 0. 
    PMDuint8 DOsignal = PMDDIO_INT1_SEL_DIO7; // DIO7/SyncOut
    PMDuint8 DIsignal = PMDDIO_INT1_SEL_DIO4; // DIO4/SyncIn
    PMDuint8 DIsense = 0; // The input level that triggers the device to set its node id when it receives this command.
    int bIONisMaster = (phDevice == NULL);
    int bCME = (phDevice == NULL);
    PMDresult result;

    // bIONisMaster means the SetNodeID command originates from a nION rather than from a host on the same bus.
    // ION is always master if running from downloaded CME code.
    if (phDevice != NULL) // Running from a host
        if (phDevice->hPeriph->type != InterfaceCAN)
        {
            // we are connected via CAN from the host and IONs
            bIONisMaster = 1;
        }

    PMDprintf("Auto Addressing Exmaple\r\n");

    // Open Device handles for each node on the network.
    for (i=0; i<numDevices; i++)
    {
        if (bIONisMaster)
        { 
            // If bIONisMaster then use Expansion CAN 
            // Open individual periph handles to each node.
            PMDparam baud = PMDCANBaud1000000;
            PMD_RESULT(PMDPeriphOpenCANNodeID(&hPeriph[i], phDevice, baud, nodeID + i))
        }
        else
        {
            // Create multi-drop peripheral handles from the host device handle's periph handle
            // Works with CAN and RS485 on the host
            PMD_RESULT(PMDPeriphOpenMultiDrop(&hPeriph[i], phDevice->hPeriph, nodeID + i))
        }

        // Create individual device handles from the multi-drop peripheral handles
        PMD_RESULT(PMDRPDeviceOpen(&hDevice[i], &hPeriph[i]))
    }
    if (bIONisMaster)
    { 
        // We need to set the SynchOut pin low on the first device, but only if the SynchIn on the first slave is not already connected to GND.
        SetDIO(phDevice, DOsignal, 0);
        // We need a peripheral handle to nodeID 0 to send the SetNodeID command to.
        PMDparam baud = PMDCANBaud1000000;
        PMD_RESULT(PMDPeriphOpenCANNodeID(&hPeriphMaster, phDevice, baud, 0))
        PMD_RESULT(PMDRPDeviceOpen(&hDeviceMaster, &hPeriphMaster))	// Open	a handle to	a PRP device
        phDeviceMaster = &hDeviceMaster;
    }

    for (i=0; i<numDevices; i++)
    {
        PMDprintf("Attempting to set node id for %d... ", nodeID);
        PMD_RESULT(PMDDeviceSetNodeID(phDeviceMaster, nodeID, DOsignal, DIsignal, DIsense))
        // This is the only command that will not return PMD_ERR_RP_Reset if it the first command received by the ION so we do not need to worry about resending it.
        // if we received a response that means a device succesfully changed its address
        PMDTaskWait(100);
        if (result == PMD_ERR_OK)
        {
            PMDprintf("Success! \r\n");
            // Verify NodeID by sending a command to that nodeID.
            PMD_RESULT(PMDDeviceNoOperation(&hDevice[i]))
            nodeID++;
            numDevicesFound++;
        }
        if (result != PMD_ERR_OK)
        {
            PMDprintf("Failed\r\n");
            break;
        }
    }
    PMDprintf("Detected and set node ids for %d devices\r\n", i);

    for (i=0; i<numDevices; i++)
    {
        PMD_RESULT(PMDDeviceClose(&hDevice[i]))
        PMD_RESULT(PMDPeriphClose(&hPeriph[i]))
    }
    if (bIONisMaster)
    {
        PMD_RESULT(PMDDeviceClose(&hDeviceMaster))
        PMD_RESULT(PMDPeriphClose(&hPeriphMaster))
    }
}






/*******************************************************************************
 End of File
*/

