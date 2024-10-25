Return-Path: <linuxppc-dev+bounces-2572-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D02AD9AF9D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 08:20:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZXhN3Gxfz2xjY;
	Fri, 25 Oct 2024 17:20:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::629" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729837220;
	cv=pass; b=Vhc66owTtkij6vCI4rh/RCh9JDpgVef3kbOIJ5wd8pmi6UGNxmC6C9/tZyyfIMYZzNOeXZpAWQpMLZ/B/hXL6XImXiwkJpcgu1en2uUNqhUWhP10bbFe17wwNz9SgCxY7ER/nrBl/G5A4NRFIelNzdR8WrleNIC8+eGSV+KmjjM0cqWyEZxvdn95QCf/4jhRQoZq0dii8JYJcGqHAoIyIjUagwDTEdFaDgb4O68sMHju1jkgmzN+nGxVaTXqr/+WT/diwe5hVi0jh51E/OEwfHUyKkSMD1pHTcN1hwiRy0i/zfd2S6Ioc0lL4EtrKzijqyyqO26LTqZT1RnRwUgEWw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729837220; c=relaxed/relaxed;
	bh=H2otLbeoziJDP/HS++F16VE9xpn7xEvviA1iNduml80=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Ky+/Lu1OSbqQmVaa7gd0ktkfUGx2TjzprQ9wEuOCPDBWvqlcRXL1Ro0ePzfvIGJbsxxBxk/FmIYry94sXXaWFCPR0dp/0hEjPE19eYO8rXS0wa6lGyLdE8uXj6G8awEZrUQlwI4zEmk23OjQhIBLlMxo1lJXOyOnQZFiVa69J7TrzqfNrDqe5Y5t66kbrjhgsgajHP+PRFH7vXE0WFelVtdW7xZ9UbhVXpCGymw37i/eJGPaZlRzRZn1nA7xps4GFzAtDO6Dt7yQ7zG19bFcLli8oa+DpXl3gKmaboUy8VOkHwr8rUUBeJP8vHYkpEhJv1O+CZGu7haC45VBSSFnWg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=OGvhlWlB; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::629; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=OGvhlWlB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::629; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20629.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZXhL62Cjz2xjL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 17:20:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1/QYGj6xwuTJl5pJIb5PQE7NSd2zHCdXIKA9x8xm/FxQCMu/MjEsSPWvsY3OTTXOMXztJwbm3KM2H7SmrpxRCefL6X+d/CDVLgc/x7uAG3mDk9XmiELDA5JDuMMOxHq4gTJlp7F3qkVUJYmqYKPpxSQ/wNJOuLQoYOzs3RwF7VU50wbfdeStgzdPciV9WecvTlwPD+QJ08vCarg6AeweIdM/eSIB/rG8+zcubILa20QScYb7DpZTCsF4LTiPxfr2TUbw+3tavOeI1wI/MGiurxcTovgloU3rzR8kMec1dIFuMLjGhRG9IQNihp995LBXDfGI3bz9iMpbxt59F7ynA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2otLbeoziJDP/HS++F16VE9xpn7xEvviA1iNduml80=;
 b=i0KfW5b/fIn0qWfXKhQKs1gmWY8g2uKjfjmPJ7HI1eIsNoCyY+tZG1cqFNmyNrPr7YvSFpC7dRQCDFj/kiTthmxfaQIqMMm55bc+jPRMEGFF48EK0HyOG/lma6+kjXpascD1vkCgVVbHLC5PRxTeUjLQHkbOKaMKTlO3HHCm+2JSS6PmdyWY28Z5EA+xwHrCLBNfenVKCoYJ0QuSGhALdxnLVE2R24sk0vr2vanmDPvcHK+SgJoxSf9UutacxLxIVwOpDdgeMjv/yQChMLBj7h6cm/EqTmrBnQ9A9Jy6/W12gpsB7RjSAYpT2hugWeUTP408SiSebgROF7WIqWsOOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2otLbeoziJDP/HS++F16VE9xpn7xEvviA1iNduml80=;
 b=OGvhlWlBFI8e5KZO0fAvab7X00K1m4Z7VctQkE7R/4DfwrI2YzQQTMy776dpu3SCAbRcUYgdiHzGkxjtmxYKfb8rFPRC7DMS1vM1Ob8mSGiJOUUmaK0migNX4OpYRarSWoeus+KfhoXGEEzPMetnlUJN8L78+7R6U+0qry/NAOo72pmRBhI9CkcOBcZTy/dADmpx6we6MttoHVq//QbGMskNGZiWpIJMuM3TCCX/Ciory+mrvyp4PbPccjknEBb6piLVUtwAvliWrB1aXq55b25ZKb6BUFA+RpSqzrDk8Pff+sJLr32Ph7drdtwlaTfHJkGTO7RQuwqHaLgw7jFeNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB9PR04MB9938.eurprd04.prod.outlook.com (2603:10a6:10:4ee::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Fri, 25 Oct
 2024 06:19:54 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 06:19:54 +0000
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
Subject: [PATCH v2] ASoC: fsl_mqs: Support accessing registers by scmi interface
Date: Fri, 25 Oct 2024 14:29:35 +0800
Message-Id: <20241025062935.1071408-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:4:197::17) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB9PR04MB9938:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c6d9528-01fe-47e7-0b03-08dcf4bd0a7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dQVndHVR4x++pHa6Xa8dii15gdhY/JVJhf9scrc/5z4M8526VEOJumk6qeBD?=
 =?us-ascii?Q?C6abz+uPD6GgP1CxORqMRVCWdrXkf4gQWN6qRMS3ULeIAks4bGN/l0FAeW+f?=
 =?us-ascii?Q?EB4LSkDyFUy1KZfcMpqduIbrFceeY50mtQWKa62dKXMUTy76XAD/ceO3nC9U?=
 =?us-ascii?Q?ax+iKNcsaSu8HRgadLgdtKVcDx6ROODDuNZbe4FByCt7SiCeJwJX9iNnT+Bq?=
 =?us-ascii?Q?ag/ir8q7ue2NqxP4fZVuOcndubfGDPCaZDgjtY/83XZC+Ys5opkbZdt8xLf/?=
 =?us-ascii?Q?J93oJQEJcZzv9CZDckzbK+8xmL0qn/RfMBMLBBTfU38Y84uN/e5NDyQ+zHhi?=
 =?us-ascii?Q?t0JORNA0O6l5o975ZYunicKQmaO68DPXoiLv3SrA55SdtsPke1kWZq2lxzv6?=
 =?us-ascii?Q?6TRumZ6VqNOD7GvH1KY6udlBt7g56W21mP/YIXEcDGErooGm8DfcW6Vum81i?=
 =?us-ascii?Q?sQ3PYU9FoIOmkrLS5ODbNLekbWYHQRA0BFMT/1DEqGjpN0IEghvuhs5SrwNM?=
 =?us-ascii?Q?G3m6omGCVtkkn0/MGX8aCi1a2yc+7glQiYofLsg2Db+vUtqzSALkeRvAYy2g?=
 =?us-ascii?Q?6tyboaZC2TJj2dr7yVmRDURPPQjC6gVirnqRmt/DJmtxyM4vo9J1nQANhY00?=
 =?us-ascii?Q?qxHDZsjFUbGpIn8p2q79djUp30O+wL7e0ka/F7J4PVNQuxgRjcNuQ/ROiNFG?=
 =?us-ascii?Q?PV3EAYtLPb8lKBArVH455ucdi7bUjw8Etz4n2zInqo1LuW0apICevxrYjjGX?=
 =?us-ascii?Q?HfNCqOvoPbzMHLYNkG/gz9KkgAJdiHI7pn90FJOmCWFI0at1UlF/t4SItigh?=
 =?us-ascii?Q?GH1md7eQTdcrYK31deG92hFgiH62LcLWy6MpMYULzMJvKUtHTEo2m3Iizjfp?=
 =?us-ascii?Q?o5qePYPrP+KpN8QR11yMxbCJV+nYkAbH2I9H41SbGiEfqGp/H6aktF4dLI8p?=
 =?us-ascii?Q?k15exlVIba2Mss4go0tzoIZe05prIiFqv4xJEbw9RzJLCO/2Ft4R/+SyYY+D?=
 =?us-ascii?Q?n0P8QCE/ZU8AfrXolN+4kgjyTnhp7M/Lvej2Nonx2uCJrXYvlkIV7g9Mljnz?=
 =?us-ascii?Q?H+FOnYu/Bs59dI6JqSmwMSrJa1noGLOYINw5DM6hIpbyzec7dUpIm/UlpUVA?=
 =?us-ascii?Q?+YVXXe2MUjVjSKQp4Bkx3VqdBsppnGQASpnrsvQpAwqotdpfpMbFTcOjIY9B?=
 =?us-ascii?Q?bEzImTD4IzAdadN8FROekxeTGA35GeZnJ9Lv4Xe4edtKvUhugJug6qJWZJqT?=
 =?us-ascii?Q?deXKxqOHZqXPMqT4n0oc0Hm/ZfXAlvsmUB5YGozrhsL8v2QGAe/Q1w7bSf1M?=
 =?us-ascii?Q?lYYRFY3CpqfSK3nACjyeXR9zBoqG9uN9AbC5LPVgO0h00Z3Hxlhej+xZuupw?=
 =?us-ascii?Q?3qVkb+opSAnZLRBNNh4TAFjpTTqU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yVhEER0w53RNsJblZS5LBYDDlmpcbEWCNhuNwgAjyx5WA0UMHKFoiq55KzPl?=
 =?us-ascii?Q?EgUInLtwqoFjprCZp42S6hOi8NdD5kwFVgumDtbrpH2mUpJI1/WqqEu4rt2v?=
 =?us-ascii?Q?XZT3qBQoq96zWtaTMbql/NwrAFizvawhEc3uzV5f4L3RaadTa67EzXu0KjYV?=
 =?us-ascii?Q?A8Km9jt0BBqNO4Z3cqd812p+s2/VkA9sTODqWjH18C8pMDYKhXrgqvsjaB6H?=
 =?us-ascii?Q?8yavACO+cOVdkD6DYsdvcyviL0SucKgPos3xByPXBKLjeqWDqQK0yNs791hq?=
 =?us-ascii?Q?bG1N68U0O6xUxDth06nh56FTK/eRxv0tDVw9JVgBS5hg9GPGhQ3TpndwSqlr?=
 =?us-ascii?Q?rOYb1Q3wG5H0vhc6rZpg8m5m5yInoJGJFz/mwuuUIvFxKQof1JE/x17Gtxxz?=
 =?us-ascii?Q?Tabk9qeoBUlfWQluoMTFuTdIaVNznA/mIIftD1MN1wjvL7hQDOWgVjYE6PPG?=
 =?us-ascii?Q?XXZfyfNO/Jde6OaE0ny97Qf78TkbBF4GDkOGMb318GaJrKOjHsc0PLq933xa?=
 =?us-ascii?Q?GoEP3zcwHT1XgLcP4pcSYUAjOdgDoNDclqZY4j2gldV2w3sYfJytLLWAg57C?=
 =?us-ascii?Q?uaJUY4lbjWcSwXXRI8lPC+6pAPM99o20TluycdqYP4Jntok4DLkrYED440cy?=
 =?us-ascii?Q?lWKFsfvwpO6/9HEbBrlAzp44yQWRJw/VVt20RqXPB0qoBhgmOo7hfMqvjMGY?=
 =?us-ascii?Q?fvoN2uPyI0rCcwoaEr4K5Ivr1x+fR/l0jJI7wa9OUZQ7Y7rQdBhpL7M3fPIt?=
 =?us-ascii?Q?RSr2EnbS7HuNyp3B9TISJj/ePxp3f6Xl4HvHLovqXSTylxuXeiwOahw5KGav?=
 =?us-ascii?Q?+BqtOIuKrILRH+Yjtg2z/iNUqgAvoy3Nc5bfpT3CKl6Nuf8R7HsGfCX7FZ+i?=
 =?us-ascii?Q?EP68sZf6OlM/NPln8xWS8LodxOJ69MfLj4GOE5uojoH5p4QwPnAWD8omGhiP?=
 =?us-ascii?Q?DqokQlV2jbhcddBnCuElm7GLqZFaCPSBO6xK2CBEQZqIE7MGbMyTzP1WKdD2?=
 =?us-ascii?Q?J/TteH7TmRQfkn/rpMUFP7zwmWU5pwFjcDDjVUw7e3iDnL1RkPm2AqN+mwSr?=
 =?us-ascii?Q?Xu/rUbczy8uoVSC25sOyJkONflwz+WtxqLsb2/e1ySBKVAwdVpRkxbiPvgbB?=
 =?us-ascii?Q?bmubTZt/FJUdacSJneMum/zoHVBNkviQo8rCuK9NItt+PeisGzUVU5GkMtv6?=
 =?us-ascii?Q?kIFFPI/+AFxH+QAxMAnesH9dfStGUz9NU7U6ckeOY8bvFmYDKdtpmo9GhwFk?=
 =?us-ascii?Q?c9qHL3AI5h4ABIk2b97WvZphh29mC0Oy8NK+JKVChisUKxpTqdlsya6c6b52?=
 =?us-ascii?Q?0x75j61qYlxHijZ+lnrtY2uyMKdS6Uv+q0f3DowBkM21R7v2QZCOgQP7pVzP?=
 =?us-ascii?Q?S03umBdyNDAZLIDF+YUnY8IEFTgNot5HCsNQ0SOtykfqyteASZhHOYMjdqXs?=
 =?us-ascii?Q?jXtun6jHBjHvvfNOVU+E5QSI4U8kusDZVA2M/IkqyVGZW0KjKskmD/9Iz8aw?=
 =?us-ascii?Q?Bhsv1ZiDRRH8ReeiQWtGa0OfGNE8tM6dzmQSWdZkIbYJeheHbtCnHn1SE5n9?=
 =?us-ascii?Q?cH4niW0pf4nx4Gn4YWPDrRDuDWV9L0Qtf3t3hwX7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6d9528-01fe-47e7-0b03-08dcf4bd0a7b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 06:19:54.5276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRGNrkRenKUKVE6I1Q5LS4HTdDriSuG/L0DZTa+rN3tOPe9VY7fAAbp30sPWCnny7BvNMobh2AVCDlOYgPTtHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9938
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On i.MX95, the MQS module in Always-on (AON) domain only can
be accessed by System Controller Management Interface (SCMI)
MISC Protocol. So define a specific regmap_config for the case.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2:
- fix compile issue when IMX_SCMI_MISC_DRV=m but SND_SOC_FSL_MQS=y

 sound/soc/fsl/Kconfig   |  1 +
 sound/soc/fsl/fsl_mqs.c | 41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index bff9c6bda344..698afae46918 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -31,6 +31,7 @@ config SND_SOC_FSL_MQS
 	tristate "Medium Quality Sound (MQS) module support"
 	depends on SND_SOC_FSL_SAI
 	select REGMAP_MMIO
+	select IMX_SCMI_MISC_DRV if IMX_SCMI_MISC_EXT !=n
 	help
 	  Say Y if you want to add Medium Quality Sound (MQS)
 	  support for the Freescale CPUs.
diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 145f9ca15e43..0513e9e8402e 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -6,6 +6,7 @@
 // Copyright 2019 NXP
 
 #include <linux/clk.h>
+#include <linux/firmware/imx/sm.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/mfd/syscon.h>
@@ -74,6 +75,29 @@ struct fsl_mqs {
 #define FSL_MQS_RATES	(SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000)
 #define FSL_MQS_FORMATS	SNDRV_PCM_FMTBIT_S16_LE
 
+static int fsl_mqs_sm_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct fsl_mqs *mqs_priv = context;
+	int num = 1;
+
+	if (IS_ENABLED(CONFIG_IMX_SCMI_MISC_DRV) &&
+	    mqs_priv->soc->ctrl_off == reg)
+		return scmi_imx_misc_ctrl_get(SCMI_IMX_CTRL_MQS1_SETTINGS, &num, val);
+
+	return -EINVAL;
+};
+
+static int fsl_mqs_sm_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct fsl_mqs *mqs_priv = context;
+
+	if (IS_ENABLED(CONFIG_IMX_SCMI_MISC_DRV) &&
+	    mqs_priv->soc->ctrl_off == reg)
+		return scmi_imx_misc_ctrl_set(SCMI_IMX_CTRL_MQS1_SETTINGS, val);
+
+	return -EINVAL;
+};
+
 static int fsl_mqs_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params,
 			     struct snd_soc_dai *dai)
@@ -188,6 +212,13 @@ static const struct regmap_config fsl_mqs_regmap_config = {
 	.cache_type = REGCACHE_NONE,
 };
 
+static const struct regmap_config fsl_mqs_sm_regmap = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_read = fsl_mqs_sm_read,
+	.reg_write = fsl_mqs_sm_write,
+};
+
 static int fsl_mqs_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -219,6 +250,16 @@ static int fsl_mqs_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "failed to get gpr regmap\n");
 			return PTR_ERR(mqs_priv->regmap);
 		}
+	} else if (mqs_priv->soc->type == TYPE_REG_SM) {
+		mqs_priv->regmap = devm_regmap_init(&pdev->dev,
+						    NULL,
+						    mqs_priv,
+						    &fsl_mqs_sm_regmap);
+		if (IS_ERR(mqs_priv->regmap)) {
+			dev_err(&pdev->dev, "failed to init regmap: %ld\n",
+				PTR_ERR(mqs_priv->regmap));
+			return PTR_ERR(mqs_priv->regmap);
+		}
 	} else {
 		regs = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(regs))
-- 
2.34.1


