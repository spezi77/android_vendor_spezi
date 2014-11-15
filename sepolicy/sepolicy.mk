#
# This policy configuration will be used by all products that
# inherit from Spezi
#

BOARD_SEPOLICY_DIRS += \
    vendor/spezi/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    file.te \
    genfs_contexts \
    installd.te \
    mac_permissions.xml \
	vold.te
