Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 768A05ABA37
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 23:39:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MKBBW22xqz3bxp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 07:39:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=gEbO6Lst;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.66; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=gEbO6Lst;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MKB943kXwz2xt3
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 07:38:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCSRIJIku3F0AzaAb16nuYpi40VG8dXJslkDqeHRiOLUSVjwjSxDgWvkMYlBWTkgjAbBw04+lfmQ86ayzJcnP9UsXGIqEiXo6X4rk2Qp7ryjhjkxoC3cZjruIzvMK7kIKKKnvXidL2Pp9qt1dmRkkRgzE6n73pfbkFP3yuTMUsEVo4b4AeYl1IFwdlal+CGZ2Um5r8MH5QiLrczbEiHLhtrlt6OTCzgAIdTOjwOZg6uBputG4qsmWszwjTZg/yp8uZiM1e3LL9Kv6VUhdHu+pqnfEMGZaaoG6J9YHIR8FveQK2Yo9GVWRD2FD+JbBuY2wLXJUnWMo4w3LjOEW8F81w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZQ22wOqCh1FTn4PZfoCxfPM4yFXmwWTJEtq/JsUNo8=;
 b=a0QqFG+owytWPjDxN8iSIW14yC32z/P7tsdej3m2SiMkgxI84y1tzpMo45PWicsqOlOQ33Se+xBGl7CXgBTc+38JIEZcHfUOymmgKUTyhF4QyDASYJnNMgQosqKBfkgpSZxT1igKMd+bshPyPNLN5AA8WqchCg7ban6oKXWoO7zbXu5UnjwpmRloPWEsJHtC1iJuqONNjAKJjYav3VHxXsI8wv4JB8eZf0CCfXLnw3PoFEuZm9Y3SJLC1hCLGdmnilvY8OeZRnDsWSsi1D3TpU+kRb1UcZZBjGSNy1F53hlw5D5fghaFr3pDP55tim41r4NNDbrF10XdWtHgj1lUkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZQ22wOqCh1FTn4PZfoCxfPM4yFXmwWTJEtq/JsUNo8=;
 b=gEbO6LstlT9QHWn8v6ct6hPFdEavPT7TEHuDxm8KD2d9NbJvNn82nYNB25DzvqgYMSCMTPotze9DoE022M86Z2nJyxXP1Cz6/oqPV+VeohC1C+Upffb8Jy2Voh3PEEuBFd0P9vkI8yAIfw1ozEKnBdMT27SDExUN8AJ4G7kCY1CiDcqbyos03UzpDazSIRPcMKagY2BOXrzTEFfFseptiR34s/+o4SL9nf6HwAxv3mtfYGBMzu2gfhpfMLJs67VkYJ0xFAFoqohIcEI5uB+wnZwCOtdRiAl7UjsmD4jNgPqnlpyqb2vbo3tDpF78dt+CP/qk/eYWQVnNIrbj8Po4dA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by PAXPR03MB7886.eurprd03.prod.outlook.com (2603:10a6:102:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Fri, 2 Sep
 2022 21:37:41 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5566.019; Fri, 2 Sep 2022
 21:37:41 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v5 2/8] dt-bindings: phy: Add Lynx 10G phy binding
Date: Fri,  2 Sep 2022 17:37:15 -0400
Message-Id: <20220902213721.946138-3-sean.anderson@seco.com>
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
X-MS-Office365-Filtering-Correlation-Id: 81e7bf17-4b42-4224-4974-08da8d2b5d5a
X-MS-TrafficTypeDiagnostic: PAXPR03MB7886:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	oCzpo3jbRvAoWYtR5jfvcI560u9Hi77g8TVZJpD0ywk9kxVRNLK624y6W3waF+qbZ3+phlIB4eTAc1g3j2z/c7v4y/krb8jsHlobNpI+gs8rd25bSP6z18zk3jqkHLjvdRkkxIpdbCTyeNpRhrJaJEvQjicQlAuUGv4AUbLXlC4Ys4Wh6wtCRYYRH08xG/DrnZj5ALdQmF5VNjSeWtVjuy+g2D052GqQ87Pu0HSDWB/BGaCfvJj5WKgNhQi71cIEhMoesKaC68TmvoxnsjyBV9vHmhwSNWhiiS3/asTp9RsnjJOB4MFZHcGp0BOwgWWIP81sGxMm2Selq+Xt/qp1Xtg8oE0mJOfTpl/WbP0Nm7vnuw2wK3vNbnqcsxtKPAqvRvHUMAB+Pr8r5MXO49Bm4jZhr/N/wo48ccsoGCc+pacQNUm0475Zk2emGPuvfk1c9LTQuMPbaijpzocpFHIukX5e7Ki4luMF+wxnk/1uBJLLNfpMb7+j/Vyv44VyG6f3bLfnspUtyzNwAXcyLauQX1nmR5RAK3BS9+nKyVEVbBe346X4FiGjlYF/NumSv20kGJUOhehiV8mMHIIBSwAwrbKqu4sULWiOBbru4i34KcKCp2N1OtelpKUyNDNIcPD0eZEenpbWuXncqv3890gAxK2PngaDTgsMtXkkVvwCIe3UvHXFgoHVRKG+7G+fok//29Ey63Imk9dtBxFD/hGM+er/e3KgCNDxDeILskjf3i/4loONV9EJUAWPPYriPXiKt6FEwVA+4J+wQo7MrQ/0f6DjsklF/isYtHrZ7Oph6LE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(366004)(376002)(39850400004)(110136005)(54906003)(38100700002)(316002)(36756003)(186003)(1076003)(38350700002)(2616005)(966005)(86362001)(6486002)(8676002)(4326008)(66946007)(66556008)(83380400001)(66476007)(2906002)(52116002)(6506007)(6512007)(26005)(8936002)(5660300002)(478600001)(6666004)(7416002)(41300700001)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?jnu5inL5uvz0i/7awq00whrvuQzGXPs0/UaDVF4PSQUwOqJ5iwprU30LWBmy?=
 =?us-ascii?Q?5wrndjaBy9g2TOPARKOvVT5jGDAIBrZAqzll8roTPUAYm5TkIUANUt0mEaim?=
 =?us-ascii?Q?+aUK/ZXgJsA1WSC9iKKC7Du/SLoPZDg3i1DyhGrwifcDw+J5pnsO6zC1awXX?=
 =?us-ascii?Q?uD5hwGxME6i1UojvvRdDSS058Z9zBMDGMQoLW5JDAN6PXmzP6puaGYxnOt//?=
 =?us-ascii?Q?HP2EQRm9Cybyt0cDtPlaBhIvdt5Abj46FJQBiI3wksGWavUr+wca+1oDndA5?=
 =?us-ascii?Q?xdOW/eI+NtHXZxSRSBHXhDuLWHMJSzdvUofnExFQmGp27TWeVMc9lJZiOVmB?=
 =?us-ascii?Q?Od7t8Uqzoz/gjNEyRxO/VYah9C+U6fseWWS36S6e927moSKSqSoBtdb7e3kp?=
 =?us-ascii?Q?EwfWX3CVJKl8+oy1JTKKuluMzFykeMiuk9xjeEcaEBTEO4vztCq+CHZx5Gnc?=
 =?us-ascii?Q?4w/1pX+CDla4tmZszUkpG+q8P/c26ghwCW3Qk1tJCcrLr+eHb0bQ5qsfVu7A?=
 =?us-ascii?Q?nrEaEQTy2kTGziOCiE34ImRQ/ivMszFNurOzv0ZT9SjDiec1HKBGXT/kmqhM?=
 =?us-ascii?Q?w277EajkT6J/jLurEIqgHjrm1CuvQte0mPZUAdbeeky8Kee5GYLfD59tK0S6?=
 =?us-ascii?Q?TrlrTlFvl3ktANHOeyaIa8ghvg0JJ6NURW1Zw19WkDWL0odeSH1l1I3QUR7p?=
 =?us-ascii?Q?h24ToKFuQGISvkWizj0CZTj+EmTfkGuXYrv+Sw+qqeH0f0aqH0qH0b3h2QME?=
 =?us-ascii?Q?JzHO5gxZlljzob3qhEmbGox95bYonkzPuD0Y5bOLmEQm+CRJSN1qpiMPCds4?=
 =?us-ascii?Q?wcgPoQ8i6I2KA3y52qnrWNBWgfNJlYhhWORh0heTYAlrC0VCQT34nSpSo+bI?=
 =?us-ascii?Q?YyZlcsGCB5uBzfDDnu99ojrk+WlaYWgKNLuNHoKnebj8/9926Pl40WYof/Rn?=
 =?us-ascii?Q?DH+YLYJi1Tow+Ic6PeiASJbkQAd05lIP9kVxtFUJlKAlI4KaOT/Bo8Ft2Mwi?=
 =?us-ascii?Q?MMpfCBpqpgX888nHMgobDwTsxE2jbzeU792TPgnjUX9boEmqReEHWtMBzmpG?=
 =?us-ascii?Q?5VTPndBTVrsN6YjegNh1qV4wCbVGOMznPMbaAqedrMJbcC5X9KaSOhG3M4On?=
 =?us-ascii?Q?7QbIQATq+urLfnCHCxiz1XrAQyi8sgpc7Y0iYFRbgju1FIDB7JEqonNPMjqL?=
 =?us-ascii?Q?e+EiAl0kB0SkoIiJTnSYMMthTfkgJLHHVJSSceow6Olhu781TJ2tCjt0anxH?=
 =?us-ascii?Q?d7pFkBjSvMPTPWtvc+urouxmT3xI15kdoDqgivkJ47kcu3kuDP06lYl71p7S?=
 =?us-ascii?Q?urC+z149F8YI5XisObyqu4fIHw40jFYZOkN21YSidzvB/7Hcxt0AWA7lU62D?=
 =?us-ascii?Q?8DbPV7GSioRWKxI2Vistrh/YcA7k90LKlVewbYeZ+XiKlFn2vVtnQwLOhhno?=
 =?us-ascii?Q?xNEjafco927AbkBFlJDEflZ3MrSlXhxD0IPIRx/qnGvN1CQ8zvnuN2v51mKZ?=
 =?us-ascii?Q?tPAaY9Vy+XzMOR4wB4wdc1sylVDh1JS3I6g0lBstYonohiilTkzxEOsn8/UJ?=
 =?us-ascii?Q?3a0gQWIasSQK3hBI00gk67otUCWJw29mQ0AkZ2rySjD7TQ+3tITmANG1PW4i?=
 =?us-ascii?Q?GA=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e7bf17-4b42-4224-4974-08da8d2b5d5a
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 21:37:41.6904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BlcmsT+nQwfJbs6jbdAtI4ungNd4aq6/MBJu/VxUnFhkBZBYn3DECUQ+tUSn+6d0fuCc+0LSVpa6yQQvPItFUA==
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

(no changes since v4)

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

 .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 236 ++++++++++++++++++
 1 file changed, 236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml

diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
new file mode 100644
index 000000000000..59417e6172d7
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
@@ -0,0 +1,236 @@
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
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '^phy@':
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
+      '^(q?sgmii|xfi)':
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
+              - 12 # PHY_TYPE_2500BASEX
+              - 13 # PHY_TYPE_10GBASER
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
+        /* XGI.9 */
+        xfi-9 {
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

