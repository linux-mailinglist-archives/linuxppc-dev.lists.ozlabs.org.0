Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF74603696
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 01:19:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsVDP1FW4z3dtG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 10:19:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=qaw2t0wL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.8.75; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=qaw2t0wL;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80075.outbound.protection.outlook.com [40.107.8.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsV472n8Bz2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Oct 2022 10:11:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/yoBNuCdHKzCHftVbvxuLHPp84b8DgECp/gqlzhBIAAs0pN2V8Bs0XNX+RshH7WsI7+Twd3VfHuF4Bz0Pym4JGHHdK+AGarOmAhcPswf1iXWP0zB3zPGNGbu8/iN2FX0D3dAr/6Gf2Cd+N03F099FsoFQdB26jSY+slu8RTHdehBzY7H/zIBrFaPahVAjF4ca/5DdLPj/x30gtkGhS24HiPodSO6yyiFGtXwwAVHc6Lp+QoQgUEvbxYP/L2z/LCew13B+Nm4Kn0bxaiQ4W7rPAUAK9AKijE3iKZe3lmiRnxQPWLeepB23LwfEIje1pEZsVOAF5a8pLxlEJHBtkH7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkYKwvMqL99mlQrVS3hHZ3x4LOcthYYfh12oDwFTxYE=;
 b=fw/3x36FZ1vB1/flDcKNT6yJwRSXZ3R7LfB8PmJ+JUGV6Zjl7ZkY/ef+SIEc1MwQoNKd8syt2eNa6stOg7o2JBC6SaAbu2gcvqp2gry40okPHuCEv8tl+ytPZVjHlM57DeQ0qS5mNMAyPPOR7fu0nLLNRFaBxzRdINhx4SEFjfULATrejIIwYhldvl0UJEzJraqclCXORhaXCXVexUKimSGTFXj9eOHOrC8PDlGT7Fmb62QxLSXD7MqaZkvdDRjC3b/NWMNPGP4iTn0qAjGMeYeaOiRbcbLNX5w+tHRxoc1mOSCDl6sMRHZR7iCr9/xh7TNtgE6616IWw0/cvF0u5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkYKwvMqL99mlQrVS3hHZ3x4LOcthYYfh12oDwFTxYE=;
 b=qaw2t0wLbWj5Fsw8uBo9xrHwR8tdoMgUJX7wEnyAENvSKJfJcmiXv3Ra0JV8YghK4ZHptOU1gdrnnmn7u0fevmKw269UlllBZYqOzwFb8tDtqETTXpDoIQcH8UyFYiaQSTjlzXCLkusj4NCKCBs+B/7IvQOuysSYGUIEaOrFhHLkSHmOz3BF95RjjWRJajV8S6HnaQqJt5tHoQ2fEnnvG/JVEgczPQvXlpGAjFp80i0TmnuMPeVkYHJOH7bTY3tnNIiTrmhnlxJtk9dg57mbZ+6mXa4eVzb8zPeHpgVCeo2IebidPlQ1KrEuwznsIh4pH8Uw52VVpUZ5ZXgMKAR84Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by DBAPR03MB6421.eurprd03.prod.outlook.com (2603:10a6:10:198::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Tue, 18 Oct
 2022 23:11:37 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5723.034; Tue, 18 Oct 2022
 23:11:37 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v7 8/8] [WIP] arm64: dts: ls1088ardb: Add serdes bindings
Date: Tue, 18 Oct 2022 19:11:12 -0400
Message-Id: <20221018231112.2142074-9-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221018231112.2142074-1-sean.anderson@seco.com>
References: <20221018231112.2142074-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0007.namprd18.prod.outlook.com
 (2603:10b6:208:23c::12) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|DBAPR03MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a2cd09a-579b-4e41-611d-08dab15e1b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	JaJ3M6FayGY9xZ77eh/rM/Y06uho5XRlyp+Qwtzkg3BaeCvXkX1iwgmByYBADYcS8hDLSzpAxsj3YS8c5G0dQhIlSHhVWbRjOsHalDKLCn3ZDPTAbk3RQBcLosIgOZNuuyX9AgkQbHJuwv44qYapTtNR+anWMpta4pDJ9nhdNeXzcNaimf7c2+XU4o4m8zRPYbzMTiiOZNOKh3VHRewyYc9smFHk7Je6sVYDSaupvmOaLja4T+1Ag09bFIOOeMDEO1Kp9rnHYKKAl0RTg4nTgZHXAZtU86cWwcDkqJH/8bY+cdP3eMaunJLww98gSBDQxQXKBNLrlVBe4vO1q+nEqTRhTgSg/Xm0iQhvqClhGsw1spF/p/9vhM3A3UVFl2QDwmxTDvCusNTT9UFZ/MtgWo2fWWQVuH/IOzuLD4UgqvUnQj3xMVOX+dqdm0Yc1eETodUHFlzhQknXhMAdiZspiPw4wtpovn0hGunPnYPxoH0AyOfutIdb3ln+xL5W4qg9oVMDdNdDZJqbReag+EQh6IJkbHL7rGV8naLI65bHdgAfOjgW5gPY0bjmFdRFILp12WDM9MTgcBIyjwmmfHbN7R3pQPKOOj0FonMWCFZvx5ImtuhxG35k7Vq658t6JEQg+M+AnyJ/GyM2FurzSooTZn2imY6iG5IMAkKsY6hPlQQ1j4U+DYPSG9BqoxQkzhz1XVMLzzu5KZtH4XUtYUVfgEOKxgwvutzF5r1oEBQl4R9zv5Pr/4sD5FRxA/oe4bkd
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(396003)(366004)(39840400004)(451199015)(6506007)(6512007)(110136005)(26005)(86362001)(66476007)(8676002)(38350700002)(7416002)(5660300002)(36756003)(44832011)(2906002)(8936002)(4326008)(66556008)(38100700002)(41300700001)(66946007)(83380400001)(316002)(1076003)(52116002)(6486002)(2616005)(186003)(478600001)(54906003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?98trJZPTKZ3Dmcsu4HtT7uwnMdlrgCb+WZPLUJwgkHy5geKm7IUSe4WTw74A?=
 =?us-ascii?Q?Et2Esor6Gg19jL4EZQo5lncOZYGmly0MP8yHhSwir9jHK7farvJM7tmEe9kj?=
 =?us-ascii?Q?WVh7KV9gReByQqZB+o6xmQQBTF/vg+lmn1gXU3AHx/PuWqrvyHBdgkgUJ4yX?=
 =?us-ascii?Q?K8CSQTZErqpURcve50hVSeMIyfbl5aK1F2h12pmsebS0y6uAsDCk5Y/bk8ia?=
 =?us-ascii?Q?N2rxkxlyRxOoCvR7EwH3RFk1U89iGUm756HB4HOHdzgrh6uQM27NGcggZv+3?=
 =?us-ascii?Q?Lp0oQdu2v0H/DTjQ5EozGWfIcpiK0557ax0G/hoYRaq/b0cJTYq65E20T+qY?=
 =?us-ascii?Q?L0ZxoAI2+OIrxp8zLq7P7mtmKAe9BMiHIehrlCI3q3wTHO1a3TYjAO5NZD7u?=
 =?us-ascii?Q?Qi35RyMQptQzXM9cW0JWDNFU1LXcPAi/tIwD6SbwJ/JCZCS9hYzW9NGczDEB?=
 =?us-ascii?Q?83LXbWh2FBtB6aGaBBG5hVhFV8L/uMCUJ2smsjEnBmPZKjm0w/XRpNrDLtji?=
 =?us-ascii?Q?Vfczp9Avgd6v+u6OSEGYLZIjtjgQ730dlnIPahzQvqfdUuumqbGrY0obDhvP?=
 =?us-ascii?Q?VSpByL7EGbIXOBHKbgip4PYISTqOTalP35X6uIGP9QqWNhPKx429bja7U3U8?=
 =?us-ascii?Q?ucG55192xyy1gKQLOtQkLpQY9MJdV45GmC3WUanxqWnu8vLCL1W3QLxubj+D?=
 =?us-ascii?Q?PTPGSZtwMJ+9cqiUHSRmgsBw763nbmQECi4y3TmFAoh25TlWHedoZkrUy/dJ?=
 =?us-ascii?Q?BGkU0V9eqCX1UIne7Z8HuEwTxrIgwA1/JbLopAKgd6y2wrvA66tVs3w6ky6U?=
 =?us-ascii?Q?ARe2QDrUGJFl17hthUYr7fm3iHWeFj/0e4Xqjagalxccd5+xcJuRYxQCwDXz?=
 =?us-ascii?Q?BlBNibNBkC9UNpbLV18/n3qvcT1b5wS4Zbp1XDYn3HF0qdG4AUWlXNNW2Kff?=
 =?us-ascii?Q?8LBBT0LHk17FbdvCh9DYRXCMuO0g/bSS5cws8J9HWdoNris4+Vq3+n3SmvFk?=
 =?us-ascii?Q?GHw2wXexbhA9ljrO7CPKeB++cEuATxQWQfYo5wnNw6zCHwJF5Mku0a/h4dm5?=
 =?us-ascii?Q?o0w6sW9/Xj5rapLQs6n/o32hpiI0dnW/Xu7HxSRUKwHL+cjArGmWrRIIVUfs?=
 =?us-ascii?Q?KSxhnqXMoRuuWYyxR65jEuBMtmVKv1yo5ZozofWU/IIL2OVWzkdlwWEOpXj9?=
 =?us-ascii?Q?xBdh8Ha9DLuw3CIPI+myQBBbmjjZHUMfvFlbZmmvcQdw6l026Z+9pAZKO7bl?=
 =?us-ascii?Q?Ki8V5Jtvtl3qCcc+t/VTVT+xXcGd9vpzqsFWisTFfYUDgJuXVcZbeBzFlbLb?=
 =?us-ascii?Q?+fV9UTnx5+3nEWCMrOPjc5bIJhZdRTQ0gQl+q/qzuFkgDHzCAV7G57l0/Zdw?=
 =?us-ascii?Q?Tci8BxW0CH0T+kNi7DdZQJW1vC5pMrBqwa5FozV064CKuSNxeDMbU52xTcR8?=
 =?us-ascii?Q?1ocsR9Ac8FGxIPDORlSk7BI7GuXfY/SZbBEzRpPTIck59QTGlj5Ova+YaC7W?=
 =?us-ascii?Q?0Qwmaq6QMHo5zHh8dswmBeJnGYkW0PNhCm1akzuTnGPQtyoOv3S5tEiOGi1q?=
 =?us-ascii?Q?TDWOEUgJhKiGt6RehNiBYIfdY7GTnPjJm9hL2NV1KRm44tlCBm5c6KhVRLYs?=
 =?us-ascii?Q?mQ=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2cd09a-579b-4e41-611d-08dab15e1b4b
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 23:11:37.1032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9AAmZlzBIr4fRD1u3LB8tcJcufu+kW0L2nsTozSc9YyWUiddYwxQBc8ypAkjn45sMi8OIiDIg3lzyrTHMcDDJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6421
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a first stab at adding serdes support on the LS1088A. Linux
hangs around when the serdes is initialized if the si5341 is enabled, so
it's commented out. The MC firmware needs to be fairly new (it must
support DPAA2_MAC_FEATURE_PROTOCOL_CHANGE), and the DPC needs to set the
macs to MAC_LINK_TYPE_BACKPLANE. For this reason, I think this will be
difficult to do in a backwards-compatible manner. I have not finished
testing this, but hopefully it can be a good starting point.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>

---

(no changes since v4)

Changes in v4:
- Convert to new bindings

 .../boot/dts/freescale/fsl-ls1088a-rdb.dts    | 161 ++++++++++++++++++
 1 file changed, 161 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
index 1bfbce69cc8b..5c502048d887 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
@@ -10,17 +10,138 @@
 
 /dts-v1/;
 
+#include <dt-bindings/phy/phy.h>
+
 #include "fsl-ls1088a.dtsi"
 
 / {
 	model = "LS1088A RDB Board";
 	compatible = "fsl,ls1088a-rdb", "fsl,ls1088a";
+
+	clocks {
+		si5341_xtal: clock-48mhz {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <48000000>;
+		};
+
+		clk_100mhz: clock-100mhz {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <100000000>;
+		};
+
+		clk_156mhz: clock-156mhz {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <156250000>;
+		};
+	};
+
+	ovdd: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "ovdd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	dvdd: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "dvdd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+};
+
+&serdes1 {
+	//clocks = <&si5341 0 8>, <&si5341 0 9>;
+	clocks = <&clk_100mhz>, <&clk_156mhz>;
+	clock-names = "ref0", "ref1";
+	status = "okay";
+
+	serdes1_0: phy@0 {
+		#phy-cells = <0>;
+		reg = <0>;
+
+		/* SG2 */
+		sgmii-3 {
+			fsl,pccr = <0x8>;
+			fsl,index = <3>;
+			fsl,cfg = <0x1>;
+			phy-type = <PHY_TYPE_2500BASEX>;
+		};
+
+		/* XFI2 */
+		xfi-1 {
+			fsl,pccr = <0xb>;
+			fsl,index = <1>;
+			fsl,cfg = <0x1>;
+			phy-type = <PHY_TYPE_10GBASER>;
+		};
+	};
+
+	serdes1_1: phy@1 {
+		#phy-cells = <0>;
+		reg = <1>;
+
+		/* SG1 */
+		sgmii-2 {
+			fsl,pccr = <0x8>;
+			fsl,index = <2>;
+			fsl,cfg = <0x1>;
+			phy-type = <PHY_TYPE_2500BASEX>;
+		};
+
+		/*
+		 * XFI2
+		 * Table 23-1 and section 23.5.16.4 disagree; this reflects the
+		 * table.
+		 */
+		xfi-0 {
+			fsl,pccr = <0xb>;
+			fsl,index = <0>;
+			fsl,cfg = <0x1>;
+			phy-type = <PHY_TYPE_10GBASER>;
+		};
+	};
+
+	serdes1_2: phy@2 {
+		#phy-cells = <0>;
+		reg = <2>;
+
+		/* QSGb */
+		qsgmii-1 {
+			fsl,pccr = <0x9>;
+			fsl,index = <1>;
+			fsl,cfg = <0x1>;
+			phy-type = <PHY_TYPE_QSGMII>;
+		};
+	};
+
+	serdes1_3: phy@2 {
+		#phy-cells = <0>;
+		reg = <2>;
+
+		/* QSGa */
+		qsgmii-0 {
+			fsl,pccr = <0x9>;
+			fsl,index = <0>;
+			fsl,cfg = <0x1>;
+			phy-type = <PHY_TYPE_QSGMII>;
+		};
+	};
+};
+
+&dpmac1 {
+	phys = <&serdes1_1>;
 };
 
 &dpmac2 {
 	phy-handle = <&mdio2_aquantia_phy>;
 	phy-connection-type = "10gbase-r";
 	pcs-handle = <&pcs2>;
+	phys = <&serdes1_0>;
 };
 
 &dpmac3 {
@@ -28,6 +149,7 @@ &dpmac3 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_0>;
+	phys = <&serdes1_3>;
 };
 
 &dpmac4 {
@@ -35,6 +157,7 @@ &dpmac4 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_1>;
+	phys = <&serdes1_3>;
 };
 
 &dpmac5 {
@@ -42,6 +165,7 @@ &dpmac5 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_2>;
+	phys = <&serdes1_3>;
 };
 
 &dpmac6 {
@@ -49,6 +173,7 @@ &dpmac6 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_3>;
+	phys = <&serdes1_3>;
 };
 
 &dpmac7 {
@@ -56,6 +181,7 @@ &dpmac7 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_0>;
+	phys = <&serdes1_2>;
 };
 
 &dpmac8 {
@@ -63,6 +189,7 @@ &dpmac8 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_1>;
+	phys = <&serdes1_2>;
 };
 
 &dpmac9 {
@@ -70,6 +197,7 @@ &dpmac9 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_2>;
+	phys = <&serdes1_2>;
 };
 
 &dpmac10 {
@@ -77,6 +205,7 @@ &dpmac10 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_3>;
+	phys = <&serdes1_2>;
 };
 
 &emdio1 {
@@ -142,6 +271,38 @@ i2c-switch@77 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1>;
+
+			si5341: clock-generator@74 {
+				#address-cells = <1>;
+				#clock-cells = <2>;
+				#size-cells = <0>;
+				compatible = "silabs,si5341";
+				reg = <0x74>;
+				clocks = <&si5341_xtal>;
+				clock-names = "xtal";
+				vdd-supply = <&ovdd>;
+				vdda-supply = <&dvdd>;
+				vddo8-supply = <&ovdd>;
+				vddo9-supply = <&ovdd>;
+				silabs,iovdd-33;
+				status = "disabled";
+
+				out@8 {
+					reg = <8>;
+					silabs,format = <1>;
+				};
+
+				out@9 {
+					reg = <9>;
+					silabs,format = <1>;
+				};
+			};
+		};
+
 		i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.35.1.1320.gc452695387.dirty

