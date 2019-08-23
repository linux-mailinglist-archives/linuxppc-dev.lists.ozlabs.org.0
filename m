Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1169B0EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 15:28:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FMfL2pCczDr8q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 23:28:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=andrew.murray@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46FMbK5ZVQzDrfZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 23:25:30 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE5D628;
 Fri, 23 Aug 2019 06:25:28 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 150F33F718;
 Fri, 23 Aug 2019 06:25:28 -0700 (PDT)
Date: Fri, 23 Aug 2019 14:25:26 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH v2 01/10] PCI: designware-ep: Add multiple PFs support
 for DWC
Message-ID: <20190823132526.GD14582@e119886-lin.cambridge.arm.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822112242.16309-1-xiaowei.bao@nxp.com>
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
Cc: mark.rutland@arm.com, roy.zang@nxp.com, lorenzo.pieralisi@arm.co,
 arnd@arndb.de, devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, minghuan.Lian@nxp.com,
 robh+dt@kernel.org, gustavo.pimentel@synopsys.com, jingoohan1@gmail.com,
 bhelgaas@google.com, leoyang.li@nxp.com, shawnguo@kernel.org,
 mingkai.hu@nxp.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 22, 2019 at 07:22:33PM +0800, Xiaowei Bao wrote:
> Add multiple PFs support for DWC, different PF have different config space
> we use pf-offset property which get from the DTS to access the different pF
> config space.

It looks like you're missing a --cover-letter again.

> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
> v2:
>  - Remove duplicate redundant code.
>  - Reimplement the PF config space access way.
> 
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 122 ++++++++++++++++--------
>  drivers/pci/controller/dwc/pcie-designware.c    |  59 ++++++++----
>  drivers/pci/controller/dwc/pcie-designware.h    |  11 ++-
>  3 files changed, 134 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 2bf5a35..3e2b740 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -19,12 +19,17 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
>  	pci_epc_linkup(epc);
>  }
>  
> -static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar,
> -				   int flags)
> +static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, u8 func_no,
> +				   enum pci_barno bar, int flags)
>  {
>  	u32 reg;
> +	unsigned int func_offset = 0;
> +	struct dw_pcie_ep *ep = &pci->ep;
>  
> -	reg = PCI_BASE_ADDRESS_0 + (4 * bar);
> +	if (ep->ops->func_conf_select)
> +		func_offset = ep->ops->func_conf_select(ep, func_no);
> +
> +	reg = func_offset + PCI_BASE_ADDRESS_0 + (4 * bar);

This pattern of checking if func_conf_select exists and using it to get an
offset is repeated a lot throughout this file. You could move this
functionality into a new function (similar to dw_pcie_read_dbi etc). Or
perhaps a new variant of dw_pcie_writel_ should be created that writes takes
a func_no argument.
 

>  	dw_pcie_dbi_ro_wr_en(pci);
>  	dw_pcie_writel_dbi2(pci, reg, 0x0);
>  	dw_pcie_writel_dbi(pci, reg, 0x0);


> @@ -235,7 +257,7 @@ static int dw_pcie_ep_map_addr(struct pci_epc *epc, u8 func_no,
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  
> -	ret = dw_pcie_ep_outbound_atu(ep, addr, pci_addr, size);
> +	ret = dw_pcie_ep_outbound_atu(ep, func_no, addr, pci_addr, size);
>  	if (ret) {
>  		dev_err(pci->dev, "Failed to enable address\n");
>  		return ret;
> @@ -249,11 +271,15 @@ static int dw_pcie_ep_get_msi(struct pci_epc *epc, u8 func_no)
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> +	unsigned int func_offset = 0;
> +
> +	if (ep->ops->func_conf_select)
> +		func_offset = ep->ops->func_conf_select(ep, func_no);
>  
>  	if (!ep->msi_cap)
>  		return -EINVAL;
>  
> -	reg = ep->msi_cap + PCI_MSI_FLAGS;
> +	reg = ep->msi_cap + func_offset + PCI_MSI_FLAGS;

This makes me nervous.

From a PCI viewpoint, each function has it's own capability structure and
within each function there may exist a MSI capability. Yet what we're doing
here is using dw_pcie_ep_find_capability to get the list of capabilities for
function 0, and then applying offsets from that for subsequent functions. I.e.
we're applying DW specific knowledge to find the correct capability, rather
than following the general PCI approach.

I think the above hunk shouldn't be required - but instead
dw_pcie_ep_find_capability is updated to take a func_no parameter.

Have I understood this correctly?

>  	val = dw_pcie_readw_dbi(pci, reg);
>  	if (!(val & PCI_MSI_FLAGS_ENABLE))
>  		return -EINVAL;
> @@ -268,11 +294,15 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 interrupts)
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> +	unsigned int func_offset = 0;
> +
> +	if (ep->ops->func_conf_select)
> +		func_offset = ep->ops->func_conf_select(ep, func_no);
>  
>  	if (!ep->msi_cap)
>  		return -EINVAL;
>  
> -	reg = ep->msi_cap + PCI_MSI_FLAGS;
> +	reg = ep->msi_cap + func_offset + PCI_MSI_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	val &= ~PCI_MSI_FLAGS_QMASK;
>  	val |= (interrupts << 1) & PCI_MSI_FLAGS_QMASK;
> @@ -288,11 +318,15 @@ static int dw_pcie_ep_get_msix(struct pci_epc *epc, u8 func_no)
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> +	unsigned int func_offset = 0;
> +
> +	if (ep->ops->func_conf_select)
> +		func_offset = ep->ops->func_conf_select(ep, func_no);
>  
>  	if (!ep->msix_cap)
>  		return -EINVAL;
>  
> -	reg = ep->msix_cap + PCI_MSIX_FLAGS;
> +	reg = ep->msix_cap + func_offset + PCI_MSIX_FLAGS;

Same for MSIX.

>  	val = dw_pcie_readw_dbi(pci, reg);
>  	if (!(val & PCI_MSIX_FLAGS_ENABLE))
>  		return -EINVAL;
> @@ -307,11 +341,15 @@ static int dw_pcie_ep_set_msix(struct pci_epc *epc, u8 func_no, u16 interrupts)
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> +	unsigned int func_offset = 0;
> +
> +	if (ep->ops->func_conf_select)
> +		func_offset = ep->ops->func_conf_select(ep, func_no);
>  
>  	if (!ep->msix_cap)
>  		return -EINVAL;
>  
> -	reg = ep->msix_cap + PCI_MSIX_FLAGS;
> +	reg = ep->msix_cap + func_offset + PCI_MSIX_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	val &= ~PCI_MSIX_FLAGS_QSIZE;
>  	val |= interrupts;
> @@ -398,29 +436,33 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct pci_epc *epc = ep->epc;
>  	unsigned int aligned_offset;
> +	unsigned int func_offset = 0;
>  	u16 msg_ctrl, msg_data;
>  	u32 msg_addr_lower, msg_addr_upper, reg;
>  	u64 msg_addr;
>  	bool has_upper;
>  	int ret;
>  
> +	if (ep->ops->func_conf_select)
> +		func_offset = ep->ops->func_conf_select(ep, func_no);
> +

You could probably move this hunk below the test for msi_cap to save some
cycles.

>  	if (!ep->msi_cap)
>  		return -EINVAL;
>  
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



> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 7d25102..305e73d 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -158,9 +158,10 @@ static void dw_pcie_writel_ob_unroll(struct dw_pcie *pci, u32 index, u32 reg,
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
> @@ -175,7 +176,7 @@ static void dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, int index,
>  	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_TARGET,
>  				 upper_32_bits(pci_addr));
>  	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1,
> -				 type);
> +				 type | PCIE_ATU_FUNC_NUM(func_no));

Much better :)

>  	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
>  				 PCIE_ATU_ENABLE);
>  
> @@ -194,8 +195,9 @@ static void dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, int index,
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
> @@ -203,8 +205,8 @@ void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index, int type,
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


> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index ffed084..a0fdbf7 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -71,9 +71,11 @@
>  #define PCIE_ATU_TYPE_IO		0x2
>  #define PCIE_ATU_TYPE_CFG0		0x4
>  #define PCIE_ATU_TYPE_CFG1		0x5
> +#define PCIE_ATU_FUNC_NUM(pf)           (pf << 20)

"Macro argument 'pf' may be better as '(pf)' to avoid precedence issues"

>  #define PCIE_ATU_CR2			0x908
>  #define PCIE_ATU_ENABLE			BIT(31)
>  #define PCIE_ATU_BAR_MODE_ENABLE	BIT(30)
> +#define PCIE_ATU_FUNC_NUM_MATCH_EN      BIT(19)
>  #define PCIE_ATU_LOWER_BASE		0x90C
>  #define PCIE_ATU_UPPER_BASE		0x910
>  #define PCIE_ATU_LIMIT			0x914
> @@ -197,6 +199,7 @@ struct dw_pcie_ep_ops {
>  	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
>  			     enum pci_epc_irq_type type, u16 interrupt_num);
>  	const struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
> +	unsigned int (*func_conf_select)(struct dw_pcie_ep *ep, u8 func_no);

Given that this function will return an offset, I'm not sure the name you
have is suitable. Something like get_pf_offset or similar is more descriptive.

Thanks,

Andrew Murray

>  };
>  
>  struct dw_pcie_ep {
> @@ -265,8 +268,12 @@ int dw_pcie_wait_for_link(struct dw_pcie *pci);
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
