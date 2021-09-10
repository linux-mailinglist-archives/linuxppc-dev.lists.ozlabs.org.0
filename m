Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B9C406938
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 11:42:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5W9l4mbWz308h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 19:42:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5W9L5MfRz2xrw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Sep 2021 19:41:42 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1D5311A258D;
 Fri, 10 Sep 2021 11:41:39 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D95DA1A2591;
 Fri, 10 Sep 2021 11:41:38 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 649AB183AD26;
 Fri, 10 Sep 2021 17:41:37 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_xcvr: Fix channel swap issue with ARC
Date: Fri, 10 Sep 2021 17:18:30 +0800
Message-Id: <1631265510-27384-1-git-send-email-shengjiu.wang@nxp.com>
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

With pause and resume test for ARC, there is occasionally
channel swap issue. The reason is that currently driver set
the DPATH out of reset first, then start the DMA, the first
data got from FIFO may not be the Left channel.

Moving DPATH out of reset operation after the dma enablement
to fix this issue.

Fixes: 28564486866f ("ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 31c5ee641fe7..6e67033b6cde 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -487,8 +487,9 @@ static int fsl_xcvr_prepare(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	/* clear DPATH RESET */
+	/* set DPATH RESET */
 	m_ctl |= FSL_XCVR_EXT_CTRL_DPTH_RESET(tx);
+	v_ctl |= FSL_XCVR_EXT_CTRL_DPTH_RESET(tx);
 	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL, m_ctl, v_ctl);
 	if (ret < 0) {
 		dev_err(dai->dev, "Error while setting EXT_CTRL: %d\n", ret);
@@ -590,10 +591,6 @@ static void fsl_xcvr_shutdown(struct snd_pcm_substream *substream,
 		val  |= FSL_XCVR_EXT_CTRL_CMDC_RESET(tx);
 	}
 
-	/* set DPATH RESET */
-	mask |= FSL_XCVR_EXT_CTRL_DPTH_RESET(tx);
-	val  |= FSL_XCVR_EXT_CTRL_DPTH_RESET(tx);
-
 	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL, mask, val);
 	if (ret < 0) {
 		dev_err(dai->dev, "Err setting DPATH RESET: %d\n", ret);
@@ -643,6 +640,16 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 			dev_err(dai->dev, "Failed to enable DMA: %d\n", ret);
 			return ret;
 		}
+
+		/* clear DPATH RESET */
+		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
+					 FSL_XCVR_EXT_CTRL_DPTH_RESET(tx),
+					 0);
+		if (ret < 0) {
+			dev_err(dai->dev, "Failed to clear DPATH RESET: %d\n", ret);
+			return ret;
+		}
+
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-- 
2.17.1

