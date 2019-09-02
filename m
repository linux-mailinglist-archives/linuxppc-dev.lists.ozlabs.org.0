Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05431A57E1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 15:41:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MWSV6mMJzDqQP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 23:40:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=andrew.murray@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46MWMc1Mk3zDqYp
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 23:36:42 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85F83337;
 Mon,  2 Sep 2019 06:36:40 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6EEC3F59C;
 Mon,  2 Sep 2019 06:36:39 -0700 (PDT)
Date: Mon, 2 Sep 2019 14:36:38 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH v2 06/10] PCI: layerscape: Modify the way of getting
 capability with different PEX
Message-ID: <20190902133637.GM9720@e119886-lin.cambridge.arm.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-6-xiaowei.bao@nxp.com>
 <0c02ac52-e4b1-8071-bf9e-d10b28fc9029@ti.com>
 <AM5PR04MB3299DE7B57F31EA405E4FCBCF5A40@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <11e9b2c3-f4d0-2f82-bb14-45c38a1419e4@ti.com>
 <AM5PR04MB32995566CD6DF0AAAD1AE52EF5A40@AM5PR04MB3299.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM5PR04MB32995566CD6DF0AAAD1AE52EF5A40@AM5PR04MB3299.eurprd04.prod.outlook.com>
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
 "lorenzo.pieralisi@arm.co" <lorenzo.pieralisi@arm.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 23, 2019 at 04:13:30AM +0000, Xiaowei Bao wrote:
> 
> 
> > -----Original Message-----
> > From: Kishon Vijay Abraham I <kishon@ti.com>
> > Sent: 2019年8月23日 11:40
> > To: Xiaowei Bao <xiaowei.bao@nxp.com>; bhelgaas@google.com;
> > robh+dt@kernel.org; mark.rutland@arm.com; shawnguo@kernel.org; Leo Li
> > <leoyang.li@nxp.com>; lorenzo.pieralisi@arm.co
> > <lorenzo.pieralisi@arm.com>; arnd@arndb.de; gregkh@linuxfoundation.org;
> > M.h. Lian <minghuan.lian@nxp.com>; Mingkai Hu <mingkai.hu@nxp.com>;
> > Roy Zang <roy.zang@nxp.com>; jingoohan1@gmail.com;
> > gustavo.pimentel@synopsys.com; linux-pci@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linuxppc-dev@lists.ozlabs.org;
> > andrew.murray@arm.com
> > Subject: Re: [PATCH v2 06/10] PCI: layerscape: Modify the way of getting
> > capability with different PEX
> > 
> > Hi,
> > 
> > (Fixed Lorenzo's email address. All the patches in the series have wrong email
> > id)
> > 
> > On 23/08/19 8:09 AM, Xiaowei Bao wrote:
> > >
> > >
> > >> -----Original Message-----
> > >> From: Kishon Vijay Abraham I <kishon@ti.com>
> > >> Sent: 2019年8月22日 19:44
> > >> To: Xiaowei Bao <xiaowei.bao@nxp.com>; bhelgaas@google.com;
> > >> robh+dt@kernel.org; mark.rutland@arm.com; shawnguo@kernel.org; Leo
> > Li
> > >> <leoyang.li@nxp.com>; lorenzo.pieralisi@arm.co; arnd@arndb.de;
> > >> gregkh@linuxfoundation.org; M.h. Lian <minghuan.lian@nxp.com>;
> > >> Mingkai Hu <mingkai.hu@nxp.com>; Roy Zang <roy.zang@nxp.com>;
> > >> jingoohan1@gmail.com; gustavo.pimentel@synopsys.com;
> > >> linux-pci@vger.kernel.org; devicetree@vger.kernel.org;
> > >> linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > >> linuxppc-dev@lists.ozlabs.org; andrew.murray@arm.com
> > >> Subject: Re: [PATCH v2 06/10] PCI: layerscape: Modify the way of
> > >> getting capability with different PEX
> > >>
> > >> Hi,
> > >>
> > >> On 22/08/19 4:52 PM, Xiaowei Bao wrote:
> > >>> The different PCIe controller in one board may be have different
> > >>> capability of MSI or MSIX, so change the way of getting the MSI
> > >>> capability, make it more flexible.
> > >>
> > >> please use different pci_epc_features table for different boards.
> > > Thanks, I think that it will be more flexible to dynamically get MSI
> > > or MSIX capability, Thus, we will not need to define the pci_epc_feature for
> > different boards.
> > 
> > Is the restriction because you cannot have different compatible for different
> > boards?
> Sorry, I am not very clear what your mean, I think even if I use the same compatible
> with different boards, each boards will enter the probe function, in there I will get
> the MSI or MSIX PCIe capability of the current controller in this board. Why do I need
> to define the pci_epc_feature for different boards? 

At present you determine how to set the [msi,msix]_capable flags of
pci_epc_features based on reading the function capabilities at probe
time. Instead of doing this, is it possible that you can determine the flags
based on the compatible type alone? For example, is the MSI/MSIX capability
the same for all fsl,ls2088a-pcie-ep devices?

If it isn't *necessary* to probe for this information at probe time, then
you could instead create a static pci_epc_features structure and assign
it to something in your drvdata. This may provide some benefits.

The dw_pcie_ep_get_features function would then look like:

static const struct pci_epc_features*
ls_pcie_ep_get_features(struct dw_pcie_ep *ep)
{
	struct dw_pcie *pci = to_dw_pcie_from_pp(ep);
	struct ls_pcie_ep *pcie = dev_get_drvdata(pci->dev);
	return pcie->epc_features;
}

This also means you can revert "[v3,03/11] PCI: designware-ep: Move the".

Is this what you had in mind Kishon?

Thanks,

Andrew Murray

> > 
> > Thanks
> > Kishon
> > 
> > >>
> > >> Thanks
> > >> Kishon
> > >>>
> > >>> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > >>> ---
> > >>> v2:
> > >>>  - Remove the repeated assignment code.
> > >>>
> > >>>  drivers/pci/controller/dwc/pci-layerscape-ep.c | 26
> > >>> +++++++++++++++++++-------
> > >>>  1 file changed, 19 insertions(+), 7 deletions(-)
> > >>>
> > >>> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > >>> b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > >>> index 4e92a95..8461f62 100644
> > >>> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > >>> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > >>> @@ -22,6 +22,7 @@
> > >>>
> > >>>  struct ls_pcie_ep {
> > >>>  	struct dw_pcie		*pci;
> > >>> +	struct pci_epc_features	*ls_epc;
> > >>>  };
> > >>>
> > >>>  #define to_ls_pcie_ep(x)	dev_get_drvdata((x)->dev)
> > >>> @@ -40,25 +41,26 @@ static const struct of_device_id
> > >> ls_pcie_ep_of_match[] = {
> > >>>  	{ },
> > >>>  };
> > >>>
> > >>> -static const struct pci_epc_features ls_pcie_epc_features = {
> > >>> -	.linkup_notifier = false,
> > >>> -	.msi_capable = true,
> > >>> -	.msix_capable = false,
> > >>> -};
> > >>> -
> > >>>  static const struct pci_epc_features*
> > >>> ls_pcie_ep_get_features(struct dw_pcie_ep *ep)  {
> > >>> -	return &ls_pcie_epc_features;
> > >>> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > >>> +	struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
> > >>> +
> > >>> +	return pcie->ls_epc;
> > >>>  }
> > >>>
> > >>>  static void ls_pcie_ep_init(struct dw_pcie_ep *ep)  {
> > >>>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > >>> +	struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
> > >>>  	enum pci_barno bar;
> > >>>
> > >>>  	for (bar = BAR_0; bar <= BAR_5; bar++)
> > >>>  		dw_pcie_ep_reset_bar(pci, bar);
> > >>> +
> > >>> +	pcie->ls_epc->msi_capable = ep->msi_cap ? true : false;
> > >>> +	pcie->ls_epc->msix_capable = ep->msix_cap ? true : false;
> > >>>  }
> > >>>
> > >>>  static int ls_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > >>> @@
> > >>> -118,6 +120,7 @@ static int __init ls_pcie_ep_probe(struct
> > >>> platform_device
> > >> *pdev)
> > >>>  	struct device *dev = &pdev->dev;
> > >>>  	struct dw_pcie *pci;
> > >>>  	struct ls_pcie_ep *pcie;
> > >>> +	struct pci_epc_features *ls_epc;
> > >>>  	struct resource *dbi_base;
> > >>>  	int ret;
> > >>>
> > >>> @@ -129,6 +132,10 @@ static int __init ls_pcie_ep_probe(struct
> > >> platform_device *pdev)
> > >>>  	if (!pci)
> > >>>  		return -ENOMEM;
> > >>>
> > >>> +	ls_epc = devm_kzalloc(dev, sizeof(*ls_epc), GFP_KERNEL);
> > >>> +	if (!ls_epc)
> > >>> +		return -ENOMEM;
> > >>> +
> > >>>  	dbi_base = platform_get_resource_byname(pdev,
> > IORESOURCE_MEM,
> > >> "regs");
> > >>>  	pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_base);
> > >>>  	if (IS_ERR(pci->dbi_base))
> > >>> @@ -139,6 +146,11 @@ static int __init ls_pcie_ep_probe(struct
> > >> platform_device *pdev)
> > >>>  	pci->ops = &ls_pcie_ep_ops;
> > >>>  	pcie->pci = pci;
> > >>>
> > >>> +	ls_epc->linkup_notifier = false,
> > >>> +	ls_epc->bar_fixed_64bit = (1 << BAR_2) | (1 << BAR_4),
> > >>> +
> > >>> +	pcie->ls_epc = ls_epc;
> > >>> +
> > >>>  	platform_set_drvdata(pdev, pcie);
> > >>>
> > >>>  	ret = ls_add_pcie_ep(pcie, pdev);
> > >>>
