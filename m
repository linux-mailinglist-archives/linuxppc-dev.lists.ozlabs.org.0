Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 906A66E11CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 18:08:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py4J93fH5z3fWc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 02:08:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=2CH//UUB;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=2CH//UUB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0c::324; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=2CH//UUB;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=2CH//UUB;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04hn0324.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::324])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py4GL3N9Mz3c7s
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 02:07:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV4YSLSWUEa6icuS3ElbSt+yZKjwyRoBMk3Gdh1j9EM=;
 b=2CH//UUBiMJ6jNJs2fmYAxQuiso9y3L+oPbyOEjbjpo4gO6bGRYHGVUiieckadrE8NxI00HCLjXJ78MgNJBosairfrlpzUWsF5b2ztGIOkKcEw61cp1XwBxzpmoojzKuO6YishmmnviiAZdLbAyYLBf7UjSY2z2FPZo+3GoKjKAtI+qQlSa6liN9RxELffqfJ5ZDhgwXW0W4Kz+vCd9SYmavJ7Uya7oWh9pEH/TFRt8dYsZuHMLUVsY6+xtijPQ7qRZofq+zMjyHI7T4tZvjQIQv4PVkVSwld1jZ5PObQsIIazPLcs+zzZHlN1smdA6sEuQvfFEUYLxGerP+mqK42w==
Received: from DB8PR03CA0022.eurprd03.prod.outlook.com (2603:10a6:10:be::35)
 by DB4PR03MB9505.eurprd03.prod.outlook.com (2603:10a6:10:3f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Thu, 13 Apr
 2023 16:06:47 +0000
Received: from DB8EUR05FT067.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::1d) by DB8PR03CA0022.outlook.office365.com
 (2603:10a6:10:be::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.31 via Frontend
 Transport; Thu, 13 Apr 2023 16:06:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.86)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.86 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.86; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.86) by
 DB8EUR05FT067.mail.protection.outlook.com (10.233.238.176) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 16:06:46 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id AC24E2008026E;
	Thu, 13 Apr 2023 16:06:46 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [104.47.18.109])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 7000820080073;
	Thu, 13 Apr 2023 16:07:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCqt876Doq84kzg0J+tTvMfPZwc1z+DLmBobonN+Pc94u3UY01fxvkCWmOW9UtBjxWSn0ZnoiW1XTtpmov0brDouVd/Mhs4S7cNO8pafFT7q4oygle5SkkJsyG9kdQcJb0MZt2dmaQ/q3J3sL6Cb+eObzMqQ4dV4zvWw8Wig9zIIMK5TACSBUijJBeNlQ50l4ys9mh61mQna0zekEcW+dl9W+BarWvu/c/CW23ll/UgEgk8K0EJqfkCEZRi5kaGedFBGWFKmE+DSDysKooQiMQIOOsA+BN19+oiaZfmwDSqhnryA6D1bAXgyaPM8beibc2NVCAZS8xjSoc/uxp07qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AV4YSLSWUEa6icuS3ElbSt+yZKjwyRoBMk3Gdh1j9EM=;
 b=hNfRcAy3PtmsKFUrAUJm2zUw/Bs6RW2C7W4wjjf6YMHY7inbsm0tmldk4erYb8tICN7pHMZw6KsIlRkSgSR5PE5f+2Qj0PUyud21TYqzQU0Y6v3KYC8vvqDaP3XlQjUH6uidhgh0bmoCFEgC/H/jW6e91TNwSbFcYmmjKEn69kzpEZimGrLoBgKP0oUwG+7DjLIYBzzKQUq0t/rH9POArdkGGzsrUAwVaz6r5Ej9mC0KVlCUFoPqvumLDFfiEDEp7SX6NrSOTKxYmLDFUWpWNr1d6GfVpRh5O51j7jqi+s14+q/gCM94y5Ao/b7SGwmHGQ+Wg9v0uoWK2wBZ96R9ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV4YSLSWUEa6icuS3ElbSt+yZKjwyRoBMk3Gdh1j9EM=;
 b=2CH//UUBiMJ6jNJs2fmYAxQuiso9y3L+oPbyOEjbjpo4gO6bGRYHGVUiieckadrE8NxI00HCLjXJ78MgNJBosairfrlpzUWsF5b2ztGIOkKcEw61cp1XwBxzpmoojzKuO6YishmmnviiAZdLbAyYLBf7UjSY2z2FPZo+3GoKjKAtI+qQlSa6liN9RxELffqfJ5ZDhgwXW0W4Kz+vCd9SYmavJ7Uya7oWh9pEH/TFRt8dYsZuHMLUVsY6+xtijPQ7qRZofq+zMjyHI7T4tZvjQIQv4PVkVSwld1jZ5PObQsIIazPLcs+zzZHlN1smdA6sEuQvfFEUYLxGerP+mqK42w==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS2PR03MB9369.eurprd03.prod.outlook.com (2603:10a6:20b:57b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Thu, 13 Apr
 2023 16:06:35 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 16:06:35 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v14 01/15] dt-bindings: phy: Add 2500BASE-X and 10GBASE-R
Date: Thu, 13 Apr 2023 12:05:53 -0400
Message-Id: <20230413160607.4128315-2-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230413160607.4128315-1-sean.anderson@seco.com>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::33) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS2PR03MB9369:EE_|DB8EUR05FT067:EE_|DB4PR03MB9505:EE_
X-MS-Office365-Filtering-Correlation-Id: 95b21b17-12fa-435a-b371-08db3c391541
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  uznfmbuog7bnkcw91lEg7GBn/rUo5R1Z3QSnSrKII/URV1TePZGRwhRA486/lJRuSiPgmmMgbOCV6evOWe6CJMsFspsfWwXYn0zhTMG7I3fbRCZ74BnGnRrQ8QjaAGMxfIqM/CWP8c/C67JDtQCRaZ9rABTgZHiywe6fMcc1shnz0Xj8bkelwwBXi+1fkWRwJRqdHJ4Fq+t+aTtBRMTqpaZKASYEqMxKKBTli0O18srrOGKzgbYDim8Sr/hzu/Ro4V4a2t3ZbtSI4ePPTnu+IL0f6whTgDlyHAJAwNO/xlwGXWeoR4kXnDOKHRbztAsCT5fvDa6s2GJ70LMbTbdsnHsDHSiUodB7O7anbDN6UAq75UW9wTfz8W/KvMEOwNXjCf9bqLTw2eXsYUrrsGqKS1YF14cYs4INStmWsvyhCKOgP0hCj8LNYcUPPX+MAdkq0bD0HNLWrzg+RWiHxF0EES0A24ZkjZkaLe8x9TWxqf8AcfNxHB0qRRFWa+oGrj8MbIlZVAa0OPjY+vsBh/TVnol5zrIoGQJgwEXvPQm/CaywpMVdXN46ZlovnK5/yPfQxCvpNUkF5Yx7fSlu3luAN83uuphijQH+WwvC9wONgNI=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(39850400004)(396003)(136003)(451199021)(478600001)(52116002)(6512007)(83380400001)(36756003)(38350700002)(2616005)(86362001)(38100700002)(966005)(2906002)(316002)(6506007)(26005)(110136005)(186003)(1076003)(54906003)(5660300002)(44832011)(66946007)(6486002)(66476007)(6666004)(8936002)(41300700001)(66556008)(7416002)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9369
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT067.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	01d280c2-bddb-4f1d-05ac-08db3c390e11
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	1BAJOoDfZCPrZBPz8IR+H3Qo669bAcglUSVngZoC6LYn2yvnP2nqef+lriBx78CnyCzAIjOjeJpTJFIsc+aYn73/+zW3rz29bN4f9AWs0z988HoSiojFNupI3FqKGu8PPs0sXm/DpDVklQP1whhQRwqufkSpTvNpRZoc+36TQVbmhcREW74GdHKjC19lQVCaeTH9HLoFujtGKpDeLYjPjFWjoLhZKVQro++WEhwqRXanUnijbbPsuqDdZAQZj0GLSEkZzuJYLY5qrL//mPTqJJOa8gcwfCWnX1b4bP0zx2JJrYdPNku96g6/myjHxx+e5xWsg+dcplB8d7OLYlAveV/RJ89Pt8nkRWhq5WJzyHyhQVYj2QaHldf26EjYRu0WzkPp3ZT1bCw8IPI9Uf5sUppbdHBuMj2QYsgtlppCHLLikiZD6kM52aWZnK11dpxGOm4UcPJucrs8GNnirERHFL1iY8O88MXGdB7eGJB3hwtEovBcuqOlkA9bGznjnz0cb6rwLx4bOYdwVNpTMHlLXQgxQs/5U/t2dDY5a3/wQ7tXv1z0xW/XspzDAvwwohSlnYHieBZg/HlPjY0LDK6x02QnZBxuCFICpntBOqxFSTQl1VJenOMIgek19rphI5V97VTSLjVND+AwgncTBOq4jPphoM5/ZXwIFG+2t9r0ndoeQpMEKDPPAh+WziK7Ba89vOCu/HVxN+9P6X4pbriLYuQV4Au9FLSfLrqCy8lNrEw=
X-Forefront-Antispam-Report: 	CIP:20.160.56.86;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(39850400004)(136003)(346002)(396003)(376002)(5400799015)(451199021)(36840700001)(46966006)(478600001)(47076005)(36756003)(83380400001)(7596003)(356005)(82740400003)(7636003)(86362001)(336012)(2616005)(34070700002)(36860700001)(40480700001)(44832011)(2906002)(966005)(316002)(26005)(5660300002)(6512007)(1076003)(110136005)(6506007)(186003)(6486002)(82310400005)(7416002)(41300700001)(8676002)(8936002)(6666004)(70586007)(4326008)(54906003)(70206006)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:06:46.9549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95b21b17-12fa-435a-b371-08db3c391541
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.86];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT067.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9505
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds some modes necessary for Lynx 10G support. 2500BASE-X, also
known as 2.5G SGMII, is 1000BASE-X/SGMII overclocked to 3.125 GHz, with
autonegotiation disabled. 10GBASE-R, also known as XFI, is the protocol
spoken between the PMA and PMD ethernet layers for 10GBASE-T and
10GBASE-S/L/E. It is typically used to communicate directly with SFP+
modules, or with 10GBASE-T phys.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Acked-by: Rob Herring <robh@kernel.org>
---
PR increasing phy-type maximum [1].

If this commit could be applied sooner rather than later, I'd appreciate
it. This should help avoid another respin if someone else adds another
phy type.

[1] https://github.com/devicetree-org/dt-schema/pull/85

(no changes since v6)

Changes in v6:
- Bump PHY_TYPE_2500BASEX to 13, since PHY_TYPE_USXGMII was added in the
  meantime

Changes in v4:
- New

 include/dt-bindings/phy/phy.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 6b901b342348..5b2b674d8d25 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -23,5 +23,7 @@
 #define PHY_TYPE_DPHY		10
 #define PHY_TYPE_CPHY		11
 #define PHY_TYPE_USXGMII	12
+#define PHY_TYPE_2500BASEX	13
+#define PHY_TYPE_10GBASER	14
 
 #endif /* _DT_BINDINGS_PHY */
-- 
2.35.1.1320.gc452695387.dirty

