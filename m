Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BA535A10A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 16:29:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FH0r70Pmjz3bv3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 00:29:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256 header.s=1a1hai header.b=v/1pJ6Cu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=me.com
 (client-ip=17.58.6.41; helo=pv50p00im-zteg10011401.me.com;
 envelope-from=sxwjean@me.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256
 header.s=1a1hai header.b=v/1pJ6Cu; dkim-atps=neutral
Received: from pv50p00im-zteg10011401.me.com (pv50p00im-zteg10011401.me.com
 [17.58.6.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FH0qh1kbVz2yq9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Apr 2021 00:28:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1617978526; bh=pvaBz+5lRBcsWP67c8Q1CqZeEtpj8crJ5u3DCAQ9ZpU=;
 h=From:To:Subject:Date:Message-Id;
 b=v/1pJ6CuqhJY81T8cAutr7I5xEQsPY+CwEnHWzY+Wr6kMVyYnac1w3UiqZQVld6Ht
 gBx2p5ib7uEiUqTj3AP9X3HjiX//VH9I5gIb0TiemRLHAapV6r2evq3cQoaxphTiir
 qtHNNf/nLbw+s6urzL8BrQH2u+0H+rtbLbQr1rYIaaHR45hv8gzIvg7v0UCk3HIdY9
 of717Nn6HM3h/iBL30WrgAdfwMET7Ty7XPpVPFr7daMVw1+5Bp/OF4vbfcVenclLGd
 we1snaH6+h61vFrIUZ+wko44KNeNFFHeeQ0MXTj+t+5eB4xjQaT+bG0elf8mvdF9AH
 PBUZ1f6jxCg0w==
Received: from localhost.localdomain (unknown [120.245.2.39])
 by pv50p00im-zteg10011401.me.com (Postfix) with ESMTPSA id BFCC69003EE;
 Fri,  9 Apr 2021 14:28:38 +0000 (UTC)
From: Xiongwei Song <sxwjean@me.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 oleg@redhat.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 aneesh.kumar@linux.ibm.com, ravi.bangoria@linux.ibm.com, mikey@neuling.org,
 haren@linux.ibm.com, akpm@linux-foundation.org, rppt@kernel.org,
 jniethe5@gmail.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com,
 peterz@infradead.org, kjain@linux.ibm.com, kan.liang@linux.intel.com,
 aik@ozlabs.ru, alistair@popple.id.au, pmladek@suse.com,
 john.ogness@linutronix.de
Subject: [PATCH v4] powerpc/traps: Enhance readability for trap types
Date: Fri,  9 Apr 2021 22:28:32 +0800
Message-Id: <20210409142832.26063-1-sxwjean@me.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_06:2021-04-09,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=734 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2104090110
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
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Xiongwei Song <sxwjean@gmail.com>

Create a new header named traps.h, define macros to list ppc interrupt
types in traps.h, replace the references of the trap hex values with these
macros.

Referred the hex numbers in arch/powerpc/kernel/exceptions-64e.S,
arch/powerpc/kernel/exceptions-64s.S and
arch/powerpc/include/asm/kvm_asm.h.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
---

v3-v4:
Fix compile issue:
arch/powerpc/kernel/process.c:1473:14: error: 'INTERRUPT_MACHINE_CHECK' undeclared (first use in this function); did you mean 'TAINT_MACHINE_CHECK'?
I didn't add "Reported-by: kernel test robot <lkp@intel.com>" here,
because it's improper for this patch.

v2-v3:
Correct the prefix of trap macros with INTERRUPT_, the previous prefix
is TRAP_, which is not precise. This is suggested by Segher Boessenkool
and Nicholas Piggin.

v1-v2:
Define more trap macros to replace more trap hexs in code, not just for
the __show_regs function. This is suggested by Christophe Leroy.

---
 arch/powerpc/include/asm/interrupt.h  |  9 +++++---
 arch/powerpc/include/asm/ptrace.h     |  3 ++-
 arch/powerpc/include/asm/traps.h      | 32 +++++++++++++++++++++++++++
 arch/powerpc/kernel/interrupt.c       |  3 ++-
 arch/powerpc/kernel/process.c         |  5 ++++-
 arch/powerpc/mm/book3s64/hash_utils.c |  5 +++--
 arch/powerpc/mm/fault.c               | 21 +++++++++++-------
 arch/powerpc/perf/core-book3s.c       |  5 +++--
 arch/powerpc/xmon/xmon.c              | 16 +++++++++++---
 9 files changed, 78 insertions(+), 21 deletions(-)
 create mode 100644 arch/powerpc/include/asm/traps.h

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 05e7fc4ffb50..4fd904fb5d59 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -8,6 +8,7 @@
 #include <asm/ftrace.h>
 #include <asm/kprobes.h>
 #include <asm/runlatch.h>
+#include <asm/traps.h>
 
 static inline void nap_adjust_return(struct pt_regs *regs)
 {
@@ -70,7 +71,7 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 		 * CT_WARN_ON comes here via program_check_exception,
 		 * so avoid recursion.
 		 */
-		if (TRAP(regs) != 0x700)
+		if (TRAP(regs) != INTERRUPT_PROGRAM)
 			CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
 	}
 #endif
@@ -175,7 +176,8 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 	/* Don't do any per-CPU operations until interrupt state is fixed */
 #endif
 	/* Allow DEC and PMI to be traced when they are soft-NMI */
-	if (TRAP(regs) != 0x900 && TRAP(regs) != 0xf00 && TRAP(regs) != 0x260) {
+	if (TRAP(regs) != INTERRUPT_DECREMENTER &&
+	    TRAP(regs) != INTERRUPT_PERFMON) {
 		state->ftrace_enabled = this_cpu_get_ftrace_enabled();
 		this_cpu_set_ftrace_enabled(0);
 	}
@@ -204,7 +206,8 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 	 */
 
 #ifdef CONFIG_PPC64
-	if (TRAP(regs) != 0x900 && TRAP(regs) != 0xf00 && TRAP(regs) != 0x260)
+	if (TRAP(regs) != INTERRUPT_DECREMENTER &&
+	    TRAP(regs) != INTERRUPT_PERFMON)
 		this_cpu_set_ftrace_enabled(state->ftrace_enabled);
 
 #ifdef CONFIG_PPC_BOOK3S_64
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 95600f3a6523..07ff8629e776 100644
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
+	return (trap_is_scv(regs) || TRAP(regs) == INTERRUPT_SYSCALL);
 }
 
 static inline bool trap_norestart(struct pt_regs *regs)
diff --git a/arch/powerpc/include/asm/traps.h b/arch/powerpc/include/asm/traps.h
new file mode 100644
index 000000000000..2e64e10afcef
--- /dev/null
+++ b/arch/powerpc/include/asm/traps.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_PPC_TRAPS_H
+#define _ASM_PPC_TRAPS_H
+
+#if defined(CONFIG_BOOKE) || defined(CONFIG_4xx)
+#define INTERRUPT_MACHINE_CHECK   0x000
+#define INTERRUPT_CRITICAL_INPUT  0x100
+#define INTERRUPT_ALTIVEC_UNAVAIL 0x200
+#define INTERRUPT_PERFMON         0x260
+#define INTERRUPT_DOORBELL        0x280
+#define INTERRUPT_DEBUG           0xd00
+#else
+#define INTERRUPT_SYSTEM_RESET    0x100
+#define INTERRUPT_MACHINE_CHECK   0x200
+#define INTERRUPT_DATA_SEGMENT    0x380
+#define INTERRUPT_INST_SEGMENT    0x480
+#define INTERRUPT_DOORBELL        0xa00
+#define INTERRUPT_TRACE           0xd00
+#define INTERRUPT_H_DATA_STORAGE  0xe00
+#define INTERRUPT_PERFMON         0xf00
+#define INTERRUPT_H_FAC_UNAVAIL   0xf80
+#endif
+
+#define INTERRUPT_DATA_STORAGE    0x300
+#define INTERRUPT_INST_STORAGE    0x400
+#define INTERRUPT_ALIGNMENT       0x600
+#define INTERRUPT_PROGRAM         0x700
+#define INTERRUPT_FP_UNAVAIL      0x800
+#define INTERRUPT_DECREMENTER     0x900
+#define INTERRUPT_SYSCALL         0xc00
+
+#endif /* _ASM_PPC_TRAPS_H */
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index c4dd4b8f9cfa..72689f7ca7c8 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -19,6 +19,7 @@
 #include <asm/syscall.h>
 #include <asm/time.h>
 #include <asm/unistd.h>
+#include <asm/traps.h>
 
 #if defined(CONFIG_PPC_ADV_DEBUG_REGS) && defined(CONFIG_PPC32)
 unsigned long global_dbcr0[NR_CPUS];
@@ -456,7 +457,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	 * CT_WARN_ON comes here via program_check_exception,
 	 * so avoid recursion.
 	 */
-	if (TRAP(regs) != 0x700)
+	if (TRAP(regs) != INTERRUPT_PROGRAM)
 		CT_WARN_ON(ct_state() == CONTEXT_USER);
 
 	kuap = kuap_get_and_assert_locked();
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index b966c8e0cead..92cd49427b2f 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -64,6 +64,7 @@
 #include <asm/asm-prototypes.h>
 #include <asm/stacktrace.h>
 #include <asm/hw_breakpoint.h>
+#include <asm/traps.h>
 
 #include <linux/kprobes.h>
 #include <linux/kdebug.h>
@@ -1469,7 +1470,9 @@ static void __show_regs(struct pt_regs *regs)
 	trap = TRAP(regs);
 	if (!trap_is_syscall(regs) && cpu_has_feature(CPU_FTR_CFAR))
 		pr_cont("CFAR: "REG" ", regs->orig_gpr3);
-	if (trap == 0x200 || trap == 0x300 || trap == 0x600) {
+	if (trap == INTERRUPT_MACHINE_CHECK ||
+	    trap == INTERRUPT_DATA_STORAGE ||
+	    trap == INTERRUPT_ALIGNMENT) {
 		if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
 			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, regs->dsisr);
 		else
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 7719995323c3..2bf06e01b309 100644
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
+		if (trap == INTERRUPT_INST_STORAGE) {
 			flush_dcache_icache_page(page);
 			set_bit(PG_dcache_clean, &page->flags);
 		} else
@@ -1545,7 +1546,7 @@ DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
 	if (user_mode(regs) || (region_id == USER_REGION_ID))
 		access &= ~_PAGE_PRIVILEGED;
 
-	if (TRAP(regs) == 0x400)
+	if (TRAP(regs) == INTERRUPT_INST_STORAGE)
 		access |= _PAGE_EXEC;
 
 	err = hash_page_mm(mm, ea, access, TRAP(regs), flags);
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 0c0b1c2cfb49..1215fa2a72a7 100644
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
+	int is_exec = TRAP(regs) == INTERRUPT_INST_STORAGE;
 
 	/* NX faults set DSISR_PROTFAULT on the 8xx, DSISR_NOEXEC_OR_G on others */
 	if (is_exec && (error_code & (DSISR_NOEXEC_OR_G | DSISR_KEYFAULT |
@@ -391,7 +392,7 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 	struct vm_area_struct * vma;
 	struct mm_struct *mm = current->mm;
 	unsigned int flags = FAULT_FLAG_DEFAULT;
- 	int is_exec = TRAP(regs) == 0x400;
+	int is_exec = TRAP(regs) == INTERRUPT_INST_STORAGE;
 	int is_user = user_mode(regs);
 	int is_write = page_fault_is_write(error_code);
 	vm_fault_t fault, major = 0;
@@ -588,20 +589,24 @@ void __bad_page_fault(struct pt_regs *regs, int sig)
 	/* kernel has accessed a bad area */
 
 	switch (TRAP(regs)) {
-	case 0x300:
-	case 0x380:
-	case 0xe00:
+	case INTERRUPT_DATA_STORAGE:
+#if !defined(CONFIG_BOOKE) && !defined(CONFIG_4xx)
+	case INTERRUPT_DATA_SEGMENT:
+	case INTERRUPT_H_DATA_STORAGE:
+#endif
 		pr_alert("BUG: %s on %s at 0x%08lx\n",
 			 regs->dar < PAGE_SIZE ? "Kernel NULL pointer dereference" :
 			 "Unable to handle kernel data access",
 			 is_write ? "write" : "read", regs->dar);
 		break;
-	case 0x400:
-	case 0x480:
+	case INTERRUPT_INST_STORAGE:
+#if !defined(CONFIG_BOOKE) && !defined(CONFIG_4xx)
+	case INTERRUPT_INST_SEGMENT:
+#endif
 		pr_alert("BUG: Unable to handle kernel instruction fetch%s",
 			 regs->nip < PAGE_SIZE ? " (NULL pointer?)\n" : "\n");
 		break;
-	case 0x600:
+	case INTERRUPT_ALIGNMENT:
 		pr_alert("BUG: Unable to handle kernel unaligned access at 0x%08lx\n",
 			 regs->dar);
 		break;
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 766f064f00fb..6e34f5bba232 100644
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
+	return ((TRAP(regs) == INTERRUPT_PERFMON) && regs->result);
 }
 
 /*
@@ -347,7 +348,7 @@ static inline void perf_read_regs(struct pt_regs *regs)
 	 * hypervisor samples as well as samples in the kernel with
 	 * interrupts off hence the userspace check.
 	 */
-	if (TRAP(regs) != 0xf00)
+	if (TRAP(regs) != INTERRUPT_PERFMON)
 		use_siar = 0;
 	else if ((ppmu->flags & PPMU_NO_SIAR))
 		use_siar = 0;
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 3fe37495f63d..59136634c5ce 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -54,6 +54,7 @@
 #include <asm/code-patching.h>
 #include <asm/sections.h>
 #include <asm/inst.h>
+#include <asm/traps.h>
 
 #ifdef CONFIG_PPC64
 #include <asm/hvcall.h>
@@ -1769,7 +1770,12 @@ static void excprint(struct pt_regs *fp)
 	printf("    sp: %lx\n", fp->gpr[1]);
 	printf("   msr: %lx\n", fp->msr);
 
-	if (trap == 0x300 || trap == 0x380 || trap == 0x600 || trap == 0x200) {
+	if (trap == INTERRUPT_DATA_STORAGE ||
+#if !defined(CONFIG_BOOKE) && !defined(CONFIG_4xx)
+	    trap == INTERRUPT_DATA_SEGMENT ||
+#endif
+	    trap == INTERRUPT_ALIGNMENT ||
+	    trap == INTERRUPT_MACHINE_CHECK) {
 		printf("   dar: %lx\n", fp->dar);
 		if (trap != 0x380)
 			printf(" dsisr: %lx\n", fp->dsisr);
@@ -1785,7 +1791,7 @@ static void excprint(struct pt_regs *fp)
 		       current->pid, current->comm);
 	}
 
-	if (trap == 0x700)
+	if (trap == INTERRUPT_PROGRAM)
 		print_bug_trap(fp);
 
 	printf(linux_banner);
@@ -1846,7 +1852,11 @@ static void prregs(struct pt_regs *fp)
 	printf("ctr = "REG"   xer = "REG"   trap = %4lx\n",
 	       fp->ctr, fp->xer, fp->trap);
 	trap = TRAP(fp);
-	if (trap == 0x300 || trap == 0x380 || trap == 0x600)
+	if (trap == INTERRUPT_DATA_STORAGE ||
+#if !defined(CONFIG_BOOKE) && !defined(CONFIG_4xx)
+	    trap == INTERRUPT_DATA_SEGMENT ||
+#endif
+	    trap == INTERRUPT_ALIGNMENT)
 		printf("dar = "REG"   dsisr = %.8lx\n", fp->dar, fp->dsisr);
 }
 
-- 
2.17.1

