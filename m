Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9D95BEE7F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 22:25:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXChl4nRJz3c73
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 06:25:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=ddjkICsC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.20.53; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=ddjkICsC;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXCh62pWZz2ymS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 06:24:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pw2B1Sd5NLCaWK7idEn7e3h11IAgXuVXO3ptKVLiLp7/Ns/jTGBHbdkhzY3Cjp522Dviatq7s/T5BQUmVNFkChOhk5DF6l9NlpIr3TgYXTORz0JnSMGTo/imsnV4AEJJoTXqAjzskNc+uQy4vfcMMkKGtLEuRZ1GGiNyCRH/n6Z58JxG2QxW9YG3I/htCRpx5VOgbkmP98X1J5MNO8U8IHw75IsyXbUkuEmOPlA6xDVWpmi2w2XXZVf5dLo2Au/rxBwDLfCI5RbJv8pS4QiLZ7jTnnb8c4Cui/rkBS5RVgfwJBgwwK0399k0+7ukrSMU1ZxBiiD2dxqfsPM34QuB0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ithjw/9iL3+eG88xirWwJKx4xQcd9uleucNIeoH8BTg=;
 b=ZMrAefgcO1wwljiQXuab1Ws7OMsAA36TUWBfJbk2oqhT0khfWhcK9GBN9SEm92OMQeZ4Cx/r7gfw2MjCzfLbsTKooNyiCsBugeHcwBrpoAZPvEK7auHwdzb2Js1L4THrZND/FxhZfpMUe9xajNndugAyUhcCaIpxWSD4cdMMHuu8G84AyjHbMBcS3ntMTTtIKh0tsEboPihFrdjvyX6UModCIajrctz3aGrxMpI84oYjpSlCCHhDHCMlrP0atxD+4mxpa8EepG0sMXAMPyooFS0CoulzBijOxy4T8GUpgpNqG3u3mhdTv8d/Dv6UInNsERw1rYDPBwzo1TiL9CtCHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ithjw/9iL3+eG88xirWwJKx4xQcd9uleucNIeoH8BTg=;
 b=ddjkICsCS1vyJhFhWkGS2OGXC+vwxD6wCcxKtY/8rDZDWjafVgsGoXcb1CGAZaPlC4L/kGzRUeF6MOrls1XyZ6qIFvLIdKfDLsItFP20eElSOUlFs7j+/CiqzZxgngACgI8H2gce9nDZa/rLOUfQfFdcshlUOBEBJ5V4W5/TW2JK0Blh0jgoYjOsuU6v4c80Q4zoAz6YOurMTr2Cuwk5ikuRuEm/+LW/36G5MRlx1LyePRq3+ot3fx8S+j96QeuXMFX5gmFqF24TWg7/fGjBbkpNIApL0bRSnd0R8MNHmu+trQjcqi18EEXWXvj0ARTnrWuAxtZfvsA7S71xLsNFNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by DU0PR03MB9566.eurprd03.prod.outlook.com (2603:10a6:10:41e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 20:24:14 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5654.014; Tue, 20 Sep 2022
 20:24:13 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v6 0/8] phy: Add support for Lynx 10G SerDes
Date: Tue, 20 Sep 2022 16:23:48 -0400
Message-Id: <20220920202356.1451033-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0014.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::26) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|DU0PR03MB9566:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df79bbb-46d9-4966-de92-08da9b461573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	KlLSt9uINRp6K6wHrK0jpv113aEOlNTpDbW87qOI3VNtwFr24h0Folt9zXwSmdJB4uqOvP1X5752VPIGTjop3XbRSmHQ3xffoB4ZqlVxAjJUPvTZ3YNWoQPxgsJPJ9zTfbMj8CdFO1fU2SIWP0i0IjvSok/4a1y/3eSnpFa0z+JrjsaDkJKICi1jL5Jc3YAI0qDujWv9lXKLOd6frKoMsq3TeRSGdGMjSZKp3lk+5QR7Z1vzEdhAeASS2kmDKK1o8aMmoV1Ivf1EyjjUJ3BI6gdnAW8g+i5dhLl5+i8M2tvhEmGDa7HyThmYGX+dzXwjzo7SPX8CBX9yid1DFYunFvTM1CloHeTLt/96TJ5MEbNbUiYr344fHgd3NZURsDkes76gbexgalPf0HWOXDNM8iDKVnEtTn4sw+QHny6vICGe6eRblZWHbIRicCKtQIZz1JZaUDBcLwZ4JkkyQaCt4nExq0mhZpTn3owi4zw0R04ZvjS/Y129jr1MKKMVg1bQZWJC+MmE/jxgDUuPRNcD9q8e+w9E5+Mrr452D8KKRWVhfS6vbG9nTZ4VHQeev1+sX+b8Bwm0pxiyQQs6cpLAfq+KUZaLMY9ZMbt+8+UE2RcusT+jBilreYmNe8BwsnQ02UxkFV0VXqdFbLP3QZXVWWqjwQP5Few0LyOpp7P62JMZb5m3rmOtZ7EiOiy8I1+R/QSTgtsEQT+UtOInGxEnWtuiJn0LzziO1QzlgZn5RDJ99fd3yB59l8TeEoohl3FZ
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(376002)(39850400004)(346002)(451199015)(41300700001)(38350700002)(7416002)(52116002)(6666004)(83380400001)(36756003)(6506007)(8936002)(5660300002)(110136005)(54906003)(44832011)(2906002)(86362001)(316002)(478600001)(6486002)(1076003)(38100700002)(186003)(66946007)(66556008)(66476007)(2616005)(26005)(6512007)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?m5fE9PatL8MtldxicbgOx7ZqSkhvkeW98Ps3INofDgyf/7o/TgcICkR6sXli?=
 =?us-ascii?Q?d+90eOXPkp/sBl5r9sOex4umeiFoA31M39zMlwgMbNMLuGsA2rD6GGdkxDrc?=
 =?us-ascii?Q?p5YEYlOzYoLxu+2yWxgSmk0TDva/5mABepMHEkJoJqk2pIGgR3Rl/XC6/1QW?=
 =?us-ascii?Q?42eB3FOzXPNNZGv5mjscPvSkQ3XTLQF/367KCrwLf1HlT6uSgsDeA9EnKFFu?=
 =?us-ascii?Q?Z0X+RVnEIYkQ0GoXvDtDmb2dg3LgRZoA8INNZXOcEQ5AHOZG/wxZbnKWNetq?=
 =?us-ascii?Q?LV/ZifgynLyHMXv7dKEGaJliXFJGcnpXp5teVlFvQlGUPE5maaaI8LpwIND1?=
 =?us-ascii?Q?/AK+q9ioq3FaiVQoDw5HhGQaHHPvbOrlp8pmWdPV2wOX4HtMQbGo7w0fiq7z?=
 =?us-ascii?Q?LVqu8QzVAGn0ZX16ZvJZz81mbFO65E72NGC7iM+8NjNWpf1elkg9gEoi7rlS?=
 =?us-ascii?Q?YkFtdQIdSi37FDSkVeeq+Qww8i7jQQRRFhM7b2pgQxJAeX6VMg0f3uFKPLuw?=
 =?us-ascii?Q?yT3bmZ8wrwK/2YiFWCituSi0UZvpA6Pv31o7nzpuv2ojWCSJj04ZScdeYh3j?=
 =?us-ascii?Q?BHqhruIBpkvRds4KMpHiXPEoEw/BaB61bBQLWBmW36ooCqmbsBELnYqNGEOJ?=
 =?us-ascii?Q?EOZY23hPrtvWGTbPY6pq/tGxSXH6NlA3dOWN0qwM2Qw0x0kmPVkvYPZIuVry?=
 =?us-ascii?Q?tOPzCTYeeFGtMrPymnwI2XPI+xdYsg6KpIlx29Fz/2Ez2dHzv/aOREr0qkGj?=
 =?us-ascii?Q?VyDt/ms16aHk8BrppHDs2yy2M0Cy75xgZc5SRImSkouVs3CKDjBre/0zUQWU?=
 =?us-ascii?Q?LCuNP8pVdZAU9QA+T9FJ1PznOUYbhX08+uwm63eq5XrkJ4Ts/T4mJyGXtlyg?=
 =?us-ascii?Q?Fv7WfZPTd/9Tubi72QACEBLRu9Ooq7sED0rtApMrDz4yDH9LX7/7TbUV4qr2?=
 =?us-ascii?Q?OGxU/hYgxk02kqjdNp3sp3FrQ3mZuKMwMZ46O32ZK0y+TZkBR2KdD2q/Uvut?=
 =?us-ascii?Q?ITmjJC4itAxBKF1ebs/C/EmAJGPzh18jH9Svb5+o1EXZIu5bEJEZtyH7OqUp?=
 =?us-ascii?Q?ZlGNhjFtZx7J+ScHww7U5XaFT3HeOIZAIYS7iq7MZalmPAa27PMqSfZNOifY?=
 =?us-ascii?Q?ek/NuxFHr4WC+MBhcvMeC6ngyJYsBNYDcSrFRDMKyvmS7BOACyne9mxOQW9G?=
 =?us-ascii?Q?7913qrJMQjZnliloYJuLYIGmdtdHH0Rw9AN0VdbQpqKeuAiL3CqOx00uDyGG?=
 =?us-ascii?Q?uvJyn7ue/qVwKvQslRGh2jq+R25Xh2O46qtnU2pyQYkbQGZZDTtVhz58AVZ8?=
 =?us-ascii?Q?0+HhtJr/kzC6DmtCXNm5RYpZ8cO0w/IT2f/FrayV5e3Ax7f1JCW42eTLIcyy?=
 =?us-ascii?Q?tVMw0SNAQ7CVy8xY+9qxlXZgNWZGlNi68SDioMKb1X75ZJvXJjWp0ip0olvR?=
 =?us-ascii?Q?8UZAPU4+lVZ5WAM7d3au2KxPvmpzvwakd/zIn6+A1x2Z8E2rx43k1nSyOOFE?=
 =?us-ascii?Q?RlFMBcIKnmSlvcvEso39O8e8rgD9H8X5TNxcdEfwVKDaA8ctKrIvt+YmANVd?=
 =?us-ascii?Q?9urAup/CUs8GmFM2NTzHgv4mX9YVXUr3sLSR0XK+RaAlOUIMsU76I0jPNrNg?=
 =?us-ascii?Q?CQ=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df79bbb-46d9-4966-de92-08da9b461573
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 20:24:13.7840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkVPaAuQC2vseRYN3G6nT9PcJR5NV3OhiVPWmgWSNzgD5zCAJaia22cCRY/LTXB6z453Qgs75cfw1G7V5fo+TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9566
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
 Documentation/driver-api/phy/lynx_10g.rst     |   66 +
 MAINTAINERS                                   |    7 +
 .../boot/dts/freescale/fsl-ls1046a-rdb.dts    |  112 ++
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   18 +
 .../boot/dts/freescale/fsl-ls1088a-rdb.dts    |  161 +++
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |   18 +
 drivers/phy/freescale/Kconfig                 |   22 +
 drivers/phy/freescale/Makefile                |    3 +
 drivers/phy/freescale/lynx-10g.h              |   16 +
 drivers/phy/freescale/phy-fsl-lynx-10g-clk.c  |  503 +++++++
 drivers/phy/freescale/phy-fsl-lynx-10g.c      | 1162 +++++++++++++++++
 include/dt-bindings/clock/fsl,lynx-10g.h      |   14 +
 include/dt-bindings/phy/phy.h                 |    2 +
 15 files changed, 2341 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
 create mode 100644 Documentation/driver-api/phy/lynx_10g.rst
 create mode 100644 drivers/phy/freescale/lynx-10g.h
 create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g-clk.c
 create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g.c
 create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h

-- 
2.35.1.1320.gc452695387.dirty

