Return-Path: <linuxppc-dev+bounces-6230-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1F2A3795F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 02:05:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yx4GP4j8Cz2xdn;
	Mon, 17 Feb 2025 12:05:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2607::62a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739754349;
	cv=pass; b=dYf1dxVtY+kRzEQXcOEQqSmmdsfqJNU2uXf5wExSjM6lYhcGbAr4KMQWoxcOo22DoY1ek3CtJhhwB6SxTWlzSia6hRtE/RF/qLUP7KndS3sV6smmKp9F+OHRk/pSbO/kv+DIYrDlqqJuQrc9CxhhvGKZMydPz5oyFfb2gb9zI37RF1R+0upwYjBshu08OAklKmkSPu/cko2UfubxjBYVKGXnsLaE9GUf4Nfc/lreZlFdh4kWow7P9SuEqCDLzWXFR8PbU4wsQFjbgr0uTz3A1j1sjRomKGkjTaIkpeVLumYvVMK8MhiQIMsQKrp0l0dkiLUiqiILObeVoBvobq9ngg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739754349; c=relaxed/relaxed;
	bh=X4frsu+/tPNrmYFYXyifCue68lAXIBQHV1W8/wlACxg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TIfmn2anl/88COWf0cX3dC9iKup6dLLY+E+Fc/Wp+oP4+2eEsNnD0vNLxBatCUhGJn923CTFg+Jp3pWTjYjo9rwYvhkbGUg4l2I+8HBrGeazDiN6jVmSnbRKctVJbkNalcHhX08ShMryGkiKLtOtKf4oe/2AIN2JbHkLPyWS3kydXT1kLDuAePlK5zSBYDGz8fY38y0vcWZ57XMccZ7nfehbK1F01fiATB7FueIxosZm7H5YpIDeBUljVvkqa8cOEhuOtCEDvKbl7LOb4ckvk+5zz2N+cJ1QF9s6xxItEkSXl3px+jNN3SWfu6YBqKUmHo13LxayJq6iXaZ3z6oscg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=BOEVpoNF; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2607::62a; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=BOEVpoNF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2607::62a; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2607::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yx4GN2gmsz2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 12:05:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPEc9/ShA7zOxc6WwI4rErt4HfNWjsbXVVQivhhhAQZxO8FyqwylcHaZiXqFEXmctdHBnAtk+vy0g1/ZXorBfOaIlUt4tRqZ7vJRx0696Tri2pm0Y20Wh6hgqytjMXbQTysoKamkdCIwY28kXUDncFIcjqB421UfMNM76VORJGZmVyXuI1aLeNhqkT2XgTNAEXgrFvd0p/hJAPxg7vZBA8iItMrVxp39oZdN/8c9g3mCvNIuqhcZVcZgYpbOjRxu/zJhHtlsbk+nmTSEkQgm4Gm2pRLr9UBrQ0uzgl42dfxjvq7WO78Shv/KBuoJBTo9JQBiKxhMp8BUlAUeADQx7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4frsu+/tPNrmYFYXyifCue68lAXIBQHV1W8/wlACxg=;
 b=vJ1SJBiGL5L5VXvvHXn0B81O+87qOkf9PCw4wRIpBzHgkZYEfXxUuQcJFSwCwQQSaxS6hEZg3r71ZRPtDp2ZvkBdUoH1BobrLbqjP7ZIPs2S5IX7ZgG/zKJnQS1q+AIyIaxqTW6p4dUKpyQklechQnbVUWdNxRoSd1tq/SlwCIf1nFJCmbsiNcmN43TJmAdJSjLinUhsVJh4SROUP0t3qP+uJvQtV0NoCfynbLJ7B6d0ee/m+ZyuII2OYSca+1MwhSJqki5AAzVbm25sSApP45AI+V6n/Dnu13vykHp/T/Gk3feE6fzKrr90qT/ZC/hrYvM1FcLDJWVQzssFpomnEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4frsu+/tPNrmYFYXyifCue68lAXIBQHV1W8/wlACxg=;
 b=BOEVpoNFcS+1c9QnfuGoMK+lGyBymwMonKuJ6wR86mUrAcB2dzqomknH2x9Ey15yxHhwpIUuep8QnMYHlfo6MV+dxzblNNvZZhys6SNd08Z/eFJLmvFu6t2K+12oVV6PKybNU/okm0GIN5xOpaau9qhadsAczfkviSH0p2kYNp1ZS2ZaWoEgTS1Tqt8gecMcFkPmpk6ywIyEJbTZSA+HhrH00W3jk/SD88zBClP987oM/fyrmrKIhVbLq21zAff9VrV2RO+pmC0zWe7XN3NA5Yz/dTllUhFwt/xBKmqWi60w4W5KysfFxdmaTmybT47IkibFsqv0mjaoSKqLY3D0KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by GVXPR04MB9925.eurprd04.prod.outlook.com (2603:10a6:150:112::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 01:05:27 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%4]) with mapi id 15.20.8445.016; Mon, 17 Feb 2025
 01:05:26 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v3] ASoC: fsl: Rename stream name of SAI DAI driver
Date: Mon, 17 Feb 2025 10:04:37 +0900
Message-ID: <20250217010437.258621-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
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
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|GVXPR04MB9925:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ac3e53-2f04-4718-dc41-08dd4eef2a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|52116014|1800799024|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WkfB9HQmO968OlM5+wKFLeaDhnApHUvPWpBB7q8gYWFqMTIunPhEBbtYuoTk?=
 =?us-ascii?Q?5zS8wj9XTgpolCtpZkMs4x76c4jzCVvXTk8Lb/5JC1LeQdLcMkgJY1S7wQQi?=
 =?us-ascii?Q?jKFMB/p8wTBzpfNZqZX4LoiB9jxrwhw1qByX3mInkEkREtsDOxAVsKTgFxbW?=
 =?us-ascii?Q?8GHnNa0u77TunzPOVm2b2Ix4fNapAsWhWH1WxFIcHY2yZHVqdSkfV3qz+d47?=
 =?us-ascii?Q?4syhwNvYuGzTWNzsN0ST8XTR9uekI3U6vOpBlFm6mvNfeTbzu05CU3acJ7FT?=
 =?us-ascii?Q?SuejYkt6vSOWUGpOc6l/K/nGrTahAMc1f71jN6J+yuRB24+Sd2taQftlmOg8?=
 =?us-ascii?Q?QpZE2nb0aTDK0DB2hl+ZdDAUqmMyuPzVtsv5SUAgjoF8AP77ChJYGm6pBB3w?=
 =?us-ascii?Q?HJ1gyZubxFmbrqcP/ozcwtHlDqZr7TvniYKOfmBSMcmdCPjxuAEv08baAOHa?=
 =?us-ascii?Q?3io3baY+bf0FWtVSD+aA1UgmWTbQmb8krNk08Xka+Bd1P9gDOR2FkGShSl/w?=
 =?us-ascii?Q?1SsElrKrvtk+FmZ5/VzUW14gy8hhN3Az5Wz8Iocz+CMpqrLaWB0I5FitIN9U?=
 =?us-ascii?Q?pu1lJJsBdTtWcK3rOq3afklOeevVHzWVwH1TIEjj4/RUBCg0Mw+jEPl5FFSP?=
 =?us-ascii?Q?iIvPw0/2pnET3es7jfLOqEsvfrPcSZhqOknUR7mkG20qcXLJwv35KTuOxu3h?=
 =?us-ascii?Q?esVWPIqg/HRqoFefCOY/bXCKOFVJ9baoMztWhg7lRIM5s/4MUCph6PchBKML?=
 =?us-ascii?Q?QaIeDjph1BbKzgv9VUqHSGZE2eeUkUJnwQanl9Z6rNFOKqO8z4ykW0h2yn6R?=
 =?us-ascii?Q?ikHuP0Z+bn3pvv/GhQLJ7JIqMQfL6zB33o9HGoZxekPeiDnmlaR4MYTQH3lP?=
 =?us-ascii?Q?2NxrVVtYdeep9jqpVeG5nvXROYTkI+G7MWUp2vEajOVdvKtr1aQ4Sx9KBRgF?=
 =?us-ascii?Q?hR1BS3f3gKLE3cugh6W3KHCqzsLsVTphOz0jCK/l6CNiCnM8Lwy8tdhwLSK1?=
 =?us-ascii?Q?yGinIGkyR2gwEsi5Z/yRsBqGKTcCxKv6M1x3VHogUng+Lky9XGn3FE4d14nD?=
 =?us-ascii?Q?kmK3dvfl2WBEfm54BEcSTvQZfuk4lA7fOI1rgXwz+QJEg+r1pco/83elJqcD?=
 =?us-ascii?Q?+9HyUDvhXuXs6/LbPURDtF+M4ji0TMlAGqdTY1dFqJ/k064L/8f9tyDkelFt?=
 =?us-ascii?Q?q6ZJLZUPjeKdcLDxwzPZOmMPSr4ueZBa543WymnXTUNZKNyWLzNvmP0Pf1vu?=
 =?us-ascii?Q?jyn8qo3iGhGTawY1wSzyczhzcfXkeKQD8t2qLwQzrHC8iqWLOm841ESQl4CC?=
 =?us-ascii?Q?RXKmxkKmeRlS0EAaxLut0eg00/W7G/e4ucKMly4mXmXylhJNS7on/X8C03N4?=
 =?us-ascii?Q?y/3n/pLCI6X8FFjELkRUZF5TfglXpVv9xKzjn4wdlIh2v6DeziaC73E7d6gu?=
 =?us-ascii?Q?c8Y+nN6/f6V23KFzMdr1jOizhdVGJik7ftnO8VPFkQXmLdAVZw671A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(1800799024)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XynllqDehdvxhJ6Hj8GuVoLxKN1bl+7vTk3pq2aXNiLsgVThKtKl6oQsZjZ5?=
 =?us-ascii?Q?S5NA2QoMly/XqgBjiu0+js6K5396Hidkt+n8V94w5Bd+oU9j6MqNKWwueDd1?=
 =?us-ascii?Q?FFLVbsGT4MP6QeR9x6ghnkpYvqsDQA7qLHcy84b6wgcG1tOFOVOKVQhvEekU?=
 =?us-ascii?Q?psq073TLkAtMXk3k/NTZ6rxIsoXkbipMZhGAsXjGvC+TYiUR3Vn6AFy0+R4J?=
 =?us-ascii?Q?zWO1NKnEkcYzDe6kGNxUrjz4pd5BoMHSxzApvZ/CMDR2sLw3fm0vGHeWrlSo?=
 =?us-ascii?Q?I9U8WeHPYJfTJ2tO+V5nqBKYPOTy6oEPFCmy5LGRTa7j6XQ6ApTNvro/Igq4?=
 =?us-ascii?Q?kcYmix7oI/wpFPOUnnS7N7fyXEerfXKw8mUiZQY2S3RYCON4QiHC4MG4dQRI?=
 =?us-ascii?Q?Jwbnk/SItxjehz1cCEsS3yQgWfQO5oO/zjv3zctJDYxKRdHP6v6xKXkjBdJw?=
 =?us-ascii?Q?MDiVp69VfvvpL8q3EeXSsjXITTpD1+sSKnY6YB+7BTQwLaEgjP8ufUg9HJur?=
 =?us-ascii?Q?LuoIlax18J5KzhGXAWyewdSqwPel+WtFUpEXw+GJ1miwXvvUwdE8A3SAEwG0?=
 =?us-ascii?Q?Rdy/ZEa3cW6UaO9A32sCIsfXzAL4rZC3KCkKmYICJgXORhBfEBNcSPBVez4l?=
 =?us-ascii?Q?uV//JzucPFwtQ+yg4ywD5hOdJ3mClf3j7lSFeyivpj9WNx3GkhOoZrYeRQv5?=
 =?us-ascii?Q?Py24acKTDfuk9EurzqKlBUOxLeGbMsNKN5NEiMtSf/Hbn6PTnstd8zd74b3+?=
 =?us-ascii?Q?li11+paTTQRdXn4VdV8a4jPtr8MIx9UrYWisOGh3p8lpvspfJEdjRcXEH9wy?=
 =?us-ascii?Q?Ne4fRXb+tIy0eZswHtYpb+57luaoiR61Bt2ohDQBp4LRisWs10CIxIi40Nq1?=
 =?us-ascii?Q?ILyQwgObhRqDAisiYl082jhvnhJJHe/NofehQFJsfz4OPes85us5/2qLRCfz?=
 =?us-ascii?Q?fnxcfxJj9AXvHnIERgCpo8OwRno4E1MLKL0z3lCs6+mo2TgZYPP7GFIjeO3Z?=
 =?us-ascii?Q?Nvioeii6PPmM5wsXNPrYycwfCDtrxSEyuR18opRZcdCa+aAX/E7YagYWJYxX?=
 =?us-ascii?Q?m9JFLg3LTbgHj70vkkDhnUP+tghWTt/+UHXxQxlP4L3qlGMN8z6vWO8Fh0hE?=
 =?us-ascii?Q?mlbNKbZBYnH/WZEod8e3yUgurC87GDgrSdpsxCYDSnLbOIk9v5hVyAEONX91?=
 =?us-ascii?Q?nZ3KbeRm2vq6JsxqpILmHJwJFKwABQASbsfCyBOKxrgIy0cgHSJCXgW/190N?=
 =?us-ascii?Q?ARZLAsVd8PTYlshQ5tBm5QeuiyVg/W3ogBydyzdwe0tfKUhc9FwX2p/T3jAU?=
 =?us-ascii?Q?6gyBjRBD6dHOfw07UXIMGr/qQ9rF6kmCMnidvmonsWJchj0PUX2OUwizEIIX?=
 =?us-ascii?Q?H3OzIHFoik79Q4+33nIqezwshABfpIfoLXDQoKEHXgwK7ZKFF19zTABUShma?=
 =?us-ascii?Q?BoMjOFRfQuP9pcyKifzkBawjq9LUmZC7NHXYZczUuyDMPW0FHMuBWepZiAK2?=
 =?us-ascii?Q?BDrTIAptlFdAfozii6uud/k2AMsuGWasb22you4Coupjtj2JViVvVcKYIStl?=
 =?us-ascii?Q?m/Uao3y6gU7IeIAcu2sZN2nr+qtpR9c8lotZlHMP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ac3e53-2f04-4718-dc41-08dd4eef2a16
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 01:05:26.8875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 17jFU6mQfUxBMuU5LI8uLyGAoeiBws4ekasVS3bOQRYgsFfwmAbbBGMyZZJHibcmsGG0TbGxjlwacMgj6/h9Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9925
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

If stream names of DAI driver are duplicated there'll be warnings when
machine driver tries to add widgets on a route:

[    8.831335] fsl-asoc-card sound-wm8960: ASoC: sink widget CPU-Playback overwritten
[    8.839917] fsl-asoc-card sound-wm8960: ASoC: source widget CPU-Capture overwritten

Use different stream names to avoid such warnings.
DAI names in AUDMIX are also updated accordingly.

Fixes: 15c958390460 ("ASoC: fsl_sai: Add separate DAI for transmitter and receiver")
Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
- changes in v3
Squash two fix patches in one commit

 sound/soc/fsl/fsl_sai.c    | 6 +++---
 sound/soc/fsl/imx-audmix.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index c4eb87c5d39e..9f33dd11d47f 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -994,10 +994,10 @@ static struct snd_soc_dai_driver fsl_sai_dai_template[] = {
 	{
 		.name = "sai-tx",
 		.playback = {
-			.stream_name = "CPU-Playback",
+			.stream_name = "SAI-Playback",
 			.channels_min = 1,
 			.channels_max = 32,
-				.rate_min = 8000,
+			.rate_min = 8000,
 			.rate_max = 2822400,
 			.rates = SNDRV_PCM_RATE_KNOT,
 			.formats = FSL_SAI_FORMATS,
@@ -1007,7 +1007,7 @@ static struct snd_soc_dai_driver fsl_sai_dai_template[] = {
 	{
 		.name = "sai-rx",
 		.capture = {
-			.stream_name = "CPU-Capture",
+			.stream_name = "SAI-Capture",
 			.channels_min = 1,
 			.channels_max = 32,
 			.rate_min = 8000,
diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 50ecc5f51100..dac5d4ddacd6 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -119,8 +119,8 @@ static const struct snd_soc_ops imx_audmix_be_ops = {
 static const char *name[][3] = {
 	{"HiFi-AUDMIX-FE-0", "HiFi-AUDMIX-FE-1", "HiFi-AUDMIX-FE-2"},
 	{"sai-tx", "sai-tx", "sai-rx"},
-	{"AUDMIX-Playback-0", "AUDMIX-Playback-1", "CPU-Capture"},
-	{"CPU-Playback", "CPU-Playback", "AUDMIX-Capture-0"},
+	{"AUDMIX-Playback-0", "AUDMIX-Playback-1", "SAI-Capture"},
+	{"SAI-Playback", "SAI-Playback", "AUDMIX-Capture-0"},
 };

 static int imx_audmix_probe(struct platform_device *pdev)
--
2.47.1


