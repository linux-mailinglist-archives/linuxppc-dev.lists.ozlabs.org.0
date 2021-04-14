Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8710535F1E1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 13:07:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FL07d34Zvz3bV9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 21:07:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256 header.s=1a1hai header.b=Prk10Uy8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=me.com
 (client-ip=17.58.38.50; helo=ms11p00im-qufo17281301.me.com;
 envelope-from=sxwjean@me.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256
 header.s=1a1hai header.b=Prk10Uy8; dkim-atps=neutral
X-Greylist: delayed 387 seconds by postgrey-1.36 at boromir;
 Wed, 14 Apr 2021 21:07:35 AEST
Received: from ms11p00im-qufo17281301.me.com (ms11p00im-qufo17281301.me.com
 [17.58.38.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FL07C5h20z2yy7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 21:07:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1618398065; bh=ZKNU4MFJCFZ68zwNzFkvcR0uLuahhthVh9QAMOTrRvU=;
 h=From:To:Subject:Date:Message-Id;
 b=Prk10Uy8zRC729W7z5U+ZF8O3uwR7vWAT4Oo0pSSpF8NWBudCLWKNDWd+HEfMf6k9
 3QvNSDZ9ZIMjzQEZvmSc9tJ7lgTq99sGw5KUQNAubwMu09qtQ42LRlkk06zxf2M1wO
 X+rs0xa7Qm/jS0rCNYOXjzoIoO1+/kZHVXT3agqdhU+BZJNdqOV87WjZ4q8Fwgg3+b
 SKFH4OUZJYu7DmCiUOx853ZUF7l3qzXijAhNRvD/zM6yKD1Le7JCZO49fuxdZl3hBM
 oAG7s0ouEoEVMMP/4tFmHGhxqkrPMWRRGAmJRyZ+xjwtb0SBisAnQTJx+JerKZWbA8
 dvPsumHly2tNw==
Received: from pek-xsong2-d1.wrs.com (unknown [60.247.85.82])
 by ms11p00im-qufo17281301.me.com (Postfix) with ESMTPSA id C003FAC01AC;
 Wed, 14 Apr 2021 11:00:45 +0000 (UTC)
From: Xiongwei Song <sxwjean@me.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, hbathini@linux.ibm.com,
 rppt@kernel.org, akpm@linux-foundation.org, mahesh@linux.ibm.com,
 nathan@kernel.org, sourabhjain@linux.ibm.com, aneesh.kumar@linux.ibm.com,
 ravi.bangoria@linux.ibm.com, mikey@neuling.org, haren@linux.ibm.com,
 alistair@popple.id.au, jniethe5@gmail.com, peterz@infradead.org,
 leobras.c@gmail.com, walken@google.com, atrajeev@linux.vnet.ibm.com,
 maddy@linux.ibm.com, kjain@linux.ibm.com, kan.liang@linux.intel.com,
 aik@ozlabs.ru
Subject: [PATCH v5] powerpc/traps: Enhance readability for trap types
Date: Wed, 14 Apr 2021 19:00:33 +0800
Message-Id: <1618398033-13025-1-git-send-email-sxwjean@me.com>
X-Mailer: git-send-email 2.7.4
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.391,18.0.761,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-04-14=5F03:2021-04-13=5F02,2021-04-14=5F03,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 mlxlogscore=896
 clxscore=1011 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2104140076
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

From: Xiongwei Song <sxwjean@gmail.com>

Define macros to list ppc interrupt types in interttupt.h, replace the
reference of the trap hex values with these macros.

Referred the hex numbers in arch/powerpc/kernel/exceptions-64e.S,
arch/powerpc/kernel/exceptions-64s.S, arch/powerpc/kernel/head_*.S,
arch/powerpc/kernel/head_booke.h and arch/powerpc/include/asm/kvm_asm.h.

v4-v5:
* Delete unnecessary #ifdef.
* Move INTERRUPT_* macros to interttupt.h, classify for different cpu
  types. Drop traps.h.
* Directly define INTERRUPT_MACHINE_CHECK with 0x200.

v3-v4:
Fix compile issue:
arch/powerpc/kernel/process.c:1473:14: error: 'INTERRUPT_MACHINE_CHECK' undeclared (first use in this function); did you mean 'TAINT_MACHINE_CHECK'?
Reported-by: kernel test robot <lkp@intel.com>

v2-v3:
Correct the prefix of trap macros with INTERRUPT_, the previous prefix
is TRAP_, which is not precise. This is suggested by Segher Boessenkool
and Nicholas Piggin.

v1-v2:
Define more trap macros to replace more trap hexs in code, not just for
the __show_regs function. This is suggested by Christophe Leroy.

Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h  | 48 +++++++++++++++++++++++++--
 arch/powerpc/kernel/fadump.c          |  2 +-
 arch/powerpc/kernel/interrupt.c       |  2 +-
 arch/powerpc/kernel/process.c         |  4 ++-
 arch/powerpc/kernel/traps.c           |  6 ++--
 arch/powerpc/kexec/crash.c            |  3 +-
 arch/powerpc/mm/book3s64/hash_utils.c |  4 +--
 arch/powerpc/mm/fault.c               | 16 ++++-----
 arch/powerpc/perf/core-book3s.c       |  5 +--
 arch/powerpc/xmon/xmon.c              | 20 +++++++----
 10 files changed, 81 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 05e7fc4ffb50..86daf1242088 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -9,6 +9,46 @@
 #include <asm/kprobes.h>
 #include <asm/runlatch.h>
 
+/* BookE/4xx */
+#define INTERRUPT_CRITICAL_INPUT  0x100
+
+/* BookE */
+#define INTERRUPT_DEBUG           0xd00
+#ifdef CONFIG_BOOKE
+#define INTERRUPT_PERFMON         0x260
+#define INTERRUPT_DOORBELL        0x280
+#endif
+
+/* BookS/4xx/8xx */
+#define INTERRUPT_MACHINE_CHECK   0x200
+
+/* BookS/8xx */
+#define INTERRUPT_SYSTEM_RESET    0x100
+
+/* BookS */
+#define INTERRUPT_DATA_SEGMENT    0x380
+#define INTERRUPT_INST_SEGMENT    0x480
+#define INTERRUPT_TRACE           0xd00
+#define INTERRUPT_H_DATA_STORAGE  0xe00
+#define INTERRUPT_H_FAC_UNAVAIL   0xf80
+#ifdef CONFIG_PPC_BOOK3S
+#define INTERRUPT_DOORBELL        0xa00
+#define INTERRUPT_PERFMON         0xf00
+#endif
+
+/* BookE/BookS/4xx/8xx */
+#define INTERRUPT_DATA_STORAGE    0x300
+#define INTERRUPT_INST_STORAGE    0x400
+#define INTERRUPT_ALIGNMENT       0x600
+#define INTERRUPT_PROGRAM         0x700
+#define INTERRUPT_SYSCALL         0xc00
+
+/* BookE/BookS/44x */
+#define INTERRUPT_FP_UNAVAIL      0x800
+
+/* BookE/BookS/44x/8xx */
+#define INTERRUPT_DECREMENTER     0x900
+
 static inline void nap_adjust_return(struct pt_regs *regs)
 {
 #ifdef CONFIG_PPC_970_NAP
@@ -70,7 +110,7 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 		 * CT_WARN_ON comes here via program_check_exception,
 		 * so avoid recursion.
 		 */
-		if (TRAP(regs) != 0x700)
+		if (TRAP(regs) != INTERRUPT_PROGRAM)
 			CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
 	}
 #endif
@@ -175,7 +215,8 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 	/* Don't do any per-CPU operations until interrupt state is fixed */
 #endif
 	/* Allow DEC and PMI to be traced when they are soft-NMI */
-	if (TRAP(regs) != 0x900 && TRAP(regs) != 0xf00 && TRAP(regs) != 0x260) {
+	if (TRAP(regs) != INTERRUPT_DECREMENTER &&
+	    TRAP(regs) != INTERRUPT_PERFMON) {
 		state->ftrace_enabled = this_cpu_get_ftrace_enabled();
 		this_cpu_set_ftrace_enabled(0);
 	}
@@ -204,7 +245,8 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 	 */
 
 #ifdef CONFIG_PPC64
-	if (TRAP(regs) != 0x900 && TRAP(regs) != 0xf00 && TRAP(regs) != 0x260)
+	if (TRAP(regs) != INTERRUPT_DECREMENTER &&
+	    TRAP(regs) != INTERRUPT_PERFMON)
 		this_cpu_set_ftrace_enabled(state->ftrace_enabled);
 
 #ifdef CONFIG_PPC_BOOK3S_64
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index eddf362caedc..b55b4c23f3b6 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -728,7 +728,7 @@ void crash_fadump(struct pt_regs *regs, const char *str)
 	 * If we came in via system reset, wait a while for the secondary
 	 * CPUs to enter.
 	 */
-	if (TRAP(&(fdh->regs)) == 0x100) {
+	if (TRAP(&(fdh->regs)) == INTERRUPT_SYSTEM_RESET) {
 		msecs = CRASH_TIMEOUT;
 		while ((atomic_read(&cpus_in_fadump) < ncpus) && (--msecs > 0))
 			mdelay(1);
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index c4dd4b8f9cfa..9e0f02980494 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -456,7 +456,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	 * CT_WARN_ON comes here via program_check_exception,
 	 * so avoid recursion.
 	 */
-	if (TRAP(regs) != 0x700)
+	if (TRAP(regs) != INTERRUPT_PROGRAM)
 		CT_WARN_ON(ct_state() == CONTEXT_USER);
 
 	kuap = kuap_get_and_assert_locked();
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index b966c8e0cead..53792a999cbb 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1469,7 +1469,9 @@ static void __show_regs(struct pt_regs *regs)
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
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index efba99870691..a9b11ba77c4d 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -221,7 +221,7 @@ static void oops_end(unsigned long flags, struct pt_regs *regs,
 	/*
 	 * system_reset_excption handles debugger, crash dump, panic, for 0x100
 	 */
-	if (TRAP(regs) == 0x100)
+	if (TRAP(regs) == INTERRUPT_SYSTEM_RESET)
 		return;
 
 	crash_fadump(regs, "die oops");
@@ -289,7 +289,7 @@ void die(const char *str, struct pt_regs *regs, long err)
 	/*
 	 * system_reset_excption handles debugger, crash dump, panic, for 0x100
 	 */
-	if (TRAP(regs) != 0x100) {
+	if (TRAP(regs) != INTERRUPT_SYSTEM_RESET) {
 		if (debugger(regs))
 			return;
 	}
@@ -1682,7 +1682,7 @@ DEFINE_INTERRUPT_HANDLER(facility_unavailable_exception)
 	u8 status;
 	bool hv;
 
-	hv = (TRAP(regs) == 0xf80);
+	hv = (TRAP(regs) == INTERRUPT_H_FAC_UNAVAIL);
 	if (hv)
 		value = mfspr(SPRN_HFSCR);
 	else
diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index c9a889880214..0196d0c211ac 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -24,6 +24,7 @@
 #include <asm/smp.h>
 #include <asm/setjmp.h>
 #include <asm/debug.h>
+#include <asm/interrupt.h>
 
 /*
  * The primary CPU waits a while for all secondary CPUs to enter. This is to
@@ -336,7 +337,7 @@ void default_machine_crash_shutdown(struct pt_regs *regs)
 	 * If we came in via system reset, wait a while for the secondary
 	 * CPUs to enter.
 	 */
-	if (TRAP(regs) == 0x100)
+	if (TRAP(regs) == INTERRUPT_SYSTEM_RESET)
 		mdelay(PRIMARY_TIMEOUT);
 
 	crash_kexec_prepare_cpus(crashing_cpu);
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 7719995323c3..ab49216c0ef3 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1145,7 +1145,7 @@ unsigned int hash_page_do_lazy_icache(unsigned int pp, pte_t pte, int trap)
 
 	/* page is dirty */
 	if (!test_bit(PG_dcache_clean, &page->flags) && !PageReserved(page)) {
-		if (trap == 0x400) {
+		if (trap == INTERRUPT_INST_STORAGE) {
 			flush_dcache_icache_page(page);
 			set_bit(PG_dcache_clean, &page->flags);
 		} else
@@ -1545,7 +1545,7 @@ DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
 	if (user_mode(regs) || (region_id == USER_REGION_ID))
 		access &= ~_PAGE_PRIVILEGED;
 
-	if (TRAP(regs) == 0x400)
+	if (TRAP(regs) == INTERRUPT_INST_STORAGE)
 		access |= _PAGE_EXEC;
 
 	err = hash_page_mm(mm, ea, access, TRAP(regs), flags);
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 0c0b1c2cfb49..25523f371c79 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -197,7 +197,7 @@ static int mm_fault_error(struct pt_regs *regs, unsigned long addr,
 static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
 			     unsigned long address, bool is_write)
 {
-	int is_exec = TRAP(regs) == 0x400;
+	int is_exec = TRAP(regs) == INTERRUPT_INST_STORAGE;
 
 	/* NX faults set DSISR_PROTFAULT on the 8xx, DSISR_NOEXEC_OR_G on others */
 	if (is_exec && (error_code & (DSISR_NOEXEC_OR_G | DSISR_KEYFAULT |
@@ -391,7 +391,7 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 	struct vm_area_struct * vma;
 	struct mm_struct *mm = current->mm;
 	unsigned int flags = FAULT_FLAG_DEFAULT;
- 	int is_exec = TRAP(regs) == 0x400;
+	int is_exec = TRAP(regs) == INTERRUPT_INST_STORAGE;
 	int is_user = user_mode(regs);
 	int is_write = page_fault_is_write(error_code);
 	vm_fault_t fault, major = 0;
@@ -588,20 +588,20 @@ void __bad_page_fault(struct pt_regs *regs, int sig)
 	/* kernel has accessed a bad area */
 
 	switch (TRAP(regs)) {
-	case 0x300:
-	case 0x380:
-	case 0xe00:
+	case INTERRUPT_DATA_STORAGE:
+	case INTERRUPT_DATA_SEGMENT:
+	case INTERRUPT_H_DATA_STORAGE:
 		pr_alert("BUG: %s on %s at 0x%08lx\n",
 			 regs->dar < PAGE_SIZE ? "Kernel NULL pointer dereference" :
 			 "Unable to handle kernel data access",
 			 is_write ? "write" : "read", regs->dar);
 		break;
-	case 0x400:
-	case 0x480:
+	case INTERRUPT_INST_STORAGE:
+	case INTERRUPT_INST_SEGMENT:
 		pr_alert("BUG: Unable to handle kernel instruction fetch%s",
 			 regs->nip < PAGE_SIZE ? " (NULL pointer?)\n" : "\n");
 		break;
-	case 0x600:
+	case INTERRUPT_ALIGNMENT:
 		pr_alert("BUG: Unable to handle kernel unaligned access at 0x%08lx\n",
 			 regs->dar);
 		break;
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 766f064f00fb..2ae6126ac8f2 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -17,6 +17,7 @@
 #include <asm/firmware.h>
 #include <asm/ptrace.h>
 #include <asm/code-patching.h>
+#include <asm/interrupt.h>
 
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
index 3fe37495f63d..62544a7ab437 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -54,6 +54,7 @@
 #include <asm/code-patching.h>
 #include <asm/sections.h>
 #include <asm/inst.h>
+#include <asm/interrupt.h>
 
 #ifdef CONFIG_PPC64
 #include <asm/hvcall.h>
@@ -605,7 +606,7 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 			 * debugger break (IPI). This is similar to
 			 * crash_kexec_secondary().
 			 */
-			if (TRAP(regs) != 0x100 || !wait_for_other_cpus(ncpus))
+			if (TRAP(regs) !=  INTERRUPT_SYSTEM_RESET || !wait_for_other_cpus(ncpus))
 				smp_send_debugger_break();
 
 			wait_for_other_cpus(ncpus);
@@ -615,7 +616,7 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 
 		if (!locked_down) {
 			/* for breakpoint or single step, print curr insn */
-			if (bp || TRAP(regs) == 0xd00)
+			if (bp || TRAP(regs) == INTERRUPT_TRACE)
 				ppc_inst_dump(regs->nip, 1, 0);
 			printf("enter ? for help\n");
 		}
@@ -684,7 +685,7 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 		disable_surveillance();
 		if (!locked_down) {
 			/* for breakpoint or single step, print current insn */
-			if (bp || TRAP(regs) == 0xd00)
+			if (bp || TRAP(regs) == INTERRUPT_TRACE)
 				ppc_inst_dump(regs->nip, 1, 0);
 			printf("enter ? for help\n");
 		}
@@ -1769,9 +1770,12 @@ static void excprint(struct pt_regs *fp)
 	printf("    sp: %lx\n", fp->gpr[1]);
 	printf("   msr: %lx\n", fp->msr);
 
-	if (trap == 0x300 || trap == 0x380 || trap == 0x600 || trap == 0x200) {
+	if (trap == INTERRUPT_DATA_STORAGE ||
+	    trap == INTERRUPT_DATA_SEGMENT ||
+	    trap == INTERRUPT_ALIGNMENT ||
+	    trap == INTERRUPT_MACHINE_CHECK) {
 		printf("   dar: %lx\n", fp->dar);
-		if (trap != 0x380)
+		if (trap != INTERRUPT_DATA_SEGMENT)
 			printf(" dsisr: %lx\n", fp->dsisr);
 	}
 
@@ -1785,7 +1789,7 @@ static void excprint(struct pt_regs *fp)
 		       current->pid, current->comm);
 	}
 
-	if (trap == 0x700)
+	if (trap == INTERRUPT_PROGRAM)
 		print_bug_trap(fp);
 
 	printf(linux_banner);
@@ -1846,7 +1850,9 @@ static void prregs(struct pt_regs *fp)
 	printf("ctr = "REG"   xer = "REG"   trap = %4lx\n",
 	       fp->ctr, fp->xer, fp->trap);
 	trap = TRAP(fp);
-	if (trap == 0x300 || trap == 0x380 || trap == 0x600)
+	if (trap == INTERRUPT_DATA_STORAGE ||
+	    trap == INTERRUPT_DATA_SEGMENT ||
+	    trap == INTERRUPT_ALIGNMENT)
 		printf("dar = "REG"   dsisr = %.8lx\n", fp->dar, fp->dsisr);
 }
 
-- 
2.26.1

