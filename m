Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B9B86909C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 13:31:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rm04u7MA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkcKl5zHgz3vXW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 23:31:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rm04u7MA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkcK21J9xz3bl7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 23:30:44 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6e46db0cf82so2728250b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 04:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709037039; x=1709641839; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wrm6zOCUYamX5/HzD4TWzGE4UW/wSmlHUiwPxwaSkho=;
        b=rm04u7MAHm1nVxL2vtYTQtM4bxmnNWHSgtnpVgjVMjj1Cfq1Vp9W4CtJ8Sbxb8qVhW
         9c8xNT5MbfBUnqoFYfdj0k0L9cfvhXrT1n11mmhiewfn3ufLcnWL0EQ+x7rGF84Jxr7I
         YBYEcDhLfiVO2fgrD9vxqZgNYJkmc9+RsFEzl935FFfB7CCXrN/0SsDZYg9eDuhOSBqq
         wt8+ycyFeCIzgimF6Bx9EU9miJfxhyc0jWwyIH8CxhXtBfJbypId+dVJm6knF/iQTD/l
         gbC1heWGd/66YtScgANtrRPd/j+ygIAXMgh6p2l7vmg/fUTRbPmlSyNeF6jkNTfre2Re
         k1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709037039; x=1709641839;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wrm6zOCUYamX5/HzD4TWzGE4UW/wSmlHUiwPxwaSkho=;
        b=aMrgLm7Av71mZx0kqnLwpZRK2m4pO8iUfW7C+uNlglG06n9Xbv5LTOkSbIWR2WsQ0d
         wACaagRn4Upu/kS6BbfbLnwKr/zNpDoRr0kXHF9TjwdA/ChHZYh35+bEAVZjTmtBlit6
         EOd+XHALZuyWdTgoG+vd+3G87fXXkj7RKfkW2m/T/zPSaLjzLQeTjdxwoSDc52k3P9SG
         BdYmR8Hdz42Zg+xMP9IfH/h2ZPLKUxim3auYlEWs3xJu/u6IIv8B8Vtruj0kw7lnjh0h
         gxjetEkowHyIV1QZJmHoD+lfR54VhoTdkplWZL4PQz/r/YUIq4101DgruktOLVTkiibd
         k3Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUioSg4moC431synMROCz+au4KeQoUOc/MhJEkGp0L1WgLwqeayNmKSygDTOchHZt2mjyJSSFkrrB0oPzyy5vA/YDlSWBfSoqELcmRZ5A==
X-Gm-Message-State: AOJu0Yy5Wg8MiH01gqdjz8kH8eTI58XIacmRpyju8npz713X3xdJTRox
	NThOcbMmaKYaL/OuB+PhgWuiY+yEmcz8s0RXe50GRtbqx2Z0iIzPo8rKt2WaXA==
X-Google-Smtp-Source: AGHT+IF1SucMaGZmVzLO3Vi7Owg0MIIBRBMVFqlTO53r97tXf67o+cg/pWiwgklC+Ex3rLhnBWIXYA==
X-Received: by 2002:aa7:86c2:0:b0:6e4:870c:19b0 with SMTP id h2-20020aa786c2000000b006e4870c19b0mr8383712pfo.24.1709037039619;
        Tue, 27 Feb 2024 04:30:39 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id p19-20020a056a000b5300b006e5003f6e33sm5042416pfo.161.2024.02.27.04.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 04:30:39 -0800 (PST)
Date: Tue, 27 Feb 2024 18:00:24 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH v8 08/10] PCI: dwc: ep: Add a generic
 dw_pcie_ep_linkdown() API to handle LINK_DOWN event
Message-ID: <20240227123024.GO2587@thinkpad>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-8-64c7fd0cfe64@linaro.org>
 <ZdzH2lOSwBsIp/Jc@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZdzH2lOSwBsIp/Jc@lizhi-Precision-Tower-5810>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Niklas Cassel <cassel@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshih
 iro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 26, 2024 at 12:18:18PM -0500, Frank Li wrote:
> On Sat, Feb 24, 2024 at 12:24:14PM +0530, Manivannan Sadhasivam wrote:
> > The PCIe link can go to LINK_DOWN state in one of the following scenarios:
> > 
> > 1. Fundamental (PERST#)/hot/warm reset
> > 2. Link transition from L2/L3 to L0
> 
> From L0 to L2/l3
> 

I don't understand what you mean here. Link down won't happen while moving from
L0 to L2/L3, it is the opposite.

> > 
> > In those cases, LINK_DOWN causes some non-sticky DWC registers to loose the
> > state (like REBAR, PTM_CAP etc...). So the drivers need to reinitialize
> > them to function properly once the link comes back again.
> > 
> > This is not a problem for drivers supporting PERST# IRQ, since they can
> > reinitialize the registers in the PERST# IRQ callback. But for the drivers
> > not supporting PERST#, there is no way they can reinitialize the registers
> > other than relying on LINK_DOWN IRQ received when the link goes down. So
> > let's add a DWC generic API dw_pcie_ep_linkdown() that reinitializes the
> > non-sticky registers and also notifies the EPF drivers about link going
> > down.
> > 
> > This API can also be used by the drivers supporting PERST# to handle the
> > scenario (2) mentioned above.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-designware-ep.c | 111 ++++++++++++++----------
> >  drivers/pci/controller/dwc/pcie-designware.h    |   5 ++
> >  2 files changed, 72 insertions(+), 44 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > index 278bdc9b2269..fed4c2936c78 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > @@ -14,14 +14,6 @@
> >  #include <linux/pci-epc.h>
> >  #include <linux/pci-epf.h>
> >  
> > -void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
> > -{
> > -	struct pci_epc *epc = ep->epc;
> > -
> > -	pci_epc_linkup(epc);
> > -}
> > -EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
> > -
> 
> No sure why git remove this block and add these back.
> 

Because, we are adding dw_pcie_ep_linkdown() API way below and it makes sense to
move this API also to keep it ordered. Maybe I should've described it in commit
message.

- Mani

> 
> >  void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
> >  {
> >  	struct pci_epc *epc = ep->epc;
> > @@ -603,19 +595,56 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
> >  	return 0;
> >  }
> >  
> > +static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
> > +{
> > +	unsigned int offset, ptm_cap_base;
> > +	unsigned int nbars;
> > +	u32 reg, i;
> > +
> > +	offset = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_REBAR);
> > +	ptm_cap_base = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_PTM);
> > +
> > +	dw_pcie_dbi_ro_wr_en(pci);
> > +
> > +	if (offset) {
> > +		reg = dw_pcie_readl_dbi(pci, offset + PCI_REBAR_CTRL);
> > +		nbars = (reg & PCI_REBAR_CTRL_NBAR_MASK) >>
> > +			PCI_REBAR_CTRL_NBAR_SHIFT;
> > +
> > +		for (i = 0; i < nbars; i++, offset += PCI_REBAR_CTRL)
> > +			dw_pcie_writel_dbi(pci, offset + PCI_REBAR_CAP, 0x0);
> > +	}
> > +
> > +	/*
> > +	 * PTM responder capability can be disabled only after disabling
> > +	 * PTM root capability.
> > +	 */
> > +	if (ptm_cap_base) {
> > +		dw_pcie_dbi_ro_wr_en(pci);
> > +		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
> > +		reg &= ~PCI_PTM_CAP_ROOT;
> > +		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
> > +
> > +		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
> > +		reg &= ~(PCI_PTM_CAP_RES | PCI_PTM_GRANULARITY_MASK);
> > +		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
> > +		dw_pcie_dbi_ro_wr_dis(pci);
> > +	}
> > +
> > +	dw_pcie_setup(pci);
> > +	dw_pcie_dbi_ro_wr_dis(pci);
> > +}
> > +
> >  int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> >  	struct dw_pcie_ep_func *ep_func;
> >  	struct device *dev = pci->dev;
> >  	struct pci_epc *epc = ep->epc;
> > -	unsigned int offset, ptm_cap_base;
> > -	unsigned int nbars;
> >  	u8 hdr_type;
> >  	u8 func_no;
> > -	int i, ret;
> >  	void *addr;
> > -	u32 reg;
> > +	int ret;
> >  
> >  	hdr_type = dw_pcie_readb_dbi(pci, PCI_HEADER_TYPE) &
> >  		   PCI_HEADER_TYPE_MASK;
> > @@ -678,38 +707,7 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
> >  	if (ep->ops->init)
> >  		ep->ops->init(ep);
> >  
> > -	offset = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_REBAR);
> > -	ptm_cap_base = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_PTM);
> > -
> > -	dw_pcie_dbi_ro_wr_en(pci);
> > -
> > -	if (offset) {
> > -		reg = dw_pcie_readl_dbi(pci, offset + PCI_REBAR_CTRL);
> > -		nbars = (reg & PCI_REBAR_CTRL_NBAR_MASK) >>
> > -			PCI_REBAR_CTRL_NBAR_SHIFT;
> > -
> > -		for (i = 0; i < nbars; i++, offset += PCI_REBAR_CTRL)
> > -			dw_pcie_writel_dbi(pci, offset + PCI_REBAR_CAP, 0x0);
> > -	}
> > -
> > -	/*
> > -	 * PTM responder capability can be disabled only after disabling
> > -	 * PTM root capability.
> > -	 */
> > -	if (ptm_cap_base) {
> > -		dw_pcie_dbi_ro_wr_en(pci);
> > -		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
> > -		reg &= ~PCI_PTM_CAP_ROOT;
> > -		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
> > -
> > -		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
> > -		reg &= ~(PCI_PTM_CAP_RES | PCI_PTM_GRANULARITY_MASK);
> > -		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
> > -		dw_pcie_dbi_ro_wr_dis(pci);
> > -	}
> > -
> > -	dw_pcie_setup(pci);
> > -	dw_pcie_dbi_ro_wr_dis(pci);
> > +	dw_pcie_ep_init_non_sticky_registers(pci);
> >  
> >  	return 0;
> >  
> > @@ -720,6 +718,31 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
> >  }
> >  EXPORT_SYMBOL_GPL(dw_pcie_ep_init_registers);
> >  
> > +void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
> > +{
> > +	struct pci_epc *epc = ep->epc;
> > +
> > +	pci_epc_linkup(epc);
> > +}
> > +EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
> > +
> > +void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > +	struct pci_epc *epc = ep->epc;
> > +
> > +	/*
> > +	 * Initialize the non-sticky DWC registers as they would've reset post
> > +	 * LINK_DOWN. This is specifically needed for drivers not supporting
> > +	 * PERST# as they have no way to reinitialize the registers before the
> > +	 * link comes back again.
> > +	 */
> > +	dw_pcie_ep_init_non_sticky_registers(pci);
> > +
> > +	pci_epc_linkdown(epc);
> > +}
> > +EXPORT_SYMBOL_GPL(dw_pcie_ep_linkdown);
> > +
> >  int dw_pcie_ep_init(struct dw_pcie_ep *ep)
> >  {
> >  	int ret;
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > index f8e5431a207b..152969545b0a 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > @@ -668,6 +668,7 @@ static inline void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus,
> >  
> >  #ifdef CONFIG_PCIE_DW_EP
> >  void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
> > +void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep);
> >  int dw_pcie_ep_init(struct dw_pcie_ep *ep);
> >  int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep);
> >  void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
> > @@ -688,6 +689,10 @@ static inline void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
> >  {
> >  }
> >  
> > +static inline void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
> > +{
> > +}
> > +
> >  static inline int dw_pcie_ep_init(struct dw_pcie_ep *ep)
> >  {
> >  	return 0;
> > 
> > -- 
> > 2.25.1
> > 

-- 
மணிவண்ணன் சதாசிவம்
