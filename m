Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CBF4EF1D2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 16:41:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVNCJ3jmbz3cLF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 01:41:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kQSPya41;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=sashal@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kQSPya41; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVNBg2zxcz2yxP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Apr 2022 01:40:43 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A9638B82510;
 Fri,  1 Apr 2022 14:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E826C2BBE4;
 Fri,  1 Apr 2022 14:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648824039;
 bh=SqzUilIyHi25p6mN/pyxnBR6WYf4nCZ/vc54FO7Eje0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kQSPya41xCqkCM/e8ijs+SkzcRksn9yRotSA9xNDmPyIkrx/njMq9L+SrkUxNNP//
 ES14S3dXSD9c1lZtlfwLwTFRkLX3OphC8sZr357vkqddeJvwPBngG6jc72yPdVyNAQ
 MOif1gUsONB/tFnkOaTj7cYwhLMW90YKWmqLlxPm751b9wmnAaIsRYaErOLB2vFxIu
 Da2iynmneYiPBQAN5wsnKYv97+7iJGB76ULLwUltnxpTDPpkXE8Gbq3GqUgbUK8z5r
 m8PoPkaiRxf6fLlD1ufZtdSNu6FZ72zZMpTD6r+Ls7a9T7BknExqm92A6Dhf+3m0GK
 5TenTG2+IGA6g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 60/98] powerpc/64s/hash: Make hash faults work in
 NMI context
Date: Fri,  1 Apr 2022 10:37:04 -0400
Message-Id: <20220401143742.1952163-60-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401143742.1952163-1-sashal@kernel.org>
References: <20220401143742.1952163-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, sxwjean@gmail.com,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, nick.child@ibm.com,
 Nicholas Piggin <npiggin@gmail.com>, vaibhav@linux.ibm.com,
 Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

[ Upstream commit 8b91cee5eadd2021f55e6775f2d50bd56d00c217 ]

Hash faults are not resoved in NMI context, instead causing the access
to fail. This is done because perf interrupts can get backtraces
including walking the user stack, and taking a hash fault on those could
deadlock on the HPTE lock if the perf interrupt hits while the same HPTE
lock is being held by the hash fault code. The user-access for the stack
walking will notice the access failed and deal with that in the perf
code.

The reason to allow perf interrupts in is to better profile hash faults.

The problem with this is any hash fault on a kernel access that happens
in NMI context will crash, because kernel accesses must not fail.

Hard lockups, system reset, machine checks that access vmalloc space
including modules and including stack backtracing and symbol lookup in
modules, per-cpu data, etc could all run into this problem.

Fix this by disallowing perf interrupts in the hash fault code (the
direct hash fault is covered by MSR[EE]=0 so the PMI disable just needs
to extend to the preload case). This simplifies the tricky logic in hash
faults and perf, at the cost of reduced profiling of hash faults.

perf can still latch addresses when interrupts are disabled, it just
won't get the stack trace at that point, so it would still find hot
spots, just sometimes with confusing stack chains.

An alternative could be to allow perf interrupts here but always do the
slowpath stack walk if we are in nmi context, but that slows down all
perf interrupt stack walking on hash though and it does not remove as
much tricky code.

Reported-by: Laurent Dufour <ldufour@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Tested-by: Laurent Dufour <ldufour@linux.ibm.com>
Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220204035348.545435-1-npiggin@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/interrupt.h  |  2 +-
 arch/powerpc/mm/book3s64/hash_utils.c | 54 ++++-----------------------
 arch/powerpc/perf/callchain.h         |  9 +----
 arch/powerpc/perf/callchain_64.c      | 27 --------------
 4 files changed, 10 insertions(+), 82 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index a1d238255f07..a07960066b5f 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -567,7 +567,7 @@ DECLARE_INTERRUPT_HANDLER_RAW(do_slb_fault);
 DECLARE_INTERRUPT_HANDLER(do_bad_slb_fault);
 
 /* hash_utils.c */
-DECLARE_INTERRUPT_HANDLER_RAW(do_hash_fault);
+DECLARE_INTERRUPT_HANDLER(do_hash_fault);
 
 /* fault.c */
 DECLARE_INTERRUPT_HANDLER(do_page_fault);
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index c145776d3ae5..7bfd88c4b547 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1522,8 +1522,7 @@ int hash_page(unsigned long ea, unsigned long access, unsigned long trap,
 }
 EXPORT_SYMBOL_GPL(hash_page);
 
-DECLARE_INTERRUPT_HANDLER(__do_hash_fault);
-DEFINE_INTERRUPT_HANDLER(__do_hash_fault)
+DEFINE_INTERRUPT_HANDLER(do_hash_fault)
 {
 	unsigned long ea = regs->dar;
 	unsigned long dsisr = regs->dsisr;
@@ -1582,35 +1581,6 @@ DEFINE_INTERRUPT_HANDLER(__do_hash_fault)
 	}
 }
 
-/*
- * The _RAW interrupt entry checks for the in_nmi() case before
- * running the full handler.
- */
-DEFINE_INTERRUPT_HANDLER_RAW(do_hash_fault)
-{
-	/*
-	 * If we are in an "NMI" (e.g., an interrupt when soft-disabled), then
-	 * don't call hash_page, just fail the fault. This is required to
-	 * prevent re-entrancy problems in the hash code, namely perf
-	 * interrupts hitting while something holds H_PAGE_BUSY, and taking a
-	 * hash fault. See the comment in hash_preload().
-	 *
-	 * We come here as a result of a DSI at a point where we don't want
-	 * to call hash_page, such as when we are accessing memory (possibly
-	 * user memory) inside a PMU interrupt that occurred while interrupts
-	 * were soft-disabled.  We want to invoke the exception handler for
-	 * the access, or panic if there isn't a handler.
-	 */
-	if (unlikely(in_nmi())) {
-		do_bad_page_fault_segv(regs);
-		return 0;
-	}
-
-	__do_hash_fault(regs);
-
-	return 0;
-}
-
 #ifdef CONFIG_PPC_MM_SLICES
 static bool should_hash_preload(struct mm_struct *mm, unsigned long ea)
 {
@@ -1677,26 +1647,18 @@ static void hash_preload(struct mm_struct *mm, pte_t *ptep, unsigned long ea,
 #endif /* CONFIG_PPC_64K_PAGES */
 
 	/*
-	 * __hash_page_* must run with interrupts off, as it sets the
-	 * H_PAGE_BUSY bit. It's possible for perf interrupts to hit at any
-	 * time and may take a hash fault reading the user stack, see
-	 * read_user_stack_slow() in the powerpc/perf code.
-	 *
-	 * If that takes a hash fault on the same page as we lock here, it
-	 * will bail out when seeing H_PAGE_BUSY set, and retry the access
-	 * leading to an infinite loop.
+	 * __hash_page_* must run with interrupts off, including PMI interrupts
+	 * off, as it sets the H_PAGE_BUSY bit.
 	 *
-	 * Disabling interrupts here does not prevent perf interrupts, but it
-	 * will prevent them taking hash faults (see the NMI test in
-	 * do_hash_page), then read_user_stack's copy_from_user_nofault will
-	 * fail and perf will fall back to read_user_stack_slow(), which
-	 * walks the Linux page tables.
+	 * It's otherwise possible for perf interrupts to hit at any time and
+	 * may take a hash fault reading the user stack, which could take a
+	 * hash miss and deadlock on the same H_PAGE_BUSY bit.
 	 *
 	 * Interrupts must also be off for the duration of the
 	 * mm_is_thread_local test and update, to prevent preempt running the
 	 * mm on another CPU (XXX: this may be racy vs kthread_use_mm).
 	 */
-	local_irq_save(flags);
+	powerpc_local_irq_pmu_save(flags);
 
 	/* Is that local to this CPU ? */
 	if (mm_is_thread_local(mm))
@@ -1721,7 +1683,7 @@ static void hash_preload(struct mm_struct *mm, pte_t *ptep, unsigned long ea,
 				   mm_ctx_user_psize(&mm->context),
 				   pte_val(*ptep));
 
-	local_irq_restore(flags);
+	powerpc_local_irq_pmu_restore(flags);
 }
 
 /*
diff --git a/arch/powerpc/perf/callchain.h b/arch/powerpc/perf/callchain.h
index d6fa6e25234f..19a8d051ddf1 100644
--- a/arch/powerpc/perf/callchain.h
+++ b/arch/powerpc/perf/callchain.h
@@ -2,7 +2,6 @@
 #ifndef _POWERPC_PERF_CALLCHAIN_H
 #define _POWERPC_PERF_CALLCHAIN_H
 
-int read_user_stack_slow(const void __user *ptr, void *buf, int nb);
 void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
 			    struct pt_regs *regs);
 void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
@@ -26,17 +25,11 @@ static inline int __read_user_stack(const void __user *ptr, void *ret,
 				    size_t size)
 {
 	unsigned long addr = (unsigned long)ptr;
-	int rc;
 
 	if (addr > TASK_SIZE - size || (addr & (size - 1)))
 		return -EFAULT;
 
-	rc = copy_from_user_nofault(ret, ptr, size);
-
-	if (IS_ENABLED(CONFIG_PPC64) && !radix_enabled() && rc)
-		return read_user_stack_slow(ptr, ret, size);
-
-	return rc;
+	return copy_from_user_nofault(ret, ptr, size);
 }
 
 #endif /* _POWERPC_PERF_CALLCHAIN_H */
diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
index 8d0df4226328..488e8a21a11e 100644
--- a/arch/powerpc/perf/callchain_64.c
+++ b/arch/powerpc/perf/callchain_64.c
@@ -18,33 +18,6 @@
 
 #include "callchain.h"
 
-/*
- * On 64-bit we don't want to invoke hash_page on user addresses from
- * interrupt context, so if the access faults, we read the page tables
- * to find which page (if any) is mapped and access it directly. Radix
- * has no need for this so it doesn't use read_user_stack_slow.
- */
-int read_user_stack_slow(const void __user *ptr, void *buf, int nb)
-{
-
-	unsigned long addr = (unsigned long) ptr;
-	unsigned long offset;
-	struct page *page;
-	void *kaddr;
-
-	if (get_user_page_fast_only(addr, FOLL_WRITE, &page)) {
-		kaddr = page_address(page);
-
-		/* align address to page boundary */
-		offset = addr & ~PAGE_MASK;
-
-		memcpy(buf, kaddr + offset, nb);
-		put_page(page);
-		return 0;
-	}
-	return -EFAULT;
-}
-
 static int read_user_stack_64(const unsigned long __user *ptr, unsigned long *ret)
 {
 	return __read_user_stack(ptr, ret, sizeof(*ret));
-- 
2.34.1

