Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3155E77C4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 11:57:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYncj4RwZz3cfd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 19:57:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=fy0snUTp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.104.85; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=fy0snUTp;
	dkim-atps=neutral
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2085.outbound.protection.outlook.com [40.107.104.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYnbx2BSnz3c6R
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 19:56:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=na0kSsRuKOPX9caXV+XlFo1ZF55hoxAVZIBr3+AsoETV84T5nMuACdoK1U+jbDEvkFwGGAFMIYsyG1ihQiGlEA9qdNa1VYdNkfMjwIKn90UTFR35uH97yjUV9maunXYpGB3z7Xb9Epc21G6kk+SdcLvROGqLk21MUo3VMMfVFtAbp3KvIXzEpfsLurPfLv2XuNv2kM7Oug0O/mmo8Ysss/PwCx1S8TM/tqBD9iPYonq0dF6EDdFE65qGB1ur9EdYu3YSneq2i86k/qldEEg8dUFZKA5sRg1iVcIb9762hgyDKFQgBvsiKfgmm1iw8JNZNfOurxx8x1z8+zPQ2WjBbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A07iPSt4dr7WZn0qJ5FzweBarro6FnzJbDXu/QiTapw=;
 b=oBcaV1qkBo0eyN0r0Gbw5PpgN/mSjGk+9oOx1UwNy/NVWDU/vB6ClSKHVeZ3+Yy/724nd5DW81hWaKbVIxSEgocb9UCs1DOc44B9I+HC69/zADDs4H/5giZEyyj6dKbkF+gYM0IQR6My+cIv/Qmichg8MhSbEREF37kcY3fUqfW8C6WA4JT3/du6SivNY0C+cNuFlMBqzv3XDfeAhnrk9MaikY5qDYw9I4cnzLRylwQj9/VLsGQPxqPp9hUbyt0cKL00c1E2v0pACEYA8cbcJkrbmlcXKzaG5F2BuHMBGcdf5KHSBTk6Lp9gnCVvPABpiriAB4ZMaCVmvb667IpK9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A07iPSt4dr7WZn0qJ5FzweBarro6FnzJbDXu/QiTapw=;
 b=fy0snUTpGDD7Mu1weidtKHqn/HiMxut1K187oRATgMMqq35r241KYQGi+TdDO7xPVYmwZlUtiokD/MbuVTSyq8HSLmYsuBjc4vRNBke1NMcVn4zF9geQo0m4AZgQdWuYx9Yj2MwEAVlC5tj0yXUL2//ceckFHNTa1XF1oxMm2kw=
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 09:56:07 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904%4]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 09:56:07 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: Re: [PATCH v2 1/7] ASoC: dt-bindings: fsl_rpmsg: Add a property
 to assign the rpmsg channel
Thread-Topic: Re: [PATCH v2 1/7] ASoC: dt-bindings: fsl_rpmsg: Add a property
 to assign the rpmsg channel
Thread-Index: AQHYzzKzIRcLJ21/30SyeFStqUuMIg==
Date: Fri, 23 Sep 2022 09:56:07 +0000
Message-ID:  <VI1PR04MB4222BDB1378A01E99DFC6211E3519@VI1PR04MB4222.eurprd04.prod.outlook.com>
References: <20220914105145.2543646-1-chancel.liu@nxp.com>
 <20220914105145.2543646-2-chancel.liu@nxp.com>
 <20220916185048.GA1061412-robh@kernel.org>
In-Reply-To: <20220916185048.GA1061412-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB4222:EE_|VI1PR04MB6863:EE_
x-ms-office365-filtering-correlation-id: 8eeb9b13-ffbc-407c-d2ce-08da9d49d619
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  dm0r35HEz6QkYvyHee9QY1RpZSMiwIkQEY/FjrbvLJ0DhR7BVDKaUVyekT4lJ18v7VmV4bhFVHa1xf08Wb/uwMrkj1O8TFkvo19LkA90x01JV2aUVibOAUA66CGTKfznXMTUEwUBvy7qD8j4ql/ufGWlV2MxtAG7Zdejhj7EULTGDIUqJUSxqoWH38uYlzGufTmZ1vIN9wigSGhFGPZ2eTQXR8sXHIrg2Ekbtwa+UhgRyX/I2ge0K+ixczeNh+jJWmggAXe2J5lWRc4PPQF+VOG+EFmuLRvPKrWeu71rb3FFMQUL4F4x/xkipPMHTPXHfRr9kbQfk7QzUAAUINU5OSdCNqVC0LFS/9LDv0oENLuHW1gojTeamn76FdWyHpoWMo7f+R0dK8/DBe2NsaE4QpPjf6EpIgxnEhBaKy53LZhkUy19VLQiaNwM6Erva73Yv8HfEEjn3r0xZh6mb6pkDlY3WeqQkcZDYHebdyhofskreB6gCcwBkgCYcqFbVvIzc5r+aUAWeEiAiiLpiKfJn19dEB9+ks0pMMEdkTZ9bO5YZCx3zW8QgB4UHDq+mKmHzzhzym6uO4v+RFr9lsJ4FAy8N09u9vekfnhh+YuY+Xhwsy8wWv0Xhh1WE5Xl+E8mX4c54nSli1jf8rCQHWuEmaNASn9ceStEUKIzBXy1DI8UqsulXEOSyU943Vo0w5LaRBdCjoVbaV53GAf/Xf9drzPhmS2Q/YEOVfiJKRSkyQJknNtTEKasEQDKWAMCs8qb6pp2RX8E974kWdsVuENcVQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199015)(54906003)(26005)(6916009)(9686003)(2906002)(6506007)(7696005)(76116006)(186003)(66446008)(86362001)(66476007)(66946007)(4326008)(66556008)(64756008)(83380400001)(316002)(33656002)(55016003)(41300700001)(122000001)(8936002)(5660300002)(8676002)(7416002)(52536014)(38100700002)(44832011)(478600001)(38070700005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?zhFPTHMvrad2d+w3NV++4YtpTl+XtURLF2N4aw5A8/6L1Mz5rik24aw+nxFL?=
 =?us-ascii?Q?H8X+BKbWxOZl/+w4+/EwUNJTcq30GYs27oi+Jv3xs45jfRDv5hdOKfInZoVe?=
 =?us-ascii?Q?4+cD6m/6Np/+NHPWWg7IqFFm7momVhXoVLFzCxq/oitX3RihQtpwifdkU04E?=
 =?us-ascii?Q?F/C41EQZo+MevfL7871S64dSOAlkI9JnqVK8Od+h0MvCaApAHGxwBexHF6FN?=
 =?us-ascii?Q?1Dfu1VoU+wsn/6mJf3G5a7J9s5O2YJxnXssbHngrUxP4YdQEvOXiEtEAjPwP?=
 =?us-ascii?Q?vrTOFLaRLUjSL1GJE3QvsbOWrqxg6wpJqaR+ep2agVAXRFbLSc1FaZhtZtdD?=
 =?us-ascii?Q?jO5xFQuwpEABAlwNVEc6UxhF49e4Z/71Xcm1Tn0sla44qWLMuPKXUNDdehUs?=
 =?us-ascii?Q?gsmKKBbyX6sc4JknEATb9LHF/+pu2GSh8cnkfH6YXuq2avfroPnUj7CYxxrC?=
 =?us-ascii?Q?GgJFarNEKOvS5LZ6hgRmBTURXZINAL5gL+xUnys0O2eTLyRui3MQHCA7cOhF?=
 =?us-ascii?Q?4NWhHE3yfALJvaHPbwhaquE3i9BOXAf6C0AGcjHTHuasVz8O1a18FFfyVKjc?=
 =?us-ascii?Q?wLgsCv2DZVN7qfBb5VYF9cjCnfD1TLw+bXHLH1e0ye4VQ8i1DOUsPYMEVF6E?=
 =?us-ascii?Q?Ph1kgoGQ3wTDGe7Uq7ISkWmtnpP7h0MtuqL8jPs+C6WPOlaaspghUN7Ignxu?=
 =?us-ascii?Q?y8MnT3dU2jAujw+IYOZcpBiPz+w0s2ZFV74Q3WiOdMWg0cN+1oRUtMJEIDh9?=
 =?us-ascii?Q?IKQTnXkn0TTFAA/Y0m1fmdxitqGIb7mrtsVZRC9cxvt3vcMlhiJJhghDJx72?=
 =?us-ascii?Q?MGS5yp9hq3x+fur17nFiZejEjSyRRQbUgq/AP2F1kXy74z6J1dCH6DhCuWPT?=
 =?us-ascii?Q?YzsEiy44faogLj6I2Hax3ehYB3e/v+F+aS/a7ddr/kRylRP63Tn3YAHeUnxJ?=
 =?us-ascii?Q?AQPKwiRzD99RhSymIgYjj/M55Ixq6KmKX7vJk9MLUoI6E6+ZodJQ54I+E3Xy?=
 =?us-ascii?Q?kJq11peSNkPj5pFn88+zBBI2q94f5aEYqLoPwjYYEN7md91wI/rDYNodjogh?=
 =?us-ascii?Q?UVAJuc6HCdnANmbmLg8dnEyiJe3D2gA48ibBUSsXo3MpoF7Uf4OUcSU5rYDm?=
 =?us-ascii?Q?f6M6ZTHSVeUTnElzxUtl6eS2qAKQD+SmliYzmoywre082eGk6naLoeeIfAjO?=
 =?us-ascii?Q?8ojY51tkHfnyJKR2r/H8eFqqU+L2wAtrCeTK/EG2CCb7oWnDHTRHmb4Z4Ltl?=
 =?us-ascii?Q?L8J5HOpBMiuAB1lrvSEwIp7qBtj8aHzMFB3LV/Bl7SUXtMC7mObuI3ULwOLv?=
 =?us-ascii?Q?UDZ6M6oHl2SRJxyjNZTPYDpY95hPNLF58o0xSfWOaT9UIn7t7+HJYUwu59E4?=
 =?us-ascii?Q?bXXqamtTefE/K7W+ZPKBnh/1ey37yhn8p7x5vL2AqO1IMiUwmh9i7YUlyvAb?=
 =?us-ascii?Q?6kRlCzVbSBxnMVBGZISaFBec7tze1q0GYwY8i1lGyeVWSyRqzDzK11nfcSdq?=
 =?us-ascii?Q?vVrE+Xm+kZE9Pz2QDRU3RwTk4D5KzBm3FrwjJyrzWtxm1a5gEqqQQJxYEl+v?=
 =?us-ascii?Q?Vb0eskD4twcFNXDOklbGaOWyQx0FcaUTLx0YbUA4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eeb9b13-ffbc-407c-d2ce-08da9d49d619
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2022 09:56:07.5911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8qhR0PxfqGbm24lmD/5jz/C6Nbp2Drp3VGAshCDL3I2McdvCTSws264A+QSEn2oe4LEoJ6LPM2fgH49WIustzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>, "S.J. Wang" <shengjiu.wang@nxp.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tiwai@suse.com" <tiwai@suse.com>, "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "perex@perex.cz" <perex@perex.cz>, "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> > Add a string property to assign the rpmsg channel this sound card sits
> > on. It also represents the name of ASoC platform driver. This property
> > can be omitted if there is only one sound card and it sits on
> > "rpmsg-audio-channel".
> >
> > Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 37 ++++++++++++++++++-
> >  1 file changed, 35 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> > index d370c98a62c7..3744ae794c00 100644
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
> > @@ -85,6 +88,17 @@ properties:
> >        This is a boolean property. If present, the receiving function
> >        will be enabled.
> >
> > +  fsl,rpmsg-channel-name:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: |
> > +      A string property to assign rpmsg channel this sound card sits o=
n.
> > +      It also represents the name of ASoC platform driver. This proper=
ty
>=20
> That's a Linux detail which doesn't belong in DT.
>=20

We pass hardware parameters in dts node to set up clocks or other
configurations. These configurations are finally sent to Cortex-M by
rpmsg channel because Cortex-M actually controls real hardware devices.
If there's only one sound card sits on one rpmsg channel we will not
need this property. But if there are several sound cards we need to
specify correct rpmsg channel. Thus hardware configurations can be
properly sent to Cortex-M. From this level to speak, this property is
hardware-related since rpmsg channel represents the real hardware audio
controller.

Here I attach the discussion in version 1 patches for your information:
---
This property aims to tell the ASoC driver which rpmsg channel the
sound card depends on. If there are several sound cards sit on rpmsg,
we should pass correct information in dts node to specify the name of
rpmsg channel. That is why I meant to add this property.=20

Actually this property is hardware-related. As we discussed before,
this kind of sound card based on rpmsg works under this mechanism
Cortex-A core tells the Cortex-M core configuration of the PCM
parameters then Cortex-M controls real hardware devices. This property
specifying rpmsg channel represents the real hardware audio controller.
---

That's my idea adding this property. Do you have any suggstion?

Regards,=20
Chancel Liu

> > +      can be omitted if there is only one sound card and it sits on
> > +      "rpmsg-audio-channel".
> > +    enum:
> > +      - rpmsg-audio-channel
> > +      - rpmsg-micfil-channel
> > +
> >  required:
> >    - compatible
> >    - model
> > @@ -107,3 +121,22 @@ examples:
> >                   <&clk IMX8MN_AUDIO_PLL2_OUT>;
> >          clock-names =3D "ipg", "mclk", "dma", "pll8k", "pll11k";
> >      };
> > +
> > +  - |
> > +    #include <dt-bindings/clock/imx8mm-clock.h>
> > +
> > +    rpmsg_micfil: audio-controller {
> > +        compatible =3D "fsl,imx8mm-rpmsg-audio";
> > +        model =3D "micfil-audio";
> > +        fsl,rpmsg-channel-name =3D "rpmsg-micfil-channel";
> > +        fsl,enable-lpa;
> > +        fsl,rpmsg-in;
> > +        clocks =3D <&clk IMX8MM_CLK_PDM_IPG>,
> > +                 <&clk IMX8MM_CLK_PDM_ROOT>,
> > +                 <&clk IMX8MM_CLK_SDMA3_ROOT>,
> > +                 <&clk IMX8MM_AUDIO_PLL1_OUT>,
> > +                 <&clk IMX8MM_AUDIO_PLL2_OUT>;
> > +        clock-names =3D "ipg", "mclk", "dma", "pll8k", "pll11k";
> > +    };
> > +
> > +...
> > --
> > 2.25.1
> >
> >
