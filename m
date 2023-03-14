Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 988176BA0CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 21:33:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pblbr3bzTz3cj5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 07:33:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Gv5hrPOv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Gv5hrPOv;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PblZt3Mqbz3cM7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 07:32:54 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C50AA6199F;
	Tue, 14 Mar 2023 20:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78D6C433D2;
	Tue, 14 Mar 2023 20:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678825971;
	bh=AgqlCoM5/iuM3VeFQs/UEhZ2BRcdrerQfTSev8mvG6I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Gv5hrPOvUSFXMGHXrpf78yxXeD4DvycoRvNmUvoUJEt+Wgz82GzIDbmzngQ9U6lSh
	 5kSQkR5xHhrhD91FI3Kp5l7c/ggIsgbH9EUcDDnV6Ra6f/0ptuECuxdFzXCVcAph5+
	 JXj2vGyK/RX0Ew/9JJSn+rs6iBOMHSbZP/q0hFZAKXh0y6cgWV11sCvrXjKS7+wydf
	 I9iS/PX2wJWsSu9NMShkCDf5Hi1caJrkwV6sF3tavxHXVLEoZgLYUtDDVyhQxQ8qTh
	 QL2FU+URaGjF+p/bHVR/TJnP9IFLwDzknxZO0b7JxowCL5mpnn/GpEd24zf7mlXSpL
	 BmxUvzB1rWP+w==
Date: Tue, 14 Mar 2023 15:32:49 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] PCI: layerscape: Add the workaround for A-010305
Message-ID: <20230314203249.GA1673140@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112194433.1514149-1-Frank.Li@nxp.com>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, imx@lists.linux.dev, Rob Herring <robh@kernel.org>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, open list <linux-kernel@vger.kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 12, 2023 at 02:44:33PM -0500, Frank Li wrote:
> From: Xiaowei Bao <xiaowei.bao@nxp.com>
> 
> When a link down or hot reset event occurs, the PCI Express EP
> controller's Link Capabilities Register should retain the values of
> the Maximum Link Width and Supported Link Speed configured by RCW.

Can you rework this to say what the patch does and why it's necessary?

Apparently it's a workaround for some issue in A-010305?  The subject
line could also use more content.  What is A-010305?  What is the
problem this works around?

I don't see a check for A-010305; do *all* devices handled by this
driver have this problem?

The PCIe Link Capabilities is supposed to be read-only; maybe this
device loses the value on link down or hot reset?  And I guess the
device interrupts on link up/down and reset, and you restore the value
then?

Link Capabilities contains several things other than Max Link Width
and Max Link Speed.  But they don't need to be restored?

What is RCW?

> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../pci/controller/dwc/pci-layerscape-ep.c    | 112 +++++++++++++++++-
>  1 file changed, 111 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index ed5cfc9408d9..1b884854c18e 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -18,6 +18,22 @@
>  
>  #include "pcie-designware.h"
>  
> +#define PCIE_LINK_CAP			0x7C	/* PCIe Link Capabilities*/

Is this something you can find by searching the capability list
instead of hard-coding the config space offset?

> +#define MAX_LINK_SP_MASK		0x0F
> +#define MAX_LINK_W_MASK			0x3F
> +#define MAX_LINK_W_SHIFT		4

These look like they should use PCI_EXP_LNKCAP_SLS and
PCI_EXP_LNKCAP_MLW instead of defining new ones.

> +/* PEX PFa PCIE pme and message interrupt registers*/
> +#define PEX_PF0_PME_MES_DR             0xC0020
> +#define PEX_PF0_PME_MES_DR_LUD         (1 << 7)
> +#define PEX_PF0_PME_MES_DR_LDD         (1 << 9)
> +#define PEX_PF0_PME_MES_DR_HRD         (1 << 10)
> +
> +#define PEX_PF0_PME_MES_IER            0xC0028
> +#define PEX_PF0_PME_MES_IER_LUDIE      (1 << 7)
> +#define PEX_PF0_PME_MES_IER_LDDIE      (1 << 9)
> +#define PEX_PF0_PME_MES_IER_HRDIE      (1 << 10)
> +
>  #define to_ls_pcie_ep(x)	dev_get_drvdata((x)->dev)
>  
>  struct ls_pcie_ep_drvdata {
> @@ -30,8 +46,90 @@ struct ls_pcie_ep {
>  	struct dw_pcie			*pci;
>  	struct pci_epc_features		*ls_epc;
>  	const struct ls_pcie_ep_drvdata *drvdata;
> +	u8				max_speed;
> +	u8				max_width;
> +	bool				big_endian;
> +	int				irq;
>  };
>  
> +static u32 ls_lut_readl(struct ls_pcie_ep *pcie, u32 offset)
> +{
> +	struct dw_pcie *pci = pcie->pci;
> +
> +	if (pcie->big_endian)
> +		return ioread32be(pci->dbi_base + offset);
> +	else
> +		return ioread32(pci->dbi_base + offset);
> +}
> +
> +static void ls_lut_writel(struct ls_pcie_ep *pcie, u32 offset,
> +			  u32 value)
> +{
> +	struct dw_pcie *pci = pcie->pci;
> +
> +	if (pcie->big_endian)
> +		iowrite32be(value, pci->dbi_base + offset);
> +	else
> +		iowrite32(value, pci->dbi_base + offset);
> +}
> +
> +static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
> +{
> +	struct ls_pcie_ep *pcie = (struct ls_pcie_ep *)dev_id;
> +	struct dw_pcie *pci = pcie->pci;
> +	u32 val;
> +
> +	val = ls_lut_readl(pcie, PEX_PF0_PME_MES_DR);
> +	if (!val)
> +		return IRQ_NONE;
> +
> +	if (val & PEX_PF0_PME_MES_DR_LUD)
> +		dev_info(pci->dev, "Detect the link up state !\n");
> +	else if (val & PEX_PF0_PME_MES_DR_LDD)
> +		dev_info(pci->dev, "Detect the link down state !\n");
> +	else if (val & PEX_PF0_PME_MES_DR_HRD)
> +		dev_info(pci->dev, "Detect the hot reset state !\n");

No space before "!".  Seems possibly more verbose than necessary,
since the endpoint may be reset as part of normal operation.

> +	dw_pcie_dbi_ro_wr_en(pci);
> +	dw_pcie_writew_dbi(pci, PCIE_LINK_CAP,
> +			   (pcie->max_width << MAX_LINK_W_SHIFT) |

Use FIELD_PREP() so you don't need a shift.

> +			   pcie->max_speed);
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +
> +	ls_lut_writel(pcie, PEX_PF0_PME_MES_DR, val);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int ls_pcie_ep_interrupt_init(struct ls_pcie_ep *pcie,
> +				     struct platform_device *pdev)
> +{
> +	u32 val;
> +	int ret;
> +
> +	pcie->irq = platform_get_irq_byname(pdev, "pme");
> +	if (pcie->irq < 0) {
> +		dev_err(&pdev->dev, "Can't get 'pme' irq.\n");
> +		return pcie->irq;
> +	}
> +
> +	ret = devm_request_irq(&pdev->dev, pcie->irq,
> +			       ls_pcie_ep_event_handler, IRQF_SHARED,
> +			       pdev->name, pcie);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Can't register PCIe IRQ.\n");

Use "IRQ" consistently (it was "irq" in the message above).  No period
needed at end.

> +		return ret;
> +	}
> +
> +	/* Enable interrupts */
> +	val = ls_lut_readl(pcie, PEX_PF0_PME_MES_IER);
> +	val |=  PEX_PF0_PME_MES_IER_LDDIE | PEX_PF0_PME_MES_IER_HRDIE |
> +		PEX_PF0_PME_MES_IER_LUDIE;
> +	ls_lut_writel(pcie, PEX_PF0_PME_MES_IER, val);
> +
> +	return 0;
> +}
> +
>  static const struct pci_epc_features*
>  ls_pcie_ep_get_features(struct dw_pcie_ep *ep)
>  {
> @@ -125,6 +223,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  	struct ls_pcie_ep *pcie;
>  	struct pci_epc_features *ls_epc;
>  	struct resource *dbi_base;
> +	int ret;
>  
>  	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
>  	if (!pcie)
> @@ -155,9 +254,20 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  
>  	pci->ep.ops = &ls_pcie_ep_ops;
>  
> +	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");

Somewhat surprising that 6c389328c985 ("dt-bindings: pci:
layerscape-pci: Add a optional property big-endian") added this
property a year ago, but it has been unused until now?

> +	pcie->max_speed = dw_pcie_readw_dbi(pci, PCIE_LINK_CAP) &
> +			  MAX_LINK_SP_MASK;
> +	pcie->max_width = (dw_pcie_readw_dbi(pci, PCIE_LINK_CAP) >>
> +			  MAX_LINK_W_SHIFT) & MAX_LINK_W_MASK;

Use FIELD_GET() instead of shifting/masking.  Or save the whole
register instead of extracting and reconstructing the value.

>  	platform_set_drvdata(pdev, pcie);
>  
> -	return dw_pcie_ep_init(&pci->ep);
> +	ret = dw_pcie_ep_init(&pci->ep);
> +	if (ret)
> +		return  ret;
> +
> +	return  ls_pcie_ep_interrupt_init(pcie, pdev);
>  }
>  
>  static struct platform_driver ls_pcie_ep_driver = {
> -- 
> 2.34.1
> 
