Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D52218FA72
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 07:45:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468sjB5HMVzDr8V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 15:45:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="oqfC7rCu"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468sdP5JCqzDqdr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 15:41:44 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 468sdJ4m0fz9txv0;
 Fri, 16 Aug 2019 07:41:40 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=oqfC7rCu; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id aVEJRST0G_nS; Fri, 16 Aug 2019 07:41:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 468sdJ3ddCz9txty;
 Fri, 16 Aug 2019 07:41:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565934100; bh=t4EaISFyjqqTityq896SebQSVDC7kJa7UoIn3sFKv+I=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=oqfC7rCuCtbk8nonHpvlR6ZAzFoSkdmxyEVH7zr97r2ASH4JCpqGOcSOQGexZjlfX
 MNaG+yxedLaS0HzmsB0/JD0ep2NqpjjQTqPyJqECwNVnK5gM029qyxLwtmrKkCUYEu
 qrYD5hmaNyMhe/WfbZqJJ/1oOyknYiDCiuufNSZU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 713338B776;
 Fri, 16 Aug 2019 07:41:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wHJbFhMqNw1B; Fri, 16 Aug 2019 07:41:41 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 57AC48B754;
 Fri, 16 Aug 2019 07:41:41 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 554EC6B6CC; Fri, 16 Aug 2019 05:41:41 +0000 (UTC)
Message-Id: <4d69fdc86df9c74adc71a60331a86f6afb8b5e9e.1565933217.git.christophe.leroy@c-s.fr>
In-Reply-To: <668aba4db6b9af6d8a151174e11a4289f1a6bbcd.1565933217.git.christophe.leroy@c-s.fr>
References: <668aba4db6b9af6d8a151174e11a4289f1a6bbcd.1565933217.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 2/5] powerpc/mm: move FSL_BOOK3 version of update_mmu_cache()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 16 Aug 2019 05:41:41 +0000 (UTC)
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

Move FSL_BOOK3E version of update_mmu_cache() at the same
place as book3e_hugetlb_preload() as update_mmu_cache() is
the only user of book3e_hugetlb_preload().

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/hugetlb.h          |  3 ---
 arch/powerpc/mm/mem.c                       |  8 --------
 arch/powerpc/mm/nohash/book3e_hugetlbpage.c | 16 ++++++++++++++--
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index 20a101046cff..bd6504c28c2f 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -31,9 +31,6 @@ static inline int is_hugepage_only_range(struct mm_struct *mm,
 	return 0;
 }
 
-void book3e_hugetlb_preload(struct vm_area_struct *vma, unsigned long ea,
-			    pte_t pte);
-
 #define __HAVE_ARCH_HUGETLB_FREE_PGD_RANGE
 void hugetlb_free_pgd_range(struct mmu_gather *tlb, unsigned long addr,
 			    unsigned long end, unsigned long floor,
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 582ad728ac9d..c45d44538ddb 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -457,14 +457,6 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
 	hash_preload(vma->vm_mm, address, is_exec, trap);
 }
 #endif /* CONFIG_PPC_BOOK3S */
-#if defined(CONFIG_PPC_FSL_BOOK3E) && defined(CONFIG_HUGETLB_PAGE)
-void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
-		      pte_t *ptep)
-{
-	if (is_vm_hugetlb_page(vma))
-		book3e_hugetlb_preload(vma, address, *ptep);
-}
-#endif
 
 /*
  * System memory should not be in /proc/iomem but various tools expect it
diff --git a/arch/powerpc/mm/nohash/book3e_hugetlbpage.c b/arch/powerpc/mm/nohash/book3e_hugetlbpage.c
index 61915f4d3c7f..8b88be91b622 100644
--- a/arch/powerpc/mm/nohash/book3e_hugetlbpage.c
+++ b/arch/powerpc/mm/nohash/book3e_hugetlbpage.c
@@ -122,8 +122,8 @@ static inline int book3e_tlb_exists(unsigned long ea, unsigned long pid)
 	return found;
 }
 
-void book3e_hugetlb_preload(struct vm_area_struct *vma, unsigned long ea,
-			    pte_t pte)
+static void
+book3e_hugetlb_preload(struct vm_area_struct *vma, unsigned long ea, pte_t pte)
 {
 	unsigned long mas1, mas2;
 	u64 mas7_3;
@@ -183,6 +183,18 @@ void book3e_hugetlb_preload(struct vm_area_struct *vma, unsigned long ea,
 	local_irq_restore(flags);
 }
 
+/*
+ * This is called at the end of handling a user page fault, when the
+ * fault has been handled by updating a PTE in the linux page tables.
+ *
+ * This must always be called with the pte lock held.
+ */
+void update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep)
+{
+	if (is_vm_hugetlb_page(vma))
+		book3e_hugetlb_preload(vma, address, *ptep);
+}
+
 void flush_hugetlb_page(struct vm_area_struct *vma, unsigned long vmaddr)
 {
 	struct hstate *hstate = hstate_file(vma->vm_file);
-- 
2.13.3

