Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0809B857FFB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 16:00:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JuCa8tkD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tbw9C6DpPz3vc9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Feb 2024 02:00:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JuCa8tkD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tbw8P0VPSz3dWQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Feb 2024 02:00:02 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5cddc5455aeso655568a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 07:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708095600; x=1708700400; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VyriGIXGikes2cj/vPRFHqKk0WgMm9h1VOVbxdZuKWU=;
        b=JuCa8tkD6X3FcxOok5Y57FmdG9wwW5mDT2Q8D5hDHhZQaqdg7mTf2I1WqpZ7LHxc0L
         CcmeYy2V0L4Ef7ZUcwvnHfQfZjfK8ZBQne5mevi8nC+msmvo7i97vu3sJidhMPTBDlYx
         7ANKvUcm/Z9kw5W8cKYMBgJ6fhzPER5VONLU4Rpznq6OTmURGjqx0lRbp1TylJIz0Hxy
         Rw5sGUBcMR5m1J7FnHD+ADOVJoW7qS9WyZ4yEV6suYximz534+oyndQUHa3aCEYqXCLe
         IIawPepGaknU8AeNLg7pqhBsUMD8Lw+Q8i8/W15SJRSW+9S6xFl5Ds+hHXvzDcUi6fOX
         oo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708095600; x=1708700400;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VyriGIXGikes2cj/vPRFHqKk0WgMm9h1VOVbxdZuKWU=;
        b=QwriOeF+pi4dOdBmUrFU2ZrdWuLJQiMzPNWNPhpYRfXZWEY1O2NPUtCkomTOj79Vw2
         W8e4s6W5rQxfJVcjWqfd1O0lwoyVvSTSimroZ/jAMENqr7MdkgEviNRINhQGd7Qsm1VM
         ZqQ8QNT3ai0OZ9QDPckx3SYjw1T6oRy7t0DagxDfP7qnNeTluXiIkkJFBKr+GjBiOrbP
         fJc5i9Wg7km88nnvH45BWS9VdktvgF3oqX8nB9h4fNXH7I4HkJvJSKVmhuUHZIlX2HUa
         p7iWnGUWwo2RG8aBztDZBVZ6ykqdO0d/3WRD/ik8rQ3RTOUDLBBE081lXhTDXCF3tAms
         e5aw==
X-Forwarded-Encrypted: i=1; AJvYcCXZLoCVYtgPbrYd/ZBs8JVc3upi/r7BwJa61N3wW9m/cyoFWKov/Qm5Jw5H8MLV3CNayKCRBKliTnwVRM33Rm4UKgPAYlTfo+75HlIRHg==
X-Gm-Message-State: AOJu0Yz5RzPmgXaoxJNFjvZy4HxsO/nE1ehKLVEoAb7GxrCU4LxuL30H
	uuvCSeiXpqsOqe/umn7oix7ft3LRMK3f+1VNCbVblrZj3y/ZkKWQ8e5WuzhqqA==
X-Google-Smtp-Source: AGHT+IFXJp8wGRl2uuCQwk1KM4W7ch6yMca/kYem0AP04Yd2D5i2im8NdPtdtPcZt/X5D+qhy4/IuQ==
X-Received: by 2002:a17:90a:77c3:b0:298:b9e3:691f with SMTP id e3-20020a17090a77c300b00298b9e3691fmr5237308pjs.23.1708095600213;
        Fri, 16 Feb 2024 07:00:00 -0800 (PST)
Received: from thinkpad ([120.138.12.48])
        by smtp.gmail.com with ESMTPSA id qn11-20020a17090b3d4b00b00298f88c3e48sm92830pjb.11.2024.02.16.06.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 06:59:59 -0800 (PST)
Date: Fri, 16 Feb 2024 20:29:50 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v2 1/2] PCI: endpoint: Clean up hardware description for
 BARs
Message-ID: <20240216145950.GB39963@thinkpad>
References: <20240216134524.1142149-1-cassel@kernel.org>
 <20240216134524.1142149-2-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240216134524.1142149-2-cassel@kernel.org>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Allen Hubbe <allenbh@gmail.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, Damien Le Moal <dlemoal@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, linuxppc-dev@lists.ozlabs.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 , linux-renesas-soc@vger.kernel.org, ntb@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Jon Mason <jdmason@kudzu.us>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 16, 2024 at 02:45:14PM +0100, Niklas Cassel wrote:
> The hardware description for BARs is scattered in many different variables
> in pci_epc_features. Some of these things are mutually exclusive, so it
> can create confusion over which variable that has precedence over another.
> 
> Improve the situation by creating a struct pci_epc_bar_desc, and a new
> enum pci_epc_bar_type, and convert the endpoint controller drivers to use
> this more well defined format.
> 
> Additionally, some endpoint controller drivers mark the BAR succeeding a
> "64-bit only BAR" as reserved, while some do not. By definition, a 64-bit
> BAR uses the succeeding BAR for the upper 32-bits, so an EPF driver cannot
> use a BAR succeeding a 64-bit BAR. Ensure that all endpoint controller
> drivers are uniform, and actually describe a reserved BAR as reserved.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Kishon Vijay Abraham I <kishon@kernel.org>
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
> +		.bar[BAR_2] = { .only_64bit = true, },
> +		.bar[BAR_3] = { .type = BAR_RESERVED, },
> +		.bar[BAR_4] = { .only_64bit = true, },
> +		.bar[BAR_5] = { .type = BAR_RESERVED, },
>  	},
>  };
>  
> diff --git a/drivers/pci/controller/pcie-rcar-ep.c b/drivers/pci/controller/pcie-rcar-ep.c
> index e6909271def7..05967c6c0b42 100644
> --- a/drivers/pci/controller/pcie-rcar-ep.c
> +++ b/drivers/pci/controller/pcie-rcar-ep.c
> @@ -440,11 +440,15 @@ static const struct pci_epc_features rcar_pcie_epc_features = {
>  	.msi_capable = true,
>  	.msix_capable = false,
>  	/* use 64-bit BARs so mark BAR[1,3,5] as reserved */
> -	.reserved_bar = 1 << BAR_1 | 1 << BAR_3 | 1 << BAR_5,
> -	.bar_fixed_64bit = 1 << BAR_0 | 1 << BAR_2 | 1 << BAR_4,
> -	.bar_fixed_size[0] = 128,
> -	.bar_fixed_size[2] = 256,
> -	.bar_fixed_size[4] = 256,
> +	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = 128,
> +			.only_64bit = true, },
> +	.bar[BAR_1] = { .type = BAR_RESERVED, },
> +	.bar[BAR_2] = { .type = BAR_FIXED, .fixed_size = 256,
> +			.only_64bit = true, },
> +	.bar[BAR_3] = { .type = BAR_RESERVED, },
> +	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256,
> +			.only_64bit = true, },
> +	.bar[BAR_5] = { .type = BAR_RESERVED, },
>  };
>  
>  static const struct pci_epc_features*
> diff --git a/drivers/pci/endpoint/functions/pci-epf-ntb.c b/drivers/pci/endpoint/functions/pci-epf-ntb.c
> index 43cd309ce22f..e01a98e74d21 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-ntb.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-ntb.c
> @@ -1012,13 +1012,13 @@ static int epf_ntb_config_spad_bar_alloc(struct epf_ntb *ntb,
>  
>  	epc_features = ntb_epc->epc_features;
>  	barno = ntb_epc->epf_ntb_bar[BAR_CONFIG];
> -	size = epc_features->bar_fixed_size[barno];
> +	size = epc_features->bar[barno].fixed_size;
>  	align = epc_features->align;
>  
>  	peer_ntb_epc = ntb->epc[!type];
>  	peer_epc_features = peer_ntb_epc->epc_features;
>  	peer_barno = ntb_epc->epf_ntb_bar[BAR_PEER_SPAD];
> -	peer_size = peer_epc_features->bar_fixed_size[peer_barno];
> +	peer_size = peer_epc_features->bar[peer_barno].fixed_size;
>  
>  	/* Check if epc_features is populated incorrectly */
>  	if ((!IS_ALIGNED(size, align)))
> diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
> index 981894e40681..cd4ffb39dcdc 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-test.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-test.c
> @@ -729,7 +729,7 @@ static int pci_epf_test_set_bar(struct pci_epf *epf)
>  		 */
>  		add = (epf_bar->flags & PCI_BASE_ADDRESS_MEM_TYPE_64) ? 2 : 1;
>  
> -		if (!!(epc_features->reserved_bar & (1 << bar)))
> +		if (epc_features->bar[bar].type == BAR_RESERVED)
>  			continue;
>  
>  		ret = pci_epc_set_bar(epc, epf->func_no, epf->vfunc_no,
> @@ -856,7 +856,7 @@ static int pci_epf_test_alloc_space(struct pci_epf *epf)
>  		if (bar == test_reg_bar)
>  			continue;
>  
> -		if (!!(epc_features->reserved_bar & (1 << bar)))
> +		if (epc_features->bar[bar].type == BAR_RESERVED)
>  			continue;
>  
>  		base = pci_epf_alloc_space(epf, bar_size[bar], bar,
> @@ -874,13 +874,11 @@ static void pci_epf_configure_bar(struct pci_epf *epf,
>  				  const struct pci_epc_features *epc_features)
>  {
>  	struct pci_epf_bar *epf_bar;
> -	bool bar_fixed_64bit;
>  	int i;
>  
>  	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
>  		epf_bar = &epf->bar[i];
> -		bar_fixed_64bit = !!(epc_features->bar_fixed_64bit & (1 << i));
> -		if (bar_fixed_64bit)
> +		if (epc_features->bar[i].only_64bit)
>  			epf_bar->flags |= PCI_BASE_ADDRESS_MEM_TYPE_64;
>  	}
>  }
> diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
> index 0675929fc529..8e779eecd62d 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
> @@ -422,7 +422,7 @@ static int epf_ntb_config_spad_bar_alloc(struct epf_ntb *ntb)
>  								epf->func_no,
>  								epf->vfunc_no);
>  	barno = ntb->epf_ntb_bar[BAR_CONFIG];
> -	size = epc_features->bar_fixed_size[barno];
> +	size = epc_features->bar[barno].fixed_size;
>  	align = epc_features->align;
>  
>  	if ((!IS_ALIGNED(size, align)))
> diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
> index dcd4e66430c1..7fe8f4336765 100644
> --- a/drivers/pci/endpoint/pci-epc-core.c
> +++ b/drivers/pci/endpoint/pci-epc-core.c
> @@ -87,7 +87,7 @@ EXPORT_SYMBOL_GPL(pci_epc_get);
>   * @epc_features: pci_epc_features structure that holds the reserved bar bitmap
>   *
>   * Invoke to get the first unreserved BAR that can be used by the endpoint
> - * function. For any incorrect value in reserved_bar return '0'.
> + * function.
>   */
>  enum pci_barno
>  pci_epc_get_first_free_bar(const struct pci_epc_features *epc_features)
> @@ -102,32 +102,34 @@ EXPORT_SYMBOL_GPL(pci_epc_get_first_free_bar);
>   * @bar: the starting BAR number from where unreserved BAR should be searched
>   *
>   * Invoke to get the next unreserved BAR starting from @bar that can be used
> - * for endpoint function. For any incorrect value in reserved_bar return '0'.
> + * for endpoint function.
>   */
>  enum pci_barno pci_epc_get_next_free_bar(const struct pci_epc_features
>  					 *epc_features, enum pci_barno bar)
>  {
> -	unsigned long free_bar;
> +	int i;
>  
>  	if (!epc_features)
>  		return BAR_0;
>  
>  	/* If 'bar - 1' is a 64-bit BAR, move to the next BAR */
> -	if ((epc_features->bar_fixed_64bit << 1) & 1 << bar)
> +	if (bar > 0 && epc_features->bar[bar - 1].only_64bit)
>  		bar++;
>  
> -	/* Find if the reserved BAR is also a 64-bit BAR */
> -	free_bar = epc_features->reserved_bar & epc_features->bar_fixed_64bit;
> -
> -	/* Set the adjacent bit if the reserved BAR is also a 64-bit BAR */
> -	free_bar <<= 1;
> -	free_bar |= epc_features->reserved_bar;
> -
> -	free_bar = find_next_zero_bit(&free_bar, 6, bar);
> -	if (free_bar > 5)
> -		return NO_BAR;
> +	for (i = bar; i < PCI_STD_NUM_BARS; i++) {
> +		/* If the BAR is not reserved, return it. */
> +		if (epc_features->bar[i].type != BAR_RESERVED)
> +			return i;
> +
> +		/*
> +		 * If the BAR is reserved, and marked as 64-bit only, then the
> +		 * succeeding BAR is also reserved.
> +		 */
> +		if (epc_features->bar[i].only_64bit)
> +			i++;
> +	}
>  
> -	return free_bar;
> +	return NO_BAR;
>  }
>  EXPORT_SYMBOL_GPL(pci_epc_get_next_free_bar);
>  
> diff --git a/drivers/pci/endpoint/pci-epf-core.c b/drivers/pci/endpoint/pci-epf-core.c
> index f2b4d34454c4..0a28a0b0911b 100644
> --- a/drivers/pci/endpoint/pci-epf-core.c
> +++ b/drivers/pci/endpoint/pci-epf-core.c
> @@ -260,7 +260,7 @@ void *pci_epf_alloc_space(struct pci_epf *epf, size_t size, enum pci_barno bar,
>  			  const struct pci_epc_features *epc_features,
>  			  enum pci_epc_interface_type type)
>  {
> -	u64 bar_fixed_size = epc_features->bar_fixed_size[bar];
> +	u64 bar_fixed_size = epc_features->bar[bar].fixed_size;
>  	size_t align = epc_features->align;
>  	struct pci_epf_bar *epf_bar;
>  	dma_addr_t phys_addr;
> @@ -271,13 +271,14 @@ void *pci_epf_alloc_space(struct pci_epf *epf, size_t size, enum pci_barno bar,
>  	if (size < 128)
>  		size = 128;
>  
> -	if (bar_fixed_size && size > bar_fixed_size) {
> -		dev_err(&epf->dev, "requested BAR size is larger than fixed size\n");
> -		return NULL;
> -	}
> -
> -	if (bar_fixed_size)
> +	if (epc_features->bar[bar].type == BAR_FIXED && bar_fixed_size) {
> +		if (size > bar_fixed_size) {
> +			dev_err(&epf->dev,
> +				"requested BAR size is larger than fixed size\n");
> +			return NULL;
> +		}
>  		size = bar_fixed_size;
> +	}
>  
>  	if (align)
>  		size = ALIGN(size, align);
> diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
> index 40ea18f5aa02..4ccb4f4f3883 100644
> --- a/include/linux/pci-epc.h
> +++ b/include/linux/pci-epc.h
> @@ -145,6 +145,32 @@ struct pci_epc {
>  	unsigned long			function_num_map;
>  };
>  
> +/**
> + * @BAR_PROGRAMMABLE: The BAR mask can be configured by the EPC.
> + * @BAR_FIXED: The BAR mask is fixed by the hardware.
> + * @BAR_RESERVED: The BAR should not be touched by an EPF driver.
> + */
> +enum pci_epc_bar_type {
> +	BAR_PROGRAMMABLE = 0,
> +	BAR_FIXED,
> +	BAR_RESERVED,
> +};
> +
> +/**
> + * struct pci_epc_bar_desc - hardware description for a BAR
> + * @type: the type of the BAR
> + * @fixed_size: the fixed size, only applicable if type is BAR_FIXED_MASK.
> + * @only_64bit: if true, an EPF driver is not allowed to choose if this BAR
> + *		should be configured as 32-bit or 64-bit, the EPF driver must
> + *		configure this BAR as 64-bit. Additionally, the BAR succeeding
> + *		this BAR must be set to type BAR_RESERVED.
> + */
> +struct pci_epc_bar_desc {
> +	enum pci_epc_bar_type type;
> +	u64 fixed_size;
> +	bool only_64bit;
> +};
> +
>  /**
>   * struct pci_epc_features - features supported by a EPC device per function
>   * @linkup_notifier: indicate if the EPC device can notify EPF driver on link up
> @@ -152,9 +178,7 @@ struct pci_epc {
>   *			for initialization
>   * @msi_capable: indicate if the endpoint function has MSI capability
>   * @msix_capable: indicate if the endpoint function has MSI-X capability
> - * @reserved_bar: bitmap to indicate reserved BAR unavailable to function driver
> - * @bar_fixed_64bit: bitmap to indicate fixed 64bit BARs
> - * @bar_fixed_size: Array specifying the size supported by each BAR
> + * @bar: array specifying the hardware description for each BAR
>   * @align: alignment size required for BAR buffer allocation
>   */
>  struct pci_epc_features {
> @@ -162,9 +186,7 @@ struct pci_epc_features {
>  	unsigned int	core_init_notifier : 1;
>  	unsigned int	msi_capable : 1;
>  	unsigned int	msix_capable : 1;
> -	u8	reserved_bar;
> -	u8	bar_fixed_64bit;
> -	u64	bar_fixed_size[PCI_STD_NUM_BARS];
> +	struct	pci_epc_bar_desc bar[PCI_STD_NUM_BARS];
>  	size_t	align;
>  };
>  
> -- 
> 2.43.1
> 

-- 
மணிவண்ணன் சதாசிவம்
