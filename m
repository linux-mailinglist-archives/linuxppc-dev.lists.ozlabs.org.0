Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B7887586B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 21:32:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dq1Ij5cb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrLZB2VMrz3vmP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 07:32:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dq1Ij5cb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrLYT2JjDz3vm2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 07:31:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C8147CE262A;
	Thu,  7 Mar 2024 20:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF1DC433F1;
	Thu,  7 Mar 2024 20:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709843483;
	bh=SpBFTgDYCZL5HMSP744NvFE2koQBVmNM5L2jWkZki7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dq1Ij5cbXC/azz2ARqvH18GU6nblsiWGJekKh8qOtyucIW4GqCRnXVbQlQjtTDrOw
	 /QkuiKcsiHgteS5KrBFnY8QBf7g5BlAInJ5lA75KzFf02hYqh+iJTlYBkAhbD8wmcN
	 MlcgMIrkMt5PPDeFFLmBWkrNhXZOwrWOTp3JIHIa1DcLWTyDHzHrbHVGosjmEtufOK
	 o0H+MQGjAzJWkFcK+6eKhq8Yamb1XolFCnSNIjPhVH+lM9CvmbuF3VOGSHWZyqJXCW
	 Oxl2l5XBcGLAfAFnlpjupMrL2nAN7mCz8/RL4c9k3rUaviU69PmCBCh0FHzrbA6NLs
	 tlWLEc5gqsSpA==
Date: Thu, 7 Mar 2024 21:31:12 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v9 04/10] PCI: dwc: ep: Fix DBI access failure for
 drivers requiring refclk from host
Message-ID: <ZeokEJstpRSUPDTL@ryzen>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-4-29d433d99cda@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304-pci-dbi-rework-v9-4-29d433d99cda@linaro.org>
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

On Mon, Mar 04, 2024 at 02:52:16PM +0530, Manivannan Sadhasivam wrote:
> The DWC glue drivers requiring an active reference clock from the PCIe host
> for initializing their PCIe EP core, set a flag called 'core_init_notifier'
> to let DWC driver know that these drivers need a special attention during
> initialization. In these drivers, access to the hw registers (like DBI)
> before receiving the active refclk from host will result in access failure
> and also could cause a whole system hang.
> 
> But the current DWC EP driver doesn't honor the requirements of the drivers
> setting 'core_init_notifier' flag and tries to access the DBI registers
> during dw_pcie_ep_init(). This causes the system hang for glue drivers such
> as Tegra194 and Qcom EP as they depend on refclk from host and have set the
> above mentioned flag.
> 
> To workaround this issue, users of the affected platforms have to maintain
> the dependency with the PCIe host by booting the PCIe EP after host boot.
> But this won't provide a good user experience, since PCIe EP is _one_ of
> the features of those platforms and it doesn't make sense to delay the
> whole platform booting due to PCIe requiring active refclk.
> 
> So to fix this issue, let's move all the DBI access from
> dw_pcie_ep_init() in the DWC EP driver to the dw_pcie_ep_init_complete()
> API. This API will only be called by the drivers setting
> 'core_init_notifier' flag once refclk is received from host. For the rest
> of the drivers that gets the refclk locally, this API will be called
> within dw_pcie_ep_init().
> 
> Fixes: e966f7390da9 ("PCI: dwc: Refactor core initialization code for EP mode")
> Co-developed-by: Vidya Sagar <vidyas@nvidia.com>
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

I'm not sure if the Fixes tag is stictly correct, since there is
nothing wrong with the commit that the Fixes-tag is referencing.

What this patch addresses is an additional use-case/feature,
which allows you to start the EP-side before the RC-side.

However, I'm guessing that you kept the Fixes-tag such that this
patch will get backported. However, this patch is number 4/10 in
the patch series. If this is a strict fix that you want backported,
and it does not depend on any of the previous patches (it doesn't
seem that way), then I think that you should have put it as patch
1/10 in the series.

Patch ordering aside:
Reviewed-by: Niklas Cassel <cassel@kernel.org>
