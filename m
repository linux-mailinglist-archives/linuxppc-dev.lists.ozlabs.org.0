Return-Path: <linuxppc-dev+bounces-8083-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD32A9EEB3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 13:16:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmLVb2ynGz2xXP;
	Mon, 28 Apr 2025 21:16:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::608" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745838983;
	cv=pass; b=E9z6N+3xUrqguWawnNMBwrSeFiicGGqBgcK/XvpWy3e2OdCy7RNw8t9gC0tYI7Gn1+7Q4m23NWkwcHswHwGIB2fr8vM2lcqSMF3oVwh47gDVpEUg/K04rdpK/8er+/ZGfGffAKR6fQX5b6UgJcPZa8ShzrFYqCgtvG8AsOEcpSoYTaBM7DqdTz5LW6+Ww3LWNIuPhIfIGRpVTZiEr3ZsIqnFNcuGVpG5y8bTNPEMHyFBqbZ8uS0xKxITQE8eqB+vD7g5AI3cgbTg6zG8OjAe6bZvw87nh8LsnKURE27T15mLsTIMtd5t7hV19k5QGDxTOaTGfMDsu0+kD+wQyWccIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745838983; c=relaxed/relaxed;
	bh=mzB5tdyP7Dmu1+NuAyEyAWrbgRU4Pe+lRHUuxYlgVLg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BXXAI+sP9e8wOu+S42F+AVzkvF4B21odpT4RPrkYCr1A0e4JKZyzhulHPwwfHQuaKOSsMEmi9TFiM7//QvNjzUQhHzqUUTKCbiXLhpNii3DQVxHRkP76L9f42hssB5g+v7PMg5x6uYof6K0iYA+up8L5GqafsCudNSMQZ/6NnFEeIiY4wBYkWj1j2EApPPagFsYVun4IrEnfKPIYVUvLkF968HQCCld/BCywEcxz0KxQOiL5Jnlp2qu4W4Il33DeSaDfECcX6lyvkHS0QSaf76z4aWrrhlDRdJXyY9FhevdzKO08Xh8VMzfJFPsLICodhLolz3yHnFTyK3d+E2xqkg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Gn+5LaAd; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::608; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Gn+5LaAd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::608; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20608.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::608])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmLVY56xxz2xVq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 21:16:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkvv/5k0N1e/w2cycHaypOdiLt934CkbxVKN4i9wAjphUpowtEsRk4X4S6yRfbxDJieDEENGPE90p7rqWLDCVM8+0H2xqkoTP+TfhhBs18dQqir8ipdWj5vqTgqeFG/geowzx561sNQ081Y32rRSdyZ6pX9GsoKVSAdmRyxNqmuhL+jdFJJAYNcXxMyU8LDBqn84aoiN7YpBfiYFwYv3UsRX2OhnDPqQLAVhRKCJB0Ew8ZTSKHQdNnL/35bSVNVx8QqoYz48PxuwlG4TZmD+C/6vLMoMVH2LgA8EKXdrocjP+oC4oAMpmmHi5+1HnOtFhJVYoJfhu4Rx0w+57yG3Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzB5tdyP7Dmu1+NuAyEyAWrbgRU4Pe+lRHUuxYlgVLg=;
 b=B/bmtgsiJdwu3yrNVtTPX3iweH2sJLypmqMbQTn05mqYh+n4Z4Q/aNJ2IidVtu685i+qghsPFPF9BavqinALo5ZKtCjLEdyLKoI56ZaVeg32C+qWSkn69FXTZQIS1KgZq97c7JjEJ3KdCyjL0QEqBH2tQDQ9Oh5rW4R6lz8n/Wqd4gn+VEFX+mdnHUYAorsco3KM/8jcUFUBa2zH/t2i+a+uYyyjWb84oxCfMg8V8voBbrQVGHhyxxjj7gVTvkZnySUZIrzz7gPZmK9cGxl6qlpQqtzsJ5+mNQJ5vSjWfF4oq97vUyyCdBPjXie4PgwzvNUP2FaJ3/vwFDjUb5K0Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzB5tdyP7Dmu1+NuAyEyAWrbgRU4Pe+lRHUuxYlgVLg=;
 b=Gn+5LaAdmdnlDpenDWl28xpZJ+oeFUGtEmBkAdLWdc3A9OAbLwIfQWvX/LYPg5xuVkcW2qXplYOWLZKe1mDUaa900qBmsAm7d13Y3kVRTO4mj6oSgjRDswefH4pvy787hV8WZAXhY1LNlrNECs10x8Nbl7GqI6eX9lm3rO3YhlF06hM/Xcv+hPBHgSdFPumya03qea7fD/+wHV8U2E182df4o9DCalFW+Tf8PKvbG/raSNoOyMeq4yIqrC0CYBNpYGZSjg/P2ufe9l5zAraCZ+IjUK99ZXOaFNaoOkR7NiphxZs29WbHRAMfvS6vj/aSr6vTixRvN2nQLyhiHTJwfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PAXPR04MB8624.eurprd04.prod.outlook.com (2603:10a6:102:21b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 11:16:00 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8678.025; Mon, 28 Apr 2025
 11:16:00 +0000
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
Subject: [PATCH v6 net-next 01/14] net: enetc: add initial netc-lib driver to support NTMP
Date: Mon, 28 Apr 2025 18:56:44 +0800
Message-Id: <20250428105657.3283130-2-wei.fang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 107129e6-b96f-41da-ad7f-08dd86460de5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kMPMe/8sHgmIBZmBNjmLOk+zXITRPKPz1NA5FmbFL6FWMX5Apj0Ch1o+r5/8?=
 =?us-ascii?Q?Zsxf3Tx2DyusW6AYrSSrxuke46m4LSvkTTCMKHH25nDB0UHzmxcR5K6m0dhF?=
 =?us-ascii?Q?0cR6QXZYWRP1SEclV66oJB0ZcVehYntRWviuzsAFNmkVM0s3WqVaoCkpGYjt?=
 =?us-ascii?Q?sbX2cGxFckkKTGm6hTP6eSA+eu2p+Ho1pFbFi3LrDeUxLhLLdyccXBXndL93?=
 =?us-ascii?Q?XHK8ohgSt1WDA0Tos8yJ+jeUqV4Qx0BIpRGT2t7uyY5DkwM/m33iQ4V43ntx?=
 =?us-ascii?Q?7nWLMmBmxd6XMlTptL3NK4uiO5iQN7o/EvFuIddTElkyTzVnCZZ6OHloyfPt?=
 =?us-ascii?Q?GAzb2l1ZPRIsY4dm9uEFcZVJiszMJcgEXugWREvRZTL6O+kXblx4mB0VxmFI?=
 =?us-ascii?Q?QhmBKOJm6CYcrMdTbL/QMUbNuK3YoPYkEYKXhlmarYBkuqhhWVu9v1q7g0B6?=
 =?us-ascii?Q?oaP5aOyjSsAEAt1prnmmN+YCKKE9M7m5jn+tisnnRvS0f88LfT6m8a97CsDz?=
 =?us-ascii?Q?7jH5SZqqzoIBS8QPU+ahd6uTLUZPJPM4uG2rzE6Lp9gUS6tj6+zzFSaVlojF?=
 =?us-ascii?Q?uPhL1mYO0g85SNxRLLi6O0xb1RO3KSrb14kvdS/0XMZ/UzAg8IYYcV6k8JmU?=
 =?us-ascii?Q?6lHomHH3Q9rUdOkFLZ4rpYi6Hc1MMzrqGSHHPilVN2B7JGWGiuMqyJ04JJhU?=
 =?us-ascii?Q?5ExYmBUfC0r1tS9mFZBD32zSRiIUKCdeDRLyz1l6bnV/Gf2N3zwoGgokjR0m?=
 =?us-ascii?Q?GafZ5OBu7lx6RPiz5foHLfhsRNXqCLanvr+oPYbwvXbNo2gVmhMgM2ifZ0Lh?=
 =?us-ascii?Q?v3MRjSsoevWZdX8CfXlTgYrNhi11P2Q9u1BQU8zl2ohdG2PHrB7SMp62TgrP?=
 =?us-ascii?Q?irSBVEoGezn9JbSW+fSawuqmaIc5/xuFVS1VHpBFyLmVYA0UjE5eTzDoRwv/?=
 =?us-ascii?Q?0w9Jvst2atBH1aNshZnr+F7DKqJYA6JJhDr+tSdGoelwFcvazcjqaZ7WH85/?=
 =?us-ascii?Q?XAvVJKB7vLk7TnjqMkOmfOGHBkOjDw8iM4mDjhJ/mxGxoVCJX/RZGQdYu3o5?=
 =?us-ascii?Q?3NJ6ee9pU+Fc9r5uIqEUUkQuXxQWGjqk4tnizwYylb7xHeMrt4O6fsZ7P4hB?=
 =?us-ascii?Q?klR9fi6t5/2GNoA0jaVAx/9oGt+UFqBnyQmzabva764vYRTlwhGl5bcA6Lkm?=
 =?us-ascii?Q?N5E0rURO9jISZlpTO7LlapW96EdoySDEUBvgTNDa1JFyQKUOLAKfHWoeOPPB?=
 =?us-ascii?Q?e4UklFnmX/UmVm4VJd/xWaGyID5BdojLkS25sk40SNplJb4cg5FFCbHv726c?=
 =?us-ascii?Q?8S8BKDf09EOa+B7mbbLwIllsBzJTuIxL/x+1IfpA0cjvEZ02y4GmN7OfrWyl?=
 =?us-ascii?Q?5n2apBR1vOrYIEvWkmafwGkhwB7NCdzFACUYHAgono1ccneZ47f72uUAoWE7?=
 =?us-ascii?Q?cXqEDqCy3EesKa7kYf26JElzFoS+j3oQyZF9U3T7PkPHlLcm8Tw+Ow=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CQZbqfm7kGG1Bfcjh1bJp6laaSyIpC0T1twy23n0PsVouEdTOL3et57oUeiE?=
 =?us-ascii?Q?y6JWny8q9h2pwBQ7XG0901iDgy50SElipVcpxLo3zm4XKBJoLL3Xyu7Tgs+2?=
 =?us-ascii?Q?CTwcQ/Z1mfRmk+8J684OkaiXTOi2VlPUupiG7aijXpsS2nsHlr5SHFScv+ny?=
 =?us-ascii?Q?iS/bgemvMMexFhYiYUI+rZnuHyudbskDu9yzTF/uyLixdTnendmX/FQ1D5ci?=
 =?us-ascii?Q?/Q89MiO3vmLy0AePB4Wb2AOisjLYdZnWiCqTBsih/oA1PvQ8YpL7K7aRRWX/?=
 =?us-ascii?Q?FeVZ1lHVxiT4ChE1Kq7PtDbY/0KEpjKKXKroj+ZoIDvKzBiyihKGaW7XtXdt?=
 =?us-ascii?Q?ui91j1Btej6JU36rFOSuzEWeSulYYjCtkCt49FVU879r3t8PDd6SCF1O3zHZ?=
 =?us-ascii?Q?d2/W6Xbx4H9I1gBCILzzwFUxUeb6PytJjU1qo+KVC4xZziJ0kfko+IbpQqpd?=
 =?us-ascii?Q?yG+e5fn0qG9qK5ZGQ0rtqwT7aGnVLiCrJSSZfu2q1AKZOpqsg9R8C2R7fEtn?=
 =?us-ascii?Q?6bLzlicxhcOM9LSsqQGKb96tvkUAgw3oLWhthzzbRQ5t9pbTJ5M0KryhywiB?=
 =?us-ascii?Q?WMb2pP3HNhrJk1DqpUYb9WpYCOUACJHtoBW8qvol8j8e9rNYc+6YxCaoFTBP?=
 =?us-ascii?Q?h7XV0laMvm+BzF6MfGJ80nuCFj+pRJLsHu/KwdXYNqj7lKyv5roPF3ecq0U3?=
 =?us-ascii?Q?0qVl5v8ixMpVP0rv7HijTOGPxqaQ8iZDo/rqkF4dW3BB03FbrUcXzOddvvBK?=
 =?us-ascii?Q?2hdF4yu7VtQuITzwhJ7lwynYX+CbC5a1nhqcYSoM1/7wIv0mVjJ5Vl2GMg8z?=
 =?us-ascii?Q?NFVOqF+eMelJ8z5peEAahkLTF+2S02PsTXTt0Bfjv8fKm4L5AM5t3ap3WY87?=
 =?us-ascii?Q?HYC24i3BMQDaKWJVJv9x1PbBnheWh2xOEMfvMRBmOzUulDt1D/oH7HsoJfIw?=
 =?us-ascii?Q?g05BDbZpaLbNvxi+I9Vb+BKck/vpkx2AQdfcMxZehJvcdyaby3Tsd7NUyXbR?=
 =?us-ascii?Q?4CNQ6l3R3TLn6LUflWs373tnB7/HI+isM5YQQQtGJaIwbtFwScf6YiBlD7ZQ?=
 =?us-ascii?Q?x1LhQmLCg4WXg0DUbTZPBbF2e8hxfvg13TKG0j90uCqlEo8RD0P8er3jZFm/?=
 =?us-ascii?Q?mM8+00bKeBn9ltaVNwsV2LhNmTJPRiv0k/XKuN+1MGe8KrBEszyKX//jDDKH?=
 =?us-ascii?Q?1YO9Uo9//xR/FmTcBCYs8s6GoUshEPhgmRR7k72j0AoAkVkc2X+6VW3i4ARf?=
 =?us-ascii?Q?uqFrNw7FLV6kRO+G43/Kv3hSsHsoilN2fkF0T1YoT+yE8V0kjNLNRNuaXIYj?=
 =?us-ascii?Q?xIjYI1Hswvd/bdfZN5TnAZsGQys+WcQwURYUsTmAgh3FnuJoGLAp/ChLs6pb?=
 =?us-ascii?Q?LhKs13XJtx5V537wKMiA6B1y/18fiQ6I4VIM7RRJ3gQNG2qJdU4/GKnetHY0?=
 =?us-ascii?Q?RlOcrWUy4uG4tW7LKKCzTIKQlbPCPBOtIkIWAUAC5fM4Lb9f879kM5Rf0RqA?=
 =?us-ascii?Q?2z19/UK27nhF6il9HzQ2ODbi0vViJcelb/3X/kcMS+mHSpJiAxTgLxYQrC4s?=
 =?us-ascii?Q?yiHm9bDRDuSBcwqSkRwwItnpLxJcqVldkA4RhpD+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 107129e6-b96f-41da-ad7f-08dd86460de5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 11:16:00.1079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lP22s+iA8EIxdpTXjHoGo9nV65xyi2aU7ua92PMIUufAEeOB1zy7UQXjN112Efo2LgLTJx8AEVMHtKvUAy5FeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Some NETC functionality is controlled using control messages sent to the
hardware using BD ring interface with 32B descriptor similar to transmit
BD ring used on ENETC. This BD ring interface is referred to as command
BD ring. It is used to configure functionality where the underlying
resources may be shared between different entities or being too large to
configure using direct registers. Therefore, a messaging protocol called
NETC Table Management Protocol (NTMP) is provided for exchanging
configuration and management information between the software and the
hardware using the command BD ring interface.

For the management protocol of LS1028A has been retroactively named NTMP
1.0, and its implementation is in enetc_cbdr.c and enetc_qos.c. However,
NTMP of i.MX95 has been upgraded to version 2.0, which is incompatible
with LS1028A, because the message formats have been changed. Therefore,
add the netc-lib driver to support NTMP 2.0 to operate various tables.
Note that, only MAC address filter table and RSS table are supported at
the moment. More tables will be supported in subsequent patches.

It is worth mentioning that the purpose of the netc-lib driver is to
provide some NTMP-based generic interfaces for ENETC and NETC Switch
drivers. Currently, it only supports the configurations of some tables.
Interfaces such as tc flower and debugfs will be added in the future.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v5 changes:
1. Add the change of MAINTAINERS to this patch
2. Rename ntmp_fill_request_headr() to ntmp_fill_request_hdr()
3. Split ntmp_rsst_query_or_update_entry() into
ntmp_rsst_query_or_update_entry() and ntmp_rsst_query_entry()
4. Add "ntmp_" prefix to struct cmn_resp_query and cmn_req_data.
5. Remove struct common_resp_nq and netc_dev_type
6. Correct the definition of NTMP_TBL_VER
7. Remove struct netc_cbdrs and rename ntmp_priv to ntmp_user
8. Improve the error log
9. Remove NTMP_NULL_ENTRY_ID check from ntmp_delete_entry_by_id()
10. Remove netc_select_cbdr()
11. Move union netc_cbd from ntmp.h to ntmp_private.h
v6 changes:
1. Add the description of NTMP 1.0 in commit message
2. Add NETC_CBDR_DELAY_US
3. Add ntmp_table_name() and change the error log
4. Optimize the initialization of struct ntmp_dma_buf data
5. Rename netc_setup_cbdr() and netc_teardown_cbdr() to ntmp_init_cbdr()
   and ntmp_free_cbdr()
6. Remove cbdr_size for struct ntmp_user and move NETC_CBDR_BD_NUM from
   ntmp.h to ntmp_private.h
7. Remove some unused macros
---
 MAINTAINERS                                   |   1 +
 drivers/net/ethernet/freescale/enetc/Kconfig  |   8 +
 drivers/net/ethernet/freescale/enetc/Makefile |   3 +
 drivers/net/ethernet/freescale/enetc/ntmp.c   | 462 ++++++++++++++++++
 .../ethernet/freescale/enetc/ntmp_private.h   | 103 ++++
 include/linux/fsl/ntmp.h                      | 121 +++++
 6 files changed, 698 insertions(+)
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp.c
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp_private.h
 create mode 100644 include/linux/fsl/ntmp.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a7545b5abef9..56a8bb9ea4af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9375,6 +9375,7 @@ F:	Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml
 F:	drivers/net/ethernet/freescale/enetc/
 F:	include/linux/fsl/enetc_mdio.h
 F:	include/linux/fsl/netc_global.h
+F:	include/linux/fsl/ntmp.h
 
 FREESCALE eTSEC ETHERNET DRIVER (GIANFAR)
 M:	Claudiu Manoil <claudiu.manoil@nxp.com>
diff --git a/drivers/net/ethernet/freescale/enetc/Kconfig b/drivers/net/ethernet/freescale/enetc/Kconfig
index 6c2779047dcd..c8efbb6f2055 100644
--- a/drivers/net/ethernet/freescale/enetc/Kconfig
+++ b/drivers/net/ethernet/freescale/enetc/Kconfig
@@ -15,6 +15,13 @@ config NXP_ENETC_PF_COMMON
 
 	  If compiled as module (M), the module name is nxp-enetc-pf-common.
 
+config NXP_NETC_LIB
+	tristate
+	help
+	  This module provides common functionalities for both ENETC and NETC
+	  Switch, such as NETC Table Management Protocol (NTMP) 2.0, common tc
+	  flower and debugfs interfaces and so on.
+
 config FSL_ENETC
 	tristate "ENETC PF driver"
 	depends on PCI_MSI
@@ -40,6 +47,7 @@ config NXP_ENETC4
 	select FSL_ENETC_CORE
 	select FSL_ENETC_MDIO
 	select NXP_ENETC_PF_COMMON
+	select NXP_NETC_LIB
 	select PHYLINK
 	select DIMLIB
 	help
diff --git a/drivers/net/ethernet/freescale/enetc/Makefile b/drivers/net/ethernet/freescale/enetc/Makefile
index 6fd27ee4fcd1..707a68e26971 100644
--- a/drivers/net/ethernet/freescale/enetc/Makefile
+++ b/drivers/net/ethernet/freescale/enetc/Makefile
@@ -6,6 +6,9 @@ fsl-enetc-core-y := enetc.o enetc_cbdr.o enetc_ethtool.o
 obj-$(CONFIG_NXP_ENETC_PF_COMMON) += nxp-enetc-pf-common.o
 nxp-enetc-pf-common-y := enetc_pf_common.o
 
+obj-$(CONFIG_NXP_NETC_LIB) += nxp-netc-lib.o
+nxp-netc-lib-y := ntmp.o
+
 obj-$(CONFIG_FSL_ENETC) += fsl-enetc.o
 fsl-enetc-y := enetc_pf.o
 fsl-enetc-$(CONFIG_PCI_IOV) += enetc_msg.o
diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c b/drivers/net/ethernet/freescale/enetc/ntmp.c
new file mode 100644
index 000000000000..ba32c1bbd9e1
--- /dev/null
+++ b/drivers/net/ethernet/freescale/enetc/ntmp.c
@@ -0,0 +1,462 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * NETC NTMP (NETC Table Management Protocol) 2.0 Library
+ * Copyright 2025 NXP
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/fsl/netc_global.h>
+#include <linux/iopoll.h>
+
+#include "ntmp_private.h"
+
+#define NETC_CBDR_TIMEOUT		1000 /* us */
+#define NETC_CBDR_DELAY_US		10
+#define NETC_CBDR_MR_EN			BIT(31)
+
+#define NTMP_BASE_ADDR_ALIGN		128
+#define NTMP_DATA_ADDR_ALIGN		32
+
+/* Define NTMP Table ID */
+#define NTMP_MAFT_ID			1
+#define NTMP_RSST_ID			3
+
+/* Generic Update Actions for most tables */
+#define NTMP_GEN_UA_CFGEU		BIT(0)
+#define NTMP_GEN_UA_STSEU		BIT(1)
+
+#define NTMP_ENTRY_ID_SIZE		4
+#define RSST_ENTRY_NUM			64
+#define RSST_STSE_DATA_SIZE(n)		((n) * 8)
+#define RSST_CFGE_DATA_SIZE(n)		(n)
+
+int ntmp_init_cbdr(struct netc_cbdr *cbdr, struct device *dev,
+		   const struct netc_cbdr_regs *regs)
+{
+	int cbd_num = NETC_CBDR_BD_NUM;
+	size_t size;
+
+	size = cbd_num * sizeof(union netc_cbd) + NTMP_BASE_ADDR_ALIGN;
+	cbdr->addr_base = dma_alloc_coherent(dev, size, &cbdr->dma_base,
+					     GFP_KERNEL);
+	if (!cbdr->addr_base)
+		return -ENOMEM;
+
+	cbdr->dma_size = size;
+	cbdr->bd_num = cbd_num;
+	cbdr->regs = *regs;
+	cbdr->dev = dev;
+
+	/* The base address of the Control BD Ring must be 128 bytes aligned */
+	cbdr->dma_base_align =  ALIGN(cbdr->dma_base,  NTMP_BASE_ADDR_ALIGN);
+	cbdr->addr_base_align = PTR_ALIGN(cbdr->addr_base,
+					  NTMP_BASE_ADDR_ALIGN);
+
+	cbdr->next_to_clean = 0;
+	cbdr->next_to_use = 0;
+	spin_lock_init(&cbdr->ring_lock);
+
+	/* Step 1: Configure the base address of the Control BD Ring */
+	netc_write(cbdr->regs.bar0, lower_32_bits(cbdr->dma_base_align));
+	netc_write(cbdr->regs.bar1, upper_32_bits(cbdr->dma_base_align));
+
+	/* Step 2: Configure the producer index register */
+	netc_write(cbdr->regs.pir, cbdr->next_to_clean);
+
+	/* Step 3: Configure the consumer index register */
+	netc_write(cbdr->regs.cir, cbdr->next_to_use);
+
+	/* Step4: Configure the number of BDs of the Control BD Ring */
+	netc_write(cbdr->regs.lenr, cbdr->bd_num);
+
+	/* Step 5: Enable the Control BD Ring */
+	netc_write(cbdr->regs.mr, NETC_CBDR_MR_EN);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ntmp_init_cbdr);
+
+void ntmp_free_cbdr(struct netc_cbdr *cbdr)
+{
+	/* Disable the Control BD Ring */
+	netc_write(cbdr->regs.mr, 0);
+	dma_free_coherent(cbdr->dev, cbdr->dma_size, cbdr->addr_base,
+			  cbdr->dma_base);
+	memset(cbdr, 0, sizeof(*cbdr));
+}
+EXPORT_SYMBOL_GPL(ntmp_free_cbdr);
+
+static int ntmp_get_free_cbd_num(struct netc_cbdr *cbdr)
+{
+	return (cbdr->next_to_clean - cbdr->next_to_use - 1 +
+		cbdr->bd_num) % cbdr->bd_num;
+}
+
+static union netc_cbd *ntmp_get_cbd(struct netc_cbdr *cbdr, int index)
+{
+	return &((union netc_cbd *)(cbdr->addr_base_align))[index];
+}
+
+static void ntmp_clean_cbdr(struct netc_cbdr *cbdr)
+{
+	union netc_cbd *cbd;
+	int i;
+
+	i = cbdr->next_to_clean;
+	while (netc_read(cbdr->regs.cir) != i) {
+		cbd = ntmp_get_cbd(cbdr, i);
+		memset(cbd, 0, sizeof(*cbd));
+		i = (i + 1) % cbdr->bd_num;
+	}
+
+	cbdr->next_to_clean = i;
+}
+
+static int netc_xmit_ntmp_cmd(struct ntmp_user *user, union netc_cbd *cbd)
+{
+	union netc_cbd *cur_cbd;
+	struct netc_cbdr *cbdr;
+	int i, err;
+	u16 status;
+	u32 val;
+
+	/* Currently only i.MX95 ENETC is supported, and it only has one
+	 * command BD ring
+	 */
+	cbdr = &user->ring[0];
+
+	spin_lock_bh(&cbdr->ring_lock);
+
+	if (unlikely(!ntmp_get_free_cbd_num(cbdr)))
+		ntmp_clean_cbdr(cbdr);
+
+	i = cbdr->next_to_use;
+	cur_cbd = ntmp_get_cbd(cbdr, i);
+	*cur_cbd = *cbd;
+	dma_wmb();
+
+	/* Update producer index of both software and hardware */
+	i = (i + 1) % cbdr->bd_num;
+	cbdr->next_to_use = i;
+	netc_write(cbdr->regs.pir, i);
+
+	err = read_poll_timeout_atomic(netc_read, val, val == i,
+				       NETC_CBDR_DELAY_US, NETC_CBDR_TIMEOUT,
+				       true, cbdr->regs.cir);
+	if (unlikely(err))
+		goto cbdr_unlock;
+
+	dma_rmb();
+	/* Get the writeback command BD, because the caller may need
+	 * to check some other fields of the response header.
+	 */
+	*cbd = *cur_cbd;
+
+	/* Check the writeback error status */
+	status = le16_to_cpu(cbd->resp_hdr.error_rr) & NTMP_RESP_ERROR;
+	if (unlikely(status)) {
+		err = -EIO;
+		dev_err(user->dev, "Command BD error: 0x%04x\n", status);
+	}
+
+	ntmp_clean_cbdr(cbdr);
+	dma_wmb();
+
+cbdr_unlock:
+	spin_unlock_bh(&cbdr->ring_lock);
+
+	return err;
+}
+
+static int ntmp_alloc_data_mem(struct ntmp_dma_buf *data, void **buf_align)
+{
+	void *buf;
+
+	buf = dma_alloc_coherent(data->dev, data->size + NTMP_DATA_ADDR_ALIGN,
+				 &data->dma, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	data->buf = buf;
+	*buf_align = PTR_ALIGN(buf, NTMP_DATA_ADDR_ALIGN);
+
+	return 0;
+}
+
+static void ntmp_free_data_mem(struct ntmp_dma_buf *data)
+{
+	dma_free_coherent(data->dev, data->size + NTMP_DATA_ADDR_ALIGN,
+			  data->buf, data->dma);
+}
+
+static void ntmp_fill_request_hdr(union netc_cbd *cbd, dma_addr_t dma,
+				  int len, int table_id, int cmd,
+				  int access_method)
+{
+	dma_addr_t dma_align;
+
+	memset(cbd, 0, sizeof(*cbd));
+	dma_align = ALIGN(dma, NTMP_DATA_ADDR_ALIGN);
+	cbd->req_hdr.addr = cpu_to_le64(dma_align);
+	cbd->req_hdr.len = cpu_to_le32(len);
+	cbd->req_hdr.cmd = cmd;
+	cbd->req_hdr.access_method = FIELD_PREP(NTMP_ACCESS_METHOD,
+						access_method);
+	cbd->req_hdr.table_id = table_id;
+	cbd->req_hdr.ver_cci_rr = FIELD_PREP(NTMP_HDR_VERSION,
+					     NTMP_HDR_VER2);
+	/* For NTMP version 2.0 or later version */
+	cbd->req_hdr.npf = cpu_to_le32(NTMP_NPF);
+}
+
+static void ntmp_fill_crd(struct ntmp_cmn_req_data *crd, u8 tblv,
+			  u8 qa, u16 ua)
+{
+	crd->update_act = cpu_to_le16(ua);
+	crd->tblv_qact = NTMP_TBLV_QACT(tblv, qa);
+}
+
+static void ntmp_fill_crd_eid(struct ntmp_req_by_eid *rbe, u8 tblv,
+			      u8 qa, u16 ua, u32 entry_id)
+{
+	ntmp_fill_crd(&rbe->crd, tblv, qa, ua);
+	rbe->entry_id = cpu_to_le32(entry_id);
+}
+
+static const char *ntmp_table_name(int tbl_id)
+{
+	switch (tbl_id) {
+	case NTMP_MAFT_ID:
+		return "MAC Address Filter Table";
+	case NTMP_RSST_ID:
+		return "RSS Table";
+	default:
+		return "Unknown Table";
+	};
+}
+
+static int ntmp_delete_entry_by_id(struct ntmp_user *user, int tbl_id,
+				   u8 tbl_ver, u32 entry_id, u32 req_len,
+				   u32 resp_len)
+{
+	struct ntmp_dma_buf data = {
+		.dev = user->dev,
+		.size = max(req_len, resp_len),
+	};
+	struct ntmp_req_by_eid *req;
+	union netc_cbd cbd;
+	int err;
+
+	err = ntmp_alloc_data_mem(&data, (void **)&req);
+	if (err)
+		return err;
+
+	ntmp_fill_crd_eid(req, tbl_ver, 0, 0, entry_id);
+	ntmp_fill_request_hdr(&cbd, data.dma, NTMP_LEN(req_len, resp_len),
+			      tbl_id, NTMP_CMD_DELETE, NTMP_AM_ENTRY_ID);
+
+	err = netc_xmit_ntmp_cmd(user, &cbd);
+	if (err)
+		dev_err(user->dev,
+			"Failed to delete entry 0x%x of %s, err: %pe",
+			entry_id, ntmp_table_name(tbl_id), ERR_PTR(err));
+
+	ntmp_free_data_mem(&data);
+
+	return err;
+}
+
+static int ntmp_query_entry_by_id(struct ntmp_user *user, int tbl_id,
+				  u32 len, struct ntmp_req_by_eid *req,
+				  dma_addr_t dma, bool compare_eid)
+{
+	struct ntmp_cmn_resp_query *resp;
+	int cmd = NTMP_CMD_QUERY;
+	union netc_cbd cbd;
+	u32 entry_id;
+	int err;
+
+	entry_id = le32_to_cpu(req->entry_id);
+	if (le16_to_cpu(req->crd.update_act))
+		cmd = NTMP_CMD_QU;
+
+	/* Request header */
+	ntmp_fill_request_hdr(&cbd, dma, len, tbl_id, cmd, NTMP_AM_ENTRY_ID);
+	err = netc_xmit_ntmp_cmd(user, &cbd);
+	if (err) {
+		dev_err(user->dev,
+			"Failed to query entry 0x%x of %s, err: %pe\n",
+			entry_id, ntmp_table_name(tbl_id), ERR_PTR(err));
+		return err;
+	}
+
+	/* For a few tables, the first field of their response data is not
+	 * entry_id, so directly return success.
+	 */
+	if (!compare_eid)
+		return 0;
+
+	resp = (struct ntmp_cmn_resp_query *)req;
+	if (unlikely(le32_to_cpu(resp->entry_id) != entry_id)) {
+		dev_err(user->dev,
+			"%s: query EID 0x%x doesn't match response EID 0x%x\n",
+			ntmp_table_name(tbl_id), entry_id, le32_to_cpu(resp->entry_id));
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int ntmp_maft_add_entry(struct ntmp_user *user, u32 entry_id,
+			struct maft_entry_data *maft)
+{
+	struct ntmp_dma_buf data = {
+		.dev = user->dev,
+		.size = sizeof(struct maft_req_add),
+	};
+	struct maft_req_add *req;
+	union netc_cbd cbd;
+	int err;
+
+	err = ntmp_alloc_data_mem(&data, (void **)&req);
+	if (err)
+		return err;
+
+	/* Set mac address filter table request data buffer */
+	ntmp_fill_crd_eid(&req->rbe, user->tbl.maft_ver, 0, 0, entry_id);
+	req->keye = maft->keye;
+	req->cfge = maft->cfge;
+
+	ntmp_fill_request_hdr(&cbd, data.dma, NTMP_LEN(data.size, 0),
+			      NTMP_MAFT_ID, NTMP_CMD_ADD, NTMP_AM_ENTRY_ID);
+	err = netc_xmit_ntmp_cmd(user, &cbd);
+	if (err)
+		dev_err(user->dev, "Failed to add MAFT entry 0x%x, err: %pe\n",
+			entry_id, ERR_PTR(err));
+
+	ntmp_free_data_mem(&data);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_maft_add_entry);
+
+int ntmp_maft_query_entry(struct ntmp_user *user, u32 entry_id,
+			  struct maft_entry_data *maft)
+{
+	struct ntmp_dma_buf data = {
+		.dev = user->dev,
+		.size = sizeof(struct maft_resp_query),
+	};
+	struct maft_resp_query *resp;
+	struct ntmp_req_by_eid *req;
+	int err;
+
+	err = ntmp_alloc_data_mem(&data, (void **)&req);
+	if (err)
+		return err;
+
+	ntmp_fill_crd_eid(req, user->tbl.maft_ver, 0, 0, entry_id);
+	err = ntmp_query_entry_by_id(user, NTMP_MAFT_ID,
+				     NTMP_LEN(sizeof(*req), data.size),
+				     req, data.dma, true);
+	if (err)
+		goto end;
+
+	resp = (struct maft_resp_query *)req;
+	maft->keye = resp->keye;
+	maft->cfge = resp->cfge;
+
+end:
+	ntmp_free_data_mem(&data);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_maft_query_entry);
+
+int ntmp_maft_delete_entry(struct ntmp_user *user, u32 entry_id)
+{
+	return ntmp_delete_entry_by_id(user, NTMP_MAFT_ID, user->tbl.maft_ver,
+				       entry_id, NTMP_EID_REQ_LEN, 0);
+}
+EXPORT_SYMBOL_GPL(ntmp_maft_delete_entry);
+
+int ntmp_rsst_update_entry(struct ntmp_user *user, const u32 *table,
+			   int count)
+{
+	struct ntmp_dma_buf data = {.dev = user->dev};
+	struct rsst_req_update *req;
+	union netc_cbd cbd;
+	int err, i;
+
+	if (count != RSST_ENTRY_NUM)
+		/* HW only takes in a full 64 entry table */
+		return -EINVAL;
+
+	data.size = struct_size(req, groups, count);
+	err = ntmp_alloc_data_mem(&data, (void **)&req);
+	if (err)
+		return err;
+
+	/* Set the request data buffer */
+	ntmp_fill_crd_eid(&req->rbe, user->tbl.rsst_ver, 0,
+			  NTMP_GEN_UA_CFGEU | NTMP_GEN_UA_STSEU, 0);
+	for (i = 0; i < count; i++)
+		req->groups[i] = (u8)(table[i]);
+
+	ntmp_fill_request_hdr(&cbd, data.dma, NTMP_LEN(data.size, 0),
+			      NTMP_RSST_ID, NTMP_CMD_UPDATE, NTMP_AM_ENTRY_ID);
+
+	err = netc_xmit_ntmp_cmd(user, &cbd);
+	if (err)
+		dev_err(user->dev, "Failed to update RSST entry, err: %pe\n",
+			ERR_PTR(err));
+
+	ntmp_free_data_mem(&data);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_rsst_update_entry);
+
+int ntmp_rsst_query_entry(struct ntmp_user *user, u32 *table, int count)
+{
+	struct ntmp_dma_buf data = {.dev = user->dev};
+	struct ntmp_req_by_eid *req;
+	union netc_cbd cbd;
+	int err, i;
+	u8 *group;
+
+	if (count != RSST_ENTRY_NUM)
+		/* HW only takes in a full 64 entry table */
+		return -EINVAL;
+
+	data.size = NTMP_ENTRY_ID_SIZE + RSST_STSE_DATA_SIZE(count) +
+		    RSST_CFGE_DATA_SIZE(count);
+	err = ntmp_alloc_data_mem(&data, (void **)&req);
+	if (err)
+		return err;
+
+	/* Set the request data buffer */
+	ntmp_fill_crd_eid(req, user->tbl.rsst_ver, 0, 0, 0);
+	ntmp_fill_request_hdr(&cbd, data.dma, NTMP_LEN(sizeof(*req), data.size),
+			      NTMP_RSST_ID, NTMP_CMD_QUERY, NTMP_AM_ENTRY_ID);
+	err = netc_xmit_ntmp_cmd(user, &cbd);
+	if (err) {
+		dev_err(user->dev, "Failed to query RSST entry, err: %pe\n",
+			ERR_PTR(err));
+		goto end;
+	}
+
+	group = (u8 *)req;
+	group += NTMP_ENTRY_ID_SIZE + RSST_STSE_DATA_SIZE(count);
+	for (i = 0; i < count; i++)
+		table[i] = group[i];
+
+end:
+	ntmp_free_data_mem(&data);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(ntmp_rsst_query_entry);
+
+MODULE_DESCRIPTION("NXP NETC Library");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/ethernet/freescale/enetc/ntmp_private.h b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
new file mode 100644
index 000000000000..685b388e7ddf
--- /dev/null
+++ b/drivers/net/ethernet/freescale/enetc/ntmp_private.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * NTMP table request and response data buffer formats
+ * Copyright 2025 NXP
+ */
+
+#ifndef __NTMP_PRIVATE_H
+#define __NTMP_PRIVATE_H
+
+#include <linux/fsl/ntmp.h>
+
+#define NTMP_EID_REQ_LEN	8
+#define NETC_CBDR_BD_NUM	256
+
+union netc_cbd {
+	struct {
+		__le64 addr;
+		__le32 len;
+#define NTMP_RESP_LEN		GENMASK(19, 0)
+#define NTMP_REQ_LEN		GENMASK(31, 20)
+#define NTMP_LEN(req, resp)	(FIELD_PREP(NTMP_REQ_LEN, (req)) | \
+				((resp) & NTMP_RESP_LEN))
+		u8 cmd;
+#define NTMP_CMD_DELETE		BIT(0)
+#define NTMP_CMD_UPDATE		BIT(1)
+#define NTMP_CMD_QUERY		BIT(2)
+#define NTMP_CMD_ADD		BIT(3)
+#define NTMP_CMD_QU		(NTMP_CMD_QUERY | NTMP_CMD_UPDATE)
+		u8 access_method;
+#define NTMP_ACCESS_METHOD	GENMASK(7, 4)
+#define NTMP_AM_ENTRY_ID	0
+#define NTMP_AM_EXACT_KEY	1
+#define NTMP_AM_SEARCH		2
+#define NTMP_AM_TERNARY_KEY	3
+		u8 table_id;
+		u8 ver_cci_rr;
+#define NTMP_HDR_VERSION	GENMASK(5, 0)
+#define NTMP_HDR_VER2		2
+#define NTMP_CCI		BIT(6)
+#define NTMP_RR			BIT(7)
+		__le32 resv[3];
+		__le32 npf;
+#define NTMP_NPF		BIT(15)
+	} req_hdr;	/* NTMP Request Message Header Format */
+
+	struct {
+		__le32 resv0[3];
+		__le16 num_matched;
+		__le16 error_rr;
+#define NTMP_RESP_ERROR		GENMASK(11, 0)
+#define NTMP_RESP_RR		BIT(15)
+		__le32 resv1[4];
+	} resp_hdr; /* NTMP Response Message Header Format */
+};
+
+struct ntmp_dma_buf {
+	struct device *dev;
+	size_t size;
+	void *buf;
+	dma_addr_t dma;
+};
+
+struct ntmp_cmn_req_data {
+	__le16 update_act;
+	u8 dbg_opt;
+	u8 tblv_qact;
+#define NTMP_QUERY_ACT		GENMASK(3, 0)
+#define NTMP_TBL_VER		GENMASK(7, 4)
+#define NTMP_TBLV_QACT(v, a)	(FIELD_PREP(NTMP_TBL_VER, (v)) | \
+				 ((a) & NTMP_QUERY_ACT))
+};
+
+struct ntmp_cmn_resp_query {
+	__le32 entry_id;
+};
+
+/* Generic structure for request data by entry ID  */
+struct ntmp_req_by_eid {
+	struct ntmp_cmn_req_data crd;
+	__le32 entry_id;
+};
+
+/* MAC Address Filter Table Request Data Buffer Format of Add action */
+struct maft_req_add {
+	struct ntmp_req_by_eid rbe;
+	struct maft_keye_data keye;
+	struct maft_cfge_data cfge;
+};
+
+/* MAC Address Filter Table Response Data Buffer Format of Query action */
+struct maft_resp_query {
+	__le32 entry_id;
+	struct maft_keye_data keye;
+	struct maft_cfge_data cfge;
+};
+
+/* RSS Table Request Data Buffer Format of Update action */
+struct rsst_req_update {
+	struct ntmp_req_by_eid rbe;
+	u8 groups[];
+};
+
+#endif
diff --git a/include/linux/fsl/ntmp.h b/include/linux/fsl/ntmp.h
new file mode 100644
index 000000000000..916dc4fe7de3
--- /dev/null
+++ b/include/linux/fsl/ntmp.h
@@ -0,0 +1,121 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/* Copyright 2025 NXP */
+#ifndef __NETC_NTMP_H
+#define __NETC_NTMP_H
+
+#include <linux/bitops.h>
+#include <linux/if_ether.h>
+
+struct maft_keye_data {
+	u8 mac_addr[ETH_ALEN];
+	__le16 resv;
+};
+
+struct maft_cfge_data {
+	__le16 si_bitmap;
+	__le16 resv;
+};
+
+struct netc_cbdr_regs {
+	void __iomem *pir;
+	void __iomem *cir;
+	void __iomem *mr;
+
+	void __iomem *bar0;
+	void __iomem *bar1;
+	void __iomem *lenr;
+};
+
+struct netc_tbl_vers {
+	u8 maft_ver;
+	u8 rsst_ver;
+};
+
+struct netc_cbdr {
+	struct device *dev;
+	struct netc_cbdr_regs regs;
+
+	int bd_num;
+	int next_to_use;
+	int next_to_clean;
+
+	int dma_size;
+	void *addr_base;
+	void *addr_base_align;
+	dma_addr_t dma_base;
+	dma_addr_t dma_base_align;
+
+	/* Serialize the order of command BD ring */
+	spinlock_t ring_lock;
+};
+
+struct ntmp_user {
+	int cbdr_num;	/* number of control BD ring */
+	struct device *dev;
+	struct netc_cbdr *ring;
+	struct netc_tbl_vers tbl;
+};
+
+struct maft_entry_data {
+	struct maft_keye_data keye;
+	struct maft_cfge_data cfge;
+};
+
+#if IS_ENABLED(CONFIG_NXP_NETC_LIB)
+int ntmp_init_cbdr(struct netc_cbdr *cbdr, struct device *dev,
+		   const struct netc_cbdr_regs *regs);
+void ntmp_free_cbdr(struct netc_cbdr *cbdr);
+
+/* NTMP APIs */
+int ntmp_maft_add_entry(struct ntmp_user *user, u32 entry_id,
+			struct maft_entry_data *maft);
+int ntmp_maft_query_entry(struct ntmp_user *user, u32 entry_id,
+			  struct maft_entry_data *maft);
+int ntmp_maft_delete_entry(struct ntmp_user *user, u32 entry_id);
+int ntmp_rsst_update_entry(struct ntmp_user *user, const u32 *table,
+			   int count);
+int ntmp_rsst_query_entry(struct ntmp_user *user,
+			  u32 *table, int count);
+#else
+static inline int ntmp_init_cbdr(struct netc_cbdr *cbdr, struct device *dev,
+				 const struct netc_cbdr_regs *regs)
+{
+	return 0;
+}
+
+static inline void ntmp_free_cbdr(struct netc_cbdr *cbdr)
+{
+}
+
+static inline int ntmp_maft_add_entry(struct ntmp_user *user, u32 entry_id,
+				      struct maft_entry_data *maft)
+{
+	return 0;
+}
+
+static inline int ntmp_maft_query_entry(struct ntmp_user *user, u32 entry_id,
+					struct maft_entry_data *maft)
+{
+	return 0;
+}
+
+static inline int ntmp_maft_delete_entry(struct ntmp_user *user, u32 entry_id)
+{
+	return 0;
+}
+
+static inline int ntmp_rsst_update_entry(struct ntmp_user *user,
+					 const u32 *table, int count)
+{
+	return 0;
+}
+
+static inline int ntmp_rsst_query_entry(struct ntmp_user *user,
+					u32 *table, int count)
+{
+	return 0;
+}
+
+#endif
+
+#endif
-- 
2.34.1


