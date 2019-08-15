Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D96988EA5B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 13:33:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468PTj3sd1zDqZB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 21:33:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=andrew.murray@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 468PRZ1NSlzDqMK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 21:31:34 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C20DD360;
 Thu, 15 Aug 2019 04:31:32 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E66903F694;
 Thu, 15 Aug 2019 04:31:31 -0700 (PDT)
Date: Thu, 15 Aug 2019 12:31:30 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH 01/10] PCI: designware-ep: Add multiple PFs support for DWC
Message-ID: <20190815113129.GF43882@e119886-lin.cambridge.arm.com>
References: <20190815083716.4715-1-xiaowei.bao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815083716.4715-1-xiaowei.bao@nxp.com>
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
 arnd@arndb.de, gregkh@linuxfoundation.org, jingoohan1@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com, minghuan.Lian@nxp.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, gustavo.pimentel@synopsys.com,
 bhelgaas@google.com, kishon@ti.com, shawnguo@kernel.org, mingkai.hu@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 15, 2019 at 04:37:07PM +0800, Xiaowei Bao wrote:
> Add multiple PFs support for DWC, different PF have different config space,
> we use pf-offset property which get from the DTS to access the different pF
> config space.

Thanks for the patch. I haven't seen a cover letter for this series, is there
one missing?


> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c |  97 +++++++++++++---------
>  drivers/pci/controller/dwc/pcie-designware.c    | 105 ++++++++++++++++++++++--
>  drivers/pci/controller/dwc/pcie-designware.h    |  10 ++-
>  include/linux/pci-epc.h                         |   1 +
>  4 files changed, 164 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 2bf5a35..75e2955 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -19,12 +19,14 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
>  	pci_epc_linkup(epc);
>  }
>  
> -static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar,
> -				   int flags)
> +static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, u8 func_no,
> +				   enum pci_barno bar, int flags)
>  {
>  	u32 reg;
> +	struct pci_epc *epc = pci->ep.epc;
> +	u32 pf_base = func_no * epc->pf_offset;
>  
> -	reg = PCI_BASE_ADDRESS_0 + (4 * bar);
> +	reg = pf_base + PCI_BASE_ADDRESS_0 + (4 * bar);

I think I'd rather see this arithmetic (and the one for determining pf_base)
inside a macro or inline header function. This would make this code more readable
and reduce the chances of an error by avoiding duplication of code.

For example look at cdns_pcie_ep_fn_writeb and ROCKCHIP_PCIE_EP_FUNC_BASE for
examples of other EP drivers that do this.


>  	dw_pcie_dbi_ro_wr_en(pci);
>  	dw_pcie_writel_dbi2(pci, reg, 0x0);
>  	dw_pcie_writel_dbi(pci, reg, 0x0);
> @@ -37,7 +39,12 @@ static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar,
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
>  static u8 __dw_pcie_ep_find_next_cap(struct dw_pcie *pci, u8 cap_ptr,
> @@ -78,28 +85,29 @@ static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no,
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	u32 pf_base = func_no * epc->pf_offset;
>  
>  	dw_pcie_dbi_ro_wr_en(pci);
> -	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, hdr->vendorid);
> -	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, hdr->deviceid);
> -	dw_pcie_writeb_dbi(pci, PCI_REVISION_ID, hdr->revid);
> -	dw_pcie_writeb_dbi(pci, PCI_CLASS_PROG, hdr->progif_code);
> -	dw_pcie_writew_dbi(pci, PCI_CLASS_DEVICE,
> +	dw_pcie_writew_dbi(pci, pf_base + PCI_VENDOR_ID, hdr->vendorid);
> +	dw_pcie_writew_dbi(pci, pf_base + PCI_DEVICE_ID, hdr->deviceid);
> +	dw_pcie_writeb_dbi(pci, pf_base + PCI_REVISION_ID, hdr->revid);
> +	dw_pcie_writeb_dbi(pci, pf_base + PCI_CLASS_PROG, hdr->progif_code);
> +	dw_pcie_writew_dbi(pci, pf_base + PCI_CLASS_DEVICE,
>  			   hdr->subclass_code | hdr->baseclass_code << 8);
> -	dw_pcie_writeb_dbi(pci, PCI_CACHE_LINE_SIZE,
> +	dw_pcie_writeb_dbi(pci, pf_base + PCI_CACHE_LINE_SIZE,
>  			   hdr->cache_line_size);
> -	dw_pcie_writew_dbi(pci, PCI_SUBSYSTEM_VENDOR_ID,
> +	dw_pcie_writew_dbi(pci, pf_base + PCI_SUBSYSTEM_VENDOR_ID,
>  			   hdr->subsys_vendor_id);
> -	dw_pcie_writew_dbi(pci, PCI_SUBSYSTEM_ID, hdr->subsys_id);
> -	dw_pcie_writeb_dbi(pci, PCI_INTERRUPT_PIN,
> +	dw_pcie_writew_dbi(pci, pf_base + PCI_SUBSYSTEM_ID, hdr->subsys_id);
> +	dw_pcie_writeb_dbi(pci, pf_base + PCI_INTERRUPT_PIN,
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
> @@ -112,7 +120,7 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, enum pci_barno bar,
>  		return -EINVAL;
>  	}
>  
> -	ret = dw_pcie_prog_inbound_atu(pci, free_win, bar, cpu_addr,
> +	ret = dw_pcie_prog_inbound_atu(pci, func_no, free_win, bar, cpu_addr,
>  				       as_type);
>  	if (ret < 0) {
>  		dev_err(pci->dev, "Failed to program IB window\n");
> @@ -125,7 +133,8 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, enum pci_barno bar,
>  	return 0;
>  }
>  
> -static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep, phys_addr_t phys_addr,
> +static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep, u8 func_no,
> +				   phys_addr_t phys_addr,
>  				   u64 pci_addr, size_t size)
>  {
>  	u32 free_win;
> @@ -137,8 +146,8 @@ static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep, phys_addr_t phys_addr,
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
> @@ -154,7 +163,7 @@ static void dw_pcie_ep_clear_bar(struct pci_epc *epc, u8 func_no,
>  	enum pci_barno bar = epf_bar->barno;
>  	u32 atu_index = ep->bar_to_atu[bar];
>  
> -	__dw_pcie_ep_reset_bar(pci, bar, epf_bar->flags);
> +	__dw_pcie_ep_reset_bar(pci, func_no, bar, epf_bar->flags);
>  
>  	dw_pcie_disable_atu(pci, atu_index, DW_PCIE_REGION_INBOUND);
>  	clear_bit(atu_index, ep->ib_window_map);
> @@ -170,14 +179,16 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no,
>  	size_t size = epf_bar->size;
>  	int flags = epf_bar->flags;
>  	enum dw_pcie_as_type as_type;
> -	u32 reg = PCI_BASE_ADDRESS_0 + (4 * bar);
> +	u32 pf_base = func_no * epc->pf_offset;
> +	u32 reg = PCI_BASE_ADDRESS_0 + (4 * bar) + pf_base;
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
> @@ -235,7 +246,7 @@ static int dw_pcie_ep_map_addr(struct pci_epc *epc, u8 func_no,
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  
> -	ret = dw_pcie_ep_outbound_atu(ep, addr, pci_addr, size);
> +	ret = dw_pcie_ep_outbound_atu(ep, func_no, addr, pci_addr, size);
>  	if (ret) {
>  		dev_err(pci->dev, "Failed to enable address\n");
>  		return ret;
> @@ -248,12 +259,13 @@ static int dw_pcie_ep_get_msi(struct pci_epc *epc, u8 func_no)
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	u32 pf_base = func_no * epc->pf_offset;
>  	u32 val, reg;
>  
>  	if (!ep->msi_cap)
>  		return -EINVAL;
>  
> -	reg = ep->msi_cap + PCI_MSI_FLAGS;
> +	reg = ep->msi_cap + pf_base + PCI_MSI_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	if (!(val & PCI_MSI_FLAGS_ENABLE))
>  		return -EINVAL;
> @@ -267,12 +279,13 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 interrupts)
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	u32 pf_base = func_no * epc->pf_offset;
>  	u32 val, reg;
>  
>  	if (!ep->msi_cap)
>  		return -EINVAL;
>  
> -	reg = ep->msi_cap + PCI_MSI_FLAGS;
> +	reg = ep->msi_cap + pf_base + PCI_MSI_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	val &= ~PCI_MSI_FLAGS_QMASK;
>  	val |= (interrupts << 1) & PCI_MSI_FLAGS_QMASK;
> @@ -287,12 +300,13 @@ static int dw_pcie_ep_get_msix(struct pci_epc *epc, u8 func_no)
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	u32 pf_base = func_no * epc->pf_offset;
>  	u32 val, reg;
>  
>  	if (!ep->msix_cap)
>  		return -EINVAL;
>  
> -	reg = ep->msix_cap + PCI_MSIX_FLAGS;
> +	reg = ep->msix_cap + pf_base + PCI_MSIX_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	if (!(val & PCI_MSIX_FLAGS_ENABLE))
>  		return -EINVAL;
> @@ -306,12 +320,13 @@ static int dw_pcie_ep_set_msix(struct pci_epc *epc, u8 func_no, u16 interrupts)
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	u32 pf_base = func_no * epc->pf_offset;
>  	u32 val, reg;
>  
>  	if (!ep->msix_cap)
>  		return -EINVAL;
>  
> -	reg = ep->msix_cap + PCI_MSIX_FLAGS;
> +	reg = ep->msix_cap + pf_base + PCI_MSIX_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	val &= ~PCI_MSIX_FLAGS_QSIZE;
>  	val |= interrupts;
> @@ -400,6 +415,7 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	unsigned int aligned_offset;
>  	u16 msg_ctrl, msg_data;
>  	u32 msg_addr_lower, msg_addr_upper, reg;
> +	u32 pf_base = func_no * epc->pf_offset;
>  	u64 msg_addr;
>  	bool has_upper;
>  	int ret;
> @@ -408,19 +424,19 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  		return -EINVAL;
>  
>  	/* Raise MSI per the PCI Local Bus Specification Revision 3.0, 6.8.1. */
> -	reg = ep->msi_cap + PCI_MSI_FLAGS;
> +	reg = ep->msi_cap + pf_base + PCI_MSI_FLAGS;
>  	msg_ctrl = dw_pcie_readw_dbi(pci, reg);
>  	has_upper = !!(msg_ctrl & PCI_MSI_FLAGS_64BIT);
> -	reg = ep->msi_cap + PCI_MSI_ADDRESS_LO;
> +	reg = ep->msi_cap + pf_base + PCI_MSI_ADDRESS_LO;
>  	msg_addr_lower = dw_pcie_readl_dbi(pci, reg);
>  	if (has_upper) {
> -		reg = ep->msi_cap + PCI_MSI_ADDRESS_HI;
> +		reg = ep->msi_cap + pf_base + PCI_MSI_ADDRESS_HI;
>  		msg_addr_upper = dw_pcie_readl_dbi(pci, reg);
> -		reg = ep->msi_cap + PCI_MSI_DATA_64;
> +		reg = ep->msi_cap + pf_base + PCI_MSI_DATA_64;
>  		msg_data = dw_pcie_readw_dbi(pci, reg);
>  	} else {
>  		msg_addr_upper = 0;
> -		reg = ep->msi_cap + PCI_MSI_DATA_32;
> +		reg = ep->msi_cap + pf_base + PCI_MSI_DATA_32;
>  		msg_data = dw_pcie_readw_dbi(pci, reg);
>  	}
>  	aligned_offset = msg_addr_lower & (epc->mem->page_size - 1);
> @@ -439,7 +455,7 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  }
>  
>  int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
> -			     u16 interrupt_num)
> +			      u16 interrupt_num)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct pci_epc *epc = ep->epc;
> @@ -447,16 +463,17 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	u32 bar_addr_upper, bar_addr_lower;
>  	u32 msg_addr_upper, msg_addr_lower;
>  	u32 reg, msg_data, vec_ctrl;
> +	u32 pf_base = func_no * epc->pf_offset;
>  	u64 tbl_addr, msg_addr, reg_u64;
>  	void __iomem *msix_tbl;
>  	int ret;
>  
> -	reg = ep->msix_cap + PCI_MSIX_TABLE;
> +	reg = ep->msix_cap + pf_base + PCI_MSIX_TABLE;
>  	tbl_offset = dw_pcie_readl_dbi(pci, reg);
>  	bir = (tbl_offset & PCI_MSIX_TABLE_BIR);
>  	tbl_offset &= PCI_MSIX_TABLE_OFFSET;
>  
> -	reg = PCI_BASE_ADDRESS_0 + (4 * bir);
> +	reg = PCI_BASE_ADDRESS_0 + pf_base + (4 * bir);
>  	bar_addr_upper = 0;
>  	bar_addr_lower = dw_pcie_readl_dbi(pci, reg);
>  	reg_u64 = (bar_addr_lower & PCI_BASE_ADDRESS_MEM_TYPE_MASK);
> @@ -592,13 +609,17 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
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
> +	ret = of_property_read_u32(np, "pf-offset", &epc->pf_offset);
> +	if (ret < 0)
> +		epc->pf_offset = 0;

Bad things will likely happen if max_functions > 1 and pf-offset isn't set.
I think the driver should bail in this situation. It would be very easy
for someone to misconfigure this.


> +
> +	if (ep->ops->ep_init)
> +		ep->ops->ep_init(ep);
> +
>  	ret = __pci_epc_mem_init(epc, ep->phys_base, ep->addr_size,
>  				 ep->page_size);
>  	if (ret < 0) {
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 7d25102..c99cee4 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -158,6 +158,43 @@ static void dw_pcie_writel_ob_unroll(struct dw_pcie *pci, u32 index, u32 reg,
>  	dw_pcie_writel_atu(pci, offset + reg, val);
>  }
>  
> +static void dw_pcie_prog_ep_outbound_atu_unroll(struct dw_pcie *pci, u8 func_no,
> +						int index, int type,
> +						u64 cpu_addr, u64 pci_addr,
> +						u32 size)
> +{
> +	u32 retries, val;
> +
> +	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_LOWER_BASE,
> +				 lower_32_bits(cpu_addr));
> +	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_BASE,
> +				 upper_32_bits(cpu_addr));
> +	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_LIMIT,
> +				 lower_32_bits(cpu_addr + size - 1));
> +	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_LOWER_TARGET,
> +				 lower_32_bits(pci_addr));
> +	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_TARGET,
> +				 upper_32_bits(pci_addr));
> +	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1,
> +				 type | PCIE_ATU_FUNC_NUM(func_no));

With the exception of this line, the rest of this function is identical to
dw_pcie_prog_outbound_atu_unroll.

> +	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
> +				 PCIE_ATU_ENABLE);
> +
> +	/*
> +	 * Make sure ATU enable takes effect before any subsequent config
> +	 * and I/O accesses.
> +	 */
> +	for (retries = 0; retries < LINK_WAIT_MAX_IATU_RETRIES; retries++) {
> +		val = dw_pcie_readl_ob_unroll(pci, index,
> +					      PCIE_ATU_UNR_REGION_CTRL2);
> +		if (val & PCIE_ATU_ENABLE)
> +			return;
> +
> +		mdelay(LINK_WAIT_IATU);
> +	}
> +	dev_err(pci->dev, "Outbound iATU is not being enabled\n");
> +}
> +
>  static void dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, int index,
>  					     int type, u64 cpu_addr,
>  					     u64 pci_addr, u32 size)
> @@ -194,6 +231,51 @@ static void dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, int index,
>  	dev_err(pci->dev, "Outbound iATU is not being enabled\n");
>  }
>  
> +void dw_pcie_prog_ep_outbound_atu(struct dw_pcie *pci, u8 func_no, int index,
> +				  int type, u64 cpu_addr, u64 pci_addr,
> +				  u32 size)
> +{
> +	u32 retries, val;
> +
> +	if (pci->ops->cpu_addr_fixup)
> +		cpu_addr = pci->ops->cpu_addr_fixup(pci, cpu_addr);
> +
> +	if (pci->iatu_unroll_enabled) {
> +		dw_pcie_prog_ep_outbound_atu_unroll(pci, func_no, index, type,
> +						    cpu_addr, pci_addr, size);
> +		return;
> +	}
> +
> +	dw_pcie_writel_dbi(pci, PCIE_ATU_VIEWPORT,
> +			   PCIE_ATU_REGION_OUTBOUND | index);
> +	dw_pcie_writel_dbi(pci, PCIE_ATU_LOWER_BASE,
> +			   lower_32_bits(cpu_addr));
> +	dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_BASE,
> +			   upper_32_bits(cpu_addr));
> +	dw_pcie_writel_dbi(pci, PCIE_ATU_LIMIT,
> +			   lower_32_bits(cpu_addr + size - 1));
> +	dw_pcie_writel_dbi(pci, PCIE_ATU_LOWER_TARGET,
> +			   lower_32_bits(pci_addr));
> +	dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_TARGET,
> +			   upper_32_bits(pci_addr));
> +	dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, type |
> +			   PCIE_ATU_FUNC_NUM(func_no));

The same here, this is identical to dw_pcie_prog_outbound_atu with the
exception of this line.

Is there a way you can avoid all of this duplicated code?

Thanks,

Andrew Murray 

> +	dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE);
> +
> +	/*
> +	 * Make sure ATU enable takes effect before any subsequent config
> +	 * and I/O accesses.
> +	 */
> +	for (retries = 0; retries < LINK_WAIT_MAX_IATU_RETRIES; retries++) {
> +		val = dw_pcie_readl_dbi(pci, PCIE_ATU_CR2);
> +		if (val & PCIE_ATU_ENABLE)
> +			return;
> +
> +		mdelay(LINK_WAIT_IATU);
> +	}
> +	dev_err(pci->dev, "Outbound iATU is not being enabled\n");
> +}
> +
>  void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index, int type,
>  			       u64 cpu_addr, u64 pci_addr, u32 size)
>  {
> @@ -252,8 +334,8 @@ static void dw_pcie_writel_ib_unroll(struct dw_pcie *pci, u32 index, u32 reg,
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
> @@ -275,8 +357,10 @@ static int dw_pcie_prog_inbound_atu_unroll(struct dw_pcie *pci, int index,
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
> @@ -297,14 +381,15 @@ static int dw_pcie_prog_inbound_atu_unroll(struct dw_pcie *pci, int index,
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
> @@ -323,9 +408,11 @@ int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, int index, int bar,
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
> index ffed084..2b291e8 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -71,9 +71,11 @@
>  #define PCIE_ATU_TYPE_IO		0x2
>  #define PCIE_ATU_TYPE_CFG0		0x4
>  #define PCIE_ATU_TYPE_CFG1		0x5
> +#define PCIE_ATU_FUNC_NUM(pf)           (pf << 20)
>  #define PCIE_ATU_CR2			0x908
>  #define PCIE_ATU_ENABLE			BIT(31)
>  #define PCIE_ATU_BAR_MODE_ENABLE	BIT(30)
> +#define PCIE_ATU_FUNC_NUM_MATCH_EN      BIT(19)
>  #define PCIE_ATU_LOWER_BASE		0x90C
>  #define PCIE_ATU_UPPER_BASE		0x910
>  #define PCIE_ATU_LIMIT			0x914
> @@ -265,8 +267,12 @@ int dw_pcie_wait_for_link(struct dw_pcie *pci);
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
> diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
> index f641bad..fc2feee 100644
> --- a/include/linux/pci-epc.h
> +++ b/include/linux/pci-epc.h
> @@ -96,6 +96,7 @@ struct pci_epc {
>  	const struct pci_epc_ops	*ops;
>  	struct pci_epc_mem		*mem;
>  	u8				max_functions;
> +	u32				pf_offset;
>  	struct config_group		*group;
>  	/* spinlock to protect against concurrent access of EP controller */
>  	spinlock_t			lock;
> -- 
> 2.9.5
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
