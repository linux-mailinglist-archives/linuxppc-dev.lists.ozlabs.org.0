Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A636DE445
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 20:48:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pwvxh5kjlz3fK3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 04:48:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=UyIX6pJi;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=UyIX6pJi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7d00::313; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=UyIX6pJi;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=UyIX6pJi;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05hn20313.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::313])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pwvss2vSWz3bjb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 04:45:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV4YSLSWUEa6icuS3ElbSt+yZKjwyRoBMk3Gdh1j9EM=;
 b=UyIX6pJiZh8o45rNwcMPn0gvUv1prMY4Hwl/+Bia6hD1gkyAUhFrf63KTY8wwy4bssipNgXmF2CdwXYUu+KEka/3EY2R2m63cbAf3nmljKENShur/BFWMFxEPZMFIOcxb9ei4+M33pPm3K26KhzyjqVj4fjbjIkWwA/rVxrbTerolBi7kQ3l6hBRmiMCFkB9bTwZRE9ULPuqHc6tDqp84Nx1ZULznCg9R8n6sFBbcSKeGV9yxgUzhVWLT/uPnnz4man49GN8II3IfAW8FcrE9vp2E++OpxqEJf2BbjyJdfcHBaOecEFzeOwBqn4XiNzjSLtLpNxHBRr35fOAIBR5zQ==
Received: from ZR0P278CA0001.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::11)
 by AS1PR03MB8216.eurprd03.prod.outlook.com (2603:10a6:20b:470::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 18:45:03 +0000
Received: from VI1EUR05FT019.eop-eur05.prod.protection.outlook.com
 (2603:10a6:910:16:cafe::1c) by ZR0P278CA0001.outlook.office365.com
 (2603:10a6:910:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.40 via Frontend
 Transport; Tue, 11 Apr 2023 18:45:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.87)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.87; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.87) by
 VI1EUR05FT019.mail.protection.outlook.com (10.233.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.29 via Frontend Transport; Tue, 11 Apr 2023 18:45:02 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 17A602008026F;
	Tue, 11 Apr 2023 18:45:02 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (unknown [104.47.51.239])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 6261620080074;
	Tue, 11 Apr 2023 18:46:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEZWmeStjPNanqYVjxrCWYiYZQIxiQLByU6gI6eL+tGD2CjMyvln9cgPTIo3u1rK3VAZu47bX2jdRwzd4bB5eIQK3KNFrdRyhH2erQW625U2jjxwzjeXbG8JfvJ6hw7S0LBQhuhiRTg4I6CvEdO8UiO66YWLPxeUR/sErJScTdDqRI/LIGhRhziNCRKZMAlEw34138bpY3uVG/pRzHFNKqG8M/kgHLViPNjS9vfsxpWtmoPDYQJw1cYSwMGl04D2yXdbeeMFoK+y6SPjUfENm8olF/qeFZ3YmwyHi34M+TD62lQYldEU37IUwS/pVlLBMVszNWRvKe8/cvnQz7q4kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AV4YSLSWUEa6icuS3ElbSt+yZKjwyRoBMk3Gdh1j9EM=;
 b=FoLeLEmA2ldDubPDd+VqitJuK6CgFRgDw+HajeFGtvlswihX6ccYMHgFg881Bg1K+mcgbMNIxdC2yVgK6z+49PPrWgRqLfmm037u8abD+7PMzd2LD2WhNWIzfBCaYUD7SGCeX/n/v4FULFHt8bAAJyCFKOPy+Lq7irr7p9zx7WuE16aY5wEyfuJMCszM9/xYWymjJQ0NmbxTzy4S5i7Gfnbf336xdwugyvGKCajUDC7PfO9RUuetqrNlkVZ942x+etXXNzvane/N5DjEi6FBdDH6xLB5CWoOvl1ZzjEBUcy8KgJQkSAxKUNy9P5js61ZNr5kNFkS1XZXjvlFY3nQiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV4YSLSWUEa6icuS3ElbSt+yZKjwyRoBMk3Gdh1j9EM=;
 b=UyIX6pJiZh8o45rNwcMPn0gvUv1prMY4Hwl/+Bia6hD1gkyAUhFrf63KTY8wwy4bssipNgXmF2CdwXYUu+KEka/3EY2R2m63cbAf3nmljKENShur/BFWMFxEPZMFIOcxb9ei4+M33pPm3K26KhzyjqVj4fjbjIkWwA/rVxrbTerolBi7kQ3l6hBRmiMCFkB9bTwZRE9ULPuqHc6tDqp84Nx1ZULznCg9R8n6sFBbcSKeGV9yxgUzhVWLT/uPnnz4man49GN8II3IfAW8FcrE9vp2E++OpxqEJf2BbjyJdfcHBaOecEFzeOwBqn4XiNzjSLtLpNxHBRr35fOAIBR5zQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB4PR03MB9433.eurprd03.prod.outlook.com (2603:10a6:10:3fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 18:44:40 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6277.035; Tue, 11 Apr 2023
 18:44:40 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v13 01/15] dt-bindings: phy: Add 2500BASE-X and 10GBASE-R
Date: Tue, 11 Apr 2023 14:42:58 -0400
Message-Id: <20230411184313.3679145-2-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230411184313.3679145-1-sean.anderson@seco.com>
References: <20230411184313.3679145-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0350.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::25) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DB4PR03MB9433:EE_|VI1EUR05FT019:EE_|AS1PR03MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: 03f19743-9bd5-48be-87e7-08db3abcdc5b
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  aE+4z/7iImG99jAni0gaCh3gvrfolP4UmXTHIhDplV0+6g6zkO6DESqVz78Kza2oVEtP4cOe/kuJx16+YPQILXRF0WAcXrsiBomjIICN8hanU7aTILqyGdQRUFW4/BCqoaXTM6TzQgOFk6BOIqQ8ufmAnuDenUa+Lk7mda/E2MwhWbzmpK+gs/q4BXPT82RKeRK93OjRq8DWVof/Z7vgfkPKwyQlMPHSBmhfM+tgTFt+ngdvcmJqnJ3JiJKmz8egevBjMS4NgDu2qUPqjXY6pkdk7vMuFMzr3G0g/25dwuclCht1XRWUuPQYbkCDnYg4oROhgqyy5uhmKb7Y0C+A0SjMoWfUQKJMa8JIPBqzLKwXLX6NVQZeWWAqsaZ9EQd27TXThOykJFgVrsP9fnasmXOnKv2YyqG+6Dq+L1MB3WmvjBYlnc1POVz+/90Slm6kSlVoZpqY9g0ZPqosOKFo9D5iHc5nZH3UkCkpkZaiHrE+vwb29nTmuPq1FxEw7RrRAz4njbhISvwQlh/sk+Jfn1OEWIMcGE2b3uxd8m1pc4EuIe4fjL+0aUC0owv5ZaOuzcrBoEzqu6oeZa5nt7HhU+tUd5Z5isiblVIk1ZnCbYo=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39850400004)(396003)(136003)(376002)(346002)(451199021)(316002)(110136005)(38350700002)(38100700002)(54906003)(66556008)(66476007)(8676002)(66946007)(4326008)(86362001)(478600001)(186003)(2616005)(26005)(41300700001)(36756003)(6506007)(1076003)(6512007)(2906002)(83380400001)(44832011)(8936002)(6666004)(52116002)(5660300002)(7416002)(966005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9433
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT019.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	4b822c4b-8eed-40c1-cd23-08db3abccf11
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	FROBZPUfyr8gfjyvTaRapHmwlWpxFvTizeMWi6t1nR/naQ0PtlVrypssi2ssO2P+OUjVtbXpTG52SIb1S/cDSxAaquzY//HjZ/VIwIk30I9bn+VtWuIFsVl8w33K6tuLyron12RLZNIOCnlMWugKRWXXFp2Vfl/CrUj7DPR77B53KLa0fLL9A5NCQib0PyN1wiPsYbqkUPhLEK8Fazp9LwGrYFQdmPYtEX70kX1uix6HV2NRsN6hpVlQTGWFPUrIG3ZsboBWXeb9QbjwgjcSOv/t6qycAL7yPBXUDgSEnTuqt2TjHXLcQcBCdy6sRcRSuHy0allfzPy6LI3EZX/tNQ4oT6Tr4d/iSEjgwMHdeLq7fA+J7dcnfolNlpOp775c2wLxKDR+K9buMevy3oOmY+K1eNZDTEDt35cOMB22St+nuBmWB0D7bfB0xfZE0EwkB90JFesZxiWgYGgFjA1EAzwsNw/0X0KPmA5J88pw+0TotLupUbvOB92dOvQIvplofFlql3P+UCBnI0c2GaKCSnzFCbsB8z7nCPxFzuvBA/V8jMwbELQhjl6k8pUaq0+vA3D0pw1CK/IZsqQrqAea4TPpuMWt+QrobHIN7yWBRDFfd4f3dHnhId3y2Ux/Uklxia4eaBpYxgzmIoOhf5+nkAzrx4bhDxAgIzL+a7UR9h2PY8jLZguvmgBs0yOg3paCF3KfElhd6wD/7eTIuBvP/VGU9JfET9cLkEoKgV3tkVMlOBBf+QES3FC+kILEwtsY
X-Forefront-Antispam-Report: 	CIP:20.160.56.87;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(376002)(396003)(39850400004)(346002)(136003)(451199021)(5400799015)(36840700001)(46966006)(40470700004)(70206006)(70586007)(4326008)(8676002)(83380400001)(47076005)(40460700003)(336012)(26005)(6506007)(1076003)(2616005)(7596003)(186003)(356005)(6512007)(36860700001)(86362001)(34070700002)(40480700001)(82740400003)(7636003)(6486002)(966005)(6666004)(36756003)(316002)(54906003)(478600001)(110136005)(44832011)(2906002)(82310400005)(41300700001)(5660300002)(7416002)(8936002)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 18:45:02.7524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f19743-9bd5-48be-87e7-08db3abcdc5b
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.87];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT019.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR03MB8216
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

