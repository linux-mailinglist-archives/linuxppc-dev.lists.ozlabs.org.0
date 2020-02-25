Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B3216EE68
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 19:53:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Rp414pRwzDqCt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:53:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JeyN6+Et; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmSP0GKzzDqN5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:41:09 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id d9so7228831pgu.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zDAgQVT0xVSoC3HJb90QKQE6FeQBhPm25wSSMtRaI+4=;
 b=JeyN6+EtJ5b9szMoW+yPAS7ZJPBqN27teVVXIME4eesxdQHXVEEhESQ6QKJMOzFAQM
 yFJCnWRSiFMKsUcrJej1Lm1LbzuGjFCXhyAohNnrZgXTHhNIn1WAOwLB94Joc+DPyhkQ
 kgtMvlJ2a+gpgrSHwt90JoqQoxyeTIokwu7ZQG1oekSbCdDUBoccBqX1Io6DWfWOdcGr
 KKP3T0F1CZ4B5pBohhx0t7f8ldlrGUl83DPldsHxujskfA+UeBRL7vBLgKRuCu8uPhzh
 py/WxRH/TVB6szL+PTU2vbOtK2PFGfS0JX0VyGNNy4MCF8PP+jdp+qpZ5xw6SL1jdVXH
 3Qlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zDAgQVT0xVSoC3HJb90QKQE6FeQBhPm25wSSMtRaI+4=;
 b=XKDo2hz6FddFqzJgAtwMXz1FitDYoZcBrVqteYhZaqZORfGqVkTLwgdJDXtA1aYODX
 q67iWC/z4neyXj9HAyWLLW0+dXQKOaVDsQA5gEVhFExwI8gi2oR20FdC2HasS44RZ32j
 iZx64LJHZiTpPYik1dPmGhKaX73WIGMkd9N3Qf1YXFMTyb9mEtocwgSlREKi71fzLkzV
 iSUmi6xrS/jRJh0vGbI4XVWRic0PQf7F1LUB9MWCGkJjo6NgNEQyu2L9GgIW4Ccvp8oR
 89WOe+mAOzAA0c1T4P87G1Whql/8+EDPpM9+DE5VLnBzm+oKlBkSj46yNv81f0PidG1L
 rS0g==
X-Gm-Message-State: APjAAAWxxCEg36vVc782/9I/NJvJV4G4eFDcY5Mue8Hnrx3cqEUJ/E2c
 pwuEnB9gKzkn55saHFHOVi+hAVVp
X-Google-Smtp-Source: APXvYqyBv+wiiOxLe6m0RK3eNy2Wx4dusGf9AaqEXmHs/zm+kEHzwR6aEGACVbbFCm9AOTUwAl0UDw==
X-Received: by 2002:a63:7d46:: with SMTP id m6mr56435513pgn.38.1582652464947; 
 Tue, 25 Feb 2020 09:41:04 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:41:04 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 28/32] powerpc/64s: interrupt implement exit logic in C
Date: Wed, 26 Feb 2020 03:35:37 +1000
Message-Id: <20200225173541.1549955-29-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225173541.1549955-1-npiggin@gmail.com>
References: <20200225173541.1549955-1-npiggin@gmail.com>
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
Cc: Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement the bulk of interrupt return logic in C. The asm return code
must handle a few cases: restoring full GPRs, and emulating stack store.

The stack store emulation is significantly simplfied, rather than creating
a new return frame and switching to that before performing the store, it
uses the PACA to keep a scratch register around to perform thestore.

The asm return code is moved into 64e for now. The new logic has made
allowance for 64e, but I don't have a full environment that works well
to test it, and even booting in emulated qemu is not great for stress
testing. 64e shouldn't be too far off working with this, given a bit
more testing and auditing of the logic.

This is slightly faster on a POWER9 (page fault speed increases about
1.1%), probably due to reduced mtmsrd.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
v2,rebase (from Michal):
- Move the FP restore functions to restore_math. They are not used
  anywhere else and when restore_math is not built gcc warns about them
  being unused (ms)
- Add asm/context_tracking.h include to exceptions-64e.S for SCHEDULE_USER
  definition

v3:
- Fix return from interrupt replay problem by replaying interrupts rather
  than enabling irqs. This ends up being cleaner and __check_irq_replay
  goes away completely for 64s. Should bring 64e up to speed and kill a lot
  of cruft after it's proven on 64s.
- Don't use _GLOBAL if it's not called from C
- Simplify stack store emulation code further, add a bit more commenting.
- Some missing no probe annotations

 .../powerpc/include/asm/book3s/64/kup-radix.h |  10 +
 arch/powerpc/include/asm/hw_irq.h             |   1 +
 arch/powerpc/include/asm/switch_to.h          |   6 +
 arch/powerpc/kernel/entry_64.S                | 486 +++++-------------
 arch/powerpc/kernel/exceptions-64e.S          | 255 ++++++++-
 arch/powerpc/kernel/exceptions-64s.S          | 119 ++---
 arch/powerpc/kernel/irq.c                     |  36 +-
 arch/powerpc/kernel/process.c                 |  89 ++--
 arch/powerpc/kernel/syscall_64.c              | 164 +++++-
 arch/powerpc/kernel/vector.S                  |   2 +-
 10 files changed, 642 insertions(+), 526 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
index 71081d90f999..3bcef989a35d 100644
--- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
@@ -60,6 +60,12 @@
 #include <asm/mmu.h>
 #include <asm/ptrace.h>
 
+static inline void kuap_restore_amr(struct pt_regs *regs)
+{
+	if (mmu_has_feature(MMU_FTR_RADIX_KUAP))
+		mtspr(SPRN_AMR, regs->kuap);
+}
+
 static inline void kuap_check_amr(void)
 {
 	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_RADIX_KUAP))
@@ -136,6 +142,10 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
 }
 #else /* CONFIG_PPC_KUAP */
+static inline void kuap_restore_amr(struct pt_regs *regs)
+{
+}
+
 static inline void kuap_check_amr(void)
 {
 }
diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 0e9a9598f91f..e0e71777961f 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -52,6 +52,7 @@
 #ifndef __ASSEMBLY__
 
 extern void replay_system_reset(void);
+extern void replay_soft_interrupts(void);
 
 extern void timer_interrupt(struct pt_regs *);
 extern void timer_broadcast_interrupt(void);
diff --git a/arch/powerpc/include/asm/switch_to.h b/arch/powerpc/include/asm/switch_to.h
index 476008bc3d08..b867b58b1093 100644
--- a/arch/powerpc/include/asm/switch_to.h
+++ b/arch/powerpc/include/asm/switch_to.h
@@ -23,7 +23,13 @@ extern void switch_booke_debug_regs(struct debug_reg *new_debug);
 
 extern int emulate_altivec(struct pt_regs *);
 
+#ifdef CONFIG_PPC_BOOK3S_64
 void restore_math(struct pt_regs *regs);
+#else
+static inline void restore_math(struct pt_regs *regs)
+{
+}
+#endif
 
 void restore_tm_state(struct pt_regs *regs);
 
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 0e2c56573a41..e13eac968dfc 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -16,6 +16,7 @@
 
 #include <linux/errno.h>
 #include <linux/err.h>
+#include <asm/cache.h>
 #include <asm/unistd.h>
 #include <asm/processor.h>
 #include <asm/page.h>
@@ -221,6 +222,7 @@ _GLOBAL(ret_from_kernel_thread)
 	li	r3,0
 	b	.Lsyscall_exit
 
+#ifdef CONFIG_PPC_BOOK3E
 /* Save non-volatile GPRs, if not already saved. */
 _GLOBAL(save_nvgprs)
 	ld	r11,_TRAP(r1)
@@ -231,6 +233,7 @@ _GLOBAL(save_nvgprs)
 	std	r0,_TRAP(r1)
 	blr
 _ASM_NOKPROBE_SYMBOL(save_nvgprs);
+#endif
 
 #ifdef CONFIG_PPC_BOOK3S_64
 
@@ -294,7 +297,7 @@ flush_count_cache:
  * state of one is saved on its kernel stack.  Then the state
  * of the other is restored from its kernel stack.  The memory
  * management hardware is updated to the second process's state.
- * Finally, we can return to the second process, via ret_from_except.
+ * Finally, we can return to the second process, via interrupt_return.
  * On entry, r3 points to the THREAD for the current task, r4
  * points to the THREAD for the new task.
  *
@@ -446,408 +449,151 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	addi	r1,r1,SWITCH_FRAME_SIZE
 	blr
 
-	.align	7
-_GLOBAL(ret_from_except)
-	ld	r11,_TRAP(r1)
-	andi.	r0,r11,1
-	bne	ret_from_except_lite
-	REST_NVGPRS(r1)
-
-_GLOBAL(ret_from_except_lite)
+#ifdef CONFIG_PPC_BOOK3S
 	/*
-	 * Disable interrupts so that current_thread_info()->flags
-	 * can't change between when we test it and when we return
-	 * from the interrupt.
-	 */
-#ifdef CONFIG_PPC_BOOK3E
-	wrteei	0
-#else
-	li	r10,MSR_RI
-	mtmsrd	r10,1		  /* Update machine state */
-#endif /* CONFIG_PPC_BOOK3E */
+	 * If MSR EE/RI was never enabled, IRQs not reconciled, NVGPRs not
+	 * touched, AMR not set, no exit work created, then this can be used.
+	 */
+	.balign IFETCH_ALIGN_BYTES
+	.globl fast_interrupt_return
+fast_interrupt_return:
+_ASM_NOKPROBE_SYMBOL(fast_interrupt_return)
+	ld	r4,_MSR(r1)
+	andi.	r0,r4,MSR_PR
+	bne	.Lfast_user_interrupt_return
+	andi.	r0,r4,MSR_RI
+	bne+	.Lfast_kernel_interrupt_return
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	unrecoverable_exception
+	b	. /* should not get here */
 
-	ld	r9, PACA_THREAD_INFO(r13)
-	ld	r3,_MSR(r1)
-#ifdef CONFIG_PPC_BOOK3E
-	ld	r10,PACACURRENT(r13)
-#endif /* CONFIG_PPC_BOOK3E */
-	ld	r4,TI_FLAGS(r9)
-	andi.	r3,r3,MSR_PR
-	beq	resume_kernel
-#ifdef CONFIG_PPC_BOOK3E
-	lwz	r3,(THREAD+THREAD_DBCR0)(r10)
-#endif /* CONFIG_PPC_BOOK3E */
+	.balign IFETCH_ALIGN_BYTES
+	.globl interrupt_return
+interrupt_return:
+_ASM_NOKPROBE_SYMBOL(interrupt_return)
+	REST_NVGPRS(r1)
 
-	/* Check current_thread_info()->flags */
-	andi.	r0,r4,_TIF_USER_WORK_MASK
-	bne	1f
-#ifdef CONFIG_PPC_BOOK3E
-	/*
-	 * Check to see if the dbcr0 register is set up to debug.
-	 * Use the internal debug mode bit to do this.
-	 */
-	andis.	r0,r3,DBCR0_IDM@h
-	beq	restore
-	mfmsr	r0
-	rlwinm	r0,r0,0,~MSR_DE	/* Clear MSR.DE */
-	mtmsr	r0
-	mtspr	SPRN_DBCR0,r3
-	li	r10, -1
-	mtspr	SPRN_DBSR,r10
-	b	restore
-#else
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	restore_math
-	b	restore
-#endif
-1:	andi.	r0,r4,_TIF_NEED_RESCHED
-	beq	2f
-	bl	restore_interrupts
-	SCHEDULE_USER
-	b	ret_from_except_lite
-2:
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	andi.	r0,r4,_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM
-	bne	3f		/* only restore TM if nothing else to do */
+	.balign IFETCH_ALIGN_BYTES
+	.globl interrupt_return_lite
+interrupt_return_lite:
+_ASM_NOKPROBE_SYMBOL(interrupt_return_lite)
+	ld	r4,_MSR(r1)
+	andi.	r0,r4,MSR_PR
+	beq	.Lkernel_interrupt_return
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	restore_tm_state
-	b	restore
-3:
-#endif
-	bl	save_nvgprs
-	/*
-	 * Use a non volatile GPR to save and restore our thread_info flags
-	 * across the call to restore_interrupts.
-	 */
-	mr	r30,r4
-	bl	restore_interrupts
-	mr	r4,r30
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	do_notify_resume
-	b	ret_from_except
-
-resume_kernel:
-	/* check current_thread_info, _TIF_EMULATE_STACK_STORE */
-	andis.	r8,r4,_TIF_EMULATE_STACK_STORE@h
-	beq+	1f
+	bl	interrupt_exit_user_prepare
+	cmpdi	r3,0
+	bne-	.Lrestore_nvgprs
 
-	addi	r8,r1,INT_FRAME_SIZE	/* Get the kprobed function entry */
+.Lfast_user_interrupt_return:
+	ld	r11,_NIP(r1)
+	ld	r12,_MSR(r1)
+BEGIN_FTR_SECTION
+	ld	r10,_PPR(r1)
+	mtspr	SPRN_PPR,r10
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
+	mtspr	SPRN_SRR0,r11
+	mtspr	SPRN_SRR1,r12
 
-	ld	r3,GPR1(r1)
-	subi	r3,r3,INT_FRAME_SIZE	/* dst: Allocate a trampoline exception frame */
-	mr	r4,r1			/* src:  current exception frame */
-	mr	r1,r3			/* Reroute the trampoline frame to r1 */
+BEGIN_FTR_SECTION
+	stdcx.	r0,0,r1		/* to clear the reservation */
+FTR_SECTION_ELSE
+	ldarx	r0,0,r1
+ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
-	/* Copy from the original to the trampoline. */
-	li	r5,INT_FRAME_SIZE/8	/* size: INT_FRAME_SIZE */
-	li	r6,0			/* start offset: 0 */
-	mtctr	r5
-2:	ldx	r0,r6,r4
-	stdx	r0,r6,r3
-	addi	r6,r6,8
-	bdnz	2b
-
-	/* Do real store operation to complete stdu */
-	ld	r5,GPR1(r1)
-	std	r8,0(r5)
-
-	/* Clear _TIF_EMULATE_STACK_STORE flag */
-	lis	r11,_TIF_EMULATE_STACK_STORE@h
-	addi	r5,r9,TI_FLAGS
-0:	ldarx	r4,0,r5
-	andc	r4,r4,r11
-	stdcx.	r4,0,r5
-	bne-	0b
-1:
-
-#ifdef CONFIG_PREEMPTION
-	/* Check if we need to preempt */
-	andi.	r0,r4,_TIF_NEED_RESCHED
-	beq+	restore
-	/* Check that preempt_count() == 0 and interrupts are enabled */
-	lwz	r8,TI_PREEMPT(r9)
-	cmpwi	cr0,r8,0
-	bne	restore
-	ld	r0,SOFTE(r1)
-	andi.	r0,r0,IRQS_DISABLED
-	bne	restore
+	ld	r3,_CCR(r1)
+	ld	r4,_LINK(r1)
+	ld	r5,_CTR(r1)
+	ld	r6,_XER(r1)
+	li	r0,0
 
-	/*
-	 * Here we are preempting the current task. We want to make
-	 * sure we are soft-disabled first and reconcile irq state.
-	 */
-	RECONCILE_IRQ_STATE(r3,r4)
-	bl	preempt_schedule_irq
+	REST_4GPRS(7, r1)
+	REST_2GPRS(11, r1)
+	REST_GPR(13, r1)
 
-	/*
-	 * arch_local_irq_restore() from preempt_schedule_irq above may
-	 * enable hard interrupt but we really should disable interrupts
-	 * when we return from the interrupt, and so that we don't get
-	 * interrupted after loading SRR0/1.
-	 */
-#ifdef CONFIG_PPC_BOOK3E
-	wrteei	0
-#else
-	li	r10,MSR_RI
-	mtmsrd	r10,1		  /* Update machine state */
-#endif /* CONFIG_PPC_BOOK3E */
-#endif /* CONFIG_PREEMPTION */
+	mtcr	r3
+	mtlr	r4
+	mtctr	r5
+	mtspr	SPRN_XER,r6
 
-	.globl	fast_exc_return_irq
-fast_exc_return_irq:
-restore:
-	/*
-	 * This is the main kernel exit path. First we check if we
-	 * are about to re-enable interrupts
-	 */
-	ld	r5,SOFTE(r1)
-	lbz	r6,PACAIRQSOFTMASK(r13)
-	andi.	r5,r5,IRQS_DISABLED
-	bne	.Lrestore_irq_off
+	REST_4GPRS(2, r1)
+	REST_GPR(6, r1)
+	REST_GPR(0, r1)
+	REST_GPR(1, r1)
+	RFI_TO_USER
+	b	.	/* prevent speculative execution */
 
-	/* We are enabling, were we already enabled ? Yes, just return */
-	andi.	r6,r6,IRQS_DISABLED
-	beq	cr0,.Ldo_restore
+.Lrestore_nvgprs:
+	REST_NVGPRS(r1)
+	b	.Lfast_user_interrupt_return
 
-	/*
-	 * We are about to soft-enable interrupts (we are hard disabled
-	 * at this point). We check if there's anything that needs to
-	 * be replayed first.
-	 */
-	lbz	r0,PACAIRQHAPPENED(r13)
-	cmpwi	cr0,r0,0
-	bne-	.Lrestore_check_irq_replay
+	.balign IFETCH_ALIGN_BYTES
+.Lkernel_interrupt_return:
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	interrupt_exit_kernel_prepare
+	cmpdi	cr1,r3,0
 
-	/*
-	 * Get here when nothing happened while soft-disabled, just
-	 * soft-enable and move-on. We will hard-enable as a side
-	 * effect of rfi
-	 */
-.Lrestore_no_replay:
-	TRACE_ENABLE_INTS
-	li	r0,IRQS_ENABLED
-	stb	r0,PACAIRQSOFTMASK(r13);
+.Lfast_kernel_interrupt_return:
+	ld	r11,_NIP(r1)
+	ld	r12,_MSR(r1)
+	mtspr	SPRN_SRR0,r11
+	mtspr	SPRN_SRR1,r12
 
-	/*
-	 * Final return path. BookE is handled in a different file
-	 */
-.Ldo_restore:
-#ifdef CONFIG_PPC_BOOK3E
-	b	exception_return_book3e
-#else
-	/*
-	 * Clear the reservation. If we know the CPU tracks the address of
-	 * the reservation then we can potentially save some cycles and use
-	 * a larx. On POWER6 and POWER7 this is significantly faster.
-	 */
 BEGIN_FTR_SECTION
 	stdcx.	r0,0,r1		/* to clear the reservation */
 FTR_SECTION_ELSE
-	ldarx	r4,0,r1
+	ldarx	r0,0,r1
 ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
-	/*
-	 * Some code path such as load_up_fpu or altivec return directly
-	 * here. They run entirely hard disabled and do not alter the
-	 * interrupt state. They also don't use lwarx/stwcx. and thus
-	 * are known not to leave dangling reservations.
-	 */
-	.globl	fast_exception_return
-fast_exception_return:
-	ld	r3,_MSR(r1)
+	ld	r3,_LINK(r1)
 	ld	r4,_CTR(r1)
-	ld	r0,_LINK(r1)
-	mtctr	r4
-	mtlr	r0
-	ld	r4,_XER(r1)
-	mtspr	SPRN_XER,r4
-
-	kuap_check_amr r5, r6
-
-	REST_8GPRS(5, r1)
-
-	andi.	r0,r3,MSR_RI
-	beq-	.Lunrecov_restore
-
-	/*
-	 * Clear RI before restoring r13.  If we are returning to
-	 * userspace and we take an exception after restoring r13,
-	 * we end up corrupting the userspace r13 value.
-	 */
-	li	r4,0
-	mtmsrd	r4,1
-
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	/* TM debug */
-	std	r3, PACATMSCRATCH(r13) /* Stash returned-to MSR */
-#endif
-	/*
-	 * r13 is our per cpu area, only restore it if we are returning to
-	 * userspace the value stored in the stack frame may belong to
-	 * another CPU.
-	 */
-	andi.	r0,r3,MSR_PR
-	beq	1f
-BEGIN_FTR_SECTION
-	/* Restore PPR */
-	ld	r2,_PPR(r1)
-	mtspr	SPRN_PPR,r2
-END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
-	ACCOUNT_CPU_USER_EXIT(r13, r2, r4)
-	REST_GPR(13, r1)
-
-	/*
-	 * We don't need to restore AMR on the way back to userspace for KUAP.
-	 * The value of AMR only matters while we're in the kernel.
-	 */
-	mtspr	SPRN_SRR1,r3
-
-	ld	r2,_CCR(r1)
-	mtcrf	0xFF,r2
-	ld	r2,_NIP(r1)
-	mtspr	SPRN_SRR0,r2
-
-	ld	r0,GPR0(r1)
-	ld	r2,GPR2(r1)
-	ld	r3,GPR3(r1)
-	ld	r4,GPR4(r1)
-	ld	r1,GPR1(r1)
-	RFI_TO_USER
-	b	.	/* prevent speculative execution */
+	ld	r5,_XER(r1)
+	ld	r6,_CCR(r1)
+	li	r0,0
 
-1:	mtspr	SPRN_SRR1,r3
+	REST_4GPRS(7, r1)
+	REST_2GPRS(11, r1)
 
-	ld	r2,_CCR(r1)
-	mtcrf	0xFF,r2
-	ld	r2,_NIP(r1)
-	mtspr	SPRN_SRR0,r2
+	mtlr	r3
+	mtctr	r4
+	mtspr	SPRN_XER,r5
 
 	/*
 	 * Leaving a stale exception_marker on the stack can confuse
 	 * the reliable stack unwinder later on. Clear it.
 	 */
-	li	r2,0
-	std	r2,STACK_FRAME_OVERHEAD-16(r1)
+	std	r0,STACK_FRAME_OVERHEAD-16(r1)
 
-	ld	r0,GPR0(r1)
-	ld	r2,GPR2(r1)
-	ld	r3,GPR3(r1)
+	REST_4GPRS(2, r1)
 
-	kuap_restore_amr r4
-
-	ld	r4,GPR4(r1)
-	ld	r1,GPR1(r1)
+	bne-	cr1,1f /* emulate stack store */
+	mtcr	r6
+	REST_GPR(6, r1)
+	REST_GPR(0, r1)
+	REST_GPR(1, r1)
 	RFI_TO_KERNEL
 	b	.	/* prevent speculative execution */
 
-#endif /* CONFIG_PPC_BOOK3E */
-
-	/*
-	 * We are returning to a context with interrupts soft disabled.
-	 *
-	 * However, we may also about to hard enable, so we need to
-	 * make sure that in this case, we also clear PACA_IRQ_HARD_DIS
-	 * or that bit can get out of sync and bad things will happen
-	 */
-.Lrestore_irq_off:
-	ld	r3,_MSR(r1)
-	lbz	r7,PACAIRQHAPPENED(r13)
-	andi.	r0,r3,MSR_EE
-	beq	1f
-	rlwinm	r7,r7,0,~PACA_IRQ_HARD_DIS
-	stb	r7,PACAIRQHAPPENED(r13)
-1:
-#if defined(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG) && defined(CONFIG_BUG)
-	/* The interrupt should not have soft enabled. */
-	lbz	r7,PACAIRQSOFTMASK(r13)
-1:	tdeqi	r7,IRQS_ENABLED
-	EMIT_BUG_ENTRY 1b,__FILE__,__LINE__,BUGFLAG_WARNING
-#endif
-	b	.Ldo_restore
-
-	/*
-	 * Something did happen, check if a re-emit is needed
-	 * (this also clears paca->irq_happened)
-	 */
-.Lrestore_check_irq_replay:
-	/* XXX: We could implement a fast path here where we check
-	 * for irq_happened being just 0x01, in which case we can
-	 * clear it and return. That means that we would potentially
-	 * miss a decrementer having wrapped all the way around.
-	 *
-	 * Still, this might be useful for things like hash_page
-	 */
-	bl	__check_irq_replay
-	cmpwi	cr0,r3,0
-	beq	.Lrestore_no_replay
- 
-	/*
-	 * We need to re-emit an interrupt. We do so by re-using our
-	 * existing exception frame. We first change the trap value,
-	 * but we need to ensure we preserve the low nibble of it
-	 */
-	ld	r4,_TRAP(r1)
-	clrldi	r4,r4,60
-	or	r4,r4,r3
-	std	r4,_TRAP(r1)
-
-	/*
-	 * PACA_IRQ_HARD_DIS won't always be set here, so set it now
-	 * to reconcile the IRQ state. Tracing is already accounted for.
-	 */
-	lbz	r4,PACAIRQHAPPENED(r13)
-	ori	r4,r4,PACA_IRQ_HARD_DIS
-	stb	r4,PACAIRQHAPPENED(r13)
-
-	/*
-	 * Then find the right handler and call it. Interrupts are
-	 * still soft-disabled and we keep them that way.
-	*/
-	cmpwi	cr0,r3,0x500
-	bne	1f
-	addi	r3,r1,STACK_FRAME_OVERHEAD;
- 	bl	do_IRQ
-	b	ret_from_except
-1:	cmpwi	cr0,r3,0xf00
-	bne	1f
-	addi	r3,r1,STACK_FRAME_OVERHEAD;
-	bl	performance_monitor_exception
-	b	ret_from_except
-1:	cmpwi	cr0,r3,0xe60
-	bne	1f
-	addi	r3,r1,STACK_FRAME_OVERHEAD;
-	bl	handle_hmi_exception
-	b	ret_from_except
-1:	cmpwi	cr0,r3,0x900
-	bne	1f
-	addi	r3,r1,STACK_FRAME_OVERHEAD;
-	bl	timer_interrupt
-	b	ret_from_except
-#ifdef CONFIG_PPC_DOORBELL
-1:
-#ifdef CONFIG_PPC_BOOK3E
-	cmpwi	cr0,r3,0x280
-#else
-	cmpwi	cr0,r3,0xa00
-#endif /* CONFIG_PPC_BOOK3E */
-	bne	1f
-	addi	r3,r1,STACK_FRAME_OVERHEAD;
-	bl	doorbell_exception
-#endif /* CONFIG_PPC_DOORBELL */
-1:	b	ret_from_except /* What else to do here ? */
- 
-.Lunrecov_restore:
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	unrecoverable_exception
-	b	.Lunrecov_restore
-
-_ASM_NOKPROBE_SYMBOL(ret_from_except);
-_ASM_NOKPROBE_SYMBOL(ret_from_except_lite);
-_ASM_NOKPROBE_SYMBOL(resume_kernel);
-_ASM_NOKPROBE_SYMBOL(fast_exc_return_irq);
-_ASM_NOKPROBE_SYMBOL(restore);
-_ASM_NOKPROBE_SYMBOL(fast_exception_return);
+1:	/*
+	 * Emulate stack store with update. New r1 value was already calculated
+	 * and updated in our interrupt regs by emulate_loadstore, but we can't
+	 * store the previous value of r1 to the stack before re-loading our
+	 * registers from it, otherwise they could be clobbered.  Use
+	 * PACA_EXGEN as temporary storage to hold the store data, as
+	 * interrupts are disabled here so it won't be clobbered.
+	 */
+	mtcr	r6
+	std	r9,PACA_EXGEN+0(r13)
+	addi	r9,r1,INT_FRAME_SIZE /* get original r1 */
+	REST_GPR(6, r1)
+	REST_GPR(0, r1)
+	REST_GPR(1, r1)
+	std	r9,0(r1) /* perform store component of stdu */
+	ld	r9,PACA_EXGEN+0(r13)
 
+	RFI_TO_KERNEL
+	b	.	/* prevent speculative execution */
+#endif /* CONFIG_PPC_BOOK3S */
 
 #ifdef CONFIG_PPC_RTAS
 /*
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 4efac5490216..d9ed79415100 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -24,6 +24,7 @@
 #include <asm/kvm_asm.h>
 #include <asm/kvm_booke_hv_asm.h>
 #include <asm/feature-fixups.h>
+#include <asm/context_tracking.h>
 
 /* XXX This will ultimately add space for a special exception save
  *     structure used to save things like SRR0/SRR1, SPRGs, MAS, etc...
@@ -1041,17 +1042,161 @@ alignment_more:
 	bl	alignment_exception
 	b	ret_from_except
 
-/*
- * We branch here from entry_64.S for the last stage of the exception
- * return code path. MSR:EE is expected to be off at that point
- */
-_GLOBAL(exception_return_book3e)
-	b	1f
+	.align	7
+_GLOBAL(ret_from_except)
+	ld	r11,_TRAP(r1)
+	andi.	r0,r11,1
+	bne	ret_from_except_lite
+	REST_NVGPRS(r1)
+
+_GLOBAL(ret_from_except_lite)
+	/*
+	 * Disable interrupts so that current_thread_info()->flags
+	 * can't change between when we test it and when we return
+	 * from the interrupt.
+	 */
+	wrteei	0
+
+	ld	r9, PACA_THREAD_INFO(r13)
+	ld	r3,_MSR(r1)
+	ld	r10,PACACURRENT(r13)
+	ld	r4,TI_FLAGS(r9)
+	andi.	r3,r3,MSR_PR
+	beq	resume_kernel
+	lwz	r3,(THREAD+THREAD_DBCR0)(r10)
+
+	/* Check current_thread_info()->flags */
+	andi.	r0,r4,_TIF_USER_WORK_MASK
+	bne	1f
+	/*
+	 * Check to see if the dbcr0 register is set up to debug.
+	 * Use the internal debug mode bit to do this.
+	 */
+	andis.	r0,r3,DBCR0_IDM@h
+	beq	restore
+	mfmsr	r0
+	rlwinm	r0,r0,0,~MSR_DE	/* Clear MSR.DE */
+	mtmsr	r0
+	mtspr	SPRN_DBCR0,r3
+	li	r10, -1
+	mtspr	SPRN_DBSR,r10
+	b	restore
+1:	andi.	r0,r4,_TIF_NEED_RESCHED
+	beq	2f
+	bl	restore_interrupts
+	SCHEDULE_USER
+	b	ret_from_except_lite
+2:
+	bl	save_nvgprs
+	/*
+	 * Use a non volatile GPR to save and restore our thread_info flags
+	 * across the call to restore_interrupts.
+	 */
+	mr	r30,r4
+	bl	restore_interrupts
+	mr	r4,r30
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	do_notify_resume
+	b	ret_from_except
+
+resume_kernel:
+	/* check current_thread_info, _TIF_EMULATE_STACK_STORE */
+	andis.	r8,r4,_TIF_EMULATE_STACK_STORE@h
+	beq+	1f
+
+	addi	r8,r1,INT_FRAME_SIZE	/* Get the kprobed function entry */
+
+	ld	r3,GPR1(r1)
+	subi	r3,r3,INT_FRAME_SIZE	/* dst: Allocate a trampoline exception frame */
+	mr	r4,r1			/* src:  current exception frame */
+	mr	r1,r3			/* Reroute the trampoline frame to r1 */
+
+	/* Copy from the original to the trampoline. */
+	li	r5,INT_FRAME_SIZE/8	/* size: INT_FRAME_SIZE */
+	li	r6,0			/* start offset: 0 */
+	mtctr	r5
+2:	ldx	r0,r6,r4
+	stdx	r0,r6,r3
+	addi	r6,r6,8
+	bdnz	2b
+
+	/* Do real store operation to complete stdu */
+	ld	r5,GPR1(r1)
+	std	r8,0(r5)
+
+	/* Clear _TIF_EMULATE_STACK_STORE flag */
+	lis	r11,_TIF_EMULATE_STACK_STORE@h
+	addi	r5,r9,TI_FLAGS
+0:	ldarx	r4,0,r5
+	andc	r4,r4,r11
+	stdcx.	r4,0,r5
+	bne-	0b
+1:
+
+#ifdef CONFIG_PREEMPT
+	/* Check if we need to preempt */
+	andi.	r0,r4,_TIF_NEED_RESCHED
+	beq+	restore
+	/* Check that preempt_count() == 0 and interrupts are enabled */
+	lwz	r8,TI_PREEMPT(r9)
+	cmpwi	cr0,r8,0
+	bne	restore
+	ld	r0,SOFTE(r1)
+	andi.	r0,r0,IRQS_DISABLED
+	bne	restore
+
+	/*
+	 * Here we are preempting the current task. We want to make
+	 * sure we are soft-disabled first and reconcile irq state.
+	 */
+	RECONCILE_IRQ_STATE(r3,r4)
+	bl	preempt_schedule_irq
+
+	/*
+	 * arch_local_irq_restore() from preempt_schedule_irq above may
+	 * enable hard interrupt but we really should disable interrupts
+	 * when we return from the interrupt, and so that we don't get
+	 * interrupted after loading SRR0/1.
+	 */
+	wrteei	0
+#endif /* CONFIG_PREEMPT */
+
+restore:
+	/*
+	 * This is the main kernel exit path. First we check if we
+	 * are about to re-enable interrupts
+	 */
+	ld	r5,SOFTE(r1)
+	lbz	r6,PACAIRQSOFTMASK(r13)
+	andi.	r5,r5,IRQS_DISABLED
+	bne	.Lrestore_irq_off
+
+	/* We are enabling, were we already enabled ? Yes, just return */
+	andi.	r6,r6,IRQS_DISABLED
+	beq	cr0,fast_exception_return
+
+	/*
+	 * We are about to soft-enable interrupts (we are hard disabled
+	 * at this point). We check if there's anything that needs to
+	 * be replayed first.
+	 */
+	lbz	r0,PACAIRQHAPPENED(r13)
+	cmpwi	cr0,r0,0
+	bne-	.Lrestore_check_irq_replay
+
+	/*
+	 * Get here when nothing happened while soft-disabled, just
+	 * soft-enable and move-on. We will hard-enable as a side
+	 * effect of rfi
+	 */
+.Lrestore_no_replay:
+	TRACE_ENABLE_INTS
+	li	r0,IRQS_ENABLED
+	stb	r0,PACAIRQSOFTMASK(r13);
 
 /* This is the return from load_up_fpu fast path which could do with
  * less GPR restores in fact, but for now we have a single return path
  */
-	.globl fast_exception_return
 fast_exception_return:
 	wrteei	0
 1:	mr	r0,r13
@@ -1092,6 +1237,102 @@ fast_exception_return:
 	mfspr	r13,SPRN_SPRG_GEN_SCRATCH
 	rfi
 
+	/*
+	 * We are returning to a context with interrupts soft disabled.
+	 *
+	 * However, we may also about to hard enable, so we need to
+	 * make sure that in this case, we also clear PACA_IRQ_HARD_DIS
+	 * or that bit can get out of sync and bad things will happen
+	 */
+.Lrestore_irq_off:
+	ld	r3,_MSR(r1)
+	lbz	r7,PACAIRQHAPPENED(r13)
+	andi.	r0,r3,MSR_EE
+	beq	1f
+	rlwinm	r7,r7,0,~PACA_IRQ_HARD_DIS
+	stb	r7,PACAIRQHAPPENED(r13)
+1:
+#if defined(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG) && defined(CONFIG_BUG)
+	/* The interrupt should not have soft enabled. */
+	lbz	r7,PACAIRQSOFTMASK(r13)
+1:	tdeqi	r7,IRQS_ENABLED
+	EMIT_BUG_ENTRY 1b,__FILE__,__LINE__,BUGFLAG_WARNING
+#endif
+	b	fast_exception_return
+
+	/*
+	 * Something did happen, check if a re-emit is needed
+	 * (this also clears paca->irq_happened)
+	 */
+.Lrestore_check_irq_replay:
+	/* XXX: We could implement a fast path here where we check
+	 * for irq_happened being just 0x01, in which case we can
+	 * clear it and return. That means that we would potentially
+	 * miss a decrementer having wrapped all the way around.
+	 *
+	 * Still, this might be useful for things like hash_page
+	 */
+	bl	__check_irq_replay
+	cmpwi	cr0,r3,0
+	beq	.Lrestore_no_replay
+
+	/*
+	 * We need to re-emit an interrupt. We do so by re-using our
+	 * existing exception frame. We first change the trap value,
+	 * but we need to ensure we preserve the low nibble of it
+	 */
+	ld	r4,_TRAP(r1)
+	clrldi	r4,r4,60
+	or	r4,r4,r3
+	std	r4,_TRAP(r1)
+
+	/*
+	 * PACA_IRQ_HARD_DIS won't always be set here, so set it now
+	 * to reconcile the IRQ state. Tracing is already accounted for.
+	 */
+	lbz	r4,PACAIRQHAPPENED(r13)
+	ori	r4,r4,PACA_IRQ_HARD_DIS
+	stb	r4,PACAIRQHAPPENED(r13)
+
+	/*
+	 * Then find the right handler and call it. Interrupts are
+	 * still soft-disabled and we keep them that way.
+	*/
+	cmpwi	cr0,r3,0x500
+	bne	1f
+	addi	r3,r1,STACK_FRAME_OVERHEAD;
+	bl	do_IRQ
+	b	ret_from_except
+1:	cmpwi	cr0,r3,0xf00
+	bne	1f
+	addi	r3,r1,STACK_FRAME_OVERHEAD;
+	bl	performance_monitor_exception
+	b	ret_from_except
+1:	cmpwi	cr0,r3,0xe60
+	bne	1f
+	addi	r3,r1,STACK_FRAME_OVERHEAD;
+	bl	handle_hmi_exception
+	b	ret_from_except
+1:	cmpwi	cr0,r3,0x900
+	bne	1f
+	addi	r3,r1,STACK_FRAME_OVERHEAD;
+	bl	timer_interrupt
+	b	ret_from_except
+#ifdef CONFIG_PPC_DOORBELL
+1:
+	cmpwi	cr0,r3,0x280
+	bne	1f
+	addi	r3,r1,STACK_FRAME_OVERHEAD;
+	bl	doorbell_exception
+#endif /* CONFIG_PPC_DOORBELL */
+1:	b	ret_from_except /* What else to do here ? */
+
+_ASM_NOKPROBE_SYMBOL(ret_from_except);
+_ASM_NOKPROBE_SYMBOL(ret_from_except_lite);
+_ASM_NOKPROBE_SYMBOL(resume_kernel);
+_ASM_NOKPROBE_SYMBOL(restore);
+_ASM_NOKPROBE_SYMBOL(fast_exception_return);
+
 /*
  * Trampolines used when spotting a bad kernel stack pointer in
  * the exception entry code.
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index bad8cd9e7dba..d635fd4e40ea 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -575,6 +575,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	std	r10,GPR12(r1)
 	std	r11,GPR13(r1)
 
+	SAVE_NVGPRS(r1)
+
 	.if IDAR
 	.if IISIDE
 	ld	r10,_NIP(r1)
@@ -611,7 +613,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	mfspr	r11,SPRN_XER		/* save XER in stackframe	*/
 	std	r10,SOFTE(r1)
 	std	r11,_XER(r1)
-	li	r9,(IVEC)+1
+	li	r9,IVEC
 	std	r9,_TRAP(r1)		/* set trap number		*/
 	li	r10,0
 	ld	r11,exception_marker@toc(r2)
@@ -918,7 +920,6 @@ EXC_COMMON_BEGIN(system_reset_common)
 	ld	r1,PACA_NMI_EMERG_SP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
 	__GEN_COMMON_BODY system_reset
-	bl	save_nvgprs
 	/*
 	 * Set IRQS_ALL_DISABLED unconditionally so irqs_disabled() does
 	 * the right thing. We do not want to reconcile because that goes
@@ -1099,7 +1100,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	li	r10,MSR_RI
 	mtmsrd	r10,1
 
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_early
 	std	r3,RESULT(r1)	/* Save result */
@@ -1192,10 +1192,9 @@ EXC_COMMON_BEGIN(machine_check_common)
 	/* Enable MSR_RI when finished with PACA_EXMC */
 	li	r10,MSR_RI
 	mtmsrd 	r10,1
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_exception
-	b	ret_from_except
+	b	interrupt_return
 
 	GEN_KVM machine_check
 
@@ -1362,20 +1361,19 @@ BEGIN_MMU_FTR_SECTION
 	bl	do_slb_fault
 	cmpdi	r3,0
 	bne-	1f
-	b	fast_exception_return
+	b	fast_interrupt_return
 1:	/* Error case */
 MMU_FTR_SECTION_ELSE
 	/* Radix case, access is outside page table range */
 	li	r3,-EFAULT
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
-	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
 	ld	r4,_DAR(r1)
 	ld	r5,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
-	b	ret_from_except
+	b	interrupt_return
 
 	GEN_KVM data_access_slb
 
@@ -1455,20 +1453,19 @@ BEGIN_MMU_FTR_SECTION
 	bl	do_slb_fault
 	cmpdi	r3,0
 	bne-	1f
-	b	fast_exception_return
+	b	fast_interrupt_return
 1:	/* Error case */
 MMU_FTR_SECTION_ELSE
 	/* Radix case, access is outside page table range */
 	li	r3,-EFAULT
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
-	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
 	ld	r4,_DAR(r1)
 	ld	r5,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
-	b	ret_from_except
+	b	interrupt_return
 
 	GEN_KVM instruction_access_slb
 
@@ -1516,7 +1513,7 @@ EXC_COMMON_BEGIN(hardware_interrupt_common)
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
-	b	ret_from_except_lite
+	b	interrupt_return_lite
 
 	GEN_KVM hardware_interrupt
 
@@ -1542,10 +1539,9 @@ EXC_VIRT_BEGIN(alignment, 0x4600, 0x100)
 EXC_VIRT_END(alignment, 0x4600, 0x100)
 EXC_COMMON_BEGIN(alignment_common)
 	GEN_COMMON alignment
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	alignment_exception
-	b	ret_from_except
+	b	interrupt_return
 
 	GEN_KVM alignment
 
@@ -1606,10 +1602,9 @@ EXC_COMMON_BEGIN(program_check_common)
 	__ISTACK(program_check)=1
 	__GEN_COMMON_BODY program_check
 3:
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	program_check_exception
-	b	ret_from_except
+	b	interrupt_return
 
 	GEN_KVM program_check
 
@@ -1640,7 +1635,6 @@ EXC_VIRT_END(fp_unavailable, 0x4800, 0x100)
 EXC_COMMON_BEGIN(fp_unavailable_common)
 	GEN_COMMON fp_unavailable
 	bne	1f			/* if from user, just load it up */
-	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	kernel_fp_unavailable_exception
@@ -1657,14 +1651,13 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_TM)
 #endif
 	bl	load_up_fpu
-	b	fast_exception_return
+	b	fast_interrupt_return
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
-	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	fp_unavailable_tm
-	b	ret_from_except
+	b	interrupt_return
 #endif
 
 	GEN_KVM fp_unavailable
@@ -1707,7 +1700,7 @@ EXC_COMMON_BEGIN(decrementer_common)
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	timer_interrupt
-	b	ret_from_except_lite
+	b	interrupt_return_lite
 
 	GEN_KVM decrementer
 
@@ -1798,7 +1791,7 @@ EXC_COMMON_BEGIN(doorbell_super_common)
 #else
 	bl	unknown_exception
 #endif
-	b	ret_from_except_lite
+	b	interrupt_return_lite
 
 	GEN_KVM doorbell_super
 
@@ -1970,10 +1963,9 @@ EXC_VIRT_BEGIN(single_step, 0x4d00, 0x100)
 EXC_VIRT_END(single_step, 0x4d00, 0x100)
 EXC_COMMON_BEGIN(single_step_common)
 	GEN_COMMON single_step
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	single_step_exception
-	b	ret_from_except
+	b	interrupt_return
 
 	GEN_KVM single_step
 
@@ -2008,7 +2000,6 @@ EXC_VIRT_BEGIN(h_data_storage, 0x4e00, 0x20)
 EXC_VIRT_END(h_data_storage, 0x4e00, 0x20)
 EXC_COMMON_BEGIN(h_data_storage_common)
 	GEN_COMMON h_data_storage
-	bl      save_nvgprs
 	addi    r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
 	ld	r4,_DAR(r1)
@@ -2017,7 +2008,7 @@ BEGIN_MMU_FTR_SECTION
 MMU_FTR_SECTION_ELSE
 	bl      unknown_exception
 ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_TYPE_RADIX)
-	b       ret_from_except
+	b       interrupt_return
 
 	GEN_KVM h_data_storage
 
@@ -2042,10 +2033,9 @@ EXC_VIRT_BEGIN(h_instr_storage, 0x4e20, 0x20)
 EXC_VIRT_END(h_instr_storage, 0x4e20, 0x20)
 EXC_COMMON_BEGIN(h_instr_storage_common)
 	GEN_COMMON h_instr_storage
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	unknown_exception
-	b	ret_from_except
+	b	interrupt_return
 
 	GEN_KVM h_instr_storage
 
@@ -2068,10 +2058,9 @@ EXC_VIRT_BEGIN(emulation_assist, 0x4e40, 0x20)
 EXC_VIRT_END(emulation_assist, 0x4e40, 0x20)
 EXC_COMMON_BEGIN(emulation_assist_common)
 	GEN_COMMON emulation_assist
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	emulation_assist_interrupt
-	b	ret_from_except
+	b	interrupt_return
 
 	GEN_KVM emulation_assist
 
@@ -2151,10 +2140,9 @@ EXC_COMMON_BEGIN(hmi_exception_common)
 	GEN_COMMON hmi_exception
 	FINISH_NAP
 	RUNLATCH_ON
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	handle_hmi_exception
-	b	ret_from_except
+	b	interrupt_return
 
 	GEN_KVM hmi_exception
 
@@ -2188,7 +2176,7 @@ EXC_COMMON_BEGIN(h_doorbell_common)
 #else
 	bl	unknown_exception
 #endif
-	b	ret_from_except_lite
+	b	interrupt_return_lite
 
 	GEN_KVM h_doorbell
 
@@ -2218,7 +2206,7 @@ EXC_COMMON_BEGIN(h_virt_irq_common)
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
-	b	ret_from_except_lite
+	b	interrupt_return_lite
 
 	GEN_KVM h_virt_irq
 
@@ -2265,7 +2253,7 @@ EXC_COMMON_BEGIN(performance_monitor_common)
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	performance_monitor_exception
-	b	ret_from_except_lite
+	b	interrupt_return_lite
 
 	GEN_KVM performance_monitor
 
@@ -2305,23 +2293,21 @@ BEGIN_FTR_SECTION
   END_FTR_SECTION_NESTED(CPU_FTR_TM, CPU_FTR_TM, 69)
 #endif
 	bl	load_up_altivec
-	b	fast_exception_return
+	b	fast_interrupt_return
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
-	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	altivec_unavailable_tm
-	b	ret_from_except
+	b	interrupt_return
 #endif
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 #endif
-	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	altivec_unavailable_exception
-	b	ret_from_except
+	b	interrupt_return
 
 	GEN_KVM altivec_unavailable
 
@@ -2363,20 +2349,18 @@ BEGIN_FTR_SECTION
 	b	load_up_vsx
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
-	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	vsx_unavailable_tm
-	b	ret_from_except
+	b	interrupt_return
 #endif
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 #endif
-	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	vsx_unavailable_exception
-	b	ret_from_except
+	b	interrupt_return
 
 	GEN_KVM vsx_unavailable
 
@@ -2403,10 +2387,9 @@ EXC_VIRT_BEGIN(facility_unavailable, 0x4f60, 0x20)
 EXC_VIRT_END(facility_unavailable, 0x4f60, 0x20)
 EXC_COMMON_BEGIN(facility_unavailable_common)
 	GEN_COMMON facility_unavailable
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
-	b	ret_from_except
+	b	interrupt_return
 
 	GEN_KVM facility_unavailable
 
@@ -2433,10 +2416,9 @@ EXC_VIRT_BEGIN(h_facility_unavailable, 0x4f80, 0x20)
 EXC_VIRT_END(h_facility_unavailable, 0x4f80, 0x20)
 EXC_COMMON_BEGIN(h_facility_unavailable_common)
 	GEN_COMMON h_facility_unavailable
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
-	b	ret_from_except
+	b	interrupt_return
 
 	GEN_KVM h_facility_unavailable
 
@@ -2467,10 +2449,9 @@ EXC_REAL_END(cbe_system_error, 0x1200, 0x100)
 EXC_VIRT_NONE(0x5200, 0x100)
 EXC_COMMON_BEGIN(cbe_system_error_common)
 	GEN_COMMON cbe_system_error
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	cbe_system_error_exception
-	b	ret_from_except
+	b	interrupt_return
 
 	GEN_KVM cbe_system_error
 
@@ -2496,10 +2477,9 @@ EXC_VIRT_BEGIN(instruction_breakpoint, 0x5300, 0x100)
 EXC_VIRT_END(instruction_breakpoint, 0x5300, 0x100)
 EXC_COMMON_BEGIN(instruction_breakpoint_common)
 	GEN_COMMON instruction_breakpoint
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	instruction_breakpoint_exception
-	b	ret_from_except
+	b	interrupt_return
 
 	GEN_KVM instruction_breakpoint
 
@@ -2619,10 +2599,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 
 EXC_COMMON_BEGIN(denorm_exception_common)
 	GEN_COMMON denorm_exception
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	unknown_exception
-	b	ret_from_except
+	b	interrupt_return
 
 	GEN_KVM denorm_exception
 
@@ -2641,10 +2620,9 @@ EXC_REAL_END(cbe_maintenance, 0x1600, 0x100)
 EXC_VIRT_NONE(0x5600, 0x100)
 EXC_COMMON_BEGIN(cbe_maintenance_common)
 	GEN_COMMON cbe_maintenance
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	cbe_maintenance_exception
-	b	ret_from_except
+	b	interrupt_return
 
 	GEN_KVM cbe_maintenance
 
@@ -2669,14 +2647,13 @@ EXC_VIRT_BEGIN(altivec_assist, 0x5700, 0x100)
 EXC_VIRT_END(altivec_assist, 0x5700, 0x100)
 EXC_COMMON_BEGIN(altivec_assist_common)
 	GEN_COMMON altivec_assist
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_ALTIVEC
 	bl	altivec_assist_exception
 #else
 	bl	unknown_exception
 #endif
-	b	ret_from_except
+	b	interrupt_return
 
 	GEN_KVM altivec_assist
 
@@ -2695,10 +2672,9 @@ EXC_REAL_END(cbe_thermal, 0x1800, 0x100)
 EXC_VIRT_NONE(0x5800, 0x100)
 EXC_COMMON_BEGIN(cbe_thermal_common)
 	GEN_COMMON cbe_thermal
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	cbe_thermal_exception
-	b	ret_from_except
+	b	interrupt_return
 
 	GEN_KVM cbe_thermal
 
@@ -2731,7 +2707,6 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	ld	r1,PACAEMERGSP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
 	__GEN_COMMON_BODY soft_nmi
-	bl	save_nvgprs
 
 	/*
 	 * Set IRQS_ALL_DISABLED and save PACAIRQHAPPENED (see
@@ -3063,7 +3038,7 @@ do_hash_page:
         cmpdi	r3,0			/* see if __hash_page succeeded */
 
 	/* Success */
-	beq	fast_exc_return_irq	/* Return from exception on success */
+	beq	interrupt_return_lite	/* Return from exception on success */
 
 	/* Error */
 	blt-	13f
@@ -3080,17 +3055,15 @@ handle_page_fault:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_page_fault
 	cmpdi	r3,0
-	beq+	ret_from_except_lite
-	bl	save_nvgprs
+	beq+	interrupt_return_lite
 	mr	r5,r3
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r4,_DAR(r1)
 	bl	bad_page_fault
-	b	ret_from_except
+	b	interrupt_return
 
 /* We have a data breakpoint exception - handle it */
 handle_dabr_fault:
-	bl	save_nvgprs
 	ld      r4,_DAR(r1)
 	ld      r5,_DSISR(r1)
 	addi    r3,r1,STACK_FRAME_OVERHEAD
@@ -3098,21 +3071,20 @@ handle_dabr_fault:
 	/*
 	 * do_break() may have changed the NV GPRS while handling a breakpoint.
 	 * If so, we need to restore them with their updated values. Don't use
-	 * ret_from_except_lite here.
+	 * interrupt_return_lite here.
 	 */
-	b       ret_from_except
+	b       interrupt_return
 
 
 #ifdef CONFIG_PPC_BOOK3S_64
 /* We have a page fault that hash_page could handle but HV refused
  * the PTE insertion
  */
-13:	bl	save_nvgprs
-	mr	r5,r3
+13:	mr	r5,r3
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r4,_DAR(r1)
 	bl	low_hash_fault
-	b	ret_from_except
+	b	interrupt_return
 #endif
 
 /*
@@ -3122,11 +3094,10 @@ handle_dabr_fault:
  * were soft-disabled.  We want to invoke the exception handler for
  * the access, or panic if there isn't a handler.
  */
-77:	bl	save_nvgprs
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+77:	addi	r3,r1,STACK_FRAME_OVERHEAD
 	li	r5,SIGSEGV
 	bl	bad_page_fault
-	b	ret_from_except
+	b	interrupt_return
 
 /*
  * When doorbell is triggered from system reset wakeup, the message is
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index afd74eba70aa..6ea27dbcb872 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -110,6 +110,8 @@ static inline notrace int decrementer_check_overflow(void)
 	return now >= *next_tb;
 }
 
+#ifdef CONFIG_PPC_BOOK3E
+
 /* This is called whenever we are re-enabling interrupts
  * and returns either 0 (nothing to do) or 500/900/280/a00/e80 if
  * there's an EE, DEC or DBELL to generate.
@@ -169,41 +171,16 @@ notrace unsigned int __check_irq_replay(void)
 		}
 	}
 
-	/*
-	 * Force the delivery of pending soft-disabled interrupts on PS3.
-	 * Any HV call will have this side effect.
-	 */
-	if (firmware_has_feature(FW_FEATURE_PS3_LV1)) {
-		u64 tmp, tmp2;
-		lv1_get_version_info(&tmp, &tmp2);
-	}
-
-	/*
-	 * Check if an hypervisor Maintenance interrupt happened.
-	 * This is a higher priority interrupt than the others, so
-	 * replay it first.
-	 */
-	if (happened & PACA_IRQ_HMI) {
-		local_paca->irq_happened &= ~PACA_IRQ_HMI;
-		return 0xe60;
-	}
-
 	if (happened & PACA_IRQ_DEC) {
 		local_paca->irq_happened &= ~PACA_IRQ_DEC;
 		return 0x900;
 	}
 
-	if (happened & PACA_IRQ_PMI) {
-		local_paca->irq_happened &= ~PACA_IRQ_PMI;
-		return 0xf00;
-	}
-
 	if (happened & PACA_IRQ_EE) {
 		local_paca->irq_happened &= ~PACA_IRQ_EE;
 		return 0x500;
 	}
 
-#ifdef CONFIG_PPC_BOOK3E
 	/*
 	 * Check if an EPR external interrupt happened this bit is typically
 	 * set if we need to handle another "edge" interrupt from within the
@@ -218,20 +195,15 @@ notrace unsigned int __check_irq_replay(void)
 		local_paca->irq_happened &= ~PACA_IRQ_DBELL;
 		return 0x280;
 	}
-#else
-	if (happened & PACA_IRQ_DBELL) {
-		local_paca->irq_happened &= ~PACA_IRQ_DBELL;
-		return 0xa00;
-	}
-#endif /* CONFIG_PPC_BOOK3E */
 
 	/* There should be nothing left ! */
 	BUG_ON(local_paca->irq_happened != 0);
 
 	return 0;
 }
+#endif /* CONFIG_PPC_BOOK3E */
 
-static void replay_soft_interrupts(void)
+void replay_soft_interrupts(void)
 {
 	/*
 	 * We use local_paca rather than get_paca() to avoid all
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index fad50db9dcf2..1dea4d280f6f 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -236,23 +236,9 @@ void enable_kernel_fp(void)
 	}
 }
 EXPORT_SYMBOL(enable_kernel_fp);
-
-static int restore_fp(struct task_struct *tsk)
-{
-	if (tsk->thread.load_fp) {
-		load_fp_state(&current->thread.fp_state);
-		current->thread.load_fp++;
-		return 1;
-	}
-	return 0;
-}
-#else
-static int restore_fp(struct task_struct *tsk) { return 0; }
 #endif /* CONFIG_PPC_FPU */
 
 #ifdef CONFIG_ALTIVEC
-#define loadvec(thr) ((thr).load_vec)
-
 static void __giveup_altivec(struct task_struct *tsk)
 {
 	unsigned long msr;
@@ -318,21 +304,6 @@ void flush_altivec_to_thread(struct task_struct *tsk)
 	}
 }
 EXPORT_SYMBOL_GPL(flush_altivec_to_thread);
-
-static int restore_altivec(struct task_struct *tsk)
-{
-	if (cpu_has_feature(CPU_FTR_ALTIVEC) && (tsk->thread.load_vec)) {
-		load_vr_state(&tsk->thread.vr_state);
-		tsk->thread.used_vr = 1;
-		tsk->thread.load_vec++;
-
-		return 1;
-	}
-	return 0;
-}
-#else
-#define loadvec(thr) 0
-static inline int restore_altivec(struct task_struct *tsk) { return 0; }
 #endif /* CONFIG_ALTIVEC */
 
 #ifdef CONFIG_VSX
@@ -400,18 +371,6 @@ void flush_vsx_to_thread(struct task_struct *tsk)
 	}
 }
 EXPORT_SYMBOL_GPL(flush_vsx_to_thread);
-
-static int restore_vsx(struct task_struct *tsk)
-{
-	if (cpu_has_feature(CPU_FTR_VSX)) {
-		tsk->thread.used_vsr = 1;
-		return 1;
-	}
-
-	return 0;
-}
-#else
-static inline int restore_vsx(struct task_struct *tsk) { return 0; }
 #endif /* CONFIG_VSX */
 
 #ifdef CONFIG_SPE
@@ -511,6 +470,53 @@ void giveup_all(struct task_struct *tsk)
 }
 EXPORT_SYMBOL(giveup_all);
 
+#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC_FPU
+static int restore_fp(struct task_struct *tsk)
+{
+	if (tsk->thread.load_fp) {
+		load_fp_state(&current->thread.fp_state);
+		current->thread.load_fp++;
+		return 1;
+	}
+	return 0;
+}
+#else
+static int restore_fp(struct task_struct *tsk) { return 0; }
+#endif /* CONFIG_PPC_FPU */
+
+#ifdef CONFIG_ALTIVEC
+#define loadvec(thr) ((thr).load_vec)
+static int restore_altivec(struct task_struct *tsk)
+{
+	if (cpu_has_feature(CPU_FTR_ALTIVEC) && (tsk->thread.load_vec)) {
+		load_vr_state(&tsk->thread.vr_state);
+		tsk->thread.used_vr = 1;
+		tsk->thread.load_vec++;
+
+		return 1;
+	}
+	return 0;
+}
+#else
+#define loadvec(thr) 0
+static inline int restore_altivec(struct task_struct *tsk) { return 0; }
+#endif /* CONFIG_ALTIVEC */
+
+#ifdef CONFIG_VSX
+static int restore_vsx(struct task_struct *tsk)
+{
+	if (cpu_has_feature(CPU_FTR_VSX)) {
+		tsk->thread.used_vsr = 1;
+		return 1;
+	}
+
+	return 0;
+}
+#else
+static inline int restore_vsx(struct task_struct *tsk) { return 0; }
+#endif /* CONFIG_VSX */
+
 /*
  * The exception exit path calls restore_math() with interrupts hard disabled
  * but the soft irq state not "reconciled". ftrace code that calls
@@ -551,6 +557,7 @@ void notrace restore_math(struct pt_regs *regs)
 
 	regs->msr = msr;
 }
+#endif
 
 static void save_all(struct task_struct *tsk)
 {
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 20f77cc19df8..08e0bebbd3b6 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -26,7 +26,11 @@ notrace long system_call_exception(long r3, long r4, long r5, long r6, long r7,
 	unsigned long ti_flags;
 	syscall_fn f;
 
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S))
+		BUG_ON(!(regs->msr & MSR_RI));
 	BUG_ON(!(regs->msr & MSR_PR));
+	BUG_ON(!FULL_REGS(regs));
+	BUG_ON(regs->softe != IRQS_ENABLED);
 
 	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
 	    unlikely(regs->msr & MSR_TS_T))
@@ -195,7 +199,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 		trace_hardirqs_off();
 		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 		local_irq_enable();
-		/* Took an interrupt which may have more exit work to do. */
+		/* Took an interrupt, may have more exit work to do. */
 		goto again;
 	}
 	local_paca->irq_happened = 0;
@@ -211,3 +215,161 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 
 	return ret;
 }
+
+#ifdef CONFIG_PPC_BOOK3S /* BOOK3E not yet using this */
+notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr)
+{
+#ifdef CONFIG_PPC_BOOK3E
+	struct thread_struct *ts = &current->thread;
+#endif
+	unsigned long *ti_flagsp = &current_thread_info()->flags;
+	unsigned long ti_flags;
+	unsigned long flags;
+	unsigned long ret = 0;
+
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S))
+		BUG_ON(!(regs->msr & MSR_RI));
+	BUG_ON(!(regs->msr & MSR_PR));
+	BUG_ON(!FULL_REGS(regs));
+	BUG_ON(regs->softe != IRQS_ENABLED);
+
+	local_irq_save(flags);
+
+again:
+	ti_flags = READ_ONCE(*ti_flagsp);
+	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
+		local_irq_enable(); /* returning to user: may enable */
+		if (ti_flags & _TIF_NEED_RESCHED) {
+			schedule();
+		} else {
+			if (ti_flags & _TIF_SIGPENDING)
+				ret |= _TIF_RESTOREALL;
+			do_notify_resume(regs, ti_flags);
+		}
+		local_irq_disable();
+		ti_flags = READ_ONCE(*ti_flagsp);
+	}
+
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S)) {
+		unsigned long mathflags = 0;
+
+		if (IS_ENABLED(CONFIG_PPC_FPU))
+			mathflags |= MSR_FP;
+		if (IS_ENABLED(CONFIG_ALTIVEC))
+			mathflags |= MSR_VEC;
+
+		if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
+						(ti_flags & _TIF_RESTORE_TM))
+			restore_tm_state(regs);
+		else if ((regs->msr & mathflags) != mathflags)
+			restore_math(regs);
+	}
+
+	trace_hardirqs_on();
+	__hard_EE_RI_disable();
+	if (unlikely(lazy_irq_pending())) {
+		__hard_RI_enable();
+		trace_hardirqs_off();
+		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+		local_irq_enable();
+		local_irq_disable();
+		/* Took an interrupt, may have more exit work to do. */
+		goto again;
+	}
+	local_paca->irq_happened = 0;
+	irq_soft_mask_set(IRQS_ENABLED);
+
+#ifdef CONFIG_PPC_BOOK3E
+	if (unlikely(ts->debug.dbcr0 & DBCR0_IDM)) {
+		/*
+		 * Check to see if the dbcr0 register is set up to debug.
+		 * Use the internal debug mode bit to do this.
+		 */
+		mtmsr(mfmsr() & ~MSR_DE);
+		mtspr(SPRN_DBCR0, ts->debug.dbcr0);
+		mtspr(SPRN_DBSR, -1);
+	}
+#endif
+
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	local_paca->tm_scratch = regs->msr;
+#endif
+
+	kuap_check_amr();
+
+	account_cpu_user_exit();
+
+	return ret;
+}
+
+void unrecoverable_exception(struct pt_regs *regs);
+void preempt_schedule_irq(void);
+
+notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr)
+{
+	unsigned long *ti_flagsp = &current_thread_info()->flags;
+	unsigned long flags;
+
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && unlikely(!(regs->msr & MSR_RI)))
+		unrecoverable_exception(regs);
+	BUG_ON(regs->msr & MSR_PR);
+	BUG_ON(!FULL_REGS(regs));
+
+	local_irq_save(flags);
+
+	if (regs->softe == IRQS_ENABLED) {
+		/* Returning to a kernel context with local irqs enabled. */
+		WARN_ON_ONCE(!(regs->msr & MSR_EE));
+again:
+		if (IS_ENABLED(CONFIG_PREEMPT)) {
+			/* Return to preemptible kernel context */
+			if (unlikely(*ti_flagsp & _TIF_NEED_RESCHED)) {
+				if (preempt_count() == 0)
+					preempt_schedule_irq();
+			}
+		}
+
+		trace_hardirqs_on();
+		__hard_EE_RI_disable();
+		if (unlikely(lazy_irq_pending())) {
+			__hard_RI_enable();
+			irq_soft_mask_set(IRQS_ALL_DISABLED);
+			trace_hardirqs_off();
+			local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+			/*
+			 * Can't local_irq_enable in case we are in interrupt
+			 * context. Must replay directly.
+			 */
+			replay_soft_interrupts();
+			irq_soft_mask_set(flags);
+			/* Took an interrupt, may have more exit work to do. */
+			goto again;
+		}
+		local_paca->irq_happened = 0;
+		irq_soft_mask_set(IRQS_ENABLED);
+	} else {
+		/* Returning to a kernel context with local irqs disabled. */
+		trace_hardirqs_on();
+		__hard_EE_RI_disable();
+		if (regs->msr & MSR_EE)
+			local_paca->irq_happened &= ~PACA_IRQ_HARD_DIS;
+	}
+
+
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	local_paca->tm_scratch = regs->msr;
+#endif
+
+	/*
+	 * We don't need to restore AMR on the way back to userspace for KUAP.
+	 * The value of AMR only matters while we're in the kernel.
+	 */
+	kuap_restore_amr(regs);
+
+	if (unlikely(*ti_flagsp & _TIF_EMULATE_STACK_STORE)) {
+		clear_bits(_TIF_EMULATE_STACK_STORE, ti_flagsp);
+		return 1;
+	}
+	return 0;
+}
+#endif
diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
index 25c14a0981bf..d20c5e79e03c 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -134,7 +134,7 @@ _GLOBAL(load_up_vsx)
 	/* enable use of VSX after return */
 	oris	r12,r12,MSR_VSX@h
 	std	r12,_MSR(r1)
-	b	fast_exception_return
+	b	fast_interrupt_return
 
 #endif /* CONFIG_VSX */
 
-- 
2.23.0

