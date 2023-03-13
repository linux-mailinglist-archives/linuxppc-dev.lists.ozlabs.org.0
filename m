Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF5B6B7D38
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 17:16:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb1xC2GGHz3fHL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 03:16:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xfdYKeYp;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xfdYKeYp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1e::301; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xfdYKeYp;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xfdYKeYp;
	dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01hn0301.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::301])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb1s401CGz3bh9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 03:12:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fLamCowzh1nTRXh7I/5z1XXvWh5IU5iHNNPU0E1Cgg=;
 b=xfdYKeYptQ/cRB36t4xEAjTuZ/YEbRfkVuOBL9MaHvjCtbiq2PF3SaCu+iSnDG7WVV+PVXAWinOogfiY4PTD7tRAR5Fxat2QDYINjeP8zDVJhoXEQruUVXP54g2Pe8J9JufLr3Mz20rkdhYwoS9qcS/7yZv1udcBGV6usw3i5ourGrpjRgVlDorPTnDhKC49Dbf4jo/dr8kG1ITRMF8HStxUBB9QJMUNAhUp/tTfkjXEJdrcUk5DJrGJJz7dM2VLdO0XO9sTBvmvvzJOsWp1IVVTLtGx0TlhFZQCPyIIkZnss5DAO+jdXFpEvQUNFXmxgt+LizppAgqN4QnjW6Xr8Q==
Received: from DB6PR07CA0058.eurprd07.prod.outlook.com (2603:10a6:6:2a::20) by
 VI1PR03MB6463.eurprd03.prod.outlook.com (2603:10a6:800:193::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.24; Mon, 13 Mar 2023 16:12:18 +0000
Received: from DB8EUR05FT004.eop-eur05.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::58) by DB6PR07CA0058.outlook.office365.com
 (2603:10a6:6:2a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Mon, 13 Mar 2023 16:12:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.83)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.83; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.83) by
 DB8EUR05FT004.mail.protection.outlook.com (10.233.238.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Mon, 13 Mar 2023 16:12:16 +0000
Received: from outmta (unknown [192.168.82.133])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 91BB22008088F;
	Mon, 13 Mar 2023 16:12:16 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [104.47.14.57])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 3A54320080075;
	Mon, 13 Mar 2023 16:03:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHMaAFJaINHIc1YHv+TVsk9F45arXcT6eCzlpFSbQEp62V4LYpGElyxOtY3s/KonifTBUmgWg1HYzzCWEYi9vC7OoZZ56X+d9xcof5XCjoZwsj4hznDbUmmLfLgw0vQpJpnCkQXqqUjf1QCe9iQFziblJuL9Rkh1hWYIrtsIwIfuzMFRtInKr+BX5+7iV48Ev+GkBpUHNs1cGl/7a/0n32v2/rHrjc7HuKUYwIE5m1EK/T9H+AL7HyOUypQqwDYRNTq9qnr8+575w6ayGqUHH6O46u5rsBeADMLiAnQIrXdxV81QiHAaumAYK7LWmDvt8cFu8+t0P529oEK9dRiDoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fLamCowzh1nTRXh7I/5z1XXvWh5IU5iHNNPU0E1Cgg=;
 b=ioT2W3qDcDSvtpm6zrO3GN6eNQPt2FAwtdNc1fNNuTRg1riZqYDdBkrd1maXCHyKuJs6pAsruiHdGXR0BbKzTtfGlfYy2tFj/lBD4nAIvC6QOJWPsqsQ4w41b5ish6tgZfqljX2GLgl0dZ+hqxPGuYrT7KgUe60eUUi3baOzDX0egmMXaLGbvS4EdFVpavXemsg9YMDr7sEk2gOX/O/k/JQ/qCG3NglYtjMP/0gUaYqMTw8eYyNxzRCcOiXpxPIo7SJH11BDqx45V/hFH6xI7Ik1PYaWBhzMo4V6NgvFYv+uJWe83Hf6J7ZEVr62661Da/MoCQganViiG6fHtLcGFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fLamCowzh1nTRXh7I/5z1XXvWh5IU5iHNNPU0E1Cgg=;
 b=xfdYKeYptQ/cRB36t4xEAjTuZ/YEbRfkVuOBL9MaHvjCtbiq2PF3SaCu+iSnDG7WVV+PVXAWinOogfiY4PTD7tRAR5Fxat2QDYINjeP8zDVJhoXEQruUVXP54g2Pe8J9JufLr3Mz20rkdhYwoS9qcS/7yZv1udcBGV6usw3i5ourGrpjRgVlDorPTnDhKC49Dbf4jo/dr8kG1ITRMF8HStxUBB9QJMUNAhUp/tTfkjXEJdrcUk5DJrGJJz7dM2VLdO0XO9sTBvmvvzJOsWp1IVVTLtGx0TlhFZQCPyIIkZnss5DAO+jdXFpEvQUNFXmxgt+LizppAgqN4QnjW6Xr8Q==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB7781.eurprd03.prod.outlook.com (2603:10a6:20b:405::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:12:11 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 16:12:11 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v11 03/13] dt-bindings: Convert gpio-mmio to yaml
Date: Mon, 13 Mar 2023 12:11:27 -0400
Message-Id: <20230313161138.3598068-4-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230313161138.3598068-1-sean.anderson@seco.com>
References: <20230313161138.3598068-1-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::11) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB7781:EE_|DB8EUR05FT004:EE_|VI1PR03MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: 391649e2-7f07-43b0-e835-08db23ddb724
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  dUWY0VD7b4CNWdqmm9IwwRR90WD9+ifnyhbXHbSdwkEqSzm2sVuualu/+PhbsFajKfJOHWY+IDLk/vlh9ngUK05qsCA2h4jthDRKgPUtQMCJLcik9QTad4/twQWwlV/6M31iT6J7qhIlMOvAwc14IrKov+hxl/NmyzDjRl56+KLzCY3A0b7WwaIPXzsN81iaZ453w520MBufmVR84cGelAHq5WA47saZJlwZJS8HRQY1fjc/qolNcWo6V0ZcxeGGCBsfOQ/nuXP5hhRrOr0KExPg0tFRAHMUHTtkLF4ZF7/OT6E9zv0SfrtReQRPxQxc/KqpeXHKimelNCDfjbHjj1wfyD7OkUUbKuV6Km5/8hhr7+fzUsw6A04azJJHsnWLy1bTnsEvFsb4rh3IS65rC+GmUl874AbSa8UzO10xyf50reMQi3pVNLPau2EhId+aoquP3oDOJIOjc91/O4K7Jhx3yS1KQ1gFHNyzH2gbjCgz6bvCCXGuJ6TQp7thjQOX0H6zqV48P8jZeV+lA8GIW5fuR68H2nwPzSFgpNwMPHMeTh/WXDkwoVewpyaeoCpIcnwApzwq4RX5mgQNIx1rh1FTAqZtfaCnDiXqmo+MvK8LsnTguI13/3pHmtKVZsyKpG7KMPU6cYRa3fnY+pOoyBdgnOrR0dzSC7GH7GH+Jix0XgsIPGMaZ1q98MOJTsau
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39850400004)(346002)(396003)(376002)(136003)(451199018)(110136005)(41300700001)(54906003)(478600001)(8676002)(4326008)(66556008)(66476007)(66946007)(8936002)(36756003)(86362001)(38350700002)(38100700002)(26005)(6512007)(1076003)(966005)(6486002)(6666004)(186003)(52116002)(44832011)(5660300002)(7416002)(2906002)(66574015)(316002)(6506007)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7781
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT004.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	c213a612-e3df-480e-5fff-08db23ddb3e4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UEHTiVdsm2vnSJ+v0U6ddnrJfcyWe0mX/vtVT05Rg8whoGp9E4jybbpz3HW7WIXcD5K8x8sOFm7sVTwM5a3MyLIamm7Gi8Joy1COgko+G0H0Zry+irgNnq9hUhGS7x2tCnyRSwUky98WPRR0ixmAaLd8a9guBEL0QHpjABrkfkCl38CVRyiHY+0/YDLUOxaoa2TNvIHf4y0PeijAPPgBHDYXrJcwvfYrnHPh8v0WfkN/0OSpwKl4dXlf7GVfBehqiOfzP4qPhjk26yU3yoWS476Jcvy2Q4oIqdZ4QJCK7FxFz5h1sUGf07GU+pe7Ish+cR3wYzrScoXauWqim6bb2EICw1YWG7cVr1hBTKUHyLQ3yZuqIwt5N9sDjrU44b+OwngkvOIPfEiDk2f9YmFSCoTuMAASL4n9hrF/xvujJWw8j5elvYE76S+r+z2KFqiILre2MFReC0zmpBv1ENPgTql3mOKh+Re0gKMyTviYAX7BsUyB6TjdTNu8YQQU/8ISeuKaaXpNSAgqgOcQWJnRqWNL7cthxbFpKUcSCRYW8AnEEAEk/YryWKXnBtEBlTxJDEJgDl/sJQ6B5TIC9rfxeYFU49g+to0ScB3f2ZgnObc3RY/Zjr0yHEeSTnC+ULXqva3oMAIaf+zq31c56U4vsx9nUjgslEPUuWmUe4KoATWDtzlO58F0sF92V3MB5r8RNWbSYMMP0zUYDhXzJzuBa5+k0XOU8inc2YYUrS9IUf0=
X-Forefront-Antispam-Report: 	CIP:20.160.56.83;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(39850400004)(346002)(396003)(376002)(136003)(5400799012)(451199018)(46966006)(36840700001)(110136005)(41300700001)(54906003)(478600001)(8676002)(4326008)(8936002)(70586007)(70206006)(36756003)(82310400005)(356005)(86362001)(40480700001)(34020700004)(36860700001)(82740400003)(7636003)(7596003)(26005)(6512007)(1076003)(966005)(6486002)(6666004)(186003)(44832011)(5660300002)(7416002)(2906002)(66574015)(316002)(6506007)(83380400001)(336012)(47076005)(2616005)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 16:12:16.9669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 391649e2-7f07-43b0-e835-08db23ddb724
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.83];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT004.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6463
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
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Linus Walleij <linus.walleij@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a generic binding for simple MMIO GPIO controllers. Although we
have a single driver for these controllers, they were previously spread
over several files. Consolidate them. The register descriptions are
adapted from the comments in the source. There is no set order for the
registers, so I have not specified one.

Rename brcm,bcm6345-gpio to brcm,bcm63xx-gpio to reflect that bcm6345
has moved.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus or Bartosz, feel free to pick this up as the rest of this series
may not be merged any time soon.

Changes in v11:
- Keep empty (or almost-empty) properties on a single line
- Don't use | unnecessarily
- Use gpio as the node name for examples
- Rename brcm,bcm6345-gpio.yaml to brcm,bcm63xx-gpio.yaml

Changes in v10:
- New

 ...m6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} |  16 +--
 .../devicetree/bindings/gpio/gpio-mmio.yaml   | 134 ++++++++++++++++++
 .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 -----
 .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 -----
 4 files changed, 135 insertions(+), 91 deletions(-)
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
index 000000000000..10a93a92ed78
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
@@ -0,0 +1,134 @@
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
+  big-endian: true
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
+    gpio@1f300014 {
+      compatible = "ni,169445-nand-gpio";
+      reg = <0x1f300014 0x4>;
+      reg-names = "dat";
+      gpio-controller;
+      #gpio-cells = <2>;
+      no-output;
+    };
+
+    gpio@e0000000 {
+      compatible = "wd,mbl-gpio";
+      reg-names = "dat";
+      reg = <0xe0000000 0x1>;
+      #gpio-cells = <2>;
+      gpio-controller;
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

