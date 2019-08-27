Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0A49E99E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 15:38:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HqhL1BCjzDqx4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 23:38:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=andrew.murray@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46Hqbt1kTJzDq7j
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 23:34:33 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB9C828;
 Tue, 27 Aug 2019 06:34:31 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23C6E3F246;
 Tue, 27 Aug 2019 06:34:31 -0700 (PDT)
Date: Tue, 27 Aug 2019 14:34:29 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH v2 08/10] PCI: layerscape: Add EP mode support for
 ls1088a and ls2088a
Message-ID: <20190827133429.GM14582@e119886-lin.cambridge.arm.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-8-xiaowei.bao@nxp.com>
 <20190823142756.GI14582@e119886-lin.cambridge.arm.com>
 <AM5PR04MB3299B100D1029E90945CF7DDF5A10@AM5PR04MB3299.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM5PR04MB3299B100D1029E90945CF7DDF5A10@AM5PR04MB3299.eurprd04.prod.outlook.com>
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

On Mon, Aug 26, 2019 at 09:49:35AM +0000, Xiaowei Bao wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Murray <andrew.murray@arm.com>
> > Sent: 2019年8月23日 22:28
> > To: Xiaowei Bao <xiaowei.bao@nxp.com>
> > Cc: bhelgaas@google.com; robh+dt@kernel.org; mark.rutland@arm.com;
> > shawnguo@kernel.org; Leo Li <leoyang.li@nxp.com>; kishon@ti.com;
> > lorenzo.pieralisi@arm.co; arnd@arndb.de; gregkh@linuxfoundation.org; M.h.
> > Lian <minghuan.lian@nxp.com>; Mingkai Hu <mingkai.hu@nxp.com>; Roy
> > Zang <roy.zang@nxp.com>; jingoohan1@gmail.com;
> > gustavo.pimentel@synopsys.com; linux-pci@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linuxppc-dev@lists.ozlabs.org
> > Subject: Re: [PATCH v2 08/10] PCI: layerscape: Add EP mode support for
> > ls1088a and ls2088a
> > 
> > On Thu, Aug 22, 2019 at 07:22:40PM +0800, Xiaowei Bao wrote:
> > > Add PCIe EP mode support for ls1088a and ls2088a, there are some
> > > difference between LS1 and LS2 platform, so refactor the code of the
> > > EP driver.
> > >
> > > Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > > ---
> > > v2:
> > >  - New mechanism for layerscape EP driver.
> > 
> > Was there a v1 of this patch?
> > 
> > >
> > >  drivers/pci/controller/dwc/pci-layerscape-ep.c | 76
> > > ++++++++++++++++++++------
> > >  1 file changed, 58 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > index 7ca5fe8..2a66f07 100644
> > > --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > @@ -20,27 +20,29 @@
> > >
> > >  #define PCIE_DBI2_OFFSET		0x1000	/* DBI2 base address*/
> > >
> > > -struct ls_pcie_ep {
> > > -	struct dw_pcie		*pci;
> > > -	struct pci_epc_features	*ls_epc;
> > > +#define to_ls_pcie_ep(x)	dev_get_drvdata((x)->dev)
> > > +
> > > +struct ls_pcie_ep_drvdata {
> > > +	u32				func_offset;
> > > +	const struct dw_pcie_ep_ops	*ops;
> > > +	const struct dw_pcie_ops	*dw_pcie_ops;
> > >  };
> > >
> > > -#define to_ls_pcie_ep(x)	dev_get_drvdata((x)->dev)
> > > +struct ls_pcie_ep {
> > > +	struct dw_pcie			*pci;
> > > +	struct pci_epc_features		*ls_epc;
> > > +	const struct ls_pcie_ep_drvdata *drvdata; };
> > >
> > >  static int ls_pcie_establish_link(struct dw_pcie *pci)  {
> > >  	return 0;
> > >  }
> > >
> > > -static const struct dw_pcie_ops ls_pcie_ep_ops = {
> > > +static const struct dw_pcie_ops dw_ls_pcie_ep_ops = {
> > >  	.start_link = ls_pcie_establish_link,  };
> > >
> > > -static const struct of_device_id ls_pcie_ep_of_match[] = {
> > > -	{ .compatible = "fsl,ls-pcie-ep",},
> > > -	{ },
> > > -};
> > > -
> > >  static const struct pci_epc_features*  ls_pcie_ep_get_features(struct
> > > dw_pcie_ep *ep)  { @@ -82,10 +84,44 @@ static int
> > > ls_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > >  	}
> > >  }
> > >
> > > -static const struct dw_pcie_ep_ops pcie_ep_ops = {
> > > +static unsigned int ls_pcie_ep_func_conf_select(struct dw_pcie_ep *ep,
> > > +						u8 func_no)
> > > +{
> > > +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > +	struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
> > > +	u8 header_type;
> > > +
> > > +	header_type = ioread8(pci->dbi_base + PCI_HEADER_TYPE);
> > > +
> > > +	if (header_type & (1 << 7))
> > > +		return pcie->drvdata->func_offset * func_no;
> > > +	else
> > > +		return 0;
> > 
> > It looks like there isn't a PCI define for multi function, the nearest I could find
> > was PCI_HEADER_TYPE_MULTIDEVICE in hotplug/ibmphp.h. A comment
> > above the test might be helpful to explain the test.
> 
> OK, I will add a comment above this code.
> 
> > 
> > As the ls_pcie_ep_drvdata structures are static, the unset .func_offset will be
> > initialised to 0, so you could just drop the test above.
> 
> Due to the different PCIe controller have different property, e.g. PCIe controller1 support
> multiple function feature, but PCIe controller2 don't support this feature, so I need to check
> which controller support it and return the correct offset value, but each board only have one
> ls_pcie_ep_drvdata, ^_^.

Yes but if they don't support the feature then func_offset will be 0.

> 
> > 
> > However something to the effect of the following may help spot
> > misconfiguration:
> > 
> > WARN_ON(func_no && !pcie->drvdata->func_offset); return
> > pcie->drvdata->func_offset * func_no;
> > 
> > The WARN is probably quite useful as if you are attempting to use non-zero
> > functions and func_offset isn't set - then things may appear to work normally
> > but actually will break horribly.
> 
> As discussion before, I think the func_offset should not depends on the function
> number, even if other platforms of NXP may be use write registers way to access 
> the different function config space. 

I agree that func_offset is an optional parameter. But if you are attempting
to determine the offset of a function and you are given a non-zero function
number - then something has gone wrong if func_offset is 0.

Thanks,

Andrew Murray

> 
> I have added the comments above the code, as follow, do you have any advice?
> +static unsigned int ls_pcie_ep_func_conf_select(struct dw_pcie_ep *ep,
> +                                               u8 func_no)
> +{
> +       struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +       struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
> +       u8 header_type;
> +
> +       header_type = ioread8(pci->dbi_base + PCI_HEADER_TYPE);
> +
> +       /*
> +        * Read the Header Type register of config space to check
> +        * whether this PCI device support the multiple function.
> +        */
> +       if (header_type & (1 << 7))
> +               return pcie->drvdata->func_offset * func_no;
> +
> +       return 0;
> +}
> 
> Thanks a lot for your detail comments.
> 
> > 
> > Thanks,
> > 
> > Andrew Murray
> > 
> > > +}
> > > +
> > > +static const struct dw_pcie_ep_ops ls_pcie_ep_ops = {
> > >  	.ep_init = ls_pcie_ep_init,
> > >  	.raise_irq = ls_pcie_ep_raise_irq,
> > >  	.get_features = ls_pcie_ep_get_features,
> > > +	.func_conf_select = ls_pcie_ep_func_conf_select, };
> > > +
> > > +static const struct ls_pcie_ep_drvdata ls1_ep_drvdata = {
> > > +	.ops = &ls_pcie_ep_ops,
> > > +	.dw_pcie_ops = &dw_ls_pcie_ep_ops,
> > > +};
> > > +
> > > +static const struct ls_pcie_ep_drvdata ls2_ep_drvdata = {
> > > +	.func_offset = 0x20000,
> > > +	.ops = &ls_pcie_ep_ops,
> > > +	.dw_pcie_ops = &dw_ls_pcie_ep_ops,
> > > +};
> > > +
> > > +static const struct of_device_id ls_pcie_ep_of_match[] = {
> > > +	{ .compatible = "fsl,ls1046a-pcie-ep", .data = &ls1_ep_drvdata },
> > > +	{ .compatible = "fsl,ls1088a-pcie-ep", .data = &ls2_ep_drvdata },
> > > +	{ .compatible = "fsl,ls2088a-pcie-ep", .data = &ls2_ep_drvdata },
> > > +	{ },
> > >  };
> > >
> > >  static int __init ls_add_pcie_ep(struct ls_pcie_ep *pcie, @@ -98,7
> > > +134,7 @@ static int __init ls_add_pcie_ep(struct ls_pcie_ep *pcie,
> > >  	int ret;
> > >
> > >  	ep = &pci->ep;
> > > -	ep->ops = &pcie_ep_ops;
> > > +	ep->ops = pcie->drvdata->ops;
> > >
> > >  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > "addr_space");
> > >  	if (!res)
> > > @@ -137,14 +173,11 @@ static int __init ls_pcie_ep_probe(struct
> > platform_device *pdev)
> > >  	if (!ls_epc)
> > >  		return -ENOMEM;
> > >
> > > -	dbi_base = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > "regs");
> > > -	pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_base);
> > > -	if (IS_ERR(pci->dbi_base))
> > > -		return PTR_ERR(pci->dbi_base);
> > > +	pcie->drvdata = of_device_get_match_data(dev);
> > >
> > > -	pci->dbi_base2 = pci->dbi_base + PCIE_DBI2_OFFSET;
> > >  	pci->dev = dev;
> > > -	pci->ops = &ls_pcie_ep_ops;
> > > +	pci->ops = pcie->drvdata->dw_pcie_ops;
> > > +
> > >  	pcie->pci = pci;
> > >
> > >  	ls_epc->linkup_notifier = false,
> > > @@ -152,6 +185,13 @@ static int __init ls_pcie_ep_probe(struct
> > > platform_device *pdev)
> > >
> > >  	pcie->ls_epc = ls_epc;
> > >
> > > +	dbi_base = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > "regs");
> > > +	pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_base);
> > > +	if (IS_ERR(pci->dbi_base))
> > > +		return PTR_ERR(pci->dbi_base);
> > > +
> > > +	pci->dbi_base2 = pci->dbi_base + PCIE_DBI2_OFFSET;
> > > +
> > >  	platform_set_drvdata(pdev, pcie);
> > >
> > >  	ret = ls_add_pcie_ep(pcie, pdev);
> > > --
> > > 2.9.5
> > >
