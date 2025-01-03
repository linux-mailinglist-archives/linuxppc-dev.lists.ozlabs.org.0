Return-Path: <linuxppc-dev+bounces-4605-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1B1A0043B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 07:24:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPYRt6jMRz30PF;
	Fri,  3 Jan 2025 17:23:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::611" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735885418;
	cv=pass; b=oa/sr552zW7r57AfudUBHTqJWBsX5jzzH1n+bing1uP3Lr3n4eTGLQB2/6/8nQqKbjWm2L4g4UJ8Uiq0QUGUPyeihpLAuFYq7EICN8xIYfo2YJH7IMa6A0T2LWHuNBjNJO2RidNFwo2rMUHyfTmnUX5qEK8HTkSlQo1LglV9YKs6tfS/owSIXpD4r/wmeq2JkHS1bnfBnXjrZxLnfpHSrLB6czy0ueIP2HrDnF5ciBLU6/vVRf6qetQ3SD39/Mrnz6olLkj1lTAtDhDJjb8usmfnmOTnOtC3XWQsqYbmvXQoClcmb668QW0ftXaOu9aYiQHcuUl617qtKpTs2cpefg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735885418; c=relaxed/relaxed;
	bh=wox8ejjVa0BEuHvgvzDrLCuwp+xjoQ4z+lM051MhcWE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QuuTa8Th/AM9jfb89fOqCySpG3qmqmxheXlSlPKDHP1NiEgyS4QkJDq4xHj1kuj/DLlRlFZUhCtoxtZof9Y31+NOAI/Nt6m19Mgi9Mcd8bawliyQOQptAQFj2hxWWtmnQmifBwawom7ORvwcczL99Lz5aUWQ4CEbiD1Bpt9NGIlgsdXqUrOkNf/RmnLZAATcAPVDNlmZnNhLd0TRq4WBizhotPmdfAwO+DbXr9R1l+aHb3QXvgTuFu9VDlNQAcFG/6gwleLM2K3qbRG9EKRvaTmUPvuAVkp0g1+MjbMyE4020i4a2UURNxENk3qNPdnel6o9W42XchoypGC221/iKA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ZwMfl/YX; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260e::611; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ZwMfl/YX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::611; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20611.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::611])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPYRt24wtz30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 17:23:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGkH+W9VCJGXAE/TQBgJjfasGgwT491tX6lFRQgCjtU7GhIXnJt5ZjX8/GilmXHSdmUAVx3+1xpQfZV1tR/Kk6dOADWrQu1fOinkAnvAhGBrdvZ1SLiU2+ZFD9fINkyfMk3EffqeG2FklkPPAeRnTs30TlDLIKyd80iOzXFSEUo0UrlrPkrcLZ+xuX3hr2PJpalNBb3yCMlGssRD6H8xfBXiDea2ZxqH4H5zlulGLKfBy0JBWKpGNUlFMR2CZ0EgNa3N6TDFBpEbg/pg8lk2bMJAgr/wMckO/HgtNte0+WefjHeANMp39H5nIHAqFY5qs8Nu7Im1//vZCHdS+4TP9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wox8ejjVa0BEuHvgvzDrLCuwp+xjoQ4z+lM051MhcWE=;
 b=I294i6eZ7s9I891gKoSduF5clM911DE+H/wbp+9lwtWvA76X1ygpVNqNmee1vKnB+pFQMbGALAMbVp5C/wNRc66Ptn+aelVZI1773ui9DwT6LMbKdv10qQEg3RLeoJU2awEfigOD4Sx2a49Rwbg5fECrZCCB018e4cJUl10wb0qzzPvztTFh6DQ4OtOloMJIajlDX8S6fkj/QyZskHYPdOtQcsz7PuZTNp/RzO4Q1z4w+6tUsCwDBoz4+5429j84O6DLZBQUFZw0hJJOkdx8Auyfbx9BAuCGsEGK+Bbp8lHyNFGWAHAz+AkQFH1l5LNNHZC+ziQrtv2fA7YUATYNWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wox8ejjVa0BEuHvgvzDrLCuwp+xjoQ4z+lM051MhcWE=;
 b=ZwMfl/YXpwleMf0QOOGs3kwuq1eEdeaUm9EtxPjKDNTAgzrV4chM6o9mN2k3XlJrwpiXnmn8ZXOev1GUs1E4enqL/PkJIK8drvaX+4wegTOxPNQ8A1G3hAtWWmYwwESdom36yo+4f6tJrnLpqH/NQpabvZZzXXsPBRBZd9hbVdFZv1wQXHNt92Y7RhZAjX/xF9HyHC1GlkiY6CUhGXvjKb6z2UW7s2o5JaiF6tUEODmG5MDHx7hjxOXEG6NCmR1lxNgrQQxFQYYxaCLLrVCh4Y+e/qFw+9mGg0DIun5gVq5rXVtQVbJPUHC3fPgZYMFkB88H7mJ/9pTOJmFHhcfhng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DB9PR04MB9331.eurprd04.prod.outlook.com (2603:10a6:10:36d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 06:23:30 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 06:23:30 +0000
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
Subject: [PATCH net-next 07/13] net: enetc: add RSS support for i.MX95 ENETC PF
Date: Fri,  3 Jan 2025 14:06:03 +0800
Message-Id: <20250103060610.2233908-8-wei.fang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 469925d1-9bdf-47f6-4ca6-08dd2bbf23ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l234m5s7mjOd8mq61/jU7Zp9NUKwNYvCtug2onouxhvr3SZUpi4s9SGuz7do?=
 =?us-ascii?Q?hw4UvwD5V6PzlFbMRX2IDJojYA+i1mqcjq1kxHdP691tdI+EwFdWTEksgqkA?=
 =?us-ascii?Q?NLyvTJyrBvDy/A+6aQ98Y/rnGUtCZMWzrJEt597yzwgDXYOHY5Jtk+TZ6ARm?=
 =?us-ascii?Q?/lOSQyJrvMd88RcanpX+/L4VLKBGcfpA6S6/IiQw1m2sGTDr6V+IaAeKXjrj?=
 =?us-ascii?Q?FjJLP4wyky73uAS1AvTslHoWQxJh+io3ejsly9mkO7dYo3GHYaumde47pLob?=
 =?us-ascii?Q?+wO1bHK/CugqtpGxJfY9vG1nTWcFCNP6yoxERZnDPGw6lS0Sn50rj/WYEyfM?=
 =?us-ascii?Q?NodOeDj2ZLANHAm7O2m2yBuvP2+65Z/8knMdTMiQS5wsHIXvlynyuFmaSlHG?=
 =?us-ascii?Q?nGZtv1jV7PioH6CcyB5ralYoiZLkoPE50s9y5PCIevvHoAdGsL0UAKb+T1no?=
 =?us-ascii?Q?48tPkVAKKOy6GCMZHS5qS1VQVWbP/lehXhWxJ4o5BFR6O8CE5xh/WlJYS0M3?=
 =?us-ascii?Q?AU+cUslfnbPDhN0v3M3JfiCXEx2IAagDC2VRB3+ctln7zlqc/1Bo1joe+y4o?=
 =?us-ascii?Q?lI2t5myrU3YDF8gUd9Xl/umGPUDoUMSBzYOrNkRNq+lEa8uwRko5WAtpog2j?=
 =?us-ascii?Q?NuWNZPZuIPcFztQP5H9zY6APP6KgTX/Y0/RXyoyrEwKhC29WP2Ec94qsJtQo?=
 =?us-ascii?Q?bVCoo5pZXRDvOanZvfSGUwIhEUCuQoRxNKNwszbUBtMzRGXeUepedIF4ctSQ?=
 =?us-ascii?Q?IYJqMk3hNzLmKYr9pw2Lq5xfhwWH4iEi8GR4ZTOyJq7Vpjn830jZqGwvC5Mf?=
 =?us-ascii?Q?SpBLZqY2BVsjT08LpRQaPeiWVA0dba4y23vNTemCm4xGUXNbSmt8k3bNM2KW?=
 =?us-ascii?Q?JUMFsAjrNcYbWeZyrE5r1VpRhR3E5RmOTnm1hoMzcHddOXH1LKRo79YEIcFj?=
 =?us-ascii?Q?+FtnTG8AUJwZkMdHBuuOD2hAQ9fJiGWoB5TdMwzNGfd0TWHjYE5kjEaKiUIl?=
 =?us-ascii?Q?eC32r9UNIg9T2Sjnkb8/oLX3qrtxuyr+W3k4H6MspDE+BlAgYAXnHpEEZFYO?=
 =?us-ascii?Q?jSMScMph5EKCW3DbGBhF6ihH8FJlUqPKCdYB867imKOthlIMny/orkQM8dci?=
 =?us-ascii?Q?ElyWVbvrYJ4MgfPUkO8qfelKrtVo2QW6z6N1Rsq0lZ1HT4pJSt92GmGmpY3J?=
 =?us-ascii?Q?kn89T4O8X92Uyy+vd8ITJk9vR48CcrdNbEmPnzgHw62hqnX9txYTORQr9Q43?=
 =?us-ascii?Q?QCZl9Xr8c9i494S5pZRO/27PW2+bGLUzqQ9h/abKT9P7I3diOR9O/PFLf0jt?=
 =?us-ascii?Q?JTLU18Jl6mjmuvWbRYSYngDTHsb2QBTiVecm+4ddD1Yl//HzyZDcRzMOKcF2?=
 =?us-ascii?Q?p0k7K3mW820cvn0Y0+6cDkiV9YYRn9SQzAoE1wn1vq2cSAFV1aE3758zyKp4?=
 =?us-ascii?Q?uJuMfb1thLtBPdgd/ejH+h3uv9sZIDda?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kvh9oyelmimH/JSd2DARAqnj0T9gUDJlFZgkYP8YN2HNAQAXYItAycTdr3Ho?=
 =?us-ascii?Q?ruOXgcpKDkLfm3BHr7tVTsB6qW2bhhD8tjgakmJ3cgA0LgVtaYuDVWuivqA2?=
 =?us-ascii?Q?d06Y/w4NwKtTf4SBHi3QwIlt/lSF1AAAmQfDkLAgJyGcUq/0RBE4D0++ZKpH?=
 =?us-ascii?Q?GZ6FIPUAHE/HkRMdKiJtiJKZxZsb+36eXU6Brvq6MzRMO1mIrS6MzH1WLH9k?=
 =?us-ascii?Q?ThmxjDatLqouxf5ecQ5yI9gVDepVY3bfGUU7q1Z2YxrloAfJLZD/SyuQyDfX?=
 =?us-ascii?Q?J6zHbwGckcqo793wmv1U5q0AHYIiBgYdOTiWSIr4Use4jJ7mLe3Sqik+7Dgq?=
 =?us-ascii?Q?qo8we8bFd5bBB0fNzM4VOaFxpMdSrrJKv64J7BsDImGqKL1Y4AjAHzBOZulz?=
 =?us-ascii?Q?NrRfXHSenwbXXGYYgGtqQc8xAJT6LSQ0MFp/F+RwDINK9IlZ+PLCKhVSQvfQ?=
 =?us-ascii?Q?g7m/Mdhw5LDK6QZ5UcmYK5ny5K25QC8OrvqB+DAd09sXtOZQYZpWUJ8FqJk7?=
 =?us-ascii?Q?scksj4EuSTw2PSlGn32KqohQEva2jmNox9JDsWUB10G/CFSn3IhrltYsgLz8?=
 =?us-ascii?Q?V/DfYAbztYi9U9gHtsQrkeBZRA9L1slk9pf4Ln8i3RGj5cnO6KWTCOEbWXrE?=
 =?us-ascii?Q?onEgay31xouyyb/dy5QuzWSg/pqc7EgOcPjD9xxZjXaO2wsODpricAXqZVyz?=
 =?us-ascii?Q?yK5KzLUvkOSBIzrP+hl94en4smq+7WkwprVWmpV6dsuhByhJScgi0PcSjkBF?=
 =?us-ascii?Q?4AYTluLGtRqxLnvVj2LLN+JjIfSQaUVyeUFpZa4Cbr6h/rknnYvKU1Sd1L/4?=
 =?us-ascii?Q?7agR4sWPBW8hyn3bJrYx/rwKpxh/pA5nANNtEuKT58fLsUrqu1KN2Ot2i3dL?=
 =?us-ascii?Q?k1KeR1H1g3Ua+6PckkZHK9AaaZoa8FGsD7H4FJI9UrTSbtWI18HKvbRtyEge?=
 =?us-ascii?Q?Lnr6klgyZRWxgwarcsaLuvtRbhnxFro7GW4ZdELLsjsQBrJztCuZGBzu4wNV?=
 =?us-ascii?Q?XOUmreO21puSyNEDj69zFS9Ovnx1ZMBMJV7JjMrTVV3quzkO+oQn5lmL98/k?=
 =?us-ascii?Q?MR+b8A7yK5AR3BGnZsPQlKHMNREUkDq7Ds44muFlbh7EGia3WkP9JZiuSFAR?=
 =?us-ascii?Q?+n9ErQaqctmNRwYPb63JeHhkCNvBDbLkV8mphprUU3QNrleN8m7ye3JeY/X6?=
 =?us-ascii?Q?ZDhODU3GNqVbj2hBZj3o/CqVsLa/KWKGumS05SFg8mo03LOztev4AehW+yrC?=
 =?us-ascii?Q?FwRtVNuI/nGGMy3mjxlm2g6j7agW1SIjJW7UAPTmbn2b9sKsshTOQg/ui4Qf?=
 =?us-ascii?Q?WFzvsPHX0bKUH9EDv0P9F+dCW4lSsCCzIoMLGaJj5JU5ugUjAKodmBBjFGro?=
 =?us-ascii?Q?ZZgIb3MiAevg9oLvvI/Y2VtQy5cCuADZxMaSjVLmqI8t0EnZelgo/+4/GSA2?=
 =?us-ascii?Q?8xx448le/vS52nyVAEbXNJMCON+eqL9nKSCBJIC+mgHz4En53VmzsARAu50B?=
 =?us-ascii?Q?u6dxhbGCjmSqXFEATzW/yaOx15gcAH5xCkSUoBAg//JLPOZbSIAuUHCGcJQ+?=
 =?us-ascii?Q?CV0AJ8t9kZNC3+n3URyEe1T2sWn6EgF9p9TDeScM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 469925d1-9bdf-47f6-4ca6-08dd2bbf23ff
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 06:23:30.2316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4kir84HTPEKy/6SHbciZZ4/Z2Pkt5wITorq7/WECiY97OAOTivrFiCl/dbjNZNRG0RY/rRM+gPdEvv8w+dO9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9331
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add Receive side scaling (RSS) support for i.MX95 ENETC PF to improve the
network performance and balance the CPU loading. In addition, since both
ENETC v1 and ENETC v4 only support the toeplitz algorithm, so a check for
hfunc was added.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.c  |  7 +---
 drivers/net/ethernet/freescale/enetc/enetc.h  |  4 ++
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 37 +++++++++++++++----
 .../net/ethernet/freescale/enetc/enetc_cbdr.c | 14 +++++++
 .../ethernet/freescale/enetc/enetc_ethtool.c  | 33 ++++++++++++++++-
 .../net/ethernet/freescale/enetc/enetc_pf.c   |  2 +
 .../freescale/enetc/enetc_pf_common.c         |  6 +--
 .../net/ethernet/freescale/enetc/enetc_vf.c   |  2 +
 8 files changed, 87 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 6d21c133e418..233f58e57a20 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -2363,7 +2363,7 @@ static int enetc_setup_default_rss_table(struct enetc_si *si, int num_groups)
 	for (i = 0; i < si->num_rss; i++)
 		rss_table[i] = i % num_groups;
 
-	enetc_set_rss_table(si, rss_table, si->num_rss);
+	si->ops->set_rss_table(si, rss_table, si->num_rss);
 
 	kfree(rss_table);
 
@@ -2394,10 +2394,7 @@ int enetc_configure_si(struct enetc_ndev_priv *priv)
 	if (si->hw_features & ENETC_SI_F_LSO)
 		enetc_set_lso_flags_mask(hw);
 
-	/* TODO: RSS support for i.MX95 will be supported later, and the
-	 * is_enetc_rev1() condition will be removed
-	 */
-	if (si->num_rss && is_enetc_rev1(si)) {
+	if (si->num_rss) {
 		err = enetc_setup_default_rss_table(si, priv->num_rx_rings);
 		if (err)
 			return err;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index fb53fb961364..2b0d27ed924d 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -290,6 +290,8 @@ struct enetc_si;
 struct enetc_si_ops {
 	int (*setup_cbdr)(struct enetc_si *si);
 	void (*teardown_cbdr)(struct enetc_si *si);
+	int (*get_rss_table)(struct enetc_si *si, u32 *table, int count);
+	int (*set_rss_table)(struct enetc_si *si, const u32 *table, int count);
 };
 
 /* PCI IEP device data */
@@ -540,6 +542,8 @@ int enetc_set_fs_entry(struct enetc_si *si, struct enetc_cmd_rfse *rfse,
 int enetc_get_rss_table(struct enetc_si *si, u32 *table, int count);
 int enetc_set_rss_table(struct enetc_si *si, const u32 *table, int count);
 int enetc_send_cmd(struct enetc_si *si, struct enetc_cbd *cbd);
+int enetc4_get_rss_table(struct enetc_si *si, u32 *table, int count);
+int enetc4_set_rss_table(struct enetc_si *si, const u32 *table, int count);
 
 static inline void *enetc_cbd_alloc_data_mem(struct enetc_si *si,
 					     struct enetc_cbd *cbd,
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 6de571b5b425..4cd0931baea0 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -69,9 +69,27 @@ static void enetc4_pf_get_si_primary_mac(struct enetc_hw *hw, int si,
 	put_unaligned_le16(lower, addr + 4);
 }
 
+static void enetc4_set_rss_key(struct enetc_hw *hw, const u8 *key)
+{
+	int i;
+
+	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
+		enetc_port_wr(hw, ENETC4_PRSSKR(i), ((u32 *)key)[i]);
+}
+
+static void enetc4_get_rss_key(struct enetc_hw *hw, u8 *key)
+{
+	int i;
+
+	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
+		((u32 *)key)[i] = enetc_port_rd(hw, ENETC4_PRSSKR(i));
+}
+
 static const struct enetc_pf_ops enetc4_pf_ops = {
 	.set_si_primary_mac = enetc4_pf_set_si_primary_mac,
 	.get_si_primary_mac = enetc4_pf_get_si_primary_mac,
+	.set_rss_key = enetc4_set_rss_key,
+	.get_rss_key = enetc4_get_rss_key,
 };
 
 static int enetc4_pf_struct_init(struct enetc_si *si)
@@ -263,14 +281,6 @@ static void enetc4_set_trx_frame_size(struct enetc_pf *pf)
 	enetc4_pf_reset_tc_msdu(&si->hw);
 }
 
-static void enetc4_set_rss_key(struct enetc_hw *hw, const u8 *bytes)
-{
-	int i;
-
-	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
-		enetc_port_wr(hw, ENETC4_PRSSKR(i), ((u32 *)bytes)[i]);
-}
-
 static void enetc4_set_default_rss_key(struct enetc_pf *pf)
 {
 	u8 hash_key[ENETC_RSSHASH_KEY_SIZE] = {0};
@@ -691,6 +701,14 @@ static void enetc4_pf_set_rx_mode(struct net_device *ndev)
 	queue_work(si->workqueue, &si->rx_mode_task);
 }
 
+static int enetc4_pf_set_features(struct net_device *ndev,
+				  netdev_features_t features)
+{
+	enetc_set_features(ndev, features);
+
+	return 0;
+}
+
 static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_open		= enetc_open,
 	.ndo_stop		= enetc_close,
@@ -698,6 +716,7 @@ static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_get_stats		= enetc_get_stats,
 	.ndo_set_mac_address	= enetc_pf_set_mac_addr,
 	.ndo_set_rx_mode	= enetc4_pf_set_rx_mode,
+	.ndo_set_features	= enetc4_pf_set_features,
 };
 
 static struct phylink_pcs *
@@ -1106,6 +1125,8 @@ static void enetc4_pf_netdev_destroy(struct enetc_si *si)
 static const struct enetc_si_ops enetc4_psi_ops = {
 	.setup_cbdr = enetc4_setup_cbdr,
 	.teardown_cbdr = enetc4_teardown_cbdr,
+	.get_rss_table = enetc4_get_rss_table,
+	.set_rss_table = enetc4_set_rss_table,
 };
 
 static int enetc4_pf_wq_task_init(struct enetc_si *si)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
index 31bb82ee512d..6d85c0caa04f 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
@@ -295,3 +295,17 @@ int enetc_set_rss_table(struct enetc_si *si, const u32 *table, int count)
 	return enetc_cmd_rss_table(si, (u32 *)table, count, false);
 }
 EXPORT_SYMBOL_GPL(enetc_set_rss_table);
+
+int enetc4_get_rss_table(struct enetc_si *si, u32 *table, int count)
+{
+	return ntmp_rsst_query_or_update_entry(&si->ntmp.cbdrs,
+					       table, count, true);
+}
+EXPORT_SYMBOL_GPL(enetc4_get_rss_table);
+
+int enetc4_set_rss_table(struct enetc_si *si, const u32 *table, int count)
+{
+	return ntmp_rsst_query_or_update_entry(&si->ntmp.cbdrs,
+					       (u32 *)table, count, false);
+}
+EXPORT_SYMBOL_GPL(enetc4_set_rss_table);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
index 56ba82830279..a3059498f146 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
@@ -626,6 +626,24 @@ static int enetc_get_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc,
 	return 0;
 }
 
+static int enetc4_get_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc,
+			    u32 *rule_locs)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+
+	switch (rxnfc->cmd) {
+	case ETHTOOL_GRXRINGS:
+		rxnfc->data = priv->num_rx_rings;
+		break;
+	case ETHTOOL_GRXFH:
+		return enetc_get_rsshash(rxnfc);
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
 static int enetc_set_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
@@ -698,7 +716,7 @@ static int enetc_get_rxfh(struct net_device *ndev,
 
 	/* return RSS table */
 	if (rxfh->indir)
-		err = enetc_get_rss_table(si, rxfh->indir, si->num_rss);
+		err = si->ops->get_rss_table(si, rxfh->indir, si->num_rss);
 
 	return err;
 }
@@ -712,6 +730,12 @@ static int enetc_set_rxfh(struct net_device *ndev,
 	struct enetc_hw *hw = &si->hw;
 	int err = 0;
 
+	if (rxfh->hfunc != ETH_RSS_HASH_NO_CHANGE &&
+	    rxfh->hfunc != ETH_RSS_HASH_TOP) {
+		netdev_err(ndev, "Only toeplitz hash function is supported\n");
+		return -EOPNOTSUPP;
+	}
+
 	/* set hash key, if PF */
 	if (rxfh->key && enetc_si_is_pf(si)) {
 		struct enetc_pf *pf = enetc_si_priv(si);
@@ -721,7 +745,7 @@ static int enetc_set_rxfh(struct net_device *ndev,
 
 	/* set RSS table */
 	if (rxfh->indir)
-		err = enetc_set_rss_table(si, rxfh->indir, si->num_rss);
+		err = si->ops->set_rss_table(si, rxfh->indir, si->num_rss);
 
 	return err;
 }
@@ -1233,6 +1257,11 @@ const struct ethtool_ops enetc4_pf_ethtool_ops = {
 	.set_wol = enetc_set_wol,
 	.get_pauseparam = enetc_get_pauseparam,
 	.set_pauseparam = enetc_set_pauseparam,
+	.get_rxnfc = enetc4_get_rxnfc,
+	.get_rxfh_key_size = enetc_get_rxfh_key_size,
+	.get_rxfh_indir_size = enetc_get_rxfh_indir_size,
+	.get_rxfh = enetc_get_rxfh,
+	.set_rxfh = enetc_set_rxfh,
 };
 
 void enetc_set_ethtool_ops(struct net_device *ndev)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index f050cf039733..59039d087695 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -923,6 +923,8 @@ static int enetc_pf_register_with_ierb(struct pci_dev *pdev)
 static const struct enetc_si_ops enetc_psi_ops = {
 	.setup_cbdr = enetc_setup_cbdr,
 	.teardown_cbdr = enetc_teardown_cbdr,
+	.get_rss_table = enetc_get_rss_table,
+	.set_rss_table = enetc_set_rss_table,
 };
 
 static struct enetc_si *enetc_psi_create(struct pci_dev *pdev)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index 3fd9b0727875..c346e0e3ad37 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -128,15 +128,15 @@ void enetc_pf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	if (si->hw_features & ENETC_SI_F_LSO)
 		priv->active_offloads |= ENETC_F_LSO;
 
+	if (si->num_rss)
+		ndev->hw_features |= NETIF_F_RXHASH;
+
 	/* TODO: currently, i.MX95 ENETC driver does not support advanced features */
 	if (!is_enetc_rev1(si)) {
 		ndev->hw_features &= ~(NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_LOOPBACK);
 		goto end;
 	}
 
-	if (si->num_rss)
-		ndev->hw_features |= NETIF_F_RXHASH;
-
 	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 			     NETDEV_XDP_ACT_NDO_XMIT | NETDEV_XDP_ACT_RX_SG |
 			     NETDEV_XDP_ACT_NDO_XMIT_SG;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
index d7d9a720069b..072e5b40a199 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
@@ -165,6 +165,8 @@ static void enetc_vf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 static const struct enetc_si_ops enetc_vsi_ops = {
 	.setup_cbdr = enetc_setup_cbdr,
 	.teardown_cbdr = enetc_teardown_cbdr,
+	.get_rss_table = enetc_get_rss_table,
+	.set_rss_table = enetc_set_rss_table,
 };
 
 static int enetc_vf_probe(struct pci_dev *pdev,
-- 
2.34.1


