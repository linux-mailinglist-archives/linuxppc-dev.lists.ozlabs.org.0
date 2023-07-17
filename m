Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62187756F38
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 23:59:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bcN+QDhT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4bZq22npz2yL0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 07:59:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bcN+QDhT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4Rbp4GNwz2yFG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 01:59:34 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BAE1D61130;
	Mon, 17 Jul 2023 15:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F28C433C8;
	Mon, 17 Jul 2023 15:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689609572;
	bh=mmNtx5DaCDSRpy/BMCSXBwbmRPuUIz4XFGeGgtAykCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bcN+QDhTGO43S68G//SgxaH9wKR50gFXFbSk0rjCodtNU4hMLKoXmJhAycajkEXCU
	 olADYw/g75sw6tM0wGiOQwUcMD5jsLdkNP+TAclWpDPQsAQfhUgzw7OcIVVm/odLfF
	 uBYlGvZ6T9f9OhFVeCfhwwVpxC4ENk3506WGw66iy8eFCK8jY19gKzkAfZMieh2RWw
	 GPSbuI9t7JyCC9dtdHulnvO4qqr8WmO9HhiFMCcp+qPuguiXw4fwEc4AOCtq/cQmHk
	 yWSIiQiclE7hX4yLNzrEIOXfdkIK9olTBOp+fRxPA/kbsx3cHhA/c2ZXDy7fB7MDTA
	 oaBYmzU9z2cpQ==
Date: Mon, 17 Jul 2023 21:29:10 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 2/2] PCI: layerscape: Add the workaround for lost link
 capablities during reset
Message-ID: <20230717155910.GB35455@thinkpad>
References: <20230615164113.2270698-1-Frank.Li@nxp.com>
 <20230615164113.2270698-2-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230615164113.2270698-2-Frank.Li@nxp.com>
X-Mailman-Approved-At: Tue, 18 Jul 2023 07:55:09 +1000
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

On Thu, Jun 15, 2023 at 12:41:12PM -0400, Frank Li wrote:
> From: Xiaowei Bao <xiaowei.bao@nxp.com>
> 
> A workaround for the issue where the PCI Express Endpoint (EP) controller
> loses the values of the Maximum Link Width and Supported Link Speed from
> the Link Capabilities Register, which initially configured by the Reset
> Configuration Word (RCW) during a link-down or hot reset event.
> 

If this fixes an issue, then there should be a Fixes tag.

> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-layerscape-ep.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index 4e4fdd1dfea7..2ef02d827eeb 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -45,6 +45,7 @@ struct ls_pcie_ep {
>  	struct pci_epc_features		*ls_epc;
>  	const struct ls_pcie_ep_drvdata *drvdata;
>  	int				irq;
> +	u32				lnkcap;
>  	bool				big_endian;
>  };
>  
> @@ -73,6 +74,7 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
>  	struct ls_pcie_ep *pcie = dev_id;
>  	struct dw_pcie *pci = pcie->pci;
>  	u32 val, cfg;
> +	u8 offset;
>  
>  	val = ls_lut_readl(pcie, PEX_PF0_PME_MES_DR);
>  	ls_lut_writel(pcie, PEX_PF0_PME_MES_DR, val);
> @@ -81,6 +83,13 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
>  		return IRQ_NONE;
>  
>  	if (val & PEX_PF0_PME_MES_DR_LUD) {
> +

Please add a comment on why the LNKCAP is being restored here.

> +		offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +
> +		dw_pcie_dbi_ro_wr_en(pci);
> +		dw_pcie_writew_dbi(pci, offset + PCI_EXP_LNKCAP, pcie->lnkcap);

lnkcap is a 32-bit variable, so you should use dw_pcie_writel_dbi().

- Mani

> +		dw_pcie_dbi_ro_wr_dis(pci);
> +
>  		cfg = ls_lut_readl(pcie, PEX_PF0_CONFIG);
>  		cfg |= PEX_PF0_CFG_READY;
>  		ls_lut_writel(pcie, PEX_PF0_CONFIG, cfg);
> @@ -216,6 +225,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  	struct ls_pcie_ep *pcie;
>  	struct pci_epc_features *ls_epc;
>  	struct resource *dbi_base;
> +	u8 offset;
>  	int ret;
>  
>  	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> @@ -252,6 +262,9 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, pcie);
>  
> +	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +	pcie->lnkcap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
> +
>  	ret = dw_pcie_ep_init(&pci->ep);
>  	if (ret)
>  		return ret;
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
