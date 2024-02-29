Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE2686C997
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 13:57:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C+K5ELdx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlrq71XTyz3vYc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 23:57:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C+K5ELdx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlrnw3kpZz3vX2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 23:56:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8C10ACE1020;
	Thu, 29 Feb 2024 12:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4621EC433F1;
	Thu, 29 Feb 2024 12:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709211393;
	bh=FH+JdudMBgehU68hfBDKn6/fbrAreS/wl1YC0HPz/Tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C+K5ELdxqti6l+X3XyprWkioDJDWESK1Q8aUt7ODmuCvs+B1SkleCGS2eEqKuvXhc
	 QexaZ6oN8rwRdtzMCWk5hwhKaAp7YhoymoN8DvRIanJgaj90GMn1Ca3MbwYy2CygBW
	 odHLaxPs6AoXzDLZTk8XNgsv5e9HzgUV6/jt7F0kU0NSKDa7TcHHUS2XzwcsPssFbY
	 yyTfzN2vjbzjAV/RY4utg2ANfWB2XcDg7jBIBgwr3ZVoXrfOvihwUylOGhb0xI4tIh
	 joL7P9t4siWvMU3aFWlo9KSxQEMDCpcIs+vCy7QH9HFbq0VPuv2Gx4sqzIN8C8ym1q
	 +gtgrcmRWnWFw==
Date: Thu, 29 Feb 2024 13:56:23 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 10/10] PCI: dwc: ep: Add Kernel-doc comments for APIs
Message-ID: <ZeB-93jiX31cLJyP@fedora>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-10-64c7fd0cfe64@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240224-pci-dbi-rework-v8-10-64c7fd0cfe64@linaro.org>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-
 kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Mani,

On Sat, Feb 24, 2024 at 12:24:16PM +0530, Manivannan Sadhasivam wrote:
> All of the APIs are missing the Kernel-doc comments. Hence, add them.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 92 +++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index fed4c2936c78..cdcb33a279db 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c

(snip)

> @@ -556,6 +606,12 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	return 0;
>  }
>  
> +/**
> + * dw_pcie_ep_cleanup - Cleanup DWC EP resources
> + * @ep: DWC EP device
> + *
> + * Cleans up the DWC EP specific resources like eDMA etc...

I think that you should mention that this is only for glue drivers that
use PERST# handling, so that other glue drivers do no start using it :)


> + */
>  void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> @@ -564,6 +620,13 @@ void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_cleanup);


Kind regards,
Niklas
