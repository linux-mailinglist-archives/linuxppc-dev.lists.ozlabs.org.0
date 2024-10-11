Return-Path: <linuxppc-dev+bounces-2090-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 953BD999B2D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 05:27:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPsWq1NfNz2yLV;
	Fri, 11 Oct 2024 14:27:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::612" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728616593;
	cv=pass; b=oYIetcXCLCQSNBFafST6K7XngokwAHjhjxLQC6NJRNbI9Vi9fwHKACc/a8j1AYBPUgSgokL9BQoUTe6GB+dXVXWfebbRmprp1PsLx0NwUlJ6xA3xHc04jBAZOHPX8gJejm5FF7MeejjaMjGKL8iMvLymq7GP8cY0crBWvrcxRMpWuQ8sYJ5zZfq8bzexfUj3Qw3KaVm8Vur4DkPIP9h9n6s1YzjpS1zJc6c/S+UWmitI757o6+2nWLMHQYR4D6LuBdWpNDVyu1a3C5urobZQLOWrldhpKyXz2lHHwo0srat1LWXc9V1eeP+G7swZzYfOHATj9QCsh0sLHV4V0qIPGA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728616593; c=relaxed/relaxed;
	bh=waCzLYymp369lq2JaGe2UTMDulnmUfPcw7tlc4zpad4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=euTYhw0/ioC5VrdnBZmEk5ZhdVEiCBcrpGiv+s51o4UkLxYWhpBNM5BkIdowC1D7WnSxjIHw7ehaq4Yhn1eL4zi/kQMWLi0cmJU/YgH2MaA/ksTBbBv0WaNLJRxPjCT2x4ngEr41sqbjqb3f+6NT1OErSaRAxWas+LxLikvpYU7DTY/kKhWntrSXTGYeL5nDT8T57QSPlG2LWA8aDDzavE+6XmGxwBRGj4vzG5+JWNMd0jms9vXpyFmDvMTYSzXn8Z0rL92R7R6o9uBfy+Y9wzcIvZvjjqPe+IUf7k92jogyQaSs6ccF7wx81fOYKs6KOCfJVMVSLhUK6jdSGcMhfA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=XLipNquW; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260e::612; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=XLipNquW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::612; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20612.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPsGl4gqkz2yNj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 14:16:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIA/s4hxa8Z2Pg7CwiM5CV7S5vba40yesuHZmtHK106i5cSob6cLi09ejfYE+HdQdLF5M0JOTlobw5H/YwIe8fzbnCNPCBXfNkTCLPIh0rPQ8oogKxwLTZRkL02Y4EJuUHA7YydaRURFLfwUkexuDOtky6qRa/lXFG48vsPNk9wBtLcx91cCz216fuYuf0zyt5zfhgXv/SzEz1Bv1pWFlwTJLqx5uPEmezGALiDo3MTRV7eSKUZpKz9lQlW5EOA+xkf5wLMj9CQ4lmxtlKbAlKT7vs93Dp4Tp1v0vuqqTwS1+sOCdVe446wLKvZv/4OAIvjSbBVA6bVT9U8lNzGBsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waCzLYymp369lq2JaGe2UTMDulnmUfPcw7tlc4zpad4=;
 b=Xh4NgNF+wEjyMKw4t5D4EidfltYfT6Bc5BZWeUwXHjuKdvWXJPygaKERFBqTemcHFSZ/3U6StY+tdMlC0OV9n2oamfcY02eipFHd8QZ/VmiF0EiDM7uq7dkCnFvKS34BiWOE7OT2Jp/Sh2sp8VDKaqQ9ZU8+4s9rShZ6mPYHuRW/7hTgNN+pBMazbMB+59Ep6L9Mbvs8b7lVCTbHMUbmLnX4FACc3mmWdSbMPrhSatJiLhjIoUbq6lYq5rFRpfkIpcdu2zBKmwHGgH/IaKH7bX0d7Lmwrp3RPMP6ZNReW9xj3IFvNcpM+Qv3xPqk2s1GDtfVoZ38eqJsqYJj2Wsgsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waCzLYymp369lq2JaGe2UTMDulnmUfPcw7tlc4zpad4=;
 b=XLipNquWJ9tXKRyq2se5B8QX1ZeEkD9h7NFmFqc8l2eMg8pV6fCNM+n3Q2fo1GMvdCO42BjbQzEwUAu1NSnbE1srFQID+EP/QauNy3VVzXqoc+ONvI0beiYhvK4pkpmByCrkBVOjiTYojuSP3IhyqHJ0FnWSUQa4blO/8ecce7Jfk9ObP8YhGp0nJkZkPdpq/ZY/Rp0jsGV2E+EY9wPK3nKdNNZezhyIJrUPOg2rsV4Og+PpiVkO3ohvcQhYK4cUaI5w0v3BNSAvd4ffa199D+4bmYuDz4HYM1BfugRYFWjjcyEtjeXkiS8LuIWB04HWa6GNoBe+ftYuKmx6DP4LoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI0PR04MB10999.eurprd04.prod.outlook.com (2603:10a6:800:266::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 03:16:10 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%7]) with mapi id 15.20.8026.019; Fri, 11 Oct 2024
 03:16:10 +0000
From: Wei Fang <wei.fang@nxp.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH net] net: enetc: add missing static descriptor and inline keyword
Date: Fri, 11 Oct 2024 11:01:03 +0800
Message-Id: <20241011030103.392362-1-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:3:18::26) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|VI0PR04MB10999:EE_
X-MS-Office365-Filtering-Correlation-Id: 079c5914-dc3b-4ec2-c65e-08dce9a30dd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8f7SfF29biAnKxsg9nEpS3YVutP/sZJi0qj+FfaeMXM8fSlcQi/jkDCLWzN3?=
 =?us-ascii?Q?Vn1dJwcLnURo8PtvTLNDqj1TzHz9f8WEClO0VKwkYRKqY/C8sV8EUSWdzMso?=
 =?us-ascii?Q?y0pE8yaU/TOt4EvQ5nHuKCofgmxkCys/Bifz5xhY96dQkVHh6bdbec7QIFHA?=
 =?us-ascii?Q?ALp6phkps2WwYys4ll864VA0vDWH4mfYNJzKZxQe454hgElqF4If74eFtGZj?=
 =?us-ascii?Q?BWubGYbLqQdikKBqtM80WERNd/xVDj3CclPJnMccZgbKKKIWkr/6gyGvGxM0?=
 =?us-ascii?Q?EC5/R4swq/91WvBhIoQa8D79Tb+l19n0hyYuBgDYIMDtgqPlooCO0J3kOVRP?=
 =?us-ascii?Q?/8gpqcbOQ0JWh6LLGSvdwt2TkO9A6ccCAWLR6wwInxp2l6vCl6/TP5o9RCZB?=
 =?us-ascii?Q?EBFeh2Hoi3zv7bKsHpOnN3x2rIsQ6snEayfzibRX6qQKVUl6YxJJ/vtQljM5?=
 =?us-ascii?Q?SrSrvR2fRXIrPfB3cZBAt1s+5K09HeezjEEsPqyqS+l9qE8a5Lsm2631QOZS?=
 =?us-ascii?Q?Q+MAVHLa77Poer0UDpci5LPskADvVMUasRp6NLTkrOVAF+hDIB1zVpLFk0Sh?=
 =?us-ascii?Q?b36eJbySiu5Kj2mswTNRCJfF1bfK+q1KQkiMupWcPdyoTK0Seb8Dg5K9UW9k?=
 =?us-ascii?Q?j6YXpIJPeGQqXnc+HdnjrhKewYfUh8wrOdbO+hDexxoQnXf//iw1hrAnBctN?=
 =?us-ascii?Q?5fAVDp9XXK1UWuX0X7cbDt34p7xQuQLlV9d6V+eDJOalvFm2/TzZ0C985zjX?=
 =?us-ascii?Q?qxKJb4BOYbtjraAJvLXCMBPWLe5BagrjoikLQ/HU78MlXp7RNEG+SwQ+WtIr?=
 =?us-ascii?Q?R7JZdYc4fX1W29QmEI+n1407DTU5Du6bXwamf/v6Ra+Vb/dVje0GEDriNJy0?=
 =?us-ascii?Q?92UXKP3m5w/ZoUn+C0KUZR4D9orgcoOp3MCn5KtmmEEimwNkMuFYzInWUDuO?=
 =?us-ascii?Q?LhCqp2qaENPhTbTm5LjhA4Qwb/KBDrsOVzcb1uIhSet020QtC/ehEo+7aMr8?=
 =?us-ascii?Q?Nn01XLrXUdMxXiWnNcQfVlRzlamrxGGi6dBsTK7OnkANKeUvGXwDjneBjRpT?=
 =?us-ascii?Q?dJWUS808bJjvx8KqnsJoM1QwqDWJD+HTPz/uhXqsn78kmrzFeSmVgjh7dbjv?=
 =?us-ascii?Q?IQsisTPNZl2fDeUHuqXGogY3w9ywtAFAVxQsnV47vXvCKmOW22IZLUycpMy2?=
 =?us-ascii?Q?dHx97LdJw15XUA2ja9vtTmMcP+sCVt5mArziBgwuIyDfb5zSMKCTA2gJZSdK?=
 =?us-ascii?Q?NzOBGqD/8F2cpEG+Lc/SiLquPkqAli96MUn3opyAXVAglsnwZd2x5Is+8OyB?=
 =?us-ascii?Q?L5kdTwB17Y3Bzgf2YaQIYYteEewsXm5vkaTSSKPrJUcptw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?51gg2zTJsInJumtTJ7cJjf5uvy5dRjRpRSRPLM+rkkm8WKS2Y4yPYevHaglQ?=
 =?us-ascii?Q?d1pIIDZgyUHNbeR8U1O5rd+vthW8bQ0Jy7ojbYq3+gMxWDvDllqWz2h9FP1X?=
 =?us-ascii?Q?WZgcTEBILtKyKg8NyBj4UyCa3wOKztLJh/tCDLNOducleGf7NiSDY44oF8Ad?=
 =?us-ascii?Q?f4o3HkT0nhgmh8QYFcmkcwM5hVdLeF4igOt/Twj+YwvCt6KWiDijg+9nTQ3/?=
 =?us-ascii?Q?ElgH+lvxSbxGgYQevVj/8awW5lH6H8LBHSQrO/EqqKaKDbg/nYnOyFlXIvFg?=
 =?us-ascii?Q?0DIs1b/QOKd1zRR1FCBjRb4axIr6PNjz2tOnYaPxGOq4YqrdV50sYyHV7OMj?=
 =?us-ascii?Q?WID1ME350oMb8+gdprvLYpqUBjwsnczWcQ2OVuLAsSsrptP/0qvdQlL4XD0d?=
 =?us-ascii?Q?NdoGg2K1ZVHba2zmukhcXwqU7gCDGH94pIY/GGvSXXS9nrKPrhmtcCfamuo8?=
 =?us-ascii?Q?FkV/Vl4sRzwZecHbRbbJbLf6cxRjUXdHIDL8EXPynZaoxe/CeWUH7hiPVror?=
 =?us-ascii?Q?+VItcieh76sX7J+0CphYNDYzTb3pq8GdJEFMP5c1wpPE1b1BAeMvksmNsDE7?=
 =?us-ascii?Q?aRHxNIbLDuMjabaac5Te51Jhh5oUYTTLIdGFYV0lokUbO7O/KIEfG0d1UxzY?=
 =?us-ascii?Q?3IM1QYSkD3NRV9IzrlCaCa+ejmZcm/AgUcywb2ETm92474Mq0Axxyhe4/Lxn?=
 =?us-ascii?Q?RF5nrscHZgErFVsCM8mIkcTnFe/UppBcJv/l+1iHpG8UODxjoRusA1wUmTd2?=
 =?us-ascii?Q?KtDpsGLb7l7Yted/lY+6u7V7Q3KgofsgOS4N4EN0J1I5JTtQR63dTZHcjnLk?=
 =?us-ascii?Q?+u4giWmj/YEnRodaAzW7M9u0rDqK8W9t2DGhLTcnrCg38dBrEgT0DAB8OvBO?=
 =?us-ascii?Q?q6CbDKCr6095GwhHoJ3xwmgj23zK7KDhYjUL7rgC3MtNvQIwJBAhR2gIaBJz?=
 =?us-ascii?Q?uZLpIru7YWPzg4v/I7Os5VGlExFsk3XwyKZ6uruvQVM+vaPYvt1IM4t41gX3?=
 =?us-ascii?Q?vi8IjjNFAiNKir2wtZ4DBdVB8JJY0RwM2+JvloXZnKGHKT4kTIN2mo6+v0qG?=
 =?us-ascii?Q?gfVe/dj1iBe6uSDjxeMiGTk6G/O+PmpETl0pPQcHMwFKtSivPb+6hLyubynY?=
 =?us-ascii?Q?IK1vD6QUyjqjGupPFjXMToUAy3wIDqnFaYEXVdrT4zdCkoqzBwXJFyq4YmRK?=
 =?us-ascii?Q?O1z3ML+fU63VjviY/4GX5MR6doQPD6sVxBTpAoO3L8ybgcvFZMLE1yNGXwxA?=
 =?us-ascii?Q?6uYz2gedvqxOtXXy9myxQ3I+IKgo5qtJSeo7+mycBtkh+jj6u5MwLqCVGBDk?=
 =?us-ascii?Q?ihBhl0ON8EXuoAhzq0vE4Loj63QN1vA5GSXY6QaEByctR3FyQiIAVw2h+zFG?=
 =?us-ascii?Q?hL4b080oMnv44NrWOHy/+a1AURQrYqr8NUKUKWbl91obvedwsBRJG3T4CKxT?=
 =?us-ascii?Q?KBNiM34bIqSpm7TmrKcF0yQ6mGaIwvjiLRGCue6H2HtMJBkERw9W5MEkdAa+?=
 =?us-ascii?Q?lE9VtbIlQsUaF2EF8iCxVlWqRfPr+dSEtu0JNTuyapMxFfg4gX1y6yKJj2nH?=
 =?us-ascii?Q?VaLAdcfSTDifCmiQZl0D7x5wCdzMU0qVptpT/TJU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 079c5914-dc3b-4ec2-c65e-08dce9a30dd2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 03:16:10.2485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /07sUNvPDwU8a/CXIbIhfjVSADllcsSzlWzrRtWeO4AK6lqZMgtjhDlnzbM9KIzTF44eNjz5EVM/hePTyrIC1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10999
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Fix the build warnings when CONFIG_FSL_ENETC_MDIO is not enabled.
The detailed warnings are shown as follows.

include/linux/fsl/enetc_mdio.h:62:18: warning: no previous prototype for function 'enetc_hw_alloc' [-Wmissing-prototypes]
      62 | struct enetc_hw *enetc_hw_alloc(struct device *dev, void __iomem *port_regs)
         |                  ^
include/linux/fsl/enetc_mdio.h:62:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      62 | struct enetc_hw *enetc_hw_alloc(struct device *dev, void __iomem *port_regs)
         | ^
         | static
8 warnings generated.

Fixes: 6517798dd343 ("enetc: Make MDIO accessors more generic and export to include/linux/fsl")
Cc: stable@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410102136.jQHZOcS4-lkp@intel.com/
Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 include/linux/fsl/enetc_mdio.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/fsl/enetc_mdio.h b/include/linux/fsl/enetc_mdio.h
index df25fffdc0ae..623ccfcbf39c 100644
--- a/include/linux/fsl/enetc_mdio.h
+++ b/include/linux/fsl/enetc_mdio.h
@@ -59,7 +59,8 @@ static inline int enetc_mdio_read_c45(struct mii_bus *bus, int phy_id,
 static inline int enetc_mdio_write_c45(struct mii_bus *bus, int phy_id,
 				       int devad, int regnum, u16 value)
 { return -EINVAL; }
-struct enetc_hw *enetc_hw_alloc(struct device *dev, void __iomem *port_regs)
+static inline struct enetc_hw *enetc_hw_alloc(struct device *dev,
+					      void __iomem *port_regs)
 { return ERR_PTR(-EINVAL); }
 
 #endif
-- 
2.34.1


