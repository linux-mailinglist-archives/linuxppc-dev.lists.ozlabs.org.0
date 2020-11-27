Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C242C5FCC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 06:39:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cj3N90S1qzDrPB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 16:39:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cj3LL2jd9zDrBg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 16:37:45 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4F6D71A0E73;
 Fri, 27 Nov 2020 06:37:42 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 31B091A0793;
 Fri, 27 Nov 2020 06:37:37 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id EF3A14029B;
 Fri, 27 Nov 2020 06:37:29 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: imx-hdmi: Add binding doc for hdmi
 machine driver
Date: Fri, 27 Nov 2020 13:30:20 +0800
Message-Id: <1606455021-18882-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
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

Imx-hdmi is a new added machine driver for supporting hdmi devices
on i.MX platforms. There is HDMI IP or external HDMI modules connect
with SAI or AUD2HTX interface.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../bindings/sound/imx-audio-hdmi.yaml        | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-hdmi.yaml b/Documentation/devicetree/bindings/sound/imx-audio-hdmi.yaml
new file mode 100644
index 000000000000..d5474f83ac2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/imx-audio-hdmi.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/imx-audio-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX audio complex with HDMI
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx-audio-hdmi
+      - fsl,imx-audio-sii902x
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
+  audio-cpu:
+    description: The phandle of an CPU DAI controller
+
+  hdmi-out:
+    description: |
+      This is a boolean property. If present, the transmitting function
+      of HDMI will be enabled, indicating there's a physical HDMI out
+      connector or jack on the board or it's connecting to some other IP
+      block, such as an HDMI encoder or display-controller.
+
+  hdmi-in:
+    description: |
+      This is a boolean property. If present, the receiving function of
+      HDMI will be enabled, indicating there is a physical HDMI in
+      connector/jack on the board.
+
+required:
+  - compatible
+  - model
+  - audio-cpu
+
+additionalProperties: false
+
+examples:
+  - |
+    sound-hdmi {
+        compatible = "fsl,imx-audio-hdmi";
+        model = "audio-hdmi";
+        audio-cpu = <&aud2htx>;
+        hdmi-out;
+    };
-- 
2.27.0

