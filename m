Return-Path: <linuxppc-dev+bounces-15114-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D56E0CED32F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 01 Jan 2026 17:59:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dhtMb38nVz2yFd;
	Fri, 02 Jan 2026 03:59:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767286747;
	cv=none; b=LJ/bvkgndT7zCPIY2/1sT4KEUOYo+5PidE00MX4KTFSBOcuUFjmnmzJV9x1u6+0mgfL96F3ww19qlB/iKVmbJpqEgpy3Yj4rmpSUIpvyaKRNVqxWDlqhozs07FXJH6i5MeYCX6Yhh+/BwxuNui3fcOeqtpXgi+S+STKoy2PKRgu/72eIqS3i7vCpzU1f1vLk7NAHCnrV1/AuJegRdNrhvIrVmucoRETK02v7sZGCEB3Orn/691dtv+as2jCDEZgAoCwr+F+taZlfLxGuUkpg8e2GtJcXlh3oXgFfbiJck8P3RHZueTSxkEGjtw+aUjZ4octVdY94ht2T86XC9T3qrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767286747; c=relaxed/relaxed;
	bh=UGH+Cw7sklMaWHCx5yXIbn0DT/geFhXXP/9I1O7eApY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U64QNRo+DojnawNEdHF9keun66AYKrYLTLVykEogW4GAK1WmZ4ovXRf7tHGsH92H28nFL+hZxU7m3y2imNs43H/CLYr2Yb17NcvGTR+yelCuQVqU56xRCQVvnvHxJDERb6zN6Mci3IWhvYi7ewuZuchpKKBxcgSjI2tdo2h+kHHs+mUxAA2x5s5SZBhtGnr2XLC4Vyk2PVmgaHMjVnXHAo18nxG9lxgBBBxgPz24HA2uhI/mvdNBmpjhcNl1mw1I5K+J+gvaziGh0i+mmRyUQya7sT+wOZfj4qaM3krtl0s8svjMqDXGSrvxM/btwIz2FUmMVgwX6TTZXIgIniGPiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MjFHcnYZ; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MjFHcnYZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dhtMZ4SWwz2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 03:59:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E96D44495;
	Thu,  1 Jan 2026 16:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B845C19421;
	Thu,  1 Jan 2026 16:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767286714;
	bh=nCUlGdy1LiHaJ2ajH+Pk5P8y8S4BG2jUiiD913ir+NY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MjFHcnYZ3lNfodof9zJni+I+Poxg98qhWozF25MLd1/chhzIugur4kGZ5EK/q/TGb
	 sXu96qLZWwPHJauqsuaqm5ZaxSfJYDhtn2tsJcRBNIeagy3+dd3vlIAgpJMHTvLIhB
	 kp2v6WMBAOO8L6Ff3v8+Eo2WfM5yEPWPxBo6UW2S9jF7QmdCygDFqCLFRSg5hk003v
	 +RwLilEyZQYNM8AGtE2JePg1nsM3oU7665Bf2OD50+CLJ5F5Zxmbq/rNyJwAct7BpD
	 d1sANYpExn/+1e6vdYTYkF/uyMT2f8FGTOqoETo+/Eei0GzXIGqEjA2P97rHrCQNKn
	 /ukNevBn1NN8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153EAEED626;
	Thu,  1 Jan 2026 16:58:34 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 01 Jan 2026 17:58:14 +0100
Subject: [PATCH RESEND v5 1/4] dt-bindings: mtd: raw-nand-chip: Relax node
 name pattern
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260101-ppcyaml-elbc-v5-1-251c7f14a06c@posteo.net>
References: <20260101-ppcyaml-elbc-v5-0-251c7f14a06c@posteo.net>
In-Reply-To: <20260101-ppcyaml-elbc-v5-0-251c7f14a06c@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Naveen N Rao <naveen@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Christophe Leroy <chleroy@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767286712; l=1491;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=EJ9cqjRClj/DlBIVopL2aU8EyEf/7MEDGKU7+90KqQA=;
 b=A9xr4ME48fGE5vkHnKWyrFvYLcL0s+dUseugN8Gw83AijN/QlKngo22OaxGarXoT3Qyxw2L94
 bLaHIhO/qYlCR8KnKQJB4p/ihK5ryD2GW8WCNmCTmfZZVXw7dp3GEIX
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
index 092448d7bfc5cc..d655f6673fc31b 100644
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
2.51.0



