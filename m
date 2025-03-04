Return-Path: <linuxppc-dev+bounces-6664-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA09A4D4F7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 08:39:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6SJ11h4Yz30VX;
	Tue,  4 Mar 2025 18:39:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2607::609" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741073985;
	cv=pass; b=espk8SSDvrCbOnzOOLj2jF9N+3Gl4owrP6aYXjzmRqzS5onNz9Z1fMcoiX4kCQts672AGGW2N1NQRlJckz7kH5dMl/0+4WrQOlYyGD2XPNQwTNSgfyoSwy19uz2LkbZ/0ncyTuTm/nE1+QRg4Bk5Fr/XKsBl9CzUulH0mrCOAv6477ZGSFRrPCRJzTsj8+iH6E0LDFVfIXLX/cngR4YSxUGbo110joZB8zRUuYx/rfRTmiAqcg/TxVPh1vGQTNukd5FWqIWUrGF0tONIk6JKfeWiRArdinv48Cp4ZFbHhH6/j4Q1hqho63azWZMYc4V4xXarbARMdz+tSEPvYPfOkw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741073985; c=relaxed/relaxed;
	bh=pVu1LEIcqch9GsCvEkaQD5P/yYCQ+BiFa0HGY+97HpY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IEmf+huPm8XPBhKzw0lesez/fJOhwis/qxaBmqDusiqUj4Qi0l72KbADeFsR8HWt/vjivqcgQuacEW1/2sE4Y1cHOJwAm/2Uf6CYgFB9SoPRkmp1LUV0KdXt8jYJ/My9EfTqWeom077TZQd03mh7aNVr4hlVshr1Pi2y7mV8YlW0I/Z0Dqphfeot1R4u8ZOvNUlGpPJWPEwTSy2wEyRaRbuAPCL5GZG0tj/wNUUnbzpIjsk4LGFRcPvh6v5uKzsi/dsJLojvjNp+AbrXV6ZkY3FLF4UmY+2breC5UF7+wiXPVOfeDRl4stGJwzz1cEvMWyKBf4ajkTHAb9JJDj5QuA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=JviP0lY0; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2607::609; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=JviP0lY0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2607::609; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:2607::609])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6SHz6Dqbz30WF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 18:39:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZapaxUUvF4ld8fvGOPCoeLtYX1ZwDaeFy4iqAN76WqAFUTOnZOSHHa0PBkjN4lnKMgtUv0Pyv5rILOl2MtnDLIOaxqYiI7J2RUkrl9FUvhqzpxgIwf4/mCgVv6vXeStOaZrJPixroKqrZPUr0uy+2iUDMuALzkmgia0Uaaq40SmwEehBewhLPEorpmq0j5ugGUro6lSXnEdi5ZHhJCUkxCdv4hdnwz61IrL/4TETljG4679sZBb6MC/QW84FETbTf+WeZ4SWZIrp5anGjsQH1RGWU0WDCPrpKE4awC9OTNprlX7Dku9wp02WmlUHT6+xQ1FL/vaIlyzwzVV1OLFfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVu1LEIcqch9GsCvEkaQD5P/yYCQ+BiFa0HGY+97HpY=;
 b=Jy8+ta0pDvHiVNDVRoOQGFhtfXIqDWM4IRtnwCAWizo10PE5jlQpeKfISN9b+158Lsmn1/ktaZ96S1I6+TtKkU/dpUFTxTx0zsHI0KkgQznfVwasierTTLrX9idsYAIA8R9Oz9QIOu91Ko8Puk4KCihClEwLZVTQIIlaAljFlC/VWFGA2oiQIcm5zTm6fb0DZB13WYMUI+8HPJQLNhvweZv4tRlOTb+Z2yVUzVDoFV9Ew49pVyNGXfy1luCy0hDbDisWwJlez3g3BZAJeTqa+F81LvEFTZkXJLcgRD7T+WbSDvLVEN9OwCdJO5OBPx0FC0AH30+NneRaScvpmPdkag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVu1LEIcqch9GsCvEkaQD5P/yYCQ+BiFa0HGY+97HpY=;
 b=JviP0lY0jojWRR2Mj3UYKVenOyhlPNRyOvDDqn8W29GHMJh8AxnJK0jCH8Jy6giv+QxjPem/dEqAyU9W2v3aGIyP33p4baZE1eOzaHBmLz1am+Lol75cd09b70Wx5r9jnEZKofovcjvTOZYUXfbPFNS+BohpLdcuBl8OIUhUR+VIAGpaI5DjGAInc05edYhvRytkNetPGNtKYshONd9vNdqA7ZmUteaczq3B1Volf8LoHzdITM4dvU3esSdheiTBlZYt8fLHAMoE78hXVaBIWhFtuKdtvs/QdHTuGPOLOciJqOrDv6NwUjTajRI0U06LNzW3CLPyNTPJvOImsn4hXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI2PR04MB11171.eurprd04.prod.outlook.com (2603:10a6:800:29a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Tue, 4 Mar
 2025 07:39:27 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8466.020; Tue, 4 Mar 2025
 07:39:27 +0000
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
Subject: [PATCH v3 net-next 02/13] net: enetc: add command BD ring support for i.MX95 ENETC
Date: Tue,  4 Mar 2025 15:21:50 +0800
Message-Id: <20250304072201.1332603-3-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304072201.1332603-1-wei.fang@nxp.com>
References: <20250304072201.1332603-1-wei.fang@nxp.com>
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG3P274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::19)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|VI2PR04MB11171:EE_
X-MS-Office365-Filtering-Correlation-Id: 05efb85e-1129-4f78-1a92-08dd5aefb141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HZPvM2MyJhKl+0Tqh3sLS9qvks32gbVK1H0Y8D1U0QV4jIGxGiBc99qWd5P0?=
 =?us-ascii?Q?UaMyyXDH6ixHVgcntPcknIm87GZfz2H4F1HLu901AmqszVRIeFfoRGrSZ9r5?=
 =?us-ascii?Q?OLxTNc7RU3VfWuSPixVXgNYW8qgGuIRvb13bcVo3Q2tsTmWJVxisKStXGGDL?=
 =?us-ascii?Q?tzZIGO4rKrEI5ippA08Ghg/cii3kBu1BvjBVGQro8h2XJ/S7le4dVjaKYV1d?=
 =?us-ascii?Q?qG750YxpoCsI6Ayr8iERiBRt9ykn/qRrBkRsosPaCZk0TB975j2NL2vr9S5W?=
 =?us-ascii?Q?lXP3lv6ywYn0gMDcqbpiaQjmqBxVttcS5s2+tvfuI3gIVYsElwLCZrjGmCHi?=
 =?us-ascii?Q?BOPHMUkTgHoVgxR2rMbyLnWWfX0cHtSG2X0YXzHIkmpIbBapV51y5sGv/znd?=
 =?us-ascii?Q?A3+4BJWVwYXqZ4+9KdhsRWNCNpIj7bwe23d2cVtnPfmLzMsJhvC+177/6Ljn?=
 =?us-ascii?Q?VbPGQYh0EeXFv4bXcwLBunFXYVvGKqggjcKisJZN6BK9wA/A27YByYeZ0eyo?=
 =?us-ascii?Q?c+H98mbA4SylhYfKIt94fJgZ88dVCOjZVuQuRDIcJTp/7MY7cTMuyGwEXGFE?=
 =?us-ascii?Q?nqTe4VtSNyCiEIugiwj7/zZ2kY6BPa9PdI/ZSBFsriv584GDyCM85F3T1D7z?=
 =?us-ascii?Q?DpHiK0sFmO9TkJtp8TJgOxbueFQMiM7PKXTrsYZobi7cw2pry1CHH4QOAWz6?=
 =?us-ascii?Q?ftH4DfHt5a/hNfNuTDoULQIEdd/kzZIXYKueiPr/DX8jPbAk3ClUCt+Cijrl?=
 =?us-ascii?Q?RCCoyv1Z3OtyEuVS+dvP5L0vCi7n8iiigJZ6iSIv+/QBPCfhFPEF5xUyD+Xm?=
 =?us-ascii?Q?vr2nunxLoRlkNMm8Zhe0xctaF8XJs6Tmc6qjrHAhZOFl0buJhR5Q59rBqR9r?=
 =?us-ascii?Q?tG+Qevi2EvEOBc26J6eKnhnP9O6pCeVglNkh628XVAhHH/7/WdQzpVi6G2tt?=
 =?us-ascii?Q?sdjvN29ipYGTDk9qzRTdUqH7fGS1I3JAVcCWGF04iAZVq/M5BhX5GukWOztL?=
 =?us-ascii?Q?xcs1+JIPdXObMJL0MfXbtAMMXwp646AH6HOG3KmsutjYjFAWeMgqKl+Z14GM?=
 =?us-ascii?Q?msZMJBxX+njHr/9VWLM0FcaIdc8lRg3hA+sXtxKvsHI0z8WbYHlqJ2hHS8RF?=
 =?us-ascii?Q?QWCR0qTEu1Llb51nEoAp9TF3qqzkwHBftRs9MpPR9J81vmKMedMYPUE2PPom?=
 =?us-ascii?Q?Vl4RtwsR1kdE7SQXk12vbvK37TD4FSnJk2jSwDdEIvnF3UUfPJ4ErsG4TEi1?=
 =?us-ascii?Q?OFalwwHBr79mnuTBIcUHIGyuB/qOIC/IG4JtHdLaLM6p4/ST1N51AT1EUGs/?=
 =?us-ascii?Q?AeZJ2w+mtbrDm3oO4cgHsLTSxAYfgDOqm+L4vWNqRQcrM0WjGiMXcz9vgOyh?=
 =?us-ascii?Q?2Bd/DFfYsoQTIgGB8X0E49CdDJgiXURsjhq/YPQR9S4CPebJK/QWK0RAK3cj?=
 =?us-ascii?Q?ed0f2PHlBdupwrt1Bv1OG9xg4dXG4E88?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hie64xLXfhDq0GzMcob9MYlrndiXMLX681nI72amIeCwZUOSCTU/UyCgZy4Z?=
 =?us-ascii?Q?D4Rn+0KQsACQ9MtPpibOlQ6by80T4LHEjBO+VrzybP41ArlX9FPBBbbGhXZ4?=
 =?us-ascii?Q?fkkXuxqKuh5ffNp704YeeW/Q+cWBThDUBppamPZkjSh7bdKuMf2mkM1Vw8Dt?=
 =?us-ascii?Q?tCANnJ76WLmJvhpqEZsyqxPnabWOfs21kKJj2FgJnHO+1yIXELnt6OdJveIt?=
 =?us-ascii?Q?wvaJ3eQf6SF8xMoP+Mkr55BXtStkx8In60fhVydywv/jWLW/camvJoMgQxxj?=
 =?us-ascii?Q?uKj8+RluNZU+bJn6UUnMJhaF6ovMFNSp8KjdI+VYV4aM6bFjtdKliS0FXBeg?=
 =?us-ascii?Q?QL1csgyFlXFHjd5DgEq//r7ki4iaDcvJCMNKPF35Y39/mK8APEf4W7LuzEi1?=
 =?us-ascii?Q?xTJq7DYFZFoljjBhG3Ei7KCa4sTHKCe+R67ZN/ZsUjcn+EbrEx46vMhf4Csf?=
 =?us-ascii?Q?8PXj5bDto5q9jl8+DbZ1M2CW+uDndF662cIo5VUf8YSpeSKWozt2Cf89lV5m?=
 =?us-ascii?Q?MpcjRpd5DjJygleqxqyz0OtX64L6AaThq2Wzq9DKiDU7klDOeQ6IX9lSa2RQ?=
 =?us-ascii?Q?cbK4fRZKsDjNmqAvJEhzHd50FokS040PwvcBzyj0kFBYp7XOmxwB9GAeqBNq?=
 =?us-ascii?Q?hPWf/5cn/mSypP7+ezHPTHlK5kAFTNhgvlhyRar36OuaiH/wT1xCi+LtvqCJ?=
 =?us-ascii?Q?3pmj8uFJvXRrWT/1tIF+wTGoj4C75XGeHmi+ddpGo4SxewHjsBL5C5nOoHsc?=
 =?us-ascii?Q?FCmGJZELcwYmAIDU7uAxJeNUQHA9V7XYKAEB6wGssMastU9JxQt/ow62mN1h?=
 =?us-ascii?Q?H4qBbo74rA976vPvGSCQ6RyOcqCC9v0s8QP1ZmFkox8Jftsf0akdu75MN9cc?=
 =?us-ascii?Q?hjUpg1/v44KJYiMqN8OIn5P8DP1Ma72gLrYc9WawojOWAIlkDFb+TmYfU2jE?=
 =?us-ascii?Q?6TUo7/wtmUDT+uDcfVrBmpW3IISIz4KGua47dTZ58y5YGLm4KjboPvEIe8Bd?=
 =?us-ascii?Q?Mnpy6g8OO7JgWI/rS5htW2wnboNF6TQXu+tqfII2gzopdoHlOy6iRV7QnqXv?=
 =?us-ascii?Q?JF9v38191RTokQSKRH5ZM788sWxUyoBp8On0QLPoOKul7oLmLFwiOgoRzpbF?=
 =?us-ascii?Q?R86VxjT6XwDc/u5UxaMsla/EW46ScLTEF7elvYrYqYhu05jWTlcZeJPAM6tD?=
 =?us-ascii?Q?AvIYwwKCzEu7/SQCsbB4J1DOZCHhlqgc/ay5mT5+ZH3D9YjGfHK1jDy6yVYW?=
 =?us-ascii?Q?1f87g9xSH76voL9BH4awNyB66S+ArEBUt1f2viyp4i6DI0+wdVWMfJLcRPDp?=
 =?us-ascii?Q?49Ru2/a9LW2Y95xbZ9/JH4HXagHPncTJ1nlQrmPhDKAO7W/rxQvLIQtfCfjK?=
 =?us-ascii?Q?1N1EMmq8qfXyrF9WChF588CtEas5c8oj0lo+K3RDhgymHjVULsSZTBOXcKlS?=
 =?us-ascii?Q?Qa9wjhTQjuiMj3MdiSyfgj76S+lzXZ4WSXDV5Dl6yJU2c4ZOXBHxdXnMx+SL?=
 =?us-ascii?Q?wzHC7LF+kCmS6vqs8d7dbb5mO6hnKsf1SOnKCl9c9Zj8D3me5xlj2IVVQV9H?=
 =?us-ascii?Q?e8u0AIT7Sl3wG7gYYfhRTwH8Lrxx/g6unbW36PVS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05efb85e-1129-4f78-1a92-08dd5aefb141
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 07:39:27.7088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Hz9oA5vLgz4Usu6yQwCn3lE55vrsRwRBTTqVDI7Wqfm2k04oYYdjmmGCJDWUfkN8tBElODFEvB/e1srZ/kvCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11171
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The command BD ring is used to configure functionality where the
underlying resources may be shared between different entities or being
too large to configure using direct registers (such as lookup tables).

Because the command BD and table formats of i.MX95 and LS1028A are very
different, the software processing logic is also different. In order to
ensure driver compatibility, struct enetc_si_ops is introduced. This
structure defines some hooks shared by VSI and PSI. Different hardware
driver will register different hooks, For example, setup_cbdr() is used
to initialize the command BD ring, and teardown_cbdr() is used to free
the command BD ring.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.h  | 27 +++++++--
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 47 +++++++++++++++-
 .../net/ethernet/freescale/enetc/enetc_cbdr.c | 55 +++++++++++++++++--
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 13 +++--
 .../net/ethernet/freescale/enetc/enetc_vf.c   | 13 +++--
 5 files changed, 136 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 4ad4eb5c5a74..4ff0957e69be 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -8,6 +8,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/skbuff.h>
 #include <linux/ethtool.h>
+#include <linux/fsl/ntmp.h>
 #include <linux/if_vlan.h>
 #include <linux/phylink.h>
 #include <linux/dim.h>
@@ -266,6 +267,19 @@ struct enetc_platform_info {
 	const struct enetc_drvdata *data;
 };
 
+struct enetc_si;
+
+/*
+ * This structure defines the some common hooks for ENETC PSI and VSI.
+ * In addition, since VSI only uses the struct enetc_si as its private
+ * driver data, so this structure also define some hooks specifically
+ * for VSI. For VSI-specific hooks, the format is ‘vf_*()’.
+ */
+struct enetc_si_ops {
+	int (*setup_cbdr)(struct enetc_si *si);
+	void (*teardown_cbdr)(struct enetc_si *si);
+};
+
 /* PCI IEP device data */
 struct enetc_si {
 	struct pci_dev *pdev;
@@ -274,7 +288,10 @@ struct enetc_si {
 
 	struct net_device *ndev; /* back ref. */
 
-	struct enetc_cbdr cbd_ring;
+	union {
+		struct enetc_cbdr cbd_ring; /* Only ENETC 1.0 */
+		struct ntmp_priv ntmp; /* ENETC 4.1 and later */
+	};
 
 	int num_rx_rings; /* how many rings are available in the SI */
 	int num_tx_rings;
@@ -284,6 +301,7 @@ struct enetc_si {
 	u16 revision;
 	int hw_features;
 	const struct enetc_drvdata *drvdata;
+	const struct enetc_si_ops *ops;
 };
 
 #define ENETC_SI_ALIGN	32
@@ -490,9 +508,10 @@ void enetc_mm_link_state_update(struct enetc_ndev_priv *priv, bool link);
 void enetc_mm_commit_preemptible_tcs(struct enetc_ndev_priv *priv);
 
 /* control buffer descriptor ring (CBDR) */
-int enetc_setup_cbdr(struct device *dev, struct enetc_hw *hw, int bd_count,
-		     struct enetc_cbdr *cbdr);
-void enetc_teardown_cbdr(struct enetc_cbdr *cbdr);
+int enetc_setup_cbdr(struct enetc_si *si);
+void enetc_teardown_cbdr(struct enetc_si *si);
+int enetc4_setup_cbdr(struct enetc_si *si);
+void enetc4_teardown_cbdr(struct enetc_si *si);
 int enetc_set_mac_flt_entry(struct enetc_si *si, int index,
 			    char *mac_addr, int si_map);
 int enetc_clear_mac_flt_entry(struct enetc_si *si, int index);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 73ac8c6afb3a..63001379f0a0 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -260,6 +260,23 @@ static void enetc4_configure_port(struct enetc_pf *pf)
 	enetc4_enable_trx(pf);
 }
 
+static int enetc4_init_ntmp_priv(struct enetc_si *si)
+{
+	struct ntmp_priv *ntmp = &si->ntmp;
+
+	ntmp->dev_type = NETC_DEV_ENETC;
+
+	/* For ENETC 4.1, all table versions are 0 */
+	memset(&ntmp->cbdrs.tbl, 0, sizeof(ntmp->cbdrs.tbl));
+
+	return si->ops->setup_cbdr(si);
+}
+
+static void enetc4_free_ntmp_priv(struct enetc_si *si)
+{
+	si->ops->teardown_cbdr(si);
+}
+
 static int enetc4_pf_init(struct enetc_pf *pf)
 {
 	struct device *dev = &pf->si->pdev->dev;
@@ -272,11 +289,22 @@ static int enetc4_pf_init(struct enetc_pf *pf)
 		return err;
 	}
 
+	err = enetc4_init_ntmp_priv(pf->si);
+	if (err) {
+		dev_err(dev, "Failed to init CBDR\n");
+		return err;
+	}
+
 	enetc4_configure_port(pf);
 
 	return 0;
 }
 
+static void enetc4_pf_free(struct enetc_pf *pf)
+{
+	enetc4_free_ntmp_priv(pf->si);
+}
+
 static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_open		= enetc_open,
 	.ndo_stop		= enetc_close,
@@ -688,6 +716,11 @@ static void enetc4_pf_netdev_destroy(struct enetc_si *si)
 	free_netdev(ndev);
 }
 
+static const struct enetc_si_ops enetc4_psi_ops = {
+	.setup_cbdr = enetc4_setup_cbdr,
+	.teardown_cbdr = enetc4_teardown_cbdr,
+};
+
 static int enetc4_pf_probe(struct pci_dev *pdev,
 			   const struct pci_device_id *ent)
 {
@@ -712,6 +745,7 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 				     "Couldn't map PF only space\n");
 
 	si->revision = enetc_get_ip_revision(&si->hw);
+	si->ops = &enetc4_psi_ops;
 	err = enetc_get_driver_data(si);
 	if (err)
 		return dev_err_probe(dev, err,
@@ -728,14 +762,25 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 
 	enetc_get_si_caps(si);
 
-	return enetc4_pf_netdev_create(si);
+	err = enetc4_pf_netdev_create(si);
+	if (err)
+		goto err_netdev_create;
+
+	return 0;
+
+err_netdev_create:
+	enetc4_pf_free(pf);
+
+	return err;
 }
 
 static void enetc4_pf_remove(struct pci_dev *pdev)
 {
 	struct enetc_si *si = pci_get_drvdata(pdev);
+	struct enetc_pf *pf = enetc_si_priv(si);
 
 	enetc4_pf_netdev_destroy(si);
+	enetc4_pf_free(pf);
 }
 
 static const struct pci_device_id enetc4_pf_id_table[] = {
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
index 20bfdf7fb4b4..4e5125331d7b 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
@@ -3,10 +3,12 @@
 
 #include "enetc.h"
 
-int enetc_setup_cbdr(struct device *dev, struct enetc_hw *hw, int bd_count,
-		     struct enetc_cbdr *cbdr)
+int enetc_setup_cbdr(struct enetc_si *si)
 {
-	int size = bd_count * sizeof(struct enetc_cbd);
+	int size = ENETC_CBDR_DEFAULT_SIZE * sizeof(struct enetc_cbd);
+	struct enetc_cbdr *cbdr = &si->cbd_ring;
+	struct device *dev = &si->pdev->dev;
+	struct enetc_hw *hw = &si->hw;
 
 	cbdr->bd_base = dma_alloc_coherent(dev, size, &cbdr->bd_dma_base,
 					   GFP_KERNEL);
@@ -23,7 +25,7 @@ int enetc_setup_cbdr(struct device *dev, struct enetc_hw *hw, int bd_count,
 	cbdr->next_to_clean = 0;
 	cbdr->next_to_use = 0;
 	cbdr->dma_dev = dev;
-	cbdr->bd_count = bd_count;
+	cbdr->bd_count = ENETC_CBDR_DEFAULT_SIZE;
 
 	cbdr->pir = hw->reg + ENETC_SICBDRPIR;
 	cbdr->cir = hw->reg + ENETC_SICBDRCIR;
@@ -46,13 +48,45 @@ int enetc_setup_cbdr(struct device *dev, struct enetc_hw *hw, int bd_count,
 }
 EXPORT_SYMBOL_GPL(enetc_setup_cbdr);
 
-void enetc_teardown_cbdr(struct enetc_cbdr *cbdr)
+int enetc4_setup_cbdr(struct enetc_si *si)
 {
-	int size = cbdr->bd_count * sizeof(struct enetc_cbd);
+	struct netc_cbdrs *cbdrs = &si->ntmp.cbdrs;
+	struct device *dev = &si->pdev->dev;
+	struct enetc_hw *hw = &si->hw;
+	struct netc_cbdr_regs regs;
+
+	cbdrs->cbdr_num = 1;
+	cbdrs->cbdr_size = NETC_CBDR_BD_NUM;
+	cbdrs->dma_dev = dev;
+	cbdrs->ring = devm_kcalloc(dev, cbdrs->cbdr_num,
+				   sizeof(struct netc_cbdr), GFP_KERNEL);
+	if (!cbdrs->ring)
+		return -ENOMEM;
+
+	/* set CBDR cache attributes */
+	enetc_wr(hw, ENETC_SICAR2,
+		 ENETC_SICAR_RD_COHERENT | ENETC_SICAR_WR_COHERENT);
+
+	regs.pir = hw->reg + ENETC_SICBDRPIR;
+	regs.cir = hw->reg + ENETC_SICBDRCIR;
+	regs.mr = hw->reg + ENETC_SICBDRMR;
+	regs.bar0 = hw->reg + ENETC_SICBDRBAR0;
+	regs.bar1 = hw->reg + ENETC_SICBDRBAR1;
+	regs.lenr = hw->reg + ENETC_SICBDRLENR;
+
+	return netc_setup_cbdr(dev, cbdrs->cbdr_size, &regs, cbdrs->ring);
+}
+EXPORT_SYMBOL_GPL(enetc4_setup_cbdr);
+
+void enetc_teardown_cbdr(struct enetc_si *si)
+{
+	struct enetc_cbdr *cbdr = &si->cbd_ring;
+	int size;
 
 	/* disable ring */
 	enetc_wr_reg(cbdr->mr, 0);
 
+	size = cbdr->bd_count * sizeof(struct enetc_cbd);
 	dma_free_coherent(cbdr->dma_dev, size, cbdr->bd_base,
 			  cbdr->bd_dma_base);
 	cbdr->bd_base = NULL;
@@ -60,6 +94,15 @@ void enetc_teardown_cbdr(struct enetc_cbdr *cbdr)
 }
 EXPORT_SYMBOL_GPL(enetc_teardown_cbdr);
 
+void enetc4_teardown_cbdr(struct enetc_si *si)
+{
+	struct netc_cbdrs *cbdrs = &si->ntmp.cbdrs;
+
+	netc_teardown_cbdr(cbdrs->dma_dev, cbdrs->ring);
+	cbdrs->dma_dev = NULL;
+}
+EXPORT_SYMBOL_GPL(enetc4_teardown_cbdr);
+
 static void enetc_clean_cbdr(struct enetc_cbdr *ring)
 {
 	struct enetc_cbd *dest_cbd;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index 203862ec1114..a214749a4af6 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -939,6 +939,11 @@ static int enetc_pf_register_with_ierb(struct pci_dev *pdev)
 	return enetc_ierb_register_pf(ierb_pdev, pdev);
 }
 
+static const struct enetc_si_ops enetc_psi_ops = {
+	.setup_cbdr = enetc_setup_cbdr,
+	.teardown_cbdr = enetc_teardown_cbdr,
+};
+
 static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
 {
 	struct enetc_si *si;
@@ -957,6 +962,7 @@ static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
 		goto out_pci_remove;
 	}
 
+	si->ops = &enetc_psi_ops;
 	si->revision = enetc_get_ip_revision(&si->hw);
 	err = enetc_get_driver_data(si);
 	if (err) {
@@ -964,8 +970,7 @@ static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
 		goto out_pci_remove;
 	}
 
-	err = enetc_setup_cbdr(&pdev->dev, &si->hw, ENETC_CBDR_DEFAULT_SIZE,
-			       &si->cbd_ring);
+	err = si->ops->setup_cbdr(si);
 	if (err)
 		goto out_pci_remove;
 
@@ -984,7 +989,7 @@ static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
 	return si;
 
 out_teardown_cbdr:
-	enetc_teardown_cbdr(&si->cbd_ring);
+	si->ops->teardown_cbdr(si);
 out_pci_remove:
 	enetc_pci_remove(pdev);
 out:
@@ -995,7 +1000,7 @@ static void enetc_psi_destroy(struct pci_dev *pdev)
 {
 	struct enetc_si *si = pci_get_drvdata(pdev);
 
-	enetc_teardown_cbdr(&si->cbd_ring);
+	si->ops->teardown_cbdr(si);
 	enetc_pci_remove(pdev);
 }
 
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
index 3768752b6008..d7d9a720069b 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
@@ -162,6 +162,11 @@ static void enetc_vf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	enetc_load_primary_mac_addr(&si->hw, ndev);
 }
 
+static const struct enetc_si_ops enetc_vsi_ops = {
+	.setup_cbdr = enetc_setup_cbdr,
+	.teardown_cbdr = enetc_teardown_cbdr,
+};
+
 static int enetc_vf_probe(struct pci_dev *pdev,
 			  const struct pci_device_id *ent)
 {
@@ -176,6 +181,7 @@ static int enetc_vf_probe(struct pci_dev *pdev,
 
 	si = pci_get_drvdata(pdev);
 	si->revision = ENETC_REV_1_0;
+	si->ops = &enetc_vsi_ops;
 	err = enetc_get_driver_data(si);
 	if (err) {
 		dev_err_probe(&pdev->dev, err,
@@ -198,8 +204,7 @@ static int enetc_vf_probe(struct pci_dev *pdev,
 
 	enetc_init_si_rings_params(priv);
 
-	err = enetc_setup_cbdr(priv->dev, &si->hw, ENETC_CBDR_DEFAULT_SIZE,
-			       &si->cbd_ring);
+	err = si->ops->setup_cbdr(si);
 	if (err)
 		goto err_setup_cbdr;
 
@@ -235,7 +240,7 @@ static int enetc_vf_probe(struct pci_dev *pdev,
 err_alloc_msix:
 	enetc_free_si_resources(priv);
 err_alloc_si_res:
-	enetc_teardown_cbdr(&si->cbd_ring);
+	si->ops->teardown_cbdr(si);
 err_setup_cbdr:
 	si->ndev = NULL;
 	free_netdev(ndev);
@@ -256,7 +261,7 @@ static void enetc_vf_remove(struct pci_dev *pdev)
 	enetc_free_msix(priv);
 
 	enetc_free_si_resources(priv);
-	enetc_teardown_cbdr(&si->cbd_ring);
+	si->ops->teardown_cbdr(si);
 
 	free_netdev(si->ndev);
 
-- 
2.34.1


