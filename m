Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D9227C125
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 11:29:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0vGv3fjnzDqGN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 19:29:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.21.67;
 helo=eur05-vi1-obe.outbound.protection.outlook.com;
 envelope-from=viorel.suman@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=SzWtXKig;
 dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0vDS5vy5zDq99
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 19:27:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLn7HwaCTXd3KwAe2IiYCe2Fdpci+NRfG3nKRS0uqZem5zlk07UYyDc0h8kcqJ7Nq+MpMw4ZYwZJaKBuRv1jNqfV5ngbpRljwyvKZyWMb7y5HJGdn/ZfZkyl2tGsxiwHTOLQ2qYAjE20tpMmb9q3Erog9T74VU5LaWXtpfkoQ/KfBWsRXNsQgoM0nV5A7dKiMFBvGTZxrjs6QaoAyzSCFljFypmbKW2VWvH8qHt3tWJGCBvyjY+dJpkQMZhp3cP9PNhOKLZkB0xM4JEacI7vye0H9oaY1+t3YMxJH2e+qo7Tz5bZ46ucEq3RnGp/F1qVQmELm8FmV3gJrtVeDQAyxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bi90CFMlfUn8UaER5hwAnYRfBuD0HxtlqQB2Jrmurxc=;
 b=Kobc3bJc90rcZhqo8Co13sbfi7rs596Ly9zUBdsD7newG98O26uOp2c8QLk6wL3sdBukhwstJd/T40FzQO3GHrXJwJnN9M9r6/c4zCtw4Oqq8eBDbY+JE90RmzwnD43Pir5/cT+eMv+tNarMDy+vNw1zb7fYH9/PnepO9Lcknppr+XpYt1i+XCoBhvvdbDM2I+5UJYiC3voEPCvjdaZaYxYNp9g8eFo4CDomzIdKU5+dDp8E0/vx9l6vRXCjMsGjPB4N6uVtMV/DNBDA9O8isTUmNCy1hqVp3o7w++qkJRdeNaI1HfvRQbgzuGRKXnm6bdTeaSC3xVa2BzNzNODEsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bi90CFMlfUn8UaER5hwAnYRfBuD0HxtlqQB2Jrmurxc=;
 b=SzWtXKigFnDQeQQOjJkEML2S4qrNSQZVOiLUt1Xt1Lt275AJBEdGI5Vmbk6KfoMlNrNOdj+brUeiVpX5lFEsazJEk26+Q4ej89LWCoxmWuOKOzISr5z6gQe8Xbme+iDyZy1LNbvJ6mSW61LLZ8t8SCvwjYe8rztL+7D8e7K+hns=
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR04MB4078.eurprd04.prod.outlook.com
 (2603:10a6:803:4e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Tue, 29 Sep
 2020 09:27:11 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000%6]) with mapi id 15.20.3412.029; Tue, 29 Sep 2020
 09:27:11 +0000
From: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
To: Philipp Zabel <pza@pengutronix.de>, "Viorel Suman (OSS)"
 <viorel.suman@oss.nxp.com>
Subject: RE: [PATCH v2 1/2] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
Thread-Topic: [PATCH v2 1/2] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
Thread-Index: AQHWkEqgDSS5CbAr10ON+1pXVni6nal0kbIAgArTIZA=
Date: Tue, 29 Sep 2020 09:27:11 +0000
Message-ID: <VI1PR0401MB2272760740ECAF72FA507C2C92320@VI1PR0401MB2272.eurprd04.prod.outlook.com>
References: <1600715292-28529-1-git-send-email-viorel.suman@oss.nxp.com>
 <1600715292-28529-2-git-send-email-viorel.suman@oss.nxp.com>
 <20200922120854.GA15104@pengutronix.de>
In-Reply-To: <20200922120854.GA15104@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none; pengutronix.de; dmarc=none action=none header.from=oss.nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [83.217.231.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1932d0ff-ef19-4da0-ab32-08d86459d870
x-ms-traffictypediagnostic: VI1PR04MB4078:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4078DB3FD1A4A84D7AACA8B0D3320@VI1PR04MB4078.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bYRG6SFYsHCqNrlahBu+SGpwzazOTA2pBC3gkRgOQbD2n6AwA4XjhLfIhFxTd31t+QdbJpXNwQIMpi9pQegqdO4h/DpZ9C+13EAt8lh/docU7GlBIb/ClGSzOXjUQTcH4gTP5pG2/dWKNPA1wCwpVl60mrJpZRhI/tgGy7BCGvesxiW496vhbD0LYe62qO6SD7oFRQ9Rd3jf9HnxLFf6CN5CWXfBODxKXtGJMjPjI9K0OKdORzCt5G0o5TzlhjOOf8zD3QqBxy3C1P5QdCacUJzGLJ04LAmSDj1PSanldrZ/f/nOP0Lj+MfB8oeOejNUebCPrF/54aHN4XbvK+40xtnaeVohJ4KkRz1dZ3W5frXJq5Bh2pAkmn1QOIpV5mg3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(55016002)(64756008)(66556008)(66476007)(186003)(71200400001)(66446008)(66946007)(7416002)(26005)(33656002)(2906002)(9686003)(5660300002)(8676002)(316002)(86362001)(478600001)(54906003)(76116006)(110136005)(52536014)(53546011)(6506007)(8936002)(7696005)(83380400001)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: +kRIjVNyPbo1K9MRq/QL6zna5SJK+u3XhYL0AKj3KxZ9sWw0rMtVX+ZqLsmgDOA2KoJnjLLygZyY/SMTL0UDMX9p57jY+V9FP0WDxLcZjNgGdGUHAgjq2hyIxqRC1h73VQjofXvTj8U2SFe7dZUQL0WgSZ0Ah/3yP0gU656Polz95KxqFsOMJ6zZO8L2IHDYJwQUkuqLYbij1KOf+rDjBxn/wW6qXhL8ONxK+IucRwiNuaQTR1rDUubdhZM8CG5zp10bk3tgl4YXWaaj1p54yl4nDyA5UD90o56ynuE05DeJcZYSI+i4IwWWFLj8McpHbor/2CY4acLE1MS+HqT0focIeM8Ro3iAJDXi/2GUzU6QRyauQayMz2VVb7GUkNTMGKI5oRA5UJOWtObpSFNDfN25IA9W4qMv8NVixnR5ufSylO14ISTTpkEI8IMUB5CTfHF5beJW/ldiwC/JevTQrLBtP1IAw7mHoV32+xiGePYb8P8koJCIbvIPO0pD9W5O7kcRK2XiMmkn1DAIYid/fG3Mv+Xo0vsV1oLoJdeCXhqEU6u53umwOCaSK5rPJSlbQZCYAoJMF+MX+X8YP2NZwqMKiZpvwyQgIMG2dAeEPWyJj5FLRFK9WHMjfdxfkxA211K2Hi69skFxmy+hhzy1zg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1932d0ff-ef19-4da0-ab32-08d86459d870
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2020 09:27:11.6745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ioWmrxRlZqTOPDV/bNTRNVwJQjEunBwN0PNPWYSdc8nzTMewf1uBh/SS6Q3Ad2XHNKMmsscQMluPmFWkStYdew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4078
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@gmail.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Fabio Estevam <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Philipp,

Thank you for your review, please check my comments inline.

/Viorel

> -----Original Message-----
> From: Philipp Zabel [mailto:pza@pengutronix.de]
> Sent: Tuesday, September 22, 2020 3:09 PM
> To: Viorel Suman (OSS) <viorel.suman@oss.nxp.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>; Mark Brown
> <broonie@kernel.org>; Rob Herring <robh+dt@kernel.org>; Jaroslav Kysela
> <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; Timur Tabi
> <timur@kernel.org>; Nicolin Chen <nicoleotsuka@gmail.com>; Xiubo Li
> <Xiubo.Lee@gmail.com>; Fabio Estevam <festevam@gmail.com>; Shengjiu
> Wang <shengjiu.wang@gmail.com>; Viorel Suman <viorel.suman@nxp.com>;
> Matthias Schiffer <matthias.schiffer@ew.tq-group.com>; Cosmin-Gabriel
> Samoila <cosmin.samoila@nxp.com>; alsa-devel@alsa-project.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linuxppc-
> dev@lists.ozlabs.org; dl-linux-imx <linux-imx@nxp.com>; Viorel Suman
> <viorel.suman@gmail.com>
> Subject: Re: [PATCH v2 1/2] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
>=20
> On Mon, Sep 21, 2020 at 10:08:11PM +0300, Viorel Suman (OSS) wrote:
> > From: Viorel Suman <viorel.suman@nxp.com>
> >
> > XCVR (Audio Transceiver) is a on-chip functional module found on
> > i.MX8MP. It support HDMI2.1 eARC, HDMI1.4 ARC and SPDIF.
> >
> > Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> > ---
> >  sound/soc/fsl/Kconfig    |   10 +
> >  sound/soc/fsl/Makefile   |    2 +
> >  sound/soc/fsl/fsl_xcvr.c | 1343
> > ++++++++++++++++++++++++++++++++++++++++++++++
> >  sound/soc/fsl/fsl_xcvr.h |  266 +++++++++
> >  4 files changed, 1621 insertions(+)
> >  create mode 100644 sound/soc/fsl/fsl_xcvr.c  create mode 100644
> > sound/soc/fsl/fsl_xcvr.h
> >
> > diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig index
> > 3f76ff7..d04b64d 100644
> > --- a/sound/soc/fsl/Kconfig
> > +++ b/sound/soc/fsl/Kconfig
> > @@ -95,6 +95,16 @@ config SND_SOC_FSL_EASRC
> >  	  destination sample rate. It is a new design module compare with the
> >  	  old ASRC.
> >
> > +config SND_SOC_FSL_XCVR
> > +	tristate "NXP Audio Transceiver (XCVR) module support"
> > +	select REGMAP_MMIO
> > +	select SND_SOC_IMX_PCM_DMA if SND_IMX_SOC !=3D n
> > +	select SND_SOC_GENERIC_DMAENGINE_PCM
> > +	help
> > +	  Say Y if you want to add Audio Transceiver (XCVR) support for NXP
> > +	  iMX CPUs. XCVR is a digital module that supports HDMI2.1 eARC,
> > +	  HDMI1.4 ARC and SPDIF.
> > +
> >  config SND_SOC_FSL_UTILS
> >  	tristate
> >
> > diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile index
> > b835eeb..1d2231f 100644
> > --- a/sound/soc/fsl/Makefile
> > +++ b/sound/soc/fsl/Makefile
> > @@ -25,6 +25,7 @@ snd-soc-fsl-utils-objs :=3D fsl_utils.o
> > snd-soc-fsl-dma-objs :=3D fsl_dma.o  snd-soc-fsl-mqs-objs :=3D fsl_mqs.=
o
> > snd-soc-fsl-easrc-objs :=3D fsl_easrc.o
> > +snd-soc-fsl-xcvr-objs :=3D fsl_xcvr.o
> >
> >  obj-$(CONFIG_SND_SOC_FSL_AUDMIX) +=3D snd-soc-fsl-audmix.o
> >  obj-$(CONFIG_SND_SOC_FSL_ASOC_CARD) +=3D snd-soc-fsl-asoc-card.o @@
> > -38,6 +39,7 @@ obj-$(CONFIG_SND_SOC_FSL_UTILS) +=3D snd-soc-fsl-utils.o
> >  obj-$(CONFIG_SND_SOC_FSL_MQS) +=3D snd-soc-fsl-mqs.o
> >  obj-$(CONFIG_SND_SOC_FSL_EASRC) +=3D snd-soc-fsl-easrc.o
> >  obj-$(CONFIG_SND_SOC_POWERPC_DMA) +=3D snd-soc-fsl-dma.o
> > +obj-$(CONFIG_SND_SOC_FSL_XCVR) +=3D snd-soc-fsl-xcvr.o
> >
> >  # MPC5200 Platform Support
> >  obj-$(CONFIG_SND_MPC52xx_DMA) +=3D mpc5200_dma.o diff --git
> > a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c new file mode
> > 100644 index 00000000..7391bca
> > --- /dev/null
> > +++ b/sound/soc/fsl/fsl_xcvr.c
> > @@ -0,0 +1,1343 @@
> [...]
> > +static int fsl_xcvr_probe(struct platform_device *pdev) {
> > +	struct device *dev =3D &pdev->dev;
> > +	struct device_node *np =3D dev->of_node;
> > +	const struct of_device_id *of_id;
> > +	struct fsl_xcvr *xcvr;
> > +	struct resource *ram_res, *regs_res, *rx_res, *tx_res;
> > +	void __iomem *regs;
> > +	int ret, irq;
> > +
> > +	of_id =3D of_match_device(fsl_xcvr_dt_ids, dev);
> > +	if (!of_id)
> > +		return -EINVAL;
> > +
> > +	xcvr =3D devm_kzalloc(dev, sizeof(*xcvr), GFP_KERNEL);
> > +	if (!xcvr)
> > +		return -ENOMEM;
> > +
> > +	xcvr->pdev =3D pdev;
> > +	xcvr->ipg_clk =3D devm_clk_get(dev, "ipg");
> > +	if (IS_ERR(xcvr->ipg_clk)) {
> > +		dev_err(dev, "failed to get ipg clock\n");
> > +		return PTR_ERR(xcvr->ipg_clk);
> > +	}
> > +
> > +	xcvr->phy_clk =3D devm_clk_get(dev, "phy");
> > +	if (IS_ERR(xcvr->phy_clk)) {
> > +		dev_err(dev, "failed to get phy clock\n");
> > +		return PTR_ERR(xcvr->phy_clk);
> > +	}
> > +
> > +	xcvr->spba_clk =3D devm_clk_get(dev, "spba");
> > +	if (IS_ERR(xcvr->spba_clk)) {
> > +		dev_err(dev, "failed to get spba clock\n");
> > +		return PTR_ERR(xcvr->spba_clk);
> > +	}
> > +
> > +	xcvr->pll_ipg_clk =3D devm_clk_get(dev, "pll_ipg");
> > +	if (IS_ERR(xcvr->pll_ipg_clk)) {
> > +		dev_err(dev, "failed to get pll_ipg clock\n");
> > +		return PTR_ERR(xcvr->pll_ipg_clk);
> > +	}
> > +
> > +	ram_res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> "ram");
> > +	xcvr->ram_addr =3D devm_ioremap_resource(dev, ram_res);
> > +	if (IS_ERR(xcvr->ram_addr))
> > +		return PTR_ERR(xcvr->ram_addr);
> > +
> > +	regs_res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> "regs");
> > +	regs =3D devm_ioremap_resource(dev, regs_res);
> > +	if (IS_ERR(regs))
> > +		return PTR_ERR(regs);
> > +
> > +	xcvr->regmap =3D devm_regmap_init_mmio_clk(dev, NULL, regs,
> > +						 &fsl_xcvr_regmap_cfg);
> > +	if (IS_ERR(xcvr->regmap)) {
> > +		dev_err(dev, "failed to init XCVR regmap: %ld\n",
> > +			PTR_ERR(xcvr->regmap));
> > +		return PTR_ERR(xcvr->regmap);
> > +	}
> > +
> > +	xcvr->reset =3D of_reset_control_get(np, NULL);
>=20
> Please use devm_reset_control_get_exclusive().

Done in V3.

>=20
> [...]
> > +static __maybe_unused int fsl_xcvr_runtime_resume(struct device *dev)
> > +{
> > +	struct fsl_xcvr *xcvr =3D dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret =3D clk_prepare_enable(xcvr->ipg_clk);
> > +	if (ret) {
> > +		dev_err(dev, "failed to start IPG clock.\n");
> > +		return ret;
> > +	}
> > +
> > +	ret =3D clk_prepare_enable(xcvr->pll_ipg_clk);
> > +	if (ret) {
> > +		dev_err(dev, "failed to start PLL IPG clock.\n");
> > +		goto stop_ipg_clk;
> > +	}
> > +
> > +	ret =3D clk_prepare_enable(xcvr->phy_clk);
> > +	if (ret) {
> > +		dev_err(dev, "failed to start PHY clock: %d\n", ret);
> > +		goto stop_pll_ipg_clk;
> > +	}
> > +
> > +	ret =3D clk_prepare_enable(xcvr->spba_clk);
> > +	if (ret) {
> > +		dev_err(dev, "failed to start SPBA clock.\n");
> > +		goto stop_phy_clk;
> > +	}
> > +
> > +	regcache_cache_only(xcvr->regmap, false);
> > +	regcache_mark_dirty(xcvr->regmap);
> > +	ret =3D regcache_sync(xcvr->regmap);
> > +
> > +	if (ret) {
> > +		dev_err(dev, "failed to sync regcache.\n");
> > +		goto stop_spba_clk;
> > +	}
> > +
> > +	reset_control_assert(xcvr->reset);
> > +	reset_control_deassert(xcvr->reset);
>=20
> No delay required between the two?

Not required. Just to keep things in proper context - in
V3 I moved reset_control_assert call into runtime_suspend.

/Viorel
