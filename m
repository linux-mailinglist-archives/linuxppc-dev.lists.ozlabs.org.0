Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18121546F65
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 23:43:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKZFf02DNz3cdR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 07:43:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UUJ78u2L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=fancer.lancer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UUJ78u2L;
	dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKZDw6T8jz2xKl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 07:42:22 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id y32so442324lfa.6
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 14:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OqkE8katHiwXn3LH5XuWovC5eIjVW8Oay5GI1qwOph8=;
        b=UUJ78u2L3yQKf9hR1J21gmVpAY1TmYx70lXZ/sea0JTSQrcevmnRhebAEdmPXRPANm
         kvoGc77JpIBUsYTRseE3XwG/n3r9m/BuXGGhLGda2Twpqfgekkief3ClyL2oFZfSPeIS
         EJYPlmko2+AjDS75DIAsYoqEHXCbGH9tprJBdO0CKoD4B40FmyJVMoVbJ6pLS1C/epUa
         0dSP5TNVrMbwILc2DI11Wo/GoW0V2S6T3g38nqH2xJPu7vNX3yypUyClMZXY4WwFlYkV
         RwN2yzoQRChIwF4g4yQKocrFBUbIC6/86Ly9iTFGzVP35435zhhyQftGwLQlDfnm++ie
         04YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OqkE8katHiwXn3LH5XuWovC5eIjVW8Oay5GI1qwOph8=;
        b=K5/KfH14s+WE977Y+PVOM5FU1xam6ukAmKq8hv1kRJ8EHPmAF/kHUMWdInL1wi1L16
         YUmZAlNO1fyjabYdOfzRAcMGhejOhv9Zyl5IwfGoNFMd8YEKAd+hFA6rxrq968Va8VNV
         wMiU6xB67e2vKU5TXAAU8BoQyFjwTftHYcdJiq0TlLSLzGRFUpk0LWK5sCFW7DiwfFok
         fTBrcDyoAzBg0Z/ufsO2tqsf5ir0Qo2ACQ/g0Jrfa7CQgW+T+OefSXHaOtHlRSaNI10i
         YrnWAVjP2XarXN60ZUnpRP67xbuv7QmeXYCF2AqDvlQ0FTFCR81TBMsNVlt1M+UEfEW3
         Y1pg==
X-Gm-Message-State: AOAM5309GCnkKEGzvR5olnA2LmNrLySmCyxENAqJEhk2oNkFzfli7WoJ
	Jq1bFaB4+zj5OjkQDhZgsjQ=
X-Google-Smtp-Source: ABdhPJwVMaH9DhWqyBW9MTpDFU2N0nf7Z8d/2+bnkusFYuwweJXkXRWW+zg6vhZQPiFWLUSLstkKiQ==
X-Received: by 2002:a05:6512:c04:b0:478:f837:d813 with SMTP id z4-20020a0565120c0400b00478f837d813mr30184303lfu.17.1654897334928;
        Fri, 10 Jun 2022 14:42:14 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
        by smtp.gmail.com with ESMTPSA id o7-20020a05651238a700b0047916805548sm2299lft.242.2022.06.10.14.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 14:42:14 -0700 (PDT)
Date: Sat, 11 Jun 2022 00:42:11 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jesper Nilsson <Jesper.Nilsson@axis.com>
Subject: Re: [PATCH v4 15/18] PCI: dwc: Add dw_ prefix to the pcie_port
 structure name
Message-ID: <20220610214211.hdkg5raifyoi26cs@mobilestation>
References: <20220610082535.12802-1-Sergey.Semin@baikalelectronics.ru>
 <20220610082535.12802-16-Sergey.Semin@baikalelectronics.ru>
 <20220610141642.GJ18902@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610141642.GJ18902@axis.com>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Neil Armstrong <narmstrong@baylibre.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Binghui Wang <wangbinghui@hisilicon.com>, Frank Li <Frank.Li@nxp.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>, Alim Akhtar <alim.akhtar@samsung.com>, Jonathan Chocron <jonnyc@amazon.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>, "linux-tegra@vger.ker
 nel.org" <linux-tegra@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@axis.com>, Kishon Vijay Abraham I <kishon@ti.com>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, Rahul Tanwar <rtanwar@maxlinear.com>, Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Xiaowei Song <songxiaowei@hisilicon.com>, Greentime Hu <greentime.hu@sifive.com>, Richard Zhu <hongxing.zhu@nxp.com>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, Srikanth Thokala <srikanth.thokala@intel.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Stanimir Varbanov <svarbanov@mm-sol.com>, Yue Wang <yue.wang@Amlogic.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>, Alex
 ey Malahov <Alexey.Malahov@baikalelectronics.ru>, Min

gkai Hu <mingkai.hu@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Roy Zang <roy.zang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Heiko Stuebner <heiko@sntech.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Serge Semin <Sergey.Semin@baikalelectronics.ru>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 10, 2022 at 04:16:42PM +0200, Jesper Nilsson wrote:
> On Fri, Jun 10, 2022 at 10:25:31AM +0200, Serge Semin wrote:
> > All of the DW PCIe core driver entities have names with the dw_ prefix in
> > order to easily distinguish local and common PCIe name spaces. All except
> > the pcie_port structure which contains the DW PCIe Root Port descriptor.
> > For historical reason the structure has retained the original name since
> > commit 340cba6092c2 ("pci: Add PCIe driver for Samsung Exynos") when
> > the DW PCIe IP-core support was added to the kernel. Let's finally fix
> > that by adding the dw_ prefix to the structure name and by adding the _rp
> > suffix to be similar to the EP counterpart. Thus the name will be coherent
> > with the common driver naming policy. It shall make the driver code more
> > readable eliminating visual confusion between the local and generic PCI
> > name spaces.
> 
> Hi Serge,

Hi Jesper

> 
> I think that most variable and parameters of this type is named "pp" for "pcie_port".
> If this is the way we want to go, those should be changed also to "rp", right?

Basically you may be right, but the change you suggest is much harder
to provide and may cause additional problems I have much doubts it is
really required. One thing is to update the struct name, but a whole
another story is to change the variables definition especially across
all the platform drivers involved here and especially of such
frequently used object as the DW PCIe Root Port descriptor.

First of all what you suggest will affect much-much-much more code
lines than this one, which in its turn will eventually cause problems
with the backporting of the new patches to the older stable kernels
released before the one with the updated names. Secondly it is a
matter of a separate patch, which can be added by someone who would
think it was really required. So to speak I don't think that changing
the variable names worth it especially seeing the driver naming
convention isn't perfect at all in many other aspects like using name
"pci" of the dw_pcie structure instance.

-Sergey

> 
> /Jesper
> 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > ---
> > 
> > Changelog v4:
> > - This is a new patch created on the v4 lap of the series.
> > ---
> >  drivers/pci/controller/dwc/pci-dra7xx.c       | 12 +++----
> >  drivers/pci/controller/dwc/pci-exynos.c       |  6 ++--
> >  drivers/pci/controller/dwc/pci-imx6.c         |  6 ++--
> >  drivers/pci/controller/dwc/pci-keystone.c     | 20 +++++------
> >  drivers/pci/controller/dwc/pci-layerscape.c   |  2 +-
> >  drivers/pci/controller/dwc/pci-meson.c        |  2 +-
> >  drivers/pci/controller/dwc/pcie-al.c          |  6 ++--
> >  drivers/pci/controller/dwc/pcie-armada8k.c    |  4 +--
> >  drivers/pci/controller/dwc/pcie-artpec6.c     |  4 +--
> >  .../pci/controller/dwc/pcie-designware-host.c | 36 +++++++++----------
> >  .../pci/controller/dwc/pcie-designware-plat.c |  2 +-
> >  drivers/pci/controller/dwc/pcie-designware.h  | 30 ++++++++--------
> >  drivers/pci/controller/dwc/pcie-dw-rockchip.c |  4 +--
> >  drivers/pci/controller/dwc/pcie-fu740.c       |  2 +-
> >  drivers/pci/controller/dwc/pcie-histb.c       | 10 +++---
> >  drivers/pci/controller/dwc/pcie-intel-gw.c    |  6 ++--
> >  drivers/pci/controller/dwc/pcie-keembay.c     |  4 +--
> >  drivers/pci/controller/dwc/pcie-kirin.c       |  2 +-
> >  drivers/pci/controller/dwc/pcie-qcom.c        |  4 +--
> >  drivers/pci/controller/dwc/pcie-spear13xx.c   |  6 ++--
> >  drivers/pci/controller/dwc/pcie-tegra194.c    | 22 ++++++------
> >  drivers/pci/controller/dwc/pcie-uniphier.c    | 10 +++---
> >  drivers/pci/controller/dwc/pcie-visconti.c    |  6 ++--
> >  23 files changed, 103 insertions(+), 103 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> > index dfcdeb432dc8..a174b680b2a7 100644
> > --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> > +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> > @@ -178,7 +178,7 @@ static void dra7xx_pcie_enable_interrupts(struct dra7xx_pcie *dra7xx)
> >  	dra7xx_pcie_enable_msi_interrupts(dra7xx);
> >  }
> >  
> > -static int dra7xx_pcie_host_init(struct pcie_port *pp)
> > +static int dra7xx_pcie_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
> > @@ -202,7 +202,7 @@ static const struct irq_domain_ops intx_domain_ops = {
> >  	.xlate = pci_irqd_intx_xlate,
> >  };
> >  
> > -static int dra7xx_pcie_handle_msi(struct pcie_port *pp, int index)
> > +static int dra7xx_pcie_handle_msi(struct dw_pcie_rp *pp, int index)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	unsigned long val;
> > @@ -224,7 +224,7 @@ static int dra7xx_pcie_handle_msi(struct pcie_port *pp, int index)
> >  	return 1;
> >  }
> >  
> > -static void dra7xx_pcie_handle_msi_irq(struct pcie_port *pp)
> > +static void dra7xx_pcie_handle_msi_irq(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	int ret, i, count, num_ctrls;
> > @@ -255,8 +255,8 @@ static void dra7xx_pcie_msi_irq_handler(struct irq_desc *desc)
> >  {
> >  	struct irq_chip *chip = irq_desc_get_chip(desc);
> >  	struct dra7xx_pcie *dra7xx;
> > +	struct dw_pcie_rp *pp;
> >  	struct dw_pcie *pci;
> > -	struct pcie_port *pp;
> >  	unsigned long reg;
> >  	u32 bit;
> >  
> > @@ -344,7 +344,7 @@ static irqreturn_t dra7xx_pcie_irq_handler(int irq, void *arg)
> >  	return IRQ_HANDLED;
> >  }
> >  
> > -static int dra7xx_pcie_init_irq_domain(struct pcie_port *pp)
> > +static int dra7xx_pcie_init_irq_domain(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct device *dev = pci->dev;
> > @@ -475,7 +475,7 @@ static int dra7xx_add_pcie_port(struct dra7xx_pcie *dra7xx,
> >  {
> >  	int ret;
> >  	struct dw_pcie *pci = dra7xx->pci;
> > -	struct pcie_port *pp = &pci->pp;
> > +	struct dw_pcie_rp *pp = &pci->pp;
> >  	struct device *dev = pci->dev;
> >  
> >  	pp->irq = platform_get_irq(pdev, 1);
> > diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
> > index 467c8d1cd7e4..2044d191fba6 100644
> > --- a/drivers/pci/controller/dwc/pci-exynos.c
> > +++ b/drivers/pci/controller/dwc/pci-exynos.c
> > @@ -249,7 +249,7 @@ static int exynos_pcie_link_up(struct dw_pcie *pci)
> >  	return (val & PCIE_ELBI_XMLH_LINKUP);
> >  }
> >  
> > -static int exynos_pcie_host_init(struct pcie_port *pp)
> > +static int exynos_pcie_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct exynos_pcie *ep = to_exynos_pcie(pci);
> > @@ -276,7 +276,7 @@ static int exynos_add_pcie_port(struct exynos_pcie *ep,
> >  				       struct platform_device *pdev)
> >  {
> >  	struct dw_pcie *pci = &ep->pci;
> > -	struct pcie_port *pp = &pci->pp;
> > +	struct dw_pcie_rp *pp = &pci->pp;
> >  	struct device *dev = &pdev->dev;
> >  	int ret;
> >  
> > @@ -406,7 +406,7 @@ static int __maybe_unused exynos_pcie_resume_noirq(struct device *dev)
> >  {
> >  	struct exynos_pcie *ep = dev_get_drvdata(dev);
> >  	struct dw_pcie *pci = &ep->pci;
> > -	struct pcie_port *pp = &pci->pp;
> > +	struct dw_pcie_rp *pp = &pci->pp;
> >  	int ret;
> >  
> >  	ret = regulator_bulk_enable(ARRAY_SIZE(ep->supplies), ep->supplies);
> > diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> > index 6619e3caffe2..b562eeddb619 100644
> > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > @@ -858,7 +858,7 @@ static int imx6_pcie_start_link(struct dw_pcie *pci)
> >  	return ret;
> >  }
> >  
> > -static int imx6_pcie_host_init(struct pcie_port *pp)
> > +static int imx6_pcie_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct imx6_pcie *imx6_pcie = to_imx6_pcie(pci);
> > @@ -987,7 +987,7 @@ static int imx6_pcie_resume_noirq(struct device *dev)
> >  {
> >  	int ret;
> >  	struct imx6_pcie *imx6_pcie = dev_get_drvdata(dev);
> > -	struct pcie_port *pp = &imx6_pcie->pci->pp;
> > +	struct dw_pcie_rp *pp = &imx6_pcie->pci->pp;
> >  
> >  	if (!(imx6_pcie->drvdata->flags & IMX6_PCIE_FLAG_SUPPORTS_SUSPEND))
> >  		return 0;
> > @@ -1286,7 +1286,7 @@ static struct platform_driver imx6_pcie_driver = {
> >  static void imx6_pcie_quirk(struct pci_dev *dev)
> >  {
> >  	struct pci_bus *bus = dev->bus;
> > -	struct pcie_port *pp = bus->sysdata;
> > +	struct dw_pcie_rp *pp = bus->sysdata;
> >  
> >  	/* Bus parent is the PCI bridge, its parent is this platform driver */
> >  	if (!bus->dev.parent || !bus->dev.parent->parent)
> > diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> > index d10e5fd0f83c..c3d88aa27dd4 100644
> > --- a/drivers/pci/controller/dwc/pci-keystone.c
> > +++ b/drivers/pci/controller/dwc/pci-keystone.c
> > @@ -147,7 +147,7 @@ static void ks_pcie_app_writel(struct keystone_pcie *ks_pcie, u32 offset,
> >  
> >  static void ks_pcie_msi_irq_ack(struct irq_data *data)
> >  {
> > -	struct pcie_port *pp  = irq_data_get_irq_chip_data(data);
> > +	struct dw_pcie_rp *pp  = irq_data_get_irq_chip_data(data);
> >  	struct keystone_pcie *ks_pcie;
> >  	u32 irq = data->hwirq;
> >  	struct dw_pcie *pci;
> > @@ -167,7 +167,7 @@ static void ks_pcie_msi_irq_ack(struct irq_data *data)
> >  
> >  static void ks_pcie_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
> >  {
> > -	struct pcie_port *pp = irq_data_get_irq_chip_data(data);
> > +	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(data);
> >  	struct keystone_pcie *ks_pcie;
> >  	struct dw_pcie *pci;
> >  	u64 msi_target;
> > @@ -192,7 +192,7 @@ static int ks_pcie_msi_set_affinity(struct irq_data *irq_data,
> >  
> >  static void ks_pcie_msi_mask(struct irq_data *data)
> >  {
> > -	struct pcie_port *pp = irq_data_get_irq_chip_data(data);
> > +	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(data);
> >  	struct keystone_pcie *ks_pcie;
> >  	u32 irq = data->hwirq;
> >  	struct dw_pcie *pci;
> > @@ -216,7 +216,7 @@ static void ks_pcie_msi_mask(struct irq_data *data)
> >  
> >  static void ks_pcie_msi_unmask(struct irq_data *data)
> >  {
> > -	struct pcie_port *pp = irq_data_get_irq_chip_data(data);
> > +	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(data);
> >  	struct keystone_pcie *ks_pcie;
> >  	u32 irq = data->hwirq;
> >  	struct dw_pcie *pci;
> > @@ -247,7 +247,7 @@ static struct irq_chip ks_pcie_msi_irq_chip = {
> >  	.irq_unmask = ks_pcie_msi_unmask,
> >  };
> >  
> > -static int ks_pcie_msi_host_init(struct pcie_port *pp)
> > +static int ks_pcie_msi_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	pp->msi_irq_chip = &ks_pcie_msi_irq_chip;
> >  	return dw_pcie_allocate_domains(pp);
> > @@ -390,7 +390,7 @@ static void ks_pcie_setup_rc_app_regs(struct keystone_pcie *ks_pcie)
> >  	u32 val;
> >  	u32 num_viewport = ks_pcie->num_viewport;
> >  	struct dw_pcie *pci = ks_pcie->pci;
> > -	struct pcie_port *pp = &pci->pp;
> > +	struct dw_pcie_rp *pp = &pci->pp;
> >  	u64 start, end;
> >  	struct resource *mem;
> >  	int i;
> > @@ -428,7 +428,7 @@ static void ks_pcie_setup_rc_app_regs(struct keystone_pcie *ks_pcie)
> >  static void __iomem *ks_pcie_other_map_bus(struct pci_bus *bus,
> >  					   unsigned int devfn, int where)
> >  {
> > -	struct pcie_port *pp = bus->sysdata;
> > +	struct dw_pcie_rp *pp = bus->sysdata;
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct keystone_pcie *ks_pcie = to_keystone_pcie(pci);
> >  	u32 reg;
> > @@ -456,7 +456,7 @@ static struct pci_ops ks_child_pcie_ops = {
> >   */
> >  static int ks_pcie_v3_65_add_bus(struct pci_bus *bus)
> >  {
> > -	struct pcie_port *pp = bus->sysdata;
> > +	struct dw_pcie_rp *pp = bus->sysdata;
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct keystone_pcie *ks_pcie = to_keystone_pcie(pci);
> >  
> > @@ -574,7 +574,7 @@ static void ks_pcie_msi_irq_handler(struct irq_desc *desc)
> >  	struct keystone_pcie *ks_pcie = irq_desc_get_handler_data(desc);
> >  	u32 offset = irq - ks_pcie->msi_host_irq;
> >  	struct dw_pcie *pci = ks_pcie->pci;
> > -	struct pcie_port *pp = &pci->pp;
> > +	struct dw_pcie_rp *pp = &pci->pp;
> >  	struct device *dev = pci->dev;
> >  	struct irq_chip *chip = irq_desc_get_chip(desc);
> >  	u32 vector, reg, pos;
> > @@ -799,7 +799,7 @@ static int __init ks_pcie_init_id(struct keystone_pcie *ks_pcie)
> >  	return 0;
> >  }
> >  
> > -static int __init ks_pcie_host_init(struct pcie_port *pp)
> > +static int __init ks_pcie_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct keystone_pcie *ks_pcie = to_keystone_pcie(pci);
> > diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> > index 6a4f0619bb1c..879b8692f96a 100644
> > --- a/drivers/pci/controller/dwc/pci-layerscape.c
> > +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> > @@ -74,7 +74,7 @@ static void ls_pcie_fix_error_response(struct ls_pcie *pcie)
> >  	iowrite32(PCIE_ABSERR_SETTING, pci->dbi_base + PCIE_ABSERR);
> >  }
> >  
> > -static int ls_pcie_host_init(struct pcie_port *pp)
> > +static int ls_pcie_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct ls_pcie *pcie = to_ls_pcie(pci);
> > diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> > index f44bf347904a..c1527693bed9 100644
> > --- a/drivers/pci/controller/dwc/pci-meson.c
> > +++ b/drivers/pci/controller/dwc/pci-meson.c
> > @@ -370,7 +370,7 @@ static int meson_pcie_link_up(struct dw_pcie *pci)
> >  	return 0;
> >  }
> >  
> > -static int meson_pcie_host_init(struct pcie_port *pp)
> > +static int meson_pcie_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct meson_pcie *mp = to_meson_pcie(pci);
> > diff --git a/drivers/pci/controller/dwc/pcie-al.c b/drivers/pci/controller/dwc/pcie-al.c
> > index e8afa50129a8..b8cb77c9c4bd 100644
> > --- a/drivers/pci/controller/dwc/pcie-al.c
> > +++ b/drivers/pci/controller/dwc/pcie-al.c
> > @@ -217,7 +217,7 @@ static inline void al_pcie_target_bus_set(struct al_pcie *pcie,
> >  static void __iomem *al_pcie_conf_addr_map_bus(struct pci_bus *bus,
> >  					       unsigned int devfn, int where)
> >  {
> > -	struct pcie_port *pp = bus->sysdata;
> > +	struct dw_pcie_rp *pp = bus->sysdata;
> >  	struct al_pcie *pcie = to_al_pcie(to_dw_pcie_from_pp(pp));
> >  	unsigned int busnr = bus->number;
> >  	struct al_pcie_target_bus_cfg *target_bus_cfg = &pcie->target_bus_cfg;
> > @@ -245,7 +245,7 @@ static struct pci_ops al_child_pci_ops = {
> >  static void al_pcie_config_prepare(struct al_pcie *pcie)
> >  {
> >  	struct al_pcie_target_bus_cfg *target_bus_cfg;
> > -	struct pcie_port *pp = &pcie->pci->pp;
> > +	struct dw_pcie_rp *pp = &pcie->pci->pp;
> >  	unsigned int ecam_bus_mask;
> >  	u32 cfg_control_offset;
> >  	u8 subordinate_bus;
> > @@ -289,7 +289,7 @@ static void al_pcie_config_prepare(struct al_pcie *pcie)
> >  	al_pcie_controller_writel(pcie, cfg_control_offset, reg);
> >  }
> >  
> > -static int al_pcie_host_init(struct pcie_port *pp)
> > +static int al_pcie_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct al_pcie *pcie = to_al_pcie(pci);
> > diff --git a/drivers/pci/controller/dwc/pcie-armada8k.c b/drivers/pci/controller/dwc/pcie-armada8k.c
> > index 4e2552dcf982..8b113d3f3095 100644
> > --- a/drivers/pci/controller/dwc/pcie-armada8k.c
> > +++ b/drivers/pci/controller/dwc/pcie-armada8k.c
> > @@ -166,7 +166,7 @@ static int armada8k_pcie_start_link(struct dw_pcie *pci)
> >  	return 0;
> >  }
> >  
> > -static int armada8k_pcie_host_init(struct pcie_port *pp)
> > +static int armada8k_pcie_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	u32 reg;
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > @@ -233,7 +233,7 @@ static int armada8k_add_pcie_port(struct armada8k_pcie *pcie,
> >  				  struct platform_device *pdev)
> >  {
> >  	struct dw_pcie *pci = pcie->pci;
> > -	struct pcie_port *pp = &pci->pp;
> > +	struct dw_pcie_rp *pp = &pci->pp;
> >  	struct device *dev = &pdev->dev;
> >  	int ret;
> >  
> > diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
> > index 2f15441770e1..98102079e26d 100644
> > --- a/drivers/pci/controller/dwc/pcie-artpec6.c
> > +++ b/drivers/pci/controller/dwc/pcie-artpec6.c
> > @@ -97,7 +97,7 @@ static void artpec6_pcie_writel(struct artpec6_pcie *artpec6_pcie, u32 offset, u
> >  static u64 artpec6_pcie_cpu_addr_fixup(struct dw_pcie *pci, u64 pci_addr)
> >  {
> >  	struct artpec6_pcie *artpec6_pcie = to_artpec6_pcie(pci);
> > -	struct pcie_port *pp = &pci->pp;
> > +	struct dw_pcie_rp *pp = &pci->pp;
> >  	struct dw_pcie_ep *ep = &pci->ep;
> >  
> >  	switch (artpec6_pcie->mode) {
> > @@ -315,7 +315,7 @@ static void artpec6_pcie_deassert_core_reset(struct artpec6_pcie *artpec6_pcie)
> >  	usleep_range(100, 200);
> >  }
> >  
> > -static int artpec6_pcie_host_init(struct pcie_port *pp)
> > +static int artpec6_pcie_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct artpec6_pcie *artpec6_pcie = to_artpec6_pcie(pci);
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > index 9da600b841a7..12aa61cf7073 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > @@ -53,7 +53,7 @@ static struct msi_domain_info dw_pcie_msi_domain_info = {
> >  };
> >  
> >  /* MSI int handler */
> > -irqreturn_t dw_handle_msi_irq(struct pcie_port *pp)
> > +irqreturn_t dw_handle_msi_irq(struct dw_pcie_rp *pp)
> >  {
> >  	int i, pos;
> >  	unsigned long val;
> > @@ -88,7 +88,7 @@ irqreturn_t dw_handle_msi_irq(struct pcie_port *pp)
> >  static void dw_chained_msi_isr(struct irq_desc *desc)
> >  {
> >  	struct irq_chip *chip = irq_desc_get_chip(desc);
> > -	struct pcie_port *pp;
> > +	struct dw_pcie_rp *pp;
> >  
> >  	chained_irq_enter(chip, desc);
> >  
> > @@ -100,7 +100,7 @@ static void dw_chained_msi_isr(struct irq_desc *desc)
> >  
> >  static void dw_pci_setup_msi_msg(struct irq_data *d, struct msi_msg *msg)
> >  {
> > -	struct pcie_port *pp = irq_data_get_irq_chip_data(d);
> > +	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(d);
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	u64 msi_target;
> >  
> > @@ -123,7 +123,7 @@ static int dw_pci_msi_set_affinity(struct irq_data *d,
> >  
> >  static void dw_pci_bottom_mask(struct irq_data *d)
> >  {
> > -	struct pcie_port *pp = irq_data_get_irq_chip_data(d);
> > +	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(d);
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	unsigned int res, bit, ctrl;
> >  	unsigned long flags;
> > @@ -142,7 +142,7 @@ static void dw_pci_bottom_mask(struct irq_data *d)
> >  
> >  static void dw_pci_bottom_unmask(struct irq_data *d)
> >  {
> > -	struct pcie_port *pp = irq_data_get_irq_chip_data(d);
> > +	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(d);
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	unsigned int res, bit, ctrl;
> >  	unsigned long flags;
> > @@ -161,7 +161,7 @@ static void dw_pci_bottom_unmask(struct irq_data *d)
> >  
> >  static void dw_pci_bottom_ack(struct irq_data *d)
> >  {
> > -	struct pcie_port *pp  = irq_data_get_irq_chip_data(d);
> > +	struct dw_pcie_rp *pp  = irq_data_get_irq_chip_data(d);
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	unsigned int res, bit, ctrl;
> >  
> > @@ -185,7 +185,7 @@ static int dw_pcie_irq_domain_alloc(struct irq_domain *domain,
> >  				    unsigned int virq, unsigned int nr_irqs,
> >  				    void *args)
> >  {
> > -	struct pcie_port *pp = domain->host_data;
> > +	struct dw_pcie_rp *pp = domain->host_data;
> >  	unsigned long flags;
> >  	u32 i;
> >  	int bit;
> > @@ -213,7 +213,7 @@ static void dw_pcie_irq_domain_free(struct irq_domain *domain,
> >  				    unsigned int virq, unsigned int nr_irqs)
> >  {
> >  	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
> > -	struct pcie_port *pp = domain->host_data;
> > +	struct dw_pcie_rp *pp = domain->host_data;
> >  	unsigned long flags;
> >  
> >  	raw_spin_lock_irqsave(&pp->lock, flags);
> > @@ -229,7 +229,7 @@ static const struct irq_domain_ops dw_pcie_msi_domain_ops = {
> >  	.free	= dw_pcie_irq_domain_free,
> >  };
> >  
> > -int dw_pcie_allocate_domains(struct pcie_port *pp)
> > +int dw_pcie_allocate_domains(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct fwnode_handle *fwnode = of_node_to_fwnode(pci->dev->of_node);
> > @@ -255,7 +255,7 @@ int dw_pcie_allocate_domains(struct pcie_port *pp)
> >  	return 0;
> >  }
> >  
> > -static void dw_pcie_free_msi(struct pcie_port *pp)
> > +static void dw_pcie_free_msi(struct dw_pcie_rp *pp)
> >  {
> >  	if (pp->msi_irq)
> >  		irq_set_chained_handler_and_data(pp->msi_irq, NULL, NULL);
> > @@ -272,7 +272,7 @@ static void dw_pcie_free_msi(struct pcie_port *pp)
> >  	}
> >  }
> >  
> > -static void dw_pcie_msi_init(struct pcie_port *pp)
> > +static void dw_pcie_msi_init(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	u64 msi_target = (u64)pp->msi_data;
> > @@ -285,7 +285,7 @@ static void dw_pcie_msi_init(struct pcie_port *pp)
> >  	dw_pcie_writel_dbi(pci, PCIE_MSI_ADDR_HI, upper_32_bits(msi_target));
> >  }
> >  
> > -int dw_pcie_host_init(struct pcie_port *pp)
> > +int dw_pcie_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct device *dev = pci->dev;
> > @@ -435,7 +435,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
> >  }
> >  EXPORT_SYMBOL_GPL(dw_pcie_host_init);
> >  
> > -void dw_pcie_host_deinit(struct pcie_port *pp)
> > +void dw_pcie_host_deinit(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  
> > @@ -454,7 +454,7 @@ static void __iomem *dw_pcie_other_conf_map_bus(struct pci_bus *bus,
> >  {
> >  	int type;
> >  	u32 busdev;
> > -	struct pcie_port *pp = bus->sysdata;
> > +	struct dw_pcie_rp *pp = bus->sysdata;
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  
> >  	/*
> > @@ -486,7 +486,7 @@ static int dw_pcie_rd_other_conf(struct pci_bus *bus, unsigned int devfn,
> >  				 int where, int size, u32 *val)
> >  {
> >  	int ret;
> > -	struct pcie_port *pp = bus->sysdata;
> > +	struct dw_pcie_rp *pp = bus->sysdata;
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  
> >  	ret = pci_generic_config_read(bus, devfn, where, size, val);
> > @@ -502,7 +502,7 @@ static int dw_pcie_wr_other_conf(struct pci_bus *bus, unsigned int devfn,
> >  				 int where, int size, u32 val)
> >  {
> >  	int ret;
> > -	struct pcie_port *pp = bus->sysdata;
> > +	struct dw_pcie_rp *pp = bus->sysdata;
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  
> >  	ret = pci_generic_config_write(bus, devfn, where, size, val);
> > @@ -522,7 +522,7 @@ static struct pci_ops dw_child_pcie_ops = {
> >  
> >  void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn, int where)
> >  {
> > -	struct pcie_port *pp = bus->sysdata;
> > +	struct dw_pcie_rp *pp = bus->sysdata;
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  
> >  	if (PCI_SLOT(devfn) > 0)
> > @@ -538,7 +538,7 @@ static struct pci_ops dw_pcie_ops = {
> >  	.write = pci_generic_config_write,
> >  };
> >  
> > -void dw_pcie_setup_rc(struct pcie_port *pp)
> > +void dw_pcie_setup_rc(struct dw_pcie_rp *pp)
> >  {
> >  	u32 val, ctrl, num_ctrls;
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
> > index abf1afac6064..97de6ad7f9db 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-plat.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
> > @@ -87,7 +87,7 @@ static int dw_plat_add_pcie_port(struct dw_plat_pcie *dw_plat_pcie,
> >  				 struct platform_device *pdev)
> >  {
> >  	struct dw_pcie *pci = dw_plat_pcie->pci;
> > -	struct pcie_port *pp = &pci->pp;
> > +	struct dw_pcie_rp *pp = &pci->pp;
> >  	struct device *dev = &pdev->dev;
> >  	int ret;
> >  
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > index 13bffa3eaed6..32df3ebccf19 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > @@ -155,8 +155,8 @@
> >  #define MAX_IATU_IN			256
> >  #define MAX_IATU_OUT			256
> >  
> > -struct pcie_port;
> >  struct dw_pcie;
> > +struct dw_pcie_rp;
> >  struct dw_pcie_ep;
> >  
> >  enum dw_pcie_region_type {
> > @@ -173,11 +173,11 @@ enum dw_pcie_device_mode {
> >  };
> >  
> >  struct dw_pcie_host_ops {
> > -	int (*host_init)(struct pcie_port *pp);
> > -	int (*msi_host_init)(struct pcie_port *pp);
> > +	int (*host_init)(struct dw_pcie_rp *pp);
> > +	int (*msi_host_init)(struct dw_pcie_rp *pp);
> >  };
> >  
> > -struct pcie_port {
> > +struct dw_pcie_rp {
> >  	bool			has_msi_ctrl:1;
> >  	bool			cfg0_io_shared:1;
> >  	u64			cfg0_base;
> > @@ -267,7 +267,7 @@ struct dw_pcie {
> >  	size_t			atu_size;
> >  	u32			num_ib_windows;
> >  	u32			num_ob_windows;
> > -	struct pcie_port	pp;
> > +	struct dw_pcie_rp	pp;
> >  	struct dw_pcie_ep	ep;
> >  	const struct dw_pcie_ops *ops;
> >  	unsigned int		version;
> > @@ -380,33 +380,33 @@ static inline void dw_pcie_stop_link(struct dw_pcie *pci)
> >  }
> >  
> >  #ifdef CONFIG_PCIE_DW_HOST
> > -irqreturn_t dw_handle_msi_irq(struct pcie_port *pp);
> > -void dw_pcie_setup_rc(struct pcie_port *pp);
> > -int dw_pcie_host_init(struct pcie_port *pp);
> > -void dw_pcie_host_deinit(struct pcie_port *pp);
> > -int dw_pcie_allocate_domains(struct pcie_port *pp);
> > +irqreturn_t dw_handle_msi_irq(struct dw_pcie_rp *pp);
> > +void dw_pcie_setup_rc(struct dw_pcie_rp *pp);
> > +int dw_pcie_host_init(struct dw_pcie_rp *pp);
> > +void dw_pcie_host_deinit(struct dw_pcie_rp *pp);
> > +int dw_pcie_allocate_domains(struct dw_pcie_rp *pp);
> >  void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
> >  				       int where);
> >  #else
> > -static inline irqreturn_t dw_handle_msi_irq(struct pcie_port *pp)
> > +static inline irqreturn_t dw_handle_msi_irq(struct dw_pcie_rp *pp)
> >  {
> >  	return IRQ_NONE;
> >  }
> >  
> > -static inline void dw_pcie_setup_rc(struct pcie_port *pp)
> > +static inline void dw_pcie_setup_rc(struct dw_pcie_rp *pp)
> >  {
> >  }
> >  
> > -static inline int dw_pcie_host_init(struct pcie_port *pp)
> > +static inline int dw_pcie_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	return 0;
> >  }
> >  
> > -static inline void dw_pcie_host_deinit(struct pcie_port *pp)
> > +static inline void dw_pcie_host_deinit(struct dw_pcie_rp *pp)
> >  {
> >  }
> >  
> > -static inline int dw_pcie_allocate_domains(struct pcie_port *pp)
> > +static inline int dw_pcie_allocate_domains(struct dw_pcie_rp *pp)
> >  {
> >  	return 0;
> >  }
> > diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > index c9b341e55cbb..aeded0a58a14 100644
> > --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > @@ -107,7 +107,7 @@ static int rockchip_pcie_start_link(struct dw_pcie *pci)
> >  	return 0;
> >  }
> >  
> > -static int rockchip_pcie_host_init(struct pcie_port *pp)
> > +static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct rockchip_pcie *rockchip = to_rockchip_pcie(pci);
> > @@ -203,7 +203,7 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> >  	struct rockchip_pcie *rockchip;
> > -	struct pcie_port *pp;
> > +	struct dw_pcie_rp *pp;
> >  	int ret;
> >  
> >  	rockchip = devm_kzalloc(dev, sizeof(*rockchip), GFP_KERNEL);
> > diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
> > index 02cc70d8cc06..da059f1c9e92 100644
> > --- a/drivers/pci/controller/dwc/pcie-fu740.c
> > +++ b/drivers/pci/controller/dwc/pcie-fu740.c
> > @@ -236,7 +236,7 @@ static int fu740_pcie_start_link(struct dw_pcie *pci)
> >  	return ret;
> >  }
> >  
> > -static int fu740_pcie_host_init(struct pcie_port *pp)
> > +static int fu740_pcie_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct fu740_pcie *afp = to_fu740_pcie(pci);
> > diff --git a/drivers/pci/controller/dwc/pcie-histb.c b/drivers/pci/controller/dwc/pcie-histb.c
> > index 410555dccb6d..e2b80f10030d 100644
> > --- a/drivers/pci/controller/dwc/pcie-histb.c
> > +++ b/drivers/pci/controller/dwc/pcie-histb.c
> > @@ -74,7 +74,7 @@ static void histb_pcie_writel(struct histb_pcie *histb_pcie, u32 reg, u32 val)
> >  	writel(val, histb_pcie->ctrl + reg);
> >  }
> >  
> > -static void histb_pcie_dbi_w_mode(struct pcie_port *pp, bool enable)
> > +static void histb_pcie_dbi_w_mode(struct dw_pcie_rp *pp, bool enable)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct histb_pcie *hipcie = to_histb_pcie(pci);
> > @@ -88,7 +88,7 @@ static void histb_pcie_dbi_w_mode(struct pcie_port *pp, bool enable)
> >  	histb_pcie_writel(hipcie, PCIE_SYS_CTRL0, val);
> >  }
> >  
> > -static void histb_pcie_dbi_r_mode(struct pcie_port *pp, bool enable)
> > +static void histb_pcie_dbi_r_mode(struct dw_pcie_rp *pp, bool enable)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct histb_pcie *hipcie = to_histb_pcie(pci);
> > @@ -180,7 +180,7 @@ static int histb_pcie_start_link(struct dw_pcie *pci)
> >  	return 0;
> >  }
> >  
> > -static int histb_pcie_host_init(struct pcie_port *pp)
> > +static int histb_pcie_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct histb_pcie *hipcie = to_histb_pcie(pci);
> > @@ -219,7 +219,7 @@ static void histb_pcie_host_disable(struct histb_pcie *hipcie)
> >  		regulator_disable(hipcie->vpcie);
> >  }
> >  
> > -static int histb_pcie_host_enable(struct pcie_port *pp)
> > +static int histb_pcie_host_enable(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct histb_pcie *hipcie = to_histb_pcie(pci);
> > @@ -297,7 +297,7 @@ static int histb_pcie_probe(struct platform_device *pdev)
> >  {
> >  	struct histb_pcie *hipcie;
> >  	struct dw_pcie *pci;
> > -	struct pcie_port *pp;
> > +	struct dw_pcie_rp *pp;
> >  	struct device_node *np = pdev->dev.of_node;
> >  	struct device *dev = &pdev->dev;
> >  	enum of_gpio_flags of_flags;
> > diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
> > index 5ba144924ff8..07bc54886d71 100644
> > --- a/drivers/pci/controller/dwc/pcie-intel-gw.c
> > +++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
> > @@ -343,7 +343,7 @@ static void __intel_pcie_remove(struct intel_pcie *pcie)
> >  static int intel_pcie_remove(struct platform_device *pdev)
> >  {
> >  	struct intel_pcie *pcie = platform_get_drvdata(pdev);
> > -	struct pcie_port *pp = &pcie->pci.pp;
> > +	struct dw_pcie_rp *pp = &pcie->pci.pp;
> >  
> >  	dw_pcie_host_deinit(pp);
> >  	__intel_pcie_remove(pcie);
> > @@ -373,7 +373,7 @@ static int __maybe_unused intel_pcie_resume_noirq(struct device *dev)
> >  	return intel_pcie_host_setup(pcie);
> >  }
> >  
> > -static int intel_pcie_rc_init(struct pcie_port *pp)
> > +static int intel_pcie_rc_init(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct intel_pcie *pcie = dev_get_drvdata(pci->dev);
> > @@ -403,7 +403,7 @@ static int intel_pcie_probe(struct platform_device *pdev)
> >  	const struct intel_pcie_soc *data;
> >  	struct device *dev = &pdev->dev;
> >  	struct intel_pcie *pcie;
> > -	struct pcie_port *pp;
> > +	struct dw_pcie_rp *pp;
> >  	struct dw_pcie *pci;
> >  	int ret;
> >  
> > diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
> > index 1ac29a6eef22..58f3caf75cff 100644
> > --- a/drivers/pci/controller/dwc/pcie-keembay.c
> > +++ b/drivers/pci/controller/dwc/pcie-keembay.c
> > @@ -231,7 +231,7 @@ static void keembay_pcie_msi_irq_handler(struct irq_desc *desc)
> >  	struct keembay_pcie *pcie = irq_desc_get_handler_data(desc);
> >  	struct irq_chip *chip = irq_desc_get_chip(desc);
> >  	u32 val, mask, status;
> > -	struct pcie_port *pp;
> > +	struct dw_pcie_rp *pp;
> >  
> >  	/*
> >  	 * Keem Bay PCIe Controller provides an additional IP logic on top of
> > @@ -332,7 +332,7 @@ static int keembay_pcie_add_pcie_port(struct keembay_pcie *pcie,
> >  				      struct platform_device *pdev)
> >  {
> >  	struct dw_pcie *pci = &pcie->pci;
> > -	struct pcie_port *pp = &pci->pp;
> > +	struct dw_pcie_rp *pp = &pci->pp;
> >  	struct device *dev = &pdev->dev;
> >  	u32 val;
> >  	int ret;
> > diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
> > index a52cad269f85..7f67aad71df4 100644
> > --- a/drivers/pci/controller/dwc/pcie-kirin.c
> > +++ b/drivers/pci/controller/dwc/pcie-kirin.c
> > @@ -620,7 +620,7 @@ static int kirin_pcie_start_link(struct dw_pcie *pci)
> >  	return 0;
> >  }
> >  
> > -static int kirin_pcie_host_init(struct pcie_port *pp)
> > +static int kirin_pcie_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	pp->bridge->ops = &kirin_pci_ops;
> >  
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index 816028c0f6ed..159a81bfb209 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -1387,7 +1387,7 @@ static int qcom_pcie_config_sid_sm8250(struct qcom_pcie *pcie)
> >  	return 0;
> >  }
> >  
> > -static int qcom_pcie_host_init(struct pcie_port *pp)
> > +static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> > @@ -1563,7 +1563,7 @@ static const struct dw_pcie_ops dw_pcie_ops = {
> >  static int qcom_pcie_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > -	struct pcie_port *pp;
> > +	struct dw_pcie_rp *pp;
> >  	struct dw_pcie *pci;
> >  	struct qcom_pcie *pcie;
> >  	const struct qcom_pcie_cfg *pcie_cfg;
> > diff --git a/drivers/pci/controller/dwc/pcie-spear13xx.c b/drivers/pci/controller/dwc/pcie-spear13xx.c
> > index 1569e82b5568..7fd698da144e 100644
> > --- a/drivers/pci/controller/dwc/pcie-spear13xx.c
> > +++ b/drivers/pci/controller/dwc/pcie-spear13xx.c
> > @@ -85,7 +85,7 @@ static irqreturn_t spear13xx_pcie_irq_handler(int irq, void *arg)
> >  	struct spear13xx_pcie *spear13xx_pcie = arg;
> >  	struct pcie_app_reg __iomem *app_reg = spear13xx_pcie->app_base;
> >  	struct dw_pcie *pci = spear13xx_pcie->pci;
> > -	struct pcie_port *pp = &pci->pp;
> > +	struct dw_pcie_rp *pp = &pci->pp;
> >  	unsigned int status;
> >  
> >  	status = readl(&app_reg->int_sts);
> > @@ -121,7 +121,7 @@ static int spear13xx_pcie_link_up(struct dw_pcie *pci)
> >  	return 0;
> >  }
> >  
> > -static int spear13xx_pcie_host_init(struct pcie_port *pp)
> > +static int spear13xx_pcie_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct spear13xx_pcie *spear13xx_pcie = to_spear13xx_pcie(pci);
> > @@ -155,7 +155,7 @@ static int spear13xx_add_pcie_port(struct spear13xx_pcie *spear13xx_pcie,
> >  				   struct platform_device *pdev)
> >  {
> >  	struct dw_pcie *pci = spear13xx_pcie->pci;
> > -	struct pcie_port *pp = &pci->pp;
> > +	struct dw_pcie_rp *pp = &pci->pp;
> >  	struct device *dev = &pdev->dev;
> >  	int ret;
> >  
> > diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> > index b1b5f836a806..fd80afdd6a7a 100644
> > --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> > +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> > @@ -313,7 +313,7 @@ struct tegra_pcie_soc {
> >  	enum dw_pcie_device_mode mode;
> >  };
> >  
> > -static void apply_bad_link_workaround(struct pcie_port *pp)
> > +static void apply_bad_link_workaround(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
> > @@ -351,7 +351,7 @@ static irqreturn_t tegra_pcie_rp_irq_handler(int irq, void *arg)
> >  {
> >  	struct tegra194_pcie *pcie = arg;
> >  	struct dw_pcie *pci = &pcie->pci;
> > -	struct pcie_port *pp = &pci->pp;
> > +	struct dw_pcie_rp *pp = &pci->pp;
> >  	u32 val, tmp;
> >  	u16 val_w;
> >  
> > @@ -700,7 +700,7 @@ static inline void init_host_aspm(struct tegra194_pcie *pcie) { return; }
> >  static inline void init_debugfs(struct tegra194_pcie *pcie) { return; }
> >  #endif
> >  
> > -static void tegra_pcie_enable_system_interrupts(struct pcie_port *pp)
> > +static void tegra_pcie_enable_system_interrupts(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
> > @@ -738,7 +738,7 @@ static void tegra_pcie_enable_system_interrupts(struct pcie_port *pp)
> >  			   val_w);
> >  }
> >  
> > -static void tegra_pcie_enable_legacy_interrupts(struct pcie_port *pp)
> > +static void tegra_pcie_enable_legacy_interrupts(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
> > @@ -759,7 +759,7 @@ static void tegra_pcie_enable_legacy_interrupts(struct pcie_port *pp)
> >  	appl_writel(pcie, val, APPL_INTR_EN_L1_8_0);
> >  }
> >  
> > -static void tegra_pcie_enable_msi_interrupts(struct pcie_port *pp)
> > +static void tegra_pcie_enable_msi_interrupts(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
> > @@ -772,7 +772,7 @@ static void tegra_pcie_enable_msi_interrupts(struct pcie_port *pp)
> >  	appl_writel(pcie, val, APPL_INTR_EN_L0_0);
> >  }
> >  
> > -static void tegra_pcie_enable_interrupts(struct pcie_port *pp)
> > +static void tegra_pcie_enable_interrupts(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
> > @@ -853,7 +853,7 @@ static void config_gen3_gen4_eq_presets(struct tegra194_pcie *pcie)
> >  	dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, val);
> >  }
> >  
> > -static int tegra194_pcie_host_init(struct pcie_port *pp)
> > +static int tegra194_pcie_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
> > @@ -918,7 +918,7 @@ static int tegra194_pcie_start_link(struct dw_pcie *pci)
> >  {
> >  	u32 val, offset, speed, tmp;
> >  	struct tegra194_pcie *pcie = to_tegra_pcie(pci);
> > -	struct pcie_port *pp = &pci->pp;
> > +	struct dw_pcie_rp *pp = &pci->pp;
> >  	bool retry = true;
> >  
> >  	if (pcie->mode == DW_PCIE_EP_TYPE) {
> > @@ -1214,7 +1214,7 @@ static int tegra_pcie_bpmp_set_pll_state(struct tegra194_pcie *pcie,
> >  
> >  static void tegra_pcie_downstream_dev_to_D0(struct tegra194_pcie *pcie)
> >  {
> > -	struct pcie_port *pp = &pcie->pci.pp;
> > +	struct dw_pcie_rp *pp = &pcie->pci.pp;
> >  	struct pci_bus *child, *root_bus = NULL;
> >  	struct pci_dev *pdev;
> >  
> > @@ -1445,7 +1445,7 @@ static void tegra_pcie_unconfig_controller(struct tegra194_pcie *pcie)
> >  static int tegra_pcie_init_controller(struct tegra194_pcie *pcie)
> >  {
> >  	struct dw_pcie *pci = &pcie->pci;
> > -	struct pcie_port *pp = &pci->pp;
> > +	struct dw_pcie_rp *pp = &pci->pp;
> >  	int ret;
> >  
> >  	ret = tegra_pcie_config_controller(pcie, false);
> > @@ -1963,7 +1963,7 @@ static int tegra194_pcie_probe(struct platform_device *pdev)
> >  	struct device *dev = &pdev->dev;
> >  	struct resource *atu_dma_res;
> >  	struct tegra194_pcie *pcie;
> > -	struct pcie_port *pp;
> > +	struct dw_pcie_rp *pp;
> >  	struct dw_pcie *pci;
> >  	struct phy **phys;
> >  	char *name;
> > diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
> > index b45ac3754242..48c3eba817b4 100644
> > --- a/drivers/pci/controller/dwc/pcie-uniphier.c
> > +++ b/drivers/pci/controller/dwc/pcie-uniphier.c
> > @@ -171,7 +171,7 @@ static void uniphier_pcie_irq_enable(struct uniphier_pcie *pcie)
> >  
> >  static void uniphier_pcie_irq_mask(struct irq_data *d)
> >  {
> > -	struct pcie_port *pp = irq_data_get_irq_chip_data(d);
> > +	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(d);
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct uniphier_pcie *pcie = to_uniphier_pcie(pci);
> >  	unsigned long flags;
> > @@ -188,7 +188,7 @@ static void uniphier_pcie_irq_mask(struct irq_data *d)
> >  
> >  static void uniphier_pcie_irq_unmask(struct irq_data *d)
> >  {
> > -	struct pcie_port *pp = irq_data_get_irq_chip_data(d);
> > +	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(d);
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct uniphier_pcie *pcie = to_uniphier_pcie(pci);
> >  	unsigned long flags;
> > @@ -225,7 +225,7 @@ static const struct irq_domain_ops uniphier_intx_domain_ops = {
> >  
> >  static void uniphier_pcie_irq_handler(struct irq_desc *desc)
> >  {
> > -	struct pcie_port *pp = irq_desc_get_handler_data(desc);
> > +	struct dw_pcie_rp *pp = irq_desc_get_handler_data(desc);
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct uniphier_pcie *pcie = to_uniphier_pcie(pci);
> >  	struct irq_chip *chip = irq_desc_get_chip(desc);
> > @@ -258,7 +258,7 @@ static void uniphier_pcie_irq_handler(struct irq_desc *desc)
> >  	chained_irq_exit(chip, desc);
> >  }
> >  
> > -static int uniphier_pcie_config_legacy_irq(struct pcie_port *pp)
> > +static int uniphier_pcie_config_legacy_irq(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct uniphier_pcie *pcie = to_uniphier_pcie(pci);
> > @@ -295,7 +295,7 @@ static int uniphier_pcie_config_legacy_irq(struct pcie_port *pp)
> >  	return ret;
> >  }
> >  
> > -static int uniphier_pcie_host_init(struct pcie_port *pp)
> > +static int uniphier_pcie_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct uniphier_pcie *pcie = to_uniphier_pcie(pci);
> > diff --git a/drivers/pci/controller/dwc/pcie-visconti.c b/drivers/pci/controller/dwc/pcie-visconti.c
> > index 50f80f07e4db..71026fefa366 100644
> > --- a/drivers/pci/controller/dwc/pcie-visconti.c
> > +++ b/drivers/pci/controller/dwc/pcie-visconti.c
> > @@ -178,7 +178,7 @@ static void visconti_pcie_stop_link(struct dw_pcie *pci)
> >   */
> >  static u64 visconti_pcie_cpu_addr_fixup(struct dw_pcie *pci, u64 cpu_addr)
> >  {
> > -	struct pcie_port *pp = &pci->pp;
> > +	struct dw_pcie_rp *pp = &pci->pp;
> >  
> >  	return cpu_addr & ~pp->io_base;
> >  }
> > @@ -190,7 +190,7 @@ static const struct dw_pcie_ops dw_pcie_ops = {
> >  	.stop_link = visconti_pcie_stop_link,
> >  };
> >  
> > -static int visconti_pcie_host_init(struct pcie_port *pp)
> > +static int visconti_pcie_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct visconti_pcie *pcie = dev_get_drvdata(pci->dev);
> > @@ -278,7 +278,7 @@ static int visconti_add_pcie_port(struct visconti_pcie *pcie,
> >  				  struct platform_device *pdev)
> >  {
> >  	struct dw_pcie *pci = &pcie->pci;
> > -	struct pcie_port *pp = &pci->pp;
> > +	struct dw_pcie_rp *pp = &pci->pp;
> >  
> >  	pp->irq = platform_get_irq_byname(pdev, "intr");
> >  	if (pp->irq < 0)
> > -- 
> > 2.35.1
> > 
> 
> /^JN - Jesper Nilsson
> -- 
>                Jesper Nilsson -- jesper.nilsson@axis.com
