Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF8955E0CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 15:32:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXQWn49qGz3dxN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 23:32:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=heyquark.com (client-ip=2001:4b98:dc4:8::232; helo=relay12.mail.gandi.net; envelope-from=ash@heyquark.com; receiver=<UNKNOWN>)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXQW16bFJz2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 23:32:13 +1000 (AEST)
Received: (Authenticated sender: ash@heyquark.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AD13020000A;
	Tue, 28 Jun 2022 13:31:57 +0000 (UTC)
From: Ash Logan <ash@heyquark.com>
To: krzysztof.kozlowski+dt@linaro.org,
	paulus@samba.org,
	mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu,
	robh+dt@kernel.org,
	benh@kernel.crashing.org
Subject: [PATCH v3 01/12] dt-bindings: wiiu: Document the Nintendo Wii U devicetree
Date: Tue, 28 Jun 2022 23:31:33 +1000
Message-Id: <20220628133144.142185-2-ash@heyquark.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628133144.142185-1-ash@heyquark.com>
References: <20220622131037.57604-1-ash@heyquark.com>
 <20220628133144.142185-1-ash@heyquark.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linkmauve@linkmauve.fr, linux-kernel@vger.kernel.org, rw-r-r-0644@protonmail.com, joel@jms.id.au, linuxppc-dev@lists.ozlabs.org, j.ne@posteo.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adds schema for the various Wii U devicetree nodes used.

Signed-off-by: Ash Logan <ash@heyquark.com>
---
 .../bindings/powerpc/nintendo/wiiu.yaml       | 28 +++++++++++
 .../powerpc/nintendo/wiiu/espresso-pic.yaml   | 42 +++++++++++++++++
 .../bindings/powerpc/nintendo/wiiu/gpu7.yaml  | 41 +++++++++++++++++
 .../powerpc/nintendo/wiiu/latte-ahci.yaml     | 43 +++++++++++++++++
 .../powerpc/nintendo/wiiu/latte-dsp.yaml      | 35 ++++++++++++++
 .../powerpc/nintendo/wiiu/latte-pic.yaml      | 46 +++++++++++++++++++
 .../powerpc/nintendo/wiiu/latte-sdhci.yaml    | 40 ++++++++++++++++
 .../bindings/powerpc/nintendo/wiiu/latte.yaml | 25 ++++++++++
 8 files changed, 300 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu.yaml
 create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/espresso-pic.yaml
 create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/gpu7.yaml
 create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-ahci.yaml
 create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-dsp.yaml
 create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-pic.yaml
 create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-sdhci.yaml
 create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml

diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu.yaml
new file mode 100644
index 000000000000..5824b07928f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/powerpc/nintendo/wiiu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nintendo Wii U bindings
+
+maintainers:
+  - Ash Logan <ash@heyquark.com>
+  - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
+
+description: |
+  Nintendo Wii U video game console binding.
+
+properties:
+  $nodename:
+    const: "/"
+  compatible:
+    oneOf:
+      - description: Nintendo Wii U video game console
+        items:
+          - const: nintendo,wiiu
+
+additionalProperties: true
+
+...
diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/espresso-pic.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/espresso-pic.yaml
new file mode 100644
index 000000000000..878a81595f5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/espresso-pic.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/powerpc/nintendo/wiiu/espresso-pic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nintendo Wii U "Espresso" interrupt controller
+
+maintainers:
+  - Ash Logan <ash@heyquark.com>
+  - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
+
+description: |
+  Interrupt controller found on the Nintendo Wii U for the "Espresso" processor.
+
+properties:
+  compatible:
+    oneOf:
+      - description: Nintendo Wii U "Espresso" interrupt controller
+        items:
+          - const: nintendo,espresso-pic
+  '#interrupt-cells':
+    # Interrupt numbers 0-32 in one cell
+    const: 1
+  interrupt-controller: true
+  reg:
+    items:
+      - description: Core registers
+
+additionalProperties: false
+
+examples:
+  - |
+    espresso_pic: pic@c000078 {
+            #interrupt-cells = <1>;
+            interrupt-controller;
+
+            compatible = "nintendo,espresso-pic";
+            reg = <0x0c000078 0x18>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/gpu7.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/gpu7.yaml
new file mode 100644
index 000000000000..e54d49015f36
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/gpu7.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/powerpc/nintendo/wiiu/gpu7.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nintendo Wii U Latte "GPU7" graphics processor
+
+maintainers:
+  - Ash Logan <ash@heyquark.com>
+  - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
+
+description: |
+  GPU7 graphics processor, also known as "GX2", found in the Latte multifunction chip of the
+  Nintendo Wii U.
+
+properties:
+  compatible:
+    oneOf:
+      - description: Nintendo Wii U Latte "GPU7" graphics processor
+        items:
+          - const: nintendo,latte-gpu7
+  reg:
+    items:
+      - description: GpuF0MMReg registers
+  interrupts:
+    items:
+      - description: Main interrupt, connected via Espresso PIC
+
+# This will likely get bound to the Radeon driver one day, which will neccesitate extra properties
+additionalProperties: true
+
+examples:
+  - |
+    gpu7@c200000 {
+            compatible = "nintendo,latte-gpu7";
+            reg = <0x0c200000 0x80000>;
+            interrupts = <2>;
+            interrupt-parent = <&espresso_pic>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-ahci.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-ahci.yaml
new file mode 100644
index 000000000000..7b9de4effcb0
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-ahci.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/powerpc/nintendo/wiiu/latte-ahci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nintendo Wii U Latte AHCI controller
+
+maintainers:
+  - Ash Logan <ash@heyquark.com>
+  - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
+
+description: |
+  Nintendo Wii U AHCI SATA controller, as found in the Latte chip.
+
+properties:
+  compatible:
+    oneOf:
+      - description: Nintendo Wii U Latte AHCI controller
+        items:
+          - const: nintendo,latte-ahci
+  reg:
+    items:
+      - description: |
+          HBA memory registers. Note that unlike the spec, space for only 6 ports exist, with 2 vendor
+          registers afterwards, thus register space should be 0x408 long (0x100+0x80*6+0x8).
+  interrupts:
+    items:
+      - description: Main HBA interrupt
+      - description: Vendor debugging interrupt
+
+additionalProperties: false
+
+examples:
+  - |
+    sata: ahci@d160400 {
+          compatible = "nintendo,latte-ahci";
+          reg = <0x0d160400 0x408>;
+
+          interrupt-parent = <&latte_pic>;
+          interrupts = <38>, <28>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-dsp.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-dsp.yaml
new file mode 100644
index 000000000000..ed0b4c28ce48
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-dsp.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/powerpc/nintendo/wiiu/latte-dsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nintendo Wii U Latte DSP
+
+maintainers:
+  - Ash Logan <ash@heyquark.com>
+  - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
+
+description: |
+  Nintendo Wii U digital signal processor, as found in the Latte chip.
+
+properties:
+  compatible:
+    oneOf:
+      - description: Nintendo Wii U Latte DSP
+        items:
+          - const: nintendo,latte-dsp
+  reg:
+    items:
+      - description: DSP registers
+
+# Once more is known about this device more properties will likely be added
+additionalProperties: true
+
+examples:
+  - |
+    latte_dsp: dsp@c005000 {
+         compatible = "nintendo,latte-dsp";
+         reg = <0x0c005000 0x200>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-pic.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-pic.yaml
new file mode 100644
index 000000000000..a2df71fb9964
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-pic.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/powerpc/nintendo/wiiu/latte-pic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nintendo Wii U Latte interrupt controller
+
+maintainers:
+  - Ash Logan <ash@heyquark.com>
+  - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
+
+description: |
+  Interrupt controller found on the Nintendo Wii U for the "Latte" devices.
+
+properties:
+  compatible:
+    oneOf:
+      - description: Nintendo Wii U Latte interrupt controller
+        items:
+          - const: nintendo,latte-pic
+  '#interrupt-cells':
+    # Interrupt numbers 0-64 in one cell.
+    const: 1
+  interrupt-controller: true
+  reg:
+    items:
+      - description: Core registers
+  interrupts:
+    items:
+      - description: Cascade interrupt for Espresso PIC
+
+additionalProperties: false
+
+examples:
+  - |
+    latte_pic: pic@d800440 {
+         #interrupt-cells = <1>;
+         interrupt-controller;
+
+         compatible = "nintendo,latte-pic";
+         reg = <0x0d800440 0x30>;
+         interrupt-parent = <&espresso_pic>;
+         interrupts = <24>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-sdhci.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-sdhci.yaml
new file mode 100644
index 000000000000..4b9b0820edc1
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-sdhci.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/powerpc/nintendo/wiiu/latte-sdhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nintendo Wii U Latte SD Host controller
+
+maintainers:
+  - Ash Logan <ash@heyquark.com>
+  - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
+
+description: |
+  SDHCI hosts found on the Nintendo Wii U's Latte SoC for SD cards and SDIO devices.
+
+properties:
+  compatible:
+    oneOf:
+      - description: Nintendo Wii U Latte SDHCI
+        items:
+          - const: nintendo,latte-sdhci
+          - const: sdhci
+  reg:
+    items:
+      - description: Core registers
+  interrupts:
+    items:
+      - description: SDHCI interrupt
+
+additionalProperties: false
+
+examples:
+  - |
+    sdcard_0: sdhci@d070000 {
+          compatible = "nintendo,latte-sdhci","sdhci";
+          reg = <0x0d070000 0x200>;
+          interrupts = <7>;
+          interrupt-parent = <&latte_pic>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
new file mode 100644
index 000000000000..6ae86d198fa3
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/powerpc/nintendo/wiiu/latte.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Latte system bus
+
+maintainers:
+  - Ash Logan <ash@heyquark.com>
+  - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
+
+description: |
+  Latte multi-function SoC, containing many of the devices found on the Nintendo Wii U.
+
+properties:
+  compatible:
+    oneOf:
+      - description: Nintendo Wii U "Latte" SoC
+        items:
+          - const: nintendo,latte
+
+additionalProperties: true
+
+...
-- 
2.36.1

