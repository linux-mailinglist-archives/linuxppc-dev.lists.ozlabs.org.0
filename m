Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F7987606B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 09:57:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nkUnjNkP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Trg6D6ZCPz3vYb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 19:57:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nkUnjNkP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Trg5V3ylnz3cPm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 19:56:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B42C61DB9;
	Fri,  8 Mar 2024 08:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECFDC433C7;
	Fri,  8 Mar 2024 08:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709888203;
	bh=J4bX5OiJi6RfDlV1yRXpVjfgTtrgKXI42Kvd2JlHSRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nkUnjNkPxbAeCR9BEcZdVU5y2Y2jG5YUv4q2H1r7SjG3mghGjn+XC9AN7gH6FqaA7
	 TIAOCsfx1ycqbxcnRTnfsSFxLWsXqAq3Mh2UWACRb9SmQujBgQM2XjEYLLIM7uzUUu
	 NA8AsN5qkpkjhRG4JAJqADVEkImK0SGtiNgc6ymi8oV9FMfWltBvpVlEhm+O+tp3ys
	 ZmyrIghXMDm8hYekfaLefzniEYfpgD/P1hj/8pRZCNrJA0GIUpI9EkgQVDl6Bkfe/s
	 9h+0jBN8Jr0tx2Hk2jMbBMZWvENSJaqH8f6E2psy1h3zw84eC14i08yXHyJt4BysAL
	 /2bp3BQQ30dEw==
Date: Fri, 8 Mar 2024 09:56:33 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v9 08/10] PCI: dwc: ep: Add a generic
 dw_pcie_ep_linkdown() API to handle LINK_DOWN event
Message-ID: <ZerSwdxAnN2mUxf0@ryzen>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-8-29d433d99cda@linaro.org>
 <Zeo0996FscpDSnjL@ryzen>
 <20240308054152.GD3789@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308054152.GD3789@thinkpad>
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

On Fri, Mar 08, 2024 at 11:11:52AM +0530, Manivannan Sadhasivam wrote:
> On Thu, Mar 07, 2024 at 10:43:19PM +0100, Niklas Cassel wrote:
> > On Mon, Mar 04, 2024 at 02:52:20PM +0530, Manivannan Sadhasivam wrote:
> > > The PCIe link can go to LINK_DOWN state in one of the following scenarios:
> > > 
> > > 1. Fundamental (PERST#)/hot/warm reset
> > > 2. Link transition from L2/L3 to L0
> > > 
> > > In those cases, LINK_DOWN causes some non-sticky DWC registers to loose the
> > > state (like REBAR, PTM_CAP etc...). So the drivers need to reinitialize
> > > them to function properly once the link comes back again.
> > > 
> > > This is not a problem for drivers supporting PERST# IRQ, since they can
> > > reinitialize the registers in the PERST# IRQ callback. But for the drivers
> > > not supporting PERST#, there is no way they can reinitialize the registers
> > > other than relying on LINK_DOWN IRQ received when the link goes down. So
> > > let's add a DWC generic API dw_pcie_ep_linkdown() that reinitializes the
> > > non-sticky registers and also notifies the EPF drivers about link going
> > > down.
> > > 
> > > This API can also be used by the drivers supporting PERST# to handle the
> > > scenario (2) mentioned above.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-designware-ep.c | 111 ++++++++++++++----------
> > >  drivers/pci/controller/dwc/pcie-designware.h    |   5 ++
> > >  2 files changed, 72 insertions(+), 44 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > index 278bdc9b2269..fed4c2936c78 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > @@ -14,14 +14,6 @@
> > >  #include <linux/pci-epc.h>
> > >  #include <linux/pci-epf.h>
> > >  
> > > -void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
> > > -{
> > > -	struct pci_epc *epc = ep->epc;
> > > -
> > > -	pci_epc_linkup(epc);
> > > -}
> > > -EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
> > > -
> > >  void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
> > >  {
> > >  	struct pci_epc *epc = ep->epc;
> > > @@ -603,19 +595,56 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
> > >  	return 0;
> > >  }
> > >  
> > > +static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
> > > +{
> > > +	unsigned int offset, ptm_cap_base;
> > > +	unsigned int nbars;
> > > +	u32 reg, i;
> > > +
> > > +	offset = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_REBAR);
> > > +	ptm_cap_base = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_PTM);
> > > +
> > > +	dw_pcie_dbi_ro_wr_en(pci);
> > > +
> > > +	if (offset) {
> > > +		reg = dw_pcie_readl_dbi(pci, offset + PCI_REBAR_CTRL);
> > > +		nbars = (reg & PCI_REBAR_CTRL_NBAR_MASK) >>
> > > +			PCI_REBAR_CTRL_NBAR_SHIFT;
> > > +
> > > +		for (i = 0; i < nbars; i++, offset += PCI_REBAR_CTRL)
> > > +			dw_pcie_writel_dbi(pci, offset + PCI_REBAR_CAP, 0x0);
> > 
> > If you look at PCI_REBAR_CAP, you will see that it is sticky,
> > but you have to actually read the databook to see that:
> > 
> > "The RESBAR_CTRL_REG_BAR_SIZE field is automatically updated
> > when you write to RESBAR_CAP_REG_0_REG through the DBI."
> > 
> > So the reason why we need to write this register, even though
> > it is sticky, is to update the RESBAR_CTRL_REG_BAR_SIZE register,
> > which is not sticky :)
> > 
> > (Perhaps we should add that as a comment?)
> > 
> 
> Yeah, makes sense.

Note that I add a (unrelated) comment related to REBAR_CAP in this patch:
https://lore.kernel.org/linux-pci/20240307111520.3303774-1-cassel@kernel.org/T/#u

But once we move/add code to dw_pcie_ep_init_non_sticky_registers(), I think
that it might be a good "rule" to have a small comment for each write in
dw_pcie_ep_init_non_sticky_registers() which explains why the code should be
in dw_pcie_ep_init_non_sticky_registers() instead of dw_pcie_ep_init_registers(),
even if it just a small:

/* Field PCI_XXX_YYY.ZZZ is non-sticky */
writel_dbi(pci, offset + PCI_XXX_YYY, 0);


Kind regards,
Niklas
