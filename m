Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ECD8E78B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 10:58:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468L3B3MP0zDqmh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 18:58:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468Kpd0fsCzDr10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 18:47:53 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1C848200449;
 Thu, 15 Aug 2019 10:47:50 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 66C5C200440;
 Thu, 15 Aug 2019 10:47:41 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 0A0DF4031B;
 Thu, 15 Aug 2019 16:47:30 +0800 (SGT)
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, bhelgaas@google.com,
 robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
 leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, minghuan.Lian@nxp.com,
 mingkai.hu@nxp.com, roy.zang@nxp.com, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/10] PCI: layerscape: Modify the way of getting capability
 with different PEX
Date: Thu, 15 Aug 2019 16:37:11 +0800
Message-Id: <20190815083716.4715-5-xiaowei.bao@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20190815083716.4715-1-xiaowei.bao@nxp.com>
References: <20190815083716.4715-1-xiaowei.bao@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: Xiaowei Bao <xiaowei.bao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The different PCIe controller in one board may be have different
capability of MSI or MSIX, so change the way of getting the MSI
capability, make it more flexible.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
---
 drivers/pci/controller/dwc/pci-layerscape-ep.c | 28 +++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index be61d96..9404ca0 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -22,6 +22,7 @@
 
 struct ls_pcie_ep {
 	struct dw_pcie		*pci;
+	struct pci_epc_features	*ls_epc;
 };
 
 #define to_ls_pcie_ep(x)	dev_get_drvdata((x)->dev)
@@ -40,25 +41,26 @@ static const struct of_device_id ls_pcie_ep_of_match[] = {
 	{ },
 };
 
-static const struct pci_epc_features ls_pcie_epc_features = {
-	.linkup_notifier = false,
-	.msi_capable = true,
-	.msix_capable = false,
-};
-
 static const struct pci_epc_features*
 ls_pcie_ep_get_features(struct dw_pcie_ep *ep)
 {
-	return &ls_pcie_epc_features;
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
+
+	return pcie->ls_epc;
 }
 
 static void ls_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
 	enum pci_barno bar;
 
 	for (bar = BAR_0; bar <= BAR_5; bar++)
 		dw_pcie_ep_reset_bar(pci, bar);
+
+	pcie->ls_epc->msi_capable = ep->msi_cap ? true : false;
+	pcie->ls_epc->msix_capable = ep->msix_cap ? true : false;
 }
 
 static int ls_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
@@ -118,6 +120,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct dw_pcie *pci;
 	struct ls_pcie_ep *pcie;
+	struct pci_epc_features *ls_epc;
 	struct resource *dbi_base;
 	int ret;
 
@@ -129,6 +132,10 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	if (!pci)
 		return -ENOMEM;
 
+	ls_epc = devm_kzalloc(dev, sizeof(*ls_epc), GFP_KERNEL);
+	if (!ls_epc)
+		return -ENOMEM;
+
 	dbi_base = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
 	pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_base);
 	if (IS_ERR(pci->dbi_base))
@@ -139,6 +146,13 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	pci->ops = &ls_pcie_ep_ops;
 	pcie->pci = pci;
 
+	ls_epc->linkup_notifier = false,
+	ls_epc->msi_capable = true,
+	ls_epc->msix_capable = true,
+	ls_epc->bar_fixed_64bit = (1 << BAR_2) | (1 << BAR_4),
+
+	pcie->ls_epc = ls_epc;
+
 	platform_set_drvdata(pdev, pcie);
 
 	ret = ls_add_pcie_ep(pcie, pdev);
-- 
2.9.5

