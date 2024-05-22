Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id BEAF48CB9DB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 05:36:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VkcH770pqz78n1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 13:29:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VkcFq50Jmz3g99
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 13:28:15 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E20011A0E4D;
	Wed, 22 May 2024 05:28:12 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7A31D1A033A;
	Wed, 22 May 2024 05:28:12 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 8E96F183B72B;
	Wed, 22 May 2024 11:28:10 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] ASoC: fsl_mqs: Add i.MX95 platform support
Date: Wed, 22 May 2024 11:08:25 +0800
Message-Id: <1716347305-18457-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1716347305-18457-1-git-send-email-shengjiu.wang@nxp.com>
References: <1716347305-18457-1-git-send-email-shengjiu.wang@nxp.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are two MQS instances on the i.MX95 platform.
The definition of bit positions in the control register are
different. In order to support these MQS modules, define
two compatible strings to distinguish them.

Define different soc data according to compatible strings

On i.MX95 one instance in nect-mix is supported by this
commit, another instance in always-on-mix is not supported,
which depends on System Manager function readiness.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_mqs.c | 46 +++++++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 60929c36a0e3..c95b84a54dc4 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -28,10 +28,16 @@
 #define MQS_CLK_DIV_MASK		(0xFF << 0)
 #define MQS_CLK_DIV_SHIFT		(0)
 
+enum reg_type {
+	TYPE_REG_OWN,  /* module own register space */
+	TYPE_REG_GPR,  /* register in GPR space */
+	TYPE_REG_SM,   /* System Manager controls the register */
+};
+
 /**
  * struct fsl_mqs_soc_data - soc specific data
  *
- * @use_gpr: control register is in General Purpose Register group
+ * @type: control register space type
  * @ctrl_off: control register offset
  * @en_mask: enable bit mask
  * @en_shift: enable bit shift
@@ -43,7 +49,7 @@
  * @div_shift: clock divider bit shift
  */
 struct fsl_mqs_soc_data {
-	bool use_gpr;
+	enum reg_type type;
 	int  ctrl_off;
 	int  en_mask;
 	int  en_shift;
@@ -200,7 +206,7 @@ static int fsl_mqs_probe(struct platform_device *pdev)
 	 */
 	mqs_priv->soc = of_device_get_match_data(&pdev->dev);
 
-	if (mqs_priv->soc->use_gpr) {
+	if (mqs_priv->soc->type == TYPE_REG_GPR) {
 		gpr_np = of_parse_phandle(np, "gpr", 0);
 		if (!gpr_np) {
 			dev_err(&pdev->dev, "failed to get gpr node by phandle\n");
@@ -304,7 +310,7 @@ static const struct dev_pm_ops fsl_mqs_pm_ops = {
 };
 
 static const struct fsl_mqs_soc_data fsl_mqs_imx8qm_data = {
-	.use_gpr = false,
+	.type = TYPE_REG_OWN,
 	.ctrl_off = REG_MQS_CTRL,
 	.en_mask  = MQS_EN_MASK,
 	.en_shift = MQS_EN_SHIFT,
@@ -317,7 +323,7 @@ static const struct fsl_mqs_soc_data fsl_mqs_imx8qm_data = {
 };
 
 static const struct fsl_mqs_soc_data fsl_mqs_imx6sx_data = {
-	.use_gpr = true,
+	.type = TYPE_REG_GPR,
 	.ctrl_off = IOMUXC_GPR2,
 	.en_mask  = IMX6SX_GPR2_MQS_EN_MASK,
 	.en_shift = IMX6SX_GPR2_MQS_EN_SHIFT,
@@ -330,7 +336,7 @@ static const struct fsl_mqs_soc_data fsl_mqs_imx6sx_data = {
 };
 
 static const struct fsl_mqs_soc_data fsl_mqs_imx93_data = {
-	.use_gpr = true,
+	.type = TYPE_REG_GPR,
 	.ctrl_off = 0x20,
 	.en_mask  = BIT(1),
 	.en_shift = 1,
@@ -342,10 +348,38 @@ static const struct fsl_mqs_soc_data fsl_mqs_imx93_data = {
 	.div_shift = 8,
 };
 
+static const struct fsl_mqs_soc_data fsl_mqs_imx95_aon_data = {
+	.type = TYPE_REG_SM,
+	.ctrl_off = 0x88,
+	.en_mask  = BIT(1),
+	.en_shift = 1,
+	.rst_mask = BIT(2),
+	.rst_shift = 2,
+	.osr_mask = BIT(3),
+	.osr_shift = 3,
+	.div_mask = GENMASK(15, 8),
+	.div_shift = 8,
+};
+
+static const struct fsl_mqs_soc_data fsl_mqs_imx95_netc_data = {
+	.type = TYPE_REG_GPR,
+	.ctrl_off = 0x0,
+	.en_mask  = BIT(2),
+	.en_shift = 2,
+	.rst_mask = BIT(3),
+	.rst_shift = 3,
+	.osr_mask = BIT(4),
+	.osr_shift = 4,
+	.div_mask = GENMASK(16, 9),
+	.div_shift = 9,
+};
+
 static const struct of_device_id fsl_mqs_dt_ids[] = {
 	{ .compatible = "fsl,imx8qm-mqs", .data = &fsl_mqs_imx8qm_data },
 	{ .compatible = "fsl,imx6sx-mqs", .data = &fsl_mqs_imx6sx_data },
 	{ .compatible = "fsl,imx93-mqs", .data = &fsl_mqs_imx93_data },
+	{ .compatible = "fsl,imx95-aonmix-mqs", .data = &fsl_mqs_imx95_aon_data },
+	{ .compatible = "fsl,imx95-netcmix-mqs", .data = &fsl_mqs_imx95_netc_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_mqs_dt_ids);
-- 
2.34.1

