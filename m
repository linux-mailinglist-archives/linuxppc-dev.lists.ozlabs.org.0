Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9263A7E9A5C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 11:35:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V0AWk5qb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STQn333kzz3cbB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 21:35:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V0AWk5qb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STQm86ZQdz3cNT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 21:34:47 +1100 (AEDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c504a5e1deso58447181fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 02:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699871683; x=1700476483; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W8fr/etXthyoBBr7x9PlLJIdae8wlo624Fg8eK+QwQI=;
        b=V0AWk5qbRR9rUrO6DSWfxB5YPpacoF6oRTaV+40nwQcQqWeJe3VUhGGl6ijdUpnPfm
         gM5W3UTm1t4gij8Ue262iTSgz+c3AHXqC7zSIq7r0pN1MjwajhN7LTg6tFIWmm7vq5tZ
         inzbIDRrUX3GtYicivL5ituuVBmlzfiH2j5yztEdGPtqsjUjKTkxG6iIJZn8h5syEUK3
         s+bW//6wHZib+V3EkNVBYbML5kIe12DVPHfcByvDIjbDqKKw4FbttI5d6DxeAsFGqX0V
         xtFI1QdTkGhaEQhy5t8iVYmyWyIuO3noOU/ixxyNuAjLm2CtL5ewvPyDJJTjwHFqrOwh
         6N3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699871683; x=1700476483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8fr/etXthyoBBr7x9PlLJIdae8wlo624Fg8eK+QwQI=;
        b=NuLArWMpeHmJOoBUvAvkl5cyOCWzyJEqAp1cUBfvxDjgWRIVPEzgyYk2STaBA0OWek
         hMRL5o06+hTXzPtOH8Pu/Dh3oQbLaf+8ysoEySIP6dqnuYhtq3f+u4qUOeaRsCQ4rU9b
         BRtb8loFnokvq8+e58wM0T64xTuhYGHqdLeOA04dVwYhjQiUO7/A2AHYarbO3IGJ1gCW
         ww0RAyqX2sDbG0WSb10kdHSZEoTNdUf8wfsYrSPRMSpA3U3RKjTZlxjAvIH6pl2Fodlb
         8qKS3Op0JiTNeyz6LDuqXKDM5BsucnG5ThAg4FQKRFw/t1v835pfmw7l3xU3S5Zy6CxV
         qLTw==
X-Gm-Message-State: AOJu0YzQYO5gGiKZUXVDF2gIwN9QaQXHcpk2FMso7ySMDiG563d/8uCv
	mQBkjVu1Vj/TJaEnAplGfXQ=
X-Google-Smtp-Source: AGHT+IF9Abl2GVkQa7AiqNVi9FuPFCCvA7GvKvkG/t14gyAZj1I3fRjMYxmfrFDqvrP9xb+5Vsu2gw==
X-Received: by 2002:a05:651c:310:b0:2c0:20e3:990f with SMTP id a16-20020a05651c031000b002c020e3990fmr3728099ljp.10.1699871682723;
        Mon, 13 Nov 2023 02:34:42 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id b23-20020a2e9897000000b002b9f03729e2sm935533ljj.36.2023.11.13.02.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 02:34:42 -0800 (PST)
Date: Mon, 13 Nov 2023 13:34:39 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 2/3] PCI: dwc: Rename to .get_dbi_offset in struct
 dw_pcie_ep_ops
Message-ID: <hlhjm7vhh3pmhvxfwprjnjfd3sdmyfdknv4iv4zhgppuyzktoj@jwaeyxxweyuo>
References: <20231113013300.2132152-1-yoshihiro.shimoda.uh@renesas.com>
 <20231113013300.2132152-3-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113013300.2132152-3-yoshihiro.shimoda.uh@renesas.com>
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
Cc: kw@linux.com, robh@kernel.org, gustavo.pimentel@synopsys.com, lpieralisi@kernel.org, mani@kernel.org, linux-pci@vger.kernel.org, roy.zang@nxp.com, linux-renesas-soc@vger.kernel.org, minghuan.Lian@nxp.com, jingoohan1@gmail.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, mingkai.hu@nxp.com, marek.vasut+renesas@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 13, 2023 at 10:32:59AM +0900, Yoshihiro Shimoda wrote:
> Since meaning of .func_conf_select is difficult to understand,
> rename it to .get_dbi_offset.

This change looks good. Thanks.
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

There are redundant initializers will have been left after this patch
is applied, but it will be naturally fixed in the next patch.

-Serge(y)

> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../pci/controller/dwc/pci-layerscape-ep.c    |   5 +-
>  .../pci/controller/dwc/pcie-designware-ep.c   | 108 +++++++++---------
>  drivers/pci/controller/dwc/pcie-designware.h  |   2 +-
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c   |   4 +-
>  4 files changed, 59 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index 4e4b687ef508..961ff1b719a1 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -184,8 +184,7 @@ static int ls_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	}
>  }
>  
> -static unsigned int ls_pcie_ep_func_conf_select(struct dw_pcie_ep *ep,
> -						u8 func_no)
> +static unsigned int ls_pcie_ep_get_dbi_offset(struct dw_pcie_ep *ep, u8 func_no)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
> @@ -198,7 +197,7 @@ static const struct dw_pcie_ep_ops ls_pcie_ep_ops = {
>  	.init = ls_pcie_ep_init,
>  	.raise_irq = ls_pcie_ep_raise_irq,
>  	.get_features = ls_pcie_ep_get_features,
> -	.func_conf_select = ls_pcie_ep_func_conf_select,
> +	.get_dbi_offset = ls_pcie_ep_get_dbi_offset,
>  };
>  
>  static const struct ls_pcie_ep_drvdata ls1_ep_drvdata = {
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index ea99a97ce504..1100671db887 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -43,14 +43,14 @@ dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no)
>  	return NULL;
>  }
>  
> -static unsigned int dw_pcie_ep_func_select(struct dw_pcie_ep *ep, u8 func_no)
> +static unsigned int dw_pcie_ep_get_dbi_offset(struct dw_pcie_ep *ep, u8 func_no)
>  {
> -	unsigned int func_offset = 0;
> +	unsigned int dbi_offset = 0;
>  
> -	if (ep->ops->func_conf_select)
> -		func_offset = ep->ops->func_conf_select(ep, func_no);
> +	if (ep->ops->get_dbi_offset)
> +		dbi_offset = ep->ops->get_dbi_offset(ep, func_no);
>  
> -	return func_offset;
> +	return dbi_offset;
>  }
>  
>  static unsigned int dw_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep, u8 func_no)
> @@ -59,8 +59,8 @@ static unsigned int dw_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep, u8 func_no
>  
>  	if (ep->ops->get_dbi2_offset)
>  		dbi2_offset = ep->ops->get_dbi2_offset(ep, func_no);
> -	else if (ep->ops->func_conf_select)     /* for backward compatibility */
> -		dbi2_offset = ep->ops->func_conf_select(ep, func_no);
> +	else if (ep->ops->get_dbi_offset)     /* for backward compatibility */
> +		dbi2_offset = ep->ops->get_dbi_offset(ep, func_no);
>  
>  	return dbi2_offset;
>  }
> @@ -68,14 +68,14 @@ static unsigned int dw_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep, u8 func_no
>  static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, u8 func_no,
>  				   enum pci_barno bar, int flags)
>  {
> -	unsigned int func_offset, dbi2_offset;
> +	unsigned int dbi_offset, dbi2_offset;
>  	struct dw_pcie_ep *ep = &pci->ep;
>  	u32 reg, reg_dbi2;
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  	dbi2_offset = dw_pcie_ep_get_dbi2_offset(ep, func_no);
>  
> -	reg = func_offset + PCI_BASE_ADDRESS_0 + (4 * bar);
> +	reg = dbi_offset + PCI_BASE_ADDRESS_0 + (4 * bar);
>  	reg_dbi2 = dbi2_offset + PCI_BASE_ADDRESS_0 + (4 * bar);
>  	dw_pcie_dbi_ro_wr_en(pci);
>  	dw_pcie_writel_dbi2(pci, reg_dbi2, 0x0);
> @@ -102,16 +102,16 @@ static u8 __dw_pcie_ep_find_next_cap(struct dw_pcie_ep *ep, u8 func_no,
>  		u8 cap_ptr, u8 cap)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	unsigned int func_offset = 0;
> +	unsigned int dbi_offset = 0;
>  	u8 cap_id, next_cap_ptr;
>  	u16 reg;
>  
>  	if (!cap_ptr)
>  		return 0;
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  
> -	reg = dw_pcie_readw_dbi(pci, func_offset + cap_ptr);
> +	reg = dw_pcie_readw_dbi(pci, dbi_offset + cap_ptr);
>  	cap_id = (reg & 0x00ff);
>  
>  	if (cap_id > PCI_CAP_ID_MAX)
> @@ -127,13 +127,13 @@ static u8 __dw_pcie_ep_find_next_cap(struct dw_pcie_ep *ep, u8 func_no,
>  static u8 dw_pcie_ep_find_capability(struct dw_pcie_ep *ep, u8 func_no, u8 cap)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	unsigned int func_offset = 0;
> +	unsigned int dbi_offset = 0;
>  	u8 next_cap_ptr;
>  	u16 reg;
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  
> -	reg = dw_pcie_readw_dbi(pci, func_offset + PCI_CAPABILITY_LIST);
> +	reg = dw_pcie_readw_dbi(pci, dbi_offset + PCI_CAPABILITY_LIST);
>  	next_cap_ptr = (reg & 0x00ff);
>  
>  	return __dw_pcie_ep_find_next_cap(ep, func_no, next_cap_ptr, cap);
> @@ -144,23 +144,23 @@ static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	unsigned int func_offset = 0;
> +	unsigned int dbi_offset = 0;
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  
>  	dw_pcie_dbi_ro_wr_en(pci);
> -	dw_pcie_writew_dbi(pci, func_offset + PCI_VENDOR_ID, hdr->vendorid);
> -	dw_pcie_writew_dbi(pci, func_offset + PCI_DEVICE_ID, hdr->deviceid);
> -	dw_pcie_writeb_dbi(pci, func_offset + PCI_REVISION_ID, hdr->revid);
> -	dw_pcie_writeb_dbi(pci, func_offset + PCI_CLASS_PROG, hdr->progif_code);
> -	dw_pcie_writew_dbi(pci, func_offset + PCI_CLASS_DEVICE,
> +	dw_pcie_writew_dbi(pci, dbi_offset + PCI_VENDOR_ID, hdr->vendorid);
> +	dw_pcie_writew_dbi(pci, dbi_offset + PCI_DEVICE_ID, hdr->deviceid);
> +	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_REVISION_ID, hdr->revid);
> +	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_CLASS_PROG, hdr->progif_code);
> +	dw_pcie_writew_dbi(pci, dbi_offset + PCI_CLASS_DEVICE,
>  			   hdr->subclass_code | hdr->baseclass_code << 8);
> -	dw_pcie_writeb_dbi(pci, func_offset + PCI_CACHE_LINE_SIZE,
> +	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_CACHE_LINE_SIZE,
>  			   hdr->cache_line_size);
> -	dw_pcie_writew_dbi(pci, func_offset + PCI_SUBSYSTEM_VENDOR_ID,
> +	dw_pcie_writew_dbi(pci, dbi_offset + PCI_SUBSYSTEM_VENDOR_ID,
>  			   hdr->subsys_vendor_id);
> -	dw_pcie_writew_dbi(pci, func_offset + PCI_SUBSYSTEM_ID, hdr->subsys_id);
> -	dw_pcie_writeb_dbi(pci, func_offset + PCI_INTERRUPT_PIN,
> +	dw_pcie_writew_dbi(pci, dbi_offset + PCI_SUBSYSTEM_ID, hdr->subsys_id);
> +	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_INTERRUPT_PIN,
>  			   hdr->interrupt_pin);
>  	dw_pcie_dbi_ro_wr_dis(pci);
>  
> @@ -243,17 +243,17 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	unsigned int func_offset, dbi2_offset;
> +	unsigned int dbi_offset, dbi2_offset;
>  	enum pci_barno bar = epf_bar->barno;
>  	size_t size = epf_bar->size;
>  	int flags = epf_bar->flags;
>  	u32 reg, reg_dbi2;
>  	int ret, type;
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  	dbi2_offset = dw_pcie_ep_get_dbi2_offset(ep, func_no);
>  
> -	reg = PCI_BASE_ADDRESS_0 + (4 * bar) + func_offset;
> +	reg = PCI_BASE_ADDRESS_0 + (4 * bar) + dbi_offset;
>  	reg_dbi2 = PCI_BASE_ADDRESS_0 + (4 * bar) + dbi2_offset;
>  
>  	if (!(flags & PCI_BASE_ADDRESS_SPACE))
> @@ -337,16 +337,16 @@ static int dw_pcie_ep_get_msi(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> -	unsigned int func_offset = 0;
> +	unsigned int dbi_offset = 0;
>  	struct dw_pcie_ep_func *ep_func;
>  
>  	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
>  	if (!ep_func || !ep_func->msi_cap)
>  		return -EINVAL;
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  
> -	reg = ep_func->msi_cap + func_offset + PCI_MSI_FLAGS;
> +	reg = ep_func->msi_cap + dbi_offset + PCI_MSI_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	if (!(val & PCI_MSI_FLAGS_ENABLE))
>  		return -EINVAL;
> @@ -362,16 +362,16 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> -	unsigned int func_offset = 0;
> +	unsigned int dbi_offset = 0;
>  	struct dw_pcie_ep_func *ep_func;
>  
>  	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
>  	if (!ep_func || !ep_func->msi_cap)
>  		return -EINVAL;
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  
> -	reg = ep_func->msi_cap + func_offset + PCI_MSI_FLAGS;
> +	reg = ep_func->msi_cap + dbi_offset + PCI_MSI_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	val &= ~PCI_MSI_FLAGS_QMASK;
>  	val |= FIELD_PREP(PCI_MSI_FLAGS_QMASK, interrupts);
> @@ -387,16 +387,16 @@ static int dw_pcie_ep_get_msix(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> -	unsigned int func_offset = 0;
> +	unsigned int dbi_offset = 0;
>  	struct dw_pcie_ep_func *ep_func;
>  
>  	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
>  	if (!ep_func || !ep_func->msix_cap)
>  		return -EINVAL;
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  
> -	reg = ep_func->msix_cap + func_offset + PCI_MSIX_FLAGS;
> +	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	if (!(val & PCI_MSIX_FLAGS_ENABLE))
>  		return -EINVAL;
> @@ -412,7 +412,7 @@ static int dw_pcie_ep_set_msix(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> -	unsigned int func_offset = 0;
> +	unsigned int dbi_offset = 0;
>  	struct dw_pcie_ep_func *ep_func;
>  
>  	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
> @@ -421,19 +421,19 @@ static int dw_pcie_ep_set_msix(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  
>  	dw_pcie_dbi_ro_wr_en(pci);
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  
> -	reg = ep_func->msix_cap + func_offset + PCI_MSIX_FLAGS;
> +	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	val &= ~PCI_MSIX_FLAGS_QSIZE;
>  	val |= interrupts;
>  	dw_pcie_writew_dbi(pci, reg, val);
>  
> -	reg = ep_func->msix_cap + func_offset + PCI_MSIX_TABLE;
> +	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_TABLE;
>  	val = offset | bir;
>  	dw_pcie_writel_dbi(pci, reg, val);
>  
> -	reg = ep_func->msix_cap + func_offset + PCI_MSIX_PBA;
> +	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_PBA;
>  	val = (offset + (interrupts * PCI_MSIX_ENTRY_SIZE)) | bir;
>  	dw_pcie_writel_dbi(pci, reg, val);
>  
> @@ -514,7 +514,7 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	struct dw_pcie_ep_func *ep_func;
>  	struct pci_epc *epc = ep->epc;
>  	unsigned int aligned_offset;
> -	unsigned int func_offset = 0;
> +	unsigned int dbi_offset = 0;
>  	u16 msg_ctrl, msg_data;
>  	u32 msg_addr_lower, msg_addr_upper, reg;
>  	u64 msg_addr;
> @@ -525,22 +525,22 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	if (!ep_func || !ep_func->msi_cap)
>  		return -EINVAL;
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  
>  	/* Raise MSI per the PCI Local Bus Specification Revision 3.0, 6.8.1. */
> -	reg = ep_func->msi_cap + func_offset + PCI_MSI_FLAGS;
> +	reg = ep_func->msi_cap + dbi_offset + PCI_MSI_FLAGS;
>  	msg_ctrl = dw_pcie_readw_dbi(pci, reg);
>  	has_upper = !!(msg_ctrl & PCI_MSI_FLAGS_64BIT);
> -	reg = ep_func->msi_cap + func_offset + PCI_MSI_ADDRESS_LO;
> +	reg = ep_func->msi_cap + dbi_offset + PCI_MSI_ADDRESS_LO;
>  	msg_addr_lower = dw_pcie_readl_dbi(pci, reg);
>  	if (has_upper) {
> -		reg = ep_func->msi_cap + func_offset + PCI_MSI_ADDRESS_HI;
> +		reg = ep_func->msi_cap + dbi_offset + PCI_MSI_ADDRESS_HI;
>  		msg_addr_upper = dw_pcie_readl_dbi(pci, reg);
> -		reg = ep_func->msi_cap + func_offset + PCI_MSI_DATA_64;
> +		reg = ep_func->msi_cap + dbi_offset + PCI_MSI_DATA_64;
>  		msg_data = dw_pcie_readw_dbi(pci, reg);
>  	} else {
>  		msg_addr_upper = 0;
> -		reg = ep_func->msi_cap + func_offset + PCI_MSI_DATA_32;
> +		reg = ep_func->msi_cap + dbi_offset + PCI_MSI_DATA_32;
>  		msg_data = dw_pcie_readw_dbi(pci, reg);
>  	}
>  	aligned_offset = msg_addr_lower & (epc->mem->window.page_size - 1);
> @@ -585,7 +585,7 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	struct dw_pcie_ep_func *ep_func;
>  	struct pci_epf_msix_tbl *msix_tbl;
>  	struct pci_epc *epc = ep->epc;
> -	unsigned int func_offset = 0;
> +	unsigned int dbi_offset = 0;
>  	u32 reg, msg_data, vec_ctrl;
>  	unsigned int aligned_offset;
>  	u32 tbl_offset;
> @@ -597,9 +597,9 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	if (!ep_func || !ep_func->msix_cap)
>  		return -EINVAL;
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  
> -	reg = ep_func->msix_cap + func_offset + PCI_MSIX_TABLE;
> +	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_TABLE;
>  	tbl_offset = dw_pcie_readl_dbi(pci, reg);
>  	bir = FIELD_GET(PCI_MSIX_TABLE_BIR, tbl_offset);
>  	tbl_offset &= PCI_MSIX_TABLE_OFFSET;
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index cad0e4c24e11..485ce52b2416 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -344,7 +344,7 @@ struct dw_pcie_ep_ops {
>  	 * return a 0, and implement code in callback function of platform
>  	 * driver.
>  	 */
> -	unsigned int (*func_conf_select)(struct dw_pcie_ep *ep, u8 func_no);
> +	unsigned int (*get_dbi_offset)(struct dw_pcie_ep *ep, u8 func_no);
>  	unsigned int (*get_dbi2_offset)(struct dw_pcie_ep *ep, u8 func_no);
>  };
>  
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index 2b7e0f213fb2..8ef03d249001 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -394,7 +394,7 @@ rcar_gen4_pcie_ep_get_features(struct dw_pcie_ep *ep)
>  	return &rcar_gen4_pcie_epc_features;
>  }
>  
> -static unsigned int rcar_gen4_pcie_ep_func_conf_select(struct dw_pcie_ep *ep,
> +static unsigned int rcar_gen4_pcie_ep_get_dbi_offset(struct dw_pcie_ep *ep,
>  						       u8 func_no)
>  {
>  	return func_no * RCAR_GEN4_PCIE_EP_FUNC_DBI_OFFSET;
> @@ -412,7 +412,7 @@ static const struct dw_pcie_ep_ops pcie_ep_ops = {
>  	.deinit = rcar_gen4_pcie_ep_deinit,
>  	.raise_irq = rcar_gen4_pcie_ep_raise_irq,
>  	.get_features = rcar_gen4_pcie_ep_get_features,
> -	.func_conf_select = rcar_gen4_pcie_ep_func_conf_select,
> +	.get_dbi_offset = rcar_gen4_pcie_ep_get_dbi_offset,
>  	.get_dbi2_offset = rcar_gen4_pcie_ep_get_dbi2_offset,
>  };
>  
> -- 
> 2.34.1
> 
