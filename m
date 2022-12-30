Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E790659380
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 01:04:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Njlq32J9wz3c9T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 11:03:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=aCInkrV+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.88; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=aCInkrV+;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Njln50W6Bz2yNX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Dec 2022 11:02:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWXJeZAGxsl8uh5mjrmkRy68apKzNXW00oxjoY40n2c9tzr5D4PTEkxWRuiV4XbofomnWvspXKa82RcpY+spnzAXhIaJ7kbPTUi+OgVlf3RzaDQGEVYm/833LxWhms8VIPnj8Y1pBJS3M0SMHA4q7Oim1m873Zr/G+lRl4Do2Yb4ebOjci/x7q679jpX6p4a0o+sdPZ9p1KY2SeXwSlHYtiaYfh3BpjhU1De7WTbb4pWxTgQnc+o94rrUwaDgM7G/P44oFU2A56VXCE772npYSFh+RgD+ICqCAfjZcecFlUP0Xac/Q/CKyLEmi8XD2V7sx+hfBSdvPYulmkep+iBOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTHZtd8MRl9SlgmY+4Zn7L0GBLX9bXILonMAlCYvifk=;
 b=ApdEV+I6r/hBRqWLyXE562Bpt7IyzL4XB7KQzBj9pV6wjdMKxD9btO+JA3QuFgKUEOOc/pzVRsngfJ3SAci/ogNchusn0+U5hHcbWQyyjdjUxV3okS/10BqYULlDetaFQ5d2PVYkOu3zo/ZLnPs/iL2XYXInDjUzualx1aVHAxbCXp3SkNf54ICh/zjiOExTD99Fh58pEVt9rj6caH64XQ5Z5zKGXl6bbCK7U/XkPygiEgmhnvl+zIWsXhKKiwlWBlXlYkfqLB/L/R86FCV807xNF1Iepz+8+JbLis9yuS3h78T/C6ea91LXIWPOavxNDNIVFaO1sZMZk3vm3X9glA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTHZtd8MRl9SlgmY+4Zn7L0GBLX9bXILonMAlCYvifk=;
 b=aCInkrV+ddZD3HlYynPO5S6yfe6xPlBJPW2kY78IR9uEYImixqmxBJtY0ILUJOVfEZ7oZ78fnE0PJBeVMetMX69czNGe2BUfEf5H48lUdoG+5ACEGCedLrx5nLfXmfLzNG/2U/W7lKp94sEEKQgp/SgdboWp+dfwMlUi93DVGdxnS25ywlWhb6V4g7ZbYJ2g0mBIN2HoBeZzadU49VnKLt05Al3vr+IuLiT6+s2UjEcG0R5kL9qwvsEybGXwr93aap8cwlC/ZC1rDMI6zMltqXdTMnAXlXaUtxlOMAPRIV4dyCbqAhg/qFC5cL+g6j8wcheAyggyca+OQCLn6xwUug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PAWPR03MB9788.eurprd03.prod.outlook.com (2603:10a6:102:2ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 00:01:53 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb%8]) with mapi id 15.20.5944.016; Fri, 30 Dec 2022
 00:01:53 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v9 02/10] dt-bindings: phy: Add Lynx 10G phy binding
Date: Thu, 29 Dec 2022 19:01:31 -0500
Message-Id: <20221230000139.2846763-3-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221230000139.2846763-1-sean.anderson@seco.com>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::29) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|PAWPR03MB9788:EE_
X-MS-Office365-Filtering-Correlation-Id: a1768dc7-0d59-48a7-67b2-08dae9f90ec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xOy3DxoIsp3xr0hl/hVt2ZPJWK9IllYfIr5wTT4R4QP0ZxKPrW+2EZi9UtRXn5ndC9jpoFs8tXqX16L4O9uACU4rgkqyxjCGmHg+Q3re2HUUrXMOha1dNerMFOOKkhw2j9jwAp03c2E8GlblijRwKCs3mj+RpvJk/woohrfSuOYF5rXDJLSK4uOCJttBb7rSg8DtLyvbufnk4GGlwi4+ZXAeahP2947JrYGwsNPvmeXoDzKDvvChOWOneo5wK8Sd8rAhpALvnUze8dj8eAroO0oT/CMdetH0geJlSaj81XvWXX/eGz9OTfqKYf+zSxqHp3Rg2+ISwJmGivbvD0f/VzLAYwgTY5YHpqkj0DTTAu0ElTt5gWhcqdr1efymSHrhwyti1zg5Q64ma9Yo1J8yIcMqpeuNdyVUQE+uVa/Ogxow0BIN/LPNffUX5VVzZiGWAoHfggolBIy8INHE3WsNs8HC7CHZHpUAMOelnzMHQAywaMLr+/VUfrzVdH7GyI7vxQF6Q7yPUMrEDPx2kZLuVe761/RUZb2RJwwqqjELpQU7AFxej9Qs1OAnykrCckuUu7ZB3dYH4TfDzI+K4WDvqtECEdjKU2Napr474dqqY2ipPo1dPXC2Nl/BifkPP1MUg7Dg0j2aiW2JKBhx+LPgi509CA+XBz94kIc5Q8TBX/E2dmJ+ZDJ9HvwaZuUIAhIpLR2zI/v6Ds19Eoz7BmCXiLbeYqSVJHy5Zkio87h0Aws=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(376002)(136003)(39850400004)(451199015)(8936002)(83380400001)(4326008)(8676002)(66556008)(66946007)(7416002)(5660300002)(1076003)(66476007)(44832011)(38100700002)(6506007)(186003)(26005)(6512007)(2616005)(38350700002)(6666004)(316002)(86362001)(2906002)(110136005)(36756003)(54906003)(41300700001)(478600001)(966005)(6486002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?C+ICqO9CHeaLMG+E8v09uuKWR06V3oizSFCuvUmlXzhB67PsMcBOOi7dfMpR?=
 =?us-ascii?Q?xl4FLztZdLPABRjxRFWVX5I4BLuTZGwj3gjFw6jyfcRo/StZk/GdFfV4+jvA?=
 =?us-ascii?Q?wOeoSbVAa2yXlZpfXpKOSho9Ascf8RL+kglifgDgnsWkpxkh4F32vf/Mq+4o?=
 =?us-ascii?Q?XchtyRc3Ke2djclxPF12WgbyjciENBnLvFFyHRAY+NTtvHiwjUAJt2zWir+v?=
 =?us-ascii?Q?yt680TSg+5LzVZ4rbUb/a4x74zCpobGYCrfYXzm1GhxT5mWXy/iYYA6SL5hA?=
 =?us-ascii?Q?uJnTPXLgqccl8OfRh9D2s3UeKxjCRdkj70P3hSqSnmqUqU+lRMZqHJ36shoG?=
 =?us-ascii?Q?wiKsXXxIi1uGi5Szz4zIE1Nzf/+eTzRrPY0w1qM1A5jm3ZyORmszeJOdSwbq?=
 =?us-ascii?Q?wRJ55ClY2MR5IKJr8do0XiU0ccv6Ur1JB+Ajwhw26k3wUr40iCUMn5ssIO7y?=
 =?us-ascii?Q?eLQIsFOTPv9DREOiQTJQmpsbIJfLHzXyvJOY/OeeqIeVWUOpVNY16LwHDChk?=
 =?us-ascii?Q?aZDEfdbWOaGM/ABZQzzZc+Qo5rbp9qVu/T76I6aCv+hqLphpxPIo2XZ/D1BV?=
 =?us-ascii?Q?w10Lj05WwPdYCAM9QyJVHzZU4AWKra26w8OKm2YJCGtsZIuqtnSs02nqqg6K?=
 =?us-ascii?Q?/c7nYtgWGMefh1uE1ekA/vV2UFl2PldEskBXKB+5qhk4ehgGjOVfuiE0Wcuf?=
 =?us-ascii?Q?v6v2gLnjgCaXmxKtwAXjopeqVEptnQv31Y7EyriDtyWoi7J2XkR366yDsj0v?=
 =?us-ascii?Q?S6MD7CLQlMh59Evwycuqdp8+jkuDCpZ1swOxNK8QuDm6jK1NnBlDd7Ge2joA?=
 =?us-ascii?Q?HNOpP+Il+yNNQpiK20p+GI4X54/2soqr51QcnUhYI0W5A57Xp3GpFttiHffY?=
 =?us-ascii?Q?MkFRj/c2q9SalsRYLMdA5ctRaL3ewcey7r+fGZ+YogKEBTH6a8k/Gw0+3y9/?=
 =?us-ascii?Q?xX9MIlF0y1aHdVBinui8DJsZOOGBannXrq3bYuv5E2SmUz/GfykUPCvy8TXt?=
 =?us-ascii?Q?UT2NFiS4GKloXMYsuZB+eqxnuMg0Kmq/awdVcvT5eElRj0lOvfIhnjr2syzT?=
 =?us-ascii?Q?4fse1l6zm69imUKtjkZXGPhPOATu0Q0CncQ9qoeui9tKqHn/KkIKSUNIHh8t?=
 =?us-ascii?Q?6oprzFwwXhv+2sK3M+6X+9tcptfOquL+vIR84YGmNrM0DCIWOWm+Igo7dP99?=
 =?us-ascii?Q?isY2xJ8ou7AXXpt/+uA9ia47X7hc6o8nDtAMQUl97ILzcXEQVDjM+tKoaX4e?=
 =?us-ascii?Q?7uA3Qp0Wyk0IXSfv4cpxo3At6OqImgXChcPz9wfVH5tiCGk4XLplc1qL9AeM?=
 =?us-ascii?Q?5kZPlKoZI1OBnYwn/zH8NIfQDvuUp6zoGkBIXMDeZfE7+i0oAaofYuy6Sq+Y?=
 =?us-ascii?Q?Kvp7pQBwD5QkwK9/ZRaIN85IewUo3JX6brKGsZS85INfjOb8WQ2A+gK1wu9j?=
 =?us-ascii?Q?O9dnMMSbyiOoTDtETIQc/yyhgmMN0uuqyV/ASwD31kj8ToMIBCfxQP8dnRUv?=
 =?us-ascii?Q?bqcm2C50qFWmsfDLyc/yt/rMdnZeJMSY2YaIzS3PfJVpUawoBALFN0wksnmE?=
 =?us-ascii?Q?BgpbajCkezER3rIoVxe1qCIcT6j4MANc0fcSEg4ri7J/1zm+HlxTXbloij93?=
 =?us-ascii?Q?0w=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1768dc7-0d59-48a7-67b2-08dae9f90ec4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 00:01:53.1008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +t3rTuETxawPZ6ip1Mkr8aTnwe0p5crio8Bk1tpOashhlnv11NqARJcyTUPma30Pkp4PQQnot4YvQAybWVEbHA==
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds a binding for the SerDes module found on QorIQ processors.
Each phy is a subnode of the top-level device, possibly supporting
multiple lanes and protocols. This "thick" #phy-cells is used due to
allow for better organization of parameters. Note that the particular
parameters necessary to select a protocol-controller/lane combination
vary across different SoCs, and even within different SerDes on the same
SoC.

The driver is designed to be able to completely reconfigure lanes at
runtime. Generally, the phy consumer can select the appropriate
protocol using set_mode.

There are two PLLs, each of which can be used as the master clock for
each lane. Each PLL has its own reference. For the moment they are
required, because it simplifies the driver implementation. Absent
reference clocks can be modeled by a fixed-clock with a rate of 0.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

Changes in v9:
- Add fsl,unused-lanes-reserved to allow for a gradual transition
  between firmware and Linux control of the SerDes
- Change phy-type back to fsl,type, as I was getting the error
    '#phy-cells' is a dependency of 'phy-type'

Changes in v7:
- Use double quotes everywhere in yaml

Changes in v6:
- fsl,type -> phy-type

Changes in v4:
- Use subnodes to describe lane configuration, instead of describing
  PCCRs. This is the same style used by phy-cadence-sierra et al.

Changes in v3:
- Manually expand yaml references
- Add mode configuration to device tree

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

 .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 248 ++++++++++++++++++
 1 file changed, 248 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml

diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
new file mode 100644
index 000000000000..7c364f7de85c
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
@@ -0,0 +1,248 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/fsl,lynx-10g.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP Lynx 10G SerDes
+
+maintainers:
+  - Sean Anderson <sean.anderson@seco.com>
+
+description: |
+  These Lynx "SerDes" devices are found in NXP's QorIQ line of processors. The
+  SerDes provides up to eight lanes. Each lane may be configured individually,
+  or may be combined with adjacent lanes for a multi-lane protocol. The SerDes
+  supports a variety of protocols, including up to 10G Ethernet, PCIe, SATA, and
+  others. The specific protocols supported for each lane depend on the
+  particular SoC.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,ls1046a-serdes
+          - fsl,ls1088a-serdes
+      - const: fsl,lynx-10g
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  "#clock-cells":
+    const: 1
+    description: |
+      The cell contains an ID as described in dt-bindings/clock/fsl,lynx-10g.h.
+      Note that when assigning a rate to a PLL, the PLL's rate is divided by
+      1000 to avoid overflow. A rate of 5000000 corresponds to 5GHz.
+
+  clocks:
+    maxItems: 2
+    description: |
+      Clock for each PLL reference clock input.
+
+  clock-names:
+    minItems: 2
+    maxItems: 2
+    items:
+      enum:
+        - ref0
+        - ref1
+
+  fsl,unused-lanes-reserved:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Unused lanes are reserved for firmware use, and should not be disabled.
+      Normally, groups containing unused lanes may be reconfigured or disabled
+      to save power. However, when this property is present, unused lanes will
+      not be touched until they are used by another driver. This allows
+      migrating from firmware control of lanes to driver control.
+
+      Lanes not present in any group will never be modified, regardless of the
+      presence of this property.
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^phy@":
+    type: object
+
+    description: |
+      A contiguous group of lanes which will be configured together. Each group
+      corresponds to one phy device. Lanes not described by any group will be
+      left as-is.
+
+    properties:
+      "#phy-cells":
+        const: 0
+
+      reg:
+        minItems: 1
+        maxItems: 8
+        description:
+          The lanes in the group. These must be listed in order. The first lane
+          will have the FIRST_LANE bit set in GCR0. The order of lanes also
+          determines the reset order (TRSTDIR).
+
+    patternProperties:
+      "^(q?sgmii|xfi)":
+        type: object
+
+        description: |
+          A protocol controller which may control the group of lanes. Each
+          controller is selected through the PCCRs. In addition to protocols
+          desired for use by the OS, protocols which may have been configured
+          by the bootloader must also be described. This ensures that only one
+          protocol controller is attached to a group of lanes at once.
+
+        properties:
+          fsl,pccr:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: |
+              The index of the PCCR which configures this protocol controller.
+              This is the same as the register name suffix. For example, PCCR8
+              would use a value of 8 for an offset of 0x220 (0x200 + 4 * 8).
+
+          fsl,index:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: |
+              The index of the protocol controller. This corresponds to the
+              suffix in the documentation. For example, PEXa would be 0, PEXb
+              1, etc. Generally, higher fields occupy lower bits.
+
+          fsl,cfg:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 1
+            description: |
+              The configuration value to program into the protocol controller
+              field.
+
+          fsl,type:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum:
+              - 8 # PHY_TYPE_SGMII
+              - 9 # PHY_TYPE_QSGMII
+              - 13 # PHY_TYPE_2500BASEX
+              - 14 # PHY_TYPE_10GBASER
+            description: |
+              The category of protocols supported by this controller. See
+              "dt-bindings/phy/phy.h" for the relevant definitions. Individual
+              protocols are selected by the phy consumer. The availability of
+              1000BASE-KX and 10GBASE-KR depends on the SoC.
+
+              - PHY_TYPE_SGMII: 1000BASE-X, SGMII, and 1000BASE-KX
+              - PHY_TYPE_2500BASEX: 2500BASE-X, 1000BASE-X, SGMII, and
+                                    1000BASE-KX
+              - PHY_TYPE_QSGMII: QSGMII
+              - PHY_TYPE_10GBASER: 10GBASE-R and 10GBASE-KR
+
+        required:
+          - fsl,pccr
+          - fsl,index
+          - fsl,cfg
+          - fsl,type
+
+        additionalProperties: false
+
+    required:
+      - "#phy-cells"
+      - reg
+
+    additionalProperties: false
+
+required:
+  - "#address-cells"
+  - "#clock-cells"
+  - "#size-cells"
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/phy.h>
+
+    serdes1: serdes@1ea0000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      #clock-cells = <1>;
+      compatible = "fsl,ls1046a-serdes", "fsl,lynx-10g";
+      reg = <0x1ea0000 0x2000>;
+      clocks = <&clk_100mhz>, <&clk_156mhz>;
+      clock-names = "ref0", "ref1";
+
+      serdes1_0: phy@0 {
+        #phy-cells = <0>;
+        reg = <0>;
+
+        /* SGMII.6 */
+        sgmii-0 {
+          fsl,pccr = <0x8>;
+          fsl,index = <0>;
+          fsl,cfg = <0x1>;
+          fsl,type = <PHY_TYPE_SGMII>;
+        };
+      };
+
+      serdes1_1: phy@1 {
+        #phy-cells = <0>;
+        reg = <1>;
+
+        /* SGMII.5 */
+        sgmii-1 {
+          fsl,pccr = <0x8>;
+          fsl,index = <1>;
+          fsl,cfg = <0x1>;
+          fsl,type = <PHY_TYPE_2500BASEX>;
+        };
+      };
+
+      serdes1_2: phy@2 {
+        #phy-cells = <0>;
+        reg = <2>;
+
+        /* SGMII.10 */
+        sgmii-2 {
+          fsl,pccr = <0x8>;
+          fsl,index = <2>;
+          fsl,cfg = <0x1>;
+          fsl,type = <PHY_TYPE_2500BASEX>;
+        };
+
+        /* XFI.10 */
+        xfi-0 {
+          fsl,pccr = <0xb>;
+          fsl,index = <0>;
+          fsl,cfg = <0x2>;
+          fsl,type = <PHY_TYPE_10GBASER>;
+        };
+      };
+
+      serdes1_3: phy@3 {
+        #phy-cells = <0>;
+        reg = <3>;
+
+        /* SGMII.9 */
+        sgmii-3 {
+          fsl,pccr = <0x8>;
+          fsl,index = <3>;
+          fsl,cfg = <0x1>;
+          fsl,type = <PHY_TYPE_2500BASEX>;
+        };
+
+        /* XFI.9 */
+        xfi-1 {
+          fsl,pccr = <0xb>;
+          fsl,index = <1>;
+          fsl,cfg = <0x1>;
+          fsl,type = <PHY_TYPE_10GBASER>;
+        };
+      };
+    };
+...
-- 
2.35.1.1320.gc452695387.dirty

