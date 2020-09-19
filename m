Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 884A8270CDC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 12:15:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Btmn03rjWzDrDJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 20:15:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=EmzU/Ha7; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=3MSiTX3/; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtmCh1t19zDqf1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 19:50:24 +1000 (AEST)
Message-Id: <20200919092617.279626264@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600509018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=CYFZGC5XFXwIeIdTxBbBsuptLpgHnLvRMVVfnfU0Lek=;
 b=EmzU/Ha7VTgCHPh+OPwMMAxl1vQw2EZbgMLA0QK5w0tgoNA9cK5GrZ+iRnxTLUvFmO6uvT
 5xni0RQrFsvKWLEwnxRXfnK1ZoluDBJkq1/t4BopRLVlWdsZl8LGtkYO5VPQeJOAVh0loT
 3pxfhX7Xzg7eD/HDkG7ZRFVEUuI8wNqIatH3iT0c6USltX67MnShz/PRGAOuuY98QpJcJF
 RKzxtBefOl4frfc7PbgyYDsbLhAgIw9uUlbWv2A+h4Ox5jUUab+vAsmRMaNniDuggLqVCk
 2DATRO4G8SXRfgThVN15NoLylHOz2CDJg97svW/xOW73oUnocZFgU2gqrFZxtA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600509018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=CYFZGC5XFXwIeIdTxBbBsuptLpgHnLvRMVVfnfU0Lek=;
 b=3MSiTX3/QibrqvIYfxIqARkPAbMeHtlldJHdL2IUUoOqwRf5x+Ph+DQIW8CwuSUBjdR486
 DKAgHE+Y4cwJC9Ag==
Date: Sat, 19 Sep 2020 11:18:05 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch RFC 14/15] sched: highmem: Store temporary kmaps in task struct
References: <20200919091751.011116649@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Segall <bsegall@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arch@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Instead of storing the map per CPU provide and use per task storage. That
prepares for temporary kmaps which are preemptible.

The context switch code is preparatory and not yet in use because
kmap_atomic() runs with preemption disabled. Will be made usable in the
next step.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/highmem.h |    1 
 include/linux/sched.h   |    9 +++++++
 kernel/sched/core.c     |   10 ++++++++
 mm/highmem.c            |   59 ++++++++++++++++++++++++++++++++++++++++++------
 4 files changed, 72 insertions(+), 7 deletions(-)

--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -38,6 +38,7 @@ static inline void invalidate_kernel_vma
 void *kmap_atomic_pfn_prot(unsigned long pfn, pgprot_t prot);
 void *kmap_atomic_page_prot(struct page *page, pgprot_t prot);
 void kunmap_atomic_indexed(void *vaddr);
+void kmap_switch_temporary(struct task_struct *prev, struct task_struct *next);
 # ifndef ARCH_NEEDS_KMAP_HIGH_GET
 static inline void *arch_kmap_temporary_high_get(struct page *page)
 {
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -34,6 +34,7 @@
 #include <linux/rseq.h>
 #include <linux/seqlock.h>
 #include <linux/kcsan.h>
+#include <asm/kmap_types.h>
 
 /* task_struct member predeclarations (sorted alphabetically): */
 struct audit_context;
@@ -628,6 +629,13 @@ struct wake_q_node {
 	struct wake_q_node *next;
 };
 
+struct kmap_ctrl {
+#ifdef CONFIG_KMAP_ATOMIC_GENERIC
+	int				idx;
+	pte_t				pteval[KM_TYPE_NR];
+#endif
+};
+
 struct task_struct {
 #ifdef CONFIG_THREAD_INFO_IN_TASK
 	/*
@@ -1280,6 +1288,7 @@ struct task_struct {
 	unsigned int			sequential_io;
 	unsigned int			sequential_io_avg;
 #endif
+	struct kmap_ctrl		kmap_ctrl;
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
 	unsigned long			task_state_change;
 #endif
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3529,6 +3529,15 @@ static inline void finish_lock_switch(st
 # define finish_arch_post_lock_switch()	do { } while (0)
 #endif
 
+static inline void kmap_temp_switch(struct task_struct *prev,
+				    struct task_struct *next)
+{
+#ifdef CONFIG_HIGHMEM
+	if (unlikely(prev->kmap_ctrl.idx || next->kmap_ctrl.idx))
+		kmap_switch_temporary(prev, next);
+#endif
+}
+
 /**
  * prepare_task_switch - prepare to switch tasks
  * @rq: the runqueue preparing to switch
@@ -3551,6 +3560,7 @@ prepare_task_switch(struct rq *rq, struc
 	perf_event_task_sched_out(prev, next);
 	rseq_preempt(prev);
 	fire_sched_out_preempt_notifiers(prev, next);
+	kmap_temp_switch(prev, next);
 	prepare_task(next);
 	prepare_arch_switch(next);
 }
--- a/mm/highmem.c
+++ b/mm/highmem.c
@@ -370,6 +370,7 @@ void kunmap_high(struct page *page)
 	if (need_wakeup)
 		wake_up(pkmap_map_wait);
 }
+
 EXPORT_SYMBOL(kunmap_high);
 #else
 static inline void kmap_high_unmap_temporary(unsigned long vaddr) { }
@@ -377,11 +378,9 @@ static inline void kmap_high_unmap_tempo
 
 #ifdef CONFIG_KMAP_ATOMIC_GENERIC
 
-static DEFINE_PER_CPU(int, __kmap_atomic_idx);
-
 static inline int kmap_atomic_idx_push(void)
 {
-	int idx = __this_cpu_inc_return(__kmap_atomic_idx) - 1;
+	int idx = current->kmap_ctrl.idx++;
 
 	WARN_ON_ONCE(in_irq() && !irqs_disabled());
 	BUG_ON(idx >= KM_TYPE_NR);
@@ -390,14 +389,13 @@ static inline int kmap_atomic_idx_push(v
 
 static inline int kmap_atomic_idx(void)
 {
-	return __this_cpu_read(__kmap_atomic_idx) - 1;
+	return current->kmap_ctrl.idx - 1;
 }
 
 static inline void kmap_atomic_idx_pop(void)
 {
-	int idx = __this_cpu_dec_return(__kmap_atomic_idx);
-
-	BUG_ON(idx < 0);
+	current->kmap_ctrl.idx--;
+	BUG_ON(current->kmap_ctrl.idx < 0);
 }
 
 #ifndef arch_kmap_temp_post_map
@@ -447,6 +445,7 @@ static void *__kmap_atomic_pfn_prot(unsi
 	pteval = pfn_pte(pfn, prot);
 	set_pte(kmap_pte - idx, pteval);
 	arch_kmap_temp_post_map(vaddr, pteval);
+	current->kmap_ctrl.pteval[kmap_atomic_idx()] = pteval;
 	preempt_enable();
 
 	return (void *)vaddr;
@@ -499,11 +498,57 @@ void kunmap_atomic_indexed(void *vaddr)
 	arch_kmap_temp_pre_unmap(addr);
 	pte_clear(&init_mm, addr, kmap_pte - idx);
 	arch_kmap_temp_post_unmap(addr);
+	current->kmap_ctrl.pteval[kmap_atomic_idx()] = __pte(0);
 	kmap_atomic_idx_pop();
 	preempt_enable();
 	pagefault_enable();
 }
 EXPORT_SYMBOL(kunmap_atomic_indexed);
+
+void kmap_switch_temporary(struct task_struct *prev, struct task_struct *next)
+{
+	pte_t *kmap_pte = kmap_get_pte();
+	int i;
+
+	/* Clear @prev's kmaps */
+	for (i = 0; i < prev->kmap_ctrl.idx; i++) {
+		pte_t pteval = prev->kmap_ctrl.pteval[i];
+		unsigned long addr;
+		int idx;
+
+		if (WARN_ON_ONCE(pte_none(pteval)))
+			continue;
+
+		/*
+		 * This is a horrible hack for XTENSA to calculate the
+		 * coloured PTE index. Uses the PFN encoded into the pteval
+		 * and the map index calculation because the actual mapped
+		 * virtual address is not stored in task::kmap_ctrl.
+		 *
+		 * For any sane architecture that address calculation is
+		 * optimized out.
+		 */
+		idx = arch_kmap_temp_map_idx(i, pte_pfn(pteval));
+
+		arch_kmap_temp_pre_unmap(addr);
+		pte_clear(&init_mm, addr, kmap_pte - idx);
+		arch_kmap_temp_post_unmap(addr);
+	}
+
+	/* Restore @next's kmaps */
+	for (i = 0; i < next->kmap_ctrl.idx; i++) {
+		pte_t pteval = next->kmap_ctrl.pteval[i];
+		int idx;
+
+		if (WARN_ON_ONCE(pte_none(pteval)))
+			continue;
+
+		idx = arch_kmap_temp_map_idx(i, pte_pfn(pteval));
+		set_pte(kmap_pte - idx, pteval);
+		arch_kmap_temp_post_map(addr, pteval);
+	}
+}
+
 #endif
 
 #if defined(HASHED_PAGE_VIRTUAL)

