Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B30AE94B7DF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 09:30:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=YKGEBMq8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfdxM4WK2z3dVK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:30:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=YKGEBMq8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::226; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfdX12H16z3dFS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 17:12:01 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 09703C0004;
	Thu,  8 Aug 2024 07:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723101118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WRWRYsao//QuuKGXh5Qe/5pgiQSleHHmlQQU/Eyhza0=;
	b=YKGEBMq8oR9pt28x8GLB1+n7+4maaPD4Cnnq4K0yuYiuw6W1bbQOlPLPVEJRCmwC5u9pjx
	ff1Iiq6J+s1gKcHOdfvAMzIP705AOxyXyb53JJ60tVKLZB+OFyBreTBnJGgq9m/K/Z3dTs
	6Vn7aoevKH0sysLJbqYMAAPUV49+vv+F/cODBlWYmBkIIeRrmjPDHfoFwFQMdu2ETS6WMY
	QBYL2WdDSGj87MyJtdgCPTsDQSNwJCcuxny9JogncMA/r854zXYBcZOkY0Ck9CBOH8feYj
	3YGl53hXZL0Yhgl9fcCmENvthBqYx2zY/nRn58yAg4MY1nbATDBFXrK21uY2ew==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 26/36] soc: fsl: cpm1: qmc: Introduce qmc_init_resource() and its CPM1 version
Date: Thu,  8 Aug 2024 09:11:19 +0200
Message-ID: <20240808071132.149251-27-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240808071132.149251-1-herve.codina@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Current code handles the CPM1 version of QMC. Resources initialisations
(i.e. retrieving base addresses and offsets of different parts) will
be slightly different in the QUICC Engine (QE) version. Indeed, in QE
version, some resources need to be allocated and are no more "staticaly"
defined.

In order to prepare the support for QE version, introduce
qmc_init_resource() to initialize those resources and isolate the CPM1
specific operations in a specific function.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 47 ++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 8dd0f8fc7b08..eacc7dd2be53 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -1593,11 +1593,38 @@ static irqreturn_t qmc_irq_handler(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
+static int qmc_cpm1_init_resources(struct qmc *qmc, struct platform_device *pdev)
+{
+	struct resource *res;
+
+	qmc->scc_regs = devm_platform_ioremap_resource_byname(pdev, "scc_regs");
+	if (IS_ERR(qmc->scc_regs))
+		return PTR_ERR(qmc->scc_regs);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "scc_pram");
+	if (!res)
+		return -EINVAL;
+	qmc->scc_pram_offset = res->start - get_immrbase();
+	qmc->scc_pram = devm_ioremap_resource(qmc->dev, res);
+	if (IS_ERR(qmc->scc_pram))
+		return PTR_ERR(qmc->scc_pram);
+
+	qmc->dpram  = devm_platform_ioremap_resource_byname(pdev, "dpram");
+	if (IS_ERR(qmc->dpram))
+		return PTR_ERR(qmc->dpram);
+
+	return 0;
+}
+
+static int qmc_init_resources(struct qmc *qmc, struct platform_device *pdev)
+{
+	return qmc_cpm1_init_resources(qmc, pdev);
+}
+
 static int qmc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	unsigned int nb_chans;
-	struct resource *res;
 	struct qmc *qmc;
 	int irq;
 	int ret;
@@ -1620,21 +1647,9 @@ static int qmc_probe(struct platform_device *pdev)
 				     "Failed to get TSA serial\n");
 	}
 
-	qmc->scc_regs = devm_platform_ioremap_resource_byname(pdev, "scc_regs");
-	if (IS_ERR(qmc->scc_regs))
-		return PTR_ERR(qmc->scc_regs);
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "scc_pram");
-	if (!res)
-		return -EINVAL;
-	qmc->scc_pram_offset = res->start - get_immrbase();
-	qmc->scc_pram = devm_ioremap_resource(qmc->dev, res);
-	if (IS_ERR(qmc->scc_pram))
-		return PTR_ERR(qmc->scc_pram);
-
-	qmc->dpram  = devm_platform_ioremap_resource_byname(pdev, "dpram");
-	if (IS_ERR(qmc->dpram))
-		return PTR_ERR(qmc->dpram);
+	ret = qmc_init_resources(qmc, pdev);
+	if (ret)
+		return ret;
 
 	/* Parse channels informationss */
 	ret = qmc_of_parse_chans(qmc, np);
-- 
2.45.0

