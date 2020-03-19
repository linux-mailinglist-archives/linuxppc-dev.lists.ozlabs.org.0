Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DA118B39F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 13:41:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jmjN4SkyzDrMF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 23:40:56 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jmF44cVpzDqLX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 23:19:52 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C5744B221;
 Thu, 19 Mar 2020 12:19:49 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v11 7/8] powerpc/perf: split callchain.c by bitness
Date: Thu, 19 Mar 2020 13:19:35 +0100
Message-Id: <1ac88fa977c71b449ede13ea609d255445016674.1584620202.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1584620202.git.msuchanek@suse.de>
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <cover.1584620202.git.msuchanek@suse.de>
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

Building callchain.c with !COMPAT proved quite ugly with all the
defines. Splitting out the 32bit and 64bit parts looks better.

No code change intended.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
v6:
 - move current_is_64bit consolidetaion to earlier patch
 - move defines to the top of callchain_32.c
 - Makefile cleanup
v8:
 - fix valid_user_sp
v11:
 - rebase on top of def0bfdbd603
---
 arch/powerpc/perf/Makefile       |   5 +-
 arch/powerpc/perf/callchain.c    | 357 +------------------------------
 arch/powerpc/perf/callchain.h    |  20 ++
 arch/powerpc/perf/callchain_32.c | 196 +++++++++++++++++
 arch/powerpc/perf/callchain_64.c | 174 +++++++++++++++
 5 files changed, 395 insertions(+), 357 deletions(-)
 create mode 100644 arch/powerpc/perf/callchain.h
 create mode 100644 arch/powerpc/perf/callchain_32.c
 create mode 100644 arch/powerpc/perf/callchain_64.c

diff --git a/arch/powerpc/perf/Makefile b/arch/powerpc/perf/Makefile
index c155dcbb8691..53d614e98537 100644
--- a/arch/powerpc/perf/Makefile
+++ b/arch/powerpc/perf/Makefile
@@ -1,6 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_PERF_EVENTS)	+= callchain.o perf_regs.o
+obj-$(CONFIG_PERF_EVENTS)	+= callchain.o callchain_$(BITS).o perf_regs.o
+ifdef CONFIG_COMPAT
+obj-$(CONFIG_PERF_EVENTS)	+= callchain_32.o
+endif
 
 obj-$(CONFIG_PPC_PERF_CTRS)	+= core-book3s.o bhrb.o
 obj64-$(CONFIG_PPC_PERF_CTRS)	+= ppc970-pmu.o power5-pmu.o \
diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index 8a274bd523b1..dd5051015008 100644
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
@@ -102,359 +100,6 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 	}
 }
 
-static inline int valid_user_sp(unsigned long sp)
-{
-	bool is_64 = !is_32bit_task();
-
-	if (!sp || (sp & (is_64 ? 7 : 3)) || sp > STACK_TOP - (is_64 ? 32 : 16))
-		return 0;
-	return 1;
-}
-
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
-	if (!probe_user_read(ret, ptr, sizeof(*ret)))
-		return 0;
-
-	return read_user_stack_slow(ptr, ret, 8);
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
-		if (!valid_user_sp(sp) || read_user_stack_64(fp, &next_sp))
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
-#else  /* CONFIG_PPC64 */
-static int read_user_stack_slow(void __user *ptr, void *buf, int nb)
-{
-	return 0;
-}
-
-static inline void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
-					  struct pt_regs *regs)
-{
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
-	rc = probe_user_read(ret, ptr, sizeof(*ret));
-
-	if (IS_ENABLED(CONFIG_PPC64) && rc)
-		return read_user_stack_slow(ptr, ret, 4);
-
-	return rc;
-}
-
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
-		if (!valid_user_sp(sp) || read_user_stack_32(fp, &next_sp))
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
-{}
-#endif /* 32bit */
-
 void
 perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
 {
diff --git a/arch/powerpc/perf/callchain.h b/arch/powerpc/perf/callchain.h
new file mode 100644
index 000000000000..8631a96d627d
--- /dev/null
+++ b/arch/powerpc/perf/callchain.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _POWERPC_PERF_CALLCHAIN_H
+#define _POWERPC_PERF_CALLCHAIN_H
+
+int read_user_stack_slow(void __user *ptr, void *buf, int nb);
+void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
+			    struct pt_regs *regs);
+void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
+			    struct pt_regs *regs);
+
+static inline int valid_user_sp(unsigned long sp)
+{
+	bool is_64 = !is_32bit_task();
+
+	if (!sp || (sp & (is_64 ? 7 : 3)) || sp > STACK_TOP - (is_64 ? 32 : 16))
+		return 0;
+	return 1;
+}
+
+#endif /* _POWERPC_PERF_CALLCHAIN_H */
diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
new file mode 100644
index 000000000000..25729c651cb2
--- /dev/null
+++ b/arch/powerpc/perf/callchain_32.c
@@ -0,0 +1,196 @@
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
+#ifdef CONFIG_PPC64
+#include "../kernel/ppc32.h"
+#else  /* CONFIG_PPC64 */
+
+#define __SIGNAL_FRAMESIZE32	__SIGNAL_FRAMESIZE
+#define sigcontext32		sigcontext
+#define mcontext32		mcontext
+#define ucontext32		ucontext
+#define compat_siginfo_t	struct siginfo
+
+#endif /* CONFIG_PPC64 */
+
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
+	rc = probe_user_read(ret, ptr, sizeof(*ret));
+
+	if (IS_ENABLED(CONFIG_PPC64) && rc)
+		return read_user_stack_slow(ptr, ret, 4);
+
+	return rc;
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
+		if (!valid_user_sp(sp) || read_user_stack_32(fp, &next_sp))
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
index 000000000000..7e8eed59dd18
--- /dev/null
+++ b/arch/powerpc/perf/callchain_64.c
@@ -0,0 +1,174 @@
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
+	unsigned int shift;
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
+	if (!probe_user_read(ret, ptr, sizeof(*ret)))
+		return 0;
+
+	return read_user_stack_slow(ptr, ret, 8);
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
+		if (!valid_user_sp(sp) || read_user_stack_64(fp, &next_sp))
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
2.23.0

