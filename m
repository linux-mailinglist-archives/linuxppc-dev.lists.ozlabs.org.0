Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FC96ACDC9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 20:17:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVpHW1gbmz3f8g
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:17:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=VJTwDkzk;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=VJTwDkzk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7d00::32e; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=VJTwDkzk;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=VJTwDkzk;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05hn2032e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::32e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVpGW4gCpz3bXQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 06:16:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHfrKvIf6uhW+PIvN7eGwoBrowmdKIkqx5wJ0m5ZL2o=;
 b=VJTwDkzk0UwCeNUB9U1vfq9kLn2UP5Gr4TXAbLhjnW/6UMyyPguGV4qqFQw8S1qq01J9a9IDOfaj+LFDcx1iBuUtYFLelQ8aLmeB6z974KOHmm9R1GN1qbH3jDkL0M55vwzD+puDcSYgoAw6u0jp6pXbV1/XHR/xeOfF5ys6hmPLvfiShWxM+3XI0ymqM8tPL8xY+FXhoJ0oA3x6dCHHm6YOV045EZ6CmOioz20XT786Ja0/MehpS1kBtkMLVs3U8fVa1GzZUGFGSTtmbwIvFMBgSC7jBxFN/LlVO0TT5GAC5ZSdZJ/Mbl3dXr3TfA72cOw3a53EYbcoRplGNQGEvA==
Received: from AM6P192CA0072.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::49)
 by PA4PR03MB8224.eurprd03.prod.outlook.com (2603:10a6:102:26e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 19:16:13 +0000
Received: from AM6EUR05FT006.eop-eur05.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::9) by AM6P192CA0072.outlook.office365.com
 (2603:10a6:209:82::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28 via Frontend
 Transport; Mon, 6 Mar 2023 19:16:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 20.160.56.83)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Fail (protection.outlook.com: domain of seco.com does not
 designate 20.160.56.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.83; helo=inpost-eu.tmcas.trendmicro.com;
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.83) by
 AM6EUR05FT006.mail.protection.outlook.com (10.233.241.54) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.16 via Frontend Transport; Mon, 6 Mar 2023 19:16:13 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id EAAC82008026C;
	Mon,  6 Mar 2023 19:16:12 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [104.47.17.177])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 9D0D62008006F;
	Mon,  6 Mar 2023 19:15:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiK5d2GtXaSoZ07NB2xysc4rCsLG3ldOSU0BVo4jk5m9iUdGPswnxSUHejOAFAqpuUsdp0dTh7Rmbm/dFiwTodysfXTs6qMW9mifAUK5yxM4MnLmbbTvajpPE+WIQMvFM1SGmwWmfekz16PDZEBUO2ltPl2UFhfsKSDM3fSLBPKq/0HVoD2WE8+cLPewBqFPQ4rOFYId2+q9QSVt6urXlOEjsNEVbaUiH0dbX3dnqt7JkK93MJXlaze46ZImc0G3H61hk0UWBZPAizTP+tYVKU01hHMhXHmQpIHP5Q2K6euTPYCJsKTpaZl7KOnqlY85o/l/lKTxidgu4k23fMFlMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHfrKvIf6uhW+PIvN7eGwoBrowmdKIkqx5wJ0m5ZL2o=;
 b=P2cHHyiXGmCMuAhSyCcjtYqFSlCAwaIGVkIruXnzDfo5DIDgrjvuVc+zGnWQ4IDVBMkqi/urWONaH+WZVWYh9fjNONiAes+EuM42W/w2ZoNQqZNG+S+h7uc0iDI+wTJfwui13ycIwmiK8M0al+ODFa9vd/XVhy2bZSZOHRiJQjFXKRcdNEPX/NSMWhQR88V3BWBohwh0DTfTp77qjvBYkSTxPBd8VrV8vhqpGMwd2ODQtQrp3ziZ6V1axntAJoKsGhPTmB7tuLWPwHqzGkHHCkeHbcSYKXFvyHWt7/1yfYu6XrEJ4ct6oknr5XaHwAK/hOcnjM/W0TEItv4bdEOrSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHfrKvIf6uhW+PIvN7eGwoBrowmdKIkqx5wJ0m5ZL2o=;
 b=VJTwDkzk0UwCeNUB9U1vfq9kLn2UP5Gr4TXAbLhjnW/6UMyyPguGV4qqFQw8S1qq01J9a9IDOfaj+LFDcx1iBuUtYFLelQ8aLmeB6z974KOHmm9R1GN1qbH3jDkL0M55vwzD+puDcSYgoAw6u0jp6pXbV1/XHR/xeOfF5ys6hmPLvfiShWxM+3XI0ymqM8tPL8xY+FXhoJ0oA3x6dCHHm6YOV045EZ6CmOioz20XT786Ja0/MehpS1kBtkMLVs3U8fVa1GzZUGFGSTtmbwIvFMBgSC7jBxFN/LlVO0TT5GAC5ZSdZJ/Mbl3dXr3TfA72cOw3a53EYbcoRplGNQGEvA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB9511.eurprd03.prod.outlook.com (2603:10a6:20b:5a6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 19:16:03 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%5]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 19:16:03 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v10 05/13] dt-bindings: clock: Add ids for Lynx 10g PLLs
Date: Mon,  6 Mar 2023 14:15:27 -0500
Message-Id: <20230306191535.1917656-6-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230306191535.1917656-1-sean.anderson@seco.com>
References: <20230306191535.1917656-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:208:23b::20) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB9511:EE_|AM6EUR05FT006:EE_|PA4PR03MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a8c0b28-95e9-45e8-c3d6-08db1e774042
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  /kOnJjo4mIs7IotZ5j7wse/uABanvMLHKvVsLwWYLrjufQrxadeg+0rEkfePgxu3wAm9MVeUfHz7kh/m6f8xFYU0UwsH2o9UDDAojU1afFqusxz7xtfmrZxS1lZay8DNxujHH6ExYYwYGxL7XiqL4FexsdDpGt+vmIyolPZgJW9D6RTbraGWR6q1sMYNoifd0J9OkJvPZVnJWCvKj7sOO1Vt6kaNicAvv8K0RsZ5PXHeoJRXjr5too/RTNO5sfIlpyzweootMlqvutxkICo2RHMqJLD51gWfUpJ20/pkL8rFXmhVSrwHfubS1B/+vfrnZlrbPbLi7kD+61YqrvoXW7slQT9fbSDtHcJS5ZsA5bPYgV0gbO5HjaDSrf0OEuuzElPapNnfzFEgUx/d8w5vCNFzbQo+hdLMx+MBiRQvKg5KR5F73t9ip0jSJofDWRivrRSd7oF9MWHP2IACooE6K36iheyHygfYvamlA3IKd7UGAMMu02TfjwdnZgK+Nyt2Ml5RQvK2RHyYwsod9/yQ8rsHpokK/PG3joOksAxBrR2a54yXzxCqwtj+hHgFzUDzHZ9Pgj2M8KifaYDwPFpdLvJ6wyrPdj5rRsgMrg2/zmqYl9hZmAYcXIV1rZRDoA3grzE3GDgeG0kYEwS2fmuYoLutgaUBwE+I509sCogBeNKVWT2G5y0LTX7qXpP4SBNQwWu8G0oyjkii+cSFxYn3JA==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(39850400004)(396003)(136003)(366004)(451199018)(110136005)(54906003)(36756003)(316002)(83380400001)(86362001)(6486002)(6506007)(186003)(2906002)(5660300002)(66476007)(4326008)(8936002)(66946007)(41300700001)(8676002)(478600001)(44832011)(26005)(6512007)(1076003)(2616005)(7416002)(52116002)(66556008)(6666004)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9511
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT006.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	12d1f6bc-a45c-4cbd-4374-08db1e773a2a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	0FJDGNsiuKWewzLykns0u7jA0SqHv3AnaVrIstmylST4NNt4nyqdosH8731nCC5iGimInG5Hn42KpaGgY1O2jRNl7qvKYif1F0mbA9q8CfxM+DXusAgkBteD2J/0drfzdW4zturkdG+HSEBd6Kqp6oiafC3CjHvSyKUyQ5J8Vfrpp88GG3ZHdK2NFsMs+zO72Mj+87KM1EzHEryqZR2CzVwCYWlRHcOPrkK9h0QwsIr/Xu/p3F9Gn62vRNoDpXoygUfSidqCz5LXHYkDfLjdRFIpCM4uJPWcpzZOJhrMMUfDgB1XvlFDaB8KxAWzECJxHUPW5H4ZroORe0MYX0KsBfzhaJlp7N0CSG60X0fy2jIMEquNrwUpc8Deln2Qo4yq/6z/LH4WRCAgrN/PN8EESQPtbsVMs+2zb7sxXcZw7L2eyHEOWK1wRvrpLeunDvoYWWoRjSxqQdCzlU6ZLs1CEYvAsPv7nDWjtvVyXuYUlzi4SO61M8XWBwz6aKjHCD6rzRsesIqIpYCpGIsjEjpHUrqckVRUGDrdNst86cYVv9kEuA4dOee0/LQda5QZKd/Z/gR4bBtqIoy2I8mTXzDw1ONHq3FrlM6WLYKSHMbyjv2o102qqncynG8o2pyidbwWCnNe+sa/zJ77hmL74VGVM9oziOnUiHhNyliqx6RFMB9OZI2mXBDz/n6pLX5tmJUZz9VgssAOACL9yBPggeYzZvxinzPRBGJUoyMfyyl1oFYSf7ew1YdnNZyjxcgCxGn9e5FMNSR9RMPa5Q5MGZR76w==
X-Forefront-Antispam-Report: 	CIP:20.160.56.83;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(39850400004)(396003)(376002)(136003)(346002)(451199018)(5400799012)(46966006)(40470700004)(36840700001)(36860700001)(34020700004)(7636003)(356005)(86362001)(7596003)(82740400003)(36756003)(7416002)(2906002)(44832011)(5660300002)(4326008)(70586007)(70206006)(40480700001)(8936002)(8676002)(41300700001)(82310400005)(40460700003)(336012)(2616005)(186003)(26005)(47076005)(6506007)(6512007)(83380400001)(110136005)(478600001)(316002)(6666004)(6486002)(1076003)(54906003)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 19:16:13.0647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8c0b28-95e9-45e8-c3d6-08db1e774042
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.83];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT006.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8224
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
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

