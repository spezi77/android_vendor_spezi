# Inherit common omni stuff
$(call inherit-product, vendor/spezi/config/common.mk)

# Bring in all audio files
include frameworks/base/data/sounds/AllAudio.mk

# Bring in Evervolv a2sd and init.d scripts
include vendor/spezi/config/tools.mk

