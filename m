Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E0829D236
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 22:09:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM1Qk5dsSzDqWd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 08:09:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM0xg5zTBzDqTZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 07:47:19 +1100 (AEDT)
Received: by mail-ot1-f65.google.com with SMTP id x7so437152ota.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 13:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4XkpBfVGL7XrEKDyAA/C46oOJNkiByh0tecVNjWZ6aA=;
 b=GoWQy2LxQKDMnbH8/uvG+AFfth9hVKCQ6DDZYVtrWfL2wkPwPixLOTs0pGIK0Na3R0
 +yTdhJkYKooPIx/TuauITAhXpV3lhDF0Ybv5LoA7mYcS30DMC7uxPt/8PUHe2vcdwFXJ
 wsLTzdeS4tT0uFcvOvD996KVTDhzACc6G4K4cxq25i3hm5h5SN7GHxSCLmXlyVIG28EI
 92P8p0RjdD14G42UpLFFi2mPL1oaIjMAurReJr6tD0xXzg3IiTooQ0WfW3Zw6L/EWBSo
 WHQpe2W9yKWmOTmpuADJlZocIqJlPjjwBCThHmrFED4pIguHlKB1heuWjOKIBKk5LnmO
 xhxg==
X-Gm-Message-State: AOAM532WbGgUgqc8ngPn6DvUJYOCcGkC0S58Zgt36bLHD/dP5CNS/SGv
 +4Qkse1r2+kF5i2LlVOXUg==
X-Google-Smtp-Source: ABdhPJzIzmWWg20iJuPa9vvq48ZpazjFMwYkNbAfmht+TLICCFuKWPvn05OJglXIjHPgcyfcsQ1XUQ==
X-Received: by 2002:a9d:649:: with SMTP id 67mr829690otn.233.1603918037942;
 Wed, 28 Oct 2020 13:47:17 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id t17sm116123oor.3.2020.10.28.13.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 13:47:17 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 11/13] PCI: dwc: Move dw_pcie_msi_init() into core
Date: Wed, 28 Oct 2020 15:46:44 -0500
Message-Id: <20201028204646.356535-12-robh@kernel.org>
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

The host drivers which call dw_pcie_msi_init() are all the ones using
the built-in MSI controller, so let's move it into the common DWC code.

Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
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
Cc: linux-omap@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@axis.com
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-dra7xx.c           |  2 --
 drivers/pci/controller/dwc/pci-exynos.c           |  4 ----
 drivers/pci/controller/dwc/pci-imx6.c             |  1 -
 drivers/pci/controller/dwc/pci-meson.c            |  1 -
 drivers/pci/controller/dwc/pcie-artpec6.c         |  1 -
 drivers/pci/controller/dwc/pcie-designware-host.c |  8 +++++---
 drivers/pci/controller/dwc/pcie-designware-plat.c |  1 -
 drivers/pci/controller/dwc/pcie-designware.h      | 10 ----------
 drivers/pci/controller/dwc/pcie-histb.c           |  2 --
 drivers/pci/controller/dwc/pcie-kirin.c           |  1 -
 drivers/pci/controller/dwc/pcie-qcom.c            |  2 --
 drivers/pci/controller/dwc/pcie-spear13xx.c       |  6 +-----
 drivers/pci/controller/dwc/pcie-tegra194.c        |  2 --
 drivers/pci/controller/dwc/pcie-uniphier.c        |  1 -
 14 files changed, 6 insertions(+), 36 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 054423d9646d..72a5a2bf933b 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -182,8 +182,6 @@ static int dra7xx_pcie_host_init(struct pcie_port *pp)
 	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
 
 	dw_pcie_setup_rc(pp);
-
-	dw_pcie_msi_init(pp);
 	dra7xx_pcie_enable_interrupts(dra7xx);
 
 	return 0;
diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index 6498b615c834..3939fe22e8a2 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -273,12 +273,8 @@ static irqreturn_t exynos_pcie_irq_handler(int irq, void *arg)
 
 static void exynos_pcie_msi_init(struct exynos_pcie *ep)
 {
-	struct dw_pcie *pci = ep->pci;
-	struct pcie_port *pp = &pci->pp;
 	u32 val;
 
-	dw_pcie_msi_init(pp);
-
 	/* enable MSI interrupt */
 	val = exynos_pcie_readl(ep->mem_res->elbi_base, PCIE_IRQ_EN_LEVEL);
 	val |= IRQ_MSI_ENABLE;
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 20e249efb02c..c808b563486f 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -835,7 +835,6 @@ static int imx6_pcie_host_init(struct pcie_port *pp)
 	imx6_pcie_deassert_core_reset(imx6_pcie);
 	imx6_setup_phy_mpll(imx6_pcie);
 	dw_pcie_setup_rc(pp);
-	dw_pcie_msi_init(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 41a3351b100b..2df0adcf0bf2 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -381,7 +381,6 @@ static int meson_pcie_host_init(struct pcie_port *pp)
 	meson_set_max_rd_req_size(mp, MAX_READ_REQ_SIZE);
 
 	dw_pcie_setup_rc(pp);
-	dw_pcie_msi_init(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index 8b3da3038ac3..7ee8f3c83f8f 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -329,7 +329,6 @@ static int artpec6_pcie_host_init(struct pcie_port *pp)
 	artpec6_pcie_deassert_core_reset(artpec6_pcie);
 	artpec6_pcie_wait_for_phy(artpec6_pcie);
 	dw_pcie_setup_rc(pp);
-	dw_pcie_msi_init(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index f5f9d4e58aa3..025514e00a42 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -256,7 +256,7 @@ int dw_pcie_allocate_domains(struct pcie_port *pp)
 	return 0;
 }
 
-void dw_pcie_free_msi(struct pcie_port *pp)
+static void dw_pcie_free_msi(struct pcie_port *pp)
 {
 	if (pp->msi_irq) {
 		irq_set_chained_handler(pp->msi_irq, NULL);
@@ -275,12 +275,12 @@ void dw_pcie_free_msi(struct pcie_port *pp)
 	}
 }
 
-void dw_pcie_msi_init(struct pcie_port *pp)
+static void dw_pcie_msi_init(struct pcie_port *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	u64 msi_target = (u64)pp->msi_data;
 
-	if (!IS_ENABLED(CONFIG_PCI_MSI))
+	if (!pci_msi_enabled() || !pp->has_msi_ctrl)
 		return;
 
 	/* Program the msi_data */
@@ -423,6 +423,8 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			goto err_free_msi;
 	}
 
+	dw_pcie_msi_init(pp);
+
 	if (!dw_pcie_link_up(pci) && pci->ops->start_link) {
 		ret = pci->ops->start_link(pci);
 		if (ret)
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index adebcaeb1a6c..dec24e595c3e 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -36,7 +36,6 @@ static const struct of_device_id dw_plat_pcie_of_match[];
 static int dw_plat_pcie_host_init(struct pcie_port *pp)
 {
 	dw_pcie_setup_rc(pp);
-	dw_pcie_msi_init(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 5d374bab10d1..57326aebc6e1 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -363,8 +363,6 @@ static inline void dw_pcie_dbi_ro_wr_dis(struct dw_pcie *pci)
 
 #ifdef CONFIG_PCIE_DW_HOST
 irqreturn_t dw_handle_msi_irq(struct pcie_port *pp);
-void dw_pcie_msi_init(struct pcie_port *pp);
-void dw_pcie_free_msi(struct pcie_port *pp);
 void dw_pcie_setup_rc(struct pcie_port *pp);
 int dw_pcie_host_init(struct pcie_port *pp);
 void dw_pcie_host_deinit(struct pcie_port *pp);
@@ -377,14 +375,6 @@ static inline irqreturn_t dw_handle_msi_irq(struct pcie_port *pp)
 	return IRQ_NONE;
 }
 
-static inline void dw_pcie_msi_init(struct pcie_port *pp)
-{
-}
-
-static inline void dw_pcie_free_msi(struct pcie_port *pp)
-{
-}
-
 static inline void dw_pcie_setup_rc(struct pcie_port *pp)
 {
 }
diff --git a/drivers/pci/controller/dwc/pcie-histb.c b/drivers/pci/controller/dwc/pcie-histb.c
index ece544165059..210777c793ea 100644
--- a/drivers/pci/controller/dwc/pcie-histb.c
+++ b/drivers/pci/controller/dwc/pcie-histb.c
@@ -199,8 +199,6 @@ static int histb_pcie_host_init(struct pcie_port *pp)
 	/* setup root complex */
 	dw_pcie_setup_rc(pp);
 
-	dw_pcie_msi_init(pp);
-
 	return 0;
 }
 
diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
index 675b4d8392d3..f84ac1b36b2c 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -406,7 +406,6 @@ static int kirin_pcie_host_init(struct pcie_port *pp)
 	pp->bridge->ops = &kirin_pci_ops;
 
 	dw_pcie_setup_rc(pp);
-	dw_pcie_msi_init(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 8eb8ac2fb270..eb107179d544 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1281,8 +1281,6 @@ static int qcom_pcie_host_init(struct pcie_port *pp)
 	}
 
 	dw_pcie_setup_rc(pp);
-	dw_pcie_msi_init(pp);
-
 	qcom_ep_reset_deassert(pcie);
 
 	return 0;
diff --git a/drivers/pci/controller/dwc/pcie-spear13xx.c b/drivers/pci/controller/dwc/pcie-spear13xx.c
index ebbaa06fc8ab..31475e4493a7 100644
--- a/drivers/pci/controller/dwc/pcie-spear13xx.c
+++ b/drivers/pci/controller/dwc/pcie-spear13xx.c
@@ -102,16 +102,12 @@ static irqreturn_t spear13xx_pcie_irq_handler(int irq, void *arg)
 
 static void spear13xx_pcie_enable_interrupts(struct spear13xx_pcie *spear13xx_pcie)
 {
-	struct dw_pcie *pci = spear13xx_pcie->pci;
-	struct pcie_port *pp = &pci->pp;
 	struct pcie_app_reg *app_reg = spear13xx_pcie->app_base;
 
 	/* Enable MSI interrupt */
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		dw_pcie_msi_init(pp);
+	if (IS_ENABLED(CONFIG_PCI_MSI))
 		writel(readl(&app_reg->int_mask) |
 				MSI_CTRL_INT, &app_reg->int_mask);
-	}
 }
 
 static int spear13xx_pcie_link_up(struct dw_pcie *pci)
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index f7d7b002a06d..84f3e0bb4c7a 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -765,8 +765,6 @@ static void tegra_pcie_enable_msi_interrupts(struct pcie_port *pp)
 	struct tegra_pcie_dw *pcie = to_tegra_pcie(pci);
 	u32 val;
 
-	dw_pcie_msi_init(pp);
-
 	/* Enable MSI interrupt generation */
 	val = appl_readl(pcie, APPL_INTR_EN_L0_0);
 	val |= APPL_INTR_EN_L0_0_SYS_MSI_INTR_EN;
diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
index f4b776e231d6..e6616408a29c 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -315,7 +315,6 @@ static int uniphier_pcie_host_init(struct pcie_port *pp)
 	uniphier_pcie_irq_enable(priv);
 
 	dw_pcie_setup_rc(pp);
-	dw_pcie_msi_init(pp);
 
 	return 0;
 }
-- 
2.25.1

