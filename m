Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C92687613A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 10:47:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xWDhVK17;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrhCS6TLvz3vYv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 20:47:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xWDhVK17;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrhBk6vYQz2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 20:46:22 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6e5a50d91b4so593991b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Mar 2024 01:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709891180; x=1710495980; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kb10RNHzo2wWSlL+Eq4xCbaoA0z2rfpZzBo11/jnm6s=;
        b=xWDhVK17VZ33cjLxQUkjCmKA9h+1QmL9FqZYlTBC59bfyegCVEgySL1+Qs6KHpMrgv
         hwKUnPW3Q30hkkVb5neTrVTxvGiaZLFaftR1NGoBuWkf+S60nm6bgDGSJRXPBPk8Jfn6
         mBxrZxdiON5GGftImlQ/SQSVix4dJo7xLVK9VmbM+E5lLScdW7ICml/w3HWxH0aRj7L4
         X7/2dL4HWapmWSu3uhsBgM+0/4Wza/SB+X7aFLQAJkZCul2Sv8WwZgGzXm8XzwcO9x+e
         k90RAYfqXiEDWpK+ywJU70OsdcmU9lcrBwzwu1Ig+QL8aPZesc5FRNXd9RJeCw0iO9sd
         cS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709891180; x=1710495980;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kb10RNHzo2wWSlL+Eq4xCbaoA0z2rfpZzBo11/jnm6s=;
        b=e0lf6bAOmNa0ULWazKmB0nJFavjHqc0URNn6fIzCvOwZ5N4KGkFwlOACvS4psdt6Ko
         hPoVdKMQCbf6rpj6MBAqJ9hukVWmNMItQLkxnox82s6SQM7STZWrfrO1mkwE9cnbeNFv
         FxnFGUz1w+d5lpn2dG1qWh/qPXBQC45IEs6pwGl5+/Z+N6Luug+Bw623t4W4uWZLPwDn
         0mZ6Hti57/yGSqKgj1JXGt/mCS1xvUn/nZni1mM4lM4M6sXAZabmhXb4lvCDZPwcQskM
         dZyjMSUGtlG1EGx8ubv5reu3vCTO0asjWgxJM2pm2xKCY4L83yZOFiiBV2tsbHdSQTTU
         qeaw==
X-Forwarded-Encrypted: i=1; AJvYcCUgGqVOZuLL5dCdsiF6NemuqyexfuuDjGpnJAZloaleePwZncAScXqRYv0CB0w754K/8mCeycaIzWuxXfn9Bazqx4HN3rx3A/KRgO/Q0g==
X-Gm-Message-State: AOJu0YyXTeJb1yjccVSb1KGHL4QAmjTZ5hJgsmYl85r4S896ri+wVftP
	3by5swUjNfSLfbadQQ/FSP/5qOsIX1bdQuwRAZwHLKuJaQTi5np1fHCSQ+0beA==
X-Google-Smtp-Source: AGHT+IGXPjNBSO3LeLRdTU/J0WCodruRNnBcnx9KyvKHRlBNLyysXxdMvyc+ZcZRv6FpAgOfc5/pVw==
X-Received: by 2002:a05:6a00:1301:b0:6e6:2dfd:602d with SMTP id j1-20020a056a00130100b006e62dfd602dmr15455121pfu.25.1709891180143;
        Fri, 08 Mar 2024 01:46:20 -0800 (PST)
Received: from thinkpad ([117.217.183.232])
        by smtp.gmail.com with ESMTPSA id x7-20020a056a00188700b006e64fdc6e69sm717499pfh.147.2024.03.08.01.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 01:46:19 -0800 (PST)
Date: Fri, 8 Mar 2024 15:16:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v9 08/10] PCI: dwc: ep: Add a generic
 dw_pcie_ep_linkdown() API to handle LINK_DOWN event
Message-ID: <20240308094606.GG3789@thinkpad>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-8-29d433d99cda@linaro.org>
 <Zeo0996FscpDSnjL@ryzen>
 <20240308054152.GD3789@thinkpad>
 <ZerSwdxAnN2mUxf0@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZerSwdxAnN2mUxf0@ryzen>
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

On Fri, Mar 08, 2024 at 09:56:33AM +0100, Niklas Cassel wrote:
> On Fri, Mar 08, 2024 at 11:11:52AM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Mar 07, 2024 at 10:43:19PM +0100, Niklas Cassel wrote:
> > > On Mon, Mar 04, 2024 at 02:52:20PM +0530, Manivannan Sadhasivam wrote:
> > > > The PCIe link can go to LINK_DOWN state in one of the following scenarios:
> > > > 
> > > > 1. Fundamental (PERST#)/hot/warm reset
> > > > 2. Link transition from L2/L3 to L0
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
> > > 
> > > If you look at PCI_REBAR_CAP, you will see that it is sticky,
> > > but you have to actually read the databook to see that:
> > > 
> > > "The RESBAR_CTRL_REG_BAR_SIZE field is automatically updated
> > > when you write to RESBAR_CAP_REG_0_REG through the DBI."
> > > 
> > > So the reason why we need to write this register, even though
> > > it is sticky, is to update the RESBAR_CTRL_REG_BAR_SIZE register,
> > > which is not sticky :)
> > > 
> > > (Perhaps we should add that as a comment?)
> > > 
> > 
> > Yeah, makes sense.
> 
> Note that I add a (unrelated) comment related to REBAR_CAP in this patch:
> https://lore.kernel.org/linux-pci/20240307111520.3303774-1-cassel@kernel.org/T/#u
> 
> But once we move/add code to dw_pcie_ep_init_non_sticky_registers(), I think
> that it might be a good "rule" to have a small comment for each write in
> dw_pcie_ep_init_non_sticky_registers() which explains why the code should be
> in dw_pcie_ep_init_non_sticky_registers() instead of dw_pcie_ep_init_registers(),
> even if it just a small:
> 
> /* Field PCI_XXX_YYY.ZZZ is non-sticky */
> writel_dbi(pci, offset + PCI_XXX_YYY, 0);
> 

Why? The function name itself suggests that we are reinitializing non-sticky
registers. So a comment for each write is overkill.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
