# Common board config for crosshatch, blueline

BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2

BOARD_KERNEL_IMAGE_NAME := Image.lz4
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_ADDITIONAL_FLAGS := \
    DTC=$(shell pwd)/prebuilts/misc/$(HOST_OS)-x86/dtc/dtc \
    MKDTIMG=$(shell pwd)/prebuilts/misc/$(HOST_OS)-x86/libufdt/mkdtimg
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CLANG_VERSION := $(shell sh -c "find prebuilts/clang/host/linux-x86/ -type f -name clang -printf \"%T@ %Tc %p\n\" | sort -n | tail -n1 | sed 's/.*clang-\(.*\)\/bin.*/\1/'")
TARGET_KERNEL_CONFIG := trm_crosshatch_defconfig
TARGET_KERNEL_SOURCE := kernel/google/msm-4.9

# vendor.img
ifneq ($(PRODUCT_USE_DYNAMIC_PARTITIONS), true)
BOARD_VENDORIMAGE_PARTITION_SIZE := 805306368
endif
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

# Reserve space for gapps install
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 314572800
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 314572800
