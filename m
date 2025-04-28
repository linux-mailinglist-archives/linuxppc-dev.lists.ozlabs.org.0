Return-Path: <linuxppc-dev+bounces-8092-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E84DAA9EEC1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 13:17:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmLWC4BXlz30Qb;
	Mon, 28 Apr 2025 21:16:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::60d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745839015;
	cv=pass; b=AGeMDy4+QH8edWrHfGJxesdIjYpBXogtl94F/J6b/vIaysmYmDYwnNeYuKwb4836grcYyUeKO1b2RT9aVXXAGiIAo1gJ2DxET8IFNNuRlNwiTvb+3vTNl3f9vi8UX9bSm5HlMZxFz+N/uXEB+C6iS2Mzt/9doG5XXMPMP1LInCX0EK2XFQ2Z3yVWH+AjWk9C2G4O0LlEpYrfj5dmWucyKCqivNe93XaYIONCZUYkVT6sfR9XFwPbZGwi1rml5oMdeHEvnKLFnV8w/JWdqWSI5sEuZ5Uov7NYafoKGNlpZoKfZvGQKfA654QXoDMYDWW+dpfe23xcc4nQCUHbsCdAEA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745839015; c=relaxed/relaxed;
	bh=5tb5OW66zp3wYKZeCl+n7UbwKwAMYYpwqeCfVvE76Tk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b8BaV2AU25CfHLULagd5TM2Silr8LqgydAfbwYn/acVQ57BcQd40KJSsuGrrbozYx+fD1V0PVUFlM0xXf3m26iQsd10Ccd2xdXrNkeXzbfiNU+iAOu3/OHRQzJjPcooa1klvWFsTyjqHug5gqyWnmBL0/bhbIrLW/4bAApaHmNV6rjPq0cQpg6a4SxRKsLgEXnU5cKpRUgcBDG7NZnuZuzJPjzWfrMTRBJrNkkFF2tPO92itXF9FTrbqN4IjIj3WFn/JxQhKVTnGjk+EV9Q3WTHwfCvISR4xF96kXYv+p1Ug+QJn0TS4WzvNfS//Vb68li2Ly/3/s31Bzv/ZchNyNA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=dPnCDDlw; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::60d; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=dPnCDDlw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::60d; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::60d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmLWC0M7sz30PF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 21:16:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FD9n7zuDkjeOaGmn9ROO/JaxLtYNFC+DbSBLnnY06ZXtqjqAp6mwreaFxwXBptUEOwVigDClpCH0QAJh3aoUtBu9xhIvHRVYon8b5o6o74co1sbh+mxjNwX3J68+30RLcfjEkWnQsTjoq5GBoD2QtUWyIKdMRshPLJDykyPqNC8KcWo6badtH8Np/V3Xq3MmPZJfC+X0P9s+clBYFs7DE/cJLu0l/kjCiRGHf2F2wxO+eODC1DsahFAbeY9YsaqNRq1tXmdFFJyEPMnTLTuQ1P9UUjCmRP4Al8u/ynr+Ki/dxYQQtu3pwxw7TXmaLgx7jXwyPK3qK6alujTtKOj90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tb5OW66zp3wYKZeCl+n7UbwKwAMYYpwqeCfVvE76Tk=;
 b=cXDZAt9sfq5K2iOgJGJER9oIssMZUY+iQtqXXJmo7WG71faFNZLhZa8IiSyod2phfad8CZrH3VFC05YQFpX2Vb++t7lPnr2ZWmLoBMKyQxoBegv/u095o8ZA0Q4TMX/ctkmeOi9VjPKm/SQ3uy41G5/tdygBkOpjoQlLnESKfMYYsPmGarg+smltv3sW5MUf+fn9kQYqWAyF+8igzTISHnT/WBORNA4AMRnj39uwGA8AD2NUbzTXjcGtON+0B3zQwF8dUWUeLdz+zhsExfGkAIFHX9eBqdc9QS851gFY3MnIxzmLIwEGDsJVBtJ26E4/dQ8eHphZn6uUu0ZAXPERow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tb5OW66zp3wYKZeCl+n7UbwKwAMYYpwqeCfVvE76Tk=;
 b=dPnCDDlw4Nt4Aq58dI6fJV02Z+OPO3gWiIUgEgYrLVuFNJcwPy8CU2TFAkfBf8T7x9xE1it+CYgg9/M50+qhCTOcvsej/CiNwMHFigUPokZChSFjVFT+uHEsWV8okdoIf4mVUMxxtdYVtHFOFGomWdaLrYvYpnqL8YvGSBy4WYApjWpn4aC1q6acjBGQiF/6VYBgaf7zI9NjAt6UM676iLrJ7xb85N2l1HNB1kgzO/zlj65jzpWFS2uahQKN3iZftBe4HJ/6Ay7SlJvZmId/wD1ERgmzx3S25IIuLzyGfIGW1mD/pHwhI2sFNEuYNCEUjDT2u6aTbU3SIhRKOCHJDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PAXPR04MB8624.eurprd04.prod.outlook.com (2603:10a6:102:21b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 11:16:40 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8678.025; Mon, 28 Apr 2025
 11:16:39 +0000
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
Subject: [PATCH v6 net-next 09/14] net: enetc: change enetc_set_rss() to void type
Date: Mon, 28 Apr 2025 18:56:52 +0800
Message-Id: <20250428105657.3283130-10-wei.fang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: b1b7cac8-32fc-43e0-f4ea-08dd86462570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/bZQ+BH3wkXpip4b5KX+nGdJtSI0QcMkVduahQeYKpftIKXRCUcFWVsc6BwO?=
 =?us-ascii?Q?W7fn5bSKkmxx/qholk4NoXwy7uG8+CnbHIRFfivmURceVYYaiIXCDC66fNIW?=
 =?us-ascii?Q?MAs+mi5uCLGYP9gJQb3BZ30llCI+T24ImqdBUnCkgCWbg1oy3o/TqMBDqSCZ?=
 =?us-ascii?Q?4yYzjcvRX2A9xuOnNg0w1o/oMz4gNHTrnzMWQ0wjdGCr4YThXeZp4jPvEps1?=
 =?us-ascii?Q?twSQFHqtivnDoVeijxw1KBC5r/q+66oHSO95DaoDhYvsFroIyDUGVTMyr22R?=
 =?us-ascii?Q?nB4GPStY7ylShCWllIUVOQcNo+46YZt4ef7H6i+JBrTyarHupPJiTvPRHT34?=
 =?us-ascii?Q?cm3iHK8o7FDVQD/ZeB/zc+8snG/1oZNRtILywYAqi2yhRz5TXRNKR1i8OVPj?=
 =?us-ascii?Q?b/s7k4xf4FdgbhuNYS4wg8s3UZz1B0yBozDAv/IpVOWaEMlV+yPAqz8gTDbl?=
 =?us-ascii?Q?0p3M3jXH8tk7uQ1yfE6X/5Rkr82YajMvh0qMgJMOw0p8jrrNZYwbHJ3ngG5r?=
 =?us-ascii?Q?JVI0HqFzEU60zXqXoVd/DaQtGAHDCwWVa1KFdyrvAOkYpILP+KV2zT4l8Sih?=
 =?us-ascii?Q?+AS9hCgPnJ0YbLcLSFeZohWkrlBmxoqVBXPMrI5A0F98RsbX72yA4B2IvCvl?=
 =?us-ascii?Q?abE7ljBNbXzXOZUWJERrTwx6yOd7SJXayDVkaIUl/fBoZ2lzKw72Fr5HKp5H?=
 =?us-ascii?Q?9ZWNzY0e9UA6ZDZy2p24F7tZ0vQhf7xJyyLsAhm3Y/T+Ehx1PBU/Tm7n52hx?=
 =?us-ascii?Q?SWVPybnlVJzBt88PdvWX5IlizYaeT4xUdCO6tN+175KSvL4oiOJLkWP6hkmg?=
 =?us-ascii?Q?MWGwNTsqcVGN8epcPMz+ADcLQ4TMTALhDHbjrginjCnDDHriONxLbTT9HBdv?=
 =?us-ascii?Q?mEq7LExYDMmMVYvi658GOZZjaBWCuTFJetx1T4uEIz6WQaCpN6OUxkvt14Q5?=
 =?us-ascii?Q?gqMyIA7xWtvFpGiWGf2WVfbHnSaaM2exDwALQaQTtdiDF5pttIh4SuHzEj17?=
 =?us-ascii?Q?GOT/TTbgqoCHk9jzHtM9r++TVcu0D1kdIEUFluZT7UNDSwOb9aNHviqgLyW8?=
 =?us-ascii?Q?1JtKqJnQMMDUuEz+5+nPRo0fJfnQ6N9MRHnjFwi135BmpcDm/1z1trOY3ZOS?=
 =?us-ascii?Q?7KWYDhY23wSpS2b8m/bdMA3KSqFsFNLcuel/9USm7gTVTjEOcSbF8ZDMC7E1?=
 =?us-ascii?Q?SXahzhtPjoEnx3SpTGstE/cJgEWfOYtpetxiDsDtq9hRlQjk9Z9qE+Cbo5Ag?=
 =?us-ascii?Q?9TRm1fQNbFRxQ7pHNWg2FApb5SOcWdrj+fJ288g1AP4GZzd9Nor+zrb6QjRi?=
 =?us-ascii?Q?NOVVepTqIvTyBjlMHl/Dp5Miqa/YTevm5JMqxR8W/EOCZHgX8N1CAaOYyke4?=
 =?us-ascii?Q?beYWfiYMqqk7tkK3AqwEDpPEghEkjqKULtqtsXglqkQ/VWFa2F9FfwpX2WOk?=
 =?us-ascii?Q?zpn5oswKr2n67t6y5HotmpFsUQWqSVEc/1ocwhkoGblvmarsEdV/Ug=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CG2MOIBZQaH4TB8HIEqUoKZjMpfyGrK4PPdZTHCjaSuW1afeeO3At261sJEj?=
 =?us-ascii?Q?7zWtLuCb7rMCi3O/vgI1NvsDLBfWeQyjfa401WavIxOJ3mssYFiD+WeLKlxV?=
 =?us-ascii?Q?jp+BNxVMm+sqfiptcAlj6lxG+zIsgQyRaFg1YESPpnPMuNJsFvrzIZvpiOQh?=
 =?us-ascii?Q?5PlozqQZ2MBFk3n5aZjCcfuRSzhstmgGMxaclyW6N/8xAmim1lDdr4V3iJDB?=
 =?us-ascii?Q?fDtwXkZbZMxiLEyXwM7+0qAgb+7wZgyYN95te9TzdawucPxXQ13AP1Gq1fEx?=
 =?us-ascii?Q?DCiu7uzGHv7pV8sd+SUPwCcj+D/2IqfYJQhqGnQKArHsQK7z9ia79bduksmN?=
 =?us-ascii?Q?K1r+WjAWqymWGg1jU2ndilZsixRM04M+c9zCwpLrTSqnB5yMaphyhisQdfnm?=
 =?us-ascii?Q?X5YCBAhFy7GFRedyAziteGMFHHHKJP4bLnrCenhbxtElVgZdFEVmp00FZe/r?=
 =?us-ascii?Q?YLEdeenQRXimQMAWbKwAxxGqzVJW/pbA74Y4K+hdrhZCagxNbLGRqNYWbJOU?=
 =?us-ascii?Q?xNAA+mVgDJv+/l2E0xMLmHeRUCuS4x2jvgnnE08L8GLnNOJY0f3xnCithTkz?=
 =?us-ascii?Q?9aQfBqqYY9y0qwXWUL4pZbLY2cWOlOty8X3Yz7m7xrwBaWVrkgWa79El+/Cr?=
 =?us-ascii?Q?P68EdjO3wNH+sLiVY8FtCXjnupHde5A+BlmkDzLE4MJFRBRnBhyUHPL1WnJZ?=
 =?us-ascii?Q?QyiZK1kW04nu/JPaw7slFI3O7iH4PeJKkU6p6Ia++OyY1YH4WVrz1yRobE7a?=
 =?us-ascii?Q?Pppm5c27pTtTT0NI+DIoeLYvFG0+VMeQ9sWeOBGbIp1sJhF/zkR4Xh7/705M?=
 =?us-ascii?Q?jSUbxBpYuN2qM9quwMoa2YRdAp3eJGrq//vcBzfqa/iEyGfZ0dhrGahRkU8D?=
 =?us-ascii?Q?XIRufng6AuL0UQXzhlSM5gPtyRF6Vzl3qAQYyaYmXHZ86YxfM2Fnsz2x8lHy?=
 =?us-ascii?Q?qDlvcWuqWb4rRB3TgdPZz3Qy1RRGp7JrkuFvjNQM12w4u+Uo05i7o40ydrDu?=
 =?us-ascii?Q?XDYfrYuks2J7d5kt7WTRD7yDEYqeg50itLQGLZL6upJwjkmKTKy/dQxjNiop?=
 =?us-ascii?Q?06YgXHtH0K4z/tX+IO5hJQCEvHV8iVMYkERskeY+gsSCkbDN9E5J1XoZA8It?=
 =?us-ascii?Q?tn28t7FoMSsJ4OIHvj4rsNV4hKCWihCI5m2+ddl2hXIfW365VWDjkRYkTQxQ?=
 =?us-ascii?Q?AjKkLgeYk+z41cRTSq3AjCMuebtkwc7RNI4DZ/kU60zEn+fvRY6EFRwzuU1d?=
 =?us-ascii?Q?0FqYM+mvzHC5VhD355gvud5DINJl2wMrS6wWcLHzEZzSV2LwAzrpGkB+s2Ge?=
 =?us-ascii?Q?6LNL2kAcnPgLN6ooG6IHSnM7yvg0dEAe6uJ5i34Fff1sHogM2mtriau8Ryh8?=
 =?us-ascii?Q?PQuK+BrrLFNKtesxKMr/5aSLj/726kfRz/GhoKUByNYYDTSP4TLPcfMRn7t5?=
 =?us-ascii?Q?QNNxc+LlhxsU5c9nQZVKFRS+XJOKs5+UWZ2oCDxkf42BG40cSM2mFd7iX+UK?=
 =?us-ascii?Q?fXvcNGmhAVIvi6gX8+RwFg0rp9paRgZDvw273Q1bMIXwbJ648jT5GfJaJ0PP?=
 =?us-ascii?Q?IYz18wEsZFq+6pV4wdCP63Z240N/t/r1DlYQXbsD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b7cac8-32fc-43e0-f4ea-08dd86462570
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 11:16:39.8851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYhfW/cFGuGw9FG+A/XW3M/NFRwvb17Ir/KKuGBhxITSeY3rtcKnMRcRcteUuWMmInlzaxNZygqyzMpJ+XWsOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Actually enetc_set_rss() does not need a return value, so change its
type to void.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
Acked-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v5 changes:
New patch, suggested by Vladimir
v6: no changes
---
 drivers/net/ethernet/freescale/enetc/enetc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 08762772c045..daea85cbf043 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -3242,7 +3242,7 @@ struct net_device_stats *enetc_get_stats(struct net_device *ndev)
 }
 EXPORT_SYMBOL_GPL(enetc_get_stats);
 
-static int enetc_set_rss(struct net_device *ndev, int en)
+static void enetc_set_rss(struct net_device *ndev, int en)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
 	struct enetc_hw *hw = &priv->si->hw;
@@ -3254,8 +3254,6 @@ static int enetc_set_rss(struct net_device *ndev, int en)
 	reg &= ~ENETC_SIMR_RSSE;
 	reg |= (en) ? ENETC_SIMR_RSSE : 0;
 	enetc_wr(hw, ENETC_SIMR, reg);
-
-	return 0;
 }
 
 static void enetc_enable_rxvlan(struct net_device *ndev, bool en)
-- 
2.34.1


