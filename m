Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D0D2958A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 08:55:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGymw5q9xzDqlD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 17:55:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGyBw0kP3zDqLR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 17:29:44 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CGyBr1mFrz9vCxg;
 Thu, 22 Oct 2020 08:29:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SW-tFubHQOup; Thu, 22 Oct 2020 08:29:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CGyBr10WQz9vBKl;
 Thu, 22 Oct 2020 08:29:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 17EF38B806;
 Thu, 22 Oct 2020 08:29:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WW8AyKCvhhi4; Thu, 22 Oct 2020 08:29:41 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D68E18B805;
 Thu, 22 Oct 2020 08:29:40 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BAC8F667EF; Thu, 22 Oct 2020 06:29:40 +0000 (UTC)
Message-Id: <9af895be7d4b404d40e749a2659552fd138e62c4.1603348103.git.christophe.leroy@csgroup.eu>
In-Reply-To: <648e2448e938d52d0b5887445e018ca584edc06d.1603348103.git.christophe.leroy@csgroup.eu>
References: <648e2448e938d52d0b5887445e018ca584edc06d.1603348103.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 15/20] powerpc/32s: Inline flush_hash_entry()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 22 Oct 2020 06:29:40 +0000 (UTC)
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

flush_hash_entry() is a simple function calling
flush_hash_pages() if it's a hash MMU or doing nothing otherwise.

Inline it.

And use it also in __ptep_test_and_clear_young().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h | 17 +++++++++++------
 arch/powerpc/include/asm/tlb.h               |  3 ---
 arch/powerpc/mm/book3s32/tlb.c               | 14 --------------
 3 files changed, 11 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 36443cda8dcf..914c19959a84 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -238,8 +238,14 @@ extern void add_hash_page(unsigned context, unsigned long va,
 			  unsigned long pmdval);
 
 /* Flush an entry from the TLB/hash table */
-extern void flush_hash_entry(struct mm_struct *mm, pte_t *ptep,
-			     unsigned long address);
+static inline void flush_hash_entry(struct mm_struct *mm, pte_t *ptep, unsigned long addr)
+{
+	if (mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
+		unsigned long ptephys = __pa(ptep) & PAGE_MASK;
+
+		flush_hash_pages(mm->context.id, addr, ptephys, 1);
+	}
+}
 
 /*
  * PTE updates. This function is called whenever an existing
@@ -291,10 +297,9 @@ static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
 {
 	unsigned long old;
 	old = pte_update(mm, addr, ptep, _PAGE_ACCESSED, 0, 0);
-	if (old & _PAGE_HASHPTE) {
-		unsigned long ptephys = __pa(ptep) & PAGE_MASK;
-		flush_hash_pages(mm->context.id, addr, ptephys, 1);
-	}
+	if (old & _PAGE_HASHPTE)
+		flush_hash_entry(mm, ptep, addr);
+
 	return (old & _PAGE_ACCESSED) != 0;
 }
 #define ptep_test_and_clear_young(__vma, __addr, __ptep) \
diff --git a/arch/powerpc/include/asm/tlb.h b/arch/powerpc/include/asm/tlb.h
index d97f061fecac..160422a439aa 100644
--- a/arch/powerpc/include/asm/tlb.h
+++ b/arch/powerpc/include/asm/tlb.h
@@ -40,9 +40,6 @@ extern void tlb_flush(struct mmu_gather *tlb);
 /* Get the generic bits... */
 #include <asm-generic/tlb.h>
 
-extern void flush_hash_entry(struct mm_struct *mm, pte_t *ptep,
-			     unsigned long address);
-
 static inline void __tlb_remove_tlb_entry(struct mmu_gather *tlb, pte_t *ptep,
 					  unsigned long address)
 {
diff --git a/arch/powerpc/mm/book3s32/tlb.c b/arch/powerpc/mm/book3s32/tlb.c
index e7865a3f0231..0d412953fe58 100644
--- a/arch/powerpc/mm/book3s32/tlb.c
+++ b/arch/powerpc/mm/book3s32/tlb.c
@@ -29,20 +29,6 @@
 
 #include <mm/mmu_decl.h>
 
-/*
- * Called when unmapping pages to flush entries from the TLB/hash table.
- */
-void flush_hash_entry(struct mm_struct *mm, pte_t *ptep, unsigned long addr)
-{
-	unsigned long ptephys;
-
-	if (mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
-		ptephys = __pa(ptep) & PAGE_MASK;
-		flush_hash_pages(mm->context.id, addr, ptephys, 1);
-	}
-}
-EXPORT_SYMBOL(flush_hash_entry);
-
 /*
  * TLB flushing:
  *
-- 
2.25.0

