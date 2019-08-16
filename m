Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DBD8FFF3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 12:22:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468zsk425QzDqLV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 20:22:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=andrew.murray@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 468zq20wj5zDrS7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 20:20:28 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A615828;
 Fri, 16 Aug 2019 03:20:27 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00EA33F706;
 Fri, 16 Aug 2019 03:20:27 -0700 (PDT)
Date: Fri, 16 Aug 2019 11:20:25 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH 02/10] PCI: designware-ep: Add the doorbell mode of MSI-X
 in EP mode
Message-ID: <20190816102025.GB14111@e119886-lin.cambridge.arm.com>
References: <20190815083716.4715-1-xiaowei.bao@nxp.com>
 <20190815083716.4715-2-xiaowei.bao@nxp.com>
 <20190815115340.GG43882@e119886-lin.cambridge.arm.com>
 <AM5PR04MB329973845D6396624AFDE547F5AF0@AM5PR04MB3299.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM5PR04MB329973845D6396624AFDE547F5AF0@AM5PR04MB3299.eurprd04.prod.outlook.com>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "Z.q. Hou" <zhiqiang.hou@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>, "kishon@ti.com" <kishon@ti.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 16, 2019 at 02:58:31AM +0000, Xiaowei Bao wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Murray <andrew.murray@arm.com>
> > Sent: 2019年8月15日 19:54
> > To: Xiaowei Bao <xiaowei.bao@nxp.com>
> > Cc: jingoohan1@gmail.com; gustavo.pimentel@synopsys.com;
> > bhelgaas@google.com; robh+dt@kernel.org; mark.rutland@arm.com;
> > shawnguo@kernel.org; Leo Li <leoyang.li@nxp.com>; kishon@ti.com;
> > lorenzo.pieralisi@arm.com; arnd@arndb.de; gregkh@linuxfoundation.org;
> > M.h. Lian <minghuan.lian@nxp.com>; Mingkai Hu <mingkai.hu@nxp.com>;
> > Roy Zang <roy.zang@nxp.com>; linux-pci@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linuxppc-dev@lists.ozlabs.org
> > Subject: Re: [PATCH 02/10] PCI: designware-ep: Add the doorbell mode of
> > MSI-X in EP mode
> > 
> > On Thu, Aug 15, 2019 at 04:37:08PM +0800, Xiaowei Bao wrote:
> > > Add the doorbell mode of MSI-X in EP mode.
> > >
> > > Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-designware-ep.c | 14 ++++++++++++++
> > >  drivers/pci/controller/dwc/pcie-designware.h    | 14 ++++++++++++++
> > >  2 files changed, 28 insertions(+)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > index 75e2955..e3a7cdf 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > @@ -454,6 +454,20 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep
> > *ep, u8 func_no,
> > >  	return 0;
> > >  }
> > >
> > > +int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep, u8
> > func_no,
> > > +				       u16 interrupt_num)
> > > +{
> > > +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > +	u32 msg_data;
> > > +
> > > +	msg_data = (func_no << PCIE_MSIX_DOORBELL_PF_SHIFT) |
> > > +		   (interrupt_num - 1);
> > > +
> > > +	dw_pcie_writel_dbi(pci, PCIE_MSIX_DOORBELL, msg_data);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
> > >  			      u16 interrupt_num)
> > 
> > Have I understood correctly that the hardware provides an alternative
> > mechanism that allows for raising MSI-X interrupts without the bother of
> > reading the capabilities registers?
> Yes, the hardware provide two way to MSI-X, please check the page 492 of 
> DWC_pcie_dm_registers_4.30 Menu.
> MSIX_DOORBELL_OFF on page 492 0x948 Description: MSI-X Doorbell Register....>

Thanks for the reference.

> > 
> > If so is there any good reason to keep dw_pcie_ep_raise_msix_irq? (And thus
> > use it in dw_plat_pcie_ep_raise_irq also)?
> I am not sure, but I think the dw_pcie_ep_raise_msix_irq function is not correct, 
> because I think we can't get the MSIX table from the address ep->phys_base + tbl_addr, 
> but I also don't know where I can get the correct MSIX table.

Well it looks like this function is used by snps,dw-pcie-ep and snps,dw-pcie,
perhaps the doorbell mode isn't available on that hardware.

> > 
> > 
> > >  {
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware.h
> > > b/drivers/pci/controller/dwc/pcie-designware.h
> > > index 2b291e8..cd903e9 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > > @@ -88,6 +88,11 @@
> > >  #define PCIE_MISC_CONTROL_1_OFF		0x8BC
> > >  #define PCIE_DBI_RO_WR_EN		BIT(0)
> > >
> > > +#define PCIE_MSIX_DOORBELL		0x948
> > > +#define PCIE_MSIX_DOORBELL_PF_SHIFT	24
> > > +#define PCIE_MSIX_DOORBELL_VF_SHIFT	16
> > > +#define PCIE_MSIX_DOORBELL_VF_ACTIVE	BIT(15)
> > 
> > The _VF defines are not used, I'd suggest removing them.
> In fact, I will add the SRIOV support in this file, the SRIOV feature have verified 
> In my board, but I need wait the EP framework SRIOV patch merge, 
> so I defined these two macros.

I'd suggest adding the VF macros along with the SRIOV feature.

Thanks,

Andrew Murray

> > 
> > Thanks,
> > 
> > Andrew Murray
> > 
> > > +
> > >  /*
> > >   * iATU Unroll-specific register definitions
> > >   * From 4.80 core version the address translation will be made by
> > > unroll @@ -399,6 +404,8 @@ int dw_pcie_ep_raise_msi_irq(struct
> > dw_pcie_ep *ep, u8 func_no,
> > >  			     u8 interrupt_num);
> > >  int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
> > >  			     u16 interrupt_num);
> > > +int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep, u8
> > func_no,
> > > +				       u16 interrupt_num);
> > >  void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar);
> > > #else  static inline void dw_pcie_ep_linkup(struct dw_pcie_ep *ep) @@
> > > -431,6 +438,13 @@ static inline int dw_pcie_ep_raise_msix_irq(struct
> > dw_pcie_ep *ep, u8 func_no,
> > >  	return 0;
> > >  }
> > >
> > > +static inline int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep
> > *ep,
> > > +						     u8 func_no,
> > > +						     u16 interrupt_num)
> > > +{
> > > +	return 0;
> > > +}
> > > +
> > >  static inline void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum
> > > pci_barno bar)  {  }
> > > --
> > > 2.9.5
> > >
> > >
> > > _______________________________________________
> > > linux-arm-kernel mailing list
> > > linux-arm-kernel@lists.infradead.org
> > > https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Flists
> > > .infradead.org%2Fmailman%2Flistinfo%2Flinux-arm-kernel&amp;data=02%
> > 7C0
> > >
> > 1%7Cxiaowei.bao%40nxp.com%7C8489493003bb48a0139d08d721773972%
> > 7C686ea1d
> > >
> > 3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637014668369499298&amp;sd
> > ata=dyrXB
> > >
> > avljJBFUSNXW7K%2FRoXvwfWTE%2FoU2KMd1bZkJow%3D&amp;reserved=0
