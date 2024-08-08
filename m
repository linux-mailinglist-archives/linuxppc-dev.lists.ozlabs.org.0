Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE31994B7AC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 09:21:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=nfQjrNes;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfdl04QsQz3dSG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:21:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=nfQjrNes;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::226; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfdWp3mJlz3dKV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 17:11:50 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 2A574C0019;
	Thu,  8 Aug 2024 07:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723101107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uvdVdoMDvhGGx9jdQpRy50lSt7vOk/dQvY6e1fABxmk=;
	b=nfQjrNesHdDa5sTAQTkLhGciJXnUi+I5xnVX/KVFm1PFsdRWF9kmGbDHX9VX56fbp5Lpix
	rlujP0/mL0ISQABC+FDevDnbBwZZYALkwN4k8shflIUlNyO/2ytuUKaHa15bPgBGuJHDIE
	Hha5D0kbglsGE87K+moiWukE5ANhz5kiSMjpQqyO+nsoHmQHvqRJ2hSaeH/PD1BibPAb8F
	1Mov4844acpdGCeYShegkaYFdyuWM6PEZGX2YmcohxIWLYIDYudg/0dyfQVMiALj/PtMqL
	NkyddDagwnfqxkl+uKFtPE6aRAInRCAE+usTa9ct4PohTAUzG/4rnA7+D5FT/Q==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 12/36] soc: fsl: cpm1: tsa: Isolate specific CPM1 part from tsa_serial_{dis}connect()
Date: Thu,  8 Aug 2024 09:11:05 +0200
Message-ID: <20240808071132.149251-13-herve.codina@bootlin.com>
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

Current code handles the CPM1 version of TSA. Connecting and
disconnecting the SCC to/from the TSA consists in handling SICR register
which is CPM1 specific. The connection and disconnection operation in
the QUICC Engine (QE) version are slightly different.

In order to prepare the support for the QE version, clearly identify
SICR register as specific to CPM1 and isolate its handling done in
connect and disconnect functions.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/tsa.c | 103 ++++++++++++++++-----------------------
 1 file changed, 43 insertions(+), 60 deletions(-)

diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
index 239b71187e07..48a176cece86 100644
--- a/drivers/soc/fsl/qe/tsa.c
+++ b/drivers/soc/fsl/qe/tsa.c
@@ -67,34 +67,34 @@
 #define   TSA_CPM1_SIGMR_RDM_DYN_TDMAB		FIELD_PREP_CONST(TSA_CPM1_SIGMR_RDM_MASK, 0x3)
 
 /* SI clock route register (32 bits) */
-#define TSA_SICR	0x0C
-#define   TSA_SICR_SCC2_MASK		GENMASK(15, 8)
-#define   TSA_SICR_SCC2(x)		FIELD_PREP(TSA_SICR_SCC2_MASK, x)
-#define   TSA_SICR_SCC3_MASK		GENMASK(23, 16)
-#define   TSA_SICR_SCC3(x)		FIELD_PREP(TSA_SICR_SCC3_MASK, x)
-#define   TSA_SICR_SCC4_MASK		GENMASK(31, 24)
-#define   TSA_SICR_SCC4(x)		FIELD_PREP(TSA_SICR_SCC4_MASK, x)
-#define     TSA_SICR_SCC_MASK		GENMASK(7, 0)
-#define     TSA_SICR_SCC_GRX		BIT(7)
-#define     TSA_SICR_SCC_SCX_TSA	BIT(6)
-#define     TSA_SICR_SCC_RXCS_MASK	GENMASK(5, 3)
-#define       TSA_SICR_SCC_RXCS_BRG1	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x0)
-#define       TSA_SICR_SCC_RXCS_BRG2	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x1)
-#define       TSA_SICR_SCC_RXCS_BRG3	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x2)
-#define       TSA_SICR_SCC_RXCS_BRG4	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x3)
-#define       TSA_SICR_SCC_RXCS_CLK15	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x4)
-#define       TSA_SICR_SCC_RXCS_CLK26	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x5)
-#define       TSA_SICR_SCC_RXCS_CLK37	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x6)
-#define       TSA_SICR_SCC_RXCS_CLK48	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x7)
-#define     TSA_SICR_SCC_TXCS_MASK	GENMASK(2, 0)
-#define       TSA_SICR_SCC_TXCS_BRG1	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x0)
-#define       TSA_SICR_SCC_TXCS_BRG2	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x1)
-#define       TSA_SICR_SCC_TXCS_BRG3	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x2)
-#define       TSA_SICR_SCC_TXCS_BRG4	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x3)
-#define       TSA_SICR_SCC_TXCS_CLK15	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x4)
-#define       TSA_SICR_SCC_TXCS_CLK26	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x5)
-#define       TSA_SICR_SCC_TXCS_CLK37	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x6)
-#define       TSA_SICR_SCC_TXCS_CLK48	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x7)
+#define TSA_CPM1_SICR	0x0C
+#define   TSA_CPM1_SICR_SCC2_MASK		GENMASK(15, 8)
+#define   TSA_CPM1_SICR_SCC2(x)			FIELD_PREP(TSA_CPM1_SICR_SCC2_MASK, x)
+#define   TSA_CPM1_SICR_SCC3_MASK		GENMASK(23, 16)
+#define   TSA_CPM1_SICR_SCC3(x)			FIELD_PREP(TSA_CPM1_SICR_SCC3_MASK, x)
+#define   TSA_CPM1_SICR_SCC4_MASK		GENMASK(31, 24)
+#define   TSA_CPM1_SICR_SCC4(x)			FIELD_PREP(TSA_CPM1_SICR_SCC4_MASK, x)
+#define     TSA_CPM1_SICR_SCC_MASK		GENMASK(7, 0)
+#define     TSA_CPM1_SICR_SCC_GRX		BIT(7)
+#define     TSA_CPM1_SICR_SCC_SCX_TSA		BIT(6)
+#define     TSA_CPM1_SICR_SCC_RXCS_MASK		GENMASK(5, 3)
+#define       TSA_CPM1_SICR_SCC_RXCS_BRG1	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_RXCS_MASK, 0x0)
+#define       TSA_CPM1_SICR_SCC_RXCS_BRG2	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_RXCS_MASK, 0x1)
+#define       TSA_CPM1_SICR_SCC_RXCS_BRG3	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_RXCS_MASK, 0x2)
+#define       TSA_CPM1_SICR_SCC_RXCS_BRG4	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_RXCS_MASK, 0x3)
+#define       TSA_CPM1_SICR_SCC_RXCS_CLK15	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_RXCS_MASK, 0x4)
+#define       TSA_CPM1_SICR_SCC_RXCS_CLK26	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_RXCS_MASK, 0x5)
+#define       TSA_CPM1_SICR_SCC_RXCS_CLK37	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_RXCS_MASK, 0x6)
+#define       TSA_CPM1_SICR_SCC_RXCS_CLK48	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_RXCS_MASK, 0x7)
+#define     TSA_CPM1_SICR_SCC_TXCS_MASK		GENMASK(2, 0)
+#define       TSA_CPM1_SICR_SCC_TXCS_BRG1	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_TXCS_MASK, 0x0)
+#define       TSA_CPM1_SICR_SCC_TXCS_BRG2	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_TXCS_MASK, 0x1)
+#define       TSA_CPM1_SICR_SCC_TXCS_BRG3	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_TXCS_MASK, 0x2)
+#define       TSA_CPM1_SICR_SCC_TXCS_BRG4	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_TXCS_MASK, 0x3)
+#define       TSA_CPM1_SICR_SCC_TXCS_CLK15	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_TXCS_MASK, 0x4)
+#define       TSA_CPM1_SICR_SCC_TXCS_CLK26	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_TXCS_MASK, 0x5)
+#define       TSA_CPM1_SICR_SCC_TXCS_CLK37	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_TXCS_MASK, 0x6)
+#define       TSA_CPM1_SICR_SCC_TXCS_CLK48	FIELD_PREP_CONST(TSA_CPM1_SICR_SCC_TXCS_MASK, 0x7)
 
 struct tsa_entries_area {
 	void __iomem *entries_start;
@@ -159,7 +159,7 @@ static inline void tsa_clrsetbits32(void __iomem *addr, u32 clr, u32 set)
 	tsa_write32(addr, (tsa_read32(addr) & ~clr) | set);
 }
 
-int tsa_serial_connect(struct tsa_serial *tsa_serial)
+static int tsa_cpm1_serial_connect(struct tsa_serial *tsa_serial, bool connect)
 {
 	struct tsa *tsa = tsa_serial_get_tsa(tsa_serial);
 	unsigned long flags;
@@ -168,16 +168,16 @@ int tsa_serial_connect(struct tsa_serial *tsa_serial)
 
 	switch (tsa_serial->id) {
 	case FSL_CPM_TSA_SCC2:
-		clear = TSA_SICR_SCC2(TSA_SICR_SCC_MASK);
-		set = TSA_SICR_SCC2(TSA_SICR_SCC_SCX_TSA);
+		clear = TSA_CPM1_SICR_SCC2(TSA_CPM1_SICR_SCC_MASK);
+		set = TSA_CPM1_SICR_SCC2(TSA_CPM1_SICR_SCC_SCX_TSA);
 		break;
 	case FSL_CPM_TSA_SCC3:
-		clear = TSA_SICR_SCC3(TSA_SICR_SCC_MASK);
-		set = TSA_SICR_SCC3(TSA_SICR_SCC_SCX_TSA);
+		clear = TSA_CPM1_SICR_SCC3(TSA_CPM1_SICR_SCC_MASK);
+		set = TSA_CPM1_SICR_SCC3(TSA_CPM1_SICR_SCC_SCX_TSA);
 		break;
 	case FSL_CPM_TSA_SCC4:
-		clear = TSA_SICR_SCC4(TSA_SICR_SCC_MASK);
-		set = TSA_SICR_SCC4(TSA_SICR_SCC_SCX_TSA);
+		clear = TSA_CPM1_SICR_SCC4(TSA_CPM1_SICR_SCC_MASK);
+		set = TSA_CPM1_SICR_SCC4(TSA_CPM1_SICR_SCC_SCX_TSA);
 		break;
 	default:
 		dev_err(tsa->dev, "Unsupported serial id %u\n", tsa_serial->id);
@@ -185,39 +185,22 @@ int tsa_serial_connect(struct tsa_serial *tsa_serial)
 	}
 
 	spin_lock_irqsave(&tsa->lock, flags);
-	tsa_clrsetbits32(tsa->si_regs + TSA_SICR, clear, set);
+	tsa_clrsetbits32(tsa->si_regs + TSA_CPM1_SICR, clear,
+			 connect ? set : 0);
 	spin_unlock_irqrestore(&tsa->lock, flags);
 
 	return 0;
 }
+
+int tsa_serial_connect(struct tsa_serial *tsa_serial)
+{
+	return tsa_cpm1_serial_connect(tsa_serial, true);
+}
 EXPORT_SYMBOL(tsa_serial_connect);
 
 int tsa_serial_disconnect(struct tsa_serial *tsa_serial)
 {
-	struct tsa *tsa = tsa_serial_get_tsa(tsa_serial);
-	unsigned long flags;
-	u32 clear;
-
-	switch (tsa_serial->id) {
-	case FSL_CPM_TSA_SCC2:
-		clear = TSA_SICR_SCC2(TSA_SICR_SCC_MASK);
-		break;
-	case FSL_CPM_TSA_SCC3:
-		clear = TSA_SICR_SCC3(TSA_SICR_SCC_MASK);
-		break;
-	case FSL_CPM_TSA_SCC4:
-		clear = TSA_SICR_SCC4(TSA_SICR_SCC_MASK);
-		break;
-	default:
-		dev_err(tsa->dev, "Unsupported serial id %u\n", tsa_serial->id);
-		return -EINVAL;
-	}
-
-	spin_lock_irqsave(&tsa->lock, flags);
-	tsa_clrsetbits32(tsa->si_regs + TSA_SICR, clear, 0);
-	spin_unlock_irqrestore(&tsa->lock, flags);
-
-	return 0;
+	return tsa_cpm1_serial_connect(tsa_serial, false);
 }
 EXPORT_SYMBOL(tsa_serial_disconnect);
 
-- 
2.45.0

