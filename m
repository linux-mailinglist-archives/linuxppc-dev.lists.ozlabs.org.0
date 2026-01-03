Return-Path: <linuxppc-dev+bounces-15191-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9297CF047B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 03 Jan 2026 19:58:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dk8w724mVz2yPM;
	Sun, 04 Jan 2026 05:58:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767466695;
	cv=none; b=LiL2UspTiYyy5snh3hfvLseuXUQswf512hcEthIUGiFFLCBWPvKZWRsKYHznIPf0caLQfCuYYG76L8SCweSOviBXrM4DjRVdicBzOawTNS8P3ydnct2mHuF3JEyRWYwC69WRB5reHfXMV7qNdxBv3WHE3Dy/CgwDq1hHDcnZgTSLVwem3z+nEjp9LdY0mtvvRRUDRZNIoUbJQ1/IIBbCVXzaShJvogX1WA+TQdQOB+9bDtnrDKOKoozrU2XCZeZ3tZ1ynWqHnIhMvEOIkJ8qR32/kJfZeU+uO4tFCKuNyLpJ2Z2ElBDZ0KlnkyIbOvvaQ+Wme1jwydurakRqGn1Q0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767466695; c=relaxed/relaxed;
	bh=nhYbY9JpemZA/SSNPnIlbeSZ1rFMmu1MfW/XoDAMS/Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oXeSKfjcoHFIUh6R+4wGSkOk6Rs60pwMYKXtpxDmyoO4hIN9dFX/TDWAeeS2krIEPCBm5kVgWrCvawAkicUcmwwxnwMs3JmIkyrwdvfl2ipqnkcVnIuCQwG2Fab79OUZeak+EQSe8Zax1jRokHuXK9KXa4kV6W7dgp9suJHo+77pAXqT6bJfVcLg0OaXwX9iufZ8TClGvzanGHB3ri4fkheexDOc0aO0lm0v/Yx8vG17Cy3oufVk8aswRoP+83HLrOpGshAnMXfl3kdxLrl2fhcnNNYlILhN1wNiIiMVgxkS88DO+R0iXgnRO92/VaYWXdYWPU22KpkvADbOWZM7Bw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qFblRkXw; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qFblRkXw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dk8w62m0rz2yKp
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Jan 2026 05:58:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85F084334D;
	Sat,  3 Jan 2026 18:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BDD9C113D0;
	Sat,  3 Jan 2026 18:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767466662;
	bh=79m/nJ/QDMP8KLr5bX+4nacC2eKgzRySRWsaV7zH+GM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qFblRkXwKvNrauVIYruUzKIkXE5Z9rjuvRYR+oXJ0tDHFoYyOtyhWubXF+gS+2Ri5
	 tuJReFhQOAv4ypBR9IshOyJpWmU23qiwaGSmWW0wtwRzM7Bvwylo6TudYT146NAx2J
	 PwAAQvjE3w32AuyZMUYkNf4q3NFQI9AhC4r2TM5mLaTc2kPzvjyRgbfah7aI3to5+U
	 Ubx4RRfmHm1PIt+eoQBQ4fw51lYZm+KKJBqbYdi0FhSYYjwFwG0sMFL1y+plfzV9Qd
	 WCeTPvSXb6YoViikdNafFNGo09Bq/FKWbiC44HyfNRH/W/teCJsI3zZWzNmxwHbRpE
	 23WyW+4lgKfZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32024FC6182;
	Sat,  3 Jan 2026 18:57:42 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH v2 0/5] PowerPC: A few cleanups in MPC83xx devicetrees
Date: Sat, 03 Jan 2026 19:54:04 +0100
Message-Id: <20260103-mpc83xx-cleanup-v2-0-b2a13c0a0d63@posteo.net>
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
X-B4-Tracking: v=1; b=H4sIAMxlWWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDQwND3dyCZAvjigrd5JzUxLzSAl2TlFSLlDQjS4Nkc1MloK6CotS0zAq
 widGxtbUAsAtLrmEAAAA=
X-Change-ID: 20260101-mpc83xx-cleanup-4de8df290c75
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767466660; l=1655;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=79m/nJ/QDMP8KLr5bX+4nacC2eKgzRySRWsaV7zH+GM=;
 b=4uOPvJj2DCAbQMXQnEmxLy/rrOrQ91EW1qu20Q340P7+2tkitZyITztORk1/v/mZ+jrLVcWvS
 SOvnF2zbdoCBJr1qVEjChBmg7Hr+jxKp/4KWsbdUA6G6ZbvepQAeBYe
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

This series contains a few cleanups for mpc8315erdb.dts and other
PowerPC devicetrees, which are hopefully uncontroversial.

Some of the patches were previously part of another, larger series,
titled "powerpc: MPC83xx cleanup and LANCOM NWAPP2 board", but that
series became too unwieldy to carry on. For this reason, this series
starts at version 2.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
J. Neuschäfer (5):
      powerpc: dts: mpc8313erdb: Use IRQ_TYPE_* macros
      powerpc: dts: mpc8315erdb: Use IRQ_TYPE_* macros
      powerpc: dts: mpc8315erdb: Rename LED nodes to comply with schema
      powerpc: dts: mpc8315erdb: Add missing #cells properties to SPI bus
      powerpc: dts: mpc83xx: Add unit addresses to /memory

 arch/powerpc/boot/dts/asp834x-redboot.dts |   2 +-
 arch/powerpc/boot/dts/mpc8308_p1m.dts     |   2 +-
 arch/powerpc/boot/dts/mpc8308rdb.dts      |   2 +-
 arch/powerpc/boot/dts/mpc8313erdb.dts     |  61 ++++++++-------
 arch/powerpc/boot/dts/mpc8315erdb.dts     | 119 ++++++++++++++++--------------
 arch/powerpc/boot/dts/mpc832x_rdb.dts     |   2 +-
 arch/powerpc/boot/dts/mpc8349emitx.dts    |   2 +-
 arch/powerpc/boot/dts/mpc8349emitxgp.dts  |   2 +-
 arch/powerpc/boot/dts/mpc8377_rdb.dts     |   2 +-
 arch/powerpc/boot/dts/mpc8377_wlan.dts    |   2 +-
 arch/powerpc/boot/dts/mpc8378_rdb.dts     |   2 +-
 arch/powerpc/boot/dts/mpc8379_rdb.dts     |   2 +-
 12 files changed, 109 insertions(+), 91 deletions(-)
---
base-commit: d3f2d8e7de622d2a2d4283cb545e51745d87f0c5
change-id: 20260101-mpc83xx-cleanup-4de8df290c75

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



