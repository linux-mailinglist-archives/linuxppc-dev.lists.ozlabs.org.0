Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C48E27C81A4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 11:13:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6LQp5Hpgz3wQn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 20:13:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6LKl392Jz3ccC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 20:09:15 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B0C48201A42;
	Fri, 13 Oct 2023 11:09:12 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4A7702015BB;
	Fri, 13 Oct 2023 11:09:12 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 46E4F183ACAE;
	Fri, 13 Oct 2023 17:09:10 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: hverkuil@xs4all.nl,
	sakari.ailus@iki.fi,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v6 09/11] media: uapi: Add audio rate controls support
Date: Fri, 13 Oct 2023 16:31:03 +0800
Message-Id: <1697185865-27528-10-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
References: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixed point controls are used by the user to configure
the audio sample rate to driver.

Add V4L2_CID_ASRC_SOURCE_RATE and V4L2_CID_ASRC_DEST_RATE
new IDs for ASRC rate control.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../userspace-api/media/v4l/common.rst        |  1 +
 .../media/v4l/ext-ctrls-fixed-point.rst       | 36 +++++++++++++++++++
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 +++
 .../media/v4l/vidioc-queryctrl.rst            |  7 ++++
 .../media/videodev2.h.rst.exceptions          |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  5 +++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 +++
 include/media/v4l2-ctrls.h                    |  2 ++
 include/uapi/linux/v4l2-controls.h            | 13 +++++++
 include/uapi/linux/videodev2.h                |  3 ++
 10 files changed, 76 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-fixed-point.rst

diff --git a/Documentation/userspace-api/media/v4l/common.rst b/Documentation/userspace-api/media/v4l/common.rst
index ea0435182e44..35707edffb13 100644
--- a/Documentation/userspace-api/media/v4l/common.rst
+++ b/Documentation/userspace-api/media/v4l/common.rst
@@ -52,6 +52,7 @@ applicable to all devices.
     ext-ctrls-fm-rx
     ext-ctrls-detect
     ext-ctrls-colorimetry
+    ext-ctrls-fixed-point
     fourcc
     format
     planar-apis
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-fixed-point.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-fixed-point.rst
new file mode 100644
index 000000000000..2ef6e250580c
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fixed-point.rst
@@ -0,0 +1,36 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _fixed-point-controls:
+
+***************************
+Fixed Point Control Reference
+***************************
+
+These controls are intended to support an asynchronous sample
+rate converter.
+
+.. _v4l2-audio-asrc:
+
+``V4L2_CID_ASRC_SOURCE_RATE``
+    sets the resampler source rate.
+
+``V4L2_CID_ASRC_DEST_RATE``
+    sets the resampler destination rate.
+
+.. c:type:: v4l2_ctrl_fixed_point
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
+
+.. flat-table:: struct v4l2_ctrl_fixed_point
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u32
+      - ``integer``
+      - integer part of fixed point value.
+    * - __s32
+      - ``fractional``
+      - fractional part of fixed point value, which is Q31.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index f9f73530a6be..1811dabf5c74 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -295,6 +295,10 @@ still cause this situation.
       - ``p_av1_film_grain``
       - A pointer to a struct :c:type:`v4l2_ctrl_av1_film_grain`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_AV1_FILM_GRAIN``.
+    * - struct :c:type:`v4l2_ctrl_fixed_point` *
+      - ``p_fixed_point``
+      - A pointer to a struct :c:type:`v4l2_ctrl_fixed_point`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_FIXED_POINT``.
     * - void *
       - ``ptr``
       - A pointer to a compound type which can be an N-dimensional array
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 4d38acafe8e1..9285f4f39eed 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -549,6 +549,13 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_ctrl_av1_film_grain`, containing AV1 Film Grain
         parameters for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_FIXED_POINT``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_fixed_point`, containing parameter which has
+        integer part and fractional part, i.e. audio sample rate.
+
 
 .. raw:: latex
 
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index e61152bb80d1..2faa5a2015eb 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -167,6 +167,7 @@ replace symbol V4L2_CTRL_TYPE_AV1_SEQUENCE :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AV1_FRAME :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AV1_FILM_GRAIN :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_FIXED_POINT :c:type:`v4l2_ctrl_type`
 
 # V4L2 capability defines
 replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index a662fb60f73f..7a616ac91059 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1168,6 +1168,8 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		if (!area->width || !area->height)
 			return -EINVAL;
 		break;
+	case V4L2_CTRL_TYPE_FIXED_POINT:
+		break;
 
 	default:
 		return -EINVAL;
@@ -1868,6 +1870,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_AREA:
 		elem_size = sizeof(struct v4l2_area);
 		break;
+	case V4L2_CTRL_TYPE_FIXED_POINT:
+		elem_size = sizeof(struct v4l2_ctrl_fixed_point);
+		break;
 	default:
 		if (type < V4L2_CTRL_COMPOUND_TYPES)
 			elem_size = sizeof(s32);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 8696eb1cdd61..d8f232df6b6a 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1602,6 +1602,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
 		break;
+	case V4L2_CID_ASRC_SOURCE_RATE:
+	case V4L2_CID_ASRC_DEST_RATE:
+		*type = V4L2_CTRL_TYPE_FIXED_POINT;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 59679a42b3e7..645e4cccafc7 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -56,6 +56,7 @@ struct video_device;
  * @p_av1_tile_group_entry:	Pointer to an AV1 tile group entry structure.
  * @p_av1_frame:		Pointer to an AV1 frame structure.
  * @p_av1_film_grain:		Pointer to an AV1 film grain structure.
+ * @p_fixed_point:		Pointer to a struct v4l2_ctrl_fixed_point.
  * @p:				Pointer to a compound value.
  * @p_const:			Pointer to a constant compound value.
  */
@@ -89,6 +90,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_av1_tile_group_entry *p_av1_tile_group_entry;
 	struct v4l2_ctrl_av1_frame *p_av1_frame;
 	struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
+	struct v4l2_ctrl_fixed_point *p_fixed_point;
 	void *p;
 	const void *p_const;
 };
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index c3604a0a3e30..91096259e3ea 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -112,6 +112,8 @@ enum v4l2_colorfx {
 
 /* last CID + 1 */
 #define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
+#define V4L2_CID_ASRC_SOURCE_RATE		(V4L2_CID_BASE + 45)
+#define V4L2_CID_ASRC_DEST_RATE			(V4L2_CID_BASE + 46)
 
 /* USER-class private control IDs */
 
@@ -3488,4 +3490,15 @@ struct v4l2_ctrl_av1_film_grain {
 #define V4L2_CID_MPEG_MFC51_BASE        V4L2_CID_CODEC_MFC51_BASE
 #endif
 
+/**
+ * struct v4l2_ctrl_fixed_point - fixed point parameter.
+ *
+ * @rate_integer: integer part of fixed point value.
+ * @rate_fractional: fractional part of fixed point value
+ */
+struct v4l2_ctrl_fixed_point {
+	__u32 integer;
+	__u32 fractional;
+};
+
 #endif
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 2ac7b989394c..3ef32c09c2fa 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1888,6 +1888,7 @@ struct v4l2_ext_control {
 		struct v4l2_ctrl_av1_tile_group_entry __user *p_av1_tile_group_entry;
 		struct v4l2_ctrl_av1_frame __user *p_av1_frame;
 		struct v4l2_ctrl_av1_film_grain __user *p_av1_film_grain;
+		struct v4l2_ctrl_fixed_point __user *p_fixed_point;
 		void __user *ptr;
 	};
 } __attribute__ ((packed));
@@ -1966,6 +1967,8 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
 	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
 	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
+
+	V4L2_CTRL_TYPE_FIXED_POINT          = 0x290,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
-- 
2.34.1

