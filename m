Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2A65AD083
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 12:48:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLlc51NCXz3bl4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 20:48:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLlbg6LmNz2xG6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 20:47:58 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6B65E1A2024;
	Mon,  5 Sep 2022 12:47:54 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 34F3E1A2026;
	Mon,  5 Sep 2022 12:47:54 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B8CB21820F56;
	Mon,  5 Sep 2022 18:47:52 +0800 (+08)
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
Subject: [PATCH] ASoC: fsl_asrc: Add initialization finishing check in runtime resume
Date: Mon,  5 Sep 2022 18:29:48 +0800
Message-Id: <1662373788-19561-1-git-send-email-shengjiu.wang@nxp.com>
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

If the initialization is not finished, then filling input data to
the FIFO may fail. So it is better to add initialization finishing
check in the runtime resume for suspend & resume case.

And consider the case of three instances working in parallel,
increase the retry times to 50 for more initialization time.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index aa5edf32d988..bae263b90ac1 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -20,6 +20,7 @@
 
 #define IDEAL_RATIO_DECIMAL_DEPTH 26
 #define DIVIDER_NUM  64
+#define INIT_TRY_NUM 50
 
 #define pair_err(fmt, ...) \
 	dev_err(&asrc->pdev->dev, "Pair %c: " fmt, 'A' + index, ##__VA_ARGS__)
@@ -579,7 +580,7 @@ static void fsl_asrc_start_pair(struct fsl_asrc_pair *pair)
 {
 	struct fsl_asrc *asrc = pair->asrc;
 	enum asrc_pair_index index = pair->index;
-	int reg, retry = 10, i;
+	int reg, retry = INIT_TRY_NUM, i;
 
 	/* Enable the current pair */
 	regmap_update_bits(asrc->regmap, REG_ASRCTR,
@@ -592,6 +593,10 @@ static void fsl_asrc_start_pair(struct fsl_asrc_pair *pair)
 		reg &= ASRCFG_INIRQi_MASK(index);
 	} while (!reg && --retry);
 
+	/* FIXME: Doesn't treat initialization timeout as error */
+	if (!retry)
+		dev_warn(&asrc->pdev->dev, "initialization isn't finished\n");
+
 	/* Make the input fifo to ASRC STALL level */
 	regmap_read(asrc->regmap, REG_ASRCNCR, &reg);
 	for (i = 0; i < pair->channels * 4; i++)
@@ -1257,6 +1262,7 @@ static int fsl_asrc_runtime_resume(struct device *dev)
 {
 	struct fsl_asrc *asrc = dev_get_drvdata(dev);
 	struct fsl_asrc_priv *asrc_priv = asrc->private;
+	int reg, retry = INIT_TRY_NUM;
 	int i, ret;
 	u32 asrctr;
 
@@ -1295,6 +1301,17 @@ static int fsl_asrc_runtime_resume(struct device *dev)
 	regmap_update_bits(asrc->regmap, REG_ASRCTR,
 			   ASRCTR_ASRCEi_ALL_MASK, asrctr);
 
+	/* Wait for status of initialization for every enabled pairs */
+	do {
+		udelay(5);
+		regmap_read(asrc->regmap, REG_ASRCFG, &reg);
+		reg = (reg >> ASRCFG_INIRQi_SHIFT(0)) & 0x7;
+	} while ((reg != ((asrctr >> ASRCTR_ASRCEi_SHIFT(0)) & 0x7)) && --retry);
+
+	/* FIXME: Doesn't treat initialization timeout as error */
+	if (!retry)
+		dev_warn(dev, "initialization isn't finished\n");
+
 	return 0;
 
 disable_asrck_clk:
-- 
2.34.1

