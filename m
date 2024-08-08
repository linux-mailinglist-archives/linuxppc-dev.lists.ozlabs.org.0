Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D48F94B7D4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 09:27:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=EIDeIhSI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfdtC0BmJz3dXQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:27:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=EIDeIhSI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.198; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfdWx1jlkz3dVZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 17:11:56 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 2281DC000D;
	Thu,  8 Aug 2024 07:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723101114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hvpSGkwLO+E6MOzmOnoPAe/sppi5mCag/x8MKSW8BQ8=;
	b=EIDeIhSINh2XqEI/SlxP2AcmXxXEW1kfknbLBOkOCZwd8ja8SCAZBNZkw8LIYb7A8R6yMS
	p4+uGEaX7BgX/IkEOIWmV/rETzXealaVE1PaGUw2uIeQv+j7oMTU5xHyBN/A5QJnsqroSE
	Xw5UbQ4KM1C7Z4y2aaXwYuFs8FlskZRm3g4xlxja6zQE7doDHuWrlkCRa3urimY0oQ1v3u
	GYZAMQjTZ8EATxFklm2zGDsSfiwaeVEPhrbh+eZo68Du9LwrBEAVH0oWARfI0r9lk1SrdK
	7nbYm6I9zT00BSo01NiliF7DsT/kVyWLcdYiIt+fzaGZ0udFgOQo5LimNVC7Dw==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 21/36] soc: fsl: cpm1: qmc: Fix 'transmiter' typo
Date: Thu,  8 Aug 2024 09:11:14 +0200
Message-ID: <20240808071132.149251-22-herve.codina@bootlin.com>
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

