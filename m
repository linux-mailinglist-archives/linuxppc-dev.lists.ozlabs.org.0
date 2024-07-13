Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FBC9307ED
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 00:55:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=W6kfWeT/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WM3h82gT6z3d8S
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 08:55:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=W6kfWeT/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WM3gS2m0dz30Tv
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 08:54:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJqAnLVyovDFNi65pvxZIuDZRgwoOgMMcMwkp29qfqQ6ypvKRcFsDCaDuHZKIPlBbM0Wx5wkkejptwVwe7Qpd1bT64Egi9QvUEKjRLvO5UY7NGs9Z7GmDcWJWf6JN4NCgliGogzbnS+4vUwws9EpJ64yALnjafRmP+OwYvTp8QdJFS8fAVpSpUzLZaeb7mN4syuC26Qs/rYS4ctFjmxnOnXWSdzUCG4JuntuxfIFbyQx1zNeznJzooiR+eTx2E8tSMSx/Op3A/V8co7tyWPUJJ0Fb56H9VJnz/UowgObciOOWIHAeqqcIqS9Jeu+zrvn8hktWXSg2SoEK4CUt3cw6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSqDaO5YbDleAdPYqgDMjjDvO9vm4MKyVo1hOfZkX8A=;
 b=ZVTDhGZW3K6tkrf8QOy8OhXlmXXXYIRcoeozkX5cF6wEj5C4bg2RcJ6Ufh2RGi56Po0cdu1JDWurk/WgcVYh3+43HMCssIwYL9vovQ3HbQSJvUr2up/k+3zYgODTRD8u1IC0xH/qT/2wPnODdiRnon3vW2BZp5URvjg/Zn1v4wyXfxUaVK4d7dfRpq3TOIgD5ylQygCdYj2FmMIBmq2E/Whp4XaRGZodSTh6NdlaAGJCuIStsZ3Ik+Id6kT2A9/4oFwDcU/cYsgjR2AvpQHk7ncaqgMGN4iXtdNdT9Euqz66Po3sg13gSdEN4AngQ2i9f5wn/WUZMu6kklBECzTuUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSqDaO5YbDleAdPYqgDMjjDvO9vm4MKyVo1hOfZkX8A=;
 b=W6kfWeT/Iy+I1Fwb3N4HbeNm3WJ2HctAWZb5NUS/64y4aAfioVqzgBFUJApNKS4pNnnpp8KHKX0Sp6BvHBsV1c2ZzLwd0ypuJ0z/eBr6DCFE3SpJVih3pRE/VRkREXJq/XBUFKoJdoI1xBTAMBhhZZTzILA4F6UuGEha5trQNHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com (2603:10a6:5:33::26) by
 GVXPR04MB10873.eurprd04.prod.outlook.com (2603:10a6:150:224::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.27; Sat, 13 Jul
 2024 22:54:03 +0000
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a]) by DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a%4]) with mapi id 15.20.7741.017; Sat, 13 Jul 2024
 22:54:03 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Subject: [PATCH v2 net-next 5/5] soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
Date: Sun, 14 Jul 2024 01:53:36 +0300
Message-Id: <20240713225336.1746343-6-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240713225336.1746343-1-vladimir.oltean@nxp.com>
References: <20240713225336.1746343-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0127.eurprd07.prod.outlook.com
 (2603:10a6:802:16::14) To DB7PR04MB4555.eurprd04.prod.outlook.com
 (2603:10a6:5:33::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4555:EE_|GVXPR04MB10873:EE_
X-MS-Office365-Filtering-Correlation-Id: 67461694-2c33-4320-7e2b-08dca38eb0e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?Z7o7lS182c9ppPDNmx5mLMfxVWpYfDKFIajknRYuWLIxrov0ZKIV4kxPKWgh?=
 =?us-ascii?Q?FvP/dQa9z+Q82kSfwb9BfelcPh+MHtVSEyf5H8kbmMr4tjWmgqhB9eGIwMVG?=
 =?us-ascii?Q?/uWW3yh1wzwsfxgDEkvtITEg1+49lHafIR0LjWCJl/1dUvlmJd2cLL6AMR8X?=
 =?us-ascii?Q?pp0qhzE43A/T1rmHSiYC9r+dLgjrvDz3yhG1PGtDyRmSV05mmMiSJ02KrB48?=
 =?us-ascii?Q?bwp835BNyXBOUL6jtKB6Iany8Y1guUNRW7oNlJfFJ3ldeQtGw9bed2rr5ceF?=
 =?us-ascii?Q?6GO8eLNmHqZPQJhB2Pc0Ply91gcfEcPXUnarQRyHpQbVFoK6wKK+3DsLqes8?=
 =?us-ascii?Q?/i8+dbxtZzxDK2jzUSoclILNji++Ms2KhPpdhb+AQ82efOI2c17LjnK3fXuT?=
 =?us-ascii?Q?JrKHWrRiJyTIayJG55BajagXi5d1Ts6dqQz2+ik+InfiggQwb9M4mEgE6TxP?=
 =?us-ascii?Q?ufUmU6SN+U3NPrGvTyXVGLCoE8WUOGCUIg06hiWtvO13f2srigE4TsyvRQnZ?=
 =?us-ascii?Q?7TWmfCoZhQUnmY6/EhQuVMJruEFk/GgSt8GmRW7gN2EWENdCWF7PLjjh005t?=
 =?us-ascii?Q?8ooeegs6kekx4ABSr158cIxDZF48AeJtBBhQMRv6bDdHn+NXqgDAMVGk9ec4?=
 =?us-ascii?Q?ndpAy++1mkyiXHq4x5Z93KFnjJWevnJomdbWTJnFmL7XEQ9JYaY7syyyzZzr?=
 =?us-ascii?Q?eaKGOi19q0JTwo21i/BKB1nEbdZk5ZIft6WroP75c+SDMkYnYHf73RqOE3eJ?=
 =?us-ascii?Q?/jJe5a0QPR2u6Mo2HpaHIT0JM2KiAhoLy3cSX0bCnYVyjgWiuUALJCR2Csu8?=
 =?us-ascii?Q?rAlWnYPd8tPKKH4Tcqm5uS38I3gVbLgls5JWo6JtOZXSU0WbT/IQvP2aRETc?=
 =?us-ascii?Q?8JDWJuYdW6bmhiZT8Wh720p7n6ZMrC4PwYawmw4lLyi263w2Z5dmokvImk9d?=
 =?us-ascii?Q?Cu/owGopm21l2iXuYzJqzRVqTd2CzUaYLbrWkH4DGv0YsOrr2P/JNx/affRU?=
 =?us-ascii?Q?ihfzkHbgCs9I3duLwOydwq9plRsg20H3dkxuwhNJXtJ7S0BTmmdOCzpyR79Q?=
 =?us-ascii?Q?7q9XLNu+NUaSJk/RkAUrwiBMZQS502qptRDr604hBjWJoBLHVoZFAQ67eWNZ?=
 =?us-ascii?Q?NQeNSw35eGQROsrrkSxIpW7DkjGoFh9CUb2InCrkxXpaOAHAZQQl2bOjLMgQ?=
 =?us-ascii?Q?Wu4jAPIfnLev5JJCy9q5vrnaNQkb96K433BpNAPB+cREnITtZ3x9A1PnIdvG?=
 =?us-ascii?Q?pZXSEToa4NPtk+SoqK5S1zVZ4vvw3OCqjbhaPf4/36tZG67L0mRHPfvT+vld?=
 =?us-ascii?Q?PyK0TKoKkc34lAFWCzTeBNuhQoCXi/I+T3WSvoEeEzliKb5P2kPI+ROrvBy9?=
 =?us-ascii?Q?CW2eYBXHXZ61U3qyyRN4QAl4kKMJW5Q1XFfqQIXXDc63D6jeSA=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4555.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?+f2R7khxdWG1rWpZL7Hd4Av0pABSJ425BbMUEreODumipuWLoWluxaR8DHXJ?=
 =?us-ascii?Q?JmDuPSq2YP2e/dZrt2Ak8kTMqDSHCudcF8ZZh761D3RmUJ1CDGsofP342vnA?=
 =?us-ascii?Q?AWtnouPCM33774dDd33dICuXPP2inRmsOgvp/YsjXUz7PrZ4bMpWPc/yRUxM?=
 =?us-ascii?Q?Xb0RSBNAbu8O3b3E8ucUgydCBKde1f/l8lqOWg6t5BqbOZY+ifI+DOMD747G?=
 =?us-ascii?Q?E85B5l36p+wjYomDwRd+ZvKFJdbMYYs50cW+Hj6Uk2GVH5Buf4mNbpzC7fzE?=
 =?us-ascii?Q?z4//kYMokBhaqfVZ2pJroxceo9O49sPda9tzWXvXnZsnmosv3CvR2bvXcGYv?=
 =?us-ascii?Q?RpPzgW9enW9vNQBMsVxyYRiyhNa+IuYjvHaJt/2/p3kDih/kAEG9Iubic8hT?=
 =?us-ascii?Q?L+a+tNkSA/0pJj1lk3IlJMLmILj7XvAZbx0wri4Pq+u5LoR1uVSYBMbgTwYi?=
 =?us-ascii?Q?v+flkgKeE162GTjzluz25mvQBqH7/e+jzMKUZNg99M/mxdEUY4axFnOsoeM4?=
 =?us-ascii?Q?QKonCx+Nov+4l20pcfB+MUiYBPPYI8r/fo2OqGC6pSAKW9DsYGMnxVse+fKg?=
 =?us-ascii?Q?3kzbzsheRgEs/AEjy7HuBisWS+y9HquZZKMbsudD2p+wga4WQ7TulGUw8LyI?=
 =?us-ascii?Q?XLDQb7wECmQ5wLsfRuhPaVk5A9necGn9aYunjUDuU3Qtba8vHhYMeo+izEaK?=
 =?us-ascii?Q?l6jHYz7/96pzBG+ZHCBlLtIoeFlQ+iry9s5W4gd1ZjP9jsvQcV4ZmYLl5YvU?=
 =?us-ascii?Q?u2iV1gZQpnJiIYWEk6RdlIJCCMyk47a6Nm3s06rii9GLAoEYfCvLDMWSMN3j?=
 =?us-ascii?Q?YmVmbM74/xlku9L6pgTnQNw/j3tn0pGkDDTm8k8z2WlAAg8P56MpYNn0sput?=
 =?us-ascii?Q?13vfOjCoJxEQgkY4CbFGNzhSxGj+dJrh/RNPBytKYJvdmOrD6o78MEIy5Vkx?=
 =?us-ascii?Q?PwxsAzKFY2tjjrgs/8lXV6Qvc5fP3ETIpXdUHkibcBPMhmNaPOEpCgmM/da2?=
 =?us-ascii?Q?KZ8ZldaBl2kK0dKcMDvMn73/wrbReeQquZUDQuYS1+bqZXjDU3q1CRsSKRcV?=
 =?us-ascii?Q?ilk8rDy9tCoglZP+GW4oIbyXgoXWA1VFhf8YEtRHISbiyWGPzxLjcwwLVFlw?=
 =?us-ascii?Q?okTcvC+XP4B2SD/J+LQfKdD6r0eSs10ms2hFIgqHhzT9RuRimMLSAHvrjVWy?=
 =?us-ascii?Q?ilBBRdCPKAGLEKgQ//9HnRio0j0Ra3/NsdLutcHKc4b5K1daTDFPyX0ua6yT?=
 =?us-ascii?Q?eHOo29jiLqZ7TTF6cgohF+GNTk0QFmsbEqVNgDSiKFIMIOywK3eCE6SlujY3?=
 =?us-ascii?Q?7Mf9i6IasIDQ/h45jT/vIzRuoDrJczfnMK+sr5VWEgu1DFj4BTjuXbD3Tprc?=
 =?us-ascii?Q?6qyx3FayyiI2c5tVlluholUBHh/4vKOKDhscZJV8jzqZQERMkJd4T0vWrWiG?=
 =?us-ascii?Q?TCyrTc3N/3/XUpzf6om8DFwdANFsgaTN+XFS1BTNbeyxvNm+qaxt4edLYzqz?=
 =?us-ascii?Q?wH5H6jt/7Wv5SFmMifzgzrzmo3KEjmxvWwk3MyY0liBpjmZk5wiuSYRSP1//?=
 =?us-ascii?Q?u2EnvLXKw5p8omYS79QzpZEkrCbEv0LjCgbbYNpFsQ68k1HNpvEZHqmlE03z?=
 =?us-ascii?Q?yw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67461694-2c33-4320-7e2b-08dca38eb0e9
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2024 22:54:03.0336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vvc1K6CVVsXUHegNH+3CjSGGCREMHBcETRtNWoDHHwngbTnEHZ5JqGVE5gV8bnTMamHfBDPuLppeaRsFYASQQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10873
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Madalin Bucur <madalin.bucur@nxp.com>, Madalin Bucur <madalin.bucur@oss.nxp.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Breno Leitao <leitao@debian.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Breno Leitao <leitao@debian.org>

As most of the drivers that depend on ARCH_LAYERSCAPE, make FSL_DPAA
depend on COMPILE_TEST for compilation and testing.

	# grep -r depends.\*ARCH_LAYERSCAPE.\*COMPILE_TEST | wc -l
	29

Signed-off-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Acked-by: Madalin Bucur <madalin.bucur@oss.nxp.com>
---
v1->v2: none

 drivers/soc/fsl/qbman/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qbman/Kconfig b/drivers/soc/fsl/qbman/Kconfig
index bdecb86bb656..27774ec6ff90 100644
--- a/drivers/soc/fsl/qbman/Kconfig
+++ b/drivers/soc/fsl/qbman/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig FSL_DPAA
 	bool "QorIQ DPAA1 framework support"
-	depends on ((FSL_SOC_BOOKE || ARCH_LAYERSCAPE) && ARCH_DMA_ADDR_T_64BIT)
+	depends on ((FSL_SOC_BOOKE || ARCH_LAYERSCAPE || COMPILE_TEST) && ARCH_DMA_ADDR_T_64BIT)
 	select GENERIC_ALLOCATOR
 	help
 	  The Freescale Data Path Acceleration Architecture (DPAA) is a set of
-- 
2.34.1

