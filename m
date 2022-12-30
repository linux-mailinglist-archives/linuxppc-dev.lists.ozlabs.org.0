Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B622965937C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 01:03:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Njlp02t0Hz3c7C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 11:03:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=LOe5n/8U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.88; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=LOe5n/8U;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Njln30MDTz2yNX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Dec 2022 11:02:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXE3dR8mt/VU9emRSro0PPfZ7dFpYIKkzzEc5WQtPb/H/5F39xT0pe99C2MiutBdUtzyZG8+pmvXf8Fnr9P1CuqL3XK3fk4TewJkMP6sxwLuFGj7vYrAPYdDizM8OQ51Q71HoZzS1x9BGRwFQgHUPCaNfUzhrhdLCbUqoUbkJ1KgizWKyQ/50d8niWkAq3j1HDk+o07tY+ApJBXnmwCAxNOMlKIvCdr3rGUdDfgiMnC1qMw9U1ituQyuFhCZMqRaAkOrKTtG2R/kfZo/73+G4jc0q219mvOBRbBrzzL+OmMMdrwbk2RgDUbrHL/yB0uqegLzBrf13GE/oSqHKcpCdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3nQ3m6DzCQQU4z5rdK+UDpg48p3/VCjVW1kymblYR0=;
 b=eXuDCbpznLOzxd9p7o3+3yXltoMD27QpM+DRNzVd7ao/7XlKJIlFAJYA4C5b+g6LLqm7MpgOOt45tB7DlybrANWLyqVIct6skB3c8S6dk1qZe4OD+SSP2N9X+vWlINI40cL69lg50DIZOGKevVBwCS16xpGUY/JSNKG766DmNi6X2vs05vcAGzaCC+sni4ndmh3jqOj3LQ9mpKn4HBeJRzA46w5qOOjsqOcHL90FgRnw9j37e3RrTfv7Mnj3kC4xzxZ8pidkYRWYcTYiZaCopVQURV5sef8ZZ3jX8idLNs2JhxwVBQDjNfsFss13yNpo7aKnVEyV/fndBiAaXmlZcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3nQ3m6DzCQQU4z5rdK+UDpg48p3/VCjVW1kymblYR0=;
 b=LOe5n/8USPidHk0miCVKGuyEpERZAn3z1d0qlTxOmhTkHyYUqj3sL8oGtadFh5O1dioEc8Qg+Ah+EiAjCM/jHARJ7TYHx7+iaHL7RRQztPamTqyjayuVZmRFQF44rq1JOzP7lvi1W4LmkHkGD5A1s5Jn7UDAH3AhepO7a2aLuMxQeu6Xt2Rt+UBHNdau1R1c1YZctpYu6j/sg66XyZHyDwWGbSzk6wevkOPM9b/H/FX+k2v2dQvFDsEp/rwOgOl/JtVxt1PXta9TZmJlBhS/DzWjQsm7S/sFfd5IgNbOdns2d+C61ix5w7YpDaR5QN/fz6BzDsd6ZTJg8qX5YusURQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PAWPR03MB9788.eurprd03.prod.outlook.com (2603:10a6:102:2ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 00:01:50 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb%8]) with mapi id 15.20.5944.016; Fri, 30 Dec 2022
 00:01:50 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v9 00/10] phy: Add support for Lynx 10G SerDes
Date: Thu, 29 Dec 2022 19:01:29 -0500
Message-Id: <20221230000139.2846763-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::29) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|PAWPR03MB9788:EE_
X-MS-Office365-Filtering-Correlation-Id: 305d83d7-e49a-40f0-b994-08dae9f90cd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UwV3Y2/2yy7Iz3CDTJvQukYMXpdfavHJWxU4Z23U0biFg4Mg950QKG7YVqxrACC3OLsyy0ZFuhxPaLj9zWNBo1x1kfk+FszP4YIbVdhGGGqxqyK+EGZERxzlwlqMScpaJmYtK5Prt3xkkVQcmypNQ+2/i+nOMxwvCgaVBJWB/Kz1oUNN291YLkqunyUZhrPr+ocQ/XMGC6IQkFSelWw6YhCXf7yBSpLgcrT1HIEu/VZgFOibMyf8MepVBVmytxHY8fQ2R0d3OiXvyimWbUy6E/VsQrZI90lw6qmtrrZMBX2t/0YJ+3XM0NvUq1RR/vpsJE1JXP9alwYuaaw3Y2Oc/lN7JJeZb9FEvZ1NevVbEygU088NYvKHvOxVp0pvmyXVeOZIU/kEEUwsnGLgXaaX1jJzWreJoEKmGrWjrPnA2vEqCMMnpLWE2JJIOnS4kiwNmjzqbvEmn8nBntoY9yqc8prxoSKxfFFC3nBjux97vaQ4enRw5nzEYVHXBhKZexqxi0dRj0A/ZFUE507GVbtWdl5TMxnVnQQbEMKF0fNWCzfC5bU5pbqNMrsLtMq+zBHu1tfNUOnz/ilew9Zq2W5NUQEr27KsoRuwWGziCEI3m4wr3nyeAIpaJ9hindrNT0jYpQ1x1Su/CTVEevlKWMZEcLrDC8XgGs3BEHsLkmzJh6zweKO8ArwmS+d05aej6Dh7XgG2JZapj4Cny2aDJ8RM3SyTjysXVNdgVAo58Fffvfc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(376002)(136003)(39850400004)(451199015)(8936002)(83380400001)(4326008)(8676002)(66556008)(66946007)(7416002)(5660300002)(1076003)(66476007)(44832011)(38100700002)(6506007)(186003)(26005)(6512007)(2616005)(38350700002)(6666004)(316002)(86362001)(2906002)(110136005)(36756003)(54906003)(41300700001)(478600001)(966005)(6486002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Cu10C6pu0x2weYiqzRIDaTgUkGAHikVN6E6aRbkorIRKEELWjfElPuI8ZB3K?=
 =?us-ascii?Q?aQQLUcN5a4zq7LJ4z223W3jni9GFCmJkRmxaO0+V3vJ5veidRtbiDfC6Kf6j?=
 =?us-ascii?Q?rUKlXxEXr822Z8t6S9dUEl5ELRS/TqTb84ralNXsgj2dwHOsZh2TRzCw9cqM?=
 =?us-ascii?Q?EGYbh6D3VlbIC8/n4oQqIPyZaBQYnYkffMYZdJGDr5Am5ra4mTMFoti+nBc8?=
 =?us-ascii?Q?PjbjZLD+GPSb6duZCLW1m7Cy4s7Y8RIbilgTu8HDzml7uNwUXYvt0A8nNxZD?=
 =?us-ascii?Q?NrSokRrbjTvqdKk21WbCka/6cTums5+evDGz0vCywUUJ3oPecgSBLc3QnIob?=
 =?us-ascii?Q?SWncEaTBLCio33+VzGtfozJT0ikbbEBOQ8yzHnaYNa6iPm8FKRjZ7l3QskE+?=
 =?us-ascii?Q?uOaiKdOoKOyjNYtpk89GsTBgg84Tfm9gAv8maURcTxID8ZcAcOSRWPWMkwlO?=
 =?us-ascii?Q?Rb6XGcKMIr/x2J8DVLKw4NAYREl3ZSh2nH6vEu/wVIWjUV+FQpETdxt8CIt+?=
 =?us-ascii?Q?6OPV5ZxM3BMg2bELctL1HMMCwzN2mkwilU50LS0snCi4qEAj+k4F5LcdeOrC?=
 =?us-ascii?Q?NWMnLfx/EhZhGFUJtOt8okz+BJ88l98vYZgPXwvX8E8SawUkEHORjFa1QkW7?=
 =?us-ascii?Q?6akZ6RPyQK2ug241ozOsTZkWigowJnrhI9UEc/R3dzjkh2GIU+cqNEnvvdYl?=
 =?us-ascii?Q?pha3ofAhvLMcv4W59OEesRepbnximEa+8XTb2ISfnmLv4s7SR4OTXiCVVcD3?=
 =?us-ascii?Q?goehyMqAlBrttzatK0rt8xfAOcn6swCw3zbsOwXKwnuER/MCPxmaxXEjLogu?=
 =?us-ascii?Q?EOr3ja0OKZ8jrcM/DYkgAIiF3cAsi9B+lPuzC67sI4cCPiEB6rwGbNT7Ne1V?=
 =?us-ascii?Q?UP6k9CNKr4Avn30WMR2wZsl/KhxWi1WRUmYVB1XhFOcZV9RR6khlNh3iIX3X?=
 =?us-ascii?Q?8SApfNHpBQ9bDJtrZSMAMWFEXrsWerJwHjwtR/4Dmo8B06vYEcNKyJffpn/w?=
 =?us-ascii?Q?iH+Ke3dLaRjZQikrgStse/B809ru9SFQ22aRTKQdV1j5t+vcc34rVhX+z+64?=
 =?us-ascii?Q?k4o1mmDys1BQ45OinoSJJ8Z4cAIG9bGjT9zwTP3bVbRaQgZGJtQJpcEV8Ymh?=
 =?us-ascii?Q?oWS1OXzOSd3qlE8JvI/AqUPXRm7JYtxB2KDRw9E33RgA+Cw/UxZRIN6lDX1h?=
 =?us-ascii?Q?R2A4OBa86BgS+f2DpIWUezkd3d1QU6d/u0hhIK6iDGE7hBYTeDaQ2yGvuHmg?=
 =?us-ascii?Q?UgPUMeQaDFSxQw7ESLnHxCczImmBxchezbyaXkQR28Y2wDS3LGWX1lUdv3Lv?=
 =?us-ascii?Q?bYr1cZMWR8fWy5KihtI2RxEff7YTspYZzFfL2rdJCDP+vyMMlFFNFnDLB8C1?=
 =?us-ascii?Q?ST5AAiM8PaGBaqotEgWip0/MqcdYpXRNaIxy7WglUqifmzGxcm9USoywMw4I?=
 =?us-ascii?Q?uYW6CfRZJvA4fJG10qlEKdqnJ57z4jJjMuNCVdXrmktcSQynBdRuzBqdZQEX?=
 =?us-ascii?Q?/DdeqUUTyJGS0eVFKWF6+1iSbWtW4Gql0XAFIjVG2T/GwcEF8hccW1MfhTq6?=
 =?us-ascii?Q?l3iyngtBJ+NEKCqe5+QA1lXD2qvm9tBgqtqxnx82/a59hyLY7iY9FY0XuI9x?=
 =?us-ascii?Q?xQ=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 305d83d7-e49a-40f0-b994-08dae9f90cd5
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 00:01:49.9526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sJ3WnBLOznr/XpzUbSFf5mwUIKNOuRH2kVaglRsKh0p/6wSKAebQt4Edd3uANakfhpjPFVE14yIeoHKTopGAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9788
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Shawn Guo <shawnguo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Sean Anderson (10):
  dt-bindings: phy: Add 2500BASE-X and 10GBASE-R
  dt-bindings: phy: Add Lynx 10G phy binding
  dt-bindings: clock: Add ids for Lynx 10g PLLs
  clk: Add Lynx 10G SerDes PLL driver
  phy: fsl: Add Lynx 10G SerDes driver
  arm64: dts: ls1046a: Add serdes bindings
  arm64: dts: ls1046ardb: Add serdes bindings
  arm64: dts: ls1088a: Add serdes bindings
  arm64: dts: ls1088a: Prevent PCSs from probing as phys
  arm64: dts: ls1088ardb: Add serdes bindings

 .../devicetree/bindings/phy/fsl,lynx-10g.yaml |  248 ++++
 Documentation/driver-api/phy/index.rst        |    1 +
 Documentation/driver-api/phy/lynx_10g.rst     |   58 +
 MAINTAINERS                                   |    9 +
 .../boot/dts/freescale/fsl-ls1046a-rdb.dts    |  112 ++
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   18 +
 .../boot/dts/freescale/fsl-ls1088a-rdb.dts    |  162 ++-
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |   48 +-
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-fsl-lynx-10g.c                |  509 +++++++
 drivers/phy/freescale/Kconfig                 |   23 +
 drivers/phy/freescale/Makefile                |    1 +
 drivers/phy/freescale/phy-fsl-lynx-10g.c      | 1224 +++++++++++++++++
 include/dt-bindings/clock/fsl,lynx-10g.h      |   14 +
 include/dt-bindings/phy/phy.h                 |    2 +
 include/linux/phy/lynx-10g.h                  |   16 +
 16 files changed, 2434 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
 create mode 100644 Documentation/driver-api/phy/lynx_10g.rst
 create mode 100644 drivers/clk/clk-fsl-lynx-10g.c
 create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g.c
 create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h
 create mode 100644 include/linux/phy/lynx-10g.h

-- 
2.35.1.1320.gc452695387.dirty

