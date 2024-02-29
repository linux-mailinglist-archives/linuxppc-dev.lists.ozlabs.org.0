Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA5E86C95F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 13:41:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=igRhD60z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlrSL6ktVz3vXS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 23:41:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=igRhD60z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlrRd1WYXz3bWy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 23:40:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3994ACE1396;
	Thu, 29 Feb 2024 12:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8281AC433F1;
	Thu, 29 Feb 2024 12:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709210440;
	bh=C74fudEZIJp8y6o4pvj1vAj1a7GmlDzym5p5G0Bm6Hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=igRhD60zQhE2flMc7jhx2MrzTM3u1/VMNwCv20yuLsBTePswSGs0X1xa0IEwh6qxp
	 nGmGx20s2y/z2Y/7/x5KxqT2Pad88xVz6DFGlL2yA4QXSg/ZMY7abQgztMXgoYV+l6
	 NUeKaPE8KreSQ/V4CePVSvOLMtPDBTGxjtGmtRtg70dR30dtLNk9SlFHIpCOi96TLy
	 oqxYya9Bx84enGhB/y1vWh0l5jqH8u4QcGjHP+nlkbvDdQ/xdhjUqF6ABw7RDRbbtn
	 MSrAAgCkrsqv6kkUQSN4WgHTdjz4fPUOQaf27+8z1dJpR+VSCd/y8Caw0vQ+G025fI
	 zmTsCRQmtCINg==
Date: Thu, 29 Feb 2024 13:40:29 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 03/10] PCI: dwc: ep: Introduce dw_pcie_ep_cleanup()
 API for drivers supporting PERST#
Message-ID: <ZeB7PQtkDSoCzE1Z@fedora>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-3-64c7fd0cfe64@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240224-pci-dbi-rework-v8-3-64c7fd0cfe64@linaro.org>
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

On Sat, Feb 24, 2024 at 12:24:09PM +0530, Manivannan Sadhasivam wrote:
> For DWC glue drivers supporting PERST# (currently Qcom and Tegra194), some
> of the DWC resources like eDMA should be cleaned up during the PERST#
> assert time.
> 
> So let's introduce a dw_pcie_ep_cleanup() API that could be called by these
> drivers to cleanup the DWC specific resources. Currently, it just removes
> eDMA.
> 
> Reported-by: Niklas Cassel <cassel@kernel.org>
> Closes: https://lore.kernel.org/linux-pci/ZWYmX8Y%2F7Q9WMxES@x1-carbon
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 11 +++++++++--
>  drivers/pci/controller/dwc/pcie-designware.h    |  5 +++++
>  drivers/pci/controller/dwc/pcie-qcom-ep.c       |  1 +
>  drivers/pci/controller/dwc/pcie-tegra194.c      |  2 ++
>  4 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 2b11290aab4c..1205bfba8310 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -564,12 +564,19 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	return 0;
>  }
>  
> -void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
> +void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	struct pci_epc *epc = ep->epc;
>  
>  	dw_pcie_edma_remove(pci);

Hello Mani,

In this message:
https://lore.kernel.org/linux-pci/20240130062938.GB32821@thinkpad/

You mentioned that you were going to clean up the BARs.
(Like I wrote in that thread, I really think that we should merge a fix for
the broken "do we have a saved value from find_first_zero_bit() in the array",
by using a "if (!saved_value[bar])", when find_first_zero_bit() returns zero.)

However, regardless of that, I do not see that this series (neither
dw_pcie_ep_cleanup(), nor dw_pcie_ep_linkdown()), calls any function which
will clean up the BARs.

Since e.g. qcom-ep.c does a reset_control_assert() during perst
assert/deassert, which should clear sticky registers, I think that
you should let dw_pcie_ep_cleanup() clean up the BARs using
dw_pcie_ep_clear_bar().


Kind regards,
Niklas


> +}
> +EXPORT_SYMBOL_GPL(dw_pcie_ep_cleanup);
> +
> +void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
> +{
> +	struct pci_epc *epc = ep->epc;
> +
> +	dw_pcie_ep_cleanup(ep);
>  
>  	pci_epc_mem_free_addr(epc, ep->msi_mem_phys, ep->msi_mem,
>  			      epc->mem->window.page_size);
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 61465203bb60..351d2fe3ea4d 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -672,6 +672,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep);
>  int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep);
>  void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
>  void dw_pcie_ep_deinit(struct dw_pcie_ep *ep);
> +void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep);
>  int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no);
>  int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  			     u8 interrupt_num);
> @@ -705,6 +706,10 @@ static inline void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
>  {
>  }
>  
> +static inline void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
> +{
> +}
> +
>  static inline int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no)
>  {
>  	return 0;
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index 36e5e80cd22f..59b1c0110288 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -507,6 +507,7 @@ static void qcom_pcie_perst_assert(struct dw_pcie *pci)
>  		return;
>  	}
>  
> +	dw_pcie_ep_cleanup(&pci->ep);
>  	qcom_pcie_disable_resources(pcie_ep);
>  	pcie_ep->link_status = QCOM_PCIE_EP_LINK_DISABLED;
>  }
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 7afa9e9aabe2..68bfeed3429b 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1715,6 +1715,8 @@ static void pex_ep_event_pex_rst_assert(struct tegra_pcie_dw *pcie)
>  	if (ret)
>  		dev_err(pcie->dev, "Failed to go Detect state: %d\n", ret);
>  
> +	dw_pcie_ep_cleanup(&pcie->pci.ep);
> +
>  	reset_control_assert(pcie->core_rst);
>  
>  	tegra_pcie_disable_phy(pcie);
> 
> -- 
> 2.25.1
> 
