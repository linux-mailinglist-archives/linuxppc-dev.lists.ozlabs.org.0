Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B02D35B686E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 09:15:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRZVl2TFmz3bc1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 17:15:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=K8RC7BD8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.7.49; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=K8RC7BD8;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70049.outbound.protection.outlook.com [40.107.7.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRZV25Vvkz2xfs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 17:14:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knXrqM4f30qMK2csg3XMgZ7U4CoCEEQ3Fro6jK44iXCUyi4PET5C12BEnZqCUzUQ/jsmYcPlqrDz8SRkIMbZq+sG8DmcXYOZYdlogIc2t0zE1IUhxdSKgsz+BsQFVA1zjtK1Nnzqzpdg4wNYw99gxwFUTsTpcQjDKhRkFrysZBFrwZwJMBodA2naooY/+dQGDfNUmH78V39trcXROx0eH4c05dWTSaNU4fhMbP2fastl7QlaNWF42woj4k/Y7KJ9CHywabL85YZ4KwSzgnCQ/FFdPGDrty+QPOKl9H2VK6uv38y2UJUmSrMtXfejMUZpk0LP62Osv2U+zmdBnuZ+tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydc9gJdl7v7501cCVIfGZ86/qXljI7C0u/tVYjZnu4E=;
 b=ff70kbvaJx89uaD5hvAN+C/VX01Q87lX4A2cV3le5Mca6QbJZMX7BM3+kfLU4cGOsob/YYZBUrOiwG1NbeCfYPJL6HPax7t4wfCityxkXvyOT6a8/L2aPYH195hv4EobkGX41sOwMlD5yh2i8XKuPtCvRNQ4q94gMyTvwE5C6cB+r73qhlLu8BT+gZn40s/UY8iEDlcyco4e2Rz7+mYTyLW3MEtC2pM15KifC9lHum6VkODTElFp5dZa1IPrw0NjSrmAn2noCC3Aw9joEMEDvediVWS0SXWTetWLXZoH07vqAbWjZAPUUbDSBN6WCziUcF7ZKjsJEf9IoXWY2QVCtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydc9gJdl7v7501cCVIfGZ86/qXljI7C0u/tVYjZnu4E=;
 b=K8RC7BD8EKPPqIGPNR++FU60oL9G3E3178GqDnaYxZl16kMy8P954ICWqvQzSmPZIt4j4/LjRYnC3bVnG7NUmTPPGJbfYhgiY2WZ0vjJpUzwxit+IMES67fwpsHuzKs1p/gEZbU9wEENxtCt/h4Btsv2FPSaxVUkoc5uurW1oJU=
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by PA4PR04MB7885.eurprd04.prod.outlook.com (2603:10a6:102:ce::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 07:14:28 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904%4]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 07:14:28 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"S.J. Wang" <shengjiu.wang@nxp.com>, "Xiubo.Lee@gmail.com"
	<Xiubo.Lee@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>,
	"nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: RE: Re: [PATCH 1/5] ASoC: dt-bindings: fsl_rpmsg: Add a property to
 assign platform driver name
Thread-Topic: Re: [PATCH 1/5] ASoC: dt-bindings: fsl_rpmsg: Add a property to
 assign platform driver name
Thread-Index: AdjHQCD0mhBTnN3hQxGMDdYM9+636w==
Date: Tue, 13 Sep 2022 07:14:28 +0000
Message-ID:  <VI1PR04MB4222EAA244F7A7F179E85500E3479@VI1PR04MB4222.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB4222:EE_|PA4PR04MB7885:EE_
x-ms-office365-filtering-correlation-id: f17bedda-8596-4ed9-f42c-08da955798a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  fkhrOrR9FHDflAXGjkpKNWzoN3XLknyrivf6a9j/AQZEZBaIcM0bx0LSejz2/cfo7ZpKOkZErMFY5v5n0VmOaHrFyBZxIbUHQuGMBxcPKRBfHRyUdWxBiNfxxQdDjlmHy6JcTTt72Bv3CaiCL8+LQl5u8kwRl52NkyRXmJcoAST1OgLk1zsh1PDJGE8mqF2Gs+hn5ARXdSAGwHPN6OFyu+XM390J4YD/OwayNX5JX0Jb8HDEeYnqyP4nfRkx/n+RYlinvjuSNJXgd6JXJ+Jtzkcx0mijr+ddHLOVziHb0ENpEwaC+g2nD6xaFTb9uSfD98UY9wLSp3JOiWze5q5PaorneOUrvgVv6JpqcIfBMgPmlhqWG/XDyg+ExSfUD3IfcV3CaMgQMIIyOqFmIwCl/4/cVdqmxllP2mGMoTsBJVCBAt8Vi6CcMppCn6bpC2Mxfh1t9dZMYHI8h1aeRXT94Vy7rVGVpathTUZF9xRoUF6AyqAYKmFEfklg0RNgLRUG1wmxFXGe6tOAS7dOOZ2Gi686Lc1cO3p6TcgjxlY0DQvF5FnL5PDRL6irwQU2bn3shIiyak9i5rCQqnZu/dv8sF+U+QQ4ftaNfHCLk7RPzqER4L5YTmdJU4jrIxFmZh1fTizDpijOVcay97B33+5R3lFsFE21EJz+SJiPx0d8o9qSPcqeLl0hFUElE155uwCqBvUcDCxWIPX3ewOvxlBIGTkqFo1+5DJoiAf3pFw6nqpciEuVJ4wZUEq7DdlZw/BZD4RDIMLuCfRwchNDnWty+Vbkq7QTN7P0ZCJf50a22HfZchOd1TygYJGZmzuRhjQZ
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199015)(921005)(66946007)(44832011)(110136005)(64756008)(41300700001)(122000001)(7416002)(316002)(66556008)(66446008)(52536014)(966005)(8936002)(7696005)(66476007)(86362001)(5660300002)(76116006)(33656002)(8676002)(55016003)(6506007)(26005)(71200400001)(38070700005)(38100700002)(9686003)(478600001)(186003)(83380400001)(45080400002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?FZwseoyZfsxmptrnXHE0B1U+M33FOOliV3oUWM2MeUe1kDo28CiZvtCNBade?=
 =?us-ascii?Q?vZ4D6wty7XiQIgRk9gWXoeraIHMeZWwjgUH0GmRz/DigAciuYDsPVFyBEF9X?=
 =?us-ascii?Q?fGrIx1pR0cmfgRHujX8ZLXM+0HcILQ/I511Dil5CslF3Y4CndmYpUB397RXk?=
 =?us-ascii?Q?wGk7Z9lcg08WV5xR1cRK9NmObIVZwui9kB0lQb1mdK2xliGIcfukE8eyrxgw?=
 =?us-ascii?Q?sawtzWU5N9hZLVa3RlknRBL5k1IIv/K9TzEci7QxAwUctTtqoCJsfUwXolPQ?=
 =?us-ascii?Q?b0J8tcw3UfAXAIXqnN8gxmnG2sU3eSREsWHyXncjODQeKITnJQ0UAEoZ2Heb?=
 =?us-ascii?Q?CTmtaSYZvrRK2o2Xi00HpFKDMvX768o52/N+kiKZR+8tqNIF49wqyPudlv/9?=
 =?us-ascii?Q?zrY/bfvKOxUEg/iRsTsrjp4u1I3v29f0aH2s39k8ByQjtIdaelkV57o7TvHA?=
 =?us-ascii?Q?r1SaoH2lMDoa4qHZD7nBuLsZgXkgj/RJBg9ZcAFBKU4H0tpZAfcxBYwoiWap?=
 =?us-ascii?Q?myb6BtNDdH7aRL9wHYBeF8wE7cDsYLjNZ6QoTgEN9+jeXx0aEM+/ehtCnJeH?=
 =?us-ascii?Q?eYKr/rQh8eKTQU0iIuHwHRJ5DTn2yhSDMAn3xLKInyMgpqSh2IrSTPoRQDia?=
 =?us-ascii?Q?Xs130eFtwLqQROz3eQtOmxW5lP4HPVlTXWppuRKAATrSb/cnIeXyAY9aYtha?=
 =?us-ascii?Q?E9/AHHd9DfjxZhdo66YU2nSwMxe4Ooniom5rGGa5syZSEz+huCQ+n5Nro5/K?=
 =?us-ascii?Q?gJXCWc7VFGwqxP9lrr37PwEIo0DaLWi4NEsOGtxnMrQd7HdFKR9KcEIC9iKJ?=
 =?us-ascii?Q?ZwTkJPuM2sHhKr31aj2b/2FRri2kPrEP4pBzH1tgchXFxBDrAW7Q7ClL1Ptx?=
 =?us-ascii?Q?NfB3YHYq91PusHD5yZu9fr416n28KoB9p51sTXW6QgyoW/HIA4HY1jLMUNlE?=
 =?us-ascii?Q?enP0pFJgRisqCCDgf5haOwCxR0nXyCqJ/OLCsh6fX2mscDI3unhpE0/aw+cQ?=
 =?us-ascii?Q?CYkgUoF/7v+yhusn+3TsPU0qK0OotnUjfKu9+VdWKwwljvWBlaNZxzZ6Bqwm?=
 =?us-ascii?Q?jojj9Y7GxOGzac4dEDdPWdJmqvdgwRL0QPaEyQrqu064Xb3bRJ8gzAVuX58Z?=
 =?us-ascii?Q?PyiwMsuYQkWiT53wamiVHox4vOdaj2CEhqFfw7qTgaNPVLX01F+NOHEHdbiV?=
 =?us-ascii?Q?pfu3KUXZPN7Xqq+TZ3l9KaJKtqWnyd32U/NfRpL52MofGnVeDi/MHLcspJZO?=
 =?us-ascii?Q?GFOsgoFh886zs3GlD7k5KKruICDaQEA/BKSRK7adgrxrsqPBpaVdL2yj45jf?=
 =?us-ascii?Q?jO51p6CGOk939UHy+b3MD2A0W32gQ0bhSicj0hzb96K3BaIjoQ62rYE1XJPk?=
 =?us-ascii?Q?2bhg7R56tdgCcZ7Oc/4Zt3x97nECGZ9zTuphjRo38zMJ8FnP0S7lzeebklPQ?=
 =?us-ascii?Q?NFMtQvtPzTRGPQPcCE+dLXH4S11wPeFBz+oyF4+pl5iQSfB1OpOHWOOUM35K?=
 =?us-ascii?Q?MUo+XG8WUoQhnoVHy+gMHSpgCykHaSTE0pkZJWQX6dwPqUwMwH4VQITDxn/d?=
 =?us-ascii?Q?5F/UTpzCQQZFoIQ5AcxKQWBUX5EAoQtwI9S9RCe+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17bedda-8596-4ed9-f42c-08da955798a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 07:14:28.1543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2upPLXW1y6kkRhqKj7zrncv7+dUcyOGYqwRvEsPStSkYnx+Y8KisDfzY18vEY+tfeW+YVSptLdSlzCX3Bkv9Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7885
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> > Add a string property to assign ASoC platform driver name. It also
> > represents the rpmsg channel this sound card sits on. This property
> > can be omitted if there is only one sound card and it sits on
> > "rpmsg-audio-channel".
> >
> > Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 34 +++++++++++++++++--
> >  1 file changed, 32 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> > index d370c98a62c7..35e3cb9f768b 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> > @@ -11,8 +11,11 @@ maintainers:
> >
> >  description: |
> >    fsl_rpmsg is a virtual audio device. Mapping to real hardware device=
s
> > -  are SAI, DMA controlled by Cortex M core. What we see from Linux
> > -  side is a device which provides audio service by rpmsg channel.
> > +  are SAI, MICFIL, DMA controlled by Cortex M core. What we see from
> > +  Linux side is a device which provides audio service by rpmsg channel=
.
> > +  We can create different sound cards which access different hardwares
> > +  such as SAI, MICFIL, .etc through building rpmsg channels between
> > +  Cortex-A and Cortex-M.
> >
> >  properties:
> >    compatible:
> > @@ -85,6 +88,14 @@ properties:
> >        This is a boolean property. If present, the receiving function
> >        will be enabled.
> >
> > +  fsl,platform:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: |
> > +      A string property to assign ASoC platform driver name.
>=20
> No, this is not a property of hardware. Naming of some drivers in some
> systems does not fit DTS and bindings.
>=20

This property aims to tell the ASoC driver which rpmsg channel the
sound card depends on. If there are several sound cards sit on rpmsg,
we should pass correct information in dts node to specify the name of
rpmsg channel. That is why I meant to add this property. I just want to
use a string property to distinguish different names of rpmsg channel.

Actually this property is hardware-related. As we discussed before,
this kind of sound card based on rpmsg works under this mechanism
Cortex-A core tells the Cortex-M core configuration of the PCM
parameters then Cortex-M controls real hardware devices. This property
specifying rpmsg channel represents the real hardware audio controller.

That's my idea adding this property. Do you have any better suggestion?

> > It also
> > +      represents the rpmsg channel this sound card sits on. This prope=
rty
> > +      can be omitted if there is only one sound card and it sits on
> > +      "rpmsg-audio-channel".
> > +
> >  required:
> >    - compatible
> >    - model
> > @@ -107,3 +118,22 @@ examples:
> >                   <&clk IMX8MN_AUDIO_PLL2_OUT>;
> >          clock-names =3D "ipg", "mclk", "dma", "pll8k", "pll11k";
> >      };
> > +
> > +  - |
> > +    #include <dt-bindings/clock/imx8mm-clock.h>
> > +
> > +    rpmsg_micfil: rpmsg_micfil {
>=20
> Node names should be generic.
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdevic=
etre
> e-specification.readthedocs.io%2Fen%2Flatest%2Fchapter2-devicetree-basics=
.h
> tml%23generic-names-recommendation&amp;data=3D05%7C01%7Cchancel.liu%
> 40nxp.com%7C8d5f4ca9669349c597b908da8a6a0311%7C686ea1d3bc2b4c6fa
> 92cd99c5c301635%7C0%7C0%7C637974485190445475%7CUnknown%7CTWFp
> bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6
> Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DSgDveDWfYyVYhBrG9gpi2aPgGV4j
> PwtqbQOtbaE%2FI2s%3D&amp;reserved=3D0
>=20
> Also: no underscores in node names.
>=20
> Best regards,
> Krzysztof

Thanks for your reminder. We will rename the node in patches for next
version like:

rpmsg_micfil: audio-controller {
	// property;
};

Regards,=20
Chancel Liu
