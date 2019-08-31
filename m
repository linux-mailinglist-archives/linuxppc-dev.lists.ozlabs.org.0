Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66659A4414
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 12:37:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46LCTB0gDgzDqpR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 20:37:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="cD59VHuC"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46LC3w6z1YzDrBd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 20:18:36 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46LC3r2bBpz9v4gQ;
 Sat, 31 Aug 2019 12:18:32 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=cD59VHuC; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id TxjPvZrgChDw; Sat, 31 Aug 2019 12:18:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46LC3r1WPdz9v4gL;
 Sat, 31 Aug 2019 12:18:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567246712; bh=fl2HNmobMof+DXX69tI9zUXRnCUikI6nzvCQlhydxsQ=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=cD59VHuCv/0QWvduyHxNbJsHg55g3ddXMgAVbCxyiB4MIhrPrXBHyDqelW8Oekd2L
 K6zrWAYCK7qI9CKg37xdNiHQu8H6beflTRpaoCXaTVgeOfz0ZykBJ8/hcp++B493ED
 92fMLMYqzO73lbAoDpqsTuoXiNqEtGDb/Ge5ECbA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E0138B7B9;
 Sat, 31 Aug 2019 12:18:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xxVNnYKdNJgY; Sat, 31 Aug 2019 12:18:33 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4F4AF8B789;
 Sat, 31 Aug 2019 12:18:33 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1540A6985C; Sat, 31 Aug 2019 10:18:33 +0000 (UTC)
Message-Id: <99e5c555ade2e65baf3286a6d16a111c93b5981e.1567245404.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1567245404.git.christophe.leroy@c-s.fr>
References: <cover.1567245404.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 08/10] powerpc/8xx: Enable CONFIG_VMAP_STACK
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, dja@axtens.net
Date: Sat, 31 Aug 2019 10:18:33 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch enables CONFIG_VMAP_STACK. For that, a few changes are
done in head_8xx.S.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/Kconfig           |  1 +
 arch/powerpc/kernel/head_8xx.S | 47 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6137f5e3bb2d..ddbec19c3c22 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -178,6 +178,7 @@ config PPC
 	select HAVE_ARCH_NVRAM_OPS
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
+	select HAVE_ARCH_VMAP_STACK		if PPC_8xx
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_CBPF_JIT			if !PPC64
 	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 2fa02ae7a88c..dfd68b72688e 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -127,8 +127,12 @@ instruction_counter:
 	. = 0x200
 MachineCheck:
 	EXCEPTION_PROLOG
+#ifdef CONFIG_VMAP_STACK
+	lwz r4, _DAR(r11)
+#else
 	mfspr r4,SPRN_DAR
 	stw r4,_DAR(r11)
+#endif
 	li r5,RPN_PATTERN
 	mtspr SPRN_DAR,r5	/* Tag DAR, to be used in DTLB Error */
 	mfspr r5,SPRN_DSISR
@@ -143,8 +147,12 @@ MachineCheck:
 	. = 0x600
 Alignment:
 	EXCEPTION_PROLOG
+#ifdef CONFIG_VMAP_STACK
+	lwz r4, _DAR(r11)
+#else
 	mfspr	r4,SPRN_DAR
 	stw	r4,_DAR(r11)
+#endif
 	li	r5,RPN_PATTERN
 	mtspr	SPRN_DAR,r5	/* Tag DAR, to be used in DTLB Error */
 	mfspr	r5,SPRN_DSISR
@@ -467,17 +475,28 @@ DataTLBError:
 	cmpwi	cr0, r11, RPN_PATTERN
 	beq-	FixupDAR	/* must be a buggy dcbX, icbi insn. */
 DARFixed:/* Return from dcbx instruction bug workaround */
+#ifdef CONFIG_VMAP_STACK
+	li	r11, RPN_PATTERN
+	mtspr	SPRN_DAR, r11	/* Tag DAR, to be used in DTLB Error */
+	mfspr	r11, SPRN_SRR1
+#endif
 	EXCEPTION_PROLOG_1
 	EXCEPTION_PROLOG_2
 	mfspr	r5,SPRN_DSISR
 	stw	r5,_DSISR(r11)
+#ifdef CONFIG_VMAP_STACK
+	lwz r4, _DAR(r11)
+#else
 	mfspr	r4,SPRN_DAR
+#endif
 	andis.	r10,r5,DSISR_NOHPTE@h
 	beq+	.Ldtlbie
 	tlbie	r4
 .Ldtlbie:
+#ifndef CONFIG_VMAP_STACK
 	li	r10,RPN_PATTERN
 	mtspr	SPRN_DAR,r10	/* Tag DAR, to be used in DTLB Error */
+#endif
 	/* 0x300 is DataAccess exception, needed by bad_page_fault() */
 	EXC_XFER_LITE(0x300, handle_page_fault)
 
@@ -498,6 +517,9 @@ DARFixed:/* Return from dcbx instruction bug workaround */
  * using them.
  */
 do_databreakpoint:
+#ifdef CONFIG_VMAP_STACK
+	mfspr	r11, SPRN_SRR1
+#endif
 	EXCEPTION_PROLOG_1
 	EXCEPTION_PROLOG_2
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -508,8 +530,21 @@ do_databreakpoint:
 
 	. = 0x1c00
 DataBreakpoint:
-	EXCEPTION_PROLOG_0
+	mtspr	SPRN_SPRG_SCRATCH0, r10
+	mtspr	SPRN_SPRG_SCRATCH1, r11
+#ifdef CONFIG_VMAP_STACK
+	mfspr	r10, SPRN_SPRG_THREAD
+	mfspr	r11, SPRN_DAR
+	stw	r11, DAR(r10)
+	mfspr	r11, SPRN_SRR1
+	stw	r11, SRR1(r10)
+#endif
 	mfspr	r11, SPRN_SRR0
+#ifdef CONFIG_VMAP_STACK
+	stw	r11, SRR0(r10)
+#endif
+	mfcr	r10
+
 	cmplwi	cr0, r11, (.Ldtlbie - PAGE_OFFSET)@l
 	cmplwi	cr7, r11, (.Litlbie - PAGE_OFFSET)@l
 	cror	4*cr0+eq, 4*cr0+eq, 4*cr7+eq
@@ -625,7 +660,12 @@ modified_instr:
 	.space	4		/* this is where the add instr. is stored */
 	bne+	143f
 	subf	r10,r0,r10	/* r10=r10-r0, only if reg RA is r0 */
+#ifdef CONFIG_VMAP_STACK
+143:	mfspr	r11, SPRN_SPRG_THREAD
+	stw	r10, DAR(r11)
+#else
 143:	mtdar	r10		/* store faulting EA in DAR */
+#endif
 	mfspr	r10,SPRN_M_TW
 	b	DARFixed	/* Go back to normal TLB handling */
 #else
@@ -679,7 +719,12 @@ modified_instr:
 152:
 	mfdar	r11
 	mtctr	r11			/* restore ctr reg from DAR */
+#ifdef CONFIG_VMAP_STACK
+	mfspr	r11, SPRN_SPRG_THREAD
+	stw	r10, DAR(r11)
+#else
 	mtdar	r10			/* save fault EA to DAR */
+#endif
 	mfspr	r10,SPRN_M_TW
 	b	DARFixed		/* Go back to normal TLB handling */
 
-- 
2.13.3

