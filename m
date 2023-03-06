Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FD96ACE03
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 20:27:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVpWN4Vwdz3fH5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:27:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=TT/M78C9;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=TT/M78C9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0d::30a; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=TT/M78C9;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=TT/M78C9;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04hn030a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::30a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVpGf2rJ9z3chx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 06:16:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0k1dBOnRRIZ0foq6DkXCs+MwrGvcfVRbv933nJMvXk=;
 b=TT/M78C9OONHEAW49HtawRenD36fiycUbKhpHAXWdIZf7OWyyW0C2rBwOpujQ/kda8J51Hm+mmNE23phqtH82et9bjocc2HLh/crPWkD6HnBghsPlhaeMGy0IrmfntQsaf4sT5JOQNvC1A8Qzr5Yz2tCyVDdM0DG3x1oU8jkL45Ibc8+f7fl9ioZwnHAR+YU43cSigANzCWcoWGXQBwIEjZ+CnEnH9GRbwO5QFnIpwIHc91WoAg3iPADPOg4XMm2cFpz+S+XV2Tq16sG5fBQjqPHvra/pHAKn+ke5j1eCQCX75t46slibd0BbBvjpu0OZMoXBDr9EuHu9Q1HAc3Vgg==
Received: from FR3P281CA0184.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a4::19)
 by AM9PR03MB7557.eurprd03.prod.outlook.com (2603:10a6:20b:414::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 19:16:23 +0000
Received: from VI1EUR05FT046.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:a4:cafe::89) by FR3P281CA0184.outlook.office365.com
 (2603:10a6:d10:a4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.15 via Frontend
 Transport; Mon, 6 Mar 2023 19:16:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 20.160.56.81)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Fail (protection.outlook.com: domain of seco.com does not
 designate 20.160.56.81 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.81; helo=inpost-eu.tmcas.trendmicro.com;
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.81) by
 VI1EUR05FT046.mail.protection.outlook.com (10.233.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.15 via Frontend Transport; Mon, 6 Mar 2023 19:16:23 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 10CE42008026C;
	Mon,  6 Mar 2023 19:16:23 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [104.47.17.177])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id D7AF320080074;
	Mon,  6 Mar 2023 19:15:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MnMsa/Z1AAkLxR5D22CbQtuRfQVRNEK2ZM4E6O1qFAnxt8DlInu0TRwxB4By/pKFjgs0iggCdn+rI9HhJL0TlKnXM+wAENiNq/BJU1k/y2LNCFuhaSw/22PC9PoKO5TOWYDp2axSXhfnmBQNSjnFmrVH7K6lqDYv4bQJoHxLaEVB35RLzpzV3wVaVxhFvd48lOEw9qxWzEgPvRST/Jtp8PkZkztGIeBplMEUhQlGtDq5WxpKFqxXIdIDMdagiOVP+FAFJ3LpByAu0sIQcE3BuQSKfliJ62Ky2v+2QLArgsXEZVhpl7dYJkyxDapz4pYAfNSQ0rz+9WG2KbjFL6lG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0k1dBOnRRIZ0foq6DkXCs+MwrGvcfVRbv933nJMvXk=;
 b=UhcrPYUg5S/yNRQ6DDIAPMCpuxgHPCCh3k/UBzhqVY2PsqY4Qt8TGfx1v+WHTqKhBljzDCgarRpIeX/SeG2b+i/d+6mxVqyAn356yLIK3UQmfIPG8NrkfkvNktRSYBGhp8ORnAU7QlHrpEuFIMM0s13Ps9ytIrhoi3L/OuVh5wAfDfvEMIH2ejHIvjslf71w8uPNNS7Db4H1QOQyhGD0kVPDvAJBuedZCAiujIrpP5+hg51hNf6htjIjBwdoDU1eRRRcIWuJ6gQ/XQSd0jt8u/wsQYItXy6tuafjR6KXkGCqZM7ArU0EvPScGWqCVmUKUqIXSZghD1m4AtaL+H530A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0k1dBOnRRIZ0foq6DkXCs+MwrGvcfVRbv933nJMvXk=;
 b=TT/M78C9OONHEAW49HtawRenD36fiycUbKhpHAXWdIZf7OWyyW0C2rBwOpujQ/kda8J51Hm+mmNE23phqtH82et9bjocc2HLh/crPWkD6HnBghsPlhaeMGy0IrmfntQsaf4sT5JOQNvC1A8Qzr5Yz2tCyVDdM0DG3x1oU8jkL45Ibc8+f7fl9ioZwnHAR+YU43cSigANzCWcoWGXQBwIEjZ+CnEnH9GRbwO5QFnIpwIHc91WoAg3iPADPOg4XMm2cFpz+S+XV2Tq16sG5fBQjqPHvra/pHAKn+ke5j1eCQCX75t46slibd0BbBvjpu0OZMoXBDr9EuHu9Q1HAc3Vgg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB9511.eurprd03.prod.outlook.com (2603:10a6:20b:5a6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 19:16:16 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%5]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 19:16:16 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v10 13/13] arm64: dts: ls1088ardb: Add serdes descriptions
Date: Mon,  6 Mar 2023 14:15:35 -0500
Message-Id: <20230306191535.1917656-14-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230306191535.1917656-1-sean.anderson@seco.com>
References: <20230306191535.1917656-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:208:23b::20) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB9511:EE_|VI1EUR05FT046:EE_|AM9PR03MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: dbdfe894-192e-476f-12d0-08db1e774668
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  Rp2c2fXDAmSnqTQQ/uswtk/OGLo88oIoch7XQnbAghsOomc87VHkQSx+vXi+n2o9Bv7RT8bPahKFjviwer7hq92kDtIIqkhUJ6DQPvGS9KGNjZw6Jpg1VgWm9TbLdK9UeIwX+eqSvp7U2GPweJxZjyuASMF/4jvsHuZWAoTDwk/4cRcRnmiu+eR5xLXSd9b/g6MCJvcnFoJMtpTDITsazyh1mRIdqGRp2vKk9fpJk0GOqrHygm1rgFW8UOtm/FDi0iO9UkA6U0ND0eBvSECDW2VF6Asl3hMjWO9vrJi1S1EV44c29iuCMNNPemHVPVqraChseHllVtZ8bkWgLodjqq4Ep7us/DR0p4EfhGWDAEMJUV0vr4j/mJKt9xit1+XXnesqOmC1074DpDsupyhSUvQyfGkZ1U4mFIokSSJeL7qtf0/4kJ7tMsMkY8+ENS+kyoW6dc8iXpvEqldoZryLw5CQOIuAby7i1QWAJ3885dTLCdrP4uECSjIWS7qqokae/RZzlj7LraTUjnObRsbN9I2VMu0nPj5fCqoEddtbDpFnd5tkcR8g6svOXNvNTyqG1sqwouvGXZnFm+23lNnHSiZHWn7KlKwN/XpxjapwJ7mXyfolj51gShBwzO0KN/2HMZGFBqRt2stCqkGjJgiTOAYXez2/SlY5L/L/7q7Ix3OJ+S8rXSMVtwv3J18AdrXs
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(39850400004)(396003)(136003)(366004)(451199018)(110136005)(54906003)(36756003)(316002)(83380400001)(86362001)(6486002)(6506007)(186003)(2906002)(5660300002)(66476007)(4326008)(8936002)(66946007)(41300700001)(8676002)(478600001)(44832011)(26005)(6512007)(1076003)(2616005)(7416002)(52116002)(66556008)(6666004)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9511
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT046.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	35a6dd7f-9666-4139-3f34-08db1e77426b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	zCze0Uq1/X+IASUfsi6Mg3+VzQxNIa3Xfjj0SYB4mvaOjbQ+H8lz0nRN7i/CdRWbNSGS3ZH5K9JLcdGk1ZwcfblH6cFk2hmc8VX9vSK2VSXpFxZWCjnwMseeedTVMKe/SUL5sIOzKdq6SlRun9Lq09FQDrYQP5SAFpTCiQ5dXUVsVbPU1LzJvSx7PrQMKRGhL8VZfQFF7vUwZdVEQBlY+1oe3TtUFwwQDxYEIVQEzvP2XZHho/DOGy3vRjKpVw2Bp79rfqsZJNifCq1wuKULZrd8psSr4FXOeNpGTd2xDZzpimRoihB2zJ+ApE9+tAa/V4XdYQSW2yOKnxBqmohiDRJGbsB4zjymBnn4yDndw6ITHp3W3LqXvHtzoFxpt3MgtDK7cbjeag0LgKzOceJj5Up9J+TwLaCk9fZ+jwRhxoWnv681Ckcmo3qC+yN9ykRlVfsvq57+qiiE+Xtu1kSjkkhNiD0+nszNMK/TFxLEP0FTVSSlod6BSz28mChzUxXcuAOwS1t2ZXyGy8DoaNfaUMg/mQDdZFNxdEWahk+Gxcw+8+AfS7FNcmWtsjFTpc2Kpq6nVHAkdabKYmKa0V6eDj2BbyfWIQSnAJ5w63DRaFxnfzK6uI8tccnN9I4Tcyyt3SoGTqhlvgmdqKbR7zq4l1rADr+iV6faC49JMQ3DkHIzMiAbTwWz6EypobgCtmFnGZbDEXnf9Eu/grv42e/C59HB+/v3/l9m7LNJLTBYmAHDrS8fna1M2BWX+eqMOlqx
X-Forefront-Antispam-Report: 	CIP:20.160.56.81;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(376002)(346002)(39850400004)(396003)(136003)(5400799012)(451199018)(40470700004)(46966006)(36840700001)(5660300002)(7416002)(8936002)(44832011)(70586007)(70206006)(2906002)(8676002)(4326008)(54906003)(110136005)(316002)(478600001)(34020700004)(47076005)(6666004)(36860700001)(6506007)(6512007)(1076003)(6486002)(36756003)(26005)(2616005)(41300700001)(40480700001)(82740400003)(86362001)(83380400001)(82310400005)(7596003)(356005)(40460700003)(186003)(7636003)(336012)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 19:16:23.3130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbdfe894-192e-476f-12d0-08db1e774668
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.81];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT046.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7557
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds serdes support to the LS1088ARDB. I have tested the QSGMII
ports as well as the two 10G ports. The SFP slot is now fully supported,
instead of being modeled as a fixed-link.

Linux hangs around when the serdes is initialized if the si5341 is
enabled with the in-tree driver, so I have modeled it as a two fixed
clocks instead. There are a few registers in the QIXIS FPGA which
control the SFP GPIOs; I have modeled them as discrete GPIO controllers
for now. I never saw the AQR105 interrupt fire; not sure what was going
on, but I have removed it to force polling.

To enable serdes support, the DPC needs to set the macs to
MAC_LINK_TYPE_BACKPLANE. All MACs using the same QSGMII should be
converted at once. Additionally, in order to change interface types, the
MC firmware must support DPAA2_MAC_FEATURE_PROTOCOL_CHANGE.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>

---

Changes in v10:
- Move serdes bindings to SoC dtsi
- Use "descriptions" instead of "bindings"
- Don't use /clocks
- Add missing gpio-controller properties

Changes in v9:
- Add fsl,unused-lanes-reserved to allow a gradual transition, depending
  on the mac link type.
- Remove unused clocks
- Fix some phy mode node names
- phy-type -> fsl,phy

Changes in v8:
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

Changes in v4:
- Convert to new bindings

 .../boot/dts/freescale/fsl-ls1088a-rdb.dts    | 82 ++++++++++++++++++-
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
index ee8e932628d1..ede537b644e8 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
@@ -10,17 +10,55 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+
 #include "fsl-ls1088a.dtsi"
 
 / {
 	model = "LS1088A RDB Board";
 	compatible = "fsl,ls1088a-rdb", "fsl,ls1088a";
+
+	clk_100mhz: clock-100mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	clk_156mhz: clock-156mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <156250000>;
+	};
+
+	sfp_slot: sfp {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp_i2c>;
+		los-gpios = <&los_stat 5 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpios = <&los_stat 4 GPIO_ACTIVE_HIGH>;
+		tx-disable-gpios = <&brdcfg9 4 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&serdes1 {
+	clocks = <&clk_100mhz>, <&clk_156mhz>;
+	clock-names = "ref0", "ref1";
+	fsl,unused-lanes-reserved;
+	status = "okay";
+};
+
+&dpmac1 {
+	managed = "in-band-status";
+	pcs-handle = <&pcs1>;
+	phys = <&serdes1_C>;
+	sfp = <&sfp_slot>;
 };
 
 &dpmac2 {
 	phy-handle = <&mdio2_aquantia_phy>;
 	phy-connection-type = "10gbase-r";
+	managed = "in-band-status";
 	pcs-handle = <&pcs2>;
+	phys = <&serdes1_D>;
 };
 
 &dpmac3 {
@@ -28,6 +66,7 @@ &dpmac3 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_0>;
+	phys = <&serdes1_A>;
 };
 
 &dpmac4 {
@@ -35,6 +74,7 @@ &dpmac4 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_1>;
+	phys = <&serdes1_A>;
 };
 
 &dpmac5 {
@@ -42,6 +82,7 @@ &dpmac5 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_2>;
+	phys = <&serdes1_A>;
 };
 
 &dpmac6 {
@@ -49,6 +90,7 @@ &dpmac6 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_3>;
+	phys = <&serdes1_A>;
 };
 
 &dpmac7 {
@@ -56,6 +98,7 @@ &dpmac7 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_0>;
+	phys = <&serdes1_B>;
 };
 
 &dpmac8 {
@@ -63,6 +106,7 @@ &dpmac8 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_1>;
+	phys = <&serdes1_B>;
 };
 
 &dpmac9 {
@@ -70,6 +114,7 @@ &dpmac9 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_2>;
+	phys = <&serdes1_B>;
 };
 
 &dpmac10 {
@@ -77,6 +122,7 @@ &dpmac10 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_3>;
+	phys = <&serdes1_B>;
 };
 
 &emdio1 {
@@ -128,7 +174,6 @@ &emdio2 {
 
 	mdio2_aquantia_phy: ethernet-phy@0 {
 		compatible = "ethernet-phy-ieee802.3-c45";
-		interrupts-extended = <&extirq 2 IRQ_TYPE_LEVEL_LOW>;
 		reg = <0x0>;
 	};
 };
@@ -171,6 +216,12 @@ rtc@51 {
 				interrupts-extended = <&extirq 0 IRQ_TYPE_LEVEL_LOW>;
 			};
 		};
+
+		sfp_i2c: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x6>;
+		};
 	};
 };
 
@@ -185,8 +236,31 @@ nand@0,0 {
 	};
 
 	fpga: board-control@2,0 {
-		compatible = "fsl,ls1088ardb-fpga", "fsl,fpga-qixis";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "fsl,ls1088ardb-fpga", "fsl,fpga-qixis",
+			     "simple-bus";
 		reg = <0x2 0x0 0x0000100>;
+		ranges = <0x0 0x2 0x0 0x0000100>;
+
+		los_stat: gpio-controller@1d {
+			#gpio-cells = <2>;
+			compatible = "fsl,fpga-qixis-los-stat",
+				     "ni,169445-nand-gpio";
+			reg = <0x1d 0x1>;
+			reg-names = "dat";
+			gpio-controller;
+			no-output;
+		};
+
+		brdcfg9: gpio-controller@59 {
+			#gpio-cells = <2>;
+			compatible = "fsl,fpga-qixis-brdcfg9",
+				     "ni,169445-nand-gpio";
+			reg = <0x59 0x1>;
+			reg-names = "dat";
+			gpio-controller;
+		};
 	};
 };
 
@@ -203,6 +277,10 @@ &esdhc {
 	status = "okay";
 };
 
+&pcs_mdio1 {
+	status = "okay";
+};
+
 &pcs_mdio2 {
 	status = "okay";
 };
-- 
2.35.1.1320.gc452695387.dirty

