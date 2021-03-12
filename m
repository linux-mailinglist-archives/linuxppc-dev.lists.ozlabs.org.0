Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7B533842A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 03:55:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxVmV4vnRz3dZs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 13:55:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxVl33gm6z3cbl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 13:54:07 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 367012007AA;
 Fri, 12 Mar 2021 03:54:05 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 548B420079F;
 Fri, 12 Mar 2021 03:53:58 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id F2804402D6;
 Fri, 12 Mar 2021 03:53:48 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, linuxppc-dev@lists.ozlabs.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 3/6] ASoC: dt-bindings: fsl_rpmsg: Add binding doc for
 rpmsg audio device
Date: Fri, 12 Mar 2021 10:38:42 +0800
Message-Id: <1615516725-4975-4-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615516725-4975-1-git-send-email-shengjiu.wang@nxp.com>
References: <1615516725-4975-1-git-send-email-shengjiu.wang@nxp.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

fsl_rpmsg is a virtual audio device. Mapping to real hardware
devices are SAI, DMA controlled by Cortex M core. What we see from
Linux side is a device which provides audio service by rpmsg channel.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
new file mode 100644
index 000000000000..b4c190bddd84
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,rpmsg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP Audio RPMSG CPU DAI Controller
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
+
+description: |
+  fsl_rpmsg is a virtual audio device. Mapping to real hardware devices
+  are SAI, DMA controlled by Cortex M core. What we see from Linux
+  side is a device which provides audio service by rpmsg channel.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx7ulp-rpmsg-audio
+      - fsl,imx8mn-rpmsg-audio
+      - fsl,imx8mm-rpmsg-audio
+      - fsl,imx8mp-rpmsg-audio
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
+  clocks:
+    items:
+      - description: Peripheral clock for register access
+      - description: Master clock
+      - description: DMA clock for DMA register access
+      - description: Parent clock for multiple of 8kHz sample rates
+      - description: Parent clock for multiple of 11kHz sample rates
+
+  clock-names:
+    items:
+      - const: ipg
+      - const: mclk
+      - const: dma
+      - const: pll8k
+      - const: pll11k
+
+  power-domains:
+    description:
+      List of phandle and PM domain specifier as documented in
+      Documentation/devicetree/bindings/power/power_domain.txt
+    maxItems: 1
+
+  memory-region:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to a node describing reserved memory (System RAM memory)
+      The M core can't access all the DDR memory space on some platform,
+      So reserved a specific memory for dma buffer which M core can
+      access.
+      (see bindings/reserved-memory/reserved-memory.txt)
+
+  audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle to a node of audio codec
+
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source.
+
+  fsl,enable-lpa:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: enable low power audio path.
+
+  fsl,rpmsg-out:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      This is a boolean property. If present, the transmitting function
+      will be enabled.
+
+  fsl,rpmsg-in:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      This is a boolean property. If present, the receiving function
+      will be enabled.
+
+required:
+  - compatible
+  - model
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mn-clock.h>
+
+    rpmsg_audio: rpmsg_audio {
+        compatible = "fsl,imx8mn-rpmsg-audio";
+        model = "wm8524-audio";
+        fsl,enable-lpa;
+        fsl,rpmsg-out;
+        clocks = <&clk IMX8MN_CLK_SAI3_IPG>,
+                 <&clk IMX8MN_CLK_SAI3_ROOT>,
+                 <&clk IMX8MN_CLK_SDMA3_ROOT>,
+                 <&clk IMX8MN_AUDIO_PLL1_OUT>,
+                 <&clk IMX8MN_AUDIO_PLL2_OUT>;
+        clock-names = "ipg", "mclk", "dma", "pll8k", "pll11k";
+    };
-- 
2.27.0

