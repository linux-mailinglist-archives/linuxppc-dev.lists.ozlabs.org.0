Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B22C594B73D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 09:13:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=gN0Uk/uq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfdY94Xdmz3dWS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:13:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=gN0Uk/uq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.198; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfdWk38KFz3dBt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 17:11:43 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 90A4EC0009;
	Thu,  8 Aug 2024 07:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723101099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O1sNai9Jq2u7qPOllWQVrRFQ040G46WCUggP4JjIwzw=;
	b=gN0Uk/uqPGnTJ6esXWrtABtNBxnV4yIYif8QxXp/26PxdMvJIF8+ln3j2iWbJExBMXWwdv
	EUqX566FoQ7JYaGSTsUc5q27vmLFMqURO6dDWKjtXv1zvTU+pib0UncbHMXpb/Wy9ypA2D
	f2Eifo/uWZpMOoPIv9BLZhmnE8WfYsMKDl9UbpP8kc4UEbNADAkqgJ2kUEEn0uesVDXuFt
	LJKyvkZBpBuhY06XT8xKLgiTkVM9M44jHsPecZRtP9bdUQfnfJ9REoo4PayPcbuuudW3z7
	tuW79gJL2vSc7kJx9JNDWKyupzpwyZdOTgjeSd+1BWH5NyfwmddTH1a2gOOMkA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 01/36] soc: fsl: cpm1: qmc: Update TRNSYNC only in transparent mode
Date: Thu,  8 Aug 2024 09:10:54 +0200
Message-ID: <20240808071132.149251-2-herve.codina@bootlin.com>
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

