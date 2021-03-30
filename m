Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD3E34EB79
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 17:05:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8t6b2N6vz3c3T
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 02:05:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256 header.s=1a1hai header.b=xjbTkign;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=me.com
 (client-ip=17.58.6.40; helo=pv50p00im-ztdg10011301.me.com;
 envelope-from=sxwjean@me.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256
 header.s=1a1hai header.b=xjbTkign; dkim-atps=neutral
Received: from pv50p00im-ztdg10011301.me.com (pv50p00im-ztdg10011301.me.com
 [17.58.6.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8t6501MRz3bp4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 02:05:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1617116696; bh=9+lfOwCLhKvduHXgKaaCSb6iKiKXvP8gV6PfFW400Hc=;
 h=From:To:Subject:Date:Message-Id;
 b=xjbTkign6kRln6V8TVG4gV+g8cH1dAWV4whhF5b3qL17iaUKN75gz2FjbUQ7TFjJG
 MKeMvjbF42/aACn3z76tEYx8X1DJY59x3xi4Q4hdmex6bviPJDyTGJMaGuqjHCCHJT
 ZSsIg3Ylbk7ETfXtxS/MlGzE1tXj92OpZh9oNfPYUrJCmpeVJCewx182H74bG1Z38h
 lZgl5rIk15umPJMig8ZpD3UmDJSz43I/uyMbzxw5YlD8dc0P6n/CzQkZ4Q2JbE6mgd
 yCXuFpOmiKkuGG2Hj6PXyp8lzbbhqKdG7lAYQv0P1I5XtT/0xbsG6kU4WrR7dVyWgX
 WtEncLVAnHI8w==
Received: from localhost.localdomain (unknown [120.245.2.89])
 by pv50p00im-ztdg10011301.me.com (Postfix) with ESMTPSA id 9761A7600B1;
 Tue, 30 Mar 2021 15:04:47 +0000 (UTC)
From: Xiongwei Song <sxwjean@me.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 oleg@redhat.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 msuchanek@suse.de, aneesh.kumar@linux.ibm.com, ravi.bangoria@linux.ibm.com,
 mikey@neuling.org, haren@linux.ibm.com, alistair@popple.id.au,
 jniethe5@gmail.com, peterz@infradead.org, leobras.c@gmail.com,
 akpm@linux-foundation.org, rppt@kernel.org, peterx@redhat.com,
 atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com,
 kan.liang@linux.intel.com, aik@ozlabs.ru, pmladek@suse.com,
 john.ogness@linutronix.de
Subject: [PATCH v2] powerpc/traps: Enhance readability for trap types
Date: Tue, 30 Mar 2021 23:04:25 +0800
Message-Id: <20210330150425.10145-1-sxwjean@me.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-30_05:2021-03-30,
 2021-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2103300110
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
Cc: Xiongwei Song <sxwjean@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Xiongwei Song <sxwjean@gmail.com>

Create a new header named traps.h, define macros to list ppc exception
types in traps.h, replace the reference of the real trap values with
these macros.

Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h  |  7 ++++---
 arch/powerpc/include/asm/ptrace.h     |  3 ++-
 arch/powerpc/include/asm/traps.h      | 19 +++++++++++++++++++
 arch/powerpc/kernel/interrupt.c       |  2 +-
 arch/powerpc/kernel/process.c         |  3 ++-
 arch/powerpc/kernel/traps.c           |  5 +++--
 arch/powerpc/kexec/crash.c            |  3 ++-
 arch/powerpc/kvm/book3s_hv_builtin.c  |  5 +++--
 arch/powerpc/mm/book3s64/hash_utils.c |  5 +++--
 arch/powerpc/mm/fault.c               | 17 +++++++++--------
 arch/powerpc/perf/core-book3s.c       |  5 +++--
 arch/powerpc/xmon/xmon.c              | 21 +++++++++++----------
 12 files changed, 62 insertions(+), 33 deletions(-)
 create mode 100644 arch/powerpc/include/asm/traps.h

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 7c633896d758..d4c935ba8e16 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -8,6 +8,7 @@
 #include <asm/ftrace.h>
 #include <asm/kprobes.h>
 #include <asm/runlatch.h>
+#include <asm/traps.h>
 
 struct interrupt_state {
 #ifdef CONFIG_PPC_BOOK3E_64
@@ -59,7 +60,7 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 		 * CT_WARN_ON comes here via program_check_exception,
 		 * so avoid recursion.
 		 */
-		if (TRAP(regs) != 0x700)
+		if (TRAP(regs) != TRAP_PROG)
 			CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
 	}
 #endif
@@ -156,7 +157,7 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 	/* Don't do any per-CPU operations until interrupt state is fixed */
 #endif
 	/* Allow DEC and PMI to be traced when they are soft-NMI */
-	if (TRAP(regs) != 0x900 && TRAP(regs) != 0xf00 && TRAP(regs) != 0x260) {
+	if (TRAP(regs) != TRAP_DEC && TRAP(regs) != TRAP_PMI && TRAP(regs) != 0x260) {
 		state->ftrace_enabled = this_cpu_get_ftrace_enabled();
 		this_cpu_set_ftrace_enabled(0);
 	}
@@ -180,7 +181,7 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 		nmi_exit();
 
 #ifdef CONFIG_PPC64
-	if (TRAP(regs) != 0x900 && TRAP(regs) != 0xf00 && TRAP(regs) != 0x260)
+	if (TRAP(regs) != TRAP_DEC && TRAP(regs) != TRAP_PMI && TRAP(regs) != 0x260)
 		this_cpu_set_ftrace_enabled(state->ftrace_enabled);
 
 #ifdef CONFIG_PPC_BOOK3S_64
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index f10498e1b3f6..04726fb43a9d 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -21,6 +21,7 @@
 
 #include <uapi/asm/ptrace.h>
 #include <asm/asm-const.h>
+#include <asm/traps.h>
 
 #ifndef __ASSEMBLY__
 struct pt_regs
@@ -237,7 +238,7 @@ static inline bool trap_is_unsupported_scv(struct pt_regs *regs)
 
 static inline bool trap_is_syscall(struct pt_regs *regs)
 {
-	return (trap_is_scv(regs) || TRAP(regs) == 0xc00);
+	return (trap_is_scv(regs) || TRAP(regs) == TRAP_SYSCALL);
 }
 
 static inline bool trap_norestart(struct pt_regs *regs)
diff --git a/arch/powerpc/include/asm/traps.h b/arch/powerpc/include/asm/traps.h
new file mode 100644
index 000000000000..a31b6122de23
--- /dev/null
+++ b/arch/powerpc/include/asm/traps.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_PPC_TRAPS_H
+#define _ASM_PPC_TRAPS_H
+
+#define TRAP_RESET   0x100 /* System reset */
+#define TRAP_MCE     0x200 /* Machine check */
+#define TRAP_DSI     0x300 /* Data storage */
+#define TRAP_DSEGI   0x380 /* Data segment */
+#define TRAP_ISI     0x400 /* Instruction storage */
+#define TRAP_ISEGI   0x480 /* Instruction segment */
+#define TRAP_ALIGN   0x600 /* Alignment */
+#define TRAP_PROG    0x700 /* Program */
+#define TRAP_DEC     0x900 /* Decrementer */
+#define TRAP_SYSCALL 0xc00 /* System call */
+#define TRAP_TRACEI  0xd00 /* Trace */
+#define TRAP_FPA     0xe00 /* Floating-point Assist */
+#define TRAP_PMI     0xf00 /* Performance monitor */
+
+#endif /* _ASM_PPC_TRAPS_H */
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index c4dd4b8f9cfa..fc9a40cbbcae 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -456,7 +456,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	 * CT_WARN_ON comes here via program_check_exception,
 	 * so avoid recursion.
 	 */
-	if (TRAP(regs) != 0x700)
+	if (TRAP(regs) != TRAP_PROG)
 		CT_WARN_ON(ct_state() == CONTEXT_USER);
 
 	kuap = kuap_get_and_assert_locked();
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index b966c8e0cead..0d416744136f 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -64,6 +64,7 @@
 #include <asm/asm-prototypes.h>
 #include <asm/stacktrace.h>
 #include <asm/hw_breakpoint.h>
+#include <asm/traps.h>
 
 #include <linux/kprobes.h>
 #include <linux/kdebug.h>
@@ -1469,7 +1470,7 @@ static void __show_regs(struct pt_regs *regs)
 	trap = TRAP(regs);
 	if (!trap_is_syscall(regs) && cpu_has_feature(CPU_FTR_CFAR))
 		pr_cont("CFAR: "REG" ", regs->orig_gpr3);
-	if (trap == 0x200 || trap == 0x300 || trap == 0x600) {
+	if (trap == TRAP_MCE || trap == TRAP_DSI || trap == TRAP_ALIGN) {
 		if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
 			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, regs->dsisr);
 		else
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 76d17492e0e5..c9fa10e20140 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -67,6 +67,7 @@
 #include <asm/kprobes.h>
 #include <asm/stacktrace.h>
 #include <asm/nmi.h>
+#include <asm/traps.h>
 
 #if defined(CONFIG_DEBUGGER) || defined(CONFIG_KEXEC_CORE)
 int (*__debugger)(struct pt_regs *regs) __read_mostly;
@@ -221,7 +222,7 @@ static void oops_end(unsigned long flags, struct pt_regs *regs,
 	/*
 	 * system_reset_excption handles debugger, crash dump, panic, for 0x100
 	 */
-	if (TRAP(regs) == 0x100)
+	if (TRAP(regs) == TRAP_RESET)
 		return;
 
 	crash_fadump(regs, "die oops");
@@ -289,7 +290,7 @@ void die(const char *str, struct pt_regs *regs, long err)
 	/*
 	 * system_reset_excption handles debugger, crash dump, panic, for 0x100
 	 */
-	if (TRAP(regs) != 0x100) {
+	if (TRAP(regs) != TRAP_RESET) {
 		if (debugger(regs))
 			return;
 	}
diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index c9a889880214..5246969e3f68 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -24,6 +24,7 @@
 #include <asm/smp.h>
 #include <asm/setjmp.h>
 #include <asm/debug.h>
+#include <asm/traps.h>
 
 /*
  * The primary CPU waits a while for all secondary CPUs to enter. This is to
@@ -336,7 +337,7 @@ void default_machine_crash_shutdown(struct pt_regs *regs)
 	 * If we came in via system reset, wait a while for the secondary
 	 * CPUs to enter.
 	 */
-	if (TRAP(regs) == 0x100)
+	if (TRAP(regs) == TRAP_RESET)
 		mdelay(PRIMARY_TIMEOUT);
 
 	crash_kexec_prepare_cpus(crashing_cpu);
diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 158d309b42a3..795d4a2bc8e3 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -28,6 +28,7 @@
 #include <asm/io.h>
 #include <asm/opal.h>
 #include <asm/smp.h>
+#include <asm/traps.h>
 
 #define KVM_CMA_CHUNK_ORDER	18
 
@@ -639,11 +640,11 @@ void kvmppc_bad_interrupt(struct pt_regs *regs)
 	 * 100 could happen at any time, 200 can happen due to invalid real
 	 * address access for example (or any time due to a hardware problem).
 	 */
-	if (TRAP(regs) == 0x100) {
+	if (TRAP(regs) == TRAP_RESET) {
 		get_paca()->in_nmi++;
 		system_reset_exception(regs);
 		get_paca()->in_nmi--;
-	} else if (TRAP(regs) == 0x200) {
+	} else if (TRAP(regs) == TRAP_MCE) {
 		machine_check_exception(regs);
 	} else {
 		die("Bad interrupt in KVM entry/exit code", regs, SIGABRT);
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 7719995323c3..97ff82a1925f 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -64,6 +64,7 @@
 #include <asm/pte-walk.h>
 #include <asm/asm-prototypes.h>
 #include <asm/ultravisor.h>
+#include <asm/traps.h>
 
 #include <mm/mmu_decl.h>
 
@@ -1145,7 +1146,7 @@ unsigned int hash_page_do_lazy_icache(unsigned int pp, pte_t pte, int trap)
 
 	/* page is dirty */
 	if (!test_bit(PG_dcache_clean, &page->flags) && !PageReserved(page)) {
-		if (trap == 0x400) {
+		if (trap == TRAP_ISI) {
 			flush_dcache_icache_page(page);
 			set_bit(PG_dcache_clean, &page->flags);
 		} else
@@ -1545,7 +1546,7 @@ DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
 	if (user_mode(regs) || (region_id == USER_REGION_ID))
 		access &= ~_PAGE_PRIVILEGED;
 
-	if (TRAP(regs) == 0x400)
+	if (TRAP(regs) == TRAP_ISI)
 		access |= _PAGE_EXEC;
 
 	err = hash_page_mm(mm, ea, access, TRAP(regs), flags);
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 0c0b1c2cfb49..fae9c072e498 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -44,6 +44,7 @@
 #include <asm/debug.h>
 #include <asm/kup.h>
 #include <asm/inst.h>
+#include <asm/traps.h>
 
 
 /*
@@ -197,7 +198,7 @@ static int mm_fault_error(struct pt_regs *regs, unsigned long addr,
 static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
 			     unsigned long address, bool is_write)
 {
-	int is_exec = TRAP(regs) == 0x400;
+	int is_exec = TRAP(regs) == TRAP_ISI;
 
 	/* NX faults set DSISR_PROTFAULT on the 8xx, DSISR_NOEXEC_OR_G on others */
 	if (is_exec && (error_code & (DSISR_NOEXEC_OR_G | DSISR_KEYFAULT |
@@ -391,7 +392,7 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 	struct vm_area_struct * vma;
 	struct mm_struct *mm = current->mm;
 	unsigned int flags = FAULT_FLAG_DEFAULT;
- 	int is_exec = TRAP(regs) == 0x400;
+	int is_exec = TRAP(regs) == TRAP_ISI;
 	int is_user = user_mode(regs);
 	int is_write = page_fault_is_write(error_code);
 	vm_fault_t fault, major = 0;
@@ -588,20 +589,20 @@ void __bad_page_fault(struct pt_regs *regs, int sig)
 	/* kernel has accessed a bad area */
 
 	switch (TRAP(regs)) {
-	case 0x300:
-	case 0x380:
-	case 0xe00:
+	case TRAP_DSI:
+	case TRAP_DSEGI:
+	case TRAP_FPA:
 		pr_alert("BUG: %s on %s at 0x%08lx\n",
 			 regs->dar < PAGE_SIZE ? "Kernel NULL pointer dereference" :
 			 "Unable to handle kernel data access",
 			 is_write ? "write" : "read", regs->dar);
 		break;
-	case 0x400:
-	case 0x480:
+	case TRAP_ISI:
+	case TRAP_ISEGI:
 		pr_alert("BUG: Unable to handle kernel instruction fetch%s",
 			 regs->nip < PAGE_SIZE ? " (NULL pointer?)\n" : "\n");
 		break;
-	case 0x600:
+	case TRAP_ALIGN:
 		pr_alert("BUG: Unable to handle kernel unaligned access at 0x%08lx\n",
 			 regs->dar);
 		break;
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 766f064f00fb..15fa471d8205 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -17,6 +17,7 @@
 #include <asm/firmware.h>
 #include <asm/ptrace.h>
 #include <asm/code-patching.h>
+#include <asm/traps.h>
 
 #ifdef CONFIG_PPC64
 #include "internal.h"
@@ -168,7 +169,7 @@ static bool regs_use_siar(struct pt_regs *regs)
 	 * they have not been setup using perf_read_regs() and so regs->result
 	 * is something random.
 	 */
-	return ((TRAP(regs) == 0xf00) && regs->result);
+	return ((TRAP(regs) == TRAP_PMI) && regs->result);
 }
 
 /*
@@ -347,7 +348,7 @@ static inline void perf_read_regs(struct pt_regs *regs)
 	 * hypervisor samples as well as samples in the kernel with
 	 * interrupts off hence the userspace check.
 	 */
-	if (TRAP(regs) != 0xf00)
+	if (TRAP(regs) != TRAP_PMI)
 		use_siar = 0;
 	else if ((ppmu->flags & PPMU_NO_SIAR))
 		use_siar = 0;
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index bf7d69625a2e..570277c4d471 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -54,6 +54,7 @@
 #include <asm/code-patching.h>
 #include <asm/sections.h>
 #include <asm/inst.h>
+#include <asm/traps.h>
 
 #ifdef CONFIG_PPC64
 #include <asm/hvcall.h>
@@ -605,7 +606,7 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 			 * debugger break (IPI). This is similar to
 			 * crash_kexec_secondary().
 			 */
-			if (TRAP(regs) != 0x100 || !wait_for_other_cpus(ncpus))
+			if (TRAP(regs) != TRAP_RESET || !wait_for_other_cpus(ncpus))
 				smp_send_debugger_break();
 
 			wait_for_other_cpus(ncpus);
@@ -615,7 +616,7 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 
 		if (!locked_down) {
 			/* for breakpoint or single step, print curr insn */
-			if (bp || TRAP(regs) == 0xd00)
+			if (bp || TRAP(regs) == TRAP_TRACEI)
 				ppc_inst_dump(regs->nip, 1, 0);
 			printf("enter ? for help\n");
 		}
@@ -684,7 +685,7 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 		disable_surveillance();
 		if (!locked_down) {
 			/* for breakpoint or single step, print current insn */
-			if (bp || TRAP(regs) == 0xd00)
+			if (bp || TRAP(regs) == TRAP_TRACEI)
 				ppc_inst_dump(regs->nip, 1, 0);
 			printf("enter ? for help\n");
 		}
@@ -1769,9 +1770,9 @@ static void excprint(struct pt_regs *fp)
 	printf("    sp: %lx\n", fp->gpr[1]);
 	printf("   msr: %lx\n", fp->msr);
 
-	if (trap == 0x300 || trap == 0x380 || trap == 0x600 || trap == 0x200) {
+	if (trap == TRAP_DSI || trap == TRAP_DSEGI || trap == TRAP_ALIGN || trap == TRAP_MCE) {
 		printf("   dar: %lx\n", fp->dar);
-		if (trap != 0x380)
+		if (trap != TRAP_DSEGI)
 			printf(" dsisr: %lx\n", fp->dsisr);
 	}
 
@@ -1785,7 +1786,7 @@ static void excprint(struct pt_regs *fp)
 		       current->pid, current->comm);
 	}
 
-	if (trap == 0x700)
+	if (trap == TRAP_PROG)
 		print_bug_trap(fp);
 
 	printf(linux_banner);
@@ -1846,7 +1847,7 @@ static void prregs(struct pt_regs *fp)
 	printf("ctr = "REG"   xer = "REG"   trap = %4lx\n",
 	       fp->ctr, fp->xer, fp->trap);
 	trap = TRAP(fp);
-	if (trap == 0x300 || trap == 0x380 || trap == 0x600)
+	if (trap == TRAP_DSI || trap == TRAP_DSEGI || trap == TRAP_ALIGN)
 		printf("dar = "REG"   dsisr = %.8lx\n", fp->dar, fp->dsisr);
 }
 
@@ -2235,11 +2236,11 @@ static int handle_fault(struct pt_regs *regs)
 {
 	fault_except = TRAP(regs);
 	switch (TRAP(regs)) {
-	case 0x200:
+	case TRAP_MCE:
 		fault_type = 0;
 		break;
-	case 0x300:
-	case 0x380:
+	case TRAP_DSI:
+	case TRAP_DSEGI:
 		fault_type = 1;
 		break;
 	default:
-- 
2.17.1

