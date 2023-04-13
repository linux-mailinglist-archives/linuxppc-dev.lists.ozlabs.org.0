Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5376E11D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 18:09:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py4K670jKz3fVh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 02:09:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=hwYcZYOX;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=hwYcZYOX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0d::311; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=hwYcZYOX;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=hwYcZYOX;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04hn0311.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::311])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py4GM4QhYz3c7s
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 02:07:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kQ/67EmdQZaM9nB845xx7JS2Bn7OlZzmFVBWtyZu5c=;
 b=hwYcZYOXGY3quH1R+sBu5bcQY3AM8gds2oYA8lo0vCTixbM06GAo5Q8Ya0/2iqU9UXUFeBp+8t+whC1ifWHi+1iusR4dzL8jxoI2z+VX/Bbks8pmIg390B/2goTd/B/Y7bYgIhOWVaoOdRbUt0VyX10qk7PQJm641eK0lIYcWHSguYrhA7R58Jn9PlBIUBh9Ilm77e2G/T0RsnynPLoxm7qiBWiCDixCctGiV0rSzLeHGhwZdKEHUqWwK2lyZh0H3TBsP3NUSHCuXynXdyy/6PjS/OFGo/kR6QGq2SIjwv+pNtMLOaE8nqUeOfJ1dypYrQwoqvYlXlJcJX9QEH71sQ==
Received: from AS9PR06CA0689.eurprd06.prod.outlook.com (2603:10a6:20b:49c::35)
 by GV1PR03MB8565.eurprd03.prod.outlook.com (2603:10a6:150:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 16:06:47 +0000
Received: from VI1EUR05FT020.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:49c:cafe::2e) by AS9PR06CA0689.outlook.office365.com
 (2603:10a6:20b:49c::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 16:06:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.83)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.83; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.83) by
 VI1EUR05FT020.mail.protection.outlook.com (10.233.242.192) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.31 via Frontend Transport; Thu, 13 Apr 2023 16:06:47 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id B15C92008026F;
	Thu, 13 Apr 2023 16:06:46 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [104.47.18.109])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id A814420080073;
	Thu, 13 Apr 2023 16:07:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZSF1GW9d5cUt/3o64F9jIv8tWqtYRKq0s2qpc6URSyJHNtlfXVtoTD67aHt//eEPrsyYYq81QJxivpNhB//vxbsTy1TIP1syaXtP1KBhNMCNHX7tRR7sf/CRoFddIRDlJ4qbJV0I7cxt7qUeq+G74I93kOV2zNxsbT4MAJ1tl82vwMg6EGQ8eo5PFypMquBw1fjbBbqTr7LdlJ1uMIGM+EfemHexlu6M/aW0YYa14548oc8xxl5qjoi+o9T5hDZYCT/J83mCs8o36+bea47ZBXhbZKnQayX+D9oG/MZp4x6Prasx++EWfGbVW5rWfytfzRSDtVUTNB/O2sICxn46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kQ/67EmdQZaM9nB845xx7JS2Bn7OlZzmFVBWtyZu5c=;
 b=Miz6+fUvi7j5jZ2Z2PrIWwxG+PLHcD0+X7NzDP32cnKwuJZ5GBBCkyqs3SBTQl07Hq9dfYDH2/JYEf7ifUQ6E11rc6uZa+uuzGPtdG++bYJOimbX8ay86u+D9QnUeOhzI+sRnoTY7Y0ySVHR+hNsGU9sf6WsUIlE3kpT7fUaWcRsZ9C5ASy2FuJNSIRJcSZJzBkpyGcWzQdkN4pgqZlb9hJUR0rOfgHv7lCwyc9kAvY+J3w9xyAYDxEfcSK5jM9n7Sc+M4kAeFN8e5tybo4KuC4U5A58LmfUp01LS6Sc1Qi/1UEwEwQZx8HF5/nBzJte3bbyMFrFpG42ek7OH8rXiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kQ/67EmdQZaM9nB845xx7JS2Bn7OlZzmFVBWtyZu5c=;
 b=hwYcZYOXGY3quH1R+sBu5bcQY3AM8gds2oYA8lo0vCTixbM06GAo5Q8Ya0/2iqU9UXUFeBp+8t+whC1ifWHi+1iusR4dzL8jxoI2z+VX/Bbks8pmIg390B/2goTd/B/Y7bYgIhOWVaoOdRbUt0VyX10qk7PQJm641eK0lIYcWHSguYrhA7R58Jn9PlBIUBh9Ilm77e2G/T0RsnynPLoxm7qiBWiCDixCctGiV0rSzLeHGhwZdKEHUqWwK2lyZh0H3TBsP3NUSHCuXynXdyy/6PjS/OFGo/kR6QGq2SIjwv+pNtMLOaE8nqUeOfJ1dypYrQwoqvYlXlJcJX9QEH71sQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS2PR03MB9369.eurprd03.prod.outlook.com (2603:10a6:20b:57b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Thu, 13 Apr
 2023 16:06:33 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 16:06:33 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Date: Thu, 13 Apr 2023 12:05:52 -0400
Message-Id: <20230413160607.4128315-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::33) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS2PR03MB9369:EE_|VI1EUR05FT020:EE_|GV1PR03MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 79b8db07-e139-4647-4e49-08db3c391553
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  aI/udzueLM7lSkeXx8+kFlsTVj1MismMcX0adB5UWBggnBix/AvOzGDLidZu+zLrNEhUgy5ElHNnHpIsGQyFymw1tVNMjyJjcSH3VYQt9wTiXfvxOkPlVF3RN1RxZPLn2gbyvmJOazfc5wCTPh2a0imJueYUedw+mr5Tdd/sJqPckG/eXumI3E6ZAS4I/V2PO2WIpmkOC/rGpDfBX/lFGTCaoUG/iZtIBoOPX1GH1NbK2BWBHBCsowScaC94bxRhiNApt5xV2W/H5CCW0UWXQ0SmxWYY2aD9bVlkxIwmoknn4v7RSufYZJxwJFPYYzOk2ZrVNEboNZXKlPhTSX/okaAAfmlgw3dJODmKM+xTJWoCHCgpq3CzDJaS6nynmeEcEFnqYfm7E7kDT93S7q5OktcnTLJv9b0jeHODNkZPbp8U083eNKoTD990zK3M7atXA4sVP6YtTZQmnnK+DXNCc16Sd4peH1MYpK1Bz8Dt3RC4dcC62+VA4H7dWIYsZDEuOTSZ+AG+AL4JjBk8W40Sje0T9/Z2m4aB9Xdg7OOWT6f1BSuob/wd9KKn++LOvxPbDn4miqC5dewJGnS6WQMo69ZjhT559mnHH10lrd/aHIoAQAXM4aW/4Fz9Yc9gWaD7
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(39850400004)(396003)(136003)(451199021)(478600001)(52116002)(6512007)(83380400001)(36756003)(38350700002)(2616005)(86362001)(38100700002)(30864003)(2906002)(316002)(6506007)(26005)(110136005)(186003)(1076003)(54906003)(5660300002)(44832011)(66946007)(6486002)(66476007)(6666004)(8936002)(41300700001)(66556008)(7416002)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9369
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT020.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	b1ebc240-36f9-4340-3f5c-08db3c390d08
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	hD5BoOgOe8kCZsforZQgklPuDQ0RO3RrigQGpcotASFz8sy8qo9XPT0WDnCAV+fnDLYMemQuZInY6tpShUou/SQ1AddlUdh8lfLUsc1NJO7KAynBBBqIfniFrmAG5+rbyb5S3bWghwHGNz8GzD4l9sRjEMIWQmytw1H1h3yAzh/f7xDjmaztzMyxcDevQD4tZlz5L9+mvxACIAiiXZVtO344nmYVhvVvlvYopTvG7jbZrjzYxbqfnBp1Yhsgci2fs/tAMhhz3GCfn8xMdPtBN2GWwZQsB5WRYqqfDEhE2tF+8G5YAEUSUwG1IWep3fJP5kUi/+cXFgsJJdJr1cC8InN1EB5OQkFu0YCs3i+qSQoZKRLMTSrNseH0SJCSB9UTPY6pdNX4DhXCL0CPhg3aQniTtp/6XIuEFS+8YiICjdei/via0DJhX3NjIbYSNID6ow+MvzFnaz0CLdikh+kzZM5hQdUx8Ha8yvDBFqXe2KlVC+ug+RLkkG7JbQNredhgFqJaon9aHEE9pNGJiZfQQhOpfclLuec5ixkpqvLCTkzgaCiMFuKRzCLJwjkB8S0qSXCbqLSA+0pQLpKkewzXmRWRXwQ/G7BWpVLJWuBvIWV8V62SNkVPqgLVeDLFMQs8vWy82g+vsVC052FhKAREFLCPQ4L4GqXCIPg93DtjLHGyLaVhmJM+yJnbL7fIBnmxxxS6EZm5z8FPonYWrK1qNXENrOwe4zRbHOxjYRSlQ4+pt2P9nziFo0E6wGPoA+57om2djEpqaAiNtUaaWgd8iA==
X-Forefront-Antispam-Report: 	CIP:20.160.56.83;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(346002)(39850400004)(5400799015)(451199021)(46966006)(40470700004)(36840700001)(82740400003)(40460700003)(356005)(7636003)(186003)(7596003)(6506007)(40480700001)(6512007)(26005)(1076003)(36860700001)(336012)(7416002)(47076005)(34070700002)(44832011)(30864003)(2616005)(2906002)(8936002)(5660300002)(36756003)(110136005)(86362001)(478600001)(41300700001)(6666004)(54906003)(4326008)(6486002)(316002)(70586007)(70206006)(8676002)(82310400005)(83380400001)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:06:47.0703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b8db07-e139-4647-4e49-08db3c391553
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.83];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT020.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8565
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

This series is ready for review by the phy maintainers. I have addressed
all known feedback and there are no outstanding issues.

There are several stand-alone commits in this series. Please feel free
to pick them as appropriate. In particular, commits 1, 3, 4, 12, 13, and
14 are all good candidates for picking.

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

Changes in v14:
- Fix incorrect $id
- Add note about (lack of) use of FIELD_GET/PREP

Changes in v13:
- Fix references to brcm,bcm63xx-gpio.yaml (neé brcm,bcm6345-gpio)
- Split interrupt changes off from serdes support
- Split off SFP addition from serdes support

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

Sean Anderson (15):
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
  arm64: dts: ls1088ardb: Remove aquantia interrupt
  arm64: dts: ls1088ardb: Add SFP cage
  arm64: dts: ls1088ardb: Add serdes descriptions

 ...m6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} |   18 +-
 .../devicetree/bindings/gpio/gpio-mmio.yaml   |  123 ++
 .../bindings/gpio/ni,169445-nand-gpio.txt     |   38 -
 .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |   38 -
 .../mfd/brcm,bcm6318-gpio-sysctl.yaml         |    4 +-
 .../mfd/brcm,bcm63268-gpio-sysctl.yaml        |    4 +-
 .../mfd/brcm,bcm6328-gpio-sysctl.yaml         |    4 +-
 .../mfd/brcm,bcm6358-gpio-sysctl.yaml         |    4 +-
 .../mfd/brcm,bcm6362-gpio-sysctl.yaml         |    4 +-
 .../mfd/brcm,bcm6368-gpio-sysctl.yaml         |    4 +-
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
 26 files changed, 2607 insertions(+), 116 deletions(-)
 rename Documentation/devicetree/bindings/gpio/{brcm,bcm6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} (75%)
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

