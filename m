Return-Path: <linuxppc-dev+bounces-3771-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA2A9E3324
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 06:35:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y35nP1dNkz30Vs;
	Wed,  4 Dec 2024 16:34:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::626" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733290489;
	cv=pass; b=Wv9qzCJrTylKM8eH1aJZHiXsNkM+mbuwE1qOrGWJJY+5cgT//SPmUYbv4xfOjsg9rrwOVHaEJKEqgsj6EeypxRlcOJO3RvtBJM8oOwe6JZ4F3+vquDpFHAUmrhBRfHl+Bpp1KROnDm/FlZmg25dSOb5jr3M2O5n40R8U1t718NHBfxB37fQg2n+vE61br3S9E52bV83jBqwGL7VGxNXFjG4wFJILUTDO139ljwdblEXsASs9jSC5lqzo2eZDaSHEDUePWkuMGzZ5bZSnHMzeW5qWn0vXpHMA18GZKJzaysFL7md8UkpkvwgzUQpGSmDi9LewpKCwYbmHK0r22ccDNA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733290489; c=relaxed/relaxed;
	bh=Gx4r59MsUrRSAYnRBL2LULLZNbMWnLuBxzcN1FydhN0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o1Z7gdLPTFMjwmBzesEVgLn+fgiiZQiTF3jpVRLjwRkS6c6ocIfhKviW/XSH8ckVgDiu2g6TmBcee7SBL43x55Nby+a7TyP/njFrQ3Ft1OWxUh/CvXJmSLBLinrYg9uRGE+dpuH/054G26iWJHZy1Z70FwqZUhUWpoh6uTSekMN88XLTNE/sMhrkcnBtXmNh7Uqw2oqXuFhRzHSqgXkfukc/h0EuLIO/sw0cZ04r3CDFh71MmU9DAi/2Q/3tkar6pXgQ5U7vJGQHUb6LpeY0yBtDlgZ9HvIf7s3RfvpwbWKtafN1az0pmIrITJUQKok2TONrnNlo0s2GcdnZabbXTQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=gPDT8RV3; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::626; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=gPDT8RV3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::626; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20626.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::626])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y35nN4C4Wz30Vf
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 16:34:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rq/PQVJTKn6d0K2abJQ1t3/A9AWzedtMOmZsgoi3fIOTeY0+eaWEHh4rmP2enHzGgHlVPI/AlCaHCD25Tkk0We76qtTP/ihUyaOInGbCqQ5Ax9ZJR837jkRzSNOuWGMQCN4zCbwdH3bzUXeHjPyaHQgoqxybnCDRfv2u3WBIf3CMzeuikoOFMahJUvmQ5u8p0NMDLjsqn9dGDZC4AcUd7JG59vj2UkyO6z4MucE/8keiiOTD2Kd+fFiJEw86a/0rcIFPqvUnWgHJh58Oxu8L1FLqK/X5/wZBovu+FPa5FfRj0YjNO6Bdsx/g4gr4WDB9vSPgFv3MwKCYPrTwhWeCNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gx4r59MsUrRSAYnRBL2LULLZNbMWnLuBxzcN1FydhN0=;
 b=Ro/FUBltVysLhRJa1NBQVPlE3827U2mTI9kWey6A4EW8VcciCoLbwJdCBgwwmzRtXDmhHMvT6OqHvUkE9MBO8OHnmCP6GpxXI3T56P+22TEtIorfpB30FLYVwFK5dNphZ13iTjpzMETrgig1EsfRM3uFuhiQOEUsxRZIuTfl4k8DnoInrhqWUUumLDmqSVcywNpcfQ+c/vaD1FCDQR4GTESm5TYQJAxCyMSmRb0w0UIwQ/ZLxLtWDTkSvGpL72QlV7AOUEiTO/FJjlE/8a6rZ6Sms6EIZi5XymBmsSx+yEhgqjGWbzBohEYRASaa4aDsxpTvLQHmg8odW7s9riNSmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gx4r59MsUrRSAYnRBL2LULLZNbMWnLuBxzcN1FydhN0=;
 b=gPDT8RV3/BBtRhzlNTzw6vXGGTaItGm0qIdM10lAU/zUXdZn8rikqWQsY9L1ibwozU0xh4x0R07yFpLhZ+zsqKoh/INAq9fBMilK1SzQALvAyNDjw4o5+blMyxVlhqVxzxqCHTpMxaOOi+vZjiA0tvtUKDV5Zzlo87yqRUJvF24ngK8P5+YpPfdAUWRw1elJntdlM0uEil/cH+mPc7NteqHr6+9ygPBwOqzBYFkqVR1XkvoOVmFX62NgIJVizyMzY1MUGYRh0puSQ4LC8ESBMks8Dp6TBT/uzkpxLItVtbcY9vjuQQRn9BmrFsoKy0Iui2uY52rMryLYLbSIb1u2Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV1PR04MB10125.eurprd04.prod.outlook.com (2603:10a6:150:1ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 05:34:39 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8230.008; Wed, 4 Dec 2024
 05:34:39 +0000
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
Subject: [PATCH v5 RESEND 5/6] ASoC: fsl_asrc: register m2m platform device
Date: Wed,  4 Dec 2024 13:33:45 +0800
Message-Id: <20241204053346.1865723-6-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241204053346.1865723-1-shengjiu.wang@nxp.com>
References: <20241204053346.1865723-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GV1PR04MB10125:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f7cfa9-19b8-40c5-7725-08dd14255884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dIdsaZStmUIQIzZqC5/q9S5HuY6a39HIfI+wedLmY/EG4P27Z5vKGBzlNU/+?=
 =?us-ascii?Q?CtODtzNoa0yIX0GpTjcHtpL6Py6XYDrGBsocxDENzsmVjzUtwscLRmKgzQR2?=
 =?us-ascii?Q?uzRIzfi03a4xELYul1aoTrrqiPHFZUABsW0NccQ3YLcbg01FiZxKQWsRWdS2?=
 =?us-ascii?Q?YAEfuPdB4/XLHOdFC7XMLPnefOPHSQWljezkmsZ8WWlaqo6IhaDoDSjksyQz?=
 =?us-ascii?Q?9JjGMLLf1s6gwFbZm0J6TfDA7XLpg5BG787nSTVu1fOrPBP8x2/0pNVsjPHd?=
 =?us-ascii?Q?MphTWRxF5kgTJvltt1nN61KCzT+gr0azvCIVYRSCVxGVlw+TfCoOk/3oqiyR?=
 =?us-ascii?Q?KWQkzR4xtvYIRcc4Kv2kqbZWxw6u9OauPlBm+2m0Un+0ch+rGfzJRTCXoUVD?=
 =?us-ascii?Q?t35ApVhiroVuHkq8VHzp1eJPlboRuazMYpnCMfGrxsivesLS47BEoOmOoAx+?=
 =?us-ascii?Q?o7EwrbyRgeSAB5zSwvs0sX18qUeH2MIwJxjdOS1BjIDmokuTwQPQ4bYuW14p?=
 =?us-ascii?Q?l/J0E19+KxzhasdLmUWUDHK6wJw3OH6wUEwdJmTpYb4I2Dt/F7hQv4B+2m4f?=
 =?us-ascii?Q?mvdCFcJoR9ZCt1cO/7ilvnFiSGPuUM6hYMF2E3oJJhU/9f/oacoxqZxE4XY6?=
 =?us-ascii?Q?AAJzX8LEB9hoV8QDwgD15gqx1S0YaBSHxCgOUxiTiLT8YEggnRsOsPsSnepf?=
 =?us-ascii?Q?3dkhGhUebS+KYKE/xOXBeRmzvVetJDVzi4N6530wFX1ffQrxLBBddctk7t8Q?=
 =?us-ascii?Q?8FC6jt7nsFA0PFjMQzvaacH4OU6lAv5jFLJ334FjKFwJ/Pl2ju87gc1WBAbM?=
 =?us-ascii?Q?uFj49+2F7m3n+avedXa3qLhgjgBFLA5F5fa12GfD5XQKYrpmcKrllHGbr/aR?=
 =?us-ascii?Q?EBYTBlpd8cZMaF9hZutdB495u3+W/zYlApVqcggY0pQ9VLZ7aH8ItK87Cj/G?=
 =?us-ascii?Q?7uXSYdzf2mOMpy24Gnkrwf2ib0x3AByFlDkNg5++qMUoFjvUS3ZRN0lbxBDY?=
 =?us-ascii?Q?c2cjni1zr1wD0mgdqph1A7ncoy+cR2X8buCfoU2PDhKooGnyQspwmoBI7lOJ?=
 =?us-ascii?Q?pgf4OE+X56w0u52C8G8hDR2QCtpa0CRc0Ojy2078dzB6sr57qivDvhz2PpYN?=
 =?us-ascii?Q?cfxwMRbZLKilPvwkY823cnj5AyW+Zcc+9xo+cyVdKBJvT86pkTdRdRMVD560?=
 =?us-ascii?Q?Ikdh137hKv9HYIV/kM37hUOu7VATQhhmq1aYuRnshsM1F/vi0XYPJWlbSCAX?=
 =?us-ascii?Q?oafs/aCUNaw0pMocPM+9JxbB59u7RIDfFzGS1jdLz2agKoJjc0aGNACORfhl?=
 =?us-ascii?Q?VDbFvJSZIDgl4wOvVP0XsurN4KRYe+Re5elVhz1Pbwv8l6du4LXW+2Fjn1+3?=
 =?us-ascii?Q?VlAkULzNzyGdWZ8lGFWEZabc/G3b60Px6mr/3mybwIwAotbWWaVPZD62VB9p?=
 =?us-ascii?Q?OYi3dH4/muQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MPF7O07cUdJvLDaT6pIER7RslQzgmwfQDTJbjRMo1u1qW6M2PihRjqW49Z2J?=
 =?us-ascii?Q?+GZ5FPalEC5lRyRTKLQXsMR74H2AQq/LL/43w++nMXvDhtz1vvh/C1bn63Z9?=
 =?us-ascii?Q?ClyG47BjTUEPdaZOKHV0b0kElbVvlNkjc187UnqfF1RYjR7eTlEbdvhC2X+j?=
 =?us-ascii?Q?nzPNj0SvZchi32ZTjHl97diwZy2da/kWEDzkxW1Twd/q0j/OUv5iW5vg2u6W?=
 =?us-ascii?Q?7MNMr4iov6YjnK7KbQMCFke8WsK92ZoEHGySEInr05fl1Z0niViYXSu3wlOA?=
 =?us-ascii?Q?vYfR8jnb4g01mlsbWDgfUjhFpnkAr1gBgaMqqVyA1q4Bpv5fek0/t4T3U5py?=
 =?us-ascii?Q?/4Vv2uN0ZRJD8geLBGGB5Wvl3f2vV+cpGxcX1RJVIqtG16Ec7W8e8mLz/tS8?=
 =?us-ascii?Q?tF4Ak7sdP0I6KFC28g/TPX0kbs2W1kxOdKfKfwxhZpu8K7yBZ9NuU0reD64q?=
 =?us-ascii?Q?u3qQw5bFy5DwEwzOAYxTixv5WfOQPy+u4aWHghAR/o72X04upSMtDdWmt0d1?=
 =?us-ascii?Q?cFkYdUkgZNxzHckfWVzr41zG3dKhTiCZGjAFmh7dc2yTvZvdKBdYzq0YhE25?=
 =?us-ascii?Q?Puf0pWGf9w1PK3luH+i6b2/hTiN/InDt2B2dSeF9dkzDqLZYmsAxnLujQjB3?=
 =?us-ascii?Q?oXBbtxR13o2USLMlZwjXsTw7SqitJK9TlXJxsrBllRulUK1OCgIxigrzJRhx?=
 =?us-ascii?Q?Du41Lhgve/47hkoFbKsOF5khsy0mbN3hLjQT8WLsCemhgXiVLn9B3c5jI+FC?=
 =?us-ascii?Q?QDD9skzsBbT0UZRd6lQMkVoNC5a8zP/GM/PN3eMZdFQRFytSlFLpQ4Dd46J7?=
 =?us-ascii?Q?tYQOHBdnqJqtcuZEgK4AHhGPUZHg3W7KZDZAQlKh7iBvT8BXRkABYRtJ+5V3?=
 =?us-ascii?Q?calCnfBavWdWl0iDe71grcgnINNlTvYmEb1AkAvLG3GHABSUfAlgMdcuplkG?=
 =?us-ascii?Q?MATQV0bQLxslHT88abVsFV4mr8321qz0vggTs/nCY7uFTfLO9N1FAw/MSsRM?=
 =?us-ascii?Q?ypA+J2t6enEo25D7hJJ1WkYKsg/FEFe0k4XnTOA+YfJPO2/XPP+S9ZI21XVD?=
 =?us-ascii?Q?lR0Srp3MAK4b/WOyZrAHYXOKHCr+9HHeOUrPC0FxVZ8StTUrjPVkVNUwio/G?=
 =?us-ascii?Q?EeOOBSbyh9LO4g5d/ZTMR2RBxBN5L8kJzdfLx80W8e230qRzkopIfc6BgN7A?=
 =?us-ascii?Q?MXIy/Nw9eNgKBSGCTA4J1fMGv4qiMEm216E0K869f2e2iakPaDcfGe1bmyPK?=
 =?us-ascii?Q?AavNuTUTl/OvjLkxSvzvxgOO5woIuANOFf9G0GIMy9e5mU9dOLzecJPvh+oe?=
 =?us-ascii?Q?kcu7TQf4XiqFdMSRafPWqNlByA8vjBqPnuGxTtu2zvBaKD4mjao1GeK1extf?=
 =?us-ascii?Q?7BW2Upe+K6tHT/xQHhJ3YxeBYnfwGEW+eaeXCygmJilby4iB1L0oPm5OTVte?=
 =?us-ascii?Q?0YhG+InQpbMevZbIPX4X9JZ57lHwCtRQhxBrCHhqAe9JHO+ZDjq5SAulxNJk?=
 =?us-ascii?Q?YriHDFgb1h1ShU/qjf3aL1bMhWT5fA/4c0fT1dYCQ3Odyts3eZACJbtcoS5U?=
 =?us-ascii?Q?FVL0QaRZiNQ/mhJVVTbdSCDBuQWL1bXZCvfu0QLT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f7cfa9-19b8-40c5-7725-08dd14255884
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 05:34:39.0354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yiJINn2hgP+uOsYKI5AeNpe86OAtuhYAXH8v7z93ou1lyXSkEYFK2lcDAYD28XhgmZK0RUuaeiJNc847nbGH2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10125
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Register m2m platform device, that user can
use M2M feature.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/fsl/fsl_asrc.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 471753276209..677529916dc0 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1384,6 +1384,12 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		goto err_pm_get_sync;
 	}
 
+	ret = fsl_asrc_m2m_init(asrc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to init m2m device %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 
 err_pm_get_sync:
@@ -1396,6 +1402,10 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 static void fsl_asrc_remove(struct platform_device *pdev)
 {
+	struct fsl_asrc *asrc = dev_get_drvdata(&pdev->dev);
+
+	fsl_asrc_m2m_exit(asrc);
+
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		fsl_asrc_runtime_suspend(&pdev->dev);
@@ -1497,10 +1507,29 @@ static int fsl_asrc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
+static int fsl_asrc_suspend(struct device *dev)
+{
+	struct fsl_asrc *asrc = dev_get_drvdata(dev);
+	int ret;
+
+	fsl_asrc_m2m_suspend(asrc);
+	ret = pm_runtime_force_suspend(dev);
+	return ret;
+}
+
+static int fsl_asrc_resume(struct device *dev)
+{
+	struct fsl_asrc *asrc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	fsl_asrc_m2m_resume(asrc);
+	return ret;
+}
+
 static const struct dev_pm_ops fsl_asrc_pm = {
-	SET_RUNTIME_PM_OPS(fsl_asrc_runtime_suspend, fsl_asrc_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(fsl_asrc_runtime_suspend, fsl_asrc_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(fsl_asrc_suspend, fsl_asrc_resume)
 };
 
 static const struct fsl_asrc_soc_data fsl_asrc_imx35_data = {
@@ -1538,7 +1567,7 @@ static struct platform_driver fsl_asrc_driver = {
 	.driver = {
 		.name = "fsl-asrc",
 		.of_match_table = fsl_asrc_ids,
-		.pm = &fsl_asrc_pm,
+		.pm = pm_ptr(&fsl_asrc_pm),
 	},
 };
 module_platform_driver(fsl_asrc_driver);
-- 
2.34.1


