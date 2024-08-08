Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3129094B7DC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 09:29:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=WEAGftdR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfdwc0Wypz3dRt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:29:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=WEAGftdR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::226; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfdX042B6z3dVZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 17:12:00 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 3BCD1C0008;
	Thu,  8 Aug 2024 07:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723101117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uj6MLd6KFTJCdXGfBKX12l8E7lzam+wSv5WhfHx4wCU=;
	b=WEAGftdRVIAHdJQ1N2ynPABMJJSFoQBOAg7rIRtoQ0ZbAy92S+ngpyq7NVpcvaJEW6tq3W
	Te8v4uBz0TtNmqn1LgMA/fX4CBNoOPNkxnBBTBbEfih9VWzxRsQ4aFO3nrc35DtA1HDYox
	RjkGS7tpHi3AoklfukNSVSWzkYySlYfe22hk6Y8MG5ywhwg43Nme8MShDc23QmyWa0jaFQ
	SPCOoZ7YrhyQPTKx4R0uIEptomep3Cv3TIl1QRQFUcV04P857yCZn/z0GGP74KDj0cuEDY
	0ASHkQnIArWM71n1/VNWOqJkBYPZv+cBq6Y0C1oR8CC56GJJAitcWLfDNLKwEw==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 25/36] soc: fsl: cpm1: qmc: Re-order probe() operations
Date: Thu,  8 Aug 2024 09:11:18 +0200
Message-ID: <20240808071132.149251-26-herve.codina@bootlin.com>
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

Current code handles CPM1 version of QMC. In the QUICC Engine (QE)
version, some operations done at probe() need to be done in a different
order.

In order to prepare the support for the QE version, changed the sequence
of operation done at probe():
- Retrieve the tsa_serial earlier, before initializing resources.
- Group SCC initialisation and do this initialization when it is really
  needed in the probe() sequence.

Having the QE compatible sequence in the CPM1 version does not lead to
any issue and works correctly without any regressions.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 54 +++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 85fc86f91806..8dd0f8fc7b08 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -1614,6 +1614,12 @@ static int qmc_probe(struct platform_device *pdev)
 	}
 	INIT_LIST_HEAD(&qmc->chan_head);
 
+	qmc->tsa_serial = devm_tsa_serial_get_byphandle(qmc->dev, np, "fsl,tsa-serial");
+	if (IS_ERR(qmc->tsa_serial)) {
+		return dev_err_probe(qmc->dev, PTR_ERR(qmc->tsa_serial),
+				     "Failed to get TSA serial\n");
+	}
+
 	qmc->scc_regs = devm_platform_ioremap_resource_byname(pdev, "scc_regs");
 	if (IS_ERR(qmc->scc_regs))
 		return PTR_ERR(qmc->scc_regs);
@@ -1630,33 +1636,13 @@ static int qmc_probe(struct platform_device *pdev)
 	if (IS_ERR(qmc->dpram))
 		return PTR_ERR(qmc->dpram);
 
-	qmc->tsa_serial = devm_tsa_serial_get_byphandle(qmc->dev, np, "fsl,tsa-serial");
-	if (IS_ERR(qmc->tsa_serial)) {
-		return dev_err_probe(qmc->dev, PTR_ERR(qmc->tsa_serial),
-				     "Failed to get TSA serial\n");
-	}
-
-	/* Connect the serial (SCC) to TSA */
-	ret = tsa_serial_connect(qmc->tsa_serial);
-	if (ret) {
-		dev_err(qmc->dev, "Failed to connect TSA serial\n");
-		return ret;
-	}
-
 	/* Parse channels informationss */
 	ret = qmc_of_parse_chans(qmc, np);
 	if (ret)
-		goto err_tsa_serial_disconnect;
+		return ret;
 
 	nb_chans = qmc_nb_chans(qmc);
 
-	/* Init GMSR_H and GMSR_L registers */
-	qmc_write32(qmc->scc_regs + SCC_GSMRH,
-		    SCC_GSMRH_CDS | SCC_GSMRH_CTSS | SCC_GSMRH_CDP | SCC_GSMRH_CTSP);
-
-	/* enable QMC mode */
-	qmc_write32(qmc->scc_regs + SCC_GSMRL, SCC_GSMRL_MODE_QMC);
-
 	/*
 	 * Allocate the buffer descriptor table
 	 * 8 rx and 8 tx descriptors per channel
@@ -1666,8 +1652,7 @@ static int qmc_probe(struct platform_device *pdev)
 					    &qmc->bd_dma_addr, GFP_KERNEL);
 	if (!qmc->bd_table) {
 		dev_err(qmc->dev, "Failed to allocate bd table\n");
-		ret = -ENOMEM;
-		goto err_tsa_serial_disconnect;
+		return -ENOMEM;
 	}
 	memset(qmc->bd_table, 0, qmc->bd_size);
 
@@ -1679,8 +1664,7 @@ static int qmc_probe(struct platform_device *pdev)
 					     &qmc->int_dma_addr, GFP_KERNEL);
 	if (!qmc->int_table) {
 		dev_err(qmc->dev, "Failed to allocate interrupt table\n");
-		ret = -ENOMEM;
-		goto err_tsa_serial_disconnect;
+		return -ENOMEM;
 	}
 	memset(qmc->int_table, 0, qmc->int_size);
 
@@ -1699,18 +1683,32 @@ static int qmc_probe(struct platform_device *pdev)
 
 	ret = qmc_init_tsa(qmc);
 	if (ret)
-		goto err_tsa_serial_disconnect;
+		return ret;
 
 	qmc_write16(qmc->scc_pram + QMC_GBL_QMCSTATE, 0x8000);
 
 	ret = qmc_setup_chans(qmc);
 	if (ret)
-		goto err_tsa_serial_disconnect;
+		return ret;
 
 	/* Init interrupts table */
 	ret = qmc_setup_ints(qmc);
 	if (ret)
-		goto err_tsa_serial_disconnect;
+		return ret;
+
+	/* Connect the serial (SCC) to TSA */
+	ret = tsa_serial_connect(qmc->tsa_serial);
+	if (ret) {
+		dev_err(qmc->dev, "Failed to connect TSA serial\n");
+		return ret;
+	}
+
+	/* Init GMSR_H and GMSR_L registers */
+	qmc_write32(qmc->scc_regs + SCC_GSMRH,
+		    SCC_GSMRH_CDS | SCC_GSMRH_CTSS | SCC_GSMRH_CDP | SCC_GSMRH_CTSP);
+
+	/* enable QMC mode */
+	qmc_write32(qmc->scc_regs + SCC_GSMRL, SCC_GSMRL_MODE_QMC);
 
 	/* Disable and clear interrupts,  set the irq handler */
 	qmc_write16(qmc->scc_regs + SCC_SCCM, 0x0000);
-- 
2.45.0

