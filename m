Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B6E8759A9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 22:45:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BD3HWBca;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrNBQ2GcGz3vpF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 08:45:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BD3HWBca;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrN9K3KJrz3vjY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 08:44:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 273AF61CB7;
	Thu,  7 Mar 2024 21:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59403C433C7;
	Thu,  7 Mar 2024 21:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709847842;
	bh=43Y8tPPUjOytn3k+9R6t1bkFGhFiAgq279o9cNEFG28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BD3HWBcaTEhFWmVQ9fcb4yZ5ZIcFpR9w6UwCqmKDGphQF7DB39yvDdZW9+gjF0ZTS
	 DsWH87iS+8jHO65xN0z5zYohWG/mRxzpXe9VbFeimpkrU3bWSUCvWs70grrMlNEwLt
	 TiJ4ebjjdAKjUVIIDkMAmBLRqlKaInuT9lf3cLYV5F5Yej/s3z0jy8l82WbWxo0F+u
	 kTF29o9wK1pactXccrsfJOpfpW2c8/1s68hLjFvoICxKvPSf4JWeAYQXu8w1/yxijq
	 0mGAyNG2y48vVqRmPPE2wGjqjEVSxU5ubl2fEvD725m7YXDjcGo73gKcTwXXXTWbK0
	 khMLpaPck1T+w==
Date: Thu, 7 Mar 2024 22:43:52 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v9 09/10] PCI: qcom-ep: Use the generic
 dw_pcie_ep_linkdown() API to handle LINK_DOWN event
Message-ID: <Zeo1GDVTQpTVFabn@ryzen>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-9-29d433d99cda@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304-pci-dbi-rework-v9-9-29d433d99cda@linaro.org>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org, Roy Zang
  <roy.zang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 04, 2024 at 02:52:21PM +0530, Manivannan Sadhasivam wrote:
> Now that the API is available, let's make use of it. It also handles the
> reinitialization of DWC non-sticky registers in addition to sending the
> notification to EPF drivers.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/pci/controller/dwc/pcie-qcom-ep.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index 2fb8c15e7a91..4e45bc4bca45 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -640,7 +640,7 @@ static irqreturn_t qcom_pcie_ep_global_irq_thread(int irq, void *data)
>  	if (FIELD_GET(PARF_INT_ALL_LINK_DOWN, status)) {
>  		dev_dbg(dev, "Received Linkdown event\n");
>  		pcie_ep->link_status = QCOM_PCIE_EP_LINK_DOWN;
> -		pci_epc_linkdown(pci->ep.epc);
> +		dw_pcie_ep_linkdown(&pci->ep);
>  	} else if (FIELD_GET(PARF_INT_ALL_BME, status)) {
>  		dev_dbg(dev, "Received BME event. Link is enabled!\n");
>  		pcie_ep->link_status = QCOM_PCIE_EP_LINK_ENABLED;
> 
> -- 
> 2.25.1
> 

Reviewed-by: Niklas Cassel <cassel@kernel.org>
