Return-Path: <linuxppc-dev+bounces-7571-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CD0A84986
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Apr 2025 18:25:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYQD52LKTz30Tp;
	Fri, 11 Apr 2025 02:25:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.130.137.80
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744302357;
	cv=none; b=DciU1TtZvejww31I3wp+aetLoSMeanOGAueZf3CFYz5yp0vhpuLYKUX2PWfz3YxBiCHTt+lyyZik+7WAmS3PBavl3YbUhhYb17RV1hN03KDvxCwmkv0cy4Kj8Fgw6vx6zO6pI+u3yLcf7G2eyEjTTaABAxoXt75TWAZinioQo+jW48w+sYOsl0op6ln0dxM2mrXLi0HQ4/vFXxYykMzPrf0ulrey0k4c/FvpHTFHjy+633sEnOnWQM+1ecr0jGwCAW6qZXaYxE0RrxUfB0yaQxGWSVk8wz/O8x9om2e0+ziLg1E8+FqtIqX8Y5bVDUtLl//+bmkiqsQNMYZRskyENg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744302357; c=relaxed/relaxed;
	bh=0KsVX7QP+/8G7CYT2lcP7VHyf5esDemqunzcFxtcdJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jHYDsTPnIKC9AwknnnuNCGfXb5hYgpWQluZEfWDALp9C70cxcBhfeLH+1HPOFiShwF7Omsip5m3wYxFFg4KpvGWysR/BfDWynBvOLBCijNAPEOmexNQiJjRKbI8pG2XzxI0i3+XrbDx+2BjdTxYX24cWKSzLuwNLXZgf8AY5DWEfhBOuTFhlusGQGj1eiYYUODjrzIPiEuCLo4KosHqcd1E6ETQZj2bwDJlCLZHFqDhjL+T9A/CSp+wqzRuEIWgsGaJbpudwl2/t+vW8ZL20Pd4yC+Bpi3z1vvMSWmZ0eVYqqF7az6WQo4IxUHcC5CwpnVH/ai/VODLJOo52UD78RA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=pass (client-ip=195.130.137.80; helo=riemann.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=riemann.telenet-ops.be
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=riemann.telenet-ops.be (client-ip=195.130.137.80; helo=riemann.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 605 seconds by postgrey-1.37 at boromir; Fri, 11 Apr 2025 02:25:55 AEST
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYQD33xTmz2ySS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 02:25:54 +1000 (AEST)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4ZYQ0K2gJ6z4xKjP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Apr 2025 18:15:45 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.187.55])
	by laurent.telenet-ops.be with cmsmtp
	id bUFi2E0061C8whw01UFie1; Thu, 10 Apr 2025 18:15:44 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u2uUj-00000000JQC-1k7S;
	Thu, 10 Apr 2025 18:11:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u2uUk-00000009pN2-1sLE;
	Thu, 10 Apr 2025 18:11:14 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: soc: fsl: fsl,ls1028a-reset: Fix maintainer entry
Date: Thu, 10 Apr 2025 18:11:12 +0200
Message-ID: <185e1e06692dc5b08abcde2d3dd137c78e979d08.1744301283.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

make dt_binding_check:

    Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml: maintainers:0: 'Frank Li' does not match '@'
	    from schema $id: http://devicetree.org/meta-schemas/base.yaml#

Fix this by adding Frank's email address.

Fixes: 9ca5a7d9d2e05de6 ("dt-bindings: soc: fsl: Add fsl,ls1028a-reset for reset syscon node")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
index 31295be910130c2b..234089b5954ddb97 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale Layerscape Reset Registers Module
 
 maintainers:
-  - Frank Li
+  - Frank Li <Frank.Li@nxp.com>
 
 description:
   Reset Module includes chip reset, service processor control and Reset Control
-- 
2.43.0


