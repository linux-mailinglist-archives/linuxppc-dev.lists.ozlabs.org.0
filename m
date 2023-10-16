Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F00B67CB111
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 19:08:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dZSVRUDw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8Npp6D00z3vX9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 04:08:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dZSVRUDw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8Nny6H7xz2xwD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 04:07:17 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c8a1541233so28739455ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 10:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697476034; x=1698080834; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zyQucnK7s5ttgFNMm+Jt6n3FLUfetMR9PYHn67Ou8ko=;
        b=dZSVRUDwWCgslp70hDHVZ2jfiDsgTnCcfHv7OshdQlZVYir1zD7vdGm5u+n+Cn9kDu
         +4LVpgCF/I+jEAvFRtUHnzP2Xw5afuDAneigWzVUu74ghRY8ap17fB/I+vM0S76MyRQi
         Wjym1JSCKLZeOd6p0bNslI4dGFegvhecMrP+I7Nl7IIIBHWlW6MF/xJZgIh2IP/LArKd
         WHzWfgsgjrz97anQOAvP1jKqVKrb6IlZx2ywWJsjwpjqDpcL9AZ4mzG4E2B7sJNhn8a2
         SoUlcu5+fFf9PtBQiv3SV6Nz3pkpg2JG2SKmp3MyogfEPzGrWoS5ggpZ/9G3X7Hx4R1S
         hYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697476034; x=1698080834;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zyQucnK7s5ttgFNMm+Jt6n3FLUfetMR9PYHn67Ou8ko=;
        b=vO+qkbkrhp/TWsfaDhdVb93Dh+8K13xefAPUbATfDGf3oMhrXDtYVh0ZDVBUo2nt7W
         +1BGPxmBWjOBbiBDxgM1jX3hYgbtnUDcp4VfMuyLDhxSSyOsyrwsQF0AvJICnifw/lIZ
         ydqCOZ3pNveQQtGmbMOQS+lZOGlI87hZ8HCpcXQaWXYte1AaJefSfg/XDJjvSBdHzFWQ
         zYNuQYoXG2fyAoUqt9dWUvwbrEODEkWT3q17cGARAT5kj8XN8TrWKbPxn016WS028TA4
         z+t71ToFLjLwPurdbDzWLa2eEnDrOKKgG2lnPD3YM/JCrYg2XIaa+MC4Gd9d/yPNmWFd
         G3Tg==
X-Gm-Message-State: AOJu0YzE/eXEeRwaGBVcV666zihClg4zskqexO9vfviLQ9LHnkdkayqa
	weVAg83sLBbaETD7GJ8H5ANm
X-Google-Smtp-Source: AGHT+IF9JRQL23rtz9sszlfrT6GvV3obz5CBiIfNeK8f9JVLVlO3+3h4C0jG/dQhhxL/uSkxz5ARFg==
X-Received: by 2002:a17:903:22cb:b0:1c4:5e9e:7865 with SMTP id y11-20020a17090322cb00b001c45e9e7865mr34069186plg.0.1697476034169;
        Mon, 16 Oct 2023 10:07:14 -0700 (PDT)
Received: from thinkpad ([117.207.31.199])
        by smtp.gmail.com with ESMTPSA id s14-20020a170902ea0e00b001c9b5b63e36sm8718097plg.32.2023.10.16.10.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 10:07:13 -0700 (PDT)
Date: Mon, 16 Oct 2023 22:37:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 3/3] PCI: layerscape: add suspend/resume for ls1043a
Message-ID: <20231016170706.GG39962@thinkpad>
References: <20230915184306.2374670-1-Frank.Li@nxp.com>
 <20230915184306.2374670-3-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230915184306.2374670-3-Frank.Li@nxp.com>
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

On Fri, Sep 15, 2023 at 02:43:06PM -0400, Frank Li wrote:
> ls1043a add suspend/resume support.
> 

Same comment as previous patch for patch description.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-layerscape.c | 91 ++++++++++++++++++++-
>  1 file changed, 90 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index bc5a8ff1a26ce..debabb9bb41f4 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -41,10 +41,20 @@
>  #define SCFG_PEXSFTRSTCR	0x190
>  #define PEXSR(idx)		BIT(idx)
>  
> +/* LS1043A PEX PME control register */
> +#define SCFG_PEXPMECR		0x144
> +#define PEXPME(idx)		BIT(31 - (idx) * 4)
> +
> +/* LS1043A PEX LUT debug register */
> +#define LS_PCIE_LDBG	0x7fc
> +#define LDBG_SR		BIT(30)
> +#define LDBG_WE		BIT(31)
> +
>  #define PCIE_IATU_NUM		6
>  
>  struct ls_pcie_drvdata {
>  	const u32 pf_off;
> +	const u32 lut_off;
>  	const struct dw_pcie_host_ops *ops;
>  	void (*exit_from_l2)(struct dw_pcie_rp *pp);
>  	bool pm_support;
> @@ -54,6 +64,7 @@ struct ls_pcie {
>  	struct dw_pcie *pci;
>  	const struct ls_pcie_drvdata *drvdata;
>  	void __iomem *pf_base;
> +	void __iomem *lut_base;
>  	struct regmap *scfg;
>  	int index;
>  	bool big_endian;
> @@ -116,6 +127,23 @@ static void ls_pcie_pf_writel(struct ls_pcie *pcie, u32 off, u32 val)
>  		iowrite32(val, pcie->pf_base + off);
>  }
>  
> +static u32 ls_pcie_lut_readl(struct ls_pcie *pcie, u32 off)
> +{

Looking at ls_pcie_pf_{readl/writel} you can use a common function that does the
read/write and pass the relevant base/offset. This will avoid code duplication.

> +	if (pcie->big_endian)
> +		return ioread32be(pcie->lut_base + off);
> +
> +	return ioread32(pcie->lut_base + off);
> +}
> +
> +static void ls_pcie_lut_writel(struct ls_pcie *pcie, u32 off, u32 val)
> +{
> +	if (pcie->big_endian)
> +		iowrite32be(val, pcie->lut_base + off);
> +	else
> +		iowrite32(val, pcie->lut_base + off);
> +}
> +

Remove extra newline

> +
>  static void ls_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -249,6 +277,54 @@ static int ls1021a_pcie_host_init(struct dw_pcie_rp *pp)
>  	return ret;
>  }
>  
> +static void ls1043a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +	u32 val;
> +
> +	if (!pcie->scfg) {
> +		dev_dbg(pcie->pci->dev, "SYSCFG is NULL\n");
> +		return;
> +	}
> +
> +	/* Send Turn_off message */
> +	regmap_read(pcie->scfg, SCFG_PEXPMECR, &val);

If the register offset is the only difference, then you could pass the register
offset via drvdata and use the same functions.

> +	val |= PEXPME(pcie->index);
> +	regmap_write(pcie->scfg, SCFG_PEXPMECR, val);
> +
> +	/* There are not register to check ACK, so wait PCIE_PME_TO_L2_TIMEOUT_US */
> +	mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
> +
> +	/* Clear Turn_off message */
> +	regmap_read(pcie->scfg, SCFG_PEXPMECR, &val);
> +	val &= ~PEXPME(pcie->index);
> +	regmap_write(pcie->scfg, SCFG_PEXPMECR, val);
> +}
> +
> +static void ls1043a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +	u32 val;
> +

Again, a comment here would be useful.

- Mani

> +	val = ls_pcie_lut_readl(pcie, LS_PCIE_LDBG);
> +	val |= LDBG_WE;
> +	ls_pcie_lut_writel(pcie, LS_PCIE_LDBG, val);
> +
> +	val = ls_pcie_lut_readl(pcie, LS_PCIE_LDBG);
> +	val |= LDBG_SR;
> +	ls_pcie_lut_writel(pcie, LS_PCIE_LDBG, val);
> +
> +	val = ls_pcie_lut_readl(pcie, LS_PCIE_LDBG);
> +	val &= ~LDBG_SR;
> +	ls_pcie_lut_writel(pcie, LS_PCIE_LDBG, val);
> +
> +	val = ls_pcie_lut_readl(pcie, LS_PCIE_LDBG);
> +	val &= ~LDBG_WE;
> +	ls_pcie_lut_writel(pcie, LS_PCIE_LDBG, val);
> +}
> +
>  static const struct dw_pcie_host_ops ls_pcie_host_ops = {
>  	.host_init = ls_pcie_host_init,
>  	.pme_turn_off = ls_pcie_send_turnoff_msg,
> @@ -265,6 +341,18 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
>  	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
>  };
>  
> +static const struct dw_pcie_host_ops ls1043a_pcie_host_ops = {
> +	.host_init = ls1021a_pcie_host_init, /* the same as ls1021 */
> +	.pme_turn_off = ls1043a_pcie_send_turnoff_msg,
> +};
> +
> +static const struct ls_pcie_drvdata ls1043a_drvdata = {
> +	.lut_off = 0x10000,
> +	.pm_support = true,
> +	.ops = &ls1043a_pcie_host_ops,
> +	.exit_from_l2 = ls1043a_pcie_exit_from_l2,
> +};
> +
>  static const struct ls_pcie_drvdata layerscape_drvdata = {
>  	.pf_off = 0xc0000,
>  	.pm_support = true,
> @@ -275,7 +363,7 @@ static const struct of_device_id ls_pcie_of_match[] = {
>  	{ .compatible = "fsl,ls1012a-pcie", .data = &layerscape_drvdata },
>  	{ .compatible = "fsl,ls1021a-pcie", .data = &ls1021a_drvdata },
>  	{ .compatible = "fsl,ls1028a-pcie", .data = &layerscape_drvdata },
> -	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1021a_drvdata },
> +	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1043a_drvdata },
>  	{ .compatible = "fsl,ls1046a-pcie", .data = &layerscape_drvdata },
>  	{ .compatible = "fsl,ls2080a-pcie", .data = &layerscape_drvdata },
>  	{ .compatible = "fsl,ls2085a-pcie", .data = &layerscape_drvdata },
> @@ -314,6 +402,7 @@ static int ls_pcie_probe(struct platform_device *pdev)
>  	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
>  
>  	pcie->pf_base = pci->dbi_base + pcie->drvdata->pf_off;
> +	pcie->lut_base = pci->dbi_base + pcie->drvdata->lut_off;
>  
>  	if (!ls_pcie_is_bridge(pcie))
>  		return -ENODEV;
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
