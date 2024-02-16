Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C456857B97
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 12:26:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f9Hr8kSp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbqPs1H1pz3brB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 22:26:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f9Hr8kSp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbqP702hKz30f5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 22:25:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 437D061DE0;
	Fri, 16 Feb 2024 11:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD0AC433C7;
	Fri, 16 Feb 2024 11:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708082743;
	bh=irTs/3hjqvC4IGIEj4U/Sb544ZHhGyYlJaKX6Qhdn+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f9Hr8kSpQ3k1fF39QRvvME6Mk2/doRfaMNhgqWXiMfU9/dYZViGnmhMlYTTEi/S3D
	 p/NhBnh86rSKu5V11Ip5AEbIESUFOIj0NyTXjbHojGGCt940e8sC7jAMfJGWA0aQBy
	 LlRoSTch0Bh6lCeBocKAqycKpcnVX+NTVr7JstIwF1Fc5t7KhAQpkcMVry3Ieax+u6
	 HNYcf8/PV5dHGuGii7+hF0UNNwSA78XFZuQ81z/wY1JMJlkqeF8lDyMEv2ATmvAbd9
	 fq5CEnqBhPLLlXOrdMUhTZMe9d3dRuNpPsMi0iIJQgn+fWItYZxeUWIz236g2QEj08
	 S9BMhiNUAT4bg==
Date: Fri, 16 Feb 2024 16:55:31 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH 1/2] PCI: endpoint: Clean up hardware description for BARs
Message-ID: <20240216112531.GD2559@thinkpad>
References: <20240210012634.600301-1-cassel@kernel.org>
 <20240210012634.600301-2-cassel@kernel.org>
 <20240216111908.GC2559@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240216111908.GC2559@thinkpad>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Allen Hubbe <allenbh@gmail.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, Damien Le Moal <dlemoal@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, linuxppc-dev@lists.ozlabs
 .org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, ntb@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Jon Mason <jdmason@kudzu.us>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 16, 2024 at 04:49:08PM +0530, Manivannan Sadhasivam wrote:
> On Sat, Feb 10, 2024 at 02:26:25AM +0100, Niklas Cassel wrote:
> > The hardware description for BARs is scattered in many different variables
> > in pci_epc_features. Some of these things are mutually exclusive, so it
> > can create confusion over which variable that has precedence over another.
> > 
> > Improve the situation by creating a struct pci_epc_bar_desc, and a new
> > enum pci_epc_bar_type, and convert the endpoint controller drivers to use
> > this more well defined format.
> > 
> > Signed-off-by: Niklas Cassel <cassel@kernel.org>
> > ---
> >  drivers/pci/controller/dwc/pci-imx6.c         |  3 +-
> >  drivers/pci/controller/dwc/pci-keystone.c     | 12 +++----
> >  .../pci/controller/dwc/pci-layerscape-ep.c    |  5 ++-
> >  drivers/pci/controller/dwc/pcie-keembay.c     |  8 +++--
> >  drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  4 ++-
> >  drivers/pci/controller/dwc/pcie-tegra194.c    | 10 ++++--
> >  drivers/pci/controller/dwc/pcie-uniphier-ep.c | 15 ++++++--
> >  drivers/pci/controller/pcie-rcar-ep.c         | 14 +++++---
> >  drivers/pci/endpoint/functions/pci-epf-ntb.c  |  4 +--
> >  drivers/pci/endpoint/functions/pci-epf-test.c |  8 ++---
> >  drivers/pci/endpoint/functions/pci-epf-vntb.c |  2 +-
> >  drivers/pci/endpoint/pci-epc-core.c           | 32 +++++++++--------
> >  drivers/pci/endpoint/pci-epf-core.c           | 15 ++++----
> >  include/linux/pci-epc.h                       | 34 +++++++++++++++----
> >  14 files changed, 108 insertions(+), 58 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> > index dc2c036ab28c..47a9a96484ed 100644
> > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > @@ -1081,7 +1081,8 @@ static const struct pci_epc_features imx8m_pcie_epc_features = {
> >  	.linkup_notifier = false,
> >  	.msi_capable = true,
> >  	.msix_capable = false,
> > -	.reserved_bar = 1 << BAR_1 | 1 << BAR_3,
> > +	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > +	.bar[BAR_3] = { .type = BAR_RESERVED, },
> >  	.align = SZ_64K,
> >  };
> >  
> > diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> > index c0c62533a3f1..b2b93b4fa82d 100644
> > --- a/drivers/pci/controller/dwc/pci-keystone.c
> > +++ b/drivers/pci/controller/dwc/pci-keystone.c
> > @@ -924,12 +924,12 @@ static const struct pci_epc_features ks_pcie_am654_epc_features = {
> >  	.linkup_notifier = false,
> >  	.msi_capable = true,
> >  	.msix_capable = true,
> > -	.reserved_bar = 1 << BAR_0 | 1 << BAR_1,
> > -	.bar_fixed_64bit = 1 << BAR_0,
> > -	.bar_fixed_size[2] = SZ_1M,
> > -	.bar_fixed_size[3] = SZ_64K,
> > -	.bar_fixed_size[4] = 256,
> > -	.bar_fixed_size[5] = SZ_1M,
> > +	.bar[BAR_0] = { .type = BAR_RESERVED, .only_64bit = true, },
> > +	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > +	.bar[BAR_2] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
> > +	.bar[BAR_3] = { .type = BAR_FIXED, .fixed_size = SZ_64K, },
> > +	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256, },
> > +	.bar[BAR_5] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
> >  	.align = SZ_1M,
> >  };
> >  
> > diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > index 2e398494e7c0..1f6ee1460ec2 100644
> > --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > @@ -250,7 +250,10 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
> >  	pci->dev = dev;
> >  	pci->ops = pcie->drvdata->dw_pcie_ops;
> >  
> > -	ls_epc->bar_fixed_64bit = (1 << BAR_2) | (1 << BAR_4);
> > +	ls_epc->bar[BAR_2].only_64bit = true;
> > +	ls_epc->bar[BAR_3].type = BAR_RESERVED;
> 
> BAR_3 and BAR_4 were not reserved previously.
> 

Okay, looking at patch 2 makes it clear why you have marked it as such. But it
should've been mentioned in the commit message.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
