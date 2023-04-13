Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF916E11DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 18:11:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py4MH4mytz3fZw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 02:11:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=XJs+KXWA;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=XJs+KXWA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0e::302; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=XJs+KXWA;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=XJs+KXWA;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04hn0302.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::302])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py4GT5JNcz3fQd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 02:07:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJb/+504WXHQ0vfm/r2TyP5df7En9eevt1Go5VgD+A0=;
 b=XJs+KXWAYCOFCTOcjXc3B12UfGqByJf2ThxiiSUq/FswNpJh9zmGvKffY/PHbixeuUZ88xV9u6udVxocHtqFahftT71tGgPus6SkC29BHCr9mPnl28GHVJUvSDPcfhdx+gRQ+VxJg/pSwMpVq6ecS81y0gl0HCntPaKyuT1jQ36dShibAjLffeiEmnDt0XZZ6Qk9O9EtsOgLv5vNYfU71i3VDrEImi6sXdGQH4YbijHvjvDiehMU7JPFCcRsBxVNW4r0ArJbVOroDrrTFxI3gCdnszGs4NseqcEJoUrhqzSj4S0PJ3Wc3sT0qZzMTIlRJi2gzR30NHuxdG9z6/Pv3w==
Received: from FR0P281CA0243.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:af::10)
 by AS8PR03MB9608.eurprd03.prod.outlook.com (2603:10a6:20b:5ab::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Thu, 13 Apr
 2023 16:06:54 +0000
Received: from VI1EUR05FT068.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:af:cafe::f4) by FR0P281CA0243.outlook.office365.com
 (2603:10a6:d10:af::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30 via Frontend
 Transport; Thu, 13 Apr 2023 16:06:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.82)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.82 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.82; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.82) by
 VI1EUR05FT068.mail.protection.outlook.com (10.233.242.179) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 16:06:54 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id DD79C2008026E;
	Thu, 13 Apr 2023 16:06:53 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [104.47.18.109])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 0AC9420080073;
	Thu, 13 Apr 2023 16:07:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGHt5MY/oQ73Ew5UDGWErIg+2tGQb3YZNN42iFnpN6Ol1aYj4AKeTEpoGLtxN0JEG+6MUA3t2wdrAE7KF1B0u9vDWeaiURjpia99RiJMXUrgULU8rXsuC8x1vNUweWKe6EkwLIRt/pwkz/mMo7CEXEAQ8OguKtisC1MjrTJJxQxqgJlREIO3OlZh/5Ns4VHXthl4QrvRKmaOFg/Vshg9WED9Jlsgnm41mAM4SuFMxKziUxukoJR+nnIJyYrr4yUV5/sj6Scm6Sx6VWkuFNpPQ7rdA++4jqTPMy0tHb2FnLTu00Vf7BSPm/BKZFKIfWoq9Tpzva9lLHxhWaccM+OYmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJb/+504WXHQ0vfm/r2TyP5df7En9eevt1Go5VgD+A0=;
 b=SAlJDz36FU2cRnKVopMv6hY5V5N6qNOD3YkIgC2BHuF1mD8lCQHFSlGtHBY/JHBUhlP2GOQo6RlWZK0CMLSNynyTPsgDB4I/MwKRwU7twT7PtzgvndPtn/vP8puvkG7MAmZwaq95w43gI0QVfly/IYAUMca3Kr4Ai8B7CpanxHnPHcBu00J8Ke8CNGYC+SKxMNouLiYynwNCKuIwSTsnLNnuuGaAP/BwIRdtpFlyBAh+FbKdLEtdfaAQB+nv3K62RNSVTXdh0tiyVcnPmTCNcR5nkax3OoFPEt9NlZVoSd13VdNAlCOHEOFdH/30/a20QIrWYiyHxYBRcAzjS4Wfkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJb/+504WXHQ0vfm/r2TyP5df7En9eevt1Go5VgD+A0=;
 b=XJs+KXWAYCOFCTOcjXc3B12UfGqByJf2ThxiiSUq/FswNpJh9zmGvKffY/PHbixeuUZ88xV9u6udVxocHtqFahftT71tGgPus6SkC29BHCr9mPnl28GHVJUvSDPcfhdx+gRQ+VxJg/pSwMpVq6ecS81y0gl0HCntPaKyuT1jQ36dShibAjLffeiEmnDt0XZZ6Qk9O9EtsOgLv5vNYfU71i3VDrEImi6sXdGQH4YbijHvjvDiehMU7JPFCcRsBxVNW4r0ArJbVOroDrrTFxI3gCdnszGs4NseqcEJoUrhqzSj4S0PJ3Wc3sT0qZzMTIlRJi2gzR30NHuxdG9z6/Pv3w==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS2PR03MB9369.eurprd03.prod.outlook.com (2603:10a6:20b:57b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Thu, 13 Apr
 2023 16:06:39 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 16:06:39 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v14 03/15] dt-bindings: Convert gpio-mmio to yaml
Date: Thu, 13 Apr 2023 12:05:55 -0400
Message-Id: <20230413160607.4128315-4-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230413160607.4128315-1-sean.anderson@seco.com>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::33) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS2PR03MB9369:EE_|VI1EUR05FT068:EE_|AS8PR03MB9608:EE_
X-MS-Office365-Filtering-Correlation-Id: 82bea6f6-8219-4357-f98f-08db3c39199e
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  QgzXOa9K5l/Rb5jYvRg+YhezBOVAYtIImtZ+qE8USOXC2fMcKNNbECKULnMQqMjKGGHo447A6/fAkLlvgduy1ZrEdCIapFUuSgo8PD7Oe8n6Bc/Xu0qXK90fTBUqfOJyGNhwHba6V3dLiZ40auKjZZecN+rTbRVsW3IyRpS4mfBDg/2yTm5b6mEf+TqcfJeBLQ8XlC8B1wSR5tSb6mzwHByMY2HgifP++jSPS6nfsAbdIhc0mghwo8e4JVF+0IntiPayWHubGUPPzrLocl0Vq6EXdTofbNGpKzd8ZC7PwO5FqAsugZhOpm3N3+kgxu+YFVBiEXzEQzcMTL/TDENG7vLK1jBoXoibWY7cnrhMWOeeSHbHXp/cndN+UYi2zoAeXSmBY8HnsckVvUs5VBAMjJ/jyildHV8vWPE7GUc0RkBXT0Mhu91GZNjQglq/215MT5Ub/Oq4Lt3T7Bt5TPck8s9fsoXWVmS8htoq+GsvdC2LMx3hSmKhE+tWMxsl1uL8ocmUGX9ITyYtAD8BeDIWf0jzZ6dO+S+D7XsZ8fHgP1Yx50sEktxwVikPRZx/nqFjTbCsoXey022JMO7g4KcL+Fe7HECbZU0/6UX0qO64+NU=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(39850400004)(396003)(136003)(451199021)(478600001)(52116002)(6512007)(83380400001)(36756003)(66574015)(38350700002)(2616005)(86362001)(38100700002)(30864003)(966005)(2906002)(316002)(6506007)(26005)(110136005)(186003)(1076003)(54906003)(5660300002)(44832011)(66946007)(6486002)(66476007)(6666004)(8936002)(41300700001)(66556008)(7416002)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9369
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT068.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	386baa7e-5b21-4665-103d-08db3c39105e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nHTPo9ofgMCjl0R0lCMvTQcf/PEJHywEzDuPppi+RSCNozlakPir+1vZdUGStdvaSwPserqvsjzVaimIqjmR43l/O28szGgk5OVYvd5H0esD3LSGidqcjts7TtytW+lmTtxDQTi8sYBbEvbEcVbwE7mjalRESHJ5sj/OJPLxE4qYjf4jMvrbeJ9GLuoudoC1sBihpuYgrzvLp4iC52Pav/y+ghDFK2XJUXTVUgOieKA4FqcdPoNyTVt98R6iXr651ienLK682D8kTXYiibY3gjab8SlmkvKkZkFgRvphSsxsBw1qtYyEXOHG9UA+V/tIywWbsw/d4xADicuWj8R95mrvLhzfmCVY5XSSSNLhhrypemZ0PW5fwiPN9m/kTzU6PRjCzbJXnzKs7FDVJVRkzynnVxyw24RgSBeAhEZU9RztJf6XaBVdGuTblMNnMsTqgIkko5Hvw7Bdx9f2tjp1FNFCQGMHGlRK+DU3L+QR4uyDys5BIf337vESV3xt8xy7+NsGHkohWIZx8Y+/m/tubhqAtoIvp7UFIWWZvQv4rqoEr+7Vz8uit2WAn0FDE/SAtMuxOksH8urFMEVsgKg3cAoDX0qMW43lFuPsEyiuWeEQgQ6tOgURA2ajckhzl30sZ8CNzDJ73M8O4TN9pJBAkI8+W4txJtuQTKRLg+xpLMojUrIKhxdQDbiM9QwT9yO1HPad4ivUnvT/VzdNjmGaqS58BVfL92aPX454v/+YwMSQSUIHpiktF+R4p3VvUaJX
X-Forefront-Antispam-Report: 	CIP:20.160.56.82;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(136003)(346002)(376002)(39850400004)(396003)(5400799015)(451199021)(36840700001)(46966006)(40470700004)(36860700001)(478600001)(54906003)(34070700002)(47076005)(2616005)(6512007)(966005)(26005)(1076003)(6506007)(6486002)(6666004)(7596003)(356005)(82740400003)(41300700001)(7636003)(316002)(4326008)(70206006)(186003)(66574015)(336012)(83380400001)(70586007)(30864003)(2906002)(5660300002)(7416002)(44832011)(110136005)(36756003)(82310400005)(40460700003)(86362001)(40480700001)(8676002)(8936002)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:06:54.2614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82bea6f6-8219-4357-f98f-08db3c39199e
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.82];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT068.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9608
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

Changes in v14:
- Fix incorrect $id

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

 ...m6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} |  18 +--
 .../devicetree/bindings/gpio/gpio-mmio.yaml   | 117 ++++++++++++++++++
 .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 ------
 .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 ------
 .../mfd/brcm,bcm6318-gpio-sysctl.yaml         |   4 +-
 .../mfd/brcm,bcm63268-gpio-sysctl.yaml        |   4 +-
 .../mfd/brcm,bcm6328-gpio-sysctl.yaml         |   4 +-
 .../mfd/brcm,bcm6358-gpio-sysctl.yaml         |   4 +-
 .../mfd/brcm,bcm6362-gpio-sysctl.yaml         |   4 +-
 .../mfd/brcm,bcm6368-gpio-sysctl.yaml         |   4 +-
 10 files changed, 131 insertions(+), 104 deletions(-)
 rename Documentation/devicetree/bindings/gpio/{brcm,bcm6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} (75%)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
similarity index 75%
rename from Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
rename to Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
index 4d69f79df859..62fcc2bd5d80 100644
--- a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/gpio/brcm,bcm6345-gpio.yaml#
+$id: http://devicetree.org/schemas/gpio/brcm,bcm63xx-gpio.yaml#
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

