Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FF78D5762
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 02:55:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=RbAilqTQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr4Qr1vW1z3fr0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 10:55:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=RbAilqTQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=renesas.com (client-ip=2a01:111:f403:2019::600; helo=jpn01-tyc-obe.outbound.protection.outlook.com; envelope-from=kuninori.morimoto.gx@renesas.com; receiver=lists.ozlabs.org)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2019::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vr4Q72gj4z3fmb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 10:54:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldqcJh5Ld7xkUBljUE8iTd9Q8oOTDpvmr7V/eT0uz+ilxhEF9Atunb3LrN+fvp+/lVnvF6Jp1vxBn27wUX5qjMUWAcEXBKMVagcUqEjftZOlscpG9gTvcuVj//IHvUkLXV9bcoTCQKWjUsdsLlcDUjsJyf+2xCtOhP1z+DQrsNtRD+3fIGDd02P2biyWskfTdcNMjI+KoKTpyDpukDEJuj7g93JA2varCuFXOFCJNAix27EDYZoj0pXqPOAihXC/8LaZHlZfW+qWXAgSdnGHgRJAb7qWPVTOb7XM9QvPEDwDObKV6JbLrHujweDAnZ2jqcxT8D14OuoE6yGFv1zzlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnRiCj1AQxC8bQ1vaKb4r/rrpq8eEUrHlH4nakrZoPk=;
 b=N32Q7HjD32hkFvIF8Bwq48sTIophCCzf3Ydz+iJ7voduUcmyCBkOzLHQ60hj8D4UH1l05SjGwBWFvKKo5HxXfOVNIEDlb9wYWN8fcPTau49wSHqWsreVW7P26TKHqXNcNHBGPSSrZz0owClZZdj6144sR4fqeX3BlQ2lDH/rAtfVWraAgKBGVRMJ/C416bBoEaDsaUbssduJ8LbmQ6PRleWEPMNfR+I+AW/GvWMjB3SELpEmaMHVV1r22txp70bxu/jQcskUmnn0ZnU9HHtGO0yej4sdWE/n7RGm3x/WErzn36XsPkj/6ZzXz+zWcRB9XcdBEDPqUqKexaB+M6IQGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnRiCj1AQxC8bQ1vaKb4r/rrpq8eEUrHlH4nakrZoPk=;
 b=RbAilqTQboCZDt8NRzhogQcAZ4GpocXYzjUZiA3rVYIFhPulzYA6wKtmSMAUjjH3RZfV8PA49tN9eruoZMLuhi/IPjQH9qxH38PwtM+tMjGrtMgtnD7xMleSXXvbQEA/v6PtNxaRMvqzMUEHO6Fm5hvwZXFIzzcYsL9Sz3T2u1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5878.jpnprd01.prod.outlook.com
 (2603:1096:604:c4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.23; Fri, 31 May
 2024 00:53:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 00:53:53 +0000
Message-ID: <87ttievm1r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 5/6] ASoC: generic: Replace of_gpio.h by proper one
In-Reply-To: <20240530230037.1156253-6-andriy.shevchenko@linux.intel.com>
References: <20240530230037.1156253-1-andriy.shevchenko@linux.intel.com>
	<20240530230037.1156253-6-andriy.shevchenko@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 31 May 2024 00:53:52 +0000
X-ClientProxiedBy: TYBP286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5878:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e4f55c6-91dc-4aeb-1396-08dc810c24c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|7416005|52116005|376005|366007|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?FcTy7MQ7xyKTS4c9yoBZPRb7bK2E9+bilpN04gKeG1jtR+q2MoIc9mESWumd?=
 =?us-ascii?Q?/krM3QB9LgbHjRjAmWjwGAcxw7WXp4hlJmZzXw5cNSpLSyat8gEbKtcMS6q7?=
 =?us-ascii?Q?3mulwm/0GKomDvA9IGhhLd0Py+Mq1GP31vTPoN7bizCL1CPouv7K8cy1rYRV?=
 =?us-ascii?Q?NaSeLchd5/IazjqzWootuyfGj8IeJ02FJHkRO2EZL0RpDOmufraPkWKGDfp7?=
 =?us-ascii?Q?caVCVZBsA8LJrL8nGGLklKwytlFYAcM0XmeK6a1fymfOasyGhxkogMROixML?=
 =?us-ascii?Q?5aZxYiIowuiJrQOCZwTuu+UZ5wNKQ3m7fRovt7ZKDtm4zz2TKHRvnZnjaeDX?=
 =?us-ascii?Q?rEWOjSs5FMC40XpN4O1pxsQhyeih5q9tR1WExRPznHiKUv/p/vYyGdq2dz6s?=
 =?us-ascii?Q?HjiECxXijME8OV1FLkVib5yJcrLr2tkluI+kYLN+PSvbfSnGm3nZ42QFTU3K?=
 =?us-ascii?Q?4UgnPcmfIRAHI518NDRPviMm2JgR1zGCRTK1Sli8Ui9nX33xWeWpMtoO4dMQ?=
 =?us-ascii?Q?LDWUEN8+2qvENEQDRzQxC1xSePa9U/XnqQrbReZ+LLuioZFoauAxWwDVq4Bs?=
 =?us-ascii?Q?uxO0XMZuPg0TQOGCV8zH8rqlWXDO77unO3nltwwYw+gBLm+q5sMO4iWKvSh6?=
 =?us-ascii?Q?l1CaGBl0muIdkJCqv1oxt6aBgtalvViouHTQ1gv/PMF//B3KMzoGWKgabkHX?=
 =?us-ascii?Q?OQfLPTV/YF2aC+c1dvcJ9wKbCXptpxhTXLeHUf+bTJ7WZ1FnwlAOwiTqRSuL?=
 =?us-ascii?Q?LSUHnxZ8cnYAOVfAcfOoZhBwtkYbvWWl1D6HD3WyCGn9cHHKaBbPjzhyMqwg?=
 =?us-ascii?Q?P3nsJBACkDlO8gQBML9d52j+6FZRYfI3CFIjIbpXBgBA8SUQvu+7og8CdDMP?=
 =?us-ascii?Q?+EWAfwHjRPqcRiO/LtvQ4jHFGRFy58Y1RS24JZ8/6pbrHqdwWewuLco+1/7y?=
 =?us-ascii?Q?VaKCcowxqGLVSLIlVTDlefPbo5/tbn6b8tTKmzInkQ6xgbteGHKFJuZBHkc1?=
 =?us-ascii?Q?io/XA/R7Yu9y4WtFbam/3FOlYiZwZ4FzTrHwZbPaRhJmWwsL99nL1nVGh0F8?=
 =?us-ascii?Q?jmu8AbSmyLqY5Kx91xfxH/As/ni0YDCnMuaNqMoEjPXrJkwatmT2UHw5OeT5?=
 =?us-ascii?Q?mkTuUzEMikXdaq4okJHcZgPObqAjAs+0iz4empLa0QNDHUBCc6KhgUh50+HB?=
 =?us-ascii?Q?eWg3p2dU7Ef5nKkYEKO7SzymvLXUUOBscJ1eiL57FjBRFz+Cb3/wVuQ6dp3f?=
 =?us-ascii?Q?Z128LK3W1rERk63rSgRjLT1k0UWdLd9tTUIwFSXLgEgC9fGvqnCEbopl/aJM?=
 =?us-ascii?Q?PHztpppKeVcJ55XbJBnrpIaRtQb1wflpuDad1e3avLLqZw=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(52116005)(376005)(366007)(1800799015)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?1QoiMPO9V4W++16/btjwcNhUGxFGhYkenaKB6OqQXvXq2eYDLfzH8VeRjWf5?=
 =?us-ascii?Q?DnMamy4bISYdRBa2FgOxlmiCvteVjaTuw7ZBmLLWFDwpncFx4ZBn0PYpAEtX?=
 =?us-ascii?Q?r6w8Q7IEo8mf7czMtTuJExvWrDE6u+/raoTXU0iV6wM5GgNhNYOZgVziUceH?=
 =?us-ascii?Q?6O5Lgn/yLk0Bl9aAHdWCR/N/OC3XBBSqIaR8ysn/yqE8Frav2FOzu5xDZmlA?=
 =?us-ascii?Q?17V6Uo1c7rththBsLtvCKBcPXtxcZh8uA3AKiQm8bRZ3DCTwF0Mwb6uw0S+l?=
 =?us-ascii?Q?oNeOX7Bt+KzWi277A0W+Rbx/w6VNEDJGybC6Ek5TPx4VYjG1TJXITtGRbpUb?=
 =?us-ascii?Q?wg1yhkUg3ud3HDRJYBucXx/wWloZ6wmdX33GCO7R0gvYsGv99kk9psCGtjUT?=
 =?us-ascii?Q?iXdilPEBe8KcCtPfJf5NT197ITCuYjh0o9MuJvfsTM/9iplnGXYaGcMTePK8?=
 =?us-ascii?Q?MOltUlj6y3mmJGW6laHt5pnjWdv+1D9lALiyS0yqIZWY988ZwpNhQdUT2lfl?=
 =?us-ascii?Q?wypL748hLScMYh7tSBqNKFp+KtzuXUrDqGnwKQcl2Ddls1PNIOP/30NH/1na?=
 =?us-ascii?Q?JFEmqsodnRhXfKN0e94T6QuaJVqlqnV0b9HXA/zkUuUAGGu59D4TrKwiMswz?=
 =?us-ascii?Q?mxWFZMQFW1P+AdTsdxYA33o0fdb/Qia4u2Mj7YXiTGvDM2R0Vy/BrldY7gyP?=
 =?us-ascii?Q?l5No/oewJmHQFNmJpT/P0ggB8BhqxYpo83ekkOzU1cZDN7ZnTcgVr5JMBtKR?=
 =?us-ascii?Q?Hi/Mk1TWUIExzRiJIVcaPw2XvpyA8tcMoSLRu+WaoLBJaphEDnGS59a9JArn?=
 =?us-ascii?Q?OSAvaEoaDS3pXTDt+AEikh1iBWeDRn8E3UtXgZT9dLH8xe2Y6y7uYnHzoSbl?=
 =?us-ascii?Q?hB3tVEiJZTcYHuD/p+ljfREUWJxKpqTqsjyrtImzsXTgXu2Dk8RadNIKzBPq?=
 =?us-ascii?Q?FTdVwsztiF8MMlOg/JZG8VNpTMFg3QqaOTZ2fWO8nV/f7ovZfgJ6vbgAFm8Q?=
 =?us-ascii?Q?E3C8jxHAnLlPCKD/CiIpcK9x6KlJN8gy1UI9z8kdm+03AP9O3FuWdLz/WPn9?=
 =?us-ascii?Q?XUgcv6kzGos4ajkUxrvFr+hXYFXLcUINFhEkQgQZtCSZM6qGl09z8YnEU7Xc?=
 =?us-ascii?Q?9J4+VNIouNeYXEVDirpTVQpsUHdLXFE9S7GEeQcrylBRJ+UJPCeTnTEykIDf?=
 =?us-ascii?Q?TnkS+52oVOF8G1XuicPIPuZR2yzrg/Zl/DWmhlxFNJMtawO91oAwXkDFjAYD?=
 =?us-ascii?Q?pQ9yOI4r/MIDwjF8Nj+geg8W6epRGkYf3piYWdZQd5wkWTPxcyjEftpa6hbe?=
 =?us-ascii?Q?UXyOcp9VTIkqVdVThlM7Dvd+b0bFZvy/EuosW7rTfeXk/1XlAetd1ttrIyRG?=
 =?us-ascii?Q?ue9deopyDuf9NbXbYbafCBEW+8kZkSPit2Qt8GYGAMPO0R+dcoMFFfKytTXP?=
 =?us-ascii?Q?y0snhxvFrTviorFLxpTCrMSltyecInqq4Oq5/fFvsH7WlsArnV6HF2EFRX3+?=
 =?us-ascii?Q?W6a2C1p2VkVAO5HloxAj7JhXNiUZaGDqL5Un/5fpJLhiZDBxaiOQJsKzQIMi?=
 =?us-ascii?Q?zvNWAzJus08zqKv9tQMDVPi6TOpzOjGce+4kY90plbccHL4lBs7aN+TiRDlL?=
 =?us-ascii?Q?sVsxkc2JtOFlF0N8dM7sbHU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4f55c6-91dc-4aeb-1396-08dc810c24c9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 00:53:53.8027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UEoiBfS38WCwrjH1iinINsLH5zNJ1YSawDVd23YcpQMjC6DBwvgiR7nyh0nYjm0dC0/UcVSTo+XGRVNJ1+ORl0iaPQbvdHjotm0YbGR8OZb6aMWdRabspyZSBg/ARmMh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5878
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
Cc: imx@lists.linux.dev, alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>, Xiubo Li <Xiubo.Lee@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>, David Rhodes <david.rhodes@cirrus.com>, Kevin Lu <kevin-lu@ti.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Shawn Guo <shawnguo@kernel.org>, Alper Nebi Yasak <alpernebiyasak@gmail.com>, Rob Herring <robh@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-rockchip@lists.infradead.org, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Baojun Xu <baojun.xu@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shenghao Ding <shenghao-ding@ti.com>, James Schulman <james.schulman@cirrus.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, Weidong Wang <wangweidong.a@awinic.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Chancel Liu <chancel.liu@nxp.com>, Banajit Goswami <bgoswami@quicinc.com>, patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi

> of_gpio.h is deprecated and subject to remove.
> The driver doesn't use it directly, replace it
> with what is really being used.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

>  sound/soc/generic/audio-graph-card2-custom-sample.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.c b/sound/soc/generic/audio-graph-card2-custom-sample.c
> index 1b6ccd2de964..8e5a51098490 100644
> --- a/sound/soc/generic/audio-graph-card2-custom-sample.c
> +++ b/sound/soc/generic/audio-graph-card2-custom-sample.c
> @@ -5,8 +5,9 @@
>  // Copyright (C) 2020 Renesas Electronics Corp.
>  // Copyright (C) 2020 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>  //
> +#include <linux/device.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> -#include <linux/of_gpio.h>
>  #include <linux/platform_device.h>
>  #include <sound/graph_card.h>
>  
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 
