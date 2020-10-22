Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECCC29588D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 08:48:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGyct5kySzDqtQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 17:48:46 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGyBr1shwzDqJM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 17:29:40 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CGyBm2dZhz9vBL1;
 Thu, 22 Oct 2020 08:29:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id RhAmTarHPtHO; Thu, 22 Oct 2020 08:29:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CGyBm1qMhz9vBKl;
 Thu, 22 Oct 2020 08:29:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3774F8B769;
 Thu, 22 Oct 2020 08:29:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DkbfXBubTpp5; Thu, 22 Oct 2020 08:29:37 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B8B0A8B805;
 Thu, 22 Oct 2020 08:29:36 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9DFC4667EF; Thu, 22 Oct 2020 06:29:36 +0000 (UTC)
Message-Id: <11e932ded41ba6d9b251d89b7afa33cc060d3aa4.1603348103.git.christophe.leroy@csgroup.eu>
In-Reply-To: <648e2448e938d52d0b5887445e018ca584edc06d.1603348103.git.christophe.leroy@csgroup.eu>
References: <648e2448e938d52d0b5887445e018ca584edc06d.1603348103.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 11/20] powerpc/32s: Split and inline flush_tlb_mm() and
 flush_tlb_page()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 22 Oct 2020 06:29:36 +0000 (UTC)
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

flush_tlb_mm() and flush_tlb_page() handle both the MMU_FTR_HPTE_TABLE
case and the other case.

The non MMU_FTR_HPTE_TABLE case is trivial as it is only a call
to _tlbie()/_tlbia() which is not worth a dedicated function.

Make flush_tlb_mm() and flush_tlb_page() hash specific and call
them from tlbflush.h based on mmu_has_feature(MMU_FTR_HPTE_TABLE).

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/tlbflush.h | 20 +++++++++++++++++--
 arch/powerpc/mm/book3s32/tlb.c                | 17 ++++------------
 2 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/tlbflush.h b/arch/powerpc/include/asm/book3s/32/tlbflush.h
index f392a619138d..542765944531 100644
--- a/arch/powerpc/include/asm/book3s/32/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/32/tlbflush.h
@@ -6,8 +6,8 @@
 /*
  * TLB flushing for "classic" hash-MMU 32-bit CPUs, 6xx, 7xx, 7xxx
  */
-extern void flush_tlb_mm(struct mm_struct *mm);
-extern void flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
+void hash__flush_tlb_mm(struct mm_struct *mm);
+void hash__flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
 extern void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			    unsigned long end);
 extern void flush_tlb_kernel_range(unsigned long start, unsigned long end);
@@ -22,6 +22,22 @@ static inline void _tlbie(unsigned long address)
 #endif
 void _tlbia(void);
 
+static inline void flush_tlb_mm(struct mm_struct *mm)
+{
+	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
+		hash__flush_tlb_mm(mm);
+	else
+		_tlbia();
+}
+
+static inline void flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr)
+{
+	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
+		hash__flush_tlb_page(vma, vmaddr);
+	else
+		_tlbie(vmaddr);
+}
+
 static inline void local_flush_tlb_page(struct vm_area_struct *vma,
 					unsigned long vmaddr)
 {
diff --git a/arch/powerpc/mm/book3s32/tlb.c b/arch/powerpc/mm/book3s32/tlb.c
index ae5dbba95805..65389bfe2eb8 100644
--- a/arch/powerpc/mm/book3s32/tlb.c
+++ b/arch/powerpc/mm/book3s32/tlb.c
@@ -118,15 +118,10 @@ EXPORT_SYMBOL(flush_tlb_kernel_range);
 /*
  * Flush all the (user) entries for the address space described by mm.
  */
-void flush_tlb_mm(struct mm_struct *mm)
+void hash__flush_tlb_mm(struct mm_struct *mm)
 {
 	struct vm_area_struct *mp;
 
-	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
-		_tlbia();
-		return;
-	}
-
 	/*
 	 * It is safe to go down the mm's list of vmas when called
 	 * from dup_mmap, holding mmap_lock.  It would also be safe from
@@ -136,23 +131,19 @@ void flush_tlb_mm(struct mm_struct *mm)
 	for (mp = mm->mmap; mp != NULL; mp = mp->vm_next)
 		flush_range(mp->vm_mm, mp->vm_start, mp->vm_end);
 }
-EXPORT_SYMBOL(flush_tlb_mm);
+EXPORT_SYMBOL(hash__flush_tlb_mm);
 
-void flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr)
+void hash__flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr)
 {
 	struct mm_struct *mm;
 	pmd_t *pmd;
 
-	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
-		_tlbie(vmaddr);
-		return;
-	}
 	mm = (vmaddr < TASK_SIZE)? vma->vm_mm: &init_mm;
 	pmd = pmd_off(mm, vmaddr);
 	if (!pmd_none(*pmd))
 		flush_hash_pages(mm->context.id, vmaddr, pmd_val(*pmd), 1);
 }
-EXPORT_SYMBOL(flush_tlb_page);
+EXPORT_SYMBOL(hash__flush_tlb_page);
 
 /*
  * For each address in the range, find the pte for the address
-- 
2.25.0

