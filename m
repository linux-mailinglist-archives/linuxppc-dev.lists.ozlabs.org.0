Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9550663EAA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 11:54:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nrnkr4sT5z3ch7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 21:54:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Oa/w86nC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=andrzej.hajda@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Oa/w86nC;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nrnjt2NKKz2yg5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 21:53:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673348034; x=1704884034;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JaPOAJY90zudNFiWuhlyTyGb5gFWycF2Awg1wTg2Qac=;
  b=Oa/w86nC+NucQZBbCaWj+xMA5++IlH/OfbHkW0CX3HdGC+JiRvN508uL
   JSqGFuvGTEZzKkZNJd8Uaa38zBHhKa2l3o1TLWcThEV5oUSWVxLRHODBy
   TjCgEcu/y6Fx/hmysFjWVPXbLHoP1uhSXymtazP2IujSdvxeCquYaFpl7
   5H3QFw48g+NmWZ4IEgjMqRk1PzmXI/qac5gZGvWRNVgIo3i1hH3MdWmc8
   hLHygvVdKKoiNjklW8xrcOUalRHqO8woLa8/NgcIPxRII8WnbIGLunAbW
   AkcIl5AO1OkUEaptTS0UsTiDzFNTyH+4f0mZCF0njiYq5l/FffJ+OY0P1
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="321817709"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="321817709"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 02:53:49 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="745735672"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="745735672"
Received: from lab-ah.igk.intel.com ([10.102.42.211])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 02:53:43 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC DO NOT MERGE] treewide: use __xchg in most obvious places
Date: Tue, 10 Jan 2023 11:53:06 +0100
Message-Id: <20230110105306.3973122-1-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Y7b6/7coJEVlTVxK@phenom.ffwll.local>
References: <Y7b6/7coJEVlTVxK@phenom.ffwll.local>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch tries to show usability of __xchg helper.
It is not intended to be merged, but I can convert
it to proper patchset if necessary.

There are many more places where __xchg can be used.
This demo shows the most spectacular cases IMHO:
- previous value is returned from function,
- temporary variables are in use.

As a result readability is much better and diffstat is quite
nice, less local vars to look at.
In many cases whole body of functions is replaced
with __xchg(ptr, val), so as further refactoring the whole
function can be removed and __xchg can be called directly.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 arch/arm/probes/uprobes/core.c                |  8 ++------
 arch/csky/kernel/probes/uprobes.c             |  9 ++-------
 arch/mips/kernel/irq_txx9.c                   |  7 ++-----
 arch/mips/kernel/process.c                    |  8 +++-----
 arch/mips/kernel/uprobes.c                    | 10 ++--------
 arch/powerpc/include/asm/kvm_ppc.h            |  7 ++-----
 arch/powerpc/kernel/uprobes.c                 | 10 ++--------
 arch/powerpc/mm/init_64.c                     |  7 ++-----
 arch/riscv/kernel/probes/uprobes.c            |  9 ++-------
 arch/s390/kernel/uprobes.c                    |  7 ++-----
 arch/s390/kvm/interrupt.c                     |  6 ++----
 arch/sh/kernel/traps_32.c                     |  6 ++----
 .../accessibility/speakup/speakup_dectlk.c    |  7 ++-----
 drivers/accessibility/speakup/speakup_soft.c  |  7 ++-----
 drivers/block/drbd/drbd_receiver.c            |  5 ++---
 drivers/cdrom/cdrom.c                         |  7 ++-----
 drivers/gpu/drm/drm_atomic_uapi.c             | 14 +++-----------
 drivers/iommu/iova.c                          |  7 ++-----
 drivers/misc/ti-st/st_core.c                  | 10 +++-------
 drivers/mtd/nand/raw/qcom_nandc.c             | 11 ++++-------
 drivers/net/ethernet/ibm/ehea/ehea_main.c     | 11 +++--------
 .../microchip/sparx5/sparx5_calendar.c        | 10 ++++------
 drivers/net/usb/rtl8150.c                     |  9 +++------
 drivers/net/wireless/intel/iwlwifi/pcie/rx.c  |  8 +++-----
 .../net/wireless/marvell/mwifiex/sta_ioctl.c  |  7 +++----
 drivers/scsi/device_handler/scsi_dh_alua.c    |  8 +++-----
 drivers/scsi/lpfc/lpfc_sli.c                  |  7 ++-----
 drivers/staging/rtl8192e/rtllib_tx.c          |  7 ++-----
 drivers/tty/hvc/hvc_iucv.c                    |  8 +++-----
 drivers/video/fbdev/sis/sis_main.c            |  6 ++----
 drivers/xen/grant-table.c                     |  6 ++----
 fs/namespace.c                                |  6 ++----
 include/linux/ptr_ring.h                      |  7 ++-----
 include/linux/qed/qed_chain.h                 | 19 +++++++------------
 io_uring/io_uring.c                           |  7 ++-----
 mm/kmsan/init.c                               |  7 ++-----
 mm/memcontrol.c                               |  8 ++------
 net/mac80211/rc80211_minstrel_ht.c            |  6 ++----
 sound/pci/asihpi/hpidebug.c                   |  8 +++-----
 .../selftests/bpf/progs/dummy_st_ops.c        |  7 ++-----
 40 files changed, 99 insertions(+), 225 deletions(-)

diff --git a/arch/arm/probes/uprobes/core.c b/arch/arm/probes/uprobes/core.c
index f5f790c6e5f896..77ce8ae431376d 100644
--- a/arch/arm/probes/uprobes/core.c
+++ b/arch/arm/probes/uprobes/core.c
@@ -9,6 +9,7 @@
 #include <linux/highmem.h>
 #include <linux/sched.h>
 #include <linux/uprobes.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/notifier.h>
 
 #include <asm/opcodes.h>
@@ -61,12 +62,7 @@ unsigned long
 arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr,
 				  struct pt_regs *regs)
 {
-	unsigned long orig_ret_vaddr;
-
-	orig_ret_vaddr = regs->ARM_lr;
-	/* Replace the return addr with trampoline addr */
-	regs->ARM_lr = trampoline_vaddr;
-	return orig_ret_vaddr;
+	return __xchg(&regs->ARM_lr, trampoline_vaddr);
 }
 
 int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe, struct mm_struct *mm,
diff --git a/arch/csky/kernel/probes/uprobes.c b/arch/csky/kernel/probes/uprobes.c
index 2d31a12e46cfee..775fe88b5f0016 100644
--- a/arch/csky/kernel/probes/uprobes.c
+++ b/arch/csky/kernel/probes/uprobes.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2014-2016 Pratyush Anand <panand@redhat.com>
  */
 #include <linux/highmem.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/ptrace.h>
 #include <linux/uprobes.h>
 #include <asm/cacheflush.h>
@@ -123,13 +124,7 @@ unsigned long
 arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr,
 				  struct pt_regs *regs)
 {
-	unsigned long ra;
-
-	ra = regs->lr;
-
-	regs->lr = trampoline_vaddr;
-
-	return ra;
+	return __xchg(&regs->lr, trampoline_vaddr);
 }
 
 int arch_uprobe_exception_notify(struct notifier_block *self,
diff --git a/arch/mips/kernel/irq_txx9.c b/arch/mips/kernel/irq_txx9.c
index af3ef4c9f7de1e..b5abe24ea7cfb9 100644
--- a/arch/mips/kernel/irq_txx9.c
+++ b/arch/mips/kernel/irq_txx9.c
@@ -15,6 +15,7 @@
  */
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/types.h>
 #include <linux/irq.h>
 #include <asm/txx9irq.h>
@@ -159,13 +160,9 @@ void __init txx9_irq_init(unsigned long baseaddr)
 
 int __init txx9_irq_set_pri(int irc_irq, int new_pri)
 {
-	int old_pri;
-
 	if ((unsigned int)irc_irq >= TXx9_MAX_IR)
 		return 0;
-	old_pri = txx9irq[irc_irq].level;
-	txx9irq[irc_irq].level = new_pri;
-	return old_pri;
+	return __xchg(&txx9irq[irc_irq].level, new_pri);
 }
 
 int txx9_irq(void)
diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 093dbbd6b84350..2bafb4d4da034d 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -15,6 +15,7 @@
 #include <linux/kallsyms.h>
 #include <linux/kernel.h>
 #include <linux/nmi.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/personality.h>
 #include <linux/prctl.h>
 #include <linux/random.h>
@@ -599,11 +600,8 @@ unsigned long notrace unwind_stack_by_address(unsigned long stack_page,
 	/*
 	 * Return ra if an exception occurred at the first instruction
 	 */
-	if (unlikely(ofs == 0)) {
-		pc = *ra;
-		*ra = 0;
-		return pc;
-	}
+	if (unlikely(ofs == 0))
+		return __xchg(ra, 0);
 
 	info.func = (void *)(pc - ofs);
 	info.func_size = ofs;	/* analyze from start to ofs */
diff --git a/arch/mips/kernel/uprobes.c b/arch/mips/kernel/uprobes.c
index 6c063aa188e626..2b1f375c407b87 100644
--- a/arch/mips/kernel/uprobes.c
+++ b/arch/mips/kernel/uprobes.c
@@ -2,6 +2,7 @@
 #include <linux/highmem.h>
 #include <linux/kdebug.h>
 #include <linux/types.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/notifier.h>
 #include <linux/sched.h>
 #include <linux/uprobes.h>
@@ -197,14 +198,7 @@ void arch_uprobe_abort_xol(struct arch_uprobe *aup,
 unsigned long arch_uretprobe_hijack_return_addr(
 	unsigned long trampoline_vaddr, struct pt_regs *regs)
 {
-	unsigned long ra;
-
-	ra = regs->regs[31];
-
-	/* Replace the return address with the trampoline address */
-	regs->regs[31] = trampoline_vaddr;
-
-	return ra;
+	return __xchg(&regs->regs[31], trampoline_vaddr);
 }
 
 /**
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index eae9619b61903c..bf22b12d5e8e09 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -13,6 +13,7 @@
  * dependencies. */
 
 #include <linux/mutex.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/timer.h>
 #include <linux/types.h>
 #include <linux/kvm_types.h>
@@ -434,11 +435,7 @@ static inline void kvmppc_set_xive_tima(int cpu,
 
 static inline u32 kvmppc_get_xics_latch(void)
 {
-	u32 xirr;
-
-	xirr = get_paca()->kvm_hstate.saved_xirr;
-	get_paca()->kvm_hstate.saved_xirr = 0;
-	return xirr;
+	return __xchg(&get_paca()->kvm_hstate.saved_xirr, 0);
 }
 
 /*
diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
index 95a41ae9dfa755..3c15c320315e6c 100644
--- a/arch/powerpc/kernel/uprobes.c
+++ b/arch/powerpc/kernel/uprobes.c
@@ -7,6 +7,7 @@
  * Adapted from the x86 port by Ananth N Mavinakayanahalli <ananth@in.ibm.com>
  */
 #include <linux/kernel.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/sched.h>
 #include <linux/ptrace.h>
 #include <linux/uprobes.h>
@@ -197,14 +198,7 @@ bool arch_uprobe_skip_sstep(struct arch_uprobe *auprobe, struct pt_regs *regs)
 unsigned long
 arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr, struct pt_regs *regs)
 {
-	unsigned long orig_ret_vaddr;
-
-	orig_ret_vaddr = regs->link;
-
-	/* Replace the return addr with trampoline addr */
-	regs->link = trampoline_vaddr;
-
-	return orig_ret_vaddr;
+	return __xchg(&regs->link, trampoline_vaddr);
 }
 
 bool arch_uretprobe_is_alive(struct return_instance *ret, enum rp_check ctx,
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 05b0d584e50b82..9f6232f85a24f7 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -24,6 +24,7 @@
 #include <linux/types.h>
 #include <linux/mman.h>
 #include <linux/mm.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/swap.h>
 #include <linux/stddef.h>
 #include <linux/vmalloc.h>
@@ -138,14 +139,10 @@ static int num_freed;
 
 static __meminit struct vmemmap_backing * vmemmap_list_alloc(int node)
 {
-	struct vmemmap_backing *vmem_back;
 	/* get from freed entries first */
 	if (num_freed) {
 		num_freed--;
-		vmem_back = next;
-		next = next->list;
-
-		return vmem_back;
+		return __xchg(&next, next->list);
 	}
 
 	/* allocate a page when required and hand out chunks */
diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
index c976a21cd4bd5b..5c8415e216536d 100644
--- a/arch/riscv/kernel/probes/uprobes.c
+++ b/arch/riscv/kernel/probes/uprobes.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 #include <linux/highmem.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/ptrace.h>
 #include <linux/uprobes.h>
 
@@ -122,13 +123,7 @@ unsigned long
 arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr,
 				  struct pt_regs *regs)
 {
-	unsigned long ra;
-
-	ra = regs->ra;
-
-	regs->ra = trampoline_vaddr;
-
-	return ra;
+	return __xchg(&regs->ra, trampoline_vaddr);
 }
 
 int arch_uprobe_exception_notify(struct notifier_block *self,
diff --git a/arch/s390/kernel/uprobes.c b/arch/s390/kernel/uprobes.c
index b88345ef8bd9ed..18591ca40ae7e5 100644
--- a/arch/s390/kernel/uprobes.c
+++ b/arch/s390/kernel/uprobes.c
@@ -11,6 +11,7 @@
 #include <linux/compat.h>
 #include <linux/kdebug.h>
 #include <linux/sched/task_stack.h>
+#include <linux/non-atomic/xchg.h>
 
 #include <asm/switch_to.h>
 #include <asm/facility.h>
@@ -144,11 +145,7 @@ void arch_uprobe_abort_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 unsigned long arch_uretprobe_hijack_return_addr(unsigned long trampoline,
 						struct pt_regs *regs)
 {
-	unsigned long orig;
-
-	orig = regs->gprs[14];
-	regs->gprs[14] = trampoline;
-	return orig;
+	return __xchg(&regs->gprs[14], trampoline);
 }
 
 bool arch_uretprobe_is_alive(struct return_instance *ret, enum rp_check ctx,
diff --git a/arch/s390/kvm/interrupt.c b/arch/s390/kvm/interrupt.c
index 1dae78deddf286..56e4a7146affe8 100644
--- a/arch/s390/kvm/interrupt.c
+++ b/arch/s390/kvm/interrupt.c
@@ -14,6 +14,7 @@
 #include <linux/kvm_host.h>
 #include <linux/hrtimer.h>
 #include <linux/mmu_context.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/nospec.h>
 #include <linux/signal.h>
 #include <linux/slab.h>
@@ -2484,14 +2485,11 @@ static int register_io_adapter(struct kvm_device *dev,
 
 int kvm_s390_mask_adapter(struct kvm *kvm, unsigned int id, bool masked)
 {
-	int ret;
 	struct s390_io_adapter *adapter = get_io_adapter(kvm, id);
 
 	if (!adapter || !adapter->maskable)
 		return -EINVAL;
-	ret = adapter->masked;
-	adapter->masked = masked;
-	return ret;
+	return __xchg(&adapter->masked, masked);
 }
 
 void kvm_s390_destroy_adapters(struct kvm *kvm)
diff --git a/arch/sh/kernel/traps_32.c b/arch/sh/kernel/traps_32.c
index 6cdda3a621a1e5..15402c827a6936 100644
--- a/arch/sh/kernel/traps_32.c
+++ b/arch/sh/kernel/traps_32.c
@@ -12,6 +12,7 @@
 #include <linux/ptrace.h>
 #include <linux/hardirq.h>
 #include <linux/init.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/spinlock.h>
 #include <linux/kallsyms.h>
 #include <linux/io.h>
@@ -752,11 +753,8 @@ void per_cpu_trap_init(void)
 void *set_exception_table_vec(unsigned int vec, void *handler)
 {
 	extern void *exception_handling_table[];
-	void *old_handler;
 
-	old_handler = exception_handling_table[vec];
-	exception_handling_table[vec] = handler;
-	return old_handler;
+	return __xchg(&exception_handling_table[vec], handler);
 }
 
 void __init trap_init(void)
diff --git a/drivers/accessibility/speakup/speakup_dectlk.c b/drivers/accessibility/speakup/speakup_dectlk.c
index 56334405d865c5..05a2f6dbc4a92f 100644
--- a/drivers/accessibility/speakup/speakup_dectlk.c
+++ b/drivers/accessibility/speakup/speakup_dectlk.c
@@ -12,6 +12,7 @@
 #include <linux/unistd.h>
 #include <linux/proc_fs.h>
 #include <linux/jiffies.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/spinlock.h>
 #include <linux/sched.h>
 #include <linux/timer.h>
@@ -172,11 +173,7 @@ static u_char lastind;
 
 static unsigned char get_index(struct spk_synth *synth)
 {
-	u_char rv;
-
-	rv = lastind;
-	lastind = 0;
-	return rv;
+	return __xchg(&lastind, 0);
 }
 
 static void read_buff_add(u_char c)
diff --git a/drivers/accessibility/speakup/speakup_soft.c b/drivers/accessibility/speakup/speakup_soft.c
index 6d446824677b45..81c586bbd754e2 100644
--- a/drivers/accessibility/speakup/speakup_soft.c
+++ b/drivers/accessibility/speakup/speakup_soft.c
@@ -11,6 +11,7 @@
 
 #include <linux/unistd.h>
 #include <linux/miscdevice.h>	/* for misc_register, and MISC_DYNAMIC_MINOR */
+#include <linux/non-atomic/xchg.h>
 #include <linux/poll.h>		/* for poll_wait() */
 
 /* schedule(), signal_pending(), TASK_INTERRUPTIBLE */
@@ -366,11 +367,7 @@ static __poll_t softsynth_poll(struct file *fp, struct poll_table_struct *wait)
 
 static unsigned char get_index(struct spk_synth *synth)
 {
-	int rv;
-
-	rv = last_index;
-	last_index = 0;
-	return rv;
+	return __xchg(&last_index, 0);
 }
 
 static const struct file_operations softsynth_fops = {
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 757f4692b5bd80..ad5762aa0d8846 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -23,6 +23,7 @@
 #include <linux/mm.h>
 #include <linux/memcontrol.h>
 #include <linux/mm_inline.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/slab.h>
 #include <uapi/linux/sched/types.h>
 #include <linux/sched/signal.h>
@@ -99,9 +100,7 @@ static struct page *page_chain_del(struct page **head, int n)
 	/* add end of list marker for the returned list */
 	set_page_private(page, 0);
 	/* actual return value, and adjustment of head */
-	page = *head;
-	*head = tmp;
-	return page;
+	return __xchg(head, tmp);
 }
 
 /* may be used outside of locks to find the tail of a (usually short)
diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
index 416f723a2dbb33..48247e177a3739 100644
--- a/drivers/cdrom/cdrom.c
+++ b/drivers/cdrom/cdrom.c
@@ -264,6 +264,7 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/slab.h> 
 #include <linux/cdrom.h>
 #include <linux/sysctl.h>
@@ -1490,12 +1491,8 @@ static void cdrom_update_events(struct cdrom_device_info *cdi,
 unsigned int cdrom_check_events(struct cdrom_device_info *cdi,
 				unsigned int clearing)
 {
-	unsigned int events;
-
 	cdrom_update_events(cdi, clearing);
-	events = cdi->vfs_events;
-	cdi->vfs_events = 0;
-	return events;
+	return __xchg(&cdi->vfs_events, 0);
 }
 EXPORT_SYMBOL(cdrom_check_events);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index d867e7f9f2cd58..1ee36101a3ebe9 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -36,6 +36,7 @@
 #include <drm/drm_vblank.h>
 
 #include <linux/dma-fence.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/uaccess.h>
 #include <linux/sync_file.h>
 #include <linux/file.h>
@@ -325,12 +326,7 @@ static void set_out_fence_for_crtc(struct drm_atomic_state *state,
 static s32 __user *get_out_fence_for_crtc(struct drm_atomic_state *state,
 					  struct drm_crtc *crtc)
 {
-	s32 __user *fence_ptr;
-
-	fence_ptr = state->crtcs[drm_crtc_index(crtc)].out_fence_ptr;
-	state->crtcs[drm_crtc_index(crtc)].out_fence_ptr = NULL;
-
-	return fence_ptr;
+	return __xchg(&state->crtcs[drm_crtc_index(crtc)].out_fence_ptr, NULL);
 }
 
 static int set_out_fence_for_connector(struct drm_atomic_state *state,
@@ -354,12 +350,8 @@ static s32 __user *get_out_fence_for_connector(struct drm_atomic_state *state,
 					       struct drm_connector *connector)
 {
 	unsigned int index = drm_connector_index(connector);
-	s32 __user *fence_ptr;
-
-	fence_ptr = state->connectors[index].out_fence_ptr;
-	state->connectors[index].out_fence_ptr = NULL;
 
-	return fence_ptr;
+	return __xchg(&state->connectors[index].out_fence_ptr, NULL);
 }
 
 static int
diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 7d246bce7d8483..ee10135992a8cf 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -7,6 +7,7 @@
 
 #include <linux/iova.h>
 #include <linux/module.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/slab.h>
 #include <linux/smp.h>
 #include <linux/bitops.h>
@@ -668,7 +669,6 @@ static unsigned long iova_magazine_pop(struct iova_magazine *mag,
 				       unsigned long limit_pfn)
 {
 	int i;
-	unsigned long pfn;
 
 	/* Only fall back to the rbtree if we have no suitable pfns at all */
 	for (i = mag->size - 1; mag->pfns[i] > limit_pfn; i--)
@@ -676,10 +676,7 @@ static unsigned long iova_magazine_pop(struct iova_magazine *mag,
 			return 0;
 
 	/* Swap it to pop it */
-	pfn = mag->pfns[i];
-	mag->pfns[i] = mag->pfns[--mag->size];
-
-	return pfn;
+	return __xchg(&mag->pfns[i], mag->pfns[--mag->size]);
 }
 
 static void iova_magazine_push(struct iova_magazine *mag, unsigned long pfn)
diff --git a/drivers/misc/ti-st/st_core.c b/drivers/misc/ti-st/st_core.c
index 7f6976a9f508bd..678b966708a237 100644
--- a/drivers/misc/ti-st/st_core.c
+++ b/drivers/misc/ti-st/st_core.c
@@ -9,6 +9,7 @@
 #define pr_fmt(fmt)	"(stc): " fmt
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/tty.h>
 
 #include <linux/seq_file.h>
@@ -397,14 +398,9 @@ void st_int_recv(void *disc_data,
  */
 static struct sk_buff *st_int_dequeue(struct st_data_s *st_gdata)
 {
-	struct sk_buff *returning_skb;
-
 	pr_debug("%s", __func__);
-	if (st_gdata->tx_skb != NULL) {
-		returning_skb = st_gdata->tx_skb;
-		st_gdata->tx_skb = NULL;
-		return returning_skb;
-	}
+	if (st_gdata->tx_skb != NULL)
+		return __xchg(&st_gdata->tx_skb, NULL);
 	return skb_dequeue(&st_gdata->txq);
 }
 
diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 198a44794d2dc0..6b98e0e943937e 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/delay.h>
@@ -2507,13 +2508,9 @@ static uint8_t qcom_nandc_read_byte(struct nand_chip *chip)
 	u8 *buf = nandc->data_buffer;
 	u8 ret = 0x0;
 
-	if (host->last_command == NAND_CMD_STATUS) {
-		ret = host->status;
-
-		host->status = NAND_STATUS_READY | NAND_STATUS_WP;
-
-		return ret;
-	}
+	if (host->last_command == NAND_CMD_STATUS)
+		return __xchg(&host->status,
+			      NAND_STATUS_READY | NAND_STATUS_WP);
 
 	if (nandc->buf_start < nandc->buf_count)
 		ret = buf[nandc->buf_start++];
diff --git a/drivers/net/ethernet/ibm/ehea/ehea_main.c b/drivers/net/ethernet/ibm/ehea/ehea_main.c
index b4aff59b3eb4fd..fba3c4e5e23f04 100644
--- a/drivers/net/ethernet/ibm/ehea/ehea_main.c
+++ b/drivers/net/ethernet/ibm/ehea/ehea_main.c
@@ -17,6 +17,7 @@
 #include <linux/device.h>
 #include <linux/in.h>
 #include <linux/ip.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/tcp.h>
 #include <linux/udp.h>
 #include <linux/if.h>
@@ -564,7 +565,6 @@ static inline struct sk_buff *get_skb_by_index(struct sk_buff **skb_array,
 					       struct ehea_cqe *cqe)
 {
 	int skb_index = EHEA_BMASK_GET(EHEA_WR_ID_INDEX, cqe->wr_id);
-	struct sk_buff *skb;
 	void *pref;
 	int x;
 
@@ -583,15 +583,12 @@ static inline struct sk_buff *get_skb_by_index(struct sk_buff **skb_array,
 		prefetch(pref + EHEA_CACHE_LINE * 3);
 	}
 
-	skb = skb_array[skb_index];
-	skb_array[skb_index] = NULL;
-	return skb;
+	return __xchg(&skb_array[skb_index], NULL);
 }
 
 static inline struct sk_buff *get_skb_by_index_ll(struct sk_buff **skb_array,
 						  int arr_len, int wqe_index)
 {
-	struct sk_buff *skb;
 	void *pref;
 	int x;
 
@@ -608,9 +605,7 @@ static inline struct sk_buff *get_skb_by_index_ll(struct sk_buff **skb_array,
 		prefetchw(pref + EHEA_CACHE_LINE);
 	}
 
-	skb = skb_array[wqe_index];
-	skb_array[wqe_index] = NULL;
-	return skb;
+	return __xchg(&skb_array[wqe_index], NULL);
 }
 
 static int ehea_treat_poll_error(struct ehea_port_res *pr, int rq,
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c b/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c
index 76a8bb596aec1e..0e99a2343f4765 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c
@@ -6,6 +6,7 @@
 
 #include <linux/module.h>
 #include <linux/device.h>
+#include <linux/non-atomic/xchg.h>
 
 #include "sparx5_main_regs.h"
 #include "sparx5_main.h"
@@ -265,14 +266,11 @@ static u32 sparx5_dsm_cal_len(u32 *cal)
 
 static u32 sparx5_dsm_cp_cal(u32 *sched)
 {
-	u32 idx = 0, tmp;
+	u32 idx = 0;
 
 	while (idx < SPX5_DSM_CAL_LEN) {
-		if (sched[idx] != SPX5_DSM_CAL_EMPTY) {
-			tmp = sched[idx];
-			sched[idx] = SPX5_DSM_CAL_EMPTY;
-			return tmp;
-		}
+		if (sched[idx] != SPX5_DSM_CAL_EMPTY)
+			return __xchg(&sched[idx], SPX5_DSM_CAL_EMPTY);
 		idx++;
 	}
 	return SPX5_DSM_CAL_EMPTY;
diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index 97afd7335d8685..717a1abb5a4d4a 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -12,6 +12,7 @@
 #include <linux/ethtool.h>
 #include <linux/usb.h>
 #include <linux/uaccess.h>
+#include <linux/non-atomic/xchg.h>
 
 /* Version Information */
 #define DRIVER_VERSION "v0.6.2 (2004/08/27)"
@@ -354,15 +355,11 @@ static void unlink_all_urbs(rtl8150_t * dev)
 
 static inline struct sk_buff *pull_skb(rtl8150_t *dev)
 {
-	struct sk_buff *skb;
 	int i;
 
 	for (i = 0; i < RX_SKB_POOL_SIZE; i++) {
-		if (dev->rx_skb_pool[i]) {
-			skb = dev->rx_skb_pool[i];
-			dev->rx_skb_pool[i] = NULL;
-			return skb;
-		}
+		if (dev->rx_skb_pool[i])
+			return __xchg(&dev->rx_skb_pool[i], NULL);
 	}
 	return NULL;
 }
diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/rx.c b/drivers/net/wireless/intel/iwlwifi/pcie/rx.c
index 9c9f87fe837770..c595caa36d94a2 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/rx.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/rx.c
@@ -7,6 +7,7 @@
 #include <linux/sched.h>
 #include <linux/wait.h>
 #include <linux/gfp.h>
+#include <linux/non-atomic/xchg.h>
 
 #include "iwl-prph.h"
 #include "iwl-io.h"
@@ -1430,11 +1431,8 @@ static struct iwl_rx_mem_buffer *iwl_pcie_get_rxb(struct iwl_trans *trans,
 	BUILD_BUG_ON(sizeof(struct iwl_rx_completion_desc) != 32);
 	BUILD_BUG_ON(sizeof(struct iwl_rx_completion_desc_bz) != 4);
 
-	if (!trans->trans_cfg->mq_rx_supported) {
-		rxb = rxq->queue[i];
-		rxq->queue[i] = NULL;
-		return rxb;
-	}
+	if (!trans->trans_cfg->mq_rx_supported)
+		return __xchg(&rxq->queue[i], NULL);
 
 	if (trans->trans_cfg->device_family >= IWL_DEVICE_FAMILY_BZ) {
 		struct iwl_rx_completion_desc_bz *cd = rxq->used_bd;
diff --git a/drivers/net/wireless/marvell/mwifiex/sta_ioctl.c b/drivers/net/wireless/marvell/mwifiex/sta_ioctl.c
index a2ad2b53f01683..ffad53f0a0b6dd 100644
--- a/drivers/net/wireless/marvell/mwifiex/sta_ioctl.c
+++ b/drivers/net/wireless/marvell/mwifiex/sta_ioctl.c
@@ -5,6 +5,8 @@
  * Copyright 2011-2020 NXP
  */
 
+#include <linux/non-atomic/xchg.h>
+
 #include "decl.h"
 #include "ioctl.h"
 #include "util.h"
@@ -60,10 +62,7 @@ int mwifiex_wait_queue_complete(struct mwifiex_adapter *adapter,
 		return status;
 	}
 
-	status = adapter->cmd_wait_q.status;
-	adapter->cmd_wait_q.status = 0;
-
-	return status;
+	return __xchg(&adapter->cmd_wait_q.status, 0);
 }
 
 /*
diff --git a/drivers/scsi/device_handler/scsi_dh_alua.c b/drivers/scsi/device_handler/scsi_dh_alua.c
index 49cc18a8747313..8d20ca91d10302 100644
--- a/drivers/scsi/device_handler/scsi_dh_alua.c
+++ b/drivers/scsi/device_handler/scsi_dh_alua.c
@@ -8,6 +8,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/module.h>
+#include <linux/non-atomic/xchg.h>
 #include <asm/unaligned.h>
 #include <scsi/scsi.h>
 #include <scsi/scsi_proto.h>
@@ -821,7 +822,7 @@ static struct scsi_device * __must_check
 alua_rtpg_select_sdev(struct alua_port_group *pg)
 {
 	struct alua_dh_data *h;
-	struct scsi_device *sdev = NULL, *prev_sdev;
+	struct scsi_device *sdev = NULL;
 
 	lockdep_assert_held(&pg->lock);
 	if (WARN_ON(!pg->rtpg_sdev))
@@ -857,10 +858,7 @@ alua_rtpg_select_sdev(struct alua_port_group *pg)
 
 	sdev_printk(KERN_INFO, sdev, "rtpg retry on different device\n");
 
-	prev_sdev = pg->rtpg_sdev;
-	pg->rtpg_sdev = sdev;
-
-	return prev_sdev;
+	return __xchg(&pg->rtpg_sdev, sdev);
 }
 
 static void alua_rtpg_work(struct work_struct *work)
diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index 182aaae6038689..16b5317572832e 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -27,6 +27,7 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/lockdep.h>
+#include <linux/non-atomic/xchg.h>
 
 #include <scsi/scsi.h>
 #include <scsi/scsi_cmnd.h>
@@ -943,11 +944,7 @@ __lpfc_sli_get_iocbq(struct lpfc_hba *phba)
 struct lpfc_sglq *
 __lpfc_clear_active_sglq(struct lpfc_hba *phba, uint16_t xritag)
 {
-	struct lpfc_sglq *sglq;
-
-	sglq = phba->sli4_hba.lpfc_sglq_active_list[xritag];
-	phba->sli4_hba.lpfc_sglq_active_list[xritag] = NULL;
-	return sglq;
+	return __xchg(&phba->sli4_hba.lpfc_sglq_active_list[xritag], NULL);
 }
 
 /**
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 9ab8ee46ef6689..56c7d666e40433 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -20,6 +20,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/pci.h>
 #include <linux/proc_fs.h>
 #include <linux/skbuff.h>
@@ -493,8 +494,6 @@ static void rtllib_txrate_selectmode(struct rtllib_device *ieee,
 static u16 rtllib_query_seqnum(struct rtllib_device *ieee, struct sk_buff *skb,
 			       u8 *dst)
 {
-	u16 seqnum = 0;
-
 	if (is_multicast_ether_addr(dst))
 		return 0;
 	if (IsQoSDataFrame(skb->data)) {
@@ -503,9 +502,7 @@ static u16 rtllib_query_seqnum(struct rtllib_device *ieee, struct sk_buff *skb,
 		if (!GetTs(ieee, (struct ts_common_info **)(&pTS), dst,
 			   skb->priority, TX_DIR, true))
 			return 0;
-		seqnum = pTS->TxCurSeq;
-		pTS->TxCurSeq = (pTS->TxCurSeq + 1) % 4096;
-		return seqnum;
+		return __xchg(&pTS->TxCurSeq, (pTS->TxCurSeq + 1) % 4096);
 	}
 	return 0;
 }
diff --git a/drivers/tty/hvc/hvc_iucv.c b/drivers/tty/hvc/hvc_iucv.c
index 7d49a872de48ab..14b19bdb54add6 100644
--- a/drivers/tty/hvc/hvc_iucv.c
+++ b/drivers/tty/hvc/hvc_iucv.c
@@ -21,6 +21,7 @@
 #include <linux/init.h>
 #include <linux/mempool.h>
 #include <linux/moduleparam.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/tty.h>
 #include <linux/wait.h>
 #include <net/iucv/iucv.h>
@@ -388,7 +389,7 @@ static int hvc_iucv_queue(struct hvc_iucv_private *priv, const char *buf,
 static int hvc_iucv_send(struct hvc_iucv_private *priv)
 {
 	struct iucv_tty_buffer *sb;
-	int rc, len;
+	int rc;
 
 	if (priv->iucv_state == IUCV_SEVERED)
 		return -EPIPE;
@@ -419,10 +420,7 @@ static int hvc_iucv_send(struct hvc_iucv_private *priv)
 		list_del(&sb->list);
 		destroy_tty_buffer(sb);
 	}
-	len = priv->sndbuf_len;
-	priv->sndbuf_len = 0;
-
-	return len;
+	return __xchg(&priv->sndbuf_len, 0);
 }
 
 /**
diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index cfba776afcea6d..a899d9bcf45361 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -27,6 +27,7 @@
 #include <linux/errno.h>
 #include <linux/string.h>
 #include <linux/mm.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/screen_info.h>
 #include <linux/slab.h>
 #include <linux/fb.h>
@@ -3261,10 +3262,7 @@ sisfb_poh_new_node(struct SIS_HEAP *memheap)
 		memheap->poh_freelist = &poha->aoh[0];
 	}
 
-	poh = memheap->poh_freelist;
-	memheap->poh_freelist = poh->poh_next;
-
-	return poh;
+	return __xchg(&memheap->poh_freelist, poh->poh_next);
 }
 
 static struct SIS_OH *
diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index e1ec725c2819d4..471e8aacb87c1d 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -37,6 +37,7 @@
 #include <linux/memblock.h>
 #include <linux/sched.h>
 #include <linux/mm.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include <linux/uaccess.h>
@@ -901,10 +902,7 @@ static inline struct page *cache_deq(struct gnttab_page_cache *cache)
 {
 	struct page *page;
 
-	page = cache->pages;
-	cache->pages = page->zone_device_data;
-
-	return page;
+	return __xchg(&cache->pages, page->zone_device_data);
 }
 
 static inline void cache_enq(struct gnttab_page_cache *cache, struct page *page)
diff --git a/fs/namespace.c b/fs/namespace.c
index ab467ee5834115..77e479b7dcd011 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -12,6 +12,7 @@
 #include <linux/export.h>
 #include <linux/capability.h>
 #include <linux/mnt_namespace.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/user_namespace.h>
 #include <linux/namei.h>
 #include <linux/security.h>
@@ -990,15 +991,12 @@ static void __touch_mnt_namespace(struct mnt_namespace *ns)
  */
 static struct mountpoint *unhash_mnt(struct mount *mnt)
 {
-	struct mountpoint *mp;
 	mnt->mnt_parent = mnt;
 	mnt->mnt_mountpoint = mnt->mnt.mnt_root;
 	list_del_init(&mnt->mnt_child);
 	hlist_del_init_rcu(&mnt->mnt_hash);
 	hlist_del_init(&mnt->mnt_mp_list);
-	mp = mnt->mnt_mp;
-	mnt->mnt_mp = NULL;
-	return mp;
+	return __xchg(&mnt->mnt_mp, NULL);
 }
 
 /*
diff --git a/include/linux/ptr_ring.h b/include/linux/ptr_ring.h
index 808f9d3ee54654..62403901aaf391 100644
--- a/include/linux/ptr_ring.h
+++ b/include/linux/ptr_ring.h
@@ -24,6 +24,7 @@
 #include <linux/compiler.h>
 #include <linux/slab.h>
 #include <linux/mm.h>
+#include <linux/non-atomic/xchg.h>
 #include <asm/errno.h>
 #endif
 
@@ -560,7 +561,6 @@ static inline void **__ptr_ring_swap_queue(struct ptr_ring *r, void **queue,
 					   void (*destroy)(void *))
 {
 	int producer = 0;
-	void **old;
 	void *ptr;
 
 	while ((ptr = __ptr_ring_consume(r)))
@@ -575,10 +575,7 @@ static inline void **__ptr_ring_swap_queue(struct ptr_ring *r, void **queue,
 	r->producer = producer;
 	r->consumer_head = 0;
 	r->consumer_tail = 0;
-	old = r->queue;
-	r->queue = queue;
-
-	return old;
+	return __xchg(&r->queue, queue);
 }
 
 /*
diff --git a/include/linux/qed/qed_chain.h b/include/linux/qed/qed_chain.h
index a84063492c71ae..3ea0d9442543ec 100644
--- a/include/linux/qed/qed_chain.h
+++ b/include/linux/qed/qed_chain.h
@@ -11,6 +11,7 @@
 #include <asm/byteorder.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/qed/common_hsi.h>
@@ -368,7 +369,7 @@ static inline void qed_chain_return_produced(struct qed_chain *p_chain)
  */
 static inline void *qed_chain_produce(struct qed_chain *p_chain)
 {
-	void *p_ret = NULL, *p_prod_idx, *p_prod_page_idx;
+	void *p_prod_idx, *p_prod_page_idx;
 
 	if (is_chain_u16(p_chain)) {
 		if ((p_chain->u.chain16.prod_idx &
@@ -390,11 +391,8 @@ static inline void *qed_chain_produce(struct qed_chain *p_chain)
 		p_chain->u.chain32.prod_idx++;
 	}
 
-	p_ret = p_chain->p_prod_elem;
-	p_chain->p_prod_elem = (void *)(((u8 *)p_chain->p_prod_elem) +
-					p_chain->elem_size);
-
-	return p_ret;
+	return __xchg(&p_chain->p_prod_elem,
+		      (void *)(((u8 *)p_chain->p_prod_elem) + p_chain->elem_size));
 }
 
 /**
@@ -439,7 +437,7 @@ static inline void qed_chain_recycle_consumed(struct qed_chain *p_chain)
  */
 static inline void *qed_chain_consume(struct qed_chain *p_chain)
 {
-	void *p_ret = NULL, *p_cons_idx, *p_cons_page_idx;
+	void *p_cons_idx, *p_cons_page_idx;
 
 	if (is_chain_u16(p_chain)) {
 		if ((p_chain->u.chain16.cons_idx &
@@ -461,11 +459,8 @@ static inline void *qed_chain_consume(struct qed_chain *p_chain)
 		p_chain->u.chain32.cons_idx++;
 	}
 
-	p_ret = p_chain->p_cons_elem;
-	p_chain->p_cons_elem = (void *)(((u8 *)p_chain->p_cons_elem) +
-					p_chain->elem_size);
-
-	return p_ret;
+	return __xchg(&p_chain->p_cons_elem,
+		      (void *)(((u8 *)p_chain->p_cons_elem) + p_chain->elem_size));
 }
 
 /**
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 58ac13b69dc8dc..f6881099307670 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -54,6 +54,7 @@
 #include <linux/fdtable.h>
 #include <linux/mm.h>
 #include <linux/mman.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/percpu.h>
 #include <linux/slab.h>
 #include <linux/bvec.h>
@@ -1096,8 +1097,6 @@ static void __io_req_find_next_prep(struct io_kiocb *req)
 
 static inline struct io_kiocb *io_req_find_next(struct io_kiocb *req)
 {
-	struct io_kiocb *nxt;
-
 	/*
 	 * If LINK is set, we have dependent requests in this chain. If we
 	 * didn't fail this request, queue the first one up, moving any other
@@ -1106,9 +1105,7 @@ static inline struct io_kiocb *io_req_find_next(struct io_kiocb *req)
 	 */
 	if (unlikely(req->flags & IO_DISARM_MASK))
 		__io_req_find_next_prep(req);
-	nxt = req->link;
-	req->link = NULL;
-	return nxt;
+	return __xchg(&req->link, NULL);
 }
 
 static void ctx_flush_and_put(struct io_ring_ctx *ctx, bool *locked)
diff --git a/mm/kmsan/init.c b/mm/kmsan/init.c
index 7fb794242fad01..2857276fb8a5b7 100644
--- a/mm/kmsan/init.c
+++ b/mm/kmsan/init.c
@@ -12,6 +12,7 @@
 #include <asm/sections.h>
 #include <linux/mm.h>
 #include <linux/memblock.h>
+#include <linux/non-atomic/xchg.h>
 
 #include "../internal.h"
 
@@ -154,13 +155,9 @@ static void smallstack_push(struct smallstack *stack, struct page *pages)
 
 static struct page *smallstack_pop(struct smallstack *stack)
 {
-	struct page *ret;
-
 	KMSAN_WARN_ON(stack->index == 0);
 	stack->index--;
-	ret = stack->items[stack->index];
-	stack->items[stack->index] = NULL;
-	return ret;
+	return __xchg(&stack->items[stack->index], NULL);
 }
 
 static void do_collection(void)
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index ab457f0394ab6e..120cf6e8c265e1 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -27,6 +27,7 @@
 
 #include <linux/page_counter.h>
 #include <linux/memcontrol.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/cgroup.h>
 #include <linux/pagewalk.h>
 #include <linux/sched/mm.h>
@@ -5968,16 +5969,11 @@ static const struct mm_walk_ops precharge_walk_ops = {
 
 static unsigned long mem_cgroup_count_precharge(struct mm_struct *mm)
 {
-	unsigned long precharge;
-
 	mmap_read_lock(mm);
 	walk_page_range(mm, 0, ULONG_MAX, &precharge_walk_ops, NULL);
 	mmap_read_unlock(mm);
 
-	precharge = mc.precharge;
-	mc.precharge = 0;
-
-	return precharge;
+	return __xchg(&mc.precharge, 0);
 }
 
 static int mem_cgroup_precharge_mc(struct mm_struct *mm)
diff --git a/net/mac80211/rc80211_minstrel_ht.c b/net/mac80211/rc80211_minstrel_ht.c
index 762346598338d3..291903561049a1 100644
--- a/net/mac80211/rc80211_minstrel_ht.c
+++ b/net/mac80211/rc80211_minstrel_ht.c
@@ -11,6 +11,7 @@
 #include <linux/moduleparam.h>
 #include <linux/ieee80211.h>
 #include <linux/minmax.h>
+#include <linux/non-atomic/xchg.h>
 #include <net/mac80211.h>
 #include "rate.h"
 #include "sta_info.h"
@@ -702,16 +703,13 @@ __minstrel_ht_get_sample_rate(struct minstrel_ht_sta *mi,
 			      enum minstrel_sample_type type)
 {
 	u16 *rates = mi->sample[type].sample_rates;
-	u16 cur;
 	int i;
 
 	for (i = 0; i < MINSTREL_SAMPLE_RATES; i++) {
 		if (!rates[i])
 			continue;
 
-		cur = rates[i];
-		rates[i] = 0;
-		return cur;
+		return __xchg(&rates[i], 0);
 	}
 
 	return 0;
diff --git a/sound/pci/asihpi/hpidebug.c b/sound/pci/asihpi/hpidebug.c
index 9570d9a44fe8db..3ad85f7423c5a3 100644
--- a/sound/pci/asihpi/hpidebug.c
+++ b/sound/pci/asihpi/hpidebug.c
@@ -9,6 +9,8 @@ Debug macro translation.
 
 ************************************************************************/
 
+#include <linux/non-atomic/xchg.h>
+
 #include "hpi_internal.h"
 #include "hpidebug.h"
 
@@ -22,11 +24,7 @@ void hpi_debug_init(void)
 
 int hpi_debug_level_set(int level)
 {
-	int old_level;
-
-	old_level = hpi_debug_level;
-	hpi_debug_level = level;
-	return old_level;
+	return __xchg(&hpi_debug_level, level);
 }
 
 int hpi_debug_level_get(void)
diff --git a/tools/testing/selftests/bpf/progs/dummy_st_ops.c b/tools/testing/selftests/bpf/progs/dummy_st_ops.c
index ead87edb75e257..8acfbbfcf6006a 100644
--- a/tools/testing/selftests/bpf/progs/dummy_st_ops.c
+++ b/tools/testing/selftests/bpf/progs/dummy_st_ops.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2021. Huawei Technologies Co., Ltd */
 #include <linux/bpf.h>
+#include <linux/non-atomic/xchg.h>
 #include <bpf/bpf_helpers.h>
 #include <bpf/bpf_tracing.h>
 
@@ -19,14 +20,10 @@ char _license[] SEC("license") = "GPL";
 SEC("struct_ops/test_1")
 int BPF_PROG(test_1, struct bpf_dummy_ops_state *state)
 {
-	int ret;
-
 	if (!state)
 		return 0xf2f3f4f5;
 
-	ret = state->val;
-	state->val = 0x5a;
-	return ret;
+	return __xchg(&state->val, 0x5a);
 }
 
 __u64 test_2_args[5];
-- 
2.34.1

