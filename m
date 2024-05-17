Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C32678C847E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 12:06:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgjK40hxMz2yvv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 20:06:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgjJd66BDz2yN8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 20:05:37 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D0A601A04A4;
	Fri, 17 May 2024 12:05:34 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 86D221A0F4C;
	Fri, 17 May 2024 12:05:34 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id DFB7B1820F76;
	Fri, 17 May 2024 18:05:32 +0800 (+08)
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
Subject: [PATCH 1/2] ASoC: dt-bindings: fsl,mqs: Add i.MX95 platform support
Date: Fri, 17 May 2024 17:45:45 +0800
Message-Id: <1715939146-13031-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1715939146-13031-1-git-send-email-shengjiu.wang@nxp.com>
References: <1715939146-13031-1-git-send-email-shengjiu.wang@nxp.com>
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

In order to support the MQS module on i.MX95, a new property
"fsl,mqs-ctrl" needs to be added, as there are two MQS instances
on the i.MX95 platform, the definition of bit positions in the
control register is different. This new property is to distinguish
these two instances.

Without this property, the difference of platforms except the
i.MX95 was handled by the driver itself. But this new property can
also be used for previous platforms.

The MQS only has one control register, the register may be
in General Purpose Register memory space, or MQS its own
memory space, or controlled by System Manager.
The bit position in the register may be different for each
platform, there are four parts (bits for module enablement,
bits for reset, bits for oversampling ratio, bits for divider ratio).
This new property includes all these things.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../devicetree/bindings/sound/fsl,mqs.yaml      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,mqs.yaml b/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
index 8b33353a80ca..a2129b7cb147 100644
--- a/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
@@ -23,6 +23,7 @@ properties:
       - fsl,imx8qm-mqs
       - fsl,imx8qxp-mqs
       - fsl,imx93-mqs
+      - fsl,imx95-mqs
 
   clocks:
     minItems: 1
@@ -45,6 +46,22 @@ properties:
   resets:
     maxItems: 1
 
+  fsl,mqs-ctrl:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 6
+    maxItems: 6
+    description: |
+      Contains the control register information, defined as,
+      Cell #1: register type
+               0 - the register in owned register map
+               1 - the register in general purpose register map
+               2 - the register in control of system manager
+      Cell #2: offset of the control register from the syscon
+      Cell #3: shift bits for module enable bit
+      Cell #4: shift bits for reset bit
+      Cell #5: shift bits for oversampling ratio bit
+      Cell #6: shift bits for divider ratio control bit
+
 required:
   - compatible
   - clocks
-- 
2.34.1

