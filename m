Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A447904C1C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 08:58:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vzbwn3cgSz3dWk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 16:58:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vzbvx5YYhz3dWQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 16:57:49 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BA9851A124C;
	Wed, 12 Jun 2024 08:57:47 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6D2A51A0FFA;
	Wed, 12 Jun 2024 08:57:47 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 1D65C180222C;
	Wed, 12 Jun 2024 14:57:45 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ASoC: fsl_audmix: Split playback and capture stream to different DAI
Date: Wed, 12 Jun 2024 14:40:51 +0800
Message-Id: <1718174452-17596-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1718174452-17596-1-git-send-email-shengjiu.wang@nxp.com>
References: <1718174452-17596-1-git-send-email-shengjiu.wang@nxp.com>
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
Cc: viorel.suman@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As audmix requires playback and capture stream in different
master/slave mode, so separate playback and capture stream to
different DAI. There are three DAIs required, two DAIs for playback
one DAI for capture.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_audmix.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 0ab2c1962117..1671a3037c60 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -326,15 +326,6 @@ static struct snd_soc_dai_driver fsl_audmix_dai[] = {
 			.rates = SNDRV_PCM_RATE_8000_96000,
 			.formats = FSL_AUDMIX_FORMATS,
 		},
-		.capture = {
-			.stream_name = "AUDMIX-Capture-0",
-			.channels_min = 8,
-			.channels_max = 8,
-			.rate_min = 8000,
-			.rate_max = 96000,
-			.rates = SNDRV_PCM_RATE_8000_96000,
-			.formats = FSL_AUDMIX_FORMATS,
-		},
 		.ops = &fsl_audmix_dai_ops,
 	},
 	{
@@ -349,8 +340,13 @@ static struct snd_soc_dai_driver fsl_audmix_dai[] = {
 			.rates = SNDRV_PCM_RATE_8000_96000,
 			.formats = FSL_AUDMIX_FORMATS,
 		},
+		.ops = &fsl_audmix_dai_ops,
+	},
+	{
+		.id   = 2,
+		.name = "audmix-2",
 		.capture = {
-			.stream_name = "AUDMIX-Capture-1",
+			.stream_name = "AUDMIX-Capture-0",
 			.channels_min = 8,
 			.channels_max = 8,
 			.rate_min = 8000,
-- 
2.34.1

