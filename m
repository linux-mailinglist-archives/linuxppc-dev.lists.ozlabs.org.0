Return-Path: <linuxppc-dev+bounces-4601-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E2BA00434
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 07:23:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPYRp6SfKz305m;
	Fri,  3 Jan 2025 17:23:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::611" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735885414;
	cv=pass; b=M97Hvw6+bXWHTlWu4ubWvQmNwsiZd1frlHmpSzYIOaVVxiQ5P/Eq7fFdV7qMgSGRfPKLDYhcY2HA3PEm6R/AtIIWb+/6XqDPXhNUgY3akAdAauVNozBTdy11wr+6DFdcgR58LrHi4F/JgfuYSn2xAi7XJ/q74Fjag0kX/wlHMVHEzvlVrlrKHk+zdOedJ7XXyqNTdG40d2k+lzHDQ1xq4AHY2p6fWIV8o/a5Qx4nL0fEN+8GZrMSIJxivi5VH+wYOorry3ep302OjdsAFi0E8on3m+wZF/ewbinchywPic3VDgvaNMPayzNVvo6EO4oK/57QtzOkym91E0AByCNuHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735885414; c=relaxed/relaxed;
	bh=BaE2Ypc92Ok6czI2zettvmxX+IrZP2lNiBLQFEzkJOI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PJc9TQZsT0lBnXzSCzXeBxnM22T/L5XF0/sUb4MVVDxT51K5wXSQVZYzn7qUigY/liZePGijb4oxQF5MGkfM0UGBMqYNgB+UVoMZO8nspd15kcxopYG0l5V0daxZVONGQQAZ3yVakHRrdhfL2WNP+Y1zcDXRWurj+4KuK/kVBKntcI65fyJQzbdJkDt5ADJPSV4NEEbvUof229sHXxWeN4Sjv8/F35/Bw3YY8IJI2gaaY6wpLIcBSkWLjtYoQxV6w5MGsmVBwj/gOBVkO0jzHLqr2gK1zAeMYXL6c4RWz44LF4m7hXZ4IU4ytvFHEr5oY63OXjwO8Fj+J/8+Ze/o/A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=RaQSY6ph; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260e::611; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=RaQSY6ph;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::611; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20611.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::611])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPYRp1qd2z306x
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 17:23:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UY47bMNaXkVsVxMv7E65/gpoajYi89vIKTv4eXG369SFxxdbjFLF+0mnj1DBMYA6JdiytpnFG5r9l4ONjQCaXn918haUKEP13+DDa41asuzElmSnmGuESZ6Rxu5Unps3fVladmacDFqVOpAIQ/kcYUeroT0njcLUT9sjtlkd4TB+/BjwK573uqgb2o/64eH2hlFc4Wt4n1M+a89oey1ofg6qmmONu5pvWXVjwM7noHIQp0pf3KQvBiP0DwZ7t5jWS1QuR+H9w/Rq7eLlBdQUd9gGahm+rV1cQEz6BXfB7o0wHNfl+Bj9bbfT967aICIyWfarz7C8gTA0QYVXGzsCxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaE2Ypc92Ok6czI2zettvmxX+IrZP2lNiBLQFEzkJOI=;
 b=StoMw9yPFx427UTk+P8TyciKESpq7CFgY5mJ6Xm7WdI2wzRipBUVKXr/51mQhBgDRtXV844Vh+9oVyc0Uv+98aDG49FTA7vIXu0RWYkz8kTW/0afEmpPv9ihNcDjVFEEaYqNF8gtxTYDWhch7rqzwjkUASxWslXsdSvz1NrGhxg135XBI9wntxfzYBusskdAwrSrvtOQewhUZjctwEr0yn162/wgoH/RzKhpUMIgULrIJ20rgeTPBXDWEsNCKzqdwKFP9hLp6A4qjsdYcBeBCcQJamDhrCqNKieLkxcPhFlmmV5KaoRRns0sm4RhEckoXrH3KQoQyvULMC51xDm5tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaE2Ypc92Ok6czI2zettvmxX+IrZP2lNiBLQFEzkJOI=;
 b=RaQSY6phZ/1dva4RGqhPudO8a9EctMYhNhd5ekmdsGbl+CIgLRQWdo3TgWjovV5mUquXCXPJKLDcrlffltSOanVriJ4oU8OdcReu1YQNjrZvem/74bJ/ivZT5WBh7q79kwA3qcaruB0eM9JyXJhqS9xMcMnoTH2lH9os+t36Z0NIIqkfUkci6gExzss1V/blfsV+nHxNiG8r2hehfZhqKjubYSgsmdL/Lq3NMSMc4hQf8yAzIf8Dj0Y8iMuMR5t/G53QFs5YKHQqs/Q01AVT7X6kGfxidWLq0HARQfEDAHwFG+9LukN/uPqQvctmilEnT9MvSmG7yOBI+yrcFmhahA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DB9PR04MB9331.eurprd04.prod.outlook.com (2603:10a6:10:36d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 06:23:12 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 06:23:12 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	christophe.leroy@csgroup.eu
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH net-next 03/13] net: enetc: move generic MAC filterng interfaces to enetc-core
Date: Fri,  3 Jan 2025 14:05:59 +0800
Message-Id: <20250103060610.2233908-4-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103060610.2233908-1-wei.fang@nxp.com>
References: <20250103060610.2233908-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0127.apcprd03.prod.outlook.com
 (2603:1096:4:91::31) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|DB9PR04MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: 61c9b662-0f68-48eb-4ba1-08dd2bbf1902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QqdVEpzqOvrQ9iHUV49MABjRBqjneFOWX2+6LRYCDS1Wm77xSz445s1fsr4w?=
 =?us-ascii?Q?mZCzqsYcZrndIKMvNU/sY+yI0nFD03Nd8QhKE+6A3mYL47qMnBtZjKQcJJh4?=
 =?us-ascii?Q?BiwPk9iiO2VpCdV1+VUg8zkSZPuK7Gf82SANuB0LB3VevbhlVpkIp10W1Hr1?=
 =?us-ascii?Q?ful5YR2xq1w83nmRYvMy1MLiO+WZMv51VusUI3nPx5RJ+m8xWL3MfjOGwF4K?=
 =?us-ascii?Q?FC8ZROjbfy9HofE1bOqoaVYNHOriP9kZX2dkIOcdpUvLzpAWQcuIAYrDnzyI?=
 =?us-ascii?Q?Oomvt8BtAU9gmLstG3+Sn7nksDKAyfkbxNIatBX5hGcDedKBbpPv6U8jPhYF?=
 =?us-ascii?Q?JwccKs+QVSctFFpUQojr611awBfBrraWRuIkBub9mA4gPHSgyG2CWZxFuiRI?=
 =?us-ascii?Q?1wLNOTLBL2iO+qfwljZL02+EaddFPdJpvhVTcBigQ/al0dmHTQSPQ/VoUvbc?=
 =?us-ascii?Q?/yAk3HWHK2wh5AWnNoFAr4QtZD1JbQ3Xzqm+k2KFNXAaX1Vo4D8bXpLozYTr?=
 =?us-ascii?Q?cpd+apIWsPhs22du6onSFKz+T/enaJk3rb+QD4BkozKWMlnJDeB4IPzYp7vx?=
 =?us-ascii?Q?3dPjb4aeyRk4KhUlv/mBPssnsCbQw18W0JHY7wMnqjQlnHFXT1lmgH9xSkqp?=
 =?us-ascii?Q?LcyACIrtghR267J5Dpt/Rdrk2I0q3Bqht06OHJ3P+yAPgip+l2KeNrmrDvyg?=
 =?us-ascii?Q?r06gYka6DhLS3+ugKSjtYVZ5F/rVFni78MdMWTjH99nvR4/DMveVjv6o9FGk?=
 =?us-ascii?Q?GYstrJC0+wmmaAVHtT9SxszW9aE69SSThjpywAiJg8mU6bE0AF0DRQ77ApAh?=
 =?us-ascii?Q?3x9BS33DWz0XYKue0RmBGFzw3d0uj4QFPoCio0RH14Dj8uhfEqYyPgA62fdy?=
 =?us-ascii?Q?RRUyMVYciIls4pXuKSQ5DO4J03VPWLiE1vIniCRyfBhh6ek/dpW0SVo9UTxh?=
 =?us-ascii?Q?5L51/2C/y2jyZiiRpdSG69f0HCauyN+MxTItd0pR/OeZby6gasRr8tnY8lYS?=
 =?us-ascii?Q?tAVfPh0S1jtBb6Ix72c6nO54tn7PTCLkrI/impbinMTf0DQYm+LEcos9Y1LU?=
 =?us-ascii?Q?6z5AXHBnhJeFwf5DV5XCEn0fOv9ANlTsS8JdF9nIRBDn2wx5efJUBqncA9OG?=
 =?us-ascii?Q?wjqpaocCuLYcx/BEhfx0vBcZzrlwVeJuJPlUCZILzQu5M5M1lAcr8lAaZ5l7?=
 =?us-ascii?Q?9rFbgYvxCDl2RajKXMlSw+RFbeltl2dD1O5hlkU5HflHSCvxHPugNAcXVLFC?=
 =?us-ascii?Q?C0dXjgBodUx76DGhYGcPgrJdH0SrmO2FUuqh6R7uZrJzomW9rf9jKOYoo0b1?=
 =?us-ascii?Q?RGRvsYqoZ/T1RCz5N1JkDWJSdxBIRaKgscdZ1GVATS1nq4HyPQC1HfieJIUG?=
 =?us-ascii?Q?ZN2SpaxNZCQvrDzhAfYnQCjl4XgMTDv7OmDXpNDEBGqbMprkzROAy57U/1NV?=
 =?us-ascii?Q?n8DKpiOGRGqrSVYoWWY9SyP0R8Ua1QPR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VM36ZKUVFz+SqX8Gq70Pc9L2GYyIUVARSWtK0CIo1nY11WjT8xA9mtBsMu8n?=
 =?us-ascii?Q?4lEpOiJXsSPB8UJzsqq5GbIPyYvohGCAqmNNoE5rRNTH8oOLMbgm77L87/rI?=
 =?us-ascii?Q?Y5z6/alhomHh6C2161zSVzY6C4PLq600OB9n7P2IZ+X7EKC9qA0gtMIwZ8Jg?=
 =?us-ascii?Q?LUU9R+vLeWTUN37p3GLfJfSp7xbt1phmVwBltik267o3Dt3J4T0WzXE62rf0?=
 =?us-ascii?Q?xCIAy3bZMj7XtYD9jsJzo7DuzMpxUz7IRi+xWk23z9QQa1MhWoNcVvoqDTQC?=
 =?us-ascii?Q?3RVxIkHU8nGgOF6xSG8+BGTtqxYL5OJFnAmyN8expZI1vWbnkhw+XphiXqZI?=
 =?us-ascii?Q?N47tMCk9AzUdj+uqpkhDj+Q5hDBDKdnzn6dT0H3gi9dmywjxrzmvN7zMsa6X?=
 =?us-ascii?Q?uiWCklzNJFMPflI+NwgtX2EzijxotVJK1+aMPgYAHopQz/NY9HWEgBjuS5Di?=
 =?us-ascii?Q?YsJmDdrCfIV1bY2crqdq8lU9MK0wnKV1OJw5BM+vnzpmIPS2ojCGgP3qNYK3?=
 =?us-ascii?Q?wrDsyPSQ9FW4/NNaSoZ3hPFe4Cc4cZTqMQOvRBUKXC0PQXf4iwp8jAzl4afQ?=
 =?us-ascii?Q?C84SHt1QDYLWXc7lNdoG4fJ1PFlHNDGetz5P5LkurVD7bnueGHobQ0GJdmyp?=
 =?us-ascii?Q?PnfW/hka1XgJA7VRAiVcy471WjA+K+wU74++iMLhgBxTUv0+MOFAMDQRsVxy?=
 =?us-ascii?Q?NYryAwnWyqRY03ftNlPQdjvRCNMflYbcqJQAVgHPqZovM48okUvc2nhpN3WD?=
 =?us-ascii?Q?nCfrdYeC2MOFnAEEvIc0luSjYxIu14/a84/hel8Cp28AECEC0FslfG9/ruNJ?=
 =?us-ascii?Q?DM8pqxDxCLw7nMAeoLsHKJNRRwZZSLXf7SJvSwJLX3dHR72glvk/xBbx2HrN?=
 =?us-ascii?Q?HxgA1h4yA3F7h+AW3I4dwhAU5GKU9geSXu1JBPgXr8ToKUJ1nOZ2k0PqzNu3?=
 =?us-ascii?Q?si5wIBld9RwZw7kFa7O++xpfeJsudD98sjP4dIA5eLBAb9BNe9bNmgRDom3B?=
 =?us-ascii?Q?euvHY7cIeWBrbc/jef4V1VHaDw+Gf3SBU9Y8uxTp+vpDrV27osZZGd9kH6GE?=
 =?us-ascii?Q?iPLtXj4QojuwSCMD37wXNm91GXDYHO/QSJlHVaydlfvNOQzcxkpYwF4HPBW3?=
 =?us-ascii?Q?GHHY2Dqrv8Lp+mQnppfpl9WLlSosUsvWNFLVzbWQdOqF0kHTH2pfTmmWpYti?=
 =?us-ascii?Q?Vx+/gnrrnUPheQhhYyLTBAB/NHBAl8egoj31bt4L950/zlYdfGLChrJx46Dm?=
 =?us-ascii?Q?AyVbH0Q3qcUeuMxA2Lx8KcMIDvHkcJYfAWHL9fLGXR3+wOW8RyseMINcwWPz?=
 =?us-ascii?Q?rw7kEe3ubKzHG6mjeGkqtdsnTnbyrf7SA8PYKA9+lATTKpSWf++HEd3y+jOT?=
 =?us-ascii?Q?czewoD+CcKsFcnt+3pFxx4hj1IBP1jz+0XOHtzpaUPLHzD9/v9mO7odfAaL0?=
 =?us-ascii?Q?ZJnJk8fhwmAdZ6j3TJiM70rK9U9iArydmbYChu3WS+WAqqIkBqGaku/CFpSb?=
 =?us-ascii?Q?ugP6d0nrof5bEpNiwOAQXMpDufWmauOx8HdMrHtOqI12irKaA4Qyj8GiaNqK?=
 =?us-ascii?Q?9b+mxZ/ytK+afSkTgGZvG5kXdPsXfbLKE/A2p1Sb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c9b662-0f68-48eb-4ba1-08dd2bbf1902
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 06:23:11.9980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTlhQVk6uiBNM0fxHB1Psgv8kZJ97mE0cAxDBY6Y1ZH+kdUnqZGpJd0JiWsBkV2J+fkNI7tj2gk8ZbpucEhNkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9331
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Although only ENETC PF can access the MAC address filter table, the table
entries can specify MAC address filtering for one or more SIs based on
SI_BITMAP, which means that the table also supports MAC address filtering
for VFs.

Currently, only the ENETC v1 PF driver supports MAC address filtering. In
order to add the MAC address filtering support for the ENETC v4 PF driver
and VF driver in the future, the relevant generic interfaces are moved to
the enetc-core driver. At the same time, the struct enetc_mac_filter is
moved from enetc_pf to enetc_si, because enetc_si is a structure shared by
PF and VFs. This lays the basis for i.MX95 ENETC PF and VFs to support
MAC address filtering.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.c  | 36 ++++++++++++++
 drivers/net/ethernet/freescale/enetc/enetc.h  | 17 +++++++
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 49 +++----------------
 .../net/ethernet/freescale/enetc/enetc_pf.h   | 14 ------
 4 files changed, 60 insertions(+), 56 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 6a6fc819dfde..6d21c133e418 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -36,6 +36,42 @@ static void enetc_change_preemptible_tcs(struct enetc_ndev_priv *priv,
 	enetc_mm_commit_preemptible_tcs(priv);
 }
 
+static int enetc_mac_addr_hash_idx(const u8 *addr)
+{
+	u64 fold = __swab64(ether_addr_to_u64(addr)) >> 16;
+	u64 mask = 0;
+	int res = 0;
+	int i;
+
+	for (i = 0; i < 8; i++)
+		mask |= BIT_ULL(i * 6);
+
+	for (i = 0; i < 6; i++)
+		res |= (hweight64(fold & (mask << i)) & 0x1) << i;
+
+	return res;
+}
+
+void enetc_add_mac_addr_ht_filter(struct enetc_mac_filter *filter,
+				  const unsigned char *addr)
+{
+	int idx = enetc_mac_addr_hash_idx(addr);
+
+	/* add hash table entry */
+	__set_bit(idx, filter->mac_hash_table);
+	filter->mac_addr_cnt++;
+}
+EXPORT_SYMBOL_GPL(enetc_add_mac_addr_ht_filter);
+
+void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter)
+{
+	filter->mac_addr_cnt = 0;
+
+	bitmap_zero(filter->mac_hash_table,
+		    ENETC_MADDR_HASH_TBL_SZ);
+}
+EXPORT_SYMBOL_GPL(enetc_reset_mac_addr_filter);
+
 static int enetc_num_stack_tx_queues(struct enetc_ndev_priv *priv)
 {
 	int num_tx_rings = priv->num_tx_rings;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 4ff0957e69be..9380d3e8ca01 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -23,6 +23,18 @@
 
 #define ENETC_CBD_DATA_MEM_ALIGN 64
 
+#define ENETC_MADDR_HASH_TBL_SZ	64
+
+enum enetc_mac_addr_type {UC, MC, MADDR_TYPE};
+
+struct enetc_mac_filter {
+	union {
+		char mac_addr[ETH_ALEN];
+		DECLARE_BITMAP(mac_hash_table, ENETC_MADDR_HASH_TBL_SZ);
+	};
+	int mac_addr_cnt;
+};
+
 struct enetc_tx_swbd {
 	union {
 		struct sk_buff *skb;
@@ -302,6 +314,8 @@ struct enetc_si {
 	int hw_features;
 	const struct enetc_drvdata *drvdata;
 	const struct enetc_si_ops *ops;
+
+	struct enetc_mac_filter mac_filter[MADDR_TYPE];
 };
 
 #define ENETC_SI_ALIGN	32
@@ -484,6 +498,9 @@ int enetc_alloc_si_resources(struct enetc_ndev_priv *priv);
 void enetc_free_si_resources(struct enetc_ndev_priv *priv);
 int enetc_configure_si(struct enetc_ndev_priv *priv);
 int enetc_get_driver_data(struct enetc_si *si);
+void enetc_add_mac_addr_ht_filter(struct enetc_mac_filter *filter,
+				  const unsigned char *addr);
+void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter);
 
 int enetc_open(struct net_device *ndev);
 int enetc_close(struct net_device *ndev);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index a214749a4af6..cc3e52bd3096 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -72,30 +72,6 @@ static void enetc_set_isol_vlan(struct enetc_hw *hw, int si, u16 vlan, u8 qos)
 	enetc_port_wr(hw, ENETC_PSIVLANR(si), val);
 }
 
-static int enetc_mac_addr_hash_idx(const u8 *addr)
-{
-	u64 fold = __swab64(ether_addr_to_u64(addr)) >> 16;
-	u64 mask = 0;
-	int res = 0;
-	int i;
-
-	for (i = 0; i < 8; i++)
-		mask |= BIT_ULL(i * 6);
-
-	for (i = 0; i < 6; i++)
-		res |= (hweight64(fold & (mask << i)) & 0x1) << i;
-
-	return res;
-}
-
-static void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter)
-{
-	filter->mac_addr_cnt = 0;
-
-	bitmap_zero(filter->mac_hash_table,
-		    ENETC_MADDR_HASH_TBL_SZ);
-}
-
 static void enetc_add_mac_addr_em_filter(struct enetc_mac_filter *filter,
 					 const unsigned char *addr)
 {
@@ -104,16 +80,6 @@ static void enetc_add_mac_addr_em_filter(struct enetc_mac_filter *filter,
 	filter->mac_addr_cnt++;
 }
 
-static void enetc_add_mac_addr_ht_filter(struct enetc_mac_filter *filter,
-					 const unsigned char *addr)
-{
-	int idx = enetc_mac_addr_hash_idx(addr);
-
-	/* add hash table entry */
-	__set_bit(idx, filter->mac_hash_table);
-	filter->mac_addr_cnt++;
-}
-
 static void enetc_clear_mac_ht_flt(struct enetc_si *si, int si_idx, int type)
 {
 	bool err = si->errata & ENETC_ERR_UCMCSWP;
@@ -145,10 +111,9 @@ static void enetc_set_mac_ht_flt(struct enetc_si *si, int si_idx, int type,
 	}
 }
 
-static void enetc_sync_mac_filters(struct enetc_pf *pf)
+static void enetc_sync_mac_filters(struct enetc_si *si)
 {
-	struct enetc_mac_filter *f = pf->mac_filter;
-	struct enetc_si *si = pf->si;
+	struct enetc_mac_filter *f = si->mac_filter;
 	int i, pos;
 
 	pos = EMETC_MAC_ADDR_FILT_RES;
@@ -192,10 +157,10 @@ static void enetc_sync_mac_filters(struct enetc_pf *pf)
 static void enetc_pf_set_rx_mode(struct net_device *ndev)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_pf *pf = enetc_si_priv(priv->si);
-	struct enetc_hw *hw = &priv->si->hw;
 	bool uprom = false, mprom = false;
 	struct enetc_mac_filter *filter;
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
 	struct netdev_hw_addr *ha;
 	u32 psipmr = 0;
 	bool em;
@@ -214,7 +179,7 @@ static void enetc_pf_set_rx_mode(struct net_device *ndev)
 	/* first 2 filter entries belong to PF */
 	if (!uprom) {
 		/* Update unicast filters */
-		filter = &pf->mac_filter[UC];
+		filter = &si->mac_filter[UC];
 		enetc_reset_mac_addr_filter(filter);
 
 		em = (netdev_uc_count(ndev) == 1);
@@ -230,7 +195,7 @@ static void enetc_pf_set_rx_mode(struct net_device *ndev)
 
 	if (!mprom) {
 		/* Update multicast filters */
-		filter = &pf->mac_filter[MC];
+		filter = &si->mac_filter[MC];
 		enetc_reset_mac_addr_filter(filter);
 
 		netdev_for_each_mc_addr(ha, ndev) {
@@ -243,7 +208,7 @@ static void enetc_pf_set_rx_mode(struct net_device *ndev)
 
 	if (!uprom || !mprom)
 		/* update PF entries */
-		enetc_sync_mac_filters(pf);
+		enetc_sync_mac_filters(si);
 
 	psipmr |= enetc_port_rd(hw, ENETC_PSIPMR) &
 		  ~(ENETC_PSIPMR_SET_UP(0) | ENETC_PSIPMR_SET_MP(0));
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
index a26a12863855..2b9d0f625f01 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
@@ -6,18 +6,6 @@
 
 #define ENETC_PF_NUM_RINGS	8
 
-enum enetc_mac_addr_type {UC, MC, MADDR_TYPE};
-#define ENETC_MAX_NUM_MAC_FLT	((ENETC_MAX_NUM_VFS + 1) * MADDR_TYPE)
-
-#define ENETC_MADDR_HASH_TBL_SZ	64
-struct enetc_mac_filter {
-	union {
-		char mac_addr[ETH_ALEN];
-		DECLARE_BITMAP(mac_hash_table, ENETC_MADDR_HASH_TBL_SZ);
-	};
-	int mac_addr_cnt;
-};
-
 #define ENETC_VLAN_HT_SIZE	64
 
 enum enetc_vf_flags {
@@ -52,8 +40,6 @@ struct enetc_pf {
 	int total_vfs; /* max number of VFs, set for PF at probe */
 	struct enetc_vf_state *vf_state;
 
-	struct enetc_mac_filter mac_filter[ENETC_MAX_NUM_MAC_FLT];
-
 	struct enetc_msg_swbd rxmsg[ENETC_MAX_NUM_VFS];
 	struct work_struct msg_task;
 	char msg_int_name[ENETC_INT_NAME_MAX];
-- 
2.34.1


