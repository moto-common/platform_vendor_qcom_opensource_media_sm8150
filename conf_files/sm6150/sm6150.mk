CONFIG_PATH := vendor/qcom/opensource/media/$(qcom_platform)/conf_files/$(MSMSTEPPE)

# Video feature flags

# Video configuration files
PRODUCT_COPY_FILES += \
    $(CONFIG_PATH)/codec2.vendor.ext.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/codec2.vendor.ext.policy \
    $(CONFIG_PATH)/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(CONFIG_PATH)/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(CONFIG_PATH)/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
    $(CONFIG_PATH)/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml \
    $(CONFIG_PATH)/media_codecs_sdmmagpie_v0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_v1.xml \
    $(CONFIG_PATH)/media_codecs_sdmmagpie_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_v2.xml \
    $(CONFIG_PATH)/media_codecs_vendor_sdmmagpie_v0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_v1.xml \
    $(CONFIG_PATH)/media_codecs_vendor_sdmmagpie_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_v2.xml \
    $(CONFIG_PATH)/media_codecs_performance_sdmmagpie_v0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_v1.xml \
    $(CONFIG_PATH)/media_codecs_performance_sdmmagpie_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_v2.xml \
    $(CONFIG_PATH)/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(CONFIG_PATH)/system_properties.xml:$(TARGET_COPY_OUT_VENDOR)/etc/system_properties.xml

# Produce packages addition
PRODUCT_PACKAGES += \
    libcodec2_vndk.vendor \
    libcodec2_hidl@1.0.vendor
ifeq ($(TARGET_FWK_SUPPORTS_FULL_VALUEADDS),true)
  $(warning "Compiling with full value-added framework")
else
  $(warning "Compiling without full value-added framework")
endif

ifneq ($(TARGET_FWK_SUPPORTS_AV_VALUEADDS),false)
  $(warning "Enabling codec2.0 non-audio SW only for non-generic odm build variant")
  DEVICE_MANIFEST_FILE += vendor/qcom/opensource/media/$(qcom_platform)/conf_files/sm6150/c2_manifest.xml
  PRODUCT_PROPERTY_OVERRIDES += debug.stagefright.omx_default_rank=0
  PRODUCT_PROPERTY_OVERRIDES += media.settings.xml=/vendor/etc/media_profiles_vendor.xml
else
    $(warning "Compiling without value-added features")
    DEVICE_MANIFEST_FILE += vendor/qcom/opensource/media/$(qcom_platform)/conf_files/msmnile/c2_manifest.xml
endif
