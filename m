Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A817923C382
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 04:32:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLwdJ6H4TzDqcK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 12:32:36 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLwXl3Yr7zDqZT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 12:28:39 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D53E11A1465;
 Wed,  5 Aug 2020 04:28:35 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3252D1A04CF;
 Wed,  5 Aug 2020 04:28:31 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 472EA402CF;
 Wed,  5 Aug 2020 04:28:25 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ASoC: fsl_sai: Clean code for synchronous mode
Date: Wed,  5 Aug 2020 10:23:52 +0800
Message-Id: <1596594233-13489-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596594233-13489-1-git-send-email-shengjiu.wang@nxp.com>
References: <1596594233-13489-1-git-send-email-shengjiu.wang@nxp.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tx synchronous with Rx: The RMR is the word mask register, it is used
to mask any word in the frame, it is not relating to clock generation,
So it is no need to be changed when Tx is going to be enabled.

Rx synchronous with Tx: The TMR is the word mask register, it is used
to mask any word in the frame, it is not relating to clock generation,
So it is no need to be changed when Rx is going to be enabled.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index cdff739924e2..84714fe7144c 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -470,8 +470,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	/*
 	 * For SAI master mode, when Tx(Rx) sync with Rx(Tx) clock, Rx(Tx) will
 	 * generate bclk and frame clock for Tx(Rx), we should set RCR4(TCR4),
-	 * RCR5(TCR5) and RMR(TMR) for playback(capture), or there will be sync
-	 * error.
+	 * RCR5(TCR5) for playback(capture), or there will be sync error.
 	 */
 
 	if (!sai->is_slave_mode) {
@@ -482,8 +481,6 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 			regmap_update_bits(sai->regmap, FSL_SAI_TCR5(ofs),
 				FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
 				FSL_SAI_CR5_FBT_MASK, val_cr5);
-			regmap_write(sai->regmap, FSL_SAI_TMR,
-				~0UL - ((1 << channels) - 1));
 		} else if (!sai->synchronous[RX] && sai->synchronous[TX] && tx) {
 			regmap_update_bits(sai->regmap, FSL_SAI_RCR4(ofs),
 				FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
@@ -491,8 +488,6 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 			regmap_update_bits(sai->regmap, FSL_SAI_RCR5(ofs),
 				FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
 				FSL_SAI_CR5_FBT_MASK, val_cr5);
-			regmap_write(sai->regmap, FSL_SAI_RMR,
-				~0UL - ((1 << channels) - 1));
 		}
 	}
 
-- 
2.27.0

