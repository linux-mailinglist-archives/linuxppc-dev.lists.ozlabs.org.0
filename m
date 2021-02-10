Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A583169B0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 16:04:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbNM94jCjzDwj3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 02:04:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbKnX18zbzDqdW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 00:08:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=l09mmHxo; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DbKnW4BCjz9sXG; Thu, 11 Feb 2021 00:08:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612962495;
 bh=KkHY21xW+ZLDkVTQ72e1sZ78lW2nusmylSB/+Q1g9r4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=l09mmHxotgqAUfWAqr7G1B0TeJ5uyANvjuigP2oOp7JKmnV0ARG1kVC0xTb19ovwF
 7mD761XaCPvYHeFEQ6Yw5Jj+9wpXKvpKnt7oLPmLWfF+qE+IMnGR50kFnpilz9Jtro
 I/IFcc9tCqBivKwv4gjA7CqGX6WIoIU6noF8A6jZVJ9r2ysopgLV9lVbjgbvwPVAjd
 vSs/Hp3TKdJn/MgPZlx3wENJZA7nN+wXQquy92Ydqv3Z5MQUMwYtyjzA2yN5cI6dQR
 Go3oNzva7jOESkgqMHKFVk6aiDFnqWxD0LqOR4xJIgKcPeOLpuGXiQbkekT9bH+9O3
 kpaI9yqjkx/2Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/mm/64s: Fix no previous prototype warning
Date: Thu, 11 Feb 2021 00:08:03 +1100
Message-Id: <20210210130804.3190952-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210130804.3190952-1-mpe@ellerman.id.au>
References: <20210210130804.3190952-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As reported by lkp:

  arch/powerpc/mm/book3s64/radix_tlb.c:646:6: warning: no previous
  prototype for function 'exit_lazy_flush_tlb'

Fix it by moving the prototype into the existing header.

Fixes: 032b7f08932c ("powerpc/64s/radix: serialize_against_pte_lookup IPIs trim mm_cpumask")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/book3s64/internal.h  | 2 ++
 arch/powerpc/mm/book3s64/pgtable.c   | 4 ++--
 arch/powerpc/mm/book3s64/radix_tlb.c | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/internal.h b/arch/powerpc/mm/book3s64/internal.h
index c12d78ee42f5..5045048ce244 100644
--- a/arch/powerpc/mm/book3s64/internal.h
+++ b/arch/powerpc/mm/book3s64/internal.h
@@ -15,4 +15,6 @@ static inline bool stress_slb(void)
 
 void slb_setup_new_exec(void);
 
+void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush);
+
 #endif /* ARCH_POWERPC_MM_BOOK3S64_INTERNAL_H */
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 78c492e86752..9ffa65074cb0 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -20,6 +20,8 @@
 #include <mm/mmu_decl.h>
 #include <trace/events/thp.h>
 
+#include "internal.h"
+
 unsigned long __pmd_frag_nr;
 EXPORT_SYMBOL(__pmd_frag_nr);
 unsigned long __pmd_frag_size_shift;
@@ -79,8 +81,6 @@ void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 	return set_pte_at(mm, addr, pmdp_ptep(pmdp), pmd_pte(pmd));
 }
 
-void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush);
-
 static void do_serialize(void *arg)
 {
 	/* We've taken the IPI, so try to trim the mask while here */
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index d7f1a6bd08ef..409e61210789 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -18,6 +18,8 @@
 #include <asm/cputhreads.h>
 #include <asm/plpar_wrappers.h>
 
+#include "internal.h"
+
 #define RIC_FLUSH_TLB 0
 #define RIC_FLUSH_PWC 1
 #define RIC_FLUSH_ALL 2
-- 
2.25.1

