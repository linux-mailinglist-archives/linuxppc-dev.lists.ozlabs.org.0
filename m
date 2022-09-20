Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 481B05BEE82
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 22:25:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXCjY1sZ0z3c2s
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 06:25:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=TBMadfQ7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.20.53; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=TBMadfQ7;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXCh81RVrz2ymS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 06:24:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5ImOa9dk6tvWcv85oECu5cs1XhADGWU5Y/jpBHgP+TNloqepL03uBBd5OdtFnQ0W7kEzQ6ZlYIBV56aN4X96TZ2i8M877VppKZZRixWO9SlsDjRZRpuO4glZBqEgKzvdDi2HK5xzXRCUx9cs/MY7+cnoadB0UBp0m6lylk8ro8xvgK5VmN7QbjTdQQzA9fYKPSaz3kT82WNXod7qVdFRJEOaFqvwJ60BK0n6JK7LBjKcxGocsusM0z7Jj5QdTKdeN+Ii10NsUHt0lMBNoEkoCU7Edb6qLaJaAzBFFDvfRdDTIYGaqgo7DPRfJ6qnWMnvuSAjtI1kaukpyy10fFTDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87GCaMd/NUE5Hgz2rTCvcBh49jyb9WQ6rVTGJ328Vt0=;
 b=GHA6OnOiYRKqb1x8QDpmXtiBTpAqwMV+Bo6PMU/q2gOaj+J514EW3f25ZcTRBf7r5Fj3teTDVQStIkxbT0sGcLfrRbgwlY8SclkLsJZkxoUWffg+kj57h41zQed7GNiO9rzxvvkHfHnF984XooZpAr083NqiNESF2wENUS9vLweU+w1avpGReFvn7/d8UrxDmn2uiZWALDZ3fMueJVnwStEwcKeXLzfBiCoe2EiIZSNxLHbI3Tn8qzPK/Qthwe70qac8NHQhJVEKC+qtKWgYZXPTypssIwb5EIGap6oxVPrR2F+xj9h+pVKCgkPE9vRh9EKtrRQNVa3OZK5Z/xqpiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87GCaMd/NUE5Hgz2rTCvcBh49jyb9WQ6rVTGJ328Vt0=;
 b=TBMadfQ7qvclJsDGDRDOZARCrC/AlciwFx+7boIV1siHtht3lx93D8QrXaMaldDUfJ36cgprnZS+AFsTIJn5IM0EimZAz/nU3JV2ZirFMXnNsCZLeNsQGO5lYILYRBnEiGrV7VOB3Qi+Ef2jJqu16gDKMpiGhl3uNaabyEdWC5wtSLxwrZ6DCS0xNExH1tkmYt4zVP7YIxrP1LMvQaTKfX1ymHeT2dD6HZyxfA/fJll7JBLHYajRaF4SPsmlv7+buCZ8OhkKPvyu5WiAueBU60senAH9ScJwFuGhRDgNwf+Ud0iLxm6AO05FU+MVDBcNJYz40XsYRhqT6HYujmECOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by DU0PR03MB9566.eurprd03.prod.outlook.com (2603:10a6:10:41e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 20:24:17 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5654.014; Tue, 20 Sep 2022
 20:24:17 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v6 2/8] dt-bindings: phy: Add Lynx 10G phy binding
Date: Tue, 20 Sep 2022 16:23:50 -0400
Message-Id: <20220920202356.1451033-3-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20220920202356.1451033-1-sean.anderson@seco.com>
References: <20220920202356.1451033-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0014.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::26) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|DU0PR03MB9566:EE_
X-MS-Office365-Filtering-Correlation-Id: c66ca3f7-7aab-42f6-e5fa-08da9b46176a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	eq7hMeIbtzV2xgWzqpDVelP5Uk1aI9JtrK5KyotJh2vn9hguI9MBGcb196wLO+G0IFlrVuugGqNKcu7PkIzm4ydAdrvf2pCBJ7wUv+YIAxLmHqFxdVgAwaVVzwRYhLaX/uQ158c6ZloErQ2jk3YShTaJbavM6ue60FcN9kbz/b9GVM9PisklF/cFlmyKviUu0vOYFBDGIoS1ugEomvPMHvltF8Sg0TCiOpVNSRcY7EcTpo8qEWe23cCNs2JFTM2sVMVrf5H2LLEnJmaXSqIb2KGMDpPoWFeD1mPXO6rEZdPUTWK0x9jZKSWU/25Q1Jfmn7hrwm8pLsn/+2qja6xebDnGXr7TRgY9HKxxzH3uiHi2N9UR1CcmC81Tfm7lSsx54vbzMluyaKNk9CwH7qxaYBOmrwCr5bi2pEAhY7OPcSxBjtMHtXr4kphwhPiKyORsiJ239Cr4NBzC9AwRGFmlf0fcUCJHReLrYT338yeiU0BZYQcVEM1GZcYlpRFzP3IvwgjJgCuQjQJknkeM3vsHySjVAm/asZEhk7+udhhUpYN0J3iYmeZXtEHiKvPTtbvM0WCa5g9UkRNxt/NoM6BE41Wdf6b3gk0/UwNm77DBQ5bJSIQb/MjxI1ZwbQNlvHBVLtazunoVdLAGUww6O5qMBgTGabEiUwJ2uvbYAoFNp2mWZ6dR00s4K89VwQShiu27cX8yXuQoi8CjM0gDf4y8OWgUlYnycZIvQo8fbA4HOnMOMQ5qKtvJzPoyoPKavwwzDS21jh1/AnZn2Gajt4uXdYu5Cmq2T5DOLH17hRXAt+I=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(376002)(39850400004)(346002)(451199015)(41300700001)(38350700002)(7416002)(52116002)(6666004)(83380400001)(36756003)(6506007)(8936002)(5660300002)(110136005)(966005)(54906003)(44832011)(2906002)(86362001)(316002)(478600001)(6486002)(1076003)(38100700002)(186003)(66946007)(66556008)(66476007)(2616005)(26005)(6512007)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?JKroFfK86l1turYP70LfKNHRAblrjuyL4aJPko1J8JV1zD0Lsc77LSpMqPM/?=
 =?us-ascii?Q?t+EkWs2pMFeRglAde23fRqCM51UxZlDO9qQunjAOHIu2F77lhr/FAYmOM/D+?=
 =?us-ascii?Q?r1jqI1SAiaw8lBX77PgQ53WJ8ZIeQPaT1dBwNkpcxIy278EAres4w6Y0cF4T?=
 =?us-ascii?Q?QuqEUDb2Xr3bswQOuLN781T0yyycPJWrad0fi3jvssu95T6gi1taqF+XuZkn?=
 =?us-ascii?Q?Jq5EoWdKVVWDjhAbkg5rFNOtgteH6e1gMZsjqdA5oWDq3S03u7LfJkhU1su0?=
 =?us-ascii?Q?Gkt37y+o7Cy7oBy+rpdcTgNzLAcOTMUFRXiLzTKjL+seIcRcmNc5JAeBbRHv?=
 =?us-ascii?Q?G4TQ+Z7gjHYOOPd4UzWxTaFkc7g4FHgHSytCrdV9RlGEGoWufrpLyvNb0ZdR?=
 =?us-ascii?Q?KfEogu3nadNPXxvl9zqg7JoUIIfpwLZJ7NDrf/Ov5Q2i1iDTayqcz89EljY1?=
 =?us-ascii?Q?U+2mWRXpm70nucF/qNBy8UIlSvBX25x1/NY3nwqx/W5Py9kcTG5X5XMkzrjZ?=
 =?us-ascii?Q?HcDK6RyPQltdUcThzMYg8Y4E5tdTgMwmFpZVfB+pgoHgIg2WkWEyTcB1JTeT?=
 =?us-ascii?Q?Mn84BLbRKYpkMDkHD20SyhtmvzkgRrUr5Ayvditu3cudLtRRhyv/o5v6fq/o?=
 =?us-ascii?Q?GMoSTozn2oPPX2eeoHl36BbYij53x/84u2E/bbgyG8UwMp5xYSH11PZdpc8h?=
 =?us-ascii?Q?u5z3zFvYO6U4BoH68w0nGOiHsrjgYEGOYmDL6KJnHwA5/At7DGTX1MN/8z5R?=
 =?us-ascii?Q?OjEnROQ20U2M9VubXQp5qfH9VGYxk73ooV1H0YxJneO4XvRvouFCqspkXuPY?=
 =?us-ascii?Q?AqUA4E5xcoULWrhb/lnUInYm7GvwUNcE/WlEEpBqq47x24QJcFZptTkTIhCS?=
 =?us-ascii?Q?GcoIyMmPjkQa3nv5Z9UL0EBRySj8nYBgyoj9gQw/Tz3a/zSz0siJm9XbY4mR?=
 =?us-ascii?Q?3n/4xPnINWiGIaZOXhrJRN+YlMGWh0uIhBqPImrPsZZNSyT/RuuenjXNKv10?=
 =?us-ascii?Q?0DNDDq2z9TIwXIe+vKnzVt+fBzT5F1Syz4X6N/pykLQZX3/SwU/QnScamaGt?=
 =?us-ascii?Q?ujB/nK6k++kTcmsAzDXMETXrSBv/MnpRdgrIEd/y//DmWINw5tU3C6V0XaUZ?=
 =?us-ascii?Q?+9OBtI3Oig6uhgQuA/dGfm46TPL7KiN/uQWWOMon/gtPZCW5gotnsJEsSoJA?=
 =?us-ascii?Q?fvtoeAz3elB3BxxQTATIVp+h+2BPf5AgLKdoX4Ba4Ls7Mj+wGu2ZHsA4jp+K?=
 =?us-ascii?Q?HRfzV7qUTGZbSh2qRuVsIGj838YQzsbOm4nokXZwNAY10VbHqtbwsvZCFaH6?=
 =?us-ascii?Q?YVD4Yb7Ykwu8Y8UzfRRJNsXEjY21gT2/Jo6bGM2ZA+se3Xcg7H6rQFjGuzDj?=
 =?us-ascii?Q?fkjrPYLYAfD9ToVDIH6gMdpZYZDsSwgkFEnYjmAm/T4s1uIDPX/mADK6tOry?=
 =?us-ascii?Q?lweEWmlMNH8IIvMs+sw7jcZmXyr3WyPi1TmBbTSL4pAksOwKaYv+5+EeU+2X?=
 =?us-ascii?Q?ZFj3Qpz4Evek89Q5rHXS62bngMjYDvBFAPvExAzvZxtYhi1jDpNUhKumjMec?=
 =?us-ascii?Q?Is+6dnC7yZje0vJqDHKc7o7JVXFAclmzHlMgBgvxxW9k5vhrl0qxrMaRufhV?=
 =?us-ascii?Q?iQ=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c66ca3f7-7aab-42f6-e5fa-08da9b46176a
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 20:24:17.0806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkxReteo0MqGFHz17jfDhRLl+h/ECzEsTXhw6hZIdq3lrv8yDpuZ6Nn0hTvwX3NFShdKKMub7pVpVl93cLpXgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9566
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
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
---

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
index 000000000000..ce9afdbf33f4
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

