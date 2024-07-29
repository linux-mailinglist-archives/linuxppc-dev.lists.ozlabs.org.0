Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8954393F832
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:35:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Ou+Rt7bI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXgrp36nDz3ckP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:35:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Ou+Rt7bI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgXF0jHpz3cfx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:21:32 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id CD458240002;
	Mon, 29 Jul 2024 14:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722262890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hvpSGkwLO+E6MOzmOnoPAe/sppi5mCag/x8MKSW8BQ8=;
	b=Ou+Rt7bI8I3SxCvhwt/hrnWJHz5TAmU7OouVUtnRVrZzwmv/p2ueIDzrFiTzw3OXLnrUZq
	l0HClrTqVPbvkFOaRkFY1vv7l9udUXCCI/wscCeKjcrjTcY12mKF1nLjML76JY4/BZF5W9
	MEzP08FvDn8LFBaD9hxhd4v2NTE9zDvGYDXFv4bH6YaF8ylG3ZuZcaPobT8YyWi5L0dvgy
	6VjeZNaK18rYXZt2xOakpCZmz0TgU3S/upfld+xkJl3zD04CjNYnBW9jAS9gHQs3dMUFb7
	dNBGII68Jioi52KwGFb4M2ExAtfk2m9hP9BRdaf0j6trslB6lV/x7jLwaBdORw==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 21/36] soc: fsl: cpm1: qmc: Fix 'transmiter' typo
Date: Mon, 29 Jul 2024 16:20:50 +0200
Message-ID: <20240729142107.104574-22-herve.codina@bootlin.com>
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

checkpatch.pl raises the following issue
  CHECK: 'transmiter' may be misspelled - perhaps 'transmitter'?

Indeed, fix it.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 04466e735302..2d54d7400d2d 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -1715,7 +1715,7 @@ static int qmc_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_disable_intr;
 
-	/* Enable transmiter and receiver */
+	/* Enable transmitter and receiver */
 	qmc_setbits32(qmc->scc_regs + SCC_GSMRL, SCC_GSMRL_ENR | SCC_GSMRL_ENT);
 
 	platform_set_drvdata(pdev, qmc);
@@ -1742,7 +1742,7 @@ static void qmc_remove(struct platform_device *pdev)
 {
 	struct qmc *qmc = platform_get_drvdata(pdev);
 
-	/* Disable transmiter and receiver */
+	/* Disable transmitter and receiver */
 	qmc_setbits32(qmc->scc_regs + SCC_GSMRL, 0);
 
 	/* Disable interrupts */
-- 
2.45.0

