Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B706D54F261
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 09:59:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPWfQ5Cm6z3bpH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 17:59:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPWf12jWMz3bmr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 17:59:20 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E82A01A29AC;
	Fri, 17 Jun 2022 09:59:16 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9E2701A286D;
	Fri, 17 Jun 2022 09:59:16 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B737F1820F56;
	Fri, 17 Jun 2022 15:59:14 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	shengjiu.wang@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/7] ASoC: fsl_sai: Add PDM daifmt support
Date: Fri, 17 Jun 2022 15:44:31 +0800
Message-Id: <1655451877-16382-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1655451877-16382-1-git-send-email-shengjiu.wang@nxp.com>
References: <1655451877-16382-1-git-send-email-shengjiu.wang@nxp.com>
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

PDM format is used for 1-bit stream, so clear the FBT and SYWD,
and the each dataline only has one channel data.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 17 +++++++++++++++--
 sound/soc/fsl/fsl_sai.h |  1 +
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 4f5bd9597c74..d11ee3b6f163 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -224,6 +224,7 @@ static int fsl_sai_set_dai_fmt_tr(struct snd_soc_dai *cpu_dai,
 	if (!sai->is_lsb_first)
 		val_cr4 |= FSL_SAI_CR4_MF;
 
+	sai->is_pdm_mode = false;
 	/* DAI mode */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
@@ -262,6 +263,11 @@ static int fsl_sai_set_dai_fmt_tr(struct snd_soc_dai *cpu_dai,
 		val_cr2 |= FSL_SAI_CR2_BCP;
 		sai->is_dsp_mode = true;
 		break;
+	case SND_SOC_DAIFMT_PDM:
+		val_cr2 |= FSL_SAI_CR2_BCP;
+		val_cr4 &= ~FSL_SAI_CR4_MF;
+		sai->is_pdm_mode = true;
+		break;
 	case SND_SOC_DAIFMT_RIGHT_J:
 		/* To be done */
 	default:
@@ -470,6 +476,13 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 
 	pins = DIV_ROUND_UP(channels, slots);
 
+	/*
+	 * PDM mode, channels are independent
+	 * each channels are on one dataline/FIFO.
+	 */
+	if (sai->is_pdm_mode)
+		pins = channels;
+
 	if (!sai->is_consumer_mode) {
 		if (sai->bclk_ratio)
 			ret = fsl_sai_set_bclk(cpu_dai, tx,
@@ -492,13 +505,13 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-	if (!sai->is_dsp_mode)
+	if (!sai->is_dsp_mode && !sai->is_pdm_mode)
 		val_cr4 |= FSL_SAI_CR4_SYWD(slot_width);
 
 	val_cr5 |= FSL_SAI_CR5_WNW(slot_width);
 	val_cr5 |= FSL_SAI_CR5_W0W(slot_width);
 
-	if (sai->is_lsb_first)
+	if (sai->is_lsb_first || sai->is_pdm_mode)
 		val_cr5 |= FSL_SAI_CR5_FBT(0);
 	else
 		val_cr5 |= FSL_SAI_CR5_FBT(word_width - 1);
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 1c8f5ca07f9d..bc2a86a413e1 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -259,6 +259,7 @@ struct fsl_sai {
 	bool is_consumer_mode;
 	bool is_lsb_first;
 	bool is_dsp_mode;
+	bool is_pdm_mode;
 	bool synchronous[2];
 
 	unsigned int mclk_id[2];
-- 
2.17.1

