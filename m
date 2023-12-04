Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEF180313B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 12:04:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=N1jdoU35;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkLR34CfBz3cZt
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 22:04:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=N1jdoU35;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkLQD4hDPz2xYY
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Dec 2023 22:04:04 +1100 (AEDT)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-67aa3b62c35so18523756d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Dec 2023 03:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701687841; x=1702292641; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=swbDV6YHNPw6cNT5rrUA42erB6Nky2n0v5A5UtdMoss=;
        b=N1jdoU356zm2h5PPSa0k9pm38+mKOAFvW8Aa7NVQMM5rp7nGcT484hBrymcXSK4cFa
         1aqpf9BicOAIckAR/QC+NPAGCSpMhERkjE1vcs/YDjdridhddH+zJ+uVShSEYvYT76n2
         VeNaKRwtoVrSvlYQqOXb8m4O8B0KrHMmPO81M4KPgJoFw7Q0MA7P+K8T+QLzfNt4raw8
         b9JakGlZyIO1ZBViYAKBQg+j3U9hiOTdtwPX+8jQy+lvbJVZqfH/2T+pkqgc+IT9LMHS
         13zXJAPg2+0FbsM7KMoCF6sK8kKh17L1oSnKlGu5mAT2P95qB8TVRQuPm1KpOy4RVJPK
         BXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701687841; x=1702292641;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=swbDV6YHNPw6cNT5rrUA42erB6Nky2n0v5A5UtdMoss=;
        b=PKUpWeReqKMuKyUS4MzATD4/+cywHAzvL3X4Ruc6KCxIZ/wvlNx7GColj+l9YeY+SI
         pUUrd+FLrRkySlceG2gOnaVj3XF+/5lPnywbArXQfB0qY0oqRC2EsgocuTKGdgtFx2Y/
         FrBFnQTWVMilBB5nr0ebbCthR3ekLBF86SYuFDkta/dWXL0L2Pu9TTqdUATpA3bWJ26i
         ZyBu5SGca4GT44DhLozz+dtXMGepjjsyJpKlj8wkiTy7UuthghInsGQHXMB6lwCJjtkP
         AjNKuXKnYKT6iH8VInHuev2MW+QFZuFRKwjMol6ceUxnlDNudx5U2jlCcnwG47B4ezqW
         03gw==
X-Gm-Message-State: AOJu0Yx83YcuGplr5gIQmmUNYPuLzt2TuU6CthKzwNH9zGdTYkgiNV7q
	SGSQcJ11bGaOu+Auf86U6cdp
X-Google-Smtp-Source: AGHT+IEgXLrF2rPbXYX2KHUUrMiPsTUsWl8BAdec3IVSKfGCgd1GC+GpFcUTXWfC1rG8OjStFT63Sg==
X-Received: by 2002:a05:6214:847:b0:67a:b372:721c with SMTP id dg7-20020a056214084700b0067ab372721cmr3864545qvb.34.1701687840504;
        Mon, 04 Dec 2023 03:04:00 -0800 (PST)
Received: from thinkpad ([117.213.101.240])
        by smtp.gmail.com with ESMTPSA id z6-20020a0cf006000000b0067a17c8696esm2572644qvk.82.2023.12.04.03.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 03:04:00 -0800 (PST)
Date: Mon, 4 Dec 2023 16:33:50 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v5 4/4] PCI: layerscape: Add suspend/resume for ls1043a
Message-ID: <20231204110350.GD35383@thinkpad>
References: <20231201161712.1645987-1-Frank.Li@nxp.com>
 <20231201161712.1645987-5-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231201161712.1645987-5-Frank.Li@nxp.com>
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

On Fri, Dec 01, 2023 at 11:17:12AM -0500, Frank Li wrote:
> Add suspend/resume support for Layerscape LS1043a.
> 
> In the suspend path, PME_Turn_Off message is sent to the endpoint to
> transition the link to L2/L3_Ready state. In this SoC, there is no way to
> check if the controller has received the PME_To_Ack from the endpoint or
> not. So to be on the safer side, the driver just waits for
> PCIE_PME_TO_L2_TIMEOUT_US before asserting the SoC specific PMXMTTURNOFF
> bit to complete the PME_Turn_Off handshake. Then the link would enter L2/L3
> state depending on the VAUX supply.
> 
> In the resume path, the link is brought back from L2 to L0 by doing a
> software reset.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> 
> Notes:
>     Change from v4 to v5
>     - update commit message
>     - use comments
>     /* Reset the PEX wrapper to bring the link out of L2 */
>     
>     Change from v3 to v4
>     - Call scfg_pcie_send_turnoff_msg() shared with ls1021a
>     - update commit message
>     
>     Change from v2 to v3
>     - Remove ls_pcie_lut_readl(writel) function
>     
>     Change from v1 to v2
>     - Update subject 'a' to 'A'
> 
>  drivers/pci/controller/dwc/pci-layerscape.c | 63 ++++++++++++++++++++-
>  1 file changed, 62 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index a9151e98fde6f..715365e91f8ef 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -41,6 +41,15 @@
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
> @@ -224,6 +233,45 @@ static int ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
>  	return scfg_pcie_exit_from_l2(pcie->scfg, SCFG_PEXSFTRSTCR, PEXSR(pcie->index));
>  }
>  
> +static void ls1043a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +
> +	scfg_pcie_send_turnoff_msg(pcie->scfg, SCFG_PEXPMECR, PEXPME(pcie->index));
> +}
> +
> +static int ls1043a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +	u32 val;
> +
> +	/*
> +	 * Reset the PEX wrapper to bring the link out of L2.
> +	 * LDBG_WE: allows the user to have write access to the PEXDBG[SR] for both setting and
> +	 *	    clearing the soft reset on the PEX module.
> +	 * LDBG_SR: When SR is set to 1, the PEX module enters soft reset.
> +	 */
> +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
> +	val |= LDBG_WE;
> +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
> +
> +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
> +	val |= LDBG_SR;
> +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
> +
> +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
> +	val &= ~LDBG_SR;
> +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
> +
> +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
> +	val &= ~LDBG_WE;
> +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
> +
> +	return 0;
> +}
> +
>  static const struct dw_pcie_host_ops ls_pcie_host_ops = {
>  	.host_init = ls_pcie_host_init,
>  	.pme_turn_off = ls_pcie_send_turnoff_msg,
> @@ -241,6 +289,19 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
>  	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
>  };
>  
> +static const struct dw_pcie_host_ops ls1043a_pcie_host_ops = {
> +	.host_init = ls_pcie_host_init,
> +	.pme_turn_off = ls1043a_pcie_send_turnoff_msg,
> +};
> +
> +static const struct ls_pcie_drvdata ls1043a_drvdata = {
> +	.pf_lut_off = 0x10000,
> +	.pm_support = true,
> +	.scfg_support = true,
> +	.ops = &ls1043a_pcie_host_ops,
> +	.exit_from_l2 = ls1043a_pcie_exit_from_l2,
> +};
> +
>  static const struct ls_pcie_drvdata layerscape_drvdata = {
>  	.pf_lut_off = 0xc0000,
>  	.pm_support = true,
> @@ -252,7 +313,7 @@ static const struct of_device_id ls_pcie_of_match[] = {
>  	{ .compatible = "fsl,ls1012a-pcie", .data = &layerscape_drvdata },
>  	{ .compatible = "fsl,ls1021a-pcie", .data = &ls1021a_drvdata },
>  	{ .compatible = "fsl,ls1028a-pcie", .data = &layerscape_drvdata },
> -	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1021a_drvdata },
> +	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1043a_drvdata },
>  	{ .compatible = "fsl,ls1046a-pcie", .data = &layerscape_drvdata },
>  	{ .compatible = "fsl,ls2080a-pcie", .data = &layerscape_drvdata },
>  	{ .compatible = "fsl,ls2085a-pcie", .data = &layerscape_drvdata },
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
