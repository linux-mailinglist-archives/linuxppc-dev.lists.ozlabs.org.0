Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC3761016C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 21:18:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MywSR6q5Bz3dvB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 06:18:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=OsLJPF5Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.46; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=OsLJPF5Y;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MywKD4CrFz3cBX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 06:12:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YI5yLOUbHmbMRUl0X7ipsqgZjUhYDDCwu0D4KURzXj71c0MtNSW0qsShfRcuCaJSOuOTN7LipEo5fuhmgBcaJZFs/9lrUTFTi1nLPoauNBapbKPSjNtyShu1diWu6xewWZ/0fhrCNjcS7ZQhr5+LBtkKCWZJzkjTxZDrRokzfDmMa0UVKyYYJiq3JogdXqDmmEGtYMr9ym97q+dfGZYGuzJk485nxfW/LnORWPMq+uo5YsQpsjSaaIIO727uapW8CLT79YVzvbGojgLjps7+YSQ+KtgBnvdSg52tyFOFCbkbGFtDegTEfWMprbvnYBmssqOl5kavcpYrMbGhYwgcaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfKRLCkOnut2UMtJ1c3REsws88CvoWWuf0yaWQN/++c=;
 b=lPZxuX7yTB9i9prk0R5NztV5l1RLFqgNTMBO6XnVIzKoRMZGF2Q4DRr4yR85/iFmtudhqtcDLnGV8S3Zlz+zOvu+VwtgloYftSETOdp5EQTRpRNMP7si/v2Wkn8sRKFOQjK+QADzezTES+4LKUURIEWyDCYXfHJ3ZkIIGz5mTfKhAUx9ehDg1MmMhGHjjoPaxfkHqKb1lcRU2d3UTf9btWY/87THW6f8Rlqb3uUMGrTbVsQf3A/qcsLWKHB0heG1h9gfQFuEFv0HGx4wZkcujGPi3qv7WYjITbqDwMTDS5RmPI2GTlzkd6xJXiyCdBhSIM6ygjtV5JQPBnz3YRsbtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfKRLCkOnut2UMtJ1c3REsws88CvoWWuf0yaWQN/++c=;
 b=OsLJPF5YZgdGrbM0oD9/zVsj5HxCAhyy1w/6yEQ3E1MdCFH1HNswL3k+nb4gjZtiyhP42pfEOcR6QINspEtczyUTv0Gc+7kDD7GxWYfm24enMeEVZdY3rybbeJRtJFsHKyo0vxViEf0bbeP3Pqhhx68WLycZtbT5UAS/lIBxoccHfVhDRkBUoGtjDAqbZES65C7QuRpP/KuhbaSun727P34dUcnZOoO7Az93ln3qmevCDOajgXZjlzO467Vj4Bc0CRLlKhSXPPaL553MGVDvtkEC2O2kyC0T8CoSuNeaN3Zhw7rqTQatK7TFA7LvQb/Dj5S8ZaCzRhpoyAQ0xhnnIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com (2603:10a6:803:c5::12)
 by AS2PR03MB9648.eurprd03.prod.outlook.com (2603:10a6:20b:5e8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 19:11:42 +0000
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::3d5c:1e59:4df8:975d]) by VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::3d5c:1e59:4df8:975d%6]) with mapi id 15.20.5769.014; Thu, 27 Oct 2022
 19:11:42 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v8 6/9] arm64: dts: ls1046ardb: Add serdes bindings
Date: Thu, 27 Oct 2022 15:11:10 -0400
Message-Id: <20221027191113.403712-7-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221027191113.403712-1-sean.anderson@seco.com>
References: <20221027191113.403712-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::13) To VI1PR03MB4973.eurprd03.prod.outlook.com
 (2603:10a6:803:c5::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR03MB4973:EE_|AS2PR03MB9648:EE_
X-MS-Office365-Filtering-Correlation-Id: dcc772a6-6069-4f99-cc65-08dab84f152b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	q7YRK0stDMv0lkX7jCbmekDx2TZo2kAewAs3lH2lqJdZc/YE43O7HM3jynPMM4CGVKgTkUv4NLwYwjB0R5kb3Dwr8cgbAhz80rp9mA9metkO5EhYSkEBoZH9we/NbU7dXsl9KYCFG0Tud/qBJXwMPkWufQ4L2D2u873P7O2Ps4tYYpo2MNmNq02pZ5QijnFRiXViAfdJxfBMxaFRRqy8y0jEbmKIbOcbTnaUItbkAR/IzVZtBMBs7+DAuEdcDhEcsLa58y2aVoeNz3gqtcpEd9+BolBclXFgOvmfCq5M+IWz1fHYQZkA8/dHcDvQZYqqyRwo7rtGD5j820xS9DWIO2NMB+NOz4NX4nnYdUj0KIXDr54rLREO3jHAH1njpMT7hEIPFKA7K/e3CGZWuXkFuTtFBRXWgCSnpQNFC0nauZyZy8vkOFbfBuwAM/drtfG07DvRu0KLV0x7BeesZROVCN00SdVwiuTeRZ0JEkSUKvLNgZ3jlOXwjNyEim/k2y22GANDmlcyC26SuHOdpfYQB8WEhQY46ofPED7VF5C1D7++gJlsHvXe1t73TGuuQOj+QLMv4wgTSAQZmtJGKZfxwl5Zg0xahW2Fw2WoDrLBec9pdDxUPqTN5LZh1rT71n53515Mg3c9msoWLTWcaR29Pdls+heaYuKNSQPz4Bl42GCS2epnuIY0sNwtLTwkjsv0XPG1gjoE7TTkqXweg83HeY8vnF8jxtwWihmQ1JNkFHu9huQELNRPlWJhfdKCjjdS5GBWsL6UqBLmlve5tBhNGyC5+C9r+Y5jqkwCmpXjPzEAjXd4uE/Q/Is4bjrG+6xb
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4973.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(366004)(396003)(376002)(346002)(136003)(451199015)(110136005)(478600001)(5660300002)(966005)(54906003)(83380400001)(38100700002)(6486002)(7416002)(2906002)(44832011)(36756003)(66556008)(66946007)(8676002)(41300700001)(66476007)(316002)(4326008)(8936002)(6512007)(1076003)(186003)(2616005)(6666004)(86362001)(38350700002)(26005)(52116002)(6506007)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?x30kKA6wgoyy9VQO/0W+85MbJgcA1BeAZ/7PqanqMWqkbeqpN+LdYN64kjcp?=
 =?us-ascii?Q?L0SYy9f7VQAkc4dttXNXFRaInks4sZGIzbrzRam4tHM6WQNJSvUsDYVtG79z?=
 =?us-ascii?Q?zJwBzyE//CspExCekALhmVf9j4+B1AE56IJgCnSxJXmRo1qATltMU15Ap3v4?=
 =?us-ascii?Q?cUXaI74TLaL0WTdrcrge56aNoZ0kKQoZBKCLQnYGr5QPmMyI5N8iRmxIQTT8?=
 =?us-ascii?Q?h2FNAAX1c1ZHqqvI1TiUaf/vrRgy2EnwxiTmrwN9VjbFd1PgCx2knE6gpvsi?=
 =?us-ascii?Q?gWcASGcK6sNoUnce1puyL8LjHrwPkD9tRXObEFBFsde0Vqtr1AORFqbjsZh8?=
 =?us-ascii?Q?uxKlEajjhhElmHoM5hS5N5gEqyKi5trOhlrT6EU1JQvGnqdxO5nTyE6Mo1KO?=
 =?us-ascii?Q?EUqOEZPeNSbcGUlcYtwRVipLMC7J+aYK7YTcSJcMJGmdIXjtLnVqPktD3zcw?=
 =?us-ascii?Q?gtaDFHhp7C2elPNgcE95f1rfXPGj7T4J1XUfjkTxMMdrksaNVeuw3TcZa4wS?=
 =?us-ascii?Q?4xmift0AFtJSOs4yS3uzYtv5ISEPMcvC6z2+KSIT/WyuXLjQ/a6bmjoc1Wz4?=
 =?us-ascii?Q?6q4LrZ7Kj+rsUmyMhwNboyUcukPiSR7T2cc5o7iMXAthAd9BWiNT2x7rut7z?=
 =?us-ascii?Q?ExJKt3CylW2qM5gocrim/Jsjbmcmfh6NNdKlz9hpXzlqNP4uUwHawDuaDm1H?=
 =?us-ascii?Q?cbNio1m8Ap5fmeI0Swz8k3y62EQpB/NyzyW2SejohXbX6cqDkYuHHeVXHb73?=
 =?us-ascii?Q?z1NlYYIthcPnTdWRKOFmQrDH3t376D4c9B3ft87FzdtjpGtF3p0ibKUDQNSh?=
 =?us-ascii?Q?H/0PVFlCR20ijOpfDa8traNmL2Ro419VSiffi3ZQAeAxbk9JXarwGhTUzGDa?=
 =?us-ascii?Q?N0j2hPKo7ltzJga3YDjClV43U0JpdBG7BsSr+hpEtqmlVK5OE0/6Ww1RchDq?=
 =?us-ascii?Q?E+QpQFiob32Mso9BKM0QBl5220LpZH1HrQgYshdN052TTHLqftjRmnljVEbo?=
 =?us-ascii?Q?hGnPz2Cc3mUkIAi2blu7LC7DRgnoxLgB1RmLHO042F/YiYrX3X/23hxihnXI?=
 =?us-ascii?Q?qiLJwiR/MoARHZSEKh54GESD6iSY5ksLTQgdv0gJosRqcCw20QBGSOq2v5Ik?=
 =?us-ascii?Q?aHn1HEWKiChIr+SihfabTSnmBSDAGeYKPjiv3Xi7nxpgn4gUvkPDcjStlQ2z?=
 =?us-ascii?Q?tL8nFGDNU5sBBxPKsk2v8pgIZXWiweZJriy8D9ieiXKHA81LD7vrKPhJY7BC?=
 =?us-ascii?Q?tGOv9Jxk6Z7C0vRaW6yGDuCkggngTgvjVwNo/vbL98VpKu+pr0dIMBvUn15A?=
 =?us-ascii?Q?HXPa4Dx77irV7JeNDslOsPqS3mqdcHK2dndXYTOhFfZ0iYOVDkOEhbSz96zh?=
 =?us-ascii?Q?lZwz9v5A/Yw8nsvxY07APsQx2nBXMScXDHeqONOS1Vmf8eFZVLK3YatTjC7j?=
 =?us-ascii?Q?1B5BilEwZMnJhblNCDidij7WEtvfDGL7aXKepMPB2IgVGv36LZ+EjrvP9Mto?=
 =?us-ascii?Q?QBBu39BZ3qBfRHz5PNpskhv0SwtCMQfiC14G+of65F/jSns3RRm1tbBxOAZP?=
 =?us-ascii?Q?mGyBQnDjs4S/WlqYZ4iJRh8W4wJID7Ka6rNXoYhGzxGdbR/eKhn5rLZrWXVh?=
 =?us-ascii?Q?hg=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc772a6-6069-4f99-cc65-08dab84f152b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4973.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 19:11:42.6278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTfBVr9Ic7jejHPpl4BGMoD0fdUyyohc3ttQnNec9Flj1fihWH6kSocKJ9dnaSVn0EJnVT0RfRSYRRy3zOmYYA==
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
Cc: devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds appropriate bindings for the macs which use the SerDes. The
156.25MHz fixed clock is a crystal. The 100MHz clocks (there are
actually 3) come from a Renesas 6V49205B at address 69 on i2c0. There is
no driver for this device (and as far as I know all you can do with the
100MHz clocks is gate them), so I have chosen to model it as a single
fixed clock.

Note: the SerDes1 lane numbering for the LS1046A is *reversed*.
This means that Lane A (what the driver thinks is lane 0) uses pins
SD1_TX3_P/N.

Because this will break ethernet if the serdes is not enabled, enable
the serdes driver by default on Layerscape.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---
This depends on [1].

[1] https://lore.kernel.org/netdev/20220804194705.459670-4-sean.anderson@seco.com/

Changes in v8:
- Rename serdes phy handles to use _A, _B, etc. instead of _0, _1, etc.
  This should help remind readers that the numbering corresponds to the
  physical layout of the registers, and not the lane (pin) number.

Changes in v6:
- XGI.9 -> XFI.9

Changes in v4:
- Convert to new bindings

 .../boot/dts/freescale/fsl-ls1046a-rdb.dts    | 112 ++++++++++++++++++
 drivers/phy/freescale/Kconfig                 |   1 +
 2 files changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
index 7025aad8ae89..50bc310ac31d 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
@@ -10,6 +10,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/phy/phy.h>
+
 #include "fsl-ls1046a.dtsi"
 
 / {
@@ -26,8 +28,110 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	clocks {
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
 };
 
+&serdes1 {
+	clocks = <&clk_100mhz>, <&clk_156mhz>;
+	clock-names = "ref0", "ref1";
+	status = "okay";
+
+	/*
+	 * XXX: Lane A uses pins SD1_RX3_P/N! That is, the lane numbers and pin
+	 * numbers are _reversed_. In addition, the PCCR documentation is
+	 * _inconsistent_ in its usage of these terms!
+	 *
+	 * PCCR "Lane 0" refers to...
+	 * ==== =====================
+	 *    0 Lane A
+	 *    2 Lane A
+	 *    8 Lane A
+	 *    9 Lane A
+	 *    B Lane D!
+	 */
+	serdes1_A: phy@0 {
+		#phy-cells = <0>;
+		reg = <0>;
+
+		/* SGMII.6 */
+		sgmii-0 {
+			fsl,pccr = <0x8>;
+			fsl,index = <0>;
+			fsl,cfg = <0x1>;
+			phy-type = <PHY_TYPE_SGMII>;
+		};
+	};
+
+	serdes1_B: phy@1 {
+		#phy-cells = <0>;
+		reg = <1>;
+
+		/* SGMII.5 */
+		sgmii-1 {
+			fsl,pccr = <0x8>;
+			fsl,index = <1>;
+			fsl,cfg = <0x1>;
+			phy-type = <PHY_TYPE_2500BASEX>;
+		};
+	};
+
+	serdes1_C: phy@2 {
+		#phy-cells = <0>;
+		reg = <2>;
+
+		/* SGMII.10 */
+		sgmii-2 {
+			fsl,pccr = <0x8>;
+			fsl,index = <2>;
+			fsl,cfg = <0x1>;
+			phy-type = <PHY_TYPE_2500BASEX>;
+		};
+
+		/* XFI.10 */
+		xfi-0 {
+			fsl,pccr = <0xb>;
+			fsl,index = <0>;
+			fsl,cfg = <0x2>;
+			phy-type = <PHY_TYPE_10GBASER>;
+		};
+	};
+
+	serdes1_D: phy@3 {
+		#phy-cells = <0>;
+		reg = <3>;
+
+		/* SGMII.9 */
+		sgmii-3 {
+			fsl,pccr = <0x8>;
+			fsl,index = <3>;
+			fsl,cfg = <0x1>;
+			phy-type = <PHY_TYPE_2500BASEX>;
+		};
+
+		/* XFI.9 */
+		xfi-9 {
+			fsl,pccr = <0xb>;
+			fsl,index = <1>;
+			fsl,cfg = <0x1>;
+			phy-type = <PHY_TYPE_10GBASER>;
+		};
+	};
+};
+
+
 &duart0 {
 	status = "okay";
 };
@@ -140,21 +244,29 @@ ethernet@e6000 {
 	ethernet@e8000 {
 		phy-handle = <&sgmii_phy1>;
 		phy-connection-type = "sgmii";
+		phys = <&serdes1_B>;
+		phy-names = "serdes";
 	};
 
 	ethernet@ea000 {
 		phy-handle = <&sgmii_phy2>;
 		phy-connection-type = "sgmii";
+		phys = <&serdes1_A>;
+		phy-names = "serdes";
 	};
 
 	ethernet@f0000 { /* 10GEC1 */
 		phy-handle = <&aqr106_phy>;
 		phy-connection-type = "xgmii";
+		phys = <&serdes1_D>;
+		phy-names = "serdes";
 	};
 
 	ethernet@f2000 { /* 10GEC2 */
 		fixed-link = <0 1 1000 0 0>;
 		phy-connection-type = "xgmii";
+		phys = <&serdes1_C>;
+		phy-names = "serdes";
 	};
 
 	mdio@fc000 {
diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index a6ccccf9e39b..bcecbea72d31 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -54,6 +54,7 @@ config PHY_FSL_LYNX_10G
 	depends on ARCH_LAYERSCAPE || PPC || COMPILE_TEST
 	select GENERIC_PHY
 	select REGMAP_MMIO
+	default y if ARCH_LAYERSCAPE
 	help
 	  This adds support for the Lynx "SerDes" devices found on various QorIQ
 	  SoCs. There may be up to four SerDes devices on each SoC, and each
-- 
2.35.1.1320.gc452695387.dirty

