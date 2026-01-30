Return-Path: <linuxppc-dev+bounces-16458-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDgMOMrDfGmgOgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16458-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 15:44:26 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06795BBB13
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 15:44:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2f0b74sSz2xWJ;
	Sat, 31 Jan 2026 01:44:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769784255;
	cv=pass; b=iXgzBpYT3dHmWxQZ/K5kfoKXZt2fnyEGcxbxGELtCG56YzxIbFR1LMpkju7KkSK3+SZ7P2OnACDP2q7pOUoCFgB444iPiAdTFfJ1K442pMM0N3gfa2vkrHRulqpLQ6JUFSLzTVmhn2ioT2ZL0AQ9qhCJUihItR4bhiKPI7BXo5yGiMPNvegtNpwQBiWxAz/h+41J4bMFUOLk9yqnHPJDHvhV0KGrSY4Wh/4n3D5q7eet9/bkv8rckIIQjs+ehXnEJJPDoMx04Umq6ZnTvvgdmDiMBUuuOvZj9Jg9TpSA2jz43lWKpqptEcFezT4SiE9yMnq1SQLluy73vz+nieEiVg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769784255; c=relaxed/relaxed;
	bh=DXXA/9E4WQVpQLXi+y4mm/AqU/bqOOmH/Sopw/Yd15Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Go0bf3ZlTrKeLazBYCa9qg+LNnLpLKtm3EixMXoxMO30sZO8Zxgyi3epWKd4exMBij+/GZSb0TvPMcvgYyYWS2osgXrQqUIgRrbuoQXu/v626LqWNnMgmCSaNkUJJZSgKIcrmvklhhZrmwU8DOOWgXTMIe43pxGTTd99944BNwifx+kn8jOs/BUXDyPQ3wL7QI+QMdDcOGZv8NoLHftV+/VVlbmomnlhm/NGEj3MEf+EnJXnQSuAwDgs5Qww57cU1PVKB3vJnZ/+8xOjZJ2gscuNawrDSU82FeqhlnixE4ahiFFpH3zymsCJMQ68TB5OIvcgyKyQsHfajozsftGM0w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=lVrDvwWt; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=lVrDvwWt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2f0X6kFcz2xS7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 01:44:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgxabnYdz91/Hygs+qeXMqGXTgqYGE/wJGa4uGyhicLv2nmLzWZPuJbEu0mSF+aubgB64x3sIhXTegjoy4tPdO76YBF8IcOYEg9eKGxAcpXd7Jy4cRI9L/tTsl8uG7YgaJ3TrpMeu/v3PwpAQAYof4j7vVveN7tWXTdrAtzTgzppC/ACRlAtvG3K8ukmPnOCVIdwk66t9WEHFNBR6c6mCU+Vu7Mr3yXWM39bNmYt5l6VRtZkSqt3Xhg1Tn1JLnUtH13K4hDhrqhwLgkXlhFvMEDwmOQSRphZJsWIUw3n9y9vf9Whk9al3gEIAiiEM/jxGkftyVgdn1LSfLOwbdhiOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXXA/9E4WQVpQLXi+y4mm/AqU/bqOOmH/Sopw/Yd15Q=;
 b=tkpB4uqYsvsFijYWIYN2Kbpb3ScGebX5m1BKB6plV09JqsALu+sVzvqUfXyOSswNMXw7mY+baJOpVFWEQffB3c2lWPdYNvArsAHk7w4onpyGO+iuOj6fUXqxIX8CFlxBMgNLe+PkmNTfMB0h1USSQa283pLkWldfpVPaKpfWBSZhNFGcUBz9iWxDhmKXfATzSPZ4HLsadZ59X7DxJSWfyqINmL/DQfZCT5uBbkkd6dHd8K2qr0oCWpuJoptx1uvW6xf3wqBDbKuMBbuRPxhsxctmwPEPPK+/5Jm6VvyTLzsXK9V4D2cNjsdF0O1XHBm0fyOEzze0wRNxOQOBTUOH9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXXA/9E4WQVpQLXi+y4mm/AqU/bqOOmH/Sopw/Yd15Q=;
 b=lVrDvwWtC2hgja4fkZ2lvEgjMgdGTPg/efhFJ89oiAWfLYvRxOp+CfiqV7pl1e+OkLCabbagJcs9M6Bs75NByKZztsnOiUXy/LH8hIGn9/7nXR+pxymLT3FY1/9wVYbbsGNNa4VculTUY7OwbR/HH9R6s/WKXr46LVIJjIVejvB1jwWVmiVfjyewQG6wdbkpLuqGqjn5XsbDzTGvmzceFJplDho1f/pwL6obPwj24NE/wsu7ZGDxFerJBXfM1nhxW3Vc/8mRwfPc9yPkxIi3A6+f183gLvIm0sk8JaT7f75rZ3JseGfVAAjTAyrBI2zMOgvke8ppn1efqAkJ4mczLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DUZPR04MB9745.eurprd04.prod.outlook.com (2603:10a6:10:4e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 14:43:44 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 14:43:44 +0000
Date: Fri, 30 Jan 2026 09:43:33 -0500
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz,
	tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 3/4] ASoC: fsl_asrc_m2m: Start ASRC before DMA device
 for M2M
Message-ID: <aXzDlScEXfmUys32@lizhi-Precision-Tower-5810>
References: <20260130054330.3462544-1-shengjiu.wang@nxp.com>
 <20260130054330.3462544-4-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130054330.3462544-4-shengjiu.wang@nxp.com>
X-ClientProxiedBy: PH8P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
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
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DUZPR04MB9745:EE_
X-MS-Office365-Filtering-Correlation-Id: dbbdb743-c528-4073-bef8-08de600df7af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ovgzgVm1SLq6ZCMxNNPuikiFu8Gj1DEUhs+J4kgDx0LjKFquttNkOahJIMYt?=
 =?us-ascii?Q?FUDBJ0lxPtZOhStNmKeSXETqee5QahxouOThMyvcKZ9dqJm9SeuMjIkxgby+?=
 =?us-ascii?Q?JZy0RaaAI64dPKGZ8leUHSk2NfJfzebWaa3z938w3ctpiRd+P3zZkbh+3Yv1?=
 =?us-ascii?Q?uZwhpJR8TpeAZhAbKb1u5CPPRY+obYdXaXoCfk2tEy5DlXhdZfQOMSLUeQSH?=
 =?us-ascii?Q?s0bTbA82NUrS6G8F22/WYh1EY7K+RhYjqJyWO2+PcsXF65iyh3e6KtDoqWQk?=
 =?us-ascii?Q?NnIVQG5h4R9hywGwlCHkmZ0NXvPKD/SG0fs7q3yHsXQu5qFrDQd+U9si46D0?=
 =?us-ascii?Q?Xs2KpDHpanEAoMul3k9ZVGlMj+Xb5W0h7QPcVW1qrLnlWX3msSLGKXGxdlD9?=
 =?us-ascii?Q?zVM3aVNiS84Qs+fpT+a96K8+T898WJG9yvWvBi7VVrh1xEjVyT4XQEty+gsp?=
 =?us-ascii?Q?zkQiiPh5appvWm5JDqRClqwD5ZxvU9Q8GKA9/Za3ZxdYDLWVxHDCJXo3WHqv?=
 =?us-ascii?Q?R4HV9u54gOn8zh4XYxHzNR9uoJIrs2RAq69Aj74qQ8g8klTFkO4WgNQRDq89?=
 =?us-ascii?Q?J247oFqWCTW4sMoPmkLGqRqI5vkA9wWNeywNLYf3ahMZ0YwGLsVp4/lkq4ml?=
 =?us-ascii?Q?AvU8iTZUGON/0ZDvBTlPGmesyiSgojkfn0LBMrYAKPrYtH6/uXP6CQEwcIB3?=
 =?us-ascii?Q?aZeFip3YcRNBzUSZaYn71OwoXRcH3ZP3pY5PyPi7P1poyB8WbEiNIPiyPJVO?=
 =?us-ascii?Q?rm9mO86dXQbiMR2/Pvb+LiL+2IPCuGtjDbqK0RAm4nDu5X6a8PfkKH9xrDC3?=
 =?us-ascii?Q?kXSsu/Bmj6FjY1RL1VnAQG/g6yVp9i58ID4CHdRPQ6NbhItfzXpxziSGDC8z?=
 =?us-ascii?Q?Dk4EcHIHlpDiwpflB8y2HHLtGBeOO6+BFVb4MP0oSF6TuZEd+jTFJG5FPO9i?=
 =?us-ascii?Q?lfqnx86xNv4QZFBjWr/Q7O/AXH82EqN6Y7mmS9uFDzUK79ap+oxjzzRt+S36?=
 =?us-ascii?Q?1FzvnkPuGN+IU60SZkC7MrSCE3HBqb1zeqDvpkdtK8A5Oh9mxMrEEDflnRyu?=
 =?us-ascii?Q?lRYdxhcXi9Kbq5IvKHT4/RipoHxRxvNONVgPIIoILqsXrooEdo+3FFjT4UzI?=
 =?us-ascii?Q?DLAwwVoVH45keSrSzXSHjj/fy5oRrpNQ4k73ln8w0cmUzuzqDBXhXoNBl2kO?=
 =?us-ascii?Q?zXEgdtrSpy0vdiHz4ttVEMOG2qKJu5wKdcIS9G3nBxpCXWgRa3zya1j1bd7s?=
 =?us-ascii?Q?G3BlYwWRWNelk8zfZxxOP2WVkTGG0fuQJXuJI0k4hg15E47JqYkSForESeqB?=
 =?us-ascii?Q?RaPem5wSf+J3eTJEMi/nBIy9a6qCrpak0sRwuSvflOXJu5aZCIYaXYyEqAYU?=
 =?us-ascii?Q?ghMOLDOoznso4kL/1OUPrhGLzJldZbNy70/IPg/6fUE6zyJ7BjCEsJ+U/ML+?=
 =?us-ascii?Q?AWJtv0mckZlXckLlFhwUuQa2tcRM3NgXteJABLpQiesMI+4T5oRG44XGUsqe?=
 =?us-ascii?Q?evVPd36Y/d82/BHOblrsfiVJ99Lbn5KR1H4AOPvCufR1a/kZYOW4mUOXUI5N?=
 =?us-ascii?Q?oE3ZJUhXlZODrHkmxNLV1ruKV+A8oammIcslgAK7HpiRjbp1EoNg4rFq0u5I?=
 =?us-ascii?Q?cRj9tJWZOhS8gjfg9P5AIko=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J9qY6COw0W96BSJ8iOF1Fx4EN3tBpBRrH2m0N94yvlYtcpuEIFvjyf3SIuPd?=
 =?us-ascii?Q?K0kY2xNPMPPFTST0YRv+oT7Yi7qJBUHuXnInketS1IYuMFIv4M+nWmKC5cSj?=
 =?us-ascii?Q?e3zc79tXLd5I0jVMM2RzumETfkPANHV5uNEE9W3GrqqKGnSVW6bdIa53CEZQ?=
 =?us-ascii?Q?PT0ah8IzqJ5XaEmbs3icUmxJJsUKcw4uV0SivMHjs0GQPrmYjgnTUSWZd0i7?=
 =?us-ascii?Q?WhLPwQC7HnLS1hPl3wwT1LZs4PoEulGNvwM8VsK3vHp81Qs3Ad+1skGtO8A9?=
 =?us-ascii?Q?uSf0VAZP3/EyHHUuD/UIK8P5S8n25o7U8m/u9lXoUCfaamo1Sy3EaVFpIUky?=
 =?us-ascii?Q?0byF439ZsOdFnjOdhYBVuti1vr/rGN6YHjuIuYbm0KpDknMs3KhGfflBUdd1?=
 =?us-ascii?Q?G8e56MRotQ8I9sdLd13eP66PM0uUveM5NJfO4TWfo5eMs9wFPBWS0QPHfiNs?=
 =?us-ascii?Q?CuqyrTQYnWrJ2dBKamhj/n6XLsNZDYyV3i6kXPHR/xoug7My1Fed/L2kbRL7?=
 =?us-ascii?Q?AblSse5czOiOWQ6mjWu0mds7BMsx5DTQk42ig3GJ4kr7RIgLGQ5GCAb2LPjr?=
 =?us-ascii?Q?+uucgpGf9T8vOEO94r+RRcBHyvF9u6XJZjFqDtSLaZF0EJfz8oxGJ2Tj1+nU?=
 =?us-ascii?Q?Cahy7pICsg83mNCQEH+h4MztkC/6RKGeyvlNBZz9cQH8y9+ValKLwC2FtMiR?=
 =?us-ascii?Q?hG27F/r+wB2P0BNK44iV5PVRA0vKXVv7lMk/u2u3ZzhyqDX1tPBQY6jy9x0A?=
 =?us-ascii?Q?OeVrxaxpRb+NAxWsqe7q4ps5eVP2p5bh6zcayIY9Ra+/6MyXgDn66lApswGQ?=
 =?us-ascii?Q?oI/xha+66o9IS9/JC58vCTFhRtb9CjsqlzIxGwX2/K+VNHla2lZEV4d8px3I?=
 =?us-ascii?Q?K/WHA/SllfCbNdTRzgXbSSnU2lE4B4U0EKIO28ZYWkRMyCe8uMJCDzD0HGGB?=
 =?us-ascii?Q?WPgiNOuTa6LS2OpED9+Dd8Es4cvFj16Xs8Mig63HVic43KSOEKFAbe4w/mWX?=
 =?us-ascii?Q?tPsh6ncr/2W1GZY5pB1vBvHPr+NfktjIyoQSIQ9FN3VPNokot6GlzRI2HerR?=
 =?us-ascii?Q?9sqnINAObcmXHO1s8wpJu9fXLN6deLExKWWlsjDZ5WZhT/nicblHzRGpgkZl?=
 =?us-ascii?Q?Wsi48RAk4ygIKWJRLon5N9NKsGw5CZSlftLM7SFi0MiRMnSJ6IpdE2t+qZ96?=
 =?us-ascii?Q?dgY51aAyR/4HOnu1UacmdDvIljdiMqCjksUcixOsqbnE1GNjnIoSIKzSoH2Y?=
 =?us-ascii?Q?W/628hgFxG1bRH2G9LVJszF6j5txgtswZ36QVsYKSdidKLn+z0zQJX/vg0Kc?=
 =?us-ascii?Q?SlnegEYK7uz2lOd1ZvDiAHhUjKmgKwXqx92iGwK9LR3Al/2d9QaPzGy67pIm?=
 =?us-ascii?Q?ak764kP3WHGtH0ulBYmZetonVrquNPHXdUYHIB7cyBbuwPLo5Uq4jkWdcRoy?=
 =?us-ascii?Q?RdYb9m7k1BkIn4yvLiQecgsimJ7CDthqrSM6Ia1oMTTiajB15Lcq1JUcZuHl?=
 =?us-ascii?Q?JIzf8z/WAWyEx6ArqXPp/DwmHA1ypAYuaP7a/fZpN69yIj7KYMPBIkOE+xZ4?=
 =?us-ascii?Q?7Sns9P160/YGvmAOEIiC7p53f3OzJ1DOtbsIg2PIMKEvi2Iy6cEmVNKITyAa?=
 =?us-ascii?Q?Nuo59PFz37q+EXoQDATftQU9nv51gc4JpmUGDSLHsVPluzMdfvz94iW1ruab?=
 =?us-ascii?Q?D/EVQvKM683AHcNcTsFzuOK2fIgepkmulaAhTWRF8VDqtk/IlQNsgSYL42IE?=
 =?us-ascii?Q?bEpE7VqTiw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbbdb743-c528-4073-bef8-08de600df7af
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 14:43:44.3627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mYzI6HkQcPEhYAtuDZhKASaF5u07V8OYR88tLiR4Ln/j4Ye2CwCjNPMKH6RYmpu/OojFlCc+cg1X4Yhe1oFU3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9745
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@nxp.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-16458-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: 06795BBB13
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 01:43:29PM +0800, Shengjiu Wang wrote:
> There is a limitation on i.MX952 that dma request is not cleared at the
> end of conversion with dma slave mode. Which causes sample is dropped
> from the input fifo on the second time if dma is triggered before the
> client device and EDMA may copy wrong data from output fifo as the output
> fifo is not ready in the beginning.
>
> So need to trigger asrc before dma on i.MX952, and add delay to wait
> output data is generated then start the EDMA for output, otherwise the
> m2m function has noise issues.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc.c        | 25 +++++++++++++++++++++++++
>  sound/soc/fsl/fsl_asrc.h        |  2 ++
>  sound/soc/fsl/fsl_asrc_common.h |  4 ++++
>  sound/soc/fsl/fsl_asrc_m2m.c    | 29 +++++++++++++++++++++--------
>  4 files changed, 52 insertions(+), 8 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 5846a2b1f73c..2374577c13f9 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -1084,6 +1084,28 @@ static unsigned int fsl_asrc_get_output_fifo_size(struct fsl_asrc_pair *pair)
>  	return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
>  }
>
> +static bool fsl_asrc_m2m_output_ready(struct fsl_asrc_pair *pair)
> +{
> +	struct fsl_asrc *asrc = pair->asrc;
> +	enum asrc_pair_index index = pair->index;
> +	int retry = 1000;
> +	u32 val;
> +
> +	/* Check output fifo status if it exceeds the watermark. */
> +	do {
> +		regmap_read(asrc->regmap, REG_ASRFST(index), &val);
> +		val &= ASRFSTi_OUTPUT_FIFO_MASK;
> +		val = val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
> +	} while (val < ASRC_M2M_OUTPUTFIFO_WML && --retry);

use regmap_read_poll_timeout()

> +
> +	if (!retry) {
> +		pair_warn("output is not ready\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  static int fsl_asrc_m2m_prepare(struct fsl_asrc_pair *pair)
>  {
>  	struct fsl_asrc_pair_priv *pair_priv = pair->private;
> @@ -1281,6 +1303,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
>
>  	asrc_priv->soc = of_device_get_match_data(&pdev->dev);
>  	asrc->use_edma = asrc_priv->soc->use_edma;
> +	asrc->start_before_dma = asrc_priv->soc->start_before_dma;
>  	asrc->get_dma_channel = fsl_asrc_get_dma_channel;
>  	asrc->request_pair = fsl_asrc_request_pair;
>  	asrc->release_pair = fsl_asrc_release_pair;
> @@ -1295,6 +1318,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
>  	asrc->m2m_get_maxburst = fsl_asrc_m2m_get_maxburst;
>  	asrc->m2m_pair_resume = fsl_asrc_m2m_pair_resume;
>  	asrc->m2m_get_cap = fsl_asrc_m2m_get_cap;
> +	asrc->m2m_output_ready = fsl_asrc_m2m_output_ready;
>
>  	if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
>  		asrc_priv->clk_map[IN] = input_clk_map_imx35;
> @@ -1565,6 +1589,7 @@ static const struct fsl_asrc_soc_data fsl_asrc_imx8qxp_data = {
>  static const struct fsl_asrc_soc_data fsl_asrc_imx952_data = {
>  	.use_edma = true,
>  	.channel_bits = 4,
> +	.start_before_dma = true,
>  };
>
>  static const struct of_device_id fsl_asrc_ids[] = {
> diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
> index 2f67b085de24..1be93148a879 100644
> --- a/sound/soc/fsl/fsl_asrc.h
> +++ b/sound/soc/fsl/fsl_asrc.h
> @@ -446,10 +446,12 @@ struct dma_block {
>   *
>   * @use_edma: using edma as dma device or not
>   * @channel_bits: width of ASRCNCR register for each pair
> + * @start_before_dma: start asrc before dma
>   */
>  struct fsl_asrc_soc_data {
>  	bool use_edma;
>  	unsigned int channel_bits;
> +	bool start_before_dma;
>  };
>
>  /**
> diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
> index 0cd595b0f629..c8a1a2b5915d 100644
> --- a/sound/soc/fsl/fsl_asrc_common.h
> +++ b/sound/soc/fsl/fsl_asrc_common.h
> @@ -107,6 +107,7 @@ struct fsl_asrc_pair {
>   * @asrc_rate: default sample rate for ASoC Back-Ends
>   * @asrc_format: default sample format for ASoC Back-Ends
>   * @use_edma: edma is used
> + * @start_before_dma: start asrc before dma
>   * @get_dma_channel: function pointer
>   * @request_pair: function pointer
>   * @release_pair: function pointer
> @@ -116,6 +117,7 @@ struct fsl_asrc_pair {
>   * @m2m_start: function pointer
>   * @m2m_unprepare: function pointer
>   * @m2m_stop: function pointer
> + * @m2m_output_ready: function pointer, check output fifo ready or not
>   * @m2m_calc_out_len: function pointer
>   * @m2m_get_maxburst: function pointer
>   * @m2m_pair_suspend: function pointer
> @@ -143,6 +145,7 @@ struct fsl_asrc {
>  	int asrc_rate;
>  	snd_pcm_format_t asrc_format;
>  	bool use_edma;
> +	bool start_before_dma;
>
>  	struct dma_chan *(*get_dma_channel)(struct fsl_asrc_pair *pair, bool dir);
>  	int (*request_pair)(int channels, struct fsl_asrc_pair *pair);
> @@ -154,6 +157,7 @@ struct fsl_asrc {
>  	int (*m2m_start)(struct fsl_asrc_pair *pair);
>  	int (*m2m_unprepare)(struct fsl_asrc_pair *pair);
>  	int (*m2m_stop)(struct fsl_asrc_pair *pair);
> +	bool (*m2m_output_ready)(struct fsl_asrc_pair *pair);
>
>  	int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input_buffer_length);
>  	int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index f46881f71e43..296e13a16490 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -253,15 +253,28 @@ static int asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_task
>  	reinit_completion(&pair->complete[IN]);
>  	reinit_completion(&pair->complete[OUT]);
>
> -	/* Submit DMA request */
> -	dmaengine_submit(pair->desc[IN]);
> -	dma_async_issue_pending(pair->desc[IN]->chan);
> -	if (out_dma_len > 0) {
> -		dmaengine_submit(pair->desc[OUT]);
> -		dma_async_issue_pending(pair->desc[OUT]->chan);
> -	}
> +	if (asrc->start_before_dma) {
> +		asrc->m2m_start(pair);
> +		/* Submit DMA request */
> +		dmaengine_submit(pair->desc[IN]);
> +		dma_async_issue_pending(pair->desc[IN]->chan);
> +		if (out_dma_len > 0) {
> +			if (asrc->m2m_output_ready)
> +				asrc->m2m_output_ready(pair);
> +			dmaengine_submit(pair->desc[OUT]);
> +			dma_async_issue_pending(pair->desc[OUT]->chan);
> +		}
> +	} else {
> +		/* Submit DMA request */
> +		dmaengine_submit(pair->desc[IN]);
> +		dma_async_issue_pending(pair->desc[IN]->chan);
> +		if (out_dma_len > 0) {
> +			dmaengine_submit(pair->desc[OUT]);
> +			dma_async_issue_pending(pair->desc[OUT]->chan);
> +		}
>
> -	asrc->m2m_start(pair);
> +		asrc->m2m_start(pair);
> +	}

if really like start_before_dma, move common part no change

	if (start_before_dma)
		asrc->m2m_start(pair);

	....

	if (!start_before_dma)
		asrc->m2m_start(pair);

Frank
>
>  	if (!wait_for_completion_interruptible_timeout(&pair->complete[IN], 10 * HZ)) {
>  		dev_err(dev, "out DMA task timeout\n");
> --
> 2.34.1
>

