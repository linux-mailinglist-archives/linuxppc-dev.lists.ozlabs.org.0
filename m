Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5930793F81B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:33:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=oBQJem4o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXgpB280Sz3cYb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:33:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=oBQJem4o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgX972Bcz3cbg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:21:29 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id E13D7240006;
	Mon, 29 Jul 2024 14:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722262887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=usDe5saxjtuJSjAyDJrinAqDsazax42/56S/Us4E84U=;
	b=oBQJem4oR/YEugzkh8A/1zsWi6kLEdAfBmpi+W07UIBZg09wnteviVZQSQGfAHBVH5ur4X
	E9VX7AVVtgv1jLu29qTw3t3I2cZK65CvKmxMoYXms3a0HwZrXojwNK+XYxqECodvhK1SEI
	Faf43B/q74NxERmyykn57TXFKA++ZRV616bn3x8xOrnymfWp1K48BTIrZpUyvS2FkLpuvL
	MUIVQACDXqT/inIx76s6qeDhsEC79xkKbHgTLvt4QDkU6q9Fx6IoWVyF058jEEsGjTrOSV
	54taMjmlvjh/aEAMxfuxbY1qaYKqipcGCBIPExJeB44M4k1q6dVyChtuB8cq1A==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 17/36] soc: fsl: cpm1: qmc: Rename QMC_TSA_MASK
Date: Mon, 29 Jul 2024 16:20:46 +0200
Message-ID: <20240729142107.104574-18-herve.codina@bootlin.com>
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

QMC_TSA_MASK is a bitfield. The value defined is a specific value of
this bitfield and correspond to the use of 8bit resolution for the
routing entry.

Be accurate and rename the defined constant to reflect this point.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 916395745850..721e0770510c 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -77,7 +77,7 @@
 /* TSA entry (16bit entry in TSATRX and TSATTX) */
 #define QMC_TSA_VALID		(1 << 15)
 #define QMC_TSA_WRAP		(1 << 14)
-#define QMC_TSA_MASK		(0x303F)
+#define QMC_TSA_MASK_8BIT	(0x303F)
 #define QMC_TSA_CHANNEL(x)	((x) << 6)
 
 /* Tx buffer descriptor base address (16 bits, offset from MCBASE) */
@@ -641,7 +641,7 @@ static int qmc_chan_setup_tsa_64rxtx(struct qmc_chan *chan, const struct tsa_ser
 		return -EINVAL;
 	}
 
-	val = QMC_TSA_VALID | QMC_TSA_MASK | QMC_TSA_CHANNEL(chan->id);
+	val = QMC_TSA_VALID | QMC_TSA_MASK_8BIT | QMC_TSA_CHANNEL(chan->id);
 
 	/* Check entries based on Rx stuff*/
 	for (i = 0; i < info->nb_rx_ts; i++) {
@@ -677,7 +677,7 @@ static int qmc_chan_setup_tsa_32rx(struct qmc_chan *chan, const struct tsa_seria
 
 	/* Use a Rx 32 entries table */
 
-	val = QMC_TSA_VALID | QMC_TSA_MASK | QMC_TSA_CHANNEL(chan->id);
+	val = QMC_TSA_VALID | QMC_TSA_MASK_8BIT | QMC_TSA_CHANNEL(chan->id);
 
 	/* Check entries based on Rx stuff */
 	for (i = 0; i < info->nb_rx_ts; i++) {
@@ -713,7 +713,7 @@ static int qmc_chan_setup_tsa_32tx(struct qmc_chan *chan, const struct tsa_seria
 
 	/* Use a Tx 32 entries table */
 
-	val = QMC_TSA_VALID | QMC_TSA_MASK | QMC_TSA_CHANNEL(chan->id);
+	val = QMC_TSA_VALID | QMC_TSA_MASK_8BIT | QMC_TSA_CHANNEL(chan->id);
 
 	/* Check entries based on Tx stuff */
 	for (i = 0; i < info->nb_tx_ts; i++) {
-- 
2.45.0

