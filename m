Return-Path: <linuxppc-dev+bounces-8401-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBB6AAE51C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 17:42:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zszzx0cPHz303B;
	Thu,  8 May 2025 01:42:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746632573;
	cv=none; b=EVyJ2l/0ozPiTeF0JMIXZAGWAB9IAjMIux5SdVET4xT73BBWjxe2UNwObAEUJ4Wx9UMKpmzAO96Ig68meXIeEnRWzABcRO7oQc1emhv+GrrKkvASp88cKTRH5Pz6KJ/jKiiLV2uh9cCiQlmv4HXt8QkCFxrTuVysorxLdppnezpavwHEH0B8Y3czCW4IWy2dE3Qt9TWDq49hNT6Fv3Zi/4Oi4FBfKKVUd4FsbAxuSI/HJ4B4kgzYwD7LFBnAbSn01YFR0mTde/OJrRghFz10GVu+WjUrkEy1+93rCiUujJzi7ntpK8XoeVGykPxHvw7THVWSd4xF+0FvjcTkzFFosw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746632573; c=relaxed/relaxed;
	bh=Pn3Is8UK9CnbfJZosrvZC6Ey92uz6O33jauxiOsjsxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bAVme8K+86C4JkxsjY/eXybXVIehZAk/ezMZJoRlNz+O9aa56liDDpEDKmp+THCoZfm75wa6KR5USWp0aFxtD2oxHnm36TcQ4dXZ70Dd4D2V7tiSAvRacW25xkwv1gufz4VuPrhLTKmX8f+2NMDNOsIhwjLxYBUBuJYPqJvWdeldqPoe6tFUwj77AJBeCC7agUYBanfIXRgP4Khn0zDT68tPyqJYrUap4R+n/l/EwnVJi3cpWBrcaGTr24HdYz7hblEQTp0P8Sn03iK4MibRsGH4Ushk02kKMmJP2X2EY/vKolk5C+zuUnGfUKWAEK+qiQ+78AZjIi98D/D7UuRw/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JhsprL40; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JhsprL40;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zszzw2jXwz2yr4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 01:42:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A5A7C5C5DA4;
	Wed,  7 May 2025 15:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E47C4CEE9;
	Wed,  7 May 2025 15:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746632569;
	bh=Wq8+hagNHhDt0qgNoLvZp0IFuNFz4fjEvxG0I7XXFfg=;
	h=From:To:Cc:Subject:Date:From;
	b=JhsprL40DKDoJ/8ssEfDM8YpWELJdbYvICrLM7tteL1vAQ7odnDmbL5c7nH+KIfsY
	 bgxyn8gORtmn/MaH3ZWTaT1CijwyPRqLQhkuhtABDVpXDFCjxa9kkZy2Fjxb6zZt/X
	 FHJlNVQxhXO5Aqq9vX/dz8DvOa9VD/dUJPduhuJP5qdTWq9fMf+wFxswdxKJCeEl+6
	 7AOxeeJHLYNms2Nx8cg65XW6njIxoLFVSwqSd5qMl0TTZ2J//JAuqkDiipeeO7UI6b
	 3PenYl7wri6hT/2L9mNs/+6ZCWwW6g7MQ867i/749OxWMDNCrrZOmw19/6B4iiLv6l
	 7XB331fdsW+KA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: fsl,qman-fqd: Fix reserved-memory.yaml reference
Date: Wed,  7 May 2025 10:42:31 -0500
Message-ID: <20250507154231.1590634-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The reserved-memory.yaml reference needs the full path. No warnings were
generated because the example has the wrong compatible string, so fix
that too.

Fixes: 304a90c4f75d ("dt-bindings: soc: fsl: Convert q(b)man-* to yaml format")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml
index de0b4ae740ff..a975bce59975 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml
@@ -50,7 +50,7 @@ required:
   - compatible
 
 allOf:
-  - $ref: reserved-memory.yaml
+  - $ref: /schemas/reserved-memory/reserved-memory.yaml
 
 unevaluatedProperties: false
 
@@ -61,7 +61,7 @@ examples:
         #size-cells = <2>;
 
         qman-fqd {
-            compatible = "shared-dma-pool";
+            compatible = "fsl,qman-fqd";
             size = <0 0x400000>;
             alignment = <0 0x400000>;
             no-map;
-- 
2.47.2


