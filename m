Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B4172D32C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 23:21:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=amnQXBB4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg4PJ080Gz3ckC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 07:21:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=amnQXBB4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg42s2shkz30PY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 07:05:25 +1000 (AEST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-56d3d7a5b84so10005657b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 14:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603925; x=1689195925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOzPn7Z2jtK8/Rr5ywaEqtGlE/ejlN/QX/LQ5us0iZw=;
        b=amnQXBB4tikUqyZuYm66ERDrt0MonFbKGOEZfuTs2nAKMZrZX44zBIkrZ9ZRA+fa06
         AyRj50rDxNfHhQPMlo167Gc41a6L1LuDKJ258/2NPg0RLjnehfyC8Q3Sm9AoXuOB8wna
         AK82U9SCt1rBakvYMiJ/vf5JAUixz4Ru3K2k7WFZarIq7YpCiX1p1YPhbePfgV7HLqZ+
         kNFkfK9EfSJ1kUzZet7nsXlMsD1vEo9vMFOs67Cs6PkQ7Z4TWwViMHDRmAjVmKbDbb6h
         AGLOD6SK7T6AuaFbMvMXKIFXkvVjI92aE3GZuD3T4HWNlPXuHq87MICVALiAwdvuGzfw
         BW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603925; x=1689195925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOzPn7Z2jtK8/Rr5ywaEqtGlE/ejlN/QX/LQ5us0iZw=;
        b=f+0F5cnvjTc1gQdyoxaURcm0EndjL9JrZKCzei6pmjIuCjs7MS8CVDjrpM4Pn5b/Km
         Dzfd4Ec7AhhnP3VjIGSVRXZ0++5U/qrgSc4nGb4Xi1lvB4k0NmiAx3qyrig2s3KtUf74
         qTaPgNjmEGqqFxuk4hl4Sh+92jWnDLKBJ+Zo9JC58le+10zqnHWu7OeQBC0WfHk6SpT9
         O0SDQ8evgTg5+jvdt9gMXBrUbC3b8Ntdg4IT1W1vshw9BY0Sn0A99FvF/ggQy77z3Gxb
         Xbt3+6L47w9Nc/dfCz/7RZ0pEn8Jp1GByzY9t82MJ21oFonPT8423htRv9sMqSR/Xhv9
         POZg==
X-Gm-Message-State: AC+VfDwAl+EbsemNBXYOMR7K7GDIXvBr49zx5s0aX3l0vb6veqAUEB3o
	ZaJ/qjP2JVe1ZdH6Hp1qAfw=
X-Google-Smtp-Source: ACHHUZ6Cwt/E6dG3WFyoFqOmBAzPgcTMvw0zuz67x28fyF+Rzf5uGkmgtov/aqSyP68nWBC9sA7rZQ==
X-Received: by 2002:a81:84ce:0:b0:56d:4f2e:6f83 with SMTP id u197-20020a8184ce000000b0056d4f2e6f83mr1630242ywf.4.1686603924760;
        Mon, 12 Jun 2023 14:05:24 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:05:24 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v4 19/34] pgalloc: Convert various functions to use ptdescs
Date: Mon, 12 Jun 2023 14:04:08 -0700
Message-Id: <20230612210423.18611-20-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Some of the functions use the *get*page*() helper functions. Convert
these to use pagetable_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/asm-generic/pgalloc.h | 62 +++++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 25 deletions(-)

diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index a7cf825befae..3fd6ce79e654 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -18,7 +18,11 @@
  */
 static inline pte_t *__pte_alloc_one_kernel(struct mm_struct *mm)
 {
-	return (pte_t *)__get_free_page(GFP_PGTABLE_KERNEL);
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_PGTABLE_KERNEL, 0);
+
+	if (!ptdesc)
+		return NULL;
+	return ptdesc_address(ptdesc);
 }
 
 #ifndef __HAVE_ARCH_PTE_ALLOC_ONE_KERNEL
@@ -41,7 +45,7 @@ static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
  */
 static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
 {
-	free_page((unsigned long)pte);
+	pagetable_free(virt_to_ptdesc(pte));
 }
 
 /**
@@ -49,7 +53,7 @@ static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
  * @mm: the mm_struct of the current context
  * @gfp: GFP flags to use for the allocation
  *
- * Allocates a page and runs the pgtable_pte_page_ctor().
+ * Allocates a ptdesc and runs the pagetable_pte_ctor().
  *
  * This function is intended for architectures that need
  * anything beyond simple page allocation or must have custom GFP flags.
@@ -58,17 +62,17 @@ static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
  */
 static inline pgtable_t __pte_alloc_one(struct mm_struct *mm, gfp_t gfp)
 {
-	struct page *pte;
+	struct ptdesc *ptdesc;
 
-	pte = alloc_page(gfp);
-	if (!pte)
+	ptdesc = pagetable_alloc(gfp, 0);
+	if (!ptdesc)
 		return NULL;
-	if (!pgtable_pte_page_ctor(pte)) {
-		__free_page(pte);
+	if (!pagetable_pte_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
 		return NULL;
 	}
 
-	return pte;
+	return ptdesc_page(ptdesc);
 }
 
 #ifndef __HAVE_ARCH_PTE_ALLOC_ONE
@@ -76,7 +80,7 @@ static inline pgtable_t __pte_alloc_one(struct mm_struct *mm, gfp_t gfp)
  * pte_alloc_one - allocate a page for PTE-level user page table
  * @mm: the mm_struct of the current context
  *
- * Allocates a page and runs the pgtable_pte_page_ctor().
+ * Allocates a ptdesc and runs the pagetable_pte_ctor().
  *
  * Return: `struct page` initialized as page table or %NULL on error
  */
@@ -98,8 +102,10 @@ static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
  */
 static inline void pte_free(struct mm_struct *mm, struct page *pte_page)
 {
-	pgtable_pte_page_dtor(pte_page);
-	__free_page(pte_page);
+	struct ptdesc *ptdesc = page_ptdesc(pte_page);
+
+	pagetable_pte_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 
@@ -110,7 +116,7 @@ static inline void pte_free(struct mm_struct *mm, struct page *pte_page)
  * pmd_alloc_one - allocate a page for PMD-level page table
  * @mm: the mm_struct of the current context
  *
- * Allocates a page and runs the pgtable_pmd_page_ctor().
+ * Allocates a ptdesc and runs the pagetable_pmd_ctor().
  * Allocations use %GFP_PGTABLE_USER in user context and
  * %GFP_PGTABLE_KERNEL in kernel context.
  *
@@ -118,28 +124,30 @@ static inline void pte_free(struct mm_struct *mm, struct page *pte_page)
  */
 static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long addr)
 {
-	struct page *page;
+	struct ptdesc *ptdesc;
 	gfp_t gfp = GFP_PGTABLE_USER;
 
 	if (mm == &init_mm)
 		gfp = GFP_PGTABLE_KERNEL;
-	page = alloc_page(gfp);
-	if (!page)
+	ptdesc = pagetable_alloc(gfp, 0);
+	if (!ptdesc)
 		return NULL;
-	if (!pgtable_pmd_page_ctor(page)) {
-		__free_page(page);
+	if (!pagetable_pmd_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
 		return NULL;
 	}
-	return (pmd_t *)page_address(page);
+	return ptdesc_address(ptdesc);
 }
 #endif
 
 #ifndef __HAVE_ARCH_PMD_FREE
 static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 {
+	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
+
 	BUG_ON((unsigned long)pmd & (PAGE_SIZE-1));
-	pgtable_pmd_page_dtor(virt_to_page(pmd));
-	free_page((unsigned long)pmd);
+	pagetable_pmd_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 #endif
 
@@ -149,11 +157,15 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 
 static inline pud_t *__pud_alloc_one(struct mm_struct *mm, unsigned long addr)
 {
-	gfp_t gfp = GFP_PGTABLE_USER;
+	gfp_t gfp = GFP_PGTABLE_USER | __GFP_ZERO;
+	struct ptdesc *ptdesc;
 
 	if (mm == &init_mm)
 		gfp = GFP_PGTABLE_KERNEL;
-	return (pud_t *)get_zeroed_page(gfp);
+	ptdesc = pagetable_alloc(gfp, 0);
+	if (!ptdesc)
+		return NULL;
+	return ptdesc_address(ptdesc);
 }
 
 #ifndef __HAVE_ARCH_PUD_ALLOC_ONE
@@ -175,7 +187,7 @@ static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
 static inline void __pud_free(struct mm_struct *mm, pud_t *pud)
 {
 	BUG_ON((unsigned long)pud & (PAGE_SIZE-1));
-	free_page((unsigned long)pud);
+	pagetable_free(virt_to_ptdesc(pud));
 }
 
 #ifndef __HAVE_ARCH_PUD_FREE
@@ -190,7 +202,7 @@ static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 #ifndef __HAVE_ARCH_PGD_FREE
 static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 {
-	free_page((unsigned long)pgd);
+	pagetable_free(virt_to_ptdesc(pgd));
 }
 #endif
 
-- 
2.40.1

