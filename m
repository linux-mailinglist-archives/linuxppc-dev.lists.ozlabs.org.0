Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 415615A5BE1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:32:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGyCY44bFz3cfJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 16:32:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=YGKikfhz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.8.44; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=YGKikfhz;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80044.outbound.protection.outlook.com [40.107.8.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGyBr2WbSz2xJR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 16:31:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6G4lF/fqeoYMmcQ2t2ooUIh3Gr8Dz1kH+ddvPybh744/Ie3rf3HPMPnLrW4cmL0pQRNd7srZOi1qb5+NzuSVLoEgPUOLrOpsP8MmJbKpN+jgC7c7Z8cjpwFOGv/5Ce2JHQ9u7qKctclAgSXrCW55ZciKFxxnNLC5h4uh4+IPSaOdNjlk6uZqffnx8VSQon0OezEet/AisrgUURVby5fYF5MoNSuRwrryjub++YuKMz76mzAWRGeQtciQhPvHXfLT1NR//kskrviFOVCnEJo54ziOLaeHM/Q7xpEh3rWk/6DIJooZJLmih2DwG2fUJFQc79jiyiW0L2zik6wzmFkKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwXP5SMtyE04bOBH8XFq8vDH4DxauUpXC3pR9MeQTgA=;
 b=P/bkozPZ4UH/uoK+BVT5Jm2BbYnnUo0KlEimuvqoyQ9Vm34n1NwitNZNXSj3cz9eQQ+0QKAl/zxPPVdHut3bOPI0yIImt/sKnwsirtmqk+zcQXQXzA2GIIR0kuGsgDsTJo2e6+QlhvmrjBlChyhkuV+1qEukqCkBVbviRcKZJ5ZYPJNoA64A+Pw+qNUUDszL5uYY8uCgIPrDK9FF7c8rFnWKtHlR63CZ3oA0bUm8gmI14vIfOSJ4RoEPxfjWaYJEmrlQQXjLegaBr9mx2gNBWkgXy7Aci1/7AcdkX2XDcpg+OcR1J18+FcJ6NiAFE4ib1IdboyH1+B6QRhX2RwlHjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwXP5SMtyE04bOBH8XFq8vDH4DxauUpXC3pR9MeQTgA=;
 b=YGKikfhzBYl4j5zAvRuDxbcfxBwijyirgw+FV5Hvb2mz80QHUgAab49JzAYaVhGh66+T2TeYS6ikLiQGmTZsMPcEzQThbnQ02aw06NaZ7MJ8wMEOjDszCLhP94+RMrxtwP76oG7RtnMcGU6wFFq2Y0kaxOr8owukikq1Tv11yg8=
Received: from GV1PR04MB9183.eurprd04.prod.outlook.com (2603:10a6:150:27::9)
 by HE1PR04MB2953.eurprd04.prod.outlook.com (2603:10a6:7:1a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Tue, 30 Aug
 2022 06:31:28 +0000
Received: from GV1PR04MB9183.eurprd04.prod.outlook.com
 ([fe80::28cf:2839:247c:b34e]) by GV1PR04MB9183.eurprd04.prod.outlook.com
 ([fe80::28cf:2839:247c:b34e%6]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 06:31:27 +0000
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
Subject: RE: [PATCH 3/5] ASoC: imx-pcm-rpmsg: Register different platform
 drivers
Thread-Topic: [PATCH 3/5] ASoC: imx-pcm-rpmsg: Register different platform
 drivers
Thread-Index: AQHYu3zMYmOVvaPO90OGp9+KALSMdq3G/IvA
Date: Tue, 30 Aug 2022 06:31:27 +0000
Message-ID:  <GV1PR04MB91831EF183F0D0E6E9BBD9E9E3799@GV1PR04MB9183.eurprd04.prod.outlook.com>
References: <20220829075144.2405000-1-chancel.liu@nxp.com>
 <20220829075144.2405000-4-chancel.liu@nxp.com>
In-Reply-To: <20220829075144.2405000-4-chancel.liu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ac7239c-22ae-4bbe-6d4a-08da8a5144c1
x-ms-traffictypediagnostic: HE1PR04MB2953:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  dOYEdoikss+2Yc81n2hVhSn2Z1VghPmHm/Qf9o2G1Qdr2peqzJmsImJWyTkaEjuMEnjeobJZ8koDMu4d355O7sOneMHKCuu0pKRjZerqKexzFL4bpNNEDcRKKrFILzF36hp9MW8zKL4xWLJuouGLERVApHR/8Hl1K6oJnBlm8oWx8B62oH/kEM/XiqbvoxBFYUI7bFoIw5xaAltmPFC4jHQDYu1/PanI7LwNxZlA5d393NOt8Yh/JE1a6r+vs+z6kl5EHF2jxp+ssnq0R2cnX3Etk5NqWmRpUWSWzk4KOi8oZ9VisOCc+DhFKZ/HSpAswtN9WBTtMHU0b9h/PI8/IFqtims5uRzbSSHA4AFPsoayqCQO/LwU2OiTCLQRutLX6dbLHHNpTeCrE9O1BY4g4fxAIoJQ2zwoJLOTXghn0S2tiG+9XneVDUxNt6raDUyTqm1j2xaiwuEUchQENNgQK1onJlaoJFE3MVF25o6/0zKwbA7ckT4Y27HZ8b71CTSPJY1sVUIA+4FqJXTSz0B9o9PqGewjqsAf+uVDRihB9UQLdgGf4s8B5O+wF9+xi9JzHBFnbgCHhmGuqqiCoEApESw96tSII0ECU1u9AY87CLuJ2SQJZpQW2yU2ayGwwEOKMX1KQU2B/Q0QtlaBcRs7YclwkjSnK+sqYqIQurhEiojBEnjt9K/zWfdB++RTmEjjisqScZBufpao0Jcx+UM8ZFw+4IP/0lNjj52ilHoZalhAhSSlq2Ac81N2QyJUQK+e2PtyGzm62yBWXib2mWM9XRVGXP4AOJZ3x3jsHo2LSVc=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9183.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(26005)(9686003)(55016003)(71200400001)(86362001)(478600001)(6506007)(7696005)(41300700001)(186003)(38100700002)(122000001)(921005)(38070700005)(83380400001)(66476007)(64756008)(110136005)(2906002)(66556008)(8936002)(5660300002)(8676002)(52536014)(66446008)(66946007)(316002)(7416002)(76116006)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?JgPjEXyfkwNiYPny0Ak2giJX+K9X89haSEnSdfDG2miCpuDusvUz50wFRHiR?=
 =?us-ascii?Q?jS09GEeRDCglumeNXLNN6mh54QRmjHRyLVsceTGQtMdL27WBI6q9qY/b2x2s?=
 =?us-ascii?Q?AYBdMY1yo907M+xw7wX2jNDZkV1TqFOA0toTnb0oc3HazCN6vlNZ1t6EIpXc?=
 =?us-ascii?Q?j6dOIgDLxj66DcdQsKdfxWp4tsq22YupagBKr96waZky3LgRirGdBuo2E0Fn?=
 =?us-ascii?Q?UXjkbZJP/jbu5Q3AMnd21XuexYz7cDLsXUMf8HUtm+ej0grF8f6UWajgDAFK?=
 =?us-ascii?Q?VnICVfp08mBtWke2D4cr6dKxg74mOkOPIdeL6fOrHsxKRuxnUu8JPCnSUZfg?=
 =?us-ascii?Q?uV9dKbbeOK3s8HPFoQZLJlnGwAkkMBbyQbOA6ito35swcoVdAeoY6GI+JrFx?=
 =?us-ascii?Q?1pNgo+ktxa0RBZ4SZzbLrC4j/HI/3/lrKPZLH/AMc/0BR1SpYCzRjnG3Fd37?=
 =?us-ascii?Q?VLN5Or2eeS2SsaSeMgDBgNoKYnnUqxGgGBR7UBBOl7HD8f67wwni93ANHv5B?=
 =?us-ascii?Q?SINhYO5BpYeQVVf87spqw9cQChA5ggD1gCTB3rb3CmDeyYDOqGm6acPvesdR?=
 =?us-ascii?Q?LKzC7rB+a1DaiGw2CbHMz4Zx4hodvTZwX3w2X7yNrAYNSkNJU0ec8wetPn0h?=
 =?us-ascii?Q?2t9cwmMdyV0j1kWCwbfYvzqskhfRMfB8oUtJyZZou0wAAJGbN+6B8LY+cteR?=
 =?us-ascii?Q?dIhNR0ihS0xH/ttWPphOFa5DAJluFEgEE7ZKf+NKomrxg0rAo6t3lZHQ2HUI?=
 =?us-ascii?Q?UTVcpNd3gl75C8odwPpqHBfYxiFENAjuZ6uM6DFj2GM7vxb5Mwnh6KryGG0Y?=
 =?us-ascii?Q?qRFF00+Y71MDPZNK9IkkkSP2sY4l4+D7RvdpYznkmHl+HtceD6TgS/7vZcGD?=
 =?us-ascii?Q?OmAsuf9S64tKwCRllqrX6r9/je4yxmFVN4LFG/nnUVIoXYFf+Bd1kRvZU1m1?=
 =?us-ascii?Q?4hWO6x3n9ceBthAGTo0R43QDNFJbma3yAg1UjlEJBqbW9QJorZHzTJY6v+Gz?=
 =?us-ascii?Q?oNU/xVa5e2EELXs6T3+DmkYHxULL/89/otOuSUbx49Zo8xuCVjdQh2MB47DY?=
 =?us-ascii?Q?/GxNpgKnf6fUWlzpT4oCUVnjTzWkKBTh2FXzDE7RLhDhB4MdzhkiJgXDC+Ba?=
 =?us-ascii?Q?GuVwBqLoCEcW4MohRB1Wgl2QUikxmhXC0XMmJNazHqBaN6KOF3dS5Z8L6ppS?=
 =?us-ascii?Q?K8Hy597vfOi2qM+v8lAESdcSBXt02nFBTGTFzwHy7Qp/08PCf+ESZok3zYLi?=
 =?us-ascii?Q?8e8JL8dYUzkaRzZQI8IcpFzOqQKt5pCJEYMldLTxRiFxGXXnFZTn3MgrGEWK?=
 =?us-ascii?Q?Sm95BHEn6z4TpDroFTTCR8EQ2c0YmzcNgYMUYORKauiyl09v4Fo4l25rGRbo?=
 =?us-ascii?Q?8i0441I1wpbg5QdpGosueDIfX4Jj0L0KsEd+/wA5oa+mU3mu1XnpcQE3iRiV?=
 =?us-ascii?Q?6e+okwl2zbBvmvqgymt3KQOPJqO9pOyKW7aFIlylMxBcUlvMaq9SDxluAZzJ?=
 =?us-ascii?Q?3A6zlm7NwTBvAAZXPskSo20GGvNKy/rCahWR9xeXef0jgoWhVOqCj063FCUt?=
 =?us-ascii?Q?VPlUjtjZBsoYyGjf09l3LMjyCgYQnvsEMsn7n7FJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9183.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac7239c-22ae-4bbe-6d4a-08da8a5144c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 06:31:27.6545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OMFquitHciJcD1/o+xGZuiwGbI3+yMjot0X5rrpTBYQeyMJHyZK9hV52b1G5peKAciLCf9typo8dCWvNZXjZfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB2953
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
> This patch can register different ASoC platform drivers in reference to
> "fsl,platform" property of the corresponding node in dts. So sound cards
> based on different rpmsg channels can link to their respective platform
> drivers.
>=20
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  sound/soc/fsl/imx-pcm-rpmsg.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-
> rpmsg.c index 35049043e532..2f310994f7ee 100644
> --- a/sound/soc/fsl/imx-pcm-rpmsg.c
> +++ b/sound/soc/fsl/imx-pcm-rpmsg.c
> @@ -178,7 +178,7 @@ static int imx_rpmsg_pcm_hw_params(struct
> snd_soc_component *component,
>  		msg->s_msg.param.channels =3D RPMSG_CH_STEREO;
>  		break;
>  	default:
> -		ret =3D -EINVAL;
> +		msg->s_msg.param.channels =3D params_channels(params);

Please use separate commit for this change, I think the fsl_rpmsg_dai. chan=
nels_max
Should be updated also?

Best regards
Wang shengjiug

>  		break;
>  	}
>=20
> @@ -684,7 +684,7 @@ static int imx_rpmsg_pcm_probe(struct
> platform_device *pdev)
>  	info->rpdev =3D container_of(pdev->dev.parent, struct rpmsg_device,
> dev);
>  	info->dev =3D &pdev->dev;
>  	/* Setup work queue */
> -	info->rpmsg_wq =3D alloc_ordered_workqueue("rpmsg_audio",
> +	info->rpmsg_wq =3D alloc_ordered_workqueue(info->rpdev->id.name,
>  						 WQ_HIGHPRI |
>  						 WQ_UNBOUND |
>  						 WQ_FREEZABLE);
> @@ -723,11 +723,15 @@ static int imx_rpmsg_pcm_probe(struct
> platform_device *pdev)
>  	if (ret)
>  		goto fail;
>=20
> -	component =3D snd_soc_lookup_component(&pdev->dev,
> IMX_PCM_DRV_NAME);
> +	component =3D snd_soc_lookup_component(&pdev->dev, NULL);
>  	if (!component) {
>  		ret =3D -EINVAL;
>  		goto fail;
>  	}
> +
> +	/* platform component name is used by machine driver to link with
> */
> +	component->name =3D info->rpdev->id.name;
> +
>  #ifdef CONFIG_DEBUG_FS
>  	component->debugfs_prefix =3D "rpmsg";
>  #endif
> --
> 2.25.1

