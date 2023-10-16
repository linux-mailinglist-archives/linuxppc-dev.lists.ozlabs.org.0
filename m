Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8657CB0CD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 18:59:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TO2NiRvQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8Ncs46C7z3cRN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 03:59:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TO2NiRvQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8Nc03zL3z2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 03:58:38 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d9beb863816so1267977276.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 09:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697475515; x=1698080315; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Afu5xdjrM60kr5jPKowmDpQRJUH3WWvLNXM6VlnD7Ds=;
        b=TO2NiRvQk70CFuEKNHhONrFDdjPwc/qB2T1/JbnSOH4VZX1kcfRVOAi9Bx3KxJgYAI
         K8LoXElT2mVXTQnAun0ldpwLWRfVyrNlcw5AZpduRV4tdDH3TOGcDkJGu/JojQLuH9zE
         kykISItNTzZznFNlYG4eGIjPEfMWYN09mWfNIodMrciYMul0b0HzPkaOproKMDPbzO54
         eyY2LRCPDZZxJFH3j4vuZCoGUbNPYrIMj2gm16n8J22A4dCpB7RZ3rJiLfdfmXw72N6s
         zr4WeA9Mm1mlXewnziESaRNc3tzTyKHqTYQizlfpbWnw1Oboun/7TGgwkAKSlXMAJUmc
         LMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697475515; x=1698080315;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Afu5xdjrM60kr5jPKowmDpQRJUH3WWvLNXM6VlnD7Ds=;
        b=IDWr41q9UkwDsaGmoYKh/e3eL22283W1Pzli2m0KR7N4WFkjuy5jV6CbSoSiizBuKe
         j3Dw1bxGVFZnTT88LCAPzAslaFIvJFPFE6weNDHflipJdo8lhbxPrDReyvat/ACNLJht
         vXmVWxfX/ZM2v7ZcT3d5iyuSBngi05YwQj1OFv9YPd/zBYIG+nBAwpchIF+ZWqv26Y74
         ZyIkM031G9EgdbXotQS4hovfFCwy+YRJUx/k/jDXEcBiMBs/zcsp/iPjof5IdhPRDCPs
         E/LoPZ6NtgncFOeQzh/1RY00locr9dnsnRv7lv5Ix4QaAl6xxZqe4UfYApsxTb+0WD54
         XQTA==
X-Gm-Message-State: AOJu0YwHFalH9jan7/mjDPDSzFaBdWhavqiPrSgL4fQFcY39NL07H2yy
	M29zw5NBXcfDcEMeZ1ma5JUB
X-Google-Smtp-Source: AGHT+IEFaxm77O8Qvj9+hGJ9O76en3aHbv05oX+Ne6kwKs5h2XLGTM7ESsLfBmjCk7ynOa6kMoTGzw==
X-Received: by 2002:a25:ae85:0:b0:d9a:4362:67ac with SMTP id b5-20020a25ae85000000b00d9a436267acmr18122044ybj.15.1697475515480;
        Mon, 16 Oct 2023 09:58:35 -0700 (PDT)
Received: from thinkpad ([117.207.31.199])
        by smtp.gmail.com with ESMTPSA id s8-20020ad45008000000b0065afd35c762sm3564494qvo.91.2023.10.16.09.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 09:58:35 -0700 (PDT)
Date: Mon, 16 Oct 2023 22:28:24 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 2/3] PCI: layerscape: add suspend/resume for ls1021a
Message-ID: <20231016165824.GF39962@thinkpad>
References: <20230915184306.2374670-1-Frank.Li@nxp.com>
 <20230915184306.2374670-2-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230915184306.2374670-2-Frank.Li@nxp.com>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, imx@lists.linux.dev, Rob Herring <robh@kernel.org>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, open list <linux-kernel@vger.kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 15, 2023 at 02:43:05PM -0400, Frank Li wrote:
> ls1021a add suspend/resume support.
> 

Please add what the driver is doing during suspend/resume.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-layerscape.c | 88 ++++++++++++++++++++-
>  1 file changed, 87 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index 20c48c06e2248..bc5a8ff1a26ce 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -35,6 +35,12 @@
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
> @@ -48,6 +54,8 @@ struct ls_pcie {
>  	struct dw_pcie *pci;
>  	const struct ls_pcie_drvdata *drvdata;
>  	void __iomem *pf_base;
> +	struct regmap *scfg;
> +	int index;
>  	bool big_endian;
>  };
>  
> @@ -170,13 +178,91 @@ static int ls_pcie_host_init(struct dw_pcie_rp *pp)
>  	return 0;
>  }
>  
> +static void ls1021a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +	u32 val;
> +
> +	if (!pcie->scfg) {

Can this ever happen?

> +		dev_dbg(pcie->pci->dev, "SYSCFG is NULL\n");
> +		return;
> +	}
> +
> +	/* Send Turn_off message */

"Send PME_Turn_Off message"

> +	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
> +	val |= PMXMTTURNOFF;
> +	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
> +
> +	/* There are not register to check ACK, so wait PCIE_PME_TO_L2_TIMEOUT_US */

"There is no specific register to check for PME_To_Ack from endpoint. So on the
safe side, wait for PCIE_PME_TO_L2_TIMEOUT_US."

> +	mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
> +
> +	/* Clear Turn_off message */

"PME_Turn_off". But I'm not sure if this is really required. Are you doing it
because the layerspace hw implements the PME_Turn_Off bit as "level triggered"?

> +	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
> +	val &= ~PMXMTTURNOFF;
> +	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
> +}
> +
> +static void ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +	u32 val;
> +

A comment here would be good.

> +	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
> +	val |= PEXSR(pcie->index);
> +	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
> +
> +	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
> +	val &= ~PEXSR(pcie->index);
> +	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
> +}
> +
> +static int ls1021a_pcie_host_init(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +	struct device *dev = pcie->pci->dev;
> +	u32 index[2];
> +	int ret;
> +
> +	ret = ls_pcie_host_init(pp);
> +	if (ret)
> +		return ret;
> +
> +	pcie->scfg = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,pcie-scfg");
> +	if (IS_ERR(pcie->scfg)) {
> +		ret = PTR_ERR(pcie->scfg);
> +		dev_err(dev, "No syscfg phandle specified\n");
> +		pcie->scfg = NULL;
> +		return ret;
> +	}
> +
> +	ret = of_property_read_u32_array(dev->of_node, "fsl,pcie-scfg", index, 2);
> +	if (ret) {
> +		pcie->scfg = NULL;
> +		return ret;
> +	}
> +
> +	pcie->index = index[1];
> +

The above syscon parsing could be done conditionally during probe itself. There
is no need to do it during host_init() time.

- Mani

> +	return ret;
> +}
> +
>  static const struct dw_pcie_host_ops ls_pcie_host_ops = {
>  	.host_init = ls_pcie_host_init,
>  	.pme_turn_off = ls_pcie_send_turnoff_msg,
>  };
>  
> +static const struct dw_pcie_host_ops ls1021a_pcie_host_ops = {
> +	.host_init = ls1021a_pcie_host_init,
> +	.pme_turn_off = ls1021a_pcie_send_turnoff_msg,
> +};
> +
>  static const struct ls_pcie_drvdata ls1021a_drvdata = {
> -	.pm_support = false,
> +	.pm_support = true,
> +	.ops = &ls1021a_pcie_host_ops,
> +	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
>  };
>  
>  static const struct ls_pcie_drvdata layerscape_drvdata = {
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
