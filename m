Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C9294B7B5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 09:22:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kOoz4VOr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfdlt2lDQz3dSv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:22:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kOoz4VOr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::226; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfdWq2mtRz3dV6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 17:11:51 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id E6863C0017;
	Thu,  8 Aug 2024 07:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723101108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dyUVFs5n9icwfFDf1qikeUi9uMwaDds5yIaZ8cg5fuI=;
	b=kOoz4VOr+fQPScZvExImHIkbNbbQp48YiwIY+ybND/w/ygFQd+P48w+KoUDUHZ2tNy+bYX
	C+v+oYEJAXxhoUw1+O5aRhC0/moDm/33O8s7B/CZVetduPEAAFIAv7PG6GFNEupeY90afk
	RpYu0mbvra2+1QHFUM2uiPyToLOSf25G7CfcdRCI5M5YBiIQ8pe7DyWmjFAeTwHdlTbDg5
	IfF27I5I4L9GdUpwLRyoO1PbOhfizLf1BELokUGwyAqfSQocXUyTHEOv3FegJrjer/ZF04
	q4OLsEEVKgRtzNzTKg7c/AaV200R7jABVVGaAu+v4nnDXf/HcRhQZQig6+JoAw==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 13/36] soc: fsl: cpm1: tsa: Introduce tsa_version
Date: Thu,  8 Aug 2024 09:11:06 +0200
Message-ID: <20240808071132.149251-14-herve.codina@bootlin.com>
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

Current code handles CPM1 version of TSA.

In order to prepare the support for the QUICC Engine (QE) version of
TSA, introduce tsa_version to identify versions. This will enable the
code to make the distinction between several TSA implementations.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/tsa.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
index 48a176cece86..297721a0d2b6 100644
--- a/drivers/soc/fsl/qe/tsa.c
+++ b/drivers/soc/fsl/qe/tsa.c
@@ -114,12 +114,17 @@ struct tsa_tdm {
 #define TSA_TDMA	0
 #define TSA_TDMB	1
 
+enum tsa_version {
+	TSA_CPM1 = 1, /* Avoid 0 value */
+};
+
 struct tsa {
 	struct device *dev;
 	void __iomem *si_regs;
 	void __iomem *si_ram;
 	resource_size_t si_ram_sz;
 	spinlock_t	lock; /* Lock for read/modify/write sequence */
+	enum tsa_version version;
 	int tdms; /* TSA_TDMx ORed */
 	struct tsa_tdm tdm[2]; /* TDMa and TDMb */
 	struct tsa_serial {
@@ -685,6 +690,15 @@ static int tsa_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	tsa->dev = &pdev->dev;
+	tsa->version = (enum tsa_version)(uintptr_t)of_device_get_match_data(&pdev->dev);
+	switch (tsa->version) {
+	case TSA_CPM1:
+		dev_info(tsa->dev, "CPM1 version\n");
+		break;
+	default:
+		dev_err(tsa->dev, "Unknown version (%d)\n", tsa->version);
+		return -EINVAL;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(tsa->serials); i++)
 		tsa->serials[i].id = i;
@@ -746,7 +760,7 @@ static void tsa_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tsa_id_table[] = {
-	{ .compatible = "fsl,cpm1-tsa" },
+	{ .compatible = "fsl,cpm1-tsa", .data = (void *)TSA_CPM1 },
 	{} /* sentinel */
 };
 MODULE_DEVICE_TABLE(of, tsa_id_table);
-- 
2.45.0

