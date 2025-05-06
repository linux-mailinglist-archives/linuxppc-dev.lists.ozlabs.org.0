Return-Path: <linuxppc-dev+bounces-8329-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87828AABD17
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 10:27:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsBMg39bjz2yLT;
	Tue,  6 May 2025 18:27:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::627" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746520031;
	cv=pass; b=PsG0w9LgxF5r+DtBMnAbl9nfOeqc9hf61Fjg0GEhX2770R/wPrvvPcsHw8TbcRUWBIqfHqgeFyH/D0iC10X6WJOC4JLtCNKcaBCCWodvl2JFxxgnIfThbkzsAPxFNkJ9j8scU2Va185zzD5jodDltcH34LhfMFA2yfyFkSyjM4Of85YPYARk7tvF/hodXXAgxTlDrEKzBGGy31HohCwMFLo6xn7ifPH7bK9fK1eeL1CNZ7qFx/xHjrbD1vF4CmVVBoOrISTDpn1o6guA+e+Tz/9yyjH6hnafzrAYbRGVAWQsycBbP9Ivi4FqS9vOeJyC3YWvuODjDThTlEdSvBQ8Yw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746520031; c=relaxed/relaxed;
	bh=i/odfEfjUHvhtPmxnljS+R+R3bdwO+XRRJG1nHEYOgE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bbkeGm9Se4agJfn1vLHXExbvQIDkdjpY7jgJQ2DuawgViKmx+oEKMNNXhjeVpr0qLGRDbYtO9tGF1IElwQNUcxQeeGmKiHX2yfJa6iP+0lP+ljQJDmDVrgL+RrWwnXYKaRcidvuTF/C55G7TLAY3OX2+mNqiQud5h23hcjxmxaEZJ/klQ3Y7wlQLC1SskCSQ8ykPjIq4Qej8V6PafdVF5W2p7GtBTI8A/LU0tnqeXjvW0OEwDL2HCF+Zl3ABkGHZOIubEDEUebclVr75wmnm3/GNyMqyfEjQQSpp2C2ZhsjtSD/55uEYLgk/nqmUH5H76WMg//Mlwq83rcvoZw1FMA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=cCZWBBvS; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::627; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=cCZWBBvS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::627; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20627.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::627])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsBMf0VlSz2ySl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 18:27:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJOtFbwA7/nITlki56wntYJ8FKDQZ3uiVzCkpyW8HNXW8qDCWCzNKPMbrZ7Levm1RRCVB67Kp9XqsX2i9dcodVm1f1lNyKQ645jHpG01Dk5kK/FiNFdsAmweKlb8hyt+Hx+CoEpF2KZz40e7sTjQMfC6RARdoZLEZVHJH6c1cPrxHlLwEJ+C1g/Xr8xTgdjKD2fmjKPKtFzrk9Psk29Mp+eFIddl5yBi2Tr165KdVG0fmi/hoVOCX6ti9kM6yvpTX6M99MAmBLAAiuJt40bW2MOT14IK6PC0IM98iidNEDNGyIhIdCZuhF+NQCNcok8765h2/olDCTZXtHc0sOLgCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/odfEfjUHvhtPmxnljS+R+R3bdwO+XRRJG1nHEYOgE=;
 b=ciQ7HhL9Ke5Wzn6KJNjrniAV32R70lCNQTWVij3sLhK8Z+Z/gdiAC1tTwdk/wlBB1kheHeBm8WTEIpsHcssuU1BVZ5S4/+GqE7iuzueIY/r+hWcM+iUGYJFkkXOhuiuEoN1php9gk9ecwFhfQDhui0yhyHomZQCVV9NDpR4+tbLS/9lJ+A7YssxxW5SUdZof7RjyUSuEN37qmc/AevPBUU9L3EagyfXFliQZSzAi5LOnPXDftnIvu1Ag4P9uXxfAdp3dYKkbmVr9aV1MrcXfqwrN5gqAE+hFCkYfDxis6H22cTNgvcvnFDMO8RNfGQSN5pMRxZsmDqOZCW7dDfbUmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/odfEfjUHvhtPmxnljS+R+R3bdwO+XRRJG1nHEYOgE=;
 b=cCZWBBvSIy9JC7GH9HJq8d3cZL6Do17x3cs/fWaS/yBS/o9n4KcM7NKP7JCxAn9xhDav1sPi5B960MF/4CwOc4oA/wGl+/XQRm1Cpfiof/FidRLKKmnLDWOliGyN+oIzpVlOk5sHdH0Z5vem3Qlaz1C7yYyKE26ixA45HvN6N6M6gvvdYtg44VqPHKqgLepJcQrxlX/NBr3b2cUVYNpq23GtL3Cjli9ePuLahuYAK7GoVpzsgUHdpwxcW+0cti/5yYru4HiolchmguTRl3YSReLZLTDABa23LDnjj+feYpxhRnbf5wufgX7W9eezuu1MxYOYZkH/OseUc4yQevpjpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PA2PR04MB10158.eurprd04.prod.outlook.com (2603:10a6:102:404::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 08:26:56 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 08:26:55 +0000
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
Subject: [PATCH v7 net-next 02/14] net: enetc: add command BD ring support for i.MX95 ENETC
Date: Tue,  6 May 2025 16:07:23 +0800
Message-Id: <20250506080735.3444381-3-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506080735.3444381-1-wei.fang@nxp.com>
References: <20250506080735.3444381-1-wei.fang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3754aa3f-0b64-4991-2bed-08dd8c77c2ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8gmpWiQ9xThkS0D//wkIz4ov5QmZxL7yleYquqmBpt/suEVDztg0XrH0+dKY?=
 =?us-ascii?Q?CD0LCxFZZX/DfOzKftL0EVniGbmOfhqCdiiAP2Z6n7BHABY2M4Iooh+vsRzv?=
 =?us-ascii?Q?xY9+MbWNOzegIejK5fHfTCSgxM1m6y63pRwWauK2TlVCFMOsTPwRcw1h8kcN?=
 =?us-ascii?Q?JsDiIL+KMCikLf0VJpsms0wervADfDTJ3IuhZEfLWDrrIaaaOHWv5ZuwHa/3?=
 =?us-ascii?Q?cQddTVn7EeBv2hcbuecUCOVv5KVprYbu4VKJEqE8gWtLmcvnfyqZ9FMRPjyt?=
 =?us-ascii?Q?Jx/EY1gc/SFvKLJIM+gRVSyhwugaVmKsAaLFkixSiq7RqwoECvP7BD7uJVTA?=
 =?us-ascii?Q?0SrsMNjl3jRovIEqNhsMgk71WYhz7/79+IQttT3F46xPvFGIHiaGgVU1rSAt?=
 =?us-ascii?Q?yEQ98TQHm4ugirbal4GIe56ucpNDzhrD4r/a8dCl+USVQlBOLvMv8Bg0jPRR?=
 =?us-ascii?Q?Uzba8ly82TScPRcXgeYhogLWDbKC+I1W97eVNSapPXtkGJs+ijPrZPL9eFhw?=
 =?us-ascii?Q?BAvesX6Rdgkis0nAob1Fo+hVFx5kNmA/xt/hnJ0OU4kcM/oJG7mbughiKyKx?=
 =?us-ascii?Q?lW3B1BNURwWCnsa5W9ijemcS1T7y/BLP6FCUGr/noh7ISJGUzZTiruXqog0G?=
 =?us-ascii?Q?bpFExR9OZTTlS3+0OzhszyGEeOsQ/DIRKS1OynsciSePP27Hx9b6Eldc/Xx7?=
 =?us-ascii?Q?lcl7eTVuq7uYBUKCkxw6d29pg83xPgsFFLmI9LfdgqdmY03IaP90v2XCMm9I?=
 =?us-ascii?Q?rdzkeCryoTiagQSB0fNkELbIjbVBQErNH9SvnxT3bEglnR8aVOThexja7B4I?=
 =?us-ascii?Q?5H9edVA0n2L1SsH/qOa45nu2IdGyxeQ88Z+94mPNLZar02J0qpCu/k9VzVc4?=
 =?us-ascii?Q?UvuApduNiDEFeqpk0cQqZ5QLiofBw85Mt2RafnoS6re5JOk4UgEgdKtBtQt9?=
 =?us-ascii?Q?XF5ZwicfcNv2P2ce0SJthwjquUUque5SXZZD1r7N1OIa8xxRVbLdLZoTL+HH?=
 =?us-ascii?Q?xEwJXs4oL4h1kp80sfn48nQu0QnSyv1d6D623tmmTvYyyF2bwKK+IpLED9Mp?=
 =?us-ascii?Q?806l4UnJgGfYneCSBAr3iymxnV+YCas/VC3R5xXQehvIcSUmdPatjw0lfGRW?=
 =?us-ascii?Q?HonrnKP8sAzSI66d3EXYqozCv6jBQbil9pM67IRjYoKcisb/NQdHcRclciDI?=
 =?us-ascii?Q?XhUdz+h8yNMhRKCUNexJRPKYWpUdL7r1jApJN6ayX9OG+qFwM0q7l5bzR6ot?=
 =?us-ascii?Q?297n3m44h3geXv6q1hG2YfzQl2qSEeMrzOpjE5Q3guj5QtrIsOBpwyzv+qVJ?=
 =?us-ascii?Q?TCnR6Wl8xEpjfKUQNpVJ36UKSPosm7FTmPj9bW7Lli3FhtMMvI0EffzI5fRo?=
 =?us-ascii?Q?ek6wh/Urn524SxO5BKezqJLZcJkz1FZuUpMy0PAwQn/PJxchdALaMhfjIymP?=
 =?us-ascii?Q?GIUQEt1Ss++Lp+PlzV4EoyOq6WcbvhEDapOCLvnqnm+ysiBlihA7lQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rDKcfq/W23ElosqOtjYO3L4KtxBFGF2aB5OFw1LO05AkACEy/GQEdJrBtxpf?=
 =?us-ascii?Q?XC4gAvtcWb1F8dqih4pqgMVBTcdNaUFwVC3veJVtYc9zOJbH7U0nritCLSl7?=
 =?us-ascii?Q?tn31U0CFuxko8zUGxbp51mY4dwu7A2Agdgsa0lopICSoNxEWtVF/Spxrox+q?=
 =?us-ascii?Q?0Lg3PTGq+qy8QSo4FSodeO2wfQZU4yi+/HrBTPaXWAAXHdlYT1uHwCCgmEIu?=
 =?us-ascii?Q?snIaJ10gfdgRy+Y71sYoFQ3vF6ZPjhtpafC8EDs+o/Kd1qPCF3b49Qm+87GB?=
 =?us-ascii?Q?sZS1ml5misHn+b2AK/SY+Mr0nr/hU8HTSgDT/+sy+Ff/Q8FnjAvMKJQRDuLz?=
 =?us-ascii?Q?tRY44kgwXZfDoAwBm0nenaZcHWFF765eorKj99AnU/wfxglnITwcl62/GCez?=
 =?us-ascii?Q?AuNnz/Imtt+9s/24CTDZy9gBKXWa7/rIzhQ16GXoZuOcO4iNmOfXDLwPK5a8?=
 =?us-ascii?Q?ev6lFc5QyOdd91hnsOzbsTuZNoxrHgISX84kintv5GlSWPqyciGVqZblSMK3?=
 =?us-ascii?Q?bnbG8e6vvr8EpprR3xFLBiVNDc3K6EP0nFGmrhIw2UNv1N7Vca+p2gMnuxmy?=
 =?us-ascii?Q?jDzGSH9wia7wZ1RcGYUDcNcQn9DUE+YjfMjF4P7jUrznUPy/C9nqYDg8g9oV?=
 =?us-ascii?Q?bWaifVFc8vkTuZzTCf7YxbWwHkkmQcUwqipb9JBJmoNhmnjMfDdJg/G3lpAz?=
 =?us-ascii?Q?z0y+pOT58saEOUE2D15MYLgrGdYqR4vvRYfynxL8fg58bBKCiMpiq6LZRFCB?=
 =?us-ascii?Q?JacdgI/1U/qeyZEKDCd8RTz6byM3xnTwU7o7jRmJvjNzuP+hh2AmgCckPjUL?=
 =?us-ascii?Q?59sr2pmTC9QI1KYDaVY7RgDZqIdr+X9aPejEG+eSrrcpvZpH3F1pTwr417y/?=
 =?us-ascii?Q?2ApVteIKEZOuVVipIy7jFYzGgj4cOnsKKHh+TFLUFIEOcdaBfTapN+QU+Z2y?=
 =?us-ascii?Q?ivTneiAZGVrENS3D6gfpcx2UOS4/FDmF7Cd6WSEBzAQE5G0F1r0zBwmhGbg7?=
 =?us-ascii?Q?6vi59+nNrvsqOrZlqXApT9dGFPSJtatwawWWu2460mMfsaWRgDIPlGk7GcOe?=
 =?us-ascii?Q?lzWcUAxvAhXZS/2XvitMWy6a3a39pgmBLvhrA+L4W9gy0LeJ6qHOzt4tz7bq?=
 =?us-ascii?Q?6vgU2Enq8ZYQCoDe+fsOX9AS8q8JyoOoyBN4sLj8pO81EZ5WiIALwyIUMnaI?=
 =?us-ascii?Q?iowbTjaSBUuXg+Ewx+EJJrTYjW18Rsk+iPdmIdK3hU3SRlK81/BVJx7A1ims?=
 =?us-ascii?Q?1WvjBVel7Ms0E5w8S140LV5oamIw57Kc1CN2kzdKa2UmpppJNuelZhvyZdzO?=
 =?us-ascii?Q?naYUb8zlN3w6Ju3lrc8U7RH2JS1xRHUOuF0OusnRiV7intP9jq23/sELKtZ4?=
 =?us-ascii?Q?veWbjNuQ9nXahGIMlC0urvBhrE4htPyIs1zflJcs9Qgi2hAhtWGUqQtY0lta?=
 =?us-ascii?Q?M03HeB8QKO8TMOm9IWoZAd4jKuJJbtkabeNnv2Yub60xRioCGgREcYe9sDEh?=
 =?us-ascii?Q?e9COdr8XdSnG6xwOBdhodsoyy2NR9ln0yvhT/tRGJM3UtjTz0eVh8MuHRpEh?=
 =?us-ascii?Q?6NojW2xx9PXVNOTyZtSj7BIyal7hCtg6tesDya/e?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3754aa3f-0b64-4991-2bed-08dd8c77c2ca
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 08:26:55.7820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUf68BfSzFK6tqoGQbyK7pgCnnAuIAykEdsuGQDH+FRkWUG5LA/+kHzp4TEIe3R7u9anjlogSnuBt+FDcH8lWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10158
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The command BD ring is used to configure functionality where the
underlying resources may be shared between different entities or being
too large to configure using direct registers (such as lookup tables).

Because the command BD and table formats of i.MX95 and LS1028A are very
different, the software processing logic is also different. So add
enetc4_setup_cbdr() and enetc4_teardown_cbdr() for ENETC v4 drivers.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.h  |  9 ++++-
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 39 ++++++++++++++++++-
 .../net/ethernet/freescale/enetc/enetc_cbdr.c | 38 ++++++++++++++++++
 3 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 4ad4eb5c5a74..384e0bded87f 100644
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
@@ -274,7 +275,10 @@ struct enetc_si {
 
 	struct net_device *ndev; /* back ref. */
 
-	struct enetc_cbdr cbd_ring;
+	union {
+		struct enetc_cbdr cbd_ring; /* Only ENETC 1.0 */
+		struct ntmp_user ntmp_user; /* ENETC 4.1 and later */
+	};
 
 	int num_rx_rings; /* how many rings are available in the SI */
 	int num_tx_rings;
@@ -284,6 +288,7 @@ struct enetc_si {
 	u16 revision;
 	int hw_features;
 	const struct enetc_drvdata *drvdata;
+	const struct enetc_si_ops *ops;
 };
 
 #define ENETC_SI_ALIGN	32
@@ -493,6 +498,8 @@ void enetc_mm_commit_preemptible_tcs(struct enetc_ndev_priv *priv);
 int enetc_setup_cbdr(struct device *dev, struct enetc_hw *hw, int bd_count,
 		     struct enetc_cbdr *cbdr);
 void enetc_teardown_cbdr(struct enetc_cbdr *cbdr);
+int enetc4_setup_cbdr(struct enetc_si *si);
+void enetc4_teardown_cbdr(struct enetc_si *si);
 int enetc_set_mac_flt_entry(struct enetc_si *si, int index,
 			    char *mac_addr, int si_map);
 int enetc_clear_mac_flt_entry(struct enetc_si *si, int index);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 73ac8c6afb3a..175eebadde76 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -260,6 +260,21 @@ static void enetc4_configure_port(struct enetc_pf *pf)
 	enetc4_enable_trx(pf);
 }
 
+static int enetc4_init_ntmp_user(struct enetc_si *si)
+{
+	struct ntmp_user *user = &si->ntmp_user;
+
+	/* For ENETC 4.1, all table versions are 0 */
+	memset(&user->tbl, 0, sizeof(user->tbl));
+
+	return enetc4_setup_cbdr(si);
+}
+
+static void enetc4_free_ntmp_user(struct enetc_si *si)
+{
+	enetc4_teardown_cbdr(si);
+}
+
 static int enetc4_pf_init(struct enetc_pf *pf)
 {
 	struct device *dev = &pf->si->pdev->dev;
@@ -272,11 +287,22 @@ static int enetc4_pf_init(struct enetc_pf *pf)
 		return err;
 	}
 
+	err = enetc4_init_ntmp_user(pf->si);
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
+	enetc4_free_ntmp_user(pf->si);
+}
+
 static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_open		= enetc_open,
 	.ndo_stop		= enetc_close,
@@ -728,14 +754,25 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 
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
index 20bfdf7fb4b4..71e4da530028 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
@@ -60,6 +60,44 @@ void enetc_teardown_cbdr(struct enetc_cbdr *cbdr)
 }
 EXPORT_SYMBOL_GPL(enetc_teardown_cbdr);
 
+int enetc4_setup_cbdr(struct enetc_si *si)
+{
+	struct ntmp_user *user = &si->ntmp_user;
+	struct device *dev = &si->pdev->dev;
+	struct enetc_hw *hw = &si->hw;
+	struct netc_cbdr_regs regs;
+
+	user->cbdr_num = 1;
+	user->dev = dev;
+	user->ring = devm_kcalloc(dev, user->cbdr_num,
+				  sizeof(struct netc_cbdr), GFP_KERNEL);
+	if (!user->ring)
+		return -ENOMEM;
+
+	/* set CBDR cache attributes */
+	enetc_wr(hw, ENETC_SICAR2,
+		 ENETC_SICAR_RD_COHERENT | ENETC_SICAR_WR_COHERENT);
+
+	regs.pir = hw->reg + ENETC_SICBDRPIR;
+	regs.cir = hw->reg + ENETC_SICBDRCIR;
+	regs.mr = hw->reg + ENETC_SICBDRMR;
+	regs.bar0 = hw->reg + ENETC_SICBDRBAR0;
+	regs.bar1 = hw->reg + ENETC_SICBDRBAR1;
+	regs.lenr = hw->reg + ENETC_SICBDRLENR;
+
+	return ntmp_init_cbdr(user->ring, dev, &regs);
+}
+EXPORT_SYMBOL_GPL(enetc4_setup_cbdr);
+
+void enetc4_teardown_cbdr(struct enetc_si *si)
+{
+	struct ntmp_user *user = &si->ntmp_user;
+
+	ntmp_free_cbdr(user->ring);
+	user->dev = NULL;
+}
+EXPORT_SYMBOL_GPL(enetc4_teardown_cbdr);
+
 static void enetc_clean_cbdr(struct enetc_cbdr *ring)
 {
 	struct enetc_cbd *dest_cbd;
-- 
2.34.1


