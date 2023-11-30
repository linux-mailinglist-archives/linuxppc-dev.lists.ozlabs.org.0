Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E067FF688
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 17:44:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fOZ6ZZst;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sh28n2nJzz3d97
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 03:44:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fOZ6ZZst;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::733; helo=mail-qk1-x733.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sh27w41D4z3c4M
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 03:43:37 +1100 (AEDT)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-77d8f9159fbso53225285a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 08:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701362613; x=1701967413; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RR929/inZVg6ya67dtiU9fWfLeIFrIte2BBVvFM3wXQ=;
        b=fOZ6ZZstsAOJQOTNUi2PvDCIW+s7dCLhCfBiJXA730SbyqokkhZKci9mcHJJoc6TGI
         mhK4iKQZFd2q73+4aw+xxTG6mRNrQ3MWwJd6xzmB+YVOAttBpCRs4DabXRLvZKE1I+nJ
         cuht10F8EDLXoq7FJT+8S6DnOJRHPXJaJNEMYVo16Z/jG7rQynBSbrtZ2n2bzXvgjzGI
         5II7KEWpsqN/uzmcaXk1AryUGd4Z6lH4tpU2eR3tFHAJsAOVMetp5jLvzTuIcxW/S4ZE
         QvJqH/seTw66Nl5opGAuBfIYkMlHGRnyUBtacStEVfJW4HAN59faKZIKc+FpPkHOpuaw
         s0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701362613; x=1701967413;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RR929/inZVg6ya67dtiU9fWfLeIFrIte2BBVvFM3wXQ=;
        b=Em6wklDITlwymKFojx645XRNlIiTnO3Q8HoMWvCEk0l8dMIgHMU8v5JCIFCV5HBrRK
         rJsTGcm4NRQ7sQaAp7iaNf78skDTJXk3pllHGviEu3E8QruXQpc0tZLbH9LC9MSB06He
         uLMdJlcvrm2Bw9AUyr91F8uaL6DkiFFzbuWv2MFifk6oG7Bz6LBks54uFjbRNjFEgiBD
         o6F2X/VzNTNbSfzoOo/9uFEZs1qsg9zIp3O2kUJXKuTvTWcpQHXKAtLoFKp+vqHdjkVC
         bxkODtVn6fwFqOZitc4zB1wGuW6PDq/03ogdyQAa1kA4Ao/6/gZL0j7hMXFufBB5VlWa
         bwzw==
X-Gm-Message-State: AOJu0YyP52AR9gQlaBIZm/CmoLw6P0V0FjwzAH7fucrAxcJg2Auy/bpI
	eHCbpFIhfRrQbL6wbOIpYLcl
X-Google-Smtp-Source: AGHT+IH4fdEjtTxeNLnBTzLGisqbKQLWEsMOBV/mouxbIc6qh43GktT+t9VymOEMBtx9xmzDq1qiMw==
X-Received: by 2002:a05:620a:269d:b0:77d:9dc9:cd05 with SMTP id c29-20020a05620a269d00b0077d9dc9cd05mr16628267qkp.11.1701362613426;
        Thu, 30 Nov 2023 08:43:33 -0800 (PST)
Received: from thinkpad ([117.213.102.92])
        by smtp.gmail.com with ESMTPSA id bm27-20020a05620a199b00b0077da0832d6csm639505qkb.22.2023.11.30.08.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 08:43:32 -0800 (PST)
Date: Thu, 30 Nov 2023 22:13:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 2/4] PCI: layerscape: Add suspend/resume for ls1021a
Message-ID: <20231130164323.GT3043@thinkpad>
References: <20231129214412.327633-1-Frank.Li@nxp.com>
 <20231129214412.327633-3-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231129214412.327633-3-Frank.Li@nxp.com>
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

On Wed, Nov 29, 2023 at 04:44:10PM -0500, Frank Li wrote:
> ls1021a add suspend/resume support.
> 

"Add suspend/resume support for Layerscape LS1021a"

> In the suspend path, PME_Turn_Off message is sent to the endpoint to
> transition the link to L2/L3_Ready state. In this SoC, there is no way to
> check if the controller has received the PME_To_Ack from the endpoint or
> not. So to be on the safer side, the driver just waits for
> PCIE_PME_TO_L2_TIMEOUT_US before asserting the SoC specific PMXMTTURNOFF
> bit to complete the PME_Turn_Off handshake. This link would then enter

"Then the link would enter L2/L3 state depending on the VAUX supply."

> L2/L3 state depending on the VAUX supply.
> 
> In the resume path, the link is brought back from L2 to L0 by doing a
> software reset.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Couple of comments below. But the patch is looking good now. Thanks for the
update.

> ---
> 
> Notes:
>     Change from v3 to v4
>     - update commit message.
>     - it is reset a glue logic part for PCI controller.
>     - use regmap_write_bits() to reduce code change.
>     
>     Change from v2 to v3
>     - update according to mani's feedback
>     change from v1 to v2
>     - change subject 'a' to 'A'
> 
>  drivers/pci/controller/dwc/pci-layerscape.c | 83 ++++++++++++++++++++-
>  1 file changed, 82 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index aea89926bcc4f..42bca2c3b5c3e 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -35,11 +35,19 @@
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
>  struct ls_pcie_drvdata {
>  	const u32 pf_off;
> +	const struct dw_pcie_host_ops *ops;
>  	int (*exit_from_l2)(struct dw_pcie_rp *pp);
> +	bool scfg_support;
>  	bool pm_support;
>  };
>  
> @@ -47,6 +55,8 @@ struct ls_pcie {
>  	struct dw_pcie *pci;
>  	const struct ls_pcie_drvdata *drvdata;
>  	void __iomem *pf_base;
> +	struct regmap *scfg;
> +	int index;
>  	bool big_endian;
>  };
>  
> @@ -171,13 +181,65 @@ static int ls_pcie_host_init(struct dw_pcie_rp *pp)
>  	return 0;
>  }
>  
> +static void scfg_pcie_send_turnoff_msg(struct regmap *scfg, u32 reg, u32 mask)
> +{
> +	/* Send PME_Turn_Off message */
> +	regmap_write_bits(scfg, reg, mask, mask);
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
> +	regmap_write_bits(scfg, reg, mask, 0);
> +}
> +
> +static void ls1021a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +
> +	scfg_pcie_send_turnoff_msg(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), PMXMTTURNOFF);
> +}
> +
> +static int scfg_pcie_exit_from_l2(struct regmap *scfg, u32 reg, u32 mask)
> +{
> +	/* Only way exit from l2 is that do software reset */

"Only way exit from L2 is by doing a software reset of the controller"

I really hope that the reset is not a global controller reset i.e., not
resetting all CSRs.

> +	regmap_write_bits(scfg, reg, mask, mask);
> +

No need of a newline.

> +	regmap_write_bits(scfg, reg, mask, 0);
> +
> +	return 0;
> +}
> +
> +static int ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +
> +	return scfg_pcie_exit_from_l2(pcie->scfg, SCFG_PEXSFTRSTCR, PEXSR(pcie->index));
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
> +	.scfg_support = true,
> +	.ops = &ls1021a_pcie_host_ops,
> +	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
>  };
>  
>  static const struct ls_pcie_drvdata layerscape_drvdata = {
> @@ -205,6 +267,8 @@ static int ls_pcie_probe(struct platform_device *pdev)
>  	struct dw_pcie *pci;
>  	struct ls_pcie *pcie;
>  	struct resource *dbi_base;
> +	u32 index[2];
> +	int ret;
>  
>  	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
>  	if (!pcie)
> @@ -220,6 +284,7 @@ static int ls_pcie_probe(struct platform_device *pdev)
>  	pci->pp.ops = &ls_pcie_host_ops;
>  
>  	pcie->pci = pci;
> +	pci->pp.ops = pcie->drvdata->ops ? pcie->drvdata->ops : &ls_pcie_host_ops;

pp.ops is already assigned to &ls_pcie_host_ops above. But I think for
consistency, you should pass ls_pcie_host_ops to the "ops" member of
layerscape_drvdata and just use:

	pci->pp.ops = pcie->drvdata->ops;

It looks a lot cleaner.

>  
>  	dbi_base = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
>  	pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_base);
> @@ -230,6 +295,22 @@ static int ls_pcie_probe(struct platform_device *pdev)
>  
>  	pcie->pf_base = pci->dbi_base + pcie->drvdata->pf_off;
>  
> +	if (pcie->drvdata->scfg_support) {
> +		pcie->scfg = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,pcie-scfg");
> +		if (IS_ERR(pcie->scfg)) {
> +			dev_err(dev, "No syscfg phandle specified\n");
> +			return PTR_ERR(pcie->scfg);
> +		}
> +
> +		ret = of_property_read_u32_array(dev->of_node, "fsl,pcie-scfg", index, 2);
> +		if (ret) {
> +			pcie->scfg = NULL;

No need to set it to NULL in the case of probe failure.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
