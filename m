Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F588D5765
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 02:56:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Rz+5gUR2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr4ST3jyCz3fxK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 10:56:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Rz+5gUR2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=renesas.com (client-ip=2a01:111:f403:c407::; helo=os0p286cu011.outbound.protection.outlook.com; envelope-from=kuninori.morimoto.gx@renesas.com; receiver=lists.ozlabs.org)
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazlp170110000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c407::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vr4Rn0vsJz3fr0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 10:55:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3WE2F1xHjtuRJvCg7kCCPLvZH2hcQKqjE65AehfTgAaDFk6Z72RgaR0u6h/Xk8/QP4SFzyjgqEuv4Pp9vMT95ytvURE1SM0zPIb8neX6c339Y9FX6vl5dGkIE2BuL6xy3G15VqLuvabrnLLsmnEjnQ+ZBOFKrvO6sDmUXbL7B1cIsdZFsGrR4Fcd5RRayxVt47MORXouqCsQVm3A5gJnYEVQpIRFtbiX2NMwZXKs8BLIJkYReQIL0j9Yj6byMsUuljOk43JxShzrOST4DzO7X2whLjYUaHdzk8sZ0LmJQH0LFAKAppJszm4e7AyU61CSaGoaEKsjFO0Ix//aR+z4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIUcXbFUafmAWyrLtMS0KC2jz2Yc1VAQDEZP54vQ1os=;
 b=b2WC3I1AAxbAIfuu3Xq+oY7Yh8clGjCb10EDbMCXQFh6zq7PYoDzKdjPzC+/S/n8tlwA4PB12FfrckEJJDNZxZvMicrRIaNA0pC55hwqPd250sIEo0UogD2VDXfCeZBnlQX65255SvlYsQxWMsDn5zzjkd1j4i7BB+pajRvt05F/DUy9qktUCInl5KGc678XlU10Z9bQ0cIpjfgqmcvgw4mF31XHXhbUPldijSPDKUOXfufYFvtSD8zcFO96Iy8Sm5bYF392MzjEOssyomjHIAHMmU4Yq2ZQeQQdZSLQ3e99LN8GTdynnj8rD3SWEcSIwHoWMWBTnJlc5YdB/wBQLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIUcXbFUafmAWyrLtMS0KC2jz2Yc1VAQDEZP54vQ1os=;
 b=Rz+5gUR2kAx4RCXsU1cdWnqm/RIQ1xzEHjNK82SRZ5pltba/h8Bz6MhMWguHZsj6teXbuXjT9vjl0Ai+onE/POVSn99ZiB+uCmAzQDHuMuh4MYN7LbVBv6NKRS6BhVxexjC1L0RNXo743y9+GRQOteOSj6w1Dp58P5COZR8D+kU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB6465.jpnprd01.prod.outlook.com
 (2603:1096:604:107::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Fri, 31 May
 2024 00:55:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 00:55:25 +0000
Message-ID: <87sexyvlz8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/6] ASoC: codecs: Remove unused of_gpio.h
In-Reply-To: <20240530230037.1156253-2-andriy.shevchenko@linux.intel.com>
References: <20240530230037.1156253-1-andriy.shevchenko@linux.intel.com>
	<20240530230037.1156253-2-andriy.shevchenko@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 31 May 2024 00:55:24 +0000
X-ClientProxiedBy: TYCP286CA0355.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB6465:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aaaed8a-a809-4ad9-f7f3-08dc810c5b4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|52116005|1800799015|7416005|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?uZqkXrtTEoKrWROtZ9cnrgi1hIoJj37JniApMwJo6YiwzfBpMBJ78KDNestR?=
 =?us-ascii?Q?vtZpL3OkU1OcTJDPDD/3mm2p+gGyEKtsHJH3KU8+ltOK4DVC1X+VSAV7ySvs?=
 =?us-ascii?Q?gBh14uJ+mt2uie6kkeEtHfPgVga6qQXheHttJprJ7Nj7V/F459b8jMNPwCIz?=
 =?us-ascii?Q?eb0cxwwzvLQ/2DX08Ih9rg0VYjAkpxNvLbpt+OyIURG7BGtIjBNBqQmX8pTk?=
 =?us-ascii?Q?T/D2H812QXUR2t7ChITcEXa2lmGQDcowemR9FaoYsDAnmATpZEPwAPNHLsLi?=
 =?us-ascii?Q?b+YKGDB1afQPWVdNhcZO744ijW/M9FbhhiYsGqxAQzPXCzaqMX6soyXV65wE?=
 =?us-ascii?Q?XDNInlu+F7YGo9tWZits2WP3hPUFup2nkM6ceYUdc9sxhLVF24MqxO8rv/kO?=
 =?us-ascii?Q?4vFJAgiFohl/lATNGUdvtZ2r4oP38AQObL49TzQa59nVfX19sofomrd2jnRl?=
 =?us-ascii?Q?ri857QV3bikuh0fqEDKn110jaoJ+JKoVGvhfsPNyLCq46U2C6Y3n51bLsQl8?=
 =?us-ascii?Q?FMwvr8n8FGUxATKAjO4BLLeowbhCPx8bPyw5bkPbHzjw/Kk8wSQYRWOO0a1G?=
 =?us-ascii?Q?PW/ds+JMfN9wuNsNRltVQDjJJ9iKg1/PSAfJshf6kKCCfd650Q/5FMOYGuBe?=
 =?us-ascii?Q?q3Zyj+W6212A+tAmKk1XyssHpss0DWW3nnQyjzuAhjVOa2tkOSRJ/ppypzw9?=
 =?us-ascii?Q?NotL4tKQccVf14xJtDhXrMZSwLj7E15HHq/cJuaBCRN6xcMRFYDg3b4vAgWM?=
 =?us-ascii?Q?nyKNYnxJ/juYrQJ02CQPDJ7jtvdiWQVuL+1xqWNb4ojcr1G8vdfceNKBoseu?=
 =?us-ascii?Q?B7gWArMMvbpRNx8nF7ETKsMkqhiatg5de3UsAtH9D2J3hIfVTWeBNq9P1btn?=
 =?us-ascii?Q?NuqkyM9G1RrVSZs7rLPVNbAx++rGBxS8Cv7sqQBFiWJIk1glvg80FNPZ78Sj?=
 =?us-ascii?Q?bd/m0mKu8QNLyBOAeMdwn4yZJr/qwSK+TYgjLFZEzZnohk0lyTp1chX/+LjB?=
 =?us-ascii?Q?/4uki00E7dtNKXieuaNTszReU/5c+8zubyRTc4oNlzNlxlEjdgkumwEhZJpE?=
 =?us-ascii?Q?ABQgYQkGbPy6uXQJq/a8xbI9fWJszBh3H3Ykf+9BNENsbMD6TcGhUBhPkurO?=
 =?us-ascii?Q?RdgjIWag1NXR99Nuj5T4Mtce4mLdu2ko2pOExL4qzAgSRgusSO5SGHgoS98I?=
 =?us-ascii?Q?WvmCXXW7Li5wUeF2StrcBTQD35OBZbPL6FXRtn23qLdiCL4rJA/FqhdZP8o6?=
 =?us-ascii?Q?zFfMZlaiJV7EoLOhPxRTX+HeuD3qHJhOooGknJWB11VlyWgQ7WYHNq/CTly4?=
 =?us-ascii?Q?+ZMBZSrh1QqoDMDwLOp2pUKdLrR5z0a89avrFQScN5LLew=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(7416005)(376005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?iWL43j4E3yOLMmt6srfNkjtxXfA+1JCe0K/ClfIYZ+OfKb9HyvokIHtnPfAl?=
 =?us-ascii?Q?vWNtjXa1EcYfRiOVM0M7N4SWJr5TA9VI6H1r/9piZIUN31srBJsbHVZTgHcF?=
 =?us-ascii?Q?VuCaIb18vheOaGn/rzR25N3tR7llLRQdK0IpAt8i7ldhuj9/78Az8ZSeKF5z?=
 =?us-ascii?Q?4fdDIU6iorFSo+acsUaP27SKT3LvgWwX06grOXciTsbMXUfNhVwGLqNkBjUI?=
 =?us-ascii?Q?xI68+wfazvu3V3fN9leo9VoRnlWVOFZnbFCUzQtxzrnDYB8kbM5GyMygwkzs?=
 =?us-ascii?Q?v1/6AzuTOS5zxHqQ2TumFoLtUqwVD+YMAEygN3yXK6nnATXJnlp32kgzff6+?=
 =?us-ascii?Q?WVvPSNm/aigNwoISaiWf7SRcz0u37701+EpP51UsAjwIVlI0LSV28Q/tCDnt?=
 =?us-ascii?Q?msxcvo1eVHSQ+TAg9NEwsvxdeL/AJBVDhVpui8Fu64ez0KXIzkeY2glxXzc2?=
 =?us-ascii?Q?UurA4y8Ya9W6X7+OZRubEZ06KuIFUObxLyrGbu1bIZ2evFkdOJgI8ZjNVIcC?=
 =?us-ascii?Q?t3+xInGnd6fDGN20mb5mrH6UEnjpeBEfgJdaHWejKnCM+Z13Y+qysg9e4Gi+?=
 =?us-ascii?Q?J2RxPYeozSUPiWicOs6Eq3Wfnx0q9QkGyRiyfgeaTnTQFdx9ns8nEphsgxIY?=
 =?us-ascii?Q?WHtR3lJgmmsADjGGti0ca5wI+ishYAymBNkA7P4gM7rVtqg09GH2czrOvDS4?=
 =?us-ascii?Q?k2etHlPpjsfl2F0Vnik8Bkb7vuSO0b897dtuZd7Pt/kTEtngi4aDUiOxJwEL?=
 =?us-ascii?Q?aOz563koFBpHILeNrGsSCbt4tSCfJuHEYTmkseRZ9Gv0sui/F6SgJB50fMBT?=
 =?us-ascii?Q?azMPE3/YFyLe6TsxbN5YaHtf0pCi0hJiY63MyZOB2etJY69r/6MSHatZ9Ose?=
 =?us-ascii?Q?u71VFiD4N+/JwxHDms8raR3VD5I8yGH7irs1kAKGtLe8wNm03pxSq37Jnwza?=
 =?us-ascii?Q?ADc5BXKLTQYj0iBGbHsyD5uVSRlEhcBKx9VzOG1DeUg46l/l/YFs3Z1yAUDr?=
 =?us-ascii?Q?Vxqc47Gkou7evB8/HDbC5sVgqmQCFBtsJ0KDMFdrvgDdJKbw0nQwI4PECiAp?=
 =?us-ascii?Q?8JK5ZLxTp/ChrlV2gKZM1EhhAhU3BsOCAAmz4pR5H+y5/BiWSed4HT8+7INl?=
 =?us-ascii?Q?ZPEqqQodvH6zENMeywf45uRclZpm39bEcRf03PJN00ADvLHzCY78EEZCM9g/?=
 =?us-ascii?Q?t069k9pnVdnRWT5nLXZLdQgoVVrlZ8b+EcQmOWuTGOHv30ILGiVYBxbi16m4?=
 =?us-ascii?Q?/v0j9JkLjS5pw49em2fxNDLFKryad0diwmYwNEC6HXXQfMVFPtUB0I7I5hak?=
 =?us-ascii?Q?Z7dVMDZO0rf/K9QPDdjqTZrVHUp3b6pFfm610ak65mfhw1uRNqrInnBQX7kH?=
 =?us-ascii?Q?osdAwwv0V/38tln1wRrSBZ+GfTZ7RJAnfNfkBP+AWvkImGTyymlkwcWk7IUa?=
 =?us-ascii?Q?jOkwD3H0Q6Uc7dw8vfHpMJTZo6e7fPB6hfK/tfnuDcjnI9TQJLhanRfOpom+?=
 =?us-ascii?Q?LkO/7fq9VSn82X34dWHVapI5e0UkhMxrTq4iVIv6b3dXloEDAZWGz83k5N3j?=
 =?us-ascii?Q?4NVVlslUsaDIHwkggtzKll49p4Ooz8ex9N87yvGi1YzxGZIH7nHVmRcAiU+2?=
 =?us-ascii?Q?8O3YZTjC02q3G0wOKor5ib4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aaaed8a-a809-4ad9-f7f3-08dc810c5b4f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 00:55:25.3302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MNTOWLFnUMw+j8LYMFyKGYMZN3qpg7eYhTaQy2Z1UgEcva7vvpgVfRPzu0DNl+qUU4bhwOQmAZdSrcjG7jUuX4QhdMRYtJ+EvlHHpwcRk1IV0mJ1m3zxuYK8+8/RKR9a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6465
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

> of_gpio.h is deprecated and subject to remove. The drivers in question
> don't use it, simply remove the unused header.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  sound/soc/codecs/ak4118.c         | 1 -
>  sound/soc/codecs/ak4458.c         | 1 -
>  sound/soc/codecs/aw88399.c        | 1 -
>  sound/soc/codecs/cs53l30.c        | 1 -
>  sound/soc/codecs/max98390.c       | 1 -
>  sound/soc/codecs/pcm3168a.c       | 1 -
>  sound/soc/codecs/rk817_codec.c    | 1 -
>  sound/soc/codecs/tas2552.c        | 1 -
>  sound/soc/codecs/tas2764.c        | 1 -
>  sound/soc/codecs/tas2770.c        | 1 -
>  sound/soc/codecs/tas2780.c        | 1 -
>  sound/soc/codecs/tas2781-comlib.c | 1 -
>  sound/soc/codecs/tas2781-fmwlib.c | 1 -
>  sound/soc/codecs/tas2781-i2c.c    | 1 -
>  sound/soc/codecs/tlv320adc3xxx.c  | 1 -
>  sound/soc/codecs/tlv320adcx140.c  | 1 -
>  sound/soc/codecs/tlv320aic31xx.c  | 1 -
>  sound/soc/codecs/ts3a227e.c       | 1 -
>  sound/soc/codecs/wsa883x.c        | 1 -
>  19 files changed, 19 deletions(-)

For pcm3168a

Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

> diff --git a/sound/soc/codecs/ak4118.c b/sound/soc/codecs/ak4118.c
> index 9a43235e6a11..23e868e4e3fb 100644
> --- a/sound/soc/codecs/ak4118.c
> +++ b/sound/soc/codecs/ak4118.c
> @@ -9,7 +9,6 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  
> diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
> index 73cf482f104f..32cb802ad635 100644
> --- a/sound/soc/codecs/ak4458.c
> +++ b/sound/soc/codecs/ak4458.c
> @@ -10,7 +10,6 @@
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
> diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
> index 9fcb805bf971..23e50d73b4c4 100644
> --- a/sound/soc/codecs/aw88399.c
> +++ b/sound/soc/codecs/aw88399.c
> @@ -10,7 +10,6 @@
>  #include <linux/crc32.h>
>  #include <linux/i2c.h>
>  #include <linux/firmware.h>
> -#include <linux/of_gpio.h>
>  #include <linux/regmap.h>
>  #include <sound/soc.h>
>  #include "aw88399.h"
> diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
> index c0893146423b..2ee13d885fdc 100644
> --- a/sound/soc/codecs/cs53l30.c
> +++ b/sound/soc/codecs/cs53l30.c
> @@ -12,7 +12,6 @@
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
> -#include <linux/of_gpio.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/regulator/consumer.h>
>  #include <sound/pcm_params.h>
> diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
> index 57fa2db1e148..1bae253618fd 100644
> --- a/sound/soc/codecs/max98390.c
> +++ b/sound/soc/codecs/max98390.c
> @@ -13,7 +13,6 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
> -#include <linux/of_gpio.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  #include <linux/time.h>
> diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
> index 9d6431338fb7..3c0e0fdbfc5c 100644
> --- a/sound/soc/codecs/pcm3168a.c
> +++ b/sound/soc/codecs/pcm3168a.c
> @@ -11,7 +11,6 @@
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> -#include <linux/of_gpio.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  
> diff --git a/sound/soc/codecs/rk817_codec.c b/sound/soc/codecs/rk817_codec.c
> index d4da98469f8b..5fea600bc3a4 100644
> --- a/sound/soc/codecs/rk817_codec.c
> +++ b/sound/soc/codecs/rk817_codec.c
> @@ -10,7 +10,6 @@
>  #include <linux/mfd/rk808.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <sound/core.h>
> diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
> index a7ed59ec49a6..9e68afc09897 100644
> --- a/sound/soc/codecs/tas2552.c
> +++ b/sound/soc/codecs/tas2552.c
> @@ -13,7 +13,6 @@
>  #include <linux/device.h>
>  #include <linux/i2c.h>
>  #include <linux/gpio.h>
> -#include <linux/of_gpio.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
> index 1dc719d726ab..5eaddf07aadc 100644
> --- a/sound/soc/codecs/tas2764.c
> +++ b/sound/soc/codecs/tas2764.c
> @@ -15,7 +15,6 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/regmap.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/slab.h>
>  #include <sound/soc.h>
>  #include <sound/pcm.h>
> diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
> index 67bc1c8b0131..5601fba17c96 100644
> --- a/sound/soc/codecs/tas2770.c
> +++ b/sound/soc/codecs/tas2770.c
> @@ -20,7 +20,6 @@
>  #include <linux/firmware.h>
>  #include <linux/regmap.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/slab.h>
>  #include <sound/soc.h>
>  #include <sound/pcm.h>
> diff --git a/sound/soc/codecs/tas2780.c b/sound/soc/codecs/tas2780.c
> index a18ccf5fb7ad..6902bfef185b 100644
> --- a/sound/soc/codecs/tas2780.c
> +++ b/sound/soc/codecs/tas2780.c
> @@ -11,7 +11,6 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/regmap.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <sound/soc.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
> diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
> index 3aa81514dad7..2eb3b384f9e7 100644
> --- a/sound/soc/codecs/tas2781-comlib.c
> +++ b/sound/soc/codecs/tas2781-comlib.c
> @@ -14,7 +14,6 @@
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/of_irq.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
> index 265a8ca25cbb..d6afab542da7 100644
> --- a/sound/soc/codecs/tas2781-fmwlib.c
> +++ b/sound/soc/codecs/tas2781-fmwlib.c
> @@ -13,7 +13,6 @@
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/of_irq.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
> index 9350972dfefe..c9086fe42419 100644
> --- a/sound/soc/codecs/tas2781-i2c.c
> +++ b/sound/soc/codecs/tas2781-i2c.c
> @@ -21,7 +21,6 @@
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/of_irq.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
> index e100cc9f5c19..eb180df9a72a 100644
> --- a/sound/soc/codecs/tlv320adc3xxx.c
> +++ b/sound/soc/codecs/tlv320adc3xxx.c
> @@ -25,7 +25,6 @@
>  #include <linux/i2c.h>
>  #include <linux/platform_device.h>
>  #include <linux/cdev.h>
> -#include <linux/of_gpio.h>
>  #include <linux/slab.h>
>  #include <sound/core.h>
>  #include <sound/pcm.h>
> diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
> index 41342b340680..d594bf166c0e 100644
> --- a/sound/soc/codecs/tlv320adcx140.c
> +++ b/sound/soc/codecs/tlv320adcx140.c
> @@ -12,7 +12,6 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/acpi.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/slab.h>
>  #include <sound/core.h>
>  #include <sound/pcm.h>
> diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
> index 4d7c5a80c6ed..2f94cfda0e33 100644
> --- a/sound/soc/codecs/tlv320aic31xx.c
> +++ b/sound/soc/codecs/tlv320aic31xx.c
> @@ -23,7 +23,6 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/acpi.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/slab.h>
>  #include <sound/core.h>
>  #include <sound/jack.h>
> diff --git a/sound/soc/codecs/ts3a227e.c b/sound/soc/codecs/ts3a227e.c
> index dbf448dd8864..b9eb59e3bfa0 100644
> --- a/sound/soc/codecs/ts3a227e.c
> +++ b/sound/soc/codecs/ts3a227e.c
> @@ -10,7 +10,6 @@
>  #include <linux/init.h>
>  #include <linux/input.h>
>  #include <linux/module.h>
> -#include <linux/of_gpio.h>
>  #include <linux/regmap.h>
>  #include <linux/acpi.h>
>  
> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
> index a2e86ef7d18f..8abce2160d65 100644
> --- a/sound/soc/codecs/wsa883x.c
> +++ b/sound/soc/codecs/wsa883x.c
> @@ -9,7 +9,6 @@
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of_gpio.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/printk.h>
>  #include <linux/regmap.h>
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 
