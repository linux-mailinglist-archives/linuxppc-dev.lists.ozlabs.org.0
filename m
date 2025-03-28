Return-Path: <linuxppc-dev+bounces-7364-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A983A745D7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Mar 2025 09:59:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZPDxB67R8z2xs7;
	Fri, 28 Mar 2025 19:59:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2606::601" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743152382;
	cv=pass; b=am8JYNteHyDsxXg2IKLjq16Qx2O3ZNwDW0n6ZKYuP4Bj3FS+8dCnXs1brSyxfFe9f5vdy/fL3H4lys2rZQrM6AZNQ0zMsmYc1ma4c3qTJqyKzr0kgBC4EgNkOteXphO3gd19IfjBQwnDr3B2DJh/qgc5z1bGV0f+R4ni81vkyMpr19ELbTzp874/lSu2qOYxO0mkrPUnjXhGPN8rcM2NS/iwNlIhotyShE27h2H5yPjf1MvUGOrTBGU46cqdR5NvgbQugorUa07mvA4unxwaImBjIogd4lAk8qBIxNvtnky15HriCB/D9fFDg76WNL6HW31p1qm/IBcie4rx0DVyww==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743152382; c=relaxed/relaxed;
	bh=fXT1c3W89hRUWkpz7jScNcX+xgJeOlXxRCJh3uTYJHY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q/M6kJZIhQfcnnYa+DxdvalEVaJypYokC2vs7awIIH0y/FBn6tqWiDBeaB6AUhRa0MKodnYd8DNBkOzvFQzRBxK1laWAo6WrPpG5h0Heo6L6SzzaKAqVAe8EWsVXVYZqvHR61Arkv0X+d2AAJ7h2EI+D0XqGLc45CESKahcisUirx7/GQg4CVXGYPKtMXdigFsj5vy2krsv42+djK4QVQtiwkc9VY4H2E3NR69jpytIcTHtpm/Z+H0w67eEyBpDFI8VmdqgHD1Ylq8LTqef0sPCVRbbF2Nf7nMzTSkVj5+Pmtz6ks9EPUvCE2HCl+GdxK1ODPPllAs3dZIRcN3qScA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=JAiLyfQz; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2606::601; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=JAiLyfQz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2606::601; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2606::601])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZPDxB10f1z2yjV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Mar 2025 19:59:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RP/rf3FamFY8EQ580C+/45gHJ37Jp3YicT8IAVUz4SuT1VEbFMPseDR7nx+aWqH+BKX18+QOy1eRocZFTVz6g4eMmbjG/6WKNaqMZ7JN0/nz/KoJwO1j5kPWteyLSIiRoFoqEMtjFr3sByvH6hVO7OBqdKADrWdGH2/HYf9UPQ7We1GxEtiPu62tgKtsOaMLvYBkadgFkiE4i+WiUYNNTgIfFoSGwrDOqqGBlUz/P5wbwkCtbCM/pd9YiuJ+9B1lHHPDH6nUjreiCrAF+9pEyScto4pDmymfDZp0FDNBjNswSztKPdBsOg5eOXBnBDuA9dLA2nA76Cg5GGHDMQEuyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXT1c3W89hRUWkpz7jScNcX+xgJeOlXxRCJh3uTYJHY=;
 b=w9Y7Ifo60CH3p/wTi8/Qc6mYVhQyhE1B7EVDvWMjESKgs3eLlFDk6A0AkbEjcHWY4pf7fUBh/QMEfo4wyC/lVfheZWoMs/7YHPR6c/k51oU5i9MAS5DocUX7E0JrzododkDh8uw/JdkXyqic8E9E60dwXErTVsgujreKJGzrv6L4r2CRlzrEnS79Q8PnLr+q0OOHwll1hOSIY8ojbbE8iPUR2B3SM/V5npTKt3RGwgXwhA7Q3J553Ch+WKav2DwVkWktqSVTwSUAB1/2zGD3ZTFfRMLTVY0va98uyKKejOnX3XJZj7jqOvwTiB1qKd26WPvf+5hFrMffPLmQi0PhJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXT1c3W89hRUWkpz7jScNcX+xgJeOlXxRCJh3uTYJHY=;
 b=JAiLyfQz0QKiEPVeEMjuprmr1o6+j57oACQA8+l1OtfPz01iJCFZ7UwStmfiZfqVfRw4+InMxMFH1IYUK1kbMw4hE5kV77KOljP5xGvKTccqiO4BD6JO6hq/jyrc5anyxIB/+o4LZnUdwawPWDMRpPLy7JVCs25PjvV46Kkw2ni91ULl2MilkfRs4W23T3YiQ7pG87TlymZmIxGjcC8Yxk8dx5Qex2i5CRTde6dybLdgoM0BkgD9l4YfS/nNRlxOY+lu4mDLdMPVrdgSVK2lmx/pX7BxX7EgntKN3RCGcDRBOwMKJNGTQMDrGMjTcCZ4g2I68KkoxwAgPiGEm9Qu+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI0PR04MB11046.eurprd04.prod.outlook.com (2603:10a6:800:269::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 08:59:23 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 08:59:23 +0000
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
Subject: [PATCH 1/4] ASoC: fsl_sai: allow to set mclk rate with zero clk_id
Date: Fri, 28 Mar 2025 16:57:41 +0800
Message-Id: <20250328085744.1893434-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250328085744.1893434-1-shengjiu.wang@nxp.com>
References: <20250328085744.1893434-1-shengjiu.wang@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI0PR04MB11046:EE_
X-MS-Office365-Filtering-Correlation-Id: 1480a309-a322-44ac-929b-08dd6dd6d5cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ub2z4cxKRxkA1o592m251ULckZQghJ6//HDSGbPtDO8UQscEvPuW8oiU7be9?=
 =?us-ascii?Q?hr1COIIlO2F6XdgS4iDJMaxoFnnL3fm/xbm5TTe8CveDHup3K4EDNL7yNhxF?=
 =?us-ascii?Q?xWPrEMbDtONO5q6VS2BuJAKm/WDV8aCuRVAIk0BI0JNSUsnehR29oIjPeGwk?=
 =?us-ascii?Q?0M6Heoq2mAuL2DZ+IrDM+Pg1CO1wIAm06C8vipi/qulCXvhPyEgCqCaLvV0U?=
 =?us-ascii?Q?kfjuOeqMQyAsIgnwtz5LZbSXbRJoE20383AeTJ5wGfQ7mEA3MlKHIznYvnyA?=
 =?us-ascii?Q?S7o3CuotHhG5WHkHbP+GsZiNy5Wnj+JVU4A3QD9DnqrN9ZOWePxQvKyVSsHG?=
 =?us-ascii?Q?O5QMjucwvF7TuzssldXnEzqNINkITcxeogoM/lbJYrvWPj7f2RxuMm3Tst80?=
 =?us-ascii?Q?+FbKtaAq7nON4Oi7sqmHoQ8yf5RJZ42+iXaNe/0MKgKEhV1dPyJNJZA0YztK?=
 =?us-ascii?Q?0P9l3aj3l2rri+WR5xWvs09peBFD0hcLlfA5BKAsojWpU8Ph3l8zwU+FdkH/?=
 =?us-ascii?Q?rukpbZQ0QoDdrLSFsdUBETMYoBuKUyF5gi2q8eJ/7dxQ+Pa5OX8oLp5mtQT1?=
 =?us-ascii?Q?pnRlvQztEBxdFRNeJeTKDgM4W/N8uaIhmh9hAMGVLiF5iUyit3BbYAGTS0HI?=
 =?us-ascii?Q?CwqpIMDOggaRYhUhFsnLuq3gk750e5z7h1uL9LI7lJYqj/vfU0u99dVnCRok?=
 =?us-ascii?Q?JrFtHejQydmfCQtbAg3AZmbIO+5wGsLa3UtrNiIifn3SFmFeX5vdekzaP2Ny?=
 =?us-ascii?Q?JeofLNsf+leIvuYWDWqj9MUMG/GQ54rs4EsRO13+mZbSo+k0fiM9lwKhzFSd?=
 =?us-ascii?Q?ZtKn+V28NkWtgC56GMTxzTM3ObQC8kHh0H6xkXnARetCDodP8HLbrEFtH39C?=
 =?us-ascii?Q?tzsaG5CPnYDIECp2pIGfoMTPozxi95wo0KZhOJwHn9sip+1VXxo9aID8OB+o?=
 =?us-ascii?Q?kRtoitckwKgGVPb9yFRCf1qjX0OAyzCKeH0HNcnHDGTWH0omMA1T5M4sSUoz?=
 =?us-ascii?Q?nJLTFIihYc9KG1pWfqZya3K3h3JFKVgySSklTgh14Xwq8YkhBGeAi6mdV2A8?=
 =?us-ascii?Q?yRYr5iQOFlAaXwHWcqB8XTxOqybqymFsITD7l0/E5dPmCEp+VvXqWZLz9gFy?=
 =?us-ascii?Q?MY+4BnkdnmKOqHuRDXEbA39fSHE5RDuztr8wnO6uzbHVRU0is0/XagcRN56m?=
 =?us-ascii?Q?xpwCFKJCKttIDGCTxoKiGq2IKoIs/7ZqBZQcJ31J0JLcFujkx4ckHf+DeSce?=
 =?us-ascii?Q?rUhMbomokCjO5mCNOJIOr+sbOG777AuTpwORtnSzxxL7aHkDYeyUlDE/8R1s?=
 =?us-ascii?Q?nkFa3K355drwOrres+ZkA95PCn/uSBjeogwFJi5U2Z9XvBqxvyIEw/3S736o?=
 =?us-ascii?Q?AFSuzuNRVsskDl1p+CxYdapxAziSddFMjVWt2bHCSMsauVmpaBOiAU3NktDy?=
 =?us-ascii?Q?GM9En916ME55IpGLUz9EA3mp+mWWKxDGorMEU2bEIoR2PEKh3xNwXg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?17IbYbpb9Tf7lPa93k9dL/f4Gm2fvaZBCgYawsHVkCO6QG1LxOhEwHYgClj2?=
 =?us-ascii?Q?YtXqbEr8RFMyzcb9FyAlWDUYMkd73MC5t2fDpGV7D++0aurREDjhihD7lALv?=
 =?us-ascii?Q?kFe5wTYK8LmmrjOpmfSwk54ELa/Gvstd13vB4DKKDbK6kYbh7FtKi2BdLDaC?=
 =?us-ascii?Q?nM2BhxlPnOepF1KTcIMNS8nHMPxGOzaUythdbJrnS/sw1ah/ntzrdUJnsMK3?=
 =?us-ascii?Q?auTuJsRByT3enGmhq21Ogns46he116qa9Jo7pvWWorpxnmo2SCem6EoWILad?=
 =?us-ascii?Q?ZKqBZ6WJpMoq0fLGn7F2MScO5oTU2tWA5DahqbHnBNynhb3Cd3M/VOOPAV9t?=
 =?us-ascii?Q?Vn1MY0jk7P432w/Q0O2BHs563f6Kx094a0up9P+J6yItt9bgYmFlMC0DwLAE?=
 =?us-ascii?Q?1ZEaQnX2gKkmpQrUxKjyH3xI7kMK1l0FPphrJP+rhry53e/FqFiG5B0YJnOV?=
 =?us-ascii?Q?Z5r6a1VG6TKl8g6JoGK9Jvy7BrvF6dJho/ynf7Jl686G3Ym3RVKpciObEV4A?=
 =?us-ascii?Q?xaYUnOKDSGkeTVt1M/JAlSNIc9KNG2mvI84pfiI7pR1qJ9P+HqAaPCfJ1xDA?=
 =?us-ascii?Q?suCaHhz587+I2YpvdlOYj4/d/vOBOQWHHdCWXf9j93DHmKsYEr8iwoiqswNC?=
 =?us-ascii?Q?wh2xeyLvgN8qP6OmMmzxFpmotFHUe3NCH8JBQstqQ2sHjQkpJ1lCHoKSibVv?=
 =?us-ascii?Q?E4+p5uqB1JeuRy5jUq4sWY1/yOHXi7/CqPNx7iOznlaGtIW7ua7150N//9OL?=
 =?us-ascii?Q?MwuIpZwTDGNtr4Pfa9MDC54x7uhs5AqoQPEvXlbVTcW0hpB62wPQl3NGe6aA?=
 =?us-ascii?Q?uz5o3Z1Vgxpz94BpiezEVsp+hmzJ3f40aXWvPUvFkKcdLgNxkgW8UGKMUSG7?=
 =?us-ascii?Q?q/B0XSrDWjOm+LP8g7k+/fjp8URNTA63oO+dBtycLVysVQenTir75z6rpJX+?=
 =?us-ascii?Q?aDJOFJ3o2c6S6HncqyUlvc5mw1NiRz4ov2paBOVJ/Ddp1rk+I55T6fOyWvtm?=
 =?us-ascii?Q?WYT7Fg5tY1gWY2DfVbVl5ps2UlST1VQjQEb3VYneol86E0JznHGtLtZZIDqE?=
 =?us-ascii?Q?Z28BCOjkHbvgNTum3gwvsUlXpAN1pcM8Jh0CPkXuNoJr6GJDisd/ejXJ/3ST?=
 =?us-ascii?Q?I+kE2zRtdXjpQYsEqU89fex7jN3I9a+YNMk3MWH7BYWXL1ufxy1AgKJ0384j?=
 =?us-ascii?Q?s1UymfSir+j0+LI2Pqffd6B68HDktaisdzhezxBhAyofoT6TsEX/SynVx3EX?=
 =?us-ascii?Q?16AZQwEQTxrpu6vrLSGfSFLrZw64YsAk7QX/hxaghoewF+WBnpO+Y+OEqSQI?=
 =?us-ascii?Q?FEaZZ0CtdwYC0MNPf4EpHar53LAXgaIN70YtpJh+xGeMldGN95Dd36qXwMcA?=
 =?us-ascii?Q?njGKBN2EyTLE/4hizRaJTF8EPsFIbNKff+X43NmabFJCrqMGg8Y1f766rn75?=
 =?us-ascii?Q?B9yObnDgBlFZZFG39xt2jqKiTEuh5fyxMnr7YfAD1+X1d64dMKMTipXIJ2eu?=
 =?us-ascii?Q?X1/UYD4bP0dHXXNFMTIgzOjr0CbBuot3so0+ud51KpKwGk3o2vi4nrEuzFf7?=
 =?us-ascii?Q?kbRq2qqo+LOlpHJFjcOwSi3JV6rt7WmlFzJg2Boz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1480a309-a322-44ac-929b-08dd6dd6d5cc
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 08:59:23.6782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERpKLpGPNdDPOoMDUWFzGh0N8VNnv29H5jETrPbLk13KTEoY8Vt0Y7BTk35gb0zN97PaZOYxJZKk2hK3BV5p3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11046
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

If clk_id is zero, it means FSL_SAI_CLK_BUS in fsl_sai_set_dai_sysclk(),
as the clk[FSL_SAI_CLK_BUS]'s rate can't be changed, there is no rate
changed for mclk.

But with audio-graph-card, the clk_id is always zero, in order to allow
to set mclk rate with zero clk_id, update the condition to be if clk_id is
zero, then set the FSL_SAI_CLK_MAST1's rate. This would not change the
original function for master mode.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index ed2b4780c470..bcb46a0b5e68 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -238,22 +238,22 @@ static int fsl_sai_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
 	if (dir == SND_SOC_CLOCK_IN)
 		return 0;
 
-	if (freq > 0 && clk_id != FSL_SAI_CLK_BUS) {
-		if (clk_id < 0 || clk_id >= FSL_SAI_MCLK_MAX) {
-			dev_err(cpu_dai->dev, "Unknown clock id: %d\n", clk_id);
-			return -EINVAL;
-		}
+	if (clk_id < 0 || clk_id >= FSL_SAI_MCLK_MAX) {
+		dev_err(cpu_dai->dev, "Unknown clock id: %d\n", clk_id);
+		return -EINVAL;
+	}
 
-		if (IS_ERR_OR_NULL(sai->mclk_clk[clk_id])) {
-			dev_err(cpu_dai->dev, "Unassigned clock: %d\n", clk_id);
-			return -EINVAL;
-		}
+	if (IS_ERR_OR_NULL(sai->mclk_clk[clk_id])) {
+		dev_err(cpu_dai->dev, "Unassigned clock: %d\n", clk_id);
+		return -EINVAL;
+	}
 
-		if (sai->mclk_streams == 0) {
-			ret = fsl_sai_set_mclk_rate(cpu_dai, clk_id, freq);
-			if (ret < 0)
-				return ret;
-		}
+	if (sai->mclk_streams == 0 && freq > 0) {
+		ret = fsl_sai_set_mclk_rate(cpu_dai,
+					    clk_id ? clk_id : FSL_SAI_CLK_MAST1,
+					    freq);
+		if (ret < 0)
+			return ret;
 	}
 
 	ret = fsl_sai_set_dai_sysclk_tr(cpu_dai, clk_id, freq, true);
-- 
2.34.1


