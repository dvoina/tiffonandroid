LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_ARM_MODE := arm
LOCAL_JPEG_SRC_FILES := \
	jpeg-6b/jcapimin.c jpeg-6b/jcapistd.c jpeg-6b/jccoefct.c jpeg-6b/jccolor.c jpeg-6b/jcdctmgr.c jpeg-6b/jchuff.c \
    jpeg-6b/jcinit.c jpeg-6b/jcmainct.c jpeg-6b/jcmarker.c jpeg-6b/jcmaster.c jpeg-6b/jcomapi.c jpeg-6b/jcparam.c \
    jpeg-6b/jcphuff.c jpeg-6b/jcprepct.c jpeg-6b/jcsample.c jpeg-6b/jctrans.c jpeg-6b/jdapimin.c jpeg-6b/jdapistd.c \
    jpeg-6b/jdatadst.c jpeg-6b/jdatasrc.c jpeg-6b/jdcoefct.c jpeg-6b/jdcolor.c jpeg-6b/jddctmgr.c jpeg-6b/jdhuff.c \
    jpeg-6b/jdinput.c jpeg-6b/jdmainct.c jpeg-6b/jdmarker.c jpeg-6b/jdmaster.c jpeg-6b/jdmerge.c jpeg-6b/jdphuff.c \
    jpeg-6b/jdpostct.c jpeg-6b/jdsample.c jpeg-6b/jdtrans.c jpeg-6b/jerror.c jpeg-6b/jfdctflt.c jpeg-6b/jfdctfst.c \
    jpeg-6b/jfdctint.c jpeg-6b/jidctflt.c jpeg-6b/jidctfst.c jpeg-6b/jidctint.c jpeg-6b/jidctred.c jpeg-6b/jquant1.c \
    jpeg-6b/jquant2.c jpeg-6b/jutils.c jpeg-6b/jmemmgr.c jpeg-6b/jmemansi.c 

LOCAL_TIFF_SRC_FILES := \
	tiff/libtiff/tif_dirread.c \
	tiff/libtiff/tif_zip.c \
	tiff/libtiff/tif_flush.c \
	tiff/libtiff/tif_next.c \
	tiff/libtiff/tif_ojpeg.c \
	tiff/libtiff/tif_dirwrite.c \
	tiff/libtiff/tif_dirinfo.c \
	tiff/libtiff/tif_dir.c \
	tiff/libtiff/tif_compress.c \
	tiff/libtiff/tif_close.c \
	tiff/libtiff/tif_tile.c \
	tiff/libtiff/tif_open.c \
	tiff/libtiff/tif_getimage.c \
	tiff/libtiff/tif_pixarlog.c \
	tiff/libtiff/tif_warning.c \
	tiff/libtiff/tif_dumpmode.c \
	tiff/libtiff/tif_jpeg.c \
	tiff/libtiff/tif_jbig.c \
	tiff/libtiff/tif_predict.c \
	tiff/libtiff/mkg3states.c \
	tiff/libtiff/tif_write.c \
	tiff/libtiff/tif_error.c \
	tiff/libtiff/tif_version.c \
	tiff/libtiff/tif_print.c \
	tiff/libtiff/tif_color.c \
	tiff/libtiff/tif_read.c \
	tiff/libtiff/tif_extension.c \
	tiff/libtiff/tif_thunder.c \
	tiff/libtiff/tif_lzw.c \
	tiff/libtiff/tif_fax3.c \
	tiff/libtiff/tif_luv.c \
	tiff/libtiff/tif_codec.c \
	tiff/libtiff/tif_unix.c \
	tiff/libtiff/tif_packbits.c \
	tiff/libtiff/tif_aux.c \
	tiff/libtiff/tif_fax3sm.c \
	tiff/libtiff/tif_swab.c \
	tiff/libtiff/tif_strip.c

LOCAL_TIFF_SRC_FILES += tiff/port/lfind.c 
###########################################################

LOCAL_SRC_FILES:= $(LOCAL_TIFF_SRC_FILES) \
    $(LOCAL_JPEG_SRC_FILES)
LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/tiff/libtiff \
	$(LOCAL_PATH)/jpeg
LOCAL_CFLAGS += -DAVOID_TABLES 
LOCAL_CFLAGS += -O3 -fstrict-aliasing -fprefetch-loop-arrays
LOCAL_MODULE:= libtiff
LOCAL_LDLIBS := -lz \
	-L $(LOCAL_PATH)/libs

#LOCAL_PRELINK_MODULE:=false
include $(BUILD_SHARED_LIBRARY)


include $(CLEAR_VARS)

LOCAL_MODULE := tiffdecoder

LOCAL_CFLAGS := -DANDROID_NDK

LOCAL_SRC_FILES := \
	tiffdecoder.c

LOCAL_LDLIBS := -ldl -llog
LOCAL_SHARED_LIBRARIES := tiff
include $(BUILD_SHARED_LIBRARY)
