Return-Path: <linuxppc-dev+bounces-8091-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C176A9EEC0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 13:17:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmLWB5fSjz2yrq;
	Mon, 28 Apr 2025 21:16:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::60d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745839014;
	cv=pass; b=YU0Gzlug+Zy68+hntYs8aItpyF/nZLuwipA47sYA0buLwyikhk91masTG3rUJjRQLeDIzI5taiEUXaCGp1GO6GVryGyUTGkZg5eldY3y4WyYWz/jfwTs04UXVMBr0OClhdUKn8XsSb9RhlcRw46UjP8DKRX0ZilVy86jWv82kLoYyEZ+q5apzM+2QVNhsWt8c41wvGXD/jv6i00StnT4BdgFQcgaw9mnnLRs2S2kCHLR1HkObterKOEOMIQ0vKFvjXYCd9QD6nFddqtuITQz8889x7gN3WcFU/iXhvloVjfu9KHp6g1U50BZdVf39Vdnxeh4fIXadDiseiz13v+Pdg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745839014; c=relaxed/relaxed;
	bh=/MfgeAtfubDl/ib4NuLWGFCpGo1GPHD47LK921zX8wk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GGpYb+FuIBzQRq1QR26AbdwLFZgmLEb7kUvt1iKvAYZj3001vGYL2R45ab0EuKflyg36W75oVIus0Zne9zH2sVYow8oJKjbSK/HUcsV1ylUa4A71Ud6L9IvsHJse3ly4e52We9wYrnnwiOGmGe8RlhSwEm2pALsjQz6Q6GGXGXxUiu4PpionMJd28CzssJ2d3brsLPkWg1lCpui0sIdOOZVNmiYAbBA/G/JyOxt813leyOT3bK4e6Tsd2Xk7KfNAOQUw154rri1H08xyrG+hYb1ScDDYnT7RkBbbzkXGvFuuz0duqCcYMHuHe5y+yjYoM159XH+DswDEsgahv+wtMA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=gwuLzHmy; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::60d; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=gwuLzHmy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::60d; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::60d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmLW95Wx7z2xd5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 21:16:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSSpI9iz/Get6Z9KVV7SfAapOLNvGG/qLCFinJvGzbTfxq8cMtt7T5WIpkf0SXcUY7SMjfJtuzxKP7gz1x203QfvbkBqVj49bJEb3B5EbEXQ1O6fG2qrgCoRU7V7Dr+Cd+w3HiGHQE8gnH0CTZIppBQb+4ULyyEIe8gHwGsJ5De6VvN+SW4r4P5msvE3i89X6E0JjD2C+ABrZ04MZm6sKHOu3B1RF5I+ivW4LUfiLKX3tX/dnhDEJZDU/6MGpLma+iGwP7nkGQI3eLn6KplHxP8JD5VKAoiHOHktT95PAhbBVdW7UaHxdcwmhAvi6CpSqHF/aA/m01Ytw7+YFpbTDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MfgeAtfubDl/ib4NuLWGFCpGo1GPHD47LK921zX8wk=;
 b=fcxZEaXE+rDRpECdNOVcLJixx/uKaClLq/SmOh5lwwNQNpEGXeItCqyQMKrmlmjHbMgpe9j7zjpkUf6+dAFV3MzPVySDRQSykhAehASUDEQz1161PibkWvEYg3bGZUGpzdLFbYilB7kp8RvQnBAFttxhPFquy0/PCMmUOnL1BE1VamrUTB9LHWO2Xg8dH7HVhzDXXTS91cMK87Qe/0MTadu939Kh+h5CshBohM1c0cXT3IlUPyU2C6PTuSopngHsNzb+m6Je3P5rUBdpSsrb+iyZh/7QlrF1satdEyJoescc5m5Nh7CzvJQ7he8vSqwKygieZIdvsq+OAlRwt/HCcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MfgeAtfubDl/ib4NuLWGFCpGo1GPHD47LK921zX8wk=;
 b=gwuLzHmy+V3hPH23FiwHYBafxlKZqkawJutfJ11715MtxibboFPZj011goEvCcYo07PkN0L2yXjQshRJFYO05y9+G/VkZrqHn+imxFYXAy3SXUoUAtSjMWq8NGyd7+7bRVz6wzIntyAG5QxCA4W/YNcj1H79c3xTeeV726VmL1RAQ4mnHZXF+R67CcpypMeuSaZUEDxdymMjZr4m9+dOzEnCYt7TmNflAUY/Zi4Kk10EUY+RTKOrWVk0X/mTvC9vHNQQXH6JPvJrBHSE3huIRqt2/uj6Dv0QJF19gkt65GsSlXU7c6KyYwLzVI5L9bmTXBjGlEmVD6lyQLIH1X9c/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PAXPR04MB8624.eurprd04.prod.outlook.com (2603:10a6:102:21b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 11:16:35 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8678.025; Mon, 28 Apr 2025
 11:16:35 +0000
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
Subject: [PATCH v6 net-next 08/14] net: enetc: add RSS support for i.MX95 ENETC PF
Date: Mon, 28 Apr 2025 18:56:51 +0800
Message-Id: <20250428105657.3283130-9-wei.fang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: a2ab205f-b0d7-4759-17cf-08dd864622c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2Tdo1rr4YSV8u4KHgUxJ6Q70zuh5LoThFbQja3xkzv7n0IFPB9kbgnGkKGFD?=
 =?us-ascii?Q?h1y7BHnDozYToPSIhWAaPWKCbGbxZbyPBP0k4a8C3epw64k69y5ncFSKsgBH?=
 =?us-ascii?Q?4JyHw4CfcwasC6IhJ5xZV99Gq79+x6vgOzjtAF9u3RAXFNTlDdJtVV8bh2cG?=
 =?us-ascii?Q?TRikYgelMDy+bCEJupXnpgjWhU/cO13oy69B6Ncbl3SU9Xz6nat7hfZZhwzK?=
 =?us-ascii?Q?c/gecnUQc6gJ9HpeiXLDI9G3AwpkKf4GwcOJrXNrf3yRTWW+6r1tAuOm8ecl?=
 =?us-ascii?Q?7JmzdeBWsA9mWYfbkPXgauuoTCo3K0ZfP/f1jEmGWZBgjHHRazo51Bf1XQwk?=
 =?us-ascii?Q?veWdQh6Pldt6gE6XasCgUXhprFfkoip7DmPgDXkCOpk70wkxsRxtjOuP3jDS?=
 =?us-ascii?Q?dW/WXgP6ImRGtLbteOYbJ/0vyAgJk6zhADD/TmKkJAVW5dRLfAXe0I/gYbM8?=
 =?us-ascii?Q?rVAdf5dJU99lVG1TQs71emzaKHXZ5QRqSj5bwUsHkmV48ZeCbrPofQoWTX+K?=
 =?us-ascii?Q?Jsa+aXs64JTmvgu61kpOo2EO3yP1XPBUNNPIXEmTwamwweLbAFu6y6yyNitq?=
 =?us-ascii?Q?XJm36mcoOgzc0h6a8egIXXrUv5Mra5pDKLmAU2pHkVL+jWm60MwawNyrwnh4?=
 =?us-ascii?Q?2vbv2M0KzfBPWzNC7fY4s79g8R6SOvJfENQe2sXfGQt1REVS4HPeLaWxQ2gX?=
 =?us-ascii?Q?hreuWsF+eJexklX8m/mQGBt0EFCgWQDz3Ox/dvNO7HEgopfQUOBPMd6nGlkh?=
 =?us-ascii?Q?qc+dtYQDanmwtnjRHjpuS2D5Tv/7cZbMw9bUOk2ALO4Ch92k3wsiXzw5iej6?=
 =?us-ascii?Q?PEv9HkZ7jIFl1gyW54/4Og98gmh1z52ua3ROArRoNckDXCurFQK/ctNUfjih?=
 =?us-ascii?Q?mrU0U9bUuJhsBCLBJU/Pr3oNwNwkX4xE3PnE1HR7t+XFKY/bEjd4UWv5DzdH?=
 =?us-ascii?Q?ztRDKAqq0UuhUVcAJb2spoUyw2FnG/q/IjLcHbpcRfHCPz25pahXBB98lU3V?=
 =?us-ascii?Q?/UOkIff5p2kUOOVBEzrjIsNyeR4tst1/cuw+2SMCXDVsbdg1Yh+NO9s730gz?=
 =?us-ascii?Q?VkOwfEHJacKjuBC+x9lSHCsgQTdPlLp0C4UEzu8UtDsb+snSubVCS0fgyiqT?=
 =?us-ascii?Q?4LV1SK4SZDIVxHTejh3u6QEr0uChlmN/1l1GU46MhLMpfomUBAmL+d4EMReX?=
 =?us-ascii?Q?afCILksdXPph5UaJU5QMZeC3UtTyMQ5UMu5jV+lneZQwlaSqNrJE/mYFdhip?=
 =?us-ascii?Q?8N7I1jaUlUVW+SNjc3w0SURJ+UGp44e9Y4huZiGGhxhTnH9L3kDvpQeM4NlO?=
 =?us-ascii?Q?9L2spisHzEXvcGvmZyeP8+4ftiwb/O2wNSsmUNLCpcLyXAlkURp3N2Q45445?=
 =?us-ascii?Q?wMYA4PbATYgDE7Pb6OjXCR1jBTpPfFdx10MEPiZbf+8c8tUsYDA6eqxp5256?=
 =?us-ascii?Q?MuVHP733xFV5cDlup97DY1mX9vc4arSTtRyPd8aYdabJtLXsyhxzKQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WRMzeMNUsgYjqqiSMCyrcos+g7IIHr46X+cbUyoGKZH72dD7rf/+aOs/LHPQ?=
 =?us-ascii?Q?O4qDW1krx4IzKZ4tvfmXrD64gvTXWXAKu1AeXdyqngArZojcsaAhzI+gfG8J?=
 =?us-ascii?Q?ZMvb3FtjPsXHFWcygrL/dPb9R8j6JoC7fHC6MQrs/LXd5E/01uX07Gzn70O1?=
 =?us-ascii?Q?kVtZ6wYj1R0ykefr/Y6QZuj8kcnN4X3t3xuVzzCvR3iDB+ogbuXXyFV+uVmO?=
 =?us-ascii?Q?o6ylltIT9/8z/0DKh0w6mZugrWPdjTfa+HLf2fIdyIhhOV7Gq6LSltbHOL6R?=
 =?us-ascii?Q?S9eDbWMDewbQszAjcDZ0jZKg1MKqpWcmYF/AlgwHWzYdQ/t6ctB/HbTcc780?=
 =?us-ascii?Q?jc7pj/F/Ri49odmbP53WJh1UJfqKD+Z4SqGTrqNL26qCsCJkWqp0qurMdf5z?=
 =?us-ascii?Q?YuOg3bvQ9xCJaK0XUWPpwZZalWu6R/VWTwAOeixChHPdggptDie6j4L6BUgH?=
 =?us-ascii?Q?/W4XLXzMgq8NYg8F1tGr/NdfaVv0OdosU40UYdsWy1cq9P4dQKec3HzA4w2H?=
 =?us-ascii?Q?3UJSmOIYIk2hf5C+jq8kVBTEvVy0+qHIk4AjfQQ9HLh0T5bVUon8BFo2u1sU?=
 =?us-ascii?Q?aAqps0jCpkBCz2xeMdfx+WG18d6cESk3kFd12ecqribfMgXL9ugGjXoj1gu8?=
 =?us-ascii?Q?qnXJjQSS6YIa2dDHBuEX318bYmhnaS7ZGCLe4ZgxRw0EpQgxOmbvXTfQIK0k?=
 =?us-ascii?Q?ES383c6DiToykHHuZBFlQsh/8APvLKY6kBg9NYaj9Lv5NfdAtO+f8JUuQejS?=
 =?us-ascii?Q?+8uGO3PueJ4rPDYwMINo4WzAPp5p65KC8XedC2g9U2XyDz8SKCt9gPLzmG53?=
 =?us-ascii?Q?XYXn4QNym8MB9tvXJTzC1QukJgIiku2FMoy6h7JKwo+mR/nM1qzY2zzVZX/3?=
 =?us-ascii?Q?6Y5X7HbqZJix2Or4nsSP8hhUCPTow0/7vmkfSuTFpSg8Jf1zI7ymJ4LG0kVN?=
 =?us-ascii?Q?wOpWXatm1tNYA1JFo7QA36OjtqsMEc5cYAx0Klk0QEeTwLi8Dg8ZX2WttUCY?=
 =?us-ascii?Q?72FyuQopS+g3uJj+BIcvj9ICMk7DfABFkmeJC19a20UN2OadAl+/uNxwZsWZ?=
 =?us-ascii?Q?UYBs8912s5BKSTLoWnZe4cH/Mb0pUF/57KBKC8SiQl5beB+wzvuQwCOir5HX?=
 =?us-ascii?Q?aM3KiWuEcZFFdEBvbwC7VArVOMUU+PCiUms0duZl00ltz2O1H3VnfkcjgWqA?=
 =?us-ascii?Q?x5zTt2jILjL6pztYL0aLHE5Nq+1kpXf+T785X1JbWJONPs3T22S2mYMpn3Zu?=
 =?us-ascii?Q?3ICsU5rRwUqmskoz+60wEhvpfcJWZ77c8XdzcM8wrEGBO4o8zNahaceY/ETL?=
 =?us-ascii?Q?p2OQvRi1zXQhLqO+HBcTQDH8XvrU+cuplWkcA6s6D5XD+QU2Wk4PlLxEh2Hr?=
 =?us-ascii?Q?3fkqJo6tLfVsKrDiIdxbNAELc9VN/NJ9dt6gcaTuxI/YHxcbGMHnfLUYs8YM?=
 =?us-ascii?Q?Ows+jsFRCymN8qK9tNWxxlRa+PNN4dzTerLF49n1VIW9F4eyHoyuU8Sy6uAh?=
 =?us-ascii?Q?RqNEpgasyOOaBwwMFgpFo4Yyhn9bEV6/7G8HvdGMXFrZ4QKEU2KAcHORI28f?=
 =?us-ascii?Q?5f4OEYwxVHBR+o+KnWHasHFfxTDks/WyBN40K0zx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ab205f-b0d7-4759-17cf-08dd864622c1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 11:16:35.0984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKad7jJApBxOkJYn9aMrHOdcps5CyFODqjtHUFjtYAOtEgZyuHFzMkd8/CiGdas4BRG99GPUTNh4NqYnho75Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Compared with LS1028A, there are two main differences: first, i.MX95
ENETC uses NTMP 2.0 to manage the RSS table, and second, the offset
of the RSS Key registers is different. Some modifications have been
made in the previous patches based on these differences to ensure that
the relevant interfaces are compatible with i.MX95. So it's time to
add RSS support to i.MX95 ENETC PF.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v5 changes:
1. Add comments for enetc4_get_rxnfc()
2. Modify enetc4_set_rss_table() and enetc4_get_rss_table()
v6: no changes
---
 drivers/net/ethernet/freescale/enetc/enetc.c  |  5 +-
 drivers/net/ethernet/freescale/enetc/enetc.h  |  2 +
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 15 ++++++
 .../net/ethernet/freescale/enetc/enetc_cbdr.c | 12 +++++
 .../ethernet/freescale/enetc/enetc_ethtool.c  | 47 ++++++++++++++++---
 .../freescale/enetc/enetc_pf_common.c         |  6 +--
 6 files changed, 74 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 494f8f77bf4c..08762772c045 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -2446,10 +2446,7 @@ int enetc_configure_si(struct enetc_ndev_priv *priv)
 	if (si->hw_features & ENETC_SI_F_LSO)
 		enetc_set_lso_flags_mask(hw);
 
-	/* TODO: RSS support for i.MX95 will be supported later, and the
-	 * is_enetc_rev1() condition will be removed
-	 */
-	if (si->num_rss && is_enetc_rev1(si)) {
+	if (si->num_rss) {
 		err = enetc_setup_default_rss_table(si, priv->num_rx_rings);
 		if (err)
 			return err;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index e49c1626e7e5..7b24f1a5969a 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -541,6 +541,8 @@ void enetc_set_rss_key(struct enetc_si *si, const u8 *bytes);
 int enetc_get_rss_table(struct enetc_si *si, u32 *table, int count);
 int enetc_set_rss_table(struct enetc_si *si, const u32 *table, int count);
 int enetc_send_cmd(struct enetc_si *si, struct enetc_cbd *cbd);
+int enetc4_get_rss_table(struct enetc_si *si, u32 *table, int count);
+int enetc4_set_rss_table(struct enetc_si *si, const u32 *table, int count);
 
 static inline void *enetc_cbd_alloc_data_mem(struct enetc_si *si,
 					     struct enetc_cbd *cbd,
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index d2a414c28c21..2d890f7bcc95 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -523,6 +523,14 @@ static void enetc4_pf_set_rx_mode(struct net_device *ndev)
 	queue_work(si->workqueue, &si->rx_mode_task);
 }
 
+static int enetc4_pf_set_features(struct net_device *ndev,
+				  netdev_features_t features)
+{
+	enetc_set_features(ndev, features);
+
+	return 0;
+}
+
 static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_open		= enetc_open,
 	.ndo_stop		= enetc_close,
@@ -530,6 +538,7 @@ static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_get_stats		= enetc_get_stats,
 	.ndo_set_mac_address	= enetc_pf_set_mac_addr,
 	.ndo_set_rx_mode	= enetc4_pf_set_rx_mode,
+	.ndo_set_features	= enetc4_pf_set_features,
 };
 
 static struct phylink_pcs *
@@ -957,6 +966,11 @@ static void enetc4_pf_netdev_destroy(struct enetc_si *si)
 	free_netdev(ndev);
 }
 
+static const struct enetc_si_ops enetc4_psi_ops = {
+	.get_rss_table = enetc4_get_rss_table,
+	.set_rss_table = enetc4_set_rss_table,
+};
+
 static int enetc4_pf_probe(struct pci_dev *pdev,
 			   const struct pci_device_id *ent)
 {
@@ -981,6 +995,7 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 				     "Couldn't map PF only space\n");
 
 	si->revision = enetc_get_ip_revision(&si->hw);
+	si->ops = &enetc4_psi_ops;
 	err = enetc_get_driver_data(si);
 	if (err)
 		return dev_err_probe(dev, err,
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
index 71e4da530028..3d5f31879d5c 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
@@ -294,3 +294,15 @@ int enetc_set_rss_table(struct enetc_si *si, const u32 *table, int count)
 	return enetc_cmd_rss_table(si, (u32 *)table, count, false);
 }
 EXPORT_SYMBOL_GPL(enetc_set_rss_table);
+
+int enetc4_get_rss_table(struct enetc_si *si, u32 *table, int count)
+{
+	return ntmp_rsst_query_entry(&si->ntmp_user, table, count);
+}
+EXPORT_SYMBOL_GPL(enetc4_get_rss_table);
+
+int enetc4_set_rss_table(struct enetc_si *si, const u32 *table, int count)
+{
+	return ntmp_rsst_update_entry(&si->ntmp_user, table, count);
+}
+EXPORT_SYMBOL_GPL(enetc4_set_rss_table);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
index 33a91babb0b2..d38cd36be4a6 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
@@ -625,6 +625,29 @@ static int enetc_get_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc,
 	return 0;
 }
 
+/* i.MX95 ENETC does not support RFS table, but we can use ingress port
+ * filter table to implement Wake-on-LAN filter or drop the matched flow,
+ * so the implementation will be different from enetc_get_rxnfc() and
+ * enetc_set_rxnfc(). Therefore, add enetc4_get_rxnfc() for ENETC v4 PF.
+ */
+static int enetc4_get_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc,
+			    u32 *rule_locs)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+
+	switch (rxnfc->cmd) {
+	case ETHTOOL_GRXRINGS:
+		rxnfc->data = priv->num_rx_rings;
+		break;
+	case ETHTOOL_GRXFH:
+		return enetc_get_rsshash(rxnfc);
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
 static int enetc_set_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
@@ -685,22 +708,29 @@ static int enetc_get_rss_key_base(struct enetc_si *si)
 	return ENETC4_PRSSKR(0);
 }
 
+static void enetc_get_rss_key(struct enetc_si *si, const u8 *key)
+{
+	int base = enetc_get_rss_key_base(si);
+	struct enetc_hw *hw = &si->hw;
+	int i;
+
+	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
+		((u32 *)key)[i] = enetc_port_rd(hw, base + i * 4);
+}
+
 static int enetc_get_rxfh(struct net_device *ndev,
 			  struct ethtool_rxfh_param *rxfh)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
 	struct enetc_si *si = priv->si;
-	struct enetc_hw *hw = &si->hw;
-	int err = 0, i;
+	int err = 0;
 
 	/* return hash function */
 	rxfh->hfunc = ETH_RSS_HASH_TOP;
 
 	/* return hash key */
-	if (rxfh->key && hw->port)
-		for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
-			((u32 *)rxfh->key)[i] = enetc_port_rd(hw,
-							      ENETC_PRSSK(i));
+	if (rxfh->key && enetc_si_is_pf(si))
+		enetc_get_rss_key(si, rxfh->key);
 
 	/* return RSS table */
 	if (rxfh->indir)
@@ -1249,6 +1279,11 @@ const struct ethtool_ops enetc4_pf_ethtool_ops = {
 	.set_wol = enetc_set_wol,
 	.get_pauseparam = enetc_get_pauseparam,
 	.set_pauseparam = enetc_set_pauseparam,
+	.get_rxnfc = enetc4_get_rxnfc,
+	.get_rxfh_key_size = enetc_get_rxfh_key_size,
+	.get_rxfh_indir_size = enetc_get_rxfh_indir_size,
+	.get_rxfh = enetc_get_rxfh,
+	.set_rxfh = enetc_set_rxfh,
 };
 
 void enetc_set_ethtool_ops(struct net_device *ndev)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index 0a95f2ac781a..a302477c4de4 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -128,15 +128,15 @@ void enetc_pf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	if (si->hw_features & ENETC_SI_F_LSO)
 		priv->active_offloads |= ENETC_F_LSO;
 
+	if (si->num_rss)
+		ndev->hw_features |= NETIF_F_RXHASH;
+
 	/* TODO: currently, i.MX95 ENETC driver does not support advanced features */
 	if (!is_enetc_rev1(si)) {
 		ndev->hw_features &= ~(NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_LOOPBACK);
 		goto end;
 	}
 
-	if (si->num_rss)
-		ndev->hw_features |= NETIF_F_RXHASH;
-
 	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 			     NETDEV_XDP_ACT_NDO_XMIT | NETDEV_XDP_ACT_RX_SG |
 			     NETDEV_XDP_ACT_NDO_XMIT_SG;
-- 
2.34.1


