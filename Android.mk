LOCAL_PATH := $(call my-dir)

ifneq ($(filter dubai,$(TARGET_DEVICE)),)
subdir_makefiles=$(call first-makefiles-under,$(LOCAL_PATH))
$(foreach mk,$(subdir_makefiles),$(info including $(mk) ...)$(eval include $(mk)))

include $(CLEAR_VARS)

RFS_MSM_ADSP_SYMLINKS := $(TARGET_OUT_VENDOR)/rfs/msm/adsp/
$(RFS_MSM_ADSP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MSM ADSP folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly/vendor
	$(hide) ln -sf /data/vendor/tombstones/rfs/lpass $@/ramdumps
	$(hide) ln -sf /mnt/vendor/persist/rfs/msm/adsp $@/readwrite
	$(hide) ln -sf /mnt/vendor/persist/rfs/shared $@/shared
	$(hide) ln -sf /mnt/vendor/persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /vendor/firmware_mnt $@/readonly/firmware
	$(hide) ln -sf /vendor/firmware $@/readonly/vendor/firmware

RFS_MSM_CDSP_SYMLINKS := $(TARGET_OUT_VENDOR)/rfs/msm/cdsp/
$(RFS_MSM_CDSP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MSM CDSP folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly/vendor
	$(hide) ln -sf /data/vendor/tombstones/rfs/cdsp $@/ramdumps
	$(hide) ln -sf /mnt/vendor/persist/rfs/msm/cdsp $@/readwrite
	$(hide) ln -sf /mnt/vendor/persist/rfs/shared $@/shared
	$(hide) ln -sf /mnt/vendor/persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /vendor/firmware_mnt $@/readonly/firmware
	$(hide) ln -sf /vendor/firmware $@/readonly/vendor/firmware

RFS_MSM_MPSS_SYMLINKS := $(TARGET_OUT_VENDOR)/rfs/msm/mpss/
$(RFS_MSM_MPSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MSM MPSS folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly/vendor
	$(hide) ln -sf /data/vendor/tombstones/rfs/modem $@/ramdumps
	$(hide) ln -sf /mnt/vendor/persist/rfs/msm/mpss $@/readwrite
	$(hide) ln -sf /mnt/vendor/persist/rfs/shared $@/shared
	$(hide) ln -sf /mnt/vendor/persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /vendor/firmware_mnt $@/readonly/firmware
	$(hide) ln -sf /vendor/firmware $@/readonly/vendor/firmware

RFS_MSM_SLPI_SYMLINKS := $(TARGET_OUT_VENDOR)/rfs/msm/slpi/
$(RFS_MSM_SLPI_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MSM SLPI folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly/vendor
	$(hide) ln -sf /data/vendor/tombstones/rfs/slpi $@/ramdumps
	$(hide) ln -sf /mnt/vendor/persist/rfs/msm/slpi $@/readwrite
	$(hide) ln -sf /mnt/vendor/persist/rfs/shared $@/shared
	$(hide) ln -sf /mnt/vendor/persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /vendor/firmware_mnt $@/readonly/firmware
	$(hide) ln -sf /vendor/firmware $@/readonly/vendor/firmware

RFS_MSM_WPSS_SYMLINKS := $(TARGET_OUT_VENDOR)/rfs/msm/wpss/
$(RFS_MSM_WPSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MSM WPSS folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly/vendor
	$(hide) ln -sf /data/vendor/tombstones/rfs/wpss $@/ramdumps
	$(hide) ln -sf /mnt/vendor/persist/rfs/msm/wpss $@/readwrite
	$(hide) ln -sf /mnt/vendor/persist/rfs/shared $@/shared
	$(hide) ln -sf /mnt/vendor/persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /vendor/firmware_mnt $@/readonly/firmware
	$(hide) ln -sf /vendor/firmware $@/readonly/vendor/firmware

WLAN_FIRMWARE_SYMLINKS := $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld
$(WLAN_FIRMWARE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating WLAN firmware symlinks: $@"
	@mkdir -p $@/wlan
	@mkdir -p $@/qca6390
	@mkdir -p $@/qca6750
	$(hide) ln -sf /vendor/etc/wifi/WCNSS_qcom_cfg.ini $@/WCNSS_qcom_cfg.ini
	$(hide) ln -sf /mnt/vendor/persist/wlan/wlan_mac.bin $@/wlan/wlan_mac.bin
	$(hide) ln -sf /vendor/etc/wifi/wlan/WCNSS_qcom_cfg.ini $@/wlan/WCNSS_qcom_cfg.ini
	$(hide) ln -sf /vendor/etc/wifi/wlan/WCNSS_mot_cfg.ini $@/wlan/WCNSS_mot_cfg.ini
	$(hide) ln -sf /mnt/vendor/persist/qca6390/wlan_mac.bin $@/qca6390/wlan_mac.bin
	$(hide) ln -sf /vendor/etc/wifi/qca6390/WCNSS_qcom_cfg.ini $@/qca6390/WCNSS_qcom_cfg.ini
	$(hide) ln -sf /vendor/etc/wifi/qca6390/WCNSS_mot_cfg.ini $@/qca6390/WCNSS_mot_cfg.ini
	$(hide) ln -sf /mnt/vendor/persist/qca6750/wlan_mac.bin $@/qca6750/wlan_mac.bin
	$(hide) ln -sf /vendor/etc/wifi/qca6750/WCNSS_qcom_cfg.ini $@/qca6750/WCNSS_qcom_cfg.ini
	$(hide) ln -sf /vendor/etc/wifi/qca6750/WCNSS_mot_cfg.ini $@/qca6750/WCNSS_mot_cfg.ini

ALL_DEFAULT_INSTALLED_MODULES += $(RFS_MSM_ADSP_SYMLINKS) $(RFS_MSM_CDSP_SYMLINKS) $(RFS_MSM_MPSS_SYMLINKS) \
                                 $(RFS_MSM_WPSS_SYMLINKS) $(RFS_MSM_SLPI_SYMLINKS) $(WLAN_FIRMWARE_SYMLINKS)

IMS_LIBRARIES := libimscamera_jni.so libimsmedia_jni.so
IMS_SYMLINKS := $(addprefix $(TARGET_OUT_SYSTEM_EXT_APPS_PRIVILEGED)/ims/lib/arm64/,$(notdir $(IMS_LIBRARIES)))
$(IMS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/system_ext/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(IMS_SYMLINKS)

CNE_LIBRARIES := libvndfwk_detect_jni.qti.so
CNE_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR_APPS)/CneApp/lib/arm64/,$(notdir $(CNE_LIBRARIES)))
$(CNE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /vendor/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(CNE_SYMLINKS)

EXPAT_SYMLINKS := $(TARGET_OUT_VENDOR_EXECUTABLES)/expat
$(EXPAT_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Expat bin link: $@"
	@rm -rf $@
	@mkdir -p $(dir $@)
	$(hide) ln -sf motobox $@

ALL_DEFAULT_INSTALLED_MODULES += $(EXPAT_SYMLINKS)

endif
