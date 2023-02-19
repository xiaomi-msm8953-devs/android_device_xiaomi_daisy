#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/daisy

# Inherit from common msm8953-common
include device/xiaomi/msm8953-common/BoardConfigCommon.mk

# Inherit the proprietary files
include vendor/xiaomi/daisy/BoardConfigVendor.mk