Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 597CC911AC9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 07:58:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W569Y6zwpz3d39
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 15:58:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=114.132.58.6; helo=bg1.exmail.qq.com; envelope-from=jialong.yang@shingroup.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 332 seconds by postgrey-1.37 at boromir; Thu, 20 Jun 2024 18:58:32 AEST
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.58.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4ZCX5v7Lz30V2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 18:58:32 +1000 (AEST)
X-QQ-mid: bizesmtpsz3t1718873504tk7r6c7
X-QQ-Originating-IP: uJcI5MomMjjakxmyI5YfDPhxD4NzcVGKWfbA0I+f5xo=
Received: from HX01040022.powercore.com.cn ( [223.112.234.130])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 20 Jun 2024 16:51:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 787696607546443104
From: Jialong Yang <jialong.yang@shingroup.cn>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: [PATCH v1 1/2] powerpc/mmiotrace: Add MMIO Tracing tool for PowerPC
Date: Thu, 20 Jun 2024 16:51:17 +0800
Message-Id: <2bf90acf7d29641ba6643934ff8dbba897dbd2d9.1718873074.git.jialong.yang@shingroup.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz6a-1
X-Mailman-Approved-At: Fri, 21 Jun 2024 15:58:23 +1000
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
Cc: shenghui.qu@shingroup.cn, luming.yu@shingroup.cn, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Jialong Yang <jialong.yang@shingroup.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mmiotrace is a useful tool to trace MMIO accesses. Nowadays, it only
supported on x86 and x86_64 platforms. Here is a support for powerpc.
The manual is located at Documentation/trace/mmiotrace.rst which means
I have not changed user API. People will be easy to use it.
Almost all files are copied from x86/mm, there are only some
differences from hardware and architectures software.

LINK: https://lore.kernel.org/lkml/20080127195536.50809974@daedalus.pq.iki.fi/

Signed-off-by: Jialong Yang <jialong.yang@shingroup.cn>
---
 arch/powerpc/Kconfig.debug       |   3 +
 arch/powerpc/mm/Makefile         |   1 +
 arch/powerpc/mm/kmmio.c          | 649 +++++++++++++++++++++++++++++++
 arch/powerpc/mm/mmio-mod.c       | 414 ++++++++++++++++++++
 arch/powerpc/mm/mmiotrace_arch.c | 149 +++++++
 arch/powerpc/mm/mmiotrace_arch.h |  25 ++
 arch/powerpc/mm/pf_in.c          | 185 +++++++++
 arch/powerpc/mm/pf_in.h          |  33 ++
 8 files changed, 1459 insertions(+)
 create mode 100644 arch/powerpc/mm/kmmio.c
 create mode 100644 arch/powerpc/mm/mmio-mod.c
 create mode 100644 arch/powerpc/mm/mmiotrace_arch.c
 create mode 100644 arch/powerpc/mm/mmiotrace_arch.h
 create mode 100644 arch/powerpc/mm/pf_in.c
 create mode 100644 arch/powerpc/mm/pf_in.h

diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index 8c80b154e814..8a69188aa75a 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -1,5 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
+config HAVE_MMIOTRACE_SUPPORT
+	def_bool y
+
 config PPC_DISABLE_WERROR
 	bool "Don't build arch/powerpc code with -Werror"
 	help
diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
index 0fe2f085c05a..cb92049f1239 100644
--- a/arch/powerpc/mm/Makefile
+++ b/arch/powerpc/mm/Makefile
@@ -17,3 +17,4 @@ obj-$(CONFIG_NOT_COHERENT_CACHE) += dma-noncoherent.o
 obj-$(CONFIG_PPC_COPRO_BASE)	+= copro_fault.o
 obj-$(CONFIG_PTDUMP_CORE)	+= ptdump/
 obj-$(CONFIG_KASAN)		+= kasan/
+obj-$(CONFIG_MMIOTRACE) += kmmio.o mmio-mod.o pf_in.o mmiotrace_arch.o
diff --git a/arch/powerpc/mm/kmmio.c b/arch/powerpc/mm/kmmio.c
new file mode 100644
index 000000000000..f4374e721b37
--- /dev/null
+++ b/arch/powerpc/mm/kmmio.c
@@ -0,0 +1,649 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Support for MMIO probes.
+ * Derived from arch/x86/mm/kmmio.c:
+ *   Copyright (C) 2024 Jialong Yang (jialong.yang@shingroup.cn)
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/list.h>
+#include <linux/rculist.h>
+#include <linux/spinlock.h>
+#include <linux/hash.h>
+#include <linux/export.h>
+#include <linux/kernel.h>
+#include <linux/uaccess.h>
+#include <linux/ptrace.h>
+#include <linux/preempt.h>
+#include <linux/percpu.h>
+#include <linux/kdebug.h>
+#include <linux/mutex.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <asm/cacheflush.h>
+#include <asm/tlbflush.h>
+#include <asm/paca.h>
+#include <linux/errno.h>
+#include <linux/mmiotrace.h>
+
+#include "mmiotrace_arch.h"
+
+typedef unsigned long	pteval_t;
+typedef unsigned long	pmdval_t;
+
+#define KMMIO_PAGE_HASH_BITS 4
+#define KMMIO_PAGE_TABLE_SIZE (1 << KMMIO_PAGE_HASH_BITS)
+
+struct kmmio_fault_page {
+	struct list_head list;
+	struct kmmio_fault_page *release_next;
+	unsigned long addr; /* the requested address */
+	pteval_t old_presence; /* page presence prior to arming */
+	bool armed;
+
+	/*
+	 * Number of times this page has been registered as a part
+	 * of a probe. If zero, page is disarmed and this may be freed.
+	 * Used only by writers (RCU) and post_kmmio_handler().
+	 * Protected by kmmio_lock, when linked into kmmio_page_table.
+	 */
+	int count;
+
+	bool scheduled_for_release;
+};
+
+struct kmmio_delayed_release {
+	struct rcu_head rcu;
+	struct kmmio_fault_page *release_list;
+};
+
+struct kmmio_context {
+	struct kmmio_fault_page *fpage;
+	struct kmmio_probe *probe;
+	unsigned long saved_flags;
+	unsigned long saved_softe;
+	unsigned long addr;
+	int active;
+};
+
+/*
+ * The kmmio_lock is taken in int3 context, which is treated as NMI context.
+ * This causes lockdep to complain about it bein in both NMI and normal
+ * context. Hide it from lockdep, as it should not have any other locks
+ * taken under it, and this is only enabled for debugging mmio anyway.
+ */
+static arch_spinlock_t kmmio_lock = __ARCH_SPIN_LOCK_UNLOCKED;
+
+/* Protected by kmmio_lock */
+unsigned int kmmio_count;
+
+/* Read-protected by RCU, write-protected by kmmio_lock. */
+static struct list_head kmmio_page_table[KMMIO_PAGE_TABLE_SIZE];
+static LIST_HEAD(kmmio_probes);
+
+static struct list_head *kmmio_page_list(unsigned long addr)
+{
+	unsigned int l;
+	pte_t *pte = lookup_address(addr, &l);
+
+	if (!pte)
+		return NULL;
+	addr &= page_level_mask(l);
+
+	return &kmmio_page_table[hash_long(addr, KMMIO_PAGE_HASH_BITS)];
+}
+
+/* Accessed per-cpu */
+static DEFINE_PER_CPU(struct kmmio_context, kmmio_ctx);
+
+/*
+ * this is basically a dynamic stabbing problem:
+ * Could use the existing prio tree code or
+ * Possible better implementations:
+ * The Interval Skip List: A Data Structure for Finding All Intervals That
+ * Overlap a Point (might be simple)
+ * Space Efficient Dynamic Stabbing with Fast Queries - Mikkel Thorup
+ */
+/* Get the kmmio at this addr (if any). You must be holding RCU read lock. */
+static struct kmmio_probe *get_kmmio_probe(unsigned long addr)
+{
+	struct kmmio_probe *p;
+
+	list_for_each_entry_rcu(p, &kmmio_probes, list) {
+		if (addr >= p->addr && addr < (p->addr + p->len))
+			return p;
+	}
+	return NULL;
+}
+
+/* You must be holding RCU read lock. */
+static struct kmmio_fault_page *get_kmmio_fault_page(unsigned long addr)
+{
+	struct list_head *head;
+	struct kmmio_fault_page *f;
+	unsigned int l;
+	pte_t *pte = lookup_address(addr, &l);
+
+	if (!pte)
+		return NULL;
+	addr &= page_level_mask(l);
+	head = kmmio_page_list(addr);
+	list_for_each_entry_rcu(f, head, list) {
+		if (f->addr == addr)
+			return f;
+	}
+	return NULL;
+}
+
+static inline pmd_t pmd_mkinvalid(pmd_t pmd)
+{
+	return __pmd_raw(pmd_raw(pmd) & ~cpu_to_be64(_PAGE_PRESENT | _PAGE_INVALID));
+}
+
+static void clear_pmd_presence(pmd_t *pmd, bool clear, pmdval_t *old)
+{
+	pmd_t new_pmd;
+	pmdval_t v = pmd_val(*pmd);
+
+	if (clear) {
+		*old = v;
+		new_pmd = pmd_mkinvalid(*pmd);
+	} else {
+		/* Presume this has been called with clear==true previously */
+		new_pmd = __pmd(*old);
+	}
+	*pmd = new_pmd;
+}
+
+static void clear_pte_presence(pte_t *pte, bool clear, pteval_t *old, unsigned long addr)
+{
+	pteval_t v = pte_val(*pte);
+
+	if (clear) {
+		*old = v;
+		/* Nothing should care about address */
+		pte_clear(&init_mm, addr, pte);
+	} else {
+		/* Presume this has been called with clear==true previously */
+		set_pte_at(&init_mm, addr, pte, __pte(*old));
+	}
+}
+
+static int clear_page_presence(struct kmmio_fault_page *f, bool clear)
+{
+	unsigned int level;
+	pte_t *pte = lookup_address(f->addr, &level);
+
+	if (!pte) {
+		pr_err("no pte for addr 0x%08lx\n", f->addr);
+		return -1;
+	}
+
+	if (level == PMD_SHIFT)
+		clear_pmd_presence((pmd_t *)pte, clear, &f->old_presence);
+	else if (level == PAGE_SHIFT)
+		clear_pte_presence(pte, clear, &f->old_presence, f->addr);
+	else {
+		pr_err("unexpected page level 0x%x.\n", level);
+		return -1;
+	}
+
+	mmap_read_lock(&init_mm);
+	struct vm_area_struct *vma = find_vma(&init_mm, f->addr);
+
+	mmap_read_unlock(&init_mm);
+
+	flush_tlb_page(vma, f->addr);
+
+	return 0;
+}
+
+/*
+ * Mark the given page as not present. Access to it will trigger a fault.
+ *
+ * Struct kmmio_fault_page is protected by RCU and kmmio_lock, but the
+ * protection is ignored here. RCU read lock is assumed held, so the struct
+ * will not disappear unexpectedly. Furthermore, the caller must guarantee,
+ * that double arming the same virtual address (page) cannot occur.
+ *
+ * Double disarming on the other hand is allowed, and may occur when a fault
+ * and mmiotrace shutdown happen simultaneously.
+ */
+static int arm_kmmio_fault_page(struct kmmio_fault_page *f)
+{
+	int ret;
+
+	WARN_ONCE(f->armed, pr_fmt("kmmio page already armed.\n"));
+	if (f->armed) {
+		pr_warn("double-arm: addr 0x%08lx, ref %d, old %d\n",
+			f->addr, f->count, !!f->old_presence);
+	}
+	ret = clear_page_presence(f, true);
+	WARN_ONCE(ret < 0, pr_fmt("arming at 0x%08lx failed.\n"),
+		  f->addr);
+	f->armed = true;
+	return ret;
+}
+
+/** Restore the given page to saved presence state. */
+static void disarm_kmmio_fault_page(struct kmmio_fault_page *f)
+{
+	int ret = clear_page_presence(f, false);
+
+	WARN_ONCE(ret < 0,
+			KERN_ERR "kmmio disarming at 0x%08lx failed.\n", f->addr);
+	f->armed = false;
+}
+
+/*
+ * This is being called from do_page_fault().
+ *
+ * We may be in an interrupt or a critical section. Also prefecthing may
+ * trigger a page fault. We may be in the middle of process switch.
+ * We cannot take any locks, because we could be executing especially
+ * within a kmmio critical section.
+ *
+ * Local interrupts are disabled, so preemption cannot happen.
+ * Do not enable interrupts, do not sleep, and watch out for other CPUs.
+ */
+/*
+ * Interrupts are disabled on entry as trap3 is an interrupt gate
+ * and they remain disabled throughout this function.
+ */
+int kmmio_handler(struct pt_regs *regs, unsigned long addr)
+{
+	struct kmmio_context *ctx;
+	struct kmmio_fault_page *faultpage;
+	int ret = 0; /* default to fault not handled */
+	unsigned long page_base = addr;
+	unsigned int l;
+	pte_t *pte = lookup_address(addr, &l);
+
+	if (!pte)
+		return -EINVAL;
+	page_base &= page_level_mask(l);
+
+	/*
+	 * Hold the RCU read lock over single stepping to avoid looking
+	 * up the probe and kmmio_fault_page again. The rcu_read_lock_sched()
+	 * also disables preemption and prevents process switch during
+	 * the single stepping. We can only handle one active kmmio trace
+	 * per cpu, so ensure that we finish it before something else
+	 * gets to run.
+	 */
+	rcu_read_lock_sched_notrace();
+
+	faultpage = get_kmmio_fault_page(page_base);
+	if (!faultpage) {
+		/*
+		 * Either this page fault is not caused by kmmio, or
+		 * another CPU just pulled the kmmio probe from under
+		 * our feet. The latter case should not be possible.
+		 */
+		goto no_kmmio;
+	}
+
+	ctx = this_cpu_ptr(&kmmio_ctx);
+	if (ctx->active) {
+		if (page_base == ctx->addr) {
+			/*
+			 * A second fault on the same page means some other
+			 * condition needs handling by do_page_fault(), the
+			 * page really not being present is the most common.
+			 */
+			pr_debug("secondary hit for 0x%08lx CPU %d.\n",
+				 addr, smp_processor_id());
+
+			if (!faultpage->old_presence)
+				pr_info("unexpected secondary hit for address 0x%08lx on CPU %d.\n",
+					addr, smp_processor_id());
+		} else {
+			/*
+			 * Prevent overwriting already in-flight context.
+			 * This should not happen, let's hope disarming at
+			 * least prevents a panic.
+			 */
+			pr_emerg("recursive probe hit on CPU %d, for address 0x%08lx. Ignoring.\n",
+				 smp_processor_id(), addr);
+			pr_emerg("previous hit was at 0x%08lx.\n", ctx->addr);
+			disarm_kmmio_fault_page(faultpage);
+		}
+		goto no_kmmio;
+	}
+	ctx->active++;
+
+	ctx->fpage = faultpage;
+	ctx->probe = get_kmmio_probe(page_base);
+	ctx->saved_flags = (regs->msr & (MSR_SE | MSR_EE));
+	ctx->saved_softe = regs->softe;
+	ctx->addr = page_base;
+
+	if (ctx->probe && ctx->probe->pre_handler)
+		ctx->probe->pre_handler(ctx->probe, regs, addr);
+
+	/*
+	 * Enable single-stepping and disable interrupts for the faulting
+	 * context. Local interrupts must not get enabled during stepping.
+	 */
+	regs->msr |= MSR_SE;         // single step
+	regs->msr &= ~MSR_EE;        // hard interrupt
+	regs->softe = IRQS_DISABLED; // soft interrupt
+
+	local_paca->srr_valid = 0;
+
+	/* Now we set present bit in PTE and single step. */
+	disarm_kmmio_fault_page(ctx->fpage);
+
+	/*
+	 * If another cpu accesses the same page while we are stepping,
+	 * the access will not be caught. It will simply succeed and the
+	 * only downside is we lose the event. If this becomes a problem,
+	 * the user should drop to single cpu before tracing.
+	 */
+
+	return 1; /* fault handled */
+
+no_kmmio:
+	rcu_read_unlock_sched_notrace();
+	return ret;
+}
+
+/*
+ * Interrupts are disabled on entry as trap1 is an interrupt gate
+ * and they remain disabled throughout this function.
+ * This must always get called as the pair to kmmio_handler().
+ */
+static int post_kmmio_handler(unsigned long condition, struct pt_regs *regs)
+{
+	int ret = 0;
+	struct kmmio_context *ctx = this_cpu_ptr(&kmmio_ctx);
+
+	if (!ctx->active) {
+		/*
+		 * debug traps without an active context are due to either
+		 * something external causing them (f.e. using a debugger while
+		 * mmio tracing enabled), or erroneous behaviour
+		 */
+		pr_warn("unexpected debug trap on CPU %d.\n", smp_processor_id());
+		goto out;
+	}
+
+	if (ctx->probe && ctx->probe->post_handler)
+		ctx->probe->post_handler(ctx->probe, condition, regs);
+
+	/* Prevent racing against release_kmmio_fault_page(). */
+	arch_spin_lock(&kmmio_lock);
+	if (ctx->fpage->count)
+		arm_kmmio_fault_page(ctx->fpage);
+	arch_spin_unlock(&kmmio_lock);
+
+	// disabled single step in entry of single_step_exception.
+	// regs->msr &= ~MSR_SE;
+	regs->msr |= ctx->saved_flags;
+	regs->softe = ctx->saved_softe;
+
+	/* These were acquired in kmmio_handler(). */
+	ctx->active--;
+	BUG_ON(ctx->active);
+	rcu_read_unlock_sched_notrace();
+
+	/*
+	 * if somebody else is singlestepping across a probe point, flags
+	 * will have TF set, in which case, continue the remaining processing
+	 * of do_debug, as if this is not a probe hit.
+	 */
+	if (!(regs->msr & MSR_SE))
+		ret = 1;
+out:
+	return ret;
+}
+
+/* You must be holding kmmio_lock. */
+static int add_kmmio_fault_page(unsigned long addr)
+{
+	struct kmmio_fault_page *f;
+
+	f = get_kmmio_fault_page(addr);
+	if (f) {
+		if (!f->count)
+			arm_kmmio_fault_page(f);
+		f->count++;
+		return 0;
+	}
+
+	f = kzalloc(sizeof(*f), GFP_ATOMIC);
+	if (!f)
+		return -1;
+
+	f->count = 1;
+	f->addr = addr;
+
+	if (arm_kmmio_fault_page(f)) {
+		kfree(f);
+		return -1;
+	}
+
+	list_add_rcu(&f->list, kmmio_page_list(f->addr));
+
+	return 0;
+}
+
+/* You must be holding kmmio_lock. */
+static void release_kmmio_fault_page(unsigned long addr,
+				struct kmmio_fault_page **release_list)
+{
+	struct kmmio_fault_page *f;
+
+	f = get_kmmio_fault_page(addr);
+	if (!f)
+		return;
+
+	f->count--;
+	BUG_ON(f->count < 0);
+	if (!f->count) {
+		disarm_kmmio_fault_page(f);
+		if (!f->scheduled_for_release) {
+			f->release_next = *release_list;
+			*release_list = f;
+			f->scheduled_for_release = true;
+		}
+	}
+}
+
+/*
+ * With page-unaligned ioremaps, one or two armed pages may contain
+ * addresses from outside the intended mapping. Events for these addresses
+ * are currently silently dropped. The events may result only from programming
+ * mistakes by accessing addresses before the beginning or past the end of a
+ * mapping.
+ */
+int register_kmmio_probe(struct kmmio_probe *p)
+{
+	unsigned long flags;
+	int ret = 0;
+	unsigned long size = 0;
+	unsigned long addr = p->addr & PAGE_MASK;
+	const unsigned long size_lim = p->len + (p->addr & ~PAGE_MASK);
+	unsigned int l;
+	pte_t *pte;
+
+	local_irq_save(flags);
+	arch_spin_lock(&kmmio_lock);
+	if (get_kmmio_probe(addr)) {
+		ret = -EEXIST;
+		goto out;
+	}
+
+	pte = lookup_address(addr, &l);
+	if (!pte) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	kmmio_count++;
+	list_add_rcu(&p->list, &kmmio_probes);
+	while (size < size_lim) {
+		if (add_kmmio_fault_page(addr + size))
+			pr_err("Unable to set page fault.\n");
+		size += page_level_size(l);
+	}
+out:
+	arch_spin_unlock(&kmmio_lock);
+	local_irq_restore(flags);
+
+	/*
+	 * XXX: What should I do here?
+	 * Here was a call to global_flush_tlb(), but it does not exist
+	 * anymore. It seems it's not needed after all.
+	 */
+	return ret;
+}
+EXPORT_SYMBOL(register_kmmio_probe);
+
+static void rcu_free_kmmio_fault_pages(struct rcu_head *head)
+{
+	struct kmmio_delayed_release *dr = container_of(
+						head,
+						struct kmmio_delayed_release,
+						rcu);
+	struct kmmio_fault_page *f = dr->release_list;
+
+	while (f) {
+		struct kmmio_fault_page *next = f->release_next;
+
+		BUG_ON(f->count);
+		kfree(f);
+		f = next;
+	}
+	kfree(dr);
+}
+
+static void remove_kmmio_fault_pages(struct rcu_head *head)
+{
+	struct kmmio_delayed_release *dr =
+		container_of(head, struct kmmio_delayed_release, rcu);
+	struct kmmio_fault_page *f = dr->release_list;
+	struct kmmio_fault_page **prevp = &dr->release_list;
+	unsigned long flags;
+
+	local_irq_save(flags);
+	arch_spin_lock(&kmmio_lock);
+	while (f) {
+		if (!f->count) {
+			list_del_rcu(&f->list);
+			prevp = &f->release_next;
+		} else {
+			*prevp = f->release_next;
+			f->release_next = NULL;
+			f->scheduled_for_release = false;
+		}
+		f = *prevp;
+	}
+	arch_spin_unlock(&kmmio_lock);
+	local_irq_restore(flags);
+
+	/* This is the real RCU destroy call. */
+	call_rcu(&dr->rcu, rcu_free_kmmio_fault_pages);
+}
+
+/*
+ * Remove a kmmio probe. You have to synchronize_rcu() before you can be
+ * sure that the callbacks will not be called anymore. Only after that
+ * you may actually release your struct kmmio_probe.
+ *
+ * Unregistering a kmmio fault page has three steps:
+ * 1. release_kmmio_fault_page()
+ *    Disarm the page, wait a grace period to let all faults finish.
+ * 2. remove_kmmio_fault_pages()
+ *    Remove the pages from kmmio_page_table.
+ * 3. rcu_free_kmmio_fault_pages()
+ *    Actually free the kmmio_fault_page structs as with RCU.
+ */
+void unregister_kmmio_probe(struct kmmio_probe *p)
+{
+	unsigned long flags;
+	unsigned long size = 0;
+	unsigned long addr = p->addr & PAGE_MASK;
+	const unsigned long size_lim = p->len + (p->addr & ~PAGE_MASK);
+	struct kmmio_fault_page *release_list = NULL;
+	struct kmmio_delayed_release *drelease;
+	unsigned int l;
+	pte_t *pte;
+
+	pte = lookup_address(addr, &l);
+	if (!pte)
+		return;
+
+	local_irq_save(flags);
+	arch_spin_lock(&kmmio_lock);
+	while (size < size_lim) {
+		release_kmmio_fault_page(addr + size, &release_list);
+		size += page_level_size(l);
+	}
+	list_del_rcu(&p->list);
+	kmmio_count--;
+	arch_spin_unlock(&kmmio_lock);
+	local_irq_restore(flags);
+
+	if (!release_list)
+		return;
+
+	drelease = kmalloc(sizeof(*drelease), GFP_ATOMIC);
+	if (!drelease)
+		return;
+
+	drelease->release_list = release_list;
+
+	/*
+	 * This is not really RCU here. We have just disarmed a set of
+	 * pages so that they cannot trigger page faults anymore. However,
+	 * we cannot remove the pages from kmmio_page_table,
+	 * because a probe hit might be in flight on another CPU. The
+	 * pages are collected into a list, and they will be removed from
+	 * kmmio_page_table when it is certain that no probe hit related to
+	 * these pages can be in flight. RCU grace period sounds like a
+	 * good choice.
+	 *
+	 * If we removed the pages too early, kmmio page fault handler might
+	 * not find the respective kmmio_fault_page and determine it's not
+	 * a kmmio fault, when it actually is. This would lead to madness.
+	 */
+	call_rcu(&drelease->rcu, remove_kmmio_fault_pages);
+}
+EXPORT_SYMBOL(unregister_kmmio_probe);
+
+static int
+kmmio_die_notifier(struct notifier_block *nb, unsigned long val, void *args)
+{
+	struct die_args *arg = args;
+
+	if (val == DIE_SSTEP && post_kmmio_handler(0, arg->regs) == 1)
+		return NOTIFY_STOP;
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block nb_die = {
+	.notifier_call = kmmio_die_notifier
+};
+
+int kmmio_init(void)
+{
+	int i;
+
+	for (i = 0; i < KMMIO_PAGE_TABLE_SIZE; i++)
+		INIT_LIST_HEAD(&kmmio_page_table[i]);
+
+	return register_die_notifier(&nb_die);
+}
+
+void kmmio_cleanup(void)
+{
+	int i;
+
+	unregister_die_notifier(&nb_die);
+	for (i = 0; i < KMMIO_PAGE_TABLE_SIZE; i++) {
+		WARN_ONCE(!list_empty(&kmmio_page_table[i]),
+			  pr_fmt("kmmio_page_table not empty at cleanup, any further tracing will leak memory.\n"));
+	}
+}
diff --git a/arch/powerpc/mm/mmio-mod.c b/arch/powerpc/mm/mmio-mod.c
new file mode 100644
index 000000000000..68ba9f028678
--- /dev/null
+++ b/arch/powerpc/mm/mmio-mod.c
@@ -0,0 +1,414 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Derived from arch/x86/mm/mmio-mod.c:
+ *   Copyright (C) 2024 Jialong Yang (jialong.yang@shingroup.cn)
+ */
+
+#define pr_fmt(fmt) "mmiotrace: " fmt
+
+#include <linux/moduleparam.h>
+#include <linux/debugfs.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <linux/io.h>
+#include <linux/mmiotrace.h>
+#include <linux/pgtable.h>
+#include <linux/atomic.h>
+#include <linux/percpu.h>
+#include <linux/cpu.h>
+
+#include "pf_in.h"
+#include "mmiotrace_arch.h"
+
+struct remap_trace {
+	struct list_head list;
+	struct kmmio_probe probe;
+	resource_size_t phys;
+	unsigned long id;
+};
+
+/* Accessed per-cpu. */
+static DEFINE_PER_CPU(struct trap_reason, pf_reason);
+static DEFINE_PER_CPU(struct mmiotrace_rw, cpu_trace);
+
+static DEFINE_MUTEX(mmiotrace_mutex);
+static DEFINE_SPINLOCK(trace_lock);
+static atomic_t mmiotrace_enabled;
+static LIST_HEAD(trace_list);		/* struct remap_trace */
+
+/*
+ * Locking in this file:
+ * - mmiotrace_mutex enforces enable/disable_mmiotrace() critical sections.
+ * - mmiotrace_enabled may be modified only when holding mmiotrace_mutex
+ *   and trace_lock.
+ * - Routines depending on is_enabled() must take trace_lock.
+ * - trace_list users must hold trace_lock.
+ * - is_enabled() guarantees that mmio_trace_{rw,mapping} are allowed.
+ * - pre/post callbacks assume the effect of is_enabled() being true.
+ */
+
+/* module parameters */
+static unsigned long	filter_offset;
+static bool		nommiotrace;
+
+module_param(filter_offset, ulong, 0);
+module_param(nommiotrace, bool, 0);
+
+MODULE_PARM_DESC(filter_offset, "Start address of traced mappings.");
+MODULE_PARM_DESC(nommiotrace, "Disable actual MMIO tracing.");
+
+static bool is_enabled(void)
+{
+	return atomic_read(&mmiotrace_enabled);
+}
+
+static void print_pte(unsigned long address)
+{
+	unsigned int level;
+	pte_t *pte = lookup_address(address, &level);
+
+	if (!pte) {
+		pr_err("Error in %s: no pte for page 0x%08lx\n",
+		       __func__, address);
+		return;
+	}
+
+	if (level == PMD_SHIFT) {
+		pr_emerg("4MB pages are not currently supported: 0x%08lx\n",
+			 address);
+		BUG();
+	}
+	pr_info("pte for 0x%lx: 0x%llx 0x%llx\n",
+		address,
+		(unsigned long long)pte_val(*pte),
+		(unsigned long long)pte_val(*pte) & _PAGE_PRESENT);
+}
+
+/*
+ * For some reason the pre/post pairs have been called in an
+ * unmatched order. Report and die.
+ */
+static void die_kmmio_nesting_error(struct pt_regs *regs, unsigned long addr)
+{
+	const struct trap_reason *my_reason = &get_cpu_var(pf_reason);
+
+	pr_emerg("unexpected fault for address: 0x%08lx, last fault for address: 0x%08lx\n",
+		 addr, my_reason->addr);
+	print_pte(addr);
+	pr_emerg("faulting IP is at %pS\n", (void *)regs->nip);
+	pr_emerg("last faulting IP was at %pS\n", (void *)my_reason->ip);
+	put_cpu_var(pf_reason);
+	BUG();
+}
+
+static void pre(struct kmmio_probe *p, struct pt_regs *regs,
+						unsigned long addr)
+{
+	struct trap_reason *my_reason = &get_cpu_var(pf_reason);
+	struct mmiotrace_rw *my_trace = &get_cpu_var(cpu_trace);
+	const unsigned long instptr = instruction_pointer(regs);
+	struct opcode_t *opcode = get_opcode((unsigned int *)instptr);
+	enum mm_io_opcode type = get_ins_type(opcode);
+	struct remap_trace *trace = p->private;
+
+	/* it doesn't make sense to have more than one active trace per cpu */
+	if (my_reason->active_traces)
+		die_kmmio_nesting_error(regs, addr);
+	else
+		my_reason->active_traces++;
+
+	if (!opcode) {
+		pr_warn("The ins may be not included in src. Tell the dever follow info:");
+		pr_warn("ins_addr: 0x%lx    ins: 0x%lx", instptr, *(unsigned long *)instptr);
+	}
+
+	my_reason->opcode = opcode;
+
+	my_reason->addr = addr;
+	my_reason->ip = instptr;
+
+	my_trace->phys = addr - trace->probe.addr + trace->phys;
+	my_trace->map_id = trace->id;
+
+	my_trace->pc = instptr;
+
+	my_trace->opcode = type;
+	my_trace->width = get_ins_width(opcode);
+
+	if (type == MMIO_WRITE)
+		my_trace->value = get_ins_val(my_reason, regs);
+
+	put_cpu_var(cpu_trace);
+	put_cpu_var(pf_reason);
+}
+
+static void post(struct kmmio_probe *p, unsigned long condition,
+							struct pt_regs *regs)
+{
+	struct trap_reason *my_reason = &get_cpu_var(pf_reason);
+	struct mmiotrace_rw *my_trace = &get_cpu_var(cpu_trace);
+	struct opcode_t *opcode = my_reason->opcode;
+	enum mm_io_opcode type = get_ins_type(opcode);
+
+	/* this should always return the active_trace count to 0 */
+	my_reason->active_traces--;
+	if (my_reason->active_traces) {
+		pr_emerg("unexpected post handler");
+		BUG();
+	}
+
+	if (type == MMIO_READ)
+		my_trace->value = get_ins_val(my_reason, regs);
+
+	mmio_trace_rw(my_trace);
+	put_cpu_var(cpu_trace);
+	put_cpu_var(pf_reason);
+}
+
+static void ioremap_trace_core(resource_size_t offset, unsigned long size,
+							void __iomem *addr)
+{
+	static atomic_t next_id;
+	struct remap_trace *trace = kmalloc(sizeof(*trace), GFP_KERNEL);
+	/* These are page-unaligned. */
+	struct mmiotrace_map map = {
+		.phys = offset,
+		.virt = (unsigned long)addr,
+		.len = size,
+		.opcode = MMIO_PROBE
+	};
+
+	if (!trace) {
+		pr_err("kmalloc failed in ioremap\n");
+		return;
+	}
+
+	*trace = (struct remap_trace) {
+		.probe = {
+			.addr = (unsigned long)addr,
+			.len = size,
+			.pre_handler = pre,
+			.post_handler = post,
+			.private = trace
+		},
+		.phys = offset,
+		.id = atomic_inc_return(&next_id)
+	};
+	map.map_id = trace->id;
+
+	spin_lock_irq(&trace_lock);
+	if (!is_enabled()) {
+		kfree(trace);
+		goto not_enabled;
+	}
+
+	mmio_trace_mapping(&map);
+	list_add_tail(&trace->list, &trace_list);
+	if (!nommiotrace)
+		register_kmmio_probe(&trace->probe);
+
+not_enabled:
+	spin_unlock_irq(&trace_lock);
+}
+
+void mmiotrace_ioremap(resource_size_t offset, unsigned long size,
+						void __iomem *addr)
+{
+	pr_err("ioremap_*(0x%llx, 0x%lx) = %p\n",
+		 (unsigned long long)offset, size, addr);
+	if (!is_enabled()) /* recheck and proper locking in *_core() */
+		return;
+
+	pr_debug("ioremap_*(0x%llx, 0x%lx) = %p\n",
+		 (unsigned long long)offset, size, addr);
+	if ((filter_offset) && (offset != filter_offset))
+		return;
+	ioremap_trace_core(offset, size, addr);
+}
+
+static void iounmap_trace_core(volatile void __iomem *addr)
+{
+	struct mmiotrace_map map = {
+		.phys = 0,
+		.virt = (unsigned long)addr,
+		.len = 0,
+		.opcode = MMIO_UNPROBE
+	};
+	struct remap_trace *trace;
+	struct remap_trace *tmp;
+	struct remap_trace *found_trace = NULL;
+
+	pr_debug("Unmapping %p.\n", addr);
+
+	spin_lock_irq(&trace_lock);
+	if (!is_enabled())
+		goto not_enabled;
+
+	list_for_each_entry_safe(trace, tmp, &trace_list, list) {
+		if ((unsigned long)addr == trace->probe.addr) {
+			if (!nommiotrace)
+				unregister_kmmio_probe(&trace->probe);
+			list_del(&trace->list);
+			found_trace = trace;
+			break;
+		}
+	}
+	map.map_id = (found_trace) ? found_trace->id : -1;
+	mmio_trace_mapping(&map);
+
+not_enabled:
+	spin_unlock_irq(&trace_lock);
+	if (found_trace) {
+		synchronize_rcu(); /* unregister_kmmio_probe() requirement */
+		kfree(found_trace);
+	}
+}
+
+void mmiotrace_iounmap(volatile void __iomem *addr)
+{
+	might_sleep();
+	if (is_enabled()) /* recheck and proper locking in *_core() */
+		iounmap_trace_core(addr);
+}
+
+int mmiotrace_printk(const char *fmt, ...)
+{
+	int ret = 0;
+	va_list args;
+	unsigned long flags;
+
+	va_start(args, fmt);
+
+	spin_lock_irqsave(&trace_lock, flags);
+	if (is_enabled())
+		ret = mmio_trace_printk(fmt, args);
+	spin_unlock_irqrestore(&trace_lock, flags);
+
+	va_end(args);
+	return ret;
+}
+EXPORT_SYMBOL(mmiotrace_printk);
+
+static void clear_trace_list(void)
+{
+	struct remap_trace *trace;
+	struct remap_trace *tmp;
+
+	/*
+	 * No locking required, because the caller ensures we are in a
+	 * critical section via mutex, and is_enabled() is false,
+	 * i.e. nothing can traverse or modify this list.
+	 * Caller also ensures is_enabled() cannot change.
+	 */
+	list_for_each_entry(trace, &trace_list, list) {
+		pr_notice("purging non-iounmapped trace @0x%08lx, size 0x%lx.\n",
+			  trace->probe.addr, trace->probe.len);
+		if (!nommiotrace)
+			unregister_kmmio_probe(&trace->probe);
+	}
+	synchronize_rcu(); /* unregister_kmmio_probe() requirement */
+
+	list_for_each_entry_safe(trace, tmp, &trace_list, list) {
+		list_del(&trace->list);
+		kfree(trace);
+	}
+}
+
+#ifdef CONFIG_HOTPLUG_CPU
+static cpumask_var_t downed_cpus;
+
+static void enter_uniprocessor(void)
+{
+	int cpu;
+	int err;
+
+	if (!cpumask_available(downed_cpus) &&
+	    !alloc_cpumask_var(&downed_cpus, GFP_KERNEL)) {
+		pr_notice("Failed to allocate mask\n");
+		goto out;
+	}
+
+	cpus_read_lock();
+	cpumask_copy(downed_cpus, cpu_online_mask);
+	cpumask_clear_cpu(cpumask_first(cpu_online_mask), downed_cpus);
+	if (num_online_cpus() > 1)
+		pr_notice("Disabling non-boot CPUs...\n");
+	cpus_read_unlock();
+
+	for_each_cpu(cpu, downed_cpus) {
+		err = remove_cpu(cpu);
+		if (!err)
+			pr_info("CPU%d is down.\n", cpu);
+		else
+			pr_err("Error taking CPU%d down: %d\n", cpu, err);
+	}
+out:
+	if (num_online_cpus() > 1)
+		pr_warn("multiple CPUs still online, may miss events.\n");
+}
+
+static void leave_uniprocessor(void)
+{
+	int cpu;
+	int err;
+
+	if (!cpumask_available(downed_cpus) || cpumask_empty(downed_cpus))
+		return;
+	pr_notice("Re-enabling CPUs...\n");
+	for_each_cpu(cpu, downed_cpus) {
+		err = add_cpu(cpu);
+		if (!err)
+			pr_info("enabled CPU%d.\n", cpu);
+		else
+			pr_err("cannot re-enable CPU%d: %d\n", cpu, err);
+	}
+}
+
+#else /* !CONFIG_HOTPLUG_CPU */
+static void enter_uniprocessor(void)
+{
+	if (num_online_cpus() > 1)
+		pr_warn("multiple CPUs are online, may miss events. Suggest booting with maxcpus=1 kernel argument.\n");
+}
+
+static void leave_uniprocessor(void)
+{
+}
+#endif
+
+void enable_mmiotrace(void)
+{
+	mutex_lock(&mmiotrace_mutex);
+	if (is_enabled())
+		goto out;
+
+	if (nommiotrace)
+		pr_info("MMIO tracing disabled.\n");
+	kmmio_init();
+	enter_uniprocessor();
+	spin_lock_irq(&trace_lock);
+	atomic_inc(&mmiotrace_enabled);
+	spin_unlock_irq(&trace_lock);
+	pr_info("enabled.\n");
+out:
+	mutex_unlock(&mmiotrace_mutex);
+}
+
+void disable_mmiotrace(void)
+{
+	mutex_lock(&mmiotrace_mutex);
+	if (!is_enabled())
+		goto out;
+
+	spin_lock_irq(&trace_lock);
+	atomic_dec(&mmiotrace_enabled);
+	BUG_ON(is_enabled());
+	spin_unlock_irq(&trace_lock);
+
+	clear_trace_list(); /* guarantees: no more kmmio callbacks */
+	leave_uniprocessor();
+	kmmio_cleanup();
+	pr_info("disabled.\n");
+out:
+	mutex_unlock(&mmiotrace_mutex);
+}
diff --git a/arch/powerpc/mm/mmiotrace_arch.c b/arch/powerpc/mm/mmiotrace_arch.c
new file mode 100644
index 000000000000..ccc8032384ef
--- /dev/null
+++ b/arch/powerpc/mm/mmiotrace_arch.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Derived from arch/powerpc/mm/pgtable.c:
+ *   Copyright (C) 2024 Jialong Yang (jialong.yang@shingroup.cn)
+ */
+
+#include <linux/kernel.h>
+#include <linux/gfp.h>
+#include <linux/mm.h>
+#include <linux/percpu.h>
+#include <linux/hardirq.h>
+#include <linux/hugetlb.h>
+#include <asm/tlbflush.h>
+#include <asm/tlb.h>
+#include <asm/hugetlb.h>
+
+#include "mmiotrace_arch.h"
+
+static pte_t *mmiotrace_find_linux_pte(pgd_t *pgdp, unsigned long ea,
+			bool *is_thp, unsigned int *hpage_shift)
+{
+	p4d_t p4d, *p4dp;
+	pud_t pud, *pudp;
+	pmd_t pmd, *pmdp;
+	pte_t *ret_pte;
+	hugepd_t *hpdp = NULL;
+	unsigned int pdshift;
+
+	if (hpage_shift)
+		*hpage_shift = 0;
+
+	if (is_thp)
+		*is_thp = false;
+
+	/*
+	 * Always operate on the local stack value. This make sure the
+	 * value don't get updated by a parallel THP split/collapse,
+	 * page fault or a page unmap. The return pte_t * is still not
+	 * stable. So should be checked there for above conditions.
+	 * Top level is an exception because it is folded into p4d.
+	 */
+	p4dp = p4d_offset(pgdp, ea);
+	p4d  = READ_ONCE(*p4dp);
+	pdshift = P4D_SHIFT;
+
+	if (p4d_none(p4d))
+		return NULL;
+
+	if (p4d_leaf(p4d)) {
+		ret_pte = (pte_t *)p4dp;
+		goto out;
+	}
+
+	if (is_hugepd(__hugepd(p4d_val(p4d)))) {
+		hpdp = (hugepd_t *)&p4d;
+		goto out_huge;
+	}
+
+	/*
+	 * Even if we end up with an unmap, the pgtable will not
+	 * be freed, because we do an rcu free and here we are
+	 * irq disabled
+	 */
+	pdshift = PUD_SHIFT;
+	pudp = pud_offset(&p4d, ea);
+	pud  = READ_ONCE(*pudp);
+
+	if (pud_none(pud))
+		return NULL;
+
+	if (pud_leaf(pud)) {
+		ret_pte = (pte_t *)pudp;
+		goto out;
+	}
+
+	if (is_hugepd(__hugepd(pud_val(pud)))) {
+		hpdp = (hugepd_t *)&pud;
+		goto out_huge;
+	}
+
+	pdshift = PMD_SHIFT;
+	pmdp = pmd_offset(&pud, ea);
+	pmd  = READ_ONCE(*pmdp);
+
+	/*
+	 * A hugepage collapse is captured by this condition, see
+	 * pmdp_collapse_flush.
+	 */
+	if (pmd_none(pmd))
+		return NULL;
+
+#ifdef CONFIG_PPC_BOOK3S_64
+	/*
+	 * A hugepage split is captured by this condition, see
+	 * pmdp_invalidate.
+	 *
+	 * Huge page modification can be caught here too.
+	 */
+	if (pmd_is_serializing(pmd))
+		return NULL;
+#endif
+
+	if (pmd_trans_huge(pmd) || pmd_devmap(pmd)) {
+		if (is_thp)
+			*is_thp = true;
+		ret_pte = (pte_t *)pmdp;
+		goto out;
+	}
+
+	if (pmd_leaf(pmd)) {
+		ret_pte = (pte_t *)pmdp;
+		goto out;
+	}
+
+	if (is_hugepd(__hugepd(pmd_val(pmd)))) {
+		hpdp = (hugepd_t *)&pmd;
+		goto out_huge;
+	}
+
+	pdshift = PAGE_SHIFT;
+
+	if (hpage_shift)
+		*hpage_shift = pdshift;
+
+	return pte_offset_kernel(&pmd, ea);
+
+out_huge:
+	if (!hpdp)
+		return NULL;
+
+	ret_pte = hugepte_offset(*hpdp, ea, pdshift);
+	pdshift = hugepd_shift(*hpdp);
+out:
+	if (hpage_shift)
+		*hpage_shift = pdshift;
+	return ret_pte;
+}
+
+pte_t *lookup_address(unsigned long address, unsigned int *shift)
+{
+	unsigned long flags;
+
+	local_irq_save(flags);
+	pte_t *pte = mmiotrace_find_linux_pte(pgd_offset_k(address), address, NULL, shift);
+
+	local_irq_restore(flags);
+
+	return pte;
+}
diff --git a/arch/powerpc/mm/mmiotrace_arch.h b/arch/powerpc/mm/mmiotrace_arch.h
new file mode 100644
index 000000000000..f4a5bff24a07
--- /dev/null
+++ b/arch/powerpc/mm/mmiotrace_arch.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Derived from arch/powerpc/mm/pgtable.c:
+ *   Copyright (C) 2024 Jialong Yang (jialong.yang@shingroup.cn)
+ */
+
+#ifndef __MMIOTRACE_ARCH_
+#define __MMIOTRACE_ARCH_
+#include <asm/pgtable.h>
+
+static inline int page_level_shift(unsigned int level)
+{
+	return level;
+}
+static inline unsigned long page_level_size(unsigned int level)
+{
+	return 1UL << page_level_shift(level);
+}
+static inline unsigned long page_level_mask(unsigned int level)
+{
+	return ~(page_level_size(level) - 1);
+}
+
+pte_t *lookup_address(unsigned long address, unsigned int *level);
+#endif // __MMIOTRACE_ARCH_
diff --git a/arch/powerpc/mm/pf_in.c b/arch/powerpc/mm/pf_in.c
new file mode 100644
index 000000000000..e6c90b383e7f
--- /dev/null
+++ b/arch/powerpc/mm/pf_in.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Derived from arch/x86/mm/pf_in.c:
+ *   Copyright (C) 2024 Jialong Yang (jialong.yang@shingroup.cn)
+ */
+
+#include <linux/ptrace.h> /* struct pt_regs */
+#include "pf_in.h"
+#include <linux/printk.h>
+#include <linux/mmiotrace.h>
+
+/* D 32 0x80000000 B lwz Load Word and Zero */
+/* D 33 0x84000000 B lwz Load Word and Zero with Update */
+/* D 34 0x88000000 B lbz Load Byte and Zero */
+/* D 33 0x8C000000 B lbzu Load Word and Zero with Update */
+/* D 35 0x90000000 B stw Store Word */
+/* D 36 0x94000000 B stwu Store Word with Update */
+/* D 37 0x98000000 B stb Store Byte */
+/* D 38 0x9C000000 B stbu Store Byte with Update */
+/* D 40 0xA0000000 B lhz Load Halfword and Zero with Update */
+/* D 41 0xA4000000 B lhzu Load Halfword and Zero with Update */
+/* D 42 0xA8000000 B lha Load Halfword Algebraic */
+/* D 43 0xAC000000 B lhau Load Halfword Algebraic with Update */
+/* D 44 0xB0000000 B sth Store Halfword */
+/* D 45 0xB4000000 B sthu Store Halfword with Update */
+/* D 46 0xB8000000 B lmw Load Multiple Word */
+/* D 47 0xBC000000 B stmw Store Multiple Word */
+/* D 48 0xC0000000 FP lfs Load Floating-Point Single */
+/* D 49 0xC4000000 FP lfsu Load Floating-Point Single with Update */
+/* D 50 0xC8000000 FP lfd Load Floating-Point Double */
+/* D 51 0xCC000000 FP lfdu Load Floating-Point Double with Update */
+/* D 52 0xD0000000 FP stfs Store Floating-Point Single */
+/* D 53 0xD4000000 FP stfsu Store Floating-Point Single with Update */
+/* D 54 0xD8000000 FP stfd Store Floating-Point Double */
+/* D 55 0xDC000000 FP stfdu Store Floating-Point Double with Update */
+/* DQ 56 0xE0000000 P 58 LSQ lq Load Quadword */
+/* DS 57 0xE4000000 140 FP.out Lfdp Load Floating-Point Double Pair */
+/* DS 58 0xE8000000 53 64 Ldu Load Doubleword with Update */
+/* DS 58 0xE8000001 53 64 Ld Load Doubleword */
+/* DS 58 0xE8000002 52 64 Lwa Load Word Algebraic */
+/* DS 62 0xF8000000 57 64 std Store Doubleword */
+/* DS 62 0xF8000001 57 64 stdu Store Doubleword with Update */
+/* DS 62 0xF8000002 59 LSQ stq Store Quadword */
+
+// D-form:
+// 0-5    6-10    11-15   16-31
+// opcode RT      RA      Offset
+
+// DQ-form:
+// 0-5    6-10  11-15  16-27
+// opcode RT    RA     Offset
+
+// DS-form:
+// 0-5    6-10  11-15  16-29  30-31
+// opcode RT    RA     Offset opcode
+
+#define D_OPCODE_MASK GENMASK(31, 26)
+#define DQ_OPCODE_MASK D_OPCODE_MASK
+#define DS_OPCODE_MASK (D_OPCODE_MASK | GENMASK(0, 1))
+#define RS_RT_OFFSET 21UL
+#define RS_RT_MASK GENMASK(25, 21)
+#define RA_MASK GENMASK(20, 16)
+#define D_OFFSET GENMASK(15, 0)
+#define DQ_OFFSET GENMASK(15, 4)
+#define DS_OFFSET GENMASK(15, 2)
+
+struct opcode_t opcodes[] = {
+	{0x80000000, D_FORMAT, "lwz", },
+	{0x84000000, D_FORMAT, "lwzu", },
+	{0x88000000, D_FORMAT, "lbz", },
+	{0x8C000000, D_FORMAT, "lbzu", },
+	{0x90000000, D_FORMAT, "stw", },
+	{0x94000000, D_FORMAT, "stwu", },
+	{0x98000000, D_FORMAT, "stb", },
+	{0x9C000000, D_FORMAT, "stbu", },
+	{0xA0000000, D_FORMAT, "lhz", },
+	{0xA4000000, D_FORMAT, "lhzu", },
+	{0xA8000000, D_FORMAT, "lha", },
+	{0xAC000000, D_FORMAT, "lhau", },
+	{0xB0000000, D_FORMAT, "sth", },
+	{0xB4000000, D_FORMAT, "sthu", },
+	{0xB8000000, D_FORMAT, "lmw", },
+	{0xBC000000, D_FORMAT, "stmw", },
+	{0xC0000000, D_FORMAT, "lfs", },
+	{0xC4000000, D_FORMAT, "lfsu", },
+	{0xC8000000, D_FORMAT, "lfd", },
+	{0xCC000000, D_FORMAT, "lfdu", },
+	{0xD0000000, D_FORMAT, "stfs", },
+	{0xD4000000, D_FORMAT, "stfsu", },
+	{0xD8000000, D_FORMAT, "stfd", },
+	{0xDC000000, D_FORMAT, "stfdu", },
+	{0xE0000000, DQ_FORMAT, "lq", },
+	{0xE4000000, DS_FORMAT, "lfdp", },
+	{0xE8000000, DS_FORMAT, "ldu", },
+	{0xE8000001, DS_FORMAT, "ld", },
+	{0xE8000002, DS_FORMAT, "lwa", },
+	{0xF8000000, DS_FORMAT, "std", },
+	{0xF8000001, DS_FORMAT, "stdu", },
+	{0xF8000002, DS_FORMAT, "stq", }
+};
+
+struct opcode_t *get_opcode(unsigned int *addr)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(opcodes); i++) {
+		switch (opcodes[i].form) {
+		case D_FORMAT:
+			if (opcodes[i].opcode == (*addr & D_OPCODE_MASK))
+				return &opcodes[i];
+			break;
+		case DQ_FORMAT:
+			if (opcodes[i].opcode == (*addr & DQ_OPCODE_MASK))
+				return &opcodes[i];
+			break;
+		case DS_FORMAT:
+			if (opcodes[i].opcode == (*addr & DQ_OPCODE_MASK))
+				return &opcodes[i];
+			break;
+		}
+	}
+
+	return NULL;
+}
+
+inline enum mm_io_opcode get_ins_type(struct opcode_t *opcode)
+{
+	if (!opcode)
+		return MMIO_UNKNOWN_OP;
+
+	if (opcode->name[0] == 'l')
+		return MMIO_READ;
+
+	if (opcode->name[0] == 's')
+		return MMIO_WRITE;
+
+	return MMIO_UNKNOWN_OP;
+}
+
+unsigned int get_ins_width(struct opcode_t *opcode)
+{
+	char width_ch;
+
+	if (!opcode)
+		return 0;
+
+	if (opcode->name[0] == 'l')
+		width_ch = opcode->name[1];
+
+	if (opcode->name[0] == 's')
+		width_ch = opcode->name[2];
+
+	switch (width_ch) {
+	case 'b': /* byte */
+		return 1;
+	case 'h': /* half word */
+		return sizeof(long) / 2;
+	case 'w': /* word */
+		/* return sizeof(long); */
+	case 'm': /* multi words(can be calculated out by (32-RT) * sizeof(long)) */
+	case 'f': /* float(not too much. So ignore word number) */
+	case 'd': /* double words */
+		/* return 2 * sizeof(long); */
+	case 'q': /* quad words */
+		/* return 4 * sizeof(long); */
+	default:
+		return sizeof(long);
+	}
+}
+
+unsigned long get_ins_val(struct trap_reason *reason, struct pt_regs *regs)
+{
+	struct opcode_t *opcode = reason->opcode;
+	unsigned int ins = *(unsigned int *)(reason->ip);
+	unsigned int reg_no;
+	unsigned long mask = ~0UL;
+
+	if (!opcode)
+		return 0;
+
+	mask >>= 8 * (sizeof(long) - get_ins_width(opcode));
+	reg_no = (ins & RS_RT_MASK) >> RS_RT_OFFSET;
+
+	return regs->gpr[reg_no] & mask;
+}
diff --git a/arch/powerpc/mm/pf_in.h b/arch/powerpc/mm/pf_in.h
new file mode 100644
index 000000000000..905ba4937137
--- /dev/null
+++ b/arch/powerpc/mm/pf_in.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Derived from arch/x86/mm/pf_in.h:
+ *   Copyright (C) 2024 Jialong Yang (jialong.yang@shingroup.cn)
+ */
+
+#ifndef __PF_H_
+#define __PF_H_
+
+enum OPCODE_FORMAT {
+	D_FORMAT,
+	DQ_FORMAT,
+	DS_FORMAT,
+};
+
+struct opcode_t {
+	unsigned int opcode;
+	enum OPCODE_FORMAT form;
+	const char *name;
+};
+
+struct trap_reason {
+	unsigned long addr;
+	unsigned long ip;
+	struct opcode_t *opcode;
+	int active_traces;
+};
+
+struct opcode_t *get_opcode(unsigned int *addr);
+enum mm_io_opcode get_ins_type(struct opcode_t *opcode);
+unsigned int get_ins_width(struct opcode_t *opcode);
+unsigned long get_ins_val(struct trap_reason *reason, struct pt_regs *regs);
+#endif /* __PF_H_ */
-- 
2.34.1

