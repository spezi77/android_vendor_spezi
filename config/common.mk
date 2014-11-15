PRODUCT_BRAND ?= spezi

# bootanimation (Some devices cant go over 100fps for a bootani)
ifneq ($(USE_LOWFPS_BOOTANI),true)
 PRODUCT_COPY_FILES += \
     vendor/spezi/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip
else
PRODUCT_COPY_FILES += \
    vendor/spezi/prebuilt/bootanimation/lowfps-bootanimation.zip:system/media/bootanimation.zip
endif

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# general properties
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    persist.sys.root_access=1

# Disable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/spezi/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/spezi/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/spezi/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/spezi/prebuilt/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
    vendor/spezi/prebuilt/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/spezi/prebuilt/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/spezi/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# Init script file with spezi extras
PRODUCT_COPY_FILES += \
    vendor/spezi/prebuilt/etc/init.local.rc:root/init.spezi.rc

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Chromium Prebuilt
ifeq ($(PRODUCT_PREBUILT_WEBVIEWCHROMIUM),yes)
-include prebuilts/chromium/$(TARGET_DEVICE)/chromium_prebuilt.mk
endif

# Additional packages
-include vendor/spezi/config/packages.mk

# Versioning
-include vendor/spezi/config/version.mk

# Add our overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/spezi/overlay/common
