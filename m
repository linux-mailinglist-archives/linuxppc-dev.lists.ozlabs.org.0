Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF0D93F87E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:44:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=bU3JUNgk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXh2P4XqVz3dHM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:44:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=bU3JUNgk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgXT5xk7z3cW3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:21:45 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 7689B24000E;
	Mon, 29 Jul 2024 14:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722262896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ns1shNAo8zEhYUmPszlirWDSVtM9okYPzpFYT+pVz24=;
	b=bU3JUNgkUqlPbva+MXU/zy03oMGduuv8HCfdDpHuhWLsxfmKt8R7+/fkPzomjdJR4ldOcA
	s9hMJyDCmz8Jgyu+MCCShzE+KGMdqhNu04MAvjUZfegG7KDoG5J2HtqpMeTT020fVODxSt
	3KVe6ASotboK2wxWrqcrAZubbvShOlcsLg5klpd6/Tl2u6dCumawkOI29E27/XGiGdcDHC
	Jz1ZmUb7K920ZdODD8EL2wCA14tCFdrrhPRwr6T5QIfqs5ZVi1nDD1ZEJljgWnnII+gblg
	TEk35pAl1Lz/LXF1OLmRdMRlJgHZrZpDUPAg9Z5iIBmCApvq0hEj0LXr1MYgzg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 29/36] soc: fsl: cpm1: qmc: Handle RPACK initialization
Date: Mon, 29 Jul 2024 16:20:58 +0200
Message-ID: <20240729142107.104574-30-herve.codina@bootlin.com>
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

