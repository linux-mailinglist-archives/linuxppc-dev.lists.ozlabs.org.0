Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A665ABA3A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 23:40:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MKBCR1ClCz3cXf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 07:40:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=ReG+oz3+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.66; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=ReG+oz3+;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MKB952Sq8z2xt3
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 07:38:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2uKMojwthWLiVNexi9PbAtDZtWsE0tp9PfxoaB/gnkg/6rAG9Qo1BkwkkPmtovnGSpu/haHA31vAM/unfH6XoPOk7oe99n6LZUkcFiTCvirc795znCd7O6kE2Jd4js/p/6BFf6MpZWV/6c321qMottGXyMXLrfTuQmPGNby281D28KEqaPMFAtc80DNn74/YEUWtMakTe+y5IZ7S+4NtUdxHPUtjQTUpZXw/0/R0AMeMBHnELfra3/RfCoKAZ8IvD+R/e8rNUMWFzge7M6kDon5eurDk9auJyVwkthN3vwahqUwgCGSlr2S6eX1fhjc5q9zCpgtBgHi3FUKHHLZ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74PJJadOkcapx2FyfPF+qbVP3E86A3MgUbMckqFuy00=;
 b=PQD+Ml8tABBvoYSQsdlSy8vthtA+KFMC4zP/0uzYqjd+KbTQ+kORqx6Dt/MENm3xxAEjnrjW0C+Qv/vnDXN/VFsAblMhsqlC++ne9oyQkY1MJp4rb+DKJiHjOJfEEPMaUwj1pkKVT5Zc9+ZZq5pGZTWy6wXTAmi74l16vtEYgGtaC7PsnUDMh/xuPaQD+m1MZuTai/n8qkic8wOHXTxQdvGpjfGQR5BxpVPK19PMpQ80Xc89zxedcd3wKnr7Pcm5VW/WvFJjW5Y3qCLatEgUUj3B0v+kNNl2RS6kIiYLlpMe0A3RcBje0hYOe19T4ke7gaJp30hm0Zq07WUGxoUxVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74PJJadOkcapx2FyfPF+qbVP3E86A3MgUbMckqFuy00=;
 b=ReG+oz3+N7PqMybyJwfMYmMuPmhuF5zN3GE0VS1AQfT9VP/OE6Uajco0AMsW3PyryYMeNmkdqcHmCYZfBueiJeZdj/sGipE9IqAlh7icVAJcoqtko0x9SbDbW+dGk7JTrvLmFJD894TL/1LBz3O+HVEdMMrrBSkXy8QA8Z+J6xB3W7IjLfRy4qHDlzUkI3XyRsHcjUlnWAhpLHcdwh8UjS14Xbs+4ijF0ZksAIGRBALJcPH6ifw4f8M+hu+Hq04pUINAujOUvb1lFbK9oDgEsv9RqVGGvOcwY+FOaAW/7YgPmqxejuP1xHIQEN4ukeiEJ6+21/Nw/LFiALUz7Qkh5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by PAXPR03MB7886.eurprd03.prod.outlook.com (2603:10a6:102:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Fri, 2 Sep
 2022 21:37:43 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5566.019; Fri, 2 Sep 2022
 21:37:43 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v5 3/8] dt-bindings: clock: Add ids for Lynx 10g PLLs
Date: Fri,  2 Sep 2022 17:37:16 -0400
Message-Id: <20220902213721.946138-4-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20220902213721.946138-1-sean.anderson@seco.com>
References: <20220902213721.946138-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:208:239::13) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0434ecc-5fb5-45b5-fe71-08da8d2b5e56
X-MS-TrafficTypeDiagnostic: PAXPR03MB7886:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	8K4ujApXunIGLAQsJi2nw8lQpaIkdC32awCUeXlHqflG08XJQlc7UvzJoXTM5Ou4SoUf5jD1CUom04Gh1KtxiCilDqIlxOIQSCKzkkMT+HnZSpShCqzfsJfzq58zAhAh1QGNYcPmt/PPtLgD3+zH9BiNS1fEx3XvAuu1dtrLbsFz2x/Gxr0IPS9yT+3N75neAwB3Ww1R92VbwVsIrRqPktBkZVIDa1G4JnOzAbTKVHoWIZ5iVwx/4lZvS5KMZgoAIa+8yWLCGDZ7YQicyc2SpwicxEfC8Td6gnRAx8j+NK2IdxaPsE73gtGBxsEIjCHPZhdJ9g3fhfe0dm2EJzOJ/GYvzr1iuotZ+UNfEedXkwKwR/3hX1Xbzs4b33UXGmgl9koc7wLCUak9B1DM7sY9B26FL5Krvb/wgpKweGMFlUlEQ1cnDUWh/Vc+9/m930gJvkvdhkqU1C9brcZfXzqgUlKWjQ2OAs7aAgP72VboRST/HHlpqwv5fdNxzSUr3XS14e20PAHrgs0CANAoRDToKK1Is7GTgxBIm4+Fx8Fgapdx0+Q+gI/pW68kIoWnBjk/pUeMI5Ob+S0HORRlEn4Ad9aOxu36fvVr5cLW5tJ83w28JH+YfBRBYXQS7obK6rLX+Z5YKjMpsG4QrGPEpWFYI8E8V7HMvrqtUaOGm/Lfz/Pt7nFWZzxCUv7dQh0NoIcGrZrsdzYcZio0t5Qu+cntzAli02DvEELaQ8TJrIFyPd1qOHed2rcvbBsAgUdDCUTtDg+1I0gJqtItbjj4uyca6g==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(366004)(376002)(39850400004)(110136005)(54906003)(38100700002)(316002)(36756003)(186003)(1076003)(38350700002)(2616005)(86362001)(6486002)(8676002)(4326008)(66946007)(66556008)(83380400001)(66476007)(2906002)(52116002)(6506007)(6512007)(26005)(8936002)(5660300002)(478600001)(6666004)(7416002)(41300700001)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?tOPhNQ/MXLkpWKvkfmqNwYcbVIvMm4DCLMAeI+tOGnS2p0yVu2JVdtwPosxN?=
 =?us-ascii?Q?q9c2RR+67qufkB23tW7JBVWGHiDYz3nSDB2PIIf5SzRgQvFGuxFyP5wnIUIL?=
 =?us-ascii?Q?HRE1NRxa1752dWdsuotSpBU8ZSqsfJI6mYmdSz0W/C3pG59ZkfUsp+NOvO7L?=
 =?us-ascii?Q?DKVqi2JS8Gcp4A0iVpIF3nflmsOvTCXA712mWko3WHUqDgnR+fe9kbE3KxJD?=
 =?us-ascii?Q?f9UCs4Iafez80kgWPFR3ZCqhg600YyHwc3EXrvTyzUismCdZ/lfg1Robes6R?=
 =?us-ascii?Q?y4+lHxfX5DCk6whmEWEs+XZ4qoIAqXsiSjUc4+GnNj+rW/f84ctP9mmYIC7K?=
 =?us-ascii?Q?UVqn3amAdfQr3HwjmZnO9RvU8M/tHGlwW8kIUQBaidmVmQaluiKOvC46zlCy?=
 =?us-ascii?Q?Iq5CO5IIkk338hSrg6rCZwAuzQ8JMjCFn786CKBHfa3yBEeWBy3QUuLLW2mI?=
 =?us-ascii?Q?YTNOJS3VvcR5yPW8bKy5eDuO/dLs1OqRVDHvFo3hBTBHY3WF3R7xM2CkfBJA?=
 =?us-ascii?Q?f8jsTRXvLqdnc97VduMAjqJS9Fv1YwKJxxTJYlCzhpJeYBH9/pSRTDkjBBiW?=
 =?us-ascii?Q?AxpQwr2aNC29Wb9NvGYVHv/0KlH4CtiHuOXv+c1JESpf1dyhqUv6L8/bRTM9?=
 =?us-ascii?Q?7vee5FCbssIpje1zE5XnigWPtXDSLizCOHYMpLs+v+rym8lArAjoaPgfT8xP?=
 =?us-ascii?Q?E0jF+3MB0V+I8ZXS7MHPrS87fWC7fGuDUCLAxO+7AuffACgg8g06qyW+7dlD?=
 =?us-ascii?Q?zFhOUarEQjZey0rze+KhFAXky7/a5/Z5Pfk+B898vEmjWs8vN0UXrxvEkDjN?=
 =?us-ascii?Q?UfWv/D7gcuKZ9kIu/p+hjLwSGcaHn1/E1MB7qU2clvX14LmtP22g0utVq4hL?=
 =?us-ascii?Q?RfQoaIX13ZQSiVZkRl6gqOzO4JnQrW5jtLBOVj0HDDM0owlxGxPcZAA2+ewe?=
 =?us-ascii?Q?NlBBI4l0O8oR5t3apzag+BKHnwiT1XZRZcOjGVlD0OgEDn0nqmX3UF4NrWML?=
 =?us-ascii?Q?CDPulgZrjTceC+MSxcZ+xhDbLiWl3aTTKGkaf3Jt5HphcoutBsi/ch5HjcKE?=
 =?us-ascii?Q?SVTwMIMRgUClNfv/L9cQrg0mKevCNZzgQtz+R+rUTTJh3YHzFcPHPHEqToH0?=
 =?us-ascii?Q?K3BBJQ4SPvqJv7H5P0/euFGWTHkvzoGFJBBAX3HtNv7wVP1jbfyZq5nLTRbT?=
 =?us-ascii?Q?QStWV8T7yq3HW+5tR4JuLKTUHN7Rcr49UOehpnM0fV/aHJRhAOf1b5XgKs44?=
 =?us-ascii?Q?4WmuMbpIO6PRDii91Z8c4hIsEI0sSP7UHzRznmfQyanj/wnO+0sqFod08rT3?=
 =?us-ascii?Q?g3AQ+kr0wwDKY6C15wRJnUcVsFq4oj2TXokoF6i1GJySxbQU+BOIcBTVXEVu?=
 =?us-ascii?Q?aLHIMEtG/hKbIRbMLvl9ARQJG75/eCcODsOQFBw3jByxEFLEhbZtRTrFa6DW?=
 =?us-ascii?Q?RpF+8NrxVQ/2STTwwwP22f5Cw4PnkKmSbFx2UBoi6Ewuw+4FfyviMe2FtvOd?=
 =?us-ascii?Q?rqUmUlx+A/poXX6hMpCU3GXHRqyN7tYLHsPMmSMLy4I8qkXNgVE13sqCsIkq?=
 =?us-ascii?Q?n/59ANmlO8akRbiDKU5Ue97vVsOvmw7fOBQhTYQ8NLjDDxCgyhLJoWLkvM8F?=
 =?us-ascii?Q?5A=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0434ecc-5fb5-45b5-fe71-08da8d2b5e56
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 21:37:43.4091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KejGZdjcSPoh5PMX/CR8bDmonbq1K3cxq+r88MuUSopq2lqaieA/ggfrQEzQY6KI69c8lr6UBDZdYOnw+8k+RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7886
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds ids for the Lynx 10g SerDes's internal PLLs. These may be used
with assigned-clock* to specify a particular frequency to use. For
example, to set the second PLL (at offset 0x20)'s frequency, use
LYNX10G_PLLa(1). These are for use only in the device tree, and are not
otherwise used by the driver.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

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

