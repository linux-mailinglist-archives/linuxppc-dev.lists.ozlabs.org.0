Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AF87CBD39
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 10:18:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Vc581irM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8n1P5G8Lz3cc6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 19:18:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Vc581irM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8n0V3GQZz30dt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 19:17:44 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-27d104fa285so4379208a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 01:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697530659; x=1698135459; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+LlVnjovZQKa7NrShhm24YzALCz3Jiaz+eKNaJ3ulnM=;
        b=Vc581irMcjYc8hABpXWFMkt4AdzM+82xC3vWqYqAElQgs8JSTPkxvZ9Mz7YVThdZUq
         tridPYLnDE0NcSB+qMbhZDIt35OnW9QN+I41ZVRw6kwpNbsK4fU9XhoFVcqVEk+plBKD
         PJ0T6Y+R7+2R+nZeTryB8bPSKjl8sm+AznixsbYG0YHJ7O9mPBxYNsNd/nmquqL2tTOd
         wxGFhwcX3PQKWvjMpxUL+PyExyHedBz2J3alg31v0sK4NQVbW8GM5f+tnXoVz5o/W/lS
         zyfl28QvxeMb1V7f+fHwGCkrX5AhSDdvg7IajXN9G5f0iMbBy60IoA9eadrPaXNFC3BZ
         nc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697530659; x=1698135459;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+LlVnjovZQKa7NrShhm24YzALCz3Jiaz+eKNaJ3ulnM=;
        b=i3s6gxXf1L0GkkgsGy+o36DP5iad3A0aTX9IGU++iSTLcpoPMAK0niIvIw+S8uyBGD
         uSucB113EnzfNjYoblCaeZNzUjgrXuU/l7jRMkBr57X2qlwPAIUY33XpLUM+alqxmoFw
         m5hbguHbae7Ic97qEMLWRxsrsPDnV/p1By9MS3fRLBxkWXYNBLHZ15Sv3ecy3RoddNZS
         MIRKy5yFVa6PwqkQlheLR7y4JBpdpr6qrFQ2iP26DGvv4wk0qYndrOi544d2wYGW0+FD
         Nvg2siEkcT9WU4SFPiw2Qfejlql99Rtks63Wf1todqVQCWzEAiDMCFAiUBbI0VvBz/Nz
         CZSQ==
X-Gm-Message-State: AOJu0YxzhFh3r8PwxbOO0aUVd5nmXD1gaaXT0KotfKKYiUF5OY5FZ4Gv
	rkQ7oHwN0I8l9ROJFVCF/vAR
X-Google-Smtp-Source: AGHT+IFJ+XwjBNsHb401tnImJrgO8tIl7GAykVmzgDpD/pNzSxKnSUYd1c7yondYd4ensK7UNVBRzA==
X-Received: by 2002:a17:90a:d98d:b0:261:685:95b6 with SMTP id d13-20020a17090ad98d00b00261068595b6mr1492510pjv.13.1697530659344;
        Tue, 17 Oct 2023 01:17:39 -0700 (PDT)
Received: from thinkpad ([117.207.31.199])
        by smtp.gmail.com with ESMTPSA id h16-20020a17090adb9000b002791d5a3e29sm769640pjv.6.2023.10.17.01.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 01:17:38 -0700 (PDT)
Date: Tue, 17 Oct 2023 13:47:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH 2/3] PCI: layerscape: add suspend/resume for ls1021a
Message-ID: <20231017081731.GD5274@thinkpad>
References: <20230915184306.2374670-1-Frank.Li@nxp.com>
 <20230915184306.2374670-2-Frank.Li@nxp.com>
 <20231016165824.GF39962@thinkpad>
 <ZS2anCpWakttzaAu@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZS2anCpWakttzaAu@lizhi-Precision-Tower-5810>
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

On Mon, Oct 16, 2023 at 04:18:36PM -0400, Frank Li wrote:
> On Mon, Oct 16, 2023 at 10:28:24PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Sep 15, 2023 at 02:43:05PM -0400, Frank Li wrote:
> > > ls1021a add suspend/resume support.
> > > 
> > 
> > Please add what the driver is doing during suspend/resume.
> > 
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/pci/controller/dwc/pci-layerscape.c | 88 ++++++++++++++++++++-
> > >  1 file changed, 87 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> > > index 20c48c06e2248..bc5a8ff1a26ce 100644
> > > --- a/drivers/pci/controller/dwc/pci-layerscape.c
> > > +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> > > @@ -35,6 +35,12 @@
> > >  #define PF_MCR_PTOMR		BIT(0)
> > >  #define PF_MCR_EXL2S		BIT(1)
> > >  
> > > +/* LS1021A PEXn PM Write Control Register */
> > > +#define SCFG_PEXPMWRCR(idx)	(0x5c + (idx) * 0x64)
> > > +#define PMXMTTURNOFF		BIT(31)
> > > +#define SCFG_PEXSFTRSTCR	0x190
> > > +#define PEXSR(idx)		BIT(idx)
> > > +
> > >  #define PCIE_IATU_NUM		6
> > >  
> > >  struct ls_pcie_drvdata {
> > > @@ -48,6 +54,8 @@ struct ls_pcie {
> > >  	struct dw_pcie *pci;
> > >  	const struct ls_pcie_drvdata *drvdata;
> > >  	void __iomem *pf_base;
> > > +	struct regmap *scfg;
> > > +	int index;
> > >  	bool big_endian;
> > >  };
> > >  
> > > @@ -170,13 +178,91 @@ static int ls_pcie_host_init(struct dw_pcie_rp *pp)
> > >  	return 0;
> > >  }
> > >  
> > > +static void ls1021a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> > > +{
> > > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > +	struct ls_pcie *pcie = to_ls_pcie(pci);
> > > +	u32 val;
> > > +
> > > +	if (!pcie->scfg) {
> > 
> > Can this ever happen?
> > 
> > > +		dev_dbg(pcie->pci->dev, "SYSCFG is NULL\n");
> > > +		return;
> > > +	}
> > > +
> > > +	/* Send Turn_off message */
> > 
> > "Send PME_Turn_Off message"
> > 
> > > +	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
> > > +	val |= PMXMTTURNOFF;
> > > +	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
> > > +
> > > +	/* There are not register to check ACK, so wait PCIE_PME_TO_L2_TIMEOUT_US */
> > 
> > "There is no specific register to check for PME_To_Ack from endpoint. So on the
> > safe side, wait for PCIE_PME_TO_L2_TIMEOUT_US."
> > 
> > > +	mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
> > > +
> > > +	/* Clear Turn_off message */
> > 
> > "PME_Turn_off". But I'm not sure if this is really required. Are you doing it
> > because the layerspace hw implements the PME_Turn_Off bit as "level triggered"?
> 
> I am not sure how hardware implement this. But reference manual said:
>  
> PMXMTTURNOFF:
> Generate PM turnoff message for power management of PCI Express controllers.
> This bit should be cleared by software.
> 0 Clear PM turnoff (default)
> 1 Trigger PM turnoff
> 

Hmm, okay. Atleast add the below comment to make it understandable in the
future:

"Layerscape hardware reference manual recommends clearing the PMXMTTURNOFF bit
to complete the PME_Turn_Off handshake."

- Mani

> Frank
> 
> > 
> > > +	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
> > > +	val &= ~PMXMTTURNOFF;
> > > +	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
> > > +}
> > > +
> > > +static void ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> > > +{
> > > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > +	struct ls_pcie *pcie = to_ls_pcie(pci);
> > > +	u32 val;
> > > +
> > 
> > A comment here would be good.
> > 
> > > +	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
> > > +	val |= PEXSR(pcie->index);
> > > +	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
> > > +
> > > +	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
> > > +	val &= ~PEXSR(pcie->index);
> > > +	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
> > > +}
> > > +
> > > +static int ls1021a_pcie_host_init(struct dw_pcie_rp *pp)
> > > +{
> > > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > +	struct ls_pcie *pcie = to_ls_pcie(pci);
> > > +	struct device *dev = pcie->pci->dev;
> > > +	u32 index[2];
> > > +	int ret;
> > > +
> > > +	ret = ls_pcie_host_init(pp);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	pcie->scfg = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,pcie-scfg");
> > > +	if (IS_ERR(pcie->scfg)) {
> > > +		ret = PTR_ERR(pcie->scfg);
> > > +		dev_err(dev, "No syscfg phandle specified\n");
> > > +		pcie->scfg = NULL;
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = of_property_read_u32_array(dev->of_node, "fsl,pcie-scfg", index, 2);
> > > +	if (ret) {
> > > +		pcie->scfg = NULL;
> > > +		return ret;
> > > +	}
> > > +
> > > +	pcie->index = index[1];
> > > +
> > 
> > The above syscon parsing could be done conditionally during probe itself. There
> > is no need to do it during host_init() time.
> > 
> > - Mani
> > 
> > > +	return ret;
> > > +}
> > > +
> > >  static const struct dw_pcie_host_ops ls_pcie_host_ops = {
> > >  	.host_init = ls_pcie_host_init,
> > >  	.pme_turn_off = ls_pcie_send_turnoff_msg,
> > >  };
> > >  
> > > +static const struct dw_pcie_host_ops ls1021a_pcie_host_ops = {
> > > +	.host_init = ls1021a_pcie_host_init,
> > > +	.pme_turn_off = ls1021a_pcie_send_turnoff_msg,
> > > +};
> > > +
> > >  static const struct ls_pcie_drvdata ls1021a_drvdata = {
> > > -	.pm_support = false,
> > > +	.pm_support = true,
> > > +	.ops = &ls1021a_pcie_host_ops,
> > > +	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
> > >  };
> > >  
> > >  static const struct ls_pcie_drvdata layerscape_drvdata = {
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்
