Return-Path: <linuxppc-dev+bounces-5383-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A54BCA1681E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 09:20:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc3FD0WVxz2ytT;
	Mon, 20 Jan 2025 19:20:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::60d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737361248;
	cv=pass; b=bDLZsyEFwgfKFIoWC0cP8eWMJhqW+pCznzswzspTbEgJv3koxOOjcxqzF0h6BElhvnde/HoVpNovp0gHnG8ljMxFDqJRNV39veJJLvfHsvPlRUYDjgJNRrq1HYIF2MoNLv5CgyuTa/xVLAdAEF8dtaCBX9ScLaXeUFrpSwDwX7C840K1Wchhg5iFjgt5am5jIJbIOXBdr3i8jge/traPPNhqXk1OWPMDiyy9c2kpOXuh4QzZifWu4aiGZkEONd+a3IL4c8BCVCO6bwuyFysl4zgCCJXv7qphobxcuYYq3qgesiVcnDQ2uDvji6fN2xgBI7vAK7G0n98ds5a2kijutg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737361248; c=relaxed/relaxed;
	bh=OhOZ/Ju5+Xp6Bp0ZOvFWkAVgj34RVy2pGByYcIUiZvY=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Sp2r/kVqtGb2qAbmheUpgK8T89aGS1fvZEAr7OIi0t7hrc5klKsaoObTJy/yqoeXLOFw0KTrjBhaeEzp8q+2WKbyRerTy3zm0efeJjphwPXUQHVNXpvUa6S3Iay00kqnm9vrOjOf7xZjmD5efPSEhLBOPRGKi3EQNzT3ivlC5STVUdDqfyZ63GYoMhgPkGGi7/1LLiJCMtRvKCqMZWFgkCdGLQv9ZATKllO6x481YhPRp7RqOqeJIZyOUYQDTDJApndSIyIh7RrH/wVYcaYoKECwOFaDNrF6m4XaJP7Dz4vJgMNo5Hx0HBZrUPSU9+BgcN1YiPdlXujdVRk3Vw//Mw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=KVuZRJZY; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::60d; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=KVuZRJZY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::60d; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::60d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yc3FB2VWPz2ykc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2025 19:20:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pODqVOCVRWmleb5NSUlGPg8OtD8tiw6mEhxj4DwxeOuyTNuEK9haW/1O/I8b+imqtwXamLRpwAOEtBeQhGk3neL8+cLKWq3feW6qDLN6PQtA8DJpIsB7CrSIznAbQCoY9m7xbf/rPN6mn/R/JlnX9q+onO1M4pVSQCIlK3SEANIZfQAPFbGNY0jLo/zKkDNKe6uaNWEeeMWmLAOj3GPtBJmUeNzBWT9GZl1FU98avX2OQM4G9VRg6N4JlzdSAp3L5WspHB7enX+rfpdcftUCnT2TPvfdxfQ48jOWDpmSFBEhNPeVMoZh6SEEVLd744xZRgfo0uDK5wq1X76Gnjn9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhOZ/Ju5+Xp6Bp0ZOvFWkAVgj34RVy2pGByYcIUiZvY=;
 b=UfPrZ9tQ70nn+n0Gzhl2B/ME0QznxvPWShqXcYsMNBUzlH04RulNGg9O38yUJvHdW9O/BVzMqTi9dtcqEwAok0J3P0aEasSMa6azHVe1hKXkcHotEil1Et3k1X+kQCM9kUEDRP8zRscG6hjmpiNitDha8dNwwzkOQeFMZsDE+fHNmra/630xENnp+NHnYtXjC64HkkO4Dkr9zknrQ/L2tdcA6JVAdghgkCdBxthoTzr9pbQ0p/J0tG8xQAyLhrvsON6jwwjWVOZf5vYhfzMN7C7aUaYZiNI/X2/HhB6in770aPOROqr9hyIgV0PRuLvd8YUay2QXfOLRG2i7LZXteA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhOZ/Ju5+Xp6Bp0ZOvFWkAVgj34RVy2pGByYcIUiZvY=;
 b=KVuZRJZY4ipYMxL/AseAtSyPpaoPEvF/GPnxfqZVVP0hmkaUk8UEaokgvV8jNt6RLq8M1gUuiCc0scCesCyKQnLJAF6MKn3Xh+ZyUUUr6RhygmT6FxezMwFkSBOHpURzZOcWprbC1j7TUGly5RkZbRbPi+w2cmS3ESz5pMyVYtFLrpRQ/FyKc8B5HOgL4mUh61ZvNMvvEFUyRvLJ8M0vD6iAHijknmfwU2QFBwGa2bpCzLHGYnivkOswZxr/nkcuNYmJeh6t85Aa7tejeWrWiZK3Mp6048dQaj08hmgEsE/tHVi2GlUyUH4BJ89pPAX9j3yzQQPvHqUBZvXl+72OCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU2PR04MB8933.eurprd04.prod.outlook.com (2603:10a6:10:2e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 08:20:25 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 08:20:25 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: fsl: two fixes for asrc memory to memory
Date: Mon, 20 Jan 2025 16:19:36 +0800
Message-Id: <20250120081938.2501554-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU2PR04MB8933:EE_
X-MS-Office365-Filtering-Correlation-Id: a6a70616-5708-4dab-35f8-08dd392b4a21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bJR3Sq1v2fS+1cagCQnqQweUYPW3DxtB/GF8Ff/ev8t7pF/lkx+nfshL7Sff?=
 =?us-ascii?Q?KlNVlz8LD/gqFo+t+dVHCij6Lc/hreWHMqh8+8eK8b455QaWgg3O4kjRUYBQ?=
 =?us-ascii?Q?uL0pTVkO+vYsp3TyI9BHb41jG4Foec/C0Lczk2S9oLjGEZgIsT0qrb4+/QwQ?=
 =?us-ascii?Q?9Z1sTljkAEUgd7bQL2VWlP34b/hTJVdhLPCw0DqqZ8wStCAr6ZtU8BPtXJ4k?=
 =?us-ascii?Q?KWhyYI3myLyaYc2QatGu216Nm6/QWCL0lKW2H5s6D1h2VbSIGyqOBxVdd6NJ?=
 =?us-ascii?Q?5t1+Y3bZPXZTgQzrfMv7PcldVAWFATlGijCjhCQjWiuvYbHiM/Fvk30q+heO?=
 =?us-ascii?Q?0I5Wh56+Ke456C5dxyJkngEUug0RsgMl6ITZfjwft+GQeWqtXL/DYX1Dc4sL?=
 =?us-ascii?Q?O4jfHmV4125u4hk1V0Bin1dxDKhf86u56lwGOGxWaCIu8nOmzMEk52RCWRix?=
 =?us-ascii?Q?AXgw9xxPYcUUtEepY/+8qis4LiQh/K4yMR6s3MAkcK9k+mLLgwKk2Xa8b9OA?=
 =?us-ascii?Q?B0c/XfQJ4dBzo70exvAh4STPf+Vkn+qgfWJFbBss5aR/RudtZWeQ2ggT9E8R?=
 =?us-ascii?Q?G4gMn1kOVfQVWVE++Gp0umwcrVh2tdVxUMAPEQ5qF8STqZLkGGstnoBGMP/P?=
 =?us-ascii?Q?U71t6dGrYvZP2UgkgWzsRuLEilxCCoKXeT7PubcQHdG0OXvq5SMuWQCdCc0c?=
 =?us-ascii?Q?l6yFATEdMsU/1O7tmXWJjhz90usryOM72lb7J7v8NWhjPqG6rLHaY8JZRSfb?=
 =?us-ascii?Q?WObf1ahBMo9Hc4eX4o46HUaKCR4k/YPGXQMDR7/+As1H15ifSykBo17sGgBm?=
 =?us-ascii?Q?+Xpa5Tg/Mn+CbJXcgVFAVHl+mkmNToAaPamZG8hLc6U1MGiwzENh5l4Fc8df?=
 =?us-ascii?Q?TVqLYE3t+PT/iTb5eiQ/MzhKjYKfyxE2DDN1ks7+KIvEbu2bm4gEOTP1j9NE?=
 =?us-ascii?Q?CKvjXvkvgcDRxQPvyQQJj0yAdG8e+r7krSQ6W1ZKYdQL4Rni4az9tt9Pyycn?=
 =?us-ascii?Q?B0hNwi7Jhi3aSAME45FJddkESITsZkBfewz9DEsuXKR9ytaBQJnE4TSO4NEU?=
 =?us-ascii?Q?7BlFI7CCINKtJzMSGTvIJXjhJBauYAu1FU6yzLxL11WWIHFeODZGv3G2fZyl?=
 =?us-ascii?Q?tHFG+8YdoL2guL5agnEM0Yzq+O87Mlkdk0+LPiDPqaAnhkl6aMIGRtjArheW?=
 =?us-ascii?Q?iBrf1qeOzqdiJ5MXKgzNgu8sevJs3zOmpouFx6y+Nn2PNHd9JGLn01EgqCvc?=
 =?us-ascii?Q?hhjhp9f2sy8NjMY3LU3QTXhObIjrMYXm45FBJ0wkP/Tr3KrI5EA/jmkklU8C?=
 =?us-ascii?Q?sNLMS/K7uDp413+JHPC6LoJZpbwTiusc8LlHdLqG7uWhIw17UDU3yy+pG6eJ?=
 =?us-ascii?Q?QkZbwifOjzdkH7KSKPpTtasSIEFbY55/XaO2u8MsAeP4p9+CH2bKObDrg6Lq?=
 =?us-ascii?Q?A99Oe7yVVOtkCOwFEIXg0/auza0ksx4rBy3B6frNrL8SEbHxzzmU6A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DWEWD62E9ISnKXaDPQX8z/shLsX4TP5l72YAqt5Whz2+2dAsgC1XWcG4NqAD?=
 =?us-ascii?Q?x3jM4oDbvPgwm6QAjVPefZwgl1wqogvR7/BVxYZqBJGMdS8na6Je3hT45eWP?=
 =?us-ascii?Q?a47hx+aaBkiH7++R/wQsoa+p82DBT8s6kDfObL3qtnEub7aN/zU4AZ5ypuh4?=
 =?us-ascii?Q?ZvTV0o4yuLBUz31uj/uHdYV2+xoxmOdNxjINX4Vz+wvFxYhm79Pp60i6yUBs?=
 =?us-ascii?Q?porDGdG2U0ZYySuVLzi3/PBzTNXXFfODh/g4yfpdbovhybKCB1+yvEs2I/q+?=
 =?us-ascii?Q?ws0zXEAIPIb3I88Z6cmRfg9NAkMuvYfcmYa83bH2H2akl5RDjevGPYn/9IDI?=
 =?us-ascii?Q?U1YN8p70piIkbTeU/UdjqVCER1/feBqMuBNpayoMm+3OYb2XbQQqubpTg4Lh?=
 =?us-ascii?Q?LRU5mb4lrCii6leJ5hFGrH8xz1YwiVzRTtTlvzcvgfYB7E5gebiPoKZT1aps?=
 =?us-ascii?Q?DZkPWdzDN7hTRXYevVVD+H4Rn3sUOczyeB5giyK32mOEf/tCMLVrrk9wd8TQ?=
 =?us-ascii?Q?PE0PBRSBjeUu+pkehEYeW66dJP8K1pSv1Nxe2DNWv1plmki8FXS4UatNj1be?=
 =?us-ascii?Q?L21C0EbipzunFVwqHkjeHRrXLw8+wqej1/8g6aBJD6umEtgT3U6K2qtmr84d?=
 =?us-ascii?Q?UhEYb5vFCgQLH6uwd01b0cajOhOxcG4Jr5wZzwfPcijU/ghS7x/gqGwz5cUR?=
 =?us-ascii?Q?7FOaFH4yWTVSPsnXaYi7qHrm5aGhcr/maBVdIpR5xCE2FWBkVLB8oRvFXQM8?=
 =?us-ascii?Q?gvSO1FKx10JmaccrRjZWwa5oiQw/nIM6EsiZDaX6aVRaxHLI8fXoOTR3AIpj?=
 =?us-ascii?Q?G5kidnuzL7o3TgWeH9qQgn0W0bk6dpwaiFTtWXZWBTLVmfTICXHKZmb/KVU0?=
 =?us-ascii?Q?BIX26NCUqc7V+E3fbrjf8uCkvYvwlbKYtCDqghdOQKsRKrzAnroFEJTHZaRD?=
 =?us-ascii?Q?CQmydZjq/44YxOBetNdZdTMqXdQuj3yZdZJfyuW3x3Gd6PD4SzZK64RJzxoL?=
 =?us-ascii?Q?/9hjbBnzboNqlyB7dz4rW8p0oe3n5t9tygWC3APrDfdQSFZGB9k9M+RHVvCo?=
 =?us-ascii?Q?sE56UqYxmSbM4MoIRxCGPI5c31FcCeQmU7+TgtgtCZNvMUb35YgviCLIj7sA?=
 =?us-ascii?Q?Ls4WjchxFldhSfPepUTC/v8N42PCsHa/2iSShpz6tGa1bW4udXO1zd2uBNne?=
 =?us-ascii?Q?0ybBsjVcAx9nmlr6+FBUu0X6ppS6r7it/IQT9Mr8BVOlHeASwKxEp5dG2pBB?=
 =?us-ascii?Q?X1KgBk3N5TG8F4ivVsCSLqdgLot9zXDURdYi/GxuRFx4kdfhUvOtKAtMJcA8?=
 =?us-ascii?Q?CS01QOek9/FQH/zHfCpHVouNBX8UUs8VioUlr5AIoYM+mzojfYwI4rJkXH1s?=
 =?us-ascii?Q?ofQpbhCbPAdRPQpykgUWFQR0b4M149TVigjUV/e1BXm34bwiORF70NtEPPsp?=
 =?us-ascii?Q?Zg/5KYRnx2xCTZGGX16eAChBpBrKvEgEAa5kuprjm6O0wdFYe8mKF99HK5/K?=
 =?us-ascii?Q?XtrRFjHm/8kxoOo8e/I1ZGrHMgy/ebvbOkgCQA5PtRO8wlAxHfcA0NzgyBxe?=
 =?us-ascii?Q?k75DqjlYld/brz9yB05SO8jZ2Mmi1v1vqdkWKdc+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a70616-5708-4dab-35f8-08dd392b4a21
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 08:20:25.0556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aYpghnVqMLUwRLpaA4N0JVnEECFW7EPOqB0TAvII2NY3jt2inKswMsUGs9xjAvR/aQWDrl3mXFkU/A0JltobhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8933
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

1. Fix the suspend failure for memory to peripheral function.
2. Return error value for processing function.

Shengjiu Wang (2):
  ASoC: fsl_asrc_m2m: only handle pairs for m2m in the suspend
  ASoC: fsl_asrc_m2m: return error value in asrc_m2m_device_run()

 sound/soc/fsl/fsl_asrc_m2m.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

-- 
2.34.1


