Return-Path: <linuxppc-dev+bounces-8259-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AC1AA734D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 15:20:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zps4843Rnz2yqv;
	Fri,  2 May 2025 23:20:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746192040;
	cv=none; b=DUpdOkqqzWON6XxDJ94otI42NG/yCVabBAo4bO0bR8vgFkUr4Savt7rgCQIPXjzTGl3AYwRt0jULupvlTn2QEPVbDu/nH2876TUnZUXrXj3a1k381rsApO9rR0uFHiPmowWwrPS1Zr/w6lnoJAwlXMSVFIWGjgoIZUOCe2B+gM/bhdjTa1bFX8OZ5DMMXeOV6sfHxY/qcPuJ/i9OCJKjBrLqjD0qJO/NUi5epxjttcYx0MDj9i9p6ztN7/B+4KgphpUQHgQb7QVUC5MdWcyeP0Yro9W5KkSFrowp97zEnwtHoXmFV3j1097jJNsLkPQ80D9xpAZzZpQgtaizI0f0Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746192040; c=relaxed/relaxed;
	bh=H+33nZgtga8LAD21ZP+4ubm8ESpffSildHohhadgSo0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KGyZCky4kfHff1VkwAAAFsWwFomxLqts4mmSk6PNf0vDkvZqPycLs2d9TZbsXjTxpe4yz8t9h2FO5st3qFHX/+vyQJLArMKHxQV5DokF/EMN5X9M8ZWPw3sMCBoTlLyzgUJce7jM2mkN+H52A6AJgkB7DQZJrLZ/FkOtvyt3loTxzOz2MaL4I7eCUj5i16nV7pjayjAVxzO5lCw5LTB17SJSi8zi0/BfP2bpDGKAsqwKGfwMmrYcFQB4CPmBDm2DK/tNMZ/MbeYrQoRUvd5OP/T4ujdeLHCoZLm3MleONNpj+McAQXxh7FaqQBH2QiiaS76Z2z3oS89AmUUf7VnFHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zps456Gqdz2ynh
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 23:20:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZprnS0mDzz9sB5;
	Fri,  2 May 2025 15:07:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yTdoClDjHfzF; Fri,  2 May 2025 15:07:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZprnS03d6z9sB2;
	Fri,  2 May 2025 15:07:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F00368B765;
	Fri,  2 May 2025 15:07:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id C9qmk7rqDkQY; Fri,  2 May 2025 15:07:55 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 806938B763;
	Fri,  2 May 2025 15:07:55 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/8xx: Reduce alignment constraint for kernel memory
Date: Fri,  2 May 2025 15:07:53 +0200
Message-ID: <fa9927b70df13627cdf10b992ea71d6562c7760e.1746191262.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746191273; l=5113; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=5DyP5CH5llsrXoTjy9opbfOMo5C5G5RLl6+nE2p0vMs=; b=uF1BTXzLim4U+Lw/FpCSAf59eNVyyt3u/EdmT2gO8CghLvC0q8dKtHVVqm4DePkGQmFxc/tKd TBEx1AWyGFBA0jW8VwEwUU9A9K097fGv/aFSwuX8TL4psaUYfcd1Qcy
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

8xx has three large page sizes: 8M, 512k and 16k.

A too big alignment can lead to wasting memory. On a board which has
only 32 MBytes of RAM, every single byte is worth it and a 512k
alignment is sometimes too much.

Allow mapping kernel memory with 16k pages and reduce the constraint
on kernel memory alignment. 512k and 16k pages are handled the same
way so reverse tests in order to make 8M pages the special case and
other ones (512k and 16k) the alternative.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig         | 10 +++++-----
 arch/powerpc/mm/nohash/8xx.c | 32 +++++++++++++++++---------------
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2519fc3538c6..c3e0cc83f120 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -895,7 +895,7 @@ config DATA_SHIFT
 	int "Data shift" if DATA_SHIFT_BOOL
 	default 24 if STRICT_KERNEL_RWX && PPC64
 	range 17 28 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE) && PPC_BOOK3S_32
-	range 19 23 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE) && PPC_8xx
+	range 14 23 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE) && PPC_8xx
 	range 20 24 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE) && PPC_85xx
 	default 22 if STRICT_KERNEL_RWX && PPC_BOOK3S_32
 	default 18 if (DEBUG_PAGEALLOC || KFENCE) && PPC_BOOK3S_32
@@ -908,10 +908,10 @@ config DATA_SHIFT
 	  On Book3S 32 (603+), DBATs are used to map kernel text and rodata RO.
 	  Smaller is the alignment, greater is the number of necessary DBATs.
 
-	  On 8xx, large pages (512kb or 8M) are used to map kernel linear
-	  memory. Aligning to 8M reduces TLB misses as only 8M pages are used
-	  in that case. If PIN_TLB is selected, it must be aligned to 8M as
-	  8M pages will be pinned.
+	  On 8xx, large pages (16kb or 512kb or 8M) are used to map kernel
+	  linear memory. Aligning to 8M reduces TLB misses as only 8M pages
+	  are used in that case. If PIN_TLB is selected, it must be aligned
+	  to 8M as 8M pages will be pinned.
 
 config ARCH_FORCE_MAX_ORDER
 	int "Order of maximal physically contiguous allocations"
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 8b54f12d1889..ab1505cf42bf 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -54,20 +54,13 @@ static int __ref __early_map_kernel_hugepage(unsigned long va, phys_addr_t pa,
 {
 	pmd_t *pmdp = pmd_off_k(va);
 	pte_t *ptep;
-
-	if (WARN_ON(psize != MMU_PAGE_512K && psize != MMU_PAGE_8M))
-		return -EINVAL;
+	unsigned int shift = mmu_psize_to_shift(psize);
 
 	if (new) {
 		if (WARN_ON(slab_is_available()))
 			return -EINVAL;
 
-		if (psize == MMU_PAGE_512K) {
-			ptep = early_pte_alloc_kernel(pmdp, va);
-			/* The PTE should never be already present */
-			if (WARN_ON(pte_present(*ptep) && pgprot_val(prot)))
-				return -EINVAL;
-		} else {
+		if (psize == MMU_PAGE_8M) {
 			if (WARN_ON(!pmd_none(*pmdp) || !pmd_none(*(pmdp + 1))))
 				return -EINVAL;
 
@@ -78,20 +71,25 @@ static int __ref __early_map_kernel_hugepage(unsigned long va, phys_addr_t pa,
 			pmd_populate_kernel(&init_mm, pmdp + 1, ptep);
 
 			ptep = (pte_t *)pmdp;
+		} else {
+			ptep = early_pte_alloc_kernel(pmdp, va);
+			/* The PTE should never be already present */
+			if (WARN_ON(pte_present(*ptep) && pgprot_val(prot)))
+				return -EINVAL;
 		}
 	} else {
-		if (psize == MMU_PAGE_512K)
-			ptep = pte_offset_kernel(pmdp, va);
-		else
+		if (psize == MMU_PAGE_8M)
 			ptep = (pte_t *)pmdp;
+		else
+			ptep = pte_offset_kernel(pmdp, va);
 	}
 
 	if (WARN_ON(!ptep))
 		return -ENOMEM;
 
 	set_huge_pte_at(&init_mm, va, ptep,
-			pte_mkhuge(pfn_pte(pa >> PAGE_SHIFT, prot)),
-			1UL << mmu_psize_to_shift(psize));
+			arch_make_huge_pte(pfn_pte(pa >> PAGE_SHIFT, prot), shift, 0),
+			1UL << shift);
 
 	return 0;
 }
@@ -123,14 +121,18 @@ static int mmu_mapin_ram_chunk(unsigned long offset, unsigned long top,
 	unsigned long p = offset;
 	int err = 0;
 
-	WARN_ON(!IS_ALIGNED(offset, SZ_512K) || !IS_ALIGNED(top, SZ_512K));
+	WARN_ON(!IS_ALIGNED(offset, SZ_16K) || !IS_ALIGNED(top, SZ_16K));
 
+	for (; p < ALIGN(p, SZ_512K) && p < top && !err; p += SZ_16K, v += SZ_16K)
+		err = __early_map_kernel_hugepage(v, p, prot, MMU_PAGE_16K, new);
 	for (; p < ALIGN(p, SZ_8M) && p < top && !err; p += SZ_512K, v += SZ_512K)
 		err = __early_map_kernel_hugepage(v, p, prot, MMU_PAGE_512K, new);
 	for (; p < ALIGN_DOWN(top, SZ_8M) && p < top && !err; p += SZ_8M, v += SZ_8M)
 		err = __early_map_kernel_hugepage(v, p, prot, MMU_PAGE_8M, new);
 	for (; p < ALIGN_DOWN(top, SZ_512K) && p < top && !err; p += SZ_512K, v += SZ_512K)
 		err = __early_map_kernel_hugepage(v, p, prot, MMU_PAGE_512K, new);
+	for (; p < ALIGN_DOWN(top, SZ_16K) && p < top && !err; p += SZ_16K, v += SZ_16K)
+		err = __early_map_kernel_hugepage(v, p, prot, MMU_PAGE_16K, new);
 
 	if (!new)
 		flush_tlb_kernel_range(PAGE_OFFSET + v, PAGE_OFFSET + top);
-- 
2.47.0


