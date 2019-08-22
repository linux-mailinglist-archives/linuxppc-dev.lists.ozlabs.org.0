Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B003599245
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 13:37:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DjDl2TwRzDqkf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 21:37:11 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Dj7t5B0wzDqkc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 21:32:56 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9A7571A00C7;
 Thu, 22 Aug 2019 13:32:52 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4E8821A02CF;
 Thu, 22 Aug 2019 13:32:42 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 2B1A140296;
 Thu, 22 Aug 2019 19:32:30 +0800 (SGT)
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com,
 shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com,
 lorenzo.pieralisi@arm.co, arnd@arndb.de, gregkh@linuxfoundation.org,
 minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com,
 jingoohan1@gmail.com, gustavo.pimentel@synopsys.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, andrew.murray@arm.com
Subject: [PATCH v2 01/10] PCI: designware-ep: Add multiple PFs support for DWC
Date: Thu, 22 Aug 2019 19:22:33 +0800
Message-Id: <20190822112242.16309-1-xiaowei.bao@nxp.com>
X-Mailer: git-send-email 2.9.5
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

Add multiple PFs support for DWC, different PF have different config space
we use pf-offset property which get from the DTS to access the different pF
config space.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
---
v2:
 - Remove duplicate redundant code.
 - Reimplement the PF config space access way.

 drivers/pci/controller/dwc/pcie-designware-ep.c | 122 ++++++++++++++++--------
 drivers/pci/controller/dwc/pcie-designware.c    |  59 ++++++++----
 drivers/pci/controller/dwc/pcie-designware.h    |  11 ++-
 3 files changed, 134 insertions(+), 58 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 2bf5a35..3e2b740 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -19,12 +19,17 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
 	pci_epc_linkup(epc);
 }
 
-static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar,
-				   int flags)
+static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, u8 func_no,
+				   enum pci_barno bar, int flags)
 {
 	u32 reg;
+	unsigned int func_offset = 0;
+	struct dw_pcie_ep *ep = &pci->ep;
 
-	reg = PCI_BASE_ADDRESS_0 + (4 * bar);
+	if (ep->ops->func_conf_select)
+		func_offset = ep->ops->func_conf_select(ep, func_no);
+
+	reg = func_offset + PCI_BASE_ADDRESS_0 + (4 * bar);
 	dw_pcie_dbi_ro_wr_en(pci);
 	dw_pcie_writel_dbi2(pci, reg, 0x0);
 	dw_pcie_writel_dbi(pci, reg, 0x0);
@@ -37,7 +42,12 @@ static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar,
 
 void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
 {
-	__dw_pcie_ep_reset_bar(pci, bar, 0);
+	u8 func_no, funcs;
+
+	funcs = pci->ep.epc->max_functions;
+
+	for (func_no = 0; func_no < funcs; func_no++)
+		__dw_pcie_ep_reset_bar(pci, func_no, bar, 0);
 }
 
 static u8 __dw_pcie_ep_find_next_cap(struct dw_pcie *pci, u8 cap_ptr,
@@ -78,28 +88,32 @@ static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no,
 {
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	unsigned int func_offset = 0;
+
+	if (ep->ops->func_conf_select)
+		func_offset = ep->ops->func_conf_select(ep, func_no);
 
 	dw_pcie_dbi_ro_wr_en(pci);
-	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, hdr->vendorid);
-	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, hdr->deviceid);
-	dw_pcie_writeb_dbi(pci, PCI_REVISION_ID, hdr->revid);
-	dw_pcie_writeb_dbi(pci, PCI_CLASS_PROG, hdr->progif_code);
-	dw_pcie_writew_dbi(pci, PCI_CLASS_DEVICE,
+	dw_pcie_writew_dbi(pci, func_offset + PCI_VENDOR_ID, hdr->vendorid);
+	dw_pcie_writew_dbi(pci, func_offset + PCI_DEVICE_ID, hdr->deviceid);
+	dw_pcie_writeb_dbi(pci, func_offset + PCI_REVISION_ID, hdr->revid);
+	dw_pcie_writeb_dbi(pci, func_offset + PCI_CLASS_PROG, hdr->progif_code);
+	dw_pcie_writew_dbi(pci, func_offset + PCI_CLASS_DEVICE,
 			   hdr->subclass_code | hdr->baseclass_code << 8);
-	dw_pcie_writeb_dbi(pci, PCI_CACHE_LINE_SIZE,
+	dw_pcie_writeb_dbi(pci, func_offset + PCI_CACHE_LINE_SIZE,
 			   hdr->cache_line_size);
-	dw_pcie_writew_dbi(pci, PCI_SUBSYSTEM_VENDOR_ID,
+	dw_pcie_writew_dbi(pci, func_offset + PCI_SUBSYSTEM_VENDOR_ID,
 			   hdr->subsys_vendor_id);
-	dw_pcie_writew_dbi(pci, PCI_SUBSYSTEM_ID, hdr->subsys_id);
-	dw_pcie_writeb_dbi(pci, PCI_INTERRUPT_PIN,
+	dw_pcie_writew_dbi(pci, func_offset + PCI_SUBSYSTEM_ID, hdr->subsys_id);
+	dw_pcie_writeb_dbi(pci, func_offset + PCI_INTERRUPT_PIN,
 			   hdr->interrupt_pin);
 	dw_pcie_dbi_ro_wr_dis(pci);
 
 	return 0;
 }
 
-static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, enum pci_barno bar,
-				  dma_addr_t cpu_addr,
+static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no,
+				  enum pci_barno bar, dma_addr_t cpu_addr,
 				  enum dw_pcie_as_type as_type)
 {
 	int ret;
@@ -112,7 +126,7 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, enum pci_barno bar,
 		return -EINVAL;
 	}
 
-	ret = dw_pcie_prog_inbound_atu(pci, free_win, bar, cpu_addr,
+	ret = dw_pcie_prog_inbound_atu(pci, func_no, free_win, bar, cpu_addr,
 				       as_type);
 	if (ret < 0) {
 		dev_err(pci->dev, "Failed to program IB window\n");
@@ -125,7 +139,8 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, enum pci_barno bar,
 	return 0;
 }
 
-static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep, phys_addr_t phys_addr,
+static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep, u8 func_no,
+				   phys_addr_t phys_addr,
 				   u64 pci_addr, size_t size)
 {
 	u32 free_win;
@@ -137,8 +152,8 @@ static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep, phys_addr_t phys_addr,
 		return -EINVAL;
 	}
 
-	dw_pcie_prog_outbound_atu(pci, free_win, PCIE_ATU_TYPE_MEM,
-				  phys_addr, pci_addr, size);
+	dw_pcie_prog_ep_outbound_atu(pci, func_no, free_win, PCIE_ATU_TYPE_MEM,
+				     phys_addr, pci_addr, size);
 
 	set_bit(free_win, ep->ob_window_map);
 	ep->outbound_addr[free_win] = phys_addr;
@@ -154,7 +169,7 @@ static void dw_pcie_ep_clear_bar(struct pci_epc *epc, u8 func_no,
 	enum pci_barno bar = epf_bar->barno;
 	u32 atu_index = ep->bar_to_atu[bar];
 
-	__dw_pcie_ep_reset_bar(pci, bar, epf_bar->flags);
+	__dw_pcie_ep_reset_bar(pci, func_no, bar, epf_bar->flags);
 
 	dw_pcie_disable_atu(pci, atu_index, DW_PCIE_REGION_INBOUND);
 	clear_bit(atu_index, ep->ib_window_map);
@@ -170,14 +185,21 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no,
 	size_t size = epf_bar->size;
 	int flags = epf_bar->flags;
 	enum dw_pcie_as_type as_type;
-	u32 reg = PCI_BASE_ADDRESS_0 + (4 * bar);
+	u32 reg;
+	unsigned int func_offset = 0;
+
+	if (ep->ops->func_conf_select)
+		func_offset = ep->ops->func_conf_select(ep, func_no);
+
+	reg = PCI_BASE_ADDRESS_0 + (4 * bar) + func_offset;
 
 	if (!(flags & PCI_BASE_ADDRESS_SPACE))
 		as_type = DW_PCIE_AS_MEM;
 	else
 		as_type = DW_PCIE_AS_IO;
 
-	ret = dw_pcie_ep_inbound_atu(ep, bar, epf_bar->phys_addr, as_type);
+	ret = dw_pcie_ep_inbound_atu(ep, func_no, bar,
+				     epf_bar->phys_addr, as_type);
 	if (ret)
 		return ret;
 
@@ -235,7 +257,7 @@ static int dw_pcie_ep_map_addr(struct pci_epc *epc, u8 func_no,
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 
-	ret = dw_pcie_ep_outbound_atu(ep, addr, pci_addr, size);
+	ret = dw_pcie_ep_outbound_atu(ep, func_no, addr, pci_addr, size);
 	if (ret) {
 		dev_err(pci->dev, "Failed to enable address\n");
 		return ret;
@@ -249,11 +271,15 @@ static int dw_pcie_ep_get_msi(struct pci_epc *epc, u8 func_no)
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	u32 val, reg;
+	unsigned int func_offset = 0;
+
+	if (ep->ops->func_conf_select)
+		func_offset = ep->ops->func_conf_select(ep, func_no);
 
 	if (!ep->msi_cap)
 		return -EINVAL;
 
-	reg = ep->msi_cap + PCI_MSI_FLAGS;
+	reg = ep->msi_cap + func_offset + PCI_MSI_FLAGS;
 	val = dw_pcie_readw_dbi(pci, reg);
 	if (!(val & PCI_MSI_FLAGS_ENABLE))
 		return -EINVAL;
@@ -268,11 +294,15 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 interrupts)
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	u32 val, reg;
+	unsigned int func_offset = 0;
+
+	if (ep->ops->func_conf_select)
+		func_offset = ep->ops->func_conf_select(ep, func_no);
 
 	if (!ep->msi_cap)
 		return -EINVAL;
 
-	reg = ep->msi_cap + PCI_MSI_FLAGS;
+	reg = ep->msi_cap + func_offset + PCI_MSI_FLAGS;
 	val = dw_pcie_readw_dbi(pci, reg);
 	val &= ~PCI_MSI_FLAGS_QMASK;
 	val |= (interrupts << 1) & PCI_MSI_FLAGS_QMASK;
@@ -288,11 +318,15 @@ static int dw_pcie_ep_get_msix(struct pci_epc *epc, u8 func_no)
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	u32 val, reg;
+	unsigned int func_offset = 0;
+
+	if (ep->ops->func_conf_select)
+		func_offset = ep->ops->func_conf_select(ep, func_no);
 
 	if (!ep->msix_cap)
 		return -EINVAL;
 
-	reg = ep->msix_cap + PCI_MSIX_FLAGS;
+	reg = ep->msix_cap + func_offset + PCI_MSIX_FLAGS;
 	val = dw_pcie_readw_dbi(pci, reg);
 	if (!(val & PCI_MSIX_FLAGS_ENABLE))
 		return -EINVAL;
@@ -307,11 +341,15 @@ static int dw_pcie_ep_set_msix(struct pci_epc *epc, u8 func_no, u16 interrupts)
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	u32 val, reg;
+	unsigned int func_offset = 0;
+
+	if (ep->ops->func_conf_select)
+		func_offset = ep->ops->func_conf_select(ep, func_no);
 
 	if (!ep->msix_cap)
 		return -EINVAL;
 
-	reg = ep->msix_cap + PCI_MSIX_FLAGS;
+	reg = ep->msix_cap + func_offset + PCI_MSIX_FLAGS;
 	val = dw_pcie_readw_dbi(pci, reg);
 	val &= ~PCI_MSIX_FLAGS_QSIZE;
 	val |= interrupts;
@@ -398,29 +436,33 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct pci_epc *epc = ep->epc;
 	unsigned int aligned_offset;
+	unsigned int func_offset = 0;
 	u16 msg_ctrl, msg_data;
 	u32 msg_addr_lower, msg_addr_upper, reg;
 	u64 msg_addr;
 	bool has_upper;
 	int ret;
 
+	if (ep->ops->func_conf_select)
+		func_offset = ep->ops->func_conf_select(ep, func_no);
+
 	if (!ep->msi_cap)
 		return -EINVAL;
 
 	/* Raise MSI per the PCI Local Bus Specification Revision 3.0, 6.8.1. */
-	reg = ep->msi_cap + PCI_MSI_FLAGS;
+	reg = ep->msi_cap + func_offset + PCI_MSI_FLAGS;
 	msg_ctrl = dw_pcie_readw_dbi(pci, reg);
 	has_upper = !!(msg_ctrl & PCI_MSI_FLAGS_64BIT);
-	reg = ep->msi_cap + PCI_MSI_ADDRESS_LO;
+	reg = ep->msi_cap + func_offset + PCI_MSI_ADDRESS_LO;
 	msg_addr_lower = dw_pcie_readl_dbi(pci, reg);
 	if (has_upper) {
-		reg = ep->msi_cap + PCI_MSI_ADDRESS_HI;
+		reg = ep->msi_cap + func_offset + PCI_MSI_ADDRESS_HI;
 		msg_addr_upper = dw_pcie_readl_dbi(pci, reg);
-		reg = ep->msi_cap + PCI_MSI_DATA_64;
+		reg = ep->msi_cap + func_offset + PCI_MSI_DATA_64;
 		msg_data = dw_pcie_readw_dbi(pci, reg);
 	} else {
 		msg_addr_upper = 0;
-		reg = ep->msi_cap + PCI_MSI_DATA_32;
+		reg = ep->msi_cap + func_offset + PCI_MSI_DATA_32;
 		msg_data = dw_pcie_readw_dbi(pci, reg);
 	}
 	aligned_offset = msg_addr_lower & (epc->mem->page_size - 1);
@@ -439,11 +481,12 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
-			     u16 interrupt_num)
+			      u16 interrupt_num)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct pci_epc *epc = ep->epc;
 	u16 tbl_offset, bir;
+	unsigned int func_offset = 0;
 	u32 bar_addr_upper, bar_addr_lower;
 	u32 msg_addr_upper, msg_addr_lower;
 	u32 reg, msg_data, vec_ctrl;
@@ -451,12 +494,15 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	void __iomem *msix_tbl;
 	int ret;
 
-	reg = ep->msix_cap + PCI_MSIX_TABLE;
+	if (ep->ops->func_conf_select)
+		func_offset = ep->ops->func_conf_select(ep, func_no);
+
+	reg = ep->msix_cap + func_offset + PCI_MSIX_TABLE;
 	tbl_offset = dw_pcie_readl_dbi(pci, reg);
 	bir = (tbl_offset & PCI_MSIX_TABLE_BIR);
 	tbl_offset &= PCI_MSIX_TABLE_OFFSET;
 
-	reg = PCI_BASE_ADDRESS_0 + (4 * bir);
+	reg = PCI_BASE_ADDRESS_0 + func_offset + (4 * bir);
 	bar_addr_upper = 0;
 	bar_addr_lower = dw_pcie_readl_dbi(pci, reg);
 	reg_u64 = (bar_addr_lower & PCI_BASE_ADDRESS_MEM_TYPE_MASK);
@@ -592,13 +638,13 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	ep->epc = epc;
 	epc_set_drvdata(epc, ep);
 
-	if (ep->ops->ep_init)
-		ep->ops->ep_init(ep);
-
 	ret = of_property_read_u8(np, "max-functions", &epc->max_functions);
 	if (ret < 0)
 		epc->max_functions = 1;
 
+	if (ep->ops->ep_init)
+		ep->ops->ep_init(ep);
+
 	ret = __pci_epc_mem_init(epc, ep->phys_base, ep->addr_size,
 				 ep->page_size);
 	if (ret < 0) {
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 7d25102..305e73d 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -158,9 +158,10 @@ static void dw_pcie_writel_ob_unroll(struct dw_pcie *pci, u32 index, u32 reg,
 	dw_pcie_writel_atu(pci, offset + reg, val);
 }
 
-static void dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, int index,
-					     int type, u64 cpu_addr,
-					     u64 pci_addr, u32 size)
+static void dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, u8 func_no,
+					     int index, int type,
+					     u64 cpu_addr, u64 pci_addr,
+					     u32 size)
 {
 	u32 retries, val;
 
@@ -175,7 +176,7 @@ static void dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, int index,
 	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_TARGET,
 				 upper_32_bits(pci_addr));
 	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1,
-				 type);
+				 type | PCIE_ATU_FUNC_NUM(func_no));
 	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
 				 PCIE_ATU_ENABLE);
 
@@ -194,8 +195,9 @@ static void dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, int index,
 	dev_err(pci->dev, "Outbound iATU is not being enabled\n");
 }
 
-void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index, int type,
-			       u64 cpu_addr, u64 pci_addr, u32 size)
+static void __dw_pcie_prog_outbound_atu(struct dw_pcie *pci, u8 func_no,
+					int index, int type, u64 cpu_addr,
+					u64 pci_addr, u32 size)
 {
 	u32 retries, val;
 
@@ -203,8 +205,8 @@ void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index, int type,
 		cpu_addr = pci->ops->cpu_addr_fixup(pci, cpu_addr);
 
 	if (pci->iatu_unroll_enabled) {
-		dw_pcie_prog_outbound_atu_unroll(pci, index, type, cpu_addr,
-						 pci_addr, size);
+		dw_pcie_prog_outbound_atu_unroll(pci, func_no, index, type,
+						 cpu_addr, pci_addr, size);
 		return;
 	}
 
@@ -220,7 +222,8 @@ void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index, int type,
 			   lower_32_bits(pci_addr));
 	dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_TARGET,
 			   upper_32_bits(pci_addr));
-	dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, type);
+	dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, type |
+			   PCIE_ATU_FUNC_NUM(func_no));
 	dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE);
 
 	/*
@@ -237,6 +240,21 @@ void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index, int type,
 	dev_err(pci->dev, "Outbound iATU is not being enabled\n");
 }
 
+void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index, int type,
+			       u64 cpu_addr, u64 pci_addr, u32 size)
+{
+	__dw_pcie_prog_outbound_atu(pci, 0, index, type,
+				    cpu_addr, pci_addr, size);
+}
+
+void dw_pcie_prog_ep_outbound_atu(struct dw_pcie *pci, u8 func_no, int index,
+				  int type, u64 cpu_addr, u64 pci_addr,
+				  u32 size)
+{
+	__dw_pcie_prog_outbound_atu(pci, func_no, index, type,
+				    cpu_addr, pci_addr, size);
+}
+
 static u32 dw_pcie_readl_ib_unroll(struct dw_pcie *pci, u32 index, u32 reg)
 {
 	u32 offset = PCIE_GET_ATU_INB_UNR_REG_OFFSET(index);
@@ -252,8 +270,8 @@ static void dw_pcie_writel_ib_unroll(struct dw_pcie *pci, u32 index, u32 reg,
 	dw_pcie_writel_atu(pci, offset + reg, val);
 }
 
-static int dw_pcie_prog_inbound_atu_unroll(struct dw_pcie *pci, int index,
-					   int bar, u64 cpu_addr,
+static int dw_pcie_prog_inbound_atu_unroll(struct dw_pcie *pci, u8 func_no,
+					   int index, int bar, u64 cpu_addr,
 					   enum dw_pcie_as_type as_type)
 {
 	int type;
@@ -275,8 +293,10 @@ static int dw_pcie_prog_inbound_atu_unroll(struct dw_pcie *pci, int index,
 		return -EINVAL;
 	}
 
-	dw_pcie_writel_ib_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1, type);
+	dw_pcie_writel_ib_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1, type |
+				 PCIE_ATU_FUNC_NUM(func_no));
 	dw_pcie_writel_ib_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
+				 PCIE_ATU_FUNC_NUM_MATCH_EN |
 				 PCIE_ATU_ENABLE |
 				 PCIE_ATU_BAR_MODE_ENABLE | (bar << 8));
 
@@ -297,14 +317,15 @@ static int dw_pcie_prog_inbound_atu_unroll(struct dw_pcie *pci, int index,
 	return -EBUSY;
 }
 
-int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, int index, int bar,
-			     u64 cpu_addr, enum dw_pcie_as_type as_type)
+int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, u8 func_no, int index,
+			     int bar, u64 cpu_addr,
+			     enum dw_pcie_as_type as_type)
 {
 	int type;
 	u32 retries, val;
 
 	if (pci->iatu_unroll_enabled)
-		return dw_pcie_prog_inbound_atu_unroll(pci, index, bar,
+		return dw_pcie_prog_inbound_atu_unroll(pci, func_no, index, bar,
 						       cpu_addr, as_type);
 
 	dw_pcie_writel_dbi(pci, PCIE_ATU_VIEWPORT, PCIE_ATU_REGION_INBOUND |
@@ -323,9 +344,11 @@ int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, int index, int bar,
 		return -EINVAL;
 	}
 
-	dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, type);
-	dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE
-			   | PCIE_ATU_BAR_MODE_ENABLE | (bar << 8));
+	dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, type |
+			   PCIE_ATU_FUNC_NUM(func_no));
+	dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE |
+			   PCIE_ATU_FUNC_NUM_MATCH_EN |
+			   PCIE_ATU_BAR_MODE_ENABLE | (bar << 8));
 
 	/*
 	 * Make sure ATU enable takes effect before any subsequent config
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index ffed084..a0fdbf7 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -71,9 +71,11 @@
 #define PCIE_ATU_TYPE_IO		0x2
 #define PCIE_ATU_TYPE_CFG0		0x4
 #define PCIE_ATU_TYPE_CFG1		0x5
+#define PCIE_ATU_FUNC_NUM(pf)           (pf << 20)
 #define PCIE_ATU_CR2			0x908
 #define PCIE_ATU_ENABLE			BIT(31)
 #define PCIE_ATU_BAR_MODE_ENABLE	BIT(30)
+#define PCIE_ATU_FUNC_NUM_MATCH_EN      BIT(19)
 #define PCIE_ATU_LOWER_BASE		0x90C
 #define PCIE_ATU_UPPER_BASE		0x910
 #define PCIE_ATU_LIMIT			0x914
@@ -197,6 +199,7 @@ struct dw_pcie_ep_ops {
 	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
 			     enum pci_epc_irq_type type, u16 interrupt_num);
 	const struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
+	unsigned int (*func_conf_select)(struct dw_pcie_ep *ep, u8 func_no);
 };
 
 struct dw_pcie_ep {
@@ -265,8 +268,12 @@ int dw_pcie_wait_for_link(struct dw_pcie *pci);
 void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index,
 			       int type, u64 cpu_addr, u64 pci_addr,
 			       u32 size);
-int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, int index, int bar,
-			     u64 cpu_addr, enum dw_pcie_as_type as_type);
+void dw_pcie_prog_ep_outbound_atu(struct dw_pcie *pci, u8 func_no, int index,
+				  int type, u64 cpu_addr, u64 pci_addr,
+				  u32 size);
+int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, u8 func_no, int index,
+			     int bar, u64 cpu_addr,
+			     enum dw_pcie_as_type as_type);
 void dw_pcie_disable_atu(struct dw_pcie *pci, int index,
 			 enum dw_pcie_region_type type);
 void dw_pcie_setup(struct dw_pcie *pci);
-- 
2.9.5

