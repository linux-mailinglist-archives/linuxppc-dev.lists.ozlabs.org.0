Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D689699F9C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 23:12:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHq2H3y8Vz3cjP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 09:12:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=qVKuugIE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::601; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=qVKuugIE;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0601.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHq1F4nM9z3cLs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 09:11:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYyDPwYWDzlXu6Nr+lj73/eL5XVNYu9mYxDYwvzWeNWIX3xqJsbgoV6NOWfECO/Ab1EleTUnOMAksiyeq5K8//1gJjCxWeN4zjdFUa5aQ28doCFll+R4Z6HanjC0U/Ec3GjAYOlUW/qMkjRcbeQ05AlnHJojhASgwC0Q6gAqS/3P6/lbTpIcfyqxNOIkTkevIaql6xiCJkr7eNg1lTmf/Wn3TQLg4yImRAaQngy+UE0paBSKaSPncKMRRM9IALpfB3zI4CLP8TIawy6MQXC+cZFFpHnMi9Nf/aaWe4jCea95rJDOvfI5hFuuTGHOdtcaIbLoPhVTKNKf0tAWLoT/xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9GxMXxHzaltPqAIekS5QSHZh00ALIuhFpowMw153bg=;
 b=BguD3mlv6dGD2jJRjw12vcM/AO4MsEFsnsgMzrzgMV1jA3GBfxYA0ssg7nlyW4lgXhcqEH5elBiHQMMTvzYuMyRKHcKKxHQ1JYkTBGivOaDOboUWVsCvMJD4FpRfWNtji+7UpErG5+BuOD0FCXs2+2vNXSNG3mJDsmKbZSHZcI2nNPqb+32kzfWu6Ic/twDrj8KJ64TfmefumGjC9dN3FL2yFpw/NCqDqJNuWp6f23GtUNa0DosmL9c47Y9RE7WFgrqdMZYMBJ9Iza68q7In90FYwSknS9PZgBfaEHUdpI7YVgnuaoit1fj4YrbYWKp+SsW1KulNwAntX8GNaZ0qPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9GxMXxHzaltPqAIekS5QSHZh00ALIuhFpowMw153bg=;
 b=qVKuugIEg9hMQJdi7yUzZOxUbb6u2j9X0LRa/yuqoxO6/2dQ8r8swcqsD6ck1x8tgnLR+8BLt/ZCY31YjlNRjL9hARXGrvmAGXI6EpQ1pVF7mVjt47JeNsQtXSoUpY6Sgn4CDWRXeakCbtPsw7uA7VLt1TP8CZkmb3j0JATeFb8=
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com (2603:10a6:208:145::23)
 by DU2PR04MB8693.eurprd04.prod.outlook.com (2603:10a6:10:2dc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.14; Thu, 16 Feb
 2023 22:11:35 +0000
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::509:96a2:4382:6b51]) by AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::509:96a2:4382:6b51%4]) with mapi id 15.20.6086.026; Thu, 16 Feb 2023
 22:11:35 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu
 Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
	<festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Subject: RE: [PATCH v5 02/10] soc: fsl: cpm1: Add support for TSA
Thread-Topic: [PATCH v5 02/10] soc: fsl: cpm1: Add support for TSA
Thread-Index: AQHZQgyN6FbgO13wUkS94LQSTLIGVK7SIwmQ
Date: Thu, 16 Feb 2023 22:11:35 +0000
Message-ID:  <AM0PR04MB6289DD3CE001FB3E4F4429C48FA09@AM0PR04MB6289.eurprd04.prod.outlook.com>
References: <20230216134226.1692107-1-herve.codina@bootlin.com>
 <20230216134226.1692107-3-herve.codina@bootlin.com>
In-Reply-To: <20230216134226.1692107-3-herve.codina@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6289:EE_|DU2PR04MB8693:EE_
x-ms-office365-filtering-correlation-id: adf67000-0fa2-4997-c116-08db106ac496
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  9ys5FlRWKPzIvKqlUhEGULYzKqj03k8BAHZkbCq570QdSlv49P2BpM3cQJDWG3gyVM77ROon9t2zMqEdgW5fkX2brC0mVXP2LnP4bBSBVOqK+NSZyphrvirgjmcgchtXr0C/lbXgD7Y+pBvbLrZkIrhg7onP8mSdWiwVCixZWl0oPvdTHEKnMOhn5LMZ4IwO5U96dObnBIs0JedQNPEZHbYpHMSjSeYureUgCFM1uFP6F94FSSS2yz2E+/wVyJlV0A7os0cGB0E/rvwlhPl/oJPkyCbinydKKZ9cNN0EMYQAoOeOlxjGNurS19DLLdVI9g2uukxdq1Y5ndLcd6LSMdWYNOIDEVPYFs1obcW+XAjJq1bCv3GBYSgyeMOmLRiegWFNRaZaKtjiZMrCVF7oxNNKmURIOy8D3WWYm59iDnCNrqO2DHAy7ngHm/6xcEuMbzW2JcPtNZSNKezgzzSePyWHtz5I+UMCfGhIWNRwos5adSkGGZ/9jji4xtHN70hbRfsLZJsaZcKJxllmjwET6Pg7dDMB2kg4QaSGczoMuYH5xncbDHnfySa6kU0EwvLbggRdjjqawtjfX56gjYzO+Fmm/UxT1JHw4n3eAU81GdZqU37t6N0HrSqKZ7c9l3LIJ9lO5Cp/nHp2OMk1xBUIcDgGl1J87dcuT5m5gB/mwBtPa5DWzsenw69cAt2RGyYZw+P5kh0Zh9PphUmtzRJbvIz6OK0xTazz9iHXxrhtJ5s=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6289.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199018)(33656002)(4326008)(66446008)(55016003)(66476007)(8676002)(2906002)(64756008)(8936002)(66556008)(76116006)(66946007)(52536014)(6506007)(30864003)(5660300002)(7416002)(122000001)(86362001)(38100700002)(921005)(38070700005)(7696005)(478600001)(110136005)(71200400001)(54906003)(316002)(41300700001)(83380400001)(186003)(26005)(9686003)(55236004)(53546011)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?0Trt0DH4KwGBbu657JawWG9AARNZFn7HrsTTOTwF7YiK28cO38APgux6reCY?=
 =?us-ascii?Q?GgXW+NuseaQpO5BpG9ERonhkgACO+OifXqij5Fq9k3kpM27D7L8riyroEQQg?=
 =?us-ascii?Q?2eMHU3MVCSAyRUKyt3RydLBmH2NnENEIjZxgd7HlbtBIdwSPpXR59rUk1TGX?=
 =?us-ascii?Q?O810pBJIMcBZAUCQ1ws5Bk4X9V6J+Xf1CeI+qH+NnWuLU3oSP0mNzl2ImExS?=
 =?us-ascii?Q?pw/6h3gWGaVrhaH6UDD2Eek7jbLOjAEVzdTAwJunO0JuKAjOqpMIKY7fhDWa?=
 =?us-ascii?Q?b1j9ENZscVbAagxVKK7ZvM850XlUDVWtZCLOauaeDHEjxnoxb2dFj3WyEm4n?=
 =?us-ascii?Q?HrJUWey/H1qUX8BS0hkvGeJ1owrhsamBR0MasRO2UWyx4yT9mx2prwGShpfM?=
 =?us-ascii?Q?iftYlHoAAp5PYUm08tDkQr6CPRpyC3eLftrYDJPb/A1DGXrYTlQsI22Vt2gh?=
 =?us-ascii?Q?SfKelbQfRQKA9zlG6DUp00hr/df9mT0D7MZl7eYb46lQ44KrGKyflbx9pRqm?=
 =?us-ascii?Q?8GetgThsK3YCAldJZ5a5uSka27BhD361bqsFhx+j4mOTeQYJet70/RoMVJRX?=
 =?us-ascii?Q?jOjrMlRvOCKDoxTcWAKiO5aHsPoUUJpBMbjIo672yoUQsA4EL6oDyIImAecr?=
 =?us-ascii?Q?NndHrscGnsYH8egJYKNPms/WjxcZtc7DNCZjk6FUEJh6o/iDUgaDSmKIwxWN?=
 =?us-ascii?Q?8fCzWtW5jVW/w0gmD0l0SfuFALyluSXn1g9zXL52GaPvFTbrcBjPvIgMFmgt?=
 =?us-ascii?Q?DT3pcMCs4z+HqCuHyDLXD5NlAHRQ3hgKmBBfz+Wm3Go3NKBOkWL2o5KndpB4?=
 =?us-ascii?Q?wlPiN+PhV2HAFw++44gDYDUD29NuZg8htRBmoMX6J+2fiWXmpWUrfSMFe949?=
 =?us-ascii?Q?8jkOfbbMIjeHqlGS3870f+WA+oJ4fBcDRFjivqbeaN7fN9xhowVUvWel3rV7?=
 =?us-ascii?Q?4KqS9DtqSFdjlKhnmUeUMqgZZozpeJU7WPLgl1iAIqtxXZU92UtUZSa0N34U?=
 =?us-ascii?Q?Tcq4CoeBJ+hg4udeNW65LkgYiuip4eI/y9f7QmUk5gxQ/aykK2+V670OuOx0?=
 =?us-ascii?Q?e7OvsWWIzdDuK2+Kduv3qANqJAMK5/vMjs6rklB7cpvp6QVKuMBB9HHuM6Sz?=
 =?us-ascii?Q?4aX/VGhwvLTspkQQqTVP6CtixTMlfbz09j+j9H9x7ykryrwQm4oODVk0PrJK?=
 =?us-ascii?Q?/esidoLsIsrAokn351M2NUdaMIWC5+pCpg0w5e/MsO3LTfK44YA/Ngj49h0k?=
 =?us-ascii?Q?q08jczXs2dgJLREE5SCrcsesw44xjGQ08kPO88lahvIVvprLELVG7/8M4vMW?=
 =?us-ascii?Q?8t46PbVPZ1AWWMLViT/TEK5phBwOvU44AiCtSH8zjABPm1dxO51PFK6YVrPg?=
 =?us-ascii?Q?JvRB8a4G0qYv+cH4Zey75eRDM7oBVPUtpwzcKf5Wo11z3TMOVJMO9+xkjJ5J?=
 =?us-ascii?Q?Es+ii/AVfPDTp9aMvd7hvevfv/Ygql7/xTFEotgXNCioQ/dDE38wTkj49Br0?=
 =?us-ascii?Q?HAeNL1d5Ks3eqU7dqyDSaw0ZTjfuc25OfqWzvE143Ls4mkS9tJApF/1TFHAY?=
 =?us-ascii?Q?Xo7DyQI/BRufqpGsIpsK3KfT3gRllMq82lJisJAf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6289.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adf67000-0fa2-4997-c116-08db106ac496
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 22:11:35.3224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u3MpgxWdq6MSyj1j35MvTZEY/OTXFGaCbvrhPjgtSO9VBVnn38xYSFfi0LH6hGt97SOuqaaMjTIBt8rYTZQdTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8693
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Herve Codina <herve.codina@bootlin.com>
> Sent: Thursday, February 16, 2023 7:42 AM
> To: Herve Codina <herve.codina@bootlin.com>; Leo Li
> <leoyang.li@nxp.com>; Rob Herring <robh+dt@kernel.org>; Krzysztof
> Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Liam Girdwood
> <lgirdwood@gmail.com>; Mark Brown <broonie@kernel.org>; Christophe
> Leroy <christophe.leroy@csgroup.eu>; Michael Ellerman
> <mpe@ellerman.id.au>; Nicholas Piggin <npiggin@gmail.com>; Qiang Zhao
> <qiang.zhao@nxp.com>; Jaroslav Kysela <perex@perex.cz>; Takashi Iwai
> <tiwai@suse.com>; Shengjiu Wang <shengjiu.wang@gmail.com>; Xiubo Li
> <Xiubo.Lee@gmail.com>; Fabio Estevam <festevam@gmail.com>; Nicolin
> Chen <nicoleotsuka@gmail.com>
> Cc: linuxppc-dev@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; alsa-devel@alsa=
-
> project.org; Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Subject: [PATCH v5 02/10] soc: fsl: cpm1: Add support for TSA
>=20
> The TSA (Time Slot Assigner) purpose is to route some
> TDM time-slots to other internal serial controllers.
>=20
> It is available in some PowerQUICC SoC such as the
> MPC885 or MPC866.
>=20
> It is also available on some Quicc Engine SoCs.
> This current version support CPM1 SoCs only and some
> enhancement are needed to support Quicc Engine SoCs.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Looks good to me

Acked-by: Li Yang <leoyang.li@nxp.com>

> ---
>  drivers/soc/fsl/qe/Kconfig  |  11 +
>  drivers/soc/fsl/qe/Makefile |   1 +
>  drivers/soc/fsl/qe/tsa.c    | 869
> ++++++++++++++++++++++++++++++++++++
>  drivers/soc/fsl/qe/tsa.h    |  42 ++
>  4 files changed, 923 insertions(+)
>  create mode 100644 drivers/soc/fsl/qe/tsa.c
>  create mode 100644 drivers/soc/fsl/qe/tsa.h
>=20
> diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
> index 357c5800b112..b0088495c323 100644
> --- a/drivers/soc/fsl/qe/Kconfig
> +++ b/drivers/soc/fsl/qe/Kconfig
> @@ -33,6 +33,17 @@ config UCC
>  	bool
>  	default y if UCC_FAST || UCC_SLOW
>=20
> +config CPM_TSA
> +	tristate "CPM TSA support"
> +	depends on OF && HAS_IOMEM
> +	depends on CPM1 || COMPILE_TEST
> +	help
> +	  Freescale CPM Time Slot Assigner (TSA)
> +	  controller.
> +
> +	  This option enables support for this
> +	  controller
> +
>  config QE_TDM
>  	bool
>  	default y if FSL_UCC_HDLC
> diff --git a/drivers/soc/fsl/qe/Makefile b/drivers/soc/fsl/qe/Makefile
> index 55a555304f3a..45c961acc81b 100644
> --- a/drivers/soc/fsl/qe/Makefile
> +++ b/drivers/soc/fsl/qe/Makefile
> @@ -4,6 +4,7 @@
>  #
>  obj-$(CONFIG_QUICC_ENGINE)+=3D qe.o qe_common.o qe_ic.o qe_io.o
>  obj-$(CONFIG_CPM)	+=3D qe_common.o
> +obj-$(CONFIG_CPM_TSA)	+=3D tsa.o
>  obj-$(CONFIG_UCC)	+=3D ucc.o
>  obj-$(CONFIG_UCC_SLOW)	+=3D ucc_slow.o
>  obj-$(CONFIG_UCC_FAST)	+=3D ucc_fast.o
> diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
> new file mode 100644
> index 000000000000..90d9a5254d9b
> --- /dev/null
> +++ b/drivers/soc/fsl/qe/tsa.c
> @@ -0,0 +1,869 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * TSA driver
> + *
> + * Copyright 2022 CS GROUP France
> + *
> + * Author: Herve Codina <herve.codina@bootlin.com>
> + */
> +
> +#include "tsa.h"
> +#include <dt-bindings/soc/fsl,tsa.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +
> +/* TSA SI RAM routing tables entry */
> +#define TSA_SIRAM_ENTRY_LAST		(1 << 16)
> +#define TSA_SIRAM_ENTRY_BYTE		(1 << 17)
> +#define TSA_SIRAM_ENTRY_CNT(x)		(((x) & 0x0f) << 18)
> +#define TSA_SIRAM_ENTRY_CSEL_MASK	(0x7 << 22)
> +#define TSA_SIRAM_ENTRY_CSEL_NU		(0x0 << 22)
> +#define TSA_SIRAM_ENTRY_CSEL_SCC2	(0x2 << 22)
> +#define TSA_SIRAM_ENTRY_CSEL_SCC3	(0x3 << 22)
> +#define TSA_SIRAM_ENTRY_CSEL_SCC4	(0x4 << 22)
> +#define TSA_SIRAM_ENTRY_CSEL_SMC1	(0x5 << 22)
> +#define TSA_SIRAM_ENTRY_CSEL_SMC2	(0x6 << 22)
> +
> +/* SI mode register (32 bits) */
> +#define TSA_SIMODE	0x00
> +#define   TSA_SIMODE_SMC2			0x80000000
> +#define   TSA_SIMODE_SMC1			0x00008000
> +#define   TSA_SIMODE_TDMA(x)			((x) << 0)
> +#define   TSA_SIMODE_TDMB(x)			((x) << 16)
> +#define     TSA_SIMODE_TDM_MASK			0x0fff
> +#define     TSA_SIMODE_TDM_SDM_MASK		0x0c00
> +#define       TSA_SIMODE_TDM_SDM_NORM		0x0000
> +#define       TSA_SIMODE_TDM_SDM_ECHO		0x0400
> +#define       TSA_SIMODE_TDM_SDM_INTL_LOOP	0x0800
> +#define       TSA_SIMODE_TDM_SDM_LOOP_CTRL	0x0c00
> +#define     TSA_SIMODE_TDM_RFSD(x)		((x) << 8)
> +#define     TSA_SIMODE_TDM_DSC			0x0080
> +#define     TSA_SIMODE_TDM_CRT			0x0040
> +#define     TSA_SIMODE_TDM_STZ			0x0020
> +#define     TSA_SIMODE_TDM_CE			0x0010
> +#define     TSA_SIMODE_TDM_FE			0x0008
> +#define     TSA_SIMODE_TDM_GM			0x0004
> +#define     TSA_SIMODE_TDM_TFSD(x)		((x) << 0)
> +
> +/* SI global mode register (8 bits) */
> +#define TSA_SIGMR	0x04
> +#define TSA_SIGMR_ENB			(1<<3)
> +#define TSA_SIGMR_ENA			(1<<2)
> +#define TSA_SIGMR_RDM_MASK		0x03
> +#define   TSA_SIGMR_RDM_STATIC_TDMA	0x00
> +#define   TSA_SIGMR_RDM_DYN_TDMA	0x01
> +#define   TSA_SIGMR_RDM_STATIC_TDMAB	0x02
> +#define   TSA_SIGMR_RDM_DYN_TDMAB	0x03
> +
> +/* SI status register (8 bits) */
> +#define TSA_SISTR	0x06
> +
> +/* SI command register (8 bits) */
> +#define TSA_SICMR	0x07
> +
> +/* SI clock route register (32 bits) */
> +#define TSA_SICR	0x0C
> +#define   TSA_SICR_SCC2(x)		((x) << 8)
> +#define   TSA_SICR_SCC3(x)		((x) << 16)
> +#define   TSA_SICR_SCC4(x)		((x) << 24)
> +#define     TSA_SICR_SCC_MASK		0x0ff
> +#define     TSA_SICR_SCC_GRX		(1 << 7)
> +#define     TSA_SICR_SCC_SCX_TSA	(1 << 6)
> +#define     TSA_SICR_SCC_RXCS_MASK	(0x7 << 3)
> +#define       TSA_SICR_SCC_RXCS_BRG1	(0x0 << 3)
> +#define       TSA_SICR_SCC_RXCS_BRG2	(0x1 << 3)
> +#define       TSA_SICR_SCC_RXCS_BRG3	(0x2 << 3)
> +#define       TSA_SICR_SCC_RXCS_BRG4	(0x3 << 3)
> +#define       TSA_SICR_SCC_RXCS_CLK15	(0x4 << 3)
> +#define       TSA_SICR_SCC_RXCS_CLK26	(0x5 << 3)
> +#define       TSA_SICR_SCC_RXCS_CLK37	(0x6 << 3)
> +#define       TSA_SICR_SCC_RXCS_CLK48	(0x7 << 3)
> +#define     TSA_SICR_SCC_TXCS_MASK	(0x7 << 0)
> +#define       TSA_SICR_SCC_TXCS_BRG1	(0x0 << 0)
> +#define       TSA_SICR_SCC_TXCS_BRG2	(0x1 << 0)
> +#define       TSA_SICR_SCC_TXCS_BRG3	(0x2 << 0)
> +#define       TSA_SICR_SCC_TXCS_BRG4	(0x3 << 0)
> +#define       TSA_SICR_SCC_TXCS_CLK15	(0x4 << 0)
> +#define       TSA_SICR_SCC_TXCS_CLK26	(0x5 << 0)
> +#define       TSA_SICR_SCC_TXCS_CLK37	(0x6 << 0)
> +#define       TSA_SICR_SCC_TXCS_CLK48	(0x7 << 0)
> +
> +/* Serial interface RAM pointer register (32 bits) */
> +#define TSA_SIRP	0x10
> +
> +struct tsa_entries_area {
> +	void *__iomem entries_start;
> +	void *__iomem entries_next;
> +	void *__iomem last_entry;
> +};
> +
> +struct tsa_tdm {
> +	bool is_enable;
> +	struct clk *l1rclk_clk;
> +	struct clk *l1rsync_clk;
> +	struct clk *l1tclk_clk;
> +	struct clk *l1tsync_clk;
> +	u32 simode_tdm;
> +};
> +
> +#define TSA_TDMA	0
> +#define TSA_TDMB	1
> +
> +struct tsa {
> +	struct device *dev;
> +	void *__iomem si_regs;
> +	void *__iomem si_ram;
> +	resource_size_t si_ram_sz;
> +	spinlock_t	lock;
> +	int tdms; /* TSA_TDMx ORed */
> +	struct tsa_tdm tdm[2]; /* TDMa and TDMb */
> +	struct tsa_serial {
> +		unsigned int id;
> +		struct tsa_serial_info info;
> +	} serials[6];
> +};
> +
> +static inline struct tsa *tsa_serial_get_tsa(struct tsa_serial *tsa_seri=
al)
> +{
> +	/* The serials table is indexed by the serial id */
> +	return container_of(tsa_serial, struct tsa, serials[tsa_serial->id]);
> +}
> +
> +static inline void tsa_write32(void *__iomem addr, u32 val)
> +{
> +	iowrite32be(val, addr);
> +}
> +
> +static inline void tsa_write8(void *__iomem addr, u32 val)
> +{
> +	iowrite8(val, addr);
> +}
> +
> +static inline u32 tsa_read32(void *__iomem addr)
> +{
> +	return ioread32be(addr);
> +}
> +
> +static inline void tsa_clrbits32(void *__iomem addr, u32 clr)
> +{
> +	tsa_write32(addr, tsa_read32(addr) & ~clr);
> +}
> +
> +static inline void tsa_clrsetbits32(void *__iomem addr, u32 clr, u32 set=
)
> +{
> +	tsa_write32(addr, (tsa_read32(addr) & ~clr) | set);
> +}
> +
> +int tsa_serial_connect(struct tsa_serial *tsa_serial)
> +{
> +	struct tsa *tsa =3D tsa_serial_get_tsa(tsa_serial);
> +	unsigned long flags;
> +	u32 clear;
> +	u32 set;
> +
> +	switch (tsa_serial->id) {
> +	case FSL_CPM_TSA_SCC2:
> +		clear =3D TSA_SICR_SCC2(TSA_SICR_SCC_MASK);
> +		set =3D TSA_SICR_SCC2(TSA_SICR_SCC_SCX_TSA);
> +		break;
> +	case FSL_CPM_TSA_SCC3:
> +		clear =3D TSA_SICR_SCC3(TSA_SICR_SCC_MASK);
> +		set =3D TSA_SICR_SCC3(TSA_SICR_SCC_SCX_TSA);
> +		break;
> +	case FSL_CPM_TSA_SCC4:
> +		clear =3D TSA_SICR_SCC4(TSA_SICR_SCC_MASK);
> +		set =3D TSA_SICR_SCC4(TSA_SICR_SCC_SCX_TSA);
> +		break;
> +	default:
> +		dev_err(tsa->dev, "Unsupported serial id %u\n", tsa_serial-
> >id);
> +		return -EINVAL;
> +	}
> +
> +	spin_lock_irqsave(&tsa->lock, flags);
> +	tsa_clrsetbits32(tsa->si_regs + TSA_SICR, clear, set);
> +	spin_unlock_irqrestore(&tsa->lock, flags);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(tsa_serial_connect);
> +
> +int tsa_serial_disconnect(struct tsa_serial *tsa_serial)
> +{
> +	struct tsa *tsa =3D tsa_serial_get_tsa(tsa_serial);
> +	unsigned long flags;
> +	u32 clear;
> +
> +	switch (tsa_serial->id) {
> +	case FSL_CPM_TSA_SCC2:
> +		clear =3D TSA_SICR_SCC2(TSA_SICR_SCC_MASK);
> +		break;
> +	case FSL_CPM_TSA_SCC3:
> +		clear =3D TSA_SICR_SCC3(TSA_SICR_SCC_MASK);
> +		break;
> +	case FSL_CPM_TSA_SCC4:
> +		clear =3D TSA_SICR_SCC4(TSA_SICR_SCC_MASK);
> +		break;
> +	default:
> +		dev_err(tsa->dev, "Unsupported serial id %u\n", tsa_serial-
> >id);
> +		return -EINVAL;
> +	}
> +
> +	spin_lock_irqsave(&tsa->lock, flags);
> +	tsa_clrsetbits32(tsa->si_regs + TSA_SICR, clear, 0);
> +	spin_unlock_irqrestore(&tsa->lock, flags);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(tsa_serial_disconnect);
> +
> +int tsa_serial_get_info(struct tsa_serial *tsa_serial, struct tsa_serial=
_info
> *info)
> +{
> +	memcpy(info, &tsa_serial->info, sizeof(*info));
> +	return 0;
> +}
> +EXPORT_SYMBOL(tsa_serial_get_info);
> +
> +static void tsa_init_entries_area(struct tsa *tsa, struct tsa_entries_ar=
ea
> *area,
> +				  u32 tdms, u32 tdm_id, bool is_rx)
> +{
> +	resource_size_t quarter;
> +	resource_size_t half;
> +
> +	quarter =3D tsa->si_ram_sz/4;
> +	half =3D tsa->si_ram_sz/2;
> +
> +	if (tdms =3D=3D BIT(TSA_TDMA)) {
> +		/* Only TDMA */
> +		if (is_rx) {
> +			/* First half of si_ram */
> +			area->entries_start =3D tsa->si_ram;
> +			area->entries_next =3D area->entries_start + half;
> +			area->last_entry =3D NULL;
> +		} else {
> +			/* Second half of si_ram */
> +			area->entries_start =3D tsa->si_ram + half;
> +			area->entries_next =3D area->entries_start + half;
> +			area->last_entry =3D NULL;
> +		}
> +	} else {
> +		/* Only TDMB or both TDMs */
> +		if (tdm_id =3D=3D TSA_TDMA) {
> +			if (is_rx) {
> +				/* First half of first half of si_ram */
> +				area->entries_start =3D tsa->si_ram;
> +				area->entries_next =3D area->entries_start +
> quarter;
> +				area->last_entry =3D NULL;
> +			} else {
> +				/* First half of second half of si_ram */
> +				area->entries_start =3D tsa->si_ram + (2 *
> quarter);
> +				area->entries_next =3D area->entries_start +
> quarter;
> +				area->last_entry =3D NULL;
> +			}
> +		} else {
> +			if (is_rx) {
> +				/* Second half of first half of si_ram */
> +				area->entries_start =3D tsa->si_ram + quarter;
> +				area->entries_next =3D area->entries_start +
> quarter;
> +				area->last_entry =3D NULL;
> +			} else {
> +				/* Second half of second half of si_ram */
> +				area->entries_start =3D tsa->si_ram + (3 *
> quarter);
> +				area->entries_next =3D area->entries_start +
> quarter;
> +				area->last_entry =3D NULL;
> +			}
> +		}
> +	}
> +}
> +
> +static const char *tsa_serial_id2name(struct tsa *tsa, u32 serial_id)
> +{
> +	switch (serial_id) {
> +	case FSL_CPM_TSA_NU:	return "Not used";
> +	case FSL_CPM_TSA_SCC2:	return "SCC2";
> +	case FSL_CPM_TSA_SCC3:	return "SCC3";
> +	case FSL_CPM_TSA_SCC4:	return "SCC4";
> +	case FSL_CPM_TSA_SMC1:	return "SMC1";
> +	case FSL_CPM_TSA_SMC2:	return "SMC2";
> +	default:
> +		break;
> +	}
> +	return NULL;
> +}
> +
> +static u32 tsa_serial_id2csel(struct tsa *tsa, u32 serial_id)
> +{
> +	switch (serial_id) {
> +	case FSL_CPM_TSA_SCC2:	return
> TSA_SIRAM_ENTRY_CSEL_SCC2;
> +	case FSL_CPM_TSA_SCC3:	return
> TSA_SIRAM_ENTRY_CSEL_SCC3;
> +	case FSL_CPM_TSA_SCC4:	return
> TSA_SIRAM_ENTRY_CSEL_SCC4;
> +	case FSL_CPM_TSA_SMC1:	return
> TSA_SIRAM_ENTRY_CSEL_SMC1;
> +	case FSL_CPM_TSA_SMC2:	return
> TSA_SIRAM_ENTRY_CSEL_SMC2;
> +	default:
> +		break;
> +	}
> +	return TSA_SIRAM_ENTRY_CSEL_NU;
> +}
> +
> +static int tsa_add_entry(struct tsa *tsa, struct tsa_entries_area *area,
> +			 u32 count, u32 serial_id)
> +{
> +	void *__iomem addr;
> +	u32 left;
> +	u32 val;
> +	u32 cnt;
> +	u32 nb;
> +
> +	addr =3D area->last_entry ? area->last_entry + 4 : area->entries_start;
> +
> +	nb =3D DIV_ROUND_UP(count, 8);
> +	if ((addr + (nb * 4)) > area->entries_next) {
> +		dev_err(tsa->dev, "si ram area full\n");
> +		return -ENOSPC;
> +	}
> +
> +	if (area->last_entry) {
> +		/* Clear last flag */
> +		tsa_clrbits32(area->last_entry, TSA_SIRAM_ENTRY_LAST);
> +	}
> +
> +	left =3D count;
> +	while (left) {
> +		val =3D TSA_SIRAM_ENTRY_BYTE | tsa_serial_id2csel(tsa,
> serial_id);
> +
> +		if (left > 16) {
> +			cnt =3D 16;
> +		} else {
> +			cnt =3D left;
> +			val |=3D TSA_SIRAM_ENTRY_LAST;
> +			area->last_entry =3D addr;
> +		}
> +		val |=3D TSA_SIRAM_ENTRY_CNT(cnt - 1);
> +
> +		tsa_write32(addr, val);
> +		addr +=3D 4;
> +		left -=3D cnt;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tsa_of_parse_tdm_route(struct tsa *tsa, struct device_node
> *tdm_np,
> +				  u32 tdms, u32 tdm_id, bool is_rx)
> +{
> +	struct tsa_entries_area area;
> +	const char *route_name;
> +	u32 serial_id;
> +	int len, i;
> +	u32 count;
> +	const char *serial_name;
> +	struct tsa_serial_info *serial_info;
> +	struct tsa_tdm *tdm;
> +	int ret;
> +	u32 ts;
> +
> +	route_name =3D is_rx ? "fsl,rx-ts-routes" : "fsl,tx-ts-routes";
> +
> +	len =3D of_property_count_u32_elems(tdm_np,  route_name);
> +	if (len < 0) {
> +		dev_err(tsa->dev, "%pOF: failed to read %s\n", tdm_np,
> route_name);
> +		return len;
> +	}
> +	if (len % 2 !=3D 0) {
> +		dev_err(tsa->dev, "%pOF: wrong %s format\n", tdm_np,
> route_name);
> +		return -EINVAL;
> +	}
> +
> +	tsa_init_entries_area(tsa, &area, tdms, tdm_id, is_rx);
> +	ts =3D 0;
> +	for (i =3D 0; i < len; i +=3D 2) {
> +		of_property_read_u32_index(tdm_np, route_name, i,
> &count);
> +		of_property_read_u32_index(tdm_np, route_name, i + 1,
> &serial_id);
> +
> +		if (serial_id >=3D ARRAY_SIZE(tsa->serials)) {
> +			dev_err(tsa->dev, "%pOF: invalid serial id (%u)\n",
> +				tdm_np, serial_id);
> +			return -EINVAL;
> +		}
> +
> +		serial_name =3D tsa_serial_id2name(tsa, serial_id);
> +		if (!serial_name) {
> +			dev_err(tsa->dev, "%pOF: unsupported serial id
> (%u)\n",
> +				tdm_np, serial_id);
> +			return -EINVAL;
> +		}
> +
> +		dev_dbg(tsa->dev, "tdm_id=3D%u, %s ts %u..%u -> %s\n",
> +			tdm_id, route_name, ts, ts+count-1, serial_name);
> +		ts +=3D count;
> +
> +		ret =3D tsa_add_entry(tsa, &area, count, serial_id);
> +		if (ret)
> +			return ret;
> +
> +		serial_info =3D &tsa->serials[serial_id].info;
> +		tdm =3D &tsa->tdm[tdm_id];
> +		if (is_rx) {
> +			serial_info->rx_fs_rate =3D clk_get_rate(tdm-
> >l1rsync_clk);
> +			serial_info->rx_bit_rate =3D clk_get_rate(tdm-
> >l1rclk_clk);
> +			serial_info->nb_rx_ts +=3D count;
> +		} else {
> +			serial_info->tx_fs_rate =3D tdm->l1tsync_clk ?
> +				clk_get_rate(tdm->l1tsync_clk) :
> +				clk_get_rate(tdm->l1rsync_clk);
> +			serial_info->tx_bit_rate =3D tdm->l1tclk_clk ?
> +				clk_get_rate(tdm->l1tclk_clk) :
> +				clk_get_rate(tdm->l1rclk_clk);
> +			serial_info->nb_tx_ts +=3D count;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static inline int tsa_of_parse_tdm_rx_route(struct tsa *tsa,
> +					    struct device_node *tdm_np,
> +					    u32 tdms, u32 tdm_id)
> +{
> +	return tsa_of_parse_tdm_route(tsa, tdm_np, tdms, tdm_id, true);
> +}
> +
> +static inline int tsa_of_parse_tdm_tx_route(struct tsa *tsa,
> +					    struct device_node *tdm_np,
> +					    u32 tdms, u32 tdm_id)
> +{
> +	return tsa_of_parse_tdm_route(tsa, tdm_np, tdms, tdm_id, false);
> +}
> +
> +static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
> +{
> +	struct device_node *tdm_np;
> +	struct tsa_tdm *tdm;
> +	struct clk *clk;
> +	const char *mode;
> +	u32 tdm_id, val;
> +	int ret;
> +	int i;
> +
> +	tsa->tdms =3D 0;
> +	tsa->tdm[0].is_enable =3D false;
> +	tsa->tdm[1].is_enable =3D false;
> +
> +	for_each_available_child_of_node(np, tdm_np) {
> +		ret =3D of_property_read_u32(tdm_np, "reg", &tdm_id);
> +		if (ret) {
> +			dev_err(tsa->dev, "%pOF: failed to read reg\n",
> tdm_np);
> +			of_node_put(tdm_np);
> +			return ret;
> +		}
> +		switch (tdm_id) {
> +		case 0:
> +			tsa->tdms |=3D BIT(TSA_TDMA);
> +			break;
> +		case 1:
> +			tsa->tdms |=3D BIT(TSA_TDMB);
> +			break;
> +		default:
> +			dev_err(tsa->dev, "%pOF: Invalid tdm_id (%u)\n",
> tdm_np,
> +				tdm_id);
> +			of_node_put(tdm_np);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	for_each_available_child_of_node(np, tdm_np) {
> +		ret =3D of_property_read_u32(tdm_np, "reg", &tdm_id);
> +		if (ret) {
> +			dev_err(tsa->dev, "%pOF: failed to read reg\n",
> tdm_np);
> +			of_node_put(tdm_np);
> +			return ret;
> +		}
> +
> +		tdm =3D &tsa->tdm[tdm_id];
> +
> +		mode =3D "disabled";
> +		ret =3D of_property_read_string(tdm_np, "fsl,diagnostic-
> mode", &mode);
> +		if (ret && ret !=3D -EINVAL) {
> +			dev_err(tsa->dev, "%pOF: failed to read
> fsl,diagnostic-mode\n",
> +				tdm_np);
> +			of_node_put(tdm_np);
> +			return ret;
> +		}
> +		if (!strcmp(mode, "disabled")) {
> +			tdm->simode_tdm |=3D
> TSA_SIMODE_TDM_SDM_NORM;
> +		} else if (!strcmp(mode, "echo")) {
> +			tdm->simode_tdm |=3D
> TSA_SIMODE_TDM_SDM_ECHO;
> +		} else if (!strcmp(mode, "internal-loopback")) {
> +			tdm->simode_tdm |=3D
> TSA_SIMODE_TDM_SDM_INTL_LOOP;
> +		} else if (!strcmp(mode, "control-loopback")) {
> +			tdm->simode_tdm |=3D
> TSA_SIMODE_TDM_SDM_LOOP_CTRL;
> +		} else {
> +			dev_err(tsa->dev, "%pOF: Invalid fsl,diagnostic-
> mode (%s)\n",
> +				tdm_np, mode);
> +			of_node_put(tdm_np);
> +			return -EINVAL;
> +		}
> +
> +		val =3D 0;
> +		ret =3D of_property_read_u32(tdm_np, "fsl,rx-frame-sync-
> delay-bits",
> +					   &val);
> +		if (ret && ret !=3D -EINVAL) {
> +			dev_err(tsa->dev,
> +				"%pOF: failed to read fsl,rx-frame-sync-
> delay-bits\n",
> +				tdm_np);
> +			of_node_put(tdm_np);
> +			return ret;
> +		}
> +		if (val > 3) {
> +			dev_err(tsa->dev,
> +				"%pOF: Invalid fsl,rx-frame-sync-delay-bits
> (%u)\n",
> +				tdm_np, val);
> +			of_node_put(tdm_np);
> +			return -EINVAL;
> +		}
> +		tdm->simode_tdm |=3D TSA_SIMODE_TDM_RFSD(val);
> +
> +		val =3D 0;
> +		ret =3D of_property_read_u32(tdm_np, "fsl,tx-frame-sync-
> delay-bits",
> +					   &val);
> +		if (ret && ret !=3D -EINVAL) {
> +			dev_err(tsa->dev,
> +				"%pOF: failed to read fsl,tx-frame-sync-
> delay-bits\n",
> +				tdm_np);
> +			of_node_put(tdm_np);
> +			return ret;
> +		}
> +		if (val > 3) {
> +			dev_err(tsa->dev,
> +				"%pOF: Invalid fsl,tx-frame-sync-delay-bits
> (%u)\n",
> +				tdm_np, val);
> +			of_node_put(tdm_np);
> +			return -EINVAL;
> +		}
> +		tdm->simode_tdm |=3D TSA_SIMODE_TDM_TFSD(val);
> +
> +		if (of_property_read_bool(tdm_np, "fsl,common-rxtx-pins"))
> +			tdm->simode_tdm |=3D TSA_SIMODE_TDM_CRT;
> +
> +		if (of_property_read_bool(tdm_np, "fsl,clock-falling-edge"))
> +			tdm->simode_tdm |=3D TSA_SIMODE_TDM_CE;
> +
> +		if (of_property_read_bool(tdm_np, "fsl,fsync-rising-edge"))
> +			tdm->simode_tdm |=3D TSA_SIMODE_TDM_FE;
> +
> +		if (of_property_read_bool(tdm_np, "fsl,double-speed-
> clock"))
> +			tdm->simode_tdm |=3D TSA_SIMODE_TDM_DSC;
> +
> +		clk =3D of_clk_get_by_name(tdm_np, "l1rsync");
> +		if (IS_ERR(clk)) {
> +			ret =3D PTR_ERR(clk);
> +			of_node_put(tdm_np);
> +			goto err;
> +		}
> +		ret =3D clk_prepare_enable(clk);
> +		if (ret) {
> +			clk_put(clk);
> +			of_node_put(tdm_np);
> +			goto err;
> +		}
> +		tdm->l1rsync_clk =3D clk;
> +
> +		clk =3D of_clk_get_by_name(tdm_np, "l1rclk");
> +		if (IS_ERR(clk)) {
> +			ret =3D PTR_ERR(clk);
> +			of_node_put(tdm_np);
> +			goto err;
> +		}
> +		ret =3D clk_prepare_enable(clk);
> +		if (ret) {
> +			clk_put(clk);
> +			of_node_put(tdm_np);
> +			goto err;
> +		}
> +		tdm->l1rclk_clk =3D clk;
> +
> +		if (!(tdm->simode_tdm & TSA_SIMODE_TDM_CRT)) {
> +			clk =3D of_clk_get_by_name(tdm_np, "l1tsync");
> +			if (IS_ERR(clk)) {
> +				ret =3D PTR_ERR(clk);
> +				of_node_put(tdm_np);
> +				goto err;
> +			}
> +			ret =3D clk_prepare_enable(clk);
> +			if (ret) {
> +				clk_put(clk);
> +				of_node_put(tdm_np);
> +				goto err;
> +			}
> +			tdm->l1tsync_clk =3D clk;
> +
> +			clk =3D of_clk_get_by_name(tdm_np, "l1tclk");
> +			if (IS_ERR(clk)) {
> +				ret =3D PTR_ERR(clk);
> +				of_node_put(tdm_np);
> +				goto err;
> +			}
> +			ret =3D clk_prepare_enable(clk);
> +			if (ret) {
> +				clk_put(clk);
> +				of_node_put(tdm_np);
> +				goto err;
> +			}
> +			tdm->l1tclk_clk =3D clk;
> +		}
> +
> +		ret =3D tsa_of_parse_tdm_rx_route(tsa, tdm_np, tsa->tdms,
> tdm_id);
> +		if (ret) {
> +			of_node_put(tdm_np);
> +			goto err;
> +		}
> +
> +		ret =3D tsa_of_parse_tdm_tx_route(tsa, tdm_np, tsa->tdms,
> tdm_id);
> +		if (ret) {
> +			of_node_put(tdm_np);
> +			goto err;
> +		}
> +
> +		tdm->is_enable =3D true;
> +	}
> +	return 0;
> +
> +err:
> +	for (i =3D 0; i < 2; i++) {
> +		if (tsa->tdm[i].l1rsync_clk) {
> +			clk_disable_unprepare(tsa->tdm[i].l1rsync_clk);
> +			clk_put(tsa->tdm[i].l1rsync_clk);
> +		}
> +		if (tsa->tdm[i].l1rclk_clk) {
> +			clk_disable_unprepare(tsa->tdm[i].l1rclk_clk);
> +			clk_put(tsa->tdm[i].l1rclk_clk);
> +		}
> +		if (tsa->tdm[i].l1tsync_clk) {
> +			clk_disable_unprepare(tsa->tdm[i].l1rsync_clk);
> +			clk_put(tsa->tdm[i].l1rsync_clk);
> +		}
> +		if (tsa->tdm[i].l1tclk_clk) {
> +			clk_disable_unprepare(tsa->tdm[i].l1rclk_clk);
> +			clk_put(tsa->tdm[i].l1rclk_clk);
> +		}
> +	}
> +	return ret;
> +}
> +
> +static void tsa_init_si_ram(struct tsa *tsa)
> +{
> +	resource_size_t i;
> +
> +	/* Fill all entries as the last one */
> +	for (i =3D 0; i < tsa->si_ram_sz; i +=3D 4)
> +		tsa_write32(tsa->si_ram + i, TSA_SIRAM_ENTRY_LAST);
> +}
> +
> +static int tsa_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct resource *res;
> +	struct tsa *tsa;
> +	unsigned int i;
> +	u32 val;
> +	int ret;
> +
> +	tsa =3D devm_kzalloc(&pdev->dev, sizeof(*tsa), GFP_KERNEL);
> +	if (!tsa)
> +		return -ENOMEM;
> +
> +	tsa->dev =3D &pdev->dev;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(tsa->serials); i++)
> +		tsa->serials[i].id =3D i;
> +
> +	spin_lock_init(&tsa->lock);
> +
> +	tsa->si_regs =3D devm_platform_ioremap_resource_byname(pdev,
> "si_regs");
> +	if (IS_ERR(tsa->si_regs))
> +		return PTR_ERR(tsa->si_regs);
> +
> +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> "si_ram");
> +	if (!res) {
> +		dev_err(tsa->dev, "si_ram resource missing\n");
> +		return -EINVAL;
> +	}
> +	tsa->si_ram_sz =3D resource_size(res);
> +	tsa->si_ram =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(tsa->si_ram))
> +		return PTR_ERR(tsa->si_ram);
> +
> +	tsa_init_si_ram(tsa);
> +
> +	ret =3D tsa_of_parse_tdms(tsa, np);
> +	if (ret)
> +		return ret;
> +
> +	/* Set SIMODE */
> +	val =3D 0;
> +	if (tsa->tdm[0].is_enable)
> +		val |=3D TSA_SIMODE_TDMA(tsa->tdm[0].simode_tdm);
> +	if (tsa->tdm[1].is_enable)
> +		val |=3D TSA_SIMODE_TDMB(tsa->tdm[1].simode_tdm);
> +
> +	tsa_clrsetbits32(tsa->si_regs + TSA_SIMODE,
> +			 TSA_SIMODE_TDMA(TSA_SIMODE_TDM_MASK) |
> +			 TSA_SIMODE_TDMB(TSA_SIMODE_TDM_MASK),
> +			 val);
> +
> +	/* Set SIGMR */
> +	val =3D (tsa->tdms =3D=3D BIT(TSA_TDMA)) ?
> +		TSA_SIGMR_RDM_STATIC_TDMA :
> TSA_SIGMR_RDM_STATIC_TDMAB;
> +	if (tsa->tdms & BIT(TSA_TDMA))
> +		val |=3D TSA_SIGMR_ENA;
> +	if (tsa->tdms & BIT(TSA_TDMB))
> +		val |=3D TSA_SIGMR_ENB;
> +	tsa_write8(tsa->si_regs + TSA_SIGMR, val);
> +
> +	platform_set_drvdata(pdev, tsa);
> +
> +	return 0;
> +}
> +
> +static int tsa_remove(struct platform_device *pdev)
> +{
> +	struct tsa *tsa =3D platform_get_drvdata(pdev);
> +	int i;
> +
> +	for (i =3D 0; i < 2; i++) {
> +		if (tsa->tdm[i].l1rsync_clk) {
> +			clk_disable_unprepare(tsa->tdm[i].l1rsync_clk);
> +			clk_put(tsa->tdm[i].l1rsync_clk);
> +		}
> +		if (tsa->tdm[i].l1rclk_clk) {
> +			clk_disable_unprepare(tsa->tdm[i].l1rclk_clk);
> +			clk_put(tsa->tdm[i].l1rclk_clk);
> +		}
> +		if (tsa->tdm[i].l1tsync_clk) {
> +			clk_disable_unprepare(tsa->tdm[i].l1rsync_clk);
> +			clk_put(tsa->tdm[i].l1rsync_clk);
> +		}
> +		if (tsa->tdm[i].l1tclk_clk) {
> +			clk_disable_unprepare(tsa->tdm[i].l1rclk_clk);
> +			clk_put(tsa->tdm[i].l1rclk_clk);
> +		}
> +	}
> +	return 0;
> +}
> +
> +static const struct of_device_id tsa_id_table[] =3D {
> +	{ .compatible =3D "fsl,cpm1-tsa" },
> +	{} /* sentinel */
> +};
> +MODULE_DEVICE_TABLE(of, tsa_id_table);
> +
> +static struct platform_driver tsa_driver =3D {
> +	.driver =3D {
> +		.name =3D "fsl-tsa",
> +		.of_match_table =3D of_match_ptr(tsa_id_table),
> +	},
> +	.probe =3D tsa_probe,
> +	.remove =3D tsa_remove,
> +};
> +module_platform_driver(tsa_driver);
> +
> +struct tsa_serial *tsa_serial_get_byphandle(struct device_node *np,
> +					    const char *phandle_name)
> +{
> +	struct of_phandle_args out_args;
> +	struct platform_device *pdev;
> +	struct tsa_serial *tsa_serial;
> +	struct tsa *tsa;
> +	int ret;
> +
> +	ret =3D of_parse_phandle_with_fixed_args(np, phandle_name, 1, 0,
> &out_args);
> +	if (ret < 0)
> +		return ERR_PTR(ret);
> +
> +	if (!of_match_node(tsa_driver.driver.of_match_table, out_args.np))
> {
> +		of_node_put(out_args.np);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	pdev =3D of_find_device_by_node(out_args.np);
> +	of_node_put(out_args.np);
> +	if (!pdev)
> +		return ERR_PTR(-ENODEV);
> +
> +	tsa =3D platform_get_drvdata(pdev);
> +	if (!tsa) {
> +		platform_device_put(pdev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	if (out_args.args_count !=3D 1) {
> +		platform_device_put(pdev);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (out_args.args[0] >=3D ARRAY_SIZE(tsa->serials)) {
> +		platform_device_put(pdev);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	tsa_serial =3D &tsa->serials[out_args.args[0]];
> +
> +	/*
> +	 * Be sure that the serial id matches the phandle arg.
> +	 * The tsa_serials table is indexed by serial ids. The serial id is set
> +	 * during the probe() call and needs to be coherent.
> +	 */
> +	if (WARN_ON(tsa_serial->id !=3D out_args.args[0])) {
> +		platform_device_put(pdev);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	return tsa_serial;
> +}
> +EXPORT_SYMBOL(tsa_serial_get_byphandle);
> +
> +void tsa_serial_put(struct tsa_serial *tsa_serial)
> +{
> +	struct tsa *tsa =3D tsa_serial_get_tsa(tsa_serial);
> +
> +	put_device(tsa->dev);
> +}
> +EXPORT_SYMBOL(tsa_serial_put);
> +
> +static void devm_tsa_serial_release(struct device *dev, void *res)
> +{
> +	struct tsa_serial **tsa_serial =3D res;
> +
> +	tsa_serial_put(*tsa_serial);
> +}
> +
> +struct tsa_serial *devm_tsa_serial_get_byphandle(struct device *dev,
> +						 struct device_node *np,
> +						 const char *phandle_name)
> +{
> +	struct tsa_serial *tsa_serial;
> +	struct tsa_serial **dr;
> +
> +	dr =3D devres_alloc(devm_tsa_serial_release, sizeof(*dr),
> GFP_KERNEL);
> +	if (!dr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	tsa_serial =3D tsa_serial_get_byphandle(np, phandle_name);
> +	if (!IS_ERR(tsa_serial)) {
> +		*dr =3D tsa_serial;
> +		devres_add(dev, dr);
> +	} else {
> +		devres_free(dr);
> +	}
> +
> +	return tsa_serial;
> +}
> +EXPORT_SYMBOL(devm_tsa_serial_get_byphandle);
> +
> +MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
> +MODULE_DESCRIPTION("CPM TSA driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/soc/fsl/qe/tsa.h b/drivers/soc/fsl/qe/tsa.h
> new file mode 100644
> index 000000000000..d9df89b6da3e
> --- /dev/null
> +++ b/drivers/soc/fsl/qe/tsa.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * TSA management
> + *
> + * Copyright 2022 CS GROUP France
> + *
> + * Author: Herve Codina <herve.codina@bootlin.com>
> + */
> +#ifndef __SOC_FSL_TSA_H__
> +#define __SOC_FSL_TSA_H__
> +
> +#include <linux/types.h>
> +
> +struct device_node;
> +struct device;
> +struct tsa_serial;
> +
> +struct tsa_serial *tsa_serial_get_byphandle(struct device_node *np,
> +					    const char *phandle_name);
> +void tsa_serial_put(struct tsa_serial *tsa_serial);
> +struct tsa_serial *devm_tsa_serial_get_byphandle(struct device *dev,
> +						 struct device_node *np,
> +						 const char *phandle_name);
> +
> +/* Connect and disconnect the TSA serial */
> +int tsa_serial_connect(struct tsa_serial *tsa_serial);
> +int tsa_serial_disconnect(struct tsa_serial *tsa_serial);
> +
> +/* Cell information */
> +struct tsa_serial_info {
> +	unsigned long rx_fs_rate;
> +	unsigned long rx_bit_rate;
> +	u8 nb_rx_ts;
> +	unsigned long tx_fs_rate;
> +	unsigned long tx_bit_rate;
> +	u8 nb_tx_ts;
> +};
> +
> +/* Get information */
> +int tsa_serial_get_info(struct tsa_serial *tsa_serial, struct tsa_serial=
_info
> *info);
> +
> +#endif /* __SOC_FSL_TSA_H__ */
> --
> 2.39.1

