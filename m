Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B9F129846
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2019 16:30:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hNbf2ZK2zDqP0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 02:30:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="XkBZKaE0"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hNVH1rGjzDqKf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 02:26:15 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47hNV66W4Yz9vJyq;
 Mon, 23 Dec 2019 16:26:06 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=XkBZKaE0; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id i8-vd2UWjzBi; Mon, 23 Dec 2019 16:26:06 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47hNV65SyXz9vJyn;
 Mon, 23 Dec 2019 16:26:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1577114766; bh=ysAJIqLHbt5K/WHSSdGRe0HlakprwIE3UMlw7jse6QE=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=XkBZKaE0JVk5RL+I2Z0FBxYOa42JIl6+1bzkZAr44R5SU2NP2bQsQ8+noLqWnvG1V
 ufhu41A+QV1RG60j16xYx1AcsvNbPRh6v6bZZFFTI+qACb+dQhSdP5OXIrH4EJ+2V8
 UYEmf5LzqlOPwAJ1B/1Bb3N8w8M3Zz67wW8zF+5U=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E40028B7AB;
 Mon, 23 Dec 2019 16:26:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0fja3KLxnEhf; Mon, 23 Dec 2019 16:26:11 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B90818B7A1;
 Mon, 23 Dec 2019 16:26:11 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C3A7E637D8; Mon, 23 Dec 2019 15:26:11 +0000 (UTC)
Message-Id: <09284aa49de6c6d9e27964bf981f585e10b141e3.1577114567.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1577114567.git.christophe.leroy@c-s.fr>
References: <cover.1577114567.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH 1/8] powerpc/32: drop ksp_limit based stack overflow
 detection
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 23 Dec 2019 15:26:11 +0000 (UTC)
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

PPC32 implements a specific early stack overflow detection.

This detection is inherited from ppc arch (before the merge of
ppc and ppc64 into powerpc). At that time, there was no irqstacks
and the verification was simply to check that the stack pointer
was still over the stack base. But when irqstacks were implemented,
it was not possible to perform a simple check anymore so a
thread specific value called ksp_limit was introduced in the
task_struct and is updated at every stack switch in order to
keep track of the limit and perform the verification.

ppc64 didn't have this but had a verification during IRQs. This
verification was then extended to PPC32 and can be selected through
CONFIG_DEBUG_STACKOVERFLOW.

In the meantime, thread_info has moved away from the stack, reducing
the impact of a stack overflow.

In addition, there is CONFIG_SCHED_STACK_END_CHECK which can be used
to check that the magic stored at stack base has not be overwritten.

Remove this PPC32 specific stack overflow mechanism in order to
simplify ongoing work which also aim at reducing even more risks of
stack overflow:
- Switch to irqstack in IRQ exception entry in ASM
- VMAP stack

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/asm-prototypes.h |  1 -
 arch/powerpc/include/asm/processor.h      |  3 --
 arch/powerpc/kernel/asm-offsets.c         |  2 --
 arch/powerpc/kernel/entry_32.S            | 57 -------------------------------
 arch/powerpc/kernel/head_40x.S            |  2 --
 arch/powerpc/kernel/head_booke.h          |  1 -
 arch/powerpc/kernel/misc_32.S             | 14 --------
 arch/powerpc/kernel/process.c             |  3 --
 arch/powerpc/kernel/traps.c               |  9 -----
 arch/powerpc/lib/sstep.c                  |  9 -----
 10 files changed, 101 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 983c0084fb3f..90e9c6e415af 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -66,7 +66,6 @@ void RunModeException(struct pt_regs *regs);
 void single_step_exception(struct pt_regs *regs);
 void program_check_exception(struct pt_regs *regs);
 void alignment_exception(struct pt_regs *regs);
-void StackOverflow(struct pt_regs *regs);
 void kernel_fp_unavailable_exception(struct pt_regs *regs);
 void altivec_unavailable_exception(struct pt_regs *regs);
 void vsx_unavailable_exception(struct pt_regs *regs);
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index a9993e7a443b..a9552048c20b 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -155,7 +155,6 @@ struct thread_struct {
 #endif
 #ifdef CONFIG_PPC32
 	void		*pgdir;		/* root of page-table tree */
-	unsigned long	ksp_limit;	/* if ksp <= ksp_limit stack overflow */
 #ifdef CONFIG_PPC_RTAS
 	unsigned long	rtas_sp;	/* stack pointer for when in RTAS */
 #endif
@@ -269,7 +268,6 @@ struct thread_struct {
 #define ARCH_MIN_TASKALIGN 16
 
 #define INIT_SP		(sizeof(init_stack) + (unsigned long) &init_stack)
-#define INIT_SP_LIMIT	((unsigned long)&init_stack)
 
 #ifdef CONFIG_SPE
 #define SPEFSCR_INIT \
@@ -282,7 +280,6 @@ struct thread_struct {
 #ifdef CONFIG_PPC32
 #define INIT_THREAD { \
 	.ksp = INIT_SP, \
-	.ksp_limit = INIT_SP_LIMIT, \
 	.addr_limit = KERNEL_DS, \
 	.pgdir = swapper_pg_dir, \
 	.fpexc_mode = MSR_FE0 | MSR_FE1, \
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 3d47aec7becf..d936db6b702f 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -88,7 +88,6 @@ int main(void)
 	DEFINE(SIGSEGV, SIGSEGV);
 	DEFINE(NMI_MASK, NMI_MASK);
 #else
-	OFFSET(KSP_LIMIT, thread_struct, ksp_limit);
 #ifdef CONFIG_PPC_RTAS
 	OFFSET(RTAS_SP, thread_struct, rtas_sp);
 #endif
@@ -353,7 +352,6 @@ int main(void)
 	DEFINE(_CSRR1, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, csrr1));
 	DEFINE(_DSRR0, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, dsrr0));
 	DEFINE(_DSRR1, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, dsrr1));
-	DEFINE(SAVED_KSP_LIMIT, STACK_INT_FRAME_SIZE+offsetof(struct exception_regs, saved_ksp_limit));
 #endif
 #endif
 
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index d60908ea37fb..bf11b464a17b 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -86,13 +86,6 @@ crit_transfer_to_handler:
 	stw	r0,_SRR0(r11)
 	mfspr	r0,SPRN_SRR1
 	stw	r0,_SRR1(r11)
-
-	/* set the stack limit to the current stack */
-	mfspr	r8,SPRN_SPRG_THREAD
-	lwz	r0,KSP_LIMIT(r8)
-	stw	r0,SAVED_KSP_LIMIT(r11)
-	rlwinm	r0,r1,0,0,(31 - THREAD_SHIFT)
-	stw	r0,KSP_LIMIT(r8)
 	/* fall through */
 #endif
 
@@ -107,13 +100,6 @@ crit_transfer_to_handler:
 	stw	r0,crit_srr0@l(0)
 	mfspr	r0,SPRN_SRR1
 	stw	r0,crit_srr1@l(0)
-
-	/* set the stack limit to the current stack */
-	mfspr	r8,SPRN_SPRG_THREAD
-	lwz	r0,KSP_LIMIT(r8)
-	stw	r0,saved_ksp_limit@l(0)
-	rlwinm	r0,r1,0,0,(31 - THREAD_SHIFT)
-	stw	r0,KSP_LIMIT(r8)
 	/* fall through */
 #endif
 
@@ -181,9 +167,6 @@ transfer_to_handler:
          */
 	kuap_save_and_lock r11, r12, r9, r2, r0
 	addi	r2, r12, -THREAD
-	lwz	r9,KSP_LIMIT(r12)
-	cmplw	r1,r9			/* if r1 <= ksp_limit */
-	ble-	stack_ovf		/* then the kernel stack overflowed */
 5:
 #if defined(CONFIG_PPC_BOOK3S_32) || defined(CONFIG_E500)
 	lwz	r12,TI_LOCAL_FLAGS(r2)
@@ -287,32 +270,6 @@ reenable_mmu:
 	b	fast_exception_return
 #endif
 
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
-	SYNC
-	RFI
-
 #ifdef CONFIG_TRACE_IRQFLAGS
 trace_syscall_entry_irq_off:
 	/*
@@ -1142,11 +1099,6 @@ exc_exit_restart_end:
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
@@ -1159,18 +1111,12 @@ ret_from_crit_exc:
 #ifdef CONFIG_BOOKE
 	.globl	ret_from_crit_exc
 ret_from_crit_exc:
-	mfspr	r9,SPRN_SPRG_THREAD
-	lwz	r10,SAVED_KSP_LIMIT(r1)
-	stw	r10,KSP_LIMIT(r9)
 	RESTORE_xSRR(SRR0,SRR1);
 	RESTORE_MMU_REGS;
 	RET_FROM_EXC_LEVEL(SPRN_CSRR0, SPRN_CSRR1, PPC_RFCI)
 
 	.globl	ret_from_debug_exc
 ret_from_debug_exc:
-	mfspr	r9,SPRN_SPRG_THREAD
-	lwz	r10,SAVED_KSP_LIMIT(r1)
-	stw	r10,KSP_LIMIT(r9)
 	RESTORE_xSRR(SRR0,SRR1);
 	RESTORE_xSRR(CSRR0,CSRR1);
 	RESTORE_MMU_REGS;
@@ -1178,9 +1124,6 @@ ret_from_debug_exc:
 
 	.globl	ret_from_mcheck_exc
 ret_from_mcheck_exc:
-	mfspr	r9,SPRN_SPRG_THREAD
-	lwz	r10,SAVED_KSP_LIMIT(r1)
-	stw	r10,KSP_LIMIT(r9)
 	RESTORE_xSRR(SRR0,SRR1);
 	RESTORE_xSRR(CSRR0,CSRR1);
 	RESTORE_xSRR(DSRR0,DSRR1);
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 585ea1976550..4511fc1549f7 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -91,8 +91,6 @@ _ENTRY(crit_srr0)
 	.space	4
 _ENTRY(crit_srr1)
 	.space	4
-_ENTRY(saved_ksp_limit)
-	.space	4
 
 /*
  * Exception prolog for critical exceptions.  This is a little different
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 2ae635df9026..41dd53846e0c 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -525,7 +525,6 @@ struct exception_regs {
 	unsigned long csrr1;
 	unsigned long dsrr0;
 	unsigned long dsrr1;
-	unsigned long saved_ksp_limit;
 };
 
 /* ensure this structure is always sized to a multiple of the stack alignment */
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index d80212be8698..bb5995fa6884 100644
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
index 4df94b6e2f32..49d0ebf28ab9 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1657,9 +1657,6 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
 	kregs = (struct pt_regs *) sp;
 	sp -= STACK_FRAME_OVERHEAD;
 	p->thread.ksp = sp;
-#ifdef CONFIG_PPC32
-	p->thread.ksp_limit = (unsigned long)end_of_stack(p);
-#endif
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 	p->thread.ptrace_bps[0] = NULL;
 #endif
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 014ff0701f24..ee641dd8eb90 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1628,15 +1628,6 @@ void alignment_exception(struct pt_regs *regs)
 	exception_exit(prev_state);
 }
 
-void StackOverflow(struct pt_regs *regs)
-{
-	pr_crit("Kernel stack overflow in process %s[%d], r1=%lx\n",
-		current->comm, task_pid_nr(current), regs->gpr[1]);
-	debugger(regs);
-	show_regs(regs);
-	panic("kernel stack overflow");
-}
-
 void kernel_fp_unavailable_exception(struct pt_regs *regs)
 {
 	enum ctx_state prev_state = exception_enter();
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index c077acb983a1..390f43f1d4d8 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -2701,15 +2701,6 @@ NOKPROBE_SYMBOL(analyse_instr);
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
2.13.3

