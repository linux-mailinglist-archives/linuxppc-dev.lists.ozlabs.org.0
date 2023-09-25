Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 647E47AE18D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 00:10:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HKJjdNu7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvcWp2DhQz3cRd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 08:10:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HKJjdNu7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=joog=fj=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvcVy5dmsz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 08:10:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 21122B80E7F;
	Mon, 25 Sep 2023 22:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C8AC433C7;
	Mon, 25 Sep 2023 22:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695679798;
	bh=wrZGhwKs0rxrVrvNQeQFjjkktFc24Ckyd2CV5SBPQrA=;
	h=From:To:Cc:Subject:Date:From;
	b=HKJjdNu7I9LITZhQdye8D0M0nnFZYNtbr48LOBgybs4ESmzZ1jinSTTG0X5I3ipM2
	 amIUnjlHqMhCLW2TaN7r84iAgQKrw2MLIkSyYAj7WOTwnMPsFzSV9ga2tWRAR4/+/i
	 svBCPoG48zk80LZfpx3zR9nCSFCnk850xTx2sor61/oeNn0IDUFHmI6n6kffFX91cO
	 fuADG8CXuh/85ckjurBU2qnIrSLr8eZUh2zyH+c1H01fe+/QrMfHKGuyQWqc9jtQ5z
	 wmOccTN4V+AkEuxjeRsOel1AM5GLLTRoKaaAHXpkT3wnhU1vIqFX2/RV91W9WoIzq0
	 XdRGDIkjlYfhg==
Received: (nullmailer pid 2032130 invoked by uid 1000);
	Mon, 25 Sep 2023 22:09:56 -0000
From: Rob Herring <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Herve Codina <herve.codina@bootlin.com>, Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, David Rau <David.Rau.opensource@dm.renesas.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: dt-bindings: Add missing (unevaluated|additional)Properties on child node schemas
Date: Mon, 25 Sep 2023 17:09:28 -0500
Message-Id: <20230925220947.2031536-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Just as unevaluatedProperties or additionalProperties are required at
the top level of schemas, they should (and will) also be required for
child node schemas. That ensures only documented properties are
present for any node.

Add unevaluatedProperties or additionalProperties as appropriate.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/dialog,da7219.yaml | 1 +
 Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml | 1 +
 Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml   | 1 +
 3 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
index eb7d219e2c86..19137abdba3e 100644
--- a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
+++ b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
@@ -89,6 +89,7 @@ properties:
 
   da7219_aad:
     type: object
+    additionalProperties: false
     description:
       Configuration of advanced accessory detection.
     properties:
diff --git a/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
index ff5cd9241941..b522ed7dcc51 100644
--- a/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
@@ -33,6 +33,7 @@ patternProperties:
     description:
       A DAI managed by this controller
     type: object
+    additionalProperties: false
 
     properties:
       reg:
diff --git a/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml b/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
index b6a4360ab845..0b4f003989a4 100644
--- a/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
@@ -60,6 +60,7 @@ properties:
 
   ports:
     $ref: audio-graph-port.yaml#/definitions/port-base
+    unevaluatedProperties: false
     properties:
       port@0:
         $ref: audio-graph-port.yaml#
-- 
2.40.1

