Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B624740AD42
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 14:14:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H82Mf50YVz3cN7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 22:14:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TzJIvOEI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TzJIvOEI; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H82J65gcCz2ywg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 22:11:18 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2DEE6103B;
 Tue, 14 Sep 2021 12:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631621476;
 bh=Kj7AdLjk9dRbSxRbhe4+hhQ+UqbNDKHemx+IxWmvoNc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TzJIvOEIOpmXfZwzK1fGcRtZ1AJ6gHdJFZonxAsu5yeb23QMvOAZzgn1jTzcmC7D7
 Y9Xp3JLFCqSwMg5yNBekuYixSeGJMle39ftqovV11b595vCe/uW+RHR95JUi+C9gQt
 dfETGkTcetXFVM/ZUM+dKpKs5tU03Gv1Y/puwrlMZfPn482RfB3f//qcjM/UJAZ4Fr
 Rs5ZVsZ8nxd9GFp9Hr1MXlQspsUSdK/0zEqqdeEA5eq44sKGlbNlGWTVSSw0T6KULy
 ZI/b3XkNSeKGjVoAf7GKdLo5Xy9/dk6eYbIqXvYas4SoJMTczY+lrh3JhVBdzUgoCJ
 axau0kIfnkywg==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 5/8] sched: move CPU field back into thread_info if
 THREAD_INFO_IN_TASK=y
Date: Tue, 14 Sep 2021 14:10:33 +0200
Message-Id: <20210914121036.3975026-6-ardb@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210914121036.3975026-1-ardb@kernel.org>
References: <20210914121036.3975026-1-ardb@kernel.org>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-s390@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Keith Packard <keithpac@amazon.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

THREAD_INFO_IN_TASK moved the CPU field out of thread_info, but this
causes some issues on architectures that define raw_smp_processor_id()
in terms of this field, due to the fact that #include'ing linux/sched.h
to get at struct task_struct is problematic in terms of circular
dependencies.

Given that thread_info and task_struct are the same data structure
anyway when THREAD_INFO_IN_TASK=y, let's move it back so that having
access to the type definition of struct thread_info is sufficient to
reference the CPU number of the current task.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/asm-offsets.c   | 1 -
 arch/arm64/kernel/head.S          | 2 +-
 arch/powerpc/kernel/asm-offsets.c | 2 +-
 arch/powerpc/kernel/smp.c         | 2 +-
 include/linux/sched.h             | 6 +-----
 kernel/sched/sched.h              | 4 ----
 6 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index cee9f3e9f906..0bfc048221af 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -27,7 +27,6 @@
 int main(void)
 {
   DEFINE(TSK_ACTIVE_MM,		offsetof(struct task_struct, active_mm));
-  DEFINE(TSK_CPU,		offsetof(struct task_struct, cpu));
   BLANK();
   DEFINE(TSK_TI_CPU,		offsetof(struct task_struct, thread_info.cpu));
   DEFINE(TSK_TI_FLAGS,		offsetof(struct task_struct, thread_info.flags));
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 17962452e31d..6a98f1a38c29 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -412,7 +412,7 @@ SYM_FUNC_END(__create_page_tables)
 	scs_load \tsk
 
 	adr_l	\tmp1, __per_cpu_offset
-	ldr	w\tmp2, [\tsk, #TSK_CPU]
+	ldr	w\tmp2, [\tsk, #TSK_TI_CPU]
 	ldr	\tmp1, [\tmp1, \tmp2, lsl #3]
 	set_this_cpu_offset \tmp1
 	.endm
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index e563d3222d69..e37e4546034e 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -93,7 +93,7 @@ int main(void)
 #endif /* CONFIG_PPC64 */
 	OFFSET(TASK_STACK, task_struct, stack);
 #ifdef CONFIG_SMP
-	OFFSET(TASK_CPU, task_struct, cpu);
+	OFFSET(TASK_CPU, task_struct, thread_info.cpu);
 #endif
 
 #ifdef CONFIG_LIVEPATCH
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 9cc7d3dbf439..512d875b45e0 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1223,7 +1223,7 @@ static void cpu_idle_thread_init(unsigned int cpu, struct task_struct *idle)
 	paca_ptrs[cpu]->kstack = (unsigned long)task_stack_page(idle) +
 				 THREAD_SIZE - STACK_FRAME_OVERHEAD;
 #endif
-	idle->cpu = cpu;
+	task_thread_info(idle)->cpu = cpu;
 	secondary_current = current_set[cpu] = idle;
 }
 
diff --git a/include/linux/sched.h b/include/linux/sched.h
index e12b524426b0..37aa521078e7 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -750,10 +750,6 @@ struct task_struct {
 #ifdef CONFIG_SMP
 	int				on_cpu;
 	struct __call_single_node	wake_entry;
-#ifdef CONFIG_THREAD_INFO_IN_TASK
-	/* Current CPU: */
-	unsigned int			cpu;
-#endif
 	unsigned int			wakee_flips;
 	unsigned long			wakee_flip_decay_ts;
 	struct task_struct		*last_wakee;
@@ -2114,7 +2110,7 @@ static __always_inline bool need_resched(void)
 static inline unsigned int task_cpu(const struct task_struct *p)
 {
 #ifdef CONFIG_THREAD_INFO_IN_TASK
-	return READ_ONCE(p->cpu);
+	return READ_ONCE(p->thread_info.cpu);
 #else
 	return READ_ONCE(task_thread_info(p)->cpu);
 #endif
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 3d3e5793e117..79fcbad11450 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1926,11 +1926,7 @@ static inline void __set_task_cpu(struct task_struct *p, unsigned int cpu)
 	 * per-task data have been completed by this moment.
 	 */
 	smp_wmb();
-#ifdef CONFIG_THREAD_INFO_IN_TASK
-	WRITE_ONCE(p->cpu, cpu);
-#else
 	WRITE_ONCE(task_thread_info(p)->cpu, cpu);
-#endif
 	p->wake_cpu = cpu;
 #endif
 }
-- 
2.30.2

