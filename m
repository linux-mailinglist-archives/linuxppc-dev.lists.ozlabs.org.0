Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49202940F6C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 12:33:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=otPDGIS+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYBQG1dRhz3d2n
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 20:33:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=otPDGIS+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=alexs@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WY5M93x40z3cb2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 16:45:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B9AE160B97;
	Tue, 30 Jul 2024 06:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59076C4AF0E;
	Tue, 30 Jul 2024 06:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722321907;
	bh=W5tYBso4UoPS/fKSVOluC4Ch4cJZaP/H2xHcE2b1FHU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=otPDGIS+BP+zJU1WerV1XStPgq7KbeiiHRdcUEyZGtj4yf/zK6A7xDzbi5ECaayAt
	 YVSoB/3bQTSLE8x8/QN40AJ0s2PdSq3df6HoYbaIj4z13Vl5vZw9N5ye4PEjdht//7
	 bqv0egHAAAYkaLavBipdxSHoduTULRxYgtDM4b4mjLw9jYnjamZKyZ8Y6tyDakNpzC
	 Y0Ij1GnGY4gY870o0InOzrbMFIggAcxm9mvmF741jpwmx9ZohF6o5cMeki7Psq4dLD
	 /4dfI13pYO7FfkQIWJrOHrtaZ1MHS6fgo+N7tVvA1Q6NzphZJuPFR1n3WFSvbuCYFD
	 UKCxIcO9HG0sA==
From: alexs@kernel.org
To: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Brian Cain <bcain@quicinc.com>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Bibo Mao <maobibo@loongson.cn>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Vishal Moola <vishal.moola@gmail.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Lance Yang <ioworker0@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Barry Song <baohua@kernel.org>,
	linux-s390@vger.kernel.org
Subject: [RFC PATCH 10/18] mm/pgtable: pass ptdesc to pte_free()
Date: Tue, 30 Jul 2024 14:47:04 +0800
Message-ID: <20240730064712.3714387-11-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730064712.3714387-1-alexs@kernel.org>
References: <20240730064712.3714387-1-alexs@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 30 Jul 2024 20:25:54 +1000
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
Cc: nvdimm@lists.linux.dev, Jan Kara <jack@suse.cz>, David Hildenbrand <david@redhat.com>, Breno Leitao <leitao@debian.org>, Guo Ren <guoren@kernel.org>, Matthew Wilcox <willy@infradead.org>, Jisheng Zhang <jszhang@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Alex Shi <alexs@kernel.org>, Anup Patel <anup@brainfault.org>, Hugh Dickins <hughd@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Ryan Roberts <ryan.roberts@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Dawei Li <dawei.li@shingroup.cn>, Alexander Viro <viro@zeniv.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Oscar Salvador <osalvador@suse.de>, Christian Brauner <brauner@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-fsdevel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alex Shi <alexs@kernel.org>

Now we could remove couple of page<->ptdesc converters now.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: linux-mm@kvack.org
Cc: linux-arch@vger.kernel.org
Cc: nvdimm@lists.linux.dev
Cc: linux-fsdevel@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Vishal Moola  <vishal.moola@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jan Kara <jack@suse.cz>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: David S. Miller <davem@davemloft.net>
Cc: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Mike Rapoport  <rppt@kernel.org>
Cc: Dawei Li <dawei.li@shingroup.cn>
Cc: Hugh Dickins <hughd@google.com>
---
 arch/arm/mm/pgd.c                            |  2 +-
 arch/m68k/include/asm/motorola_pgalloc.h     |  4 ++--
 arch/powerpc/include/asm/book3s/64/pgalloc.h |  2 +-
 arch/powerpc/include/asm/pgalloc.h           |  2 +-
 arch/sparc/include/asm/pgalloc_32.h          |  2 +-
 arch/sparc/mm/srmmu.c                        |  2 +-
 fs/dax.c                                     |  2 +-
 include/asm-generic/pgalloc.h                |  4 +---
 mm/debug_vm_pgtable.c                        |  2 +-
 mm/huge_memory.c                             | 20 ++++++++++----------
 mm/memory.c                                  |  4 ++--
 mm/pgtable-generic.c                         |  2 +-
 12 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/arch/arm/mm/pgd.c b/arch/arm/mm/pgd.c
index f8e9bc58a84f..c384b734d752 100644
--- a/arch/arm/mm/pgd.c
+++ b/arch/arm/mm/pgd.c
@@ -168,7 +168,7 @@ void pgd_free(struct mm_struct *mm, pgd_t *pgd_base)
 
 	pte = pmd_pgtable(*pmd);
 	pmd_clear(pmd);
-	pte_free(mm, pte);
+	pte_free(mm, page_ptdesc(pte));
 	mm_dec_nr_ptes(mm);
 no_pmd:
 	pud_clear(pud);
diff --git a/arch/m68k/include/asm/motorola_pgalloc.h b/arch/m68k/include/asm/motorola_pgalloc.h
index 74a817d9387f..f6bb375971dc 100644
--- a/arch/m68k/include/asm/motorola_pgalloc.h
+++ b/arch/m68k/include/asm/motorola_pgalloc.h
@@ -39,9 +39,9 @@ static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
 	return get_pointer_table(TABLE_PTE);
 }
 
-static inline void pte_free(struct mm_struct *mm, pgtable_t pgtable)
+static inline void pte_free(struct mm_struct *mm, struct ptdesc *ptdesc)
 {
-	free_pointer_table(pgtable, TABLE_PTE);
+	free_pointer_table(ptdesc_page(ptdesc), TABLE_PTE);
 }
 
 static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pgtable,
diff --git a/arch/powerpc/include/asm/book3s/64/pgalloc.h b/arch/powerpc/include/asm/book3s/64/pgalloc.h
index dd2cff53a111..eb7d2ca59f62 100644
--- a/arch/powerpc/include/asm/book3s/64/pgalloc.h
+++ b/arch/powerpc/include/asm/book3s/64/pgalloc.h
@@ -162,7 +162,7 @@ static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
 }
 
 static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
-				pgtable_t pte_page)
+				struct ptdesc *pte_page)
 {
 	*pmd = __pmd(__pgtable_ptr_val(pte_page) | PMD_VAL_BITS);
 }
diff --git a/arch/powerpc/include/asm/pgalloc.h b/arch/powerpc/include/asm/pgalloc.h
index 37512f344b37..12520521163e 100644
--- a/arch/powerpc/include/asm/pgalloc.h
+++ b/arch/powerpc/include/asm/pgalloc.h
@@ -40,7 +40,7 @@ static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
 	pte_fragment_free((unsigned long *)pte, 1);
 }
 
-static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
+static inline void pte_free(struct mm_struct *mm, struct ptdesc *ptepage)
 {
 	pte_fragment_free((unsigned long *)ptepage, 0);
 }
diff --git a/arch/sparc/include/asm/pgalloc_32.h b/arch/sparc/include/asm/pgalloc_32.h
index bc3ef54d9564..addaade56f21 100644
--- a/arch/sparc/include/asm/pgalloc_32.h
+++ b/arch/sparc/include/asm/pgalloc_32.h
@@ -71,7 +71,7 @@ static inline void free_pte_fast(pte_t *pte)
 
 #define pte_free_kernel(mm, pte)	free_pte_fast(pte)
 
-void pte_free(struct mm_struct * mm, pgtable_t pte);
+void pte_free(struct mm_struct *mm, struct ptdesc *pte);
 #define __pte_free_tlb(tlb, pte, addr)	pte_free((tlb)->mm, pte)
 
 #endif /* _SPARC_PGALLOC_H */
diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 60bb8628bb1f..05be7d86eda3 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -365,7 +365,7 @@ struct ptdesc *pte_alloc_one(struct mm_struct *mm)
 	return (struct ptdesc *)ptep;
 }
 
-void pte_free(struct mm_struct *mm, pgtable_t ptep)
+void pte_free(struct mm_struct *mm, struct ptdesc *ptep)
 {
 	struct page *page;
 
diff --git a/fs/dax.c b/fs/dax.c
index 51cbc08b22e7..61b9bd5200da 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1246,7 +1246,7 @@ static vm_fault_t dax_pmd_load_hole(struct xa_state *xas, struct vm_fault *vmf,
 
 fallback:
 	if (ptdesc)
-		pte_free(vma->vm_mm, ptdesc_page(ptdesc));
+		pte_free(vma->vm_mm, ptdesc);
 	trace_dax_pmd_load_hole_fallback(inode, vmf, zero_folio, *entry);
 	return VM_FAULT_FALLBACK;
 }
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 1a4070f8d5dd..5f249ec9d289 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -105,10 +105,8 @@ static inline struct ptdesc *pte_alloc_one_noprof(struct mm_struct *mm)
  * @mm: the mm_struct of the current context
  * @pte_page: the `struct page` referencing the ptdesc
  */
-static inline void pte_free(struct mm_struct *mm, struct page *pte_page)
+static inline void pte_free(struct mm_struct *mm, struct ptdesc *ptdesc)
 {
-	struct ptdesc *ptdesc = page_ptdesc(pte_page);
-
 	pagetable_pte_dtor(ptdesc);
 	pagetable_free(ptdesc);
 }
diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index e4969fb54da3..f256bc816744 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -1049,7 +1049,7 @@ static void __init destroy_args(struct pgtable_debug_args *args)
 
 	/* Free page table entries */
 	if (args->start_ptep) {
-		pte_free(args->mm, args->start_ptep);
+		pte_free(args->mm, page_ptdesc(args->start_ptep));
 		mm_dec_nr_ptes(args->mm);
 	}
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 6274eb7559ac..dc323453fa02 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -987,7 +987,7 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf,
 		if (userfaultfd_missing(vma)) {
 			spin_unlock(vmf->ptl);
 			folio_put(folio);
-			pte_free(vma->vm_mm, ptdesc_page(ptdesc));
+			pte_free(vma->vm_mm, ptdesc);
 			ret = handle_userfault(vmf, VM_UFFD_MISSING);
 			VM_BUG_ON(ret & VM_FAULT_FALLBACK);
 			return ret;
@@ -1013,7 +1013,7 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf,
 	spin_unlock(vmf->ptl);
 release:
 	if (ptdesc)
-		pte_free(vma->vm_mm, ptdesc_page(ptdesc));
+		pte_free(vma->vm_mm, ptdesc);
 	folio_put(folio);
 	return ret;
 
@@ -1096,7 +1096,7 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 			return VM_FAULT_OOM;
 		zero_folio = mm_get_huge_zero_folio(vma->vm_mm);
 		if (unlikely(!zero_folio)) {
-			pte_free(vma->vm_mm, ptdesc_page(ptdesc));
+			pte_free(vma->vm_mm, ptdesc);
 			count_vm_event(THP_FAULT_FALLBACK);
 			return VM_FAULT_FALLBACK;
 		}
@@ -1106,10 +1106,10 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 			ret = check_stable_address_space(vma->vm_mm);
 			if (ret) {
 				spin_unlock(vmf->ptl);
-				pte_free(vma->vm_mm, ptdesc_page(ptdesc));
+				pte_free(vma->vm_mm, ptdesc);
 			} else if (userfaultfd_missing(vma)) {
 				spin_unlock(vmf->ptl);
-				pte_free(vma->vm_mm, ptdesc_page(ptdesc));
+				pte_free(vma->vm_mm, ptdesc);
 				ret = handle_userfault(vmf, VM_UFFD_MISSING);
 				VM_BUG_ON(ret & VM_FAULT_FALLBACK);
 			} else {
@@ -1120,7 +1120,7 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 			}
 		} else {
 			spin_unlock(vmf->ptl);
-			pte_free(vma->vm_mm, ptdesc_page(ptdesc));
+			pte_free(vma->vm_mm, ptdesc);
 		}
 		return ret;
 	}
@@ -1178,7 +1178,7 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 out_unlock:
 	spin_unlock(ptl);
 	if (ptdesc)
-		pte_free(mm, ptdesc_page(ptdesc));
+		pte_free(mm, ptdesc);
 }
 
 /**
@@ -1414,7 +1414,7 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 #endif
 
 	if (unlikely(!pmd_trans_huge(pmd))) {
-		pte_free(dst_mm, ptdesc_page(ptdesc));
+		pte_free(dst_mm, ptdesc);
 		goto out_unlock;
 	}
 	/*
@@ -1440,7 +1440,7 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	if (unlikely(folio_try_dup_anon_rmap_pmd(src_folio, src_page, src_vma))) {
 		/* Page maybe pinned: split and retry the fault on PTEs. */
 		folio_put(src_folio);
-		pte_free(dst_mm, ptdesc_page(ptdesc));
+		pte_free(dst_mm, ptdesc);
 		spin_unlock(src_ptl);
 		spin_unlock(dst_ptl);
 		__split_huge_pmd(src_vma, src_pmd, addr, false, NULL);
@@ -1830,7 +1830,7 @@ static inline void zap_deposited_table(struct mm_struct *mm, pmd_t *pmd)
 	pgtable_t pgtable;
 
 	pgtable = pgtable_trans_huge_withdraw(mm, pmd);
-	pte_free(mm, pgtable);
+	pte_free(mm, page_ptdesc(pgtable));
 	mm_dec_nr_ptes(mm);
 }
 
diff --git a/mm/memory.c b/mm/memory.c
index 37529e0a9ce2..3014168e7296 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -451,7 +451,7 @@ int __pte_alloc(struct mm_struct *mm, pmd_t *pmd)
 
 	pmd_install(mm, pmd, (pgtable_t *)&ptdesc);
 	if (ptdesc)
-		pte_free(mm, ptdesc_page(ptdesc));
+		pte_free(mm, ptdesc);
 	return 0;
 }
 
@@ -5196,7 +5196,7 @@ static vm_fault_t do_fault(struct vm_fault *vmf)
 
 	/* preallocated pagetable is unused: free it */
 	if (vmf->prealloc_pte) {
-		pte_free(vm_mm, vmf->prealloc_pte);
+		pte_free(vm_mm, page_ptdesc(vmf->prealloc_pte));
 		vmf->prealloc_pte = NULL;
 	}
 	return ret;
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index f34a8d115f5b..92245a32656b 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -241,7 +241,7 @@ static void pte_free_now(struct rcu_head *head)
 	struct ptdesc *ptdesc;
 
 	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
-	pte_free(NULL /* mm not passed and not used */, (pgtable_t)ptdesc);
+	pte_free(NULL /* mm not passed and not used */, ptdesc);
 }
 
 void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
-- 
2.43.0

