Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A26C0568464
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 11:58:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdFNV4Ylgz3c87
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 19:58:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdFN64Q0vz3blj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 19:57:56 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3C48A20079B;
	Wed,  6 Jul 2022 11:57:53 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 04D402007DE;
	Wed,  6 Jul 2022 11:57:53 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 50153180327D;
	Wed,  6 Jul 2022 17:57:51 +0800 (+08)
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
Subject: [PATCH] ASoC: imx-card: Fix DSD/PDM mclk frequency
Date: Wed,  6 Jul 2022 17:42:55 +0800
Message-Id: <1657100575-8261-1-git-send-email-shengjiu.wang@nxp.com>
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

The DSD/PDM rate not only DSD64/128/256/512, which are the
multiple rate of 44.1kHz,  but also support the multiple
rate of 8kHz, so can't force all mclk frequency to be
22579200Hz, need to assign the frequency according to
rate.

Fixes: aa736700f42f ("ASoC: imx-card: Add imx-card machine driver")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/imx-card.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 1797d777b1b8..ccc4194dc5e7 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -17,6 +17,9 @@
 
 #include "fsl_sai.h"
 
+#define IMX_CARD_MCLK_22P5792MHZ  22579200
+#define IMX_CARD_MCLK_24P576MHZ   24576000
+
 enum codec_type {
 	CODEC_DUMMY = 0,
 	CODEC_AK5558 = 1,
@@ -353,9 +356,14 @@ static int imx_aif_hw_params(struct snd_pcm_substream *substream,
 		mclk_freq = akcodec_get_mclk_rate(substream, params, slots, slot_width);
 	else
 		mclk_freq = params_rate(params) * slots * slot_width;
-	/* Use the maximum freq from DSD512 (512*44100 = 22579200) */
-	if (format_is_dsd(params))
-		mclk_freq = 22579200;
+
+	if (format_is_dsd(params)) {
+		/* Use the maximum freq from DSD512 (512*44100 = 22579200) */
+		if (!(params_rate(params) % 11025))
+			mclk_freq = IMX_CARD_MCLK_22P5792MHZ;
+		else
+			mclk_freq = IMX_CARD_MCLK_24P576MHZ;
+	}
 
 	ret = snd_soc_dai_set_sysclk(cpu_dai, link_data->cpu_sysclk_id, mclk_freq,
 				     SND_SOC_CLOCK_OUT);
-- 
2.17.1

