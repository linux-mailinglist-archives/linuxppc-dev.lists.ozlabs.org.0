Return-Path: <linuxppc-dev+bounces-11769-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E1CB452B8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 11:14:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJ9dP0mdtz3blT;
	Fri,  5 Sep 2025 19:14:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757063640;
	cv=pass; b=TpXhkHYAj5KzF38DBMOsb2BrqQud4HWo0/Df1d/u0IpX5QvNZ6OTDyrx/882nBbGYxrthNsMvsE7AUuJ9mMHuZcqZUr9U5Xc6x7MPunpDcv5f5Muz3lrbfE5clcJTtTl/VEpSZyu9nDhud3ddeCzAHNnGQCyy0ME7GDjDx/tLxwyhPCEzFJY6kYKmpAVeLlL0ZbHtQlRmqhe4jlZvq58Bj1uPROfgMXDT1JlxKF2+726QslsZQU2duZDujUrAXp6P9xfvDilgsW/La4a9u0zoeFpm3oXiC6Hkucu0BCZAlgT81JREg83Myu3MqoS4AD18Pq50B3oj8/fF2XMnXbeDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757063640; c=relaxed/relaxed;
	bh=WgjxX+RyvozPBzUvY2PA/ambW/o0dcYBhvDlRYhlBuI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MlHYvBnkXn9MzV9XOF7iMQxRqRZ3nD00/roTciUVghXpoEi7J8V6rSu+O/IKZY5dLoQpM0n+6EkT2oRugFb4X3K79j3wDJTEQvR+Yavz5RQF4TLdPizswpG+LgcmoZh79+GMeo9g5k75cFEHrcf/zruLK9QNfrSnt8lZ40lzmu0C7esvY+chTL/wbBs1PhZM+JRb/xubork2srUNW1OZM7D566G43qYft163vSJI0hQ0cPTw3lHXOZ7Lc1TEfb9I0ViRasez/YmkXpwjBv3dbEEhXEFIIzB++mZxclrziGxdH/1U48DYqTSLhWUNpUTrN9oojnq593xR0zhzE6zdIg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=kvMnUfE4; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=zhao.xichao@vivo.com; receiver=lists.ozlabs.org) smtp.mailfrom=vivo.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=kvMnUfE4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vivo.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=zhao.xichao@vivo.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJ9dM0ZVlz3bcJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 19:13:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8bAks6mZMjsoCrUOR9I8i+kg91uw3Z9lfZGJj4UZsZSb8yPsSVQqiflQTPI4/fUVMrpUzmLROCc4FVZCHgObWGLLFiYn5dG8A+902J8+wt9/SZYTuYmX8RQRAPgjvI7EnuOsGTyAj2dLMD/xH6QX0Cbnbf1PkcCVe+LzOgYD2n/e0Zqe0ZzFQf38FXAguFLZWsMOliO/jv207YzgiVcEbVNksja70adQ2usiMvhsYJUN3ISX9whMasXqP6XdRbZGgPGlhP4TkogoTn/LuvROx5wpYj+/4fhGSPV23wF7+IV+jaLQ8bcaQVV4ZYHDdE8X+aMw08svtYqqE7jt1+Zfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgjxX+RyvozPBzUvY2PA/ambW/o0dcYBhvDlRYhlBuI=;
 b=tPU9WmoTjmLIY/Pq2ihEnnqQCfOpv0bJGVghTi5EMXXoo4XD5KDcnuvnp/j6OBVqas7Gv8y1ZRIwfR9yVdiIlb6G2Xg5ngcNCXDkw0bs3KmDvgvg1ZRDEbBNS4QFXoXms51z7wHDKjq7ZW8JCW36EZcwGVzpnDlpNjNVde75LQ4ezaxnDq1VGTuH5AIiMXGefM/qs2uWehbIBesOKiMEdNrk1YkEGR7hqskjP54LFnn+fBs0SZ9XhzTbBK3NogVk7+Yqw7YCIWGSLMXCwqRhS49rN0s8TPgg06R0RJPPi8eIDjq9Rfe00xED9hBEx6LEhdCixlGAFL5ac8lt4lQQ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgjxX+RyvozPBzUvY2PA/ambW/o0dcYBhvDlRYhlBuI=;
 b=kvMnUfE4oLT8php1baZlwMmyecd3VZhW9dlYgirfGbGCzwxaYlsLT4i+UiREk8RNP8+BVZFmOBTXcPwOz5dmxTsYyZ6yglKH2PAYodh52wYZF3KI1lONwbMmggPPMD3WRV+rZ5+t1lzGhUf3m2mLHVGxGuguLL9Esz4KUZp3ZnqbzMKbM6dLBDsB2zSCw6J6Ndn4P8Lbdim4ql38/2DRI4FrumM8CNst9srQOHhtbgWmRHzBLd77ReAJpTRMegDprcuCayQn1MJslrW+ID5s706DyVEza+naXDM+5O0hUAYZ2+dlbBiprbbJMgfLMd0VACmktwtt3JPWQYRhZwPtzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB7330.apcprd06.prod.outlook.com (2603:1096:820:146::7)
 by PUZPR06MB5518.apcprd06.prod.outlook.com (2603:1096:301:fd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 09:13:32 +0000
Received: from KL1PR06MB7330.apcprd06.prod.outlook.com
 ([fe80::d1d3:916:af43:55f5]) by KL1PR06MB7330.apcprd06.prod.outlook.com
 ([fe80::d1d3:916:af43:55f5%4]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 09:13:31 +0000
From: Xichao Zhao <zhao.xichao@vivo.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Xichao Zhao <zhao.xichao@vivo.com>
Subject: [PATCH] tty: remove redundant condition checks
Date: Fri,  5 Sep 2025 17:13:21 +0800
Message-Id: <20250905091321.437476-1-zhao.xichao@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0032.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::15) To KL1PR06MB7330.apcprd06.prod.outlook.com
 (2603:1096:820:146::7)
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
X-MS-TrafficTypeDiagnostic: KL1PR06MB7330:EE_|PUZPR06MB5518:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f887f6-47ff-46a7-6c21-08ddec5c7baf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kfP2usrRUGzQbQPQlFMpb9nRKZRFqA00SZguNreXVgmiavT1rM7wLlko8wvp?=
 =?us-ascii?Q?eAk0GfKempYmSeQgA3yR6PxkFrhLKAcwiBNlKaNYAyE2XDitGIdcQbw+l5U8?=
 =?us-ascii?Q?0Qp+g1iIGVQJc5sD4xtwBJfeWAWAAHhX5+hPT3tPhBj6QbBWCvkGZFZy6gTG?=
 =?us-ascii?Q?Ha63SKL8Kk+5ji98gVlAQyf1ttygeK9FJQL0uv35BXBit+pF0NhMPf3IXxtj?=
 =?us-ascii?Q?k7+CAS+fTmtbpWzRFeqTdgGca482E/usCPbr8ba39Bf7p+Umz/ZIm9AVMT6T?=
 =?us-ascii?Q?oAhsJ4T5GPBDRYkGVGucvGZKRbEdHpavSJ4LS9f1wNRVhknMSwvBV0oJhWti?=
 =?us-ascii?Q?ffUbCqy1qZoMdzvAESwpJ/oEHjbs7W6VR2nzGRMwR0fMD23hzdQrXoNeLFOS?=
 =?us-ascii?Q?Rf1FVMWu7B6HNRBiTfLr3KQyjWbDI0jQo3jdDexJoPiNRhT96FZ4zR0/ykXh?=
 =?us-ascii?Q?YwABXWxvDq5faSN771ciZIScmuhug+3gEN/S1I2HjQgxLBxecyy+5X56KXGb?=
 =?us-ascii?Q?t2043E1lUVt5fyF8mDrDY+xb/3x7/vzccA2E7UEZdT6pxgthixJrJA5gpe7h?=
 =?us-ascii?Q?ZyeWq7nAQQrtzW2M/J0jshdho9FGSCrjvjOPt/JCdz6WV47bcEJVi9KZnlwm?=
 =?us-ascii?Q?gWWKRDuxsUpP+MsYMzoVdhjzkU2Rpiapptz96FXIVTwbu2c8H7tV7sFeHCn0?=
 =?us-ascii?Q?nkgAfzoc1Iho6MzAyleJuLstBNx4jEoPYxMrbiwqSF1ftYrlrbZQ2HrMpDwU?=
 =?us-ascii?Q?U0agq8Kt//0/6cB/O9tQzjIBwQqsFf6cBP5JLBiBj9ZdYLc6N0S6eT2A0Y1N?=
 =?us-ascii?Q?yADP+N5NpkOy+a/xNPXZYCwzfzFgv7UvQH9nHK6iF/b/OZSxfSNcQ8p6cKkm?=
 =?us-ascii?Q?uEXDnLCOTRVpPufIseK7z251y/T/OW+SiR6AiAxaE4iVT3+IIJ/oP+EeIzhw?=
 =?us-ascii?Q?3rnpAzHZgIq8WVHkS6s2pKSmqIVnnIF1owm8MolxccG9RvshwmsVEH0jySfA?=
 =?us-ascii?Q?zl0iYQIuHVl+4LHpBIbQ8QpOAkBhIgCKw3V2aZ6f9Qepyltax1GkriSBF6L4?=
 =?us-ascii?Q?Hq8iGftExe6ShOAUqSBtg/zZ8tC43zj3FjYWQyLPEWkoilciTsadUR+SBixD?=
 =?us-ascii?Q?VeHZqDKNjGrcjYXMwaO4eaXwypBARElewbzgnpRdrw7LbH4DKf59R7DNnUtR?=
 =?us-ascii?Q?YpM2L0aYdF9Ota0u6yM0cNYjXAEdT+cZTosJoEbwgN0AyKAPMF/YXpuj6KGV?=
 =?us-ascii?Q?JdlAKMkJ4Gi2Ws43EEVji3TVhyTAaKzzr2UKZsTRwW2IexYg6Q1hv369phZk?=
 =?us-ascii?Q?n23yRBMLp2kXfa2cujFiXBDPKPUatFa3bQxd/IatnP86+hICqu931iiIDVk/?=
 =?us-ascii?Q?/Q2L6yaFU/uBwjOpVouVcq2H3d0BI4rK9p9ylx7qhWmW5AJ8yHW0XBnl1Sch?=
 =?us-ascii?Q?/0Z2Zb6n8D8HKQ6KDARuWXelBtiTIQVs6rAMuRM697g8aU1uVhsLag=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB7330.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZV2dkX+dwm0Z8Sw18mGt/gieWdyAzoh+Q29l5pc3rogEtCLi5e/DjwOwyzKy?=
 =?us-ascii?Q?VGpvrhcSAucXj3IRS3/LVVwWOv+KLj6bmqLGywTderYixxv6pWIhfKMLYRrj?=
 =?us-ascii?Q?5hcoJzQLiiNAy46goKiiJCXhvLyxOiXxTJ9uOJODhhgXN4ATR7NiaLB+66RA?=
 =?us-ascii?Q?qkey1QTsdWUswsUQI7SZH07yN9JHqBwbeeGafroITnDxm4mlI/dMZysBI2fq?=
 =?us-ascii?Q?aDIJ7th96QQhNBiIJ0hiIeucCFcgwzqhjrWTOGO67RoPzgQJgn2iN91cTPVa?=
 =?us-ascii?Q?sStUKCWDBOgbXpTm1ObysPr0RrgnP4awSBwu+NkMU+WVF8XzzGJ4J+CD1hUS?=
 =?us-ascii?Q?gpu9umuR9GFBloeMPA22GQbJ2W918OkHitmnk/ilnBvspbqPzvZ3OHtkEtlC?=
 =?us-ascii?Q?ibJ9iXZKcpwqtOES1UnLLkAc72MUNrEYaDI2mHQYW41r7syQUeAxpH0qImcb?=
 =?us-ascii?Q?CpNFU0ZHdiouMmEC80XACo4ZL8/dJaFYkegU1L3+coqsA8yNsDFKDLVYWpuK?=
 =?us-ascii?Q?RhA0ovx24fpY3iQ75mDVlWH2MlXK3OFplgyVmrhhTn/+R+fekPWe/1OdozVo?=
 =?us-ascii?Q?2fR4yRn1W9mfclOZJrCq3qDm6GkjL5OOuVjfkC1lMWcbX+WSIcr6yZxZeG4Y?=
 =?us-ascii?Q?ts9P7VwwA9EerbAQyKdm26ExpLEwmxyl5RHz6eQ0u2jNByRRmwawXmeERb1r?=
 =?us-ascii?Q?OvG8PzYo/4A5IQE/5KLebKRFkM/chaXgfQbGf1oBwImsRF28l2O32Mx7LqgH?=
 =?us-ascii?Q?EPBous8OgvEe5c4u5mCUyPVVIiwaisvxeqz9RG7hzMR7HOmnsRpJYKhvsgIw?=
 =?us-ascii?Q?hcf75c1Iihi8cL2ul8W1uGjNReSdIqTuZsXFfm5wEA5EG8WhMvOJ+8OBMtfm?=
 =?us-ascii?Q?FOTrkmra9tm6Sf0quz49BTq0SWRJF/47bNYZsY1ZSgRR4+iOfNsW4yTqJOlQ?=
 =?us-ascii?Q?eoYolFd0R0KGTdcFLrQhMmfJSWfKO6Rdrehge3x9KcrfEFMostJucfu0KHsQ?=
 =?us-ascii?Q?9C15F6kAnUYWPZ4aubxCVDtNgtdQbwta4GpoBKBoR2FPlDfzUCHTfvjTxxsX?=
 =?us-ascii?Q?40gPw15f/+nyN4BT8Zox3noPetp3oMDm3q2wXl5L4XZjm3360aSu/LPPCY8S?=
 =?us-ascii?Q?uFoYe/CzyjS8EtpreDmIHFJgTWoST2BixHAlrPDCNxtdSGx2OjHmIbvCZeX0?=
 =?us-ascii?Q?0X0dY/GG7NakCETUGIMy8Fp8vvUZJechpTnFfJ/H6iqNvaFNQ3LgPWCXYT2L?=
 =?us-ascii?Q?IdfWJRgAnICvO0a1mNMEgOScLxgpl06Z1PPtmOXiblfOD6H8ulkX0NK82jID?=
 =?us-ascii?Q?dVXVSoF1w5cg8cqwGIh0iFrwg4dO+jTdmR9M2fdvJNAnuz4OyCvKhlWt2Nh0?=
 =?us-ascii?Q?Oav0t0JH2OP+fWY3ene2QQCtdW+4Niy8TRuojNDVJTTe8RfolLY9qyRYMSO/?=
 =?us-ascii?Q?nob8AS/Cu5K1xMkHHE/AcQZw/cpPJDYKrZTBLq9bhS/s8qSs1g2kNTh1OBeA?=
 =?us-ascii?Q?eYJONtWZPhAxUcnT9SnpzBbGVAbi3PKm9G7QkO/JiNfmNDh7bodAHI+171U9?=
 =?us-ascii?Q?aBz/slMFgQinnxkuT18iVPBg+iTcr3vricJjpibu?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f887f6-47ff-46a7-6c21-08ddec5c7baf
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB7330.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 09:13:31.5233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d03RVGeyqR46pAVJAno3G/eW/NYjD6WlANvFRg5BnIhfnXlXKsbBn70UAsSkdMK7RHetr9RZwCnHvUUKNnmZfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5518
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Remove redundant condition checks and replace else if with else.

Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
---
 drivers/tty/hvc/hvc_console.c   | 2 +-
 drivers/tty/serial/msm_serial.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index cd1f657f782d..fffc30b9ea54 100644
--- a/drivers/tty/hvc/hvc_console.c
+++ b/drivers/tty/hvc/hvc_console.c
@@ -184,7 +184,7 @@ static void hvc_console_print(struct console *co, const char *b,
 					hvc_console_flush(cons_ops[index],
 						      vtermnos[index]);
 				}
-			} else if (r > 0) {
+			} else {
 				i -= r;
 				if (i > 0)
 					memmove(c, c+r, i);
diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index 3449945493ce..2e999cb9c974 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -1102,7 +1102,7 @@ msm_find_best_baud(struct uart_port *port, unsigned int baud,
 
 			if (result == baud)
 				break;
-		} else if (entry->divisor > divisor) {
+		} else {
 			old = target;
 			target = clk_round_rate(msm_port->clk, old + 1);
 			/*
-- 
2.34.1


