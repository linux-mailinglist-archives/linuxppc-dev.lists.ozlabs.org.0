Return-Path: <linuxppc-dev+bounces-7626-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C46DAA86D33
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Apr 2025 15:16:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZZYwP29F5z2ylr;
	Sat, 12 Apr 2025 23:16:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744463781;
	cv=none; b=Kl4kyEFVs0PUnkp2d/vZRZpgHyqATokJ6EAmfDN2HdnfOf/cx2egK311A9XLpu87mK4xX2L7va4YMi68A0bM2ayY88AJvT4mLlDgL8fmigFX/SKQ8tI2QYpEKyTFbfYwmB0t6gstke8vjANO1+cSEYR+l82umEp3/h778bks5IiMozNkX7WhvT+DHZTRcoGCakIloZDwkSoTGf6ef4SFxZOdEmeAXyF3toJYbVkamF7RQysnEmz+IGv4ahSVCe8YB2Bf66OWzfCqXRFjOUquOAq9UGD9cqeShEGthtNyXYHsC8V2R2fb5sLyoXOfiMwH99T+45khK9IE13GaPJpj8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744463781; c=relaxed/relaxed;
	bh=1WMsaqOCdcJ7Gz2/czNrp2687Truh5qsYlp7NDUIvAI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mi6swlgl2a064Kl4iLGNlYJ1sIjq8TCVqDDPOS2FIyPJh7Da4T4ySkKfBFhLgxmLBMlGLoSRWYdlbDlUtX0tauf7ZL8x3uY3Nz6nLaS5nQTXvoJdeNecgLQBOn5DnI6DIcBSIk299hsdz1tkN52AptZ6wPEOUuQh0QtU2nXi/X3IxB1lFkFkKiSrJa4FvTW9HCHFXMM9k8fuGhXY31+t5VE4kFq7c2EaoNCHja6drZeUmTP7nTPPE9k/NHN+Z6p/Q3UOszMWiEe8/bQS1FVs0CTwqu87mTM4/KEu74mRWzwofqHpA18ia1JlECaOBCy2zyaUCcN1t+WgeCEP7R7O6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m6KoERnm; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m6KoERnm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZZYwM5W7yz2ynf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Apr 2025 23:16:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BB8AB5C57BF;
	Sat, 12 Apr 2025 13:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 688AFC4CEE3;
	Sat, 12 Apr 2025 13:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744463775;
	bh=ooT2t/4HDi3rmfv8HHUPwediCnOQ2VSqg+dxjAIoQhg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=m6KoERnmQRTnT6xlveWbaJaIFNSpG0ku5DPDSID2PVeZQCApVmd4dufC4AZvzwZBo
	 rm7OAjgXJZuWM77c2WfCRSXP4727I7Iy477WxRh9FY+cu7N5k6Y3B5HwAoISbl6LX1
	 zoscBCeZqdKTMgh5q6cUfwRr/60r5giKZgfB3RTzx1yyZ+T0I24cEaJ18B//+1ElKa
	 xcqXodYXSJ1kUbD8CtLUhRNYMJHEZIL13mfMuLzaQi24P8L5tOdlVY3bp35EdLFNOM
	 4QkcpE7t+2te6tzl1YgFF1vEN93eopLuoqtUO1xKNFsRvPqROOzb/kh6seMIYnPSRd
	 jlRg4YgLHfjHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D569C369AE;
	Sat, 12 Apr 2025 13:16:15 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH v5 0/4] Freescale Enhanced Local Bus Controller (eLBC)
 binding YAML conversion
Date: Sat, 12 Apr 2025 15:16:01 +0200
Message-Id: <20250412-ppcyaml-elbc-v5-0-03f0e577139f@posteo.net>
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
X-B4-Tracking: v=1; b=H4sIAJJn+mcC/12M0QqDIBhGXyX+6zlMc+Wu9h5jF5p/S2gpGrKI3
 n0WjNEuz/dxzgIRg8UI12KBgMlG68YM4lRA26vxicSazMAoE5QxSrxvZ/UaCA66JVo3QlZlp/M
 JWfEBO/vec/dH5t7GyYV5rye+rd/Q5RhKnFCiJEVTl0Y1vLl5Fyd05xEn2Eqp+tm85H92lW0hJ
 OU1Y0aiOtjrun4A3zenyecAAAA=
X-Change-ID: 20250220-ppcyaml-elbc-bb85941fb250
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744463772; l=2344;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=ooT2t/4HDi3rmfv8HHUPwediCnOQ2VSqg+dxjAIoQhg=;
 b=l8PaOuZLZFLI6LwsdeDccOzUR5+w3wL0myBNaBkGAkjCETbCBt7yiXeoObNwacrPSy2z+vcwW
 DeL3eMq8UnHAa+kP3OoEG0MKsMRHNlchAXiL/mnJA48QconA9bwH2yb
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

This series converts the fsl,elbc binding to YAML and adds new bindings
for related devices (particular kinds of chip on the eLBC).

For readability, the existing unit address syntax of <cs>,<offset>
(e.g. nand@1,0) is kept. This results in a few dtc validation warnings,
when combined with other choices in this patchset:

- For compatibility with existing kernels which don't explicitly probe
  under an eLBC controller, the "simple-bus" compatible string is kept
  on eLBC controller nodes. The validation logic requires a linear unit
  address, though (e.g. @100000000 instead of @1,0)

The patches in this series were previously part of the following series,
which turned out to be too large and unwieldy:
[PATCH v2 00/12] YAML conversion of several Freescale/PowerPC DT bindings
https://lore.kernel.org/lkml/20250207-ppcyaml-v2-0-8137b0c42526@posteo.net/

Changelogs are present in the individual patches.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
Changes in v5:
- Rebase on v6.15-rc1
- Add Rob Herring's reviewed-by tags to patches 1,3
- Fix documentation reference in Documentation/devicetree/bindings/display/ssd1289fb.txt
- Link to v4: https://lore.kernel.org/r/20250313-ppcyaml-elbc-v4-0-55903722d9ea@posteo.net

Changes in v4:
- Reintroduce patch "dt-bindings: mtd: raw-nand-chip: Relax node name pattern"
- Link to v3: https://lore.kernel.org/r/20250226-ppcyaml-elbc-v3-0-a90ed71da838@posteo.net

---
J. Neuschäfer (4):
      dt-bindings: mtd: raw-nand-chip: Relax node name pattern
      dt-bindings: memory-controllers: Add fsl,elbc-gpcm-uio
      dt-bindings: nand: Add fsl,elbc-fcm-nand
      dt-bindings: memory-controllers: Convert fsl,elbc to YAML

 .../devicetree/bindings/display/ssd1289fb.txt      |   2 +-
 .../memory-controllers/fsl,elbc-gpcm-uio.yaml      |  59 ++++++++
 .../bindings/memory-controllers/fsl,elbc.yaml      | 158 +++++++++++++++++++++
 .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml |  68 +++++++++
 .../devicetree/bindings/mtd/raw-nand-chip.yaml     |   2 +-
 .../devicetree/bindings/powerpc/fsl/lbc.txt        |  43 ------
 6 files changed, 287 insertions(+), 45 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250220-ppcyaml-elbc-bb85941fb250

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



