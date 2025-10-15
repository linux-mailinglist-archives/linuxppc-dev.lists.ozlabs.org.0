Return-Path: <linuxppc-dev+bounces-12895-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5EDBDD6A7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 10:29:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmklM0tVjz3dQ9;
	Wed, 15 Oct 2025 19:29:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760516959;
	cv=none; b=bSYqxfqHuOSgNAMg0kAnWp4TFOoWz5fuIXf0vZfPCq87rqZjNhOHFtClW9jy8ui+aGZjX94tdouqTzT6ZqnrxKIqrAuKZh8XXWdYt64IIK8CacRDZZzGoqMLhXXPgIwj3JszY8mH+rNGSPvCW+qrYt0GzAjE4nMwFkF4yPQRdmiboc2qpkM9HYe1j278LuYws7KtF/ez3zT08YZwJEdUKVl8AHh9NKi/aDoikilEDWI5C9kwtUzQ6das6CnNKb/0O///gHn+q0kWxwsaNyhmiqZfFxU+VeyTQk9cZuIx2gDib/vgjOPVJoSx5SeQaQzlXxgIQYLEitDVurRx3q0y8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760516959; c=relaxed/relaxed;
	bh=gxy2WR9jIOFdN7YJmtvFh7KSjx/WBbD3EHjVYsBnWoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B0Oh7gLiPi3RDGUUHnt4SxgVHfqYW7fhuVaRiiUgczxU9mcGz4XHjeDLIy4gNKDt2bwFRSrOjjdrEVzfGE8c/VdCEbCxygqCfN1eAHlSLpdtE1ev/8S/mwJiePgsvBCh40KcOzHjSSphCJWJdicXNPjl912lq/VF+eGh9eWDzdVs758dkKnFZQUImSAGDaCgmKs3lHO+CyrYwPybgX1svxgdHoXYV771JWFLtLOvUwuma/TgbxxRhWpLNJfkxs1ePt2+CNV3rsLkTLVsHvucq3QOBA9ReU+6ppb6cybR70DX2H3o8MMrIXSuxysDErXa2jLjxhgE8sjj8dMsQOv7PQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmklL2bqrz3dHV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 19:29:18 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78DF9236D;
	Wed, 15 Oct 2025 01:28:39 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 754613F66E;
	Wed, 15 Oct 2025 01:28:42 -0700 (PDT)
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
Subject: [PATCH v3 12/13] mm: bail out of lazy_mmu_mode_* in interrupt context
Date: Wed, 15 Oct 2025 09:27:26 +0100
Message-ID: <20251015082727.2395128-13-kevin.brodsky@arm.com>
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
index 944e512767db..a37f417c30be 100644
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
index 269225a733de..718c9c788114 100644
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
 	VM_BUG_ON(state->count == U8_MAX);
 	/* enable() must not be called while paused */
 	VM_WARN_ON(state->count > 0 && !state->enabled);
@@ -280,6 +283,9 @@ static inline void lazy_mmu_mode_disable(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
+	if (in_interrupt())
+		return;
+
 	VM_BUG_ON(state->count == 0);
 	VM_WARN_ON(!state->enabled);
 
@@ -297,6 +303,9 @@ static inline void lazy_mmu_mode_pause(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
+	if (in_interrupt())
+		return;
+
 	VM_WARN_ON(state->count == 0 || !state->enabled);
 
 	state->enabled = false;
@@ -307,6 +316,9 @@ static inline void lazy_mmu_mode_resume(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
+	if (in_interrupt())
+		return;
+
 	VM_WARN_ON(state->count == 0 || state->enabled);
 
 	arch_enter_lazy_mmu_mode();
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 2862d8bf2160..beb3e6cfddd9 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1731,6 +1731,9 @@ static inline char task_state_to_char(struct task_struct *tsk)
 #ifdef CONFIG_ARCH_LAZY_MMU
 static inline bool in_lazy_mmu_mode(void)
 {
+	if (in_interrupt())
+		return false;
+
 	return current->lazy_mmu_state.enabled;
 }
 #else
-- 
2.47.0


