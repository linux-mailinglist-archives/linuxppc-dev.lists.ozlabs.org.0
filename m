Return-Path: <linuxppc-dev+bounces-10703-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB88B1D0D3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 04:04:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4by9T65Qw0z30VV;
	Thu,  7 Aug 2025 12:04:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754532266;
	cv=pass; b=Bj0AqLcwHCUWIiUZvNlCP2VAzeAXM6qryjt8uYbHDO5x28qDZkpU5r6wJ+1n0RP4uCifpJErqwaPQM00IsFwIPgzNuWYsODkeReIjgBcAAZwtvwbD3GVvLFoLKkspZkVH0vNH698m8jmEhKFhZzJaEso3h6v2RAtKcYuVcWd+cvI4OIRaXC5Kj6CseEwNKlRHcsbr5xSy50Jc3mX173NOBxKzW0uXUnvG5JaMe1F63pjsWUCQ2LsXO8Cheyu4A+ymqxsRvq7tu3PxyAcTpMLCMeZ+IrneVN/fomYwOogh+qCN5h5qbgVqyoIqzcx0T4BkljXX+BNTyLDlcr+OGIOBA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754532266; c=relaxed/relaxed;
	bh=UFwakxopeZBKciidE5WYKJzKgvtwfuvur2NafbOQWxI=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=eP2bVyiTCLHf3oCwvsNPZE6crwSiuUTqysD6K3QcXj0L/1SgWoZZhrVHm+zNenG/eCwJuYCgAScbtU43KtalCL/CsUabtnJK224XtK1pJ36BAMLfpfhC3KigU9qLi1kIVM4SmF4zA0udguoUULjckjqvpafCVUkTOmXrBBBVZTrgpgfafCYVV7nABaUEP2Wj5hYzOls6Ws/YJEtJW1AbrjpSQqKThwfv+eamXzzA2xi7c4MUlfzJZNnf/Y6Z66vOuLLsKM1U2onGbK7MYQR5qJyhQANAvOZKWNAsqvAZ8JQ6nim7aqvhVRUXyckIL9uSKPgEfK12tlFWzYD55xtoGw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=kCNhfHF3; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=kCNhfHF3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4by9T53rTpz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 12:04:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxQQsHRudwnISIAqA/LmDjeZbjFRjA1yWRXMnoXZ4RDkASgNdX7b42P/e7PNya6JLAfopoUf6tmQ3UGTSPu5iknedM6SQBOlcCaXe5WCy3M1j6pdJ62UKuXeSiHIXyZAa6veWwiHEycXDG9qxDF6WavW1YF0vJInj+1GRHth/1HxIFhIj3tiMC+fxgTMXfwVkJV2aDCKyzheqSOJc+OJvpW6uy0Frjx24/HUtu3fVQI6tp9DlIf6PfUgGb+f0UOiPJgstv4Ke/meny925dhn0yRrtJQKZP32t3cNS1+AtLc5lgMmkVWCueJerwM7XMrnmzsyNs9AeYMr9umRBluYig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFwakxopeZBKciidE5WYKJzKgvtwfuvur2NafbOQWxI=;
 b=VRz2bQLttzdja/QhlHOPO0UeHAWgLIzaaVtSPoWf2WxRh86RVqQumajYWmJHLfTF+eS36qIU/cST2oLqHkjfAlVL8SgWh1772pnzxNA5l4MU4TgjoNVguaXVOkq82Yl5TmF0xNrTaeewwYmTJrO77ayVIiEyQMS2uFRee4EVxN/cbtZ45PBu20OT0XViW2rLhjFtHVnmgncRdmh/ehsWvMReZbufgKPa79MQBiE0xOF/DHnGQk35aP9Kgep0yq9MDtiuKZHqwUhT/6NSV3vCriOf21BvllA2BhLPqVlFZWN2vL1eGxOHl5Gtg30uGvhNkpIBg/CWR3Z+aW8VH7iZpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFwakxopeZBKciidE5WYKJzKgvtwfuvur2NafbOQWxI=;
 b=kCNhfHF33fFSJuAdjdSVT8ecJkeC+klbx1TCvHG8NIkG0dJP0DomcGUoZVILarni4VyrSrmcapU/qkjThhSoaMOYXIWNyRNqE38vQL4RHeZ6PipaRHUqnCcl3H01+9HcM7K24ATttPJEgNQvu+QWWCdHgc4PKkIrN2YzfPiLg5Oo6KLk5vsc4Jqi+/MjnfB+MzWFhsenaHBJOxskGcyOEE20Wtxyrxgwqcf4aJZ/cgoV9ovP75A6zfCoYzwxCSxGNTDrflPSCjUZ25jCD1ULKxCt1F0MzRaU3reH4HvlOa9FB2xDA9NHRxiQqOT4kUSO5y4XbaLMMe3M7Wytm2B8jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB9489.eurprd04.prod.outlook.com (2603:10a6:102:2c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 7 Aug
 2025 02:04:01 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 02:04:00 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_sai: replace regmap_write with regmap_update_bits
Date: Thu,  7 Aug 2025 10:03:18 +0800
Message-Id: <20250807020318.2143219-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAXPR04MB9489:EE_
X-MS-Office365-Filtering-Correlation-Id: a78c00f3-9882-4588-d1ce-08ddd556ad12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WQagmX5g8UtnZbvw+NQLzCLpDuKwJZBm8zNqIh4Tpub8P8p8KVNPXfB5XDdi?=
 =?us-ascii?Q?m3gyA1abLUtbpReZRdknbR7PLrzeIA4z233LWfmhpqGTy2bdBI/b58jEl0gA?=
 =?us-ascii?Q?9W3Q2O8Ikyj7pm+C6ndp5NnGDsU5P7knuze6i9fuRJFnMe36BF2zVFO7Z8+l?=
 =?us-ascii?Q?oqyGzcYfZx0E1OdDD4KOnhFxGgZFd91K4Ivb2Uj7P7IJ2AgkB/BusnqLqmM2?=
 =?us-ascii?Q?1Q0eXFum4jhcaZJ/mVKKrK0K5Y1z8GckZaHOyR1t8aly20DdfDxQVyv9/uTg?=
 =?us-ascii?Q?+LXtY6rV+L2Wqc+irXLKYAnAqGE+rgofyWwnOa8dOfZmPAEuUtbAhFJ3HPFk?=
 =?us-ascii?Q?ZbSt3PoWJgjFyXjS+QptEAxizxw9EsNmhZXfS7lG2dWYlHnfAifn/Iy/N3Pr?=
 =?us-ascii?Q?YYaJSp9AuRLdBE5huqu/CVOsfxKR03PU7ZfpUpEn/RNUA0s1HoO9FySPvunx?=
 =?us-ascii?Q?cOoeNENFK9U7KZ9dOiqibdk97IPvGTDU0cwoaZkMAdBmnDx87zZNTJh2gue8?=
 =?us-ascii?Q?4W276bpajJtbP9SoAsUF/mIdI2pyalOMcd+lJJw0AWX41PCVKnZi0O5q/aFF?=
 =?us-ascii?Q?ien9JhIlPH67iCbujjgtg3mPTwzq6MZmZgzXhQNnlKxTMTQihWAr3zfK17ko?=
 =?us-ascii?Q?DKtK7Tr9aVNxml7MV3ug3v0GaNMYoOFc3KGg1m1gTQb5iMqwso7S++qWznUd?=
 =?us-ascii?Q?Qa2iQpSaJIGWOqlqb3+PpeVLAhJUxWHHIdsgScmNhnAgT71/og3MEqw1lYNV?=
 =?us-ascii?Q?jf+24uSr6h8uL242nbGSdphsqlF2qkmx1VKguh12riOew09XXlfNNSlu+QJi?=
 =?us-ascii?Q?NNhk+7mEs6egXeOQGpDB/XgE+omEkRkSCNb2WJ4tN8MLY5FkypnWxjhwULSF?=
 =?us-ascii?Q?QlLiaUb5WukPHcNGVsC0GFkMOVGVSgoiQcu+lDvTfjB4387cid9FV9h7ZM9X?=
 =?us-ascii?Q?+eJZS9uiA9DOlG+ZR/2LEUjeytQ1lggc3P9xi/TMverw348ks63xJGsr6+aB?=
 =?us-ascii?Q?dj44/ikOWjv+JMcUAMoY5nLj6CwQd937SI3xbeT25s/xdA7kJeDoytpZRFsH?=
 =?us-ascii?Q?hxyoD8cZ8eSHdGiT8M4cVrh7hEyzipcgy5e2Xj68pw0Bse9eoU6GcS44d9+6?=
 =?us-ascii?Q?OgZ7j2BQdktY34aklcDUI0IUeceNX7lP2BVLggi5a1JzTdTyoOhfGvg8A/L7?=
 =?us-ascii?Q?1P8Wa9vlj9s1aptnCTVy0XPfn1c2c1fNMEEiZjnmJyMMh7TOQ1xD2q9Q2SRo?=
 =?us-ascii?Q?5LonVMjXH8B8VzmRZCp0IVtoI0GuwFhQqO7LPaXr1wu+jR4xGw1g6ynqcgJh?=
 =?us-ascii?Q?YEi9bydALP6KGSFOEf29O+5V/JuQBqeXmZTELMjK2FK7cnIO8M72FYs6QHOq?=
 =?us-ascii?Q?+Vd2x9OtqS7oRiGqilCX7KVmgmNhb7NYnVp+Z+a2jKJ4g0ys60CelQx1soKg?=
 =?us-ascii?Q?Pp9SSGUtG6N8rNn5yQmmtes8u6hiheIU0f4DNtjgAaMQBHIh+YOQxnzOOJhN?=
 =?us-ascii?Q?kyI7LATF/04CBSw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ujhJdVJSOH0OJvCr+lkeM/WRMlEqaq1BaAHjBmzk0NWHNojG4n5BuA6Pmwys?=
 =?us-ascii?Q?M1ZiDSIQuhTEqTMUvu+xAHDqIKHbWT41D89r96aMG/BRsghGd63yY01cp/dL?=
 =?us-ascii?Q?AbJxoiYyrh3IojhQXAT0YDhdTvN31P4qmM8RftGZ2kQLBWaZ2aGukCZkGCey?=
 =?us-ascii?Q?WSWxkV+FTS9U2OBCGlJc0c3MfFQ7lMln1kvJBmUFa5ZsuuXECoiNA0lPZX10?=
 =?us-ascii?Q?6/u5d46l4eKXrtwnC/MAskVUe3PCjoOfj2tZBI5Q9c20XpZDwD1+Ei2jpPVm?=
 =?us-ascii?Q?SEKG96fqi8gylt3/wt6Wr0jgRFEewcw2n4ym3A/7avq95wMNHe7KFgagOgpu?=
 =?us-ascii?Q?FjDd+qx2CKYHKJlLb1BRUz8GGdEsNEkB5JE6T7+WACp1X4KnPWEc2SBMvXAj?=
 =?us-ascii?Q?Wn+LdfXrqJVvRlpszOKJe61hCOfBl6AZDpqDty3Zg/aTXoChgUBUarQiAX1x?=
 =?us-ascii?Q?mjuXk/OKZq2JbQm8ab4d0Wx8I554TqP+Wb0r/4goEzNxzwu7z3P33mYayFT/?=
 =?us-ascii?Q?CPXMEm8qz6EOkEo0LnayU7tbIF+u+YlSJBuwaEXgbPKlubJ8uZca4x55CBFJ?=
 =?us-ascii?Q?p/XuMeQawRIOvXPW0PuSY+W7rrT6eRf/IxVhqS1DIgPV7eMBnWyG5Pp8MN2U?=
 =?us-ascii?Q?kJddAoWw/UEX++9eDoWhmDZ9BSm7ViofQPh91re4+eciWd/pwviOyMeGKE5X?=
 =?us-ascii?Q?wZryjrfe3uUpvFwzBJQfhhjnHUpoEYNoFxf1eAnRwWdfp9OvGnANVAuuY5nc?=
 =?us-ascii?Q?lhXaCh0kP1UAG6PJcapvRwuuGCgqfnf/X00qUt7tZU1M/l/SvUsFF/Z5nX14?=
 =?us-ascii?Q?TIVCFeK5g3OCw+YxWS/3Xc6C/YqhwbFSXg+Hv0a4ZHzyx6F+WXRDJ13BgV/P?=
 =?us-ascii?Q?xnVFUBzQNKsKohDP7qgwSNBbHBfBzuU0YhXEtoutWWpDz1DWZtz1nzR2pxVh?=
 =?us-ascii?Q?bc0AnrFotPMfKJee6eSapR3Zb5tG5L5kqeDph4XncLkn78sbCjDVLbvdRGao?=
 =?us-ascii?Q?sKXsfIqb0/04G9yzbjiZFYJSFuzdunua/2N2pqv76r+gi7vyrwDb6G3kdXYG?=
 =?us-ascii?Q?SgF1kB9PgcBq6jVOPVl0Y28ibPsmO7pgfeGvIy7KTlMQiDxvjFq+61wXNhkM?=
 =?us-ascii?Q?y2snbFbVmBfJjpPDKn5/TYJBK7D9HT0MMzaGu3wTa6TfSUvxsmtI1CE+4EhR?=
 =?us-ascii?Q?zgs8SFPWAL6wfWOyz98OE3MOnrzr9YSTxZSWYLaWb7xnGVVgDDbhrYjgjjzz?=
 =?us-ascii?Q?IfQcsS42MAFcZ1ZxBM36Jq85dNMfNCuAuSXwcqPeh5HKgRy4WNyMuebQHMvc?=
 =?us-ascii?Q?doCFZ2zU0M8ouj6PaorbhyY8FbFW603371VOrTPraQG/SSaVrOdx7bidr5oY?=
 =?us-ascii?Q?++9UKzCsKm276w++wx0RboYSvuYeFfei6ctRxyyWSlI3lESjgU7O+wSW85aq?=
 =?us-ascii?Q?7o4r1xxG53x0JhPmTTi9TPiHvEYsQGIq6rfpVDDk57gnGQcmjAVbfE2gJmPN?=
 =?us-ascii?Q?vJPywgb1DLTI8+colwUmB0mzEhtxKXiyv1FT+AVvxSq81AiSlWxVomm71o2k?=
 =?us-ascii?Q?ZlAZCxBR9+du+6kSHiOL7Kvqo78htwag5N3+a/uv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a78c00f3-9882-4588-d1ce-08ddd556ad12
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 02:04:00.7945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wSVpzry5jo/rNOKKEQOdtMIodmZIbzJDMUsyPANpFPmADDRiKqVv2TT3O/0fCmUMFG9TGr4iNngS54WzM8HqVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9489
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use the regmap_write() for software reset in fsl_sai_config_disable would
cause the FSL_SAI_CSR_BCE bit to be cleared. Refer to
commit 197c53c8ecb34 ("ASoC: fsl_sai: Don't disable bitclock for i.MX8MP")
FSL_SAI_CSR_BCE should not be cleared. So need to use regmap_update_bits()
instead of regmap_write() for these bit operations.

Fixes: dc78f7e59169d ("ASoC: fsl_sai: Force a software reset when starting in consumer mode")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index c313b654236c..d0367b21f775 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -809,9 +809,9 @@ static void fsl_sai_config_disable(struct fsl_sai *sai, int dir)
 	 * are running concurrently.
 	 */
 	/* Software Reset */
-	regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_SR);
+	regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_SR, FSL_SAI_CSR_SR);
 	/* Clear SR bit to finish the reset */
-	regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
+	regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_SR, 0);
 }
 
 static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
@@ -930,11 +930,11 @@ static int fsl_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 	unsigned int ofs = sai->soc_data->reg_offset;
 
 	/* Software Reset for both Tx and Rx */
-	regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), FSL_SAI_CSR_SR);
-	regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), FSL_SAI_CSR_SR);
+	regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs), FSL_SAI_CSR_SR, FSL_SAI_CSR_SR);
+	regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs), FSL_SAI_CSR_SR, FSL_SAI_CSR_SR);
 	/* Clear SR bit to finish the reset */
-	regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), 0);
-	regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), 0);
+	regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs), FSL_SAI_CSR_SR, 0);
+	regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs), FSL_SAI_CSR_SR, 0);
 
 	regmap_update_bits(sai->regmap, FSL_SAI_TCR1(ofs),
 			   FSL_SAI_CR1_RFW_MASK(sai->soc_data->fifo_depth),
@@ -1824,11 +1824,11 @@ static int fsl_sai_runtime_resume(struct device *dev)
 
 	regcache_cache_only(sai->regmap, false);
 	regcache_mark_dirty(sai->regmap);
-	regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), FSL_SAI_CSR_SR);
-	regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), FSL_SAI_CSR_SR);
+	regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs), FSL_SAI_CSR_SR, FSL_SAI_CSR_SR);
+	regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs), FSL_SAI_CSR_SR, FSL_SAI_CSR_SR);
 	usleep_range(1000, 2000);
-	regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), 0);
-	regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), 0);
+	regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs), FSL_SAI_CSR_SR, 0);
+	regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs), FSL_SAI_CSR_SR, 0);
 
 	ret = regcache_sync(sai->regmap);
 	if (ret)
-- 
2.34.1


