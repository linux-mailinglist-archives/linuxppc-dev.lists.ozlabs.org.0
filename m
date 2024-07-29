Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C9A93F7A0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:24:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=BBk2migj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXgb715LXz2y8Z
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:24:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=BBk2migj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgX40Q1qz2ypm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:21:23 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 9EAE4240006;
	Mon, 29 Jul 2024 14:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722262876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O1sNai9Jq2u7qPOllWQVrRFQ040G46WCUggP4JjIwzw=;
	b=BBk2migjJPNgARSb4Y4tPh2TLnxHPLRxm9BEPmeTLeG+L+T98j321Hj7cfqcUtA17n+fIX
	xCDNe2ZbNnPx9AhvjbRZsQk/RdLeHa6pwWkN/okkSNgIJLSSgxys53HStMEcs4QeGs4Bgr
	PzzazAB8ZFiu/5BI+Z1mLi1AmNTx9VOOQ24rKkjcjPJxTq1mdORW6oUkQGhKHgIHFDEIlf
	VbLCvPXcMXhwpskSFH5U27ENRUtWH9TmiQgFLn1UoZkTRI2yQdHFXjeISfvae36vFgYBaQ
	Qup5Y7RTNBy6lruh9qNhZ3D7pktlHNwNH5o6a6JwLi8ES6LhOfAfhP8IbRQmmw==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 01/36] soc: fsl: cpm1: qmc: Update TRNSYNC only in transparent mode
Date: Mon, 29 Jul 2024 16:20:30 +0200
Message-ID: <20240729142107.104574-2-herve.codina@bootlin.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The TRNSYNC feature is available (and enabled) only in transparent mode.

Since commit 7cc9bda9c163 ("soc: fsl: cpm1: qmc: Handle timeslot entries
at channel start() and stop()") TRNSYNC register is updated in
transparent and hdlc mode. In hdlc mode, the address of the TRNSYNC
register is used by the QMC for other internal purpose. Even if no weird
results were observed in hdlc mode, touching this register in this mode
is wrong.

Update TRNSYNC only in transparent mode.

Fixes: 7cc9bda9c163 ("soc: fsl: cpm1: qmc: Handle timeslot entries at channel start() and stop()")
Cc: stable@vger.kernel.org
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 76bb496305a0..bacabf731dcb 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -940,11 +940,13 @@ static int qmc_chan_start_rx(struct qmc_chan *chan)
 		goto end;
 	}
 
-	ret = qmc_setup_chan_trnsync(chan->qmc, chan);
-	if (ret) {
-		dev_err(chan->qmc->dev, "chan %u: setup TRNSYNC failed (%d)\n",
-			chan->id, ret);
-		goto end;
+	if (chan->mode == QMC_TRANSPARENT) {
+		ret = qmc_setup_chan_trnsync(chan->qmc, chan);
+		if (ret) {
+			dev_err(chan->qmc->dev, "chan %u: setup TRNSYNC failed (%d)\n",
+				chan->id, ret);
+			goto end;
+		}
 	}
 
 	/* Restart the receiver */
@@ -982,11 +984,13 @@ static int qmc_chan_start_tx(struct qmc_chan *chan)
 		goto end;
 	}
 
-	ret = qmc_setup_chan_trnsync(chan->qmc, chan);
-	if (ret) {
-		dev_err(chan->qmc->dev, "chan %u: setup TRNSYNC failed (%d)\n",
-			chan->id, ret);
-		goto end;
+	if (chan->mode == QMC_TRANSPARENT) {
+		ret = qmc_setup_chan_trnsync(chan->qmc, chan);
+		if (ret) {
+			dev_err(chan->qmc->dev, "chan %u: setup TRNSYNC failed (%d)\n",
+				chan->id, ret);
+			goto end;
+		}
 	}
 
 	/*
-- 
2.45.0

