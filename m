Return-Path: <linuxppc-dev+bounces-3572-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 386B99D96C3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2024 12:56:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XyLcZ5WCbz2ymt;
	Tue, 26 Nov 2024 22:55:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2608::619" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732622142;
	cv=pass; b=OoBjtC5a+CvPmgGNn59M2GCRNJpME0d4hfuqYoGG65L2DDgpQDAkJXFl0EEseY/ekP7MYmG7fO0N3Api5Ll19HHy+8uNB5IB8OFtuv3aTPOs9H7CMrQBdWgFotqdyWqZ165PnOxruI2E8pH3SwuJG2z/ChkpVZaGF9/5pBR0oIjlnJVr9KRTzO5YC18BC/0W/njOSjIQuF1wcdeosAa6apapQs1O55pUfoB68WA1usWhsnmZIxM1sRtYNBnFGgjejOWGXgz/glnQw4BGHX1MgJTUPm5v/OPwqmwRgIi558CL32ICTWdkplGeU5NQwpxpHZFCKcPcN4uGpzcivYvPCw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732622142; c=relaxed/relaxed;
	bh=mZDcaZXrO7LOFmVJ9wk5PjCmIicB+f6nXstNqL8s2yE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R/cAXX3fy4vMvTEtlG2sGopEl6dQ9lDu52ZacAPvwasEelMsNOzEjdg8ANxy03uV69NapVF5nO53kvuJM/A8Bcksq9aDRpFtkY0EhKbFxQnVm+kcElnRFLdlCyVWc0b1NtNAcxghM1EI8KFMYUBwQDGRUj6716RrPXzEXw+R3s4+WMczx00segAClR2UHlYvM4edDT+aPIjZC2dMXsBDqeCI60fjBkuw4/BUdNHWG6BbSsD9nLkVbl/JrjMMZ5bVcReFVNEf7Nh5sEmZVlfIrnhwupBa4vEIbgEhLRCzIiLUuvnVOX/cI037JInqSjZuNCqMrYgxGjPAlQTAF4KHuQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Mui+NVJY; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2608::619; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Mui+NVJY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2608::619; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20619.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::619])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XyLcY6w39z2ynr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 22:55:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPE6rlhKanFMJQVX2cwuwjp5+SCLD6IHMLp3s9mY3jxemHMs68FZCp8lrj43H0YsRRlaxhujBA2oFIJkqVu67KpTrEvrGpL1v5N/ybHhesT7+sy2ubfnVxcvrlUJE94gHkGKvBqvVgVHbkBSaMTB+UiyllJynCLYnG6iQCoWFtdkAxS2S/p6yOAU7Kho9tNfrX7X3Mq+hl2Dp/i9ldPaaFl+u3vpcFAmdQOXf5M1xdBddR140p3pVjDLDUrQFM5SIgSJS8Kv5UXbQEU7+JRA73FSP2LfLVxHshh9hYpjMiqZf5V3XpYExOjuFBjEXBSfYvNkFhQTSkhhnKDdBPMcMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZDcaZXrO7LOFmVJ9wk5PjCmIicB+f6nXstNqL8s2yE=;
 b=eWAW7zDP0Rgy7+fkF9UdkJFaCddLho22y7EHlHbz3GAKMWy1s10bXuO0v3l5KxGf5ayzLT6niWj9ZM7YdjUsh9jJgB3zzjT6yjAC+tgGMrfVxkyK+OwL6HsSqpE0dwVMniqOP3bCNruC3wZ1BhhkFwN6b4mxWJzzvhRnVMOXYcK2UsttYYq9EghxkLtHYVTD9V4cHFV3CvWo3pVGwAWNZYj5OgAAQyiajQuNlNguddqmz+uLkIqcZ3x/0FNz069vg42DCL1Xqcf1ZfJNMXZnrhjegpfANfyOYCPHEaUF9FdWThzcYe3Oub4/6igynuEgk6NV0oW6HAJdvwci1nFBXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZDcaZXrO7LOFmVJ9wk5PjCmIicB+f6nXstNqL8s2yE=;
 b=Mui+NVJYriOrLCNI8GQdgqu1T5Ew10o4XWUYPJz0Z60nZ580QkVW/YyNgKshP7N9iG1RFsaiH08NvogR1JdQk0ciSvpcrhZHKVWocQZshs7Ax7lHtv8/IXhaeioLX5zlIfvR5vJj9vbFX2zCRmfgXbSREQ4/cFopdTpq4ROQyphuO3m7eM3O+sYDwVZUZh5z3cjtbkt2PdYI9Pw2UuyraHP3Vr2eDkjfZHuDbaWJCIz/JAyvCVilVTeE+tlbt58LdXvEi+A+wspMZM5XY7zkU1vLom5ALl2KoYSuiCg8jrTAj7203Q2s+kP5aAmhTxIYULYl4jMlvdAgSQw8+eMCXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DU2PR04MB8504.eurprd04.prod.outlook.com (2603:10a6:10:2d3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 11:55:24 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%5]) with mapi id 15.20.8182.018; Tue, 26 Nov 2024
 11:55:24 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH 3/4] ASoC: fsl_xcvr: Add sample rate constraint
Date: Tue, 26 Nov 2024 20:54:39 +0900
Message-ID: <20241126115440.3929061-4-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241126115440.3929061-1-chancel.liu@nxp.com>
References: <20241126115440.3929061-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
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
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DU2PR04MB8504:EE_
X-MS-Office365-Filtering-Correlation-Id: 204046ed-ccaa-41fd-fe13-08dd0e113600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ja2Y6hHaipjrBcLrEVgpw2lM1AKnscWMyPcDHHFLUs+d2RJto1i2ZZa/kLYZ?=
 =?us-ascii?Q?7l4nltnPk3kjyTuFw509VRi8vcZyIieaZRlMvHELtxu+q4yjxVV43LOVb20N?=
 =?us-ascii?Q?lJCq0dWN/XwA/VulitdKEdKZghxaqPQADZ4Szs58l5ye1H4449pp8BF2PZpp?=
 =?us-ascii?Q?+LAfj7Bzew7BALoURDuWdkHr22HofDIDRo6VlHaD9Yob1cMVeg2vVG1pV4sP?=
 =?us-ascii?Q?PXmg2mbaqXA3UGa9PveWYGV/Vw74tG1QGwWLCG6axGjpaG4rcsIN6vZv//Ty?=
 =?us-ascii?Q?hS6dcpovChnI0G5QvBh4vimgnkgRyxusafRESWbNbopqaptXR42rusnu34Jv?=
 =?us-ascii?Q?KYk/tri+9KkxMbORarDLb+ww20EuRQRGQ83yTFJuALQmVFctScnhAAiXsr3r?=
 =?us-ascii?Q?IJvlBsKq6emzo6Jiiujcny4UqRKq1yvsdR9uAdr/wlOLev9l8A9egTt28qE+?=
 =?us-ascii?Q?p4YWnSquMciFFqA6oAgF1DQfJRk0C0A4ru/YSBM1a1cq8mGM29ybyFtZfBTH?=
 =?us-ascii?Q?/HqY+bIcDZuGTIxWsJhBwrWRXlDXiEV8oL782rHjZwm7zLt6MT/Gk2Mq5Td3?=
 =?us-ascii?Q?CJvZQwHQrSju+Xj6rFn3UMUAiDocH8HogEZ9NQlCCdADVFqySkvre6eEX//u?=
 =?us-ascii?Q?Lo1YiD9LcbNIYoh0tJfeb+fCEEeerkkf+7HMGAbMi+Z4QbC33bE4rW99KK5p?=
 =?us-ascii?Q?TeUABUlSlNJRngfvq0+Q4TyBuMXDercA8IsWFgu3lLDWtsoWCxru4QrgncTd?=
 =?us-ascii?Q?Ei/7x4V5bZz0QrTrP6aAx0rJ8en+F+zEtM/q5j1yDAIf5igqvfYij2dQUQ2h?=
 =?us-ascii?Q?z3lUmPJSd+Nw8Y1YXYqU2K0ID9LJwQ2vh8s0vC6kAg5HCcdwMqpncI5YtRCa?=
 =?us-ascii?Q?IuMbR47oPYpeVttPf4zwN//odu4OB9S3sP6OKboKeHD2Kd3H93s4JX8+vojx?=
 =?us-ascii?Q?/qlk1XJKIBv8aLiQd0PNFdbLXFdyh3osx8GCBPH4JcVKkHvoqjjBXSyrWCmS?=
 =?us-ascii?Q?pKRhIwKP2GpotU2fxGOJkVYOZpdJxkXODqV0A9YXjCwUQXhpj14cLyzgK7Wr?=
 =?us-ascii?Q?btKqQ8yMX4k2HBFw1M/4pUV9lOF9uPNj0gHC/mIK1WCewYaAlqEqpBqKIoJb?=
 =?us-ascii?Q?KwOS+eY+TWWhgwnnSaQfPt0gmuN+J3J7y1J2MhnZ8+qxqG5Y+iyvDu1RSnUJ?=
 =?us-ascii?Q?mSUu6FgM7VFZ06NJwUtvVsiYZ7c98/5CAG3lq+GCc3kGjvoU3CS57e1SIQkb?=
 =?us-ascii?Q?1k41Uh7HZ2tip766oJKFzgle4ANJROIAPXa7nceIcYrJ/93DomisS2+lLs1n?=
 =?us-ascii?Q?V6tl2mzVCz9ABOPmcO9CCOFlcGF3CzWBi34OyXlC2R5rrQMwk82zYwQM4KHI?=
 =?us-ascii?Q?SJrPtxbeQGqjA2qZ9WcpxXkppcjHIUnHRJJLy6aReLDf8167X6PnDb/941Pi?=
 =?us-ascii?Q?gMXOljaukmA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Lif3cfzjBat1RVgpnwU4lqXA/GRM4dnOHJV+eNC34vIQZiKUocUZKib1OE68?=
 =?us-ascii?Q?f4jPPq/0E6h1I9YeQjvRBwUGpI2u60W/qP9nc6MbH2VTFKvFvUOIQcINfzn2?=
 =?us-ascii?Q?yPgyRgzw/KKGP/krvIyotefNEElH70XI4MgrHpAroMHKhrdpiYdWdexv96ux?=
 =?us-ascii?Q?9PTwzMHmeLL2EImxyN9FoHbFhePcqLStsrYcaRtAnozjliazixXuCsjiyU+L?=
 =?us-ascii?Q?f9OdBG4QFhcphdHaS+sL3Iw/Tfbsfrbvv2uaogwNyFxLIS4m1GQPZHD5zoX5?=
 =?us-ascii?Q?2ROszCK9Pp0xmt275JNjka7Fxe2c1KZQnpyS7QuFhKA+mqeZv4vnG1jFyWqs?=
 =?us-ascii?Q?hvwutSs2k2ATTWtrIYmir6KobB7nNDfDprE1m772iPkeZMijtClV8lZr651i?=
 =?us-ascii?Q?uLG/ziKh99DUj7kaJS3uuAUv2iPmR2YCdXVsfrl3hynrbNakgiTIIuVBiIKQ?=
 =?us-ascii?Q?SdGwYhU5vZd01/tg2pz7+6JXPI4NhWFP+jqNYgaA0ERQSCmpS4IxTAi3amAM?=
 =?us-ascii?Q?4oBSy46k/KgJcmJvvxYofcXhu7H5MvoyRHco0SygyJ32b8QMZr5h7mO83yyN?=
 =?us-ascii?Q?HTIax5afuZZRQzjdQPFN4ojSyTTvWndmRZrtduUw7RNbLnGpaU75DGqsQoMy?=
 =?us-ascii?Q?0N8Nlpod6Q/RJXYlVbGFRksxQbERVfIY4NjR8cWcx+9vxGc1G0JmMkyPkCMI?=
 =?us-ascii?Q?kE3CMdiDX8PggNcnwuGCuEBgVhkqxFiGxIC2PEoNHqfyKZreC6YUCrKomQpq?=
 =?us-ascii?Q?AT0A0izx9D40xz2GLsRcKn+wg+HY8db7rX36yDCnzY2Oz4KK23K67tgTQwgQ?=
 =?us-ascii?Q?ZvfZaTngPC+7d37/8mu2LzeUJtguAxADSbrc4zYa5ogh66g/VzqDI4TA9IFk?=
 =?us-ascii?Q?TWH3Uy2MRxFDh+I4Ldv4RAP4ZyB+FZn/lyHWkH+ofWW9nQA5Jt3/2qjlrt70?=
 =?us-ascii?Q?ped0JxU0mARHqTitbi0HaIxpu/Fd4mBW1zql6MC4OJM4Kh9qCS8GLv+gUq3W?=
 =?us-ascii?Q?lLo9itRk0KNc6PR+v2HtmoJQ9MikEHhk7qArUErTxOWbn05DXsNhRoEw/aI/?=
 =?us-ascii?Q?B90ENEsDYgSdTr5VpKycW2NlYHArB5uiVPg2PqS7RZNuAiHz/F2wvx5DHR29?=
 =?us-ascii?Q?znaLEX5vPc8DxlIUN2MEwECxD0mlC8IzupAp2nPORl/MQwq/vSUTHOdLIvrg?=
 =?us-ascii?Q?XF6BDa7FECrukFiUJle6mAfVuqOt6CcnOJkPO4KQseKFGAlEo6zZxaY4dLWX?=
 =?us-ascii?Q?Du9ImThSYNX8Rs/JfLwkYdOH10ncQWJ5jYpqoyJMQwTwyMfZD83I4rjwTD2X?=
 =?us-ascii?Q?FSx8JnEfE3uvQhRHrZJOArurHhtiZkLkXdOM9VCYlkbfVuw/TvK2AhJxkwsm?=
 =?us-ascii?Q?7vWvuIu7LCgiIU05ieCfMnixdoYMgBafPGPl39ac+lWbsQa1dbJ7k4x3qERV?=
 =?us-ascii?Q?LXKF4SEbWPKyunfCWn+YxrDD1Ezj7cN4edIO5nBRyXQZTmKMKDn6qx6Tbupm?=
 =?us-ascii?Q?7arwXMPTngkl2lL8AQTVHHw2DXwH54hZBOU6gwmpf1DbrsADgW3g6ujoqGEX?=
 =?us-ascii?Q?8lADFpC/WT0yP7DGHCEIpTdmFGF40xy8B9XjvyQv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 204046ed-ccaa-41fd-fe13-08dd0e113600
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 11:55:24.1622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CfNtk3BRpljVdutFwwMIiKiak+SwwQZaaYCVQYwAtyfMPlxaxAltYqOIES8sxlm8fECIcqHim76EUTI5N/LNHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8504
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Platforms like i.MX93/91 only have one audio PLL. Some sample rates are
not supported. If the PLL source is used for 8kHz series rates, then
11kHz series rates can't be supported. Use fsl_asoc_constrain_rates()
to constrain rates according to PLL sources. This constraint is merely
applicable to playback cases on SPDIF only platforms.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 1e0bfd59d511..bc625f9fce61 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -19,6 +19,7 @@
 #include "imx-pcm.h"
 
 #define FSL_XCVR_CAPDS_SIZE	256
+#define SPDIF_NUM_RATES		7
 
 enum fsl_xcvr_pll_verison {
 	PLL_MX8MP,
@@ -55,6 +56,8 @@ struct fsl_xcvr {
 	u8 cap_ds[FSL_XCVR_CAPDS_SIZE];
 	struct work_struct work_rst;
 	spinlock_t lock; /* Protect hw_reset and trigger */
+	struct snd_pcm_hw_constraint_list spdif_constr_rates;
+	u32 spdif_constr_rates_list[SPDIF_NUM_RATES];
 };
 
 static const struct fsl_xcvr_pll_conf {
@@ -585,8 +588,12 @@ static int fsl_xcvr_startup(struct snd_pcm_substream *substream,
 	switch (xcvr->mode) {
 	case FSL_XCVR_MODE_SPDIF:
 	case FSL_XCVR_MODE_ARC:
-		ret = fsl_xcvr_constr(substream, &fsl_xcvr_spdif_channels_constr,
-				      &fsl_xcvr_spdif_rates_constr);
+		if (xcvr->soc_data->spdif_only && tx)
+			ret = fsl_xcvr_constr(substream, &fsl_xcvr_spdif_channels_constr,
+					      &xcvr->spdif_constr_rates);
+		else
+			ret = fsl_xcvr_constr(substream, &fsl_xcvr_spdif_channels_constr,
+					      &fsl_xcvr_spdif_rates_constr);
 		break;
 	case FSL_XCVR_MODE_EARC:
 		ret = fsl_xcvr_constr(substream, &fsl_xcvr_earc_channels_constr,
@@ -1405,6 +1412,15 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 	fsl_asoc_get_pll_clocks(dev, &xcvr->pll8k_clk,
 				&xcvr->pll11k_clk);
 
+	if (xcvr->soc_data->spdif_only) {
+		if (!(xcvr->pll8k_clk || xcvr->pll11k_clk))
+			xcvr->pll8k_clk = xcvr->phy_clk;
+		fsl_asoc_constrain_rates(&xcvr->spdif_constr_rates,
+					 &fsl_xcvr_spdif_rates_constr,
+					 xcvr->pll8k_clk, xcvr->pll11k_clk, NULL,
+					 xcvr->spdif_constr_rates_list);
+	}
+
 	xcvr->ram_addr = devm_platform_ioremap_resource_byname(pdev, "ram");
 	if (IS_ERR(xcvr->ram_addr))
 		return PTR_ERR(xcvr->ram_addr);
-- 
2.46.2


