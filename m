Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 521CE87599B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 22:44:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CpdBAuCn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrN9V0cqNz3vXC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 08:44:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CpdBAuCn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrN8j4C3tz3vdk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 08:43:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 24AC8CE2663;
	Thu,  7 Mar 2024 21:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B14C433C7;
	Thu,  7 Mar 2024 21:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709847810;
	bh=vU+8lR7+ImFBoMF2RNCtUGPZiZVDYC+eokbSchOhHxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CpdBAuCnHEuX5dqOZmE914UXDbR1GFAvw9iSR04XvWUTZVsXUc7qKucuAPm/ZN9rZ
	 1xITN/T/tNhMU6Xi1y/hcfWowgvrWXYXBm4u/Tugs89Bujkw9P/j81qHX9HZqI/Z5R
	 zyLiDhResX89D3G3lVBrLo94yz4epDe5zJsAsGQErgmdjwHYB1Pa4hXwYRYNSmbCWb
	 i3gXxs1Sn0uHls1YhYWcbc641AXC2JlqA7NIN4MZ/5h/3KUuh17NnHlK9u2N+NxOQT
	 aWkVBswNRZ82LyzS1efl8QRASuilWoaMjceTqKqQRvwEacrDFvHAR61U8kD3liunMR
	 rv64PIpfSOwwQ==
Date: Thu, 7 Mar 2024 22:43:19 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v9 08/10] PCI: dwc: ep: Add a generic
 dw_pcie_ep_linkdown() API to handle LINK_DOWN event
Message-ID: <Zeo0996FscpDSnjL@ryzen>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-8-29d433d99cda@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304-pci-dbi-rework-v9-8-29d433d99cda@linaro.org>
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

On Mon, Mar 04, 2024 at 02:52:20PM +0530, Manivannan Sadhasivam wrote:
> The PCIe link can go to LINK_DOWN state in one of the following scenarios:
> 
> 1. Fundamental (PERST#)/hot/warm reset
> 2. Link transition from L2/L3 to L0
> 
> In those cases, LINK_DOWN causes some non-sticky DWC registers to loose the
> state (like REBAR, PTM_CAP etc...). So the drivers need to reinitialize
> them to function properly once the link comes back again.
> 
> This is not a problem for drivers supporting PERST# IRQ, since they can
> reinitialize the registers in the PERST# IRQ callback. But for the drivers
> not supporting PERST#, there is no way they can reinitialize the registers
> other than relying on LINK_DOWN IRQ received when the link goes down. So
> let's add a DWC generic API dw_pcie_ep_linkdown() that reinitializes the
> non-sticky registers and also notifies the EPF drivers about link going
> down.
> 
> This API can also be used by the drivers supporting PERST# to handle the
> scenario (2) mentioned above.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 111 ++++++++++++++----------
>  drivers/pci/controller/dwc/pcie-designware.h    |   5 ++
>  2 files changed, 72 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 278bdc9b2269..fed4c2936c78 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -14,14 +14,6 @@
>  #include <linux/pci-epc.h>
>  #include <linux/pci-epf.h>
>  
> -void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
> -{
> -	struct pci_epc *epc = ep->epc;
> -
> -	pci_epc_linkup(epc);
> -}
> -EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
> -
>  void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
>  {
>  	struct pci_epc *epc = ep->epc;
> @@ -603,19 +595,56 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
>  	return 0;
>  }
>  
> +static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
> +{
> +	unsigned int offset, ptm_cap_base;
> +	unsigned int nbars;
> +	u32 reg, i;
> +
> +	offset = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_REBAR);
> +	ptm_cap_base = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_PTM);
> +
> +	dw_pcie_dbi_ro_wr_en(pci);
> +
> +	if (offset) {
> +		reg = dw_pcie_readl_dbi(pci, offset + PCI_REBAR_CTRL);
> +		nbars = (reg & PCI_REBAR_CTRL_NBAR_MASK) >>
> +			PCI_REBAR_CTRL_NBAR_SHIFT;
> +
> +		for (i = 0; i < nbars; i++, offset += PCI_REBAR_CTRL)
> +			dw_pcie_writel_dbi(pci, offset + PCI_REBAR_CAP, 0x0);

If you look at PCI_REBAR_CAP, you will see that it is sticky,
but you have to actually read the databook to see that:

"The RESBAR_CTRL_REG_BAR_SIZE field is automatically updated
when you write to RESBAR_CAP_REG_0_REG through the DBI."

So the reason why we need to write this register, even though
it is sticky, is to update the RESBAR_CTRL_REG_BAR_SIZE register,
which is not sticky :)

(Perhaps we should add that as a comment?)


> +	}
> +
> +	/*
> +	 * PTM responder capability can be disabled only after disabling
> +	 * PTM root capability.
> +	 */
> +	if (ptm_cap_base) {
> +		dw_pcie_dbi_ro_wr_en(pci);
> +		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
> +		reg &= ~PCI_PTM_CAP_ROOT;
> +		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
> +
> +		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
> +		reg &= ~(PCI_PTM_CAP_RES | PCI_PTM_GRANULARITY_MASK);
> +		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
> +		dw_pcie_dbi_ro_wr_dis(pci);

From looking at the databook:
PCI_PTM_CAP_ROOT:
Note: This register field is sticky.

PCI_PTM_CAP_RES:
Note: This register field is sticky.

PCI_PTM_GRANULARITY_MASK:
Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else
R(sticky)

So all these register fields appear to be sticky to me.
So I would assume that the PTM related writes could be
done in dw_pcie_ep_init_registers().


> +	}
> +
> +	dw_pcie_setup(pci);
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +}
> +
>  int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct dw_pcie_ep_func *ep_func;
>  	struct device *dev = pci->dev;
>  	struct pci_epc *epc = ep->epc;
> -	unsigned int offset, ptm_cap_base;
> -	unsigned int nbars;
>  	u8 hdr_type;
>  	u8 func_no;
> -	int i, ret;
>  	void *addr;
> -	u32 reg;
> +	int ret;
>  
>  	hdr_type = dw_pcie_readb_dbi(pci, PCI_HEADER_TYPE) &
>  		   PCI_HEADER_TYPE_MASK;
> @@ -678,38 +707,7 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
>  	if (ep->ops->init)
>  		ep->ops->init(ep);
>  
> -	offset = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_REBAR);
> -	ptm_cap_base = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_PTM);
> -
> -	dw_pcie_dbi_ro_wr_en(pci);
> -
> -	if (offset) {
> -		reg = dw_pcie_readl_dbi(pci, offset + PCI_REBAR_CTRL);
> -		nbars = (reg & PCI_REBAR_CTRL_NBAR_MASK) >>
> -			PCI_REBAR_CTRL_NBAR_SHIFT;
> -
> -		for (i = 0; i < nbars; i++, offset += PCI_REBAR_CTRL)
> -			dw_pcie_writel_dbi(pci, offset + PCI_REBAR_CAP, 0x0);
> -	}
> -
> -	/*
> -	 * PTM responder capability can be disabled only after disabling
> -	 * PTM root capability.
> -	 */
> -	if (ptm_cap_base) {
> -		dw_pcie_dbi_ro_wr_en(pci);
> -		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
> -		reg &= ~PCI_PTM_CAP_ROOT;
> -		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
> -
> -		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
> -		reg &= ~(PCI_PTM_CAP_RES | PCI_PTM_GRANULARITY_MASK);
> -		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
> -		dw_pcie_dbi_ro_wr_dis(pci);
> -	}
> -
> -	dw_pcie_setup(pci);
> -	dw_pcie_dbi_ro_wr_dis(pci);
> +	dw_pcie_ep_init_non_sticky_registers(pci);
>  
>  	return 0;
>  
> @@ -720,6 +718,31 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_init_registers);
>  
> +void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
> +{
> +	struct pci_epc *epc = ep->epc;
> +
> +	pci_epc_linkup(epc);
> +}
> +EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
> +
> +void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	struct pci_epc *epc = ep->epc;
> +
> +	/*
> +	 * Initialize the non-sticky DWC registers as they would've reset post
> +	 * LINK_DOWN. This is specifically needed for drivers not supporting
> +	 * PERST# as they have no way to reinitialize the registers before the
> +	 * link comes back again.
> +	 */
> +	dw_pcie_ep_init_non_sticky_registers(pci);
> +
> +	pci_epc_linkdown(epc);
> +}
> +EXPORT_SYMBOL_GPL(dw_pcie_ep_linkdown);
> +
>  int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  {
>  	int ret;
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index f8e5431a207b..152969545b0a 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -668,6 +668,7 @@ static inline void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus,
>  
>  #ifdef CONFIG_PCIE_DW_EP
>  void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
> +void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep);
>  int dw_pcie_ep_init(struct dw_pcie_ep *ep);
>  int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep);
>  void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
> @@ -688,6 +689,10 @@ static inline void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
>  {
>  }
>  
> +static inline void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
> +{
> +}
> +
>  static inline int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  {
>  	return 0;
> 
> -- 
> 2.25.1
> 
