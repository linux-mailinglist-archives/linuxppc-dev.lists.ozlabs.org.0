Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB346B7D29
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 17:14:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb1v61YRPz3cj0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 03:14:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=nz0hg+9z;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=nz0hg+9z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0c::320; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=nz0hg+9z;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=nz0hg+9z;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04hn0320.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::320])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb1s374wTz3bgr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 03:12:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59SQBEH3AfsZR6ImQtjw4Hzj+qikHduW0/M5DS0gEws=;
 b=nz0hg+9zeioqPE7u+zE0s5wUFN75BglYXKTuzexTSifoCQxQU/5S+Tib7hFdKt/flLvWpE+ABavSjuxpXI9Qz6I2tBrzKqBEGa16JNZ1xuIohOAOKIombGkpXz+rF//1+Fz+ZU4OZYKA3PoB9fvS3YkeYYP5EIdPHlJIuCUiKRHDQJqtR61DlY31YlDrdSzST89uBVHfZTNgiGk2s0QCiQbW2lF5+UePi8sS585KpZcZ5vGwxYBvYX4vbz4q15QEuE1vmNRTCeW4QYQXHFmBJOBkm+jVQgZg4JJR6jBoy5adg9ch90D0rbmfRHk7T1GwpeJOGGQoU9+Txzu7uxJ1jQ==
Received: from AS9PR04CA0105.eurprd04.prod.outlook.com (2603:10a6:20b:50e::27)
 by AM9PR03MB7849.eurprd03.prod.outlook.com (2603:10a6:20b:430::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:12:18 +0000
Received: from AM6EUR05FT062.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:50e:cafe::86) by AS9PR04CA0105.outlook.office365.com
 (2603:10a6:20b:50e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Mon, 13 Mar 2023 16:12:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.87)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.87; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.87) by
 AM6EUR05FT062.mail.protection.outlook.com (10.233.240.254) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Mon, 13 Mar 2023 16:12:16 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id B64C720080273;
	Mon, 13 Mar 2023 16:12:16 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [104.47.14.52])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id A49782008006F;
	Mon, 13 Mar 2023 16:10:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/O34+NjZnyeUEALjyKxEYk7rx9eHCMZPiW+RQ9YWXv/diet1MYpqgoDSGwAufpXFPaIhS7rYh+TSLkeHzU8ZUkCnKdQXOzmjBHeqeBYUG4K5lB6X05dzAPFmyw1qI3T7ecqFPBg/rEPboARfwh+P9ela6lCDNKsyPIaAjSgaUabw81M47EyVGfFbrwKGtqbyaJOaG9HurhqLNkpIeJiXKliMXZCgePc7peZa1XULtSXEyPSvp+/vHreMExtj7Su04SeG0fVOuY+xEoG1F3SYWS0pweeI1SgVZ+V73dSbq947vIlvjDwQ0WVs6QPBeq+KAEqQ7cbUEF4XsrfINPXZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59SQBEH3AfsZR6ImQtjw4Hzj+qikHduW0/M5DS0gEws=;
 b=lhpqIQatL/vN0p3kIEqtsPEYGHvYQo6IPXmKyy+OcJ9ZyrX5n4kXKinPEcbYbYF/kduPIgSIPBzKRwrwc8k3MW9vzejPG/eK2k9NKXOgzg0Lx7/PgH+Wq9MDQnqvgwxYPvp5RpMqfKJYE+W7e2NoZzDU/o/XtXmuVR4nqZhcZlFKQdL26vQ4xI2tcnTHCZj6Lt2BDiehVx8HBFv4ezJ19zCfUtmoJQtGVb+jztTcpRk3fISOBsMfYZJC05y7BySmmfGfJ8S/oihrr7WBEWNW5uOLNk4skjiEdekmSQLMBPp+QZUfiBfT56P7aW+3+D9PZcHeyeNMvKZXWd+GChx7OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59SQBEH3AfsZR6ImQtjw4Hzj+qikHduW0/M5DS0gEws=;
 b=nz0hg+9zeioqPE7u+zE0s5wUFN75BglYXKTuzexTSifoCQxQU/5S+Tib7hFdKt/flLvWpE+ABavSjuxpXI9Qz6I2tBrzKqBEGa16JNZ1xuIohOAOKIombGkpXz+rF//1+Fz+ZU4OZYKA3PoB9fvS3YkeYYP5EIdPHlJIuCUiKRHDQJqtR61DlY31YlDrdSzST89uBVHfZTNgiGk2s0QCiQbW2lF5+UePi8sS585KpZcZ5vGwxYBvYX4vbz4q15QEuE1vmNRTCeW4QYQXHFmBJOBkm+jVQgZg4JJR6jBoy5adg9ch90D0rbmfRHk7T1GwpeJOGGQoU9+Txzu7uxJ1jQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB7781.eurprd03.prod.outlook.com (2603:10a6:20b:405::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:12:06 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 16:12:06 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v11 00/13] phy: Add support for Lynx 10G SerDes
Date: Mon, 13 Mar 2023 12:11:24 -0400
Message-Id: <20230313161138.3598068-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::11) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB7781:EE_|AM6EUR05FT062:EE_|AM9PR03MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: 3394703c-c416-47c0-b44b-08db23ddb711
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  AxdZo//gBilkZzOELK5j2m/iV0B8RzUn++4GmnHI4K08X/T1TObuR93ZggLs+Du9cAbm6rXr+Mh9QRV7gENE/Lu/ARFx2itZy2PlRDRIAhjW5np6QGylNqKjKrDjcMN/KDv/pjMB31IxRHLPZ14My/l9c++S2P7wqJKpBEmL8H9KJxo0L/UdplkVG/UTkc+p/qn8e4bieWpwFhVFHfTV26w85sN97gOgnbHxVMNNDrTc1Tna8Q2ZTJrTXDY2fn8ZxDEsVxKpNkSz3idFwsrCzlhnTf3dqZpl4/MqJdo+LMhT4ZbVNedgOfAButdykLgDOox/FYHOjQ37gLBlbu1GuN95rQT3dhBwuhFGkiq2KeAqGn2HBSmUDt/+2/1wuwf+eF1AKgTw7rT+emIvo3rWBP9tqZou/fWpSw0EmYB4CDqQFfHhTPAL+xbOZjNEjxH74vtLZNR7+x+UryeMMOjAPiDYMHpvLaNhykK1AtVIBmqc1XUQWOmkY9/ql4Jy+otf44+BagFEM+OOubmzbnd7oOj0YRSFR2/kOKspLlFxiL2LgxEq1c5AFHOLJwdFIS5XsOlGLfaatRR1deBnRn0zVeja4UyPX49JgwtgFs171K/kc2cZ6FB56cYUwDDXCgKkaewYG18k5BDMm92sfh9vGSmvLQg1mR6p4b3715PNUMdcrFea8rYy2cDLRl7NNUTshPqKcAPYcwXY6opOpJx9bw==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39850400004)(346002)(396003)(376002)(136003)(451199018)(110136005)(41300700001)(54906003)(478600001)(8676002)(4326008)(66556008)(66476007)(66946007)(8936002)(36756003)(86362001)(38350700002)(38100700002)(26005)(6512007)(1076003)(6486002)(6666004)(186003)(52116002)(30864003)(44832011)(5660300002)(7416002)(2906002)(316002)(6506007)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7781
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT062.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	19196007-a896-47d8-d063-08db23ddb0bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	FyOKlkz9HNmj7EakKDZyaCAI22TIrTVCx65vkArcn1QAuEErF4dqtwbwF1DfRZYxeBBnrBH0OKsUbSUOTu2M3QZbs9BFNCGoUgdC8FQ3+PBEqJpPauZafyB6K/eDe8fV8TdzP25YapKK7rWqFwDhojujvBRhAGNX/5l/opAyymOwdgC2m7R/6REDKWfr7w6aS9w0vGuxPwddT8w3jxNxzVHowICehb6f9vf4jSrUvUEdFV9KMGbJE9Abv1sZCvNLbkQXlF7gIfFs5eDfT6cynfuhwIR619ftc0HOxEeM24Ilz2a5CNZt7Kiog3yh/40Yj8VJZD/laT6u/tAfWvE3l2h0rmX0FI7KrOyHJbhS8zOJXmSmOXh9NbvhhxtgJGjXvfMVu+Gk0oGzGFXuFyT2S1S0TMpuen8SdHh2G/dS2B2SVlR9BuoXDs6jWVy3DT47IBNaGZ3P1mDh7RKHRIltT1kkw7h7jpIsfsc61Sbk/WJJ861LL0ohF/uCNVt6pwlfIX6mf0O386imkhlck7nIlF8S6KKz6S2mxta48LuIrFEwuyTQ//rWkKXphunsLs4Q946h8NjNUmIuXDYMi3QB9zMps9FvsAlaXnNEe/c4SEivjFeDDRCcLT3lI4pJ/YsRXEFwX7/JaNG88qyPPPC5KDvcJdyTXktgakNQleim8tIvhyRIp1/96+YzDqMS04+pjMVlgakaWhRRUhcwer6lQB0iJ0FehYCdBr4RhBQ6juvHUvBNWZhPn7KzLDisKGCRovxqlO33/Rx7xZe93CsjXQ==
X-Forefront-Antispam-Report: 	CIP:20.160.56.87;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(346002)(396003)(376002)(39850400004)(136003)(5400799012)(451199018)(36840700001)(46966006)(40470700004)(336012)(2616005)(7416002)(186003)(44832011)(6512007)(6506007)(26005)(1076003)(8936002)(83380400001)(34020700004)(6666004)(82310400005)(36860700001)(356005)(82740400003)(30864003)(6486002)(47076005)(5660300002)(40460700003)(4326008)(70206006)(2906002)(8676002)(40480700001)(70586007)(41300700001)(7596003)(7636003)(110136005)(316002)(478600001)(36756003)(54906003)(86362001)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 16:12:16.8723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3394703c-c416-47c0-b44b-08db23ddb711
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.87];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT062.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7849
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
Cc: =?UTF-8?q?Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-doc@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>, linux-clk@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Sean Anderson <sean.anderson@seco.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Madalin Bucur <madalin.bucur@nxp.com>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, linuxppc-dev@lists.ozlabs.org, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds support for the Lynx 10G SerDes found on the QorIQ T-series
and Layerscape series. Due to limited time and hardware, only support
for the LS1046ARDB and LS1088ARDB is added in this initial series.

This series is ready for review by the phy maintainers. I have addressed
all known feedback and there are no outstanding issues.

Major reconfiguration of baud rate (e.g. 1G->10G) does not work. From my
testing, SerDes register settings appear identical. The issue appears to
be between the PCS and the MAC. The link itself comes up at both ends,
and a mac loopback succeeds. However, a PCS loopback results in dropped
packets. Perhaps there is some undocumented register in the PCS?

I suspect this driver is around 95% complete, but I don't have the
documentation to make it work completely. At the very least it is useful
for two cases:

- Although this is untested, it should support 2.5G SGMII as well as
  1000BASE-KX. The latter needs MAC and PCS support, but the former
  should work out of the box.
- It allows for clock configurations not supported by the RCW. This is
  very useful if you want to use e.g. SRDS_PRTCL_S1=0x3333 and =0x1133
  on the same board. This is because the former setting will use PLL1
  as the 1G reference, but the latter will use PLL1 as the 10G
  reference. Because we can reconfigure the PLLs, it is possible to
  always use PLL1 as the 1G reference.

Changes in v11:
- Keep empty (or almost-empty) properties on a single line
- Don't use | unnecessarily
- Use gpio as the node name for examples
- Rename brcm,bcm6345-gpio.yaml to brcm,bcm63xx-gpio.yaml

Changes in v10:
- Convert gpio-mmio to yaml
- Add compatible for QIXIS
- Remove unnecessary inclusion of clk.h
- Don't gate clocks in compatibility mode
- Fix debugging print with incorrect error variable
- Move serdes bindings to SoC dtsi
- Add support for all (ethernet) serdes modes
- Refer to "nodes" instead of "bindings"
- Move compatible/reg first

Changes in v9:
- Add fsl,unused-lanes-reserved to allow for a gradual transition
  between firmware and Linux control of the SerDes
- Change phy-type back to fsl,type, as I was getting the error
    '#phy-cells' is a dependency of 'phy-type'
- Convert some u32s to unsigned long to match arguments
- Switch from round_rate to determine_rate
- Drop explicit reference to reference clock
- Use .parent_names when requesting parents
- Use devm_clk_hw_get_clk to pass clocks back to serdes
- Fix indentation
- Split off clock "driver" into its own patch to allow for better
  review.
- Add ability to defer lane initialization to phy_init. This allows
  for easier transitioning between firmware-managed serdes and Linux-
  managed serdes, as the consumer (such as dpaa2, which knows what the
  firmware is doing) has the last say on who gets control.
- Fix name of phy mode node
- Add fsl,unused-lanes-reserved to allow a gradual transition, depending
  on the mac link type.
- Remove unused clocks
- Fix some phy mode node names

Changes in v8:
- Remove unused variable from lynx_ls_mode_init
- Rename serdes phy handles to use _A, _B, etc. instead of _0, _1, etc.
  This should help remind readers that the numbering corresponds to the
  physical layout of the registers, and not the lane (pin) number.
- Prevent PCSs from probing as phys
- Rename serdes phy handles like the LS1046A
- Add SFP slot binding
- Fix incorrect lane ordering (it's backwards on the LS1088A just like it is in
  the LS1046A).
- Fix duplicated lane 2 (it should have been lane 3).
- Fix incorrectly-documented value for XFI1.
- Remove interrupt for aquantia phy. It never fired for whatever reason,
  preventing the link from coming up.
- Add GPIOs for QIXIS FPGA.
- Enable MAC1 PCS
- Remove si5341 binding

Changes in v7:
- Use double quotes everywhere in yaml
- Break out call order into generic documentation
- Refuse to switch "major" protocols
- Update Kconfig to reflect restrictions
- Remove set/clear of "pcs reset" bit, since it doesn't seem to fix
  anything.

Changes in v6:
- Bump PHY_TYPE_2500BASEX to 13, since PHY_TYPE_USXGMII was added in the
  meantime
- fsl,type -> phy-type
- frequence -> frequency
- Update MAINTAINERS to include new files
- Include bitfield.h and slab.h to allow compilation on non-arm64
  arches.
- Depend on COMMON_CLK and either layerscape/ppc
- XGI.9 -> XFI.9

Changes in v5:
- Update commit description
- Dual id header
- Remove references to PHY_INTERFACE_MODE_1000BASEKX to allow this
  series to be applied directly to linux/master.
- Add fsl,lynx-10g.h to MAINTAINERS

Changes in v4:
- Add 2500BASE-X and 10GBASE-R phy types
- Use subnodes to describe lane configuration, instead of describing
  PCCRs. This is the same style used by phy-cadence-sierra et al.
- Add ids for Lynx 10g PLLs
- Rework all debug statements to remove use of __func__. Additional
  information has been provided as necessary.
- Consider alternative parent rates in round_rate and not in set_rate.
  Trying to modify out parent's rate in set_rate will deadlock.
- Explicitly perform a stop/reset sequence in set_rate. This way we
  always ensure that the PLL is properly stopped.
- Set the power-down bit when disabling the PLL. We can do this now that
  enable/disable aren't abused during the set rate sequence.
- Fix typos in QSGMII_OFFSET and XFI_OFFSET
- Rename LNmTECR0_TEQ_TYPE_PRE to LNmTECR0_TEQ_TYPE_POST to better
  reflect its function (adding post-cursor equalization).
- Use of_clk_hw_onecell_get instead of a custom function.
- Return struct clks from lynx_clks_init instead of embedding lynx_clk
  in lynx_priv.
- Rework PCCR helper functions; T-series SoCs differ from Layerscape SoCs
  primarily in the layout and offset of the PCCRs. This will help bring a
  cleaner abstraction layer. The caps have been removed, since this handles the
  only current usage.
- Convert to use new binding format. As a result of this, we no longer need to
  have protocols for PCIe or SATA. Additionally, modes now live in lynx_group
  instead of lynx_priv.
- Remove teq from lynx_proto_params, since it can be determined from
  preq_ratio/postq_ratio.
- Fix an early return from lynx_set_mode not releasing serdes->lock.
- Rename lynx_priv.conf to .cfg, since I kept mistyping it.

Changes in v3:
- Manually expand yaml references
- Add mode configuration to device tree
- Rename remaining references to QorIQ SerDes to Lynx 10G
- Fix PLL enable sequence by waiting for our reset request to be cleared
  before continuing. Do the same for the lock, even though it isn't as
  critical. Because we will delay for 1.5ms on average, use prepare
  instead of enable so we can sleep.
- Document the status of each protocol
- Fix offset of several bitfields in RECR0
- Take into account PLLRST_B, SDRST_B, and SDEN when considering whether
  a PLL is "enabled."
- Only power off unused lanes.
- Split mode lane mask into first/last lane (like group)
- Read modes from device tree
- Use caps to determine whether KX/KR are supported
- Move modes to lynx_priv
- Ensure that the protocol controller is not already in-use when we try
  to configure a new mode. This should only occur if the device tree is
  misconfigured (e.g. when QSGMII is selected on two lanes but there is
  only one QSGMII controller).
- Split PLL drivers off into their own file
- Add clock for "ext_dly" instead of writing the bit directly (and
  racing with any clock code).
- Use kasprintf instead of open-coding the snprintf dance
- Support 1000BASE-KX in lynx_lookup_proto. This still requires PCS
  support, so nothing is truly "enabled" yet.
- Describe modes in device tree
- ls1088a: Add serdes bindings

Changes in v2:
- Rename to fsl,lynx-10g.yaml
- Refer to the device in the documentation, rather than the binding
- Move compatible first
- Document phy cells in the description
- Allow a value of 1 for phy-cells. This allows for compatibility with
  the similar (but according to Ioana Ciornei different enough) lynx-28g
  binding.
- Remove minItems
- Use list for clock-names
- Fix example binding having too many cells in regs
- Add #clock-cells. This will allow using assigned-clocks* to configure
  the PLLs.
- Document the structure of the compatible strings
- Rename driver to Lynx 10G (etc.)
- Fix not clearing group->pll after disabling it
- Support 1 and 2 phy-cells
- Power off lanes during probe
- Clear SGMIIaCR1_PCS_EN during probe
- Rename LYNX_PROTO_UNKNOWN to LYNX_PROTO_NONE
- Handle 1000BASE-KX in lynx_proto_mode_prep
- Use one phy cell for SerDes1, since no lanes can be grouped
- Disable SerDes by default to prevent breaking boards inadvertently.

Sean Anderson (13):
  dt-bindings: phy: Add 2500BASE-X and 10GBASE-R
  dt-bindings: phy: Add Lynx 10G phy binding
  dt-bindings: Convert gpio-mmio to yaml
  dt-bindings: gpio-mmio: Add compatible for QIXIS
  dt-bindings: clock: Add ids for Lynx 10g PLLs
  clk: Add Lynx 10G SerDes PLL driver
  phy: fsl: Add Lynx 10G SerDes driver
  phy: lynx10g: Enable by default on Layerscape
  arm64: dts: ls1046a: Add serdes nodes
  arm64: dts: ls1046ardb: Add serdes descriptions
  arm64: dts: ls1088a: Add serdes nodes
  arm64: dts: ls1088a: Prevent PCSs from probing as phys
  arm64: dts: ls1088ardb: Add serdes descriptions

 ...m6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} |   16 +-
 .../devicetree/bindings/gpio/gpio-mmio.yaml   |  140 ++
 .../bindings/gpio/ni,169445-nand-gpio.txt     |   38 -
 .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |   38 -
 .../devicetree/bindings/phy/fsl,lynx-10g.yaml |  248 ++++
 Documentation/driver-api/phy/index.rst        |    1 +
 Documentation/driver-api/phy/lynx_10g.rst     |   58 +
 MAINTAINERS                                   |    9 +
 .../boot/dts/freescale/fsl-ls1046a-rdb.dts    |   26 +
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |  111 ++
 .../boot/dts/freescale/fsl-ls1088a-rdb.dts    |   82 +-
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |  156 ++-
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-fsl-lynx-10g.c                |  510 +++++++
 drivers/phy/freescale/Kconfig                 |   23 +
 drivers/phy/freescale/Makefile                |    1 +
 drivers/phy/freescale/phy-fsl-lynx-10g.c      | 1224 +++++++++++++++++
 include/dt-bindings/clock/fsl,lynx-10g.h      |   14 +
 include/dt-bindings/phy/phy.h                 |    2 +
 include/linux/phy/lynx-10g.h                  |   16 +
 20 files changed, 2611 insertions(+), 103 deletions(-)
 rename Documentation/devicetree/bindings/gpio/{brcm,bcm6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} (78%)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
 create mode 100644 Documentation/driver-api/phy/lynx_10g.rst
 create mode 100644 drivers/clk/clk-fsl-lynx-10g.c
 create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g.c
 create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h
 create mode 100644 include/linux/phy/lynx-10g.h

-- 
2.35.1.1320.gc452695387.dirty

