Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8372049B4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 08:16:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rbdK347HzDqPF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 16:16:21 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rbY62SfrzDqNZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 16:12:41 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BE480200BD4;
 Tue, 23 Jun 2020 08:12:38 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 94DE6200BDB;
 Tue, 23 Jun 2020 08:12:34 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 2080A402B3;
 Tue, 23 Jun 2020 14:12:29 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH v2 1/2] ASoC: fsl_mqs: Don't check clock is NULL before
 calling clk API
Date: Tue, 23 Jun 2020 14:01:11 +0800
Message-Id: <743be216bd504c26e8d45d5ce4a84561b67a122b.1592888591.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1592888591.git.shengjiu.wang@nxp.com>
References: <cover.1592888591.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1592888591.git.shengjiu.wang@nxp.com>
References: <cover.1592888591.git.shengjiu.wang@nxp.com>
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

Because clk_prepare_enable and clk_disable_unprepare should
check input clock parameter is NULL or not internally, then
we don't need to check them before calling the function.

Fixes: 9e28f6532c61 ("ASoC: fsl_mqs: Add MQS component driver")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_mqs.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 0c813a45bba7..b44b134390a3 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -266,11 +266,9 @@ static int fsl_mqs_runtime_resume(struct device *dev)
 {
 	struct fsl_mqs *mqs_priv = dev_get_drvdata(dev);
 
-	if (mqs_priv->ipg)
-		clk_prepare_enable(mqs_priv->ipg);
+	clk_prepare_enable(mqs_priv->ipg);
 
-	if (mqs_priv->mclk)
-		clk_prepare_enable(mqs_priv->mclk);
+	clk_prepare_enable(mqs_priv->mclk);
 
 	if (mqs_priv->use_gpr)
 		regmap_write(mqs_priv->regmap, IOMUXC_GPR2,
@@ -292,11 +290,8 @@ static int fsl_mqs_runtime_suspend(struct device *dev)
 		regmap_read(mqs_priv->regmap, REG_MQS_CTRL,
 			    &mqs_priv->reg_mqs_ctrl);
 
-	if (mqs_priv->mclk)
-		clk_disable_unprepare(mqs_priv->mclk);
-
-	if (mqs_priv->ipg)
-		clk_disable_unprepare(mqs_priv->ipg);
+	clk_disable_unprepare(mqs_priv->mclk);
+	clk_disable_unprepare(mqs_priv->ipg);
 
 	return 0;
 }
-- 
2.21.0

