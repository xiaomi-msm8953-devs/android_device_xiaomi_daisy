#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/daisy

# Inherit from common msm8953-common
include device/xiaomi/msm8953-common/BoardConfigCommon.mk

# Kernel
TARGET_KERNEL_CONFIG := daisy_defconfig

# Filesystem
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_VENDORIMAGE_PARTITION_SIZE := 805306368
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Inherit the proprietary files
include vendor/xiaomi/daisy/BoardConfigVendor.mk