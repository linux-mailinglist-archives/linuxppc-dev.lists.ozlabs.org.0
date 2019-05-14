Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF1D1C98F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 15:46:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453JrB3zBHzDqKy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 23:46:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453Jmg6xWrzDqHL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 23:43:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 453Jmg5NdDz9s3q; Tue, 14 May 2019 23:43:31 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 453Jmg4xv6z9s4Y; Tue, 14 May 2019 23:43:31 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/mm: Fix crashes with hugepages & 4K pages
Date: Tue, 14 May 2019 23:43:21 +1000
Message-Id: <20190514134321.25575-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: aneesh.kumar@linux.vnet.ibm.com, sachinp@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The recent commit to cleanup ifdefs in the hugepage initialisation led
to crashes when using 4K pages as reported by Sachin:

  BUG: Kernel NULL pointer dereference at 0x0000001c
  Faulting instruction address: 0xc000000001d1e58c
  Oops: Kernel access of bad area, sig: 11 [#1]
  LE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
  ...
  CPU: 3 PID: 4635 Comm: futex_wake04 Tainted: G        W  O      5.1.0-next-20190507-autotest #1
  NIP:  c000000001d1e58c LR: c000000001d1e54c CTR: 0000000000000000
  REGS: c000000004937890 TRAP: 0300
  MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 22424822  XER: 00000000
  CFAR: c00000000183e9e0 DAR: 000000000000001c DSISR: 40000000 IRQMASK: 0
  ...
  NIP kmem_cache_alloc+0xbc/0x5a0
  LR  kmem_cache_alloc+0x7c/0x5a0
  Call Trace:
    huge_pte_alloc+0x580/0x950
    hugetlb_fault+0x9a0/0x1250
    handle_mm_fault+0x490/0x4a0
    __do_page_fault+0x77c/0x1f00
    do_page_fault+0x28/0x50
    handle_page_fault+0x18/0x38

This is caused by us trying to allocate from a NULL kmem cache in
__hugepte_alloc(). The kmem cache is NULL because it was never
allocated in hugetlbpage_init(), because add_huge_page_size() returned
an error.

The reason add_huge_page_size() returned an error is a simple typo, we
are calling check_and_get_huge_psize(size) when we should be passing
shift instead.

The fact that we're able to trigger this path when the kmem caches are
NULL is a separate bug, ie. we should not advertise any hugepage sizes
if we haven't setup the required caches for them.

This was only seen with 4K pages, with 64K pages we don't need to
allocate any extra kmem caches because the 16M hugepage just occupies
a single entry at the PMD level.

Fixes: 723f268f19da ("powerpc/mm: cleanup ifdef mess in add_huge_page_size()")
Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Tested-by: Sachin Sant <sachinp@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/hugetlbpage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index c5c9ff2d7afc..b5d92dc32844 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -556,7 +556,7 @@ static int __init add_huge_page_size(unsigned long long size)
 	if (size <= PAGE_SIZE || !is_power_of_2(size))
 		return -EINVAL;
 
-	mmu_psize = check_and_get_huge_psize(size);
+	mmu_psize = check_and_get_huge_psize(shift);
 	if (mmu_psize < 0)
 		return -EINVAL;
 
-- 
2.20.1

