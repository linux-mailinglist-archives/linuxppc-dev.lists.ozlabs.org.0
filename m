Return-Path: <linuxppc-dev+bounces-6672-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F4EA4D505
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 08:40:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6SJb1mWsz3bpG;
	Tue,  4 Mar 2025 18:40:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2608::60f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741074015;
	cv=pass; b=W3eDIRbxKGzHCiBR9SsKL2PBDTnU1maj50Qbx+dsq44NzYoOOvDt7SFThI0f9zmucIY5Bod7glyJaIOZVPQWmduNae5WpU1ef27oaGu8IRWHbU2yRbe4I1kL3pn8fk3uoEjK2RXAw7Qa0CtfToSkekialhNtDgkEwTW7lruWA5e22Tg0CRyz0cgyj3tWyReiQDuqbJ+1lu+9aQXDF2UrPC/EwnVjYjUNOWu170nPy9q7a/FK80N3uGrb2VHTktbXWMg4Gpu9OJJ1L7AgeZ6xJB79s9oyVlJVSrWLCBPGS33mVIpfH1ts4kFIoILOdjxnjGypNp83sms6/4awVYyq6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741074015; c=relaxed/relaxed;
	bh=Q6BwyvdGeY1viuvmpLBYTiydw5CWKTPeeW879gCKFYg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GPWZub65YP8FnRoFIDpPpsofwveAEZO92yK+nRa4JpWtNk0uoSivrHeWX9X3C8GKdDDXgNQh0qXUDUVyGyytQuLX0Hp5+P/UZ3kUon7AQ29mVC0At7Kmwhbha64kkWA0ISV9/PXBz3OG5WWYzypArZhmtYesJc6GE11NzprftmJE7zznX5UtVz2e7AsUMrwyG5c4E1v68oXW6Lpg4rbnoWXzdxZybg4tum4yTCNBJP6m6BVWRNMxJhp8va18AQQn/p33pAe85GOgCODtV66nWKQxWksZrwd+BDUZSxgDgxl0EnoUha3BrkJsH5nt8w90Nd3sw6Ji35gznky3k7e0gg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=mg/cw0Om; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2608::60f; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=mg/cw0Om;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2608::60f; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::60f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6SJZ3pvwz3bqp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 18:40:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CjVfzjWEmDDqOUhhTgB9PWJUAezJo8q4v3f6ch/d34Jlk633IXV5UjOyx5/j4WntBELZlpcrQB5NeKd0WJhGUGWoZOyvagBLQBzBEQH9bqTu4qhBCLr9jQ2nMRA0Aj1PIf7e22GTv7PqSmNaN5gMwv0E/dhnJs3wZazaHP1XpNApnfx++SOjZufASoEp4SaAftMaJc9otv++jEvh9fJ+8v84buphtaIZCFRPBxJoPHcFEOzDCNBJWLTPN4C7OmuFMsdC2op2egEymigV2ZyRDQxHIPLn0Q91gv3LnM4gV7HF+HMoIeGTkYxgLlibannKD2vDDE3czlWgYrT0RkHPHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6BwyvdGeY1viuvmpLBYTiydw5CWKTPeeW879gCKFYg=;
 b=sAzE0SLEK27iQ3oHxeHUuZ9a1py3S1GBuPRw5KOODVZiJCLhRvOm5T3ztwSa/lF+TP8tTleK4oO1Lm3WAf2DZRtTto1WIdK4fH6M/GR30dgZYH8Ka3KoPDK6yClowKhbtkBdjNlFcAjmqyPxI/n4N8clZ9Fje7HPtkYb0cL3E94Z+FRxsVGZsurEBU440db42XfL7lza6+zJ1wsjEF9JdeqzfLo+nP2Jtqi87U02ItYi8VHlHDVIwV12l7dL9j7PeWXb+lvNM6wL1PQ4KrtGenMd7hGcvrS4O64XIN6SKNGkMRIZkC/3lj0uskUgIw/AxuDVeFR7ukv9E0ytpTfWMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6BwyvdGeY1viuvmpLBYTiydw5CWKTPeeW879gCKFYg=;
 b=mg/cw0OmZcjPMfGYHap4WBVZcq0c8Qg1M+/j6R4Q/ktEG1PliipiEJw1tkqPMIZfr/WBXF96mM9KKzqWAEu6mKMyMYo/YWVrpATn51godSd9V2Aa+CFo6ko29h668ev59sFJH3pUGPPhOvd+XQKiOT0kFC1ZH0/4qdu4kphGiSz6vLYRS3toywtEfze3+7+rStF+Eve7r6VkqsJoXGpcCJmLqCPYzGqz8gnEtkTw0/sfPNH3RHN06UsjyAPbJodrJ+I+34MGb91ziiADPrbO2c+Avhj+fA0IEz9jErp27LX5l2pBXuthutsFv/aTfGYQf0MbThw6wtG8TXOSvEcE0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI2PR04MB11171.eurprd04.prod.outlook.com (2603:10a6:800:29a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Tue, 4 Mar
 2025 07:40:03 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8466.020; Tue, 4 Mar 2025
 07:40:03 +0000
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
Subject: [PATCH v3 net-next 10/13] net: enetc: move generic VLAN hash filter functions to enetc_pf_common.c
Date: Tue,  4 Mar 2025 15:21:58 +0800
Message-Id: <20250304072201.1332603-11-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304072201.1332603-1-wei.fang@nxp.com>
References: <20250304072201.1332603-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::19)
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|VI2PR04MB11171:EE_
X-MS-Office365-Filtering-Correlation-Id: 6479b051-9f52-4433-0452-08dd5aefc69f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iiHZtlW0LUvQYUmgZK7ojApBVdAAmj2Xs1iBjySeysD2YahEyzyrRSz8TDxD?=
 =?us-ascii?Q?Z91OemYmel/e2al0FsETQXcbmFEpctArmfuzyEcC0oO0fVXEkPiJTsWDuRTM?=
 =?us-ascii?Q?w0zzn2IlyybiL0m/9H+nH+rxaiHUrk316vaCgAmvYftKECXeAFqZrAA6aRDa?=
 =?us-ascii?Q?w5nPr70KdQyuUFgCnS4JePzk0EkaXs4BxQQCgKbU5UI7G1yNToG10OViB+VI?=
 =?us-ascii?Q?1k0shF8Yqn9cH0ZY19AGbt1pZ6cVkKBktq6Bw4HCTYat24bTwCebAKQ7UwcW?=
 =?us-ascii?Q?U6jPiAKqxsJtQMTlaRDE1IjY4kriruErzfCu2mcjZ1IzHRS7+Rl8tvspla79?=
 =?us-ascii?Q?kozBmV5tTfwaIXQJ2W4JeQ5+O2Qe3b9QZw8vTxJYJ8J5ePSZOE/VXdRkT5i7?=
 =?us-ascii?Q?VYgEK28Ky7FN+TTrcwCRdyo7jzabkozvWPuPkCLuazrMjv2/VFkoq4rMkOTL?=
 =?us-ascii?Q?7Ou0jbBX6lLHOzXnvu8i25lr9YRCIm50veGVJrMBnQC8hluQ2sl7k+kP7GuH?=
 =?us-ascii?Q?7Ocs56PO2gU7gpOvCLPl9BS6AcfGbXLrGTXLSoOAQfzhtleqSqPIQlWoxwSM?=
 =?us-ascii?Q?HvoPy/cCdHBzIuZQUJjrW1w1IMf17t7NpCMb7U4J7KwGadqMX9Qb4iMAGr9z?=
 =?us-ascii?Q?rtNiz1wdTtD1Ql1VrjmOrLHucxQtgcwikrecrbuhdfcR4huFLUMYzxXPmwpF?=
 =?us-ascii?Q?DuIcl1MMdN1wagTOV6PZfhiOYbMepAkNqX1DVKoN7ZJNWO0aVbO8ZWic5+Ke?=
 =?us-ascii?Q?N9/EH+pcqeXM0ntrI8NppVWyummtcTbDY43h9vUc04DB2ug69FykqMj6Irj2?=
 =?us-ascii?Q?NptYoyHeS6eJBnXfhJ2WGMOGE41ZmPK0KRx4JqY6r91wBV0CVphCgb1yl6r2?=
 =?us-ascii?Q?ayRG3tWvMbvpNnxdE2ixCCux/T/d9ImYEuZcP02mMdiwHCyMsV0Gsx+weTov?=
 =?us-ascii?Q?g2FL6ijp13XcE7EZ88kecvRUBTaEe9rTX5Ro9hF8DvTA9qjhsrxlGzwTpR2i?=
 =?us-ascii?Q?xfkotbBfMyW0nejkdmhYrtdUri/0xvXXJUYMMM5W6ru71+jCZVXz9GA8Y1cn?=
 =?us-ascii?Q?FwX9L9Z58Hqp/lkR9adsqF6Cb7ebQI12D34C5cTSkQYm1nLL3DLzwpSwXoDz?=
 =?us-ascii?Q?O4CzNo0GNEdFUIEtguQPhJ2eBfzfD70jiqLAwBd3XXECVXvJXzMM79TXt2vz?=
 =?us-ascii?Q?zwXE7sQiiQq6EaK9yRCBHmAnooiUuJEu+Uw97cw0F2jwRmvFfoqNv8DW3/YC?=
 =?us-ascii?Q?6lFuVxXxPG63OidYP0AX8Y2j3/OynhU3Iu+HPk8rdWRb2t7nZ5/kiQX/jaoS?=
 =?us-ascii?Q?BHuya3/8As7ODLWxDp7/+bfM23ReIRxD4kIv61b9if6LAE0TEE296tQRzK0w?=
 =?us-ascii?Q?N5CpfxbOrNNhQ2pQDxQnSwe94oMFJ0atfGTAprtCj/2M18Iqi2eA+S0f3s28?=
 =?us-ascii?Q?Day3DLITUsr/6uUN1ZF8zx/fNEogwv14?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sVzsij6XlDr3AbSIBFAg9PaS80LmsZX3LPV/hCOL2Ha3om2XpMB8HooHoMvg?=
 =?us-ascii?Q?RKkA7vc2AnK/ECfcdshtDhxs0MPYX6Znv9seuH5eF//uhUqOSjkFRd9MzU4X?=
 =?us-ascii?Q?H4uz0LbMt3V468gpXAnfVWYPFmCdE6tWhqEMtvTpDWFmB6qhJDGDW+iKtqbp?=
 =?us-ascii?Q?qrMatmsOC9NF2OTJnvaGCyPuPemwd9ScaKpxgLP6BEpZQJMTouCdBini08pf?=
 =?us-ascii?Q?Jd8oVpxZhhKeSvrNZU4JCzsu66ejG6FIr5xuFYUVFo8ZRpvNVLR7E75QHjiy?=
 =?us-ascii?Q?Mn2VySZxaWnF6iUF6dbyHvrXOh+EKs8FjfFKG7iMPKqdZPYddUobrfzDhXsm?=
 =?us-ascii?Q?EfjCnMVWr8oOnPNXfwxgzn797BJk+q+VAvqENEzr8VLSv30+k9ys6zzaGpGG?=
 =?us-ascii?Q?6p2AioxCDJWsji0gzkydac4ERkiqcThiR0/dyG4Vht5cix/DczvLSw87ltr8?=
 =?us-ascii?Q?0xKx2x6jbboiJxLx62+V/Z0/YL7LDQXohWimeIYtvF1c1Fm4FrA50qm4XLCJ?=
 =?us-ascii?Q?FW7ZAcx9mv0VYJWaUuQELfywGAr9ncTZfoQS6lv97muWiy7gj6xJuR1Zp5+a?=
 =?us-ascii?Q?JEAAX8yami6IGZnX/t2rag2kfud3nsqxENk4KU1iRoQkYWEzjtHpH1WQdO0P?=
 =?us-ascii?Q?9t/Bhf2ayXaFmEahst7nOMj86u45SbgO4BFKQA4FX3D4K3nDUmuY/62jGdl1?=
 =?us-ascii?Q?tgcmmulfG+rttprfuTNh22+8w9FV7t1NgR5a/2+iqlsQJJ3aTlBLEyXUjjae?=
 =?us-ascii?Q?S41YLtc3qfpII7cNJWBRZPcLnjoOdqbH1ZEiJRv0O+SbCX+5AKkzsFJSB1id?=
 =?us-ascii?Q?yVF88/vTynJPcGVrIJdNZlDQa0nC9h89RDiyNLNc1ezPMqhBvRn1BCMaMelj?=
 =?us-ascii?Q?z3d1O0kXUmqB41R3kffvzr1ff1hXOVDy027TZ98I76JRIu8j9auQGq9JW0ov?=
 =?us-ascii?Q?zF5OY56BZH3bLEXHYcJu8n5DpDwjZt0Afpw44uArF283gCyO0f29uAEfKmfF?=
 =?us-ascii?Q?+1N3vs9hI4efVCHY/GDzPvdFXDU42HO85xjSw14i5ofiQumw06Y5pbD35kDz?=
 =?us-ascii?Q?J7ZMJk1ZveLQ02mkRsaUy/3dMum+2UXgkpECwXU6KdSiq/Mb+X67KloiaxNa?=
 =?us-ascii?Q?qeUqGdXyQW4tJOce9HmiUsHVcyuWVYrl2QsYtxp/KYV7+qRQ1igXrwPQSQjI?=
 =?us-ascii?Q?FjFrFKB+caJWqwAlGiHFE63izJMeb7kRy4avcKeXNaWuPWH0q+6tcBS4OvYn?=
 =?us-ascii?Q?ddIp6RTlGibWMPBrB+/JA0FN7WMfttviEpHaov9lE2x3v1m77ssg7VFpSWRa?=
 =?us-ascii?Q?sRkp5qj8aqmMtM6aA6/I2EEsibH/JgVkLBagsD5kUTmqzOun3REyI/j7wSGP?=
 =?us-ascii?Q?7WmGAHOBqz1EwNtf93BSpivFGN/eJOoMvVQRWhiAkjta/dQfFWK+TtCZnxGZ?=
 =?us-ascii?Q?4qnSNEu6hlxN0B5Il3vpt7yN+6HjK1i4BE0ME7b0xQbL5Y01rMgzjdv7BG/x?=
 =?us-ascii?Q?0JvdRTua/1+QAd6iVX17qMF+2vEuuyQSf9TJVpbVUGJ57lrE3WdK6cLnlc6S?=
 =?us-ascii?Q?QqrTal0q+VltW+gQABzebVExjtbSnStQfJ0pfdIr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6479b051-9f52-4433-0452-08dd5aefc69f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 07:40:03.4913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zoq9P8/2LyBwidflyJuJknv16afN8E1D38goYTOfVNi8tGr0ouwgts+HnUmfdkElW1OKhV5CIlRv6uYnsyXZyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11171
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Since the VLAN hash filter of ENETC v1 and v4 is the basically same, the
only difference is the offset of the VLAN hash filter registers. So, the
.set_si_vlan_hash_filter() hook is added to struct enetc_pf_ops to set
the registers of the corresponding platform. In addition, the common VLAN
hash filter functions enetc_vlan_rx_add_vid() and enetc_vlan_rx_del_vid()
are moved to enetc_pf_common.c.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 34 ++-----------------
 .../net/ethernet/freescale/enetc/enetc_pf.h   |  1 +
 .../freescale/enetc/enetc_pf_common.c         | 34 +++++++++++++++++++
 .../freescale/enetc/enetc_pf_common.h         |  2 ++
 4 files changed, 39 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index f9b179ed6d8b..d3ca9e33893f 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -215,43 +215,12 @@ static void enetc_pf_set_rx_mode(struct net_device *ndev)
 	enetc_port_wr(hw, ENETC_PSIPMR, psipmr);
 }
 
-static void enetc_set_vlan_ht_filter(struct enetc_hw *hw, int si_idx,
-				     unsigned long hash)
+static void enetc_set_vlan_ht_filter(struct enetc_hw *hw, int si_idx, u64 hash)
 {
 	enetc_port_wr(hw, ENETC_PSIVHFR0(si_idx), lower_32_bits(hash));
 	enetc_port_wr(hw, ENETC_PSIVHFR1(si_idx), upper_32_bits(hash));
 }
 
-static int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
-{
-	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_si *si = priv->si;
-	struct enetc_hw *hw = &si->hw;
-	int idx;
-
-	__set_bit(vid, si->active_vlans);
-
-	idx = enetc_vid_hash_idx(vid);
-	if (!__test_and_set_bit(idx, si->vlan_ht_filter))
-		enetc_set_vlan_ht_filter(hw, 0, *si->vlan_ht_filter);
-
-	return 0;
-}
-
-static int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid)
-{
-	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_si *si = priv->si;
-	struct enetc_hw *hw = &si->hw;
-
-	if (__test_and_clear_bit(vid, si->active_vlans)) {
-		enetc_refresh_vlan_ht_filter(si);
-		enetc_set_vlan_ht_filter(hw, 0, *si->vlan_ht_filter);
-	}
-
-	return 0;
-}
-
 static void enetc_set_loopback(struct net_device *ndev, bool en)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
@@ -953,6 +922,7 @@ static const struct enetc_pf_ops enetc_pf_ops = {
 	.create_pcs = enetc_pf_create_pcs,
 	.destroy_pcs = enetc_pf_destroy_pcs,
 	.enable_psfp = enetc_psfp_enable,
+	.set_si_vlan_hash_filter = enetc_set_vlan_ht_filter,
 };
 
 static int enetc_pf_probe(struct pci_dev *pdev,
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
index 90137fbb8f48..704c4ee42f61 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
@@ -37,6 +37,7 @@ struct enetc_pf_ops {
 	struct phylink_pcs *(*create_pcs)(struct enetc_pf *pf, struct mii_bus *bus);
 	void (*destroy_pcs)(struct phylink_pcs *pcs);
 	int (*enable_psfp)(struct enetc_ndev_priv *priv);
+	void (*set_si_vlan_hash_filter)(struct enetc_hw *hw, int si, u64 hash);
 };
 
 struct enetc_pf {
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index a737a7f8c79e..9f812c1af7a3 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -343,5 +343,39 @@ void enetc_phylink_destroy(struct enetc_ndev_priv *priv)
 }
 EXPORT_SYMBOL_GPL(enetc_phylink_destroy);
 
+int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_pf *pf = enetc_si_priv(priv->si);
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
+	int idx;
+
+	__set_bit(vid, si->active_vlans);
+
+	idx = enetc_vid_hash_idx(vid);
+	if (!__test_and_set_bit(idx, si->vlan_ht_filter))
+		pf->ops->set_si_vlan_hash_filter(hw, 0, *si->vlan_ht_filter);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(enetc_vlan_rx_add_vid);
+
+int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_pf *pf = enetc_si_priv(priv->si);
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
+
+	if (__test_and_clear_bit(vid, si->active_vlans)) {
+		enetc_refresh_vlan_ht_filter(si);
+		pf->ops->set_si_vlan_hash_filter(hw, 0, *si->vlan_ht_filter);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(enetc_vlan_rx_del_vid);
+
 MODULE_DESCRIPTION("NXP ENETC PF common functionality driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
index 48f55ee743ad..253310859ca1 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
@@ -12,6 +12,8 @@ void enetc_mdiobus_destroy(struct enetc_pf *pf);
 int enetc_phylink_create(struct enetc_ndev_priv *priv, struct device_node *node,
 			 const struct phylink_mac_ops *ops);
 void enetc_phylink_destroy(struct enetc_ndev_priv *priv);
+int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid);
+int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid);
 
 static inline u16 enetc_get_ip_revision(struct enetc_hw *hw)
 {
-- 
2.34.1


