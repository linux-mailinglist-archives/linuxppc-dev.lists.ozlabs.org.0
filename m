Return-Path: <linuxppc-dev+bounces-1635-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1D5988035
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 10:23:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFNlB1GWHz30Gf;
	Fri, 27 Sep 2024 18:23:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=92.121.34.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727425398;
	cv=none; b=AkTKoLd63UOMxpPeLbci2LnecoQ+3UFmblMovUmG1mxfcCHqeuHQqv4OzeJQUXh+u2hcD4q9KPAKp+MT+XDa9OqzxGXNr0rL88kgnBF85yjXixP6bEUG1PTngE3JJs3UAa45r6vDh6sV9HEjXy1kGu6x2Fnb1IDygyRjMHOZrztXnm7uo6AxmhNqKtA9O2Ktb6D7YyiZemPoZxS8UwM01hL/OKAQKVDDYYMXVuQnhxOCUKp3e+EXNIRzzfgN81XCoByukmeDxEQIqxAJm0bRL6UD1ZYVuserrb6BKGTL8FXhuF12lnfup5oFMaS9+k0mZDUrafivrw9A1ahDC6/zUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727425398; c=relaxed/relaxed;
	bh=hAMIg+xAC2+zUlS+Cx8zruw+iWDthF8DtZpHmDlFdrw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References; b=GhpSh7koXiqBDDp5+K+qJh7Yenc4CGj5OpI8U00UaC4qIkNIk4tGaw9AF0pOYgCDAKWFPeXA928GTaa1c5ytkYmiNxwY7S5pTD/ufpM2GzWix7Ht/0wK1n8jTTsNmPEKzlNyDs69m1wQ74RlNox5xUFvZo0n8/4EfnJrCe4LRjQSmY7ub2bxuXVVfnPbjwgGGenI++rtNH0Zj/JV2fowUuhr0Fftv0F4K2XshTM8NPHeSd08oatzSbCWoyiGqay18FguBNsqKWZ9VB7QibPnWh6jcgV3pxLnm7TPY/WuO+GAvSKXiFfK04XenNt+UXKUZfwZ7R7x+L8icj7dvppHmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFNl93vPLz30Dw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 18:23:17 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6814A1A1B60;
	Fri, 27 Sep 2024 10:23:14 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 379251A1B45;
	Fri, 27 Sep 2024 10:23:14 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id ED3DA183DC02;
	Fri, 27 Sep 2024 16:23:12 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ASoC: fsl_micfil: Add mclk enable flag
Date: Fri, 27 Sep 2024 16:00:30 +0800
Message-Id: <1727424031-19551-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1727424031-19551-1-git-send-email-shengjiu.wang@nxp.com>
References: <1727424031-19551-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Previously the mclk is enabled in probe() stage, which
is not necessary. Move mclk enablement to hw_params()
and mclk disablement to hw_free() will be more efficient.
'mclk_flag' is used for this case.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index c347cb3a4712..6ecf46e9ac4c 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -58,6 +58,7 @@ struct fsl_micfil {
 	int vad_detected;
 	struct fsl_micfil_verid verid;
 	struct fsl_micfil_param param;
+	bool mclk_flag;  /* mclk enable flag */
 };
 
 struct fsl_micfil_soc_data {
@@ -693,7 +694,6 @@ static int fsl_micfil_reparent_rootclk(struct fsl_micfil *micfil, unsigned int s
 	clk = micfil->mclk;
 
 	/* Disable clock first, for it was enabled by pm_runtime */
-	clk_disable_unprepare(clk);
 	fsl_asoc_reparent_pll_clocks(dev, clk, micfil->pll8k_clk,
 				     micfil->pll11k_clk, ratio);
 	ret = clk_prepare_enable(clk);
@@ -730,6 +730,8 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		return ret;
 
+	micfil->mclk_flag = true;
+
 	ret = clk_set_rate(micfil->mclk, rate * clk_div * osr * 8);
 	if (ret)
 		return ret;
@@ -764,6 +766,17 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int fsl_micfil_hw_free(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct fsl_micfil *micfil = snd_soc_dai_get_drvdata(dai);
+
+	clk_disable_unprepare(micfil->mclk);
+	micfil->mclk_flag = false;
+
+	return 0;
+}
+
 static int fsl_micfil_dai_probe(struct snd_soc_dai *cpu_dai)
 {
 	struct fsl_micfil *micfil = dev_get_drvdata(cpu_dai->dev);
@@ -806,6 +819,7 @@ static const struct snd_soc_dai_ops fsl_micfil_dai_ops = {
 	.startup	= fsl_micfil_startup,
 	.trigger	= fsl_micfil_trigger,
 	.hw_params	= fsl_micfil_hw_params,
+	.hw_free	= fsl_micfil_hw_free,
 };
 
 static struct snd_soc_dai_driver fsl_micfil_dai = {
@@ -1279,7 +1293,8 @@ static int fsl_micfil_runtime_suspend(struct device *dev)
 
 	regcache_cache_only(micfil->regmap, true);
 
-	clk_disable_unprepare(micfil->mclk);
+	if (micfil->mclk_flag)
+		clk_disable_unprepare(micfil->mclk);
 	clk_disable_unprepare(micfil->busclk);
 
 	return 0;
@@ -1294,10 +1309,12 @@ static int fsl_micfil_runtime_resume(struct device *dev)
 	if (ret < 0)
 		return ret;
 
-	ret = clk_prepare_enable(micfil->mclk);
-	if (ret < 0) {
-		clk_disable_unprepare(micfil->busclk);
-		return ret;
+	if (micfil->mclk_flag) {
+		ret = clk_prepare_enable(micfil->mclk);
+		if (ret < 0) {
+			clk_disable_unprepare(micfil->busclk);
+			return ret;
+		}
 	}
 
 	regcache_cache_only(micfil->regmap, false);
-- 
2.34.1


