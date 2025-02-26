Return-Path: <linuxppc-dev+bounces-6491-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F6CA45B32
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 11:06:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2qrD1WRkz30Yb;
	Wed, 26 Feb 2025 21:06:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::601" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740564396;
	cv=pass; b=LCn6AspkctsVywQJXl4wK9BNc1VNJHyKxRIXBduXFn00ykT+7AngTYfa9825NpvAxzbOmVyMnSijnh9wZLubcncxa7TqMRIMCWT8yyVJiOydgS+wDG4dZU2O8VbeC5maezyu39oSmIu//o2AvLkmL1msQ92b0u3sh4/DiHxa2IAtVnZaNdfuEgZAt8WhwVXXQzMEVVGi76RVDLAe4nnvsKHqPCDemivMGBpFNHyizND4JrGTum70s99pXoGY8bywXjIbaeFbtvmJ9wq9pD0DKSHxyNKDnjoGTx9DL8fL8NrX8ENE6+Gwg4DJJrmLzWqI3cGcjqKYVSZN8YbNRWYXWA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740564396; c=relaxed/relaxed;
	bh=W/E9GlGZGTf8xCsxc0SJkT7k8fOFpOHLXKPMd4Ctwps=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bl7IWP0jURULYH+soYRZ/yEOyrQM8lYo58wNHah2hy8cV5ATJSPpTqMoB/asWUkTWe+NG3rAUN8K4vKc2/GdvOIStf7MuxKLJKFac60/QKvxU3GJaf3mNeLOj6qgqBUBlxYAD+dt2QG4p6oxZaMDYr+GdBCkFdaFVHSuIMd4AO64W4M2E2wOAhuWSVBcNUVqglQPvpsi0+k/Mw6D5+9tenb0PXlGswjVV3/4PO7GCoUIR0M/B+ZERn9hj9NhuXaGjg8e734LWzM4G5/Vw7L6zkngXi2oVyIf13z5x9Qvb20T2aan3tbQKyKZPPZEduFWSshV8sdxxdvSSTeCTLTJQA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Ob35n+B3; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::601; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Ob35n+B3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::601; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::601])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2qrC3stNz3blR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 21:06:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBQCS7YBlBhfJksBe8GwWt7q5JDshelaZkCSMw/J6oPQZdf55PZzt/HqN4FvrgoypIFd97oI5mHCpZ0x3Ie9ZpRy6Quh8mNYyUYMS7by8eguKuOx4QMHsCjypPQEyYXJZkvXz7xosDZ54dinroXzs+VSaQat8RhZZo5iEJIJpjc/5JZLlrk00wYFTGCM5FmsiuNflOzgAE+rX9yXGgVeOFOddlpWb5fHfMuMnD6he5X5gQuEGSAXMTNMhUT8wbYzDg2ULxFeqMOIfvF2+RWDv4NQvtn2kaw8rwNMCwAVmCA0Ibyng9vZbiwlz44McDNx3rhGtSVhTLCEvsJ/DgvZ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/E9GlGZGTf8xCsxc0SJkT7k8fOFpOHLXKPMd4Ctwps=;
 b=ArIsIfevuLS/lU4YPQkVmJduFLSOF6HlMWKE5eewXXPDp2YkXGZNMkaoGnhjANz2XU2T6TJuqltmD3zmCHNchKgaeyM+NFI1t3IvbdIBan60xfaLHUYiIEQg9Zjqryua7qZQhaBosbS0vP8qhcWGWUadBDRo+Hpo01XvPcQIHHueFfuHbPYIHIlvLCHKbEcyDwmAQHcfrCf5Yi+8C/fJ4Bkuw0Ruzva0MMD3KvIL6RPkJ+VPTWWpMJl5cTXOHM4ktnydX2MgKbpDJU2h7A56OKUvS8w0A/q/h+Yrm6pWYNCRVPwCES+IeRfjfYQpqGVLQf9dNY17gHyFFVX/WrZj2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/E9GlGZGTf8xCsxc0SJkT7k8fOFpOHLXKPMd4Ctwps=;
 b=Ob35n+B3VbzkFEoXAv+9WpIZ7lO3lu09rywF7btRiFS1LfqvIPdfM36B715oPY4w2TmCU6ugb6oDYmSjze0nJtBnmoMp7rFYRk0qB4yLAPAkvsUx0CuUdr+Gk3ADwnFkzrz6G96vE0KPln4pYyPM2n6TcmpCkX3Eosao5bmjdNaYISi073iWQZOmVzzmvEojqxzhCVGXe46wyqj7cdWo9R59UG/ei23C8MqFZgTOAcSZ2gkFFOTDUdaJBcZqE4TuBexeJeQhIiXZ1SjLoAgera4A8fYyVdg8xakWuGWgBcbU+HVMwk0umkZBTy1JwlZBy8mbEXSNEegRK7dH3qHuog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DUZPR04MB9946.eurprd04.prod.outlook.com (2603:10a6:10:4db::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 10:06:21 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 10:06:21 +0000
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
Subject: [PATCH 2/4] ASoC: dt-bindings: fsl,audmix: Document audio graph port
Date: Wed, 26 Feb 2025 18:05:06 +0800
Message-Id: <20250226100508.2352568-3-shengjiu.wang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 266b2638-cf4e-4dbf-e01d-08dd564d3833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cLaQs/A33w/XxL66ivPL6X9iW6jxpKX1/veAAJuTsjwrnoXj0gCH/MX6yQne?=
 =?us-ascii?Q?8cAUw2a/CBHQOcNLnhdW+2DkDcs46kRl/CU99nbdOfAuJZnbPuaAUl4B4LPP?=
 =?us-ascii?Q?7es9rZBTnrLaQzXmW4FFTFxiJn/6bS5cETaQ5IHKlUmcs8ZSR79H5vLVdrpw?=
 =?us-ascii?Q?0VORP4BvGVToYZ6d6Y1slbW6rW7taIV3RtN8ixkEoLI5X4uJjrH/bPhAWNew?=
 =?us-ascii?Q?ykynvejHsUoqRMK5rUnuE0vzz7+iwaqjA+jg1CpLzh//knJdrx9eLuBFQGDB?=
 =?us-ascii?Q?a4LYdk2YOhdTskIgDB77OB0arInejEsTed0l0YczYB4mf+L7Z1Xvp2/4mIxo?=
 =?us-ascii?Q?WsorawDYnYFkP0ikgMOcnwWj/EQLiBw5eLENpokr9VSQPj86BhqeI/f8ZrSn?=
 =?us-ascii?Q?lHAcgdsDr3jUcVM1pEr26taoOWBthu8zw8wOPxfhUKoYARfAU9GGxM9yi3xY?=
 =?us-ascii?Q?0dZTybo8v8rrng6INVpB7LdV824c4IYJ69BVYmiMjkvzRAj2m0HUyou/cC4X?=
 =?us-ascii?Q?S7IiLxuky9Qk1rKc9GpzGwC/oY/FbO5ve0cCafe2eBV1I6zYEBEZR/WbZmZk?=
 =?us-ascii?Q?ICPPJdaNqsxtQRqJMQ0od0sAH/ljQNYEfZo3X/RjtrVb0ntoGlgpaBoRVi+i?=
 =?us-ascii?Q?V7h5EPFWE0PdCV6nmDdDmViNH7I5fWuiScTbH+ovpjZZZAvFA4ax+EP3nbAb?=
 =?us-ascii?Q?3DesdPKD8yd96SjxmVWfVEZuHf2ww/5LyMk6cJ7QkVPT684Iv6C9Ry/j31cv?=
 =?us-ascii?Q?A9s4yUb0138/3SzjJOXjqTB4aZI1du65Yx/mKRT+HYPJUk6+bDzMmg1YCi9K?=
 =?us-ascii?Q?EJSkkS4bow451fm95s4sDyOKldpQdl47GLhsb/YmMLdHRH1gv+SSdAaSzSks?=
 =?us-ascii?Q?BdghJGrIxaVrcWhFQj8EUYLLEg7m/fsv0fc4I4/a7n2wPsd+oHvWaTBlx2Pt?=
 =?us-ascii?Q?YIZA+TwU7Rn4JGQ23S65AvdjAhRDwR8n7yVVMbMQ5kiWeejl0PD2FwJWI0Md?=
 =?us-ascii?Q?zjihA7aRoqvihui/u/SAqo0mmOYkYplB2TgWayCrh/c2EjS4o4lDAyVY4AMt?=
 =?us-ascii?Q?ti43oCReJjlzx4HWEsrt+ifSzaQ4//BLnMfy7FA59D0a5U7CHEBowZEqFo9g?=
 =?us-ascii?Q?FvQ5c98VZ5D3mYitKwd/gC96zQbTOIFkj5boixyblqzwdqdIbhzPYmy5NZYq?=
 =?us-ascii?Q?jsk9TQNGL6tcqtka+1rzpJRnERmdGbRHc5Kvv4Xah2iE8m9CtlLpXj8nCJAP?=
 =?us-ascii?Q?ad8+FR9sYbRn6Ohf1uj/7+vr97bATIgbV6guT/kfnwSZy3CQQ2EkEgEydLLP?=
 =?us-ascii?Q?3WHgQLnTPxTkhnMXyh3B0bx+RGMUlU4v5Q69y1nnFCwbnR313pDrFCqHYk4c?=
 =?us-ascii?Q?GGL/GMhRYr0X+GXtaq+IpVZ6jqhaEoMiEVQ3/eO49XEqYj8cQjlSwoX5fqVK?=
 =?us-ascii?Q?LrJwpjiiK0x9hN/n9qE2S8UtOlYeqr0OQ+QRf0AULsVNzAN6bC9ooA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kJG9OkM6Yra5ueVBeRUKTUPY7PBNHoDOg7R9UayGA4bdwx6e8Y2znHHb0qmr?=
 =?us-ascii?Q?nG9fzAf0iCobnRzEjLBjVOGwR573XrQ8NNyKIA5BbRHaYYlD2eW1FySPI5R7?=
 =?us-ascii?Q?xqAAtKorXkTYXXmUaqn6GsgaHJ4xYuUDLjJuZZ48BOHHCezxIMDf7XFVQKLb?=
 =?us-ascii?Q?vWIJF2M02dKAZirBSLH3OQPF0CXoYQq5q3Ml09ad8w/hf82Do9tNsJjBFpM9?=
 =?us-ascii?Q?sjIKsqKSrEWft53WWHMt3vZf+EkMsa9b1nqG6dvmnlhH8wTN1EwagyEMR7YX?=
 =?us-ascii?Q?dx+MYvbYp3EQa9l4KdlwiWPgAPLraspIqlIy1MmdJUVvBTgBszy78yuVZV6J?=
 =?us-ascii?Q?fzDrbx14mAgMj0dRNxYnRL7lNeKjCGNUtBEOMGsl8y862lQo0e8FXtaGYYl5?=
 =?us-ascii?Q?U+FS1Uy7SMZOqfbIXQYVg0f4XrCP7/5lSi/STNlBx58NnvRkgEQVCHdFFpAe?=
 =?us-ascii?Q?zSYVKSabm4OJ3zk53s3uqDZLKo9l4axCnx4BgKAbqaXB0iFvd0ptDn7O+q3x?=
 =?us-ascii?Q?IBMDsUFyd8BgbcRRHhE348nkAuYjg/paZHoFQRrJZStomrv8kB6tLHs5KHAO?=
 =?us-ascii?Q?1BFAaUKu41rVrIbbRBglGDSqw1Yjx1yg32dsBivamrf4QEWxcyibYCMZ0VlM?=
 =?us-ascii?Q?BzmXV+aDyadEO3v4sjXZpnlSCenUUBKk6FlsUltqXCgmVuNix8hQkMt2ThwT?=
 =?us-ascii?Q?iDLdU0hmIdq1fcgC/IBaNcaXmz4qGfc+HBQSZ4D1YOyL4oRlFyPx+wM7PxxM?=
 =?us-ascii?Q?oREaqDY2KFFRSjGOyGpxHaK7yh322AthKHheQ0CiEfETPfP4TIO1+zobC+nd?=
 =?us-ascii?Q?68nktW+3MhdMniJIL8IZeb7Cb2Q6s5BnPXTGWJzyWrxEJFQzRZ6leU1Klelq?=
 =?us-ascii?Q?2ZhAusv0zorjrP0oEOkpcJIbS7XKYIaJljE1+tcV9neum5ZuKdcqDHGQk5ff?=
 =?us-ascii?Q?6Ozj9yGY5CT3fBr9LAB2kqgLswsaHhPMpzrTFfJtLF/0qbaFWFJLDbY5u49I?=
 =?us-ascii?Q?0Iyh0I9mHUhSHTrJpUvkpqGH4zHFV4J81lliUMAbMoLyALs5pDT8FBFWXoXB?=
 =?us-ascii?Q?IEi/Em0H/Kp/+EbOlg3cF6cdRK2vo0WSY/xHz+GdTxo+G3W6ovsPJ5x/RXZ9?=
 =?us-ascii?Q?1cZam41R9pNo/P1GMT+prs+FKKULXfRvqFUpe9PUu2uwEB7CPt8hLbczKnjz?=
 =?us-ascii?Q?9luSnN+bH3s03pjjjUH5ynPLOd9pLrldWSOoYmSNTqzbC020o1IFX+BRan4p?=
 =?us-ascii?Q?YKd9ewwAe9qRKs7KOIuuHWE8Z/InmsWiLUs705HrTLo0Ld/dlXdu2jD6Qoxg?=
 =?us-ascii?Q?MYr5qjYucoV+J9FGjKo+EQQjIC71fB8goeo/UpMvtJAaCFN7DGaMPqTprSOT?=
 =?us-ascii?Q?SlYJK6eLDvQjk33BE3MQIcn+34t8v2JOYesghlCV3M6hKXpmem8XSnvqkLEK?=
 =?us-ascii?Q?U1f9c6X/iqCv3/PsKU8eKd5l4gofviX3sZMne17RUEwkJY+iH3ug9ruCVV48?=
 =?us-ascii?Q?0jmigz7HXSmgw8vR001RsLx7QOVupPUY3e6GLluqSZ+hBKC640wPB/YrJTvW?=
 =?us-ascii?Q?w6wXwMH7W5DMcc8UL5LGl17J/6sLil6fsjOX/AaR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 266b2638-cf4e-4dbf-e01d-08dd564d3833
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 10:06:21.4708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtpNMpq6rlwyuZKcGlajZQPEdXki41DnPIDl45ZhGD25POtiRxQpa8SylO4iNIx3qSXlcieKfltrpB1mnQ6NVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9946
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This device can be used in conjunction with audio-graph-card to provide
an endpoint for binding with the other side of the audio link.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../devicetree/bindings/sound/fsl,audmix.yaml | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
index 9413b901cf77..d3b93407b4f0 100644
--- a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
@@ -61,6 +61,20 @@ properties:
       - description: serial audio input 2
         maxItems: 1
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    patternProperties:
+      '^port@[0-1]':
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: Input port from SAI TX
+
+    properties:
+      port@2:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: Output port to SAI RX
+
 required:
   - compatible
   - reg
@@ -80,4 +94,50 @@ examples:
       clock-names = "ipg";
       power-domains = <&pd_audmix>;
       dais = <&sai4>, <&sai5>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          playback-only;
+
+          amix_endpoint0: endpoint {
+            dai-tdm-slot-num = <8>;
+            dai-tdm-slot-width = <32>;
+            dai-tdm-slot-width-map = <32 8 32>;
+            dai-format = "dsp_a";
+            remote-endpoint = <&be00_ep>;
+          };
+        };
+
+        port@1 {
+          reg = <1>;
+          playback-only;
+
+          amix_endpoint1: endpoint {
+            dai-tdm-slot-num = <8>;
+            dai-tdm-slot-width = <32>;
+            dai-tdm-slot-width-map = <32 8 32>;
+            dai-format = "dsp_a";
+            remote-endpoint = <&be01_ep>;
+          };
+        };
+
+        port@2 {
+          reg = <2>;
+          capture-only;
+
+          amix_endpoint2: endpoint {
+            dai-tdm-slot-num = <8>;
+            dai-tdm-slot-width = <32>;
+            dai-tdm-slot-width-map = <32 8 32>;
+            dai-format = "dsp_a";
+            bitclock-master;
+            frame-master;
+            remote-endpoint = <&be02_ep>;
+          };
+        };
+      };
     };
-- 
2.34.1


