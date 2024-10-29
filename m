Return-Path: <linuxppc-dev+bounces-2665-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C58C9B4032
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 03:11:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XctzK4hDVz2yRZ;
	Tue, 29 Oct 2024 13:11:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::62e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730167885;
	cv=pass; b=IXcEg9nmFkd1iSOnsoJJvncRduNnKwPnFclmclpSyHB3PLqnVHzuybCpDIEPif+QRIoTdP6WnIyJ2zZXK3QwBYd+CIrqGWn2yX6AonyxA3gtT2jeBuEc0jY3qavdfYxdzB8stJIaoYfSponcS18pvn7CZ0h6LxveKHNBdqziOCPuGeKAcNn5HEGZSpaOQRui5zCopUbfyGtG5Q7zqlUMcCA8dPNlraJEO7mtNoIpULypj/VSr9oCuYsdFdMPh3bDng27MXhFJXpuy8ZBE/CPtbV5cKA1BzD0XG2zkBRtpnWJ7uwKrgj2dX7a5Fv/nTZ5oQaFKnb+ghcXmiK9koULpg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730167885; c=relaxed/relaxed;
	bh=asHgnuhLl7u97cA8ELXln78RhYt/mxLwaxyHgw0InHM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k1RZHogja/ofzOHwJWywe7cuPgH9oVkW0RsTuWzBGsEKcLm0cF1yPAMt1VCQ3JiwCuhso2KLIuQOLAnBq7uEQOiOIGINKj2HbCu9YsIhiS86ovFryLNZBLApxtF1VPR4VSR2vk2kTvLVYStEmnjsiA9RrR8+KHQwU/josxMdtXK33SzFGH0hHhfR9psuU8ep2JqQq3lu9E/n8kdX4JlJd44mkwlSUnI9Z4oO7o1R8soWA0qg5G5NUng/mRp59kx15cWzcNyX/7C67EUYf38eu+pxf/zKt19N7LLb04de64q4tdlxaoqMrcNRWjPdjlj9mfMblFqG/Vgg84NAIk8JKQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ATNnotJ0; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260e::62e; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ATNnotJ0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::62e; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XctzJ6l2Qz2yV8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 13:11:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oz0FKKpJC83pt4oFHaqm8JzkjUiKiREXflpCorO1K6I23Qg0cH76IPXehROQpYqmChqcBl7wlgVDV1dOZMo2hbQDqN1Q1U2QwKxm9fUxnP6kIejR1Rjs6vE3kY3ksFmdRQFyYnFu/RCxZTHwv6vdzr5lfNtk3J9LjFsB2SMaHBtYsA//3JCo2k4LHbL57sXQfrL59qdYK+dpnTdrFhX5MimFE3dzDMsXc47yPdaILKTv4g+R9cse3oAsZqNWXA6mpf4nPhe39kdcjqOpd5sd+GVeYT0ZpkRk+jz0KCSShKD3yciXjOuq+mpDwQjaer729oso//rrtiu6HkPYnQP8iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asHgnuhLl7u97cA8ELXln78RhYt/mxLwaxyHgw0InHM=;
 b=BzADbvMztVt6ZantumeTHbYY78xulRpypDonxS7bacGxP87XIwfZya46dPynI3nstQnZWbrnPatqcqyTMOmsquTpt2LPcQg/bv1UHpgDhGPkUkw5WLE2eDYqKkyLusQBxsGNUyij7d5uyXptHGjGVCf75w0ZWr83deO1LO6owMd1jDEw+ReuuG1NAq9mvwyd7E7IR//JAhLjGGhquru5KjquZFCMdTlRvomZjbXO93zgc9QRsuCUoXLcA39yi29JopmnuR7QyqdjTgAQoa6V/8xSrmCl/eS0zVYXV+cKU9/ZNEDVY+qk+QR/GDbcJ4AWUM2oiyITw36humlTIYz9Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asHgnuhLl7u97cA8ELXln78RhYt/mxLwaxyHgw0InHM=;
 b=ATNnotJ0sA7mm0T8DszCSPFlEEa/LzRdiaPDmQcY4SpflfpWtu8xOlfVKA2BZ4g/vNYMo6pR3lDSkk0/avKfOnWrgUEXeOPGcHCWKzK5i9XZ3LES7ZgjKffpGFV8dSx1pYuVADCJeYjJ8TD134NDKOboF4f+AmrP8PuH0+TosBHh5I1opdaj+7fniZ3JQda8k4dUjC/ffgHlxG+tbtcvmBOGOr216yzf8WzT8/Y4tC0h20oEkWkG4LpGgBG+zvTSpdGEXvTLDILAneoG9B60L/Elu5KEvb3fpOk1oqM20ZbSFVHC/huhTa90ir9/77Y8zpr3JE5y/1OOQ6BNb+cn+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU2PR04MB9147.eurprd04.prod.outlook.com (2603:10a6:10:2f6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 02:11:08 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 02:11:08 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 3/6] ASoC: fsl_easrc: define functions for memory to memory usage
Date: Tue, 29 Oct 2024 10:20:54 +0800
Message-Id: <20241029022057.816402-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241029022057.816402-1-shengjiu.wang@nxp.com>
References: <20241029022057.816402-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0031.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU2PR04MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: d091dd3b-07da-4f53-23a0-08dcf7bef3a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D6+DVRqj0OLGPH7+2qyZlQpCepNVARhfAyRdR4x/fsteDexLzdRE4g7kA4HI?=
 =?us-ascii?Q?W8ciOIrv3ehJ9i9DwMVDpvOPqNfIC1RMQPmIgTJyjxJenAfxJ4luw97WULXQ?=
 =?us-ascii?Q?on2Jj7YYVz3zVRzSxDcq7RKAecDfDLf+3UZcnsbNwrRDpsPG9JEMfuQNWEiu?=
 =?us-ascii?Q?rxPk8gf+Ane4zWsQ9+Z3AP2zWIFRiolZyxGLPfmtHoosnw6oHvzHFV0n8YNy?=
 =?us-ascii?Q?sZ5JyyrbymUsDBNWU5fl4EChv8dlGA1ZrvtotlcLxW/8GM1wcQbKOMya5t7g?=
 =?us-ascii?Q?KZzexKOrTl1vcv21WJl0UDaqiu/zGBXBzy+213h+AqDHVxndLO8o9E/PN5MI?=
 =?us-ascii?Q?0kA8KkspALgcoheYimclclah78eulo2Y/8xQSiqsWhjptx8MKLUarNZM3DoH?=
 =?us-ascii?Q?NVf+A8uMfGVCF2Gpmtgs2gepjz3ls/D6WZzLK+fygXeSeL6l3LJ4KxgbYAB0?=
 =?us-ascii?Q?uRDAK9HUR4rxt7B4FCqNOlVfcNQWFevx7Ba79pNIaXQbF5bC0bvezJ4u4fpf?=
 =?us-ascii?Q?euAuXvMdm1nbCiePA23hm3gKyO8n2jOnh7yQ5pQnx6JtP+9GWpeM45eqqoWv?=
 =?us-ascii?Q?mHyIaQkdxgf0CKZunJPCgk/1lrQgZqn7OBTwZA3DdTxHdWbQPNZRBHHzm8hi?=
 =?us-ascii?Q?POoZYx0+9nAEgBSjqBB6jwL2zM1KlbvPOBS+OIxX+SgDW60xg8gBM/ppyh7H?=
 =?us-ascii?Q?DG4f8atjG9nxaXxrV9b8zOFH0MA5f4Vy62lGOqUafHwvAoZCo4umYX+42CpW?=
 =?us-ascii?Q?JsrMfSfjAEFFS4ZIGcEgJWkDZ1x/BvqkuCXAhvSr9Xg/QeNUBUGkOWW1iLF8?=
 =?us-ascii?Q?bFMvCVukl5hDZW0NYilSEJxUuQqj1lvvTCbdTUEgxCqdFZzPPGLgibMWnhVR?=
 =?us-ascii?Q?xKRTaEw8FMCyLnU78XxQjV+UzcJQ3FyZyoT1G4mevwCGEBZEDFlApdKtxnQM?=
 =?us-ascii?Q?svpe1UlV20fjC1GO8qFkqb8Yvnwg+AG3Yhfe0i3cBcaMbrjac/ZQ/xj/bal2?=
 =?us-ascii?Q?/Gk0mGcRabbHIT717JVoi6TYXIQUeIYVSYg21/8ERmgVAiW9zo7jtSCr4DWQ?=
 =?us-ascii?Q?iPrbmQBQozrBZowhz91XItSjwGKOf4p9576AwM1Dx2LWKQThfSxdTdObdoSu?=
 =?us-ascii?Q?MQL1wB44AnkRsmxS4QWy4JQGVrK40+n5byW8GNODr475I6GDsrs56j3+8pfu?=
 =?us-ascii?Q?sczzVP+GBxRfsDIys8OibOLgqjy2hqXsGtMtuNxPnk/2pr6VQzWdbqfyrShW?=
 =?us-ascii?Q?2k3CGcrRk3+3TFbIGLapIXkJ9nnDUxykhaqD2dMhNSPK4Xcdli8Lyxzyp6fD?=
 =?us-ascii?Q?FGSMuWSCHkXenxdrNc0ImI2FHIGdThfTfhprxN6xGNHu5NniLOFNzvyqzP1Q?=
 =?us-ascii?Q?RkeBZa69iAK+Kw+ibUPXkdRsEHSf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NJISlu6V+pd5gwO467aojuPio7sPiI7WofVJivl66cMHfcmmv8mU56Y71V4d?=
 =?us-ascii?Q?QiUpx75Ux2YOOZtc3biK13bqTG4y25tPyAX1wgEWGPP4Ulwf3pCUQ6WuYpZ7?=
 =?us-ascii?Q?KtWTVp3nNzU8dyMLfPsIMJz6nMuDmiYQcHCRjzLgurIlFUt2b5288BAxFN1W?=
 =?us-ascii?Q?GYKvH4mUoWTtnv5+Mh4UYV/MRY6nqkS0/gwFFNhcsC6LmZUYkiTZORxeKWTA?=
 =?us-ascii?Q?YztVqCtaiC6mfZfCQ2av0J5KRaMAwscCU7shVgItFHb1kYkFKK3e37uita2q?=
 =?us-ascii?Q?Wm8IamV5O4D4A/cQ67PGBViaVnZqigNdWR4ql5qUKS31owzZ7BCje3CvODug?=
 =?us-ascii?Q?7ODErjKC/Uolp83+wrRqjfw1eMPR+qUm40qQUtXEm9lZPWP5zcNLMjbC9Kt5?=
 =?us-ascii?Q?A+9/lWZGPrYr1EaC4LeAHgQBZxBpnM9CWql/QTSMGD8fJwflCup/2wuXLxJP?=
 =?us-ascii?Q?KqknzZD65exSo13StmlGZM7j/MoUy+3/sr5a1LD0FW6MqmlHk0wh5px32ZP3?=
 =?us-ascii?Q?gst03fPYgHQtP8qlTi1M7fC7cqfNDYS9JYXMQGgfuHu0xIYTQM3/0lXk5359?=
 =?us-ascii?Q?fxhsbGnOhWqVxbDQqIZLUzabtreKsNaAY9Fd793vxBUAlPPkNXIv2bVicPYL?=
 =?us-ascii?Q?5WDfbzx0i2TqkkVujAK8JyyCDxJfsjHZR9Lz//B3E42BwfBIk6XS42t0/xAw?=
 =?us-ascii?Q?LEwJy34wFE1+b8FvZ52VNKV5GFGAJBLz4sE0GJ+GVNuCm9Ilvf1l/xVhoRp+?=
 =?us-ascii?Q?Fz71WOmrTkaBuLm7q9cZhK7DLZzBO8JeyTAJ0XGmrNDwYLRSIyAdTXWeCLXk?=
 =?us-ascii?Q?Fef/Hg0/jczuPEqW91VgPYd1Pl0t2KpDAjk02kVu3/iea/FKIjTaU3O5TWwW?=
 =?us-ascii?Q?AAYu7nepLnnLaXULwpHVy5XeupomhjE4iqECzfeuHnwPCjM3z4ocQ9/EnsYM?=
 =?us-ascii?Q?3yZgW1CMJjIuQrNjOC7v1nd81JAc3UYjQstomLo4P+Xof8yj7GHnUhTwOI4O?=
 =?us-ascii?Q?+VIzUCy5zpfzJsDtxbcv2ykI9A31TPeMEWtW60lXR0/JvlMnZ78SuMWGNk28?=
 =?us-ascii?Q?RadDq86FcBE9Zmzb/mYxwguwbWnaurc8Nq6mu+QHwb6Tba91jqe1MYmTIL8I?=
 =?us-ascii?Q?WzuEzOEQUReLeFs2xyqQt73zlbG/VUbe9Lr9sIWUo233u/2rmX2sx9PTsPC9?=
 =?us-ascii?Q?wOYA+7AzTnlUNTCqAdSoj5jQ5OBTPwI+iic8gffdsErDwgNKnodR1iUfOlS/?=
 =?us-ascii?Q?Ntq7PtBsVY1jDXiXdSrocBj5rz6CnKsseWK7ciAwGO23fNjMmnDW0X5wpiHU?=
 =?us-ascii?Q?owoWAZsUnLF1OOEDBclnfZxnIR10GyIqu84Lma9HNX01XGg1HNUstNZjDpS2?=
 =?us-ascii?Q?AvjVCLOAOPoRWKtcqwXzDIE5ahwdOMtnBy/yku9DvjfxRkchPZ5CF2ifVweA?=
 =?us-ascii?Q?NijtFZ49LcHdjMhNxQUrLjSoZ1N/sJyJEwv1oQh+/neRWpri7AgOBCWXTEkE?=
 =?us-ascii?Q?pMm4iKauuT6lS76YVjmNp673qBRAPeZmMJidSL3UyqHRyJF7FXHfGexWUDsj?=
 =?us-ascii?Q?MYVpY3hIDuUbNOHu0q6W74q4JxKpEwvSySQ1hz92?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d091dd3b-07da-4f53-23a0-08dcf7bef3a4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 02:11:08.5653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jr65gSRJtMFojErHxKDGmYdOu30KBG63Mn379bv0BwXiWHnYJzeBgM86K+lJ8ukU4IvKJ6K1dvLfohhJNr9TGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9147
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

ASRC can be used on memory to memory case, define several
functions for m2m usage and export them as function pointer.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/fsl/fsl_easrc.c | 228 ++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_easrc.h |   4 +
 2 files changed, 232 insertions(+)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index d22f0621c465..f17a185a1910 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1861,6 +1861,224 @@ static int fsl_easrc_get_fifo_addr(u8 dir, enum asrc_pair_index index)
 	return REG_EASRC_FIFO(dir, index);
 }
 
+/* Get sample numbers in FIFO */
+static unsigned int fsl_easrc_get_output_fifo_size(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	enum asrc_pair_index index = pair->index;
+	u32 val;
+
+	regmap_read(asrc->regmap, REG_EASRC_SFS(index), &val);
+	val &= EASRC_SFS_NSGO_MASK;
+
+	return val >> EASRC_SFS_NSGO_SHIFT;
+}
+
+static int fsl_easrc_m2m_prepare(struct fsl_asrc_pair *pair)
+{
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &asrc->pdev->dev;
+	int ret;
+
+	ctx_priv->in_params.sample_rate = pair->rate[IN];
+	ctx_priv->in_params.sample_format = pair->sample_format[IN];
+	ctx_priv->out_params.sample_rate = pair->rate[OUT];
+	ctx_priv->out_params.sample_format = pair->sample_format[OUT];
+
+	ctx_priv->in_params.fifo_wtmk = FSL_EASRC_INPUTFIFO_WML;
+	ctx_priv->out_params.fifo_wtmk = FSL_EASRC_OUTPUTFIFO_WML;
+	/* Fill the right half of the re-sampler with zeros */
+	ctx_priv->rs_init_mode = 0x2;
+	/* Zero fill the right half of the prefilter */
+	ctx_priv->pf_init_mode = 0x2;
+
+	ret = fsl_easrc_set_ctx_format(pair,
+				       &ctx_priv->in_params.sample_format,
+				       &ctx_priv->out_params.sample_format);
+	if (ret) {
+		dev_err(dev, "failed to set context format: %d\n", ret);
+		return ret;
+	}
+
+	ret = fsl_easrc_config_context(asrc, pair->index);
+	if (ret) {
+		dev_err(dev, "failed to config context %d\n", ret);
+		return ret;
+	}
+
+	ctx_priv->in_params.iterations = 1;
+	ctx_priv->in_params.group_len = pair->channels;
+	ctx_priv->in_params.access_len = pair->channels;
+	ctx_priv->out_params.iterations = 1;
+	ctx_priv->out_params.group_len = pair->channels;
+	ctx_priv->out_params.access_len = pair->channels;
+
+	ret = fsl_easrc_set_ctx_organziation(pair);
+	if (ret) {
+		dev_err(dev, "failed to set fifo organization\n");
+		return ret;
+	}
+
+	/* The context start flag */
+	pair->first_convert = 1;
+	return 0;
+}
+
+static int fsl_easrc_m2m_start(struct fsl_asrc_pair *pair)
+{
+	/* start context once */
+	if (pair->first_convert) {
+		fsl_easrc_start_context(pair);
+		pair->first_convert = 0;
+	}
+
+	return 0;
+}
+
+static int fsl_easrc_m2m_stop(struct fsl_asrc_pair *pair)
+{
+	/* Stop pair/context */
+	if (!pair->first_convert) {
+		fsl_easrc_stop_context(pair);
+		pair->first_convert = 1;
+	}
+
+	return 0;
+}
+
+/* calculate capture data length according to output data length and sample rate */
+static int fsl_easrc_m2m_calc_out_len(struct fsl_asrc_pair *pair, int input_buffer_length)
+{
+	struct fsl_asrc *easrc = pair->asrc;
+	struct fsl_easrc_priv *easrc_priv = easrc->private;
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+	unsigned int in_rate = ctx_priv->in_params.norm_rate;
+	unsigned int out_rate = ctx_priv->out_params.norm_rate;
+	unsigned int channels = pair->channels;
+	unsigned int in_samples, out_samples;
+	unsigned int in_width, out_width;
+	unsigned int out_length;
+	unsigned int frac_bits;
+	u64 val1, val2;
+
+	switch (easrc_priv->rs_num_taps) {
+	case EASRC_RS_32_TAPS:
+		/* integer bits = 5; */
+		frac_bits = 39;
+		break;
+	case EASRC_RS_64_TAPS:
+		/* integer bits = 6; */
+		frac_bits = 38;
+		break;
+	case EASRC_RS_128_TAPS:
+		/* integer bits = 7; */
+		frac_bits = 37;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val1 = (u64)in_rate << frac_bits;
+	do_div(val1, out_rate);
+	val1 += (s64)ctx_priv->ratio_mod << (frac_bits - 31);
+
+	in_width = snd_pcm_format_physical_width(ctx_priv->in_params.sample_format) / 8;
+	out_width = snd_pcm_format_physical_width(ctx_priv->out_params.sample_format) / 8;
+
+	ctx_priv->in_filled_len += input_buffer_length;
+	if (ctx_priv->in_filled_len <= ctx_priv->in_filled_sample * in_width * channels) {
+		out_length = 0;
+	} else {
+		in_samples = ctx_priv->in_filled_len / (in_width * channels) -
+			     ctx_priv->in_filled_sample;
+
+		/* right shift 12 bit to make ratio in 32bit space */
+		val2 = (u64)in_samples << (frac_bits - 12);
+		val1 = val1 >> 12;
+		do_div(val2, val1);
+		out_samples = val2;
+
+		out_length = out_samples * out_width * channels;
+		ctx_priv->in_filled_len = ctx_priv->in_filled_sample * in_width * channels;
+	}
+
+	return out_length;
+}
+
+static int fsl_easrc_m2m_get_maxburst(u8 dir, struct fsl_asrc_pair *pair)
+{
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+
+	if (dir == IN)
+		return ctx_priv->in_params.fifo_wtmk * pair->channels;
+	else
+		return ctx_priv->out_params.fifo_wtmk * pair->channels;
+}
+
+static int fsl_easrc_m2m_pair_suspend(struct fsl_asrc_pair *pair)
+{
+	fsl_easrc_stop_context(pair);
+
+	return 0;
+}
+
+static int fsl_easrc_m2m_pair_resume(struct fsl_asrc_pair *pair)
+{
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+
+	pair->first_convert = 1;
+	ctx_priv->in_filled_len = 0;
+
+	return 0;
+}
+
+/* val is Q31 */
+static int fsl_easrc_m2m_set_ratio_mod(struct fsl_asrc_pair *pair, int val)
+{
+	struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
+	struct fsl_asrc *easrc = pair->asrc;
+	struct fsl_easrc_priv *easrc_priv = easrc->private;
+	unsigned int frac_bits;
+
+	ctx_priv->ratio_mod += val;
+
+	switch (easrc_priv->rs_num_taps) {
+	case EASRC_RS_32_TAPS:
+		/* integer bits = 5; */
+		frac_bits = 39;
+		break;
+	case EASRC_RS_64_TAPS:
+		/* integer bits = 6; */
+		frac_bits = 38;
+		break;
+	case EASRC_RS_128_TAPS:
+		/* integer bits = 7; */
+		frac_bits = 37;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val <<= (frac_bits - 31);
+	regmap_write(easrc->regmap, REG_EASRC_RUC(pair->index), EASRC_RSUC_RS_RM(val));
+
+	return 0;
+}
+
+static int fsl_easrc_m2m_get_cap(struct fsl_asrc_m2m_cap *cap)
+{
+	cap->fmt_in = FSL_EASRC_FORMATS;
+	cap->fmt_out = FSL_EASRC_FORMATS | SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE;
+	cap->rate_in = easrc_rates;
+	cap->rate_in_count = ARRAY_SIZE(easrc_rates);
+	cap->rate_out = easrc_rates;
+	cap->rate_out_count = ARRAY_SIZE(easrc_rates);
+	cap->chan_min = 1;
+	cap->chan_max = 32;
+	return 0;
+}
+
 static const struct of_device_id fsl_easrc_dt_ids[] = {
 	{ .compatible = "fsl,imx8mn-easrc",},
 	{}
@@ -1926,6 +2144,16 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 	easrc->release_pair = fsl_easrc_release_context;
 	easrc->get_fifo_addr = fsl_easrc_get_fifo_addr;
 	easrc->pair_priv_size = sizeof(struct fsl_easrc_ctx_priv);
+	easrc->m2m_prepare = fsl_easrc_m2m_prepare;
+	easrc->m2m_start = fsl_easrc_m2m_start;
+	easrc->m2m_stop = fsl_easrc_m2m_stop;
+	easrc->get_output_fifo_size = fsl_easrc_get_output_fifo_size;
+	easrc->m2m_calc_out_len = fsl_easrc_m2m_calc_out_len;
+	easrc->m2m_get_maxburst = fsl_easrc_m2m_get_maxburst;
+	easrc->m2m_pair_suspend = fsl_easrc_m2m_pair_suspend;
+	easrc->m2m_pair_resume = fsl_easrc_m2m_pair_resume;
+	easrc->m2m_set_ratio_mod = fsl_easrc_m2m_set_ratio_mod;
+	easrc->m2m_get_cap = fsl_easrc_m2m_get_cap;
 
 	easrc_priv->rs_num_taps = EASRC_RS_32_TAPS;
 	easrc_priv->const_coeff = 0x3FF0000000000000;
diff --git a/sound/soc/fsl/fsl_easrc.h b/sound/soc/fsl/fsl_easrc.h
index 7c70dac52713..c9f770862662 100644
--- a/sound/soc/fsl/fsl_easrc.h
+++ b/sound/soc/fsl/fsl_easrc.h
@@ -601,6 +601,8 @@ struct fsl_easrc_slot {
  * @out_missed_sample: sample missed in output
  * @st1_addexp: exponent added for stage1
  * @st2_addexp: exponent added for stage2
+ * @ratio_mod: update ratio
+ * @in_filled_len: input filled length
  */
 struct fsl_easrc_ctx_priv {
 	struct fsl_easrc_io_params in_params;
@@ -618,6 +620,8 @@ struct fsl_easrc_ctx_priv {
 	int out_missed_sample;
 	int st1_addexp;
 	int st2_addexp;
+	int ratio_mod;
+	unsigned int in_filled_len;
 };
 
 /**
-- 
2.34.1


