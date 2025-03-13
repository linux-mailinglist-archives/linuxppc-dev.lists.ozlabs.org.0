Return-Path: <linuxppc-dev+bounces-7015-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38314A60370
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 22:35:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDLQb6GSJz3bqp;
	Fri, 14 Mar 2025 08:35:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741901751;
	cv=none; b=j9fMH9FkFfn4R2QsmZIyOgjuxOkStSMbgUDD6TgliMK9mJjK0xpokCAsQEzAJ7tzTvwA0CAjoEFiojyZGuMTABmqYDKSFORpXrliZPlVrLjK4mmPhPnwaM6Mr6DTeD8wBocUUAWW9W9eKGMRfS37TUtIgefs9njX0WMqfsg0tissC0FbfRdLJsdKklml1tJzafrIGun8BxVBhYkxRZH0isS9OKgo8j7w6BrSmgkKbWqNh+xNGZpTbzi53w5yo016OIbx8H9EJ8Azqjh5ApZ0GOF+gPSpPZSe8WtTxTbN/IhdFUfETv/I0VjokGF3i3sAmPmGRJrFtYJaZtV9bmLldw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741901751; c=relaxed/relaxed;
	bh=nuGCJyiNGWXP0t1pW15HxuPUE6kQBriA8l6y1xvAY5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WSbxSnJZeTswSfj9mC6qM63MgzfXD11wirEWV37YIY6e42zspEULngAw5n/uxFLzu/Lv8oA7wh49FO3LSIub1e6uG5MHvV9cnZlwu+vDS2v73P4Y16/SQBE4/n8nw41ZvR00aBvPIMamDIQ3ujM+v0sbOAMinEaIwa84NczAE7bao/p9XkNAIl0FCadPaL7YlQ9ND64RJo2YUR8Yk52HgvRV3VegQhK1scQaIVFEwFtkeERdL+Wmo4Q/w59PUNrbKLbwcRi7w7i0qtcFJjpVcMHwiOkIN+dGfSaklg47jJzAwkXGZyuggn8o3TtaUtogG2glyHjjWeTkDDPwKkttnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qi8Mb83D; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qi8Mb83D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDLQZ4XDrz30VR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 08:35:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 305EA5C5F3B;
	Thu, 13 Mar 2025 21:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A823C4CEEA;
	Thu, 13 Mar 2025 21:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741901747;
	bh=29z3wRwOCbrYFJhrHEd02uoJUqdaA1ekxWQFQrQotpk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qi8Mb83DPQcxOwpJUpOwU451pOwTebiNJrgNeBrTpA63J83AZg30QoQcIkQYSfrhv
	 46oGohIuYsvQic6z6AfrPaIDD684kHCRjF/2Q6zh/DwyWZ9nQGcDY73lFKEF1puK5C
	 rc4O09wp5+NkrwsqZ+WbZuQuF1r0OH3OXnZ2e1FhAO4R2MFrpJvx8ji9yDK8T4Qe/D
	 sUfecbB+ZCvXjKxAzOtJlbGd2ws4t3OdbrNWJNJ2/F7UKnkeHILWUU5rGL4kklMg4Y
	 t8+hERQzWu5cl1c8EiM+K4dmXYpJo/A07MJpBneXJ0rSfTr8m/ylv198gPXsR9oJ0f
	 NEOTN5yFg+buw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3075AC35FF1;
	Thu, 13 Mar 2025 21:35:47 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 13 Mar 2025 22:35:44 +0100
Subject: [PATCH v4 1/4] dt-bindings: mtd: raw-nand-chip: Relax node name
 pattern
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250313-ppcyaml-elbc-v4-1-55903722d9ea@posteo.net>
References: <20250313-ppcyaml-elbc-v4-0-55903722d9ea@posteo.net>
In-Reply-To: <20250313-ppcyaml-elbc-v4-0-55903722d9ea@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741901745; l=1483;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=yPgY1z7mg/3dcZuzAQmURU+bDX68s9E0YWQYCk73u2A=;
 b=TiGBn5/omWDqmmLaDYByMyKwn3FP8MKFA347zo4v6yuRXDARcPhBHg/qDZ7YtYAYDRNFvDA0h
 53muitjhV2cDO/0YZJ+D5+FcGeK2zPgVfVIqJHclzEtsmonRa/ttpQ9
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

In some scenarios, such as under the Freescale eLBC bus, there are raw
NAND chips with a unit address that has a comma in it (cs,offset).
For reasons of compatibility with historical device trees and
readability of the unit addresses, this format is kept.

Relax the $nodename pattern in raw-nand-chip.yaml to allow such unit
addresses. Unfortunately $nonenames defined in bindings that reference
raw-nand

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

V4:
- reintroduce patch to silence dtc validation error, after discussion
  with Rob Herring and Miquèl Raynal
- add some more detail to the commit message
- remove unit address format rather than extending it
  (old pattern: "^nand@[a-f0-9](,[0-9a-f]*)?$")

V3:
- remove patch after discussion with Miquèl Raynal

V2:
- new patch
---
 Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml b/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
index 092448d7bfc5ccd246ca4b2341464e18722a2d51..d655f6673fc31b1d9ee7cd734cbe1d310f88090b 100644
--- a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
+++ b/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
@@ -25,7 +25,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^nand@[a-f0-9]$"
+    pattern: "^nand@"
 
   reg:
     description:

-- 
2.48.0.rc1.219.gb6b6757d772



