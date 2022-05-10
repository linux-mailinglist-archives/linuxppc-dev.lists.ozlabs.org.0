Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA38520C62
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 05:48:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky3sY6QGtz3ds2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 13:48:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.43;
 helo=out30-43.freemail.mail.aliyun.com;
 envelope-from=baolin.wang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky3r166KFz3cDH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 13:46:41 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=32; SR=0;
 TI=SMTPD_---0VCooyL6_1652154389; 
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0VCooyL6_1652154389) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 10 May 2022 11:46:30 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org, mike.kravetz@oracle.com,
 catalin.marinas@arm.com, will@kernel.org
Subject: [PATCH v3 3/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue when
 unmapping
Date: Tue, 10 May 2022 11:46:00 +0800
Message-Id: <730ea4b6d292f32fb10b7a4e87dad49b0eb30474.1652147571.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1652147571.git.baolin.wang@linux.alibaba.com>
References: <cover.1652147571.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <cover.1652147571.git.baolin.wang@linux.alibaba.com>
References: <cover.1652147571.git.baolin.wang@linux.alibaba.com>
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 linux-mm@kvack.org, paulus@samba.org, sparclinux@vger.kernel.org,
 agordeev@linux.ibm.com, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 arnd@arndb.de, ysato@users.sourceforge.jp, deller@gmx.de,
 borntraeger@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com,
 baolin.wang@linux.alibaba.com, songmuchun@bytedance.com,
 linux-arm-kernel@lists.infradead.org, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 svens@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On some architectures (like ARM64), it can support CONT-PTE/PMD size
hugetlb, which means it can support not only PMD/PUD size hugetlb:
2M and 1G, but also CONT-PTE/PMD size: 64K and 32M if a 4K page
size specified.

When unmapping a hugetlb page, we will get the relevant page table
entry by huge_pte_offset() only once to nuke it. This is correct
for PMD or PUD size hugetlb, since they always contain only one
pmd entry or pud entry in the page table.

However this is incorrect for CONT-PTE and CONT-PMD size hugetlb,
since they can contain several continuous pte or pmd entry with
same page table attributes, so we will nuke only one pte or pmd
entry for this CONT-PTE/PMD size hugetlb page.

And now try_to_unmap() is only passed a hugetlb page in the case
where the hugetlb page is poisoned. Which means now we will unmap
only one pte entry for a CONT-PTE or CONT-PMD size poisoned hugetlb
page, and we can still access other subpages of a CONT-PTE or CONT-PMD
size poisoned hugetlb page, which will cause serious issues possibly.

So we should change to use huge_ptep_clear_flush() to nuke the
hugetlb page table to fix this issue, which already considered
CONT-PTE and CONT-PMD size hugetlb.

We've already used set_huge_swap_pte_at() to set a poisoned
swap entry for a poisoned hugetlb page. Meanwhile adding a VM_BUG_ON()
to make sure the passed hugetlb page is poisoned in try_to_unmap().

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
---
 mm/rmap.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 4e96daf..219e287 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1528,6 +1528,11 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 
 		if (folio_test_hugetlb(folio)) {
 			/*
+			 * The try_to_unmap() is only passed a hugetlb page
+			 * in the case where the hugetlb page is poisoned.
+			 */
+			VM_BUG_ON_PAGE(!PageHWPoison(subpage), subpage);
+			/*
 			 * huge_pmd_unshare may unmap an entire PMD page.
 			 * There is no way of knowing exactly which PMDs may
 			 * be cached for this mm, so we must flush them all.
@@ -1562,28 +1567,28 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 					break;
 				}
 			}
+			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
 		} else {
 			flush_cache_page(vma, address, pte_pfn(*pvmw.pte));
-		}
-
-		/*
-		 * Nuke the page table entry. When having to clear
-		 * PageAnonExclusive(), we always have to flush.
-		 */
-		if (should_defer_flush(mm, flags) && !anon_exclusive) {
 			/*
-			 * We clear the PTE but do not flush so potentially
-			 * a remote CPU could still be writing to the folio.
-			 * If the entry was previously clean then the
-			 * architecture must guarantee that a clear->dirty
-			 * transition on a cached TLB entry is written through
-			 * and traps if the PTE is unmapped.
+			 * Nuke the page table entry. When having to clear
+			 * PageAnonExclusive(), we always have to flush.
 			 */
-			pteval = ptep_get_and_clear(mm, address, pvmw.pte);
+			if (should_defer_flush(mm, flags) && !anon_exclusive) {
+				/*
+				 * We clear the PTE but do not flush so potentially
+				 * a remote CPU could still be writing to the folio.
+				 * If the entry was previously clean then the
+				 * architecture must guarantee that a clear->dirty
+				 * transition on a cached TLB entry is written through
+				 * and traps if the PTE is unmapped.
+				 */
+				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
 
-			set_tlb_ubc_flush_pending(mm, pte_dirty(pteval));
-		} else {
-			pteval = ptep_clear_flush(vma, address, pvmw.pte);
+				set_tlb_ubc_flush_pending(mm, pte_dirty(pteval));
+			} else {
+				pteval = ptep_clear_flush(vma, address, pvmw.pte);
+			}
 		}
 
 		/*
-- 
1.8.3.1

