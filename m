Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5338C4B7E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 05:32:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdhkD0f2yz30WJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 13:32:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdhjW0v5Xz30Np
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2024 13:31:43 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8D9E32017D4;
	Tue, 14 May 2024 05:31:40 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EE4582017CF;
	Tue, 14 May 2024 05:31:39 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B90D0180222F;
	Tue, 14 May 2024 11:31:37 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] ASoC: dt-bindings: fsl,xcvr: Add compatible string for i.MX95
Date: Tue, 14 May 2024 11:12:08 +0800
Message-Id: <1715656329-8061-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1715656329-8061-1-git-send-email-shengjiu.wang@nxp.com>
References: <1715656329-8061-1-git-send-email-shengjiu.wang@nxp.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add compatible string "fsl,imx95-xcvr" for i.MX95 platform.

The difference between each platform is in below table.

+---------+--------+----------+--------+
|  SOC	  |  PHY   | eARC/ARC | SPDIF  |
+---------+--------+----------+--------+
| i.MX8MP |  V1    |  Yes     |  Yes   |
+---------+--------+----------+--------+
| i.MX93  |  N/A   |  N/A     |  Yes   |
+---------+--------+----------+--------+
| i.MX95  |  V2    |  N/A     |  Yes   |
+---------+--------+----------+--------+

On i.MX95, there are two PLL clock sources, they are the parent
clocks of the XCVR root clock. one is for 8kHz series rates, named
as 'pll8k', another one is for 11kHz series rates, named as 'pll11k'.
They are optional clocks, if there are such clocks, then the driver
can switch between them to support more accurate sample rates.

As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4'
for clocks and clock-names properties.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../devicetree/bindings/sound/fsl,xcvr.yaml   | 55 +++++++++++++++----
 1 file changed, 45 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
index 0eb0c1ba8710..70bcde33e986 100644
--- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
@@ -22,6 +22,7 @@ properties:
     enum:
       - fsl,imx8mp-xcvr
       - fsl,imx93-xcvr
+      - fsl,imx95-xcvr
 
   reg:
     items:
@@ -44,18 +45,12 @@ properties:
     minItems: 1
 
   clocks:
-    items:
-      - description: Peripheral clock
-      - description: PHY clock
-      - description: SPBA clock
-      - description: PLL clock
+    minItems: 4
+    maxItems: 6
 
   clock-names:
-    items:
-      - const: ipg
-      - const: phy
-      - const: spba
-      - const: pll_ipg
+    minItems: 4
+    maxItems: 6
 
   dmas:
     items:
@@ -97,6 +92,46 @@ allOf:
       properties:
         interrupts:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx95-xcvr
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Peripheral clock
+            - description: PHY clock
+            - description: SPBA clock
+            - description: PLL clock
+            - description: PLL clock source for 8kHz series
+            - description: PLL clock source for 11kHz series
+          minItems: 4
+        clock-names:
+          items:
+            - const: ipg
+            - const: phy
+            - const: spba
+            - const: pll_ipg
+            - const: pll8k
+            - const: pll11k
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Peripheral clock
+            - description: PHY clock
+            - description: SPBA clock
+            - description: PLL clock
+        clock-names:
+          items:
+            - const: ipg
+            - const: phy
+            - const: spba
+            - const: pll_ipg
 
 additionalProperties: false
 
-- 
2.34.1

