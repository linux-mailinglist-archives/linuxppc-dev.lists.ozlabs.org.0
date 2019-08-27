Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 268439EB95
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 16:53:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HsM50VqJzDqLF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 00:53:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=andrew.murray@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46HsFK5R0GzDqdX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 00:48:35 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CAF2337;
 Tue, 27 Aug 2019 07:48:33 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6957B3F59C;
 Tue, 27 Aug 2019 07:48:32 -0700 (PDT)
Date: Tue, 27 Aug 2019 15:48:31 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH v2 08/10] PCI: layerscape: Add EP mode support for
 ls1088a and ls2088a
Message-ID: <20190827144830.GN14582@e119886-lin.cambridge.arm.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-8-xiaowei.bao@nxp.com>
 <20190823142756.GI14582@e119886-lin.cambridge.arm.com>
 <AM5PR04MB32990473D4AD65354B5B2235F5A70@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <89c90732-5e42-f87e-73b1-8d615355afc4@c-s.fr>
 <AM5PR04MB3299EBADE7BC04C3465B7DB7F5A60@AM5PR04MB3299.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM5PR04MB3299EBADE7BC04C3465B7DB7F5A60@AM5PR04MB3299.eurprd04.prod.outlook.com>
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
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "lorenzo.pieralisi@arm.co" <lorenzo.pieralisi@arm.co>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Leo Li <leoyang.li@nxp.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kishon@ti.com" <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Roy Zang <roy.zang@nxp.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Aug 25, 2019 at 03:07:32AM +0000, Xiaowei Bao wrote:
> 
> 
> > -----Original Message-----
> > From: christophe leroy <christophe.leroy@c-s.fr>
> > Sent: 2019年8月24日 14:45
> > To: Xiaowei Bao <xiaowei.bao@nxp.com>; Andrew Murray
> > <andrew.murray@arm.com>
> > Cc: mark.rutland@arm.com; Roy Zang <roy.zang@nxp.com>;
> > lorenzo.pieralisi@arm.co; arnd@arndb.de; devicetree@vger.kernel.org;
> > gregkh@linuxfoundation.org; linuxppc-dev@lists.ozlabs.org;
> > linux-pci@vger.kernel.org; linux-kernel@vger.kernel.org; kishon@ti.com; M.h.
> > Lian <minghuan.lian@nxp.com>; robh+dt@kernel.org;
> > gustavo.pimentel@synopsys.com; jingoohan1@gmail.com;
> > bhelgaas@google.com; Leo Li <leoyang.li@nxp.com>; shawnguo@kernel.org;
> > Mingkai Hu <mingkai.hu@nxp.com>; linux-arm-kernel@lists.infradead.org
> > Subject: Re: [PATCH v2 08/10] PCI: layerscape: Add EP mode support for
> > ls1088a and ls2088a
> > 
> > 
> > 
> > Le 24/08/2019 à 02:18, Xiaowei Bao a écrit :
> > >
> > >
> > >> -----Original Message-----
> > >> From: Andrew Murray <andrew.murray@arm.com>
> > >> Sent: 2019年8月23日 22:28
> > >> To: Xiaowei Bao <xiaowei.bao@nxp.com>
> > >> Cc: bhelgaas@google.com; robh+dt@kernel.org; mark.rutland@arm.com;
> > >> shawnguo@kernel.org; Leo Li <leoyang.li@nxp.com>; kishon@ti.com;
> > >> lorenzo.pieralisi@arm.co; arnd@arndb.de; gregkh@linuxfoundation.org;
> > M.h.
> > >> Lian <minghuan.lian@nxp.com>; Mingkai Hu <mingkai.hu@nxp.com>; Roy
> > >> Zang <roy.zang@nxp.com>; jingoohan1@gmail.com;
> > >> gustavo.pimentel@synopsys.com; linux-pci@vger.kernel.org;
> > >> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > >> linux-arm-kernel@lists.infradead.org; linuxppc-dev@lists.ozlabs.org
> > >> Subject: Re: [PATCH v2 08/10] PCI: layerscape: Add EP mode support
> > >> for ls1088a and ls2088a
> > >>
> > >> On Thu, Aug 22, 2019 at 07:22:40PM +0800, Xiaowei Bao wrote:
> > >>> Add PCIe EP mode support for ls1088a and ls2088a, there are some
> > >>> difference between LS1 and LS2 platform, so refactor the code of the
> > >>> EP driver.
> > >>>
> > >>> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > >>> ---
> > >>> v2:
> > >>>   - New mechanism for layerscape EP driver.
> > >>
> > >> Was there a v1 of this patch?
> > >
> > > Yes, but I don't know how to comments, ^_^
> > 
> > As far as I can see, in the previous version of the series
> > (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatch
> > work.ozlabs.org%2Fproject%2Flinuxppc-dev%2Flist%2F%3Fseries%3D125315
> > %26state%3D*&amp;data=02%7C01%7Cxiaowei.bao%40nxp.com%7C1befe9
> > a67c8046f9535e08d7285eaab6%7C686ea1d3bc2b4c6fa92cd99c5c301635%
> > 7C0%7C0%7C637022259387139020&amp;sdata=p4wbycd04Z7qRUfAoZtwc
> > UP7pR%2FuA3%2FjVcWMz6YyQVQ%3D&amp;reserved=0),
> > the 8/10 was something completely different, and I can't find any other patch
> > in the series that could have been the v1 of this patch.
> 
> Thanks, I will correct it to v1 in next version patch.

I think you numbered it correctly (so please leave it as v2, referring to
the patch series revision) - I got confused trying to find a previous
version of this patch.

Perhaps in the future when new patches are introduced in a series you can
indicate that in the description patch revision history (e.g. introduced
in v2).

Thanks,

Andrew Murray 

> 
> > 
> > Christophe
> > 
> > >
> > >>
> > >>>
> > >>>   drivers/pci/controller/dwc/pci-layerscape-ep.c | 76
> > >>> ++++++++++++++++++++------
> > >>>   1 file changed, 58 insertions(+), 18 deletions(-)
> > >>>
> > >>> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > >>> b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > >>> index 7ca5fe8..2a66f07 100644
> > >>> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > >>> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > >>> @@ -20,27 +20,29 @@
> > >>>
> > >>>   #define PCIE_DBI2_OFFSET		0x1000	/* DBI2 base address*/
> > >>>
> > >>> -struct ls_pcie_ep {
> > >>> -	struct dw_pcie		*pci;
> > >>> -	struct pci_epc_features	*ls_epc;
> > >>> +#define to_ls_pcie_ep(x)	dev_get_drvdata((x)->dev)
> > >>> +
> > >>> +struct ls_pcie_ep_drvdata {
> > >>> +	u32				func_offset;
> > >>> +	const struct dw_pcie_ep_ops	*ops;
> > >>> +	const struct dw_pcie_ops	*dw_pcie_ops;
> > >>>   };
> > >>>
> > >>> -#define to_ls_pcie_ep(x)	dev_get_drvdata((x)->dev)
> > >>> +struct ls_pcie_ep {
> > >>> +	struct dw_pcie			*pci;
> > >>> +	struct pci_epc_features		*ls_epc;
> > >>> +	const struct ls_pcie_ep_drvdata *drvdata; };
> > >>>
> > >>>   static int ls_pcie_establish_link(struct dw_pcie *pci)  {
> > >>>   	return 0;
> > >>>   }
> > >>>
> > >>> -static const struct dw_pcie_ops ls_pcie_ep_ops = {
> > >>> +static const struct dw_pcie_ops dw_ls_pcie_ep_ops = {
> > >>>   	.start_link = ls_pcie_establish_link,  };
> > >>>
> > >>> -static const struct of_device_id ls_pcie_ep_of_match[] = {
> > >>> -	{ .compatible = "fsl,ls-pcie-ep",},
> > >>> -	{ },
> > >>> -};
> > >>> -
> > >>>   static const struct pci_epc_features*
> > >>> ls_pcie_ep_get_features(struct dw_pcie_ep *ep)  { @@ -82,10 +84,44
> > >>> @@ static int ls_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > >>>   	}
> > >>>   }
> > >>>
> > >>> -static const struct dw_pcie_ep_ops pcie_ep_ops = {
> > >>> +static unsigned int ls_pcie_ep_func_conf_select(struct dw_pcie_ep *ep,
> > >>> +						u8 func_no)
> > >>> +{
> > >>> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > >>> +	struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
> > >>> +	u8 header_type;
> > >>> +
> > >>> +	header_type = ioread8(pci->dbi_base + PCI_HEADER_TYPE);
> > >>> +
> > >>> +	if (header_type & (1 << 7))
> > >>> +		return pcie->drvdata->func_offset * func_no;
> > >>> +	else
> > >>> +		return 0;
> > >>
> > >> It looks like there isn't a PCI define for multi function, the
> > >> nearest I could find was PCI_HEADER_TYPE_MULTIDEVICE in
> > >> hotplug/ibmphp.h. A comment above the test might be helpful to explain
> > the test.
> > >
> > > Yes, I have not find the PCI_HEADER_TYPE_MULTIDEVICE define. OK, I
> > > will add The comments in next version patch.
> > >
> > >>
> > >> As the ls_pcie_ep_drvdata structures are static, the unset
> > >> .func_offset will be initialised to 0, so you could just drop the test above.
> > >
> > > OK, thanks
> > >
> > >>
> > >> However something to the effect of the following may help spot
> > >> misconfiguration:
> > >>
> > >> WARN_ON(func_no && !pcie->drvdata->func_offset); return
> > >> pcie->drvdata->func_offset * func_no;
> > >
> > > Thanks a lot, this looks better.
> > >
> > >>
> > >> The WARN is probably quite useful as if you are attempting to use
> > >> non-zero functions and func_offset isn't set - then things may appear
> > >> to work normally but actually will break horribly.
> > >
> > > got it, thanks.
> > >
> > >>
> > >> Thanks,
> > >>
> > >> Andrew Murray
> > >>
> > >>> +}
> > >>> +
> > >>> +static const struct dw_pcie_ep_ops ls_pcie_ep_ops = {
> > >>>   	.ep_init = ls_pcie_ep_init,
> > >>>   	.raise_irq = ls_pcie_ep_raise_irq,
> > >>>   	.get_features = ls_pcie_ep_get_features,
> > >>> +	.func_conf_select = ls_pcie_ep_func_conf_select, };
> > >>> +
> > >>> +static const struct ls_pcie_ep_drvdata ls1_ep_drvdata = {
> > >>> +	.ops = &ls_pcie_ep_ops,
> > >>> +	.dw_pcie_ops = &dw_ls_pcie_ep_ops, };
> > >>> +
> > >>> +static const struct ls_pcie_ep_drvdata ls2_ep_drvdata = {
> > >>> +	.func_offset = 0x20000,
> > >>> +	.ops = &ls_pcie_ep_ops,
> > >>> +	.dw_pcie_ops = &dw_ls_pcie_ep_ops, };
> > >>> +
> > >>> +static const struct of_device_id ls_pcie_ep_of_match[] = {
> > >>> +	{ .compatible = "fsl,ls1046a-pcie-ep", .data = &ls1_ep_drvdata },
> > >>> +	{ .compatible = "fsl,ls1088a-pcie-ep", .data = &ls2_ep_drvdata },
> > >>> +	{ .compatible = "fsl,ls2088a-pcie-ep", .data = &ls2_ep_drvdata },
> > >>> +	{ },
> > >>>   };
> > >>>
> > >>>   static int __init ls_add_pcie_ep(struct ls_pcie_ep *pcie, @@ -98,7
> > >>> +134,7 @@ static int __init ls_add_pcie_ep(struct ls_pcie_ep *pcie,
> > >>>   	int ret;
> > >>>
> > >>>   	ep = &pci->ep;
> > >>> -	ep->ops = &pcie_ep_ops;
> > >>> +	ep->ops = pcie->drvdata->ops;
> > >>>
> > >>>   	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > >> "addr_space");
> > >>>   	if (!res)
> > >>> @@ -137,14 +173,11 @@ static int __init ls_pcie_ep_probe(struct
> > >> platform_device *pdev)
> > >>>   	if (!ls_epc)
> > >>>   		return -ENOMEM;
> > >>>
> > >>> -	dbi_base = platform_get_resource_byname(pdev,
> > IORESOURCE_MEM,
> > >> "regs");
> > >>> -	pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_base);
> > >>> -	if (IS_ERR(pci->dbi_base))
> > >>> -		return PTR_ERR(pci->dbi_base);
> > >>> +	pcie->drvdata = of_device_get_match_data(dev);
> > >>>
> > >>> -	pci->dbi_base2 = pci->dbi_base + PCIE_DBI2_OFFSET;
> > >>>   	pci->dev = dev;
> > >>> -	pci->ops = &ls_pcie_ep_ops;
> > >>> +	pci->ops = pcie->drvdata->dw_pcie_ops;
> > >>> +
> > >>>   	pcie->pci = pci;
> > >>>
> > >>>   	ls_epc->linkup_notifier = false,
> > >>> @@ -152,6 +185,13 @@ static int __init ls_pcie_ep_probe(struct
> > >>> platform_device *pdev)
> > >>>
> > >>>   	pcie->ls_epc = ls_epc;
> > >>>
> > >>> +	dbi_base = platform_get_resource_byname(pdev,
> > IORESOURCE_MEM,
> > >> "regs");
> > >>> +	pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_base);
> > >>> +	if (IS_ERR(pci->dbi_base))
> > >>> +		return PTR_ERR(pci->dbi_base);
> > >>> +
> > >>> +	pci->dbi_base2 = pci->dbi_base + PCIE_DBI2_OFFSET;
> > >>> +
> > >>>   	platform_set_drvdata(pdev, pcie);
> > >>>
> > >>>   	ret = ls_add_pcie_ep(pcie, pdev);
> > >>> --
> > >>> 2.9.5
> > >>>
> > 
> > ---
> > L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel
> > antivirus Avast.
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.
> > avast.com%2Fantivirus&amp;data=02%7C01%7Cxiaowei.bao%40nxp.com%7
> > C1befe9a67c8046f9535e08d7285eaab6%7C686ea1d3bc2b4c6fa92cd99c5c3
> > 01635%7C0%7C0%7C637022259387139020&amp;sdata=JAYds7X%2FHVxgtrg
> > e%2F%2FvnP84zdb2yReXcctQUiSLC11I%3D&amp;reserved=0
> 
