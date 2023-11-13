Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DAC7E942D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 02:39:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STBtX5p5mz3dX5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 12:39:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=renesas.com (client-ip=210.160.252.172; helo=relmlie6.idc.renesas.com; envelope-from=yoshihiro.shimoda.uh@renesas.com; receiver=lists.ozlabs.org)
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STBs06Mzbz3bTN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 12:38:12 +1100 (AEDT)
X-IronPort-AV: E=Sophos;i="6.03,298,1694703600"; 
   d="scan'208";a="186494703"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Nov 2023 10:33:02 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8BD4140031CF;
	Mon, 13 Nov 2023 10:33:02 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	gustavo.pimentel@synopsys.com,
	mani@kernel.org,
	minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com,
	roy.zang@nxp.com
Subject: [PATCH 1/3] PCI: dwc: Rename to .init in struct dw_pcie_ep_ops
Date: Mon, 13 Nov 2023 10:32:58 +0900
Message-Id: <20231113013300.2132152-2-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231113013300.2132152-1-yoshihiro.shimoda.uh@renesas.com>
References: <20231113013300.2132152-1-yoshihiro.shimoda.uh@renesas.com>
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
Cc: linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linuxppc-dev@lists.ozlabs.org, marek.vasut+renesas@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since the name of dw_pcie_ep_ops indicates that it's for ep obviously,
rename a member .ep_init to .init.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pci/controller/dwc/pci-dra7xx.c           | 2 +-
 drivers/pci/controller/dwc/pci-imx6.c             | 2 +-
 drivers/pci/controller/dwc/pci-keystone.c         | 2 +-
 drivers/pci/controller/dwc/pci-layerscape-ep.c    | 2 +-
 drivers/pci/controller/dwc/pcie-artpec6.c         | 2 +-
 drivers/pci/controller/dwc/pcie-designware-ep.c   | 4 ++--
 drivers/pci/controller/dwc/pcie-designware-plat.c | 2 +-
 drivers/pci/controller/dwc/pcie-designware.h      | 2 +-
 drivers/pci/controller/dwc/pcie-keembay.c         | 2 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c         | 2 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 2 +-
 drivers/pci/controller/dwc/pcie-uniphier-ep.c     | 2 +-
 12 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index b445ffe95e3f..f9182cd6fe67 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -436,7 +436,7 @@ dra7xx_pcie_get_features(struct dw_pcie_ep *ep)
 }
 
 static const struct dw_pcie_ep_ops pcie_ep_ops = {
-	.ep_init = dra7xx_pcie_ep_init,
+	.init = dra7xx_pcie_ep_init,
 	.raise_irq = dra7xx_pcie_raise_irq,
 	.get_features = dra7xx_pcie_get_features,
 };
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 74703362aeec..737d4d90fef2 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1093,7 +1093,7 @@ imx6_pcie_ep_get_features(struct dw_pcie_ep *ep)
 }
 
 static const struct dw_pcie_ep_ops pcie_ep_ops = {
-	.ep_init = imx6_pcie_ep_init,
+	.init = imx6_pcie_ep_init,
 	.raise_irq = imx6_pcie_ep_raise_irq,
 	.get_features = imx6_pcie_ep_get_features,
 };
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 0def919f89fa..655c7307eb88 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -944,7 +944,7 @@ ks_pcie_am654_get_features(struct dw_pcie_ep *ep)
 }
 
 static const struct dw_pcie_ep_ops ks_pcie_am654_ep_ops = {
-	.ep_init = ks_pcie_am654_ep_init,
+	.init = ks_pcie_am654_ep_init,
 	.raise_irq = ks_pcie_am654_raise_irq,
 	.get_features = &ks_pcie_am654_get_features,
 };
diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index 3d3c50ef4b6f..4e4b687ef508 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -195,7 +195,7 @@ static unsigned int ls_pcie_ep_func_conf_select(struct dw_pcie_ep *ep,
 }
 
 static const struct dw_pcie_ep_ops ls_pcie_ep_ops = {
-	.ep_init = ls_pcie_ep_init,
+	.init = ls_pcie_ep_init,
 	.raise_irq = ls_pcie_ep_raise_irq,
 	.get_features = ls_pcie_ep_get_features,
 	.func_conf_select = ls_pcie_ep_func_conf_select,
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index 9b572a2b2c9a..27ff425c0698 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -370,7 +370,7 @@ static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct dw_pcie_ep_ops pcie_ep_ops = {
-	.ep_init = artpec6_pcie_ep_init,
+	.init = artpec6_pcie_ep_init,
 	.raise_irq = artpec6_pcie_raise_irq,
 };
 
diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index f6207989fc6a..ea99a97ce504 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -794,8 +794,8 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 		list_add_tail(&ep_func->list, &ep->func_list);
 	}
 
-	if (ep->ops->ep_init)
-		ep->ops->ep_init(ep);
+	if (ep->ops->init)
+		ep->ops->init(ep);
 
 	ret = pci_epc_mem_init(epc, ep->phys_base, ep->addr_size,
 			       ep->page_size);
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index b625841e98aa..97088b7663e0 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -74,7 +74,7 @@ dw_plat_pcie_get_features(struct dw_pcie_ep *ep)
 }
 
 static const struct dw_pcie_ep_ops pcie_ep_ops = {
-	.ep_init = dw_plat_pcie_ep_init,
+	.init = dw_plat_pcie_ep_init,
 	.raise_irq = dw_plat_pcie_ep_raise_irq,
 	.get_features = dw_plat_pcie_get_features,
 };
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 55ff76e3d384..cad0e4c24e11 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -332,7 +332,7 @@ struct dw_pcie_rp {
 
 struct dw_pcie_ep_ops {
 	void	(*pre_init)(struct dw_pcie_ep *ep);
-	void	(*ep_init)(struct dw_pcie_ep *ep);
+	void	(*init)(struct dw_pcie_ep *ep);
 	void	(*deinit)(struct dw_pcie_ep *ep);
 	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
 			     enum pci_epc_irq_type type, u16 interrupt_num);
diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
index 289bff99d762..3c38e047d5ed 100644
--- a/drivers/pci/controller/dwc/pcie-keembay.c
+++ b/drivers/pci/controller/dwc/pcie-keembay.c
@@ -325,7 +325,7 @@ keembay_pcie_get_features(struct dw_pcie_ep *ep)
 }
 
 static const struct dw_pcie_ep_ops keembay_pcie_ep_ops = {
-	.ep_init	= keembay_pcie_ep_init,
+	.init	= keembay_pcie_ep_init,
 	.raise_irq	= keembay_pcie_ep_raise_irq,
 	.get_features	= keembay_pcie_get_features,
 };
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 9e58f055199a..2b6f7c144c61 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -796,7 +796,7 @@ static void qcom_pcie_ep_init(struct dw_pcie_ep *ep)
 }
 
 static const struct dw_pcie_ep_ops pci_ep_ops = {
-	.ep_init = qcom_pcie_ep_init,
+	.init = qcom_pcie_ep_init,
 	.raise_irq = qcom_pcie_ep_raise_irq,
 	.get_features = qcom_pcie_epc_get_features,
 };
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 3bc45e513b3d..2b7e0f213fb2 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -408,7 +408,7 @@ static unsigned int rcar_gen4_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep,
 
 static const struct dw_pcie_ep_ops pcie_ep_ops = {
 	.pre_init = rcar_gen4_pcie_ep_pre_init,
-	.ep_init = rcar_gen4_pcie_ep_init,
+	.init = rcar_gen4_pcie_ep_init,
 	.deinit = rcar_gen4_pcie_ep_deinit,
 	.raise_irq = rcar_gen4_pcie_ep_raise_irq,
 	.get_features = rcar_gen4_pcie_ep_get_features,
diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
index cba3c88fcf39..40bd468f7e11 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
@@ -284,7 +284,7 @@ uniphier_pcie_get_features(struct dw_pcie_ep *ep)
 }
 
 static const struct dw_pcie_ep_ops uniphier_pcie_ep_ops = {
-	.ep_init = uniphier_pcie_ep_init,
+	.init = uniphier_pcie_ep_init,
 	.raise_irq = uniphier_pcie_ep_raise_irq,
 	.get_features = uniphier_pcie_get_features,
 };
-- 
2.34.1

