Return-Path: <linuxppc-dev+bounces-15329-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1629FCF8E77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 15:55:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlvN24Bfyz2yPq;
	Wed, 07 Jan 2026 01:54:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.72.71 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767711298;
	cv=pass; b=TJMHjCUpbl/HyUWkzP81h0WnL/ICha+/7NL3hXV350RROJL3nWCjSPcoKYk4fZTm59bBqeswnYL0m0w66oabhYhNqD2SdYL4EqFUJ1uFa4LfZHg36dJJz/cqKLMIPKEDkda0+xQGg7ZPDJbmP6l8zc/6bkQPXN34QTZ3mHNwkWWs3/lB8Hi+Wm1BuAEv0LfhzJ0uPvGoesd/DjP5luU5ctrEwsBQ6ZfVcmyWAC7pNq7IS4yAreSL2hkWyP98kGuz6Od0rnBWQJhBTB2laJhGIwxhvYXqPhe7KVI3wXL9Ms1OS62ywIArRw68/oWtab8Pv8i+6iktF/PTFBg6//hlHw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767711298; c=relaxed/relaxed;
	bh=ueSVVcN9cEdPunhqT6KED9YcVykYTq6rxAhF0E5oo1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=On59ssu+kYEd184GOZYIGdgz1+opTyFepely3MXw0ugFIUU1KLTu0EHgTFIBIFxt+rBvXQRr/jWqGlC/zsDP8ntA3rsI8NR5IFdlsQ5f1D5crlTRjxWH4d4iznEO4Ben6+j18QYuirr3WbrFKatTdaS8fGKcZwBMcGREb5QWlnFWOmmkxeGuEQaqTr8M5qYJwSJxOwPe8Ito3xDo1TqLQi26bYDnOJOz8yJnwlqRQ8AzNwVlgEk6nR5DWt/2pauTWMxLcINoNlMSJV8ewcwxQ7pb8+Nrrl/HOREi7w1HTjzU7+8yRvGMp+bPJUKmnGXxQKknccrhLCV7z0v3aqi7cg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=RbkzeZ9p; dkim-atps=neutral; spf=pass (client-ip=52.101.72.71; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=RbkzeZ9p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=52.101.72.71; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013071.outbound.protection.outlook.com [52.101.72.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlvN16tPKz2yMB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 01:54:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o43iJvuAypowN0gV+vUOZtY3QP1d/kBxF99VsLWR5KlLHyt2sd3ZTLwvZEaofvHPSF+GKCjghUFeyHqO9XYjHdOccAZR542As9TTFW0+5J+BD3OfmvxNC0G7ZCSWzfE4E8Bqitn2SURGIuL6V2ipuSbKfzIWXBKaN4anreyqa0UfQ6t3J9bj7dwQdW0ujKBJK3XH3ELyJ7wiKN2XsiTGnjLPL8Rj2gHKEmTbrv9/bXHDt9wkZdIn0mvCVvlgbNbCc6ZKOomrVmW1d18qiahirmhP4N+E5OxZz/vTAg3fj1Pg5UG6d3LDud925VQUKm9nAhTHlSn2G7sJ31dnBwUqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueSVVcN9cEdPunhqT6KED9YcVykYTq6rxAhF0E5oo1c=;
 b=eiDyEg1mYo0ZNc+L0gZ4Ab1wRXObo5J1l+VxzOxe39BYa8wYLmcBVFZ+eD+ieoMDTopv0RdDjndg/E3J04eSWOAzsyWKwgZJuG15EdnEyOfB0o4fpBMz4q748gscrX68rlPE5iHBAZ7YkzibjRAkvFpac/T41+2NrrnBAIAPbe+83Br7JPyPqEj/90pO5z2+nEZmDrCYMF2r6eTvpqaHVIYwlDEmmh0xZ8iRBI75QScIKmxuFrsYuBVePzh/gcSMs9tCttQTNIrivtapEDJ/Ksn4YouPV7OozhYhoYH2LyYlL5zo8Nf1Po9mO7d2JPFNnXQVydU2rllxYZvLRgXy/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueSVVcN9cEdPunhqT6KED9YcVykYTq6rxAhF0E5oo1c=;
 b=RbkzeZ9pZ0YCA1AVhyiRC6mV96SLLirLK8z5+rOnHML+V7oy3zW7PV+NS5sxZQL9YJiPu4tbBOR49tv5mjw9+gWCU/mxbRNbyM1ixkjsYNRaXwj4iHAWCHAOO1BzYuryTiLmECK5MG2KxeBISxrDXHhYUW42SfSr6g8e7X5+S1TtImH9IMW7JTSnm7S7ODGQAKXpK6xoCWMFi5inOLBIsXr9tGcvefMKA+XMNEIWaRi5RabYfoT96jI/PMLLB8grp4AeaqWV5qGu8zZ8rAL0+0NwrtEAqs2B4DgAcmSTnL8pbvlmQhb7vQh9YUaTJ2u8fL7rSx5VKEFfIWrH2uia6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS1PR04MB9333.eurprd04.prod.outlook.com (2603:10a6:20b:4df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 14:54:42 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 14:54:41 +0000
Date: Tue, 6 Jan 2026 09:54:29 -0500
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 08/11] clk: imx: imx31: Simplify with scoped for each
 OF child loop
Message-ID: <aV0iJcNTffrX70/A@lizhi-Precision-Tower-5810>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
 <20260106-of-for-each-compatible-scoped-v2-8-05eb948d91f2@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-8-05eb948d91f2@oss.qualcomm.com>
X-ClientProxiedBy: SJ0P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::14) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
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
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS1PR04MB9333:EE_
X-MS-Office365-Filtering-Correlation-Id: 733dfd87-1595-4562-b354-08de4d3385e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HA9Sz1N/dOp6NdCUIi9r8U1PlKF5H1QeN4SiUhYbRVmvdhTwiaQY4NgGtods?=
 =?us-ascii?Q?MRY5o4XPj22NA6z2OyBqAa36PWaXuL0ryX7zwGv1vdS600u31uZNOEzy4hVK?=
 =?us-ascii?Q?qbGadavQDQ03qYcn+rI22O1C3zVtN6FGQWf7pGI4E2z/sZkA966vnDwuL27G?=
 =?us-ascii?Q?rxROMfBOeJfpXlbUqpz+Vr6arKgvQajEQgYQD4WzRVAP1UX/lJLH654pLW4f?=
 =?us-ascii?Q?ahcBpB3+7JAChO5fQMpcStsOnaqHHd3sxQbOjx3uqYg2yt+OLUdR85KH6KRI?=
 =?us-ascii?Q?KgI39e4X+x7SYO8cmsMclzIu2Ayy2muRxDQZkuZQeTVuf4Om5g32Hoa5flYj?=
 =?us-ascii?Q?4FBMTwHLpL7eDhcHRr+aX6H2NHxam6icYQK5yolc9aq6/hw77xyRfoCALgEH?=
 =?us-ascii?Q?YfFBL2tNLWx9aVG7AMyWvsc1f4+jZH4oLvwP3xGNcmSxdRHo/zLgJvIXkNYH?=
 =?us-ascii?Q?ZpV76aqh93Nx9w85fBMbXJ3tSlceUZi9960XI4aeIbw2JvKSijJDJKlojH6R?=
 =?us-ascii?Q?5bucyfWZoejYoQ7TxsOJwG7WPxgDRHqcd+ivc3CCJcHJbW75X3UAzbOOJKi3?=
 =?us-ascii?Q?6HruXVdE2E61+FyxWQzbwDf1+evLfASVSgKeCDESsdgLmsZe0VOYcIhQYthQ?=
 =?us-ascii?Q?f5+RttmXCbwz9Vkg96NQ34UHLTz611vq5OBLdUTqYODa0Pru0h9YXYw3wBgs?=
 =?us-ascii?Q?mYtosgn66gi3+BKnzpf9a79wiZHh+p1pC/bFGjanQJFE7nrzUV3r/4sICyOv?=
 =?us-ascii?Q?zZ+4N5kf6HzBp/t8bzhzRQCEk6L9i9fnKf1tabxDcoSXMgmZkGT4G5e9g1VS?=
 =?us-ascii?Q?KKrwbYS8Aljkvi1PsdBMXaI8CJZ5h3ZvXpWfgYh79wwNwPaONHjaYlDiUoLs?=
 =?us-ascii?Q?t6QHR1518Wv/yZgJVm2nxnepEkU01bvE8reHzLF30Kj6b2HSnfhKt4MEE8lD?=
 =?us-ascii?Q?k1e9yCRxpwtUUQsC/R3cFmB3+a+wOhrCiGpccnWHXkrTXCJfnZSDv+T52hzZ?=
 =?us-ascii?Q?Ikq0Hkq+TIQDYxoei+y+/9DOTnFuem5klgyYV0HO1zqaqvBcA72PvNa6ze3q?=
 =?us-ascii?Q?fKmBQUkgTbkObgcC8pU+ZDlIq0gzjZvtt9Y/GETML1bj22S6Udm0gl3z1YpR?=
 =?us-ascii?Q?Z+GkchQYMk6Glp/YenIqeBMHS4BoWSa2gHpkB+LGQ/GUog9fc/abRAePZuJ9?=
 =?us-ascii?Q?+dYrY3hzKkNZDDFZUJPPPcHwbdrjX1Ua5NebTb1H7FhRdTnmHErVIBYwdxB2?=
 =?us-ascii?Q?BDvNlL9Q+d7ujqJ4infHU4QwUqx9e1gB/k5vhSvQM9WpjESDVybMs3MwPfp3?=
 =?us-ascii?Q?WPYSLgsyL5X0SN0pDakidq2xVbZ/vSujDY5xPBAWTjch3gDRFMkZrK5ivz9M?=
 =?us-ascii?Q?sAL0tH3ti37QY15w67NZgsr4zMaEUsolitXM+QyK+bCx2qKq3nqmWaU9Pj50?=
 =?us-ascii?Q?6E6tOHeMI9E9SfQlzs3GW5hayySdDlC+WyzJGRo2S13UoeXiZJm9+z+NY+Yg?=
 =?us-ascii?Q?KFPfA1sr1I3ieKYis7DEIGdhBs5Q3frDW5UM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ioLG/wsHyZhYkV0T/k0ugQvxsPp7zwHPxVHCrBWU9ld0DtoXpVinB7sgt0fn?=
 =?us-ascii?Q?PqQlYyTFAk6C0AecJMweaUHmKSTpe4bBfQVa6NwV18pfX1k1kFgVj15+16OC?=
 =?us-ascii?Q?Ssm2axSWs6f2CSfnRYzQGPnNgeYuur5dcG/3ptRQQrejvcaDklq99y3Aao/7?=
 =?us-ascii?Q?Fx3+Z56o/8JOPAdTrEW28LISpqPuYbjGCws/E0NearflrqO4GMIeuqaqNHmP?=
 =?us-ascii?Q?dajnOEh0ZlwQF3w8Agm73PBQiiE3F4xQHk+OEaMgOd5fKvR37KDaiHbCvUGc?=
 =?us-ascii?Q?ZJoeC5uVLAh6vOzkxs41KMEEB+gcaGG3DwV7NJ1GRP54iHYykXf0pjsmM/WG?=
 =?us-ascii?Q?rjpPu4senIFMN5hudzTjRPtXE2hWkKz6RDnd+dg9039VpZuGDm1pueHBecC3?=
 =?us-ascii?Q?hyjhNi8sVSfmx640dWDAbwJ4WYcelQ1n2VwvyeIocYQqSNgdE7CQy+7VVpVY?=
 =?us-ascii?Q?unmxeg+5biK6zRBdjRCNeqNWpDRXbtKBuQ3MwKqr9MUjAnnNdl3oX/wZ9d+u?=
 =?us-ascii?Q?qodUSVjbS5ja6b7NXpttIi8yUICcDsLaGprcXs1Qk9R614wxHW/6B4mcCmjk?=
 =?us-ascii?Q?uxpRHAW62Q+YtzGSK75lNXgtrT8XX5fjh6Q+CFdnX1VONv/vkWoua00cR04z?=
 =?us-ascii?Q?5p2+UwLWTulKCerGuiUg8aSBtnnArtDg+tKOqLVG5JpkMmVmuTErYh3ECMjk?=
 =?us-ascii?Q?8TMf7gz5aWn+CVv3VeDE1qoVd16t1SGktNeOFLzrXwsPlW75/eGYAXF2gxsF?=
 =?us-ascii?Q?Xc5/yUCziavRDm+VjY+Ft80T3gRLUwoYHdpWe+WcBbrSgjORAh4ea5sMK/lF?=
 =?us-ascii?Q?gaVqNZPfqCWHTFwmbu5NhNYDqELSU/BI1G13OnYE4DDFc6vyRpOM96BLmE5n?=
 =?us-ascii?Q?Ty0GObaJ/MTpwpE44L5ZXX2YOh7v7yirDgKK7ZgdTT5HkGZhWY/pX7t3TvZ+?=
 =?us-ascii?Q?QcDo7C1rLJZYJZjVhAHoLvn3yRJaxyNm+aMZvV7RT3D1a2yD3GJd4KWwhUWc?=
 =?us-ascii?Q?2KX6EdRXPD3V/LJXzR4Q0iWenvpGvHctMBEntcIQhX/GHC128il2nlFT+HkX?=
 =?us-ascii?Q?91JyCAfsn3QgI10AgF+VMzfvzIOOuXMDy486m9+ZduDwZq3OOmDwTd6b7RRk?=
 =?us-ascii?Q?UUdu7e8VyfgYcY8PvRNGdEDGnz3EbPCs51HT8AxuUxOQ11YPlTqmV3b/PUjd?=
 =?us-ascii?Q?W+LYG3XOE7v4RQLaQr4KFxxMxOwDFQ781+U2BslXu9RSh63D1+d1/obib77f?=
 =?us-ascii?Q?w6EnAgcrntsxF/f/n3bOXagejQVzLPvxwNe8U7pYuDPZ8tRuYPpCtvemA4zK?=
 =?us-ascii?Q?iPYcXaANdOIfRFZL5FuttEZIFixFgSUEwvp2IMlZ0L0uiuV+J87+GPIhJcYs?=
 =?us-ascii?Q?DeDckCEkUGnOCxthLSvN2or6i09wD/ptr0NYgDrgNYolg1ZnD0Wast9+tzS7?=
 =?us-ascii?Q?TyWAl3Z3X/R8TujTwrYUQWMiAtU3iB0lkxN0Zap6R2bpTLTDIgDdZcYA1drV?=
 =?us-ascii?Q?8a+ZIiQDWtY9G8KAgZdXzxVH3DUH6sFf70CLbElR0KOuTbJHbYNbNiijnNvV?=
 =?us-ascii?Q?Pleb7Ga3chWWbktABdTr6CiNyKjX21oaiNwC5m3W2JjQnqcSU034KjdQ8zby?=
 =?us-ascii?Q?+xpF3vjZ7CWrcq5m47MMxDsNyqNe3xaCXoFz0/Vss6tioJl7Yb+X38mVKWxG?=
 =?us-ascii?Q?H9RX1PMtW0Psg4vQzUk4m8mX0lL4lXLLdr+6xvzY3iZMReNE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 733dfd87-1595-4562-b354-08de4d3385e0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 14:54:41.9154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTouVkb+bDapdy4KmQ551ijFJWIWzF4cYL3NavsOxq5xXONskenvlJlfkK8OUYYiUWUaIPd+K/3AzsIADJhKpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9333
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 06, 2026 at 10:15:18AM +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>
> Depends on first patch.
> ---
>  drivers/clk/imx/clk-imx31.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx31.c b/drivers/clk/imx/clk-imx31.c
> index 4c8d9ff0b2ad..962eccac63ce 100644
> --- a/drivers/clk/imx/clk-imx31.c
> +++ b/drivers/clk/imx/clk-imx31.c
> @@ -123,18 +123,15 @@ static void __init _mx31_clocks_init(void __iomem *base, unsigned long fref)
>
>  static void __init mx31_clocks_init_dt(struct device_node *np)
>  {
> -	struct device_node *osc_np;
>  	u32 fref = 26000000; /* default */
>  	void __iomem *ccm;
>
> -	for_each_compatible_node(osc_np, NULL, "fixed-clock") {
> +	for_each_compatible_node_scoped(osc_np, NULL, "fixed-clock") {
>  		if (!of_device_is_compatible(osc_np, "fsl,imx-osc26m"))
>  			continue;
>
> -		if (!of_property_read_u32(osc_np, "clock-frequency", &fref)) {
> -			of_node_put(osc_np);
> +		if (!of_property_read_u32(osc_np, "clock-frequency", &fref))
>  			break;
> -		}
>  	}
>
>  	ccm = of_iomap(np, 0);
>
> --
> 2.51.0
>

