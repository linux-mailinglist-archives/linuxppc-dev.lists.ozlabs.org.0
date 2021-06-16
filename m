Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C03B3A8F56
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 05:22:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4Vq817xHz3c2p
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 13:22:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hNxV4V7z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hNxV4V7z; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4VpD1swDz2ym5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 13:21:23 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76404613DC;
 Wed, 16 Jun 2021 03:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623813679;
 bh=FjSVK+oLKWCgQcLVc/yxw6eKOykcdskBrRZdDTQATJQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hNxV4V7z+Nf+3L/lZMKFuV3SJ66ggCJ+cspPEUtfvkee+klF0IxtUDpq9DSwO40te
 Y/+8Op9Fj4sCWiK65uZ5EZUH8vS1Ha4lEzTXSwI28v2CGFytvqvS37LLikVoN0cVG8
 6jMich5fC5pKUGbDFMObsHD8RbVXsawbyksBNUDe2evE4KHmZh18FEckNI+KTuQEUp
 PWpa6XDbLpI7L05XpEjB5MM7gd//a/KYKlt2yWknMaftgoVrL2FGbzOCMguQqyJVD5
 vN6uvOJUdkIa7BI3bE944plKIQ3YtdbreMjZpSiKDnYa1JLRGqwKU4HVbz8WVVuMfY
 WVLB2KuFIkidw==
From: Andy Lutomirski <luto@kernel.org>
To: x86@kernel.org
Subject: [PATCH 6/8] powerpc/membarrier: Remove special barrier on mm switch
Date: Tue, 15 Jun 2021 20:21:11 -0700
Message-Id: <d9034f951329830b766feb08099c15b714e08e8f.1623813516.git.luto@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623813516.git.luto@kernel.org>
References: <cover.1623813516.git.luto@kernel.org>
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
Cc: linux-mm@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Dave Hansen <dave.hansen@intel.com>, Paul Mackerras <paulus@samba.org>,
 Andy Lutomirski <luto@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc did the following on some, but not all, paths through
switch_mm_irqs_off():

       /*
        * Only need the full barrier when switching between processes.
        * Barrier when switching from kernel to userspace is not
        * required here, given that it is implied by mmdrop(). Barrier
        * when switching from userspace to kernel is not needed after
        * store to rq->curr.
        */
       if (likely(!(atomic_read(&next->membarrier_state) &
                    (MEMBARRIER_STATE_PRIVATE_EXPEDITED |
                     MEMBARRIER_STATE_GLOBAL_EXPEDITED)) || !prev))
               return;

This is puzzling: if !prev, then one might expect that we are switching
from kernel to user, not user to kernel, which is inconsistent with the
comment.  But this is all nonsense, because the one and only caller would
never have prev == NULL and would, in fact, OOPS if prev == NULL.

In any event, this code is unnecessary, since the new generic
membarrier_finish_switch_mm() provides the same barrier without arch help.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Andy Lutomirski <luto@kernel.org>
---
 arch/powerpc/include/asm/membarrier.h | 27 ---------------------------
 arch/powerpc/mm/mmu_context.c         |  2 --
 2 files changed, 29 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/membarrier.h

diff --git a/arch/powerpc/include/asm/membarrier.h b/arch/powerpc/include/asm/membarrier.h
deleted file mode 100644
index 6e20bb5c74ea..000000000000
--- a/arch/powerpc/include/asm/membarrier.h
+++ /dev/null
@@ -1,27 +0,0 @@
-#ifndef _ASM_POWERPC_MEMBARRIER_H
-#define _ASM_POWERPC_MEMBARRIER_H
-
-static inline void membarrier_arch_switch_mm(struct mm_struct *prev,
-					     struct mm_struct *next,
-					     struct task_struct *tsk)
-{
-	/*
-	 * Only need the full barrier when switching between processes.
-	 * Barrier when switching from kernel to userspace is not
-	 * required here, given that it is implied by mmdrop(). Barrier
-	 * when switching from userspace to kernel is not needed after
-	 * store to rq->curr.
-	 */
-	if (likely(!(atomic_read(&next->membarrier_state) &
-		     (MEMBARRIER_STATE_PRIVATE_EXPEDITED |
-		      MEMBARRIER_STATE_GLOBAL_EXPEDITED)) || !prev))
-		return;
-
-	/*
-	 * The membarrier system call requires a full memory barrier
-	 * after storing to rq->curr, before going back to user-space.
-	 */
-	smp_mb();
-}
-
-#endif /* _ASM_POWERPC_MEMBARRIER_H */
diff --git a/arch/powerpc/mm/mmu_context.c b/arch/powerpc/mm/mmu_context.c
index a857af401738..8daa95b3162b 100644
--- a/arch/powerpc/mm/mmu_context.c
+++ b/arch/powerpc/mm/mmu_context.c
@@ -85,8 +85,6 @@ void switch_mm_irqs_off(struct mm_struct *prev, struct mm_struct *next,
 
 	if (new_on_cpu)
 		radix_kvm_prefetch_workaround(next);
-	else
-		membarrier_arch_switch_mm(prev, next, tsk);
 
 	/*
 	 * The actual HW switching method differs between the various
-- 
2.31.1

