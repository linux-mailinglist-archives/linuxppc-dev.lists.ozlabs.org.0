Return-Path: <linuxppc-dev+bounces-4282-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BA19F5CFF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 03:45:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCdM16jHTz2yjV;
	Wed, 18 Dec 2024 13:45:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260d::62f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734489901;
	cv=pass; b=OB1q8ZjZQIc0ZTPk+SB/BVS8zTfCPHtwGxCkhUF/EYfzrGmgVGddI7t7ondxZ0HLD7I4fG+7YxB5H0KuvGqVuwV9Z2xWC4ZofSvM3BKOwXpFJlKJYBbCeAoAfhz23GcqOZmzt+8dPiNFzxb8QLJNXWL6hhqk1TGuqlCDFjYx74xhIoFGfRz6LeGt/ueCVvuT+Jx3KZyjTB+3nQJVi+nZm03XSYWvoIGw54gzxU5sbn3OF8dfqDnfgsMpFZwtda5oDy2rHcGlThXO9QUiv118kkeb6d+6uzvChmXpXRFU1WRWUjS4UBk0xyX67yjTDvhFuoFQI/CQNSV91T/WnsDP8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734489901; c=relaxed/relaxed;
	bh=kMnpbSEpxeIc3RqtiFCoH/jgBhMeT81Lo9J02gfeaSc=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=SwLFG5r6VMa/dYdaOkto5R1Z0XFKe9YzjmOfKEC0SqcCLAezmlV16FVY1wPyuHnavSq4b62h5v7hCaJW2/fSCLUqGukWPCx3DmYPrc0SlShUCNMuHv3pxF3p05yHVhC9LVqvDIFYRW1a2+YuT8UGOrIaZ0vwmVAUVDxROGvIzrDtVSn0JBDbeGasT2p+Mbca7s9QhJS+1yzC0UII3PfiboebmjB5uCjeQRl1X9cNv76UqWXtM5vQkv8ay+AKOf2LE+LNmT5kPx+JXLCmpJDxmTEEmZ3tf8L0Qb3tKcfQiMSVEAMxfQcTU0adhtb3eR7TyvJlRmgmsXULyjGuWoftIg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=k9oTKUS5; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260d::62f; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=k9oTKUS5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260d::62f; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2062f.outbound.protection.outlook.com [IPv6:2a01:111:f403:260d::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCdM013Zpz2xxt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 13:44:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XoHPupYJYJTDYckNJbC3eGpxE7TTHx9oep+JjY0rWjiRxqudnEbsLv0CjSuJ0z3KCE+YXcWjtP1zYarIYOcPoWbe/VYHHZbmlffeYxKCn1VGNoOvM9tGBCVAHXFcPugbfMIj83TjUSZVVQkX1ZgWDD1gXsHZQ3cUdpNA9OA+l59m02ExQB98VIMk/aXkapR5DYs5eov0rxmZVkgopYzRmFdamcsHJhrpLipzgOSB4yk+XOVR8fO+9K9jYxTrIMilZuiXvfcul56zRx5Pn6Um3rvGn1b22lhl0Mp2qkeu+l+6srRI0P4rMr3nvfxrjHLKc0mjotuffKIHoILasxXJZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMnpbSEpxeIc3RqtiFCoH/jgBhMeT81Lo9J02gfeaSc=;
 b=outjqS4EWCpaXmtxQCWIoWeiJ7H8wUbGmo2/C1fIOKKy0al+Z5RWpt+2a7j/XgroQ6tT7BWbEbDEwqYK0tFMfg921IUpaCoJgBqGEjyMHIBjhXj+4uZkubrJdwrQNJgnQs4Awa5GOz+9LZ/EeyqAx+qmGCYO8Lu1IDClh+Q1uRCgGeMH+nM1psuMi/zJ5b9KfA/EqZvLePq6Vw/mL1/LlEKuUC1zk/zLWWE2yPI/Qb1b9n7WZMz7U9zCnF1BFUrQvyCjrXOmdfcIiaVusEyeaMjvb9PE4wxq7MLt4PqIIhmGDDA4cynpmornIlI6cgXkEweWhGtoXYwpgpJqxnLmYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMnpbSEpxeIc3RqtiFCoH/jgBhMeT81Lo9J02gfeaSc=;
 b=k9oTKUS583kh7x8yzxpLNcvSX7KWtlAdCFXNSj7Qz5peo3XoCPaO5szogiN24SBwC7zur+tVLLdta7K9cPkp/fKtg25jYS70APpTBZx8AaFPp8MLVU5LVYbrfGdYbX6jLAxOflmROYsRFUM7uVPt+tFDG5rL+DnUVnPXe2vpnYz21rEq823dLrSIX+v958Z6mfu36GOJFM1/JPdaVQJWLk7X37IqE1LAGjlBjc6gVXMSqQMedcJkBOHtsIfif/bR1JcboQ0BGFLkaDrDSsYFRxzgNXkgAorS+aB2OAQ6Ntsr/7uhj3kGJhbbhRJWyajnN/PBpsRMUzhV1tZyFB/VsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU2PR04MB9132.eurprd04.prod.outlook.com (2603:10a6:10:2f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 02:44:38 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 02:44:38 +0000
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
Subject: [PATCH] ASoC: fsl_asrc_m2m: force cast for snd_pcm_format_t type
Date: Wed, 18 Dec 2024 10:43:58 +0800
Message-Id: <20241218024358.3022635-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU2PR04MB9132:EE_
X-MS-Office365-Filtering-Correlation-Id: 83f1c234-4376-481f-b3e3-08dd1f0dea2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xagtnGxy1C+gi4zaTWD2KOxivFAb8PRsJAXFXx0fHNNpzrG8HaR6Sod62ojW?=
 =?us-ascii?Q?ET9OwoE0JwHT/g48t+oC35MDpfVHf3kjGT8+mW/ZzJDJLXUS+crwYKUS6QCJ?=
 =?us-ascii?Q?Z/iVxKWa86tXjpJwEmhDeSRy5BL5QIOW+r+wNrr/pOv2+XVlmQczZ9tEhAyg?=
 =?us-ascii?Q?LJea/cYa/dPbpiXnF5PInf4aL/ngEEoYB7RihFm+LPU/a66CicO8oksnwyRb?=
 =?us-ascii?Q?CMJLjhtYiGjVhasQA6+a2q8tumbv26vRu5GShpbhYPfxoDF5UnvYluYMh/n2?=
 =?us-ascii?Q?NZjTroPTq+47Sc/agyUIng4AXTKLkgcY9wUfjXLSlJXKmF9cJz8oakqyJ1XS?=
 =?us-ascii?Q?oMP+gJnz/fDhc2IPHdD5EP6hWq0a2keA7G4RXiEyZudlVEJmlX1CME4poxXN?=
 =?us-ascii?Q?WXtFR3ZFHZfA2Mn8KnWvu/vgg/q1QqOLyNblEifb0I36HNfqGe1lSR7M25c9?=
 =?us-ascii?Q?cBit4vwcY/yaAnv4roRep1YxPk/lASkuAh5unEiPadaDMYTjeauQvCq4e+hZ?=
 =?us-ascii?Q?KWct7gHr1o6nVBfoRdetMpin5JPAGpudvBOfTPNr+qynxe5bn+nlvboOcN30?=
 =?us-ascii?Q?GGIGkq85Tjt9Ku5KtMJ8TKrdEQtDrF6YgQhD8wDEC+dVzZXTmEzrThQ7pKU2?=
 =?us-ascii?Q?H2noh/CYWHWM50xJ7Qbs8jfwJvuQf0+qOSJir2mE0DlPtC1hMFRwcSITLZD+?=
 =?us-ascii?Q?r062DnGQ13c0XHTvbdtiFdDqJltOmpfO5hlGSDAHDU1DZIjAlcWvxlUaJ/8v?=
 =?us-ascii?Q?D141n1cub3htx1m/vfM9XDUMu8j53W77pOe31w9dTC67F4mAFOQNs4XSXFoC?=
 =?us-ascii?Q?rXUmAbUzHmMx5F6YGwq8nhqzNJwdA9i/8NNduUGGKMqTKgXvFAbHc8sEn1Nk?=
 =?us-ascii?Q?ecx+yqymPug9dbcYWQakuNC8gtRNAW6ikTM2ANFk9wAeJ6dclGcHXnDn3hNm?=
 =?us-ascii?Q?pR+8MIOFMKUQwiKB8D4w4v1ZKhkzDuT345XbjHCrPkn5jjYyWov0tXyf4KOb?=
 =?us-ascii?Q?5K/N2WIsePU6j0SORzHAldO7uJ3B5Y4vMtzDuCXULRwepYaNIIA1KnDK//PP?=
 =?us-ascii?Q?LdYvwyC7zOgUGH2F57waBan3TfJOQI37MOLA1oIUlMNst02gASOsdc7PMNQl?=
 =?us-ascii?Q?qUpm8xFjgxlQdPBup34uRsg9u4VGP1njJhAJc9xSrkYYmuh8mnRvdKUgmuo5?=
 =?us-ascii?Q?sFxFJhMa+CKK8oYr0DWCIoW82/RJLUSeq4W6u5z8Dp6OliWZFFjKAU1I1Uy9?=
 =?us-ascii?Q?VIFwJGyXCJbxMQ/j2Lwo8Bf5AbQOXvAx/S+8BCHRWvjnx6qDNUy4ZN0XBNf/?=
 =?us-ascii?Q?KEuOOHaVUg4U5wwrCqmuOll4zgGQEcptnYUfdoRQMVjJrcudGc2+U127svO5?=
 =?us-ascii?Q?N7aFvGkzZkf7cXAz2KICidRPENwgCmj1c6nFiwFRNq1FgMuuN4FgMY9R/PjK?=
 =?us-ascii?Q?vNfHT/8hQrKgs4ZXHjwuOgCCnADZiD5lMnkJR/1Z/3aZywxD0hWBIg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b7CdVT/Cgrq7SLfsj4L+6G7G3oXryn+pRTx7AtQGcNn8eur8/8ZqKdXnCywL?=
 =?us-ascii?Q?GiyLSr3r0U6mz880XzVHhE8aEssmfFaxeoYAEbdDX9qva5KJH+113vLy/usG?=
 =?us-ascii?Q?mPqT4YVMCQqd/bzmCk5K5ua7wy8WIP6VjKCd010Uw2BUzBzSumIcX59jp5PX?=
 =?us-ascii?Q?rFj67YavDP9PEw9zywA7kIldXh6LdiBlIxTgemMXbYMx5/na5t+RviFPNeji?=
 =?us-ascii?Q?Mu/8iBohT0sFzOzXhTNZzfnp1k7sYKYUrTSTvHX4mv6YE5UW9iBeBoVypWnl?=
 =?us-ascii?Q?+7uvZq6wWlmRvXoCiPWr9ufMiwbO2ujKari0iFTdF/Bx9iRVURh71hApO7cx?=
 =?us-ascii?Q?RMMKyfY5PQKpIPdI3m7weuJuw2p7nBNt96d6mWNu+qiF7NxuHarVvgam6h2S?=
 =?us-ascii?Q?ZdpSEjt0wXoNBmgn3vX05lS6S/iUKIZMUf36rZ1NOWSgEo+bBfhRxtk2M507?=
 =?us-ascii?Q?Ufc+R4op01rykfjvS2LUFrEngmxPIwD7zLiFWaaRzwxCyuI8OEsc4XgUwfiJ?=
 =?us-ascii?Q?srH5WkCAVx5d265VfiHfrefQ7ehR4OaxlAi0WJxqQWvBuPbjljzfHPioAWqM?=
 =?us-ascii?Q?48DhypuyrNKCHz9G7H5a/6WHYDucIzGVgKd2u6jqHK2O69tJ6r4L35DmFRg1?=
 =?us-ascii?Q?vjXUMvKt8fz/QthPOBSHBb1FmPoB/8kEjAwWBsaYwqZ7tpAwLBWbjBag8GsL?=
 =?us-ascii?Q?SRj4tKon2ugXhj/Wixo4QiTOGDJdZdWPhj1DvE/tnnhLo6qiCkWEgoG8ndgV?=
 =?us-ascii?Q?ahNKJCyXChCEjbnbo+zX/hhOFL12n/xix7vcgJTdj32xHeh1Q0N8zXAr8Z+c?=
 =?us-ascii?Q?Sw4h266Z1iBERJ6UA+CzzMAouVPa8WAZc2XsXkAGkO8yM+wRwqbeONTAicX0?=
 =?us-ascii?Q?KY9MlXvpetaiAnuqN5PnMaHCvAUkG//0MyhNeYjHSQG5/s7eTQvqgigvYBk3?=
 =?us-ascii?Q?geVB3zp87qsA4kT8/Bx+3MPLODRXhOLgX6ADkR1Q3sEFqU/Zo/vf903Dgs07?=
 =?us-ascii?Q?3vCYNRbQPj0CUfo9lUBmmJjyVsw1gBazQ2NFGHgSzoUYLPoE0p5IIoyKXl90?=
 =?us-ascii?Q?WopOPcMWuyG9zoWzuugl8d0jGgWoHV2J6jOgMxt6lsDdFAn7RKf4Rv04d1MI?=
 =?us-ascii?Q?7VVO3pISfqnaP1IwXzHTWwEbdLhYaovcybEEwr+4WLON2ivCQ+0VtmIo1o+p?=
 =?us-ascii?Q?Y1/CDASKBSsYZBFc0kLdr4+nvwrKfWnlcwIE/Nz+ECEaa5VW4zn4LGA7mQww?=
 =?us-ascii?Q?xZcNqQ0MT3tIr+XIEQzbxdiaTVUE4ZBX4Y/OezpUjPDU435HfchsbFj0tpjU?=
 =?us-ascii?Q?Ly2pT49bmESr3HY4aiiNgUV9wYn/APXMT35kfSI53vV+0qs8FcQM/BVNGPoF?=
 =?us-ascii?Q?RbNUNoWGRqAZPQPolsLr6LtBztKhJPc6yiVi0cw18d9/veb1uPC4JNRbJJxw?=
 =?us-ascii?Q?VyHN06IQ+pOe5UxFofpl2N66U7VnrryEZL333Zcvco79KyOXhvoFbwyp+9oo?=
 =?us-ascii?Q?5I33A5p/8vNVLwLRwGChUSx1RSu1ezmc1fJzuTWhNXWvQLqPIBpCIMmufn0b?=
 =?us-ascii?Q?68rspqbpI+OzHJi2rpAhjhJQ2D6VAi1AIPqRNtTZjVewXjAdgrMCXQVLZD6W?=
 =?us-ascii?Q?bw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f1c234-4376-481f-b3e3-08dd1f0dea2b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 02:44:38.2188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hV5dOFnoFkW0grYv2riEbuNeNGuEfsHWf4Xzm+MAFVezgIDLKi2wgqlI+od+uDdMQKcP22sw8vIpAJ6UL1BffA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9132
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Fix sparse warnings:

fsl_asrc_m2m.c:360:45: sparse: warning: incorrect type in argument 1 (different base types)
fsl_asrc_m2m.c:360:45: sparse:    expected restricted snd_pcm_format_t [usertype] pcm_forma
fsl_asrc_m2m.c:360:45: sparse:    got unsigned int [usertype] format
fsl_asrc_m2m.c:361:41: sparse: warning: incorrect type in assignment (different base types)
fsl_asrc_m2m.c:361:41: sparse:    expected restricted snd_pcm_format_t
fsl_asrc_m2m.c:361:41: sparse:    got unsigned int [usertype] format
fsl_asrc_m2m.c:365:45: sparse: warning: incorrect type in argument 1 (different base types)
fsl_asrc_m2m.c:365:45: sparse:    expected restricted snd_pcm_format_t [usertype] pcm_forma
fsl_asrc_m2m.c:365:45: sparse:    got unsigned int [usertype] pcm_format
fsl_asrc_m2m.c:366:42: sparse: warning: incorrect type in assignment (different base types)
fsl_asrc_m2m.c:366:42: sparse:    expected restricted snd_pcm_format_t
fsl_asrc_m2m.c:366:42: sparse:    got unsigned int [usertype] pcm_format
fsl_asrc_m2m.c:595:54: sparse: warning: incorrect type in assignment (different base types)
fsl_asrc_m2m.c:595:54: sparse:    expected unsigned int [usertype] formats
fsl_asrc_m2m.c:595:54: sparse:    got restricted snd_pcm_format_t [assigned] [usertype] k

Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412180043.PAA4t4sQ-lkp@intel.com/
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc_m2m.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
index f266a3f5fd48..4906843e2a8f 100644
--- a/sound/soc/fsl/fsl_asrc_m2m.c
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -357,13 +357,13 @@ static int fsl_asrc_m2m_comp_set_params(struct snd_compr_stream *stream,
 	if (ret)
 		return -EINVAL;
 
-	if (pcm_format_to_bits(params->codec.format) & cap.fmt_in)
-		pair->sample_format[IN] = params->codec.format;
+	if (pcm_format_to_bits((__force snd_pcm_format_t)params->codec.format) & cap.fmt_in)
+		pair->sample_format[IN] = (__force snd_pcm_format_t)params->codec.format;
 	else
 		return -EINVAL;
 
-	if (pcm_format_to_bits(params->codec.pcm_format) & cap.fmt_out)
-		pair->sample_format[OUT] = params->codec.pcm_format;
+	if (pcm_format_to_bits((__force snd_pcm_format_t)params->codec.pcm_format) & cap.fmt_out)
+		pair->sample_format[OUT] = (__force snd_pcm_format_t)params->codec.pcm_format;
 	else
 		return -EINVAL;
 
@@ -592,7 +592,7 @@ static int fsl_asrc_m2m_fill_codec_caps(struct fsl_asrc *asrc,
 			       cap.rate_in,
 			       cap.rate_in_count * sizeof(__u32));
 			codec->descriptor[j].num_sample_rates = cap.rate_in_count;
-			codec->descriptor[j].formats = k;
+			codec->descriptor[j].formats = (__force __u32)k;
 			codec->descriptor[j].pcm_formats = cap.fmt_out;
 			codec->descriptor[j].src.out_sample_rate_min = cap.rate_out[0];
 			codec->descriptor[j].src.out_sample_rate_max =
-- 
2.34.1


