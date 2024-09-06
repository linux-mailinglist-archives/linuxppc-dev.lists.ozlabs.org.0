Return-Path: <linuxppc-dev+bounces-1086-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C0D96EE32
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 10:34:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0TzK5wmcz3050;
	Fri,  6 Sep 2024 18:34:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725611645;
	cv=none; b=KfeYWAMk1uogMdZj7Q4qTes5rbqeITpry2H1IR/dlt5rcHwhrLELYH00vuIzxjmbQrilXYj4SzBxakQUWzn3yA0qCnGhmH1nqjMQVBBGQfyMvyOv1+9quibgCMk/AGhXCAgfp5dGjVdiOz8+0dtWnJA54FHrroI9x+ZEhrUnk5UpNwdTQS/4tP290pKACbPXOrw0g4RPWhbAHGJvERHsF4ZV1CpWan3ECxeyuoCxqGgGuYLd+cbQvOmtUFOGfjeaVP4nbzwlQ07yKTGL2lzbEWGd7LXIjR/Bq2dnMwynkwdkDqgbvtxLjMWDSb6JrGplQ6i5hTisoYInw5P2vZ/Y0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725611645; c=relaxed/relaxed;
	bh=F0dByEMbBNrHYadE3BNWO/hL0v/BE4O2RShKCAAa2/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TQqHdmBbVjb3y9GcZRAMgvbbqAx5PdZnxPCGW8UAfeOYC+efE4nDVRJnqyOz1iNIe3Gj05i6rzrky6CgrwZjE1voNRkbhnwlDFywjR4kW5Ke2TYKV9SQ+2eStEb4nwWd+/NK/5Jz873TTo4IKmXfvkjIFpvAknImJgXd+tKJwcEao8bPCr8r2hik3wZp18gM7mxQTgmDgxO6Y27hKNJEZRht+ENQpO3+7ZMu3ItZFojn/qrmLkoEbOhiPMrorIBYx23wF/sK2FP8DfgNwibP8DI7u2jPBixe2TB5xsD+vykH+2rCla+CjUNYFo5X4cwjx8H5WIQnkofp1ltLZNewCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0TzK3bVHz301n
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 18:34:05 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X0Tz94Jn1z9sRy;
	Fri,  6 Sep 2024 10:33:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TG1PLnKkNXF4; Fri,  6 Sep 2024 10:33:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X0Tz93Vpdz9sRr;
	Fri,  6 Sep 2024 10:33:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 699B78B764;
	Fri,  6 Sep 2024 10:33:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id VLDe3sqJRDYo; Fri,  6 Sep 2024 10:33:57 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.70])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A81EB8B778;
	Fri,  6 Sep 2024 10:33:56 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrei Vagin <avagin@gmail.com>
Subject: [PATCH 2/2] Fixup for 3279be36b671 ("powerpc/vdso: Wire up getrandom() vDSO implementation on VDSO32")
Date: Fri,  6 Sep 2024 10:33:44 +0200
Message-ID: <ffd7fc255e194d1e2b0aa3d9d129e826c53219d4.1725611321.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <700dbf296d02e32376329774be35cfbead08041d.1725611321.git.christophe.leroy@csgroup.eu>
References: <700dbf296d02e32376329774be35cfbead08041d.1725611321.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725611624; l=744; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=/x35oQvh5k9BBpuokbemChsJLjrttc1Fa44tLuwAFfM=; b=6AyXhA5x8UZSu669tkJkKDz05fAfvHARHPnGBuOcxmLsRUSQZjSVlBinNk/3LziSPIHodw8YT aqVJFistZ+yA8GVNsGzoeVOdDkyVE+7aaFPvHHqGvviH98kG7qziZXJ
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Use the new get_realdatapage macro instead of get_datapage

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso/getrandom.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/vdso/getrandom.S b/arch/powerpc/kernel/vdso/getrandom.S
index a957cd2b2b03..f3bbf931931c 100644
--- a/arch/powerpc/kernel/vdso/getrandom.S
+++ b/arch/powerpc/kernel/vdso/getrandom.S
@@ -31,7 +31,7 @@
 	PPC_STL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
   .cfi_rel_offset r2, PPC_MIN_STKFRM + STK_GOT
 #endif
-	get_datapage	r8
+	get_realdatapage	r8, r11
 	addi		r8, r8, VDSO_RNG_DATA_OFFSET
 	bl		CFUNC(DOTSYM(\funct))
 	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
-- 
2.44.0


