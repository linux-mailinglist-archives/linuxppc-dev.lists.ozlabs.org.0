Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F017A78CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 12:13:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrDrW5nRqz3cQj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 20:13:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrDmS5GYPz3cF7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 20:10:00 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2EC621A0D3D;
	Wed, 20 Sep 2023 12:09:58 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BF5ED1A0D68;
	Wed, 20 Sep 2023 12:09:57 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id DFB9E181D0E4;
	Wed, 20 Sep 2023 18:09:55 +0800 (+08)
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
Subject: [RFC PATCH v4 07/11] media: uapi: Add V4L2_AUDIO_FMT_LPCM fourcc format
Date: Wed, 20 Sep 2023 17:32:46 +0800
Message-Id: <1695202370-24678-8-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1695202370-24678-1-git-send-email-shengjiu.wang@nxp.com>
References: <1695202370-24678-1-git-send-email-shengjiu.wang@nxp.com>
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

Linear Pulse-Code Modulation is used to represent
audio samples in buffer, the samples for each channel
are interleaved.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../userspace-api/media/v4l/audio-formats.rst | 15 +++++
 .../media/v4l/pixfmt-aud-lpcm.rst             | 61 +++++++++++++++++++
 .../userspace-api/media/v4l/pixfmt.rst        |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
 include/uapi/linux/videodev2.h                |  3 +
 5 files changed, 81 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/audio-formats.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-aud-lpcm.rst

diff --git a/Documentation/userspace-api/media/v4l/audio-formats.rst b/Documentation/userspace-api/media/v4l/audio-formats.rst
new file mode 100644
index 000000000000..bc52712d20d3
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/audio-formats.rst
@@ -0,0 +1,15 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _audio-formats:
+
+*************
+Audio Formats
+*************
+
+These formats are used for :ref:`audio` interface only.
+
+
+.. toctree::
+    :maxdepth: 1
+
+    pixfmt-aud-lpcm
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-aud-lpcm.rst b/Documentation/userspace-api/media/v4l/pixfmt-aud-lpcm.rst
new file mode 100644
index 000000000000..2231bd95212f
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-aud-lpcm.rst
@@ -0,0 +1,61 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _v4l2-audio-fmt-lpcm:
+
+****************************
+V4L2_AUDIO_FMT_LPCM ('LPCM')
+****************************
+
+Linear Pulse-Code Modulation (LPCM)
+
+
+Description
+===========
+
+LPCM audio is coded using a combination of values such as:
+
+Sample rate: which is the number of times per second that samples are taken,
+The typical rates are 8kHz, 11025Hz, 16kHz, 22050Hz, 32kHz, 44100Hz, 48kHz,
+88200Hz, 96kHz, 176400Hz, 192kHz...
+
+Sample format: which determines the number of possible digital values that
+can be used to represent each sample. The format can be SND_PCM_FORMAT_S8,
+SND_PCM_FORMAT_S16_LE, SND_PCM_FORMAT_S24_LE, SND_PCM_FORMAT_S32_LE...
+
+Channels: It is the "location" or "passageway" of a specific signal or
+data in a piece of audio. The channel number can be 1,2,3...
+
+Please refer to https://www.alsa-project.org/alsa-doc/alsa-lib/pcm.html
+for more detail
+
+Each sample contains several channels data,  the channel data format is
+defined by sample format.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - Sample 0:
+      - Channel 0
+      - Channel 1
+      - Channel 2
+      - Channel 3
+      - ...
+    * - Sample 1:
+      - Channel 0
+      - Channel 1
+      - Channel 2
+      - Channel 3
+      - ...
+    * - Sample 2:
+      - Channel 0
+      - Channel 1
+      - Channel 2
+      - Channel 3
+      - ...
+    * - Sample 3:
+      - Channel 0
+      - Channel 1
+      - Channel 2
+      - Channel 3
+      - ...
diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Documentation/userspace-api/media/v4l/pixfmt.rst
index 11dab4a90630..e205db5fa8af 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
@@ -36,3 +36,4 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
     colorspaces
     colorspaces-defs
     colorspaces-details
+    audio-formats
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index f4d9d6279094..55fd4da10ba6 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1452,6 +1452,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
 	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
 	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
+	case V4L2_AUDIO_FMT_LPCM:       descr = "Audio LPCM"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 3decf7d73870..ce71e9343705 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -839,6 +839,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 
+/* Audio-data formats */
+#define V4L2_AUDIO_FMT_LPCM       v4l2_fourcc('L', 'P', 'C', 'M') /* audio lpcm */
+
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
 
-- 
2.34.1

