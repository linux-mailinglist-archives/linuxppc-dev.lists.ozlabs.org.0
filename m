Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA436C3B9F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 21:20:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ph2zQ2sNBz3fXL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 07:20:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=fxpU7IV5;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=fxpU7IV5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1f::307; helo=eur01-ve1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=fxpU7IV5;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=fxpU7IV5;
	dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01hn0307.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1f::307])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ph2r627fDz3cdc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 07:14:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/g9U9YLEf9E/jAxo24sDj/7iF84qhM8WSA36wTORsA=;
 b=fxpU7IV5oe3+cSYpxlaGyfDO5f0tHZjNa2SY4nerfciQHFWKoaAtRkXhGRffHeTH7rM6kzshlaOrluCVETOjAKC4DUsJ1XzmwscnLgRRgke/YC+fYgs3IKFCNPMs5vV+3qQKJDJD+Ywwd0dKdDay2iLvqXFTdXs2MQMBR97Tgz8TR8KDSr+P2tnRGpl9Z5evOd6j+3s7GqZg97Dw/UTV2vA2yMPPH2sJNu9W/rFAzqGVJoUDzJmjScN2Lw72Y7XIc5RBf9m8mLUw9QwQKMJAe14gIarSm6W8Lab0y5lQLyjV4xxk49RHgdF0KLYijU+eiAeGCdaX1s4glL1TubWAuw==
Received: from ZR2P278CA0027.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:46::19)
 by VI1PR03MB6221.eurprd03.prod.outlook.com (2603:10a6:800:134::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:13:55 +0000
Received: from VI1EUR05FT012.eop-eur05.prod.protection.outlook.com
 (2603:10a6:910:46:cafe::6e) by ZR2P278CA0027.outlook.office365.com
 (2603:10a6:910:46::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 20:13:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.87)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.87; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.87) by
 VI1EUR05FT012.mail.protection.outlook.com (10.233.243.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.17 via Frontend Transport; Tue, 21 Mar 2023 20:13:54 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 408CD2008026E;
	Tue, 21 Mar 2023 20:13:54 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (unknown [104.47.51.176])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 2E0AC20080074;
	Tue, 21 Mar 2023 20:12:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuKdnODob/PepkJEBVC91zTX84tpljlsoQKzPbCEqCDBbeYA47FPxyKMPIWr0HWAPEGr6Q9miYNhKIUjjEXVfgkHvb7po9DGWC9CBSDD5afBN16oBOHiqQldpxjy2aIURG5Q/PTNdwCPZ3gKK92nzD4L1UyhlSX9LGgyHykfN9z7ICsae/CuJ7gKxwPtU52mfVU92Qg5mH5FNCZePaPMqefZfkpNe9HrvMh/7bZ0XS5Kl5bm0SMEzOi6u73lJ2fOmzC4u20PFIXWLvnHxhXyqURqCI6sl67GQAfkW9zXQPZ9FOGHYBixnbHy1SjPyqOGxBN6+kvhwYi/P/Mlu0NQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/g9U9YLEf9E/jAxo24sDj/7iF84qhM8WSA36wTORsA=;
 b=B4wXWI4dYwa8Frttb9Czyu2n0ZYa+jf+qefo2Yg9ei5FgvZwzw0QM57udKLvyUIpl4sBdOMKSX/8vBp+UhlloWhtLFNfFpaFHs8i/Nj82zRN4ptu95jSU6FegoLm7/UnPUYVLTYscmk8ou26yXvBFo3KrrBKf66vUiNeA+I4clk5IPheNnaig24ftkf7s5FSUpWCnqyrJphAeV95hQvHBu/XPddILkyrHLPGhmVMNKBB/c0zD5zMRwQxov3oVxgDwckpHY53+GEaHV8s8zLdAtD9hdVzRYeYItVb+J44qGV9s3jhP3rKu8BK5sSOBtmH36BdliI2K0uhZpWHu1znIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/g9U9YLEf9E/jAxo24sDj/7iF84qhM8WSA36wTORsA=;
 b=fxpU7IV5oe3+cSYpxlaGyfDO5f0tHZjNa2SY4nerfciQHFWKoaAtRkXhGRffHeTH7rM6kzshlaOrluCVETOjAKC4DUsJ1XzmwscnLgRRgke/YC+fYgs3IKFCNPMs5vV+3qQKJDJD+Ywwd0dKdDay2iLvqXFTdXs2MQMBR97Tgz8TR8KDSr+P2tnRGpl9Z5evOd6j+3s7GqZg97Dw/UTV2vA2yMPPH2sJNu9W/rFAzqGVJoUDzJmjScN2Lw72Y7XIc5RBf9m8mLUw9QwQKMJAe14gIarSm6W8Lab0y5lQLyjV4xxk49RHgdF0KLYijU+eiAeGCdaX1s4glL1TubWAuw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM9PR03MB7044.eurprd03.prod.outlook.com (2603:10a6:20b:2d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:13:38 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 20:13:37 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v12 03/13] dt-bindings: Convert gpio-mmio to yaml
Date: Tue, 21 Mar 2023 16:13:02 -0400
Message-Id: <20230321201313.2507539-4-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230321201313.2507539-1-sean.anderson@seco.com>
References: <20230321201313.2507539-1-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR20CA0026.namprd20.prod.outlook.com
 (2603:10b6:208:e8::39) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AM9PR03MB7044:EE_|VI1EUR05FT012:EE_|VI1PR03MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: 02f4a09c-b505-4093-e53e-08db2a48cbb0
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  6s4Mm2WXQ8rz0H2+Wx79s9OcNcQWfbezJV+X3RK+zO7z8Ybeufv4gs9zmkjvk8evKEoDHOVhzL06fJV+igpQMcpxhiHSxItsFjlTyU+ei2WM3WDpJXu+sRpvSbEbJ11+bjeCKvu0baOB8fsTzoSuB9hyR3o6bkvgi2S651g9vrU4Z3UTzgwDYV4t4sRb3sIxLklCTqlyYKNvbiXDAVfqcG4hQB9Z1tBZiMow1yQr+dDNBsqu+hrOwamL61QfAy551Dyi3WPSzF0j1JfJC1Af+OlwmbUalvhYm0KWGG5HVtxFD+qSssm5w4ItUAF9gjdEvk08zTbFRQqBd8omVeehAxt26/i+dDwHQRGQsdKT5hnVXdKK8mmWBwFeOxzl5VcDUrgVrKJHSwBnsLomJrO2obIAHGtQi2muNR8AxbXVEhDNsnwMaOcelHWeUGKsKksAMdXdTU7v3aTrxHpRP5fkdvNjWlIrXhL/hbY1GKVBLDQweeRepalBQbbBUhXjqgq4DPXE6yW2LRpcly4Tatz91Y8wDLTTqGk50CVLoP3uxTREpQqbaVpmJSLIR48XGB3bln5esSaWvoQ/xnW4vm2Q7VFfYU7s05AjA3G/wrw7B2EutgFDgVjo0e+gCImUWZFa4jum4clIQUZsbIPH0mZxVNO+/UdO9cN4gR6OqsysbG+JheX3kDSe3odH992JWDuK
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199018)(2616005)(66574015)(54906003)(83380400001)(6512007)(7416002)(6506007)(6486002)(966005)(478600001)(316002)(1076003)(26005)(52116002)(5660300002)(6666004)(186003)(110136005)(86362001)(38350700002)(38100700002)(66946007)(41300700001)(44832011)(2906002)(8936002)(66476007)(66556008)(8676002)(4326008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7044
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT012.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	2c42121b-b270-4fdb-f14c-08db2a48c1a9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	L0PaAg5OY3ve7YGcNuEl7jieTlEOtGSahTwXFA3LbAwadQWzhlLF4F93jXMfjGuQuecpFHZm8F9Br7gn+PskK79HaDRlXdNJguJJHhqhnnUWSeLo9d3fGkCb0k/ZIyvTfxiOLXtLrvjgMh5JSeuFtPi1pluyPcQiXBy9P3DES0nu4p+sOqlKZXvDBlyjOkavSvLASOBoyxRIIJ4stbYH+LIlOmI9/YZydlHqDdaJ2hjuApH0qcEmmhO0Z7oDK5ETNIlMlMbIzZxVrY7XG2oCe7LFYBbZEzTmzMHR/QxGy3x10aArI/swI1Y3q50KJTRP1yVVtHFFBs8xfR6mD67OUxRsQ8ROSvPGZy+jj832H4S8b/PFn9XLCDNCM4/G0E+qhEgGrIWq1PpsgeOtACUCI26Wo92VMzn6tEvue+4Cpqv6icqTAjMUdo+BLIvRVN66SlLkcN2NF0io/pP8jmTVfgV543HCz2voXIp7EihHudXNIyc25Qd5j1LX3+1k6TYg6nPNXDmkqNk0IOfpCWmqCoqYrJK7/DhuwfvV5D5NaHEJ82GuzViq3lkf7rO9A2X1SUJHeZPOAT26FL/jd09tuCLoVPVD0jvClg6TwIqF3Ms//hL9ENMSOmwSBTB+tq4Nh/aZd12NxdeJt/WdMZ6TUU8QNdSW2isnPfnYczFBeMqoTKVUDT3M0u7YqJgWJ5Fkgw2gNh1/RxRgg07uXA+7zrNVGpoaAKuPD1lp+F94jj8=
X-Forefront-Antispam-Report: 	CIP:20.160.56.87;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(376002)(396003)(346002)(39850400004)(136003)(5400799012)(451199018)(36840700001)(46966006)(2616005)(66574015)(47076005)(54906003)(34070700002)(83380400001)(82310400005)(6512007)(7416002)(6506007)(6486002)(966005)(478600001)(316002)(1076003)(26005)(5660300002)(6666004)(186003)(7636003)(36860700001)(110136005)(356005)(7596003)(86362001)(336012)(82740400003)(70586007)(40480700001)(70206006)(41300700001)(44832011)(2906002)(8936002)(8676002)(4326008)(36756003)(12100799024);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 20:13:54.5499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f4a09c-b505-4093-e53e-08db2a48cbb0
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.87];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT012.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6221
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
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Linus Walleij <linus.walleij@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a generic binding for simple MMIO GPIO controllers. Although we
have a single driver for these controllers, they were previously spread
over several files. Consolidate them. The register descriptions are
adapted from the comments in the source. There is no set order for the
registers, and some registers may be omitted. Because of this, reg-names
is mandatory, and no order is specified.

Rename brcm,bcm6345-gpio to brcm,bcm63xx-gpio to reflect that bcm6345
has moved.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus or Bartosz, feel free to pick this up as the rest of this series
may not be merged any time soon.

Changes in v12:
- Put compatible first
- Keep gpio-controller to one line
- Add little-endian property
- Alphabetize compatibles
- Remove some comments
- Remove some examples with insufficient novelty

Changes in v11:
- Keep empty (or almost-empty) properties on a single line
- Don't use | unnecessarily
- Use gpio as the node name for examples
- Rename brcm,bcm6345-gpio.yaml to brcm,bcm63xx-gpio.yaml

Changes in v10:
- New

 ...m6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} |  16 +--
 .../devicetree/bindings/gpio/gpio-mmio.yaml   | 117 ++++++++++++++++++
 .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 ------
 .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 ------
 4 files changed, 118 insertions(+), 91 deletions(-)
 rename Documentation/devicetree/bindings/gpio/{brcm,bcm6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} (78%)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
similarity index 78%
rename from Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
rename to Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
index 4d69f79df859..e11f4af49c52 100644
--- a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
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
index 000000000000..b394e058256e
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
@@ -0,0 +1,117 @@
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
+description:
+  Some simple GPIO controllers may consist of a single data register or a pair
+  of set/clear-bit registers. Such controllers are common for glue logic in
+  FPGAs or ASICs. Commonly, these controllers are accessed over memory-mapped
+  NAND-style parallel busses.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm6345-gpio
+      - ni,169445-nand-gpio
+      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
+
+  big-endian: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-controller: true
+
+  little-endian: true
+
+  reg:
+    minItems: 1
+    description:
+      A list of registers in the controller. The width of each register is
+      determined by its size. All registers must have the same width. The number
+      of GPIOs is set by the width, with bit 0 corresponding to GPIO 0.
+    items:
+      - description:
+          Register to READ the value of the GPIO lines. If GPIO line is high,
+          the bit will be set. If the GPIO line is low, the bit will be cleared.
+          This register may also be used to drive GPIOs if the SET register is
+          omitted.
+      - description:
+          Register to SET the value of the GPIO lines. Setting a bit in this
+          register will drive the GPIO line high.
+      - description:
+          Register to CLEAR the value of the GPIO lines. Setting a bit in this
+          register will drive the GPIO line low. If this register is omitted,
+          the SET register will be used to clear the GPIO lines as well, by
+          actively writing the line with 0.
+      - description:
+          Register to set the line as OUTPUT. Setting a bit in this register
+          will turn that line into an output line. Conversely, clearing a bit
+          will turn that line into an input.
+      - description:
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
+  native-endian: true
+
+  no-output:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
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
+    gpio@1f300010 {
+      compatible = "ni,169445-nand-gpio";
+      reg = <0x1f300010 0x4>;
+      reg-names = "dat";
+      gpio-controller;
+      #gpio-cells = <2>;
+    };
+
+    gpio@e0100000 {
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

