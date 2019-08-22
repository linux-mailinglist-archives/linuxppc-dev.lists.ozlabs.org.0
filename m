Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 690EA992B4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 13:57:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Djh82W0czDr7B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 21:57:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ti.com
 (client-ip=198.47.23.249; helo=lelv0142.ext.ti.com;
 envelope-from=kishon@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ti.com header.i=@ti.com header.b="A6qBaPEk"; 
 dkim-atps=neutral
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DjNw1Gx7zDr3l
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 21:44:14 +1000 (AEST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7MBhwER034910;
 Thu, 22 Aug 2019 06:43:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1566474238;
 bh=R88tKsnOpDEB9S1LRWSQGhA26d8ouNZmNmaeHPXf16w=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=A6qBaPEky+0xRPYdBbTA+Wt+B6BEr64mQ3Ns/GX0C3uhlsrc0UB1BrQ/GAknMyMdI
 mofJNZKL8sbfGQnPBDGiL26i6Aewg6vdUynWOiEn4CsQxF9FjT49Qmgi7p5UHMJJ9J
 +ptLStNLyjpUunyxPyNZ0eopVIbFhXsvqUkQl1/w=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7MBhwj4124861
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 22 Aug 2019 06:43:58 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 22
 Aug 2019 06:43:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 22 Aug 2019 06:43:58 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7MBhqFv072553;
 Thu, 22 Aug 2019 06:43:53 -0500
Subject: Re: [PATCH v2 06/10] PCI: layerscape: Modify the way of getting
 capability with different PEX
To: Xiaowei Bao <xiaowei.bao@nxp.com>, <bhelgaas@google.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <shawnguo@kernel.org>,
 <leoyang.li@nxp.com>, <lorenzo.pieralisi@arm.co>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <minghuan.Lian@nxp.com>,
 <mingkai.hu@nxp.com>, <roy.zang@nxp.com>, <jingoohan1@gmail.com>,
 <gustavo.pimentel@synopsys.com>, <linux-pci@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linuxppc-dev@lists.ozlabs.org>, <andrew.murray@arm.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-6-xiaowei.bao@nxp.com>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <0c02ac52-e4b1-8071-bf9e-d10b28fc9029@ti.com>
Date: Thu, 22 Aug 2019 17:13:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822112242.16309-6-xiaowei.bao@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 22/08/19 4:52 PM, Xiaowei Bao wrote:
> The different PCIe controller in one board may be have different
> capability of MSI or MSIX, so change the way of getting the MSI
> capability, make it more flexible.

please use different pci_epc_features table for different boards.

Thanks
Kishon
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
> v2:
>  - Remove the repeated assignment code.
> 
>  drivers/pci/controller/dwc/pci-layerscape-ep.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index 4e92a95..8461f62 100644
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
> @@ -139,6 +146,11 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  	pci->ops = &ls_pcie_ep_ops;
>  	pcie->pci = pci;
>  
> +	ls_epc->linkup_notifier = false,
> +	ls_epc->bar_fixed_64bit = (1 << BAR_2) | (1 << BAR_4),
> +
> +	pcie->ls_epc = ls_epc;
> +
>  	platform_set_drvdata(pdev, pcie);
>  
>  	ret = ls_add_pcie_ep(pcie, pdev);
> 
