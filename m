Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7735659389
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 01:05:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Njls74GCkz3f9H
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 11:05:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=fylaqnJp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.88; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=fylaqnJp;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Njln62Nt3z2yNX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Dec 2022 11:02:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7a0MgjpVrkEGBCAWcmacUA31qaNaxZeOQeG5WnBclaXgZf0+UonwV+gQeVgjbmtA9um0PwjeLGdHGhYjBrWf5wNTj2di3qNiB0Q0dkzoD3qgUW94SViuDr5BztUOhGgMWvBELiDy1yrdfLf+RBvFCaWXi3IG3AD/fyFNaTkjKZNrMPrrxN+nvEKKFE5N/5DZtn3FK4baivUDz8NpOHqWg2Dzm/hzs/cWK3UOO1JtoArgMLCPF8nTLFB7R5HnevoPDdWhLOU1+wTSeJ5JDxlHRzQjyMEMOC3gXJ25I7V9rjS8RtakWPDoRqO5/Qy0Uhu+avfYyd2nLm1sJyu+7GX+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SRTrpKyDVtEfO5t68qKFCb64ktH7XhoraisGZ436M4=;
 b=H3NAZsGBMI6MByPF7N7kTq/21A7nzk8M+YPblROg6O9mp0r4YFYEVaeFtKIgtG+GEfTQAG6YRHyb+DsQXwEQAk6Bf97jodM7UmIdLLfn1ig/yOXPM3SMmIia4F20sw+WFWFNYn3AILUPt41gzgaiMdTMZpaioaWd5mG/TwY1A64DX+ZnMIboCZiEqpKmsfDmmBoniMr8y6Dx3PWyoHECfRMIYF2cYI1uuCSKUtMqsl0ss9JC3dRW5h7FygotKD4M+/P1UUqxY892zQcITgfqNXN0VPhNvksougyCDihQvc0KhKzg38qv4H5vi9AWDEZ1piylo6g5bqqDk/RxWNLnfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SRTrpKyDVtEfO5t68qKFCb64ktH7XhoraisGZ436M4=;
 b=fylaqnJpFGOaclo+qmGFDBAsURxXsLKcq+VL1316DWFYW/Q2k7NfKOgTMI6RRtz1npNWp1P0h+Hm38V5jEM1rakMiRhRDrsPI4irNB7JOQ84REpXbJON/gCUlHDlISWLQrk8S/YYjvEtadRZ89Z2v32Da/9ye4nfZdPvpwjhGRAd3Awg3RQUyRtzTAOA+PT6BKdRgu/eSEPIamYJAT3KXWrJ/mHpQUpIt1p0DAMAP0Za6Sf3mzL2kfGsMLAf5B7z1oCKMWZLRT3IMr/ZCQqtpciYwfFsbkdB5WG8rFgFWWlhJ4Th+zDLcnX1umm8IUDYEWCb8X23zw6Xw8LHq3QgRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PAWPR03MB9788.eurprd03.prod.outlook.com (2603:10a6:102:2ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 00:01:56 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb%8]) with mapi id 15.20.5944.016; Fri, 30 Dec 2022
 00:01:56 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v9 04/10] clk: Add Lynx 10G SerDes PLL driver
Date: Thu, 29 Dec 2022 19:01:33 -0500
Message-Id: <20221230000139.2846763-5-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221230000139.2846763-1-sean.anderson@seco.com>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::29) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|PAWPR03MB9788:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea717cd-683c-4cf4-98b2-08dae9f910bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	VTdA/5qGz8mWR0JKR5k6YGvVQK3BoLeEvhZCGshfJ1ycYGkdZL0OZEoYf67PjMSjbQf+uVa7aKKFe04gUJlj5LI1hY445UBqOJGU8QgOzcq27huU9An1SD9o74QyCjnq1Bw8epQQ/MTdJrPvXLu15ReIYdvoEWuqXjOqut3+MEMJuJdP9PDqfkNIzZvjwj7eJvGugbez8K5ECVy1utjq9Gd7yxrBpv0KjLq8XOssHLYOg47OtQSBSykbwZWc+2D4SCCbREvax/btZhQxUY13lU1DqVHi8uCkuNGNVwomt+Jf1rd81RRKxGGqjwfRIbPfUXnRiMFfguEyz2Qhkd/pLnGq3kT0HcE+CMjq6DvFMPr3zwfBPORUVZpo0qoiU90qQ46QhXwBpPNqjod++zEL2Vwid/5fqJM9kZGY13ueQXL9s4BC+qNPOJPPp/SvmoWyfpAf7tr0BzcfQawJxcMq0GQ0irEhdhkBr88gW88zQKDZnBOvCwqhH8SVYgRTWcgAb07rcweV/YO1RuYwrqwwbldk7OARZ5D85E5BN/hWTjNCe2qDjDzyY9kgntN+v9RJiPIbkLLAgaU3oZl43pZ41ohGKxxndqkAOTlHSjlWyIwHQCC5g4nWXQwM46KhsN34Hi9P3CgIyBjmw4HbnViYOXtta2EuWAaALunJeExoZy81NAOvfciu23LV4gBezYcsOQmeZEGY0inaK7aGc1+WPIn7Hi9FuWnmEdGu8xG7R4LONtAlxTuQlQOjZ+FHWTT8
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(376002)(136003)(39850400004)(451199015)(66899015)(8936002)(83380400001)(4326008)(8676002)(66556008)(66946007)(7416002)(5660300002)(30864003)(1076003)(66476007)(44832011)(38100700002)(6506007)(186003)(26005)(6512007)(2616005)(38350700002)(6666004)(316002)(86362001)(2906002)(110136005)(36756003)(54906003)(41300700001)(478600001)(966005)(6486002)(52116002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?FMcwdk3nrjHkuEhlgQQgBrLBY4r61VIRvxBtcgXGwKpSYfVDHyg2STdZWXcb?=
 =?us-ascii?Q?0Z/IPB8zMkrBIsIH8Ax4uYjf3POQyjC2bkWbDDDkRleereHIStLuxI0NGSwU?=
 =?us-ascii?Q?SzpYhr/qYpM4P5D0BGhIzA5NNR3ZNSWCgUtzFG+5MdnO+80um/V8/J9XbkdK?=
 =?us-ascii?Q?GxJiuWgDI6i+nz4sd928Y9ekTefan8na/dwu1GqTHVt0nJ9KyPRMeuJTFuMG?=
 =?us-ascii?Q?R1134Ea8IuDyceHh0n7QlVER+J2mOjAf/t2r3w96OARdNW7eP1MYsbSKQO9W?=
 =?us-ascii?Q?UJ6gUwggUdZNH9J7RDWlIejHmo2d6HwbSQxQveQ83lagDVKs5yzBMLBa1WA4?=
 =?us-ascii?Q?X1AgTNxjCV1Y67p4rtExS5CW5QuYFlRCYZVna1ccKUhmDSoZKZEEvttvl62s?=
 =?us-ascii?Q?V1A4MBVxlpqtqOaEDOhP6DRBsHB+1iKrXN/Fo7sUFY+WLefKDwSNFeHe7Bel?=
 =?us-ascii?Q?lqw4IwgCoKWZWOhDimWqDw2Ste48fnls+UNidFViaHKGfNFM8fBrkf+F+wHf?=
 =?us-ascii?Q?u9ybNd6CnPj2F89DUKyq9FoJB43ZF1y/gKglJhkfFToQTQpZ+uXRyuhFhbu9?=
 =?us-ascii?Q?3tH+orYqPqaAC8vCMsEdK8WHRn0wqOliiN/9JvK17oTdREQcq9rDY4hgwYnk?=
 =?us-ascii?Q?fgzs/Fo0HX7IVFAMHDbQ4XUafgiGD8fKlDAz0+KSz0GxoL/kPo7bIUa9Zsdk?=
 =?us-ascii?Q?p9E5MeSAc1Bp1oKyQyx+2f0fTZI2KVhayRFOjFb4/JlPsC8ak+NNy3NEt22i?=
 =?us-ascii?Q?uSxAsRgJKKDoioH7rqf8727Gm+yVT1KJuYoDlJY389cw6NEsmPV1u4VgfM5W?=
 =?us-ascii?Q?OgEhadaTsZQpgtLBsy7f4roKJy0r06uTbARSm9xLRGqLX8iwNxR/lUxA3OXj?=
 =?us-ascii?Q?ZjdvO/ke1HqSSVKthehjiVeBm8bAFCS/qS0y+mApnH6e5PWrz4+RTV2EW60P?=
 =?us-ascii?Q?+MoieFrRLuuAKSk9XnTaruOCIOgDiqt7wbfju3qYhrcyss9nQkhT/IjmWQZc?=
 =?us-ascii?Q?xuWP6Ca/N9capkMdPftWwK1+SPVKcyx7KE/p7aKBvDgNBcPwk1oki5LWFpis?=
 =?us-ascii?Q?IA1cUAsexIPC46C8lMzO9EuzrToY62CLp/xJ5rr5ErI2oliGy/HPd2aO+gvj?=
 =?us-ascii?Q?CWs67PJYUFcRn13JchF1PSd5VdqOZyUF99KfKsdI3u4/NXERj7GWj+GIIRst?=
 =?us-ascii?Q?gbwQYNhumS6EBU7sgKuALLy0bBgNcaktjnLdNCVQzHAz9sOcR91wDmnxKxtj?=
 =?us-ascii?Q?bvsxKgtcoQrj5UEE7erBra9I98Qt2sE/89gi1308G7G3skgZyBZDp/BIshD1?=
 =?us-ascii?Q?LfOFssuwIl+HCbX7R5SOXh9zuNM9juV7yWRXhxLhDaatbpdcgvo56K+5BPng?=
 =?us-ascii?Q?gLMxiWmDlxvvRTbttB1ImN7iM/hgdrZSwXCSlvBbU71krjnvdfVjNHwk41/v?=
 =?us-ascii?Q?eTwI7YfyRqsO4PO+Av5aQf4KhuuUUFdBhw3i2IA2qlcuaU4kq12cqTHYg9eR?=
 =?us-ascii?Q?CG3gJJUQ6CDqmGeeFxPQRiulB+udL693neEmCYgnZrXNe0GpERDkV2qKJEtt?=
 =?us-ascii?Q?hPt5rXPptkK5+aDLVUvq2PFrmXGht7oLfleigat9JQ7Q1Orwd4b3isJpx9Mu?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea717cd-683c-4cf4-98b2-08dae9f910bd
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 00:01:56.4273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YSthoopVgDG+iBwGnyWpu0ZrYMhMNwXxumSlAHKN6qMvi4qeOK1MF1M8A9O3SfcJAcqOt0laeMusIPyym03yxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9788
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds support for the PLLs found in Lynx 10G "SerDes" devices found on
various NXP QorIQ SoCs. There are two PLLs in each SerDes. This driver has
been split from the main PHY driver to allow for better review, even though
these PLLs are not present anywhere else besides the SerDes. An auxiliary
device is not used as it offers no benefits over a function call (and there
is no need to have a separate device).

The PLLs are modeled as clocks proper to let us take advantage of the
existing clock infrastructure. I have not given the same treatment to the
per-lane clocks because they need to be programmed in-concert with the rest
of the lane settings. One tricky thing is that the VCO (PLL) rate exceeds
2^32 (maxing out at around 5GHz). This will be a problem on 32-bit
platforms, since clock rates are stored as unsigned longs. To work around
this, the pll clock rate is generally treated in units of kHz.

The PLLs are configured rather interestingly. Instead of the usual direct
programming of the appropriate divisors, the input and output clock rates
are selected directly. Generally, the only restriction is that the input
and output must be integer multiples of each other. This suggests some kind
of internal look-up table. The datasheets generally list out the supported
combinations explicitly, and not all input/output combinations are
documented. I'm not sure if this is due to lack of support, or due to an
oversight. If this becomes an issue, then some combinations can be
blacklisted (or whitelisted). This may also be necessary for other SoCs
which have more stringent clock requirements.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>

---

Changes in v9:
- Convert some u32s to unsigned long to match arguments
- Switch from round_rate to determine_rate
- Drop explicit reference to reference clock
- Use .parent_names when requesting parents
- Use devm_clk_hw_get_clk to pass clocks back to serdes
- Fix indentation
- Split off from following patch to allow for better review

 MAINTAINERS                    |   7 +
 drivers/clk/Makefile           |   1 +
 drivers/clk/clk-fsl-lynx-10g.c | 509 +++++++++++++++++++++++++++++++++
 drivers/phy/freescale/Kconfig  |   6 +
 include/linux/phy/lynx-10g.h   |  16 ++
 5 files changed, 539 insertions(+)
 create mode 100644 drivers/clk/clk-fsl-lynx-10g.c
 create mode 100644 include/linux/phy/lynx-10g.h

diff --git a/MAINTAINERS b/MAINTAINERS
index f61eb221415b..c2802d4e61a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12274,6 +12274,13 @@ S:	Maintained
 W:	http://linux-test-project.github.io/
 T:	git https://github.com/linux-test-project/ltp.git
 
+LYNX 10G SERDES DRIVER
+M:	Sean Anderson <sean.anderson@seco.com>
+S:	Maintained
+F:	drivers/clk/clk-fsl-lynx-10g.c
+F:	include/dt-bindings/clock/fsl,lynx-10g.h
+F:	include/linux/phy/lynx-10g.h
+
 LYNX 28G SERDES PHY DRIVER
 M:	Ioana Ciornei <ioana.ciornei@nxp.com>
 L:	netdev@vger.kernel.org
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index e3ca0d058a25..eebed69f6c58 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_ARCH_SPARX5)		+= clk-sparx5.o
 obj-$(CONFIG_COMMON_CLK_EN7523)		+= clk-en7523.o
 obj-$(CONFIG_COMMON_CLK_FIXED_MMIO)	+= clk-fixed-mmio.o
 obj-$(CONFIG_COMMON_CLK_FSL_FLEXSPI)	+= clk-fsl-flexspi.o
+obj-$(CONFIG_PHY_FSL_LYNX_10G)		+= clk-fsl-lynx-10g.o
 obj-$(CONFIG_COMMON_CLK_FSL_SAI)	+= clk-fsl-sai.o
 obj-$(CONFIG_COMMON_CLK_GEMINI)		+= clk-gemini.o
 obj-$(CONFIG_COMMON_CLK_ASPEED)		+= clk-aspeed.o
diff --git a/drivers/clk/clk-fsl-lynx-10g.c b/drivers/clk/clk-fsl-lynx-10g.c
new file mode 100644
index 000000000000..61f68b5ae675
--- /dev/null
+++ b/drivers/clk/clk-fsl-lynx-10g.c
@@ -0,0 +1,509 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
+ *
+ * This file contains the implementation for the PLLs found on Lynx 10G phys.
+ *
+ * XXX: The VCO rate of the PLLs can exceed ~4GHz, which is the maximum rate
+ * expressable in an unsigned long. To work around this, rates are specified in
+ * kHz. This is as if there was a division by 1000 in the PLL.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/bitfield.h>
+#include <linux/math64.h>
+#include <linux/phy/lynx-10g.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/units.h>
+#include <dt-bindings/clock/fsl,lynx-10g.h>
+
+#define PLL_STRIDE	0x20
+#define PLLa(a, off)	((a) * PLL_STRIDE + (off))
+#define PLLaRSTCTL(a)	PLLa(a, 0x00)
+#define PLLaCR0(a)	PLLa(a, 0x04)
+
+#define PLLaRSTCTL_RSTREQ	BIT(31)
+#define PLLaRSTCTL_RST_DONE	BIT(30)
+#define PLLaRSTCTL_RST_ERR	BIT(29)
+#define PLLaRSTCTL_PLLRST_B	BIT(7)
+#define PLLaRSTCTL_SDRST_B	BIT(6)
+#define PLLaRSTCTL_SDEN		BIT(5)
+
+#define PLLaRSTCTL_ENABLE_SET	(PLLaRSTCTL_RST_DONE | PLLaRSTCTL_PLLRST_B | \
+				 PLLaRSTCTL_SDRST_B | PLLaRSTCTL_SDEN)
+#define PLLaRSTCTL_ENABLE_MASK	(PLLaRSTCTL_ENABLE_SET | PLLaRSTCTL_RST_ERR)
+
+#define PLLaCR0_POFF		BIT(31)
+#define PLLaCR0_RFCLK_SEL	GENMASK(30, 28)
+#define PLLaCR0_PLL_LCK		BIT(23)
+#define PLLaCR0_FRATE_SEL	GENMASK(19, 16)
+#define PLLaCR0_DLYDIV_SEL	GENMASK(1, 0)
+
+#define PLLaCR0_DLYDIV_SEL_16		0b01
+
+/**
+ * struct lynx_clk - Driver data for the PLLs
+ * @pll: The PLL clock
+ * @ex_dly: The "PLLa_ex_dly_clk" clock
+ * @dev: The serdes device
+ * @regmap: Our registers
+ * @idx: Which PLL this clock is for
+ */
+struct lynx_clk {
+	struct clk_hw pll, ex_dly;
+	struct device *dev;
+	struct regmap *regmap;
+	unsigned int idx;
+};
+
+static u32 lynx_read(struct lynx_clk *clk, u32 reg)
+{
+	unsigned int ret = 0;
+
+	WARN_ON_ONCE(regmap_read(clk->regmap, reg, &ret));
+	return ret;
+}
+
+static void lynx_write(struct lynx_clk *clk, u32 val, u32 reg)
+{
+	WARN_ON_ONCE(regmap_write(clk->regmap, reg, val));
+}
+
+static struct lynx_clk *lynx_pll_to_clk(struct clk_hw *hw)
+{
+	return container_of(hw, struct lynx_clk, pll);
+}
+
+static struct lynx_clk *lynx_ex_dly_to_clk(struct clk_hw *hw)
+{
+	return container_of(hw, struct lynx_clk, ex_dly);
+}
+
+static void lynx_pll_stop(struct lynx_clk *clk)
+{
+	u32 rstctl;
+
+	rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
+	rstctl &= ~PLLaRSTCTL_SDRST_B;
+	lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
+
+	ndelay(50);
+
+	rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
+	rstctl &= ~(PLLaRSTCTL_SDEN | PLLaRSTCTL_PLLRST_B);
+	lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
+
+	ndelay(100);
+}
+
+static void lynx_pll_disable(struct clk_hw *hw)
+{
+	struct lynx_clk *clk = lynx_pll_to_clk(hw);
+	u32 cr0;
+
+	dev_dbg(clk->dev, "disable pll%d\n", clk->idx);
+
+	lynx_pll_stop(clk);
+
+	cr0 = lynx_read(clk, PLLaCR0(clk->idx));
+	cr0 |= PLLaCR0_POFF;
+	lynx_write(clk, cr0, PLLaCR0(clk->idx));
+}
+
+static int lynx_pll_reset(struct lynx_clk *clk)
+{
+	int ret;
+	u32 rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
+
+	rstctl |= PLLaRSTCTL_RSTREQ;
+	lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
+	ret = read_poll_timeout(lynx_read, rstctl,
+				rstctl & (PLLaRSTCTL_RST_DONE | PLLaRSTCTL_RST_ERR),
+				100, 5000, true, clk, PLLaRSTCTL(clk->idx));
+	if (rstctl & PLLaRSTCTL_RST_ERR)
+		ret = -EIO;
+	if (ret) {
+		dev_err(clk->dev, "pll%d reset failed\n", clk->idx);
+		return ret;
+	}
+
+	rstctl |= PLLaRSTCTL_SDEN | PLLaRSTCTL_PLLRST_B | PLLaRSTCTL_SDRST_B;
+	lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
+	return 0;
+}
+
+static int lynx_pll_prepare(struct clk_hw *hw)
+{
+	struct lynx_clk *clk = lynx_pll_to_clk(hw);
+	u32 rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
+	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
+
+	/*
+	 * "Enabling" the PLL involves resetting it (and all attached lanes).
+	 * Avoid doing this if we are already enabled.
+	 */
+	if (!(cr0 & PLLaCR0_POFF) &&
+	    (rstctl & PLLaRSTCTL_ENABLE_MASK) == PLLaRSTCTL_ENABLE_SET) {
+		dev_dbg(clk->dev, "pll%d already prepared\n", clk->idx);
+		return 0;
+	}
+
+	dev_dbg(clk->dev, "prepare pll%d\n", clk->idx);
+
+	cr0 &= ~PLLaCR0_POFF;
+	lynx_write(clk, cr0, PLLaCR0(clk->idx));
+
+	return lynx_pll_reset(clk);
+}
+
+static int lynx_pll_is_enabled(struct clk_hw *hw)
+{
+	struct lynx_clk *clk = lynx_pll_to_clk(hw);
+	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
+	bool enabled = !(cr0 & PLLaCR0_POFF);
+
+	dev_dbg(clk->dev, "pll%d %s enabled\n", clk->idx,
+		enabled ? "is" : "is not");
+
+	return enabled;
+}
+
+static const unsigned long rfclk_sel_map[8] = {
+	[0b000] = 100000000,
+	[0b001] = 125000000,
+	[0b010] = 156250000,
+	[0b011] = 150000000,
+};
+
+/**
+ * lynx_rfclk_to_sel() - Convert a reference clock rate to a selector
+ * @rate: The reference clock rate
+ *
+ * To allow for some variation in the reference clock rate, up to 100ppm of
+ * error is allowed.
+ *
+ * Return: An appropriate selector for @rate, or -%EINVAL.
+ */
+static int lynx_rfclk_to_sel(unsigned long rate)
+{
+	int ret;
+
+	for (ret = 0; ret < ARRAY_SIZE(rfclk_sel_map); ret++) {
+		unsigned long rfclk_rate = rfclk_sel_map[ret];
+		/* Allow an error of 100ppm */
+		unsigned long error = rfclk_rate / 10000;
+
+		if (abs(rate - rfclk_rate) < error)
+			return ret;
+	}
+
+	return -EINVAL;
+}
+
+static const unsigned long frate_sel_map[16] = {
+	[0b0000] = 5000000,
+	[0b0101] = 3750000,
+	[0b0110] = 5156250,
+	[0b0111] = 4000000,
+	[0b1001] = 3125000,
+	[0b1010] = 3000000,
+};
+
+/**
+ * lynx_frate_to_sel() - Convert a VCO clock rate to a selector
+ * @rate_khz: The VCO frequency, in kHz
+ *
+ * Return: An appropriate selector for @rate_khz, or -%EINVAL.
+ */
+static int lynx_frate_to_sel(unsigned long rate_khz)
+{
+	int ret;
+
+	for (ret = 0; ret < ARRAY_SIZE(frate_sel_map); ret++)
+		if (frate_sel_map[ret] == rate_khz)
+			return ret;
+
+	return -EINVAL;
+}
+
+static u32 lynx_pll_ratio(u32 frate_sel, u32 rfclk_sel)
+{
+	u64 frate;
+	u32 rfclk, error, ratio;
+
+	frate = frate_sel_map[frate_sel] * (u64)HZ_PER_KHZ;
+	rfclk = rfclk_sel_map[rfclk_sel];
+
+	if (!frate || !rfclk)
+		return 0;
+
+	ratio = div_u64_rem(frate, rfclk, &error);
+	if (!error)
+		return ratio;
+	return 0;
+}
+
+static unsigned long lynx_pll_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	struct lynx_clk *clk = lynx_pll_to_clk(hw);
+	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
+	u32 frate_sel = FIELD_GET(PLLaCR0_FRATE_SEL, cr0);
+	u32 rfclk_sel = FIELD_GET(PLLaCR0_RFCLK_SEL, cr0);
+	u32 ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
+	unsigned long ret;
+
+	/* Ensure that the parent matches our rfclk selector */
+	if (rfclk_sel == lynx_rfclk_to_sel(parent_rate))
+		ret = mult_frac(parent_rate, ratio, HZ_PER_KHZ);
+	else
+		ret = 0;
+
+	dev_dbg(clk->dev, "recalc pll%d new=%llu parent=%lu\n", clk->idx,
+		(u64)ret * HZ_PER_KHZ, parent_rate);
+	return ret;
+}
+
+static int lynx_pll_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
+{
+	int frate_sel, rfclk_sel;
+	struct lynx_clk *clk = lynx_pll_to_clk(hw);
+	u32 ratio;
+
+	dev_dbg(clk->dev, "round pll%d new=%llu parent=%lu\n", clk->idx,
+		(u64)req->rate * HZ_PER_KHZ, req->best_parent_rate);
+
+	frate_sel = lynx_frate_to_sel(req->rate);
+	if (frate_sel < 0)
+		return frate_sel;
+
+	/* Try the current parent rate */
+	rfclk_sel = lynx_rfclk_to_sel(req->best_parent_rate);
+	if (rfclk_sel >= 0) {
+		ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
+		if (ratio) {
+			req->rate = mult_frac(req->best_parent_rate, ratio,
+					      HZ_PER_KHZ);
+			return 0;
+		}
+	}
+
+	/* Try all possible parent rates */
+	for (rfclk_sel = 0;
+	     rfclk_sel < ARRAY_SIZE(rfclk_sel_map);
+	     rfclk_sel++) {
+		unsigned long new_parent_rate;
+
+		ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
+		if (!ratio)
+			continue;
+
+		/* Ensure the reference clock can produce this rate */
+		new_parent_rate = rfclk_sel_map[rfclk_sel];
+		new_parent_rate = clk_hw_round_rate(req->best_parent_hw,
+						    new_parent_rate);
+		if (rfclk_sel != lynx_rfclk_to_sel(new_parent_rate))
+			continue;
+
+		req->rate = mult_frac(new_parent_rate, ratio, HZ_PER_KHZ);
+		req->best_parent_rate = new_parent_rate;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int lynx_pll_set_rate(struct clk_hw *hw, unsigned long rate_khz,
+			     unsigned long parent_rate)
+{
+	int frate_sel, rfclk_sel;
+	struct lynx_clk *clk = lynx_pll_to_clk(hw);
+	u32 ratio, cr0 = lynx_read(clk, PLLaCR0(clk->idx));
+
+	dev_dbg(clk->dev, "set rate pll%d new=%llu parent=%lu\n", clk->idx,
+		(u64)rate_khz * HZ_PER_KHZ, parent_rate);
+
+	frate_sel = lynx_frate_to_sel(rate_khz);
+	if (frate_sel < 0)
+		return frate_sel;
+
+	rfclk_sel = lynx_rfclk_to_sel(parent_rate);
+	if (rfclk_sel < 0)
+		return rfclk_sel;
+
+	ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
+	if (!ratio)
+		return -EINVAL;
+
+	lynx_pll_stop(clk);
+	cr0 &= ~(PLLaCR0_RFCLK_SEL | PLLaCR0_FRATE_SEL);
+	cr0 |= FIELD_PREP(PLLaCR0_RFCLK_SEL, rfclk_sel);
+	cr0 |= FIELD_PREP(PLLaCR0_FRATE_SEL, frate_sel);
+	lynx_write(clk, cr0, PLLaCR0(clk->idx));
+	/* Don't bother resetting if it's off */
+	if (cr0 & PLLaCR0_POFF)
+		return 0;
+	return lynx_pll_reset(clk);
+}
+
+static const struct clk_ops lynx_pll_clk_ops = {
+	.prepare = lynx_pll_prepare,
+	.disable = lynx_pll_disable,
+	.is_enabled = lynx_pll_is_enabled,
+	.recalc_rate = lynx_pll_recalc_rate,
+	.determine_rate = lynx_pll_determine_rate,
+	.set_rate = lynx_pll_set_rate,
+};
+
+static void lynx_ex_dly_disable(struct clk_hw *hw)
+{
+	struct lynx_clk *clk = lynx_ex_dly_to_clk(hw);
+	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
+
+	cr0 &= ~PLLaCR0_DLYDIV_SEL;
+	lynx_write(clk, PLLaCR0(clk->idx), cr0);
+}
+
+static int lynx_ex_dly_enable(struct clk_hw *hw)
+{
+	struct lynx_clk *clk = lynx_ex_dly_to_clk(hw);
+	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
+
+	cr0 &= ~PLLaCR0_DLYDIV_SEL;
+	cr0 |= FIELD_PREP(PLLaCR0_DLYDIV_SEL, PLLaCR0_DLYDIV_SEL_16);
+	lynx_write(clk, PLLaCR0(clk->idx), cr0);
+	return 0;
+}
+
+static int lynx_ex_dly_is_enabled(struct clk_hw *hw)
+{
+	struct lynx_clk *clk = lynx_ex_dly_to_clk(hw);
+
+	return lynx_read(clk, PLLaCR0(clk->idx)) & PLLaCR0_DLYDIV_SEL;
+}
+
+static unsigned long lynx_ex_dly_recalc_rate(struct clk_hw *hw,
+					     unsigned long parent_rate)
+{
+	return parent_rate / 16;
+}
+
+static const struct clk_ops lynx_ex_dly_clk_ops = {
+	.enable = lynx_ex_dly_enable,
+	.disable = lynx_ex_dly_disable,
+	.is_enabled = lynx_ex_dly_is_enabled,
+	.recalc_rate = lynx_ex_dly_recalc_rate,
+};
+
+static int lynx_clk_init(struct clk_hw_onecell_data *hw_data,
+			 struct device *dev, struct regmap *regmap,
+			 unsigned int index)
+{
+	const struct clk_hw *ex_dly_parents;
+	struct clk_parent_data pll_parents[1] = { };
+	struct clk_init_data pll_init = {
+		.ops = &lynx_pll_clk_ops,
+		.parent_data = pll_parents,
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_PARENT |
+			 CLK_OPS_PARENT_ENABLE,
+	};
+	struct clk_init_data ex_dly_init = {
+		.ops = &lynx_ex_dly_clk_ops,
+		.parent_hws = &ex_dly_parents,
+		.num_parents = 1,
+	};
+	struct lynx_clk *clk;
+	int ret;
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return -ENOMEM;
+
+	clk->dev = dev;
+	clk->regmap = regmap;
+	clk->idx = index;
+
+	pll_parents[0].fw_name = kasprintf(GFP_KERNEL, "ref%d", index);
+	pll_init.name = kasprintf(GFP_KERNEL, "%s.pll%d_khz", dev_name(dev),
+				  index);
+	ex_dly_init.name = kasprintf(GFP_KERNEL, "%s.pll%d_ex_dly_khz",
+				     dev_name(dev), index);
+	if (!pll_parents[0].fw_name || !pll_init.name || !ex_dly_init.name) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	clk->pll.init = &pll_init;
+	ret = devm_clk_hw_register(dev, &clk->pll);
+	if (ret) {
+		dev_err_probe(dev, ret, "could not register %s\n",
+			      pll_init.name);
+		goto out;
+	}
+
+	ex_dly_parents = &clk->pll;
+	clk->ex_dly.init = &ex_dly_init;
+	ret = devm_clk_hw_register(dev, &clk->ex_dly);
+	if (ret)
+		dev_err_probe(dev, ret, "could not register %s\n",
+			      ex_dly_init.name);
+
+	hw_data->hws[LYNX10G_PLLa(index)] = &clk->pll;
+	hw_data->hws[LYNX10G_PLLa_EX_DLY(index)] = &clk->ex_dly;
+
+out:
+	kfree(pll_parents[0].fw_name);
+	kfree(pll_init.name);
+	kfree(ex_dly_init.name);
+	return ret;
+}
+
+#define NUM_PLLS 2
+#define NUM_CLKS (NUM_PLLS * LYNX10G_CLKS_PER_PLL)
+
+int lynx_clks_init(struct device *dev, struct regmap *regmap,
+		   struct clk *plls[2], struct clk *ex_dlys[2])
+{
+	int ret, i;
+	struct clk_hw_onecell_data *hw_data;
+
+	hw_data = devm_kzalloc(dev, struct_size(hw_data, hws, NUM_CLKS),
+			       GFP_KERNEL);
+	if (!hw_data)
+		return -ENOMEM;
+	hw_data->num = NUM_CLKS;
+
+	for (i = 0; i < NUM_PLLS; i++) {
+		ret = lynx_clk_init(hw_data, dev, regmap, i);
+		if (ret)
+			return ret;
+
+		plls[i] = devm_clk_hw_get_clk(dev,
+					      hw_data->hws[LYNX10G_PLLa(i)],
+					      NULL);
+		if (IS_ERR(plls[i]))
+			return PTR_ERR(plls[i]);
+
+		ex_dlys[i] = devm_clk_hw_get_clk(dev,
+						 hw_data->hws[LYNX10G_PLLa_EX_DLY(i)],
+						 NULL);
+		if (IS_ERR(ex_dlys[i]))
+			return PTR_ERR(plls[i]);
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, hw_data);
+	if (ret)
+		dev_err_probe(dev, ret, "could not register clock provider\n");
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(lynx_clks_init);
+
+MODULE_AUTHOR("Sean Anderson <sean.anderson@seco.com>");
+MODULE_DESCRIPTION("Lynx 10G PLL driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index 853958fb2c06..5d461232276f 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -47,3 +47,9 @@ config PHY_FSL_LYNX_28G
 	  found on NXP's Layerscape platforms such as LX2160A.
 	  Used to change the protocol running on SerDes lanes at runtime.
 	  Only useful for a restricted set of Ethernet protocols.
+
+config PHY_FSL_LYNX_10G
+	tristate
+	depends on COMMON_CLK
+	depends on ARCH_LAYERSCAPE || PPC || COMPILE_TEST
+	select REGMAP_MMIO
diff --git a/include/linux/phy/lynx-10g.h b/include/linux/phy/lynx-10g.h
new file mode 100644
index 000000000000..75d9353a867b
--- /dev/null
+++ b/include/linux/phy/lynx-10g.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
+ */
+
+#ifndef LYNX_10G
+#define LYNX_10G
+
+struct clk;
+struct device;
+struct regmap;
+
+int lynx_clks_init(struct device *dev, struct regmap *regmap,
+		   struct clk *plls[2], struct clk *ex_dlys[2]);
+
+#endif /* LYNX 10G */
-- 
2.35.1.1320.gc452695387.dirty

