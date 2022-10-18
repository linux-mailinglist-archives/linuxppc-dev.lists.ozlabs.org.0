Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F8860368F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 01:14:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsV771Q8sz3dx2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 10:14:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=G2oh05vu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.6.63; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=G2oh05vu;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60063.outbound.protection.outlook.com [40.107.6.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsV434fMyz2xf7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Oct 2022 10:11:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3Bk22s1lNmY+WFykdYxFtrdml9SGG7LTRS9Gox/l8HGJCvrNR9mE0jSVFhnAUAPP878D9V7Lc5lhSvX9PkNT7H65XXdzuJERg3yg3L+xZdeUDnPhd8Xca8ZcYu+55LjjwKpqYKmY7nI0m7CaIJceKGGd3GmDUsZyZE4FsckFDYSu6TZIjFJ6efb4tOLJgxaKFzh3T7d4MqnGFIQzoXZyWk+XkwohVsuML7denfwPtplhIHeoncSLGtyFteo+JRwZvyFOegfRiU3byXWEsBB6SIYIeR8REau8btAKPEP5cF1HfvmvnQYq2/790kNQ7sI5z/8H9aUEt6JWqIS4J2FMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHfrKvIf6uhW+PIvN7eGwoBrowmdKIkqx5wJ0m5ZL2o=;
 b=P5XTNRTW2LGMp7+EupsJIUf+ClgL/wdCPCUA1tb0CHDoQhUp58QskV0XhSmHLN4iBcAc8loemSjQomeUA3YwBZhmRmEdMZK/oVyz+yeswrKamoJLeO8LAiFoQL18WNvL80YAGFdeZWWhguiX4/3ZtMbJhAeauhLf/6sTcp8m8a554rbeZPiJs4LVgQCzoGJTs0ad7D6E7GsgkC8z8NgHKw9Nz53lm7WyG7z6/sotRq9L2PCjGwq4fQAKZQzgEVf+LdkmMAOWUj4128kGAIHxwvYSLHQJ1PHOHQOSQIjH6vL4g8SJfJ3ZAG9ZF24VWeBLcrFO4mHMnYY1NnnZJY4s8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHfrKvIf6uhW+PIvN7eGwoBrowmdKIkqx5wJ0m5ZL2o=;
 b=G2oh05vuBrpPKpn1mtoWvHn02C6X3Pf8V75r/bYBh6jO1HiP2ZprhSMYmAvjB469DnyLyohFE01GXxDmaT3qcKbQt06oxhp09GLcCmGf6ZDIx3LDID4AQRb8ELgquy1XSUMHy5+TgBv4kBuyG35i6I1VkuEFQemkPdhMq8YsI/2Sa/UJlQEgjq25oGMW0wj56VXeMhJ9WpYQTckUUtRBixcYCjG7ynZN4x4J8gXOstY76sFK6ccx64MhhfK0MY08p0+J/cjZiS6HFvLouOCfQk0y16GEbn2W+wyre+3zBVrJH0F0bKe4LPBYqeQUZfNQB2wPU0sdU+8s16XBEv58NQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by PAWPR03MB9642.eurprd03.prod.outlook.com (2603:10a6:102:2e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 18 Oct
 2022 23:11:28 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5723.034; Tue, 18 Oct 2022
 23:11:28 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v7 3/8] dt-bindings: clock: Add ids for Lynx 10g PLLs
Date: Tue, 18 Oct 2022 19:11:07 -0400
Message-Id: <20221018231112.2142074-4-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221018231112.2142074-1-sean.anderson@seco.com>
References: <20221018231112.2142074-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0007.namprd18.prod.outlook.com
 (2603:10b6:208:23c::12) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|PAWPR03MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: 59fadede-ddff-4a51-6335-08dab15e1646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UwhAkoQKzJ7DdKnWzzFSxAL4xw82O9oDp0OlS2HHDTN1+FsC1sWKHC9f3AAIhW28OESamXrRzlBRln0NUpDqTf4bQbskgaLq8XM9YWn4dthaQjqloeZXyfw1ONk3ymX5LKOzNOMfONUL2P7g7JHUAVSSLXfaf/49BTl2gdwLTokuIRQ2tvEr8kC5RJ3B4xSWv+2jo4pd6juxavSTlgnEsvdqeWW/VpG+iGl6X9ktPRSPbHVLQKiysFyWVTZ4Q6dOGhybByR2lkYOQiYC3l0yqZbGrA4Hj5WBEIIpZHWfVjrqGvxUsxdattbb37CoCnUPVeHR6DjYnh7LqoVvsjQ+lYT1POrkTgKFUWmcyl6XMdgkaQW+B435z5ssMajlmee4MiP8jd0DjyL3+i4TQQI8jDsV5O6AmMWH/cdhWhwd6AoRDDlK6H1UP4/6QgkUzm3eRiZqmpnx6RluojZyRqeygf3kQPZbA/YR9SPvoPuhPDBNMSYPOSYp0bLNRG0y79LCJOwfK8P0GX0OCP0qABOKtl8vvrZKbgy6hjFo1NNFMooZfbNy2ftTyiEL3JU96j9cmdKa4i/HIVpS034SHLEwMaXleGnawv5uAL1CZT7xlVXoPo+3rshjPdSr0H524WWCyRquRDbbfbgozpHv2MweaNIqJDNz3kox9d5X8lg1q9dTWmlCNIgexjDwvgDwUKvtyQPPg/iU8FWlgFm2PDnNPD98CrGvNopktQsCxOALAqaI49MW89oDeURZT0dGWmwCr5CS0WVTvkPxI6Yb+y00XQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(396003)(366004)(39850400004)(451199015)(6506007)(6512007)(110136005)(26005)(2906002)(86362001)(4326008)(8676002)(5660300002)(66476007)(7416002)(8936002)(36756003)(44832011)(66556008)(38350700002)(38100700002)(41300700001)(66946007)(83380400001)(316002)(1076003)(52116002)(6486002)(2616005)(186003)(478600001)(54906003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?kUx2r0VUgWVwp4MYPGJMGtYnvYO6yNQtZUKM/5oP5Deli/UH4SZJJW0phJH4?=
 =?us-ascii?Q?UiKcppp8FkxPirb0KP59cJ783Fgqz6enbiB8r9FgJLHkwhSJ+fKFzVSbKBOv?=
 =?us-ascii?Q?HTe8sewOO6noIh9bgsaoJeiJcp7un6zhS0O0I1lKmhJm3mKRismiMw1wQ/i8?=
 =?us-ascii?Q?IOjXsHXZdEoHIFcdyGkxN+fWlDUQIvjJIL43DwZ3EJS9PkAaUjJto5i9+dop?=
 =?us-ascii?Q?m9g73hAfCQnJEttBEeUMF3oxGs54w6nRrekJTgQ6bCVPQypy9VszPlw9IOSh?=
 =?us-ascii?Q?mjB0SZkv/Xi/4nd0hMvVvMnaZke3qDROko82TtV4okqcuwU/3SqE4DLSHw6c?=
 =?us-ascii?Q?AD4vsKNcZ7Iu+1JcYZ5kGldntUGU1SJDlUSDPVJilOF4o3NyLYNjnLpsLJ1D?=
 =?us-ascii?Q?h6gpokjGYIP2P4a8eA5E7THcLpBVrZTXFPNvUeHJWfDbaG3s4b3MZ1H2CRlJ?=
 =?us-ascii?Q?m5WtTfGwGQdAo5sTTWrIsScK0V5ETR9ueqfaf3K3jNUmozf0jj+DQmg7GAoz?=
 =?us-ascii?Q?y3tPakUH87ClOC0oWoUUoZs1BnOWggPIfVK7Y0I7TegcT6O/xDUfU6H+PWWA?=
 =?us-ascii?Q?YHTnmapMr43uUbNuG/9vdQL2i/v7vCfIuL1BZ5dhQAIuyzOjTyaRlW48fZN1?=
 =?us-ascii?Q?u5yJgZctCrdS4lbU42OWz4M/4Uvp31E4k9QsJtzzCtAEtnKyeFdJObEosRdl?=
 =?us-ascii?Q?AAmdXORaXzSzIXERXmEvxuLF+0X6Qycg68zdvLUk7lxRHLvhAEsxHPZoHoes?=
 =?us-ascii?Q?7umSZnAyfAbIKhYwIFeaXeVXiBMc9ETybKdHlu9zQleJkAVe4Ec0wwgD6Y8T?=
 =?us-ascii?Q?nY368ODID4EVv0Go/8FUkdVuv5LJYs19A3tDcJ/xt73KUq+32VLHQmcZTGaL?=
 =?us-ascii?Q?2ZNmSFTXiYQUXRx1Z4ficQMQz6TdD0ChGdrdfujcPecQEgdIRZhm9EBJxGKL?=
 =?us-ascii?Q?Tde2S3RQFiyLiB3McES80S/fYcZSVGBYep6GLlRwoCqvknOozfSyGAQBB/k1?=
 =?us-ascii?Q?n2xsmxc1h2TBkGRwpv6yAG4nyiFDsrWewkhV2UytUDUj+awKCgZyWTwwmSvB?=
 =?us-ascii?Q?XhQYxs8M0IHvZ0PgRWvYjvl5d4XykvtQFIJmBtaN4SwPzPgrEUJMBQ+dFRCP?=
 =?us-ascii?Q?o5gncDaA199B3Voec53nT3f5eS8FUN8tlUC7kCJdXucvty8wwuyyOcu9Q/W7?=
 =?us-ascii?Q?Um0huRo2ETzUkKJj/MYEGbq0nLJdIpl7pgOHXnYzRV8qgW/giVOlE6FDrkQd?=
 =?us-ascii?Q?nT3uCw9aRZCPyUGyyJJqy7kTIAZaqRKVcLuhg7RUNCC+ySRXLIwWCkiP7EF8?=
 =?us-ascii?Q?0qgIY06p2NTQmwSk2BXcMKeaqZahg0kgLlnYDC3yMp6Xqy20yfzJpoRO4+iD?=
 =?us-ascii?Q?t0WtNuI9erGY7PNUSDQR2dF9Zym2am1MdUttP+Bh2R8UY8C956fZ2c767kht?=
 =?us-ascii?Q?mMU9rq3tcQVV0SrPSzixq+bU+VUGtI0R4erULddVjLpn++wUZ4BXzCzWfHG3?=
 =?us-ascii?Q?JWuAHiZgk8ytAkcgOPvjk5ojykGgWc1Mmd9OQU6syT471eO7h/hh9KNfYfpa?=
 =?us-ascii?Q?joeBd4XEaskL0+Jj8mQdremLxVsezHyB5hCS6cOEtgiREln2s6xS82BGtF0r?=
 =?us-ascii?Q?DA=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fadede-ddff-4a51-6335-08dab15e1646
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 23:11:28.6506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rnRAa9g/mA2TZASycRSw9G3i/KBc90rojXi7bi0O6Rme26safipNFpk0soaADJdERGxXlettzHLcVdPNvRr3tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9642
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

(no changes since v6)

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

