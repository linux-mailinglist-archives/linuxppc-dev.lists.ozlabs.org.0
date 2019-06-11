Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 508C63D203
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 18:17:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NZsS3mN5zDqfV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 02:17:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+98d4ae9035936dc2f97b+5770+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="MzyPzl48"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXkw1dCvzDqXZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:41:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+LfGuMfatgroW0jiS20tFtJAd2NqewOpaHqEsGODANw=; b=MzyPzl48/ml62a4ZrQyR9L5KBy
 WglwoTV9DQOuHwXk3Ec2QFcXT7X2AaARQNidYyxlEUN13Jyb5VW0f4ZVwb/4DrA1ZAAU1/nYpUSJj
 ibLq9BrcOGov9rKpSxDGFV6bnwHpi+QXt7nHhcCYWjo9+PAuoC8JBMc+2TD9BtS4sORtarGy6seQf
 JjKDbCrpPlxOUZfx4slD2Zb5kpyz7ZE12Bqbx1cWazNeCgkrltmNQP5S82l8XUehMiWYUisQMLoBm
 wIqkPZBDkpGzaBkiUqjyULHsotNmsGWCG6pNmNi+ZSkdYFlhQwemunxrro+VplNHOtCmhxt6ozkDa
 LgKKWlzw==;
Received: from mpp-cp1-natpool-1-037.ethz.ch ([82.130.71.37] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hahxl-0005Qh-6z; Tue, 11 Jun 2019 14:41:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 06/16] sh: use the generic get_user_pages_fast code
Date: Tue, 11 Jun 2019 16:40:52 +0200
Message-Id: <20190611144102.8848-7-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611144102.8848-1-hch@lst.de>
References: <20190611144102.8848-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-sh@vger.kernel.org, Andrey Konovalov <andreyknvl@google.com>,
 x86@kernel.org, linux-mips@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Khalid Aziz <khalid.aziz@oracle.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The sh code is mostly equivalent to the generic one, minus various
bugfixes and two arch overrides that this patch adds to pgtable.h.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/sh/Kconfig               |   2 +
 arch/sh/include/asm/pgtable.h |  37 +++++
 arch/sh/mm/Makefile           |   2 +-
 arch/sh/mm/gup.c              | 277 ----------------------------------
 4 files changed, 40 insertions(+), 278 deletions(-)
 delete mode 100644 arch/sh/mm/gup.c

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index b77f512bb176..6fddfc3c9710 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -14,6 +14,7 @@ config SUPERH
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_PERF_EVENTS
 	select HAVE_DEBUG_BUGVERBOSE
+	select HAVE_GENERIC_GUP
 	select ARCH_HAVE_CUSTOM_GPIO_H
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG if (GUSA_RB || CPU_SH4A)
 	select ARCH_HAS_GCOV_PROFILE_ALL
@@ -63,6 +64,7 @@ config SUPERH
 config SUPERH32
 	def_bool "$(ARCH)" = "sh"
 	select ARCH_32BIT_OFF_T
+	select GUP_GET_PTE_LOW_HIGH if X2TLB
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
 	select HAVE_IOREMAP_PROT if MMU && !X2TLB
diff --git a/arch/sh/include/asm/pgtable.h b/arch/sh/include/asm/pgtable.h
index 3587103afe59..9085d1142fa3 100644
--- a/arch/sh/include/asm/pgtable.h
+++ b/arch/sh/include/asm/pgtable.h
@@ -149,6 +149,43 @@ extern void paging_init(void);
 extern void page_table_range_init(unsigned long start, unsigned long end,
 				  pgd_t *pgd);
 
+static inline bool __pte_access_permitted(pte_t pte, u64 prot)
+{
+	return (pte_val(pte) & (prot | _PAGE_SPECIAL)) == prot;
+}
+
+#ifdef CONFIG_X2TLB
+static inline bool pte_access_permitted(pte_t pte, bool write)
+{
+	u64 prot = _PAGE_PRESENT;
+
+	prot |= _PAGE_EXT(_PAGE_EXT_KERN_READ | _PAGE_EXT_USER_READ);
+	if (write)
+		prot |= _PAGE_EXT(_PAGE_EXT_KERN_WRITE | _PAGE_EXT_USER_WRITE);
+	return __pte_access_permitted(pte, prot);
+}
+#elif defined(CONFIG_SUPERH64)
+static inline bool pte_access_permitted(pte_t pte, bool write)
+{
+	u64 prot = _PAGE_PRESENT | _PAGE_USER | _PAGE_READ;
+
+	if (write)
+		prot |= _PAGE_WRITE;
+	return __pte_access_permitted(pte, prot);
+}
+#else
+static inline bool pte_access_permitted(pte_t pte, bool write)
+{
+	u64 prot = _PAGE_PRESENT | _PAGE_USER;
+
+	if (write)
+		prot |= _PAGE_RW;
+	return __pte_access_permitted(pte, prot);
+}
+#endif
+
+#define pte_access_permitted pte_access_permitted
+
 /* arch/sh/mm/mmap.c */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
diff --git a/arch/sh/mm/Makefile b/arch/sh/mm/Makefile
index fbe5e79751b3..5051b38fd5b6 100644
--- a/arch/sh/mm/Makefile
+++ b/arch/sh/mm/Makefile
@@ -17,7 +17,7 @@ cacheops-$(CONFIG_CPU_SHX3)		+= cache-shx3.o
 obj-y			+= $(cacheops-y)
 
 mmu-y			:= nommu.o extable_32.o
-mmu-$(CONFIG_MMU)	:= extable_$(BITS).o fault.o gup.o ioremap.o kmap.o \
+mmu-$(CONFIG_MMU)	:= extable_$(BITS).o fault.o ioremap.o kmap.o \
 			   pgtable.o tlbex_$(BITS).o tlbflush_$(BITS).o
 
 obj-y			+= $(mmu-y)
diff --git a/arch/sh/mm/gup.c b/arch/sh/mm/gup.c
deleted file mode 100644
index 277c882f7489..000000000000
--- a/arch/sh/mm/gup.c
+++ /dev/null
@@ -1,277 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Lockless get_user_pages_fast for SuperH
- *
- * Copyright (C) 2009 - 2010  Paul Mundt
- *
- * Cloned from the x86 and PowerPC versions, by:
- *
- *	Copyright (C) 2008 Nick Piggin
- *	Copyright (C) 2008 Novell Inc.
- */
-#include <linux/sched.h>
-#include <linux/mm.h>
-#include <linux/vmstat.h>
-#include <linux/highmem.h>
-#include <asm/pgtable.h>
-
-static inline pte_t gup_get_pte(pte_t *ptep)
-{
-#ifndef CONFIG_X2TLB
-	return READ_ONCE(*ptep);
-#else
-	/*
-	 * With get_user_pages_fast, we walk down the pagetables without
-	 * taking any locks.  For this we would like to load the pointers
-	 * atomically, but that is not possible with 64-bit PTEs.  What
-	 * we do have is the guarantee that a pte will only either go
-	 * from not present to present, or present to not present or both
-	 * -- it will not switch to a completely different present page
-	 * without a TLB flush in between; something that we are blocking
-	 * by holding interrupts off.
-	 *
-	 * Setting ptes from not present to present goes:
-	 * ptep->pte_high = h;
-	 * smp_wmb();
-	 * ptep->pte_low = l;
-	 *
-	 * And present to not present goes:
-	 * ptep->pte_low = 0;
-	 * smp_wmb();
-	 * ptep->pte_high = 0;
-	 *
-	 * We must ensure here that the load of pte_low sees l iff pte_high
-	 * sees h. We load pte_high *after* loading pte_low, which ensures we
-	 * don't see an older value of pte_high.  *Then* we recheck pte_low,
-	 * which ensures that we haven't picked up a changed pte high. We might
-	 * have got rubbish values from pte_low and pte_high, but we are
-	 * guaranteed that pte_low will not have the present bit set *unless*
-	 * it is 'l'. And get_user_pages_fast only operates on present ptes, so
-	 * we're safe.
-	 *
-	 * gup_get_pte should not be used or copied outside gup.c without being
-	 * very careful -- it does not atomically load the pte or anything that
-	 * is likely to be useful for you.
-	 */
-	pte_t pte;
-
-retry:
-	pte.pte_low = ptep->pte_low;
-	smp_rmb();
-	pte.pte_high = ptep->pte_high;
-	smp_rmb();
-	if (unlikely(pte.pte_low != ptep->pte_low))
-		goto retry;
-
-	return pte;
-#endif
-}
-
-/*
- * The performance critical leaf functions are made noinline otherwise gcc
- * inlines everything into a single function which results in too much
- * register pressure.
- */
-static noinline int gup_pte_range(pmd_t pmd, unsigned long addr,
-		unsigned long end, int write, struct page **pages, int *nr)
-{
-	u64 mask, result;
-	pte_t *ptep;
-
-#ifdef CONFIG_X2TLB
-	result = _PAGE_PRESENT | _PAGE_EXT(_PAGE_EXT_KERN_READ | _PAGE_EXT_USER_READ);
-	if (write)
-		result |= _PAGE_EXT(_PAGE_EXT_KERN_WRITE | _PAGE_EXT_USER_WRITE);
-#elif defined(CONFIG_SUPERH64)
-	result = _PAGE_PRESENT | _PAGE_USER | _PAGE_READ;
-	if (write)
-		result |= _PAGE_WRITE;
-#else
-	result = _PAGE_PRESENT | _PAGE_USER;
-	if (write)
-		result |= _PAGE_RW;
-#endif
-
-	mask = result | _PAGE_SPECIAL;
-
-	ptep = pte_offset_map(&pmd, addr);
-	do {
-		pte_t pte = gup_get_pte(ptep);
-		struct page *page;
-
-		if ((pte_val(pte) & mask) != result) {
-			pte_unmap(ptep);
-			return 0;
-		}
-		VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
-		page = pte_page(pte);
-		get_page(page);
-		__flush_anon_page(page, addr);
-		flush_dcache_page(page);
-		pages[*nr] = page;
-		(*nr)++;
-
-	} while (ptep++, addr += PAGE_SIZE, addr != end);
-	pte_unmap(ptep - 1);
-
-	return 1;
-}
-
-static int gup_pmd_range(pud_t pud, unsigned long addr, unsigned long end,
-		int write, struct page **pages, int *nr)
-{
-	unsigned long next;
-	pmd_t *pmdp;
-
-	pmdp = pmd_offset(&pud, addr);
-	do {
-		pmd_t pmd = *pmdp;
-
-		next = pmd_addr_end(addr, end);
-		if (pmd_none(pmd))
-			return 0;
-		if (!gup_pte_range(pmd, addr, next, write, pages, nr))
-			return 0;
-	} while (pmdp++, addr = next, addr != end);
-
-	return 1;
-}
-
-static int gup_pud_range(pgd_t pgd, unsigned long addr, unsigned long end,
-			int write, struct page **pages, int *nr)
-{
-	unsigned long next;
-	pud_t *pudp;
-
-	pudp = pud_offset(&pgd, addr);
-	do {
-		pud_t pud = *pudp;
-
-		next = pud_addr_end(addr, end);
-		if (pud_none(pud))
-			return 0;
-		if (!gup_pmd_range(pud, addr, next, write, pages, nr))
-			return 0;
-	} while (pudp++, addr = next, addr != end);
-
-	return 1;
-}
-
-/*
- * Like get_user_pages_fast() except its IRQ-safe in that it won't fall
- * back to the regular GUP.
- * Note a difference with get_user_pages_fast: this always returns the
- * number of pages pinned, 0 if no pages were pinned.
- */
-int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
-			  struct page **pages)
-{
-	struct mm_struct *mm = current->mm;
-	unsigned long addr, len, end;
-	unsigned long next;
-	unsigned long flags;
-	pgd_t *pgdp;
-	int nr = 0;
-
-	start &= PAGE_MASK;
-	addr = start;
-	len = (unsigned long) nr_pages << PAGE_SHIFT;
-	end = start + len;
-	if (unlikely(!access_ok((void __user *)start, len)))
-		return 0;
-
-	/*
-	 * This doesn't prevent pagetable teardown, but does prevent
-	 * the pagetables and pages from being freed.
-	 */
-	local_irq_save(flags);
-	pgdp = pgd_offset(mm, addr);
-	do {
-		pgd_t pgd = *pgdp;
-
-		next = pgd_addr_end(addr, end);
-		if (pgd_none(pgd))
-			break;
-		if (!gup_pud_range(pgd, addr, next, write, pages, &nr))
-			break;
-	} while (pgdp++, addr = next, addr != end);
-	local_irq_restore(flags);
-
-	return nr;
-}
-
-/**
- * get_user_pages_fast() - pin user pages in memory
- * @start:	starting user address
- * @nr_pages:	number of pages from start to pin
- * @gup_flags:	flags modifying pin behaviour
- * @pages:	array that receives pointers to the pages pinned.
- *		Should be at least nr_pages long.
- *
- * Attempt to pin user pages in memory without taking mm->mmap_sem.
- * If not successful, it will fall back to taking the lock and
- * calling get_user_pages().
- *
- * Returns number of pages pinned. This may be fewer than the number
- * requested. If nr_pages is 0 or negative, returns 0. If no pages
- * were pinned, returns -errno.
- */
-int get_user_pages_fast(unsigned long start, int nr_pages,
-			unsigned int gup_flags, struct page **pages)
-{
-	struct mm_struct *mm = current->mm;
-	unsigned long addr, len, end;
-	unsigned long next;
-	pgd_t *pgdp;
-	int nr = 0;
-
-	start &= PAGE_MASK;
-	addr = start;
-	len = (unsigned long) nr_pages << PAGE_SHIFT;
-
-	end = start + len;
-	if (end < start)
-		goto slow_irqon;
-
-	local_irq_disable();
-	pgdp = pgd_offset(mm, addr);
-	do {
-		pgd_t pgd = *pgdp;
-
-		next = pgd_addr_end(addr, end);
-		if (pgd_none(pgd))
-			goto slow;
-		if (!gup_pud_range(pgd, addr, next, gup_flags & FOLL_WRITE,
-				   pages, &nr))
-			goto slow;
-	} while (pgdp++, addr = next, addr != end);
-	local_irq_enable();
-
-	VM_BUG_ON(nr != (end - start) >> PAGE_SHIFT);
-	return nr;
-
-	{
-		int ret;
-
-slow:
-		local_irq_enable();
-slow_irqon:
-		/* Try to get the remaining pages with get_user_pages */
-		start += nr << PAGE_SHIFT;
-		pages += nr;
-
-		ret = get_user_pages_unlocked(start,
-			(end - start) >> PAGE_SHIFT, pages,
-			gup_flags);
-
-		/* Have to be a bit careful with return values */
-		if (nr > 0) {
-			if (ret < 0)
-				ret = nr;
-			else
-				ret += nr;
-		}
-
-		return ret;
-	}
-}
-- 
2.20.1

