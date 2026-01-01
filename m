Return-Path: <linuxppc-dev+bounces-15116-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC684CED338
	for <lists+linuxppc-dev@lfdr.de>; Thu, 01 Jan 2026 17:59:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dhtMc3vTCz2yQH;
	Fri, 02 Jan 2026 03:59:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767286748;
	cv=none; b=e0b5URaSdY1SXmsV6APqxxb8m/TM98zHJZtjbxqbwadxbE0vn8tP904T4nNTzWIWFDc3N+C/KOaVgSi/l3/LmTRasBIi0s3rp87QNp6syXblhIEZ9QTcKRZGqAOpSJRDGvb3pE0pza0OCRk7x2kVgyGvaRf1gtZv/iGGAThVS2JXDG+sbEJPv+b4cBF0iBVItRzcYOZJiF4LN4deYDZ+8nErhDB+lqpUnqAcCDzczAyVfi2AY9RglED936hmMdNr6BwEvo4q92h+XM87+NlzNZr/m4i5U/xcdF8pzxjnmW8SwSeLlJhz+T1Ee/wnKUygbpe9wHv1cY8cj+sZwpuDcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767286748; c=relaxed/relaxed;
	bh=1WMsaqOCdcJ7Gz2/czNrp2687Truh5qsYlp7NDUIvAI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HQphQxZ3fmk5bSwnN+xcMtm06RxqbPuMzySoA1pgP2X7HhEGrnZyXpgNV0HBQWlifHCtevImzznRbYfENE1eXFxsCxmDBJXEAs4denlYcDC1OAS07+oCWwYuiHYAsHJgMevw+iTBwyUjLff8E17IKsrtblgl3pO6F0QN8BBoGS1YxRzFM8jPk05t0nlU/HdiU/wT3fuStG2VJpNatiHLbOuG4z7yJIhDoNRbw7iRRjg89aENAr4naVyNAJnUVb/wN0RCETqQlMPb7cIgwSwYXIwnp/CCtmPBIka2Txqc+g1JnoOBy1fw+TLjvBHqjKuykhU2kMdNCvUjlroRUxlHFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uy7oE1P6; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uy7oE1P6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dhtMb4XFJz2yGb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 03:59:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 704A760007;
	Thu,  1 Jan 2026 16:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 199ACC4CEF7;
	Thu,  1 Jan 2026 16:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767286714;
	bh=ooT2t/4HDi3rmfv8HHUPwediCnOQ2VSqg+dxjAIoQhg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uy7oE1P6hIuVq4ouGmC1LgjVkVFLEEAKmfbvzxH13GmOExQ9N6keG8r8NQkB7bKf6
	 GWvGzZ4ODwXCEgLkfPNTFKI4h7tliaDLUvnq9KiVairIv2ZQzxbCqQnojzQyUM/nHA
	 hgVp8yU78h5lyiB+FMlaO48LqT6EOOgPHA90jGEG/Tp8ipHvX5QUWpXsFRQqq0sXKz
	 9jvjrI2bCvKUKmPKbY2+CkE+PD8Vt/8fpYW/fqR3Frm0ispf58LXPCOiXJB7lPGO+r
	 Fzsm11UmlbgeExsYmKUOJSUxZGm2YN730rdwsdrTvSAxXTus2d7ktDXc7EK2ifBDgD
	 hXAlKW884sW5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0476EEEB579;
	Thu,  1 Jan 2026 16:58:34 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH RESEND v5 0/4] Freescale Enhanced Local Bus Controller
 (eLBC) binding YAML conversion
Date: Thu, 01 Jan 2026 17:58:13 +0100
Message-Id: <20260101-ppcyaml-elbc-v5-0-251c7f14a06c@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767286712; l=2344;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=ooT2t/4HDi3rmfv8HHUPwediCnOQ2VSqg+dxjAIoQhg=;
 b=tkESbjbCfHLs5ZLrxdB3VqXvHOOr2xcQRyDat/LnJymOrsQM4NuahZvrNrbPDuPcGYByIHfRJ
 b/3TMX2UBp0CjtyXqKUEFj+UbSJHe2OF381erdf/AOfUEnLRQfJJlKN
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



