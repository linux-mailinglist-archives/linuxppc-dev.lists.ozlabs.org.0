Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D93901CD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 14:40:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4692w13SgJzDqrn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 22:40:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=andrew.murray@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4692ps49VYzDrYj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 22:35:31 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F8D7344;
 Fri, 16 Aug 2019 05:35:28 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB9103F706;
 Fri, 16 Aug 2019 05:35:26 -0700 (PDT)
Date: Fri, 16 Aug 2019 13:35:24 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH 01/10] PCI: designware-ep: Add multiple PFs support for DWC
Message-ID: <20190816123524.GE14111@e119886-lin.cambridge.arm.com>
References: <20190815083716.4715-1-xiaowei.bao@nxp.com>
 <20190815113129.GF43882@e119886-lin.cambridge.arm.com>
 <AM5PR04MB3299396885AC4B54B9E8D0AEF5AF0@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <20190816094449.GA14111@e119886-lin.cambridge.arm.com>
 <AM5PR04MB32997C516770A0555970330BF5AF0@AM5PR04MB3299.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM5PR04MB32997C516770A0555970330BF5AF0@AM5PR04MB3299.eurprd04.prod.outlook.com>
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
 "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "Z.q. Hou" <zhiqiang.hou@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kishon@ti.com" <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 Leo Li <leoyang.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 16, 2019 at 11:00:01AM +0000, Xiaowei Bao wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Murray <andrew.murray@arm.com>
> > Sent: 2019年8月16日 17:45
> > To: Xiaowei Bao <xiaowei.bao@nxp.com>
> > Cc: jingoohan1@gmail.com; gustavo.pimentel@synopsys.com;
> > mark.rutland@arm.com; shawnguo@kernel.org; Leo Li
> > <leoyang.li@nxp.com>; kishon@ti.com; lorenzo.pieralisi@arm.com;
> > arnd@arndb.de; gregkh@linuxfoundation.org; M.h. Lian
> > <minghuan.lian@nxp.com>; Roy Zang <roy.zang@nxp.com>;
> > linux-pci@vger.kernel.org; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linuxppc-dev@lists.ozlabs.org; Z.q. Hou <zhiqiang.hou@nxp.com>
> > Subject: Re: [PATCH 01/10] PCI: designware-ep: Add multiple PFs support for
> > DWC
> > 
> > On Fri, Aug 16, 2019 at 02:55:41AM +0000, Xiaowei Bao wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Andrew Murray <andrew.murray@arm.com>
> > > > Sent: 2019年8月15日 19:32
> > > > To: Xiaowei Bao <xiaowei.bao@nxp.com>
> > > > Cc: jingoohan1@gmail.com; gustavo.pimentel@synopsys.com;
> > > > bhelgaas@google.com; robh+dt@kernel.org; mark.rutland@arm.com;
> > > > shawnguo@kernel.org; Leo Li <leoyang.li@nxp.com>; kishon@ti.com;
> > > > lorenzo.pieralisi@arm.com; arnd@arndb.de;
> > > > gregkh@linuxfoundation.org; M.h. Lian <minghuan.lian@nxp.com>;
> > > > Mingkai Hu <mingkai.hu@nxp.com>; Roy Zang <roy.zang@nxp.com>;
> > > > linux-pci@vger.kernel.org; devicetree@vger.kernel.org;
> > > > linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > > > linuxppc-dev@lists.ozlabs.org
> > > > Subject: Re: [PATCH 01/10] PCI: designware-ep: Add multiple PFs
> > > > support for DWC
> > > >
> > > > On Thu, Aug 15, 2019 at 04:37:07PM +0800, Xiaowei Bao wrote:
> > > > > Add multiple PFs support for DWC, different PF have different
> > > > > config space, we use pf-offset property which get from the DTS to
> > > > > access the different pF config space.
> > > >
> > > > Thanks for the patch. I haven't seen a cover letter for this series,
> > > > is there one missing?
> > > Maybe I miss, I will add you to review next time, thanks a lot for your
> > comments.
> > > >
> > > >
> > > > >
> > > > > Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > > > > ---
> > > > >  drivers/pci/controller/dwc/pcie-designware-ep.c |  97
> > > > +++++++++++++---------
> > > > >  drivers/pci/controller/dwc/pcie-designware.c    | 105
> > > > ++++++++++++++++++++++--
> > > > >  drivers/pci/controller/dwc/pcie-designware.h    |  10 ++-
> > > > >  include/linux/pci-epc.h                         |   1 +
> > > > >  4 files changed, 164 insertions(+), 49 deletions(-)
> > > > >
> > > > > diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > > > b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > > > index 2bf5a35..75e2955 100644
> > > > > --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > > > +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > > > @@ -19,12 +19,14 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep
> > *ep)
> > > > >  	pci_epc_linkup(epc);
> > > > >  }
> > > > >
> > > > > -static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum
> > > > > pci_barno
> > > > bar,
> > > > > -				   int flags)
> > > > > +static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, u8 func_no,
> > > > > +				   enum pci_barno bar, int flags)
> > > > >  {
> > > > >  	u32 reg;
> > > > > +	struct pci_epc *epc = pci->ep.epc;
> > > > > +	u32 pf_base = func_no * epc->pf_offset;
> > > > >
> > > > > -	reg = PCI_BASE_ADDRESS_0 + (4 * bar);
> > > > > +	reg = pf_base + PCI_BASE_ADDRESS_0 + (4 * bar);
> > > >
> > > > I think I'd rather see this arithmetic (and the one for determining
> > > > pf_base) inside a macro or inline header function. This would make
> > > > this code more readable and reduce the chances of an error by avoiding
> > duplication of code.
> > > >
> > > > For example look at cdns_pcie_ep_fn_writeb and
> > > > ROCKCHIP_PCIE_EP_FUNC_BASE for examples of other EP drivers that do
> > > > this.
> > > Agree, this looks fine, thanks a lot for your comments, I will use
> > > this way to access the registers in next version patch.
> > > >
> > > >
> > > > >  	dw_pcie_dbi_ro_wr_en(pci);
> > > > >  	dw_pcie_writel_dbi2(pci, reg, 0x0);
> > > > >  	dw_pcie_writel_dbi(pci, reg, 0x0); @@ -37,7 +39,12 @@ static
> > > > > void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno
> > > > > bar,
> > > > >
> > > > >  void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
> > {
> > > > > -	__dw_pcie_ep_reset_bar(pci, bar, 0);
> > > > > +	u8 func_no, funcs;
> > > > > +
> > > > > +	funcs = pci->ep.epc->max_functions;
> > > > > +
> > > > > +	for (func_no = 0; func_no < funcs; func_no++)
> > > > > +		__dw_pcie_ep_reset_bar(pci, func_no, bar, 0);
> > > > >  }
> > > > >
> > > > >  static u8 __dw_pcie_ep_find_next_cap(struct dw_pcie *pci, u8
> > > > > cap_ptr, @@ -78,28 +85,29 @@ static int
> > > > > dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no,  {
> > > > >  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> > > > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > > > +	u32 pf_base = func_no * epc->pf_offset;
> > > > >
> > > > >  	dw_pcie_dbi_ro_wr_en(pci);
> > > > > -	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, hdr->vendorid);
> > > > > -	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, hdr->deviceid);
> > > > > -	dw_pcie_writeb_dbi(pci, PCI_REVISION_ID, hdr->revid);
> > > > > -	dw_pcie_writeb_dbi(pci, PCI_CLASS_PROG, hdr->progif_code);
> > > > > -	dw_pcie_writew_dbi(pci, PCI_CLASS_DEVICE,
> > > > > +	dw_pcie_writew_dbi(pci, pf_base + PCI_VENDOR_ID,
> > hdr->vendorid);
> > > > > +	dw_pcie_writew_dbi(pci, pf_base + PCI_DEVICE_ID, hdr->deviceid);
> > > > > +	dw_pcie_writeb_dbi(pci, pf_base + PCI_REVISION_ID, hdr->revid);
> > > > > +	dw_pcie_writeb_dbi(pci, pf_base + PCI_CLASS_PROG,
> > hdr->progif_code);
> > > > > +	dw_pcie_writew_dbi(pci, pf_base + PCI_CLASS_DEVICE,
> > > > >  			   hdr->subclass_code | hdr->baseclass_code << 8);
> > > > > -	dw_pcie_writeb_dbi(pci, PCI_CACHE_LINE_SIZE,
> > > > > +	dw_pcie_writeb_dbi(pci, pf_base + PCI_CACHE_LINE_SIZE,
> > > > >  			   hdr->cache_line_size);
> > > > > -	dw_pcie_writew_dbi(pci, PCI_SUBSYSTEM_VENDOR_ID,
> > > > > +	dw_pcie_writew_dbi(pci, pf_base + PCI_SUBSYSTEM_VENDOR_ID,
> > > > >  			   hdr->subsys_vendor_id);
> > > > > -	dw_pcie_writew_dbi(pci, PCI_SUBSYSTEM_ID, hdr->subsys_id);
> > > > > -	dw_pcie_writeb_dbi(pci, PCI_INTERRUPT_PIN,
> > > > > +	dw_pcie_writew_dbi(pci, pf_base + PCI_SUBSYSTEM_ID,
> > > > hdr->subsys_id);
> > > > > +	dw_pcie_writeb_dbi(pci, pf_base + PCI_INTERRUPT_PIN,
> > > > >  			   hdr->interrupt_pin);
> > > > >  	dw_pcie_dbi_ro_wr_dis(pci);
> > > > >
> > > > >  	return 0;
> > > > >  }
> > > > >
> > > > > -static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, enum
> > > > pci_barno bar,
> > > > > -				  dma_addr_t cpu_addr,
> > > > > +static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8
> > func_no,
> > > > > +				  enum pci_barno bar, dma_addr_t cpu_addr,
> > > > >  				  enum dw_pcie_as_type as_type)  {
> > > > >  	int ret;
> > > > > @@ -112,7 +120,7 @@ static int dw_pcie_ep_inbound_atu(struct
> > > > dw_pcie_ep *ep, enum pci_barno bar,
> > > > >  		return -EINVAL;
> > > > >  	}
> > > > >
> > > > > -	ret = dw_pcie_prog_inbound_atu(pci, free_win, bar, cpu_addr,
> > > > > +	ret = dw_pcie_prog_inbound_atu(pci, func_no, free_win, bar,
> > > > > +cpu_addr,
> > > > >  				       as_type);
> > > > >  	if (ret < 0) {
> > > > >  		dev_err(pci->dev, "Failed to program IB window\n"); @@
> > -125,7
> > > > > +133,8 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep,
> > > > enum pci_barno bar,
> > > > >  	return 0;
> > > > >  }
> > > > >
> > > > > -static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep,
> > > > > phys_addr_t phys_addr,
> > > > > +static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep, u8
> > func_no,
> > > > > +				   phys_addr_t phys_addr,
> > > > >  				   u64 pci_addr, size_t size)  {
> > > > >  	u32 free_win;
> > > > > @@ -137,8 +146,8 @@ static int dw_pcie_ep_outbound_atu(struct
> > > > dw_pcie_ep *ep, phys_addr_t phys_addr,
> > > > >  		return -EINVAL;
> > > > >  	}
> > > > >
> > > > > -	dw_pcie_prog_outbound_atu(pci, free_win, PCIE_ATU_TYPE_MEM,
> > > > > -				  phys_addr, pci_addr, size);
> > > > > +	dw_pcie_prog_ep_outbound_atu(pci, func_no, free_win,
> > > > PCIE_ATU_TYPE_MEM,
> > > > > +				     phys_addr, pci_addr, size);
> > > > >
> > > > >  	set_bit(free_win, ep->ob_window_map);
> > > > >  	ep->outbound_addr[free_win] = phys_addr; @@ -154,7 +163,7
> > @@
> > > > static
> > > > > void dw_pcie_ep_clear_bar(struct pci_epc *epc, u8 func_no,
> > > > >  	enum pci_barno bar = epf_bar->barno;
> > > > >  	u32 atu_index = ep->bar_to_atu[bar];
> > > > >
> > > > > -	__dw_pcie_ep_reset_bar(pci, bar, epf_bar->flags);
> > > > > +	__dw_pcie_ep_reset_bar(pci, func_no, bar, epf_bar->flags);
> > > > >
> > > > >  	dw_pcie_disable_atu(pci, atu_index,
> > DW_PCIE_REGION_INBOUND);
> > > > >  	clear_bit(atu_index, ep->ib_window_map); @@ -170,14 +179,16
> > @@
> > > > > static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no,
> > > > >  	size_t size = epf_bar->size;
> > > > >  	int flags = epf_bar->flags;
> > > > >  	enum dw_pcie_as_type as_type;
> > > > > -	u32 reg = PCI_BASE_ADDRESS_0 + (4 * bar);
> > > > > +	u32 pf_base = func_no * epc->pf_offset;
> > > > > +	u32 reg = PCI_BASE_ADDRESS_0 + (4 * bar) + pf_base;
> > > > >
> > > > >  	if (!(flags & PCI_BASE_ADDRESS_SPACE))
> > > > >  		as_type = DW_PCIE_AS_MEM;
> > > > >  	else
> > > > >  		as_type = DW_PCIE_AS_IO;
> > > > >
> > > > > -	ret = dw_pcie_ep_inbound_atu(ep, bar, epf_bar->phys_addr,
> > as_type);
> > > > > +	ret = dw_pcie_ep_inbound_atu(ep, func_no, bar,
> > > > > +				     epf_bar->phys_addr, as_type);
> > > > >  	if (ret)
> > > > >  		return ret;
> > > > >
> > > > > @@ -235,7 +246,7 @@ static int dw_pcie_ep_map_addr(struct pci_epc
> > > > *epc, u8 func_no,
> > > > >  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> > > > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > > >
> > > > > -	ret = dw_pcie_ep_outbound_atu(ep, addr, pci_addr, size);
> > > > > +	ret = dw_pcie_ep_outbound_atu(ep, func_no, addr, pci_addr,
> > > > > +size);
> > > > >  	if (ret) {
> > > > >  		dev_err(pci->dev, "Failed to enable address\n");
> > > > >  		return ret;
> > > > > @@ -248,12 +259,13 @@ static int dw_pcie_ep_get_msi(struct pci_epc
> > > > > *epc, u8 func_no)  {
> > > > >  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> > > > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > > > +	u32 pf_base = func_no * epc->pf_offset;
> > > > >  	u32 val, reg;
> > > > >
> > > > >  	if (!ep->msi_cap)
> > > > >  		return -EINVAL;
> > > > >
> > > > > -	reg = ep->msi_cap + PCI_MSI_FLAGS;
> > > > > +	reg = ep->msi_cap + pf_base + PCI_MSI_FLAGS;
> > > > >  	val = dw_pcie_readw_dbi(pci, reg);
> > > > >  	if (!(val & PCI_MSI_FLAGS_ENABLE))
> > > > >  		return -EINVAL;
> > > > > @@ -267,12 +279,13 @@ static int dw_pcie_ep_set_msi(struct pci_epc
> > > > > *epc, u8 func_no, u8 interrupts)  {
> > > > >  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> > > > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > > > +	u32 pf_base = func_no * epc->pf_offset;
> > > > >  	u32 val, reg;
> > > > >
> > > > >  	if (!ep->msi_cap)
> > > > >  		return -EINVAL;
> > > > >
> > > > > -	reg = ep->msi_cap + PCI_MSI_FLAGS;
> > > > > +	reg = ep->msi_cap + pf_base + PCI_MSI_FLAGS;
> > > > >  	val = dw_pcie_readw_dbi(pci, reg);
> > > > >  	val &= ~PCI_MSI_FLAGS_QMASK;
> > > > >  	val |= (interrupts << 1) & PCI_MSI_FLAGS_QMASK; @@ -287,12
> > > > > +300,13 @@ static int dw_pcie_ep_get_msix(struct pci_epc *epc, u8
> > func_no)  {
> > > > >  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> > > > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > > > +	u32 pf_base = func_no * epc->pf_offset;
> > > > >  	u32 val, reg;
> > > > >
> > > > >  	if (!ep->msix_cap)
> > > > >  		return -EINVAL;
> > > > >
> > > > > -	reg = ep->msix_cap + PCI_MSIX_FLAGS;
> > > > > +	reg = ep->msix_cap + pf_base + PCI_MSIX_FLAGS;
> > > > >  	val = dw_pcie_readw_dbi(pci, reg);
> > > > >  	if (!(val & PCI_MSIX_FLAGS_ENABLE))
> > > > >  		return -EINVAL;
> > > > > @@ -306,12 +320,13 @@ static int dw_pcie_ep_set_msix(struct
> > > > > pci_epc *epc, u8 func_no, u16 interrupts)  {
> > > > >  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> > > > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > > > +	u32 pf_base = func_no * epc->pf_offset;
> > > > >  	u32 val, reg;
> > > > >
> > > > >  	if (!ep->msix_cap)
> > > > >  		return -EINVAL;
> > > > >
> > > > > -	reg = ep->msix_cap + PCI_MSIX_FLAGS;
> > > > > +	reg = ep->msix_cap + pf_base + PCI_MSIX_FLAGS;
> > > > >  	val = dw_pcie_readw_dbi(pci, reg);
> > > > >  	val &= ~PCI_MSIX_FLAGS_QSIZE;
> > > > >  	val |= interrupts;
> > > > > @@ -400,6 +415,7 @@ int dw_pcie_ep_raise_msi_irq(struct
> > dw_pcie_ep
> > > > *ep, u8 func_no,
> > > > >  	unsigned int aligned_offset;
> > > > >  	u16 msg_ctrl, msg_data;
> > > > >  	u32 msg_addr_lower, msg_addr_upper, reg;
> > > > > +	u32 pf_base = func_no * epc->pf_offset;
> > > > >  	u64 msg_addr;
> > > > >  	bool has_upper;
> > > > >  	int ret;
> > > > > @@ -408,19 +424,19 @@ int dw_pcie_ep_raise_msi_irq(struct
> > > > dw_pcie_ep *ep, u8 func_no,
> > > > >  		return -EINVAL;
> > > > >
> > > > >  	/* Raise MSI per the PCI Local Bus Specification Revision 3.0, 6.8.1.
> > */
> > > > > -	reg = ep->msi_cap + PCI_MSI_FLAGS;
> > > > > +	reg = ep->msi_cap + pf_base + PCI_MSI_FLAGS;
> > > > >  	msg_ctrl = dw_pcie_readw_dbi(pci, reg);
> > > > >  	has_upper = !!(msg_ctrl & PCI_MSI_FLAGS_64BIT);
> > > > > -	reg = ep->msi_cap + PCI_MSI_ADDRESS_LO;
> > > > > +	reg = ep->msi_cap + pf_base + PCI_MSI_ADDRESS_LO;
> > > > >  	msg_addr_lower = dw_pcie_readl_dbi(pci, reg);
> > > > >  	if (has_upper) {
> > > > > -		reg = ep->msi_cap + PCI_MSI_ADDRESS_HI;
> > > > > +		reg = ep->msi_cap + pf_base + PCI_MSI_ADDRESS_HI;
> > > > >  		msg_addr_upper = dw_pcie_readl_dbi(pci, reg);
> > > > > -		reg = ep->msi_cap + PCI_MSI_DATA_64;
> > > > > +		reg = ep->msi_cap + pf_base + PCI_MSI_DATA_64;
> > > > >  		msg_data = dw_pcie_readw_dbi(pci, reg);
> > > > >  	} else {
> > > > >  		msg_addr_upper = 0;
> > > > > -		reg = ep->msi_cap + PCI_MSI_DATA_32;
> > > > > +		reg = ep->msi_cap + pf_base + PCI_MSI_DATA_32;
> > > > >  		msg_data = dw_pcie_readw_dbi(pci, reg);
> > > > >  	}
> > > > >  	aligned_offset = msg_addr_lower & (epc->mem->page_size - 1);
> > @@
> > > > > -439,7 +455,7 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep
> > > > > *ep,
> > > > > u8 func_no,  }
> > > > >
> > > > >  int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > > > -			     u16 interrupt_num)
> > > > > +			      u16 interrupt_num)
> > > > >  {
> > > > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > > >  	struct pci_epc *epc = ep->epc;
> > > > > @@ -447,16 +463,17 @@ int dw_pcie_ep_raise_msix_irq(struct
> > > > dw_pcie_ep *ep, u8 func_no,
> > > > >  	u32 bar_addr_upper, bar_addr_lower;
> > > > >  	u32 msg_addr_upper, msg_addr_lower;
> > > > >  	u32 reg, msg_data, vec_ctrl;
> > > > > +	u32 pf_base = func_no * epc->pf_offset;
> > > > >  	u64 tbl_addr, msg_addr, reg_u64;
> > > > >  	void __iomem *msix_tbl;
> > > > >  	int ret;
> > > > >
> > > > > -	reg = ep->msix_cap + PCI_MSIX_TABLE;
> > > > > +	reg = ep->msix_cap + pf_base + PCI_MSIX_TABLE;
> > > > >  	tbl_offset = dw_pcie_readl_dbi(pci, reg);
> > > > >  	bir = (tbl_offset & PCI_MSIX_TABLE_BIR);
> > > > >  	tbl_offset &= PCI_MSIX_TABLE_OFFSET;
> > > > >
> > > > > -	reg = PCI_BASE_ADDRESS_0 + (4 * bir);
> > > > > +	reg = PCI_BASE_ADDRESS_0 + pf_base + (4 * bir);
> > > > >  	bar_addr_upper = 0;
> > > > >  	bar_addr_lower = dw_pcie_readl_dbi(pci, reg);
> > > > >  	reg_u64 = (bar_addr_lower &
> > PCI_BASE_ADDRESS_MEM_TYPE_MASK);
> > > > @@
> > > > > -592,13 +609,17 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
> > > > >  	ep->epc = epc;
> > > > >  	epc_set_drvdata(epc, ep);
> > > > >
> > > > > -	if (ep->ops->ep_init)
> > > > > -		ep->ops->ep_init(ep);
> > > > > -
> > > > >  	ret = of_property_read_u8(np, "max-functions",
> > &epc->max_functions);
> > > > >  	if (ret < 0)
> > > > >  		epc->max_functions = 1;
> > > > >
> > > > > +	ret = of_property_read_u32(np, "pf-offset", &epc->pf_offset);
> > > > > +	if (ret < 0)
> > > > > +		epc->pf_offset = 0;
> > > >
> > > > Bad things will likely happen if max_functions > 1 and pf-offset isn't set.
> > > > I think the driver should bail in this situation. It would be very
> > > > easy for someone to misconfigure this.
> > > Yes, you are right, but if the max-functions have defined in DTS,
> > > require the pf-offset must define in DTS, I am not sure the correct
> > > value of pf-offsetfor other platforms, so I think the max-functions and
> > pf-offset should not have the dependence.
> > 
> > Yes you're correct. I hadn't really thought about this beyond layerscape. It's
> > also possible that other hardware could support multiple PFs without relying
> > on an offset and perhaps employ some other mechanism to access different
> > functions. So whilst this property can be optional for the majority of dwc
> > controllers - it must be set and cannot be zero for layerscape.
> > 
> > Perhaps inside ls_pcie_ep_init, you can set max_functions to 1 if pf_offset is
> > 0 and print a WARN to explain why? (Or ls_pcie_ep_init returns failure and
> > dw_pcie_ep_init checks it and bails).
> > 
> > The assumption is being made here that future dw controllers may also use
> > pf_offset (is this likely?) - otherwise why is this in pcie-designware-ep.c and
> > not pci-layerscape-ep.c and why is this value not just hard-coded for lp?
> 
> Thanks a lot for your detail comments, this give me a lot of help.
> Yes, I agree your point, and I will seriously consider a best way to fix this potential issue.
> Based on your experience, how do other platforms implement the multiple functions?
> The DWC core difference the different PF by signal "client0_tlp_func_num[(PF_WD-1):0]"

I don't know, though looking at the kernel drivers suggests that the
existing EP controllers have a large address space which contains multiple
PFs. They are accessed via macros (ROCKCHIP_PCIE_EP_FUNC_BASE(fn), 
CDNS_PCIE_EP_FUNC_BASE(fn)). It would be possible, but probably not desirable
to have a smaller address space (window) and a register that selects which
function the window refers to. This is why I'm slight nervous of assuming
that a pf-offset will cover all future dw drivers - I may be wrong.

> > 
> > 
> > > even though I didn't define pf-offset when I defined max-functions,
> > > the pf-offset is 0, the DWC ep driver can continue run the progress of
> > > INIT but not return, of course, thus the PF1 will not work, I don't know which
> > way is better.
> Hi Andrew,
> > > >
> > > >
> > > > > +
> > > > > +	if (ep->ops->ep_init)
> > > > > +		ep->ops->ep_init(ep);
> > > > > +
> > > > >  	ret = __pci_epc_mem_init(epc, ep->phys_base, ep->addr_size,
> > > > >  				 ep->page_size);
> > > > >  	if (ret < 0) {
> > > > > diff --git a/drivers/pci/controller/dwc/pcie-designware.c
> > > > > b/drivers/pci/controller/dwc/pcie-designware.c
> > > > > index 7d25102..c99cee4 100644
> > > > > --- a/drivers/pci/controller/dwc/pcie-designware.c
> > > > > +++ b/drivers/pci/controller/dwc/pcie-designware.c
> > > > > @@ -158,6 +158,43 @@ static void dw_pcie_writel_ob_unroll(struct
> > > > dw_pcie *pci, u32 index, u32 reg,
> > > > >  	dw_pcie_writel_atu(pci, offset + reg, val);  }
> > > > >
> > > > > +static void dw_pcie_prog_ep_outbound_atu_unroll(struct dw_pcie
> > > > > +*pci, u8
> > > > func_no,
> > > > > +						int index, int type,
> > > > > +						u64 cpu_addr, u64 pci_addr,
> > > > > +						u32 size)
> > > > > +{
> > > > > +	u32 retries, val;
> > > > > +
> > > > > +	dw_pcie_writel_ob_unroll(pci, index,
> > PCIE_ATU_UNR_LOWER_BASE,
> > > > > +				 lower_32_bits(cpu_addr));
> > > > > +	dw_pcie_writel_ob_unroll(pci, index,
> > PCIE_ATU_UNR_UPPER_BASE,
> > > > > +				 upper_32_bits(cpu_addr));
> > > > > +	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_LIMIT,
> > > > > +				 lower_32_bits(cpu_addr + size - 1));
> > > > > +	dw_pcie_writel_ob_unroll(pci, index,
> > PCIE_ATU_UNR_LOWER_TARGET,
> > > > > +				 lower_32_bits(pci_addr));
> > > > > +	dw_pcie_writel_ob_unroll(pci, index,
> > PCIE_ATU_UNR_UPPER_TARGET,
> > > > > +				 upper_32_bits(pci_addr));
> > > > > +	dw_pcie_writel_ob_unroll(pci, index,
> > PCIE_ATU_UNR_REGION_CTRL1,
> > > > > +				 type | PCIE_ATU_FUNC_NUM(func_no));
> > > >
> > > > With the exception of this line, the rest of this function is
> > > > identical to dw_pcie_prog_outbound_atu_unroll.
> > > Yes, I can integrate the same code, but I think we'd better use the
> > > different outbound window set function between RC and EP, because the RC
> > don't need the func_num parameter.
> > 
> > 
> > 
> > > >
> > > > > +	dw_pcie_writel_ob_unroll(pci, index,
> > PCIE_ATU_UNR_REGION_CTRL2,
> > > > > +				 PCIE_ATU_ENABLE);
> > > > > +
> > > > > +	/*
> > > > > +	 * Make sure ATU enable takes effect before any subsequent config
> > > > > +	 * and I/O accesses.
> > > > > +	 */
> > > > > +	for (retries = 0; retries < LINK_WAIT_MAX_IATU_RETRIES; retries++)
> > {
> > > > > +		val = dw_pcie_readl_ob_unroll(pci, index,
> > > > > +					      PCIE_ATU_UNR_REGION_CTRL2);
> > > > > +		if (val & PCIE_ATU_ENABLE)
> > > > > +			return;
> > > > > +
> > > > > +		mdelay(LINK_WAIT_IATU);
> > > > > +	}
> > > > > +	dev_err(pci->dev, "Outbound iATU is not being enabled\n"); }
> > > > > +
> > > > >  static void dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci,
> > > > > int
> > > > index,
> > > > >  					     int type, u64 cpu_addr,
> > > > >  					     u64 pci_addr, u32 size) @@ -194,6
> > +231,51 @@ static
> > > > > void
> > > > dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, int index,
> > > > >  	dev_err(pci->dev, "Outbound iATU is not being enabled\n");  }
> > > > >
> > > > > +void dw_pcie_prog_ep_outbound_atu(struct dw_pcie *pci, u8
> > > > > +func_no, int
> > > > index,
> > > > > +				  int type, u64 cpu_addr, u64 pci_addr,
> > > > > +				  u32 size)
> > > > > +{
> > > > > +	u32 retries, val;
> > > > > +
> > > > > +	if (pci->ops->cpu_addr_fixup)
> > > > > +		cpu_addr = pci->ops->cpu_addr_fixup(pci, cpu_addr);
> > > > > +
> > > > > +	if (pci->iatu_unroll_enabled) {
> > > > > +		dw_pcie_prog_ep_outbound_atu_unroll(pci, func_no, index,
> > type,
> > > > > +						    cpu_addr, pci_addr, size);
> > > > > +		return;
> > > > > +	}
> > > > > +
> > > > > +	dw_pcie_writel_dbi(pci, PCIE_ATU_VIEWPORT,
> > > > > +			   PCIE_ATU_REGION_OUTBOUND | index);
> > > > > +	dw_pcie_writel_dbi(pci, PCIE_ATU_LOWER_BASE,
> > > > > +			   lower_32_bits(cpu_addr));
> > > > > +	dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_BASE,
> > > > > +			   upper_32_bits(cpu_addr));
> > > > > +	dw_pcie_writel_dbi(pci, PCIE_ATU_LIMIT,
> > > > > +			   lower_32_bits(cpu_addr + size - 1));
> > > > > +	dw_pcie_writel_dbi(pci, PCIE_ATU_LOWER_TARGET,
> > > > > +			   lower_32_bits(pci_addr));
> > > > > +	dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_TARGET,
> > > > > +			   upper_32_bits(pci_addr));
> > > > > +	dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, type |
> > > > > +			   PCIE_ATU_FUNC_NUM(func_no));
> > > >
> > > > The same here, this is identical to dw_pcie_prog_outbound_atu with
> > > > the exception of this line.
> > > >
> > > > Is there a way you can avoid all of this duplicated code?
> > > As above, I can integrate the same code, but I keep to think the
> > > different outbound Window set function should be used between RC and EP.
> > 
> > Or, is it possible to keep and use the existing functions, but use them
> > differently, e.g:
> > 
> > 
> > @@ -137,8 +146,8 @@ static int dw_pcie_ep_outbound_atu(struct
> > dw_pcie_ep *ep, phys_addr_t phys_addr,
> >                 return -EINVAL;
> >         }
> > 
> > -       dw_pcie_prog_outbound_atu(pci, free_win, PCIE_ATU_TYPE_MEM,
> > -                                 phys_addr, pci_addr, size);
> > +       dw_pcie_prog_outbound_atu(pci, free_win,
> > PCIE_ATU_TYPE_MEM_FUNC(func_no),
> > +                                    phys_addr, pci_addr, size);
> > 
> >         set_bit(free_win, ep->ob_window_map);
> >         ep->outbound_addr[free_win] = phys_addr;
> > 
> > 
> > Supported with:
> > 
> > #define PCIE_ATU_TYPE_MEM               0x0
> > #define PCIE_ATU_TYPE_MEM_FUNC(func_no) (PCIE_ATU_TYPE_MEM |
> > PCIE_ATU_FUNC_NUM(func_no))
> > 
> > 
> > This is just a suggestion, but I'm keen to avoid code duplication.
> Thanks, I have think of a way as follow:
> 
> This is a good way, but I think PCIE_ATU_TYPE_MEM_FUNC(func_no) will give
> Someone confused meaning, because PCIE_ATU_TYPE_MEM indicate the type of TLP,
> and the location in the bit[0:3] of register CR1, but the PCIE_ATU_FUNC_NUM is bit[20:24],
> I have another way:
> @@ -137,8 +146,8 @@ static int dw_pcie_ep_outbound_atu(struct
> dw_pcie_ep *ep, phys_addr_t phys_addr,
>                  return -EINVAL;
>         }
> 		
> 		dw_pcie_prog_outbound_atu(pci, free_win, PCIE_ATU_TYPE_MEM,
>                                 phys_addr, pci_addr, size);
> +		val = dw_pcie_readl_dbi(pci, PCIE_ATU_CR1);
> +		dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, val | PCIE_ATU_FUNC_NUM(func_no));
> or 
> +void dw_pcie_prog_ep_outbound_atu(struct dw_pcie *pci, u8 func_no, int index,
> +                                   int type, u64 cpu_addr, u64 pci_addr,
> +                                   u32 size)
> +{
> +		dw_pcie_prog_outbound_atu(pci, index, type, cpu_addr, pci_addr, size);	
> +		val = dw_pcie_readl_dbi(pci, PCIE_ATU_CR1);
> +		dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, val | PCIE_ATU_FUNC_NUM(func_no));
> +}
> 
> Which do you think is better of these three ways?

Building upon your idea, how about:

 
 @@ -137,8 +146,8 @@ static int dw_pcie_ep_outbound_atu(struct
 dw_pcie_ep *ep, phys_addr_t phys_addr,
                 return -EINVAL;
         }
 
 -       dw_pcie_prog_outbound_atu(pci, free_win, PCIE_ATU_TYPE_MEM,
 -                                 phys_addr, pci_addr, size);
 +       dw_pcie_prog_ep_outbound_atu(pci, func_no, free_win, PCIE_ATU_TYPE_MEM
 +                                    phys_addr, pci_addr, size);
 
         set_bit(free_win, ep->ob_window_map);
         ep->outbound_addr[free_win] = phys_addr;
 

 +void dw_pcie_prog_ep_outbound_atu(struct dw_pcie *pci, u8 func_no, int index,
 +                                   int type, u64 cpu_addr, u64 pci_addr,
 +                                   u32 size)
 +{
 +		__dw_pcie_prog_outbound_atu(pci, func_no, index, type, cpu_addr, pci_addr, size);	
 +}
 +
 +void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, u8 func_no, int index,
 +                                   int type, u64 cpu_addr, u64 pci_addr,
 +                                   u32 size)
 +{
 +		__dw_pcie_prog_outbound_atu(pci, 0, index, type, cpu_addr, pci_addr, size);	
 +}

In other words dw_pcie_prog_outbound_atu is updated (and renamed) to always
take a func_no and for host controllers this is always set to zero. Or you
could follow the approach taken in the cadence drivers for their implementation
of cdns_pcie_set_outbound_region - this always takes a func_no and is used
by host controller and endpoint drivers (except they don't have the helper
wrapper functions above thus exposing fn=0 to host controllers).

> > 
> > > >
> > > > Thanks,
> > > >
> > > > Andrew Murray
> > > >
> > > > > +	dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE);
> > > > > +
> > > > > +	/*
> > > > > +	 * Make sure ATU enable takes effect before any subsequent config
> > > > > +	 * and I/O accesses.
> > > > > +	 */
> > > > > +	for (retries = 0; retries < LINK_WAIT_MAX_IATU_RETRIES; retries++)
> > {
> > > > > +		val = dw_pcie_readl_dbi(pci, PCIE_ATU_CR2);
> > > > > +		if (val & PCIE_ATU_ENABLE)
> > > > > +			return;
> > > > > +
> > > > > +		mdelay(LINK_WAIT_IATU);
> > > > > +	}
> > > > > +	dev_err(pci->dev, "Outbound iATU is not being enabled\n"); }
> > > > > +
> > > > >  void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index, int
> > type,
> > > > >  			       u64 cpu_addr, u64 pci_addr, u32 size)  { @@
> > -252,8
> > > > +334,8
> > > > > @@ static void dw_pcie_writel_ib_unroll(struct dw_pcie *pci, u32
> > > > > index,
> > > > u32 reg,
> > > > >  	dw_pcie_writel_atu(pci, offset + reg, val);  }
> > > > >
> > > > > -static int dw_pcie_prog_inbound_atu_unroll(struct dw_pcie *pci, int
> > index,
> > > > > -					   int bar, u64 cpu_addr,
> > > > > +static int dw_pcie_prog_inbound_atu_unroll(struct dw_pcie *pci,
> > > > > +u8
> > > > func_no,
> > > > > +					   int index, int bar, u64 cpu_addr,
> > > > >  					   enum dw_pcie_as_type as_type)  {
> > > > >  	int type;
> > > > > @@ -275,8 +357,10 @@ static int
> > > > > dw_pcie_prog_inbound_atu_unroll(struct
> > > > dw_pcie *pci, int index,
> > > > >  		return -EINVAL;
> > > > >  	}
> > > > >
> > > > > -	dw_pcie_writel_ib_unroll(pci, index,
> > PCIE_ATU_UNR_REGION_CTRL1,
> > > > type);
> > > > > +	dw_pcie_writel_ib_unroll(pci, index,
> > PCIE_ATU_UNR_REGION_CTRL1,
> > > > type |
> > > > > +				 PCIE_ATU_FUNC_NUM(func_no));
> > > > >  	dw_pcie_writel_ib_unroll(pci, index,
> > PCIE_ATU_UNR_REGION_CTRL2,
> > > > > +				 PCIE_ATU_FUNC_NUM_MATCH_EN |
> > > > >  				 PCIE_ATU_ENABLE |
> > > > >  				 PCIE_ATU_BAR_MODE_ENABLE | (bar << 8));
> > > > >
> > > > > @@ -297,14 +381,15 @@ static int
> > > > dw_pcie_prog_inbound_atu_unroll(struct dw_pcie *pci, int index,
> > > > >  	return -EBUSY;
> > > > >  }
> > > > >
> > > > > -int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, int index, int bar,
> > > > > -			     u64 cpu_addr, enum dw_pcie_as_type as_type)
> > > > > +int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, u8 func_no, int
> > index,
> > > > > +			     int bar, u64 cpu_addr,
> > > > > +			     enum dw_pcie_as_type as_type)
> > > > >  {
> > > > >  	int type;
> > > > >  	u32 retries, val;
> > > > >
> > > > >  	if (pci->iatu_unroll_enabled)
> > > > > -		return dw_pcie_prog_inbound_atu_unroll(pci, index, bar,
> > > > > +		return dw_pcie_prog_inbound_atu_unroll(pci, func_no, index,
> > > > > +bar,
> > > > >  						       cpu_addr, as_type);
> > > > >
> > > > >  	dw_pcie_writel_dbi(pci, PCIE_ATU_VIEWPORT,
> > > > PCIE_ATU_REGION_INBOUND |
> > > > > @@ -323,9 +408,11 @@ int dw_pcie_prog_inbound_atu(struct dw_pcie
> > > > *pci, int index, int bar,
> > > > >  		return -EINVAL;
> > > > >  	}
> > > > >
> > > > > -	dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, type);
> > > > > -	dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE
> > > > > -			   | PCIE_ATU_BAR_MODE_ENABLE | (bar << 8));
> > > > > +	dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, type |
> > > > > +			   PCIE_ATU_FUNC_NUM(func_no));
> > > > > +	dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE |
> > > > > +			   PCIE_ATU_FUNC_NUM_MATCH_EN |
> > > > > +			   PCIE_ATU_BAR_MODE_ENABLE | (bar << 8));
> > > > >
> > > > >  	/*
> > > > >  	 * Make sure ATU enable takes effect before any subsequent
> > > > > config diff --git a/drivers/pci/controller/dwc/pcie-designware.h
> > > > > b/drivers/pci/controller/dwc/pcie-designware.h
> > > > > index ffed084..2b291e8 100644
> > > > > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > > > > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > > > > @@ -71,9 +71,11 @@
> > > > >  #define PCIE_ATU_TYPE_IO		0x2
> > > > >  #define PCIE_ATU_TYPE_CFG0		0x4
> > > > >  #define PCIE_ATU_TYPE_CFG1		0x5
> > > > > +#define PCIE_ATU_FUNC_NUM(pf)           (pf << 20)
> > > > >  #define PCIE_ATU_CR2			0x908
> > > > >  #define PCIE_ATU_ENABLE			BIT(31)
> > > > >  #define PCIE_ATU_BAR_MODE_ENABLE	BIT(30)
> > > > > +#define PCIE_ATU_FUNC_NUM_MATCH_EN      BIT(19)
> > > > >  #define PCIE_ATU_LOWER_BASE		0x90C
> > > > >  #define PCIE_ATU_UPPER_BASE		0x910
> > > > >  #define PCIE_ATU_LIMIT			0x914
> > > > > @@ -265,8 +267,12 @@ int dw_pcie_wait_for_link(struct dw_pcie
> > > > > *pci); void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index,
> > > > >  			       int type, u64 cpu_addr, u64 pci_addr,
> > > > >  			       u32 size);
> > > > > -int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, int index, int bar,
> > > > > -			     u64 cpu_addr, enum dw_pcie_as_type as_type);
> > > > > +void dw_pcie_prog_ep_outbound_atu(struct dw_pcie *pci, u8
> > > > > +func_no, int
> > > > index,
> > > > > +				  int type, u64 cpu_addr, u64 pci_addr,
> > > > > +				  u32 size);
> > > > > +int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, u8 func_no, int
> > index,
> > > > > +			     int bar, u64 cpu_addr,
> > > > > +			     enum dw_pcie_as_type as_type);
> > > > >  void dw_pcie_disable_atu(struct dw_pcie *pci, int index,
> > > > >  			 enum dw_pcie_region_type type);  void
> > dw_pcie_setup(struct
> > > > > dw_pcie *pci); diff --git a/include/linux/pci-epc.h
> > > > > b/include/linux/pci-epc.h index f641bad..fc2feee 100644
> > > > > --- a/include/linux/pci-epc.h
> > > > > +++ b/include/linux/pci-epc.h
> > > > > @@ -96,6 +96,7 @@ struct pci_epc {
> > > > >  	const struct pci_epc_ops	*ops;
> > > > >  	struct pci_epc_mem		*mem;
> > > > >  	u8				max_functions;
> > > > > +	u32				pf_offset;
> > 
> > Also pf_offset is an implementation detail needed only by the driver to
> > calculate where the PF is - it doesn't seem right that we share this with the EP
> > controller framework (whereas max_functions is used as a bounds check for
> > func_no in the framework calls).
> > 
> > I'd suggest that pf_offset is moved to a dwc structure, perhaps dw_pcie_ep?
> I add the variable to this struct is consider that all PF is belong to a PCIe controller,
> and the pci_epc indicate a PCIe controller, so I add this variable to this struct, what
> do you think about this? I am not sure whether I should add this variable to dw_pcie_ep.

The EPC framework won't use the pf_offset and doesn't need it. It abstracts
the complexity of writing to the config address space (and similar) through
the pci_epc_ops. I'd suggest that the EPC framework (and pci_epc struct) only
needs to contain what *it* needs. Especially given that not all ep drivers
have a pf_offset or similar.

I understand the logic that pci_epc represents a EP controller, but I think
you should consider that it actually represents a *generic* EP controller in
the context of a framework which solely serves the purpose of connecting
controllers with functions. Whereas the dw_pcie_ep represents a specific type
of controller (DW) - as the pf_offset is (so far) relating to only DW
controllers (and as confirmed by the DT mapping) then it makes sense to not
move pf_offset from the specialised specific controller to the generic
controller. (Or at least this is how I rationalise it, though the EPC
framework is something quite unfamiliar to me).

Thanks,

Andrew Murray

> > 
> > Thanks,
> > 
> > Andrew Murray
> > 
> > > > >  	struct config_group		*group;
> > > > >  	/* spinlock to protect against concurrent access of EP controller */
> > > > >  	spinlock_t			lock;
> > > > > --
> > > > > 2.9.5
> > > > >
> > > > >
> > > > > _______________________________________________
> > > > > linux-arm-kernel mailing list
> > > > > linux-arm-kernel@lists.infradead.org
> > > > > http://lists
> > > > > .infradead.org%2Fmailman%2Flistinfo%2Flinux-arm-kernel&amp;data=0
> > 2
> > > > > %
> > > > 7C0
> > > > >
> > > >
> > 1%7Cxiaowei.bao%40nxp.com%7C0e39168f6f144db6840308d721742040%7
> > > > C686ea1d
> > > > >
> > > >
> > 3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637014654998524452&amp;sd
> > > > ata=bP7eh
> > > > > cjlGXCMVFE2b4f12Q6fGV7lQ%2F5i9qIi9FoPlbI%3D&amp;reserved=0
