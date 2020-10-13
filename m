Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 267E128C765
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 04:56:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9KtV15z1zDqbh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 13:56:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9KrQ6WC2zDqZP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 13:54:12 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A759C1A1507;
 Tue, 13 Oct 2020 04:54:09 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 69EA91A1516;
 Tue, 13 Oct 2020 04:54:05 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 19B7F40332;
 Tue, 13 Oct 2020 04:53:58 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: fsl_spdif: Add support for higher sample rates
Date: Tue, 13 Oct 2020 10:49:20 +0800
Message-Id: <1602557360-18795-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add 88200Hz and 176400Hz sample rates support for TX.
Add 88200Hz, 176400Hz, 192000Hz sample rates support for RX.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
changes in v2
- reorder the signed-off
- add acked-by Nicolin

 sound/soc/fsl/fsl_spdif.c | 16 +++++++++++++---
 sound/soc/fsl/fsl_spdif.h |  9 ++++++++-
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 4d14f4076ead..1c030142556a 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -459,10 +459,18 @@ static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
 		rate = SPDIF_TXRATE_48000;
 		csfs = IEC958_AES3_CON_FS_48000;
 		break;
+	case 88200:
+		rate = SPDIF_TXRATE_88200;
+		csfs = IEC958_AES3_CON_FS_88200;
+		break;
 	case 96000:
 		rate = SPDIF_TXRATE_96000;
 		csfs = IEC958_AES3_CON_FS_96000;
 		break;
+	case 176400:
+		rate = SPDIF_TXRATE_176400;
+		csfs = IEC958_AES3_CON_FS_176400;
+		break;
 	case 192000:
 		rate = SPDIF_TXRATE_192000;
 		csfs = IEC958_AES3_CON_FS_192000;
@@ -857,7 +865,7 @@ static int fsl_spdif_rxrate_info(struct snd_kcontrol *kcontrol,
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 	uinfo->count = 1;
 	uinfo->value.integer.min = 16000;
-	uinfo->value.integer.max = 96000;
+	uinfo->value.integer.max = 192000;
 
 	return 0;
 }
@@ -1175,7 +1183,8 @@ static u32 fsl_spdif_txclk_caldiv(struct fsl_spdif_priv *spdif_priv,
 				struct clk *clk, u64 savesub,
 				enum spdif_txrate index, bool round)
 {
-	static const u32 rate[] = { 32000, 44100, 48000, 96000, 192000 };
+	static const u32 rate[] = { 32000, 44100, 48000, 88200, 96000, 176400,
+				    192000, };
 	bool is_sysclk = clk_is_match(clk, spdif_priv->sysclk);
 	u64 rate_ideal, rate_actual, sub;
 	u32 arate;
@@ -1235,7 +1244,8 @@ static u32 fsl_spdif_txclk_caldiv(struct fsl_spdif_priv *spdif_priv,
 static int fsl_spdif_probe_txclk(struct fsl_spdif_priv *spdif_priv,
 				enum spdif_txrate index)
 {
-	static const u32 rate[] = { 32000, 44100, 48000, 96000, 192000 };
+	static const u32 rate[] = { 32000, 44100, 48000, 88200, 96000, 176400,
+				    192000, };
 	struct platform_device *pdev = spdif_priv->pdev;
 	struct device *dev = &pdev->dev;
 	u64 savesub = 100000, ret;
diff --git a/sound/soc/fsl/fsl_spdif.h b/sound/soc/fsl/fsl_spdif.h
index e6c61e07bc1a..d5f1dfd58740 100644
--- a/sound/soc/fsl/fsl_spdif.h
+++ b/sound/soc/fsl/fsl_spdif.h
@@ -163,7 +163,9 @@ enum spdif_txrate {
 	SPDIF_TXRATE_32000 = 0,
 	SPDIF_TXRATE_44100,
 	SPDIF_TXRATE_48000,
+	SPDIF_TXRATE_88200,
 	SPDIF_TXRATE_96000,
+	SPDIF_TXRATE_176400,
 	SPDIF_TXRATE_192000,
 };
 #define SPDIF_TXRATE_MAX		(SPDIF_TXRATE_192000 + 1)
@@ -177,15 +179,20 @@ enum spdif_txrate {
 #define FSL_SPDIF_RATES_PLAYBACK	(SNDRV_PCM_RATE_32000 |	\
 					 SNDRV_PCM_RATE_44100 |	\
 					 SNDRV_PCM_RATE_48000 |	\
+					 SNDRV_PCM_RATE_88200 | \
 					 SNDRV_PCM_RATE_96000 |	\
+					 SNDRV_PCM_RATE_176400 | \
 					 SNDRV_PCM_RATE_192000)
 
 #define FSL_SPDIF_RATES_CAPTURE		(SNDRV_PCM_RATE_16000 | \
 					 SNDRV_PCM_RATE_32000 |	\
 					 SNDRV_PCM_RATE_44100 | \
 					 SNDRV_PCM_RATE_48000 |	\
+					 SNDRV_PCM_RATE_88200 | \
 					 SNDRV_PCM_RATE_64000 | \
-					 SNDRV_PCM_RATE_96000)
+					 SNDRV_PCM_RATE_96000 | \
+					 SNDRV_PCM_RATE_176400 | \
+					 SNDRV_PCM_RATE_192000)
 
 #define FSL_SPDIF_FORMATS_PLAYBACK	(SNDRV_PCM_FMTBIT_S16_LE | \
 					 SNDRV_PCM_FMTBIT_S20_3LE | \
-- 
2.27.0

