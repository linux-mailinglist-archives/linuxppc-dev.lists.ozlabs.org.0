Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B44E3561203
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 07:55:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYSH06DzTz3f0h
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 15:55:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYSFk5Bv5z3bl8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 15:54:17 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 41C57200758;
	Thu, 30 Jun 2022 07:54:14 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CBFCB2009F9;
	Thu, 30 Jun 2022 07:54:13 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 2D181180222B;
	Thu, 30 Jun 2022 13:54:12 +0800 (+08)
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
Subject: [PATCH 1/6] ASoC: fsl_utils: Add function to handle PLL clock source
Date: Thu, 30 Jun 2022 13:39:09 +0800
Message-Id: <1656567554-32122-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1656567554-32122-1-git-send-email-shengjiu.wang@nxp.com>
References: <1656567554-32122-1-git-send-email-shengjiu.wang@nxp.com>
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

i.MX8MQ/MN/MM/MP platforms typically have 2 AUDIO PLLs being
configured to handle 8kHz and 11kHz series audio rates.
Add common function in fsl_utils to handle these two PLL
clock source, which are needed by CPU DAI drivers

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_utils.c | 69 +++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_utils.h |  9 +++++
 2 files changed, 78 insertions(+)

diff --git a/sound/soc/fsl/fsl_utils.c b/sound/soc/fsl/fsl_utils.c
index 9bab202569af..b75843e31f00 100644
--- a/sound/soc/fsl/fsl_utils.c
+++ b/sound/soc/fsl/fsl_utils.c
@@ -6,6 +6,8 @@
 //
 // Copyright 2010 Freescale Semiconductor, Inc.
 
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <sound/soc.h>
@@ -83,6 +85,73 @@ int fsl_asoc_get_dma_channel(struct device_node *ssi_np,
 }
 EXPORT_SYMBOL(fsl_asoc_get_dma_channel);
 
+/**
+ * fsl_asoc_get_pll_clocks - get two PLL clock source
+ *
+ * @dev: device pointer
+ * @pll8k_clk: PLL clock pointer for 8kHz
+ * @pll11k_clk: PLL clock pointer for 11kHz
+ *
+ * This function get two PLL clock source
+ */
+void fsl_asoc_get_pll_clocks(struct device *dev, struct clk **pll8k_clk,
+			     struct clk **pll11k_clk)
+{
+	*pll8k_clk = devm_clk_get(dev, "pll8k");
+	if (IS_ERR(*pll8k_clk))
+		*pll8k_clk = NULL;
+
+	*pll11k_clk = devm_clk_get(dev, "pll11k");
+	if (IS_ERR(*pll11k_clk))
+		*pll11k_clk = NULL;
+}
+EXPORT_SYMBOL(fsl_asoc_get_pll_clocks);
+
+/**
+ * fsl_asoc_reparent_pll_clocks - set clock parent if necessary
+ *
+ * @dev: device pointer
+ * @clk: root clock pointer
+ * @pll8k_clk: PLL clock pointer for 8kHz
+ * @pll11k_clk: PLL clock pointer for 11kHz
+ * @ratio: target requency for root clock
+ *
+ * This function set root clock parent according to the target ratio
+ */
+void fsl_asoc_reparent_pll_clocks(struct device *dev, struct clk *clk,
+				  struct clk *pll8k_clk,
+				  struct clk *pll11k_clk, u64 ratio)
+{
+	struct clk *p, *pll = 0, *npll = 0;
+	bool reparent = false;
+	int ret = 0;
+
+	if (!clk || !pll8k_clk || !pll11k_clk)
+		return;
+
+	p = clk;
+	while (p && pll8k_clk && pll11k_clk) {
+		struct clk *pp = clk_get_parent(p);
+
+		if (clk_is_match(pp, pll8k_clk) ||
+		    clk_is_match(pp, pll11k_clk)) {
+			pll = pp;
+			break;
+		}
+		p = pp;
+	}
+
+	npll = (do_div(ratio, 8000) ? pll11k_clk : pll8k_clk);
+	reparent = (pll && !clk_is_match(pll, npll));
+
+	if (reparent) {
+		ret = clk_set_parent(p, npll);
+		if (ret < 0)
+			dev_warn(dev, "failed to set parent %s: %d\n", __clk_get_name(npll), ret);
+	}
+}
+EXPORT_SYMBOL(fsl_asoc_reparent_pll_clocks);
+
 MODULE_AUTHOR("Timur Tabi <timur@freescale.com>");
 MODULE_DESCRIPTION("Freescale ASoC utility code");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/fsl/fsl_utils.h b/sound/soc/fsl/fsl_utils.h
index c5dc2a14b492..3fec537edd26 100644
--- a/sound/soc/fsl/fsl_utils.h
+++ b/sound/soc/fsl/fsl_utils.h
@@ -11,6 +11,8 @@
 #define _FSL_UTILS_H
 
 #define DAI_NAME_SIZE	32
+#define CLK_8K_FREQ            24576000
+#define CLK_11K_FREQ           22579200
 
 struct snd_soc_dai_link;
 struct device_node;
@@ -19,4 +21,11 @@ int fsl_asoc_get_dma_channel(struct device_node *ssi_np, const char *name,
 			     struct snd_soc_dai_link *dai,
 			     unsigned int *dma_channel_id,
 			     unsigned int *dma_id);
+
+void fsl_asoc_get_pll_clocks(struct device *dev, struct clk **pll8k_clk,
+			     struct clk **pll11k_clk);
+
+void fsl_asoc_reparent_pll_clocks(struct device *dev, struct clk *clk,
+				  struct clk *pll8k_clk,
+				  struct clk *pll11k_clk, u64 ratio);
 #endif /* _FSL_UTILS_H */
-- 
2.17.1

