Return-Path: <linuxppc-dev+bounces-7147-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2629A65434
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 15:49:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGdCW0w5Dz2yqg;
	Tue, 18 Mar 2025 01:49:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::4" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742222951;
	cv=pass; b=HeE5JTSV9Kx9oYAB835OOFkGJKsGjLMlFGnzPNJGDIU338CMA2G7tSAtDtf1wcV+8kX7y7qR8yvYkRVDRePK1lr2WS08UAhddhqTa9KtR4XBgbfhFObWzsHk6wqB/Mt9b7Sd16omb6KwHARF1bnIeRyO20AinfD4g/hCYdFGDbsfLQwp3H27GVWoUtxp1i+ymmI6PrGSdRZm+s3ff29qIiAsuAp9fyvsorLISNZSF58kiw/0Ff5h6E9XdgRVKjAKAGByHZJSWoELgRm4QGsycZ9kg51DRcqt0c7uWsxAcgB8gR/ZaJ5sZhTj0Ec7YK36BYBr7Tv1ngYfhqT/Kkz76g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742222951; c=relaxed/relaxed;
	bh=kVGYg1Op/a0GV1T1ULU8Vge6xxXF/AbXXXgUYScOq7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UX/eQ/RmSHbs7OzV8aEdyE7KAsuAtoM740Lq6pqcy1WvirAEGsSy5lAowMf7ZZ2Xu6t4Rgc0lHUVDSwBL01MM5Gt5HV1SUE/+gjRQy9EC5JtHUHREu915YplW9mlPGVmAu38vNkpPsGsd7zijrhfd7lvStacy3/H0S5Wgontls2gcu8srAROkzGNZup3ax+DPA7SpLHcDQ4w5ayyVbUc6t7HS3AX8OqzRZli8bdpm+CosrNky3waJvG6ZXfu9FIHLp2APcu+oL9oLBoJUZUewSSWrIzbMaFAEAcsulzmbKaBcElf2ke5I+boJNPoCSl+7Z1ZtZXtC7ilmUBkPwKNrw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=frIrh6lK; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=frIrh6lK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170130004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGdCV0pgVz2yqc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 01:49:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ko3NYBx8nBpmS7T5HuVlLf5AZBt4TotUvRrBH/Fwf3id07+SuF2XFkduszx+sVXDJkfEeOFaNOZHwa3Kz7BzNtpIekaPW7oM+PmlA03wggJOJsXR97aFPWegWHi7dVIRO+LYcrTjHPLY/6Ri8UNnkRoc9C35ue95SZHN7dN80k0EUTJdd681jhei3mmH1/shHwGX8iHz8KtmSKySykOTSEuqdlSOmlSz5W1LKRxPC8utLXzpk5jUko9k579bAm9UPKMRAAFyfpNRnD8ui8vxT+YxssHg5Gi3C70dmOP4L4TLLd5c2CMd9duj2qXUIpIP+furJ9fVSGAuX+GDcORYUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVGYg1Op/a0GV1T1ULU8Vge6xxXF/AbXXXgUYScOq7Y=;
 b=YdP0wXHa2wSKoR8EoZq5vb5WEV9FP/0dwSgn+EGBPJU/JNFwmUog6pJ48W7DxD1r9DYmWZkC7zwZnyxMR8bfjNb4Mh1MymSqjIoooPD9ymXPtkFZwnrtKAgUufgWBBgs3OeEKsNZTLeCPVT8bxFrBALM++WtiIz3MZ3CFR55vlVIwj0tRVDB34+YO+XZogN8Q2G9HR6CPHrWXs4lVSgHt8YZaryOt7sT6+kUoJh608PqBcoUZK+BJ8XnjR75GL0U+oB+U/MM2rTuUeZ6cNIi/ixmkGWkJoex3LasmbbiDya3CX2S0ECEGbI+2dptDH975oj4A6AZtN0PVRaOP5FGKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVGYg1Op/a0GV1T1ULU8Vge6xxXF/AbXXXgUYScOq7Y=;
 b=frIrh6lKhP4TZB5kf09uLACvolm337YGmfksz9OF3ZSyDUI8wS33gc5IlXccX5ypl5HarSqbS9hZma/bu4TwOlSiBDrNuNzto4/8kRyJVhXK8xz9W/idioScdjj1Ie4e4glj66vnkYtd79Q1baaTPnDubiSmjfdSLz8wq1o1hVccZNT77rjP+ND6edBD+NHRJne1KWbTZG4OsnZR9Vgetpfip8OUpxuHHgl1ZwAwB6RgHqK6ZcFA9Aoj7pjq+pMYzuVTRPI4ddnyH+eQiZNBbzfcGcIKwMeOH+zWBbMNlSdi1CFSJliFlnX9BwQhOXKf8cEt2vwfS8GaBcTrH3g8Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DU0PR04MB9635.eurprd04.prod.outlook.com (2603:10a6:10:31f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 14:48:46 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 14:48:46 +0000
Date: Mon, 17 Mar 2025 16:48:43 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 net-next 05/14] net: enetc: add debugfs interface to
 dump MAC filter
Message-ID: <20250317144843.wp432pgodn4vjejf@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-6-wei.fang@nxp.com>
 <20250311053830.1516523-6-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311053830.1516523-6-wei.fang@nxp.com>
 <20250311053830.1516523-6-wei.fang@nxp.com>
X-ClientProxiedBy: VI1PR0102CA0088.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::29) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DU0PR04MB9635:EE_
X-MS-Office365-Filtering-Correlation-Id: 37714767-1403-469d-be59-08dd6562d21b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BzEUanxrLUGrWqmpA64U09MV85u2Tb5bAsHOdKnpPpUF6dzMP3uH649r44Tk?=
 =?us-ascii?Q?SI7CThM0+uBM7JdvJ0rQE/9lPHtON1ZHfOdXeb+2Rwa60k2t1RVOAIm4UfnX?=
 =?us-ascii?Q?HsU39xS1hgEYK69Jle/+NMln56APR3jRv3Hn30jk184sdERN+SpZTsj+d1/w?=
 =?us-ascii?Q?T+zFKXDgZcQ2cDAlNatsrXQhp2dk0XnP9k0w+ryHU7gB3haIKfdOzus6aosn?=
 =?us-ascii?Q?NF29ma7t5EoAgWr3jNzAQ+EjbAKMjFhVqz3STXHwx5t9Qh3Q/3bPqCxJLSKI?=
 =?us-ascii?Q?GOcTyhtE5/FmpetuWpXEkOGOdytoApLP3ggnmOyzJnjgLwplRNrd7CG1t7Yw?=
 =?us-ascii?Q?HqpvscPA0rCX8TmB3fma+qqoRMELDgP5b4iNvFAIAjDtBofpl+Lvu0HrGcBz?=
 =?us-ascii?Q?FhAoDtXGwG4AJVYSlQjpaAPIKrMgfM9ZRz5nUuzUr0XP7ejdewlMrcP/IyLU?=
 =?us-ascii?Q?MN4mMAUTVU40ExVS7GPbMRg6QwIzVx6x13B77KtWBBeZ3Ytadh1lNWMbIn2f?=
 =?us-ascii?Q?TrjJ2hJb6PQtEvsw+yrxBh1cIsN79Fwg+dlbHJpbnKXUUHzYOgbZsN7u+2cO?=
 =?us-ascii?Q?IxkRVqrjqnDbY3mkNcxoY/hTXA621AHpASG2xtNlTzbQrxyIiNzho96ni0Nz?=
 =?us-ascii?Q?2cj/ZhVl5YvegCEV4DSqsWDHbh7H/hR5eds1s0Q/j1Ys2gaj4ToPkxkvuHxo?=
 =?us-ascii?Q?FkekCWMjkIALotfO3q+bUUvzwp1BGeTwrNh1S1IpVTPMY51TnOLJ6HPQQTPw?=
 =?us-ascii?Q?T7IZG+QmwFNgdYfszny+IsyR5JrEXlgVi+ZIvwlsyUPTLnIyXsX+oVfhvuWp?=
 =?us-ascii?Q?XPgeGg6EiPJZssMMw8hWlnKW/prUFmDBAOrDEuJa6CS7qzX1O8xxJ2CAQByV?=
 =?us-ascii?Q?/SA/UTOAdYa0N60p/gvzv6Xux4iMS+x7Dgpz757PSvVXKy7ISEDQJ8P1DaBm?=
 =?us-ascii?Q?b1WQQn8OxH6Xl1Dt9s2NPciFIXjoDzwHnFdrH4rYFkMkkcm6Lv/LaycXFByi?=
 =?us-ascii?Q?4y8DvrOR/BwTYokR2lGODxD+J4c7FTYWFEJwzfJZRMkS2MitlinSCJZ2/mK5?=
 =?us-ascii?Q?SI80o25m7xmGoEs8FtjTWOmWHeH8VufEqqT3eyOMM9E787V1TUg/6+AyAoel?=
 =?us-ascii?Q?aYQjBKkZxyqnsjvaHJ951kDHljhEmnvrH2xjuyL9S8UEzhH1jIK8B6fPBZ7l?=
 =?us-ascii?Q?iCvRUU1ihxDMVefUB6dtgKktpRoEU80jdJ3Y41/YV5V9UoJFaSvJ9b1Hv79O?=
 =?us-ascii?Q?iJMU7JNPhmAqFZ6UlhAzt9SbjUdqYJVCzlqV6UUM5gt8rfLIPXN6fQTwTHLJ?=
 =?us-ascii?Q?FJKLiVLu01+i52NSqXKhHMXtpAz3oqop0DKOA3Vb8fgIqeb0BrwyPSXUgdLv?=
 =?us-ascii?Q?lx5uaupKrWA7sfA2YEm4MisRHMxr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rM+cOxyWFoDcAOl4dGtYJMkzo0hN28khplRPdxpy+WU4+VoqbAkHTsCyWZwg?=
 =?us-ascii?Q?pMj1eX7eXzOfpZtL5jGHCpPfPAKgW5IIIUdw4ULiR0IIjTK9K5aWdwN/hgRa?=
 =?us-ascii?Q?o5PvbilFdBQNHx5b1RsgjZX6TgluTh+R1f05wftYFMTkmIl5q5NnyR6Gthtu?=
 =?us-ascii?Q?VUd+FKp46FU4zzTrVRUtDTc1g1q8GttnD2wwpqCz7V/HPTSaR259Ih54tdBd?=
 =?us-ascii?Q?QhxPHt5xVEP4eMM+8OTNBbkGjgxD1tdnrteE/W+b2x0j/pj7L2PGKCBXHYf7?=
 =?us-ascii?Q?pGqSxuFMLO4f0mGb10us6gR0PGbSB/axzOj+z0xX0ClLSahcJj2yGSacWLrR?=
 =?us-ascii?Q?dc7tJlhO31X+Hjzcpn2HXgUd8LfbUUt++TMeBXNnIgO5fEJ0qSN5tdnt/TFE?=
 =?us-ascii?Q?uo7bL+zSS81e8LP3zX7K/A4WuU3JM32J69f22iyxMIZnHgUCV24Hog0OnPK+?=
 =?us-ascii?Q?C95Sr6AidkHRWNA9b6dIQwGil5ghvBcKbZctPNE6h1I+uRaX6GM1bMX3FZNO?=
 =?us-ascii?Q?YcHbTHt2BRtc91YCmLHheOz78CJewSm5wszawhVnixGZcC4hTCWkEC04foiI?=
 =?us-ascii?Q?P7Lx6/gPJ5O7RMiJHcqqszBv+iVJH5NHhnDxTPttzqhMiecfN47Ua3kJvaMV?=
 =?us-ascii?Q?XpaVC5Nn3UpbfC24/ZwPLhcV7wN/x9FJHp1P4IZLC3Ad878HFI8ybOxAU8jY?=
 =?us-ascii?Q?OG7AhVjgrjviDwYCGhtTDzo2M0wU9qXiCsKMLmMbjJH5m3iyr2PpMYd3LvR6?=
 =?us-ascii?Q?TfzQ2qitISH85Kqt/rRaUUgeTGnFfjXIz7Vc3bkh0x9eLmUYK655nQYxr6D8?=
 =?us-ascii?Q?qAgHHUbdoq2qjfMCXHlQ6S7NXItwJbGU4yXtwxSqY7jsj38xWlu/SY5Pg5+u?=
 =?us-ascii?Q?GCbuZgLOo/MvgyubqtgNsCLr+pv1e2OgFyCl0BOPi6QFRF10alz92/z/qx0V?=
 =?us-ascii?Q?S71RuyRyVHzQW71Hg3dJuxvrXERqZ32jqYbY0uUu6MBBQnM/L6nowTDmtj9W?=
 =?us-ascii?Q?2ynQ7f2ulMmxRWFNz2CUnSXbqsJYNd/dPhY3xIRhjIdXNg6STyZntSu541MS?=
 =?us-ascii?Q?gKfzNxRZVfCEhEtj//cNNHYxJblNeZ6F1v5waWBYtoyW9WvSJMi4I1sHjG1B?=
 =?us-ascii?Q?/h5AszFGbbUvYVV9vv4dcGNh8Dcz7xo82yNE4PO51velvRKRGYZewfFwgR/9?=
 =?us-ascii?Q?mOxQ4j6759LO0fFIsnf38jOWEV3YbY5oT2z5bG2BHZgNv6JTlDS4mchURM0F?=
 =?us-ascii?Q?SwwV4FfB98pjHEJr54++bfQw1Gal7mqKQp5gp4iLeoK4iTXmzzGChH9nvU6U?=
 =?us-ascii?Q?eF1GHonqmJKV4FtgRK/mJ4iCgJRbfbM4cd3dl2mDmdRSrAUZnXN54xoCV0Id?=
 =?us-ascii?Q?XqUeFqZCbyIVCZf9eUgAnC5jDuL4EsMeVMLVuVh+Fe35B7EL7M67j2Uf3Pzu?=
 =?us-ascii?Q?ImgC0bEOSICzFuwCHRb4q5hz/rCDQA3iBaqOYnwUsJS+Dr6sBtuc7TO1UX46?=
 =?us-ascii?Q?bpbJZaQNfMVWMQQ1MP//zj6TbtcmWloF9vBxMu79Xcfk09//c1fvVwYV82wM?=
 =?us-ascii?Q?fs4ccuzjlrQ+cdTTtd9M4taeRRtI/mdhHoO30rr9nh2+Ip2De19mbtChvFF3?=
 =?us-ascii?Q?ew=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37714767-1403-469d-be59-08dd6562d21b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 14:48:46.4312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGPteDPfowMybgEd8UFakXdOlIcjbI2NoKotwB8FAXAEBiaAInwog9jE7LQXIM495VcobxQggUijBy13oWC67w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9635
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Mar 11, 2025 at 01:38:21PM +0800, Wei Fang wrote:
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
> new file mode 100644
> index 000000000000..3a660c80344a
> --- /dev/null
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
> @@ -0,0 +1,93 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Copyright 2025 NXP */
> +
> +#include <linux/device.h>
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
> +
> +#include "enetc_pf.h"
> +#include "enetc4_debugfs.h"
> +
> +#define is_en(x)	(x) ? "Enabled" : "Disabled"

str_enabled_disabled()

> +
> +static void enetc_show_si_mac_hash_filter(struct seq_file *s, int i)
> +{
> +	struct enetc_si *si = s->private;
> +	struct enetc_hw *hw = &si->hw;
> +	u32 hash_h, hash_l;
> +
> +	hash_l = enetc_port_rd(hw, ENETC4_PSIUMHFR0(i));
> +	hash_h = enetc_port_rd(hw, ENETC4_PSIUMHFR1(i));
> +	seq_printf(s, "SI %d unicast MAC hash filter: 0x%08x%08x\n",
> +		   i, hash_h, hash_l);

Maybe the ":" separator between the high and low 32 bits is clearer than "x".

> +
> +	hash_l = enetc_port_rd(hw, ENETC4_PSIMMHFR0(i));
> +	hash_h = enetc_port_rd(hw, ENETC4_PSIMMHFR1(i));
> +	seq_printf(s, "SI %d multicast MAC hash filter: 0x%08x%08x\n",
> +		   i, hash_h, hash_l);
> +}
> +
> +static int enetc_mac_filter_show(struct seq_file *s, void *data)
> +{
> +	struct maft_entry_data maft_data;
> +	struct enetc_si *si = s->private;
> +	struct enetc_hw *hw = &si->hw;
> +	struct maft_keye_data *keye;
> +	struct enetc_pf *pf;
> +	int i, err, num_si;
> +	u32 val;
> +
> +	pf = enetc_si_priv(si);
> +	num_si = pf->caps.num_vsi + 1;
> +
> +	val = enetc_port_rd(hw, ENETC4_PSIPMMR);
> +	for (i = 0; i < num_si; i++) {
> +		seq_printf(s, "SI %d Unicast Promiscuous mode: %s\n",
> +			   i, is_en(PSIPMMR_SI_MAC_UP(i) & val));
> +		seq_printf(s, "SI %d Multicast Promiscuous mode: %s\n",
> +			   i, is_en(PSIPMMR_SI_MAC_MP(i) & val));
> +	}
> +
> +	/* MAC hash filter table */
> +	for (i = 0; i < num_si; i++)
> +		enetc_show_si_mac_hash_filter(s, i);
> +
> +	if (!pf->num_mfe)
> +		return 0;
> +
> +	/* MAC address filter table */
> +	seq_puts(s, "Show MAC address filter table\n");

The word "show" seems superfluous.

> +	for (i = 0; i < pf->num_mfe; i++) {
> +		memset(&maft_data, 0, sizeof(maft_data));
> +		err = ntmp_maft_query_entry(&si->ntmp.cbdrs, i, &maft_data);
> +		if (err)
> +			return err;
> +
> +		keye = &maft_data.keye;
> +		seq_printf(s, "Entry %d, MAC: %pM, SI bitmap: 0x%04x\n", i,
> +			   keye->mac_addr, le16_to_cpu(maft_data.cfge.si_bitmap));
> +	}
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(enetc_mac_filter);

