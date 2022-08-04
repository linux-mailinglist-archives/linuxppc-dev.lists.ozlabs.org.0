Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2C858A311
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 00:07:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzNBF0dJSz3c8C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 08:07:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=C3oWHetm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.13.77; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=C3oWHetm;
	dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130077.outbound.protection.outlook.com [40.107.13.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LzN9R6vnPz2xGN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Aug 2022 08:06:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvlJh6FTvlL3Thx84KIkHdXxtpua/e1yxIj08+0JQz38biWTS6PzpJ3CppbwJ95cEiR+MD5JWks/vwsz5L3vJSWPVyQk1cAcrC5ktbWI5X6Jr/zgi/0niBvwocPDdKe/97z1PRN4lBEVUl2eDqLIOyPy0SW4ipC8+I/BlR5LgJxLJeMBVuZJ8z9VDudKhuyd/TU7V75DlmuuexG1u04QU1qC5tK+7xjPfw7xPxxfJ5OBBLG5qHIh55YB7DJPvZDABXVjWuunGcXzlyWjOtbQJ05EImCcsJ5ctVbV92OlppVvvVvMQ3ON5JCpPggcJv1pKsQpzObsu8ROA4paqmAotQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZavwZCK/a3jnJqh66x99EFomkovrPFu0Hv5vEe2Zfis=;
 b=R6F1TzRXSinV5oXn5dKEZrMDnsG5XGFX0WvkjSZR4nhlHJkZfKNyF9Av8j9PJyGwGk8+wuZID7jbQQttvz+iSH5VgMaScSch3Pwg+m14BrfXni+1xQxkl0DZlB+dUSG7zD64vJ4C3fJ+1s2MZwtRpEfBRSVJSFN418VeexluVASB+HkXUPoq6AzJ2NQfsN5R1KshjmZHUAD2tSFHZu17yFdiNn8Oa0kTl7GU+kEfssWDdsuqcSNCzcDICI661RrK2zKfsHF0hn55ZiaPcLKkpN0hMw3hyT1jtz3Wg4w57XSv7a+oxyR4bWBca5ET3eEzzI84IfTJEmoOEq+pDGe7qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZavwZCK/a3jnJqh66x99EFomkovrPFu0Hv5vEe2Zfis=;
 b=C3oWHetm66pAIPttB5V95ojdOEd6/5xJUWk54dHyCAazJ4DfwejLBidS40NbQKl1vEX80zfmKw4YTtlwuZLss6g9Bds50IMIn62s91MwpynBSYuvSR4/p6RWBwKJ2zHb7mCthF8VONeIQFfMHRoMfozPUKpU4AgfbY0ytkdCm2wW5MnfyUi8uW+/LJKkkRKrNeFgykJAUv4xSNdI5QXxo0TzPbx9Fhbkr4KiaW6BhXe/vYntQKfw8uq1HpTXXceYPK2Hi0byUv1UQDqMxvDcF7sr/Jx99Khw9FLwCL8vPqLCsXMy8800wlLo/QlMrIbA1h82a44ommTJuaJX30e9CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AS8PR03MB8419.eurprd03.prod.outlook.com (2603:10a6:20b:527::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Thu, 4 Aug
 2022 22:06:13 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 22:06:13 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 0/8] phy: Add support for Lynx 10G SerDes
Date: Thu,  4 Aug 2022 18:05:54 -0400
Message-Id: <20220804220602.477589-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:208:32a::12) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5f2526e-f6d1-4626-0f33-08da76658b6c
X-MS-TrafficTypeDiagnostic: AS8PR03MB8419:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ap1KDtBVoBR3aeivyXAe11x3xFUtIkeXrJ4QqawFspE+odecIILscJEv1S1rgLJqX3Sx0JrL1gp4O5voJP6zq3kT71D7b+y0WeDasOvrVmTgq2EGvlzWkkqvBVKNMEZLs52vlR+q69ygEmC1G7oU/2e9qnu5a+WNlfUY72cf9W8YjE7rR7nBrQAtRMSZdfk76/jrMbi2z27rBtw0kiU8/D5NL+w1QKnrnFPE3BThAQ9jWIleLh/NuYlGTANqbjOZ3+2CT1B9VCZdoIb55EqoKcpdWz0ycX3iZmZrnrOhabkJw0m/ZgQxzR5RxLO5F63WXjVIyGLViGt9eKRK1K7SKOP/owcid/2aHTEEgo7SEc4r5ZAqpwlhGjD+1fPSM98uK508X0KQ7br0gUCCm+Jt9aubbnYjQFSYa2I8zijzinQVDPyq4kzFCDpY8OitrjZiQi8a4V9XVOMk3MIX3W17Lq0lWB2tLiV1bXXLtEhPkPArUuvtum94DpgOoMWjP/iJIjoLU/S+maYJfDmXjNnggg71BeNVUrkKQToDtsqEiHqVvBXBcyJrU+kAqnjC8YPJ9g/txNmtZ0D16X7tmWjdMLOUHugvgP913HXTs/+q69o6FDGW9P4RMaD0z1ekqc1f4quc2BnsrYvaPQqON/bV3YP9c6zCkO+gadVUmLhltFKhfuPxt9YIpZK7iG0vxypUGLPxRe5LX5rg90PcmRa56F8cswqMvCqtRsnGCSVBEuPdjb3URdHplG3eTcQl8LFcKlmufGNcewnoMdlere7yfgCNoNUcUTDyEmCbeoiMeS4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(376002)(136003)(39850400004)(346002)(6486002)(36756003)(110136005)(5660300002)(316002)(66556008)(54906003)(66476007)(4326008)(8676002)(66946007)(38350700002)(1076003)(6512007)(86362001)(2616005)(478600001)(186003)(83380400001)(8936002)(6666004)(38100700002)(41300700001)(7416002)(44832011)(6506007)(52116002)(2906002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?pXEEGkt7+jmAQFO9ZnqgSG3tZlcu8NyjC8ri5MgQUh8WoLmfmuEJg0j3DBgs?=
 =?us-ascii?Q?mtQsvciGlDfl5M/u7xwpBk5vI3BE/i0kOYNN8ecMCzWrYOKvPbwNQQK1BfCz?=
 =?us-ascii?Q?sPa1hJTvRDsVy5JstYmtiwnG3oi4HG+jpIPniBgho4bHwABzi3cdB7TsXvQK?=
 =?us-ascii?Q?cLmXAESSndjbluDHBK1jeZ2MYs6RH3MA4mCbBfQ2TlcmT9NoCcgUK7Jcy9mm?=
 =?us-ascii?Q?p7DKYW3T91qHKxbEy3YaFmmJYKTylcTyV82ceD16GWwfJCaL8dtE0YSKrlrK?=
 =?us-ascii?Q?iXlwV6VqmWSlvMH5ddQToJ5CXQZ9ke9Jn/h/Ir6Eu6ZzXpdMW0zM/SseNsaq?=
 =?us-ascii?Q?1/TxWg35n+R1PNH3NXrfp7Orgn6MkTCuFJJgVCU5dxNJLRnzWYUisL7GOHn7?=
 =?us-ascii?Q?lmydTYgmXDKD1UVJVCYBC08WINXX7LKqXp8s97uudlZ1eqcG3ITtd9KdqbPx?=
 =?us-ascii?Q?/DGz829eCNmXofCdotcg2v55x15Yc5OQiC1Km+I6hKDzPYKkq8vjrRgRn8KA?=
 =?us-ascii?Q?Uv8rX3STLr14JynLGEhj4Tzwe/4u9VNKUkuqpuvaotnIv5MVu5cM/g20lqXA?=
 =?us-ascii?Q?wtEP9bb3GFWxwhPvuykxaNGMhmkQercnwJSXRjGur98RzowAZ/lhStwyCVec?=
 =?us-ascii?Q?GZ75YIPjrigxhvplkn8IyS5LrzmHRDfn8oo7dxLn7Jk4/yZXXNdnBfKxfJdi?=
 =?us-ascii?Q?F616FPh5idPVg2+UqaAJfNRYVmHWoMXS7cuCH6INDE/bEe2h2IZnAGJJAkiz?=
 =?us-ascii?Q?cODTBXBTJEntjClin/QkX3L6CpY4F4zauOHgmuspx90oqWNgjtM7Zt2PuNy8?=
 =?us-ascii?Q?kDY04MndR48RHIUpxM62t1Q9LpZD99nFe1c+YJSpoXCO9NsX1qCCkKNt0dhX?=
 =?us-ascii?Q?qqhescvtkXtbepmaHa+OSqYT5i5t/MF5/GQS3GMB/C3Epl+5lCAuqd5RI0q6?=
 =?us-ascii?Q?YuU76jXfEfsKCDIL07oqDJzSryrFPkXy1gFKtI+LXfbbSq/IDpupNJrnE/j9?=
 =?us-ascii?Q?iFP51gCRd+jepSFhKdTP8si93HKGrlwG0ZPK6CesY9nsoh4FZ5XduZkeoNeR?=
 =?us-ascii?Q?a4S7pH0BBQfV2LRckUEDNimzOEKSoJl2JFW7K4R7sZXoZ9RJyM47cy8fj7Gs?=
 =?us-ascii?Q?cB7/D/sJUp8q8KSyYIZydO/8gs++9+lj59GhDsq86wiW3wDuMlTNJONBWRBI?=
 =?us-ascii?Q?gWL3TlUg9f1t2OGlO8Uq0YnNdwvBy6vVd6KkQASEhsNSUtV2lgScIp1wOsZ6?=
 =?us-ascii?Q?ZoQKiXCb2mvfWX3hlIZYjeQcY+DbmBidZS9wQsEZm5G3Ixf4SIBUioGXgv5w?=
 =?us-ascii?Q?3eVHkqXi4JVuRJwM75BnozHwIJdTOix8XpCw+Ck8JYJzCiZxyfCQg/b5Gugx?=
 =?us-ascii?Q?qexfcKKIUecMNciBi1lB8n1vqqBBQOex8mBkTN0aTENRrpqN7HXzgG6gR9RS?=
 =?us-ascii?Q?hmOQJv0DFKWgEp2XMWDSX49csNYmNmKQHE4ixWbSchELa7Zktz2TnKG0vwQJ?=
 =?us-ascii?Q?H5mOIB2TaAofc3zxKTpca15vichnxMpjziMEcN3OGOij17C/Iw6kIRUNxBM2?=
 =?us-ascii?Q?niWItQlHCC/IpjDuWIHcI6X7MhzFJCQL/87RP1XPABjWu8s2pr+jA9GhDtT2?=
 =?us-ascii?Q?MA=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f2526e-f6d1-4626-0f33-08da76658b6c
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 22:06:13.0798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/Ba5EKRwVLmgBXxmtoxEB+JYIX7gs8LR3yeHTa9MDKe6rqxQNr+8HOMmuEbHWsVG6Qmd6vGvnk/J88dKkJAkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8419
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

I suspect this driver is around 95% complete, but unfortunately, I no
longer have time to investigate this further.

To facilitate testing, this series was prepared on top of
next-next/master. I can rebase it onto another branch if that is
necessary.

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
 MAINTAINERS                                   |    6 +
 .../boot/dts/freescale/fsl-ls1046a-rdb.dts    |  112 ++
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   18 +
 .../boot/dts/freescale/fsl-ls1088a-rdb.dts    |  161 +++
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |   18 +
 drivers/phy/freescale/Kconfig                 |   20 +
 drivers/phy/freescale/Makefile                |    3 +
 drivers/phy/freescale/lynx-10g.h              |   16 +
 drivers/phy/freescale/phy-fsl-lynx-10g-clk.c  |  501 +++++++
 drivers/phy/freescale/phy-fsl-lynx-10g.c      | 1163 +++++++++++++++++
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

