Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8127C010C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 18:03:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DPfnQ4Mq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4ggC72lGz3cD0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 03:03:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DPfnQ4Mq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=lpieralisi@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4gfG2K0wz2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 03:02:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF21061714;
	Tue, 10 Oct 2023 16:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E2FC433C7;
	Tue, 10 Oct 2023 16:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696953762;
	bh=8zTGRYTY1WUSPexJBZKSYXIXebpfzjhtEAwIpwHKrgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DPfnQ4Mqq/LwUfreTwFh2h7CpeWm1aEetozjYfx9hep8O3FN5ECtreNqLxdO38h4D
	 y2M4N0vbTDKEqB0hqR5Gj4wp//6BhUIyeyzarNel8VnlHeGz7zSnawtIJZYoXg0mIB
	 X1kxcEPxUxbVc6CJN4yLmqP9IsVviwIgAl3dk/XdYU2p2AP1HyHTYct6nl7aJAI1Na
	 y1Q73d4THK7/xQV198rpNqDqOIYAxFwUmCYguOeBkMJGCQlLvwH+lSoSSrDxHObl5o
	 FWQmFW0v8FHC/s0zHtU7iOk7N1XpVaO97nOxNcG2mDEAW1GtvKhWjB6l63p7vX3J8t
	 tOM7bgskk4kmA==
Date: Tue, 10 Oct 2023 18:02:36 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH 2/3] PCI: layerscape: add suspend/resume for ls1021a
Message-ID: <ZSV1nJUAbUdLXkt4@lpieralisi>
References: <20230915184306.2374670-1-Frank.Li@nxp.com>
 <20230915184306.2374670-2-Frank.Li@nxp.com>
 <ZR10SVVBYvfMJPv1@lizhi-Precision-Tower-5810>
 <ZSVdnAsRQA2zHsF7@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSVdnAsRQA2zHsF7@lizhi-Precision-Tower-5810>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, imx@lists.linux.dev, Rob Herring <robh@kernel.org>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 10, 2023 at 10:20:12AM -0400, Frank Li wrote:
> On Wed, Oct 04, 2023 at 10:23:51AM -0400, Frank Li wrote:
> > On Fri, Sep 15, 2023 at 02:43:05PM -0400, Frank Li wrote:
> > > ls1021a add suspend/resume support.
> > > 
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > 
> > ping
> > 
> > Frank
> 
> Ping

Read and follow please (and then ping us):
https://lore.kernel.org/linux-pci/20171026223701.GA25649@bhelgaas-glaptop.roam.corp.google.com

> Frank
> 
> > 
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
> > > +		dev_dbg(pcie->pci->dev, "SYSCFG is NULL\n");
> > > +		return;
> > > +	}
> > > +
> > > +	/* Send Turn_off message */
> > > +	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
> > > +	val |= PMXMTTURNOFF;
> > > +	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
> > > +
> > > +	/* There are not register to check ACK, so wait PCIE_PME_TO_L2_TIMEOUT_US */
> > > +	mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
> > > +
> > > +	/* Clear Turn_off message */
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
