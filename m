Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 657547B145F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 09:14:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=G/yLwZWG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rx4VT0y2Dz3df8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 17:14:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=G/yLwZWG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.200; helo=relay7-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rx4LK22NHz3c9x
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 17:07:36 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 23DE620004;
	Thu, 28 Sep 2023 07:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695884854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=exqU44vp0OQhVVoPYW7chAWLNAw8ghblo4zFam/LWAs=;
	b=G/yLwZWGtW3jYAR0bAZcO6glJTXnfqy0TxdVYNVsTh0sw7G815KnSpFlkJ1QnVwLgmA6S8
	ox3I6lYkzQFlFTCQ2yiF32mdC+cQCNZgYZOxGtFDtcI8wgNegtYAKMyyLunHWwpxgWcUQo
	Qpc0VPrKxBlSSI/6vwD5OcFn7ONURR1M0IltMc9yV4JTV1UqPTTo1CPdvQJbGMWYOPgbPu
	GE5dbVnDD+Tki98UUIS8zBnX+NFGw13P7/I0s+9aofptTVtxQq26Hb+6TXstK6vRoeFSig
	2+lbKUTW5AkuJeGzTH+EMCFtHPdiIpZL4/SwFqQvX0P5AT5032iAG56F3UK4uQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v7 08/30] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc: Add support for QMC HDLC
Date: Thu, 28 Sep 2023 09:06:26 +0200
Message-ID: <20230928070652.330429-9-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928070652.330429-1-herve.codina@bootlin.com>
References: <20230928070652.330429-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Rob Herring <robh@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Simon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The QMC (QUICC mutichannel controller) is a controller present in some
PowerQUICC SoC such as MPC885.
The QMC HDLC uses the QMC controller to transfer HDLC data.

Additionally, a framer can be connected to the QMC HDLC.
If present, this framer is the interface between the TDM bus used by the
QMC HDLC and the E1/T1 line.
The QMC HDLC can use this framer to get information about the E1/T1 line
and configure the E1/T1 line.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml      | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
index 82d9beb48e00..e802e25923aa 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
@@ -101,6 +101,32 @@ patternProperties:
           Channel assigned Rx time-slots within the Rx time-slots routed by the
           TSA to this cell.
 
+      compatible:
+        items:
+          - enum:
+              - fsl,mpc885-scc-qmc-hdlc
+              - fsl,mpc866-scc-qmc-hdlc
+          - const: fsl,cpm1-scc-qmc-hdlc
+          - const: fsl,qmc-hdlc
+
+      fsl,framer:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          phandle to the framer node. The framer is in charge of an E1/T1 line
+          interface connected to the TDM bus. It can be used to get the E1/T1 line
+          status such as link up/down.
+
+    allOf:
+      - if:
+          properties:
+            compatible:
+              not:
+                contains:
+                  const: fsl,qmc-hdlc
+        then:
+          properties:
+            fsl,framer: false
+
     required:
       - reg
       - fsl,tx-ts-mask
@@ -155,9 +181,13 @@ examples:
 
         channel@19 {
             /* Ch19 : 8 TS (TS 8..15) from all routed from TSA */
+            compatible = "fsl,mpc885-scc-qmc-hdlc",
+                         "fsl,cpm1-scc-qmc-hdlc",
+                         "fsl,qmc-hdlc";
             reg = <19>;
             fsl,operational-mode = "hdlc";
             fsl,tx-ts-mask = <0x00000000 0x0000ff00>;
             fsl,rx-ts-mask = <0x00000000 0x0000ff00>;
+            fsl,framer = <&framer>;
         };
     };
-- 
2.41.0

