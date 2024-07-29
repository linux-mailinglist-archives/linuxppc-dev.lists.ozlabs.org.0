Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA07E93F85D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:38:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=CoM3pBGP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXgw25gPGz3cXy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:38:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=CoM3pBGP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgXJ5cJFz3cYq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:21:36 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id AD7E5240010;
	Mon, 29 Jul 2024 14:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722262893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uj6MLd6KFTJCdXGfBKX12l8E7lzam+wSv5WhfHx4wCU=;
	b=CoM3pBGPJ2hyuxKCH6UPNV4MzbNI4KL9bdDsGxLzw5Tk1ZR+/UwTgNyQ68LaeOlFRKnuIU
	bywjgvAHJ5GeI7F9kJbQawakP+91s+xfgqH9UaBmjduPW+ekfXg14jvbk353EYZ6nWYWbJ
	JsyfLrfMQvlrrKnl19XlY3xel3cF5ejTTCco28hwUD2tDah7ApqNcTIam3E/k6QNbVAe8G
	fV7pDjgrOeA/sUd/ovnnqoimE40ORu/Z8Ge32Umz6vQe2Kdg2riFHtRE+5XdhdfK6FrZPL
	h/aW/CK3977AwoTHnuB0JvwqgG6HrUdJX+1u67zEsfiKrFLsP8Q/xzTKka2WAA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 25/36] soc: fsl: cpm1: qmc: Re-order probe() operations
Date: Mon, 29 Jul 2024 16:20:54 +0200
Message-ID: <20240729142107.104574-26-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240729142107.104574-1-herve.codina@bootlin.com>
References: <20240729142107.104574-1-herve.codina@bootlin.com>
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

