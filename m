Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F79857B6E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 12:20:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G2M+M8ZU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbqGZ5tpDz3vYC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 22:20:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G2M+M8ZU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbqFn0bcrz3dSv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 22:19:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D3ED5CE2AA0;
	Fri, 16 Feb 2024 11:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4FB9C433C7;
	Fri, 16 Feb 2024 11:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708082360;
	bh=KbiyK3bvGuFNTKYJJHAnEbGXH9z7NGmmzn+I+PaPUz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G2M+M8ZUQhDqvRup5p9TlZYwfHP6CXltKW0DLJJzXwugtd4/H1nl86/IGFPjVQBr7
	 GCRemr582U0WH8hsjXa8e1U3s9b0Vl5yvGiqgI+fNcKVHuFDGHm7bPL4RGnQl3hFV0
	 cFWFdueXaG7/OjmB2SXtaC58pFYqaz053ojcdCGeZyjeXXjQcwbX7bhmTOGSqfCKAb
	 7mWtrvsPRDLrl5xI4ab5+bkNpl53Csknw7fcEchqTgt680PFUJO/jQRKvrP+jZvQrk
	 6AdJ1aVr+xyff4pRh2vw8Qc4coAE6C3qwV+TksfzuED4Cku5IveQ6lBc2Q+DFJkrMR
	 9pfzSd3QakT3A==
Date: Fri, 16 Feb 2024 16:49:08 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH 1/2] PCI: endpoint: Clean up hardware description for BARs
Message-ID: <20240216111908.GC2559@thinkpad>
References: <20240210012634.600301-1-cassel@kernel.org>
 <20240210012634.600301-2-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240210012634.600301-2-cassel@kernel.org>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Allen Hubbe <allenbh@gmail.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, Damien Le Moal <dlemoal@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, linuxppc-dev@lists.ozlabs
 .org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, ntb@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Jon Mason <jdmason@kudzu.us>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Feb 10, 2024 at 02:26:25AM +0100, Niklas Cassel wrote:
> The hardware description for BARs is scattered in many different variables
> in pci_epc_features. Some of these things are mutually exclusive, so it
> can create confusion over which variable that has precedence over another.
> 
> Improve the situation by creating a struct pci_epc_bar_desc, and a new
> enum pci_epc_bar_type, and convert the endpoint controller drivers to use
> this more well defined format.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c         |  3 +-
>  drivers/pci/controller/dwc/pci-keystone.c     | 12 +++----
>  .../pci/controller/dwc/pci-layerscape-ep.c    |  5 ++-
>  drivers/pci/controller/dwc/pcie-keembay.c     |  8 +++--
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  4 ++-
>  drivers/pci/controller/dwc/pcie-tegra194.c    | 10 ++++--
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c | 15 ++++++--
>  drivers/pci/controller/pcie-rcar-ep.c         | 14 +++++---
>  drivers/pci/endpoint/functions/pci-epf-ntb.c  |  4 +--
>  drivers/pci/endpoint/functions/pci-epf-test.c |  8 ++---
>  drivers/pci/endpoint/functions/pci-epf-vntb.c |  2 +-
>  drivers/pci/endpoint/pci-epc-core.c           | 32 +++++++++--------
>  drivers/pci/endpoint/pci-epf-core.c           | 15 ++++----
>  include/linux/pci-epc.h                       | 34 +++++++++++++++----
>  14 files changed, 108 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index dc2c036ab28c..47a9a96484ed 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1081,7 +1081,8 @@ static const struct pci_epc_features imx8m_pcie_epc_features = {
>  	.linkup_notifier = false,
>  	.msi_capable = true,
>  	.msix_capable = false,
> -	.reserved_bar = 1 << BAR_1 | 1 << BAR_3,
> +	.bar[BAR_1] = { .type = BAR_RESERVED, },
> +	.bar[BAR_3] = { .type = BAR_RESERVED, },
>  	.align = SZ_64K,
>  };
>  
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index c0c62533a3f1..b2b93b4fa82d 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -924,12 +924,12 @@ static const struct pci_epc_features ks_pcie_am654_epc_features = {
>  	.linkup_notifier = false,
>  	.msi_capable = true,
>  	.msix_capable = true,
> -	.reserved_bar = 1 << BAR_0 | 1 << BAR_1,
> -	.bar_fixed_64bit = 1 << BAR_0,
> -	.bar_fixed_size[2] = SZ_1M,
> -	.bar_fixed_size[3] = SZ_64K,
> -	.bar_fixed_size[4] = 256,
> -	.bar_fixed_size[5] = SZ_1M,
> +	.bar[BAR_0] = { .type = BAR_RESERVED, .only_64bit = true, },
> +	.bar[BAR_1] = { .type = BAR_RESERVED, },
> +	.bar[BAR_2] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
> +	.bar[BAR_3] = { .type = BAR_FIXED, .fixed_size = SZ_64K, },
> +	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256, },
> +	.bar[BAR_5] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
>  	.align = SZ_1M,
>  };
>  
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index 2e398494e7c0..1f6ee1460ec2 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -250,7 +250,10 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  	pci->dev = dev;
>  	pci->ops = pcie->drvdata->dw_pcie_ops;
>  
> -	ls_epc->bar_fixed_64bit = (1 << BAR_2) | (1 << BAR_4);
> +	ls_epc->bar[BAR_2].only_64bit = true;
> +	ls_epc->bar[BAR_3].type = BAR_RESERVED;

BAR_3 and BAR_4 were not reserved previously.

> +	ls_epc->bar[BAR_4].only_64bit = true;
> +	ls_epc->bar[BAR_5].type = BAR_RESERVED;
>  	ls_epc->linkup_notifier = true;
>  
>  	pcie->pci = pci;
> diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
> index 208d3b0ba196..5e8e54f597dd 100644
> --- a/drivers/pci/controller/dwc/pcie-keembay.c
> +++ b/drivers/pci/controller/dwc/pcie-keembay.c
> @@ -312,8 +312,12 @@ static const struct pci_epc_features keembay_pcie_epc_features = {
>  	.linkup_notifier	= false,
>  	.msi_capable		= true,
>  	.msix_capable		= true,
> -	.reserved_bar		= BIT(BAR_1) | BIT(BAR_3) | BIT(BAR_5),
> -	.bar_fixed_64bit	= BIT(BAR_0) | BIT(BAR_2) | BIT(BAR_4),
> +	.bar[BAR_0]		= { .only_64bit = true, },
> +	.bar[BAR_1]		= { .type = BAR_RESERVED, },
> +	.bar[BAR_2]		= { .only_64bit = true, },
> +	.bar[BAR_3]		= { .type = BAR_RESERVED, },
> +	.bar[BAR_4]		= { .only_64bit = true, },
> +	.bar[BAR_5]		= { .type = BAR_RESERVED, },
>  	.align			= SZ_16K,
>  };
>  
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index e9166619b1f9..0be760ed420b 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -383,7 +383,9 @@ static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
>  	.linkup_notifier = false,
>  	.msi_capable = true,
>  	.msix_capable = false,
> -	.reserved_bar = 1 << BAR_1 | 1 << BAR_3 | 1 << BAR_5,
> +	.bar[BAR_1] = { .type = BAR_RESERVED, },
> +	.bar[BAR_3] = { .type = BAR_RESERVED, },
> +	.bar[BAR_5] = { .type = BAR_RESERVED, },
>  	.align = SZ_1M,
>  };
>  
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 7afa9e9aabe2..1f7b662cb8e1 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -2007,9 +2007,13 @@ static const struct pci_epc_features tegra_pcie_epc_features = {
>  	.core_init_notifier = true,
>  	.msi_capable = false,
>  	.msix_capable = false,
> -	.reserved_bar = 1 << BAR_2 | 1 << BAR_3 | 1 << BAR_4 | 1 << BAR_5,
> -	.bar_fixed_64bit = 1 << BAR_0,
> -	.bar_fixed_size[0] = SZ_1M,
> +	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
> +			.only_64bit = true, },
> +	.bar[BAR_1] = { .type = BAR_RESERVED, },

Same, BAR_1 was not reserved.

> +	.bar[BAR_2] = { .type = BAR_RESERVED, },
> +	.bar[BAR_3] = { .type = BAR_RESERVED, },
> +	.bar[BAR_4] = { .type = BAR_RESERVED, },
> +	.bar[BAR_5] = { .type = BAR_RESERVED, },
>  };
>  
>  static const struct pci_epc_features*
> diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> index 3fced0d3e851..265f65fc673f 100644
> --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> @@ -411,8 +411,12 @@ static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
>  		.msi_capable = true,
>  		.msix_capable = false,
>  		.align = 1 << 16,
> -		.bar_fixed_64bit = BIT(BAR_0) | BIT(BAR_2) | BIT(BAR_4),
> -		.reserved_bar =  BIT(BAR_4),
> +		.bar[BAR_0] = { .only_64bit = true, },
> +		.bar[BAR_1] = { .type = BAR_RESERVED, },

Same as above.

> +		.bar[BAR_2] = { .only_64bit = true, },
> +		.bar[BAR_3] = { .type = BAR_RESERVED, },
> +		.bar[BAR_4] = { .type = BAR_RESERVED, .only_64bit = true, },
> +		.bar[BAR_5] = { .type = BAR_RESERVED, },
>  	},
>  };
>  
> @@ -425,7 +429,12 @@ static const struct uniphier_pcie_ep_soc_data uniphier_nx1_data = {
>  		.msi_capable = true,
>  		.msix_capable = false,
>  		.align = 1 << 12,
> -		.bar_fixed_64bit = BIT(BAR_0) | BIT(BAR_2) | BIT(BAR_4),
> +		.bar[BAR_0] = { .only_64bit = true, },
> +		.bar[BAR_1] = { .type = BAR_RESERVED, },

Same as above.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
