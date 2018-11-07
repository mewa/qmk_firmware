# Hey Emacs, this is a -*- makefile -*-
##############################################################################
# Compiler settings
#
CC=avr-gcc
OBJCOPY = avr-objcopy
OBJDUMP = avr-objdump
SIZE = avr-size
AR = avr-ar rcs
NM = avr-nm
HEX = $(OBJCOPY) -O $(FORMAT) -R .eeprom -R .fuse -R .lock -R .signature
EEP = $(OBJCOPY) -j .eeprom --set-section-flags=.eeprom="alloc,load" --change-section-lma .eeprom=0 --no-change-warnings -O $(FORMAT)
BIN =


COMPILEFLAGS += -funsigned-char
COMPILEFLAGS += -funsigned-bitfields
COMPILEFLAGS += -ffunction-sections
COMPILEFLAGS += -fdata-sections
COMPILEFLAGS += -fpack-struct
COMPILEFLAGS += -fshort-enums

LIB_ASF = $(LIB_PATH)/asf
LIB_ASFUSB = $(LIB_PATH)/asf-usb


INCLUDEFLAGS += -I$(LIB_ASFUSB)
INCLUDEFLAGS += -I$(LIB_ASFUSB)/udi
INCLUDEFLAGS += -I$(LIB_ASF)/config
INCLUDEFLAGS += -I$(LIB_ASF)/common/boards
INCLUDEFLAGS += -I$(LIB_ASF)/common/boards/user_board
INCLUDEFLAGS += -I$(LIB_ASF)/common/services
INCLUDEFLAGS += -I$(LIB_ASF)/common/services/clock
INCLUDEFLAGS += -I$(LIB_ASF)/common/services/clock/xmega
INCLUDEFLAGS += -I$(LIB_ASF)/common/services/sleepmgr
INCLUDEFLAGS += -I$(LIB_ASF)/common/services/sleepmgr/xmega
INCLUDEFLAGS += -I$(LIB_ASF)/common/services/usb
INCLUDEFLAGS += -I$(LIB_ASF)/common/services/usb/class
INCLUDEFLAGS += -I$(LIB_ASF)/common/services/usb/class/hid
INCLUDEFLAGS += -I$(LIB_ASF)/common/services/usb/class/hid/device
INCLUDEFLAGS += -I$(LIB_ASF)/common/services/usb/udc
INCLUDEFLAGS += -I$(LIB_ASF)/common/utils
INCLUDEFLAGS += -I$(LIB_ASF)/common/utils/interrupt
INCLUDEFLAGS += -I$(LIB_ASF)/common/utils/make
INCLUDEFLAGS += -I$(LIB_ASF)/xmega/drivers
INCLUDEFLAGS += -I$(LIB_ASF)/xmega/drivers/cpu
INCLUDEFLAGS += -I$(LIB_ASF)/xmega/drivers/nvm
INCLUDEFLAGS += -I$(LIB_ASF)/xmega/drivers/sleep
INCLUDEFLAGS += -I$(LIB_ASF)/xmega/drivers/usb
INCLUDEFLAGS += -I$(LIB_ASF)/xmega/utils
INCLUDEFLAGS += -I$(LIB_ASF)/xmega/utils/assembler
INCLUDEFLAGS += -I$(LIB_ASF)/xmega/utils/bit_handling
INCLUDEFLAGS += -I$(LIB_ASF)/xmega/utils/preprocessor

COMPILEFLAGS += $(INCLUDEFLAGS)

ASFLAGS += $(INCLUDEFLAGS)

CFLAGS += $(COMPILEFLAGS) -std=gnu99
CFLAGS += -fno-inline-small-functions
CFLAGS += -fno-strict-aliasing

CPPFLAGS += $(COMPILEFLAGS)
CPPFLAGS += -fno-exceptions -std=c++11

LDFLAGS +=-Wl,--gc-sections

OPT_DEFS += -DF_CPU=$(F_CPU)UL

MCUFLAGS = -mmcu=$(XMEGA)
