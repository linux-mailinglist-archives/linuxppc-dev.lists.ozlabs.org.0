Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6CA831A77
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jan 2024 14:20:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TG3KN4ZPnz3wTT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 00:20:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TG3Bk698qz3cWm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 00:15:10 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 48A1F1A22A1;
	Thu, 18 Jan 2024 14:15:08 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 10F5B1A22A3;
	Thu, 18 Jan 2024 14:15:08 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 0B4691834898;
	Thu, 18 Jan 2024 21:15:05 +0800 (+08)
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
Subject: [PATCH v12 12/15] media: uapi: Add an entity type for audio resampler
Date: Thu, 18 Jan 2024 20:32:05 +0800
Message-Id: <1705581128-4604-13-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
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

Add and document a media entity type for an audio resampler.
It is MEDIA_ENT_F_PROC_AUDIO_RESAMPLER.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/userspace-api/media/mediactl/media-types.rst | 6 ++++++
 include/uapi/linux/media.h                                 | 1 +
 2 files changed, 7 insertions(+)

diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index f0880aea41d6..9ca6542517d5 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -40,6 +40,7 @@ Types and flags used to represent the media graph elements
 .. _MEDIA-ENT-F-PROC-VIDEO-ENCODER:
 .. _MEDIA-ENT-F-PROC-VIDEO-DECODER:
 .. _MEDIA-ENT-F-PROC-VIDEO-ISP:
+.. _MEDIA-ENT-F-PROC-AUDIO-RESAMPLER:
 .. _MEDIA-ENT-F-VID-MUX:
 .. _MEDIA-ENT-F-VID-IF-BRIDGE:
 .. _MEDIA-ENT-F-DV-DECODER:
@@ -208,6 +209,11 @@ Types and flags used to represent the media graph elements
 	  combination of custom V4L2 controls and IOCTLs, and parameters
 	  supplied in a metadata buffer.
 
+    *  -  ``MEDIA_ENT_F_PROC_AUDIO_RESAMPLER``
+       -  An Audio Resampler device. An entity capable of
+	  resampling an audio stream from one sample rate to another sample
+	  rate. Must have one sink pad and at least one source pad.
+
     *  -  ``MEDIA_ENT_F_VID_MUX``
        - Video multiplexer. An entity capable of multiplexing must have at
          least two sink pads and one source pad, and must pass the video
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 9ff6dec7393a..a8266eaa8042 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -125,6 +125,7 @@ struct media_device_info {
 #define MEDIA_ENT_F_PROC_VIDEO_ENCODER		(MEDIA_ENT_F_BASE + 0x4007)
 #define MEDIA_ENT_F_PROC_VIDEO_DECODER		(MEDIA_ENT_F_BASE + 0x4008)
 #define MEDIA_ENT_F_PROC_VIDEO_ISP		(MEDIA_ENT_F_BASE + 0x4009)
+#define MEDIA_ENT_F_PROC_AUDIO_RESAMPLER	(MEDIA_ENT_F_BASE + 0x400a)
 
 /*
  * Switch and bridge entity functions
-- 
2.34.1

