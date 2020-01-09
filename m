Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 988B613544C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 09:29:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tfQx2zKTzDqYW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 19:28:57 +1100 (AEDT)
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
 header.s=mail header.b=Nq8F7nXR; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tfLy5sRhzDqX6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 19:25:30 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47tfLr36m7z9v3XP;
 Thu,  9 Jan 2020 09:25:24 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Nq8F7nXR; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Z8MBrgcOh5Uj; Thu,  9 Jan 2020 09:25:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47tfLr25MZz9v3XM;
 Thu,  9 Jan 2020 09:25:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578558324; bh=nE4jCCEV0mFO5EGzvs+jC8gCuZEjkmVijy51Cnpqu6U=;
 h=From:Subject:To:Cc:Date:From;
 b=Nq8F7nXRBwHQpcG1VdARNWR7ZGIIUzzWTTvO8Gaq8HGc0lPzZXMVZVgbVLYH1nvQD
 zZeSS1+l2klGxAQVV4mzKlRRZF9JnhhNjj6AvHs8jdP9WLzbc0icRwLLKwYHOPJfwP
 3C9oxxC9av7jYaob72saQweAPVuFLFVo9xdJxPY8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 48F708B816;
 Thu,  9 Jan 2020 09:25:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Bud4hGXIMgBa; Thu,  9 Jan 2020 09:25:25 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F07E58B769;
 Thu,  9 Jan 2020 09:25:24 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 09F8663B8D; Thu,  9 Jan 2020 08:25:25 +0000 (UTC)
Message-Id: <7b065c5be35726af4066cab238ee35cabceda1fa.1578558199.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 1/2] powerpc/32: refactor
 pmd_offset(pud_offset(pgd_offset...
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Mike Rapoport <rppt@linux.ibm.com>
Date: Thu,  9 Jan 2020 08:25:25 +0000 (UTC)
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

At several places pmd pointer is retrieved through the same action:

	pmd = pmd_offset(pud_offset(pgd_offset(mm, addr), addr), addr);

or

	pmd = pmd_offset(pud_offset(pgd_offset_k(addr), addr), addr);

Refactor this by implementing two helpers pmd_ptr() and pmd_ptr_k()

This will help when adding the p4d level.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v2: fixed missing arg in mm/mem.c in call to pte_offset_kernel()
v3: no change
---
 arch/powerpc/include/asm/pgtable.h    | 12 ++++++++++++
 arch/powerpc/mm/book3s32/mmu.c        |  2 +-
 arch/powerpc/mm/book3s32/tlb.c        |  4 ++--
 arch/powerpc/mm/kasan/kasan_init_32.c |  8 ++++----
 arch/powerpc/mm/mem.c                 |  3 +--
 arch/powerpc/mm/nohash/40x.c          |  4 ++--
 arch/powerpc/mm/pgtable_32.c          |  2 +-
 7 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 0e4ec8cc37b7..b5e358c0ea7e 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -41,6 +41,18 @@ struct mm_struct;
 
 #ifndef __ASSEMBLY__
 
+#ifdef CONFIG_PPC32
+static inline pmd_t *pmd_ptr(struct mm_struct *mm, unsigned long va)
+{
+	return pmd_offset(pud_offset(pgd_offset(mm, va), va), va);
+}
+
+static inline pmd_t *pmd_ptr_k(unsigned long va)
+{
+	return pmd_offset(pud_offset(pgd_offset_k(va), va), va);
+}
+#endif
+
 #include <asm/tlbflush.h>
 
 /* Keep these as a macros to avoid include dependency mess */
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 69b2419accef..91553e1ff4b9 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -312,7 +312,7 @@ void hash_preload(struct mm_struct *mm, unsigned long ea)
 
 	if (!Hash)
 		return;
-	pmd = pmd_offset(pud_offset(pgd_offset(mm, ea), ea), ea);
+	pmd = pmd_ptr(mm, ea);
 	if (!pmd_none(*pmd))
 		add_hash_page(mm->context.id, ea, pmd_val(*pmd));
 }
diff --git a/arch/powerpc/mm/book3s32/tlb.c b/arch/powerpc/mm/book3s32/tlb.c
index 2fcd321040ff..b08f0ec7f409 100644
--- a/arch/powerpc/mm/book3s32/tlb.c
+++ b/arch/powerpc/mm/book3s32/tlb.c
@@ -87,7 +87,7 @@ static void flush_range(struct mm_struct *mm, unsigned long start,
 	if (start >= end)
 		return;
 	end = (end - 1) | ~PAGE_MASK;
-	pmd = pmd_offset(pud_offset(pgd_offset(mm, start), start), start);
+	pmd = pmd_ptr(mm, start);
 	for (;;) {
 		pmd_end = ((start + PGDIR_SIZE) & PGDIR_MASK) - 1;
 		if (pmd_end > end)
@@ -145,7 +145,7 @@ void flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr)
 		return;
 	}
 	mm = (vmaddr < TASK_SIZE)? vma->vm_mm: &init_mm;
-	pmd = pmd_offset(pud_offset(pgd_offset(mm, vmaddr), vmaddr), vmaddr);
+	pmd = pmd_ptr(mm, vmaddr);
 	if (!pmd_none(*pmd))
 		flush_hash_pages(mm->context.id, vmaddr, pmd_val(*pmd), 1);
 }
diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index 0e6ed4413eea..4b505ff0ff44 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -36,7 +36,7 @@ static int __ref kasan_init_shadow_page_tables(unsigned long k_start, unsigned l
 	unsigned long k_cur, k_next;
 	pgprot_t prot = slab_is_available() ? kasan_prot_ro() : PAGE_KERNEL;
 
-	pmd = pmd_offset(pud_offset(pgd_offset_k(k_start), k_start), k_start);
+	pmd = pmd_ptr_k(k_start);
 
 	for (k_cur = k_start; k_cur != k_end; k_cur = k_next, pmd++) {
 		pte_t *new;
@@ -94,7 +94,7 @@ static int __ref kasan_init_region(void *start, size_t size)
 		block = memblock_alloc(k_end - k_start, PAGE_SIZE);
 
 	for (k_cur = k_start & PAGE_MASK; k_cur < k_end; k_cur += PAGE_SIZE) {
-		pmd_t *pmd = pmd_offset(pud_offset(pgd_offset_k(k_cur), k_cur), k_cur);
+		pmd_t *pmd = pmd_ptr_k(k_cur);
 		void *va = block ? block + k_cur - k_start : kasan_get_one_page();
 		pte_t pte = pfn_pte(PHYS_PFN(__pa(va)), PAGE_KERNEL);
 
@@ -118,7 +118,7 @@ static void __init kasan_remap_early_shadow_ro(void)
 	kasan_populate_pte(kasan_early_shadow_pte, prot);
 
 	for (k_cur = k_start & PAGE_MASK; k_cur < k_end; k_cur += PAGE_SIZE) {
-		pmd_t *pmd = pmd_offset(pud_offset(pgd_offset_k(k_cur), k_cur), k_cur);
+		pmd_t *pmd = pmd_ptr_k(k_cur);
 		pte_t *ptep = pte_offset_kernel(pmd, k_cur);
 
 		if ((pte_val(*ptep) & PTE_RPN_MASK) != pa)
@@ -205,7 +205,7 @@ void __init kasan_early_init(void)
 	unsigned long addr = KASAN_SHADOW_START;
 	unsigned long end = KASAN_SHADOW_END;
 	unsigned long next;
-	pmd_t *pmd = pmd_offset(pud_offset(pgd_offset_k(addr), addr), addr);
+	pmd_t *pmd = pmd_ptr_k(addr);
 
 	BUILD_BUG_ON(KASAN_SHADOW_START & ~PGDIR_MASK);
 
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index f5535eae637f..942d41b88aa6 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -68,8 +68,7 @@ EXPORT_SYMBOL(kmap_prot);
 
 static inline pte_t *virt_to_kpte(unsigned long vaddr)
 {
-	return pte_offset_kernel(pmd_offset(pud_offset(pgd_offset_k(vaddr),
-			vaddr), vaddr), vaddr);
+	return pte_offset_kernel(pmd_ptr_k(vaddr), vaddr);
 }
 #endif
 
diff --git a/arch/powerpc/mm/nohash/40x.c b/arch/powerpc/mm/nohash/40x.c
index f348104eb461..82862723ab42 100644
--- a/arch/powerpc/mm/nohash/40x.c
+++ b/arch/powerpc/mm/nohash/40x.c
@@ -104,7 +104,7 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 		pmd_t *pmdp;
 		unsigned long val = p | _PMD_SIZE_16M | _PAGE_EXEC | _PAGE_HWWRITE;
 
-		pmdp = pmd_offset(pud_offset(pgd_offset_k(v), v), v);
+		pmdp = pmd_ptr_k(v);
 		*pmdp++ = __pmd(val);
 		*pmdp++ = __pmd(val);
 		*pmdp++ = __pmd(val);
@@ -119,7 +119,7 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 		pmd_t *pmdp;
 		unsigned long val = p | _PMD_SIZE_4M | _PAGE_EXEC | _PAGE_HWWRITE;
 
-		pmdp = pmd_offset(pud_offset(pgd_offset_k(v), v), v);
+		pmdp = pmd_ptr_k(v);
 		*pmdp = __pmd(val);
 
 		v += LARGE_PAGE_SIZE_4M;
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 73b84166d06a..7d50cc01bbea 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -63,7 +63,7 @@ int __ref map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot)
 	int err = -ENOMEM;
 
 	/* Use upper 10 bits of VA to index the first level map */
-	pd = pmd_offset(pud_offset(pgd_offset_k(va), va), va);
+	pd = pmd_ptr_k(va);
 	/* Use middle 10 bits of VA to index the second-level map */
 	if (likely(slab_is_available()))
 		pg = pte_alloc_kernel(pd, va);
-- 
2.13.3

