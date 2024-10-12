Return-Path: <linuxppc-dev+bounces-2144-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D9699B13A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 08:15:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQYBz636dz2yMt;
	Sat, 12 Oct 2024 17:15:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=92.121.34.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728713739;
	cv=none; b=A+rf9/15RoQQ6EJPUeybsvwXvdh6WTSrAXiiAhEBx0VorwgvmSNL/4d8k0jHrtGwfv7FxAcLNLG97WkNSFGOXMIBbJb2yIBAZ8Oswoie98u71axU62AhBy5Zqq1BCmaF+/PUalENz9qkhZR5Vw3Mm6U21Mne6Aeel61rDhcRi6Tmq8BCvExf8nDoqRO5JEauSE6pXmtjFyzR6cVrKtVIGblyRAWdGVKd3OJ6KyaDlZgE0SicrNYaiItyOEOmJUCQjBUk42EV6Aqvv0IJnaXr1/3X+DInXyW0nwSn1qNpu9PDelZ/URN5TCAOfSYsPlD0/dzKi4zyAKtIevZQIPJIOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728713739; c=relaxed/relaxed;
	bh=UD819D4o9BTk3wH3NNfg7+lOBOHTGg4CA1/ETTnSre4=;
	h=From:To:Subject:Date:Message-Id; b=in/x+4Co1xRHnkYW+NrNb6x6CfUg4T8pMIPlRL38Q+B0RZI22AUQ7kvmn77cCSx1GSizlP4YU1uehRDR7fakUe9z3TpDnO7/nP7eyduACGDpAxjg+nLu/aGiVwBlJkUZk1PMvX5jxQVwbgig1foxdHZyn+QbZLYXMeiw9/HX0NupZhDPSktCGC0LovlEeVg25SXmoSOERGcjBfsp7dN4JVYEVGkOTuoKd5xPLmOODkkYLFbEqPhzSFkpRLgXMXWHwsrmcHw/HymQY2P0iDoHl8zqVUHJbwUtoATa09NF7ZArNsWDqd5H00HyWfoW9YLuLDGNQjQOQqE8Yuo0MavQ2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQYBx5lrMz2yMD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 17:15:37 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 918A2200C27;
	Sat, 12 Oct 2024 08:15:33 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5929A20067F;
	Sat, 12 Oct 2024 08:15:33 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id C29D91939EA1;
	Sat, 12 Oct 2024 14:15:31 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_mqs: Support accessing registers by scmi interface
Date: Sat, 12 Oct 2024 13:52:10 +0800
Message-Id: <1728712330-4389-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

On i.MX95, the MQS module in Always-on (AON) domain only can
be accessed by System Controller Management Interface (SCMI)
MISC Protocol. So define a specific regmap_config for the case.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_mqs.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 145f9ca15e43..0513e9e8402e 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -6,6 +6,7 @@
 // Copyright 2019 NXP
 
 #include <linux/clk.h>
+#include <linux/firmware/imx/sm.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/mfd/syscon.h>
@@ -74,6 +75,29 @@ struct fsl_mqs {
 #define FSL_MQS_RATES	(SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000)
 #define FSL_MQS_FORMATS	SNDRV_PCM_FMTBIT_S16_LE
 
+static int fsl_mqs_sm_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct fsl_mqs *mqs_priv = context;
+	int num = 1;
+
+	if (IS_ENABLED(CONFIG_IMX_SCMI_MISC_DRV) &&
+	    mqs_priv->soc->ctrl_off == reg)
+		return scmi_imx_misc_ctrl_get(SCMI_IMX_CTRL_MQS1_SETTINGS, &num, val);
+
+	return -EINVAL;
+};
+
+static int fsl_mqs_sm_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct fsl_mqs *mqs_priv = context;
+
+	if (IS_ENABLED(CONFIG_IMX_SCMI_MISC_DRV) &&
+	    mqs_priv->soc->ctrl_off == reg)
+		return scmi_imx_misc_ctrl_set(SCMI_IMX_CTRL_MQS1_SETTINGS, val);
+
+	return -EINVAL;
+};
+
 static int fsl_mqs_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params,
 			     struct snd_soc_dai *dai)
@@ -188,6 +212,13 @@ static const struct regmap_config fsl_mqs_regmap_config = {
 	.cache_type = REGCACHE_NONE,
 };
 
+static const struct regmap_config fsl_mqs_sm_regmap = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_read = fsl_mqs_sm_read,
+	.reg_write = fsl_mqs_sm_write,
+};
+
 static int fsl_mqs_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -219,6 +250,16 @@ static int fsl_mqs_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "failed to get gpr regmap\n");
 			return PTR_ERR(mqs_priv->regmap);
 		}
+	} else if (mqs_priv->soc->type == TYPE_REG_SM) {
+		mqs_priv->regmap = devm_regmap_init(&pdev->dev,
+						    NULL,
+						    mqs_priv,
+						    &fsl_mqs_sm_regmap);
+		if (IS_ERR(mqs_priv->regmap)) {
+			dev_err(&pdev->dev, "failed to init regmap: %ld\n",
+				PTR_ERR(mqs_priv->regmap));
+			return PTR_ERR(mqs_priv->regmap);
+		}
 	} else {
 		regs = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(regs))
-- 
2.34.1


