Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EF27DF8C8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 18:34:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m5sROcgz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLrbC2s5Sz3d8T
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 04:34:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m5sROcgz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLrZL2lq1z3bdm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 04:33:27 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-778711ee748so72564885a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Nov 2023 10:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698946404; x=1699551204; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QMUtaNcyMJONDb+NRTDB5A2cdiVh8ep8ZeoczkWG0cY=;
        b=m5sROcgzO7npk1HAJw2s7i/EiZTDdQcNvlPhhOq8EZ2+dj0su3MH4pVVHnahrDHrZX
         1wNIGXBiLjH1yawUwc9mzQdmvJLqSsb3zSIO7HswLltF/zEbZGwKkhIYHZ8XKwoi7sRg
         PWnlD4gJtGk8j806EchsSNCEuzyn8Z3iMKkfby61mdWVY7jM2wVCk5FpM7aIpok1NR21
         SM4Xiym2sfygqFgIF8NtgkoD/dMKfPoAtQb7nRUiN/U0nM0jOP9HiEKdgpuQXVddaaNB
         sDimlt3YHzcP7UKOUg2V/Mi/n6wD+/vsKBuhNGERuoYw/KlLKaFd1fSk/PEM9e/LT8xb
         sf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698946404; x=1699551204;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QMUtaNcyMJONDb+NRTDB5A2cdiVh8ep8ZeoczkWG0cY=;
        b=p8PNPMzpO8w7Y4LxCpp9oQ5hquEaZ6Sm/4VN1pJG5bpH8UFZ26zTkIXh3FNCx/87Wq
         RK0GDzoslbfykJ5pgnBSMC1t0GaD4+jv0vQqfh4SKnkTjFTuJBhdGjpVI2bxnuZnYCjN
         VKIRTS3uL1G1lbXrTmuXaUQDzjI86rExnXeLNZd3K80hDkCGSOhdYB+KlMdl/cJk0Bg2
         RyFB6cFm6GkNbaIWYfM8vFFYhTio6/deQD+IF3sx1N9NPndra3ZnVc+qI3vI/YwXCwHL
         qN52SN7NEluExNtn8tw20ik8e9PJuUNNRpMDpJhUigiLbvPB6CKGe+GIohLYqtL0Pbwf
         imEQ==
X-Gm-Message-State: AOJu0YwhlYtt/GMIRWV4vZRDPQhtsCGpArAdLCjCUsWZVz7tzCenrxuD
	r7zyUNf13dpurguykcl4DFOz
X-Google-Smtp-Source: AGHT+IHX7EI2x7veOgf/GXDdZbsRu/5EohayNZh0ZiyAzJQnH+S4mjA6yTOVfB6lGTAOudjhbyAuRQ==
X-Received: by 2002:a05:6214:529c:b0:66d:2af4:c423 with SMTP id kj28-20020a056214529c00b0066d2af4c423mr21097024qvb.2.1698946404249;
        Thu, 02 Nov 2023 10:33:24 -0700 (PDT)
Received: from thinkpad ([117.217.189.228])
        by smtp.gmail.com with ESMTPSA id p15-20020a0cc3cf000000b00670e7ae4964sm125621qvi.91.2023.11.02.10.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 10:33:23 -0700 (PDT)
Date: Thu, 2 Nov 2023 23:03:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 3/4] PCI: layerscape: Rename pf_* as pf_lut_*
Message-ID: <20231102173314.GE20943@thinkpad>
References: <20231017193145.3198380-1-Frank.Li@nxp.com>
 <20231017193145.3198380-4-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231017193145.3198380-4-Frank.Li@nxp.com>
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

On Tue, Oct 17, 2023 at 03:31:44PM -0400, Frank Li wrote:
> 'pf' and 'lut' is just difference name in difference chips, but basic it is
> a MMIO base address plus an offset.
> 
> Rename it to avoid duplicate pf_* and lut_* in driver.
> 

"pci-layerscape-ep.c" uses "ls_lut_" prefix and now you are using "pf_lut_". May
I know the difference between these two? Can we just use a common name?

- Mani

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     change from v1 to v3
>     - new patch at v3
> 
>  drivers/pci/controller/dwc/pci-layerscape.c | 34 ++++++++++-----------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index 6f47cfe146c44..4b663b20d8612 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -46,7 +46,7 @@
>  #define LS_PCIE_DRV_SCFG	BIT(0)
>  
>  struct ls_pcie_drvdata {
> -	const u32 pf_off;
> +	const u32 pf_lut_off;
>  	const struct dw_pcie_host_ops *ops;
>  	int (*exit_from_l2)(struct dw_pcie_rp *pp);
>  	int flags;
> @@ -56,13 +56,13 @@ struct ls_pcie_drvdata {
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
> @@ -103,20 +103,20 @@ static void ls_pcie_fix_error_response(struct ls_pcie *pcie)
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
> @@ -126,11 +126,11 @@ static void ls_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
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
> @@ -149,15 +149,15 @@ static int ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
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
> @@ -245,7 +245,7 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
>  };
>  
>  static const struct ls_pcie_drvdata layerscape_drvdata = {
> -	.pf_off = 0xc0000,
> +	.pf_lut_off = 0xc0000,
>  	.pm_support = true,
>  	.exit_from_l2 = ls_pcie_exit_from_l2,
>  };
> @@ -295,7 +295,7 @@ static int ls_pcie_probe(struct platform_device *pdev)
>  
>  	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
>  
> -	pcie->pf_base = pci->dbi_base + pcie->drvdata->pf_off;
> +	pcie->pf_lut_base = pci->dbi_base + pcie->drvdata->pf_lut_off;
>  
>  	if (pcie->drvdata->flags & LS_PCIE_DRV_SCFG) {
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
