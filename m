Return-Path: <linuxppc-dev+bounces-6509-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DD9A46745
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 18:02:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z313P6mhlz3bmc;
	Thu, 27 Feb 2025 04:01:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740589313;
	cv=none; b=SmkN7GHvhQrsoy8HtrQ2Fs59lhJZ5r0yqbT6RxeAMZSxWzYrgyBdjuPmgfHLmFhxVjYOV4lhBy2CrbUY0Jbtr52fj5h1jPwWc34Dg2X0OuuIFEwTH3WSnPkyd8SnWSQ+HiLRhNIZQ29Zmsxbe2x8HFwb//GpethemFFK6ntkCOtrRpSE+nv3UCZPHwsVfY8vgmEq74m9acnM7KAqYtQLxpWDJwWQtnY89KBGmVoLA6/pG5qxOfqPNtevLRn6GX11qFc0NTpWkc85qW6Q2XshZ8MFE3QQPdqTZgj1R9FP49Fvl0BaI1tBAU9xuHqgS+MuePXSHRqwp9IDngHAlyZeGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740589313; c=relaxed/relaxed;
	bh=FJ5Pv0mCfn+Km5OYGgFwfcbgKTNdwl+NrEGpXwX3PD8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=f6m9LFaHfdoKt/gl9tdyW3awsctVtS8LRah3a/L+Qe7HgXM0JKBCoeWfhgPSXS+UoxG57vLxLX/ahfoSEKWhsLNna7/Ztn7OeXmFjH7A2trShJr9pha3tM+8ewoMS1ZjR/1IERRvFCG+tMSNPPYT1OgHl27amdJdj7OzHSKePaMaAFaof+POtzxcIKRugvyQnkCcMmrsR5wxWM8wP/RTVE12umm3yWksuqX0ZdK2Xs116VnyltPRBeBuOKzx8mViv7mql9nFb+yIAdRJha5TlZH2L2hE14UI7Jey6Om1rj1kGrg7drwIJOyo1WDEEbf60s3PsAMp08PZzYU6mRxZIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lddC6Qx1; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lddC6Qx1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z313L5pwhz3bmf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2025 04:01:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 105E45C4E46;
	Wed, 26 Feb 2025 17:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89349C4CED6;
	Wed, 26 Feb 2025 17:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740589307;
	bh=R5tzNYvtjhOaDyxzJC0f6+X4b3pNjCCckOHTIvF9CVA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=lddC6Qx1vkIXMTeR3YILpyu/xvH3kvlmnJnELovtHG/P9DT+OpGOp6/r83cboztdY
	 Q2MQcWD26gsTDQ/E8IGcmtNfhYSbGsg4KtPh8vg5PxIN38F+9bGvmNDvOVeOxLtHph
	 E9qn+KYWNZI/TAA/71UYdJJYdhi18Y5MAo4ibPnKZDRRQnidA/gFXf1OOl/ktcUHwp
	 S8cyvl+4aAeKMQLFk0czpqvdXwr4V71nlNwGJwvP2CsylaYgE8cb9OPcv5WU0R5fXI
	 qFnJII17Yph0mBVTV27Hd43ijcGa4U4xUvSjreMZ4Mj0wQY+I5zZiH1LuuOW4RUUg4
	 AUJ+kEy9qdEqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F33C021B8;
	Wed, 26 Feb 2025 17:01:47 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH v3 0/3] Freescale Enhanced Local Bus Controller (eLBC)
 binding YAML conversion
Date: Wed, 26 Feb 2025 18:01:39 +0100
Message-Id: <20250226-ppcyaml-elbc-v3-0-a90ed71da838@posteo.net>
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
X-B4-Tracking: v=1; b=H4sIAPNIv2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMD3YKC5MrE3Bzd1JykZN2kJAtTSxPDtCSgpBJQS0FRalpmBdi46Nj
 aWgAMf7h7XgAAAA==
X-Change-ID: 20250220-ppcyaml-elbc-bb85941fb250
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740589304; l=1815;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=R5tzNYvtjhOaDyxzJC0f6+X4b3pNjCCckOHTIvF9CVA=;
 b=0qKDVcRkFGxCn+NY56CjSspN6QlXp1cLjAOYBuEWa1S1LDEyjDaRCQQz+qML97HvBVtxAhApo
 xKOFpwBpbV8AI8ySIhJklM26eF7se02o22WNERJs3oyIt8wMqvbSs2p
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

This series converts the fsl,elbc binding to YAML and adds new bindings
for related devices (particular kinds of chip on the eLBC).

For readability, the existing unit address syntax of <cs>,<offset>
(e.g. nand@1,0) is kept. This results in a few dtc validation warnings,
when combined with other choices in this patchset:

- For compatibility with existing kernels which don't explicitly probe
  under an eLBC controller, the "simple-bus" compatible string is kept
  on eLBC controller nodes. The validation logic requires a linear unit
  address, though (e.g. @100000000 instead of @1,0)

- The eLBC NAND flash binding (fsl,elbc-fcm-nand) references
  raw-nand-chip.yaml, which again requires a linear unit address

The patches in this series were previously part of the following series,
which turned out to be too large and unwieldy:
[PATCH v2 00/12] YAML conversion of several Freescale/PowerPC DT bindings
https://lore.kernel.org/lkml/20250207-ppcyaml-v2-0-8137b0c42526@posteo.net/

Changelogs are present in the individual patches.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
J. Neuschäfer (3):
      dt-bindings: memory-controllers: Add fsl,elbc-gpcm-uio
      dt-bindings: nand: Add fsl,elbc-fcm-nand
      dt-bindings: memory-controllers: Convert fsl,elbc to YAML

 .../memory-controllers/fsl,elbc-gpcm-uio.yaml      |  59 ++++++++
 .../bindings/memory-controllers/fsl,elbc.yaml      | 158 +++++++++++++++++++++
 .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml |  68 +++++++++
 .../devicetree/bindings/powerpc/fsl/lbc.txt        |  43 ------
 4 files changed, 285 insertions(+), 43 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250220-ppcyaml-elbc-bb85941fb250

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



