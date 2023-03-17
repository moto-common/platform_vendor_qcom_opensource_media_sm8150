#MSM_VIDC_TARGET_LIST := msmnile

ifeq ($(TARGET_KERNEL_VERSION),4.14)
#MM_CORE
MM_CORE := libmm-omxcore
MM_CORE += libOmxCore

PRODUCT_PACKAGES += $(MM_CORE)

MM_VIDEO := ExoplayerDemo
MM_VIDEO += libc2dcolorconvert
MM_VIDEO += libOmxSwVdec
MM_VIDEO += libOmxSwVencMpeg4
MM_VIDEO += libOmxVdec
MM_VIDEO += libOmxVenc
MM_VIDEO += libstagefrighthw

PRODUCT_PACKAGES += $(MM_VIDEO)

ifeq ($(TARGET_BOARD_PLATFORM), sdmshrike)
include vendor/qcom/opensource/media/$(qcom_platform)/conf_files/msmnile/msmnile.mk
else
include vendor/qcom/opensource/media/$(qcom_platform)/conf_files/$(TARGET_BOARD_PLATFORM)/$(TARGET_BOARD_PLATFORM).mk
endif

endif
#Vendor property to enable Codec2 for audio and OMX for Video
PRODUCT_PROPERTY_OVERRIDES += debug.stagefright.ccodec=1
