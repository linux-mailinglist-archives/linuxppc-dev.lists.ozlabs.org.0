Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 678AF135445
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 09:27:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tfNr3mQRzDqZD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 19:27:08 +1100 (AEDT)
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
 header.s=mail header.b=QrDDSHXz; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tfLy1wM4zDqX2
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 19:25:30 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47tfLs30h8z9v3XQ;
 Thu,  9 Jan 2020 09:25:25 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=QrDDSHXz; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Fju97S-s3mM8; Thu,  9 Jan 2020 09:25:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47tfLs1z8Vz9v3XM;
 Thu,  9 Jan 2020 09:25:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578558325; bh=Anq1hyH2aL9sk2xmmZjvLgbNttOZtDCALsnDzW0G9vQ=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=QrDDSHXzPUf4RA7kKLqkxQv+PcjlDEH+aqqM2OiAQghychKnsJuIP/CI5KrHwcfTE
 Pio4ScfISdPCQPl7SEAeSyD+JPmm8EiVaOHyQusnnpuAIUoe8LMrcZsk9Aznr/lZdk
 blSPlUNPu7uif3nDAqZtYKITrflsOm8ZrgEDTxnw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 451468B816;
 Thu,  9 Jan 2020 09:25:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id J1S0I2ywjlUg; Thu,  9 Jan 2020 09:25:26 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F2AFE8B769;
 Thu,  9 Jan 2020 09:25:25 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 1327D63B8D; Thu,  9 Jan 2020 08:25:26 +0000 (UTC)
Message-Id: <788378c6c3ba5c5298caab7c7f95e6c3c88244b8.1578558199.git.christophe.leroy@c-s.fr>
In-Reply-To: <7b065c5be35726af4066cab238ee35cabceda1fa.1578558199.git.christophe.leroy@c-s.fr>
References: <7b065c5be35726af4066cab238ee35cabceda1fa.1578558199.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 2/2] powerpc/32: drop get_pteptr()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Mike Rapoport <rppt@linux.ibm.com>
Date: Thu,  9 Jan 2020 08:25:26 +0000 (UTC)
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

Commit 8d30c14cab30 ("powerpc/mm: Rework I$/D$ coherency (v3)") and
commit 90ac19a8b21b ("[POWERPC] Abolish iopa(), mm_ptov(),
io_block_mapping() from arch/powerpc") removed the use of get_pteptr()
outside of mm/pgtable_32.c

In mm/pgtable_32.c, the only user of get_pteptr() is change_page_attr()
which operates on kernel context and on lowmem pages only.

Make virt_to_kpte() available outside of mm/mem.c and use it instead
of get_pteptr(), and drop get_pteptr()

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v3: new
---
 arch/powerpc/include/asm/pgtable.h |  5 +++++
 arch/powerpc/mm/mem.c              |  5 -----
 arch/powerpc/mm/pgtable_32.c       | 39 ++------------------------------------
 3 files changed, 7 insertions(+), 42 deletions(-)

diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index b5e358c0ea7e..25588edc7601 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -51,6 +51,11 @@ static inline pmd_t *pmd_ptr_k(unsigned long va)
 {
 	return pmd_offset(pud_offset(pgd_offset_k(va), va), va);
 }
+
+static inline pte_t *virt_to_kpte(unsigned long vaddr)
+{
+	return pte_offset_kernel(pmd_ptr_k(vaddr), vaddr);
+}
 #endif
 
 #include <asm/tlbflush.h>
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 942d41b88aa6..da6708a46ce9 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -65,11 +65,6 @@ pte_t *kmap_pte;
 EXPORT_SYMBOL(kmap_pte);
 pgprot_t kmap_prot;
 EXPORT_SYMBOL(kmap_prot);
-
-static inline pte_t *virt_to_kpte(unsigned long vaddr)
-{
-	return pte_offset_kernel(pmd_ptr_k(vaddr), vaddr);
-}
 #endif
 
 pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 7d50cc01bbea..4e1e5237c16c 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -121,44 +121,9 @@ void __init mapin_ram(void)
 	}
 }
 
-/* Scan the real Linux page tables and return a PTE pointer for
- * a virtual address in a context.
- * Returns true (1) if PTE was found, zero otherwise.  The pointer to
- * the PTE pointer is unmodified if PTE is not found.
- */
-static int
-get_pteptr(struct mm_struct *mm, unsigned long addr, pte_t **ptep, pmd_t **pmdp)
-{
-        pgd_t	*pgd;
-	pud_t	*pud;
-        pmd_t	*pmd;
-        pte_t	*pte;
-        int     retval = 0;
-
-        pgd = pgd_offset(mm, addr & PAGE_MASK);
-        if (pgd) {
-		pud = pud_offset(pgd, addr & PAGE_MASK);
-		if (pud && pud_present(*pud)) {
-			pmd = pmd_offset(pud, addr & PAGE_MASK);
-			if (pmd_present(*pmd)) {
-				pte = pte_offset_map(pmd, addr & PAGE_MASK);
-				if (pte) {
-					retval = 1;
-					*ptep = pte;
-					if (pmdp)
-						*pmdp = pmd;
-					/* XXX caller needs to do pte_unmap, yuck */
-				}
-			}
-		}
-        }
-        return(retval);
-}
-
 static int __change_page_attr_noflush(struct page *page, pgprot_t prot)
 {
 	pte_t *kpte;
-	pmd_t *kpmd;
 	unsigned long address;
 
 	BUG_ON(PageHighMem(page));
@@ -166,10 +131,10 @@ static int __change_page_attr_noflush(struct page *page, pgprot_t prot)
 
 	if (v_block_mapped(address))
 		return 0;
-	if (!get_pteptr(&init_mm, address, &kpte, &kpmd))
+	kpte = virt_to_kpte(address);
+	if (!kpte)
 		return -EINVAL;
 	__set_pte_at(&init_mm, address, kpte, mk_pte(page, prot), 0);
-	pte_unmap(kpte);
 
 	return 0;
 }
-- 
2.13.3

