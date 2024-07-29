Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B77993F7D8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:28:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=jIbxCO4o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXghf0mwcz3cZ9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:28:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=jIbxCO4o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgX74qyDz3cY5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:21:27 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 09396240017;
	Mon, 29 Jul 2024 14:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722262884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lnsu/Wi7dGj1nJVAQ+x0DLiP3zgedc4tHolE2i3TsXs=;
	b=jIbxCO4oG7wm2lbIMUDqM4FGW33R5m+Wx+bt9eT4XSej5NCngci4tYAd1K1lbnlnMPOvoy
	NxEdfrKdNzlHlK8ZyGo2NdnyhzMggftF8RiQUjzIZtjswTtDansXOwhhvod562UT4hZHri
	E4T9A/octqZV7WkA85rSXEHnlnPDzCePegDF+Hfq6tfTwhDU0EyWbBL7VdYAMWORyhfznS
	lyW3MGNHAlP4+xGYlfHv6dPmlXG7tDl4Vf1PCaKSx+/BcH4Hz98y5jPs/q0Dgiy39TK3Du
	efUP8E/CfpJcxrGQITKMNwoml/sHhQutWrogYxHICyLAioxqBKT/NvifQJfXKQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 13/36] soc: fsl: cpm1: tsa: Introduce tsa_version
Date: Mon, 29 Jul 2024 16:20:42 +0200
Message-ID: <20240729142107.104574-14-herve.codina@bootlin.com>
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

Current code handles CPM1 version of TSA.

In order to prepare the support for the QUICC Engine (QE) version of
TSA, introduce tsa_version to identify versions. This will enable the
code to make the distinction between several TSA implementations.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/tsa.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
index 48a176cece86..3b7c9766e25c 100644
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
+	tsa->version = (enum tsa_version)of_device_get_match_data(&pdev->dev);
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

