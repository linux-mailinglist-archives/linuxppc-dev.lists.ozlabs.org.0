Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8686D37B54C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 07:02:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fg2j33dHYz3c8h
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 15:02:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fg2gk3SSdz309T
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 15:01:22 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fg2gL0zrDz9sf3;
 Wed, 12 May 2021 07:01:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dA1m01dIGbmI; Wed, 12 May 2021 07:01:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fg2gK3TDCz9sdw;
 Wed, 12 May 2021 07:01:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4F1538B7D6;
 Wed, 12 May 2021 07:01:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rQhrgmmPfChw; Wed, 12 May 2021 07:01:01 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F18CB8B769;
 Wed, 12 May 2021 07:01:00 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id CC0C064164; Wed, 12 May 2021 05:01:00 +0000 (UTC)
Message-Id: <fb3ccc73377832ac6708181ec419128a2f98ce36.1620795204.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1620795204.git.christophe.leroy@csgroup.eu>
References: <cover.1620795204.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 3/5] mm/vmalloc: Enable mapping of huge pages at pte level
 in vmap
To: Andrew Morton <akpm@linux-foundation.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, Mike Rapoport <rppt@kernel.org>
Date: Wed, 12 May 2021 05:01:00 +0000 (UTC)
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On some architectures like powerpc, there are huge pages that
are mapped at pte level.

Enable it in vmap.

For that, architectures can provide arch_vmap_pte_range_map_size()
that returns the size of pages to map at pte level.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 include/linux/vmalloc.h |  8 ++++++++
 mm/vmalloc.c            | 21 ++++++++++++++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 4d668abb6391..13c9b19ec923 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -104,6 +104,14 @@ static inline bool arch_vmap_pmd_supported(pgprot_t prot)
 }
 #endif
 
+#ifndef arch_vmap_pte_range_map_size
+static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr, unsigned long end,
+							 u64 pfn, unsigned int max_page_shift)
+{
+	return PAGE_SIZE;
+}
+#endif
+
 /*
  *	Highlevel APIs for driver use
  */
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index a13ac524f6ff..783d23b8c2f7 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -36,6 +36,7 @@
 #include <linux/overflow.h>
 #include <linux/pgtable.h>
 #include <linux/uaccess.h>
+#include <linux/hugetlb.h>
 #include <asm/tlbflush.h>
 #include <asm/shmparam.h>
 
@@ -83,10 +84,11 @@ static void free_work(struct work_struct *w)
 /*** Page table manipulation functions ***/
 static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
-			pgtbl_mod_mask *mask)
+			unsigned int max_page_shift, pgtbl_mod_mask *mask)
 {
 	pte_t *pte;
 	u64 pfn;
+	unsigned long size = PAGE_SIZE;
 
 	pfn = phys_addr >> PAGE_SHIFT;
 	pte = pte_alloc_kernel_track(pmd, addr, mask);
@@ -94,9 +96,22 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 		return -ENOMEM;
 	do {
 		BUG_ON(!pte_none(*pte));
+
+#ifdef CONFIG_HUGETLB_PAGE
+		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
+		if (size != PAGE_SIZE) {
+			pte_t entry = pfn_pte(pfn, prot);
+
+			entry = pte_mkhuge(entry);
+			entry = arch_make_huge_pte(entry, ilog2(size), 0);
+			set_huge_pte_at(&init_mm, addr, pte, entry);
+			pfn += PFN_DOWN(size);
+			continue;
+		}
+#endif
 		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
 		pfn++;
-	} while (pte++, addr += PAGE_SIZE, addr != end);
+	} while (pte += PFN_DOWN(size), addr += size, addr != end);
 	*mask |= PGTBL_PTE_MODIFIED;
 	return 0;
 }
@@ -145,7 +160,7 @@ static int vmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
 			continue;
 		}
 
-		if (vmap_pte_range(pmd, addr, next, phys_addr, prot, mask))
+		if (vmap_pte_range(pmd, addr, next, phys_addr, prot, max_page_shift, mask))
 			return -ENOMEM;
 	} while (pmd++, phys_addr += (next - addr), addr = next, addr != end);
 	return 0;
-- 
2.25.0

