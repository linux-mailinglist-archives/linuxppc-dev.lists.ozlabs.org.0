Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D586D6DE444
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 20:47:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pwvwk5QWgz3cdk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 04:47:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=c5+gZ2s1;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=c5+gZ2s1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7eaf::30c; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=c5+gZ2s1;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=c5+gZ2s1;
	dkim-atps=neutral
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03hn2030c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaf::30c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pwvsr4vsvz3bjW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 04:45:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHfrKvIf6uhW+PIvN7eGwoBrowmdKIkqx5wJ0m5ZL2o=;
 b=c5+gZ2s1Urwk/vUo1PNLp+DSM8UKLyMfMUlUqG53kzY2jxyLHkFNTxISRSWHjYytAdtXLWGKEJCpcT1gQcimhrgfLGHX2R1JAXqpYtFfWkArtTcQ8daykbP3+RISQ9oTY7C+uunwGDzEFI7KpVzJB+Ocmdc+c3dXH2jfbIgPJ9DnLEkZ06TDxVS9DrjYe5udfIsnWPiwJETEOUy3Hu8CjzfOLTa4/BY+QSiDRp3t579g9m8SVdF0xa5Mgkdykt5TPLIeiEEA6a8oGg2q6N7qODtA+DXFjF83/z3V4/VJpSVWAWTtj5jlWxaoh67qyQo2WhM9/c94efa9LaF++3UrVg==
Received: from AS9PR05CA0067.eurprd05.prod.outlook.com (2603:10a6:20b:499::23)
 by AS8PR03MB6808.eurprd03.prod.outlook.com (2603:10a6:20b:29c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 18:44:59 +0000
Received: from AM6EUR05FT054.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:499:cafe::65) by AS9PR05CA0067.outlook.office365.com
 (2603:10a6:20b:499::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.40 via Frontend
 Transport; Tue, 11 Apr 2023 18:44:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.84)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.84 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.84; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.84) by
 AM6EUR05FT054.mail.protection.outlook.com (10.233.240.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 18:44:59 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 157122008026F;
	Tue, 11 Apr 2023 18:44:59 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (unknown [104.47.51.239])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 4769220080079;
	Tue, 11 Apr 2023 18:46:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNYpJ7fEKd0FuXr/rtU2bCcCkasQfF09SZZi5kRR/alJV/XBWyQu8+B6v3nVbOkSHMaHUqhbkumltl7sEzdF6oVos+CjHjdAIDPFpV9ad81MGuVJyCqnE2CXHgYmX6Dt+CIGrTVbp4KSd0OYVkfb5gBX4hf5FSdhTHfE8KCO3fj6oatPQCT0p319d4wzetCWomRbO0DuyyRkfqItK4jt6lRNqd8SC8wlESBEKhXybXnp5iq9YBB+HNkqjXgyFJlJwwN+HXBv+sFbjB3ZTv+hqAcYy3C/m/Exj8hplAwCxGQ2TxcJAgBMOvazV0PO3wpbLtuSm25Jmpt4KOFHfHXPHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHfrKvIf6uhW+PIvN7eGwoBrowmdKIkqx5wJ0m5ZL2o=;
 b=d0+f6z380xqbq2YbPl0K1TSen02ZvzIsWwdRmde9FIohXBrkV94H/DDBJ0tjRVVgpROFlIfPuBkA5FJayWvZrLDQcfIbTsE5KIF1X1c2QoSdZlzxHgt4mb5Yy/9rdUbvN5eVkBFE3lI2MKgopFQsIc+3qJ2ElpqzJ1a9Qa/B6WTdcAycnTqV5piQMqjsBf2lq1rMf8y5jC57f8MUIeyAlcTrOxD8ab25MVDIlSfNkEdNHOVUpUna4s62kK0ZH38U4VDaJoO3V77v6kZTaabK7rf+BFqYnnRG0c27dyjTQIk7iHC3572LaKLNsYm3tH4/ohx57Xl32JOgNFIAtUi23A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHfrKvIf6uhW+PIvN7eGwoBrowmdKIkqx5wJ0m5ZL2o=;
 b=c5+gZ2s1Urwk/vUo1PNLp+DSM8UKLyMfMUlUqG53kzY2jxyLHkFNTxISRSWHjYytAdtXLWGKEJCpcT1gQcimhrgfLGHX2R1JAXqpYtFfWkArtTcQ8daykbP3+RISQ9oTY7C+uunwGDzEFI7KpVzJB+Ocmdc+c3dXH2jfbIgPJ9DnLEkZ06TDxVS9DrjYe5udfIsnWPiwJETEOUy3Hu8CjzfOLTa4/BY+QSiDRp3t579g9m8SVdF0xa5Mgkdykt5TPLIeiEEA6a8oGg2q6N7qODtA+DXFjF83/z3V4/VJpSVWAWTtj5jlWxaoh67qyQo2WhM9/c94efa9LaF++3UrVg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB4PR03MB9433.eurprd03.prod.outlook.com (2603:10a6:10:3fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 18:44:48 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6277.035; Tue, 11 Apr 2023
 18:44:48 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v13 05/15] dt-bindings: clock: Add ids for Lynx 10g PLLs
Date: Tue, 11 Apr 2023 14:43:02 -0400
Message-Id: <20230411184313.3679145-6-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230411184313.3679145-1-sean.anderson@seco.com>
References: <20230411184313.3679145-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0350.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::25) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DB4PR03MB9433:EE_|AM6EUR05FT054:EE_|AS8PR03MB6808:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a6083c8-6f31-448c-f384-08db3abcda68
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  AI2bUyQKPhdiBlSiVu4jCtSJDlizkwtWgEX7UYMw6AOY1LHTYGdpSvuQS6BfcT5cMDj/PUC6JN9PUGPvlmzHzmIveUhm1kLqkkH4DAIupNoxtKLYRmxBq1CwrNMVfveI8tB4ob7Gd8jMfLgS+8jpG4ksKfBWxvq9gUSomCW3R0X7nWWXsv5lufty9w/acHA90GCnmaN2T7WB0armo1L2+wgb3mbrmB3YSiOMrlTUi2t2MR/2bX43ryCrnYjgxGzQXjwoNoMBMNN4ey3CBiUihz0emGokfcwZ6GBBxjqwX1sDeuBRwBYkuHIhsdf1Ebvz9FxMiqTfRV6DpNp2VHqJMCLlCz/fwoH0zhDFL+BXzTi20tF/IHHaFHJiOWVkbFXarsMqiwke6Dj2ZcvvonelLIsE3uDrXxcaGb+LJJs3uZYDh7T4E/s72rGk26g2mDMtrrZUzDrX3tbyAIzni+/Ck5qzpMOhcsrdYOHROy84To4UI5CKkycKDjH1lkvUBQNBIkDriXdAbEaiOt59VHNAfpSucq+SvbsKHMY6xBIGgumdxsBYSPIYVqagYFeIwQ9Kh5dHAmpSzvLQ47g0tUWbV/nTy46e6ecvNUUdHdwLuNIxg+tPEeo3OX8oBbyv9mbS
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39850400004)(396003)(136003)(376002)(346002)(451199021)(316002)(110136005)(38350700002)(38100700002)(54906003)(66556008)(66476007)(8676002)(66946007)(4326008)(86362001)(478600001)(186003)(2616005)(26005)(41300700001)(36756003)(6506007)(1076003)(6512007)(2906002)(83380400001)(44832011)(8936002)(6666004)(52116002)(5660300002)(7416002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9433
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT054.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	ad75789b-b6fb-4082-3fba-08db3abcd392
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xBL3kV/t3tAp92LZRIZTSrbxa5X0lbiBmwKODMo6X097CyrehPBnM/sjHBcPJXqZCiCfNwTkupzoFEej8ggK5yqZqoDyK2tYkFk75BC8C3mGg1Jik/7t6dAPmy+1uu9Oqn/ryLXpmHhq0uC6CoYQIdDyB0MsZ17gFsF86UA5mqYMkVHMfHomz/sohnP6GrnNTFmBv999B8sflkcc0n2632n8WUX0MZ9k0x8UKfBSVlH+Qsg+F1kU0PiFZrnYI3unJyiSwyWjJc3SGgLztcf90SKmG3GAT4kqW+EdtINucgHXbynvuuljrc/HD4JOu3eEsbORG6Y1PNL9C3x3Q9Q7vb8APopIG/TJbZdAi41pQc6AxK32JA30q2tu88d7j5hbiLs1IuYPaMEHiX0gY0Vpg65m7R1pFCKxwdQMT1yxEliXJAgEoQBztKJWVQDC0p1q5Exe4CvzSH90Qh+asHClO948IEg1sl741nThSiKrrPXAomdouFwOxXl2uWFnAEPgNfliHaOXimxK1jsEA6RNnx3GRZhFnFlQAwoJxCkcEhfMKA9BiBgK4WXxcH7EhdUr4DOlarirLcv1DLk9ZEv4NcErIagHbiUc52MQcBkSlXhhijzzvLJfXBPSUZt//lrhM8wDoLL4x/KJK9mxW6zyNtHXar+2ZfXAorLJNNtYvkvuQWkUdgdxaImfWNDJtR0XW4Z+/NIyv5oTctsDjuL1ay185ACA483eNqdoZKsIWYeKoQEKKQzgzVvlqhrgHEWnn6SrbOfXFmnMGXAYCgtrhw==
X-Forefront-Antispam-Report: 	CIP:20.160.56.84;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(136003)(346002)(376002)(396003)(39850400004)(451199021)(5400799015)(40470700004)(46966006)(36840700001)(6486002)(356005)(7596003)(7636003)(82740400003)(36756003)(47076005)(336012)(83380400001)(186003)(40480700001)(2616005)(36860700001)(1076003)(6512007)(6506007)(26005)(34070700002)(6666004)(40460700003)(44832011)(4326008)(8676002)(70586007)(70206006)(2906002)(54906003)(110136005)(82310400005)(41300700001)(316002)(8936002)(86362001)(5660300002)(7416002)(478600001)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 18:44:59.5162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a6083c8-6f31-448c-f384-08db3abcda68
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.84];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT054.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6808
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

