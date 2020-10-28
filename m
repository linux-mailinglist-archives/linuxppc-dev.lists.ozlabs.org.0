Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA11129D231
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 22:03:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM1Jd6hHPzDqQ6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 08:03:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.193;
 helo=mail-oi1-f193.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM0xX3S8XzDqVH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 07:47:12 +1100 (AEDT)
Received: by mail-oi1-f193.google.com with SMTP id x1so926796oic.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 13:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ng/GAl5FdMyCfMLo4b2AYiSa5+E2Pt1yYN1bVlxDhEE=;
 b=oPAALws5WQz9mdyZoRBQFoQ6gSPIXOfAaNze5SB1q5G1WDZHjco3/blzffx3cgFNHE
 r4Dh57guUzMETxRNHzxIgl8dvgsuciyGC3qUtUR4+TVDlqU1ufl1c/Qoc6xupVled2xN
 LAUsu+GlDw7KXR6k68IDN5WvlALfleTnGSL48ybc3D3XsY6mo1TfWakL7oS6fQiaj4S6
 FI1ejgoxUhou4sJ+i97Z9cFuJiywkaO38BERlrjujDny2sQ2XuRk9AwpBihsLlMIwWnD
 fdkG51atG2/1TqdVsDMvz6M2VhzM45QJRCMZ/k1DK4w3/fWgL/e+OnFI0U70tfAS41zR
 wnPg==
X-Gm-Message-State: AOAM5332CADkkHdmydhWNvNQ9PD8Oip+HpEnwqkEU3vpSR2Kheo3oLGK
 BOeyRQbdppug8rYd/SWvGg==
X-Google-Smtp-Source: ABdhPJy6QkZYEmUelC0w45P+ePMwzFGxx/TsELwaH8o2JDUE/TKg1CzKG7CAK6txRNEF/Pw3727NpA==
X-Received: by 2002:aca:fcc5:: with SMTP id a188mr654973oii.76.1603918030170; 
 Wed, 28 Oct 2020 13:47:10 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id t17sm116123oor.3.2020.10.28.13.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 13:47:09 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 08/13] PCI: dwc: Move MSI interrupt setup into DWC common code
Date: Wed, 28 Oct 2020 15:46:41 -0500
Message-Id: <20201028204646.356535-9-robh@kernel.org>
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

Platforms using the built-in DWC MSI controller all have a dedicated
interrupt with "msi" name or at index 0, so let's move setting up the
interrupt to the common DWC code.

spear13xx and dra7xx are the 2 oddballs with muxed interrupts, so
we need to prevent configuring the MSI interrupt by setting msi_irq
to negative.

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Richard Zhu <hongxing.zhu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Yue Wang <yue.wang@Amlogic.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Xiaowei Song <songxiaowei@hisilicon.com>
Cc: Binghui Wang <wangbinghui@hisilicon.com>
Cc: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Pratyush Anand <pratyush.anand@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@axis.com
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-dra7xx.c       |  3 +++
 drivers/pci/controller/dwc/pci-exynos.c       |  6 -----
 drivers/pci/controller/dwc/pci-imx6.c         |  6 -----
 drivers/pci/controller/dwc/pci-meson.c        |  6 -----
 drivers/pci/controller/dwc/pcie-artpec6.c     |  6 -----
 .../pci/controller/dwc/pcie-designware-host.c | 11 +++++++++-
 .../pci/controller/dwc/pcie-designware-plat.c |  6 -----
 drivers/pci/controller/dwc/pcie-histb.c       |  6 -----
 drivers/pci/controller/dwc/pcie-kirin.c       | 22 -------------------
 drivers/pci/controller/dwc/pcie-qcom.c        |  8 -------
 drivers/pci/controller/dwc/pcie-spear13xx.c   |  1 +
 drivers/pci/controller/dwc/pcie-tegra194.c    |  8 -------
 drivers/pci/controller/dwc/pcie-uniphier.c    |  6 -----
 13 files changed, 14 insertions(+), 81 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 4d0c35a4aa59..6b75c68dddb5 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -489,6 +489,9 @@ static int __init dra7xx_add_pcie_port(struct dra7xx_pcie *dra7xx,
 	if (pp->irq < 0)
 		return pp->irq;
 
+	/* MSI IRQ is muxed */
+	pp->msi_irq = -ENODEV;
+
 	ret = dra7xx_pcie_init_irq_domain(pp);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index 242683cde04a..7734394953e5 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -415,12 +415,6 @@ static int __init exynos_add_pcie_port(struct exynos_pcie *ep,
 		return ret;
 	}
 
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		pp->msi_irq = platform_get_irq(pdev, 0);
-		if (pp->msi_irq < 0)
-			return pp->msi_irq;
-	}
-
 	pp->ops = &exynos_pcie_host_ops;
 
 	ret = dw_pcie_host_init(pp);
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 7dd137d62dca..1b979c956fcd 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -853,12 +853,6 @@ static int imx6_add_pcie_port(struct imx6_pcie *imx6_pcie,
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		pp->msi_irq = platform_get_irq_byname(pdev, "msi");
-		if (pp->msi_irq < 0)
-			return pp->msi_irq;
-	}
-
 	pp->ops = &imx6_pcie_host_ops;
 
 	ret = dw_pcie_host_init(pp);
diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 1913dc2c8fa0..10d65b3093e4 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -405,12 +405,6 @@ static int meson_add_pcie_port(struct meson_pcie *mp,
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		pp->msi_irq = platform_get_irq(pdev, 0);
-		if (pp->msi_irq < 0)
-			return pp->msi_irq;
-	}
-
 	pp->ops = &meson_pcie_host_ops;
 
 	ret = dw_pcie_host_init(pp);
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index 52ad7909cd0c..a5239a58cee0 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -348,12 +348,6 @@ static int artpec6_add_pcie_port(struct artpec6_pcie *artpec6_pcie,
 	struct device *dev = pci->dev;
 	int ret;
 
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		pp->msi_irq = platform_get_irq_byname(pdev, "msi");
-		if (pp->msi_irq < 0)
-			return pp->msi_irq;
-	}
-
 	pp->ops = &artpec6_pcie_host_ops;
 
 	ret = dw_pcie_host_init(pp);
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 1bd6a9762426..0f77e4d4b385 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -373,13 +373,22 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		}
 
 		if (!pp->ops->msi_host_init) {
+			if (!pp->msi_irq) {
+				pp->msi_irq = platform_get_irq_byname(pdev, "msi");
+				if (pp->msi_irq < 0) {
+					pp->msi_irq = platform_get_irq(pdev, 0);
+					if (pp->msi_irq < 0)
+						return pp->msi_irq;
+				}
+			}
+
 			pp->msi_irq_chip = &dw_pci_msi_bottom_irq_chip;
 
 			ret = dw_pcie_allocate_domains(pp);
 			if (ret)
 				return ret;
 
-			if (pp->msi_irq)
+			if (pp->msi_irq > 0)
 				irq_set_chained_handler_and_data(pp->msi_irq,
 							    dw_chained_msi_isr,
 							    pp);
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index 13fede1d4157..3da38ac6a87a 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -116,12 +116,6 @@ static int dw_plat_add_pcie_port(struct dw_plat_pcie *dw_plat_pcie,
 	if (pp->irq < 0)
 		return pp->irq;
 
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		pp->msi_irq = platform_get_irq(pdev, 0);
-		if (pp->msi_irq < 0)
-			return pp->msi_irq;
-	}
-
 	pp->num_vectors = MAX_MSI_IRQS;
 	pp->ops = &dw_plat_pcie_host_ops;
 
diff --git a/drivers/pci/controller/dwc/pcie-histb.c b/drivers/pci/controller/dwc/pcie-histb.c
index afc1abbe49aa..777e24902afb 100644
--- a/drivers/pci/controller/dwc/pcie-histb.c
+++ b/drivers/pci/controller/dwc/pcie-histb.c
@@ -400,12 +400,6 @@ static int histb_pcie_probe(struct platform_device *pdev)
 		return PTR_ERR(hipcie->bus_reset);
 	}
 
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		pp->msi_irq = platform_get_irq_byname(pdev, "msi");
-		if (pp->msi_irq < 0)
-			return pp->msi_irq;
-	}
-
 	hipcie->phy = devm_phy_get(dev, "phy");
 	if (IS_ERR(hipcie->phy)) {
 		dev_info(dev, "no pcie-phy found\n");
diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
index 3042a23cf09a..ba03dbca7885 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -439,31 +439,9 @@ static const struct dw_pcie_host_ops kirin_pcie_host_ops = {
 	.host_init = kirin_pcie_host_init,
 };
 
-static int kirin_pcie_add_msi(struct dw_pcie *pci,
-				struct platform_device *pdev)
-{
-	int irq;
-
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		irq = platform_get_irq(pdev, 0);
-		if (irq < 0)
-			return irq;
-
-		pci->pp.msi_irq = irq;
-	}
-
-	return 0;
-}
-
 static int kirin_add_pcie_port(struct dw_pcie *pci,
 			       struct platform_device *pdev)
 {
-	int ret;
-
-	ret = kirin_pcie_add_msi(pci, pdev);
-	if (ret)
-		return ret;
-
 	pci->pp.ops = &kirin_pcie_host_ops;
 
 	return dw_pcie_host_init(&pci->pp);
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 3b4f70b9f3f0..7ac08f0cae17 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1424,14 +1424,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 
 	pp->ops = &qcom_pcie_dw_ops;
 
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		pp->msi_irq = platform_get_irq_byname(pdev, "msi");
-		if (pp->msi_irq < 0) {
-			ret = pp->msi_irq;
-			goto err_pm_runtime_put;
-		}
-	}
-
 	ret = phy_init(pcie->phy);
 	if (ret) {
 		pm_runtime_disable(&pdev->dev);
diff --git a/drivers/pci/controller/dwc/pcie-spear13xx.c b/drivers/pci/controller/dwc/pcie-spear13xx.c
index 1ed7e3501ff1..800c34a60a33 100644
--- a/drivers/pci/controller/dwc/pcie-spear13xx.c
+++ b/drivers/pci/controller/dwc/pcie-spear13xx.c
@@ -185,6 +185,7 @@ static int spear13xx_add_pcie_port(struct spear13xx_pcie *spear13xx_pcie,
 	}
 
 	pp->ops = &spear13xx_pcie_host_ops;
+	pp->msi_irq = -ENODEV;
 
 	ret = dw_pcie_host_init(pp);
 	if (ret) {
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 5e2841f58700..77fc3ba3dec1 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1554,14 +1554,6 @@ static int tegra_pcie_config_rp(struct tegra_pcie_dw *pcie)
 	char *name;
 	int ret;
 
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		pp->msi_irq = of_irq_get_byname(dev->of_node, "msi");
-		if (!pp->msi_irq) {
-			dev_err(dev, "Failed to get MSI interrupt\n");
-			return -ENODEV;
-		}
-	}
-
 	pm_runtime_enable(dev);
 
 	ret = pm_runtime_get_sync(dev);
diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
index 33130fb4af90..6198bd106b8a 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -341,12 +341,6 @@ static int uniphier_add_pcie_port(struct uniphier_pcie_priv *priv,
 
 	pp->ops = &uniphier_pcie_host_ops;
 
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		pp->msi_irq = platform_get_irq_byname(pdev, "msi");
-		if (pp->msi_irq < 0)
-			return pp->msi_irq;
-	}
-
 	ret = dw_pcie_host_init(pp);
 	if (ret) {
 		dev_err(dev, "Failed to initialize host (%d)\n", ret);
-- 
2.25.1

