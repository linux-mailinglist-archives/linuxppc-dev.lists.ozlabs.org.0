Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 233B65ABA48
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 23:40:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MKBDF721tz3c9B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 07:40:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=0fiV+D2W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.66; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=0fiV+D2W;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MKB960FNzz2xt3
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 07:38:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+JsZ7LGt+LQYxspRITOWdD+XBgkSqnHxw7fDP75a65XRhVgcNKa9jIjPn952+4qR5Aw+vHtdxgL6FD5rsJx/dkUp+EANgHVeAeLVpvcVFPAeJG+w7xXRz71IByNIyADMD0uWm9Lk30U4G4wtMjZpGeFa9lTjFJZ2O09KxyKcCaSMBJGroKOsyPjqUbjIjvUEKCvdzmrkTx7kb3/lstld4542wsoBidtV7ZthkWkYJxCyM5WWotFSTRLhkkjmBRUKths2TI47o0Ex3vDHY96xatIPfs/fcm795Eqn0+zYQsn3dnZjkZ5lSARYJT5D77QcbIru9jk/pexVnU09uO7ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YeRhW4g1dYryKpI+YqPEuw2mtqFkuve68S5uigRHPLs=;
 b=UCa+iXu7vP6RhbgwRqV82Qj5ZtsbpaHXsxaKL/TTW2Blv+ZKHczcCMIpIgNgo7Q/u1GICAJEGfiUoXvl4wAy2TYAew6Sdnd8+MnrnViej3MuaXwzfqCRTEVBgEh/sicRuC2iVBYbWLFtqqv6gt/81YPVgydeaaXcKjgZckXqyvUoQviAI0ig69D5Xo34DBXCVVuV7FQcsJkCiIdLo4m2eXMLeAHfJ5wYuq7O/1A3qkoPQJ3cRP/UdD5UAyaJKjHgO/bs/e2c3A6qck6X9h1XgkaDNzW8hHNhvEJqm0fxVl/PgMfNTi/darsvC0SPIcdw4jb0BfAjESSXtsu414RayQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YeRhW4g1dYryKpI+YqPEuw2mtqFkuve68S5uigRHPLs=;
 b=0fiV+D2WQB/8+IaBPAlrQbJQ8gVJekeeNRVPXpPWDhs0oLYpPtgUGC5L62ewgwHS5uSrpiyetpym873hnu7zCHpbmTbQngbiLb0QGJqh/Nq0JK8afufqur/8FO+cG/hMRY23LDQQ4KSpem1yrEwxoeGf7e6q293a0Ui1v3+Su7gGmsS1vwz8A00/mopfNfHUQaOhMg6MZQPZ1jLeqwTP8S+wxTe3O8YLRWzo1bKOo+SJS/L+IEwNewjaTKIH5LRdvj1EbHwxRkUooMRrd9SqyhYLFDBkiVWJsX1kXR0E8qxdl7pVHUdfE1YDJTn20vvA76o2UdSloN0N1GqmsrrXtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by PAXPR03MB7886.eurprd03.prod.outlook.com (2603:10a6:102:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Fri, 2 Sep
 2022 21:37:45 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5566.019; Fri, 2 Sep 2022
 21:37:45 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v5 4/8] phy: fsl: Add Lynx 10G SerDes driver
Date: Fri,  2 Sep 2022 17:37:17 -0400
Message-Id: <20220902213721.946138-5-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20220902213721.946138-1-sean.anderson@seco.com>
References: <20220902213721.946138-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:208:239::13) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c68f28d0-520d-4a64-ece2-08da8d2b5f6d
X-MS-TrafficTypeDiagnostic: PAXPR03MB7886:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nFRtljP/qVolRwxIplL5O2hWlREfN/JPHMpXCxfXwqLtGjDyiFO2azM54VHw6py3hqXMFEEN6StJf1bYnmOeOvnzx94PxNt0lp2XHAuestsHYqrFzW65InTF23M+On85H4qFWkVb+FTza7TtoS3FePxL7eHpv/MCsJbmfDqqbStb0KS5ELP59UzrEF+78JRvOqgTNd4kL3oFnAznT+6CZBoMF47bwaoGmIaiDlUsxLHYYR/sxD4eoZyvUHC+H32cf6XKEUxcRZhA3U9XMfm+r7NDIMvO2jHtXVL9B5S8BjbUhLm0YEHg1ieYT6WFgUqgxhlR1tu0sHaUWcddh8NMPuM5VrbLdl83Db8hVTKpfjxTgdcBonqW/a5QQSSwKLta+2R77lyKPWvShjoCo/36xOa/4oZ9fPuKT0Pbx5bziKotgeessKIMS2/SEHfjP7LPvC+K1wd+ADW9dEt8MM0qgSTRaXLpDsM0hO4ws3PjYHe83f1AWvDZCkCNeAVjhZfkj98pSBRPUKWaMDTUf1ToQ+4NceODOKAHdJgnzb7cr2Un12hTVSedaJv021Knw81aZVv5uilvo7RSvKKsC6J1/NOxkAAn3Mw37T3S0L9mIgLaSglmii5SNA8NvYZ9Y6wAXDmISdIX5sUu5x/nr9TCUGKPlZQlhbFlgcJFqQ2AWtUW6u0J2GLUiPmeiNLfgl1kRjXxHGbmfvO2iTQzLf2cyCbZdFb4zzjyKGNANcT5SnB5lhc1lFXacsWfpUrb8HCDqXeHXaI52BXp1bBgLfRzWobKPMfiBNZNoFlghnBdlUSgVcBJpw8XblaVIIHhOyN9
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(366004)(376002)(39850400004)(110136005)(54906003)(38100700002)(316002)(36756003)(186003)(1076003)(38350700002)(2616005)(966005)(86362001)(6486002)(8676002)(4326008)(66946007)(66556008)(83380400001)(66476007)(2906002)(52116002)(6506007)(6512007)(26005)(8936002)(5660300002)(478600001)(6666004)(7416002)(41300700001)(44832011)(30864003)(21314003)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?zuOr3lLSaZDGSTnWyKM4R6aX/7TfmePzweqJHbdO21CVm5rGTSXVQUapD/YV?=
 =?us-ascii?Q?QOIIywDj66ndD1CmlpTRpvwq8GluNoKJ1jObieXMk+hu9xkKzuDcv3oPdcVI?=
 =?us-ascii?Q?ANEnn6V5wBJiskjlyIl8yMaJUfZJOkBN3yQqn3VOKm03ubC72Gpl/kWdMTXF?=
 =?us-ascii?Q?amjlyKnq41o4lgra1LBOwXhjZGRo2U2jzhz7yMJ0trcw9hKkb4tJFew1EVcl?=
 =?us-ascii?Q?Cc/o2Li0QTSji8OJX/gkEpHtBg5zzLOEd9//gLPEMZZBoPxyL/0Tdz6l1slW?=
 =?us-ascii?Q?bJWxNEL/9+Qcum+cF8b5DhfUtA++3jD0uiBEfVYq0sibdvz3/ZK/Wv/2WFik?=
 =?us-ascii?Q?tNeZoiZk8azY46cnqp9h0x2lMRK+Pr8Pan4f8aEy3eD9xsj2HpYGw/a+wrE+?=
 =?us-ascii?Q?6sNKn575Cp73/jhtITdcv/fieHfcnsHNkwil7AeA43S2aktiUMcWL7JfjRSJ?=
 =?us-ascii?Q?xcfth9gcKTQBvS2pXRjlCYQhIuCygafhoQTDXu4e6IKnZOmOA0UW8wPlr3m1?=
 =?us-ascii?Q?vEXg1HfuuZpHesxeT7XnPbHl7zN6za5DBP/VFlhVB5iac5f7tVzB+ZE+3kL4?=
 =?us-ascii?Q?K+n4Dj1hc645y3tLrqM/WGUQzVCtILntLqG2uHoUCHbhzKuFEaWHEDnxKTpM?=
 =?us-ascii?Q?Z9PEy3TsgaE+mrMLWI94IZzImHBgRdsOtWTRw2xQJheQFmyzFhNs0KuoQ3iO?=
 =?us-ascii?Q?jBpA5Tm7d1/s4BNs8eTQ3PhfnVfIOO2mhgm4wJLAAxhLnvnAEhDk8KB7v/S2?=
 =?us-ascii?Q?lc31a3EC39cTsaC+wAyCvkPpWbzdoc9MCYgMRmNibPQlakVIKy8o1bvPYGXa?=
 =?us-ascii?Q?4ewxh8D8RGUTtEBkq/BQ1yuA/94punmxb2R2mkdfVmADLQ8G8y8bfRajdmzN?=
 =?us-ascii?Q?eEnmVgV/avLPKedU2lXmfj4pvXzF9o8BOaR85cHunk/Yb7sfmkacbLJ9VCcD?=
 =?us-ascii?Q?R5sLOI64yLCaRRfwnZ37pn5kUSu5aMonPSIeupQF3s1oAXacHOkXW/vuKCQw?=
 =?us-ascii?Q?Py+993ZZ0vsHfZO74ODZ9wPLbKAEGpPWCE59olLVd3pKzd4fAU8Xc6TRPip/?=
 =?us-ascii?Q?B71Ibj2P1GqK8x2BvbR2vJSLNFt0eNQXdYPaJvu8CZrgF1tOTCkTOo27Qntw?=
 =?us-ascii?Q?zWr1z0HRxhyCg5m8QJa1A0H85JuwC7FKO/yCGg70UtOwMC5seT6F7yMyqsUt?=
 =?us-ascii?Q?tXvmG9EocqmtMIOAox3nnuSfd70lAXof0EtYmIChR8hXH0/Z/LHfD4weUhNe?=
 =?us-ascii?Q?E3nAIKURW8Lw7FpsTlphKD4wkWSlMFsHWgibi308C8h/hv0X3Zbdl8JTZcz+?=
 =?us-ascii?Q?sNPAd81f/of/CFGAxdrbTLcQTpGwOc2iBtBSxWUA5XnKl2UfK5xuIPJstc1t?=
 =?us-ascii?Q?NOTEDEG09jX0Zwll4OVn7kw1PWoOCLs6zhIAXgNP7fmk11yFuIuGpD+l7Wag?=
 =?us-ascii?Q?v5w+AasZI7BfDcLK2nqonvPRiUDF9dzC0IhqsBXiOM2GJqfG7Y+XpPeVnx4F?=
 =?us-ascii?Q?XO6OaSi+Ax7zdJUXitAJIiqxwsUIXI4kFT2fWvtH1fHeZLAFoR/32iNuVrwl?=
 =?us-ascii?Q?MI4TsyM5wij4I5FDHWWXSJZz6wbpJAKGx/gltMaCVzu28KUofDvU5f0+C/Mk?=
 =?us-ascii?Q?3A=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c68f28d0-520d-4a64-ece2-08da8d2b5f6d
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 21:37:45.2527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Jh47RaioFx+SZPVQuiENGIuoGiNcxkMzJpiIWPzpDhFqcWIwg0eQtWCklcYiNHMY2h6iulbLY2n/v9OrOliiw==
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds support for the Lynx 10G "SerDes" devices found on various NXP
QorIQ SoCs. There may be up to four SerDes devices on each SoC, each
supporting up to eight lanes. Protocol support for each SerDes is highly
heterogeneous, with each SoC typically having a totally different
selection of supported protocols for each lane. Additionally, the SerDes
devices on each SoC also have differing support. One SerDes will
typically support Ethernet on most lanes, while the other will typically
support PCIe on most lanes.

There is wide hardware support for this SerDes. It is present on QorIQ
T-Series and Layerscape processors. Because each SoC typically has
specific instructions and exceptions for its SerDes, I have limited the
initial scope of this module to just the LS1046A and LS1088A.
Additionally, I have only added support for Ethernet protocols. There is
not a great need for dynamic reconfiguration for other protocols (except
perhaps for M.2 cards), so support for them may never be added.

Nevertheless, I have tried to provide an obvious path for adding support
for other SoCs as well as other protocols. SATA just needs support for
configuring LNmSSCR0. PCIe may need to configure the equalization
registers. It also uses multiple lanes. I have tried to write the driver
with multi-lane support in mind, so there should not need to be any
large changes. Although there are 6 protocols supported, I have only
tested SGMII and XFI. The rest have been implemented as described in
the datasheet. Most of these protocols should work "as-is", but
10GBASE-KR will need PCS support for link training.

The PLLs are modeled as clocks proper. This lets us take advantage of
the existing clock infrastructure. I have not given the same treatment
to the per-lane clocks because they need to be programmed in-concert
with the rest of the lane settings. One tricky thing is that the VCO
(PLL) rate exceeds 2^32 (maxing out at around 5GHz). This will be a
problem on 32-bit platforms, since clock rates are stored as unsigned
longs. To work around this, the pll clock rate is generally treated in
units of kHz.

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

The general API call list for this PHY is documented under the driver-api
docs. I think this is rather standard, except that most drivers configure
the mode (protocol) at xlate-time. Unlike some other phys where e.g. PCIe
x4 will use 4 separate phys all configured for PCIe, this driver uses one
phy configured to use 4 lanes. This is because while the individual lanes
may be configured individually, the protocol selection acts on all lanes at
once. Additionally, the order which lanes should be configured in is
specified by the datasheet.  To coordinate this, lanes are reserved in
phy_init, and released in phy_exit.

This driver was written with reference to the LS1046A reference manual.
However, it was informed by reference manuals for all processors with
mEMACs, especially the T4240 (which appears to have a "maxed-out"
configuration). The earlier P-Series processors appear to be similar, but
have a different overall register layout (using "banks" instead of
separate SerDes). Perhaps this those use a "5G Lynx SerDes."

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

Changes in v5:
- Remove references to PHY_INTERFACE_MODE_1000BASEKX to allow this
  series to be applied directly to linux/master.
- Add fsl,lynx-10g.h to MAINTAINERS

Changes in v4:
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

Changes in v2:
- Rename driver to Lynx 10G (etc.)
- Fix not clearing group->pll after disabling it
- Support 1 and 2 phy-cells
- Power off lanes during probe
- Clear SGMIIaCR1_PCS_EN during probe
- Rename LYNX_PROTO_UNKNOWN to LYNX_PROTO_NONE
- Handle 1000BASE-KX in lynx_proto_mode_prep

 Documentation/driver-api/phy/index.rst       |    1 +
 Documentation/driver-api/phy/lynx_10g.rst    |   66 +
 MAINTAINERS                                  |    7 +
 drivers/phy/freescale/Kconfig                |   19 +
 drivers/phy/freescale/Makefile               |    3 +
 drivers/phy/freescale/lynx-10g.h             |   16 +
 drivers/phy/freescale/phy-fsl-lynx-10g-clk.c |  501 ++++++++
 drivers/phy/freescale/phy-fsl-lynx-10g.c     | 1162 ++++++++++++++++++
 8 files changed, 1775 insertions(+)
 create mode 100644 Documentation/driver-api/phy/lynx_10g.rst
 create mode 100644 drivers/phy/freescale/lynx-10g.h
 create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g-clk.c
 create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g.c

diff --git a/Documentation/driver-api/phy/index.rst b/Documentation/driver-api/phy/index.rst
index 69ba1216de72..c9b7a4698dab 100644
--- a/Documentation/driver-api/phy/index.rst
+++ b/Documentation/driver-api/phy/index.rst
@@ -7,6 +7,7 @@ Generic PHY Framework
 .. toctree::
 
    phy
+   lynx_10g
    samsung-usb2
 
 .. only::  subproject and html
diff --git a/Documentation/driver-api/phy/lynx_10g.rst b/Documentation/driver-api/phy/lynx_10g.rst
new file mode 100644
index 000000000000..6e85dcd8fd71
--- /dev/null
+++ b/Documentation/driver-api/phy/lynx_10g.rst
@@ -0,0 +1,66 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================
+Lynx 10G Phy (QorIQ SerDes)
+===========================
+
+Using this phy
+--------------
+
+The general order of calls should be::
+
+    [devm_][of_]phy_get()
+    phy_init()
+    phy_power_on()
+    phy_set_mode[_ext]()
+    ...
+    phy_power_off()
+    phy_exit()
+    [[of_]phy_put()]
+
+:c:func:`phy_get` just gets (or creates) a new :c:type:`phy` with the lanes
+described in the phandle. :c:func:`phy_init` is what actually reserves the
+lanes for use. Unlike some other drivers, when the phy is created, there is no
+default protocol. :c:func:`phy_set_mode <phy_set_mode_ext>` must be called in
+order to set the protocol.
+
+Supporting SoCs
+---------------
+
+Each new SoC needs a :c:type:`struct lynx_conf <lynx_conf>`, containing the
+number of lanes in each device, the endianness of the device, and the helper
+functions to use when selecting protocol controllers. For example, the
+configuration for the LS1046A is::
+
+    static const struct lynx_cfg ls1046a_cfg = {
+        .lanes = 4,
+        .endian = REGMAP_ENDIAN_BIG,
+        .mode_conflict = lynx_ls_mode_conflict,
+        .mode_apply = lynx_ls_mode_apply,
+        .mode_init = lynx_ls_mode_init,
+    };
+
+In addition, you will need to add a device node as documented in
+``Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml``.  This lets the
+driver know which lanes are available to configure.
+
+Supporting Protocols
+--------------------
+
+Each protocol is a combination of values which must be programmed into the lane
+registers. To add a new protocol, first add it to :c:type:`enum lynx_protocol
+<lynx_protocol>`. Add a new entry to `lynx_proto_params`, and populate the
+appropriate fields. Modify `lynx_lookup_proto` to map the :c:type:`enum
+phy_mode <phy_mode>` to :c:type:`enum lynx_protocol <lynx_protocol>`. Update
+the ``mode_conflict``, ``mode_apply``, and ``mode_init`` helpers are updated to
+support your protocol.
+
+You may need to modify :c:func:`lynx_set_mode` in order to support your
+protocol. This can happen when you have added members to :c:type:`struct
+lynx_proto_params <lynx_proto_params>`. It can also happen if you have specific
+clocking requirements, or protocol-specific registers to program.
+
+Internal API Reference
+----------------------
+
+.. kernel-doc:: drivers/phy/freescale/phy-fsl-lynx-10g.c
diff --git a/MAINTAINERS b/MAINTAINERS
index 589517372408..cd9a8683ebe2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11978,6 +11978,13 @@ S:	Maintained
 W:	http://linux-test-project.github.io/
 T:	git git://github.com/linux-test-project/ltp.git
 
+LYNX 10G SERDES DRIVER
+M:	Sean Anderson <sean.anderson@seco.com>
+S:	Maintained
+F:	Documentation/driver-api/phy/lynx_10g.rst
+F:	drivers/phy/freescale/phy-fsl-lynx-10g.c
+F:	include/dt-bindings/clock/fsl,lynx-10g.h
+
 LYNX 28G SERDES PHY DRIVER
 M:	Ioana Ciornei <ioana.ciornei@nxp.com>
 L:	netdev@vger.kernel.org
diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index 853958fb2c06..6820505367cb 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -47,3 +47,22 @@ config PHY_FSL_LYNX_28G
 	  found on NXP's Layerscape platforms such as LX2160A.
 	  Used to change the protocol running on SerDes lanes at runtime.
 	  Only useful for a restricted set of Ethernet protocols.
+
+config PHY_FSL_LYNX_10G
+	tristate "Freescale Layerscale Lynx 10G SerDes support"
+	select GENERIC_PHY
+	select REGMAP_MMIO
+	help
+	  This adds support for the Lynx "SerDes" devices found on various QorIQ
+	  SoCs. There may be up to four SerDes devices on each SoC, and each
+	  device supports up to eight lanes. The SerDes is configured by default
+	  by the RCW, but this module is necessary in order to support dynamic
+	  reconfiguration (such as to support 1G and 10G ethernet on the same
+	  interface). The hardware supports a variety of protocols, including
+	  Ethernet, SATA, PCIe, and more exotic links such as Interlaken and
+	  Aurora. This driver only supports Ethernet, but it will try not to
+	  touch lanes configured for other protocols.
+
+	  If you have a QorIQ processor and want to dynamically reconfigure your
+	  SerDes, say Y. If this driver is compiled as a module, it will be
+	  named phy-fsl-lynx-10g-drv.
diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makefile
index cedb328bc4d2..1f18936507e0 100644
--- a/drivers/phy/freescale/Makefile
+++ b/drivers/phy/freescale/Makefile
@@ -3,4 +3,7 @@ obj-$(CONFIG_PHY_FSL_IMX8MQ_USB)	+= phy-fsl-imx8mq-usb.o
 obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)	+= phy-fsl-imx8qm-lvds-phy.o
 obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)	+= phy-fsl-imx8-mipi-dphy.o
 obj-$(CONFIG_PHY_FSL_IMX8M_PCIE)	+= phy-fsl-imx8m-pcie.o
+phy-fsl-lynx-10g-drv-y			+= phy-fsl-lynx-10g.o
+phy-fsl-lynx-10g-drv-y			+= phy-fsl-lynx-10g-clk.o
+obj-$(CONFIG_PHY_FSL_LYNX_10G)		+= phy-fsl-lynx-10g-drv.o
 obj-$(CONFIG_PHY_FSL_LYNX_28G)		+= phy-fsl-lynx-28g.o
diff --git a/drivers/phy/freescale/lynx-10g.h b/drivers/phy/freescale/lynx-10g.h
new file mode 100644
index 000000000000..75d9353a867b
--- /dev/null
+++ b/drivers/phy/freescale/lynx-10g.h
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
+		   struct clk *plls[2], struct clk *ex_dlys[2]);
+
+#endif /* LYNX 10G */
diff --git a/drivers/phy/freescale/phy-fsl-lynx-10g-clk.c b/drivers/phy/freescale/phy-fsl-lynx-10g-clk.c
new file mode 100644
index 000000000000..adb5f4d0a4d2
--- /dev/null
+++ b/drivers/phy/freescale/phy-fsl-lynx-10g-clk.c
@@ -0,0 +1,501 @@
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
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/math64.h>
+#include <linux/regmap.h>
+#include <linux/units.h>
+#include <dt-bindings/clock/fsl,lynx-10g.h>
+
+#include "lynx-10g.h"
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
+ * @ref: Our reference clock
+ * @dev: The serdes device
+ * @regmap: Our registers
+ * @idx: Which PLL this clock is for
+ */
+struct lynx_clk {
+	struct clk_hw pll, ex_dly;
+	struct clk_hw *ref;
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
+static const u32 rfclk_sel_map[8] = {
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
+static int lynx_rfclk_to_sel(u32 rate)
+{
+	int ret;
+
+	for (ret = 0; ret < ARRAY_SIZE(rfclk_sel_map); ret++) {
+		u32 rfclk_rate = rfclk_sel_map[ret];
+		/* Allow an error of 100ppm */
+		u32 error = rfclk_rate / 10000;
+
+		if (rate > rfclk_rate - error && rate < rfclk_rate + error)
+			return ret;
+	}
+
+	return -EINVAL;
+}
+
+static const u32 frate_sel_map[16] = {
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
+static int lynx_frate_to_sel(u32 rate_khz)
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
+static long lynx_pll_round_rate(struct clk_hw *hw, unsigned long rate_khz,
+				unsigned long *parent_rate)
+{
+	int frate_sel, rfclk_sel;
+	struct lynx_clk *clk = lynx_pll_to_clk(hw);
+	u32 ratio;
+
+	dev_dbg(clk->dev, "round pll%d new=%llu parent=%lu\n", clk->idx,
+		(u64)rate_khz * HZ_PER_KHZ, *parent_rate);
+
+	frate_sel = lynx_frate_to_sel(rate_khz);
+	if (frate_sel < 0)
+		return frate_sel;
+
+	/* Try the current parent rate */
+	rfclk_sel = lynx_rfclk_to_sel(*parent_rate);
+	if (rfclk_sel >= 0) {
+		ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
+		if (ratio)
+			return mult_frac(*parent_rate, ratio, HZ_PER_KHZ);
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
+		new_parent_rate = clk_hw_round_rate(clk->ref, new_parent_rate);
+		if (rfclk_sel != lynx_rfclk_to_sel(new_parent_rate))
+			continue;
+
+		*parent_rate = new_parent_rate;
+		return mult_frac(new_parent_rate, ratio, HZ_PER_KHZ);
+	}
+
+	return -EINVAL;
+}
+
+static int lynx_pll_set_rate(struct clk_hw *hw, unsigned long rate_khz,
+			   unsigned long parent_rate)
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
+	.round_rate = lynx_pll_round_rate,
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
+			 unsigned int index)
+{
+	const struct clk_hw *pll_parents, *ex_dly_parents;
+	struct clk_init_data pll_init = {
+		.ops = &lynx_pll_clk_ops,
+		.parent_hws = &pll_parents,
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_PARENT |
+			 CLK_OPS_PARENT_ENABLE,
+	};
+	struct clk_init_data ex_dly_init = {
+		.ops = &lynx_ex_dly_clk_ops,
+		.parent_hws = &ex_dly_parents,
+		.num_parents = 1,
+	};
+	struct clk *ref;
+	struct lynx_clk *clk;
+	char *ref_name;
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
+	ref_name = kasprintf(GFP_KERNEL, "ref%d", index);
+	pll_init.name = kasprintf(GFP_KERNEL, "%s.pll%d_khz", dev_name(dev),
+				  index);
+	ex_dly_init.name = kasprintf(GFP_KERNEL, "%s.pll%d_ex_dly_khz",
+				     dev_name(dev), index);
+	if (!ref_name || !pll_init.name || !ex_dly_init.name) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	ref = devm_clk_get(dev, ref_name);
+	if (IS_ERR(clk->ref)) {
+		ret = PTR_ERR(clk->ref);
+		dev_err_probe(dev, ret, "could not get %s\n", ref_name);
+		goto out;
+	}
+
+	clk->ref = __clk_get_hw(ref);
+	pll_parents = clk->ref;
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
+	kfree(ref_name);
+	kfree(pll_init.name);
+	kfree(ex_dly_init.name);
+	return ret;
+}
+
+#define NUM_PLLS 2
+#define NUM_CLKS (NUM_PLLS * LYNX10G_CLKS_PER_PLL)
+
+int lynx_clks_init(struct device *dev, struct regmap *regmap,
+		   struct clk *plls[2], struct clk *ex_dlys[2])
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
+		ret = lynx_clk_init(hw_data, dev, regmap, i);
+		if (ret)
+			return ret;
+
+		plls[i] = hw_data->hws[LYNX10G_PLLa(i)]->clk;
+		ex_dlys[i] = hw_data->hws[LYNX10G_PLLa_EX_DLY(i)]->clk;
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, hw_data);
+	if (ret)
+		dev_err_probe(dev, ret, "could not register clock provider\n");
+
+	return ret;
+}
diff --git a/drivers/phy/freescale/phy-fsl-lynx-10g.c b/drivers/phy/freescale/phy-fsl-lynx-10g.c
new file mode 100644
index 000000000000..a4cbb636386d
--- /dev/null
+++ b/drivers/phy/freescale/phy-fsl-lynx-10g.c
@@ -0,0 +1,1162 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
+ *
+ * This driver is for the Lynx 10G phys found on many QorIQ devices, including
+ * the Layerscape series.
+ */
+
+#include <dt-bindings/phy/phy.h>
+#include <linux/clk.h>
+#include <linux/platform_device.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
+#include <linux/regmap.h>
+
+#include "lynx-10g.h"
+
+#define TCALCR		0x90
+#define TCALCR1		0x94
+#define RCALCR		0xa0
+#define RCALCR1		0xa4
+
+#define CALCR_CALRST_B	BIT(27)
+
+#define LS_PCCR_BASE	0x200
+#define PCCR_STRIDE	0x4
+
+#define LS_PCCRa(a)	(LS_PCCR_BASE + (a) * PCCR_STRIDE)
+
+#define PCCR8_SGMIIa_KX		BIT(3)
+#define PCCR8_SGMIIa_MASK	GENMASK(3, 0)
+#define PCCR8_SGMIIa_SHIFT(a)	(28 - (a) * 4)
+
+#define PCCR9_QSGMIIa_MASK	GENMASK(2, 0)
+#define PCCR9_QSGMIIa_SHIFT(a)	(28 - (a) * 4)
+
+#define PCCRB_XFIa_MASK		GENMASK(2, 0)
+#define PCCRB_XFIa_SHIFT(a)	(28 - (a) * 4)
+
+#define LANE_BASE	0x800
+#define LANE_STRIDE	0x40
+#define LNm(m, off)	(LANE_BASE + (m) * LANE_STRIDE + (off))
+#define LNmGCR0(m)	LNm(m, 0x00)
+#define LNmGCR1(m)	LNm(m, 0x04)
+#define LNmSSCR0(m)	LNm(m, 0x0C)
+#define LNmRECR0(m)	LNm(m, 0x10)
+#define LNmRECR1(m)	LNm(m, 0x14)
+#define LNmTECR0(m)	LNm(m, 0x18)
+#define LNmSSCR1(m)	LNm(m, 0x1C)
+#define LNmTTLCR0(m)	LNm(m, 0x20)
+
+#define LNmGCR0_RPLL_LES	BIT(31)
+#define LNmGCR0_RRAT_SEL	GENMASK(29, 28)
+#define LNmGCR0_TPLL_LES	BIT(27)
+#define LNmGCR0_TRAT_SEL	GENMASK(25, 24)
+#define LNmGCR0_RRST_B		BIT(22)
+#define LNmGCR0_TRST_B		BIT(21)
+#define LNmGCR0_RX_PD		BIT(20)
+#define LNmGCR0_TX_PD		BIT(19)
+#define LNmGCR0_IF20BIT_EN	BIT(18)
+#define LNmGCR0_FIRST_LANE	BIT(16)
+#define LNmGCR0_TTRM_VM_SEL	GENMASK(13, 12)
+#define LNmGCR0_PROTS		GENMASK(11, 7)
+
+#define LNmGCR0_RAT_SEL_SAME		0b00
+#define LNmGCR0_RAT_SEL_HALF		0b01
+#define LNmGCR0_RAT_SEL_QUARTER		0b10
+#define LNmGCR0_RAT_SEL_DOUBLE		0b11
+
+#define LNmGCR0_PROTS_PCIE		0b00000
+#define LNmGCR0_PROTS_SGMII		0b00001
+#define LNmGCR0_PROTS_SATA		0b00010
+#define LNmGCR0_PROTS_XFI		0b01010
+
+#define LNmGCR1_RDAT_INV	BIT(31)
+#define LNmGCR1_TDAT_INV	BIT(30)
+#define LNmGCR1_OPAD_CTL	BIT(26)
+#define LNmGCR1_REIDL_TH	GENMASK(22, 20)
+#define LNmGCR1_REIDL_EX_SEL	GENMASK(19, 18)
+#define LNmGCR1_REIDL_ET_SEL	GENMASK(17, 16)
+#define LNmGCR1_REIDL_EX_MSB	BIT(15)
+#define LNmGCR1_REIDL_ET_MSB	BIT(14)
+#define LNmGCR1_REQ_CTL_SNP	BIT(13)
+#define LNmGCR1_REQ_CDR_SNP	BIT(12)
+#define LNmGCR1_TRSTDIR		BIT(7)
+#define LNmGCR1_REQ_BIN_SNP	BIT(6)
+#define LNmGCR1_ISLEW_RCTL	GENMASK(5, 4)
+#define LNmGCR1_OSLEW_RCTL	GENMASK(1, 0)
+
+#define LNmRECR0_RXEQ_BST	BIT(28)
+#define LNmRECR0_GK2OVD		GENMASK(27, 24)
+#define LNmRECR0_GK3OVD		GENMASK(19, 16)
+#define LNmRECR0_GK2OVD_EN	BIT(15)
+#define LNmRECR0_GK3OVD_EN	BIT(14)
+#define LNmRECR0_OSETOVD_EN	BIT(13)
+#define LNmRECR0_BASE_WAND	GENMASK(11, 10)
+#define LNmRECR0_OSETOVD	GENMASK(6, 0)
+
+#define LNmRECR0_BASE_WAND_OFF		0b00
+#define LNmRECR0_BASE_WAND_DEFAULT	0b01
+#define LNmRECR0_BASE_WAND_ALTERNATE	0b10
+#define LNmRECR0_BASE_WAND_OSETOVD	0b11
+
+#define LNmTECR0_TEQ_TYPE	GENMASK(29, 28)
+#define LNmTECR0_SGN_PREQ	BIT(26)
+#define LNmTECR0_RATIO_PREQ	GENMASK(25, 22)
+#define LNmTECR0_SGN_POST1Q	BIT(21)
+#define LNmTECR0_RATIO_PST1Q	GENMASK(20, 16)
+#define LNmTECR0_ADPT_EQ	GENMASK(13, 8)
+#define LNmTECR0_AMP_RED	GENMASK(5, 0)
+
+#define LNmTECR0_TEQ_TYPE_NONE		0b00
+#define LNmTECR0_TEQ_TYPE_POST		0b01
+#define LNmTECR0_TEQ_TYPE_BOTH		0b10
+
+#define LNmTTLCR0_FLT_SEL	GENMASK(29, 24)
+
+#define LS_SGMII_BASE	0x1800
+#define LS_QSGMII_BASE	0x1880
+#define LS_XFI_BASE	0x1980
+
+#define PCS_STRIDE	0x10
+#define CR_STRIDE	0x4
+#define PCSa(a, base, cr)	(base + (a) * PCS_STRIDE + (cr) * CR_STRIDE)
+
+/* https://community.nxp.com/t5/Layerscape/LS1043A-SERDES-PLL-reset-causes-PHY-link-fail/m-p/1375359#M9456 */
+#define PCSaCR0_RST_B		BIT(30)
+#define PCSaCR1_MDEV_PORT	GENMASK(31, 27)
+
+#define LS_SGMIIaCR1(a)		PCSa(a, LS_SGMII_BASE, 1)
+#define SGMIIaCR1_SGPCS_EN	BIT(11)
+
+enum lynx_protocol {
+	LYNX_PROTO_NONE = 0,
+	LYNX_PROTO_SGMII,
+	LYNX_PROTO_SGMII25, /* Not tested */
+	LYNX_PROTO_1000BASEKX, /* Not tested */
+	LYNX_PROTO_QSGMII, /* Not tested */
+	LYNX_PROTO_XFI,
+	LYNX_PROTO_10GKR, /* Link training unimplemented */
+	LYNX_PROTO_LAST,
+};
+
+static const char lynx_proto_str[][16] = {
+	[LYNX_PROTO_NONE] = "unknown",
+	[LYNX_PROTO_SGMII] = "SGMII",
+	[LYNX_PROTO_SGMII25] = "2.5G SGMII",
+	[LYNX_PROTO_1000BASEKX] = "1000BASE-KX",
+	[LYNX_PROTO_QSGMII] = "QSGMII",
+	[LYNX_PROTO_XFI] = "XFI",
+	[LYNX_PROTO_10GKR] = "10GBASE-KR",
+};
+
+#define PROTO_MASK(proto) BIT(LYNX_PROTO_##proto)
+
+/**
+ * struct lynx_proto_params - Parameters for configuring a protocol
+ * @frate_khz: The PLL rate, in kHz
+ * @rat_sel: The divider to get the line rate
+ * @if20bit: Whether the proto is 20 bits or 10 bits
+ * @prots: Lane protocol select
+ * @reidl_th: Receiver electrical idle detection threshold
+ * @reidl_ex: Exit electrical idle filter
+ * @reidl_et: Enter idle filter
+ * @slew: Slew control
+ * @baseline_wander: Enable baseline wander correction
+ * @gain: Adaptive equalization gain override
+ * @offset_override: Adaptive equalization offset override
+ * @preq_ratio: Ratio of full swing transition bit to pre-cursor
+ * @postq_ratio: Ratio of full swing transition bit to first post-cursor.
+ * @adpt_eq: Transmitter Adjustments for 8G/10G
+ * @amp_red: Overall TX Amplitude Reduction
+ * @flt_sel: TTL configuration selector
+ */
+struct lynx_proto_params {
+	u32 frate_khz;
+	u8 rat_sel;
+	u8 prots;
+	u8 reidl_th;
+	u8 reidl_ex;
+	u8 reidl_et;
+	u8 slew;
+	u8 gain;
+	u8 baseline_wander;
+	u8 offset_override;
+	u8 preq_ratio;
+	u8 postq_ratio;
+	u8 adpt_eq;
+	u8 amp_red;
+	u8 flt_sel;
+	bool if20bit;
+};
+
+static const struct lynx_proto_params lynx_proto_params[] = {
+	[LYNX_PROTO_SGMII] = {
+		.frate_khz = 5000000,
+		.rat_sel = LNmGCR0_RAT_SEL_QUARTER,
+		.if20bit = false,
+		.prots = LNmGCR0_PROTS_SGMII,
+		.reidl_th = 0b001,
+		.reidl_ex = 0b011,
+		.reidl_et = 0b100,
+		.slew = 0b01,
+		.gain = 0b1111,
+		.offset_override = 0b0011111,
+		.adpt_eq = 0b110000,
+		.amp_red = 0b000110,
+		.flt_sel = 0b111001,
+	},
+	[LYNX_PROTO_1000BASEKX] = {
+		.frate_khz = 5000000,
+		.rat_sel = LNmGCR0_RAT_SEL_QUARTER,
+		.if20bit = false,
+		.prots = LNmGCR0_PROTS_SGMII,
+		.slew = 0b01,
+		.gain = 0b1111,
+		.offset_override = 0b0011111,
+		.adpt_eq = 0b110000,
+		.flt_sel = 0b111001,
+	},
+	[LYNX_PROTO_SGMII25] = {
+		.frate_khz = 3125000,
+		.rat_sel = LNmGCR0_RAT_SEL_SAME,
+		.if20bit = false,
+		.prots = LNmGCR0_PROTS_SGMII,
+		.slew = 0b10,
+		.offset_override = 0b0011111,
+		.postq_ratio = 0b00110,
+		.adpt_eq = 0b110000,
+	},
+	[LYNX_PROTO_QSGMII] = {
+		.frate_khz = 5000000,
+		.rat_sel = LNmGCR0_RAT_SEL_SAME,
+		.if20bit = true,
+		.prots = LNmGCR0_PROTS_SGMII,
+		.slew = 0b01,
+		.offset_override = 0b0011111,
+		.postq_ratio = 0b00110,
+		.adpt_eq = 0b110000,
+		.amp_red = 0b000010,
+	},
+	[LYNX_PROTO_XFI] = {
+		.frate_khz = 5156250,
+		.rat_sel = LNmGCR0_RAT_SEL_DOUBLE,
+		.if20bit = true,
+		.prots = LNmGCR0_PROTS_XFI,
+		.slew = 0b01,
+		.baseline_wander = LNmRECR0_BASE_WAND_DEFAULT,
+		.offset_override = 0b1011111,
+		.postq_ratio = 0b00011,
+		.adpt_eq = 0b110000,
+		.amp_red = 0b000111,
+	},
+	[LYNX_PROTO_10GKR] = {
+		.frate_khz = 5156250,
+		.rat_sel = LNmGCR0_RAT_SEL_DOUBLE,
+		.if20bit = true,
+		.prots = LNmGCR0_PROTS_XFI,
+		.slew = 0b01,
+		.baseline_wander = LNmRECR0_BASE_WAND_DEFAULT,
+		.offset_override = 0b1011111,
+		.preq_ratio = 0b0011,
+		.postq_ratio = 0b01100,
+		.adpt_eq = 0b110000,
+	},
+};
+
+/**
+ * struct lynx_mode - A single configuration of a protocol controller
+ * @protos: A bitmask of the &enum lynx_protocol this mode supports
+ * @pccr: The number of the PCCR which contains this mode
+ * @idx: The index of the protocol controller. For example, SGMIIB would have
+ *       index 1.
+ * @cfg: The value to program into the controller to select this mode
+ *
+ * The serdes has multiple protocol controllers which can be each be selected
+ * independently. Depending on their configuration, they may use multiple lanes
+ * at once (e.g. AUI or PCIe x4). Additionally, multiple protocols may be
+ * supported by a single mode (XFI and 10GKR differ only in their protocol
+ * parameters).
+ */
+struct lynx_mode {
+	u16 protos;
+	u8 pccr;
+	u8 idx;
+	u8 cfg;
+};
+
+static_assert(LYNX_PROTO_LAST - 1 <=
+	      sizeof_field(struct lynx_mode, protos) * BITS_PER_BYTE);
+
+struct lynx_priv;
+
+/**
+ * struct lynx_cfg - Configuration for a particular serdes
+ * @lanes: Number of lanes
+ * @endian: Endianness of the registers
+ * @mode_conflict: Determine whether a protocol controller is already in use
+ *                 (by another group).
+ * @mode_apply: Apply a given protocol. This includes programming the
+ *              appropriate config into the PCCR, as well as enabling/disabling
+ *              any other registers (such as the enabling MDIO access).
+ *              %LYNX_PROTO_NONE may be used to clear any associated registers.
+ * @mode_init: Finish initializing a mode. All fields are filled in except for
+ *             protos. Type is one of PHY_TYPE_*. mode->protos should be filled
+ *             in, and the other fields should be sanity-checked.
+ */
+struct lynx_cfg {
+	unsigned int lanes;
+	enum regmap_endian endian;
+	bool (*mode_conflict)(struct lynx_priv *serdes,
+			      const struct lynx_mode *mode);
+	void (*mode_apply)(struct lynx_priv *serdes,
+			   const struct lynx_mode *mode,
+			   enum lynx_protocol proto);
+	int (*mode_init)(struct lynx_priv *serdes, struct lynx_mode *mode,
+			 int type);
+};
+
+/**
+ * struct lynx_priv - Driver data for the serdes
+ * @lock: A lock protecting "common" registers in @regmap, as well as the
+ *        members of this struct. Lane-specific registers are protected by the
+ *        phy's lock. PLL registers are protected by the clock's lock.
+ * @dev: The serdes device
+ * @regmap: The backing regmap
+ * @cfg: SoC-specific configuration
+ * @plls: The PLLs
+ * @ex_dlys: The "ex_dly" clocks
+ * @used_lanes: Bitmap of the lanes currently used by phys
+ */
+struct lynx_priv {
+	struct mutex lock;
+	struct device *dev;
+	struct regmap *regmap;
+	const struct lynx_cfg *cfg;
+	struct clk *plls[2], *ex_dlys[2];
+	unsigned int used_lanes;
+};
+
+/**
+ * struct lynx_group - Driver data for a group of lanes
+ * @serdes: The parent serdes
+ * @pll: The currently-used pll
+ * @ex_dly: The ex_dly clock, if used
+ * @modes: Valid protocol controller configurations
+ * @mode_count: Number of modes in @modes
+ * @first_lane: The first lane in the group
+ * @last_lane: The last lane in the group
+ * @proto: The currently-configured protocol
+ */
+struct lynx_group {
+	struct lynx_priv *serdes;
+	struct clk *pll, *ex_dly;
+	const struct lynx_mode *modes;
+	size_t mode_count;
+	unsigned int first_lane;
+	unsigned int last_lane;
+	enum lynx_protocol proto;
+};
+
+static u32 lynx_read(struct lynx_priv *serdes, u32 reg)
+{
+	unsigned int ret = 0;
+
+	WARN_ON_ONCE(regmap_read(serdes->regmap, reg, &ret));
+	dev_vdbg(serdes->dev, "%.8x <= %.8x\n", ret, reg);
+	return ret;
+}
+
+static void lynx_write(struct lynx_priv *serdes, u32 val, u32 reg)
+{
+	dev_vdbg(serdes->dev, "%.8x => %.8x\n", val, reg);
+	WARN_ON_ONCE(regmap_write(serdes->regmap, reg, val));
+}
+
+/**
+ * lynx_lane_bitmap() - Get a bitmap for a group of lanes
+ * @group: The group of lanes
+ *
+ * Return: A mask containing all bits between @group->first and @group->last
+ */
+static unsigned int lynx_lane_bitmap(struct lynx_group *group)
+{
+	if (group->first_lane > group->last_lane)
+		return GENMASK(group->first_lane, group->last_lane);
+	else
+		return GENMASK(group->last_lane, group->first_lane);
+}
+
+static int lynx_init(struct phy *phy)
+{
+	int ret = 0;
+	struct lynx_group *group = phy_get_drvdata(phy);
+	struct lynx_priv *serdes = group->serdes;
+	unsigned int lane_mask = lynx_lane_bitmap(group);
+
+	mutex_lock(&serdes->lock);
+	if (serdes->used_lanes & lane_mask)
+		ret = -EBUSY;
+	else
+		serdes->used_lanes |= lane_mask;
+	mutex_unlock(&serdes->lock);
+	return ret;
+}
+
+static int lynx_exit(struct phy *phy)
+{
+	struct lynx_group *group = phy_get_drvdata(phy);
+	struct lynx_priv *serdes = group->serdes;
+
+	clk_disable_unprepare(group->ex_dly);
+	group->ex_dly = NULL;
+
+	clk_disable_unprepare(group->pll);
+	clk_rate_exclusive_put(group->pll);
+	group->pll = NULL;
+
+	mutex_lock(&serdes->lock);
+	serdes->used_lanes &= ~lynx_lane_bitmap(group);
+	mutex_unlock(&serdes->lock);
+	return 0;
+}
+
+/*
+ * This is tricky. If first_lane=1 and last_lane=0, the condition will see 2,
+ * 1, 0. But the loop body will see 1, 0. We do this to avoid underflow. We
+ * can't pull the same trick when incrementing, because then we might have to
+ * start at -1 if (e.g.) first_lane = 0.
+ */
+#define for_range(val, start, end) \
+	for (val = start < end ? start : start + 1; \
+	     start < end ? val <= end : val-- > end; \
+	     start < end ? val++ : 0)
+#define for_each_lane(lane, group) \
+	for_range(lane, group->first_lane, group->last_lane)
+#define for_each_lane_reverse(lane, group) \
+	for_range(lane, group->last_lane, group->first_lane)
+
+static int lynx_power_on(struct phy *phy)
+{
+	int i;
+	struct lynx_group *group = phy_get_drvdata(phy);
+	u32 gcr0;
+
+	for_each_lane(i, group) {
+		gcr0 = lynx_read(group->serdes, LNmGCR0(i));
+		gcr0 &= ~(LNmGCR0_RX_PD | LNmGCR0_TX_PD);
+		lynx_write(group->serdes, gcr0, LNmGCR0(i));
+
+		usleep_range(15, 30);
+		gcr0 |= LNmGCR0_RRST_B | LNmGCR0_TRST_B;
+		lynx_write(group->serdes, gcr0, LNmGCR0(i));
+	}
+
+	return 0;
+}
+
+static void lynx_power_off_group(struct lynx_group *group)
+{
+	int i;
+
+	for_each_lane_reverse(i, group) {
+		u32 gcr0 = lynx_read(group->serdes, LNmGCR0(i));
+
+		gcr0 |= LNmGCR0_RX_PD | LNmGCR0_TX_PD;
+		gcr0 &= ~(LNmGCR0_RRST_B | LNmGCR0_TRST_B);
+		lynx_write(group->serdes, gcr0, LNmGCR0(i));
+	}
+}
+
+static int lynx_power_off(struct phy *phy)
+{
+	lynx_power_off_group(phy_get_drvdata(phy));
+	return 0;
+}
+
+/**
+ * lynx_lookup_proto() - Convert a phy-subsystem mode to a protocol
+ * @mode: The mode to convert
+ * @submode: The submode of @mode
+ *
+ * Return: A corresponding serdes-specific mode
+ */
+static enum lynx_protocol lynx_lookup_proto(enum phy_mode mode, int submode)
+{
+	switch (mode) {
+	case PHY_MODE_ETHERNET:
+		switch (submode) {
+		case PHY_INTERFACE_MODE_SGMII:
+		case PHY_INTERFACE_MODE_1000BASEX:
+			return LYNX_PROTO_SGMII;
+		/* TODO: 1000Base-KX */
+		case PHY_INTERFACE_MODE_2500BASEX:
+			return LYNX_PROTO_SGMII25;
+		case PHY_INTERFACE_MODE_QSGMII:
+			return LYNX_PROTO_QSGMII;
+		case PHY_INTERFACE_MODE_XGMII:
+		case PHY_INTERFACE_MODE_10GBASER:
+			return LYNX_PROTO_XFI;
+		case PHY_INTERFACE_MODE_10GKR:
+			return LYNX_PROTO_10GKR;
+		default:
+			return LYNX_PROTO_NONE;
+		}
+	default:
+		return LYNX_PROTO_NONE;
+	}
+}
+
+/**
+ * lynx_lookup_mode() - Get the mode for a group/protocol combination
+ * @group: The group of lanes to use
+ * @proto: The protocol to use
+ *
+ * Return: An appropriate mode to use, or %NULL if none match.
+ */
+static const struct lynx_mode *lynx_lookup_mode(struct lynx_group *group,
+						enum lynx_protocol proto)
+{
+	int i;
+
+	for (i = 0; i < group->mode_count; i++) {
+		const struct lynx_mode *mode = &group->modes[i];
+
+		if (BIT(proto) & mode->protos)
+			return mode;
+	}
+
+	return NULL;
+}
+
+static int lynx_validate(struct phy *phy, enum phy_mode phy_mode, int submode,
+			 union phy_configure_opts *opts)
+{
+	enum lynx_protocol proto;
+	struct lynx_group *group = phy_get_drvdata(phy);
+	const struct lynx_mode *mode;
+
+	proto = lynx_lookup_proto(phy_mode, submode);
+	if (proto == LYNX_PROTO_NONE)
+		return -EINVAL;
+
+	/* Nothing to do */
+	if (proto == group->proto)
+		return 0;
+
+	mode = lynx_lookup_mode(group, proto);
+	if (!mode)
+		return -EINVAL;
+
+	return 0;
+}
+
+#define abs_diff(a, b) ({ \
+	typeof(a) _a = (a); \
+	typeof(b) _b = (b); \
+	_a > _b ? _a - _b : _b - _a; \
+})
+
+static int lynx_set_mode(struct phy *phy, enum phy_mode phy_mode, int submode)
+{
+	enum lynx_protocol proto;
+	const struct lynx_proto_params *params;
+	const struct lynx_mode *old_mode = NULL, *new_mode;
+	int i, pll, ret;
+	struct lynx_group *group = phy_get_drvdata(phy);
+	struct lynx_priv *serdes = group->serdes;
+	u32 tmp, teq;
+	u32 gcr0 = 0, gcr1 = 0, recr0 = 0, tecr0 = 0;
+	u32 gcr0_mask = 0, gcr1_mask = 0, recr0_mask = 0, tecr0_mask = 0;
+
+	proto = lynx_lookup_proto(phy_mode, submode);
+	if (proto == LYNX_PROTO_NONE) {
+		dev_dbg(&phy->dev, "unknown mode/submode %d/%d\n",
+			phy_mode, submode);
+		return -EINVAL;
+	}
+
+	/* Nothing to do */
+	if (proto == group->proto)
+		return 0;
+
+	new_mode = lynx_lookup_mode(group, proto);
+	if (!new_mode) {
+		dev_dbg(&phy->dev, "could not find mode for %s on lanes %u to %u\n",
+			lynx_proto_str[proto], group->first_lane,
+			group->last_lane);
+		return -EINVAL;
+	}
+
+	if (group->proto != LYNX_PROTO_NONE) {
+		old_mode = lynx_lookup_mode(group, group->proto);
+		if (!old_mode) {
+			dev_err(&phy->dev, "could not find mode for %s\n",
+				lynx_proto_str[group->proto]);
+			return -EBUSY;
+		}
+	}
+
+	mutex_lock(&serdes->lock);
+	if (serdes->cfg->mode_conflict(serdes, new_mode)) {
+		dev_dbg(&phy->dev, "%s%c already in use\n",
+			lynx_proto_str[__ffs(new_mode->protos)],
+			'A' + new_mode->idx);
+		ret = -EBUSY;
+		goto out;
+	}
+
+	clk_disable_unprepare(group->ex_dly);
+	group->ex_dly = NULL;
+
+	clk_disable_unprepare(group->pll);
+	clk_rate_exclusive_put(group->pll);
+	group->pll = NULL;
+
+	/* First, try to use a PLL which already has the correct rate */
+	params = &lynx_proto_params[proto];
+	for (pll = 0; pll < ARRAY_SIZE(serdes->plls); pll++) {
+		struct clk *clk = serdes->plls[pll];
+		unsigned long rate = clk_get_rate(clk);
+		unsigned long error = abs_diff(rate, params->frate_khz);
+
+		dev_dbg(&phy->dev, "pll%d has rate %lu (error=%lu)\n", pll,
+			rate, error);
+		/* Accept up to 100ppm deviation */
+		if (error && params->frate_khz / error < 10000)
+			continue;
+
+		if (!clk_set_rate_exclusive(clk, rate))
+			goto got_pll;
+		/*
+		 * Someone else got a different rate first (or there was some
+		 * other error)
+		 */
+	}
+
+	/* If neither PLL has the right rate, try setting it */
+	for (pll = 0; pll < 2; pll++) {
+		ret = clk_set_rate_exclusive(serdes->plls[pll],
+					     params->frate_khz);
+		if (!ret)
+			goto got_pll;
+	}
+
+	dev_dbg(&phy->dev, "could not get a pll at %ukHz\n",
+		params->frate_khz);
+	goto out;
+
+got_pll:
+	group->pll = serdes->plls[pll];
+	ret = clk_prepare_enable(group->pll);
+	if (ret)
+		goto out;
+
+	gcr0_mask |= LNmGCR0_RRAT_SEL | LNmGCR0_TRAT_SEL;
+	gcr0_mask |= LNmGCR0_RPLL_LES | LNmGCR0_TPLL_LES;
+	gcr0_mask |= LNmGCR0_RRST_B | LNmGCR0_TRST_B;
+	gcr0_mask |= LNmGCR0_RX_PD | LNmGCR0_TX_PD;
+	gcr0_mask |= LNmGCR0_IF20BIT_EN | LNmGCR0_PROTS;
+	gcr0 |= FIELD_PREP(LNmGCR0_RPLL_LES, !pll);
+	gcr0 |= FIELD_PREP(LNmGCR0_TPLL_LES, !pll);
+	gcr0 |= FIELD_PREP(LNmGCR0_RRAT_SEL, params->rat_sel);
+	gcr0 |= FIELD_PREP(LNmGCR0_TRAT_SEL, params->rat_sel);
+	gcr0 |= FIELD_PREP(LNmGCR0_IF20BIT_EN, params->if20bit);
+	gcr0 |= FIELD_PREP(LNmGCR0_PROTS, params->prots);
+
+	gcr1_mask |= LNmGCR1_RDAT_INV | LNmGCR1_TDAT_INV;
+	gcr1_mask |= LNmGCR1_OPAD_CTL | LNmGCR1_REIDL_TH;
+	gcr1_mask |= LNmGCR1_REIDL_EX_SEL | LNmGCR1_REIDL_ET_SEL;
+	gcr1_mask |= LNmGCR1_REIDL_EX_MSB | LNmGCR1_REIDL_ET_MSB;
+	gcr1_mask |= LNmGCR1_REQ_CTL_SNP | LNmGCR1_REQ_CDR_SNP;
+	gcr1_mask |= LNmGCR1_TRSTDIR | LNmGCR1_REQ_BIN_SNP;
+	gcr1_mask |= LNmGCR1_ISLEW_RCTL | LNmGCR1_OSLEW_RCTL;
+	gcr1 |= FIELD_PREP(LNmGCR1_REIDL_TH, params->reidl_th);
+	gcr1 |= FIELD_PREP(LNmGCR1_REIDL_EX_SEL, params->reidl_ex & 3);
+	gcr1 |= FIELD_PREP(LNmGCR1_REIDL_ET_SEL, params->reidl_et & 3);
+	gcr1 |= FIELD_PREP(LNmGCR1_REIDL_EX_MSB, params->reidl_ex >> 2);
+	gcr1 |= FIELD_PREP(LNmGCR1_REIDL_ET_MSB, params->reidl_et >> 2);
+	gcr1 |= FIELD_PREP(LNmGCR1_TRSTDIR,
+			   group->first_lane > group->last_lane);
+	gcr1 |= FIELD_PREP(LNmGCR1_ISLEW_RCTL, params->slew);
+	gcr1 |= FIELD_PREP(LNmGCR1_OSLEW_RCTL, params->slew);
+
+	recr0_mask |= LNmRECR0_RXEQ_BST | LNmRECR0_BASE_WAND;
+	recr0_mask |= LNmRECR0_GK2OVD | LNmRECR0_GK3OVD;
+	recr0_mask |= LNmRECR0_GK2OVD_EN | LNmRECR0_GK3OVD_EN;
+	recr0_mask |= LNmRECR0_OSETOVD_EN | LNmRECR0_OSETOVD;
+	if (params->gain) {
+		recr0 |= FIELD_PREP(LNmRECR0_GK2OVD, params->gain);
+		recr0 |= FIELD_PREP(LNmRECR0_GK3OVD, params->gain);
+		recr0 |= LNmRECR0_GK2OVD_EN | LNmRECR0_GK3OVD_EN;
+	}
+	recr0 |= FIELD_PREP(LNmRECR0_BASE_WAND, params->baseline_wander);
+	recr0 |= FIELD_PREP(LNmRECR0_OSETOVD, params->offset_override);
+
+	tecr0_mask |= LNmTECR0_TEQ_TYPE;
+	tecr0_mask |= LNmTECR0_SGN_PREQ | LNmTECR0_RATIO_PREQ;
+	tecr0_mask |= LNmTECR0_SGN_POST1Q | LNmTECR0_RATIO_PST1Q;
+	tecr0_mask |= LNmTECR0_ADPT_EQ | LNmTECR0_AMP_RED;
+	teq = LNmTECR0_TEQ_TYPE_NONE;
+	if (params->postq_ratio) {
+		teq = LNmTECR0_TEQ_TYPE_POST;
+		tecr0 |= FIELD_PREP(LNmTECR0_SGN_POST1Q, 1);
+		tecr0 |= FIELD_PREP(LNmTECR0_RATIO_PST1Q, params->postq_ratio);
+	}
+	if (params->preq_ratio) {
+		teq = LNmTECR0_TEQ_TYPE_BOTH;
+		tecr0 |= FIELD_PREP(LNmTECR0_SGN_PREQ, 1);
+		tecr0 |= FIELD_PREP(LNmTECR0_RATIO_PREQ, params->preq_ratio);
+	}
+	tecr0 |= FIELD_PREP(LNmTECR0_TEQ_TYPE, teq);
+	tecr0 |= FIELD_PREP(LNmTECR0_ADPT_EQ, params->adpt_eq);
+	tecr0 |= FIELD_PREP(LNmTECR0_AMP_RED, params->amp_red);
+
+	for_each_lane(i, group) {
+		tmp = lynx_read(serdes, LNmGCR0(i));
+		tmp &= ~(LNmGCR0_RRST_B | LNmGCR0_TRST_B);
+		lynx_write(serdes, tmp, LNmGCR0(i));
+	}
+
+	ndelay(50);
+
+	/* Disable the old controller */
+	if (old_mode)
+		serdes->cfg->mode_apply(serdes, old_mode, LYNX_PROTO_NONE);
+
+	for_each_lane(i, group) {
+		tmp = lynx_read(serdes, LNmGCR0(i));
+		tmp &= ~gcr0_mask;
+		tmp |= gcr0;
+		tmp |= FIELD_PREP(LNmGCR0_FIRST_LANE, i == group->first_lane);
+		lynx_write(serdes, tmp, LNmGCR0(i));
+
+		tmp = lynx_read(serdes, LNmGCR1(i));
+		tmp &= ~gcr1_mask;
+		tmp |= gcr1;
+		lynx_write(serdes, tmp, LNmGCR1(i));
+
+		tmp = lynx_read(serdes, LNmRECR0(i));
+		tmp &= ~recr0_mask;
+		tmp |= recr0;
+		lynx_write(serdes, tmp, LNmRECR0(i));
+
+		tmp = lynx_read(serdes, LNmTECR0(i));
+		tmp &= ~tecr0_mask;
+		tmp |= tecr0;
+		lynx_write(serdes, tmp, LNmTECR0(i));
+
+		tmp = lynx_read(serdes, LNmTTLCR0(i));
+		tmp &= ~LNmTTLCR0_FLT_SEL;
+		tmp |= FIELD_PREP(LNmTTLCR0_FLT_SEL, params->flt_sel);
+		lynx_write(serdes, tmp, LNmTTLCR0(i));
+	}
+
+	ndelay(120);
+
+	for_each_lane_reverse(i, group) {
+		tmp = lynx_read(serdes, LNmGCR0(i));
+		tmp |= LNmGCR0_RRST_B | LNmGCR0_TRST_B;
+		lynx_write(serdes, tmp, LNmGCR0(i));
+	}
+
+	/* Enable the new controller */
+	serdes->cfg->mode_apply(serdes, new_mode, proto);
+	if (proto == LYNX_PROTO_1000BASEKX) {
+		group->ex_dly = serdes->ex_dlys[pll];
+		/* This should never fail since it's from our internal driver */
+		WARN_ON_ONCE(clk_prepare_enable(group->ex_dly));
+	}
+	group->proto = proto;
+
+	dev_dbg(&phy->dev, "set mode to %s on lanes %u to %u\n",
+		lynx_proto_str[proto], group->first_lane, group->last_lane);
+
+out:
+	mutex_unlock(&serdes->lock);
+	return ret;
+}
+
+static const struct phy_ops lynx_phy_ops = {
+	.init = lynx_init,
+	.exit = lynx_exit,
+	.power_on = lynx_power_on,
+	.power_off = lynx_power_off,
+	.set_mode = lynx_set_mode,
+	.validate = lynx_validate,
+	.owner = THIS_MODULE,
+};
+
+static int lynx_read_u32(struct device *dev, struct fwnode_handle *fwnode,
+			 const char *prop, u32 *val)
+{
+	int ret;
+
+	ret = fwnode_property_read_u32(fwnode, prop, val);
+	if (ret)
+		dev_err(dev, "could not read %s from %pfwP: %d\n", prop,
+			fwnode, ret);
+	return ret;
+}
+
+static int lynx_probe_group(struct lynx_priv *serdes,
+			    struct fwnode_handle *fwnode)
+{
+	int i, lane_count, ret;
+	struct device *dev = serdes->dev;
+	struct fwnode_handle *mode_node;
+	struct lynx_group *group;
+	struct lynx_mode *modes;
+	struct phy *phy;
+	u32 *lanes = NULL;
+
+	group = devm_kzalloc(dev, sizeof(*group), GFP_KERNEL);
+	if (!group)
+		return -ENOMEM;
+	group->serdes = serdes;
+
+	lane_count = fwnode_property_count_u32(fwnode, "reg");
+	if (lane_count < 0) {
+		dev_err(dev, "could not read %s from %pfwP: %d\n",
+			"reg", fwnode, ret);
+		return lane_count;
+	}
+
+	lanes = kcalloc(lane_count, sizeof(*lanes), GFP_KERNEL);
+	if (!lanes)
+		return -ENOMEM;
+
+	ret = fwnode_property_read_u32_array(fwnode, "reg", lanes, lane_count);
+	if (ret) {
+		dev_err(dev, "could not read %s from %pfwP: %d\n",
+			"reg", fwnode, ret);
+		goto out;
+	}
+
+	group->first_lane = lanes[0];
+	group->last_lane = lanes[lane_count - 1];
+	for (i = 0; i < lane_count; i++) {
+		if (lanes[i] > serdes->cfg->lanes) {
+			ret = -EINVAL;
+			dev_err(dev, "lane %d not in range 0 to %u\n",
+				i, serdes->cfg->lanes);
+			goto out;
+		}
+
+		if (lanes[i] != group->first_lane +
+				i * !!(group->last_lane - group->first_lane)) {
+			ret = -EINVAL;
+			dev_err(dev, "lane %d is not monotonic\n", i);
+			goto out;
+		}
+	}
+
+	fwnode_for_each_child_node(fwnode, mode_node)
+		group->mode_count++;
+
+	modes = devm_kcalloc(dev, group->mode_count, sizeof(*group->modes),
+			     GFP_KERNEL);
+	if (!modes) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	i = 0;
+	fwnode_for_each_child_node(fwnode, mode_node) {
+		struct lynx_mode *mode = &modes[i++];
+		u32 val;
+
+		ret = lynx_read_u32(dev, mode_node, "fsl,pccr", &val);
+		if (ret)
+			goto out;
+		mode->pccr = val;
+
+		ret = lynx_read_u32(dev, mode_node, "fsl,index", &val);
+		if (ret)
+			goto out;
+		mode->idx = val;
+
+		ret = lynx_read_u32(dev, mode_node, "fsl,cfg", &val);
+		if (ret)
+			goto out;
+		mode->cfg = val;
+
+		ret = lynx_read_u32(dev, mode_node, "fsl,type", &val);
+		if (ret)
+			goto out;
+
+		ret = serdes->cfg->mode_init(serdes, mode, val);
+		if (ret)
+			goto out;
+
+		dev_dbg(dev, "mode PCCR%X.%s%c_CFG=%x on lanes %u to %u\n",
+			mode->pccr, lynx_proto_str[__ffs(mode->protos)],
+			'A' + mode->idx, mode->cfg, group->first_lane,
+			group->last_lane);
+	}
+
+	WARN_ON(i != group->mode_count);
+	group->modes = modes;
+
+	/* Deselect anything configured by the RCW/bootloader */
+	for (i = 0; i < group->mode_count; i++)
+		serdes->cfg->mode_apply(serdes, &group->modes[i],
+					LYNX_PROTO_NONE);
+
+	/* Disable the lanes for now */
+	lynx_power_off_group(group);
+
+	phy = devm_phy_create(dev, to_of_node(fwnode), &lynx_phy_ops);
+	ret = PTR_ERR_OR_ZERO(phy);
+	if (ret)
+		dev_err_probe(dev, ret, "could not create phy\n");
+	else
+		phy_set_drvdata(phy, group);
+
+out:
+	kfree(lanes);
+	return ret;
+}
+
+static int lynx_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct device *dev = &pdev->dev;
+	struct fwnode_handle *group_node;
+	struct lynx_priv *serdes;
+	struct phy_provider *provider;
+	struct regmap_config regmap_config = {
+		.reg_bits = 32,
+		.reg_stride = 4,
+		.val_bits = 32,
+		.disable_locking = true,
+	};
+	struct resource *res;
+	void __iomem *base;
+
+	serdes = devm_kzalloc(dev, sizeof(*serdes), GFP_KERNEL);
+	if (!serdes)
+		return -ENOMEM;
+
+	serdes->dev = dev;
+	platform_set_drvdata(pdev, serdes);
+	mutex_init(&serdes->lock);
+	serdes->cfg = device_get_match_data(dev);
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base)) {
+		ret = PTR_ERR(base);
+		dev_err_probe(dev, ret, "could not get/map registers\n");
+		return ret;
+	}
+
+	regmap_config.val_format_endian = serdes->cfg->endian;
+	regmap_config.max_register = res->end - res->start;
+	serdes->regmap = devm_regmap_init_mmio(dev, base, &regmap_config);
+	if (IS_ERR(serdes->regmap)) {
+		ret = PTR_ERR(serdes->regmap);
+		dev_err_probe(dev, ret, "could not create regmap\n");
+		return ret;
+	}
+
+	ret = lynx_clks_init(dev, serdes->regmap, serdes->plls,
+			     serdes->ex_dlys);
+	if (ret)
+		return ret;
+
+	device_for_each_child_node(dev, group_node) {
+		ret = lynx_probe_group(serdes, group_node);
+		if (ret)
+			return ret;
+	}
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	ret = PTR_ERR_OR_ZERO(provider);
+	if (ret)
+		dev_err_probe(dev, ret, "could not register phy provider\n");
+	else
+		dev_info(dev, "probed with %d lanes\n", serdes->cfg->lanes);
+	return ret;
+}
+
+/*
+ * These are common helpers for the PCCRs found on (most) Layerscape SoCs.
+ * There is an earlier layout used on most T-series SoCs, as well as the
+ * LS1020A/21A/22A.
+ */
+
+static int lynx_ls_pccr_params(const struct lynx_mode *mode, u32 *off,
+			       u32 *shift, u32 *mask)
+{
+	if (mode->protos & PROTO_MASK(SGMII)) {
+		*off = LS_PCCRa(0x8);
+		*mask = PCCR8_SGMIIa_MASK;
+		*shift = PCCR8_SGMIIa_SHIFT(mode->idx);
+	} else if (mode->protos & PROTO_MASK(QSGMII)) {
+		*off = LS_PCCRa(0x9);
+		*mask = PCCR9_QSGMIIa_MASK;
+		*shift = PCCR9_QSGMIIa_SHIFT(mode->idx);
+	} else if (mode->protos & PROTO_MASK(XFI)) {
+		*off = LS_PCCRa(0xB);
+		*mask = PCCRB_XFIa_MASK;
+		*shift = PCCRB_XFIa_SHIFT(mode->idx);
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static bool lynx_ls_mode_conflict(struct lynx_priv *serdes,
+				  const struct lynx_mode *mode)
+{
+	u32 off, shift, mask;
+
+	if (WARN_ON_ONCE(lynx_ls_pccr_params(mode, &off, &shift, &mask)))
+		return true;
+
+	return (lynx_read(serdes, off) >> shift) & mask;
+}
+
+static void lynx_ls_mode_apply(struct lynx_priv *serdes,
+			       const struct lynx_mode *mode,
+			       enum lynx_protocol proto)
+{
+	u32 base, pccr, off, shift, mask;
+
+	if (WARN_ON_ONCE(proto != LYNX_PROTO_NONE &&
+			 !(mode->protos & BIT(proto))))
+		return;
+	if (WARN_ON_ONCE(lynx_ls_pccr_params(mode, &off, &shift, &mask)))
+		return;
+
+	dev_dbg(serdes->dev, "applying %s to PCCR%X.%s%c_CFG\n",
+		lynx_proto_str[proto], mode->pccr,
+		lynx_proto_str[__ffs(mode->protos)], 'A' + mode->idx);
+
+	base = 0;
+	if (mode->protos & PROTO_MASK(SGMII))
+		base = LS_SGMII_BASE;
+	else if (mode->protos & PROTO_MASK(QSGMII))
+		base = LS_QSGMII_BASE;
+	else if (mode->protos & PROTO_MASK(XFI))
+		base = LS_XFI_BASE;
+
+	if (base && proto == LYNX_PROTO_NONE) {
+		u32 cr0 = lynx_read(serdes, PCSa(mode->idx, base, 0));
+
+		cr0 |= PCSaCR0_RST_B;
+		lynx_write(serdes, cr0, PCSa(mode->idx, base, 0));
+	}
+
+	pccr = lynx_read(serdes, off);
+	pccr &= ~(mask << shift);
+	if (proto != LYNX_PROTO_NONE)
+		pccr |= mode->cfg << shift;
+
+	if (proto == LYNX_PROTO_1000BASEKX)
+		pccr |= PCCR8_SGMIIa_KX << shift;
+	lynx_write(serdes, pccr, off);
+
+	if (base && proto != LYNX_PROTO_NONE) {
+		u32 cr0 = lynx_read(serdes, PCSa(mode->idx, base, 0));
+
+		cr0 &= ~PCSaCR0_RST_B;
+		lynx_write(serdes, cr0, PCSa(mode->idx, base, 0));
+	}
+
+	if (mode->protos & PROTO_MASK(SGMII)) {
+		u32 cr1 = lynx_read(serdes, LS_SGMIIaCR1(mode->idx));
+
+		cr1 &= ~SGMIIaCR1_SGPCS_EN;
+		cr1 |= proto == LYNX_PROTO_NONE ? 0 : SGMIIaCR1_SGPCS_EN;
+		lynx_write(serdes, cr1, LS_SGMIIaCR1(mode->idx));
+	}
+}
+
+static int lynx_ls_mode_init(struct lynx_priv *serdes, struct lynx_mode *mode,
+			     int type)
+{
+	u32 max = 0, off, shift, mask;
+
+	if (mode->pccr >= 0x10) {
+		dev_err(serdes->dev, "PCCR index %u too large\n", mode->pccr);
+		return -EINVAL;
+	}
+
+	switch (type) {
+	case PHY_TYPE_2500BASEX:
+		mode->protos = PROTO_MASK(SGMII25);
+		fallthrough;
+	case PHY_TYPE_SGMII:
+		max = 8;
+		mode->protos |= PROTO_MASK(SGMII) | PROTO_MASK(1000BASEKX);
+		break;
+	case PHY_TYPE_QSGMII:
+		max = 4;
+		mode->protos = PROTO_MASK(QSGMII);
+		break;
+	case PHY_TYPE_10GBASER:
+		max = 8;
+		mode->protos = PROTO_MASK(XFI) | PROTO_MASK(10GKR);
+		break;
+	default:
+		dev_err(serdes->dev, "unknown mode type %d\n", type);
+		return -EINVAL;
+	}
+
+	if (mode->idx >= max) {
+		dev_err(serdes->dev, "%s index %u too large\n",
+			lynx_proto_str[__ffs(mode->protos)], mode->idx);
+		return -EINVAL;
+	}
+
+	if (WARN_ON_ONCE(lynx_ls_pccr_params(mode, &off, &shift, &mask)))
+		return -EINVAL;
+
+	if (!mode->cfg || mode->cfg & ~mask) {
+		dev_err(serdes->dev, "bad value %x for %s%c_CFG\n",
+			mode->cfg, lynx_proto_str[__ffs(mode->protos)],
+			'A' + mode->idx);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct lynx_cfg ls1046a_cfg = {
+	.lanes = 4,
+	.endian = REGMAP_ENDIAN_BIG,
+	.mode_conflict = lynx_ls_mode_conflict,
+	.mode_apply = lynx_ls_mode_apply,
+	.mode_init = lynx_ls_mode_init,
+};
+
+static const struct lynx_cfg ls1088a_cfg = {
+	.lanes = 4,
+	.endian = REGMAP_ENDIAN_LITTLE,
+	.mode_conflict = lynx_ls_mode_conflict,
+	.mode_apply = lynx_ls_mode_apply,
+	.mode_init = lynx_ls_mode_init,
+};
+
+static const struct of_device_id lynx_of_match[] = {
+	{ .compatible = "fsl,ls1046a-serdes", .data = &ls1046a_cfg },
+	{ .compatible = "fsl,ls1088a-serdes", .data = &ls1088a_cfg },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, lynx_of_match);
+
+static struct platform_driver lynx_driver = {
+	.probe = lynx_probe,
+	.driver = {
+		.name = "lynx_10g",
+		.of_match_table = lynx_of_match,
+	},
+};
+module_platform_driver(lynx_driver);
+
+MODULE_AUTHOR("Sean Anderson <sean.anderson@seco.com>");
+MODULE_DESCRIPTION("Lynx 10G SerDes driver");
+MODULE_LICENSE("GPL");
-- 
2.35.1.1320.gc452695387.dirty

