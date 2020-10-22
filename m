Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC05295897
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 08:52:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGyj00XbszDql8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 17:52:20 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGyBt1gsRzDqJM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 17:29:42 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CGyBp30qbz9vBLP;
 Thu, 22 Oct 2020 08:29:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id owKUCXMAVhwl; Thu, 22 Oct 2020 08:29:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CGyBp1rQfz9vBKl;
 Thu, 22 Oct 2020 08:29:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1544C8B806;
 Thu, 22 Oct 2020 08:29:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ODAbJO45zN92; Thu, 22 Oct 2020 08:29:38 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C60058B805;
 Thu, 22 Oct 2020 08:29:38 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id AAFC4667EF; Thu, 22 Oct 2020 06:29:38 +0000 (UTC)
Message-Id: <132ab19aae52abc8e06ab524ec86d4229b5b9c3d.1603348103.git.christophe.leroy@csgroup.eu>
In-Reply-To: <648e2448e938d52d0b5887445e018ca584edc06d.1603348103.git.christophe.leroy@csgroup.eu>
References: <648e2448e938d52d0b5887445e018ca584edc06d.1603348103.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 13/20] powerpc/32s: Split and inline flush_range()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 22 Oct 2020 06:29:38 +0000 (UTC)
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

flush_range() handle both the MMU_FTR_HPTE_TABLE case and
the other case.

The non MMU_FTR_HPTE_TABLE case is trivial as it is only a call
to _tlbie()/_tlbia() which is not worth a dedicated function.

Make flush_range() a hash specific and call it from tlbflush.h based
on mmu_has_feature(MMU_FTR_HPTE_TABLE).

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/tlbflush.h | 13 ++++++++++++-
 arch/powerpc/mm/book3s32/tlb.c                | 13 +++----------
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/tlbflush.h b/arch/powerpc/include/asm/book3s/32/tlbflush.h
index 2f480d184526..42708c1719d6 100644
--- a/arch/powerpc/include/asm/book3s/32/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/32/tlbflush.h
@@ -8,7 +8,7 @@
  */
 void hash__flush_tlb_mm(struct mm_struct *mm);
 void hash__flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
-void flush_range(struct mm_struct *mm, unsigned long start, unsigned long end);
+void hash__flush_range(struct mm_struct *mm, unsigned long start, unsigned long end);
 
 #ifdef CONFIG_SMP
 void _tlbie(unsigned long address);
@@ -20,6 +20,17 @@ static inline void _tlbie(unsigned long address)
 #endif
 void _tlbia(void);
 
+static inline void flush_range(struct mm_struct *mm, unsigned long start, unsigned long end)
+{
+	start &= PAGE_MASK;
+	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
+		hash__flush_range(mm, start, end);
+	else if (end - start <= PAGE_SIZE)
+		_tlbie(start);
+	else
+		_tlbia();
+}
+
 static inline void flush_tlb_mm(struct mm_struct *mm)
 {
 	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
diff --git a/arch/powerpc/mm/book3s32/tlb.c b/arch/powerpc/mm/book3s32/tlb.c
index f9b8e1ce4371..f0edbad5966c 100644
--- a/arch/powerpc/mm/book3s32/tlb.c
+++ b/arch/powerpc/mm/book3s32/tlb.c
@@ -76,7 +76,7 @@ void tlb_flush(struct mmu_gather *tlb)
  * and check _PAGE_HASHPTE bit; if it is set, find and destroy
  * the corresponding HPTE.
  */
-void flush_range(struct mm_struct *mm, unsigned long start, unsigned long end)
+void hash__flush_range(struct mm_struct *mm, unsigned long start, unsigned long end)
 {
 	pmd_t *pmd;
 	unsigned long pmd_end;
@@ -84,13 +84,6 @@ void flush_range(struct mm_struct *mm, unsigned long start, unsigned long end)
 	unsigned int ctx = mm->context.id;
 
 	start &= PAGE_MASK;
-	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
-		if (end - start <= PAGE_SIZE)
-			_tlbie(start);
-		else
-			_tlbia();
-		return;
-	}
 	if (start >= end)
 		return;
 	end = (end - 1) | ~PAGE_MASK;
@@ -109,7 +102,7 @@ void flush_range(struct mm_struct *mm, unsigned long start, unsigned long end)
 		++pmd;
 	}
 }
-EXPORT_SYMBOL(flush_range);
+EXPORT_SYMBOL(hash__flush_range);
 
 /*
  * Flush all the (user) entries for the address space described by mm.
@@ -125,7 +118,7 @@ void hash__flush_tlb_mm(struct mm_struct *mm)
 	 * but it seems dup_mmap is the only SMP case which gets here.
 	 */
 	for (mp = mm->mmap; mp != NULL; mp = mp->vm_next)
-		flush_range(mp->vm_mm, mp->vm_start, mp->vm_end);
+		hash__flush_range(mp->vm_mm, mp->vm_start, mp->vm_end);
 }
 EXPORT_SYMBOL(hash__flush_tlb_mm);
 
-- 
2.25.0

