Return-Path: <linuxppc-dev+bounces-11756-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E47B44C52
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 05:29:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJ1zD0ZDcz30VL;
	Fri,  5 Sep 2025 13:28:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757042935;
	cv=pass; b=FUe4lK9MWsK0c2Bj0azlYsbhmNFjm1NXDrpB1GdvlaZh47FIq9QXZ/A7WdzJA0uB9z6tO8J53tSoWWkkGMnFZBvJ6ulneRqS1ksPOm8Xv6m+wq9LaPPa2Sa9GbeFf/ZNddk9wzoka+dVRgNl2SUtgVvmFc4/nvQyStbsnn4srXQW+cKT58jroURZvjCw6/vROlPk1JkcxlZdEk4xqIV5diHbk1XUdySjPcJMjnxjqMJw4yhVfMmi9ZQFB3bCJC/fz9oShTt6G1Htc1AgL+1fOODSvMdgl2Jq3t4QXteyRkvIZe3A9kfywh+uP89PKVg1GXIJx7kBzbRHpbr8/gtNow==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757042935; c=relaxed/relaxed;
	bh=S7HWbkGPr3fxvQNN46PleLGWNuqu0sPSMmQhihJ9+JA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TZJTbD7BRmPwjloEijoo5RCcGLmxMhv+fZSVUlaaG0EsEF6rQvLFiH3E5yeVxROUssMkUgR8AmfJL/CwC17Ig+zw2qqv1rAM4XEyi4v57hvsMuZC/XLWIv5+TERLVPBD7oqEP0ehyqDvBxOzaNhl8kvqaCsCChMUdJcxCqC5lTGzxclU6rzPeyvMlQJvFDcGYVejV6L7/3/1+MOHuGq/CXhUofZNBz7nLyvcb58V9/dv5tOdamD8ru+333l8fLZWGLTik1iE8TZT74YTKINAfD1nSeTMXta5e0+WLVisM4/y9reTPUyzp6ptuBNIA++rIh1ha8BaZpO4jl4BjhjBtw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=OZTdIdsT; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=OZTdIdsT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJ1zC1PH1z30RT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 13:28:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDZ2USza4ANsF3su9Wn5rLudhWYIsQh8Y8SO7weXhK+neraLpJZMd/ceU5ox5e/Oj4VPcF7ivseuBC0xmfBKNKOO8D21Z1k5d0JWNMnMqgPD2xJu3v3Ox+Sd3vyjQvpfT2ezpsBun0Omtml3udFSTQiFCyWbXOw3j3/R15UkmK5+/7vKcMtMlAx01TP21tBlSa39c+MaTFiznmtCh4hMdXe456mrDlhPebmmlLMtoudl9d22L96flGQnJPzIrqf2OaHF80v98KjhPTZlOSuMETsbWNYsv0IiiuQDCDq8ES1QQC1+KU28Zyx+3xX1DfKWQSy+Wp432RoB8wXVuyZsyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7HWbkGPr3fxvQNN46PleLGWNuqu0sPSMmQhihJ9+JA=;
 b=CzxaXwHSkssIgp4jvRrSFKnVDUrB7BIklR6JD8k7Nzd+iK2wsPVBlR+h3nxw0DzzurfTT+IoLBzc6wNpe8WRe5WJ+Ws5Z2u19Owrkyqf+UC2TicqAQR1WWDt1FiKp1OUYQBkQzyW6QzIcI/dkY12F/b/zgO5fmlfYvAiQAYu2zXKYZ23zg3RbNsAaf2Tpoh6FERWHL5rGrs793wg6fsa0dJsCSd75XKqjScw4JQSWIJ67KbERxZTofjS0Bfv9GqCJMmEiaoB80lV6Ltc7YgY8CzYRQzTTCyXyybDLcMsqbhIFkBlrto37VBaEJj8S5hMAf6ugrHSMbXer5r9FbQXIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7HWbkGPr3fxvQNN46PleLGWNuqu0sPSMmQhihJ9+JA=;
 b=OZTdIdsTiUmLuZzaAyRmlk5Ob7oBL+mX5gdL8gkS4lYe2bdo/iKO7U+l3iixmH00g7t48TN3HNzEWGzmENkesnapPjmKi1D04JCNAZ6GMBBt2BVlQqi0Ji/4RgXZYeH72coq8aZmSo9tGkIAejTR9UpDFdAlq9VmfOQYXdznM97j1n1KPAt5pcekHJbFYkoK3N9gyQlBE094uLBk26j5mGS3dh+vOHMa4zerXdUiVciDWzkAckziILrHPtgqiXWKzCTUKLdaWuoIOxffnaWjGme+n3hMA4KyjWpW0OOa1jlerpmrSRcgjWR+zfnbl67sx6oyHg8C8WbNG4tVdZb6Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DUZPR04MB10013.eurprd04.prod.outlook.com (2603:10a6:10:4d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Fri, 5 Sep
 2025 03:28:38 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 03:28:38 +0000
From: Wei Fang <wei.fang@nxp.com>
To: richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	Frank.Li@nxp.com,
	yangbo.lu@nxp.com,
	christophe.leroy@csgroup.eu
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH v2 net-next 1/3] ptp: add debugfs interfaces to loop back the periodic output signal
Date: Fri,  5 Sep 2025 11:07:09 +0800
Message-Id: <20250905030711.1509648-2-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905030711.1509648-1-wei.fang@nxp.com>
References: <20250905030711.1509648-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:4:91::24) To AM9PR04MB8505.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::14)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|DUZPR04MB10013:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b804ade-bdf5-462e-584d-08ddec2c4bc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y0WpWAr9cELwEWm9NO+R/j/AlTj0alG7ODqaChrZL/jMptxjcnXnY34nqZ5Q?=
 =?us-ascii?Q?klX2CZOijBBhdQmmSab6kht6tL+qaB63hDi+vzKVfcws4SqaP1BbQiUerTcy?=
 =?us-ascii?Q?/5eRutWE22x0B9hzzypYpxig/WF61jyo/wVJ/y9YM7MisiXc7+ih7h58plZ5?=
 =?us-ascii?Q?XBNw3QgtOjoIQLyYguL6HQiXLhhP253/a80433Yhu5fBZlQr/EbieXBc92pU?=
 =?us-ascii?Q?M+ljXtZCC96opaabAynE7k8un51g0SGpwZEZYKHRicKBdXBGbLjOXNEKsWmE?=
 =?us-ascii?Q?z6NQXuuWqK0tSJ3DJd/CkoYo9psQr/NaVEmk4xmD5Svz8kFequcB14hfJhB0?=
 =?us-ascii?Q?LCvMEaU75KJd4dLscUr1tYY3NmGqPF7gTpTJ+lnwMRiY+C2QjWBat+zk8xkz?=
 =?us-ascii?Q?S6kroP/ytElzcA/fNT09wSv4YTGTYx8TZjS7WlZHOSlXPc3B+nvSK0iCRkav?=
 =?us-ascii?Q?J9r/RnOhjY8OsER5dhPym6NBciVtuWk7F6L/DfMeIBZYVXTLTaIiws0iVMyg?=
 =?us-ascii?Q?FTXgKiOmhJg+Z9Hl4KOAyNuvep1CZcqOODVszW5+fBcCw21WpNEG8TbWqn4I?=
 =?us-ascii?Q?J2icXv5HuM8g/dh1uTqL7MMkV8LHMPUR6suxxiYxLa9ufhJMOQKOOEbcAnkG?=
 =?us-ascii?Q?kxNI14JKyJBRjBJSlUALCl/RJfcB25QsKyUG+loEhI3iM5ZM31+QP597k+6O?=
 =?us-ascii?Q?feu6Nlc6uuMAKGkFXef//QzlUaim/k1ysAkBNbAKVzYctEsiLTXbGLSSemNx?=
 =?us-ascii?Q?fm809iBJagDMKKPm1WNUQ4nyv0EhXv+x9loTFO4Ky8fOdNrZv7fepoZ+qhvW?=
 =?us-ascii?Q?QyEXDrOVjLpSQF/tV+i3zeWvVtD3F2iIOkdtcWKtSfrnJV1vCRNlTE7YeS3G?=
 =?us-ascii?Q?jY0ptAwdz8cmkzoOJ5a++VEqnb7h6yNNul+AcK2qMt/8qWClICP/GnOMdO0W?=
 =?us-ascii?Q?cu7wYRXkmYKzM82Pv/C4Vdygh+SItE+u3YsG3zZ2kZ3YoxYZ8/YVallZRuil?=
 =?us-ascii?Q?n3KAK99H5XEejM1dmEDNB5yLyXusv4ixJPluObFU+g7IjxtOfkrkcQsBACWN?=
 =?us-ascii?Q?//v1K8uPCXNqbefRl/oelM5gsRgOJTb+cH3KkfhUrc0uAXUuigMq0CwysQ87?=
 =?us-ascii?Q?UQeCV+duQvZ5kGTV1d0uOCoQ2taEyyaBeSWOmkwlgKJBt6n0ZoYZ7IxH7N8m?=
 =?us-ascii?Q?NCuuLVe3dfsCfbakXpK62s0XUty9W5nDpodRuNmHCnZNzTTFmgaU7N5BYxia?=
 =?us-ascii?Q?yU5iW1HlTu/VDzHqVXll8F/FyFOFkAQhS/Yo5vJX7CI5st6vTLAkk+8wspfx?=
 =?us-ascii?Q?I1zFq2mKUZa7aoVv+YwGDXFhF7faj+VHJs1ZlofcabXD67ESsgMbXJP3qsUw?=
 =?us-ascii?Q?9/ntmyPrCs4omkUhAXFs/TluJ4O9b2++vkte+L7YrW3VjXRQKHRNOiNlIUb3?=
 =?us-ascii?Q?SObQQtZSME63zVidr1M2S6W/oF6LeqrvfXM7Pk3xa5fIIs4YSs61wWi8m+GB?=
 =?us-ascii?Q?G70Bdd16TOea/NI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nrXkW7GuMCYNThSXL17QWD14rrp36CRb4XX9d2kbl+rI+9Nhi2whnxOx+Zho?=
 =?us-ascii?Q?5UT888ykK6+tXGIeWRri9HwEZqERgfG72nf2AFfpBdAuEgNZXPLd2aRU9eSS?=
 =?us-ascii?Q?ftbv5fnB0nEJBNqLbMEw0dgql11kRl6pS2Cr9mDRPZVjqwR4EnNJxbfJgRh6?=
 =?us-ascii?Q?GvaJjANE+nC889gmtbxf6rP7efyia6B8lpCGxQR5dE2e2mqHCo/LcFvdefOB?=
 =?us-ascii?Q?UxfE3YzcuqVjiMUY2VgWkoYnLOBByrn4clNdwUp31Sd7FC1lQ1tqsG7kwhSp?=
 =?us-ascii?Q?2ZI4Um0OZr/Q/9sfKUypDD7jc/npT/+HnCnKg/XcVjOpQGR374MQNkda4Fkn?=
 =?us-ascii?Q?ijiHHjZ6KCXnOAABwzBKfu30kUUoNiwLHAiFtg89/RbvTZgyWqrJU5rq8ujo?=
 =?us-ascii?Q?9ef/7O+d5Q60+oB/G7Ytb4e28IpiwLI/Qli3RFXU86lgBZPe9wuy0bmkBzkk?=
 =?us-ascii?Q?p3AIbIF2JVVHb/9zygFwXQr/ofZGi5tsnUNpV0JXPZrrwUytzqMwWZpIsLim?=
 =?us-ascii?Q?VZQG8ZOJAmvpFbgDT37E4UNpAIiPhXhq/uesTd1nIVCuO/kGmB6udZqoRvKs?=
 =?us-ascii?Q?hV1rMhGcDMXq4eJ/16NWSI0VUwgJUGponwTG7O5/6Kx1zJg6GExc+MSReZdw?=
 =?us-ascii?Q?+gEsKuCaCycrhkt926TtmyBCNr+Fv81rRmM55MR3g6V5NOc3cwViRnPrfN8S?=
 =?us-ascii?Q?DkcVhdbnUHB3ESz2O2gqmPKqro4Ruj+3CLA3cTpvXYsyDNeZ7iU+qYEprBsh?=
 =?us-ascii?Q?2oTX9hhRXMcye0jSIKglsQbKkQvMA+hhfdQlaIhUCLyi4p1kTfNCZz17FnZi?=
 =?us-ascii?Q?RFRrFK3XHuhuOkzUfBXo4mBIvbh5w0z26htqYDTWNrnqE/BaL0KKPsqVjiNK?=
 =?us-ascii?Q?KXfo/C1gNx7R6ccgAFxADh5cURgXPNvEU2bNeGuOAj/yHwhOLWBubmCcFb2N?=
 =?us-ascii?Q?WdvBCZldKdUFV5aDx3S/eJriWXHPcvG4m7n3lvLr54bfshOTTe8AMhvdwrRf?=
 =?us-ascii?Q?Agda67rXCzxhR371a7SITLoQtyq+BWloo3/xhoXijMpUvYpcGYwF2yhqE9nt?=
 =?us-ascii?Q?378ACZ1RVwNxEisjntzal52U/Kyc/5rqbbTQoINM6+QgA8yNP9Gf3DRpVNsO?=
 =?us-ascii?Q?B+YUkfX5KEMzNJ5nLqf/mSnRmj6wwFIjwNPtnSaJKlJsTWqah0XyDjCB7V0l?=
 =?us-ascii?Q?RxRs+H9ryoB0p4j/zefS44tTYgJyZPTXBgDefOALxf8rGgMlJwXnIgIYWttG?=
 =?us-ascii?Q?w4begzeW/WssWKyvC5ZCFTKr0WIuOa++Ei+caIof1qQ5QZP7F81fnkLSh4E8?=
 =?us-ascii?Q?fyZKEn07BEjbkvfDonhmmQLCeyxG7zZNY24q5u5M2Bcz8LKeyt+8ySXsONw6?=
 =?us-ascii?Q?onzkbiqcEamuVE0OWcSpnE2NXCbMrW/9VGuOwE9dYJbKvedgfJShvqFmQf6c?=
 =?us-ascii?Q?gw7lzKGCWrIy29yN+LnqYJYI4oyU3DvmqHCUx3X4Uz1kohKNE0whTRkqX8Pp?=
 =?us-ascii?Q?81qtHsCpnVrgb9BlA5DaHy+Q2eUg25PJqks6MDu6ivXBkcUhdRRPGmPCGlBy?=
 =?us-ascii?Q?3W5YCj6ycGVPWsoJ3wruU8wFf09hGzCt8xu45eLF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b804ade-bdf5-462e-584d-08ddec2c4bc4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 03:28:38.2210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sg56d/cUItGiOHaKLlbae/7oAfaFMGT9NLxN5tJ0fwmafk8IBhpFaRhtbLFpB7QMsw7dYpUifSCaPc3g8sgIdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10013
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

For some PTP devices, they have the capability to loop back the periodic
output signal for debugging, such as the ptp_qoriq device. So add the
generic interfaces to set the periodic output signal loopback, rather
than each vendor having a different implementation.

Show how many channels support the periodic output signal loopback:
$ cat /sys/kernel/debug/ptp<N>/n_perout_loopback

Enable the loopback of the periodic output signal of channel X:
$ echo <X> 1 > /sys/kernel/debug/ptp<N>/perout_loopback

Disable the loopback of the periodic output signal of channel X:
$ echo <X> 0 > /sys/kernel/debug/ptp<N>/perout_loopback

Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/ptp/ptp_clock.c          | 69 ++++++++++++++++++++++++++++++++
 include/linux/ptp_clock_kernel.h | 10 +++++
 2 files changed, 79 insertions(+)

diff --git a/drivers/ptp/ptp_clock.c b/drivers/ptp/ptp_clock.c
index 5739a57958c7..1d920f8e20a8 100644
--- a/drivers/ptp/ptp_clock.c
+++ b/drivers/ptp/ptp_clock.c
@@ -248,6 +248,69 @@ static void ptp_aux_kworker(struct kthread_work *work)
 		kthread_queue_delayed_work(ptp->kworker, &ptp->aux_work, delay);
 }
 
+static ssize_t ptp_n_perout_loopback_read(struct file *filep,
+					  char __user *buffer,
+					  size_t count, loff_t *pos)
+{
+	struct ptp_clock *ptp = filep->private_data;
+	char buf[12] = {};
+
+	snprintf(buf, sizeof(buf), "%d\n", ptp->info->n_per_lp);
+
+	return simple_read_from_buffer(buffer, count, pos, buf, strlen(buf));
+}
+
+static const struct file_operations ptp_n_perout_loopback_fops = {
+	.owner	= THIS_MODULE,
+	.open	= simple_open,
+	.read	= ptp_n_perout_loopback_read,
+};
+
+static ssize_t ptp_perout_loopback_write(struct file *filep,
+					 const char __user *buffer,
+					 size_t count, loff_t *ppos)
+{
+	struct ptp_clock *ptp = filep->private_data;
+	struct ptp_clock_info *ops = ptp->info;
+	unsigned int index, enable;
+	int len, cnt, err;
+	char buf[32] = {};
+
+	if (*ppos || !count)
+		return -EINVAL;
+
+	if (count >= sizeof(buf))
+		return -ENOSPC;
+
+	len = simple_write_to_buffer(buf, sizeof(buf) - 1,
+				     ppos, buffer, count);
+	if (len < 0)
+		return len;
+
+	buf[len] = '\0';
+	cnt = sscanf(buf, "%u %u", &index, &enable);
+	if (cnt != 2)
+		return -EINVAL;
+
+	if (index >= ops->n_per_lp)
+		return -EINVAL;
+
+	if (enable != 0 && enable != 1)
+		return -EINVAL;
+
+	err = ops->perout_loopback(ops, index, enable);
+	if (err)
+		return err;
+
+	return count;
+}
+
+static const struct file_operations ptp_perout_loopback_ops = {
+	.owner   = THIS_MODULE,
+	.open    = simple_open,
+	.write	 = ptp_perout_loopback_write,
+};
+
 /* public interface */
 
 struct ptp_clock *ptp_clock_register(struct ptp_clock_info *info,
@@ -389,6 +452,12 @@ struct ptp_clock *ptp_clock_register(struct ptp_clock_info *info,
 	/* Debugfs initialization */
 	snprintf(debugfsname, sizeof(debugfsname), "ptp%d", ptp->index);
 	ptp->debugfs_root = debugfs_create_dir(debugfsname, NULL);
+	if (info->n_per_lp > 0 && info->perout_loopback) {
+		debugfs_create_file("n_perout_loopback", 0400, ptp->debugfs_root,
+				    ptp, &ptp_n_perout_loopback_fops);
+		debugfs_create_file("perout_loopback", 0200, ptp->debugfs_root,
+				    ptp, &ptp_perout_loopback_ops);
+	}
 
 	return ptp;
 
diff --git a/include/linux/ptp_clock_kernel.h b/include/linux/ptp_clock_kernel.h
index 7dd7951b23d5..884364596dd3 100644
--- a/include/linux/ptp_clock_kernel.h
+++ b/include/linux/ptp_clock_kernel.h
@@ -67,6 +67,8 @@ struct ptp_system_timestamp {
  * @n_ext_ts:  The number of external time stamp channels.
  * @n_per_out: The number of programmable periodic signals.
  * @n_pins:    The number of programmable pins.
+ * @n_per_lp:  The number of channels that support loopback the periodic
+ *             output signal.
  * @pps:       Indicates whether the clock supports a PPS callback.
  *
  * @supported_perout_flags:  The set of flags the driver supports for the
@@ -175,6 +177,11 @@ struct ptp_system_timestamp {
  *                scheduling time (>=0) or negative value in case further
  *                scheduling is not required.
  *
+ * @perout_loopback: Request driver to enable or disable the periodic output
+ *                   signal loopback.
+ *                   parameter index: index of the periodic output signal channel.
+ *                   parameter on: caller passes one to enable or zero to disable.
+ *
  * Drivers should embed their ptp_clock_info within a private
  * structure, obtaining a reference to it using container_of().
  *
@@ -189,6 +196,7 @@ struct ptp_clock_info {
 	int n_ext_ts;
 	int n_per_out;
 	int n_pins;
+	int n_per_lp;
 	int pps;
 	unsigned int supported_perout_flags;
 	unsigned int supported_extts_flags;
@@ -213,6 +221,8 @@ struct ptp_clock_info {
 	int (*verify)(struct ptp_clock_info *ptp, unsigned int pin,
 		      enum ptp_pin_function func, unsigned int chan);
 	long (*do_aux_work)(struct ptp_clock_info *ptp);
+	int (*perout_loopback)(struct ptp_clock_info *ptp, unsigned int index,
+			       int on);
 };
 
 struct ptp_clock;
-- 
2.34.1


