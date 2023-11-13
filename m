Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EC77E9C4D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 13:42:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YcMmFxn6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STTbM5xkqz3cj7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 23:42:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YcMmFxn6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STTZS5XbNz2ytV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 23:41:35 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-507a98517f3so5727351e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 04:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699879287; x=1700484087; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XZXd/iBWkw3YdGcYmDw62AyTdPK9GZ93ocmGvYDA1TQ=;
        b=YcMmFxn6lBDW6nkpF38qkP6uY7qVY+fD+U0xmrZu4fJx2GJ/KYSkR7JoUaN+OZj3Vk
         Dx0IydT8CPm0Z/JV0H2VzdCpgg5Gjys/m56wCBx0nql8qkRig2GwvmglKSAXhn2GVN51
         eJEWqY9AC8jyVtLX3erLpq0dvsC0J0mZU56FwJeIvPJyLczuubmaXXFur4dxXIYnn8zN
         qOEJu6F74/3JwYSEkPEVh9ZvlqBkaAppb5xS0Emz6nkQVV91qiKkwCG7JIERMFjmHcEw
         BUFL17qVt/E/Yos72dz4Yf2yn5zsZPoP4LY8Nz2CPEFpp5JmFucQtcFZt0ivvE46owMd
         2Bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699879287; x=1700484087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZXd/iBWkw3YdGcYmDw62AyTdPK9GZ93ocmGvYDA1TQ=;
        b=n1CdZZ+znAOmNz9r4k8upSiaLYmVa/lHSEkuZ9YIX3BvPZ8p2iadfgXtY2ez91wN5M
         4pU99tVbLhlodZxXP15Zmp4rTDMSsafGKqsVw81bviHAP95oifgBPzyOcY3SW+RKpnjB
         gJpGVD7uCVS4DX2XGl4tMdydvTN6kXsiU1gKW4yPobyTzWNdi2JWDQuChDpMLhQjuRyq
         AfuuVyfbL0D3T1tNgKsLctrnTVxuXr7c2tT7vI5uzsdUaeJPY2TEuw1mfQqyP0DPVpqh
         7Ub4UMWPq9e+1RfqNwBd7gDQ05mCEvgM2gE7Q0RJ5SFg4twOfAvQPsVPiCRjxgvmQck3
         4Pqw==
X-Gm-Message-State: AOJu0YzSI8gTwOSBg93bKiDJUKNSXTIG5yWXGLNblZg7ej8nSTzku5w1
	cy1H2+urrOy8zBJx8Ht8gLw=
X-Google-Smtp-Source: AGHT+IF+Zt+6zj8/okEJQa+g+Pgsd9RJmEqUBW+V3A8S8Y81s2eTfYgvqCnMsmTQA2VUW8cXkNVt8w==
X-Received: by 2002:ac2:454c:0:b0:507:b935:9f60 with SMTP id j12-20020ac2454c000000b00507b9359f60mr3652505lfm.57.1699879286920;
        Mon, 13 Nov 2023 04:41:26 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id g11-20020a0565123b8b00b00507a1df9224sm952640lfv.289.2023.11.13.04.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 04:41:26 -0800 (PST)
Date: Mon, 13 Nov 2023 15:41:23 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 3/3] PCI: dwc: Add dw_pcie_ep_{read,write}_dbi[2] helpers
Message-ID: <tna3a5tn7ikg5vvsqadxrife6cihahsa7i2c6qqfihafxcrwx6@lx4l2j2es2yq>
References: <20231113013300.2132152-1-yoshihiro.shimoda.uh@renesas.com>
 <20231113013300.2132152-4-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113013300.2132152-4-yoshihiro.shimoda.uh@renesas.com>
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

On Mon, Nov 13, 2023 at 10:33:00AM +0900, Yoshihiro Shimoda wrote:
> The current code calculated some dbi[2] registers' offset by calling
> dw_pcie_ep_get_dbi[2]_offset() in each function. To improve code
> readability, add dw_pcie_ep_{read,write}_dbi[2} and some data-width
> related helpers.

Thanks for submitting this cleanup patch. That's exactly what I meant
here
https://lore.kernel.org/linux-pci/j4g4ijnxd7qyacszlwyi3tdztkw2nmnjwyhdqf2l2yj3h2mvje@iqsrqiodqbhq/
and Mani later here
https://lore.kernel.org/linux-pci/20230728023444.GA4433@thinkpad/

Please note a few nitpicks below.

> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../pci/controller/dwc/pcie-designware-ep.c   | 230 ++++++++++--------
>  1 file changed, 129 insertions(+), 101 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 1100671db887..dcbed49c9613 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -65,24 +65,89 @@ static unsigned int dw_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep, u8 func_no
>  	return dbi2_offset;
>  }
>  
> +static u32 dw_pcie_ep_read_dbi(struct dw_pcie_ep *ep, u8 func_no, u32 reg,
> +			       size_t size)
> +{
> +	unsigned int offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +
> +	return dw_pcie_read_dbi(pci, offset + reg, size);
> +}
> +
> +static void dw_pcie_ep_write_dbi(struct dw_pcie_ep *ep, u8 func_no, u32 reg,
> +				 size_t size, u32 val)
> +{
> +	unsigned int offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +
> +	dw_pcie_write_dbi(pci, offset + reg, size, val);
> +}
> +
> +static void dw_pcie_ep_write_dbi2(struct dw_pcie_ep *ep, u8 func_no, u32 reg,
> +				  size_t size, u32 val)
> +{
> +	unsigned int offset = dw_pcie_ep_get_dbi2_offset(ep, func_no);
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +
> +	dw_pcie_write_dbi2(pci, offset + reg, size, val);
> +}
> +
> +static inline void dw_pcie_ep_writel_dbi(struct dw_pcie_ep *ep, u8 func_no,
> +					 u32 reg, u32 val)
> +{
> +	dw_pcie_ep_write_dbi(ep, func_no, reg, 0x4, val);
> +}
> +
> +static inline u32 dw_pcie_ep_readl_dbi(struct dw_pcie_ep *ep, u8 func_no,
> +				       u32 reg)
> +{
> +	return dw_pcie_ep_read_dbi(ep, func_no, reg, 0x4);
> +}
> +
> +static inline void dw_pcie_ep_writew_dbi(struct dw_pcie_ep *ep, u8 func_no,
> +					 u32 reg, u16 val)
> +{
> +	dw_pcie_ep_write_dbi(ep, func_no, reg, 0x2, val);
> +}
> +
> +static inline u16 dw_pcie_ep_readw_dbi(struct dw_pcie_ep *ep, u8 func_no,
> +				       u32 reg)
> +{
> +	return dw_pcie_ep_read_dbi(ep, func_no, reg, 0x2);
> +}
> +
> +static inline void dw_pcie_ep_writeb_dbi(struct dw_pcie_ep *ep, u8 func_no,
> +					 u32 reg, u8 val)
> +{
> +	dw_pcie_ep_write_dbi(ep, func_no, reg, 0x1, val);
> +}
> +
> +static inline u8 dw_pcie_ep_readb_dbi(struct dw_pcie_ep *ep, u8 func_no,
> +				      u32 reg)
> +{
> +	return dw_pcie_ep_read_dbi(ep, func_no, reg, 0x1);
> +}
> +
> +static inline void dw_pcie_ep_writel_dbi2(struct dw_pcie_ep *ep, u8 func_no,
> +					  u32 reg, u32 val)
> +{
> +	dw_pcie_ep_write_dbi2(ep, func_no, reg, 0x4, val);
> +}
> +

I am not sure whether the methods above are supposed to be defined
here instead of being moved to the "pcie-designware.h" header file
together with dw_pcie_ep_get_dbi2_offset() and
dw_pcie_ep_get_dbi_offset(). The later place seems more suitable
seeing the accessors are generic, look similar to the
dw_pcie_{write,read}_dbi{,2}() functions and might be useful in the
platform drivers. On the other hand no LLDDs would have used it
currently. So I'll leave this as a food for thoughts for the driver
and subsystem maintainers.

>  static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, u8 func_no,
>  				   enum pci_barno bar, int flags)
>  {
> -	unsigned int dbi_offset, dbi2_offset;
>  	struct dw_pcie_ep *ep = &pci->ep;
>  	u32 reg, reg_dbi2;
>  
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> -	dbi2_offset = dw_pcie_ep_get_dbi2_offset(ep, func_no);
> -
> -	reg = dbi_offset + PCI_BASE_ADDRESS_0 + (4 * bar);
> -	reg_dbi2 = dbi2_offset + PCI_BASE_ADDRESS_0 + (4 * bar);

> +	reg = PCI_BASE_ADDRESS_0 + (4 * bar);
> +	reg_dbi2 = PCI_BASE_ADDRESS_0 + (4 * bar);

Semantics of the both variables is identical, could you please drop
"reg_dbi2" and just use the "reg" variable instead here? You must have
just missed it because a similar change is done in the rest of the
places in this patch.

>  	dw_pcie_dbi_ro_wr_en(pci);
> -	dw_pcie_writel_dbi2(pci, reg_dbi2, 0x0);
> -	dw_pcie_writel_dbi(pci, reg, 0x0);
> +	dw_pcie_ep_writel_dbi2(ep, func_no, reg_dbi2, 0x0);
> +	dw_pcie_ep_writel_dbi(ep, func_no, reg, 0x0);
>  	if (flags & PCI_BASE_ADDRESS_MEM_TYPE_64) {
> -		dw_pcie_writel_dbi2(pci, reg_dbi2 + 4, 0x0);
> -		dw_pcie_writel_dbi(pci, reg + 4, 0x0);
> +		dw_pcie_ep_writel_dbi2(ep, func_no, reg_dbi2 + 4, 0x0);
> +		dw_pcie_ep_writel_dbi(ep, func_no, reg + 4, 0x0);
>  	}
>  	dw_pcie_dbi_ro_wr_dis(pci);
>  }
> @@ -99,19 +164,15 @@ void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_reset_bar);
>  
>  static u8 __dw_pcie_ep_find_next_cap(struct dw_pcie_ep *ep, u8 func_no,
> -		u8 cap_ptr, u8 cap)
> +				     u8 cap_ptr, u8 cap)
>  {
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	unsigned int dbi_offset = 0;
>  	u8 cap_id, next_cap_ptr;
>  	u16 reg;
>  
>  	if (!cap_ptr)
>  		return 0;
>  
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> -
> -	reg = dw_pcie_readw_dbi(pci, dbi_offset + cap_ptr);
> +	reg = dw_pcie_ep_readw_dbi(ep, func_no, cap_ptr);
>  	cap_id = (reg & 0x00ff);
>  
>  	if (cap_id > PCI_CAP_ID_MAX)
> @@ -126,14 +187,10 @@ static u8 __dw_pcie_ep_find_next_cap(struct dw_pcie_ep *ep, u8 func_no,
>  
>  static u8 dw_pcie_ep_find_capability(struct dw_pcie_ep *ep, u8 func_no, u8 cap)
>  {
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	unsigned int dbi_offset = 0;
>  	u8 next_cap_ptr;
>  	u16 reg;
>  
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> -
> -	reg = dw_pcie_readw_dbi(pci, dbi_offset + PCI_CAPABILITY_LIST);
> +	reg = dw_pcie_ep_readw_dbi(ep, func_no, PCI_CAPABILITY_LIST);
>  	next_cap_ptr = (reg & 0x00ff);
>  
>  	return __dw_pcie_ep_find_next_cap(ep, func_no, next_cap_ptr, cap);
> @@ -144,24 +201,21 @@ static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	unsigned int dbi_offset = 0;
> -
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  
>  	dw_pcie_dbi_ro_wr_en(pci);
> -	dw_pcie_writew_dbi(pci, dbi_offset + PCI_VENDOR_ID, hdr->vendorid);
> -	dw_pcie_writew_dbi(pci, dbi_offset + PCI_DEVICE_ID, hdr->deviceid);
> -	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_REVISION_ID, hdr->revid);
> -	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_CLASS_PROG, hdr->progif_code);
> -	dw_pcie_writew_dbi(pci, dbi_offset + PCI_CLASS_DEVICE,
> -			   hdr->subclass_code | hdr->baseclass_code << 8);
> -	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_CACHE_LINE_SIZE,
> -			   hdr->cache_line_size);
> -	dw_pcie_writew_dbi(pci, dbi_offset + PCI_SUBSYSTEM_VENDOR_ID,
> -			   hdr->subsys_vendor_id);
> -	dw_pcie_writew_dbi(pci, dbi_offset + PCI_SUBSYSTEM_ID, hdr->subsys_id);
> -	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_INTERRUPT_PIN,
> -			   hdr->interrupt_pin);
> +	dw_pcie_ep_writew_dbi(ep, func_no, PCI_VENDOR_ID, hdr->vendorid);
> +	dw_pcie_ep_writew_dbi(ep, func_no, PCI_DEVICE_ID, hdr->deviceid);
> +	dw_pcie_ep_writeb_dbi(ep, func_no, PCI_REVISION_ID, hdr->revid);
> +	dw_pcie_ep_writeb_dbi(ep, func_no, PCI_CLASS_PROG, hdr->progif_code);
> +	dw_pcie_ep_writew_dbi(ep, func_no, PCI_CLASS_DEVICE,
> +			      hdr->subclass_code | hdr->baseclass_code << 8);
> +	dw_pcie_ep_writeb_dbi(ep, func_no, PCI_CACHE_LINE_SIZE,
> +			      hdr->cache_line_size);
> +	dw_pcie_ep_writew_dbi(ep, func_no, PCI_SUBSYSTEM_VENDOR_ID,
> +			      hdr->subsys_vendor_id);
> +	dw_pcie_ep_writew_dbi(ep, func_no, PCI_SUBSYSTEM_ID, hdr->subsys_id);
> +	dw_pcie_ep_writeb_dbi(ep, func_no, PCI_INTERRUPT_PIN,
> +			      hdr->interrupt_pin);
>  	dw_pcie_dbi_ro_wr_dis(pci);
>  
>  	return 0;
> @@ -243,18 +297,13 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	unsigned int dbi_offset, dbi2_offset;
>  	enum pci_barno bar = epf_bar->barno;
>  	size_t size = epf_bar->size;
>  	int flags = epf_bar->flags;
> -	u32 reg, reg_dbi2;
>  	int ret, type;
> +	u32 reg;
>  
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> -	dbi2_offset = dw_pcie_ep_get_dbi2_offset(ep, func_no);
> -
> -	reg = PCI_BASE_ADDRESS_0 + (4 * bar) + dbi_offset;
> -	reg_dbi2 = PCI_BASE_ADDRESS_0 + (4 * bar) + dbi2_offset;
> +	reg = PCI_BASE_ADDRESS_0 + (4 * bar);
>  
>  	if (!(flags & PCI_BASE_ADDRESS_SPACE))
>  		type = PCIE_ATU_TYPE_MEM;
> @@ -270,12 +319,12 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  
>  	dw_pcie_dbi_ro_wr_en(pci);
>  
> -	dw_pcie_writel_dbi2(pci, reg_dbi2, lower_32_bits(size - 1));
> -	dw_pcie_writel_dbi(pci, reg, flags);
> +	dw_pcie_ep_writel_dbi2(ep, func_no, reg, lower_32_bits(size - 1));
> +	dw_pcie_ep_writel_dbi(ep, func_no, reg, flags);
>  
>  	if (flags & PCI_BASE_ADDRESS_MEM_TYPE_64) {
> -		dw_pcie_writel_dbi2(pci, reg_dbi2 + 4, upper_32_bits(size - 1));
> -		dw_pcie_writel_dbi(pci, reg + 4, 0);
> +		dw_pcie_ep_writel_dbi2(ep, func_no, reg + 4, upper_32_bits(size - 1));
> +		dw_pcie_ep_writel_dbi(ep, func_no, reg + 4, 0);
>  	}
>  
>  	ep->epf_bar[bar] = epf_bar;
> @@ -335,19 +384,15 @@ static int dw_pcie_ep_map_addr(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  static int dw_pcie_ep_get_msi(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	u32 val, reg;
> -	unsigned int dbi_offset = 0;
>  	struct dw_pcie_ep_func *ep_func;
> +	u32 val, reg;

Special kudos for preserving and adding the reversed xmas tree order
here and below. =)

-Serge(y)

>  
>  	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
>  	if (!ep_func || !ep_func->msi_cap)
>  		return -EINVAL;
>  
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> -
> -	reg = ep_func->msi_cap + dbi_offset + PCI_MSI_FLAGS;
> -	val = dw_pcie_readw_dbi(pci, reg);
> +	reg = ep_func->msi_cap + PCI_MSI_FLAGS;
> +	val = dw_pcie_ep_readw_dbi(ep, func_no, reg);
>  	if (!(val & PCI_MSI_FLAGS_ENABLE))
>  		return -EINVAL;
>  
> @@ -361,22 +406,19 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	u32 val, reg;
> -	unsigned int dbi_offset = 0;
>  	struct dw_pcie_ep_func *ep_func;
> +	u32 val, reg;
>  
>  	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
>  	if (!ep_func || !ep_func->msi_cap)
>  		return -EINVAL;
>  
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> -
> -	reg = ep_func->msi_cap + dbi_offset + PCI_MSI_FLAGS;
> -	val = dw_pcie_readw_dbi(pci, reg);
> +	reg = ep_func->msi_cap + PCI_MSI_FLAGS;
> +	val = dw_pcie_ep_readw_dbi(ep, func_no, reg);
>  	val &= ~PCI_MSI_FLAGS_QMASK;
>  	val |= FIELD_PREP(PCI_MSI_FLAGS_QMASK, interrupts);
>  	dw_pcie_dbi_ro_wr_en(pci);
> -	dw_pcie_writew_dbi(pci, reg, val);
> +	dw_pcie_ep_writew_dbi(ep, func_no, reg, val);
>  	dw_pcie_dbi_ro_wr_dis(pci);
>  
>  	return 0;
> @@ -385,19 +427,15 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  static int dw_pcie_ep_get_msix(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	u32 val, reg;
> -	unsigned int dbi_offset = 0;
>  	struct dw_pcie_ep_func *ep_func;
> +	u32 val, reg;
>  
>  	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
>  	if (!ep_func || !ep_func->msix_cap)
>  		return -EINVAL;
>  
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> -
> -	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_FLAGS;
> -	val = dw_pcie_readw_dbi(pci, reg);
> +	reg = ep_func->msix_cap + PCI_MSIX_FLAGS;
> +	val = dw_pcie_ep_readw_dbi(ep, func_no, reg);
>  	if (!(val & PCI_MSIX_FLAGS_ENABLE))
>  		return -EINVAL;
>  
> @@ -411,9 +449,8 @@ static int dw_pcie_ep_set_msix(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	u32 val, reg;
> -	unsigned int dbi_offset = 0;
>  	struct dw_pcie_ep_func *ep_func;
> +	u32 val, reg;
>  
>  	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
>  	if (!ep_func || !ep_func->msix_cap)
> @@ -421,21 +458,19 @@ static int dw_pcie_ep_set_msix(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  
>  	dw_pcie_dbi_ro_wr_en(pci);
>  
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> -
> -	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_FLAGS;
> -	val = dw_pcie_readw_dbi(pci, reg);
> +	reg = ep_func->msix_cap + PCI_MSIX_FLAGS;
> +	val = dw_pcie_ep_readw_dbi(ep, func_no, reg);
>  	val &= ~PCI_MSIX_FLAGS_QSIZE;
>  	val |= interrupts;
>  	dw_pcie_writew_dbi(pci, reg, val);
>  
> -	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_TABLE;
> +	reg = ep_func->msix_cap + PCI_MSIX_TABLE;
>  	val = offset | bir;
> -	dw_pcie_writel_dbi(pci, reg, val);
> +	dw_pcie_ep_writel_dbi(ep, func_no, reg, val);
>  
> -	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_PBA;
> +	reg = ep_func->msix_cap + PCI_MSIX_PBA;
>  	val = (offset + (interrupts * PCI_MSIX_ENTRY_SIZE)) | bir;
> -	dw_pcie_writel_dbi(pci, reg, val);
> +	dw_pcie_ep_writel_dbi(ep, func_no, reg, val);
>  
>  	dw_pcie_dbi_ro_wr_dis(pci);
>  
> @@ -510,38 +545,34 @@ EXPORT_SYMBOL_GPL(dw_pcie_ep_raise_legacy_irq);
>  int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  			     u8 interrupt_num)
>  {
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	u32 msg_addr_lower, msg_addr_upper, reg;
>  	struct dw_pcie_ep_func *ep_func;
>  	struct pci_epc *epc = ep->epc;
>  	unsigned int aligned_offset;
> -	unsigned int dbi_offset = 0;
>  	u16 msg_ctrl, msg_data;
> -	u32 msg_addr_lower, msg_addr_upper, reg;
> -	u64 msg_addr;
>  	bool has_upper;
> +	u64 msg_addr;
>  	int ret;
>  
>  	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
>  	if (!ep_func || !ep_func->msi_cap)
>  		return -EINVAL;
>  
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> -
>  	/* Raise MSI per the PCI Local Bus Specification Revision 3.0, 6.8.1. */
> -	reg = ep_func->msi_cap + dbi_offset + PCI_MSI_FLAGS;
> -	msg_ctrl = dw_pcie_readw_dbi(pci, reg);
> +	reg = ep_func->msi_cap + PCI_MSI_FLAGS;
> +	msg_ctrl = dw_pcie_ep_readw_dbi(ep, func_no, reg);
>  	has_upper = !!(msg_ctrl & PCI_MSI_FLAGS_64BIT);
> -	reg = ep_func->msi_cap + dbi_offset + PCI_MSI_ADDRESS_LO;
> -	msg_addr_lower = dw_pcie_readl_dbi(pci, reg);
> +	reg = ep_func->msi_cap + PCI_MSI_ADDRESS_LO;
> +	msg_addr_lower = dw_pcie_ep_readl_dbi(ep, func_no, reg);
>  	if (has_upper) {
> -		reg = ep_func->msi_cap + dbi_offset + PCI_MSI_ADDRESS_HI;
> -		msg_addr_upper = dw_pcie_readl_dbi(pci, reg);
> -		reg = ep_func->msi_cap + dbi_offset + PCI_MSI_DATA_64;
> -		msg_data = dw_pcie_readw_dbi(pci, reg);
> +		reg = ep_func->msi_cap + PCI_MSI_ADDRESS_HI;
> +		msg_addr_upper = dw_pcie_ep_readl_dbi(ep, func_no, reg);
> +		reg = ep_func->msi_cap + PCI_MSI_DATA_64;
> +		msg_data = dw_pcie_ep_readw_dbi(ep, func_no, reg);
>  	} else {
>  		msg_addr_upper = 0;
> -		reg = ep_func->msi_cap + dbi_offset + PCI_MSI_DATA_32;
> -		msg_data = dw_pcie_readw_dbi(pci, reg);
> +		reg = ep_func->msi_cap + PCI_MSI_DATA_32;
> +		msg_data = dw_pcie_ep_readw_dbi(ep, func_no, reg);
>  	}
>  	aligned_offset = msg_addr_lower & (epc->mem->window.page_size - 1);
>  	msg_addr = ((u64)msg_addr_upper) << 32 |
> @@ -582,10 +613,9 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  			      u16 interrupt_num)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	struct dw_pcie_ep_func *ep_func;
>  	struct pci_epf_msix_tbl *msix_tbl;
> +	struct dw_pcie_ep_func *ep_func;
>  	struct pci_epc *epc = ep->epc;
> -	unsigned int dbi_offset = 0;
>  	u32 reg, msg_data, vec_ctrl;
>  	unsigned int aligned_offset;
>  	u32 tbl_offset;
> @@ -597,10 +627,8 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	if (!ep_func || !ep_func->msix_cap)
>  		return -EINVAL;
>  
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> -
> -	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_TABLE;
> -	tbl_offset = dw_pcie_readl_dbi(pci, reg);
> +	reg = ep_func->msix_cap + PCI_MSIX_TABLE;
> +	tbl_offset = dw_pcie_ep_readl_dbi(ep, func_no, reg);
>  	bir = FIELD_GET(PCI_MSIX_TABLE_BIR, tbl_offset);
>  	tbl_offset &= PCI_MSIX_TABLE_OFFSET;
>  
> -- 
> 2.34.1
> 
