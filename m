Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C38ED29588F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 08:50:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGyfx6MVXzDqQB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 17:50:33 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGyBs2cqSzDq7d
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 17:29:41 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CGyBn1z2yz9vBLM;
 Thu, 22 Oct 2020 08:29:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hnvLZHpE6EO9; Thu, 22 Oct 2020 08:29:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CGyBn1DV2z9vBKl;
 Thu, 22 Oct 2020 08:29:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 23F3C8B805;
 Thu, 22 Oct 2020 08:29:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7mqMKWf9G1QJ; Thu, 22 Oct 2020 08:29:38 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CC22A8B769;
 Thu, 22 Oct 2020 08:29:37 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A4E8F667EF; Thu, 22 Oct 2020 06:29:37 +0000 (UTC)
Message-Id: <c7029a78e78709ad9272d7a44260e06b649169b2.1603348103.git.christophe.leroy@csgroup.eu>
In-Reply-To: <648e2448e938d52d0b5887445e018ca584edc06d.1603348103.git.christophe.leroy@csgroup.eu>
References: <648e2448e938d52d0b5887445e018ca584edc06d.1603348103.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 12/20] powerpc/32s: Inline flush_tlb_range() and
 flush_tlb_kernel_range()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 22 Oct 2020 06:29:37 +0000 (UTC)
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

flush_tlb_range() and flush_tlb_kernel_range() are trivial calls to
flush_range().

Make flush_range() global and inline flush_tlb_range()
and flush_tlb_kernel_range().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/tlbflush.h | 15 ++++++++--
 arch/powerpc/mm/book3s32/tlb.c                | 30 +++++--------------
 2 files changed, 19 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/tlbflush.h b/arch/powerpc/include/asm/book3s/32/tlbflush.h
index 542765944531..2f480d184526 100644
--- a/arch/powerpc/include/asm/book3s/32/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/32/tlbflush.h
@@ -8,9 +8,7 @@
  */
 void hash__flush_tlb_mm(struct mm_struct *mm);
 void hash__flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
-extern void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
-			    unsigned long end);
-extern void flush_tlb_kernel_range(unsigned long start, unsigned long end);
+void flush_range(struct mm_struct *mm, unsigned long start, unsigned long end);
 
 #ifdef CONFIG_SMP
 void _tlbie(unsigned long address);
@@ -38,6 +36,17 @@ static inline void flush_tlb_page(struct vm_area_struct *vma, unsigned long vmad
 		_tlbie(vmaddr);
 }
 
+static inline void
+flush_tlb_range(struct vm_area_struct *vma, unsigned long start, unsigned long end)
+{
+	flush_range(vma->vm_mm, start, end);
+}
+
+static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end)
+{
+	flush_range(&init_mm, start, end);
+}
+
 static inline void local_flush_tlb_page(struct vm_area_struct *vma,
 					unsigned long vmaddr)
 {
diff --git a/arch/powerpc/mm/book3s32/tlb.c b/arch/powerpc/mm/book3s32/tlb.c
index 65389bfe2eb8..f9b8e1ce4371 100644
--- a/arch/powerpc/mm/book3s32/tlb.c
+++ b/arch/powerpc/mm/book3s32/tlb.c
@@ -71,8 +71,12 @@ void tlb_flush(struct mmu_gather *tlb)
  *    -- Cort
  */
 
-static void flush_range(struct mm_struct *mm, unsigned long start,
-			unsigned long end)
+/*
+ * For each address in the range, find the pte for the address
+ * and check _PAGE_HASHPTE bit; if it is set, find and destroy
+ * the corresponding HPTE.
+ */
+void flush_range(struct mm_struct *mm, unsigned long start, unsigned long end)
 {
 	pmd_t *pmd;
 	unsigned long pmd_end;
@@ -105,15 +109,7 @@ static void flush_range(struct mm_struct *mm, unsigned long start,
 		++pmd;
 	}
 }
-
-/*
- * Flush kernel TLB entries in the given range
- */
-void flush_tlb_kernel_range(unsigned long start, unsigned long end)
-{
-	flush_range(&init_mm, start, end);
-}
-EXPORT_SYMBOL(flush_tlb_kernel_range);
+EXPORT_SYMBOL(flush_range);
 
 /*
  * Flush all the (user) entries for the address space described by mm.
@@ -145,18 +141,6 @@ void hash__flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr)
 }
 EXPORT_SYMBOL(hash__flush_tlb_page);
 
-/*
- * For each address in the range, find the pte for the address
- * and check _PAGE_HASHPTE bit; if it is set, find and destroy
- * the corresponding HPTE.
- */
-void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
-		     unsigned long end)
-{
-	flush_range(vma->vm_mm, start, end);
-}
-EXPORT_SYMBOL(flush_tlb_range);
-
 void __init early_init_mmu(void)
 {
 }
-- 
2.25.0

