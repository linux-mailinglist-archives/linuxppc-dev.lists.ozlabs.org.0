Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 949B6562E1B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 10:28:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZ7cn454Nz3f17
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 18:28:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=xiujianfeng@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZ7by1Tf0z3blh
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 18:27:26 +1000 (AEST)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LZ7Wp305yzTgMW;
	Fri,  1 Jul 2022 16:23:50 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 1 Jul 2022 16:27:22 +0800
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
	<npiggin@gmail.com>, <christophe.leroy@csgroup.eu>, <tglx@linutronix.de>,
	<mark.rutland@arm.com>
Subject: [PATCH -next v3 1/2] powerpc: Move system_call_exception() to syscall.c
Date: Fri, 1 Jul 2022 16:24:34 +0800
Message-ID: <20220701082435.126596-2-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220701082435.126596-1-xiujianfeng@huawei.com>
References: <20220701082435.126596-1-xiujianfeng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a lead-up patch to enable syscall stack randomization, which
uses alloca() and makes the compiler add unconditional stack canaries
on syscall entry. In order to avoid triggering needless checks and
slowing down the entry path, the feature needs to disable stack
protector at the compilation unit level as there is no general way to
control stack protector coverage with a function attribute.

So move system_call_exception() to syscall.c to avoid affecting other
functions in interrupt.c.

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 arch/powerpc/kernel/Makefile    |   2 +-
 arch/powerpc/kernel/interrupt.c | 161 -----------------------------
 arch/powerpc/kernel/syscall.c   | 173 ++++++++++++++++++++++++++++++++
 3 files changed, 174 insertions(+), 162 deletions(-)
 create mode 100644 arch/powerpc/kernel/syscall.c

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index f91f0f29a566..ecfd333b95d1 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -61,7 +61,7 @@ obj-y				:= cputable.o syscalls.o \
 				   udbg.o misc.o io.o misc_$(BITS).o \
 				   of_platform.o prom_parse.o firmware.o \
 				   hw_breakpoint_constraints.o interrupt.o \
-				   kdebugfs.o stacktrace.o
+				   kdebugfs.o stacktrace.o syscall.o
 obj-y				+= ptrace/
 obj-$(CONFIG_PPC64)		+= setup_64.o \
 				   paca.o nvram_64.o note.o
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 784ea3289c84..0e75cb03244a 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -24,8 +24,6 @@
 unsigned long global_dbcr0[NR_CPUS];
 #endif
 
-typedef long (*syscall_fn)(long, long, long, long, long, long);
-
 #ifdef CONFIG_PPC_BOOK3S_64
 DEFINE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
 static inline bool exit_must_hard_disable(void)
@@ -73,165 +71,6 @@ static notrace __always_inline bool prep_irq_for_enabled_exit(bool restartable)
 	return true;
 }
 
-/* Has to run notrace because it is entered not completely "reconciled" */
-notrace long system_call_exception(long r3, long r4, long r5,
-				   long r6, long r7, long r8,
-				   unsigned long r0, struct pt_regs *regs)
-{
-	syscall_fn f;
-
-	kuap_lock();
-
-	regs->orig_gpr3 = r3;
-
-	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
-		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
-
-	trace_hardirqs_off(); /* finish reconciling */
-
-	CT_WARN_ON(ct_state() == CONTEXT_KERNEL);
-	user_exit_irqoff();
-
-	BUG_ON(regs_is_unrecoverable(regs));
-	BUG_ON(!(regs->msr & MSR_PR));
-	BUG_ON(arch_irq_disabled_regs(regs));
-
-#ifdef CONFIG_PPC_PKEY
-	if (mmu_has_feature(MMU_FTR_PKEY)) {
-		unsigned long amr, iamr;
-		bool flush_needed = false;
-		/*
-		 * When entering from userspace we mostly have the AMR/IAMR
-		 * different from kernel default values. Hence don't compare.
-		 */
-		amr = mfspr(SPRN_AMR);
-		iamr = mfspr(SPRN_IAMR);
-		regs->amr  = amr;
-		regs->iamr = iamr;
-		if (mmu_has_feature(MMU_FTR_BOOK3S_KUAP)) {
-			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
-			flush_needed = true;
-		}
-		if (mmu_has_feature(MMU_FTR_BOOK3S_KUEP)) {
-			mtspr(SPRN_IAMR, AMR_KUEP_BLOCKED);
-			flush_needed = true;
-		}
-		if (flush_needed)
-			isync();
-	} else
-#endif
-		kuap_assert_locked();
-
-	booke_restore_dbcr0();
-
-	account_cpu_user_entry();
-
-	account_stolen_time();
-
-	/*
-	 * This is not required for the syscall exit path, but makes the
-	 * stack frame look nicer. If this was initialised in the first stack
-	 * frame, or if the unwinder was taught the first stack frame always
-	 * returns to user with IRQS_ENABLED, this store could be avoided!
-	 */
-	irq_soft_mask_regs_set_state(regs, IRQS_ENABLED);
-
-	/*
-	 * If system call is called with TM active, set _TIF_RESTOREALL to
-	 * prevent RFSCV being used to return to userspace, because POWER9
-	 * TM implementation has problems with this instruction returning to
-	 * transactional state. Final register values are not relevant because
-	 * the transaction will be aborted upon return anyway. Or in the case
-	 * of unsupported_scv SIGILL fault, the return state does not much
-	 * matter because it's an edge case.
-	 */
-	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
-			unlikely(MSR_TM_TRANSACTIONAL(regs->msr)))
-		set_bits(_TIF_RESTOREALL, &current_thread_info()->flags);
-
-	/*
-	 * If the system call was made with a transaction active, doom it and
-	 * return without performing the system call. Unless it was an
-	 * unsupported scv vector, in which case it's treated like an illegal
-	 * instruction.
-	 */
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	if (unlikely(MSR_TM_TRANSACTIONAL(regs->msr)) &&
-	    !trap_is_unsupported_scv(regs)) {
-		/* Enable TM in the kernel, and disable EE (for scv) */
-		hard_irq_disable();
-		mtmsr(mfmsr() | MSR_TM);
-
-		/* tabort, this dooms the transaction, nothing else */
-		asm volatile(".long 0x7c00071d | ((%0) << 16)"
-				:: "r"(TM_CAUSE_SYSCALL|TM_CAUSE_PERSISTENT));
-
-		/*
-		 * Userspace will never see the return value. Execution will
-		 * resume after the tbegin. of the aborted transaction with the
-		 * checkpointed register state. A context switch could occur
-		 * or signal delivered to the process before resuming the
-		 * doomed transaction context, but that should all be handled
-		 * as expected.
-		 */
-		return -ENOSYS;
-	}
-#endif // CONFIG_PPC_TRANSACTIONAL_MEM
-
-	local_irq_enable();
-
-	if (unlikely(read_thread_flags() & _TIF_SYSCALL_DOTRACE)) {
-		if (unlikely(trap_is_unsupported_scv(regs))) {
-			/* Unsupported scv vector */
-			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
-			return regs->gpr[3];
-		}
-		/*
-		 * We use the return value of do_syscall_trace_enter() as the
-		 * syscall number. If the syscall was rejected for any reason
-		 * do_syscall_trace_enter() returns an invalid syscall number
-		 * and the test against NR_syscalls will fail and the return
-		 * value to be used is in regs->gpr[3].
-		 */
-		r0 = do_syscall_trace_enter(regs);
-		if (unlikely(r0 >= NR_syscalls))
-			return regs->gpr[3];
-		r3 = regs->gpr[3];
-		r4 = regs->gpr[4];
-		r5 = regs->gpr[5];
-		r6 = regs->gpr[6];
-		r7 = regs->gpr[7];
-		r8 = regs->gpr[8];
-
-	} else if (unlikely(r0 >= NR_syscalls)) {
-		if (unlikely(trap_is_unsupported_scv(regs))) {
-			/* Unsupported scv vector */
-			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
-			return regs->gpr[3];
-		}
-		return -ENOSYS;
-	}
-
-	/* May be faster to do array_index_nospec? */
-	barrier_nospec();
-
-	if (unlikely(is_compat_task())) {
-		f = (void *)compat_sys_call_table[r0];
-
-		r3 &= 0x00000000ffffffffULL;
-		r4 &= 0x00000000ffffffffULL;
-		r5 &= 0x00000000ffffffffULL;
-		r6 &= 0x00000000ffffffffULL;
-		r7 &= 0x00000000ffffffffULL;
-		r8 &= 0x00000000ffffffffULL;
-
-	} else {
-		f = (void *)sys_call_table[r0];
-	}
-
-	return f(r3, r4, r5, r6, r7, r8);
-}
-
 static notrace void booke_load_dbcr0(void)
 {
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
new file mode 100644
index 000000000000..4d5689eeaf25
--- /dev/null
+++ b/arch/powerpc/kernel/syscall.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/compat.h>
+#include <linux/context_tracking.h>
+
+#include <asm/interrupt.h>
+#include <asm/kup.h>
+#include <asm/syscall.h>
+#include <asm/time.h>
+#include <asm/tm.h>
+#include <asm/unistd.h>
+
+
+typedef long (*syscall_fn)(long, long, long, long, long, long);
+
+/* Has to run notrace because it is entered not completely "reconciled" */
+notrace long system_call_exception(long r3, long r4, long r5,
+				   long r6, long r7, long r8,
+				   unsigned long r0, struct pt_regs *regs)
+{
+	syscall_fn f;
+
+	kuap_lock();
+
+	regs->orig_gpr3 = r3;
+
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
+		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
+
+	trace_hardirqs_off(); /* finish reconciling */
+
+	CT_WARN_ON(ct_state() == CONTEXT_KERNEL);
+	user_exit_irqoff();
+
+	BUG_ON(regs_is_unrecoverable(regs));
+	BUG_ON(!(regs->msr & MSR_PR));
+	BUG_ON(arch_irq_disabled_regs(regs));
+
+#ifdef CONFIG_PPC_PKEY
+	if (mmu_has_feature(MMU_FTR_PKEY)) {
+		unsigned long amr, iamr;
+		bool flush_needed = false;
+		/*
+		 * When entering from userspace we mostly have the AMR/IAMR
+		 * different from kernel default values. Hence don't compare.
+		 */
+		amr = mfspr(SPRN_AMR);
+		iamr = mfspr(SPRN_IAMR);
+		regs->amr  = amr;
+		regs->iamr = iamr;
+		if (mmu_has_feature(MMU_FTR_BOOK3S_KUAP)) {
+			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
+			flush_needed = true;
+		}
+		if (mmu_has_feature(MMU_FTR_BOOK3S_KUEP)) {
+			mtspr(SPRN_IAMR, AMR_KUEP_BLOCKED);
+			flush_needed = true;
+		}
+		if (flush_needed)
+			isync();
+	} else
+#endif
+		kuap_assert_locked();
+
+	booke_restore_dbcr0();
+
+	account_cpu_user_entry();
+
+	account_stolen_time();
+
+	/*
+	 * This is not required for the syscall exit path, but makes the
+	 * stack frame look nicer. If this was initialised in the first stack
+	 * frame, or if the unwinder was taught the first stack frame always
+	 * returns to user with IRQS_ENABLED, this store could be avoided!
+	 */
+	irq_soft_mask_regs_set_state(regs, IRQS_ENABLED);
+
+	/*
+	 * If system call is called with TM active, set _TIF_RESTOREALL to
+	 * prevent RFSCV being used to return to userspace, because POWER9
+	 * TM implementation has problems with this instruction returning to
+	 * transactional state. Final register values are not relevant because
+	 * the transaction will be aborted upon return anyway. Or in the case
+	 * of unsupported_scv SIGILL fault, the return state does not much
+	 * matter because it's an edge case.
+	 */
+	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
+			unlikely(MSR_TM_TRANSACTIONAL(regs->msr)))
+		set_bits(_TIF_RESTOREALL, &current_thread_info()->flags);
+
+	/*
+	 * If the system call was made with a transaction active, doom it and
+	 * return without performing the system call. Unless it was an
+	 * unsupported scv vector, in which case it's treated like an illegal
+	 * instruction.
+	 */
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	if (unlikely(MSR_TM_TRANSACTIONAL(regs->msr)) &&
+	    !trap_is_unsupported_scv(regs)) {
+		/* Enable TM in the kernel, and disable EE (for scv) */
+		hard_irq_disable();
+		mtmsr(mfmsr() | MSR_TM);
+
+		/* tabort, this dooms the transaction, nothing else */
+		asm volatile(".long 0x7c00071d | ((%0) << 16)"
+				:: "r"(TM_CAUSE_SYSCALL|TM_CAUSE_PERSISTENT));
+
+		/*
+		 * Userspace will never see the return value. Execution will
+		 * resume after the tbegin. of the aborted transaction with the
+		 * checkpointed register state. A context switch could occur
+		 * or signal delivered to the process before resuming the
+		 * doomed transaction context, but that should all be handled
+		 * as expected.
+		 */
+		return -ENOSYS;
+	}
+#endif // CONFIG_PPC_TRANSACTIONAL_MEM
+
+	local_irq_enable();
+
+	if (unlikely(read_thread_flags() & _TIF_SYSCALL_DOTRACE)) {
+		if (unlikely(trap_is_unsupported_scv(regs))) {
+			/* Unsupported scv vector */
+			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
+			return regs->gpr[3];
+		}
+		/*
+		 * We use the return value of do_syscall_trace_enter() as the
+		 * syscall number. If the syscall was rejected for any reason
+		 * do_syscall_trace_enter() returns an invalid syscall number
+		 * and the test against NR_syscalls will fail and the return
+		 * value to be used is in regs->gpr[3].
+		 */
+		r0 = do_syscall_trace_enter(regs);
+		if (unlikely(r0 >= NR_syscalls))
+			return regs->gpr[3];
+		r3 = regs->gpr[3];
+		r4 = regs->gpr[4];
+		r5 = regs->gpr[5];
+		r6 = regs->gpr[6];
+		r7 = regs->gpr[7];
+		r8 = regs->gpr[8];
+
+	} else if (unlikely(r0 >= NR_syscalls)) {
+		if (unlikely(trap_is_unsupported_scv(regs))) {
+			/* Unsupported scv vector */
+			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
+			return regs->gpr[3];
+		}
+		return -ENOSYS;
+	}
+
+	/* May be faster to do array_index_nospec? */
+	barrier_nospec();
+
+	if (unlikely(is_compat_task())) {
+		f = (void *)compat_sys_call_table[r0];
+
+		r3 &= 0x00000000ffffffffULL;
+		r4 &= 0x00000000ffffffffULL;
+		r5 &= 0x00000000ffffffffULL;
+		r6 &= 0x00000000ffffffffULL;
+		r7 &= 0x00000000ffffffffULL;
+		r8 &= 0x00000000ffffffffULL;
+
+	} else {
+		f = (void *)sys_call_table[r0];
+	}
+
+	return f(r3, r4, r5, r6, r7, r8);
+}
-- 
2.17.1

