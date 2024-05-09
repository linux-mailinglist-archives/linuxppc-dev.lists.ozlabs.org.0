Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8728C0A15
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 05:19:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZcgd3khPz3cYR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 13:19:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZcfq5vktz3c4h
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 13:18:43 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2FF3F200845;
	Thu,  9 May 2024 05:18:41 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D8AC42007D5;
	Thu,  9 May 2024 05:18:40 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B5AC3180222F;
	Thu,  9 May 2024 11:18:38 +0800 (+08)
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
Subject: [PATCH 2/4] ASoC: dt-bindings: fsl,xcvr: Add two PLL clock sources
Date: Thu,  9 May 2024 10:57:38 +0800
Message-Id: <1715223460-32662-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1715223460-32662-1-git-send-email-shengjiu.wang@nxp.com>
References: <1715223460-32662-1-git-send-email-shengjiu.wang@nxp.com>
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

Add two PLL clock sources, they are the parent clocks of the root clock
one is for 8kHz series rates, named as 'pll8k', another one is for
11kHz series rates, named as 'pll11k'. They are optional clocks,
if there are such clocks, then the driver can switch between them to
support more accurate sample rates.

As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4' for
clocks and clock-names properties.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,xcvr.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
index 1c74a32def09..c4660faed404 100644
--- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
@@ -50,6 +50,9 @@ properties:
       - description: PHY clock
       - description: SPBA clock
       - description: PLL clock
+      - description: PLL clock source for 8kHz series
+      - description: PLL clock source for 11kHz series
+    minItems: 4
 
   clock-names:
     items:
@@ -57,6 +60,9 @@ properties:
       - const: phy
       - const: spba
       - const: pll_ipg
+      - const: pll8k
+      - const: pll11k
+    minItems: 4
 
   dmas:
     items:
-- 
2.34.1

