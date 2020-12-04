Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5892CE78C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 06:29:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnLqZ1XlVzDrQJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 16:29:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnLm20K0FzDrBd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 16:26:25 +1100 (AEDT)
From: Andy Lutomirski <luto@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Nicholas Piggin <npiggin@gmail.com>
Subject: [RFC v2 1/2] [NEEDS HELP] x86/mm: Handle unlazying membarrier core
 sync in the arch code
Date: Thu,  3 Dec 2020 21:26:16 -0800
Message-Id: <203d39d11562575fd8bd6a094d97a3a332d8b265.1607059162.git.luto@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1607059162.git.luto@kernel.org>
References: <cover.1607059162.git.luto@kernel.org>
MIME-Version: 1.0
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Nadav Amit <nadav.amit@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Rik van Riel <riel@surriel.com>,
 Will Deacon <will@kernel.org>, X86 ML <x86@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Jann Horn <jannh@google.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The core scheduler isn't a great place for
membarrier_mm_sync_core_before_usermode() -- the core scheduler doesn't
actually know whether we are lazy.  With the old code, if a CPU is
running a membarrier-registered task, goes idle, gets unlazied via a TLB
shootdown IPI, and switches back to the membarrier-registered task, it
will do an unnecessary core sync.

Conveniently, x86 is the only architecture that does anything in this
hook, so we can just move the code.

XXX: there are some comments in swich_mm_irqs_off() that seem to be
trying to document what barriers are expected, and it's not clear to me
that these barriers are actually present in all paths through the
code.  So I think this change makes the code more comprehensible and
has no effect on the code's correctness, but I'm not at all convinced
that the code is correct.

Signed-off-by: Andy Lutomirski <luto@kernel.org>
---
 arch/x86/mm/tlb.c   | 17 ++++++++++++++++-
 kernel/sched/core.c | 14 +++++++-------
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 3338a1feccf9..23df035b80e8 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -8,6 +8,7 @@
 #include <linux/export.h>
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
+#include <linux/sched/mm.h>
 
 #include <asm/tlbflush.h>
 #include <asm/mmu_context.h>
@@ -496,6 +497,8 @@ void switch_mm_irqs_off(struct mm_struct *prev, struct mm_struct *next,
 		 * from one thread in a process to another thread in the same
 		 * process. No TLB flush required.
 		 */
+
+		// XXX: why is this okay wrt membarrier?
 		if (!was_lazy)
 			return;
 
@@ -508,12 +511,24 @@ void switch_mm_irqs_off(struct mm_struct *prev, struct mm_struct *next,
 		smp_mb();
 		next_tlb_gen = atomic64_read(&next->context.tlb_gen);
 		if (this_cpu_read(cpu_tlbstate.ctxs[prev_asid].tlb_gen) ==
-				next_tlb_gen)
+		    next_tlb_gen) {
+			/*
+			 * We're reactivating an mm, and membarrier might
+			 * need to serialize.  Tell membarrier.
+			 */
+
+			// XXX: I can't understand the logic in
+			// membarrier_mm_sync_core_before_usermode().  What's
+			// the mm check for?
+			membarrier_mm_sync_core_before_usermode(next);
 			return;
+		}
 
 		/*
 		 * TLB contents went out of date while we were in lazy
 		 * mode. Fall through to the TLB switching code below.
+		 * No need for an explicit membarrier invocation -- the CR3
+		 * write will serialize.
 		 */
 		new_asid = prev_asid;
 		need_flush = true;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 2d95dc3f4644..6c4b76147166 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3619,22 +3619,22 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 	kcov_finish_switch(current);
 
 	fire_sched_in_preempt_notifiers(current);
+
 	/*
 	 * When switching through a kernel thread, the loop in
 	 * membarrier_{private,global}_expedited() may have observed that
 	 * kernel thread and not issued an IPI. It is therefore possible to
 	 * schedule between user->kernel->user threads without passing though
 	 * switch_mm(). Membarrier requires a barrier after storing to
-	 * rq->curr, before returning to userspace, so provide them here:
+	 * rq->curr, before returning to userspace, and mmdrop() provides
+	 * this barrier.
 	 *
-	 * - a full memory barrier for {PRIVATE,GLOBAL}_EXPEDITED, implicitly
-	 *   provided by mmdrop(),
-	 * - a sync_core for SYNC_CORE.
+	 * XXX: I don't think mmdrop() actually does this.  There's no
+	 * smp_mb__before/after_atomic() in there.
 	 */
-	if (mm) {
-		membarrier_mm_sync_core_before_usermode(mm);
+	if (mm)
 		mmdrop(mm);
-	}
+
 	if (unlikely(prev_state == TASK_DEAD)) {
 		if (prev->sched_class->task_dead)
 			prev->sched_class->task_dead(prev);
-- 
2.28.0

