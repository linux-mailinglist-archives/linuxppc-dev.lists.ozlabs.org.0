Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 661E3241978
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 12:13:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQpZJ454wzDqW5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 20:13:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=zhiqiang.hou@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQpKJ1vmXzDqRZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Aug 2020 20:02:12 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 69E42201EF8;
 Tue, 11 Aug 2020 12:02:09 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B8469201EF3;
 Tue, 11 Aug 2020 12:02:01 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id CFB5040327;
 Tue, 11 Aug 2020 12:01:50 +0200 (CEST)
From: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, robh+dt@kernel.org, bhelgaas@google.com,
 lorenzo.pieralisi@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com,
 kishon@ti.com, gustavo.pimentel@synopsys.com, roy.zang@nxp.com,
 jingoohan1@gmail.com, andrew.murray@arm.com
Subject: [PATCHv7 04/12] PCI: designware-ep: Modify MSI and MSIX CAP way of
 finding
Date: Tue, 11 Aug 2020 17:54:33 +0800
Message-Id: <20200811095441.7636-5-Zhiqiang.Hou@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811095441.7636-1-Zhiqiang.Hou@nxp.com>
References: <20200811095441.7636-1-Zhiqiang.Hou@nxp.com>
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
Cc: minghuan.Lian@nxp.com, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Xiaowei Bao <xiaowei.bao@nxp.com>, mingkai.hu@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Xiaowei Bao <xiaowei.bao@nxp.com>

Each PF of EP device should have its own MSI or MSIX capabitily
struct, so create a dw_pcie_ep_func struct and move the msi_cap
and msix_cap to this struct from dw_pcie_ep, and manage the PFs
via a list.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
V7:
 - Rebase the patch without functionality change.

 .../pci/controller/dwc/pcie-designware-ep.c   | 139 +++++++++++++++---
 drivers/pci/controller/dwc/pcie-designware.h  |  18 ++-
 2 files changed, 136 insertions(+), 21 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 56bd1cd71f16..4680a51c49c0 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -28,6 +28,19 @@ void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_init_notify);
 
+struct dw_pcie_ep_func *
+dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no)
+{
+	struct dw_pcie_ep_func *ep_func;
+
+	list_for_each_entry(ep_func, &ep->func_list, list) {
+		if (ep_func->func_no == func_no)
+			return ep_func;
+	}
+
+	return NULL;
+}
+
 static unsigned int dw_pcie_ep_func_select(struct dw_pcie_ep *ep, u8 func_no)
 {
 	unsigned int func_offset = 0;
@@ -68,6 +81,47 @@ void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
 		__dw_pcie_ep_reset_bar(pci, func_no, bar, 0);
 }
 
+static u8 __dw_pcie_ep_find_next_cap(struct dw_pcie_ep *ep, u8 func_no,
+		u8 cap_ptr, u8 cap)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	unsigned int func_offset = 0;
+	u8 cap_id, next_cap_ptr;
+	u16 reg;
+
+	if (!cap_ptr)
+		return 0;
+
+	func_offset = dw_pcie_ep_func_select(ep, func_no);
+
+	reg = dw_pcie_readw_dbi(pci, func_offset + cap_ptr);
+	cap_id = (reg & 0x00ff);
+
+	if (cap_id > PCI_CAP_ID_MAX)
+		return 0;
+
+	if (cap_id == cap)
+		return cap_ptr;
+
+	next_cap_ptr = (reg & 0xff00) >> 8;
+	return __dw_pcie_ep_find_next_cap(ep, func_no, next_cap_ptr, cap);
+}
+
+static u8 dw_pcie_ep_find_capability(struct dw_pcie_ep *ep, u8 func_no, u8 cap)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	unsigned int func_offset = 0;
+	u8 next_cap_ptr;
+	u16 reg;
+
+	func_offset = dw_pcie_ep_func_select(ep, func_no);
+
+	reg = dw_pcie_readw_dbi(pci, func_offset + PCI_CAPABILITY_LIST);
+	next_cap_ptr = (reg & 0x00ff);
+
+	return __dw_pcie_ep_find_next_cap(ep, func_no, next_cap_ptr, cap);
+}
+
 static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no,
 				   struct pci_epf_header *hdr)
 {
@@ -257,13 +311,18 @@ static int dw_pcie_ep_get_msi(struct pci_epc *epc, u8 func_no)
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	u32 val, reg;
 	unsigned int func_offset = 0;
+	struct dw_pcie_ep_func *ep_func;
 
-	if (!ep->msi_cap)
+	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
+	if (!ep_func)
+		return -EINVAL;
+
+	if (!ep_func->msi_cap)
 		return -EINVAL;
 
 	func_offset = dw_pcie_ep_func_select(ep, func_no);
 
-	reg = ep->msi_cap + func_offset + PCI_MSI_FLAGS;
+	reg = ep_func->msi_cap + func_offset + PCI_MSI_FLAGS;
 	val = dw_pcie_readw_dbi(pci, reg);
 	if (!(val & PCI_MSI_FLAGS_ENABLE))
 		return -EINVAL;
@@ -279,13 +338,18 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 interrupts)
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	u32 val, reg;
 	unsigned int func_offset = 0;
+	struct dw_pcie_ep_func *ep_func;
+
+	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
+	if (!ep_func)
+		return -EINVAL;
 
-	if (!ep->msi_cap)
+	if (!ep_func->msi_cap)
 		return -EINVAL;
 
 	func_offset = dw_pcie_ep_func_select(ep, func_no);
 
-	reg = ep->msi_cap + func_offset + PCI_MSI_FLAGS;
+	reg = ep_func->msi_cap + func_offset + PCI_MSI_FLAGS;
 	val = dw_pcie_readw_dbi(pci, reg);
 	val &= ~PCI_MSI_FLAGS_QMASK;
 	val |= (interrupts << 1) & PCI_MSI_FLAGS_QMASK;
@@ -302,13 +366,18 @@ static int dw_pcie_ep_get_msix(struct pci_epc *epc, u8 func_no)
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	u32 val, reg;
 	unsigned int func_offset = 0;
+	struct dw_pcie_ep_func *ep_func;
+
+	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
+	if (!ep_func)
+		return -EINVAL;
 
-	if (!ep->msix_cap)
+	if (!ep_func->msix_cap)
 		return -EINVAL;
 
 	func_offset = dw_pcie_ep_func_select(ep, func_no);
 
-	reg = ep->msix_cap + func_offset + PCI_MSIX_FLAGS;
+	reg = ep_func->msix_cap + func_offset + PCI_MSIX_FLAGS;
 	val = dw_pcie_readw_dbi(pci, reg);
 	if (!(val & PCI_MSIX_FLAGS_ENABLE))
 		return -EINVAL;
@@ -325,25 +394,30 @@ static int dw_pcie_ep_set_msix(struct pci_epc *epc, u8 func_no, u16 interrupts,
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	u32 val, reg;
 	unsigned int func_offset = 0;
+	struct dw_pcie_ep_func *ep_func;
 
-	if (!ep->msix_cap)
+	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
+	if (!ep_func)
+		return -EINVAL;
+
+	if (!ep_func->msix_cap)
 		return -EINVAL;
 
 	dw_pcie_dbi_ro_wr_en(pci);
 
 	func_offset = dw_pcie_ep_func_select(ep, func_no);
 
-	reg = ep->msix_cap + func_offset + PCI_MSIX_FLAGS;
+	reg = ep_func->msix_cap + func_offset + PCI_MSIX_FLAGS;
 	val = dw_pcie_readw_dbi(pci, reg);
 	val &= ~PCI_MSIX_FLAGS_QSIZE;
 	val |= interrupts;
 	dw_pcie_writew_dbi(pci, reg, val);
 
-	reg = ep->msix_cap + func_offset + PCI_MSIX_TABLE;
+	reg = ep_func->msix_cap + func_offset + PCI_MSIX_TABLE;
 	val = offset | bir;
 	dw_pcie_writel_dbi(pci, reg, val);
 
-	reg = ep->msix_cap + func_offset + PCI_MSIX_PBA;
+	reg = ep_func->msix_cap + func_offset + PCI_MSIX_PBA;
 	val = (offset + (interrupts * PCI_MSIX_ENTRY_SIZE)) | bir;
 	dw_pcie_writel_dbi(pci, reg, val);
 
@@ -426,6 +500,7 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 			     u8 interrupt_num)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	struct dw_pcie_ep_func *ep_func;
 	struct pci_epc *epc = ep->epc;
 	unsigned int aligned_offset;
 	unsigned int func_offset = 0;
@@ -435,25 +510,29 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 	bool has_upper;
 	int ret;
 
-	if (!ep->msi_cap)
+	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
+	if (!ep_func)
+		return -EINVAL;
+
+	if (!ep_func->msi_cap)
 		return -EINVAL;
 
 	func_offset = dw_pcie_ep_func_select(ep, func_no);
 
 	/* Raise MSI per the PCI Local Bus Specification Revision 3.0, 6.8.1. */
-	reg = ep->msi_cap + func_offset + PCI_MSI_FLAGS;
+	reg = ep_func->msi_cap + func_offset + PCI_MSI_FLAGS;
 	msg_ctrl = dw_pcie_readw_dbi(pci, reg);
 	has_upper = !!(msg_ctrl & PCI_MSI_FLAGS_64BIT);
-	reg = ep->msi_cap + func_offset + PCI_MSI_ADDRESS_LO;
+	reg = ep_func->msi_cap + func_offset + PCI_MSI_ADDRESS_LO;
 	msg_addr_lower = dw_pcie_readl_dbi(pci, reg);
 	if (has_upper) {
-		reg = ep->msi_cap + func_offset + PCI_MSI_ADDRESS_HI;
+		reg = ep_func->msi_cap + func_offset + PCI_MSI_ADDRESS_HI;
 		msg_addr_upper = dw_pcie_readl_dbi(pci, reg);
-		reg = ep->msi_cap + func_offset + PCI_MSI_DATA_64;
+		reg = ep_func->msi_cap + func_offset + PCI_MSI_DATA_64;
 		msg_data = dw_pcie_readw_dbi(pci, reg);
 	} else {
 		msg_addr_upper = 0;
-		reg = ep->msi_cap + func_offset + PCI_MSI_DATA_32;
+		reg = ep_func->msi_cap + func_offset + PCI_MSI_DATA_32;
 		msg_data = dw_pcie_readw_dbi(pci, reg);
 	}
 	aligned_offset = msg_addr_lower & (epc->mem->window.page_size - 1);
@@ -489,6 +568,7 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 			      u16 interrupt_num)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	struct dw_pcie_ep_func *ep_func;
 	struct pci_epf_msix_tbl *msix_tbl;
 	struct pci_epc *epc = ep->epc;
 	unsigned int func_offset = 0;
@@ -499,9 +579,16 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	int ret;
 	u8 bir;
 
+	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
+	if (!ep_func)
+		return -EINVAL;
+
+	if (!ep_func->msix_cap)
+		return -EINVAL;
+
 	func_offset = dw_pcie_ep_func_select(ep, func_no);
 
-	reg = ep->msix_cap + func_offset + PCI_MSIX_TABLE;
+	reg = ep_func->msix_cap + func_offset + PCI_MSIX_TABLE;
 	tbl_offset = dw_pcie_readl_dbi(pci, reg);
 	bir = (tbl_offset & PCI_MSIX_TABLE_BIR);
 	tbl_offset &= PCI_MSIX_TABLE_OFFSET;
@@ -596,11 +683,15 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	int ret;
 	void *addr;
+	u8 func_no;
 	struct pci_epc *epc;
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct device *dev = pci->dev;
 	struct device_node *np = dev->of_node;
 	const struct pci_epc_features *epc_features;
+	struct dw_pcie_ep_func *ep_func;
+
+	INIT_LIST_HEAD(&ep->func_list);
 
 	if (!pci->dbi_base || !pci->dbi_base2) {
 		dev_err(dev, "dbi_base/dbi_base2 is not populated\n");
@@ -660,9 +751,19 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	if (ret < 0)
 		epc->max_functions = 1;
 
-	ep->msi_cap = dw_pcie_find_capability(pci, PCI_CAP_ID_MSI);
+	for (func_no = 0; func_no < epc->max_functions; func_no++) {
+		ep_func = devm_kzalloc(dev, sizeof(*ep_func), GFP_KERNEL);
+		if (!ep_func)
+			return -ENOMEM;
 
-	ep->msix_cap = dw_pcie_find_capability(pci, PCI_CAP_ID_MSIX);
+		ep_func->func_no = func_no;
+		ep_func->msi_cap = dw_pcie_ep_find_capability(ep, func_no,
+							      PCI_CAP_ID_MSI);
+		ep_func->msix_cap = dw_pcie_ep_find_capability(ep, func_no,
+							       PCI_CAP_ID_MSIX);
+
+		list_add_tail(&ep_func->list, &ep->func_list);
+	}
 
 	if (ep->ops->ep_init)
 		ep->ops->ep_init(ep);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 745b4938225a..19c4ba486239 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -230,8 +230,16 @@ struct dw_pcie_ep_ops {
 	unsigned int (*func_conf_select)(struct dw_pcie_ep *ep, u8 func_no);
 };
 
+struct dw_pcie_ep_func {
+	struct list_head	list;
+	u8			func_no;
+	u8			msi_cap;	/* MSI capability offset */
+	u8			msix_cap;	/* MSI-X capability offset */
+};
+
 struct dw_pcie_ep {
 	struct pci_epc		*epc;
+	struct list_head	func_list;
 	const struct dw_pcie_ep_ops *ops;
 	phys_addr_t		phys_base;
 	size_t			addr_size;
@@ -244,8 +252,6 @@ struct dw_pcie_ep {
 	u32			num_ob_windows;
 	void __iomem		*msi_mem;
 	phys_addr_t		msi_mem_phys;
-	u8			msi_cap;	/* MSI capability offset */
-	u8			msix_cap;	/* MSI-X capability offset */
 	struct pci_epf_bar	*epf_bar[PCI_STD_NUM_BARS];
 };
 
@@ -440,6 +446,8 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep, u8 func_no,
 				       u16 interrupt_num);
 void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar);
+struct dw_pcie_ep_func *
+dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no);
 #else
 static inline void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
 {
@@ -490,5 +498,11 @@ static inline int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep,
 static inline void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
 {
 }
+
+static inline struct dw_pcie_ep_func *
+dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no)
+{
+	return NULL;
+}
 #endif
 #endif /* _PCIE_DESIGNWARE_H */
-- 
2.17.1

