Return-Path: <linuxppc-dev+bounces-9574-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FF3AE1375
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jun 2025 07:56:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNmtc1dwJz2yYJ;
	Fri, 20 Jun 2025 15:56:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750398968;
	cv=pass; b=FJBfIIFpI7nfvaiHiAKNQ1OCdu/0Z0LvUWY8UqtJTqkPhdBzfC8TSTzCxPdwTnW82TB7LjVqT1Vff4NmfkQlBAC3ntWD3ln4Rd8ipZ0oh+7XECXnHutgfdqNQp3nMcaAU++fuaIJUif10+WiJq9qrQJzmEPvV5Y/FnGZ/upp0iA+PQBtmr/hQdHsofTEPH4J9kJpmsoDwkv78R1ZBKYGeXsCAEOOwUdT914WphaPOtwjEbCyPN0+QjTuz0jUhgNJcEmUVoO6X/tMZvFAcwyOKs/ZAEArF9Yrv7SSiaR/Fi3IHxl25eFhjgibJfD3wWLaBehY4qorq90b1i/19TosBw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750398968; c=relaxed/relaxed;
	bh=HoSKUEHLwqZuQkw90KHEZbgwqSIMQgcP9KVGIm9OGMQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M6beGpVoyTJDnDOrRKb4xrY8FL/t0kdBLdFXR2z7KExeGL3D+kTJxgTG4Dk5HXmtRroLsCrJi7dyqDPgjkov+A2uY2eRqMllq6fzbXZyxx6yQ9hSfRvUuZS5iGy9uoJrN9wHyzfpPXN5KcKhb7yvqVZodmxqGfRBZtjqwBg/slF6mi5iTBNH91TTjkH5I/kwH1TW2NIZ/spftBc7vdBG0JofIA6y2VHUGGYrgbMGpYRnGnACD5+7VvdP3ncXN/6JtIvpHIJ7ddw60efcG8iSbGEotv/cwGkchIMPgwTbor9+ce0yeDhzM9xqZi1exqn+txoou0MxgWXTEteIG8iSEg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=AnlcdmLG; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=AnlcdmLG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNmtb0VTDz30QJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 15:56:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qw0zgwxIB19v3mn/bSjdWmcVmj3zl3Qjrrf5e/VWQIB6fehXHP9p/txcCxCjQYsZCF7MkPlUhhxBjOVgrPCK5b1YITlFwyOKPx3UAA59vCGyL8amksdOPlIgUV9sGNagrWu+5ik5XQYr+23zgk+kGNZB8c75sHrQUsLulQfE1bwYc6fCYzKNGaDqw49mPr4QOnE5EJqgMjdYjL0upRCffIP8HZA+f7JlGZ4z4vHsNK3GolxlX4YPpF/A6MVV7e4vkyPtpfQNPUjcvmfRuAfDuvP0raSkl3ajNsY1K8Hn1VHq6EgK4lL+SM+OMl8NrGDAKJ4INWySx2w27RF30r8Ksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoSKUEHLwqZuQkw90KHEZbgwqSIMQgcP9KVGIm9OGMQ=;
 b=fj1oJFZ+P/Cr5oLF4nVTfHOwi6R0dd+CC76EeQYcY+aUGDl4FR27luB0HZSBRzXpgZIlEssqDMR4WqeiczBZcEaJD0YPPeDir42AWbTfJ1MLJvaO8LBuXyi49OEoJWaxvdZYMwKwENMun+oAJBZBBp8WKDjtZrYP3uBvWVIq96usYA59h4y21+VONaVKKTwuqLHc53KeOK6eAQJEBIT/lYy6LFjGEeBgj7fi5t9XKdmW0DFl6NCncLrvNU92V+Xs7MaROEOtKxtL9jL8GVR9VVG0cj3e5kApcZ5iojmPQqsWs6MjQJ1jf6rmNqR3EXmF5LPmAS37ocIuNej3H8g+ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoSKUEHLwqZuQkw90KHEZbgwqSIMQgcP9KVGIm9OGMQ=;
 b=AnlcdmLG0T0UJnScR3vggnoHjuZaemp61PKNf0ReVfH1+hxHXObSjpwQYY5xiLizZLw+sgnlqOTasbg8enmVGob+ON+nhFnYENqjvlzoYdOsPBRmHroX5Njz8RMTKXFA881wNCG/buqtsTkcvTNRmpzal4Nxe6+peM441D7XaJoBP536plxjMOcPU5m+cGtfBfnssPM2g6Iy22tDf7Y0fqaFSmf2y2CZ205P72iJi3E85PpLwHEFJSWx+HlQ/jRij7UI54QdnOs2i9HQ7dt2dXP/YejwMxslTDA/vnQAM3hqhaWmpgkhhJxO8C+NthMXaJaqqGxfFw1DRztF06EjPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB9PR04MB9962.eurprd04.prod.outlook.com (2603:10a6:10:4c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 05:55:51 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 05:55:51 +0000
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
Subject: [PATCH 1/2] ASoC: fsl_mqs: Distinguish different modules by system manager indices
Date: Fri, 20 Jun 2025 13:52:28 +0800
Message-Id: <20250620055229.965942-2-shengjiu.wang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: fa10f094-1321-484a-a09d-08ddafbf1c47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BbVpvOf9JXEIaXpdRJO+pEGXB7KcjP+oTTgt/njKPUFdMgnAAlGPfiwHUb2j?=
 =?us-ascii?Q?qxo5lI/NEUblh+DGDpYxtRCFnUG62oIHKb72HZn1gUeu2ULWjMQ0eDP4uP6S?=
 =?us-ascii?Q?TUivGbhZXHQ+McXWgknzpqFH744PshJaU5KZlLuKYuYqMA6u9mvMMk37Gq1Q?=
 =?us-ascii?Q?2dS5RvuwSu+XYlF1sjdmQM1BidI6VFA8YS+OodoolAS9WabkVe+M0H88Jtgu?=
 =?us-ascii?Q?SGPBOac1Cy+eWNPp2Zm+S+qYhdY/L5SPLG5gpqDqccETg3yVLTJnX7RqGgsO?=
 =?us-ascii?Q?GkauCrWjFF9HF2dbvW2xbbtH8MonZPaD7sA3nZV5j+ZgUpEGFnnyNyi2D3bh?=
 =?us-ascii?Q?mNxFYVtcztxhFsWPZnc5upNJIZT8fWptLaXqTS8j19yayIy3vU6CS5c0iubn?=
 =?us-ascii?Q?yl2qNMbaoEYX2Qfm8DVcwskD+12QJKqynHbEou1cJlpd3pr9fA8Q81fJU621?=
 =?us-ascii?Q?2gQ/5nAFb0bVhQh8dUYkg9xWPr22VvQV7VWma+uFwtFqVf5uJQxcQAw31joL?=
 =?us-ascii?Q?uPPdpPgBoZ1KHuvVHpys2xI77+Rqgf7g0g7vOqnKXR/cWtbVIaytjBCyUllj?=
 =?us-ascii?Q?fI3EPYKUcPUEVGMYPMAvXPjxMgiH5f4//o/5yc4i4CwgEI9+S64FvUcg/lmI?=
 =?us-ascii?Q?ZLsVmMLZbzb/80Tjx/44cSwCf5Htww4wGvEkfo6GqKod76ki4S9FZgSz564v?=
 =?us-ascii?Q?S+X/BjAYEkVdvk3AsQmtDUHjSfJvx47qbd7l44aqAOXficPvcoJP+2vERmSj?=
 =?us-ascii?Q?eN+3ccMo2TPdoX8v6nvnfkjAv80xPWtP8mdYAi/CRoD916cPpAsLU3BWdvyi?=
 =?us-ascii?Q?KuoUSZ67bLnPF6o9YyLT+4rVV7+6sF1/1E107Y60t56isfSl4RfvWo9MSAHw?=
 =?us-ascii?Q?lcpGAd4LSwuWweL1LeetK8L2bf86/wysmH2zNQe4Fx0ZHYCj4ZOGej4QucsY?=
 =?us-ascii?Q?nWrXrAM5gxApT82fbQKhyYZ/hBnVcuaISrUVk9n4+j7pCidfV+8Qc/F5upR/?=
 =?us-ascii?Q?JxevI2Zb9/kZ5xDX1Pa/CaLVQlr6ahuyFDWi4P/uI8F9ximai6KDqQfjRz4+?=
 =?us-ascii?Q?KEN92FrUm9Yylv3sRbu4j5vZnYjKDSFgzrfMLckw/VbJEznIGfu+vpSZKNnm?=
 =?us-ascii?Q?50fuxwDTE+gL8RCIE2hEQxOn+jA3K3bCRpe3qhni5emR0yfRQFhny/xkk1cX?=
 =?us-ascii?Q?fcNgl9EDmHL6HrTSy9YtgWnsGu91Xp08hO+ka9a7IfR5aNqBx8DB4ztD9rTe?=
 =?us-ascii?Q?c4Wufduo2za7MiALhyCuhux31mi/BkVArgqCwZTHY96UJpFf9j2G1fkkE/b8?=
 =?us-ascii?Q?yFkALsXLorde64e7s/bIrLSOlEIE99YdAZ8ht/puxiUl/r5ah00xQxX2t6e1?=
 =?us-ascii?Q?AXxcpVVu6f4cYvZ/90m7rEYdKY6fHhrUEsu9Hy7hhpc1k5e4Rip0GLHx1dIJ?=
 =?us-ascii?Q?eZbWsYjxEAKzDb/1lGdXm847hEz9X6PZtLwsXMyPOoTWYy06xgZaIhH/S9Qc?=
 =?us-ascii?Q?cBd9JEJn24kzJkI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xJRNVJkDstA5lTGnC7/pmwbhWtTaBnIzRd3jIIGr4xQooi2QQEbdLXcGb/r2?=
 =?us-ascii?Q?y2ngzYnUDTXzUGNq7a64JpTg7h6maau6UvALENabMkackSozp+oudJbWp1ua?=
 =?us-ascii?Q?QtCQvdO8tsM12PJQM+wjhkj8558GRc/wfO9fpNqeTTj2J7Ty9cdJ6AqFUJ+p?=
 =?us-ascii?Q?3x4irFPSUeta/Ay2BI4L5fJNNx51KLqBp29qWDe8R9zKO1g7/oiYIvJbfz52?=
 =?us-ascii?Q?YfV3FhbcaIbjI5tfGYrXTh4uIfjW4UH/8SOOoGivIaynfjmA6kIkTkIPZCA7?=
 =?us-ascii?Q?QCTIiCj6qaOmwINPdcEDS64WrKeHBIRdAi0YNLuoFF0h7Ze6I1G9avFJmpx+?=
 =?us-ascii?Q?qDswoz74gxaRVpjfEy+xodvDTQdaRRuEMGzsjPA+7AhJFhFleCnhZFBe6le3?=
 =?us-ascii?Q?0nD47TOdqi1a7pdy++KBxkZXaVdYu0yCLphtYqGrj6DwU5O4Ynrb6qipyGcC?=
 =?us-ascii?Q?kZaTx+ZMfKSl999MEz5NVKBw3OkiiYCteoxqUMuj/+EFVzEseSGGBSyQD/Rd?=
 =?us-ascii?Q?JO86xqM47wmgYyivvd0ZHk9siXI9tvOn6O8Rec21SGvv9fb1ir0r95L8ySUp?=
 =?us-ascii?Q?o2jWWM2BbaaHrPb9yynW3KuGYxEoXTguMjVJ5CVbvSiCKTdWoG0njIVJRHxS?=
 =?us-ascii?Q?9gAQv6ZR9qrhDv3Gbfbx71n63Dm+atwocWhZJMpsM/Pk4SADrEpkAEMCbdAW?=
 =?us-ascii?Q?MmQoJAMt7eHVRm0ERqCfeMW0Q7/kQu7OwVyDwCLW012ZDM4w7ghPz5Muwu7v?=
 =?us-ascii?Q?oE89OEnLab1HQC8q1gIT71y5XhOhbYIGFyZ8yfBY+GPOguvFwpjUUQkhA/O/?=
 =?us-ascii?Q?UeCgpKX4w64Ra8k5FS/MX59hp9vFmgXmJSVP9NOon2Ar01c83ULLSmRV6P1f?=
 =?us-ascii?Q?jB9tqXvMYcr5bV25bJzxotYysL+g6xtZB8eyXItPtupVugUhnqwtwSoo9O5v?=
 =?us-ascii?Q?07a3sYTNO7N0JC8S8UERh2eeFVKpS0uzT+Ji34TKJfW0Php3+Fh2DX3hjJPj?=
 =?us-ascii?Q?KiaRzbSWQeQnvf7SIXoWxtadjx7YWWgEeGhSSKfgN1yJwlxLeBeiLYxLNpdo?=
 =?us-ascii?Q?EE/iiEHTj/BqKVZUFBjqXqC1sJsSSUvreIOj5UJvEpU3EQmHJAxuUeMRPKOI?=
 =?us-ascii?Q?Lh+6KVacDa7XFnBP0gRN42YhISopD3lZHK6WyKGLonDrUijkHFpl27z5cCXZ?=
 =?us-ascii?Q?/ArYdksoflGi78a6mYicvkE6CBNulhp/XjHLE+S4/3uEYxoFQ/A6RIEOx12d?=
 =?us-ascii?Q?Dd68K2Hz7bOugYbmlPG5QflGpP58rgOW3jITUApxGXBAsxA9Q1q1oKH8+Duf?=
 =?us-ascii?Q?UfeawmFNbutbBHdwKeN79XEeyq0rRl7hCwGNPPM57pkMevRE1zHvvjM+FwCp?=
 =?us-ascii?Q?/hd7+g1RdX4b1n2YoDo6uut7WLmc6XAsQGDzkz8zYnzZP2uu5m84wDeOsM0i?=
 =?us-ascii?Q?z9b9iRhB8dqrJGuDDcwkBlPWWlbcDvs8Rh8vUJ6aczXhJLp60nSAG3UJgl4h?=
 =?us-ascii?Q?sJ8OyKvBPIAONddhpj8lGJqUFp7YUOBLG0elFFcYTmvi4KLe5TN3pAEAC96G?=
 =?us-ascii?Q?RdPwRk+BkRufrCZ2TH1t3PD6AV8RttOAPzlMPaXl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa10f094-1321-484a-a09d-08ddafbf1c47
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 05:55:51.1297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HaB+YYVS1EN1mPLUxrhb4hd4stpWFYSa+HKyAHa153XunJMdwbuG47n/Idwxj5lw3n37+qjGKsXVJp+CaTcVug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9962
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On i.MX94, the MQS2 also needs to be configured by SCMI interface, add
sm_index variable in struct fsl_mqs_soc_data to distinguish the MQS1 and
MQS2 on this platform.

Add the system manager indices for i.MX94 in the header file.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 include/linux/firmware/imx/sm.h |  8 ++++++++
 sound/soc/fsl/fsl_mqs.c         | 11 ++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/include/linux/firmware/imx/sm.h b/include/linux/firmware/imx/sm.h
index a8a17eeb7d90..a6220c500f7c 100644
--- a/include/linux/firmware/imx/sm.h
+++ b/include/linux/firmware/imx/sm.h
@@ -18,6 +18,14 @@
 #define SCMI_IMX_CTRL_SAI4_MCLK		4	/* WAKE SAI4 MCLK */
 #define SCMI_IMX_CTRL_SAI5_MCLK		5	/* WAKE SAI5 MCLK */
 
+#define SCMI_IMX94_CTRL_PDM_CLK_SEL	0U	/*!< AON PDM clock sel */
+#define SCMI_IMX94_CTRL_MQS1_SETTINGS	1U	/*!< AON MQS settings */
+#define SCMI_IMX94_CTRL_MQS2_SETTINGS	2U	/*!< WAKE MQS settings */
+#define SCMI_IMX94_CTRL_SAI1_MCLK	3U	/*!< AON SAI1 MCLK */
+#define SCMI_IMX94_CTRL_SAI2_MCLK	4U	/*!< WAKE SAI2 MCLK */
+#define SCMI_IMX94_CTRL_SAI3_MCLK	5U	/*!< WAKE SAI3 MCLK */
+#define SCMI_IMX94_CTRL_SAI4_MCLK	6U	/*!< WAKE SAI4 MCLK */
+
 int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val);
 int scmi_imx_misc_ctrl_set(u32 id, u32 val);
 
diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index e34e5ea98de5..11f2f3792dce 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -39,6 +39,7 @@ enum reg_type {
  * struct fsl_mqs_soc_data - soc specific data
  *
  * @type: control register space type
+ * @sm_index: index from definition in system manager
  * @ctrl_off: control register offset
  * @en_mask: enable bit mask
  * @en_shift: enable bit shift
@@ -51,6 +52,7 @@ enum reg_type {
  */
 struct fsl_mqs_soc_data {
 	enum reg_type type;
+	int  sm_index;
 	int  ctrl_off;
 	int  en_mask;
 	int  en_shift;
@@ -82,7 +84,7 @@ static int fsl_mqs_sm_read(void *context, unsigned int reg, unsigned int *val)
 
 	if (IS_ENABLED(CONFIG_IMX_SCMI_MISC_DRV) &&
 	    mqs_priv->soc->ctrl_off == reg)
-		return scmi_imx_misc_ctrl_get(SCMI_IMX_CTRL_MQS1_SETTINGS, &num, val);
+		return scmi_imx_misc_ctrl_get(mqs_priv->soc->sm_index, &num, val);
 
 	return -EINVAL;
 };
@@ -93,7 +95,7 @@ static int fsl_mqs_sm_write(void *context, unsigned int reg, unsigned int val)
 
 	if (IS_ENABLED(CONFIG_IMX_SCMI_MISC_DRV) &&
 	    mqs_priv->soc->ctrl_off == reg)
-		return scmi_imx_misc_ctrl_set(SCMI_IMX_CTRL_MQS1_SETTINGS, val);
+		return scmi_imx_misc_ctrl_set(mqs_priv->soc->sm_index, val);
 
 	return -EINVAL;
 };
@@ -386,6 +388,7 @@ static const struct fsl_mqs_soc_data fsl_mqs_imx93_data = {
 
 static const struct fsl_mqs_soc_data fsl_mqs_imx95_aon_data = {
 	.type = TYPE_REG_SM,
+	.sm_index = SCMI_IMX_CTRL_MQS1_SETTINGS,
 	.ctrl_off = 0x88,
 	.en_mask  = BIT(1),
 	.en_shift = 1,
@@ -412,6 +415,7 @@ static const struct fsl_mqs_soc_data fsl_mqs_imx95_netc_data = {
 
 static const struct fsl_mqs_soc_data fsl_mqs_imx943_aon_data = {
 	.type = TYPE_REG_SM,
+	.sm_index = SCMI_IMX94_CTRL_MQS1_SETTINGS,
 	.ctrl_off = 0x88,
 	.en_mask  = BIT(1),
 	.en_shift = 1,
@@ -424,7 +428,8 @@ static const struct fsl_mqs_soc_data fsl_mqs_imx943_aon_data = {
 };
 
 static const struct fsl_mqs_soc_data fsl_mqs_imx943_wakeup_data = {
-	.type = TYPE_REG_GPR,
+	.type = TYPE_REG_SM,
+	.sm_index = SCMI_IMX94_CTRL_MQS2_SETTINGS,
 	.ctrl_off = 0x10,
 	.en_mask  = BIT(1),
 	.en_shift = 1,
-- 
2.34.1


