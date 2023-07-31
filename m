Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AA6769F20
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 19:15:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DDv4TKtr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RF4dF010Qz3dk7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 03:15:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DDv4TKtr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RF4Mq1xsVz30XP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 03:04:07 +1000 (AEST)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3a3e1152c23so3458364b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jul 2023 10:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823044; x=1691427844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sltDOqqNfHEtvz8jLXUjW/r74sJCuRKUMVTEbSHBWCo=;
        b=DDv4TKtr1SQu5KqZfb+k47cCUnTqa2hu0PGvOIZKT6p5w+WOigqgjt3pTCKyoVLOur
         PNxnRZ3jA0/RzPila/zrL9Ut0S2D7/dzdlixHctnRTEPuULJtPpCXt2sv6EdNGvihlcs
         y+VItng76gppkBpBjqibZpmruGV1NMM5yu9a5rLJnoNJwEeQ9JDH3AVeubSs7+9WGxCh
         BgihnLJKz5piH3g7XsbkueQJcQA3Z7Rp93aL/N3tU8RHXtjRG0jvHhNa9PLCdjFnI5G2
         GSA2pxYIUUVv4+PcoooKpTBzs2tJHyDwSGkSOMs2tb/nCpuvSVvt1GOnIBWnaMdpcLVw
         tIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823044; x=1691427844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sltDOqqNfHEtvz8jLXUjW/r74sJCuRKUMVTEbSHBWCo=;
        b=TzpnfBW6W5qJ6q/lNVB8+TX/LzBpSWxq2fNpKtz0eZZn6UYHrqNAE9OiqamuXlN4du
         2WgemcuFHF0aVaSe6zZNfN3jK8qgBgfTbJd1UehS4vm0f9pqqNpSLH5jPrLYZez2jiHE
         /h+vC/kbaZ30dHYVESsZ7e6dqGvsOAKKD/aBgV1IlU1YktEtIA9nyMKtuwwxj8F23KME
         9Bg089s+evzta5ucwQQMhky1KqqOP/ezAkswP29cOkktn9HNF09J0x7pRCsTHTkQRdJz
         ifgcGkAfFEYujuStHTNolzO7ksrT5bqidlDJNmP45A6WVn03HgQm6br29+h2XcyO9PHa
         QfBw==
X-Gm-Message-State: ABy/qLaD+E3QgMfPI7mA6EDyynrxb3mroarA8uCUVb0OgESn0mPiRScP
	ToFPO3is8tK1/k5I7AEznx0=
X-Google-Smtp-Source: APBJJlHmCcTDPCXO6u+09Bgv6vKTB5JCy6bic+/Xn7A3kI+4k4FzOgutNRH/lGvVTDd+56ojK0po+g==
X-Received: by 2002:a05:6808:d4a:b0:3a3:e593:5ac1 with SMTP id w10-20020a0568080d4a00b003a3e5935ac1mr13154690oik.21.1690823043912;
        Mon, 31 Jul 2023 10:04:03 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:04:03 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH mm-unstable v8 13/31] x86: Convert various functions to use ptdescs
Date: Mon, 31 Jul 2023 10:03:14 -0700
Message-Id: <20230731170332.69404-14-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to split struct ptdesc from struct page, convert various
functions to use ptdescs.

Some of the functions use the *get*page*() helper functions. Convert
these to use pagetable_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/x86/mm/pgtable.c | 47 ++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 15a8009a4480..d3a93e8766ee 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -52,7 +52,7 @@ early_param("userpte", setup_userpte);
 
 void ___pte_free_tlb(struct mmu_gather *tlb, struct page *pte)
 {
-	pgtable_pte_page_dtor(pte);
+	pagetable_pte_dtor(page_ptdesc(pte));
 	paravirt_release_pte(page_to_pfn(pte));
 	paravirt_tlb_remove_table(tlb, pte);
 }
@@ -60,7 +60,7 @@ void ___pte_free_tlb(struct mmu_gather *tlb, struct page *pte)
 #if CONFIG_PGTABLE_LEVELS > 2
 void ___pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd)
 {
-	struct page *page = virt_to_page(pmd);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
 	paravirt_release_pmd(__pa(pmd) >> PAGE_SHIFT);
 	/*
 	 * NOTE! For PAE, any changes to the top page-directory-pointer-table
@@ -69,8 +69,8 @@ void ___pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd)
 #ifdef CONFIG_X86_PAE
 	tlb->need_flush_all = 1;
 #endif
-	pgtable_pmd_page_dtor(page);
-	paravirt_tlb_remove_table(tlb, page);
+	pagetable_pmd_dtor(ptdesc);
+	paravirt_tlb_remove_table(tlb, ptdesc_page(ptdesc));
 }
 
 #if CONFIG_PGTABLE_LEVELS > 3
@@ -92,16 +92,16 @@ void ___p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d)
 
 static inline void pgd_list_add(pgd_t *pgd)
 {
-	struct page *page = virt_to_page(pgd);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pgd);
 
-	list_add(&page->lru, &pgd_list);
+	list_add(&ptdesc->pt_list, &pgd_list);
 }
 
 static inline void pgd_list_del(pgd_t *pgd)
 {
-	struct page *page = virt_to_page(pgd);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pgd);
 
-	list_del(&page->lru);
+	list_del(&ptdesc->pt_list);
 }
 
 #define UNSHARED_PTRS_PER_PGD				\
@@ -112,12 +112,12 @@ static inline void pgd_list_del(pgd_t *pgd)
 
 static void pgd_set_mm(pgd_t *pgd, struct mm_struct *mm)
 {
-	virt_to_page(pgd)->pt_mm = mm;
+	virt_to_ptdesc(pgd)->pt_mm = mm;
 }
 
 struct mm_struct *pgd_page_get_mm(struct page *page)
 {
-	return page->pt_mm;
+	return page_ptdesc(page)->pt_mm;
 }
 
 static void pgd_ctor(struct mm_struct *mm, pgd_t *pgd)
@@ -213,11 +213,14 @@ void pud_populate(struct mm_struct *mm, pud_t *pudp, pmd_t *pmd)
 static void free_pmds(struct mm_struct *mm, pmd_t *pmds[], int count)
 {
 	int i;
+	struct ptdesc *ptdesc;
 
 	for (i = 0; i < count; i++)
 		if (pmds[i]) {
-			pgtable_pmd_page_dtor(virt_to_page(pmds[i]));
-			free_page((unsigned long)pmds[i]);
+			ptdesc = virt_to_ptdesc(pmds[i]);
+
+			pagetable_pmd_dtor(ptdesc);
+			pagetable_free(ptdesc);
 			mm_dec_nr_pmds(mm);
 		}
 }
@@ -230,18 +233,24 @@ static int preallocate_pmds(struct mm_struct *mm, pmd_t *pmds[], int count)
 
 	if (mm == &init_mm)
 		gfp &= ~__GFP_ACCOUNT;
+	gfp &= ~__GFP_HIGHMEM;
 
 	for (i = 0; i < count; i++) {
-		pmd_t *pmd = (pmd_t *)__get_free_page(gfp);
-		if (!pmd)
+		pmd_t *pmd = NULL;
+		struct ptdesc *ptdesc = pagetable_alloc(gfp, 0);
+
+		if (!ptdesc)
 			failed = true;
-		if (pmd && !pgtable_pmd_page_ctor(virt_to_page(pmd))) {
-			free_page((unsigned long)pmd);
-			pmd = NULL;
+		if (ptdesc && !pagetable_pmd_ctor(ptdesc)) {
+			pagetable_free(ptdesc);
+			ptdesc = NULL;
 			failed = true;
 		}
-		if (pmd)
+		if (ptdesc) {
 			mm_inc_nr_pmds(mm);
+			pmd = ptdesc_address(ptdesc);
+		}
+
 		pmds[i] = pmd;
 	}
 
@@ -830,7 +839,7 @@ int pud_free_pmd_page(pud_t *pud, unsigned long addr)
 
 	free_page((unsigned long)pmd_sv);
 
-	pgtable_pmd_page_dtor(virt_to_page(pmd));
+	pagetable_pmd_dtor(virt_to_ptdesc(pmd));
 	free_page((unsigned long)pmd);
 
 	return 1;
-- 
2.40.1

