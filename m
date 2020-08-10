Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5CE24034E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 10:18:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQ83f2dp9zDqS7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 18:18:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQ8236QcWzDqHk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 18:16:42 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CAFC3201779;
 Mon, 10 Aug 2020 10:16:39 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4E6912011A9;
 Mon, 10 Aug 2020 10:16:35 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 7A8A0402D2;
 Mon, 10 Aug 2020 10:16:29 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: fsl-asoc-card: Get "extal" clock rate by clk_get_rate
Date: Mon, 10 Aug 2020 16:11:43 +0800
Message-Id: <1597047103-6863-1-git-send-email-shengjiu.wang@nxp.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On some platform(.e.g. i.MX8QM MEK), the "extal" clock is different
with the mclk of codec, then the clock rate is also different.
So it is better to get clock rate of "extal" rate by clk_get_rate,
don't reuse the clock rate of mclk.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2
- add defer probe handler

 sound/soc/fsl/fsl-asoc-card.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 52adedc03245..32f8f756e6bb 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -696,6 +696,17 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 			goto asrc_fail;
 		}
 	} else if (of_node_name_eq(cpu_np, "esai")) {
+		struct clk *esai_clk = clk_get(&cpu_pdev->dev, "extal");
+
+		if (!IS_ERR(esai_clk)) {
+			priv->cpu_priv.sysclk_freq[TX] = clk_get_rate(esai_clk);
+			priv->cpu_priv.sysclk_freq[RX] = clk_get_rate(esai_clk);
+			clk_put(esai_clk);
+		} else if (PTR_ERR(esai_clk) == -EPROBE_DEFER) {
+			ret = -EPROBE_DEFER;
+			goto asrc_fail;
+		}
+
 		priv->cpu_priv.sysclk_id[1] = ESAI_HCKT_EXTAL;
 		priv->cpu_priv.sysclk_id[0] = ESAI_HCKR_EXTAL;
 	} else if (of_node_name_eq(cpu_np, "sai")) {
-- 
2.27.0

