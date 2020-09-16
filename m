Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC16E26C1A3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 12:29:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrxCh02ggzDqW5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 20:29:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Brx5J2yDdzDqTx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 20:23:32 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 68E691A0028;
 Wed, 16 Sep 2020 12:23:29 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AC78B1A0065;
 Wed, 16 Sep 2020 12:23:24 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id D895E4029E;
 Wed, 16 Sep 2020 12:23:18 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com
Subject: [PATCH 2/3] ASoC: fsl_sai: Add fsl_sai_check_version function
Date: Wed, 16 Sep 2020 18:16:26 +0800
Message-Id: <1600251387-1863-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600251387-1863-1-git-send-email-shengjiu.wang@nxp.com>
References: <1600251387-1863-1-git-send-email-shengjiu.wang@nxp.com>
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

fsl_sai_check_version can help to parse the version info
in VERID and PARAM registers.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 47 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_sai.h | 28 ++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 24ca528ca2be..738b4dda7847 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -946,6 +946,48 @@ static struct regmap_config fsl_sai_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static int fsl_sai_check_version(struct device *dev)
+{
+	struct fsl_sai *sai = dev_get_drvdata(dev);
+	unsigned char ofs = sai->soc_data->reg_offset;
+	unsigned int val;
+	int ret;
+
+	if (FSL_SAI_TCSR(ofs) == FSL_SAI_VERID)
+		return 0;
+
+	ret = regmap_read(sai->regmap, FSL_SAI_VERID, &val);
+	if (ret < 0)
+		return ret;
+
+	dev_dbg(dev, "VERID: 0x%016X\n", val);
+
+	sai->verid.major = (val & FSL_SAI_VERID_MAJOR_MASK) >>
+			   FSL_SAI_VERID_MAJOR_SHIFT;
+	sai->verid.minor = (val & FSL_SAI_VERID_MINOR_MASK) >>
+			   FSL_SAI_VERID_MINOR_SHIFT;
+	sai->verid.feature = val & FSL_SAI_VERID_FEATURE_MASK;
+
+	ret = regmap_read(sai->regmap, FSL_SAI_PARAM, &val);
+	if (ret < 0)
+		return ret;
+
+	dev_dbg(dev, "PARAM: 0x%016X\n", val);
+
+	/* Max slots per frame, power of 2 */
+	sai->param.slot_num = 1 <<
+		((val & FSL_SAI_PARAM_SPF_MASK) >> FSL_SAI_PARAM_SPF_SHIFT);
+
+	/* Words per fifo, power of 2 */
+	sai->param.fifo_depth = 1 <<
+		((val & FSL_SAI_PARAM_WPF_MASK) >> FSL_SAI_PARAM_WPF_SHIFT);
+
+	/* Number of datalines implemented */
+	sai->param.dataline = val & FSL_SAI_PARAM_DLN_MASK;
+
+	return 0;
+}
+
 static int fsl_sai_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1070,6 +1112,11 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, sai);
 
+	/* Get sai version */
+	ret = fsl_sai_check_version(&pdev->dev);
+	if (ret < 0)
+		dev_warn(&pdev->dev, "Error reading SAI version: %d\n", ret);
+
 	pm_runtime_enable(&pdev->dev);
 	regcache_cache_only(sai->regmap, true);
 
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index d16fc4241f41..ba7425a9e217 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -223,6 +223,32 @@ struct fsl_sai_soc_data {
 	unsigned int reg_offset;
 };
 
+/**
+ * struct fsl_sai_verid - version id data
+ * @major: major version number
+ * @minor: minor version number
+ * @feature: feature specification number
+ *           0000000000000000b - Standard feature set
+ *           0000000000000000b - Standard feature set
+ */
+struct fsl_sai_verid {
+	u32 major;
+	u32 minor;
+	u32 feature;
+};
+
+/**
+ * struct fsl_sai_param - parameter data
+ * @slot_num: The maximum number of slots per frame
+ * @fifo_depth: The number of words in each FIFO (depth)
+ * @dataline: The number of datalines implemented
+ */
+struct fsl_sai_param {
+	u32 slot_num;
+	u32 fifo_depth;
+	u32 dataline;
+};
+
 struct fsl_sai {
 	struct platform_device *pdev;
 	struct regmap *regmap;
@@ -243,6 +269,8 @@ struct fsl_sai {
 	const struct fsl_sai_soc_data *soc_data;
 	struct snd_dmaengine_dai_dma_data dma_params_rx;
 	struct snd_dmaengine_dai_dma_data dma_params_tx;
+	struct fsl_sai_verid verid;
+	struct fsl_sai_param param;
 };
 
 #define TX 1
-- 
2.27.0

