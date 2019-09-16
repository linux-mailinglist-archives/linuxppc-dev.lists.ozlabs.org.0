Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0F9B3CBE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 16:41:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46X87V067tzF4ky
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 00:41:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=andrew.murray@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46X83l4bV2zDrhN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 00:37:52 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F1921000;
 Mon, 16 Sep 2019 07:37:49 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90B873F67D;
 Mon, 16 Sep 2019 07:37:48 -0700 (PDT)
Date: Mon, 16 Sep 2019 15:37:47 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>, robh+dt@kernel.org
Subject: Re: [PATCH v3 09/11] PCI: layerscape: Add EP mode support for
 ls1088a and ls2088a
Message-ID: <20190916143746.GU9720@e119886-lin.cambridge.arm.com>
References: <20190902031716.43195-1-xiaowei.bao@nxp.com>
 <20190902031716.43195-10-xiaowei.bao@nxp.com>
 <20190902124603.GJ9720@e119886-lin.cambridge.arm.com>
 <AM5PR04MB329970AE2C1812E88B9DE5A2F5B90@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <20190912124943.GD9720@e119886-lin.cambridge.arm.com>
 <AM5PR04MB3299CE219E17931066E1DA3CF5B20@AM5PR04MB3299.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM5PR04MB3299CE219E17931066E1DA3CF5B20@AM5PR04MB3299.eurprd04.prod.outlook.com>
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "Z.q. Hou" <zhiqiang.hou@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kishon@ti.com" <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 Leo Li <leoyang.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 14, 2019 at 04:10:22AM +0000, Xiaowei Bao wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Murray <andrew.murray@arm.com>
> > Sent: 2019年9月12日 20:50
> > To: Xiaowei Bao <xiaowei.bao@nxp.com>
> > Cc: robh+dt@kernel.org; mark.rutland@arm.com; shawnguo@kernel.org; Leo
> > Li <leoyang.li@nxp.com>; kishon@ti.com; lorenzo.pieralisi@arm.com; M.h.
> > Lian <minghuan.lian@nxp.com>; Mingkai Hu <mingkai.hu@nxp.com>; Roy
> > Zang <roy.zang@nxp.com>; jingoohan1@gmail.com;
> > gustavo.pimentel@synopsys.com; linux-pci@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linuxppc-dev@lists.ozlabs.org;
> > arnd@arndb.de; gregkh@linuxfoundation.org; Z.q. Hou
> > <zhiqiang.hou@nxp.com>
> > Subject: Re: [PATCH v3 09/11] PCI: layerscape: Add EP mode support for
> > ls1088a and ls2088a
> > 
> > On Tue, Sep 03, 2019 at 01:47:36AM +0000, Xiaowei Bao wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Andrew Murray <andrew.murray@arm.com>
> > > > Sent: 2019年9月2日 20:46
> > > > To: Xiaowei Bao <xiaowei.bao@nxp.com>
> > > > Cc: robh+dt@kernel.org; mark.rutland@arm.com; shawnguo@kernel.org;
> > > > Leo Li <leoyang.li@nxp.com>; kishon@ti.com; lorenzo.pieralisi@arm.com;
> > M.h.
> > > > Lian <minghuan.lian@nxp.com>; Mingkai Hu <mingkai.hu@nxp.com>; Roy
> > > > Zang <roy.zang@nxp.com>; jingoohan1@gmail.com;
> > > > gustavo.pimentel@synopsys.com; linux-pci@vger.kernel.org;
> > > > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > > > linux-arm-kernel@lists.infradead.org; linuxppc-dev@lists.ozlabs.org;
> > > > arnd@arndb.de; gregkh@linuxfoundation.org; Z.q. Hou
> > > > <zhiqiang.hou@nxp.com>
> > > > Subject: Re: [PATCH v3 09/11] PCI: layerscape: Add EP mode support
> > > > for ls1088a and ls2088a
> > > >
> > > > On Mon, Sep 02, 2019 at 11:17:14AM +0800, Xiaowei Bao wrote:
> > > > > Add PCIe EP mode support for ls1088a and ls2088a, there are some
> > > > > difference between LS1 and LS2 platform, so refactor the code of
> > > > > the EP driver.
> > > > >
> > > > > Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > > > > ---
> > > > > v2:
> > > > >  - This is a new patch for supporting the ls1088a and ls2088a platform.
> > > > > v3:
> > > > >  - Adjust the some struct assignment order in probe function.
> > > > >
> > > > >  drivers/pci/controller/dwc/pci-layerscape-ep.c | 72
> > > > > +++++++++++++++++++-------
> > > > >  1 file changed, 53 insertions(+), 19 deletions(-)
> > > > >
> > > > > diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > > > b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > > > index 5f0cb99..723bbe5 100644
> > > > > --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > > > +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > > > @@ -20,27 +20,29 @@
> > > > >
> > > > >  #define PCIE_DBI2_OFFSET		0x1000	/* DBI2 base address*/
> > > > >
> > > > > -struct ls_pcie_ep {
> > > > > -	struct dw_pcie		*pci;
> > > > > -	struct pci_epc_features	*ls_epc;
> > > > > +#define to_ls_pcie_ep(x)	dev_get_drvdata((x)->dev)
> > > > > +
> > > > > +struct ls_pcie_ep_drvdata {
> > > > > +	u32				func_offset;
> > > > > +	const struct dw_pcie_ep_ops	*ops;
> > > > > +	const struct dw_pcie_ops	*dw_pcie_ops;
> > > > >  };
> > > > >
> > > > > -#define to_ls_pcie_ep(x)	dev_get_drvdata((x)->dev)
> > > > > +struct ls_pcie_ep {
> > > > > +	struct dw_pcie			*pci;
> > > > > +	struct pci_epc_features		*ls_epc;
> > > > > +	const struct ls_pcie_ep_drvdata *drvdata; };
> > > > >
> > > > >  static int ls_pcie_establish_link(struct dw_pcie *pci)  {
> > > > >  	return 0;
> > > > >  }
> > > > >
> > > > > -static const struct dw_pcie_ops ls_pcie_ep_ops = {
> > > > > +static const struct dw_pcie_ops dw_ls_pcie_ep_ops = {
> > > > >  	.start_link = ls_pcie_establish_link,  };
> > > > >
> > > > > -static const struct of_device_id ls_pcie_ep_of_match[] = {
> > > > > -	{ .compatible = "fsl,ls-pcie-ep",},
> > > > > -	{ },
> > > > > -};
> > > > > -
> > > > >  static const struct pci_epc_features*
> > > > > ls_pcie_ep_get_features(struct dw_pcie_ep *ep)  { @@ -87,10 +89,39
> > > > > @@ static int ls_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > > >  	}
> > > > >  }
> > > > >
> > > > > -static const struct dw_pcie_ep_ops pcie_ep_ops = {
> > > > > +static unsigned int ls_pcie_ep_func_conf_select(struct dw_pcie_ep
> > *ep,
> > > > > +						u8 func_no)
> > > > > +{
> > > > > +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > > > +	struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
> > > > > +
> > > > > +	WARN_ON(func_no && !pcie->drvdata->func_offset);
> > > > > +	return pcie->drvdata->func_offset * func_no; }
> > > > > +
> > > > > +static const struct dw_pcie_ep_ops ls_pcie_ep_ops = {
> > > > >  	.ep_init = ls_pcie_ep_init,
> > > > >  	.raise_irq = ls_pcie_ep_raise_irq,
> > > > >  	.get_features = ls_pcie_ep_get_features,
> > > > > +	.func_conf_select = ls_pcie_ep_func_conf_select, };
> > > > > +
> > > > > +static const struct ls_pcie_ep_drvdata ls1_ep_drvdata = {
> > > > > +	.ops = &ls_pcie_ep_ops,
> > > > > +	.dw_pcie_ops = &dw_ls_pcie_ep_ops, };
> > > > > +
> > > > > +static const struct ls_pcie_ep_drvdata ls2_ep_drvdata = {
> > > > > +	.func_offset = 0x20000,
> > > > > +	.ops = &ls_pcie_ep_ops,
> > > > > +	.dw_pcie_ops = &dw_ls_pcie_ep_ops, };
> > > > > +
> > > > > +static const struct of_device_id ls_pcie_ep_of_match[] = {
> > > > > +	{ .compatible = "fsl,ls1046a-pcie-ep", .data = &ls1_ep_drvdata },
> > > > > +	{ .compatible = "fsl,ls1088a-pcie-ep", .data = &ls2_ep_drvdata },
> > > > > +	{ .compatible = "fsl,ls2088a-pcie-ep", .data = &ls2_ep_drvdata },
> > > > > +	{ },
> > > >
> > > > This removes support for "fsl,ls-pcie-ep" - was that intentional? If
> > > > you do plan to drop it please make sure you explain why in the
> > > > commit message. See also my comments in your dt-binding patch.
> > >
> > > In fact, the u-boot will fixup the status property to 'status =
> > > enabled' in PCI node of the DTS base on "fsl,ls-pcie-ep" compatible,
> > > so "fsl,ls-pcie-ep" is used, I used this compatible before, because
> > > the driver only support the LS1046a, but this time, I add the LS1088a
> > > and LS2088a support, and these two boards have some difference form
> > LS1046a, so I changed the compatible. I am not sure whether need to add
> > "fsl,ls-pcie-ep"
> > > in there, could you give some advice, thanks a lot.
> > 
> > It sounds like "fsl,ls-pcie-ep" can be a fallback for "fsl,ls1046a-pcie-ep".
> 
> This is not a fallback, the compatible "fsl,ls1046a-pcie-ep" is used by bootloader,
> the bootloader will modify the status property, the bootloader code get the
> PCI_HEADER_TYPE(0xe) of config space to decide enable which node(EP or RC)
> status property. At the beginning, we plan to use one compatible "fsl,ls1046a-pcie-ep"
> support all NXP's platform, but actually, due to the difference of each platform,
> it is difficult.

I've looked at the U-Boot source [1] and device trees, I think I understand
what happens here.

The DT describes disabled nodes for both fsl,lsXXXXX-pcie and
fsl,lxXXXXX-pcie-ep. U-Boot looks at the nodes and compares with the actual PCI
config space to determine the current hardware configuration type. It will
then *enable* either the RC or EP.

However U-Boot currently only looks for a compatible string with "fsl,ls-pcie"
or "fsl,ls-pcie-ep". This is why the DT needs to describe a PCI node as both
"fsl,lsXXXXX-pcie-ep" and "fsl,ls-pcie" - the first for kernel and the second
for the U-Boot. (The second is no longer needed by the kernel driver as you
are now using the more specific names).

Looking again at your bindings patch...

diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
index e20ceaa..762ae41 100644
--- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
+++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
@@ -22,7 +22,9 @@  Required properties:
         "fsl,ls1043a-pcie"
         "fsl,ls1012a-pcie"
   EP mode:
-	"fsl,ls1046a-pcie-ep", "fsl,ls-pcie-ep"
+	"fsl,ls1046a-pcie-ep" "fsl,ls-pcie-ep"
+	"fsl,ls1088a-pcie-ep" "fsl,ls-pcie-ep"
+	"fsl,ls2088a-pcie-ep" "fsl,ls-pcie-ep"

... the "fsl,ls-pcie-ep" is added *only* to the EP mode.

But doesn't U-Boot need "fsl,ls-pcie-ep" added to each of the RC modes as
well, to ensure they are set to enabled before booting the kernel?

Rob - Do we document compatible names like this that are used in the DT
but not used by the kernel?

In any case, prior to this series it would have been possible to use a
ls1046a device with a DT that has only string "fsl,ls-pcie-ep" - now that
doesn't work. If this is of concern then &ls1_ep_drvdata should also be
used for fsl,ls-pcie-ep.

Thanks,

Andrew Murray

[1] https://gitlab.denx.de/u-boot/u-boot/blob/master/drivers/pci/pcie_layerscape_fixup.c

> 
> > 
> > I'm assuming that if someone used "fsl,ls1046a-pcie-ep" on ls1088a or
> > ls2088a hardware it would still work, but without the multiple PF support.
> > 
> 
> I think the EP driver will not work if use current code, due to the current driver
> need driver data. 
> 
> > I.e. if "fsl,ls-pcie-ep" is given, treat it as ls1046a.
> 
> 
> 
> > 
> > Thanks,
> > 
> > Andrew Murray
> > 
> > >
> > > Thanks
> > > Xiaowei
> > >
> > > >
> > > > Thanks,
> > > >
> > > > Andrew Murray
> > > >
> > > > >  };
> > > > >
> > > > >  static int __init ls_add_pcie_ep(struct ls_pcie_ep *pcie, @@
> > > > > -103,7
> > > > > +134,7 @@ static int __init ls_add_pcie_ep(struct ls_pcie_ep
> > > > > +*pcie,
> > > > >  	int ret;
> > > > >
> > > > >  	ep = &pci->ep;
> > > > > -	ep->ops = &pcie_ep_ops;
> > > > > +	ep->ops = pcie->drvdata->ops;
> > > > >
> > > > >  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > > > "addr_space");
> > > > >  	if (!res)
> > > > > @@ -142,20 +173,23 @@ static int __init ls_pcie_ep_probe(struct
> > > > platform_device *pdev)
> > > > >  	if (!ls_epc)
> > > > >  		return -ENOMEM;
> > > > >
> > > > > -	dbi_base = platform_get_resource_byname(pdev,
> > IORESOURCE_MEM,
> > > > "regs");
> > > > > -	pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_base);
> > > > > -	if (IS_ERR(pci->dbi_base))
> > > > > -		return PTR_ERR(pci->dbi_base);
> > > > > +	pcie->drvdata = of_device_get_match_data(dev);
> > > > >
> > > > > -	pci->dbi_base2 = pci->dbi_base + PCIE_DBI2_OFFSET;
> > > > >  	pci->dev = dev;
> > > > > -	pci->ops = &ls_pcie_ep_ops;
> > > > > -	pcie->pci = pci;
> > > > > +	pci->ops = pcie->drvdata->dw_pcie_ops;
> > > > >
> > > > >  	ls_epc->bar_fixed_64bit = (1 << BAR_2) | (1 << BAR_4),
> > > > >
> > > > > +	pcie->pci = pci;
> > > > >  	pcie->ls_epc = ls_epc;
> > > > >
> > > > > +	dbi_base = platform_get_resource_byname(pdev,
> > IORESOURCE_MEM,
> > > > "regs");
> > > > > +	pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_base);
> > > > > +	if (IS_ERR(pci->dbi_base))
> > > > > +		return PTR_ERR(pci->dbi_base);
> > > > > +
> > > > > +	pci->dbi_base2 = pci->dbi_base + PCIE_DBI2_OFFSET;
> > > > > +
> > > > >  	platform_set_drvdata(pdev, pcie);
> > > > >
> > > > >  	ret = ls_add_pcie_ep(pcie, pdev);
> > > > > --
> > > > > 2.9.5
> > > > >
