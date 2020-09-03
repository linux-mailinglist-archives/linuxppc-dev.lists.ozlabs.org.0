Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BF825B916
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 05:17:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhmFV0FjyzDqVl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 13:17:18 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhmCQ6TfmzDr1c
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Sep 2020 13:15:29 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B02C91A028C;
 Thu,  3 Sep 2020 05:15:25 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 321811A028B;
 Thu,  3 Sep 2020 05:15:21 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 56C2840249;
 Thu,  3 Sep 2020 05:15:15 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com
Subject: [PATCH] ASoC: fsl_sai: Set SAI Channel Mode to Output Mode
Date: Thu,  3 Sep 2020 11:09:15 +0800
Message-Id: <1599102555-17178-1-git-send-email-shengjiu.wang@nxp.com>
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

Transmit data pins will output zero when slots are masked or channels
are disabled. In CHMOD TDM mode, transmit data pins are tri-stated when
slots are masked or channels are disabled. When data pins are tri-stated,
there is noise on some channels when FS clock value is high and data is
read while fsclk is transitioning from high to low.

Signed-off-by: Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 12 ++++++++++--
 sound/soc/fsl/fsl_sai.h |  2 ++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 62c5fdb678fc..33b194a5c1dc 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -486,6 +486,12 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 
 	val_cr4 |= FSL_SAI_CR4_FRSZ(slots);
 
+	/* Output Mode - data pins transmit 0 when slots are masked
+	 * or channels are disabled
+	 */
+	if (tx)
+		val_cr4 |= FSL_SAI_CR4_CHMOD;
+
 	/*
 	 * For SAI master mode, when Tx(Rx) sync with Rx(Tx) clock, Rx(Tx) will
 	 * generate bclk and frame clock for Tx(Rx), we should set RCR4(TCR4),
@@ -494,7 +500,8 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 
 	if (!sai->is_slave_mode && fsl_sai_dir_is_synced(sai, adir)) {
 		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(!tx, ofs),
-				   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
+				   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK |
+				   FSL_SAI_CR4_CHMOD_MASK,
 				   val_cr4);
 		regmap_update_bits(sai->regmap, FSL_SAI_xCR5(!tx, ofs),
 				   FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
@@ -502,7 +509,8 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
-			   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
+			   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK |
+			   FSL_SAI_CR4_CHMOD_MASK,
 			   val_cr4);
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR5(tx, ofs),
 			   FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 6aba7d28f5f3..19cd4e1bbff9 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -119,6 +119,8 @@
 #define FSL_SAI_CR4_FRSZ_MASK	(0x1f << 16)
 #define FSL_SAI_CR4_SYWD(x)	(((x) - 1) << 8)
 #define FSL_SAI_CR4_SYWD_MASK	(0x1f << 8)
+#define FSL_SAI_CR4_CHMOD       BIT(5)
+#define FSL_SAI_CR4_CHMOD_MASK  BIT(5)
 #define FSL_SAI_CR4_MF		BIT(4)
 #define FSL_SAI_CR4_FSE		BIT(3)
 #define FSL_SAI_CR4_FSP		BIT(1)
-- 
2.27.0

