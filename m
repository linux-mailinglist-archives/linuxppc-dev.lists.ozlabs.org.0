Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8458C8C83
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 21:04:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgxGx3QYbz3vZ5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2024 05:04:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgxCL3vX1z3cY5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2024 05:01:50 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Vgx9d2428z9t5L;
	Fri, 17 May 2024 21:00:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mWeTTsHZkkjL; Fri, 17 May 2024 21:00:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Vgx9S5sNmz9syj;
	Fri, 17 May 2024 21:00:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C4A228B783;
	Fri, 17 May 2024 21:00:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 8B8DJwRLl7uO; Fri, 17 May 2024 21:00:12 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.121])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 25E7A8B775;
	Fri, 17 May 2024 21:00:12 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [RFC PATCH v2 17/20] powerpc/e500: Use contiguous PMD instead of hugepd
Date: Fri, 17 May 2024 21:00:11 +0200
Message-ID: <76350da4b58fd53c23ba43ac0b33f560e3a337a8.1715971869.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1715971869.git.christophe.leroy@csgroup.eu>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715972397; l=15260; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=WXeqQC9hcrodr1yicWyKuH+hir90sygauO+aVlz8tZc=; b=W7i4MI1n5Cw0bJ60G02xRk8Fptox0RmMJKb3H/Lt1HjTN3lvSyJez19mPPxsP3K/Ikcn9hDrO XQpn/zvFzLLBBhfjNDoijHN+gfllhIllnyQsSz6dh0OpYOuyGDFxopX
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

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 .../powerpc/include/asm/nohash/hugetlb-e500.h | 32 +---------
 arch/powerpc/include/asm/nohash/pgalloc.h     |  2 -
 arch/powerpc/include/asm/nohash/pgtable.h     | 43 +++++++++----
 arch/powerpc/include/asm/nohash/pte-e500.h    | 15 +++++
 arch/powerpc/include/asm/page.h               | 15 +----
 arch/powerpc/kernel/head_85xx.S               | 23 +++----
 arch/powerpc/mm/hugetlbpage.c                 |  2 -
 arch/powerpc/mm/nohash/tlb_low_64e.S          | 63 +++++++++++--------
 arch/powerpc/mm/pgtable.c                     | 31 +++++++++
 arch/powerpc/platforms/Kconfig.cputype        |  1 -
 10 files changed, 131 insertions(+), 96 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/hugetlb-e500.h b/arch/powerpc/include/asm/nohash/hugetlb-e500.h
index d8e51a3f8557..d30e2a3f129d 100644
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
index c4be7754e96f..28ecb2c8b433 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -52,11 +52,36 @@ static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, p
 {
 	pte_basic_t old = pte_val(*p);
 	pte_basic_t new = (old & ~(pte_basic_t)clr) | set;
+	unsigned long sz;
+	unsigned long pdsize;
+	int i;
 
 	if (new == old)
 		return old;
 
-	*p = __pte(new);
+#ifdef CONFIG_PPC_E500
+	if (huge)
+		sz = 1UL << (((old & _PAGE_HSIZE_MSK) >> _PAGE_HSIZE_SHIFT) + 20);
+	else
+#endif
+		sz = PAGE_SIZE;
+
+	if (!huge || sz < PMD_SIZE)
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
@@ -340,25 +365,19 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 
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
 #ifdef CONFIG_HUGETLB_PAGE
 static inline int pmd_huge(pmd_t pmd)
 {
+#ifdef pmd_leaf
+	return pmd_leaf(pmd);
+#else
 	return 0;
+#endif
 }
 
 static inline int pud_huge(pud_t pud)
 {
-	return 0;
+	return pud_leaf(pud);
 }
 #endif
 
diff --git a/arch/powerpc/include/asm/nohash/pte-e500.h b/arch/powerpc/include/asm/nohash/pte-e500.h
index 091e4bff1fba..178378cdaabb 100644
--- a/arch/powerpc/include/asm/nohash/pte-e500.h
+++ b/arch/powerpc/include/asm/nohash/pte-e500.h
@@ -67,6 +67,7 @@
 #define _PAGE_RWX	(_PAGE_READ | _PAGE_WRITE | _PAGE_BAP_UX)
 
 #define _PAGE_SPECIAL	_PAGE_SW0
+#define _PAGE_PTE	_PAGE_PSIZE_4K
 
 #define	PTE_RPN_SHIFT	(24)
 
@@ -106,6 +107,20 @@ static inline pte_t pte_mkexec(pte_t pte)
 }
 #define pte_mkexec pte_mkexec
 
+static inline int pmd_leaf(pmd_t pmd)
+{
+	return pmd_val(pmd) & _PAGE_PTE;
+}
+#define pmd_leaf pmd_leaf
+
+#ifdef CONFIG_PPC64
+static inline int pud_leaf(pud_t pud)
+{
+	return pud_val(pud) & _PAGE_PTE;
+}
+#define pud_leaf pud_leaf
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
index a305244afc9f..96479a2230ac 100644
--- a/arch/powerpc/kernel/head_85xx.S
+++ b/arch/powerpc/kernel/head_85xx.S
@@ -310,16 +310,17 @@ set_ivor:
 	rlwinm	r12, r10, 14, 18, 28;	/* Compute pgdir/pmd offset */	\
 	add	r12, r11, r12;						\
 	lwz	r11, 4(r12);		/* Get pgd/pmd entry */		\
-	rlwinm.	r12, r11, 0, 0, 20;	/* Extract pt base address */	\
-	blt	1000f;			/* Normal non-huge page */	\
-	beq	2f;			/* Bail if no table */		\
-	oris	r11, r11, PD_HUGE@h;	/* Put back address bit */	\
-	andi.	r10, r11, HUGEPD_SHIFT_MASK@l; /* extract size field */	\
-	xor	r12, r10, r11;		/* drop size bits from pointer */ \
+	rotlwi.	r11, r11, 22;		/* Leaf entry (_PAGE_PTE set) */\
+	bge	1000f;			/* Normal non-huge page */	\
+	rlwinm	r10, r11, 64 - _PAGE_HSIZE_SHIFT - 22, 0xf;		\
+	rotrwi	r11, r11, 22;		/* Restore entry */		\
 	b	1001f;							\
-1000:	rlwimi	r12, r10, 23, 20, 28;	/* Compute pte address */	\
+1000:	rlwinm.	r12, r11, 32 - 22, 0, 20; /* Extract pt base address */	\
+	beq	2f;			/* Bail if no table */		\
+	rlwimi	r12, r10, 23, 20, 28;	/* Compute pte address */	\
 	li	r10, 0;			/* clear r10 */			\
-1001:	lwz	r11, 4(r12);		/* Get pte entry */
+	lwz	r11, 4(r12);		/* Get pte entry */		\
+1001:
 #else
 #define FIND_PTE	\
 	rlwinm	r12, r10, 14, 18, 28;	/* Compute pgdir/pmd offset */	\
@@ -749,16 +750,16 @@ finish_tlb_load:
 100:	stw	r15, 0(r17)
 
 	/*
-	 * Calc MAS1_TSIZE from r10 (which has pshift encoded)
+	 * Calc MAS1_TSIZE from r10 (which has pshift - 20 encoded)
 	 * tlb_enc = (pshift - 10).
 	 */
-	subi	r15, r10, 10
+	addi	r15, r10, 10
 	mfspr	r16, SPRN_MAS1
 	rlwimi	r16, r15, 7, 20, 24
 	mtspr	SPRN_MAS1, r16
 
 	/* copy the pshift for use later */
-	mr	r14, r10
+	addi	r14, r10, 20
 
 	/* fall through */
 
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index f8aefa1e7363..1401587578fc 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -627,8 +627,6 @@ static int __init hugetlbpage_init(void)
 		if (pdshift > shift) {
 			if (!IS_ENABLED(CONFIG_PPC_8xx))
 				pgtable_cache_add(pdshift - shift);
-		} else if (IS_ENABLED(CONFIG_PPC_E500)) {
-			pgtable_cache_add(PTE_T_ORDER);
 		}
 
 		configured = true;
diff --git a/arch/powerpc/mm/nohash/tlb_low_64e.S b/arch/powerpc/mm/nohash/tlb_low_64e.S
index 93ecb8ec82b0..3e4d23a562c3 100644
--- a/arch/powerpc/mm/nohash/tlb_low_64e.S
+++ b/arch/powerpc/mm/nohash/tlb_low_64e.S
@@ -152,20 +152,26 @@ tlb_miss_common_bolted:
 
 	rldicl	r15,r16,64-PUD_SHIFT+3,64-PUD_INDEX_SIZE-3
 	clrrdi	r15,r15,3
-	cmpdi	cr0,r14,0
-	bge	tlb_miss_fault_bolted	/* Bad pgd entry or hugepage; bail */
+	cmpdi	cr3,r14,0
+	andi.	r10,r14,_PAGE_PTE
+	beq-	cr3,tlb_miss_fault_bolted /* No entry, bail */
+	bne	tlb_miss_fault_bolted	/* Hugepage; bail */
 	ldx	r14,r14,r15		/* grab pud entry */
 
 	rldicl	r15,r16,64-PMD_SHIFT+3,64-PMD_INDEX_SIZE-3
 	clrrdi	r15,r15,3
-	cmpdi	cr0,r14,0
-	bge	tlb_miss_fault_bolted
+	cmpdi	cr3,r14,0
+	andi.	r10,r14,_PAGE_PTE
+	beq-	cr3,tlb_miss_fault_bolted /* No entry, bail */
+	bne	tlb_miss_fault_bolted	/* Hugepage; bail */
 	ldx	r14,r14,r15		/* Grab pmd entry */
 
 	rldicl	r15,r16,64-PAGE_SHIFT+3,64-PTE_INDEX_SIZE-3
 	clrrdi	r15,r15,3
-	cmpdi	cr0,r14,0
-	bge	tlb_miss_fault_bolted
+	cmpdi	cr3,r14,0
+	andi.	r10,r14,_PAGE_PTE
+	beq-	cr3,tlb_miss_fault_bolted /* No entry, bail */
+	bne	tlb_miss_fault_bolted	/* Hugepage; bail */
 	ldx	r14,r14,r15		/* Grab PTE, normal (!huge) page */
 
 	/* Check if required permissions are met */
@@ -390,19 +396,25 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_SMT)
 
 	rldicl	r15,r16,64-PUD_SHIFT+3,64-PUD_INDEX_SIZE-3
 	clrrdi	r15,r15,3
-	cmpdi	cr0,r14,0
-	bge	tlb_miss_huge_e6500	/* Bad pgd entry or hugepage; bail */
+	cmpdi	cr3,r14,0
+	andi.	r10,r14,_PAGE_PTE
+	beq-	cr3,tlb_miss_fault_e6500 /* No entry, bail */
+	bne	tlb_miss_huge_e6500	/* Hugepage; bail */
 	ldx	r14,r14,r15		/* grab pud entry */
 
 	rldicl	r15,r16,64-PMD_SHIFT+3,64-PMD_INDEX_SIZE-3
 	clrrdi	r15,r15,3
-	cmpdi	cr0,r14,0
-	bge	tlb_miss_huge_e6500
+	cmpdi	cr3,r14,0
+	andi.	r10,r14,_PAGE_PTE
+	beq-	cr3,tlb_miss_fault_e6500 /* No entry, bail */
+	bne	tlb_miss_huge_e6500	/* Hugepage; bail */
 	ldx	r14,r14,r15		/* Grab pmd entry */
 
 	mfspr	r10,SPRN_MAS0
-	cmpdi	cr0,r14,0
-	bge	tlb_miss_huge_e6500
+	cmpdi	cr3,r14,0
+	andi.	r15,r14,_PAGE_PTE
+	beq-	cr3,tlb_miss_fault_e6500 /* No entry, bail */
+	bne	tlb_miss_huge_e6500	/* Hugepage; bail */
 
 	/* Now we build the MAS for a 2M indirect page:
 	 *
@@ -449,12 +461,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_SMT)
 	rfi
 
 tlb_miss_huge_e6500:
-	beq	tlb_miss_fault_e6500
-	li	r10,1
-	andi.	r15,r14,HUGEPD_SHIFT_MASK@l /* r15 = psize */
-	rldimi	r14,r10,63,0		/* Set PD_HUGE */
-	xor	r14,r14,r15		/* Clear size bits */
-	ldx	r14,0,r14
+	rlwinm	r15,r14,32-_PAGE_HSIZE_SHIFT,0xf
 
 	/*
 	 * Now we build the MAS for a huge page.
@@ -465,7 +472,7 @@ tlb_miss_huge_e6500:
 	 * MAS 2,3+7:	Needs to be redone similar to non-tablewalk handler
 	 */
 
-	subi	r15,r15,10		/* Convert psize to tsize */
+	addi	r15,r15,10		/* Convert hsize to tsize */
 	mfspr	r10,SPRN_MAS1
 	rlwinm	r10,r10,0,~MAS1_IND
 	rlwimi	r10,r15,MAS1_TSIZE_SHIFT,MAS1_TSIZE_MASK
@@ -805,22 +812,28 @@ virt_page_table_tlb_miss:
 	rldicl	r11,r16,64-VPTE_PGD_SHIFT,64-PGD_INDEX_SIZE-3
 	clrrdi	r10,r11,3
 	ldx	r15,r10,r15
-	cmpdi	cr0,r15,0
-	bge	virt_page_table_tlb_miss_fault
+	cmpdi	cr3,r15,0
+	andi.	r10,r15,_PAGE_PTE
+	beq-	cr3,virt_page_table_tlb_miss_fault /* No entry, bail */
+	bne	virt_page_table_tlb_miss_fault	/* Hugepage; bail */
 
 	/* Get to PUD entry */
 	rldicl	r11,r16,64-VPTE_PUD_SHIFT,64-PUD_INDEX_SIZE-3
 	clrrdi	r10,r11,3
 	ldx	r15,r10,r15
-	cmpdi	cr0,r15,0
-	bge	virt_page_table_tlb_miss_fault
+	cmpdi	cr3,r15,0
+	andi.	r10,r15,_PAGE_PTE
+	beq-	cr3,virt_page_table_tlb_miss_fault /* No entry, bail */
+	bne	virt_page_table_tlb_miss_fault	/* Hugepage; bail */
 
 	/* Get to PMD entry */
 	rldicl	r11,r16,64-VPTE_PMD_SHIFT,64-PMD_INDEX_SIZE-3
 	clrrdi	r10,r11,3
 	ldx	r15,r10,r15
-	cmpdi	cr0,r15,0
-	bge	virt_page_table_tlb_miss_fault
+	cmpdi	cr3,r15,0
+	andi.	r10,r15,_PAGE_PTE
+	beq-	cr3,virt_page_table_tlb_miss_fault /* No entry, bail */
+	bne	virt_page_table_tlb_miss_fault	/* Hugepage; bail */
 
 	/* Ok, we're all right, we can now create a kernel translation for
 	 * a 4K or 64K page from r16 -> r15.
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 51ee508eeb5b..d68c0fcffe80 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -328,6 +328,37 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
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

