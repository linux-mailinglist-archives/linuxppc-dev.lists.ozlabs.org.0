Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9BB3D259
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 18:37:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NbJW60TrzDqqY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 02:37:31 +1000 (AEST)
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
 header.b="gyjzOdFj"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXlZ075dzDqSl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:42:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eRYqrBdA83ELJwzehQp5ACnwy4+Ii18V3bNuC63QHNg=; b=gyjzOdFjX2Hc07Fw3ofnTYcH1V
 4motr276Y/b+VWeq+PJMXx+r8fzS5ixUMH8KzPOTBCwRPmWWvyi52ti5GBX2fi5EAvr1apreGQjxn
 gF2YXCRf/RJYs1iu0i28vAyitkrJPd3TGl5GmOX6bpzaMXee/5BOspGVUTsI63qNWTGuEX3DrIo02
 KFBHJaCrQiVe1nxb+CkKluXla2IExJuZRuxtU+WvON5pJTvvjJojqE9/+MhkQC8ZKJv5UDK5EYwmU
 Srstwn4NGlvjlOwDSPHxhZW7Hm2f+wGyT1yk20gBUnkms/ozNmJEKv5vcWFuLgm6cYJ24W/8srhis
 AnP8HaGQ==;
Received: from mpp-cp1-natpool-1-037.ethz.ch ([82.130.71.37] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hahyF-000665-83; Tue, 11 Jun 2019 14:41:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 16/16] mm: pass get_user_pages_fast iterator arguments in a
 structure
Date: Tue, 11 Jun 2019 16:41:02 +0200
Message-Id: <20190611144102.8848-17-hch@lst.de>
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

Instead of passing a set of always repeated arguments down the
get_user_pages_fast iterators, create a struct gup_args to hold them and
pass that by reference.  This leads to an over 100 byte .text size
reduction for x86-64.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/gup.c | 338 ++++++++++++++++++++++++++-----------------------------
 1 file changed, 158 insertions(+), 180 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 8bcc042f933a..419a565fc998 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -24,6 +24,13 @@
 
 #include "internal.h"
 
+struct gup_args {
+	unsigned long		addr;
+	unsigned int		flags;
+	struct page		**pages;
+	unsigned int		nr;
+};
+
 struct follow_page_context {
 	struct dev_pagemap *pgmap;
 	unsigned int page_mask;
@@ -1786,10 +1793,10 @@ static inline pte_t gup_get_pte(pte_t *ptep)
 }
 #endif /* CONFIG_GUP_GET_PTE_LOW_HIGH */
 
-static void undo_dev_pagemap(int *nr, int nr_start, struct page **pages)
+static void undo_dev_pagemap(struct gup_args *args, int nr_start)
 {
-	while ((*nr) - nr_start) {
-		struct page *page = pages[--(*nr)];
+	while (args->nr - nr_start) {
+		struct page *page = args->pages[--args->nr];
 
 		ClearPageReferenced(page);
 		put_page(page);
@@ -1811,14 +1818,13 @@ static inline struct page *try_get_compound_head(struct page *page, int refs)
 }
 
 #ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
-static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
-			 unsigned int flags, struct page **pages, int *nr)
+static int gup_pte_range(struct gup_args *args, pmd_t pmd, unsigned long end)
 {
 	struct dev_pagemap *pgmap = NULL;
-	int nr_start = *nr, ret = 0;
+	int nr_start = args->nr, ret = 0;
 	pte_t *ptep, *ptem;
 
-	ptem = ptep = pte_offset_map(&pmd, addr);
+	ptem = ptep = pte_offset_map(&pmd, args->addr);
 	do {
 		pte_t pte = gup_get_pte(ptep);
 		struct page *head, *page;
@@ -1830,16 +1836,16 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
 		if (pte_protnone(pte))
 			goto pte_unmap;
 
-		if (!pte_access_permitted(pte, flags & FOLL_WRITE))
+		if (!pte_access_permitted(pte, args->flags & FOLL_WRITE))
 			goto pte_unmap;
 
 		if (pte_devmap(pte)) {
-			if (unlikely(flags & FOLL_LONGTERM))
+			if (unlikely(args->flags & FOLL_LONGTERM))
 				goto pte_unmap;
 
 			pgmap = get_dev_pagemap(pte_pfn(pte), pgmap);
 			if (unlikely(!pgmap)) {
-				undo_dev_pagemap(nr, nr_start, pages);
+				undo_dev_pagemap(args, nr_start);
 				goto pte_unmap;
 			}
 		} else if (pte_special(pte))
@@ -1860,10 +1866,8 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
 		VM_BUG_ON_PAGE(compound_head(page) != head, page);
 
 		SetPageReferenced(page);
-		pages[*nr] = page;
-		(*nr)++;
-
-	} while (ptep++, addr += PAGE_SIZE, addr != end);
+		args->pages[args->nr++] = page;
+	} while (ptep++, args->addr += PAGE_SIZE, args->addr != end);
 
 	ret = 1;
 
@@ -1884,18 +1888,17 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
  * __get_user_pages_fast implementation that can pin pages. Thus it's still
  * useful to have gup_huge_pmd even if we can't operate on ptes.
  */
-static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
-			 unsigned int flags, struct page **pages, int *nr)
+static int gup_pte_range(struct gup_args *args, pmd_t pmd, unsigned long end)
 {
 	return 0;
 }
 #endif /* CONFIG_ARCH_HAS_PTE_SPECIAL */
 
 #if defined(__HAVE_ARCH_PTE_DEVMAP) && defined(CONFIG_TRANSPARENT_HUGEPAGE)
-static int __gup_device_huge(unsigned long pfn, unsigned long addr,
-		unsigned long end, struct page **pages, int *nr)
+static int __gup_device_huge(struct gup_args *args, unsigned long pfn,
+		unsigned long end)
 {
-	int nr_start = *nr;
+	int nr_start = args->nr;
 	struct dev_pagemap *pgmap = NULL;
 
 	do {
@@ -1903,64 +1906,63 @@ static int __gup_device_huge(unsigned long pfn, unsigned long addr,
 
 		pgmap = get_dev_pagemap(pfn, pgmap);
 		if (unlikely(!pgmap)) {
-			undo_dev_pagemap(nr, nr_start, pages);
+			undo_dev_pagemap(args, nr_start);
 			return 0;
 		}
 		SetPageReferenced(page);
-		pages[*nr] = page;
+		args->pages[args->nr++] = page;
 		get_page(page);
-		(*nr)++;
 		pfn++;
-	} while (addr += PAGE_SIZE, addr != end);
+	} while (args->addr += PAGE_SIZE, args->addr != end);
 
 	if (pgmap)
 		put_dev_pagemap(pgmap);
 	return 1;
 }
 
-static int __gup_device_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
-		unsigned long end, struct page **pages, int *nr)
+static int __gup_device_huge_pmd(struct gup_args *args, pmd_t orig, pmd_t *pmdp,
+		unsigned long end)
 {
 	unsigned long fault_pfn;
-	int nr_start = *nr;
+	int nr_start = args->nr;
 
-	fault_pfn = pmd_pfn(orig) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
-	if (!__gup_device_huge(fault_pfn, addr, end, pages, nr))
+	fault_pfn = pmd_pfn(orig) + ((args->addr & ~PMD_MASK) >> PAGE_SHIFT);
+	if (!__gup_device_huge(args, fault_pfn, end))
 		return 0;
 
 	if (unlikely(pmd_val(orig) != pmd_val(*pmdp))) {
-		undo_dev_pagemap(nr, nr_start, pages);
+		undo_dev_pagemap(args, nr_start);
 		return 0;
 	}
 	return 1;
 }
 
-static int __gup_device_huge_pud(pud_t orig, pud_t *pudp, unsigned long addr,
-		unsigned long end, struct page **pages, int *nr)
+static int __gup_device_huge_pud(struct gup_args *args, pud_t orig, pud_t *pudp,
+		unsigned long end)
 {
 	unsigned long fault_pfn;
-	int nr_start = *nr;
+	int nr_start = args->nr;
 
-	fault_pfn = pud_pfn(orig) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
-	if (!__gup_device_huge(fault_pfn, addr, end, pages, nr))
+	fault_pfn = pud_pfn(orig) + ((args->addr & ~PUD_MASK) >> PAGE_SHIFT);
+	if (!__gup_device_huge(args, fault_pfn, end))
 		return 0;
 
 	if (unlikely(pud_val(orig) != pud_val(*pudp))) {
-		undo_dev_pagemap(nr, nr_start, pages);
+		undo_dev_pagemap(args, nr_start);
 		return 0;
 	}
 	return 1;
 }
 #else
-static int __gup_device_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
-		unsigned long end, struct page **pages, int *nr)
+static int __gup_device_huge_pmd(struct gup_args *args, pmd_t orig, pmd_t *pmdp,
+		unsigned long end)
 {
 	BUILD_BUG();
 	return 0;
 }
 
-static int __gup_device_huge_pud(pud_t pud, pud_t *pudp, unsigned long addr,
-		unsigned long end, struct page **pages, int *nr)
+static int __gup_device_huge_pud(struct gup_args *args, pud_t pud, pud_t *pudp,
+		unsigned long end)
 {
 	BUILD_BUG();
 	return 0;
@@ -1975,21 +1977,21 @@ static unsigned long hugepte_addr_end(unsigned long addr, unsigned long end,
 	return (__boundary - 1 < end - 1) ? __boundary : end;
 }
 
-static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
-		       unsigned long end, int write, struct page **pages, int *nr)
+static int gup_hugepte(struct gup_args *args, pte_t *ptep, unsigned long sz,
+		unsigned long end)
 {
 	unsigned long pte_end;
 	struct page *head, *page;
 	pte_t pte;
 	int refs;
 
-	pte_end = (addr + sz) & ~(sz-1);
+	pte_end = (args->addr + sz) & ~(sz - 1);
 	if (pte_end < end)
 		end = pte_end;
 
 	pte = READ_ONCE(*ptep);
 
-	if (!pte_access_permitted(pte, write))
+	if (!pte_access_permitted(pte, args->flags & FOLL_WRITE))
 		return 0;
 
 	/* hugepages are never "special" */
@@ -1998,24 +2000,23 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 	refs = 0;
 	head = pte_page(pte);
 
-	page = head + ((addr & (sz-1)) >> PAGE_SHIFT);
+	page = head + ((args->addr & (sz - 1)) >> PAGE_SHIFT);
 	do {
 		VM_BUG_ON(compound_head(page) != head);
-		pages[*nr] = page;
-		(*nr)++;
+		args->pages[args->nr++] = page;
 		page++;
 		refs++;
-	} while (addr += PAGE_SIZE, addr != end);
+	} while (args->addr += PAGE_SIZE, args->addr != end);
 
 	head = try_get_compound_head(head, refs);
 	if (!head) {
-		*nr -= refs;
+		args->nr -= refs;
 		return 0;
 	}
 
 	if (unlikely(pte_val(pte) != pte_val(*ptep))) {
 		/* Could be optimized better */
-		*nr -= refs;
+		args->nr -= refs;
 		while (refs--)
 			put_page(head);
 		return 0;
@@ -2025,64 +2026,61 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 	return 1;
 }
 
-static int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
-		unsigned int pdshift, unsigned long end, int write,
-		struct page **pages, int *nr)
+static int gup_huge_pd(struct gup_args *args, hugepd_t hugepd, unsigned pdshift,
+		unsigned long end)
 {
 	pte_t *ptep;
 	unsigned long sz = 1UL << hugepd_shift(hugepd);
 	unsigned long next;
 
-	ptep = hugepte_offset(hugepd, addr, pdshift);
+	ptep = hugepte_offset(hugepd, args->addr, pdshift);
 	do {
-		next = hugepte_addr_end(addr, end, sz);
-		if (!gup_hugepte(ptep, sz, addr, end, write, pages, nr))
+		next = hugepte_addr_end(args->addr, end, sz);
+		if (!gup_hugepte(args, ptep, sz, next))
 			return 0;
-	} while (ptep++, addr = next, addr != end);
+	} while (ptep++, args->addr != end);
 
 	return 1;
 }
 #else
-static inline int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
-		unsigned pdshift, unsigned long end, int write,
-		struct page **pages, int *nr)
+static inline int gup_huge_pd(struct gup_args *args, hugepd_t hugepd,
+		unsigned pdshift, unsigned long end)
 {
 	return 0;
 }
 #endif /* CONFIG_ARCH_HAS_HUGEPD */
 
-static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
-		unsigned long end, unsigned int flags, struct page **pages, int *nr)
+static int gup_huge_pmd(struct gup_args *args, pmd_t orig, pmd_t *pmdp,
+		unsigned long end)
 {
 	struct page *head, *page;
 	int refs;
 
-	if (!pmd_access_permitted(orig, flags & FOLL_WRITE))
+	if (!pmd_access_permitted(orig, args->flags & FOLL_WRITE))
 		return 0;
 
 	if (pmd_devmap(orig)) {
-		if (unlikely(flags & FOLL_LONGTERM))
+		if (unlikely(args->flags & FOLL_LONGTERM))
 			return 0;
-		return __gup_device_huge_pmd(orig, pmdp, addr, end, pages, nr);
+		return __gup_device_huge_pmd(args, orig, pmdp, end);
 	}
 
 	refs = 0;
-	page = pmd_page(orig) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
+	page = pmd_page(orig) + ((args->addr & ~PMD_MASK) >> PAGE_SHIFT);
 	do {
-		pages[*nr] = page;
-		(*nr)++;
+		args->pages[args->nr++] = page;
 		page++;
 		refs++;
-	} while (addr += PAGE_SIZE, addr != end);
+	} while (args->addr += PAGE_SIZE, args->addr != end);
 
 	head = try_get_compound_head(pmd_page(orig), refs);
 	if (!head) {
-		*nr -= refs;
+		args->nr -= refs;
 		return 0;
 	}
 
 	if (unlikely(pmd_val(orig) != pmd_val(*pmdp))) {
-		*nr -= refs;
+		args->nr -= refs;
 		while (refs--)
 			put_page(head);
 		return 0;
@@ -2092,38 +2090,37 @@ static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
 	return 1;
 }
 
-static int gup_huge_pud(pud_t orig, pud_t *pudp, unsigned long addr,
-		unsigned long end, unsigned int flags, struct page **pages, int *nr)
+static int gup_huge_pud(struct gup_args *args, pud_t orig, pud_t *pudp,
+		unsigned long end)
 {
 	struct page *head, *page;
 	int refs;
 
-	if (!pud_access_permitted(orig, flags & FOLL_WRITE))
+	if (!pud_access_permitted(orig, args->flags & FOLL_WRITE))
 		return 0;
 
 	if (pud_devmap(orig)) {
-		if (unlikely(flags & FOLL_LONGTERM))
+		if (unlikely(args->flags & FOLL_LONGTERM))
 			return 0;
-		return __gup_device_huge_pud(orig, pudp, addr, end, pages, nr);
+		return __gup_device_huge_pud(args, orig, pudp, end);
 	}
 
 	refs = 0;
-	page = pud_page(orig) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
+	page = pud_page(orig) + ((args->addr & ~PUD_MASK) >> PAGE_SHIFT);
 	do {
-		pages[*nr] = page;
-		(*nr)++;
+		args->pages[args->nr++] = page;
 		page++;
 		refs++;
-	} while (addr += PAGE_SIZE, addr != end);
+	} while (args->addr += PAGE_SIZE, args->addr != end);
 
 	head = try_get_compound_head(pud_page(orig), refs);
 	if (!head) {
-		*nr -= refs;
+		args->nr -= refs;
 		return 0;
 	}
 
 	if (unlikely(pud_val(orig) != pud_val(*pudp))) {
-		*nr -= refs;
+		args->nr -= refs;
 		while (refs--)
 			put_page(head);
 		return 0;
@@ -2133,34 +2130,32 @@ static int gup_huge_pud(pud_t orig, pud_t *pudp, unsigned long addr,
 	return 1;
 }
 
-static int gup_huge_pgd(pgd_t orig, pgd_t *pgdp, unsigned long addr,
-			unsigned long end, unsigned int flags,
-			struct page **pages, int *nr)
+static int gup_huge_pgd(struct gup_args *args, pgd_t orig, pgd_t *pgdp,
+		unsigned long end)
 {
-	int refs;
 	struct page *head, *page;
+	int refs;
 
-	if (!pgd_access_permitted(orig, flags & FOLL_WRITE))
+	if (!pgd_access_permitted(orig, args->flags & FOLL_WRITE))
 		return 0;
 
 	BUILD_BUG_ON(pgd_devmap(orig));
 	refs = 0;
-	page = pgd_page(orig) + ((addr & ~PGDIR_MASK) >> PAGE_SHIFT);
+	page = pgd_page(orig) + ((args->addr & ~PGDIR_MASK) >> PAGE_SHIFT);
 	do {
-		pages[*nr] = page;
-		(*nr)++;
+		args->pages[args->nr++] = page;
 		page++;
 		refs++;
-	} while (addr += PAGE_SIZE, addr != end);
+	} while (args->addr += PAGE_SIZE, args->addr != end);
 
 	head = try_get_compound_head(pgd_page(orig), refs);
 	if (!head) {
-		*nr -= refs;
+		args->nr -= refs;
 		return 0;
 	}
 
 	if (unlikely(pgd_val(orig) != pgd_val(*pgdp))) {
-		*nr -= refs;
+		args->nr -= refs;
 		while (refs--)
 			put_page(head);
 		return 0;
@@ -2170,17 +2165,16 @@ static int gup_huge_pgd(pgd_t orig, pgd_t *pgdp, unsigned long addr,
 	return 1;
 }
 
-static int gup_pmd_range(pud_t pud, unsigned long addr, unsigned long end,
-		unsigned int flags, struct page **pages, int *nr)
+static int gup_pmd_range(struct gup_args *args, pud_t pud, unsigned long end)
 {
 	unsigned long next;
 	pmd_t *pmdp;
 
-	pmdp = pmd_offset(&pud, addr);
+	pmdp = pmd_offset(&pud, args->addr);
 	do {
 		pmd_t pmd = READ_ONCE(*pmdp);
 
-		next = pmd_addr_end(addr, end);
+		next = pmd_addr_end(args->addr, end);
 		if (!pmd_present(pmd))
 			return 0;
 
@@ -2194,8 +2188,7 @@ static int gup_pmd_range(pud_t pud, unsigned long addr, unsigned long end,
 			if (pmd_protnone(pmd))
 				return 0;
 
-			if (!gup_huge_pmd(pmd, pmdp, addr, next, flags,
-				pages, nr))
+			if (!gup_huge_pmd(args, pmd, pmdp, next))
 				return 0;
 
 		} else if (unlikely(is_hugepd(__hugepd(pmd_val(pmd))))) {
@@ -2203,93 +2196,88 @@ static int gup_pmd_range(pud_t pud, unsigned long addr, unsigned long end,
 			 * architecture have different format for hugetlbfs
 			 * pmd format and THP pmd format
 			 */
-			if (!gup_huge_pd(__hugepd(pmd_val(pmd)), addr,
-					 PMD_SHIFT, next, flags, pages, nr))
+			if (!gup_huge_pd(args, __hugepd(pmd_val(pmd)),
+					PMD_SHIFT, next))
 				return 0;
-		} else if (!gup_pte_range(pmd, addr, next, flags, pages, nr))
+		} else if (!gup_pte_range(args, pmd, next))
 			return 0;
-	} while (pmdp++, addr = next, addr != end);
+	} while (pmdp++, args->addr != end);
 
 	return 1;
 }
 
-static int gup_pud_range(p4d_t p4d, unsigned long addr, unsigned long end,
-			 unsigned int flags, struct page **pages, int *nr)
+static int gup_pud_range(struct gup_args *args, p4d_t p4d, unsigned long end)
 {
 	unsigned long next;
 	pud_t *pudp;
 
-	pudp = pud_offset(&p4d, addr);
+	pudp = pud_offset(&p4d, args->addr);
 	do {
 		pud_t pud = READ_ONCE(*pudp);
 
-		next = pud_addr_end(addr, end);
+		next = pud_addr_end(args->addr, end);
 		if (pud_none(pud))
 			return 0;
 		if (unlikely(pud_huge(pud))) {
-			if (!gup_huge_pud(pud, pudp, addr, next, flags,
-					  pages, nr))
+			if (!gup_huge_pud(args, pud, pudp, next))
 				return 0;
 		} else if (unlikely(is_hugepd(__hugepd(pud_val(pud))))) {
-			if (!gup_huge_pd(__hugepd(pud_val(pud)), addr,
-					 PUD_SHIFT, next, flags, pages, nr))
+			if (!gup_huge_pd(args, __hugepd(pud_val(pud)),
+					PUD_SHIFT, next))
 				return 0;
-		} else if (!gup_pmd_range(pud, addr, next, flags, pages, nr))
+		} else if (!gup_pmd_range(args, pud, next))
 			return 0;
-	} while (pudp++, addr = next, addr != end);
+	} while (pudp++, args->addr != end);
 
 	return 1;
 }
 
-static int gup_p4d_range(pgd_t pgd, unsigned long addr, unsigned long end,
-			 unsigned int flags, struct page **pages, int *nr)
+static int gup_p4d_range(struct gup_args *args, pgd_t pgd, unsigned long end)
 {
 	unsigned long next;
 	p4d_t *p4dp;
 
-	p4dp = p4d_offset(&pgd, addr);
+	p4dp = p4d_offset(&pgd, args->addr);
 	do {
 		p4d_t p4d = READ_ONCE(*p4dp);
 
-		next = p4d_addr_end(addr, end);
+		next = p4d_addr_end(args->addr, end);
 		if (p4d_none(p4d))
 			return 0;
 		BUILD_BUG_ON(p4d_huge(p4d));
 		if (unlikely(is_hugepd(__hugepd(p4d_val(p4d))))) {
-			if (!gup_huge_pd(__hugepd(p4d_val(p4d)), addr,
-					 P4D_SHIFT, next, flags, pages, nr))
+			if (!gup_huge_pd(args, __hugepd(p4d_val(p4d)),
+					P4D_SHIFT, next))
 				return 0;
-		} else if (!gup_pud_range(p4d, addr, next, flags, pages, nr))
+		} else if (!gup_pud_range(args, p4d, next))
 			return 0;
-	} while (p4dp++, addr = next, addr != end);
+	} while (p4dp++, args->addr != end);
 
 	return 1;
 }
 
-static void gup_pgd_range(unsigned long addr, unsigned long end,
-		unsigned int flags, struct page **pages, int *nr)
+static void gup_pgd_range(struct gup_args *args, unsigned long end)
 {
 	unsigned long next;
 	pgd_t *pgdp;
 
-	pgdp = pgd_offset(current->mm, addr);
+	pgdp = pgd_offset(current->mm, args->addr);
 	do {
 		pgd_t pgd = READ_ONCE(*pgdp);
 
-		next = pgd_addr_end(addr, end);
+		next = pgd_addr_end(args->addr, end);
 		if (pgd_none(pgd))
 			return;
 		if (unlikely(pgd_huge(pgd))) {
-			if (!gup_huge_pgd(pgd, pgdp, addr, next, flags,
-					  pages, nr))
+			if (!gup_huge_pgd(args, pgd, pgdp, next))
 				return;
 		} else if (unlikely(is_hugepd(__hugepd(pgd_val(pgd))))) {
-			if (!gup_huge_pd(__hugepd(pgd_val(pgd)), addr,
-					 PGDIR_SHIFT, next, flags, pages, nr))
+			if (!gup_huge_pd(args, __hugepd(pgd_val(pgd)),
+					PGDIR_SHIFT, next))
 				return;
-		} else if (!gup_p4d_range(pgd, addr, next, flags, pages, nr))
+		} else if (!gup_p4d_range(args, pgd, next))
 			return;
-	} while (pgdp++, addr = next, addr != end);
+	} while (pgdp++, args->addr != end);
 }
 #else
 static inline void gup_pgd_range(unsigned long addr, unsigned long end,
@@ -2321,17 +2309,18 @@ static bool gup_fast_permitted(unsigned long start, unsigned long end)
 int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
 			  struct page **pages)
 {
-	unsigned long len, end;
+	struct gup_args args = {
+		.addr	= untagged_addr(start) & PAGE_MASK,
+		.flags	= write ? FOLL_WRITE : 0,
+		.pages	= pages,
+	};
+	unsigned long len = (unsigned long)nr_pages << PAGE_SHIFT;
+	unsigned long end = args.addr + len;
 	unsigned long flags;
-	int nr = 0;
-
-	start = untagged_addr(start) & PAGE_MASK;
-	len = (unsigned long) nr_pages << PAGE_SHIFT;
-	end = start + len;
 
-	if (end <= start)
+	if (end <= args.addr)
 		return 0;
-	if (unlikely(!access_ok((void __user *)start, len)))
+	if (unlikely(!access_ok((void __user *)args.addr, len)))
 		return 0;
 
 	/*
@@ -2345,38 +2334,42 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
 	 * We do not adopt an rcu_read_lock(.) here as we also want to
 	 * block IPIs that come from THPs splitting.
 	 */
-
-	if (gup_fast_permitted(start, end)) {
+	if (gup_fast_permitted(args.addr, end)) {
 		local_irq_save(flags);
-		gup_pgd_range(start, end, write ? FOLL_WRITE : 0, pages, &nr);
+		gup_pgd_range(&args, end);
 		local_irq_restore(flags);
 	}
 
-	return nr;
+	return args.nr;
 }
 EXPORT_SYMBOL_GPL(__get_user_pages_fast);
 
-static int __gup_longterm_unlocked(unsigned long start, int nr_pages,
-				   unsigned int gup_flags, struct page **pages)
+static int get_user_pages_fallback(struct gup_args *args, int nr_pages)
 {
+	struct page **pages = args->pages + args->nr;
 	int ret;
 
+	nr_pages -= args->nr;
+
 	/*
 	 * FIXME: FOLL_LONGTERM does not work with
 	 * get_user_pages_unlocked() (see comments in that function)
 	 */
-	if (gup_flags & FOLL_LONGTERM) {
+	if (args->flags & FOLL_LONGTERM) {
 		down_read(&current->mm->mmap_sem);
 		ret = __gup_longterm_locked(current, current->mm,
-					    start, nr_pages,
-					    pages, NULL, gup_flags);
+					    args->addr, nr_pages,
+					    pages, NULL, args->flags);
 		up_read(&current->mm->mmap_sem);
 	} else {
-		ret = get_user_pages_unlocked(start, nr_pages,
-					      pages, gup_flags);
+		ret = get_user_pages_unlocked(args->addr, nr_pages, pages,
+					      args->flags);
 	}
 
-	return ret;
+	/* Have to be a bit careful with return values */
+	if (ret > 0)
+		args->nr += ret;
+	return args->nr ? args->nr : ret;
 }
 
 /**
@@ -2398,46 +2391,31 @@ static int __gup_longterm_unlocked(unsigned long start, int nr_pages,
 int get_user_pages_fast(unsigned long start, int nr_pages,
 			unsigned int gup_flags, struct page **pages)
 {
-	unsigned long addr, len, end;
-	int nr = 0, ret = 0;
+	struct gup_args args = {
+		.addr	= untagged_addr(start) & PAGE_MASK,
+		.flags	= gup_flags,
+		.pages	= pages,
+	};
+	unsigned long len = (unsigned long)nr_pages << PAGE_SHIFT;
+	unsigned long end = args.addr + len;
 
 	if (WARN_ON_ONCE(gup_flags & ~(FOLL_WRITE | FOLL_LONGTERM)))
 		return -EINVAL;
 
-	start = untagged_addr(start) & PAGE_MASK;
-	addr = start;
-	len = (unsigned long) nr_pages << PAGE_SHIFT;
-	end = start + len;
-
-	if (end <= start)
+	if (end <= args.addr)
 		return 0;
-	if (unlikely(!access_ok((void __user *)start, len)))
+	if (unlikely(!access_ok((void __user *)args.addr, len)))
 		return -EFAULT;
 
-	if (gup_fast_permitted(start, end)) {
+	if (gup_fast_permitted(args.addr, end)) {
 		local_irq_disable();
-		gup_pgd_range(addr, end, gup_flags, pages, &nr);
+		gup_pgd_range(&args, end);
 		local_irq_enable();
-		ret = nr;
-	}
-
-	if (nr < nr_pages) {
-		/* Try to get the remaining pages with get_user_pages */
-		start += nr << PAGE_SHIFT;
-		pages += nr;
-
-		ret = __gup_longterm_unlocked(start, nr_pages - nr,
-					      gup_flags, pages);
-
-		/* Have to be a bit careful with return values */
-		if (nr > 0) {
-			if (ret < 0)
-				ret = nr;
-			else
-				ret += nr;
-		}
 	}
 
-	return ret;
+	/* Try to get the remaining pages with get_user_pages */
+	if (args.nr < nr_pages)
+		return get_user_pages_fallback(&args, nr_pages);
+	return args.nr;
 }
 EXPORT_SYMBOL_GPL(get_user_pages_fast);
-- 
2.20.1

