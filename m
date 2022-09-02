Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E49B5ABA4B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 23:42:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MKBGk1L7Dz3f4N
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 07:42:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=pKQ3Q0O7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.66; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=pKQ3Q0O7;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MKB980pMLz309f
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 07:38:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YvSKu8/pkCfSpR/BE+mCj1pDrtYJLNG886wo21c8w9UVfgN+Z31s3MFu96v8pD4g0xcCIUKTacF8kHQ/6Em1Bew4o5qdtIZlGlbLnvLNyUzO6jFe29XVkPG79rz0cIST9myk34O0/UfH3YIenTVHG993cV2GFg47yx7dKzBv+9ZKV4HavjsDZF7ljsNC4Epv5MrK7O6riP7Ukkd2t+PNk1C/9aLVT9wZyALTexj4ANrCeILd8sUjBAqp9UDhbpGDGNdykrrbia2fGD5J90FvhV7ByxRCPyyacv5jaZJ7Y6PWQ8R5rKDBmt6MyoR2PFEBRxGb4KYoRLxubEhHoKnqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EO8FEYCxF9t0qbgC8XKkD+DU+/BKhC6LjsvlJplyQjY=;
 b=lyOmhsANeDJTCSQenSut3mUlgwF4jSzJTdh/gsRtRujqUl7fDHSwfNTlle7DlCexnTM4+uhbIYQsHOq30qSNmHjogYTwdl4kFE0qIkIsmUv1pRGZ89CSu3d59GM7FWbHpdrhh7OuVNrOddUCX+KEEqUOa4eon78A1Fz8u/j0GT2VB/Rr6eilzkVF+0rmrlgXmisCsVxgu9pqtl+3JF8+jcjwl1XpU2ex1vD4mzRoJswLOYCQWshwx4CBAkg0bzhA+Px3VOtuE6mJw9h9XVMJKzdJyqIgB5n1lxLuX8ExaA9bmWu16hlVl1N4oCPixk7K1ugNO2b5cbaY0bUZV3rhUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EO8FEYCxF9t0qbgC8XKkD+DU+/BKhC6LjsvlJplyQjY=;
 b=pKQ3Q0O7jt2gtCgYg7IgbAEjbR+ianK4MljgRFheMnRZl8O4+MfCc9p18gK4yD1RWTSwL86oq/MYvacc1FVGzjUvmMAU6h/TGcwPXMfgERja2JM0UPivDDkpZz6QirhSWl5rxk9B5TpxtHAxFXjVVO+l3Ox+KAW4k1pw0rWOMDNQwwRJKzfcW+wTs7nxoe2aqFSeCgdWZqEzYIc7rtulPA6YJGrTIvTL9W7hRJftpsAdiwIoMt6/Ad/+RAeFXuKUmU191/Kr0gSqTNx9DXsWEl5OW6v9BA4qDjaI2BwUpQTAqQ41kkhG1E8z4dJ19PvIjdM8J+9wPaP3C5KdGmqdGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by PAXPR03MB7886.eurprd03.prod.outlook.com (2603:10a6:102:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Fri, 2 Sep
 2022 21:37:50 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5566.019; Fri, 2 Sep 2022
 21:37:50 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v5 7/8] arm64: dts: ls1046ardb: Add serdes bindings
Date: Fri,  2 Sep 2022 17:37:20 -0400
Message-Id: <20220902213721.946138-8-sean.anderson@seco.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8cced2be-c3e8-4d68-1e61-08da8d2b6277
X-MS-TrafficTypeDiagnostic: PAXPR03MB7886:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	gSqRSdAyPgQYOwFDmqCR/BgW64Ov8Zk67fTeUsOUFSQxv+xvMFrOrTFP4SKWcZB1ZcEvr0MSObiQLnV5JoF1T/CI8qw+VTy38VCddWzoKWp75ZwjQ8Ev91oJyrn4ZkOfmO3xBkAyMq/rqkEohEPbKK7jRd64lFu/POMP8lH8ZHYPzH8mqDrpz7DUhlQqJ8p3rKdEaUKVAIjvJMll+YGGdh4uRZQY/GMpEYKrnBokf9ydzg/knZPHchXRJ6YWaDHEAZiar+PNA2iILo5wnda0R8fY9DoFj7XxcCdkQBmgmMNtysybIFGfjTAr6T4qspdD48I1jhsDxEN9STygF+unsZW+EmSZSywYPWKl8Lh6z4aeoCqFTsFfTCAhfu0QWwgeBG6UMXTmkQsymQtYFffnzeRclFiB20VHsyFOutDv6upzHToHl0N9vy4SwTzAtwwmC6npZZ7y6663kf5xoTHAqZd16YXkjqGo8G/F6UcaxgxY7WTkdINEdw5s0QyGfvwy3ZDAfoSnmBCu+k49hMbjgpr5j2Bhay9CjdLmD6YjAuqH2ppx1muZZ+8wi8t797gQWPiRPOipIQlgzEuiRjAUjL78IsWcNhvBrjU0Pq9/gdjw8VIpavK4+hG8vcxsCfV+F14RUemS6qx+T8IArRVrlpa4py6Re5bOm5WwAXU8yEFIuhtaBKB691O2DXe7sAI6+pAdHj9RkOaFf+TRRFrMs7wR/avK3Gk8wM29j9Qp06wr1Qb0dzEGfoR9ZZdbO8M+AhYehFOh+X3I1U38aT3HlD6TIdUd3pzoozpPuaIoqdXFExVkQNNwbfGac2q1Bx65
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(366004)(376002)(39850400004)(110136005)(54906003)(38100700002)(316002)(36756003)(186003)(1076003)(38350700002)(2616005)(966005)(86362001)(6486002)(8676002)(4326008)(66946007)(66556008)(83380400001)(66476007)(2906002)(52116002)(6506007)(6512007)(26005)(8936002)(5660300002)(478600001)(6666004)(7416002)(41300700001)(44832011)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?wCPo6jFQMB5IXvolGAs33GvocBeXoTUX8ScKHKCWL9iuN7P1zIcvgwaZvBDA?=
 =?us-ascii?Q?C8rucvr349B/w3NXK48knQoblAoH8KaV0ys3fEwF24eo6U5BTCkfR2Izwbwk?=
 =?us-ascii?Q?lfPE+uscDVch3h0CEjgxfgyrxMcEmfE7aN7v1LuDSd/SOd2Gdh51JUR17Ea9?=
 =?us-ascii?Q?V+wxkgZi2kwQ604h/M6c2P5UtFRNGKsADpUhz/p04ztcTCF2+o2eT1qilriY?=
 =?us-ascii?Q?yUYa4O4nM51DVw1+Nvr95nQDrC2eSEztQzFKEu/um4+Kcmj7IqWbRqTWs1EC?=
 =?us-ascii?Q?mFi4QFtWwe04KClgZNs95Uq94tJRW3rPgbAUTYIme0wI2L4EGBTtwLzMPuqe?=
 =?us-ascii?Q?2A7blrxM9i1+W4YYzh6O0zO9TIuvYLPcQ3c2WJ8SNKkntl9BJw9t6zRYrU4x?=
 =?us-ascii?Q?aZ9yRKpzZG3MKwSRHJR4VqdEBjJcG+XQv+1mpT+qSShvdiNsBOYYMhM7qBhI?=
 =?us-ascii?Q?lZvlURPiMnrrjvnAwvFbnCChaJUVAQVDamcHtaSMyXCnV33U+j/wbZxdjYyd?=
 =?us-ascii?Q?foLoccPZZRfTBuHZNqwO8kQu7OUoPV1wJvm30D818IaUCS8e+jTZP5TMVBWc?=
 =?us-ascii?Q?k+KmfpHIAUuR7grn0g1I2PmE4rttCg6Imhazw+GbvUwfqeUbnoe6CSd5xQoX?=
 =?us-ascii?Q?MsZMcJVhRXZD3SgbKhsqWdbn/q/YvhIeQQGVmiDakb7JBnF+FRNBfb9KGiTN?=
 =?us-ascii?Q?pt/aN7GEd/JljEC9a0bdnstOzgXXoX5R380DGnIR/+8cXPE2E+xprvuck9e8?=
 =?us-ascii?Q?CYlM7U2CzDYNMebhF/kVjFqEcUKMmRp8RcQnSeHsvAfMR/FW28g54TvSnj3H?=
 =?us-ascii?Q?u1msF4lGIfdxYTEuLXEOJg8PSMeWb664phEgUGnWlrX/xlTZd86AM6vLwfkA?=
 =?us-ascii?Q?+zGTLNS4/oHgauaFNWpRm96n4uvel8+Msr65780+/ciyaBgZQdee6SQm6Ji9?=
 =?us-ascii?Q?/EEQlMFQq5AqUTI+IGTpvWC8pvzp3MLkBM+wo6OT5E5/REceC4cd9jViDlOs?=
 =?us-ascii?Q?kL8kpKxIZ1TcMVw5TC10u69EfRZ6J3C/U6xQusi1nzzY00msnAi+iRYRxdjC?=
 =?us-ascii?Q?xsAXiW5pt6ZwvpugA/a4/pPwGGQiK7dBnMLEPknRedojtsXUThNAol44UcDY?=
 =?us-ascii?Q?vvJUV5RsgAs+pWg3XoODcepZm4hRvzL+UaHAQgwb9FfhPdOJUnqMVj6NvOkm?=
 =?us-ascii?Q?8xaAJwll7CZhO8jS9vJoTlJjV5qKBufR8ovaNntnPRc20u5amsuPYrPXLYrn?=
 =?us-ascii?Q?OH+2RQlfcWlnR5xxJ/hxMmse4/JDFO0e3/ES6mUqyqyK4AMVmbeB5zh4R3zI?=
 =?us-ascii?Q?7thUU661GTE8tkuYVxTYWzQqDkKic6/XCJx8RP4780grUpVwcWnQWvrafJFF?=
 =?us-ascii?Q?iTpqyoId0lcwBGjqpNOp59fr71sFuMpzbL9wUxmCioV6NcXcfRzwbNMJ6sLU?=
 =?us-ascii?Q?n1lA8/7sZTlkOt95Chh/L7P1uWv01pMNglP7j5fy9bm2p/vhnnm1GAZk3Ldg?=
 =?us-ascii?Q?UIS9iy7zyZ6Ca9o0WnBtpbPYT8QTgcdPAERD2m1ypWbZevYP5DiOTM3L9WQh?=
 =?us-ascii?Q?pha5/S4PkL6O8CFGkQDA8OIPzFjuIPCPFj5yezvxYEHi3aBGAcFZbn/cQ82R?=
 =?us-ascii?Q?iw=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cced2be-c3e8-4d68-1e61-08da8d2b6277
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 21:37:50.2524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0mSRGBIg/8vob7btZDIT1jatgsLtjzyjGLkwJNSVH8MYIuOZLlNR0WaZydn6UCBtWuv3SHjrXTwdLW30tww22g==
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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

(no changes since v4)

Changes in v4:
- Convert to new bindings

 .../boot/dts/freescale/fsl-ls1046a-rdb.dts    | 112 ++++++++++++++++++
 drivers/phy/freescale/Kconfig                 |   1 +
 2 files changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
index 7025aad8ae89..a848556bd7db 100644
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
+	serdes1_0: phy@0 {
+		#phy-cells = <0>;
+		reg = <0>;
+
+		/* SGMII.6 */
+		sgmii-0 {
+			fsl,pccr = <0x8>;
+			fsl,index = <0>;
+			fsl,cfg = <0x1>;
+			fsl,type = <PHY_TYPE_SGMII>;
+		};
+	};
+
+	serdes1_1: phy@1 {
+		#phy-cells = <0>;
+		reg = <1>;
+
+		/* SGMII.5 */
+		sgmii-1 {
+			fsl,pccr = <0x8>;
+			fsl,index = <1>;
+			fsl,cfg = <0x1>;
+			fsl,type = <PHY_TYPE_2500BASEX>;
+		};
+	};
+
+	serdes1_2: phy@2 {
+		#phy-cells = <0>;
+		reg = <2>;
+
+		/* SGMII.10 */
+		sgmii-2 {
+			fsl,pccr = <0x8>;
+			fsl,index = <2>;
+			fsl,cfg = <0x1>;
+			fsl,type = <PHY_TYPE_2500BASEX>;
+		};
+
+		/* XFI.10 */
+		xfi-0 {
+			fsl,pccr = <0xb>;
+			fsl,index = <0>;
+			fsl,cfg = <0x2>;
+			fsl,type = <PHY_TYPE_10GBASER>;
+		};
+	};
+
+	serdes1_3: phy@3 {
+		#phy-cells = <0>;
+		reg = <3>;
+
+		/* SGMII.9 */
+		sgmii-3 {
+			fsl,pccr = <0x8>;
+			fsl,index = <3>;
+			fsl,cfg = <0x1>;
+			fsl,type = <PHY_TYPE_2500BASEX>;
+		};
+
+		/* XGI.9 */
+		xfi-9 {
+			fsl,pccr = <0xb>;
+			fsl,index = <1>;
+			fsl,cfg = <0x1>;
+			fsl,type = <PHY_TYPE_10GBASER>;
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
+		phys = <&serdes1_1>;
+		phy-names = "serdes";
 	};
 
 	ethernet@ea000 {
 		phy-handle = <&sgmii_phy2>;
 		phy-connection-type = "sgmii";
+		phys = <&serdes1_0>;
+		phy-names = "serdes";
 	};
 
 	ethernet@f0000 { /* 10GEC1 */
 		phy-handle = <&aqr106_phy>;
 		phy-connection-type = "xgmii";
+		phys = <&serdes1_3>;
+		phy-names = "serdes";
 	};
 
 	ethernet@f2000 { /* 10GEC2 */
 		fixed-link = <0 1 1000 0 0>;
 		phy-connection-type = "xgmii";
+		phys = <&serdes1_2>;
+		phy-names = "serdes";
 	};
 
 	mdio@fc000 {
diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index 6820505367cb..dcbcabe3e32f 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -52,6 +52,7 @@ config PHY_FSL_LYNX_10G
 	tristate "Freescale Layerscale Lynx 10G SerDes support"
 	select GENERIC_PHY
 	select REGMAP_MMIO
+	default y if ARCH_LAYERSCAPE
 	help
 	  This adds support for the Lynx "SerDes" devices found on various QorIQ
 	  SoCs. There may be up to four SerDes devices on each SoC, and each
-- 
2.35.1.1320.gc452695387.dirty

