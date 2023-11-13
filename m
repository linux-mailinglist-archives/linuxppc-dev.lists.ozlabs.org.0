Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EC97E942E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 02:40:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STBv270mFz3vg7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 12:39:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=renesas.com (client-ip=210.160.252.171; helo=relmlie5.idc.renesas.com; envelope-from=yoshihiro.shimoda.uh@renesas.com; receiver=lists.ozlabs.org)
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STBs06nbYz3c8c
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 12:38:12 +1100 (AEDT)
X-IronPort-AV: E=Sophos;i="6.03,298,1694703600"; 
   d="scan'208";a="182642338"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Nov 2023 10:33:03 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E2ED5400A64F;
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
Subject: [PATCH 3/3] PCI: dwc: Add dw_pcie_ep_{read,write}_dbi[2] helpers
Date: Mon, 13 Nov 2023 10:33:00 +0900
Message-Id: <20231113013300.2132152-4-yoshihiro.shimoda.uh@renesas.com>
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

The current code calculated some dbi[2] registers' offset by calling
dw_pcie_ep_get_dbi[2]_offset() in each function. To improve code
readability, add dw_pcie_ep_{read,write}_dbi[2} and some data-width
related helpers.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../pci/controller/dwc/pcie-designware-ep.c   | 230 ++++++++++--------
 1 file changed, 129 insertions(+), 101 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 1100671db887..dcbed49c9613 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -65,24 +65,89 @@ static unsigned int dw_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep, u8 func_no
 	return dbi2_offset;
 }
 
+static u32 dw_pcie_ep_read_dbi(struct dw_pcie_ep *ep, u8 func_no, u32 reg,
+			       size_t size)
+{
+	unsigned int offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+
+	return dw_pcie_read_dbi(pci, offset + reg, size);
+}
+
+static void dw_pcie_ep_write_dbi(struct dw_pcie_ep *ep, u8 func_no, u32 reg,
+				 size_t size, u32 val)
+{
+	unsigned int offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+
+	dw_pcie_write_dbi(pci, offset + reg, size, val);
+}
+
+static void dw_pcie_ep_write_dbi2(struct dw_pcie_ep *ep, u8 func_no, u32 reg,
+				  size_t size, u32 val)
+{
+	unsigned int offset = dw_pcie_ep_get_dbi2_offset(ep, func_no);
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+
+	dw_pcie_write_dbi2(pci, offset + reg, size, val);
+}
+
+static inline void dw_pcie_ep_writel_dbi(struct dw_pcie_ep *ep, u8 func_no,
+					 u32 reg, u32 val)
+{
+	dw_pcie_ep_write_dbi(ep, func_no, reg, 0x4, val);
+}
+
+static inline u32 dw_pcie_ep_readl_dbi(struct dw_pcie_ep *ep, u8 func_no,
+				       u32 reg)
+{
+	return dw_pcie_ep_read_dbi(ep, func_no, reg, 0x4);
+}
+
+static inline void dw_pcie_ep_writew_dbi(struct dw_pcie_ep *ep, u8 func_no,
+					 u32 reg, u16 val)
+{
+	dw_pcie_ep_write_dbi(ep, func_no, reg, 0x2, val);
+}
+
+static inline u16 dw_pcie_ep_readw_dbi(struct dw_pcie_ep *ep, u8 func_no,
+				       u32 reg)
+{
+	return dw_pcie_ep_read_dbi(ep, func_no, reg, 0x2);
+}
+
+static inline void dw_pcie_ep_writeb_dbi(struct dw_pcie_ep *ep, u8 func_no,
+					 u32 reg, u8 val)
+{
+	dw_pcie_ep_write_dbi(ep, func_no, reg, 0x1, val);
+}
+
+static inline u8 dw_pcie_ep_readb_dbi(struct dw_pcie_ep *ep, u8 func_no,
+				      u32 reg)
+{
+	return dw_pcie_ep_read_dbi(ep, func_no, reg, 0x1);
+}
+
+static inline void dw_pcie_ep_writel_dbi2(struct dw_pcie_ep *ep, u8 func_no,
+					  u32 reg, u32 val)
+{
+	dw_pcie_ep_write_dbi2(ep, func_no, reg, 0x4, val);
+}
+
 static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, u8 func_no,
 				   enum pci_barno bar, int flags)
 {
-	unsigned int dbi_offset, dbi2_offset;
 	struct dw_pcie_ep *ep = &pci->ep;
 	u32 reg, reg_dbi2;
 
-	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
-	dbi2_offset = dw_pcie_ep_get_dbi2_offset(ep, func_no);
-
-	reg = dbi_offset + PCI_BASE_ADDRESS_0 + (4 * bar);
-	reg_dbi2 = dbi2_offset + PCI_BASE_ADDRESS_0 + (4 * bar);
+	reg = PCI_BASE_ADDRESS_0 + (4 * bar);
+	reg_dbi2 = PCI_BASE_ADDRESS_0 + (4 * bar);
 	dw_pcie_dbi_ro_wr_en(pci);
-	dw_pcie_writel_dbi2(pci, reg_dbi2, 0x0);
-	dw_pcie_writel_dbi(pci, reg, 0x0);
+	dw_pcie_ep_writel_dbi2(ep, func_no, reg_dbi2, 0x0);
+	dw_pcie_ep_writel_dbi(ep, func_no, reg, 0x0);
 	if (flags & PCI_BASE_ADDRESS_MEM_TYPE_64) {
-		dw_pcie_writel_dbi2(pci, reg_dbi2 + 4, 0x0);
-		dw_pcie_writel_dbi(pci, reg + 4, 0x0);
+		dw_pcie_ep_writel_dbi2(ep, func_no, reg_dbi2 + 4, 0x0);
+		dw_pcie_ep_writel_dbi(ep, func_no, reg + 4, 0x0);
 	}
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
@@ -99,19 +164,15 @@ void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
 EXPORT_SYMBOL_GPL(dw_pcie_ep_reset_bar);
 
 static u8 __dw_pcie_ep_find_next_cap(struct dw_pcie_ep *ep, u8 func_no,
-		u8 cap_ptr, u8 cap)
+				     u8 cap_ptr, u8 cap)
 {
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	unsigned int dbi_offset = 0;
 	u8 cap_id, next_cap_ptr;
 	u16 reg;
 
 	if (!cap_ptr)
 		return 0;
 
-	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
-
-	reg = dw_pcie_readw_dbi(pci, dbi_offset + cap_ptr);
+	reg = dw_pcie_ep_readw_dbi(ep, func_no, cap_ptr);
 	cap_id = (reg & 0x00ff);
 
 	if (cap_id > PCI_CAP_ID_MAX)
@@ -126,14 +187,10 @@ static u8 __dw_pcie_ep_find_next_cap(struct dw_pcie_ep *ep, u8 func_no,
 
 static u8 dw_pcie_ep_find_capability(struct dw_pcie_ep *ep, u8 func_no, u8 cap)
 {
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	unsigned int dbi_offset = 0;
 	u8 next_cap_ptr;
 	u16 reg;
 
-	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
-
-	reg = dw_pcie_readw_dbi(pci, dbi_offset + PCI_CAPABILITY_LIST);
+	reg = dw_pcie_ep_readw_dbi(ep, func_no, PCI_CAPABILITY_LIST);
 	next_cap_ptr = (reg & 0x00ff);
 
 	return __dw_pcie_ep_find_next_cap(ep, func_no, next_cap_ptr, cap);
@@ -144,24 +201,21 @@ static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 {
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	unsigned int dbi_offset = 0;
-
-	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
 
 	dw_pcie_dbi_ro_wr_en(pci);
-	dw_pcie_writew_dbi(pci, dbi_offset + PCI_VENDOR_ID, hdr->vendorid);
-	dw_pcie_writew_dbi(pci, dbi_offset + PCI_DEVICE_ID, hdr->deviceid);
-	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_REVISION_ID, hdr->revid);
-	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_CLASS_PROG, hdr->progif_code);
-	dw_pcie_writew_dbi(pci, dbi_offset + PCI_CLASS_DEVICE,
-			   hdr->subclass_code | hdr->baseclass_code << 8);
-	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_CACHE_LINE_SIZE,
-			   hdr->cache_line_size);
-	dw_pcie_writew_dbi(pci, dbi_offset + PCI_SUBSYSTEM_VENDOR_ID,
-			   hdr->subsys_vendor_id);
-	dw_pcie_writew_dbi(pci, dbi_offset + PCI_SUBSYSTEM_ID, hdr->subsys_id);
-	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_INTERRUPT_PIN,
-			   hdr->interrupt_pin);
+	dw_pcie_ep_writew_dbi(ep, func_no, PCI_VENDOR_ID, hdr->vendorid);
+	dw_pcie_ep_writew_dbi(ep, func_no, PCI_DEVICE_ID, hdr->deviceid);
+	dw_pcie_ep_writeb_dbi(ep, func_no, PCI_REVISION_ID, hdr->revid);
+	dw_pcie_ep_writeb_dbi(ep, func_no, PCI_CLASS_PROG, hdr->progif_code);
+	dw_pcie_ep_writew_dbi(ep, func_no, PCI_CLASS_DEVICE,
+			      hdr->subclass_code | hdr->baseclass_code << 8);
+	dw_pcie_ep_writeb_dbi(ep, func_no, PCI_CACHE_LINE_SIZE,
+			      hdr->cache_line_size);
+	dw_pcie_ep_writew_dbi(ep, func_no, PCI_SUBSYSTEM_VENDOR_ID,
+			      hdr->subsys_vendor_id);
+	dw_pcie_ep_writew_dbi(ep, func_no, PCI_SUBSYSTEM_ID, hdr->subsys_id);
+	dw_pcie_ep_writeb_dbi(ep, func_no, PCI_INTERRUPT_PIN,
+			      hdr->interrupt_pin);
 	dw_pcie_dbi_ro_wr_dis(pci);
 
 	return 0;
@@ -243,18 +297,13 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 {
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	unsigned int dbi_offset, dbi2_offset;
 	enum pci_barno bar = epf_bar->barno;
 	size_t size = epf_bar->size;
 	int flags = epf_bar->flags;
-	u32 reg, reg_dbi2;
 	int ret, type;
+	u32 reg;
 
-	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
-	dbi2_offset = dw_pcie_ep_get_dbi2_offset(ep, func_no);
-
-	reg = PCI_BASE_ADDRESS_0 + (4 * bar) + dbi_offset;
-	reg_dbi2 = PCI_BASE_ADDRESS_0 + (4 * bar) + dbi2_offset;
+	reg = PCI_BASE_ADDRESS_0 + (4 * bar);
 
 	if (!(flags & PCI_BASE_ADDRESS_SPACE))
 		type = PCIE_ATU_TYPE_MEM;
@@ -270,12 +319,12 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 
 	dw_pcie_dbi_ro_wr_en(pci);
 
-	dw_pcie_writel_dbi2(pci, reg_dbi2, lower_32_bits(size - 1));
-	dw_pcie_writel_dbi(pci, reg, flags);
+	dw_pcie_ep_writel_dbi2(ep, func_no, reg, lower_32_bits(size - 1));
+	dw_pcie_ep_writel_dbi(ep, func_no, reg, flags);
 
 	if (flags & PCI_BASE_ADDRESS_MEM_TYPE_64) {
-		dw_pcie_writel_dbi2(pci, reg_dbi2 + 4, upper_32_bits(size - 1));
-		dw_pcie_writel_dbi(pci, reg + 4, 0);
+		dw_pcie_ep_writel_dbi2(ep, func_no, reg + 4, upper_32_bits(size - 1));
+		dw_pcie_ep_writel_dbi(ep, func_no, reg + 4, 0);
 	}
 
 	ep->epf_bar[bar] = epf_bar;
@@ -335,19 +384,15 @@ static int dw_pcie_ep_map_addr(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 static int dw_pcie_ep_get_msi(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
 {
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	u32 val, reg;
-	unsigned int dbi_offset = 0;
 	struct dw_pcie_ep_func *ep_func;
+	u32 val, reg;
 
 	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
 	if (!ep_func || !ep_func->msi_cap)
 		return -EINVAL;
 
-	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
-
-	reg = ep_func->msi_cap + dbi_offset + PCI_MSI_FLAGS;
-	val = dw_pcie_readw_dbi(pci, reg);
+	reg = ep_func->msi_cap + PCI_MSI_FLAGS;
+	val = dw_pcie_ep_readw_dbi(ep, func_no, reg);
 	if (!(val & PCI_MSI_FLAGS_ENABLE))
 		return -EINVAL;
 
@@ -361,22 +406,19 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 {
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	u32 val, reg;
-	unsigned int dbi_offset = 0;
 	struct dw_pcie_ep_func *ep_func;
+	u32 val, reg;
 
 	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
 	if (!ep_func || !ep_func->msi_cap)
 		return -EINVAL;
 
-	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
-
-	reg = ep_func->msi_cap + dbi_offset + PCI_MSI_FLAGS;
-	val = dw_pcie_readw_dbi(pci, reg);
+	reg = ep_func->msi_cap + PCI_MSI_FLAGS;
+	val = dw_pcie_ep_readw_dbi(ep, func_no, reg);
 	val &= ~PCI_MSI_FLAGS_QMASK;
 	val |= FIELD_PREP(PCI_MSI_FLAGS_QMASK, interrupts);
 	dw_pcie_dbi_ro_wr_en(pci);
-	dw_pcie_writew_dbi(pci, reg, val);
+	dw_pcie_ep_writew_dbi(ep, func_no, reg, val);
 	dw_pcie_dbi_ro_wr_dis(pci);
 
 	return 0;
@@ -385,19 +427,15 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 static int dw_pcie_ep_get_msix(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
 {
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	u32 val, reg;
-	unsigned int dbi_offset = 0;
 	struct dw_pcie_ep_func *ep_func;
+	u32 val, reg;
 
 	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
 	if (!ep_func || !ep_func->msix_cap)
 		return -EINVAL;
 
-	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
-
-	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_FLAGS;
-	val = dw_pcie_readw_dbi(pci, reg);
+	reg = ep_func->msix_cap + PCI_MSIX_FLAGS;
+	val = dw_pcie_ep_readw_dbi(ep, func_no, reg);
 	if (!(val & PCI_MSIX_FLAGS_ENABLE))
 		return -EINVAL;
 
@@ -411,9 +449,8 @@ static int dw_pcie_ep_set_msix(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 {
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	u32 val, reg;
-	unsigned int dbi_offset = 0;
 	struct dw_pcie_ep_func *ep_func;
+	u32 val, reg;
 
 	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
 	if (!ep_func || !ep_func->msix_cap)
@@ -421,21 +458,19 @@ static int dw_pcie_ep_set_msix(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 
 	dw_pcie_dbi_ro_wr_en(pci);
 
-	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
-
-	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_FLAGS;
-	val = dw_pcie_readw_dbi(pci, reg);
+	reg = ep_func->msix_cap + PCI_MSIX_FLAGS;
+	val = dw_pcie_ep_readw_dbi(ep, func_no, reg);
 	val &= ~PCI_MSIX_FLAGS_QSIZE;
 	val |= interrupts;
 	dw_pcie_writew_dbi(pci, reg, val);
 
-	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_TABLE;
+	reg = ep_func->msix_cap + PCI_MSIX_TABLE;
 	val = offset | bir;
-	dw_pcie_writel_dbi(pci, reg, val);
+	dw_pcie_ep_writel_dbi(ep, func_no, reg, val);
 
-	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_PBA;
+	reg = ep_func->msix_cap + PCI_MSIX_PBA;
 	val = (offset + (interrupts * PCI_MSIX_ENTRY_SIZE)) | bir;
-	dw_pcie_writel_dbi(pci, reg, val);
+	dw_pcie_ep_writel_dbi(ep, func_no, reg, val);
 
 	dw_pcie_dbi_ro_wr_dis(pci);
 
@@ -510,38 +545,34 @@ EXPORT_SYMBOL_GPL(dw_pcie_ep_raise_legacy_irq);
 int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 			     u8 interrupt_num)
 {
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	u32 msg_addr_lower, msg_addr_upper, reg;
 	struct dw_pcie_ep_func *ep_func;
 	struct pci_epc *epc = ep->epc;
 	unsigned int aligned_offset;
-	unsigned int dbi_offset = 0;
 	u16 msg_ctrl, msg_data;
-	u32 msg_addr_lower, msg_addr_upper, reg;
-	u64 msg_addr;
 	bool has_upper;
+	u64 msg_addr;
 	int ret;
 
 	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
 	if (!ep_func || !ep_func->msi_cap)
 		return -EINVAL;
 
-	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
-
 	/* Raise MSI per the PCI Local Bus Specification Revision 3.0, 6.8.1. */
-	reg = ep_func->msi_cap + dbi_offset + PCI_MSI_FLAGS;
-	msg_ctrl = dw_pcie_readw_dbi(pci, reg);
+	reg = ep_func->msi_cap + PCI_MSI_FLAGS;
+	msg_ctrl = dw_pcie_ep_readw_dbi(ep, func_no, reg);
 	has_upper = !!(msg_ctrl & PCI_MSI_FLAGS_64BIT);
-	reg = ep_func->msi_cap + dbi_offset + PCI_MSI_ADDRESS_LO;
-	msg_addr_lower = dw_pcie_readl_dbi(pci, reg);
+	reg = ep_func->msi_cap + PCI_MSI_ADDRESS_LO;
+	msg_addr_lower = dw_pcie_ep_readl_dbi(ep, func_no, reg);
 	if (has_upper) {
-		reg = ep_func->msi_cap + dbi_offset + PCI_MSI_ADDRESS_HI;
-		msg_addr_upper = dw_pcie_readl_dbi(pci, reg);
-		reg = ep_func->msi_cap + dbi_offset + PCI_MSI_DATA_64;
-		msg_data = dw_pcie_readw_dbi(pci, reg);
+		reg = ep_func->msi_cap + PCI_MSI_ADDRESS_HI;
+		msg_addr_upper = dw_pcie_ep_readl_dbi(ep, func_no, reg);
+		reg = ep_func->msi_cap + PCI_MSI_DATA_64;
+		msg_data = dw_pcie_ep_readw_dbi(ep, func_no, reg);
 	} else {
 		msg_addr_upper = 0;
-		reg = ep_func->msi_cap + dbi_offset + PCI_MSI_DATA_32;
-		msg_data = dw_pcie_readw_dbi(pci, reg);
+		reg = ep_func->msi_cap + PCI_MSI_DATA_32;
+		msg_data = dw_pcie_ep_readw_dbi(ep, func_no, reg);
 	}
 	aligned_offset = msg_addr_lower & (epc->mem->window.page_size - 1);
 	msg_addr = ((u64)msg_addr_upper) << 32 |
@@ -582,10 +613,9 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 			      u16 interrupt_num)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	struct dw_pcie_ep_func *ep_func;
 	struct pci_epf_msix_tbl *msix_tbl;
+	struct dw_pcie_ep_func *ep_func;
 	struct pci_epc *epc = ep->epc;
-	unsigned int dbi_offset = 0;
 	u32 reg, msg_data, vec_ctrl;
 	unsigned int aligned_offset;
 	u32 tbl_offset;
@@ -597,10 +627,8 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	if (!ep_func || !ep_func->msix_cap)
 		return -EINVAL;
 
-	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
-
-	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_TABLE;
-	tbl_offset = dw_pcie_readl_dbi(pci, reg);
+	reg = ep_func->msix_cap + PCI_MSIX_TABLE;
+	tbl_offset = dw_pcie_ep_readl_dbi(ep, func_no, reg);
 	bir = FIELD_GET(PCI_MSIX_TABLE_BIR, tbl_offset);
 	tbl_offset &= PCI_MSIX_TABLE_OFFSET;
 
-- 
2.34.1

