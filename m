Return-Path: <linuxppc-dev+bounces-8327-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 358ADAABD13
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 10:27:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsBMb37Gcz2xlP;
	Tue,  6 May 2025 18:27:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::627" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746520027;
	cv=pass; b=Bot0f+3k5G7WqVwSpy8vu6DBsbESoKG/XvzqZqYlYoMXtd4iUyEZI41cr/13XTZ+a9KwghK9XPPhqFC8FNIBJJrQwUtVqW1ajZprxo8cTvXwqZGs43sUazUyYwGsaBN6b/qPnKqABSdfDodsYxiRZ5TBAB8//5mDgPD//dGJYEcPvKBt+kID1rTkrTf8q0oz8CAyDQGgG4OuLGMe3LGw5G34HCeqruBlBeYAhj4RqdOfY1Py14TC9j8X+4z7Hs7qVaQqOleVXrXYD8YorgLX40UJ83r3pMDSseGu8/karMii2+U2klrYIjW6r7NltoaVnV1Ew7VTmxJs/WwAWjxbiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746520027; c=relaxed/relaxed;
	bh=zssKaXKfPOtcDGKX1NK6o8nnTs7rAayFHXgJuHOE3zo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WBB+EKO0UWECYf3IONHo4jAnlkq43ReKsZTrJRJhPjVNue2d6E7tCdCJ1b0FjufdOE5GE+vmH51aXKouapfKReMgaarfmJZiNu2OCQmn5c+WFNPgiggezjGlofdKFDl4VMlWo99u75tTz8R4f7nCfg5AieSJKyn4EXB3j6v4ijwy6YfAcO01CsV1cdNlar9PBsUrej3V8dB267adO3x8zphm286FuGLRVyXjVEq4cwt49r7vayXTWS/KmRcdGzeFo+auoltn3R+vwJ/BhKmqE9FA2khroU4AeGORzpBLMgc5I4QTzdrb+EAl+4xjIt7sQruoNg24YQOzWKeLz60l5Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=lgVLBYi1; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::627; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=lgVLBYi1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::627; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20627.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::627])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsBMZ0V1Tz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 18:27:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LTIHwZhqm8giOEKHh/XjOvGmjOqbrrwtKiNXEO3sIHrYwj5DnQOsNVT0E3mXxoPJoTr5V+yDN0iyre//TU3VRX9VQI7ZxTUf9OluSudiasoNI2Wx0w1gTb+TWEh6cbDoQEJiYVbO3//D91gDmfCx8exu54yrjzSVLGMPxlsznm7V8XMdsyo8U7hbLwFxMzCMN/8kNYu2aU1G/xHoB40uw1SCvFXVTNXQqXROhx4WqLUQKxd6FTHVZROy5W5DGmp0yF9nDxCa5yC3lkQWzzMGNcF0ipElLpnXmFRammEp2LHOscDxVByGFYGyrFeTuf2AlPqrgR0lz7pji/S5Ya4hUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zssKaXKfPOtcDGKX1NK6o8nnTs7rAayFHXgJuHOE3zo=;
 b=BmSwYFLZzkwHsVuEpCUJYuPG0T/f+5bMDsMQ5Ff/lCTVomJafbkslkeu4KOZ36nNkwmrJWkqypa4/38OXsJYlizpxLfRket8uXbCWSc1xLwP6fDls/kMvsM38Ymy0ITbdOqKUu4Woat76XSq+c8gX0VATrs89TD06MXk5/ZgI+xSKB1SdbPtGf7DeiEyzimxRou8WL1pAfON9ohfpko5gpENHyLwdgUvq2Jk1eZD+k7PvrEYnmYRIxTSoh1AiQ0nkVsyvL/PB2IheShoxliLAuLd64xDrn0Pmur9fjpTvbsVm9paPM2Yd6YxjH4949/kGiPrCyqHD2niAnuZLI83mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zssKaXKfPOtcDGKX1NK6o8nnTs7rAayFHXgJuHOE3zo=;
 b=lgVLBYi134+nQMMKTZugNxYE+O+CztZBGglVbI88khGHh899VGOVcpbcnMUroFOoNNhPcMRo8qmKXyCW8BRJq+4yV4Z/M4dlF3eGqkaY2+8k67Ju16zpELUf440134TstzHy4qYlCLx32T4IyUO+mJ5yp4qD9cokrxQFr5cYADANy7tk3gBK4eOS19MhWvAeJRDltmxXrKIbhBPd25G6DVZJcZFIuE0veBz/LFn+GTnYgpnWQRQwPnZtJZcEdlAFPltbpCzvyN+Erjw4Kfh4C01tEOTBso5zZ2OmtLnZc8iBNaEBQKWYUBoZ+yW3Gsg9OdhwhSBkwclmCpmzbU9+oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PA2PR04MB10158.eurprd04.prod.outlook.com (2603:10a6:102:404::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 08:26:45 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 08:26:45 +0000
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
	linux-arm-kernel@lists.infradead.org,
	timur@kernel.org
Subject: [PATCH v7 net-next 00/14] Add more features for ENETC v4 - round 2
Date: Tue,  6 May 2025 16:07:21 +0800
Message-Id: <20250506080735.3444381-1-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0249.apcprd06.prod.outlook.com
 (2603:1096:4:ac::33) To PAXPR04MB8510.eurprd04.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|PA2PR04MB10158:EE_
X-MS-Office365-Filtering-Correlation-Id: c7553e49-90b4-4af7-c93b-08dd8c77bce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CJApqH2fr0lbLhB2EKl5buNAvxjRTzQg+f/cPigguEQavfphGn7qJK5jp/Xl?=
 =?us-ascii?Q?uJ3aBsJpbdkDBwjLhL97BvX1MIr+3t019ARkQand+xkj/WfJdscNruXb+8T/?=
 =?us-ascii?Q?SixEfTVhlpwo71FBrbk+0MewrEb2cGeNGBksFZLGEEFeDcrrnIDvtW1+sWVe?=
 =?us-ascii?Q?k6/AvHrTS/fskv0dYTwRUHD9TQHcPA5lmHP8Z5j1+tPxjuT0G8GTratmzDt2?=
 =?us-ascii?Q?yqmxrPNe1/fvZB9SlzgcRKjCgxWuLKKhJKuMPBxfkKQKRT2hq5N2KAEIs3gx?=
 =?us-ascii?Q?1EcV/xiTcgDX5115+Au2/xtfLAEtfh51d1lb2F0XFctNrLXFqC1OTPLkWdy5?=
 =?us-ascii?Q?hQh830rNihtw6Zoe006FAXwqpWz3zBC6FjzBGV8eINO/sMDpFgIXoq0sXboT?=
 =?us-ascii?Q?/t7p9+/Lfwnn1+3IPtpepgHvMyTUZ/lMGjgw2Ie+dErqHKpEx0k9Faos8oEs?=
 =?us-ascii?Q?e3oXXqm+DFwJUdM3e6JdtjsAV8itmybMyU2UpootFT1/VEIo9kFpSXeSLRfN?=
 =?us-ascii?Q?4dCUUhXvBx4KuaUejZBIzueITxl1X5nQ9I97vYQJRhwtYV4+yuwmfTXszaMY?=
 =?us-ascii?Q?ysmO14gds2lLUOAi3S11huQcV+yXaKMn3HIvkWbf5hfh1nGlICXoMsD75ln1?=
 =?us-ascii?Q?bRovi+kS2Eh7E2b3Rr8ULaf3Lpc2jpcKwVbLdRaR02vR5wj39AsoYY1mDY1L?=
 =?us-ascii?Q?cyaRqEnGNYfG9VT+rur6c5z4fB/zD84qLwgOQH+cMY2woXYN7dta/UNcc9mz?=
 =?us-ascii?Q?yONJsTJ1IEyFGfCrghp7JEauB0hdGnaAUKEk5Hj1f9PTibnxk9JazF2r6YFB?=
 =?us-ascii?Q?dL79buLvCq2DVHOjWIdojqIw7XIFFtuzlZPPwxr8MZIDxeXoSqzZFArQEX3c?=
 =?us-ascii?Q?QyiZTPKJPEkyORkyyosY3285syTF4SutHiiTLsKh6Mc3V8KuruIFgGdH4xRL?=
 =?us-ascii?Q?ZcNfI/UCgc4jw5dBrRk6MQSKFKgolHVgwvMHU13dq/jTMdRL87sRDngX7Ojh?=
 =?us-ascii?Q?NeZZPGAc4EjQN/51ATVr7pvPfPbQXDv5nnpbsGZybt+NR4BSW9Ka6swjgswY?=
 =?us-ascii?Q?9kDpSdG/cBlWm5J3P2pOwkVOPJl5QQntZ4WlPxHiDR0AhlE5zbo0Qd30W9Ag?=
 =?us-ascii?Q?WCM28YhwqpRV8/zpVy+SKJ+S3ArrcQubAG0QDbVvxnQkJX3Z78rmYB7ONFMq?=
 =?us-ascii?Q?P+4ZrYN4uqArPftWqeGr/c1JborInf7/cu5waenyDNaL7+wjiwAAWK96ScjE?=
 =?us-ascii?Q?1umzdgbxnuPaYkP8zWyxDzCGMIE4iuJ6jZ8bdEadgjLYfdh1hzshwba0EDBy?=
 =?us-ascii?Q?vgMjgoq3k+/aWTo5YuRZ9penE3PYiSvdvDbuo+/vcCp9PWHXS06s+m8xDeF+?=
 =?us-ascii?Q?Jx6V/N+Yx8O8zUtfha0Ii82YJHdeozPCMEkxf2HVx2bjxdIzqAJAw3kuiSoF?=
 =?us-ascii?Q?Qynf/RpgrDNulB6DqporDF8jXWllU0W0vlHtyrQPAJv7c7JLrRZUvI6vdOFk?=
 =?us-ascii?Q?7y84BwA8AwuK+HM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8lnctn+lp4W/zKvNPH0JZPcO2PfesphT2JJ1aX2eGDWkK2SNzAuCqFp/r+Pm?=
 =?us-ascii?Q?npAI7JVYpghGRVCC1cKOlE2rJQnqiKfrxyiTW2OCdwMmkPYIV5RucedBhT+K?=
 =?us-ascii?Q?YDsepDWiMwOU3cZ9HWUggaeRVuIQbNGBpu5xsEsSWCV/XJNkdRV/5Q1YWpDT?=
 =?us-ascii?Q?HgHx0QtpwJFxc8dVuVfK7l5jub0eMRwRSCH5eHGXC8UAHkYQOGJVZ0hR+fCg?=
 =?us-ascii?Q?rKWAIXLxaJpocnn099N1gu2qHiKgpIBuf2/AeQJP29bw48b2YyqoKgMy2U/w?=
 =?us-ascii?Q?XuU02YiugITSOYoM438GwGnrTGkEjeUgZpZi8AmMH7LomuvKA5KloQUgazgt?=
 =?us-ascii?Q?VnZd/aQ4jTpq7ld7YpJLL5QLQ2diV318I3RiHhfUsmLLbFuAXjWLUg8sNdUe?=
 =?us-ascii?Q?4wT5TgSTRvfFnaut62kLWTNHO4xnFqgmtnx/2EV3SRA/Sm2KpAmIqdx6CNw4?=
 =?us-ascii?Q?IPxaooxdE+F95ty/5KyRSO7OSEQ+cfDabtZ40NYQ7dANxIZwJJuwXxEb5XLO?=
 =?us-ascii?Q?YhNDWB5Eug/5Qr3ZRxLCFn9kVI4ufiXxWcNvZButMKTyy3jJN8J9qwqkgAM+?=
 =?us-ascii?Q?D4/5MmXBiRZXYTQ54zLLBILWIXPYxzjAQQ0Pvacnp+5hfrw/xz6VI7ueneMd?=
 =?us-ascii?Q?8vCtUzOykAC8pR6p2bowHktm8C7reyfVBRwjemWu6ivc4BZfUt981ADWTuqm?=
 =?us-ascii?Q?zWYoJB0rutMG/7TMHguuOp5DnZT6MlsNOUfVynlrANbkx6M9QaeaHTc4pQbK?=
 =?us-ascii?Q?CmM6m3KxF7y7XY4w26m8wGCfWsIfTBUDT0lkj52US27BK9vDAZ2W2EKhjmFM?=
 =?us-ascii?Q?H7Xa1B9U2Q+GK39sskAOK+57jq2UKaV6QuMzRni0nVzSvBB8megD9FLAQg1T?=
 =?us-ascii?Q?ISmH/LGGEufK+Vb6ZymmVcOhtdxVCZEDy2axEWDiwl3YBaZCZHYnEY4nNmOq?=
 =?us-ascii?Q?76brgSa0HIS5lg9hDKNx0VoK9xFrwHW1zUp5rdW6NOVGrXUYZ+2OooAJY/O7?=
 =?us-ascii?Q?ngGr6e/KwCAe5b398lOtas/EBqsJcbXWlulKGDFLZ0veqawlF4mO386OKNVe?=
 =?us-ascii?Q?Rxp0EaGz2JC6EnZkvSxub9DP4CJvEatbuP7a/PexRITYG9OeVsd+P8FqJrnp?=
 =?us-ascii?Q?O9rTjiITGIQpDFqs/GyA3da1cdVctCFx5fBGCmKmcUtOhY4xLOGb158T4yqS?=
 =?us-ascii?Q?6OZ2ix2asVzMAQG/DQRL6NJC6qGUz+F1t3CEx+KtDvE7q9MKrgVV9MWkJgQ7?=
 =?us-ascii?Q?it6JkgU3aNJo+Gx9WPRmwk5DzfuOvKLbcY5laEXvSrlgcnZfGezjkf47dabC?=
 =?us-ascii?Q?1kEo3zB4ttjE+61D6lTn+RjRSpnnpVI+hwatEVarHsdjgW6y6h0IutNQ4Rtq?=
 =?us-ascii?Q?41YgbunK9E7BGe5joNhnrswydDaYiE8EyaQH57jZPueu+Km6fKFUm4oCZrda?=
 =?us-ascii?Q?UpFoAKL4+E8H4MW4bx6KjHOS86T1twx5HDCRO1ccDQuZsx/lCsmCPBl9XAzO?=
 =?us-ascii?Q?M/AZ9ANfIGgHoQHvuUuRz8xBHK3m3nNZRgQf1U0kFtODhA6cUQYaQf2vvsiY?=
 =?us-ascii?Q?vVXBH+QlKdMbodwvZA4dsL7dD/WtAmKNQezkgwmf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7553e49-90b4-4af7-c93b-08dd8c77bce4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 08:26:45.6851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 205axA5XidHqTbCXLiELaRgRQfy4LcH+kAEvo5s7UK/jL0S1BKSmx+7lBRhKDuADfd0c/zjAdv25tyf3TVB7/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10158
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patch set adds the following features.
1. Compared with ENETC v1, the formats of tables and command BD of ENETC
v4 have changed significantly, and the two are not compatible. Therefore,
in order to support the NETC Table Management Protocol (NTMP) v2.0, we
introduced the netc-lib driver and added support for MAC address filter
table and RSS table.
2. Add MAC filter and VLAN filter support for i.MX95 ENETC PF.
3. Add RSS support for i.MX95 ENETC PF.
4. Add loopback support for i.MX95 ENETC PF.

---
v1 Link: https://lore.kernel.org/imx/20250103060610.2233908-1-wei.fang@nxp.com/
v2 Link: https://lore.kernel.org/imx/20250113082245.2332775-1-wei.fang@nxp.com/
v3 Link: https://lore.kernel.org/imx/20250304072201.1332603-1-wei.fang@nxp.com/
v4 Link: https://lore.kernel.org/imx/20250311053830.1516523-1-wei.fang@nxp.com/
v5 Link: https://lore.kernel.org/imx/20250411095752.3072696-1-wei.fang@nxp.com/
v6 Link: https://lore.kernel.org/imx/20250428105657.3283130-1-wei.fang@nxp.com/ 
v7 changes:
1. Replace debugfs_remove_recursive() with debugfs_remove()
2. Collect tags
---

Wei Fang (14):
  net: enetc: add initial netc-lib driver to support NTMP
  net: enetc: add command BD ring support for i.MX95 ENETC
  net: enetc: move generic MAC filtering interfaces to enetc-core
  net: enetc: add MAC filtering for i.MX95 ENETC PF
  net: enetc: add debugfs interface to dump MAC filter
  net: enetc: add set/get_rss_table() hooks to enetc_si_ops
  net: enetc: make enetc_set_rss_key() reusable
  net: enetc: add RSS support for i.MX95 ENETC PF
  net: enetc: change enetc_set_rss() to void type
  net: enetc: enable RSS feature by default
  net: enetc: extract enetc_refresh_vlan_ht_filter()
  net: enetc: move generic VLAN hash filter functions to
    enetc_pf_common.c
  net: enetc: add VLAN filtering support for i.MX95 ENETC PF
  net: enetc: add loopback support for i.MX95 ENETC PF

 MAINTAINERS                                   |   1 +
 drivers/net/ethernet/freescale/enetc/Kconfig  |   8 +
 drivers/net/ethernet/freescale/enetc/Makefile |   4 +
 drivers/net/ethernet/freescale/enetc/enetc.c  |  76 ++-
 drivers/net/ethernet/freescale/enetc/enetc.h  |  45 +-
 .../ethernet/freescale/enetc/enetc4_debugfs.c |  90 ++++
 .../ethernet/freescale/enetc/enetc4_debugfs.h |  20 +
 .../net/ethernet/freescale/enetc/enetc4_hw.h  |  12 +
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 368 +++++++++++++-
 .../net/ethernet/freescale/enetc/enetc_cbdr.c |  50 ++
 .../ethernet/freescale/enetc/enetc_ethtool.c  |  74 ++-
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 105 +---
 .../net/ethernet/freescale/enetc/enetc_pf.h   |  14 +-
 .../freescale/enetc/enetc_pf_common.c         |  93 +++-
 .../freescale/enetc/enetc_pf_common.h         |   3 +
 .../net/ethernet/freescale/enetc/enetc_vf.c   |  10 +-
 drivers/net/ethernet/freescale/enetc/ntmp.c   | 462 ++++++++++++++++++
 .../ethernet/freescale/enetc/ntmp_private.h   | 103 ++++
 include/linux/fsl/ntmp.h                      | 121 +++++
 19 files changed, 1485 insertions(+), 174 deletions(-)
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc4_debugfs.h
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp.c
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp_private.h
 create mode 100644 include/linux/fsl/ntmp.h

-- 
2.34.1


