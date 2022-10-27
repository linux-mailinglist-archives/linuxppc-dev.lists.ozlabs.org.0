Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E77610147
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 21:13:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MywMB58CHz3cGv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 06:13:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=XPY8AOYx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.46; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=XPY8AOYx;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MywKB0sylz3c9q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 06:11:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgGEcIH9tBc/CvvpqIsmmrqtkiXxh7tOwIDKRsRPTEpCbc/zSS7OvGp3nCXE0j070W38DMAEwF1QtNB8S7eIBLuC/28H4G2KYR2I8BrIoKAy9UEYy/V5V9yTLD/eQKjYgk8irXpgbyG7qrrzA0JCuFTdFqWsPA8raYUf7jM27f2Z2zZ4ep6J0aaVvtL7SaKRimjGAuRMEW9NY2XIBS0c3HFaCFfw8MoX4wkH7ci6Bm2EAJRopv58Wu6jPdZ1kMp8niuBHCpBQSl35OHpWK+vJ281MhxPRLA5E+fz0ptb2ILSlOY5l4OjQQpZHIDC6bMp+4VOxGjwxCHLUeF7vPHV9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wiTzbFoPy1sqZ15B6PO34HC1NVvf1CFwe0TVwHv9Ts=;
 b=jW8hx33dB3r2/5NIqYqWiBQCBItQsrb87xwz0Z6RjdaiyylE/i4jXHXnkP0K97c+SQ5Mnzs69CAt7jQ7uLF7u+ySUK8yeTISumC2KU/woyh/4PFx6WhYm6083zds7kh8EemccFU9oqCCHb6c2lAgTF8g0q/wSi90Yug4Drp0HnjMTjk8Whkkq6AH3ZbGAxMvf2mJmykXfKuBFaB1uHdGu2KBbCT4gEWBIxE28KaoEY1uzIybM5GI+XS1Wuw+BpazbcORW8GHFaleL4vzIoPWv+7+AnXMrZiTFyAUE/RNAjFuZRipzEN91xKbP1sGnHn1pTloohat2QboAcJKpfb+Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wiTzbFoPy1sqZ15B6PO34HC1NVvf1CFwe0TVwHv9Ts=;
 b=XPY8AOYxr3Lws5FtkwCPm40dVCYQ5WkU8aRahGvIGYOh45gEW5hkwPL/aGVfhbPqsKAWalikKxxCJku2gunxNrm6vN3cAWqS9TEsXh+Sv6HnHlQCUXVDPGB9xqPfZrs6trSVeLTYBJB7qoSi9s3wSEezmEDrBMVwmflV35zzE8pc3aERNF86zDQOpg7mPo6wODUfcm9iy1OYysRcaKNIDAqHwO3wX0OU8eSIlBvP0x5y5OlHWNu91+8H2AukSClDZvfDLsfz4Dg/jl5ZNkQFkQElGRZvdjhGx5TYJnL+PMFr+VPXXrXgH/FBxhf178cmSWTgF1QqSVe+voL/ZVzOlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com (2603:10a6:803:c5::12)
 by AS2PR03MB9648.eurprd03.prod.outlook.com (2603:10a6:20b:5e8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 19:11:32 +0000
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::3d5c:1e59:4df8:975d]) by VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::3d5c:1e59:4df8:975d%6]) with mapi id 15.20.5769.014; Thu, 27 Oct 2022
 19:11:32 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v8 2/9] dt-bindings: phy: Add Lynx 10G phy binding
Date: Thu, 27 Oct 2022 15:11:06 -0400
Message-Id: <20221027191113.403712-3-sean.anderson@seco.com>
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
X-MS-Office365-Filtering-Correlation-Id: c517f41e-2270-404f-58f5-08dab84f0efa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	SBiAYAgKe55MUk1000aW9Du+JmpM8VCNkA1Oxwv5i/3khh7NBzu9nPHpYxdIL66Z3fuIimnR0yN5PJBd2iCiDEusXelhMt0+MP+8Rmm2vL6UgxvHhZnTBJkIzaLxi3sGAgWsZMaE9Rgf+deKXy6pe2L63egoFlzHCa/Hbpj5ZvIJsLYqgK+nXwwYGiOIruGiJuxYE+c6l5WsQk/PN0xcaDKs08Bj4Ij40AYL0q/iVaVNs4Ju6eFh3uY3NPX91eBiJcDGOVb1xd+TAzm4r9+HQjpp72hIXTOcbiJtLaWW2B2Bi+2gpmquCX7VD3WjcJQdE67mOI0eKvAsiKWI3qUh7b2eoEaHRSm5alE7WqbtiHvYfZdCzH+6KGRY6poGAFDVVse0pZ9T0s2kWoXdcPHXxdSGNf6ITqtqN3kUaa9F4Jf9/BCC+He1umtUiAKbhTwCvXBq0pz8mz+cOTjQ2MaXi5RwNRwc4hhPStfxIFv8+8NxlYo64Oh0qyOXHPBNZb+lfywQ6SP3Szo1VHYXWlC0fc9ZGTYDZJDmVQZKEZRj/lNDrz+ySXRGhF/yK5EIXGP3L9Jz2GJ5X0b+nm74kGf5Lf7wHdgDBGzbyFAo7Yb15Ivar6Su5VBrYVhb/hyw4Q1MqufugxnDOi3TYd4D1PrqaKhKP6NZ+Y1Nn5XJSM74Cgsh+uxV0pZ0PeG8cHuelZ3Q1IQj8kOcv4d5K5wAv37miZnPsFM+tfov0snhVk6sViBEEicVvoZpQOeMy7urjouyOpx7mjj9Kq2Cl5UCk21r8CI88jC1EKblLjj90hNmiSg=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4973.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(366004)(396003)(376002)(346002)(136003)(451199015)(110136005)(478600001)(5660300002)(966005)(54906003)(83380400001)(38100700002)(6486002)(7416002)(2906002)(44832011)(36756003)(66556008)(66946007)(8676002)(41300700001)(66476007)(316002)(4326008)(8936002)(6512007)(1076003)(186003)(2616005)(6666004)(86362001)(38350700002)(26005)(52116002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?q318NFdh9gQRon+O8yX424DPCxyXq/SSRjQFd1xuvoHJ9r0JSWvwK9PQScoM?=
 =?us-ascii?Q?r2hG2jlGlOyIjvL27O6lsW79ZRuay9UlSpOdmaoG2cyJPU3NPaCEFLIdjFmn?=
 =?us-ascii?Q?qrtBoR1cqDrWu1bdmdapPR4uae1QaiN8qpAMeOk9bcQD47RPOuKWAw3j9+m9?=
 =?us-ascii?Q?fZmytU2fktgvUsU/CE/wZIjo5i8139zaIsipL6qIKqjoGiu7qWMuBhdIjnxk?=
 =?us-ascii?Q?KsGG44xLP4jeWcm35c6QDKt07LQYNngM/PbA0Ivy2+Fbfxf+548e/7gNe+nI?=
 =?us-ascii?Q?4z1Sw9+cp6MgjTyYTmhc08oe3my1wCBvaEgozQ+udQTOdCx/37wAp9dzNRI4?=
 =?us-ascii?Q?5Jxb6LWTVED/UOSUNpOVPk6KFn8YvgOrk1FX2E6TKzM5XDKpYhYi1CyNOfRC?=
 =?us-ascii?Q?6a65gWAnOvcE1X2//xe6jFs0UKMos7CHGcC3l8RPB29oofLKn9QMMUDTn2OT?=
 =?us-ascii?Q?t7VhIUkLdA/vNVzHWJC/VKnyWw6a5zcB35NFZNeQasmfKxTFbEejI0N/va8+?=
 =?us-ascii?Q?d79eODShJADft6G2o0R1YskAbjl0qM4nc3qZF/RpO5EBM1o0IHYZJQShLgRH?=
 =?us-ascii?Q?pZ67htS4OdkkFss+hYBRAyAkxvpYbUnYaKuY5gkkaOje4r1Pn6qOfC0uQmmH?=
 =?us-ascii?Q?7uED3mM0jMKE+98BcNG8IlHJ5OUfCc6Z68w917i+y4tPEpTVFWcUjohxtDR1?=
 =?us-ascii?Q?HVPLQKz3Em0tsTJddpO6gQuXplB9vrsZGooKhKDocvpHUXFVsdz6i1bd+39y?=
 =?us-ascii?Q?qJrbZi9U2hcHxIiE9EF59UbrJdSASwYzUXXoKb/i1oDbV7nTwiumhMLPY/5w?=
 =?us-ascii?Q?sowWs0uKQVvgG62f4vWVxkUQVjpmWg6km6HCwVQHsdeR3wydUAuZ/3HzvmAU?=
 =?us-ascii?Q?JF47hL7Gwk1vAXULEFpqE/zsH2NYyJ+ncEAP0zgov52pcawmIM2R6WOMe7TJ?=
 =?us-ascii?Q?PWd59Dw7Lv/w2vUlJeOAsBGxZoXyaCT935CwBMWEFhwmZ3bgQNUHFm7TIrBf?=
 =?us-ascii?Q?LFWQad1rfT7as14FveZm2fb7k9gdLVim9a3RjDoy60atjWcP5V5ytGGrG1fy?=
 =?us-ascii?Q?/5PRI7CZ4M75W+1GqdnUK3Gvs7QDa28C8SHcGOAuh0W1jWZ5XceJqPtM8sjO?=
 =?us-ascii?Q?9Q0yYcpVrUbxwZddj181P1WXDMVnUzihJJwle7tq6SJPwiGC09Nmu+Ex77xd?=
 =?us-ascii?Q?n02nvrNJ+fUEwhLbV5if6fN6litByU5fKb2UETsrle4BIhQ+oHJCMODmbdqy?=
 =?us-ascii?Q?cGHldIaG5+uioLaOOFDTX2kRiStINVJsvfx81sfnA6I6mNqp/+Kp2+2WMXuB?=
 =?us-ascii?Q?ejoYQWcPwUKbV38XLub186kU7twFXdidPOtyGItogRzCV5F5AxI+UokZACLP?=
 =?us-ascii?Q?ymGW0jNb5z8Ivyysr99nQbrxoizWevuuLQ8FORA1JkZdTh9lU0qSjw+Nt4Q2?=
 =?us-ascii?Q?k0bWophrVqlKrIl84eQHbRODsoxDF6Krf2YAscCEj1dHetHNUYuhUQDb6zyA?=
 =?us-ascii?Q?hcxvoPfhE1V66ju4Mr1D3e3+RwWMNMTyW4bDqFJGSsyCyAMNwx7R0igJHQhA?=
 =?us-ascii?Q?A2zwYLyrLCZSvBzl4KWN/pGkU8IMBgTJuEMFDiIpt+E/fUZPzpkn/eVXGB/H?=
 =?us-ascii?Q?/w=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c517f41e-2270-404f-58f5-08dab84f0efa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4973.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 19:11:32.1748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7slUdxT5/GEoC0L6hodOnt5biU9pEA0Z6+3cd0cdyEKIiCH0Osg/r8f5xsqZwMyslfjtAnGEseEcugnwumV4g==
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
Cc: devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
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
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

(no changes since v7)

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

 .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 236 ++++++++++++++++++
 1 file changed, 236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml

diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
new file mode 100644
index 000000000000..f326fdc159c5
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
+          phy-type:
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
+          - phy-type
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
+          phy-type = <PHY_TYPE_SGMII>;
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
+          phy-type = <PHY_TYPE_2500BASEX>;
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
+          phy-type = <PHY_TYPE_2500BASEX>;
+        };
+
+        /* XFI.10 */
+        xfi-0 {
+          fsl,pccr = <0xb>;
+          fsl,index = <0>;
+          fsl,cfg = <0x2>;
+          phy-type = <PHY_TYPE_10GBASER>;
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
+          phy-type = <PHY_TYPE_2500BASEX>;
+        };
+
+        /* XFI.9 */
+        xfi-9 {
+          fsl,pccr = <0xb>;
+          fsl,index = <1>;
+          fsl,cfg = <0x1>;
+          phy-type = <PHY_TYPE_10GBASER>;
+        };
+      };
+    };
+...
-- 
2.35.1.1320.gc452695387.dirty

