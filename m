Return-Path: <linuxppc-dev+bounces-7627-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7294FA86D3A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Apr 2025 15:17:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZZYwP6Jd2z2ynf;
	Sat, 12 Apr 2025 23:16:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744463781;
	cv=none; b=U5ajQYmdSu82QqdShZf/S6YzQwZvXFUz++rxCw8kFrMOOvkihhmOtyjGe3HQm5yfglPJPMVjDj2sCyZFRM2JWRlKcTJxRWotYDg7RG64x2/7p/wmjJmLW8drLgfNhOxXiH+WEthGfirpdcLgxqXnc0xsyjoXYNprMXgd2o6VqSvmlsn5PbJx4tccf76MzxRDpSZ8EfsJ2KFtkXtaTONFmtK5hg2S1n6kEsDQ+7p/5Xp7IVkmTP8x8YdHF+rMJVnwuI5fqJRuI7JBc+Ll7xNAdwAfCWm1uPTGYnYewAN5iyDZ46U2tr/BlYhcAJ9Bsub8bhLhNBsEFSdQ84x0UH2n1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744463781; c=relaxed/relaxed;
	bh=hj2A+J4JTngGYBEwyntU8M3UZH9ZnaiBsNf9ys97FLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gjchyEeOttmlPC0u++k2dwMcev1J6uR3Hi6iyl8a47YAfvvkOezPjmISMQQ56sqYF+S3eL8Z3K4BM3M7Bin8l7kXzbW80ithvxI5iYw47Jrvoi3YUOSD9ijgtKbZEt7rhlOcsDALYfjLAFcgcjfyWtd+7rCITuaXt/h34n3LOOzdo5/31Pjn5rTYe3mIi1BkTvbUP/JsP9HLyKkO7fZL2NE1d5hw7SheRTYeNgI3LTnrsJNPfNGXlhXPE8ktbwQpA0ZAnpmQz/GO3x7/2jwH0N0x3IG3fNMVE0AOkXILW0eJ4bpxToV8B03PkRax58iX0dtC8k2tk3B92vfMUnCjLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lJdk0iiB; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lJdk0iiB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZZYwM6rl3z2yqm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Apr 2025 23:16:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9D90CA40A2D;
	Sat, 12 Apr 2025 13:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F0A6C4CEE9;
	Sat, 12 Apr 2025 13:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744463775;
	bh=sDmeVGHitZSfQDaX8FV1eo5UbMMDoWgDE63yAq2budU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lJdk0iiBGm6tynEY/QosWaZy2cBbcR1A9W3CRDwkijjCww7XwEOhQ0pa5zG4P4pus
	 fman/cYhBfXIH+0eqzLeRLLl5bDUQ4Al/qDDvX7iqSKLmXNSp60U7wysjjYf/UKwHq
	 Xv/eKlP3z3MdEKHfFsUVinlxmO6qlcXA6OG4LafZdK0n3w24DYhk/SYoRJKo4G0DJ8
	 gVv096PrSryfZnsJFmYRBUshGdYT+UDABnz5yoACMiTVAhNH2H/68Fxv2WKmN0R6dE
	 R2QQlX62MMoq0ChBLlhDvjcdhKjv3x0yrYN7TM/8haPjX3Vl8FpGtv2xg9YybDhNBo
	 rpG14Vn1+ivoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682E9C369B2;
	Sat, 12 Apr 2025 13:16:15 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sat, 12 Apr 2025 15:16:02 +0200
Subject: [PATCH v5 1/4] dt-bindings: mtd: raw-nand-chip: Relax node name
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
Message-Id: <20250412-ppcyaml-elbc-v5-1-03f0e577139f@posteo.net>
References: <20250412-ppcyaml-elbc-v5-0-03f0e577139f@posteo.net>
In-Reply-To: <20250412-ppcyaml-elbc-v5-0-03f0e577139f@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744463772; l=1564;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=pxFM9O27wqy9fcJew44o1PX/qgcWx5g0CLREATU2JSs=;
 b=QPWzJKXuu2pDA7ddayiQm8050PDpnlNu5Ss5jLRmkr8q7le4OSnoDHRIDwwDewQpf0ccFnNtR
 h9QIpWTh3OqCqs2AqSBvTctWleweoYhYidrpUvvP7tbiqTlD7sJO2wA
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

In some scenarios, such as under the Freescale eLBC bus, there are raw
NAND chips with a unit address that has a comma in it (cs,offset).
For reasons of compatibility with historical device trees and
readability of the unit addresses, this format is kept.

Relax the $nodename pattern in raw-nand-chip.yaml to allow such unit
addresses. Unfortunately $nonenames defined in bindings that reference
raw-nand

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

V5:
- Add Rob's review tag

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



