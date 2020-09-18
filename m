Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B40427007F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 17:06:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtHGS54mXzDqfk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 01:06:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.5.60;
 helo=eur03-ve1-obe.outbound.protection.outlook.com;
 envelope-from=viorel.suman@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=lSAdTNuW;
 dkim-atps=neutral
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50060.outbound.protection.outlook.com [40.107.5.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtHBg40zdzDqsq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 01:02:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXBzPFuvGlOlfC4uszlhesspAHkioSZmPM+3/R5Qjy7TCpzuMIAeBoJWyvcUei1GYECiGXoH39doyfvT9qqLeWY2qEFTXliueHPoqL4OHxnKSIjeeMSdnz56u1YFar+IoRmXvB4X30PN7OHGCvTzaomiqsQbXWy8S6sJBCaxGtNh1H0Ci8FnUiL5uTLBfS5X414aQWBT8K+5piAopZGevp6O7YLyGm3qfxLyPq0at6esbkUqfLZXXxByGQ+/QfH8hbB6Za8Hd5q7/MqzQWKHW7W0v9CYb7p03B3jRk3jaOMUkl0HL02qDafK/fpwYat0NWpPI4012o1Df65MH/67Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlIeSMnCaLfY13lLi8MyZdDSzbY0QUjcI/S7uB3nCjE=;
 b=KgUjotR5QKrzhDabK6RzrgWazhH7AGw3J75lO2/SFSfw10ufdFSC+ldJxSaOf2zANB0eE2rF2KSVVbP+TDeeh8kWp2SitxFfD3MQ0wBD67JQsgtJBimWC3ovEj+cQnkPHqyUG1b+BEMlK+m/49PQ88T9tE+aMRlGtXa8SKCzjHcIjdYgjHHYz/OJ5vrrtZTTPD/pbVnc3IuVAoL/xvS8UOFnWY/m9CmImdH0krVvxVsRHYksFNfqKSoe/0q77IvyQfP1F4qpr4NoixCseQxIhyYVFzN0OtQiCZy/+NgGboECHpeeihmrWD66niC2e/mu6FE0RJKx+6nE0w68gTvPEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlIeSMnCaLfY13lLi8MyZdDSzbY0QUjcI/S7uB3nCjE=;
 b=lSAdTNuW4OGZu9Wlgz+Lon6Bd8D/6G2yq95zrTe0dtYwpOgVO19m0xVVsL4OBpRksSO1VvKLBl5SnLpzPoQWDutHDf+yaOmEvdkQKAsVm2z0VKsZVCREE8xvXgMJOJveyKOMtsUieodK2d3yERCHdkdwoMZP2j3zpUC+Dt78kf4=
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR0402MB2830.eurprd04.prod.outlook.com
 (2603:10a6:800:b2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Fri, 18 Sep
 2020 15:02:39 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000%6]) with mapi id 15.20.3391.011; Fri, 18 Sep 2020
 15:02:39 +0000
From: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>, "Viorel Suman (OSS)"
 <viorel.suman@oss.nxp.com>
Subject: RE: [PATCH 1/2] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
Thread-Topic: [PATCH 1/2] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
Thread-Index: AQHWjApN0GGys4KDOUW4RdRuflK20als26gAgAGlwnA=
Date: Fri, 18 Sep 2020 15:02:39 +0000
Message-ID: <VI1PR0401MB22726CC099099547A0502C27923F0@VI1PR0401MB2272.eurprd04.prod.outlook.com>
References: <1600247876-8013-1-git-send-email-viorel.suman@oss.nxp.com>
 <1600247876-8013-2-git-send-email-viorel.suman@oss.nxp.com>
 <20200917135306.GF4755@sirena.org.uk>
In-Reply-To: <20200917135306.GF4755@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.127.156.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 60e08e04-a83b-4479-bded-08d85be3e308
x-ms-traffictypediagnostic: VI1PR0402MB2830:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB28305697CF90C484787B4985D33F0@VI1PR0402MB2830.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4jA1ylMRLN/nYb8hkxKCZYUbyHngXL3A6DGPn9nA+jtqFgWB39Bg4Rdf0C7ffa17P0n9BDKOsnf2jVo4hja6kjmLipdRKdpyzrNJlOzsf7q/if3yt9kwO1oLXKKZkc6V+EZ9P6lH+MlL2zrV2UIgAhEH8dlmWx6XY0G1zQUbxvg1hqNb8JjdIXfTClWsPc3cRCi2PwbIPL4wNp+XwthoTV3tr/FiuqnGTgd/NbIqJ6lnSRHVjndpSdSBEf3YgmFqt7GPj+G3nE1/K6hgOvheiEhEbeu4clgS1OQQYeAsiff3eZLne1jWU+quZmsOquhs1QVJA9ee4smmqauWKU3yiw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(8936002)(86362001)(110136005)(478600001)(8676002)(4326008)(54906003)(186003)(26005)(7696005)(33656002)(83380400001)(66446008)(66476007)(66556008)(64756008)(76116006)(55016002)(66946007)(2906002)(6506007)(7416002)(52536014)(71200400001)(9686003)(5660300002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: dWzlnS8iiajnYNTUvb5raRiTcAuPN7gCQFzxyD5H556rZipidKJ4KXT1Tik3fMKK7om9FliNeBCPhBtHQagFCKTd4oPWRDQbnmMZDoEQ6AWwTw7X5tVF7PGLQJ79Vru9n7YgKzbn1aYT3Qd6qbM+iXVZHE7fJ54QfV4ym00I+aTt1uIZDnZrsYwiv0w1tlAH3K+viC0yQZIC7fLEmLv7JqRD5CyrEJPGNHtT14GexjgyLSl/ljjHwm23kh7X76nFnYj+RXCZ7HF1h3CIVoFe63mshXIo2mSmSJ7PwwjpvqZuG/uWK8fQcN6xEFe8WFkLiXdP6IBGAmoUyZ6+AabQeLME3TtOC/52Ssx14WpYvCg7tGS7UwNj0FZRAmpT52Qmy09J3kWfEMaOrrnuIiSTgsYoLxLPda9bKsId1cp2+G1JD2oQ5zCTEXG7tDia3QOPTh9C9lrjnbiSo06HDcTAyj79kMxsosZ4pgXfQjYXY2R9xJ8OEyQ2MCSlwolfXwHILhDgCMEsmIUZOdS8Q5DClsjgLVTw5Qqumagy7aHre9oLXdHIR5TltzZOBnemSZlxMakofQ6+yBdk7Al1DWGL6Z4xCllJ4Dn0GuKOy7Ob0EILgRAMQCF88/4CjvvXDnBkuONKdzc2qc35lx+W9j0DMg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e08e04-a83b-4479-bded-08d85be3e308
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2020 15:02:39.6230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BSsY4KcWaqO3TCQ5T55X5pOG6vw2AMHrr46Se5AyocJmtJy2Hxl4qs/2b+wzLqJFjbhAWQ6PJ6+QiEEzCTE3yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2830
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
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Viorel Suman <viorel.suman@gmail.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Fabio Estevam <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mark,

Thank you for your review.
=20
> On Wed, Sep 16, 2020 at 12:17:55PM +0300, Viorel Suman (OSS) wrote:
> > +static int fsl_xcvr_load_firmware(struct fsl_xcvr *xcvr) {
> > +	struct device *dev =3D &xcvr->pdev->dev;
> > +	const struct firmware *fw;
> > +	int ret =3D 0, rem, off, out, page =3D 0, size =3D FSL_XCVR_REG_OFFSE=
T;
> > +	u32 mask, val;
> > +
> > +	ret =3D request_firmware(&fw, xcvr->fw_name, dev);
> > +	if (ret) {
> > +		dev_err(dev, "failed to request firmware.\n");
> > +		return ret;
> > +	}
> > +
> > +	rem =3D fw->size;
>=20
> It would be good to see some explicit validation of the image size, at le=
ast
> printing an error message if the image is bigger than can be loaded.  The=
 code
> should be safe in that it won't overflow the device region it's writing t=
o but it
> feels like it'd be better to tell people if we spot a problem rather than=
 just silently
> truncating the file.

Make sense, will improve this part in the next version.

> > +static irqreturn_t irq0_isr(int irq, void *devid) {
> > +	struct fsl_xcvr *xcvr =3D (struct fsl_xcvr *)devid;
> > +	struct device *dev =3D &xcvr->pdev->dev;
> > +	struct regmap *regmap =3D xcvr->regmap;
> > +	void __iomem *reg_ctrl, *reg_buff;
> > +	u32 isr, val, i;
> > +
> > +	regmap_read(regmap, FSL_XCVR_EXT_ISR, &isr);
> > +	regmap_write(regmap, FSL_XCVR_EXT_ISR_CLR, isr);
>=20
> This will unconditionally clear any interrupts, even those we don't under=
stand - it
> might be better to only clear bits that are supported so the IRQ core can
> complain if there's something unexpected showing up.

The ARM core registers itself in "fsl_xcvr_prepare" (the code below) just f=
or a subset of all supported interrupts:=20
=3D=3D=3D=3D=3D
	ret =3D regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
				 FSL_XCVR_IRQ_EARC_ALL, FSL_XCVR_IRQ_EARC_ALL);
=3D=3D=3D=3D=3D
FSL_XCVR_IRQ_EARC_ALL - this mask represents all the interrupts we are inte=
rested in and we handle in interrupt handler,
But this is just a subset of all interrupts the M0+ core is able to assert.=
 Not very intuitive, I think I need to reword it somehow.

> > +	if (isr & FSL_XCVR_IRQ_FIFO_UOFL_ERR)
> > +		dev_dbg(dev, "RX/TX FIFO full/empty\n");
>=20
> Should this be dev_err()?

The interrupt may be asserted right before DMA starts to fill the TX FIFO i=
f I recall correctly.
I've added it just to debug the IP behavior, will check and change it to er=
r it in next version if it is the case.

> > +static irqreturn_t irq1_isr(int irq, void *devid) {
> > +	struct fsl_xcvr *xcvr =3D (struct fsl_xcvr *)devid;
> > +	struct device *dev =3D &xcvr->pdev->dev;
> > +
> > +	dev_dbg(dev, "irq[1]: %d\n", irq);
> > +
> > +	return IRQ_HANDLED;
> > +}
>=20
> Is there any value in even requesting this and irq2 given the lack of mea=
ningful
> handling?

No, will remove it in v2.

Thank you,
Viorel

