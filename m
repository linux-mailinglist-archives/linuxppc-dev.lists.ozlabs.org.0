Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B939150F1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 16:53:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W79vb64hrz79tX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 00:53:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W79mL6LVfz3fxk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 00:47:30 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4W79l40ZYFz9vFX;
	Mon, 24 Jun 2024 16:46:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7EQmig3mQY5f; Mon, 24 Jun 2024 16:46:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4W79kp5xXzz9vGP;
	Mon, 24 Jun 2024 16:46:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C744F8B768;
	Mon, 24 Jun 2024 16:46:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id BzZLzr6fZO76; Mon, 24 Jun 2024 16:46:10 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.33])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0F2AE8B763;
	Mon, 24 Jun 2024 16:46:09 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v6 20/23] powerpc/e500: Use contiguous PMD instead of hugepd
Date: Mon, 24 Jun 2024 16:45:46 +0200
Message-ID: <1b16c97b8008fbc77c9cbe6fcf1d2ffc8665ef80.1719240269.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1719240269.git.christophe.leroy@csgroup.eu>
References: <cover.1719240269.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719240334; l=13017; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=RCt/w1jfgjS75jeurc9KnG66BmGWNtIsWZG9ZvTwSvE=; b=arY/isXbNwQ5N0gkLHiiBcRVL1pflJy24ge/PfJ8lHBlITLZtcLGsCwY3Au7ntkSCfkFUATax K1HUNuu4PrwChLhBVIEsMfYM9Vx5AfHQ2R8Xcl0KqimsZQQXedRoUSF
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

e500 supports many page sizes among which the following size are
implemented in the kernel at the time being: 4M, 16M, 64M, 256M, 1G.

On e500, TLB miss for hugepages is exclusively handled by SW even
on e6500 which has HW assistance for 4k pages, so there are no
constraints like on the 8xx.

On e500/32, all are at PGD/PMD level and can be handled as
cont-PMD.

On e500/64, smaller ones are on PMD while bigger ones are on PUD.
Again, they can easily be handled as cont-PMD and cont-PUD instead
of hugepd.

On e500/32, use the pagesize bits in PTE to know if it is a PMD or
a leaf entry. This works because the pagesize bits are in the last
12 bits and page tables are 4k aligned.

On e500/64, use highest bit which is always 1 on PxD (Because PxD
contains virtual address of a kernel memory) and always 0 on PTEs
because not all bits of RPN are used/possible.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: Add missing pmd_leaf_size() and pud_leaf_size()
v4: Rebased of v6.10-rc1 : pmd_huge() and pud_huge() are gone
v5:
- Define pte_huge_size() to reduce redundant and handle the case of mpc85xx with 32 bits PTE.
- Replace hard-coded page shift offset (10) with new macro _PAGE_PSIZE_SHIFT_OFFSET
- Use TSIZE encoding in SIZE field in PTE
- On 64 bits, use highest bit to know if it is a PUD/PMD or leaf entry. Avoids problem with page table alignment.
---
 .../powerpc/include/asm/nohash/hugetlb-e500.h | 32 ++------------
 arch/powerpc/include/asm/nohash/pgalloc.h     |  2 -
 arch/powerpc/include/asm/nohash/pgtable.h     | 42 ++++++++++++++-----
 arch/powerpc/include/asm/nohash/pte-e500.h    | 33 +++++++++++++++
 arch/powerpc/include/asm/page.h               | 15 +------
 arch/powerpc/kernel/head_85xx.S               | 21 ++++------
 arch/powerpc/mm/hugetlbpage.c                 |  2 -
 arch/powerpc/mm/nohash/tlb_low_64e.S          |  7 +---
 arch/powerpc/mm/pgtable.c                     | 31 ++++++++++++++
 arch/powerpc/platforms/Kconfig.cputype        |  1 -
 10 files changed, 107 insertions(+), 79 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/hugetlb-e500.h b/arch/powerpc/include/asm/nohash/hugetlb-e500.h
index c6a0938e86fd..812c71fc5eb1 100644
--- a/arch/powerpc/include/asm/nohash/hugetlb-e500.h
+++ b/arch/powerpc/include/asm/nohash/hugetlb-e500.h
@@ -2,38 +2,12 @@
 #ifndef _ASM_POWERPC_NOHASH_HUGETLB_E500_H
 #define _ASM_POWERPC_NOHASH_HUGETLB_E500_H
 
-static inline pte_t *hugepd_page(hugepd_t hpd)
-{
-	if (WARN_ON(!hugepd_ok(hpd)))
-		return NULL;
-
-	return (pte_t *)((hpd_val(hpd) & ~HUGEPD_SHIFT_MASK) | PD_HUGE);
-}
-
-static inline unsigned int hugepd_shift(hugepd_t hpd)
-{
-	return hpd_val(hpd) & HUGEPD_SHIFT_MASK;
-}
-
-static inline pte_t *hugepte_offset(hugepd_t hpd, unsigned long addr,
-				    unsigned int pdshift)
-{
-	/*
-	 * On FSL BookE, we have multiple higher-level table entries that
-	 * point to the same hugepte.  Just use the first one since they're all
-	 * identical.  So for that case, idx=0.
-	 */
-	return hugepd_page(hpd);
-}
+#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
+void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
+		     pte_t pte, unsigned long sz);
 
 void flush_hugetlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
 
-static inline void hugepd_populate(hugepd_t *hpdp, pte_t *new, unsigned int pshift)
-{
-	/* We use the old format for PPC_E500 */
-	*hpdp = __hugepd(((unsigned long)new & ~PD_HUGE) | pshift);
-}
-
 static inline int check_and_get_huge_psize(int shift)
 {
 	if (shift & 1)	/* Not a power of 4 */
diff --git a/arch/powerpc/include/asm/nohash/pgalloc.h b/arch/powerpc/include/asm/nohash/pgalloc.h
index 4b62376318e1..d06efac6d7aa 100644
--- a/arch/powerpc/include/asm/nohash/pgalloc.h
+++ b/arch/powerpc/include/asm/nohash/pgalloc.h
@@ -44,8 +44,6 @@ static inline void pgtable_free(void *table, int shift)
 	}
 }
 
-#define get_hugepd_cache_index(x)	(x)
-
 static inline void pgtable_free_tlb(struct mmu_gather *tlb, void *table, int shift)
 {
 	unsigned long pgf = (unsigned long)table;
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 90d6a0943b35..8d1f0b7062eb 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -31,6 +31,13 @@ static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, p
 
 extern int icache_44x_need_flush;
 
+#ifndef pte_huge_size
+static inline unsigned long pte_huge_size(pte_t pte)
+{
+	return PAGE_SIZE;
+}
+#endif
+
 /*
  * PTE updates. This function is called whenever an existing
  * valid PTE is updated. This does -not- include set_pte_at()
@@ -52,11 +59,34 @@ static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, p
 {
 	pte_basic_t old = pte_val(*p);
 	pte_basic_t new = (old & ~(pte_basic_t)clr) | set;
+	unsigned long sz;
+	unsigned long pdsize;
+	int i;
 
 	if (new == old)
 		return old;
 
-	*p = __pte(new);
+	if (huge)
+		sz = pte_huge_size(__pte(old));
+	else
+		sz = PAGE_SIZE;
+
+	if (sz < PMD_SIZE)
+		pdsize = PAGE_SIZE;
+	else if (sz < PUD_SIZE)
+		pdsize = PMD_SIZE;
+	else if (sz < P4D_SIZE)
+		pdsize = PUD_SIZE;
+	else if (sz < PGDIR_SIZE)
+		pdsize = P4D_SIZE;
+	else
+		pdsize = PGDIR_SIZE;
+
+	for (i = 0; i < sz / pdsize; i++, p++) {
+		*p = __pte(new);
+		if (new)
+			new += (unsigned long long)(pdsize / PAGE_SIZE) << PTE_RPN_SHIFT;
+	}
 
 	if (IS_ENABLED(CONFIG_44x) && !is_kernel_addr(addr) && (old & _PAGE_EXEC))
 		icache_44x_need_flush = 1;
@@ -340,16 +370,6 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 
 #define pgprot_writecombine pgprot_noncached_wc
 
-#ifdef CONFIG_ARCH_HAS_HUGEPD
-static inline int hugepd_ok(hugepd_t hpd)
-{
-	/* We clear the top bit to indicate hugepd */
-	return (hpd_val(hpd) && (hpd_val(hpd) & PD_HUGE) == 0);
-}
-
-#define is_hugepd(hpd)		(hugepd_ok(hpd))
-#endif
-
 int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
 void unmap_kernel_page(unsigned long va);
 
diff --git a/arch/powerpc/include/asm/nohash/pte-e500.h b/arch/powerpc/include/asm/nohash/pte-e500.h
index 6dac1c0a6937..cb78392494da 100644
--- a/arch/powerpc/include/asm/nohash/pte-e500.h
+++ b/arch/powerpc/include/asm/nohash/pte-e500.h
@@ -101,6 +101,39 @@ static inline unsigned long pte_huge_size(pte_t pte)
 }
 #define pte_huge_size pte_huge_size
 
+static inline int pmd_leaf(pmd_t pmd)
+{
+	if (IS_ENABLED(CONFIG_PPC64))
+		return (long)pmd_val(pmd) > 0;
+	else
+		return pmd_val(pmd) & _PAGE_PSIZE_MSK;
+}
+#define pmd_leaf pmd_leaf
+
+static inline unsigned long pmd_leaf_size(pmd_t pmd)
+{
+	return pte_huge_size(__pte(pmd_val(pmd)));
+}
+#define pmd_leaf_size pmd_leaf_size
+
+#ifdef CONFIG_PPC64
+static inline int pud_leaf(pud_t pud)
+{
+	if (IS_ENABLED(CONFIG_PPC64))
+		return (long)pud_val(pud) > 0;
+	else
+		return pud_val(pud) & _PAGE_PSIZE_MSK;
+}
+#define pud_leaf pud_leaf
+
+static inline unsigned long pud_leaf_size(pud_t pud)
+{
+	return pte_huge_size(__pte(pud_val(pud)));
+}
+#define pud_leaf_size pud_leaf_size
+
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index 018c3d55232c..7d3c3bc40e6a 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -269,20 +269,7 @@ static inline const void *pfn_to_kaddr(unsigned long pfn)
 #define is_kernel_addr(x)	((x) >= TASK_SIZE)
 #endif
 
-#ifndef CONFIG_PPC_BOOK3S_64
-/*
- * Use the top bit of the higher-level page table entries to indicate whether
- * the entries we point to contain hugepages.  This works because we know that
- * the page tables live in kernel space.  If we ever decide to support having
- * page tables at arbitrary addresses, this breaks and will have to change.
- */
-#ifdef CONFIG_PPC64
-#define PD_HUGE 0x8000000000000000UL
-#else
-#define PD_HUGE 0x80000000
-#endif
-
-#else	/* CONFIG_PPC_BOOK3S_64 */
+#ifdef CONFIG_PPC_BOOK3S_64
 /*
  * Book3S 64 stores real addresses in the hugepd entries to
  * avoid overlaps with _PAGE_PRESENT and _PAGE_PTE.
diff --git a/arch/powerpc/kernel/head_85xx.S b/arch/powerpc/kernel/head_85xx.S
index 226f88e77d6d..f9a73fae6464 100644
--- a/arch/powerpc/kernel/head_85xx.S
+++ b/arch/powerpc/kernel/head_85xx.S
@@ -311,16 +311,14 @@ set_ivor:
 	rlwinm	r12, r13, 14, 18, 28;	/* Compute pgdir/pmd offset */	\
 	add	r12, r11, r12;						\
 	lwz	r11, 4(r12);		/* Get pgd/pmd entry */		\
+	rlwinm.	r10, r11, 32 - _PAGE_PSIZE_SHIFT, 0x1e; /* get tsize*/	\
+	bne	1000f;			/* Huge page (leaf entry) */	\
 	rlwinm.	r12, r11, 0, 0, 20;	/* Extract pt base address */	\
-	blt	1000f;			/* Normal non-huge page */	\
 	beq	2f;			/* Bail if no table */		\
-	oris	r11, r11, PD_HUGE@h;	/* Put back address bit */	\
-	andi.	r10, r11, HUGEPD_SHIFT_MASK@l; /* extract size field */	\
-	xor	r12, r10, r11;		/* drop size bits from pointer */ \
-	b	1001f;							\
-1000:	rlwimi	r12, r13, 23, 20, 28;	/* Compute pte address */	\
+	rlwimi	r12, r13, 23, 20, 28;	/* Compute pte address */	\
 	li	r10, 0;			/* clear r10 */			\
-1001:	lwz	r11, 4(r12);		/* Get pte entry */
+	lwz	r11, 4(r12);		/* Get pte entry */		\
+1000:
 #else
 #define FIND_PTE	\
 	rlwinm	r12, r13, 14, 18, 28;	/* Compute pgdir/pmd offset */	\
@@ -735,17 +733,12 @@ finish_tlb_load:
 	lwz	r15, 0(r14)
 100:	stw	r15, 0(r17)
 
-	/*
-	 * Calc MAS1_TSIZE from r10 (which has pshift encoded)
-	 * tlb_enc = (pshift - 10).
-	 */
-	subi	r15, r10, 10
 	mfspr	r16, SPRN_MAS1
-	rlwimi	r16, r15, 7, 20, 24
+	rlwimi	r16, r10, MAS1_TSIZE_SHIFT, MAS1_TSIZE_MASK
 	mtspr	SPRN_MAS1, r16
 
 	/* copy the pshift for use later */
-	mr	r14, r10
+	addi	r14, r10, _PAGE_PSIZE_SHIFT_OFFSET
 
 	/* fall through */
 
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 394846197974..9e692d96f9e1 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -625,8 +625,6 @@ static int __init hugetlbpage_init(void)
 		 */
 		if (pdshift > shift) {
 			pgtable_cache_add(pdshift - shift);
-		} else if (IS_ENABLED(CONFIG_PPC_E500)) {
-			pgtable_cache_add(PTE_T_ORDER);
 		}
 
 		configured = true;
diff --git a/arch/powerpc/mm/nohash/tlb_low_64e.S b/arch/powerpc/mm/nohash/tlb_low_64e.S
index a54e7d6c3d0b..de568297d5c5 100644
--- a/arch/powerpc/mm/nohash/tlb_low_64e.S
+++ b/arch/powerpc/mm/nohash/tlb_low_64e.S
@@ -450,11 +450,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_SMT)
 
 tlb_miss_huge_e6500:
 	beq	tlb_miss_fault_e6500
-	li	r10,1
-	andi.	r15,r14,HUGEPD_SHIFT_MASK@l /* r15 = psize */
-	rldimi	r14,r10,63,0		/* Set PD_HUGE */
-	xor	r14,r14,r15		/* Clear size bits */
-	ldx	r14,0,r14
+	rlwinm	r15,r14,32-_PAGE_PSIZE_SHIFT,0x1e
 
 	/*
 	 * Now we build the MAS for a huge page.
@@ -465,7 +461,6 @@ tlb_miss_huge_e6500:
 	 * MAS 2,3+7:	Needs to be redone similar to non-tablewalk handler
 	 */
 
-	subi	r15,r15,10		/* Convert psize to tsize */
 	mfspr	r10,SPRN_MAS1
 	rlwinm	r10,r10,0,~MAS1_IND
 	rlwimi	r10,r15,MAS1_TSIZE_SHIFT,MAS1_TSIZE_MASK
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 294775c793ab..6498454959f3 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -331,6 +331,37 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 		__set_huge_pte_at(pmdp, ptep, pte_val(pte));
 	}
 }
+#elif defined(CONFIG_PPC_E500)
+void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
+		     pte_t pte, unsigned long sz)
+{
+	unsigned long pdsize;
+	int i;
+
+	pte = set_pte_filter(pte, addr);
+
+	/*
+	 * Make sure hardware valid bit is not set. We don't do
+	 * tlb flush for this update.
+	 */
+	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
+
+	if (sz < PMD_SIZE)
+		pdsize = PAGE_SIZE;
+	else if (sz < PUD_SIZE)
+		pdsize = PMD_SIZE;
+	else if (sz < P4D_SIZE)
+		pdsize = PUD_SIZE;
+	else if (sz < PGDIR_SIZE)
+		pdsize = P4D_SIZE;
+	else
+		pdsize = PGDIR_SIZE;
+
+	for (i = 0; i < sz / pdsize; i++, ptep++, addr += pdsize) {
+		__set_pte_at(mm, addr, ptep, pte, 0);
+		pte = __pte(pte_val(pte) + ((unsigned long long)pdsize / PAGE_SIZE << PFN_PTE_SHIFT));
+	}
+}
 #endif
 #endif /* CONFIG_HUGETLB_PAGE */
 
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index fa4bb096b3ae..30a78e99663e 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -291,7 +291,6 @@ config PPC_BOOK3S
 config PPC_E500
 	select FSL_EMB_PERFMON
 	bool
-	select ARCH_HAS_HUGEPD if HUGETLB_PAGE
 	select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
 	select PPC_SMP_MUXED_IPI
 	select PPC_DOORBELL
-- 
2.44.0

