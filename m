Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE656E11D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 18:10:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py4LJ0t0Gz3fT0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 02:10:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Y1/f5Kdu;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Y1/f5Kdu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe13::301; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Y1/f5Kdu;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Y1/f5Kdu;
	dkim-atps=neutral
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02hn20301.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::301])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py4GR1GKGz3cCD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 02:07:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qv1zXTjvA9ZGaObtt1TjejTod4QaRoQztRWwnCWrZJ4=;
 b=Y1/f5KdumMZdTEkQs+2y4FELDLC7MgF9YEbp/ZCCpdXmpQ/TzvX4DfpwsqSFn7elAM7iIWt335Yt1AkmUThhOOz7JDyTww1yw25eFBasYQL8qAKcr2JC3nkVPqXxJFS7cNwXhn/XYaTbl6rqFosC1D4Jq++sxX9VZ5xd4jstz24y/n4GVpDeGYaTZizaTbJUyXL8IU9IXXwnmxfwNF0yTHRb6pMJoeHA5jrlt9t0GrVihTZXg6jzd75UFZSDf9WwkKxRoBfdW35yuJ0ZcRJFk4Fae26Vft2OKXIv2gdRcinYCtBvmASjZLImCnQXDxtj/kDF6Il0hjjU4S3tJ9+Z6A==
Received: from ZR0P278CA0027.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::14)
 by VI1PR03MB6429.eurprd03.prod.outlook.com (2603:10a6:800:19b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 16:06:51 +0000
Received: from VI1EUR05FT037.eop-eur05.prod.protection.outlook.com
 (2603:10a6:910:1c:cafe::41) by ZR0P278CA0027.outlook.office365.com
 (2603:10a6:910:1c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.31 via Frontend
 Transport; Thu, 13 Apr 2023 16:06:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.81)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.81 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.81; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.81) by
 VI1EUR05FT037.mail.protection.outlook.com (10.233.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.33 via Frontend Transport; Thu, 13 Apr 2023 16:06:51 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id DE1A42008026E;
	Thu, 13 Apr 2023 16:06:50 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [104.47.18.109])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id DCB4D20080074;
	Thu, 13 Apr 2023 16:07:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0oOoJ9IH2/7/HnHXSDu0uS/AP6DPAVz9+lRH+Z9lvYaxflVT7iZgwD5k8pldMagKGiKMLZKPFBm3ko6OWa4rPAyA/kz5re0ilroGPey2ScY8AAzyOyyJkoZ6pTgTxoJ9vJJBLfENY28cYfIPXmWG0DL55FMFNNBHQSJQgmePKz8WscR11X9MsQRuzIWe3ssa0Fm/ccmjyyUlIix58pA6nYcGb768G7ejpoMIyKZKTXDFkb3o6nS1ygukmDL1FIrA/BlgaqpFyUuIA8ro+5LsEA5z9xVHiSQQROlGGzJ7MEcG76j9MWiZYq6XEg2D68qDgPMAIu98xluD23w2rMXCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qv1zXTjvA9ZGaObtt1TjejTod4QaRoQztRWwnCWrZJ4=;
 b=IPObwcm06dsz1wKx8+0jkxCz7LqK5DpfovUCEfZtAkamYIHp1u9I241HwUYOqEtV6wOroEpBTfoT/CUYjwFD14xmK8xDeooCkxEvKVrlFA7o6taVYYqPn+pJWAw+UqYFjPm0z2Tlb/sD26ib+9+tGI8HJMDLD5c8xQ2Ff+4b0p4WL3whJzLrJ2Wi1ecm/VAP1O+cWvDFP5RXBACxVNnLdI2Ncw1E85fdymyrniGseWEX7Ld4OhoCech/ijpPDoLymUKHkYB3tS4Te9vYow4c5mBRCAKtQnPkpW0/u75d3WZeieiqVFNJQiQXDsPBj0y55JoColCTYkaCS/JiEZ+BhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qv1zXTjvA9ZGaObtt1TjejTod4QaRoQztRWwnCWrZJ4=;
 b=Y1/f5KdumMZdTEkQs+2y4FELDLC7MgF9YEbp/ZCCpdXmpQ/TzvX4DfpwsqSFn7elAM7iIWt335Yt1AkmUThhOOz7JDyTww1yw25eFBasYQL8qAKcr2JC3nkVPqXxJFS7cNwXhn/XYaTbl6rqFosC1D4Jq++sxX9VZ5xd4jstz24y/n4GVpDeGYaTZizaTbJUyXL8IU9IXXwnmxfwNF0yTHRb6pMJoeHA5jrlt9t0GrVihTZXg6jzd75UFZSDf9WwkKxRoBfdW35yuJ0ZcRJFk4Fae26Vft2OKXIv2gdRcinYCtBvmASjZLImCnQXDxtj/kDF6Il0hjjU4S3tJ9+Z6A==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS2PR03MB9369.eurprd03.prod.outlook.com (2603:10a6:20b:57b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Thu, 13 Apr
 2023 16:06:40 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 16:06:40 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v14 04/15] dt-bindings: gpio-mmio: Add compatible for QIXIS
Date: Thu, 13 Apr 2023 12:05:56 -0400
Message-Id: <20230413160607.4128315-5-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230413160607.4128315-1-sean.anderson@seco.com>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::33) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS2PR03MB9369:EE_|VI1EUR05FT037:EE_|VI1PR03MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: 0688fe48-741d-43d4-e10f-08db3c3917c0
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  IA2/0iLOnpsfSZrmrOhMHt3FjobmWZg8e5OZe/wJYeW7GZdDVRbSkyVa2KHZHv4XZ6L8eoj5MIpZMPtVS1a4pjy7dzP34dUS8uaxRZcRNszC+64SEMqjZ9Ki9a9AfggYt7UvgBcTTMRSF7l5Znm/96nNkfS6TaFxV+25/vJXnJbLzPnMeKRX0gFvKE1pbZBAAYJAfiv8kQ3eX89FRt26FD+7kLj20dVRcSLG+I6h6ixiIR3GRwEBcYtmFjCnv/Gdhjt/PmfkYmY8ensvCHktkiaWvvXj+SZPcgT7xga0LU2Bq6zsYn5W7w7xBHeWgZGuv06q2YvA6yxaLZWpexf/5Ogt/8TdIsPdP3iG6tQfetQmLAIkHKc0+pF98S4W166G4HNIcYu8ii3pbYk9wVXvtIAMcadAO30iQWpD+5zxe+sm5Xxm1zkUoVc5Ds839ZFZTZl/5JLWB5ffV5g84Oe1ehNhebN4C3VlrDLDDLDvhHpM+jObWZ3rOa9nKrzadr9CR8BElBxK++uP4+niX/tituz2vtIy4oZCP+NeIiT07QDv0nFGssQepfvc2RevApLckJpUMxSIDj2RLdttgrqDOTgUoDUok1wOfmwbtpu02etA1wW1iHBgST9SU22DU+SU
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(39850400004)(396003)(136003)(451199021)(478600001)(52116002)(6512007)(83380400001)(36756003)(38350700002)(2616005)(86362001)(38100700002)(2906002)(316002)(6506007)(26005)(110136005)(186003)(1076003)(54906003)(5660300002)(44832011)(66946007)(6486002)(66476007)(6666004)(8936002)(41300700001)(66556008)(7416002)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9369
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT037.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	c2c86c40-fe6d-4616-ce73-08db3c391153
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	FNwjiZ4gikd/n9zNwy0oXMSQd616x7muu1yDn4AsjHLrr7473ELiAukQ5cfShJWdPrEvjrx7ovnV/uZe09WQOENoUJetmuHq6SbTRcjtvty6tvZfBnQoJ+lyXMwWNtvfEr/s5z95wBxR6JNVCDXj8afLwh26hZz1gks7iq99amZJ+5H9vzHwI3W6zeJmAQqIABTOirPD4aJlgVlXEHM6FKeczDy6E10/0GN5Aikz2XAsZHSKM39XrDYfdcBTxTsZuiIwYQe/LtrFBr83J4yN0qPhItywyHw1fKSTuuyqpiSwRQuMropev7eWSMTUlz8fuk5RjDruKf4R5lsggJ/y4rbpV8f1Es1peaEDZi1WfjLH8Pbxb586phCXQ7cwq+vkYprCVbzOs7HMLbzWJr4nIed6ECOi5KgiwiLYV7ssw6eG69JDlQrrbs+NlVkTOHiU+uIGnVePgHOBCn7g231IuUpXAhv6dJDD2lQY8WtGZ5cCAHkyW3crTtxMPqm/JLNRuuov4x+qLpOTgE8TziSmtfqiHXim+9cgI8PKzncvqkJXdEgKi9kESI0uLcozLGhLja70nxFM111Tj3dE6CxLhOCjCWcOIacifi0t+n3tOsb4Syust8wE1WIfHK6Va4+uLJi4K6gna1ibqzAi9wrRnqG7rbd6tC/67ungIqs59J7qG429EwSLlOxgy0te4khlnIbYyG2ubZUFzVpEco89RUzoFWNK90/fQGpoHOhaAuU=
X-Forefront-Antispam-Report: 	CIP:20.160.56.81;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(39850400004)(136003)(346002)(396003)(376002)(5400799015)(451199021)(36840700001)(46966006)(110136005)(86362001)(478600001)(54906003)(6486002)(34070700002)(36860700001)(47076005)(36756003)(2616005)(336012)(83380400001)(26005)(40480700001)(186003)(1076003)(6512007)(6506007)(82740400003)(6666004)(82310400005)(7636003)(7596003)(316002)(356005)(4326008)(2906002)(70206006)(70586007)(7416002)(8676002)(8936002)(44832011)(5660300002)(41300700001)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:06:51.1594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0688fe48-741d-43d4-e10f-08db3c3917c0
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.81];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT037.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6429
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

NXP has a "QIXIS" FPGA on several of their reference design boards. On
the LS1088ARDB there are several registers which control GPIOs. These
can be modeled with the MMIO GPIO driver.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

(no changes since v10)

Changes in v10:
- New

 .../devicetree/bindings/gpio/gpio-mmio.yaml        | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
index b394e058256e..5abf3dabcf39 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
@@ -18,10 +18,16 @@ description:
 
 properties:
   compatible:
-    enum:
-      - brcm,bcm6345-gpio
-      - ni,169445-nand-gpio
-      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
+    oneOf:
+      - enum:
+          - brcm,bcm6345-gpio
+          - ni,169445-nand-gpio
+          - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
+      - items:
+          - enum:
+              - fsl,fpga-qixis-los-stat
+              - fsl,fpga-qixis-brdcfg9
+          - const: ni,169445-nand-gpio
 
   big-endian: true
 
-- 
2.35.1.1320.gc452695387.dirty

