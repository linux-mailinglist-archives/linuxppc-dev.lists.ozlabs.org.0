Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FDA186CF7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 15:24:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gz8B6jB2zDqHl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 01:24:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=JwFU1Z8J; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gwlN1c3kzDqM6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 23:36:16 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48gwlD1krgz9v02n;
 Mon, 16 Mar 2020 13:36:08 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=JwFU1Z8J; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NeLv6IG39YVK; Mon, 16 Mar 2020 13:36:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48gwlD0h4Gz9v02f;
 Mon, 16 Mar 2020 13:36:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584362168; bh=6XFN14Dxk+YjXDnc+NfTUq5zCiRTtA+7KIry6zkAP3Y=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=JwFU1Z8JZccTDBuC9MF/kKxr97yqat7HymJAff616QKo0seH+0uCf1DZ21HYC12GW
 QSnNn2sxnX3FFwDXkpVkHMkdBB7D9VX4n6MXleIB6r9sMJWMANwiJZvIqFY2+PAZK0
 oHAF1ezgvYEX/O5/Dh+s+j7Af7S5s59IIST04JD4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 108B58B7D0;
 Mon, 16 Mar 2020 13:36:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vvg8XL8Kd93g; Mon, 16 Mar 2020 13:36:12 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DC6338B7CB;
 Mon, 16 Mar 2020 13:36:12 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id CDCAA65595; Mon, 16 Mar 2020 12:36:12 +0000 (UTC)
Message-Id: <1cd246cb84c0799f145477088c08f7b4ee539393.1584360344.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1584360343.git.christophe.leroy@c-s.fr>
References: <cover.1584360343.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 27/46] powerpc/8xx: Manage 512k huge pages as standard
 pages.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 16 Mar 2020 12:36:12 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At the time being, 512k huge pages are handled through hugepd page
tables. The PMD entry is flagged as a hugepd pointer and it
means that only 512k hugepages can be managed in that 4M block.
However, the hugepd table has the same size as a normal page
table, and 512k entries can therefore be nested with normal pages.

On the 8xx, TLB loading is performed by software and allthough the
page tables are organised to match the L1 and L2 level defined by
the HW, all TLB entries have both L1 and L2 independent entries.
It means that even if two TLB entries are associated with the same
PMD entry, they can be loaded with different values in L1 part.

The L1 entry contains the page size (PS field):
- 00 for 4k and 16 pages
- 01 for 512k pages
- 11 for 8M pages

By adding a flag for hugepages in the PTE (_PAGE_HUGE) and copying it
into the lower bit of PS, we can then manage 512k pages with normal
page tables:
- PMD entry has PS=11 for 8M pages
- PMD entry has PS=00 for other pages.

As a PMD entry covers 4M areas, a PMD will either point to a hugepd
table having a single entry to an 8M page, or the PMD will point to
a standard page table which will have either entries to 4k or 16k or
512k pages. For 512k pages, as the L1 entry will not know it is a
512k page before the PTE is read, there will be 128 entries in the
PTE as if it was 4k pages. But when loading the TLB, it will be
flagged as a 512k page.

Note that we can't use pmd_ptr() in asm/nohash/32/pgtable.h because
it is not defined yet.

In ITLB miss, we keep the possibility to opt it out as when kernel
text is pinned and no user hugepages are used, we can save several
instruction by not using r11.

In DTLB miss, that's just one instruction so it's not worth bothering
with it.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/nohash/32/pgtable.h | 10 ++++++---
 arch/powerpc/include/asm/nohash/32/pte-8xx.h |  4 +++-
 arch/powerpc/include/asm/nohash/pgtable.h    |  2 +-
 arch/powerpc/kernel/head_8xx.S               | 12 +++++------
 arch/powerpc/mm/hugetlbpage.c                | 22 +++++++++++++++++---
 arch/powerpc/mm/pgtable.c                    | 10 ++++++++-
 6 files changed, 44 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 1a86d20b58f3..1504af38a9a8 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -229,8 +229,9 @@ static inline void pmd_clear(pmd_t *pmdp)
  * those implementations.
  *
  * On the 8xx, the page tables are a bit special. For 16k pages, we have
- * 4 identical entries. For other page sizes, we have a single entry in the
- * table.
+ * 4 identical entries. For 512k pages, we have 128 entries as if it was
+ * 4k pages, but they are flagged as 512k pages for the hardware.
+ * For other page sizes, we have a single entry in the table.
  */
 #ifdef CONFIG_PPC_8xx
 static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, pte_t *p,
@@ -240,13 +241,16 @@ static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, p
 	pte_basic_t old = pte_val(*p);
 	pte_basic_t new = (old & ~(pte_basic_t)clr) | set;
 	int num, i;
+	pmd_t *pmd = pmd_offset(pud_offset(pgd_offset(mm, addr), addr), addr);
 
 	if (!huge)
 		num = PAGE_SIZE / SZ_4K;
+	else if ((pmd_val(*pmd) & _PMD_PAGE_MASK) != _PMD_PAGE_8M)
+		num = SZ_512K / SZ_4K;
 	else
 		num = 1;
 
-	for (i = 0; i < num; i++, entry++)
+	for (i = 0; i < num; i++, entry++, new += SZ_4K)
 		*entry = new;
 
 	return old;
diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
index c9e4b2d90f65..66f403a7da44 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -46,6 +46,8 @@
 #define _PAGE_NA	0x0200	/* Supervisor NA, User no access */
 #define _PAGE_RO	0x0600	/* Supervisor RO, User no access */
 
+#define _PAGE_HUGE	0x0800	/* Copied to L1 PS bit 29 */
+
 /* cache related flags non existing on 8xx */
 #define _PAGE_COHERENT	0
 #define _PAGE_WRITETHRU	0
@@ -128,7 +130,7 @@ static inline pte_t pte_mkuser(pte_t pte)
 
 static inline pte_t pte_mkhuge(pte_t pte)
 {
-	return __pte(pte_val(pte) | _PAGE_SPS);
+	return __pte(pte_val(pte) | _PAGE_SPS | _PAGE_HUGE);
 }
 
 #define pte_mkhuge pte_mkhuge
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 7fed9dc0f147..f27c967d9269 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -267,7 +267,7 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 static inline int hugepd_ok(hugepd_t hpd)
 {
 #ifdef CONFIG_PPC_8xx
-	return ((hpd_val(hpd) & 0x4) != 0);
+	return ((hpd_val(hpd) & _PMD_PAGE_MASK) == _PMD_PAGE_8M);
 #else
 	/* We clear the top bit to indicate hugepd */
 	return (hpd_val(hpd) && (hpd_val(hpd) & PD_HUGE) == 0);
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index adad8baadcf5..423465b10c82 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -239,7 +239,6 @@ InstructionTLBMiss:
 #endif
 #ifdef CONFIG_HUGETLBFS
 	lwz	r11, (swapper_pg_dir-PAGE_OFFSET)@l(r10)	/* Get level 1 entry */
-	mtspr	SPRN_MI_TWC, r11	/* Set segment attributes */
 	mtspr	SPRN_MD_TWC, r11
 #else
 	lwz	r10, (swapper_pg_dir-PAGE_OFFSET)@l(r10)	/* Get level 1 entry */
@@ -248,6 +247,10 @@ InstructionTLBMiss:
 #endif
 	mfspr	r10, SPRN_MD_TWC
 	lwz	r10, 0(r10)	/* Get the pte */
+#ifdef CONFIG_HUGETLBFS
+	rlwimi	r11, r10, 32 - 9, _PMD_PAGE_512K
+	mtspr	SPRN_MI_TWC, r11
+#endif
 #ifdef CONFIG_SWAP
 	rlwinm	r11, r10, 32-5, _PAGE_PRESENT
 	and	r11, r11, r10
@@ -353,6 +356,7 @@ DataStoreTLBMiss:
 	 * above.
 	 */
 	rlwimi	r11, r10, 0, _PAGE_GUARDED
+	rlwimi	r11, r10, 32 - 9, _PMD_PAGE_512K
 	mtspr	SPRN_MD_TWC, r11
 
 	/* Both _PAGE_ACCESSED and _PAGE_PRESENT has to be set.
@@ -584,7 +588,6 @@ FixupDAR:/* Entry point for dcbx workaround. */
 	mfspr	r11, SPRN_MD_TWC
 	lwz	r11, 0(r11)	/* Get the pte */
 	bt	28,200f		/* bit 28 = Large page (8M) */
-	bt	29,202f		/* bit 29 = Large page (8M or 512K) */
 	/* concat physical page address(r11) and page offset(r10) */
 	rlwimi	r11, r10, 0, 32 - PAGE_SHIFT, 31
 201:	lwz	r11,0(r11)
@@ -611,11 +614,6 @@ FixupDAR:/* Entry point for dcbx workaround. */
 	rlwimi	r11, r10, 0, 32 - PAGE_SHIFT_8M, 31
 	b	201b
 
-202:
-	/* concat physical page address(r11) and page offset(r10) */
-	rlwimi	r11, r10, 0, 32 - PAGE_SHIFT_512K, 31
-	b	201b
-
 144:	mfspr	r10, SPRN_DSISR
 	rlwinm	r10, r10,0,7,5	/* Clear store bit for buggy dcbst insn */
 	mtspr	SPRN_DSISR, r10
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index edf511c2a30a..35eb29584b54 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -189,6 +189,9 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, unsigned long addr, unsigned long sz
 	if (!hpdp)
 		return NULL;
 
+	if (IS_ENABLED(CONFIG_PPC_8xx) && sz == SZ_512K)
+		return pte_alloc_map(mm, (pmd_t *)hpdp, addr);
+
 	BUG_ON(!hugepd_none(*hpdp) && !hugepd_ok(*hpdp));
 
 	if (hugepd_none(*hpdp) && __hugepte_alloc(mm, hpdp, addr,
@@ -331,13 +334,20 @@ static void free_hugepd_range(struct mmu_gather *tlb, hugepd_t *hpdp, int pdshif
 
 	if (shift >= pdshift)
 		hugepd_free(tlb, hugepte);
-	else if (IS_ENABLED(CONFIG_PPC_8xx))
-		pgtable_free_tlb(tlb, hugepte, 0);
 	else
 		pgtable_free_tlb(tlb, hugepte,
 				 get_hugepd_cache_index(pdshift - shift));
 }
 
+static void hugetlb_free_pte_range(struct mmu_gather *tlb, pmd_t *pmd, unsigned long addr)
+{
+	pgtable_t token = pmd_pgtable(*pmd);
+
+	pmd_clear(pmd);
+	pte_free_tlb(tlb, token, addr);
+	mm_dec_nr_ptes(tlb->mm);
+}
+
 static void hugetlb_free_pmd_range(struct mmu_gather *tlb, pud_t *pud,
 				   unsigned long addr, unsigned long end,
 				   unsigned long floor, unsigned long ceiling)
@@ -353,11 +363,17 @@ static void hugetlb_free_pmd_range(struct mmu_gather *tlb, pud_t *pud,
 		pmd = pmd_offset(pud, addr);
 		next = pmd_addr_end(addr, end);
 		if (!is_hugepd(__hugepd(pmd_val(*pmd)))) {
+			if (pmd_none_or_clear_bad(pmd))
+				continue;
+
 			/*
 			 * if it is not hugepd pointer, we should already find
 			 * it cleared.
 			 */
-			WARN_ON(!pmd_none_or_clear_bad(pmd));
+			WARN_ON(!IS_ENABLED(CONFIG_PPC_8xx));
+
+			hugetlb_free_pte_range(tlb, pmd, addr);
+
 			continue;
 		}
 		/*
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 214a5f4beb6c..60c4b8ff046c 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -264,6 +264,12 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 #if defined(CONFIG_PPC_8xx)
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_t pte)
 {
+	pmd_t *pmd = pmd_ptr(mm, addr);
+	pte_basic_t val;
+	pte_basic_t *entry = &ptep->pte;
+	int num = is_hugepd(*((hugepd_t *)pmd)) ? 1 : SZ_512K / SZ_4K;
+	int i;
+
 	/*
 	 * Make sure hardware valid bit is not set. We don't do
 	 * tlb flush for this update.
@@ -274,7 +280,9 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_
 
 	pte = set_pte_filter(pte);
 
-	ptep->pte = pte_val(pte);
+	val = pte_val(pte);
+	for (i = 0; i < num; i++, entry++, val += SZ_4K)
+		*entry = val;
 }
 #endif
 #endif /* CONFIG_HUGETLB_PAGE */
-- 
2.25.0

