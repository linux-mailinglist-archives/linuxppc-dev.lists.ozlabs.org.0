Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0A126FFBC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 16:23:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtGKX5t62zDqth
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 00:23:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.7.53;
 helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=viorel.suman@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=fPvum+n4;
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70053.outbound.protection.outlook.com [40.107.7.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtGHD0mtgzDqcK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 00:21:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxQKs5t6KtU2Xj/Ilc7xpe6t8R8OkSxF9P4oxwAXJWphoQv7Y3nuUsC+NIE4pfPN9u34VHQ/oNyV9wTOTT5KynvW/jQvBQaDF2m0NYfTm2W7gHxo7wgRPwI1num5LUjC2N16s4krnNIQ10KzyVIR38du0gzv4ryvwjND1fNnHAtGJG31nzpqqRGWCafoZLk+OTF8UlPCSh4rSAqlqfr5zsKVm2mVqn1CCvlRrxMMenCb0xooYGqMGqr4ipHySIU8YQb7k5S+uESrL+99FjVB5tonldPBHhIbqVJCvDojQeHHbQlmRkqSQwmhGp4S7jbRrfFQCtJlHh9zBZFuqpMcjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kf+9JHemzgUGqRt041FNR8uy/cdOZuWl5UbLEczzYWE=;
 b=REYe5w55XlOo5LxJTz0qjTKKPVUmwLYPSGSCyFqijxTBOQEGhw8frtwpaGG6iGuyibDMny5pWVEUB46U2rl9rUKCD80SBWXzcew2vJoeby1MtNxzvO17Ru10w6madsMIHG2qkadpBz7oIW78Vs0uHRb4iOcw45D/ets5m0Hx9//wvHUHpK7x1S1L36MOSbdUqUR7/SZx/3UuF9/7bLd/zbAyCcvecMO9YiaD/dNkixxaChcHplMWex9D6P3kxdI8FYZjxv33Sw7P/OOUQO4TaAQ5vAUcB84J+2pN8hQpvrL6c75345/K562YLpHHu2PLSzdyi+THmMBSuYrp7mxGfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kf+9JHemzgUGqRt041FNR8uy/cdOZuWl5UbLEczzYWE=;
 b=fPvum+n4lBiJm1B/yO14fGuHwB4lU+dpqa6EEr2vCpkqKN52pzUQKaZBIZDxP8oEF2df9SFb6m6Au/Zk5YOVgirybMhy5YJoqeCFgpxNd8mIliNkWYLn91H+3gEK424yMxnAKQlSfhwEYuv5YeAz5IJizaMzpMeuf2Ie6tT8ZPg=
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR04MB4093.eurprd04.prod.outlook.com
 (2603:10a6:803:40::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Fri, 18 Sep
 2020 14:21:32 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000%6]) with mapi id 15.20.3391.011; Fri, 18 Sep 2020
 14:21:32 +0000
From: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>, "Viorel Suman (OSS)"
 <viorel.suman@oss.nxp.com>
Subject: RE: [PATCH 1/2] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
Thread-Topic: [PATCH 1/2] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
Thread-Index: AQHWjApN0GGys4KDOUW4RdRuflK20alsbEuAgAIJndA=
Date: Fri, 18 Sep 2020 14:21:31 +0000
Message-ID: <VI1PR0401MB2272659A8126D01D9A53F7C5923F0@VI1PR0401MB2272.eurprd04.prod.outlook.com>
References: <1600247876-8013-1-git-send-email-viorel.suman@oss.nxp.com>
 <1600247876-8013-2-git-send-email-viorel.suman@oss.nxp.com>
 <20200917071431.GA17970@Asurada-Nvidia>
In-Reply-To: <20200917071431.GA17970@Asurada-Nvidia>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.127.156.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f3ab6e4b-08c5-4814-790e-08d85bde2429
x-ms-traffictypediagnostic: VI1PR04MB4093:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4093C10CB11D4B0816A881EFD33F0@VI1PR04MB4093.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C2u1dlHvvdM3gt095OcR/sO4baFd6ojSXih93e+q6t/Q5JPE2IWJF6L9mc51fPwRhHpVPmBuQ6BjwYJeGp51a/iTLZHCDPJyt74vP5CunyM5KGrqM2GLuSYg2TzZYVASLs48yw36+zujF5xYCdy/ZVArdbogVmrqz+9mWZNOKgCPxX90BJ2xWvzST5d/QgVesQoLtFeUJ1oQ8DMTZmPM5d13J/d3Pm/nCQ99rtaGNSSg/f9M1pG07yX33pSpoKrMSekgpNOIdzIb+DERRY/xDUR1AZVRls/GvSC3jUN9AJO2moh3G0MXJLchXAbP6X6HW+mVC3sphWlQlpzjV+0oLA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(33656002)(83380400001)(66946007)(66446008)(64756008)(66556008)(66476007)(316002)(8676002)(6506007)(4326008)(7696005)(71200400001)(26005)(5660300002)(186003)(86362001)(110136005)(54906003)(76116006)(2906002)(55016002)(478600001)(9686003)(7416002)(8936002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: M4mRlQSFvpzaB6KBtk9hhHu66/7JiXb9r9yTt+kwVAyRsDt1sDYLG7FnXldIYwOOwuvk90U1hFHt5qrchUe1y3hzqtIWV+3fjw6/WzCamIhEK0yOcUD1q5HxxwBgaoH9W962kgQ8/W/WZsK7izL7GP+C8Bi3Jj8ZxQlwCMuRzF+9ESrBSBrHRNMXFX3aQgUx4SpMT2rCO7adANt6Rokf1XXRgl2l/1gHtDTSx/tuQ3PGdYGUWviBSNywHhu1EmQ4/NpyyHaMoyBRgFpv2rUQBlu5Mz725SoYPEmq5fBd0X/wHTKdGSQpnGqCelR/Dz/1qvVeHTxJlEmgD98/Nxl1Hp44UA7aarNNfSxTwR1zgFARuaeV9AroYSFBRvjMBLsoT65WUC6Dvly1W9I1/2iWWVrcA5zX7Ke2bjr/889p9iI3sJwl4dg3/nNp0WD6fpWRjnz4WIrtExtGesLX2DawMEc6CfZWdADgwh1z6+GllmxkNKdH7hffpgvwQ+9vo2zbO01G6rrsKy6m8EnS1S0QDFG/c47kiPmr//KpN4z2yH/oLd/o2HBvJHErDHCuPQIR9/FwBwFjRuk2YrQH/RJksGFsSJoDR1JQ0iEkr8oSvTI66FoQr20MAGXFGqsTLJsrk89DMcddBXWF4zH/q6rklA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ab6e4b-08c5-4814-790e-08d85bde2429
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2020 14:21:31.9960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ss/XjU7ErlcL2LdPktnZQHb3pEvD9FSAGOpOajFs2ZC5ox+8bVEAbVu2Qt8R9HqJAkTw4O80/xxucv+0+yxZOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4093
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
 Liam Girdwood <lgirdwood@gmail.com>, Viorel Suman <viorel.suman@gmail.com>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Fabio Estevam <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nicolin,

Thank you for your review.

> > +static const u32 fsl_xcvr_earc_channels[] =3D { 1, 2, 8, 16, 32, }; /*
> > +one bit 6, 12 ? */
>=20
> What's the meaning of the comments?

Just a thought noted as comment. HDMI2.1 spec defines 6- and 12-channels la=
yout when
one bit audio stream is transmitted - I was wandering how can this be enfor=
ced. Is a @todo like of comment.

>=20
> > +static const int fsl_xcvr_phy_arc_cfg[] =3D {
> > +	FSL_XCVR_PHY_CTRL_ARC_MODE_SE_EN,
> FSL_XCVR_PHY_CTRL_ARC_MODE_CM_EN,
> > +};
>=20
> Nit: better be u32 vs. int?

Yes, will fix it in v2.

>=20
> > +/** phy: true =3D> phy, false =3D> pll */ static int
> > +fsl_xcvr_ai_write(struct fsl_xcvr *xcvr, u8 reg, u32 data, bool phy)
> > +{
> > +	u32 val, idx, tidx;
> > +
> > +	idx  =3D BIT(phy ? 26 : 24);
> > +	tidx =3D BIT(phy ? 27 : 25);
> > +
> > +	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_CLR, 0xFF);
> > +	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_SET, reg);
> > +	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_WDATA, data);
> > +	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_TOG, idx);
> > +
> > +	do {
> > +		regmap_read(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL, &val);
> > +	} while ((val & idx) !=3D ((val & tidx) >> 1));
>=20
> Might regmap_read_poll_timeout() be better? And it seems to poll intentio=
nally
> with no sleep nor timeout -- would be nice to have a line of comments to =
explain
> why.

No particular reason to do it with no sleep or timeout here, will check and=
 fix it in v2.

>=20
> > > +static int fsl_xcvr_runtime_resume(struct device *dev)
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
>=20
> Should it disable ipg_clk?

Yes, thank you, will fix in v2.

>=20
> > +		return ret;
> > +	}
> > +
> > +	ret =3D clk_prepare_enable(xcvr->phy_clk);
> > +	if (ret) {
> > +		dev_err(dev, "failed to start PHY clock: %d\n", ret);
> > +		clk_disable_unprepare(xcvr->ipg_clk);
>=20
> Should it disable pll_ipg_clk?

Yes, will fix in v2.

>=20
> > +		return ret;
> > +	}
> > +
> > +	ret =3D clk_prepare_enable(xcvr->spba_clk);
> > +	if (ret) {
> > +		dev_err(dev, "failed to start SPBA clock.\n");
> > +		clk_disable_unprepare(xcvr->phy_clk);
> > +		clk_disable_unprepare(xcvr->ipg_clk);
>=20
> Ditto

Ok.

>=20
> > +		return ret;
> > +	}
> > +
> > +	regcache_cache_only(xcvr->regmap, false);
> > +	regcache_mark_dirty(xcvr->regmap);
> > +	ret =3D regcache_sync(xcvr->regmap);
> > +
> > +	if (ret) {
> > +		dev_err(dev, "failed to sync regcache.\n");
> > +		return ret;
>=20
> What about those clocks? Probably better to have some error-out labels at=
 the
> end of the function?

Make sense, will fix in v2.

>=20
> > +	}
> > +
> > +	reset_control_assert(xcvr->reset);
> > +	reset_control_deassert(xcvr->reset);
> > +
> > +	ret =3D fsl_xcvr_load_firmware(xcvr);
> > +	if (ret) {
> > +		dev_err(dev, "failed to load firmware.\n");
> > +		return ret;
>=20
> Ditto
>=20
> > +	}
> > +
> > +	/* Release M0+ reset */
> > +	ret =3D regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
> > +				 FSL_XCVR_EXT_CTRL_CORE_RESET, 0);
> > +	if (ret < 0) {
> > +		dev_err(dev, "M0+ core release failed: %d\n", ret);
> > +		return ret;
>=20
> Ditto
>=20
> > +	}
> > +	mdelay(50);
>=20
> Any reason to use mdelay over msleep for a 50ms wait? May add a line of
> comments if mdelay is a must?

No particular reason, will fix it in v2.

Thank you,
Viorel

