Return-Path: <linuxppc-dev+bounces-7208-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE337A6886A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 10:43:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHkLC1JvYz2yrd;
	Wed, 19 Mar 2025 20:43:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260d::61b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742377427;
	cv=pass; b=HC1z6c0omn/TLR8IupFoH9oyWC7cTYeAbj1Nuy9/ZtTMEyzTEHe4D6xnU+hzcSbo4tL2y3znX4XXodHtHB2RBnt7xYu63Eb5dr7SAeG5sPMq4UDpuVEi6yW3IthIfQXtX2l0ySmMI0uu1Cxij0+Jqqmv5fQWGfK9c3iRCaHG0gnmIWsqV+Bk1D7ZO21S0rI7jqK+ibL5jApaG5FzsEzkEJh5/fGLNEjODKl7W5+G5oOxP+ftSzNXC702rbpWE/N0z9gbAGscpkXl/c2xyA2Ntpv49NazBvjgsez6mymdsYWt4ksT87l5XXCeCclzloJ/jznNk53Inug93z50v22BkA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742377427; c=relaxed/relaxed;
	bh=TcXCagGFQ8ut9bE7HPytLiYUimd6IbBbjL2Gqiw/Xng=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=INHlj3XXy6Jp+vLrgPExezndckZQIGRuek2dvmL82Osi17PQ15Y5yki2MvImBUY5dmH5bLSHjV0b9RLLj7AZmgy7Z4rOpfqnpoZ3bnony9/y58O2gzldzx80KxIwuaKJOTGlb0VJPfKoQhvIBXVOrNbe0L5oJBTCB53PFGkPE5QBc9d/UhCzb5/fo6aMWjAZyY3dthoKMZjrtWJwBdPuHYQrIbYEKMt7MUFbSaU8+/PwN4mlx3zpjf+qDYD+tKqdvc0TaD3yQ0e1fedL2Je7Jg6UfpJW9ov0vzmhDSp6rhQnaCLAlKcM12++3uAUusHt8kR2p1CGnt3VrIc07s0qYw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=AYZdx+JI; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260d::61b; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=AYZdx+JI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260d::61b; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f403:260d::61b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHkLB3cQwz2yrr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 20:43:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUGb9jq04jVBTL2uZgKeSUWyvlfoFa5hhjrFiGubmEuYVJOYVSq3+ozgL9z0l/PqKxbJvWHnZTArvKJwuzWASMhdr2i/e45IM1yCkhw+8ZKOYojITvhtllKYbQVjABkHp4Pixjb+BECnztjvYr0LxIETYoEXfwAlTXlXYQD4gB7Kg/SeSZ0rFccgLteebVEGB+ZiZ9OZYr8gAE73UPnSn2jSSOke5Ct4wLtggXWHLlCkII9UUDinndl6kcZxWHgroxgvCwFBcjHM55Ok8x1p8BMEmj4483F5k7fHkTI3hP4zdLxLSqUC8ddHP0JjcU3pksXEk4aa3Ttcd3UajZEfwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcXCagGFQ8ut9bE7HPytLiYUimd6IbBbjL2Gqiw/Xng=;
 b=lyLRkz29StrBu66JniYdweroOvOsrKrYgWgyR3op/0ZnZY5zj6/HDj8dnsdy16HLcwQR1qeIlPWsTsqyeqj9zMmiAVtHVCoebOqwk4jDiG3hH6eweZTk9/slkXVr4RWlZOu+4BlaSm60/Cm9EvRlA0aixHJqDZa8MHGHZqzM3elubzIYE6DJYvJoEKZ70SUFWS5AMuIWsDsleLSOzPxmlTvw/Bb1B76GR0rmXaNc7JHa51+Ug/kYO1eeRGa3AOkyxOQ7IQQW8EBIWVbH24Czg5b8QRWSbvsSbfk6dtxgPSi0ZGqkAUcl20Od4wOIn3PfQTs+BDBx9jKwM8m1yRuSaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcXCagGFQ8ut9bE7HPytLiYUimd6IbBbjL2Gqiw/Xng=;
 b=AYZdx+JI8XCsxkxIjzB/ghufVEGYJRrnfO9qISLAj+ynRlJP2KmxzylcS5awG9t54T9hLc8AggA82A7jtuVSPNKrpYLni3sdj5Fc5U63hxI7/x8HGTQuPasz0uHNIevoeCtj3e4OSJrRHY3KEeYs2QdOsA2DDJjA58RsIwAIcJYxJIpRYFyktAmk8UpqAVAv/O5bVQzB5QRV09mCU3Se1xAP7GTpmVA8/VtvxcyumpIxArZwv1W4IoUnyb6TWRhndSBDgGw4I8V2z2IdfzLE+EZWlMn3XJDLVx0p8SNVmQ1VNtDKP5X4gjPJ3jy/XhjHFPOwTnOYDbUmTrBvtNsuhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS1PR04MB9261.eurprd04.prod.outlook.com (2603:10a6:20b:4c7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 09:43:27 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 09:43:27 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Stuart Yoder <stuyoder@gmail.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/3] MAINTAINERS: add myself as maintainer for the fsl-mc bus
Date: Wed, 19 Mar 2025 11:43:09 +0200
Message-Id: <20250319094311.2966519-2-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250319094311.2966519-1-ioana.ciornei@nxp.com>
References: <20250319094311.2966519-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P189CA0022.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::35)
 To AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS1PR04MB9261:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f821e52-2ba5-4944-8386-08dd66ca7fff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lBTvhbt14hpI2XiDre5f3WpRh9VdwMvVZgQvoaQkwnR8UMwU9FMq5Ofyuq+2?=
 =?us-ascii?Q?kl9Iz1/h766mV2XiJllgqnylGm1z0atZCYbkb8xedM9pl+LhmOz5c2riaMmD?=
 =?us-ascii?Q?r0hPaRjxZECahzTy++vGXyi8vtze24Qb2CpCkXK1jDy4o5UF//mIwywDAd+D?=
 =?us-ascii?Q?sQzDPSx6Ggb5r2PHwBCpHMUemomWkenO0fXogzspL2+DssVJ2W7syyWJ1bsh?=
 =?us-ascii?Q?0QDcBATYaqQH/NRuquD3Vg7tKb2E+VMacedg0ld0WFGAshCxupnhtPNzql+3?=
 =?us-ascii?Q?iQeR/ykXk7JTG8qqUOSUuLHlvyxr5CorA46lmmQL7Qr/l1LWnmvrKH8YOwCF?=
 =?us-ascii?Q?KT9oCVCgbaaY4XdRpt419k+g2dQihd2EYDtJsS2SmY/XIfI8esatYtuHKrEJ?=
 =?us-ascii?Q?paAwer6bc6VbE/H0yV2dGyalF26hwebj1Wxp+PTW1x81sFaC974z6gaWoOTc?=
 =?us-ascii?Q?A1YlSE8GduVC48ytjik+iHgQ1Qmczl1zqUcNvbtAXitqt1sKrdfTV4UqmvEC?=
 =?us-ascii?Q?rTaJ2jW/qeCasKt36jYLrCarfOnGFvR3E+85r2wnMXYCtsj3BiREv+TfLJcd?=
 =?us-ascii?Q?9mSbb+l3Nlwu1zjZPqhgFucxIfJjnL1NOhlLXF5FBiEAMXgnOKK9Ilhrbbbh?=
 =?us-ascii?Q?xZOufNROBwfm3ebpjMfkBMqXV2dJLKA7CsTdOER5k6WNojsk49hH735xmpCi?=
 =?us-ascii?Q?GkRnsWl9r7Vyp/+YyN5GFZIwp0q7KNspKzUMiPGzeZMa1XCxgtQk+M+fk8o2?=
 =?us-ascii?Q?gtiagd04GrTRWpjIAAmMfE349BhyDwyLk4DmLN3/8CbrzThP75rv63DLcQNj?=
 =?us-ascii?Q?DRaW4Uxsn1mCrA8dmnX5J6wKIJdP1esE6M1MKmR8EHJTaYU82rNHDjyCgm7l?=
 =?us-ascii?Q?4utP6doUP0rZUMX0giKnyoRe0PIQ1kpg7rSzQ6xVHuzb/xiEtbnRmbOC+zqK?=
 =?us-ascii?Q?zbwgv41/TVt4knKDfUnM8Fql8zW8428/U9s0+bnx3WbWW+qff68z+CTbVey3?=
 =?us-ascii?Q?JlcBtdqvkFdU37mn7OjkEiNlT4a0Sp+m04TsPRW4zmMH8HidCl0cHlp8I4iD?=
 =?us-ascii?Q?HlQkErY/mz0Kfl7gyqf0YJBIgIP7qTb6O8Uv8fp1qWChzoLOg0v2qncRYo1m?=
 =?us-ascii?Q?6wN2bP1SCQKScHbhsBvnUvg9dXuIevi1nJyITCc2cJSh8FyIxGgT2MfBTuNa?=
 =?us-ascii?Q?xOWjmWtLtUbsBUs4HZgZa1k6z/izC157NLaMXpQovf0yWutOg7ZqYrW/WLCG?=
 =?us-ascii?Q?K7oKgR+GS5GueBloBSGHcJkICj7Vquza2K3MskHe3/Yc0RFj1IVgOsfmNh08?=
 =?us-ascii?Q?WJPWtrFn3P9AoOp6C18mnL7ikaFKx9bQjEYImUAqn52WfL/rnmAFEEVXhlBs?=
 =?us-ascii?Q?EevcfzVRAfd+I9kCpUQ7FhCzV9Yf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6sF/dhqZKMKt6d+f5sFsBiKswCeqC+I+1KDiqPPmSha9woGcD/kKtK5jpI71?=
 =?us-ascii?Q?yecYAUxX99rBuoUA+zgTuTyu0Wv3/7O/Fxeq10ZMER9rxr+jDSQQr0UI7bIY?=
 =?us-ascii?Q?dsDaMXtpwZJgCU9xqsmNon6mjOLPsAw1NNNhYtYh8NV+fCNpjqO9cWdy5b+3?=
 =?us-ascii?Q?tkqHgb1FtRWfQPce4OeIMA6pWUdPfjSlUPKlwSDimIq+TI5HW+MpjnWelSLf?=
 =?us-ascii?Q?LqifF86zQK2UWD4tF9W2B/arvLTomfVflK7hjMuLoU6vT8auDXDlVZg0BfTe?=
 =?us-ascii?Q?w5skdOgsexu6pH9cdChiqSll7A+LP+2XGaBEFcDjfamvfRu4yr07PRlsy5Rn?=
 =?us-ascii?Q?hRN0TQVBqdS5dROn05f7jAqYAUU2S+vw8YZGjaumhFWoCJY9t1MhzSRCRpC3?=
 =?us-ascii?Q?dTmfAgvwpG1sGrh7xpWvbWlaFaLXp5ZorpN15Cziwm9YLArOUhjIGD95sEjc?=
 =?us-ascii?Q?QoACBL4XeTrSDvTNb6p8iKg/B3vdCYnzOUoO6fteIZ8qOPtjEL1peUwNEbAk?=
 =?us-ascii?Q?x5dTmfeuoRcnhO2rv6ONIf44N2aTrGLjK0HIPTOHOKZcHJNPOvrClOHAAZKX?=
 =?us-ascii?Q?T3i416pk/45Tbnsr9h5pjeIZnREUdS1oNtoYFPr10rBMnJs8UDXYym2KdQry?=
 =?us-ascii?Q?IR0p41Fjwgpoivu0r68YjZ7lPSiHlFd1ffeRG3Zodh4TR7qHCV+Fun74+pog?=
 =?us-ascii?Q?uqbTrzCiZPyKrP+CUg+Jy0WefkpM4N2ksoavqfbqXF+tRYZrmEvIKOq0TJjf?=
 =?us-ascii?Q?RhGyBgKq9DAiVEGpBT4tse6bhiQd2956ZPF+z3b434VUfJhhi8iYojraXd8U?=
 =?us-ascii?Q?GFihBhG7QXu1lShCZmzdYMCESsChlEpTzuteB45t6gGjAsR+i/4EKw39aAa9?=
 =?us-ascii?Q?NeSEr2S8gj6woPJW0RpegEnoLxSHjqs4gqV63QQXhNvG5x7f/pY1MY2RlIrB?=
 =?us-ascii?Q?cwoyrBqDsaH+GEQeuQBmbaoFzfIouN21VSQ/clrQFoDtIayslufm6mcXdMC/?=
 =?us-ascii?Q?lf3iRChAzPhtmWfy+8C0GdxxPeH3uyBTHe8lOwIttMqMJsKtz1X5r1JaHK93?=
 =?us-ascii?Q?b+B9XhZ1KyHy6HKjZJCOB/ISWZ/wDhgXvBSuaeRFyLMmMQYZgA3ks/7v+mb1?=
 =?us-ascii?Q?Em5nt99sgNpgsY2qcplAm70uP4pof+Udl81nL5uqXEo4wekj1A9OgbSeheN/?=
 =?us-ascii?Q?c5GRO39eFXihq7HDcHxYpGuQezUgRL4SoNAP+GT8grCZRsmmog68h0vIoIlw?=
 =?us-ascii?Q?M3qu28itvgcuWD58jVh6g77+q1p1C47rnzdAtGF50MtwZXz7Ux6pGia2soM3?=
 =?us-ascii?Q?xzu7bPxI9Iidd/fxz6fs6ih9NulDfSEd/cX/DxdfbXHM2ImfJ34cINFpWCxZ?=
 =?us-ascii?Q?d6uhaJmD2kMnrE4VM4ZQSbh7p9WHRLUUuibG0AqFt90K1gT1ekNPq4UKV0un?=
 =?us-ascii?Q?kGBvvUETaO9UHG6CEv/vzThizPYiHMiX4TypLCvMTNTZdzvaCmf3G5QiaPQQ?=
 =?us-ascii?Q?HopON3lwBiauXTLtpe4Yz7Jwtbr6A3C6hAK8rfbYWK7vj7nZ9Ma+GLGzAcDX?=
 =?us-ascii?Q?spxyJuSbd5gfcLRuOqN/JA1EN98C3m/Om6HYfFa4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f821e52-2ba5-4944-8386-08dd66ca7fff
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 09:43:27.4548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTFwHSDbcVM/tvp9+iFaGEUTeerFQeH/8FOXwT7lICoKZfomwkpYAL5gyUzgYH5MPCXPV1RkIQ6lwY6TrE5ofQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9261
X-Spam-Status: No, score=-0.3 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Laurentiu left the company and is no longer involved with the fsl-mc
bus. Remove him and add myself as maintainer.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ebf7fa9a814d..76b6db4074ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19633,7 +19633,7 @@ F:	include/linux/qnx6_fs.h
 
 QORIQ DPAA2 FSL-MC BUS DRIVER
 M:	Stuart Yoder <stuyoder@gmail.com>
-M:	Laurentiu Tudor <laurentiu.tudor@nxp.com>
+M:	Ioana Ciornei <ioana.ciornei@nxp.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/stable/sysfs-bus-fsl-mc
-- 
2.34.1


