Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 624F17F3FBC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 09:09:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZv6D2Q1Tz3wVD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 19:09:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZv0F2nwBz3dKR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 19:04:13 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CE3FB20174A;
	Wed, 22 Nov 2023 09:04:10 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5EA70201748;
	Wed, 22 Nov 2023 09:04:10 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 62C201834870;
	Wed, 22 Nov 2023 16:04:08 +0800 (+08)
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
Subject: [PATCH v11 11/15] media: uapi: Declare interface types for Audio
Date: Wed, 22 Nov 2023 15:23:54 +0800
Message-Id: <1700637838-6743-12-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1700637838-6743-1-git-send-email-shengjiu.wang@nxp.com>
References: <1700637838-6743-1-git-send-email-shengjiu.wang@nxp.com>
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

Declare the interface types that will be used by Audio.
The type is MEDIA_INTF_T_V4L_AUDIO.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../userspace-api/media/mediactl/media-types.rst    |  5 +++++
 drivers/media/v4l2-core/v4l2-dev.c                  |  4 ++++
 drivers/media/v4l2-core/v4l2-mem2mem.c              | 13 +++++++++----
 include/uapi/linux/media.h                          |  1 +
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 0ffeece1e0c8..f0880aea41d6 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -265,6 +265,7 @@ Types and flags used to represent the media graph elements
 .. _MEDIA-INTF-T-V4L-SUBDEV:
 .. _MEDIA-INTF-T-V4L-SWRADIO:
 .. _MEDIA-INTF-T-V4L-TOUCH:
+.. _MEDIA-INTF-T-V4L-AUDIO:
 .. _MEDIA-INTF-T-ALSA-PCM-CAPTURE:
 .. _MEDIA-INTF-T-ALSA-PCM-PLAYBACK:
 .. _MEDIA-INTF-T-ALSA-CONTROL:
@@ -322,6 +323,10 @@ Types and flags used to represent the media graph elements
        -  Device node interface for Touch device (V4L)
        -  typically, /dev/v4l-touch?
 
+    *  -  ``MEDIA_INTF_T_V4L_AUDIO``
+       -  Device node interface for Audio device (V4L)
+       -  typically, /dev/v4l-audio?
+
     *  -  ``MEDIA_INTF_T_ALSA_PCM_CAPTURE``
        -  Device node interface for ALSA PCM Capture
        -  typically, /dev/snd/pcmC?D?c
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index b92c760b611a..c3a7d974db26 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -842,6 +842,10 @@ static int video_register_media_controller(struct video_device *vdev)
 		intf_type = MEDIA_INTF_T_V4L_SUBDEV;
 		/* Entity will be created via v4l2_device_register_subdev() */
 		break;
+	case VFL_TYPE_AUDIO:
+		intf_type = MEDIA_INTF_T_V4L_AUDIO;
+		/* Entity will be created via v4l2_device_register_subdev() */
+		break;
 	default:
 		return 0;
 	}
diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 0cc30397fbad..bf41d112b742 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -1134,10 +1134,15 @@ int v4l2_m2m_register_media_controller(struct v4l2_m2m_dev *m2m_dev,
 	if (ret)
 		goto err_rm_links0;
 
-	/* Create video interface */
-	m2m_dev->intf_devnode = media_devnode_create(mdev,
-			MEDIA_INTF_T_V4L_VIDEO, 0,
-			VIDEO_MAJOR, vdev->minor);
+	if (vdev->vfl_type == VFL_TYPE_AUDIO)
+		m2m_dev->intf_devnode = media_devnode_create(mdev,
+				MEDIA_INTF_T_V4L_AUDIO, 0,
+				VIDEO_MAJOR, vdev->minor);
+	else
+		/* Create video interface */
+		m2m_dev->intf_devnode = media_devnode_create(mdev,
+				MEDIA_INTF_T_V4L_VIDEO, 0,
+				VIDEO_MAJOR, vdev->minor);
 	if (!m2m_dev->intf_devnode) {
 		ret = -ENOMEM;
 		goto err_rm_links1;
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 1c80b1d6bbaf..9ff6dec7393a 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -260,6 +260,7 @@ struct media_links_enum {
 #define MEDIA_INTF_T_V4L_SUBDEV			(MEDIA_INTF_T_V4L_BASE + 3)
 #define MEDIA_INTF_T_V4L_SWRADIO		(MEDIA_INTF_T_V4L_BASE + 4)
 #define MEDIA_INTF_T_V4L_TOUCH			(MEDIA_INTF_T_V4L_BASE + 5)
+#define MEDIA_INTF_T_V4L_AUDIO			(MEDIA_INTF_T_V4L_BASE + 6)
 
 #define MEDIA_INTF_T_ALSA_BASE			0x00000300
 #define MEDIA_INTF_T_ALSA_PCM_CAPTURE		(MEDIA_INTF_T_ALSA_BASE)
-- 
2.34.1

