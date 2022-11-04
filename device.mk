# Copyright 2014 The Android Open Source Project
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

# Device path
DEVICE_PATH := device/motorola/hanoip/rootdir

DEVICE_PACKAGE_OVERLAYS += \
    device/motorola/hanoip/overlay

# Kernel
PRODUCT_COPY_FILES += \
    device/motorola/sm6150-common-kernel/sm6150-moto-Image.gz:kernel

# Audio Configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vendor/etc/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(DEVICE_PATH)/vendor/etc/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(DEVICE_PATH)/vendor/etc/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Device Init
PRODUCT_PACKAGES += \
    fstab.hanoip \
    vendor-fstab.hanoip \
    init.recovery.qcom.rc

# AB Partitions
AB_OTA_PARTITIONS += \
    vendor_boot \
    system_ext

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=400

# Fingerprint
TARGET_USES_CHIPONE_FINGERPRINT := true
TARGET_USES_FPC_FINGERPRINT := true

# Inherit from those products. Most specific first.
$(call inherit-product, device/motorola/sm6150-common/platform.mk)

# include board vendor blobs
$(call inherit-product-if-exists, vendor/motorola/hanoip/hanoip-vendor.mk)
