Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B10E029D253
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 22:12:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM1Vs5hc8zDqhC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 08:12:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.66; helo=mail-oo1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com
 [209.85.161.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM0xq2x9gzDqVL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 07:47:27 +1100 (AEDT)
Received: by mail-oo1-f66.google.com with SMTP id n16so211171ooj.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 13:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jLtdQtf3WAcV9X++ahXRYw9T14oWIpf65Dsq+SFgKNI=;
 b=QAU4W9CO9yd/biWT2H6p4Q2FntOtxPykIUejwYfFlKmSYiyPM3UY9lIWhvSwJ0MAWb
 w/U71QHADqrN4suYBtOlBl1NLbiMjXpwRGwxfqehxxhJKg+OhOyVJC5H8GpJbQhEBpjv
 +guTXA3GkBe6/rayT40Y1BXDpgCXbHc8RMD1RMhwkqSJo1X/EicMBOLY6NHriEkm2oBF
 y5IkiUu4VY4WSL1lTzBknUtmJmd3fZkGfzkTKoqhDIODf0USn1/k6YvuIZoWRRO6y1MD
 UXRsqlXbaH88sxpJ7FDR+JkPAv6OcSoXv8TMEUMkO3WOrt+wD7GuxjUtPPOE19ewEzKh
 Sy3w==
X-Gm-Message-State: AOAM533/IuLIpGaVsNw8a2HOGaokHnlqkQM4oQiQhFq1ICD/D0HjeAB2
 60DplxFyLmWlV8F2/Jk/GQ==
X-Google-Smtp-Source: ABdhPJxnNRS14MFRfXMOMoJpknKY2nesKkmauQwraiawQ+52twXO9gG8BZtOR7eF2YbXdQeyu9DH4Q==
X-Received: by 2002:a4a:b28b:: with SMTP id k11mr649619ooo.54.1603918043023;
 Wed, 28 Oct 2020 13:47:23 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id t17sm116123oor.3.2020.10.28.13.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 13:47:22 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 13/13] PCI: dwc: Remove unnecessary wrappers around
 dw_pcie_host_init()
Date: Wed, 28 Oct 2020 15:46:46 -0500
Message-Id: <20201028204646.356535-14-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028204646.356535-1-robh@kernel.org>
References: <20201028204646.356535-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-pci@vger.kernel.org,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-samsung-soc@vger.kernel.org, Minghuan Lian <minghuan.Lian@nxp.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, Murali Karicheri <m-karicheri2@ti.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>,
 Roy Zang <roy.zang@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev@lists.ozlabs.org, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Many calls to dw_pcie_host_init() are in a wrapper function with
nothing else now. Let's remove the pointless extra layer.

Cc: Richard Zhu <hongxing.zhu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Murali Karicheri <m-karicheri2@ti.com>
Cc: Minghuan Lian <minghuan.Lian@nxp.com>
Cc: Mingkai Hu <mingkai.hu@nxp.com>
Cc: Roy Zang <roy.zang@nxp.com>
Cc: Yue Wang <yue.wang@Amlogic.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jonathan Chocron <jonnyc@amazon.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Xiaowei Song <songxiaowei@hisilicon.com>
Cc: Binghui Wang <wangbinghui@hisilicon.com>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@axis.com
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-imx6.c       | 26 ++-------------------
 drivers/pci/controller/dwc/pci-keystone.c   | 19 +--------------
 drivers/pci/controller/dwc/pci-layerscape.c | 26 ++-------------------
 drivers/pci/controller/dwc/pci-meson.c      | 22 ++---------------
 drivers/pci/controller/dwc/pcie-al.c        | 20 ++--------------
 drivers/pci/controller/dwc/pcie-artpec6.c   | 23 +++---------------
 drivers/pci/controller/dwc/pcie-kirin.c     | 11 ++-------
 drivers/pci/controller/dwc/pcie-uniphier.c  | 23 +++---------------
 8 files changed, 17 insertions(+), 153 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 4ba0b1195ecf..73e5cfc0725a 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -842,25 +842,6 @@ static const struct dw_pcie_host_ops imx6_pcie_host_ops = {
 	.host_init = imx6_pcie_host_init,
 };
 
-static int imx6_add_pcie_port(struct imx6_pcie *imx6_pcie,
-			      struct platform_device *pdev)
-{
-	struct dw_pcie *pci = imx6_pcie->pci;
-	struct pcie_port *pp = &pci->pp;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	pp->ops = &imx6_pcie_host_ops;
-
-	ret = dw_pcie_host_init(pp);
-	if (ret) {
-		dev_err(dev, "failed to initialize host\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.start_link = imx6_pcie_start_link,
 };
@@ -1004,6 +985,7 @@ static int imx6_pcie_probe(struct platform_device *pdev)
 
 	pci->dev = dev;
 	pci->ops = &dw_pcie_ops;
+	pci->pp.ops = &imx6_pcie_host_ops;
 
 	imx6_pcie->pci = pci;
 	imx6_pcie->drvdata = of_device_get_match_data(dev);
@@ -1153,11 +1135,7 @@ static int imx6_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = imx6_add_pcie_port(imx6_pcie, pdev);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return dw_pcie_host_init(&pci->pp);
 }
 
 static void imx6_pcie_shutdown(struct platform_device *pdev)
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 5a4bcc2b1ddb..719756160821 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -844,23 +844,6 @@ static irqreturn_t ks_pcie_err_irq_handler(int irq, void *priv)
 	return ks_pcie_handle_error_irq(ks_pcie);
 }
 
-static int __init ks_pcie_add_pcie_port(struct keystone_pcie *ks_pcie,
-					struct platform_device *pdev)
-{
-	struct dw_pcie *pci = ks_pcie->pci;
-	struct pcie_port *pp = &pci->pp;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	ret = dw_pcie_host_init(pp);
-	if (ret) {
-		dev_err(dev, "failed to initialize host\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static void ks_pcie_am654_write_dbi2(struct dw_pcie *pci, void __iomem *base,
 				     u32 reg, size_t size, u32 val)
 {
@@ -1255,7 +1238,7 @@ static int __init ks_pcie_probe(struct platform_device *pdev)
 		}
 
 		pci->pp.ops = host_ops;
-		ret = ks_pcie_add_pcie_port(ks_pcie, pdev);
+		ret = dw_pcie_host_init(&pci->pp);
 		if (ret < 0)
 			goto err_get_sync;
 		break;
diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 400ebbebd00f..44ad34cdc3bc 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -232,31 +232,12 @@ static const struct of_device_id ls_pcie_of_match[] = {
 	{ },
 };
 
-static int __init ls_add_pcie_port(struct ls_pcie *pcie)
-{
-	struct dw_pcie *pci = pcie->pci;
-	struct pcie_port *pp = &pci->pp;
-	struct device *dev = pci->dev;
-	int ret;
-
-	pp->ops = pcie->drvdata->ops;
-
-	ret = dw_pcie_host_init(pp);
-	if (ret) {
-		dev_err(dev, "failed to initialize host\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static int __init ls_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct dw_pcie *pci;
 	struct ls_pcie *pcie;
 	struct resource *dbi_base;
-	int ret;
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
 	if (!pcie)
@@ -270,6 +251,7 @@ static int __init ls_pcie_probe(struct platform_device *pdev)
 
 	pci->dev = dev;
 	pci->ops = pcie->drvdata->dw_pcie_ops;
+	pci->pp.ops = pcie->drvdata->ops;
 
 	pcie->pci = pci;
 
@@ -285,11 +267,7 @@ static int __init ls_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pcie);
 
-	ret = ls_add_pcie_port(pcie);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return dw_pcie_host_init(&pci->pp);
 }
 
 static struct platform_driver ls_pcie_driver = {
diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 04589f0decb2..686ded034f22 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -387,25 +387,6 @@ static const struct dw_pcie_host_ops meson_pcie_host_ops = {
 	.host_init = meson_pcie_host_init,
 };
 
-static int meson_add_pcie_port(struct meson_pcie *mp,
-			       struct platform_device *pdev)
-{
-	struct dw_pcie *pci = &mp->pci;
-	struct pcie_port *pp = &pci->pp;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	pp->ops = &meson_pcie_host_ops;
-
-	ret = dw_pcie_host_init(pp);
-	if (ret) {
-		dev_err(dev, "failed to initialize host\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = meson_pcie_link_up,
 	.start_link = meson_pcie_start_link,
@@ -425,6 +406,7 @@ static int meson_pcie_probe(struct platform_device *pdev)
 	pci = &mp->pci;
 	pci->dev = dev;
 	pci->ops = &dw_pcie_ops;
+	pci->pp.ops = &meson_pcie_host_ops;
 	pci->num_lanes = 1;
 
 	mp->phy = devm_phy_get(dev, "pcie");
@@ -471,7 +453,7 @@ static int meson_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mp);
 
-	ret = meson_add_pcie_port(mp, pdev);
+	ret = dw_pcie_host_init(&pci->pp);
 	if (ret < 0) {
 		dev_err(dev, "Add PCIe port failed, %d\n", ret);
 		goto err_phy;
diff --git a/drivers/pci/controller/dwc/pcie-al.c b/drivers/pci/controller/dwc/pcie-al.c
index d06866921187..7ac8a37d9ce0 100644
--- a/drivers/pci/controller/dwc/pcie-al.c
+++ b/drivers/pci/controller/dwc/pcie-al.c
@@ -322,23 +322,6 @@ static const struct dw_pcie_host_ops al_pcie_host_ops = {
 	.host_init = al_pcie_host_init,
 };
 
-static int al_add_pcie_port(struct pcie_port *pp,
-			    struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	pp->ops = &al_pcie_host_ops;
-
-	ret = dw_pcie_host_init(pp);
-	if (ret) {
-		dev_err(dev, "failed to initialize host\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static const struct dw_pcie_ops dw_pcie_ops = {
 };
 
@@ -360,6 +343,7 @@ static int al_pcie_probe(struct platform_device *pdev)
 
 	pci->dev = dev;
 	pci->ops = &dw_pcie_ops;
+	pci->pp.ops = &al_pcie_host_ops;
 
 	al_pcie->pci = pci;
 	al_pcie->dev = dev;
@@ -384,7 +368,7 @@ static int al_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, al_pcie);
 
-	return al_add_pcie_port(&pci->pp, pdev);
+	return dw_pcie_host_init(&pci->pp);
 }
 
 static const struct of_device_id al_pcie_of_match[] = {
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index fcba9915a606..597c282f586c 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -336,25 +336,6 @@ static const struct dw_pcie_host_ops artpec6_pcie_host_ops = {
 	.host_init = artpec6_pcie_host_init,
 };
 
-static int artpec6_add_pcie_port(struct artpec6_pcie *artpec6_pcie,
-				 struct platform_device *pdev)
-{
-	struct dw_pcie *pci = artpec6_pcie->pci;
-	struct pcie_port *pp = &pci->pp;
-	struct device *dev = pci->dev;
-	int ret;
-
-	pp->ops = &artpec6_pcie_host_ops;
-
-	ret = dw_pcie_host_init(pp);
-	if (ret) {
-		dev_err(dev, "failed to initialize host\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static void artpec6_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -445,7 +426,9 @@ static int artpec6_pcie_probe(struct platform_device *pdev)
 		if (!IS_ENABLED(CONFIG_PCIE_ARTPEC6_HOST))
 			return -ENODEV;
 
-		ret = artpec6_add_pcie_port(artpec6_pcie, pdev);
+		pci->pp.ops = &artpec6_pcie_host_ops;
+
+		ret = dw_pcie_host_init(&pci->pp);
 		if (ret < 0)
 			return ret;
 		break;
diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
index ac4bbdaf5324..026fd1e42a55 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -419,14 +419,6 @@ static const struct dw_pcie_host_ops kirin_pcie_host_ops = {
 	.host_init = kirin_pcie_host_init,
 };
 
-static int kirin_add_pcie_port(struct dw_pcie *pci,
-			       struct platform_device *pdev)
-{
-	pci->pp.ops = &kirin_pcie_host_ops;
-
-	return dw_pcie_host_init(&pci->pp);
-}
-
 static int kirin_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -449,6 +441,7 @@ static int kirin_pcie_probe(struct platform_device *pdev)
 
 	pci->dev = dev;
 	pci->ops = &kirin_dw_pcie_ops;
+	pci->pp.ops = &kirin_pcie_host_ops;
 	kirin_pcie->pci = pci;
 
 	ret = kirin_pcie_get_clk(kirin_pcie, pdev);
@@ -474,7 +467,7 @@ static int kirin_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, kirin_pcie);
 
-	return kirin_add_pcie_port(pci, pdev);
+	return dw_pcie_host_init(&pci->pp);
 }
 
 static const struct of_device_id kirin_pcie_match[] = {
diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
index 2457e9dd098d..7e8bad326770 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -321,25 +321,6 @@ static const struct dw_pcie_host_ops uniphier_pcie_host_ops = {
 	.host_init = uniphier_pcie_host_init,
 };
 
-static int uniphier_add_pcie_port(struct uniphier_pcie_priv *priv,
-				  struct platform_device *pdev)
-{
-	struct dw_pcie *pci = &priv->pci;
-	struct pcie_port *pp = &pci->pp;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	pp->ops = &uniphier_pcie_host_ops;
-
-	ret = dw_pcie_host_init(pp);
-	if (ret) {
-		dev_err(dev, "Failed to initialize host (%d)\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
-
 static int uniphier_pcie_host_enable(struct uniphier_pcie_priv *priv)
 {
 	int ret;
@@ -415,7 +396,9 @@ static int uniphier_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return uniphier_add_pcie_port(priv, pdev);
+	priv->pci.pp.ops = &uniphier_pcie_host_ops;
+
+	return dw_pcie_host_init(&priv->pci.pp);
 }
 
 static const struct of_device_id uniphier_pcie_match[] = {
-- 
2.25.1

