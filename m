Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E78B4A5B63
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 18:27:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Mb980ZJgzDqhD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 02:27:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=andrew.murray@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46Mb7F69QWzDqNJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 02:26:15 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 509B8344;
 Mon,  2 Sep 2019 09:26:11 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67D033F59C;
 Mon,  2 Sep 2019 09:26:10 -0700 (PDT)
Date: Mon, 2 Sep 2019 17:26:08 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH v3 01/11] PCI: designware-ep: Add multiple PFs support
 for DWC
Message-ID: <20190902162608.GP9720@e119886-lin.cambridge.arm.com>
References: <20190902031716.43195-1-xiaowei.bao@nxp.com>
 <20190902031716.43195-2-xiaowei.bao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902031716.43195-2-xiaowei.bao@nxp.com>
User-Agent: Mutt/1.10.1+81 (426a6c1) (2018-08-26)
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
Cc: mark.rutland@arm.com, roy.zang@nxp.com, lorenzo.pieralisi@arm.com,
 arnd@arndb.de, devicetree@vger.kernel.org, jingoohan1@gmail.com,
 zhiqiang.hou@nxp.com, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, minghuan.Lian@nxp.com,
 robh+dt@kernel.org, gregkh@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org, gustavo.pimentel@synopsys.com,
 leoyang.li@nxp.com, shawnguo@kernel.org, mingkai.hu@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 02, 2019 at 11:17:06AM +0800, Xiaowei Bao wrote:
> Add multiple PFs support for DWC, different PF have different config space
> we use pf-offset property which get from the DTS to access the different pF

This needs to be updated as this no longer comes from the DT.

> config space.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>


We're assuming:

 - The offset address (func_offset) between PF's in the memory map can be
   different between different DWC implementations. And also that it's
   possible for DWC implementations to address PFs without using an offset.

 - The current approach is preferable to adding DWC EP driver callbacks
   for writing to the EP config space (e.g. a variant of dw_pcie_writew_dbi
   that takes a func number).

I'm keen to hear feedback from Jingoo/Gustavo on this.

Thanks,

Andrew Murray

> ---
> v2:
>  - Remove duplicate redundant code.
>  - Reimplement the PF config space access way.
> v3:
>  - Integrate duplicate code for func_select.
>  - Move PCIE_ATU_FUNC_NUM(pf) (pf << 20) to ((pf) << 20).
>  - Add the comments for func_conf_select function.
> 
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 123 ++++++++++++++++--------
>  drivers/pci/controller/dwc/pcie-designware.c    |  59 ++++++++----
>  drivers/pci/controller/dwc/pcie-designware.h    |  18 +++-
>  3 files changed, 142 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 65f4792..eb851c2 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -19,12 +19,26 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
>  	pci_epc_linkup(epc);
>  }
>  
> -static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar,
> -				   int flags)
> +static unsigned int dw_pcie_ep_func_select(struct dw_pcie_ep *ep, u8 func_no)
> +{
> +	unsigned int func_offset = 0;
> +
> +	if (ep->ops->func_conf_select)
> +		func_offset = ep->ops->func_conf_select(ep, func_no);
> +
> +	return func_offset;
> +}
> +
> +static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, u8 func_no,
> +				   enum pci_barno bar, int flags)
>  {
>  	u32 reg;
> +	unsigned int func_offset = 0;
> +	struct dw_pcie_ep *ep = &pci->ep;
> +
> +	func_offset = dw_pcie_ep_func_select(ep, func_no);
>  
> -	reg = PCI_BASE_ADDRESS_0 + (4 * bar);
> +	reg = func_offset + PCI_BASE_ADDRESS_0 + (4 * bar);
>  	dw_pcie_dbi_ro_wr_en(pci);
>  	dw_pcie_writel_dbi2(pci, reg, 0x0);
>  	dw_pcie_writel_dbi(pci, reg, 0x0);
> @@ -37,7 +51,12 @@ static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar,
>  
>  void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
>  {
> -	__dw_pcie_ep_reset_bar(pci, bar, 0);
> +	u8 func_no, funcs;
> +
> +	funcs = pci->ep.epc->max_functions;
> +
> +	for (func_no = 0; func_no < funcs; func_no++)
> +		__dw_pcie_ep_reset_bar(pci, func_no, bar, 0);
>  }
>  
>  static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no,
> @@ -45,28 +64,31 @@ static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no,
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	unsigned int func_offset = 0;
> +
> +	func_offset = dw_pcie_ep_func_select(ep, func_no);
>  
>  	dw_pcie_dbi_ro_wr_en(pci);
> -	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, hdr->vendorid);
> -	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, hdr->deviceid);
> -	dw_pcie_writeb_dbi(pci, PCI_REVISION_ID, hdr->revid);
> -	dw_pcie_writeb_dbi(pci, PCI_CLASS_PROG, hdr->progif_code);
> -	dw_pcie_writew_dbi(pci, PCI_CLASS_DEVICE,
> +	dw_pcie_writew_dbi(pci, func_offset + PCI_VENDOR_ID, hdr->vendorid);
> +	dw_pcie_writew_dbi(pci, func_offset + PCI_DEVICE_ID, hdr->deviceid);
> +	dw_pcie_writeb_dbi(pci, func_offset + PCI_REVISION_ID, hdr->revid);
> +	dw_pcie_writeb_dbi(pci, func_offset + PCI_CLASS_PROG, hdr->progif_code);
> +	dw_pcie_writew_dbi(pci, func_offset + PCI_CLASS_DEVICE,
>  			   hdr->subclass_code | hdr->baseclass_code << 8);
> -	dw_pcie_writeb_dbi(pci, PCI_CACHE_LINE_SIZE,
> +	dw_pcie_writeb_dbi(pci, func_offset + PCI_CACHE_LINE_SIZE,
>  			   hdr->cache_line_size);
> -	dw_pcie_writew_dbi(pci, PCI_SUBSYSTEM_VENDOR_ID,
> +	dw_pcie_writew_dbi(pci, func_offset + PCI_SUBSYSTEM_VENDOR_ID,
>  			   hdr->subsys_vendor_id);
> -	dw_pcie_writew_dbi(pci, PCI_SUBSYSTEM_ID, hdr->subsys_id);
> -	dw_pcie_writeb_dbi(pci, PCI_INTERRUPT_PIN,
> +	dw_pcie_writew_dbi(pci, func_offset + PCI_SUBSYSTEM_ID, hdr->subsys_id);
> +	dw_pcie_writeb_dbi(pci, func_offset + PCI_INTERRUPT_PIN,
>  			   hdr->interrupt_pin);
>  	dw_pcie_dbi_ro_wr_dis(pci);
>  
>  	return 0;
>  }
>  
> -static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, enum pci_barno bar,
> -				  dma_addr_t cpu_addr,
> +static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no,
> +				  enum pci_barno bar, dma_addr_t cpu_addr,
>  				  enum dw_pcie_as_type as_type)
>  {
>  	int ret;
> @@ -79,7 +101,7 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, enum pci_barno bar,
>  		return -EINVAL;
>  	}
>  
> -	ret = dw_pcie_prog_inbound_atu(pci, free_win, bar, cpu_addr,
> +	ret = dw_pcie_prog_inbound_atu(pci, func_no, free_win, bar, cpu_addr,
>  				       as_type);
>  	if (ret < 0) {
>  		dev_err(pci->dev, "Failed to program IB window\n");
> @@ -92,7 +114,8 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, enum pci_barno bar,
>  	return 0;
>  }
>  
> -static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep, phys_addr_t phys_addr,
> +static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep, u8 func_no,
> +				   phys_addr_t phys_addr,
>  				   u64 pci_addr, size_t size)
>  {
>  	u32 free_win;
> @@ -104,8 +127,8 @@ static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep, phys_addr_t phys_addr,
>  		return -EINVAL;
>  	}
>  
> -	dw_pcie_prog_outbound_atu(pci, free_win, PCIE_ATU_TYPE_MEM,
> -				  phys_addr, pci_addr, size);
> +	dw_pcie_prog_ep_outbound_atu(pci, func_no, free_win, PCIE_ATU_TYPE_MEM,
> +				     phys_addr, pci_addr, size);
>  
>  	set_bit(free_win, ep->ob_window_map);
>  	ep->outbound_addr[free_win] = phys_addr;
> @@ -121,7 +144,7 @@ static void dw_pcie_ep_clear_bar(struct pci_epc *epc, u8 func_no,
>  	enum pci_barno bar = epf_bar->barno;
>  	u32 atu_index = ep->bar_to_atu[bar];
>  
> -	__dw_pcie_ep_reset_bar(pci, bar, epf_bar->flags);
> +	__dw_pcie_ep_reset_bar(pci, func_no, bar, epf_bar->flags);
>  
>  	dw_pcie_disable_atu(pci, atu_index, DW_PCIE_REGION_INBOUND);
>  	clear_bit(atu_index, ep->ib_window_map);
> @@ -137,14 +160,20 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no,
>  	size_t size = epf_bar->size;
>  	int flags = epf_bar->flags;
>  	enum dw_pcie_as_type as_type;
> -	u32 reg = PCI_BASE_ADDRESS_0 + (4 * bar);
> +	u32 reg;
> +	unsigned int func_offset = 0;
> +
> +	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +
> +	reg = PCI_BASE_ADDRESS_0 + (4 * bar) + func_offset;
>  
>  	if (!(flags & PCI_BASE_ADDRESS_SPACE))
>  		as_type = DW_PCIE_AS_MEM;
>  	else
>  		as_type = DW_PCIE_AS_IO;
>  
> -	ret = dw_pcie_ep_inbound_atu(ep, bar, epf_bar->phys_addr, as_type);
> +	ret = dw_pcie_ep_inbound_atu(ep, func_no, bar,
> +				     epf_bar->phys_addr, as_type);
>  	if (ret)
>  		return ret;
>  
> @@ -202,7 +231,7 @@ static int dw_pcie_ep_map_addr(struct pci_epc *epc, u8 func_no,
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  
> -	ret = dw_pcie_ep_outbound_atu(ep, addr, pci_addr, size);
> +	ret = dw_pcie_ep_outbound_atu(ep, func_no, addr, pci_addr, size);
>  	if (ret) {
>  		dev_err(pci->dev, "Failed to enable address\n");
>  		return ret;
> @@ -216,11 +245,14 @@ static int dw_pcie_ep_get_msi(struct pci_epc *epc, u8 func_no)
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> +	unsigned int func_offset = 0;
>  
>  	if (!ep->msi_cap)
>  		return -EINVAL;
>  
> -	reg = ep->msi_cap + PCI_MSI_FLAGS;
> +	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +
> +	reg = ep->msi_cap + func_offset + PCI_MSI_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	if (!(val & PCI_MSI_FLAGS_ENABLE))
>  		return -EINVAL;
> @@ -235,11 +267,14 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 interrupts)
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> +	unsigned int func_offset = 0;
>  
>  	if (!ep->msi_cap)
>  		return -EINVAL;
>  
> -	reg = ep->msi_cap + PCI_MSI_FLAGS;
> +	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +
> +	reg = ep->msi_cap + func_offset + PCI_MSI_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	val &= ~PCI_MSI_FLAGS_QMASK;
>  	val |= (interrupts << 1) & PCI_MSI_FLAGS_QMASK;
> @@ -255,11 +290,14 @@ static int dw_pcie_ep_get_msix(struct pci_epc *epc, u8 func_no)
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> +	unsigned int func_offset = 0;
>  
>  	if (!ep->msix_cap)
>  		return -EINVAL;
>  
> -	reg = ep->msix_cap + PCI_MSIX_FLAGS;
> +	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +
> +	reg = ep->msix_cap + func_offset + PCI_MSIX_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	if (!(val & PCI_MSIX_FLAGS_ENABLE))
>  		return -EINVAL;
> @@ -274,11 +312,14 @@ static int dw_pcie_ep_set_msix(struct pci_epc *epc, u8 func_no, u16 interrupts)
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> +	unsigned int func_offset = 0;
>  
>  	if (!ep->msix_cap)
>  		return -EINVAL;
>  
> -	reg = ep->msix_cap + PCI_MSIX_FLAGS;
> +	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +
> +	reg = ep->msix_cap + func_offset + PCI_MSIX_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	val &= ~PCI_MSIX_FLAGS_QSIZE;
>  	val |= interrupts;
> @@ -365,6 +406,7 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct pci_epc *epc = ep->epc;
>  	unsigned int aligned_offset;
> +	unsigned int func_offset = 0;
>  	u16 msg_ctrl, msg_data;
>  	u32 msg_addr_lower, msg_addr_upper, reg;
>  	u64 msg_addr;
> @@ -374,20 +416,22 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	if (!ep->msi_cap)
>  		return -EINVAL;
>  
> +	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +
>  	/* Raise MSI per the PCI Local Bus Specification Revision 3.0, 6.8.1. */
> -	reg = ep->msi_cap + PCI_MSI_FLAGS;
> +	reg = ep->msi_cap + func_offset + PCI_MSI_FLAGS;
>  	msg_ctrl = dw_pcie_readw_dbi(pci, reg);
>  	has_upper = !!(msg_ctrl & PCI_MSI_FLAGS_64BIT);
> -	reg = ep->msi_cap + PCI_MSI_ADDRESS_LO;
> +	reg = ep->msi_cap + func_offset + PCI_MSI_ADDRESS_LO;
>  	msg_addr_lower = dw_pcie_readl_dbi(pci, reg);
>  	if (has_upper) {
> -		reg = ep->msi_cap + PCI_MSI_ADDRESS_HI;
> +		reg = ep->msi_cap + func_offset + PCI_MSI_ADDRESS_HI;
>  		msg_addr_upper = dw_pcie_readl_dbi(pci, reg);
> -		reg = ep->msi_cap + PCI_MSI_DATA_64;
> +		reg = ep->msi_cap + func_offset + PCI_MSI_DATA_64;
>  		msg_data = dw_pcie_readw_dbi(pci, reg);
>  	} else {
>  		msg_addr_upper = 0;
> -		reg = ep->msi_cap + PCI_MSI_DATA_32;
> +		reg = ep->msi_cap + func_offset + PCI_MSI_DATA_32;
>  		msg_data = dw_pcie_readw_dbi(pci, reg);
>  	}
>  	aligned_offset = msg_addr_lower & (epc->mem->page_size - 1);
> @@ -406,11 +450,12 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  }
>  
>  int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
> -			     u16 interrupt_num)
> +			      u16 interrupt_num)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct pci_epc *epc = ep->epc;
>  	u16 tbl_offset, bir;
> +	unsigned int func_offset = 0;
>  	u32 bar_addr_upper, bar_addr_lower;
>  	u32 msg_addr_upper, msg_addr_lower;
>  	u32 reg, msg_data, vec_ctrl;
> @@ -418,12 +463,14 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	void __iomem *msix_tbl;
>  	int ret;
>  
> -	reg = ep->msix_cap + PCI_MSIX_TABLE;
> +	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +
> +	reg = ep->msix_cap + func_offset + PCI_MSIX_TABLE;
>  	tbl_offset = dw_pcie_readl_dbi(pci, reg);
>  	bir = (tbl_offset & PCI_MSIX_TABLE_BIR);
>  	tbl_offset &= PCI_MSIX_TABLE_OFFSET;
>  
> -	reg = PCI_BASE_ADDRESS_0 + (4 * bir);
> +	reg = PCI_BASE_ADDRESS_0 + func_offset + (4 * bir);
>  	bar_addr_upper = 0;
>  	bar_addr_lower = dw_pcie_readl_dbi(pci, reg);
>  	reg_u64 = (bar_addr_lower & PCI_BASE_ADDRESS_MEM_TYPE_MASK);
> @@ -559,13 +606,13 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  	ep->epc = epc;
>  	epc_set_drvdata(epc, ep);
>  
> -	if (ep->ops->ep_init)
> -		ep->ops->ep_init(ep);
> -
>  	ret = of_property_read_u8(np, "max-functions", &epc->max_functions);
>  	if (ret < 0)
>  		epc->max_functions = 1;
>  
> +	if (ep->ops->ep_init)
> +		ep->ops->ep_init(ep);
> +
>  	ret = __pci_epc_mem_init(epc, ep->phys_base, ep->addr_size,
>  				 ep->page_size);
>  	if (ret < 0) {
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 143cb6c..ede2e75 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -238,9 +238,10 @@ static void dw_pcie_writel_ob_unroll(struct dw_pcie *pci, u32 index, u32 reg,
>  	dw_pcie_writel_atu(pci, offset + reg, val);
>  }
>  
> -static void dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, int index,
> -					     int type, u64 cpu_addr,
> -					     u64 pci_addr, u32 size)
> +static void dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, u8 func_no,
> +					     int index, int type,
> +					     u64 cpu_addr, u64 pci_addr,
> +					     u32 size)
>  {
>  	u32 retries, val;
>  
> @@ -255,7 +256,7 @@ static void dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, int index,
>  	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_TARGET,
>  				 upper_32_bits(pci_addr));
>  	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1,
> -				 type);
> +				 type | PCIE_ATU_FUNC_NUM(func_no));
>  	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
>  				 PCIE_ATU_ENABLE);
>  
> @@ -274,8 +275,9 @@ static void dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, int index,
>  	dev_err(pci->dev, "Outbound iATU is not being enabled\n");
>  }
>  
> -void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index, int type,
> -			       u64 cpu_addr, u64 pci_addr, u32 size)
> +static void __dw_pcie_prog_outbound_atu(struct dw_pcie *pci, u8 func_no,
> +					int index, int type, u64 cpu_addr,
> +					u64 pci_addr, u32 size)
>  {
>  	u32 retries, val;
>  
> @@ -283,8 +285,8 @@ void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index, int type,
>  		cpu_addr = pci->ops->cpu_addr_fixup(pci, cpu_addr);
>  
>  	if (pci->iatu_unroll_enabled) {
> -		dw_pcie_prog_outbound_atu_unroll(pci, index, type, cpu_addr,
> -						 pci_addr, size);
> +		dw_pcie_prog_outbound_atu_unroll(pci, func_no, index, type,
> +						 cpu_addr, pci_addr, size);
>  		return;
>  	}
>  
> @@ -300,7 +302,8 @@ void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index, int type,
>  			   lower_32_bits(pci_addr));
>  	dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_TARGET,
>  			   upper_32_bits(pci_addr));
> -	dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, type);
> +	dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, type |
> +			   PCIE_ATU_FUNC_NUM(func_no));
>  	dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE);
>  
>  	/*
> @@ -317,6 +320,21 @@ void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index, int type,
>  	dev_err(pci->dev, "Outbound iATU is not being enabled\n");
>  }
>  
> +void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index, int type,
> +			       u64 cpu_addr, u64 pci_addr, u32 size)
> +{
> +	__dw_pcie_prog_outbound_atu(pci, 0, index, type,
> +				    cpu_addr, pci_addr, size);
> +}
> +
> +void dw_pcie_prog_ep_outbound_atu(struct dw_pcie *pci, u8 func_no, int index,
> +				  int type, u64 cpu_addr, u64 pci_addr,
> +				  u32 size)
> +{
> +	__dw_pcie_prog_outbound_atu(pci, func_no, index, type,
> +				    cpu_addr, pci_addr, size);
> +}
> +
>  static u32 dw_pcie_readl_ib_unroll(struct dw_pcie *pci, u32 index, u32 reg)
>  {
>  	u32 offset = PCIE_GET_ATU_INB_UNR_REG_OFFSET(index);
> @@ -332,8 +350,8 @@ static void dw_pcie_writel_ib_unroll(struct dw_pcie *pci, u32 index, u32 reg,
>  	dw_pcie_writel_atu(pci, offset + reg, val);
>  }
>  
> -static int dw_pcie_prog_inbound_atu_unroll(struct dw_pcie *pci, int index,
> -					   int bar, u64 cpu_addr,
> +static int dw_pcie_prog_inbound_atu_unroll(struct dw_pcie *pci, u8 func_no,
> +					   int index, int bar, u64 cpu_addr,
>  					   enum dw_pcie_as_type as_type)
>  {
>  	int type;
> @@ -355,8 +373,10 @@ static int dw_pcie_prog_inbound_atu_unroll(struct dw_pcie *pci, int index,
>  		return -EINVAL;
>  	}
>  
> -	dw_pcie_writel_ib_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1, type);
> +	dw_pcie_writel_ib_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1, type |
> +				 PCIE_ATU_FUNC_NUM(func_no));
>  	dw_pcie_writel_ib_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
> +				 PCIE_ATU_FUNC_NUM_MATCH_EN |
>  				 PCIE_ATU_ENABLE |
>  				 PCIE_ATU_BAR_MODE_ENABLE | (bar << 8));
>  
> @@ -377,14 +397,15 @@ static int dw_pcie_prog_inbound_atu_unroll(struct dw_pcie *pci, int index,
>  	return -EBUSY;
>  }
>  
> -int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, int index, int bar,
> -			     u64 cpu_addr, enum dw_pcie_as_type as_type)
> +int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, u8 func_no, int index,
> +			     int bar, u64 cpu_addr,
> +			     enum dw_pcie_as_type as_type)
>  {
>  	int type;
>  	u32 retries, val;
>  
>  	if (pci->iatu_unroll_enabled)
> -		return dw_pcie_prog_inbound_atu_unroll(pci, index, bar,
> +		return dw_pcie_prog_inbound_atu_unroll(pci, func_no, index, bar,
>  						       cpu_addr, as_type);
>  
>  	dw_pcie_writel_dbi(pci, PCIE_ATU_VIEWPORT, PCIE_ATU_REGION_INBOUND |
> @@ -403,9 +424,11 @@ int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, int index, int bar,
>  		return -EINVAL;
>  	}
>  
> -	dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, type);
> -	dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE
> -			   | PCIE_ATU_BAR_MODE_ENABLE | (bar << 8));
> +	dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, type |
> +			   PCIE_ATU_FUNC_NUM(func_no));
> +	dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE |
> +			   PCIE_ATU_FUNC_NUM_MATCH_EN |
> +			   PCIE_ATU_BAR_MODE_ENABLE | (bar << 8));
>  
>  	/*
>  	 * Make sure ATU enable takes effect before any subsequent config
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 5a18e94..6aca0bb 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -71,9 +71,11 @@
>  #define PCIE_ATU_TYPE_IO		0x2
>  #define PCIE_ATU_TYPE_CFG0		0x4
>  #define PCIE_ATU_TYPE_CFG1		0x5
> +#define PCIE_ATU_FUNC_NUM(pf)           ((pf) << 20)
>  #define PCIE_ATU_CR2			0x908
>  #define PCIE_ATU_ENABLE			BIT(31)
>  #define PCIE_ATU_BAR_MODE_ENABLE	BIT(30)
> +#define PCIE_ATU_FUNC_NUM_MATCH_EN      BIT(19)
>  #define PCIE_ATU_LOWER_BASE		0x90C
>  #define PCIE_ATU_UPPER_BASE		0x910
>  #define PCIE_ATU_LIMIT			0x914
> @@ -206,6 +208,14 @@ struct dw_pcie_ep_ops {
>  	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
>  			     enum pci_epc_irq_type type, u16 interrupt_num);
>  	const struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
> +	/*
> +	 * Provide a method to implement the different func config space
> +	 * access for different platform, if different func have different
> +	 * offset, return the offset of func. if use write a register way
> +	 * return a 0, and implement code in callback function of platform
> +	 * driver.
> +	 */
> +	unsigned int (*func_conf_select)(struct dw_pcie_ep *ep, u8 func_no);
>  };
>  
>  struct dw_pcie_ep {
> @@ -277,8 +287,12 @@ int dw_pcie_wait_for_link(struct dw_pcie *pci);
>  void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index,
>  			       int type, u64 cpu_addr, u64 pci_addr,
>  			       u32 size);
> -int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, int index, int bar,
> -			     u64 cpu_addr, enum dw_pcie_as_type as_type);
> +void dw_pcie_prog_ep_outbound_atu(struct dw_pcie *pci, u8 func_no, int index,
> +				  int type, u64 cpu_addr, u64 pci_addr,
> +				  u32 size);
> +int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, u8 func_no, int index,
> +			     int bar, u64 cpu_addr,
> +			     enum dw_pcie_as_type as_type);
>  void dw_pcie_disable_atu(struct dw_pcie *pci, int index,
>  			 enum dw_pcie_region_type type);
>  void dw_pcie_setup(struct dw_pcie *pci);
> -- 
> 2.9.5
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
