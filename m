Return-Path: <linuxppc-dev+bounces-6866-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBB2A5B8CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 06:57:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBjgg16mLz3bnq;
	Tue, 11 Mar 2025 16:56:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::604" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741672591;
	cv=pass; b=ljB/+bE4opzhbocQp57VH4XgxnknUUrb2xrJhuR9mgeKWSpWLMTuGuEgTSe+LEHJxwSyR7RPm369h7rANjVYBS5QQm0vqJfv9SqqlhzBoD5WHYVQzqEWA8MrISQptWx8a/ePeRsTUpKjdU7l8R4JL8ThLh1ESk2N8z23yUvSOibkU0ru+G26mJEg9I5lyvn+WMIANUmTj4fgEONYhkdCSuaBPmInue8aWREhSPAOVXr5TvNFxk0eOOS2yTG0KjPRwTQKd3iymlXfjv6/tJ7YkvuXresGChnFp30EOwdqItNKWHAi9t5ot50xmuIFU7mHagguCIpqobBBHTqaKL7FJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741672591; c=relaxed/relaxed;
	bh=CadwPhvgcrUWvDlwSegvjPH9jYgpzucYu6GcFW2955M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TMzfS3dZfczh/6dGhxV8z5CgckYUHMl4qUeHh91fm4i8J6uCnNupyRLuGoybbRvMQfyaWuHf98Y0XdbGMoXKA7QLuGY6yMflSzGFJeG4X/X9xXc2B//t1y4sCiGOQcOMRzvEqWa5WFnQ0TzOht04GNvEFxjnP7YJur5AlQyi2I6RCgIMpOE3NG0RU3T6ni0z5aSlxwwb68JJ2HjS/O6WLlq6djvL47+xiBwxTWYvDSgQO1FaCNark6hzMIU2HDQYoo0CLUTQBD7Opcva1NdddkEQ40Ampg0XWU7M6RiQapqx3mCUtXitv7fyqU3mSveU3FaHeU/iYfAsaUrD6MDiNg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=LuW2J2Gp; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::604; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=LuW2J2Gp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::604; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20604.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::604])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBjgf17VJz3bpn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 16:56:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGvr6+UUC1NgaqQDY123ylouf5LZvwLei0LfSBmx94F7h8DvZK1lJaoUaN5ipXPwoFn9I+Evwh9Tk0PaMDFx+07CWVLvHzaEBvcHCrZ5ghKGzeNl0fnaTzwts0zUiJgwW11wShUNjOC4lHGJEPJ3CBxmDlSXuwfipNJGHPCRsGdqx2BKJ9Vv7MZAMkG/yS2NWwmEuw4XSQP4oi/2IZOQQIa6PErsNlIbtHWVDIm20oLFW1xde76zcEaJhCH5zcIpIXoSsA4DrJVl/qmI6oH/g6FEfusqTlkJUCZdA109pxPhQhOn/osSFzgGS6XwvvK+beM25Vhn+Wit+WSeJEbh9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CadwPhvgcrUWvDlwSegvjPH9jYgpzucYu6GcFW2955M=;
 b=t/NRtzq/zhz+UlpEY7y7fNQwAhQXJskWsnqCTTMd677BlxFpx/R7BoHSFBZ2MbtVhQLPHEpyodidTEyIgTDzGnId3/bcn6v6W1W3KbAywdoxudjCoFXxgvDA7NGtiaK2HXUD+wsUlBui5ODemtQVqMj9Y0UDHlfsYGw6htoF4BRsHuuq2imB/bF4fT8eoLTD7OAj2Xpbx/wyKyCrqEVLB3YGkx31vEWx3kBVf0/y68lUtoGFKmoafATfj9fUBSoYpIUo8nip1DcSwqu2s7uxS39abVst/Le4f4297VvB4HrWAW3u/1HMp9gT1QRc3pfMI5/8cCeQ9s82uc0IkSFcfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CadwPhvgcrUWvDlwSegvjPH9jYgpzucYu6GcFW2955M=;
 b=LuW2J2GpsgoCAn1rQwXQiNRetUcuE+ZzDj0G8o80qYkO3Z2NgFGsy5Y00RwcEVH4jzxWgJ62DXSgNJ5IQ9PiefNtMUMLG5/OuUiV3hYes436iVRLy7xXYbDfL4HN/lQ7oeVTMy6bqygBcMZ9Yx7FTMROqeMBpM1dVnJe8HsiG6VmWJjW2dmC1I+rFRV/0MbR/6pTcTWGvkk1fcekq1gpnCUhLc0ZMYi6eyse08tbkTPWxyFmuJQ+UeeOO6Vg0qHfm17QxFeujT2OUNwpJveDsumnWXBjPa2Vwgt0uVQ+nTPX3EgV2q9FvBF7/AjWnSwVk97ga+RqwQNtuD3C7L1sWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GV1PR04MB10941.eurprd04.prod.outlook.com (2603:10a6:150:201::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 05:56:27 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 05:56:27 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 net-next 05/14] net: enetc: add debugfs interface to dump MAC filter
Date: Tue, 11 Mar 2025 13:38:21 +0800
Message-Id: <20250311053830.1516523-6-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311053830.1516523-1-wei.fang@nxp.com>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::23)
 To PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|GV1PR04MB10941:EE_
X-MS-Office365-Filtering-Correlation-Id: e4c66553-7809-4d56-7914-08dd6061764e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MmIyi4omcKm7FwgS5uFyEe4cNxG8/UqyZyI6CyMOjbZ5Sxl7tFAvvflDbmgM?=
 =?us-ascii?Q?RA8Hn9EWLyF8T4uGl6vDqWnxnJ6Sk5s2zMho5hL2aECZS/9obvtDoHJdoCg8?=
 =?us-ascii?Q?ZmQwojnrNlbFBM2i6igKxtnCOqtspX1xZEDSZRMrVHfYqXZ1Wfhq0YSPBlGQ?=
 =?us-ascii?Q?W0/7TnaNWZNERfjZ5D4bk51Ixegl7yGWa/R08GSHBs5usWkFl/zGtixb3/eQ?=
 =?us-ascii?Q?SSdTO3RUiuq2cnjeTT3KpFn0DErEcgE3uKur/COyWcJ2hYomJrNXmAfdtL67?=
 =?us-ascii?Q?osHzdY6Gy6fuM10ux/Csvbp8YA71Rv1Q9S5N82ZQKFomQSV/pea+vLThfrpl?=
 =?us-ascii?Q?9i9WH4A2Gp6Wq8icYqhmJZ/shejLLYpOmRIHsoRUP5HzWKIMQrmbKmZQlcZ0?=
 =?us-ascii?Q?rtcAczpETX752XBDWftaYAPgjhMypR+GchmfzhrI4kDRjMWe6L6j3sN4APLp?=
 =?us-ascii?Q?Q6V/LZ3fp+7YGJQhvFeUEMJde4TwasRGV0XHbEUlry5yf4u62R7S7lvOqfyj?=
 =?us-ascii?Q?vLXFQANVbWXK8vWzXPE5k1xlTT6bvsTGL3ct0kwQTodOBR9wIpzmPoz6hw5W?=
 =?us-ascii?Q?MlOh1ShQicGOaDnQIgYEiHoATokz83j51JHVwBlIMq6NSNhZdvV9EJT9pxkI?=
 =?us-ascii?Q?IYUUO6vm07DhrDb3qW/KZBVm1pmTxrNWTu3iGdIOM/ikjX2N0TKPmmFo9Xt/?=
 =?us-ascii?Q?2QamRqtpbj+WFih/f4Iu0+sCECvCOwHfMVKwVqOc4zuJSM9NEuiVBfI0CxSp?=
 =?us-ascii?Q?bg3pO9RTdY5dhNIMJc0C4qZWab5XxxRSIGQb61jGd+4tF5FoW4aJUt/vlgcd?=
 =?us-ascii?Q?5jSCR0JhpDFrwz3ayHfP6unXv6GTdPYU91SHX3quO6/SzVEN01bfj/074lLx?=
 =?us-ascii?Q?BHahdYQDudJTGxHQWT1vuNHEthWHgPGJ5uoPYmerL/mo79A8pSYDyEOU5DGa?=
 =?us-ascii?Q?KksF5IbKexESNJLIxdlcAupDT76g7iwQPBk7pCi9OwdmaoPI1kventxKcPdV?=
 =?us-ascii?Q?G35WqJldH3k/2+R0kel82Cr9PvCNSkjB/lXgOEJOClgP3GTOL8hAO1dk9fzR?=
 =?us-ascii?Q?BV2o6506uHFmQiJ158YLzlsrw24+MucuD22+YZhGaikxJnpFc/YFYwRzSR1r?=
 =?us-ascii?Q?ET1MueY19NXHNiqOt3HGXZuwh951zTFTsrLsYbVpqJ94hiAlb9f/c/2VHZoe?=
 =?us-ascii?Q?AZUsT/fXs+5sKMgReo/V3GQdb8eH9vS3YV9nYj2ZnwWI1aY/i5jr/Nt+V/8+?=
 =?us-ascii?Q?J+7GDz8Ec9zoVzF8L9H2OfYae/if89c08b15uSHzQJmioiEXDRwNIHcyVH9E?=
 =?us-ascii?Q?JFnUQUuQppJNWpZMNmXMopjPwGG/WSlvFIABGNpCbxJP1OpG1XU00RzYA+B3?=
 =?us-ascii?Q?udEnAlOV4s48Bt38rnhDIsOtdMsxDW413tzhkZ6/yRCXBR5GL/WfdGvBXV8z?=
 =?us-ascii?Q?UziNter1oAb5s8RGjDmOayhxouhfAGxM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UPFbyD/0yO3zdwxk7ERlUylPL/oZyY2YKBIzZQjSuwtIl93Vi/3AQzXGGZhk?=
 =?us-ascii?Q?offJ2O/ChFP0ynfihb7HnuXMSzgK+ifzWE1FSJJKL162II5Dd226hygWFdun?=
 =?us-ascii?Q?90SfWugYqWwVBK94REUWVnLli379j5ZKEJ/PwjPibSroqqEKytzpzcbNTRx4?=
 =?us-ascii?Q?irCuyV/opMuJgRlQYZlOjnSW3V9C9JqS1Vgn8y9dl9CWtu7+diCZGFCDlf4I?=
 =?us-ascii?Q?eqLfnG+HcRK+vwjsw3UO2xA+Y/YA+B9oTvqpnmJ8WqkANEfYwX1qNzJilNRf?=
 =?us-ascii?Q?Fows/fcgrJbsy8w+j6B39PjlrwBmRNJWtudZas2Bfvk+0+Sh4KD9lgtYru+u?=
 =?us-ascii?Q?x5H+vH1HMki3kRDJ00Ze9VzzT/TyQPc90C7KuM3HljUMFZy6uP+SvCLHlapQ?=
 =?us-ascii?Q?0Xf/JJrRHS4knXoSyVyEwE9+9r/RafFPmQtVy8mBnKfUNjEOtEXqvIy4xVfr?=
 =?us-ascii?Q?V1aFAFQpt4R7Gz4R0jy5wqjN4ongAHOtqHyy1a8y/Rkgzz1+AxidEPRwPYSY?=
 =?us-ascii?Q?4yiDIT/b29b3vpoO/8Y2Ibx4VsPkNoNzcF0mPR7kxlxRlOC9OlTLT2AZo5/g?=
 =?us-ascii?Q?TDTqYSBF0+bhRbieyaQFv8R7Rb86quJAOJhc1q1v6cRi0LWsEdxvnWVoOGR0?=
 =?us-ascii?Q?2VjtnL5/RbOCsMT1nk4ge4EE8AotkSeYR+HjP4hxCOMJJTs3f0oy0dVt7TLT?=
 =?us-ascii?Q?znbz7xMgQS0IvOS2ESEFHLEzOmf9f7wfLb4k0mFCt9LeNALIkx9sTmjRusuz?=
 =?us-ascii?Q?rOeL5W5zirr468WBbrQAFOCMT9e2vct4vPG7pZquiW9ezZRXlERqk0YsOWVW?=
 =?us-ascii?Q?5s5eUfINNFkubpZ+a/eU9HjxULC7N8RRGGoc0N+0pgQ0vhrYM4bRohVZ0j7U?=
 =?us-ascii?Q?ap3d2+QIfxWbwuH4WjY/MOJGg2YuK+weyFAwwwLX+bNB+kHWuXWBum3r1Taj?=
 =?us-ascii?Q?zMofilWgU0Bnsfyn13glCJyd0H93htUJM8uGo83neA20nGJP4Jx07R/TzRrN?=
 =?us-ascii?Q?96+oGVRAZ1Xn/ujmGQDlDXwEEAKaVE0wZ0KIOMagEUveSdI3ndyxWkz+Szeq?=
 =?us-ascii?Q?bSKp/FbsVy9TvdLDwZTurFXpmMPaW0nLSvSssP+RnF1KzAiEZOZ8TaIyucR4?=
 =?us-ascii?Q?qq2e9/pJDYITtP7Bob8rLLJuDzNzK/TUye0ZHXKsMQuMtQXYUzS3Q/Gu7+Uc?=
 =?us-ascii?Q?JujniVk53bQzmChMiP84wUHy8Jr4XaVnFOHx8mrc5af7/HQq31pe+480Oz53?=
 =?us-ascii?Q?Ij+9uXpvwQcE4QtUO3Fez4kIJIJU7Pd4bILM94q4N2z4HnkPRtPGqcxnSa7G?=
 =?us-ascii?Q?6UeuiFAfUSLYfspViTfyuHHmYrkAX4YuKEcEnmwL9CdNk3bZJLlA02Cc4v4b?=
 =?us-ascii?Q?k6gYhBOi3s8v2/DfJ8JBFNF8uCwJBfsmNlegEAhWQJEWKVfBJCMrakIJ/Qno?=
 =?us-ascii?Q?PMyNzWWSP3B6hvY5fO3g3+lNmm012M1sFpBACkIUsNquJc22aZ3chiEk6P5V?=
 =?us-ascii?Q?o97ZzUw0Ms5gmnmExHryPu9xGyOEjCWLeXeoQOSUFSSQew92jFpjqaw8+mLy?=
 =?us-ascii?Q?6YIwbH2I3KXmXmrc2ihfFT5jpxMUQ703VicMmQsM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c66553-7809-4d56-7914-08dd6061764e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 05:56:27.1661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nnE7de812gpkuv8SWZSG9xFUzCoEnnG+2eYiVvPCuyB2MsuRXAsh0AO4CrPz30xCgGzTf8WPXW/RZCdbCy0zfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10941
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

ENETC's MAC filter consists of hash MAC filter and exact MAC filter. Hash
MAC filter is a 64-entry hash table consisting of two 32-bit registers.
Exact MAC filter is implemented by configuring MAC address filter table
through command BD ring. The table is stored in ENETC's internal memory
and needs to be read through command BD ring. In order to facilitate
debugging, added a debugfs interface to get the relevant information
about MAC filter.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/Makefile |  1 +
 drivers/net/ethernet/freescale/enetc/enetc.h  |  1 +
 .../ethernet/freescale/enetc/enetc4_debugfs.c | 93 +++++++++++++++++++
 .../ethernet/freescale/enetc/enetc4_debugfs.h | 20 ++++
 .../net/ethernet/freescale/enetc/enetc4_pf.c  |  4 +
 5 files changed, 119 insertions(+)
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc4_debugfs.h

diff --git a/drivers/net/ethernet/freescale/enetc/Makefile b/drivers/net/ethernet/freescale/enetc/Makefile
index 707a68e26971..f1c5ad45fd76 100644
--- a/drivers/net/ethernet/freescale/enetc/Makefile
+++ b/drivers/net/ethernet/freescale/enetc/Makefile
@@ -16,6 +16,7 @@ fsl-enetc-$(CONFIG_FSL_ENETC_QOS) += enetc_qos.o
 
 obj-$(CONFIG_NXP_ENETC4) += nxp-enetc4.o
 nxp-enetc4-y := enetc4_pf.o
+nxp-enetc4-$(CONFIG_DEBUG_FS) += enetc4_debugfs.o
 
 obj-$(CONFIG_FSL_ENETC_VF) += fsl-enetc-vf.o
 fsl-enetc-vf-y := enetc_vf.o
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 4dba91408e3d..ca1bc85c0ac9 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -318,6 +318,7 @@ struct enetc_si {
 	struct enetc_mac_filter mac_filter[MADDR_TYPE];
 	struct workqueue_struct *workqueue;
 	struct work_struct rx_mode_task;
+	struct dentry *debugfs_root;
 };
 
 #define ENETC_SI_ALIGN	32
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
new file mode 100644
index 000000000000..3a660c80344a
--- /dev/null
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright 2025 NXP */
+
+#include <linux/device.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+
+#include "enetc_pf.h"
+#include "enetc4_debugfs.h"
+
+#define is_en(x)	(x) ? "Enabled" : "Disabled"
+
+static void enetc_show_si_mac_hash_filter(struct seq_file *s, int i)
+{
+	struct enetc_si *si = s->private;
+	struct enetc_hw *hw = &si->hw;
+	u32 hash_h, hash_l;
+
+	hash_l = enetc_port_rd(hw, ENETC4_PSIUMHFR0(i));
+	hash_h = enetc_port_rd(hw, ENETC4_PSIUMHFR1(i));
+	seq_printf(s, "SI %d unicast MAC hash filter: 0x%08x%08x\n",
+		   i, hash_h, hash_l);
+
+	hash_l = enetc_port_rd(hw, ENETC4_PSIMMHFR0(i));
+	hash_h = enetc_port_rd(hw, ENETC4_PSIMMHFR1(i));
+	seq_printf(s, "SI %d multicast MAC hash filter: 0x%08x%08x\n",
+		   i, hash_h, hash_l);
+}
+
+static int enetc_mac_filter_show(struct seq_file *s, void *data)
+{
+	struct maft_entry_data maft_data;
+	struct enetc_si *si = s->private;
+	struct enetc_hw *hw = &si->hw;
+	struct maft_keye_data *keye;
+	struct enetc_pf *pf;
+	int i, err, num_si;
+	u32 val;
+
+	pf = enetc_si_priv(si);
+	num_si = pf->caps.num_vsi + 1;
+
+	val = enetc_port_rd(hw, ENETC4_PSIPMMR);
+	for (i = 0; i < num_si; i++) {
+		seq_printf(s, "SI %d Unicast Promiscuous mode: %s\n",
+			   i, is_en(PSIPMMR_SI_MAC_UP(i) & val));
+		seq_printf(s, "SI %d Multicast Promiscuous mode: %s\n",
+			   i, is_en(PSIPMMR_SI_MAC_MP(i) & val));
+	}
+
+	/* MAC hash filter table */
+	for (i = 0; i < num_si; i++)
+		enetc_show_si_mac_hash_filter(s, i);
+
+	if (!pf->num_mfe)
+		return 0;
+
+	/* MAC address filter table */
+	seq_puts(s, "Show MAC address filter table\n");
+	for (i = 0; i < pf->num_mfe; i++) {
+		memset(&maft_data, 0, sizeof(maft_data));
+		err = ntmp_maft_query_entry(&si->ntmp.cbdrs, i, &maft_data);
+		if (err)
+			return err;
+
+		keye = &maft_data.keye;
+		seq_printf(s, "Entry %d, MAC: %pM, SI bitmap: 0x%04x\n", i,
+			   keye->mac_addr, le16_to_cpu(maft_data.cfge.si_bitmap));
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(enetc_mac_filter);
+
+void enetc_create_debugfs(struct enetc_si *si)
+{
+	struct net_device *ndev = si->ndev;
+	struct dentry *root;
+
+	root = debugfs_create_dir(netdev_name(ndev), NULL);
+	if (IS_ERR(root))
+		return;
+
+	si->debugfs_root = root;
+
+	debugfs_create_file("mac_filter", 0444, root, si, &enetc_mac_filter_fops);
+}
+
+void enetc_remove_debugfs(struct enetc_si *si)
+{
+	debugfs_remove_recursive(si->debugfs_root);
+	si->debugfs_root = NULL;
+}
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.h b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.h
new file mode 100644
index 000000000000..96caca35f79d
--- /dev/null
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/* Copyright 2025 NXP */
+
+#ifndef __ENETC4_DEBUGFS_H
+#define __ENETC4_DEBUGFS_H
+
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+void enetc_create_debugfs(struct enetc_si *si);
+void enetc_remove_debugfs(struct enetc_si *si);
+#else
+static inline void enetc_create_debugfs(struct enetc_si *si)
+{
+}
+
+static inline void enetc_remove_debugfs(struct enetc_si *si)
+{
+}
+#endif
+
+#endif
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 7d1c545f3f56..a98ed059a83f 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -8,6 +8,7 @@
 #include <linux/unaligned.h>
 
 #include "enetc_pf_common.h"
+#include "enetc4_debugfs.h"
 
 #define ENETC_SI_MAX_RING_NUM	8
 
@@ -1180,6 +1181,8 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 	if (err)
 		goto err_netdev_create;
 
+	enetc_create_debugfs(si);
+
 	return 0;
 
 err_netdev_create:
@@ -1197,6 +1200,7 @@ static void enetc4_pf_remove(struct pci_dev *pdev)
 	struct enetc_si *si = pci_get_drvdata(pdev);
 	struct enetc_pf *pf = enetc_si_priv(si);
 
+	enetc_remove_debugfs(si);
 	enetc4_pf_netdev_destroy(si);
 	enetc4_pf_free(pf);
 	destroy_workqueue(si->workqueue);
-- 
2.34.1


