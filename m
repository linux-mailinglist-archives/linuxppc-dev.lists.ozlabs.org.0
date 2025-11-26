Return-Path: <linuxppc-dev+bounces-14497-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFA2C887C0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Nov 2025 08:46:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dGWpX2Swrz2ynP;
	Wed, 26 Nov 2025 18:46:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764143188;
	cv=pass; b=EIVJoIUYFufNAm2xzHozvyZbfJybsX5rfJ+QDeg1/RwOiwNfhQW2UMJ2hHv9wOCZoaMOYk49GICtDgN1xO7os2H94yEQDsuqkgUxap5Y2nTg93v0jIS9nsalJBnvXXX368sb/gRpFu1wzJBB/SK8aS8ZgRaoD9l1VLE3UaYpdHxhtpeQ+jdIbHUFxYBdJJmzlf1ZaMHTrEgAvSvUs8x9V/TuKuZPVkFxXBk/+kE/8+oBMG355gQpAdyW5VBZTcDSYF3MAcraz1WhuFU5IxrYxX6SdOLadeVYKAJ/3w/ZSuLrcV+MIas3hzeEOO436BmY4xLMXjCRS7taPs3EECpVXA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764143188; c=relaxed/relaxed;
	bh=cufj6n+LmqoPpt2coxk7UAG9JYMBSX4exjaBwOg72Tg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=V/XIJE6HIiJQ6s5YeIyU23U3qtctD2dUB2z743fmJJ60HJCq5FN4BEHGyBd81Mk/13xHtvlSOiLg2T63EmmRtxkUMFAbpK+CLZ9cYN4Mfwxr01j+KuBKvWn0fgG2bt6u6f/Ol/jrD6XglN6ioPFsVLKg2s0VWs6nCp+SKMDDdFBLZMSknzHW0WIQKIR+yNWM4X15XTA9lrAv5CRr92nZQR41ADkjls+DfIpgsXYdMCLnuIE9bg5zosEuUHjcIMoy85Uy/zMeNJCNRwHFLUauh/5KOU4BV9zJT+/LMtLkJBcMLtMlunaz3qgVxEgZak0oKsyFgpv0Mjg6TBAVF4yATg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=W7ew+WFh; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=W7ew+WFh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dGWpW17Vpz2xPy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Nov 2025 18:46:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sta7LACMh6EpIxxkWRadHB2eiD1jkUZCcdqx315ilIR1dCjyFbj49dKysep41E9+r3aWHV7lEiqFd4G6rSTTCG+rUprKwRbGhFKQuSaeFsw8zsgzYQ1lTSGPe+amy4fy5mQoAwthmbT77dVywdE0LHlJ0J6yUDoEDsRg47gA0/IgfjGTon1LlsvDzF4X/alauhgxz+v5XrThtfKMDWphLQQTAhO+aVy0a3ajr4sePfwbqWppqR53cwmiXHP0M6bTid0QeKKcPgwntuskfx1R/AKF/qolWY3NDU+zN0bfdC9cs56H2j/jERSH/LmwbZZc5Jsg6UmwgnaYJ6VfJorS+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cufj6n+LmqoPpt2coxk7UAG9JYMBSX4exjaBwOg72Tg=;
 b=ihk4TJBhT3cKhybMb6fmWLj8BWTsyDXUZ/F86wrq+iQtzdvGTRi+5kuiBTo2Y1SMmLFjVVy3qIG+sJ58Cgpx2XW80JA/uiYyBtINTNe2Jo5jWiC0elmnkAStMjbV93jHvTgvy3PXzRttasuUuPx8nP2CL5FYtVQ4hfP3k00a40T7O9lM9miifVppJpKQMaH2FeK1HzREzf3tCfdlBqjwjkCdX8Nl45dZLukIkeCrYBOs1beLL7K68FNrESFn9VeYJIIwOppsOZg65r694rGrxcUIolyw6BV51ehCh9ITmcivZCwcITLFXuwCgedd9N4z9gZrz/tSt51PNmw3u6jWAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cufj6n+LmqoPpt2coxk7UAG9JYMBSX4exjaBwOg72Tg=;
 b=W7ew+WFhR/wR+VUn/wVaQOyLxPAmfRWpCNyBrtJ4973gbGRu65Rle1zL5VZiX0TrADH3Sw9lQZjxuR15Lp02P7/pBMSgCfL7lvdAL/Uaz8r2Pfp0SGNximrnx1f1MjmszFJRWsPV6afkKD0pP3XowVvyffWDMJDHPHL6iJjvKYcW1FYYt7d6i6DEw4D0jiYktlr76KcEI9u8KPcH3+c/HEy2wm4orCSvpzMbhKXjHf3BJyZQXzD7zSaWvO/+hpeXB/vqXdcNlUYxe4jMqNyx31z+0LBemKjJMtQksjH83HERfPLkI9EguNKSXFUCy/wk+MV0yE9MTTNKDeKmVs6uqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AS8PR04MB8963.eurprd04.prod.outlook.com (2603:10a6:20b:42e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 07:45:56 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%2]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 07:45:56 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 0/2] ASoC: fsl_micfil: Set default quality and channel range control
Date: Wed, 26 Nov 2025 16:45:18 +0900
Message-ID: <20251126074520.2959154-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0187.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::21) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|AS8PR04MB8963:EE_
X-MS-Office365-Filtering-Correlation-Id: b16ff653-fc11-4731-6118-08de2cbfd536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p3KVr5bj/h7euW6jX/WAySfVJ/OA5uGFRazcF9kyDbnLFskvW2Ouwnxi+nMK?=
 =?us-ascii?Q?gFAphDamxzgFuXhDQX7uxLKfiryAhlFWmErr4100D7hGd3YmeglPqP8g1H+t?=
 =?us-ascii?Q?zGP+bTUK/wcI6R/QsbP55gEU1nPXArNkZqxYP9Al7MLIVjw6x/cZlZmJz2yO?=
 =?us-ascii?Q?/+2J5G42miPHJ6BlUks5h1982u+ZgbGQo9nlurF2YPyVDh4qhzCmd1DvMLli?=
 =?us-ascii?Q?eC7v0z6XSZpv/YQJtt+e/PrThpppjcb2CyclPBCsL0Q8/ajhbr3D50Tfu5+j?=
 =?us-ascii?Q?uvAVEk8hJgL3mjFOF7Uo7KagIkiNxiZlT0lEImbWnE+17LoT4Pnd+bz2D8Nc?=
 =?us-ascii?Q?5fIyilQidLJs06ck3naeh8gY4Q7F1S7JSIEAktLM18PVg5ytDHiy0WYpqogQ?=
 =?us-ascii?Q?+3jUGbH4x63Ac22tS71cRwKe5+p46iOzSOFqaI20DyYgfu+FYTbxF2X8AGu0?=
 =?us-ascii?Q?2dR54JB7T4E+qMSrYhA6dMtR7ep04wDEslSmoXWqjGcxu3xu4zC4fP3npkve?=
 =?us-ascii?Q?EPoQwfbyxuMwTMSptP4254MOFzRaPn3up2YEUXTQzbbOOk05fVj3+pVPQrZk?=
 =?us-ascii?Q?oK0QxY1b/tmbJ8mYCERz56ClRh1HTeVz/46skI/4j0GCkvTbFMWpjIeG8eEJ?=
 =?us-ascii?Q?WrrAvJVCvT5cCnMlQXnYeEyNFF9PvY6H6IEbgCKlcPJRVjbdjBD8FOZE7vmN?=
 =?us-ascii?Q?SX9+28CR0CSEvN7uWRaYfjZR/4jkL0vrHFI7Q3kP95TbL99ilYO4xfJAY/Qp?=
 =?us-ascii?Q?cLlQe7ucnI2yQm3ZccCwFTs5PuIm/lL9hK0gu35MRjMDj5k5I/Z+hN4YCtqm?=
 =?us-ascii?Q?nYGDqxQdhIvJ2RgnARaDlZbMAitjhq5MqtCLoKTDUqgJs60An+hhzzwc8fQj?=
 =?us-ascii?Q?5+GPsPCPz9Dj1t/wW32Yq65t4/PhCbEFKMsw/yrqFQnFan2cqAX35yf1zYcy?=
 =?us-ascii?Q?0gb4oit9FIHmuQgsko8XLPHFTrs76UA4yV7CQFafSjnfWlzWZ+Af8+EXA3Lq?=
 =?us-ascii?Q?gDBrIHA2f2X7LlAYqnHIWJXU9zZy7F8zbQ9YWpZySUJImq9/J5UZ0uQEKSEJ?=
 =?us-ascii?Q?SxYygfG3kWT6WYe+yKAHpYMFk2QqN/p6TuX68zjctAa5I5QmHoiuYa23AZwt?=
 =?us-ascii?Q?CCNJVwqb2ZpAGCmSu+ymENa+GJw06s1qxUc5I7D4/+CSVfNxztV95YztP09p?=
 =?us-ascii?Q?jXIQe8gOKMf1XzDPYpI5lXQ5X4EHQ6gpJiMilm/qprqQYXMoFWPL/SzL4Czo?=
 =?us-ascii?Q?uiJeMdyoIhacSrDMO2g6CPrDXXL5tbTGbZto24ERSA6lsrjTB4rWP4LKZqnh?=
 =?us-ascii?Q?u2ZfH8XnbG9Zy4GYH/2gxrlWVjPZh8vOUaJDdpKOEWKYci07iJ1pUj/N+OaZ?=
 =?us-ascii?Q?mQF2hFOCYyJ2NcjTwZBn3FiKpiLPy6isHb9eQ8sIT98U9UoEio/8Jjx6AQVb?=
 =?us-ascii?Q?1NmC28ECis71NfGm2bfnsAjFUhj9mPJ41pFpzwvs3ONVbEn5pjIcjB0G2FD2?=
 =?us-ascii?Q?ufmqyg5UgrhAAw32h2rKX9PftESwBEI0QL5YQ22exuRom+zHh0RXoY2WUQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ezkWGcJ2xoxnXUqg8jJiOBmEACS/jsxGhh1J5LXFDqV+G7HF22X++LHmoZD3?=
 =?us-ascii?Q?KVzn75IcfQkKrWKH7vvbaLPyjz5GC2Rb5o03XbPYgDZDYlJOal1obINV0UOC?=
 =?us-ascii?Q?AbTLYRcPwjjHzKqW9tHY+SL7GtptoBD/8dzRkoXrDmOTTaZa6Ix76HX6hJj+?=
 =?us-ascii?Q?8kCthste+J2M2w/8T2XS4HY3P0EJpOzK7higr36TOLsp4+aA8HHPrbxdBXTg?=
 =?us-ascii?Q?owInGKAd6Rg+bROzepu5Icm1z9vI7RMah7gqYRCy8SRaVAfS8LWq810wi8Xe?=
 =?us-ascii?Q?hCqG/264vZrH7q9NGf0sUDo8zyK0Fb+BSpcwflqMyTNFZGijOGWdY0DILVqV?=
 =?us-ascii?Q?ASQ2usTiAOMiqR80p0/23XMigi+h2B0eU1n9nl3KUOrXNZglYdjMFQEcXNA+?=
 =?us-ascii?Q?bRlmUAAV1u/wsKPjEfZ6i+Z5HAuhx/OKXD3pKZqUfVvwqt2t1TzNR1yzWyCL?=
 =?us-ascii?Q?jwz7EWRwB+6u4IHml5u9oaewSOoC/UlGxdT4VD9Gzd2thmipLpbNwhl7XKg3?=
 =?us-ascii?Q?auMzhsXfA73ga0rq9kg5jpZyEs4NhP414XSPg5EBHznrQko7Nvkf1fDHs0nC?=
 =?us-ascii?Q?Rc5twgD+GBBT4M3U/Uc0C+vNPQXBzlXd/YAiJis6pxN77w1UJG2lSaVyvjXm?=
 =?us-ascii?Q?R3VmD35yKb+udJ5FXaX2wMFDevQAvxWR+NViKaB7XpmVpWOvrr/ar+5IPSkf?=
 =?us-ascii?Q?3AabHtYJNeUsOiylPsfsPu7m7eOqXoCUC4CxAyjPjlF+n0jfP/3MBUwwklfx?=
 =?us-ascii?Q?6YUowkqAcFf89zfObMByEvH9eqtthuY+D2jgNwUrl9s6spAeDsw9rzBHuQf5?=
 =?us-ascii?Q?M2o1CMxUWYZwLVq+ZkW7JRcQKo75kMOKTFXVf8S2D72s5BIU6P5mbn+x2NHW?=
 =?us-ascii?Q?G7yBEdQSCrJhNh7DUIgrSqC1Yon6n03mbwilTWIFbHq2YuTEGAUQYRlcm9Io?=
 =?us-ascii?Q?iIGRhDJDuHH5avAZIwce+/mNjviN68yS1gJ5Cej35rM1U3HQsLF8obYA2tap?=
 =?us-ascii?Q?5GYppY/rIOvQMSYsQ809KxcBhADDwzfsHMwg6hjd2F/841ml2OR8btveKaEd?=
 =?us-ascii?Q?PCLIqBl2+QSI7Bd1r4YCU2NX7XDHA4pgZWUuQJL2Id36BNs3yjuDKv4jpuC/?=
 =?us-ascii?Q?5FP76NK+2LqEH5gGhn5akcmt4aHeTK3Et6mY0wRcQe0M06ZTCKQxavpN5DrL?=
 =?us-ascii?Q?U/NwFguHBb5XVQmH1bPNzV5y6rrdSf80M5A2oo8HvvB4z1bV1je8F+MqZTbg?=
 =?us-ascii?Q?Cst2xt3GrdnaKDaM638YEfNmqKKP/ZT50pxq2xhdnSVEyrPsLTDMBtrOypcG?=
 =?us-ascii?Q?GgMFP8cpn5uD9UvtCEWcPZ2/nPNNzM6s+lGJvsPKWtdjFo5aaBhxJ9WwclfZ?=
 =?us-ascii?Q?EAPf+XtfVCQHgoNXGZ5SZ2hYdUHFdGWta2I6Jt6meYsY0+qOLhBZwnaf5ARP?=
 =?us-ascii?Q?NFmBi4RLnjHjd7F+YL/zAXCBOto0avda9L01OaBM6PaT3cUXXivjILfAzFvY?=
 =?us-ascii?Q?D6MbnBOxppWry5K0TOhlKEKcyAtWhzoDenmnByM7L84uBiTaeraJDPhBGwfC?=
 =?us-ascii?Q?Fy0NW/502H3OFdrCsZ34W/WB5FuCKQ9Uv2gJ4Tsc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b16ff653-fc11-4731-6118-08de2cbfd536
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 07:45:56.4407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSs4u/oTZ6yeXWVgjZYd5H9u/CGJBRFLS7Wu0gRCptQF36CHfBE9EkoSMmwreGSQIEG00Ult1vGLKgSEO+C01A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8963
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add default quality for different platforms.
Set channel range control.

Chancel Liu (2):
  ASoC: fsl_micfil: Add default quality for different platforms
  ASoC: fsl_micfil: Set channel range control

 sound/soc/fsl/fsl_micfil.c | 132 ++++++++++++++++++++++++++++++-------
 1 file changed, 109 insertions(+), 23 deletions(-)

-- 
2.50.1


