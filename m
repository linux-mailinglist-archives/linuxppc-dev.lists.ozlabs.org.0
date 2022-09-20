Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1FB5BEE84
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 22:26:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXCkL3gl8z3cj0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 06:26:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=1RNk6iNS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.20.53; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=1RNk6iNS;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXCh908J0z2ymS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 06:24:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FiXiodg3cLBgZFFxZz+wYfvp1+rQHYr5epzvivS3bMy8s8r6EJkTgGigPodGxNmqF0Y2T302yl+mVTt02tOUDk+LmlXpYwFgYs3bkjPFubuyE7j2IG4r3aIc02WdhabS0RhelFwvphLwdANIF1KS7ha1wR4rDi623/oFYLtl0JobEXbGp4SyWJ2lOwAqiybtiiMnbw+29d7TBKmkYbNzBM2USmSm8cFGAEG+PlDm2F6pskYa7umMlxGMiWODAaEPIxb+v/aN7Z7YPg+3Cl6bOg94iSyrhSsK/JziU+jHRYRZyABlsxS59JajZqraKYuNlubdKoptgmNTq+Pc2vF/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WtGwjevVfbxmEGGZX6LO7AaucEsLp3A53hHvnUdJ1A=;
 b=m7UkZcEgt98w6bD/i4yFtAsVvC6ZMg/I3DamnT0AAUb0s/mL9JsuppSSqXYYE6lx85sCkWWmWzpdTwXQKc6w1pxmFkn125J6f+y+hdAy+bTlG4owOqLjOltbWH1vX+c97TFK9pYfwjiDH0E9ACxGeccwEaj5XZKxD38HzLZfI7iaibsyHWW1CnhZ1AZEn6c4Qkz2ZGDKvGaEZOJIhEGtc5y+82nIuzUEsK+UKx8uMyYXf0qJAgWsEM6D/hl+kczam7PJPIzFKnBsk/ie9/v8Sj8hoXG0Cx0aKtkoiZKjVMR+zwwDN15Xe/Eoh3MGk3BLUVlUO7GPCDbJMYMsB1paYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WtGwjevVfbxmEGGZX6LO7AaucEsLp3A53hHvnUdJ1A=;
 b=1RNk6iNSPXFqf5vmSkljboaW/mAmINB9mFkVC3DklK51UZk3dwfxzFlEOYw+Tb1vPlPUnyJKTvP38Tv+SJe3W899dvchmxI7PsGdp6VW7N3aoeSiv/3lFew032xYvq0DAXArbngYD4pRq74PAwQYpfOrlEYyW+02oz5K9w1GRITJGBpgXBEypByKKcRDigVgSbYIh3fBPxbCKxQY/JXt866hN8I1se9nS4DxFXBUx4mvJq5cG5Tn3SGGSA1SOtSEXBNcrRhMXGBlBKE8fEsfhObMMfc3sf1LJxWOCSTunYIcYfuolsOKJyorW8ef2nvBNEVcVA30DMncpM7QAdN8Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by DU0PR03MB9566.eurprd03.prod.outlook.com (2603:10a6:10:41e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 20:24:18 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5654.014; Tue, 20 Sep 2022
 20:24:18 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v6 3/8] dt-bindings: clock: Add ids for Lynx 10g PLLs
Date: Tue, 20 Sep 2022 16:23:51 -0400
Message-Id: <20220920202356.1451033-4-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20220920202356.1451033-1-sean.anderson@seco.com>
References: <20220920202356.1451033-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0014.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::26) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|DU0PR03MB9566:EE_
X-MS-Office365-Filtering-Correlation-Id: 8791c391-7af0-47c6-71f7-08da9b46187f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	6pQ2Ckvjg6U5mepat4SVXo4pvaGd5WImdQXJg2pYJjd2PlDnpCF2mi9EMn1ssl96X9NaJ9BSj51XMaNRT++mUu3cDrQacebqKoPI+6ch3rc2S2ECLPhAK2lOAS9uz5vq0k6O2bEPNxuNQKIN3r4j1LZIAoiGrRU+wD7mYuaBvILkEQtYLqhFurmYnBAJ2pROhALpjsMrqsOu025SUCLrvc6k0RM19KqoSsgyfQoy1+ldZMp65I9g+8g/d+0sV/C6qziSnl0A5GjOSm2JJFXqqThrSkCkgFL73OlpnjcaViCYP7h4pzBh+XODhW6Bw5AmW0RNtp5Pz2o3l5PXG7FHgULovvVWjks6h5lKrwDQei+vGIHldbu2UtzjRy6hsjFTatvvoj0zIdBQjyLF5MiTdUHVo0Insb+jFihvAOIr78MPubPqlYSlltkaeEUXgLSM21ZZTLcaV4j7oFsvx4uq/1jh66zVuoPvsUIymQivCvcuh9ilbnKrnog9XNv9/A+cQqIn7L19bxeJ/bKrusd03cxJhKFj47KvBbhAF3LIdcQYSKHodIvQYP+UaFmtas4wYQDsWEMRsGfZsSCZTPR13Vb1Q60+Is1GYnWuntxempRwSVuZvBs3Q9cwIEPxdwFluvDgy8GJ5gKx6msFsSXBx5XZXor4IFsovrqxVf53Of1Pmw/s2/UPZqtIAtBiw0kz8K0NGpKPKTL21XheJ7vUPOyq2gsqklHCDcet0fHmu0RWyPyP0G87sUr2as7zUCNbwYu56r6TOG/50pygzKX9WQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(376002)(39850400004)(346002)(451199015)(41300700001)(38350700002)(7416002)(52116002)(6666004)(83380400001)(36756003)(6506007)(8936002)(5660300002)(110136005)(54906003)(44832011)(2906002)(86362001)(316002)(478600001)(6486002)(1076003)(38100700002)(186003)(66946007)(66556008)(66476007)(2616005)(26005)(6512007)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Vx4J1jzlq6nB7syO/Azft2S6pGC4coN2ykYmUDL2nrxlspZVgQJirdEN0Lnh?=
 =?us-ascii?Q?63BGb6IgHlHYpG/XMrYtIithlEsmVm5LLMWQjHmxQygumbqGldCYhHvu6YTb?=
 =?us-ascii?Q?ZOvJYpvF1gpZvViQUtlVlxTLwd1Bmn2cBh6ZA6X16SQ8Au9zmLsiOywxajlT?=
 =?us-ascii?Q?dTWqz16gmeNoCcYBsbJyfWMBtSHnoH0tuopCbPwBNzz04ojYIZB0KPw1IntD?=
 =?us-ascii?Q?cpm6xfAFFKF1KCdBr7FtkXjyeYR9l3Mj4xSSo/+t19xCNb4yDvPkhPq5oCSS?=
 =?us-ascii?Q?xArCK6KTYho6JeDp24K3fOeieQeCj3y4qZA1OVprA0Wmv2MIdTRlQ24IwnS6?=
 =?us-ascii?Q?QXyUGRrYNeYgVtQVSn8M4qAbnNhh68Vg/iXONJ+7ir7yUtN17w75LeKsFaiy?=
 =?us-ascii?Q?OLl91h7TcDld4Iepv951tOj/FuQr+pDe3oMBu1QMFrnuRlhh6dWfWRHE11+C?=
 =?us-ascii?Q?crHefX1PN1TOQPBYNY3qYHrptSZmJitAfda6G8z+AvkDgp/D2f/xREK5J/k3?=
 =?us-ascii?Q?xp13HeVJVIRnxNs5nwJCl66FEKkBGScArc8SEEwkUYC/hcggLZYTQYWkJH8a?=
 =?us-ascii?Q?5lxxKcifF93VT6u5jxS3vlrfoVWe0DUdQEIXR75WKfOD2+W6sFqPIoBp5rU8?=
 =?us-ascii?Q?FhQedUh11MJMASIuaukgxx1d8hXUP9hMkILWnCvf+37zvsyPAG7lqahk99TH?=
 =?us-ascii?Q?1NoSgFiIILma1+ASsd56QnsaueFBoOkBe68RTwWWXYhmKbMwO+LsAhvm88aF?=
 =?us-ascii?Q?SiWwM3mJLG6r6BnCohFSQ250pj4CURrEWUTxs6JaVfYK7ytam9IT/GjTMLym?=
 =?us-ascii?Q?6M4jBSwcyuJeXQGZwKYj+6fK1EbEtDOSJ1FyOrZcK9JqynLXuNhtHqrSWQxR?=
 =?us-ascii?Q?0fEyAPIta7URumc/LD6zBP/cpM7M5Uz/j6+9408Q1rdzRjbXwz94BIPd2AGO?=
 =?us-ascii?Q?xRqx1hBsK//exRF+TV1bC8KlReZ/9Nyk/OYcfbOJ94JOmetK9NlD20RWOh50?=
 =?us-ascii?Q?dPx2dJk2EUpFaK/KU6BoV8IceCWwP3haKJuOY7t5jl7WP4fU1eYNbokJbPQ1?=
 =?us-ascii?Q?fZDT8Vd8qW7KGeZAz9f3v+D+EGS6bHrMdDttnKVsECgifXZNP0fpv+J97Dn6?=
 =?us-ascii?Q?28EP2xfkRBbLuHbH1ohZNIZzQfnXdXOcqepdU+jTpxVPYUZhbpimvJl4PuqI?=
 =?us-ascii?Q?2nHgzrUfIsnwuaiJIGD/3VkBCQnIVEHEpaej3cRFwg6q0xb0thUk0raK3pj6?=
 =?us-ascii?Q?ow/hklPH76NMC5UBGnQEcNG4WMSpJA3yc+hY/NV/1ODAMRbwIzTiroNhHM38?=
 =?us-ascii?Q?CmQ+HLh4ncYPT5PLFPXQc5K4xM2AKk6kQCAi33qZ4IDsynCQV8AqWUhwyCxM?=
 =?us-ascii?Q?TBkjF/wi8qIvE6EdAwEBm79ynbZP+y0kPo78GZC92CfrKS6bcz8ixstwUqSi?=
 =?us-ascii?Q?XbvQs64krtNYT2X9Lpv6XNKYKGGoA1YX/bvnzW5KQpNP3Ms+DhuYHy+heBc1?=
 =?us-ascii?Q?9WKcMF05b++9CSaPDrlMRgr5QpZdE6MLrw1bkgdeU534vz/MB1hvoidflun4?=
 =?us-ascii?Q?ui5JI0gIuq+YG6N9YZ9TtIFIyqa68UTnA+SgQPx5kHfxE69GEzT0qOvVMeJy?=
 =?us-ascii?Q?9A=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8791c391-7af0-47c6-71f7-08da9b46187f
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 20:24:18.8461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnUnNWDieIsnGwyeb36YGs31VFlf+ww1neJFmWe/RWsqAKJA2wa6AT9F3PNff68KCpVRhin4vbulQjBxn3Mhcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9566
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds ids for the Lynx 10g SerDes's internal PLLs. These may be used
with assigned-clock* to specify a particular frequency to use. For
example, to set the second PLL (at offset 0x20)'s frequency, use
LYNX10G_PLLa(1). These are for use only in the device tree, and are not
otherwise used by the driver.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Changes in v6:
- frequence -> frequency

Changes in v5:
- Update commit description
- Dual id header

Changes in v4:
- New

 include/dt-bindings/clock/fsl,lynx-10g.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h

diff --git a/include/dt-bindings/clock/fsl,lynx-10g.h b/include/dt-bindings/clock/fsl,lynx-10g.h
new file mode 100644
index 000000000000..15362ae85304
--- /dev/null
+++ b/include/dt-bindings/clock/fsl,lynx-10g.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
+ */
+
+#ifndef __DT_BINDINGS_CLK_LYNX_10G_H
+#define __DT_BINDINGS_CLK_LYNX_10G_H
+
+#define LYNX10G_CLKS_PER_PLL 2
+
+#define LYNX10G_PLLa(a)		((a) * LYNX10G_CLKS_PER_PLL)
+#define LYNX10G_PLLa_EX_DLY(a)	((a) * LYNX10G_CLKS_PER_PLL + 1)
+
+#endif /* __DT_BINDINGS_CLK_LYNX_10G_H */
-- 
2.35.1.1320.gc452695387.dirty

