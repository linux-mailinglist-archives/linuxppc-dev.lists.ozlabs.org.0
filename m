Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E502F28CE38
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 14:19:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9ZNf1Gl7zDqV8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 23:19:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.5.47;
 helo=eur03-ve1-obe.outbound.protection.outlook.com;
 envelope-from=viorel.suman@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=UClsDhNf;
 dkim-atps=neutral
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50047.outbound.protection.outlook.com [40.107.5.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9ZJf1x9yzDqTJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 23:16:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDvr922kq3TNvOAPTECiM1Myob5eoJkmwbE3Kj8S40iqz/dL+FqtNPFN1q8t18S42wf+4Gao3BUy9LG49Q+eGlZ2U+DC94A0VWH7fS6k51wNqVmjGcAzWeqwBG4sOeymWfhCkl5Pog1pjwDZHHHR6udgtr20WUgU5nJ5AAaf9MKBthYosu7FQFhfUX59uTLQ8UeVkpN36j2D5CBuls5FP/UgJVoYxXF53Ywg4hXy6zvNecB2kmn5CzEZPRA9yjoS8XNswcUCTi49hyeH9qu9ABGu0jK95pVVF+nQ7xn8kZWY0ysOPVmqK8jrhoIfd75nvfjekfLZsQm2lihjzD3gpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvk1ZwiGLhZIHSOoNHEUshTwICGHh/afeaUyEjfiiLk=;
 b=OG4PuvYaIb8bI2Jgqvyf62BCs7EqZnaW2qeNC0RazH/sVcqTRwCouGPKZvUE5KpnQnsdhxEpzhcr1osRp8qBKd6S/XPiH2Qdt7wtJ49i1a1LVYaZh7+Ga7qKth0IxBtY18wSIS+df1qxZGWf+tDby3tArA+DZbBjJk5qkfLcEnLn0fpMfM++q9XeRmFcj90O/Mc2nooNB8s/tySbzltnhX1SDO8+kowqcY+kf/j0kVb8U9EbuxeVxdIPFHAyhYwHFlVw9r/G97eMK+Rbdi9/+Ny+rqosGWHnrC3Tf6MWcfelPl9hOM67P7yxWCS4gSqON9fA7h+BH44lfNgKZ7Ut4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvk1ZwiGLhZIHSOoNHEUshTwICGHh/afeaUyEjfiiLk=;
 b=UClsDhNfO18MJocyGFLol0gBJ9zMMfdbT1UoZdxgITxpSH7qWJr+M49UpWsrMnkeFVvykiUsmKMU3VjicHCF6jK/GnzSxgendOtwlrqIprCpEUVy8oyf9QlA0mmTND2Ewy7zp55wBWP1qO6FTti0/VUXMjEDE83YPKweKAuDoZI=
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR04MB5198.eurprd04.prod.outlook.com
 (2603:10a6:803:56::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Tue, 13 Oct
 2020 12:15:52 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000%6]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 12:15:52 +0000
From: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
To: Rob Herring <robh@kernel.org>, "Viorel Suman (OSS)"
 <viorel.suman@oss.nxp.com>
Subject: RE: [PATCH v3 2/2] ASoC: dt-bindings: fsl_xcvr: Add document for XCVR
Thread-Topic: [PATCH v3 2/2] ASoC: dt-bindings: fsl_xcvr: Add document for XCVR
Thread-Index: AQHWlkG0yVRccbzaGkOVtb/Lyfdk/amK8jIAgAqWdyA=
Date: Tue, 13 Oct 2020 12:15:52 +0000
Message-ID: <VI1PR0401MB2272C7A52819364E674BA90492040@VI1PR0401MB2272.eurprd04.prod.outlook.com>
References: <1601371167-32239-1-git-send-email-viorel.suman@oss.nxp.com>
 <1601371167-32239-3-git-send-email-viorel.suman@oss.nxp.com>
 <20201006183442.GA2591611@bogus>
In-Reply-To: <20201006183442.GA2591611@bogus>
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
x-ms-office365-filtering-correlation-id: bd60ca03-baf0-4bdd-128d-08d86f71ba6b
x-ms-traffictypediagnostic: VI1PR04MB5198:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB5198EF7A3F95497AC94C225BD3040@VI1PR04MB5198.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 713Tn/z/m4FfLCh6a4brM9A1Eu4SxUxMy/5acpjfJfGMQobmVjlaRpSE8piMyIfwvLr74OTQmnJ5MMUCPa2gt4aXM4fFPrMIaqWYJcbGV312lYeZmEOO7zkOxggSjH1ILcTFfqCuSJYO1JT4MYfbBLkQP28eNEs9npnGm+Szz2BD2EGCH1206g0lQGkIQN5HlByT+SXMwLmiFrrBKw4Ax4UrrwEmpMMOIfHkdLM0vGhjeSrxxX+PZM+sY3ILepOt8QZ/oONzJ/gtrk8EBcMh2Rx6RhkLhVa0CsM9dZjgEGCIyJtrI77fBB/pFO+67hTA1HUUo/uUSAkBztMhxEH7Dh21uWlbO4TY/+JM7x2CSWfTOiQ+ONumJGoGKRdU92mTORciDONqJDuF905MgAuHdg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(966005)(9686003)(2906002)(83380400001)(110136005)(54906003)(55016002)(26005)(7696005)(53546011)(86362001)(33656002)(71200400001)(4326008)(186003)(83080400001)(66476007)(66556008)(7416002)(498600001)(6506007)(64756008)(66946007)(52536014)(8676002)(76116006)(66446008)(8936002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ikVhjsMJS2hDHVDuScffoU1j+S0/RHeZ0T9b29T08amLxnChQlwLYR4KSAVD5TbdHaPWfN58kCdCXgx5tAd4KSsm1ZHqXCbTV/RgfTVIVXu1245gbakohPFSmZlqXSj2qM9U0cmLVQCC9XogFFWgE+iH+03pgqQ+15Qhb8Iv8AQOaWoaha+Bf7FthC5dD4ezjgznOm0om5P9aSiNYc82mupkh9pBh+MHTTPi517PgYNsdT0nfoJVhSFCYppi5mv6g3UMmKFXFnuuBYhJBHbQJZSazgbY3gESogFuYHc7wbXfbuaCur8McXxBckMtK+xQCRTJxGj86JxIjx5neWI/rzK/2zvJRMyXdaScsIbhh3WI7TTA+aR7yXddgn7hhZQSAHAA29vVerh3gw7JrMXqd73o/MNiqg9o7XFTVe6ueDrNDIk0BwNeSrU9QamZ5JqqerWvnytGFRQ2I5CtHE76TH+hVpWA2GMXjm7x1pWpaaid5IJ/Fb8t3d1tly7EMVpG/eqHaZm7Ta4UBkrywxDoncNpiHhFVe12Hu9D5SpgYHucoItFFdai4W2EUspbSrRNfIiox30niwxa7yFK12S6CR354D2429DUtebP30W1sWydS2a1Sp+3HbFvBLpS82p54Mu3aIr5Lc7Ycch4P7LHHQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd60ca03-baf0-4bdd-128d-08d86f71ba6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2020 12:15:52.1402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AaUz5gjj0FNwPPimnFRizBfMSKbvS39bKOLCFgZkPS+q7WJP1waX96AH7iRwMRP0nDQQ29VcpgRGzxT7ZvJcWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5198
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
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Viorel Suman <viorel.suman@gmail.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Fabio Estevam <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rob,

Thank you for review, fixed in V4.

/Viorel

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Tuesday, October 6, 2020 9:35 PM
> To: Viorel Suman (OSS) <viorel.suman@oss.nxp.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>; Mark Brown
> <broonie@kernel.org>; Jaroslav Kysela <perex@perex.cz>; Takashi Iwai
> <tiwai@suse.com>; Timur Tabi <timur@kernel.org>; Nicolin Chen
> <nicoleotsuka@gmail.com>; Xiubo Li <Xiubo.Lee@gmail.com>; Fabio Estevam
> <festevam@gmail.com>; Shengjiu Wang <shengjiu.wang@gmail.com>; Philipp
> Zabel <p.zabel@pengutronix.de>; Cosmin-Gabriel Samoila
> <cosmin.samoila@nxp.com>; Viorel Suman <viorel.suman@nxp.com>; Matthias
> Schiffer <matthias.schiffer@ew.tq-group.com>; alsa-devel@alsa-project.org=
;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linuxppc-
> dev@lists.ozlabs.org; dl-linux-imx <linux-imx@nxp.com>; Viorel Suman
> <viorel.suman@gmail.com>
> Subject: Re: [PATCH v3 2/2] ASoC: dt-bindings: fsl_xcvr: Add document for=
 XCVR
>=20
> On Tue, Sep 29, 2020 at 12:19:27PM +0300, Viorel Suman (OSS) wrote:
> > From: Viorel Suman <viorel.suman@nxp.com>
> >
> > XCVR (Audio Transceiver) is a new IP module found on i.MX8MP.
> >
> > Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,xcvr.yaml        | 103
> +++++++++++++++++++++
> >  1 file changed, 103 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > new file mode 100644
> > index 00000000..8abab2d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > @@ -0,0 +1,103 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/fsl,xcvr.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP Audio Transceiver (XCVR) Controller
> > +
> > +maintainers:
> > +  - Viorel Suman <viorel.suman@nxp.com>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^xcvr@.*"
> > +
> > +  compatible:
> > +    const: fsl,imx8mp-xcvr
> > +
> > +  reg:
> > +    items:
> > +      - description: 20K RAM for code and data
> > +      - description: registers space
> > +      - description: RX FIFO address
> > +      - description: TX FIFO address
> > +
> > +  reg-names:
> > +    items:
> > +      - const: ram
> > +      - const: regs
> > +      - const: rxfifo
> > +      - const: txfifo
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Peripheral clock
> > +      - description: PHY clock
> > +      - description: SPBA clock
> > +      - description: PLL clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: ipg
> > +      - const: phy
> > +      - const: spba
> > +      - const: pll_ipg
> > +
> > +  dmas:
> > +    maxItems: 2
> > +
> > +  dma-names:
> > +    items:
> > +      - const: rx
> > +      - const: tx
> > +
> > +  firmware-name:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    const: imx/xcvr/xcvr-imx8mp.bin
> > +    description: |
> > +      Should contain the name of the default firmware image
> > +      file located on the firmware search path
>=20
> We generally only have this if the name/path can't be fixed (per
> compatible) in the driver. Given you only have 1 possible value, that doe=
sn't
> seem to be the case here.
>=20
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - dmas
> > +  - dma-names
> > +  - firmware-name
> > +  - resets
>=20
> additionalProperties: false
>=20
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/imx8mp-clock.h>
> > +    #include <dt-bindings/reset/imx8mp-reset.h>
> > +
> > +    xcvr: xcvr@30cc0000 {
> > +           compatible =3D "fsl,imx8mp-xcvr";
> > +           reg =3D <0x30cc0000 0x800>,
> > +                 <0x30cc0800 0x400>,
> > +                 <0x30cc0c00 0x080>,
> > +                 <0x30cc0e00 0x080>;
> > +           reg-names =3D "ram", "regs", "rxfifo", "txfifo";
> > +           interrupts =3D <0x0 128 IRQ_TYPE_LEVEL_HIGH>;
> > +           clocks =3D <&audiomix_clk IMX8MP_CLK_AUDIOMIX_EARC_IPG>,
> > +                    <&audiomix_clk IMX8MP_CLK_AUDIOMIX_EARC_PHY>,
> > +                    <&audiomix_clk IMX8MP_CLK_AUDIOMIX_SPBA2_ROOT>,
> > +                    <&audiomix_clk IMX8MP_CLK_AUDIOMIX_AUDPLL_ROOT>;
> > +           clock-names =3D "ipg", "phy", "spba", "pll_ipg";
> > +           dmas =3D <&sdma2 30 2 0>, <&sdma2 31 2 0>;
> > +           dma-names =3D "rx", "tx";
> > +           firmware-name =3D "imx/xcvr/xcvr-imx8mp.bin";
> > +           resets =3D <&audiomix_reset 0>;
> > +    };
> > --
> > 2.7.4
> >
