Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4AF1AC1D1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 14:53:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492zgH6HcSzDrcF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 22:53:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492zDX3VBKzDrRt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 22:34:04 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C80CA200CDC;
 Thu, 16 Apr 2020 14:34:01 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F0125200CEB;
 Thu, 16 Apr 2020 14:33:55 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id E253D40305;
 Thu, 16 Apr 2020 20:33:48 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: [PATCH v9 6/7] ASoC: dt-bindings: fsl_easrc: Add document for EASRC
Date: Thu, 16 Apr 2020 20:25:36 +0800
Message-Id: <3195cad960113a089d63c10e2268d63b253a69c5.1587038908.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1587038908.git.shengjiu.wang@nxp.com>
References: <cover.1587038908.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1587038908.git.shengjiu.wang@nxp.com>
References: <cover.1587038908.git.shengjiu.wang@nxp.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

EASRC (Enhanced Asynchronous Sample Rate Converter) is a new
IP module found on i.MX8MN.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sound/fsl,easrc.yaml  | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
new file mode 100644
index 000000000000..73cdcf053a9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP Asynchronous Sample Rate Converter (ASRC) Controller
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
+
+properties:
+  $nodename:
+    pattern: "^easrc@.*"
+
+  compatible:
+    const: fsl,imx8mn-easrc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Peripheral clock
+
+  clock-names:
+    items:
+      - const: mem
+
+  dmas:
+    maxItems: 8
+
+  dma-names:
+    items:
+      - const: ctx0_rx
+      - const: ctx0_tx
+      - const: ctx1_rx
+      - const: ctx1_tx
+      - const: ctx2_rx
+      - const: ctx2_tx
+      - const: ctx3_rx
+      - const: ctx3_tx
+
+  firmware-name:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/string
+      - const: imx/easrc/easrc-imx8mn.bin
+    description: The coefficient table for the filters
+
+  fsl,asrc-rate:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 8000
+      - maximum: 192000
+    description: Defines a mutual sample rate used by DPCM Back Ends
+
+  fsl,asrc-format:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [2, 6, 10, 32, 36]
+        default: 2
+    description:
+      Defines a mutual sample format used by DPCM Back Ends
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+  - firmware-name
+  - fsl,asrc-rate
+  - fsl,asrc-format
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mn-clock.h>
+
+    easrc: easrc@300c0000 {
+           compatible = "fsl,imx8mn-easrc";
+           reg = <0x0 0x300c0000 0x0 0x10000>;
+           interrupts = <0x0 122 0x4>;
+           clocks = <&clk IMX8MN_CLK_ASRC_ROOT>;
+           clock-names = "mem";
+           dmas = <&sdma2 16 23 0> , <&sdma2 17 23 0>,
+                  <&sdma2 18 23 0> , <&sdma2 19 23 0>,
+                  <&sdma2 20 23 0> , <&sdma2 21 23 0>,
+                  <&sdma2 22 23 0> , <&sdma2 23 23 0>;
+           dma-names = "ctx0_rx", "ctx0_tx",
+                       "ctx1_rx", "ctx1_tx",
+                       "ctx2_rx", "ctx2_tx",
+                       "ctx3_rx", "ctx3_tx";
+           firmware-name = "imx/easrc/easrc-imx8mn.bin";
+           fsl,asrc-rate  = <8000>;
+           fsl,asrc-format = <2>;
+    };
-- 
2.21.0

