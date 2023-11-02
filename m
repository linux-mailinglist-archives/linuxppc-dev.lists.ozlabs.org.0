Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E00D67DF8B9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 18:29:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lWQbOXDE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLrTL5nHHz3cmV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 04:29:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lWQbOXDE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLrST2Stqz3cRH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 04:28:22 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d84c24a810dso1210035276.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Nov 2023 10:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698946099; x=1699550899; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tNkygFU/hw8zUOPQ7Nync2PfCNdVcXfa85CS1trX39M=;
        b=lWQbOXDEh3OOxIStDPtaFF2R8+stQjlAZ+DQbH9HfHUsEbIhfcGu2AqucAMxQTdL0K
         6O9rj/KdPOLDaA2kk7KhQiXnqiJ6ZzK5Kz6VUKrnLh4gX7+CauJL5KQQsvERi2tHpxCv
         xqJuuKP9ucuoSzBuxtEhqqiGJUnyTq9iHgojfrH7WV4pc/YioemJv8l896JRv0IoP8N+
         LC6dnXlGCgOEHTI3n8oRZGgKUl98fEA6O5p+Ahmt5WsTwliORh9TekDEKQvLlTV9XAn6
         zxoLs4HE70sgZZ+ZPWMA2VmGPn5s+NIeLImg7FFrMdGbZmAms70WPzMmfH/6lfTS5zlk
         7RVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698946099; x=1699550899;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tNkygFU/hw8zUOPQ7Nync2PfCNdVcXfa85CS1trX39M=;
        b=r31t5nGuRKilgw9JdZjYIycOywbuRATB4VHEz8UW8V2o2Wpf1ptA4SSSaJylCZEajq
         0lMpSQ8TRUfCkmrkeYXii24KSdzdU7WlEVjg7Qd8vjWj+AjG3ORkPzj9xHtedKh2oz2C
         cIc3qhBZ2PTQWjda83bQRgMYe8VGx4YtKFS3uiFh0ADtROm2cTbMDFvJCDajJJVaRqfk
         EKL40i3I3ObKI2qNsK4/XrIR6Cr6AoSmCzSyL+kXLMRa3d1YA6WuhRqfB08bK5jw7Rnk
         i6bLXJWuHgPZgZvvETjsD02viglINwOGEzBuWuSAV84j2y9Eb22ioERIcUbUS/ZgIA2/
         KGnQ==
X-Gm-Message-State: AOJu0Yy5NHTdydLYF5wEy1niNuC4k5tvBF8WCXE12QuM05O8YfRF8zp0
	okQZRLO3IdNHCGfQYoRkeUE1
X-Google-Smtp-Source: AGHT+IH7fibGIbeWFf4lq3wUpjaMim+uaJtvzKp2sOzZPKo9u8eoqjbUNEnwl5inK43EbeNu+CLkqA==
X-Received: by 2002:a5b:706:0:b0:da0:c49a:5103 with SMTP id g6-20020a5b0706000000b00da0c49a5103mr17816802ybq.47.1698946099126;
        Thu, 02 Nov 2023 10:28:19 -0700 (PDT)
Received: from thinkpad ([117.217.189.228])
        by smtp.gmail.com with ESMTPSA id p8-20020ad452e8000000b0066d1e71e515sm121935qvu.113.2023.11.02.10.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 10:28:18 -0700 (PDT)
Date: Thu, 2 Nov 2023 22:58:09 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 2/4] PCI: layerscape: Add suspend/resume for ls1021a
Message-ID: <20231102172809.GD20943@thinkpad>
References: <20231017193145.3198380-1-Frank.Li@nxp.com>
 <20231017193145.3198380-3-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231017193145.3198380-3-Frank.Li@nxp.com>
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

On Tue, Oct 17, 2023 at 03:31:43PM -0400, Frank Li wrote:
> ls1021a add suspend/resume support.
> 
> Implement callback ls1021a_pcie_send_turnoff_msg(), which write scfg's
> SCFG_PEXPMWRCR to issue PME_Turn_off message.
> 
> Implement ls1021a_pcie_exit_from_l2() to let controller exit L2 state.
> 

I'd like to reword it to better reflect what the patch does:

"In the suspend path, PME_Turn_Off message is sent to the endpoint to transition
the link to L2/L3_Ready state. In this SoC, there is no way to check if the
controller has received the PME_To_Ack from the endpoint or not. So to be on the
safer side, the driver just waits for PCIE_PME_TO_L2_TIMEOUT_US before asserting
the SoC specific PMXMTTURNOFF bit to complete the PME_Turn_Off handshake. This
link would then enter L2/L3 state depending on the VAUX supply.

In the resume path, the link is brought back from L2 to L0 by doing a software
reset."

Although I do have questions on the resume behavior below.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     Change from v2 to v3
>     - update according to mani's feedback
>     change from v1 to v2
>     - change subject 'a' to 'A'
> 
>  drivers/pci/controller/dwc/pci-layerscape.c | 86 ++++++++++++++++++++-
>  1 file changed, 85 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index aea89926bcc4f..6f47cfe146c44 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -35,11 +35,21 @@
>  #define PF_MCR_PTOMR		BIT(0)
>  #define PF_MCR_EXL2S		BIT(1)
>  
> +/* LS1021A PEXn PM Write Control Register */
> +#define SCFG_PEXPMWRCR(idx)	(0x5c + (idx) * 0x64)
> +#define PMXMTTURNOFF		BIT(31)
> +#define SCFG_PEXSFTRSTCR	0x190
> +#define PEXSR(idx)		BIT(idx)
> +
>  #define PCIE_IATU_NUM		6
>  
> +#define LS_PCIE_DRV_SCFG	BIT(0)
> +
>  struct ls_pcie_drvdata {
>  	const u32 pf_off;
> +	const struct dw_pcie_host_ops *ops;
>  	int (*exit_from_l2)(struct dw_pcie_rp *pp);
> +	int flags;

Why not "bool scfg_support"?

>  	bool pm_support;
>  };
>  
> @@ -47,6 +57,8 @@ struct ls_pcie {
>  	struct dw_pcie *pci;
>  	const struct ls_pcie_drvdata *drvdata;
>  	void __iomem *pf_base;
> +	struct regmap *scfg;
> +	int index;
>  	bool big_endian;
>  };
>  
> @@ -171,13 +183,65 @@ static int ls_pcie_host_init(struct dw_pcie_rp *pp)
>  	return 0;
>  }
>  
> +static void ls1021a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +	u32 val;
> +
> +	/* Send PME_Turn_Off message */
> +	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
> +	val |= PMXMTTURNOFF;
> +	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
> +
> +	/*
> +	 * There is no specific register to check for PME_To_Ack from endpoint.
> +	 * So on the safe side, wait for PCIE_PME_TO_L2_TIMEOUT_US.
> +	 */
> +	mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
> +
> +	/*
> +	 * Layerscape hardware reference manual recommends clearing the PMXMTTURNOFF bit
> +	 * to complete the PME_Turn_Off handshake.
> +	 */
> +	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
> +	val &= ~PMXMTTURNOFF;
> +	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
> +}
> +
> +static int ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +	u32 val;
> +
> +	/* Only way exit from l2 is that do software reset */

So, what does exactly "software reset" mean? Are you resetting the endpoint or
some specific registers/blocks in the controller?

Also, what if the link goes to L3 in the case of no VAUX?

> +	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
> +	val |= PEXSR(pcie->index);
> +	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
> +
> +	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
> +	val &= ~PEXSR(pcie->index);
> +	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
> +
> +	return 0;
> +}
> +
>  static const struct dw_pcie_host_ops ls_pcie_host_ops = {
>  	.host_init = ls_pcie_host_init,
>  	.pme_turn_off = ls_pcie_send_turnoff_msg,
>  };
>  
> +static const struct dw_pcie_host_ops ls1021a_pcie_host_ops = {
> +	.host_init = ls_pcie_host_init,
> +	.pme_turn_off = ls1021a_pcie_send_turnoff_msg,
> +};
> +
>  static const struct ls_pcie_drvdata ls1021a_drvdata = {
> -	.pm_support = false,
> +	.pm_support = true,
> +	.ops = &ls1021a_pcie_host_ops,
> +	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
> +	.flags = LS_PCIE_DRV_SCFG,
>  };
>  
>  static const struct ls_pcie_drvdata layerscape_drvdata = {
> @@ -205,6 +269,8 @@ static int ls_pcie_probe(struct platform_device *pdev)
>  	struct dw_pcie *pci;
>  	struct ls_pcie *pcie;
>  	struct resource *dbi_base;
> +	u32 index[2];
> +	int ret;
>  
>  	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
>  	if (!pcie)
> @@ -220,6 +286,7 @@ static int ls_pcie_probe(struct platform_device *pdev)
>  	pci->pp.ops = &ls_pcie_host_ops;
>  
>  	pcie->pci = pci;
> +	pci->pp.ops = pcie->drvdata->ops ? pcie->drvdata->ops : &ls_pcie_host_ops;
>  
>  	dbi_base = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
>  	pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_base);
> @@ -230,6 +297,23 @@ static int ls_pcie_probe(struct platform_device *pdev)
>  
>  	pcie->pf_base = pci->dbi_base + pcie->drvdata->pf_off;
>  
> +	if (pcie->drvdata->flags & LS_PCIE_DRV_SCFG) {
> +

Remove extra newline.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
