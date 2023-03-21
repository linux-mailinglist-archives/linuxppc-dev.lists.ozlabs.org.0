Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DCB6C3B93
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 21:18:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ph2x81Xdkz3fDq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 07:18:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=i6l/K8pC;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=i6l/K8pC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0c::32a; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=i6l/K8pC;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=i6l/K8pC;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04hn032a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::32a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ph2r24NXrz3c72
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 07:14:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qv1zXTjvA9ZGaObtt1TjejTod4QaRoQztRWwnCWrZJ4=;
 b=i6l/K8pC4p3+zUPOtG8d7VUA5nhUrgwKWoAibFEUAudsTEN0ZI2Tsy0oOls+aB8i53b64D+Jg005m5t2lp00CgDSVGDAMEFbiDBWS2VBtLkiX63PNcpL+dwNIE41uR7CLhPxfbUYf/D8zsGXYxRMUFsQI9fSh0EJuj9VjcW5OI1tYAIXPfoQhmrASO5Z8k7gc9uT+luEyawyZIlxsiwnlzRg9mAyZiMIXr85BbgVABh9blmYNpGlw3zx22sJ+zurFwxke7DP0v6kw/Hgus5Lv5Od4x8jvJSirN5owtLeZF7A/0G33Cuvj51CzL2ezHYD0pV3hFZQVmhMy1pXucLOtA==
Received: from AS9PR05CA0228.eurprd05.prod.outlook.com (2603:10a6:20b:494::10)
 by DBAPR03MB6485.eurprd03.prod.outlook.com (2603:10a6:10:197::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:13:51 +0000
Received: from VI1EUR05FT057.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:494:cafe::a5) by AS9PR05CA0228.outlook.office365.com
 (2603:10a6:20b:494::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 20:13:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.85)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.85 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.85; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.85) by
 VI1EUR05FT057.mail.protection.outlook.com (10.233.242.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.16 via Frontend Transport; Tue, 21 Mar 2023 20:13:50 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 0FAEC2008026F;
	Tue, 21 Mar 2023 20:13:50 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (unknown [104.47.51.176])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 991142008006F;
	Tue, 21 Mar 2023 20:12:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EArQL66kikGn/CdG8tLUH7YJD/a4BOBU2FVtcZky4UP7UzcRkP6XQV/G/RqEAHCtRzzRwFKr4lBSbKwwr7DkUIZUM3TKsveImja2du06/zfQ263utIO+9p8F/m6NORMVObDayBVRyN9OEvNYsmdNXG+L3XAZlCI472rtGvsqFMdf/BTIeQeSrXb1GBduX5LjC0FBSSeX5TIGrGOtiq+afkr5wMBLaWCpu8i5a4CHOdKTjACkc2fOxApuXgxvmYraiCcsuOA0tQER10mqzbDHYe/5BKUu0h3GgrNRcbrC9hDoLnhXBIqJeMramB7/vAzRNZzJMxK5cLIHyFA2QYhdXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qv1zXTjvA9ZGaObtt1TjejTod4QaRoQztRWwnCWrZJ4=;
 b=fOxxGMV8tmKdkXIngVx/FcmSZzavxgdI/JbzcgqgGo5LO0G5K3WBTBWrKFMr57vlE9JnaWl1DggAj0LUea5+JcFXZfueZr9rQzDJkKHuTMWDbhGflIXX8k897Ir3rMxwOxgDoeeDnn2XuKHU75gqp2D2auBkudQF/t53bsqmvRfycStJMXTR1evlSO6sGemx25wiMtgWQu9TZeksAtDITi0P87fTEgxoiSkvjiFNX1boqL4ykENtwAbwn8Bi6dZCCV2vxFVC7UeOUROTUOH/eajPQCThGGMs9FZkaNGiEGNdIxTKeeouBcxKH0nVHe1rtiAxeAjPBk4MN6vkB0zQqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qv1zXTjvA9ZGaObtt1TjejTod4QaRoQztRWwnCWrZJ4=;
 b=i6l/K8pC4p3+zUPOtG8d7VUA5nhUrgwKWoAibFEUAudsTEN0ZI2Tsy0oOls+aB8i53b64D+Jg005m5t2lp00CgDSVGDAMEFbiDBWS2VBtLkiX63PNcpL+dwNIE41uR7CLhPxfbUYf/D8zsGXYxRMUFsQI9fSh0EJuj9VjcW5OI1tYAIXPfoQhmrASO5Z8k7gc9uT+luEyawyZIlxsiwnlzRg9mAyZiMIXr85BbgVABh9blmYNpGlw3zx22sJ+zurFwxke7DP0v6kw/Hgus5Lv5Od4x8jvJSirN5owtLeZF7A/0G33Cuvj51CzL2ezHYD0pV3hFZQVmhMy1pXucLOtA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM9PR03MB7044.eurprd03.prod.outlook.com (2603:10a6:20b:2d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:13:39 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 20:13:39 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v12 04/13] dt-bindings: gpio-mmio: Add compatible for QIXIS
Date: Tue, 21 Mar 2023 16:13:03 -0400
Message-Id: <20230321201313.2507539-5-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230321201313.2507539-1-sean.anderson@seco.com>
References: <20230321201313.2507539-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0026.namprd20.prod.outlook.com
 (2603:10b6:208:e8::39) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AM9PR03MB7044:EE_|VI1EUR05FT057:EE_|DBAPR03MB6485:EE_
X-MS-Office365-Filtering-Correlation-Id: e1cfe995-3e50-4825-0e0d-08db2a48c960
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  3YOzFAL4pWGLvaDqF32JzyrCN99+ZLOtHjIqidgOmd1uHpHIm5h0hSxLvvmZq+afoIeP/Ym2BDQZAdEkHq/mn0zzM0KXgNx9a6mrWQVF6Fhkgfl5NRKcE5k0+yjBNgHyT162cwRuClix5jy+XttMRVGpF6lAPTvBBjcqp/GukfiKLTw7mGnzflvd5br4SWJQR00sZDFAqDs3DTZJyUVptmYQsZetjxnTQ7NiSvr2Ansj0XkvGZQr9M9MVaxAh7NP5NEKOS4wwXI++NN/OBIw723lzyl1p9lgOobzcDoZ/hbCdoCxf29g62Ltx04b0YhDxvA3nGw44CQqDqYvb+yPdi8m0LHIgdGsKmu11aLeSyrzRa5S96z/lH6GY0DjB69icajUWod5HpdOx3O/4NldYyzXx2ifHn8iwvBYTnbhJBKOrFWUU5kBf3UoG/pHPSiMUPUl5trwroYCtU0lkaUT6ty4yK2cFR/Z3OyNLpfw+TJPdYqbHwInMBmxTsyxxalerIlz/DTZgPBC2zQQIsSWCXw6lXIfDGZ1XxDmPERuzyv41EDKteG/hn8W1n5YjJ0QWsMCgcjnNHRbgJPwvMaQJwVaX7Rnp4ZrAaJJxxG4aFFe7lp7u1oIreYEBeh/p+9pP8ir2F2jUzoYvWFsH4JHSXGMMtg5YE7xRM90LKtQ6wbO6PFwMWJeM3hcR+XGogkz+rQ/ACjSu1byy/yVJc5U5g==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199018)(2616005)(54906003)(83380400001)(6512007)(7416002)(6506007)(6486002)(478600001)(316002)(1076003)(26005)(52116002)(5660300002)(6666004)(186003)(110136005)(86362001)(38350700002)(38100700002)(66946007)(41300700001)(44832011)(2906002)(8936002)(66476007)(66556008)(8676002)(4326008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7044
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT057.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	b0ee2f83-7628-4258-2de8-08db2a48c29f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	c7KX5qJjJ0KvqOmqWUb7ha8NyvuIFRQke49d9cDlQuh/JVHKRYo/QTt6l6Ak2vSqAZNg/AOJCDRV6Rejlrw2baM/McFyaNBz5nx0Mh7zK4TdI2pYjxXMK+vR6QJTD/G5Ezc6pxOKWzYHEOCLjUJe6JbIsWqjsQMrVh/U+QFk9v0LsxxgKcSmacx7zn27ZQj9XGeGzAeJy8sIhb7cqQrcpk3AJQx6GlqQc/uD9U8yOwgrwZ9uZ1EGrtvxkajG7SjwOcOwsl95H1SromTvsGpF0Mco8JPN6LTg9CIqCc22DBo5GXJBV2ZCWogbyvOJq8WEQ/MjW5IBCZm7a5RUIgNq1Ef3aoohjPTpybfbZPG4tuCxHUuTVBhJt6FqddFy2j/5gw+1fphLLVbV1LNB9/0kMLR9TyvN7I2ZEBmAS1WGTPRQKPJ26PuU8CRvMd42Z+WK3Y6UCG5GfBtdGkZBnX/q5MJjytCzQbTJ2MdkQJYYyKElcs605bNWz3KFPzHUAKNOfi69yZtjOvXt3afeC094rQGl0P5OEBLuka1yalxpP583LkAmSZvy9zXf4uvfIas291vlTqCKUZAiMwzO5s4/uftD7ZH741XTy0902haLDsFb6QGPNLOL4wBpr3C8UOC7CI2Ilpg/BK62O7YTrnsa8RR1ERIHEkOAVKPO3wKAkN3UJCCBAEZ8z8TrE6vL1UbKOPA2xGIqrkYm+monJa8K6mcgywCKvtrhgqORK62lpNQ=
X-Forefront-Antispam-Report: 	CIP:20.160.56.85;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(39850400004)(346002)(136003)(376002)(396003)(451199018)(5400799012)(36840700001)(46966006)(2616005)(47076005)(54906003)(34070700002)(83380400001)(82310400005)(6512007)(7416002)(6506007)(6486002)(478600001)(316002)(1076003)(26005)(5660300002)(6666004)(186003)(7636003)(36860700001)(110136005)(356005)(7596003)(86362001)(336012)(82740400003)(70586007)(40480700001)(70206006)(41300700001)(44832011)(2906002)(8936002)(8676002)(4326008)(36756003)(12100799024);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 20:13:50.6647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1cfe995-3e50-4825-0e0d-08db2a48c960
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.85];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT057.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6485
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

