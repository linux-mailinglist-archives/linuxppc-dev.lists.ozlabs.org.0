Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA49E2E0B52
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 15:04:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0dPd5TlWzDqWd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 01:04:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0cc6671vzDqF7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 00:28:38 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4D0cc01qbPz9v15V;
 Tue, 22 Dec 2020 14:28:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id aiwDq1mqTdWO; Tue, 22 Dec 2020 14:28:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4D0cc00Ptbz9v15Z;
 Tue, 22 Dec 2020 14:28:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 62C3C8B812;
 Tue, 22 Dec 2020 14:28:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Ftiy2PsMhZ03; Tue, 22 Dec 2020 14:28:33 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ED8198B81C;
 Tue, 22 Dec 2020 14:28:32 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id CCEE366969; Tue, 22 Dec 2020 13:28:32 +0000 (UTC)
Message-Id: <f470e8c6af6921becc50dd2a2b6f6b32a120c5a2.1608641533.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1608641532.git.christophe.leroy@csgroup.eu>
References: <cover.1608641532.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 10/15] powerpc/32: Make VMAP stack code depend on
 HAVE_ARCH_VMAP_STACK
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue, 22 Dec 2020 13:28:32 +0000 (UTC)
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

If the code can use a stack in vm area, it can also use a
stack in linear space.

Simplify code by removing old non VMAP stack code on 6xx and 8xx.

In common code, depend on HAVE_ARCH_VMAP_STACK instead of
depending on VMAP_STACK.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/processor.h |  2 +-
 arch/powerpc/kernel/asm-offsets.c    |  2 +-
 arch/powerpc/kernel/entry_32.S       |  5 +-
 arch/powerpc/kernel/fpu.S            |  2 +-
 arch/powerpc/kernel/head_6xx_8xx.h   | 82 +---------------------------
 arch/powerpc/kernel/head_8xx.S       | 17 ++----
 arch/powerpc/kernel/head_book3s_32.S | 38 +------------
 arch/powerpc/kernel/idle_6xx.S       |  8 ---
 arch/powerpc/kernel/vector.S         |  2 +-
 arch/powerpc/mm/book3s32/hash_low.S  | 14 -----
 10 files changed, 11 insertions(+), 161 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 8acc3590c971..16442a770050 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -152,7 +152,7 @@ struct thread_struct {
 #if defined(CONFIG_PPC_BOOK3S_32) && defined(CONFIG_PPC_KUAP)
 	unsigned long	kuap;		/* opened segments for user access */
 #endif
-#ifdef CONFIG_VMAP_STACK
+#ifdef CONFIG_HAVE_ARCH_VMAP_STACK
 	unsigned long	srr0;
 	unsigned long	srr1;
 	unsigned long	dar;
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index b12d7c049bfe..e2b5d25d16f4 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -132,7 +132,7 @@ int main(void)
 	OFFSET(KSP_VSID, thread_struct, ksp_vsid);
 #else /* CONFIG_PPC64 */
 	OFFSET(PGDIR, thread_struct, pgdir);
-#ifdef CONFIG_VMAP_STACK
+#ifdef CONFIG_HAVE_ARCH_VMAP_STACK
 	OFFSET(SRR0, thread_struct, srr0);
 	OFFSET(SRR1, thread_struct, srr1);
 	OFFSET(DAR, thread_struct, dar);
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index c1687f3cd0ca..9ef75efaff47 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -321,9 +321,6 @@ stack_ovf:
 	lis	r9,StackOverflow@ha
 	addi	r9,r9,StackOverflow@l
 	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL)
-#if defined(CONFIG_PPC_8xx) && defined(CONFIG_PERF_EVENTS)
-	mtspr	SPRN_NRI, r0
-#endif
 	mtspr	SPRN_SRR0,r9
 	mtspr	SPRN_SRR1,r10
 	rfi
@@ -1353,7 +1350,7 @@ _GLOBAL(enter_rtas)
 	mtspr	SPRN_SRR1,r9
 	rfi
 1:	tophys_novmstack r9, r1
-#ifdef CONFIG_VMAP_STACK
+#ifdef CONFIG_HAVE_ARCH_VMAP_STACK
 	li	r0, MSR_KERNEL & ~MSR_IR	/* can take DTLB miss */
 	mtmsr	r0
 	isync
diff --git a/arch/powerpc/kernel/fpu.S b/arch/powerpc/kernel/fpu.S
index 3ff9a8fafa46..5be78db32257 100644
--- a/arch/powerpc/kernel/fpu.S
+++ b/arch/powerpc/kernel/fpu.S
@@ -92,7 +92,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 	/* enable use of FP after return */
 #ifdef CONFIG_PPC32
 	mfspr	r5,SPRN_SPRG_THREAD	/* current task's THREAD (phys) */
-#ifdef CONFIG_VMAP_STACK
+#ifdef CONFIG_HAVE_ARCH_VMAP_STACK
 	tovirt(r5, r5)
 #endif
 	lwz	r4,THREAD_FPEXC_MODE(r5)
diff --git a/arch/powerpc/kernel/head_6xx_8xx.h b/arch/powerpc/kernel/head_6xx_8xx.h
index b70d50efc961..540092fb90a9 100644
--- a/arch/powerpc/kernel/head_6xx_8xx.h
+++ b/arch/powerpc/kernel/head_6xx_8xx.h
@@ -19,7 +19,6 @@
 .macro EXCEPTION_PROLOG_0 handle_dar_dsisr=0
 	mtspr	SPRN_SPRG_SCRATCH0,r10
 	mtspr	SPRN_SPRG_SCRATCH1,r11
-#ifdef CONFIG_VMAP_STACK
 	mfspr	r10, SPRN_SPRG_THREAD
 	.if	\handle_dar_dsisr
 	mfspr	r11, SPRN_DAR
@@ -29,17 +28,13 @@
 	.endif
 	mfspr	r11, SPRN_SRR0
 	stw	r11, SRR0(r10)
-#endif
 	mfspr	r11, SPRN_SRR1		/* check whether user or kernel */
-#ifdef CONFIG_VMAP_STACK
 	stw	r11, SRR1(r10)
-#endif
 	mfcr	r10
 	andi.	r11, r11, MSR_PR
 .endm
 
 .macro EXCEPTION_PROLOG_1
-#ifdef CONFIG_VMAP_STACK
 	mtspr	SPRN_SPRG_SCRATCH2,r1
 	subi	r1, r1, INT_FRAME_SIZE		/* use r1 if kernel */
 	beq	1f
@@ -47,20 +42,13 @@
 	lwz	r1,TASK_STACK-THREAD(r1)
 	addi	r1, r1, THREAD_SIZE - INT_FRAME_SIZE
 1:
+#ifdef CONFIG_VMAP_STACK
 	mtcrf	0x3f, r1
 	bt	32 - THREAD_ALIGN_SHIFT, stack_overflow
-#else
-	subi	r11, r1, INT_FRAME_SIZE		/* use r1 if kernel */
-	beq	1f
-	mfspr	r11,SPRN_SPRG_THREAD
-	lwz	r11,TASK_STACK-THREAD(r11)
-	addi	r11, r11, THREAD_SIZE - INT_FRAME_SIZE
-1:	tophys(r11, r11)
 #endif
 .endm
 
 .macro EXCEPTION_PROLOG_2 handle_dar_dsisr=0
-#ifdef CONFIG_VMAP_STACK
 	li	r11, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
 	mtmsr	r11
 	isync
@@ -68,11 +56,6 @@
 	stw	r11,GPR1(r1)
 	stw	r11,0(r1)
 	mr	r11, r1
-#else
-	stw	r1,GPR1(r11)
-	stw	r1,0(r11)
-	tovirt(r1, r11)		/* set new kernel sp */
-#endif
 	stw	r10,_CCR(r11)		/* save registers */
 	stw	r12,GPR12(r11)
 	stw	r9,GPR9(r11)
@@ -82,7 +65,6 @@
 	stw	r12,GPR11(r11)
 	mflr	r10
 	stw	r10,_LINK(r11)
-#ifdef CONFIG_VMAP_STACK
 	mfspr	r12, SPRN_SPRG_THREAD
 	tovirt(r12, r12)
 	.if	\handle_dar_dsisr
@@ -93,15 +75,7 @@
 	.endif
 	lwz	r9, SRR1(r12)
 	lwz	r12, SRR0(r12)
-#else
-	mfspr	r12,SPRN_SRR0
-	mfspr	r9,SPRN_SRR1
-#endif
-#ifdef CONFIG_VMAP_STACK
 	li	r10, MSR_KERNEL & ~MSR_IR /* can take exceptions */
-#else
-	li	r10,MSR_KERNEL & ~(MSR_IR|MSR_DR) /* can take exceptions */
-#endif
 	mtmsr	r10			/* (except for mach check in rtas) */
 	stw	r0,GPR0(r11)
 	lis	r10,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
@@ -114,7 +88,6 @@
 .macro SYSCALL_ENTRY trapno
 	mfspr	r12,SPRN_SPRG_THREAD
 	mfspr	r9, SPRN_SRR1
-#ifdef CONFIG_VMAP_STACK
 	mfspr	r11, SPRN_SRR0
 	mtctr	r11
 	andi.	r11, r9, MSR_PR
@@ -129,32 +102,14 @@
 	stw	r11,GPR1(r1)
 	stw	r11,0(r1)
 	mr	r11, r1
-#else
-	andi.	r11, r9, MSR_PR
-	lwz	r11,TASK_STACK-THREAD(r12)
-	beq-	99f
-	addi	r11, r11, THREAD_SIZE - INT_FRAME_SIZE
-	tophys(r11, r11)
-	stw	r1,GPR1(r11)
-	stw	r1,0(r11)
-	tovirt(r1, r11)		/* set new kernel sp */
-#endif
 	mflr	r10
 	stw	r10, _LINK(r11)
-#ifdef CONFIG_VMAP_STACK
 	mfctr	r10
-#else
-	mfspr	r10,SPRN_SRR0
-#endif
 	stw	r10,_NIP(r11)
 	mfcr	r10
 	rlwinm	r10,r10,0,4,2	/* Clear SO bit in CR */
 	stw	r10,_CCR(r11)		/* save registers */
-#ifdef CONFIG_VMAP_STACK
 	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL & ~MSR_IR) /* can take exceptions */
-#else
-	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL & ~(MSR_IR|MSR_DR)) /* can take exceptions */
-#endif
 	mtmsr	r10			/* (except for mach check in rtas) */
 	lis	r10,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
 	stw	r2,GPR2(r11)
@@ -172,7 +127,6 @@
 	ACCOUNT_CPU_USER_ENTRY(r2, r11, r12)
 
 3:
-	tovirt_novmstack r2, r2 	/* set r2 to current */
 	lis	r11, transfer_to_syscall@h
 	ori	r11, r11, transfer_to_syscall@l
 #ifdef CONFIG_TRACE_IRQFLAGS
@@ -195,52 +149,20 @@
 99:	b	ret_from_kernel_syscall
 .endm
 
-.macro save_dar_dsisr_on_stack reg1, reg2, sp
-#ifndef CONFIG_VMAP_STACK
-	mfspr	\reg1, SPRN_DAR
-	mfspr	\reg2, SPRN_DSISR
-	stw	\reg1, _DAR(\sp)
-	stw	\reg2, _DSISR(\sp)
-#endif
-.endm
-
-.macro get_and_save_dar_dsisr_on_stack reg1, reg2, sp
-#ifdef CONFIG_VMAP_STACK
-	lwz	\reg1, _DAR(\sp)
-	lwz	\reg2, _DSISR(\sp)
-#else
-	save_dar_dsisr_on_stack \reg1, \reg2, \sp
-#endif
-.endm
-
 .macro tovirt_vmstack dst, src
-#ifdef CONFIG_VMAP_STACK
 	tovirt(\dst, \src)
-#else
-	.ifnc	\dst, \src
-	mr	\dst, \src
-	.endif
-#endif
 .endm
 
 .macro tovirt_novmstack dst, src
-#ifndef CONFIG_VMAP_STACK
-	tovirt(\dst, \src)
-#else
 	.ifnc	\dst, \src
 	mr	\dst, \src
 	.endif
-#endif
 .endm
 
 .macro tophys_novmstack dst, src
-#ifndef CONFIG_VMAP_STACK
-	tophys(\dst, \src)
-#else
 	.ifnc	\dst, \src
 	mr	\dst, \src
 	.endif
-#endif
 .endm
 
 /*
@@ -290,7 +212,6 @@
 			  ret_from_except)
 
 .macro vmap_stack_overflow_exception
-#ifdef CONFIG_VMAP_STACK
 #ifdef CONFIG_SMP
 	mfspr	r1, SPRN_SPRG_THREAD
 	lwz	r1, TASK_CPU - THREAD(r1)
@@ -309,7 +230,6 @@
 	SAVE_NVGPRS(r11)
 	addi	r3, r1, STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0, stack_overflow_exception)
-#endif
 .endm
 
 #endif /* __HEAD_6xx_8xx_H__ */
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 9124ae889f9f..6fa8e58c6e4c 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -124,7 +124,6 @@ instruction_counter:
 	. = 0x200
 MachineCheck:
 	EXCEPTION_PROLOG handle_dar_dsisr=1
-	save_dar_dsisr_on_stack r4, r5, r11
 	li	r6, RPN_PATTERN
 	mtspr	SPRN_DAR, r6	/* Tag DAR, to be used in DTLB Error */
 	addi r3,r1,STACK_FRAME_OVERHEAD
@@ -137,7 +136,6 @@ MachineCheck:
 	. = 0x600
 Alignment:
 	EXCEPTION_PROLOG handle_dar_dsisr=1
-	save_dar_dsisr_on_stack r4, r5, r11
 	li	r6, RPN_PATTERN
 	mtspr	SPRN_DAR, r6	/* Tag DAR, to be used in DTLB Error */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -333,26 +331,23 @@ DataTLBError:
 	cmpwi	cr1, r11, RPN_PATTERN
 	beq-	cr1, FixupDAR	/* must be a buggy dcbX, icbi insn. */
 DARFixed:/* Return from dcbx instruction bug workaround */
-#ifdef CONFIG_VMAP_STACK
 	li	r11, RPN_PATTERN
 	mtspr	SPRN_DAR, r11	/* Tag DAR, to be used in DTLB Error */
-#endif
 	EXCEPTION_PROLOG_1
 	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
-	get_and_save_dar_dsisr_on_stack r4, r5, r11
+	lwz	r4, _DAR(r11)
+	lwz	r5, _DSISR(r11)
 	andis.	r10,r5,DSISR_NOHPTE@h
 	beq+	.Ldtlbie
 	tlbie	r4
 .Ldtlbie:
-#ifndef CONFIG_VMAP_STACK
-	li	r10,RPN_PATTERN
-	mtspr	SPRN_DAR,r10	/* Tag DAR, to be used in DTLB Error */
-#endif
 	/* 0x300 is DataAccess exception, needed by bad_page_fault() */
 	EXC_XFER_LITE(0x300, handle_page_fault)
 
+#ifdef CONFIG_VMAP_STACK
 stack_overflow:
 	vmap_stack_overflow_exception
+#endif
 
 /* On the MPC8xx, these next four traps are used for development
  * support of breakpoints and such.  Someday I will get around to
@@ -506,14 +501,10 @@ FixupDAR:/* Entry point for dcbx workaround. */
 152:
 	mfdar	r11
 	mtctr	r11			/* restore ctr reg from DAR */
-#ifdef CONFIG_VMAP_STACK
 	mfspr	r11, SPRN_SPRG_THREAD
 	stw	r10, DAR(r11)
 	mfspr	r10, SPRN_DSISR
 	stw	r10, DSISR(r11)
-#else
-	mtdar	r10			/* save fault EA to DAR */
-#endif
 	mfspr	r10,SPRN_M_TW
 	b	DARFixed		/* Go back to normal TLB handling */
 
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 89f38e9ec7cc..19a1ae0697fc 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -286,7 +286,6 @@ MachineCheck:
 	. = 0x300
 	DO_KVM  0x300
 DataAccess:
-#ifdef CONFIG_VMAP_STACK
 #ifdef CONFIG_PPC_BOOK3S_604
 BEGIN_MMU_FTR_SECTION
 	mtspr	SPRN_SPRG_SCRATCH2,r10
@@ -308,29 +307,11 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
 1:	EXCEPTION_PROLOG_0 handle_dar_dsisr=1
 	EXCEPTION_PROLOG_1
 	b	handle_page_fault_tramp_1
-#else	/* CONFIG_VMAP_STACK */
-	EXCEPTION_PROLOG handle_dar_dsisr=1
-	get_and_save_dar_dsisr_on_stack	r4, r5, r11
-#ifdef CONFIG_PPC_BOOK3S_604
-BEGIN_MMU_FTR_SECTION
-	andis.	r0, r5, (DSISR_BAD_FAULT_32S | DSISR_DABRMATCH)@h
-	bne	handle_page_fault_tramp_2	/* if not, try to put a PTE */
-	rlwinm	r3, r5, 32 - 15, 21, 21		/* DSISR_STORE -> _PAGE_RW */
-	bl	hash_page
-	b	handle_page_fault_tramp_1
-MMU_FTR_SECTION_ELSE
-#endif
-	b	handle_page_fault_tramp_2
-#ifdef CONFIG_PPC_BOOK3S_604
-ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
-#endif
-#endif	/* CONFIG_VMAP_STACK */
 
 /* Instruction access exception. */
 	. = 0x400
 	DO_KVM  0x400
 InstructionAccess:
-#ifdef CONFIG_VMAP_STACK
 	mtspr	SPRN_SPRG_SCRATCH0,r10
 	mtspr	SPRN_SPRG_SCRATCH1,r11
 	mfspr	r10, SPRN_SPRG_THREAD
@@ -351,18 +332,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 
 	EXCEPTION_PROLOG_1
 	EXCEPTION_PROLOG_2
-#else	/* CONFIG_VMAP_STACK */
-	EXCEPTION_PROLOG
-	andis.	r0,r9,SRR1_ISI_NOPT@h	/* no pte found? */
-	beq	1f			/* if so, try to put a PTE */
-	li	r3,0			/* into the hash table */
-	mr	r4,r12			/* SRR0 is fault address */
-#ifdef CONFIG_PPC_BOOK3S_604
-BEGIN_MMU_FTR_SECTION
-	bl	hash_page
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
-#endif
-#endif	/* CONFIG_VMAP_STACK */
 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
 	stw	r12, _DAR(r11)
 	stw	r5, _DSISR(r11)
@@ -376,7 +345,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	DO_KVM  0x600
 Alignment:
 	EXCEPTION_PROLOG handle_dar_dsisr=1
-	save_dar_dsisr_on_stack r4, r5, r11
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	b	alignment_exception_tramp
 
@@ -684,18 +652,13 @@ alignment_exception_tramp:
 	EXC_XFER_STD(0x600, alignment_exception)
 
 handle_page_fault_tramp_1:
-#ifdef CONFIG_VMAP_STACK
 	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
-#endif
 	lwz	r5, _DSISR(r11)
-	/* fall through */
-handle_page_fault_tramp_2:
 	andis.	r0, r5, DSISR_DABRMATCH@h
 	bne-	1f
 	EXC_XFER_LITE(0x300, handle_page_fault)
 1:	EXC_XFER_STD(0x300, do_break)
 
-#ifdef CONFIG_VMAP_STACK
 #ifdef CONFIG_PPC_BOOK3S_604
 .macro save_regs_thread		thread
 	stw	r0, THR0(\thread)
@@ -770,6 +733,7 @@ fast_hash_page_return:
 	rfi
 #endif /* CONFIG_PPC_BOOK3S_604 */
 
+#ifdef CONFIG_VMAP_STACK
 stack_overflow:
 	vmap_stack_overflow_exception
 #endif
diff --git a/arch/powerpc/kernel/idle_6xx.S b/arch/powerpc/kernel/idle_6xx.S
index 69df840f7253..c15f91e00d36 100644
--- a/arch/powerpc/kernel/idle_6xx.S
+++ b/arch/powerpc/kernel/idle_6xx.S
@@ -166,11 +166,7 @@ BEGIN_FTR_SECTION
 	mfspr	r9,SPRN_HID0
 	andis.	r9,r9,HID0_NAP@h
 	beq	1f
-#ifdef CONFIG_VMAP_STACK
 	addis	r9, r11, nap_save_msscr0@ha
-#else
-	addis	r9,r11,(nap_save_msscr0-KERNELBASE)@ha
-#endif
 	lwz	r9,nap_save_msscr0@l(r9)
 	mtspr	SPRN_MSSCR0, r9
 	sync
@@ -178,11 +174,7 @@ BEGIN_FTR_SECTION
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_NAP_DISABLE_L2_PR)
 BEGIN_FTR_SECTION
-#ifdef CONFIG_VMAP_STACK
 	addis	r9, r11, nap_save_hid1@ha
-#else
-	addis	r9,r11,(nap_save_hid1-KERNELBASE)@ha
-#endif
 	lwz	r9,nap_save_hid1@l(r9)
 	mtspr	SPRN_HID1, r9
 END_FTR_SECTION_IFSET(CPU_FTR_DUAL_PLL_750FX)
diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
index 801dc28fdcca..0697e2802a04 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -67,7 +67,7 @@ _GLOBAL(load_up_altivec)
 #ifdef CONFIG_PPC32
 	mfspr	r5,SPRN_SPRG_THREAD		/* current task's THREAD (phys) */
 	oris	r9,r9,MSR_VEC@h
-#ifdef CONFIG_VMAP_STACK
+#ifdef CONFIG_HAVE_ARCH_VMAP_STACK
 	tovirt(r5, r5)
 #endif
 #else
diff --git a/arch/powerpc/mm/book3s32/hash_low.S b/arch/powerpc/mm/book3s32/hash_low.S
index 0e6dc830c38b..fb4233a5bdf7 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -140,10 +140,6 @@ _GLOBAL(hash_page)
 	bne-	.Lretry			/* retry if someone got there first */
 
 	mfsrin	r3,r4			/* get segment reg for segment */
-#ifndef CONFIG_VMAP_STACK
-	mfctr	r0
-	stw	r0,_CTR(r11)
-#endif
 	bl	create_hpte		/* add the hash table entry */
 
 #ifdef CONFIG_SMP
@@ -152,17 +148,7 @@ _GLOBAL(hash_page)
 	li	r0,0
 	stw	r0, (mmu_hash_lock - PAGE_OFFSET)@l(r8)
 #endif
-
-#ifdef CONFIG_VMAP_STACK
 	b	fast_hash_page_return
-#else
-	/* Return from the exception */
-	lwz	r5,_CTR(r11)
-	mtctr	r5
-	lwz	r0,GPR0(r11)
-	lwz	r8,GPR8(r11)
-	b	fast_exception_return
-#endif
 
 #ifdef CONFIG_SMP
 .Lhash_page_out:
-- 
2.25.0

