Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FD511F381
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 19:24:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZwtK1YSfzDr0w
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Dec 2019 05:24:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=tiny.windzz@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="g2VIPeNv"; 
 dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZwDX2WPqzDqxl
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Dec 2019 04:55:24 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id s35so1123788pjb.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 09:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0jvWF9XYSISO584h2vYKYUoEcRiyVQ8hH7Hs2IoWF50=;
 b=g2VIPeNv78fikjdmQp4F6HcLSJJlLRztzWIRg4z5MKw5ARx+QWeColI55a3kl7qx9i
 cAFoFIbdKa4WMEDblx60nLEzaAGgygsrCa1OzawGh83RhPR4M+Pgz4cTiUuwtJ3+zLTR
 rKSvgNvCdwzPqUvKrTPhWjfhJpfOInRRaTsdN4a2TkIHWk4Z3bZ0nLnwQonYk5wzWncg
 vwCJdky9D1Os9HirkeURSPIS0re0yh8o0nUnCCSeya6qhWZv+FZ4VkTqLzURQWZQmAtq
 IeuzYN5SfasSV/p6E2PnjMm3gp9rYSRVHGTAGwQgQAZsRDt5dp5Bj7folhkKi/e7xXRr
 jVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0jvWF9XYSISO584h2vYKYUoEcRiyVQ8hH7Hs2IoWF50=;
 b=pCVF67LyRc3k26HL3+S0GCVUkkbr52d0MEX1q+YC5NzR/u5pfQHJ8s7/8DJ4VUocyj
 z71W1OzZlSd30ISyR7+QY+l7uQTcpzYQQfixJ1jA4xhKWxbRC6pjT2U4wpgpStR1d3pi
 wb7OC0qBWbTCqbszhVZPnlTbaUQkDgIZC54ZIEB4RVbJRiIrWW+j8cjVJOW7PhOLwC8z
 o2wqcNocG2aQEShzfesDAgnGY2TvCrPrYNrdaAfJawEnuwByTR0pUdW1QW2awrH6e+Eh
 SJlZE7iICUGDoB9khZxQFPyo2GKoGNB6R8fVUExAvQLvRbjzyt4wbDjbCAZSLkGb+8SG
 hWAA==
X-Gm-Message-State: APjAAAX3WDwa/N4rGgaoVae7Ag3w17o/AzBHe7DefF6EYDUuCJN4qVB9
 y4b+0xmV8kXMoa0xzypOYM0=
X-Google-Smtp-Source: APXvYqyqtm2BCTkQ1WB9nU9hiA5GJsGTHwnwitKhC/pdbIodt1usGKIoQH8Uv4CdMMinxB6/xHe66A==
X-Received: by 2002:a17:90a:8685:: with SMTP id
 p5mr7039962pjn.92.1576346121104; 
 Sat, 14 Dec 2019 09:55:21 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id l22sm14347112pjc.0.2019.12.14.09.55.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Dec 2019 09:55:20 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
 john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
 mripard@kernel.org, wens@csie.org, ssantosh@kernel.org, jun.nie@linaro.org,
 shawnguo@kernel.org
Subject: [PATCH 10/10] soc: qcom: convert to devm_platform_ioremap_resource
Date: Sat, 14 Dec 2019 17:54:47 +0000
Message-Id: <20191214175447.25482-10-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191214175447.25482-1-tiny.windzz@gmail.com>
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/soc/qcom/llcc-qcom.c    | 7 +------
 drivers/soc/qcom/qcom-geni-se.c | 4 +---
 drivers/soc/qcom/qcom_aoss.c    | 4 +---
 drivers/soc/qcom/qcom_gsbi.c    | 5 +----
 drivers/soc/qcom/spm.c          | 4 +---
 5 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 429b5a60a1ba..99e19df76889 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -387,7 +387,6 @@ static int qcom_llcc_remove(struct platform_device *pdev)
 static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
 		const char *name)
 {
-	struct resource *res;
 	void __iomem *base;
 	struct regmap_config llcc_regmap_config = {
 		.reg_bits = 32,
@@ -396,11 +395,7 @@ static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
 		.fast_io = true,
 	};
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
-	if (!res)
-		return ERR_PTR(-ENODEV);
-
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return ERR_CAST(base);
 
diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 7d622ea1274e..9c2c429b4b3f 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -723,7 +723,6 @@ EXPORT_SYMBOL(geni_se_rx_dma_unprep);
 static int geni_se_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct geni_wrapper *wrapper;
 	int ret;
 
@@ -732,8 +731,7 @@ static int geni_se_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	wrapper->dev = dev;
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	wrapper->base = devm_ioremap_resource(dev, res);
+	wrapper->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(wrapper->base))
 		return PTR_ERR(wrapper->base);
 
diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 006ac40c526a..fcfba9f1aaa1 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -513,7 +513,6 @@ static void qmp_cooling_devices_remove(struct qmp *qmp)
 
 static int qmp_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct qmp *qmp;
 	int irq;
 	int ret;
@@ -526,8 +525,7 @@ static int qmp_probe(struct platform_device *pdev)
 	init_waitqueue_head(&qmp->event);
 	mutex_init(&qmp->tx_lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	qmp->msgram = devm_ioremap_resource(&pdev->dev, res);
+	qmp->msgram = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(qmp->msgram))
 		return PTR_ERR(qmp->msgram);
 
diff --git a/drivers/soc/qcom/qcom_gsbi.c b/drivers/soc/qcom/qcom_gsbi.c
index 304afc223a58..202ff31cf54f 100644
--- a/drivers/soc/qcom/qcom_gsbi.c
+++ b/drivers/soc/qcom/qcom_gsbi.c
@@ -127,7 +127,6 @@ static int gsbi_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 	struct device_node *tcsr_node;
 	const struct of_device_id *match;
-	struct resource *res;
 	void __iomem *base;
 	struct gsbi_info *gsbi;
 	int i, ret;
@@ -135,12 +134,10 @@ static int gsbi_probe(struct platform_device *pdev)
 	const struct crci_config *config = NULL;
 
 	gsbi = devm_kzalloc(&pdev->dev, sizeof(*gsbi), GFP_KERNEL);
-
 	if (!gsbi)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
index 8e10e02c6aa5..b6131ab07879 100644
--- a/drivers/soc/qcom/spm.c
+++ b/drivers/soc/qcom/spm.c
@@ -320,7 +320,6 @@ static const struct of_device_id spm_match_table[] = {
 static int spm_dev_probe(struct platform_device *pdev)
 {
 	struct spm_driver_data *drv;
-	struct resource *res;
 	const struct of_device_id *match_id;
 	void __iomem *addr;
 	int cpu;
@@ -329,8 +328,7 @@ static int spm_dev_probe(struct platform_device *pdev)
 	if (!drv)
 		return -EINVAL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	drv->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	drv->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(drv->reg_base))
 		return PTR_ERR(drv->reg_base);
 
-- 
2.17.1

