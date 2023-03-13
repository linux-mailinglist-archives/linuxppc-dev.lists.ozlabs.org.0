Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E22A56B7D61
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 17:24:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb26z5Cm1z3cDG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 03:24:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=04XhyKPl;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=04XhyKPl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7e1b::30b; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=04XhyKPl;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=04XhyKPl;
	dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05hn2030b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::30b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb1sM5jCtz3cFd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 03:12:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRYpM7cadK4H2I/4/ZOEGk8tk3qrwrnoYUeGqpL3XbQ=;
 b=04XhyKPlx7ANiQDJekm3LRfMpZoISY/+rl0HnKk8rXGqgnG6s1ykMSfiXHYMnJ0BAXcfOACeUmKSZEeY9MLRsIx8t7HSZCxUth/JP+zFYsk6taxpn9LtbQ8rx/aGlOhADKVz+AeArDTukFVp18LIlSPDeLBeltpFdO/DEUp7/M5fhpI2SfHAZ5MNutrnOHuU3eK+z+IUZKeGpmfIxV8dLypFFhKBtA6ybRYge0UHOz00amOLXbTyV0U1RsFOMqBlUVx1EyOwzcYiSYruiSgaRdg6c9yCl4psg2iA5lm/f3vdYjryzXK/pFUhd+a+RAPhZXvGJUC2m9g7ppps/YgGcw==
Received: from DB6PR0301CA0039.eurprd03.prod.outlook.com (2603:10a6:4:3e::49)
 by PA4PR03MB7519.eurprd03.prod.outlook.com (2603:10a6:102:105::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:12:35 +0000
Received: from DB8EUR05FT064.eop-eur05.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::83) by DB6PR0301CA0039.outlook.office365.com
 (2603:10a6:4:3e::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Mon, 13 Mar 2023 16:12:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.85)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.85 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.85; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.85) by
 DB8EUR05FT064.mail.protection.outlook.com (10.233.239.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Mon, 13 Mar 2023 16:12:35 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id C59222008026E;
	Mon, 13 Mar 2023 16:12:34 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown [104.47.17.113])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 3ECA420080075;
	Mon, 13 Mar 2023 16:03:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0OmFVUb03nHR2DmYiFwR0s7dTs4EURqsoVTM7hDZTGtZQotBMMxCzTlmGT1nTojj/PQ2GddFYAAPhbCmO9WB6HzKqCLAVD/Ke2Hj0K3aaBLy//hE+6WNd7mASHOW/5FWpjxJ8wje4YK4fsiWwgI/+C7aihy6MUDQZ8HP1S4kdgr9CoIOLps+er8Xy2MyWkpYwjjmaJNDUZ7JqmRWvtecO4epUaFq8IKAnfCEkoRrffxEXyyL/TPps7fhaVwACLTZsR/dHM1eR/E6O7mB+XgM+Wy5uyEcdEdnTFC7GcdkuLef+GuKn9gZJBvMC3zaK/s0KShG22EWiLucpDAWqIY2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRYpM7cadK4H2I/4/ZOEGk8tk3qrwrnoYUeGqpL3XbQ=;
 b=acXCmq3AJ3+lz5jkzJSXAwXCEQ8dLtP+o55C7/Lbp+NkORBCKrN3nxlFGbtqobSPW3alRxsvL3kQPEFN6i/EwUfggQMfWUihh8Jly4RyBYFHZnyvAfI+eqmfPBsRbz46zl2rdrIniQrAvcxprHjjsBCe2dnyy5G3RBBh5/UoXx2aO2cnbZvxwNdUYOLp7mU7E7AxLJFsBAzC2PLMP7TQn4WhX8uWrqxjaiAVGUD4GIAs8aHtyDRpJzhy0K3zRM0YLSKGfuYlbXthdk543RIY+WsYofzNyXDTnhGHKbx+geg1IXBvrfSbZTyIvvzs82Em5Cu+RR071a17OUU3YM/n0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRYpM7cadK4H2I/4/ZOEGk8tk3qrwrnoYUeGqpL3XbQ=;
 b=04XhyKPlx7ANiQDJekm3LRfMpZoISY/+rl0HnKk8rXGqgnG6s1ykMSfiXHYMnJ0BAXcfOACeUmKSZEeY9MLRsIx8t7HSZCxUth/JP+zFYsk6taxpn9LtbQ8rx/aGlOhADKVz+AeArDTukFVp18LIlSPDeLBeltpFdO/DEUp7/M5fhpI2SfHAZ5MNutrnOHuU3eK+z+IUZKeGpmfIxV8dLypFFhKBtA6ybRYge0UHOz00amOLXbTyV0U1RsFOMqBlUVx1EyOwzcYiSYruiSgaRdg6c9yCl4psg2iA5lm/f3vdYjryzXK/pFUhd+a+RAPhZXvGJUC2m9g7ppps/YgGcw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB8PR03MB6300.eurprd03.prod.outlook.com (2603:10a6:10:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:12:28 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 16:12:28 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v11 13/13] arm64: dts: ls1088ardb: Add serdes descriptions
Date: Mon, 13 Mar 2023 12:11:37 -0400
Message-Id: <20230313161138.3598068-14-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230313161138.3598068-1-sean.anderson@seco.com>
References: <20230313161138.3598068-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::11) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DB8PR03MB6300:EE_|DB8EUR05FT064:EE_|PA4PR03MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: f399a035-6163-47ff-5149-08db23ddc1f9
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  5MFDZfYcEnRRuXbQQjSkYPiDMawvQk+rqP4VprqW0tg5TO01bQAVHuynJyRq9SXWxXxVeWdt4P1bGx8VTGq7Q/t48R2NXmVuOZBlYATeHJSr3Q9FJUGrShCySI76tgxRWRIIo3xvnj5aZhZsE2MaaRtKBM0Mth1GrGtEJICancj4d7zyY23be3iOuRBRdaFOgz4WEMk1/dYyEr3CPkeN8PWDafjxy6yXkFjTM2nbOz5ZcM9YaxqWdVKQruzYgiG3HxKykFFyrEPM1KC+6eypVoQcW4bGKu4mAw7WV6lMPPiODnKXIehz+GdHPJXjJKUwULlPgnPwtWQ9z4CTnOaxm/+LQaqeDTcH9YkApsAnn9MCqjbxKpderazQfKmKv0e7UXEvY+8eLjk8GA+jGrnLtIgPcAPWjXRRDRQapES6Usm5owtI68y9cnXApXYHpNyNexgEfUCXqrAlU0/5PUCBCvZSpEWec1e4zoZo5XecIijcegwGm7Tsh0XlHNGoeDOm62xTAbhUr2+ZYe9vhG9kfyjrr1OvdrGJI2JGGsSClL6VldniEPM61HZLGbNBcV55PjtLSlf0rPrS8naBpvSecvjvX6rvm6CiF8lqQ0lNoFRpjTRpe8Mkiucam2sNPBgruJhUUXQmQ3wMa8xMvevQ4xb/c947C6B9y1YaqLovg7HtXXaBjnnof4QoQ9b47uRd
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(39850400004)(366004)(346002)(376002)(451199018)(38100700002)(38350700002)(36756003)(86362001)(2906002)(7416002)(8936002)(4326008)(5660300002)(66556008)(8676002)(41300700001)(44832011)(66946007)(66476007)(2616005)(186003)(83380400001)(54906003)(1076003)(110136005)(316002)(6512007)(6506007)(26005)(6666004)(6486002)(478600001)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6300
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT064.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	9cee6072-3a10-4c70-a8c0-08db23ddbdf4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2zMCfrm/nQx5ZF+w9sCLisqtC+vC93dlty4ZP10UzyD8rx9XWUJKxW3mCT/eGtHFvtKLXmF81o6S2cvr9oOz8souoCVk7xsgUvMfDhK+MIYpX7G8FZAeeZlnHfjO8bV0JZWcdPaL0ZWV2/VOfL/iWh4+VZZw/UCuw0QCZcDNH7y80Nk0FRjRfxDawmR/p8IgQsHS8X1NC3z4jtfx8eXNA+e41SckqpRi8qrU+YMi8mR+2wssoHXnqNsFx2yARFE7VRG113tWsy3ylaMl0iDe6KtZ21Xh2Q35G4XsMdtWL/7+190rUErHjYrfwWbOXEpQVUsh/MeZGHkhzem7FJiS7THqrLOEG6/1SKUu29nscqx5vegR2YFfpom5OzSBHZ9v+pLUeODaSvtHF1ZdPFfFUKquPXPN8LliXcjk4J3RLYY84nTF1LsRGW2/ED7gHHjFBlaY9SDPSR18PjvL/QZ+DLyWGv0Ke2biYsuyaKpNM8gYn59+DGI2YjTV99vIrmPHTZu79xrMzvAlrkoXSkomvmmOkzuDsSyTKwylTuIwg24CX7j88FdFLOImtquubHQeAhCsVPjLp6WaaaT6mjkz+gbss5TUrM3tv9c+zii0F6SCOZKQvOmrjZ4NhYo2F+M/HVT+u5HI6UkjT6qfiTz9wqXDgKQQEe+0Id7MY6OMCvD1frCHFyzynOW05ewhdhr8X0wZbFZhQgB1DrJVEHGJ/WkHgzWHRsNbPsrDND5XrHD8plaW0fCxeF9EvdRQW7Iq
X-Forefront-Antispam-Report: 	CIP:20.160.56.85;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(376002)(136003)(39850400004)(346002)(396003)(451199018)(5400799012)(36840700001)(46966006)(40470700004)(2906002)(82740400003)(7596003)(7636003)(41300700001)(83380400001)(36756003)(44832011)(40460700003)(7416002)(5660300002)(8676002)(70586007)(8936002)(356005)(4326008)(70206006)(316002)(34020700004)(40480700001)(36860700001)(54906003)(86362001)(110136005)(82310400005)(478600001)(47076005)(186003)(336012)(2616005)(26005)(6666004)(6512007)(1076003)(6506007)(6486002)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 16:12:35.1206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f399a035-6163-47ff-5149-08db23ddc1f9
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.85];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT064.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7519
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
Cc: devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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

