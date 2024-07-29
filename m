Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D50293F860
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:40:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=hKlLMA4I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXgxb5XBMz3cds
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:40:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=hKlLMA4I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgXM36Lpz3cZm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:21:39 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 2D9C224000C;
	Mon, 29 Jul 2024 14:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722262896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bhHLsIpdGYfQTXJIMda4RgH3fpRoHJARlbP68m37GfE=;
	b=hKlLMA4IU2x2n4HBnN8iY1/eRzSEa9AHf091qccnEmtNIN3SS8Cy9pAUkPFlMnxxogYPJH
	KaEwDYnak3jkd4o7iDYstR9YRCS3Z4P4oH1r7MH+HwNRbwG151zDrYaYJsvI3DCEFd62jn
	qprtEcjYOP3Fob+Y9itQgMJpBWwaaXkkzzQ0a0s8xXjKvWxbxDIeimJEfgYNSOjQqZSu7h
	k1oYN0go0dSGnLEE46HSRIv47MTW75qkL1vU4eMhGPNZDgPrb24V3Z3dzIAZkheQOZnbvM
	HAwdvDtENW1Hh9PxdjVQfBqIQv/Q/hEczZsoE0Oy/SmLRDJ1XCVm4j75hQTDjA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 30/36] soc: fsl: cpm1: qmc: Rename SCC_GSMRL_MODE_QMC
Date: Mon, 29 Jul 2024 16:20:59 +0200
Message-ID: <20240729142107.104574-31-herve.codina@bootlin.com>
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

Current code handles CPM1 version of QMC. Even if GSMRL is specific to
the CPM1 version, the exact same purpose and format register (GUMRL) is
present in the QUICC Engine (QE) version of QMC. Compared to the QE
version, the values defined for the mode bitfield are different and the
0x0A value defined for the QMC mode is CPM1 specific.

In order to prepare the support for the QE version, rename this bitfield
value to clearly identify it as CPM1 specific.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 63af2608c3cd..062477b7426e 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -27,7 +27,7 @@
 #define SCC_GSMRL_ENR		BIT(5)
 #define SCC_GSMRL_ENT		BIT(4)
 #define SCC_GSMRL_MODE_MASK	GENMASK(3, 0)
-#define SCC_GSMRL_MODE_QMC	FIELD_PREP_CONST(SCC_GSMRL_MODE_MASK, 0x0A)
+#define SCC_CPM1_GSMRL_MODE_QMC	FIELD_PREP_CONST(SCC_GSMRL_MODE_MASK, 0x0A)
 
 /* SCC general mode register low (32 bits) */
 #define SCC_GSMRH	0x04
@@ -1642,7 +1642,7 @@ static int qmc_cpm1_init_scc(struct qmc *qmc)
 	qmc_write32(qmc->scc_regs + SCC_GSMRH, val);
 
 	/* enable QMC mode */
-	qmc_write32(qmc->scc_regs + SCC_GSMRL, SCC_GSMRL_MODE_QMC);
+	qmc_write32(qmc->scc_regs + SCC_GSMRL, SCC_CPM1_GSMRL_MODE_QMC);
 
 	/* Disable and clear interrupts */
 	qmc_write16(qmc->scc_regs + SCC_SCCM, 0x0000);
-- 
2.45.0

