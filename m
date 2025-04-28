Return-Path: <linuxppc-dev+bounces-8086-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D83BFA9EEBA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 13:16:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmLVj49ymz2xVq;
	Mon, 28 Apr 2025 21:16:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::608" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745838989;
	cv=pass; b=cf48Fa3A/OyEq44qKMBiiXTnI1cY0mkbOy5DrcOvocma6iY87FjeN49KuclYYHopCtG2ksjhd1mkXtk6j7q9+gitzMYxkUuAm8baxRF9T6Z7WXkG6xgBkBpNs6ojYZ9lhOeoFh1TCnNRKtZz9iHKEJh7e9FsxiPvRPsCimvaFoi1GGREoNPgH9ZOJXP25Xj3wmcnuJ1c8P5cF6yhaN+fHiRafPJz82FjcA6i7u1jS5X8tlkSBcqKcOXpoM7bPrjHHFuDavZMOdQ5NVVgVXf3ZayMnbae5VTZ3LTfMeV9dX0DWSQfLHX8a3IeAkvmOESjsNlW0Qgetg+uI80/Xw0J8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745838989; c=relaxed/relaxed;
	bh=uXQdT/KrXwJaxeXQwOPZ5Ah7ya9PloRJQ/JwVc4Dg3Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n/XTzVXiKczTnI9cbB9+Di084rt7NnOkvMH32SmqY+hAJPgJRovjfWCr5BH+GpYDXfKYWGS+siYcYqlAedgXQ/FocNt70+AdI44mL2pBairg2ssN9Z0pQ9/s5Za6nkwxPEtHkd9+zf4VD+dpMYramr8wS9t3BYj3Az5iQsHrGaYL1YdmZXfRieh/mcjcXmGVXZJqWBYc5awZzf/HTFJBM2VUG13hZE1ydOfFN009KUFKy3JqoAM5pReZT1tLOkrCpsLzZg9ZxPKHI+JDbfumAzY25FjgMFM3AHgwDfWpQ10tSAuNTg8m+TsFDkkRauqZn4Cos0rfNz4N8hHHUkMJqQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=EQdp6Li3; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::608; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=EQdp6Li3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::608; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20608.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::608])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmLVh6dN7z2yrm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 21:16:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udRqBJytk7wY8Fs3mniwybmltzln6p/qGa9Y3whIzSGTzDOOswXJGRCuwZ3ByM2B7PYjRfuvSRrnhSAlIqrOSeMvpmrfP/FGJajYou7Nkyi4JZjx9fUN+MOd2p+bdeqLD6KUMFNmxYNMCEP7nD9vZ4UNtHOdtHG+pRpg0CWoKfYnxctnbLgrgRtxvCWfPItll5M36Vic45OZyc0koTst+n5yrEjVbSSOXq6pIlNNg9+7cPIgd4/AhtWEYjlufWqt0BsbEohiza5PPNs6adiAtflkRVXOu7NYWiqmXn2Ku6PID2Hco7xQ4ZPooG7BC/2IJ8mnm4nWeBZcbBhsc/qU7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXQdT/KrXwJaxeXQwOPZ5Ah7ya9PloRJQ/JwVc4Dg3Q=;
 b=qCgD503aas+XHZU1aER01iNd/uQ3Pw3ojgFUyQjOCai9uWA2EzUdJHNEZxqpHSe9No1LuOWLl72JVKJegoMKDPdXNYK+On60KqY7/JJ9KLPMz/ctisnUhKe4ICL/bV8/zBgu0nR+XD6F1tMEonGNQzeHzp/qxfoFUt4939jFfa1RGbnwkBMB9zFtF021INEFaJLH7Mm9nCXVEzMcv1TjhQF6mgf7HAxU4a9MOw1kXf4hXHEsHhWC7NJNmI1GuyprO1h594EQlunmtO6x0FmSkANjtXEJwmYbXxO/h47gPXGyZzw5rlailx9T30xlc4weuWj5lRl/Cqao6pSskGmKmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXQdT/KrXwJaxeXQwOPZ5Ah7ya9PloRJQ/JwVc4Dg3Q=;
 b=EQdp6Li36OjmKDAagp4RQvZX9BdP/idPah/pZIAhsMaWRv75HMaII99R1l91PXzZWcKs0PZuHU3q6K7xvDrdvwwxxIJl2tDCDs/lRRwa1lzsbdd2jsr7/Sz2THhs8hFxPDOSi7i9QgxPzFDJLKUmY34yyGvrrlEJHKvGstuYPvtgAnlTRC25fCiozT5gOLM3stHGdE5NKlAoC2eM0aT3CmigX8QFE5776Ezp+KNo8lr8FCDBqbiXsBBRXjtlGDxSFWtjlo84KDerKzJnjr5QeX+ZLV87tgy2bW271DRlRWEaxKKtRgskl4zlygQmdxgPwr1i/PL6rYQBcQCycCwMQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PAXPR04MB8624.eurprd04.prod.outlook.com (2603:10a6:102:21b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 11:16:10 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8678.025; Mon, 28 Apr 2025
 11:16:10 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 net-next 03/14] net: enetc: move generic MAC filtering interfaces to enetc-core
Date: Mon, 28 Apr 2025 18:56:46 +0800
Message-Id: <20250428105657.3283130-4-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428105657.3283130-1-wei.fang@nxp.com>
References: <20250428105657.3283130-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6)
 To PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|PAXPR04MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c4d5dc5-7f91-472e-f672-08dd864613df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a6vLhOhbZo5LHb37lZJS2k8lGIrEy0AjvBPvyHqf6fYJue+yxBSafIn/Zx8Y?=
 =?us-ascii?Q?NAMw6TlV3NWi4TFcSWJAgvRTo846ykDCPcUBQ5RX0BiPj+dj0IWXY+LilByc?=
 =?us-ascii?Q?v33RIZW+bc8an3K9WoihOz9lr49HV41a17/WrgpwFkupsxuzzHZ6Pv+SHqfG?=
 =?us-ascii?Q?6mUhRipgOL9oHBZDo4uzIPCWS0lVFE+QW8YRO2n4MIiOJTBaNNyfqHnw1uYx?=
 =?us-ascii?Q?CjcXmIqclE54wMxHiUn6SL48yborNA0QgkOuz0QbvgatiKzfjAenjINyLmi6?=
 =?us-ascii?Q?ys3J+S/AGwJ8A4CnWWMCKr4mTxMZhpvt1JGclZ6GlTaHQxwtZGmZOy0yRQLI?=
 =?us-ascii?Q?3s9ppDeYCFC/fu5u1eRE7ZNbOXAXnDq1T1Kw5kL5zrTESbpVivxqE/ogeZCI?=
 =?us-ascii?Q?xuWzZU1pAj4MGxxVyD0GEVJCSXt84iUcLDltwLlWBFEr8Sx6Q0A68uicuGK7?=
 =?us-ascii?Q?mQnTX9yydxWt+AjfZMRX3d39SMvBDS3t+30wIC4Iywef2v62h7rfBZ4kf/+L?=
 =?us-ascii?Q?3oM+wEFIoGEuTiCyXn7wlRFD/vqFykwMMcEAen8k8Zoqs9M4fjBhDweb1LwT?=
 =?us-ascii?Q?OB+2N+1wcrnatz1/v0lPHJaHxwhr6SMqRHa84uE7IfDAih88V+2ppNK9mJWp?=
 =?us-ascii?Q?bG77M1yj95VXYeIpTx5VW2uZHLvnkbTepzmZ0QCke93yfwoU3wGHw2DvcD9T?=
 =?us-ascii?Q?j1EY3dU5cGVhZOSJhahR0CB0BuZkvTGK7XvQ8lWZKErgKG266ZoVaJ/LCt1H?=
 =?us-ascii?Q?dd1JU9E+UA+cOSc/nR9MGoAPLB3FdsJaVAIA0gxP2NBqOujttzZE/B5mWgDw?=
 =?us-ascii?Q?kQIicPHEXwLF58DHxzQUBsQ84YTKQAf1oBGWVOgt7XJDnzFVeDLN8PhJBGff?=
 =?us-ascii?Q?S+4lZEMt7g47NYwbE6ecH1nDSlarB0t0vJKhEQNiWIG/cfRaJr52s0nLGiGA?=
 =?us-ascii?Q?CJE67jUxUQQvcnKocENrrVA+V1rPtuZ6xm+dyOZAVP+MHUCiLii8b6Ri4azm?=
 =?us-ascii?Q?14qC33AWITYd4ecYOg//QndefBZMZt7ORJS+po77u5YTcywzueo28kaeLvXO?=
 =?us-ascii?Q?Cc9v1ozm5noB0hK9uZVbBUorixWFOOlqjbFHYFNxL7TfZ1hgBXRG3O9rhxlu?=
 =?us-ascii?Q?LGKIyFE1JP5fKB64XLTqBIjj+Cs2V6g+zpuqMhpRPO2zCaCItqTNKHyihATT?=
 =?us-ascii?Q?BPXCb2LXC7KgyeDaI9yxlt6fLrXuV6O4geMFUiWv6Kq0xqBqKuQiD/kng1sq?=
 =?us-ascii?Q?bzVsZohKhueFMK18Bn8WC1AYgGGPg7xOZaDvRGOvPnXJnR6kqenB2Ku17GQe?=
 =?us-ascii?Q?F5R2wxm5Qs2FvgbMRHBLuVtFyxGymfOPhqF+YTqMEtmAVdk+Zrx/2Yv42oTm?=
 =?us-ascii?Q?/zGAgTAuHpNxuKJErGSjEEhOXg7+gzmLpXXKgnZ235CULBhI4W1LI+H51uRB?=
 =?us-ascii?Q?8TfRkIByg02Rmjh31iL1ihzAx+SyhaPe77PCyFtEG5kLQmsVVy7pew=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k39SQ3tF4yywBqcGamOwAySFkfnsZEIdvLelEbj4Lsk2QcDcqxyvHdJGDPqn?=
 =?us-ascii?Q?lu/8KajJkOrwjtOWWUCkf/WChxNNzcjsxApse7o1j8DOHuDPS94657ZoXQTS?=
 =?us-ascii?Q?kBmMKFhUnO9Hhh6vfaoAV9L9O+TDMARjX5oROKufQuYb4bB7GzLTk2DOSdgR?=
 =?us-ascii?Q?z36U+ZZTyuubBzBX3wi39iiNCfPvC/Dl3fseQF3OqoUd3u57jY6itNKLMcrZ?=
 =?us-ascii?Q?vxlKYLhBjuP9vqvnRqqa9IxgooZcgaqTU/iEtZO++tzIB/wwM0S/9x4eM/sP?=
 =?us-ascii?Q?3yyxkIgbedkJ6WE569LJmFVhAEDM9zvqSJhxB2Nn44KhMkPOmkUq2OXtzM0j?=
 =?us-ascii?Q?bgkGZdHZZR5m5mFrrQRpANGqIYTivOYN4FVb0YQVaBYjBxi1WO7NTRPEO5uq?=
 =?us-ascii?Q?lu5gwIwRUNJ0blBatKLUNXcH6e7QC2ub6JvHXKVKq5mBbbBmZ730gghNCYkZ?=
 =?us-ascii?Q?ROrJxYt0BW0srMmHf7GBW5Gur4a2KHgu9mn2YdyEoddLBwtKhXsK7kkWddpB?=
 =?us-ascii?Q?t6jcZI75Hkix1o1K9qOz80KCYNvF5IvhgzFE4PVFOAo4ugPR2S90BatU54Cy?=
 =?us-ascii?Q?nUjE3kD2eUyn9oPMzL0hbdT2arBVCKi63jRFUYU3I/cO4awCE8T6sTWuHjgZ?=
 =?us-ascii?Q?VD4GizJwzP6FSXIaovHny1tBWGmfuMA67xMMDtpSJJA9c1QSWSGT8R5bzpbY?=
 =?us-ascii?Q?ixoavoQxB/UHI0H3858BTjbUdfnfxvt01eX4Rl89gbKUJ2rwyk9GvyUhgwZG?=
 =?us-ascii?Q?ggFqvW3Ajhtv5utRoxNTm8A6EKi2PQf5VLxwGnthWcVi/WX294eSWbgzefUB?=
 =?us-ascii?Q?Ku+jo/EDjWN3Qa4zkAIXiH7iTm3Mrb5DkBKbFcKkT74bEXirDAyKdTUZcBrJ?=
 =?us-ascii?Q?xBHwHfR9oFqyVz52vJh5grhEptMUSR+IYMkOiLjOTIkxBOvKJbULDBMARu3g?=
 =?us-ascii?Q?eBW8KC5QZI5DjOP56MOVMwPvDBpYDeUedQP7IaWXQbmjwvIiCAbs4nRy7cDJ?=
 =?us-ascii?Q?yWhpjdCNLpjWW/Qi+Ql52G7OmLRmp6kjIsBDXZ4CNOa8YU5JC1mLKJosWhJg?=
 =?us-ascii?Q?4zy9zZy48fo5xvUVt+bR+G0TW+XXi/1LcrBqkfxawhaXZp2fj4IDHnNdnmkB?=
 =?us-ascii?Q?9iu79qEM+EZlUtSQniuMe3JRH6FxBWQ7E9by4uB4tiVqTPt32fFhzkULmvRJ?=
 =?us-ascii?Q?8exxN7nnK6/NCcTb8bMnlA52Ru4dygUc1dIBBjS1C/rgKiyPgra9UhG5KvYk?=
 =?us-ascii?Q?TmXstWE8BiO4Ugqrl75rDel0A+8skAdqbmxuGWZ7G9Hb0HCcl0Apg3t9gwbU?=
 =?us-ascii?Q?E+2qdSKSZg2lxyU+yA51YbYFF70PjwWZkbbPgtrL+Q+1DdiBrWdj9WxAnk8a?=
 =?us-ascii?Q?2OuyIkwK3F85q5Ih0JCJUX7dieBJvqBmIXDV0HrIVVASYeuFWLgPlYMaM9xz?=
 =?us-ascii?Q?uVVhs+eRpuUpFcBRwDkeZKOqFQOxJWSBN7Rljdtyq8Lj9yG4MM9KmZMC42UC?=
 =?us-ascii?Q?QPhey1Ud9OuPYGINONr1yABDzB0U9j7WEN6p6CgLJnA1YyLtUXUFU+hcBgyi?=
 =?us-ascii?Q?WjTrJnrMVtkfW/8f4PXdWnI5sRhAoh5v8mxpCcfD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4d5dc5-7f91-472e-f672-08dd864613df
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 11:16:10.0063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8rJAyweXlHkQ2TLE7d82JrLFa5+jgICc0zbplDjfB4/JA7jmxWPggYnDgz6T7o/+R/IQAOUr7eRXgXbSjVjZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Although only ENETC PF can access the MAC address filter table, the table
entries can specify MAC address filtering for one or more SIs based on
SI_BITMAP, which means that the table also supports MAC address filtering
for VFs.

Currently, only the ENETC v1 PF driver supports MAC address filtering. In
order to add the MAC address filtering support for the ENETC v4 PF driver
and VF driver in the future, the relevant generic interfaces are moved to
the enetc-core driver. This lays the basis for i.MX95 ENETC PF and VFs to
support MAC address filtering.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v5 changes:
1. Keep mac_filter in struct enetc_pf
2. Modify the commit message
v6 changes:
No changes, only collect Reviewed-by tag
---
 drivers/net/ethernet/freescale/enetc/enetc.c  | 36 +++++++++++++++++++
 drivers/net/ethernet/freescale/enetc/enetc.h  | 15 ++++++++
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 34 ------------------
 .../net/ethernet/freescale/enetc/enetc_pf.h   | 11 ------
 4 files changed, 51 insertions(+), 45 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 3ee52f4b1166..5a7af44e4594 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -36,6 +36,42 @@ static void enetc_change_preemptible_tcs(struct enetc_ndev_priv *priv,
 	enetc_mm_commit_preemptible_tcs(priv);
 }
 
+static int enetc_mac_addr_hash_idx(const u8 *addr)
+{
+	u64 fold = __swab64(ether_addr_to_u64(addr)) >> 16;
+	u64 mask = 0;
+	int res = 0;
+	int i;
+
+	for (i = 0; i < 8; i++)
+		mask |= BIT_ULL(i * 6);
+
+	for (i = 0; i < 6; i++)
+		res |= (hweight64(fold & (mask << i)) & 0x1) << i;
+
+	return res;
+}
+
+void enetc_add_mac_addr_ht_filter(struct enetc_mac_filter *filter,
+				  const unsigned char *addr)
+{
+	int idx = enetc_mac_addr_hash_idx(addr);
+
+	/* add hash table entry */
+	__set_bit(idx, filter->mac_hash_table);
+	filter->mac_addr_cnt++;
+}
+EXPORT_SYMBOL_GPL(enetc_add_mac_addr_ht_filter);
+
+void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter)
+{
+	filter->mac_addr_cnt = 0;
+
+	bitmap_zero(filter->mac_hash_table,
+		    ENETC_MADDR_HASH_TBL_SZ);
+}
+EXPORT_SYMBOL_GPL(enetc_reset_mac_addr_filter);
+
 static int enetc_num_stack_tx_queues(struct enetc_ndev_priv *priv)
 {
 	int num_tx_rings = priv->num_tx_rings;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 384e0bded87f..c3ebb32ce50c 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -23,6 +23,18 @@
 
 #define ENETC_CBD_DATA_MEM_ALIGN 64
 
+#define ENETC_MADDR_HASH_TBL_SZ	64
+
+enum enetc_mac_addr_type {UC, MC, MADDR_TYPE};
+
+struct enetc_mac_filter {
+	union {
+		char mac_addr[ETH_ALEN];
+		DECLARE_BITMAP(mac_hash_table, ENETC_MADDR_HASH_TBL_SZ);
+	};
+	int mac_addr_cnt;
+};
+
 struct enetc_tx_swbd {
 	union {
 		struct sk_buff *skb;
@@ -471,6 +483,9 @@ int enetc_alloc_si_resources(struct enetc_ndev_priv *priv);
 void enetc_free_si_resources(struct enetc_ndev_priv *priv);
 int enetc_configure_si(struct enetc_ndev_priv *priv);
 int enetc_get_driver_data(struct enetc_si *si);
+void enetc_add_mac_addr_ht_filter(struct enetc_mac_filter *filter,
+				  const unsigned char *addr);
+void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter);
 
 int enetc_open(struct net_device *ndev);
 int enetc_close(struct net_device *ndev);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index 203862ec1114..f76403f7aee8 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -72,30 +72,6 @@ static void enetc_set_isol_vlan(struct enetc_hw *hw, int si, u16 vlan, u8 qos)
 	enetc_port_wr(hw, ENETC_PSIVLANR(si), val);
 }
 
-static int enetc_mac_addr_hash_idx(const u8 *addr)
-{
-	u64 fold = __swab64(ether_addr_to_u64(addr)) >> 16;
-	u64 mask = 0;
-	int res = 0;
-	int i;
-
-	for (i = 0; i < 8; i++)
-		mask |= BIT_ULL(i * 6);
-
-	for (i = 0; i < 6; i++)
-		res |= (hweight64(fold & (mask << i)) & 0x1) << i;
-
-	return res;
-}
-
-static void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter)
-{
-	filter->mac_addr_cnt = 0;
-
-	bitmap_zero(filter->mac_hash_table,
-		    ENETC_MADDR_HASH_TBL_SZ);
-}
-
 static void enetc_add_mac_addr_em_filter(struct enetc_mac_filter *filter,
 					 const unsigned char *addr)
 {
@@ -104,16 +80,6 @@ static void enetc_add_mac_addr_em_filter(struct enetc_mac_filter *filter,
 	filter->mac_addr_cnt++;
 }
 
-static void enetc_add_mac_addr_ht_filter(struct enetc_mac_filter *filter,
-					 const unsigned char *addr)
-{
-	int idx = enetc_mac_addr_hash_idx(addr);
-
-	/* add hash table entry */
-	__set_bit(idx, filter->mac_hash_table);
-	filter->mac_addr_cnt++;
-}
-
 static void enetc_clear_mac_ht_flt(struct enetc_si *si, int si_idx, int type)
 {
 	bool err = si->errata & ENETC_ERR_UCMCSWP;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
index a26a12863855..a8b3c8d14254 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
@@ -5,19 +5,8 @@
 #include <linux/phylink.h>
 
 #define ENETC_PF_NUM_RINGS	8
-
-enum enetc_mac_addr_type {UC, MC, MADDR_TYPE};
 #define ENETC_MAX_NUM_MAC_FLT	((ENETC_MAX_NUM_VFS + 1) * MADDR_TYPE)
 
-#define ENETC_MADDR_HASH_TBL_SZ	64
-struct enetc_mac_filter {
-	union {
-		char mac_addr[ETH_ALEN];
-		DECLARE_BITMAP(mac_hash_table, ENETC_MADDR_HASH_TBL_SZ);
-	};
-	int mac_addr_cnt;
-};
-
 #define ENETC_VLAN_HT_SIZE	64
 
 enum enetc_vf_flags {
-- 
2.34.1


