Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F496AE201
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 15:17:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWHZb0JV6z3cMl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 01:17:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=UHIZFpu3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::231; helo=relay11.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=UHIZFpu3;
	dkim-atps=neutral
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWHXp1d7kz3bP1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Mar 2023 01:15:37 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id C4DA110000B;
	Tue,  7 Mar 2023 14:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678198535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4eCyez3rsGHNa1ju/xOVLqn68UTPKLtsV9g1+e7lV8=;
	b=UHIZFpu3lCBgJz7KKwZ7aQJ26GxIT+OSAWI8vPgBnPNulHrt8VJ4UIyOzBqWnx0f3BVIFp
	LYb4QZrf0hIN4+9ETpJUqTdN5Ancw9VyEdilqozSw09qvJdU3dAhKWiStt7S8KQxNKZ5kM
	ruGZj8f6MkD/sHKo7HZwEySUSwedo0mi+gCT37vHKu07UTYfp4SLRKWN6/mrmquZdN6tXN
	rcHK0uBqYHzYLbKP77ra4TPTTubUM7fa/XHTq5MLOu2QwtS2ai2fmLIeAIx7CdIq3lyKXI
	RLtPUykdE9fkbu4sDdAB5n9Bj4Qgt8TklE47MiQAwGVj7zk8fe+0m9eJ9nTq1A==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH 1/3] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc: Remove unneeded property
Date: Tue,  7 Mar 2023 15:15:01 +0100
Message-Id: <20230307141503.159766-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307141503.159766-1-herve.codina@bootlin.com>
References: <20230307141503.159766-1-herve.codina@bootlin.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove the unneeded and unused #fsl,chan-cells property.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml      | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
index 4ebbc7d52981..ec888f48cac8 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
@@ -59,14 +59,6 @@ properties:
   '#size-cells':
     const: 0
 
-  '#fsl,chan-cells':
-    $ref: /schemas/types.yaml#/definitions/uint32
-    const: 1
-    description:
-      QMC consumers that use a phandle to QMC need to pass the channel number
-      with this phandle.
-      For instance "fsl,qmc-chan = <&qmc 16>;".
-
 patternProperties:
   '^channel@([0-9]|[1-5][0-9]|6[0-3])$':
     description:
@@ -121,7 +113,6 @@ required:
   - fsl,tsa-serial
   - '#address-cells'
   - '#size-cells'
-  - '#fsl,chan-cells'
 
 additionalProperties: false
 
@@ -140,7 +131,6 @@ examples:
 
         #address-cells = <1>;
         #size-cells = <0>;
-        #fsl,chan-cells = <1>;
 
         fsl,tsa-serial = <&tsa FSL_CPM_TSA_SCC4>;
 
-- 
2.39.2

