Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD4193F846
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:37:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ZBUUtOFQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXgtL5L0nz3cj7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:37:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ZBUUtOFQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgXH0M5kz2yvh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:21:34 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 0612E240006;
	Mon, 29 Jul 2024 14:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722262892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QMfEiRmSRkX/pBoCz01B9PXrobVJrcp4KetogWxNR/M=;
	b=ZBUUtOFQ8SFGjFY3X2fnmSHouUeMuj/jwtcKOIHojHN/ttdqMIMat1BGBIKsZW9wkhwU4V
	pIXJaTatfsWmYpaxjgOTrDdBggksFCafHPOqo2JokVRJEneOYTEmkH0fzYe6iRlgvjgVNB
	6sjpadb/6YW9p5h9HlkTbTrQSiVv3pZSM6C0z+HwrqctnPADj50QkUmxZY++/QSf68QWRU
	794DnmUXs0OiVZVnRIpQBFvEwHYL7KFXLHPRaOdf2Snt6AsCRvCpcR+B6N66jw8Hso7Au2
	wPGMlwT5RtVPZ/9rD8Rz8HQNfTn9b2odwHWfQ7K8PbMc5yU9g2I3jNVc/F+PJw==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 24/36] soc: fsl: cpm1: qmc: Introduce qmc_data structure
Date: Mon, 29 Jul 2024 16:20:53 +0200
Message-ID: <20240729142107.104574-25-herve.codina@bootlin.com>
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

Current code handles CPM1 version of QMC. Some hardcoded values are used
several times to initialize the QMC state machine. In the QUICC Engine
(QE) version of QMC, these values are different.

In order to prepare the support for the QE version of QMC and avoid the
copy of the hardcoded values, introduce the qmc_data structure to define
these version specific values.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 69 ++++++++++++++++++++++++++--------------
 1 file changed, 46 insertions(+), 23 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 3736a8e4575e..85fc86f91806 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -215,8 +215,17 @@ struct qmc_chan {
 	bool	is_rx_stopped;
 };
 
+struct qmc_data {
+	u32 tstate; /* Initial TSTATE value */
+	u32 rstate; /* Initial RSTATE value */
+	u32 zistate; /* Initial ZISTATE value */
+	u32 zdstate_hdlc; /* Initial ZDSTATE value (HDLC mode) */
+	u32 zdstate_transp; /* Initial ZDSTATE value (Transparent mode) */
+};
+
 struct qmc {
 	struct device *dev;
+	const struct qmc_data *data;
 	struct tsa_serial *tsa_serial;
 	void __iomem *scc_regs;
 	void __iomem *scc_pram;
@@ -543,11 +552,11 @@ int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 	/* Restart receiver if needed */
 	if (chan->is_rx_halted && !chan->is_rx_stopped) {
 		/* Restart receiver */
-		if (chan->mode == QMC_TRANSPARENT)
-			qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x18000080);
-		else
-			qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x00000080);
-		qmc_write32(chan->s_param + QMC_SPE_RSTATE, 0x31000000);
+		qmc_write32(chan->s_param + QMC_SPE_ZDSTATE,
+			    chan->mode == QMC_TRANSPARENT ?
+				chan->qmc->data->zdstate_transp :
+				chan->qmc->data->zdstate_hdlc);
+		qmc_write32(chan->s_param + QMC_SPE_RSTATE, chan->qmc->data->rstate);
 		chan->is_rx_halted = false;
 	}
 	chan->rx_pending++;
@@ -971,11 +980,11 @@ static int qmc_chan_start_rx(struct qmc_chan *chan)
 	}
 
 	/* Restart the receiver */
-	if (chan->mode == QMC_TRANSPARENT)
-		qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x18000080);
-	else
-		qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x00000080);
-	qmc_write32(chan->s_param + QMC_SPE_RSTATE, 0x31000000);
+	qmc_write32(chan->s_param + QMC_SPE_ZDSTATE,
+		    chan->mode == QMC_TRANSPARENT ?
+			chan->qmc->data->zdstate_transp :
+			chan->qmc->data->zdstate_hdlc);
+	qmc_write32(chan->s_param + QMC_SPE_RSTATE, chan->qmc->data->rstate);
 	chan->is_rx_halted = false;
 
 	chan->is_rx_stopped = false;
@@ -1121,8 +1130,8 @@ static void qmc_chan_reset_tx(struct qmc_chan *chan)
 		    qmc_read16(chan->s_param + QMC_SPE_TBASE));
 
 	/* Reset TSTATE and ZISTATE to their initial value */
-	qmc_write32(chan->s_param + QMC_SPE_TSTATE, 0x30000000);
-	qmc_write32(chan->s_param + QMC_SPE_ZISTATE, 0x00000100);
+	qmc_write32(chan->s_param + QMC_SPE_TSTATE, chan->qmc->data->tstate);
+	qmc_write32(chan->s_param + QMC_SPE_ZISTATE, chan->qmc->data->zistate);
 
 	spin_unlock_irqrestore(&chan->tx_lock, flags);
 }
@@ -1393,11 +1402,11 @@ static int qmc_setup_chan(struct qmc *qmc, struct qmc_chan *chan)
 	val = ((chan->id * (QMC_NB_TXBDS + QMC_NB_RXBDS)) + QMC_NB_TXBDS) * sizeof(cbd_t);
 	qmc_write16(chan->s_param + QMC_SPE_RBASE, val);
 	qmc_write16(chan->s_param + QMC_SPE_RBPTR, val);
-	qmc_write32(chan->s_param + QMC_SPE_TSTATE, 0x30000000);
-	qmc_write32(chan->s_param + QMC_SPE_RSTATE, 0x31000000);
-	qmc_write32(chan->s_param + QMC_SPE_ZISTATE, 0x00000100);
+	qmc_write32(chan->s_param + QMC_SPE_TSTATE, chan->qmc->data->tstate);
+	qmc_write32(chan->s_param + QMC_SPE_RSTATE, chan->qmc->data->rstate);
+	qmc_write32(chan->s_param + QMC_SPE_ZISTATE, chan->qmc->data->zistate);
 	if (chan->mode == QMC_TRANSPARENT) {
-		qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x18000080);
+		qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, chan->qmc->data->zdstate_transp);
 		qmc_write16(chan->s_param + QMC_SPE_TMRBLR, 60);
 		val = QMC_SPE_CHAMR_MODE_TRANSP;
 		if (chan->is_reverse_data)
@@ -1407,7 +1416,7 @@ static int qmc_setup_chan(struct qmc *qmc, struct qmc_chan *chan)
 		if (ret)
 			return ret;
 	} else {
-		qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x00000080);
+		qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, chan->qmc->data->zdstate_hdlc);
 		qmc_write16(chan->s_param + QMC_SPE_MFLR, 60);
 		qmc_write16(chan->s_param + QMC_SPE_CHAMR,
 			    QMC_SPE_CHAMR_MODE_HDLC | QMC_SPE_CHAMR_HDLC_IDLM);
@@ -1535,11 +1544,12 @@ static void qmc_irq_gint(struct qmc *qmc)
 			/* Restart the receiver if needed */
 			spin_lock_irqsave(&chan->rx_lock, flags);
 			if (chan->rx_pending && !chan->is_rx_stopped) {
-				if (chan->mode == QMC_TRANSPARENT)
-					qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x18000080);
-				else
-					qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x00000080);
-				qmc_write32(chan->s_param + QMC_SPE_RSTATE, 0x31000000);
+				qmc_write32(chan->s_param + QMC_SPE_ZDSTATE,
+					    chan->mode == QMC_TRANSPARENT ?
+						chan->qmc->data->zdstate_transp :
+						chan->qmc->data->zdstate_hdlc);
+				qmc_write32(chan->s_param + QMC_SPE_RSTATE,
+					    chan->qmc->data->rstate);
 				chan->is_rx_halted = false;
 			} else {
 				chan->is_rx_halted = true;
@@ -1597,6 +1607,11 @@ static int qmc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	qmc->dev = &pdev->dev;
+	qmc->data = of_device_get_match_data(&pdev->dev);
+	if (!qmc->data) {
+		dev_err(qmc->dev, "Missing match data\n");
+		return -EINVAL;
+	}
 	INIT_LIST_HEAD(&qmc->chan_head);
 
 	qmc->scc_regs = devm_platform_ioremap_resource_byname(pdev, "scc_regs");
@@ -1752,8 +1767,16 @@ static void qmc_remove(struct platform_device *pdev)
 	tsa_serial_disconnect(qmc->tsa_serial);
 }
 
+static const struct qmc_data qmc_data_cpm1 = {
+	.tstate = 0x30000000,
+	.rstate = 0x31000000,
+	.zistate = 0x00000100,
+	.zdstate_hdlc = 0x00000080,
+	.zdstate_transp = 0x18000080,
+};
+
 static const struct of_device_id qmc_id_table[] = {
-	{ .compatible = "fsl,cpm1-scc-qmc" },
+	{ .compatible = "fsl,cpm1-scc-qmc", .data = &qmc_data_cpm1 },
 	{} /* sentinel */
 };
 MODULE_DEVICE_TABLE(of, qmc_id_table);
-- 
2.45.0

