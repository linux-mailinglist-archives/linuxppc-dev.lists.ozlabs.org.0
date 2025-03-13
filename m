Return-Path: <linuxppc-dev+bounces-6981-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF74A5FC89
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 17:49:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDD4K1btsz3cBP;
	Fri, 14 Mar 2025 03:49:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20a::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741884577;
	cv=pass; b=n1I1a6fO124gk5kL7UGExvIlFQJVkj7jvtHOxthh3ZUpQsFBWtr1k4xe4xHlxKbghL/QHWafjQxazo/4EBizk+zMqi9GatBgGNbuWIj0Qq6UT/ych3xvh2y6u0vEyrw2mmqnWBSwojGVqWDiGELfGoSeNmM89vhnaXIj4kA0ZCnNy8/YUV/oOv8Sqywk0RCLvdI8rfV0X51gWeWkgnN18mndBXY7+RaTjUps/xYRUEy9xdRSaad/eL7/5jo2KDz7vItzNoHdVE3Mqia+KyP7j9TRY7HRaTKkOoIJaStbuIIF1Nqg+huieH8LNBXAmWvT6DxiQpUI6qYpqHctf76UzA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741884577; c=relaxed/relaxed;
	bh=q0PePvajvGnwRROd8fiAM5WZCju58BsKTyQBhppsnZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SdbFAQwuC0q2KvR7xbHG4ykcZLsov8JPXtOCRcYKCA2JX4u4Flhur4pEJDSoOUkw3LMw+nAl2H94YP4mK/1Z3W9JMGmENS2dcUtQj/hjT2oQpRnmlHfbxCV+XDEQ8fXAsmujQwXo2y7b6ZPd96UdfLX+MbqsL2j5vyrjzdBA2dxpN+L5Q7H71u3lffNm8bSIypxZoX03DBgGaxEEK9hiCY2hNZ9BoLnaPVJUkWQYzojorSObpGZ8XDHsXBvENsvx+E0xCx29uKSNEN0Hx5BrqZXSLm5IKCYu1NGR1bUWvGVaUH8s7gc4L1op6odBTzDcie2q5CDKZyNpvBDGaNoh0A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=M+jkKAFh; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=M+jkKAFh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDD4J1LXRz3cBH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 03:49:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMsKyHJIPebeLzrgA6XdYKkSraCOIiq7FlYnsJnt8BaPg2ywHOI/DImlxD4t41BOE0ldkho1x/FrIogXHKalZxQ8IXPtWBwOWgxqnXHOBnS6w2/m4jMKJgWcNYMuoYCHI77jXw/kp8BCecSOuozsK4GQYSkNI3osKXzzuu4DaTlWcFpteI+I13dZ6POrXxoph0rMDQFMxQgDzWjb6R98qedfddseOArQfd/zLHA7ezp3renss7EoPWno1OGR6p03jn0D5vVxNgSByeQVlYgTxMBOzFvN1o1keeHDJ3S6/1Da7OHJ9qKZTftC7hzR/XcDmYAkBWUgDy4aTOoFeIiuZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0PePvajvGnwRROd8fiAM5WZCju58BsKTyQBhppsnZg=;
 b=B2VHBGFnsbs+P3Xi+QwTfq04nDGj2+Fl/iderL/sKKpD+E0zyeviRV+JCrLMphjlBJ8q7zj9bc68F7JY/6ALFiqcSVMfnydHjVcaHSnQrf/Qmunv4DfXEYswvJNPEWH/0gn7nwkCb8eOqewNgdcxnxDMmuW7U4k24cFGYrmwdw95RwCoHxJNe5bQqracN9rcqxQk15ig9hAhILIzA9A/KsRsXrpYi1kseDzlE7HyoQI62IfaujXC0oNMyFZmpTcQ5ulpGLMhFyXhmlUdoV9Zun6u1q+kUUUqkOFWGWQ2JNnjZB3j5jIeQiX0b/1i0evkKkOWyXRWVvLnXxEuIDBuAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0PePvajvGnwRROd8fiAM5WZCju58BsKTyQBhppsnZg=;
 b=M+jkKAFhecPMl/sVCr4DG1vrBT3UZYa+ggG0R/JsqKo7FQbeFlyXbi4TQQna4/7DqKGh+03Z/4Ii2AeTNh5zkpQuLpoDYzbv1LLPv+/LsFNIf9FehnLaI97BPENbtMSqTYxTjnmJ/9X1W7aSqXwEL1axxW2GvDfh0OOAIQ1jR/oZ5R886sk6zqM2ooXCfkpicT8T7ehMhmaBmVlc6wqHUvJAQBtiubms+8TQBSqJnKvawIlocWmhPGd9+Vi5vc+pYqkY6UCSMyw33QciOMX5jAS+TeY0/QtETNesj884KWzKU1aYSHQKn/+aE0Yus7Dz8Z49f9Uyo/5Odbzm0FP4gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by VI1PR04MB10003.eurprd04.prod.outlook.com (2603:10a6:800:1e1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Thu, 13 Mar
 2025 16:49:12 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 16:49:12 +0000
Date: Thu, 13 Mar 2025 18:49:08 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 net-next 02/14] net: enetc: add command BD ring
 support for i.MX95 ENETC
Message-ID: <20250313164908.rdy3y77xno3fza3l@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-3-wei.fang@nxp.com>
 <20250311053830.1516523-3-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250311053830.1516523-3-wei.fang@nxp.com>
 <20250311053830.1516523-3-wei.fang@nxp.com>
X-ClientProxiedBy: VI1PR0102CA0049.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::26) To AM8PR04MB7779.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|VI1PR04MB10003:EE_
X-MS-Office365-Filtering-Correlation-Id: f986f15f-f9cd-4b84-23bc-08dd624efaff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0Q0ZGZmQWhEVXl3QlQ4dlFvb0VYNldUUGJ5VlQrZGJ2TTc2TFNYdmNQNlN2?=
 =?utf-8?B?NmVqRDhNdFpZei9JVGFRT3FmMHoxaHp1MmpBTkM3dVJIU1VSSFkyVXJrVHBW?=
 =?utf-8?B?SUFjYkFOazNEQUIwdDBQZldTS2RoQmREV1NzN1BCQ2J0b2MvRzFFR1hBR2JF?=
 =?utf-8?B?TjJmajY1YUdRZUhwQWIxd3FreGtLL3I0MGRscDlpTlJROGNDV0VpV0NHR2lh?=
 =?utf-8?B?RjUzWjVKeVg1SkplUUxOa0t4dTQyRGwvN0JYL3ZNa0w0TWlVeEZETEVZdjMw?=
 =?utf-8?B?N3cxdnFWZW5aTXhpaFFWVWlEeHJqcXNmbkl5bC8rRUhoQlJlZXcxRVJYK1o0?=
 =?utf-8?B?b0V2YlF1T3k1V1JKMGM0UUdnOTV6WmVtY1FmT25GaHB2OWo4R0lVWjBKYnhx?=
 =?utf-8?B?M2dGcjFiYlVpSm56K0ZDaW42NkZ4V1I2cmdTa0ZFbDlEOHBQaGpoYkI0Ukht?=
 =?utf-8?B?YzFSeitMNHRVZWx4czFYU3hBeVUrN3JLVFBya09PV1o0V3FIN200cjRPcS8r?=
 =?utf-8?B?WU1Ea2NTOFJ1WVJRU3owRHBhMUFnbTJ5Yk9oaTBmWHZOd1hZRzdwakFMbDIr?=
 =?utf-8?B?dFhsaFRiRXBmeXh5OXUrdTUvOXhHbEg5Tms1dm45VXU4U01Wd3RrWk1ORVBO?=
 =?utf-8?B?U1hiWnBEbXNENVBQSE9OSjBJbGllV3gwbFEwWXpwOHJWNklndU1OdkNwWmR5?=
 =?utf-8?B?UjFqdVo5NGtmb04vckZVWW5HQjI0c3RlL09Ta1RKQWdvanFHcFZkT0swZmkw?=
 =?utf-8?B?SmhHNUxpc1M0ZTRKb3AwSi9EbnVOOGdvcDFxNmJYT25UeVFpdWZJSWx0SzBM?=
 =?utf-8?B?dUUxZ3FUdTVpMkFCWFV2aXI5b2xEbERoNkgrOThIeFU2SWJLTjhKSXBuNytK?=
 =?utf-8?B?N3JSQWlJUGJhZzlZSlpzNnVyK0lRWmlwYjhPU1l0YWRIRERYTnJQSGR6VHcv?=
 =?utf-8?B?b0Vjalo2R0RaRmZkVUEyWGhIdXE4RWRGckdqU29YT1BRUjdmazVYYTh2cjlV?=
 =?utf-8?B?RU1ycmFjelFiLytUelEzQ29BelRMdW5GQm0xTDJ1UVdyMXZKcy9JbFQxRGdy?=
 =?utf-8?B?TnJRUEZ3NG9RQ1l5azlpSkRtd3g1ZExHZ0hHTUR4ZGtVL2xqbUhRRHRhUCth?=
 =?utf-8?B?WHJWa1VqQlhWUWFpeTVCVnpmVjBkWDd6cnNSWDhGK3dESGVrNCtmRHdhWTNI?=
 =?utf-8?B?WXM3WldmcXV3bW1PREJ0SzJET0lJRnhncmRCdU9GS0FCaFVFcENQZzBkQ1Rx?=
 =?utf-8?B?MU9JWk5FWkNvcmg2WDl0bWd4dHp4bnlJdXNpM0lKMWptNEVLaGJtRXFJOEpE?=
 =?utf-8?B?VEp1TjNCVWw0R2ZXU3lOQXBxYjZpN3dSd1BpMFhDMFRrM0d6WFJHK2xCQlRO?=
 =?utf-8?B?T2FGa1plR0xIS3psTUowWlZzYWIrVi8yN0gxQ0ZCMEk1TndhVGlVaWV4Y1pk?=
 =?utf-8?B?bTZRdG1uQVpLcGs0Z3ZiTE9mMGhKRGlUcjFYNG8yOGRBM2JKbWNuQXhNMWFh?=
 =?utf-8?B?cTVFcVFUWnlpcTJHMmhLczRRVktiN0c5Y000UDdhcE4rMzFxN2ZVMDFOWmZP?=
 =?utf-8?B?NnpidHg2OVp3TWNiMld4UFZmaWJYczJnbWlmajhOMjNnbmlLZm5JbzRYMWM2?=
 =?utf-8?B?eU1NbEFYL0hkOWx0ZlpwYnhlbkh3dENVT1kwcEw1QzdIMXZXMzMrOHNYVlZZ?=
 =?utf-8?B?UmF2MVYyd0tZY0EyRWVqOFAzK0RXcmxMenhIY3dBbmZySDFpYXMxRXZtSHJa?=
 =?utf-8?B?bXNncWhQMGRsaGtSY3NxUGNjOEhUMjliYWRUUEloSmRyQ3lDWDBWVTh0WGhE?=
 =?utf-8?B?cGpkWU5rVVNWVXNPS21JUkkwbzkvL29KMUxwTEU1REJOQVlIT1JhcGR6QS9J?=
 =?utf-8?Q?Wg6Y6BiDTo+jd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHA5U0U1RmhVdmZ6Yk02dnNsWXZhVlhFNU5qbUFwcm45R2o2aWV2M1V3MFJO?=
 =?utf-8?B?c2wxTStFckxObkxrR2VQbkVuekpJOVRvazFqZExCSUYvZm5ZWllGM0FFS213?=
 =?utf-8?B?bnJxS2dpNHNQVEVCclMybkxjdWRsNU91SUVlZ0JjVERvMUdxc2FEbjVMNzVS?=
 =?utf-8?B?UVZsZmtNZGhnTlN6YktXL1hiYzBYbXBsME9Xai92bjVOUTBKdzRjait2cFdS?=
 =?utf-8?B?WTQ5ZHFORG1zdiswRTVObWE0dnpPOC9QNlh2SWt4aTh3WFJaOGdMZmV2ME1F?=
 =?utf-8?B?NWRiM2R5NkFaUlpzZUR6MUVicFlmTWZZakhib04zcGFzcTRFaVJKc2o3OVVD?=
 =?utf-8?B?MlplVVVFM0t3NTJIdmk1WjIveDBRaXZGdDhENnpPZW85WEFPellGM1RqbXNU?=
 =?utf-8?B?L0tjcGtDcGFSMmhkSHpwQ1AvUUZvb25pYlhXVEdwNFp5TmZVdzZGS2xTYkZT?=
 =?utf-8?B?S3lOdndjOFFwQkpsOUMvU252N2FPRnJKcVZEbFJYR1pRa3BTZFFveWhmZTdH?=
 =?utf-8?B?K0tkc1BzK293OGpzWWJIS05WejFySDdpN2tEelpVRHNQSUVOSWFEVWxTZlhE?=
 =?utf-8?B?cy95MUt3WnJ3SkI5dGU5bHQyL1ZpaFBEMkpBWFBncDVyK2hvWEN4SWR1a2J4?=
 =?utf-8?B?VzFrdHhFNFVLNXFpRlAxVmYrNVV4bnB1YmpUY0FrbVFBb01JeHdTM1RPRE5o?=
 =?utf-8?B?b3k4bzNKdWZUSmRhbXZNRHVBdW1NZjRMemRhS2FUMzBtamFra0Q4bjRPNEF4?=
 =?utf-8?B?TEhPUmJJcHhlZ1RFWGJycERZbXpDNGtUcDhPY2wvL1U2YUN1SStEaGUrTUpr?=
 =?utf-8?B?L1ZOZHpOenlmS3JhOS93akl2aEl2WDhVQ3JyMTkwYlVPSW5aOGhNR29hK1JD?=
 =?utf-8?B?elVmVDFZYXFQOHdmZjJyOXd0NWFrTDBVeDZnL003bGFCK2xxUHYzYzBrOERo?=
 =?utf-8?B?LzNuZmZSdE1VM3Nwako1UW9qeXQ3ajYwdTMzQXpkVFAzMkVuTEgzQUZVTXR2?=
 =?utf-8?B?dUJsbnYwd2FDMUhWRGNXSjVpU2xWbDNnYzAzT0VicUVEcG1rcEJNVHRSMkcy?=
 =?utf-8?B?YU5DdC9lblhOenBSU0NGRDZ2bFErMTI0MDN4RUZyMnVCcG1mcERjQTFRSXRP?=
 =?utf-8?B?WVBiLytNdFZzMEhzREdiSCtSVk93NkVrbUE5cWhyUGllWUtaa21YN09xOHlx?=
 =?utf-8?B?RkhkNzRKRG5KK2tSNW9kMEdUZ0NFVUxqNGR2NXFFVnNkalFYVTh6YVVUUmw1?=
 =?utf-8?B?VGwyajJEbTZkUDhWWDVoTVNoVmozODk0cStkZ2RiYnlEbXEwRHlkUlVTVWJM?=
 =?utf-8?B?alVwaEhUY2F5MWcvL3NhQVhNcjhxVjJ1amg5QWRoZUVFMkhmWllXUFVGalJB?=
 =?utf-8?B?T2xTWU1MZDlBZktCU09PZGxYV1R4aURkNGFGQ2ZmemhvRGgyYjRiSUJvb0ZR?=
 =?utf-8?B?YkJNWVhIbFdZbGp6bGFyWURFQjl0VzlVbG5RRCs3YkljbHBsL1lJTXF4V3JC?=
 =?utf-8?B?alYrRkRZWUNJWVRxbXUwbWZQZGIxbGxONHJPU0Fleml2dUxsbEZWU1NJYW14?=
 =?utf-8?B?a2RNeFNvNklXSnNGRWJYeWlma0RwLzhUQzZsTm5XNldPZmw4WVJleFZEOVFo?=
 =?utf-8?B?ZE92bzJ4VHNyYnlrNGRXclFXWDdPTmp5dGEwbUZlaHlNcndqV3hCaWZiZ0pK?=
 =?utf-8?B?Y0JXMWdOdElCSSt1S204MGsvRVVaclVlQVZBK1ZMUTRsNWtPSDY4QU95Z1ZP?=
 =?utf-8?B?YUZSUndEajhjT2NhVFNvTW9ZSTNTTENzejhVcUU5dnlLSTFZU2NibzZuYzV4?=
 =?utf-8?B?cVFTcTRES1BkUWVjOVY0ZFdCM28rNzdKYnFqV2lpR0VCRWhJODJETmMvSUhq?=
 =?utf-8?B?NDY5N3c2UkRYVXdDSFduVDZiRnRSckt6RE1BRllnYnFxcVAwVDNwbHZRWjla?=
 =?utf-8?B?Y1o3RGpRZW5pRFkxY1NIUVVRZUhQWWxKTTVyalhKZ2FleDVRUlZhOWwwQThM?=
 =?utf-8?B?Y2pXTnczV3hGOHd3RzFJMnIzMkJzMHFYUGc4SEVOc3pxMmhTNFJjMVFEYVVY?=
 =?utf-8?B?Yy9VWXBjMG9WZjBwbkd6TkxtVWVzQkdUNVlMbW5SRDVYOW56c1QxWEhreVZ1?=
 =?utf-8?B?RkJXQkF4YTArTzdzdnhyOEh0V3JoTzErbTUydEIwemp2WWVNWjNvODlJaWll?=
 =?utf-8?B?cXc9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f986f15f-f9cd-4b84-23bc-08dd624efaff
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 16:49:12.2488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yWkaFfq2M+1p/E65yjQ2gCAPlf70RzohYyxosuyvbneuB1KSu3AVXn0ffmVnt2TGI4uJ+jlRbfi6q+V30nioqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10003
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Mar 11, 2025 at 01:38:18PM +0800, Wei Fang wrote:
> The command BD ring is used to configure functionality where the
> underlying resources may be shared between different entities or being
> too large to configure using direct registers (such as lookup tables).
> 
> Because the command BD and table formats of i.MX95 and LS1028A are very
> different, the software processing logic is also different. In order to
> ensure driver compatibility, struct enetc_si_ops is introduced. This
> structure defines some hooks shared by VSI and PSI. Different hardware
> driver will register different hooks, For example, setup_cbdr() is used
> to initialize the command BD ring, and teardown_cbdr() is used to free
> the command BD ring.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  drivers/net/ethernet/freescale/enetc/enetc.h  | 27 +++++++--
>  .../net/ethernet/freescale/enetc/enetc4_pf.c  | 47 +++++++++++++++-
>  .../net/ethernet/freescale/enetc/enetc_cbdr.c | 55 +++++++++++++++++--
>  .../net/ethernet/freescale/enetc/enetc_pf.c   | 13 +++--
>  .../net/ethernet/freescale/enetc/enetc_vf.c   | 13 +++--
>  5 files changed, 136 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
> index 4ad4eb5c5a74..4ff0957e69be 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.h
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.h
> @@ -8,6 +8,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/skbuff.h>
>  #include <linux/ethtool.h>
> +#include <linux/fsl/ntmp.h>
>  #include <linux/if_vlan.h>
>  #include <linux/phylink.h>
>  #include <linux/dim.h>
> @@ -266,6 +267,19 @@ struct enetc_platform_info {
>  	const struct enetc_drvdata *data;
>  };
>  
> +struct enetc_si;
> +
> +/*
> + * This structure defines the some common hooks for ENETC PSI and VSI.
> + * In addition, since VSI only uses the struct enetc_si as its private
> + * driver data, so this structure also define some hooks specifically
> + * for VSI. For VSI-specific hooks, the format is ‘vf_*()’.
> + */
> +struct enetc_si_ops {
> +	int (*setup_cbdr)(struct enetc_si *si);
> +	void (*teardown_cbdr)(struct enetc_si *si);
> +};

I don't understand the need for si->ops->setup_cbdr() and si->ops->teardown_cbdr()?
Doesn't every call site know which kind of SI it is dealing with, and thus it can
appropriately call the direct symbol?
- the v1 PSI and the VSI call enetc_setup_cbdr() and enetc_teardown_cbdr()
- the v4 PSI calls enetc4_setup_cbdr() and enetc4_teardown_cbdr()
What benefit is there to making an indirect function call?

At least that's what the current code does, I'm not sure if that is the intention.

