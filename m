Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BC76AE205
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 15:18:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWHbY0mmxz3f88
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 01:18:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=XzLez+du;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::231; helo=relay11.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=XzLez+du;
	dkim-atps=neutral
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWHY01CqZz3cjN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Mar 2023 01:15:47 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 820AE100005;
	Tue,  7 Mar 2023 14:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678198541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ET/UXHmrkXcf+pOcInV5MX9zXz5Mj7BURNrQo+ZfWCw=;
	b=XzLez+du8FeeI4DCR/KP8lwA8qxzFOA4ok+n/RuX3h+qB2lEPfiX2sGMOyIrkNIzk3GyaD
	KkZxE7y/5BdrSylfbnyfCc4muyAG7l0Kt8FIjz4M9C9YCULSHp6PomxvwaQIQ6BsedOdyu
	6p5OVW4kQ8ze5QVdabdLqXTN1tx2cmTnd3IDz7HddXHQFINgv0Y6Dbw0oVUhwgyHd9kUu6
	CURjWqBXzB58NDILtyDd9rCw/0K+M5BteW8VLd6KtkAjV7HGEhx6AQg58RvLiy+OhY6ShP
	DTPmMVRZQXxtVdq9tURvWFDA7xauDcqG9HJIA//oHchGEceqy+glbKnd2pZ+Pg==
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
Subject: [PATCH 2/3] dt-bindings: soc: fsl: cpm_qe: cpm1-tsa: Remove unneeded property
Date: Tue,  7 Mar 2023 15:15:02 +0100
Message-Id: <20230307141503.159766-3-herve.codina@bootlin.com>
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

Remove the unneeded and unused #fsl,serial-cells property.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml          | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml
index 332e902bcc21..7e51c639a79a 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml
@@ -38,14 +38,6 @@ properties:
   '#size-cells':
     const: 0
 
-  '#fsl,serial-cells':
-    $ref: /schemas/types.yaml#/definitions/uint32
-    const: 1
-    description:
-      TSA consumers that use a phandle to TSA need to pass the serial identifier
-      with this phandle (defined in dt-bindings/soc/fsl,tsa.h).
-      For instance "fsl,tsa-serial = <&tsa FSL_CPM_TSA_SCC4>;".
-
 patternProperties:
   '^tdm@[0-1]$':
     description:
@@ -174,7 +166,6 @@ required:
   - reg-names
   - '#address-cells'
   - '#size-cells'
-  - '#fsl,serial-cells'
 
 additionalProperties: false
 
@@ -190,7 +181,6 @@ examples:
 
         #address-cells = <1>;
         #size-cells = <0>;
-        #fsl,serial-cells = <1>;
 
         tdm@0 {
             /* TDMa */
-- 
2.39.2

