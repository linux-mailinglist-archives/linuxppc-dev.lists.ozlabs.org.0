Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ABD87F0FB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 21:12:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z498adPF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z498adPF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz5cn59hLz3vpl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 07:12:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z498adPF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z498adPF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz5RJ1qZpz3dVH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 07:04:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C5IYGWVxUA2LCxblG8GUdWUManYweqkS1nMwnfIC++w=;
	b=Z498adPF2UKiyFZAlIFmjrZG2Wpmhzpldr9g3qI77nrFrrQ43wqLLIvfVC55nIP3xThKqP
	L2htOrlfbz1s0fr29Turz39a23GsSDgCF5g6SDTe1pWAlg2a5/hjwyhd7pO/sGqnDa43hP
	k1tO4zlXjzj5NItW8d0VYdzDNMOMfoc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710792265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C5IYGWVxUA2LCxblG8GUdWUManYweqkS1nMwnfIC++w=;
	b=Z498adPF2UKiyFZAlIFmjrZG2Wpmhzpldr9g3qI77nrFrrQ43wqLLIvfVC55nIP3xThKqP
	L2htOrlfbz1s0fr29Turz39a23GsSDgCF5g6SDTe1pWAlg2a5/hjwyhd7pO/sGqnDa43hP
	k1tO4zlXjzj5NItW8d0VYdzDNMOMfoc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-oEQci1c0O-mFR1XN0Hdf2w-1; Mon, 18 Mar 2024 16:04:23 -0400
X-MC-Unique: oEQci1c0O-mFR1XN0Hdf2w-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-430d73c0492so3450491cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 13:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710792263; x=1711397063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C5IYGWVxUA2LCxblG8GUdWUManYweqkS1nMwnfIC++w=;
        b=MhZKbDs4PsxRZz2WhtevEGuoucRXQ4LVGqT5gJVFJ8s7VOPcXr75TvMkftPV+9s2Ja
         ASWli/zKj6ULZGoBPwRJhWjUpI9wQXPS9cffMZLG1/g0I2dCuHKQMJinBmw2I1l7GC/3
         mNIl1R20NpvHi+r9Qw20wHif0Iy8ZFefbnnQ183Sr0usGrpTrfdIkPsgmi8CGMvd3Q+J
         r2LmLCIbi8TGRe1XgDFLHFzHatQErxuICw968AUzmY9MggNlU11Zeq0Mk6h8XmX13fmT
         yr3/ct+iI0nwKcbd1oHjW2/x7y+B0kDAlWx4Js0oEqQP9S5pjLva1C+8Bl4dxBTgPIjz
         +mlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLfuNoT21ektfgowpOUb3sCExPP1jk5DR+sHc1m1Z1G8ZgP3BtAyyeUSQINX2bn+RDJnIrs711bhqdm2wJhjoCYFx47fU8gL1btcs4jQ==
X-Gm-Message-State: AOJu0YyXozAjLKK6VCvAHV6tp6lv+SRIa8jV/vQxaXCg+5gHtud4HYyK
	7f1E/iBzsLdC/mWZMH8XwqEzWYVkWVnwCk5y3sdk7HAVjnYCmF5+ejFtF8KFOUJ015U3ZBZg24k
	4CdMx4E/w8PLB3YpMBBSFRaHUZTR4KaBikCJ5pqBUrDgDg6iuiT9pxjpSGuY8iYs=
X-Received: by 2002:ac8:5f94:0:b0:430:a3bd:178b with SMTP id j20-20020ac85f94000000b00430a3bd178bmr450214qta.2.1710792263099;
        Mon, 18 Mar 2024 13:04:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp9pbq1yp/IEiDWtUuy/HeuR42qObaCDKOoRIIvKhBVTuD6LDz0uhx2Vxyh/zWi2fCOK+MTg==
X-Received: by 2002:ac8:5f94:0:b0:430:a3bd:178b with SMTP id j20-20020ac85f94000000b00430a3bd178bmr450185qta.2.1710792262668;
        Mon, 18 Mar 2024 13:04:22 -0700 (PDT)
Received: from x1n.. ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hj10-20020a05622a620a00b0042ebbc1196fsm3484491qtb.87.2024.03.18.13.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:04:22 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 11/14] mm/treewide: Replace pXd_huge() with pXd_leaf()
Date: Mon, 18 Mar 2024 16:04:01 -0400
Message-ID: <20240318200404.448346-12-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318200404.448346-1-peterx@redhat.com>
References: <20240318200404.448346-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-arm-kernel@lists.infradead.org, Muchun Song <muchun.song@linux.dev>, x86@kernel.org, Matthew Wilcox <willy@infradead.org>, peterx@redhat.com, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

Now after we're sure all pXd_huge() definitions are the same as pXd_leaf(),
reuse it.  Luckily, pXd_huge() isn't widely used.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/arm/include/asm/pgtable-3level.h | 2 +-
 arch/arm64/include/asm/pgtable.h      | 2 +-
 arch/arm64/mm/hugetlbpage.c           | 4 ++--
 arch/loongarch/mm/hugetlbpage.c       | 2 +-
 arch/mips/mm/tlb-r4k.c                | 2 +-
 arch/powerpc/mm/pgtable_64.c          | 6 +++---
 arch/x86/mm/pgtable.c                 | 4 ++--
 mm/gup.c                              | 4 ++--
 mm/hmm.c                              | 2 +-
 mm/memory.c                           | 2 +-
 10 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/include/asm/pgtable-3level.h b/arch/arm/include/asm/pgtable-3level.h
index e7aecbef75c9..9e3c44f0aea2 100644
--- a/arch/arm/include/asm/pgtable-3level.h
+++ b/arch/arm/include/asm/pgtable-3level.h
@@ -190,7 +190,7 @@ static inline pte_t pte_mkspecial(pte_t pte)
 #define pmd_dirty(pmd)		(pmd_isset((pmd), L_PMD_SECT_DIRTY))
 
 #define pmd_hugewillfault(pmd)	(!pmd_young(pmd) || !pmd_write(pmd))
-#define pmd_thp_or_huge(pmd)	(pmd_huge(pmd) || pmd_trans_huge(pmd))
+#define pmd_thp_or_huge(pmd)	(pmd_leaf(pmd) || pmd_trans_huge(pmd))
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define pmd_trans_huge(pmd)	(pmd_val(pmd) && !pmd_table(pmd))
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 14d24c357c7a..c4efa47fed5f 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -512,7 +512,7 @@ static inline pmd_t pmd_mkinvalid(pmd_t pmd)
 	return pmd;
 }
 
-#define pmd_thp_or_huge(pmd)	(pmd_huge(pmd) || pmd_trans_huge(pmd))
+#define pmd_thp_or_huge(pmd)	(pmd_leaf(pmd) || pmd_trans_huge(pmd))
 
 #define pmd_write(pmd)		pte_write(pmd_pte(pmd))
 
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 1234bbaef5bf..f494fc31201f 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -321,7 +321,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 	if (sz != PUD_SIZE && pud_none(pud))
 		return NULL;
 	/* hugepage or swap? */
-	if (pud_huge(pud) || !pud_present(pud))
+	if (pud_leaf(pud) || !pud_present(pud))
 		return (pte_t *)pudp;
 	/* table; check the next level */
 
@@ -333,7 +333,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 	if (!(sz == PMD_SIZE || sz == CONT_PMD_SIZE) &&
 	    pmd_none(pmd))
 		return NULL;
-	if (pmd_huge(pmd) || !pmd_present(pmd))
+	if (pmd_leaf(pmd) || !pmd_present(pmd))
 		return (pte_t *)pmdp;
 
 	if (sz == CONT_PTE_SIZE)
diff --git a/arch/loongarch/mm/hugetlbpage.c b/arch/loongarch/mm/hugetlbpage.c
index 1e76fcb83093..a4e78e74aa21 100644
--- a/arch/loongarch/mm/hugetlbpage.c
+++ b/arch/loongarch/mm/hugetlbpage.c
@@ -64,7 +64,7 @@ uint64_t pmd_to_entrylo(unsigned long pmd_val)
 {
 	uint64_t val;
 	/* PMD as PTE. Must be huge page */
-	if (!pmd_huge(__pmd(pmd_val)))
+	if (!pmd_leaf(__pmd(pmd_val)))
 		panic("%s", __func__);
 
 	val = pmd_val ^ _PAGE_HUGE;
diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index 4106084e57d7..76f3b9c0a9f0 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -326,7 +326,7 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 	idx = read_c0_index();
 #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
 	/* this could be a huge page  */
-	if (pmd_huge(*pmdp)) {
+	if (pmd_leaf(*pmdp)) {
 		unsigned long lo;
 		write_c0_pagemask(PM_HUGE_MASK);
 		ptep = (pte_t *)pmdp;
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 9b99113cb51a..6621cfc3baf8 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -102,7 +102,7 @@ struct page *p4d_page(p4d_t p4d)
 {
 	if (p4d_leaf(p4d)) {
 		if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
-			VM_WARN_ON(!p4d_huge(p4d));
+			VM_WARN_ON(!p4d_leaf(p4d));
 		return pte_page(p4d_pte(p4d));
 	}
 	return virt_to_page(p4d_pgtable(p4d));
@@ -113,7 +113,7 @@ struct page *pud_page(pud_t pud)
 {
 	if (pud_leaf(pud)) {
 		if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
-			VM_WARN_ON(!pud_huge(pud));
+			VM_WARN_ON(!pud_leaf(pud));
 		return pte_page(pud_pte(pud));
 	}
 	return virt_to_page(pud_pgtable(pud));
@@ -132,7 +132,7 @@ struct page *pmd_page(pmd_t pmd)
 		 * enabled so these checks can't be used.
 		 */
 		if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
-			VM_WARN_ON(!(pmd_leaf(pmd) || pmd_huge(pmd)));
+			VM_WARN_ON(!pmd_leaf(pmd));
 		return pte_page(pmd_pte(pmd));
 	}
 	return virt_to_page(pmd_page_vaddr(pmd));
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index ff690ddc2334..d74f0814e086 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -731,7 +731,7 @@ int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
 		return 0;
 
 	/* Bail out if we are we on a populated non-leaf entry: */
-	if (pud_present(*pud) && !pud_huge(*pud))
+	if (pud_present(*pud) && !pud_leaf(*pud))
 		return 0;
 
 	set_pte((pte_t *)pud, pfn_pte(
@@ -760,7 +760,7 @@ int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
 	}
 
 	/* Bail out if we are we on a populated non-leaf entry: */
-	if (pmd_present(*pmd) && !pmd_huge(*pmd))
+	if (pmd_present(*pmd) && !pmd_leaf(*pmd))
 		return 0;
 
 	set_pte((pte_t *)pmd, pfn_pte(
diff --git a/mm/gup.c b/mm/gup.c
index e2415e9789bc..8e04a04ef138 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -778,7 +778,7 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
 	p4d = READ_ONCE(*p4dp);
 	if (!p4d_present(p4d))
 		return no_page_table(vma, flags);
-	BUILD_BUG_ON(p4d_huge(p4d));
+	BUILD_BUG_ON(p4d_leaf(p4d));
 	if (unlikely(p4d_bad(p4d)))
 		return no_page_table(vma, flags);
 
@@ -3070,7 +3070,7 @@ static int gup_p4d_range(pgd_t *pgdp, pgd_t pgd, unsigned long addr, unsigned lo
 		next = p4d_addr_end(addr, end);
 		if (!p4d_present(p4d))
 			return 0;
-		BUILD_BUG_ON(p4d_huge(p4d));
+		BUILD_BUG_ON(p4d_leaf(p4d));
 		if (unlikely(is_hugepd(__hugepd(p4d_val(p4d))))) {
 			if (!gup_huge_pd(__hugepd(p4d_val(p4d)), addr,
 					 P4D_SHIFT, next, flags, pages, nr))
diff --git a/mm/hmm.c b/mm/hmm.c
index c95b9ec5d95f..93aebd9cc130 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -429,7 +429,7 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 		return hmm_vma_walk_hole(start, end, -1, walk);
 	}
 
-	if (pud_huge(pud) && pud_devmap(pud)) {
+	if (pud_leaf(pud) && pud_devmap(pud)) {
 		unsigned long i, npages, pfn;
 		unsigned int required_fault;
 		unsigned long *hmm_pfns;
diff --git a/mm/memory.c b/mm/memory.c
index 904f70b99498..baee777dcd2d 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2765,7 +2765,7 @@ static int apply_to_pmd_range(struct mm_struct *mm, pud_t *pud,
 	unsigned long next;
 	int err = 0;
 
-	BUG_ON(pud_huge(*pud));
+	BUG_ON(pud_leaf(*pud));
 
 	if (create) {
 		pmd = pmd_alloc_track(mm, pud, addr, mask);
-- 
2.44.0

