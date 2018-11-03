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

COMPILEFLAGS += -I$(LIB_ASF)/config
COMPILEFLAGS += -I$(LIB_ASF)/common/boards
COMPILEFLAGS += -I$(LIB_ASF)/common/boards/user_board
COMPILEFLAGS += -I$(LIB_ASF)/common/services
COMPILEFLAGS += -I$(LIB_ASF)/common/services/clock
COMPILEFLAGS += -I$(LIB_ASF)/common/services/clock/xmega
COMPILEFLAGS += -I$(LIB_ASF)/common/services/sleepmgr
COMPILEFLAGS += -I$(LIB_ASF)/common/services/sleepmgr/xmega
COMPILEFLAGS += -I$(LIB_ASF)/common/services/usb
COMPILEFLAGS += -I$(LIB_ASF)/common/services/usb/class
COMPILEFLAGS += -I$(LIB_ASF)/common/services/usb/class/hid
COMPILEFLAGS += -I$(LIB_ASF)/common/services/usb/class/hid/device
COMPILEFLAGS += -I$(LIB_ASF)/common/services/usb/class/hid/device/generic
COMPILEFLAGS += -I$(LIB_ASF)/common/services/usb/udc
COMPILEFLAGS += -I$(LIB_ASF)/common/utils
COMPILEFLAGS += -I$(LIB_ASF)/common/utils/interrupt
COMPILEFLAGS += -I$(LIB_ASF)/common/utils/make
COMPILEFLAGS += -I$(LIB_ASF)/xmega/drivers
COMPILEFLAGS += -I$(LIB_ASF)/xmega/drivers/cpu
COMPILEFLAGS += -I$(LIB_ASF)/xmega/drivers/nvm
COMPILEFLAGS += -I$(LIB_ASF)/xmega/drivers/sleep
COMPILEFLAGS += -I$(LIB_ASF)/xmega/drivers/usb
COMPILEFLAGS += -I$(LIB_ASF)/xmega/utils
COMPILEFLAGS += -I$(LIB_ASF)/xmega/utils/assembler
COMPILEFLAGS += -I$(LIB_ASF)/xmega/utils/bit_handling
COMPILEFLAGS += -I$(LIB_ASF)/xmega/utils/preprocessor

CFLAGS += $(COMPILEFLAGS) -std=gnu99
CFLAGS += -fno-inline-small-functions
CFLAGS += -fno-strict-aliasing

CPPFLAGS += $(COMPILEFLAGS)
CPPFLAGS += -fno-exceptions -std=c++11

LDFLAGS +=-Wl,--gc-sections

OPT_DEFS += -DF_CPU=$(F_CPU)UL

MCUFLAGS = -mmcu=$(XMEGA)
