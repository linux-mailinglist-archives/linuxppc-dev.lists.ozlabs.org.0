Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 254AE6ACDCE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 20:18:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVpJY6jwYz3fK8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:18:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=c2aPxwFf;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=c2aPxwFf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1e::31e; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=c2aPxwFf;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=c2aPxwFf;
	dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01hn031e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::31e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVpGW4cXXz3bWj
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 06:16:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+PTdU68ROUDTzanIFirhbaQ/lFAZPXotOkmBSzLFI0=;
 b=c2aPxwFfbKFrxmock/ORwyAd/jqBUOgwAdZRrct95rZX1x01UpSXq737TmgQ1dQRD6G5ExA8Idmq0BN+rSW/l+KAHy89EW/fK/XgAVn+11TNsVVTrEgEmB/X0PjGJpe3ov4aXjBNUt2q+Lct6dI/u8lNr0ZtsrRWJiKWrIaDuqlzShwAZUfQHBjdo+hOlhBJY3yYXLoQ6lle+A/RAoJyhke5/uuL/gp12WuVWTF7Ql639GPQ0K9NsY7B/as8N0tJ1AYnbbS3HR87p2w2zplu7pFazxV3iZFvSQ83t6l7Y0eP+Co74x0fMYRTgMFS+ileBiq8JbF4AeSoXMm87uihew==
Received: from DB6PR07CA0105.eurprd07.prod.outlook.com (2603:10a6:6:2c::19) by
 DBAPR03MB6517.eurprd03.prod.outlook.com (2603:10a6:10:19a::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.28; Mon, 6 Mar 2023 19:16:09 +0000
Received: from DB8EUR05FT003.eop-eur05.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::74) by DB6PR07CA0105.outlook.office365.com
 (2603:10a6:6:2c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.15 via Frontend
 Transport; Mon, 6 Mar 2023 19:16:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 20.160.56.81)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Fail (protection.outlook.com: domain of seco.com does not
 designate 20.160.56.81 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.81; helo=inpost-eu.tmcas.trendmicro.com;
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.81) by
 DB8EUR05FT003.mail.protection.outlook.com (10.233.238.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.16 via Frontend Transport; Mon, 6 Mar 2023 19:16:09 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 28C2D2008026C;
	Mon,  6 Mar 2023 19:16:09 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (unknown [104.47.30.106])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 5D5C52008006F;
	Mon,  6 Mar 2023 19:14:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzZdoMRrsiNPftMk0xKOxWmVrZII4e6VkhG0rGvalEYn1vLRd4bOFkG2/Nch5jMwG1YNxeJwCA7clQUuo6sCwqbCbx7RJK7iTPuBWCQZPZjQwn7ldfRBbQoBkVUvgum5edPgQZyz0fFufwnjYaaDkUwAyyZvMCEG/vnxC7y+W0kD73OpcGXHaBKNfwtTLi1n4DYhFe4drhf4hBJyawFLrN9mFlMW2j1NZtngqTk23dsZ81URrA17qRwaEIiOJAdDU8AC/CoKoqExy05zwM5ngjUbv4ysYJL7IcwnQvdsE3cjymLQ4K6NHmr+yC9ShJOld64f4P3ruc8K+gb8u9dHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+PTdU68ROUDTzanIFirhbaQ/lFAZPXotOkmBSzLFI0=;
 b=mUY1rceaIv5PvA19/SW6cb1AqoCN4n2I2MxMGVHhJcCU4dZHJ0RWAriIzmAuh3JLb4H59N0h1CWD+8kbIN7l2C2wQq5hMO+oIg2ljyUMRSvzq6vf4UsQpC8zbHdQgbuljEjkdEVE6QhvRL3FGCjTJjhAuMMfMTaJRtIbkU2y3esNlDJ+9zlw0einNG35p70lqyQPvBvZ+sUm9dUkwQd70V8zwpwYET6dJZtwfZX4CSBGLhZY8MQcvnF0bizUAGGB0EdiOfhIy7fhcCzzy1awGDK4buEJEufRztzJ6pygDq6Rm9vYXQXEKKeEEjvO4ZPgtrT0jX4hvGQAwUt/bTugzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+PTdU68ROUDTzanIFirhbaQ/lFAZPXotOkmBSzLFI0=;
 b=c2aPxwFfbKFrxmock/ORwyAd/jqBUOgwAdZRrct95rZX1x01UpSXq737TmgQ1dQRD6G5ExA8Idmq0BN+rSW/l+KAHy89EW/fK/XgAVn+11TNsVVTrEgEmB/X0PjGJpe3ov4aXjBNUt2q+Lct6dI/u8lNr0ZtsrRWJiKWrIaDuqlzShwAZUfQHBjdo+hOlhBJY3yYXLoQ6lle+A/RAoJyhke5/uuL/gp12WuVWTF7Ql639GPQ0K9NsY7B/as8N0tJ1AYnbbS3HR87p2w2zplu7pFazxV3iZFvSQ83t6l7Y0eP+Co74x0fMYRTgMFS+ileBiq8JbF4AeSoXMm87uihew==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB8394.eurprd03.prod.outlook.com (2603:10a6:20b:526::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Mon, 6 Mar
 2023 19:15:54 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%5]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 19:15:54 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v10 00/13] phy: Add support for Lynx 10G SerDes
Date: Mon,  6 Mar 2023 14:15:22 -0500
Message-Id: <20230306191535.1917656-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:208:23b::20) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB8394:EE_|DB8EUR05FT003:EE_|DBAPR03MB6517:EE_
X-MS-Office365-Filtering-Correlation-Id: 38683ffa-e904-49a3-33c2-08db1e773e18
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  6bbeVqyLFR6aTu01VW5X6JcGJz3NPPJYX745l8uJm0zm1jqnGPjIK9G0a3xZVrKzxY9StxReMmMEYH5fPwvtsa2g8zrxVEGMHdg4+wmo0dfU3xk0sBTWK0FcoissyfYoJ/tuuDrBZqV4LHGKgHghlk9vGL4Q9xsO1rK06npDnN6VZx5D/1x+Dkk9K1uhsdwro3cppBbUqIUpFgSYv4SPgB2rn7LgT7rrpBpP/hJljWWf3DgX6PpBkKks12V2doX1Mm/gF5CU2qy4HuN4k7HlUePuPY27uz5SXsVEvwlDOEYu1sxtC7tJXPu0Dm+NBVHyXU+PBQiT0lVeJihy2yDxIcpaJtyDCoMOqoKvFdiP1aozU52JQJf80y54T+953BGukzpG3P92vpDqpoKoz8MsvJAtRRgqmjremvGuSssXaoPt92L3NxfEoHlvuS+Pzpm03W+QO+uzwsIF6gYbHz4iIGcrx1mxsi+07h1eYk18jgw8x1yyjxYohqLP41760HFi6AfnY9a2uwjEu+rJqeRInO+ZuYjbduI0DuYyCMCu2DpPhx4lAgKIUCxUDnh+2IuutD2i2CjOh5YZrS1iaNyoJIXg9xdFMmXMK0sJ+0d4fPXIsEz29c53K+0EVP3X1aqlbaVy1rRC4RHziOumF/8uydH+hVZp1aOyUHlhooaMmxRhr3WVQKs1s4vlZWA3auEa
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(376002)(396003)(366004)(39850400004)(451199018)(36756003)(6666004)(110136005)(478600001)(83380400001)(52116002)(1076003)(6486002)(966005)(6506007)(26005)(186003)(6512007)(66556008)(41300700001)(2616005)(8936002)(66476007)(4326008)(8676002)(5660300002)(30864003)(66946007)(44832011)(7416002)(86362001)(2906002)(54906003)(38100700002)(316002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8394
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT003.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	10eb6858-77c9-413f-b004-08db1e7734e4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fZqEEKCMamnQArmCRPy6COMCG1bDoY8oIgRHFmrWRtAdZuoFpKTwzh4op1fVMi9NC+gwcqtzGZ7UIGIYyVjgkCM0x+2dxqRMIvda4ltVMLU8dOfSIaGAeXkpBZ4GWI48dMpoymg1vukuk2rcqnjE1/cIGDrf0IUlVFEpzsxRuXGAlDAn8AoE2hbwEwEW3U4gaTWzdsS7j4AEWcyan0DmVZa68KD/1q9q0PWso5dIbLjKPXvfeQcoAKcGnmNTb7bQjddME7BRV21HGSnSamxcFtwCQWhqAVx7A+EOjd+wxUf2sHb6Uv2moSHmGtqIPR9siXgoYLOLaNxU+KgVlacIJgJ7/UbQkrryiBZoe1mOCHLHmXcg86I7zUEJpLtFoQmRLt7GDOS9HMxPX7aidrUWpHV8ihJvdoJWvmuIdjcW/nO0HspHUqVB3jzdCpll6sOzrt4pqvgqnl+CV2+TOb1isB9anIfpgjwD6z8iP4OQarRk2pr0nG7ZAB9QpdWFHGP44Cv1zSQvVovaPf1cK60PFXtuSndzzqnRgnOGmuMOTSIlyoFru4CYeHxgOvb2pOaJcJkA4aa4kGuNXcrvCahs2Z7ccUbzff6kET9YbtyLqi/cuPy0j+DsJ2Lf8yAjy60PZgCXYYU63jt+peL5BLtKS4bFtyqVXGczEJmit0jGtMLlkbbtESHZCKA6TQC/pl/75OE7372OgPJGLSeMvL1wzUB4cJ5c4DUs9ZgwbmBwAzs=
X-Forefront-Antispam-Report: 	CIP:20.160.56.81;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(136003)(376002)(346002)(396003)(39850400004)(5400799012)(451199018)(46966006)(36840700001)(82310400005)(82740400003)(34020700004)(36860700001)(83380400001)(47076005)(36756003)(110136005)(478600001)(54906003)(356005)(316002)(7596003)(7636003)(336012)(966005)(6486002)(2616005)(6666004)(6512007)(6506007)(1076003)(186003)(26005)(41300700001)(5660300002)(30864003)(7416002)(44832011)(70586007)(8936002)(70206006)(2906002)(40480700001)(86362001)(4326008)(8676002)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 19:16:09.3834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38683ffa-e904-49a3-33c2-08db1e773e18
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.81];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT003.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6517
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
Cc: =?UTF-8?q?Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-clk@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Sean Anderson <sean.anderson@seco.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Madalin Bucur <madalin.bucur@nxp.com>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, linuxppc-dev@lists.ozlabs.org, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds support for the Lynx 10G SerDes found on the QorIQ T-series
and Layerscape series. Due to limited time and hardware, only support
for the LS1046ARDB and LS1088ARDB is added in this initial series.

This series is based on phy/next, but it requires phylink support. This
is already present for the LS1088A, and it was recently added for the
LS1046A in net-next/master.

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

The final patch in this series depends on [1].

[1] https://lore.kernel.org/netdev/20221227230918.2440351-1-sean.anderson@seco.com/

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

 .../bindings/gpio/brcm,bcm6345-gpio.yaml      |   16 +-
 .../devicetree/bindings/gpio/gpio-mmio.yaml   |  142 ++
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
 20 files changed, 2613 insertions(+), 103 deletions(-)
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

