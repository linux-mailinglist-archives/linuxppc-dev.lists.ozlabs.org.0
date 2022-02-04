Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BA74A92DA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 04:54:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqhW22tdHz3cPP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 14:54:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=py5DyMPX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=py5DyMPX; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqhVL01lgz2x9S
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 14:54:00 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id i17so3975837pfq.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Feb 2022 19:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z/bBuduF3oCGr/9TPSvcyZJxxIyPDXJVhz5vzHqeask=;
 b=py5DyMPX3huE7Q0DbHS2yqq6dJsp076EVYTvITNFUnu9S+gBn0CjooBf/0M98DwzvB
 UyyCbs4qLAw1EL6N4p054eReDzG99j2F/BlaJgZssXtkjYJqD0I6OeX2qnWA/F4zeGgp
 fxdan2O8bSBKd2jU+nhB2fM1s2MkyTebro9nglmKjQ0TLgE8nAChphi7kEnmM1ph5FUN
 8N2udv96ZKTXyZ31bBw6pBtEMGvZBqcnWXxxIA693Yj8/5jX3M49N5FhprafG+UiNsGG
 te/79vB+9EZAGvs9xqvKYZEYujZxQfadoN0j1Nq1P0M+YjOZ6yKAYQETHqEObKqYvhVi
 Shbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z/bBuduF3oCGr/9TPSvcyZJxxIyPDXJVhz5vzHqeask=;
 b=MO+6MW2GYZ/RTGU25jv4lZIPGUBxj/sWQNFclC/BJjCBBd6fI9s2odcERYAd9gHzpT
 Fmyeli4CeeSKDFbaUoplAU8C89ovbMov796bB24jILUPCBm97CsfjIVZT1tHTmX3siOd
 PtY+uN/NZvd9sA/VvjuXRGN5rv7vK8yl7mcJBqKU2myqE6BUg3v1z7ajE1IwY07aQ1RC
 Mw6FUJ4PwKwPqYjUokUaWihaErcnFJ5yYDCMQenus5trgTM7hs4Dpxd2txG2iEGD1NOK
 mDoJTXpPxbEFrZ+RE9DS47s14Lf9fgyyCKWHrNZnbgZdcDDbD1iV1Ok4zetnDBzyaExX
 IzPw==
X-Gm-Message-State: AOAM531GjxdUC0p40tCpt1jOo0eL4VTuLiIBLpAaH4K4pFLXPUtDFmsm
 oBfXyZ6FGnottoD7gyaVSx6ELQtijvs9xw==
X-Google-Smtp-Source: ABdhPJwB2hR8fExnmyOTKDlcJQ9Njn3bNum09SfPG2DKuTr2Z68Vd/O/5b1yfi1wrAlCcCcNIcOiag==
X-Received: by 2002:a63:d145:: with SMTP id c5mr937744pgj.217.1643946835609;
 Thu, 03 Feb 2022 19:53:55 -0800 (PST)
Received: from bobo.ibm.com ([124.170.17.156])
 by smtp.gmail.com with ESMTPSA id pi1sm13021395pjb.10.2022.02.03.19.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 19:53:55 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s/hash: Make hash faults work in NMI context
Date: Fri,  4 Feb 2022 13:53:48 +1000
Message-Id: <20220204035348.545435-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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

Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Reported-by: Laurent Dufour <ldufour@linux.ibm.com>
Tested-by: Laurent Dufour <ldufour@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h  |  2 +-
 arch/powerpc/mm/book3s64/hash_utils.c | 54 ++++-----------------------
 arch/powerpc/perf/callchain.h         |  9 +----
 arch/powerpc/perf/callchain_64.c      | 27 --------------
 4 files changed, 10 insertions(+), 82 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index fc28f46d2f9d..5404f7abbcf8 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -612,7 +612,7 @@ DECLARE_INTERRUPT_HANDLER_RAW(do_slb_fault);
 DECLARE_INTERRUPT_HANDLER(do_bad_segment_interrupt);
 
 /* hash_utils.c */
-DECLARE_INTERRUPT_HANDLER_RAW(do_hash_fault);
+DECLARE_INTERRUPT_HANDLER(do_hash_fault);
 
 /* fault.c */
 DECLARE_INTERRUPT_HANDLER(do_page_fault);
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 7abf82a698d3..985cabdd7f67 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1621,8 +1621,7 @@ int hash_page(unsigned long ea, unsigned long access, unsigned long trap,
 }
 EXPORT_SYMBOL_GPL(hash_page);
 
-DECLARE_INTERRUPT_HANDLER(__do_hash_fault);
-DEFINE_INTERRUPT_HANDLER(__do_hash_fault)
+DEFINE_INTERRUPT_HANDLER(do_hash_fault)
 {
 	unsigned long ea = regs->dar;
 	unsigned long dsisr = regs->dsisr;
@@ -1681,35 +1680,6 @@ DEFINE_INTERRUPT_HANDLER(__do_hash_fault)
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
@@ -1776,26 +1746,18 @@ static void hash_preload(struct mm_struct *mm, pte_t *ptep, unsigned long ea,
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
@@ -1820,7 +1782,7 @@ static void hash_preload(struct mm_struct *mm, pte_t *ptep, unsigned long ea,
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
2.23.0

