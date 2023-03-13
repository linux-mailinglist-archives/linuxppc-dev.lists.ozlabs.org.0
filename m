Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCB56B7D49
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 17:20:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb21Y53JHz3fTP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 03:20:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xCl8fVEh;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xCl8fVEh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1a::328; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xCl8fVEh;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xCl8fVEh;
	dkim-atps=neutral
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03hn20328.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1a::328])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb1sB6SL6z3c8f
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 03:12:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqbBunlOsjaD9KIJVPiTVz1y0yzqoXofdNtLcvTc/K8=;
 b=xCl8fVEh7qlCsddzvBC4KcBW04H3qHmTlRm8yer3mSoIUBbAWqoeMy68yZ3C4+JeWtl8JhHAEmtyLHE6RZSlqBxWeQsCBlT+JMhLn+Os29TW5oveUDx0E9nRpmsFgKHtgWeQgdamkmbYxuV3LjeKBwLOwbhVFP5uLpb01rJGPEIHG6ZFKCUuSw4OmGws+jCKp+UUOnv/h5xwCTivYEjN7fn51NJj9O/4NiTWlTIY8PLhTncS5B+LHeXT28xL+qGOLS2YpfcYl5KwFdqXJbbRWmS5TRPfYiDaJIPheqKSmHa3bi4KSvYU/26l0MyiTRi+bGpZ/i8o1RX244maYYNQ6A==
Received: from DBBPR09CA0022.eurprd09.prod.outlook.com (2603:10a6:10:c0::34)
 by AM9PR03MB7558.eurprd03.prod.outlook.com (2603:10a6:20b:415::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:12:28 +0000
Received: from DB8EUR05FT004.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::ce) by DBBPR09CA0022.outlook.office365.com
 (2603:10a6:10:c0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Mon, 13 Mar 2023 16:12:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.84)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.84 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.84; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.84) by
 DB8EUR05FT004.mail.protection.outlook.com (10.233.238.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Mon, 13 Mar 2023 16:12:27 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 90A142008026F;
	Mon, 13 Mar 2023 16:12:27 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [104.47.14.52])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 8869520080075;
	Mon, 13 Mar 2023 16:03:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHMqOJIMlOqDr4Ze3dn08tBCCYZ6mxBljYJjndq31wEX15VZapn99+jEb+Tnr7TaFF9hzK6QjJiluphitBqUYt/MKf1Tgg56d3diOwxpTL9SzIgHe5w8eMBwHZ/738fCu+q3XXoePQkKFSE7oyNEvo0nz7EoGbyCR/dKB2Wrb6hwr0oL1dwI/3vDSraobZ9ai7IcnsUzt3mfF7Cpl1ofV6ra3hV9GxgxMYE2oOm6u6lYutu0HlFNK0XT5aPC+Io1NbJv8nrtvB90NDRuomAPI6Yr434b+LokHQkbcLaVI6iB85pwawJLW9Yte1nm7U7qmN8ZmarPSev50HC3ChtCRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqbBunlOsjaD9KIJVPiTVz1y0yzqoXofdNtLcvTc/K8=;
 b=kgO0mvEPMqbFs1FgNukBIc1nt2Ak7oPDDdFujLfYS6OZKIP8AvwPguHvDL0g0YdgIC/oM3Jpm5aU3lYRce2LltB0kH7911egldR5LDrSevERcjLIGP3xLtcangT+kmLEC2RDa6/8yNrR7k2gTABeb+0XQ8zUv30RBP7mSTlxNLeWyz3qJFboNtRpzs3WhgdeZUJ2Qx7p5ian8kZ4G8d8qHT82869yIQNGJG4zoXB3Rhsft1AxWB5UrVItQ70X2sR+fjzzLv0RwXKjM/k4Oq3ih3+r7fKWkyYTCDDQfrifUbBRKuK3p7BRW+K4A7Z63G/DVqoX6a87GPxvBRvl9B4PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqbBunlOsjaD9KIJVPiTVz1y0yzqoXofdNtLcvTc/K8=;
 b=xCl8fVEh7qlCsddzvBC4KcBW04H3qHmTlRm8yer3mSoIUBbAWqoeMy68yZ3C4+JeWtl8JhHAEmtyLHE6RZSlqBxWeQsCBlT+JMhLn+Os29TW5oveUDx0E9nRpmsFgKHtgWeQgdamkmbYxuV3LjeKBwLOwbhVFP5uLpb01rJGPEIHG6ZFKCUuSw4OmGws+jCKp+UUOnv/h5xwCTivYEjN7fn51NJj9O/4NiTWlTIY8PLhTncS5B+LHeXT28xL+qGOLS2YpfcYl5KwFdqXJbbRWmS5TRPfYiDaJIPheqKSmHa3bi4KSvYU/26l0MyiTRi+bGpZ/i8o1RX244maYYNQ6A==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB7781.eurprd03.prod.outlook.com (2603:10a6:20b:405::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:12:16 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 16:12:16 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v11 06/13] clk: Add Lynx 10G SerDes PLL driver
Date: Mon, 13 Mar 2023 12:11:30 -0400
Message-Id: <20230313161138.3598068-7-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230313161138.3598068-1-sean.anderson@seco.com>
References: <20230313161138.3598068-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::11) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB7781:EE_|DB8EUR05FT004:EE_|AM9PR03MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: e41a4bf7-1c10-4da5-cea3-08db23ddbd9d
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  mf4tIFamHQr3VttEFlH7+I1Ol2lP/L75EdCx3zNsiIgO9xdpCTSsFnz922zWoO7U6PMaqDiHC5IYzIXfDDXnM7L3Um8nOogy1hqesMMTZL3YkJtzA6pyJaGjQqJaQxJfB6/HHHdtrXMDDWqqmlS/swGhy0FfWo162tLoBFwrTIc+SWhErSG/CyJa/9VRg2MmWrGR7H2ukspJbsCg9Vq5Mk4H7AEQnf8Elw3wJzi26bZ/66Wpn68i8dmnVCQSXSMRhFPYr9PopcAYgKEXXWEErI3yqpqiQwG2Yx+yobPKBoEGss4fnRUQ4NafkvUfiifTn1ChmFcnFFuoNTDHTke9ZHQSMYWa44/EtLP5Ruao+0lNcjeJSxOmovS+lf2tDxKXAwA+59rq344tP5ab31UTP1Yzs1tVONz4X422hFMWKOBjbqXV0Rk0W3MhtaS2eYlREX3YtBLcYDpIvY3oT8L6GXKGRqA0kugr/xXclPObCI+O7HJEfQkXTCp4Sh8HHdMbAO/BnVRCJW9JUAOkQ1LEgU/+fUJDjpUG/9WUM1fOlXJc37WjIo0bWLN1IWJWkccyFBpvUenBiyWnK4RB3QyYMW3ZnrTiCyBYJDUJWzX9SUUCrtfZqVLDXl8SshzEwRr+yZlgoppsTJ3Ra3mYi4rKo0LFfzIjP7jUIVJRG03Mu/6MgDqZ4mYOFEgv24Vsj+qOvXhbdX+wtVjEvlwD80tObA==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39850400004)(346002)(396003)(376002)(136003)(451199018)(66899018)(110136005)(41300700001)(54906003)(478600001)(8676002)(4326008)(66556008)(66476007)(66946007)(8936002)(36756003)(86362001)(38350700002)(38100700002)(26005)(6512007)(1076003)(966005)(6486002)(6666004)(186003)(52116002)(30864003)(44832011)(5660300002)(7416002)(2906002)(316002)(6506007)(83380400001)(2616005)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7781
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT004.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	480ca008-11e7-462d-e17c-08db23ddb6e9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rGwVGN4nB1S0PgUsyERamJ/SoVoeOsMoLKH0kyfcQq0sGa4axwJhCG8c+CT4VCQDluWX7q6oxpglmL6rac9GGWzvCF3oOU3lL1YUr2ZAQkba4zQYQg4jHDtnJ8GQWifV39eCAXe6oEyApA6RdVLJCCJeDKZB2yL5im0kChItf8y1nJuGtepF+oCAAqxwbNsKjs6NadbV4OeBNRUhXEcGIf93OfGqgQeKRaRgrT6NmrhPSfVbrrMaBpsqcOKJNJk1kxwWVwJAVo61sAGO2CX0nx1Bk8chVI7ASqlguk9j0MKA3LrTneHjKhpEdpG5Tqeob3cwv+ju+TUXtVZV7NI2hfRjiQ0RYWGIoBDNdMXtm9YNOdWJRv0sBN8y9a03TtAXi2+1XRiML+m/Xre9B2frptdeaE7qRK9sp1O36HoQvdpAi0phjcC78POZlfv5ZMYHrwSU5mefJKBKpojBSSl8PvJVguVipl1BPJpnmf5Qa2cvgFjE5hzlGPl5RVsbY7cwlf1F0kGS7h1H6tdRNp89DNSDa68XlzCr+xdEALj6LZjPmaWitDG9VrKvoSxZ+5KOSqLtXSz8xDLJQn9DIhgDunGi7G45UkPq0F/xWdkQOuUJWcy3H5usgcWCl/3xT5Tvf19zPrm7AvIGkqvIJRCH+TXYbmyEydCbHwrzPjBZSfgx9dgUpzkA18ahAopm/HyQLHOOAFHTu/Dy701aS3xnt2+XhpnqR1sMAiDGwrpqcwDQscY98Dqul9sK3yA9ugZWWsSnojM17mB4p7VpjAOzPA==
X-Forefront-Antispam-Report: 	CIP:20.160.56.84;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(346002)(396003)(39850400004)(376002)(136003)(5400799012)(451199018)(46966006)(36840700001)(40470700004)(6486002)(966005)(30864003)(66899018)(2906002)(83380400001)(6666004)(36756003)(26005)(6506007)(40460700003)(5660300002)(40480700001)(8936002)(186003)(8676002)(6512007)(1076003)(86362001)(41300700001)(2616005)(44832011)(356005)(7416002)(4326008)(47076005)(70586007)(70206006)(336012)(7596003)(7636003)(478600001)(110136005)(82740400003)(316002)(36860700001)(54906003)(82310400005)(34020700004)(21314003)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 16:12:27.8100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e41a4bf7-1c10-4da5-cea3-08db23ddbd9d
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.84];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT004.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7558
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
Cc: devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds support for the PLLs found in Lynx 10G "SerDes" devices found on
various NXP QorIQ SoCs. There are two PLLs in each SerDes. This driver has
been split from the main PHY driver to allow for better review, even though
these PLLs are not present anywhere else besides the SerDes. An auxiliary
device is not used as it offers no benefits over a function call (and there
is no need to have a separate device).

The PLLs are modeled as clocks proper to let us take advantage of the
existing clock infrastructure. I have not given the same treatment to the
per-lane clocks because they need to be programmed in-concert with the rest
of the lane settings. One tricky thing is that the VCO (PLL) rate exceeds
2^32 (maxing out at around 5GHz). This will be a problem on 32-bit
platforms, since clock rates are stored as unsigned longs. To work around
this, the pll clock rate is generally treated in units of kHz.

The PLLs are configured rather interestingly. Instead of the usual direct
programming of the appropriate divisors, the input and output clock rates
are selected directly. Generally, the only restriction is that the input
and output must be integer multiples of each other. This suggests some kind
of internal look-up table. The datasheets generally list out the supported
combinations explicitly, and not all input/output combinations are
documented. I'm not sure if this is due to lack of support, or due to an
oversight. If this becomes an issue, then some combinations can be
blacklisted (or whitelisted). This may also be necessary for other SoCs
which have more stringent clock requirements.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>

---

(no changes since v10)

Changes in v10:
- Remove unnecessary inclusion of clk.h
- Don't gate clocks in compatibility mode

Changes in v9:
- Convert some u32s to unsigned long to match arguments
- Switch from round_rate to determine_rate
- Drop explicit reference to reference clock
- Use .parent_names when requesting parents
- Use devm_clk_hw_get_clk to pass clocks back to serdes
- Fix indentation
- Split off from following patch to allow for better review

 MAINTAINERS                    |   7 +
 drivers/clk/Makefile           |   1 +
 drivers/clk/clk-fsl-lynx-10g.c | 510 +++++++++++++++++++++++++++++++++
 drivers/phy/freescale/Kconfig  |   6 +
 include/linux/phy/lynx-10g.h   |  16 ++
 5 files changed, 540 insertions(+)
 create mode 100644 drivers/clk/clk-fsl-lynx-10g.c
 create mode 100644 include/linux/phy/lynx-10g.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d5bc223f305..1098ad283eb6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12202,6 +12202,13 @@ S:	Maintained
 W:	http://linux-test-project.github.io/
 T:	git https://github.com/linux-test-project/ltp.git
 
+LYNX 10G SERDES DRIVER
+M:	Sean Anderson <sean.anderson@seco.com>
+S:	Maintained
+F:	drivers/clk/clk-fsl-lynx-10g.c
+F:	include/dt-bindings/clock/fsl,lynx-10g.h
+F:	include/linux/phy/lynx-10g.h
+
 LYNX 28G SERDES PHY DRIVER
 M:	Ioana Ciornei <ioana.ciornei@nxp.com>
 L:	netdev@vger.kernel.org
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index e3ca0d058a25..eebed69f6c58 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_ARCH_SPARX5)		+= clk-sparx5.o
 obj-$(CONFIG_COMMON_CLK_EN7523)		+= clk-en7523.o
 obj-$(CONFIG_COMMON_CLK_FIXED_MMIO)	+= clk-fixed-mmio.o
 obj-$(CONFIG_COMMON_CLK_FSL_FLEXSPI)	+= clk-fsl-flexspi.o
+obj-$(CONFIG_PHY_FSL_LYNX_10G)		+= clk-fsl-lynx-10g.o
 obj-$(CONFIG_COMMON_CLK_FSL_SAI)	+= clk-fsl-sai.o
 obj-$(CONFIG_COMMON_CLK_GEMINI)		+= clk-gemini.o
 obj-$(CONFIG_COMMON_CLK_ASPEED)		+= clk-aspeed.o
diff --git a/drivers/clk/clk-fsl-lynx-10g.c b/drivers/clk/clk-fsl-lynx-10g.c
new file mode 100644
index 000000000000..78357303b578
--- /dev/null
+++ b/drivers/clk/clk-fsl-lynx-10g.c
@@ -0,0 +1,510 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
+ *
+ * This file contains the implementation for the PLLs found on Lynx 10G phys.
+ *
+ * XXX: The VCO rate of the PLLs can exceed ~4GHz, which is the maximum rate
+ * expressable in an unsigned long. To work around this, rates are specified in
+ * kHz. This is as if there was a division by 1000 in the PLL.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/bitfield.h>
+#include <linux/math64.h>
+#include <linux/phy/lynx-10g.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/units.h>
+#include <dt-bindings/clock/fsl,lynx-10g.h>
+
+#define PLL_STRIDE	0x20
+#define PLLa(a, off)	((a) * PLL_STRIDE + (off))
+#define PLLaRSTCTL(a)	PLLa(a, 0x00)
+#define PLLaCR0(a)	PLLa(a, 0x04)
+
+#define PLLaRSTCTL_RSTREQ	BIT(31)
+#define PLLaRSTCTL_RST_DONE	BIT(30)
+#define PLLaRSTCTL_RST_ERR	BIT(29)
+#define PLLaRSTCTL_PLLRST_B	BIT(7)
+#define PLLaRSTCTL_SDRST_B	BIT(6)
+#define PLLaRSTCTL_SDEN		BIT(5)
+
+#define PLLaRSTCTL_ENABLE_SET	(PLLaRSTCTL_RST_DONE | PLLaRSTCTL_PLLRST_B | \
+				 PLLaRSTCTL_SDRST_B | PLLaRSTCTL_SDEN)
+#define PLLaRSTCTL_ENABLE_MASK	(PLLaRSTCTL_ENABLE_SET | PLLaRSTCTL_RST_ERR)
+
+#define PLLaCR0_POFF		BIT(31)
+#define PLLaCR0_RFCLK_SEL	GENMASK(30, 28)
+#define PLLaCR0_PLL_LCK		BIT(23)
+#define PLLaCR0_FRATE_SEL	GENMASK(19, 16)
+#define PLLaCR0_DLYDIV_SEL	GENMASK(1, 0)
+
+#define PLLaCR0_DLYDIV_SEL_16		0b01
+
+/**
+ * struct lynx_clk - Driver data for the PLLs
+ * @pll: The PLL clock
+ * @ex_dly: The "PLLa_ex_dly_clk" clock
+ * @dev: The serdes device
+ * @regmap: Our registers
+ * @idx: Which PLL this clock is for
+ */
+struct lynx_clk {
+	struct clk_hw pll, ex_dly;
+	struct device *dev;
+	struct regmap *regmap;
+	unsigned int idx;
+};
+
+static u32 lynx_read(struct lynx_clk *clk, u32 reg)
+{
+	unsigned int ret = 0;
+
+	WARN_ON_ONCE(regmap_read(clk->regmap, reg, &ret));
+	return ret;
+}
+
+static void lynx_write(struct lynx_clk *clk, u32 val, u32 reg)
+{
+	WARN_ON_ONCE(regmap_write(clk->regmap, reg, val));
+}
+
+static struct lynx_clk *lynx_pll_to_clk(struct clk_hw *hw)
+{
+	return container_of(hw, struct lynx_clk, pll);
+}
+
+static struct lynx_clk *lynx_ex_dly_to_clk(struct clk_hw *hw)
+{
+	return container_of(hw, struct lynx_clk, ex_dly);
+}
+
+static void lynx_pll_stop(struct lynx_clk *clk)
+{
+	u32 rstctl;
+
+	rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
+	rstctl &= ~PLLaRSTCTL_SDRST_B;
+	lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
+
+	ndelay(50);
+
+	rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
+	rstctl &= ~(PLLaRSTCTL_SDEN | PLLaRSTCTL_PLLRST_B);
+	lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
+
+	ndelay(100);
+}
+
+static void lynx_pll_disable(struct clk_hw *hw)
+{
+	struct lynx_clk *clk = lynx_pll_to_clk(hw);
+	u32 cr0;
+
+	dev_dbg(clk->dev, "disable pll%d\n", clk->idx);
+
+	lynx_pll_stop(clk);
+
+	cr0 = lynx_read(clk, PLLaCR0(clk->idx));
+	cr0 |= PLLaCR0_POFF;
+	lynx_write(clk, cr0, PLLaCR0(clk->idx));
+}
+
+static int lynx_pll_reset(struct lynx_clk *clk)
+{
+	int ret;
+	u32 rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
+
+	rstctl |= PLLaRSTCTL_RSTREQ;
+	lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
+	ret = read_poll_timeout(lynx_read, rstctl,
+				rstctl & (PLLaRSTCTL_RST_DONE | PLLaRSTCTL_RST_ERR),
+				100, 5000, true, clk, PLLaRSTCTL(clk->idx));
+	if (rstctl & PLLaRSTCTL_RST_ERR)
+		ret = -EIO;
+	if (ret) {
+		dev_err(clk->dev, "pll%d reset failed\n", clk->idx);
+		return ret;
+	}
+
+	rstctl |= PLLaRSTCTL_SDEN | PLLaRSTCTL_PLLRST_B | PLLaRSTCTL_SDRST_B;
+	lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
+	return 0;
+}
+
+static int lynx_pll_prepare(struct clk_hw *hw)
+{
+	struct lynx_clk *clk = lynx_pll_to_clk(hw);
+	u32 rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
+	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
+
+	/*
+	 * "Enabling" the PLL involves resetting it (and all attached lanes).
+	 * Avoid doing this if we are already enabled.
+	 */
+	if (!(cr0 & PLLaCR0_POFF) &&
+	    (rstctl & PLLaRSTCTL_ENABLE_MASK) == PLLaRSTCTL_ENABLE_SET) {
+		dev_dbg(clk->dev, "pll%d already prepared\n", clk->idx);
+		return 0;
+	}
+
+	dev_dbg(clk->dev, "prepare pll%d\n", clk->idx);
+
+	cr0 &= ~PLLaCR0_POFF;
+	lynx_write(clk, cr0, PLLaCR0(clk->idx));
+
+	return lynx_pll_reset(clk);
+}
+
+static int lynx_pll_is_enabled(struct clk_hw *hw)
+{
+	struct lynx_clk *clk = lynx_pll_to_clk(hw);
+	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
+	bool enabled = !(cr0 & PLLaCR0_POFF);
+
+	dev_dbg(clk->dev, "pll%d %s enabled\n", clk->idx,
+		enabled ? "is" : "is not");
+
+	return enabled;
+}
+
+static const unsigned long rfclk_sel_map[8] = {
+	[0b000] = 100000000,
+	[0b001] = 125000000,
+	[0b010] = 156250000,
+	[0b011] = 150000000,
+};
+
+/**
+ * lynx_rfclk_to_sel() - Convert a reference clock rate to a selector
+ * @rate: The reference clock rate
+ *
+ * To allow for some variation in the reference clock rate, up to 100ppm of
+ * error is allowed.
+ *
+ * Return: An appropriate selector for @rate, or -%EINVAL.
+ */
+static int lynx_rfclk_to_sel(unsigned long rate)
+{
+	int ret;
+
+	for (ret = 0; ret < ARRAY_SIZE(rfclk_sel_map); ret++) {
+		unsigned long rfclk_rate = rfclk_sel_map[ret];
+		/* Allow an error of 100ppm */
+		unsigned long error = rfclk_rate / 10000;
+
+		if (abs(rate - rfclk_rate) < error)
+			return ret;
+	}
+
+	return -EINVAL;
+}
+
+static const unsigned long frate_sel_map[16] = {
+	[0b0000] = 5000000,
+	[0b0101] = 3750000,
+	[0b0110] = 5156250,
+	[0b0111] = 4000000,
+	[0b1001] = 3125000,
+	[0b1010] = 3000000,
+};
+
+/**
+ * lynx_frate_to_sel() - Convert a VCO clock rate to a selector
+ * @rate_khz: The VCO frequency, in kHz
+ *
+ * Return: An appropriate selector for @rate_khz, or -%EINVAL.
+ */
+static int lynx_frate_to_sel(unsigned long rate_khz)
+{
+	int ret;
+
+	for (ret = 0; ret < ARRAY_SIZE(frate_sel_map); ret++)
+		if (frate_sel_map[ret] == rate_khz)
+			return ret;
+
+	return -EINVAL;
+}
+
+static u32 lynx_pll_ratio(u32 frate_sel, u32 rfclk_sel)
+{
+	u64 frate;
+	u32 rfclk, error, ratio;
+
+	frate = frate_sel_map[frate_sel] * (u64)HZ_PER_KHZ;
+	rfclk = rfclk_sel_map[rfclk_sel];
+
+	if (!frate || !rfclk)
+		return 0;
+
+	ratio = div_u64_rem(frate, rfclk, &error);
+	if (!error)
+		return ratio;
+	return 0;
+}
+
+static unsigned long lynx_pll_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	struct lynx_clk *clk = lynx_pll_to_clk(hw);
+	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
+	u32 frate_sel = FIELD_GET(PLLaCR0_FRATE_SEL, cr0);
+	u32 rfclk_sel = FIELD_GET(PLLaCR0_RFCLK_SEL, cr0);
+	u32 ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
+	unsigned long ret;
+
+	/* Ensure that the parent matches our rfclk selector */
+	if (rfclk_sel == lynx_rfclk_to_sel(parent_rate))
+		ret = mult_frac(parent_rate, ratio, HZ_PER_KHZ);
+	else
+		ret = 0;
+
+	dev_dbg(clk->dev, "recalc pll%d new=%llu parent=%lu\n", clk->idx,
+		(u64)ret * HZ_PER_KHZ, parent_rate);
+	return ret;
+}
+
+static int lynx_pll_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
+{
+	int frate_sel, rfclk_sel;
+	struct lynx_clk *clk = lynx_pll_to_clk(hw);
+	u32 ratio;
+
+	dev_dbg(clk->dev, "round pll%d new=%llu parent=%lu\n", clk->idx,
+		(u64)req->rate * HZ_PER_KHZ, req->best_parent_rate);
+
+	frate_sel = lynx_frate_to_sel(req->rate);
+	if (frate_sel < 0)
+		return frate_sel;
+
+	/* Try the current parent rate */
+	rfclk_sel = lynx_rfclk_to_sel(req->best_parent_rate);
+	if (rfclk_sel >= 0) {
+		ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
+		if (ratio) {
+			req->rate = mult_frac(req->best_parent_rate, ratio,
+					      HZ_PER_KHZ);
+			return 0;
+		}
+	}
+
+	/* Try all possible parent rates */
+	for (rfclk_sel = 0;
+	     rfclk_sel < ARRAY_SIZE(rfclk_sel_map);
+	     rfclk_sel++) {
+		unsigned long new_parent_rate;
+
+		ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
+		if (!ratio)
+			continue;
+
+		/* Ensure the reference clock can produce this rate */
+		new_parent_rate = rfclk_sel_map[rfclk_sel];
+		new_parent_rate = clk_hw_round_rate(req->best_parent_hw,
+						    new_parent_rate);
+		if (rfclk_sel != lynx_rfclk_to_sel(new_parent_rate))
+			continue;
+
+		req->rate = mult_frac(new_parent_rate, ratio, HZ_PER_KHZ);
+		req->best_parent_rate = new_parent_rate;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int lynx_pll_set_rate(struct clk_hw *hw, unsigned long rate_khz,
+			     unsigned long parent_rate)
+{
+	int frate_sel, rfclk_sel;
+	struct lynx_clk *clk = lynx_pll_to_clk(hw);
+	u32 ratio, cr0 = lynx_read(clk, PLLaCR0(clk->idx));
+
+	dev_dbg(clk->dev, "set rate pll%d new=%llu parent=%lu\n", clk->idx,
+		(u64)rate_khz * HZ_PER_KHZ, parent_rate);
+
+	frate_sel = lynx_frate_to_sel(rate_khz);
+	if (frate_sel < 0)
+		return frate_sel;
+
+	rfclk_sel = lynx_rfclk_to_sel(parent_rate);
+	if (rfclk_sel < 0)
+		return rfclk_sel;
+
+	ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
+	if (!ratio)
+		return -EINVAL;
+
+	lynx_pll_stop(clk);
+	cr0 &= ~(PLLaCR0_RFCLK_SEL | PLLaCR0_FRATE_SEL);
+	cr0 |= FIELD_PREP(PLLaCR0_RFCLK_SEL, rfclk_sel);
+	cr0 |= FIELD_PREP(PLLaCR0_FRATE_SEL, frate_sel);
+	lynx_write(clk, cr0, PLLaCR0(clk->idx));
+	/* Don't bother resetting if it's off */
+	if (cr0 & PLLaCR0_POFF)
+		return 0;
+	return lynx_pll_reset(clk);
+}
+
+static const struct clk_ops lynx_pll_clk_ops = {
+	.prepare = lynx_pll_prepare,
+	.disable = lynx_pll_disable,
+	.is_enabled = lynx_pll_is_enabled,
+	.recalc_rate = lynx_pll_recalc_rate,
+	.determine_rate = lynx_pll_determine_rate,
+	.set_rate = lynx_pll_set_rate,
+};
+
+static void lynx_ex_dly_disable(struct clk_hw *hw)
+{
+	struct lynx_clk *clk = lynx_ex_dly_to_clk(hw);
+	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
+
+	cr0 &= ~PLLaCR0_DLYDIV_SEL;
+	lynx_write(clk, PLLaCR0(clk->idx), cr0);
+}
+
+static int lynx_ex_dly_enable(struct clk_hw *hw)
+{
+	struct lynx_clk *clk = lynx_ex_dly_to_clk(hw);
+	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
+
+	cr0 &= ~PLLaCR0_DLYDIV_SEL;
+	cr0 |= FIELD_PREP(PLLaCR0_DLYDIV_SEL, PLLaCR0_DLYDIV_SEL_16);
+	lynx_write(clk, PLLaCR0(clk->idx), cr0);
+	return 0;
+}
+
+static int lynx_ex_dly_is_enabled(struct clk_hw *hw)
+{
+	struct lynx_clk *clk = lynx_ex_dly_to_clk(hw);
+
+	return lynx_read(clk, PLLaCR0(clk->idx)) & PLLaCR0_DLYDIV_SEL;
+}
+
+static unsigned long lynx_ex_dly_recalc_rate(struct clk_hw *hw,
+					     unsigned long parent_rate)
+{
+	return parent_rate / 16;
+}
+
+static const struct clk_ops lynx_ex_dly_clk_ops = {
+	.enable = lynx_ex_dly_enable,
+	.disable = lynx_ex_dly_disable,
+	.is_enabled = lynx_ex_dly_is_enabled,
+	.recalc_rate = lynx_ex_dly_recalc_rate,
+};
+
+static int lynx_clk_init(struct clk_hw_onecell_data *hw_data,
+			 struct device *dev, struct regmap *regmap,
+			 unsigned int index, bool compat)
+{
+	const struct clk_hw *ex_dly_parents;
+	struct clk_parent_data pll_parents[1] = { };
+	struct clk_init_data pll_init = {
+		.ops = &lynx_pll_clk_ops,
+		.parent_data = pll_parents,
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_PARENT |
+			 CLK_OPS_PARENT_ENABLE,
+	};
+	struct clk_init_data ex_dly_init = {
+		.ops = &lynx_ex_dly_clk_ops,
+		.parent_hws = &ex_dly_parents,
+		.num_parents = 1,
+	};
+	struct lynx_clk *clk;
+	int ret;
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return -ENOMEM;
+
+	clk->dev = dev;
+	clk->regmap = regmap;
+	clk->idx = index;
+
+	pll_parents[0].fw_name = kasprintf(GFP_KERNEL, "ref%d", index);
+	pll_init.name = kasprintf(GFP_KERNEL, "%s.pll%d_khz", dev_name(dev),
+				  index);
+	ex_dly_init.name = kasprintf(GFP_KERNEL, "%s.pll%d_ex_dly_khz",
+				     dev_name(dev), index);
+	if (!pll_parents[0].fw_name || !pll_init.name || !ex_dly_init.name) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	if (compat)
+		pll_init.flags |= CLK_IGNORE_UNUSED;
+	clk->pll.init = &pll_init;
+	ret = devm_clk_hw_register(dev, &clk->pll);
+	if (ret) {
+		dev_err_probe(dev, ret, "could not register %s\n",
+			      pll_init.name);
+		goto out;
+	}
+
+	ex_dly_parents = &clk->pll;
+	clk->ex_dly.init = &ex_dly_init;
+	ret = devm_clk_hw_register(dev, &clk->ex_dly);
+	if (ret)
+		dev_err_probe(dev, ret, "could not register %s\n",
+			      ex_dly_init.name);
+
+	hw_data->hws[LYNX10G_PLLa(index)] = &clk->pll;
+	hw_data->hws[LYNX10G_PLLa_EX_DLY(index)] = &clk->ex_dly;
+
+out:
+	kfree(pll_parents[0].fw_name);
+	kfree(pll_init.name);
+	kfree(ex_dly_init.name);
+	return ret;
+}
+
+#define NUM_PLLS 2
+#define NUM_CLKS (NUM_PLLS * LYNX10G_CLKS_PER_PLL)
+
+int lynx_clks_init(struct device *dev, struct regmap *regmap,
+		   struct clk *plls[2], struct clk *ex_dlys[2], bool compat)
+{
+	int ret, i;
+	struct clk_hw_onecell_data *hw_data;
+
+	hw_data = devm_kzalloc(dev, struct_size(hw_data, hws, NUM_CLKS),
+			       GFP_KERNEL);
+	if (!hw_data)
+		return -ENOMEM;
+	hw_data->num = NUM_CLKS;
+
+	for (i = 0; i < NUM_PLLS; i++) {
+		ret = lynx_clk_init(hw_data, dev, regmap, i, compat);
+		if (ret)
+			return ret;
+
+		plls[i] = devm_clk_hw_get_clk(dev,
+					      hw_data->hws[LYNX10G_PLLa(i)],
+					      NULL);
+		if (IS_ERR(plls[i]))
+			return PTR_ERR(plls[i]);
+
+		ex_dlys[i] = devm_clk_hw_get_clk(dev,
+						 hw_data->hws[LYNX10G_PLLa_EX_DLY(i)],
+						 NULL);
+		if (IS_ERR(ex_dlys[i]))
+			return PTR_ERR(plls[i]);
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, hw_data);
+	if (ret)
+		dev_err_probe(dev, ret, "could not register clock provider\n");
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(lynx_clks_init);
+
+MODULE_AUTHOR("Sean Anderson <sean.anderson@seco.com>");
+MODULE_DESCRIPTION("Lynx 10G PLL driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index 853958fb2c06..5d461232276f 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -47,3 +47,9 @@ config PHY_FSL_LYNX_28G
 	  found on NXP's Layerscape platforms such as LX2160A.
 	  Used to change the protocol running on SerDes lanes at runtime.
 	  Only useful for a restricted set of Ethernet protocols.
+
+config PHY_FSL_LYNX_10G
+	tristate
+	depends on COMMON_CLK
+	depends on ARCH_LAYERSCAPE || PPC || COMPILE_TEST
+	select REGMAP_MMIO
diff --git a/include/linux/phy/lynx-10g.h b/include/linux/phy/lynx-10g.h
new file mode 100644
index 000000000000..b7b80b3ee988
--- /dev/null
+++ b/include/linux/phy/lynx-10g.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
+ */
+
+#ifndef LYNX_10G
+#define LYNX_10G
+
+struct clk;
+struct device;
+struct regmap;
+
+int lynx_clks_init(struct device *dev, struct regmap *regmap,
+		   struct clk *plls[2], struct clk *ex_dlys[2], bool compat);
+
+#endif /* LYNX 10G */
-- 
2.35.1.1320.gc452695387.dirty

