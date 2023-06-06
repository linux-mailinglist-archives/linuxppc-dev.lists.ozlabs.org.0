Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E026A72446E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 15:29:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbBCt4xTmz3fbT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 23:29:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZyKThGJP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZyKThGJP;
	dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbB6d0Kvxz3ds2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 23:25:12 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b2439e9004so958265ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 06:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686057910; x=1688649910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4V/AL3SJp1Ly035JDAjkp95F+vVWcH1kq4iF+He2FQ=;
        b=ZyKThGJPc2X8TVRNpmoxoEPQ0cHrK+jPHYJUMqSA6K/icCWRr8EleyvwWI2ELY1fly
         bmA8bzVZAD18V59AxO9M8GR+07RnZOmQx+ARFzWxdDvawoGOET2aYHEN65dZHfJ+NK6e
         64SG/Uk0AJe1Pyxj7OxwLahXOhW0BjhBBtcUe8THtE1nzS+uawsq/g/pAf84SYrvPaIL
         YuYYEfeCTo8GrT44tH3bbycl/EqneNRtWuHz8W8c1GCPRI4ihjhKL4VSGCLfW+uX1QaB
         n7osZbzJ1XmFZeYtwqAYbLNeyhnbRXeD7MfeDHCeylCHaqYgGvAnYeBbeiO55WrfOW+H
         zIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686057910; x=1688649910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4V/AL3SJp1Ly035JDAjkp95F+vVWcH1kq4iF+He2FQ=;
        b=UQv7DDyfClXVhCc5KyaBS1o7Cj8waVKw1UX7YGslXqpbD75edjEjJW3dT5O1KgMZSv
         VEWfDq/Ib2yIbsiPrq1+Fdsf12Uj6g8Z6AF1JSyc2v/76Gwbd+zKS5LQcvPX3YPDs3uy
         atkjW6THUOR72aTN1MY3pY7vH8m5amnwUm2AhXWFxfEfCWm1k3QFMeC8IcXSibXpfd3x
         UB+60Go7sWyPlayWiiV6JyIovFjW6zlNGWP/qOBikC8dsJkX6sYjErb+lRRhDDmp+oYQ
         051BYrEk/dDpQi1xLvB+legmeqUE++vCHC9a85ICBoRuyPWQbAj98pOiA1v55DFAC0Zl
         ikqQ==
X-Gm-Message-State: AC+VfDwiFB/yVf6JyCP6+AgYYM5uyzW4swaEFJILaLyfAipnsMtFkCRE
	uYK8j+nPcuVpUuldHn/Ia8lRoDv8I98=
X-Google-Smtp-Source: ACHHUZ4/am5XdIBh7rLp3IO+f9pkHZO2yLFaprK/2Sb5QyOxdpeCx6ryno0ToWKdxY4JjDskbYZaPQ==
X-Received: by 2002:a17:902:e807:b0:1b1:714a:335b with SMTP id u7-20020a170902e80700b001b1714a335bmr963510plg.6.1686057909986;
        Tue, 06 Jun 2023 06:25:09 -0700 (PDT)
Received: from wheely.local0.net (58-6-230-127.tpgi.com.au. [58.6.230.127])
        by smtp.gmail.com with ESMTPSA id jd18-20020a170903261200b001ac2c3e54adsm8522132plb.118.2023.06.06.06.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:25:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 5/6] powerpc: merge 32-bit and 64-bit _switch implementation
Date: Tue,  6 Jun 2023 23:24:46 +1000
Message-Id: <20230606132447.315714-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606132447.315714-1-npiggin@gmail.com>
References: <20230606132447.315714-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The _switch stack frame setup are substantially the same, so are the
comments. The difference in how the stack and current are switched,
and other hardware and software housekeeping is done is moved into
macros.

Generated code should be unchanged.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ppc_asm.h |  14 ++
 arch/powerpc/kernel/Makefile       |   2 +-
 arch/powerpc/kernel/entry_32.S     |  52 ------
 arch/powerpc/kernel/entry_64.S     | 229 -------------------------
 arch/powerpc/kernel/switch.S       | 258 +++++++++++++++++++++++++++++
 5 files changed, 273 insertions(+), 282 deletions(-)
 create mode 100644 arch/powerpc/kernel/switch.S

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 5f05a984b103..e7792aa13510 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -406,6 +406,15 @@ GLUE(.,name):
 /* offsets for stack frame layout */
 #define LRSAVE	16
 
+/*
+ * GCC stack frames follow a different pattern on 32 vs 64. This can be used
+ * to make asm frames be consistent with C.
+ */
+#define PPC_CREATE_STACK_FRAME(size)			\
+	mflr		r0;				\
+	std		r0,16(r1);			\
+	stdu		r1,-(size)(r1)
+
 #else /* 32-bit */
 
 #define LOAD_REG_IMMEDIATE(reg, expr) __LOAD_REG_IMMEDIATE_32 reg, expr
@@ -422,6 +431,11 @@ GLUE(.,name):
 /* offsets for stack frame layout */
 #define LRSAVE	4
 
+#define PPC_CREATE_STACK_FRAME(size)			\
+	stwu		r1,-(size)(r1);			\
+	mflr		r0;				\
+	stw		r0,(size+4)(r1)
+
 #endif
 
 /* various errata or part fixups */
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 9bf2be123093..ec70a1748506 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -68,7 +68,7 @@ CFLAGS_REMOVE_syscall.o = -fstack-protector -fstack-protector-strong
 CFLAGS_syscall.o += -fno-stack-protector
 #endif
 
-obj-y				:= cputable.o syscalls.o \
+obj-y				:= cputable.o syscalls.o switch.o \
 				   irq.o align.o signal_$(BITS).o pmc.o vdso.o \
 				   process.o systbl.o idle.o \
 				   signal.o sysfs.o cacheinfo.o time.o \
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 2d17b14bb9e5..fe27d41f9a3d 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -211,58 +211,6 @@ start_kernel_thread:
 100:	trap
 	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,0
 
-
-/*
- * This routine switches between two different tasks.  The process
- * state of one is saved on its kernel stack.  Then the state
- * of the other is restored from its kernel stack.  The memory
- * management hardware is updated to the second process's state.
- * Finally, we can return to the second process.
- * On entry, r3 points to the THREAD for the current task, r4
- * points to the THREAD for the new task.
- *
- * This routine is always called with interrupts disabled.
- *
- * Note: there are two ways to get to the "going out" portion
- * of this code; either by coming in via the entry (_switch)
- * or via "fork" which must set up an environment equivalent
- * to the "_switch" path.  If you change this , you'll have to
- * change the fork code also.
- *
- * The code which creates the new task context is in 'copy_thread'
- * in arch/ppc/kernel/process.c
- */
-_GLOBAL(_switch)
-	stwu	r1,-SWITCH_FRAME_SIZE(r1)
-	mflr	r0
-	stw	r0,SWITCH_FRAME_SIZE+4(r1)
-	stw	r1,KSP(r3)	/* Set old stack pointer */
-	/* r3-r12 are caller saved -- Cort */
-	SAVE_NVGPRS(r1)
-	stw	r0,_NIP(r1)	/* Return to switch caller */
-	mfcr	r0
-	stw	r0,_CCR(r1)
-
-	/* The sync for SMP migration is taken care of, see entry_64.S */
-
-	tophys(r0,r4)
-	mtspr	SPRN_SPRG_THREAD,r0	/* Update current THREAD phys addr */
-	lwz	r1,KSP(r4)	/* Load new stack pointer */
-
-	/* save the old current 'last' for return value */
-	mr	r3,r2
-	addi	r2,r4,-THREAD	/* Update current */
-
-	lwz	r0,_CCR(r1)
-	mtcrf	0xFF,r0
-	/* r3-r12 are destroyed -- Cort */
-	REST_NVGPRS(r1)
-
-	lwz	r0,_NIP(r1)	/* Return to _switch caller in new task */
-	mtlr	r0
-	addi	r1,r1,SWITCH_FRAME_SIZE
-	blr
-
 	.globl	fast_exception_return
 fast_exception_return:
 #if !(defined(CONFIG_4xx) || defined(CONFIG_BOOKE))
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 7430bd020a2a..f3d3885ee9fd 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -14,7 +14,6 @@
  *  code, and exception/interrupt return code for PowerPC.
  */
 
-#include <linux/objtool.h>
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <asm/cache.h>
@@ -45,236 +44,8 @@
 #include <asm/feature-fixups.h>
 #include <asm/kup.h>
 
-/*
- * System calls.
- */
 	.section	".text"
 
-#ifdef CONFIG_PPC_BOOK3S_64
-
-#define FLUSH_COUNT_CACHE	\
-1:	nop;			\
-	patch_site 1b, patch__call_flush_branch_caches1; \
-1:	nop;			\
-	patch_site 1b, patch__call_flush_branch_caches2; \
-1:	nop;			\
-	patch_site 1b, patch__call_flush_branch_caches3
-
-.macro nops number
-	.rept \number
-	nop
-	.endr
-.endm
-
-.balign 32
-.global flush_branch_caches
-flush_branch_caches:
-	/* Save LR into r9 */
-	mflr	r9
-
-	// Flush the link stack
-	.rept 64
-	ANNOTATE_INTRA_FUNCTION_CALL
-	bl	.+4
-	.endr
-	b	1f
-	nops	6
-
-	.balign 32
-	/* Restore LR */
-1:	mtlr	r9
-
-	// If we're just flushing the link stack, return here
-3:	nop
-	patch_site 3b patch__flush_link_stack_return
-
-	li	r9,0x7fff
-	mtctr	r9
-
-	PPC_BCCTR_FLUSH
-
-2:	nop
-	patch_site 2b patch__flush_count_cache_return
-
-	nops	3
-
-	.rept 278
-	.balign 32
-	PPC_BCCTR_FLUSH
-	nops	7
-	.endr
-
-	blr
-
-#ifdef CONFIG_PPC_64S_HASH_MMU
-.balign 32
-/*
- * New stack pointer in r8, old stack pointer in r1, must not clobber r3
- */
-pin_stack_slb:
-BEGIN_FTR_SECTION
-	clrrdi	r6,r8,28	/* get its ESID */
-	clrrdi	r9,r1,28	/* get current sp ESID */
-FTR_SECTION_ELSE
-	clrrdi	r6,r8,40	/* get its 1T ESID */
-	clrrdi	r9,r1,40	/* get current sp 1T ESID */
-ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_1T_SEGMENT)
-	clrldi.	r0,r6,2		/* is new ESID c00000000? */
-	cmpd	cr1,r6,r9	/* or is new ESID the same as current ESID? */
-	cror	eq,4*cr1+eq,eq
-	beq	2f		/* if yes, don't slbie it */
-
-	/* Bolt in the new stack SLB entry */
-	ld	r7,KSP_VSID(r4)	/* Get new stack's VSID */
-	oris	r0,r6,(SLB_ESID_V)@h
-	ori	r0,r0,(SLB_NUM_BOLTED-1)@l
-BEGIN_FTR_SECTION
-	li	r9,MMU_SEGSIZE_1T	/* insert B field */
-	oris	r6,r6,(MMU_SEGSIZE_1T << SLBIE_SSIZE_SHIFT)@h
-	rldimi	r7,r9,SLB_VSID_SSIZE_SHIFT,0
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_1T_SEGMENT)
-
-	/* Update the last bolted SLB.  No write barriers are needed
-	 * here, provided we only update the current CPU's SLB shadow
-	 * buffer.
-	 */
-	ld	r9,PACA_SLBSHADOWPTR(r13)
-	li	r12,0
-	std	r12,SLBSHADOW_STACKESID(r9)	/* Clear ESID */
-	li	r12,SLBSHADOW_STACKVSID
-	STDX_BE	r7,r12,r9			/* Save VSID */
-	li	r12,SLBSHADOW_STACKESID
-	STDX_BE	r0,r12,r9			/* Save ESID */
-
-	/* No need to check for MMU_FTR_NO_SLBIE_B here, since when
-	 * we have 1TB segments, the only CPUs known to have the errata
-	 * only support less than 1TB of system memory and we'll never
-	 * actually hit this code path.
-	 */
-
-	isync
-	slbie	r6
-BEGIN_FTR_SECTION
-	slbie	r6		/* Workaround POWER5 < DD2.1 issue */
-END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
-	slbmte	r7,r0
-	isync
-2:	blr
-	.size pin_stack_slb,.-pin_stack_slb
-#endif /* CONFIG_PPC_64S_HASH_MMU */
-
-#else
-#define FLUSH_COUNT_CACHE
-#endif /* CONFIG_PPC_BOOK3S_64 */
-
-/*
- * This routine switches between two different tasks.  The process
- * state of one is saved on its kernel stack.  Then the state
- * of the other is restored from its kernel stack.  The memory
- * management hardware is updated to the second process's state.
- * Finally, we can return to the second process, via interrupt_return.
- * On entry, r3 points to the THREAD for the current task, r4
- * points to the THREAD for the new task.
- *
- * Note: there are two ways to get to the "going out" portion
- * of this code; either by coming in via the entry (_switch)
- * or via "fork" which must set up an environment equivalent
- * to the "_switch" path.  If you change this you'll have to change
- * the fork code also.
- *
- * The code which creates the new task context is in 'copy_thread'
- * in arch/powerpc/kernel/process.c 
- */
-	.align	7
-_GLOBAL(_switch)
-	mflr	r0
-	std	r0,16(r1)
-	stdu	r1,-SWITCH_FRAME_SIZE(r1)
-	std	r1,KSP(r3)	/* Set old stack pointer */
-	/* r3-r13 are caller saved -- Cort */
-	SAVE_NVGPRS(r1)
-	std	r0,_NIP(r1)	/* Return to switch caller */
-	mfcr	r0
-	stw	r0,_CCR(r1)
-	ld	r8,KSP(r4)	/* Load new stack pointer */
-
-	kuap_check_amr r9, r10
-
-	FLUSH_COUNT_CACHE	/* Clobbers r9, ctr */
-
-	/*
-	 * On SMP kernels, care must be taken because a task may be
-	 * scheduled off CPUx and on to CPUy. Memory ordering must be
-	 * considered.
-	 *
-	 * Cacheable stores on CPUx will be visible when the task is
-	 * scheduled on CPUy by virtue of the core scheduler barriers
-	 * (see "Notes on Program-Order guarantees on SMP systems." in
-	 * kernel/sched/core.c).
-	 *
-	 * Uncacheable stores in the case of involuntary preemption must
-	 * be taken care of. The smp_mb__after_spinlock() in __schedule()
-	 * is implemented as hwsync on powerpc, which orders MMIO too. So
-	 * long as there is an hwsync in the context switch path, it will
-	 * be executed on the source CPU after the task has performed
-	 * all MMIO ops on that CPU, and on the destination CPU before the
-	 * task performs any MMIO ops there.
-	 */
-
-	/*
-	 * The kernel context switch path must contain a spin_lock,
-	 * which contains larx/stcx, which will clear any reservation
-	 * of the task being switched.
-	 */
-#ifdef CONFIG_PPC_BOOK3S
-/* Cancel all explict user streams as they will have no use after context
- * switch and will stop the HW from creating streams itself
- */
-	DCBT_BOOK3S_STOP_ALL_STREAM_IDS(r6)
-#endif
-
-	addi	r3,r3,-THREAD	/* old thread -> task_struct for return value */
-	addi	r6,r4,-THREAD	/* new thread -> task_struct */
-	std	r6,PACACURRENT(r13)	/* Set new task_struct to 'current' */
-#if defined(CONFIG_STACKPROTECTOR)
-	ld	r6, TASK_CANARY(r6)
-	std	r6, PACA_CANARY(r13)
-#endif
-	/* Set the new PACAKSAVE */
-	clrrdi	r7, r8, THREAD_SHIFT	/* base of new stack */
-	/* Note: this uses SWITCH_FRAME_SIZE rather than INT_FRAME_SIZE
-	   because we don't need to leave the 288-byte ABI gap at the
-	   top of the kernel stack. */
-	addi	r7,r7,THREAD_SIZE-SWITCH_FRAME_SIZE
-	std	r7,PACAKSAVE(r13)
-
-#ifdef CONFIG_PPC_64S_HASH_MMU
-BEGIN_MMU_FTR_SECTION
-	bl	pin_stack_slb
-END_MMU_FTR_SECTION_IFCLR(MMU_FTR_TYPE_RADIX)
-#endif
-
-	/*
-	 * PMU interrupts in radix may come in here. They will use r1, not
-	 * PACAKSAVE, so this stack switch will not cause a problem. They
-	 * will store to the process stack, which may then be migrated to
-	 * another CPU. However the rq lock release on this CPU paired with
-	 * the rq lock acquire on the new CPU before the stack becomes
-	 * active on the new CPU, will order those stores.
-	 */
-	mr	r1,r8		/* start using new stack pointer */
-
-	lwz	r0,_CCR(r1)
-	mtcrf	0xFF,r0
-
-	/* r3-r13 are destroyed -- Cort */
-	REST_NVGPRS(r1)
-
-	ld	r0,_NIP(r1)	/* Return to _switch caller in new task */
-	mtlr	r0
-	addi	r1,r1,SWITCH_FRAME_SIZE
-	blr
-
 _GLOBAL(enter_prom)
 	mflr	r0
 	std	r0,16(r1)
diff --git a/arch/powerpc/kernel/switch.S b/arch/powerpc/kernel/switch.S
new file mode 100644
index 000000000000..150002d7729a
--- /dev/null
+++ b/arch/powerpc/kernel/switch.S
@@ -0,0 +1,258 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <linux/objtool.h>
+#include <asm/asm-offsets.h>
+#include <asm/code-patching-asm.h>
+#include <asm/kup.h>
+#include <asm/mmu.h>
+#include <asm/ppc_asm.h>
+#include <asm/thread_info.h>
+
+.section ".text","ax",@progbits
+
+#ifdef CONFIG_PPC_BOOK3S_64
+/*
+ * Cancel all explict user streams as they will have no use after context
+ * switch and will stop the HW from creating streams itself
+ */
+#define STOP_STREAMS		\
+	DCBT_BOOK3S_STOP_ALL_STREAM_IDS(r6)
+
+#define FLUSH_COUNT_CACHE	\
+1:	nop;			\
+	patch_site 1b, patch__call_flush_branch_caches1; \
+1:	nop;			\
+	patch_site 1b, patch__call_flush_branch_caches2; \
+1:	nop;			\
+	patch_site 1b, patch__call_flush_branch_caches3
+
+.macro nops number
+	.rept \number
+	nop
+	.endr
+.endm
+
+.balign 32
+.global flush_branch_caches
+flush_branch_caches:
+	/* Save LR into r9 */
+	mflr	r9
+
+	// Flush the link stack
+	.rept 64
+	ANNOTATE_INTRA_FUNCTION_CALL
+	bl	.+4
+	.endr
+	b	1f
+	nops	6
+
+	.balign 32
+	/* Restore LR */
+1:	mtlr	r9
+
+	// If we're just flushing the link stack, return here
+3:	nop
+	patch_site 3b patch__flush_link_stack_return
+
+	li	r9,0x7fff
+	mtctr	r9
+
+	PPC_BCCTR_FLUSH
+
+2:	nop
+	patch_site 2b patch__flush_count_cache_return
+
+	nops	3
+
+	.rept 278
+	.balign 32
+	PPC_BCCTR_FLUSH
+	nops	7
+	.endr
+
+	blr
+
+#ifdef CONFIG_PPC_64S_HASH_MMU
+.balign 32
+/*
+ * New stack pointer in r8, old stack pointer in r1, must not clobber r3
+ */
+pin_stack_slb:
+BEGIN_FTR_SECTION
+	clrrdi	r6,r8,28	/* get its ESID */
+	clrrdi	r9,r1,28	/* get current sp ESID */
+FTR_SECTION_ELSE
+	clrrdi	r6,r8,40	/* get its 1T ESID */
+	clrrdi	r9,r1,40	/* get current sp 1T ESID */
+ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_1T_SEGMENT)
+	clrldi.	r0,r6,2		/* is new ESID c00000000? */
+	cmpd	cr1,r6,r9	/* or is new ESID the same as current ESID? */
+	cror	eq,4*cr1+eq,eq
+	beq	2f		/* if yes, don't slbie it */
+
+	/* Bolt in the new stack SLB entry */
+	ld	r7,KSP_VSID(r4)	/* Get new stack's VSID */
+	oris	r0,r6,(SLB_ESID_V)@h
+	ori	r0,r0,(SLB_NUM_BOLTED-1)@l
+BEGIN_FTR_SECTION
+	li	r9,MMU_SEGSIZE_1T	/* insert B field */
+	oris	r6,r6,(MMU_SEGSIZE_1T << SLBIE_SSIZE_SHIFT)@h
+	rldimi	r7,r9,SLB_VSID_SSIZE_SHIFT,0
+END_MMU_FTR_SECTION_IFSET(MMU_FTR_1T_SEGMENT)
+
+	/* Update the last bolted SLB.  No write barriers are needed
+	 * here, provided we only update the current CPU's SLB shadow
+	 * buffer.
+	 */
+	ld	r9,PACA_SLBSHADOWPTR(r13)
+	li	r12,0
+	std	r12,SLBSHADOW_STACKESID(r9)	/* Clear ESID */
+	li	r12,SLBSHADOW_STACKVSID
+	STDX_BE	r7,r12,r9			/* Save VSID */
+	li	r12,SLBSHADOW_STACKESID
+	STDX_BE	r0,r12,r9			/* Save ESID */
+
+	/* No need to check for MMU_FTR_NO_SLBIE_B here, since when
+	 * we have 1TB segments, the only CPUs known to have the errata
+	 * only support less than 1TB of system memory and we'll never
+	 * actually hit this code path.
+	 */
+
+	isync
+	slbie	r6
+BEGIN_FTR_SECTION
+	slbie	r6		/* Workaround POWER5 < DD2.1 issue */
+END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
+	slbmte	r7,r0
+	isync
+2:	blr
+	.size pin_stack_slb,.-pin_stack_slb
+#endif /* CONFIG_PPC_64S_HASH_MMU */
+
+#else
+#define STOP_STREAMS
+#define FLUSH_COUNT_CACHE
+#endif /* CONFIG_PPC_BOOK3S_64 */
+
+/*
+ * do_switch_32/64 have the same calling convention as _switch, i.e., r3,r4
+ * are prev and next thread_struct *, and returns prev task_struct * in r3.
+
+ * This switches the stack, current, and does other task switch housekeeping.
+ */
+.macro do_switch_32
+	tophys(r0,r4)
+	mtspr	SPRN_SPRG_THREAD,r0	/* Update current THREAD phys addr */
+	lwz	r1,KSP(r4)	/* Load new stack pointer */
+
+	/* save the old current 'last' for return value */
+	mr	r3,r2
+	addi	r2,r4,-THREAD	/* Update current */
+.endm
+
+.macro do_switch_64
+	ld	r8,KSP(r4)	/* Load new stack pointer */
+
+	kuap_check_amr r9, r10
+
+	FLUSH_COUNT_CACHE	/* Clobbers r9, ctr */
+
+	STOP_STREAMS		/* Clobbers r6 */
+
+	addi	r3,r3,-THREAD	/* old thread -> task_struct for return value */
+	addi	r6,r4,-THREAD	/* new thread -> task_struct */
+	std	r6,PACACURRENT(r13)	/* Set new task_struct to 'current' */
+#if defined(CONFIG_STACKPROTECTOR)
+	ld	r6, TASK_CANARY(r6)
+	std	r6, PACA_CANARY(r13)
+#endif
+	/* Set new PACAKSAVE */
+	clrrdi	r7,r8,THREAD_SHIFT	/* base of new stack */
+	addi	r7,r7,THREAD_SIZE-SWITCH_FRAME_SIZE
+	std	r7,PACAKSAVE(r13)
+
+#ifdef CONFIG_PPC_64S_HASH_MMU
+BEGIN_MMU_FTR_SECTION
+	bl	pin_stack_slb
+END_MMU_FTR_SECTION_IFCLR(MMU_FTR_TYPE_RADIX)
+#endif
+	/*
+	 * PMU interrupts in radix may come in here. They will use r1, not
+	 * PACAKSAVE, so this stack switch will not cause a problem. They
+	 * will store to the process stack, which may then be migrated to
+	 * another CPU. However the rq lock release on this CPU paired with
+	 * the rq lock acquire on the new CPU before the stack becomes
+	 * active on the new CPU, will order those stores.
+	 */
+	mr	r1,r8		/* start using new stack pointer */
+.endm
+
+/*
+ * This routine switches between two different tasks.  The process
+ * state of one is saved on its kernel stack.  Then the state
+ * of the other is restored from its kernel stack.  The memory
+ * management hardware is updated to the second process's state.
+ * Finally, we can return to the second process.
+ * On entry, r3 points to the THREAD for the current task, r4
+ * points to the THREAD for the new task.
+ *
+ * This routine is always called with interrupts disabled.
+ *
+ * Note: there are two ways to get to the "going out" portion
+ * of this code; either by coming in via the entry (_switch)
+ * or via "fork" which must set up an environment equivalent
+ * to the "_switch" path.  If you change this , you'll have to
+ * change the fork code also.
+ *
+ * The code which creates the new task context is in 'copy_thread'
+ * in arch/ppc/kernel/process.c
+ *
+ * Note: this uses SWITCH_FRAME_SIZE rather than USER_INT_FRAME_SIZE
+ * because we don't need to leave the redzone ABI gap at the top of
+ * the kernel stack.
+ */
+_GLOBAL(_switch)
+	PPC_CREATE_STACK_FRAME(SWITCH_FRAME_SIZE)
+	PPC_STL		r1,KSP(r3)	/* Set old stack pointer */
+	SAVE_NVGPRS(r1)			/* volatiles are caller-saved -- Cort */
+	PPC_STL		r0,_NIP(r1)	/* Return to switch caller */
+	mfcr		r0
+	stw		r0,_CCR(r1)
+
+	/*
+	 * On SMP kernels, care must be taken because a task may be
+	 * scheduled off CPUx and on to CPUy. Memory ordering must be
+	 * considered.
+	 *
+	 * Cacheable stores on CPUx will be visible when the task is
+	 * scheduled on CPUy by virtue of the core scheduler barriers
+	 * (see "Notes on Program-Order guarantees on SMP systems." in
+	 * kernel/sched/core.c).
+	 *
+	 * Uncacheable stores in the case of involuntary preemption must
+	 * be taken care of. The smp_mb__after_spinlock() in __schedule()
+	 * is implemented as hwsync on powerpc, which orders MMIO too. So
+	 * long as there is an hwsync in the context switch path, it will
+	 * be executed on the source CPU after the task has performed
+	 * all MMIO ops on that CPU, and on the destination CPU before the
+	 * task performs any MMIO ops there.
+	 */
+
+	/*
+	 * The kernel context switch path must contain a spin_lock,
+	 * which contains larx/stcx, which will clear any reservation
+	 * of the task being switched.
+	 */
+
+#ifdef CONFIG_PPC32
+	do_switch_32
+#else
+	do_switch_64
+#endif
+
+	lwz	r0,_CCR(r1)
+	mtcrf	0xFF,r0
+	REST_NVGPRS(r1)		/* volatiles are destroyed -- Cort */
+	PPC_LL	r0,_NIP(r1)	/* Return to _switch caller in new task */
+	mtlr	r0
+	addi	r1,r1,SWITCH_FRAME_SIZE
+	blr
-- 
2.40.1

