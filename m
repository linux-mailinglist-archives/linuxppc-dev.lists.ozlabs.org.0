Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 390DF886AF9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 12:03:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t4ckqewB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1KFZ74wGz3vbD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 22:03:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t4ckqewB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1KDq0cF2z3dxN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 22:03:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A9237CE1777;
	Fri, 22 Mar 2024 11:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36BCDC433F1;
	Fri, 22 Mar 2024 11:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711105382;
	bh=WsbM9stLTz0gL0GOHFlF/YCyiZmnN4jgDBnbkyHIq0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t4ckqewBH76V+0hrF68Z5sCm2Mh2IosC4lNTk1Bxs/eM15Y6uJMszItaB/jcXJeZq
	 M1k3DINp7ns5+lW1PQl0rnLOWNpcVW7vtLFNO/SKA7PS782wnzSIJpM7ZHmpYnu41X
	 CrDz4+TCxCJ9lrgb3XPDsUoiZjq1Bbvrn20BkyLDwwH7C+bLprZsciVDMQDdMT3Idk
	 Zny8Hrdgi7DxJIQDzHKbiU2v6wPPvRieSL7FgcFcI9jGWDblfwt0Jc32QArE5ldZKJ
	 rxF7DuOPZjMOXPWHmNIpA0ptxhRIJi2X+/iUZGZRTQEljYjaQgZAPBk1QwyX/ZRPMz
	 5P79cUjNOAbnA==
Date: Fri, 22 Mar 2024 12:02:52 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v10 2/8] PCI: dwc: ep: Add Kernel-doc comments for APIs
Message-ID: <Zf1lXBUPhJ3xkV-E@ryzen>
References: <20240314-pci-dbi-rework-v10-0-14a45c5a938e@linaro.org>
 <20240314-pci-dbi-rework-v10-2-14a45c5a938e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314-pci-dbi-rework-v10-2-14a45c5a938e@linaro.org>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@
 lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 14, 2024 at 01:18:00PM +0530, Manivannan Sadhasivam wrote:
> All of the APIs are missing the Kernel-doc comments. Hence, add them.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 78 +++++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index c05304eabb89..d7e8f2dda6ce 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -14,6 +14,10 @@
>  #include <linux/pci-epc.h>
>  #include <linux/pci-epf.h>
>  
> +/**
> + * dw_pcie_ep_linkup - Notify EPF drivers about link up event
> + * @ep: DWC EP device
> + */
>  void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
>  {
>  	struct pci_epc *epc = ep->epc;
> @@ -22,6 +26,11 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
>  
> +/**
> + * dw_pcie_ep_init_notify - Notify EPF drivers about EPC initialization
> + *			    complete

Nit: "complete" can be on previous line without exceeding 80 chars.


> + * @ep: DWC EP device
> + */
>  void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
>  {
>  	struct pci_epc *epc = ep->epc;
> @@ -30,6 +39,14 @@ void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_init_notify);
>  
> +/**
> + * dw_pcie_ep_get_func_from_ep - Get the struct dw_pcie_ep_func corresponding to
> + *				 the endpoint function
> + * @ep: DWC EP device
> + * @func_no: Function number of the endpoint device
> + *
> + * Return: struct dw_pcie_ep_func if success, NULL otherwise.
> + */
>  struct dw_pcie_ep_func *
>  dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no)
>  {
> @@ -60,6 +77,11 @@ static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, u8 func_no,
>  	dw_pcie_dbi_ro_wr_dis(pci);
>  }
>  
> +/**
> + * dw_pcie_ep_reset_bar - Reset endpoint BAR
> + * @pci: DWC PCI device
> + * @bar: BAR number of the endpoint
> + */
>  void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
>  {
>  	u8 func_no, funcs;
> @@ -439,6 +461,13 @@ static const struct pci_epc_ops epc_ops = {
>  	.get_features		= dw_pcie_ep_get_features,
>  };
>  
> +/**
> + * dw_pcie_ep_raise_intx_irq - Raise INTx IRQ to the host
> + * @ep: DWC EP device
> + * @func_no: Function number of the endpoint
> + *
> + * Return: 0 if success, errono otherwise.
> + */
>  int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> @@ -450,6 +479,14 @@ int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_raise_intx_irq);
>  
> +/**
> + * dw_pcie_ep_raise_msi_irq - Raise MSI IRQ to the host
> + * @ep: DWC EP device
> + * @func_no: Function number of the endpoint
> + * @interrupt_num: Interrupt number to be raised
> + *
> + * Return: 0 if success, errono otherwise.
> + */
>  int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  			     u8 interrupt_num)
>  {
> @@ -498,6 +535,15 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_raise_msi_irq);
>  
> +/**
> + * dw_pcie_ep_raise_msix_irq_doorbell - Raise MSIX to the host using Doorbell

Nit: s/MSIX/MSI-X/


> + *					method
> + * @ep: DWC EP device
> + * @func_no: Function number of the endpoint device
> + * @interrupt_num: Interrupt number to be raised
> + *
> + * Return: 0 if success, errno otherwise.
> + */
>  int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep, u8 func_no,
>  				       u16 interrupt_num)
>  {
> @@ -517,6 +563,14 @@ int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep, u8 func_no,
>  	return 0;
>  }
>  
> +/**
> + * dw_pcie_ep_raise_msix_irq - Raise MSIX to the host

Nit: s/MSIX/MSI-X/


> + * @ep: DWC EP device
> + * @func_no: Function number of the endpoint device
> + * @interrupt_num: Interrupt number to be raised
> + *
> + * Return: 0 if success, errno otherwise.
> + */
>  int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  			      u16 interrupt_num)
>  {
> @@ -564,6 +618,13 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	return 0;
>  }
>  
> +/**
> + * dw_pcie_ep_exit - Deinitialize the endpoint device
> + * @ep: DWC EP device
> + *
> + * Deinitialize the endpoint device. EPC device is not destroyed since that will
> + * taken care by Devres.

Nit: s/will/will be/


> + */
>  void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> @@ -599,6 +660,14 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
>  	return 0;
>  }
>  
> +/**
> + * dw_pcie_ep_init_complete - Complete DWC EP initialization
> + * @ep: DWC EP device
> + *
> + * Complete the initialization of the registers (CSRs) specific to DWC EP. This
> + * API should be called only when the endpoint receives an active refclk (either
> + * from host or generated locally).
> + */
>  int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> @@ -716,6 +785,15 @@ int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_init_complete);
>  
> +/**
> + * dw_pcie_ep_init - Initialize the endpoint device
> + * @ep: DWC EP device
> + *
> + * Initialize the endpoint device. Allocate resources and create the EPC
> + * device with the endpoint framework.
> + *
> + * Return: 0 if success, errno otherwise.
> + */
>  int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  {
>  	int ret;
> 
> -- 
> 2.25.1
> 

With nits fixed:
Reviewed-by: Niklas Cassel <cassel@kernel.org>
