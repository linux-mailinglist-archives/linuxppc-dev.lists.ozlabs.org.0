Return-Path: <linuxppc-dev+bounces-8857-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC23AC00C2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 May 2025 01:44:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2p0h4jv7z2yyJ;
	Thu, 22 May 2025 09:44:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747871044;
	cv=pass; b=EBnz38NjUDCUmgMrc2NV4eSuGwOtYnD0BzCltahICwSvHlp9v+1FulTRmnXmI+BVi+g76fcT/nVUMXyiJgcdq70oBzOp9ixb4aE5xU7myEssDgsaknL2hZuGoos3KxLOgXbHOVdNnPwJRIdxaOKZQuHoPJmNFgZe1TcoIrsi3ixnvASclt7lu8om7EOQv2x7mMgR/MxRXD/aKqq/Yavtdkz04e6YZDlM7MYNExBlUb0jvylF6UQYxU1MW6/VsQgZ1LNT5m8PL6F4xoetzDFjWmjuM89e2OACnn5EFTrgxtyqOL8ayLPlKeEY9FpzhELzXPnHQodiJpf0qK8eo3cngA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747871044; c=relaxed/relaxed;
	bh=ONXpzbGBY9Gi6u+uI9TFzb0j8tUB+P2CZnn0mBEkYBg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZRVkeTYeiGnGCmehgw5YHqZsXGbS+WxDgVlWSdDqhJFZb8Lf+LTSv0C9swWgeG4zqC1EIdsSij59V5QV+Wxd5SOlW/+uxrvYSFLiVYhNI/9LcJaijIXGv+dlRrH7UByoiWXLGzkq7xTBGxw3eGGKHGYKFVFjaQX2JTrVGgBfCtstkSZnTwQzuJIwN3E3KZ4i5enG5xnb06wyPsMGv7KlAyp5msIf0kW0Moh5SzrgN/cj1T3pdHPapi+sHtyEOiMN2C23Uslnt/HVhZIF54xoZ002abY5NIJJIHsdx0P0xJ/EgZeeGQirPC2F2fq4kDkqMVTxxtz7V7sweGmqnEpP+Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=renesas.com; dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=pBDVCEQH; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::1; helo=ty3p286cu002.outbound.protection.outlook.com; envelope-from=kuninori.morimoto.gx@renesas.com; receiver=lists.ozlabs.org) smtp.mailfrom=renesas.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=pBDVCEQH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=renesas.com (client-ip=2a01:111:f403:c405::1; helo=ty3p286cu002.outbound.protection.outlook.com; envelope-from=kuninori.morimoto.gx@renesas.com; receiver=lists.ozlabs.org)
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2p0f4vNCz2yql
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 09:44:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZoQ8hYYm7i/Qsu9zu0PhOr3wheGqedyHLrNEgZciuvxDb+QQdNHwE5ykzFl3gm9835Pxj8si3NWAvWvFectOBRtOrNrugprXv3120UcueEbooiBemvD2+q6J+XuPHLSCvMmOQZA76gN/f2UlOpDI5vkI/LMDRlBvH4bYzZlZqKHraj7Yx2Krzj5sLlCK2q+abAKEnUde6eBgNsK1nstZnJ4wnNynqiwxBiDB4dfyarQWiGqfkyRAPT4CVrDsSs4uSym3netxBXQZmt9YtCdjrHJ04oSio0lELZau0ApyHGjjBN/gghnymIqIoQLsTAUuB/v0pNf/RXyALI/IhT1fHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONXpzbGBY9Gi6u+uI9TFzb0j8tUB+P2CZnn0mBEkYBg=;
 b=BbvUlwJXTdMYsD57rCd4zXxetSeE5q6gaxgd7oVaUIkMTiMe+iobwSx4IRsCs6ZKpfiEcU4Xu7tAqsrUgPNzG6gbOHknKowKdGgx2S7mscursua0uA/GLeZKaKTSSGE1tuIJUcDZCn0hVnjX8V1JhoABK8CBo6oH57ejZrk7Y2cwe46Xs7kn678AXJJkTdQ0Ey5HMpyYV6SuBHPGbRcvglZmSn8VCRt5s+pc2LtmCpAQf6GNL2TMBt5q+y/HXe/4t77Oryg67U69YcGmJ81F9sdTX2LsOPOvfsgXlGdjizibkMc/2J5Fc9fb5R0nbiH+uXW+bYqrPFLf+TlWTauCIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONXpzbGBY9Gi6u+uI9TFzb0j8tUB+P2CZnn0mBEkYBg=;
 b=pBDVCEQH9rBx+fp+BbGNcsjRfnMF0RkMakFlJxOK50lm+mdYbUtHrKVNlMFggmWR4cIGd4sSY910LpBM9KFZELd26o/ryuJXmyTwcobNq8RKHl2uLx8f8EeoAogrZO3Lm7hhSq1WqRjunlMDpR3QT1om/luv+t+OuJUI9qDCj5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB15848.jpnprd01.prod.outlook.com
 (2603:1096:405:2ad::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 23:43:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 23:43:35 +0000
Message-ID: <87h61do7h5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: johannes@sipsolutions.net,
	perex@perex.cz,
	tiwai@suse.com,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	srinivas.kandagatla@linaro.org,
	zhangzekun11@huawei.com,
	krzysztof.kozlowski@linaro.org,
	ckeepax@opensource.cirrus.com,
	drhodes@opensource.cirrus.com,
	alexey.klimov@linaro.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/6] ASoC: renesas: Use helper function for_each_child_of_node_scoped()
In-Reply-To: <20250520091131.4150248-4-aichao@kylinos.cn>
References: <20250520091131.4150248-1-aichao@kylinos.cn>
	<20250520091131.4150248-4-aichao@kylinos.cn>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 May 2025 23:43:34 +0000
X-ClientProxiedBy: TY4P301CA0016.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB15848:EE_
X-MS-Office365-Filtering-Correlation-Id: 687c26d3-bcff-46ff-7ca8-08dd98c14d5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+T7npJ4OnVuIHqC0goBlnJTCGto+uoD2by6LVCe7b0IWZio8zd8utqEsN1Fn?=
 =?us-ascii?Q?OotPcODE5H/sOUd2RsuwAVds+GycRSH2UG8r4clcIRW5yC8VIkPyS5Fqui6q?=
 =?us-ascii?Q?D4RPDqdpaf7AFROArRCz8Ux/uI6jnPJUYirm3ADg3jYyrjivKPX6qYihtyyE?=
 =?us-ascii?Q?KufAJv6Hmb7+RlLZFDK1u620IE99fmyoldZDRs5/DnVNhzhtBhV4B8oaG0lg?=
 =?us-ascii?Q?T1hZ/lO9U786NT+qJ3Hdc9VpFwq2bLdWM7Dw/0Mvx567FcpMe8iuVNeTy0mi?=
 =?us-ascii?Q?S0h83h2Ky+Cidu+H9fwRP6IFj6a1E1hTSu7yibgNvMc7TfWiQrx8MIjNfkGQ?=
 =?us-ascii?Q?5bMhd3yuhIko8qi091uezMh8zqubVgdwWbSIizd4iyevyMd36/62btox/Okw?=
 =?us-ascii?Q?CVI6c6HEPhg3MJar4bC+BeF2fNtj+H3xnQnhG32u3y+4WSmFUbzY48jrBiqv?=
 =?us-ascii?Q?IgVWnW09gq7qTwS5V67DJ/9jzqQ7g4sjVQXmNxaamiHdy4X6AweQ/YnRtoST?=
 =?us-ascii?Q?zKTlmhe2VWjC7rgWa33U/QaKDqdQv4uFZH5WHabCqzzxpM07b6W8M6GBm2pL?=
 =?us-ascii?Q?y4nQoaVlrT64BEWZXIj1kfRycH/VwaXtZlkUkeOWXeathJ829MN1y4g+GqL0?=
 =?us-ascii?Q?wtddqV3A3LYCT83wXCGNhAGiW14LcFMOInnYxyc1AdbxBdAonRyjYR6hPb2W?=
 =?us-ascii?Q?OspsI9W74SFUlmt0gKKrmnL97ORWEuTHNak5dtUHfBFi1oKPAwxvdTD+Wp3p?=
 =?us-ascii?Q?a11eEpEhgX/E32st552NbmUIUhxUwHhhBWzqW0rn1LSnQy/rhvYKcbggOjkv?=
 =?us-ascii?Q?Gsuz17beqvv4ruv+RxdJ1Vllu+YpgI5pXm4Cr5iy1biCTiubVwlWlQoMdoL6?=
 =?us-ascii?Q?IXa3XvZJSUI0Hvxv9/m5acmgtQFFGtGUb+iJcA5vNRn+WLwcwSUO6iJHrRH7?=
 =?us-ascii?Q?J91+uqIwYhRqEtPDjaoLcIL2wd/NugcmQHOIwRExrNlWqFDy0szT12TPPIdz?=
 =?us-ascii?Q?7yax/flfSwEpZvQc1C7a0MH9gBvFKlVdE/H65N3oYGUHx8jtnDE95azwVWHM?=
 =?us-ascii?Q?X5WN41GY+gsH7lQChd32YGaKmUsccrRE0+kaQ03zhiJ+s89MCX+GXOAVWUFq?=
 =?us-ascii?Q?xtRZofMIllWelmv16mH8tSdHax3HsKU1fG0Dy8/ZRuIREyThbkSBpoDyHaRZ?=
 =?us-ascii?Q?900gfJpVRyIsRmm/bcBoqFV5QTJK0hWGD8j4LBmgeyeWbC2MVtpsT75TMOdE?=
 =?us-ascii?Q?vaIA+5OZW5hRK9MiucUwXf/BqdaEux4BfAc8QHzgXD24zbTExbYbfXy+bQDj?=
 =?us-ascii?Q?di3bjSWZG0NCBFfonzScHTf9+FGzLkUHMTKCHuXGKxG5AJ8Y8cuytLtRlLrb?=
 =?us-ascii?Q?PDupc82fO0EBJQ0iGD34IuPjUHJEhxkpBc3za8GzYownFOWRt5puQfO/MHRf?=
 =?us-ascii?Q?cdYbTA954zzi23jWJwGn9g0JkCofI/WblEO7wvESlQ5IaYzPHZuiSg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vJSoiNzNLK2iO4HGJ9CPD/1qSXGu3I9S9l2PbpvZ2p5jE+11zIhk/Gs8VBx9?=
 =?us-ascii?Q?7sXnSlLvU2Z9p/utvJLnzJWdtOi2o3saHPiW77zloA3uT5ODXspny+wK+Q2a?=
 =?us-ascii?Q?oSV2UqdfuMiTOVIkEaORilY4peZ7ztJoJpEdqIo8VImMcOUgZlYpvV7hc5yi?=
 =?us-ascii?Q?bo5qc+54X6D+xFsfpcY5NKWIf90iavg5Ie2eg2Mr+DgU9BDOAWNsNQEV9IBU?=
 =?us-ascii?Q?a93MG8mgiWJFWA9MKpmXpf43ZdAh446v8AmUYxhhDyPc1/AIuNwNNBEzDIJm?=
 =?us-ascii?Q?owGfJxrRVdUNyasdg4VI96LUyt7HiDJjSytDPBXhKzBo3WkkOjtfD59nofFu?=
 =?us-ascii?Q?hjHGTV8l/Qk78TNdZLt6sIneKPCdHKj2N/bVrRxojHcG1nT1qZ63CWrIy2x2?=
 =?us-ascii?Q?3wnFj6slIKplChDOys/02ctXcqofeVNpTXqL1pB+TRR4+YwVqCNJgNEjDK1H?=
 =?us-ascii?Q?4pylqNTm50BI19ZrnISNuauqD6FCfeD4t4bvqRwUiPxcgT9iWSB74B5NPKu2?=
 =?us-ascii?Q?LUNGct6+BUglwQtKkVzLYIpD9EohHmGBHzeVEquWXoBQ7AiruauyNDktS08y?=
 =?us-ascii?Q?W+X9ASIP5tpBlNxCSXR0BrAxokBK+QXDIEpaN+oK2XJx01P/9kEzPS0d13g/?=
 =?us-ascii?Q?/eE3tE0bgeF7xvliiM50iRtiy7wohGWZ403Vr4VYOMdoG5YHYVBMdrTSIvJA?=
 =?us-ascii?Q?BtXy9fZSKe1LXpe5Yan2uNYmWjYAc5YaiGqlL8QCQDwD2Na1ZbfSBXyXpt1g?=
 =?us-ascii?Q?yK5ewbd7S2jywQU4ecoaHtm6Jixuu6CEE1kJ+1eIegq5cBN0eUdb2JBHZRlL?=
 =?us-ascii?Q?bJZ0wOu/EEaQgIzoZEBuJyZz2/f9bR3x12KfHrBVmbhrczKZWafSShqFZmNf?=
 =?us-ascii?Q?qqlbq+TJ6pHOwbyGhQI5083nwWxg52XTPUHT5TTUfUBamlmC1b2Xa80XDcoA?=
 =?us-ascii?Q?PuzeXM9P+f4BAhYR6wrkD8dDsl+4K+H5Kzt5XuZ9T2bZtBdpmYk/xkVKt8v+?=
 =?us-ascii?Q?QF6t4QASiclmmGPstsEdn0xjWu5yCw30J3Wr06pkAfDqzEfog7zdFpc2ZShl?=
 =?us-ascii?Q?mMTomTilVB/bZtM7itmsGpqj+WSkBAe3+2olCmYJNNI+3i4S8PXIzBxUUvVV?=
 =?us-ascii?Q?pr657Te9/F1nJWiw0iVReNHOgAH8iH+n/IMXeSfODLGJ4GM4dhfWjiSMq0gn?=
 =?us-ascii?Q?a+CgwTOns9JXa+Q/RxZjCvqVwGazIXKpMAeQkAf+NG8QK1KDDDa90garL0Jp?=
 =?us-ascii?Q?VZC104bU9PG9Eb5wFKrLuWI4EPXDxri7KLeXOsDIkUdPza21SJCA2UGtbDaT?=
 =?us-ascii?Q?MxVyzj0sJY+h3yTClGQTu6lFaBktviinTR6Gyfn8umkhcdHCwkGRzb3fMRLM?=
 =?us-ascii?Q?/GoUXrcb+dDDrV7IQQ9A1gNsiIzqiSwY6rrbDxVpskVHNEAtjjx+GEXex9/k?=
 =?us-ascii?Q?Vx0Y+pxuDeeVwPxsnCOq2i6z84Bi/z7YRZWYYnx/4qvaksn3CM0fi9CyHUBQ?=
 =?us-ascii?Q?gKsIPVchxeT7CBX18WuCSdYC9/dndFV8AyRm77yiwBVsjr4bQk4CygBW1P3s?=
 =?us-ascii?Q?9xiaWkLm9KxLkspqsW9IAim//NhI3HRFFeSNC7ljwOURv4xTJOihveR3+reQ?=
 =?us-ascii?Q?36SQmwKTbLgdrsPGwQZ/bRY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 687c26d3-bcff-46ff-7ca8-08dd98c14d5d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 23:43:35.2835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jUozo0nshw0DYLot7+ii8LeStpGYjwq2GhCZZMLqhW40HjG910qwmbsZQ/gGg/cxPzUjQQZYMYWhSaJnG8lPhmeD7ME4Qol7VwdhWTwjvaeITCWRj3lUly6u+c0N8BOf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15848
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


Hi Ai

Thank you for the patch

> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically, and
> as such, there is no need to call of_node_put() directly.
> 
> Thus, use this helper to simplify the code.
> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
(snip)
> @@ -1270,16 +1263,15 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
>  
>  	of_node_put(node);
>  
> -	for_each_child_of_node(np, node) {
> -		if (!of_node_name_eq(node, RSND_NODE_DAI))
> +	for_each_child_of_node_scoped(np, ports) {
> +		if (!of_node_name_eq(ports, RSND_NODE_DAI))
>  			continue;
>  
> -		priv->component_dais[i] = of_get_child_count(node);
> +		priv->component_dais[i] = of_get_child_count(ports);
>  		nr += priv->component_dais[i];
>  		i++;
>  		if (i >= RSND_MAX_COMPONENT) {
>  			dev_info(dev, "reach to max component\n");
> -			of_node_put(node);
>  			break;
>  		}
>  	}

Here changes "node" to "ports", but please keep "node".
Here is checking "node" instead of "ports".

Except this

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto

