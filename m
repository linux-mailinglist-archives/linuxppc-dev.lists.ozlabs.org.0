Return-Path: <linuxppc-dev+bounces-3770-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 225CA9E3322
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 06:35:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y35nN2G4Dz30VF;
	Wed,  4 Dec 2024 16:34:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::626" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733290488;
	cv=pass; b=oM+5d5hjoRPqpDCWqraOTDc5xTepvlcaLNq+F5FHDzWbWCGrbR0HAhppkUUYdBzIAtMF+jDf8SNRsN89rBQjnao9CN/K84MKqthR04fnKyuqs7GbQHjDK/GmZ41y/BgpK0dW6q4yP8jqeNfweJ1LEw8PAqQ37O7lR5oFQMGwK5rXAyUXcQFHvTu2Ca1dHCWtaf77sUaHtZiCsad0v1dyhQ3P1aSHpwhZNewamJusgF4YK7LHOpVI85gPttxq3Rh7BMMIhViFd83bKRxBjz/I0z8AtFu3ntN3o3qQav7DD2i2GerSn3zGlF7ehLMRds6gJzOsmRBVPIbwfMOqCZpAog==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733290488; c=relaxed/relaxed;
	bh=bGPb+mdKrZt2tU75PNwV+UeH06NumTCOB8hjqlF8OMA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BbhqHLuv8LsF9404bJ8KokspiXS7P8NNYgGwJBGHxeWoipWRlmGnvtEM2vPf5MNBFI8Z3s0dvteeq94/zPYA9JMVlvE65ynJAiWq7gSbJyNo7iStEz7XG4ZpX1xraP5G9ouV79i2K6lnE3+we5zPb2jATXOohgPzXuOVP7LOSrqdSPfGrCym6DfR6ZE0ucbMXNq47Y4qs0tHZqm6iFrqE49fadH8tKoHKUgCT6zUPL+Rj4d2oCX1h+atVr1kDkicLZlR1Pzz5aYZ9H4vgPM500zFpnceKZVAGgi7a9nks5GW2qXWsKoMV4lVlrfGPl3d0iJqqf3KN6ZaXvIA7QyQwA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=fZ8itot6; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::626; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=fZ8itot6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::626; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20626.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::626])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y35nM3Nfgz30Vf
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 16:34:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYB+FU8HaG02o15KgIgEnbeCUsD776mu1aLM3yKVkoUR4IaL8QBhqrOLDUs33Uz/BHxhMxTuPNch5YlxAeFyEUgfQTTbgIKNDXBOYvVkV+0Z4S3OfvZX4yFZ75TZODH502/DGcc6zA1szb+4isEMlW7ua9pW93CbawaG3jwnpWnHYIhMJuh5PTRzkSWrT3qUHAPPrg8dVfpFJrAVLwGNE1MgXRP88oGpRwBbjq2WgZFDQXeNwf/v/ECG93qlY4JGGf9lvcuXblKOlaJFRBYxsBuYQxFubpy8VpbqAt4fURpXyGVMmr9eqX47TWAnev9eKWpmKCnoZQLruBJXbHzvkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGPb+mdKrZt2tU75PNwV+UeH06NumTCOB8hjqlF8OMA=;
 b=oZutFak5YixoNqq1dOOqXVZ5HtcFJcpcZox6AyY7NtsLdD3+u86Xv0q8rF98+ki9eb/YG7GnOMoA+D5OWfzCSlThzAk7kdQOqSUX91SmfHrRwUiswdiyYyrXlJc2X/p6jXmaATsZelv4yTkCpIYICQVppX2Rt+BKSfTfZcnCZMiJFZkZO6/xNt5tqJ2sWMLsH1QM/YqHlXCrkKUxym5NoWt4iXSqrY0ZHz25oy6wn7mZmowepiIxbEEAyj7QN1Mnlcd0sanUQBxetPj3JMFQhOXXWMRi5YnJey8yQhND/9S2nOJ/TqQ6lCg/+ovkufatVVCGtkCIj0s8HUu24giikQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGPb+mdKrZt2tU75PNwV+UeH06NumTCOB8hjqlF8OMA=;
 b=fZ8itot6nJzs+a3kHAxX9KFxRuGkBgpmF1pUTxKwgrYRCbhQI1kLWw+xVCS3nX/9m/H4DvgGVLkJjaaMRdMBt3X3yyB5a25utht1Lo2J9wYe/aEelMkdn4p/+Oy0K/yv34j2WyBp89eL/vGJT2MQH4IB39GrIseD7FfY6aWoQf+IBB8wiuPQJyzqnWIUo3/0WtaG/qWvcageSTm/S52OpVGURsOA/6rtMkaf4t4hUSR1zrwyvcz2sL5sN8YostVxcJicPrYd1vR/I5b85019brJjofP4lDMam/8PkaShlYDnWDzj0I3j0v4YuNH/yzEghLTEyiyxKYbHDnRGwEGrJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV1PR04MB10125.eurprd04.prod.outlook.com (2603:10a6:150:1ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 05:34:34 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8230.008; Wed, 4 Dec 2024
 05:34:34 +0000
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
Subject: [PATCH v5 RESEND 4/6] ASoC: fsl_asrc_m2m: Add memory to memory function
Date: Wed,  4 Dec 2024 13:33:44 +0800
Message-Id: <20241204053346.1865723-5-shengjiu.wang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 322f0b01-8ae1-4514-cc9c-08dd142555d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vaoMCOvCII7HKJduf5tWNObkMJAPqBAOnWVTgkDl9j4sYavofXIAxkdy5nTh?=
 =?us-ascii?Q?3YF6y4ykxAPh+LE/StZD/HHyd9b+xh7PjI8SCOU+RIghA7VDCANUMvvb2qUs?=
 =?us-ascii?Q?4NA4PGDdLaZbpoKRp/RInLCpnCDE35otnnBk3c7BZZObIis8aWTnSZXhXzZO?=
 =?us-ascii?Q?jxL1EZUNwAiYQku0+ly7DLG2fbaU5K92kYrCEK/YCSEDPrDM90DF4pk3rn/L?=
 =?us-ascii?Q?5CT0bqTM2/grrmmCk6JXrjRpQieoWsi55rf2AkYHHp9CrksSgp2qHb25lvym?=
 =?us-ascii?Q?riTd605e4EAdrCVkZtV//BWqvBfosiA/djHMsBSgSszFLSfOub9r4SRBWfC+?=
 =?us-ascii?Q?p2VKssDZ6/JvF3uhfDK/DZVH36JEofVzy7lyeXBnV0XT3yuC65UD8LO5NaO8?=
 =?us-ascii?Q?v+sKQcMcIQaYJrXrIGpRiWzqBW6nZunzsks8gyiIOkPMVIWEYkXH3QxUQc7W?=
 =?us-ascii?Q?Vyqczmhu1E0xmq78F3BGz+LBwVG+mvAi3KA9nhuwdTL1RggTPNavpQJzy8tr?=
 =?us-ascii?Q?6Htr3xITHg4s5nqZPUpoix3oFwLBV2mFw1tSNbI7MPA4uYgjTrRg6Ua+oH/8?=
 =?us-ascii?Q?MCpLE1GPvyp/V7yTYylLUJ24XkUkS1J+xyF+A5E8Fl/Mcnq7vYHmhIF1h5YV?=
 =?us-ascii?Q?PFFF7e8+a0E666Z6dPQipYhJG5EiCZNXXlbO/NOPyLlM/p/cVokH+JLt4O9d?=
 =?us-ascii?Q?CkW8a+0PhWfj6R0YDthGwUcCArt6D19POWAWuyksQ0CvQuMLxAxEx3/JTwj5?=
 =?us-ascii?Q?Z/FM+aGCSFsf3Rw8LMO59IrUSF9N7kUsr6DS9dhJXOjOh3rroKpCWXVusKkF?=
 =?us-ascii?Q?/wMPkHtKuUFTcA8hRqHj6Qa1cvLpSQJKKckSrm5q7PQGukBFUpkoricNlNIo?=
 =?us-ascii?Q?osILsCT0FUWdFfSQ75pzuXfEs2n0EYKjnCeeSRYDO1V40di+XNiMXct8xHxA?=
 =?us-ascii?Q?/MRjMQ3jcC0vNj016c+CMAk02MDYuGnQWwIolj17C/f4jq2E08r8DZV9AxJv?=
 =?us-ascii?Q?NTAj/wQQrKgtw1h5RZ+KF9lJzvivrg06+rMdo1gs7lG3mcLv5GDgs10iBJeI?=
 =?us-ascii?Q?6AOjmiJ4QkigwFAu62RrLKBpnq/Ua275V9NesJsQIrXOUv9NZ5HCDNFILUE+?=
 =?us-ascii?Q?jp6jO1vb9ERA6HPbIPNXCb4HVMBJJ94J5kNIR41mVflWKkGFE7LuYdjFxTD7?=
 =?us-ascii?Q?G0LO6GZ3Vn7sT1DXBiX1k0c1YAvPHDvALKvhhU1H9eykJMHXm3jUOPkD6tvk?=
 =?us-ascii?Q?V2nvlqE3K06AF1ZN4B5tc3CSdr+/uu3YpiFDTrTgNEPblgEAGA0UHITVVpo2?=
 =?us-ascii?Q?icZGNECmnTlmax3WB6uXY62aibiPpGBE3Poj9Tn8LvVwyx8Rxv1Xx0Uy3Xx1?=
 =?us-ascii?Q?/HE6jxrHv9dxg6xdlDq67lw+9ajsht1JoByKNjf4acB/5/i4/TbYLT4yQ04v?=
 =?us-ascii?Q?KZUQ0HFSCuI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jdvl/3KBfKBxG9Lqb6wxedylTXHnVSoMVLoMi6ypyOiZj0VKtOX0ZwYV8+jl?=
 =?us-ascii?Q?x+tkE8AlKfMGZPPtpRkN02TLG2EaFqG2qqPfpxKEj8uV4UxHJyu9mT4t9O/8?=
 =?us-ascii?Q?8BK0hihHvUE/zCa/cc/go3EvQHNpe916x4qBx5GGaLEVs15KfiCSRQaIA3qF?=
 =?us-ascii?Q?sVwYRby2Vvae8NcJ2eQbU46TCtlnYmg89OhlQ4icpNKwur6uWQcF5XtMOZZi?=
 =?us-ascii?Q?EDlkI0RBDm3QRRe+Mca5cmXwB6649XKZHLNmrLj60lzu8WDgAtTQUkr05GMG?=
 =?us-ascii?Q?GJ/YccI8nKC+9nxteUI1eXuSE77hCRT0goF8f6bujq6595l5qNOAVGfpsPtV?=
 =?us-ascii?Q?19OQCGyvhYZ1TKqEhMYzr0DL4gi4oUIWv2114W/KicsjRTmn6m+Ogxkfudsl?=
 =?us-ascii?Q?mgX+wdiHvWUX+jFy2Ex8qz+MVl8q2hRUQqRHJWjQCpX/yIkuUvJ98hq55nSR?=
 =?us-ascii?Q?qD1o7MHFJ0dqw7T1dXmjIORzTOodNeljaRaZ/POD1lJw0Vs0Q2poTlQ2rFwi?=
 =?us-ascii?Q?txkSSNK5LDNn4acqXEHgv972gbrTcr0xTbetPI1QPkGUafJgE+N1brNDv1QE?=
 =?us-ascii?Q?Zsemr2VkCMmjOk4cV/XP3nkqqtrGy/eSpuUDQKr6T7C1wRgKnyD4OxZ9Hcrj?=
 =?us-ascii?Q?MbhnclZuHQbWAh7tjpeA2ukDGIJFkcAIi6um6gZ6+VMsqmPOWRq/ECsH9FKL?=
 =?us-ascii?Q?iuKZON55/9VY4CXm1EKs8zCNYtN9QKJrDmEpBsMFbjh9dI9dbHm1ucgaPazz?=
 =?us-ascii?Q?uHUBpL8u/yRkKdjQNhWC4kUunBvThGPAmrohjyG/wAAKcVQL2IUGh8mpRMkB?=
 =?us-ascii?Q?bdEdDor6lXfWzUk4X8W0//J9B3QgnYEWNzp63uqPZ4wcoghzcMUd/0JIbABt?=
 =?us-ascii?Q?twMAjq4puT5pCec2RUi25/A1JXTckA1nz95xbJBCTOT+bcThy4iGYYgdFajE?=
 =?us-ascii?Q?jf+Rm237JVcKizXl06Ah4JNE905ZBQjV2eISMznJSyFgYtvnZuMxWVvJHt1d?=
 =?us-ascii?Q?tf3xGbTrkp5+Z7M8EnB38tL0mUYVyYVzyiT3HojXFRfTty98tiABhVwuaHPl?=
 =?us-ascii?Q?Keyu4m2aAvUd7v+f/B4o865Jr7eXR9eCKTz9nI6RLxm40LZ8Z9742bZPX3w6?=
 =?us-ascii?Q?51Imc4nat7fIsBw35T8q0xg73MSq2i91b3MM+ZGz9XaYX11yCoVPmS2SZ/+2?=
 =?us-ascii?Q?qIl1adKxe9oPaxCeLZO600eb7Ko7BnvDcZByMlOLfy1nyVUcONmEl3iIM7bd?=
 =?us-ascii?Q?Cl49xUgkbOogKcIjx6/QdGYAlqZBqOq5I4lmiz+KSjZoc3Z034bQSvysBryl?=
 =?us-ascii?Q?/G472HaARWHWHCCsI1hzCzOQCzd4pEusYp/ecM91I1d9DLxYQxOYx1XNMPgM?=
 =?us-ascii?Q?tOtxKpr7wM2OjyYlhBzF6O37WjDPpo6W4j6WwfbD2NevJRg2ffATB8+98Ekh?=
 =?us-ascii?Q?aL5JnOaDzrpVFq9X0wtwZpZGiITqzdaSjKC1kw6vZ5JNgU+ukYoJk7BWZeSL?=
 =?us-ascii?Q?lS4wK8HnAxp28pauRkdCw94vJnao8+wccmdDEj20rU5A9delAsc0k6v7ZLRK?=
 =?us-ascii?Q?qx2N0dBNEbeGkYzcEefRFvH3w4QjyQKk6jPKiUf+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 322f0b01-8ae1-4514-cc9c-08dd142555d7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 05:34:34.5918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hj/77Q7Gx7ZtRGDOC0V1mAZuFv4qHzOpusNpiVkXTSk5p5kjEDTIdW/lNNPnsG4lLB4cLrQKlRCA5WDH6d6g+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10125
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Implement the ASRC memory to memory function using
the compress framework, user can use this function with
compress ioctl interface.

This feature can be shared by ASRC and EASRC drivers

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/fsl/Kconfig           |   1 +
 sound/soc/fsl/Makefile          |   2 +-
 sound/soc/fsl/fsl_asrc_common.h |   9 +
 sound/soc/fsl/fsl_asrc_m2m.c    | 727 ++++++++++++++++++++++++++++++++
 4 files changed, 738 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/fsl/fsl_asrc_m2m.c

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 8e88830e8e57..698afae46918 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -8,6 +8,7 @@ config SND_SOC_FSL_ASRC
 	depends on HAS_DMA
 	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
+	select SND_COMPRESS_ACCEL
 	help
 	  Say Y if you want to add Asynchronous Sample Rate Converter (ASRC)
 	  support for the Freescale CPUs.
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index ad97244b5cc3..d656a9ab54e3 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -10,7 +10,7 @@ obj-$(CONFIG_SND_SOC_P1022_RDK) += snd-soc-p1022-rdk.o
 # Freescale SSI/DMA/SAI/SPDIF Support
 snd-soc-fsl-audmix-y := fsl_audmix.o
 snd-soc-fsl-asoc-card-y := fsl-asoc-card.o
-snd-soc-fsl-asrc-y := fsl_asrc.o fsl_asrc_dma.o
+snd-soc-fsl-asrc-y := fsl_asrc.o fsl_asrc_dma.o fsl_asrc_m2m.o
 snd-soc-fsl-lpc3xxx-y := lpc3xxx-pcm.o lpc3xxx-i2s.o
 snd-soc-fsl-sai-y := fsl_sai.o
 snd-soc-fsl-ssi-y := fsl_ssi.o
diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
index 3bdd6ea07c09..0cd595b0f629 100644
--- a/sound/soc/fsl/fsl_asrc_common.h
+++ b/sound/soc/fsl/fsl_asrc_common.h
@@ -60,6 +60,7 @@ struct fsl_asrc_m2m_cap {
  * @buf_len: buffer length of m2m
  * @dma_buffer: buffer pointers
  * @first_convert: start of conversion
+ * @ratio_mod_flag: flag for new ratio modifier
  * @ratio_mod: ratio modification
  */
 struct fsl_asrc_pair {
@@ -84,6 +85,7 @@ struct fsl_asrc_pair {
 	unsigned int buf_len[2];
 	struct snd_dma_buffer dma_buffer[2];
 	unsigned int first_convert;
+	bool ratio_mod_flag;
 	unsigned int ratio_mod;
 };
 
@@ -98,6 +100,7 @@ struct fsl_asrc_pair {
  * @mem_clk: clock source to access register
  * @ipg_clk: clock source to drive peripheral
  * @spba_clk: SPBA clock (optional, depending on SoC design)
+ * @card: compress sound card
  * @lock: spin lock for resource protection
  * @pair: pair pointers
  * @channel_avail: non-occupied channel numbers
@@ -131,6 +134,7 @@ struct fsl_asrc {
 	struct clk *mem_clk;
 	struct clk *ipg_clk;
 	struct clk *spba_clk;
+	struct snd_card *card;
 	spinlock_t lock;      /* spin lock for resource protection */
 
 	struct fsl_asrc_pair *pair[PAIR_CTX_NUM];
@@ -166,4 +170,9 @@ struct fsl_asrc {
 #define DRV_NAME "fsl-asrc-dai"
 extern struct snd_soc_component_driver fsl_asrc_component;
 
+int fsl_asrc_m2m_init(struct fsl_asrc *asrc);
+void fsl_asrc_m2m_exit(struct fsl_asrc *asrc);
+int fsl_asrc_m2m_resume(struct fsl_asrc *asrc);
+int fsl_asrc_m2m_suspend(struct fsl_asrc *asrc);
+
 #endif /* _FSL_ASRC_COMMON_H */
diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
new file mode 100644
index 000000000000..693ec0a477a4
--- /dev/null
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -0,0 +1,727 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2014-2016 Freescale Semiconductor, Inc.
+// Copyright (C) 2019-2024 NXP
+//
+// Freescale ASRC Memory to Memory (M2M) driver
+
+#include <linux/dma/imx-dma.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-mapping.h>
+#include <linux/pm_runtime.h>
+#include <sound/asound.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/initval.h>
+
+#include "fsl_asrc_common.h"
+
+#define DIR_STR(dir) (dir) == IN ? "in" : "out"
+
+#define ASRC_xPUT_DMA_CALLBACK(dir) \
+	(((dir) == IN) ? asrc_input_dma_callback \
+	: asrc_output_dma_callback)
+
+/* Maximum output and capture buffer size */
+#define ASRC_M2M_BUFFER_SIZE (512 * 1024)
+
+/* Maximum output and capture period size */
+#define ASRC_M2M_PERIOD_SIZE (48 * 1024)
+
+/* dma complete callback */
+static void asrc_input_dma_callback(void *data)
+{
+	struct fsl_asrc_pair *pair = (struct fsl_asrc_pair *)data;
+
+	complete(&pair->complete[IN]);
+}
+
+/* dma complete callback */
+static void asrc_output_dma_callback(void *data)
+{
+	struct fsl_asrc_pair *pair = (struct fsl_asrc_pair *)data;
+
+	complete(&pair->complete[OUT]);
+}
+
+/**
+ *asrc_read_last_fifo: read all the remaining data from FIFO
+ *@pair: Structure pointer of fsl_asrc_pair
+ *@dma_vaddr: virtual address of capture buffer
+ *@length: payload length of capture buffer
+ */
+static void asrc_read_last_fifo(struct fsl_asrc_pair *pair, void *dma_vaddr, u32 *length)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	enum asrc_pair_index index = pair->index;
+	u32 i, reg, size, t_size = 0, width;
+	u32 *reg32 = NULL;
+	u16 *reg16 = NULL;
+	u8  *reg24 = NULL;
+
+	width = snd_pcm_format_physical_width(pair->sample_format[OUT]);
+	if (width == 32)
+		reg32 = dma_vaddr + *length;
+	else if (width == 16)
+		reg16 = dma_vaddr + *length;
+	else
+		reg24 = dma_vaddr + *length;
+retry:
+	size = asrc->get_output_fifo_size(pair);
+	if (size + *length > ASRC_M2M_BUFFER_SIZE)
+		goto end;
+
+	for (i = 0; i < size * pair->channels; i++) {
+		regmap_read(asrc->regmap, asrc->get_fifo_addr(OUT, index), &reg);
+		if (reg32) {
+			*reg32++ = reg;
+		} else if (reg16) {
+			*reg16++ = (u16)reg;
+		} else {
+			*reg24++ = (u8)reg;
+			*reg24++ = (u8)(reg >> 8);
+			*reg24++ = (u8)(reg >> 16);
+		}
+	}
+	t_size += size;
+
+	/* In case there is data left in FIFO */
+	if (size)
+		goto retry;
+end:
+	/* Update payload length */
+	if (reg32)
+		*length += t_size * pair->channels * 4;
+	else if (reg16)
+		*length += t_size * pair->channels * 2;
+	else
+		*length += t_size * pair->channels * 3;
+}
+
+/* config dma channel */
+static int asrc_dmaconfig(struct fsl_asrc_pair *pair,
+			  struct dma_chan *chan,
+			  u32 dma_addr, dma_addr_t buf_addr, u32 buf_len,
+			  int dir, int width)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &asrc->pdev->dev;
+	struct dma_slave_config slave_config;
+	enum dma_slave_buswidth buswidth;
+	unsigned int sg_len, max_period_size;
+	struct scatterlist *sg;
+	int ret, i;
+
+	switch (width) {
+	case 8:
+		buswidth = DMA_SLAVE_BUSWIDTH_1_BYTE;
+		break;
+	case 16:
+		buswidth = DMA_SLAVE_BUSWIDTH_2_BYTES;
+		break;
+	case 24:
+		buswidth = DMA_SLAVE_BUSWIDTH_3_BYTES;
+		break;
+	case 32:
+		buswidth = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		break;
+	default:
+		dev_err(dev, "invalid word width\n");
+		return -EINVAL;
+	}
+
+	memset(&slave_config, 0, sizeof(slave_config));
+	if (dir == IN) {
+		slave_config.direction = DMA_MEM_TO_DEV;
+		slave_config.dst_addr = dma_addr;
+		slave_config.dst_addr_width = buswidth;
+		slave_config.dst_maxburst = asrc->m2m_get_maxburst(IN, pair);
+	} else {
+		slave_config.direction = DMA_DEV_TO_MEM;
+		slave_config.src_addr = dma_addr;
+		slave_config.src_addr_width = buswidth;
+		slave_config.src_maxburst = asrc->m2m_get_maxburst(OUT, pair);
+	}
+
+	ret = dmaengine_slave_config(chan, &slave_config);
+	if (ret) {
+		dev_err(dev, "failed to config dmaengine for %s task: %d\n",
+			DIR_STR(dir), ret);
+		return -EINVAL;
+	}
+
+	max_period_size = rounddown(ASRC_M2M_PERIOD_SIZE, width * pair->channels / 8);
+	/* scatter gather mode */
+	sg_len = buf_len / max_period_size;
+	if (buf_len % max_period_size)
+		sg_len += 1;
+
+	sg = kmalloc_array(sg_len, sizeof(*sg), GFP_KERNEL);
+	if (!sg)
+		return -ENOMEM;
+
+	sg_init_table(sg, sg_len);
+	for (i = 0; i < (sg_len - 1); i++) {
+		sg_dma_address(&sg[i]) = buf_addr + i * max_period_size;
+		sg_dma_len(&sg[i]) = max_period_size;
+	}
+	sg_dma_address(&sg[i]) = buf_addr + i * max_period_size;
+	sg_dma_len(&sg[i]) = buf_len - i * max_period_size;
+
+	pair->desc[dir] = dmaengine_prep_slave_sg(chan, sg, sg_len,
+						  slave_config.direction,
+						  DMA_PREP_INTERRUPT);
+	kfree(sg);
+	if (!pair->desc[dir]) {
+		dev_err(dev, "failed to prepare dmaengine for %s task\n", DIR_STR(dir));
+		return -EINVAL;
+	}
+
+	pair->desc[dir]->callback = ASRC_xPUT_DMA_CALLBACK(dir);
+	pair->desc[dir]->callback_param = pair;
+
+	return 0;
+}
+
+/* main function of converter */
+static void asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_task_runtime *task)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &asrc->pdev->dev;
+	enum asrc_pair_index index = pair->index;
+	struct snd_dma_buffer *src_buf, *dst_buf;
+	unsigned int in_buf_len;
+	unsigned int out_dma_len;
+	unsigned int width;
+	u32 fifo_addr;
+	int ret;
+
+	/* set ratio mod */
+	if (asrc->m2m_set_ratio_mod) {
+		if (pair->ratio_mod_flag) {
+			asrc->m2m_set_ratio_mod(pair, pair->ratio_mod);
+			pair->ratio_mod_flag = false;
+		}
+	}
+
+	src_buf = &pair->dma_buffer[IN];
+	dst_buf = &pair->dma_buffer[OUT];
+
+	width = snd_pcm_format_physical_width(pair->sample_format[IN]);
+	fifo_addr = asrc->paddr + asrc->get_fifo_addr(IN, index);
+
+	in_buf_len = task->input_size;
+
+	if (in_buf_len < width * pair->channels / 8 ||
+	    in_buf_len > ASRC_M2M_BUFFER_SIZE ||
+	    in_buf_len % (width * pair->channels / 8)) {
+		dev_err(dev, "out buffer size is error: [%d]\n", in_buf_len);
+		goto end;
+	}
+
+	/* dma config for output dma channel */
+	ret = asrc_dmaconfig(pair,
+			     pair->dma_chan[IN],
+			     fifo_addr,
+			     src_buf->addr,
+			     in_buf_len, IN, width);
+	if (ret) {
+		dev_err(dev, "out dma config error\n");
+		goto end;
+	}
+
+	width = snd_pcm_format_physical_width(pair->sample_format[OUT]);
+	fifo_addr = asrc->paddr + asrc->get_fifo_addr(OUT, index);
+	out_dma_len = asrc->m2m_calc_out_len(pair, in_buf_len);
+	if (out_dma_len > 0 && out_dma_len <= ASRC_M2M_BUFFER_SIZE) {
+		/* dma config for capture dma channel */
+		ret = asrc_dmaconfig(pair,
+				     pair->dma_chan[OUT],
+				     fifo_addr,
+				     dst_buf->addr,
+				     out_dma_len, OUT, width);
+		if (ret) {
+			dev_err(dev, "cap dma config error\n");
+			goto end;
+		}
+	} else if (out_dma_len > ASRC_M2M_BUFFER_SIZE) {
+		dev_err(dev, "cap buffer size error\n");
+		goto end;
+	}
+
+	reinit_completion(&pair->complete[IN]);
+	reinit_completion(&pair->complete[OUT]);
+
+	/* Submit DMA request */
+	dmaengine_submit(pair->desc[IN]);
+	dma_async_issue_pending(pair->desc[IN]->chan);
+	if (out_dma_len > 0) {
+		dmaengine_submit(pair->desc[OUT]);
+		dma_async_issue_pending(pair->desc[OUT]->chan);
+	}
+
+	asrc->m2m_start(pair);
+
+	if (!wait_for_completion_interruptible_timeout(&pair->complete[IN], 10 * HZ)) {
+		dev_err(dev, "out DMA task timeout\n");
+		goto end;
+	}
+
+	if (out_dma_len > 0) {
+		if (!wait_for_completion_interruptible_timeout(&pair->complete[OUT], 10 * HZ)) {
+			dev_err(dev, "cap DMA task timeout\n");
+			goto end;
+		}
+	}
+
+	/* read the last words from FIFO */
+	asrc_read_last_fifo(pair, dst_buf->area, &out_dma_len);
+	/* update payload length for capture */
+	task->output_size = out_dma_len;
+end:
+	return;
+}
+
+static int fsl_asrc_m2m_comp_open(struct snd_compr_stream *stream)
+{
+	struct fsl_asrc *asrc = stream->private_data;
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct device *dev = &asrc->pdev->dev;
+	struct fsl_asrc_pair *pair;
+	int size, ret;
+
+	pair = kzalloc(sizeof(*pair) + asrc->pair_priv_size, GFP_KERNEL);
+	if (!pair)
+		return -ENOMEM;
+
+	pair->private = (void *)pair + sizeof(struct fsl_asrc_pair);
+	pair->asrc = asrc;
+
+	init_completion(&pair->complete[IN]);
+	init_completion(&pair->complete[OUT]);
+
+	runtime->private_data = pair;
+
+	size = ASRC_M2M_BUFFER_SIZE;
+	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, dev, size, &pair->dma_buffer[IN]);
+	if (ret)
+		goto error_alloc_in_buf;
+
+	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, dev, size, &pair->dma_buffer[OUT]);
+	if (ret)
+		goto error_alloc_out_buf;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to power up asrc\n");
+		goto err_pm_runtime;
+	}
+
+	return 0;
+
+err_pm_runtime:
+	snd_dma_free_pages(&pair->dma_buffer[OUT]);
+error_alloc_out_buf:
+	snd_dma_free_pages(&pair->dma_buffer[IN]);
+error_alloc_in_buf:
+	kfree(pair);
+	return ret;
+}
+
+static int fsl_asrc_m2m_comp_release(struct snd_compr_stream *stream)
+{
+	struct fsl_asrc *asrc = stream->private_data;
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct fsl_asrc_pair *pair = runtime->private_data;
+	struct device *dev = &asrc->pdev->dev;
+
+	pm_runtime_put_sync(dev);
+
+	snd_dma_free_pages(&pair->dma_buffer[IN]);
+	snd_dma_free_pages(&pair->dma_buffer[OUT]);
+
+	kfree(runtime->private_data);
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_comp_set_params(struct snd_compr_stream *stream,
+					struct snd_compr_params *params)
+{
+	struct fsl_asrc *asrc = stream->private_data;
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct fsl_asrc_pair *pair = runtime->private_data;
+	struct fsl_asrc_m2m_cap cap;
+	int ret, i;
+
+	ret = asrc->m2m_get_cap(&cap);
+	if (ret)
+		return -EINVAL;
+
+	if (pcm_format_to_bits(params->codec.format) & cap.fmt_in)
+		pair->sample_format[IN] = params->codec.format;
+	else
+		return -EINVAL;
+
+	if (pcm_format_to_bits(params->codec.pcm_format) & cap.fmt_out)
+		pair->sample_format[OUT] = params->codec.pcm_format;
+	else
+		return -EINVAL;
+
+	/* check input rate is in scope */
+	for (i = 0; i < cap.rate_in_count; i++)
+		if (params->codec.sample_rate == cap.rate_in[i]) {
+			pair->rate[IN] = params->codec.sample_rate;
+			break;
+		}
+	if (i == cap.rate_in_count)
+		return -EINVAL;
+
+	/* check output rate is in scope */
+	for (i = 0; i < cap.rate_out_count; i++)
+		if (params->codec.options.src_d.out_sample_rate == cap.rate_out[i]) {
+			pair->rate[OUT] = params->codec.options.src_d.out_sample_rate;
+			break;
+		}
+	if (i == cap.rate_out_count)
+		return -EINVAL;
+
+	if (params->codec.ch_in != params->codec.ch_out ||
+	    params->codec.ch_in < cap.chan_min ||
+	    params->codec.ch_in > cap.chan_max)
+		return -EINVAL;
+
+	pair->channels = params->codec.ch_in;
+	pair->buf_len[IN] = params->buffer.fragment_size;
+	pair->buf_len[OUT] = params->buffer.fragment_size;
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	struct snd_dma_buffer *dmab = dmabuf->priv;
+
+	return snd_dma_buffer_mmap(dmab, vma);
+}
+
+static struct sg_table *fsl_asrc_m2m_map_dma_buf(struct dma_buf_attachment *attachment,
+						 enum dma_data_direction direction)
+{
+	struct snd_dma_buffer *dmab = attachment->dmabuf->priv;
+	struct sg_table *sgt;
+
+	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return NULL;
+
+	if (dma_get_sgtable(attachment->dev, sgt, dmab->area, dmab->addr, dmab->bytes) < 0)
+		goto free;
+
+	if (dma_map_sgtable(attachment->dev, sgt, direction, 0))
+		goto free;
+
+	return sgt;
+
+free:
+	sg_free_table(sgt);
+	kfree(sgt);
+	return NULL;
+}
+
+static void fsl_asrc_m2m_unmap_dma_buf(struct dma_buf_attachment *attachment,
+				       struct sg_table *table,
+				       enum dma_data_direction direction)
+{
+	dma_unmap_sgtable(attachment->dev, table, direction, 0);
+}
+
+static void fsl_asrc_m2m_release(struct dma_buf *dmabuf)
+{
+	/* buffer is released by fsl_asrc_m2m_comp_release() */
+}
+
+static const struct dma_buf_ops fsl_asrc_m2m_dma_buf_ops = {
+	.mmap = fsl_asrc_m2m_mmap,
+	.map_dma_buf = fsl_asrc_m2m_map_dma_buf,
+	.unmap_dma_buf = fsl_asrc_m2m_unmap_dma_buf,
+	.release = fsl_asrc_m2m_release,
+};
+
+static int fsl_asrc_m2m_comp_task_create(struct snd_compr_stream *stream,
+					 struct snd_compr_task_runtime *task)
+{
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info_in);
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info_out);
+	struct fsl_asrc *asrc = stream->private_data;
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct fsl_asrc_pair *pair = runtime->private_data;
+	struct device *dev = &asrc->pdev->dev;
+	int ret;
+
+	exp_info_in.ops = &fsl_asrc_m2m_dma_buf_ops;
+	exp_info_in.size = ASRC_M2M_BUFFER_SIZE;
+	exp_info_in.flags = O_RDWR;
+	exp_info_in.priv = &pair->dma_buffer[IN];
+	task->input = dma_buf_export(&exp_info_in);
+	if (IS_ERR(task->input)) {
+		ret = PTR_ERR(task->input);
+		return ret;
+	}
+
+	exp_info_out.ops = &fsl_asrc_m2m_dma_buf_ops;
+	exp_info_out.size = ASRC_M2M_BUFFER_SIZE;
+	exp_info_out.flags = O_RDWR;
+	exp_info_out.priv = &pair->dma_buffer[OUT];
+	task->output = dma_buf_export(&exp_info_out);
+	if (IS_ERR(task->output)) {
+		ret = PTR_ERR(task->output);
+		return ret;
+	}
+
+	/* Request asrc pair/context */
+	ret = asrc->request_pair(pair->channels, pair);
+	if (ret) {
+		dev_err(dev, "failed to request pair: %d\n", ret);
+		goto err_request_pair;
+	}
+
+	ret = asrc->m2m_prepare(pair);
+	if (ret) {
+		dev_err(dev, "failed to start pair part one: %d\n", ret);
+		goto err_start_part_one;
+	}
+
+	/* Request dma channels */
+	pair->dma_chan[IN] = asrc->get_dma_channel(pair, IN);
+	if (!pair->dma_chan[IN]) {
+		dev_err(dev, "[ctx%d] failed to get input DMA channel\n", pair->index);
+		ret = -EBUSY;
+		goto err_dma_channel_in;
+	}
+
+	pair->dma_chan[OUT] = asrc->get_dma_channel(pair, OUT);
+	if (!pair->dma_chan[OUT]) {
+		dev_err(dev, "[ctx%d] failed to get output DMA channel\n", pair->index);
+		ret = -EBUSY;
+		goto err_dma_channel_out;
+	}
+
+	return 0;
+
+err_dma_channel_out:
+	dma_release_channel(pair->dma_chan[IN]);
+err_dma_channel_in:
+	if (asrc->m2m_unprepare)
+		asrc->m2m_unprepare(pair);
+err_start_part_one:
+	asrc->release_pair(pair);
+err_request_pair:
+	return ret;
+}
+
+static int fsl_asrc_m2m_comp_task_start(struct snd_compr_stream *stream,
+					struct snd_compr_task_runtime *task)
+{
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct fsl_asrc_pair *pair = runtime->private_data;
+
+	asrc_m2m_device_run(pair, task);
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_comp_task_stop(struct snd_compr_stream *stream,
+				       struct snd_compr_task_runtime *task)
+{
+	return 0;
+}
+
+static int fsl_asrc_m2m_comp_task_free(struct snd_compr_stream *stream,
+				       struct snd_compr_task_runtime *task)
+{
+	struct fsl_asrc *asrc = stream->private_data;
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct fsl_asrc_pair *pair = runtime->private_data;
+
+	/* Stop & release pair/context */
+	if (asrc->m2m_stop)
+		asrc->m2m_stop(pair);
+
+	if (asrc->m2m_unprepare)
+		asrc->m2m_unprepare(pair);
+	asrc->release_pair(pair);
+
+	/* Release dma channel */
+	if (pair->dma_chan[IN])
+		dma_release_channel(pair->dma_chan[IN]);
+	if (pair->dma_chan[OUT])
+		dma_release_channel(pair->dma_chan[OUT]);
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_get_caps(struct snd_compr_stream *cstream,
+				 struct snd_compr_caps *caps)
+{
+	caps->num_codecs = 1;
+	caps->min_fragment_size = 4096;
+	caps->max_fragment_size = 4096;
+	caps->min_fragments = 1;
+	caps->max_fragments = 1;
+	caps->codecs[0] = SND_AUDIOCODEC_PCM;
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_fill_codec_caps(struct fsl_asrc *asrc,
+					struct snd_compr_codec_caps *codec)
+{
+	struct fsl_asrc_m2m_cap cap;
+	snd_pcm_format_t k;
+	int j = 0;
+	int ret;
+
+	ret = asrc->m2m_get_cap(&cap);
+	if (ret)
+		return -EINVAL;
+
+	pcm_for_each_format(k) {
+		if (pcm_format_to_bits(k) & cap.fmt_in) {
+			codec->descriptor[j].max_ch = cap.chan_max;
+			memcpy(codec->descriptor[j].sample_rates,
+			       cap.rate_in,
+			       cap.rate_in_count * sizeof(__u32));
+			codec->descriptor[j].num_sample_rates = cap.rate_in_count;
+			codec->descriptor[j].formats = k;
+			codec->descriptor[j].pcm_formats = cap.fmt_out;
+			codec->descriptor[j].src.out_sample_rate_min = cap.rate_out[0];
+			codec->descriptor[j].src.out_sample_rate_max =
+				cap.rate_out[cap.rate_out_count - 1];
+			j++;
+		}
+	}
+
+	codec->codec = SND_AUDIOCODEC_PCM;
+	codec->num_descriptors = j;
+	return 0;
+}
+
+static int fsl_asrc_m2m_get_codec_caps(struct snd_compr_stream *stream,
+				       struct snd_compr_codec_caps *codec)
+{
+	struct fsl_asrc *asrc = stream->private_data;
+
+	return fsl_asrc_m2m_fill_codec_caps(asrc, codec);
+}
+
+static struct snd_compr_ops fsl_asrc_m2m_compr_ops = {
+	.open = fsl_asrc_m2m_comp_open,
+	.free = fsl_asrc_m2m_comp_release,
+	.set_params = fsl_asrc_m2m_comp_set_params,
+	.get_caps = fsl_asrc_m2m_get_caps,
+	.get_codec_caps = fsl_asrc_m2m_get_codec_caps,
+	.task_create = fsl_asrc_m2m_comp_task_create,
+	.task_start = fsl_asrc_m2m_comp_task_start,
+	.task_stop = fsl_asrc_m2m_comp_task_stop,
+	.task_free = fsl_asrc_m2m_comp_task_free,
+};
+
+int fsl_asrc_m2m_suspend(struct fsl_asrc *asrc)
+{
+	struct fsl_asrc_pair *pair;
+	int i;
+
+	for (i = 0; i < PAIR_CTX_NUM; i++) {
+		pair = asrc->pair[i];
+		if (!pair)
+			continue;
+		if (!completion_done(&pair->complete[IN])) {
+			if (pair->dma_chan[IN])
+				dmaengine_terminate_all(pair->dma_chan[IN]);
+			asrc_input_dma_callback((void *)pair);
+		}
+		if (!completion_done(&pair->complete[OUT])) {
+			if (pair->dma_chan[OUT])
+				dmaengine_terminate_all(pair->dma_chan[OUT]);
+			asrc_output_dma_callback((void *)pair);
+		}
+
+		if (asrc->m2m_pair_suspend)
+			asrc->m2m_pair_suspend(pair);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fsl_asrc_m2m_suspend);
+
+int fsl_asrc_m2m_resume(struct fsl_asrc *asrc)
+{
+	struct fsl_asrc_pair *pair;
+	int i;
+
+	for (i = 0; i < PAIR_CTX_NUM; i++) {
+		pair = asrc->pair[i];
+		if (!pair)
+			continue;
+		if (asrc->m2m_pair_resume)
+			asrc->m2m_pair_resume(pair);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fsl_asrc_m2m_resume);
+
+int fsl_asrc_m2m_init(struct fsl_asrc *asrc)
+{
+	struct device *dev = &asrc->pdev->dev;
+	struct snd_card *card;
+	struct snd_compr *compr;
+	int ret;
+
+	ret = snd_card_new(dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
+			   THIS_MODULE, 0, &card);
+	if (ret < 0)
+		return ret;
+
+	strscpy(card->driver, "fsl-asrc-m2m", sizeof(card->driver));
+	strscpy(card->shortname, "ASRC-M2M", sizeof(card->shortname));
+	strscpy(card->longname, "ASRC-M2M", sizeof(card->shortname));
+
+	asrc->card = card;
+
+	compr = devm_kzalloc(dev, sizeof(*compr), GFP_KERNEL);
+	if (!compr) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	compr->ops = &fsl_asrc_m2m_compr_ops;
+	compr->private_data = asrc;
+
+	ret = snd_compress_new(card, 0, SND_COMPRESS_ACCEL, "ASRC M2M", compr);
+	if (ret < 0)
+		goto err;
+
+	ret = snd_card_register(card);
+	if (ret < 0)
+		goto err;
+
+	return 0;
+err:
+	snd_card_free(card);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(fsl_asrc_m2m_init);
+
+void fsl_asrc_m2m_exit(struct fsl_asrc *asrc)
+{
+	struct snd_card *card = asrc->card;
+
+	snd_card_free(card);
+}
+EXPORT_SYMBOL_GPL(fsl_asrc_m2m_exit);
+
+MODULE_IMPORT_NS(DMA_BUF);
+MODULE_AUTHOR("Shengjiu Wang <Shengjiu.Wang@nxp.com>");
+MODULE_DESCRIPTION("Freescale ASRC M2M driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


