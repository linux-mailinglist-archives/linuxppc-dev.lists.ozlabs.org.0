Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B802D875DC6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 06:42:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p5qCRBmG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrZnf3nP4z3vZ5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 16:42:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p5qCRBmG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrZmx4Pd8z3bPV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 16:42:08 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dbd32cff0bso15459315ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Mar 2024 21:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709876527; x=1710481327; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wj7ac9ROAndLu9NTzKRLw7kY+6dSERw+t3Ms1EcCpQw=;
        b=p5qCRBmGALbKPp9DuBvvq7MTvLJD7rH49qbQJDfySivwmFv75UyRm7KOuyVozTxt7/
         mFhEp1y/G4wmyePGPXm7GZMlF3a4NEZ5r7Sz6NR0MyroXKuTKzkNH35JgLJCeTHw7/jG
         v262Aih/5390qbSHTGjyjkV5hbtgOZ0GJcc5aMjWneBjOROM0hW+Y3YOvpdSkpQ3xtke
         aeXDd6aQ9SZFfY7bAwMxLqWl8zTK2u0Hvqf0FY15hYSE5h7r/HlwJGNwFkhuDOJhzdll
         77ou0iJ7G0RkzpJimDHKZUBUPWsQ4n3cVo5Av3PAZnPGGy8CA7Ieuo+IHjh9UBfacvf/
         QvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709876527; x=1710481327;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wj7ac9ROAndLu9NTzKRLw7kY+6dSERw+t3Ms1EcCpQw=;
        b=NBLOaZhIQ1YSL+msJXR0Sa1oHL/3xMRmPUMerspQcN5KtrNzB77OTuZUCvsqdvdjnM
         gpefdrJpTsvhQxC27A8FYdEa+smckSkbF9no+cxdkvDdtIp3ocrvSfUHp3enzue5w8wr
         5YIXSXN6qDx6NXLUEpEGEfTWgIoYDtY4GSWNXYIXkSttC7Z1/11gbsngCRpgdp3mNvDY
         TNaBBvl/CpVumpknQ8llqAG+pGkD/zdIRpITVnYOjvf5rJwm/7JUCEm4yvIvCn0vwP7m
         UKI5/Yk1m1hr5FPivJi/xldBrSxiT4ut5Og5U7AOpm5v/xECdaweOfnse1V4VLBdwubZ
         LTBA==
X-Forwarded-Encrypted: i=1; AJvYcCV0EPotbqjyLdlDr/7F5NyYHSQ7TGp5fu0gd4XAySsRuZYsDFp9Wl8tZ6CPwO9mNbfIFsTYn+8HZ+6ioZNat0owROmP0Ejctfh4KpZkRg==
X-Gm-Message-State: AOJu0YxZUiTybfl6pHGKFjlUEaP258wyk5r+E9fYC0iskRcYBrjKcKj8
	sI4lA2tVr0HvccYaHF+kuDUEqEs59KKzirN5F49ePOTkxrxcQ502/Ve12ndFQQ==
X-Google-Smtp-Source: AGHT+IGPo1kH4a7F0KYLb9k/4GMe62ypgOZCiBVkqJtP9bo7e8O9nDucCm38qy36kskyFMcYV2JE9A==
X-Received: by 2002:a17:902:6b4c:b0:1dc:ffb7:e857 with SMTP id g12-20020a1709026b4c00b001dcffb7e857mr9330126plt.57.1709876526773;
        Thu, 07 Mar 2024 21:42:06 -0800 (PST)
Received: from thinkpad ([117.217.178.39])
        by smtp.gmail.com with ESMTPSA id u11-20020a170903124b00b001dc01efaec2sm15532041plh.168.2024.03.07.21.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 21:42:06 -0800 (PST)
Date: Fri, 8 Mar 2024 11:11:52 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v9 08/10] PCI: dwc: ep: Add a generic
 dw_pcie_ep_linkdown() API to handle LINK_DOWN event
Message-ID: <20240308054152.GD3789@thinkpad>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-8-29d433d99cda@linaro.org>
 <Zeo0996FscpDSnjL@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zeo0996FscpDSnjL@ryzen>
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

On Thu, Mar 07, 2024 at 10:43:19PM +0100, Niklas Cassel wrote:
> On Mon, Mar 04, 2024 at 02:52:20PM +0530, Manivannan Sadhasivam wrote:
> > The PCIe link can go to LINK_DOWN state in one of the following scenarios:
> > 
> > 1. Fundamental (PERST#)/hot/warm reset
> > 2. Link transition from L2/L3 to L0
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
> 
> If you look at PCI_REBAR_CAP, you will see that it is sticky,
> but you have to actually read the databook to see that:
> 
> "The RESBAR_CTRL_REG_BAR_SIZE field is automatically updated
> when you write to RESBAR_CAP_REG_0_REG through the DBI."
> 
> So the reason why we need to write this register, even though
> it is sticky, is to update the RESBAR_CTRL_REG_BAR_SIZE register,
> which is not sticky :)
> 
> (Perhaps we should add that as a comment?)
> 

Yeah, makes sense.

> 
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
> 
> From looking at the databook:
> PCI_PTM_CAP_ROOT:
> Note: This register field is sticky.
> 
> PCI_PTM_CAP_RES:
> Note: This register field is sticky.
> 
> PCI_PTM_GRANULARITY_MASK:
> Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else
> R(sticky)
> 
> So all these register fields appear to be sticky to me.
> So I would assume that the PTM related writes could be
> done in dw_pcie_ep_init_registers().
> 

Sorry, I didn't cross check the registers w/ databook as I was under the
assumption that all PTM registers are non-sticky. Will move them.

- Mani

> 
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
