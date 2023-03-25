Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4C46C8E5F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 14:07:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkKBG1rH7z3fVC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Mar 2023 00:07:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pM8pLWLC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pM8pLWLC;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkK9L6grKz3cFP
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Mar 2023 00:07:00 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id p3-20020a17090a74c300b0023f69bc7a68so4092597pjl.4
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 06:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679749619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5mQBOs0LDRqf1IVto7WLIMIOan1dKucI2FMc3UKc+Xs=;
        b=pM8pLWLCFHwStpjn32Rx6IBp81f22oTpe++KHWjUW1dwxnHkJbKFaMjS+jS5b6Q2rM
         2Ukp9Ee66AxUQkTUunHXuQ78zURBiDtbLRZGymAFfqFxvFu2P4MqFiAcyocbhy1e6cb1
         qI5IjL2CW3JDX2kdF0plnLmZyC+Jt6jxNychEYuPHC9fK9Fgx1BK33x9vlg4Gh5CKHLE
         Xu59Ra8G9xqiOt6EcDUKdfWsci11qkPMNxubOHdtAWZsNIJhCXvafawjeMSUbr+aB+ue
         S/C49APLvivAspSL6nB/HJWoBrjStHRg2JMA84GqR4tvAvEoH8fXzQwDm9bFlONhe+2D
         ui+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679749619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mQBOs0LDRqf1IVto7WLIMIOan1dKucI2FMc3UKc+Xs=;
        b=3N66lGQAQ6QCfpybdCtZnJfdGqbRVN2z8CVHjA9CbkTCG9YCRFYijqquc6fhmo2lQf
         SnVkEDacVM/S/ZOsEtiK/T9o9W56YE1g8zcjtMJAmsRUPRDg1c7YzNVhFfwIH6lg1uo4
         Pn61v1+XAw6kRhRYiONLlTUl1UQW9x0jNR+tYS3CwLbjTDXShHROpwP62GXgN562mlEk
         23r16ZQPvCDll0eo7vW5Dt3KT6svoFy5qaL+McndVtlQHuPf2w6VEIcwUiywHMFg/IVL
         UZAHow/8NObnq8R7FRrlnuuGZGcewtI3rtXQ5S+8wrCx1W9WfLKJTm+osALOOcYArs3k
         MGag==
X-Gm-Message-State: AAQBX9e1TvU0zqWc2ts/NgOMANX8glpDLzcsXbGxzfEWncGNIdi7U+SL
	TEYFw1RLRwrvpMsQXyWPoCOI4hptNrQ=
X-Google-Smtp-Source: AKy350agWfnvtUCY2kpLwrVv8vOZwpqHSpcN/HvYUfc4IUOFbLB8slXCbrKd7nwWk48pMzwIKNE/Qg==
X-Received: by 2002:a17:90a:2ca6:b0:23b:5537:8c99 with SMTP id n35-20020a17090a2ca600b0023b55378c99mr6211817pjd.45.1679749618696;
        Sat, 25 Mar 2023 06:06:58 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.191])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090aa79600b002311dbb2bc5sm1470130pjq.45.2023.03.25.06.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 06:06:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH 1/2] powerpc: merge 32-bit and 64-bit _switch implementation
Date: Sat, 25 Mar 2023 23:06:50 +1000
Message-Id: <20230325130651.2457266-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The _switch stack frame setup are substantially the same, so are the
comments. The difference in how the stack and current are switched,
and other hardware and software housekeeping is done is moved into
macros.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
These patches are mostly just shuffling code around. Better? Worse?

Thanks,
Nick

 arch/powerpc/kernel/Makefile   |   2 +-
 arch/powerpc/kernel/entry_32.S |  57 --------
 arch/powerpc/kernel/entry_64.S | 220 ----------------------------
 arch/powerpc/kernel/switch.S   | 260 +++++++++++++++++++++++++++++++++
 4 files changed, 261 insertions(+), 278 deletions(-)
 create mode 100644 arch/powerpc/kernel/switch.S

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
index 5604c9a1ac22..b57994c5290b 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -197,63 +197,6 @@ ret_from_kernel_thread:
 	li	r3,0
 	b	ret_from_syscall
 
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
-	/* r3-r12 are caller saved -- Cort */
-	SAVE_NVGPRS(r1)
-	stw	r0,_NIP(r1)	/* Return to switch caller */
-	mfcr	r10
-	stw	r10,_CCR(r1)
-	stw	r1,KSP(r3)	/* Set old stack pointer */
-
-#ifdef CONFIG_SMP
-	/* We need a sync somewhere here to make sure that if the
-	 * previous task gets rescheduled on another CPU, it sees all
-	 * stores it has performed on this one.
-	 */
-	sync
-#endif /* CONFIG_SMP */
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
-	lwz	r4,_NIP(r1)	/* Return to _switch caller in new task */
-	mtlr	r4
-	addi	r1,r1,SWITCH_FRAME_SIZE
-	blr
-
 	.globl	fast_exception_return
 fast_exception_return:
 #if !(defined(CONFIG_4xx) || defined(CONFIG_BOOKE))
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 1bf1121e17f1..f3d3885ee9fd 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -14,7 +14,6 @@
  *  code, and exception/interrupt return code for PowerPC.
  */
 
-#include <linux/objtool.h>
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <asm/cache.h>
@@ -45,227 +44,8 @@
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
-	/* r3-r13 are caller saved -- Cort */
-	SAVE_NVGPRS(r1)
-	std	r0,_NIP(r1)	/* Return to switch caller */
-	mfcr	r23
-	std	r23,_CCR(r1)
-	std	r1,KSP(r3)	/* Set old stack pointer */
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
-	addi	r6,r4,-THREAD	/* Convert THREAD to 'current' */
-	std	r6,PACACURRENT(r13)	/* Set new 'current' */
-#if defined(CONFIG_STACKPROTECTOR)
-	ld	r6, TASK_CANARY(r6)
-	std	r6, PACA_CANARY(r13)
-#endif
-
-	ld	r8,KSP(r4)	/* new stack pointer */
-#ifdef CONFIG_PPC_64S_HASH_MMU
-BEGIN_MMU_FTR_SECTION
-	b	2f
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
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
-2:
-#endif /* CONFIG_PPC_64S_HASH_MMU */
-
-	clrrdi	r7, r8, THREAD_SHIFT	/* base of new stack */
-	/* Note: this uses SWITCH_FRAME_SIZE rather than INT_FRAME_SIZE
-	   because we don't need to leave the 288-byte ABI gap at the
-	   top of the kernel stack. */
-	addi	r7,r7,THREAD_SIZE-SWITCH_FRAME_SIZE
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
-	std	r7,PACAKSAVE(r13)
-
-	ld	r6,_CCR(r1)
-	mtcrf	0xFF,r6
-
-	/* r3-r13 are destroyed -- Cort */
-	REST_NVGPRS(r1)
-
-	/* convert old thread to its task_struct for return value */
-	addi	r3,r3,-THREAD
-	ld	r7,_NIP(r1)	/* Return to _switch caller in new task */
-	mtlr	r7
-	addi	r1,r1,SWITCH_FRAME_SIZE
-	blr
-
 _GLOBAL(enter_prom)
 	mflr	r0
 	std	r0,16(r1)
diff --git a/arch/powerpc/kernel/switch.S b/arch/powerpc/kernel/switch.S
new file mode 100644
index 000000000000..064366060a2e
--- /dev/null
+++ b/arch/powerpc/kernel/switch.S
@@ -0,0 +1,260 @@
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
+ * do_switch_32/64 is invoked with r4 set to 'next' and results in r3 being
+ * set to prev. It switches the stack, current, and does other task switch
+ * housekeeping.
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
+	ld	r8,KSP(r4)	/* new stack pointer */
+
+	kuap_check_amr r9, r10
+
+	FLUSH_COUNT_CACHE	/* Clobbers r9, ctr */
+
+	STOP_STREAMS		/* Clobbers r6 */
+
+	/* convert old thread to its task_struct for return value */
+	addi	r3,r3,-THREAD
+	addi	r6,r4,-THREAD	/* Convert THREAD to 'current' */
+	std	r6,PACACURRENT(r13)	/* Set new 'current' */
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
+ * Note: this uses SWITCH_FRAME_SIZE rather than INT_FRAME_SIZE
+ * because we don't need to leave the 288-byte ABI gap at the
+ * top of the kernel stack.
+ */
+_GLOBAL(_switch)
+	mflr		r0
+	PPC_STL		r0,LRSAVE(r1)
+	PPC_STLU	r1,-SWITCH_FRAME_SIZE(r1)
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
2.37.2

