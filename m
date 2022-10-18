Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E74860368C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 01:13:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsV650QK6z3dtJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 10:13:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=v9b7BCJd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.103.74; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=v9b7BCJd;
	dkim-atps=neutral
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2074.outbound.protection.outlook.com [40.107.103.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsV422Xhyz2xbK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Oct 2022 10:11:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cISSfNqKh1RVH4y7bM7GFdSa3BfmaW0AvP23QIW1qzaBMHjVwOoH7dxXs9I/iSDgUcE+/toBwPSGycEFR3141YcBhXkmE6Fkgl6hrJryNjG22UH4ebwkxVupDavSuNG1SqzfPfIaa6By1VM3+4gx+6tcbQaFCqgf5hanitUO5Z+mf1s7vFgk6pTxBfdIFQNp0QWurszJP8CMa0a416G9Kk4ryqeLK3GxBjqqes7GhLu/XEXCro/ERAEB8CxtEoLT2W7uNR58qgUUwET7DUsfFgbAyAuPx658gJLB0BlGKEKXdg4ydBRBkp7WWZCwajQJEz2DOFq0gUcVTnCWyiPTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKA1qg0S04bBnooUTMgeAgmBWZPJrqIIdmiQvhLONfI=;
 b=l7T4GPbTnL1lIyaAKA0HF1G9vu+KyHHAwap8f65brcHF3k6u3a3nhHtjWr7UQEkqxYuUtQIHPw5+72i617wTXM6gIVHEorwtSAzna9y3SRwQMBtqtN3M/whO1apnXNq4SwGr6viTwTBJs+wF/kl9zntwh+I+fZPOU11p9IRLH+UO7cfMfCOU4YnGK4DQAnCevWbD8cGRM/oIFC0XDUdNRXaD8wKvLpL0Lj30CLuaxssdrxi65C783gzi4nVsi3LoJFq6BLlU0fTu1/j3kvXHigFXmYA12B/sTo7uaBdvMIPW1mNpBENWGvahxZveNl5GWGn4i2W07IS+K6BRS7AlSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKA1qg0S04bBnooUTMgeAgmBWZPJrqIIdmiQvhLONfI=;
 b=v9b7BCJdV/N2alxx9MA5QxY3+gu9ECGHSaY/T++wskUzgLxCKOEHSkADJHm0RnT0987XrcQRVVNC7s+ruUNFLIan65NxA4mzf4HpMGF5O1PaqSYfMXJXo/br6Afy7Bm+KlPRDsvza8HVkNWha8KtjmoHSrUESI5oYK9jmdckijPAPgXi2OnqaDs0Qk/xu73v4CST/rxkgJgPRe+OBEh1boIn1jfxsyNZrLal3GjEPNupABn1hRlAjhQhhI79gGdcsv+2JybeE3FnrFbpUVlzerzmFi8AVX60+1gNUrg3MpmCbyOI+qx2R2BZuayotkkUHIC4kRPY4cSLW/GklLuq9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by DB9PR03MB7644.eurprd03.prod.outlook.com (2603:10a6:10:2c0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Tue, 18 Oct
 2022 23:11:23 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5723.034; Tue, 18 Oct 2022
 23:11:23 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v7 0/8] phy: Add support for Lynx 10G SerDes
Date: Tue, 18 Oct 2022 19:11:04 -0400
Message-Id: <20221018231112.2142074-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0007.namprd18.prod.outlook.com
 (2603:10b6:208:23c::12) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|DB9PR03MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: 542a22d9-afbe-4010-1d3b-08dab15e1349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	vPq4/Fe4ctYPuKgH55Bn15VuWMWhRKHjF/InyukJzs1Hy2j3D8SCC14GQSTb9awy97dH1HwQX821io7sQcT6CNAUzE6ZBVqAvMYiEalAxgSHdeQOKOqD2sqEQYfGACxUbQECFcl4zFph6Ek3gywoLQuyNGnqhIK9Zt0FoPoj+VNTgCPeV+eI8pzDQpu/pQighA2Y+zx5YSF43H2OASObQTa1snNCEkjoxL2MjzTq5oJW0EKw2JHW+7dfudVcVExbpgaC4T8gt1px+x+rwMam8nTS1F6ryKudC4+EDT2fS6maCPccMY7JCt5iehAzQdczvaopZ0VYP43k/8jdGjuervdziCTp0yDjwTUfcTmHAdbQZy1u2L9Y5SxbJ0eMiaJWNL3BDq/93BvUzvw+N4yU8vjblMqRd/tsZejUXUGdgkN3m8EwyI0HCgpE5x9ZO2YLsROvr2XCtVFn0G7avriSX1q0TLHDpjNEommZA7D+zL6sFPJS4ogYqQR6g73ykdHB4G5L3w7EuLhd7ucdH28rYzFTaK3qYqD69hCEt1Zl3uwUm2kyK3nQc4ZMbB7YmNUe3dm8BhCGxxbR8xJ6Vh/rFCQes8Kn0bZahPozikEsCL3oqMETesZ1ZmRP72kybFIf1LTsiKWKWuT1vTt0WwyjpnBOmZtXuhDLSmd0s91rjzISZV9KyBiSFSENJ5Lj0jLCmXlmCS1mJHZrSYSd/NMRcuqrQF/R4WDEndVSG+29G71SQdJKT2mjITiI6YvNbB4+/lWlJuVJwvsKL3PY0q0RHYAMz5WZnNJwITgRXGqGbJdQatM+GtYbE+dqhKmMEolY
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(39850400004)(396003)(346002)(376002)(451199015)(2906002)(5660300002)(7416002)(66556008)(54906003)(8676002)(110136005)(4326008)(41300700001)(36756003)(478600001)(6666004)(6506007)(8936002)(6486002)(6512007)(83380400001)(44832011)(66476007)(316002)(52116002)(38350700002)(66946007)(38100700002)(186003)(26005)(86362001)(1076003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?epE3Wfdrg8ssdUVJI9BZun2BWnnmJEEdIfWrxFPvtQnBjSugXE2PzZDuhpx2?=
 =?us-ascii?Q?YX9GkeR+Su1fFeq0Bn9mNFR9z7UpzUmJHVyXtDJuqD+h7ClTsIId3hGtjdc+?=
 =?us-ascii?Q?o32gt50sA10RQhTAOOejdTntVQjHqkoKMC7mk5Gns3jMWazQ5aNMh9qWTo7Y?=
 =?us-ascii?Q?Cakv6+YHjN58gpW8wJWx67/szTrp5x97cJMYnTuZDomqN6zFJjZxPFcZnyY8?=
 =?us-ascii?Q?e5OCKTXdGFJQzlvVK0CqQCINffDsCoPus/ush+xBsMhtPA365t0nW5xPhFTx?=
 =?us-ascii?Q?TLF9EdQR2E4MaVBDRh7TJ/ymDd4Ty7EjBBQY7HQKxFY7uULZAYrpybEh6daW?=
 =?us-ascii?Q?xY5+ZrC7m6RXGr7MMOuVqO29tevxptocwZXRGzjqvUNZSAm7QLRo/GHS0/6Q?=
 =?us-ascii?Q?S17XHV1RaGn3r+8ekm2zDb23cQYc3LcHtHups5LLqgMgLKYheYD7cOvmH1q/?=
 =?us-ascii?Q?9dwzEgkZwCtAVh2uvtrMn6xcePnJj1ggLivFkEoGnbKGmIR4LXUlxY3SnV9u?=
 =?us-ascii?Q?QCTTnle9GSg7q1XD1R4LgQ4woCOL7NuD9ttnhE8beVmAp1QSQn7Ae4RI3cFC?=
 =?us-ascii?Q?6zag33PRRd/PLsSO8aiTD4f8ZJXXbg0x55/IimGy1PIchnbFDNp3xoJweiea?=
 =?us-ascii?Q?oCCFckEeplWbBKwyxO2oWa4eLeGyWeB+8uo90YPqi8ok3nntKuZ8afCTA6RU?=
 =?us-ascii?Q?puVoi3+GjHBwNj5SB9Bc/ShRHB/mbrR6wBjO22QkejTatSpMcV8LBGAy9d57?=
 =?us-ascii?Q?9HSf5CQrAliTMJEU+O7GrrA71U38XfTovT0XxSDSALCM6PfvW0hv63+slZfD?=
 =?us-ascii?Q?i4WD+B2geSAG2z3I2jFuA0A7JPN+0zvhXzvdaCde1dKxGeFY0e20Fe5rEBfR?=
 =?us-ascii?Q?B7aZlR63ubG1Ckw07lvH0pUDCNLwDBWOaEc/GExt1eSnoofAEQceO2V7X0nj?=
 =?us-ascii?Q?AozBMl0LFEGHv4Gr0zpFkHcDt5Tq9xB+/1n4h1aQK9rnhqFp5isWHZmxF56V?=
 =?us-ascii?Q?xkBwQU8RYyIgee+ho02V7WVe7Y39LYW+AwbrHvuOgrZiJo+gx/zlDgdugJTm?=
 =?us-ascii?Q?iJgTCUNtg8Nw4En+dwZx5mQhpZ9W2yqetOb+470FnncMmHJbr5W5VAivfeWJ?=
 =?us-ascii?Q?wwydgHiCZkiIKL/dNHnNKiQ7t/eIXQJdNjdKnyG0eHte9LJCJEaJNxz0QPpx?=
 =?us-ascii?Q?bx75DYne54trctNOI5IRrZ3Wndt/nYIFLZjxiNKgkle5M2f32o7TYC9Z6fzg?=
 =?us-ascii?Q?wWjEA2TKn6RbLKhvoYyBSBOofkDZrLYYK7hp9Lsg+Q2ey4PAspdkvHW9XIpn?=
 =?us-ascii?Q?ibgWZOVCg4lRhVLe7gBExmVfFEf7U+r1U6cSyhcImXafPKR6GiFhUYsD6yVq?=
 =?us-ascii?Q?jXk5nIhfaEM1jYCqI4yUB4EOVbKfhQ7UTUwhGENRta+CJxelKAXKiDZD/75y?=
 =?us-ascii?Q?e334nCRyEPI2BxOumsLiQCD9f4hr/Fwu1ncH2v8pmasWEobACHYs0Kky5LM2?=
 =?us-ascii?Q?sdTRJqgoWP5p0NgBWuzVGWwcOudBa2fSs/yEHcCZM7Mef0rCPc/U+8EVKf5g?=
 =?us-ascii?Q?F8TFoaOnkKuuvoytSNwf5pBRwVtFuolUojkdRmJ0F+5WFAIkGvNuQt6Q+/1U?=
 =?us-ascii?Q?GQ=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 542a22d9-afbe-4010-1d3b-08dab15e1349
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 23:11:23.6509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uMU70qyt7BfBkpVV2BNh0OyESsAXzHisJ1zVjHVj2985VsQ3UVm1i6mNPozvKCtcLfwWTa5vFBaPQ+ctDske4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7644
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
longer have time to investigate this further. At the very least it is
useful for two cases:
- Although this is untested, it should support 2.5G SGMII as well as
  1000BASE-KX. The latter needs MAC and PCS support, but the former
  should work out of the box.
- It allows for clock configurations not supported by the RCW. This is
  very useful if you want to use e.g. SRDS_PRTCL_S1=0x3333 and =0x1133
  on the same board. This is because the former setting will use PLL1
  as the 1G reference, but the latter will use PLL1 as the 10G
  reference. Because we can reconfigure the PLLs, it is possible to
  always use PLL1 as the 1G reference.

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
 Documentation/driver-api/phy/lynx_10g.rst     |   58 +
 MAINTAINERS                                   |    7 +
 .../boot/dts/freescale/fsl-ls1046a-rdb.dts    |  112 ++
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   18 +
 .../boot/dts/freescale/fsl-ls1088a-rdb.dts    |  161 +++
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |   18 +
 drivers/phy/freescale/Kconfig                 |   23 +
 drivers/phy/freescale/Makefile                |    3 +
 drivers/phy/freescale/lynx-10g.h              |   16 +
 drivers/phy/freescale/phy-fsl-lynx-10g-clk.c  |  503 +++++++
 drivers/phy/freescale/phy-fsl-lynx-10g.c      | 1167 +++++++++++++++++
 include/dt-bindings/clock/fsl,lynx-10g.h      |   14 +
 include/dt-bindings/phy/phy.h                 |    2 +
 15 files changed, 2339 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
 create mode 100644 Documentation/driver-api/phy/lynx_10g.rst
 create mode 100644 drivers/phy/freescale/lynx-10g.h
 create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g-clk.c
 create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g.c
 create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h

-- 
2.35.1.1320.gc452695387.dirty

