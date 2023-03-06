Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDCB6ACDE7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 20:22:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVpNn2DZgz3fS1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:22:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=VNLE0Nri;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=VNLE0Nri;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0e::306; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=VNLE0Nri;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=VNLE0Nri;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04hn0306.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::306])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVpGY09nYz3cBm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 06:16:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV4YSLSWUEa6icuS3ElbSt+yZKjwyRoBMk3Gdh1j9EM=;
 b=VNLE0NriW85lgqnNA8sqpuI0dxh4CsdVTVakJ0O+Wm445p5zdc0A7Q5ifScoNaDhCLEBCXtcSkolZGA2+hOVoqOpek0aIDf/bpn2OtV9+Ut04kEOPc4U/I6ghdBFWwIl4sMuYSIjIB7vwCMKxBul57p79wmnm1usKjeMtYZBEgjlxFcNEdXHi8b63EJGhx/JYFohCiGHDgX4CALm1XehbpjsKDfmq+nYO/+YxZPf16fCNUElOaNUseVNdpI29dpXk1Nssw8lFtcYWapf/SqH/nqeIi7RqD7Q8WXK60AW3RBdnoN+weEwNJra2CXzznYlu7eHT4wEzUBEnMD/B7/GMg==
Received: from FR3P281CA0103.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a1::19)
 by PA4PR03MB7280.eurprd03.prod.outlook.com (2603:10a6:102:bd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 19:16:17 +0000
Received: from VI1EUR05FT040.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:a1:cafe::70) by FR3P281CA0103.outlook.office365.com
 (2603:10a6:d10:a1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.15 via Frontend
 Transport; Mon, 6 Mar 2023 19:16:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 20.160.56.85)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Fail (protection.outlook.com: domain of seco.com does not
 designate 20.160.56.85 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.85; helo=inpost-eu.tmcas.trendmicro.com;
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.85) by
 VI1EUR05FT040.mail.protection.outlook.com (10.233.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.15 via Frontend Transport; Mon, 6 Mar 2023 19:16:17 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 37F732008026C;
	Mon,  6 Mar 2023 19:16:17 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (unknown [104.47.30.106])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id CF4DD20080077;
	Mon,  6 Mar 2023 19:14:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQ0OuDtBa1wnc05hxpKEUaUa+e5xnosIGiiZuhRt5+WBwxU66AoFtQtksM6ZK4JwiQmw1DRTwerqKjfmu4uLHcDnDN9Oi8X1zBCIIdmqwVitVY0J7CqEsNSKiiYzcNuGpV83AaX2McLdj5MC4cIRFA/oedlqfTV842Kts94Pzf4JJ51DKOSzG/Q/FOuvooMLzCjGdcrHLwHWckuei/gCE2Wv+FxY9RHd6rM2wz3i0RdwIdLebSpb1lRyUpCqpzEuJ3yxk/WVfo74sEqD4WG5hs8j5FPAsV/52Cm/o8LLkbLMUMK0tAhjo3ak9mnmMpUct+uAyvQlMiegsv7OL+Uqig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AV4YSLSWUEa6icuS3ElbSt+yZKjwyRoBMk3Gdh1j9EM=;
 b=PMvgHJ+2AKalOJu6uLVLWn6d+W+aq4bHni1qI8TWRf7KYVjoCFyC989n3OH/q3eadtRSzhBKn4TLnTIhmCr9tGb6LkiydeQ0Gsk0AKeQOywmoZNN3FHdh5RZdi7fVsXpynD5YC6wi9fMk/xIZ6WAkwMVAoeaOK2pmwuO5w6oOp7d2n5hYWdI5i8o0TMICT8orVtmwb2a7NcO5M5twxeMdhmHIO0uPAWJ8jSs5iSmW80M+YK+Kqwe/oTSLAQEv3n24v276CQdF5S0RLUILOzRg2PxdPaoKujvksPlgn5WQClBywsRRzWtIzmPiOpJUAE2Lz4xhU5cubYWniBv4PId8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV4YSLSWUEa6icuS3ElbSt+yZKjwyRoBMk3Gdh1j9EM=;
 b=VNLE0NriW85lgqnNA8sqpuI0dxh4CsdVTVakJ0O+Wm445p5zdc0A7Q5ifScoNaDhCLEBCXtcSkolZGA2+hOVoqOpek0aIDf/bpn2OtV9+Ut04kEOPc4U/I6ghdBFWwIl4sMuYSIjIB7vwCMKxBul57p79wmnm1usKjeMtYZBEgjlxFcNEdXHi8b63EJGhx/JYFohCiGHDgX4CALm1XehbpjsKDfmq+nYO/+YxZPf16fCNUElOaNUseVNdpI29dpXk1Nssw8lFtcYWapf/SqH/nqeIi7RqD7Q8WXK60AW3RBdnoN+weEwNJra2CXzznYlu7eHT4wEzUBEnMD/B7/GMg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB8394.eurprd03.prod.outlook.com (2603:10a6:20b:526::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Mon, 6 Mar
 2023 19:15:56 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%5]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 19:15:56 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v10 01/13] dt-bindings: phy: Add 2500BASE-X and 10GBASE-R
Date: Mon,  6 Mar 2023 14:15:23 -0500
Message-Id: <20230306191535.1917656-2-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230306191535.1917656-1-sean.anderson@seco.com>
References: <20230306191535.1917656-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:208:23b::20) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB8394:EE_|VI1EUR05FT040:EE_|PA4PR03MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eb05bde-4c61-42ed-1670-08db1e7742f3
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  D47ouEvu/teCiOhlOJKU3Aenak69bJUoBL9dhilU5nL3H0QQzLijqp5TyOrP5sNnN1482iy7o0z+UYuKxsN+Et0Jcrgdqp9b9rvtmgJKrsvWFxgFB0nFptxhkMe8Ge8KTYpPqIbrEuhcFHgLqNDykt4N96cLBgeu3jfsi8fqgZhvOY/mGG8D0L7NGsfRytwLC9JqYShQ+Q5BHuphyht2M/Ty85U/FQIjCfS8Qutcxscwh/BqOPCCsoxl5mqxyO1Lc57ZhqFxKJ4so1Zhp+2nOhKmwIq2r19q3rrQ3yl0cqPz/T5Fl/jMDTRcQUns+e9ypbJbv3rfRgf8dhkMjBjqDymu2kZ2RNK3tOud3bw2JScfZvx1qM5bzEjLzARgWahF8vV65moVYUy7NgAEl2EgSf8FqH0C58T27S0hfoNeAQMMNR9+u9bWBcrggS4ymm/3C1VQBGRNdoj0HEc4VpADezUk43zAhKSkDiu/ZI2zGMeAIRvhcLD2zLzLJ5uWjAgPPHVb/iyEfip3HYJ8Ws8mxrkh59+qwv0r+DbvqKdXLtEszImXYyirztJT8ERDvNwTobd4+gSu5XACs9pu7rNQLJdoUV0+NKifDRb6QwrF7JiI0EyYJ807wNxI6DdQXbC3ld81G5nNLGNFoRRnO4RcIbuotBeRu67L6CV6DCvTuTErb/XbVCFaESY5DbhGD8tn
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(376002)(396003)(366004)(39850400004)(451199018)(36756003)(6666004)(110136005)(478600001)(83380400001)(52116002)(1076003)(6486002)(966005)(6506007)(26005)(186003)(6512007)(66556008)(41300700001)(2616005)(8936002)(66476007)(4326008)(8676002)(5660300002)(66946007)(44832011)(7416002)(86362001)(2906002)(54906003)(38100700002)(316002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8394
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT040.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	4ce95df6-fd9e-4601-0d87-08db1e7735f7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	YNHE1ZCtmIJ/uz7GhQjlP1rJYBIa+JguihSGVpjVKiau4k7R6XQB5gE/sUcOiFhcQ9/fe06q7g6ZTe6cfhRF7WVpbUvvNlNTYX59/KllymbeMjVk+4JZJVtPqYd7Mw+1kmyJE9STcgY2hF60kFyGl4PQiZTET4kmlKWSSM5RybYEi8swcc+UATL46jjxDBMgw8ujiY/zFIAUIF8jm2u1N4n3DlKj84t0xbSEbI0USlJFuyIJA7IoMcDTCsrDvbmicBnNGEPKh8KNVxMH+aTfJZtUvX2thaaqvNfEpLTSK/zAcWsRb7qWWR3nEYkTvG+yE+1mctMXwAoZH0And9MVxwqfWQrl0AKL1UNQmE+w52LluOWdPNolgR41Y1nUVSCWiP5uPvUjZY2AbNCYUexEWef7fhVnx6JjFn0IxTU6XJeMsvzqXMjVtjLWDnWwCi2Yxg2fOr0arLx1Dz3J01H6QiJBW4l82YvMmc5dCumATpV0M1Qaw+8tX+ul5xcb3OrmqncewcZtjGHImhH0dHOYismRdGyLB6b4nN38c6p5fiSagGmDYp5/StlcBHyrsVhjO8RB6Td7P/AC47K0qIuu1R1xXp8MmgNXmHrVjIdr4Zt3w4JY943f0ECSSgn5DA9KvaioHpUYBdcrRl1zgRdZUYpsHqsLpNf0eEGoysz1MBBiY2sfzohCaZnYSmYW1J1vmbB787Jt4LqQOdXLlRC4D++zx9epkw22OqGEM0iRZ/aDm6vhxsW2SpbVJ5guXATu
X-Forefront-Antispam-Report: 	CIP:20.160.56.85;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(136003)(346002)(376002)(396003)(39850400004)(5400799012)(451199018)(40470700004)(36840700001)(46966006)(36756003)(4326008)(70586007)(70206006)(40480700001)(7416002)(41300700001)(8676002)(8936002)(44832011)(2906002)(5660300002)(7636003)(356005)(86362001)(82740400003)(7596003)(34020700004)(36860700001)(6666004)(1076003)(6486002)(966005)(478600001)(110136005)(54906003)(316002)(82310400005)(47076005)(6512007)(83380400001)(40460700003)(6506007)(2616005)(336012)(186003)(26005)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 19:16:17.5444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb05bde-4c61-42ed-1670-08db1e7742f3
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.85];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT040.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7280
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

