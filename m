Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF9C31A7F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2019 10:12:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45GDZj6LZkzDqY1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2019 18:12:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+47bfdebe920718d2a071+5760+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="uhSG68q8"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45GD5r1fj3zDqc1
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2019 17:51:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QLcekuKrvOI4dWVXNCuVhJniXqHoxP9REgAQe9/06L0=; b=uhSG68q8OhBN4rQ9TINYT+2WPP
 g8PywO2smdNlf80VMfpmdvNndfBRIs9vrNH2dnkNXyDJYZD82r3apjxyHGT0wtlzs+mr9gE9clc/U
 eUdAzXGd6OpEWix0e6G8QQUBNn26YJ7x9OBKzLLcY3XbVCqxraRLD39b4MQqnJ6xWuo3dmylNM6Bi
 HtpkTUeZh6Xan3Ciiw91K0eoEXlZLlI9X/dJOsqYPXb6klqTght0D+2c7AfYOu8z/yDuO3b4oVF9k
 fpEi1421seOuX0irCDasaXYfPwIdSmf5uFHU9z7H17mkv60tjc3isHNpZqLdW05EcpOxd+o24PC+S
 eJxJiqKw==;
Received: from 217-76-161-89.static.highway.a1.net ([217.76.161.89]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWyn4-0007qX-Gh; Sat, 01 Jun 2019 07:50:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 14/16] mm: move the powerpc hugepd code to mm/gup.c
Date: Sat,  1 Jun 2019 09:49:57 +0200
Message-Id: <20190601074959.14036-15-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601074959.14036-1-hch@lst.de>
References: <20190601074959.14036-1-hch@lst.de>
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

While only powerpc supports the hugepd case, the code is pretty
generic and I'd like to keep all GUP internals in one place.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/Kconfig          |  1 +
 arch/powerpc/mm/hugetlbpage.c | 72 ------------------------------
 include/linux/hugetlb.h       | 18 --------
 mm/Kconfig                    | 10 +++++
 mm/gup.c                      | 82 +++++++++++++++++++++++++++++++++++
 5 files changed, 93 insertions(+), 90 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 992a04796e56..4f1b00979cde 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -125,6 +125,7 @@ config PPC
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_HUGEPD			if HUGETLB_PAGE
 	select ARCH_HAS_MMIOWB			if PPC64
 	select ARCH_HAS_PHYS_TO_DMA
 	select ARCH_HAS_PMEM_API                if PPC64
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index b5d92dc32844..51716c11d0fb 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -511,13 +511,6 @@ struct page *follow_huge_pd(struct vm_area_struct *vma,
 	return page;
 }
 
-static unsigned long hugepte_addr_end(unsigned long addr, unsigned long end,
-				      unsigned long sz)
-{
-	unsigned long __boundary = (addr + sz) & ~(sz-1);
-	return (__boundary - 1 < end - 1) ? __boundary : end;
-}
-
 #ifdef CONFIG_PPC_MM_SLICES
 unsigned long hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 					unsigned long len, unsigned long pgoff,
@@ -665,68 +658,3 @@ void flush_dcache_icache_hugepage(struct page *page)
 		}
 	}
 }
-
-static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
-		       unsigned long end, int write, struct page **pages, int *nr)
-{
-	unsigned long pte_end;
-	struct page *head, *page;
-	pte_t pte;
-	int refs;
-
-	pte_end = (addr + sz) & ~(sz-1);
-	if (pte_end < end)
-		end = pte_end;
-
-	pte = READ_ONCE(*ptep);
-
-	if (!pte_access_permitted(pte, write))
-		return 0;
-
-	/* hugepages are never "special" */
-	VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
-
-	refs = 0;
-	head = pte_page(pte);
-
-	page = head + ((addr & (sz-1)) >> PAGE_SHIFT);
-	do {
-		VM_BUG_ON(compound_head(page) != head);
-		pages[*nr] = page;
-		(*nr)++;
-		page++;
-		refs++;
-	} while (addr += PAGE_SIZE, addr != end);
-
-	if (!page_cache_add_speculative(head, refs)) {
-		*nr -= refs;
-		return 0;
-	}
-
-	if (unlikely(pte_val(pte) != pte_val(*ptep))) {
-		/* Could be optimized better */
-		*nr -= refs;
-		while (refs--)
-			put_page(head);
-		return 0;
-	}
-
-	return 1;
-}
-
-int gup_huge_pd(hugepd_t hugepd, unsigned long addr, unsigned int pdshift,
-		unsigned long end, int write, struct page **pages, int *nr)
-{
-	pte_t *ptep;
-	unsigned long sz = 1UL << hugepd_shift(hugepd);
-	unsigned long next;
-
-	ptep = hugepte_offset(hugepd, addr, pdshift);
-	do {
-		next = hugepte_addr_end(addr, end, sz);
-		if (!gup_hugepte(ptep, sz, addr, end, write, pages, nr))
-			return 0;
-	} while (ptep++, addr = next, addr != end);
-
-	return 1;
-}
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index edf476c8cfb9..0f91761e2c53 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -16,29 +16,11 @@ struct user_struct;
 struct mmu_gather;
 
 #ifndef is_hugepd
-/*
- * Some architectures requires a hugepage directory format that is
- * required to support multiple hugepage sizes. For example
- * a4fe3ce76 "powerpc/mm: Allow more flexible layouts for hugepage pagetables"
- * introduced the same on powerpc. This allows for a more flexible hugepage
- * pagetable layout.
- */
 typedef struct { unsigned long pd; } hugepd_t;
 #define is_hugepd(hugepd) (0)
 #define __hugepd(x) ((hugepd_t) { (x) })
-static inline int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
-			      unsigned pdshift, unsigned long end,
-			      int write, struct page **pages, int *nr)
-{
-	return 0;
-}
-#else
-extern int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
-		       unsigned pdshift, unsigned long end,
-		       int write, struct page **pages, int *nr);
 #endif
 
-
 #ifdef CONFIG_HUGETLB_PAGE
 
 #include <linux/mempolicy.h>
diff --git a/mm/Kconfig b/mm/Kconfig
index 5c41409557da..44be3f01a2b2 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -769,4 +769,14 @@ config GUP_GET_PTE_LOW_HIGH
 config ARCH_HAS_PTE_SPECIAL
 	bool
 
+#
+# Some architectures require a special hugepage directory format that is
+# required to support multiple hugepage sizes. For example a4fe3ce76
+# "powerpc/mm: Allow more flexible layouts for hugepage pagetables"
+# introduced it on powerpc.  This allows for a more flexible hugepage
+# pagetable layouts.
+#
+config ARCH_HAS_HUGEPD
+	bool
+
 endmenu
diff --git a/mm/gup.c b/mm/gup.c
index 53b50c63ba51..e03c7e6b1422 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1966,6 +1966,88 @@ static int __gup_device_huge_pud(pud_t pud, pud_t *pudp, unsigned long addr,
 }
 #endif
 
+#ifdef CONFIG_ARCH_HAS_HUGEPD
+static unsigned long hugepte_addr_end(unsigned long addr, unsigned long end,
+				      unsigned long sz)
+{
+	unsigned long __boundary = (addr + sz) & ~(sz-1);
+	return (__boundary - 1 < end - 1) ? __boundary : end;
+}
+
+static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
+		       unsigned long end, int write, struct page **pages, int *nr)
+{
+	unsigned long pte_end;
+	struct page *head, *page;
+	pte_t pte;
+	int refs;
+
+	pte_end = (addr + sz) & ~(sz-1);
+	if (pte_end < end)
+		end = pte_end;
+
+	pte = READ_ONCE(*ptep);
+
+	if (!pte_access_permitted(pte, write))
+		return 0;
+
+	/* hugepages are never "special" */
+	VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
+
+	refs = 0;
+	head = pte_page(pte);
+
+	page = head + ((addr & (sz-1)) >> PAGE_SHIFT);
+	do {
+		VM_BUG_ON(compound_head(page) != head);
+		pages[*nr] = page;
+		(*nr)++;
+		page++;
+		refs++;
+	} while (addr += PAGE_SIZE, addr != end);
+
+	if (!page_cache_add_speculative(head, refs)) {
+		*nr -= refs;
+		return 0;
+	}
+
+	if (unlikely(pte_val(pte) != pte_val(*ptep))) {
+		/* Could be optimized better */
+		*nr -= refs;
+		while (refs--)
+			put_page(head);
+		return 0;
+	}
+
+	return 1;
+}
+
+static int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
+		unsigned int pdshift, unsigned long end, int write,
+		struct page **pages, int *nr)
+{
+	pte_t *ptep;
+	unsigned long sz = 1UL << hugepd_shift(hugepd);
+	unsigned long next;
+
+	ptep = hugepte_offset(hugepd, addr, pdshift);
+	do {
+		next = hugepte_addr_end(addr, end, sz);
+		if (!gup_hugepte(ptep, sz, addr, end, write, pages, nr))
+			return 0;
+	} while (ptep++, addr = next, addr != end);
+
+	return 1;
+}
+#else
+static inline int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
+		unsigned pdshift, unsigned long end, int write,
+		struct page **pages, int *nr)
+{
+	return 0;
+}
+#endif /* CONFIG_ARCH_HAS_HUGEPD */
+
 static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
 		unsigned long end, unsigned int flags, struct page **pages, int *nr)
 {
-- 
2.20.1

