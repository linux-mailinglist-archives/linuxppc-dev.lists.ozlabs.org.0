Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CD5457BF5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 07:07:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hx33m5jZDz3cHC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 17:07:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BHgQA+Ze;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=46.235.227.227;
 helo=bhuna.collabora.co.uk; envelope-from=ariel.dalessandro@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=BHgQA+Ze; 
 dkim-atps=neutral
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hwgrm2D5Sz302C
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Nov 2021 02:42:00 +1100 (AEDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id ACE3C1F4755E
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637336064; bh=oRI81qODQfEJ663yl3lbyzEbdUf5G6FtXTTtsMOhnZQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BHgQA+ZeKvvoPLbEsSijKakWD/VMNBAwlsrox6vI3l5W9wzdBgdfCoW7MLj4CKrkc
 DNoeAwiwZ+qkwSwXCY3WMFdEtkKvwgWdh1ymyotJgcXcYR73RUu38k0bEDxl+mPwEu
 KRjVHnW303E/9BbBrQ+Rwx4T9L+Ah586iRL1swBEORPOchISBD0OfydF2I6i6B6wNF
 5qEZNTev8iBLnMRbswL4DC6i3C9kTbdqAxGt5uubKauxlGfkUuIIfzA5/WWf0zOVdp
 DEfK++6HHIFjt02E30ajh85ugmKVEExjgGTk/4gEP9uCt3NpQfFhjrxaPt6OMC3rH5
 vS5xE1/IOlmnA==
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [RFC patch 4/5] ASoC: tlv320aic31xx: Handle BCLK set as PLL input
 configuration
Date: Fri, 19 Nov 2021 12:32:47 -0300
Message-Id: <20211119153248.419802-5-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
References: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 20 Nov 2021 17:01:52 +1100
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
Cc: bkylerussell@gmail.com, ariel.dalessandro@collabora.com,
 kuninori.morimoto.gx@renesas.com, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com,
 tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com,
 broonie@kernel.org, michael@amarulasolutions.com, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If BCLK is used as PLL input, the sysclk is determined by the hw
params. So it must be updated here to match the input frequency, based
on sample rate, format and channels.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 sound/soc/codecs/tlv320aic31xx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index e8307f0737f2..4224b4b3cae6 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
@@ -169,6 +170,7 @@ struct aic31xx_priv {
 	struct regulator_bulk_data supplies[AIC31XX_NUM_SUPPLIES];
 	struct aic31xx_disable_nb disable_nb[AIC31XX_NUM_SUPPLIES];
 	struct snd_soc_jack *jack;
+	u32 sysclk_id;
 	unsigned int sysclk;
 	u8 p_div;
 	int rate_div_line;
@@ -962,6 +964,7 @@ static int aic31xx_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
+	struct aic31xx_priv *aic31xx = snd_soc_component_get_drvdata(component);
 	u8 data = 0;
 
 	dev_dbg(component->dev, "## %s: width %d rate %d\n",
@@ -993,6 +996,16 @@ static int aic31xx_hw_params(struct snd_pcm_substream *substream,
 			    AIC31XX_IFACE1_DATALEN_MASK,
 			    data);
 
+	/*
+	 * If BCLK is used as PLL input, the sysclk is determined by the hw
+	 * params. So it must be updated here to match the input frequency.
+	 */
+	if (aic31xx->sysclk_id == AIC31XX_PLL_CLKIN_BCLK) {
+		aic31xx->sysclk = params_rate(params) * params_width(params) *
+				  params_channels(params);
+		aic31xx->p_div = 1;
+	}
+
 	return aic31xx_setup_pll(component, params);
 }
 
@@ -1177,6 +1190,7 @@ static int aic31xx_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 	snd_soc_component_update_bits(component, AIC31XX_CLKMUX, AIC31XX_PLL_CLKIN_MASK,
 			    clk_id << AIC31XX_PLL_CLKIN_SHIFT);
 
+	aic31xx->sysclk_id = clk_id;
 	aic31xx->sysclk = freq;
 
 	return 0;
-- 
2.30.2

