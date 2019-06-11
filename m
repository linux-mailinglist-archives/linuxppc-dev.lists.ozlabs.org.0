Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF123D1EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 18:11:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NZkn0wB5zDqdG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 02:11:45 +1000 (AEST)
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
 header.b="ZURuWGVu"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXkv3xmDzDqVF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:41:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YdgQvYMgqOUQwEvGH17qBF0YrrxMqW6F+rGIWz8dtc8=; b=ZURuWGVuu8robHBBLAFnrfoXA1
 3nEbA75Eot/QHKe01UAt3GRvyP3MaANX7kIj1156NUNOqzDWHfLifgPOpACTIhxY5zThJ4/Yuo30s
 SUvmYPVHlXiI8R1SYFNCriL33BKP7fi1zZM0xrz4HRElky5PGOcl56Pw6qviU9ASt5PugN2/So9F1
 CcUgFtnaC/Zut0sPLBcCZUj1yseVIfmsO8zMpvIcgP9fED1u7pqhk68OQvC4iRR5fvwz/6W8SxrHl
 gd3K2Kf6WAEZ9pJvBtBj57E0scbQ6tZP8jQmV/Yt5FTYtbjG06xkf+G6FL/jlyNMHgKdKnaCsKcSP
 dNHuBkew==;
Received: from mpp-cp1-natpool-1-037.ethz.ch ([82.130.71.37] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hahxf-0005Pu-L2; Tue, 11 Jun 2019 14:41:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 04/16] MIPS: use the generic get_user_pages_fast code
Date: Tue, 11 Jun 2019 16:40:50 +0200
Message-Id: <20190611144102.8848-5-hch@lst.de>
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

The mips code is mostly equivalent to the generic one, minus various
bugfixes and an arch override for gup_fast_permitted.

Note that this defines ARCH_HAS_PTE_SPECIAL for mips as mips has
pte_special and pte_mkspecial implemented and used in the existing
gup code.  They are no-op stubs, though which makes me a little unsure
if this is really right thing to do.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/Kconfig               |   3 +
 arch/mips/include/asm/pgtable.h |   3 +
 arch/mips/mm/Makefile           |   1 -
 arch/mips/mm/gup.c              | 303 --------------------------------
 4 files changed, 6 insertions(+), 304 deletions(-)
 delete mode 100644 arch/mips/mm/gup.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 70d3200476bf..64108a2a16d4 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -6,6 +6,7 @@ config MIPS
 	select ARCH_BINFMT_ELF_STATE if MIPS_FP_SUPPORT
 	select ARCH_CLOCKSOURCE_DATA
 	select ARCH_HAS_ELF_RANDOMIZE
+	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_SUPPORTS_UPROBES
@@ -34,6 +35,7 @@ config MIPS
 	select GENERIC_SCHED_CLOCK if !CAVIUM_OCTEON_SOC
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
+	select GUP_GET_PTE_LOW_HIGH if CPU_MIPS32 && PHYS_ADDR_T_64BIT
 	select HANDLE_DOMAIN_IRQ
 	select HAVE_ARCH_COMPILER_H
 	select HAVE_ARCH_JUMP_LABEL
@@ -55,6 +57,7 @@ config MIPS
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER
+	select HAVE_GENERIC_GUP
 	select HAVE_IDE
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_EXIT_ON_IRQ_STACK
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 4ccb465ef3f2..7d27194e3b45 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -20,6 +20,7 @@
 #include <asm/cmpxchg.h>
 #include <asm/io.h>
 #include <asm/pgtable-bits.h>
+#include <asm/cpu-features.h>
 
 struct mm_struct;
 struct vm_area_struct;
@@ -626,6 +627,8 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+#define gup_fast_permitted(start, end)	(!cpu_has_dc_aliases)
+
 #include <asm-generic/pgtable.h>
 
 /*
diff --git a/arch/mips/mm/Makefile b/arch/mips/mm/Makefile
index f34d7ff5eb60..1e8d335025d7 100644
--- a/arch/mips/mm/Makefile
+++ b/arch/mips/mm/Makefile
@@ -7,7 +7,6 @@ obj-y				+= cache.o
 obj-y				+= context.o
 obj-y				+= extable.o
 obj-y				+= fault.o
-obj-y				+= gup.o
 obj-y				+= init.o
 obj-y				+= mmap.o
 obj-y				+= page.o
diff --git a/arch/mips/mm/gup.c b/arch/mips/mm/gup.c
deleted file mode 100644
index 4c2b4483683c..000000000000
--- a/arch/mips/mm/gup.c
+++ /dev/null
@@ -1,303 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Lockless get_user_pages_fast for MIPS
- *
- * Copyright (C) 2008 Nick Piggin
- * Copyright (C) 2008 Novell Inc.
- * Copyright (C) 2011 Ralf Baechle
- */
-#include <linux/sched.h>
-#include <linux/mm.h>
-#include <linux/vmstat.h>
-#include <linux/highmem.h>
-#include <linux/swap.h>
-#include <linux/hugetlb.h>
-
-#include <asm/cpu-features.h>
-#include <asm/pgtable.h>
-
-static inline pte_t gup_get_pte(pte_t *ptep)
-{
-#if defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32)
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
-#else
-	return READ_ONCE(*ptep);
-#endif
-}
-
-static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
-			int write, struct page **pages, int *nr)
-{
-	pte_t *ptep = pte_offset_map(&pmd, addr);
-	do {
-		pte_t pte = gup_get_pte(ptep);
-		struct page *page;
-
-		if (!pte_present(pte) ||
-		    pte_special(pte) || (write && !pte_write(pte))) {
-			pte_unmap(ptep);
-			return 0;
-		}
-		VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
-		page = pte_page(pte);
-		get_page(page);
-		SetPageReferenced(page);
-		pages[*nr] = page;
-		(*nr)++;
-
-	} while (ptep++, addr += PAGE_SIZE, addr != end);
-
-	pte_unmap(ptep - 1);
-	return 1;
-}
-
-static inline void get_head_page_multiple(struct page *page, int nr)
-{
-	VM_BUG_ON(page != compound_head(page));
-	VM_BUG_ON(page_count(page) == 0);
-	page_ref_add(page, nr);
-	SetPageReferenced(page);
-}
-
-static int gup_huge_pmd(pmd_t pmd, unsigned long addr, unsigned long end,
-			int write, struct page **pages, int *nr)
-{
-	pte_t pte = *(pte_t *)&pmd;
-	struct page *head, *page;
-	int refs;
-
-	if (write && !pte_write(pte))
-		return 0;
-	/* hugepages are never "special" */
-	VM_BUG_ON(pte_special(pte));
-	VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
-
-	refs = 0;
-	head = pte_page(pte);
-	page = head + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
-	do {
-		VM_BUG_ON(compound_head(page) != head);
-		pages[*nr] = page;
-		(*nr)++;
-		page++;
-		refs++;
-	} while (addr += PAGE_SIZE, addr != end);
-
-	get_head_page_multiple(head, refs);
-	return 1;
-}
-
-static int gup_pmd_range(pud_t pud, unsigned long addr, unsigned long end,
-			int write, struct page **pages, int *nr)
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
-		if (unlikely(pmd_huge(pmd))) {
-			if (!gup_huge_pmd(pmd, addr, next, write, pages,nr))
-				return 0;
-		} else {
-			if (!gup_pte_range(pmd, addr, next, write, pages,nr))
-				return 0;
-		}
-	} while (pmdp++, addr = next, addr != end);
-
-	return 1;
-}
-
-static int gup_huge_pud(pud_t pud, unsigned long addr, unsigned long end,
-			int write, struct page **pages, int *nr)
-{
-	pte_t pte = *(pte_t *)&pud;
-	struct page *head, *page;
-	int refs;
-
-	if (write && !pte_write(pte))
-		return 0;
-	/* hugepages are never "special" */
-	VM_BUG_ON(pte_special(pte));
-	VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
-
-	refs = 0;
-	head = pte_page(pte);
-	page = head + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
-	do {
-		VM_BUG_ON(compound_head(page) != head);
-		pages[*nr] = page;
-		(*nr)++;
-		page++;
-		refs++;
-	} while (addr += PAGE_SIZE, addr != end);
-
-	get_head_page_multiple(head, refs);
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
-		if (unlikely(pud_huge(pud))) {
-			if (!gup_huge_pud(pud, addr, next, write, pages,nr))
-				return 0;
-		} else {
-			if (!gup_pmd_range(pud, addr, next, write, pages,nr))
-				return 0;
-		}
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
-	 * XXX: batch / limit 'nr', to avoid large irq off latency
-	 * needs some instrumenting to determine the common sizes used by
-	 * important workloads (eg. DB2), and whether limiting the batch
-	 * size will decrease performance.
-	 *
-	 * It seems like we're in the clear for the moment. Direct-IO is
-	 * the main guy that batches up lots of get_user_pages, and even
-	 * they are limited to 64-at-a-time which is not so many.
-	 */
-	/*
-	 * This doesn't prevent pagetable teardown, but does prevent
-	 * the pagetables and pages from being freed.
-	 *
-	 * So long as we atomically load page table pointers versus teardown,
-	 * we can follow the address down to the page and take a ref on it.
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
-	int ret, nr = 0;
-
-	start &= PAGE_MASK;
-	addr = start;
-	len = (unsigned long) nr_pages << PAGE_SHIFT;
-
-	end = start + len;
-	if (end < start || cpu_has_dc_aliases)
-		goto slow_irqon;
-
-	/* XXX: batch / limit 'nr' */
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
-slow:
-	local_irq_enable();
-
-slow_irqon:
-	/* Try to get the remaining pages with get_user_pages */
-	start += nr << PAGE_SHIFT;
-	pages += nr;
-
-	ret = get_user_pages_unlocked(start, (end - start) >> PAGE_SHIFT,
-				      pages, gup_flags);
-
-	/* Have to be a bit careful with return values */
-	if (nr > 0) {
-		if (ret < 0)
-			ret = nr;
-		else
-			ret += nr;
-	}
-	return ret;
-}
-- 
2.20.1

