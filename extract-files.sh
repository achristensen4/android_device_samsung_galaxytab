#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE=GT-P1000

mkdir -p ../../../vendor/samsung/$DEVICE/proprietary

DIRS="
bin
bin/gpsd
cameradata
etc/dhcpcd/dhcpcd-hooks
etc/wifi
lib/egl
lib/hw
media
xbin
usr/keychars
usr/keylayout
"

for DIR in $DIRS; do
mkdir -p ../../../vendor/samsung/$DEVICE/proprietary/$DIR
done

FILES="
lib/libsecril-client.so
lib/libril.so
bin/rild
lib/libsec-ril.so
bin/vold
bin/gpsd/66ca3eb6.0
bin/gpsd/7651b327.0
bin/gpsd/803ca020.0
bin/gpsd/8c7fccef.0
bin/gpsd/c9dbfc2e.0
bin/gpsd/ddc328ff.0
bin/gpsd/ed62f4e3.0
bin/gpsd/f0b6e66f.0
bin/gpsd/glgps_samsungJupiter
etc/jupiter.xml
bin/BCM4329B1_002.002.023.0534.0590.hcd
etc/wifi/bcm4329_aps.bin
etc/wifi/bcm4329_mfg.bin
etc/wifi/bcm4329_sta.bin
etc/wifi/nvram_mfg.txt
etc/wifi/nvram_mfg_lna.txt
etc/wifi/nvram_mfg_nolna.txt
etc/wifi/nvram_net.txt
etc/wifi/nvram_net_2G.txt
etc/wifi/nvram_net_lna.txt
etc/wifi/nvram_net_nolna.txt
etc/wifi.conf
bin/mfgloader
bin/pvrsrvinit
lib/egl/egl.cfg
lib/egl/libEGL_POWERVR_SGX540_120.so
lib/egl/libGLES_android.so
lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so
lib/egl/libGLESv2_POWERVR_SGX540_120.so
lib/libIMGegl.so
lib/libpvrANDROID_WSEGL.so
lib/libpvr2d.so
lib/libPVRScopeServices.so
lib/libsrv_um.so
lib/libsrv_init.so
lib/libglslcompiler.so
bin/killmediaserver
bin/notified_event
lib/libarccamera.so
lib/libcamera_client.so
lib/libcamera.so
lib/libcameraservice.so
lib/libseccameraadaptor.so
lib/libseccamera.so
cameradata/datapattern_420sp.yuv
cameradata/datapattern_front_420sp.yuv
lib/libtvoutservice.so
lib/libtvout.so
lib/lib_tvoutengine.so
lib/libtvoutfimc.so
lib/libtvouthdmi.so
lib/libtvout_jni.so
lib/libedid.so
lib/libddc.so
bin/tvoutserver
lib/hw/gralloc.default.so
lib/hw/gralloc.s5pc110.so
bin/playlpm
bin/charging_mode
lib/libQmageDecoder.so
media/battery_charging_10.qmg
media/battery_charging_100.qmg
media/battery_charging_15.qmg
media/battery_charging_20.qmg
media/battery_charging_25.qmg
media/battery_charging_30.qmg
media/battery_charging_35.qmg
media/battery_charging_40.qmg
media/battery_charging_45.qmg
media/battery_charging_5.qmg
media/battery_charging_50.qmg
media/battery_charging_55.qmg
media/battery_charging_60.qmg
media/battery_charging_65.qmg
media/battery_charging_70.qmg
media/battery_charging_75.qmg
media/battery_charging_80.qmg
media/battery_charging_85.qmg
media/battery_charging_90.qmg
media/battery_charging_95.qmg
media/bootani.qmg
media/chargingwarning_disconnected.qmg
media/chargingwarning_temp.qmg
media/samsungani.qmg
media/usb_not_charging.qmg
usr/keychars/AT42QT602240_Touchscreen.kcm.bin
usr/keychars/Broadcom_Bluetooth_HID.kcm.bin
usr/keychars/gpio-keys.kcm.bin
usr/keychars/melfas-touchkey.kcm.bin
usr/keychars/p1_keyboard.kcm.bin
usr/keychars/qwerty.kcm.bin
usr/keychars/qwerty2.kcm.bin
usr/keychars/sec_jack.kcm.bin
usr/keylayout/AT42QT602240_Touchscreen.kl
usr/keylayout/AVRCP.kl
usr/keylayout/Broadcom_Bluetooth_HID.kl
usr/keylayout/gpio-keys.kl
usr/keylayout/melfas-touchkey.kl
usr/keylayout/p1_keyboard.kl
usr/keylayout/qwerty.kl
usr/keylayout/sec_jack.kl
"

for FILE in $FILES; do
#adb pull system/$FILE ../../../vendor/samsung/$DEVICE/proprietary/$FILE
cp /mnt/safe/root/tab/system/JK5/$FILE ../../../vendor/samsung/$DEVICE/proprietary/$FILE
done

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/samsung/$DEVICE/$DEVICE-vendor-blobs.mk
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/samsung/__DEVICE__/extract-files.sh

#
# Prebuilt libraries that are needed to build open-source libraries
#


PRODUCT_COPY_FILES := \
    vendor/samsung/__DEVICE__/proprietary/lib/libsecril-client.so:obj/lib/libsecril-client.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libtvout.so:obj/lib/libtvout.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libcamera.so:obj/lib/libcamera.so

#
# RIL
#
PRODUCT_COPY_FILES += \
    vendor/samsung/__DEVICE__/proprietary/lib/libsecril-client.so:system/lib/libsecril-client.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libril.so:system/lib/libril.so \
    vendor/samsung/__DEVICE__/proprietary/bin/rild:system/bin/rild \
    vendor/samsung/__DEVICE__/proprietary/lib/libsec-ril.so:system/lib/libsec-ril.so

#
# GPS
#
PRODUCT_COPY_FILES += \
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/66ca3eb6.0:system/bin/gpsd/66ca3eb6.0 \
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/7651b327.0:system/bin/gpsd/7651b327.0 \
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/803ca020.0:system/bin/gpsd/803ca020.0 \
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/8c7fccef.0:system/bin/gpsd/8c7fccef.0 \
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/c9dbfc2e.0:system/bin/gpsd/c9dbfc2e.0 \
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/ddc328ff.0:system/bin/gpsd/ddc328ff.0 \
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/ed62f4e3.0:system/bin/gpsd/ed62f4e3.0 \
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/f0b6e66f.0:system/bin/gpsd/f0b6e66f.0 \
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/glgps_samsungJupiter:system/bin/gpsd/glgps_samsungJupiter

# use the one from prebuilt
#    vendor/samsung/__DEVICE__/proprietary/etc/jupiter.xml:system/etc/jupiter.xml


#
# WIFI
#
# mfg loader can be used to load different nvram_mfg
PRODUCT_COPY_FILES += \
    vendor/samsung/__DEVICE__/proprietary/bin/BCM4329B1_002.002.023.0534.0590.hcd:system/bin/BCM4329B1_002.002.023.0534.0590.hcd \
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/bcm4329_aps.bin:system/etc/wifi/bcm4329_aps.bin \
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/bcm4329_mfg.bin:system/etc/wifi/bcm4329_mfg.bin \
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/bcm4329_sta.bin:system/etc/wifi/bcm4329_sta.bin \
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/nvram_mfg_lna.txt:system/etc/wifi/nvram_mfg_lna.txt \
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/nvram_mfg_nolna.txt:system/etc/wifi/nvram_mfg_nolna.txt \
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/nvram_net.txt:system/etc/wifi/nvram_net.txt \
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/nvram_net_2G.txt:system/etc/wifi/nvram_net_2G.txt \
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/nvram_net_lna.txt:system/etc/wifi/nvram_net_lna.txt \
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/nvram_net_nolna.txt:system/etc/wifi/nvram_net_nolna.txt \
    vendor/samsung/__DEVICE__/proprietary/bin/mfgloader:system/bin/mfgloader \
    vendor/samsung/__DEVICE__/proprietary/etc/wifi.conf:system/etc/wifi.conf

#
# Graphics/GL driver
#
PRODUCT_COPY_FILES += \
    vendor/samsung/__DEVICE__/proprietary/bin/pvrsrvinit:system/bin/pvrsrvinit \
    vendor/samsung/__DEVICE__/proprietary/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
    vendor/samsung/__DEVICE__/proprietary/lib/egl/libEGL_POWERVR_SGX540_120.so:system/lib/egl/libEGL_POWERVR_SGX540_120.so \
    vendor/samsung/__DEVICE__/proprietary/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
    vendor/samsung/__DEVICE__/proprietary/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so:system/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \
    vendor/samsung/__DEVICE__/proprietary/lib/egl/libGLESv2_POWERVR_SGX540_120.so:system/lib/egl/libGLESv2_POWERVR_SGX540_120.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libIMGegl.so:system/lib/libIMGegl.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libpvrANDROID_WSEGL.so:system/lib/libpvrANDROID_WSEGL.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libpvr2d.so:system/lib/libpvr2d.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libPVRScopeServices.so:system/lib/libPVRScopeServices.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libsrv_um.so:system/lib/libsrv_um.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libsrv_init.so:system/lib/libsrv_init.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libglslcompiler.so:system/lib/libglslcompiler.so


#
# Samsung binary crap
#
PRODUCT_COPY_FILES += \
    vendor/samsung/__DEVICE__/proprietary/bin/killmediaserver:system/bin/killmediaserver \
    vendor/samsung/__DEVICE__/proprietary/bin/notified_event:system/bin/notified_event \
    vendor/samsung/__DEVICE__/proprietary/bin/vold:system/bin/vold

#
# camera
#
PRODUCT_COPY_FILES += \
    vendor/samsung/__DEVICE__/proprietary/lib/libarccamera.so:system/lib/libarccamera.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libcamera_client.so:system/lib/libcamera_client.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libcamera.so:system/lib/libcamera.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libseccameraadaptor.so:system/lib/libseccameraadaptor.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libseccamera.so:system/lib/libseccamera.so \
    vendor/samsung/__DEVICE__/proprietary/cameradata/datapattern_420sp.yuv:system/cameradata/datapattern_420sp.yuv \
    vendor/samsung/__DEVICE__/proprietary/cameradata/datapattern_front_420sp.yuv:system/cameradata/datapattern_front_420sp.yuv

# failing to load zygote with this one, what is missing?
#    vendor/samsung/__DEVICE__/proprietary/lib/libcameraservice.so:system/lib/libcameraservice.so \

#
# TVOUT
#
PRODUCT_COPY_FILES += \
    vendor/samsung/__DEVICE__/proprietary/lib/libtvoutservice.so:system/lib/libtvoutservice.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libtvout.so:system/lib/libtvout.so \
    vendor/samsung/__DEVICE__/proprietary/lib/lib_tvoutengine.so:system/lib/lib_tvoutengine.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libtvoutfimc.so:system/lib/libtvoutfimc.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libtvouthdmi.so:system/lib/libtvouthdmi.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libtvout_jni.so:system/lib/libtvout_jni.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libedid.so:system/lib/libedid.so \
    vendor/samsung/__DEVICE__/proprietary/lib/libddc.so:system/lib/libddc.so \
    vendor/samsung/__DEVICE__/proprietary/bin/tvoutserver:system/bin/tvoutserver

#
# Hw support
#
PRODUCT_COPY_FILES += \
    vendor/samsung/__DEVICE__/proprietary/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \
    vendor/samsung/__DEVICE__/proprietary/lib/hw/gralloc.s5pc110.so:system/lib/hw/gralloc.s5pc110.so
#
# Files for battery charging screen
#
PRODUCT_COPY_FILES += \
    vendor/samsung/__DEVICE__/proprietary/bin/playlpm:system/bin/playlpm \
    vendor/samsung/__DEVICE__/proprietary/bin/charging_mode:system/bin/charging_mode \
    vendor/samsung/__DEVICE__/proprietary/lib/libQmageDecoder.so:system/lib/libQmageDecoder.so \
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_5.qmg:system/media/battery_charging_5.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_10.qmg:system/media/battery_charging_10.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_15.qmg:system/media/battery_charging_15.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_20.qmg:system/media/battery_charging_20.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_25.qmg:system/media/battery_charging_25.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_30.qmg:system/media/battery_charging_30.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_35.qmg:system/media/battery_charging_35.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_40.qmg:system/media/battery_charging_40.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_45.qmg:system/media/battery_charging_45.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_50.qmg:system/media/battery_charging_50.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_55.qmg:system/media/battery_charging_55.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_60.qmg:system/media/battery_charging_60.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_65.qmg:system/media/battery_charging_65.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_70.qmg:system/media/battery_charging_70.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_75.qmg:system/media/battery_charging_75.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_80.qmg:system/media/battery_charging_80.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_85.qmg:system/media/battery_charging_85.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_90.qmg:system/media/battery_charging_90.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_95.qmg:system/media/battery_charging_95.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/battery_charging_100.qmg:system/media/battery_charging_100.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/chargingwarning_disconnected.qmg:system/media/chargingwarning_disconnected.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/chargingwarning_temp.qmg:system/media/chargingwarning_temp.qmg \
    vendor/samsung/__DEVICE__/proprietary/media/usb_not_charging.qmg:system/media/usb_not_charging.qmg

#
# Keyboard
#
PRODUCT_COPY_FILES += \
    vendor/samsung/__DEVICE__/proprietary/usr/keychars/AT42QT602240_Touchscreen.kcm.bin:system/usr/keychars/AT42QT602240_Touchscreen.kcm.bin \
    vendor/samsung/__DEVICE__/proprietary/usr/keychars/Broadcom_Bluetooth_HID.kcm.bin:system/usr/keychars/Broadcom_Bluetooth_HID.kcm.bin \
    vendor/samsung/__DEVICE__/proprietary/usr/keychars/gpio-keys.kcm.bin:system/usr/keychars/gpio-keys.kcm.bin \
    vendor/samsung/__DEVICE__/proprietary/usr/keychars/melfas-touchkey.kcm.bin:system/usr/keychars/melfas-touchkey.kcm.bin \
    vendor/samsung/__DEVICE__/proprietary/usr/keychars/p1_keyboard.kcm.bin:system/usr/keychars/p1_keyboard.kcm.bin \
    vendor/samsung/__DEVICE__/proprietary/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    vendor/samsung/__DEVICE__/proprietary/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    vendor/samsung/__DEVICE__/proprietary/usr/keychars/sec_jack.kcm.bin:system/usr/keychars/sec_jack.kcm.bin \
    vendor/samsung/__DEVICE__/proprietary/usr/keylayout/AT42QT602240_Touchscreen.kl:system/usr/keylayout/AT42QT602240_Touchscreen.kl \
    vendor/samsung/__DEVICE__/proprietary/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    vendor/samsung/__DEVICE__/proprietary/usr/keylayout/Broadcom_Bluetooth_HID.kl:system/usr/keylayout/Broadcom_Bluetooth_HID.kl \
    vendor/samsung/__DEVICE__/proprietary/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    vendor/samsung/__DEVICE__/proprietary/usr/keylayout/melfas-touchkey.kl:system/usr/keylayout/melfas-touchkey.kl \
    vendor/samsung/__DEVICE__/proprietary/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    vendor/samsung/__DEVICE__/proprietary/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl

EOF

./setup-makefiles.sh
