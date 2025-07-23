Return-Path: <linuxppc-dev+bounces-10371-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9030BB0EC18
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jul 2025 09:38:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bn5bD5Yc2z3bh0;
	Wed, 23 Jul 2025 17:38:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753256296;
	cv=pass; b=YYIc9F8Vs1KcnYBXehn+Z4XYe67u4S7Az5f4X38fzmuaXdCTHGlrDFfsuSwiyP/lNr0ZhEBCYwwVFZAky/j64SoelxjCuXGOlnTrG3ODzjDLTjen6iDacIQ2w/y8SeWGV6r+q95JoLGrSozBFbVw6TwdkJbenXrJOEaXQP5jXVGMPlCM/BhAKjH6Oa+G2slAxScPlvC9auWGGDS5wDO0vJcbFCUS273wksV3N/NTSUmZaCleJs2ESke7HYqNl2eUP45mLyMx2fryaX5FD+htdUt9oWJIFtfTMNw5IKCR6eouom5oTgvNqrhChwQ5pcekE1VgNIHtGI8WzZpw3dt8NQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753256296; c=relaxed/relaxed;
	bh=zUCyTsJO+X3OhpTIN+eoyeRZuPBHJqWqrQz6V1iDPMc=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bvQf3zE5pA4DRTs4Fttom6dZNLDeSzLL7I4Ps2TeZdQrdHqNDFf+XArEO1REDQtgUiATxI8jk3k/ANIZVV8/g9CxddqDWgfw4TYCNycbTtWuBCqM6SZcE1AdindTl1B/zCQnnrmhx7sKBZ3Cl+zaGLDAyKGkZCNZdJdJdQMK0+FzLHT9jDEAYqWGH8TawARe24Rf/CktasCWN6kb+XfLy+ERz8WzI7oPqSj3A9lxHW0JbH2ytYTGPR4f3E1Ro0zBvbxoqnA50kp80lmVXSuB2zu/XagrDCIqznFSaztibhWFQYcRUgWFf3ZNRb+YcbngISjlaLo3eTAeju9XwhzWhw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=U013ZNhA; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=U013ZNhA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bn5bC1G9fz30P3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 17:38:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNpHtKftrX2vQuurBuQjx3IUuKAHoHIHGSsyxwosAsoiPOKShCaK5TdaY5P7IsAYKo6Zsje6VfeBGxapyvuYQ5M9RVY71YOiPV69EERjL5Kc0fzf2MnCbkV4z0h/T4gYtMaq33bshwLjETvB3vO8rdORYQ+GzwHJA2j49JewuR/RpCUAheUkIsWrSHB8YR1jSK2+hRg9MC+YiRglMxtL2yK8IVGl9BRVJyh5UxVTt0pkZqWfCT+55NJFBRWRYGdCIFUHYnH8NpjD02HMTGUrTGBb6ZVdTCJ2iXO+d+puhojZ766Hwi+pkPdrHOHrSP+8zGt7PWCCqock+kk+YrUhAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUCyTsJO+X3OhpTIN+eoyeRZuPBHJqWqrQz6V1iDPMc=;
 b=W2mu2xTuq3jnbN2zIG3dlEE191RGOougUH7Fi8qJboXA0mRvjMwaelKKpw4LJluIKQYdnKJBkGLxnx6/l6Uuq1zQGeYfBMwKTlqEw24BjFc3v7GWPGKJxYm3RrxX+x0I99JrNOmNXeXDtTw6+XJvDurpfPzZEaKyeseVAQvbmcuMmpu9NWOO+0R5/L7qZZ7SAr6ZwlrpOMb61QCVVX5s7+Ht2os1PtGhIDcbBphqJkP2mknotb+6nq+s5OsthX/2ZBNX68ZPgl4e/uAS8hTvRGx6UqtcK2R/GBzbtNCiov8GornaqijPDdS2Ad8QEy/NiDk54/NSqtEmod9Tjl9xzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUCyTsJO+X3OhpTIN+eoyeRZuPBHJqWqrQz6V1iDPMc=;
 b=U013ZNhAj/DFKmtqpC1u3pzHiPnekvPp0H6uRbXqibist34YcpTm2DnnOiZRrPBLXldCb/lqL8FXC5GBnudhCFg+tsxop1QDyi9Tc3GWZHyizJFlL7GOQh1bYjjPOx2S2ZrP/9jAY0Blmr4a+ALk4S02Evi2G6pEjhVhLml/tYOZCGQJJzL0f5hLHHTL8TONre5awkWTPIh0amE0DCNKQ7kEVpWJkXtTa1UCW4A4EerSojAJqfloHaSehObihhNsOG2NL886KWPBSiFYN9o1uSTkU9dJ8rkI842vyGTj6e0qcAyrRAGYrQf603B/7M5P5zCAbiA+0JZajI4Fu0fXbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by GV2PR04MB11094.eurprd04.prod.outlook.com (2603:10a6:150:279::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 07:37:46 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%4]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 07:37:46 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] ASoC: imx-card: Add WM8524 support
Date: Wed, 23 Jul 2025 16:37:25 +0900
Message-ID: <20250723073725.787844-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::16) To AM9PR04MB8353.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|GV2PR04MB11094:EE_
X-MS-Office365-Filtering-Correlation-Id: 79b4291b-2d8a-467c-949f-08ddc9bbd142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cNZlxdBGcvR6TRGmAUBnjp3nUVh8BTifEtgovdkqvUkUXIfHvBQk/JQz9MYi?=
 =?us-ascii?Q?oKZ2f/FMVBObTDpIOiHwAZsGnWJJvJk3HsGl5M8f12aXGDo4SZjoEUl8F4zt?=
 =?us-ascii?Q?4/k0BfE1mm+uBLD+1l1COQhAhTrmwL+0xTCyBc2q9thxj/ATnftgUBzlLRZs?=
 =?us-ascii?Q?y3zm0ADo1Z5SpQfzjQEp9NmRd+Pz43Tlq5gh+Ne5E92NwDT1+qENLgcGJvsJ?=
 =?us-ascii?Q?C1cpJ2884I1xTchXt+zvIj33XdCkWmW43/ZRpnnAdh3M+brIUKlG1oMMiOZs?=
 =?us-ascii?Q?oGeWNBqptgE/zPRR3sjQPiKrYkRMEaNIFI5icMBxYWstLU3PeOa3EdYkoj45?=
 =?us-ascii?Q?hqvetuKaWdPw5a0EnmzFrUVM1PP0bYI0JFImNm98gu96ROc3Ne9+3XtwahJG?=
 =?us-ascii?Q?TibGyx3ZvtuoWqtm/Pc6F89mHHhBvscZTj+9GP8qD4GB4j1GCR55R1NfMu1+?=
 =?us-ascii?Q?dG4BT00pV9hCH69rqLEmol1Dq1ShCJutIlXaIhqVYdEPJhF55/d7ya8KwknY?=
 =?us-ascii?Q?3ezAHZ3966coXnh/q6rw8vSjN21px5xe/e3NFASbfUNkse3fd8XvYe2rc1g7?=
 =?us-ascii?Q?IWKrbu4dYZ4YB0xFysyRJwhsc2cVs6XHLfdsHjuXqlnD2G3NNSCIWbFkOsPT?=
 =?us-ascii?Q?yy4y0Af95XVY7jNAiNagshcGUwzhm2wGExGCRpENZ3dKFFz5yNXg7UzkgDLK?=
 =?us-ascii?Q?bO9DONBWQNI6LaTGtTQ0EH1Eyo01DPsDrv8G6vpOM2U0K0CaJnj2PrE77j8N?=
 =?us-ascii?Q?aEyI64BHJn3/Wi3N7reTjDAi7Q30LgnWp2CwlqRor+/iK7qZGotM38XDfLVs?=
 =?us-ascii?Q?PdQf4vVFTClB6/uPbMrLkhBNETfDlRKrP61HxNwhEd3gO7XexDq3nmJWOd7s?=
 =?us-ascii?Q?3s7BZ5ZCUDyUKPtS0TTp7894A/x9AEXT+KNj5SWdurQjOG8IZ+b8r+Q1Mh2j?=
 =?us-ascii?Q?XOcaARAjIS1v/lbltFifpmvIBd6nU7dCzM/HEqbcipEejJQ82tyocEGorvB2?=
 =?us-ascii?Q?8oUYdXwmhmo3cRbm7/Dxfig4W0f5fMklVVuJ14nE9WISoeYEGzVsJ+xn5ubo?=
 =?us-ascii?Q?BqE++j5DIwRKqwH1w2/3bOOG/b/ItHEiFssgXm9Lf6Nv94e/fn9s6DZxpXqn?=
 =?us-ascii?Q?OjlgvAzf8q2OoUyJNGC8PNOXqPw1JNqxs3VuXQFxx4ha7ND47CWNZI6NfIq/?=
 =?us-ascii?Q?DYDB2NHwPlBXJHdVO+bflzN5bVZeIilXRXy9+LLwvfdoLwaJ/EbP5Vfid3S6?=
 =?us-ascii?Q?bplYlTObqzpVSbSmcnSd2+7vZnlKFA5aBF5ueKT5HalWANNOnfLvgy8pMGW/?=
 =?us-ascii?Q?YEz3KvOtcnCB7NnETvRpdGnEc1B3U3kcOcuHljkWLij1nQTEnBvZgiwMeRTA?=
 =?us-ascii?Q?iHy+dR479i/HbVIoPerUtNvl3AUbpnshTxEI4wB2JmWTf1FzlVRlEYpQmOe+?=
 =?us-ascii?Q?LcDGfemB5ZvPcxfXJA2qOWlIygq+xONWk+iAL/dYdxoeeCDvofyH4JxaVGvt?=
 =?us-ascii?Q?IgxLEqdHmjCY83c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lLMZuuWS38XMwf4jt7+oX5QEh5k5UekoqqQgiVyxR1ODSwdKrSOG+EjY17Fi?=
 =?us-ascii?Q?baD5nkOu7utWVmW2f5clhY4gYrENW3NWcTFBhyx8hf86krriWJsFO3nefGUV?=
 =?us-ascii?Q?ItGN8bRLEd9p4D46alsL+9Si/RQNBRWrDwkk4UAcGQmqn3FH+Wh5T1JTEHw1?=
 =?us-ascii?Q?0vaoGAViFzCsTR26aVaZC0UYqSrUGdEOUZN/68xqgG7o71+08IYuPDOPkTK8?=
 =?us-ascii?Q?+Vc0XsY5UY2pZ6PPN0clwrq6mxKtvd/P3NzwoWtUdlgILVfcPN6hLsrMqVWm?=
 =?us-ascii?Q?Pem1G0VkKIDC/CcPqfDZptCXSlv8ampKNRxpw8gr0Q5x35nlcz8wp6NN/Rwa?=
 =?us-ascii?Q?ezg/qaMa2qRbnzhOzAIG2qezGezEEQjC277zKTUoMDQJgqf8+/jNoWgkfxO6?=
 =?us-ascii?Q?AHYcVQYwPzjRo+MHwzwAFpgjPq6oVFapo7Jhr24k8Rj4w1UQg3SAhMc0kA5W?=
 =?us-ascii?Q?HW4MrgB9hEK1hdObkDTtCultM66N1AewMO704tTBZRFxKNjjsfLCc2ypeRGw?=
 =?us-ascii?Q?2WHk1+xbuaJHT0XukPkU1G7ZJXPinBUmIsrxu48GWR0sF16mFqDb+ueyStJT?=
 =?us-ascii?Q?YFitgf9aCGD7jxefOK1qhZmjJc1qUHTFbWoOcTiqgFA+BM+WGQ8TVGUM3lCV?=
 =?us-ascii?Q?wiDagEbHtOnlmZqh0Zciz5SIHaU4QTU2FJybUAxqyrLvlB4enlfBu1SI9GyB?=
 =?us-ascii?Q?JeFpKzfpToyHx/aPc+cOFzasBEX3lYisXSzcZSmgl4wYQcrsRTmoJIeyx300?=
 =?us-ascii?Q?bdJv9hGn7i8jtAYiHGFeZASuMmNYXNX0ZloWbuIUkSMc0k628qIDk1gGt4tY?=
 =?us-ascii?Q?tJGWeaWGQfKvfzaFamvQR9mJnHCDVOaXJuN1TSMdVhDKnNZzmO22125l/b9w?=
 =?us-ascii?Q?C56+8S0eaShyKzHlpxW3sOrWAcEzUIG2Bw1Mr/suS2EvzLC3ITTCZqlWMCQK?=
 =?us-ascii?Q?NtvJUMS5UaURnFba2elQDKnOcwBUXQchztrBCYjJOjeu9LN9b/hcfqBfhq+j?=
 =?us-ascii?Q?qDG8jpA51WwXTEk4NFf7VlJEOmj5kHifs/0CBrE+SCDeDaJWlKYW+iCKVcCx?=
 =?us-ascii?Q?H5SxWc2jWk/k3WYKRNyxbkwzvBBUI2tJ/90aT8XZYUvbL0tpmyrCsq5TC/5T?=
 =?us-ascii?Q?fDEREZryiFb94jTLdXqFjNL1BdkB5u8UxgUcIYHADLbI8Tq7MkSafVKmfG3V?=
 =?us-ascii?Q?qVTnPkm09shY51m38JZP7X57lwTCd5q6oRAOGWHRD3b9LeJdUESU0nAh7GNW?=
 =?us-ascii?Q?GdufwDp5UgScI2H57mFKJwGrI+AXC6bnGnGMGF/skNV0zHWGgW7JeHBYpuz1?=
 =?us-ascii?Q?E4yOgAmJIRUNBcXXe1mhQeLlaU/IctmE6zHg3Nifsi033bG6qktywqSZJXFo?=
 =?us-ascii?Q?1rc1kKboOvWkvqY4NEme7pP1z4R8kXqy+GeL3Hc6/oOJs6hL8Un9h+J1pGtV?=
 =?us-ascii?Q?Un34h2A1/CBYkndHdyKT/Q3qSOXDkq8NJtHp5rFKyRjItHwvTuZOKv8Lpuzz?=
 =?us-ascii?Q?sU0GNVhgCO+htT22yVTtyN0ttU74RcWP4SQvBntqTAzyi7dljxYEaDqE1wHE?=
 =?us-ascii?Q?IZAwEcMoeuZYt/PY9SFvuamhglqDmQg6CIEE7pKH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b4291b-2d8a-467c-949f-08ddc9bbd142
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 07:37:46.7291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7+r7CeKlo0s69TaBqdPvSfZYEu0zbxUzS4knc0x1xxDvJEFvIGT3hUleL6mAMsFWFGKlmHQQ7n6smMbQeBEtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11094
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

WM8524 is a stereo DAC. Add support for this codec in imx-card ASoC
machine driver.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
changes in v2
- fix build warnings reported by kernel test robot
- add imx_aif_shutdown callback in which setting sysclk to 0

 sound/soc/fsl/imx-card.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index ea5dbb54b584..28699d7b75ca 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -26,6 +26,7 @@ enum codec_type {
 	CODEC_AK4497,
 	CODEC_AK5552,
 	CODEC_CS42888,
+	CODEC_WM8524,
 };
 
 /*
@@ -196,6 +197,13 @@ static struct imx_akcodec_tdm_fs_mul cs42888_tdm_fs_mul[] = {
 	{ .min = 256,	.max = 256,	.mul = 256 },
 };
 
+static struct imx_akcodec_fs_mul wm8524_fs_mul[] = {
+	{ .rmin = 8000,   .rmax = 32000,  .wmin = 256,  .wmax = 1152, },
+	{ .rmin = 44100,  .rmax = 48000,  .wmin = 256,  .wmax = 768, },
+	{ .rmin = 88200,  .rmax = 96000,  .wmin = 128,  .wmax = 384, },
+	{ .rmin = 176400, .rmax = 192000, .wmin = 128,  .wmax = 192, },
+};
+
 static const u32 akcodec_rates[] = {
 	8000, 11025, 16000, 22050, 32000, 44100, 48000, 88200,
 	96000, 176400, 192000, 352800, 384000, 705600, 768000,
@@ -229,6 +237,10 @@ static const u32 cs42888_tdm_channels[] = {
 	1, 2, 3, 4, 5, 6, 7, 8,
 };
 
+static const u32 wm8524_channels[] = {
+	2,
+};
+
 static bool format_is_dsd(struct snd_pcm_hw_params *params)
 {
 	snd_pcm_format_t format = params_format(params);
@@ -261,6 +273,7 @@ static bool codec_is_akcodec(unsigned int type)
 	case CODEC_AK5558:
 	case CODEC_AK5552:
 	case CODEC_CS42888:
+	case CODEC_WM8524:
 		return true;
 	default:
 		break;
@@ -477,9 +490,24 @@ static int imx_aif_startup(struct snd_pcm_substream *substream)
 	return ret;
 }
 
+static void imx_aif_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai;
+	struct snd_soc_dai *codec_dai;
+	int i;
+
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai)
+		snd_soc_dai_set_sysclk(cpu_dai, 0, 0, SND_SOC_CLOCK_OUT);
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai)
+		snd_soc_dai_set_sysclk(codec_dai, 0, 0, SND_SOC_CLOCK_IN);
+}
+
 static const struct snd_soc_ops imx_aif_ops = {
 	.hw_params = imx_aif_hw_params,
 	.startup = imx_aif_startup,
+	.shutdown = imx_aif_shutdown,
 };
 
 static const struct snd_soc_ops imx_aif_ops_be = {
@@ -632,6 +660,8 @@ static int imx_card_parse_of(struct imx_card_data *data)
 				plat_data->type = CODEC_AK5552;
 			else if (!strcmp(link->codecs->dai_name, "cs42888"))
 				plat_data->type = CODEC_CS42888;
+			else if (!strcmp(link->codecs->dai_name, "wm8524-hifi"))
+				plat_data->type = CODEC_WM8524;
 
 		} else {
 			link->codecs	 = &snd_soc_dummy_dlc;
@@ -805,6 +835,10 @@ static int imx_card_probe(struct platform_device *pdev)
 		data->dapm_routes[1].sink = "CPU-Capture";
 		data->dapm_routes[1].source = "Capture";
 		break;
+	case CODEC_WM8524:
+		data->dapm_routes[0].sink = "Playback";
+		data->dapm_routes[0].source = "CPU-Playback";
+		break;
 	default:
 		break;
 	}
@@ -854,6 +888,12 @@ static int imx_card_probe(struct platform_device *pdev)
 			plat_data->support_tdm_channels = cs42888_tdm_channels;
 			plat_data->num_tdm_channels = ARRAY_SIZE(cs42888_tdm_channels);
 			break;
+		case CODEC_WM8524:
+			plat_data->fs_mul = wm8524_fs_mul;
+			plat_data->num_fs_mul = ARRAY_SIZE(wm8524_fs_mul);
+			plat_data->support_channels = wm8524_channels;
+			plat_data->num_channels = ARRAY_SIZE(wm8524_channels);
+			break;
 		default:
 			break;
 		}
-- 
2.47.1


