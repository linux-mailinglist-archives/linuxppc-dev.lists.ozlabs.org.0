Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BC06BDFCE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 04:48:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pd98b58Lwz3cjW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 14:48:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=f4qI0D9D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=f4qI0D9D;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pd97d2vWlz3bWw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 14:47:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=c7wCPnTYsAnlfuIokTLL9knDc3TDHOWbd7SBJp4vaMs=; b=f4qI0D9DNEzkqjlnTioR+D/xhI
	2py+6WNtERCXix1QSkoRJuQCDr//5QCi9K71m5Oy/+1cK2xS78ggJEcDqJ/gonCjWg+4skRGJDJfI
	/hAqjxmdNTeAz/lVMSH8RrAzxj0PLAtp8n5L/zdUuCFVo2DjNamDKYdwG7xJrZxSHajjRv8Os8svG
	J4bk7zrQqv3DQsc5dUUwb1yJIIlKGT/apn4VQ/Znx0Ec5yCTHxUBKPKPMVsRitqrZCS5th2ZO7Bs6
	0qkjmcfpugdNUfSjIIs1/1wgaMeUe3NXr8LxWKdhX3Atk3W217rB8y2E7o5I0Hi69YiYKw/m+u6Xg
	qp5ccBeg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pd13s-00FTEN-5i; Fri, 17 Mar 2023 03:47:24 +0000
Date: Fri, 17 Mar 2023 03:47:24 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 20/36] powerpc: Implement the new page table range API
Message-ID: <ZBPizB6TmDp0psOl@casper.infradead.org>
References: <20230315051444.3229621-1-willy@infradead.org>
 <20230315051444.3229621-21-willy@infradead.org>
 <1743d96f-8efe-0127-2cae-7368ce0eb2e6@csgroup.eu>
 <c7f08247-8bcd-184c-5e06-91f91257f1f6@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7f08247-8bcd-184c-5e06-91f91257f1f6@csgroup.eu>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 15, 2023 at 10:18:22AM +0000, Christophe Leroy wrote:
> I investigated a bit further and can confirm now that the above won't 
> always work, see comment 
> https://elixir.bootlin.com/linux/v6.3-rc2/source/arch/powerpc/include/asm/nohash/32/pgtable.h#L147
> 
> And then you see 
> https://elixir.bootlin.com/linux/v6.3-rc2/source/arch/powerpc/include/asm/nohash/pte-e500.h#L63

Got it.  Here's what I intend to fold in for the next version:

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 7bf1fe7297c6..5f12b9382909 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -462,11 +462,6 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t pgprot)
 		     pgprot_val(pgprot));
 }
 
-static inline unsigned long pte_pfn(pte_t pte)
-{
-	return pte_val(pte) >> PTE_RPN_SHIFT;
-}
-
 /* Generic modifiers for PTE bits */
 static inline pte_t pte_wrprotect(pte_t pte)
 {
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 4acc9690f599..c5baa3082a5a 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -104,6 +104,7 @@
  * and every thing below PAGE_SHIFT;
  */
 #define PTE_RPN_MASK	(((1UL << _PAGE_PA_MAX) - 1) & (PAGE_MASK))
+#define PTE_RPN_SHIFT	PAGE_SHIFT
 /*
  * set of bits not changed in pmd_modify. Even though we have hash specific bits
  * in here, on radix we expect them to be zero.
@@ -569,11 +570,6 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t pgprot)
 	return __pte(((pte_basic_t)pfn << PAGE_SHIFT) | pgprot_val(pgprot) | _PAGE_PTE);
 }
 
-static inline unsigned long pte_pfn(pte_t pte)
-{
-	return (pte_val(pte) & PTE_RPN_MASK) >> PAGE_SHIFT;
-}
-
 /* Generic modifiers for PTE bits */
 static inline pte_t pte_wrprotect(pte_t pte)
 {
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 69a7dd47a9f0..03be8b22aaea 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -101,8 +101,6 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
 static inline pte_t pfn_pte(unsigned long pfn, pgprot_t pgprot) {
 	return __pte(((pte_basic_t)(pfn) << PTE_RPN_SHIFT) |
 		     pgprot_val(pgprot)); }
-static inline unsigned long pte_pfn(pte_t pte)	{
-	return pte_val(pte) >> PTE_RPN_SHIFT; }
 
 /* Generic modifiers for PTE bits */
 static inline pte_t pte_exprotect(pte_t pte)
@@ -279,7 +277,7 @@ static inline int pud_huge(pud_t pud)
 void update_mmu_cache_range(struct vm_area_struct *vma, unsigned long address,
 		pte_t *ptep, unsigned int nr);
 #else
-static inline void update_mmu_cache(struct vm_area_struct *vma,
+static inline void update_mmu_cache_range(struct vm_area_struct *vma,
 		unsigned long address, pte_t *ptep, unsigned int nr) {}
 #endif
 
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 656ecf2b10cd..491a2720f835 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -54,6 +54,12 @@ void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 /* Keep these as a macros to avoid include dependency mess */
 #define pte_page(x)		pfn_to_page(pte_pfn(x))
 #define mk_pte(page, pgprot)	pfn_pte(page_to_pfn(page), (pgprot))
+
+static inline unsigned long pte_pfn(pte_t pte)
+{
+	return (pte_val(pte) & PTE_RPN_MASK) >> PTE_RPN_SHIFT;
+}
+
 /*
  * Select all bits except the pfn
  */
diff --git a/arch/powerpc/mm/nohash/e500_hugetlbpage.c b/arch/powerpc/mm/nohash/e500_hugetlbpage.c
index f3cb91107a47..583b3098763f 100644
--- a/arch/powerpc/mm/nohash/e500_hugetlbpage.c
+++ b/arch/powerpc/mm/nohash/e500_hugetlbpage.c
@@ -178,7 +178,7 @@ book3e_hugetlb_preload(struct vm_area_struct *vma, unsigned long ea, pte_t pte)
  *
  * This must always be called with the pte lock held.
  */
-void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
+void update_mmu_cache_range(struct vm_area_struct *vma, unsigned long address,
 		pte_t *ptep, unsigned int nr)
 {
 	if (is_vm_hugetlb_page(vma))
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index b3c7b874a7a2..db236b494845 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -208,7 +208,7 @@ void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 		if (--nr == 0)
 			break;
 		ptep++;
-		pte = __pte(pte_val(pte) + PAGE_SIZE);
+		pte = __pte(pte_val(pte) + (1UL << PTE_RPN_SHIFT));
 		addr += PAGE_SIZE;
 	}
 }
