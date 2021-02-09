Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74472314CD5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 11:23:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZf9p2hcQzDskT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 21:23:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZdZw05BnzDsTL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 20:56:40 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZdZr0rw4z9txg9;
 Tue,  9 Feb 2021 10:56:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 3pCDUkovUPHV; Tue,  9 Feb 2021 10:56:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZdZq6gbMz9txg8;
 Tue,  9 Feb 2021 10:56:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CD6198B7D6;
 Tue,  9 Feb 2021 10:56:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3ODiqPBgso2G; Tue,  9 Feb 2021 10:56:36 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 757578B7D4;
 Tue,  9 Feb 2021 10:56:36 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5102567342; Tue,  9 Feb 2021 09:56:36 +0000 (UTC)
Message-Id: <779d1a518e6ca4d5ca91c8b15fcb6a2667f2714b.1612864003.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612864003.git.christophe.leroy@csgroup.eu>
References: <cover.1612864003.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 12/41] powerpc/32: Remove ksp_limit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Feb 2021 09:56:36 +0000 (UTC)
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

ksp_limit is there to help detect stack overflows.
That is specific to ppc32 as it was removed from ppc64 in
commit cbc9565ee826 ("powerpc: Remove ksp_limit on ppc64").

There are other means for detecting stack overflows.

As ppc64 has proven to not need it, ppc32 should be able to do
without it too.

Lets remove it and simplify exception handling.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/processor.h |  2 -
 arch/powerpc/kernel/asm-offsets.c    |  2 -
 arch/powerpc/kernel/entry_32.S       | 63 ----------------------------
 arch/powerpc/kernel/head_40x.S       |  2 -
 arch/powerpc/kernel/head_booke.h     |  1 -
 arch/powerpc/kernel/misc_32.S        | 14 -------
 arch/powerpc/kernel/process.c        |  3 --
 arch/powerpc/kernel/traps.c          |  9 ----
 arch/powerpc/lib/sstep.c             |  9 ----
 9 files changed, 105 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 8acc3590c971..43cbd9281055 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -144,7 +144,6 @@ struct thread_struct {
 #endif
 #ifdef CONFIG_PPC32
 	void		*pgdir;		/* root of page-table tree */
-	unsigned long	ksp_limit;	/* if ksp <= ksp_limit stack overflow */
 #ifdef CONFIG_PPC_RTAS
 	unsigned long	rtas_sp;	/* stack pointer for when in RTAS */
 #endif
@@ -282,7 +281,6 @@ struct thread_struct {
 #ifdef CONFIG_PPC32
 #define INIT_THREAD { \
 	.ksp = INIT_SP, \
-	.ksp_limit = INIT_SP_LIMIT, \
 	.pgdir = swapper_pg_dir, \
 	.fpexc_mode = MSR_FE0 | MSR_FE1, \
 	SPEFSCR_INIT \
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index b12d7c049bfe..1f47d4e0f3b5 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -91,7 +91,6 @@ int main(void)
 	DEFINE(SIGSEGV, SIGSEGV);
 	DEFINE(NMI_MASK, NMI_MASK);
 #else
-	OFFSET(KSP_LIMIT, thread_struct, ksp_limit);
 #ifdef CONFIG_PPC_RTAS
 	OFFSET(RTAS_SP, thread_struct, rtas_sp);
 #endif
@@ -382,7 +381,6 @@ int main(void)
 	DEFINE(_CSRR1, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, csrr1));
 	DEFINE(_DSRR0, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, dsrr0));
 	DEFINE(_DSRR1, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, dsrr1));
-	DEFINE(SAVED_KSP_LIMIT, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, saved_ksp_limit));
 #endif
 #endif
 
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 971980d71b04..23f46e697546 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -94,12 +94,6 @@ crit_transfer_to_handler:
 	mfspr	r0,SPRN_SRR1
 	stw	r0,_SRR1(r11)
 
-	/* set the stack limit to the current stack */
-	mfspr	r8,SPRN_SPRG_THREAD
-	lwz	r0,KSP_LIMIT(r8)
-	stw	r0,SAVED_KSP_LIMIT(r11)
-	rlwinm	r0,r1,0,0,(31 - THREAD_SHIFT)
-	stw	r0,KSP_LIMIT(r8)
 	/* fall through */
 _ASM_NOKPROBE_SYMBOL(crit_transfer_to_handler)
 #endif
@@ -107,12 +101,6 @@ _ASM_NOKPROBE_SYMBOL(crit_transfer_to_handler)
 #ifdef CONFIG_40x
 	.globl	crit_transfer_to_handler
 crit_transfer_to_handler:
-	/* set the stack limit to the current stack */
-	mfspr	r8,SPRN_SPRG_THREAD
-	lwz	r0,KSP_LIMIT(r8)
-	stw	r0,saved_ksp_limit@l(0)
-	rlwinm	r0,r1,0,0,(31 - THREAD_SHIFT)
-	stw	r0,KSP_LIMIT(r8)
 	/* fall through */
 _ASM_NOKPROBE_SYMBOL(crit_transfer_to_handler)
 #endif
@@ -156,12 +144,6 @@ transfer_to_handler:
          */
 	kuap_save_and_lock r11, r12, r9, r2, r6
 	addi	r2, r12, -THREAD
-#ifndef CONFIG_VMAP_STACK
-	lwz	r9,KSP_LIMIT(r12)
-	cmplw	r1,r9			/* if r1 <= ksp_limit */
-	ble-	stack_ovf		/* then the kernel stack overflowed */
-#endif
-5:
 #if defined(CONFIG_PPC_BOOK3S_32) || defined(CONFIG_E500)
 	lwz	r12,TI_LOCAL_FLAGS(r2)
 	mtcrf	0x01,r12
@@ -204,37 +186,6 @@ transfer_to_handler_cont:
 _ASM_NOKPROBE_SYMBOL(transfer_to_handler)
 _ASM_NOKPROBE_SYMBOL(transfer_to_handler_cont)
 
-#ifndef CONFIG_VMAP_STACK
-/*
- * On kernel stack overflow, load up an initial stack pointer
- * and call StackOverflow(regs), which should not return.
- */
-stack_ovf:
-	/* sometimes we use a statically-allocated stack, which is OK. */
-	lis	r12,_end@h
-	ori	r12,r12,_end@l
-	cmplw	r1,r12
-	ble	5b			/* r1 <= &_end is OK */
-	SAVE_NVGPRS(r11)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	lis	r1,init_thread_union@ha
-	addi	r1,r1,init_thread_union@l
-	addi	r1,r1,THREAD_SIZE-STACK_FRAME_OVERHEAD
-	lis	r9,StackOverflow@ha
-	addi	r9,r9,StackOverflow@l
-	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL)
-#if defined(CONFIG_PPC_8xx) && defined(CONFIG_PERF_EVENTS)
-	mtspr	SPRN_NRI, r0
-#endif
-	mtspr	SPRN_SRR0,r9
-	mtspr	SPRN_SRR1,r10
-	rfi
-#ifdef CONFIG_40x
-	b .	/* Prevent prefetch past rfi */
-#endif
-_ASM_NOKPROBE_SYMBOL(stack_ovf)
-#endif
-
 	.globl	transfer_to_syscall
 transfer_to_syscall:
 	SAVE_NVGPRS(r1)
@@ -814,11 +765,6 @@ _ASM_NOKPROBE_SYMBOL(exc_exit_restart)
 #ifdef CONFIG_40x
 	.globl	ret_from_crit_exc
 ret_from_crit_exc:
-	mfspr	r9,SPRN_SPRG_THREAD
-	lis	r10,saved_ksp_limit@ha;
-	lwz	r10,saved_ksp_limit@l(r10);
-	tovirt(r9,r9);
-	stw	r10,KSP_LIMIT(r9)
 	lis	r9,crit_srr0@ha;
 	lwz	r9,crit_srr0@l(r9);
 	lis	r10,crit_srr1@ha;
@@ -832,9 +778,6 @@ _ASM_NOKPROBE_SYMBOL(ret_from_crit_exc)
 #ifdef CONFIG_BOOKE
 	.globl	ret_from_crit_exc
 ret_from_crit_exc:
-	mfspr	r9,SPRN_SPRG_THREAD
-	lwz	r10,SAVED_KSP_LIMIT(r1)
-	stw	r10,KSP_LIMIT(r9)
 	RESTORE_xSRR(SRR0,SRR1);
 	RESTORE_MMU_REGS;
 	RET_FROM_EXC_LEVEL(SPRN_CSRR0, SPRN_CSRR1, PPC_RFCI)
@@ -842,9 +785,6 @@ _ASM_NOKPROBE_SYMBOL(ret_from_crit_exc)
 
 	.globl	ret_from_debug_exc
 ret_from_debug_exc:
-	mfspr	r9,SPRN_SPRG_THREAD
-	lwz	r10,SAVED_KSP_LIMIT(r1)
-	stw	r10,KSP_LIMIT(r9)
 	RESTORE_xSRR(SRR0,SRR1);
 	RESTORE_xSRR(CSRR0,CSRR1);
 	RESTORE_MMU_REGS;
@@ -853,9 +793,6 @@ _ASM_NOKPROBE_SYMBOL(ret_from_debug_exc)
 
 	.globl	ret_from_mcheck_exc
 ret_from_mcheck_exc:
-	mfspr	r9,SPRN_SPRG_THREAD
-	lwz	r10,SAVED_KSP_LIMIT(r1)
-	stw	r10,KSP_LIMIT(r9)
 	RESTORE_xSRR(SRR0,SRR1);
 	RESTORE_xSRR(CSRR0,CSRR1);
 	RESTORE_xSRR(DSRR0,DSRR1);
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 4bf0aee858eb..72e4962902de 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -95,8 +95,6 @@ _ENTRY(crit_dear)
 	.space	4
 _ENTRY(crit_esr)
 	.space	4
-_ENTRY(saved_ksp_limit)
-	.space	4
 
 /*
  * Exception prolog for critical exceptions.  This is a little different
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 47857795f50a..4a5f0c9b652b 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -481,7 +481,6 @@ struct exception_regs {
 	unsigned long csrr1;
 	unsigned long dsrr0;
 	unsigned long dsrr1;
-	unsigned long saved_ksp_limit;
 };
 
 /* ensure this structure is always sized to a multiple of the stack alignment */
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index 717e658b90fd..acc410043b96 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -27,23 +27,14 @@
 
 	.text
 
-/*
- * We store the saved ksp_limit in the unused part
- * of the STACK_FRAME_OVERHEAD
- */
 _GLOBAL(call_do_softirq)
 	mflr	r0
 	stw	r0,4(r1)
-	lwz	r10,THREAD+KSP_LIMIT(r2)
-	stw	r3, THREAD+KSP_LIMIT(r2)
 	stwu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r3)
 	mr	r1,r3
-	stw	r10,8(r1)
 	bl	__do_softirq
-	lwz	r10,8(r1)
 	lwz	r1,0(r1)
 	lwz	r0,4(r1)
-	stw	r10,THREAD+KSP_LIMIT(r2)
 	mtlr	r0
 	blr
 
@@ -53,16 +44,11 @@ _GLOBAL(call_do_softirq)
 _GLOBAL(call_do_irq)
 	mflr	r0
 	stw	r0,4(r1)
-	lwz	r10,THREAD+KSP_LIMIT(r2)
-	stw	r4, THREAD+KSP_LIMIT(r2)
 	stwu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r4)
 	mr	r1,r4
-	stw	r10,8(r1)
 	bl	__do_irq
-	lwz	r10,8(r1)
 	lwz	r1,0(r1)
 	lwz	r0,4(r1)
-	stw	r10,THREAD+KSP_LIMIT(r2)
 	mtlr	r0
 	blr
 
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index e296440e9d16..384951381329 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1724,9 +1724,6 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 	kregs = (struct pt_regs *) sp;
 	sp -= STACK_FRAME_OVERHEAD;
 	p->thread.ksp = sp;
-#ifdef CONFIG_PPC32
-	p->thread.ksp_limit = (unsigned long)end_of_stack(p);
-#endif
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 	for (i = 0; i < nr_wp_slots(); i++)
 		p->thread.ptrace_bps[i] = NULL;
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 39c8b7e9b91a..2afa05ad21c8 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1612,15 +1612,6 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
 		bad_page_fault(regs, sig);
 }
 
-DEFINE_INTERRUPT_HANDLER(StackOverflow)
-{
-	pr_crit("Kernel stack overflow in process %s[%d], r1=%lx\n",
-		current->comm, task_pid_nr(current), regs->gpr[1]);
-	debugger(regs);
-	show_regs(regs);
-	panic("kernel stack overflow");
-}
-
 DEFINE_INTERRUPT_HANDLER(stack_overflow_exception)
 {
 	die("Kernel stack overflow", regs, SIGSEGV);
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index bb5c20d4ca91..212012f49f10 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -3086,15 +3086,6 @@ NOKPROBE_SYMBOL(analyse_instr);
  */
 static nokprobe_inline int handle_stack_update(unsigned long ea, struct pt_regs *regs)
 {
-#ifdef CONFIG_PPC32
-	/*
-	 * Check if we will touch kernel stack overflow
-	 */
-	if (ea - STACK_INT_FRAME_SIZE <= current->thread.ksp_limit) {
-		printk(KERN_CRIT "Can't kprobe this since kernel stack would overflow.\n");
-		return -EINVAL;
-	}
-#endif /* CONFIG_PPC32 */
 	/*
 	 * Check if we already set since that means we'll
 	 * lose the previous value.
-- 
2.25.0

