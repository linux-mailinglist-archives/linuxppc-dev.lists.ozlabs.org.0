Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC755520C59
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 05:47:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky3s75pbnz3cLX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 13:47:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.56;
 helo=out30-56.freemail.mail.aliyun.com;
 envelope-from=baolin.wang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky3qy30Hdz3bnn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 13:46:37 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=32; SR=0;
 TI=SMTPD_---0VCobrrD_1652154387; 
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0VCobrrD_1652154387) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 10 May 2022 11:46:28 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org, mike.kravetz@oracle.com,
 catalin.marinas@arm.com, will@kernel.org
Subject: [PATCH v3 2/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue when
 migration
Date: Tue, 10 May 2022 11:45:59 +0800
Message-Id: <ea5abf529f0997b5430961012bfda6166c1efc8c.1652147571.git.baolin.wang@linux.alibaba.com>
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

When migrating a hugetlb page, we will get the relevant page table
entry by huge_pte_offset() only once to nuke it and remap it with
a migration pte entry. This is correct for PMD or PUD size hugetlb,
since they always contain only one pmd entry or pud entry in the
page table.

However this is incorrect for CONT-PTE and CONT-PMD size hugetlb,
since they can contain several continuous pte or pmd entry with
same page table attributes. So we will nuke or remap only one pte
or pmd entry for this CONT-PTE/PMD size hugetlb page, which is
not expected for hugetlb migration. The problem is we can still
continue to modify the subpages' data of a hugetlb page during
migrating a hugetlb page, which can cause a serious data consistent
issue, since we did not nuke the page table entry and set a
migration pte for the subpages of a hugetlb page.

To fix this issue, we should change to use huge_ptep_clear_flush()
to nuke a hugetlb page table, and remap it with set_huge_pte_at()
and set_huge_swap_pte_at() when migrating a hugetlb page, which
already considered the CONT-PTE or CONT-PMD size hugetlb.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
---
 include/linux/hugetlb.h | 11 +++++++++++
 mm/rmap.c               | 24 ++++++++++++++++++------
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 306d6ef..9f71043 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -1093,6 +1093,17 @@ static inline void set_huge_swap_pte_at(struct mm_struct *mm, unsigned long addr
 					pte_t *ptep, pte_t pte, unsigned long sz)
 {
 }
+
+static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
+					  unsigned long addr, pte_t *ptep)
+{
+	return ptep_get(ptep);
+}
+
+static inline void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+				   pte_t *ptep, pte_t pte)
+{
+}
 #endif	/* CONFIG_HUGETLB_PAGE */
 
 static inline spinlock_t *huge_pte_lock(struct hstate *h,
diff --git a/mm/rmap.c b/mm/rmap.c
index 94d6b24..4e96daf 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1926,13 +1926,15 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 					break;
 				}
 			}
+
+			/* Nuke the hugetlb page table entry */
+			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
 		} else {
 			flush_cache_page(vma, address, pte_pfn(*pvmw.pte));
+			/* Nuke the page table entry. */
+			pteval = ptep_clear_flush(vma, address, pvmw.pte);
 		}
 
-		/* Nuke the page table entry. */
-		pteval = ptep_clear_flush(vma, address, pvmw.pte);
-
 		/* Set the dirty flag on the folio now the pte is gone. */
 		if (pte_dirty(pteval))
 			folio_mark_dirty(folio);
@@ -2017,7 +2019,10 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			pte_t swp_pte;
 
 			if (arch_unmap_one(mm, vma, address, pteval) < 0) {
-				set_pte_at(mm, address, pvmw.pte, pteval);
+				if (folio_test_hugetlb(folio))
+					set_huge_pte_at(mm, address, pvmw.pte, pteval);
+				else
+					set_pte_at(mm, address, pvmw.pte, pteval);
 				ret = false;
 				page_vma_mapped_walk_done(&pvmw);
 				break;
@@ -2026,7 +2031,10 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				       !anon_exclusive, subpage);
 			if (anon_exclusive &&
 			    page_try_share_anon_rmap(subpage)) {
-				set_pte_at(mm, address, pvmw.pte, pteval);
+				if (folio_test_hugetlb(folio))
+					set_huge_pte_at(mm, address, pvmw.pte, pteval);
+				else
+					set_pte_at(mm, address, pvmw.pte, pteval);
 				ret = false;
 				page_vma_mapped_walk_done(&pvmw);
 				break;
@@ -2052,7 +2060,11 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				swp_pte = pte_swp_mksoft_dirty(swp_pte);
 			if (pte_uffd_wp(pteval))
 				swp_pte = pte_swp_mkuffd_wp(swp_pte);
-			set_pte_at(mm, address, pvmw.pte, swp_pte);
+			if (folio_test_hugetlb(folio))
+				set_huge_swap_pte_at(mm, address, pvmw.pte,
+						     swp_pte, vma_mmu_pagesize(vma));
+			else
+				set_pte_at(mm, address, pvmw.pte, swp_pte);
 			trace_set_migration_pte(address, pte_val(swp_pte),
 						compound_order(&folio->page));
 			/*
-- 
1.8.3.1

