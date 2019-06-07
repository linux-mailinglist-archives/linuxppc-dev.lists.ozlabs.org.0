Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCADD38824
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 12:45:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KzhC5jDPzDqmj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 20:45:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
X-Greylist: delayed 482 seconds by postgrey-1.36 at bilbo;
 Fri, 07 Jun 2019 20:43:59 AEST
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 45KzfR5pNwzDqTk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 20:43:57 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91C3C707;
 Fri,  7 Jun 2019 03:35:53 -0700 (PDT)
Received: from p8cg001049571a15.blr.arm.com (p8cg001049571a15.blr.arm.com
 [10.162.42.131])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D70673F246;
 Fri,  7 Jun 2019 03:37:24 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC V3] mm: Generalize and rename notify_page_fault() as
 kprobe_page_fault()
Date: Fri,  7 Jun 2019 16:04:15 +0530
Message-Id: <1559903655-5609-1-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Very similar definitions for notify_page_fault() are being used by multiple
architectures duplicating much of the same code. This attempts to unify all
of them into a generic implementation, rename it as kprobe_page_fault() and
then move it to a common header.

kprobes_built_in() can detect CONFIG_KPROBES, hence new kprobe_page_fault()
need not be wrapped again within CONFIG_KPROBES. Trap number argument can
now contain upto an 'unsigned int' accommodating all possible platforms.

kprobe_page_fault() goes the x86 way while dealing with preemption context.
As explained in these following commits the invoking context in itself must
be non-preemptible for kprobes processing context irrespective of whether
kprobe_running() or perhaps smp_processor_id() is safe or not. It does not
make much sense to continue when original context is preemptible. Instead
just bail out earlier.

commit a980c0ef9f6d
("x86/kprobes: Refactor kprobes_fault() like kprobe_exceptions_notify()")

commit b506a9d08bae ("x86: code clarification patch to Kprobes arch code")

Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-ia64@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: x86@kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrey Konovalov <andreyknvl@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>

Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Testing:

- Build and boot tested on arm64 and x86
- Build tested on some other archs (arm, sparc64, alpha, powerpc etc)

Changes in RFC V3:

- Updated the commit message with an explaination for new preemption behaviour
- Moved notify_page_fault() to kprobes.h with 'static nokprobe_inline' per Matthew
- Changed notify_page_fault() return type from int to bool per Michael Ellerman
- Renamed notify_page_fault() as kprobe_page_fault() per Peterz

Changes in RFC V2: (https://patchwork.kernel.org/patch/10974221/)

- Changed generic notify_page_fault() per Mathew Wilcox
- Changed x86 to use new generic notify_page_fault()
- s/must not/need not/ in commit message per Matthew Wilcox

Changes in RFC V1: (https://patchwork.kernel.org/patch/10968273/)

 arch/arm/mm/fault.c      | 24 +-----------------------
 arch/arm64/mm/fault.c    | 24 +-----------------------
 arch/ia64/mm/fault.c     | 24 +-----------------------
 arch/powerpc/mm/fault.c  | 23 ++---------------------
 arch/s390/mm/fault.c     | 16 +---------------
 arch/sh/mm/fault.c       | 18 ++----------------
 arch/sparc/mm/fault_64.c | 16 +---------------
 arch/x86/mm/fault.c      | 21 ++-------------------
 include/linux/kprobes.h  | 16 ++++++++++++++++
 9 files changed, 27 insertions(+), 155 deletions(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 58f69fa..94a97a4 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -30,28 +30,6 @@
 
 #ifdef CONFIG_MMU
 
-#ifdef CONFIG_KPROBES
-static inline int notify_page_fault(struct pt_regs *regs, unsigned int fsr)
-{
-	int ret = 0;
-
-	if (!user_mode(regs)) {
-		/* kprobe_running() needs smp_processor_id() */
-		preempt_disable();
-		if (kprobe_running() && kprobe_fault_handler(regs, fsr))
-			ret = 1;
-		preempt_enable();
-	}
-
-	return ret;
-}
-#else
-static inline int notify_page_fault(struct pt_regs *regs, unsigned int fsr)
-{
-	return 0;
-}
-#endif
-
 /*
  * This is useful to dump out the page tables associated with
  * 'addr' in mm 'mm'.
@@ -266,7 +244,7 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 	vm_fault_t fault;
 	unsigned int flags = FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;
 
-	if (notify_page_fault(regs, fsr))
+	if (kprobe_page_fault(regs, fsr))
 		return 0;
 
 	tsk = current;
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index a30818e..8fe4bbc 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -70,28 +70,6 @@ static inline const struct fault_info *esr_to_debug_fault_info(unsigned int esr)
 	return debug_fault_info + DBG_ESR_EVT(esr);
 }
 
-#ifdef CONFIG_KPROBES
-static inline int notify_page_fault(struct pt_regs *regs, unsigned int esr)
-{
-	int ret = 0;
-
-	/* kprobe_running() needs smp_processor_id() */
-	if (!user_mode(regs)) {
-		preempt_disable();
-		if (kprobe_running() && kprobe_fault_handler(regs, esr))
-			ret = 1;
-		preempt_enable();
-	}
-
-	return ret;
-}
-#else
-static inline int notify_page_fault(struct pt_regs *regs, unsigned int esr)
-{
-	return 0;
-}
-#endif
-
 static void data_abort_decode(unsigned int esr)
 {
 	pr_alert("Data abort info:\n");
@@ -446,7 +424,7 @@ static int __kprobes do_page_fault(unsigned long addr, unsigned int esr,
 	unsigned long vm_flags = VM_READ | VM_WRITE;
 	unsigned int mm_flags = FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;
 
-	if (notify_page_fault(regs, esr))
+	if (kprobe_page_fault(regs, esr))
 		return 0;
 
 	tsk = current;
diff --git a/arch/ia64/mm/fault.c b/arch/ia64/mm/fault.c
index 5baeb02..22582f8 100644
--- a/arch/ia64/mm/fault.c
+++ b/arch/ia64/mm/fault.c
@@ -21,28 +21,6 @@
 
 extern int die(char *, struct pt_regs *, long);
 
-#ifdef CONFIG_KPROBES
-static inline int notify_page_fault(struct pt_regs *regs, int trap)
-{
-	int ret = 0;
-
-	if (!user_mode(regs)) {
-		/* kprobe_running() needs smp_processor_id() */
-		preempt_disable();
-		if (kprobe_running() && kprobe_fault_handler(regs, trap))
-			ret = 1;
-		preempt_enable();
-	}
-
-	return ret;
-}
-#else
-static inline int notify_page_fault(struct pt_regs *regs, int trap)
-{
-	return 0;
-}
-#endif
-
 /*
  * Return TRUE if ADDRESS points at a page in the kernel's mapped segment
  * (inside region 5, on ia64) and that page is present.
@@ -116,7 +94,7 @@ ia64_do_page_fault (unsigned long address, unsigned long isr, struct pt_regs *re
 	/*
 	 * This is to handle the kprobes on user space access instructions
 	 */
-	if (notify_page_fault(regs, TRAP_BRKPT))
+	if (kprobe_page_fault(regs, TRAP_BRKPT))
 		return;
 
 	if (user_mode(regs))
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index ec6b7ad..f20ee668 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -42,26 +42,6 @@
 #include <asm/debug.h>
 #include <asm/kup.h>
 
-static inline bool notify_page_fault(struct pt_regs *regs)
-{
-	bool ret = false;
-
-#ifdef CONFIG_KPROBES
-	/* kprobe_running() needs smp_processor_id() */
-	if (!user_mode(regs)) {
-		preempt_disable();
-		if (kprobe_running() && kprobe_fault_handler(regs, 11))
-			ret = true;
-		preempt_enable();
-	}
-#endif /* CONFIG_KPROBES */
-
-	if (unlikely(debugger_fault_handler(regs)))
-		ret = true;
-
-	return ret;
-}
-
 /*
  * Check whether the instruction inst is a store using
  * an update addressing form which will update r1.
@@ -462,8 +442,9 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 	int is_write = page_fault_is_write(error_code);
 	vm_fault_t fault, major = 0;
 	bool must_retry = false;
+	int kprobe_fault = kprobe_page_fault(regs, 11);
 
-	if (notify_page_fault(regs))
+	if (unlikely(debugger_fault_handler(regs) || kprobe_fault))
 		return 0;
 
 	if (unlikely(page_fault_is_bad(error_code))) {
diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
index 91ce03f..bb77a2c 100644
--- a/arch/s390/mm/fault.c
+++ b/arch/s390/mm/fault.c
@@ -67,20 +67,6 @@ static int __init fault_init(void)
 }
 early_initcall(fault_init);
 
-static inline int notify_page_fault(struct pt_regs *regs)
-{
-	int ret = 0;
-
-	/* kprobe_running() needs smp_processor_id() */
-	if (kprobes_built_in() && !user_mode(regs)) {
-		preempt_disable();
-		if (kprobe_running() && kprobe_fault_handler(regs, 14))
-			ret = 1;
-		preempt_enable();
-	}
-	return ret;
-}
-
 /*
  * Find out which address space caused the exception.
  * Access register mode is impossible, ignore space == 3.
@@ -411,7 +397,7 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
 	 */
 	clear_pt_regs_flag(regs, PIF_PER_TRAP);
 
-	if (notify_page_fault(regs))
+	if (kprobe_page_fault(regs, 14))
 		return 0;
 
 	mm = tsk->mm;
diff --git a/arch/sh/mm/fault.c b/arch/sh/mm/fault.c
index 6defd2c6..74cd4ac 100644
--- a/arch/sh/mm/fault.c
+++ b/arch/sh/mm/fault.c
@@ -24,20 +24,6 @@
 #include <asm/tlbflush.h>
 #include <asm/traps.h>
 
-static inline int notify_page_fault(struct pt_regs *regs, int trap)
-{
-	int ret = 0;
-
-	if (kprobes_built_in() && !user_mode(regs)) {
-		preempt_disable();
-		if (kprobe_running() && kprobe_fault_handler(regs, trap))
-			ret = 1;
-		preempt_enable();
-	}
-
-	return ret;
-}
-
 static void
 force_sig_info_fault(int si_signo, int si_code, unsigned long address,
 		     struct task_struct *tsk)
@@ -415,14 +401,14 @@ asmlinkage void __kprobes do_page_fault(struct pt_regs *regs,
 	if (unlikely(fault_in_kernel_space(address))) {
 		if (vmalloc_fault(address) >= 0)
 			return;
-		if (notify_page_fault(regs, vec))
+		if (kprobe_page_fault(regs, vec))
 			return;
 
 		bad_area_nosemaphore(regs, error_code, address);
 		return;
 	}
 
-	if (unlikely(notify_page_fault(regs, vec)))
+	if (unlikely(kprobe_page_fault(regs, vec)))
 		return;
 
 	/* Only enable interrupts if they were on before the fault */
diff --git a/arch/sparc/mm/fault_64.c b/arch/sparc/mm/fault_64.c
index 8f8a604..6865f9c 100644
--- a/arch/sparc/mm/fault_64.c
+++ b/arch/sparc/mm/fault_64.c
@@ -38,20 +38,6 @@
 
 int show_unhandled_signals = 1;
 
-static inline __kprobes int notify_page_fault(struct pt_regs *regs)
-{
-	int ret = 0;
-
-	/* kprobe_running() needs smp_processor_id() */
-	if (kprobes_built_in() && !user_mode(regs)) {
-		preempt_disable();
-		if (kprobe_running() && kprobe_fault_handler(regs, 0))
-			ret = 1;
-		preempt_enable();
-	}
-	return ret;
-}
-
 static void __kprobes unhandled_fault(unsigned long address,
 				      struct task_struct *tsk,
 				      struct pt_regs *regs)
@@ -285,7 +271,7 @@ asmlinkage void __kprobes do_sparc64_fault(struct pt_regs *regs)
 
 	fault_code = get_thread_fault_code();
 
-	if (notify_page_fault(regs))
+	if (kprobe_page_fault(regs, 0))
 		goto exit_exception;
 
 	si_code = SEGV_MAPERR;
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index 46df4c6..5400f4e 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -46,23 +46,6 @@ kmmio_fault(struct pt_regs *regs, unsigned long addr)
 	return 0;
 }
 
-static nokprobe_inline int kprobes_fault(struct pt_regs *regs)
-{
-	if (!kprobes_built_in())
-		return 0;
-	if (user_mode(regs))
-		return 0;
-	/*
-	 * To be potentially processing a kprobe fault and to be allowed to call
-	 * kprobe_running(), we have to be non-preemptible.
-	 */
-	if (preemptible())
-		return 0;
-	if (!kprobe_running())
-		return 0;
-	return kprobe_fault_handler(regs, X86_TRAP_PF);
-}
-
 /*
  * Prefetch quirks:
  *
@@ -1280,7 +1263,7 @@ do_kern_addr_fault(struct pt_regs *regs, unsigned long hw_error_code,
 		return;
 
 	/* kprobes don't want to hook the spurious faults: */
-	if (kprobes_fault(regs))
+	if (kprobe_page_fault(regs, X86_TRAP_PF))
 		return;
 
 	/*
@@ -1311,7 +1294,7 @@ void do_user_addr_fault(struct pt_regs *regs,
 	mm = tsk->mm;
 
 	/* kprobes don't want to hook the spurious faults: */
-	if (unlikely(kprobes_fault(regs)))
+	if (unlikely(kprobe_page_fault(regs, X86_TRAP_PF)))
 		return;
 
 	/*
diff --git a/include/linux/kprobes.h b/include/linux/kprobes.h
index 443d980..064dd15 100644
--- a/include/linux/kprobes.h
+++ b/include/linux/kprobes.h
@@ -458,4 +458,20 @@ static inline bool is_kprobe_optinsn_slot(unsigned long addr)
 }
 #endif
 
+static nokprobe_inline bool kprobe_page_fault(struct pt_regs *regs,
+					      unsigned int trap)
+{
+	int ret = 0;
+
+	/*
+	 * To be potentially processing a kprobe fault and to be allowed
+	 * to call kprobe_running(), we have to be non-preemptible.
+	 */
+	if (kprobes_built_in() && !preemptible() && !user_mode(regs)) {
+		if (kprobe_running() && kprobe_fault_handler(regs, trap))
+			ret = 1;
+	}
+	return ret;
+}
+
 #endif /* _LINUX_KPROBES_H */
-- 
2.7.4

