Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D197C6C3BC0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 21:26:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ph3635H4Qz3fkZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 07:26:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YdUA4i88;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YdUA4i88;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7e1b::30c; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YdUA4i88;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YdUA4i88;
	dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05hn2030c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::30c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ph2rD4Y62z3chm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 07:14:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRYpM7cadK4H2I/4/ZOEGk8tk3qrwrnoYUeGqpL3XbQ=;
 b=YdUA4i88N9sgZ7IWl51qHo2s91aGudMlRfMOr5grCpWVQmEDRtjtI5egXUGbg+Du5JUZDC+LlTb1J5gKTqxVpXXsVZDz1yF0PBcrtIr0zdZ5Xqhcp8kukeRG0O1Bhm7vayrf4HyOLKD5q+kK04suE20a721eeULtIyhPYEAiINNrWDPZmbWTVLhkx3AbEzlVYD9FRknpiB8zMT+6vQf4h6pKaoC0eiqYaS4pGytp09IUviwvdjtkI8j1qongeiGHzObnVGES7bOQr71jJc332FdbP9KqrgDcMvKwX2/ndLPpS4DyeTiOaYKDA64THv1hSRW7xUpsGH/st4tw30rJ3w==
Received: from AS4P250CA0020.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::9)
 by DB9PR03MB7241.eurprd03.prod.outlook.com (2603:10a6:10:229::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:14:02 +0000
Received: from VI1EUR05FT003.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:5e3:cafe::f9) by AS4P250CA0020.outlook.office365.com
 (2603:10a6:20b:5e3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 20:14:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.86)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.86 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.86; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.86) by
 VI1EUR05FT003.mail.protection.outlook.com (10.233.243.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.16 via Frontend Transport; Tue, 21 Mar 2023 20:14:01 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 4A3CB2008026F;
	Tue, 21 Mar 2023 20:14:01 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (unknown [104.47.51.170])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id EDD812008006F;
	Tue, 21 Mar 2023 20:12:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GF6zeq3Nx8+zzddU118Hyv4e1K11griyzzHQvkuFZgKhLiS4byK2VJdXpjXencZ1fotimHTPjfmPyFl4ROPuGwPdCmeyquTeSuXqlC2eLU79CGrFUwJLC/OcoTgMQhE3UFhGL6fnZmGcCJFos7a3wpisdTgLlMDI0ko4qivyDo3D9uGemOT1KaS28Jnqf3Z3q6dhyJmpYK/OJCXESSwvXnVI2sc0gGGqKPiaWGx9GZa4CZItduL+MoOMYUdX++u2wV1NHaTi6hUQj6BmJXuHbFDiS4UgAXSadb3T3zqyYBG21SolUcvyQrf1ck/AxW1pHyhyGQZXF7/KV0NrGI3Upg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRYpM7cadK4H2I/4/ZOEGk8tk3qrwrnoYUeGqpL3XbQ=;
 b=CAIe10JPQMpD+nzKCVZIpA9dZc77B57tG6Ba00XS2beQdfkt9Bg53m4YneohZk9duaREfTYMgoFYa2qFtypPoCSdjco3xpK/pSZGb7jG9ztCqkmR8yy21+UENoOoSQvcu0AS8z92HlKoNVr6QZdwJaF+XC/rYMU81a6zN2FhtUYBsvBKDAq68WetrfmyM9Y78qSUhtA2/0JIav2IL9v+cYt4X/puh+jzxtU6gB+uC/LtTciAI+vzblChaM+ktNBZRBIXOmKPe4LZfGevs3GmVFg4AuL/+yGPqlG7P8E9FXphJ5OjgxQyV7+/L8hd6GEyktRwo2p3nFSoURDK4Uroew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRYpM7cadK4H2I/4/ZOEGk8tk3qrwrnoYUeGqpL3XbQ=;
 b=YdUA4i88N9sgZ7IWl51qHo2s91aGudMlRfMOr5grCpWVQmEDRtjtI5egXUGbg+Du5JUZDC+LlTb1J5gKTqxVpXXsVZDz1yF0PBcrtIr0zdZ5Xqhcp8kukeRG0O1Bhm7vayrf4HyOLKD5q+kK04suE20a721eeULtIyhPYEAiINNrWDPZmbWTVLhkx3AbEzlVYD9FRknpiB8zMT+6vQf4h6pKaoC0eiqYaS4pGytp09IUviwvdjtkI8j1qongeiGHzObnVGES7bOQr71jJc332FdbP9KqrgDcMvKwX2/ndLPpS4DyeTiOaYKDA64THv1hSRW7xUpsGH/st4tw30rJ3w==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM9PR03MB7044.eurprd03.prod.outlook.com (2603:10a6:20b:2d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:13:55 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 20:13:55 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v12 13/13] arm64: dts: ls1088ardb: Add serdes descriptions
Date: Tue, 21 Mar 2023 16:13:12 -0400
Message-Id: <20230321201313.2507539-14-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230321201313.2507539-1-sean.anderson@seco.com>
References: <20230321201313.2507539-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0026.namprd20.prod.outlook.com
 (2603:10b6:208:e8::39) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AM9PR03MB7044:EE_|VI1EUR05FT003:EE_|DB9PR03MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: c60176e9-440f-4f05-060e-08db2a48cfe1
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  sb1UBlLpI9TkHy/Styz/owwLydn7R+gVkfCKWc4TfQn6Z55pSiNxq5PA1QHM/hlKMUUr6FxSTvV6as7dLCHwZflmV9VCvVmRMp2tLhbsIeZ16yEovRnRLalQ5ne7C2OUuVVqK5/pKdi9xzSN18jlO90wScCzlodDjNtdK+iHf9yLRiggQ6quHVUnd8DmPQPV2IIWNYWt0xxj6dKeufTcb0Ygo/rAL7AZXIN955+SUxx5n1xyY2lH4MMBtNriByI6w2BGwlNvLgUYAQ/YxaAXAD+30jesz3ARrgdxYvWVFrhAdOFDV86qaIGR9gS4lJkmCINhxxmC9VTv4dsmDDWZMNR6bnVUzXiUkaqxPfbjJ6f11mhlVdQX7NwsiGrp+T7hwRLu187bJbjWcd20bH1egSqJP/LE7J6RZ6A1Uw7F+kT/Sq4llgaUeQ3YTK+iixBiFutvQdQLY2end/mMUm2KTDMMei0ZVKv8rLF9R5/4P3uDRpVVmGWN6yQW7ee6gPrV85e8mEfNVtU52FSHEHge0FdDExOpPibbwRup7F5+32a0O2Ng7MYLoxBsglwtSw11EDCcOnDYjCF0xMvv5So/e7GXfQgEyITPyjb9/6ONktYktp1+i5T67f4E++NVtdXs4cqN9hvhOzl39QIqDZnROz2lKRqkxPteqkGXkIE4eAPXy8CSx6s4yJU3igZSGknP
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199018)(2616005)(54906003)(83380400001)(6512007)(7416002)(6506007)(6486002)(478600001)(316002)(1076003)(26005)(52116002)(5660300002)(6666004)(186003)(110136005)(86362001)(38350700002)(38100700002)(66946007)(41300700001)(44832011)(2906002)(8936002)(66476007)(66556008)(8676002)(4326008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7044
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT003.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	bd5a262e-0c98-48d0-3c46-08db2a48cc3c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bQTzN80Aq0EmubICUkxgbYkHRV1u6QK1R2XKjhVL+RQF/bWuvvi0JjYjuMobxuQJl6IGC2rIAofLIlGqAlHpt38/dAC+XohWMg+QgY6cwUEWlCfb50kuqZKMuENiav48Nwpf1C1KMaJPAH2Fdra24sAAeYkLBRIYsLZ1OHkVigaTli+8L9Obffcxv21X3HcOOS9RnuoNrJWxORdsjG4mbhrjjMpks4KiKfbDVZ4fEK1/DW7bt/kt5p8amUNPUtBBiEVqQhCon7LV8o0XnhtsqvDpAfEsTyC6lyq4O6gx25U6WU4470wg9//CPbcr2SYwPrmrNSsbF6KEoZAAAN8/5r/1cbhbMOtLhCR6cFbWpAAIXE1cPbCYDDApJNuslGsEi8cKlZpyokUAy579ipMd9sKohG6ugmPGkQCVpNa+r++QsoeVeiro3y4p3kQkb19lQWiRsXeguEFNNnStvukkbTAPbl0j6SMBvzoPZ2CeYG1GNBbxV199bw77L43TTRGerHmnu0EdNo5/ovWokifD4bq8vMqIeYSQV5/8TCkpGiv/bLg9VUa5REx3eQgAMiKYY/XdJ191tMkuSfKx+cLjncO8pY3TRMl217jld2abmPxjh7kxy5D0VurFFqOi9eDy9oO7/ICrnEVulfyYrwxZNhVu1iFaLZXLB/6cYEuU9RJRTnw3dDjNPt0iezmpKPnmbmAeACFRXjr75giFMp4iU20YaYJyPKWx783KYclxXiYgxFZCNTsMCrv7HccDzHLB
X-Forefront-Antispam-Report: 	CIP:20.160.56.86;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(376002)(39860400002)(136003)(346002)(396003)(451199018)(5400799012)(36840700001)(46966006)(40470700004)(2616005)(6486002)(47076005)(186003)(4326008)(6666004)(478600001)(83380400001)(336012)(316002)(70586007)(110136005)(26005)(70206006)(8676002)(6506007)(1076003)(6512007)(54906003)(34070700002)(36860700001)(44832011)(41300700001)(5660300002)(8936002)(7416002)(40460700003)(7636003)(82740400003)(2906002)(7596003)(356005)(40480700001)(36756003)(86362001)(82310400005)(12100799024);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 20:14:01.5606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c60176e9-440f-4f05-060e-08db2a48cfe1
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.86];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT003.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7241
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

(no changes since v10)

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

