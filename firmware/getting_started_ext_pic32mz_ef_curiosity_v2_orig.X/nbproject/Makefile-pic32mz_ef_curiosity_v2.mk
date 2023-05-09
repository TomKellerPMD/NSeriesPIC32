#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-pic32mz_ef_curiosity_v2.mk)" "nbproject/Makefile-local-pic32mz_ef_curiosity_v2.mk"
include nbproject/Makefile-local-pic32mz_ef_curiosity_v2.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=pic32mz_ef_curiosity_v2
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/getting_started_ext_pic32mz_ef_curiosity_v2_orig.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/getting_started_ext_pic32mz_ef_curiosity_v2_orig.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/C-Motion/C/C-Motion.c ../src/C-Motion/C/Examples.c ../src/C-Motion/C/PMDcommon.c ../src/C-Motion/C/PMDdiag.c ../src/C-Motion/C/PMDopen.c ../src/C-Motion/C/PMDPspi.c ../src/C-Motion/C/PMDsys.c ../src/C-Motion/C/PMDtrans.c ../src/C-Motion/C/PMDutil.c ../src/C-Motion/C/PMDRPdevice.cpp ../src/C-Motion/C/PMDRP.cpp ../src/C-Motion/C/PMDRPperiph.cpp ../src/Pro-MotionExport.c ../src/config/pic32mz_ef_curiosity_v2/peripheral/cache/plib_cache.c ../src/config/pic32mz_ef_curiosity_v2/peripheral/cache/plib_cache_pic32mz.S ../src/config/pic32mz_ef_curiosity_v2/peripheral/clk/plib_clk.c ../src/config/pic32mz_ef_curiosity_v2/peripheral/dmac/plib_dmac.c ../src/config/pic32mz_ef_curiosity_v2/peripheral/evic/plib_evic.c ../src/config/pic32mz_ef_curiosity_v2/peripheral/gpio/plib_gpio.c ../src/config/pic32mz_ef_curiosity_v2/peripheral/i2c/master/plib_i2c1_master.c ../src/config/pic32mz_ef_curiosity_v2/peripheral/tmr1/plib_tmr1.c ../src/config/pic32mz_ef_curiosity_v2/peripheral/tmr4/plib_tmr4.c ../src/config/pic32mz_ef_curiosity_v2/peripheral/uart/plib_uart6.c ../src/config/pic32mz_ef_curiosity_v2/stdio/xc32_monitor.c ../src/config/pic32mz_ef_curiosity_v2/interrupts.c ../src/main_pic32mz.c ../src/DBPrint.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/2087367630/C-Motion.o ${OBJECTDIR}/_ext/2087367630/Examples.o ${OBJECTDIR}/_ext/2087367630/PMDcommon.o ${OBJECTDIR}/_ext/2087367630/PMDdiag.o ${OBJECTDIR}/_ext/2087367630/PMDopen.o ${OBJECTDIR}/_ext/2087367630/PMDPspi.o ${OBJECTDIR}/_ext/2087367630/PMDsys.o ${OBJECTDIR}/_ext/2087367630/PMDtrans.o ${OBJECTDIR}/_ext/2087367630/PMDutil.o ${OBJECTDIR}/_ext/2087367630/PMDRPdevice.o ${OBJECTDIR}/_ext/2087367630/PMDRP.o ${OBJECTDIR}/_ext/2087367630/PMDRPperiph.o ${OBJECTDIR}/_ext/1360937237/Pro-MotionExport.o ${OBJECTDIR}/_ext/1520887106/plib_cache.o ${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o ${OBJECTDIR}/_ext/412755682/plib_clk.o ${OBJECTDIR}/_ext/89445205/plib_dmac.o ${OBJECTDIR}/_ext/89406517/plib_evic.o ${OBJECTDIR}/_ext/89352689/plib_gpio.o ${OBJECTDIR}/_ext/1620630455/plib_i2c1_master.o ${OBJECTDIR}/_ext/88968072/plib_tmr1.o ${OBJECTDIR}/_ext/88968069/plib_tmr4.o ${OBJECTDIR}/_ext/88949746/plib_uart6.o ${OBJECTDIR}/_ext/586341290/xc32_monitor.o ${OBJECTDIR}/_ext/969001572/interrupts.o ${OBJECTDIR}/_ext/1360937237/main_pic32mz.o ${OBJECTDIR}/_ext/1360937237/DBPrint.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/2087367630/C-Motion.o.d ${OBJECTDIR}/_ext/2087367630/Examples.o.d ${OBJECTDIR}/_ext/2087367630/PMDcommon.o.d ${OBJECTDIR}/_ext/2087367630/PMDdiag.o.d ${OBJECTDIR}/_ext/2087367630/PMDopen.o.d ${OBJECTDIR}/_ext/2087367630/PMDPspi.o.d ${OBJECTDIR}/_ext/2087367630/PMDsys.o.d ${OBJECTDIR}/_ext/2087367630/PMDtrans.o.d ${OBJECTDIR}/_ext/2087367630/PMDutil.o.d ${OBJECTDIR}/_ext/2087367630/PMDRPdevice.o.d ${OBJECTDIR}/_ext/2087367630/PMDRP.o.d ${OBJECTDIR}/_ext/2087367630/PMDRPperiph.o.d ${OBJECTDIR}/_ext/1360937237/Pro-MotionExport.o.d ${OBJECTDIR}/_ext/1520887106/plib_cache.o.d ${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o.d ${OBJECTDIR}/_ext/412755682/plib_clk.o.d ${OBJECTDIR}/_ext/89445205/plib_dmac.o.d ${OBJECTDIR}/_ext/89406517/plib_evic.o.d ${OBJECTDIR}/_ext/89352689/plib_gpio.o.d ${OBJECTDIR}/_ext/1620630455/plib_i2c1_master.o.d ${OBJECTDIR}/_ext/88968072/plib_tmr1.o.d ${OBJECTDIR}/_ext/88968069/plib_tmr4.o.d ${OBJECTDIR}/_ext/88949746/plib_uart6.o.d ${OBJECTDIR}/_ext/586341290/xc32_monitor.o.d ${OBJECTDIR}/_ext/969001572/interrupts.o.d ${OBJECTDIR}/_ext/1360937237/main_pic32mz.o.d ${OBJECTDIR}/_ext/1360937237/DBPrint.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/2087367630/C-Motion.o ${OBJECTDIR}/_ext/2087367630/Examples.o ${OBJECTDIR}/_ext/2087367630/PMDcommon.o ${OBJECTDIR}/_ext/2087367630/PMDdiag.o ${OBJECTDIR}/_ext/2087367630/PMDopen.o ${OBJECTDIR}/_ext/2087367630/PMDPspi.o ${OBJECTDIR}/_ext/2087367630/PMDsys.o ${OBJECTDIR}/_ext/2087367630/PMDtrans.o ${OBJECTDIR}/_ext/2087367630/PMDutil.o ${OBJECTDIR}/_ext/2087367630/PMDRPdevice.o ${OBJECTDIR}/_ext/2087367630/PMDRP.o ${OBJECTDIR}/_ext/2087367630/PMDRPperiph.o ${OBJECTDIR}/_ext/1360937237/Pro-MotionExport.o ${OBJECTDIR}/_ext/1520887106/plib_cache.o ${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o ${OBJECTDIR}/_ext/412755682/plib_clk.o ${OBJECTDIR}/_ext/89445205/plib_dmac.o ${OBJECTDIR}/_ext/89406517/plib_evic.o ${OBJECTDIR}/_ext/89352689/plib_gpio.o ${OBJECTDIR}/_ext/1620630455/plib_i2c1_master.o ${OBJECTDIR}/_ext/88968072/plib_tmr1.o ${OBJECTDIR}/_ext/88968069/plib_tmr4.o ${OBJECTDIR}/_ext/88949746/plib_uart6.o ${OBJECTDIR}/_ext/586341290/xc32_monitor.o ${OBJECTDIR}/_ext/969001572/interrupts.o ${OBJECTDIR}/_ext/1360937237/main_pic32mz.o ${OBJECTDIR}/_ext/1360937237/DBPrint.o

# Source Files
SOURCEFILES=../src/C-Motion/C/C-Motion.c ../src/C-Motion/C/Examples.c ../src/C-Motion/C/PMDcommon.c ../src/C-Motion/C/PMDdiag.c ../src/C-Motion/C/PMDopen.c ../src/C-Motion/C/PMDPspi.c ../src/C-Motion/C/PMDsys.c ../src/C-Motion/C/PMDtrans.c ../src/C-Motion/C/PMDutil.c ../src/C-Motion/C/PMDRPdevice.cpp ../src/C-Motion/C/PMDRP.cpp ../src/C-Motion/C/PMDRPperiph.cpp ../src/Pro-MotionExport.c ../src/config/pic32mz_ef_curiosity_v2/peripheral/cache/plib_cache.c ../src/config/pic32mz_ef_curiosity_v2/peripheral/cache/plib_cache_pic32mz.S ../src/config/pic32mz_ef_curiosity_v2/peripheral/clk/plib_clk.c ../src/config/pic32mz_ef_curiosity_v2/peripheral/dmac/plib_dmac.c ../src/config/pic32mz_ef_curiosity_v2/peripheral/evic/plib_evic.c ../src/config/pic32mz_ef_curiosity_v2/peripheral/gpio/plib_gpio.c ../src/config/pic32mz_ef_curiosity_v2/peripheral/i2c/master/plib_i2c1_master.c ../src/config/pic32mz_ef_curiosity_v2/peripheral/tmr1/plib_tmr1.c ../src/config/pic32mz_ef_curiosity_v2/peripheral/tmr4/plib_tmr4.c ../src/config/pic32mz_ef_curiosity_v2/peripheral/uart/plib_uart6.c ../src/config/pic32mz_ef_curiosity_v2/stdio/xc32_monitor.c ../src/config/pic32mz_ef_curiosity_v2/interrupts.c ../src/main_pic32mz.c ../src/DBPrint.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

# The following macros may be used in the pre and post step lines
_/_=\\
ShExtension=.bat
Device=PIC32MZ2048EFM144
ProjectDir="D:\MicroChip\N-Series\firmware\getting_started_ext_pic32mz_ef_curiosity_v2_orig.X"
ProjectName=N-series
ConfName=pic32mz_ef_curiosity_v2
ImagePath="${DISTDIR}\getting_started_ext_pic32mz_ef_curiosity_v2_orig.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="${DISTDIR}"
ImageName="getting_started_ext_pic32mz_ef_curiosity_v2_orig.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-pic32mz_ef_curiosity_v2.mk ${DISTDIR}/getting_started_ext_pic32mz_ef_curiosity_v2_orig.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
	@echo "--------------------------------------"
	@echo "User defined post-build step: [rm -rf ${ProjectDir}/../../hex && mkdir ${ProjectDir}/../../hex && cp ${ProjectDir}/${ImagePath} ${ProjectDir}/../../hex/]"
	@rm -rf ${ProjectDir}/../../hex && mkdir ${ProjectDir}/../../hex && cp ${ProjectDir}/${ImagePath} ${ProjectDir}/../../hex/
	@echo "--------------------------------------"

MP_PROCESSOR_OPTION=32MZ2048EFM144
MP_LINKER_FILE_OPTION=,--script="..\src\config\pic32mz_ef_curiosity_v2\p32MZ2048EFM144.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o: ../src/config/pic32mz_ef_curiosity_v2/peripheral/cache/plib_cache_pic32mz.S  .generated_files/flags/pic32mz_ef_curiosity_v2/4754a7bb2ede2f50d0ee95fedf1c4a3d37be1133 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/1520887106" 
	@${RM} ${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o 
	@${RM} ${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o.ok ${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o.err 
	${MP_CPPC} $(MP_EXTRA_AS_PRE)  -D__DEBUG  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o.d"  -o ${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o ../src/config/pic32mz_ef_curiosity_v2/peripheral/cache/plib_cache_pic32mz.S  -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,-I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o.d" "${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o: ../src/config/pic32mz_ef_curiosity_v2/peripheral/cache/plib_cache_pic32mz.S  .generated_files/flags/pic32mz_ef_curiosity_v2/8484c94c9e494f0313fa1fe92f3aa9646a0c112a .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/1520887106" 
	@${RM} ${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o 
	@${RM} ${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o.ok ${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o.err 
	${MP_CPPC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o.d"  -o ${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o ../src/config/pic32mz_ef_curiosity_v2/peripheral/cache/plib_cache_pic32mz.S  -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o.asm.d",--gdwarf-2,-I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o.d" "${OBJECTDIR}/_ext/1520887106/plib_cache_pic32mz.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/2087367630/C-Motion.o: ../src/C-Motion/C/C-Motion.c  .generated_files/flags/pic32mz_ef_curiosity_v2/e05130c9daaa157624d527b9ecc6a11cb669eb32 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/C-Motion.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/C-Motion.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/C-Motion.o.d" -o ${OBJECTDIR}/_ext/2087367630/C-Motion.o ../src/C-Motion/C/C-Motion.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087367630/Examples.o: ../src/C-Motion/C/Examples.c  .generated_files/flags/pic32mz_ef_curiosity_v2/b7a041332f6294106a3871daec4c4e21d3384715 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/Examples.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/Examples.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/Examples.o.d" -o ${OBJECTDIR}/_ext/2087367630/Examples.o ../src/C-Motion/C/Examples.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087367630/PMDcommon.o: ../src/C-Motion/C/PMDcommon.c  .generated_files/flags/pic32mz_ef_curiosity_v2/ee5f00da8dc0ce040794cfdf652f1ae6d38c2c6b .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDcommon.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDcommon.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/PMDcommon.o.d" -o ${OBJECTDIR}/_ext/2087367630/PMDcommon.o ../src/C-Motion/C/PMDcommon.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087367630/PMDdiag.o: ../src/C-Motion/C/PMDdiag.c  .generated_files/flags/pic32mz_ef_curiosity_v2/5cfbe2c6bb6caa4f48740a58e72b045fea5a30d1 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDdiag.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDdiag.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/PMDdiag.o.d" -o ${OBJECTDIR}/_ext/2087367630/PMDdiag.o ../src/C-Motion/C/PMDdiag.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087367630/PMDopen.o: ../src/C-Motion/C/PMDopen.c  .generated_files/flags/pic32mz_ef_curiosity_v2/c9bda54c18d7f6b5222326ce66fc11f181632ea5 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDopen.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDopen.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/PMDopen.o.d" -o ${OBJECTDIR}/_ext/2087367630/PMDopen.o ../src/C-Motion/C/PMDopen.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087367630/PMDPspi.o: ../src/C-Motion/C/PMDPspi.c  .generated_files/flags/pic32mz_ef_curiosity_v2/afb0708ca376936fee83854a3db266110c505ace .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDPspi.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDPspi.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/PMDPspi.o.d" -o ${OBJECTDIR}/_ext/2087367630/PMDPspi.o ../src/C-Motion/C/PMDPspi.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087367630/PMDsys.o: ../src/C-Motion/C/PMDsys.c  .generated_files/flags/pic32mz_ef_curiosity_v2/d12ffe138ae61d7841b62ed833bd22530775d41d .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDsys.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/PMDsys.o.d" -o ${OBJECTDIR}/_ext/2087367630/PMDsys.o ../src/C-Motion/C/PMDsys.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087367630/PMDtrans.o: ../src/C-Motion/C/PMDtrans.c  .generated_files/flags/pic32mz_ef_curiosity_v2/32d3272eea1202c097661ce2319379e6e0bbe621 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDtrans.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDtrans.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/PMDtrans.o.d" -o ${OBJECTDIR}/_ext/2087367630/PMDtrans.o ../src/C-Motion/C/PMDtrans.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087367630/PMDutil.o: ../src/C-Motion/C/PMDutil.c  .generated_files/flags/pic32mz_ef_curiosity_v2/c4fbf4bfa6076c2c3dd9977f8cb79e72a4f7affa .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDutil.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDutil.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/PMDutil.o.d" -o ${OBJECTDIR}/_ext/2087367630/PMDutil.o ../src/C-Motion/C/PMDutil.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/Pro-MotionExport.o: ../src/Pro-MotionExport.c  .generated_files/flags/pic32mz_ef_curiosity_v2/cd9d3cd83f903e704290ad616b2e46eb692cc181 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Pro-MotionExport.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Pro-MotionExport.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Pro-MotionExport.o.d" -o ${OBJECTDIR}/_ext/1360937237/Pro-MotionExport.o ../src/Pro-MotionExport.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1520887106/plib_cache.o: ../src/config/pic32mz_ef_curiosity_v2/peripheral/cache/plib_cache.c  .generated_files/flags/pic32mz_ef_curiosity_v2/346d79dc93e782dd499a5b16c41c34e7a4ee98f4 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/1520887106" 
	@${RM} ${OBJECTDIR}/_ext/1520887106/plib_cache.o.d 
	@${RM} ${OBJECTDIR}/_ext/1520887106/plib_cache.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1520887106/plib_cache.o.d" -o ${OBJECTDIR}/_ext/1520887106/plib_cache.o ../src/config/pic32mz_ef_curiosity_v2/peripheral/cache/plib_cache.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/412755682/plib_clk.o: ../src/config/pic32mz_ef_curiosity_v2/peripheral/clk/plib_clk.c  .generated_files/flags/pic32mz_ef_curiosity_v2/77af74efb76737fdcd589da4b4773d0f5d6db615 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/412755682" 
	@${RM} ${OBJECTDIR}/_ext/412755682/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/412755682/plib_clk.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/412755682/plib_clk.o.d" -o ${OBJECTDIR}/_ext/412755682/plib_clk.o ../src/config/pic32mz_ef_curiosity_v2/peripheral/clk/plib_clk.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/89445205/plib_dmac.o: ../src/config/pic32mz_ef_curiosity_v2/peripheral/dmac/plib_dmac.c  .generated_files/flags/pic32mz_ef_curiosity_v2/62fdd04abc800b8a23b09efbfb8f4d8053faa13f .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/89445205" 
	@${RM} ${OBJECTDIR}/_ext/89445205/plib_dmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/89445205/plib_dmac.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/89445205/plib_dmac.o.d" -o ${OBJECTDIR}/_ext/89445205/plib_dmac.o ../src/config/pic32mz_ef_curiosity_v2/peripheral/dmac/plib_dmac.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/89406517/plib_evic.o: ../src/config/pic32mz_ef_curiosity_v2/peripheral/evic/plib_evic.c  .generated_files/flags/pic32mz_ef_curiosity_v2/bc1676538e99f07e34bca0dd274497f32c0be90 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/89406517" 
	@${RM} ${OBJECTDIR}/_ext/89406517/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/89406517/plib_evic.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/89406517/plib_evic.o.d" -o ${OBJECTDIR}/_ext/89406517/plib_evic.o ../src/config/pic32mz_ef_curiosity_v2/peripheral/evic/plib_evic.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/89352689/plib_gpio.o: ../src/config/pic32mz_ef_curiosity_v2/peripheral/gpio/plib_gpio.c  .generated_files/flags/pic32mz_ef_curiosity_v2/4f39b3fbc949212612102525bb6861f7f03bf92c .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/89352689" 
	@${RM} ${OBJECTDIR}/_ext/89352689/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/89352689/plib_gpio.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/89352689/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/89352689/plib_gpio.o ../src/config/pic32mz_ef_curiosity_v2/peripheral/gpio/plib_gpio.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1620630455/plib_i2c1_master.o: ../src/config/pic32mz_ef_curiosity_v2/peripheral/i2c/master/plib_i2c1_master.c  .generated_files/flags/pic32mz_ef_curiosity_v2/737a0ca41c46883e6e86f4ef01bb42d604a8745c .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/1620630455" 
	@${RM} ${OBJECTDIR}/_ext/1620630455/plib_i2c1_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/1620630455/plib_i2c1_master.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1620630455/plib_i2c1_master.o.d" -o ${OBJECTDIR}/_ext/1620630455/plib_i2c1_master.o ../src/config/pic32mz_ef_curiosity_v2/peripheral/i2c/master/plib_i2c1_master.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/88968072/plib_tmr1.o: ../src/config/pic32mz_ef_curiosity_v2/peripheral/tmr1/plib_tmr1.c  .generated_files/flags/pic32mz_ef_curiosity_v2/278d3e4a689ba5782a4e656c0ca48678e1a4157b .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/88968072" 
	@${RM} ${OBJECTDIR}/_ext/88968072/plib_tmr1.o.d 
	@${RM} ${OBJECTDIR}/_ext/88968072/plib_tmr1.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/88968072/plib_tmr1.o.d" -o ${OBJECTDIR}/_ext/88968072/plib_tmr1.o ../src/config/pic32mz_ef_curiosity_v2/peripheral/tmr1/plib_tmr1.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/88968069/plib_tmr4.o: ../src/config/pic32mz_ef_curiosity_v2/peripheral/tmr4/plib_tmr4.c  .generated_files/flags/pic32mz_ef_curiosity_v2/8eeb76c915f33204b84b84d68067939d56008ebc .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/88968069" 
	@${RM} ${OBJECTDIR}/_ext/88968069/plib_tmr4.o.d 
	@${RM} ${OBJECTDIR}/_ext/88968069/plib_tmr4.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/88968069/plib_tmr4.o.d" -o ${OBJECTDIR}/_ext/88968069/plib_tmr4.o ../src/config/pic32mz_ef_curiosity_v2/peripheral/tmr4/plib_tmr4.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/88949746/plib_uart6.o: ../src/config/pic32mz_ef_curiosity_v2/peripheral/uart/plib_uart6.c  .generated_files/flags/pic32mz_ef_curiosity_v2/38290c3ccc210fed102cba6d7038d37756d023d6 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/88949746" 
	@${RM} ${OBJECTDIR}/_ext/88949746/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/88949746/plib_uart6.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/88949746/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/88949746/plib_uart6.o ../src/config/pic32mz_ef_curiosity_v2/peripheral/uart/plib_uart6.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/586341290/xc32_monitor.o: ../src/config/pic32mz_ef_curiosity_v2/stdio/xc32_monitor.c  .generated_files/flags/pic32mz_ef_curiosity_v2/397df0771d35d85f561f8118b195f2d382f93ae9 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/586341290" 
	@${RM} ${OBJECTDIR}/_ext/586341290/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/586341290/xc32_monitor.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/586341290/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/586341290/xc32_monitor.o ../src/config/pic32mz_ef_curiosity_v2/stdio/xc32_monitor.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/969001572/interrupts.o: ../src/config/pic32mz_ef_curiosity_v2/interrupts.c  .generated_files/flags/pic32mz_ef_curiosity_v2/22e5212aca16cfed6ca4f469fbbf4410087cfe1b .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/969001572" 
	@${RM} ${OBJECTDIR}/_ext/969001572/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/969001572/interrupts.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/969001572/interrupts.o.d" -o ${OBJECTDIR}/_ext/969001572/interrupts.o ../src/config/pic32mz_ef_curiosity_v2/interrupts.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main_pic32mz.o: ../src/main_pic32mz.c  .generated_files/flags/pic32mz_ef_curiosity_v2/4b528b5d6f8569417167887a037f11bab07673b6 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main_pic32mz.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main_pic32mz.o.d" -o ${OBJECTDIR}/_ext/1360937237/main_pic32mz.o ../src/main_pic32mz.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/DBPrint.o: ../src/DBPrint.c  .generated_files/flags/pic32mz_ef_curiosity_v2/ba9cd2bfcdfe3b9378b1de9a25ec67d435f9e442 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/DBPrint.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/DBPrint.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/DBPrint.o.d" -o ${OBJECTDIR}/_ext/1360937237/DBPrint.o ../src/DBPrint.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/2087367630/C-Motion.o: ../src/C-Motion/C/C-Motion.c  .generated_files/flags/pic32mz_ef_curiosity_v2/f4a5835170adc8c6d29862344dc765bef87a7579 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/C-Motion.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/C-Motion.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/C-Motion.o.d" -o ${OBJECTDIR}/_ext/2087367630/C-Motion.o ../src/C-Motion/C/C-Motion.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087367630/Examples.o: ../src/C-Motion/C/Examples.c  .generated_files/flags/pic32mz_ef_curiosity_v2/53f9af4f34abffaf52db56300d753c3dcd27db17 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/Examples.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/Examples.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/Examples.o.d" -o ${OBJECTDIR}/_ext/2087367630/Examples.o ../src/C-Motion/C/Examples.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087367630/PMDcommon.o: ../src/C-Motion/C/PMDcommon.c  .generated_files/flags/pic32mz_ef_curiosity_v2/9dab342ca08be86f6f97f98dc5e44caa8ee4663d .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDcommon.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDcommon.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/PMDcommon.o.d" -o ${OBJECTDIR}/_ext/2087367630/PMDcommon.o ../src/C-Motion/C/PMDcommon.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087367630/PMDdiag.o: ../src/C-Motion/C/PMDdiag.c  .generated_files/flags/pic32mz_ef_curiosity_v2/eeb5cf81b67c64a06c07708c6bd2ee0378e1bdbd .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDdiag.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDdiag.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/PMDdiag.o.d" -o ${OBJECTDIR}/_ext/2087367630/PMDdiag.o ../src/C-Motion/C/PMDdiag.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087367630/PMDopen.o: ../src/C-Motion/C/PMDopen.c  .generated_files/flags/pic32mz_ef_curiosity_v2/a129f30850f2772c5a060cb32523f437d7bebcda .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDopen.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDopen.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/PMDopen.o.d" -o ${OBJECTDIR}/_ext/2087367630/PMDopen.o ../src/C-Motion/C/PMDopen.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087367630/PMDPspi.o: ../src/C-Motion/C/PMDPspi.c  .generated_files/flags/pic32mz_ef_curiosity_v2/dcf97cd2e78bb183ec052631c0d3c1cd1f7f0b7 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDPspi.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDPspi.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/PMDPspi.o.d" -o ${OBJECTDIR}/_ext/2087367630/PMDPspi.o ../src/C-Motion/C/PMDPspi.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087367630/PMDsys.o: ../src/C-Motion/C/PMDsys.c  .generated_files/flags/pic32mz_ef_curiosity_v2/11c38983260fff70dd9cabbc02e8cb1c7bf59f10 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDsys.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/PMDsys.o.d" -o ${OBJECTDIR}/_ext/2087367630/PMDsys.o ../src/C-Motion/C/PMDsys.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087367630/PMDtrans.o: ../src/C-Motion/C/PMDtrans.c  .generated_files/flags/pic32mz_ef_curiosity_v2/44ff7f5c92845a2edb93b4ac47db12d9428303bd .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDtrans.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDtrans.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/PMDtrans.o.d" -o ${OBJECTDIR}/_ext/2087367630/PMDtrans.o ../src/C-Motion/C/PMDtrans.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087367630/PMDutil.o: ../src/C-Motion/C/PMDutil.c  .generated_files/flags/pic32mz_ef_curiosity_v2/8c8908ce90989b9817ed1a65297a2e699cf78bae .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDutil.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDutil.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/PMDutil.o.d" -o ${OBJECTDIR}/_ext/2087367630/PMDutil.o ../src/C-Motion/C/PMDutil.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/Pro-MotionExport.o: ../src/Pro-MotionExport.c  .generated_files/flags/pic32mz_ef_curiosity_v2/8916e438d4031efd62246f31905d5aabe5b26631 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Pro-MotionExport.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Pro-MotionExport.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Pro-MotionExport.o.d" -o ${OBJECTDIR}/_ext/1360937237/Pro-MotionExport.o ../src/Pro-MotionExport.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1520887106/plib_cache.o: ../src/config/pic32mz_ef_curiosity_v2/peripheral/cache/plib_cache.c  .generated_files/flags/pic32mz_ef_curiosity_v2/36591a80f2259fa2b3273979a00d550e743bb674 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/1520887106" 
	@${RM} ${OBJECTDIR}/_ext/1520887106/plib_cache.o.d 
	@${RM} ${OBJECTDIR}/_ext/1520887106/plib_cache.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1520887106/plib_cache.o.d" -o ${OBJECTDIR}/_ext/1520887106/plib_cache.o ../src/config/pic32mz_ef_curiosity_v2/peripheral/cache/plib_cache.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/412755682/plib_clk.o: ../src/config/pic32mz_ef_curiosity_v2/peripheral/clk/plib_clk.c  .generated_files/flags/pic32mz_ef_curiosity_v2/297f127aa217f759ddc6c4b9c30e15865a52b0ce .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/412755682" 
	@${RM} ${OBJECTDIR}/_ext/412755682/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/412755682/plib_clk.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/412755682/plib_clk.o.d" -o ${OBJECTDIR}/_ext/412755682/plib_clk.o ../src/config/pic32mz_ef_curiosity_v2/peripheral/clk/plib_clk.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/89445205/plib_dmac.o: ../src/config/pic32mz_ef_curiosity_v2/peripheral/dmac/plib_dmac.c  .generated_files/flags/pic32mz_ef_curiosity_v2/481044c49aa447c75d5dcc0bc41fb6fae45bdb5a .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/89445205" 
	@${RM} ${OBJECTDIR}/_ext/89445205/plib_dmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/89445205/plib_dmac.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/89445205/plib_dmac.o.d" -o ${OBJECTDIR}/_ext/89445205/plib_dmac.o ../src/config/pic32mz_ef_curiosity_v2/peripheral/dmac/plib_dmac.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/89406517/plib_evic.o: ../src/config/pic32mz_ef_curiosity_v2/peripheral/evic/plib_evic.c  .generated_files/flags/pic32mz_ef_curiosity_v2/da5ddeb3a7da0b9cda9867a797fd68a15c28e105 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/89406517" 
	@${RM} ${OBJECTDIR}/_ext/89406517/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/89406517/plib_evic.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/89406517/plib_evic.o.d" -o ${OBJECTDIR}/_ext/89406517/plib_evic.o ../src/config/pic32mz_ef_curiosity_v2/peripheral/evic/plib_evic.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/89352689/plib_gpio.o: ../src/config/pic32mz_ef_curiosity_v2/peripheral/gpio/plib_gpio.c  .generated_files/flags/pic32mz_ef_curiosity_v2/87ea0473a9af52246fbf8fd30723201d6a331808 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/89352689" 
	@${RM} ${OBJECTDIR}/_ext/89352689/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/89352689/plib_gpio.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/89352689/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/89352689/plib_gpio.o ../src/config/pic32mz_ef_curiosity_v2/peripheral/gpio/plib_gpio.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1620630455/plib_i2c1_master.o: ../src/config/pic32mz_ef_curiosity_v2/peripheral/i2c/master/plib_i2c1_master.c  .generated_files/flags/pic32mz_ef_curiosity_v2/33ad733903b189ad86896e1cee4789109372089d .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/1620630455" 
	@${RM} ${OBJECTDIR}/_ext/1620630455/plib_i2c1_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/1620630455/plib_i2c1_master.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1620630455/plib_i2c1_master.o.d" -o ${OBJECTDIR}/_ext/1620630455/plib_i2c1_master.o ../src/config/pic32mz_ef_curiosity_v2/peripheral/i2c/master/plib_i2c1_master.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/88968072/plib_tmr1.o: ../src/config/pic32mz_ef_curiosity_v2/peripheral/tmr1/plib_tmr1.c  .generated_files/flags/pic32mz_ef_curiosity_v2/4de545f54377f0c1e143c744208b7d63fb22dfa7 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/88968072" 
	@${RM} ${OBJECTDIR}/_ext/88968072/plib_tmr1.o.d 
	@${RM} ${OBJECTDIR}/_ext/88968072/plib_tmr1.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/88968072/plib_tmr1.o.d" -o ${OBJECTDIR}/_ext/88968072/plib_tmr1.o ../src/config/pic32mz_ef_curiosity_v2/peripheral/tmr1/plib_tmr1.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/88968069/plib_tmr4.o: ../src/config/pic32mz_ef_curiosity_v2/peripheral/tmr4/plib_tmr4.c  .generated_files/flags/pic32mz_ef_curiosity_v2/a38d4c13a3e5374e823881295b35249f03cbc866 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/88968069" 
	@${RM} ${OBJECTDIR}/_ext/88968069/plib_tmr4.o.d 
	@${RM} ${OBJECTDIR}/_ext/88968069/plib_tmr4.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/88968069/plib_tmr4.o.d" -o ${OBJECTDIR}/_ext/88968069/plib_tmr4.o ../src/config/pic32mz_ef_curiosity_v2/peripheral/tmr4/plib_tmr4.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/88949746/plib_uart6.o: ../src/config/pic32mz_ef_curiosity_v2/peripheral/uart/plib_uart6.c  .generated_files/flags/pic32mz_ef_curiosity_v2/ad3a68b64edd6f8d60061f2426e3124c855bcf0 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/88949746" 
	@${RM} ${OBJECTDIR}/_ext/88949746/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/88949746/plib_uart6.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/88949746/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/88949746/plib_uart6.o ../src/config/pic32mz_ef_curiosity_v2/peripheral/uart/plib_uart6.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/586341290/xc32_monitor.o: ../src/config/pic32mz_ef_curiosity_v2/stdio/xc32_monitor.c  .generated_files/flags/pic32mz_ef_curiosity_v2/7d704b5809b461553d21b9b5bd30f312ce3ced4d .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/586341290" 
	@${RM} ${OBJECTDIR}/_ext/586341290/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/586341290/xc32_monitor.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/586341290/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/586341290/xc32_monitor.o ../src/config/pic32mz_ef_curiosity_v2/stdio/xc32_monitor.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/969001572/interrupts.o: ../src/config/pic32mz_ef_curiosity_v2/interrupts.c  .generated_files/flags/pic32mz_ef_curiosity_v2/71b2e406e928a11f8219a55d390d6446397dc0bd .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/969001572" 
	@${RM} ${OBJECTDIR}/_ext/969001572/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/969001572/interrupts.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/969001572/interrupts.o.d" -o ${OBJECTDIR}/_ext/969001572/interrupts.o ../src/config/pic32mz_ef_curiosity_v2/interrupts.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main_pic32mz.o: ../src/main_pic32mz.c  .generated_files/flags/pic32mz_ef_curiosity_v2/c46f50b3e751adff9395d79f1869ae0dd823d937 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main_pic32mz.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main_pic32mz.o.d" -o ${OBJECTDIR}/_ext/1360937237/main_pic32mz.o ../src/main_pic32mz.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/DBPrint.o: ../src/DBPrint.c  .generated_files/flags/pic32mz_ef_curiosity_v2/99d81df610b7fa2ebc6c9a7166488972e5587b06 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/DBPrint.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/DBPrint.o 
	${MP_CPPC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -ffunction-sections -fno-common -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/DBPrint.o.d" -o ${OBJECTDIR}/_ext/1360937237/DBPrint.o ../src/DBPrint.c    -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/2087367630/PMDRPdevice.o: ../src/C-Motion/C/PMDRPdevice.cpp  .generated_files/flags/pic32mz_ef_curiosity_v2/9fdd420c08778359039ee2cba57f03e1f8826e57 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDRPdevice.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDRPdevice.o 
	${MP_CPPC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c++ -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -frtti -fexceptions -fno-check-new -fenforce-eh-specs -ffunction-sections -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/PMDRPdevice.o.d" -o ${OBJECTDIR}/_ext/2087367630/PMDRPdevice.o ../src/C-Motion/C/PMDRPdevice.cpp   -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087367630/PMDRP.o: ../src/C-Motion/C/PMDRP.cpp  .generated_files/flags/pic32mz_ef_curiosity_v2/aaefa95c7fb90260f6e40d338225d529358593ff .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDRP.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDRP.o 
	${MP_CPPC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c++ -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -frtti -fexceptions -fno-check-new -fenforce-eh-specs -ffunction-sections -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/PMDRP.o.d" -o ${OBJECTDIR}/_ext/2087367630/PMDRP.o ../src/C-Motion/C/PMDRP.cpp   -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087367630/PMDRPperiph.o: ../src/C-Motion/C/PMDRPperiph.cpp  .generated_files/flags/pic32mz_ef_curiosity_v2/8083675a8a6b4ce54d2f6115795b48c3d10fc131 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDRPperiph.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDRPperiph.o 
	${MP_CPPC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c++ -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -frtti -fexceptions -fno-check-new -fenforce-eh-specs -ffunction-sections -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/PMDRPperiph.o.d" -o ${OBJECTDIR}/_ext/2087367630/PMDRPperiph.o ../src/C-Motion/C/PMDRPperiph.cpp   -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/2087367630/PMDRPdevice.o: ../src/C-Motion/C/PMDRPdevice.cpp  .generated_files/flags/pic32mz_ef_curiosity_v2/73d69622c1e5d1fdb702c0f622f215d9c1a1e437 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDRPdevice.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDRPdevice.o 
	${MP_CPPC} $(MP_EXTRA_CC_PRE)  -g -x c++ -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -frtti -fexceptions -fno-check-new -fenforce-eh-specs -ffunction-sections -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/PMDRPdevice.o.d" -o ${OBJECTDIR}/_ext/2087367630/PMDRPdevice.o ../src/C-Motion/C/PMDRPdevice.cpp   -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087367630/PMDRP.o: ../src/C-Motion/C/PMDRP.cpp  .generated_files/flags/pic32mz_ef_curiosity_v2/e956dd98fddf7970ccf9da5771f6089b593e7b17 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDRP.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDRP.o 
	${MP_CPPC} $(MP_EXTRA_CC_PRE)  -g -x c++ -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -frtti -fexceptions -fno-check-new -fenforce-eh-specs -ffunction-sections -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/PMDRP.o.d" -o ${OBJECTDIR}/_ext/2087367630/PMDRP.o ../src/C-Motion/C/PMDRP.cpp   -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2087367630/PMDRPperiph.o: ../src/C-Motion/C/PMDRPperiph.cpp  .generated_files/flags/pic32mz_ef_curiosity_v2/a8f226684359297480d9ea9aa7ef690460db03e7 .generated_files/flags/pic32mz_ef_curiosity_v2/7720d9d212cb215f0a7b3167e08d08c844783ac
	@${MKDIR} "${OBJECTDIR}/_ext/2087367630" 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDRPperiph.o.d 
	@${RM} ${OBJECTDIR}/_ext/2087367630/PMDRPperiph.o 
	${MP_CPPC} $(MP_EXTRA_CC_PRE)  -g -x c++ -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../src/C-Motion/Include" -I"../../../HarmonyB/framework" -frtti -fexceptions -fno-check-new -fenforce-eh-specs -ffunction-sections -I"../src" -I"../src/config/pic32mz_ef_curiosity_v2" -MP -MMD -MF "${OBJECTDIR}/_ext/2087367630/PMDRPperiph.o.d" -o ${OBJECTDIR}/_ext/2087367630/PMDRPperiph.o ../src/C-Motion/C/PMDRPperiph.cpp   -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/getting_started_ext_pic32mz_ef_curiosity_v2_orig.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../src/config/pic32mz_ef_curiosity_v2/p32MZ2048EFM144.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CPPC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/getting_started_ext_pic32mz_ef_curiosity_v2_orig.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x37F   -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=8122,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/getting_started_ext_pic32mz_ef_curiosity_v2_orig.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../src/config/pic32mz_ef_curiosity_v2/p32MZ2048EFM144.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CPPC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/getting_started_ext_pic32mz_ef_curiosity_v2_orig.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_pic32mz_ef_curiosity_v2=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=8122,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/getting_started_ext_pic32mz_ef_curiosity_v2_orig.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
