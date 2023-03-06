Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B64E6ACDE8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 20:22:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVpPr1bVBz3fXs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:22:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Bm/BMtu6;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Bm/BMtu6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0e::31b; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Bm/BMtu6;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Bm/BMtu6;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04hn031b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::31b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVpGY0Pvfz3cC5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 06:16:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHGBWgkv88UgVz7sgwlz/8/wpwKwriY5+ucBim+GBZQ=;
 b=Bm/BMtu6LpmLUKIwSmXZ7jyjtyzGwia7SrXXjPvoVKwBZd3MIA1Xh2QuiRfbpNr7UbOS4ZyLPsWlXsJlwrwIsVou6+iuBd75raHL8+CJ8TkTd41gGbsaX6qsahn9iELngAiws6LZpp+pOcfxiuqOklKDSlXDrh/wohL0zRMZRurjWOTH9UoGtsMI1qoR3SwvW40p1kX1+urNucTVJcEGY77Eabh6yfLl9xK8DBW7Z/4nY3Mm6NQ0NNEcoU84z96TbDp42zi+GGUO0EnaTGlonXxu7ntKmp/8hqHEnZzFhhnD5ab5qJnT/siphWqAZX7cF5cJokknKFzw8+QDnAps3Q==
Received: from DUZPR01CA0210.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::24) by DB3PR0302MB8943.eurprd03.prod.outlook.com
 (2603:10a6:10:432::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.25; Mon, 6 Mar
 2023 19:16:17 +0000
Received: from DB8EUR05FT052.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:4b6:cafe::ad) by DUZPR01CA0210.outlook.office365.com
 (2603:10a6:10:4b6::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28 via Frontend
 Transport; Mon, 6 Mar 2023 19:16:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 20.160.56.86)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Fail (protection.outlook.com: domain of seco.com does not
 designate 20.160.56.86 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.86; helo=inpost-eu.tmcas.trendmicro.com;
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.86) by
 DB8EUR05FT052.mail.protection.outlook.com (10.233.238.222) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.19 via Frontend Transport; Mon, 6 Mar 2023 19:16:17 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 37AC62008088D;
	Mon,  6 Mar 2023 19:16:17 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (unknown [104.47.30.106])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id DDA372008006F;
	Mon,  6 Mar 2023 19:14:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNYm8vDQYTIQA4gjtsCSwcztpVVG9vfZjyY/EwisKJpBm4wdB/CVzWKSEHmAWpcUfYSU8p3IHzDVrQKvG+cBhzyfnYpXSzOKfywSjp8IaLFLksbVJMi/bg94uAYIvx0EjzCbfLHzxm6mFsIJ4DDnexS3bOg0bAdrTPpdrGCfz7jXRLZafmVwefcRVuJavKbAFphTlXHjlojIQGy6l6BtNNWrnstPLtgM2LjKvUm0/rsqDv1DDD27k7ma+zC2tjbDkI/KI3+EYj249K5ISY5bChgzcuXbtVY+lEYXUZak+4v79I0giV5uJ7Wn9A96BV907/739M1tiZzt+W0mF3+PqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHGBWgkv88UgVz7sgwlz/8/wpwKwriY5+ucBim+GBZQ=;
 b=Y44NgtDTkZqt5QbEeG5m60YZay+p4dSEAdoNI7DgX2CAtB3odTVQuc3IxNlwukBChCft1c1cs9D497Wk+0LP5NCaUUJFTLgdFin5gaP8aNlgVAznlqhKmj3oqd200lWmCBbAEFfyTqgmXE4Nb5bStXUATCN1psy2bmR4wYy6efUwpUhQ4E0VG04L5aiwu/6mDLUvFqMbPh4rsOZa8AiVla3vHyTBO5gDdtMzjdjzP9lDPJ50+VZK6ASZ9+yfw5mr9B7n1xENBggs3gGSpBVmd8zjZIYDLyk0szsoeawQiZsa9hFQGEAkF2+n7PFt/Q5V/+h5SeShh3SP4TxlzZXgQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHGBWgkv88UgVz7sgwlz/8/wpwKwriY5+ucBim+GBZQ=;
 b=Bm/BMtu6LpmLUKIwSmXZ7jyjtyzGwia7SrXXjPvoVKwBZd3MIA1Xh2QuiRfbpNr7UbOS4ZyLPsWlXsJlwrwIsVou6+iuBd75raHL8+CJ8TkTd41gGbsaX6qsahn9iELngAiws6LZpp+pOcfxiuqOklKDSlXDrh/wohL0zRMZRurjWOTH9UoGtsMI1qoR3SwvW40p1kX1+urNucTVJcEGY77Eabh6yfLl9xK8DBW7Z/4nY3Mm6NQ0NNEcoU84z96TbDp42zi+GGUO0EnaTGlonXxu7ntKmp/8hqHEnZzFhhnD5ab5qJnT/siphWqAZX7cF5cJokknKFzw8+QDnAps3Q==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB8394.eurprd03.prod.outlook.com (2603:10a6:20b:526::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Mon, 6 Mar
 2023 19:16:01 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%5]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 19:16:01 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v10 04/13] dt-bindings: gpio-mmio: Add compatible for QIXIS
Date: Mon,  6 Mar 2023 14:15:26 -0500
Message-Id: <20230306191535.1917656-5-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230306191535.1917656-1-sean.anderson@seco.com>
References: <20230306191535.1917656-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:208:23b::20) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB8394:EE_|DB8EUR05FT052:EE_|DB3PR0302MB8943:EE_
X-MS-Office365-Filtering-Correlation-Id: 57faa098-f965-4cb4-12ae-08db1e774308
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  ar4yQ2OeuSwpC1ANgLbwGndKWSZOKE2I7jgom6O84MhTu5t7LSdbFmEuGu3rxVTViLNSLTg0elugghRx863pQYhtn74N8NJ3wGWqXKthgGPdznViqf0/DfODBsTp5n4c+725IdDIE8QABAUwHeSNtRRSe4hf1R6Aul9yCaIy4iWzYBAEs2E+xGmWx6v2h95y/bmid9E2X5dDSr0hTpzKRhAEGWIlnZsbb3JIt1F5+vD3L9K4Q18o80HJY2rVsKpWFLTPT6KkHnsUoarv/bQkdvheBUSarTBn8MTwovOkxISkbxPK16A33difnNBqvU/oGc2UxUKx0S1OiviF7wFoEoqOjrVhUOh+ReIWL8gDVEWecHDvyu8Akk+jmzH1goo0HL1XT0i3CwGOQ3z0Y7YtIFjGiHmDKWLRdLE4Fh99+QiHeU9g8S5ctuuD65PJsxi0t91XdGdyiM2sYbsX+h03EbHI6xXlMU9dcZdrPf9nZJh3mCJdtx5amNqijay3Djta6KMCzNLUe3qs2u6dMSwpRZduWtU+1SxmhOfLwRBkv347/wiw0mmnTltNnNh0m6tGJQsrr3YEuqWYcKs2WW36HRk9EW6aACDQTnl6LgTA4obbiqA6A58JnxM1pL7o0t3SG7geFK5XDJLC3hre7DPg8+sJmhBcRrhVYJMD26RaIwwNjraw+zUOuEw8e5Fy/qGFla1LrZMPE8qLJ3vBoCRFdQ==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(376002)(396003)(366004)(39850400004)(451199018)(36756003)(6666004)(107886003)(110136005)(478600001)(83380400001)(52116002)(1076003)(6486002)(6506007)(26005)(186003)(6512007)(66556008)(41300700001)(2616005)(8936002)(66476007)(4326008)(8676002)(5660300002)(66946007)(44832011)(7416002)(86362001)(2906002)(54906003)(38100700002)(316002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8394
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT052.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	a1563191-338c-49c8-7257-08db1e773913
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	f6/XxQlAel08HHIi53oR4vO23C2La0qaD61keHgkkkaqC8kVbEOUNLseHE32fVcPTzEJFpwLbyD1oGy+ap4Zg3TOXQVyXFrcYIbJ2VkhL3gUpptMCRvyVlErgA5swiUKa+6GIfemjt+mPC4C+HoWq7YDnyLj/mf56KbeEoN/UMqvNRRl0o5C+QB3MHio+T7PZIn+ig4EPa590xFAofktwRNZEt/1hZL4hIliu/Wnos/u2699wOwTS9F0GOMo3WTE18ep50i3xcAPmEIWC5UU+mPKCDoQsiQjySTiNMNbvsUHuIejPJ/djvhAECCbrvo21U+FmT+k01zAmkfgle9CVixnhHSPXYrewytu8IeCmbXxiWA8HBi2WN1JxfDT/XUgUW3C2VQhVARJaeY/HKC/KAcQZcJLUiLsTJbNluBjoAuYbppaOkFknUPBs7T9LqPpOtLb7vD6AK60iPbVuF7+0ssRd7+kQeIpPDUedCWadoI+5qR8CprK0CkmTJG2DUUqxTEocRFvXpfgwWXQrHHo/MW07n8GPXmafOOMjC1RWAQ7gktgiABKZqDBs1FYZtw2qjdt/PV7x5/UEbctBZiF7Zw2eSy7kMUWV57BSkQn9Fm2uINWoYTNc0HAs9hRjWKPjLNuAkBg/0I219BEphroK+Tn9Z8UsB0KN2SIvonyxDX306xGIfkmXaLAAqjIcXdQsusAILnueuZc2JVY9bIBZtJfbt6ugoFVtmHz1gnH914=
X-Forefront-Antispam-Report: 	CIP:20.160.56.86;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(136003)(39850400004)(396003)(346002)(376002)(451199018)(5400799012)(36840700001)(46966006)(186003)(82740400003)(6666004)(356005)(7596003)(7636003)(8936002)(41300700001)(34020700004)(8676002)(36860700001)(70586007)(2906002)(5660300002)(44832011)(70206006)(1076003)(26005)(7416002)(478600001)(47076005)(6506007)(6512007)(107886003)(4326008)(2616005)(6486002)(86362001)(36756003)(316002)(110136005)(54906003)(40480700001)(82310400005)(83380400001)(336012)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 19:16:17.6663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57faa098-f965-4cb4-12ae-08db1e774308
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.86];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT052.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB8943
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

NXP has a "QIXIS" FPGA on several of their reference design boards. On
the LS1088ARDB there are several registers which control GPIOs. These
can be modeled with the MMIO GPIO driver.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

Changes in v10:
- New

 .../devicetree/bindings/gpio/gpio-mmio.yaml        | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
index fd5c7055d542..a00a249e17cb 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
@@ -21,10 +21,16 @@ properties:
     true
 
   compatible:
-    enum:
-      - brcm,bcm6345-gpio # Broadcom BCM6345 GPIO controller
-      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
-      - ni,169445-nand-gpio # National Instruments 169445 GPIO NAND controller
+    oneOf:
+      - enum:
+          - brcm,bcm6345-gpio # Broadcom BCM6345 GPIO controller
+          - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
+          - ni,169445-nand-gpio # National Instruments 169445 GPIO NAND controller
+      - items:
+          - enum:
+              - fsl,fpga-qixis-los-stat
+              - fsl,fpga-qixis-brdcfg9
+          - const: ni,169445-nand-gpio
 
   '#gpio-cells':
     const: 2
-- 
2.35.1.1320.gc452695387.dirty

