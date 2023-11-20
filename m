Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF0B7F10B4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 11:46:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYkgr20Jqz3dLc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 21:46:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYkgL1cClz3c1L
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 21:45:32 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C70501A0CB9;
	Mon, 20 Nov 2023 11:45:28 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 907641A0C96;
	Mon, 20 Nov 2023 11:45:28 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 11B72180222F;
	Mon, 20 Nov 2023 18:45:27 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	shengjiu.wang@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_sai: Fix no frame sync clock issue on i.MX8MP
Date: Mon, 20 Nov 2023 18:05:35 +0800
Message-Id: <1700474735-3863-1-git-send-email-shengjiu.wang@nxp.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On i.MX8MP, when the TERE and FSD_MSTR enabled before configuring
the word width, there will be no frame sync clock issue, because
old word width impact the generation of frame sync.

TERE enabled earlier only for i.MX8MP case for the hardware limitation,
So need to disable FSD_MSTR before configuring word width, then enable
FSD_MSTR bit for this specific case.

Fixes: 3e4a82612998 ("ASoC: fsl_sai: MCLK bind with TX/RX enable bit")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 79e7c6b98a75..32bbe5056a63 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -673,6 +673,20 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 			   FSL_SAI_CR3_TRCE_MASK,
 			   FSL_SAI_CR3_TRCE((dl_cfg[dl_cfg_idx].mask[tx] & trce_mask)));
 
+	/*
+	 * When the TERE and FSD_MSTR enabled before configuring the word width
+	 * There will be no frame sync clock issue, because word width impact
+	 * the generation of frame sync clock.
+	 *
+	 * TERE enabled earlier only for i.MX8MP case for the hardware limitation,
+	 * We need to disable FSD_MSTR before configuring word width, then enable
+	 * FSD_MSTR bit for this specific case.
+	 */
+	if (sai->soc_data->mclk_with_tere && sai->mclk_direction_output &&
+	    !sai->is_consumer_mode)
+		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
+				   FSL_SAI_CR4_FSD_MSTR, 0);
+
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
 			   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK |
 			   FSL_SAI_CR4_CHMOD_MASK,
@@ -680,6 +694,13 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR5(tx, ofs),
 			   FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
 			   FSL_SAI_CR5_FBT_MASK, val_cr5);
+
+	/* Enable FSD_MSTR after configuring word width */
+	if (sai->soc_data->mclk_with_tere && sai->mclk_direction_output &&
+	    !sai->is_consumer_mode)
+		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
+				   FSL_SAI_CR4_FSD_MSTR, FSL_SAI_CR4_FSD_MSTR);
+
 	regmap_write(sai->regmap, FSL_SAI_xMR(tx),
 		     ~0UL - ((1 << min(channels, slots)) - 1));
 
-- 
2.34.1

