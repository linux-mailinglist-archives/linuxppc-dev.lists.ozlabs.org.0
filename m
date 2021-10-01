Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C0441E57A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 02:18:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HL9gg2Sxmz3ckC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 10:18:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HL9dX0pGJz2xgP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 10:16:31 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 66EB1200AC0;
 Fri,  1 Oct 2021 02:09:30 +0200 (CEST)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com
 [134.27.49.11])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 009E9200B9B;
 Fri,  1 Oct 2021 02:09:30 +0200 (CEST)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.142])
 by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id
 2724840A77; Thu, 30 Sep 2021 17:09:29 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: memory: fsl: convert ifc binding to yaml
 schema
Date: Thu, 30 Sep 2021 19:09:20 -0500
Message-Id: <20211001000924.15421-2-leoyang.li@nxp.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b
In-Reply-To: <20211001000924.15421-1-leoyang.li@nxp.com>
References: <20211001000924.15421-1-leoyang.li@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert the txt binding to yaml format and add description.  Drop the
"simple-bus" compatible string from the example and not allowed by the
binding any more.  This will help to enforce the correct probe order
between parent device and child devices, but will require the ifc driver
to probe the child devices to work properly.

Signed-off-by: Li Yang <leoyang.li@nxp.com>
---
updates from previous submission:
- Drop "simple-bus" from binding and only "fsl,ifc" as compatible
- Fix one identiation problem of "reg"
- Add type restriction to "little-endian" property

 .../bindings/memory-controllers/fsl/ifc.txt   |  82 -----------
 .../bindings/memory-controllers/fsl/ifc.yaml  | 137 ++++++++++++++++++
 2 files changed, 137 insertions(+), 82 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/fsl/ifc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
deleted file mode 100644
index 89427b018ba7..000000000000
--- a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
+++ /dev/null
@@ -1,82 +0,0 @@
-Integrated Flash Controller
-
-Properties:
-- name : Should be ifc
-- compatible : should contain "fsl,ifc". The version of the integrated
-               flash controller can be found in the IFC_REV register at
-               offset zero.
-
-- #address-cells : Should be either two or three.  The first cell is the
-                   chipselect number, and the remaining cells are the
-                   offset into the chipselect.
-- #size-cells : Either one or two, depending on how large each chipselect
-                can be.
-- reg : Offset and length of the register set for the device
-- interrupts: IFC may have one or two interrupts.  If two interrupt
-              specifiers are present, the first is the "common"
-              interrupt (CM_EVTER_STAT), and the second is the NAND
-              interrupt (NAND_EVTER_STAT).  If there is only one,
-              that interrupt reports both types of event.
-
-- little-endian : If this property is absent, the big-endian mode will
-                  be in use as default for registers.
-
-- ranges : Each range corresponds to a single chipselect, and covers
-           the entire access window as configured.
-
-Child device nodes describe the devices connected to IFC such as NOR (e.g.
-cfi-flash) and NAND (fsl,ifc-nand). There might be board specific devices
-like FPGAs, CPLDs, etc.
-
-Example:
-
-	ifc@ffe1e000 {
-		compatible = "fsl,ifc", "simple-bus";
-		#address-cells = <2>;
-		#size-cells = <1>;
-		reg = <0x0 0xffe1e000 0 0x2000>;
-		interrupts = <16 2 19 2>;
-		little-endian;
-
-		/* NOR, NAND Flashes and CPLD on board */
-		ranges = <0x0 0x0 0x0 0xee000000 0x02000000
-			  0x1 0x0 0x0 0xffa00000 0x00010000
-			  0x3 0x0 0x0 0xffb00000 0x00020000>;
-
-		flash@0,0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "cfi-flash";
-			reg = <0x0 0x0 0x2000000>;
-			bank-width = <2>;
-			device-width = <1>;
-
-			partition@0 {
-				/* 32MB for user data */
-				reg = <0x0 0x02000000>;
-				label = "NOR Data";
-			};
-		};
-
-		flash@1,0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,ifc-nand";
-			reg = <0x1 0x0 0x10000>;
-
-			partition@0 {
-				/* This location must not be altered  */
-				/* 1MB for u-boot Bootloader Image */
-				reg = <0x0 0x00100000>;
-				label = "NAND U-Boot Image";
-				read-only;
-			};
-		};
-
-		cpld@3,0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,p1010rdb-cpld";
-			reg = <0x3 0x0 0x000001f>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.yaml b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.yaml
new file mode 100644
index 000000000000..19871ce39fe3
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/fsl/ifc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: FSL/NXP Integrated Flash Controller
+
+maintainers:
+  - Li Yang <leoyang.li@nxp.com>
+
+description: |
+  NXP's integrated flash controller (IFC) is an advanced version of the
+  enhanced local bus controller which includes similar programming and signal
+  interfaces with an extended feature set. The IFC provides access to multiple
+  external memory types, such as NAND flash (SLC and MLC), NOR flash, EPROM,
+  SRAM and other memories where address and data are shared on a bus.
+
+properties:
+  $nodename:
+    pattern: "^ifc@[0-9a-f]+$"
+
+  compatible:
+    const: fsl,ifc
+
+  "#address-cells":
+    enum: [2, 3]
+    description: |
+      Should be either two or three.  The first cell is the chipselect
+      number, and the remaining cells are the offset into the chipselect.
+
+  "#size-cells":
+    enum: [1, 2]
+    description: |
+      Either one or two, depending on how large each chipselect can be.
+
+  reg:
+    maxItems: 1
+    description: |
+      Offset and length of the register set for the device.
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+    description: |
+      IFC may have one or two interrupts.  If two interrupt specifiers are
+      present, the first is the "common" interrupt (CM_EVTER_STAT), and the
+      second is the NAND interrupt (NAND_EVTER_STAT).  If there is only one,
+      that interrupt reports both types of event.
+
+  little-endian:
+    $ref: '/schemas/types.yaml#/definitions/flag'
+    description: |
+      If this property is absent, the big-endian mode will be in use as default
+      for registers.
+
+  ranges:
+    description: |
+      Each range corresponds to a single chipselect, and covers the entire
+      access window as configured.
+
+patternProperties:
+  "^.*@[a-f0-9]+(,[a-f0-9]+)+$":
+    type: object
+    description: |
+      Child device nodes describe the devices connected to IFC such as NOR (e.g.
+      cfi-flash) and NAND (fsl,ifc-nand). There might be board specific devices
+      like FPGAs, CPLDs, etc.
+
+    required:
+      - compatible
+      - reg
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ifc@ffe1e000 {
+            compatible = "fsl,ifc";
+            #address-cells = <2>;
+            #size-cells = <1>;
+            reg = <0x0 0xffe1e000 0 0x2000>;
+            interrupts = <16 2 19 2>;
+            little-endian;
+
+            /* NOR, NAND Flashes and CPLD on board */
+            ranges = <0x0 0x0 0x0 0xee000000 0x02000000>,
+                     <0x1 0x0 0x0 0xffa00000 0x00010000>,
+                     <0x3 0x0 0x0 0xffb00000 0x00020000>;
+
+            flash@0,0 {
+                #address-cells = <1>;
+                #size-cells = <1>;
+                compatible = "cfi-flash";
+                reg = <0x0 0x0 0x2000000>;
+                bank-width = <2>;
+                device-width = <1>;
+
+                partition@0 {
+                    /* 32MB for user data */
+                    reg = <0x0 0x02000000>;
+                    label = "NOR Data";
+                };
+            };
+
+            flash@1,0 {
+                #address-cells = <1>;
+                #size-cells = <1>;
+                compatible = "fsl,ifc-nand";
+                reg = <0x1 0x0 0x10000>;
+
+                partition@0 {
+                    /* This location must not be altered  */
+                    /* 1MB for u-boot Bootloader Image */
+                    reg = <0x0 0x00100000>;
+                    label = "NAND U-Boot Image";
+                    read-only;
+                };
+            };
+
+            cpld@3,0 {
+                #address-cells = <1>;
+                #size-cells = <1>;
+                compatible = "fsl,p1010rdb-cpld";
+                reg = <0x3 0x0 0x000001f>;
+            };
+        };
+    };
-- 
2.25.1

