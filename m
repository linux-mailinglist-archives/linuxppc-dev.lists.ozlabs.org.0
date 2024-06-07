Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C888FFF4F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 11:24:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wd/bO7uQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VwbPH07zBz3cNc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 19:24:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wd/bO7uQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VwbMN4CrKz3cRr
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 19:22:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0B469CE1CE7;
	Fri,  7 Jun 2024 09:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2B2C4AF07;
	Fri,  7 Jun 2024 09:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717752159;
	bh=D7lvHQq+tZorV1+pcjIY5sjD02wKITLOPmyvKO904yI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wd/bO7uQuUWMF88y073MEYdcJkxc/T9boJd1q64JFfETO37/4iGwJryBTybOc9dBY
	 DY4Mx3hhpcqNSOELqeCujEVhpgMhJ5CU3Zz20fZ6Uks+q9Iwu1cuA5Ee9f/IDfJUP/
	 7A4BQ2Pv9OFhpgJ8KT5sHHNz3Dk0rvg9rKg6AkOTs6isY+Zqf24Xlvd9geCjfS3IXS
	 95TqGUH3d2BNJFSN9ou8DWOSXJTdrplMPW6d4/jiOi7Q3GXaqc9Pkdx3VUGF9POD/G
	 l3vf8BeR4RCcbq+dfKMEEdjdgOr4koutz4uJh4BZVuxoN3Jt+PxxzxdXkCLhy+F/SE
	 /WaTgN5oouNKw==
Date: Fri, 7 Jun 2024 11:22:29 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 5/5] PCI: layerscape-ep: Use the generic
 dw_pcie_ep_linkdown() API to handle Link Down event
Message-ID: <ZmLRVQgLBx457R8E@ryzen.lan>
References: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
 <20240606-pci-deinit-v1-5-4395534520dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-pci-deinit-v1-5-4395534520dc@linaro.org>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, imx@lists.linux.dev, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, Bjorn Helgaas <helgaas@kernel.org>, linux-arm-kernel@lists.infradead.org, Siddharth Vadapalli <s-vadapalli@ti.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, mhi@lists.linux.dev, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 06, 2024 at 12:56:38PM +0530, Manivannan Sadhasivam wrote:
> Now that the API is available, let's make use of it. It also handles the
> reinitialization of DWC non-sticky registers in addition to sending the
> notification to EPF drivers.
> 
> Reported-by: Bjorn Helgaas <helgaas@kernel.org>
> Closes: https://lore.kernel.org/linux-pci/20240528195539.GA458945@bhelgaas/
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/pci/controller/dwc/pci-layerscape-ep.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index 35bb481564c7..a4a800699f89 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -104,7 +104,7 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
>  		dev_dbg(pci->dev, "Link up\n");
>  	} else if (val & PEX_PF0_PME_MES_DR_LDD) {
>  		dev_dbg(pci->dev, "Link down\n");
> -		pci_epc_linkdown(pci->ep.epc);
> +		dw_pcie_ep_linkdown(&pci->ep);
>  	} else if (val & PEX_PF0_PME_MES_DR_HRD) {
>  		dev_dbg(pci->dev, "Hot reset\n");
>  	}
> 
> -- 
> 2.25.1
> 

Reviewed-by: Niklas Cassel <cassel@kernel.org>
