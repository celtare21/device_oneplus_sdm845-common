#
# Copyright (C) 2018 The LineageOS Project
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
#

# Get non-open-source specific aspects
$(call inherit-product, vendor/oneplus/sdm845-common/sdm845-common-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay 

# Properties
-include $(LOCAL_PATH)/system_prop.mk

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    vbmeta

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# ANT+
PRODUCT_PACKAGES += \
    AntHalService

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:system/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml

# Boot control
PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Camera
PRODUCT_PACKAGES_DEBUG += \
    CameraPackage

# Common init scripts
PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.recovery.qcom.rc \
    init.jamesdsp.sh \
    init.performance.rc

# Display
PRODUCT_PACKAGES += \
    libvulkan

# Doze mode
PRODUCT_PACKAGES += \
    OneplusDoze

# HotwordEnrollement app permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-hotword.xml:system/etc/permissions/privapp-permissions-hotword.xml

# IMS
PRODUCT_PACKAGES += \
    ims-ext-common \
    android.hidl.base@1.0

# Google extra permissions and features
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/etc/permissions/com.google.android.dialer.support.xml:system/etc/permissions/com.google.android.dialer.support.xml \
    $(LOCAL_PATH)/prebuilts/etc/permissions/com.oneplus.software.xml:system/etc/permissions/com.oneplus.software.xml \
    $(LOCAL_PATH)/prebuilts/etc/sysconfig/google_build.xml:system/etc/sysconfig/google_build.xml \
    $(LOCAL_PATH)/prebuilts/etc/sysconfig/google_vr_build.xml:system/etc/sysconfig/google_google_vr_build.xml \
    $(LOCAL_PATH)/prebuilts/etc/sysconfig/nexus.xml:system/etc/sysconfig/nexus.xml \
    $(LOCAL_PATH)/prebuilts/etc/sysconfig/pixel_2017_exclusive.xml:system/etc/sysconfig/pixel_2017_exclusive.xml \
    $(LOCAL_PATH)/prebuilts/etc/sysconfig/pixel_2018_exclusive.xml:system/etc/sysconfig/pixel_2018_exclusive.xml \
    $(LOCAL_PATH)/prebuilts/etc/sysconfig/pixel_experience_2017.xml:system/etc/sysconfig/pixel_experience_2017.xml \
    $(LOCAL_PATH)/prebuilts/etc/sysconfig/pixel_experience_2018.xml:system/etc/sysconfig/pixel_experience_2018.xml

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/gf_input.idc:system/usr/idc/gf_input.idc \
    $(LOCAL_PATH)/keylayout/gf_input.kl:system/usr/keylayout/gf_input.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.oneplus_sdm845

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles_vendor.xml:system/etc/media_profiles_vendor.xml

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    com.android.nfc_extras

# Offmode charging
PRODUCT_PACKAGES += \
    chargeonlymode
    
# Power
PRODUCT_PACKAGES += \
    power.qcom:64

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# tri-state-key
PRODUCT_PACKAGES += \
    KeyHandler \
    tri-state-key_daemon

# Update engine
PRODUCT_PACKAGES += \
    brillo_update_payload \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.sdm845 \
    libcutils \
    libgptutils \
    libz \

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

#Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/etc/WCNSS_qcom_cfg.ini:/vendor/etc/wifi/WCNSS_qcom_cfg.ini

# WFD
PRODUCT_BOOT_JARS += \
    WfdCommon

# Custom op6 healthd
PRODUCT_PACKAGES += android.hardware.health@2.0-service.oneplus6
DEVICE_FRAMEWORK_MANIFEST_FILE += \
    system/libhidl/vintfdata/manifest_healthd_exclude.xml
