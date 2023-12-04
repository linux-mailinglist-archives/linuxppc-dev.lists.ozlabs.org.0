Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4667A803132
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 12:03:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YESINvI+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkLPQ5MZ4z2xYY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 22:03:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YESINvI+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::c2f; helo=mail-oo1-xc2f.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkLNY3lSWz2xYY
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Dec 2023 22:02:37 +1100 (AEDT)
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-58fc1fa4d06so571379eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Dec 2023 03:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701687755; x=1702292555; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ytEXR2qK/0VcK3kLR46RxJ0mZjpWsqvBT5XoKZfshlg=;
        b=YESINvI+9pd2Ed1zTQVfKIemGIfIo/srMfqVcVXw8uKHMgzKJgjiKoV56077ZJ+na9
         JSv4zIoeRRCvEJobAFIyr6Cq2ZKVtT3bRxv2q9jVCN+zU2JEB8mLi3ys8vkUwYY3KwiS
         MNh4gb6vrCsEse632eMR9a5DGyFHap5IwAoq1iiues6raYpV/UEqAUmOC12oj6mBGUI/
         yqD6HsRop271FpKyNo/an8r6XeEOy+Wr7K78y8b15l9Q6hGnEBO69t3q2iG2rjkMa+vD
         CObatjkXnduH1H5V9I3JnHpjxjS0UwW+BTI+n8iu78jrrrp8Ftw8XnHQm2JlPOb+WKMM
         4sOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701687755; x=1702292555;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytEXR2qK/0VcK3kLR46RxJ0mZjpWsqvBT5XoKZfshlg=;
        b=eGDOH/+mK7dPUt8vP8jSApKQXnDyOgeBycnsASj948M/wQ8exzM0OeHqH7mJychYbr
         DQcK3wvtdCfI4gel03uOEyJIHToEPVVi1lx4UQ3fvAOayde6dR+5uFD8OzLFlnAHf4o+
         w0l+VLXSpzSfG/tlNN1UrqLIGdyn6cLfuyHlpXIkfKrIaU1jfCL+hgBiJNCIWfgsyfHo
         2es6GBSDcg6OuSgvpfn4tPRIroO88+BL2U3bkOtlH7swHU6cTIK7c9p1Yv/AsxUWr4Eh
         trEjpl1lKGW8eFNDVWZlchRcVkYaq/z826dbAsfI+FNEtBv5b3R1ej1QXcGjCls1AZd9
         bjAg==
X-Gm-Message-State: AOJu0YwbTZrVhi20A5i97u7wEnsROGBUqED8oHA87iiOViw+vlCnTrz9
	2OUw55UeWBZmpaJzZ26Qu9iF
X-Google-Smtp-Source: AGHT+IE9Hrs5Bx4+uEPJIz+n1aZygMz0seYo1fq0qHEZlcgQ3Lsd7f4RDXxraFBiibGuRGVqDIaxmQ==
X-Received: by 2002:a05:6358:2904:b0:170:21b7:7321 with SMTP id y4-20020a056358290400b0017021b77321mr3297906rwb.20.1701687754654;
        Mon, 04 Dec 2023 03:02:34 -0800 (PST)
Received: from thinkpad ([117.213.101.240])
        by smtp.gmail.com with ESMTPSA id w2-20020a0c9c42000000b0067a4a0a7e6fsm962342qve.108.2023.12.04.03.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 03:02:34 -0800 (PST)
Date: Mon, 4 Dec 2023 16:32:24 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v5 3/4] PCI: layerscape(ep): Rename pf_* as pf_lut_*
Message-ID: <20231204110224.GC35383@thinkpad>
References: <20231201161712.1645987-1-Frank.Li@nxp.com>
 <20231201161712.1645987-4-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231201161712.1645987-4-Frank.Li@nxp.com>
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
Cc: imx@lists.linux.dev, kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 01, 2023 at 11:17:11AM -0500, Frank Li wrote:
> 'pf' and 'lut' is just difference name in difference chips, but basic it is
> a MMIO base address plus an offset.
> 
> Rename it to avoid duplicate pf_* and lut_* in driver.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

One comment below. With that addressed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> ---
> 
> Notes:
>     pf_lut is better than pf_* or lut* because some chip use 'pf', some chip
>     use 'lut'.
>     
>     Change from v4 to v5
>     - rename layerscape-ep code also
>     change from v1 to v4
>     - new patch at v3
> 
>  .../pci/controller/dwc/pci-layerscape-ep.c    | 16 ++++-----
>  drivers/pci/controller/dwc/pci-layerscape.c   | 36 +++++++++----------
>  2 files changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index 3d3c50ef4b6ff..2ca339f938a86 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -49,7 +49,7 @@ struct ls_pcie_ep {
>  	bool				big_endian;
>  };
>  
> -static u32 ls_lut_readl(struct ls_pcie_ep *pcie, u32 offset)
> +static u32 ls_pcie_pf_lut_readl(struct ls_pcie_ep *pcie, u32 offset)
>  {
>  	struct dw_pcie *pci = pcie->pci;
>  
> @@ -59,7 +59,7 @@ static u32 ls_lut_readl(struct ls_pcie_ep *pcie, u32 offset)
>  		return ioread32(pci->dbi_base + offset);
>  }
>  
> -static void ls_lut_writel(struct ls_pcie_ep *pcie, u32 offset, u32 value)
> +static void ls_pcie_pf_lut_writel(struct ls_pcie_ep *pcie, u32 offset, u32 value)
>  {
>  	struct dw_pcie *pci = pcie->pci;
>  
> @@ -76,8 +76,8 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
>  	u32 val, cfg;
>  	u8 offset;
>  
> -	val = ls_lut_readl(pcie, PEX_PF0_PME_MES_DR);
> -	ls_lut_writel(pcie, PEX_PF0_PME_MES_DR, val);
> +	val = ls_pcie_pf_lut_readl(pcie, PEX_PF0_PME_MES_DR);
> +	ls_pcie_pf_lut_writel(pcie, PEX_PF0_PME_MES_DR, val);
>  
>  	if (!val)
>  		return IRQ_NONE;
> @@ -96,9 +96,9 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
>  		dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, pcie->lnkcap);
>  		dw_pcie_dbi_ro_wr_dis(pci);
>  
> -		cfg = ls_lut_readl(pcie, PEX_PF0_CONFIG);
> +		cfg = ls_pcie_pf_lut_readl(pcie, PEX_PF0_CONFIG);
>  		cfg |= PEX_PF0_CFG_READY;
> -		ls_lut_writel(pcie, PEX_PF0_CONFIG, cfg);
> +		ls_pcie_pf_lut_writel(pcie, PEX_PF0_CONFIG, cfg);
>  		dw_pcie_ep_linkup(&pci->ep);
>  
>  		dev_dbg(pci->dev, "Link up\n");
> @@ -130,10 +130,10 @@ static int ls_pcie_ep_interrupt_init(struct ls_pcie_ep *pcie,
>  	}
>  
>  	/* Enable interrupts */
> -	val = ls_lut_readl(pcie, PEX_PF0_PME_MES_IER);
> +	val = ls_pcie_pf_lut_readl(pcie, PEX_PF0_PME_MES_IER);
>  	val |=  PEX_PF0_PME_MES_IER_LDDIE | PEX_PF0_PME_MES_IER_HRDIE |
>  		PEX_PF0_PME_MES_IER_LUDIE;
> -	ls_lut_writel(pcie, PEX_PF0_PME_MES_IER, val);
> +	ls_pcie_pf_lut_writel(pcie, PEX_PF0_PME_MES_IER, val);
>  
>  	return 0;
>  }
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index 8bdaae9be7d56..a9151e98fde6f 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -44,7 +44,7 @@
>  #define PCIE_IATU_NUM		6
>  
>  struct ls_pcie_drvdata {
> -	const u32 pf_off;
> +	const u32 pf_lut_off;
>  	const struct dw_pcie_host_ops *ops;
>  	int (*exit_from_l2)(struct dw_pcie_rp *pp);
>  	bool scfg_support;
> @@ -54,13 +54,13 @@ struct ls_pcie_drvdata {
>  struct ls_pcie {
>  	struct dw_pcie *pci;
>  	const struct ls_pcie_drvdata *drvdata;
> -	void __iomem *pf_base;
> +	void __iomem *pf_lut_base;
>  	struct regmap *scfg;
>  	int index;
>  	bool big_endian;
>  };
>  
> -#define ls_pcie_pf_readl_addr(addr)	ls_pcie_pf_readl(pcie, addr)
> +#define ls_pcie_pf_lut_readl_addr(addr)	ls_pcie_pf_lut_readl(pcie, addr)
>  #define to_ls_pcie(x)	dev_get_drvdata((x)->dev)
>  
>  static bool ls_pcie_is_bridge(struct ls_pcie *pcie)
> @@ -101,20 +101,20 @@ static void ls_pcie_fix_error_response(struct ls_pcie *pcie)
>  	iowrite32(PCIE_ABSERR_SETTING, pci->dbi_base + PCIE_ABSERR);
>  }
>  
> -static u32 ls_pcie_pf_readl(struct ls_pcie *pcie, u32 off)
> +static u32 ls_pcie_pf_lut_readl(struct ls_pcie *pcie, u32 off)
>  {
>  	if (pcie->big_endian)
> -		return ioread32be(pcie->pf_base + off);
> +		return ioread32be(pcie->pf_lut_base + off);
>  
> -	return ioread32(pcie->pf_base + off);
> +	return ioread32(pcie->pf_lut_base + off);
>  }
>  
> -static void ls_pcie_pf_writel(struct ls_pcie *pcie, u32 off, u32 val)
> +static void ls_pcie_pf_lut_writel(struct ls_pcie *pcie, u32 off, u32 val)
>  {
>  	if (pcie->big_endian)
> -		iowrite32be(val, pcie->pf_base + off);
> +		iowrite32be(val, pcie->pf_lut_base + off);
>  	else
> -		iowrite32(val, pcie->pf_base + off);
> +		iowrite32(val, pcie->pf_lut_base + off);
>  }
>  
>  static void ls_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> @@ -124,11 +124,11 @@ static void ls_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
>  	u32 val;
>  	int ret;
>  
> -	val = ls_pcie_pf_readl(pcie, LS_PCIE_PF_MCR);
> +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_PF_MCR);
>  	val |= PF_MCR_PTOMR;
> -	ls_pcie_pf_writel(pcie, LS_PCIE_PF_MCR, val);
> +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_PF_MCR, val);
>  
> -	ret = readx_poll_timeout(ls_pcie_pf_readl_addr, LS_PCIE_PF_MCR,
> +	ret = readx_poll_timeout(ls_pcie_pf_lut_readl_addr, LS_PCIE_PF_MCR,
>  				 val, !(val & PF_MCR_PTOMR),
>  				 PCIE_PME_TO_L2_TIMEOUT_US/10,
>  				 PCIE_PME_TO_L2_TIMEOUT_US);
> @@ -147,15 +147,15 @@ static int ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
>  	 * Set PF_MCR_EXL2S bit in LS_PCIE_PF_MCR register for the link
>  	 * to exit L2 state.
>  	 */
> -	val = ls_pcie_pf_readl(pcie, LS_PCIE_PF_MCR);
> +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_PF_MCR);
>  	val |= PF_MCR_EXL2S;
> -	ls_pcie_pf_writel(pcie, LS_PCIE_PF_MCR, val);
> +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_PF_MCR, val);
>  
>  	/*
>  	 * L2 exit timeout of 10ms is not defined in the specifications,
>  	 * it was chosen based on empirical observations.
>  	 */
> -	ret = readx_poll_timeout(ls_pcie_pf_readl_addr, LS_PCIE_PF_MCR,
> +	ret = readx_poll_timeout(ls_pcie_pf_lut_readl_addr, LS_PCIE_PF_MCR,
>  				 val, !(val & PF_MCR_EXL2S),
>  				 1000,
>  				 10000);
> @@ -242,9 +242,9 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
>  };
>  
>  static const struct ls_pcie_drvdata layerscape_drvdata = {
> -	.pf_off = 0xc0000,
> +	.pf_lut_off = 0xc0000,
>  	.pm_support = true,
> -	.ops = &ls_pcie_host_ops;
> +	.ops = &ls_pcie_host_ops,

This change should be part of the previous patch.

- Mani

>  	.exit_from_l2 = ls_pcie_exit_from_l2,
>  };
>  
> @@ -293,7 +293,7 @@ static int ls_pcie_probe(struct platform_device *pdev)
>  
>  	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
>  
> -	pcie->pf_base = pci->dbi_base + pcie->drvdata->pf_off;
> +	pcie->pf_lut_base = pci->dbi_base + pcie->drvdata->pf_lut_off;
>  
>  	if (pcie->drvdata->scfg_support) {
>  		pcie->scfg = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,pcie-scfg");
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
