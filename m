Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2558C8CB7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 21:20:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vgxct0xytz3fmj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2024 05:20:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgxcR01zGz3cT8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2024 05:20:05 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Vgx9J2NV2z9stW;
	Fri, 17 May 2024 21:00:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vUPpztsius7d; Fri, 17 May 2024 21:00:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Vgx9H5wLcz9st0;
	Fri, 17 May 2024 21:00:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C4FF58B783;
	Fri, 17 May 2024 21:00:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Whiu-wIcSVA7; Fri, 17 May 2024 21:00:03 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.121])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A1368B775;
	Fri, 17 May 2024 21:00:03 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [RFC PATCH v2 01/20] mm: Provide pagesize to pmd_populate()
Date: Fri, 17 May 2024 20:59:55 +0200
Message-ID: <91159d49bcbee0526ca6235ff7ef1ee7d378d013.1715971869.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1715971869.git.christophe.leroy@csgroup.eu>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715972396; l=7768; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=QRdZ/0bPeT1pPwG5WSLdvwtqFro0oKtYinwQoUsitzg=; b=V+uT7e63aUwkHom1JhxufaACKodi9eHRwkhvAOY4pPe2+bhg0QVn2P/ZJ6/WxVQxS5LOErXv0 HWo2wsZ0Lg0CxOLBcSGrD43ouEQty35JIEIddrDN5L0k7VW4ka/QFJ8
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Unlike many architectures, powerpc 8xx hardware tablewalk requires
a two level process for all page sizes, allthough second level only
has one entry when pagesize is 8M.

To fit with Linux page table topology and without requiring special
page directory layout like hugepd, the page entry will be replicated
1024 times in the standard page table. However for large pages it is
necessary to set bits in the level-1 (PMD) entry. At the time being,
for 512k pages the flag is kept in the PTE and inserted in the PMD
entry at TLB miss exception, that is necessary because we can have
pages of different sizes in a page table. However the 12 PTE bits are
fully used and there is no room for an additional bit for page size.

For 8M pages, there will be only one page per PMD entry, it is
therefore possible to flag the pagesize in the PMD entry, with the
advantage that the information will already be at the right place for
the hardware.

To do so, add a new helper called pmd_populate_size() which takes the
page size as an additional argument, and modify __pte_alloc() to also
take that argument. pte_alloc() is left unmodified in order to
reduce churn on callers, and a pte_alloc_size() is added for use by
pte_alloc_huge().

When an architecture doesn't provide pmd_populate_size(),
pmd_populate() is used as a fallback.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 include/linux/mm.h | 12 +++++++-----
 mm/filemap.c       |  2 +-
 mm/internal.h      |  2 +-
 mm/memory.c        | 19 ++++++++++++-------
 mm/pgalloc-track.h |  2 +-
 mm/userfaultfd.c   |  4 ++--
 6 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index b6bdaa18b9e9..158cb87bc604 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2803,8 +2803,8 @@ static inline void mm_inc_nr_ptes(struct mm_struct *mm) {}
 static inline void mm_dec_nr_ptes(struct mm_struct *mm) {}
 #endif
 
-int __pte_alloc(struct mm_struct *mm, pmd_t *pmd);
-int __pte_alloc_kernel(pmd_t *pmd);
+int __pte_alloc(struct mm_struct *mm, pmd_t *pmd, unsigned long sz);
+int __pte_alloc_kernel(pmd_t *pmd, unsigned long sz);
 
 #if defined(CONFIG_MMU)
 
@@ -2989,7 +2989,8 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
 	pte_unmap(pte);					\
 } while (0)
 
-#define pte_alloc(mm, pmd) (unlikely(pmd_none(*(pmd))) && __pte_alloc(mm, pmd))
+#define pte_alloc_size(mm, pmd, sz) (unlikely(pmd_none(*(pmd))) && __pte_alloc(mm, pmd, sz))
+#define pte_alloc(mm, pmd) pte_alloc_size(mm, pmd, PAGE_SIZE)
 
 #define pte_alloc_map(mm, pmd, address)			\
 	(pte_alloc(mm, pmd) ? NULL : pte_offset_map(pmd, address))
@@ -2998,9 +2999,10 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
 	(pte_alloc(mm, pmd) ?			\
 		 NULL : pte_offset_map_lock(mm, pmd, address, ptlp))
 
-#define pte_alloc_kernel(pmd, address)			\
-	((unlikely(pmd_none(*(pmd))) && __pte_alloc_kernel(pmd))? \
+#define pte_alloc_kernel_size(pmd, address, sz)			\
+	((unlikely(pmd_none(*(pmd))) && __pte_alloc_kernel(pmd, sz))? \
 		NULL: pte_offset_kernel(pmd, address))
+#define pte_alloc_kernel(pmd, address)	pte_alloc_kernel_size(pmd, address, PAGE_SIZE)
 
 #if USE_SPLIT_PMD_PTLOCKS
 
diff --git a/mm/filemap.c b/mm/filemap.c
index 30de18c4fd28..5a783063d1f6 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3428,7 +3428,7 @@ static bool filemap_map_pmd(struct vm_fault *vmf, struct folio *folio,
 	}
 
 	if (pmd_none(*vmf->pmd) && vmf->prealloc_pte)
-		pmd_install(mm, vmf->pmd, &vmf->prealloc_pte);
+		pmd_install(mm, vmf->pmd, &vmf->prealloc_pte, PAGE_SIZE);
 
 	return false;
 }
diff --git a/mm/internal.h b/mm/internal.h
index 07ad2675a88b..4a01bbf55264 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -206,7 +206,7 @@ void folio_activate(struct folio *folio);
 void free_pgtables(struct mmu_gather *tlb, struct ma_state *mas,
 		   struct vm_area_struct *start_vma, unsigned long floor,
 		   unsigned long ceiling, bool mm_wr_locked);
-void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte);
+void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte, unsigned long sz);
 
 struct zap_details;
 void unmap_page_range(struct mmu_gather *tlb,
diff --git a/mm/memory.c b/mm/memory.c
index d2155ced45f8..2a9eba13a95f 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -409,7 +409,12 @@ void free_pgtables(struct mmu_gather *tlb, struct ma_state *mas,
 	} while (vma);
 }
 
-void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte)
+#ifndef pmd_populate_size
+#define pmd_populate_size(mm, pmdp, pte, sz) pmd_populate(mm, pmdp, pte)
+#define pmd_populate_kernel_size(mm, pmdp, pte, sz) pmd_populate_kernel(mm, pmdp, pte)
+#endif
+
+void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte, unsigned long sz)
 {
 	spinlock_t *ptl = pmd_lock(mm, pmd);
 
@@ -429,25 +434,25 @@ void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte)
 		 * smp_rmb() barriers in page table walking code.
 		 */
 		smp_wmb(); /* Could be smp_wmb__xxx(before|after)_spin_lock */
-		pmd_populate(mm, pmd, *pte);
+		pmd_populate_size(mm, pmd, *pte, sz);
 		*pte = NULL;
 	}
 	spin_unlock(ptl);
 }
 
-int __pte_alloc(struct mm_struct *mm, pmd_t *pmd)
+int __pte_alloc(struct mm_struct *mm, pmd_t *pmd, unsigned long sz)
 {
 	pgtable_t new = pte_alloc_one(mm);
 	if (!new)
 		return -ENOMEM;
 
-	pmd_install(mm, pmd, &new);
+	pmd_install(mm, pmd, &new, sz);
 	if (new)
 		pte_free(mm, new);
 	return 0;
 }
 
-int __pte_alloc_kernel(pmd_t *pmd)
+int __pte_alloc_kernel(pmd_t *pmd, unsigned long sz)
 {
 	pte_t *new = pte_alloc_one_kernel(&init_mm);
 	if (!new)
@@ -456,7 +461,7 @@ int __pte_alloc_kernel(pmd_t *pmd)
 	spin_lock(&init_mm.page_table_lock);
 	if (likely(pmd_none(*pmd))) {	/* Has another populated it ? */
 		smp_wmb(); /* See comment in pmd_install() */
-		pmd_populate_kernel(&init_mm, pmd, new);
+		pmd_populate_kernel_size(&init_mm, pmd, new, sz);
 		new = NULL;
 	}
 	spin_unlock(&init_mm.page_table_lock);
@@ -4740,7 +4745,7 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
 		}
 
 		if (vmf->prealloc_pte)
-			pmd_install(vma->vm_mm, vmf->pmd, &vmf->prealloc_pte);
+			pmd_install(vma->vm_mm, vmf->pmd, &vmf->prealloc_pte, PAGE_SIZE);
 		else if (unlikely(pte_alloc(vma->vm_mm, vmf->pmd)))
 			return VM_FAULT_OOM;
 	}
diff --git a/mm/pgalloc-track.h b/mm/pgalloc-track.h
index e9e879de8649..90e37de7ab77 100644
--- a/mm/pgalloc-track.h
+++ b/mm/pgalloc-track.h
@@ -45,7 +45,7 @@ static inline pmd_t *pmd_alloc_track(struct mm_struct *mm, pud_t *pud,
 
 #define pte_alloc_kernel_track(pmd, address, mask)			\
 	((unlikely(pmd_none(*(pmd))) &&					\
-	  (__pte_alloc_kernel(pmd) || ({*(mask)|=PGTBL_PMD_MODIFIED;0;})))?\
+	  (__pte_alloc_kernel(pmd, PAGE_SIZE) || ({*(mask)|=PGTBL_PMD_MODIFIED;0;})))?\
 		NULL: pte_offset_kernel(pmd, address))
 
 #endif /* _LINUX_PGALLOC_TRACK_H */
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 3c3539c573e7..0f129d5c5aa2 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -764,7 +764,7 @@ static __always_inline ssize_t mfill_atomic(struct userfaultfd_ctx *ctx,
 			break;
 		}
 		if (unlikely(pmd_none(dst_pmdval)) &&
-		    unlikely(__pte_alloc(dst_mm, dst_pmd))) {
+		    unlikely(__pte_alloc(dst_mm, dst_pmd, PAGE_SIZE))) {
 			err = -ENOMEM;
 			break;
 		}
@@ -1687,7 +1687,7 @@ ssize_t move_pages(struct userfaultfd_ctx *ctx, unsigned long dst_start,
 					err = -ENOENT;
 					break;
 				}
-				if (unlikely(__pte_alloc(mm, src_pmd))) {
+				if (unlikely(__pte_alloc(mm, src_pmd, PAGE_SIZE))) {
 					err = -ENOMEM;
 					break;
 				}
-- 
2.44.0

