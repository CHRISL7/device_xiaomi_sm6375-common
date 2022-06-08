#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# Enable virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/android_t_baseline.mk)
PRODUCT_VIRTUAL_AB_COMPRESSION_METHOD := gz

# APEX's
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.service

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_holi)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_policy_configuration.xml

PRODUCT_SYSTEM_PROPERTIES += \
    ro.config.vc_call_vol_steps=11

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.audio.ring.filter.mask=0 \
    persist.vendor.audio.voicecall.speaker.stereo=true \
    ro.vendor.audio.misound.bluetooth.enable=true \
    ro.vendor.audio.sos=true \
    ro.vendor.audio.game.effect=true \
    ro.vendor.audio.game.mode=true \
    ro.vendor.audio.miui.karaoke.tencent.show=false \
    ro.vendor.audio.ring.filter=true \
    ro.vendor.audio.soundfx.type=mi \
    ro.vendor.audio.scenario.support=true \
    ro.vendor.audio.sfx.scenario=true \
    ro.vendor.audio.sfx.earadj=true \
    ro.vendor.audio.soundfx.usb=true \
    ro.vendor.audio.voice.change.support=true

PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.audio.soundtrigger.xiaomievent=1 \
    ro.vendor.audio.soundtrigger.pangaea=1 \
    ro.vendor.audio.soundtrigger.sva-5.0=1 \
    ro.vendor.audio.soundtrigger=sva \
    ro.vendor.audio.soundtrigger.lowpower=true \
    ro.vendor.audio.soundtrigger.training.level=50 \
    ro.vendor.audio.soundtrigger.xanzn.gmm.level=40 \
    ro.vendor.audio.soundtrigger.xanzn.gmm.user.level=30 \
    ro.vendor.audio.soundtrigger.xanzn.cnn.level=70 \
    ro.vendor.audio.soundtrigger.xanzn.vop.level=10 \
    ro.vendor.audio.soundtrigger.xatx.gmm.level=30 \
    ro.vendor.audio.soundtrigger.xatx.gmm.user.level=40 \
    ro.vendor.audio.soundtrigger.xatx.cnn.level=45 \
    ro.vendor.audio.soundtrigger.xatx.vop.level=0 \
    ro.vendor.audio.soundtrigger.appdefine.gmm.level=55 \
    ro.vendor.audio.soundtrigger.appdefine.gmm.user.level=65 \
    ro.vendor.audio.soundtrigger.appdefine.cnn.level=45 \
    ro.vendor.audio.soundtrigger.appdefine.vop.level=10 \
    ro.vendor.audio.soundtrigger.snr=16

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery \
    android.hardware.boot@1.2-service

# Bluetooth
PRODUCT_PRODUCT_PROPERTIES  += \
    bluetooth.hardware.power.operating_voltage_mv=3700 \
    bluetooth.hardware.power.idle_cur_ma=3 \
    bluetooth.hardware.power.rx_cur_ma=20 \
    bluetooth.hardware.power.tx_cur_ma=36

PRODUCT_SYSYEM_EXT_PROPERTIES  += \
    persist.vendor.btstack.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aptxadaptiver2-aac-ldac

PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.bluetooth.defaultabsvol=false \
    ro.vendor.bluetooth.wipower=false \
    persist.bluetooth.disableabsvol=true \
    persist.vendor.bluetooth.modem_nv_support=true \
    persist.vendor.qcom.bluetooth.aac_vbr_ctl.enabled=false \
    persist.vendor.qcom.bluetooth.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac-aptxadaptive \
    persist.vendor.qcom.bluetooth.enable.splita2dp=true \
    persist.vendor.qcom.bluetooth.scram.enabled=false \
    persist.vendor.qcom.bluetooth.twsp_state.enabled=false \
    vendor.qcom.bluetooth.soc=hastings

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    libcamera2ndk_vendor \
    libstdc++.vendor \
    vendor.qti.hardware.camera.device@1.0.vendor \
    vendor.qti.hardware.camera.postproc@1.0.vendor

PRODUCT_VENDOR_PROPERTIES += \
    camera.disable_zsl_mode=1 \
    sys.haptic.ignoreWhenCamera=true

# Charger
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.charge.oneTrack=true

# Consumer IR
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

# Crypto
PRODUCT_VENDOR_PROPERTIES += \
    ro.crypto.dm_default_key.options_format.version=2 \
    ro.crypto.volume.metadata.method=dm-default-key

# Dex
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := verify

# Display
PRODUCT_PACKAGES += \
    android.frameworks.displayservice@1.0.vendor \
    libdisplayconfig.qti

PRODUCT_ODM_PROPERTIES += \
    vendor.display.enable_rounded_corner=0 \
    vendor.display.use_smooth_motion=0 \

PRODUCT_VENDOR_PROPERTIES += \
    debug.sf.disable_backpressure=1 \
    ro.vendor.display.sensortype=2 \
    ro.vendor.display.svi=1 \
    vendor.display.qdcm.mode_combine=2 \
    vendor.display.svi.config=1 \
    vendor.display.svi.config_path=/vendor/etc/SVIConfig.xml

# DPM
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.dpm.nsrm.bkg.evt=3955 \
    persist.vendor.dpmhalservice.enable=1

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4.vendor \
    android.hardware.drm-service.clearkey

PRODUCT_VENDOR_PROPERTIES += \
    drm.service.enabled=true

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.xiaomi \
    vendor.goodix.hardware.biometrics.fingerprint@2.1.vendor

PRODUCT_SYSTEM_PROPERTIES += \
    sys.fp.miui.token=0

# FM
BOARD_HAVE_QCOM_FM := true

# FRP
PRODUCT_VENDOR_PROPERTIES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp

#  FUSE passthrough
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.fuse.passthrough.enable=true

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor

PRODUCT_VENDOR_PROPERTIES += \
    vendor.gatekeeper.disable_spu=true

# Input
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/idc/,$(TARGET_COPY_OUT_SYSTEM)/usr/idc) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/keylayout/,$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout)

# Incremental FS
PRODUCT_VENDOR_PROPERTIES += \
    ro.incremental.enable=1

# Keyguard
PRODUCT_SYSTEM_PROPERTIES += \
    persist.wm.enable_remote_keyguard_animation=0

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1.vendor

# LMK
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.mms.use_legacy=true \
    persist.sys.mms.kill_fas_cached_idle=false \
    persist.sys.spc.protect.critical.count=2 \
    ro.lmk.kill_heaviest_task=true \
    ro.lmk.kill_timeout_ms=15

# Media
PRODUCT_PACKAGES += \
    libstagefright_omx \
    libstagefright_foundation \
    libcodec2_soft_common.vendor \
    libsfplugin_ccodec_utils.vendor

PRODUCT_PRODUCT_PROPERTIES += \
    debug.media.transcoding.codec_max_operating_rate_720P=240 \
    debug.media.transcoding.codec_max_operating_rate_1080P=120

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    media.aac_51_output_enabled=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-fma2dp=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-player=true \
    media.stagefright.enable-qcp=true \
    media.stagefright.enable-scan=true \
    mmp.enable.3g2=true \
    persist.mm.enable.prefetch=true

PRODUCT_VENDOR_PROPERTIES += \
    debug.stagefright.c2inputsurface=-1

# Neural networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor

# NFC
PRODUCT_SYSTEM_PROPERTIES += \
    ro.nfc.port=I2C

PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.se.type=HCE,UICC

# Overlays
PRODUCT_PACKAGES += \
    AOSPAHoliFrameworksOverlay \
    HoliCarrierConfigOverlay \
    HoliFrameworksOverlay \
    HoliSettingsOverlay \
    HoliSystemUIOverlay \
    HoliWifiOverlay

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Perf
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/perf/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# Public libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# QCOM/COMMON
TARGET_BOARD_PLATFORM := holi
TARGET_SEPOLICY_DIR := holi
TARGET_EXCLUDE_QCOM_SEPOLICY := true

TARGET_COMMON_QTI_COMPONENTS += \
    adreno \
    alarm \
    av \
    audio \
    bt \
    charging \
    display \
    gps \
    media \
    overlay \
    perf \
    telephony \
    usb \
    vibrator \
    wfd

# Radio
PRODUCT_PRODUCT_PROPERTIES += \
    persist.vendor.radio.enable_temp_dds=true \
    ro.vendor.radio.5g=3 \
    ro.vendor.radio.features_common=3 \
    ro.vendor.radio.fastdormancy=true

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.data.iwlan.enable=true \
    persist.vendor.radio.atfwd.start=true \
    persist.vendor.radio.data_ltd_sys_ind=1 \
    persist.vendor.radio.dynamic_load_mbn=3 \
    persist.vendor.radio.dynamic_sar=1 \
    persist.vendor.radio.force_ltd_sys_ind=1 \
    persist.vendor.radio.force_on_dc=true \
    persist.vendor.radio.hidl_dev_service=true \
    persist.vendor.radio.manual_nw_rej_ct=1 \
    persist.vendor.radio.mbn_trace=true \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.default_cdma_sub=0 \
    ro.vendor.use_data_netmgrd=true

# Rootdir
PRODUCT_PACKAGES += \
    init.batterysecret.rc \
    init.class_main.sh \
    init.holi.perf.rc \
    init.holi.rc \
    init.goodix.events.sh \
    init.mi.btmac.sh \
    init.kernel.post_boot.sh \
    init.kernel.post_boot-blair.sh \
    init.kernel.post_boot-holi.sh \
    init.qcom.sh \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.rc \
    init.qti.early_init.sh \
    init.qti.kernel.rc \
    init.qti.kernel.sh \
    init.target.rc \
    init.xiaomi.fingerprint.rc \
    init.xiaomi.rc \
    ueventd.qcom.rc \
    ueventd.xiaomi.rc \
    vendor_modprobe.sh

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/charger_fstab.qti:$(TARGET_COPY_OUT_VENDOR)/etc/charger_fstab.qti \
    $(LOCAL_PATH)/init/fstab.default:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.default \
    $(LOCAL_PATH)/init/fstab.default:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.default \
    $(LOCAL_PATH)/init/fstab.default:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.default \
    $(LOCAL_PATH)/init/fstab.emmc:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.emmc \
    $(LOCAL_PATH)/init/fstab.emmc:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.emmc \
    $(LOCAL_PATH)/init/fstab.emmc:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.emmc \
    $(LOCAL_PATH)/init/init.recovery.qcom.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.qcom.rc

# Sensors
PRODUCT_PACKAGES += \
    android.frameworks.sensorservice@1.0.vendor \
    android.hardware.sensors@2.0-ScopedWakelock.vendor \
    android.hardware.sensors@2.1-service.xiaomi-multihal \
    libsensorndkbridge

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.sensors.debug.ssc_qmi_debug=true \
    persist.vendor.sensors.hal_trigger_ssr=false \
    persist.vendor.sensors.enable.rt_task=false \
    persist.vendor.sensors.support_direct_channel=false \
    persist.vendor.sensors.enable.bypass_worker=true \
    persist.vendor.sensors.sync_request=true

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/xiaomi

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.qti

PRODUCT_VENDOR_PROPERTIES += \
    vendor.sys.thermal.data.path=/data/vendor/thermal/

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# USB
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.usb.config=mtp,adb
endif

# Vibrator
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/excluded-input-devices.xml:$(TARGET_COPY_OUT_VENDOR)/etc/excluded-input-devices.xml

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    libwifi-hal-ctrl \
    libwifi-hal-qcom \
    libwpa_client \
    vendor.qti.hardware.wifi.hostapd@1.2.vendor \
    vendor.qti.hardware.wifi.supplicant@2.1.vendor \
    wpa_cli \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/wifi/,$(TARGET_COPY_OUT_VENDOR)/etc/wifi)

PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.wlan.dbs=0 \
    wifi.aware.interface=wifi-aware0

# WiFi Display
PRODUCT_PACKAGES += \
    libwfdaac_vendor

# Zygote
PRODUCT_SYSTEM_PROPERTIES += \
    zygote.critical_window.minute=10

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/sm6375-common/sm6375-common-vendor.mk)
