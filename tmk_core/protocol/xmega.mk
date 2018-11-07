XMEGA_DIR = protocol/xmega

SRC += $(XMEGA_DIR)/main_xmega.c

ASF_SRC += $(LIB_ASFUSB)/usb_hid.c
ASF_SRC += $(LIB_ASFUSB)/udi/udi_hid_kbd.c
ASF_SRC += $(LIB_ASFUSB)/udi/udi_hid_kbd_desc.c

ASF_SRC += $(LIB_ASF)/common/services/clock/xmega/sysclk.c
ASF_SRC += $(LIB_ASF)/common/services/sleepmgr/xmega/sleepmgr.c
ASF_SRC += $(LIB_ASF)/common/services/usb/class/hid/device/udi_hid.c
ASF_SRC += $(LIB_ASF)/common/services/usb/udc/udc.c
ASF_SRC += $(LIB_ASF)/xmega/drivers/cpu/ccp.S
ASF_SRC += $(LIB_ASF)/xmega/drivers/nvm/nvm_asm.S
ASF_SRC += $(LIB_ASF)/xmega/drivers/usb/usb_device.c

SRC += $(ASF_SRC)

VPATH += $(TMK_DIR)/$(XMEGA_DIR)
VPATH += $(TMK_DIR)/$(XMEGA_DIR)/config
