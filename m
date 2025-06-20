Return-Path: <linuxppc-dev+bounces-9575-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 047FAAE1376
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jun 2025 07:56:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNmtd2pmpz30QJ;
	Fri, 20 Jun 2025 15:56:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750398969;
	cv=pass; b=kJah7UxzfiPPLnAh4kmo1BKaxkLXNzru9Qoo+VyVlsun9OrCRLuyuNNvnDSWmlcD74/BBNvwGwuLkGO7kqOlwro2OV1ImB7XeQ4cY7gp1CxbKNb7ph71+gmVAxdTU4unZwme5/EOMA4qi0hefDvROyqJdInYngLjPKjt7NKOoafjxJgDWaudL0+Hv+jLAQw011TNOIW93mpMTU8dYrFP5WPF6y2jl1+tEUseeuBLncSp9DbY6+oluZxDu/1iWdRs6uxM3M7HQtvTuz67ooHodF6y3if5+bjoHaoCOCNSC25sCTEQ0twgrrDVzS7eIHArdGZuY3LI+prfSVN51xSfiA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750398969; c=relaxed/relaxed;
	bh=m8AqtZGtx+RhX7K5RfQwUDmcAqmNnQBp/Jhul3p627k=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IPIW5GM1A6/zieISBCS3RLxgh8Q/choXXuSzX7cS161TL+IfexCSJTRQSfwimCq42gS326u454WQEG1ThAaRatJt8U9MRqUrTPzuHshRcWjD2Xz93Wtt84jsK/GKN6EOhsCkpIW+WSh9mCyypfhAhc7IDtevo1KhnwD6W4NkVkQQazY8ArIyGfDIUyGLWVkd+1YHaoGcE2a13fJNRUeKpOC7XmlnUb9f1YiePABtLq7zfDQXmzvwWbs6RG6zBqCOG36kCdur/k8lstLKyMEqyx9hMJ2XsmcSWoXUfgFSKElVexuD/m0HjbnNywPiU5edKpBf2hlnKEgN0ZYz836GrA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=aFUyS1io; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=aFUyS1io;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNmtc3Kybz30RK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 15:56:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UnQibsspawN8CXIVDaMWnxehCI7D+fvDjy2AtQoR80W8jMs5WcO9RTk6pb84zzEwWVtyUiWGbBOGMfdY5EO0n+EWrUu5cF6EOx/8UyUhY50/PI6HUcMQEIxHLkD5WY4D1o2VjpNF/3oO18CALPkGthSTNZwJRX16bmyMt+j3MoE+5epUudAQJEnYwf1hBpuLNBnj7nU5xuSdz96Wdz7MyX5VnydZ1T3NamUhe4/1Qeuoh+ceSJ4cqTpCa6NGVoCZXa6rsqPreXmGZK6Iq8wqAtzXvOocnV6RQ/sdDmDsmXaUQVhAXgeV7n42rgqcR4gNDkPQTTbOTAIghBOrlfrdMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8AqtZGtx+RhX7K5RfQwUDmcAqmNnQBp/Jhul3p627k=;
 b=qnAchXRuCiVEaUQOdHi9pcYl0u9sqE1V+KSUArySpunwsIqN2bF0VTSedNyaFbDS5zdBRw3YrxI+yox1Y7IP8+T8wqno9z5nVpHdN0CfP3r6ecti+uRt4CLDgF328gCKZD7xC5dxWSM1HiThVXw2IrNlo7zc9D8QKS8G6yttGfFuVHXVaTnmsLtKJ0GrtIq5XbMKOkHDjfnIlCjx/YcJJ/3smefJsXh/L9xT2qOLstkLPcm3dibm1H5rFIDz8aZ3DJWHPMHtBqkFlb9GLuk3kHctoT/QU9F8Rom7bezJghcE/o1dN8duSqaQ6mOJWeLAgGpxBVVWaHX1+xWLrNAwQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8AqtZGtx+RhX7K5RfQwUDmcAqmNnQBp/Jhul3p627k=;
 b=aFUyS1io+hj+f4Trc3DS2YyqikfI2tL45n7Dy8XpnDl1Tc568SnojCYrqfQT/1yYvcwe1mYPfPxDh4+UPcrnE/K961YCeqOU53/LTQvEKU7V+6Gw++wU1w5fjhPkdw2BN3kXxo8Rn/ZhfnvopRUgJKkMczODICu6AclWc7NxBSpY1mFQiKh2sHcItHgEMNGzGzZWzv/C+lCrKhPqqjVEezNose2pYAgRvEtL+2r6i0ZOaLHf3FdICZqHFHNSd/gxvuO//ENOp8FsVHC9tEI/tDHlWLc6FxrJDoqvXzHXWvFRpqVhdAPCuJtHbU38EslGvtm+yUBNKwRRaPFgfVtj9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB9PR04MB9962.eurprd04.prod.outlook.com (2603:10a6:10:4c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 05:56:00 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 05:56:00 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	cristian.marussi@arm.com,
	peng.fan@nxp.com,
	sudeep.holla@arm.com,
	arnd@arndb.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] ASoC: fsl_mqs: rename system manager indices for i.MX95
Date: Fri, 20 Jun 2025 13:52:29 +0800
Message-Id: <20250620055229.965942-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250620055229.965942-1-shengjiu.wang@nxp.com>
References: <20250620055229.965942-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB9PR04MB9962:EE_
X-MS-Office365-Filtering-Correlation-Id: 58a4e09f-e802-4224-82a2-08ddafbf21d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mQhuAyHH3mKXlKUsDhnaOvP486XVzPKXNIyB7M8RsEkgFqvrknvsaw5OoX/a?=
 =?us-ascii?Q?zgaPpSHaQKPu7P30PHB0fQfgBmWsAIzqXvMrIspDFaadXWTPLChCPmwlBnPj?=
 =?us-ascii?Q?TvnsxRheg6X3DTuC0SqI54ERzFZRUIXo0C5Yazf/oKLrX0ZPjqO6nFAoXUza?=
 =?us-ascii?Q?YAnkGQwBOqtQzzb0Jm9dANE+aA6XFKCUNGdoOtQoLHxYQRMfKG0qHPBGs8jf?=
 =?us-ascii?Q?/a7+UWyvTg4W3rCrzeogZRfa/WF9L1a9T7uZUCv7edqeLM3C9dfGQhdnWZlG?=
 =?us-ascii?Q?FgzFWd39M0eWTEN4a1GepA2Zm8XI8r058uJRMq6szNbYaNx1z4ea2SK/FWnC?=
 =?us-ascii?Q?IqdTRylc9sbGfS4zTeVzNbIi/MsOnFypgXPl2cgJcwL/H76B5eKSBbE8wNN5?=
 =?us-ascii?Q?B3OHBMEooJpT49dmcMeby4tx9Ii5jBQ06CrIzjxiz0UqLn7jDiNC8rB8dV8J?=
 =?us-ascii?Q?X4SaikKFT2zxdYirDVLy5hvGHPQ2GCEyP8utKIbVzDXVU89HDImL62FO1Qu1?=
 =?us-ascii?Q?Y34iYOeho06EhZmXwPYWz71yqthiBUpO4spqAEJWQFQpQhHN4D2CX5nv295Y?=
 =?us-ascii?Q?Jsqdg297UFcZHl/IL+gjT5n1Jf12/lrDYKnyFoMx4zMH13nT3uIQx0VBPzoD?=
 =?us-ascii?Q?7vV1qmK/BGLRdICLcANLfBwH1JdztSuGpcx0HsFpFT2Ym8tZAzvVEvDgVWty?=
 =?us-ascii?Q?ese+fOvoaXpVj5YLQH0Nrj8NuNOApHRAEvm+6km05dc4voqlcE7kaaje2OOA?=
 =?us-ascii?Q?8+68gn6gpUZyRUO3Ly06I7hunoe3VJcPf7Ofu/zJmOL0IcK2655sbad4ITYt?=
 =?us-ascii?Q?i9WwH9+PmXPOyOTsfp/yMRgbxiCn9LIMolvPzgb416fjn1w7fANtxmy5cZGp?=
 =?us-ascii?Q?SgX1fUSQojOsd2t6uBhA652J7rmGEO1qwq8EV7YqjNRzYWTrQoawOKNUJKm5?=
 =?us-ascii?Q?AaGFrAXWBVDpmzVWSVOj9WkqrduYZNJ6a6HLvzfvCX6QfWR8NRSBZl0G9WnB?=
 =?us-ascii?Q?AK587Jq2K9OHf2RHndqPfZgG5gzQfze9UFao74kTIxm35mBOFURjq3uqfx/n?=
 =?us-ascii?Q?xcEsh1RwsgV9LEKPBGQfyFvajZbg8+uNX30GmN2um4jNJ3kiSbvMZAhnSY7U?=
 =?us-ascii?Q?UYpEX2CPVjHUBkgB1oFfNDQXRZSXQd1y3lUIPOyxRqI0R9jAS9PLXSBPJPst?=
 =?us-ascii?Q?4PzGNbIsU+lRNxj4th5WCHkAt0UbPwiEo6DeZp0kHvYsPpCpwBBjml7KNe3Z?=
 =?us-ascii?Q?pbHy3vm5U0zR6wZjowb1yRNqKkMsHRYqTAj4SJSdsZGf3i5IhaY2FfkJZ3Qb?=
 =?us-ascii?Q?s3QGPgxJeICIiqFOcKuoIkXdagO0bXllEw20qU4/KxqfoJ5q3ovs5rDF0mb9?=
 =?us-ascii?Q?kHZCw4yS5mFlrdarCcCVKGyZJgLBYoPETalUdanIvUiaCxEgYP07dR+1mU1s?=
 =?us-ascii?Q?Bc9LY7QOr/e9tIBVFJrWFhlbhHtdsAvRoEVS8Luqq14brOfm28zgJJ5+9s9I?=
 =?us-ascii?Q?SA3fA9dL9A31PJI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HCBJh7RdnkU2ZlA+K1RS2H7YtJSpPzAw/fWz5E6760ra9dibhnam+G1qJNj1?=
 =?us-ascii?Q?CyHVa4b+JQEPm+0NSGOvgjhkKwIJWLcl29B3exvjarPtXpPThR7bwO8h2TJE?=
 =?us-ascii?Q?LYxT+AfT5lSFc2i0IjfyyMIIWqv7K+OZ+5ArbFoFzwCd4zCksofILmWf0EG8?=
 =?us-ascii?Q?5QuB75tXuvfi+gTcbW6ytDLbXlqqIgtRV8+P8ygp0FIjntnzetJ93L/IF1YO?=
 =?us-ascii?Q?KpXStyGIAMBje1UGySVgDCWugLnxSd/OwDSviXaygB6loR26bhXPGXDgcKza?=
 =?us-ascii?Q?4eI74sl0sYJ/ljb7gN1uTxTWIsb2FwgPnlj/ZPsm9Z4wyZCxtyNlvVwRSkRo?=
 =?us-ascii?Q?3eSM+C9NAXDzHAG1YF2qRalLmSngTURnM0TiEC7fDx9e0SoNc+qNjO2cRXaX?=
 =?us-ascii?Q?ckfgRP/TvunRHt92QL8JUjsXbywUoqBCVVllwSeKfZj4yAmFtmoHl4Qkc/rN?=
 =?us-ascii?Q?SR1sARw9T5MKI6nFnHZ96i1BlsdKWPYspuUgVwvAbc/N5+0muK8iFGRSX94Q?=
 =?us-ascii?Q?YzsR5T2SbHBz6wEk/OeFk1101sFak/a/O3N03Ia7/qaNR177doxJCsKad06K?=
 =?us-ascii?Q?ZjVeTRMNLuIBD/vMowQnf6qUHL10NuI34rjf2FjAY9dCCagPW21pSUPLPh7+?=
 =?us-ascii?Q?6LLu3khjJG5lkZ01dmPxBdXm0DixtuheVtYzpfN/3wya8VtDEZqfV52MCBGU?=
 =?us-ascii?Q?jZLxpwZZ125P5Cqc8d4V75R7x8cgxm1tMs7dKbHFusn9xBtDTckEq1j8/MQX?=
 =?us-ascii?Q?zioJJpEOrlvZg2EuRRBY/guR2jucTBfdXksjFN6bgM2Sg8ykI3R8+x/VNabd?=
 =?us-ascii?Q?dD9wQBoQ4KJG+9HK15RiUkDyCCGHWPwRyxnyVkpTVOhMqZox3YEfct1e5NHd?=
 =?us-ascii?Q?Qq9rLN+FmfMaADUuQ2YSoSTYWn1vfjrbOv4Rih6Tuu/mMP5R3tveS/79t8TC?=
 =?us-ascii?Q?m0nGXrPePtoI9vNerj7k19rIxDLWr+E9vBwZ8BDFvAXcqM4sK1gtc8VlLTgV?=
 =?us-ascii?Q?xgtv8jnW9e3ph2N8uN0gu6Vn3D9TrslGxUjPS0mOgrfGtMxu2eLzVnNGHqA7?=
 =?us-ascii?Q?WpKr5Mv5qVMzETC1GIZiBE04OgqsbC5CMOIrE0Fi9sjDThvhq3MOfV2NOd4Y?=
 =?us-ascii?Q?GbTeKghzZSYXYVcYaecrAfhQBsjD3gbZaydFvXlUyW3HYyuAzjf80iO4dwml?=
 =?us-ascii?Q?oVOxXcjHAmqX+3Un+GYmet7k/99GjeC2YR0gWlbKZS833um13cIePjU/NH5g?=
 =?us-ascii?Q?t+3H3Aex9GRWiV741koFXn7ZrEaSx57v6dTLtCgFknq07cHRmf/p3ez4Ok5g?=
 =?us-ascii?Q?2eYlnSElODZ4HemZbVD4Prgc8fheIDP2Lp7Evxqt7/0KWyJB0LR5rScd3FVA?=
 =?us-ascii?Q?SGW/7sDn7gvuOnNFMa1nM06zz83M3It26Da3gl5sQ1ikgp+cg1ZfPO3h8k3o?=
 =?us-ascii?Q?ve8EIxvu1OmZKIstHOqvW9WgM3wDFUYroDVO47jma6vUfkyg1yLzCrBvwYuT?=
 =?us-ascii?Q?Gl7p+otXYRUyw6UryuiYvlGtETrX/Jm/Z+k8xHvJYjiy2vJMKwjRTK8am7u7?=
 =?us-ascii?Q?XZLzMGmXWSvfDhGb2HZNSpNuK5MuSiG2rNwn6d2R?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a4e09f-e802-4224-82a2-08ddafbf21d0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 05:56:00.0830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRBky66lIoogVFYECchHER1MrJfCu7itXWMuWzhE7+3YxHeMVHMGpVFPKX6afZYMcwgJutqXfv+wMjXj52Zxpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9962
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The system manager indices names are different for each platform, rename
the indices for i.MX95 to differentiate with other platform.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 include/linux/firmware/imx/sm.h | 12 ++++++------
 sound/soc/fsl/fsl_mqs.c         |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/firmware/imx/sm.h b/include/linux/firmware/imx/sm.h
index a6220c500f7c..d4212bc42b2c 100644
--- a/include/linux/firmware/imx/sm.h
+++ b/include/linux/firmware/imx/sm.h
@@ -11,12 +11,12 @@
 #include <linux/scmi_imx_protocol.h>
 #include <linux/types.h>
 
-#define SCMI_IMX_CTRL_PDM_CLK_SEL	0	/* AON PDM clock sel */
-#define SCMI_IMX_CTRL_MQS1_SETTINGS	1	/* AON MQS settings */
-#define SCMI_IMX_CTRL_SAI1_MCLK		2	/* AON SAI1 MCLK */
-#define SCMI_IMX_CTRL_SAI3_MCLK		3	/* WAKE SAI3 MCLK */
-#define SCMI_IMX_CTRL_SAI4_MCLK		4	/* WAKE SAI4 MCLK */
-#define SCMI_IMX_CTRL_SAI5_MCLK		5	/* WAKE SAI5 MCLK */
+#define SCMI_IMX95_CTRL_PDM_CLK_SEL	0	/* AON PDM clock sel */
+#define SCMI_IMX95_CTRL_MQS1_SETTINGS	1	/* AON MQS settings */
+#define SCMI_IMX95_CTRL_SAI1_MCLK	2	/* AON SAI1 MCLK */
+#define SCMI_IMX95_CTRL_SAI3_MCLK	3	/* WAKE SAI3 MCLK */
+#define SCMI_IMX95_CTRL_SAI4_MCLK	4	/* WAKE SAI4 MCLK */
+#define SCMI_IMX95_CTRL_SAI5_MCLK	5	/* WAKE SAI5 MCLK */
 
 #define SCMI_IMX94_CTRL_PDM_CLK_SEL	0U	/*!< AON PDM clock sel */
 #define SCMI_IMX94_CTRL_MQS1_SETTINGS	1U	/*!< AON MQS settings */
diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 11f2f3792dce..901f840df904 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -388,7 +388,7 @@ static const struct fsl_mqs_soc_data fsl_mqs_imx93_data = {
 
 static const struct fsl_mqs_soc_data fsl_mqs_imx95_aon_data = {
 	.type = TYPE_REG_SM,
-	.sm_index = SCMI_IMX_CTRL_MQS1_SETTINGS,
+	.sm_index = SCMI_IMX95_CTRL_MQS1_SETTINGS,
 	.ctrl_off = 0x88,
 	.en_mask  = BIT(1),
 	.en_shift = 1,
-- 
2.34.1


