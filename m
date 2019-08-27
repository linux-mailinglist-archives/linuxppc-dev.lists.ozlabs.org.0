Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0D49E970
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 15:32:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HqYz14CyzDq9m
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 23:32:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=andrew.murray@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46HqP35CkGzDqcx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 23:25:08 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B8FE28;
 Tue, 27 Aug 2019 06:25:07 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA87A3F246;
 Tue, 27 Aug 2019 06:25:06 -0700 (PDT)
Date: Tue, 27 Aug 2019 14:25:05 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH v2 07/10] PCI: layerscape: Modify the MSIX to the
 doorbell way
Message-ID: <20190827132504.GL14582@e119886-lin.cambridge.arm.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-7-xiaowei.bao@nxp.com>
 <20190823135816.GH14582@e119886-lin.cambridge.arm.com>
 <AM5PR04MB3299E50BA5D7579D41B8B4F9F5A70@AM5PR04MB3299.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM5PR04MB3299E50BA5D7579D41B8B4F9F5A70@AM5PR04MB3299.eurprd04.prod.outlook.com>
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

On Sat, Aug 24, 2019 at 12:08:40AM +0000, Xiaowei Bao wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Murray <andrew.murray@arm.com>
> > Sent: 2019年8月23日 21:58
> > To: Xiaowei Bao <xiaowei.bao@nxp.com>
> > Cc: bhelgaas@google.com; robh+dt@kernel.org; mark.rutland@arm.com;
> > shawnguo@kernel.org; Leo Li <leoyang.li@nxp.com>; kishon@ti.com;
> > lorenzo.pieralisi@arm.co; arnd@arndb.de; gregkh@linuxfoundation.org; M.h.
> > Lian <minghuan.lian@nxp.com>; Mingkai Hu <mingkai.hu@nxp.com>; Roy
> > Zang <roy.zang@nxp.com>; jingoohan1@gmail.com;
> > gustavo.pimentel@synopsys.com; linux-pci@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linuxppc-dev@lists.ozlabs.org
> > Subject: Re: [PATCH v2 07/10] PCI: layerscape: Modify the MSIX to the
> > doorbell way
> > 
> > On Thu, Aug 22, 2019 at 07:22:39PM +0800, Xiaowei Bao wrote:
> > > The layerscape platform use the doorbell way to trigger MSIX interrupt
> > > in EP mode.
> > >
> > 
> > I have no problems with this patch, however...
> > 
> > Are you able to add to this message a reason for why you are making this
> > change? Did dw_pcie_ep_raise_msix_irq not work when func_no != 0? Or did
> > it work yet dw_pcie_ep_raise_msix_irq_doorbell is more efficient?
> 
> The fact is that, this driver is verified in ls1046a platform of NXP before, and ls1046a don't
> support MSIX feature, so I set the msix_capable of pci_epc_features struct is false,
> but in other platform, e.g. ls1088a, it support the MSIX feature, I verified the MSIX
> feature in ls1088a, it is not OK, so I changed to another way. Thanks.

Right, so the existing pci-layerscape-ep.c driver never supported MSIX yet it
erroneously had a switch case statement to call dw_pcie_ep_raise_msix_irq which
would never get used.

Now that we're adding a platform with MSIX support the existing
dw_pcie_ep_raise_msix_irq doesn't work (for this platform) so we are adding a
different method.

Given that dw_pcie_ep_raise_msix_irq is used by pcie-designware-plat.c we
can assume this function at least works for it's use case.

Please update the commit message - It would be helpful to suggest that
dw_pcie_ep_raise_msix_irq was never called in the exisitng driver because
msix_capable was always set to false.

Thanks,

Andrew Murray

> 
> > 
> > Thanks,
> > 
> > Andrew Murray
> > 
> > > Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > > ---
> > > v2:
> > >  - No change.
> > >
> > >  drivers/pci/controller/dwc/pci-layerscape-ep.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > index 8461f62..7ca5fe8 100644
> > > --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > @@ -74,7 +74,8 @@ static int ls_pcie_ep_raise_irq(struct dw_pcie_ep *ep,
> > u8 func_no,
> > >  	case PCI_EPC_IRQ_MSI:
> > >  		return dw_pcie_ep_raise_msi_irq(ep, func_no, interrupt_num);
> > >  	case PCI_EPC_IRQ_MSIX:
> > > -		return dw_pcie_ep_raise_msix_irq(ep, func_no, interrupt_num);
> > > +		return dw_pcie_ep_raise_msix_irq_doorbell(ep, func_no,
> > > +							  interrupt_num);
> > >  	default:
> > >  		dev_err(pci->dev, "UNKNOWN IRQ type\n");
> > >  		return -EINVAL;
> > > --
> > > 2.9.5
> > >
