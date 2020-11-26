Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B922C542F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 13:47:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Chcx02SpCzDqjJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 23:47:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=oVIH8bqQ; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Chcpn1GlYzDqjJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 23:42:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Fho42tPj+BOCp782GkX7XYalDpP8fJ2w92UdCAMKe0s=; b=oVIH8bqQVQKDGV7DH3/60QnmQx
 WQ+V+C1y/VssoztQeJG6FzzlmAC7B2a3DsWlmKaf+NbvtzrIxx9CF5LxZjDVCE09E6fvpS5aeMJ+4
 +cpYCi1phliYW6Yh/ifTDiILfx40MBUiw6aW/ofnBjq6PIAEf+0OYTXVBQOQYfhWiN54CH3jAW6iv
 ZiJoRk+m4vbctvYsaXVblwa5vACSgF7WlZFrXHpSr6JNyjK6gbXCND++p1KX4oJGQJgBiR/n6u0Yn
 ev5Sot5+BAcUxi+bnt/u7aU8ReWP+ibPZ60rcETBacN8FFJYfkSNXjdkfAmMmZ/xJeWlltSJIInv6
 Zdu5IKqA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGbA-0002PT-Pm; Thu, 26 Nov 2020 12:42:09 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 82A6F30705A;
 Thu, 26 Nov 2020 13:42:07 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 625E8202BD18B; Thu, 26 Nov 2020 13:42:07 +0100 (CET)
Date: Thu, 26 Nov 2020 13:42:07 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 3/6] perf/core: Fix arch_perf_get_page_size()
Message-ID: <20201126124207.GM3040@hirez.programming.kicks-ass.net>
References: <20201126120114.071913521@infradead.org>
 <20201126121121.164675154@infradead.org>
 <20201126123458.GO4327@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126123458.GO4327@casper.infradead.org>
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
Cc: mark.rutland@arm.com, aneesh.kumar@linux.ibm.com,
 linux-arch@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 alexander.shishkin@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com, linux-kernel@vger.kernel.org, acme@kernel.org,
 davem@davemloft.net, dave.hansen@intel.com, ak@linux.intel.com,
 eranian@google.com, sparclinux@vger.kernel.org, jolsa@redhat.com,
 mingo@kernel.org, kirill.shutemov@linux.intel.com, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 26, 2020 at 12:34:58PM +0000, Matthew Wilcox wrote:
> On Thu, Nov 26, 2020 at 01:01:17PM +0100, Peter Zijlstra wrote:
> > The (new) page-table walker in arch_perf_get_page_size() is broken in
> > various ways. Specifically while it is used in a lockless manner, it
> > doesn't depend on CONFIG_HAVE_FAST_GUP nor uses the proper _lockless
> > offset methods, nor is careful to only read each entry only once.
> > 
> > Also the hugetlb support is broken due to calling pte_page() without
> > first checking pte_special().
> > 
> > Rewrite the whole thing to be a proper lockless page-table walker and
> > employ the new pXX_leaf_size() pgtable functions to determine the
> > pagetable size without looking at the page-frames.
> > 
> > Fixes: 51b646b2d9f8 ("perf,mm: Handle non-page-table-aligned hugetlbfs")
> > Fixes: 8d97e71811aa ("perf/core: Add PERF_SAMPLE_DATA_PAGE_SIZE")
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Tested-by: Kan Liang <kan.liang@linux.intel.com>
> > ---
> >  arch/arm64/include/asm/pgtable.h    |    3 +
> >  arch/sparc/include/asm/pgtable_64.h |   13 ++++
> >  arch/sparc/mm/hugetlbpage.c         |   19 ++++--
> >  include/linux/pgtable.h             |   16 +++++
> >  kernel/events/core.c                |  102 +++++++++++++-----------------------
> >  5 files changed, 82 insertions(+), 71 deletions(-)
> 
> This diffstat doesn't match the patch in this email ...

Urgh, no idea how I did that... I must've edited the diff and not done a
quilt-refresh. Updated below.

---
Subject: perf/core: Fix arch_perf_get_page_size()
From: Peter Zijlstra <peterz@infradead.org>
Date: Wed, 11 Nov 2020 13:43:57 +0100

The (new) page-table walker in arch_perf_get_page_size() is broken in
various ways. Specifically while it is used in a lockless manner, it
doesn't depend on CONFIG_HAVE_FAST_GUP nor uses the proper _lockless
offset methods, nor is careful to only read each entry only once.

Also the hugetlb support is broken due to calling pte_page() without
first checking pte_special().

Rewrite the whole thing to be a proper lockless page-table walker and
employ the new pXX_leaf_size() pgtable functions to determine the
pagetable size without looking at the page-frames.

Fixes: 51b646b2d9f8 ("perf,mm: Handle non-page-table-aligned hugetlbfs")
Fixes: 8d97e71811aa ("perf/core: Add PERF_SAMPLE_DATA_PAGE_SIZE")
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Tested-by: Kan Liang <kan.liang@linux.intel.com>
---
 kernel/events/core.c |  105 ++++++++++++++++++---------------------------------
 1 file changed, 39 insertions(+), 66 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -52,6 +52,7 @@
 #include <linux/mount.h>
 #include <linux/min_heap.h>
 #include <linux/highmem.h>
+#include <linux/pgtable.h>
 
 #include "internal.h"
 
@@ -7001,90 +7002,62 @@ static u64 perf_virt_to_phys(u64 virt)
 	return phys_addr;
 }
 
-#ifdef CONFIG_MMU
-
 /*
- * Return the MMU page size of a given virtual address.
- *
- * This generic implementation handles page-table aligned huge pages, as well
- * as non-page-table aligned hugetlbfs compound pages.
- *
- * If an architecture supports and uses non-page-table aligned pages in their
- * kernel mapping it will need to provide it's own implementation of this
- * function.
+ * Return the pagetable size of a given virtual address.
  */
-__weak u64 arch_perf_get_page_size(struct mm_struct *mm, unsigned long addr)
+static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
 {
-	struct page *page;
-	pgd_t *pgd;
-	p4d_t *p4d;
-	pud_t *pud;
-	pmd_t *pmd;
-	pte_t *pte;
-
-	pgd = pgd_offset(mm, addr);
-	if (pgd_none(*pgd))
-		return 0;
+	u64 size = 0;
 
-	p4d = p4d_offset(pgd, addr);
-	if (!p4d_present(*p4d))
+#ifdef CONFIG_HAVE_FAST_GUP
+	pgd_t *pgdp, pgd;
+	p4d_t *p4dp, p4d;
+	pud_t *pudp, pud;
+	pmd_t *pmdp, pmd;
+	pte_t *ptep, pte;
+
+	pgdp = pgd_offset(mm, addr);
+	pgd = READ_ONCE(*pgdp);
+	if (pgd_none(pgd))
 		return 0;
 
-	if (p4d_leaf(*p4d))
-		return 1ULL << P4D_SHIFT;
+	if (pgd_leaf(pgd))
+		return pgd_leaf_size(pgd);
 
-	pud = pud_offset(p4d, addr);
-	if (!pud_present(*pud))
+	p4dp = p4d_offset_lockless(pgdp, pgd, addr);
+	p4d = READ_ONCE(*p4dp);
+	if (!p4d_present(p4d))
 		return 0;
 
-	if (pud_leaf(*pud)) {
-#ifdef pud_page
-		page = pud_page(*pud);
-		if (PageHuge(page))
-			return page_size(compound_head(page));
-#endif
-		return 1ULL << PUD_SHIFT;
-	}
+	if (p4d_leaf(p4d))
+		return p4d_leaf_size(p4d);
 
-	pmd = pmd_offset(pud, addr);
-	if (!pmd_present(*pmd))
+	pudp = pud_offset_lockless(p4dp, p4d, addr);
+	pud = READ_ONCE(*pudp);
+	if (!pud_present(pud))
 		return 0;
 
-	if (pmd_leaf(*pmd)) {
-#ifdef pmd_page
-		page = pmd_page(*pmd);
-		if (PageHuge(page))
-			return page_size(compound_head(page));
-#endif
-		return 1ULL << PMD_SHIFT;
-	}
+	if (pud_leaf(pud))
+		return pud_leaf_size(pud);
 
-	pte = pte_offset_map(pmd, addr);
-	if (!pte_present(*pte)) {
-		pte_unmap(pte);
+	pmdp = pmd_offset_lockless(pudp, pud, addr);
+	pmd = READ_ONCE(*pmdp);
+	if (!pmd_present(pmd))
 		return 0;
-	}
 
-	page = pte_page(*pte);
-	if (PageHuge(page)) {
-		u64 size = page_size(compound_head(page));
-		pte_unmap(pte);
-		return size;
-	}
+	if (pmd_leaf(pmd))
+		return pmd_leaf_size(pmd);
 
-	pte_unmap(pte);
-	return PAGE_SIZE;
-}
-
-#else
+	ptep = pte_offset_map(&pmd, addr);
+	pte = ptep_get_lockless(ptep);
+	if (pte_present(pte))
+		size = pte_leaf_size(pte);
+	pte_unmap(ptep);
+#endif /* CONFIG_HAVE_FAST_GUP */
 
-static u64 arch_perf_get_page_size(struct mm_struct *mm, unsigned long addr)
-{
-	return 0;
+	return size;
 }
 
-#endif
-
 static u64 perf_get_page_size(unsigned long addr)
 {
 	struct mm_struct *mm;
@@ -7109,7 +7082,7 @@ static u64 perf_get_page_size(unsigned l
 		mm = &init_mm;
 	}
 
-	size = arch_perf_get_page_size(mm, addr);
+	size = perf_get_pgtable_size(mm, addr);
 
 	local_irq_restore(flags);
 
