Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 867795ABA53
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 23:44:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MKBJZ38nQz3cH8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 07:44:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=pu6o/WZX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.45; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=pu6o/WZX;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MKB9D0spfz3bc8
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 07:38:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffe78xI/CmYZBPbkpBBixtwcrLQYWxVD1klwWdI0vU5eA8IYQfw+oK9eIZUbKImiLqKE/OdJOuujz00vFlWA+2ZrEojZgngKT0jhA8oh2wDMRHr1aa6ND0+i1/gcMg7sTlpvO21SctZEnGjcuepEromat75IvN8H8y5akAjHBa6xkQPhd32qPAU2+G+TivNDPm5aGWuSI3MSDOs8ez0tUv2HjjuPDaV3xyfo186ncCP7R7E0jOlnqC/WnAExkqenHazL4jpmSbWMv1bWSR6EguXjrlPp1d/7j8cGRhL3LmzO/WRKbUdImoCmmDlmqu3zDoKU6qklWxEk61XaCCsvxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Yimu2SXg+ru0Z7zJvJW9R0juWmRo7I4wWq7bdhgN9s=;
 b=nHH+Iq/kpYLZmohrp4xosTIyW9wRCQtRrL+dM9IrhCI6MgzraTBkplrnYRFNgwkxjgjFkvApBL6duazGGlVDLb72kbT/OAuvlfnSVwMVR0QJF2gX6vhCoeyx8ICIIwoL6nY8GxEuZHo9UnlDE8DJyRun8bAcaKbYwe4gqchSN+R5DdRAf/hniFepwLOlbVDFBPZEiDUoAAHJ1qk03qoK5ChjDRHs8dJ+sE5o7LHb5xZ4Nd+pePLhDjUtVsMVghXz9e9C+AU8NdqbtHCAljCFmP/gfgv2hwqkC0XmUGAzHnY+Erl/xHNYjE6YpZVmr0bklhl4SUXuXH5Wsm0avT89eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Yimu2SXg+ru0Z7zJvJW9R0juWmRo7I4wWq7bdhgN9s=;
 b=pu6o/WZXBxIPVdsVfpIbE7mHA0JbsZquPDW8G1RxY4T+JO4AN4aS8rZuYGNvP1BGOg56Wz1T+T6dUzJQYZzrXfzUvhaF7uVs0FAjDtIPhq+puSUhD14WPS0Di+TdOKN/hMIcyIwSGILCBbvTvzd+PsD4b/g2AKVMYqdvX7anPHFexW/xU3OHQihhSKHrs2tvTbAAvcXeAyOAbzbGsNwpdE+J3q4DORqB/zW9H8ruK53bETWkxNGylmrnLmzlJg18gmxL1iY1xU6/B3EmvFNJRlN5qJx8DQXkm/9M0WDWA1E7DhEZRqcmaoWJC7WjV63/5vnusKXOatt5ei9A4j15Jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by PAXPR03MB7886.eurprd03.prod.outlook.com (2603:10a6:102:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Fri, 2 Sep
 2022 21:37:39 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5566.019; Fri, 2 Sep 2022
 21:37:38 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v5 0/8] phy: Add support for Lynx 10G SerDes
Date: Fri,  2 Sep 2022 17:37:13 -0400
Message-Id: <20220902213721.946138-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:208:239::13) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e6b7d77-d0cc-4b8b-8f95-08da8d2b5b71
X-MS-TrafficTypeDiagnostic: PAXPR03MB7886:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HnXXMsLGEwLvGRMlirkoB3OIX1MuW3Ag/8het7ET6J17RdBKVdi9ZPrIv8a3WUG4OD7mkSdvpkKMqlMyGqOFUiRJ8C66q7MDojPSOnmNXfXfmE/GLXR87BZ+zHW+IBYd+ieJR89s5EYwoLlvy8izcr3is+vGsR3+35Q5iaeAkvCrY2NhRAK3atr0Sy7sQQwVOpJPPRJVtT3FahdYCuGGpuFhG3BawGoFvSkNW3L36P9MnU64SS0b15A5UrW3BTP+LGrL8pNn4z7bULI6BLl5vREInRR2a2FlYZtFYRMFGyEBY+VSB78UZQW3mRTFF2ECIXtop8ieN9f9/beUsQdW6hdEMzKna/gv4CT2aLsoNPWm3JaPy3C64sBa/1hvwCNrEoCjGQ1NwqrouhFCH7j1eTTk9Havy9v5hr5qCHIt+u54TeAOsdGuKByW6TR3fsNi+fYweTv5RODL04bYfIbjMB+i/+Gcc3GdV/cgLNrf+5nRtgs/7VVaiQSmUKHtJDLzcJqD+yA7im/CeBagozOKp7U3MY9W7rfc28QGN4endDGlWBbGHMb2ROE0ALc9yq9Cd1uNzxlDdEqzELuZfX1C1uJNsz7SmQuv4ILAihNh5TYGuslDaGyxXepiGKxdBoKqHnXEmWdeUX+sMFpMyB8m4cnD9Iub5q7ovySVK2WHFh8/CBOpnrQnse7/wGaqrGasY5BN3tErSS7jUf7Y+xq2JtFKFtGusF6QXPsyxyr6iE0+bCLGlAVlkIT0bi7spFdK4lV8gAdgNK81kHSy2cKgsw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(366004)(376002)(39850400004)(110136005)(54906003)(38100700002)(316002)(36756003)(186003)(1076003)(38350700002)(2616005)(86362001)(6486002)(8676002)(4326008)(66946007)(66556008)(83380400001)(66476007)(2906002)(52116002)(6506007)(6512007)(26005)(8936002)(5660300002)(478600001)(6666004)(7416002)(41300700001)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?PnMRLUormhNlXZH9863380Mk2fdsKzJxRpdFQ+ruU3Mq69Mq1HwdhUSxWToB?=
 =?us-ascii?Q?yLyCoR1sb6ATkvwgd8VtHDf2XgysXkLOLdY6UqwlgmUBSIlahJwtbDnQ2W7+?=
 =?us-ascii?Q?sJgj4jE3FlWZWkOsRuzDwsSEJQGfwbdkiDmAebcU6OmDdtCkIAYixGCxnNVt?=
 =?us-ascii?Q?kV7CByeGZhX5/GATiNiuYZMJudTjXWvONdoqJ+Mg9o/9ysxRhNRN1fZJGJsl?=
 =?us-ascii?Q?RWZtDNqWZJ2FzpT2nwvekiI3Ghn2+rBQ3Zm6GgpIKRgGZ3UxcD4aa0JpUeTH?=
 =?us-ascii?Q?yCbt9Fpm9F7nBa6lNaEs3/1UC2FqUcE+ow0F6TSoF0om3fYk6oGpw3+V5Ifd?=
 =?us-ascii?Q?+m+HCrEB/HbkpF+ocPiL86p1nEDJ97vfwWaBk34BvsZx9QQpoO8CZ1spdoUJ?=
 =?us-ascii?Q?NKaT6HVFWNcrTKO8A4Tf/iyFBkNAxk/0/USDcAr8PasMCWJbG5PnN3UkAkFM?=
 =?us-ascii?Q?YDa8aSQjTQkLWzKKf/N0Um0Y5Oun397x/Ong4Hyxibc/j/1Op7c7zcnh5ERz?=
 =?us-ascii?Q?3yWIZHvQrwYNNrhIzlK4y++CBLWgxkgJelL6NHYik9F3PLn6/VFXtpLKwldJ?=
 =?us-ascii?Q?2AhNXbCOHw8woqyDiEZ1A7CoYmFQlyAPq/KWTMt1MbwW8wmCiukfzsvjnb7T?=
 =?us-ascii?Q?vEq30+4X9BUEV8jx53v27akrwCrT7LXP7OvxN81iFdcXaq8pKWRduN8rOXdD?=
 =?us-ascii?Q?BiDHeudi26DkCfWlmA+9N0iW0rmCDSvE3HG8TEf5xWh53aqWd4fNEGn+/lDH?=
 =?us-ascii?Q?qLosUzoSHpJNusA/YWQ6Qo0FT6KIFvzNMIflGbKupqjxXsnIq2hnjuhIiSRJ?=
 =?us-ascii?Q?SHUyFuvLl/2Ag+dt6fqyLTIFFYzaJlwyrUM3ZD8yckcujuwFk8gt1+if6eWb?=
 =?us-ascii?Q?T2Hw9z0BjPyOkHwOVV4bupoXUhkmuYKU8gC0O0Jt69fHNV0e02WqKYyqzGxm?=
 =?us-ascii?Q?NAOM2y6V2gHBQSMV2JsZMW94ZM8DbBgqncOiFOnbLHTwCcR0QHcZbhGv8N77?=
 =?us-ascii?Q?+g9CvAATwXq46/pSIk/H8oU+HgsrtWWgeCohhIIUF70ADNnD+wIqdkbUZ7dT?=
 =?us-ascii?Q?Gs/W8QyFdY+al30olucIONme+5e4SDIlFl3anUc+yEU5kcqmU9hkT2xNWD7I?=
 =?us-ascii?Q?m8+74f57NfoOqKyZiOwl4LlmoIGjaws89cq74ZbBikWegu7ziy0p1280l3TA?=
 =?us-ascii?Q?SDyOqeNY+xo9fuQ+qULP/oaMoW4DyqCBfRIMccVgsvtqx6F9WQ29t8psMkc1?=
 =?us-ascii?Q?0rUfsvBFRx0ONNwuvdzgNiXluySP2+wddnzezm+wYiQCFlboHIjSRTLLxKc2?=
 =?us-ascii?Q?k1z7SymJ3hjVARb8eIw+a3RwltHW7E1Kr8/AmTPUgBl2DblS7jnmRXKXNP4s?=
 =?us-ascii?Q?EKSW0N7hr/elb1OAUIDA2XYYQ8cW8ntzXY+trYGTwH7+Q/suoUbY92fHg4ss?=
 =?us-ascii?Q?6TCYHfldATwmRoQXnakPuyrPACuqrv1V0fHTfpf+isZP3eWSLAsPgXiRaF1Y?=
 =?us-ascii?Q?/dkwEBvx8j6fMBFz3jPfg1Zv6bGprBierCKSEkgtjsQ+knaMepfBDsER2hyv?=
 =?us-ascii?Q?+UsnOfLzfZASxQscZC9oNvp1B4zabAh0pg4uGkR1Ii0JpQVoCEWjIE44VMgz?=
 =?us-ascii?Q?eA=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6b7d77-d0cc-4b8b-8f95-08da8d2b5b71
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 21:37:38.5500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/AbRSQCiWlWz6HCFdpjwwlnR95KOSxdZQfWiyaVSdT66UoJrwYaPIzd/wlRLpMO7SzA6sxXB3m1SF4CxVIdHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7886
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Shawn Guo <shawnguo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds support for the Lynx 10G SerDes found on the QorIQ T-series
and Layerscape series. Due to limited time and hardware, only support
for the LS1046ARDB is added in this initial series. There is a sketch
for LS1088ARDB support, but it is incomplete.

Dynamic reconfiguration does not work. That is, the configuration must
match what is set in the RCW. From my testing, SerDes register settings
appear identical. The issue appears to be between the PCS and the MAC.
The link itself comes up at both ends, and a mac loopback succeeds.
However, a PCS loopback results in dropped packets. Perhaps there is
some undocumented register in the PCS?

I suspect this driver is around 95% complete, but, unfortunately, I no
longer have time to investigate this further.

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

Sean Anderson (8):
  dt-bindings: phy: Add 2500BASE-X and 10GBASE-R
  dt-bindings: phy: Add Lynx 10G phy binding
  dt-bindings: clock: Add ids for Lynx 10g PLLs
  phy: fsl: Add Lynx 10G SerDes driver
  arm64: dts: ls1046a: Add serdes bindings
  arm64: dts: ls1088a: Add serdes bindings
  arm64: dts: ls1046ardb: Add serdes bindings
  [WIP] arm64: dts: ls1088ardb: Add serdes bindings

 .../devicetree/bindings/phy/fsl,lynx-10g.yaml |  236 ++++
 Documentation/driver-api/phy/index.rst        |    1 +
 Documentation/driver-api/phy/lynx_10g.rst     |   66 +
 MAINTAINERS                                   |    7 +
 .../boot/dts/freescale/fsl-ls1046a-rdb.dts    |  112 ++
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   18 +
 .../boot/dts/freescale/fsl-ls1088a-rdb.dts    |  161 +++
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |   18 +
 drivers/phy/freescale/Kconfig                 |   20 +
 drivers/phy/freescale/Makefile                |    3 +
 drivers/phy/freescale/lynx-10g.h              |   16 +
 drivers/phy/freescale/phy-fsl-lynx-10g-clk.c  |  501 +++++++
 drivers/phy/freescale/phy-fsl-lynx-10g.c      | 1162 +++++++++++++++++
 include/dt-bindings/clock/fsl,lynx-10g.h      |   14 +
 include/dt-bindings/phy/phy.h                 |    2 +
 15 files changed, 2337 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
 create mode 100644 Documentation/driver-api/phy/lynx_10g.rst
 create mode 100644 drivers/phy/freescale/lynx-10g.h
 create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g-clk.c
 create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g.c
 create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h

-- 
2.35.1.1320.gc452695387.dirty

