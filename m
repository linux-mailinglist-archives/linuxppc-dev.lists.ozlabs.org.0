Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D968D8EBFE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 14:53:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468RGN5hSfzDqKf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 22:53:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=andrew.murray@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 468RCM2n2TzDr4D
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 22:51:08 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B30E8344;
 Thu, 15 Aug 2019 05:51:05 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AB473F694;
 Thu, 15 Aug 2019 05:51:05 -0700 (PDT)
Date: Thu, 15 Aug 2019 13:51:03 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH 05/10] PCI: layerscape: Modify the way of getting
 capability with different PEX
Message-ID: <20190815125103.GH43882@e119886-lin.cambridge.arm.com>
References: <20190815083716.4715-1-xiaowei.bao@nxp.com>
 <20190815083716.4715-5-xiaowei.bao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815083716.4715-5-xiaowei.bao@nxp.com>
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
Cc: mark.rutland@arm.com, roy.zang@nxp.com, lorenzo.pieralisi@arm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, jingoohan1@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com, minghuan.Lian@nxp.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, gustavo.pimentel@synopsys.com,
 bhelgaas@google.com, kishon@ti.com, shawnguo@kernel.org, mingkai.hu@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 15, 2019 at 04:37:11PM +0800, Xiaowei Bao wrote:
> The different PCIe controller in one board may be have different
> capability of MSI or MSIX, so change the way of getting the MSI
> capability, make it more flexible.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-layerscape-ep.c | 28 +++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index be61d96..9404ca0 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -22,6 +22,7 @@
>  
>  struct ls_pcie_ep {
>  	struct dw_pcie		*pci;
> +	struct pci_epc_features	*ls_epc;
>  };
>  
>  #define to_ls_pcie_ep(x)	dev_get_drvdata((x)->dev)
> @@ -40,25 +41,26 @@ static const struct of_device_id ls_pcie_ep_of_match[] = {
>  	{ },
>  };
>  
> -static const struct pci_epc_features ls_pcie_epc_features = {
> -	.linkup_notifier = false,
> -	.msi_capable = true,
> -	.msix_capable = false,
> -};
> -
>  static const struct pci_epc_features*
>  ls_pcie_ep_get_features(struct dw_pcie_ep *ep)
>  {
> -	return &ls_pcie_epc_features;
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
> +
> +	return pcie->ls_epc;
>  }
>  
>  static void ls_pcie_ep_init(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
>  	enum pci_barno bar;
>  
>  	for (bar = BAR_0; bar <= BAR_5; bar++)
>  		dw_pcie_ep_reset_bar(pci, bar);
> +
> +	pcie->ls_epc->msi_capable = ep->msi_cap ? true : false;
> +	pcie->ls_epc->msix_capable = ep->msix_cap ? true : false;
>  }
>  
>  static int ls_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> @@ -118,6 +120,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct dw_pcie *pci;
>  	struct ls_pcie_ep *pcie;
> +	struct pci_epc_features *ls_epc;
>  	struct resource *dbi_base;
>  	int ret;
>  
> @@ -129,6 +132,10 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  	if (!pci)
>  		return -ENOMEM;
>  
> +	ls_epc = devm_kzalloc(dev, sizeof(*ls_epc), GFP_KERNEL);
> +	if (!ls_epc)
> +		return -ENOMEM;
> +
>  	dbi_base = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
>  	pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_base);
>  	if (IS_ERR(pci->dbi_base))
> @@ -139,6 +146,13 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  	pci->ops = &ls_pcie_ep_ops;
>  	pcie->pci = pci;
>  
> +	ls_epc->linkup_notifier = false,
> +	ls_epc->msi_capable = true,
> +	ls_epc->msix_capable = true,

As [msi,msix]_capable is shortly set from ls_pcie_ep_init - is there any
reason to set them here (to potentially incorrect values)?

Thanks,

Andrew Murray

> +	ls_epc->bar_fixed_64bit = (1 << BAR_2) | (1 << BAR_4),
> +
> +	pcie->ls_epc = ls_epc;
> +
>  	platform_set_drvdata(pdev, pcie);
>  
>  	ret = ls_add_pcie_ep(pcie, pdev);
> -- 
> 2.9.5
> 
