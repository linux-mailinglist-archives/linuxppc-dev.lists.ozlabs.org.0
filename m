Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F21096C3B6E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 21:14:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ph2rw6VHVz3cfh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 07:14:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YAqeS6pj;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YAqeS6pj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0c::319; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YAqeS6pj;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YAqeS6pj;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04hn0319.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::319])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ph2qw0txtz3c34
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 07:14:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7SjqAGJWUCrdMlqLs8dOLrwOazJcdUmBiLXczJHDao=;
 b=YAqeS6pjEuLAnJihQeWKRnlZfbAHV8S+E4KZ3HHbgTtJwXd83lg1f3I5RIpf7LDbb4ItY5lSQbJtj7vl5MNsP5EJ1/aAJFTcphbO28ubuK4CKt3URKk1NOziBnTlMYZLQKPGA5pXdiFK3PVrDd0IaljU2+wvCKUX1plE1GM71R3hlwarCfOQFTP9h9LygjoWXYcz+TMPZmQqU4uVNceK0OqYQFQUfjxKxF64wOJzDYyzmjB8wSSAY+sRj61bEQX4oIXuxgaHGv9gwM0Pw0Aw1efIOEVVFTPlo02C7ldbg5QFc6s/wOn0doQgppVZk4Ur9qrYw9nccoN9lLbCQzHdkA==
Received: from ZR2P278CA0071.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:52::17)
 by PAXPR03MB7548.eurprd03.prod.outlook.com (2603:10a6:102:1db::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:13:38 +0000
Received: from VI1EUR05FT035.eop-eur05.prod.protection.outlook.com
 (2603:10a6:910:52:cafe::f4) by ZR2P278CA0071.outlook.office365.com
 (2603:10a6:910:52::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 20:13:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.87)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.87; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.87) by
 VI1EUR05FT035.mail.protection.outlook.com (10.233.242.114) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.17 via Frontend Transport; Tue, 21 Mar 2023 20:13:37 +0000
Received: from outmta (unknown [192.168.82.133])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 3EA762008088A;
	Tue, 21 Mar 2023 20:13:37 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (unknown [104.47.51.176])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id EA88C2008006F;
	Tue, 21 Mar 2023 20:11:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ks7GQ1WqzJudXHKEGTIbEEMw4v/8ali4lwilNiYzACwekgOnrdCjOmXNSgEaoZs8n3BNqvBQSb7gdizGIO8+eET9wZelNSnFkHf+M+pQnItPq0WbLGnqs5P4WtrlgWC9hEJUmwCaI8tYzazDkBFfRl1p3FMkqBeeCYdHytsndyKTzG/kXenG/tUcHJPfqsdKugbWWBX3sAi9h/zTlfwKAHDctf1E6jkuMSvYj1nJnoJUVq3UGzeUyqCpTyEkfg7a68xIULQB4hlS9jrOVKgX6QO4VUSce38OCyabiVMYRPJiHQRdJY4GjTuVMofFUDIzlsMoAdckZqMDO0JqKnP8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7SjqAGJWUCrdMlqLs8dOLrwOazJcdUmBiLXczJHDao=;
 b=kFkfcN3+uTjmzQKavTWief0Z4Ocb31CWNAwAz1tDb5fTGMfUxhwSDdw+Ov0abIxrPijT1otRPZrDYSdjZaQM2jJPN8YVcm9cGljHjkb4HYuZEreS1EJdI9ojy3/0Hqto/ITP+I+kyrz5hPF6x/T84s0BOG6LC/5d0ApHUv7yJYIvterCBSm1Yi9z1PD7QU1iUB72GKnbBnxL00zvExXoRsTiPPCT7AN5u7E9bHqN805XKiEunAKRFN2r0u7BEPItO49QxCVBXqI2iZNI1R0sk+ozKXMY/JdMCL0G7Wfz2Gac2FeFxWlD5YJ4foGMcYfPkRzIFzz9S5v02qz9klrOCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7SjqAGJWUCrdMlqLs8dOLrwOazJcdUmBiLXczJHDao=;
 b=YAqeS6pjEuLAnJihQeWKRnlZfbAHV8S+E4KZ3HHbgTtJwXd83lg1f3I5RIpf7LDbb4ItY5lSQbJtj7vl5MNsP5EJ1/aAJFTcphbO28ubuK4CKt3URKk1NOziBnTlMYZLQKPGA5pXdiFK3PVrDd0IaljU2+wvCKUX1plE1GM71R3hlwarCfOQFTP9h9LygjoWXYcz+TMPZmQqU4uVNceK0OqYQFQUfjxKxF64wOJzDYyzmjB8wSSAY+sRj61bEQX4oIXuxgaHGv9gwM0Pw0Aw1efIOEVVFTPlo02C7ldbg5QFc6s/wOn0doQgppVZk4Ur9qrYw9nccoN9lLbCQzHdkA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM9PR03MB7044.eurprd03.prod.outlook.com (2603:10a6:20b:2d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:13:32 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 20:13:32 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v12 00/13] phy: Add support for Lynx 10G SerDes
Date: Tue, 21 Mar 2023 16:12:59 -0400
Message-Id: <20230321201313.2507539-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR20CA0026.namprd20.prod.outlook.com
 (2603:10b6:208:e8::39) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AM9PR03MB7044:EE_|VI1EUR05FT035:EE_|PAXPR03MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: aba9a379-ed43-4b70-99dc-08db2a48c1cf
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  Urcdlt0Dw08nzYIs+i4hYp3xmSvXIJ6wyO30rTkME1DlW0s1QDW7zqw5J8tnVRJgSv7PMpd8TR7nD3P99ZCOh+jaAAA+Z8uJeVf4tOYqSqdw64d+EYM1WHxWAf7MQjZrKLi0JiBZPgCH3fMACuX8VpvJQAe+Fgm0YM5KlugqS+wtKiHKqS2wXww0kfADeSBbKqKRF4PHqLMKRxhHyacacNg4pF2IbN71DhEjYK+1jIdUf1AU5UvdL5fKqXCXXqUk6KqH6Nca4LuKxjDVsDzp6vrD92ZxccupepJzDJtLyh0Jl7LnBZraHbRtDfLJg9bRHoQVfZPR0oOGgrOS5osnhAYJVUS8DlqeX2qUA+x7QcXlh9hxEHLs/ouY1MJvjW5ju3E0MZcf4CsxP7RBWIVZdq4C75iiAjDdG2ewtT0ktYwdB2eQ9Upl/S3+mSNDrqHIod+lKyqBbYEjarj7hYoCjEDNn7MsYZkXxIKxuq9U8m7vzNnDcrCmJyOmfDCIP8MZJTRa1u3lKifaIX/LTt4qv0QCDFLNxk+yiY+BF+sqf0vEa7Qbfc1jMBORWRChtrZ+DAHXF0YLCj4afofxCb/dMOcPTOD8ujiynxCHEoJ3xI40y3SB1ZON9d1mQPLIdcX3pGUg94vrYtRILNVa+FmZp6G5xp7Fe3IvZFi4VnJcaYK4mKNohjPI+Pb0zIJJQHP0EwzToJ1A/ifb32Md3dbRcw==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199018)(2616005)(54906003)(83380400001)(6512007)(7416002)(6506007)(6486002)(478600001)(316002)(1076003)(26005)(52116002)(5660300002)(6666004)(186003)(110136005)(86362001)(38350700002)(38100700002)(30864003)(66946007)(41300700001)(44832011)(2906002)(8936002)(66476007)(66556008)(8676002)(4326008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7044
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT035.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	d7a46605-91a4-49dd-5488-08db2a48be4f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	IHVhZfievzphSiMslJQnBnO/81jJwQr1Ey1wjmHQ4S7qKT9IBhps3lNSkL1GFNwqYY0tyWuQHhHE7W4b7nykN2NJmE2Qk5yqVEzy4dHUnNRUrEBsRIaVxyIzhtills26hm8EcdDTfL596qIUszz4mNyQfiqmuYRuO+Ig5tNxuklDcXIZ5SdNyrL+XBwapOUBHXXGcv5YrRotVkK8H3Bh6zPXL3YByX1aNVIiTN0GOYV6TtCJXnLilwn0HZn3K1WC9VBl+/8kBZvYBdTqd0K1G7cHj6k2hzmzUSRhAcC4kiezIrpvkDwYyLicBowvCdC2Lom7A9jiN/zdz5G3AtYt92b+A7FT/Pi04FQfSDVj0lZVuvqrARBkXNayYsGeRYvmLNosHrBPB1mDTD4qUDRt1xQ3L9hjuP/Ja3PKLsQL/f7Ta1Qb5ChIaXeFXxDj/4w32uiPyaZQpWHhiCqtS5R2bxvO7fxhCL45qeKLsuL5Yo/m3DWHKOXve16+gSb8fRLyFuA5HPpgGOXEMqpzQqg3KlRIlwqN9uVMQScPeMzLTAoAcCLdjcuaVU/5Sc2zgjV21inWPe1JP/7eLitVNmWcSpymj14RNrtRctlTagomh4mlAXozkUO8yDzfH58wNiiYeZN6ZVN8lVSribWjNI3DSW3Z/Agn/k3cBpidmXvCOM8jZep9JJaZ08Y1xzhe2YIaKCz5KkuvOe7iA8hXnnI5MYE1QkhWqpnIfskrBTW60HIMCuKMQ42/ieQung1Fqr235RKg/gBFcFdqKX5wY7UZtA==
X-Forefront-Antispam-Report: 	CIP:20.160.56.87;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(136003)(376002)(396003)(346002)(39860400002)(5400799012)(451199018)(36840700001)(40470700004)(46966006)(47076005)(86362001)(30864003)(110136005)(54906003)(316002)(8676002)(8936002)(40480700001)(44832011)(36756003)(36860700001)(70206006)(34070700002)(5660300002)(41300700001)(7416002)(70586007)(4326008)(478600001)(2906002)(7596003)(40460700003)(7636003)(83380400001)(82310400005)(82740400003)(336012)(6666004)(356005)(2616005)(26005)(1076003)(6512007)(186003)(6506007)(6486002)(12100799024);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 20:13:37.9739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aba9a379-ed43-4b70-99dc-08db2a48c1cf
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.87];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT035.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7548
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
 .../devicetree/bindings/gpio/gpio-mmio.yaml   |  123 ++
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
 20 files changed, 2594 insertions(+), 103 deletions(-)
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

