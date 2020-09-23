Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED162761DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 22:17:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxTxk67tMzDqT7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 06:17:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=S87XfJac; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxTw25qVyzDqND
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 06:16:18 +1000 (AEST)
Received: from localhost (52.sub-72-107-123.myvzw.com [72.107.123.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1FA17206D9;
 Wed, 23 Sep 2020 20:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600892175;
 bh=kBHE5F+4sQBEEv3YvIGz5yx2kVnlkeU6BE+dWdGgrq4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=S87XfJac/gD+PaUViJsXXG0/Cvc29LXJXaQ7+NpltSUREgXOQhTRO28AuP1k5MHDg
 Z1D40tf9Y8Rua7Vq3cDYVUtJ8k2XICRbE6AOMrw5T+RsoVwOhDA0QxzViS+HPCFA4S
 4HfmzYberjKoX8B0KzUm3I8lWupEVDNn9a0gdpJQ=
Date: Wed, 23 Sep 2020 15:16:13 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH v6 04/11] PCI: designware-ep: Modify MSI and MSIX CAP way
 of finding
Message-ID: <20200923201613.GA2291357@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200314033038.24844-5-xiaowei.bao@nxp.com>
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
Cc: roy.zang@nxp.com, lorenzo.pieralisi@arm.com, devicetree@vger.kernel.org,
 jingoohan1@gmail.com, Zhiqiang.Hou@nxp.com, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 Minghuan.Lian@nxp.com, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, gustavo.pimentel@synopsys.com,
 bhelgaas@google.com, andrew.murray@arm.com, kishon@ti.com, shawnguo@kernel.org,
 mingkai.hu@nxp.com, amurray@thegoodpenguin.co.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

s/MSIX/MSI-X/ (subject and below)

On Sat, Mar 14, 2020 at 11:30:31AM +0800, Xiaowei Bao wrote:
> Each PF of EP device should have it's own MSI or MSIX capabitily
> struct, so create a dw_pcie_ep_func struct and remove the msi_cap
> and msix_cap to this struct from dw_pcie_ep, and manage the PFs
> with a list.

s/capabitily/capability/

I know Lorenzo has already applied this, but for the future, or
in case there are other reasons to update this patch.

There are a bunch of unnecessary initializations below for future
cleanup.

> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
> v3:
>  - This is a new patch, to fix the issue of MSI and MSIX CAP way of
>    finding.
> v4:
>  - Correct some word of commit message.
> v5:
>  - No change.
> v6:
>  - Fix up the compile error.
> 
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 135 +++++++++++++++++++++---
>  drivers/pci/controller/dwc/pcie-designware.h    |  18 +++-
>  2 files changed, 134 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 933bb89..fb915f2 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -19,6 +19,19 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
>  	pci_epc_linkup(epc);
>  }
>  
> +struct dw_pcie_ep_func *
> +dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no)
> +{
> +	struct dw_pcie_ep_func *ep_func;
> +
> +	list_for_each_entry(ep_func, &ep->func_list, list) {
> +		if (ep_func->func_no == func_no)
> +			return ep_func;
> +	}
> +
> +	return NULL;
> +}
> +
>  static unsigned int dw_pcie_ep_func_select(struct dw_pcie_ep *ep, u8 func_no)
>  {
>  	unsigned int func_offset = 0;
> @@ -59,6 +72,47 @@ void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
>  		__dw_pcie_ep_reset_bar(pci, func_no, bar, 0);
>  }
>  
> +static u8 __dw_pcie_ep_find_next_cap(struct dw_pcie_ep *ep, u8 func_no,
> +		u8 cap_ptr, u8 cap)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	unsigned int func_offset = 0;

Unnecessary initialization.

> +	u8 cap_id, next_cap_ptr;
> +	u16 reg;
> +
> +	if (!cap_ptr)
> +		return 0;
> +
> +	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +
> +	reg = dw_pcie_readw_dbi(pci, func_offset + cap_ptr);
> +	cap_id = (reg & 0x00ff);
> +
> +	if (cap_id > PCI_CAP_ID_MAX)
> +		return 0;
> +
> +	if (cap_id == cap)
> +		return cap_ptr;
> +
> +	next_cap_ptr = (reg & 0xff00) >> 8;
> +	return __dw_pcie_ep_find_next_cap(ep, func_no, next_cap_ptr, cap);
> +}
> +
> +static u8 dw_pcie_ep_find_capability(struct dw_pcie_ep *ep, u8 func_no, u8 cap)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	unsigned int func_offset = 0;

Unnecessary initialization.

> +	u8 next_cap_ptr;
> +	u16 reg;
> +
> +	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +
> +	reg = dw_pcie_readw_dbi(pci, func_offset + PCI_CAPABILITY_LIST);
> +	next_cap_ptr = (reg & 0x00ff);
> +
> +	return __dw_pcie_ep_find_next_cap(ep, func_no, next_cap_ptr, cap);
> +}
> +
>  static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no,
>  				   struct pci_epf_header *hdr)
>  {
> @@ -246,13 +300,18 @@ static int dw_pcie_ep_get_msi(struct pci_epc *epc, u8 func_no)
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
>  	unsigned int func_offset = 0;

Unnecessary initialization (not from your patch).

> +	struct dw_pcie_ep_func *ep_func;
>  
> -	if (!ep->msi_cap)
> +	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
> +	if (!ep_func)
> +		return -EINVAL;
> +
> +	if (!ep_func->msi_cap)
>  		return -EINVAL;
>  
>  	func_offset = dw_pcie_ep_func_select(ep, func_no);
>  
> -	reg = ep->msi_cap + func_offset + PCI_MSI_FLAGS;
> +	reg = ep_func->msi_cap + func_offset + PCI_MSI_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	if (!(val & PCI_MSI_FLAGS_ENABLE))
>  		return -EINVAL;
> @@ -268,13 +327,18 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 interrupts)
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
>  	unsigned int func_offset = 0;

Unnecessary initialization (not from your patch).

> +	struct dw_pcie_ep_func *ep_func;
> +
> +	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
> +	if (!ep_func)
> +		return -EINVAL;
>  
> -	if (!ep->msi_cap)
> +	if (!ep_func->msi_cap)
>  		return -EINVAL;
>  
>  	func_offset = dw_pcie_ep_func_select(ep, func_no);
>  
> -	reg = ep->msi_cap + func_offset + PCI_MSI_FLAGS;
> +	reg = ep_func->msi_cap + func_offset + PCI_MSI_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	val &= ~PCI_MSI_FLAGS_QMASK;
>  	val |= (interrupts << 1) & PCI_MSI_FLAGS_QMASK;
> @@ -291,13 +355,18 @@ static int dw_pcie_ep_get_msix(struct pci_epc *epc, u8 func_no)
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
>  	unsigned int func_offset = 0;

Unnecessary initialization (not from your patch).

> +	struct dw_pcie_ep_func *ep_func;
> +
> +	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
> +	if (!ep_func)
> +		return -EINVAL;
>  
> -	if (!ep->msix_cap)
> +	if (!ep_func->msix_cap)
>  		return -EINVAL;
>  
>  	func_offset = dw_pcie_ep_func_select(ep, func_no);
>  
> -	reg = ep->msix_cap + func_offset + PCI_MSIX_FLAGS;
> +	reg = ep_func->msix_cap + func_offset + PCI_MSIX_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	if (!(val & PCI_MSIX_FLAGS_ENABLE))
>  		return -EINVAL;
> @@ -313,13 +382,18 @@ static int dw_pcie_ep_set_msix(struct pci_epc *epc, u8 func_no, u16 interrupts)
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
>  	unsigned int func_offset = 0;

Unnecessary initialization (not from your patch).

> +	struct dw_pcie_ep_func *ep_func;
>  
> -	if (!ep->msix_cap)
> +	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
> +	if (!ep_func)
> +		return -EINVAL;
> +
> +	if (!ep_func->msix_cap)
>  		return -EINVAL;
>  
>  	func_offset = dw_pcie_ep_func_select(ep, func_no);
>  
> -	reg = ep->msix_cap + func_offset + PCI_MSIX_FLAGS;
> +	reg = ep_func->msix_cap + func_offset + PCI_MSIX_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	val &= ~PCI_MSIX_FLAGS_QSIZE;
>  	val |= interrupts;
> @@ -404,6 +478,7 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  			     u8 interrupt_num)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	struct dw_pcie_ep_func *ep_func;
>  	struct pci_epc *epc = ep->epc;
>  	unsigned int aligned_offset;
>  	unsigned int func_offset = 0;

Unnecessary initialization (not from your patch).

> @@ -413,25 +488,29 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	bool has_upper;
>  	int ret;
>  
> -	if (!ep->msi_cap)
> +	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
> +	if (!ep_func)
> +		return -EINVAL;
> +
> +	if (!ep_func->msi_cap)
>  		return -EINVAL;
>  
>  	func_offset = dw_pcie_ep_func_select(ep, func_no);
>  
>  	/* Raise MSI per the PCI Local Bus Specification Revision 3.0, 6.8.1. */
> -	reg = ep->msi_cap + func_offset + PCI_MSI_FLAGS;
> +	reg = ep_func->msi_cap + func_offset + PCI_MSI_FLAGS;
>  	msg_ctrl = dw_pcie_readw_dbi(pci, reg);
>  	has_upper = !!(msg_ctrl & PCI_MSI_FLAGS_64BIT);
> -	reg = ep->msi_cap + func_offset + PCI_MSI_ADDRESS_LO;
> +	reg = ep_func->msi_cap + func_offset + PCI_MSI_ADDRESS_LO;
>  	msg_addr_lower = dw_pcie_readl_dbi(pci, reg);
>  	if (has_upper) {
> -		reg = ep->msi_cap + func_offset + PCI_MSI_ADDRESS_HI;
> +		reg = ep_func->msi_cap + func_offset + PCI_MSI_ADDRESS_HI;
>  		msg_addr_upper = dw_pcie_readl_dbi(pci, reg);
> -		reg = ep->msi_cap + func_offset + PCI_MSI_DATA_64;
> +		reg = ep_func->msi_cap + func_offset + PCI_MSI_DATA_64;
>  		msg_data = dw_pcie_readw_dbi(pci, reg);
>  	} else {
>  		msg_addr_upper = 0;
> -		reg = ep->msi_cap + func_offset + PCI_MSI_DATA_32;
> +		reg = ep_func->msi_cap + func_offset + PCI_MSI_DATA_32;
>  		msg_data = dw_pcie_readw_dbi(pci, reg);
>  	}
>  	aligned_offset = msg_addr_lower & (epc->mem->page_size - 1);
> @@ -467,6 +546,7 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  			      u16 interrupt_num)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	struct dw_pcie_ep_func *ep_func;
>  	struct pci_epc *epc = ep->epc;
>  	u16 tbl_offset, bir;
>  	unsigned int func_offset = 0;

Unnecessary initialization (not from your patch).

> @@ -477,9 +557,16 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	void __iomem *msix_tbl;
>  	int ret;
>  
> +	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
> +	if (!ep_func)
> +		return -EINVAL;
> +
> +	if (!ep_func->msix_cap)
> +		return -EINVAL;
> +
>  	func_offset = dw_pcie_ep_func_select(ep, func_no);
>  
> -	reg = ep->msix_cap + func_offset + PCI_MSIX_TABLE;
> +	reg = ep_func->msix_cap + func_offset + PCI_MSIX_TABLE;
>  	tbl_offset = dw_pcie_readl_dbi(pci, reg);
>  	bir = (tbl_offset & PCI_MSIX_TABLE_BIR);
>  	tbl_offset &= PCI_MSIX_TABLE_OFFSET;
> @@ -558,6 +645,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  	int i;
>  	int ret;
>  	u32 reg;
> +	u8 func_no;
>  	void *addr;
>  	u8 hdr_type;
>  	unsigned int nbars;
> @@ -566,6 +654,9 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct device *dev = pci->dev;
>  	struct device_node *np = dev->of_node;
> +	struct dw_pcie_ep_func *ep_func;
> +
> +	INIT_LIST_HEAD(&ep->func_list);
>  
>  	if (!pci->dbi_base || !pci->dbi_base2) {
>  		dev_err(dev, "dbi_base/dbi_base2 is not populated\n");
> @@ -632,9 +723,19 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  	if (ret < 0)
>  		epc->max_functions = 1;
>  
> -	ep->msi_cap = dw_pcie_find_capability(pci, PCI_CAP_ID_MSI);
> +	for (func_no = 0; func_no < epc->max_functions; func_no++) {
> +		ep_func = devm_kzalloc(dev, sizeof(*ep_func), GFP_KERNEL);
> +		if (!ep_func)
> +			return -ENOMEM;
>  
> -	ep->msix_cap = dw_pcie_find_capability(pci, PCI_CAP_ID_MSIX);
> +		ep_func->func_no = func_no;
> +		ep_func->msi_cap = dw_pcie_ep_find_capability(ep, func_no,
> +							      PCI_CAP_ID_MSI);
> +		ep_func->msix_cap = dw_pcie_ep_find_capability(ep, func_no,
> +							       PCI_CAP_ID_MSIX);
> +
> +		list_add_tail(&ep_func->list, &ep->func_list);
> +	}
>  
>  	if (ep->ops->ep_init)
>  		ep->ops->ep_init(ep);
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index cb32afa..dd9b7b4 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -230,8 +230,16 @@ struct dw_pcie_ep_ops {
>  	unsigned int (*func_conf_select)(struct dw_pcie_ep *ep, u8 func_no);
>  };
>  
> +struct dw_pcie_ep_func {
> +	struct list_head	list;
> +	u8			func_no;
> +	u8			msi_cap;	/* MSI capability offset */
> +	u8			msix_cap;	/* MSI-X capability offset */
> +};
> +
>  struct dw_pcie_ep {
>  	struct pci_epc		*epc;
> +	struct list_head	func_list;
>  	const struct dw_pcie_ep_ops *ops;
>  	phys_addr_t		phys_base;
>  	size_t			addr_size;
> @@ -244,8 +252,6 @@ struct dw_pcie_ep {
>  	u32			num_ob_windows;
>  	void __iomem		*msi_mem;
>  	phys_addr_t		msi_mem_phys;
> -	u8			msi_cap;	/* MSI capability offset */
> -	u8			msix_cap;	/* MSI-X capability offset */
>  };
>  
>  struct dw_pcie_ops {
> @@ -437,6 +443,8 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep, u8 func_no,
>  				       u16 interrupt_num);
>  void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar);
> +struct dw_pcie_ep_func *
> +dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no);
>  #else
>  static inline void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
>  {
> @@ -478,5 +486,11 @@ static inline int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep,
>  static inline void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
>  {
>  }
> +
> +static inline struct dw_pcie_ep_func *
> +dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no)
> +{
> +	return NULL;
> +}
>  #endif
>  #endif /* _PCIE_DESIGNWARE_H */
> -- 
> 2.9.5
> 
