Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CDA94B733
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 09:12:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=YIyD+2Xy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfdXQ2tl7z3dSd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:12:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=YIyD+2Xy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.198; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfdWj6Sl7z3d8M
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 17:11:43 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 0057EC000C;
	Thu,  8 Aug 2024 07:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723101101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FedGXBbxZS85QIbKrUIqDEcBbjDFn92tK2MtTO/ElYU=;
	b=YIyD+2Xy+fDnZkHlX93E7CsEPEw+MB9zrg4gL4VhwDukhyUr9STvaatDp7737M/AAn2OgW
	0oNgsZ0mDsRGa8lnmbydvTFD0GJ8snXbabyBgXMy1Q7YKDe5gLeoRJDXM0ivbscbp5O01+
	8S1kLvaU3CEJIKsUhELQBgvsJi5hl3keUEpQ4WMXTNctFmUpse5YZVtCX1FxcTpnj9sUq0
	XJ7VUMxlXDPcAybDmS77e55itJM5sVZ0WU1XZH/TH1PMT+RXqoP87kUYSpJEB2W4WYWiI3
	b2sl6NZcnwnMHy3niCVJIM1gJ5A9+ctMsdwXcuGtcgUMi9ZpW/C1S169lz27ag==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 04/36] soc: fsl: cpm1: tsa: Use BIT(), GENMASK() and FIELD_PREP() macros
Date: Thu,  8 Aug 2024 09:10:57 +0200
Message-ID: <20240808071132.149251-5-herve.codina@bootlin.com>
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

checkpatch.pl signals the following improvement for tsa.c
  CHECK: Prefer using the BIT macro

Follow its suggestion and convert the code to BIT() and related macros.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/tsa.c | 127 +++++++++++++++++++++------------------
 1 file changed, 68 insertions(+), 59 deletions(-)

diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
index 53968ea84c88..dc4dda17dab8 100644
--- a/drivers/soc/fsl/qe/tsa.c
+++ b/drivers/soc/fsl/qe/tsa.c
@@ -9,6 +9,7 @@
 
 #include "tsa.h"
 #include <dt-bindings/soc/cpm1-fsl,tsa.h>
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -19,47 +20,52 @@
 
 
 /* TSA SI RAM routing tables entry */
-#define TSA_SIRAM_ENTRY_LAST		(1 << 16)
-#define TSA_SIRAM_ENTRY_BYTE		(1 << 17)
-#define TSA_SIRAM_ENTRY_CNT(x)		(((x) & 0x0f) << 18)
-#define TSA_SIRAM_ENTRY_CSEL_MASK	(0x7 << 22)
-#define TSA_SIRAM_ENTRY_CSEL_NU		(0x0 << 22)
-#define TSA_SIRAM_ENTRY_CSEL_SCC2	(0x2 << 22)
-#define TSA_SIRAM_ENTRY_CSEL_SCC3	(0x3 << 22)
-#define TSA_SIRAM_ENTRY_CSEL_SCC4	(0x4 << 22)
-#define TSA_SIRAM_ENTRY_CSEL_SMC1	(0x5 << 22)
-#define TSA_SIRAM_ENTRY_CSEL_SMC2	(0x6 << 22)
+#define TSA_SIRAM_ENTRY_LAST		BIT(16)
+#define TSA_SIRAM_ENTRY_BYTE		BIT(17)
+#define TSA_SIRAM_ENTRY_CNT_MASK	GENMASK(21, 18)
+#define TSA_SIRAM_ENTRY_CNT(x)		FIELD_PREP(TSA_SIRAM_ENTRY_CNT_MASK, x)
+#define TSA_SIRAM_ENTRY_CSEL_MASK	GENMASK(24, 22)
+#define TSA_SIRAM_ENTRY_CSEL_NU		FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x0)
+#define TSA_SIRAM_ENTRY_CSEL_SCC2	FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x2)
+#define TSA_SIRAM_ENTRY_CSEL_SCC3	FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x3)
+#define TSA_SIRAM_ENTRY_CSEL_SCC4	FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x4)
+#define TSA_SIRAM_ENTRY_CSEL_SMC1	FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x5)
+#define TSA_SIRAM_ENTRY_CSEL_SMC2	FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x6)
 
 /* SI mode register (32 bits) */
 #define TSA_SIMODE	0x00
-#define   TSA_SIMODE_SMC2			0x80000000
-#define   TSA_SIMODE_SMC1			0x00008000
-#define   TSA_SIMODE_TDMA(x)			((x) << 0)
-#define   TSA_SIMODE_TDMB(x)			((x) << 16)
-#define     TSA_SIMODE_TDM_MASK			0x0fff
-#define     TSA_SIMODE_TDM_SDM_MASK		0x0c00
-#define       TSA_SIMODE_TDM_SDM_NORM		0x0000
-#define       TSA_SIMODE_TDM_SDM_ECHO		0x0400
-#define       TSA_SIMODE_TDM_SDM_INTL_LOOP	0x0800
-#define       TSA_SIMODE_TDM_SDM_LOOP_CTRL	0x0c00
-#define     TSA_SIMODE_TDM_RFSD(x)		((x) << 8)
-#define     TSA_SIMODE_TDM_DSC			0x0080
-#define     TSA_SIMODE_TDM_CRT			0x0040
-#define     TSA_SIMODE_TDM_STZ			0x0020
-#define     TSA_SIMODE_TDM_CE			0x0010
-#define     TSA_SIMODE_TDM_FE			0x0008
-#define     TSA_SIMODE_TDM_GM			0x0004
-#define     TSA_SIMODE_TDM_TFSD(x)		((x) << 0)
+#define   TSA_SIMODE_SMC2			BIT(31)
+#define   TSA_SIMODE_SMC1			BIT(15)
+#define   TSA_SIMODE_TDMA_MASK			GENMASK(11, 0)
+#define   TSA_SIMODE_TDMA(x)			FIELD_PREP(TSA_SIMODE_TDMA_MASK, x)
+#define   TSA_SIMODE_TDMB_MASK			GENMASK(27, 16)
+#define   TSA_SIMODE_TDMB(x)			FIELD_PREP(TSA_SIMODE_TDMB_MASK, x)
+#define     TSA_SIMODE_TDM_MASK			GENMASK(11, 0)
+#define     TSA_SIMODE_TDM_SDM_MASK		GENMASK(11, 10)
+#define       TSA_SIMODE_TDM_SDM_NORM		FIELD_PREP_CONST(TSA_SIMODE_TDM_SDM_MASK, 0x0)
+#define       TSA_SIMODE_TDM_SDM_ECHO		FIELD_PREP_CONST(TSA_SIMODE_TDM_SDM_MASK, 0x1)
+#define       TSA_SIMODE_TDM_SDM_INTL_LOOP	FIELD_PREP_CONST(TSA_SIMODE_TDM_SDM_MASK, 0x2)
+#define       TSA_SIMODE_TDM_SDM_LOOP_CTRL	FIELD_PREP_CONST(TSA_SIMODE_TDM_SDM_MASK, 0x3)
+#define     TSA_SIMODE_TDM_RFSD_MASK		GENMASK(9, 8)
+#define     TSA_SIMODE_TDM_RFSD(x)		FIELD_PREP(TSA_SIMODE_TDM_RFSD_MASK, x)
+#define     TSA_SIMODE_TDM_DSC			BIT(7)
+#define     TSA_SIMODE_TDM_CRT			BIT(6)
+#define     TSA_SIMODE_TDM_STZ			BIT(5)
+#define     TSA_SIMODE_TDM_CE			BIT(4)
+#define     TSA_SIMODE_TDM_FE			BIT(3)
+#define     TSA_SIMODE_TDM_GM			BIT(2)
+#define     TSA_SIMODE_TDM_TFSD_MASK		GENMASK(1, 0)
+#define     TSA_SIMODE_TDM_TFSD(x)		FIELD_PREP(TSA_SIMODE_TDM_TFSD_MASK, x)
 
 /* SI global mode register (8 bits) */
 #define TSA_SIGMR	0x04
-#define TSA_SIGMR_ENB			(1<<3)
-#define TSA_SIGMR_ENA			(1<<2)
-#define TSA_SIGMR_RDM_MASK		0x03
-#define   TSA_SIGMR_RDM_STATIC_TDMA	0x00
-#define   TSA_SIGMR_RDM_DYN_TDMA	0x01
-#define   TSA_SIGMR_RDM_STATIC_TDMAB	0x02
-#define   TSA_SIGMR_RDM_DYN_TDMAB	0x03
+#define TSA_SIGMR_ENB			BIT(3)
+#define TSA_SIGMR_ENA			BIT(2)
+#define TSA_SIGMR_RDM_MASK		GENMASK(1, 0)
+#define   TSA_SIGMR_RDM_STATIC_TDMA	FIELD_PREP_CONST(TSA_SIGMR_RDM_MASK, 0x0)
+#define   TSA_SIGMR_RDM_DYN_TDMA	FIELD_PREP_CONST(TSA_SIGMR_RDM_MASK, 0x1)
+#define   TSA_SIGMR_RDM_STATIC_TDMAB	FIELD_PREP_CONST(TSA_SIGMR_RDM_MASK, 0x2)
+#define   TSA_SIGMR_RDM_DYN_TDMAB	FIELD_PREP_CONST(TSA_SIGMR_RDM_MASK, 0x3)
 
 /* SI status register (8 bits) */
 #define TSA_SISTR	0x06
@@ -69,30 +75,33 @@
 
 /* SI clock route register (32 bits) */
 #define TSA_SICR	0x0C
-#define   TSA_SICR_SCC2(x)		((x) << 8)
-#define   TSA_SICR_SCC3(x)		((x) << 16)
-#define   TSA_SICR_SCC4(x)		((x) << 24)
-#define     TSA_SICR_SCC_MASK		0x0ff
-#define     TSA_SICR_SCC_GRX		(1 << 7)
-#define     TSA_SICR_SCC_SCX_TSA	(1 << 6)
-#define     TSA_SICR_SCC_RXCS_MASK	(0x7 << 3)
-#define       TSA_SICR_SCC_RXCS_BRG1	(0x0 << 3)
-#define       TSA_SICR_SCC_RXCS_BRG2	(0x1 << 3)
-#define       TSA_SICR_SCC_RXCS_BRG3	(0x2 << 3)
-#define       TSA_SICR_SCC_RXCS_BRG4	(0x3 << 3)
-#define       TSA_SICR_SCC_RXCS_CLK15	(0x4 << 3)
-#define       TSA_SICR_SCC_RXCS_CLK26	(0x5 << 3)
-#define       TSA_SICR_SCC_RXCS_CLK37	(0x6 << 3)
-#define       TSA_SICR_SCC_RXCS_CLK48	(0x7 << 3)
-#define     TSA_SICR_SCC_TXCS_MASK	(0x7 << 0)
-#define       TSA_SICR_SCC_TXCS_BRG1	(0x0 << 0)
-#define       TSA_SICR_SCC_TXCS_BRG2	(0x1 << 0)
-#define       TSA_SICR_SCC_TXCS_BRG3	(0x2 << 0)
-#define       TSA_SICR_SCC_TXCS_BRG4	(0x3 << 0)
-#define       TSA_SICR_SCC_TXCS_CLK15	(0x4 << 0)
-#define       TSA_SICR_SCC_TXCS_CLK26	(0x5 << 0)
-#define       TSA_SICR_SCC_TXCS_CLK37	(0x6 << 0)
-#define       TSA_SICR_SCC_TXCS_CLK48	(0x7 << 0)
+#define   TSA_SICR_SCC2_MASK		GENMASK(15, 8)
+#define   TSA_SICR_SCC2(x)		FIELD_PREP(TSA_SICR_SCC2_MASK, x)
+#define   TSA_SICR_SCC3_MASK		GENMASK(23, 16)
+#define   TSA_SICR_SCC3(x)		FIELD_PREP(TSA_SICR_SCC3_MASK, x)
+#define   TSA_SICR_SCC4_MASK		GENMASK(31, 24)
+#define   TSA_SICR_SCC4(x)		FIELD_PREP(TSA_SICR_SCC4_MASK, x)
+#define     TSA_SICR_SCC_MASK		GENMASK(7, 0)
+#define     TSA_SICR_SCC_GRX		BIT(7)
+#define     TSA_SICR_SCC_SCX_TSA	BIT(6)
+#define     TSA_SICR_SCC_RXCS_MASK	GENMASK(5, 3)
+#define       TSA_SICR_SCC_RXCS_BRG1	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x0)
+#define       TSA_SICR_SCC_RXCS_BRG2	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x1)
+#define       TSA_SICR_SCC_RXCS_BRG3	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x2)
+#define       TSA_SICR_SCC_RXCS_BRG4	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x3)
+#define       TSA_SICR_SCC_RXCS_CLK15	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x4)
+#define       TSA_SICR_SCC_RXCS_CLK26	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x5)
+#define       TSA_SICR_SCC_RXCS_CLK37	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x6)
+#define       TSA_SICR_SCC_RXCS_CLK48	FIELD_PREP_CONST(TSA_SICR_SCC_RXCS_MASK, 0x7)
+#define     TSA_SICR_SCC_TXCS_MASK	GENMASK(2, 0)
+#define       TSA_SICR_SCC_TXCS_BRG1	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x0)
+#define       TSA_SICR_SCC_TXCS_BRG2	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x1)
+#define       TSA_SICR_SCC_TXCS_BRG3	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x2)
+#define       TSA_SICR_SCC_TXCS_BRG4	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x3)
+#define       TSA_SICR_SCC_TXCS_CLK15	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x4)
+#define       TSA_SICR_SCC_TXCS_CLK26	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x5)
+#define       TSA_SICR_SCC_TXCS_CLK37	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x6)
+#define       TSA_SICR_SCC_TXCS_CLK48	FIELD_PREP_CONST(TSA_SICR_SCC_TXCS_MASK, 0x7)
 
 /* Serial interface RAM pointer register (32 bits) */
 #define TSA_SIRP	0x10
-- 
2.45.0

