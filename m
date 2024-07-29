Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D33A93F7F7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:30:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=OYCGOrwL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXgkx712yz3cdM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:30:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=OYCGOrwL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgX769rqz3cYQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:21:27 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id F3C39240011;
	Mon, 29 Jul 2024 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722262882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XF7ZThYLSlIm1RWwY+vjDfKpa9VxBTeErEIk/Q4bWKk=;
	b=OYCGOrwLM2XfZ1Qgevu9CnKhI3Sujmyzxe0WiowErWqrsNx5k6EYFpS91HObS6XziTRQvw
	6tSIRLY0W5a6GIfyyZwupcZMeUVhBrnfTQnrLvVO/mtoQqOk2q7adnRM8oG5sU9W2zRJHa
	XupLWJdlkhkJupHuLg9Eohhpuf8Bcg1JW+C+ZpAKtiixp6YgE3qtkwaSG7SjjO2FxR5OaH
	AocN7KZJvfaQjh7HtLeOYOJ//ao2dx2rShwWjU41wsMpySLd8eeC+WA57V+igw5tppVx+c
	Hc0lFeni1agup8l88mtTdfEq9MlGJSAhVFW/t3H13mD8AqxUYYxGV1WxP4hFTQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 10/36] soc: fsl: cpm1: tsa: Make SIRAM entries specific to CPM1
Date: Mon, 29 Jul 2024 16:20:39 +0200
Message-ID: <20240729142107.104574-11-herve.codina@bootlin.com>
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

Current code handles the CPM1 version of TSA. Compared against QUICC
Engine (QE) version of TSA, CPM1 SIRAM entries are slightly different.

In order to prepare the support for the QE version, clearly identify
these entries and functions handling them as CPM1 compatible.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/tsa.c | 75 ++++++++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 29 deletions(-)

diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
index 3d0c31a62dbb..bf7354ebaca4 100644
--- a/drivers/soc/fsl/qe/tsa.c
+++ b/drivers/soc/fsl/qe/tsa.c
@@ -18,18 +18,18 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-/* TSA SI RAM routing tables entry */
-#define TSA_SIRAM_ENTRY_LAST		BIT(16)
-#define TSA_SIRAM_ENTRY_BYTE		BIT(17)
-#define TSA_SIRAM_ENTRY_CNT_MASK	GENMASK(21, 18)
-#define TSA_SIRAM_ENTRY_CNT(x)		FIELD_PREP(TSA_SIRAM_ENTRY_CNT_MASK, x)
-#define TSA_SIRAM_ENTRY_CSEL_MASK	GENMASK(24, 22)
-#define TSA_SIRAM_ENTRY_CSEL_NU		FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x0)
-#define TSA_SIRAM_ENTRY_CSEL_SCC2	FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x2)
-#define TSA_SIRAM_ENTRY_CSEL_SCC3	FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x3)
-#define TSA_SIRAM_ENTRY_CSEL_SCC4	FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x4)
-#define TSA_SIRAM_ENTRY_CSEL_SMC1	FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x5)
-#define TSA_SIRAM_ENTRY_CSEL_SMC2	FIELD_PREP_CONST(TSA_SIRAM_ENTRY_CSEL_MASK, 0x6)
+/* TSA SI RAM routing tables entry (CPM1) */
+#define TSA_CPM1_SIRAM_ENTRY_LAST	BIT(16)
+#define TSA_CPM1_SIRAM_ENTRY_BYTE	BIT(17)
+#define TSA_CPM1_SIRAM_ENTRY_CNT_MASK	GENMASK(21, 18)
+#define TSA_CPM1_SIRAM_ENTRY_CNT(x)	FIELD_PREP(TSA_CPM1_SIRAM_ENTRY_CNT_MASK, x)
+#define TSA_CPM1_SIRAM_ENTRY_CSEL_MASK	GENMASK(24, 22)
+#define TSA_CPM1_SIRAM_ENTRY_CSEL_NU	FIELD_PREP_CONST(TSA_CPM1_SIRAM_ENTRY_CSEL_MASK, 0x0)
+#define TSA_CPM1_SIRAM_ENTRY_CSEL_SCC2	FIELD_PREP_CONST(TSA_CPM1_SIRAM_ENTRY_CSEL_MASK, 0x2)
+#define TSA_CPM1_SIRAM_ENTRY_CSEL_SCC3	FIELD_PREP_CONST(TSA_CPM1_SIRAM_ENTRY_CSEL_MASK, 0x3)
+#define TSA_CPM1_SIRAM_ENTRY_CSEL_SCC4	FIELD_PREP_CONST(TSA_CPM1_SIRAM_ENTRY_CSEL_MASK, 0x4)
+#define TSA_CPM1_SIRAM_ENTRY_CSEL_SMC1	FIELD_PREP_CONST(TSA_CPM1_SIRAM_ENTRY_CSEL_MASK, 0x5)
+#define TSA_CPM1_SIRAM_ENTRY_CSEL_SMC2	FIELD_PREP_CONST(TSA_CPM1_SIRAM_ENTRY_CSEL_MASK, 0x6)
 
 /* SI mode register (32 bits) */
 #define TSA_SIMODE	0x00
@@ -228,8 +228,8 @@ int tsa_serial_get_info(struct tsa_serial *tsa_serial, struct tsa_serial_info *i
 }
 EXPORT_SYMBOL(tsa_serial_get_info);
 
-static void tsa_init_entries_area(struct tsa *tsa, struct tsa_entries_area *area,
-				  u32 tdms, u32 tdm_id, bool is_rx)
+static void tsa_cpm1_init_entries_area(struct tsa *tsa, struct tsa_entries_area *area,
+				       u32 tdms, u32 tdm_id, bool is_rx)
 {
 	resource_size_t quarter;
 	resource_size_t half;
@@ -280,7 +280,13 @@ static void tsa_init_entries_area(struct tsa *tsa, struct tsa_entries_area *area
 	}
 }
 
-static const char *tsa_serial_id2name(struct tsa *tsa, u32 serial_id)
+static void tsa_init_entries_area(struct tsa *tsa, struct tsa_entries_area *area,
+				  u32 tdms, u32 tdm_id, bool is_rx)
+{
+	tsa_cpm1_init_entries_area(tsa, area, tdms, tdm_id, is_rx);
+}
+
+static const char *tsa_cpm1_serial_id2name(struct tsa *tsa, u32 serial_id)
 {
 	switch (serial_id) {
 	case FSL_CPM_TSA_NU:	return "Not used";
@@ -295,22 +301,27 @@ static const char *tsa_serial_id2name(struct tsa *tsa, u32 serial_id)
 	return NULL;
 }
 
-static u32 tsa_serial_id2csel(struct tsa *tsa, u32 serial_id)
+static const char *tsa_serial_id2name(struct tsa *tsa, u32 serial_id)
+{
+	return tsa_cpm1_serial_id2name(tsa, serial_id);
+}
+
+static u32 tsa_cpm1_serial_id2csel(struct tsa *tsa, u32 serial_id)
 {
 	switch (serial_id) {
-	case FSL_CPM_TSA_SCC2:	return TSA_SIRAM_ENTRY_CSEL_SCC2;
-	case FSL_CPM_TSA_SCC3:	return TSA_SIRAM_ENTRY_CSEL_SCC3;
-	case FSL_CPM_TSA_SCC4:	return TSA_SIRAM_ENTRY_CSEL_SCC4;
-	case FSL_CPM_TSA_SMC1:	return TSA_SIRAM_ENTRY_CSEL_SMC1;
-	case FSL_CPM_TSA_SMC2:	return TSA_SIRAM_ENTRY_CSEL_SMC2;
+	case FSL_CPM_TSA_SCC2:	return TSA_CPM1_SIRAM_ENTRY_CSEL_SCC2;
+	case FSL_CPM_TSA_SCC3:	return TSA_CPM1_SIRAM_ENTRY_CSEL_SCC3;
+	case FSL_CPM_TSA_SCC4:	return TSA_CPM1_SIRAM_ENTRY_CSEL_SCC4;
+	case FSL_CPM_TSA_SMC1:	return TSA_CPM1_SIRAM_ENTRY_CSEL_SMC1;
+	case FSL_CPM_TSA_SMC2:	return TSA_CPM1_SIRAM_ENTRY_CSEL_SMC2;
 	default:
 		break;
 	}
-	return TSA_SIRAM_ENTRY_CSEL_NU;
+	return TSA_CPM1_SIRAM_ENTRY_CSEL_NU;
 }
 
-static int tsa_add_entry(struct tsa *tsa, struct tsa_entries_area *area,
-			 u32 count, u32 serial_id)
+static int tsa_cpm1_add_entry(struct tsa *tsa, struct tsa_entries_area *area,
+			      u32 count, u32 serial_id)
 {
 	void __iomem *addr;
 	u32 left;
@@ -328,21 +339,21 @@ static int tsa_add_entry(struct tsa *tsa, struct tsa_entries_area *area,
 
 	if (area->last_entry) {
 		/* Clear last flag */
-		tsa_clrbits32(area->last_entry, TSA_SIRAM_ENTRY_LAST);
+		tsa_clrbits32(area->last_entry, TSA_CPM1_SIRAM_ENTRY_LAST);
 	}
 
 	left = count;
 	while (left) {
-		val = TSA_SIRAM_ENTRY_BYTE | tsa_serial_id2csel(tsa, serial_id);
+		val = TSA_CPM1_SIRAM_ENTRY_BYTE | tsa_cpm1_serial_id2csel(tsa, serial_id);
 
 		if (left > 16) {
 			cnt = 16;
 		} else {
 			cnt = left;
-			val |= TSA_SIRAM_ENTRY_LAST;
+			val |= TSA_CPM1_SIRAM_ENTRY_LAST;
 			area->last_entry = addr;
 		}
-		val |= TSA_SIRAM_ENTRY_CNT(cnt - 1);
+		val |= TSA_CPM1_SIRAM_ENTRY_CNT(cnt - 1);
 
 		tsa_write32(addr, val);
 		addr += 4;
@@ -352,6 +363,12 @@ static int tsa_add_entry(struct tsa *tsa, struct tsa_entries_area *area,
 	return 0;
 }
 
+static int tsa_add_entry(struct tsa *tsa, struct tsa_entries_area *area,
+			 u32 count, u32 serial_id)
+{
+	return tsa_cpm1_add_entry(tsa, area, count, serial_id);
+}
+
 static int tsa_of_parse_tdm_route(struct tsa *tsa, struct device_node *tdm_np,
 				  u32 tdms, u32 tdm_id, bool is_rx)
 {
@@ -636,7 +653,7 @@ static void tsa_init_si_ram(struct tsa *tsa)
 
 	/* Fill all entries as the last one */
 	for (i = 0; i < tsa->si_ram_sz; i += 4)
-		tsa_write32(tsa->si_ram + i, TSA_SIRAM_ENTRY_LAST);
+		tsa_write32(tsa->si_ram + i, TSA_CPM1_SIRAM_ENTRY_LAST);
 }
 
 static int tsa_probe(struct platform_device *pdev)
-- 
2.45.0

