Return-Path: <linuxppc-dev+bounces-14742-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E195CBB71E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Dec 2025 07:56:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dTYrH2b5Pz2xqf;
	Sun, 14 Dec 2025 17:56:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765695375;
	cv=none; b=d2OnVdTiPmYWMZLAkCfsZjRlt2uhfh8L0Nu97k0Iczuoio1dnXrjDgfp5YjXZ5vBjkX8Npa+Rf6h5iP2Jzzb9hdmnZrvZWQTEn2VCkEdqtjiVdW8XnmnouYeCWNqBWoumQD8inSF6PrHUJlHPEnCTcik4qopMkzTHHRVnVL0aRrTzknvlTh3ij86qqm24MAFenfUOs+ynpXnKnAtiTWr3/fqJizoD2ThzbcFzYkCppjGKUsNFUfJ0oDiASXJWCLuIA5pvZ02b45x7eD7EJiISY2BsZhRb1RSnXBhLzJUt7WmrGAc29y75DyRN6iCFG/yDHXX0n8OxB0K6/OoEmzVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765695375; c=relaxed/relaxed;
	bh=cp/dw4IQXDPolyDcMd7d3wHYF+iUcd5titFFJTQcVnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N5+8PVy1DndlpA74hp83uV1tGjiRXNGaxAFvALlwKv2AOSBJ5ScCaJBCZAIqdPv0J02/Nm0vfix7uqFD9PoSz59rpi+0EGKXHrdnlzfjYbrldKJr+j8kKfCaPeXp56gKARenldo5RE2V+FMkM4hMVPuMTVzZZzzjFfUk0cZbvG9UnSEHrCdRq81vYsSQyoN7I2iXE2xuTi6ct/0sk7IpIYv07tIkBUaj7W6uexchZmWAcCjlQ5PLzSssNXWUzzNWE1vNot7vv8ZvsvTeKr/SoTHjMAKfXziS/hOmqj08SJg5p/ldnfMgWZ5HvCipRcehnNNkikPY+85Fp3FHNdZEUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ROIjs9qu; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=alexs@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ROIjs9qu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=alexs@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dTYrG143rz2xS3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Dec 2025 17:56:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F21D46016D;
	Sun, 14 Dec 2025 06:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B442C4CEF1;
	Sun, 14 Dec 2025 06:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765695370;
	bh=bw5B5LZunN+LD9V0kxZG0WgGS7BNiOM403s4yqcOcrY=;
	h=From:To:Cc:Subject:Date:From;
	b=ROIjs9quRzpkNc9eKLOQOrTmJASd5NEf0YjO6XxcxPSXuDjg3p+rNHRYrfCILrIbg
	 ddr6PGzYcD+qMG3uRh7qDlPjDi9SSZq0yGV05Hc4RNbmg22R0srpU6ys2bFvBcXIJh
	 5cTLEiOuxyzS+BGT+yGDTtmlAOY9MIJi+MAeR+s4bFnbttwG45rywrz5gGBwLZ6NUu
	 nFNcwBcFqTfSOfl055USsn4aYE14lRrPVOjrYMIdULDqKAbjXdzXWFmop1j4eNp6ly
	 Ye02mdr313RqD4cuo0sUKuKTz1j52MgF4G/rSWbAcxgnh0Yq56gakWvkGXyeYkPM4b
	 +zJNIrVW3XWKw==
From: alexs@kernel.org
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Thomas Huth <thuth@redhat.com>,
	Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-mm@kvack.org
Cc: Alex Shi <alexs@kernel.org>
Subject: [RFC PATCH 1/2] mm/pgtable: use ptdesc for pmd_huge_pte
Date: Sun, 14 Dec 2025 14:55:45 +0800
Message-ID: <20251214065546.156209-1-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Alex Shi <alexs@kernel.org>

'pmd_huge_pte' are pgtable variables, but used 'pgtable->lru'
instead of pgtable->pt_list in pgtable_trans_huge_deposit/withdraw
functions, That's a bit weird.

So let's convert the pgtable_t to precise 'struct ptdesc *' for
ptdesc->pmd_huge_pte, and mm->pmd_huge_pte, then convert function
pgtable_trans_huge_deposit() to use correct ptdesc.

This convertion works for most of arch, but failed on s390/sparc/powerpc
since they use 'pte_t *' as pgtable_t. Is there any suggestion for these
archs? If we could have a solution, we may remove the pgtable_t for other
archs.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: linux-mm@kvack.org
Cc: sparclinux@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Magnus Lindholm <linmag7@gmail.com>
Cc: Matthew Wilcox  <willy@infradead.org>
Cc: Will Deacon <will@kernel.org>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lance Yang <lance.yang@linux.dev>
Cc: Barry Song <baohua@kernel.org>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: David S. Miller <davem@davemloft.net>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Christophe Leroy  <chleroy@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h |  6 +++---
 arch/s390/include/asm/pgtable.h              |  2 +-
 arch/s390/mm/pgtable.c                       |  2 +-
 arch/sparc/include/asm/pgtable_64.h          |  2 +-
 arch/sparc/mm/tlb.c                          |  2 +-
 include/linux/mm_types.h                     |  4 ++--
 include/linux/pgtable.h                      |  2 +-
 mm/debug_vm_pgtable.c                        |  3 ++-
 mm/huge_memory.c                             | 16 +++++++++-------
 mm/khugepaged.c                              |  2 +-
 mm/memory.c                                  |  3 ++-
 mm/migrate_device.c                          |  2 +-
 mm/pgtable-generic.c                         | 16 ++++++++--------
 13 files changed, 33 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index aac8ce30cd3b..f10736af296d 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1320,11 +1320,11 @@ pud_t pudp_huge_get_and_clear_full(struct vm_area_struct *vma,
 
 #define __HAVE_ARCH_PGTABLE_DEPOSIT
 static inline void pgtable_trans_huge_deposit(struct mm_struct *mm,
-					      pmd_t *pmdp, pgtable_t pgtable)
+					      pmd_t *pmdp, struct ptdesc *pgtable)
 {
 	if (radix_enabled())
-		return radix__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
-	return hash__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
+		return radix__pgtable_trans_huge_deposit(mm, pmdp, page_ptdesc(pgtable));
+	return hash__pgtable_trans_huge_deposit(mm, pmdp, page_ptdesc(pgtable));
 }
 
 #define __HAVE_ARCH_PGTABLE_WITHDRAW
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index bca9b29778c3..e45cb52a923a 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1751,7 +1751,7 @@ pud_t pudp_xchg_direct(struct mm_struct *, unsigned long, pud_t *, pud_t);
 
 #define __HAVE_ARCH_PGTABLE_DEPOSIT
 void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
-				pgtable_t pgtable);
+				struct ptdesc *pgtable);
 
 #define __HAVE_ARCH_PGTABLE_WITHDRAW
 pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
diff --git a/arch/s390/mm/pgtable.c b/arch/s390/mm/pgtable.c
index 666adcd681ab..c301af71b3ec 100644
--- a/arch/s390/mm/pgtable.c
+++ b/arch/s390/mm/pgtable.c
@@ -520,7 +520,7 @@ EXPORT_SYMBOL(pudp_xchg_direct);
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
-				pgtable_t pgtable)
+				struct ptdesc *pgtable)
 {
 	struct list_head *lh = (struct list_head *) pgtable;
 
diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 615f460c50af..4b7f7113a1b3 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -992,7 +992,7 @@ extern pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
 
 #define __HAVE_ARCH_PGTABLE_DEPOSIT
 void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
-				pgtable_t pgtable);
+				struct ptdesc *pgtable);
 
 #define __HAVE_ARCH_PGTABLE_WITHDRAW
 pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
index a35ddcca5e76..5dfee57d2440 100644
--- a/arch/sparc/mm/tlb.c
+++ b/arch/sparc/mm/tlb.c
@@ -270,7 +270,7 @@ pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
 }
 
 void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
-				pgtable_t pgtable)
+				struct ptdesc *pgtable)
 {
 	struct list_head *lh = (struct list_head *) pgtable;
 
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 9f6de068295d..674e5fd4cf0d 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -577,7 +577,7 @@ struct ptdesc {
 		struct list_head pt_list;
 		struct {
 			unsigned long _pt_pad_1;
-			pgtable_t pmd_huge_pte;
+			struct ptdesc *pmd_huge_pte;
 		};
 	};
 	unsigned long __page_mapping;
@@ -1249,7 +1249,7 @@ struct mm_struct {
 		struct mmu_notifier_subscriptions *notifier_subscriptions;
 #endif
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !defined(CONFIG_SPLIT_PMD_PTLOCKS)
-		pgtable_t pmd_huge_pte; /* protected by page_table_lock */
+		struct ptdesc *pmd_huge_pte; /* protected by page_table_lock */
 #endif
 #ifdef CONFIG_NUMA_BALANCING
 		/*
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 652f287c1ef6..a5b1e3f7452a 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1017,7 +1017,7 @@ static inline pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 
 #ifndef __HAVE_ARCH_PGTABLE_DEPOSIT
 extern void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
-				       pgtable_t pgtable);
+				       struct ptdesc *pgtable);
 #endif
 
 #ifndef __HAVE_ARCH_PGTABLE_WITHDRAW
diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index ae9b9310d96f..26ff92705558 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -240,7 +240,8 @@ static void __init pmd_advanced_tests(struct pgtable_debug_args *args)
 	/* Align the address wrt HPAGE_PMD_SIZE */
 	vaddr &= HPAGE_PMD_MASK;
 
-	pgtable_trans_huge_deposit(args->mm, args->pmdp, args->start_ptep);
+	pgtable_trans_huge_deposit(args->mm, args->pmdp,
+					page_ptdesc(args->start_ptep));
 
 	pmd = pfn_pmd(args->pmd_pfn, args->page_prot);
 	set_pmd_at(args->mm, vaddr, args->pmdp, pmd);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index f7c565f11a98..ff74bd70690d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1352,7 +1352,8 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 			VM_BUG_ON(ret & VM_FAULT_FALLBACK);
 			return ret;
 		}
-		pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, pgtable);
+		pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd,
+						page_ptdesc(pgtable));
 		map_anon_folio_pmd_pf(folio, vmf->pmd, vma, haddr);
 		mm_inc_nr_ptes(vma->vm_mm);
 		spin_unlock(vmf->ptl);
@@ -1450,7 +1451,7 @@ static void set_huge_zero_folio(pgtable_t pgtable, struct mm_struct *mm,
 	pmd_t entry;
 	entry = folio_mk_pmd(zero_folio, vma->vm_page_prot);
 	entry = pmd_mkspecial(entry);
-	pgtable_trans_huge_deposit(mm, pmd, pgtable);
+	pgtable_trans_huge_deposit(mm, pmd, page_ptdesc(pgtable));
 	set_pmd_at(mm, haddr, pmd, entry);
 	mm_inc_nr_ptes(mm);
 }
@@ -1576,7 +1577,7 @@ static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 	}
 
 	if (pgtable) {
-		pgtable_trans_huge_deposit(mm, pmd, pgtable);
+		pgtable_trans_huge_deposit(mm, pmd, page_ptdesc(pgtable));
 		mm_inc_nr_ptes(mm);
 		pgtable = NULL;
 	}
@@ -1837,7 +1838,7 @@ static void copy_huge_non_present_pmd(
 
 	add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
 	mm_inc_nr_ptes(dst_mm);
-	pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
+	pgtable_trans_huge_deposit(dst_mm, dst_pmd, page_ptdesc(pgtable));
 	if (!userfaultfd_wp(dst_vma))
 		pmd = pmd_swp_clear_uffd_wp(pmd);
 	set_pmd_at(dst_mm, addr, dst_pmd, pmd);
@@ -1932,7 +1933,7 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
 out_zero_page:
 	mm_inc_nr_ptes(dst_mm);
-	pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
+	pgtable_trans_huge_deposit(dst_mm, dst_pmd, page_ptdesc(pgtable));
 	pmdp_set_wrprotect(src_mm, addr, src_pmd);
 	if (!userfaultfd_wp(dst_vma))
 		pmd = pmd_clear_uffd_wp(pmd);
@@ -2493,7 +2494,8 @@ bool move_huge_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 		if (pmd_move_must_withdraw(new_ptl, old_ptl, vma)) {
 			pgtable_t pgtable;
 			pgtable = pgtable_trans_huge_withdraw(mm, old_pmd);
-			pgtable_trans_huge_deposit(mm, new_pmd, pgtable);
+			pgtable_trans_huge_deposit(mm, new_pmd,
+							page_ptdesc(pgtable));
 		}
 		pmd = move_soft_dirty_pmd(pmd);
 		if (vma_has_uffd_without_event_remap(vma))
@@ -2799,7 +2801,7 @@ int move_pages_huge_pmd(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd, pm
 	set_pmd_at(mm, dst_addr, dst_pmd, _dst_pmd);
 
 	src_pgtable = pgtable_trans_huge_withdraw(mm, src_pmd);
-	pgtable_trans_huge_deposit(mm, dst_pmd, src_pgtable);
+	pgtable_trans_huge_deposit(mm, dst_pmd, page_ptdesc(src_pgtable));
 unlock_ptls:
 	double_pt_unlock(src_ptl, dst_ptl);
 	/* unblock rmap walks */
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 97d1b2824386..f9b1f8e75360 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1228,7 +1228,7 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 
 	spin_lock(pmd_ptl);
 	BUG_ON(!pmd_none(*pmd));
-	pgtable_trans_huge_deposit(mm, pmd, pgtable);
+	pgtable_trans_huge_deposit(mm, pmd, page_ptdesc(pgtable));
 	map_anon_folio_pmd_nopf(folio, pmd, vma, address);
 	spin_unlock(pmd_ptl);
 
diff --git a/mm/memory.c b/mm/memory.c
index 2a55edc48a65..f777de39cede 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5351,7 +5351,8 @@ static void deposit_prealloc_pte(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 
-	pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, vmf->prealloc_pte);
+	pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd,
+					page_ptdesc(vmf->prealloc_pte));
 	/*
 	 * We are going to consume the prealloc table,
 	 * count that as nr_ptes.
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 23379663b1e1..dd83bfff4f44 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -883,7 +883,7 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 		flush_cache_page(vma, addr, addr + HPAGE_PMD_SIZE);
 		pmdp_invalidate(vma, addr, pmdp);
 	} else {
-		pgtable_trans_huge_deposit(vma->vm_mm, pmdp, pgtable);
+		pgtable_trans_huge_deposit(vma->vm_mm, pmdp, page_ptdesc(pgtable));
 		mm_inc_nr_ptes(vma->vm_mm);
 	}
 	set_pmd_at(vma->vm_mm, addr, pmdp, entry);
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index d3aec7a9926a..220844a81e38 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -164,15 +164,15 @@ pud_t pudp_huge_clear_flush(struct vm_area_struct *vma, unsigned long address,
 
 #ifndef __HAVE_ARCH_PGTABLE_DEPOSIT
 void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
-				pgtable_t pgtable)
+				struct ptdesc *pgtable)
 {
 	assert_spin_locked(pmd_lockptr(mm, pmdp));
 
 	/* FIFO */
 	if (!pmd_huge_pte(mm, pmdp))
-		INIT_LIST_HEAD(&pgtable->lru);
+		INIT_LIST_HEAD(&pgtable->pt_list);
 	else
-		list_add(&pgtable->lru, &pmd_huge_pte(mm, pmdp)->lru);
+		list_add(&pgtable->pt_list, &pmd_huge_pte(mm, pmdp)->pt_list);
 	pmd_huge_pte(mm, pmdp) = pgtable;
 }
 #endif
@@ -181,17 +181,17 @@ void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
 /* no "address" argument so destroys page coloring of some arch */
 pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
 {
-	pgtable_t pgtable;
+	struct ptdesc *pgtable;
 
 	assert_spin_locked(pmd_lockptr(mm, pmdp));
 
 	/* FIFO */
 	pgtable = pmd_huge_pte(mm, pmdp);
-	pmd_huge_pte(mm, pmdp) = list_first_entry_or_null(&pgtable->lru,
-							  struct page, lru);
+	pmd_huge_pte(mm, pmdp) = list_first_entry_or_null(&pgtable->pt_list,
+							  struct ptdesc, pt_list);
 	if (pmd_huge_pte(mm, pmdp))
-		list_del(&pgtable->lru);
-	return pgtable;
+		list_del(&pgtable->pt_list);
+	return ptdesc_page(pgtable);
 }
 #endif
 
-- 
2.43.0


