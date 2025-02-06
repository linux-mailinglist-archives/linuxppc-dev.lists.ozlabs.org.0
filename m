Return-Path: <linuxppc-dev+bounces-5879-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BC9A29F22
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 04:04:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpMQG4MjJz2ytm;
	Thu,  6 Feb 2025 14:04:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260c::60e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738811062;
	cv=pass; b=D5ZEjpS1Ywh1WdSeFZE7joFBWc90W/SHcOcZopi7BqN5mtH/c6q2p4v5EXdYXimJUvY7EP2bOSCDHFXDzazhQKbuIoBBY9Yd65aDikCeCtUQnTeSCw4RgUaSjzK2toTI19DOu4serBSIMOrTqPTHPBCCmR/rhd9E4X9U9JD8N7jym/6JW/0kIhG+3wL72jHSvxW38O4K/6knxoZtyfoxnbic6FlrhmTkw2x5yWACipil+bjjaY29iJQimOl3MdLBGUSmz/ssKmJ6yH6DBCK/s4Z+fPljGGR070YAOreU/q0+e8+EuNsIAUDncqLAF7WEKC8kCJVZe/7ye5AC/sbphA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738811062; c=relaxed/relaxed;
	bh=eZZu3SyFTXv5NTW/OtcDsNR3E6Yzv6jNXeLJS44Q7/o=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=KfpAFg3ki2lOSpFBhtuCwbRqPqy2SKe2KDt070e+yMtaBRAvUJWKKM3FO8NRtQ5Xf9bd5Xu+MLt1CaRyRybq1YYKgCLq4yLzFOTKScT0KdGgbcKw/LNBc2BNWYxBfYxi7AP5j5/tsoKJPfk95NV+xHvabcME5l42J6fU1AdTFVsU7FpoWpurIXSrDz6hgaERjr5BjNds0hin4m7pGx/xuTYYWS7zAMWHPiJm0E7cV/J3gh2Xir7MAytOHIIgHu7YZLjpahTcB7nP/9TPAn9sMdlxSJeaRRXrUeIrCRak8/mQSdU5Oq5hMIHtyRsF21emyHLxWkSTq3bn0uuLSWO7wg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=jPoNSZKE; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260c::60e; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=jPoNSZKE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260c::60e; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f403:260c::60e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YpMQF0sbSz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2025 14:04:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PC88sFrqpGbejjSI3WWrFKWrgYInNFwIhnYqX1Xl4arHb8EqEcTaH8ANqdnN2kVX6O4UE1MMQtE7EtdThchb2oyHuvwQ8+hsih8ZKdJ+3mWB8zO7KkfUH3MyS7PsINdV090A0JhLWH/R0mfy6z3vtR6ZaoocZEoKwurD/ANAANEFqsReM8iVK2kIVS5/jy55vs9MfDyJKt8RTGr2c7AI45stD4xh7Y6S98fHi5HQLQbu6u0+1oUeaVFJK1E1iSi4LwT+oJzFIC19VB+ORGX1+ZDhtL88je22+gvdzG1Cdio6PHAjxznEh7o0ZPy6AOtIbmN1TFZp2zV1NwoQT0IWFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZZu3SyFTXv5NTW/OtcDsNR3E6Yzv6jNXeLJS44Q7/o=;
 b=ecIMLlggr+q2dTSc1Qe8OkBeA7hb1N7Y1scrT8ZIhdxueLpmaGXtXoy7PAhCNOyzhpD0cVHKO/pQXBeNaNuqN7x4tQ6le0b7AEANS7dhCvK+WhSKbUGcgbA2/Sbh1qpBjU/grC1LjIc3UFaFK3YdVz+7wpE0Wnk05G7VhS2FlLaj0A5qEaU9rjQ5jHbvc43dtCvyhE2QbEjRo+6pFlb6toPZCojqY2/j/hIf19L7o3SZq4wj4OX3nresXz7o64ql9jXdJ3YE8xqGKJ9ivGhijRTaNbZDmW6sVIba4e0DkwGptq43yIWHWf0ItRTViqxyxj/JDqtY4gDrQKCD/v2B3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZZu3SyFTXv5NTW/OtcDsNR3E6Yzv6jNXeLJS44Q7/o=;
 b=jPoNSZKEc8TpDRAbWyy+bxsMwFPva9T/KJZM/BTmfOrjmNWpVSB9DNhYT568iCULw+OlJyy1uqFp3xgPIsUNdq53LaFntOByshMQy+GF5toVCS6vCN9rosM8Ix0lL21t7J2ikey5nC5qCgNqthP+ERIFlwfxHqGWoBZcxqnuuJrnrQQejp2zgLNavGH5pr84WQT8pC2bu7TRpQtcdkGyHHT8u0zNn1PjNIKobD2EWNUNGyNeuOzOqjkJYW8hfQHCxWbZMide9qpTSac/gAShNfXe18Ke2w37pL+Xc1/1+eNUMFttPkiEhSFcqZquFnFyVmsccS4zC47B2DqOFtA6ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by AM7PR04MB6840.eurprd04.prod.outlook.com (2603:10a6:20b:10f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Thu, 6 Feb
 2025 03:04:01 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 03:04:00 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_micfil: Add decimation filter bypass mode support
Date: Thu,  6 Feb 2025 11:03:06 +0800
Message-Id: <20250206030306.2618620-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::7) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|AM7PR04MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: f30313ef-4660-4b8a-c444-08dd465ae770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mh1UySuqoRk/XyEPoIgptWHhfwpHZB3T5+WMMp4ITHW6V/48M8Rilgo4BCAq?=
 =?us-ascii?Q?27YVTYESQdekQNhx/cfMIlNMRMhF5kZfslax+mfKqgOVhirXZnBFlNQ9kc/S?=
 =?us-ascii?Q?FDaQ2iS2Msxo4XApJm/RliY2snL7rO3sWwqEIqg+LyKWk4KUgSCw9eIMMvsp?=
 =?us-ascii?Q?dEzE+9MwXlX2j67Db3Tmw4y+1zbJTTcT+/pU1/LoKpkQr6dl3nxSLzBQgUtD?=
 =?us-ascii?Q?pi4A2IQNenkWPB7VT8G94j/NZqqTC3q+XoZlUf3p8VPClLUoRXgpWjfiRYqC?=
 =?us-ascii?Q?v1WanDTcatTZAHZp+16go+ulcFarqd+VtYUmJpZObUpJGJDfmomkFskShTpr?=
 =?us-ascii?Q?WMmJ90/eQ54A823AzEYC7kHT23C1LRCG4dQEa+ar2rjZc0HFMtD5yD4Ycqqd?=
 =?us-ascii?Q?invNiwUBEmHwDUsuGxAtW/Fk6sXg99mhaXK1yFW7vxRlTKFxJ66pLf484Kfk?=
 =?us-ascii?Q?a6ImSVKlyJgdGBSfbkbNJkm55JwqdcMGlRHgLu3lG1QwE8ktG3qnxu+mqDM2?=
 =?us-ascii?Q?TNtx9imncdGBpIrLbGMd4d42YlmwgcYzYMYuJ7pahQeRzF9wsOazH7GVwPlS?=
 =?us-ascii?Q?UNp0+ZGYHFRHDA97ABkuQxUQe9zsRA7s7O8fQKjzIyHzchCdec5/muaRUEqP?=
 =?us-ascii?Q?xattC7DOpx4BDhIlLE0RA6fkfB0X5Gt0xJyC7LhZCOu5/bgcJ+nvl/yJ6RKB?=
 =?us-ascii?Q?eZifDO03GXSZIlK0BuTa0cpUO6f5tXWPYn/CsrGAzJcEn9E3p9qD6/wUVuAs?=
 =?us-ascii?Q?D0YMWaYwuyaFnq39ZGYOnaunbUDyk2SPUpCZYULZZcn4vadgM50/xtNoOUY2?=
 =?us-ascii?Q?lvd7FaoTsGvy1/jYFJdRyiifN/Hy9VunXWL/4D5WMicgX1q+Gz/BCwjuaX8S?=
 =?us-ascii?Q?UNaxsDBDcrFHtp+4NEvt4vDEiA7wVjMf7oWws9qydLkPdZQQytoM7T3XJxdK?=
 =?us-ascii?Q?OQ6eQeuy5s4RPWzcy7Ee+C17t1JHtwNolw/nGHKpQDp09sZ+UDWs6+pKw3fC?=
 =?us-ascii?Q?9CZRCtMI55UUwJSU7JsG/zaJmxM+uqhLtsBX2Moplf9HtChURCE/549zk7eK?=
 =?us-ascii?Q?uEfoqS27wkaEwL6CkQ+41KrqBmn1TIAv+JYj3KrH9btlqaiVM/q6VhkxuMYo?=
 =?us-ascii?Q?rlmyrnmMnSTXZBPtqhPKrPXlZMBPeCzqwxNpDeG7dbQD1nluZFpwHJXR1wru?=
 =?us-ascii?Q?vKXAtC8royDnWKS7dwV8YwP7IZoBmB0+86FVC9roArHCw9RSws8ivAAQYl79?=
 =?us-ascii?Q?JrbBoUgK0QtnEN2q4WHSKZmOSPTASqJXhMGoWmG3u8TLEzA58n93HCNJly6f?=
 =?us-ascii?Q?pfdcKdj8mjUsf3ZBi+IsS0FlOADgL7yVJLah9m8FVp/i5KuOUrkAxObiSRIr?=
 =?us-ascii?Q?MRHabfhUzVqmPOp/7tihsZVAnPp5lZlhLkBjo0/uiLfE1KjbBAIeFw0+6yKX?=
 =?us-ascii?Q?LmH/VfZ7XyuM7XqBrJCNM8cvEsYQWa451BkQnjWjItpJxS1rORcCSw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eaa4io1Y+aTC9TTRV0H0N8TNXwiOoiHfqOn6S+k77a0HBmYDeeBTfKPpJKFc?=
 =?us-ascii?Q?jWTJC+FBs3Yv96twjpo9GUMtORoSye+g8MNQGf+XmJr4gAyLQLd4l1aFwU96?=
 =?us-ascii?Q?baXTBVSSY5dM3TqluzHgC+fgRjWKqs80YeB+BL5Im8tZj/TeaDyc7T8QgYsQ?=
 =?us-ascii?Q?xhh1ImGeuBK8lWDrg2O4tGZY430QgaEA5joL0YQTTqoQ+4eRghitMK3ukb1A?=
 =?us-ascii?Q?JsJR/p3DoZ/aIWOZPFG5iInr91BUmQnKGwr6PBO3KqBZgcs8g3GCT8Y/QTxu?=
 =?us-ascii?Q?xqP2x2SOFk01nz9zqpjyWE9gwS7Vxucl3MNhNWfNeIh+WdM1RjCHyRGWxxZG?=
 =?us-ascii?Q?Eic0aBj/2iyxNqY2mElOW1Af9Wcxg/f65cgNcGMdpRYjEkbZ4gwX7FpX6jyS?=
 =?us-ascii?Q?mTgaH5PJo7kXXrzend6bIy1yYjL9XvfbqZU+IbcCmq7WXUwvbr8tablOvy3X?=
 =?us-ascii?Q?CgbG4kmOjIcuklJN+U3o+bi6qJ+tqeWsxflsNsFd0KXmKwrJ1wCCBT6CP+vd?=
 =?us-ascii?Q?EsN2LSO2JvQNRIlXWd1SNb5ReK+1K5sDRKPGo1L3OSHlKwFhmdHcBq2tt1Rj?=
 =?us-ascii?Q?oiRkYOFTugAERTpC8beMNruMZgjlLed/J7u+HG+JK04n4+m/AYH9JDMp71B8?=
 =?us-ascii?Q?8jCAX0iG764F+cFnYBVx/UN5P92W5efyyZPryCHnhedTZ418ORq4QDdPqEwG?=
 =?us-ascii?Q?RvgB0ntYEaHCyJSMlUPT/CAuFyekFnnM6yjwdFCaDvggtak7IWVuOil6nSXq?=
 =?us-ascii?Q?GSYVIHdNRnMuCK2xb2tUMCN12khVIuMk9m7laRjKnnL0ylchlLgJaL2xUPxT?=
 =?us-ascii?Q?3JomVMiqy+cYOBIhM/q0qkBcHc3PlbIm1t8eLBwj6es9/5hlWz6wYIIMhiec?=
 =?us-ascii?Q?K7QdOBe4y5HO7sogGYkZdyBoXPJYYRmn2bzwOjxd8SpVE8XLGwM6+uHrPX1Q?=
 =?us-ascii?Q?4MdE6CVSum7SF3OUf4Ba2TjGzyIt9lBWsXfe/9fX9QawyX1QaTddS2Vq9Gos?=
 =?us-ascii?Q?FME2eqfCBdek6jf/LfCX+qlcR0e+tKXLPejSyngm9os9oq8RaTspRAA8evwV?=
 =?us-ascii?Q?lNyZMdYaAGlA379h3MDoJqJ5ssDw7Lr0CMW8+fZyR7Woid5RKl2p5ZDELxen?=
 =?us-ascii?Q?/zOv0hTwJ48dkvB8t1rrFSjU4rj7POJ9hrCeOLc2ZYunC3dUD37SeG+ZifUF?=
 =?us-ascii?Q?M7SrU7rzPHLGHgcUewr+AccZfJzSJCCs55X3LvlRLO9SV1CJr2fr8Qq7Uayz?=
 =?us-ascii?Q?I7AdYWy9Z5GOxkqwWrPW22uaSdivuNFpLhkjAoDQupGk++MjmWa03kZe9XuA?=
 =?us-ascii?Q?J+thSQ85vWlVT1knjkLb56DUAGbYh36LRdYVxY2CkQbj4mfETm6Fu5TrbSRj?=
 =?us-ascii?Q?xL50n0+Wr/Ss4h7wfumUr8Qczrb9sxvhnRb9mir8rnzi0JX/MDJH/24RM0FV?=
 =?us-ascii?Q?+Xbk/pNEn7QHQj9XhaH+PDIgkrJMwMdmhE9y5MxTVlYWqHXSC9oR4rv4Xsrs?=
 =?us-ascii?Q?nEIKNhOH401np7E9jh5JT+aul1P2IIkZZTTp56fiKV9br1qP53FyEbUtTrpq?=
 =?us-ascii?Q?6jtM8N9KO49aN+mYcwIuuh3uVNjkOMqW//iC9ht/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f30313ef-4660-4b8a-c444-08dd465ae770
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 03:04:00.6475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvS2jSLv46dEcPfMrD+0+ocWLqzjao4pPr511gIvVgUDQVa6a09FCf7uu/j8QHBZ+w1aAWV2mGU6lNxW+qU6GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6840
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

When decimation filter bypass mode is enabled, PDM data can be
written into FIFO directly without any processing.

The interface of this mode is DSD big endian format, when
user needs this format, then this mode is enabled.

This mode is only for the i.MX943 platform currently.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 49 ++++++++++++++++++++++++++++++++++----
 sound/soc/fsl/fsl_micfil.h |  1 +
 2 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index fa4136683392..73d8910a6188 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -19,6 +19,7 @@
 #include <linux/dma/imx-dma.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
 #include <sound/core.h>
@@ -78,6 +79,7 @@ struct fsl_micfil {
 	struct fsl_micfil_verid verid;
 	struct fsl_micfil_param param;
 	bool mclk_flag;  /* mclk enable flag */
+	bool dec_bypass;
 };
 
 struct fsl_micfil_soc_data {
@@ -129,7 +131,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx943 = {
 	.fifos = 8,
 	.fifo_depth = 32,
 	.dataline =  0xf,
-	.formats = SNDRV_PCM_FMTBIT_S32_LE,
+	.formats = SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_DSD_U32_BE,
 	.use_edma = true,
 	.use_verid = true,
 	.volume_sx = false,
@@ -724,14 +726,14 @@ static int fsl_micfil_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (ret)
 			return ret;
 
-		if (micfil->vad_enabled)
+		if (micfil->vad_enabled && !micfil->dec_bypass)
 			fsl_micfil_hwvad_enable(micfil);
 
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if (micfil->vad_enabled)
+		if (micfil->vad_enabled && !micfil->dec_bypass)
 			fsl_micfil_hwvad_disable(micfil);
 
 		/* Disable the module */
@@ -778,8 +780,9 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 {
 	struct fsl_micfil *micfil = snd_soc_dai_get_drvdata(dai);
 	unsigned int channels = params_channels(params);
+	snd_pcm_format_t format = params_format(params);
 	unsigned int rate = params_rate(params);
-	int clk_div = 8;
+	int clk_div = 8, mclk_rate, div_multiply_k;
 	int osr = MICFIL_OSR_DEFAULT;
 	int ret;
 
@@ -801,7 +804,39 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 
 	micfil->mclk_flag = true;
 
-	ret = clk_set_rate(micfil->mclk, rate * clk_div * osr * 8);
+	/* floor(K * CLKDIV) */
+	switch (micfil->quality) {
+	case QUALITY_HIGH:
+		div_multiply_k = clk_div >> 1;
+		break;
+	case QUALITY_LOW:
+	case QUALITY_VLOW1:
+		div_multiply_k = clk_div << 1;
+		break;
+	case QUALITY_VLOW2:
+		div_multiply_k = clk_div << 2;
+		break;
+	case QUALITY_MEDIUM:
+	case QUALITY_VLOW0:
+	default:
+		div_multiply_k = clk_div;
+		break;
+	}
+
+	if (format == SNDRV_PCM_FORMAT_DSD_U32_BE) {
+		micfil->dec_bypass = true;
+		/*
+		 * According to equation 29 in RM:
+		 * MCLK_CLK_ROOT = PDM CLK rate * 2 * floor(K * CLKDIV)
+		 * PDM CLK rate = rate * physical bit width (32)
+		 */
+		mclk_rate = rate * div_multiply_k * 32 * 2;
+	} else {
+		micfil->dec_bypass = false;
+		mclk_rate = rate * clk_div * osr * 8;
+	}
+
+	ret = clk_set_rate(micfil->mclk, mclk_rate);
 	if (ret)
 		return ret;
 
@@ -809,6 +844,10 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		return ret;
 
+	regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
+			   MICFIL_CTRL2_DEC_BYPASS,
+			   micfil->dec_bypass ? MICFIL_CTRL2_DEC_BYPASS : 0);
+
 	ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
 				 MICFIL_CTRL2_CLKDIV | MICFIL_CTRL2_CICOSR,
 				 FIELD_PREP(MICFIL_CTRL2_CLKDIV, clk_div) |
diff --git a/sound/soc/fsl/fsl_micfil.h b/sound/soc/fsl/fsl_micfil.h
index aa3661ea4ffc..fdfe4e7125bc 100644
--- a/sound/soc/fsl/fsl_micfil.h
+++ b/sound/soc/fsl/fsl_micfil.h
@@ -53,6 +53,7 @@
 #define MICFIL_CTRL1_CHEN(ch)		BIT(ch)
 
 /* MICFIL Control Register 2 -- REG_MICFILL_CTRL2 0x04 */
+#define MICFIL_CTRL2_DEC_BYPASS		BIT(31)
 #define MICFIL_CTRL2_QSEL_SHIFT		25
 #define MICFIL_CTRL2_QSEL		GENMASK(27, 25)
 #define MICFIL_QSEL_MEDIUM_QUALITY	0
-- 
2.34.1


