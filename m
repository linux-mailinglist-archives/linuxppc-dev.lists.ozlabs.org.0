Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 368007B144B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 09:12:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=b137PEfV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rx4SS6hSJz3dB3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 17:12:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=b137PEfV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.200; helo=relay7-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rx4L95jSQz3cGW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 17:07:29 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 0F20820007;
	Thu, 28 Sep 2023 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695884846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p22HMMIKMFQbh6/HiMaCltDimc7HD++LcS5qhfEDNEc=;
	b=b137PEfVWnm5YJSaTUGGHWANWAAtQ922LR7ddbFHv7Jhx3crw9MiAX8zC3Da+l24pRZ5fU
	CpJKeTKhwRmeb5aUWCOltxQeAgjPQcgDVokOuBXo5wylky+/GXTptxBXwIHANUSCwCci1A
	zYWmS5mZYJ79icT/nyh+/cxL1zj7s6fD/7bpuS/iDa513X4q+cjG/MTntSGkDx6gMiR5TE
	kck3Q8xNPb5HECw8ncpYoc3Wh3e4mCTPcCAGoe6zXgUJBfacnwV69OIMFemucAEgW5S52x
	Y8lw1BoyETf4Cq1V5fBTxQa4X3AqN0enBG+nwY79wsR0VdQ9am2jLLutOQqCfg==
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
Subject: [PATCH v7 06/30] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc: Fix example property name
Date: Thu, 28 Sep 2023 09:06:24 +0200
Message-ID: <20230928070652.330429-7-herve.codina@bootlin.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Rob Herring <robh@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Simon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The given example mentions the 'fsl,mode' property whereas the
correct property name, the one described, is 'fsl,operational-mode'.

Fix the example to use the correct property name.

Fixes: a9b121327c93 ("dt-bindings: soc: fsl: cpm_qe: Add QMC controller")
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
index ec888f48cac8..450a0354cb1d 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
@@ -137,7 +137,7 @@ examples:
         channel@16 {
             /* Ch16 : First 4 even TS from all routed from TSA */
             reg = <16>;
-            fsl,mode = "transparent";
+            fsl,operational-mode = "transparent";
             fsl,reverse-data;
             fsl,tx-ts-mask = <0x00000000 0x000000aa>;
             fsl,rx-ts-mask = <0x00000000 0x000000aa>;
@@ -146,7 +146,7 @@ examples:
         channel@17 {
             /* Ch17 : First 4 odd TS from all routed from TSA */
             reg = <17>;
-            fsl,mode = "transparent";
+            fsl,operational-mode = "transparent";
             fsl,reverse-data;
             fsl,tx-ts-mask = <0x00000000 0x00000055>;
             fsl,rx-ts-mask = <0x00000000 0x00000055>;
@@ -155,7 +155,7 @@ examples:
         channel@19 {
             /* Ch19 : 8 TS (TS 8..15) from all routed from TSA */
             reg = <19>;
-            fsl,mode = "hdlc";
+            fsl,operational-mode = "hdlc";
             fsl,tx-ts-mask = <0x00000000 0x0000ff00>;
             fsl,rx-ts-mask = <0x00000000 0x0000ff00>;
         };
-- 
2.41.0

