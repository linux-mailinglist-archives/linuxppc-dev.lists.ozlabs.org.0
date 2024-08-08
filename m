Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDAD94B7CD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 09:25:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=AEQQ5Agk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfdq21DrHz3cLj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:25:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=AEQQ5Agk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.198; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfdWt1LPmz3dWW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 17:11:53 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 1A1B8C0009;
	Thu,  8 Aug 2024 07:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723101111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=usDe5saxjtuJSjAyDJrinAqDsazax42/56S/Us4E84U=;
	b=AEQQ5AgkXwm2omQ4xULWm/XIBU9nBxdluen/JMN0hBYOe64ckKXO3P9jwC6+yub4J4ijK8
	mqpLObsM9r+q7kDPUHi67+gSVElhmfx8nbA6F/S/jozIBgMvk+iWYXx2NSM9KQuIti3yyr
	LzcwHROd8TW1/IlmNU1Hy8+UNMH0CEmMeXoUKaV4zlqed0yE750mXL9T25i0Tetmcla/tu
	BSRb3ImCR7KdOjEi0VgCMdLEGdiHkoijsKACkFBxxfuOTnQwNj6YxZCXmsEEx4N14CchEh
	y/M+vv/yF9z896gH6I21Rs/eqLXRAaDTcZqUsR0MWqVV92/Bc1rsoUmyHZcciA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 17/36] soc: fsl: cpm1: qmc: Rename QMC_TSA_MASK
Date: Thu,  8 Aug 2024 09:11:10 +0200
Message-ID: <20240808071132.149251-18-herve.codina@bootlin.com>
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

