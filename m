Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0FE58A315
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 00:08:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzNCr05Zdz3dxN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 08:08:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=cehiJk5Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.13.77; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=cehiJk5Z;
	dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130077.outbound.protection.outlook.com [40.107.13.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LzN9W0JkZz2xGN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Aug 2022 08:06:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnfT/h5JUogKPdd28Cl7qwMy06ZldHN3woXgg31zoglqZqJO1sLcjXAMEo7u/p8tZ1IftToN+2AQyaIsouCFgr7jkdhkNRjY3wsykda00Fvy14nDY+K96d3OrlJkDN0j4zo6CkQTQ9KXhn0AGNJyTQAl+79Ug6KmKZCvC36hL5purtIlylNXMrX4VH93n5FCr0lqhgMjVb4UvETLYjqE6kTUeazTG/0qV3VqtLNecNd3hn/fXvXZYe+Dojr047/MGQvUVCFhOia8iCdtw9Heq+yEN/qQ7SgBaJwXbJKg0nNTlVLKIhWC68ZOi1DLTQr8aFcZDVdoqJlYxidAC6xW+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVDgzB5raXAgwKW49ZsxS3eR4G0GW2MzQUvq2qu6i4k=;
 b=WT/d132lOelkdSCRCX8qrIDtIK7hn4G4rg69MstFfF+tSIqWl74uVzCMSGMCJ7+n7IxKkg2xlIwnWJzYSy6jLvX6ar+u2QPhrn0ymLG5IPncqTr5/jAWlV0A2E75pAmFFdbqcs1f4nekh3x2qaOsm0geHJx2zaIcZfz4o1z2gDpilZhmrLZ9VgJwPoywhbQnWiz/5ZeAXYwOyjKjIak0qa505jNavLMQ0WVCQdrnJG9SPD2O0orSeNcwBvtvLif0g2idLJzFs7W9pxO+uDGWxpTBJ1tKZonFZqtkDZv95PhvRvNw5DSQdc80SO2pl5n6PtIN9BvL0TJBbSCAaCUHvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVDgzB5raXAgwKW49ZsxS3eR4G0GW2MzQUvq2qu6i4k=;
 b=cehiJk5Z9CrK9wq+Ib/USbTSUo/SGVqboWgCwGNLPKmx/ULxQai/ut0tT+sAekqr0yX0PN2L0kn0ZH+cRNEnwrsg2TTu8+R/85WC0qxXjqtUyzGEqixABz3Kxj3/F3B+A9R5kdFWZAWEANZG39xQostOHOZ4n/WocO0Eqcj0v8ilWpwMd6FF36pOtQ0QXUTJNj2FYFdDJPonJhgo0/gSBqc3r0IeYJlKf0CnLDHrR0uXEEuYC2ry4Cl7YpOHGm7+E15XfmuwYENzAkmLTfqB25NVL7SXYi4YbT3x80YYQmKrseg3LqvDC9/2PDjq2DkbyD0RvjTmG+jbC2ybN7yZaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AS8PR03MB8419.eurprd03.prod.outlook.com (2603:10a6:20b:527::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Thu, 4 Aug
 2022 22:06:18 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 22:06:18 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 3/8] dt-bindings: clock: Add ids for Lynx 10g PLLs
Date: Thu,  4 Aug 2022 18:05:57 -0400
Message-Id: <20220804220602.477589-4-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20220804220602.477589-1-sean.anderson@seco.com>
References: <20220804220602.477589-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:208:32a::12) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f51a319-f5c6-4de2-a6d7-08da76658e39
X-MS-TrafficTypeDiagnostic: AS8PR03MB8419:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	SWDuujmEDubZ5D+aQTgPCPP08KOIEtVL4Y6mW2+QqI+HMSHELdwcKzpuEPWK6zEXT+YKK79AFl0OqvxuE3PbaYE/YnUhpb0NvbJLoz5M6fmPENyrosxhxdUAXDOsdXVKSOa2a6cwKfDvpjqUVPS8BMrs3eRDvvA5Xb/ofz33B5a8hCxuII7eLxpjsSkW6A5LKwE0BVk8hksh+MT/ilKfvHCE92oxkrcYNBY5hlK7DsGNNSCmSSiHG5vFyd7t9PEYRzIfFmIM4nWqEN3E27o8yddWWTIxcC4BNFxebDOrcEQ8hLLu30l6FWqe1P3uTvWEfz5vRDOlEs7aaSeHhy2smW9DMWd2hU1tQILORFpP+gy2m6q/e0baZ5QxIAJyf7BVKBXa8ESIuLGJ2feCOEYaCdg02EAQbGmOuHB0dWklzaz5S1jEYfS7LxghAEIBSi/ssEkS8OlXrFvMwqBD9f6t+zg75Jd1MtnbyDYjDU7K3ZIX1/oDan6a823frp5qdDSVvPHmUUS49KxYDklMOAYPqdGukMgtDNOmjwPzoTtj8u1lhPYh8H2trCsr2Fw3xdAMGRCfHKeLmtrgUufs/MtMGIbeuvd6RmpExkJPFOizXWqAJMzwaN5JjxgUI7fajCyVU+Rr5yLMdGKaYEhYEGEl5JUT/HoBMqjubXEJB2ZT/NkijO36tZbq8QYQVfzAEFUzl+TrNVVgt/hA2D52C0GTaFDWWY601SGu882jSy9aCgEfoaWJi6BTE/otzMEMo8ZFJ3YOh7Q3KFnCQKvlpbGCbKdGJph/6UlgG7aEW1FPOdvwkFrwr0OiCQPEJqyYi/1C
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(376002)(136003)(39850400004)(346002)(6486002)(36756003)(110136005)(5660300002)(316002)(66556008)(54906003)(66476007)(4326008)(8676002)(66946007)(38350700002)(1076003)(6512007)(86362001)(2616005)(478600001)(186003)(83380400001)(8936002)(6666004)(38100700002)(41300700001)(7416002)(44832011)(6506007)(52116002)(2906002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?rcJTG2FPDG8YxyeJDwMi4AsPsdaPvbhg7lidI9JkR76l7D1ND7fcXVV7+BMV?=
 =?us-ascii?Q?fM8wL2FEYRQXtnaZ/fOorAbrkdRSgxW6Vm0zju7nVtcs2z76bIQBopbL2HQy?=
 =?us-ascii?Q?ck+Gzhd9w8qBxiiCBIZO4BjpWG1OqlEncnu7GgIOvw3oxYGspbow2RivRGIY?=
 =?us-ascii?Q?XL1IL0LQN3DbBYS+xBq2/+mhW5iEiRPWQpTMIzinZ4hD+rSSZ9Lf6uXDUl6Z?=
 =?us-ascii?Q?4LNwNPwMiQO6QAagpVC+CwMRMkeST8i9tdYaiogvqE0L9yzRNd1u39hLP2Hj?=
 =?us-ascii?Q?WWnv7lyXkW3m8P1QUMd0ae1nE+/AEj/7gc8wSIk2STZWYTGNrVDNS8C+IFtY?=
 =?us-ascii?Q?6BK8iiNjGcBd84rnQAaETKji1zLLiI3Bii6fBihre6tCFmSiF1AwvZ8p+tun?=
 =?us-ascii?Q?Iwb/VipPccf0aeDbVG52L2EWwCVHx1Dm/FTR/7Hd9+CXuNGFLI26hIhRapW4?=
 =?us-ascii?Q?m3TQ+g6xYe2ePYHiH5gUsUfuR/1zEyO0BSVviannBzyqpkg+PDdud8O+z+BM?=
 =?us-ascii?Q?0XKomtYbygsBz+if0Zfmek+S4w+TgdAcYH+CfV7bgWK4l+LrFSj0XSS9y9+3?=
 =?us-ascii?Q?1D1oVIMh4+cKpq2fF3gQ3/v1wQLjsW1vp3jOqNirH4qB9J+wsfcuH26aDh3m?=
 =?us-ascii?Q?REGs7sWasqfkJpxT+aT+w1UoZbspWYGmp72Kz9wSs8edDd/YAPs0+9phqkbt?=
 =?us-ascii?Q?795mKMAJnOOoVTMWwwwW9o2cWOX9irdxhx0n5tWvyen75YUhFJUMJ1qldm4n?=
 =?us-ascii?Q?aK9PfXOx1Qy+sbpT11G3wJOu9467psWw+dY4PGA/+jyipTBGmgPX8If2THHg?=
 =?us-ascii?Q?h0Oy/nlC0DIo+hOGnQ/P+czx302yH/f4QnrwKjfSxPelJnX9MYGn37uRnzMT?=
 =?us-ascii?Q?n7zjrK+h8dqSJfXFRlaK8+KxRkdK7H6sSS+zb6SQp0l9Hp67LlQ2wppO9x48?=
 =?us-ascii?Q?DtrBoGmguk00E4CYKpMTXMBwYqP1Jy2By6QhnaF1MTkTTG1kqzjFmasbH7Oi?=
 =?us-ascii?Q?CUgizozZIrMX5yG1T9VOEB7MVNucMnm9DlUuzRqnPLpzTOvtDJldd4pL+Ayx?=
 =?us-ascii?Q?+7zstYp83tCQTCAvM9cMz5OTn0KR9hlotRx+KwG0kIg9RT7oTv3AJeAf1UYs?=
 =?us-ascii?Q?xvOT5gorK+MQLZr4+bOnTdSP97QG0WsJ/j84mJ31evn3o2I0LgvLV5KQzeY4?=
 =?us-ascii?Q?jG+D5lmGagUrRPLaDN6SZEbJRAS0c4FgUJyaZaP3pmDPtG8W1IpdcO/BRWO5?=
 =?us-ascii?Q?4tYD3n8PYnVf7/X6kKBmB8v31vOZO96ZFjq7IBFB1x5tOxgCR//lxvaW05zA?=
 =?us-ascii?Q?WmC3q+y60TnZm5QcMXz00UBpBElJn84ZMOlYgHXhFcXKn+Pqw6/SS2QC8zWl?=
 =?us-ascii?Q?k1m0zP4BeqlYnEnmAlsGaEI9K0EpMl19PGug0ABmFGhlZz+faLGAqvFjJa3m?=
 =?us-ascii?Q?535i9Ku/jiz8pDYP9cquETIyOKPZXhIxEcmJ55hKhMN5B5MM5Zt+1Ps/gsMZ?=
 =?us-ascii?Q?qVk/+/Y1tBvWmOtRbMMCtrXUsaZnJ1yHV5lVeAPovYez+j/UpYlqGlxzABbv?=
 =?us-ascii?Q?b8RGGl9SFlwQd++RGzUKKRnPo4N6AIL/cjpyWaY1lv9mSukUc01ZZ8xJJd2z?=
 =?us-ascii?Q?oA=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f51a319-f5c6-4de2-a6d7-08da76658e39
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 22:06:18.1263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YtZi6/A7+SoksShqs3A9pqNBwFs9CSPaOcKClsar7nce7CNsUryP8Qkt1r7A373FD7b2JuZiH8IFuqMdjRooBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8419
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
witn assigned-clock* to specify a particular frequency to use.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

Changes in v4:
- New

 include/dt-bindings/clock/fsl,lynx-10g.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h

diff --git a/include/dt-bindings/clock/fsl,lynx-10g.h b/include/dt-bindings/clock/fsl,lynx-10g.h
new file mode 100644
index 000000000000..f5b955658106
--- /dev/null
+++ b/include/dt-bindings/clock/fsl,lynx-10g.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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

