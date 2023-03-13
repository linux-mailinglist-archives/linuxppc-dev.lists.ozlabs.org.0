Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E33E6B7D3C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 17:17:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb1yF2s8wz3chr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 03:17:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=1ZI4bveF;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=1ZI4bveF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1a::326; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=1ZI4bveF;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=1ZI4bveF;
	dkim-atps=neutral
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03hn20326.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1a::326])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb1s372nlz3bgX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 03:12:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuWWQvpCYY4W8sGx7yslnrMrtjET67Lp15S4hO7s3Tg=;
 b=1ZI4bveFJcxRAxQY0a1bKRXVFvBEE2PMlYTHc+jXRtYGpmrFyRFIqNPEaDaOhCtPvgZZwnyWzv0S4ds55J1KIfXjyfRBadjDfkfSVhWxGWosEE1eYGaKqlKiqumOHuAvA9fdHPBKk/n6EDK+cnAxAhwPXAafAgl15rKh4fHSplII9LoF+JK62leNO7Lc+wmCXY0pe6lpj94BMUN96xXUIFtnbBQBPEZQxnkzD5aiH3M+RtlVaanPqCv7Is8UJs0dU4PXJ1bC4q4Jq4IgGlZ6eM+Qr9GBGnO5qp7P2VTcNy4/WKfjDRje8ENZIcuj6FCISOTO2R2489urEA8JChNwlA==
Received: from AM6P191CA0062.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::39)
 by DU0PR03MB8809.eurprd03.prod.outlook.com (2603:10a6:10:412::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:12:19 +0000
Received: from VI1EUR05FT042.eop-eur05.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::c7) by AM6P191CA0062.outlook.office365.com
 (2603:10a6:209:7f::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Mon, 13 Mar 2023 16:12:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.82)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.82 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.82; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.82) by
 VI1EUR05FT042.mail.protection.outlook.com (10.233.242.112) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Mon, 13 Mar 2023 16:12:18 +0000
Received: from outmta (unknown [192.168.82.133])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id B78EA2008088A;
	Mon, 13 Mar 2023 16:12:17 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [104.47.14.57])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 821A420080077;
	Mon, 13 Mar 2023 16:03:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lREEbYhqgdJWFeU0NP+PiBqc6+jPSangDojAgC+gbSSmgmWBj7Frd/nulGicS28BdrwSfVhIHUesL7iRVWZMJWa5Be/6/d5bMfPl5aEmC3KKPiBdRxq3HjD9yilESfkX2/ZoEvrcoCxL6YmixuPhTc0oygOKk88+oc9hMh/+cuQzPXDJKwYLEwtweWvYYWw4FFt1wMraOGXYNyvKXkrbcxdSK1VBc211NMGyEfrJ0fxtaewOql3GrA2xyeIznop7fqXXUzEg/C0w2LgdtJ+uaO24eOtMU5LJD98jSINwLNoTF3iHSkuTB7sXHQ95bHc/+X+zHoL5bEQqyBc6E3YLuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuWWQvpCYY4W8sGx7yslnrMrtjET67Lp15S4hO7s3Tg=;
 b=Y5LzcsE94ZWqpT2VMp9tyKLmJL0TFKrqTlIml1ZONEk6D0IJPaJrQhNI8cpM3fIBDnPQpGjKwPCgFq5tl6ti3wAA3X0ziPURbbtHjhR6EKd1n6o+H1NV6RHV5tr8H8JY3GMcZmdWi2dmjtOvMIiQkxjqJLL5dUtg45pr9qP0/0jQTFzwGVx9qtU8+Vh8SWFXBiT7MvHJrzRWCc8pkpkYJHWBjwDlVmzlD5NEmic3N2O3xfMla8s9NrlyEaqnbeOqLnJGFvnxj7hr0mwJhGsmeLtM0Ij6hJBz8dmr95vvIi6JWXFK/6al4TGXzf/qHcoHEejN/WJT61cFI3bGIL519Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuWWQvpCYY4W8sGx7yslnrMrtjET67Lp15S4hO7s3Tg=;
 b=1ZI4bveFJcxRAxQY0a1bKRXVFvBEE2PMlYTHc+jXRtYGpmrFyRFIqNPEaDaOhCtPvgZZwnyWzv0S4ds55J1KIfXjyfRBadjDfkfSVhWxGWosEE1eYGaKqlKiqumOHuAvA9fdHPBKk/n6EDK+cnAxAhwPXAafAgl15rKh4fHSplII9LoF+JK62leNO7Lc+wmCXY0pe6lpj94BMUN96xXUIFtnbBQBPEZQxnkzD5aiH3M+RtlVaanPqCv7Is8UJs0dU4PXJ1bC4q4Jq4IgGlZ6eM+Qr9GBGnO5qp7P2VTcNy4/WKfjDRje8ENZIcuj6FCISOTO2R2489urEA8JChNwlA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB7781.eurprd03.prod.outlook.com (2603:10a6:20b:405::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:12:13 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 16:12:13 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v11 04/13] dt-bindings: gpio-mmio: Add compatible for QIXIS
Date: Mon, 13 Mar 2023 12:11:28 -0400
Message-Id: <20230313161138.3598068-5-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230313161138.3598068-1-sean.anderson@seco.com>
References: <20230313161138.3598068-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::11) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB7781:EE_|VI1EUR05FT042:EE_|DU0PR03MB8809:EE_
X-MS-Office365-Filtering-Correlation-Id: 809976e8-49ce-4f1b-2972-08db23ddb7cc
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  dS/82cYNNs5xcBUezU5KxG6+GCducdD/iQujdBXKxx15PhckWW4zWtOABe1P34IdyGn3lHFFKqqxpjmlz+MbIAP7s791Gdlb6qeqzcKggDINtzqw1kTE5m0jtRYM6VyKoEeGqK+ifXOiN4L/Zbe9YBkzyDBEX3Nc7DLOO/XcbNDQuwrKFSrMC+6Hn7DQnDNKcQgegHgp1NTNB9SllFS9nfuNRmnthyYgRciLCOZXj/4boLiUx1JW24XHNn5wLgsi4FV56qlWG/YnEE5S2S8dNpP4nJPlpvr5HAZPEU3ydCnQkAcruSlNdVY99y9L7KLY7sTvxFvntCq9niNtf5ympWjb7yXiEdKygwaHp9jLqUZIqzHs4Rh+lVwfvZbZOqo7RiyuuhMeHkxe394BAKi9psLnGVO1oxEWzvEBodZhJRInnC7X0xIx/NfVfF34WcxqMAXMyq8awFMtX2nvq2BnpokTLONXMsv5H++L17ZRxVjZX4HNHKPn4IMkf6dNzOkm62Btw4yTXCi4piiq6MrKRSMhq593xvc17zrTnxRkPFTgwqH1/hpP6b3h/85S6LlWE2CJjTSJDXTXXCcoXdq00+kcFAwxWgsZjzjnOD33aNP7x5co3KtWSQh4THvA4o0sjuglJjodvfdeKVEG1TEUbCFASna472RuTtYC3Y2br/8b52aJI/2mAmZhnkOM05Wjs0BQpD63MW1VKA50h79OLQ==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39850400004)(346002)(396003)(376002)(136003)(451199018)(110136005)(41300700001)(54906003)(478600001)(8676002)(4326008)(66556008)(66476007)(66946007)(8936002)(36756003)(86362001)(38350700002)(38100700002)(26005)(6512007)(1076003)(6486002)(6666004)(186003)(52116002)(44832011)(5660300002)(7416002)(2906002)(316002)(6506007)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7781
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT042.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	39fd92b9-2d03-4bc1-571d-08db23ddb4d2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/FLWPa970dGgpPQVnzaTUS96P+glzJZDeTuNsOmtg9cYscCqr5lSeOHhHDUuho4GTqitV0yr/wHO8kOBR2xyC7u+5+9GUQrEuS9OU0EcjTIe2etU9HtWrUJ6YzUICaTmX6PEDgFKMCeYO1Ew64IfnyPlneqQf5oDh688W5jjK8KPdeAcOvuBsegfdmuz4US+9iqkaAR1BqvaJXXTXsuUvIa5msanhiS6DVWZL3ULdLBwT4EF3BlSjwgFFBtrSyOespvYvDB8m7pUSmjHebxfTS/acPQJcCgxf9NxBOuFPAIgmDzxfqDgGT5c+TvPnywaI8OlQnDPxBxdcHoLPlb48kAMwG6QLBOZSYoSgk7f300qIM8KnDcswirYfaKq9P7iyixmaZfUACRl1t000fHN/o1gSzBIt9j4MuZyMysoLR0C1WvT/ib/MxOlpsj12ACNKa/JMVSE+OQT3oeCQp1HaoRysqb3y/vj6IW9tu5F/aMrhqj52Qu6m66zWkKHAmN2t5RBHM3OmCcGX7KDNJrzkDhvjWXXhU//zINruU+o5uMFWjdcRXNO3iU4yHuVaTsx7GfA+hcCT7aKEM2BCCJGHU/X3BGqwLzFqQlGRpWIBLZC0KovA+KaxgSDSCWZreg56iJMIIzPS5MZBmFoH2OteUmb+2sp3nbxlOhcgnZ2ZrWVV08mbR9HYyaJllr1Ruvh7zflZBMBMhNbLjBGdvPyDUxqoGeDny2+rR5BNFbFvDjKdjoZj6HwTaHMLAPl+yMzHKsjnkv1UVgHUebQA4cKGA==
X-Forefront-Antispam-Report: 	CIP:20.160.56.82;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(136003)(39850400004)(396003)(376002)(346002)(5400799012)(451199018)(40470700004)(46966006)(36840700001)(36756003)(2906002)(7416002)(5660300002)(8936002)(44832011)(41300700001)(36860700001)(82740400003)(7596003)(7636003)(86362001)(356005)(34020700004)(6666004)(70586007)(478600001)(70206006)(8676002)(6486002)(54906003)(2616005)(4326008)(40460700003)(40480700001)(82310400005)(336012)(110136005)(316002)(83380400001)(47076005)(186003)(6506007)(1076003)(6512007)(26005)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 16:12:18.0631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 809976e8-49ce-4f1b-2972-08db23ddb7cc
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.82];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT042.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8809
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
Cc: devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
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
index 10a93a92ed78..67975a464c59 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
@@ -20,10 +20,16 @@ properties:
   big-endian: true
 
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

