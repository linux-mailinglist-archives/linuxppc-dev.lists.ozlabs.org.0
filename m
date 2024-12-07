Return-Path: <linuxppc-dev+bounces-3849-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D199E7F77
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2024 11:09:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y53l62X8Hz2y72;
	Sat,  7 Dec 2024 21:09:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733566178;
	cv=none; b=PjV5qbp7GJUnBcqZUZnKqUdOQBwBIrvRGlj+mla+uS3eHZuhzblhFP+w9jAjfiA5O56K7us/vm/k2ARhG4PM0r1Gh0d5qnuTPZDbfpa2Z35UqLh6yYmfZUzkwyFmzk8JG73WUVaxBN/BMfDPZU92LicMqPq5uPQGmnIRpgmoBeD5dewZeXPNArVovZyFW673E6xTNxZRLN8xlQwsDFtTyMX4MRWf3FckyabTuZHhYIxRq6P6mNpMmrAJ9+4tWC809VcYJDL3FTjnC8doK1iU+1y2KepA1uetygP0bYr/j2J92ADeBzgPwRXCLnSK9yp9mB3keUe5pcVovVsg5IusSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733566178; c=relaxed/relaxed;
	bh=iuswerfGIWplkGHb8leenrxzZFDLO/UW/rJm/821ifc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J42FLaXFRgSyZOi8PSUIUlWSkW3TWDqmtejgJM43vejzRX+ppw3SoKgyIr89hq28ofOQiNR89+0nTSfOpCT1kinFfF6SEKkuq3dUEnpbGFXipgPv4Zdtf79MpXicfNL7nSa7IZDuJ0SO12/+Zx5vbkYKpiE8+4A2dpF3sQdYPhVMSKuKCboSjvjgiiX81rrABDws2QX/0lbmmRsdKLaSDzKzGwxOWy49WDQa2rrja9bZ00rlBLH5Cuk89sXkDY12ySdVxTrVrpg3QKPcE0J96sD1Vd0gq6DpuD/cWUmxPCUXrmic0Fhuzpqr5/BmOVJWd5jsGt6GPAaa/g1i0eZYmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y53l45F70z2y66
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Dec 2024 21:09:34 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y53kx4mtdz9tLB;
	Sat,  7 Dec 2024 11:09:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C4zhMVynpln9; Sat,  7 Dec 2024 11:09:29 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y53kx3VkZz9tL9;
	Sat,  7 Dec 2024 11:09:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 68CE48B764;
	Sat,  7 Dec 2024 11:09:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id UO3D8tEVi-Dm; Sat,  7 Dec 2024 11:09:29 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EE7BF8B763;
	Sat,  7 Dec 2024 11:09:28 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/32: Replace mulhdu() by mul_u64_u64_shr()
Date: Sat,  7 Dec 2024 11:09:27 +0100
Message-ID: <f29e473c193c87bdbd36b209dfdee99d2f0c60dc.1733566130.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733566167; l=6581; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=jUG7HuO6RE00W7lLvwMjct1xB0qb2TjK9NT3SNoFs3o=; b=cUyRHNKAVZ6+cOr7tgyg5+UYjZWiIXAvksjnEMYVKwkk5E5qQMsIvZhosz6TrpInPWKcIsRQD Gqz/bbt/BblA1NzpLPM4kGGaPSqO+ZVVXBbtDIBA256BJMIvikX/zmr
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Using mul_u64_u64_shr() provides similar calculation as mulhdu()
assembly function, but enables inlining by the compiler.

The home-made assembly function had special handling for when one of
the arguments is not a fully populated u64 but time functions use it
to multiply timebase by a calculated scale which is constructed to
have most significant bit set.

On mpc8xx sched_clock() runs 3% faster. On mpc83xx it is 2%.

As you can see below, sched_clock() is not much bigger than before:

	c000cf68 <sched_clock>:
	c000cf68:	7d 2d 42 a6 	mftbu   r9
	c000cf6c:	7d 0c 42 a6 	mftb    r8
	c000cf70:	7d 4d 42 a6 	mftbu   r10
	c000cf74:	7c 09 50 40 	cmplw   r9,r10
	c000cf78:	40 82 ff f0 	bne     c000cf68 <sched_clock>
	c000cf7c:	3d 40 c1 37 	lis     r10,-16073
	c000cf80:	38 8a b3 30 	addi    r4,r10,-19664
	c000cf84:	80 ea b3 30 	lwz     r7,-19664(r10)
	c000cf88:	80 64 00 14 	lwz     r3,20(r4)
	c000cf8c:	39 40 00 00 	li      r10,0
	c000cf90:	80 a4 00 04 	lwz     r5,4(r4)
	c000cf94:	80 c4 00 10 	lwz     r6,16(r4)
	c000cf98:	7c 63 40 10 	subfc   r3,r3,r8
	c000cf9c:	80 84 00 08 	lwz     r4,8(r4)
	c000cfa0:	7d 06 49 10 	subfe   r8,r6,r9
	c000cfa4:	7c c7 19 d6 	mullw   r6,r7,r3
	c000cfa8:	7d 25 18 16 	mulhwu  r9,r5,r3
	c000cfac:	7c 08 29 d6 	mullw   r0,r8,r5
	c000cfb0:	7c 67 18 16 	mulhwu  r3,r7,r3
	c000cfb4:	7d 29 30 14 	addc    r9,r9,r6
	c000cfb8:	7c a8 28 16 	mulhwu  r5,r8,r5
	c000cfbc:	7c ca 51 14 	adde    r6,r10,r10
	c000cfc0:	7d 67 41 d6 	mullw   r11,r7,r8
	c000cfc4:	7d 29 00 14 	addc    r9,r9,r0
	c000cfc8:	7c c6 01 94 	addze   r6,r6
	c000cfcc:	7c 63 28 14 	addc    r3,r3,r5
	c000cfd0:	7d 4a 51 14 	adde    r10,r10,r10
	c000cfd4:	7c e7 40 16 	mulhwu  r7,r7,r8
	c000cfd8:	7c 63 58 14 	addc    r3,r3,r11
	c000cfdc:	7d 4a 01 94 	addze   r10,r10
	c000cfe0:	7c 63 30 14 	addc    r3,r3,r6
	c000cfe4:	7d 4a 39 14 	adde    r10,r10,r7
	c000cfe8:	35 24 ff e0 	addic.  r9,r4,-32
	c000cfec:	41 80 00 10 	blt     c000cffc <sched_clock+0x94>
	c000cff0:	7c 63 48 30 	slw     r3,r3,r9
	c000cff4:	38 80 00 00 	li      r4,0
	c000cff8:	4e 80 00 20 	blr
	c000cffc:	21 04 00 1f 	subfic  r8,r4,31
	c000d000:	54 69 f8 7e 	srwi    r9,r3,1
	c000d004:	7d 4a 20 30 	slw     r10,r10,r4
	c000d008:	7d 29 44 30 	srw     r9,r9,r8
	c000d00c:	7c 64 20 30 	slw     r4,r3,r4
	c000d010:	7d 23 53 78 	or      r3,r9,r10
	c000d014:	4e 80 00 20 	blr

Before this change:

	c000d0bc <sched_clock>:
	c000d0bc:	94 21 ff f0 	stwu    r1,-16(r1)
	c000d0c0:	7c 08 02 a6 	mflr    r0
	c000d0c4:	90 01 00 14 	stw     r0,20(r1)
	c000d0c8:	93 e1 00 0c 	stw     r31,12(r1)
	c000d0cc:	7d 2d 42 a6 	mftbu   r9
	c000d0d0:	7d 0c 42 a6 	mftb    r8
	c000d0d4:	7d 4d 42 a6 	mftbu   r10
	c000d0d8:	7c 09 50 40 	cmplw   r9,r10
	c000d0dc:	40 82 ff f0 	bne     c000d0cc <sched_clock+0x10>
	c000d0e0:	3f e0 c1 37 	lis     r31,-16073
	c000d0e4:	3b ff b3 30 	addi    r31,r31,-19664
	c000d0e8:	80 9f 00 14 	lwz     r4,20(r31)
	c000d0ec:	80 7f 00 10 	lwz     r3,16(r31)
	c000d0f0:	7c 84 40 10 	subfc   r4,r4,r8
	c000d0f4:	80 bf 00 00 	lwz     r5,0(r31)
	c000d0f8:	80 df 00 04 	lwz     r6,4(r31)
	c000d0fc:	7c 63 49 10 	subfe   r3,r3,r9
	c000d100:	48 00 37 85 	bl      c0010884 <mulhdu>
	c000d104:	81 3f 00 08 	lwz     r9,8(r31)
	c000d108:	35 49 ff e0 	addic.  r10,r9,-32
	c000d10c:	41 80 00 20 	blt     c000d12c <sched_clock+0x70>
	c000d110:	80 01 00 14 	lwz     r0,20(r1)
	c000d114:	7c 83 50 30 	slw     r3,r4,r10
	c000d118:	83 e1 00 0c 	lwz     r31,12(r1)
	c000d11c:	38 80 00 00 	li      r4,0
	c000d120:	7c 08 03 a6 	mtlr    r0
	c000d124:	38 21 00 10 	addi    r1,r1,16
	c000d128:	4e 80 00 20 	blr
	c000d12c:	80 01 00 14 	lwz     r0,20(r1)
	c000d130:	54 8a f8 7e 	srwi    r10,r4,1
	c000d134:	21 09 00 1f 	subfic  r8,r9,31
	c000d138:	83 e1 00 0c 	lwz     r31,12(r1)
	c000d13c:	7c 63 48 30 	slw     r3,r3,r9
	c000d140:	7d 4a 44 30 	srw     r10,r10,r8
	c000d144:	7c 84 48 30 	slw     r4,r4,r9
	c000d148:	7d 43 1b 78 	or      r3,r10,r3
	c000d14c:	7c 08 03 a6 	mtlr    r0
	c000d150:	38 21 00 10 	addi    r1,r1,16
	c000d154:	4e 80 00 20 	blr

	c0010884 <mulhdu>:
	c0010884:	2c 06 00 00 	cmpwi   r6,0
	c0010888:	2c 83 00 00 	cmpwi   cr1,r3,0
	c001088c:	7c 8a 23 78 	mr      r10,r4
	c0010890:	7c 84 28 16 	mulhwu  r4,r4,r5
	c0010894:	41 82 00 14 	beq     c00108a8 <mulhdu+0x24>
	c0010898:	7c 0a 30 16 	mulhwu  r0,r10,r6
	c001089c:	7c ea 29 d6 	mullw   r7,r10,r5
	c00108a0:	7c e0 38 14 	addc    r7,r0,r7
	c00108a4:	7c 84 01 94 	addze   r4,r4
	c00108a8:	4d 86 00 20 	beqlr   cr1
	c00108ac:	7d 23 29 d6 	mullw   r9,r3,r5
	c00108b0:	7d 43 28 16 	mulhwu  r10,r3,r5
	c00108b4:	41 82 00 18 	beq     c00108cc <mulhdu+0x48>
	c00108b8:	7c 03 31 d6 	mullw   r0,r3,r6
	c00108bc:	7d 03 30 16 	mulhwu  r8,r3,r6
	c00108c0:	7c e0 38 14 	addc    r7,r0,r7
	c00108c4:	7c 84 41 14 	adde    r4,r4,r8
	c00108c8:	7d 4a 01 94 	addze   r10,r10
	c00108cc:	7c 84 48 14 	addc    r4,r4,r9
	c00108d0:	7c 6a 01 94 	addze   r3,r10
	c00108d4:	4e 80 00 20 	blr

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/time.h |  2 +-
 arch/powerpc/kernel/misc_32.S   | 26 --------------------------
 2 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 221c8f8ff89b..9bdd8080299b 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -86,7 +86,7 @@ static inline unsigned long tb_ticks_since(unsigned long tstamp)
 #define mulhdu(x,y) \
 ({unsigned long z; asm ("mulhdu %0,%1,%2" : "=r" (z) : "r" (x), "r" (y)); z;})
 #else
-extern u64 mulhdu(u64, u64);
+#define mulhdu(x, y)	mul_u64_u64_shr(x, y, 64)
 #endif
 
 extern void div128_by_32(u64 dividend_high, u64 dividend_low,
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index 033cd00aa0fc..acb727f54e9d 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -27,32 +27,6 @@
 
 	.text
 
-/*
- * This returns the high 64 bits of the product of two 64-bit numbers.
- */
-_GLOBAL(mulhdu)
-	cmpwi	r6,0
-	cmpwi	cr1,r3,0
-	mr	r10,r4
-	mulhwu	r4,r4,r5
-	beq	1f
-	mulhwu	r0,r10,r6
-	mullw	r7,r10,r5
-	addc	r7,r0,r7
-	addze	r4,r4
-1:	beqlr	cr1		/* all done if high part of A is 0 */
-	mullw	r9,r3,r5
-	mulhwu	r10,r3,r5
-	beq	2f
-	mullw	r0,r3,r6
-	mulhwu	r8,r3,r6
-	addc	r7,r0,r7
-	adde	r4,r4,r8
-	addze	r10,r10
-2:	addc	r4,r4,r9
-	addze	r3,r10
-	blr
-
 /*
  * reloc_got2 runs through the .got2 section adding an offset
  * to each entry.
-- 
2.47.0


