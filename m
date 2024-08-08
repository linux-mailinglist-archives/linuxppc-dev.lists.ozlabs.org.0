Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5F194B7F3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 09:35:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=JicI+5bd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wff3Y5jCxz3dWn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:35:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=JicI+5bd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.198; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfdX918Pxz3dWk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 17:12:08 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id C163AC0009;
	Thu,  8 Aug 2024 07:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723101119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q0ALEqS0/8Af8b8qGfb/mhvY12MduAyn1Em0H/DF/dY=;
	b=JicI+5bdD7ifuOqelm49xP3TdT/oZe1Emn6j28/9NHUlcq3BLH+MYNR0xXJ27DQwelxuEp
	0yMnlQIIMG+Grtq8Y6Px2T5jtDhM23tkSYZtswGcOXVF7lxTXddfGM2KWsvf97i9Ju589E
	Uk02yq4vGn7xoG5GMnvOI+rQEt/+Kzb+Qryw6pi/y3LwSa+gsK7Ne1h7Kc7AzrGl41OUCd
	timNcaCv5uUQSGabNVzbHc5hqfsTAtor86iS3Cj87syv0ScFca/AvMszJcnxWN/GOdrn+M
	dPPRNXmNmerO/EgzJ0wGiFYYH5/Afb7fjrE0uZNa+nG/5kXWkEWXogfpR4lL+w==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 27/36] soc: fsl: cpm1: qmc: Introduce qmc_{init,exit}_xcc() and their CPM1 version
Date: Thu,  8 Aug 2024 09:11:20 +0200
Message-ID: <20240808071132.149251-28-herve.codina@bootlin.com>
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

Current code handles the CPM1 version of QMC and initialize the QMC used
SCC. The QUICC Engine (QE) version uses an UCC (Unified Communication
Controllers) instead of the SCC (Serial Communication Controllers) used
in the CPM1 version. These controllers serve the same purpose and are
used in the same way but their inializations are slightly different.

In order to prepare the support for QE version of QMC, introduce
qmc_init_xcc() to initialize theses controllers (UCC in QE and SCC in
CPM1) and isolate the CPM1 specific SCC initialization in a specific
function.

Also introduce qmc_exit_xcc() for consistency to revert operations done
in qmc_init_xcc().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 66 +++++++++++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 21 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index eacc7dd2be53..b95227378f97 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -1621,6 +1621,41 @@ static int qmc_init_resources(struct qmc *qmc, struct platform_device *pdev)
 	return qmc_cpm1_init_resources(qmc, pdev);
 }
 
+static int qmc_cpm1_init_scc(struct qmc *qmc)
+{
+	u32 val;
+	int ret;
+
+	/* Connect the serial (SCC) to TSA */
+	ret = tsa_serial_connect(qmc->tsa_serial);
+	if (ret)
+		return dev_err_probe(qmc->dev, ret, "Failed to connect TSA serial\n");
+
+	/* Init GMSR_H and GMSR_L registers */
+	val = SCC_GSMRH_CDS | SCC_GSMRH_CTSS | SCC_GSMRH_CDP | SCC_GSMRH_CTSP;
+	qmc_write32(qmc->scc_regs + SCC_GSMRH, val);
+
+	/* enable QMC mode */
+	qmc_write32(qmc->scc_regs + SCC_GSMRL, SCC_GSMRL_MODE_QMC);
+
+	/* Disable and clear interrupts */
+	qmc_write16(qmc->scc_regs + SCC_SCCM, 0x0000);
+	qmc_write16(qmc->scc_regs + SCC_SCCE, 0x000F);
+
+	return 0;
+}
+
+static int qmc_init_xcc(struct qmc *qmc)
+{
+	return qmc_cpm1_init_scc(qmc);
+}
+
+static void qmc_exit_xcc(struct qmc *qmc)
+{
+	/* Disconnect the serial from TSA */
+	tsa_serial_disconnect(qmc->tsa_serial);
+}
+
 static int qmc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1711,29 +1746,18 @@ static int qmc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	/* Connect the serial (SCC) to TSA */
-	ret = tsa_serial_connect(qmc->tsa_serial);
-	if (ret) {
-		dev_err(qmc->dev, "Failed to connect TSA serial\n");
+	/* Init SCC */
+	ret = qmc_init_xcc(qmc);
+	if (ret)
 		return ret;
-	}
 
-	/* Init GMSR_H and GMSR_L registers */
-	qmc_write32(qmc->scc_regs + SCC_GSMRH,
-		    SCC_GSMRH_CDS | SCC_GSMRH_CTSS | SCC_GSMRH_CDP | SCC_GSMRH_CTSP);
-
-	/* enable QMC mode */
-	qmc_write32(qmc->scc_regs + SCC_GSMRL, SCC_GSMRL_MODE_QMC);
-
-	/* Disable and clear interrupts,  set the irq handler */
-	qmc_write16(qmc->scc_regs + SCC_SCCM, 0x0000);
-	qmc_write16(qmc->scc_regs + SCC_SCCE, 0x000F);
+	/* Set the irq handler */
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		goto err_tsa_serial_disconnect;
+		goto err_exit_xcc;
 	ret = devm_request_irq(qmc->dev, irq, qmc_irq_handler, 0, "qmc", qmc);
 	if (ret < 0)
-		goto err_tsa_serial_disconnect;
+		goto err_exit_xcc;
 
 	/* Enable interrupts */
 	qmc_write16(qmc->scc_regs + SCC_SCCM,
@@ -1761,8 +1785,8 @@ static int qmc_probe(struct platform_device *pdev)
 err_disable_intr:
 	qmc_write16(qmc->scc_regs + SCC_SCCM, 0);
 
-err_tsa_serial_disconnect:
-	tsa_serial_disconnect(qmc->tsa_serial);
+err_exit_xcc:
+	qmc_exit_xcc(qmc);
 	return ret;
 }
 
@@ -1776,8 +1800,8 @@ static void qmc_remove(struct platform_device *pdev)
 	/* Disable interrupts */
 	qmc_write16(qmc->scc_regs + SCC_SCCM, 0);
 
-	/* Disconnect the serial from TSA */
-	tsa_serial_disconnect(qmc->tsa_serial);
+	/* Exit SCC */
+	qmc_exit_xcc(qmc);
 }
 
 static const struct qmc_data qmc_data_cpm1 = {
-- 
2.45.0

