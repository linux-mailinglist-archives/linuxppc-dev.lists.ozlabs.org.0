Return-Path: <linuxppc-dev+bounces-8459-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BF7AB0CFD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 10:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zv24k220hz2xH9;
	Fri,  9 May 2025 18:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746778838;
	cv=none; b=iPbb1nX9vbR18F8OjEBUIl7lUV9ai2Rfkyx+Id8dfVdmS5Z5433oMQReNYwuh0ZeeEetzAJMaAW2Sbhkp7ft5TlEXvkN3BNQwtYIKyAd1tT5L3d3kCSEYWbLI/fjZhrUoyYkFtTy1jpC7CMuLrJpIwWG1GCOe8XE/GUhBvEofYEMdtXq9Qg6wO9K6kXp2pbbIJ3k+xjqmuzB93LkyaZroan4Emtg7Rhe8wDaEqj63sxV4qurQE/yCAotWnhqL5/hNkvajdQkXx3PcYdL/5wrTZ84MnM5/kkreWTCVOgE5DQM0xpCZ93ehrjya2fbiFTRA0jj8AxT9NOz7lYdT09cbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746778838; c=relaxed/relaxed;
	bh=ika5hIu7vcmCMkLJzSdUGhi/HBkB2UL7WSbLSFZaMhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WkNtHnx5Kjth5d9i0s72Bxiuh4MzIIfpG4OhpE+fRafxJxgjkSuWuLDy03Cp//XI8a12Cl1CBVep0Q2EToQX8CBeM1A6hl7+gDa8DnPKD0CA2ZNMaV2SLpJb5jnCulEo52fpaAAr5WFWeDu9NgHfHrwocLFylEoW+Y0Yr6cGO+4NSmYhF8C7G4+eR/6qydnqc9suquMF8AzRyR+mvgMJwtCp/ld5GrlKTxDCrxBgm1z3WBDP3xtBNzdfWAKeN2h4FUg/3eACxaef2rBTTAWK3qxOzTiMsC8QZxtbFLzDO9hYrk6rJg5+Hcqc8eRvPieQhzHr5W9LYrDvjWKi/gnWFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zv24j2yQrz2xCC
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 18:20:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Zv1N573r2z9sSD;
	Fri,  9 May 2025 09:48:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kcGGoeHh1ks9; Fri,  9 May 2025 09:48:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Zv1N56Mh3z9sN6;
	Fri,  9 May 2025 09:48:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D4AF88B778;
	Fri,  9 May 2025 09:48:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id fLUc-Bq1cvAL; Fri,  9 May 2025 09:48:53 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 34A968B768;
	Fri,  9 May 2025 09:48:53 +0200 (CEST)
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
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 1/2] soc: fsl: qmc: Only set completion interrupt when needed
Date: Fri,  9 May 2025 09:48:44 +0200
Message-ID: <19aa9d8a84c8475c62c42ac886dad0980428c6c0.1746776731.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746776925; l=2172; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=ig/ZbmdXAZ4t1bPHRxM84n5jpK07+Tvvsh4nuTJX8PI=; b=pnkZgcWnhBcWfbA5jK6s60oD/I9FJW2zzX1yTfF+itCYFpH0oEoeXcAdYf4ZGD3jD+0lWsk6+ LR7tb/W/pj6CoYWGqcEd5CqA6E3WkNiFBSQMszPeTC0SszuBsZQyCLy
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When no post-completion processing is expected, don't waste time
handling useless interrupts.

Only set QMC_BD_[R/T]X_I and QMC_BD_[R/T]X_UB when a completion
function is passed in.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 36c0ccc06151..0a704fd0b1a0 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -474,7 +474,9 @@ int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 	xfer_desc->context = context;
 
 	/* Activate the descriptor */
-	ctrl |= (QMC_BD_TX_R | QMC_BD_TX_UB);
+	ctrl |= QMC_BD_TX_R;
+	if (complete)
+		ctrl |= QMC_BD_TX_I | QMC_BD_TX_UB;
 	wmb(); /* Be sure to flush the descriptor before control update */
 	qmc_write16(&bd->cbd_sc, ctrl);
 
@@ -586,7 +588,9 @@ int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 		  QMC_BD_RX_AB | QMC_BD_RX_CR);
 
 	/* Activate the descriptor */
-	ctrl |= (QMC_BD_RX_E | QMC_BD_RX_UB);
+	ctrl |= QMC_BD_RX_E;
+	if (complete)
+		ctrl |= QMC_BD_RX_I | QMC_BD_RX_UB;
 	wmb(); /* Be sure to flush data before descriptor activation */
 	qmc_write16(&bd->cbd_sc, ctrl);
 
@@ -1482,19 +1486,19 @@ static int qmc_setup_chan(struct qmc *qmc, struct qmc_chan *chan)
 
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
2.47.0


