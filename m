Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4EC758C9F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 06:30:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QQ8I5AId;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5ND03xykz3bv0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 14:30:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QQ8I5AId;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5NC50xJRz2yL0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 14:29:53 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 438D760DC4;
	Wed, 19 Jul 2023 04:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD7F7C433C7;
	Wed, 19 Jul 2023 04:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689740989;
	bh=VsupOhAw0dkjCQ85UwV+mlGN3pD2O9GWV2eVO3RP9o8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQ8I5AIdXpyK55Mzzf/2HAnG3XS0KMKKjNJTQcWMnBJ7ngAsNyVlFqPF+Qdu4ovOW
	 yWeGURj5MhyTQdhYUK9c9em02iktKVNnkBVveVRdxBOtShcUKm3zZGXXPsfWr6OyVl
	 ZCO2dfRKMue8ng7w0dzyqvggMqnG2ouswxCj2tZorTSY35P7ktcFvI+eyQcse9MXO3
	 rkXQcLsuzz+5onPv93gJ+GZKPwvhhwGOLvy/UwcnEqWyNLnKjMoF8HXoJpYVbq45dp
	 tmtGidHlV+E8zudwWQE3mIcYTSvmcc+tGu1BKgF0JmZjCKamGe8yphhYRHJRj/Dg1t
	 Yr+VgiB8Ci7hQ==
Date: Wed, 19 Jul 2023 09:59:13 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 2/2] PCI: layerscape: Add the workaround for lost link
 capablities during reset
Message-ID: <20230719042913.GA5990@thinkpad>
References: <20230718182142.1864070-1-Frank.Li@nxp.com>
 <20230718182142.1864070-2-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230718182142.1864070-2-Frank.Li@nxp.com>
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
Cc: imx@lists.linux.dev, kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 18, 2023 at 02:21:42PM -0400, Frank Li wrote:
> From: Xiaowei Bao <xiaowei.bao@nxp.com>
> 
> A workaround for the issue where the PCI Express Endpoint (EP) controller
> loses the values of the Maximum Link Width and Supported Link Speed from
> the Link Capabilities Register, which initially configured by the Reset
> Configuration Word (RCW) during a link-down or hot reset event.
> 
> Fixes: a805770d8a22 ("PCI: layerscape: Add EP mode support")
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
> change from v1 to v2:
>  - add comments at restore register
>  - add fixes tag
> 
>  .../pci/controller/dwc/pci-layerscape-ep.c    | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index e0969ff2ddf7..b1faf41a2fae 100644
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
> @@ -81,6 +83,19 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
>  		return IRQ_NONE;
>  
>  	if (val & PEX_PF0_PME_MES_DR_LUD) {
> +
> +		offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +
> +		/*
> +		 * The values of the Maximum Link Width and Supported Link
> +		 * Speed from the Link Capabilities Register will be lost
> +		 * during link down or hot reset. Restore initial value
> +		 * that configured by the Reset Configuration Word (RCW).
> +		 */
> +		dw_pcie_dbi_ro_wr_en(pci);
> +		dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, pcie->lnkcap);
> +		dw_pcie_dbi_ro_wr_dis(pci);
> +
>  		cfg = ls_lut_readl(pcie, PEX_PF0_CONFIG);
>  		cfg |= PEX_PF0_CFG_READY;
>  		ls_lut_writel(pcie, PEX_PF0_CONFIG, cfg);
> @@ -216,6 +231,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  	struct ls_pcie_ep *pcie;
>  	struct pci_epc_features *ls_epc;
>  	struct resource *dbi_base;
> +	u8 offset;
>  	int ret;
>  
>  	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> @@ -252,6 +268,9 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
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
