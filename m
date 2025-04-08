Return-Path: <linuxppc-dev+bounces-7542-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5267A7FD45
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 12:59:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZX33t0fLdz30T0;
	Tue,  8 Apr 2025 20:59:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260c::61f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744109946;
	cv=pass; b=jLx8fiKpEtYMj2TqtMklUNwshD3vL5Or15K73kAfxca3p8/v0qj8Y5Jao0sdhSvIR77iN5i3118ubilBwiXu9b3Xp42iEMHNQvlYwFT7Xz15uSX+DkZ5xGyS7+BD+ORmn0jf2Cnlk1jTP4XwoajPl/9QEG84Kx6t74kzTEgev/C5BytDGzNVVIFU20PWa9BIEjG/Uc4U6k0qlRT2byvSh1YpVgbX3vOwSv7n1ngEvYLQ001xPSLE+vVQINR6ZENpZuQCNDIdJq7C9X4w3A2u9qUczmnIv9DXCp5OBfBrENz1sDbtiSOxgO/5h1YwZv9fOFs6+kSBZihPii2zY8RsoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744109946; c=relaxed/relaxed;
	bh=kEkzJB/x5OLsqgBdRcfXmTmU5yTy8YH+9hbOUG55lTM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AJRPs7sKA1rFGekFZmN077hpLcflEjd4MUzF/gYynsP/NTzhTmlrGhEaWOoBjJtJM/xVybQRgwE9TDTViRz6Gk7AfzggN4HNWknu+0QWvYGlcj9CXYKY+xopUzJr2e6AMI2C5yxmDm0t3yryaYITFU4RLIOYw7vXcfuv4OdDX75b6UhBKqT7NdNkFN8J3p3BSZ0AV14LpNWm9+l0jjh0LlP78j1JQCiTaMvfemknkgfPz2o6IK1ujEzyHfeRtrZRiGmCKVh4J/kKFYdAYAio7aAhtDdzH6VD7+z2TbPoGxqsS/hbwrLMlZCUi2YkMlT5PRaR6wEYJL6X87IgupXrFQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=mj6JFHiK; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260c::61f; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=mj6JFHiK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260c::61f; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f403:260c::61f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZX33r6rhTz30P3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 20:59:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jirVDei7x5b3c3Kz37/R8ofFQxHUy/54lDzQj/7jKZ+q8JOHP+q/heH2Pmck6w/KrVta1F4q2RPuNtZjABaI+xltUNLHIFwUufaXIe+Xm9nIbqp9LH9+Nwk4KD7a7uYBNmHsCRY/29ylATMLmCjce26alq40UDbm1JJPGMGAvIa2lQ7V4fvLgMwaOlmZGixSuuL16Mrvt8BxNHE/htNR6031NPnWXf58dnNH0CpfQFeg+oV0Kx3Oa/++zv0O34SttMo2eW4LO/j7ddhrUL0nL5hD85OOi6ED7dUzP3jkVgNH7ZElYSZ9rEKXERb7f9oTXkbGL/a6roij7b4xayNgxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEkzJB/x5OLsqgBdRcfXmTmU5yTy8YH+9hbOUG55lTM=;
 b=s320ZjN+Yl6ZUIACj5gaPMGfOL9XZKV9ANLfjUaNMb6gG5OklZnvvll5GOEWkBZGT3EtQEPj2v+b07T6fwqXuGucexkEutGag2jhx16aZQxX0SHhTUWWl/C+QVaO+WUQaptrdtpG7F0ORAB7m2ZHsEk3jwZmahBz5UOgDQd9RjjKlwi0r17HUJI02YWyDSSZIF8IQfFW1z919uaBVkXRIQPrqq034I8qPY2vkTKI+/+feqs9QSkoCkj+hfrGWrCP+2Za9n1TmTXrJstTnD9jMoC5vJRX4jA7vy9Bln6fWQT6HxUkiI9F3EYcIiHeiz40SOR6tvX15NnuEavYdqcKwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEkzJB/x5OLsqgBdRcfXmTmU5yTy8YH+9hbOUG55lTM=;
 b=mj6JFHiK6lIud+XJ1cYxl+pJXMmDP49uXygOJO/a7skqjFvWtF2ylTJqhUNyKRpdwerpIk4y/vqHf619ON3XyQhDA2hbiRYJ+UCY2vfYesKhCMWWa49H6d2Ho3WNXGlCdkJst0Az+l238Ng4f56tgW8sB8/5jaGlKSn3q39dfvSplFLDnLci4XPPc+4lgVayuH2EbPiQNUg6dlVezp1PhZmnYmKTC/4dS42h9ESENfntCYUD0oAE5H5NrFQDZQXrmHHDwTuNtD0Ub5zP9WMfq6gvlBptJCkLdEOyThL6MiDG8d9F07M/ttPzZxmqOPgWSi2vva2IMtwalbZ+BWZNzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 10:58:40 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 10:58:40 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	christophe.leroy@csgroup.eu,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: [PATCH 5/6] bus: fsl-mc: drop useless cleanup
Date: Tue,  8 Apr 2025 13:58:13 +0300
Message-Id: <20250408105814.2837951-6-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408105814.2837951-1-ioana.ciornei@nxp.com>
References: <20250408105814.2837951-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0003.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::19) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB9176:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d2a9635-3ada-4e9d-c7af-08dd768c5230
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pljf3psaxWPq7pSoj29DZoM8st5u+RaAACkyVM5IGsDFAF1fSdjhlkE9vYkQ?=
 =?us-ascii?Q?jmFzSqGT4W088wBNoiWZIVT0NW5g1t1aQQoYe1UihKnmsvH8lg+vjXotuzZm?=
 =?us-ascii?Q?TPsO0a2OefbpNI4pkrIT8AJ95xtv36I+P76/ymE9AciUbVZijzl4JpiHEWTl?=
 =?us-ascii?Q?P3t34lA39v82NTyR+fM/s9r8/79SkrwpLGDTkygmJKzwNMxt4zF9Qn2j7BoC?=
 =?us-ascii?Q?USmGKWqFvrDzd/XT3iZTZ9uf8VP2DSdR5tqRuehDUdg5xGHnSUEAiayE0XtU?=
 =?us-ascii?Q?CeYpD9yqjuuxwmXqDQCqHHZBjTKlxFYALSbYElEBuon2F8y78RkDaYd+fc5L?=
 =?us-ascii?Q?g8Ubv96grRkLvVMj/KabX0dl0m8lwv5I2amLZG5bJB9q6fhn0VlMVOlZm8rc?=
 =?us-ascii?Q?h/8lUfE1mU1VfMxBVEM2jf3Nb9w9ZlIcO9X6sfymZnIM72DtnFHLYL7JAvVI?=
 =?us-ascii?Q?z7UkBaVE/7Y5++HlCh3w2ZYgOSi9EvY2PeOiVHOVfHhD+rirn5m9+OGTs5Jt?=
 =?us-ascii?Q?MAxWhqtncJvc2aPpSOCisy0HIEf/i/kVtCOL3AE0L1cshnQ7Q3oOGIRo4pRt?=
 =?us-ascii?Q?y3cjYz8H0iDQcrTfo7/lizmwfNDlASLrodKbB8mpw02PrSh3LmrVxVYweiyv?=
 =?us-ascii?Q?od5c9wO1Lab96sYr47t/IHssivvwD9PY7U8ryKHzWGvMzJNoxfCcZKIcoMIE?=
 =?us-ascii?Q?yxjFLNPPxsmQVxTAIC22RefXZ1EzatsrIJq/n5hNsW6/tO1txkiDzB+Y5kru?=
 =?us-ascii?Q?5TnKgKo+3YwrekO1HYYmxR/zr7iRjiA54S6xGFwyipYpyR3/0Ws4Y9FNOFX2?=
 =?us-ascii?Q?vQ7LEU3Kzq6EnZLZYPA5NuxO425v1ktV2by+9DTKrWQNoZ+/HdxH2Dyhdelm?=
 =?us-ascii?Q?FvPY5SOIYKHxC039/dHWAmQnWsWRiympXgnw98ZE9uVADJPyV/yAgFNcD4+D?=
 =?us-ascii?Q?0gm2ecjiQ0S284eHzpoldoIQLyGArZzyzM8+z579xDuFQ9cmtoF077FRzjRI?=
 =?us-ascii?Q?eFPP7sRQXILrlbzSc/U/uVanTwx9gDnLS7HYu4JZvMgZ5h6IRbFC/kjd1CpS?=
 =?us-ascii?Q?LFEpDYWabuKBWhYTm4q+rSOYCO5pllJy6lKZnF79LuC0VzZ5Tozfto+5LJSk?=
 =?us-ascii?Q?yK8NuU9iqDlGFm6AdDeC/YpET8wBgat1Cmi6m6vmzbgCXAKKUR8ywXLMKCA4?=
 =?us-ascii?Q?/feCFZ8TCt1jQr2ulMpZ/V4r7SGjEglvfj2a2hfpjXMJin6TufW/VgWOcc2n?=
 =?us-ascii?Q?mYVjFRrQkKXTxV5QHJeP1bdswV+mpbGBc/mieeGgbRt08Ceif8pJB8vU8+17?=
 =?us-ascii?Q?AkkHKizDlvLP3RbI2eykb1zZupr6uIdfzfZ5pvgTKxgD/i3y00KtH4Z7YUXh?=
 =?us-ascii?Q?PGjQH8J4Bz9Hima0EDSx32k7BE8f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AgBNTM/8IiaIM+jPbCdmSS0ggynjeTPRNxJJliCssGMrRMGCn0pHLDDGc/U2?=
 =?us-ascii?Q?o/dyB8F05obk4hVTiCv3WTsMQaPSYIOX2XQC5AEgU5OC1pSbvdQX5jzDqjoe?=
 =?us-ascii?Q?4ObM3vwx3Zlk+PgJjGAEkLAKcfebI7JJLS3I9P6CR0IdGZOuCFa5J9JzXBFz?=
 =?us-ascii?Q?uxcLyueS+u+Qd79rnVRoDfISw0PDynXwiXqib3QK88AvtafxCKboTrwTB57J?=
 =?us-ascii?Q?7BUDnE0EVBKcj4OGzdPlbZRv+4vDCze8wItyXSoSm4f//hkqEZ78GFUu1E7B?=
 =?us-ascii?Q?LfQm6YeXXIXuDYNzQWbBadHhVo8o77YIMsLTOuklzKV5Q1vAQfDOe+4SDwXV?=
 =?us-ascii?Q?yA87JXqf8Zs+9XqDZtlDHYLu52lDhMbJtyU8i3rnE4XB30sqrBpIz85l84Q/?=
 =?us-ascii?Q?KrZtpZXUMbQ9HjBsq2wDMDJiz4xG8A/hcI2IpsBV7iMWnV30gnwjy7RyAbDu?=
 =?us-ascii?Q?MPZkQJ3VyHMZAet2VQA171fM8QryIMPFCaHKrBlC9hgBxucK+avhjOJQmgYG?=
 =?us-ascii?Q?94qwRP/U7nHajNFCvGK/VOyzb3B0gsDGkHc10iBAoDm+bHHpmqE5iE+Iim/Y?=
 =?us-ascii?Q?K0vBPj6kT1xDsUjqumqksMs/MXeWf3YrHiaVQL6ZjvwrBpIs5fCIxmjQHJO+?=
 =?us-ascii?Q?2dZV4JB6GmjWPczCLUP664PDFS0ke3JNpDBUFsluJ6xnN5P9vyeeuTaCZOmp?=
 =?us-ascii?Q?F9alM+bc6QALvpkQhyb3ZOJEwAd/g71Of1jsTc5Krk5DlFRZjFRSppHmfHmo?=
 =?us-ascii?Q?iJ0RHm7+AarpkLZow14rm5XPR7uyYKLCGOXYP4caoU7O4EkAHBJoBjy7lQor?=
 =?us-ascii?Q?FhBfVNoHk+HfaTzUxOiLudcxYhv5cUFNMjcwobB8Z09cKcqd4Btj8amn5vUc?=
 =?us-ascii?Q?lnIQB1pjutYtLp335ACkdUS2ohu7a3S85mecQYWNTekReB2ULWBrEiJ4/epQ?=
 =?us-ascii?Q?JEhaX3Op3e5q/onchV4m+zK2DN5vwkEkrOsaqPJ/YuuOXeG2hDbgxmCg5jrL?=
 =?us-ascii?Q?AgxGY+aBcam9ogwIN1OQjc0NvQHWE4ADjGnbmd8kPcV9kXD64umx3YG6Q3p1?=
 =?us-ascii?Q?RMooH2Oc2e7RWZgriwJbyx/3loZ6mPXF625sCFjV26mVD+btAfhJ0P7YgTfo?=
 =?us-ascii?Q?A3tbbdQNe4zhCCXuhMWgqfXKIp+PZDc4VoWzQ3LV5oGJkHGiTx639V665bfm?=
 =?us-ascii?Q?rodUxTDrSm2z2HDSwS6TU32eoXLOPjLQ1/IDj5VByTbhWqF2p+pThy3MUUUH?=
 =?us-ascii?Q?nl5BDmRv1TcE/KqU4BqbYgN6EIgUV2nYPFttN3wYdZ5BSkpr2a31x6rAE0ZH?=
 =?us-ascii?Q?1j3K1DWwdqwC4lpNuVEpCcqd4D+vxsZ+XX2OWr6P4vAnhYUjH5VOfW0OCe12?=
 =?us-ascii?Q?XtTfCCICzv30sAXK1ksONt+FSRn+NofcTxNdeeSF92JzuMuZVhaHvVcF5E9+?=
 =?us-ascii?Q?JUlzDDRQUrT8eAVaKdu4qo7791qvMylORvILRv4pS2TBFXYeAA8gF5Ewvmb5?=
 =?us-ascii?Q?Jp8WkOkghSo5AdfpRYkGtLGl7RrhtzwIYqbvPrv6rxofWiyaW1YmTeisoz9o?=
 =?us-ascii?Q?aPK2L6LVRZeaqKTuqr/v4gDyHzkxvW6w6/Jsu7Ev?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2a9635-3ada-4e9d-c7af-08dd768c5230
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 10:58:40.4147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PsS450asuiee7cucBParUmI1vBPWtrlogYSJ4Mei6RufYYqqugTKkdeUuc6xdWwLcb+ZuzUHsmI2ZP9IgwFtgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9176
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>

This cleanup is actually a no-op because the resources are freed when
the device objects are removed from the allocator at driver remove
time. Remove the fsl_mc_cleanup_all_resource_pools() function and its
call site.

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 drivers/bus/fsl-mc/dprc-driver.c      |  2 --
 drivers/bus/fsl-mc/fsl-mc-allocator.c | 21 ---------------------
 drivers/bus/fsl-mc/fsl-mc-private.h   |  2 --
 3 files changed, 25 deletions(-)

diff --git a/drivers/bus/fsl-mc/dprc-driver.c b/drivers/bus/fsl-mc/dprc-driver.c
index 52053f7c6d9a..c63a7e688db6 100644
--- a/drivers/bus/fsl-mc/dprc-driver.c
+++ b/drivers/bus/fsl-mc/dprc-driver.c
@@ -806,8 +806,6 @@ int dprc_cleanup(struct fsl_mc_device *mc_dev)
 		dev_set_msi_domain(&mc_dev->dev, NULL);
 	}
 
-	fsl_mc_cleanup_all_resource_pools(mc_dev);
-
 	/* if this step fails we cannot go further with cleanup as there is no way of
 	 * communicating with the firmware
 	 */
diff --git a/drivers/bus/fsl-mc/fsl-mc-allocator.c b/drivers/bus/fsl-mc/fsl-mc-allocator.c
index 6c3beb82dd1b..d2ea59471323 100644
--- a/drivers/bus/fsl-mc/fsl-mc-allocator.c
+++ b/drivers/bus/fsl-mc/fsl-mc-allocator.c
@@ -555,27 +555,6 @@ void fsl_mc_init_all_resource_pools(struct fsl_mc_device *mc_bus_dev)
 	}
 }
 
-static void fsl_mc_cleanup_resource_pool(struct fsl_mc_device *mc_bus_dev,
-					 enum fsl_mc_pool_type pool_type)
-{
-	struct fsl_mc_resource *resource;
-	struct fsl_mc_resource *next;
-	struct fsl_mc_bus *mc_bus = to_fsl_mc_bus(mc_bus_dev);
-	struct fsl_mc_resource_pool *res_pool =
-					&mc_bus->resource_pools[pool_type];
-
-	list_for_each_entry_safe(resource, next, &res_pool->free_list, node)
-		devm_kfree(&mc_bus_dev->dev, resource);
-}
-
-void fsl_mc_cleanup_all_resource_pools(struct fsl_mc_device *mc_bus_dev)
-{
-	int pool_type;
-
-	for (pool_type = 0; pool_type < FSL_MC_NUM_POOL_TYPES; pool_type++)
-		fsl_mc_cleanup_resource_pool(mc_bus_dev, pool_type);
-}
-
 /*
  * fsl_mc_allocator_probe - callback invoked when an allocatable device is
  * being added to the system
diff --git a/drivers/bus/fsl-mc/fsl-mc-private.h b/drivers/bus/fsl-mc/fsl-mc-private.h
index e1b7ec3ed1a7..beed4c53533d 100644
--- a/drivers/bus/fsl-mc/fsl-mc-private.h
+++ b/drivers/bus/fsl-mc/fsl-mc-private.h
@@ -629,8 +629,6 @@ int __init fsl_mc_allocator_driver_init(void);
 
 void fsl_mc_init_all_resource_pools(struct fsl_mc_device *mc_bus_dev);
 
-void fsl_mc_cleanup_all_resource_pools(struct fsl_mc_device *mc_bus_dev);
-
 int __must_check fsl_mc_resource_allocate(struct fsl_mc_bus *mc_bus,
 					  enum fsl_mc_pool_type pool_type,
 					  struct fsl_mc_resource
-- 
2.34.1


