Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A277327012E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 17:37:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtHy24zlRzDqnZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 01:36:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.14.74;
 helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=viorel.suman@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=fDdTnKL5;
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140074.outbound.protection.outlook.com [40.107.14.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtHtk4cblzDqtl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 01:34:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1H7fzvO1Mnx13cOmbkOWMEp6tpcK4MZymWFaIcyDXxzhpF5NFzsKSfNuKyws8j210QmUcc6M4NwHJXUY4iwMn2eyigsUhlovLONbngtLVavNlOrFpCFYJzzMAqOZEY/48JKI3ZoMlvyRGpLYvY6VzwvC5lz0oXuCOEpR2HVXhU8eya64oFhC8b5uXFm8+3eO7UqP4gwdOyyghchkNRuXPzf+sJxxycs5eoYceGtvnZUazMLXdNDoy1x4W7aCiTn3P7xh0ZIY/Mi5YWYC4faBYcxLymGnPprLhnw0ziK5gXJ3zT9cK9XqJnL6fZSFSqfbXwee13Fro0QSCbES6uKsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xqk7SkV9FlCBqzb4cpkt8Puj3Xb7hkJWzlBLEcq6Jfo=;
 b=XeritZKIJn/KRyYa9TfYieUjLYb1PVjqHMOYUwv4vT616X5EprH4nSnggf/tzPLk3KpWaia4PofjjC+c0L3zKEuwU56nY/zrJxZIfP7N32zXcGfYI4nRR90QblR0RZjaYcQW9aR1LrENh0CEB1PoQwKVPgJUh4qSrFQC7kfNf3B3HqOJ0UMMv0ZHF4WVbwB5d+X6i1ZLVb78cdLYa7QGGYuZupT5rwwvGKbzML5YPOOg+li7oNEQCNp/xxgYl19DRI9hxSrnt9RndgvHAI6lzDEJok6lajERbWmSl2c3vn2S0Ctx+9lJ12x6NFb8QGSz2WAlIrs3LHl4+ztI9NALqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xqk7SkV9FlCBqzb4cpkt8Puj3Xb7hkJWzlBLEcq6Jfo=;
 b=fDdTnKL5fqW0Bw1Y9gg7Rw6BKFRwDT58n78ErD2K/hGfIbE6nVavBMf4UnxRrASFALNhdCg0u2egw7ddTF6L0cIMQQhsgKZ2E6UesV0aWRTkseKsqLzD4WiVwH0VbB1UvUcfMBUPgGvzZU3/9kDnFRg6nrMhPIykRziCXGXjJDY=
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR04MB5359.eurprd04.prod.outlook.com
 (2603:10a6:803:d1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Fri, 18 Sep
 2020 15:33:56 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000%6]) with mapi id 15.20.3391.011; Fri, 18 Sep 2020
 15:33:56 +0000
From: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>, "Viorel Suman (OSS)"
 <viorel.suman@oss.nxp.com>
Subject: RE: [PATCH 1/2] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
Thread-Topic: [PATCH 1/2] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
Thread-Index: AQHWjApN0GGys4KDOUW4RdRuflK20als26gAgAGlwnCAAATfAIAAA9/g
Date: Fri, 18 Sep 2020 15:33:56 +0000
Message-ID: <VI1PR0401MB2272D66A58EDE0E5C0C8F32D923F0@VI1PR0401MB2272.eurprd04.prod.outlook.com>
References: <1600247876-8013-1-git-send-email-viorel.suman@oss.nxp.com>
 <1600247876-8013-2-git-send-email-viorel.suman@oss.nxp.com>
 <20200917135306.GF4755@sirena.org.uk>
 <VI1PR0401MB22726CC099099547A0502C27923F0@VI1PR0401MB2272.eurprd04.prod.outlook.com>
 <20200918152004.GJ5703@sirena.org.uk>
In-Reply-To: <20200918152004.GJ5703@sirena.org.uk>
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
x-ms-office365-filtering-correlation-id: 818b1fec-2111-48e9-b3b2-08d85be841de
x-ms-traffictypediagnostic: VI1PR04MB5359:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB5359BE2F51190012598500E4D33F0@VI1PR04MB5359.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lzzAop5mmEHd8+9dqvcyPeePvKsAfjVUC4MNiAmv1P403OXSg0EAVr75Ash1puAHV/4hFKfocbdHbrOLSe4fg2EV5ePzEknD9h2x9emIDVWDhk4rjY8S9eag+fXVaNrN6YdZnR3hMfitWRJvh6jCauuapvjwVViBBPc5ywrZqamqRf+4dEfSDw2RG/6YOMaxuWfoKG+DYwpDuerA7Y4ZJZazyMX2c5kTn5SeNz5dOArrMb0Y0GrqiA6xEkaMN7nK9sABHVVAY2lmFSd5FDjnhnCmnqKMAqcX5EK+UJGaWANn7rls2vey/Q1w4s8XwjB8pTcuANlZSkGXUvgv8T/lp10Ksa6fO+0XL+5A9mksvVK0vwxXYgzkzjhXmulbK/eN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(366004)(376002)(396003)(66446008)(64756008)(4326008)(7696005)(186003)(8676002)(86362001)(33656002)(9686003)(316002)(478600001)(26005)(55016002)(6506007)(110136005)(5660300002)(54906003)(66556008)(66476007)(66946007)(7416002)(52536014)(83380400001)(71200400001)(2906002)(8936002)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 7nwAk6G7SsNmKvlMDEK8tPk7burm/+bfodLUtWn9LMU/dFuQovCsX1ilX6hUHRcrvSKG7tr0ndh7Z3qdlZhaVVtjmHeaN/+alg6R67Iwa0hO19zwOhtzIfIEiQIRsdy0CY5pTZ7dwby+dgkeu97nBCI1FSFULZvLUs79cqcP7jH4LsVASjm5MiiHjrSCRnqfLbiGS7A1psv1gpZP81+NgspdAMKo6Crk48IcNAbG2a/6qR6PyB8a1ddwLCD07yjnUMQ1Bx3teIz0HFTRn/DS4Lq9mJzNcnyuYFkslv/FB8TIzhFWdMic2POszo39YU/7hpTe8tuArtD02wsJ+QLTW6fy94ZIe5OI13p9D2TD/+fHurE5qODLsTkn9E2AafaKqnXo7l4kCPqq8UpG1+884LVM8Kep44TyhqF8XRJCP9GATN3hr4HnARxn7NuFYV18goMVhf44cZi7ItPqHZstmYtIAexLs9ysXUXBgdqY8w/XMs8D8OacBBXCqCS2A0BB5fkoVoWOeedSxUGQGJP0VE4UgSibOYiy5Hd5Ri8OTuLoEcNbVKqG86n4XcNOJk3N9hF/0tiY/Oiz2TtEnuaVqwHQiwgPWvvIB1C3HrAkurePdY4Njz4V0wjNxdK1Jyljpth73srUAyLuouEmaRIY9g==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818b1fec-2111-48e9-b3b2-08d85be841de
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2020 15:33:56.6890 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OI+7A30krELdCsKyekaIO6Gc8FTJP3ZizEuqo+HSn61P3xlr11d/XTVP9kKEisx1wOYRPYaOsHysr9+aB5TnRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5359
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

> On Fri, Sep 18, 2020 at 03:02:39PM +0000, Viorel Suman (OSS) wrote:
>=20
> Please fix your mail client to word wrap within paragraphs at something
> substantially less than 80 columns.  Doing this makes your messages much =
easier
> to read and reply to.
>=20

My bad, will do.

> > > > +	regmap_read(regmap, FSL_XCVR_EXT_ISR, &isr);
> > > > +	regmap_write(regmap, FSL_XCVR_EXT_ISR_CLR, isr);
>=20
> > > This will unconditionally clear any interrupts, even those we don't
> > > understand - it might be better to only clear bits that are
> > > supported so the IRQ core can complain if there's something unexpecte=
d
> showing up.
>=20
> > The ARM core registers itself in "fsl_xcvr_prepare" (the code below) ju=
st for a
> subset of all supported interrupts:
> > =3D=3D=3D=3D=3D
> > 	ret =3D regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
> > 				 FSL_XCVR_IRQ_EARC_ALL,
> FSL_XCVR_IRQ_EARC_ALL); =3D=3D=3D=3D=3D
> > FSL_XCVR_IRQ_EARC_ALL - this mask represents all the interrupts we are
> > interested in and we handle in interrupt handler, But this is just a su=
bset of all
> interrupts the M0+ core is able to assert. Not very intuitive, I think I =
need to
> reword it somehow.
>=20
> That's not the issue, the issue is that if we get into the ISR we just ac=
k all the bits
> that are flagged by the hardware regardless of if we actually handled the=
m.  This
> won't work if there are ever systems that share the interrupt and it work=
s
> against safety/debugging features that the interrupt has in case somethin=
g goes
> wrong and we get spurious interrupts.
>=20

Thank you for explanation, will fix it in next version.

> > > > +	if (isr & FSL_XCVR_IRQ_FIFO_UOFL_ERR)
> > > > +		dev_dbg(dev, "RX/TX FIFO full/empty\n");
>=20
> > > Should this be dev_err()?
>=20
> > The interrupt may be asserted right before DMA starts to fill the TX FI=
FO if I
> recall correctly.
> > I've added it just to debug the IP behavior, will check and change it t=
o err it in
> next version if it is the case.
>=20
> If it does come up normally then a comment or something to explain why th=
is
> happens normally would probably be good.

Sure, ok.
