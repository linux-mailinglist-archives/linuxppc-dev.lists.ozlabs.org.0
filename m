Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC0C869F87
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 19:51:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SHljwKuH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkmml1znsz3vfJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 05:51:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SHljwKuH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tkmm046bcz3vYC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 05:51:12 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1dc1ff697f9so37763565ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 10:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709059870; x=1709664670; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZzsUzPaeQV0xVaYYOa5fkl+D3bB3KmqWtFdIBMocqZs=;
        b=SHljwKuHgMMhSZ2/VOiSHJNV+emyQOWylhxPJHi6oWf1bJazrpo0qnHX35HHLM9p7m
         y3aj+5K5AKwJd7UomRPA9BRu+FQXZtEuIM0bfvdZ2HzxppezhZGxm4WWz0EL/B8pl2FY
         t6PH7V+UXCHt+V5bfMQF6b256UJo4LKxkOKNxtvMK6MrilGLuXWPKS47llGwOMFn3r9X
         kwOU/joypnKp78POnW2ir4baYSvQC66gOpip1TauAsdNcefqPyLyS6DKysVhYiGqJ+m2
         kFBUdf3T3LYKYEtL7FpmyQ56vOnEr06Q6fPtyR0EQlzeUHjxfW9E2ug9+s6xuh/grqoa
         TkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709059870; x=1709664670;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZzsUzPaeQV0xVaYYOa5fkl+D3bB3KmqWtFdIBMocqZs=;
        b=OuwSz79V+tRqQvmNZChfyREUWqlfc1ytHFJ6RinX0kEN0GjbwJm9oMLHxasbhpfTVF
         Q9lvnPdIslHtXYUFWVymEr6YLGDJBH3I7Xc7v+ansfwurto0efg3WQr7GFAIsg5wUA0F
         Qs3r3bE1xdDq3Lk0ne5BaM+kAftL+zQH/4m1cxropIIe+ZPIs56eDkHJMaE29c4127zG
         3EvkQ9pxcHZEBSVDDI0ktAsvUOX51AivvZU02VWE8q/urOke13vRsB5xiiEctr8X1xMN
         qcY2x5AUZE55CIDLdGnUW8iUei4bLjO14OaS6PB7MEKguIbz35BYEYdUI88i418G/+e5
         gHzw==
X-Forwarded-Encrypted: i=1; AJvYcCXrxY1Dv75YGI2BoWyAzatT2DN2X9aNPqbGDdLRSZV3j7nkPha336c1rGi3Ry8VyOjDqOHVgELgCGFDXYYrPHmJgvBI652pwL6zFwjdKA==
X-Gm-Message-State: AOJu0Yzc2nI5mtVwyvNnP0L1MUsfFUXLEO5nwQcu+FfOsfBd8AvRDy5E
	AmV2nKeofZbZLQa8cUKWAQgBAlgTp1hHUnuFjqKDjqLbF7z+V43FH6kyDF8BnQ==
X-Google-Smtp-Source: AGHT+IFMrquxHELSuk64r8EzaLnPYxdhtlQPf9g7u2EtEZHnTxtPf52KDLuAlSX+ap+F1qbMBmUq7w==
X-Received: by 2002:a17:903:449:b0:1da:2c01:fef5 with SMTP id iw9-20020a170903044900b001da2c01fef5mr10095757plb.56.1709059869792;
        Tue, 27 Feb 2024 10:51:09 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902d90300b001db93340f9bsm1828147plz.205.2024.02.27.10.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 10:51:09 -0800 (PST)
Date: Wed, 28 Feb 2024 00:20:50 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH v8 08/10] PCI: dwc: ep: Add a generic
 dw_pcie_ep_linkdown() API to handle LINK_DOWN event
Message-ID: <20240227185050.GV2587@thinkpad>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-8-64c7fd0cfe64@linaro.org>
 <ZdzH2lOSwBsIp/Jc@lizhi-Precision-Tower-5810>
 <20240227123024.GO2587@thinkpad>
 <Zd4bLZb2z4TEoR1a@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zd4bLZb2z4TEoR1a@lizhi-Precision-Tower-5810>
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

On Tue, Feb 27, 2024 at 12:26:05PM -0500, Frank Li wrote:
> On Tue, Feb 27, 2024 at 06:00:24PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Feb 26, 2024 at 12:18:18PM -0500, Frank Li wrote:
> > > On Sat, Feb 24, 2024 at 12:24:14PM +0530, Manivannan Sadhasivam wrote:
> > > > The PCIe link can go to LINK_DOWN state in one of the following scenarios:
> > > > 
> > > > 1. Fundamental (PERST#)/hot/warm reset
> > > > 2. Link transition from L2/L3 to L0
> > > 
> > > From L0 to L2/l3
> > > 
> > 
> > I don't understand what you mean here. Link down won't happen while moving from
> > L0 to L2/L3, it is the opposite.
> 
> Strange, why there are not linkdown from L0 to L2/l3. But have linkdown
> from L2/l3 to L0? when linkup happen? Any document show these?
> 

Refer PCIe Spec 5.0, Figure 5-1 Link Power Management State Flow Diagram.

- Mani

> Frank
> 
> > 
> > > > 
> > > > In those cases, LINK_DOWN causes some non-sticky DWC registers to loose the
> > > > state (like REBAR, PTM_CAP etc...). So the drivers need to reinitialize
> > > > them to function properly once the link comes back again.
> > > > 
> > > > This is not a problem for drivers supporting PERST# IRQ, since they can
> > > > reinitialize the registers in the PERST# IRQ callback. But for the drivers
> > > > not supporting PERST#, there is no way they can reinitialize the registers
> > > > other than relying on LINK_DOWN IRQ received when the link goes down. So
> > > > let's add a DWC generic API dw_pcie_ep_linkdown() that reinitializes the
> > > > non-sticky registers and also notifies the EPF drivers about link going
> > > > down.
> > > > 
> > > > This API can also be used by the drivers supporting PERST# to handle the
> > > > scenario (2) mentioned above.
> > > > 
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >  drivers/pci/controller/dwc/pcie-designware-ep.c | 111 ++++++++++++++----------
> > > >  drivers/pci/controller/dwc/pcie-designware.h    |   5 ++
> > > >  2 files changed, 72 insertions(+), 44 deletions(-)
> > > > 
> > > > diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > > index 278bdc9b2269..fed4c2936c78 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > > @@ -14,14 +14,6 @@
> > > >  #include <linux/pci-epc.h>
> > > >  #include <linux/pci-epf.h>
> > > >  
> > > > -void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
> > > > -{
> > > > -	struct pci_epc *epc = ep->epc;
> > > > -
> > > > -	pci_epc_linkup(epc);
> > > > -}
> > > > -EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
> > > > -
> > > 
> > > No sure why git remove this block and add these back.
> > > 
> > 
> > Because, we are adding dw_pcie_ep_linkdown() API way below and it makes sense to
> > move this API also to keep it ordered. Maybe I should've described it in commit
> > message.
> > 
> > - Mani
> > 
> > > 
> > > >  void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
> > > >  {
> > > >  	struct pci_epc *epc = ep->epc;
> > > > @@ -603,19 +595,56 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
> > > >  	return 0;
> > > >  }
> > > >  
> > > > +static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
> > > > +{
> > > > +	unsigned int offset, ptm_cap_base;
> > > > +	unsigned int nbars;
> > > > +	u32 reg, i;
> > > > +
> > > > +	offset = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_REBAR);
> > > > +	ptm_cap_base = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_PTM);
> > > > +
> > > > +	dw_pcie_dbi_ro_wr_en(pci);
> > > > +
> > > > +	if (offset) {
> > > > +		reg = dw_pcie_readl_dbi(pci, offset + PCI_REBAR_CTRL);
> > > > +		nbars = (reg & PCI_REBAR_CTRL_NBAR_MASK) >>
> > > > +			PCI_REBAR_CTRL_NBAR_SHIFT;
> > > > +
> > > > +		for (i = 0; i < nbars; i++, offset += PCI_REBAR_CTRL)
> > > > +			dw_pcie_writel_dbi(pci, offset + PCI_REBAR_CAP, 0x0);
> > > > +	}
> > > > +
> > > > +	/*
> > > > +	 * PTM responder capability can be disabled only after disabling
> > > > +	 * PTM root capability.
> > > > +	 */
> > > > +	if (ptm_cap_base) {
> > > > +		dw_pcie_dbi_ro_wr_en(pci);
> > > > +		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
> > > > +		reg &= ~PCI_PTM_CAP_ROOT;
> > > > +		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
> > > > +
> > > > +		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
> > > > +		reg &= ~(PCI_PTM_CAP_RES | PCI_PTM_GRANULARITY_MASK);
> > > > +		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
> > > > +		dw_pcie_dbi_ro_wr_dis(pci);
> > > > +	}
> > > > +
> > > > +	dw_pcie_setup(pci);
> > > > +	dw_pcie_dbi_ro_wr_dis(pci);
> > > > +}
> > > > +
> > > >  int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
> > > >  {
> > > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > >  	struct dw_pcie_ep_func *ep_func;
> > > >  	struct device *dev = pci->dev;
> > > >  	struct pci_epc *epc = ep->epc;
> > > > -	unsigned int offset, ptm_cap_base;
> > > > -	unsigned int nbars;
> > > >  	u8 hdr_type;
> > > >  	u8 func_no;
> > > > -	int i, ret;
> > > >  	void *addr;
> > > > -	u32 reg;
> > > > +	int ret;
> > > >  
> > > >  	hdr_type = dw_pcie_readb_dbi(pci, PCI_HEADER_TYPE) &
> > > >  		   PCI_HEADER_TYPE_MASK;
> > > > @@ -678,38 +707,7 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
> > > >  	if (ep->ops->init)
> > > >  		ep->ops->init(ep);
> > > >  
> > > > -	offset = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_REBAR);
> > > > -	ptm_cap_base = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_PTM);
> > > > -
> > > > -	dw_pcie_dbi_ro_wr_en(pci);
> > > > -
> > > > -	if (offset) {
> > > > -		reg = dw_pcie_readl_dbi(pci, offset + PCI_REBAR_CTRL);
> > > > -		nbars = (reg & PCI_REBAR_CTRL_NBAR_MASK) >>
> > > > -			PCI_REBAR_CTRL_NBAR_SHIFT;
> > > > -
> > > > -		for (i = 0; i < nbars; i++, offset += PCI_REBAR_CTRL)
> > > > -			dw_pcie_writel_dbi(pci, offset + PCI_REBAR_CAP, 0x0);
> > > > -	}
> > > > -
> > > > -	/*
> > > > -	 * PTM responder capability can be disabled only after disabling
> > > > -	 * PTM root capability.
> > > > -	 */
> > > > -	if (ptm_cap_base) {
> > > > -		dw_pcie_dbi_ro_wr_en(pci);
> > > > -		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
> > > > -		reg &= ~PCI_PTM_CAP_ROOT;
> > > > -		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
> > > > -
> > > > -		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
> > > > -		reg &= ~(PCI_PTM_CAP_RES | PCI_PTM_GRANULARITY_MASK);
> > > > -		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
> > > > -		dw_pcie_dbi_ro_wr_dis(pci);
> > > > -	}
> > > > -
> > > > -	dw_pcie_setup(pci);
> > > > -	dw_pcie_dbi_ro_wr_dis(pci);
> > > > +	dw_pcie_ep_init_non_sticky_registers(pci);
> > > >  
> > > >  	return 0;
> > > >  
> > > > @@ -720,6 +718,31 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(dw_pcie_ep_init_registers);
> > > >  
> > > > +void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
> > > > +{
> > > > +	struct pci_epc *epc = ep->epc;
> > > > +
> > > > +	pci_epc_linkup(epc);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
> > > > +
> > > > +void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
> > > > +{
> > > > +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > > +	struct pci_epc *epc = ep->epc;
> > > > +
> > > > +	/*
> > > > +	 * Initialize the non-sticky DWC registers as they would've reset post
> > > > +	 * LINK_DOWN. This is specifically needed for drivers not supporting
> > > > +	 * PERST# as they have no way to reinitialize the registers before the
> > > > +	 * link comes back again.
> > > > +	 */
> > > > +	dw_pcie_ep_init_non_sticky_registers(pci);
> > > > +
> > > > +	pci_epc_linkdown(epc);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(dw_pcie_ep_linkdown);
> > > > +
> > > >  int dw_pcie_ep_init(struct dw_pcie_ep *ep)
> > > >  {
> > > >  	int ret;
> > > > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > > > index f8e5431a207b..152969545b0a 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > > > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > > > @@ -668,6 +668,7 @@ static inline void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus,
> > > >  
> > > >  #ifdef CONFIG_PCIE_DW_EP
> > > >  void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
> > > > +void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep);
> > > >  int dw_pcie_ep_init(struct dw_pcie_ep *ep);
> > > >  int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep);
> > > >  void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
> > > > @@ -688,6 +689,10 @@ static inline void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
> > > >  {
> > > >  }
> > > >  
> > > > +static inline void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
> > > > +{
> > > > +}
> > > > +
> > > >  static inline int dw_pcie_ep_init(struct dw_pcie_ep *ep)
> > > >  {
> > > >  	return 0;
> > > > 
> > > > -- 
> > > > 2.25.1
> > > > 
> > 
> > -- 
> > மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்
