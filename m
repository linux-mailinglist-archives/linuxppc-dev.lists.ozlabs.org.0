Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BA987F9C7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:28:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPyH6R2Tz3vvF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:28:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPVB6Y2gz3w1T
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 19:08:02 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F20B5201577;
	Tue, 19 Mar 2024 09:07:59 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B91A3201364;
	Tue, 19 Mar 2024 09:07:59 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id A118C180C2DA;
	Tue, 19 Mar 2024 16:07:57 +0800 (+08)
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
Subject: [PATCH v15 07/16] media: uapi: Add V4L2_CAP_AUDIO_M2M capability flag
Date: Tue, 19 Mar 2024 15:51:05 +0800
Message-Id: <1710834674-3285-8-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
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

V4L2_CAP_AUDIO_M2M is similar to V4L2_CAP_VIDEO_M2M flag.

It is used for audio memory to memory case.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/userspace-api/media/v4l/vidioc-querycap.rst    | 3 +++
 Documentation/userspace-api/media/videodev2.h.rst.exceptions | 1 +
 include/uapi/linux/videodev2.h                               | 1 +
 3 files changed, 5 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
index 6c57b8428356..1c0d97bf192a 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
@@ -173,6 +173,9 @@ specification the ioctl returns an ``EINVAL`` error code.
 	interface. A video overlay device typically stores captured images
 	directly in the video memory of a graphics card, with hardware
 	clipping and scaling.
+    * - ``V4L2_CAP_AUDIO_M2M``
+      - 0x00000008
+      - The device supports the audio Memory-To-Memory interface.
     * - ``V4L2_CAP_VBI_CAPTURE``
       - 0x00000010
       - The device supports the :ref:`Raw VBI Capture <raw-vbi>`
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 3e58aac4ef0b..da6d0b8e4c2c 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -197,6 +197,7 @@ replace define V4L2_CAP_META_OUTPUT device-capabilities
 replace define V4L2_CAP_DEVICE_CAPS device-capabilities
 replace define V4L2_CAP_TOUCH device-capabilities
 replace define V4L2_CAP_IO_MC device-capabilities
+replace define V4L2_CAP_AUDIO_M2M device-capabilities
 
 # V4L2 pix flags
 replace define V4L2_PIX_FMT_PRIV_MAGIC :c:type:`v4l2_pix_format`
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index b8573e9ccde6..5cc2a978fd9c 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -473,6 +473,7 @@ struct v4l2_capability {
 #define V4L2_CAP_VIDEO_CAPTURE		0x00000001  /* Is a video capture device */
 #define V4L2_CAP_VIDEO_OUTPUT		0x00000002  /* Is a video output device */
 #define V4L2_CAP_VIDEO_OVERLAY		0x00000004  /* Can do video overlay */
+#define V4L2_CAP_AUDIO_M2M		0x00000008  /* audio memory to memory */
 #define V4L2_CAP_VBI_CAPTURE		0x00000010  /* Is a raw VBI capture device */
 #define V4L2_CAP_VBI_OUTPUT		0x00000020  /* Is a raw VBI output device */
 #define V4L2_CAP_SLICED_VBI_CAPTURE	0x00000040  /* Is a sliced VBI capture device */
-- 
2.34.1

