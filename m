Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7EE7B17C3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 11:42:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rx7mq2nFVz3cjY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 19:42:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rx7gg4tTfz3cPJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 19:37:51 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1FDB81A1C94;
	Thu, 28 Sep 2023 11:37:49 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AC2801A1C8E;
	Thu, 28 Sep 2023 11:37:48 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B5AD51802183;
	Thu, 28 Sep 2023 17:37:46 +0800 (+08)
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
Subject: [RFC PATCH v5 09/11] media: uapi: define audio sample format fourcc type
Date: Thu, 28 Sep 2023 17:00:17 +0800
Message-Id: <1695891619-32393-10-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1695891619-32393-1-git-send-email-shengjiu.wang@nxp.com>
References: <1695891619-32393-1-git-send-email-shengjiu.wang@nxp.com>
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

The audio sample format definition is from alsa,
the header file is include/uapi/sound/asound.h, but
don't include this header file directly, because in
user space, there is another copy in alsa-lib.
There will be conflict in userspace for include
videodev2.h & asound.h and asoundlib.h

Here still use the fourcc format.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../userspace-api/media/v4l/pixfmt-audio.rst  | 277 ++++++++++++++++++
 .../userspace-api/media/v4l/pixfmt.rst        |   1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  51 ++++
 include/uapi/linux/videodev2.h                |  56 ++++
 4 files changed, 385 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audio.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-audio.rst b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
new file mode 100644
index 000000000000..6ff114dfc2d1
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
@@ -0,0 +1,277 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _pixfmt-audio:
+
+*************
+Audio Formats
+*************
+
+These formats are used for :ref:`audiomem2mem` interface only.
+
+.. tabularcolumns:: |p{5.8cm}|p{1.2cm}|p{10.3cm}|
+
+.. cssclass:: longtable
+
+.. flat-table:: Audio Format
+    :header-rows:  1
+    :stub-columns: 0
+    :widths:       3 1 4
+
+    * - Identifier
+      - Code
+      - Details
+    * .. _V4L2-AUDIO-FMT-S8:
+
+      - ``V4L2_AUDIO_FMT_S8``
+      - 'S8'
+      - Correspond to SNDRV_PCM_FORMAT_S8 in ALSA
+    * .. _V4L2-AUDIO-FMT-U8:
+
+      - ``V4L2_AUDIO_FMT_U8``
+      - 'U8'
+      - Correspond to SNDRV_PCM_FORMAT_U8 in ALSA
+    * .. _V4L2-AUDIO-FMT-S16-LE:
+
+      - ``V4L2_AUDIO_FMT_S16_LE``
+      - 'S16_LE'
+      - Correspond to SNDRV_PCM_FORMAT_S16_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-S16-BE:
+
+      - ``V4L2_AUDIO_FMT_S16_BE``
+      - 'S16_BE'
+      - Correspond to SNDRV_PCM_FORMAT_S16_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-U16-LE:
+
+      - ``V4L2_AUDIO_FMT_U16_LE``
+      - 'U16_LE'
+      - Correspond to SNDRV_PCM_FORMAT_U16_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-U16-BE:
+
+      - ``V4L2_AUDIO_FMT_U16_BE``
+      - 'U16_BE'
+      - Correspond to SNDRV_PCM_FORMAT_U16_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-S24-LE:
+
+      - ``V4L2_AUDIO_FMT_S24_LE``
+      - 'S24_LE'
+      - Correspond to SNDRV_PCM_FORMAT_S24_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-S24-BE:
+
+      - ``V4L2_AUDIO_FMT_S24_BE``
+      - 'S24_BE'
+      - Correspond to SNDRV_PCM_FORMAT_S24_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-U24-LE:
+
+      - ``V4L2_AUDIO_FMT_U24_LE``
+      - 'U24_LE'
+      - Correspond to SNDRV_PCM_FORMAT_U24_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-U24-BE:
+
+      - ``V4L2_AUDIO_FMT_U24_BE``
+      - 'U24_BE'
+      - Correspond to SNDRV_PCM_FORMAT_U24_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-S32-LE:
+
+      - ``V4L2_AUDIO_FMT_S32_LE``
+      - 'S32_LE'
+      - Correspond to SNDRV_PCM_FORMAT_S32_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-S32-BE:
+
+      - ``V4L2_AUDIO_FMT_S32_BE``
+      - 'S32_BE'
+      - Correspond to SNDRV_PCM_FORMAT_S32_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-U32-LE:
+
+      - ``V4L2_AUDIO_FMT_U32_LE``
+      - 'U32_LE'
+      - Correspond to SNDRV_PCM_FORMAT_U32_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-U32-BE:
+
+      - ``V4L2_AUDIO_FMT_U32_BE``
+      - 'U32_BE'
+      - Correspond to SNDRV_PCM_FORMAT_U32_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-FLOAT-LE:
+
+      - ``V4L2_AUDIO_FMT_FLOAT_LE``
+      - 'FLOAT_LE'
+      - Correspond to SNDRV_PCM_FORMAT_FLOAT_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-FLOAT-BE:
+
+      - ``V4L2_AUDIO_FMT_FLOAT_BE``
+      - 'FLOAT_BE'
+      - Correspond to SNDRV_PCM_FORMAT_FLOAT_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-FLOAT64-LE:
+
+      - ``V4L2_AUDIO_FMT_FLOAT64_LE``
+      - 'FLOAT64_LE'
+      - Correspond to SNDRV_PCM_FORMAT_FLOAT64_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-FLOAT64-BE:
+
+      - ``V4L2_AUDIO_FMT_FLOAT64_BE``
+      - 'FLOAT64_BE'
+      - Correspond to SNDRV_PCM_FORMAT_FLOAT64_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-IEC958-SUBFRAME-LE:
+
+      - ``V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE``
+      - 'IEC958_SUBFRAME_LE'
+      - Correspond to SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-IEC958-SUBFRAME-BE:
+
+      - ``V4L2_AUDIO_FMT_IEC958_SUBFRAME_BE``
+      - 'IEC958_SUBFRAME_BE'
+      - Correspond to SNDRV_PCM_FORMAT_IEC958_SUBFRAME_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-MU-LAW:
+
+      - ``V4L2_AUDIO_FMT_MU_LAW``
+      - 'MU_LAW'
+      - Correspond to SNDRV_PCM_FORMAT_MU_LAW in ALSA
+    * .. _V4L2-AUDIO-FMT-A-LAW:
+
+      - ``V4L2_AUDIO_FMT_A_LAW``
+      - 'A_LAW'
+      - Correspond to SNDRV_PCM_FORMAT_A_LAW in ALSA
+    * .. _V4L2-AUDIO-FMT-IMA-ADPCM:
+
+      - ``V4L2_AUDIO_FMT_IMA_ADPCM``
+      - 'IMA_ADPCM'
+      - Correspond to SNDRV_PCM_FORMAT_IMA_ADPCM in ALSA
+    * .. _V4L2-AUDIO-FMT-MPEG:
+
+      - ``V4L2_AUDIO_FMT_MPEG``
+      - 'MPEG'
+      - Correspond to SNDRV_PCM_FORMAT_MPEG in ALSA
+    * .. _V4L2-AUDIO-FMT-GSM:
+
+      - ``V4L2_AUDIO_FMT_GSM``
+      - 'GSM'
+      - Correspond to SNDRV_PCM_FORMAT_GSM in ALSA
+    * .. _V4L2-AUDIO-FMT-S20-LE:
+
+      - ``V4L2_AUDIO_FMT_S20_LE``
+      - 'S20_LE'
+      - Correspond to SNDRV_PCM_FORMAT_S20_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-S20-BE:
+
+      - ``V4L2_AUDIO_FMT_S20_BE``
+      - 'S20_BE'
+      - Correspond to SNDRV_PCM_FORMAT_S20_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-U20-LE:
+
+      - ``V4L2_AUDIO_FMT_U20_LE``
+      - 'U20_LE'
+      - Correspond to SNDRV_PCM_FORMAT_U20_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-U20-BE:
+
+      - ``V4L2_AUDIO_FMT_U20_BE``
+      - 'U20_BE'
+      - Correspond to SNDRV_PCM_FORMAT_U20_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-SPECIAL:
+
+      - ``V4L2_AUDIO_FMT_SPECIAL``
+      - 'SPECIAL'
+      - Correspond to SNDRV_PCM_FORMAT_SPECIAL in ALSA
+    * .. _V4L2-AUDIO-FMT-S24-3LE:
+
+      - ``V4L2_AUDIO_FMT_S24_3LE``
+      - 'S24_3LE'
+      - Correspond to SNDRV_PCM_FORMAT_S24_3LE in ALSA
+    * .. _V4L2-AUDIO-FMT-S24-3BE:
+
+      - ``V4L2_AUDIO_FMT_S24_3BE``
+      - 'S24_3BE'
+      - Correspond to SNDRV_PCM_FORMAT_S24_3BE in ALSA
+    * .. _V4L2-AUDIO-FMT-U24-3LE:
+
+      - ``V4L2_AUDIO_FMT_U24_3LE``
+      - 'U24_3LE'
+      - Correspond to SNDRV_PCM_FORMAT_U24_3LE in ALSA
+    * .. _V4L2-AUDIO-FMT-U24-3BE:
+
+      - ``V4L2_AUDIO_FMT_U24_3BE``
+      - 'U24_3BE'
+      - Correspond to SNDRV_PCM_FORMAT_U24_3BE in ALSA
+    * .. _V4L2-AUDIO-FMT-S20-3LE:
+
+      - ``V4L2_AUDIO_FMT_S20_3LE``
+      - 'S20_3LE'
+      - Correspond to SNDRV_PCM_FORMAT_S24_3LE in ALSA
+    * .. _V4L2-AUDIO-FMT-S20-3BE:
+
+      - ``V4L2_AUDIO_FMT_S20_3BE``
+      - 'S20_3BE'
+      - Correspond to SNDRV_PCM_FORMAT_S20_3BE in ALSA
+    * .. _V4L2-AUDIO-FMT-U20-3LE:
+
+      - ``V4L2_AUDIO_FMT_U20_3LE``
+      - 'U20_3LE'
+      - Correspond to SNDRV_PCM_FORMAT_U20_3LE in ALSA
+    * .. _V4L2-AUDIO-FMT-U20-3BE:
+
+      - ``V4L2_AUDIO_FMT_U20_3BE``
+      - 'U20_3BE'
+      - Correspond to SNDRV_PCM_FORMAT_U20_3BE in ALSA
+    * .. _V4L2-AUDIO-FMT-S18-3LE:
+
+      - ``V4L2_AUDIO_FMT_S18_3LE``
+      - 'S18_3LE'
+      - Correspond to SNDRV_PCM_FORMAT_S18_3LE in ALSA
+    * .. _V4L2-AUDIO-FMT-S18-3BE:
+
+      - ``V4L2_AUDIO_FMT_S18_3BE``
+      - 'S18_3BE'
+      - Correspond to SNDRV_PCM_FORMAT_S18_3BE in ALSA
+    * .. _V4L2-AUDIO-FMT-U18-3LE:
+
+      - ``V4L2_AUDIO_FMT_U18_3LE``
+      - 'U18_3LE'
+      - Correspond to SNDRV_PCM_FORMAT_U18_3LE in ALSA
+    * .. _V4L2-AUDIO-FMT-U18-3BE:
+
+      - ``V4L2_AUDIO_FMT_U18_3BE``
+      - 'U18_3BE'
+      - Correspond to SNDRV_PCM_FORMAT_U18_3BE in ALSA
+    * .. _V4L2-AUDIO-FMT-G723-24:
+
+      - ``V4L2_AUDIO_FMT_G723_24``
+      - 'G723_24'
+      - Correspond to SNDRV_PCM_FORMAT_G723_24 in ALSA
+    * .. _V4L2-AUDIO-FMT-G723-24-1B:
+
+      - ``V4L2_AUDIO_FMT_G723_24_1B``
+      - 'G723_24_1B'
+      - Correspond to SNDRV_PCM_FORMAT_G723_24_1B in ALSA
+    * .. _V4L2-AUDIO-FMT-G723-40:
+
+      - ``V4L2_AUDIO_FMT_G723_40``
+      - 'G723_40'
+      - Correspond to SNDRV_PCM_FORMAT_G723_40 in ALSA
+    * .. _V4L2-AUDIO-FMT-G723-40-1B:
+
+      - ``V4L2_AUDIO_FMT_G723_40_1B``
+      - 'G723_40_1B'
+      - Correspond to SNDRV_PCM_FORMAT_G723_40_1B in ALSA
+    * .. _V4L2-AUDIO-FMT-DSD-U8:
+
+      - ``V4L2_AUDIO_FMT_DSD-U8``
+      - 'DSD_U8'
+      - Correspond to SNDRV_PCM_FORMAT_DSD_U8 in ALSA
+    * .. _V4L2-AUDIO-FMT-DSD-U16-LE:
+
+      - ``V4L2_AUDIO_FMT_DSD-U16-LE``
+      - 'DSD_U16_LE'
+      - Correspond to SNDRV_PCM_FORMAT_DSD_U16_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-DSD-U32-LE:
+
+      - ``V4L2_AUDIO_FMT_DSD-U32-LE``
+      - 'DSD_U32_LE'
+      - Correspond to SNDRV_PCM_FORMAT_DSD_U32_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-DSD-U16-BE:
+
+      - ``V4L2_AUDIO_FMT_DSD-U16-BE``
+      - 'DSD_U16_BE'
+      - Correspond to SNDRV_PCM_FORMAT_DSD_U16_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-DSD-U32-BE:
+
+      - ``V4L2_AUDIO_FMT_DSD-U32-BE``
+      - 'DSD_U32_BE'
+      - Correspond to SNDRV_PCM_FORMAT_DSD_U32_BE in ALSA
diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Documentation/userspace-api/media/v4l/pixfmt.rst
index 11dab4a90630..2eb6fdd3b43d 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
@@ -36,3 +36,4 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
     colorspaces
     colorspaces-defs
     colorspaces-details
+    pixfmt-audio
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 1a40090d8287..044611d5d3f8 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,57 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
 	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
 	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
+	case V4L2_AUDIO_FMT_S8:		descr = "8-bit Signed"; break;
+	case V4L2_AUDIO_FMT_U8:		descr = "8-bit Unsigned"; break;
+	case V4L2_AUDIO_FMT_S16_LE:	descr = "16-bit Signed LE"; break;
+	case V4L2_AUDIO_FMT_S16_BE:		descr = "16-bit Signed BE"; break;
+	case V4L2_AUDIO_FMT_U16_LE:		descr = "16-bit Unsigned LE"; break;
+	case V4L2_AUDIO_FMT_U16_BE:		descr = "16-bit Unsigned BE"; break;
+	case V4L2_AUDIO_FMT_S24_LE:		descr = "24(32)-bit Signed LE"; break;
+	case V4L2_AUDIO_FMT_S24_BE:		descr = "24(32)-bit Signed BE"; break;
+	case V4L2_AUDIO_FMT_U24_LE:		descr = "24(32)-bit Unsigned LE"; break;
+	case V4L2_AUDIO_FMT_U24_BE:		descr = "24(32)-bit Unsigned BE"; break;
+	case V4L2_AUDIO_FMT_S32_LE:		descr = "32-bit Signed LE"; break;
+	case V4L2_AUDIO_FMT_S32_BE:		descr = "32-bit Signed BE"; break;
+	case V4L2_AUDIO_FMT_U32_LE:		descr = "32-bit Unsigned LE"; break;
+	case V4L2_AUDIO_FMT_U32_BE:		descr = "32-bit Unsigned BE"; break;
+	case V4L2_AUDIO_FMT_FLOAT_LE:		descr = "32-bit Float LE"; break;
+	case V4L2_AUDIO_FMT_FLOAT_BE:		descr = "32-bit Float BE"; break;
+	case V4L2_AUDIO_FMT_FLOAT64_LE:		descr = "64-bit Float LE"; break;
+	case V4L2_AUDIO_FMT_FLOAT64_BE:		descr = "64-bit Float BE"; break;
+	case V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE:	descr = "32-bit IEC958 LE"; break;
+	case V4L2_AUDIO_FMT_IEC958_SUBFRAME_BE:	descr = "32-bit IEC958 BE"; break;
+	case V4L2_AUDIO_FMT_MU_LAW:		descr = "Mu Law"; break;
+	case V4L2_AUDIO_FMT_A_LAW:		descr = "A Law"; break;
+	case V4L2_AUDIO_FMT_IMA_ADPCM:		descr = "IMA ADPCM"; break;
+	case V4L2_AUDIO_FMT_MPEG:		descr = "MPEG Audio"; break;
+	case V4L2_AUDIO_FMT_GSM:		descr = "GSM Audio"; break;
+	case V4L2_AUDIO_FMT_S20_LE:		descr = "20-bit Signed LE"; break;
+	case V4L2_AUDIO_FMT_S20_BE:		descr = "20-bit Signed BE"; break;
+	case V4L2_AUDIO_FMT_U20_LE:		descr = "20-bit Unsigned LE"; break;
+	case V4L2_AUDIO_FMT_U20_BE:		descr = "20-bit Unsigned BE"; break;
+	case V4L2_AUDIO_FMT_SPECIAL:		descr = "Special Audio"; break;
+	case V4L2_AUDIO_FMT_S24_3LE:		descr = "24(24)-bit Signed LE"; break;
+	case V4L2_AUDIO_FMT_S24_3BE:		descr = "24(24)-bit Signed BE"; break;
+	case V4L2_AUDIO_FMT_U24_3LE:		descr = "24(24)-bit Unsigned LE"; break;
+	case V4L2_AUDIO_FMT_U24_3BE:		descr = "24(24)-bit Unsigned BE"; break;
+	case V4L2_AUDIO_FMT_S20_3LE:		descr = "20(24)-bit Signed LE"; break;
+	case V4L2_AUDIO_FMT_S20_3BE:		descr = "20(24)-bit Signed BE"; break;
+	case V4L2_AUDIO_FMT_U20_3LE:		descr = "20(24)-bit Unsigned LE"; break;
+	case V4L2_AUDIO_FMT_U20_3BE:		descr = "20(24)-bit Unsigned BE"; break;
+	case V4L2_AUDIO_FMT_S18_3LE:		descr = "18(24)-bit Signed LE"; break;
+	case V4L2_AUDIO_FMT_S18_3BE:		descr = "18(24)-bit Signed BE"; break;
+	case V4L2_AUDIO_FMT_U18_3LE:		descr = "18(24)-bit Unsigned LE"; break;
+	case V4L2_AUDIO_FMT_U18_3BE:		descr = "18(24)-bit Unsigned BE"; break;
+	case V4L2_AUDIO_FMT_G723_24:		descr = "G723 24"; break;
+	case V4L2_AUDIO_FMT_G723_24_1B:		descr = "G723 24 1b"; break;
+	case V4L2_AUDIO_FMT_G723_40:		descr = "G723 40"; break;
+	case V4L2_AUDIO_FMT_G723_40_1B:		descr = "G723 40 1b"; break;
+	case V4L2_AUDIO_FMT_DSD_U8:		descr = "8-bit DSD"; break;
+	case V4L2_AUDIO_FMT_DSD_U16_LE:		descr = "16-bit DSD LE"; break;
+	case V4L2_AUDIO_FMT_DSD_U32_LE:		descr = "32-bit DSD LE"; break;
+	case V4L2_AUDIO_FMT_DSD_U16_BE:		descr = "16-bit DSD BE"; break;
+	case V4L2_AUDIO_FMT_DSD_U32_BE:		descr = "32-bit DSD BE"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 166c51f537cc..72d7d71050ee 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -842,6 +842,62 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 
+/* Audio-data formats */
+#define V4L2_AUDIO_FMT_S8			v4l2_fourcc('A', 'U', '0', '0')
+#define V4L2_AUDIO_FMT_U8			v4l2_fourcc('A', 'U', '0', '1')
+#define V4L2_AUDIO_FMT_S16_LE			v4l2_fourcc('A', 'U', '0', '2')
+#define V4L2_AUDIO_FMT_S16_BE			v4l2_fourcc('A', 'U', '0', '3')
+#define V4L2_AUDIO_FMT_U16_LE			v4l2_fourcc('A', 'U', '0', '4')
+#define V4L2_AUDIO_FMT_U16_BE			v4l2_fourcc('A', 'U', '0', '5')
+#define V4L2_AUDIO_FMT_S24_LE			v4l2_fourcc('A', 'U', '0', '6')
+#define V4L2_AUDIO_FMT_S24_BE			v4l2_fourcc('A', 'U', '0', '7')
+#define V4L2_AUDIO_FMT_U24_LE			v4l2_fourcc('A', 'U', '0', '8')
+#define V4L2_AUDIO_FMT_U24_BE			v4l2_fourcc('A', 'U', '0', '9')
+
+#define V4L2_AUDIO_FMT_S32_LE			v4l2_fourcc('A', 'U', '1', '0')
+#define V4L2_AUDIO_FMT_S32_BE			v4l2_fourcc('A', 'U', '1', '1')
+#define V4L2_AUDIO_FMT_U32_LE			v4l2_fourcc('A', 'U', '1', '2')
+#define V4L2_AUDIO_FMT_U32_BE			v4l2_fourcc('A', 'U', '1', '3')
+#define V4L2_AUDIO_FMT_FLOAT_LE			v4l2_fourcc('A', 'U', '1', '4')
+#define V4L2_AUDIO_FMT_FLOAT_BE			v4l2_fourcc('A', 'U', '1', '5')
+#define V4L2_AUDIO_FMT_FLOAT64_LE		v4l2_fourcc('A', 'U', '1', '6')
+#define V4L2_AUDIO_FMT_FLOAT64_BE		v4l2_fourcc('A', 'U', '1', '7')
+#define V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE	v4l2_fourcc('A', 'U', '1', '8')
+#define V4L2_AUDIO_FMT_IEC958_SUBFRAME_BE	v4l2_fourcc('A', 'U', '1', '9')
+
+#define V4L2_AUDIO_FMT_MU_LAW			v4l2_fourcc('A', 'U', '2', '0')
+#define V4L2_AUDIO_FMT_A_LAW			v4l2_fourcc('A', 'U', '2', '1')
+#define V4L2_AUDIO_FMT_IMA_ADPCM		v4l2_fourcc('A', 'U', '2', '2')
+#define V4L2_AUDIO_FMT_MPEG			v4l2_fourcc('A', 'U', '2', '3')
+#define V4L2_AUDIO_FMT_GSM			v4l2_fourcc('A', 'U', '2', '4')
+#define V4L2_AUDIO_FMT_S20_LE			v4l2_fourcc('A', 'U', '2', '5')
+#define V4L2_AUDIO_FMT_S20_BE			v4l2_fourcc('A', 'U', '2', '6')
+#define V4L2_AUDIO_FMT_U20_LE			v4l2_fourcc('A', 'U', '2', '7')
+#define V4L2_AUDIO_FMT_U20_BE			v4l2_fourcc('A', 'U', '2', '8')
+
+#define V4L2_AUDIO_FMT_SPECIAL			v4l2_fourcc('A', 'U', '3', '1')
+#define V4L2_AUDIO_FMT_S24_3LE			v4l2_fourcc('A', 'U', '3', '2')
+#define V4L2_AUDIO_FMT_S24_3BE			v4l2_fourcc('A', 'U', '3', '3')
+#define V4L2_AUDIO_FMT_U24_3LE			v4l2_fourcc('A', 'U', '3', '4')
+#define V4L2_AUDIO_FMT_U24_3BE			v4l2_fourcc('A', 'U', '3', '5')
+#define V4L2_AUDIO_FMT_S20_3LE			v4l2_fourcc('A', 'U', '3', '6')
+#define V4L2_AUDIO_FMT_S20_3BE			v4l2_fourcc('A', 'U', '3', '7')
+#define V4L2_AUDIO_FMT_U20_3LE			v4l2_fourcc('A', 'U', '3', '8')
+#define V4L2_AUDIO_FMT_U20_3BE			v4l2_fourcc('A', 'U', '3', '9')
+#define V4L2_AUDIO_FMT_S18_3LE			v4l2_fourcc('A', 'U', '4', '0')
+#define V4L2_AUDIO_FMT_S18_3BE			v4l2_fourcc('A', 'U', '4', '1')
+#define V4L2_AUDIO_FMT_U18_3LE			v4l2_fourcc('A', 'U', '4', '2')
+#define V4L2_AUDIO_FMT_U18_3BE			v4l2_fourcc('A', 'U', '4', '3')
+#define V4L2_AUDIO_FMT_G723_24			v4l2_fourcc('A', 'U', '4', '4')
+#define V4L2_AUDIO_FMT_G723_24_1B		v4l2_fourcc('A', 'U', '4', '5')
+#define V4L2_AUDIO_FMT_G723_40			v4l2_fourcc('A', 'U', '4', '6')
+#define V4L2_AUDIO_FMT_G723_40_1B		v4l2_fourcc('A', 'U', '4', '7')
+#define V4L2_AUDIO_FMT_DSD_U8			v4l2_fourcc('A', 'U', '4', '8')
+#define V4L2_AUDIO_FMT_DSD_U16_LE		v4l2_fourcc('A', 'U', '4', '9')
+#define V4L2_AUDIO_FMT_DSD_U32_LE		v4l2_fourcc('A', 'U', '5', '0')
+#define V4L2_AUDIO_FMT_DSD_U16_BE		v4l2_fourcc('A', 'U', '5', '1')
+#define V4L2_AUDIO_FMT_DSD_U32_BE		v4l2_fourcc('A', 'U', '5', '2')
+
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
 
-- 
2.34.1

