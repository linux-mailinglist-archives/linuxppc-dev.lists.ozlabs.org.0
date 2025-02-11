Return-Path: <linuxppc-dev+bounces-6073-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 047EBA30264
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 04:59:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsSNz0NKpz2yLB;
	Tue, 11 Feb 2025 14:58:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::609" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739246339;
	cv=pass; b=T0YDRH+B3R+C4TY2DiAwkWhtSf+ZxT4WInyB6eahBclN6RdU1MU9K3E/OyJGLe62V/8S7qhDt3naqRxwgTnTrK5g9JW2zf5lhxBikC8hlDunAiVI/zPRtYC7vuo0YzRHz1kVPKdLoyGiE86vihWZjFBMoGECMOgiR0ivs4i96lj2Q7QSjizfiEvH1GDCssASGSuCegumIWk+ZziLXHyw2nfLN+29Lhn9rIPiHKfIOiAMI1gVQFR1j31zbr5lQKckIAJXaAao0wj2+yAnulBSP//HEx8uZJxgiHicuZQVSkbX99NILx7pJJI8Rv/BwkwT1zjCjwjJn44oXhh4/r5DMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739246339; c=relaxed/relaxed;
	bh=NVDiB0s5rkypj/XU8oCXFDCpRDg167DEAAejaaMfOS4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PcawDuM4DgLS63A1PAdaCA5FVUlmCQaBOEMi2KvIgSTdcVZze8xM2op+MvxxAkcfEUVMf1xu+QwPFGAZYbXUwIGZ4HjgmVrZRYT4cWCfzFsv3kxuemcRpaejvFKFXZDz2PCZPIfmZT9CvUDfG0NHZucuL2QfwzDAv5O9GMiW7G752bY9275MbS0vhj/T6FDvr/EfgA8IhS2QvuWIYvuivf92mkHioLGnLmwK3TEvEUgZLo/9KnKcTJ8w6M/FmXk+GNhJ4COgAiy3YhdV4MSVVUAMFTKByN1yulw8OIPlSohqdOkecf5uhSsxXhwksLpOQ/pQFXTjmBZu7NjdtMxl8w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=BYbTr2w5; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::609; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=BYbTr2w5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::609; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::609])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsSNy38wmz2ytm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 14:58:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFxD2/kvLEtPsr1BmHcslyfvZUzkr98+e9/R4fsnk6/PV/eAq9SlWi54rzZ9x8tCvmDMkIxKF4DRFKdASjfu+Jy3r9ptmQXMKL5GAl4z0dTlYf5iFjUQ2j4eKKUM6TuuCwe2wGx1blW+DrZcggTrSQ3zR7NO5txCfxFWinL0E9xfEAHKgfOhcBe7BTq7litVf66/RhugbSEUmCoXpPp1BUNQELEEH2m6HSIy9IYsbu18xL5SxCJiyPsvZTLToFe8ZyLkxTuVeZjxUAzjKdDgcVaDziOLm8bsde5Z4Rcq+1twfasxIeq3wYqTjW4euFFNRESZcOQy9seRaZ/aQB231A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVDiB0s5rkypj/XU8oCXFDCpRDg167DEAAejaaMfOS4=;
 b=WbceKl2BylT8yRG65A2DYCj82am16bbaVIqeNEjnbXhKFKd8PZTUtjMfSXOkR+rXqsbk7PguH4SxeLbnpZIxzeP5QA0VnAfPlCRSz2sM+dMhE7HSS5F/12KdC2y0JOYmW3WmnHn4RO00XXjMv2/HhqVHOXYj9uwBcKtrRZv90NeCulVpPl4/3kQTTeqGTws0J+mw6y37fgfExDBZ9k6BRB41VcmAtpmOBedG1r+B8i3SJZ1NNfhAaLvaA+R6yt4xw8LDJIIbj8l+hQUZ2KcvfNmph8HQIGYaaqObKxBThq3dAZK+cziqhKvTvZqFWmctuWCYQ4pypuZ5nVvtPuI06A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVDiB0s5rkypj/XU8oCXFDCpRDg167DEAAejaaMfOS4=;
 b=BYbTr2w5yeLi0cOOsI3Lij+cKvslgJtRHhIFEpJq1jUbXFuC0F0DsZkiRIA6XMzopf1IB3/pDLHpzg2tmYVsjx+IKyQnopIw5/7CYF8NENAC3dewaz86QBVYo1HR12Ihc2DN9aXKhzNhIOsy0vw1z6r6MzupQCVEaD3E/DKfgTy6HAjdoO/vbAVztqPFogBG9vCU+H4rPNO6l6B0icDaEGryx8y285sWptneFUaGAqkFnyHrbkfECTstWKM1fYD2K6FNC0y0oGUXLjJGJWJvdayBY9NV3FQEJ4PLgKPrugioWkzhoNNDzFCCQmwGepqtaxSxpTW7vzmW/j5tLejLfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DBAPR04MB7304.eurprd04.prod.outlook.com (2603:10a6:10:1ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 03:58:42 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 03:58:42 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: imx-card: Add playback-only and capture-only property
Date: Tue, 11 Feb 2025 11:57:36 +0800
Message-Id: <20250211035737.3886974-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
References: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DBAPR04MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: 393e4380-5cf4-43fc-c51c-08dd4a506005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M6DNmYfnjj/JQoxMk+MKWV18DLlXPRSAfPRbHLfFyZCo7ndf6C+slJYv769J?=
 =?us-ascii?Q?klGCwqkhOyhDbNF74DxYEZ2v78aX3JRZL0wWYXdE7lySgel7wS5rOIb+Ku8c?=
 =?us-ascii?Q?1WrxYwl2zl8hJPd03m/VKNR5S0MzIi4+2A+KpRnYg/qWXZGmaSB4Kq1qRHCf?=
 =?us-ascii?Q?dBcCrPuOc0x4gjsxdBm7SzZDszDkQ53Shoh/mlchCY+eR5Drfj2wf4aOnba9?=
 =?us-ascii?Q?nEzHZCONe2WsjbdY7FQf4MmLRTKgNWgaomVdEOYN+7ueMvUTFVCtJ+97ZzLT?=
 =?us-ascii?Q?E1qi706EHjd8rXQHsYffKJ1nuOD4RM4CEpfR+vvqKBVr2wfpbvVt8BPKo8Ig?=
 =?us-ascii?Q?3+inVvrIDR2/33mqDomoAxF+3wDif5ugn4REQSlfVPAiAQOr6TwQD20yNlRD?=
 =?us-ascii?Q?DzRm7bux6LsUEEG7s8jJaayi8k/B5L3TO7Og5QAqIqJYvfDLXCXdC92/+9b7?=
 =?us-ascii?Q?uNrJ3I4TQT7p46OVqqeSQw5q09usMFz3u3F2OI4EKPg1kTZsjDzBlqmC7N4s?=
 =?us-ascii?Q?4wmNSRIQEl6RF2q87oMnm3pNaWHhJ20JchVfwV7yZGSy8d7jxrIKPD1ITJ+h?=
 =?us-ascii?Q?vPltYnfWohyvbNGPglVFmaTaD7PiLwT1BuzKnd48ltPhQYfAvvqWs0oNZ7Ow?=
 =?us-ascii?Q?0JkE2nYc2h2B760GDBwUqdowOmPOtRzdCSygTQ37Jb8sI4Olte1lx48EHUS3?=
 =?us-ascii?Q?V/EZ+NZi6W4AsRLjlHEH/ThOEbH50+4cq8WsRo/FwbQnmBqBOZCLC7pvb+sr?=
 =?us-ascii?Q?1YKmOaKB6DW2ty5hcmdvsp+yz+8xjC5diNkci2FE9WbjO2OWw6Qk04mGuupv?=
 =?us-ascii?Q?gKOU4W0TkpNcZGavZp2RmVc0nUrhjAwjliJl7tzrs5NUWY0oUu9bpyJ0IPKl?=
 =?us-ascii?Q?FjVVkLUzqFghynnmpOX9GjN2bkbObcDh/wqZxET8qDtyMpv2WCTO/EbynVr/?=
 =?us-ascii?Q?yl7y5mJh/BhhIftZEyvCoqulG7ixHG1vamAAvY3MOWYeHnbcFUa/tv9jof6n?=
 =?us-ascii?Q?njsO7od6NPcU+Im8n1T1V49C/Evy3Mo++nW3AI986HCK8yCSO3ou2lfYjn4q?=
 =?us-ascii?Q?4SCO5BDEBY0Q64u1mRU9lt22HQsAvnV6VfFFvKCyIa7ghG+Hx+ZaAc1esgKR?=
 =?us-ascii?Q?/w+LCqGDtUli6CPcr5xx+rMEx1HPypJI2effPWiFQ2xtcQcCPrQD8phqyrNN?=
 =?us-ascii?Q?6r7F5xsRllS/c+B9GS821Rvqw7PND2kgPaaKuBAfeTAPxv4KN2B0Eap9yhi8?=
 =?us-ascii?Q?hWQ8ILZ1qCvpHmZI/jA5yB8GNH6g9Tv5wB9t7miCrILCLu0wHqbor6oQxhs2?=
 =?us-ascii?Q?h+fB57IZMykHDeaNwZN593L/PVSUHzQMIxkJgYGzc1rhQTmJ/58ahzmaEIAT?=
 =?us-ascii?Q?/h8YeG5pKqw6725JqFTrrcIGOnemcLHuqy8jJKazL2hTJ85bbkel7mNppde+?=
 =?us-ascii?Q?oLWpBcgsZLvJCIkw333u21NDKtau9rG5mGAQg+e2toNR0KjXGTlT9Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ioln9foV7bLEM8kACpWudRGjb7HLO7tOEMfGQ/epoUxWrGQhNk/6sRX0vMdS?=
 =?us-ascii?Q?9bZWfrRlAevSX/9dUjC7HIEMxXAfPS21uMsw8Fmjw2+jZriulMWCWFrg+elj?=
 =?us-ascii?Q?XbXhGhbPjVuZw+Hl4G7/RSQobo/sJag4rd/8X7OTBMhBwujUFHxxwk12f1rI?=
 =?us-ascii?Q?ze5J2RVcaauXqMZYb8VOvVEdb25GwFb1KPxZ8VF2EMjvIw5jfRGbSm5eDyA6?=
 =?us-ascii?Q?SjGXusNyjKySTuWCfyFm9gnONmQ1aF377yyVnae9TWs8Rn1+AuELcJVe0/GT?=
 =?us-ascii?Q?GtelLo6EIcdflsQjOIToVDanamo12TnWPdns5XUgGJYdeXciVpcXyCUBEiTq?=
 =?us-ascii?Q?I2mIGr8jf/1Oro1nr6KqaaluH4VpYdLXEoA561lvWQN/AyaH2dNwxx8sGQ8K?=
 =?us-ascii?Q?bVNB5B02zWgoDMv307DnZk6LYRN/wiMellx1o6fQASdQcfEjCaSSMuHT0j5n?=
 =?us-ascii?Q?zcDXwtmOzYwi2RquRNfnHtKGBDTpflBqgQ6sIiF0exRm5YBlyYmzsGzxrjta?=
 =?us-ascii?Q?TPnMbGK6YiQctrqiW+b8trjOLW2vKpbu+l2dAs/L/zAiD5XZ5C+Y96NHh8dw?=
 =?us-ascii?Q?h3+3yl05VT2VPHdMesKR//BF9lUxzmIhQmhuzVT2crdTRSVzUNRTXyGbwCDU?=
 =?us-ascii?Q?dvtpL20Jq0o+NNhJ0PA/tLwCI6MLywMf4GdhiOWCA8anfY5Edradp9bRlIKL?=
 =?us-ascii?Q?Jukqd8Qf4Y73bZvFLv9Qt/WkJCirmkVEt9QHyQDfPe4/LLNaPlhaynBFZ9ba?=
 =?us-ascii?Q?AvfaCZSYRAthaldY+62nn7DrSKNrmOTebG3O4IGUIsnjW6tQ+iBqCU/T+odK?=
 =?us-ascii?Q?1lKJ0CPIf8RVKJUIfSo3UdqaoirtzoqotQ03YrDgiM7HaYMJOgfAg5KoXDy6?=
 =?us-ascii?Q?TVxcan/btvWosLaU5hdOYitGmHfXSa3UC1X/JlYkIRWw/cMbAv3tbIYGreNb?=
 =?us-ascii?Q?oDVic31iPdQJkWddrTC2Bq/fLlNKdj8N0IMQtlGAJYIdg4G4Fuc4FAB/M4OK?=
 =?us-ascii?Q?IqA+0qNwFOXwCUuJe7nhfJ/xHSbNLriTrFBfkdzYA9uq1Rw04l6WPYtoQXGI?=
 =?us-ascii?Q?1PrhhneHqBIZyBol3lDgjCgFvjY/frooakNq1idFlU9ReV+HcnZ+pR1wEpSX?=
 =?us-ascii?Q?pO3t2zyXZ3cW6VunF26Nu9My6q0fvJCB0DtS0qPQg1oxpAj3j3cGtq54Xp7F?=
 =?us-ascii?Q?Ihc5GE6po7lPjWz/fHvB/UijSI1jnwsbaAK8W0RdKjbapp+nOsPEum6YSVc/?=
 =?us-ascii?Q?J3BCra+G+RFuHobETat4IsKsvfZ+lzneWkqlHnxJpIkA/ZQeszbTfnEjofMp?=
 =?us-ascii?Q?po1HLFbbE8F5vQF6kXMZkP/5FRgcaHv7suK6y6VsRKEO1X8lbBuU4/KhJ85x?=
 =?us-ascii?Q?x8Rpx4UNOwgyx5haCE+k0xnBE6n7W/19uBQsOR6IFCtxWKXpFgMFl0BHdBE/?=
 =?us-ascii?Q?sJyJvBO1UzvgPhAR/OyvblmDMcabsp3mgGzCf0CW56xAbSg9GArl0OzLjZFr?=
 =?us-ascii?Q?4pEMeAzzo0TwLTqkyWQPdHMOgcjGA85kx+/SWKx23ErSBBXs9fUmdkoMT7RF?=
 =?us-ascii?Q?IpL2PVZhbXcc8QGIfcbHivo61RmMqdvgKB0XirdE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 393e4380-5cf4-43fc-c51c-08dd4a506005
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 03:58:42.8217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7JewoQrM5UPgbACRW3HBdai8DX278Rrl8X9FZxh3cekbdN0SLtrH5s2diAYMqvGdQqZ0DDkhs2j5K4vIINYq6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7304
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Refer to audio graph card, add playback-only and capture-only property
for imx-audio-card.yaml for the case that only playback or capture
is supported.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../devicetree/bindings/sound/imx-audio-card.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index f7ad5ea2491e..86571fa930f6 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -46,6 +46,14 @@ patternProperties:
         description: see tdm-slot.txt.
         $ref: /schemas/types.yaml#/definitions/uint32
 
+      playback-only:
+        description: link is used only for playback
+        $ref: /schemas/types.yaml#/definitions/flag
+
+      capture-only:
+        description: link is used only for capture
+        $ref: /schemas/types.yaml#/definitions/flag
+
       cpu:
         description: Holds subnode which indicates cpu dai.
         type: object
-- 
2.34.1


