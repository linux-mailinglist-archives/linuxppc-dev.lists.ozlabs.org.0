Return-Path: <linuxppc-dev+bounces-13508-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A40AC199C4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 11:12:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxNLk0l64z3dyx;
	Wed, 29 Oct 2025 21:11:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761732686;
	cv=none; b=QS+F8PtqZieOJ7fVFhiv0f83AhbOafp/LRugbrNjjYjW/WUFZLRq1cCZPWPJ8STg5Mr4FhbFowUokcq17gif4jOAjkgZLmlaeBBpIBgaSgbRyLj8zIZLTeEn3iepy9S6hxpAgQEjHjX6TAga7wRNTveWKqjxRIsgAhAjiHy0YNlTcWc7+UPlZoo7n8KXrqnSkKSMfeN7WdSjHs+d46gXYo0I8HMhXKLMcHXumf2tPdQHVca+LRbZOJ7SaXasx3sjQ5wetIYyeonPPw9EbHI84KxNP918kluMpYEQ339iyGKDnkXnX0/qPNJtGVzY+i0ech9JtQebxhvg02o+jNC9Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761732686; c=relaxed/relaxed;
	bh=LSTNiBIzFf/HrkV1SFNB0DrJ0+NvHZ8+T6y0GlTjwWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oz6ysDbebD2UPSJPwdslwx+WoevqPdXa2w3kRkmWygOuAlLe0r43k35fHeFA3rIXK21bDpdr6g1Cx8Mt4XFGHA4lFVEL7WRTPyMaSdZTv3mW6SEsM3zHFUlaSBO7dJy2VVi/MX5nwXnBc7cZIWAKrZM4/v+C7tWAVzS+KJVve4z8pt3KJXRvz4YiAQfRXr6mR/LGvjB6ExpwmZ1lWGEcYgOyWq1rkncTmpk4M+HwVOKXTgaMuyAUrvXs3HLzl1K2P2cZVtgZbKY9c0z0cs+ViBIH6w4s3HzbxqJQJiqSfFNDBoi4j9t7MjzRrG353pNG5Z05hVx1v2RI0lhbFbhXGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxNLj2LlPz3dtT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 21:11:25 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FBE32C1D;
	Wed, 29 Oct 2025 03:10:46 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A7ED3F66E;
	Wed, 29 Oct 2025 03:10:49 -0700 (PDT)
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
Subject: [PATCH v4 12/12] mm: bail out of lazy_mmu_mode_* in interrupt context
Date: Wed, 29 Oct 2025 10:09:09 +0000
Message-ID: <20251029100909.3381140-13-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251029100909.3381140-1-kevin.brodsky@arm.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The lazy MMU mode cannot be used in interrupt context. This is
documented in <linux/pgtable.h>, but isn't consistently handled
across architectures.

arm64 ensures that calls to lazy_mmu_mode_* have no effect in
interrupt context, because such calls do occur in certain
configurations - see commit b81c688426a9 ("arm64/mm: Disable barrier
batching in interrupt contexts"). Other architectures do not check
this situation, most likely because it hasn't occurred so far.

Both arm64 and x86/Xen also ensure that any lazy MMU optimisation is
disabled while in interrupt mode (see queue_pte_barriers() and
xen_get_lazy_mode() respectively).

Let's handle this in the new generic lazy_mmu layer, in the same
fashion as arm64: bail out of lazy_mmu_mode_* if in_interrupt(), and
have in_lazy_mmu_mode() return false to disable any optimisation.
Also remove the arm64 handling that is now redundant; x86/Xen has
its own internal tracking so it is left unchanged.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 17 +----------------
 include/linux/pgtable.h          | 16 ++++++++++++++--
 include/linux/sched.h            |  3 +++
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 61ca88f94551..96987a49e83b 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -62,37 +62,22 @@ static inline void emit_pte_barriers(void)
 
 static inline void queue_pte_barriers(void)
 {
-	if (in_interrupt()) {
-		emit_pte_barriers();
-		return;
-	}
-
 	if (in_lazy_mmu_mode())
 		test_and_set_thread_flag(TIF_LAZY_MMU_PENDING);
 	else
 		emit_pte_barriers();
 }
 
-static inline void arch_enter_lazy_mmu_mode(void)
-{
-	if (in_interrupt())
-		return;
-}
+static inline void arch_enter_lazy_mmu_mode(void) {}
 
 static inline void arch_flush_lazy_mmu_mode(void)
 {
-	if (in_interrupt())
-		return;
-
 	if (test_and_clear_thread_flag(TIF_LAZY_MMU_PENDING))
 		emit_pte_barriers();
 }
 
 static inline void arch_leave_lazy_mmu_mode(void)
 {
-	if (in_interrupt())
-		return;
-
 	arch_flush_lazy_mmu_mode();
 }
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e6064e00b22d..e6069ce4ec83 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -228,8 +228,8 @@ static inline int pmd_dirty(pmd_t pmd)
  * of the lazy mode. So the implementation must assume preemption may be enabled
  * and cpu migration is possible; it must take steps to be robust against this.
  * (In practice, for user PTE updates, the appropriate page table lock(s) are
- * held, but for kernel PTE updates, no lock is held). The mode cannot be used
- * in interrupt context.
+ * held, but for kernel PTE updates, no lock is held). The mode is disabled
+ * in interrupt context and calls to the lazy_mmu API have no effect.
  *
  * The lazy MMU mode is enabled for a given block of code using:
  *
@@ -265,6 +265,9 @@ static inline void lazy_mmu_mode_enable(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
+	if (in_interrupt())
+		return;
+
 	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
 	/* enable() must not be called while paused */
 	VM_WARN_ON(state->nesting_level > 0 && !state->active);
@@ -279,6 +282,9 @@ static inline void lazy_mmu_mode_disable(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
+	if (in_interrupt())
+		return;
+
 	VM_WARN_ON_ONCE(state->nesting_level == 0);
 	VM_WARN_ON(!state->active);
 
@@ -295,6 +301,9 @@ static inline void lazy_mmu_mode_pause(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
+	if (in_interrupt())
+		return;
+
 	VM_WARN_ON(state->nesting_level == 0 || !state->active);
 
 	state->active = false;
@@ -305,6 +314,9 @@ static inline void lazy_mmu_mode_resume(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
+	if (in_interrupt())
+		return;
+
 	VM_WARN_ON(state->nesting_level == 0 || state->active);
 
 	state->active = true;
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 11566d973f42..bb873016ffcf 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1731,6 +1731,9 @@ static inline char task_state_to_char(struct task_struct *tsk)
 #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
 static inline bool in_lazy_mmu_mode(void)
 {
+	if (in_interrupt())
+		return false;
+
 	return current->lazy_mmu_state.active;
 }
 #else
-- 
2.47.0


