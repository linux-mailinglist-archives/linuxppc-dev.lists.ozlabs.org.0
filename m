Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C67288E924
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:33:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QaJvmE8M;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QaJvmE8M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4Vzt03dkz3vrJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:32:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QaJvmE8M;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QaJvmE8M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4Vnj0M9Dz3vZB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:24:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h7p860Pwfa5oWvGOHiVson4UsvvLX6Zsz0nCOpl6KoI=;
	b=QaJvmE8MM0YrNH4VpkaHABCebX2l3WrIyx4xWze2vwuP4HxAuxNK8N5yliXI4J0r2sngER
	wDr59YgJmBHSiKEV0NctLCyWVHvzWRul8mPhB7cLWg9NFi+aco3I+Ycj/berQuwEQkCP4+
	xld7y8W7dI1SzNpC6AeJtZcxVcLnBfo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h7p860Pwfa5oWvGOHiVson4UsvvLX6Zsz0nCOpl6KoI=;
	b=QaJvmE8MM0YrNH4VpkaHABCebX2l3WrIyx4xWze2vwuP4HxAuxNK8N5yliXI4J0r2sngER
	wDr59YgJmBHSiKEV0NctLCyWVHvzWRul8mPhB7cLWg9NFi+aco3I+Ycj/berQuwEQkCP4+
	xld7y8W7dI1SzNpC6AeJtZcxVcLnBfo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-x2CS2GH6Nny1jmMRMC0jqw-1; Wed, 27 Mar 2024 11:24:01 -0400
X-MC-Unique: x2CS2GH6Nny1jmMRMC0jqw-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-69152af7760so25773116d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 08:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553041; x=1712157841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7p860Pwfa5oWvGOHiVson4UsvvLX6Zsz0nCOpl6KoI=;
        b=QwfARO5b6PCCzNR+x3eNryhaAP+htP67wFtkeTK4CaJEwR+3tJVWDNZvMM1FCgftaz
         AZHwV3aQfih/KBQ0WgwpONqydwEgBA4dR7oW3d7zkw27WR1WLQ8W9ZRcK1PFeQ6+V8WT
         yKWOuzZuCKejkrPuMo3nssIuKHX1ONo9c/mWDErmO8OHbewbP1XdyJxAUGaGCYGNc7FE
         d/yNZg3q6kX93xcqpRWoJWJcm189cP+TXJ2jxHWwrcGhJp/mt1WNxv1AcTi/L3o2+e5N
         sLkIP5UGUs2T59SqFQKhIM/B6mfwut872gS30cQ03k/Kq1lJNtLwaSarNGeffUAbeDML
         b0cw==
X-Forwarded-Encrypted: i=1; AJvYcCVb8aZvkhVo5L6k2ct7T/rh+QlzkZMImNTdYcaifuDsSlXXL+29mAcK0jvXykV+o59ABuZdRULZBONtpuG2y5fa6By6pYK3mzalg/F+rQ==
X-Gm-Message-State: AOJu0YxEL+7j/6djAnmS8B/O24CYWcCM38FlHmvpUAJ+EVRPshvc8W/3
	sgVY/cC33hdd96uoM86381RJ3btns6mJd1CII9iGEv1P3epupPLfhRPdht5cdQnFSb3LKxRD2X7
	sQA7O7gG8fpUOgr+nLsCNuUjjdlcKgF/pKNwpBSOFaMkqewXzIngLOv1Qjk/DaYE=
X-Received: by 2002:a05:6214:3d13:b0:696:7b12:3744 with SMTP id ol19-20020a0562143d1300b006967b123744mr13941599qvb.0.1711553040357;
        Wed, 27 Mar 2024 08:24:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGf1gHn7pWGOliI2n3iseJ1Y4KDSmrGTREwaUpEtNei2O8hiTLwONxqZARC/3SfeDcLLHxfTA==
X-Received: by 2002:a05:6214:3d13:b0:696:7b12:3744 with SMTP id ol19-20020a0562143d1300b006967b123744mr13941496qvb.0.1711553038757;
        Wed, 27 Mar 2024 08:23:58 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:23:58 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/13] mm/gup: Handle huge pmd for follow_pmd_mask()
Date: Wed, 27 Mar 2024 11:23:30 -0400
Message-ID: <20240327152332.950956-12-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327152332.950956-1-peterx@redhat.com>
References: <20240327152332.950956-1-peterx@redhat.com>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, peterx@redhat.com, Andrew Jones <andrew.jones@linux.dev>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

Replace pmd_trans_huge() with pmd_leaf() to also cover pmd_huge() as long
as enabled.

FOLL_TOUCH and FOLL_SPLIT_PMD only apply to THP, not yet huge.

Since now follow_trans_huge_pmd() can process hugetlb pages, renaming it
into follow_huge_pmd() to match what it does.  Move it into gup.c so not
depend on CONFIG_THP.

When at it, move the ctx->page_mask setup into follow_huge_pmd(), only set
it when the page is valid.  It was not a bug to set it before even if GUP
failed (page==NULL), because follow_page_mask() callers always ignores
page_mask if so.  But doing so makes the code cleaner.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c         | 107 ++++++++++++++++++++++++++++++++++++++++++++---
 mm/huge_memory.c |  86 +------------------------------------
 mm/internal.h    |   5 +--
 3 files changed, 105 insertions(+), 93 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 1e5d42211bb4..a81184b01276 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -580,6 +580,93 @@ static struct page *follow_huge_pud(struct vm_area_struct *vma,
 
 	return page;
 }
+
+/* FOLL_FORCE can write to even unwritable PMDs in COW mappings. */
+static inline bool can_follow_write_pmd(pmd_t pmd, struct page *page,
+					struct vm_area_struct *vma,
+					unsigned int flags)
+{
+	/* If the pmd is writable, we can write to the page. */
+	if (pmd_write(pmd))
+		return true;
+
+	/* Maybe FOLL_FORCE is set to override it? */
+	if (!(flags & FOLL_FORCE))
+		return false;
+
+	/* But FOLL_FORCE has no effect on shared mappings */
+	if (vma->vm_flags & (VM_MAYSHARE | VM_SHARED))
+		return false;
+
+	/* ... or read-only private ones */
+	if (!(vma->vm_flags & VM_MAYWRITE))
+		return false;
+
+	/* ... or already writable ones that just need to take a write fault */
+	if (vma->vm_flags & VM_WRITE)
+		return false;
+
+	/*
+	 * See can_change_pte_writable(): we broke COW and could map the page
+	 * writable if we have an exclusive anonymous page ...
+	 */
+	if (!page || !PageAnon(page) || !PageAnonExclusive(page))
+		return false;
+
+	/* ... and a write-fault isn't required for other reasons. */
+	if (vma_soft_dirty_enabled(vma) && !pmd_soft_dirty(pmd))
+		return false;
+	return !userfaultfd_huge_pmd_wp(vma, pmd);
+}
+
+static struct page *follow_huge_pmd(struct vm_area_struct *vma,
+				    unsigned long addr, pmd_t *pmd,
+				    unsigned int flags,
+				    struct follow_page_context *ctx)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	pmd_t pmdval = *pmd;
+	struct page *page;
+	int ret;
+
+	assert_spin_locked(pmd_lockptr(mm, pmd));
+
+	page = pmd_page(pmdval);
+	VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
+
+	if ((flags & FOLL_WRITE) &&
+	    !can_follow_write_pmd(pmdval, page, vma, flags))
+		return NULL;
+
+	/* Avoid dumping huge zero page */
+	if ((flags & FOLL_DUMP) && is_huge_zero_pmd(pmdval))
+		return ERR_PTR(-EFAULT);
+
+	if (pmd_protnone(*pmd) && !gup_can_follow_protnone(vma, flags))
+		return NULL;
+
+	if (!pmd_write(pmdval) && gup_must_unshare(vma, flags, page))
+		return ERR_PTR(-EMLINK);
+
+	VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
+			!PageAnonExclusive(page), page);
+
+	ret = try_grab_page(page, flags);
+	if (ret)
+		return ERR_PTR(ret);
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	if (pmd_trans_huge(pmdval) && (flags & FOLL_TOUCH))
+		touch_pmd(vma, addr, pmd, flags & FOLL_WRITE);
+#endif	/* CONFIG_TRANSPARENT_HUGEPAGE */
+
+	page += (addr & ~HPAGE_PMD_MASK) >> PAGE_SHIFT;
+	ctx->page_mask = HPAGE_PMD_NR - 1;
+	VM_BUG_ON_PAGE(!PageCompound(page) && !is_zone_device_page(page), page);
+
+	return page;
+}
+
 #else  /* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
 static struct page *follow_huge_pud(struct vm_area_struct *vma,
 				    unsigned long addr, pud_t *pudp,
@@ -587,6 +674,14 @@ static struct page *follow_huge_pud(struct vm_area_struct *vma,
 {
 	return NULL;
 }
+
+static struct page *follow_huge_pmd(struct vm_area_struct *vma,
+				    unsigned long addr, pmd_t *pmd,
+				    unsigned int flags,
+				    struct follow_page_context *ctx)
+{
+	return NULL;
+}
 #endif	/* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
 
 static int follow_pfn_pte(struct vm_area_struct *vma, unsigned long address,
@@ -784,31 +879,31 @@ static struct page *follow_pmd_mask(struct vm_area_struct *vma,
 			return page;
 		return no_page_table(vma, flags, address);
 	}
-	if (likely(!pmd_trans_huge(pmdval)))
+	if (likely(!pmd_leaf(pmdval)))
 		return follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
 
 	if (pmd_protnone(pmdval) && !gup_can_follow_protnone(vma, flags))
 		return no_page_table(vma, flags, address);
 
 	ptl = pmd_lock(mm, pmd);
-	if (unlikely(!pmd_present(*pmd))) {
+	pmdval = *pmd;
+	if (unlikely(!pmd_present(pmdval))) {
 		spin_unlock(ptl);
 		return no_page_table(vma, flags, address);
 	}
-	if (unlikely(!pmd_trans_huge(*pmd))) {
+	if (unlikely(!pmd_leaf(pmdval))) {
 		spin_unlock(ptl);
 		return follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
 	}
-	if (flags & FOLL_SPLIT_PMD) {
+	if (pmd_trans_huge(pmdval) && (flags & FOLL_SPLIT_PMD)) {
 		spin_unlock(ptl);
 		split_huge_pmd(vma, pmd, address);
 		/* If pmd was left empty, stuff a page table in there quickly */
 		return pte_alloc(mm, pmd) ? ERR_PTR(-ENOMEM) :
 			follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
 	}
-	page = follow_trans_huge_pmd(vma, address, pmd, flags);
+	page = follow_huge_pmd(vma, address, pmd, flags, ctx);
 	spin_unlock(ptl);
-	ctx->page_mask = HPAGE_PMD_NR - 1;
 	return page;
 }
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 2979198d7b71..ed0d82c4b829 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1220,8 +1220,8 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
 EXPORT_SYMBOL_GPL(vmf_insert_pfn_pud);
 #endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 
-static void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
-		      pmd_t *pmd, bool write)
+void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
+	       pmd_t *pmd, bool write)
 {
 	pmd_t _pmd;
 
@@ -1576,88 +1576,6 @@ static inline bool can_change_pmd_writable(struct vm_area_struct *vma,
 	return pmd_dirty(pmd);
 }
 
-/* FOLL_FORCE can write to even unwritable PMDs in COW mappings. */
-static inline bool can_follow_write_pmd(pmd_t pmd, struct page *page,
-					struct vm_area_struct *vma,
-					unsigned int flags)
-{
-	/* If the pmd is writable, we can write to the page. */
-	if (pmd_write(pmd))
-		return true;
-
-	/* Maybe FOLL_FORCE is set to override it? */
-	if (!(flags & FOLL_FORCE))
-		return false;
-
-	/* But FOLL_FORCE has no effect on shared mappings */
-	if (vma->vm_flags & (VM_MAYSHARE | VM_SHARED))
-		return false;
-
-	/* ... or read-only private ones */
-	if (!(vma->vm_flags & VM_MAYWRITE))
-		return false;
-
-	/* ... or already writable ones that just need to take a write fault */
-	if (vma->vm_flags & VM_WRITE)
-		return false;
-
-	/*
-	 * See can_change_pte_writable(): we broke COW and could map the page
-	 * writable if we have an exclusive anonymous page ...
-	 */
-	if (!page || !PageAnon(page) || !PageAnonExclusive(page))
-		return false;
-
-	/* ... and a write-fault isn't required for other reasons. */
-	if (vma_soft_dirty_enabled(vma) && !pmd_soft_dirty(pmd))
-		return false;
-	return !userfaultfd_huge_pmd_wp(vma, pmd);
-}
-
-struct page *follow_trans_huge_pmd(struct vm_area_struct *vma,
-				   unsigned long addr,
-				   pmd_t *pmd,
-				   unsigned int flags)
-{
-	struct mm_struct *mm = vma->vm_mm;
-	struct page *page;
-	int ret;
-
-	assert_spin_locked(pmd_lockptr(mm, pmd));
-
-	page = pmd_page(*pmd);
-	VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
-
-	if ((flags & FOLL_WRITE) &&
-	    !can_follow_write_pmd(*pmd, page, vma, flags))
-		return NULL;
-
-	/* Avoid dumping huge zero page */
-	if ((flags & FOLL_DUMP) && is_huge_zero_pmd(*pmd))
-		return ERR_PTR(-EFAULT);
-
-	if (pmd_protnone(*pmd) && !gup_can_follow_protnone(vma, flags))
-		return NULL;
-
-	if (!pmd_write(*pmd) && gup_must_unshare(vma, flags, page))
-		return ERR_PTR(-EMLINK);
-
-	VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
-			!PageAnonExclusive(page), page);
-
-	ret = try_grab_page(page, flags);
-	if (ret)
-		return ERR_PTR(ret);
-
-	if (flags & FOLL_TOUCH)
-		touch_pmd(vma, addr, pmd, flags & FOLL_WRITE);
-
-	page += (addr & ~HPAGE_PMD_MASK) >> PAGE_SHIFT;
-	VM_BUG_ON_PAGE(!PageCompound(page) && !is_zone_device_page(page), page);
-
-	return page;
-}
-
 /* NUMA hinting page fault entry point for trans huge pmds */
 vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
 {
diff --git a/mm/internal.h b/mm/internal.h
index eee8c82740b5..e10ecc6594f1 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1113,9 +1113,8 @@ int __must_check try_grab_page(struct page *page, unsigned int flags);
  */
 void touch_pud(struct vm_area_struct *vma, unsigned long addr,
 	       pud_t *pud, bool write);
-struct page *follow_trans_huge_pmd(struct vm_area_struct *vma,
-				   unsigned long addr, pmd_t *pmd,
-				   unsigned int flags);
+void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
+	       pmd_t *pmd, bool write);
 
 /*
  * mm/mmap.c
-- 
2.44.0

