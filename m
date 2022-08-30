Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 702365A5BD7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:30:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGy8q2PVvz3dyM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 16:30:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=WNY9ZGx3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.20.71; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=WNY9ZGx3;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGy7L5mGPz3chv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 16:28:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaLCFKDVfDZlzYwUYQV/YUjH322/k0sSIhDNYyZuo1ju571DjIEytinj5B8ERvXEtiRMYJVHRpJoJ80A4+SwT7Yhm1QYJqEVjieIGrTiSjT6IlpOyW0/TVuoDoLyumk4LiO7igt4QGnTG3K1JmyAdB2nv52FYwosa/4RF1KaTahe7ZVlyWqKXKjL6Kn3sECDi3QLKzbQoW+Q0fI80y/kM65C1EU0m+O/sreKskVS9RXyqb6MmLTSeLUjP665Ik+Mvn+A0iDZrUbcGgrPy4T9TL8QNu5dtTx1EDe63Ao4Qz0fTe/a2z3GturwiF4jCgD+7xqCiZtTm13VJNQpF9HIJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymfPX6j+OWBEZcxVEjCrH6H9gl3THon3fAx7mHNf2jo=;
 b=PaeO/miPV17LnTXUr7taWtIsKtSjW6smBcdHo9NbnfpCvwnbNyRdlHU0KfYRmfA463wp8PrSV6ciNHOmth4mjsIAY/TNb37F7TBmtmtMeQHMG6D/B2kjWmp9cBdryQWQ/2tS/rd+WHqvHvu/tKx7+4GRwot1bgO7PeNFWUiJv4ANFlMJEpV48SXKarD7LxoaljwBFi/gcMEvrNJAMK0eTfb/7wCzlGsKbUC9fgS+gMdHpIPcEm4pxrT8uWPQOJYvalJ1kZNn0ldr/N7gXkqg7tnZr/ZFLGlTaofZ+S/NS01JnxCpQFgBjhUghURZ5sUt2QTCP7VnFg8s4pxQ5ZXtHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymfPX6j+OWBEZcxVEjCrH6H9gl3THon3fAx7mHNf2jo=;
 b=WNY9ZGx3kL6caCprq3masGR2ZDldhyvZgxNG5KfjFaeRn7BoT3ZIEL2tcgp8cE0SjJQsTlB3KOQ94iapoaQ/pbPuQ7z0v4K1Nta3WjuO9f+7kdBw4fMcmpwhMFLdhBOS1KuVystKNTdEdAyUxkUMS4oLdcHSwNS5TxaPjPVUydk=
Received: from GV1PR04MB9183.eurprd04.prod.outlook.com (2603:10a6:150:27::9)
 by HE1PR04MB3098.eurprd04.prod.outlook.com (2603:10a6:7:20::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Tue, 30 Aug
 2022 06:28:27 +0000
Received: from GV1PR04MB9183.eurprd04.prod.outlook.com
 ([fe80::28cf:2839:247c:b34e]) by GV1PR04MB9183.eurprd04.prod.outlook.com
 ([fe80::28cf:2839:247c:b34e%6]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 06:28:27 +0000
From: "S.J. Wang" <shengjiu.wang@nxp.com>
To: Chancel Liu <chancel.liu@nxp.com>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "Xiubo.Lee@gmail.com"
	<Xiubo.Lee@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>,
	"nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH 1/5] ASoC: dt-bindings: fsl_rpmsg: Add a property to
 assign platform driver name
Thread-Topic: [PATCH 1/5] ASoC: dt-bindings: fsl_rpmsg: Add a property to
 assign platform driver name
Thread-Index: AQHYu3zGgKrj+wHzzkWzPDbVUiF1Eq3G++vw
Date: Tue, 30 Aug 2022 06:28:26 +0000
Message-ID:  <GV1PR04MB91839C3B94A89F235133374AE3799@GV1PR04MB9183.eurprd04.prod.outlook.com>
References: <20220829075144.2405000-1-chancel.liu@nxp.com>
 <20220829075144.2405000-2-chancel.liu@nxp.com>
In-Reply-To: <20220829075144.2405000-2-chancel.liu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b52a81c-075d-4ae9-35c8-08da8a50d919
x-ms-traffictypediagnostic: HE1PR04MB3098:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  PcAqEkgj1luFMWeOZBjXIFe9uRyYhyl0rrgibiV8sC28UeHRz/YCeY2NcLIx4HWmRm64EswByslWE/mCcO1ZoBn1vExtUqeKBLrrWSMUJacqPaEV2OxUnITmfOsmDae1JAil/ReP87aMDbuMxvo2unAmWPa9y5dtTfJqjn4ZWxYEXJ1SFacky38kGfIICzzHFRdqNv0sz2/hwi0T50OJ27fDeSnqXfiDeDQFyNlUdNgEFkqsdsVZ3Er7iT391m7hYGh+nG0bvGBFgStXL7OZ33IjQOpKIiPREvrhzM3hA4QQpXKWUyIhdM5HWBsp/IiPbA64kf45CIi+Is1ueUkyms7U/uUrlI2HBxt3SwAImASi04wlipE4zghWgvBjG9gEsqkYIoTfUTIGkhvn1vMKgIoq4Re0SVwgogDRO3f+NgI74Bz7Q2l0N1UyVF0fcHaA8Klv+7LQR5SwMLGnM7Snzpwz/yuQ3h3HAQ+ZPYmOrfXoMseCnrGsVcZJr6Un3oxiwQ+F0/JH8YPkLcBDY2qPqjs+imJXP6/0SolUrWEOUNLNqrX33dLKDmPPuARcPRna6uZp2XtzKRJZFKz0ahEekGlTF8ZPUOWAjn49pKPjtufB5/hhjv0whXqQsk+tJyko508ZJ7/X7paqB2u6ne6XY/9JYfSCWx0NhwjJco3nU3udNtMcgRJ8zvaBL8K30KygVNH1r8FhqDvbSE9HZZEEjpEgNf8V3RcApjR38AlBhsbAJ8qqn3atsmllqNNecpfiH28Uc84N6N076QzQbMEN5Pnmjd4+ZP4ZJyCO30lWJ+E=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9183.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(9686003)(38070700005)(921005)(83380400001)(186003)(2906002)(5660300002)(66946007)(64756008)(8676002)(66476007)(76116006)(66556008)(66446008)(8936002)(52536014)(55016003)(33656002)(7416002)(316002)(110136005)(71200400001)(7696005)(41300700001)(478600001)(86362001)(6506007)(26005)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?XJC+CgdAXwMPKFJh07LagO4mqvZu3e05fn3U5yobvnLaHL+aeaWX99kcA0tC?=
 =?us-ascii?Q?UpYWxnGB6WkYQikPsvHm3YiTO2/PTO4H/0v6Y5sCYAmXDGECZWNtGMVvCBrZ?=
 =?us-ascii?Q?6q2bM6+4V9R1GCqDx3Ont4VWtO8/XbF8uWkRtfoJnqkZpVXP47pGCJOFR3MS?=
 =?us-ascii?Q?4F4PUEAMv10qacSkTG1q5NEN3c7IdCj3FuIXByctWfo2sSE+Hg/U7HB6dZIW?=
 =?us-ascii?Q?mu6TYgf84TO4QF9HoKulGBvx3S4S7odcT9ApT2JJbfdBiaF0vlG2GF+R5CEr?=
 =?us-ascii?Q?hb1NMK4cQcxSM1ua9vDd20BAh66eD+isRTXfH5fDWgAtyZB5INZktHDw+rpj?=
 =?us-ascii?Q?nmyWJZ4G7xwNpaaHsgpWSsk8m6ywLh2s3acBpP7ayzLdKdYn/mp33L7hGviU?=
 =?us-ascii?Q?2V+Fe8WdEogomgddhfYlIzpcq2kpfKutIuNQpkhYlItW9ac9CM58CA7sanBw?=
 =?us-ascii?Q?qGbLG+FgRA3MM1bTzGtZdka+9gOBUCYoMNqvqjtX6B33KTDjfm03HEF7FJSF?=
 =?us-ascii?Q?zPbi6XPdV1LMf6f52cpa6aGr11EXcap3N7kXQ7Zf2n7TVjUO1mbw8qh0WWql?=
 =?us-ascii?Q?M8ybMfjpS7OLB/SczC66K3mp+FD/ogp1iIyiF7LouMlJMR4W5x3V9pp6LYTK?=
 =?us-ascii?Q?jXkEuJ4njJkaTHq3To1jf9Yz+NNmfJX9jpx/jtnsc4WNznprjQ4eJ/sI+JHW?=
 =?us-ascii?Q?o6O+vveloAQ6fMrfqehKDebzcj8CG1yx8wlmedizF5UQDe7LCCX1ThsXR9Ky?=
 =?us-ascii?Q?hNd0RYgGfJrp4DuFod7WDfgnYczHlOsW+nrI9MUparDU4en+7iGd7bM0TSvC?=
 =?us-ascii?Q?mRYpoemviRf9jjGrrY9EoYFUoI+qFAPXpul0VGla1SMVUOFzFaIJ97ohnoM4?=
 =?us-ascii?Q?JOlmqrkM4IVImgm9ddLTKx1B8cith1ImQSkQn7YjcTQDHF6l0GqFlutEpSO0?=
 =?us-ascii?Q?xN4U+7uIIOUUOH73XRjK5gO0fbvGw8Lc0eMujbBeNjxYr+F+dnH7fmSgwSEt?=
 =?us-ascii?Q?TPJ974f+lcG5lSXwrbjPiIERpLZIJp56ND4NvjtihtQIqR+VRduiBZw0dykd?=
 =?us-ascii?Q?eA/5t8yaVK4L8+bTMe62Iscviq4ZpYl5DV85WqG5uWsYGXEz5KonVe0RT8WV?=
 =?us-ascii?Q?10uMNvlYCMOgcz8lEKUqK4fcFwurIWZ9Nh/RREdUuJF42I1Fhft9BROx+yHo?=
 =?us-ascii?Q?jRwVB67zmwbF7xDLWAyQcqEdQjojvEXTI15YoS8EyxLRCpyWFau+MR86NwXy?=
 =?us-ascii?Q?c2X6/dGCYP1dDvcbpERIxNlds3DMsXthPYChusXNDH2VsD5CY0MGe6YDr02S?=
 =?us-ascii?Q?EU91xUrXO112mNm3UUXlQUmLPfiVQcZdJUDJQqvN83Yhh8qoNA3zF5Nqe7EW?=
 =?us-ascii?Q?QDNt28B5Lof74Fm8+ko6/9e0Uu17IM7M+5XjnYXdF1v06hD3HNpCOOcIkYq/?=
 =?us-ascii?Q?mddR6Ywe63JzbqHq2c+wWi95DynampDJ9W5pw5dDhLgAC+kWmjcTGrjYqjOk?=
 =?us-ascii?Q?mzr7oEmjyo/3B76qKhE9wyxCGOLDnNew2/C45W3iidC0bnRfN217ZgqODG+z?=
 =?us-ascii?Q?bNbE4mMX2m6xv5W0wuBcRcFWuozft+qlZgeX5NQR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9183.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b52a81c-075d-4ae9-35c8-08da8a50d919
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 06:28:27.0358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B8xQaS0aeD9TwfjiPZ6SjunRO644zBsCzlXK9lHj9w4QqOvv7O4UIqioX8vmh8bP4iNvp52a7oFH0HIW+WrZPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3098
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

>=20
> Add a string property to assign ASoC platform driver name. It also repres=
ents
> the rpmsg channel this sound card sits on. This property can be omitted i=
f
> there is only one sound card and it sits on "rpmsg-audio-channel".
>=20
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 34 +++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> index d370c98a62c7..35e3cb9f768b 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> @@ -11,8 +11,11 @@ maintainers:
>=20
>  description: |
>    fsl_rpmsg is a virtual audio device. Mapping to real hardware devices
> -  are SAI, DMA controlled by Cortex M core. What we see from Linux
> -  side is a device which provides audio service by rpmsg channel.
> +  are SAI, MICFIL, DMA controlled by Cortex M core. What we see from
> + Linux side is a device which provides audio service by rpmsg channel.
> +  We can create different sound cards which access different hardwares
> + such as SAI, MICFIL, .etc through building rpmsg channels between
> + Cortex-A and Cortex-M.
>=20
>  properties:
>    compatible:
> @@ -85,6 +88,14 @@ properties:
>        This is a boolean property. If present, the receiving function
>        will be enabled.
>=20
> +  fsl,platform:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: |
> +      A string property to assign ASoC platform driver name. It also
> +      represents the rpmsg channel this sound card sits on. This propert=
y
> +      can be omitted if there is only one sound card and it sits on
> +      "rpmsg-audio-channel".

Please add enum to list supported strings.

Best regards
Wang Shengjiu
> +
>  required:
>    - compatible
>    - model
> @@ -107,3 +118,22 @@ examples:
>                   <&clk IMX8MN_AUDIO_PLL2_OUT>;
>          clock-names =3D "ipg", "mclk", "dma", "pll8k", "pll11k";
>      };
> +
> +  - |
> +    #include <dt-bindings/clock/imx8mm-clock.h>
> +
> +    rpmsg_micfil: rpmsg_micfil {
> +        compatible =3D "fsl,imx8mm-rpmsg-audio";
> +        model =3D "micfil-audio";
> +        fsl,platform =3D "rpmsg-micfil-channel";
> +        fsl,enable-lpa;
> +        fsl,rpmsg-in;
> +        clocks =3D <&clk IMX8MM_CLK_PDM_IPG>,
> +                 <&clk IMX8MM_CLK_PDM_ROOT>,
> +                 <&clk IMX8MM_CLK_SDMA3_ROOT>,
> +                 <&clk IMX8MM_AUDIO_PLL1_OUT>,
> +                 <&clk IMX8MM_AUDIO_PLL2_OUT>;
> +        clock-names =3D "ipg", "mclk", "dma", "pll8k", "pll11k";
> +    };
> +
> +...
> --
> 2.25.1

