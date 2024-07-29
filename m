Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D24F993F822
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:34:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=GmfMwSrm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXgpy5cPTz3cbX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:34:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=GmfMwSrm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgXC3L3rz3cfB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:21:31 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 56E5D240012;
	Mon, 29 Jul 2024 14:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722262889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PujWEEqVrHtZSSAKi2FwKGenicKUYocXZABNhblP/pE=;
	b=GmfMwSrmUzjKDB2KO2si9H0exlkk+DtbTzD1Bxm7JRKX55Qp5GnuJ0Y8h1DfD+jFFNyI3I
	LbLDBM6PFs+xN1aplU80g07MQzZPazP1t7aQxFxYqv2qGxNBFq31PmsNdpq+Rl9/VsB3Sb
	5n9DNkIi6aenRrUL1wdbxgopjCdeoxr88b5j/d/S2sLuJUO1HWdqIc3bcHFI8yqA9mkbE9
	HfNSy6f4VCbi7K6kKVLOznyjBycD86WJml27Wfyd+inO4Ixtebw7JRRdW+Mzw/f7xOuIuo
	U37UDoxwk+byK8kgBBIOeAk1HTcW8kY/Jxjn/ILLS77g76o6uvcSgk1aLCn74Q==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 19/36] soc: fsl: cpm1: qmc: Fix blank line and spaces
Date: Mon, 29 Jul 2024 16:20:48 +0200
Message-ID: <20240729142107.104574-20-herve.codina@bootlin.com>
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

checkpatch.pl raises the following issues
  CHECK: Please don't use multiple blank lines
  CHECK: Alignment should match open parenthesis

Fix them.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index e2ac3e59bb79..44bd9b949770 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -274,7 +274,6 @@ static void qmc_setbits32(void __iomem *addr, u32 set)
 	qmc_write32(addr, qmc_read32(addr) | set);
 }
 
-
 int qmc_chan_get_info(struct qmc_chan *chan, struct qmc_chan_info *info)
 {
 	struct tsa_serial_info tsa_info;
@@ -1411,7 +1410,7 @@ static int qmc_setup_chan(struct qmc *qmc, struct qmc_chan *chan)
 		qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x00000080);
 		qmc_write16(chan->s_param + QMC_SPE_MFLR, 60);
 		qmc_write16(chan->s_param + QMC_SPE_CHAMR,
-			QMC_SPE_CHAMR_MODE_HDLC | QMC_SPE_CHAMR_HDLC_IDLM);
+			    QMC_SPE_CHAMR_MODE_HDLC | QMC_SPE_CHAMR_HDLC_IDLM);
 	}
 
 	/* Do not enable interrupts now. They will be enabled later */
@@ -1604,7 +1603,6 @@ static int qmc_probe(struct platform_device *pdev)
 	if (IS_ERR(qmc->scc_regs))
 		return PTR_ERR(qmc->scc_regs);
 
-
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "scc_pram");
 	if (!res)
 		return -EINVAL;
@@ -1650,7 +1648,7 @@ static int qmc_probe(struct platform_device *pdev)
 	 */
 	qmc->bd_size = (nb_chans * (QMC_NB_TXBDS + QMC_NB_RXBDS)) * sizeof(cbd_t);
 	qmc->bd_table = dmam_alloc_coherent(qmc->dev, qmc->bd_size,
-		&qmc->bd_dma_addr, GFP_KERNEL);
+					    &qmc->bd_dma_addr, GFP_KERNEL);
 	if (!qmc->bd_table) {
 		dev_err(qmc->dev, "Failed to allocate bd table\n");
 		ret = -ENOMEM;
@@ -1663,7 +1661,7 @@ static int qmc_probe(struct platform_device *pdev)
 	/* Allocate the interrupt table */
 	qmc->int_size = QMC_NB_INTS * sizeof(u16);
 	qmc->int_table = dmam_alloc_coherent(qmc->dev, qmc->int_size,
-		&qmc->int_dma_addr, GFP_KERNEL);
+					     &qmc->int_dma_addr, GFP_KERNEL);
 	if (!qmc->int_table) {
 		dev_err(qmc->dev, "Failed to allocate interrupt table\n");
 		ret = -ENOMEM;
@@ -1711,7 +1709,7 @@ static int qmc_probe(struct platform_device *pdev)
 
 	/* Enable interrupts */
 	qmc_write16(qmc->scc_regs + SCC_SCCM,
-		SCC_SCCE_IQOV | SCC_SCCE_GINT | SCC_SCCE_GUN | SCC_SCCE_GOV);
+		    SCC_SCCE_IQOV | SCC_SCCE_GINT | SCC_SCCE_GUN | SCC_SCCE_GOV);
 
 	ret = qmc_finalize_chans(qmc);
 	if (ret < 0)
-- 
2.45.0

