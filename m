Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C5F29D229
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 21:55:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM17B06BnzDqXT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 07:55:34 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM0xQ1d1HzDqVC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 07:47:05 +1100 (AEDT)
Received: by mail-oi1-f193.google.com with SMTP id k27so939689oij.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 13:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IzJpgC50B1aEr5UEqZkrsDaDZthdlXtSVmgpDKQvfR0=;
 b=kKRIED4vps2HSayPddkEkOQlG2V3QGOFSY4kgPokFD5+T6N8631MNaM+RqAkfKGpSu
 SrNpHoktOB243O9Aahryh06wHm1LVtnVcOU5sAvryb5T0wRcJTMoWIyeNzZkNnmBJJR/
 Ddto38k/xzTIntWnbU3tQsyn52gDu0Q7PBlUNCHQ1stBBZbWL/KPDF/BzcuHVigoIvZW
 /jvL7jm0iheSk+KlwU8wdV4ohBd9VcF+fg6T3uIfQNG20WqwYLB1sL5S50L8P3iJEV7F
 SV70sT3b4iOEg6pFQ2u0MzRdFZbIwl16GsvoS9mwrji6urLmO4gr3OwcN8RotWMlv6Ii
 aw9g==
X-Gm-Message-State: AOAM5318VfHvzJNQMtizlDsmRK6hvrI7iIslEhIw5HgWG2mj9Wa0yw2S
 +Z+fHqj4IwAhLKePJX4XQA==
X-Google-Smtp-Source: ABdhPJwkVdug/4qdZCJhvQsjCEVeaO4AKUvKQygW6QFcLOHfAO/BojTtu59syxrkhQvjVSXU4OEQTQ==
X-Received: by 2002:aca:b145:: with SMTP id a66mr658786oif.92.1603918019964;
 Wed, 28 Oct 2020 13:46:59 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id t17sm116123oor.3.2020.10.28.13.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 13:46:59 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 04/13] PCI: dwc/intel-gw: Remove some unneeded function
 wrappers
Date: Wed, 28 Oct 2020 15:46:37 -0500
Message-Id: <20201028204646.356535-5-robh@kernel.org>
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

Remove some of the pointless levels of functions that just wrap or group
a series of other functions.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-intel-gw.c | 47 ++++++++--------------
 1 file changed, 16 insertions(+), 31 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index 88782653ed21..c562eb7454b1 100644
--- a/drivers/pci/controller/dwc/pcie-intel-gw.c
+++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
@@ -152,19 +152,6 @@ static void intel_pcie_init_n_fts(struct dw_pcie *pci)
 	pci->n_fts[0] = PORT_AFR_N_FTS_GEN12_DFT;
 }
 
-static void intel_pcie_rc_setup(struct intel_pcie_port *lpp)
-{
-	struct dw_pcie *pci = &lpp->pci;
-
-	pci->atu_base = pci->dbi_base + 0xC0000;
-
-	intel_pcie_ltssm_disable(lpp);
-	intel_pcie_link_setup(lpp);
-	intel_pcie_init_n_fts(pci);
-	dw_pcie_setup_rc(&pci->pp);
-	dw_pcie_upconfig_setup(pci);
-}
-
 static int intel_pcie_ep_rst_init(struct intel_pcie_port *lpp)
 {
 	struct device *dev = lpp->pci.dev;
@@ -216,14 +203,6 @@ static void intel_pcie_device_rst_deassert(struct intel_pcie_port *lpp)
 	gpiod_set_value_cansleep(lpp->reset_gpio, 0);
 }
 
-static int intel_pcie_app_logic_setup(struct intel_pcie_port *lpp)
-{
-	intel_pcie_device_rst_deassert(lpp);
-	intel_pcie_ltssm_enable(lpp);
-
-	return dw_pcie_wait_for_link(&lpp->pci);
-}
-
 static void intel_pcie_core_irq_disable(struct intel_pcie_port *lpp)
 {
 	pcie_app_wr(lpp, PCIE_APP_IRNEN, 0);
@@ -273,11 +252,6 @@ static int intel_pcie_get_resources(struct platform_device *pdev)
 	return 0;
 }
 
-static void intel_pcie_deinit_phy(struct intel_pcie_port *lpp)
-{
-	phy_exit(lpp->phy);
-}
-
 static int intel_pcie_wait_l2(struct intel_pcie_port *lpp)
 {
 	u32 value;
@@ -314,6 +288,7 @@ static void intel_pcie_turn_off(struct intel_pcie_port *lpp)
 static int intel_pcie_host_setup(struct intel_pcie_port *lpp)
 {
 	int ret;
+	struct dw_pcie *pci = &lpp->pci;
 
 	intel_pcie_core_rst_assert(lpp);
 	intel_pcie_device_rst_assert(lpp);
@@ -330,8 +305,18 @@ static int intel_pcie_host_setup(struct intel_pcie_port *lpp)
 		goto clk_err;
 	}
 
-	intel_pcie_rc_setup(lpp);
-	ret = intel_pcie_app_logic_setup(lpp);
+	pci->atu_base = pci->dbi_base + 0xC0000;
+
+	intel_pcie_ltssm_disable(lpp);
+	intel_pcie_link_setup(lpp);
+	intel_pcie_init_n_fts(pci);
+	dw_pcie_setup_rc(&pci->pp);
+	dw_pcie_upconfig_setup(pci);
+
+	intel_pcie_device_rst_deassert(lpp);
+	intel_pcie_ltssm_enable(lpp);
+
+	ret = dw_pcie_wait_for_link(pci);
 	if (ret)
 		goto app_init_err;
 
@@ -345,7 +330,7 @@ static int intel_pcie_host_setup(struct intel_pcie_port *lpp)
 	clk_disable_unprepare(lpp->core_clk);
 clk_err:
 	intel_pcie_core_rst_assert(lpp);
-	intel_pcie_deinit_phy(lpp);
+	phy_exit(lpp->phy);
 
 	return ret;
 }
@@ -356,7 +341,7 @@ static void __intel_pcie_remove(struct intel_pcie_port *lpp)
 	intel_pcie_turn_off(lpp);
 	clk_disable_unprepare(lpp->core_clk);
 	intel_pcie_core_rst_assert(lpp);
-	intel_pcie_deinit_phy(lpp);
+	phy_exit(lpp->phy);
 }
 
 static int intel_pcie_remove(struct platform_device *pdev)
@@ -380,7 +365,7 @@ static int __maybe_unused intel_pcie_suspend_noirq(struct device *dev)
 	if (ret)
 		return ret;
 
-	intel_pcie_deinit_phy(lpp);
+	phy_exit(lpp->phy);
 	clk_disable_unprepare(lpp->core_clk);
 	return ret;
 }
-- 
2.25.1

