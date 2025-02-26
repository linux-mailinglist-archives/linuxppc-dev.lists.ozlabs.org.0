Return-Path: <linuxppc-dev+bounces-6492-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 764FDA45B34
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 11:06:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2qrF0TzZz3blR;
	Wed, 26 Feb 2025 21:06:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::601" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740564397;
	cv=pass; b=goQKMVjHqT43KTmIaNF3Qht+Yo8cI8RUq0s45QWqWzjA68c0Dy+K7A+xhhTvKg8VVY6+fefwJt/HWvAE4Efm82MZmU7mFC5KTXoqOtWRZstCkCPPmq6Y+gN9WAfm2q+b/uJoNs0VGEF50o0gRcc47Zyn6ec1Y6FV7Ty13wURvyM9A9NiLPOsO6xG0Lz/KXTo8Ab96EjveqVjVLFfOiYVgJqLT81v+L2Ivas1PzlQImQsZdYfbl5q1dsggebjP6afYvYgRXCdEXwRoeSyVY34rNy1YCuFlL9axJ96T8QWTKv9qmG75tiTgZ6RQLWhHR8jsePSIzXFVz2T2CsCqwbaeg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740564397; c=relaxed/relaxed;
	bh=zFDXrddFXQHZ01ZARASdLo/Ku7OEUHfoCbXNECvURhA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bWSp+wo2bevZszxjB2kj5id3PhgE8DWzlMr5PNOTxPYtvfE/v5cGYPBBG6mfjFULciuBDR+BRHB6X+R33VGmy8DpBVH/cImw4Yb5d81QwOHZuGmguATjZp/VA3ruIthcGk/iRnStEHUd5e9LSqhp4avfRB8AxwQa8kOg+xKwrhIkkXP4Q7CBW1UG6q68qLQACqxAp/XkqJ8r6SEcetBc/l0CGwiWSxEKh1RizAVUorA1Nv3mRCwcRScjud9CJm1O0UqocIb2TQg8eaiqkjjzJ7CJ9QXh9kQCkvkhcRUzNaIVYJp3g8CKzgW2DEKKM12gKmG/DMH4G8pO8JLeajwGyw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Mn/IN6qO; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::601; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Mn/IN6qO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::601; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::601])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2qrD3GY6z3blv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 21:06:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlLCWMmew2NIGvt/GeS24VkPAPF7zjbP9qlIYBUoBPhRabBerDoXfWdXnSKg7/dCKT8xR3YCyg8REi+RU0d/YUQ97XG+gXoT9M448K7OM0SUaFgf0uqKCqEwHu0k8ypxY1ryOHuBZyDyCxRBsFkn58vYRNwcyBH0/XR5caBhGup1ZqBWov804vYfy4/taFhtqbPwYFg2n9+Z+ih6vcc3oC1uexO/vSuOgzv0hYCgzGvC+QtQ7NZt30oBGz78EUX+TN8tXdjzMnh+3E6+1emryK8N8kkwDAoXHzg7/3kA/mbV3o6y+UrbRgCJdE5WaZf9Ssn5ve0J4874FkG8jRx4RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFDXrddFXQHZ01ZARASdLo/Ku7OEUHfoCbXNECvURhA=;
 b=rCZaU14XLxxTewzjRhvxQ3k+JlByApV21gqWbo5GFvP0glXj16M0dHvomzhDOO5312QaDCCst961EIIj84wQRy5P4slrf9pE0O8ohovhEiIOyG0stZsxEkmruaQTXMQ7j8N10vZzJQQEF/YdDcLl/D7OJtA5/omS8RpLIqy+YiCJQTX6adOye4LimqMNQ9Le/T+AKOJW2aOJET1C5fOZwIO4A/LGyC2V+59PFZT+3SFUegZMbM5MqhVSoQ2POe2h6rF94D+81fqWQ+9Leb8IVTN4B4cjwPR0rCuKlIUu/MWC1Mk9w1l+ZdA1/BlbCprbTdzfbjyBrkcOypvUG86ObQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFDXrddFXQHZ01ZARASdLo/Ku7OEUHfoCbXNECvURhA=;
 b=Mn/IN6qOLZMI952lxxAKACHj3EIBUErWFjJSDVuAydzwzzOe9sV+6X0+pV8sm4t01wss0oJmBqlcjjFCBbE4LkSHj5pVh+of9/a4P9arv65+fK5CcbRSh7flr+QEMEkit8H3xlh6wW8p00FLbvxwwUUaMKD0EVECRe+WJkbi54LvOVhA5pJM5ZPdUHZd0387fUWX6ido5fhQVw2R2oMPH6tvszd3mGTEscHe8T0e3InB/asaI9RftrpIdg1q8qwZvQAPpsomF3ZKkLM3iyngFWjPd47HTlk1tx0PJaNNCvZdygIhwOr9IIQfBj1KeQI3k33dv2iwx073D1IR2P6gPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DUZPR04MB9946.eurprd04.prod.outlook.com (2603:10a6:10:4db::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 10:06:26 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 10:06:26 +0000
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
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/4] ASoC: dt-bindings: fsl,audmix: make 'dais' property to be optional
Date: Wed, 26 Feb 2025 18:05:07 +0800
Message-Id: <20250226100508.2352568-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250226100508.2352568-1-shengjiu.wang@nxp.com>
References: <20250226100508.2352568-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0233.apcprd06.prod.outlook.com
 (2603:1096:4:ac::17) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DUZPR04MB9946:EE_
X-MS-Office365-Filtering-Correlation-Id: 7495712c-834d-48d7-5774-08dd564d3ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zjPkceSf2TyadgpHDvxK1gcyJrlxy+0F+rqxkn8yCxdlYFF9z+f2tYJhPMBg?=
 =?us-ascii?Q?NB2DeAxiFzFERlQz7Azu9tTaSIMFRKEQ0jzb//HlwNGcSAHaFhEFNfxsSvRJ?=
 =?us-ascii?Q?FCyCpirREIj3Lhqm0gk07edvXy7ySOrJFtJ+LX7OfnMm3j/HUgRjv7+M9ZDA?=
 =?us-ascii?Q?vkaBsqJt7lYdugFY+RokxsUmQR8QsJye0d0Pgfucj22Y/8XsqE9G5mLRLpxH?=
 =?us-ascii?Q?0c3DkmXF4sn8YsnccIKNuOLbgXnGpDA6w16q8w2l406O2soFjfUo0rM+8nds?=
 =?us-ascii?Q?NaRCQiPoqHMkP2+bi1LjRhjbwEDr7PsXg9vFwZjpW2u7XZaQAvZCozxCDE9/?=
 =?us-ascii?Q?AckNHJms/FXu5BGZvt5ILhAkgeXiGPUfCTMV5Fof1G/uFOmUzZnG8EeAys8d?=
 =?us-ascii?Q?fs0bnO14b4nY3XsyIbWn27W04TPQUV9xV7GuNAneXBorW8VZUYAhmcjn3oXV?=
 =?us-ascii?Q?HVqYwKXCrNos8fdkGLgo/96JkAdxKSM/Jp3oa15RXSElyn+oBO7RnnE8L78D?=
 =?us-ascii?Q?MMx89zgcL20KwzdY+P508oYIZi1X2OCUIaXF53MkDKMHmkrfeP2KV2Fo98PA?=
 =?us-ascii?Q?PyA6egsXpmlcIjp4JQ3qBslfecYqgQ6F4fSzA/k0qck/LtEmJZ+iT7+JRsO1?=
 =?us-ascii?Q?aR4aTb9svl4yr350sw1/Su2uu7gsyDD7/r1lfr8ILLB3d+123MYpXZouxVOb?=
 =?us-ascii?Q?O5JOgMa0YfQR0OlY/oSbJYPiXR/8AWNCIFgK8liKUDb6oGvN2FK5ANTUMM8b?=
 =?us-ascii?Q?EHc2BnBVmVkxFzB/n47+GbQGOwoU2tLXBLFu6LEzvpz9T37ns67qMiQfX2Cv?=
 =?us-ascii?Q?FCMkO1eAygepVc+Eqyx5t6nfgBloG0UO5i/nM2SYEWajGXA0J4E0nBmjfGj1?=
 =?us-ascii?Q?X8TocH9G6p6+rgecWMLHy/SMDV4V/3dN0UdFDFpfc6ClclfL06IyinKt9P3X?=
 =?us-ascii?Q?AhC++ITwvxxW56unc5m6Q/Ar8hbTAi+zUrEhMieeL7ys77CwNTGoJ3+Z6XXs?=
 =?us-ascii?Q?ZxWZdE9+0Deg3l3JZ9KKpMar5j+7KSyYzJCW2PnbWqZrYBvgHAi47WLBmSFL?=
 =?us-ascii?Q?SOAId1/g/OXCycjQzItNVIgQpGu1XIAoQeT16Hcmqr92AAHAP9UfnaWmqvpL?=
 =?us-ascii?Q?0mB7CgztE264Lu0fmNAncq4884pWn37ENhAWkcqrzfivYG+Fwqjl1Bo0oLEv?=
 =?us-ascii?Q?qOGrcQ4ZLL7rwMVZLk2A/D5dqh6cHVaBg93TLWkpmi9lQ1/kcvytQhEKUpwb?=
 =?us-ascii?Q?GPIxVup9qkkHAhgfm/d2C+2089WlojYXsQbcUwSnPV6B72YxUsPR6TcSXQxk?=
 =?us-ascii?Q?2zzNzBrDTglv+jOWZe14cB9QssIf3AqIHDTsQmmAVoPCqXSRs9nA4qujS7kc?=
 =?us-ascii?Q?qE9+iOVz+GV0FxWCs1ehG+hyeQwDWfu8Fy3gjRCZAKCLoeQeria8vcZWm5sI?=
 =?us-ascii?Q?xpOBsIR9FqYQl44aDug4J0pC3GRvyHsTSyhgnU4LCWvJ9j+hpYlSZA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+FCV9+ZEoU4JyTY9hkv4ciFR05r7qAofhgFVeb1x/ehY47/XbLVz4YoPPoAF?=
 =?us-ascii?Q?34vpp72GwwCCrzpWViXqTfLGOOmkUVkqD7TZeJstwyPym8ztVKfe+yYTrU3A?=
 =?us-ascii?Q?a83eqZ+7y6m9nzeqNl5SeX6UV1UrxettqwtCUGN/pzCH8f6+Tp4ktnQLJy8x?=
 =?us-ascii?Q?7K/x+J7ueA0c5sUHxuI8qu0qA5StNi6roy/rSitNIiSgEZTr2yUDsinYzlS9?=
 =?us-ascii?Q?rxOJHGGStRibQXg2A+pzknjpadFv9OIW02igrVOS1q5BnKHxxJmniSGlvBIF?=
 =?us-ascii?Q?8Jt3ee0qhCOIZjFfGxFIO74gv9+IPemOwM4yP/JLxnhkOE8RrU+VibzMzAak?=
 =?us-ascii?Q?1TuSHcf9+ZLb/TbVfiJvVgOtssOmvk76chtvtBT71URIE1LWUSvMyo7Ecv7H?=
 =?us-ascii?Q?RzvOesKjJTWvgWXtYVPGYw1WsBOjsHr4IsFilt6Xn/rIdXW8SthjnebnqO0W?=
 =?us-ascii?Q?Pmp9mm29H4ZHNg5wkoYKhqOnP3FZD6mXGE2VXtNjewiW4ZlsecrRJ6T0Rjos?=
 =?us-ascii?Q?buf4DeAHkJymKsb3/i2BRtdn8yJHhUeS+u9584eaZmDF1vmQsrEDMW2qB8vy?=
 =?us-ascii?Q?30LxV9E0BpUdGKPswD79+mjLNbS36tRj67wy5Bjq8lZg9NhkmISxzE96STBQ?=
 =?us-ascii?Q?7+Qe4swEHEYNSddawPkSlUjBltVUUS4ZBI0UBHWnzVw5XsWKGkxsFLl1YcqH?=
 =?us-ascii?Q?/VhimRqp0VEhn69+wKftXI3Iw7lycA7qG7fQGD1jlDEm9RiCH79mGYh3oJXC?=
 =?us-ascii?Q?BvTy/Y+RwLXtcCUs8j0mw6KoIdpzH5/mewu1lypYgieMUoI2YbvZf+t++Hg9?=
 =?us-ascii?Q?8icve4KyK+LNv7KLjfmJ/iWSaL5/bVPFw7hivqCyriMJppqX5Hz33w1rmfGE?=
 =?us-ascii?Q?wNKWUR1tEjXzPnhw74l+dHNhYGtUwh8pGT0J+RGNXH8qKebAd8SVeTU4Sh6b?=
 =?us-ascii?Q?afKJyFIcb3SAtQ6+XtSgaAQ7NrgUd9glZh0PHzfcoVw+GSS5ahHwAZbE//M2?=
 =?us-ascii?Q?7yNSYaFAc+Zj8PHFx30Y6a1mEzGziTsxLP0CgYv32dj9s2JSJ4GlOK/o6tmc?=
 =?us-ascii?Q?mR85FQf3SFFQcWHcUSFaSulK8fBmSgcjhugH6cE5wShEwS+U3u1ae1S7Ozyt?=
 =?us-ascii?Q?PHW6LBi701GS3vbwQwrEEo+3ZS5P0RTnCxt8AunNaCjnjy8cXLUA4u5H3rfq?=
 =?us-ascii?Q?9MGqjEjr1Dm7bKXlLTvV/qX/FIM3CC6RDsgz9pUBJxA3SEwmizol8pl/kOvO?=
 =?us-ascii?Q?Q3CQB3XvHwUIRnDvg8M3dc1VcL7spdOsEg3P7klaSlGv1Ys+JKCgvw30s+7h?=
 =?us-ascii?Q?sqKg9YQ68ybMJXLRgnF4jbrrboNIoeoP7ngrHJ7IWQ+owTAIsuET04NOf7Fz?=
 =?us-ascii?Q?F20HUI5ZTHNML568oD6U21MxsseEjtBx10IfNhPfldYYdOyS/98RHZN8IDkG?=
 =?us-ascii?Q?ONtS7qJFDMSfmaSury6hiS5zJt+mrXeGU+zcrgBqNkQ3hZa+ed/elP5AkXXU?=
 =?us-ascii?Q?wQ3Qb7TdyiA3vwxYvcvjYKg4UH4pcdRowdzdtmpu/buSjPtmAs43NRRb0MZ7?=
 =?us-ascii?Q?2uyYK5ymW+Vog1Ro4ZdYYChCSkuMsI9T2W+yOZxo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7495712c-834d-48d7-5774-08dd564d3ae4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 10:06:26.1069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfDsGT6kH2xpuH/hxO+o5T5+oTDBASHYIR/dmFiSJjvq0mC2NN6+/l4Jnxdq8YEISD3TDAUxNW61FVnevsR46Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9946
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Make 'dais' property to be optional. When there is no 'dais' property,
driver won't register the card, dts should have audio graph card node
for linking this device.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,audmix.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
index d3b93407b4f0..3ad197b3c82c 100644
--- a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
@@ -81,7 +81,6 @@ required:
   - clocks
   - clock-names
   - power-domains
-  - dais
 
 unevaluatedProperties: false
 
-- 
2.34.1


