Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C696E20C39A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 20:48:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49vN7Y6znTzDr3D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 04:48:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=rt8TkjxM; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49vN5t5dnJzDqfX
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 04:47:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1N0BByy8wh3U5L6kSyD094uOjKmOfferUMmn5EME8io=; b=rt8TkjxM6E+8nmcpYCJvT3+hGr
 H4ecs3CPjquKl0PwNGx/0fLvLzSeMiWcVi9g0WCIz3JnPQUXbHNqxCwsT2ayVaFw3c97wVSQmiW1a
 rRm52Ir+aRTZP4azHkd5YkWRXRczyXy3h3kPFA95NHffmRnSpt92NCElCKtgs9bWeGRSTPeQhCTju
 iPtJAvPHoRFkmTEM1tJ00siPzLuSHbI8lKSLvU4vW88vtaVf2379Kp5XmE9uUb/m7xTPxYufnEdnI
 IEHPwIDOHEDO9KXQeLwESz53maPxEJf9fE+lLaTHw5uxLUAf5caLMZIB5tLXnAC15PHD057E6o2BK
 h9N6MSEQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jpFqc-00058E-Db; Sat, 27 Jun 2020 18:46:42 +0000
Date: Sat, 27 Jun 2020 19:46:42 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: [PATCH 9/8] mm: Account PMD tables like PTE tables
Message-ID: <20200627184642.GF25039@casper.infradead.org>
References: <20200627143453.31835-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200627143453.31835-1-rppt@kernel.org>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-hexagon@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andy Lutomirski <luto@kernel.org>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We account the PTE level of the page tables to the process in order to
make smarter OOM decisions and help diagnose why memory is fragmented.
For these same reasons, we should account pages allocated for PMDs.
With larger process address spaces and ASLR, the number of PMDs in use
is higher than it used to be so the inaccuracy is starting to matter.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/mm.h | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index dc7b87310c10..b283e25fcffa 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2271,7 +2271,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return ptlock_ptr(pmd_to_page(pmd));
 }
 
-static inline bool pgtable_pmd_page_ctor(struct page *page)
+static inline bool pmd_ptlock_init(struct page *page)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	page->pmd_huge_pte = NULL;
@@ -2279,7 +2279,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 	return ptlock_init(page);
 }
 
-static inline void pgtable_pmd_page_dtor(struct page *page)
+static inline void pmd_ptlock_free(struct page *page)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	VM_BUG_ON_PAGE(page->pmd_huge_pte, page);
@@ -2296,8 +2296,8 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 
-static inline bool pgtable_pmd_page_ctor(struct page *page) { return true; }
-static inline void pgtable_pmd_page_dtor(struct page *page) {}
+static inline bool pmd_ptlock_init(struct page *page) { return true; }
+static inline void pmd_ptlock_free(struct page *page) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -2310,6 +2310,22 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 	return ptl;
 }
 
+static inline bool pgtable_pmd_page_ctor(struct page *page)
+{
+	if (!pmd_ptlock_init(page))
+		return false;
+	__SetPageTable(page);
+	inc_zone_page_state(page, NR_PAGETABLE);
+	return true;
+}
+
+static inline void pgtable_pmd_page_dtor(struct page *page)
+{
+	pmd_ptlock_free(page);
+	__ClearPageTable(page);
+	dec_zone_page_state(page, NR_PAGETABLE);
+}
+
 /*
  * No scalability reason to split PUD locks yet, but follow the same pattern
  * as the PMD locks to make it easier if we decide to.  The VM should not be
-- 
2.27.0

