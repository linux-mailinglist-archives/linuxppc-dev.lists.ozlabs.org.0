Return-Path: <linuxppc-dev+bounces-16829-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDpUBZt/jWmp3QAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16829-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 08:22:03 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B7F12AEBC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 08:22:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBRZ413nkz2yvy;
	Thu, 12 Feb 2026 18:21:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c202::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770880908;
	cv=pass; b=moUCr//8ToDC3G+YxJ5WZIgXu7OXMEl1XooeH0A9jZy/ye965YUzPq/1XldtLpbJa0jqzxVKN3ocN2cubGP8PhHdqSmlTq40fUX/VNwpS/F0C4h3EKsqQ9D6cBuzN3MLdFlMoRFNZ2FxARen6zhS5bBG4sSzpnM75FQdV3gpu8MHUZujYnAm4zeFKbdxZRLP7BVQ5a0oqeVGA9MKbZqGod0ggRZaEeDOdGwzWkqR61cI99l8RVM2wVNF8nsC6qqx96xpPwjW6euXIOZ2BZrQGRjgwPjZXdzz66lzj/97feI86qh7X11LoBu2CFfvK0V/6BCgkfVQj9EBh7fsSkT1KQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770880908; c=relaxed/relaxed;
	bh=9cWjVg9xlwIjM81WtN4XML1EZUh12jVvsILTUZjDH/U=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hiB83B+o7ZpuJctC91Dha3KAS0reExF3MCnLWsjwP8SOckUSY2v92NdMyItT1vPD0T9BlIi0/BgPWXKwCuyBxaUAAhRVESEU6CF2tcmSdpcZskvfFzr26ITr8Eu1gXGf191CkHkmhXmMwdG43kDQoSz4q2gJmLuo2VYGZbyM+1ceboC1o1d9SXWQyugzLc85uHie5GRX+EoOabRcC+NKp/xgZeo6tJ75/fC1OvirNtRuXG2uvbJbk5PKpC0KnyJ5qzTXyy0Y/69GgDjF7j40B5YnInSwdiauT95KWg+3M+JavmdNb0GMfaPC7GSrhq6IN/cr3EaqfbuPL/ZmqUlanQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=eo2GxjRf; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=eo2GxjRf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c202::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBRZ30Qfwz3bfY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Feb 2026 18:21:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dw4uSqSqCJ2YkV/niQpSKSzKZzCydkG0U7s9AxgNK7GUyFLxHneyN6vwOviByIAaEZVe2rZAKLuTNodPC9I5s8Otb7R50k2E1x/SWeiz3buHVUKU5Tu7sL1HywwjuGlB4UugRgYuCUYqqoJPuMMBlwSxZU/qEm0MAn+B0JHy09pEjoahkwfMCgMF8o4PO+mbgg/AdTRK2aG6EdTj0s+z0MvD83wOWeXE19fKSl1ibJiOyaMoogAuUFV+M7AKF+E6EqdfzMyNu3dHmVA/GjUynO573bnXfMWMVcOxW27UKu2TyPEe3Mhsf1yiAv/w6P9PdmIwNu7Op4XWiPN80ZjYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cWjVg9xlwIjM81WtN4XML1EZUh12jVvsILTUZjDH/U=;
 b=EHPx95c73kPIzy7D14l5d900+7ylia0iAOnRCLvk6vTkTh5b6r/BChA7wUJc5fSBQ2F/zpESqSI6s2u1HbA0tC0LhxguXQNXaHNI9EiPRizHjeKYlPsh3A3wHxG6uVeWWPsCps/oEBBxuPF5e5u2QHkXOGF8hguE7qnEcWIeUJK5YfFDeLgt5UEGsjejqI6dU4O1AhzC/NbREuveXL5u1RrSM7aDGGf7lqAwpB3TNS5ws71g0RvmMK2uzo9R0E7vk81TpvPPv+xo2TcB9DM0yIouuVgdq3jj9inGVzSZ3CfVX+Y+Ne89MRBCUlAR7jq7Zbeil4KcmF0sZPegp9hk+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cWjVg9xlwIjM81WtN4XML1EZUh12jVvsILTUZjDH/U=;
 b=eo2GxjRfYZrgUIS20PzFCgmii7HSZherCZbcRFO7YGARQd1v7aXVh6427d0rBG6fuYs9RU22gJzWvTYyRcliFGnmHECmMHxRCECNH6eYE3CnVS8rjO4p5WaMeQWwTdnkDajHP//LE1bz2lTU7DJIZe6gVhWBglDyRKLGCx7m8nwXMOdHkdvnj5Y7R+ws0XewIyA+6WDP+xDvmkqot9YNJNB4gnW4LzfNPLygm8qHfgBpoi6VYX90ihFllp75tNxvwiN6dZpt+FyiP54Bn6PJR0xJsNvQD5plnHGKZ5R82fNLYJ3dlsoQA51OfSmD687WlObXNxD/bL6TsdIS6PYkIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by DB9PR04MB9355.eurprd04.prod.outlook.com (2603:10a6:10:36b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 07:21:18 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9564.014; Thu, 12 Feb 2026
 07:21:18 +0000
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
Subject: [PATCH v2 2/2] ASoC: fsl_xcvr: add bitcount and timestamp controls
Date: Thu, 12 Feb 2026 15:22:29 +0800
Message-Id: <20260212072229.3247604-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260212072229.3247604-1-shengjiu.wang@nxp.com>
References: <20260212072229.3247604-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:195::11) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|DB9PR04MB9355:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f952db-a439-4b8c-5dc8-08de6a075071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pTn4YdAYfylEiT6qc2BuZsmNQIiPllmJdcrIEPSuVmb129jNunc35AuIP041?=
 =?us-ascii?Q?fS9U1+R+ObrHsenvAMsULrEjb5+nwawn1cAYxKTYmhbUApKSWBZdDObRq6NA?=
 =?us-ascii?Q?XHS4lGcIsh+YL/TzdNl/CdKwCW1wPptpx9mPa+8WMVE4lK4SjQ9p6+0MrcnE?=
 =?us-ascii?Q?Nep1ycWijaLar/0dZIRWMw4RzbPxBdUiGDy8aj9Aof77UsYcHIpXqzN6nfY+?=
 =?us-ascii?Q?OYFyDooEZeKHjzEIwzUf0yJUWMKu21KNOay+oC/6s+/TCVXcgRLbj6OV2vwN?=
 =?us-ascii?Q?0jms3TDoFBmsy20pE+8EaPJRtywMJgR16FFrmBST+Pm2gZPwwHvQOwz9QdMJ?=
 =?us-ascii?Q?C9WQwkRJYkNOyrdDOa+eu24Q9j+/hsIgO9r9QgZFFV9eZOvRfykdn5k1w8f9?=
 =?us-ascii?Q?p57dFlmcfTGgSKcNsisZcwh+ZWF/0h2O9/aIDz5VTFuH8T14JNce+k+kIrPY?=
 =?us-ascii?Q?RBn9dO1hj2hkqN3FoDk7LselIwrmOzEkEHuXfubqT6YMdq6O23k93/7Tsv/c?=
 =?us-ascii?Q?02qbtsqxNooccpcP0kwxEVBeAoyRdlApai4N321xReKwAaTfCsCmqYy1B7Pz?=
 =?us-ascii?Q?Cfgq79to99YGeXrqJ2WBqozNWUPbULThrN6n7ycOiV1cKcBkCz3uU/Q6bwxS?=
 =?us-ascii?Q?NWmKeCavsdF1Bu+ZkhgdYtxEWcbAvmRsEXS14HbB4Lm0ZoKgQwZ/q7NpiQud?=
 =?us-ascii?Q?dAUoub/lcOAqH2VH7JGDyYP9E5mkgCF1d0HE35vxLc2DPEjTZdKcAeCXYd6V?=
 =?us-ascii?Q?ctUTmN3tdK+57Q8NDR7dOYXvPRuCKrtu2NnPuJvRIhZOeWj2eeanD1YjKgQO?=
 =?us-ascii?Q?o7X/O4wvlpO7fGaSI2PhRU2bF7oy9EU9xH85MiLVBQ77i+MjjSUH6AXLNsdw?=
 =?us-ascii?Q?2f2PXkzPwBD5C5TvDfWgXuFIWR+wf/iGrwI/6wFlioPVdC6NFIINpVU7hVDR?=
 =?us-ascii?Q?FS6kHx/s6L3QU+Um1Dc1bM+elOvQMRKqvDXiXA2gozXf0V8NEc0Y3YRgU9QO?=
 =?us-ascii?Q?+aCYzedzQ7E6GAfRzVxG9c1EbHWCKbx+NZZvJWqnAKm4547+LtST7u2AHz9Z?=
 =?us-ascii?Q?lzw3gm7Xp9YaFGITIfKzdlPYAOIKAPkcfF2igmV2/J0h7kMAY530EuPcE7eb?=
 =?us-ascii?Q?DPjcu9eWyiWFutcmXyQZMQbWfeJKBeTmQZpD+Y8YIw9Trec+dYicz/crL9Xq?=
 =?us-ascii?Q?4GYP0MH6ZKdFQ64f8yXTSDYY8Ui5d6n1V8n9YlS9hTfs6vv7beoDI2/K3N2Q?=
 =?us-ascii?Q?+rEbtODEgomNIw02O5mKpscyeI5C2lyEcc9aDx+33gp/4szfLkhpqReQDf2p?=
 =?us-ascii?Q?9PGTrhnvhB9vS7czurNy13d/WNx3KvbC3DP1D+oABFwizux7GQ5prkiaKtfQ?=
 =?us-ascii?Q?g9CGOVqKl6rVvWn8Q7pWO8FjPA3UzPt6I1mWhUz3UIt94KxESNa1FVYlt/4n?=
 =?us-ascii?Q?Ww/PjOg4l/ApXChEXdY+PGhjBIlY3n9huXGSrMSHrQe1mOQqqK4iacBOzUTv?=
 =?us-ascii?Q?ow1VZpi3pvYLEPVDUA/IiJmalOrEFjwLz1B6xUfuchHh1DN+SF8zOhk2+zo4?=
 =?us-ascii?Q?xfFWJLVbx3Q/ZrXz0JKkn7qTEWYd/khmtWkamiMlfrwyML++AI5voWtNfdSp?=
 =?us-ascii?Q?fu2G7luJ8/Y8lnul8Jbs7eh9lPR9k3/Dx5e4VwevstDA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h37xLLVqRomBaO+qFcbOqmgdbjnz/JkcxNKnwiu0Q4nhpayLSkjiWBMYJuHR?=
 =?us-ascii?Q?deHfrZsqnOY9QRZaSXnbfbcEwvApswd6RnHFmwyDQI9crvpnsp31rSywMfSq?=
 =?us-ascii?Q?tKF500Ig5SgLhWv+oPrRU+iO9PL+V6KeR1LNu0nlzLyMr2iSN7jzx3OBFW5X?=
 =?us-ascii?Q?Kn0x1GnZHLCsA6BNud++s8jP72BzjyYvG6QrpxRRSV11Rbv2BDQF7dkpb8fT?=
 =?us-ascii?Q?D8zrBNFSZs5Pd43VVhM3DLc7m7C1AuDfjpkRj0NKpKpCnRg1g7IUlyjwnHAX?=
 =?us-ascii?Q?KQqX9w7YPTn5GChVPM4OM69wliVdacoQEHqdrtVQZnYyb2VUqbH9VxWOBx2o?=
 =?us-ascii?Q?VukAhW3bRFqlck7KZ+LWqB66zUDaClri9uWVVJ2TLGdhMFxw2LsIdB0gIUY6?=
 =?us-ascii?Q?F93jL0jUtUZHkMm7pgPm0dFpgoe39HpGh80dXtJr3C8SpSBfYq5bIXu2Xzrn?=
 =?us-ascii?Q?YlRDzSU++9rXUnFYsld44muj805K+b2AQ271qyNoPwymEihG/J2A6OWYP03k?=
 =?us-ascii?Q?19bTBAz8BdVAiM+d2PVeVdmI4vHZO3kfrDSCsf6LaWHXXFceswpjw7OKBa/f?=
 =?us-ascii?Q?7y1Z+ZT29Zl3D4H2l9MEgoov4LxgMJ/8ZsSCU4rXT+aHtS22gDVTRxJSeUfJ?=
 =?us-ascii?Q?/tz2K+HcwfCXVbwLPFdKMsP+0z721aI3HsCD/py/UWkM29bCzosuL5avxUZN?=
 =?us-ascii?Q?ZOOY4szlE8uNVlf4m/cb66Em6V/Cqk1KvDbRTt+xqBAZBuM4G0qtZWZA6q6+?=
 =?us-ascii?Q?NFLhg6S0LazKZQEg8tsGbkxrSVd4lqn5nxWSrPaoIzM6Q8iuq5OnuI5Lnp2w?=
 =?us-ascii?Q?M4dEsgoDxShUl4YmbPvXUQQDnLCof8TU2NbmBHwah/A1nSnyw+haVhP56ViH?=
 =?us-ascii?Q?PkPZirCFDbVyvVSmG6diw1JUvGmWUrdiwQ1gW1W4EYi71jnRwxeO+JTL2mc4?=
 =?us-ascii?Q?K3JRVrIKA26Lx0mfQ99ZpvJuG3tMWV3eNO4kgqwh6lyrFpDMOrtscGm+81zT?=
 =?us-ascii?Q?24UnUvkleEwG0Hc1nR24delTcRXlxfe34H+4xh3T8GQN/mNnDZzaSS2JAnYn?=
 =?us-ascii?Q?sgyc3FDnVoFv8/dGXlVOhvKyAIwBj2XEdhg+pH6Iy569Frpg9hdkXAwipKPA?=
 =?us-ascii?Q?UzqxWg1InGmjv8oxbA2XIajtfKODfgaEjk4ERd+rQiPR2VfsL+mZ20u/WqUE?=
 =?us-ascii?Q?PRoVXAVDo9D9ACJfj7Kvr09B8RvokVIUDmd/So2xnoeudPKsTYQUC6Bk4Vsm?=
 =?us-ascii?Q?T7qwHNBpbbecFKJinelkPwR39HXSjE8J83jezcAC3DhxDrbiBV8c1RrGInvZ?=
 =?us-ascii?Q?vpgfpPfI0P4mtcYQvEcIBa2aDMbSIvg3wPP/l+XaMYBT3FP8xC/IUAOrP4rN?=
 =?us-ascii?Q?hn3RzDpxhlsM6q7aIeETaAnSt2AFHAKvw4bYLgtpNOXtwIeUCphm3tjxqLC1?=
 =?us-ascii?Q?zJO+VpMbjGx8QUzLv1sb0d02dvJgdFlroXVvXOncFRBAPb1E+sqe9rAXwkYE?=
 =?us-ascii?Q?oGw9GLfbDZotGG9CgyyQayGTfcv0ZvRpUpVBCFKgDNxg3kRTGHotkDH5p+AC?=
 =?us-ascii?Q?dR03Q3ndlMRzFWUQZfggJUSKDcdQxt0aZLX+QSYx1uxQhMq5NBUQmSdgT8BM?=
 =?us-ascii?Q?playcXW2rUzM6T2tnpleVP7BcPwjvMfnWed1Y4vlC8tUyYanWpSgglOZa00C?=
 =?us-ascii?Q?/lHj7I5Z5IXE60zXOgIA4vI+VKIo/EBwxgKmOjGxcdYGI+U0vn8DG3r6waKR?=
 =?us-ascii?Q?8k+RtWkmuw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f952db-a439-4b8c-5dc8-08de6a075071
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 07:21:18.1317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7Wv2rSExWMgFPLPiJGXuANG1zQQU6CkVPK6NK19PuGRDJTFjwlAbdBdFuvw3Q/2QdIY/XDNmM02JTPEdKUPvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9355
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16829-lists,linuxppc-dev=lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 21B7F12AEBC
X-Rspamd-Action: no action

The transmitter and receiver implement separate timestamp counters and
bit counters. The bit counter increments at the end of each bit in a
frame whenever the transmitter or receiver is enabled. The bit counter
can be reset by software. The timestamp counter increments on the bus
interface clock whenever it is enabled. The current value of the
timestamp counter is latched whenever the bit counter increments.
Reading the bit counter register will cause the latched timestamp
value to be saved in the bit counter timestamp register. The timestamp
counter can be reset by software, this also resets the latched timestamp
value and the bit counter timestamp register.

The timestamp counter and bit counter can be used by software to track
the progress of the transmitter and receiver. It can also be used to
calculate the relative frequency of the bit clock against the bus
interface clock.

As there are three regmap handlers defined in this driver, explicitly
call the snd_soc_component_init_regmap() to init regmap handler for the
component.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 56 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_xcvr.h | 18 +++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index a268fb81a2f8..0196c95a7e9a 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -62,6 +62,50 @@ struct fsl_xcvr {
 	u32 spdif_constr_rates_list[SPDIF_NUM_RATES];
 };
 
+static const char * const inc_mode[] = {
+	"On enabled and bitcount increment", "On enabled"
+};
+
+static SOC_ENUM_SINGLE_DECL(transmit_tstmp_enum,
+			    FSL_XCVR_TX_DPTH_CNTR_CTRL,
+			    FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC_SHIFT, inc_mode);
+static SOC_ENUM_SINGLE_DECL(receive_tstmp_enum,
+			    FSL_XCVR_RX_DPTH_CNTR_CTRL,
+			    FSL_XCVR_RX_DPTH_CNTR_CTRL_TSINC_SHIFT, inc_mode);
+
+static const struct snd_kcontrol_new fsl_xcvr_timestamp_ctrls[] = {
+	SOC_SINGLE("Transmit Timestamp Control Switch", FSL_XCVR_TX_DPTH_CNTR_CTRL,
+		   FSL_XCVR_TX_DPTH_CNTR_CTRL_TSEN_SHIFT, 1, 0),
+	SOC_ENUM("Transmit Timestamp Increment", transmit_tstmp_enum),
+	SOC_SINGLE("Transmit Timestamp Reset", FSL_XCVR_TX_DPTH_CNTR_CTRL,
+		   FSL_XCVR_TX_DPTH_CNTR_CTRL_RTSC_SHIFT, 1, 0),
+	SOC_SINGLE("Transmit Bit Counter Reset", FSL_XCVR_TX_DPTH_CNTR_CTRL,
+		   FSL_XCVR_TX_DPTH_CNTR_CTRL_RBC_SHIFT, 1, 0),
+	SOC_SINGLE_XR_SX("Transmit Timestamp Counter", FSL_XCVR_TX_DPTH_TSCR,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Transmit Bit Counter", FSL_XCVR_TX_DPTH_BCR,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Transmit Bit Count Timestamp", FSL_XCVR_TX_DPTH_BCTR,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Transmit Latched Timestamp Counter", FSL_XCVR_TX_DPTH_BCRR,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE("Receive Timestamp Control Switch", FSL_XCVR_RX_DPTH_CNTR_CTRL,
+		   FSL_XCVR_RX_DPTH_CNTR_CTRL_TSEN_SHIFT, 1, 0),
+	SOC_ENUM("Receive Timestamp Increment", receive_tstmp_enum),
+	SOC_SINGLE("Receive Timestamp Reset", FSL_XCVR_RX_DPTH_CNTR_CTRL,
+		   FSL_XCVR_RX_DPTH_CNTR_CTRL_RTSC_SHIFT, 1, 0),
+	SOC_SINGLE("Receive Bit Counter Reset", FSL_XCVR_RX_DPTH_CNTR_CTRL,
+		   FSL_XCVR_RX_DPTH_CNTR_CTRL_RBC_SHIFT, 1, 0),
+	SOC_SINGLE_XR_SX("Receive Timestamp Counter", FSL_XCVR_RX_DPTH_TSCR,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Receive Bit Counter", FSL_XCVR_RX_DPTH_BCR,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Receive Bit Count Timestamp", FSL_XCVR_RX_DPTH_BCTR,
+			 1, 32, 0, 0xffffffff, 0),
+	SOC_SINGLE_XR_SX("Receive Latched Timestamp Counter", FSL_XCVR_RX_DPTH_BCRR,
+			 1, 32, 0, 0xffffffff, 0),
+};
+
 static const struct fsl_xcvr_pll_conf {
 	u8 mfi;   /* min=0x18, max=0x38 */
 	u32 mfn;  /* signed int, 2's compl., min=0x3FFF0000, max=0x00010000 */
@@ -1070,8 +1114,20 @@ static struct snd_soc_dai_driver fsl_xcvr_dai = {
 	},
 };
 
+static int fsl_xcvr_component_probe(struct snd_soc_component *component)
+{
+	struct fsl_xcvr *xcvr = snd_soc_component_get_drvdata(component);
+
+	snd_soc_component_init_regmap(component, xcvr->regmap);
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver fsl_xcvr_comp = {
 	.name			= "fsl-xcvr-dai",
+	.probe			= fsl_xcvr_component_probe,
+	.controls		= fsl_xcvr_timestamp_ctrls,
+	.num_controls		= ARRAY_SIZE(fsl_xcvr_timestamp_ctrls),
 	.legacy_dai_naming	= 1,
 };
 
diff --git a/sound/soc/fsl/fsl_xcvr.h b/sound/soc/fsl/fsl_xcvr.h
index dade3945cc0c..0cc7945b1d9f 100644
--- a/sound/soc/fsl/fsl_xcvr.h
+++ b/sound/soc/fsl/fsl_xcvr.h
@@ -233,6 +233,24 @@
 #define FSL_XCVR_TX_DPTH_CTRL_CLK_RATIO		BIT(29)
 #define FSL_XCVR_TX_DPTH_CTRL_TM_NO_PRE_BME	GENMASK(31, 30)
 
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSEN_SHIFT	0
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSEN		BIT(0)
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSINC_SHIFT	1
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_TSINC	BIT(1)
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RBC_SHIFT	8
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RBC		BIT(8)
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RTSC_SHIFT	9
+#define FSL_XCVR_RX_DPTH_CNTR_CTRL_RTSC		BIT(9)
+
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSEN_SHIFT	0
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSEN		BIT(0)
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC_SHIFT	1
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC	BIT(1)
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RBC_SHIFT	8
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RBC		BIT(8)
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RTSC_SHIFT	9
+#define FSL_XCVR_TX_DPTH_CNTR_CTRL_RTSC		BIT(9)
+
 #define FSL_XCVR_PHY_AI_CTRL_AI_RESETN		BIT(15)
 #define FSL_XCVR_PHY_AI_CTRL_AI_RWB		BIT(31)
 
-- 
2.34.1


