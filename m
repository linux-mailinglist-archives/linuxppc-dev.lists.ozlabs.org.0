Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6F793F890
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:47:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ZJuIa8IW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXh5d5zgbz3cXy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:47:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ZJuIa8IW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgXY6vjjz3ck2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:21:49 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id A5F55240010;
	Mon, 29 Jul 2024 14:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722262900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qhTeQjFFrgyyEBB/vjj0ndtfSFCTyBhsv6uo4yMAh0Y=;
	b=ZJuIa8IW/5+M3mke0kg9pwVVj6JiqzmT9NNuTFQ80j7DMfLUptCzMP5fjAiVDv3+kaJLw0
	eVQfGOJWrItQzKTrTGL+yVuVcsUnwW5tlUsOWSTvrx8+p7V3pTyb+4tAAze1oYQLQ+8J6J
	SI8TKohpFOM86RbWodYCokPR0t6368G60Gmc9Ydhksq8SJ1teiTFkGJ6sa/+sT7QekJuhB
	0inS0iDxE96z2onnGqY5UEf4ylh+uGj0Syz8hS3GZEx6ZV7YUgfmmh1pXJ/xsWQOFAc+FG
	4aiR+Xx/x9HgDAKRuM9GDQ/Q62JDhUHB+zQlII2oM0K7tWvedPykUkPCIvupWA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 35/36] soc: fsl: cpm1: qmc: Handle QUICC Engine (QE) soft-qmc firmware
Date: Mon, 29 Jul 2024 16:21:04 +0200
Message-ID: <20240729142107.104574-36-herve.codina@bootlin.com>
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

The QUICC Engine (QE) QMC can use a firmware to have the QMC working in
'soft-qmc' mode.

Handle this optional 'soft-qmc' firmware.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 67 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index b3a9534441ee..3dffebb48b0d 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -10,6 +10,7 @@
 #include <soc/fsl/qe/qmc.h>
 #include <linux/bitfield.h>
 #include <linux/dma-mapping.h>
+#include <linux/firmware.h>
 #include <linux/hdlc.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -1649,6 +1650,66 @@ static irqreturn_t qmc_irq_handler(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
+static int qmc_qe_soft_qmc_init(struct qmc *qmc, struct device_node *np)
+{
+	struct qe_firmware_info *qe_fw_info;
+	const struct qe_firmware *qe_fw;
+	const struct firmware *fw;
+	const char *filename;
+	int ret;
+
+	ret = of_property_read_string(np, "fsl,soft-qmc", &filename);
+	switch (ret) {
+	case 0:
+		break;
+	case -EINVAL:
+		/* fsl,soft-qmc property not set -> Simply do nothing */
+		return 0;
+	default:
+		dev_err(qmc->dev, "%pOF: failed to read fsl,soft-qmc\n",
+			np);
+		return ret;
+	}
+
+	qe_fw_info = qe_get_firmware_info();
+	if (qe_fw_info) {
+		if (!strstr(qe_fw_info->id, "Soft-QMC")) {
+			dev_err(qmc->dev, "Another Firmware is already loaded\n");
+			return -EALREADY;
+		}
+		dev_info(qmc->dev, "Firmware already loaded\n");
+		return 0;
+	}
+
+	dev_info(qmc->dev, "Using firmware %s\n", filename);
+
+	ret = request_firmware(&fw, filename, qmc->dev);
+	if (ret) {
+		dev_err(qmc->dev, "Failed to request firmware %s\n", filename);
+		return ret;
+	}
+
+	qe_fw = (const struct qe_firmware *)fw->data;
+
+	if (fw->size < sizeof(qe_fw->header) ||
+	    be32_to_cpu(qe_fw->header.length) != fw->size) {
+		dev_err(qmc->dev, "Invalid firmware %s\n", filename);
+		ret = -EINVAL;
+		goto end;
+	}
+
+	ret = qe_upload_firmware(qe_fw);
+	if (ret) {
+		dev_err(qmc->dev, "Failed to load firmware %s\n", filename);
+		goto end;
+	}
+
+	ret = 0;
+end:
+	release_firmware(fw);
+	return ret;
+}
+
 static int qmc_cpm1_init_resources(struct qmc *qmc, struct platform_device *pdev)
 {
 	struct resource *res;
@@ -1855,6 +1916,12 @@ static int qmc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (qmc_is_qe(qmc)) {
+		ret = qmc_qe_soft_qmc_init(qmc, np);
+		if (ret)
+			return ret;
+	}
+
 	/* Parse channels informationss */
 	ret = qmc_of_parse_chans(qmc, np);
 	if (ret)
-- 
2.45.0

