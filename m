Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5348760A7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 10:06:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MWkI4xtH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrgJB1bJRz3vZt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 20:06:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MWkI4xtH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrgHS3JYpz3dC0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 20:05:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 84CF561DB8;
	Fri,  8 Mar 2024 09:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6806C433B1;
	Fri,  8 Mar 2024 09:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709888722;
	bh=bZE3lLlkuJ7PvYUKEQqczGXk3MirQvfYGrIhBNhV2+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MWkI4xtHh0q/rku6OXru8Y5F0uyRm3OagmGFpmUyIc2rYcZiMSPOiATfm4KcSiUkW
	 IA/wiVN/IG7POxQlNaaz79LCo+ocHGUmXgYP6x6UEr/8a5tlpJo5msNuAtAERLfowz
	 OydyRBOmxFQHHf4+urZfZqiXS8SHOFOoGxXqRrutLHKA76PqWRFuhnOKTTspI+kuci
	 BQ28JitosqrxLAk3FoKKSH0YNWL74SOgWXdv6mXlpxLAHHLBY1yr79+O6wbAgLS4s4
	 B4A1F/m+kSB0tUh7hiHLnsNWlFj4wbjuW+NQlJBLF+NrcRpNktQGGd61YzrHsCJ5xm
	 y+8eyn0zKZ4sA==
Date: Fri, 8 Mar 2024 10:05:11 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v9 06/10] PCI: dwc: ep: Call dw_pcie_ep_init_registers()
 API directly from all glue drivers
Message-ID: <ZerUx9Vw_W997LZk@ryzen>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-6-29d433d99cda@linaro.org>
 <ZeolaEIRYmKZjnvT@ryzen>
 <20240308053624.GB3789@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308053624.GB3789@thinkpad>
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

On Fri, Mar 08, 2024 at 11:06:24AM +0530, Manivannan Sadhasivam wrote:
> On Thu, Mar 07, 2024 at 09:36:56PM +0100, Niklas Cassel wrote:
> > On Mon, Mar 04, 2024 at 02:52:18PM +0530, Manivannan Sadhasivam wrote:
> > > Currently, dw_pcie_ep_init_registers() API is directly called by the glue
> > > drivers requiring active refclk from host. But for the other drivers, it is
> > > getting called implicitly by dw_pcie_ep_init(). This is due to the fact
> > > that this API initializes DWC EP specific registers and that requires an
> > > active refclk (either from host or generated locally by endpoint itsef).
> > > 
> > > But, this causes a discrepancy among the glue drivers. So to avoid this
> > > confusion, let's call this API directly from all glue drivers irrespective
> > > of refclk dependency. Only difference here is that the drivers requiring
> > > refclk from host will call this API only after the refclk is received and
> > > other drivers without refclk dependency will call this API right after
> > > dw_pcie_ep_init().
> > > 
> > > With this change, the check for 'core_init_notifier' flag can now be
> > > dropped from dw_pcie_ep_init() API. This will also allow us to remove the
> > > 'core_init_notifier' flag completely in the later commits.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  drivers/pci/controller/dwc/pci-dra7xx.c           |  7 +++++++
> > >  drivers/pci/controller/dwc/pci-imx6.c             |  8 ++++++++
> > >  drivers/pci/controller/dwc/pci-keystone.c         |  9 +++++++++
> > >  drivers/pci/controller/dwc/pci-layerscape-ep.c    |  7 +++++++
> > >  drivers/pci/controller/dwc/pcie-artpec6.c         | 13 ++++++++++++-
> > >  drivers/pci/controller/dwc/pcie-designware-ep.c   | 22 ----------------------
> > >  drivers/pci/controller/dwc/pcie-designware-plat.c |  9 +++++++++
> > >  drivers/pci/controller/dwc/pcie-keembay.c         | 16 +++++++++++++++-
> > >  drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 12 +++++++++++-
> > >  drivers/pci/controller/dwc/pcie-uniphier-ep.c     | 13 ++++++++++++-
> > >  10 files changed, 90 insertions(+), 26 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> > > index 0e406677060d..395042b29ffc 100644
> > > --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> > > +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> > > @@ -467,6 +467,13 @@ static int dra7xx_add_pcie_ep(struct dra7xx_pcie *dra7xx,
> > >  		return ret;
> > >  	}
> > >  
> > > +	ret = dw_pcie_ep_init_registers(ep);
> > > +	if (ret) {
> > 
> > Here you are using if (ret) to error check the return from
> > dw_pcie_ep_init_registers().
> > 
> > 
> > > index c0c62533a3f1..8392894ed286 100644
> > > --- a/drivers/pci/controller/dwc/pci-keystone.c
> > > +++ b/drivers/pci/controller/dwc/pci-keystone.c
> > > @@ -1286,6 +1286,13 @@ static int ks_pcie_probe(struct platform_device *pdev)
> > >  		ret = dw_pcie_ep_init(&pci->ep);
> > >  		if (ret < 0)
> > >  			goto err_get_sync;
> > > +
> > > +		ret = dw_pcie_ep_init_registers(&pci->ep);
> > > +		if (ret < 0) {
> > 
> > Here you are using if (ret < 0) to error check the return from
> > dw_pcie_ep_init_registers(). Please be consistent.
> > 
> 
> I maintained the consistency w.r.t individual drivers. Please check them
> individually.
> 
> If I maintain consistency w.r.t this patch, then the style will change within
> the drivers.

Personally, I disagree with that.

All glue drivers should use the same way of checking dw_pcie_ep_init(),
depending on the kdoc of dw_pcie_ep_init().

If the kdoc for dw_pcie_ep_init() says returns 0 on success,
then I think that it is strictly more correct to do:

ret = dw_pcie_ep_init()
if (ret) {
	<error handling>
}

And if a glue driver doesn't look like that, then I think we should change
them. (Same reasoning for dw_pcie_ep_init_registers().)


If you read code that looks like:
ret = dw_pcie_ep_init()
if (ret < 0) {
	<error handling>
}

then you assume that is is a function with a kdoc that says it can return 0
or a positive value on success, e.g. a function that returns an index in an
array.


Kind regards,
Niklas
