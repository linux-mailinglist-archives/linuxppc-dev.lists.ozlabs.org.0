Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 838919FDFB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 11:11:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JKkL0JKkzDqtr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 19:11:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WDC/mHBV"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JKd81hLkzDr6Z
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 19:07:24 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id p3so1104688pgb.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 02:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j2TmyXRYPMfHrmL3R0GVj5JqGBeqcKGSLNMHMShYVHU=;
 b=WDC/mHBV8v1Xl5tN0Mc839GNnRmnZvD9l7U19Py7Uwk3rdgDrXrrnsAJB1dh+6EACh
 /2mQ/XHuRgzWiAnrUaV+BjCYD7r6uQQ3wQVlrCrpnWz7Mu2SMIEZHDIHA/2H7nYw9sQP
 /hHym01zZ7Ay5ME0+1Ko1mo/C2bVu5Vn/ky+rGBhNgu9SgkTYRMFz6WQnX2vFG8rsta2
 81Gq+Ahh0wq6d+MY1vAXvwf/ZxQaVjHI3eBx9swDhc67F0KEFQ4eMb6zOBhC/s7N5NtO
 7VIYednEKsRHO4wLNxHk9uUyVBtoVxDqST7/cgxP1HrJYtwhssHVRYI5bq/zGIVM0oAb
 393g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j2TmyXRYPMfHrmL3R0GVj5JqGBeqcKGSLNMHMShYVHU=;
 b=h3AcXgqCgsojOn6Ri+S0rcjiJaAR7yrtrEMXn2gvnJTbzlYQ+p5qXjKSV0efAVzE1C
 J8EztQ5Jt485AxqCuQ7gznDv6RjgZcRqy9pcwWB5B7wyr9jvHGAgkhoosKxNSPDKpYbJ
 Wi4QUDwwP4EeuiVArXYnC+69EMyhG+6XUoyXz/O8czHiKXdAhpomBdJN4S+qM/qNNTZi
 mTs4kSnXTCi2BuLvNhPW5q2Zb4+A9o2buoHMI2KEn7CkBb78PfdxrIvW5brZRUgJopKt
 IOxXfqm1Bj+NY422cVib5r8ArTjVcWUo7GqMj6iEtPmYi8Lw6tfTsR3aAIpczN5PgiJF
 Ulfg==
X-Gm-Message-State: APjAAAVlGFUpexQQAl8C5+TZKInYkjpPlOQdp11Iis3wsIKzk8Lt7AmL
 V2QpKWjjY41lcfx4QXBE/LcNQDRc
X-Google-Smtp-Source: APXvYqzKdmycvAIEulqimF6pPT9xuBxxjHgy51ms5XhzeyRjaFiSDVXgcAslZ/mtYTkxG4Y0Fe7dxg==
X-Received: by 2002:a63:6947:: with SMTP id e68mr2594666pgc.60.1566983240028; 
 Wed, 28 Aug 2019 02:07:20 -0700 (PDT)
Received: from bobo.local0.net (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id f20sm1891672pgg.56.2019.08.28.02.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 02:07:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64: interrupt return in C
Date: Wed, 28 Aug 2019 19:06:06 +1000
Message-Id: <20190828090606.5028-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a work in progress that goes on top of the syscalls in C patch.
It's not quite complete, 64e low level exit is not taken care of, and
the new return is hacked into the existing interrupt handlers pretty
quickly (e.g., full gprs handling is still ugly and could be cleaned),
but that code touches exception-64s.S which is under heavy modification
in parallel so I will rebase on top of that before polishing it properly.
I will also try to convert to more IS_ENABLED() for Christophe.

I guess syscall_64.c will change to interrupt_64.c with this.

Hopefully there is no fundamental problem with it, it replaces some
fairly horrific asm code with stack frame bouncing and reusing for
replay, and almost imcomprehensible maze of exit points and labels.

This is just a quick preview because it's booting, if anyone can spot
major issue with the approach would be good.

Thanks,
Nick
---
 .../powerpc/include/asm/book3s/64/kup-radix.h |   6 +
 arch/powerpc/kernel/entry_64.S                | 475 ++++--------------
 arch/powerpc/kernel/exceptions-64s.S          |  55 +-
 arch/powerpc/kernel/syscall_64.c              | 147 +++++-
 arch/powerpc/kernel/vector.S                  |   2 +-
 5 files changed, 288 insertions(+), 397 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
index ef2e65ea8a73..62ff2509cf51 100644
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
 #ifdef CONFIG_PPC_KUAP_DEBUG
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index d2efd1a96487..f1e973789a2a 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -16,6 +16,7 @@
 
 #include <linux/errno.h>
 #include <linux/err.h>
+#include <asm/cache.h>
 #include <asm/unistd.h>
 #include <asm/processor.h>
 #include <asm/page.h>
@@ -130,9 +131,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
 	mtspr	SPRN_SRR0,r4
 	mtspr	SPRN_SRR1,r5
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	std	r5,PACATMSCRATCH(r13)
-#endif
 	mtlr	r6
 
 	cmpdi	r3,0
@@ -197,6 +195,7 @@ tabort_syscall:
 	RFI_TO_USER
 	b	.	/* prevent speculative execution */
 #endif
+
 _GLOBAL(ret_from_fork)
 	bl	schedule_tail
 	REST_NVGPRS(r1)
@@ -436,409 +435,149 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
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
+_GLOBAL(fast_interrupt_return)
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
+_GLOBAL(interrupt_return)
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
+_GLOBAL(interrupt_return_lite)
+	ld	r4,_MSR(r1)
+	andi.	r0,r4,MSR_PR
+	beq	kernel_interrupt_return
+user_interrupt_return:
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
-#ifdef CONFIG_PREEMPT
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
-#endif /* CONFIG_PREEMPT */
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
+kernel_interrupt_return:
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
-	ld	r4,_CTR(r1)
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
+	ld	r3,_CCR(r1)
+	ld	r4,_LINK(r1)
+	ld	r5,_CTR(r1)
+	ld	r6,_XER(r1)
+	li	r0,0
 
-	/*
-	 * Clear RI before restoring r13.  If we are returning to
-	 * userspace and we take an exception after restoring r13,
-	 * we end up corrupting the userspace r13 value.
-	 */
-	li	r4,0
-	mtmsrd	r4,1
+	REST_4GPRS(7, r1)
+	REST_2GPRS(11, r1)
 
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
+	bne-	cr1,1f /* emulate stack store */
+	mtcr	r3
+	mtlr	r4
+	mtctr	r5
+	mtspr	SPRN_XER,r6
 
 	/*
-	 * We don't need to restore AMR on the way back to userspace for KUAP.
-	 * The value of AMR only matters while we're in the kernel.
+	 * Leaving a stale exception_marker on the stack can confuse
+	 * the reliable stack unwinder later on. Clear it.
 	 */
-	mtspr	SPRN_SRR1,r3
+	std	r0,STACK_FRAME_OVERHEAD-16(r1)
 
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
+	REST_4GPRS(2, r1)
+	REST_GPR(6, r1)
+	REST_GPR(0, r1)
+	REST_GPR(1, r1)
+	RFI_TO_KERNEL
 	b	.	/* prevent speculative execution */
 
-1:	mtspr	SPRN_SRR1,r3
-
-	ld	r2,_CCR(r1)
-	mtcrf	0xFF,r2
-	ld	r2,_NIP(r1)
-	mtspr	SPRN_SRR0,r2
+1:	mtcr	r3
+	mtlr	r4
+	mtctr	r5
+	mtspr	SPRN_XER,r6
 
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
+	REST_GPR(6, r1)
+	REST_GPR(0, r1)
 
-	kuap_restore_amr r4
+	/* Nasty emulate stack store case. */
+	std	r9,PACA_EXGEN+0(r13)
+	addi	r9,r1,INT_FRAME_SIZE /* get original r1 */
+	REST_GPR(1, r1)
+	std	r9,0(r1)
+	ld	r9,PACA_EXGEN+0(r13)
 
-	ld	r4,GPR4(r1)
-	ld	r1,GPR1(r1)
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
-
-
 #ifdef CONFIG_PPC_RTAS
 /*
  * On CHRP, the Run-Time Abstraction Services (RTAS) have to be
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 768f133de4f1..51223299d22d 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -696,7 +696,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 	RECONCILE_IRQ_STATE(r10, r11);					\
 	addi	r3,r1,STACK_FRAME_OVERHEAD;				\
 	bl	hdlr;							\
-	b	ret_from_except
+	b	interrupt_return	
 
 /*
  * Like EXC_COMMON, but for exceptions that can occur in the idle task and
@@ -706,11 +706,12 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 	EXC_COMMON_BEGIN(name);						\
 	EXCEPTION_COMMON(PACA_EXGEN, realvec);				\
 	FINISH_NAP;							\
+	bl	save_nvgprs;						\
 	RECONCILE_IRQ_STATE(r10, r11);					\
 	RUNLATCH_ON;							\
 	addi	r3,r1,STACK_FRAME_OVERHEAD;				\
 	bl	hdlr;							\
-	b	ret_from_except_lite
+	b	interrupt_return	
 
 
 /*
@@ -1058,7 +1059,7 @@ EXC_COMMON_BEGIN(machine_check_common)
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_exception
-	b	ret_from_except
+	b	interrupt_return
 
 #define MACHINE_CHECK_HANDLER_WINDUP			\
 	/* Clear MSR_RI before setting SRR0 and SRR1. */\
@@ -1301,7 +1302,7 @@ BEGIN_MMU_FTR_SECTION
 	bl	do_slb_fault
 	cmpdi	r3,0
 	bne-	1f
-	b	fast_exception_return
+	b	fast_interrupt_return
 1:	/* Error case */
 MMU_FTR_SECTION_ELSE
 	/* Radix case, access is outside page table range */
@@ -1314,7 +1315,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	ld	r5,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
-	b	ret_from_except
+	b	interrupt_return
 
 
 EXC_REAL(instruction_access, 0x400, 0x80)
@@ -1350,7 +1351,7 @@ BEGIN_MMU_FTR_SECTION
 	bl	do_slb_fault
 	cmpdi	r3,0
 	bne-	1f
-	b	fast_exception_return
+	b	fast_interrupt_return
 1:	/* Error case */
 MMU_FTR_SECTION_ELSE
 	/* Radix case, access is outside page table range */
@@ -1363,7 +1364,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	ld	r5,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
-	b	ret_from_except
+	b	interrupt_return
 
 
 EXC_REAL_BEGIN(hardware_interrupt, 0x500, 0x100)
@@ -1416,7 +1417,7 @@ EXC_COMMON_BEGIN(alignment_common)
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	alignment_exception
-	b	ret_from_except
+	b	interrupt_return
 
 
 EXC_REAL(program_check, 0x700, 0x100)
@@ -1454,7 +1455,7 @@ EXC_COMMON_BEGIN(program_check_common)
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	program_check_exception
-	b	ret_from_except
+	b	interrupt_return
 
 
 EXC_REAL(fp_unavailable, 0x800, 0x100)
@@ -1479,14 +1480,14 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_TM)
 #endif
 	bl	load_up_fpu
-	b	fast_exception_return
+	b	fast_interrupt_return
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
 	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	fp_unavailable_tm
-	b	ret_from_except
+	b	interrupt_return
 #endif
 
 
@@ -1676,7 +1677,7 @@ BEGIN_MMU_FTR_SECTION
 MMU_FTR_SECTION_ELSE
 	bl      unknown_exception
 ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_TYPE_RADIX)
-	b       ret_from_except
+	b       interrupt_return
 
 
 EXC_REAL_OOL_HV(h_instr_storage, 0xe20, 0x20)
@@ -1744,7 +1745,7 @@ EXC_COMMON_BEGIN(hmi_exception_common)
 	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	handle_hmi_exception
-	b	ret_from_except
+	b	interrupt_return
 
 EXC_REAL_OOL_MASKABLE_HV(h_doorbell, 0xe80, 0x20, IRQS_DISABLED)
 EXC_VIRT_OOL_MASKABLE_HV(h_doorbell, 0x4e80, 0x20, 0xe80, IRQS_DISABLED)
@@ -1792,14 +1793,14 @@ BEGIN_FTR_SECTION
   END_FTR_SECTION_NESTED(CPU_FTR_TM, CPU_FTR_TM, 69)
 #endif
 	bl	load_up_altivec
-	b	fast_exception_return
+	b	fast_interrupt_return
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
 	bl	save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	altivec_unavailable_tm
-	b	ret_from_except
+	b	interrupt_return
 #endif
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
@@ -1808,7 +1809,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	altivec_unavailable_exception
-	b	ret_from_except
+	b	interrupt_return
 
 
 EXC_REAL_OOL(vsx_unavailable, 0xf40, 0x20)
@@ -1835,7 +1836,7 @@ BEGIN_FTR_SECTION
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	vsx_unavailable_tm
-	b	ret_from_except
+	b	interrupt_return
 #endif
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_VSX)
@@ -1844,7 +1845,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	vsx_unavailable_exception
-	b	ret_from_except
+	b	interrupt_return
 
 
 EXC_REAL_OOL(facility_unavailable, 0xf60, 0x20)
@@ -2046,7 +2047,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	soft_nmi_interrupt
-	b	ret_from_except
+	b	interrupt_return
 
 #else /* CONFIG_PPC_WATCHDOG */
 #define MASKED_DEC_HANDLER_LABEL 2f /* normal return */
@@ -2329,7 +2330,7 @@ do_hash_page:
         cmpdi	r3,0			/* see if __hash_page succeeded */
 
 	/* Success */
-	beq	fast_exc_return_irq	/* Return from exception on success */
+	beq	interrupt_return_lite	/* Return from exception on success */
 
 	/* Error */
 	blt-	13f
@@ -2344,16 +2345,16 @@ handle_page_fault:
 	bne-    handle_dabr_fault
 	ld	r4,_DAR(r1)
 	ld	r5,_DSISR(r1)
+	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_page_fault
 	cmpdi	r3,0
-	beq+	ret_from_except_lite
-	bl	save_nvgprs
+	beq+	interrupt_return_lite
 	mr	r5,r3
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	lwz	r4,_DAR(r1)
 	bl	bad_page_fault
-	b	ret_from_except
+	b	interrupt_return
 
 /* We have a data breakpoint exception - handle it */
 handle_dabr_fault:
@@ -2365,9 +2366,9 @@ handle_dabr_fault:
 	/*
 	 * do_break() may have changed the NV GPRS while handling a breakpoint.
 	 * If so, we need to restore them with their updated values. Don't use
-	 * ret_from_except_lite here.
+	 * interrupt_return_lite here.
 	 */
-	b       ret_from_except
+	b       interrupt_return
 
 
 #ifdef CONFIG_PPC_BOOK3S_64
@@ -2379,7 +2380,7 @@ handle_dabr_fault:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r4,_DAR(r1)
 	bl	low_hash_fault
-	b	ret_from_except
+	b	interrupt_return
 #endif
 
 /*
@@ -2394,7 +2395,7 @@ handle_dabr_fault:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	li	r5,SIGSEGV
 	bl	bad_page_fault
-	b	ret_from_except
+	b	interrupt_return
 
 /*
  * When doorbell is triggered from system reset wakeup, the message is
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index d42519b86ddd..1e7c3e47a8b8 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -161,13 +161,17 @@ unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs)
 		__mtmsrd(MSR_RI, 1);
 		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 		local_irq_enable();
-		/* Took an interrupt which may have more exit work to do. */
+		/* Took an interrupt, may have more exit work to do. */
 		goto again;
 	}
 	trace_hardirqs_on();
 	local_paca->irq_happened &= ~PACA_IRQ_HARD_DIS;
 	irq_soft_mask_set(IRQS_ENABLED);
 
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	local_paca->tm_scratch = regs->msr;
+#endif
+
 	kuap_check_amr();
 
 	account_cpu_user_exit();
@@ -175,3 +179,144 @@ unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs)
 	return ret;
 }
 
+unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr)
+{
+#ifdef CONFIG_PPC_BOOK3E
+	struct thread_struct *ts = &current->thread;
+#endif
+	unsigned long *ti_flagsp = &current_thread_info()->flags;
+	unsigned long ti_flags;
+	unsigned long flags;
+	unsigned long ret = 0;
+
+	BUG_ON(!FULL_REGS(regs));
+	BUG_ON(!(regs->msr & MSR_RI));
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
+#ifdef CONFIG_PPC_BOOK3S
+	if (IS_ENABLED(CONFIG_PPC_FPU)) {
+		unsigned long mathflags = MSR_FP;
+
+		if (IS_ENABLED(CONFIG_ALTIVEC))
+			mathflags |= MSR_VEC;
+
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+		if (ti_flags & _TIF_RESTORE_TM)
+			restore_tm_state(regs);
+		else
+#endif
+		if ((regs->msr & mathflags) != mathflags)
+			restore_math(regs);
+	}
+#endif
+
+	__mtmsrd(0, 1);	/* Disable MSR_EE and MSR_RI */
+	if (unlikely(lazy_irq_pending())) {
+		__mtmsrd(MSR_RI, 1);
+		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+		local_irq_enable();
+		local_irq_disable();
+		/* Took an interrupt, may have more exit work to do. */
+		goto again;
+	}
+	trace_hardirqs_on();
+	local_paca->irq_happened &= ~PACA_IRQ_HARD_DIS;
+	irq_soft_mask_set(IRQS_ENABLED);
+
+#ifdef CONFIG_PPC_BOOK3E
+	if (unlikely(ts->debug.debug.dbcr0 & DBCR0_IDM)) {
+		/*
+		 * Check to see if the dbcr0 register is set up to debug.
+		 * Use the internal debug mode bit to do this.
+		 */
+		mtmsr(mfmsr() & ~MSR_DE);
+		mtspr(SPRN_DBCR0, ts->debug.debug.dbcr0);
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
+
+unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr)
+{
+	unsigned long *ti_flagsp = &current_thread_info()->flags;
+	unsigned long flags;
+
+	BUG_ON(!FULL_REGS(regs));
+	local_irq_save(flags);
+
+	if (unlikely(!(regs->msr & MSR_RI)))
+		unrecoverable_exception(regs);
+
+again:
+	if (IS_ENABLED(CONFIG_PREEMPT)) {
+		/* Return to preemptible kernel context */
+		if (unlikely(*ti_flagsp & _TIF_NEED_RESCHED)) {
+			if (preempt_count() == 0 && regs->softe == IRQS_ENABLED)
+				preempt_schedule_irq();
+		}
+	}
+
+	__mtmsrd(0, 1);	/* Disable MSR_EE and MSR_RI */
+	if (regs->softe == IRQS_ENABLED) {
+		if (unlikely(lazy_irq_pending())) {
+			__mtmsrd(MSR_RI, 1);
+			local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+			local_irq_enable();
+			local_irq_disable();
+			/* Took an interrupt, may have more exit work to do. */
+			goto again;
+		}
+		trace_hardirqs_on();
+		irq_soft_mask_set(IRQS_ENABLED);
+	}
+	if (regs->msr & MSR_EE)
+		local_paca->irq_happened &= ~PACA_IRQ_HARD_DIS;
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
+
diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
index 8eb867dbad5f..44e7a776e56f 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -131,7 +131,7 @@ _GLOBAL(load_up_vsx)
 	/* enable use of VSX after return */
 	oris	r12,r12,MSR_VSX@h
 	std	r12,_MSR(r1)
-	b	fast_exception_return
+	b	fast_interrupt_return
 
 #endif /* CONFIG_VSX */
 
-- 
2.22.0

