Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBB58B00B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 08:42:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46736K4rC9zDqH5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 16:42:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46732c0RPWzDqWQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 16:38:47 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 705381A02E1;
 Tue, 13 Aug 2019 08:38:43 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2665A1A0135;
 Tue, 13 Aug 2019 08:38:35 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id CD44B40305;
 Tue, 13 Aug 2019 14:38:24 +0800 (SGT)
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, minghuan.Lian@nxp.com,
 mingkai.hu@nxp.com, roy.zang@nxp.com, l.stach@pengutronix.de,
 kishon@ti.com, tpiepho@impinj.com, leonard.crestez@nxp.com,
 andrew.smirnov@gmail.com, yue.wang@amlogic.com,
 hayashi.kunihiko@socionext.com, dwmw@amazon.co.uk, jonnyc@amazon.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCHv5 2/2] PCI: layerscape: Add CONFIG_PCI_LAYERSCAPE_EP to build
 EP/RC separately
Date: Tue, 13 Aug 2019 14:28:40 +0800
Message-Id: <20190813062840.2733-2-xiaowei.bao@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20190813062840.2733-1-xiaowei.bao@nxp.com>
References: <20190813062840.2733-1-xiaowei.bao@nxp.com>
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

Add CONFIG_PCI_LAYERSCAPE_EP to build EP/RC separately.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
---
v2:
 - No change.
v3:
 - modify the commit message.
v4:
 - send the patch again with '--to'.
v5:
 - No change.

 drivers/pci/controller/dwc/Kconfig  | 20 ++++++++++++++++++--
 drivers/pci/controller/dwc/Makefile |  3 ++-
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index 6ea778a..869c645 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -131,13 +131,29 @@ config PCI_KEYSTONE_EP
 	  DesignWare core functions to implement the driver.
 
 config PCI_LAYERSCAPE
-	bool "Freescale Layerscape PCIe controller"
+	bool "Freescale Layerscape PCIe controller - Host mode"
 	depends on OF && (ARM || ARCH_LAYERSCAPE || COMPILE_TEST)
 	depends on PCI_MSI_IRQ_DOMAIN
 	select MFD_SYSCON
 	select PCIE_DW_HOST
 	help
-	  Say Y here if you want PCIe controller support on Layerscape SoCs.
+	  Say Y here if you want to enable PCIe controller support on Layerscape
+	  SoCs to work in Host mode.
+	  This controller can work either as EP or RC. The RCW[HOST_AGT_PEX]
+	  determines which PCIe controller works in EP mode and which PCIe
+	  controller works in RC mode.
+
+config PCI_LAYERSCAPE_EP
+	bool "Freescale Layerscape PCIe controller - Endpoint mode"
+	depends on OF && (ARM || ARCH_LAYERSCAPE || COMPILE_TEST)
+	depends on PCI_ENDPOINT
+	select PCIE_DW_EP
+	help
+	  Say Y here if you want to enable PCIe controller support on Layerscape
+	  SoCs to work in Endpoint mode.
+	  This controller can work either as EP or RC. The RCW[HOST_AGT_PEX]
+	  determines which PCIe controller works in EP mode and which PCIe
+	  controller works in RC mode.
 
 config PCI_HISI
 	depends on OF && (ARM64 || COMPILE_TEST)
diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
index b085dfd..824fde7 100644
--- a/drivers/pci/controller/dwc/Makefile
+++ b/drivers/pci/controller/dwc/Makefile
@@ -8,7 +8,8 @@ obj-$(CONFIG_PCI_EXYNOS) += pci-exynos.o
 obj-$(CONFIG_PCI_IMX6) += pci-imx6.o
 obj-$(CONFIG_PCIE_SPEAR13XX) += pcie-spear13xx.o
 obj-$(CONFIG_PCI_KEYSTONE) += pci-keystone.o
-obj-$(CONFIG_PCI_LAYERSCAPE) += pci-layerscape.o pci-layerscape-ep.o
+obj-$(CONFIG_PCI_LAYERSCAPE) += pci-layerscape.o
+obj-$(CONFIG_PCI_LAYERSCAPE_EP) += pci-layerscape-ep.o
 obj-$(CONFIG_PCIE_QCOM) += pcie-qcom.o
 obj-$(CONFIG_PCIE_ARMADA_8K) += pcie-armada8k.o
 obj-$(CONFIG_PCIE_ARTPEC6) += pcie-artpec6.o
-- 
2.9.5

