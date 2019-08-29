Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2B0A29D4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 00:39:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KHcF1ny8zF0f5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 08:39:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KHNJ3DR8zDrnR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 08:29:36 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9C7A1AF79;
 Thu, 29 Aug 2019 22:29:32 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 5/5] powerpc/perf: split callchain.c by bitness
Date: Fri, 30 Aug 2019 00:28:40 +0200
Message-Id: <c77eec3d99fd0251edf725a3d9e1b79f396eba6e.1567117050.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1567117050.git.msuchanek@suse.de>
References: <cover.1567117050.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Nicolai Stange <nstange@suse.de>, Allison Randal <allison@lohutok.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Joel Stanley <joel@jms.id.au>,
 Firoz Khan <firoz.khan@linaro.org>, Michal Suchanek <msuchanek@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Christian Brauner <christian@brauner.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building callchain.c with !COMPAT proved quite ugly with all the
defines. Splitting out the 32bit and 64bit parts looks better.

Also rewrite current_is_64bit as common function. No other code change
intended.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/powerpc/perf/Makefile       |   4 +
 arch/powerpc/perf/callchain.c    | 388 +------------------------------
 arch/powerpc/perf/callchain.h    |  11 +
 arch/powerpc/perf/callchain_32.c | 218 +++++++++++++++++
 arch/powerpc/perf/callchain_64.c | 185 +++++++++++++++
 5 files changed, 422 insertions(+), 384 deletions(-)
 create mode 100644 arch/powerpc/perf/callchain.h
 create mode 100644 arch/powerpc/perf/callchain_32.c
 create mode 100644 arch/powerpc/perf/callchain_64.c

diff --git a/arch/powerpc/perf/Makefile b/arch/powerpc/perf/Makefile
index c155dcbb8691..e9f3202251d0 100644
--- a/arch/powerpc/perf/Makefile
+++ b/arch/powerpc/perf/Makefile
@@ -1,6 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_PERF_EVENTS)	+= callchain.o perf_regs.o
+ifdef CONFIG_PERF_EVENTS
+obj-y				+= callchain_$(BITS).o
+obj-$(CONFIG_COMPAT)		+= callchain_32.o
+endif
 
 obj-$(CONFIG_PPC_PERF_CTRS)	+= core-book3s.o bhrb.o
 obj64-$(CONFIG_PPC_PERF_CTRS)	+= ppc970-pmu.o power5-pmu.o \
diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index 881be5c4e9bb..981005625c05 100644
--- a/arch/powerpc/perf/callchain.c
+++ b/arch/powerpc/perf/callchain.c
@@ -15,11 +15,9 @@
 #include <asm/sigcontext.h>
 #include <asm/ucontext.h>
 #include <asm/vdso.h>
-#ifdef CONFIG_COMPAT
-#include "../kernel/ppc32.h"
-#endif
 #include <asm/pte-walk.h>
 
+#include "callchain.h"
 
 /*
  * Is sp valid as the address of the next kernel stack frame after prev_sp?
@@ -102,188 +100,6 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 	}
 }
 
-#ifdef CONFIG_PPC64
-/*
- * On 64-bit we don't want to invoke hash_page on user addresses from
- * interrupt context, so if the access faults, we read the page tables
- * to find which page (if any) is mapped and access it directly.
- */
-static int read_user_stack_slow(void __user *ptr, void *buf, int nb)
-{
-	int ret = -EFAULT;
-	pgd_t *pgdir;
-	pte_t *ptep, pte;
-	unsigned shift;
-	unsigned long addr = (unsigned long) ptr;
-	unsigned long offset;
-	unsigned long pfn, flags;
-	void *kaddr;
-
-	pgdir = current->mm->pgd;
-	if (!pgdir)
-		return -EFAULT;
-
-	local_irq_save(flags);
-	ptep = find_current_mm_pte(pgdir, addr, NULL, &shift);
-	if (!ptep)
-		goto err_out;
-	if (!shift)
-		shift = PAGE_SHIFT;
-
-	/* align address to page boundary */
-	offset = addr & ((1UL << shift) - 1);
-
-	pte = READ_ONCE(*ptep);
-	if (!pte_present(pte) || !pte_user(pte))
-		goto err_out;
-	pfn = pte_pfn(pte);
-	if (!page_is_ram(pfn))
-		goto err_out;
-
-	/* no highmem to worry about here */
-	kaddr = pfn_to_kaddr(pfn);
-	memcpy(buf, kaddr + offset, nb);
-	ret = 0;
-err_out:
-	local_irq_restore(flags);
-	return ret;
-}
-
-static int read_user_stack_64(unsigned long __user *ptr, unsigned long *ret)
-{
-	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned long) ||
-	    ((unsigned long)ptr & 7))
-		return -EFAULT;
-
-	pagefault_disable();
-	if (!__get_user_inatomic(*ret, ptr)) {
-		pagefault_enable();
-		return 0;
-	}
-	pagefault_enable();
-
-	return read_user_stack_slow(ptr, ret, 8);
-}
-
-static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
-{
-	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
-	    ((unsigned long)ptr & 3))
-		return -EFAULT;
-
-	pagefault_disable();
-	if (!__get_user_inatomic(*ret, ptr)) {
-		pagefault_enable();
-		return 0;
-	}
-	pagefault_enable();
-
-	return read_user_stack_slow(ptr, ret, 4);
-}
-
-static inline int valid_user_sp(unsigned long sp, int is_64)
-{
-	if (!sp || (sp & 7) || sp > (is_64 ? TASK_SIZE : 0x100000000UL) - 32)
-		return 0;
-	return 1;
-}
-
-/*
- * 64-bit user processes use the same stack frame for RT and non-RT signals.
- */
-struct signal_frame_64 {
-	char		dummy[__SIGNAL_FRAMESIZE];
-	struct ucontext	uc;
-	unsigned long	unused[2];
-	unsigned int	tramp[6];
-	struct siginfo	*pinfo;
-	void		*puc;
-	struct siginfo	info;
-	char		abigap[288];
-};
-
-static int is_sigreturn_64_address(unsigned long nip, unsigned long fp)
-{
-	if (nip == fp + offsetof(struct signal_frame_64, tramp))
-		return 1;
-	if (vdso64_rt_sigtramp && current->mm->context.vdso_base &&
-	    nip == current->mm->context.vdso_base + vdso64_rt_sigtramp)
-		return 1;
-	return 0;
-}
-
-/*
- * Do some sanity checking on the signal frame pointed to by sp.
- * We check the pinfo and puc pointers in the frame.
- */
-static int sane_signal_64_frame(unsigned long sp)
-{
-	struct signal_frame_64 __user *sf;
-	unsigned long pinfo, puc;
-
-	sf = (struct signal_frame_64 __user *) sp;
-	if (read_user_stack_64((unsigned long __user *) &sf->pinfo, &pinfo) ||
-	    read_user_stack_64((unsigned long __user *) &sf->puc, &puc))
-		return 0;
-	return pinfo == (unsigned long) &sf->info &&
-		puc == (unsigned long) &sf->uc;
-}
-
-static void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
-				   struct pt_regs *regs)
-{
-	unsigned long sp, next_sp;
-	unsigned long next_ip;
-	unsigned long lr;
-	long level = 0;
-	struct signal_frame_64 __user *sigframe;
-	unsigned long __user *fp, *uregs;
-
-	next_ip = perf_instruction_pointer(regs);
-	lr = regs->link;
-	sp = regs->gpr[1];
-	perf_callchain_store(entry, next_ip);
-
-	while (entry->nr < entry->max_stack) {
-		fp = (unsigned long __user *) sp;
-		if (!valid_user_sp(sp, 1) || read_user_stack_64(fp, &next_sp))
-			return;
-		if (level > 0 && read_user_stack_64(&fp[2], &next_ip))
-			return;
-
-		/*
-		 * Note: the next_sp - sp >= signal frame size check
-		 * is true when next_sp < sp, which can happen when
-		 * transitioning from an alternate signal stack to the
-		 * normal stack.
-		 */
-		if (next_sp - sp >= sizeof(struct signal_frame_64) &&
-		    (is_sigreturn_64_address(next_ip, sp) ||
-		     (level <= 1 && is_sigreturn_64_address(lr, sp))) &&
-		    sane_signal_64_frame(sp)) {
-			/*
-			 * This looks like an signal frame
-			 */
-			sigframe = (struct signal_frame_64 __user *) sp;
-			uregs = sigframe->uc.uc_mcontext.gp_regs;
-			if (read_user_stack_64(&uregs[PT_NIP], &next_ip) ||
-			    read_user_stack_64(&uregs[PT_LNK], &lr) ||
-			    read_user_stack_64(&uregs[PT_R1], &sp))
-				return;
-			level = 0;
-			perf_callchain_store_context(entry, PERF_CONTEXT_USER);
-			perf_callchain_store(entry, next_ip);
-			continue;
-		}
-
-		if (level == 0)
-			next_ip = lr;
-		perf_callchain_store(entry, next_ip);
-		++level;
-		sp = next_sp;
-	}
-}
-
 static inline int current_is_64bit(void)
 {
 	/*
@@ -291,206 +107,10 @@ static inline int current_is_64bit(void)
 	 * interrupt stack, and the thread flags don't get copied over
 	 * from the thread_info on the main stack to the interrupt stack.
 	 */
-	return !IS_ENABLED(CONFIG_COMPAT) ||
-		!test_ti_thread_flag(task_thread_info(current), TIF_32BIT);
-}
-
-#else  /* CONFIG_PPC64 */
-/*
- * On 32-bit we just access the address and let hash_page create a
- * HPTE if necessary, so there is no need to fall back to reading
- * the page tables.  Since this is called at interrupt level,
- * do_page_fault() won't treat a DSI as a page fault.
- */
-static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
-{
-	int rc;
-
-	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
-	    ((unsigned long)ptr & 3))
-		return -EFAULT;
-
-	pagefault_disable();
-	rc = __get_user_inatomic(*ret, ptr);
-	pagefault_enable();
-
-	return rc;
-}
-
-static inline void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
-					  struct pt_regs *regs)
-{
-}
-
-static inline int current_is_64bit(void)
-{
-	return 0;
-}
-
-static inline int valid_user_sp(unsigned long sp, int is_64)
-{
-	if (!sp || (sp & 7) || sp > TASK_SIZE - 32)
-		return 0;
-	return 1;
-}
-
-#define __SIGNAL_FRAMESIZE32	__SIGNAL_FRAMESIZE
-#define sigcontext32		sigcontext
-#define mcontext32		mcontext
-#define ucontext32		ucontext
-#define compat_siginfo_t	struct siginfo
-
-#endif /* CONFIG_PPC64 */
-
-#if defined(CONFIG_PPC32) || defined(CONFIG_COMPAT)
-/*
- * Layout for non-RT signal frames
- */
-struct signal_frame_32 {
-	char			dummy[__SIGNAL_FRAMESIZE32];
-	struct sigcontext32	sctx;
-	struct mcontext32	mctx;
-	int			abigap[56];
-};
-
-/*
- * Layout for RT signal frames
- */
-struct rt_signal_frame_32 {
-	char			dummy[__SIGNAL_FRAMESIZE32 + 16];
-	compat_siginfo_t	info;
-	struct ucontext32	uc;
-	int			abigap[56];
-};
-
-static int is_sigreturn_32_address(unsigned int nip, unsigned int fp)
-{
-	if (nip == fp + offsetof(struct signal_frame_32, mctx.mc_pad))
-		return 1;
-	if (vdso32_sigtramp && current->mm->context.vdso_base &&
-	    nip == current->mm->context.vdso_base + vdso32_sigtramp)
-		return 1;
-	return 0;
-}
-
-static int is_rt_sigreturn_32_address(unsigned int nip, unsigned int fp)
-{
-	if (nip == fp + offsetof(struct rt_signal_frame_32,
-				 uc.uc_mcontext.mc_pad))
-		return 1;
-	if (vdso32_rt_sigtramp && current->mm->context.vdso_base &&
-	    nip == current->mm->context.vdso_base + vdso32_rt_sigtramp)
-		return 1;
-	return 0;
-}
-
-static int sane_signal_32_frame(unsigned int sp)
-{
-	struct signal_frame_32 __user *sf;
-	unsigned int regs;
-
-	sf = (struct signal_frame_32 __user *) (unsigned long) sp;
-	if (read_user_stack_32((unsigned int __user *) &sf->sctx.regs, &regs))
-		return 0;
-	return regs == (unsigned long) &sf->mctx;
-}
-
-static int sane_rt_signal_32_frame(unsigned int sp)
-{
-	struct rt_signal_frame_32 __user *sf;
-	unsigned int regs;
-
-	sf = (struct rt_signal_frame_32 __user *) (unsigned long) sp;
-	if (read_user_stack_32((unsigned int __user *) &sf->uc.uc_regs, &regs))
-		return 0;
-	return regs == (unsigned long) &sf->uc.uc_mcontext;
-}
-
-static unsigned int __user *signal_frame_32_regs(unsigned int sp,
-				unsigned int next_sp, unsigned int next_ip)
-{
-	struct mcontext32 __user *mctx = NULL;
-	struct signal_frame_32 __user *sf;
-	struct rt_signal_frame_32 __user *rt_sf;
-
-	/*
-	 * Note: the next_sp - sp >= signal frame size check
-	 * is true when next_sp < sp, for example, when
-	 * transitioning from an alternate signal stack to the
-	 * normal stack.
-	 */
-	if (next_sp - sp >= sizeof(struct signal_frame_32) &&
-	    is_sigreturn_32_address(next_ip, sp) &&
-	    sane_signal_32_frame(sp)) {
-		sf = (struct signal_frame_32 __user *) (unsigned long) sp;
-		mctx = &sf->mctx;
-	}
-
-	if (!mctx && next_sp - sp >= sizeof(struct rt_signal_frame_32) &&
-	    is_rt_sigreturn_32_address(next_ip, sp) &&
-	    sane_rt_signal_32_frame(sp)) {
-		rt_sf = (struct rt_signal_frame_32 __user *) (unsigned long) sp;
-		mctx = &rt_sf->uc.uc_mcontext;
-	}
-
-	if (!mctx)
-		return NULL;
-	return mctx->mc_gregs;
-}
-
-static void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
-				   struct pt_regs *regs)
-{
-	unsigned int sp, next_sp;
-	unsigned int next_ip;
-	unsigned int lr;
-	long level = 0;
-	unsigned int __user *fp, *uregs;
-
-	next_ip = perf_instruction_pointer(regs);
-	lr = regs->link;
-	sp = regs->gpr[1];
-	perf_callchain_store(entry, next_ip);
-
-	while (entry->nr < entry->max_stack) {
-		fp = (unsigned int __user *) (unsigned long) sp;
-		if (!valid_user_sp(sp, 0) || read_user_stack_32(fp, &next_sp))
-			return;
-		if (level > 0 && read_user_stack_32(&fp[1], &next_ip))
-			return;
-
-		uregs = signal_frame_32_regs(sp, next_sp, next_ip);
-		if (!uregs && level <= 1)
-			uregs = signal_frame_32_regs(sp, next_sp, lr);
-		if (uregs) {
-			/*
-			 * This looks like an signal frame, so restart
-			 * the stack trace with the values in it.
-			 */
-			if (read_user_stack_32(&uregs[PT_NIP], &next_ip) ||
-			    read_user_stack_32(&uregs[PT_LNK], &lr) ||
-			    read_user_stack_32(&uregs[PT_R1], &sp))
-				return;
-			level = 0;
-			perf_callchain_store_context(entry, PERF_CONTEXT_USER);
-			perf_callchain_store(entry, next_ip);
-			continue;
-		}
-
-		if (level == 0)
-			next_ip = lr;
-		perf_callchain_store(entry, next_ip);
-		++level;
-		sp = next_sp;
-	}
-}
-#else /* 32bit */
-static void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
-				   struct pt_regs *regs)
-{
-	(void)&read_user_stack_32; /* unused if !COMPAT */
+	if (IS_ENABLED(CONFIG_COMPAT))
+		return !test_ti_thread_flag(task_thread_info(current), TIF_32BIT);
+	return IS_ENABLED(CONFIG_PPC64);
 }
-#endif /* 32bit */
 
 void
 perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
diff --git a/arch/powerpc/perf/callchain.h b/arch/powerpc/perf/callchain.h
new file mode 100644
index 000000000000..168b01ca1091
--- /dev/null
+++ b/arch/powerpc/perf/callchain.h
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#ifndef _POWERPC_PERF_CALLCHAIN_H
+#define _POWERPC_PERF_CALLCHAIN_H
+
+int read_user_stack_slow(void __user *ptr, void *buf, int nb);
+void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
+			    struct pt_regs *regs);
+void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
+			    struct pt_regs *regs);
+
+#endif /* _POWERPC_PERF_CALLCHAIN_H */
diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
new file mode 100644
index 000000000000..0bd4484eddaa
--- /dev/null
+++ b/arch/powerpc/perf/callchain_32.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Performance counter callchain support - powerpc architecture code
+ *
+ * Copyright © 2009 Paul Mackerras, IBM Corporation.
+ */
+#include <linux/kernel.h>
+#include <linux/sched.h>
+#include <linux/perf_event.h>
+#include <linux/percpu.h>
+#include <linux/uaccess.h>
+#include <linux/mm.h>
+#include <asm/ptrace.h>
+#include <asm/pgtable.h>
+#include <asm/sigcontext.h>
+#include <asm/ucontext.h>
+#include <asm/vdso.h>
+#ifdef CONFIG_PPC64
+#include "../kernel/ppc32.h"
+#endif
+#include <asm/pte-walk.h>
+
+#include "callchain.h"
+
+#ifdef CONFIG_PPC64
+static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
+{
+	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
+	    ((unsigned long)ptr & 3))
+		return -EFAULT;
+
+	pagefault_disable();
+	if (!__get_user_inatomic(*ret, ptr)) {
+		pagefault_enable();
+		return 0;
+	}
+	pagefault_enable();
+
+	return read_user_stack_slow(ptr, ret, 4);
+}
+#else /* CONFIG_PPC64 */
+/*
+ * On 32-bit we just access the address and let hash_page create a
+ * HPTE if necessary, so there is no need to fall back to reading
+ * the page tables.  Since this is called at interrupt level,
+ * do_page_fault() won't treat a DSI as a page fault.
+ */
+static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
+{
+	int rc;
+
+	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
+	    ((unsigned long)ptr & 3))
+		return -EFAULT;
+
+	pagefault_disable();
+	rc = __get_user_inatomic(*ret, ptr);
+	pagefault_enable();
+
+	return rc;
+}
+
+#define __SIGNAL_FRAMESIZE32	__SIGNAL_FRAMESIZE
+#define sigcontext32		sigcontext
+#define mcontext32		mcontext
+#define ucontext32		ucontext
+#define compat_siginfo_t	struct siginfo
+
+#endif /* CONFIG_PPC64 */
+
+static inline int valid_user_sp(unsigned long sp, int is_64)
+{
+	if (!sp || (sp & 7) || sp > TASK_SIZE - 32)
+		return 0;
+	return 1;
+}
+
+/*
+ * Layout for non-RT signal frames
+ */
+struct signal_frame_32 {
+	char			dummy[__SIGNAL_FRAMESIZE32];
+	struct sigcontext32	sctx;
+	struct mcontext32	mctx;
+	int			abigap[56];
+};
+
+/*
+ * Layout for RT signal frames
+ */
+struct rt_signal_frame_32 {
+	char			dummy[__SIGNAL_FRAMESIZE32 + 16];
+	compat_siginfo_t	info;
+	struct ucontext32	uc;
+	int			abigap[56];
+};
+
+static int is_sigreturn_32_address(unsigned int nip, unsigned int fp)
+{
+	if (nip == fp + offsetof(struct signal_frame_32, mctx.mc_pad))
+		return 1;
+	if (vdso32_sigtramp && current->mm->context.vdso_base &&
+	    nip == current->mm->context.vdso_base + vdso32_sigtramp)
+		return 1;
+	return 0;
+}
+
+static int is_rt_sigreturn_32_address(unsigned int nip, unsigned int fp)
+{
+	if (nip == fp + offsetof(struct rt_signal_frame_32,
+				 uc.uc_mcontext.mc_pad))
+		return 1;
+	if (vdso32_rt_sigtramp && current->mm->context.vdso_base &&
+	    nip == current->mm->context.vdso_base + vdso32_rt_sigtramp)
+		return 1;
+	return 0;
+}
+
+static int sane_signal_32_frame(unsigned int sp)
+{
+	struct signal_frame_32 __user *sf;
+	unsigned int regs;
+
+	sf = (struct signal_frame_32 __user *) (unsigned long) sp;
+	if (read_user_stack_32((unsigned int __user *) &sf->sctx.regs, &regs))
+		return 0;
+	return regs == (unsigned long) &sf->mctx;
+}
+
+static int sane_rt_signal_32_frame(unsigned int sp)
+{
+	struct rt_signal_frame_32 __user *sf;
+	unsigned int regs;
+
+	sf = (struct rt_signal_frame_32 __user *) (unsigned long) sp;
+	if (read_user_stack_32((unsigned int __user *) &sf->uc.uc_regs, &regs))
+		return 0;
+	return regs == (unsigned long) &sf->uc.uc_mcontext;
+}
+
+static unsigned int __user *signal_frame_32_regs(unsigned int sp,
+				unsigned int next_sp, unsigned int next_ip)
+{
+	struct mcontext32 __user *mctx = NULL;
+	struct signal_frame_32 __user *sf;
+	struct rt_signal_frame_32 __user *rt_sf;
+
+	/*
+	 * Note: the next_sp - sp >= signal frame size check
+	 * is true when next_sp < sp, for example, when
+	 * transitioning from an alternate signal stack to the
+	 * normal stack.
+	 */
+	if (next_sp - sp >= sizeof(struct signal_frame_32) &&
+	    is_sigreturn_32_address(next_ip, sp) &&
+	    sane_signal_32_frame(sp)) {
+		sf = (struct signal_frame_32 __user *) (unsigned long) sp;
+		mctx = &sf->mctx;
+	}
+
+	if (!mctx && next_sp - sp >= sizeof(struct rt_signal_frame_32) &&
+	    is_rt_sigreturn_32_address(next_ip, sp) &&
+	    sane_rt_signal_32_frame(sp)) {
+		rt_sf = (struct rt_signal_frame_32 __user *) (unsigned long) sp;
+		mctx = &rt_sf->uc.uc_mcontext;
+	}
+
+	if (!mctx)
+		return NULL;
+	return mctx->mc_gregs;
+}
+
+void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
+			    struct pt_regs *regs)
+{
+	unsigned int sp, next_sp;
+	unsigned int next_ip;
+	unsigned int lr;
+	long level = 0;
+	unsigned int __user *fp, *uregs;
+
+	next_ip = perf_instruction_pointer(regs);
+	lr = regs->link;
+	sp = regs->gpr[1];
+	perf_callchain_store(entry, next_ip);
+
+	while (entry->nr < entry->max_stack) {
+		fp = (unsigned int __user *) (unsigned long) sp;
+		if (!valid_user_sp(sp, 0) || read_user_stack_32(fp, &next_sp))
+			return;
+		if (level > 0 && read_user_stack_32(&fp[1], &next_ip))
+			return;
+
+		uregs = signal_frame_32_regs(sp, next_sp, next_ip);
+		if (!uregs && level <= 1)
+			uregs = signal_frame_32_regs(sp, next_sp, lr);
+		if (uregs) {
+			/*
+			 * This looks like an signal frame, so restart
+			 * the stack trace with the values in it.
+			 */
+			if (read_user_stack_32(&uregs[PT_NIP], &next_ip) ||
+			    read_user_stack_32(&uregs[PT_LNK], &lr) ||
+			    read_user_stack_32(&uregs[PT_R1], &sp))
+				return;
+			level = 0;
+			perf_callchain_store_context(entry, PERF_CONTEXT_USER);
+			perf_callchain_store(entry, next_ip);
+			continue;
+		}
+
+		if (level == 0)
+			next_ip = lr;
+		perf_callchain_store(entry, next_ip);
+		++level;
+		sp = next_sp;
+	}
+}
diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
new file mode 100644
index 000000000000..a37c42890415
--- /dev/null
+++ b/arch/powerpc/perf/callchain_64.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Performance counter callchain support - powerpc architecture code
+ *
+ * Copyright © 2009 Paul Mackerras, IBM Corporation.
+ */
+#include <linux/kernel.h>
+#include <linux/sched.h>
+#include <linux/perf_event.h>
+#include <linux/percpu.h>
+#include <linux/uaccess.h>
+#include <linux/mm.h>
+#include <asm/ptrace.h>
+#include <asm/pgtable.h>
+#include <asm/sigcontext.h>
+#include <asm/ucontext.h>
+#include <asm/vdso.h>
+#include <asm/pte-walk.h>
+
+#include "callchain.h"
+
+/*
+ * On 64-bit we don't want to invoke hash_page on user addresses from
+ * interrupt context, so if the access faults, we read the page tables
+ * to find which page (if any) is mapped and access it directly.
+ */
+int read_user_stack_slow(void __user *ptr, void *buf, int nb)
+{
+	int ret = -EFAULT;
+	pgd_t *pgdir;
+	pte_t *ptep, pte;
+	unsigned shift;
+	unsigned long addr = (unsigned long) ptr;
+	unsigned long offset;
+	unsigned long pfn, flags;
+	void *kaddr;
+
+	pgdir = current->mm->pgd;
+	if (!pgdir)
+		return -EFAULT;
+
+	local_irq_save(flags);
+	ptep = find_current_mm_pte(pgdir, addr, NULL, &shift);
+	if (!ptep)
+		goto err_out;
+	if (!shift)
+		shift = PAGE_SHIFT;
+
+	/* align address to page boundary */
+	offset = addr & ((1UL << shift) - 1);
+
+	pte = READ_ONCE(*ptep);
+	if (!pte_present(pte) || !pte_user(pte))
+		goto err_out;
+	pfn = pte_pfn(pte);
+	if (!page_is_ram(pfn))
+		goto err_out;
+
+	/* no highmem to worry about here */
+	kaddr = pfn_to_kaddr(pfn);
+	memcpy(buf, kaddr + offset, nb);
+	ret = 0;
+err_out:
+	local_irq_restore(flags);
+	return ret;
+}
+
+static int read_user_stack_64(unsigned long __user *ptr, unsigned long *ret)
+{
+	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned long) ||
+	    ((unsigned long)ptr & 7))
+		return -EFAULT;
+
+	pagefault_disable();
+	if (!__get_user_inatomic(*ret, ptr)) {
+		pagefault_enable();
+		return 0;
+	}
+	pagefault_enable();
+
+	return read_user_stack_slow(ptr, ret, 8);
+}
+
+static inline int valid_user_sp(unsigned long sp, int is_64)
+{
+	if (!sp || (sp & 7) || sp > (is_64 ? TASK_SIZE : 0x100000000UL) - 32)
+		return 0;
+	return 1;
+}
+
+/*
+ * 64-bit user processes use the same stack frame for RT and non-RT signals.
+ */
+struct signal_frame_64 {
+	char		dummy[__SIGNAL_FRAMESIZE];
+	struct ucontext	uc;
+	unsigned long	unused[2];
+	unsigned int	tramp[6];
+	struct siginfo	*pinfo;
+	void		*puc;
+	struct siginfo	info;
+	char		abigap[288];
+};
+
+static int is_sigreturn_64_address(unsigned long nip, unsigned long fp)
+{
+	if (nip == fp + offsetof(struct signal_frame_64, tramp))
+		return 1;
+	if (vdso64_rt_sigtramp && current->mm->context.vdso_base &&
+	    nip == current->mm->context.vdso_base + vdso64_rt_sigtramp)
+		return 1;
+	return 0;
+}
+
+/*
+ * Do some sanity checking on the signal frame pointed to by sp.
+ * We check the pinfo and puc pointers in the frame.
+ */
+static int sane_signal_64_frame(unsigned long sp)
+{
+	struct signal_frame_64 __user *sf;
+	unsigned long pinfo, puc;
+
+	sf = (struct signal_frame_64 __user *) sp;
+	if (read_user_stack_64((unsigned long __user *) &sf->pinfo, &pinfo) ||
+	    read_user_stack_64((unsigned long __user *) &sf->puc, &puc))
+		return 0;
+	return pinfo == (unsigned long) &sf->info &&
+		puc == (unsigned long) &sf->uc;
+}
+
+void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
+			    struct pt_regs *regs)
+{
+	unsigned long sp, next_sp;
+	unsigned long next_ip;
+	unsigned long lr;
+	long level = 0;
+	struct signal_frame_64 __user *sigframe;
+	unsigned long __user *fp, *uregs;
+
+	next_ip = perf_instruction_pointer(regs);
+	lr = regs->link;
+	sp = regs->gpr[1];
+	perf_callchain_store(entry, next_ip);
+
+	while (entry->nr < entry->max_stack) {
+		fp = (unsigned long __user *) sp;
+		if (!valid_user_sp(sp, 1) || read_user_stack_64(fp, &next_sp))
+			return;
+		if (level > 0 && read_user_stack_64(&fp[2], &next_ip))
+			return;
+
+		/*
+		 * Note: the next_sp - sp >= signal frame size check
+		 * is true when next_sp < sp, which can happen when
+		 * transitioning from an alternate signal stack to the
+		 * normal stack.
+		 */
+		if (next_sp - sp >= sizeof(struct signal_frame_64) &&
+		    (is_sigreturn_64_address(next_ip, sp) ||
+		     (level <= 1 && is_sigreturn_64_address(lr, sp))) &&
+		    sane_signal_64_frame(sp)) {
+			/*
+			 * This looks like an signal frame
+			 */
+			sigframe = (struct signal_frame_64 __user *) sp;
+			uregs = sigframe->uc.uc_mcontext.gp_regs;
+			if (read_user_stack_64(&uregs[PT_NIP], &next_ip) ||
+			    read_user_stack_64(&uregs[PT_LNK], &lr) ||
+			    read_user_stack_64(&uregs[PT_R1], &sp))
+				return;
+			level = 0;
+			perf_callchain_store_context(entry, PERF_CONTEXT_USER);
+			perf_callchain_store(entry, next_ip);
+			continue;
+		}
+
+		if (level == 0)
+			next_ip = lr;
+		perf_callchain_store(entry, next_ip);
+		++level;
+		sp = next_sp;
+	}
+}
-- 
2.22.0

