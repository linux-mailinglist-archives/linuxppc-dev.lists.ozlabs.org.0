Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F2F18B380
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 13:35:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jmbX6cdhzDr09
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 23:35:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jmF21j3ZzDqRZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 23:19:49 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 15FCDAFC8;
 Thu, 19 Mar 2020 12:19:47 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v11 5/8] powerpc/64: make buildable without CONFIG_COMPAT
Date: Thu, 19 Mar 2020 13:19:33 +0100
Message-Id: <4b7058eb0f5558fb7e2cee1b8f7cf99ebd03084e.1584620202.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1584620202.git.msuchanek@suse.de>
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <cover.1584620202.git.msuchanek@suse.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>, Rob Herring <robh@kernel.org>,
 Michael Neuling <mikey@neuling.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jordan Niethe <jniethe5@gmail.com>, Michal Suchanek <msuchanek@suse.de>,
 Valentin Schneider <valentin.schneider@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicholas Piggin <npiggin@gmail.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Eric Richter <erichte@linux.ibm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are numerous references to 32bit functions in generic and 64bit
code so ifdef them out.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
v2:
- fix 32bit ifdef condition in signal.c
- simplify the compat ifdef condition in vdso.c - 64bit is redundant
- simplify the compat ifdef condition in callchain.c - 64bit is redundant
v3:
- use IS_ENABLED and maybe_unused where possible
- do not ifdef declarations
- clean up Makefile
v4:
- further makefile cleanup
- simplify is_32bit_task conditions
- avoid ifdef in condition by using return
v5:
- avoid unreachable code on 32bit
- make is_current_64bit constant on !COMPAT
- add stub perf_callchain_user_32 to avoid some ifdefs
v6:
- consolidate current_is_64bit
v7:
- remove leftover perf_callchain_user_32 stub from previous series version
v8:
- fix build again - too trigger-happy with stub removal
- remove a vdso.c hunk that causes warning according to kbuild test robot
v9:
- removed current_is_64bit in previous patch
v10:
- rebase on top of 70ed86f4de5bd
---
 arch/powerpc/include/asm/thread_info.h | 4 ++--
 arch/powerpc/kernel/Makefile           | 6 +++---
 arch/powerpc/kernel/entry_64.S         | 2 ++
 arch/powerpc/kernel/signal.c           | 3 +--
 arch/powerpc/kernel/syscall_64.c       | 6 ++----
 arch/powerpc/kernel/vdso.c             | 3 ++-
 arch/powerpc/perf/callchain.c          | 8 +++++++-
 7 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index a2270749b282..ca6c97025704 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -162,10 +162,10 @@ static inline bool test_thread_local_flags(unsigned int flags)
 	return (ti->local_flags & flags) != 0;
 }
 
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_COMPAT
 #define is_32bit_task()	(test_thread_flag(TIF_32BIT))
 #else
-#define is_32bit_task()	(1)
+#define is_32bit_task()	(IS_ENABLED(CONFIG_PPC32))
 #endif
 
 #if defined(CONFIG_PPC64)
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 5700231a8988..98a1c143b613 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -42,16 +42,16 @@ CFLAGS_btext.o += -DDISABLE_BRANCH_PROFILING
 endif
 
 obj-y				:= cputable.o ptrace.o syscalls.o \
-				   irq.o align.o signal_32.o pmc.o vdso.o \
+				   irq.o align.o signal_$(BITS).o pmc.o vdso.o \
 				   process.o systbl.o idle.o \
 				   signal.o sysfs.o cacheinfo.o time.o \
 				   prom.o traps.o setup-common.o \
 				   udbg.o misc.o io.o misc_$(BITS).o \
 				   of_platform.o prom_parse.o
-obj-$(CONFIG_PPC64)		+= setup_64.o sys_ppc32.o \
-				   signal_64.o ptrace32.o \
+obj-$(CONFIG_PPC64)		+= setup_64.o \
 				   paca.o nvram_64.o firmware.o note.o \
 				   syscall_64.o
+obj-$(CONFIG_COMPAT)		+= sys_ppc32.o ptrace32.o signal_32.o
 obj-$(CONFIG_VDSO32)		+= vdso32/
 obj-$(CONFIG_PPC_WATCHDOG)	+= watchdog.o
 obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 4c0d0400e93d..fe1421e08f09 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -52,8 +52,10 @@
 SYS_CALL_TABLE:
 	.tc sys_call_table[TC],sys_call_table
 
+#ifdef CONFIG_COMPAT
 COMPAT_SYS_CALL_TABLE:
 	.tc compat_sys_call_table[TC],compat_sys_call_table
+#endif
 
 /* This value is used to mark exception frames on the stack. */
 exception_marker:
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index 4b0152108f61..a264989626fd 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -247,7 +247,6 @@ static void do_signal(struct task_struct *tsk)
 	sigset_t *oldset = sigmask_to_save();
 	struct ksignal ksig = { .sig = 0 };
 	int ret;
-	int is32 = is_32bit_task();
 
 	BUG_ON(tsk != current);
 
@@ -277,7 +276,7 @@ static void do_signal(struct task_struct *tsk)
 
 	rseq_signal_deliver(&ksig, tsk->thread.regs);
 
-	if (is32) {
+	if (is_32bit_task()) {
         	if (ksig.ka.sa.sa_flags & SA_SIGINFO)
 			ret = handle_rt_signal32(&ksig, oldset, tsk);
 		else
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 87d95b455b83..2dcbfe38f5ac 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -24,7 +24,6 @@ notrace long system_call_exception(long r3, long r4, long r5,
 				   long r6, long r7, long r8,
 				   unsigned long r0, struct pt_regs *regs)
 {
-	unsigned long ti_flags;
 	syscall_fn f;
 
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
@@ -68,8 +67,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 
 	local_irq_enable();
 
-	ti_flags = current_thread_info()->flags;
-	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
+	if (unlikely(current_thread_info()->flags & _TIF_SYSCALL_DOTRACE)) {
 		/*
 		 * We use the return value of do_syscall_trace_enter() as the
 		 * syscall number. If the syscall was rejected for any reason
@@ -94,7 +92,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	/* May be faster to do array_index_nospec? */
 	barrier_nospec();
 
-	if (unlikely(ti_flags & _TIF_32BIT)) {
+	if (unlikely(is_32bit_task())) {
 		f = (void *)compat_sys_call_table[r0];
 
 		r3 &= 0x00000000ffffffffULL;
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index b9a108411c0d..77da3b7d304d 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -656,7 +656,8 @@ static void __init vdso_setup_syscall_map(void)
 		if (sys_call_table[i] != sys_ni_syscall)
 			vdso_data->syscall_map_64[i >> 5] |=
 				0x80000000UL >> (i & 0x1f);
-		if (compat_sys_call_table[i] != sys_ni_syscall)
+		if (IS_ENABLED(CONFIG_COMPAT) &&
+		    compat_sys_call_table[i] != sys_ni_syscall)
 			vdso_data->syscall_map_32[i >> 5] |=
 				0x80000000UL >> (i & 0x1f);
 #else /* CONFIG_PPC64 */
diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index 194c7fd933e6..8a274bd523b1 100644
--- a/arch/powerpc/perf/callchain.c
+++ b/arch/powerpc/perf/callchain.c
@@ -15,7 +15,7 @@
 #include <asm/sigcontext.h>
 #include <asm/ucontext.h>
 #include <asm/vdso.h>
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_COMPAT
 #include "../kernel/ppc32.h"
 #endif
 #include <asm/pte-walk.h>
@@ -285,6 +285,7 @@ static inline void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry
 
 #endif /* CONFIG_PPC64 */
 
+#if defined(CONFIG_PPC32) || defined(CONFIG_COMPAT)
 /*
  * On 32-bit we just access the address and let hash_page create a
  * HPTE if necessary, so there is no need to fall back to reading
@@ -448,6 +449,11 @@ static void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
 		sp = next_sp;
 	}
 }
+#else /* 32bit */
+static void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
+				   struct pt_regs *regs)
+{}
+#endif /* 32bit */
 
 void
 perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
-- 
2.23.0

