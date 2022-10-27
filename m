Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C67E361013F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 21:12:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MywL846wvz3cDM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 06:12:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=1e7A0X9Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.46; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=1e7A0X9Y;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MywK810lcz3c9q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 06:11:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWm6+xLXnDBsNVxNBSN2/O8MB5eCy8XvNAaPZYISJ/L4mBD3Ru4uoHf6TFemTPe32v4ovDoZgGxJXxyCJ/AQSPPaQeH8AsgVPuv09hGLbqJ0OHFCq10U6j1CtP1eMT7etMoYXeSwcSUc2q8iEISQqLUIJlC2fSWYV5aAjRSOChnY/fsw3rixi5fPvh3KmhpiIp8dPXrCCWpGJX5bLNpMtuN7yP+5Qu3I+TNraAurFD2FfWRWWmiElNaSqNKtG1OjelBfPqfeQOA4hq9iTeWzTJVgviznkkaEDowASStGzpXTSuRDJtkEuL0QgJl93CkEDEbVqcd7cIOFve5ZOJF2og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXrL96IqTA+ohXhZroBeQPg/au5syp16Nx1nCKeQ6Qs=;
 b=IKjVkTUg855Ix0tGdmAOBzui1Deznp8hn1I0bwqKkFPjW1Il9n9dlNwSaxSOCD51+nctHzzreYpWxbUgHlkqtCsozvSljXqKsL1cZ3cujB+kn1nXsSJede3TKD/KBABfKRwtWWsYfZjR2ZqElXbcI4Ue3r/VUI2tGeNePd73hc+y1pugAoE9ThiewJB/yvBsBcwXyQfLJhgToKZMxjkEEG10wtUwhIl7wosQ/6tIE9DNSem7lZK+u/owlmZ+eD3qneUp+i5qnt3uTbE+QzrD34aHXf2HvatfsQQA36l2X63X6AkpoVt/TYQ7W3TWf9BvGUr5AtiSmty/RFehITfzyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXrL96IqTA+ohXhZroBeQPg/au5syp16Nx1nCKeQ6Qs=;
 b=1e7A0X9Ygednfl03CIPZt2bdxleJtz1AdYpH9+RjE0xZsl0gM76MU0nsaZlOsNlzs33ovnMeNYMJ90cUg4E1NO9KXmaHQtq/GKNaB0v/WfsrGlVyYNgNCxk6/ECD+1iT5jRbkla+mVC/yyWAvsVRUNpWfvPv31C2LTJD6V4MHCWFtx7ha8TgZhHM2rQzlgEpI+4LS45plyBeAgPD3Iu7AbRXsjytGsGs54II2ntUEtE0mELuGKIrd/Dc5USJ6oJ+b9Q7Q7SAXjoLdtEeRgwK6JotTFT2wPPoW0fSEcB+vNDrufxjDFKH7HfzFqvZi+kTRJ5glvS0iQsYOcygbDJR/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com (2603:10a6:803:c5::12)
 by AS2PR03MB9648.eurprd03.prod.outlook.com (2603:10a6:20b:5e8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 19:11:27 +0000
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::3d5c:1e59:4df8:975d]) by VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::3d5c:1e59:4df8:975d%6]) with mapi id 15.20.5769.014; Thu, 27 Oct 2022
 19:11:27 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v8 0/9] phy: Add support for Lynx 10G SerDes
Date: Thu, 27 Oct 2022 15:11:04 -0400
Message-Id: <20221027191113.403712-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::13) To VI1PR03MB4973.eurprd03.prod.outlook.com
 (2603:10a6:803:c5::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR03MB4973:EE_|AS2PR03MB9648:EE_
X-MS-Office365-Filtering-Correlation-Id: 068e8d13-6476-44b4-6c49-08dab84f0bff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+fDRe4GfibFp9KSio1F2p3N3VQwW6kArj7/f4a9p/wPrwEH/uk7g7SiFVO2wJTp1xwoRkuXO6BErTaQp7CJxm9BMf/tpK5MjHqM7sAX/PADwuXxSe+EvSmSyJz/Iw8i58Yn20Ys6TEIoqVx6U5Pge6pi+6FG6Ss9HfcD+FrLD7MOi4Jdj7O27yy1EifriNkfwKLlRZvlCoG4p1igvDEj7EMOxhc4B8KoDQx5t5z8zZPt3/bW1sUtRHUJhI5UFEhZzWk8iKN8CLrJq4yWvm8HDFa+MpT/PWdLfDZGsPB2chr37w8yZleoIQGfKkSP9cHco8a1H30I2aI8VyA7q5c24QW4n72l3W8Viqyrdy8ktLCeGRrJ0ufhWBwoVpaKLBbZXUXjhV8AO+iZ/R/yJFG/EVD2zU607DCxzwxj/VmcOmtR9RHYS3swXVG1RqhiupRzlzn3bGRuDToqqrgJr83fk0i/myMI/wN5Scpiuv2i+Zy07juDiU69zxBWzmrmknbvSPzdj3iGcK7vWM6jxKbGH+U39wb9YyMlwHO7t7DzuDjf4ZrLVHzdjmvOmhw9tcPU+jqr7zyS0GgLENwcfqa86Y+eecVWFHnWJYiIxC7lL1BKd7MssMD9loSHWo6pxeEGtkhADHXaYRDOz754LhkTevrVB4Oyb8E8RgRwF+fLiAwxqVvAOwyeCiEO1oBLYauama2//sXWG7w4HHXqVdb9KIJpspK9d46wsm/5Ri7ExkM63wa3PrA1bnKy7as7DFoh/wWffvQwlUZQA3YxvyANsg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4973.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(366004)(396003)(376002)(346002)(136003)(451199015)(110136005)(478600001)(5660300002)(54906003)(83380400001)(38100700002)(6486002)(7416002)(2906002)(44832011)(36756003)(66556008)(66946007)(8676002)(41300700001)(66476007)(316002)(4326008)(8936002)(6512007)(1076003)(186003)(2616005)(6666004)(86362001)(38350700002)(26005)(52116002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ZtQRJXXixpi1ufqXeiNrUCsDpjbFCrvkr3mZQ4dCklyFo1A/indU7vVI/YB+?=
 =?us-ascii?Q?EWS/SPX6V97SK1+0MJY42q+ce+tuQx7NOWfgvIWQSPZspOJJ3bKJJF3teuwn?=
 =?us-ascii?Q?/NZyOU2VuVJV+XU0u+VW9x8yGG0lEpKcUOC8pgIAXuHq5nzBrm9JjtSA8Pyz?=
 =?us-ascii?Q?h1UYH7eADbU1o75RqYa5tTst01ZSI+3WuBF/7oJRBODswR9XnuQjTpbIlOYF?=
 =?us-ascii?Q?JxSIby0uQXEiy1GaDCW+SZh3UhEeGchoZTpN4RL4utjmRatjdAtEjEe+9q+N?=
 =?us-ascii?Q?x2KcdxQsfzBWwkTzkCJbVaybHNe7fObN7Z+6KLJjl5s/2c3S3BD1SPXWDa9E?=
 =?us-ascii?Q?X8drzPYIl/PAtvN+RdhyNCJbrLiShK+tqQdAYACFoOcl4notlHUuTH2x6Fxs?=
 =?us-ascii?Q?Vglx9obM0s3rP2oyGmLndBN2iMmMQaSnfUdwtGjF3CoiC05fkPPWfVZtFbbL?=
 =?us-ascii?Q?a5GoCDmmUlhLYebVRgdZAoZ81jrZC9EIzCQCfm6ET1g4fCyWssxg/5A4HDRN?=
 =?us-ascii?Q?oSNbgfQUgKO5uxC8fIdgrp7l5QcTx5A6KqlFYu8jxT4EYujIm8gHE0qa6X75?=
 =?us-ascii?Q?x8VrrtHmdneG38QIObZT2JMInscpEuPoVRNVvbecAqERZTJhTXarpZYBZEBl?=
 =?us-ascii?Q?+CAiilxA+KVske5pymAMY/suJmIvty+rMr+1qD/PSJrKrxPOxQCSRekIly3t?=
 =?us-ascii?Q?Qtk4ygVCsWA6VOaVsG9fuD5iXpxTJJpU5ZT4XqZPXIs3UB3QJjXBxISL+h7N?=
 =?us-ascii?Q?nwaXsbtbD+aD4GGopewvRzdesolBRUvwJbkaDPWSZpXpF4mkiKL5Ro1Q2KlA?=
 =?us-ascii?Q?4oNDTud/vqGI0O3OWXmf2DruQzddzKawEL99PF+Hd+FuSMRPr6sV3Df1+gfu?=
 =?us-ascii?Q?MPYyLPs//+SCU2AwnWv4cYXm2pmJHZeGdbiZsTbS4DlKrPtQWdoi8RgKH25J?=
 =?us-ascii?Q?PJraKPKtXp4nJjaqFdVApK3XMrTNWTWJ0Snk4kpxjVuIsRqQaI5OrGsWhA7a?=
 =?us-ascii?Q?uBk6zxg+opybqjBuVjTXz9syIkOgFVLMaTSV6F/O90/VIx3MGH5JFOAvV5s+?=
 =?us-ascii?Q?NXvdF81PxOMlFkD+9LXJ/S5jH8LqH9pVVL880ghILPiiRMmO9DR8hoOxf+XQ?=
 =?us-ascii?Q?BlNeVfMIn/jp65ro4fJHxw/2dX0PY7+3eH55RN2dTy2v5mHC7W/TVYBUI/wf?=
 =?us-ascii?Q?Q/QExPlGkEdmJiVjGkb3ZjMI5n3QPQ63o6+q25l61t4nRcHHcGTbE7uq9lsR?=
 =?us-ascii?Q?OcMRFTwvwawXgAQQKv3OWTqDDbQpkd+lj3mFLT6qw2ye40QlYyXlQYTS3ujD?=
 =?us-ascii?Q?DW7BeUF1RiKQBGsLFyVp7xxjDWtpDgJ9Gn7+Sz7m4lDDGMl8rI3Xlre4WtKY?=
 =?us-ascii?Q?kphmsyecVpUasW0bwwtsn/vaWohC5sZ6zpcFns7TyJYqoYZEdD7/Wf/zQyvF?=
 =?us-ascii?Q?2J1WyDfrBYO+iiQHxZFkETvr4LbjGnx0FY+53Ps/rTeL/p8loQpqXM9kiRcf?=
 =?us-ascii?Q?ZBVbxuFRIorzRHIvcayLPAdGJkLMLkdlxTN8W+aS5OiwDusTGuSzr9Y7GMO6?=
 =?us-ascii?Q?CZhhzDGBhL23g0aW6LYwDFZPzoi+XJEd1yszdntS26bWBcq2Jl44MsUi5Ene?=
 =?us-ascii?Q?kA=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 068e8d13-6476-44b4-6c49-08dab84f0bff
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4973.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 19:11:27.0812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0s7Yr9WcKCihAtz/n9+iJM5b0d1B6DzoJcqh6NoB9z7FI1lOsVRl0Mv96Lj7mVhoNoY2OUGCAjudL8iJZkQ8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9648
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
Cc: devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Shawn Guo <shawnguo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds support for the Lynx 10G SerDes found on the QorIQ T-series
and Layerscape series. Due to limited time and hardware, only support
for the LS1046ARDB and LS1088ARDB is added in this initial series.

This series is based on phy/next, but it requires phylink support. This
is already present for the LS1088A, and it was recently added for the
LS1046A in net-next/master.

Dynamic reconfiguration does not work. That is, the configuration must
match what is set in the RCW. From my testing, SerDes register settings
appear identical. The issue appears to be between the PCS and the MAC.
The link itself comes up at both ends, and a mac loopback succeeds.
However, a PCS loopback results in dropped packets. Perhaps there is
some undocumented register in the PCS?

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

The final patch in this series should not be applied, as it depends on
recent MC firmware (and configuration). See the commit message for
details.

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

Sean Anderson (9):
  dt-bindings: phy: Add 2500BASE-X and 10GBASE-R
  dt-bindings: phy: Add Lynx 10G phy binding
  dt-bindings: clock: Add ids for Lynx 10g PLLs
  phy: fsl: Add Lynx 10G SerDes driver
  arm64: dts: ls1046a: Add serdes bindings
  arm64: dts: ls1046ardb: Add serdes bindings
  arm64: dts: ls1088a: Add serdes bindings
  arm64: dts: ls1088a: Prevent PCSs from probing as phys
  [DO NOT MERGE] arm64: dts: ls1088ardb: Add serdes bindings

 .../devicetree/bindings/phy/fsl,lynx-10g.yaml |  236 ++++
 Documentation/driver-api/phy/index.rst        |    1 +
 Documentation/driver-api/phy/lynx_10g.rst     |   58 +
 MAINTAINERS                                   |    7 +
 .../boot/dts/freescale/fsl-ls1046a-rdb.dts    |  112 ++
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   18 +
 .../boot/dts/freescale/fsl-ls1088a-rdb.dts    |  168 ++-
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |   48 +-
 drivers/phy/freescale/Kconfig                 |   23 +
 drivers/phy/freescale/Makefile                |    3 +
 drivers/phy/freescale/lynx-10g.h              |   16 +
 drivers/phy/freescale/phy-fsl-lynx-10g-clk.c  |  503 +++++++
 drivers/phy/freescale/phy-fsl-lynx-10g.c      | 1159 +++++++++++++++++
 include/dt-bindings/clock/fsl,lynx-10g.h      |   14 +
 include/dt-bindings/phy/phy.h                 |    2 +
 15 files changed, 2356 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
 create mode 100644 Documentation/driver-api/phy/lynx_10g.rst
 create mode 100644 drivers/phy/freescale/lynx-10g.h
 create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g-clk.c
 create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g.c
 create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h

-- 
2.35.1.1320.gc452695387.dirty

