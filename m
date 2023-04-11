Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F3C6DE449
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 20:49:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pwvyf0lxkz3fRM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 04:49:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=tqvxw0Q6;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=tqvxw0Q6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0e::310; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=tqvxw0Q6;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=tqvxw0Q6;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04hn0310.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::310])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pwvsr4r65z3bgr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 04:45:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uK3k9a/CWqGjwoOwoaDDQ9hA8T+Zb0e74q/+VvHGAiw=;
 b=tqvxw0Q668YmlAlCWTBuRtWYUB1iOEYPjseh1bnllQ9ozyROe6Y2Awalk4JJ2HsdHvZanDZu+s1kiyfUfqUzRsh6AMgbe2lCe9mrMBpybH4CWqQEP3yNZcfS6uxckDDEvPbLb/sLR9CExl2CPQaoVit2YlUm9+/az3JDJEwwExeDi22U72C6VDk0s5LBrjY3GDRwM71q4cd5rthmJg+n3wTMfUgz6iBwyE278i8IMCqzYSKj1QHuWWQDQ+aFlUI1YCOsFS1WwgGBvVk8xYVN09kKiM532dM7m2XFRMRNn4MChHRTHUt7/Kp64yIH3N6ymxCDTekzOUexi731elpOQA==
Received: from AM9P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::17)
 by AS8PR03MB8347.eurprd03.prod.outlook.com (2603:10a6:20b:523::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Tue, 11 Apr
 2023 18:44:59 +0000
Received: from AM6EUR05FT004.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:21f:cafe::44) by AM9P195CA0012.outlook.office365.com
 (2603:10a6:20b:21f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Tue, 11 Apr 2023 18:44:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.80)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.80 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.80; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.80) by
 AM6EUR05FT004.mail.protection.outlook.com (10.233.240.227) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.21 via Frontend Transport; Tue, 11 Apr 2023 18:44:59 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id E49D12008026E;
	Tue, 11 Apr 2023 18:44:58 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (unknown [104.47.51.239])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id D235320080077;
	Tue, 11 Apr 2023 18:46:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+pAnDlJus683L00t4cADyAiGNofjOKvN5dtf8tDH25Kh0mwm+YRFGWy0FfBI8jhJsZ7OHAyumE5o6vYtPCGW7HdRSJankgb/CEdoz+6LL4PkqNaUhcvGNVj9AwV70VWJ9/YLowxUwOQESJxZ/PJWIm3jH6t/8RyIeGWe2rJkMQNP6WLyVd81eOAPq1mkNlzkORqOHIBWiYvucvMCa5uBoV8PQQnrW+73ydgZx5Vl0VZ0W9KlMmo9Q8/VKlGrRSfyokaqauhEtVac47lfn9StEbf4rLBOiZqh1WrOhtMQE0wYg9UIJIjKHt2+lqhscO+x3SHvM2qFKdZvfEUyPYZbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uK3k9a/CWqGjwoOwoaDDQ9hA8T+Zb0e74q/+VvHGAiw=;
 b=FnhrlrHn4mJc8VpgnwvHtvzNrU3aYDQhRsvNx5QrvW1Z458Q1MIgBuUn9QKR6IxR4wBhFVbuVBWRfIfrq5uT3WYaZYhzT8tpFCW57UyNcGLlSjwZqo1tD0Gt39VOIF2k4TlvqMv4l4Znwc/S6iZt4zXHepUMEdzVmPaNLIHj1qZfP5bT1UbSyZE49I8RwgAQDMx7e57Pa3rnhTfUqL9m+9xZiKdu9WNdm0frrcV4W7IAD+OkLI8R3kPbu+9QPncPKvGVrpxA/Qddj6KOUMxViRnFEUgx3F9b0Uv8mKsoggAmTN5LV36CuoYs0H1QLZzrgrwxzJo5BxVC5qIuGJD5OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uK3k9a/CWqGjwoOwoaDDQ9hA8T+Zb0e74q/+VvHGAiw=;
 b=tqvxw0Q668YmlAlCWTBuRtWYUB1iOEYPjseh1bnllQ9ozyROe6Y2Awalk4JJ2HsdHvZanDZu+s1kiyfUfqUzRsh6AMgbe2lCe9mrMBpybH4CWqQEP3yNZcfS6uxckDDEvPbLb/sLR9CExl2CPQaoVit2YlUm9+/az3JDJEwwExeDi22U72C6VDk0s5LBrjY3GDRwM71q4cd5rthmJg+n3wTMfUgz6iBwyE278i8IMCqzYSKj1QHuWWQDQ+aFlUI1YCOsFS1WwgGBvVk8xYVN09kKiM532dM7m2XFRMRNn4MChHRTHUt7/Kp64yIH3N6ymxCDTekzOUexi731elpOQA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB4PR03MB9433.eurprd03.prod.outlook.com (2603:10a6:10:3fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 18:44:44 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6277.035; Tue, 11 Apr 2023
 18:44:44 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v13 03/15] dt-bindings: Convert gpio-mmio to yaml
Date: Tue, 11 Apr 2023 14:43:00 -0400
Message-Id: <20230411184313.3679145-4-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230411184313.3679145-1-sean.anderson@seco.com>
References: <20230411184313.3679145-1-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0350.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::25) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DB4PR03MB9433:EE_|AM6EUR05FT004:EE_|AS8PR03MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c1a1bdb-3c70-49c9-8f13-08db3abcda22
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  HyZd45xN4yrFO70SRKLTdQQ9/QKFQ+ZaurbNUE+gFrpFq/P7TgG+nJBQ520LUmUHnmwL6bfMkAo79EhKYebTfojYEEyvShLZMFUVpx3dwds4GGUXgjhHvvjT3HngwUwtNX6Sbx6u3bs8RSImBpTEaUeFS9VVnLE/fgtgg0J8TikKNzM0kA4AYjg+n5Yh7QvVVSC5fO45doJLJb0/lpObt/00Khykr49I1ywnEitI7JJNaxqKV3Lhejkf6S9mQ2sDr02DYvxhehrhCWRwxbEqYucPz0mgpbG/X2zOiVOmjtAfy2SasUN9nfU6VI+gPOJjNsirmMlZv485U05jXjEaYWFeWh7k7Virb9qTTwT4IIGxAWmd65qW7VKRoCirvUjKHqQQS27Ofj61TPUzgC0ybe9bwShGUMl9FCu6dy01bc5/Q6alfZSiHrDwjPDeh4A/32mhpMss59WyIxFN/Yt7hqBTwKK/jYmmnCjGeSJoRiO1x5zkvrjU8ZIlp+QL4Mc8of2deU2CJF+dGBrwN3jyidU5W+w/043UDtix4hJNhTG4vLCvX200iDiFEpKUOM/EZTIq6ypcsGNHdWBfapH/13VNZ0lQ7Ltr1OBr5v4nFG4=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39850400004)(396003)(136003)(376002)(346002)(451199021)(316002)(110136005)(38350700002)(38100700002)(54906003)(66556008)(66476007)(8676002)(66946007)(4326008)(86362001)(478600001)(66574015)(186003)(2616005)(26005)(41300700001)(36756003)(6506007)(1076003)(6512007)(2906002)(83380400001)(30864003)(44832011)(8936002)(6666004)(52116002)(5660300002)(7416002)(966005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9433
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT004.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	d26c822b-95d5-40fa-803d-08db3abcd16d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	BrWtBPyvdhSntheaYik6cuJIOpqbv4ftom+uD4U6wVTDQlgzLPL5zEvkHqEfizYj41WNKaweJzInm9OEoEgOx3RbdulY4AFmEhAcWMJ+wZj+HAALEj77BaOCSNtngDDQmXuzxiOLzhXhslD27uEtOjjhus10TzeGIL3tReSLdCp5inFb8mo9ssUYWJrZJOsQMtIv3jLGLQAZNq0Jd04C5MUL/ZyWw68k7CE1mV+2tTwCVpeEAeT/hSjLIl5/GyEXAarEut3hawFEcBOO61D3EsRNjaFBATZ15lPVMroOsYF+CDkEMAuGCNjpi/Stqh0k43XgsGp1zebWPWmf0Ns51mQpUukWqRYfe3SbbMVHvPvteuv5htCEOKYIyrJhxFZ3/fkeVgzVSvLnIRKQkdCD/Dn7NRiU+vgOUNd/qnUE6CT7kyHj+zgEwTekPV0Xe7iajGPJhBon9pk9MxTeG+zWF3xJMad8mXThYh58sduRTlTfRtgW2B2t4DqGp1vGBkSSOhAoKgbLmnVVTT/3tGcAeBEVBETnTTCDUo1jap4frxVfKh/O9qZY/90OkmDumrHvHsSaXn6GCqhkY+9E5lPylam7M+11UI4nqlbI5j/QCxf8nHbS3p5XwZMBB7L58PbeKfTmmrTnVcyAi5bkOjoH7OihpejmxMiTUqXNSXcMvVnMBJiF3GiuxpzUqJAOlbvRE5ave7Wz4ln0AhZK7/41ttV48f8PMLSy8rRESiRCDUyhrIWQ3W2WiZoYA4Uw6Ah1
X-Forefront-Antispam-Report: 	CIP:20.160.56.80;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(396003)(39850400004)(5400799015)(451199021)(40470700004)(46966006)(36840700001)(478600001)(70586007)(86362001)(47076005)(40480700001)(40460700003)(36756003)(66574015)(83380400001)(82740400003)(7596003)(7636003)(356005)(2616005)(36860700001)(336012)(34070700002)(316002)(30864003)(2906002)(44832011)(6506007)(110136005)(1076003)(7416002)(6486002)(186003)(54906003)(26005)(6512007)(8676002)(966005)(41300700001)(6666004)(82310400005)(5660300002)(70206006)(8936002)(4326008)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 18:44:59.0549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1a1bdb-3c70-49c9-8f13-08db3abcda22
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.80];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT004.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8347
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

Changes in v13:
- Fix references to brcm,bcm63xx-gpio.yaml (neé brcm,bcm6345-gpio)

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
 .../mfd/brcm,bcm6318-gpio-sysctl.yaml         |   4 +-
 .../mfd/brcm,bcm63268-gpio-sysctl.yaml        |   4 +-
 .../mfd/brcm,bcm6328-gpio-sysctl.yaml         |   4 +-
 .../mfd/brcm,bcm6358-gpio-sysctl.yaml         |   4 +-
 .../mfd/brcm,bcm6362-gpio-sysctl.yaml         |   4 +-
 .../mfd/brcm,bcm6368-gpio-sysctl.yaml         |   4 +-
 10 files changed, 130 insertions(+), 103 deletions(-)
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
diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
index 148f1da47603..9f9a14af875e 100644
--- a/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
@@ -35,11 +35,11 @@ patternProperties:
   "^gpio@[0-9a-f]+$":
     # Child node
     type: object
-    $ref: "../gpio/brcm,bcm6345-gpio.yaml"
+    $ref: "../gpio/brcm,bcm63xx-gpio.yaml"
     description:
       GPIO controller for the SoC GPIOs. This child node definition
       should follow the bindings specified in
-      Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml.
+      Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml.
 
   "^pinctrl@[0-9a-f]+$":
     # Child node
diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml
index 7e582243ea76..803277dd2725 100644
--- a/Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml
@@ -35,11 +35,11 @@ patternProperties:
   "^gpio@[0-9a-f]+$":
     # Child node
     type: object
-    $ref: "../gpio/brcm,bcm6345-gpio.yaml"
+    $ref: "../gpio/brcm,bcm63xx-gpio.yaml"
     description:
       GPIO controller for the SoC GPIOs. This child node definition
       should follow the bindings specified in
-      Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml.
+      Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml.
 
   "^pinctrl@[0-9a-f]+$":
     # Child node
diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6328-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm6328-gpio-sysctl.yaml
index 2230848e11c3..b9a6856ce970 100644
--- a/Documentation/devicetree/bindings/mfd/brcm,bcm6328-gpio-sysctl.yaml
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6328-gpio-sysctl.yaml
@@ -35,11 +35,11 @@ patternProperties:
   "^gpio@[0-9a-f]+$":
     # Child node
     type: object
-    $ref: "../gpio/brcm,bcm6345-gpio.yaml"
+    $ref: "../gpio/brcm,bcm63xx-gpio.yaml"
     description:
       GPIO controller for the SoC GPIOs. This child node definition
       should follow the bindings specified in
-      Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml.
+      Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml.
 
   "^pinctrl@[0-9a-f]+$":
     # Child node
diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml
index c06693b6f7aa..4651fe4dde07 100644
--- a/Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml
@@ -35,11 +35,11 @@ patternProperties:
   "^gpio@[0-9a-f]+$":
     # Child node
     type: object
-    $ref: "../gpio/brcm,bcm6345-gpio.yaml"
+    $ref: "../gpio/brcm,bcm63xx-gpio.yaml"
     description:
       GPIO controller for the SoC GPIOs. This child node definition
       should follow the bindings specified in
-      Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml.
+      Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml.
 
   "^pinctrl@[0-9a-f]+$":
     # Child node
diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6362-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm6362-gpio-sysctl.yaml
index c560bede0e37..0330b621fd38 100644
--- a/Documentation/devicetree/bindings/mfd/brcm,bcm6362-gpio-sysctl.yaml
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6362-gpio-sysctl.yaml
@@ -35,11 +35,11 @@ patternProperties:
   "^gpio@[0-9a-f]+$":
     # Child node
     type: object
-    $ref: "../gpio/brcm,bcm6345-gpio.yaml"
+    $ref: "../gpio/brcm,bcm63xx-gpio.yaml"
     description:
       GPIO controller for the SoC GPIOs. This child node definition
       should follow the bindings specified in
-      Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml.
+      Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml.
 
   "^pinctrl@[0-9a-f]+$":
     # Child node
diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6368-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm6368-gpio-sysctl.yaml
index c534f5f2404e..82d3e4415bda 100644
--- a/Documentation/devicetree/bindings/mfd/brcm,bcm6368-gpio-sysctl.yaml
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6368-gpio-sysctl.yaml
@@ -35,11 +35,11 @@ patternProperties:
   "^gpio@[0-9a-f]+$":
     # Child node
     type: object
-    $ref: "../gpio/brcm,bcm6345-gpio.yaml"
+    $ref: "../gpio/brcm,bcm63xx-gpio.yaml"
     description:
       GPIO controller for the SoC GPIOs. This child node definition
       should follow the bindings specified in
-      Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml.
+      Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml.
 
   "^pinctrl@[0-9a-f]+$":
     # Child node
-- 
2.35.1.1320.gc452695387.dirty

