Return-Path: <linuxppc-dev+bounces-12889-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF85FBDD67D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 10:29:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmkkq2s4Cz3d4F;
	Wed, 15 Oct 2025 19:28:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760516931;
	cv=none; b=gQpTo3BGDEnEgcf1ul+1yU5kvEH6ylYci5rP2LvBcgcpFdXX+UsRBSTLs1Lj2Uxf99dtL8PxDEstBkqFzQ7NK39JpFfwEv3563RJLCTGQRCURRyvL8iabZrzlgWr9QsvQljewh+7SOnaqapFS/TT7IdVkEkQ4reScFvqXG3I8dPUdKvdOLpM6kFrbtr2MQbzK5hFh1yW69fRAOBirwitt/BzUCvQpYMvfyrMHNfE27DsJpdX1bvVbfVMNiIlCrU85w/U/BAzg5f833Ke9NvEcB2A+J3M758NOyASlIwzTaI815s35zK4HydTplj1ny4kAgOus/niobXGSXe3Ot2YRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760516931; c=relaxed/relaxed;
	bh=NQTwqTlBXr6retjra5GPHcjItFw8MKUqPe4SY+8hd5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QzOeRuawnI6T3qdXRexpqbQLx4Qr9hmmB7cugVvR1OU5w63+m1acIFPWHK5yquMeJBkkERL/CxZpJtMwfzn+SdesJ+c5yACO7wLkiz1opzlA3w7TsOuW7GVQYIl3Guh5TkkjxIwe48LIMFT7lprZWlHtSZCOKKbuAM2O+vkRnSie2UMoSTZnozT+DFuwGB0W9s1NpXTDcbWwDYbAzzRGkd+Zuwx5grOzyXrDoX5MF0rYV5sWV9Jnxi2sqzcrb7u93Zgw11uGFclKNzd2pJXiTfvkR7eTeIDYSWZlZxq/b4/8NOpgMIF3nOXjn7Kq6d3+LpQob66bT6CpDG4yajYFmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmkkp4SJWz3d9v
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 19:28:50 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44DD11A32;
	Wed, 15 Oct 2025 01:28:12 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FFB93F66E;
	Wed, 15 Oct 2025 01:28:15 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jann Horn <jannh@google.com>,
	Juergen Gross <jgross@suse.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org
Subject: [PATCH v3 07/13] mm: enable lazy_mmu sections to nest
Date: Wed, 15 Oct 2025 09:27:21 +0100
Message-ID: <20251015082727.2395128-8-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251015082727.2395128-1-kevin.brodsky@arm.com>
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Despite recent efforts to prevent lazy_mmu sections from nesting, it
remains difficult to ensure that it never occurs - and in fact it
does occur on arm64 in certain situations (CONFIG_DEBUG_PAGEALLOC).
Commit 1ef3095b1405 ("arm64/mm: Permit lazy_mmu_mode to be nested")
made nesting tolerable on arm64, but without truly supporting it:
the inner call to leave() disables the batching optimisation before
the outer section ends.

This patch actually enables lazy_mmu sections to nest by tracking
the nesting level in task_struct, in a similar fashion to e.g.
pagefault_{enable,disable}(). This is fully handled by the generic
lazy_mmu helpers that were recently introduced.

lazy_mmu sections were not initially intended to nest, so we need to
clarify the semantics w.r.t. the arch_*_lazy_mmu_mode() callbacks.
This patch takes the following approach:

* The outermost calls to lazy_mmu_mode_{enable,disable}() trigger
  calls to arch_{enter,leave}_lazy_mmu_mode() - this is unchanged.

* Nested calls to lazy_mmu_mode_{enable,disable}() are not forwarded
  to the arch via arch_{enter,leave} - lazy MMU remains enabled so
  the assumption is that these callbacks are not relevant. However,
  existing code may rely on a call to disable() to flush any batched
  state, regardless of nesting. arch_flush_lazy_mmu_mode() is
  therefore called in that situation.

A separate interface was recently introduced to temporarily pause
the lazy MMU mode: lazy_mmu_mode_{pause,resume}(). pause() fully
exits the mode *regardless of the nesting level*, and resume()
restores the mode at the same nesting level.

Whether the mode is actually enabled or not at any point is tracked
by a separate "enabled" field in task_struct; this makes it possible
to check invariants in the generic API, and to expose a new
in_lazy_mmu_mode() helper to replace the various ways arch's
currently track whether the mode is enabled (this will be done in
later patches).

In summary (count/enabled represent the values *after* the call):

lazy_mmu_mode_enable()		-> arch_enter()	    count=1 enabled=1
    lazy_mmu_mode_enable()	-> ø		    count=2 enabled=1
	lazy_mmu_mode_pause()	-> arch_leave()     count=2 enabled=0
	lazy_mmu_mode_resume()	-> arch_enter()     count=2 enabled=1
    lazy_mmu_mode_disable()	-> arch_flush()     count=1 enabled=1
lazy_mmu_mode_disable()		-> arch_leave()     count=0 enabled=0

Note: in_lazy_mmu_mode() is added to <linux/sched.h> to allow arch
headers included by <linux/pgtable.h> to use it.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
Alexander Gordeev suggested that a future optimisation may need
lazy_mmu_mode_{pause,resume}() to call distinct arch callbacks [1]. For
now arch_{leave,enter}() are called directly, but introducing new arch
callbacks should be straightforward.

[1] https://lore.kernel.org/all/5a0818bb-75d4-47df-925c-0102f7d598f4-agordeev@linux.ibm.com/
---
 arch/arm64/include/asm/pgtable.h | 12 ------
 include/linux/mm_types_task.h    |  5 +++
 include/linux/pgtable.h          | 69 ++++++++++++++++++++++++++++++--
 include/linux/sched.h            | 16 ++++++++
 4 files changed, 86 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index e3cbb10288c4..f15ca4d62f09 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -82,18 +82,6 @@ static inline void queue_pte_barriers(void)
 
 static inline void arch_enter_lazy_mmu_mode(void)
 {
-	/*
-	 * lazy_mmu_mode is not supposed to permit nesting. But in practice this
-	 * does happen with CONFIG_DEBUG_PAGEALLOC, where a page allocation
-	 * inside a lazy_mmu_mode section (such as zap_pte_range()) will change
-	 * permissions on the linear map with apply_to_page_range(), which
-	 * re-enters lazy_mmu_mode. So we tolerate nesting in our
-	 * implementation. The first call to arch_leave_lazy_mmu_mode() will
-	 * flush and clear the flag such that the remainder of the work in the
-	 * outer nest behaves as if outside of lazy mmu mode. This is safe and
-	 * keeps tracking simple.
-	 */
-
 	if (in_interrupt())
 		return;
 
diff --git a/include/linux/mm_types_task.h b/include/linux/mm_types_task.h
index a82aa80c0ba4..2ff83b85fef0 100644
--- a/include/linux/mm_types_task.h
+++ b/include/linux/mm_types_task.h
@@ -88,4 +88,9 @@ struct tlbflush_unmap_batch {
 #endif
 };
 
+struct lazy_mmu_state {
+	u8 count;
+	bool enabled;
+};
+
 #endif /* _LINUX_MM_TYPES_TASK_H */
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 194b2c3e7576..269225a733de 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -228,28 +228,89 @@ static inline int pmd_dirty(pmd_t pmd)
  * of the lazy mode. So the implementation must assume preemption may be enabled
  * and cpu migration is possible; it must take steps to be robust against this.
  * (In practice, for user PTE updates, the appropriate page table lock(s) are
- * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
- * and the mode cannot be used in interrupt context.
+ * held, but for kernel PTE updates, no lock is held). The mode cannot be used
+ * in interrupt context.
+ *
+ * The lazy MMU mode is enabled for a given block of code using:
+ *
+ *   lazy_mmu_mode_enable();
+ *   <code>
+ *   lazy_mmu_mode_disable();
+ *
+ * Nesting is permitted: <code> may itself use an enable()/disable() pair.
+ * A nested call to enable() has no functional effect; however disable() causes
+ * any batched architectural state to be flushed regardless of nesting. After a
+ * call to disable(), the caller can therefore rely on all previous page table
+ * modifications to have taken effect, but the lazy MMU mode may still be
+ * enabled.
+ *
+ * In certain cases, it may be desirable to temporarily pause the lazy MMU mode.
+ * This can be done using:
+ *
+ *   lazy_mmu_mode_pause();
+ *   <code>
+ *   lazy_mmu_mode_resume();
+ *
+ * This sequence must only be used if the lazy MMU mode is already enabled.
+ * pause() ensures that the mode is exited regardless of the nesting level;
+ * resume() re-enters the mode at the same nesting level. <code> must not modify
+ * the lazy MMU state (i.e. it must not call any of the lazy_mmu_mode_*
+ * helpers).
+ *
+ * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
+ * currently enabled.
  */
 #ifdef CONFIG_ARCH_LAZY_MMU
 static inline void lazy_mmu_mode_enable(void)
 {
-	arch_enter_lazy_mmu_mode();
+	struct lazy_mmu_state *state = &current->lazy_mmu_state;
+
+	VM_BUG_ON(state->count == U8_MAX);
+	/* enable() must not be called while paused */
+	VM_WARN_ON(state->count > 0 && !state->enabled);
+
+	if (state->count == 0) {
+		arch_enter_lazy_mmu_mode();
+		state->enabled = true;
+	}
+	++state->count;
 }
 
 static inline void lazy_mmu_mode_disable(void)
 {
-	arch_leave_lazy_mmu_mode();
+	struct lazy_mmu_state *state = &current->lazy_mmu_state;
+
+	VM_BUG_ON(state->count == 0);
+	VM_WARN_ON(!state->enabled);
+
+	--state->count;
+	if (state->count == 0) {
+		state->enabled = false;
+		arch_leave_lazy_mmu_mode();
+	} else {
+		/* Exiting a nested section */
+		arch_flush_lazy_mmu_mode();
+	}
 }
 
 static inline void lazy_mmu_mode_pause(void)
 {
+	struct lazy_mmu_state *state = &current->lazy_mmu_state;
+
+	VM_WARN_ON(state->count == 0 || !state->enabled);
+
+	state->enabled = false;
 	arch_leave_lazy_mmu_mode();
 }
 
 static inline void lazy_mmu_mode_resume(void)
 {
+	struct lazy_mmu_state *state = &current->lazy_mmu_state;
+
+	VM_WARN_ON(state->count == 0 || state->enabled);
+
 	arch_enter_lazy_mmu_mode();
+	state->enabled = true;
 }
 #else
 static inline void lazy_mmu_mode_enable(void) {}
diff --git a/include/linux/sched.h b/include/linux/sched.h
index cbb7340c5866..2862d8bf2160 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1441,6 +1441,10 @@ struct task_struct {
 
 	struct page_frag		task_frag;
 
+#ifdef CONFIG_ARCH_LAZY_MMU
+	struct lazy_mmu_state		lazy_mmu_state;
+#endif
+
 #ifdef CONFIG_TASK_DELAY_ACCT
 	struct task_delay_info		*delays;
 #endif
@@ -1724,6 +1728,18 @@ static inline char task_state_to_char(struct task_struct *tsk)
 	return task_index_to_char(task_state_index(tsk));
 }
 
+#ifdef CONFIG_ARCH_LAZY_MMU
+static inline bool in_lazy_mmu_mode(void)
+{
+	return current->lazy_mmu_state.enabled;
+}
+#else
+static inline bool in_lazy_mmu_mode(void)
+{
+	return false;
+}
+#endif
+
 extern struct pid *cad_pid;
 
 /*
-- 
2.47.0


