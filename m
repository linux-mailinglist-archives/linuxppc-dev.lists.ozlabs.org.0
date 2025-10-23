Return-Path: <linuxppc-dev+bounces-13185-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3EDBFF63D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 08:46:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csc5819Tfz3bd0;
	Thu, 23 Oct 2025 17:46:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20a::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761201996;
	cv=pass; b=On7G+KUPEkKhh3+ZN20KeHlNzRv7q62y6XPAnvuOGVAnZNxaWEKxGdFwPqYWoT6MoyCQlepZVPAMWvg9Tm0eWPxd/Pt7gBKWI0EsAkcAWMCSzhQ6xOrMVnfXRpY2GUvLiIbWs1g0xF7GlzyiJbHi/hIz/ZMSHrngOT51eqznwXx7LUcnDBu/SXi2V4+9b3CnLZ8C5r71m8HlKvlzuWa1flqJjvjvExVV86v+Q45ak3ZHwpMiWgcjNJOkcSJt+57R/0xtTbFNoz7zXMw+sLF5cMmfN0S8w27Q4YzSXutueAcQ+JvRXflSUvlcNxo8dWOn/rpOTW0KQBgcKn0U68SlSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761201996; c=relaxed/relaxed;
	bh=QCb/xkwLUlQVVnKwYCV9Xi11pTwlAoCTP3hYs/qNpyQ=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UGXv4lBvtCCASjKB4hWtvT6mIBu0yZ4g3Cckx6Bji7r5yp/kifvp2nSqDFO/WeoIougezzuOIsK1NF0+DwW3Z+8ATJeJnX0SyjOv0L6WI2G3mJBJTrQgkMEXGLwCQ5Q//zH5PY81arAY4ZQJpzVGba8BAlbdVUXLxsnEFT6m/n+cJyDEVjFOk+saWRs3wT6YMEtxic77KsbDTi2mN/oYwIxeomhN+NY9GPt74m7rkgwJwFDgxFMVJlkE9Ai/aRQg2wJD9YGUgAXNo+HDWVJ6wC24eJuOGLqVRXHuTuLMlUVbXCP+BUBRNJ/NuNdmfJo2xZyxNyFdzYEutayYWMcU6g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=lPPCyHvj; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=lPPCyHvj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csc556jyLz30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 17:46:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZLw7JC493fjS144mP2TO2SvhUAcLWs3+ks3SinXtbpxMpVDeSdQ6Df6Wd/NsrFievd7ntF1fWnJiA+bshbqMgrTXY6bvYXNLdJ7apCstAVlYeQqwV1OqeGz1YHVvwJAEQy/qt4Sqy7VJkQwgGKeQjkOkGHEgt4Otj1W0nMOgfYIgwpoT9nTkQrU8MeEeAliyRUxMzeBpDAPYklLqPhG/GfVRoj7yk6fgw/8wdiLH2DpxHWFmlmdbjDvYRec/sxZ2StBIm0lSsddLdmaGs15PwvUcg0TBJ/UYCeYnZGuHuk8O1iTF8shGzDwIALSw47JMl7Vj7pyC0Kr3b5I4F8FPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCb/xkwLUlQVVnKwYCV9Xi11pTwlAoCTP3hYs/qNpyQ=;
 b=bIjYUQoD8kX4uA+BC1GK/rA3v7hZxCyTKPua5DSRgWZ3cOtYNd/C5N6IZaOG/1VA8wUAS/9PMr4wAsMa0xaPEVhoV8LRmjVgpfeRu3P4mGzvz2lRv82NIUMcAx4DFD+6bz3J4SI2xSyJqmSDe6Fv8wYl32TX8XOaUYMfqMMdG5Jc2u4AK/GAgDPkaoNfGKNQaCSm5TXpke/81cUnekd3dIwLWCFd+VeiEGWVYVjnGOM+6s1AETI7pO66Vqghbwv26scnJ4yLKSNmuh93A/4fpbkefXOrz7AapebUcO6zLjQn8VoWQ9vup/mTUnAmZMcaHIhlbWY3NjNobpVmKQ1u5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCb/xkwLUlQVVnKwYCV9Xi11pTwlAoCTP3hYs/qNpyQ=;
 b=lPPCyHvjaAn14UK46jc0OwyDqAdsfzdf91qy4QfVPVkG/o54bj/mXffNLmsTqMPCFvMT60kRsS1FxxBssh5WmeWkfGKQILM4UhxphmEHSl9tbQdrLvcbdWiDyoJKQXGyOucJG4Fh8MOAAtgkQ0u7tO48poqt7eEDACsEQLyCsYS+dQhzrouBpf6Y+yBXvpr/yN4ftQoaAM8QS7IV21381K03Slz46URSyLVEe95GB3mW+zrfU5DdbfPO7e12IixupdPJkNPam+ziZciG1mcUN1Nv4+gd24HTOejBFvUOFEek1yl8KljS4IhoeXOSG2+fEu42U37vqLwQ9H2F30QE8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AS8PR04MB8006.eurprd04.prod.outlook.com (2603:10a6:20b:288::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 06:46:06 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 06:46:05 +0000
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
Subject: [PATCH 0/2] ASoC: fsl: correct the bit order issue for DSD
Date: Thu, 23 Oct 2025 14:45:36 +0800
Message-Id: <20251023064538.368850-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AS8PR04MB8006:EE_
X-MS-Office365-Filtering-Correlation-Id: 987cce5c-5424-4dbc-9f40-08de11ffd6ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|52116014|366016|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G+ovGP6HQwUm8SZyvAz0OsRc52Fr7+GsVxAvXOec7NUy4A9u5XgwYFAwGAKZ?=
 =?us-ascii?Q?vDU8gAM5nEDTjs6GGKhPA0nuw8xWRNg6ck8iLN1hB7l/g//t9WQEH1Whg5Su?=
 =?us-ascii?Q?vVHLotfXdAWEoc/kXl5lx9hhtDmKuMq4AYl82I6qAZXmKhLDl8LNHtPkv6iX?=
 =?us-ascii?Q?P5PhtAN5GcjsabPEYNWVh2c2KyFbKeDnrNioChyiG8AYCEiNlyfaApja8nQp?=
 =?us-ascii?Q?9We1SFzC6sX4DCIeptM34BWAvK02NsbwjXZQ/DcJ8nNbflCJlKuLTU8nscn4?=
 =?us-ascii?Q?DdmkdzUkHD3PC2eDe/nYSr4JgEDor4xniXqeLTxhcnSKTeEumpC0leh+FSal?=
 =?us-ascii?Q?k/YVbrORk4y9jf+FUiSyEA8h19fxTcajFSHphXfqbBYXyQ+R8oH1qIHO+qRs?=
 =?us-ascii?Q?B/MCr7hKd5VQefWFZdKGAEtpCIb5JKbIWZlNCzqaI0J0RYLsFWseGUd9VMVm?=
 =?us-ascii?Q?bBSjCLdcJzzucU+5SPF72BHM+jRFDvu3O4Rs2TFgGy9PkUqWik76WIZs9+w+?=
 =?us-ascii?Q?eTrrab7JDHNz9lbL/61bvTpz4txDoSiw2Y7RGahKQcuSDBHfHtMibCk/a+d/?=
 =?us-ascii?Q?DzQS2D3FsFG1rtLdgaQJY2RW5Lw+vcXrCXwnvvyF/86mIIxwyLWbUzth/1RG?=
 =?us-ascii?Q?pz34wgeD9TeX7cutwIYw2fB37RSU0zqo/vtPWb++4IypxxQBLY1hdODVlSRZ?=
 =?us-ascii?Q?xtiLMPteUUbQKSjPm392d6cX9CbvQdPsKmBv8LPK7EdasylFadBrIcXJUJZk?=
 =?us-ascii?Q?zwHUHshVZh3oQkV5z7RK/xSjIRpoGPmQ8KUIxmJkN7omcgHEphYhZ8Mu2cWp?=
 =?us-ascii?Q?B+7CcK8ItYdiNBI/XUg++vjV43Nd56rHC7m1qVpUNNKKjH3lckniQcz0xbyj?=
 =?us-ascii?Q?rL4REgngdc9pP1IvpKJX9Z2zNmf1xRgRjBjSBmXR/9px8z2mLAPk/QYhRvSK?=
 =?us-ascii?Q?lr2g6O79RGIJGyCcF2MyOWvYkJao0QMsNMIdP/yt7YiXtsVQMNtWu+b39eUk?=
 =?us-ascii?Q?Wvt6ksHO1kM+Uu3m1bxhBtxUUuaOwFan8zmBI8qUqIwXCtNzGwc8qlY7Ylra?=
 =?us-ascii?Q?nU1PzJZjRhRpzRncgV/2iawLhRLzgBzNLSexGizvz2Qpo/Yfxlp8auYBnBds?=
 =?us-ascii?Q?DDLUB5xK6/M4oKU0OBtAnoz3vnn2TELUWcbRT5lvAFcYwry3j5Qu5KB27Ds/?=
 =?us-ascii?Q?/CSu1GF2rUlnwewdH1xpu4ij/Lteppj+jzpYsWYDtkQV7i3Zk+2awtdgVprI?=
 =?us-ascii?Q?/7VA56l1wpkZq3Vi/HgtG/ExnFw1KrHMWjZzaWXGxCKyWB0vNQDyDcSX5JM3?=
 =?us-ascii?Q?FehFfkuy3SEFOIcWWXwyQTpLysh8ICxplOygQiYx7QvspS/tofxDY6ewMdNu?=
 =?us-ascii?Q?MSE7K4QCWRNz0bx+DQR54zWhhMkAsNUIKdCpwODK1lHWqjTGzq26NavrK6SU?=
 =?us-ascii?Q?HEhsOIWspnvN4FD3XOiXqqQUeqIWEB2x7HNj197cCeaRHzqUnsfWaopeJ2XS?=
 =?us-ascii?Q?iyr/JYV2j5s0/EU9Txmmtalb4RbG+OhIOEd5k7Efz9uQ2XJuAfVZlHMukA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(366016)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sg/Du2O5B97sWkt1sa6KtD/Xq6TeCvuFTZ217klgHFUFJFjyvcK9fbSS6759?=
 =?us-ascii?Q?mKfwFet5h5DcV5seIVYroeIDd98xSoE4rsV1idrs4a4+j5FR6mMvbYSCc5C5?=
 =?us-ascii?Q?iZ3Mu35JRAjocP4pTanZnoIFUvsqMqLPg2LW7VZq5r5lehz5MnUXT+5YA5c5?=
 =?us-ascii?Q?LUh3TiJZMm3gN4llVwB0kjeZxb5RIknK4ZBJSuZ8JPw94siPQK0kja70QGRt?=
 =?us-ascii?Q?08OT+VbADKhOYZqyHnGkYi0YA8YzrmOf1KmRJrACUujrGkWFH3kmkrCtTzxq?=
 =?us-ascii?Q?w6YpRTbnWlFUzk+Biek72h+RgUWnNS80xDqmxstLza/jG3xdn78ulKMEf4LZ?=
 =?us-ascii?Q?OmNR6FYRZBJWRGgsfxME+Q3dH+OyVozHwZASFTRQDUoJ82k9ife6SfM5Jn1p?=
 =?us-ascii?Q?i5TuGbO1S9E56YShj6+gvEbNS43hhKmKAz8UcdPRylfTYgQsqOeo5VSn04XJ?=
 =?us-ascii?Q?Vu8R+8YIde9YKbgylblLD7Wo6Ik99dg36Q3UqJIX8uKQcVIwo43PzOkOQdIW?=
 =?us-ascii?Q?yBrPiP82qHBqkt/Zrfta3/OkUIwKR1V9aRPDl/mhsMdwQ8PT+tvBmryEWez3?=
 =?us-ascii?Q?hl8JQBfOGZoDnU61XyAZY6kj+/lWjEbqIfphPFUULpGpvV9k5SGtbk80eyrh?=
 =?us-ascii?Q?MkCWFJVWBtqxyFspYTBp1GlK+p0k6CxJQqh39J4UZ2DHT1PTMzq3TQMFxffs?=
 =?us-ascii?Q?vrOX0w8ZRaquvhLl4/dw74daTNEpsDO1+axSRQFs1KN0AQ15T+HbbhieB0lv?=
 =?us-ascii?Q?uY79e2KewdU3TPaTVl2HEGwfvKCr64r38DI9UPZ13lTqIJ4M/9u3LWxFFrMv?=
 =?us-ascii?Q?xC1hseOlKu08acKttnFd8ERmJOGkqh1q8UTFAoPgx3Rz81j8xYkVY8p5SoDd?=
 =?us-ascii?Q?TMTlmxwUKFxb/AYqEfy294HHz0zlI/XYSpS4Z8mPOI232zU+oP/4uGwzvAdN?=
 =?us-ascii?Q?xB+ClHsd/IU7V7TxZBsLE+KCjf0besL/MPCNiMxv7OhL8J8hO6wep1evN85p?=
 =?us-ascii?Q?UG/l+4bo/+R/fGVsrwFGiNRcbGYFaX2DXoIIsCSZxcG5eU1Jp6zy+N4MZUxZ?=
 =?us-ascii?Q?LWCyRjJGAjmwYR8pezRynmwjY76GHgq97GhVHqJTc9oLmG0yaHBitbQPuqjk?=
 =?us-ascii?Q?3n+ffHf7bcA8sSw4Vuy4Zm5kUCSkWfOywULBYAP6Dd3JalPLiWzygvG3nKtH?=
 =?us-ascii?Q?FGSj314PPqo2zW7VxfnCZxYmob2ZLwp/blS5xhYAUFgJIjtoXXiS0iNIOCTX?=
 =?us-ascii?Q?eQRDCeDYdk2pT4dwq1TM7Y0Z6E2EZQh7PrMo/3IYrGBSBErz01KPxZiYKwLx?=
 =?us-ascii?Q?pFqUzgYvMku/vUU3D1okSJqU76tlfF+Vc3SDlj3V4vaeDLJMN9T91LEPStF+?=
 =?us-ascii?Q?IHSMaSFppTXImm6VCF5OEECjw4k6T40EQLTu5+sILOywV9CEuhCaUMym3GqN?=
 =?us-ascii?Q?8HUt8YaGd/hGY0s8vChxlDHhDVaulg29C0diP5fMtYg/h2fAWNC7HmweePY6?=
 =?us-ascii?Q?LeR03fkidou/toeTMwB9pXp3Qc9nRhaloLRXvAS/FXwfRRf6s4u2LzI8sGCV?=
 =?us-ascii?Q?0Ybb8G2rkLJvUedmPPrWqdRSE3EmYyIytxgeXhj7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 987cce5c-5424-4dbc-9f40-08de11ffd6ba
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 06:46:05.3678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvnAaXWSxvkt10MVKVMhglTPuurLKk6SwOlpiFC4zTJ/3oHrmuKP1gNRrrK9DQSm8IEiL14s1ltir8nwoYMONQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8006
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The DSD little endian format requires the msb first, the previous
understanding is not correct. The issue is found by testing with
pipewire.

Shengjiu Wang (2):
  ASoC: fsl_sai: fix bit order for DSD format
  ASoC: fsl_micfil: correct the endian format for DSD

 sound/soc/fsl/fsl_micfil.c | 4 ++--
 sound/soc/fsl/fsl_sai.c    | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.34.1


