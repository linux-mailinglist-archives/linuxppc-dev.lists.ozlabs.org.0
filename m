Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 171F74F5300
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 06:02:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KY9nm72ccz3bkb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 14:02:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KY9nL3RXxz2xjY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 14:01:56 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 13F81804AA;
 Wed,  6 Apr 2022 00:01:50 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v2] powerpc/boot: Stop using RELACOUNT
Date: Wed,  6 Apr 2022 14:01:48 +1000
Message-Id: <20220406040148.3608400-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

So far the RELACOUNT tag from the ELF header was containing the exact
number of R_PPC_RELATIVE/R_PPC64_RELATIVE relocations. However the LLVM's
recent change [1] make it equal-or-less than the actual number which
makes it useless.

This replaces RELACOUNT in zImage loader with a pair of RELASZ and RELAENT.
The vmlinux relocation code is fixed in commit d79976918852
("powerpc/64: Add UADDR64 relocation support").

To make it more future proof, this walks through the entire .rela.dyn
section instead of assuming that the section is sorter by a relocation
type. Unlike d79976918852, this does not add unaligned UADDR/UADDR64
relocations as we are likely not to see those in practice - the zImage
is small and very arch specific so there is a smaller chance that some
generic feature (such as PRINK_INDEX) triggers unaligned relocations.

[1] https://github.com/llvm/llvm-project/commit/da0e5b885b25cf4
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v2:
* s/divd/divwu/ for ppc32
* updated the commit log
* named all new labels instead of numbering them
(s/101f/.Lcheck_for_relaent/ and so on)
---
 arch/powerpc/boot/crt0.S | 45 ++++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/boot/crt0.S b/arch/powerpc/boot/crt0.S
index feadee18e271..e9306d862f8d 100644
--- a/arch/powerpc/boot/crt0.S
+++ b/arch/powerpc/boot/crt0.S
@@ -8,7 +8,8 @@
 #include "ppc_asm.h"
 
 RELA = 7
-RELACOUNT = 0x6ffffff9
+RELASZ = 8
+RELAENT = 9
 
 	.data
 	/* A procedure descriptor used when booting this as a COFF file.
@@ -75,34 +76,39 @@ p_base:	mflr	r10		/* r10 now points to runtime addr of p_base */
 	bne	11f
 	lwz	r9,4(r12)	/* get RELA pointer in r9 */
 	b	12f
-11:	addis	r8,r8,(-RELACOUNT)@ha
-	cmpwi	r8,RELACOUNT@l
+11:	cmpwi	r8,RELASZ
+	bne	.Lcheck_for_relaent
+	lwz	r0,4(r12)       /* get RELASZ value in r0 */
+	b	12f
+.Lcheck_for_relaent:
+	cmpwi	r8,RELAENT
 	bne	12f
-	lwz	r0,4(r12)	/* get RELACOUNT value in r0 */
+	lwz     r14,4(r12)      /* get RELAENT value in r14 */
 12:	addi	r12,r12,8
 	b	9b
 
 	/* The relocation section contains a list of relocations.
 	 * We now do the R_PPC_RELATIVE ones, which point to words
-	 * which need to be initialized with addend + offset.
-	 * The R_PPC_RELATIVE ones come first and there are RELACOUNT
-	 * of them. */
+	 * which need to be initialized with addend + offset */
 10:	/* skip relocation if we don't have both */
 	cmpwi	r0,0
 	beq	3f
 	cmpwi	r9,0
 	beq	3f
+	cmpwi	r14,0
+	beq	3f
 
 	add	r9,r9,r11	/* Relocate RELA pointer */
+	divwu   r0,r0,r14       /* RELASZ / RELAENT */
 	mtctr	r0
 2:	lbz	r0,4+3(r9)	/* ELF32_R_INFO(reloc->r_info) */
 	cmpwi	r0,22		/* R_PPC_RELATIVE */
-	bne	3f
+	bne	.Lnext
 	lwz	r12,0(r9)	/* reloc->r_offset */
 	lwz	r0,8(r9)	/* reloc->r_addend */
 	add	r0,r0,r11
 	stwx	r0,r11,r12
-	addi	r9,r9,12
+.Lnext:	add	r9,r9,r14
 	bdnz	2b
 
 	/* Do a cache flush for our text, in case the loader didn't */
@@ -160,32 +166,39 @@ p_base:	mflr	r10		/* r10 now points to runtime addr of p_base */
 	bne	10f
 	ld	r13,8(r11)       /* get RELA pointer in r13 */
 	b	11f
-10:	addis	r12,r12,(-RELACOUNT)@ha
-	cmpdi	r12,RELACOUNT@l
-	bne	11f
-	ld	r8,8(r11)       /* get RELACOUNT value in r8 */
+10:	cmpwi   r12,RELASZ
+	bne	.Lcheck_for_relaent
+	lwz	r8,8(r11)	/* get RELASZ pointer in r8 */
+	b	11f
+.Lcheck_for_relaent:
+	cmpwi	r12,RELAENT
+	bne     11f
+	lwz     r14,8(r11)      /* get RELAENT pointer in r14 */
 11:	addi	r11,r11,16
 	b	9b
 12:
-	cmpdi	r13,0            /* check we have both RELA and RELACOUNT */
+	cmpdi	r13,0            /* check we have both RELA, RELASZ, RELAENT*/
 	cmpdi	cr1,r8,0
 	beq	3f
 	beq	cr1,3f
+	cmpdi	r14,0
+	beq	3f
 
 	/* Calcuate the runtime offset. */
 	subf	r13,r13,r9
 
 	/* Run through the list of relocations and process the
 	 * R_PPC64_RELATIVE ones. */
+	divd    r8,r8,r14       /* RELASZ / RELAENT */
 	mtctr	r8
 13:	ld	r0,8(r9)        /* ELF64_R_TYPE(reloc->r_info) */
 	cmpdi	r0,22           /* R_PPC64_RELATIVE */
-	bne	3f
+	bne	.Lnext
 	ld	r12,0(r9)        /* reloc->r_offset */
 	ld	r0,16(r9)       /* reloc->r_addend */
 	add	r0,r0,r13
 	stdx	r0,r13,r12
-	addi	r9,r9,24
+.Lnext:	add	r9,r9,r14
 	bdnz	13b
 
 	/* Do a cache flush for our text, in case the loader didn't */
-- 
2.30.2

