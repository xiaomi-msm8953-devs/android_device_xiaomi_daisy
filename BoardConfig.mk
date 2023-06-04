#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/daisy
USES_DEVICE_XIAOMI_DAISY := true

# Inherit from common msm8953-common
include device/xiaomi/msm8953-common/BoardConfigCommon.mk

# Kernel
TARGET_KERNEL_CONFIG += xiaomi/daisy.config xiaomi/sakura.config

ifeq ($(AB_OTA_UPDATER), true)
# Filesystem
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true

# A/B
AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor
endif

# Display
TARGET_SCREEN_DENSITY := 420

# Partitions
ifeq ($(TARGET_DEVICE), daisy)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_VENDORIMAGE_PARTITION_SIZE := 805306368
else ifeq ($(TARGET_DEVICE), sakura)
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_VENDORIMAGE_PARTITION_SIZE := 872415232
endif
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

ifeq ($(AB_OTA_UPDATER), true)
# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml
endif

# Power
TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/wakeup_gesture"

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Security Patch Level
VENDOR_SECURITY_PATCH := 2021-07-01

# Inherit the proprietary files
include vendor/xiaomi/daisy/BoardConfigVendor.mk
