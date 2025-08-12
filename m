Return-Path: <linuxppc-dev+bounces-10869-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD56B22A13
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 16:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1YZF6q0Dz2yMw;
	Wed, 13 Aug 2025 00:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755008437;
	cv=none; b=nyFRSj01COJPOUIBARYsDV6MRAJCZSHOCQUTZHAGWvoVmXkIRnvqdZCH3sSV/fj6BRKSqGbVpPyY/OYiaEvWIewCEGiz5UxvL8cE2zG3nOgaD3RN6DEYWJQdD9tUf64IBG/UQ9WS5eUIWvryDdb9s90ZN8NKr9xj0HpB9sOOpG5O5FecpYge3R5Qvp5QENWpLsUY/Y9aLLOA8eEbVIB+qmKM7mK9mGsHkSXJXAgcKdjMs54TQavreTJ+HqWgsrdM3Rfbz5qyZvnDvULUvRGoNCPvJlUw/13ZZ54FunEZNQNt3QHdLI7BudkVY49HORMIXOd+jna9Rm0iWkjzyi6I6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755008437; c=relaxed/relaxed;
	bh=ofsBEldww9kKGShjhxYh2YzTeLFqPmCs6uhKXnmiYVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sq3H381HzD1Q5+ioa2UoI7cGM91TTuKDqK4z2JyDWVkmXqpVAvYQd2wPRPK0lZVF2pePYB8EmIopfNldg5WmJ379aHK+WmEkkaugsZd2+jMmny+9v3BGS4h0EGNXISjNclMYgHI72TB8ZA59cvB2f5ziktK3olqQJkiCBrPnzHYLwP863QTeeYY5XIjRphxig91KV0f/vhYKGR8BdYZq5S6B+CorZd6Ay27mMKrSQucX/HRiW1gyQkLbeeMnDiCuJPEHuKuwNC+tkTCNjleXoPJ5hUeZlIsjReqdBgZY8IcrWdgRk3QPow6fEB0QapAPksaVer9Erabh61DycNHICw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1YZF0gnHz2xc8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 00:20:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c1SwZ1yR4z9sSL;
	Tue, 12 Aug 2025 12:51:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TZTC41d0Ji7b; Tue, 12 Aug 2025 12:51:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c1SwZ10sYz9sSK;
	Tue, 12 Aug 2025 12:51:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 090E48B764;
	Tue, 12 Aug 2025 12:51:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id oYqVmKfN6oVn; Tue, 12 Aug 2025 12:51:09 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C2A18B765;
	Tue, 12 Aug 2025 12:51:09 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 1/4] soc: fsl: qmc: Only set completion interrupt when needed
Date: Tue, 12 Aug 2025 12:50:55 +0200
Message-ID: <badb68a85910e5e6f1094ef3b01805209ac21854.1754993232.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1754993232.git.christophe.leroy@csgroup.eu>
References: <cover.1754993232.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754995860; l=3383; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=btE/H/h8In+zFZ3coyNkPGTFp2sXECgeWwsH+bApf+k=; b=zVwDmHckJ9mDmT1RDuIFBLmmtGpvCrpdaM679R61Csv/878/XJddDu6BCqmg5MWdRPutlVzV8 Tx9V7OFk3U+Cl67z/fTXBHb4yPB9HbRBYFB3c7X4RnCAC8pKGvZDWFv
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When no post-completion processing is expected, don't waste time
handling useless interrupts.

Only set QMC_BD_[R/T]X_I when a completion function is passed in,
and perform seamless completion on submit for interruptless buffers.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Keep the UB flag to mark not completed buffers and seamlessly flag them as completed during next submit.
---
 drivers/soc/fsl/qe/qmc.c | 44 ++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 36c0ccc06151f..8f76b9a5e385d 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -461,9 +461,16 @@ int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 
 	ctrl = qmc_read16(&bd->cbd_sc);
 	if (ctrl & (QMC_BD_TX_R | QMC_BD_TX_UB)) {
-		/* We are full ... */
-		ret = -EBUSY;
-		goto end;
+		if (!(ctrl & QMC_BD_TX_I) && bd == chan->txbd_done) {
+			if (ctrl & QMC_BD_TX_W)
+				chan->txbd_done = chan->txbds;
+			else
+				chan->txbd_done++;
+		} else {
+			/* We are full ... */
+			ret = -EBUSY;
+			goto end;
+		}
 	}
 
 	qmc_write16(&bd->cbd_datlen, length);
@@ -475,6 +482,10 @@ int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 
 	/* Activate the descriptor */
 	ctrl |= (QMC_BD_TX_R | QMC_BD_TX_UB);
+	if (complete)
+		ctrl |= QMC_BD_TX_I;
+	else
+		ctrl &= ~QMC_BD_TX_I;
 	wmb(); /* Be sure to flush the descriptor before control update */
 	qmc_write16(&bd->cbd_sc, ctrl);
 
@@ -569,9 +580,16 @@ int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 
 	ctrl = qmc_read16(&bd->cbd_sc);
 	if (ctrl & (QMC_BD_RX_E | QMC_BD_RX_UB)) {
-		/* We are full ... */
-		ret = -EBUSY;
-		goto end;
+		if (!(ctrl & QMC_BD_RX_I) && bd == chan->rxbd_done) {
+			if (ctrl & QMC_BD_RX_W)
+				chan->rxbd_done = chan->rxbds;
+			else
+				chan->rxbd_done++;
+		} else {
+			/* We are full ... */
+			ret = -EBUSY;
+			goto end;
+		}
 	}
 
 	qmc_write16(&bd->cbd_datlen, 0); /* data length is updated by the QMC */
@@ -587,6 +605,10 @@ int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 
 	/* Activate the descriptor */
 	ctrl |= (QMC_BD_RX_E | QMC_BD_RX_UB);
+	if (complete)
+		ctrl |= QMC_BD_RX_I;
+	else
+		ctrl &= ~QMC_BD_RX_I;
 	wmb(); /* Be sure to flush data before descriptor activation */
 	qmc_write16(&bd->cbd_sc, ctrl);
 
@@ -1482,19 +1504,19 @@ static int qmc_setup_chan(struct qmc *qmc, struct qmc_chan *chan)
 
 	/* Init Rx BDs and set Wrap bit on last descriptor */
 	BUILD_BUG_ON(QMC_NB_RXBDS == 0);
-	val = QMC_BD_RX_I;
 	for (i = 0; i < QMC_NB_RXBDS; i++) {
 		bd = chan->rxbds + i;
-		qmc_write16(&bd->cbd_sc, val);
+		qmc_write16(&bd->cbd_sc, 0);
 	}
 	bd = chan->rxbds + QMC_NB_RXBDS - 1;
-	qmc_write16(&bd->cbd_sc, val | QMC_BD_RX_W);
+	qmc_write16(&bd->cbd_sc, QMC_BD_RX_W);
 
 	/* Init Tx BDs and set Wrap bit on last descriptor */
 	BUILD_BUG_ON(QMC_NB_TXBDS == 0);
-	val = QMC_BD_TX_I;
 	if (chan->mode == QMC_HDLC)
-		val |= QMC_BD_TX_L | QMC_BD_TX_TC;
+		val = QMC_BD_TX_L | QMC_BD_TX_TC;
+	else
+		val = 0;
 	for (i = 0; i < QMC_NB_TXBDS; i++) {
 		bd = chan->txbds + i;
 		qmc_write16(&bd->cbd_sc, val);
-- 
2.49.0


