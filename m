Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C65B94B7D0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 09:25:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kltMQayP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfdqw3s9cz3dRf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:25:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kltMQayP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::226; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfdWv1tzcz3dSX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 17:11:54 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id D26EFC0003;
	Thu,  8 Aug 2024 07:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723101112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MHg3HP7c5auUlRoAbWHwCc/VjOiwCEiJpIw8nensMgk=;
	b=kltMQayPVSAq/gx4A60Nog+eoB7UgZP6QLBmIjpOEq7qpzRCgyHEBIuY/ZfioVkBcqd7OA
	euMTQzybpwPUCWnFUnILq1f2t3fF4OcaxsSBgel+krX+l+dncOv5NuWpyv+DIZhc3PRX3Z
	6Ji3Q/mlw87yh32USWlblup+juKwYpClmm9ohEogqDYr7ts0byB50ijNtyBw33WM7jRi93
	/VFeIPmk6lal1xpo56qa8Hrp82J0ya31W7iZksSp5cQsNYIawXl3xCXeYMyXAnm0CUQkwJ
	XeKyrQEypHb5H9HGc6chsUIeprirpSWn4FpAIex+y1iRse6sk5sEHc07+S9DMA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 18/36] soc: fsl: cpm1: qmc: Use BIT(), GENMASK() and FIELD_PREP() macros
Date: Thu,  8 Aug 2024 09:11:11 +0200
Message-ID: <20240808071132.149251-19-herve.codina@bootlin.com>
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

checkpatch.pl signals the following improvement for qmc.c
  CHECK: Prefer using the BIT macro

Follow its suggestion and convert the code to BIT() and related macros.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 132 +++++++++++++++++++++------------------
 1 file changed, 72 insertions(+), 60 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 721e0770510c..e2ac3e59bb79 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -8,6 +8,7 @@
  */
 
 #include <soc/fsl/qe/qmc.h>
+#include <linux/bitfield.h>
 #include <linux/dma-mapping.h>
 #include <linux/hdlc.h>
 #include <linux/interrupt.h>
@@ -23,23 +24,24 @@
 
 /* SCC general mode register high (32 bits) */
 #define SCC_GSMRL	0x00
-#define SCC_GSMRL_ENR		(1 << 5)
-#define SCC_GSMRL_ENT		(1 << 4)
-#define SCC_GSMRL_MODE_QMC	(0x0A << 0)
+#define SCC_GSMRL_ENR		BIT(5)
+#define SCC_GSMRL_ENT		BIT(4)
+#define SCC_GSMRL_MODE_MASK	GENMASK(3, 0)
+#define SCC_GSMRL_MODE_QMC	FIELD_PREP_CONST(SCC_GSMRL_MODE_MASK, 0x0A)
 
 /* SCC general mode register low (32 bits) */
 #define SCC_GSMRH	0x04
-#define   SCC_GSMRH_CTSS	(1 << 7)
-#define   SCC_GSMRH_CDS		(1 << 8)
-#define   SCC_GSMRH_CTSP	(1 << 9)
-#define   SCC_GSMRH_CDP		(1 << 10)
+#define   SCC_GSMRH_CTSS	BIT(7)
+#define   SCC_GSMRH_CDS		BIT(8)
+#define   SCC_GSMRH_CTSP	BIT(9)
+#define   SCC_GSMRH_CDP		BIT(10)
 
 /* SCC event register (16 bits) */
 #define SCC_SCCE	0x10
-#define   SCC_SCCE_IQOV		(1 << 3)
-#define   SCC_SCCE_GINT		(1 << 2)
-#define   SCC_SCCE_GUN		(1 << 1)
-#define   SCC_SCCE_GOV		(1 << 0)
+#define   SCC_SCCE_IQOV		BIT(3)
+#define   SCC_SCCE_GINT		BIT(2)
+#define   SCC_SCCE_GUN		BIT(1)
+#define   SCC_SCCE_GOV		BIT(0)
 
 /* SCC mask register (16 bits) */
 #define SCC_SCCM	0x14
@@ -75,25 +77,31 @@
 #define QMC_GBL_C_MASK16	0xA0
 
 /* TSA entry (16bit entry in TSATRX and TSATTX) */
-#define QMC_TSA_VALID		(1 << 15)
-#define QMC_TSA_WRAP		(1 << 14)
-#define QMC_TSA_MASK_8BIT	(0x303F)
-#define QMC_TSA_CHANNEL(x)	((x) << 6)
+#define QMC_TSA_VALID		BIT(15)
+#define QMC_TSA_WRAP		BIT(14)
+#define QMC_TSA_MASK_MASKH	GENMASK(13, 12)
+#define QMC_TSA_MASK_MASKL	GENMASK(5, 0)
+#define QMC_TSA_MASK_8BIT	(FIELD_PREP_CONST(QMC_TSA_MASK_MASKH, 0x3) | \
+				 FIELD_PREP_CONST(QMC_TSA_MASK_MASKL, 0x3F))
+#define QMC_TSA_CHANNEL_MASK	GENMASK(11, 6)
+#define QMC_TSA_CHANNEL(x)	FIELD_PREP(QMC_TSA_CHANNEL_MASK, x)
 
 /* Tx buffer descriptor base address (16 bits, offset from MCBASE) */
 #define QMC_SPE_TBASE	0x00
 
 /* Channel mode register (16 bits) */
 #define QMC_SPE_CHAMR	0x02
-#define   QMC_SPE_CHAMR_MODE_HDLC	(1 << 15)
-#define   QMC_SPE_CHAMR_MODE_TRANSP	((0 << 15) | (1 << 13))
-#define   QMC_SPE_CHAMR_ENT		(1 << 12)
-#define   QMC_SPE_CHAMR_POL		(1 << 8)
-#define   QMC_SPE_CHAMR_HDLC_IDLM	(1 << 13)
-#define   QMC_SPE_CHAMR_HDLC_CRC	(1 << 7)
-#define   QMC_SPE_CHAMR_HDLC_NOF	(0x0f << 0)
-#define   QMC_SPE_CHAMR_TRANSP_RD	(1 << 14)
-#define   QMC_SPE_CHAMR_TRANSP_SYNC	(1 << 10)
+#define   QMC_SPE_CHAMR_MODE_MASK	GENMASK(15, 15)
+#define   QMC_SPE_CHAMR_MODE_HDLC	FIELD_PREP_CONST(QMC_SPE_CHAMR_MODE_MASK, 1)
+#define   QMC_SPE_CHAMR_MODE_TRANSP	(FIELD_PREP_CONST(QMC_SPE_CHAMR_MODE_MASK, 0) | BIT(13))
+#define   QMC_SPE_CHAMR_ENT		BIT(12)
+#define   QMC_SPE_CHAMR_POL		BIT(8)
+#define   QMC_SPE_CHAMR_HDLC_IDLM	BIT(13)
+#define   QMC_SPE_CHAMR_HDLC_CRC	BIT(7)
+#define   QMC_SPE_CHAMR_HDLC_NOF_MASK	GENMASK(3, 0)
+#define   QMC_SPE_CHAMR_HDLC_NOF(x)	FIELD_PREP(QMC_SPE_CHAMR_HDLC_NOF_MASK, x)
+#define   QMC_SPE_CHAMR_TRANSP_RD	BIT(14)
+#define   QMC_SPE_CHAMR_TRANSP_SYNC	BIT(10)
 
 /* Tx internal state (32 bits) */
 #define QMC_SPE_TSTATE	0x04
@@ -120,43 +128,47 @@
 
 /* Transparent synchronization (16 bits) */
 #define QMC_SPE_TRNSYNC 0x3C
-#define   QMC_SPE_TRNSYNC_RX(x)	((x) << 8)
-#define   QMC_SPE_TRNSYNC_TX(x)	((x) << 0)
+#define   QMC_SPE_TRNSYNC_RX_MASK	GENMASK(15, 8)
+#define   QMC_SPE_TRNSYNC_RX(x)		FIELD_PREP(QMC_SPE_TRNSYNC_RX_MASK, x)
+#define   QMC_SPE_TRNSYNC_TX_MASK	GENMASK(7, 0)
+#define   QMC_SPE_TRNSYNC_TX(x)		FIELD_PREP(QMC_SPE_TRNSYNC_TX_MASK, x)
 
 /* Interrupt related registers bits */
-#define QMC_INT_V		(1 << 15)
-#define QMC_INT_W		(1 << 14)
-#define QMC_INT_NID		(1 << 13)
-#define QMC_INT_IDL		(1 << 12)
-#define QMC_INT_GET_CHANNEL(x)	(((x) & 0x0FC0) >> 6)
-#define QMC_INT_MRF		(1 << 5)
-#define QMC_INT_UN		(1 << 4)
-#define QMC_INT_RXF		(1 << 3)
-#define QMC_INT_BSY		(1 << 2)
-#define QMC_INT_TXB		(1 << 1)
-#define QMC_INT_RXB		(1 << 0)
+#define QMC_INT_V		BIT(15)
+#define QMC_INT_W		BIT(14)
+#define QMC_INT_NID		BIT(13)
+#define QMC_INT_IDL		BIT(12)
+#define QMC_INT_CHANNEL_MASK	GENMASK(11, 6)
+#define QMC_INT_GET_CHANNEL(x)	FIELD_GET(QMC_INT_CHANNEL_MASK, x)
+#define QMC_INT_MRF		BIT(5)
+#define QMC_INT_UN		BIT(4)
+#define QMC_INT_RXF		BIT(3)
+#define QMC_INT_BSY		BIT(2)
+#define QMC_INT_TXB		BIT(1)
+#define QMC_INT_RXB		BIT(0)
 
 /* BD related registers bits */
-#define QMC_BD_RX_E	(1 << 15)
-#define QMC_BD_RX_W	(1 << 13)
-#define QMC_BD_RX_I	(1 << 12)
-#define QMC_BD_RX_L	(1 << 11)
-#define QMC_BD_RX_F	(1 << 10)
-#define QMC_BD_RX_CM	(1 << 9)
-#define QMC_BD_RX_UB	(1 << 7)
-#define QMC_BD_RX_LG	(1 << 5)
-#define QMC_BD_RX_NO	(1 << 4)
-#define QMC_BD_RX_AB	(1 << 3)
-#define QMC_BD_RX_CR	(1 << 2)
-
-#define QMC_BD_TX_R	(1 << 15)
-#define QMC_BD_TX_W	(1 << 13)
-#define QMC_BD_TX_I	(1 << 12)
-#define QMC_BD_TX_L	(1 << 11)
-#define QMC_BD_TX_TC	(1 << 10)
-#define QMC_BD_TX_CM	(1 << 9)
-#define QMC_BD_TX_UB	(1 << 7)
-#define QMC_BD_TX_PAD	(0x0f << 0)
+#define QMC_BD_RX_E	BIT(15)
+#define QMC_BD_RX_W	BIT(13)
+#define QMC_BD_RX_I	BIT(12)
+#define QMC_BD_RX_L	BIT(11)
+#define QMC_BD_RX_F	BIT(10)
+#define QMC_BD_RX_CM	BIT(9)
+#define QMC_BD_RX_UB	BIT(7)
+#define QMC_BD_RX_LG	BIT(5)
+#define QMC_BD_RX_NO	BIT(4)
+#define QMC_BD_RX_AB	BIT(3)
+#define QMC_BD_RX_CR	BIT(2)
+
+#define QMC_BD_TX_R		BIT(15)
+#define QMC_BD_TX_W		BIT(13)
+#define QMC_BD_TX_I		BIT(12)
+#define QMC_BD_TX_L		BIT(11)
+#define QMC_BD_TX_TC		BIT(10)
+#define QMC_BD_TX_CM		BIT(9)
+#define QMC_BD_TX_UB		BIT(7)
+#define QMC_BD_TX_PAD_MASK	GENMASK(3, 0)
+#define QMC_BD_TX_PAD(x)	FIELD_PREP(QMC_BD_TX_PAD_MASK, x)
 
 /* Numbers of BDs and interrupt items */
 #define QMC_NB_TXBDS	8
@@ -662,7 +674,7 @@ static int qmc_chan_setup_tsa_64rxtx(struct qmc_chan *chan, const struct tsa_ser
 			continue;
 
 		qmc_clrsetbits16(chan->qmc->scc_pram + QMC_GBL_TSATRX + (i * 2),
-				 ~QMC_TSA_WRAP, enable ? val : 0x0000);
+				 (u16)~QMC_TSA_WRAP, enable ? val : 0x0000);
 	}
 
 	return 0;
@@ -698,7 +710,7 @@ static int qmc_chan_setup_tsa_32rx(struct qmc_chan *chan, const struct tsa_seria
 			continue;
 
 		qmc_clrsetbits16(chan->qmc->scc_pram + QMC_GBL_TSATRX + (i * 2),
-				 ~QMC_TSA_WRAP, enable ? val : 0x0000);
+				 (u16)~QMC_TSA_WRAP, enable ? val : 0x0000);
 	}
 
 	return 0;
@@ -734,7 +746,7 @@ static int qmc_chan_setup_tsa_32tx(struct qmc_chan *chan, const struct tsa_seria
 			continue;
 
 		qmc_clrsetbits16(chan->qmc->scc_pram + QMC_GBL_TSATTX + (i * 2),
-				 ~QMC_TSA_WRAP, enable ? val : 0x0000);
+				 (u16)~QMC_TSA_WRAP, enable ? val : 0x0000);
 	}
 
 	return 0;
-- 
2.45.0

