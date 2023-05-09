//  PMDPspi.c -- SPI interface command/data transfer functions for National Instruments USB-8452.
//
//  Performance Motion Devices, Inc.
//

#include "PMDRPtypes.h"
#include "PMDperiph.h"
#include "PMDecode.h"
#include "PMDsys.h"
#include "PMDPfunc.h"

#ifdef WINDOWS
#include "NI\Ni845x.h"
#else
#include <stdlib.h>
#include "peripheral/spi/plib_spi.h"
#define INVALID_HANDLE_VALUE -1;
#endif

typedef struct tagPMDSPI_IOData {
#ifdef WINDOWS    
    NiHandle ConfigurationHandle;
    NiHandle DeviceHandle;
    NiHandle ScriptHandle;
#else
    HANDLE ConfigurationHandle;
    HANDLE DeviceHandle;
#endif
             
    
    PMDuint16 NumBitsPerSample;
    PMDint32 ClockPhase;
    PMDint32 ClockPhaseRead;
    PMDint32 ClockPolarity;
    
    /* supported NI clock rates: (PMD products support up to 10MHz)
       25 kHz,   32 kHz,  40 kHz,  50 kHz,  80 kHz, 100 kHz, 125 kHz,
       160 kHz, 200 kHz, 250 kHz, 400 kHz, 500 kHz, 625 kHz, 800 kHz,
       1 MHz,  1.25 MHz, 2.5 MHz, 3.125 MHz, 4 MHz, 5 MHz, 6.25 MHz,
       10 MHz, 12.5 MHz, 20 MHz, 25 MHz, 33.33 MHz, 50 MHz
    */
        
    PMDuint16 ClockRate;
    PMDuint32 ChipSelect;
    BOOL bUseScript;
    BOOL bByteSwap;
    BOOL bUseHostStatus;
    long Timeout;
    PMDuint8 bVerbose;
    PMDuint8 ReadData[TOTAL_PACKET_LENGTH];
    char     ResourceName[256];
} PMDSPI_IOData;


#ifdef WINDOWS

#define Printf printf
#define STRING_SIZE 256


static void PrintNIError(int errorcode, char* functioncall)
{
    char StatusString[STRING_SIZE];

    if (errorcode) 
    { 
        ni845xStatusToString(errorcode, STRING_SIZE, StatusString);
        Printf("Error: %s\n", StatusString);
        Printf(" in: %s\n", functioncall);
    }
}




#define NI_RESULT(_code, _call)  _code = _call;  \
    if (_code) PrintNIError(_code, #_call);

#endif

/*
#define NI_RESULT(_code, _call)  _code = _call;  \
    if (_code) { \
        char StatusString[STRING_SIZE]; \
        ni845xStatusToString(_code, STRING_SIZE, StatusString); \
        Printf("Error: %s\n", StatusString); \
        Printf(" call: " #_call "\n");}
*/

PMDresult PMDPSPI_Close(PMDPeriphHandle* hPeriph)
{
    PMDSPI_IOData* SPItransport_data = (PMDSPI_IOData*)hPeriph->transport_data;
#ifdef WINDOWS
    PMDint32 StatusCode;
#endif
    
    if (SPItransport_data != NULL)
    {
#ifdef WINDOWS
        if (hPeriph->handle != INVALID_HANDLE_VALUE)
        {
             if (SPItransport_data->bUseScript)  //SCRIPT_MODE
             {
                  NI_RESULT(StatusCode,
                            ni845xSpiScriptClose(SPItransport_data->ScriptHandle) );
             }
             NI_RESULT(StatusCode,
                       ni845xSpiConfigurationClose( SPItransport_data->ConfigurationHandle ));
/*
             NI_RESULT(StatusCode,
                       ni845xDeviceUnlock ( SPItransport_data->DeviceHandle ));
*/
             NI_RESULT(StatusCode,
                       ni845xClose (SPItransport_data->DeviceHandle));
        }
#endif        
        hPeriph->handle = (void*) INVALID_HANDLE_VALUE;
        free(SPItransport_data);
        hPeriph->transport_data = NULL;

    }
    return PMD_ERR_OK;
}


#ifndef WINDOWS
// HostSPIStatus is connected to RB10 on PIC32 
int GetHostSPIStatus(PMDPeriphHandle* hPeriph)
{
   return PORTB&0x400;
}

// HostSPIEnable is connected to D9
void AssertHostSPIEnable()
{
     PORTD&=0xFDFF;
}

void DeAssertHostSPIEnable()
{
     PORTD|=0x0200;
}

// Data provided in pWriteData and retrieved using pReadData is organized in big endian format.
PMDresult PMDSPI_WriteWords(HANDLE hDevice, PMDuint16 *WriteData, int nwords, PMDuint16 *ReadData)
{
	uint8_t rxbuff[260];
	int i;
	int ret = 0;
    short temp;
    short data;
    

   // wait for SPIRBF bit to be clear which means shifting is complete
    temp=1;
    while(temp)
    {
        temp=SPI1STAT;
        temp&=0x0001;
    } 
    
    AssertHostSPIEnable();
    for(i=0;i<nwords;i++)
    {
        SPI1BUF=WriteData[i];
      
        // wait for SPIRBF bit to be set which means shifting is complete
        temp=0;
        while(!temp)
        {
            temp=SPI1STAT;
            temp&=0x0001;
        } 
    
        data=SPI1BUF;
        rxbuff[2*i]=data;
        rxbuff[2*i+1]=data>>8;
    }
     
    DeAssertHostSPIEnable();
	if (ret >= 0 && ReadData)
	{
		// do not Byte swap read data
		for (i = 0; i < nwords; i++)
		{
	
            ReadData[i] = ((rxbuff[2*i+1]) << 8) + rxbuff[2*i];
        }
	}
	return PMD_ERR_OK;
}


#endif

// for getting HostSPIStatus
static PMDresult PMDPSPI_Read(PMDPeriphHandle* hPeriph, void* pData, PMDparam offset, PMDparam length)
{
    PMDuint16 DIOstate;
    PMDint32 StatusCode;
    PMDint32 ReadData;

#ifdef WINDOWS
    PMDSPI_IOData* SPItransport_data = (PMDSPI_IOData*)hPeriph->transport_data;
    PMDuint16 DIOstate;
    PMDint32 StatusCode;
    PMDuint8 PortNumber = 0;
    PMDuint8 LineNumber = 0;
    PMDint32 ReadData;
    
    NI_RESULT(StatusCode,
              ni845xDioReadLine (SPItransport_data->DeviceHandle,
                                 PortNumber,
                                 LineNumber,
                                 &ReadData ));
#else
    ReadData=GetHostSPIStatus(hPeriph);
    StatusCode=0;
#endif    

    
    DIOstate = (PMDuint16)ReadData;
    *(PMDuint16*)pData = DIOstate;
    
    return (StatusCode == 0) ? PMD_ERR_OK : PMD_ERR_PortRead;
}

/*  
Sending a MC58113 command
word    Host                        MC58113
------------------------------------------------------
        Assert ~HostSPIEnable   
1       8b axis 8b opcode           0
2       8b rsv  8b checksum         0
3       16b argument 1 (optional)   0
4       16b argument 2 (optional)   0
5       16b argument 3 (optional)   0
        De-assert ~HostSPIEnable    

        wait for HostSPIReady signal

Receiving a response
word    Host                        MC58113
------------------------------------------------------
        Assert ~HostSPIEnable   
1       0                           8b checksum  8b command status
2       0                           16b response 1 (optional)
3       0                           16b response 2 (optional)
4       0                           16b response 3 (optional)
        De-assert ~HostSPIEnable    
*/

#define MP_TIMEOUT         100


//********************************************************
PMDresult PMDPSPI_SendReceive(PMDPeriphHandle* hPeriph, PMDuint8 *WriteData, PMDparam nCount, PMDuint8 *ReadData)
{
    PMDSPI_IOData* SPItransport_data = (PMDSPI_IOData*)hPeriph->transport_data;
    PMDint32 StatusCode;
    PMDuint32 WriteSize = nCount;
    PMDuint32 ReadSize;
    PMDuint8 outbuf[TOTAL_PACKET_LENGTH];
    PMDuint8 inbuf[TOTAL_PACKET_LENGTH];
    PMDuint32 i;
    
    PMD_PERIPHCONNECTED(hPeriph)

    if (SPItransport_data->NumBitsPerSample == 16 && WriteSize % 2)
        WriteSize++;
    if (WriteSize > MAX_PACKET_DATA_LENGTH)
        return PMD_ERR_CommandError;

#ifdef WINDOWS
    if (SPItransport_data->bVerbose > 0) {
        Printf("TX:");
        for (i = 0; i < WriteSize; i++)
            Printf(" %02X", WriteData[i]);
        Printf("\n");
    }
#endif

    if (SPItransport_data->bByteSwap)
    {
        for (i = 0; i < nCount; i+=2)
        {
            outbuf[i] = (PMDuint8)(WriteData[i+1]);
            outbuf[i + 1] = (PMDuint8) (WriteData[i]);
        }
    }
    else
        memcpy(outbuf, WriteData, nCount);

//  NI_RESULT( ni845xDeviceLock( DeviceHandle ));
    // send words
#ifdef WINDOWS
    if (SPItransport_data->bUseScript)  //SCRIPT_MODE is faster but cannot WaitUntilReady 
    {
        uInt32 ScriptRead;

        NI_RESULT(StatusCode,
                  ni845xSpiScriptReset(SPItransport_data->ScriptHandle) );
        NI_RESULT(StatusCode,
                  ni845xSpiScriptClockPolarityPhase (SPItransport_data->ScriptHandle,
                                                     SPItransport_data->ClockPolarity,
                                                     SPItransport_data->ClockPhase) );
        NI_RESULT(StatusCode,
                  ni845xSpiScriptClockRate (SPItransport_data->ScriptHandle,
                                            SPItransport_data->ClockRate) );
        NI_RESULT(StatusCode,
                  ni845xSpiScriptNumBitsPerSample (SPItransport_data->ScriptHandle,
                                                   SPItransport_data->NumBitsPerSample) );
        
        NI_RESULT(StatusCode,
                  ni845xSpiScriptEnableSPI(SPItransport_data->ScriptHandle) );
        NI_RESULT(StatusCode,
                  ni845xSpiScriptCSLow(SPItransport_data->ScriptHandle, 0) );
        NI_RESULT(StatusCode,
                  ni845xSpiScriptWriteRead( SPItransport_data->ScriptHandle,
                                            WriteSize,
                                            outbuf,
                                            &ScriptRead ));
        NI_RESULT(StatusCode,
                  ni845xSpiScriptCSHigh(SPItransport_data->ScriptHandle, 0) );

        // script does not support waiting on a DIO so just delay the
        // max amount of time to process a command

        NI_RESULT(StatusCode,
                  ni845xSpiScriptUsDelay(SPItransport_data->ScriptHandle,
                                         (uInt16)SPItransport_data->Timeout) );

        NI_RESULT(StatusCode,
                  ni845xSpiScriptCSLow(SPItransport_data->ScriptHandle, 0) );


        NI_RESULT(StatusCode,
                  ni845xSpiScriptRun(SPItransport_data->ScriptHandle,
                                     SPItransport_data->DeviceHandle,
                                     0) );
        NI_RESULT(StatusCode,
                  ni845xSpiScriptExtractReadDataSize(SPItransport_data->ScriptHandle,
                                                     ScriptRead,
                                                     &ReadSize) );
        NI_RESULT(StatusCode,
                  ni845xSpiScriptExtractReadData(SPItransport_data->ScriptHandle,
                                                 ScriptRead,
                                                 inbuf) );
    }
    else
    {
/*
        NI_RESULT(StatusCode,
                  ni845xSpiConfigurationSetClockRate(SPItransport_data->ConfigurationHandle,
                                                     SPItransport_data->ClockRate ));
        // NI will lower the specified clock rate to the closest supported clock rate.
        // This call is to see what it is.
        NI_RESULT(StatusCode,
                  ni845xSpiConfigurationGetClockRate(SPItransport_data->ConfigurationHandle,
                                                     &SPItransport_data->ClockRate ));
        NI_RESULT(StatusCode,
                  ni845xSpiConfigurationSetClockPolarity(SPItransport_data->ConfigurationHandle,
                                                         SPItransport_data->ClockPolarity ));
        NI_RESULT(StatusCode,
                  ni845xSpiConfigurationSetClockPhase(SPItransport_data->ConfigurationHandle,
                                                      SPItransport_data->ClockPhase ));
*/
        // Data provided in pWriteData and retrieved using pReadData is organized in big endian format.
        NI_RESULT(StatusCode,
                  ni845xSpiWriteRead(SPItransport_data->DeviceHandle, 
                                     SPItransport_data->ConfigurationHandle,
                                     WriteSize,
                                     outbuf,
                                     &ReadSize,
                                     inbuf ));
    }
#else
    StatusCode=PMDSPI_WriteWords(SPItransport_data->DeviceHandle, (PMDuint16 *) outbuf, nCount/2, (PMDuint16 *)inbuf);
    ReadSize=WriteSize;
#endif

//  NI_RESULT( ni845xDeviceUnlock( DeviceHandle ));
    if (0==StatusCode && ReadData)
    {
        if (SPItransport_data->NumBitsPerSample == 16)
        {
            assert(ReadSize % 2 == 0);
        }
        if (SPItransport_data->bByteSwap)
        {
            for (i = 0; i < ReadSize; i+=2)
            {
                ReadData[i] = (PMDuint8)(inbuf[i+1]);
                ReadData[i + 1] = (PMDuint8) (inbuf[i]);
            }
        }
        else 
            memcpy(ReadData, inbuf, ReadSize);

#ifdef WINDOWS
        if (SPItransport_data->bVerbose > 0) {
            Printf("RX:");
            for (i = 0; i < WriteSize; i++)
                Printf(" %02X", ReadData[i]);
            Printf("\n");
        }
#endif        
    }
    return (StatusCode == 0) ? PMD_ERR_OK : PMD_ERR_PortWrite;
}

//********************************************************
PMDresult PMDPSPI_Send(PMDPeriphHandle* hPeriph, const void *data, PMDparam nCount, PMDparam timeoutms)
{
    PMDSPI_IOData* SPItransport_data = (PMDSPI_IOData*)hPeriph->transport_data;
    return PMDPSPI_SendReceive(hPeriph, (PMDuint8*)data, nCount, SPItransport_data->ReadData);
}

//********************************************************
PMDresult PMDPSPI_Receive(PMDPeriphHandle* hPeriph, void *data, PMDparam nExpected, PMDparam *pnReceived, PMDparam timeoutms)
{
    PMDSPI_IOData* SPItransport_data = (PMDSPI_IOData*)hPeriph->transport_data;
    PMD_PERIPHCONNECTED(hPeriph)

    if (nExpected >= TOTAL_PACKET_LENGTH)
        return PMD_ERR_InvalidParameter;

     memcpy(data, SPItransport_data->ReadData, nExpected);
    *pnReceived = nExpected;

    return PMD_ERR_OK;
}

long PMDPSPI_SetTimeout(void *transport_data, long msec)
{
     long PreviousTimeout;

     PMDSPI_IOData* pSPItransport_data = (PMDSPI_IOData *)transport_data;
     PreviousTimeout = pSPItransport_data->Timeout;
     pSPItransport_data->Timeout = msec;
     return PreviousTimeout;
}

// Call into NI library to find and initialize the external device.
PMDresult PMDPSPI_InitPort(PMDPeriphHandle* hPeriph, PMDuint8 device, PMDuint8 chipselect, PMDuint8 mode, PMDuint8 datasize, PMDparam BitRateHz)
    
{
    PMDSPI_IOData* transport_data = (PMDSPI_IOData*) hPeriph->transport_data;
  
#ifdef WINDOWS
    PMDint32 StatusCode;
    NiHandle FindDeviceHandle;
    PMDuint32   NumberFound;
    int idev = 1;
    transport_data->bUseScript = FALSE;
    transport_data->bUseHostStatus = TRUE;
#else
    int dummy;
#endif
    
    transport_data->Timeout = 500;
    transport_data->NumBitsPerSample = datasize;
    transport_data->ClockPhase = !((mode >> 0) & 1); // SPImode is same as Magellan which is a non-standard TI SPI mode with CLKPhase inverted.
    transport_data->ClockPhaseRead = transport_data->ClockPhase;
    transport_data->ClockPolarity = (mode >> 1) & 1; //kNi845xSpiClockPolarityIdleLow;
    transport_data->ClockRate = (PMDuint16) (BitRateHz / 1000);
    transport_data->ChipSelect = chipselect;
    transport_data->ResourceName[0] = 0;
    transport_data->bVerbose = 0;
    transport_data->bByteSwap = (datasize == 16); //A datasize value of 16 tells PMDspi.c to byte swap which is required with the NI SPI adapter.

#ifdef WINDOWS
    StatusCode = ni845xFindDevice ( transport_data->ResourceName, &FindDeviceHandle, &NumberFound );

    Printf("Found %d devices\n", NumberFound);
    Printf("  Device %d: \"%s\"\n", idev, transport_data->ResourceName);
    if (device > (int)NumberFound)
    {
         Printf("no such device %d\n", device);
         return PMD_ERR_OpeningPort;
    }
    /*
      Searches down the list of available devices, device=1 gives the first,
      device=2 the second, and so forth.
    */
    while (idev < device) {
         StatusCode = ni845xFindDeviceNext (FindDeviceHandle, transport_data->ResourceName);
         Printf("  Device %d: \"%s\"\n", idev, transport_data->ResourceName);
         idev++;
    }

    if (StatusCode == 0)
    {
        StatusCode = ni845xOpen( transport_data->ResourceName, &transport_data->DeviceHandle );

        if (StatusCode == 0)
        {
            hPeriph->handle = (void*)transport_data->DeviceHandle;
        }

        // minimum is 1000ms, default is 30000
        NI_RESULT(StatusCode,
                  ni845xSetTimeout( transport_data->DeviceHandle, 1000));
        
        NI_RESULT(StatusCode,
                  ni845xSpiConfigurationOpen( &transport_data->ConfigurationHandle ));
        // The default value for the chip select is 0. We reserve 0 for no chipselect
        if (transport_data->ChipSelect > 0)
            NI_RESULT(StatusCode,
                  ni845xSpiConfigurationSetChipSelect( transport_data->ConfigurationHandle,
                                                       transport_data->ChipSelect-1 ));
        NI_RESULT(StatusCode,
                  ni845xSpiConfigurationSetClockRate( transport_data->ConfigurationHandle,
                                                      transport_data->ClockRate ));
        // NI will lower the specified clock rate to the closest supported clock rate.
        NI_RESULT(StatusCode,
                  ni845xSpiConfigurationGetClockRate(transport_data->ConfigurationHandle,
                                                     &transport_data->ClockRate ));
        NI_RESULT(StatusCode,
                  ni845xSpiConfigurationSetClockPolarity( transport_data->ConfigurationHandle,
                                                          transport_data->ClockPolarity ));
        NI_RESULT(StatusCode,
                  ni845xSpiConfigurationSetClockPhase( transport_data->ConfigurationHandle,
                                                       transport_data->ClockPhase ));
        NI_RESULT(StatusCode,
                  ni845xSpiConfigurationSetNumBitsPerSample( transport_data->ConfigurationHandle,
                                                             transport_data->NumBitsPerSample ));
        /*
        NI_RESULT(StatusCode, ni845xSpiConfigurationSetPort( transport_data->ConfigurationHandle,
                                                             transport_data->PortNumber ));
        */

        if (transport_data->bUseScript)  //SCRIPT_MODE
        {
            NI_RESULT(StatusCode,
                      ni845xSpiScriptOpen(&transport_data->ScriptHandle) );
            NI_RESULT(StatusCode,
                      ni845xSpiScriptReset(transport_data->ScriptHandle) );
            NI_RESULT(StatusCode,
                      ni845xSpiScriptClockPolarityPhase (transport_data->ScriptHandle,
                                                         transport_data->ClockPolarity,
                                                         transport_data->ClockPhase) );
            NI_RESULT(StatusCode,
                      ni845xSpiScriptClockRate (transport_data->ScriptHandle,
                                                transport_data->ClockRate) );
            NI_RESULT(StatusCode,
                      ni845xSpiScriptNumBitsPerSample (transport_data->ScriptHandle,
                                                       transport_data->NumBitsPerSample) );
        }
    }

    if (StatusCode) 
    { 
        char StatusString[STRING_SIZE]; 
        ni845xStatusToString(StatusCode, STRING_SIZE, StatusString);
        Printf("Error: %s\n", StatusString);
        return PMD_ERR_OpeningPort;
    }
#else
    // Beginning of PIC32 specific SPI initialization   
  
        
    IEC0CLR=0x03800000;    // disable all interrupts
    SPI1CON = 0;           // Stops and resets the SPI1. 
    dummy=SPI1BUF;         // clears the receive buffer
    IFS0CLR=0x03800000;    // clear any existing event
    IPC5CLR=0x1f000000;    // clear the priority
    IPC5SET=0x0d000000;    // Set IPL=3, Subpriority 1
    IEC0SET=0x03800000;    // Enable RX, TX and Error interrupts
    
    SPLLCONSET=0x027f0787;
    PB2DIV=1;
    //Oscillator.
     
   // SPI1BRG=1000/transport_data->ClockRate;
    SPI1BRG=8;
    // use FPB/4 clock frequency
    SPI1STATCLR=0x40;      // clear the Overflow
    
    // using RB10 for HostSPIStatus
    ANSELB&=0xFBFF;
    
    // Deassert HostSPIEnable (RPD9)  
    PORTD|=0x0010;
        
    //SS1/RPD9 and SDO1/RPD3 are outputs
    TRISD&=0xFD77;
    
    RPD7R=5;    // specify function of RPD7 as SDO1
    
    ANSELD&=0xBDFF;
    SDI1R=0xB;  // specify SDI1 mapping to RPD14 
     
    SPI1CON=0x8620;        // SPI ON, 16 bits transfer, SMP=1, Master mode
    // from now on, the device is ready to transmit and receive data
   
   // init output used for debugging  PA1
    ANSELA&=0xFFFD;
    TRISA&=0xFFFD;
    PORTA&=0xFFFD;   //set PA1 low
    
#endif
    return PMD_ERR_OK;
}

//********************************************************
static void PMDPSPI_Init(PMDPeriphHandle* hPeriph)
{
    hPeriph->transport.Close    = PMDPSPI_Close;
    hPeriph->transport.Send     = PMDPSPI_Send;
    hPeriph->transport.Receive  = PMDPSPI_Receive;
    hPeriph->transport.Read     = PMDPSPI_Read; // used for reading digital input pins to get HostSPIStatus state
    hPeriph->transport.Write    = NULL;
    hPeriph->transport.ReceiveEvent = NULL;
}

//********************************************************
/* NI supported clock rates:
25 kHz, 32 kHz, 40 kHz, 50 kHz, 80 kHz, 100 kHz, 125 kHz, 160 kHz, 200 kHz, 250 kHz, 400 kHz, 500 kHz, 625 kHz, 800 kHz, 
1 MHz, 1.25 MHz, 2.5 MHz, 3.125 MHz, 4 MHz, 5 MHz, 6.25 MHz, 10 MHz, 12.5 MHz, 20 MHz, 25 MHz, 33.33 MHz, 50 MHz
*/

PMDresult PMDPSPI_Open (PMDPeriphHandle* hPeriph, PMDuint8 port, PMDuint8 chipselect, PMDuint8 mode, PMDuint8 datasize, PMDparam bitrate)
{
    PMDresult result = PMD_NOERROR;
    PMDSPI_IOData* SPItransport_data;
    PMDparam BitRateHz;

    SPItransport_data = (PMDSPI_IOData*) malloc( sizeof( PMDSPI_IOData ) );
    memset(SPItransport_data, 0, sizeof(PMDSPI_IOData));

    // set the interface type 
    hPeriph->type = InterfaceSPI;
    hPeriph->transport_data = SPItransport_data;
    hPeriph->address = 0;
    hPeriph->handle = PMD_INVALID_HANDLE;


    BitRateHz = bitrate;
    if (bitrate < 10) // if bitrate is specified as an enum/divisor
        BitRateHz = 40000000 >> bitrate;
    PMDPSPI_Init(hPeriph);
    result = PMDPSPI_InitPort(hPeriph, port, chipselect, mode, datasize, BitRateHz);

    if (result == PMD_NOERROR)
    {
        hPeriph->handle = PMD_CONNECTED_HANDLE; // set the periph handle as connected
        hPeriph->param = 1; // HostSPIStatus digital input number on the NI (1=DIO0)
    }


    return result;
}

