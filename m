Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6FC6ACDDC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 20:19:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVpKd27kFz3fDM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:19:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=BZKVsLlR;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=BZKVsLlR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7e1a::312; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=BZKVsLlR;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=BZKVsLlR;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05hn20312.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::312])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVpGX3jX5z3c71
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 06:16:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjIdJbt11Em2nNDRR1WPmSPj/HkLDoM613BeTOUdsHY=;
 b=BZKVsLlRSnPDCs8kiou/3eigngkNaYw8Y2n+JXjvDvt4dWA31d6oGB1u//5ZGZ3AJM6GUMM7lk4vxHr8XquQLgBiL0GWWWYftiTtIlgf6PpvmoHtAAUihdRURwc/4T5Lzjj56TalnOgb82CrUflWqXdRd/5FQt0wRrLIBkLEJ69IccXMKWcvkVKVzGgETiyFJKYWAdylNGgGDdGkqe7IfyH3nQapuwhyKRGdOANOoLC+5oGJ9cpYRFad90RDdVyW+VfbLqgTNf1A7+Alq4XlmAuePbmX/LTkHuEGlNg9pX26ZI/gDH2VCn2Zd5M0I950k2Zx36Q1Xi5+Bs3Z+Q06Zw==
Received: from DB6PR0202CA0013.eurprd02.prod.outlook.com (2603:10a6:4:29::23)
 by PAWPR03MB9010.eurprd03.prod.outlook.com (2603:10a6:102:338::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Mon, 6 Mar
 2023 19:16:17 +0000
Received: from DB8EUR05FT033.eop-eur05.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::de) by DB6PR0202CA0013.outlook.office365.com
 (2603:10a6:4:29::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28 via Frontend
 Transport; Mon, 6 Mar 2023 19:16:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 20.160.56.82)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Fail (protection.outlook.com: domain of seco.com does not
 designate 20.160.56.82 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.82; helo=inpost-eu.tmcas.trendmicro.com;
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.82) by
 DB8EUR05FT033.mail.protection.outlook.com (10.233.238.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.16 via Frontend Transport; Mon, 6 Mar 2023 19:16:17 +0000
Received: from outmta (unknown [192.168.82.133])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 38A902008088E;
	Mon,  6 Mar 2023 19:16:17 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (unknown [104.47.30.106])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 0FD682008006F;
	Mon,  6 Mar 2023 19:14:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULxrQxHmh7L0hc6Z0rsnniAICdLNI9GhbqFDHbNl9uNHzE7trmJQ1klK1ynv+yjTQlBFh+zJ9LMtpwsZnRi055YiIN0sKytQZ4wO8HaqXSreh4Q7FKexhTW0Vt2ccGDdeIbiDopfSjJ2oBJQeNbgLVWTS/sXfxzbnXtMHFRUouQlie7aI840d1yAyWPSzGOA3lUzYuIgbSAunjILDlPUuTZ8t4mUyO/UBcrRMH9mjnzJBnozUq06gqJl4rqrGGo9FYZKTqA6lhxzZ5rRRcp31WXAmZAxHI6W3OMKsPabOHdhrGladZGIZge90TP8VXB+IV9OsB2WqwMPyKKhhiXyGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjIdJbt11Em2nNDRR1WPmSPj/HkLDoM613BeTOUdsHY=;
 b=fm8rU1Kugp0eFg8bYqz5o/YDjyJgauRAAPu0quuNVQx/7vLuRi/+AvH9iO4jxj/cNE39mgGzkulp2dU0Nhm/Xvb3iwqlau26DVsuZJ7F9fjmNrwA2xVb8wdTqiEJFgW6aQ/0YS4IUEfuR3+07nrJRXc5i7m+Y+Ie267XtgOrX+lf9dKjKkBOVvJ0027xsmqEAhpB5HCO4hMqsn61b1Vzv4nZpWwsFrF1ZWqZY3X0I6vf0eSnyPjQaQlvKcHcHRmrU1PETAO9Sze5rHA3h4/Yh1B+n1+8XRIofkRcJ7LmG+x+ZuNvw77zLWLFW783iPJIrs5vmJySOWG8GlPaTzD+Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjIdJbt11Em2nNDRR1WPmSPj/HkLDoM613BeTOUdsHY=;
 b=BZKVsLlRSnPDCs8kiou/3eigngkNaYw8Y2n+JXjvDvt4dWA31d6oGB1u//5ZGZ3AJM6GUMM7lk4vxHr8XquQLgBiL0GWWWYftiTtIlgf6PpvmoHtAAUihdRURwc/4T5Lzjj56TalnOgb82CrUflWqXdRd/5FQt0wRrLIBkLEJ69IccXMKWcvkVKVzGgETiyFJKYWAdylNGgGDdGkqe7IfyH3nQapuwhyKRGdOANOoLC+5oGJ9cpYRFad90RDdVyW+VfbLqgTNf1A7+Alq4XlmAuePbmX/LTkHuEGlNg9pX26ZI/gDH2VCn2Zd5M0I950k2Zx36Q1Xi5+Bs3Z+Q06Zw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB8394.eurprd03.prod.outlook.com (2603:10a6:20b:526::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Mon, 6 Mar
 2023 19:15:59 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%5]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 19:15:59 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v10 03/13] dt-bindings: Convert gpio-mmio to yaml
Date: Mon,  6 Mar 2023 14:15:25 -0500
Message-Id: <20230306191535.1917656-4-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230306191535.1917656-1-sean.anderson@seco.com>
References: <20230306191535.1917656-1-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:208:23b::20) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB8394:EE_|DB8EUR05FT033:EE_|PAWPR03MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: cf954745-d480-4379-b8e6-08db1e7742ea
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  nO+5skHtvAbW7MfNMdsEZbAGZD9Hb/uxF3jDA0H0t33Tt4FH8ZOgpJeIOKEk+SeS1P/rozAlODA7Dc/ISUO4kvNK9HO1m5jwRHcn6AR7vBe8G4WStsEgrrZjESkqYKWJuB/2CRYAjLYNxW1OHatXemNGsq9sQwCWX9Bsw331ggzwWJfim/MNi9hKaSZRchBDc5hrnLsmn0z1kpr0jQ8UMVTVUST00CDlZD+DnmerxzD+SaTZ5hk0fYM4QxxnYGug95mxO3je2mFlza0Sr6/o1IDkK1p+M1+R3fWB4UzgFPfnO6rodSYVVmuSPSYrI3OkMFb1wDzXd3NjYp21DBWIl0ugEocv4HJPGTrBQR8Tb8yRV9tMBhyrbjb4S8Et1YqiIgY8U7tHkCnVLj2C7dPFRQLqlj5pRZ4USysRLPR4Cnsrz86yYWRMCdaZkt25XOFZ0n1kphIBxWnCM1apZZ4iQpBxxNJW6n0JxcC56sly4SCBWoUyAMBJHFgcasL3uZd3Apcu4i39vtVXZ2mv60DjKxtAFQbuid750V43Edk+MbtJ3R4DJHfB4IR8mow6iVGuxK73aotw52PsHUVav0I8GE+eqo/tloW75aub3ih2qHUwa8skqWfgEB7bnXRzmrJjgCAMnvdg24oXbUHOdApfGPX7riX+cYwplNFpXXSG//izJlKbnRMiVWOVXRCUhteo
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(376002)(396003)(366004)(39850400004)(451199018)(36756003)(6666004)(66574015)(110136005)(478600001)(83380400001)(52116002)(1076003)(6486002)(966005)(6506007)(26005)(186003)(6512007)(66556008)(41300700001)(2616005)(8936002)(66476007)(4326008)(8676002)(5660300002)(66946007)(44832011)(7416002)(86362001)(2906002)(54906003)(38100700002)(316002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8394
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT033.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	628ae3f9-8f68-4728-4ece-08db1e773820
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nW+oX1KY+ExbYUHZCBoeThp+Ivn0OvnmzmV+Qx+NaZYGkn7ga2rD7p1MSu/nbDkGpxNVI3WFWKhk9pRVKCJygCvE3UzEvvbu2DzeFbZPHQFqXUhT1JA+hsrLccKkofVhBTDcEVo5ydz9QuhzY2emgdGNKMcoIXIUGrY7tk70WyJ8PzTJynYxRPJpALh7nGxQ3+gjwik6M9qkAjNlqzfu43HJBlyLbUD0Pfh1UK28eV9vOYNhirLbFBbJR+z1Law7guzJ6kWifGhgbSeoIuXxLwslSkfB32TYvurU9//eLsb6iyl3w4plSYunJX75YMwq89EGTCTeRoF4MFIPYFJnPnfKkFSKn7MMNpKDngp7dSUJ2USpiQpwTsjtz/F4wnzcHw/zs5Yy6JVxy77JkPQUXh5ESI/CegTRSzYHXkk6/T2NVrS1VKchVT5394TDj+e1U4ONI0dTy68XC3fQNrIgTLwIUxq8dEEQsgl8AjsdQ6+URAHgHEquuDHD73Ugd3taJZuEJaJZVaYP/V2uS/Vwx8eq2aV31/WhEayEdaSI9sU+S5689kZvJ6pNb6pq1gNI8xTL0Crqn3RlXAdJ7pVvN2RcYd55GDYn1Wy95EOJG17q321uooFwLCjb/V6Er8tzh0xJCgjgh2hmTc57uotijlVXMeeYvyh3PKl5sS1EAQoWxqAj9hIDJd+1BGoobO4CrjLD8mOyafVZl+65Wc0p76QjjJpWiOYoowgtXMtlm1LEoC+TKOwsKOM1IVkFHzxX
X-Forefront-Antispam-Report: 	CIP:20.160.56.82;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(346002)(396003)(376002)(136003)(39850400004)(451199018)(5400799012)(46966006)(40470700004)(36840700001)(110136005)(54906003)(36756003)(316002)(40480700001)(82310400005)(86362001)(83380400001)(26005)(6486002)(336012)(966005)(186003)(40460700003)(70206006)(5660300002)(44832011)(2906002)(70586007)(7416002)(8936002)(41300700001)(8676002)(34020700004)(82740400003)(36860700001)(4326008)(66574015)(2616005)(478600001)(6666004)(6512007)(1076003)(47076005)(6506007)(7596003)(356005)(7636003)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 19:16:17.4740
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf954745-d480-4379-b8e6-08db1e7742ea
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.82];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT033.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9010
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
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jonas Gorski <jonas.gorski@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a generic binding for simple MMIO GPIO controllers. Although we
have a single driver for these controllers, they were previously spread
over several files. Consolidate them. The register descriptions are
adapted from the comments in the source. There is no set order for the
registers, so I have not specified one.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

Changes in v10:
- New

 .../bindings/gpio/brcm,bcm6345-gpio.yaml      |  16 +--
 .../devicetree/bindings/gpio/gpio-mmio.yaml   | 136 ++++++++++++++++++
 .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 -----
 .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 -----
 4 files changed, 137 insertions(+), 91 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
index 4d69f79df859..e11f4af49c52 100644
--- a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/gpio/brcm,bcm6345-gpio.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Broadcom BCM6345 GPIO controller
+title: Broadcom BCM63xx GPIO controller
 
 maintainers:
   - Álvaro Fernández Rojas <noltari@gmail.com>
@@ -18,8 +18,6 @@ description: |+
 
   BCM6338 have 8-bit data and dirout registers, where GPIO state can be read
   and/or written, and the direction changed from input to output.
-  BCM6345 have 16-bit data and dirout registers, where GPIO state can be read
-  and/or written, and the direction changed from input to output.
   BCM6318, BCM6328, BCM6358, BCM6362, BCM6368 and BCM63268 have 32-bit data
   and dirout registers, where GPIO state can be read and/or written, and the
   direction changed from input to output.
@@ -29,7 +27,6 @@ properties:
     enum:
       - brcm,bcm6318-gpio
       - brcm,bcm6328-gpio
-      - brcm,bcm6345-gpio
       - brcm,bcm6358-gpio
       - brcm,bcm6362-gpio
       - brcm,bcm6368-gpio
@@ -63,17 +60,6 @@ required:
 additionalProperties: false
 
 examples:
-  - |
-    gpio@fffe0406 {
-      compatible = "brcm,bcm6345-gpio";
-      reg-names = "dirout", "dat";
-      reg = <0xfffe0406 2>, <0xfffe040a 2>;
-      native-endian;
-
-      gpio-controller;
-      #gpio-cells = <2>;
-    };
-
   - |
     gpio@0 {
       compatible = "brcm,bcm63268-gpio";
diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
new file mode 100644
index 000000000000..fd5c7055d542
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic MMIO GPIO
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+  - Bartosz Golaszewski <brgl@bgdev.pl>
+
+description: |
+  Some simple GPIO controllers may consist of a single data register or a pair
+  of set/clear-bit registers. Such controllers are common for glue logic in
+  FPGAs or ASICs. Commonly, these controllers are accessed over memory-mapped
+  NAND-style parallel busses.
+
+properties:
+  big-endian:
+    true
+
+  compatible:
+    enum:
+      - brcm,bcm6345-gpio # Broadcom BCM6345 GPIO controller
+      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
+      - ni,169445-nand-gpio # National Instruments 169445 GPIO NAND controller
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-controller:
+    true
+
+  reg:
+    minItems: 1
+    description: |
+      A list of registers in the controller. The width of each register is
+      determined by its size. All registers must have the same width. The number
+      of GPIOs is set by the width, with bit 0 corresponding to GPIO 0.
+    items:
+      - description: |
+          Register to READ the value of the GPIO lines. If GPIO line is high,
+          the bit will be set. If the GPIO line is low, the bit will be cleared.
+          This register may also be used to drive GPIOs if the SET register is
+          omitted.
+      - description: |
+          Register to SET the value of the GPIO lines. Setting a bit in this
+          register will drive the GPIO line high.
+      - description: |
+          Register to CLEAR the value of the GPIO lines. Setting a bit in this
+          register will drive the GPIO line low. If this register is omitted,
+          the SET register will be used to clear the GPIO lines as well, by
+          actively writing the line with 0.
+      - description: |
+          Register to set the line as OUTPUT. Setting a bit in this register
+          will turn that line into an output line. Conversely, clearing a bit
+          will turn that line into an input.
+      - description: |
+          Register to set this line as INPUT. Setting a bit in this register
+          will turn that line into an input line. Conversely, clearing a bit
+          will turn that line into an output.
+
+  reg-names:
+    minItems: 1
+    maxItems: 5
+    items:
+      enum:
+        - dat
+        - set
+        - clr
+        - dirout
+        - dirin
+
+  native-endian:
+    true
+
+  no-output:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      If this property is present, the controller cannot drive the GPIO lines.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - '#gpio-cells'
+  - gpio-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    nand-gpio-out@1f300010 {
+      compatible = "ni,169445-nand-gpio";
+      reg = <0x1f300010 0x4>;
+      reg-names = "dat";
+      gpio-controller;
+      #gpio-cells = <2>;
+    };
+
+    nand-gpio-in@1f300014 {
+      compatible = "ni,169445-nand-gpio";
+      reg = <0x1f300014 0x4>;
+      reg-names = "dat";
+      gpio-controller;
+      #gpio-cells = <2>;
+      no-output;
+    };
+
+    gpio0@e0000000 {
+      compatible = "wd,mbl-gpio";
+      reg-names = "dat";
+      reg = <0xe0000000 0x1>;
+      #gpio-cells = <2>;
+      gpio-controller;
+    };
+
+    gpio1@e0100000 {
+      compatible = "wd,mbl-gpio";
+      reg-names = "dat";
+      reg = <0xe0100000 0x1>;
+      #gpio-cells = <2>;
+      gpio-controller;
+      no-output;
+    };
+
+    gpio@fffe0406 {
+      compatible = "brcm,bcm6345-gpio";
+      reg-names = "dirout", "dat";
+      reg = <0xfffe0406 2>, <0xfffe040a 2>;
+      native-endian;
+
+      gpio-controller;
+      #gpio-cells = <2>;
+    };
diff --git a/Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt b/Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
deleted file mode 100644
index ca2f8c745a27..000000000000
--- a/Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-Bindings for the National Instruments 169445 GPIO NAND controller
-
-The 169445 GPIO NAND controller has two memory mapped GPIO registers, one
-for input (the ready signal) and one for output (control signals).  It is
-intended to be used with the GPIO NAND driver.
-
-Required properties:
-	- compatible: should be "ni,169445-nand-gpio"
-	- reg-names: must contain
-		"dat" - data register
-	- reg: address + size pairs describing the GPIO register sets;
-		order must correspond with the order of entries in reg-names
-	- #gpio-cells: must be set to 2. The first cell is the pin number and
-			the second cell is used to specify the gpio polarity:
-			0 = active high
-			1 = active low
-	- gpio-controller: Marks the device node as a gpio controller.
-
-Optional properties:
-	- no-output: disables driving output on the pins
-
-Examples:
-	gpio1: nand-gpio-out@1f300010 {
-		compatible = "ni,169445-nand-gpio";
-		reg = <0x1f300010 0x4>;
-		reg-names = "dat";
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
-	gpio2: nand-gpio-in@1f300014 {
-		compatible = "ni,169445-nand-gpio";
-		reg = <0x1f300014 0x4>;
-		reg-names = "dat";
-		gpio-controller;
-		#gpio-cells = <2>;
-		no-output;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt b/Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
deleted file mode 100644
index 038c3a6a1f4d..000000000000
--- a/Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-Bindings for the Western Digital's MyBook Live memory-mapped GPIO controllers.
-
-The Western Digital MyBook Live has two memory-mapped GPIO controllers.
-Both GPIO controller only have a single 8-bit data register, where GPIO
-state can be read and/or written.
-
-Required properties:
-	- compatible: should be "wd,mbl-gpio"
-	- reg-names: must contain
-		"dat" - data register
-	- reg: address + size pairs describing the GPIO register sets;
-		order must correspond with the order of entries in reg-names
-	- #gpio-cells: must be set to 2. The first cell is the pin number and
-			the second cell is used to specify the gpio polarity:
-			0 = active high
-			1 = active low
-	- gpio-controller: Marks the device node as a gpio controller.
-
-Optional properties:
-	- no-output: GPIOs are read-only.
-
-Examples:
-	gpio0: gpio0@e0000000 {
-		compatible = "wd,mbl-gpio";
-		reg-names = "dat";
-		reg = <0xe0000000 0x1>;
-		#gpio-cells = <2>;
-		gpio-controller;
-	};
-
-	gpio1: gpio1@e0100000 {
-		compatible = "wd,mbl-gpio";
-		reg-names = "dat";
-		reg = <0xe0100000 0x1>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		no-output;
-	};
-- 
2.35.1.1320.gc452695387.dirty

