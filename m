Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C019E8CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 15:13:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hq7b71J8zDqTW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 23:13:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=andrew.murray@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46Hq4b2fL9zDq7W
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 23:10:53 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8166360;
 Tue, 27 Aug 2019 06:10:50 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C5513F246;
 Tue, 27 Aug 2019 06:10:50 -0700 (PDT)
Date: Tue, 27 Aug 2019 14:10:48 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH v2 01/10] PCI: designware-ep: Add multiple PFs support
 for DWC
Message-ID: <20190827131048.GK14582@e119886-lin.cambridge.arm.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190823132526.GD14582@e119886-lin.cambridge.arm.com>
 <AM5PR04MB32997FFCD08E2C34541D2F9BF5A40@AM5PR04MB3299.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM5PR04MB32997FFCD08E2C34541D2F9BF5A40@AM5PR04MB3299.eurprd04.prod.outlook.com>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Roy Zang <roy.zang@nxp.com>,
 "lorenzo.pieralisi@arm.co" <lorenzo.pieralisi@arm.co>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kishon@ti.com" <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>, Leo Li <leoyang.li@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 23, 2019 at 11:50:20PM +0000, Xiaowei Bao wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Murray <andrew.murray@arm.com>
> > Sent: 2019年8月23日 21:25
> > To: Xiaowei Bao <xiaowei.bao@nxp.com>
> > Cc: bhelgaas@google.com; robh+dt@kernel.org; mark.rutland@arm.com;
> > shawnguo@kernel.org; Leo Li <leoyang.li@nxp.com>; kishon@ti.com;
> > lorenzo.pieralisi@arm.co; arnd@arndb.de; gregkh@linuxfoundation.org; M.h.
> > Lian <minghuan.lian@nxp.com>; Mingkai Hu <mingkai.hu@nxp.com>; Roy
> > Zang <roy.zang@nxp.com>; jingoohan1@gmail.com;
> > gustavo.pimentel@synopsys.com; linux-pci@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linuxppc-dev@lists.ozlabs.org
> > Subject: Re: [PATCH v2 01/10] PCI: designware-ep: Add multiple PFs support
> > for DWC
> > 
> > On Thu, Aug 22, 2019 at 07:22:33PM +0800, Xiaowei Bao wrote:
> > > Add multiple PFs support for DWC, different PF have different config
> > > space we use pf-offset property which get from the DTS to access the
> > > different pF config space.
> > 
> > It looks like you're missing a --cover-letter again.
> > 
> > >
> > > Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > > ---
> > > v2:
> > >  - Remove duplicate redundant code.
> > >  - Reimplement the PF config space access way.
> > >
> > >  drivers/pci/controller/dwc/pcie-designware-ep.c | 122
> > ++++++++++++++++--------
> > >  drivers/pci/controller/dwc/pcie-designware.c    |  59 ++++++++----
> > >  drivers/pci/controller/dwc/pcie-designware.h    |  11 ++-
> > >  3 files changed, 134 insertions(+), 58 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > index 2bf5a35..3e2b740 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > @@ -19,12 +19,17 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
> > >  	pci_epc_linkup(epc);
> > >  }
> > >
> > > -static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno
> > bar,
> > > -				   int flags)
> > > +static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, u8 func_no,
> > > +				   enum pci_barno bar, int flags)
> > >  {
> > >  	u32 reg;
> > > +	unsigned int func_offset = 0;
> > > +	struct dw_pcie_ep *ep = &pci->ep;
> > >
> > > -	reg = PCI_BASE_ADDRESS_0 + (4 * bar);
> > > +	if (ep->ops->func_conf_select)
> > > +		func_offset = ep->ops->func_conf_select(ep, func_no);
> > > +
> > > +	reg = func_offset + PCI_BASE_ADDRESS_0 + (4 * bar);
> > 
> > This pattern of checking if func_conf_select exists and using it to get an offset
> > is repeated a lot throughout this file. You could move this functionality into a
> > new function (similar to dw_pcie_read_dbi etc). Or perhaps a new variant of
> > dw_pcie_writel_ should be created that writes takes a func_no argument.
> 
> Thanks for your comments, I thought about this method before, but there is a issue
> about the method of access the different func config space, due to our platform use
> this method that different func have different offset from dbi_base to access the
> different config space, but others platform maybe use the way that write a register
> to implement different func config space access, so I think reserve a callback function 

My point here was really to move out duplicated code to its own small function.
I wasn't making any comment about (removing) the callback, just that the test and
callback could be in one function.

> to different platform to implement the own method, my point is that, if use register 
> method they can implement the code in this function and return offset is 0, if use 
> offset method, they can return the offset value which can be use by dw_pcie_ep driver.

By the way, I haven't looked to see how many of the dw_pcie_write_xxx functions
would benefit from a func_no argument - if there were many calls to
dw_pcie_write_xxx that all used a reg value originated from func_conf_select
then an approach similar to the implementation of dw_pcie_write_dbi could
probably be justified (i.e. rather than change the value of reg) for writing to
functions.

>  
> > 
> > 
> > >  	dw_pcie_dbi_ro_wr_en(pci);
> > >  	dw_pcie_writel_dbi2(pci, reg, 0x0);
> > >  	dw_pcie_writel_dbi(pci, reg, 0x0);
> > 
> > 
> > > @@ -235,7 +257,7 @@ static int dw_pcie_ep_map_addr(struct pci_epc
> > *epc, u8 func_no,
> > >  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > >
> > > -	ret = dw_pcie_ep_outbound_atu(ep, addr, pci_addr, size);
> > > +	ret = dw_pcie_ep_outbound_atu(ep, func_no, addr, pci_addr, size);
> > >  	if (ret) {
> > >  		dev_err(pci->dev, "Failed to enable address\n");
> > >  		return ret;
> > > @@ -249,11 +271,15 @@ static int dw_pcie_ep_get_msi(struct pci_epc
> > *epc, u8 func_no)
> > >  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > >  	u32 val, reg;
> > > +	unsigned int func_offset = 0;
> > > +
> > > +	if (ep->ops->func_conf_select)
> > > +		func_offset = ep->ops->func_conf_select(ep, func_no);
> > >
> > >  	if (!ep->msi_cap)
> > >  		return -EINVAL;
> > >
> > > -	reg = ep->msi_cap + PCI_MSI_FLAGS;
> > > +	reg = ep->msi_cap + func_offset + PCI_MSI_FLAGS;
> > 
> > This makes me nervous.
> > 
> > From a PCI viewpoint, each function has it's own capability structure and
> > within each function there may exist a MSI capability. Yet what we're doing
> > here is using dw_pcie_ep_find_capability to get the list of capabilities for
> > function 0, and then applying offsets from that for subsequent functions. I.e.
> > we're applying DW specific knowledge to find the correct capability, rather
> > than following the general PCI approach.
> > 
> > I think the above hunk shouldn't be required - but instead
> > dw_pcie_ep_find_capability is updated to take a func_no parameter.
> > 
> > Have I understood this correctly?
> 
> Yes, this is a issue, I think the different func maybe have different capability,
> but the dw_pcie_ep_find_capability function is called by dw_pcie_ep_init 
> function, we can't add func_no parameter to dw_pcie_ep_find_capability,

Why not?

Given that 'struct dw_pcie' represents a controller - and thus potentially
multiple functions - then the _find_capability function should be able to
provide the correct offset for the given function. Surely it needs to know
which function number? Unless there is some reason why we can assume that all
functions share the same capability offset.

Also the 'struct dw_pcie_ep' which represents an endpoint controller - this
has msi_cap and msix_cap fields - given this may be a multifunction device
what do these fields actually refer to?

Perhaps Jungoo/Gustavo can comment.


> I will try to fix it use a new patch, I think move this function to ep_init callback
> function If better, thanks. 
> 
> 
> > 
> > >  	val = dw_pcie_readw_dbi(pci, reg);
> > >  	if (!(val & PCI_MSI_FLAGS_ENABLE))
> > >  		return -EINVAL;
> > > @@ -268,11 +294,15 @@ static int dw_pcie_ep_set_msi(struct pci_epc
> > *epc, u8 func_no, u8 interrupts)
> > >  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > >  	u32 val, reg;
> > > +	unsigned int func_offset = 0;
> > > +
> > > +	if (ep->ops->func_conf_select)
> > > +		func_offset = ep->ops->func_conf_select(ep, func_no);
> > >
> > >  	if (!ep->msi_cap)
> > >  		return -EINVAL;
> > >
> > > -	reg = ep->msi_cap + PCI_MSI_FLAGS;
> > > +	reg = ep->msi_cap + func_offset + PCI_MSI_FLAGS;
> > >  	val = dw_pcie_readw_dbi(pci, reg);
> > >  	val &= ~PCI_MSI_FLAGS_QMASK;
> > >  	val |= (interrupts << 1) & PCI_MSI_FLAGS_QMASK; @@ -288,11 +318,15
> > > @@ static int dw_pcie_ep_get_msix(struct pci_epc *epc, u8 func_no)
> > >  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > >  	u32 val, reg;
> > > +	unsigned int func_offset = 0;
> > > +
> > > +	if (ep->ops->func_conf_select)
> > > +		func_offset = ep->ops->func_conf_select(ep, func_no);
> > >
> > >  	if (!ep->msix_cap)
> > >  		return -EINVAL;
> > >
> > > -	reg = ep->msix_cap + PCI_MSIX_FLAGS;
> > > +	reg = ep->msix_cap + func_offset + PCI_MSIX_FLAGS;
> > 
> > Same for MSIX.
> 
> Yes.
> 
> > 
> > >  	val = dw_pcie_readw_dbi(pci, reg);
> > >  	if (!(val & PCI_MSIX_FLAGS_ENABLE))
> > >  		return -EINVAL;
> > > @@ -307,11 +341,15 @@ static int dw_pcie_ep_set_msix(struct pci_epc
> > *epc, u8 func_no, u16 interrupts)
> > >  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > >  	u32 val, reg;
> > > +	unsigned int func_offset = 0;
> > > +
> > > +	if (ep->ops->func_conf_select)
> > > +		func_offset = ep->ops->func_conf_select(ep, func_no);
> > >
> > >  	if (!ep->msix_cap)
> > >  		return -EINVAL;
> > >
> > > -	reg = ep->msix_cap + PCI_MSIX_FLAGS;
> > > +	reg = ep->msix_cap + func_offset + PCI_MSIX_FLAGS;
> > >  	val = dw_pcie_readw_dbi(pci, reg);
> > >  	val &= ~PCI_MSIX_FLAGS_QSIZE;
> > >  	val |= interrupts;
> > > @@ -398,29 +436,33 @@ int dw_pcie_ep_raise_msi_irq(struct
> > dw_pcie_ep *ep, u8 func_no,
> > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > >  	struct pci_epc *epc = ep->epc;
> > >  	unsigned int aligned_offset;
> > > +	unsigned int func_offset = 0;
> > >  	u16 msg_ctrl, msg_data;
> > >  	u32 msg_addr_lower, msg_addr_upper, reg;
> > >  	u64 msg_addr;
> > >  	bool has_upper;
> > >  	int ret;
> > >
> > > +	if (ep->ops->func_conf_select)
> > > +		func_offset = ep->ops->func_conf_select(ep, func_no);
> > > +
> > 
> > You could probably move this hunk below the test for msi_cap to save some
> > cycles.
> 
> Sorry, I didn't understand the means, please explain it detailly, thanks a lot, ^_^

If you insert the call to func_conf_select *after* the test for
!msi_cap below - then in the case where msi_cap is NULL then you will
save some CPU cycles by not bothering to call func_conf_select.


> > 
> > >  	if (!ep->msi_cap)
> > >  		return -EINVAL;
> > >
> > >  	/* Raise MSI per the PCI Local Bus Specification Revision 3.0, 6.8.1. */
> > > -	reg = ep->msi_cap + PCI_MSI_FLAGS;
> > > +	reg = ep->msi_cap + func_offset + PCI_MSI_FLAGS;
> > >  	msg_ctrl = dw_pcie_readw_dbi(pci, reg);
> > >  	has_upper = !!(msg_ctrl & PCI_MSI_FLAGS_64BIT);
> > > -	reg = ep->msi_cap + PCI_MSI_ADDRESS_LO;
> > > +	reg = ep->msi_cap + func_offset + PCI_MSI_ADDRESS_LO;
> > >  	msg_addr_lower = dw_pcie_readl_dbi(pci, reg);
> > >  	if (has_upper) {
> > > -		reg = ep->msi_cap + PCI_MSI_ADDRESS_HI;
> > > +		reg = ep->msi_cap + func_offset + PCI_MSI_ADDRESS_HI;
> > >  		msg_addr_upper = dw_pcie_readl_dbi(pci, reg);
> > > -		reg = ep->msi_cap + PCI_MSI_DATA_64;
> > > +		reg = ep->msi_cap + func_offset + PCI_MSI_DATA_64;
> > >  		msg_data = dw_pcie_readw_dbi(pci, reg);
> > >  	} else {
> > >  		msg_addr_upper = 0;
> > > -		reg = ep->msi_cap + PCI_MSI_DATA_32;
> > > +		reg = ep->msi_cap + func_offset + PCI_MSI_DATA_32;
> > >  		msg_data = dw_pcie_readw_dbi(pci, reg);
> > >  	}
> > >  	aligned_offset = msg_addr_lower & (epc->mem->page_size - 1);
> > 
> > 
> > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware.c
> > > b/drivers/pci/controller/dwc/pcie-designware.c
> > > index 7d25102..305e73d 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware.c
> > > @@ -158,9 +158,10 @@ static void dw_pcie_writel_ob_unroll(struct
> > dw_pcie *pci, u32 index, u32 reg,
> > >  	dw_pcie_writel_atu(pci, offset + reg, val);  }
> > >
> > > -static void dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, int
> > index,
> > > -					     int type, u64 cpu_addr,
> > > -					     u64 pci_addr, u32 size)
> > > +static void dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, u8
> > func_no,
> > > +					     int index, int type,
> > > +					     u64 cpu_addr, u64 pci_addr,
> > > +					     u32 size)
> > >  {
> > >  	u32 retries, val;
> > >
> > > @@ -175,7 +176,7 @@ static void
> > dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, int index,
> > >  	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_TARGET,
> > >  				 upper_32_bits(pci_addr));
> > >  	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1,
> > > -				 type);
> > > +				 type | PCIE_ATU_FUNC_NUM(func_no));
> > 
> > Much better :)
> 
> Do you mean that use the expression "a? b:c"
> 
> > 
> > >  	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
> > >  				 PCIE_ATU_ENABLE);
> > >
> > > @@ -194,8 +195,9 @@ static void
> > dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, int index,
> > >  	dev_err(pci->dev, "Outbound iATU is not being enabled\n");  }
> > >
> > > -void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index, int type,
> > > -			       u64 cpu_addr, u64 pci_addr, u32 size)
> > > +static void __dw_pcie_prog_outbound_atu(struct dw_pcie *pci, u8
> > func_no,
> > > +					int index, int type, u64 cpu_addr,
> > > +					u64 pci_addr, u32 size)
> > >  {
> > >  	u32 retries, val;
> > >
> > > @@ -203,8 +205,8 @@ void dw_pcie_prog_outbound_atu(struct dw_pcie
> > *pci, int index, int type,
> > >  		cpu_addr = pci->ops->cpu_addr_fixup(pci, cpu_addr);
> > >
> > >  	if (pci->iatu_unroll_enabled) {
> > > -		dw_pcie_prog_outbound_atu_unroll(pci, index, type, cpu_addr,
> > > -						 pci_addr, size);
> > > +		dw_pcie_prog_outbound_atu_unroll(pci, func_no, index, type,
> > > +						 cpu_addr, pci_addr, size);
> > >  		return;
> > >  	}
> > >
> > 
> > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware.h
> > > b/drivers/pci/controller/dwc/pcie-designware.h
> > > index ffed084..a0fdbf7 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > > @@ -71,9 +71,11 @@
> > >  #define PCIE_ATU_TYPE_IO		0x2
> > >  #define PCIE_ATU_TYPE_CFG0		0x4
> > >  #define PCIE_ATU_TYPE_CFG1		0x5
> > > +#define PCIE_ATU_FUNC_NUM(pf)           (pf << 20)
> > 
> > "Macro argument 'pf' may be better as '(pf)' to avoid precedence issues"
> > 
> > >  #define PCIE_ATU_CR2			0x908
> > >  #define PCIE_ATU_ENABLE			BIT(31)
> > >  #define PCIE_ATU_BAR_MODE_ENABLE	BIT(30)
> > > +#define PCIE_ATU_FUNC_NUM_MATCH_EN      BIT(19)
> > >  #define PCIE_ATU_LOWER_BASE		0x90C
> > >  #define PCIE_ATU_UPPER_BASE		0x910
> > >  #define PCIE_ATU_LIMIT			0x914
> > > @@ -197,6 +199,7 @@ struct dw_pcie_ep_ops {
> > >  	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
> > >  			     enum pci_epc_irq_type type, u16 interrupt_num);
> > >  	const struct pci_epc_features* (*get_features)(struct dw_pcie_ep
> > > *ep);
> > > +	unsigned int (*func_conf_select)(struct dw_pcie_ep *ep, u8 func_no);
> > 
> > Given that this function will return an offset, I'm not sure the name you have
> > is suitable. Something like get_pf_offset or similar is more descriptive.
> 
> As above explain, my initial view is that this function can return 0 or offset depends on
> the platform implement mechanism, so I named it func_conf_select, I think add a
> comment for this function, like this:
> /*
>  * provide a method to implement the method of different func config space access,
>  * if use offset method, return the offset from dbi_base, if your register method, implement
>  * the code in this callback function and return 0.
>  */
> How about it?

This means that func_conf_select can never (easily) indicate an error to the
caller as this would change the offset. Where func_conf_select doesn't change
the offset there probably isn't much else it can do instead (unless it was
responsible for doing the write as well). So I'm not sure how well this approach
works.

Thanks,

Andrew Murray

> 
> > 
> > Thanks,
> > 
> > Andrew Murray
> > 
> > >  };
> > >
> > >  struct dw_pcie_ep {
> > > @@ -265,8 +268,12 @@ int dw_pcie_wait_for_link(struct dw_pcie *pci);
> > > void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index,
> > >  			       int type, u64 cpu_addr, u64 pci_addr,
> > >  			       u32 size);
> > > -int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, int index, int bar,
> > > -			     u64 cpu_addr, enum dw_pcie_as_type as_type);
> > > +void dw_pcie_prog_ep_outbound_atu(struct dw_pcie *pci, u8 func_no, int
> > index,
> > > +				  int type, u64 cpu_addr, u64 pci_addr,
> > > +				  u32 size);
> > > +int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, u8 func_no, int index,
> > > +			     int bar, u64 cpu_addr,
> > > +			     enum dw_pcie_as_type as_type);
> > >  void dw_pcie_disable_atu(struct dw_pcie *pci, int index,
> > >  			 enum dw_pcie_region_type type);
> > >  void dw_pcie_setup(struct dw_pcie *pci);
> > > --
> > > 2.9.5
> > >
