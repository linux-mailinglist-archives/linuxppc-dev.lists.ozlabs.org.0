Return-Path: <linuxppc-dev+bounces-7616-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 879B8A85966
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 12:19:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYt1B1Wqbz3cCt;
	Fri, 11 Apr 2025 20:18:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::62d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744366686;
	cv=pass; b=WyjFnuSg654jrKvZ7shBfx+AwSyXJBQrhx+FVSfwgXKAILDvd3nIy9TZGBWHSv+HCOz1C2bhrChAXJmFCPIQdrur9L424W9OG3FTxsLW6rzJC6M3fRQidC/QiUF1to3XuFuxt4NUN/UOZCgC5htXZGzNY/ALXqjtn+u/QjV3WfeV0+61z59jwQOyuHrtO5GoAhTyeyBFLN6rIHlKIejFidWSaVhdiQf0BgX+7IByB55v53JXqvKSrkW7IVfva0Gh8BETX4EumdkGDddkERM5upblkh0ZQTX4uGKQCCQJbRH/Uf34Vcgw6PLJl+jnlDt9CoWOTWYlQOFAjaYO4vr9yw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744366686; c=relaxed/relaxed;
	bh=zJF5G7BRX4DppOMIFpgMVEnbQjRAG+ZKNENXrgtLZMw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K0iQ9EEvpWEJ6NwdlcQyC9VROspnnfdyxiiekXAsCwO9tqrHc08iiMCMVWH3pxLRyqbIZwxhJVHUBfNGXbbOrNIRmF3gGeKBxcd/AN1N4LEbPY1QrU8b1x1QZbDDJqKQj4VlrkvCfbIn/27cMErQY+OX+I0eUaZlOidMsOqNGHQKnOI8jxBj/KTBPzbY9win8swgr8xQriXhTeC5Zci6qNF9BzPz+LbV2zX88NobXt1XcaVP8O8qaL5QUQNwq+sFg0yECPEmKG7lTsVmGP8YePf6o1dkRAvvzNJgUIhE11h63GM2cyxlGqgLV5cAsqrIe+651PA5guPxn/Ni7RrNWg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=fABZ7C98; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::62d; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=fABZ7C98;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::62d; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYt193b9zz3c7H
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 20:18:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9pehxgodBDoaas46cU79d5+t43UIGfiH4fQTI9MSx3w/W2y4bq3t+MB7TKx4oqQvt6c6izDnlbv2ZeiSTZqORKfym6bYvrdpfQQexyheLwdtYb/6X4ngxrs43fZP2w21VS3BTwcJvv761s40RqMvCKgDzq1sTrzh8/cPmqX3wHGZl5mV4AxMYpOQVJx2EXwyoxjJfjsvJHre5VsByUpsPBTeSfAzjbW5OoMCgXmWx8lR1HUoqLlDn7dH5zfn1gJDqkZYS2D1lURlO8CYlUX1qAFxrVnDzUDRjoS9iGMHuB+zoLXnVDlME/7CkfjRvsB6J0HoGNacGCZ6y5OhO9ULA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJF5G7BRX4DppOMIFpgMVEnbQjRAG+ZKNENXrgtLZMw=;
 b=qbzOMo0+qfKfbzz1E9m4GJyAFFWXPjVFOZmlIndN9kLCPlbpkv9mUF+UHaP8SHK3ERYhv0coK1ETml9UA8+sJnbUbjJLc0GA5++X4wnGSITLDMXctCG7WppmlbYMrYK7jODaWY+5vCoDrSLeD2061fUtB5TIMrqdISWK/+LBsWax6g40+qXU0NdpGBoj7bP2i+T8o5WcQUP9SFOXZSd92lHfbyHli/8vsTDN1I9C7XlzZBQAEdHC++DVwJVW4ZrOOGfDQWoKiU4C2Ei6oD5TSMlAjmdmqzNGNUlVOKdGGN4Dith1XJBDv5neQTb5eD7/M75sxJunPPTDGfuCzq/+yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJF5G7BRX4DppOMIFpgMVEnbQjRAG+ZKNENXrgtLZMw=;
 b=fABZ7C98/pgSSfZFYgfXOaRWsQbZ6sAU6Bnq754R6bHFfkLO6Lb3xQpbiO6AcVlC0iqJBApjcTR6RjnWq9md8hhfo5M6QSaomrAJBY72HwyvTipm6Kq1CKr1swHZFIn9GSsD0+t1buT8fiSOKTy/h7ciFrxq7xmuZsCiWIc7yTibOeDByYV0+P9BIoXeCL64YPGFaZIj7Jzc7N+gxTm0iBcODlglts6Sst8KX9vreAuaKfQw0IPGcOrv0fk8YEDpmtMLCj1VI6WMTRG+/vveXLBoB7TvzmR4CEIzWdtxSCFA8GSrFnrrBNI49HKwjtLCd/4y4K/LdXkhNO995Rbi0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com (2603:10a6:20b:40a::14)
 by AS8PR04MB8900.eurprd04.prod.outlook.com (2603:10a6:20b:42f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 10:18:02 +0000
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868]) by AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868%3]) with mapi id 15.20.8606.028; Fri, 11 Apr 2025
 10:18:02 +0000
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
Subject: [PATCH v5 net-next 13/14] net: enetc: add VLAN filtering support for i.MX95 ENETC PF
Date: Fri, 11 Apr 2025 17:57:51 +0800
Message-Id: <20250411095752.3072696-14-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411095752.3072696-1-wei.fang@nxp.com>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AM9PR04MB8505.eurprd04.prod.outlook.com
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8505:EE_|AS8PR04MB8900:EE_
X-MS-Office365-Filtering-Correlation-Id: 576713d7-aa69-4ab2-0458-08dd78e22431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iSMk+0dKchvPxcWPbXPcqMCDJ5TaDZuvCFtbK5uYy4vL7FHYaFSBryKZmxAb?=
 =?us-ascii?Q?0X+6Cj3CM+IBFAUevrXtpSD2801DSdmvwDY9Yj7ksqBq2IZ45eLMYypAJr8r?=
 =?us-ascii?Q?jNU5+bIbKkt7jrDvw2smQNVffgxlxAsKaEjN+/IUKbOZaqA9girm2ji0iizK?=
 =?us-ascii?Q?mr3U0aDwfUY7g1I75/5s0MVokhUnlIZNsP0UIdGbIwYknuHuto2zVgR8ZvfM?=
 =?us-ascii?Q?Prgv0B9PkGvrv4feTvVMfmxIXfuXIY/dd7tqbABVAIS3EIBwAAOkGDLStp2M?=
 =?us-ascii?Q?nLrHQ0F1p7Fr6koTSx4+kNeWwrfwVIo5OVZ+q6qM6nddwENldAMDntXdgCzj?=
 =?us-ascii?Q?K92w3qYHSSOcFdezYO/gKLeadE7Kh5ccu9J3TgDWSk2sg2XYbyHNHPlbVjS8?=
 =?us-ascii?Q?/jwfjrRPnzZmuSxHV8oZxK0rjCVU2RfZKyn4uZrfLa+I7e+0wfqcDpxcitgN?=
 =?us-ascii?Q?wC4riUm6JqfRLlKuRvtG6juOWQNrC+zqYDMAr5J9ER/XgCF7p76oVf1M5yfC?=
 =?us-ascii?Q?D+GOdFVkl72O5kdsUaPA8L9y//so67Dfq32AiyhOrXzgAHF2WF8urqttW7Uk?=
 =?us-ascii?Q?0iNK5FcWuYjTSqcvmGbLawC+D9kKZ+t6VZokoey64TGo3hL4KVgdRW/AxkyX?=
 =?us-ascii?Q?QnO68Llfj2ohSbcQb5mS/leZtsAfp3JNVaf8tyDmsq8FcfD/R85COv/xJaeA?=
 =?us-ascii?Q?tkmGq6MfmsAthbgyXRgCTLzhhoIo6XA5flqxhkH1Ia6GpaShr74mkiCLc2oq?=
 =?us-ascii?Q?JCoth+iFaaBMwS1zYEtjbim9w2EHJHIGHPm+mOXzeqtWodBTySz+yuKh0Zic?=
 =?us-ascii?Q?YnjOjVZxqAL8zWwtDQH4n4Hn3jDoqbN/0vxPdfXds51ajctgdCXtRVfRGi43?=
 =?us-ascii?Q?+rPSeIXUg5vZJCLHC1aqeZSHXKGEko0tiJK88vx9CrMs6WV/naqhiQLN+z29?=
 =?us-ascii?Q?MGKVgi3s/h0TjHvn+J6WXSle2oz/0R445mndaQrpUlnEifCpINBLzs2gcVkp?=
 =?us-ascii?Q?5zm7DR2WdyUaKIG2yaJGJEB4rFQ6zv9IwWHOQVTse1tyfKw9jxbSC+RHPNsn?=
 =?us-ascii?Q?umtZxdpbTHqE6CxkzpTm/SgdY76p/hJubU59MfEmlO6oQMMYtOKQBNHasrX+?=
 =?us-ascii?Q?asqbVmbVwe2ek2d6XgzIqFCVpkqf3BIkhUEX/nLmBDScaH61pI4mytivJGHV?=
 =?us-ascii?Q?1tAwi4Zz4TqZbgLPEGLRey0NYTwme0yL6JdUVnmGVYLIoXT8DgyF+T9a6lPh?=
 =?us-ascii?Q?mxZ84cqPCdYkfPVgL2mHwKwLbJe/fT0G6VAnrsLzUd8e8f04/SpfopuysNe0?=
 =?us-ascii?Q?KxdldxkDVkYoDKHUhij2TDUywbojNRZ4xzUrprJpKO5lxfa/w1xiYoNBFC3u?=
 =?us-ascii?Q?fTgAjAgzWLvyoheDbCfxCvWZPgA+RjXmIUOttIbMbboTUv85luNHX9ao9OVr?=
 =?us-ascii?Q?H2XtiLYFM6XeXJgasKzkKB80CJ5OO6k2PeT75WGPf/VUI0TVCMfMBg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BdrlWYjuERC/2s+LxYO22w+q8TtZys/nNjo+sRPdO9iMa6uxGSB2q2GHiXsc?=
 =?us-ascii?Q?g3g/UeBV6qByectvG/YZRhL/LM/GG++8cJm8H+HOFI+1JtlYoi83nhST59K4?=
 =?us-ascii?Q?qrURsgYJ90TaAt7QnyHiSrhL/45QbDDT0SclY5HU0rDJ8pz15WYwzJrJbsQb?=
 =?us-ascii?Q?Y7hJ8b7EMLX/aG4K247wXG8T59Um+7vCDR2dKFgOF1Hf0OPnl30p+AeOofXc?=
 =?us-ascii?Q?A3gIFRAymV2UYhk20VH9AvWzV/6+KxLI6ieijx8chcfYv+7IUUeFkQQCF6eS?=
 =?us-ascii?Q?Ea175iFV5PCrz1H2Sf2CSKzyAcuy6cbOtJ2qVA9qDdMyBU6TqyBdHqmPDaBv?=
 =?us-ascii?Q?07/6S6oR5WD8FDdb6N210otjj3W0Qb2tID/4LBe5L7eIpeMGEiOwfBhXMnIK?=
 =?us-ascii?Q?YNdrd0s7NuvBsa0wElt5idkMm/4xIB+v7fcb8hKbk38qgQ21i51izCUNlY1U?=
 =?us-ascii?Q?IQ/T7pS67+j4DEwvZEtuKGaXEd7DymFtBI9l4TomR3Q4Nj1goIq7ruXa/LUU?=
 =?us-ascii?Q?5StA3kxANHkuPVCDwpOBA/ELTa6b39q/0UD6f5a9vdW77vnxNk7QyRBagy/2?=
 =?us-ascii?Q?XZ/uMksqDBMiRf4SVm5w3p5xhQR6wB1PE2Ix7Qdrz+NtDzhzb93hOgko4tJI?=
 =?us-ascii?Q?RyE30lH9lWSBhaQZvksj/jKrNXn7BI6lzkcIV+9D2ibxH8CVg2DkyTH+zyl9?=
 =?us-ascii?Q?irxKB9i33z+T4t7AtjZtw+mrCNjV19KzxFKOQ/yipXJZR+m7HBFIuToAfgUw?=
 =?us-ascii?Q?EqgtfOHKi9AfYCHMFEfKbCXiQVpFK/OHnbfy5BQtLu9OE6rYA1mR1omMdamT?=
 =?us-ascii?Q?2PggYz1n6Eeq3COoVWgSYHC2l5JlLtqtadQDKaf5F/lxFDLUJQkWgUVVHDt0?=
 =?us-ascii?Q?y4nI5RZXQgiKlWd6g8gQEmIrcUnK2XtVx4Rbbu3VBkGXpAAvTcT+RiNj6BAz?=
 =?us-ascii?Q?GalXC/UdMMV/6agjBhBhJmS2pVOCprIJZJVGPE+ui1eh3eV/5U9zOgpasbM9?=
 =?us-ascii?Q?VB+RxfYjlDneA7+nZ0LfNFMWfyfmUYHA/0PJ5XM1GlYNWIFjqxieUvfduNcb?=
 =?us-ascii?Q?4KhCaDjJruTAVWXPMH029Ryy0OhQXDkgnsV8jTAQJ6otOm1FApHZBoFwnxfl?=
 =?us-ascii?Q?ZcjiOeiE1Es/tv1GwXG/vhZFTiPnXvSTl2MOzc4m56XI3lPTMBabdcRGJ40q?=
 =?us-ascii?Q?i8yPRJ7b19IdX12So4dJ0+Bg66fHa+v6ARZ4+LSLM0SVWP1ZUjW2zp1AZLoy?=
 =?us-ascii?Q?ixEPmSiv0z2He8/1bt0C5pJnmgzVc7R33J5fO/XWkvmWAHa8HTJV2rFZhx8V?=
 =?us-ascii?Q?pjd4vNS9Uuo9w+YmP9yPkH2QBPJXxHcn2WW5O71k6wB7M3e5oSzBUEQlfNKZ?=
 =?us-ascii?Q?swEuMtnl0B6/gK1z+0bPElfuiuLb/lgAQSWJhkqrzswLXwE2Y/+uz4nPHch7?=
 =?us-ascii?Q?mG1+NJ5iSgW45EB3vArFOP3VbjRgoikKf91suFI5+2QG4ctBT+tWu1j5zpPZ?=
 =?us-ascii?Q?CJN0Nk0iAAZH+NXWDb/DRmz8agALbhlyOrD5Y+NxWkwLPq66lfgctZ5MZ9m9?=
 =?us-ascii?Q?4y0nIVjfGS/BLgirYNi0cQCT3BisICnBCbqNutkC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 576713d7-aa69-4ab2-0458-08dd78e22431
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 10:18:02.6563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUY4p/6xBTq/h3J7jmC+dLABTgjB56rFti9MfWSst2HZqL4HSepi9VB3PW41rvWd9e4Fkj25phWV08D6zQQRaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8900
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since the offsets of the VLAN hash filter registers of ENETC v4 are
different from ENETC v1. Therefore, enetc_set_si_vlan_ht_filter() is
added to set the correct VLAN hash filter based on the SI ID and ENETC
revision, so that ENETC v4 PF driver can reuse enetc_vlan_rx_add_vid()
and enetc_vlan_rx_del_vid(). In addition, the VLAN promiscuous mode will
be enabled if VLAN filtering is disabled, which means that PF qualifies
for reception of all VLAN tags.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v5 changes
1. Remove set_si_vlan_hash_filter() hook
2. Refator enetc_set_vlan_ht_filter() and rename it to
enetc_set_si_vlan_ht_filter()
---
 .../net/ethernet/freescale/enetc/enetc4_hw.h  |  4 +++
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 12 +++++++++
 .../freescale/enetc/enetc_pf_common.c         | 25 +++++++++++++------
 3 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
index 826359004850..aa25b445d301 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
@@ -107,6 +107,10 @@
 #define ENETC4_PSIMMHFR0(a)		((a) * 0x80 + 0x2058)
 #define ENETC4_PSIMMHFR1(a)		((a) * 0x80 + 0x205c)
 
+/* Port station interface a VLAN hash filter register 0/1 */
+#define ENETC4_PSIVHFR0(a)		((a) * 0x80 + 0x2060)
+#define ENETC4_PSIVHFR1(a)		((a) * 0x80 + 0x2064)
+
 #define ENETC4_PMCAPR			0x4004
 #define  PMCAPR_HD			BIT(8)
 #define  PMCAPR_FP			GENMASK(10, 9)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index e164e1a3f44b..421378212a73 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -517,6 +517,16 @@ static void enetc4_pf_set_rx_mode(struct net_device *ndev)
 static int enetc4_pf_set_features(struct net_device *ndev,
 				  netdev_features_t features)
 {
+	netdev_features_t changed = ndev->features ^ features;
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_hw *hw = &priv->si->hw;
+
+	if (changed & NETIF_F_HW_VLAN_CTAG_FILTER) {
+		bool promisc_en = !(features & NETIF_F_HW_VLAN_CTAG_FILTER);
+
+		enetc4_pf_set_si_vlan_promisc(hw, 0, promisc_en);
+	}
+
 	enetc_set_features(ndev, features);
 
 	return 0;
@@ -530,6 +540,8 @@ static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_set_mac_address	= enetc_pf_set_mac_addr,
 	.ndo_set_rx_mode	= enetc4_pf_set_rx_mode,
 	.ndo_set_features	= enetc4_pf_set_features,
+	.ndo_vlan_rx_add_vid	= enetc_vlan_rx_add_vid,
+	.ndo_vlan_rx_kill_vid	= enetc_vlan_rx_del_vid,
 };
 
 static struct phylink_pcs *
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index ed8afd174c9e..8c563e552021 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -135,7 +135,7 @@ void enetc_pf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 
 	/* TODO: currently, i.MX95 ENETC driver does not support advanced features */
 	if (!is_enetc_rev1(si)) {
-		ndev->hw_features &= ~(NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_LOOPBACK);
+		ndev->hw_features &= ~NETIF_F_LOOPBACK;
 		goto end;
 	}
 
@@ -376,11 +376,22 @@ static void enetc_refresh_vlan_ht_filter(struct enetc_pf *pf)
 	}
 }
 
-static void enetc_set_vlan_ht_filter(struct enetc_hw *hw, int si_idx,
-				     unsigned long hash)
+static void enetc_set_si_vlan_ht_filter(struct enetc_si *si,
+					int si_id, u64 hash)
 {
-	enetc_port_wr(hw, ENETC_PSIVHFR0(si_idx), lower_32_bits(hash));
-	enetc_port_wr(hw, ENETC_PSIVHFR1(si_idx), upper_32_bits(hash));
+	struct enetc_hw *hw = &si->hw;
+	int high_reg_off, low_reg_off;
+
+	if (is_enetc_rev1(si)) {
+		low_reg_off = ENETC_PSIVHFR0(si_id);
+		high_reg_off = ENETC_PSIVHFR1(si_id);
+	} else {
+		low_reg_off = ENETC4_PSIVHFR0(si_id);
+		high_reg_off = ENETC4_PSIVHFR1(si_id);
+	}
+
+	enetc_port_wr(hw, low_reg_off, lower_32_bits(hash));
+	enetc_port_wr(hw, high_reg_off, upper_32_bits(hash));
 }
 
 int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
@@ -393,7 +404,7 @@ int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
 
 	idx = enetc_vid_hash_idx(vid);
 	if (!__test_and_set_bit(idx, pf->vlan_ht_filter))
-		enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
+		enetc_set_si_vlan_ht_filter(pf->si, 0, *pf->vlan_ht_filter);
 
 	return 0;
 }
@@ -406,7 +417,7 @@ int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid)
 
 	if (__test_and_clear_bit(vid, pf->active_vlans)) {
 		enetc_refresh_vlan_ht_filter(pf);
-		enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
+		enetc_set_si_vlan_ht_filter(pf->si, 0, *pf->vlan_ht_filter);
 	}
 
 	return 0;
-- 
2.34.1


