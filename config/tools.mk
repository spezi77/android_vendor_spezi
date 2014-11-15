LOCAL_PATH:= vendor/spezi/prebuilt

# Utilize init.d scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    $(LOCAL_PATH)/etc/init.d/05mountext:system/etc/init.d/05mountext \
    $(LOCAL_PATH)/etc/init.d/10apps2sd-redux:system/etc/init.d/10apps2sd \
    $(LOCAL_PATH)/etc/init.d/20extgapps:system/etc/init.d/20extgapps

# Apps2sd files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bin/a2sd:system/bin/a2sd \
    $(LOCAL_PATH)/bin/sysinit:system/bin/sysinit \
    $(LOCAL_PATH)/bin/fix_permissions:system/bin/fix_permissions \
    $(LOCAL_PATH)/xbin/zipalign:system/xbin/zipalign

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bin/compcache:system/bin/compcache \
    $(LOCAL_PATH)/bin/handle_compcache:system/bin/handle_compcache

# Terminal Emulator
PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/app/Term.apk:system/app/Term.apk \
    $(LOCAL_PATH)/lib/libjackpal-androidterm4.so:system/lib/libjackpal-androidterm4.so

# Copy Slim's latinime + library for gesture typing
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/lib/libjni_latinime.so:system/lib/libjni_latinime.so # \
#    $(LOCAL_PATH)/app/LatinIME.apk:system/app/LatinIME.apk

# Copy prebuilt apps
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/app/Camera2.apk:system/app/Camera2.apk \
#    $(LOCAL_PATH)/app/LowSoundFixer_v1.0.8.apk:system/priv-app/LowSoundFixer_v1.0.8.apk \
#    $(LOCAL_PATH)/app/SlimFileManager.apk:system/app/SlimFileManager.apk
