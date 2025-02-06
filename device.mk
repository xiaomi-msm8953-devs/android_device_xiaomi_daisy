#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from msm8953-common
$(call inherit-product, device/xiaomi/msm8953-common/msm8953.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

PRODUCT_PACKAGES += \
    DaisyFrameworkOverlay

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp.xml

ifeq ($(AB_OTA_UPDATER), true)
# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot-service.qti \
    android.hardware.boot-service.qti.recovery

$(call soong_config_set,QTI_GPT_UTILS,USE_BSG_FRAMEWORK,false)
endif

# Camera
PRODUCT_PACKAGES += \
    camera.msm8953

# Consumer IR
PRODUCT_PACKAGES += \
    android.hardware.ir-service.example

# Fstab
ifeq ($(AB_OTA_UPDATER), true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab_AB.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom \
    $(LOCAL_PATH)/rootdir/etc/fstab_AB.qcom:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.qcom
else
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom
endif

ifeq ($(AB_OTA_UPDATER), true)
# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier
endif

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/daisy/daisy-vendor.mk)
