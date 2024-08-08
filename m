Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5652494B7E5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 09:31:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=HhHKjZTN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfdyt1sckz3dX1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:31:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=HhHKjZTN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.198; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfdX33080z3dK1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 17:12:03 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 51B8AC000B;
	Thu,  8 Aug 2024 07:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723101120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ns1shNAo8zEhYUmPszlirWDSVtM9okYPzpFYT+pVz24=;
	b=HhHKjZTN3TIWxgS9BA+NzIJH9M0Nw1IJKYJ3QvoNPHSduDj0Na/SmlST0OLz7qYRiuX2PD
	3HOyFQiPPMnFnEufReTfQuPQ2U/CuW6FKWjpxr8SwTjljWAWRjqzP3yuuuft75lyzgTQK7
	zKGxCjYi09J7rP3bG2Vv3HE8xqzOzdHIYPz6okN6VIqVj6bJvoXu1eb4OHekfsSOBO7tY1
	idbrXx8U7sQGpegZ7pmXz9h+CR/E9IkkqTjoD4bhjQgAqgZnJJ3Qv8PApwBMa/VrkfuSYC
	6OU/Sn737ElhQ8S8GKpYkimjX3CJCf2fHuQKpgZM8vl+MO6sJT6wG0sr8wJCjQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 29/36] soc: fsl: cpm1: qmc: Handle RPACK initialization
Date: Thu,  8 Aug 2024 09:11:22 +0200
Message-ID: <20240808071132.149251-30-herve.codina@bootlin.com>
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

Current code handles the CPM1 version of QMC, RPACK does not need to
be initialized. This is not the case in the QUICC Engine (QE) version.

In preparation of the support for QE, initialize the RPACK register
when the receiver is initialized and each time it is restarted.

This additional RPACK initialization has no impact in the CPM1 version
of QMC.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 272da250a763..63af2608c3cd 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -221,6 +221,7 @@ struct qmc_data {
 	u32 zistate; /* Initial ZISTATE value */
 	u32 zdstate_hdlc; /* Initial ZDSTATE value (HDLC mode) */
 	u32 zdstate_transp; /* Initial ZDSTATE value (Transparent mode) */
+	u32 rpack; /* Initial RPACK value */
 };
 
 struct qmc {
@@ -552,6 +553,7 @@ int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 	/* Restart receiver if needed */
 	if (chan->is_rx_halted && !chan->is_rx_stopped) {
 		/* Restart receiver */
+		qmc_write32(chan->s_param + QMC_SPE_RPACK, chan->qmc->data->rpack);
 		qmc_write32(chan->s_param + QMC_SPE_ZDSTATE,
 			    chan->mode == QMC_TRANSPARENT ?
 				chan->qmc->data->zdstate_transp :
@@ -980,6 +982,7 @@ static int qmc_chan_start_rx(struct qmc_chan *chan)
 	}
 
 	/* Restart the receiver */
+	qmc_write32(chan->s_param + QMC_SPE_RPACK, chan->qmc->data->rpack);
 	qmc_write32(chan->s_param + QMC_SPE_ZDSTATE,
 		    chan->mode == QMC_TRANSPARENT ?
 			chan->qmc->data->zdstate_transp :
@@ -1405,6 +1408,7 @@ static int qmc_setup_chan(struct qmc *qmc, struct qmc_chan *chan)
 	qmc_write32(chan->s_param + QMC_SPE_TSTATE, chan->qmc->data->tstate);
 	qmc_write32(chan->s_param + QMC_SPE_RSTATE, chan->qmc->data->rstate);
 	qmc_write32(chan->s_param + QMC_SPE_ZISTATE, chan->qmc->data->zistate);
+	qmc_write32(chan->s_param + QMC_SPE_RPACK, chan->qmc->data->rpack);
 	if (chan->mode == QMC_TRANSPARENT) {
 		qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, chan->qmc->data->zdstate_transp);
 		qmc_write16(chan->s_param + QMC_SPE_TMRBLR, 60);
@@ -1544,6 +1548,8 @@ static void qmc_irq_gint(struct qmc *qmc)
 			/* Restart the receiver if needed */
 			spin_lock_irqsave(&chan->rx_lock, flags);
 			if (chan->rx_pending && !chan->is_rx_stopped) {
+				qmc_write32(chan->s_param + QMC_SPE_RPACK,
+					    chan->qmc->data->rpack);
 				qmc_write32(chan->s_param + QMC_SPE_ZDSTATE,
 					    chan->mode == QMC_TRANSPARENT ?
 						chan->qmc->data->zdstate_transp :
@@ -1810,6 +1816,7 @@ static const struct qmc_data qmc_data_cpm1 = {
 	.zistate = 0x00000100,
 	.zdstate_hdlc = 0x00000080,
 	.zdstate_transp = 0x18000080,
+	.rpack = 0x00000000,
 };
 
 static const struct of_device_id qmc_id_table[] = {
-- 
2.45.0

