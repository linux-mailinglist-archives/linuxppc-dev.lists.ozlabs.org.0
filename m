Return-Path: <linuxppc-dev+bounces-14770-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 970A8CBE7CE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Dec 2025 16:05:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVNdm18fHz2ypk;
	Tue, 16 Dec 2025 02:05:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765811100;
	cv=none; b=S8sUbOBBwxTkr0smNdcYPGjtdF4Lq8fFym5mvhZj763VewA1vrR6iI2HjHe/Tz69llUWYHnc9rpKqLjiNE2eCGxpx4Wh109BJBGWOp01vCCIQ9BqRARswXrX2VqkpYZ9L2lFnyo9d/gltMyzpDgE3ZiEqeqhu+wVNzFyOlTPproBgi/tB3pAIG7n80Ob9c3umYaxSVAfGoV3NDVALRB5sXi6OAbvPPMkLzwpZOZWE6l2qpB+umbsr1kJr2Ile5EXYM+QP04nqgdGSJIC0DwOfPO35AfznYxSilQdnaPhsm5yOyVcbVXObYi7KfnVPhqAblijKWtFM3gWS5YR3IIYJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765811100; c=relaxed/relaxed;
	bh=xoHbVHv+XTmW3E1WW4ukDXvOPBr3IO8T4igWzmkfQHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nGt2BK8HwXYRFR5rUyDnti64DXdTr1oXU3n/wEZqA1fdMGXk4J95Of0RhKavQ8MjaRNEjriCq6T6Gzg+kVV6JabGL+DcRcsorAL/cVhTK2XuZJjoC0DPKfexRyobSSXYTqZedXhuqlsUP8Y/1JZaE1YY/PeLr/dEZnlKFN0jDqUKdd6PJH1TRpjSKaQU99a0EQwhaOBY4zpoFl90oxAqzawtS2FlO93AGA9sW0Fuey9wx5D6dCF7rBcU3ubnrHN0jmeyxXxZEZCysY+T+wOslqRVeKKwrbxDheAf3N35TKjvEd6KvnYA8iwrTz6mfU1296/4UZLFV1kCwX9mn296uQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVNdl2g6Yz2yY9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 02:04:59 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C467169C;
	Mon, 15 Dec 2025 07:04:21 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3A423F73B;
	Mon, 15 Dec 2025 07:04:22 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Woodhouse <dwmw2@infradead.org>,
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
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org,
	"David Hildenbrand (Red Hat)" <david@kernel.org>
Subject: [PATCH v6 09/14] mm: enable lazy_mmu sections to nest
Date: Mon, 15 Dec 2025 15:03:18 +0000
Message-ID: <20251215150323.2218608-10-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251215150323.2218608-1-kevin.brodsky@arm.com>
References: <20251215150323.2218608-1-kevin.brodsky@arm.com>
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

pause()/resume() are themselves allowed to nest, so we actually
store two nesting levels in task_struct: enable_count and
pause_count. A new helper is_lazy_mmu_mode_active() is introduced to
determine whether we are currently in lazy MMU mode; this will be
used in subsequent patches to replace the various ways arch's
currently track whether the mode is enabled.

In summary (enable/pause represent the values *after* the call):

lazy_mmu_mode_enable()		-> arch_enter()	    enable=1 pause=0
    lazy_mmu_mode_enable()	-> ø		    enable=2 pause=0
	lazy_mmu_mode_pause()	-> arch_leave()     enable=2 pause=1
	lazy_mmu_mode_resume()	-> arch_enter()     enable=2 pause=0
    lazy_mmu_mode_disable()	-> arch_flush()     enable=1 pause=0
lazy_mmu_mode_disable()		-> arch_leave()     enable=0 pause=0

Note: is_lazy_mmu_mode_active() is added to <linux/sched.h> to allow
arch headers included by <linux/pgtable.h> to use it.

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/pgtable.h |  12 ----
 include/linux/mm_types_task.h    |   5 ++
 include/linux/pgtable.h          | 114 +++++++++++++++++++++++++++++--
 include/linux/sched.h            |  45 ++++++++++++
 4 files changed, 157 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index bf9178902bdb..7f528c36d53c 100644
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
 	set_thread_flag(TIF_LAZY_MMU);
 }
 
diff --git a/include/linux/mm_types_task.h b/include/linux/mm_types_task.h
index a82aa80c0ba4..11bf319d78ec 100644
--- a/include/linux/mm_types_task.h
+++ b/include/linux/mm_types_task.h
@@ -88,4 +88,9 @@ struct tlbflush_unmap_batch {
 #endif
 };
 
+struct lazy_mmu_state {
+	u8 enable_count;
+	u8 pause_count;
+};
+
 #endif /* _LINUX_MM_TYPES_TASK_H */
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index dddde6873d1e..2f0dd3a4ace1 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -236,39 +236,139 @@ static inline int pmd_dirty(pmd_t pmd)
  * The mode is disabled in interrupt context and calls to the lazy_mmu API have
  * no effect.
  *
- * Nesting is not permitted.
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
+ * pause() ensures that the mode is exited regardless of the nesting level;
+ * resume() re-enters the mode at the same nesting level. Any call to the
+ * lazy_mmu_mode_* API between those two calls has no effect. In particular,
+ * this means that pause()/resume() pairs may nest.
+ *
+ * is_lazy_mmu_mode_active() can be used to check whether the lazy MMU mode is
+ * currently enabled.
  */
 #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
+/**
+ * lazy_mmu_mode_enable() - Enable the lazy MMU mode.
+ *
+ * Enters a new lazy MMU mode section; if the mode was not already enabled,
+ * enables it and calls arch_enter_lazy_mmu_mode().
+ *
+ * Must be paired with a call to lazy_mmu_mode_disable().
+ *
+ * Has no effect if called:
+ * - While paused - see lazy_mmu_mode_pause()
+ * - In interrupt context
+ */
 static inline void lazy_mmu_mode_enable(void)
 {
-	if (in_interrupt())
+	struct lazy_mmu_state *state = &current->lazy_mmu_state;
+
+	if (in_interrupt() || state->pause_count > 0)
 		return;
 
-	arch_enter_lazy_mmu_mode();
+	VM_WARN_ON_ONCE(state->enable_count == U8_MAX);
+
+	if (state->enable_count++ == 0)
+		arch_enter_lazy_mmu_mode();
 }
 
+/**
+ * lazy_mmu_mode_disable() - Disable the lazy MMU mode.
+ *
+ * Exits the current lazy MMU mode section. If it is the outermost section,
+ * disables the mode and calls arch_leave_lazy_mmu_mode(). Otherwise (nested
+ * section), calls arch_flush_lazy_mmu_mode().
+ *
+ * Must match a call to lazy_mmu_mode_enable().
+ *
+ * Has no effect if called:
+ * - While paused - see lazy_mmu_mode_pause()
+ * - In interrupt context
+ */
 static inline void lazy_mmu_mode_disable(void)
 {
-	if (in_interrupt())
+	struct lazy_mmu_state *state = &current->lazy_mmu_state;
+
+	if (in_interrupt() || state->pause_count > 0)
 		return;
 
-	arch_leave_lazy_mmu_mode();
+	VM_WARN_ON_ONCE(state->enable_count == 0);
+
+	if (--state->enable_count == 0)
+		arch_leave_lazy_mmu_mode();
+	else /* Exiting a nested section */
+		arch_flush_lazy_mmu_mode();
+
 }
 
+/**
+ * lazy_mmu_mode_pause() - Pause the lazy MMU mode.
+ *
+ * Pauses the lazy MMU mode; if it is currently active, disables it and calls
+ * arch_leave_lazy_mmu_mode().
+ *
+ * Must be paired with a call to lazy_mmu_mode_resume(). Calls to the
+ * lazy_mmu_mode_* API have no effect until the matching resume() call.
+ *
+ * Has no effect if called:
+ * - While paused (inside another pause()/resume() pair)
+ * - In interrupt context
+ */
 static inline void lazy_mmu_mode_pause(void)
 {
+	struct lazy_mmu_state *state = &current->lazy_mmu_state;
+
 	if (in_interrupt())
 		return;
 
-	arch_leave_lazy_mmu_mode();
+	VM_WARN_ON_ONCE(state->pause_count == U8_MAX);
+
+	if (state->pause_count++ == 0 && state->enable_count > 0)
+		arch_leave_lazy_mmu_mode();
 }
 
+/**
+ * lazy_mmu_mode_resume() - Resume the lazy MMU mode.
+ *
+ * Resumes the lazy MMU mode; if it was active at the point where the matching
+ * call to lazy_mmu_mode_pause() was made, re-enables it and calls
+ * arch_enter_lazy_mmu_mode().
+ *
+ * Must match a call to lazy_mmu_mode_pause().
+ *
+ * Has no effect if called:
+ * - While paused (inside another pause()/resume() pair)
+ * - In interrupt context
+ */
 static inline void lazy_mmu_mode_resume(void)
 {
+	struct lazy_mmu_state *state = &current->lazy_mmu_state;
+
 	if (in_interrupt())
 		return;
 
-	arch_enter_lazy_mmu_mode();
+	VM_WARN_ON_ONCE(state->pause_count == 0);
+
+	if (--state->pause_count == 0 && state->enable_count > 0)
+		arch_enter_lazy_mmu_mode();
 }
 #else
 static inline void lazy_mmu_mode_enable(void) {}
diff --git a/include/linux/sched.h b/include/linux/sched.h
index d395f2810fac..f2fc6584c790 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1419,6 +1419,10 @@ struct task_struct {
 
 	struct page_frag		task_frag;
 
+#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
+	struct lazy_mmu_state		lazy_mmu_state;
+#endif
+
 #ifdef CONFIG_TASK_DELAY_ACCT
 	struct task_delay_info		*delays;
 #endif
@@ -1702,6 +1706,47 @@ static inline char task_state_to_char(struct task_struct *tsk)
 	return task_index_to_char(task_state_index(tsk));
 }
 
+#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
+/**
+ * __task_lazy_mmu_mode_active() - Test the lazy MMU mode state for a task.
+ * @tsk: The task to check.
+ *
+ * Test whether @tsk has its lazy MMU mode state set to active (i.e. enabled
+ * and not paused).
+ *
+ * This function only considers the state saved in task_struct; to test whether
+ * current actually is in lazy MMU mode, is_lazy_mmu_mode_active() should be
+ * used instead.
+ *
+ * This function is intended for architectures that implement the lazy MMU
+ * mode; it must not be called from generic code.
+ */
+static inline bool __task_lazy_mmu_mode_active(struct task_struct *tsk)
+{
+	struct lazy_mmu_state *state = &tsk->lazy_mmu_state;
+
+	return state->enable_count > 0 && state->pause_count == 0;
+}
+
+/**
+ * is_lazy_mmu_mode_active() - Test whether we are currently in lazy MMU mode.
+ *
+ * Test whether the current context is in lazy MMU mode. This is true if both:
+ * 1. We are not in interrupt context
+ * 2. Lazy MMU mode is active for the current task
+ *
+ * This function is intended for architectures that implement the lazy MMU
+ * mode; it must not be called from generic code.
+ */
+static inline bool is_lazy_mmu_mode_active(void)
+{
+	if (in_interrupt())
+		return false;
+
+	return __task_lazy_mmu_mode_active(current);
+}
+#endif
+
 extern struct pid *cad_pid;
 
 /*
-- 
2.51.2


