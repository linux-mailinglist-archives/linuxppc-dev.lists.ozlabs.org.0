Return-Path: <linuxppc-dev+bounces-4600-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B70A00432
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 07:23:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPYRp01KWz2yDx;
	Fri,  3 Jan 2025 17:23:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::611" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735885413;
	cv=pass; b=MLPtx+K2t/FukOwGYENwr3dcgmaORIhRAEidJwx5/iHgu6UXYst2Rbdy/AmGy3/L+juNpWFjCWhjr8P1/OXRVMjV5vveajU5uyqUJTKJTTCtMhnr0FfNCOcNTe/+iAlVwXwlJ8wGgm7VxtwyFVvLpEy53iOPCIn7tKzkXcmbglY+7PRmu/v0/Aa2aZJI8adfAdeH0Iiugt1rlhzaKFGoMJ5gIHFt/AtgZDlvdTKU+HSUh38F6XoXEgN92tzR92m6rjoF2WikoOddcDpJa1KNhztOBMHxY/6aikgbafVaeWNKjfx2cc2d/H/ZMDbv1YqHtPMnVDMQhaNeTJegHlGv7g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735885413; c=relaxed/relaxed;
	bh=9bCQNiwK7K1F2JDZJALRi13v1jEviPQA8zZUG2DI5Qo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aJMAVLevUqTSahXAACOwAUVwOpNgg5TBuA6kOOvM0u6vxk8Ap7542fRGuNsLwCvRNAQtbgXY3OgW/7RIlhmpjCj8lCr9A8GrkBxt7wNrKMm9q8xRdvaxF9uY4MngLFQCsJh9pUgsUe9IyWIwoUjRgXPomWzHpVXKBzFPsHSrTJqVuNObkf1cYyzo2MDI7ueurAKpNZH7Wvyq1BUMdthrS4i2Fz41ZOm89WYUi5WiO02EMQaK1I0t6RdkzLBgEaPs+PaNsAYrXsz4qohq1AhRoUsVUJJJN7LvGhCT+NdIIp/KIXNzFnzLHxc8ygDuvHIUmOZXXN9dxA92AuR/+NguHg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=JwyziDuR; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260e::611; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=JwyziDuR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::611; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20611.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::611])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPYRm0W2dz305m
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 17:23:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWvcp309hUKMWBcSs29B0QXBZyKE1jKbv5J2aHOCTMvojMASbu16efGaTcwxbYIFY7EiKHOdTklX7EDebQXA1+sQyFB670rEsEb5+Au1glvviaoynJwcWpcOYpTEBMs7fPlbD/Uk0WFogjcAfqlsOEfoLi0w2Kcf/l15q4Z/tW8x8/5Vde/oPkmi7/jYLvisiKRgDNr0mn2FY1A/32fA0dDr+2oziSBjgbGAT9+B8bHWkA6vxRQAyv0ErMBaoa7PnPjBMpysTqubb5R8Ufjm6KBcs/gKwbEpW70H5TmrZ/zGbHF0uMp4MvV8nFI9M134tHe8Djj3Frmldf2B4duJyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bCQNiwK7K1F2JDZJALRi13v1jEviPQA8zZUG2DI5Qo=;
 b=Keh8zDpL2sHPitG1O6JBAuz53zlrAyW1d7iVR2ppXKsjQlAeOAsjyrNEzRO8YtCSGHeeEwLj0Y09TYgMIoADYXxksp8wkBkKOlS6MCizCboqLo4+XvglXS584t0G2tjPTWAJomFvUlOdVpmw0G86XnlBF9Dz7A2OYPVOfuChzvJKO7XeTzg4JBy32v7SeF2gOTMhSKSRo7++OLhkq04OFGRBDhtG4rVWTFV/rLPRMgkh6F41n8CN0punYnOsjzQtUT8Pdfbd0Nl/18GHr3YtQBmLAhZPbmM9JwIsOZI0l6IInx5pUkQBIFkEI/Tw1mtK/spVdb9YQudeqbBIPlPFMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bCQNiwK7K1F2JDZJALRi13v1jEviPQA8zZUG2DI5Qo=;
 b=JwyziDuRgiiVt6wwqsPY4c2EjeHY7LBjMdz92Lq0oDPMutrUAoWn7HtnqLhkRv4BFxBkPr/VSjzQe+4QcOYy/Q1rym/PY40I2442+e8jAZItZiSjn5N6j97FclerFWbohPhh5XY95QTH1RjDIq4AXTKW8qDCTSExEw5xww+N+YTTChNV1VpIqGyaBsBbjUn26XCI1nh1/b7Kfp52DoOsvKuhH+03TBGIVOlUw/GN3Ttk+JzZMfLkDgygnfDeuEACWBXNG/PmLvr56EDhS+A6E7f7dKAY406q3JJc+TaDPdasggaKHPLhLr+oPqnq8RjmQG4Oo/wkkxWHGzZKGdmrMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DB9PR04MB9331.eurprd04.prod.outlook.com (2603:10a6:10:36d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 06:23:06 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 06:23:06 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	christophe.leroy@csgroup.eu
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH net-next 02/13] net: enetc: add command BD ring support for i.MX95 ENETC
Date: Fri,  3 Jan 2025 14:05:58 +0800
Message-Id: <20250103060610.2233908-3-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103060610.2233908-1-wei.fang@nxp.com>
References: <20250103060610.2233908-1-wei.fang@nxp.com>
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0127.apcprd03.prod.outlook.com
 (2603:1096:4:91::31) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|DB9PR04MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ad913ab-763f-4d55-5ef7-08dd2bbf1610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RVm/TgfHbz+ZLzrmUyP0hH9QIjtiBQYDH6zsWAnvaQZbUT16nzgqGsWBiWI2?=
 =?us-ascii?Q?mYFCJBGSFCnm61Bnty5ZLDZzUE3hjDd8IUGYLghWIQNMPsqmWGL8OnA71Mpd?=
 =?us-ascii?Q?SyMBzHbIF09S2x5+b141yOu2U99p7DAD4Noje+hLtZAcqY+09tI5NjBS4iGC?=
 =?us-ascii?Q?lOoFiMD/ulsl4Q6U4nWY/lvYKIEK0HDDrIPhzuvCWoI9ZUcIBX2xkLZRQU/r?=
 =?us-ascii?Q?hgBho5Q7uolk1nqifooOpd6/f4OL1iYSBpSWMtl6jDLV2IZQpqDFgoriunyO?=
 =?us-ascii?Q?c5blJTLPEnfM3Pq8l2G2EgMRqLKvxlhz/yBY8iYm51GimcyZIA5PBrtcyM46?=
 =?us-ascii?Q?Tl0hVcDqsGkK9XMhPlEIbClD3F9Z110ajDKMAtM70B+NZdptfZ41wX/yKLR4?=
 =?us-ascii?Q?/a+irzFAeYQtSdqEkgXyDI2B5+1bGzoNKnKgmi5XDY+fQtXraJr9HulmXPN7?=
 =?us-ascii?Q?3g/7b+ygxrplf3Q61jKvJ7xXxeqeA6wpFqgT826YVC6FW91ouDS12kqXOzY2?=
 =?us-ascii?Q?tD97Ac9AYswmsTT1Ps1h2TFCYPN+PXJOznRXNHbU5TMNRMWyuCuYa3S4rF30?=
 =?us-ascii?Q?PV1IhnWDj8ToTfgwNWIUY1blHb5Mj9YDkaZTskqI6X1TPQNDT69NQ5pWHRj3?=
 =?us-ascii?Q?Qh7GLEG1ZoRsI+J4f/gPDc9pDTexnVLJlLClN6pY/BGLkxVjaYZ7/kaOh0Bo?=
 =?us-ascii?Q?/ClIdjCxOQbFfQDYl1XLk+5fLATUzmdbwI3oqdmCL+safoQl/SlprYdj+S5y?=
 =?us-ascii?Q?rh2uEY1g3TzB/gWNkTRwWIDPlC39lhEYWnVwGDJ1n0UI5kbW6dc6KRNNIDYj?=
 =?us-ascii?Q?vPtvz4iwoI8Xar/qjgieRIkyfhvmPwp2Qp31v+g/YGs0DAimeagIv37+ecN2?=
 =?us-ascii?Q?7BBitEITPUNBdWs8+Uan4HZkqunKBP3I7ZuwecQ6/wkfHQ+4HXUgt0Q5AaOk?=
 =?us-ascii?Q?2QJGlvi7v7XR0z9WoBNv3Cx+z2VXNmCe0njpvaTqc4FzyxOvCCGMQK3I+bTq?=
 =?us-ascii?Q?rMhNcG5Q1oTxcEQ7gfTJSwVKcjegQz6mu1+LcYwTVRemIMh1iNCk5Wu0OtSJ?=
 =?us-ascii?Q?NHso7AEUJTS9fflsnuP1VmEviAL/uQ2VateNqiz2gz0rbbTW+4wmEpFkF3+a?=
 =?us-ascii?Q?vRbyouBqrPiPSYgzmnDkUWT8yQ0Dd9MdyxrFw939FbWnsUIl+X7bNjm7DroK?=
 =?us-ascii?Q?6f7FcskmUgBFTRp2lNwklq75Es1PwbBkScBHBPvCuzxcJ1dyaydFSaccOhv8?=
 =?us-ascii?Q?4tr72VrpC6ye4g6K0wUNaJ4AuaC5qlXv+soo2UQ8ERMRd6wxsZYYxD2Z/1hO?=
 =?us-ascii?Q?o8aWPUpb1tRTB1UY385lda005vC2DuuciQ3FM1p6raOpT1Jozo94fI24bg4P?=
 =?us-ascii?Q?uG/cJQIwUQmykwssSN2p3frkb/s1l4iQDbjI/LWV9yilVfj9SYd8tT9Mb3OL?=
 =?us-ascii?Q?CmgE7usSTiptQglcDWz+K+eUy8+dmRIN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nODKiQMHOmjI3RvAVnrwxQkz3pCevYQRqoiuo40KaoSX8pCswmPWU9y+XOCx?=
 =?us-ascii?Q?M9bYX2nmHveG3BTHj9dLSQmXRAgDZsX9CReXbzfkdh+igYfCU3OzckZVcgLm?=
 =?us-ascii?Q?8mWz93a0Ij2q5iIrsm0fbiqvYFA1sGKJQ5ml8WAeuTXDl6M9+YpQNdQFItDj?=
 =?us-ascii?Q?vlgmHzjzrHHABHDh174Mr3OKYcBc9hgyXPrbP0NUGitCTib7/h+OfDLI7CaL?=
 =?us-ascii?Q?kZlKPbQQcL75fy/YJfSv1hWAixldBxFVgFhR7aC8C4jIuGmZxeEnEJ1aQ4mG?=
 =?us-ascii?Q?tvsHcBaD9z9vcPYmLLWf82SU7tsuzEk9aagd2zFPjmg0Mja1oQwcZW+6xJoA?=
 =?us-ascii?Q?ArBZI3iorw2pvDF/aeDe3ZMuxkGTECEFKDBBWuoY/Jj+2MA6pUkbpYMobA96?=
 =?us-ascii?Q?I8dN4fh5ZekP/Cfw4JQW24+e+v5pfcOheAOS7Z1dFV8n6/ZyRgyzMejnlBgJ?=
 =?us-ascii?Q?pScyvkTrOAJdrHusK4U05S3R58k1NjrNaExQhTR6vV+hZuCwwVwWVXDjGHp1?=
 =?us-ascii?Q?LLQ2P6cttOn8fXyRYF7ivPgl6fZeBrDi9rC7BGMp2UNLgFnJixhZrEqvhEj8?=
 =?us-ascii?Q?zfc8vkUPRjAlmmOtxt5I+j0BAOHAYJ/ncdHeJ2GM1yOK+6QaiaJIlrnya7dp?=
 =?us-ascii?Q?XezpvDJJp0fDfbLZlxLp8bNUEa26Xgy8nEFqm4DYsKZyoBbe6rt+QA0Bicya?=
 =?us-ascii?Q?yEBXmd0L2N6UJsifxo3pmiOwfKQyIGAWum7SMZViO+GZ73/QzUx3EXxDCHCv?=
 =?us-ascii?Q?OK8HKiXBs4akTMJecSBb58BuVjTrr+CpbTTlNKEriyGjeUJqika5Wi/MookI?=
 =?us-ascii?Q?QOZHl7MhDkkJ0xvECcZcQJP53mexzajBqh5stZSQF3UeVFawFKE2lwpd36aA?=
 =?us-ascii?Q?k5XugtrvD7jlG6H/6tXSzTgW1UZSGeNBYan/DBKqMlCnmduPKqsVz730/Eyd?=
 =?us-ascii?Q?wB1QnIl+xXrvuvWtKGi4i4BsvD39rKAV7b5TftXzEZUEkNxhQ2zOJ0W8BCuF?=
 =?us-ascii?Q?fl0ZPJe/z+Q6wnjU6hDz6Lc0pO8xASOB9CyHhtd8fHSNUy+FiRSDlfAgRtZA?=
 =?us-ascii?Q?R5e7aCEsnqdQ9l4cXlDNLVpSp2NMhzcHK1gHrJ64dYNS2oW9er7zYFuSLzi9?=
 =?us-ascii?Q?XBpvJ0sWLxHo0lCtzvq4rlewISa9u6Om4b4eenHd6NTvQB3TMacaXmT+lLDE?=
 =?us-ascii?Q?B+0pnrCM5e2j1V2uqoszUdRz/sK3rauwp8rHrbQ0VTtAnRSIn0893KylbyzH?=
 =?us-ascii?Q?DZx5MzNjR4enHGxp/tCZs0mOTLJqNOfh9YDMDHHXJpu+r4lTtJOorVIxD28H?=
 =?us-ascii?Q?CqZFCm6xdm4LFz/dBNvm73aOSsOwhoXc8B0TT4K+GesijF76dIJCeHVJV5U2?=
 =?us-ascii?Q?ilDy8x5qWRhyzqUGrTzUzC2RarcCrwiQlOOOGNbarx36rFcopBQuSjF6jy0i?=
 =?us-ascii?Q?345/1U/CE6StbJ0RZInHztsV33MU6iaNNN1pFJ57EduPZBwq2w7hQi8JEhNU?=
 =?us-ascii?Q?08lDZr5EgoDAgYPoaaCH0yV1ya3HEQ6oW730M5haSGJ1Bj9PSswDgFnpjBf2?=
 =?us-ascii?Q?4uH67omBymqzLPJBZDymay2iTUdYGhWJcPajV4lE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad913ab-763f-4d55-5ef7-08dd2bbf1610
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 06:23:06.9052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQ6EhtHEVpdisj0i1+VaSMrZWKPJogPBczgdL5jnGX8JAm53bvS0VH2ujyfvdP5nPXIF5RgWi3m1FYKfWDTHLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9331
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The command BD ring is used to configure functionality where the
underlying resources may be shared between different entities or being
too large to configure using direct registers (such as lookup tables).

Because the command BD and table formats of i.MX95 and LS1028A are very
different, the software processing logic is also different. In order to
ensure driver compatibility, struct enetc_si_ops is introduced. This
structure defines some hooks shared by VSI and PSI. Different hardware
driver will register different hooks, For example, setup_cbdr() is used
to initialize the command BD ring, and teardown_cbdr() is used to free
the command BD ring.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.h  | 27 ++++++++--
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 47 ++++++++++++++++-
 .../net/ethernet/freescale/enetc/enetc_cbdr.c | 51 ++++++++++++++++---
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 13 +++--
 .../net/ethernet/freescale/enetc/enetc_vf.c   | 13 +++--
 5 files changed, 132 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 4ad4eb5c5a74..4ff0957e69be 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -8,6 +8,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/skbuff.h>
 #include <linux/ethtool.h>
+#include <linux/fsl/ntmp.h>
 #include <linux/if_vlan.h>
 #include <linux/phylink.h>
 #include <linux/dim.h>
@@ -266,6 +267,19 @@ struct enetc_platform_info {
 	const struct enetc_drvdata *data;
 };
 
+struct enetc_si;
+
+/*
+ * This structure defines the some common hooks for ENETC PSI and VSI.
+ * In addition, since VSI only uses the struct enetc_si as its private
+ * driver data, so this structure also define some hooks specifically
+ * for VSI. For VSI-specific hooks, the format is ‘vf_*()’.
+ */
+struct enetc_si_ops {
+	int (*setup_cbdr)(struct enetc_si *si);
+	void (*teardown_cbdr)(struct enetc_si *si);
+};
+
 /* PCI IEP device data */
 struct enetc_si {
 	struct pci_dev *pdev;
@@ -274,7 +288,10 @@ struct enetc_si {
 
 	struct net_device *ndev; /* back ref. */
 
-	struct enetc_cbdr cbd_ring;
+	union {
+		struct enetc_cbdr cbd_ring; /* Only ENETC 1.0 */
+		struct ntmp_priv ntmp; /* ENETC 4.1 and later */
+	};
 
 	int num_rx_rings; /* how many rings are available in the SI */
 	int num_tx_rings;
@@ -284,6 +301,7 @@ struct enetc_si {
 	u16 revision;
 	int hw_features;
 	const struct enetc_drvdata *drvdata;
+	const struct enetc_si_ops *ops;
 };
 
 #define ENETC_SI_ALIGN	32
@@ -490,9 +508,10 @@ void enetc_mm_link_state_update(struct enetc_ndev_priv *priv, bool link);
 void enetc_mm_commit_preemptible_tcs(struct enetc_ndev_priv *priv);
 
 /* control buffer descriptor ring (CBDR) */
-int enetc_setup_cbdr(struct device *dev, struct enetc_hw *hw, int bd_count,
-		     struct enetc_cbdr *cbdr);
-void enetc_teardown_cbdr(struct enetc_cbdr *cbdr);
+int enetc_setup_cbdr(struct enetc_si *si);
+void enetc_teardown_cbdr(struct enetc_si *si);
+int enetc4_setup_cbdr(struct enetc_si *si);
+void enetc4_teardown_cbdr(struct enetc_si *si);
 int enetc_set_mac_flt_entry(struct enetc_si *si, int index,
 			    char *mac_addr, int si_map);
 int enetc_clear_mac_flt_entry(struct enetc_si *si, int index);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index fc41078c4f5d..b957e92e3a00 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -260,6 +260,23 @@ static void enetc4_configure_port(struct enetc_pf *pf)
 	enetc4_enable_trx(pf);
 }
 
+static int enetc4_init_ntmp_priv(struct enetc_si *si)
+{
+	struct ntmp_priv *ntmp = &si->ntmp;
+
+	ntmp->dev_type = NETC_DEV_ENETC;
+
+	/* For ENETC 4.1, all table versions are 0 */
+	memset(&ntmp->cbdrs.tbl, 0, sizeof(ntmp->cbdrs.tbl));
+
+	return si->ops->setup_cbdr(si);
+}
+
+static void enetc4_free_ntmp_priv(struct enetc_si *si)
+{
+	si->ops->teardown_cbdr(si);
+}
+
 static int enetc4_pf_init(struct enetc_pf *pf)
 {
 	struct device *dev = &pf->si->pdev->dev;
@@ -272,11 +289,22 @@ static int enetc4_pf_init(struct enetc_pf *pf)
 		return err;
 	}
 
+	err = enetc4_init_ntmp_priv(pf->si);
+	if (err) {
+		dev_err(dev, "Failed to init CBDR\n");
+		return err;
+	}
+
 	enetc4_configure_port(pf);
 
 	return 0;
 }
 
+static void enetc4_pf_free(struct enetc_pf *pf)
+{
+	enetc4_free_ntmp_priv(pf->si);
+}
+
 static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_open		= enetc_open,
 	.ndo_stop		= enetc_close,
@@ -688,6 +716,11 @@ static void enetc4_pf_netdev_destroy(struct enetc_si *si)
 	free_netdev(ndev);
 }
 
+static const struct enetc_si_ops enetc4_psi_ops = {
+	.setup_cbdr = enetc4_setup_cbdr,
+	.teardown_cbdr = enetc4_teardown_cbdr,
+};
+
 static int enetc4_pf_probe(struct pci_dev *pdev,
 			   const struct pci_device_id *ent)
 {
@@ -712,6 +745,7 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 				     "Couldn't map PF only space\n");
 
 	si->revision = enetc_get_ip_revision(&si->hw);
+	si->ops = &enetc4_psi_ops;
 	err = enetc_get_driver_data(si);
 	if (err)
 		return dev_err_probe(dev, err,
@@ -728,14 +762,25 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 
 	enetc_get_si_caps(si);
 
-	return enetc4_pf_netdev_create(si);
+	err = enetc4_pf_netdev_create(si);
+	if (err)
+		goto err_netdev_create;
+
+	return 0;
+
+err_netdev_create:
+	enetc4_pf_free(pf);
+
+	return err;
 }
 
 static void enetc4_pf_remove(struct pci_dev *pdev)
 {
 	struct enetc_si *si = pci_get_drvdata(pdev);
+	struct enetc_pf *pf = enetc_si_priv(si);
 
 	enetc4_pf_netdev_destroy(si);
+	enetc4_pf_free(pf);
 }
 
 static const struct pci_device_id enetc4_pf_id_table[] = {
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
index 20bfdf7fb4b4..31bb82ee512d 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
@@ -3,10 +3,12 @@
 
 #include "enetc.h"
 
-int enetc_setup_cbdr(struct device *dev, struct enetc_hw *hw, int bd_count,
-		     struct enetc_cbdr *cbdr)
+int enetc_setup_cbdr(struct enetc_si *si)
 {
-	int size = bd_count * sizeof(struct enetc_cbd);
+	int size = ENETC_CBDR_DEFAULT_SIZE * sizeof(struct enetc_cbd);
+	struct enetc_cbdr *cbdr = &si->cbd_ring;
+	struct device *dev = &si->pdev->dev;
+	struct enetc_hw *hw = &si->hw;
 
 	cbdr->bd_base = dma_alloc_coherent(dev, size, &cbdr->bd_dma_base,
 					   GFP_KERNEL);
@@ -23,7 +25,7 @@ int enetc_setup_cbdr(struct device *dev, struct enetc_hw *hw, int bd_count,
 	cbdr->next_to_clean = 0;
 	cbdr->next_to_use = 0;
 	cbdr->dma_dev = dev;
-	cbdr->bd_count = bd_count;
+	cbdr->bd_count = ENETC_CBDR_DEFAULT_SIZE;
 
 	cbdr->pir = hw->reg + ENETC_SICBDRPIR;
 	cbdr->cir = hw->reg + ENETC_SICBDRCIR;
@@ -46,13 +48,41 @@ int enetc_setup_cbdr(struct device *dev, struct enetc_hw *hw, int bd_count,
 }
 EXPORT_SYMBOL_GPL(enetc_setup_cbdr);
 
-void enetc_teardown_cbdr(struct enetc_cbdr *cbdr)
+int enetc4_setup_cbdr(struct enetc_si *si)
 {
-	int size = cbdr->bd_count * sizeof(struct enetc_cbd);
+	struct netc_cbdrs *cbdrs = &si->ntmp.cbdrs;
+	struct device *dev = &si->pdev->dev;
+	struct enetc_hw *hw = &si->hw;
+	struct netc_cbdr_regs regs;
+
+	cbdrs->cbdr_num = 1;
+	cbdrs->cbdr_size = NETC_CBDR_BD_NUM;
+	cbdrs->dma_dev = dev;
+	cbdrs->ring = devm_kcalloc(dev, cbdrs->cbdr_num,
+				   sizeof(struct netc_cbdr), GFP_KERNEL);
+	if (!cbdrs->ring)
+		return -ENOMEM;
+
+	regs.pir = hw->reg + ENETC_SICBDRPIR;
+	regs.cir = hw->reg + ENETC_SICBDRCIR;
+	regs.mr = hw->reg + ENETC_SICBDRMR;
+	regs.bar0 = hw->reg + ENETC_SICBDRBAR0;
+	regs.bar1 = hw->reg + ENETC_SICBDRBAR1;
+	regs.lenr = hw->reg + ENETC_SICBDRLENR;
+
+	return netc_setup_cbdr(dev, cbdrs->cbdr_size, &regs, cbdrs->ring);
+}
+EXPORT_SYMBOL_GPL(enetc4_setup_cbdr);
+
+void enetc_teardown_cbdr(struct enetc_si *si)
+{
+	struct enetc_cbdr *cbdr = &si->cbd_ring;
+	int size;
 
 	/* disable ring */
 	enetc_wr_reg(cbdr->mr, 0);
 
+	size = cbdr->bd_count * sizeof(struct enetc_cbd);
 	dma_free_coherent(cbdr->dma_dev, size, cbdr->bd_base,
 			  cbdr->bd_dma_base);
 	cbdr->bd_base = NULL;
@@ -60,6 +90,15 @@ void enetc_teardown_cbdr(struct enetc_cbdr *cbdr)
 }
 EXPORT_SYMBOL_GPL(enetc_teardown_cbdr);
 
+void enetc4_teardown_cbdr(struct enetc_si *si)
+{
+	struct netc_cbdrs *cbdrs = &si->ntmp.cbdrs;
+
+	netc_teardown_cbdr(cbdrs->dma_dev, cbdrs->ring);
+	cbdrs->dma_dev = NULL;
+}
+EXPORT_SYMBOL_GPL(enetc4_teardown_cbdr);
+
 static void enetc_clean_cbdr(struct enetc_cbdr *ring)
 {
 	struct enetc_cbd *dest_cbd;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index 203862ec1114..a214749a4af6 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -939,6 +939,11 @@ static int enetc_pf_register_with_ierb(struct pci_dev *pdev)
 	return enetc_ierb_register_pf(ierb_pdev, pdev);
 }
 
+static const struct enetc_si_ops enetc_psi_ops = {
+	.setup_cbdr = enetc_setup_cbdr,
+	.teardown_cbdr = enetc_teardown_cbdr,
+};
+
 static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
 {
 	struct enetc_si *si;
@@ -957,6 +962,7 @@ static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
 		goto out_pci_remove;
 	}
 
+	si->ops = &enetc_psi_ops;
 	si->revision = enetc_get_ip_revision(&si->hw);
 	err = enetc_get_driver_data(si);
 	if (err) {
@@ -964,8 +970,7 @@ static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
 		goto out_pci_remove;
 	}
 
-	err = enetc_setup_cbdr(&pdev->dev, &si->hw, ENETC_CBDR_DEFAULT_SIZE,
-			       &si->cbd_ring);
+	err = si->ops->setup_cbdr(si);
 	if (err)
 		goto out_pci_remove;
 
@@ -984,7 +989,7 @@ static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
 	return si;
 
 out_teardown_cbdr:
-	enetc_teardown_cbdr(&si->cbd_ring);
+	si->ops->teardown_cbdr(si);
 out_pci_remove:
 	enetc_pci_remove(pdev);
 out:
@@ -995,7 +1000,7 @@ static void enetc_psi_destroy(struct pci_dev *pdev)
 {
 	struct enetc_si *si = pci_get_drvdata(pdev);
 
-	enetc_teardown_cbdr(&si->cbd_ring);
+	si->ops->teardown_cbdr(si);
 	enetc_pci_remove(pdev);
 }
 
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
index 3768752b6008..d7d9a720069b 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
@@ -162,6 +162,11 @@ static void enetc_vf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	enetc_load_primary_mac_addr(&si->hw, ndev);
 }
 
+static const struct enetc_si_ops enetc_vsi_ops = {
+	.setup_cbdr = enetc_setup_cbdr,
+	.teardown_cbdr = enetc_teardown_cbdr,
+};
+
 static int enetc_vf_probe(struct pci_dev *pdev,
 			  const struct pci_device_id *ent)
 {
@@ -176,6 +181,7 @@ static int enetc_vf_probe(struct pci_dev *pdev,
 
 	si = pci_get_drvdata(pdev);
 	si->revision = ENETC_REV_1_0;
+	si->ops = &enetc_vsi_ops;
 	err = enetc_get_driver_data(si);
 	if (err) {
 		dev_err_probe(&pdev->dev, err,
@@ -198,8 +204,7 @@ static int enetc_vf_probe(struct pci_dev *pdev,
 
 	enetc_init_si_rings_params(priv);
 
-	err = enetc_setup_cbdr(priv->dev, &si->hw, ENETC_CBDR_DEFAULT_SIZE,
-			       &si->cbd_ring);
+	err = si->ops->setup_cbdr(si);
 	if (err)
 		goto err_setup_cbdr;
 
@@ -235,7 +240,7 @@ static int enetc_vf_probe(struct pci_dev *pdev,
 err_alloc_msix:
 	enetc_free_si_resources(priv);
 err_alloc_si_res:
-	enetc_teardown_cbdr(&si->cbd_ring);
+	si->ops->teardown_cbdr(si);
 err_setup_cbdr:
 	si->ndev = NULL;
 	free_netdev(ndev);
@@ -256,7 +261,7 @@ static void enetc_vf_remove(struct pci_dev *pdev)
 	enetc_free_msix(priv);
 
 	enetc_free_si_resources(priv);
-	enetc_teardown_cbdr(&si->cbd_ring);
+	si->ops->teardown_cbdr(si);
 
 	free_netdev(si->ndev);
 
-- 
2.34.1


