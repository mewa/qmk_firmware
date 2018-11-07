/*
  Copyright 2018 Massdrop Inc.

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 2 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "conf_usb.h"
#include "udd.h"

__attribute__((weak))
void usb_suspend_action(void) {
}

__attribute__((weak))
void usb_resume_action(void) {
}

__attribute__((weak))
void usb_sof_action(void) {
}

__attribute__((weak))
void usb_remotewakeup_enable(void) {
}

__attribute__((weak))
void usb_remotewakeup_disable(void) {
}

#ifdef KBD
volatile bool usb_b_kbd_enable = false;
bool usb_hid_kbd_enable(void) {
  usb_b_kbd_enable = true;
  return true;
}

void usb_hid_kbd_disable(void) {
  usb_b_kbd_enable = false;
}
#endif

#ifdef NKRO
volatile bool usb_b_nkro_enable = false;
bool usb_hid_nkro_enable(void) {
  usb_b_nkro_enable = true;
  return true;
}

void usb_hid_nkro_disable(void) {
  usb_b_nkro_enable = false;
}
#endif

#ifdef EXK
volatile bool usb_b_exk_enable = false;
bool usb_hid_exk_enable(void) {
  usb_b_exk_enable = true;
  return true;
}

void usb_hid_exk_disable(void) {
  usb_b_exk_enable = false;
}
#endif

#ifdef CON
volatile bool usb_b_con_enable = false;
bool usb_hid_con_enable(void) {
  usb_b_con_enable = true;
  return true;
}

void usb_hid_con_disable(void) {
  usb_b_con_enable = false;
}
#endif

#ifdef MOU
volatile bool usb_b_mou_enable = false;
bool usb_hid_mou_enable(void) {
  usb_b_mou_enable = true;
  return true;
}

void usb_hid_mou_disable(void) {
  usb_b_mou_enable = false;
}
#endif

#ifdef RAW
volatile bool usb_b_raw_enable = false;
bool usb_hid_raw_enable(void) {
  usb_b_raw_enable = true;
  return true;
}

void usb_hid_raw_disable(void) {
  usb_b_raw_enable = false;
}
#endif
