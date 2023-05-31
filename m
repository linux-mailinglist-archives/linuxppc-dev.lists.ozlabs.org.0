Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 052E7718CA7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 23:33:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWjF84dFxz3fjY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 07:33:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=f7BrGYQn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=f7BrGYQn;
	dkim-atps=neutral
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWjBD307qz3fFt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 07:31:16 +1000 (AEST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5689335d2b6so710537b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 14:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568673; x=1688160673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyShpFpgVR6i39SmTUNSXyIOGqdGil6rpZQyINgvaNc=;
        b=f7BrGYQnWDGWjfOB31IyWypGIm3sBSR5GrTxoSkB0QeDnrAwpQMBLgz7x4dss7x6Kx
         z8I+j44YnjDGYTGStotDdtxsa/waxh6ZUSCH9KN770hNpMjA5qx26THJhAKA84XsHIjg
         d+FA15tJG3X7p4Dd/zl9mNqFRBR4ZfIxhRyfWuEXj4DIKjNUhORsqh8m4YkFTh1vwyAw
         iyd+M4+f1yeXh77RBvmJ2epMefw6jWv7Z4UtGXoYcPC17GRuLf30ygXQ6kXFWrAWSjot
         BuS0sa6bTNmUL+CA5lHvLCEjjuA11WZtCvGqambv0ftqLgXPYZ2IrVgUzrzFrI+OwUke
         NJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568673; x=1688160673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UyShpFpgVR6i39SmTUNSXyIOGqdGil6rpZQyINgvaNc=;
        b=HtGrM5HJQf8V8Fl1JYfDtrcpTiB/99EO+qHm6l/ZhKonjkH/PoHaAo4MMhBhTJGu+0
         Z8qaUoIHi2x1DUDqAyhBEop22ojbeJ1OSL50O6Eaoyj956t2TcKuBw4lAjVWc0+MSIDK
         4eVzXJpVQa6UBtf2+2sKt/RmNm1820PbllLmXn2YdCJoV1S978kIVkmdxLAwbN1iQExB
         4D+SriDcNYM9U1BvRl+HPGKxnPPvpdVasP1pVXp8B6UI8hOTIqkgV4oa353WGOhWP7t8
         IkMyH6MTg6hTLGP/ZZJ1cXWtwy9SSLwIwZ+WwQc4y6L7JKOo6AsQoCKfCdbfxNxyKZki
         Vnnw==
X-Gm-Message-State: AC+VfDxZomFXQ1vMnvHyjq7l8qK1YdVk8gSQultOCVaUKM2Rm5G02Hqe
	KxytKOHbC7zerwNBIMywkOc=
X-Google-Smtp-Source: ACHHUZ6mRQVnU5urUM106lddsvyZ49x5l1bfNIRf6BQNoX3kHicchX9XznOVWCanWsbzCT3HXivh6Q==
X-Received: by 2002:a81:86c1:0:b0:559:e235:5f65 with SMTP id w184-20020a8186c1000000b00559e2355f65mr7058986ywf.37.1685568673506;
        Wed, 31 May 2023 14:31:13 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:31:13 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3 02/34] s390: Use _pt_s390_gaddr for gmap address tracking
Date: Wed, 31 May 2023 14:30:00 -0700
Message-Id: <20230531213032.25338-3-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

s390 uses page->index to keep track of page tables for the guest address
space. In an attempt to consolidate the usage of page fields in s390,
replace _pt_pad_2 with _pt_s390_gaddr to replace page->index in gmap.

This will help with the splitting of struct ptdesc from struct page, as
well as allow s390 to use _pt_frag_refcount for fragmented page table
tracking.

Since page->_pt_s390_gaddr aliases with mapping, ensure its set to NULL
before freeing the pages as well.

This also reverts commit 7e25de77bc5ea ("s390/mm: use pmd_pgtable_page()
helper in __gmap_segment_gaddr()") which had s390 use
pmd_pgtable_page() to get a gmap page table, as pmd_pgtable_page()
should be used for more generic process page tables.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/s390/mm/gmap.c      | 56 +++++++++++++++++++++++++++-------------
 include/linux/mm_types.h |  2 +-
 2 files changed, 39 insertions(+), 19 deletions(-)

diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
index dc90d1eb0d55..81c683426b49 100644
--- a/arch/s390/mm/gmap.c
+++ b/arch/s390/mm/gmap.c
@@ -70,7 +70,7 @@ static struct gmap *gmap_alloc(unsigned long limit)
 	page = alloc_pages(GFP_KERNEL_ACCOUNT, CRST_ALLOC_ORDER);
 	if (!page)
 		goto out_free;
-	page->index = 0;
+	page->_pt_s390_gaddr = 0;
 	list_add(&page->lru, &gmap->crst_list);
 	table = page_to_virt(page);
 	crst_table_init(table, etype);
@@ -187,16 +187,20 @@ static void gmap_free(struct gmap *gmap)
 	if (!(gmap_is_shadow(gmap) && gmap->removed))
 		gmap_flush_tlb(gmap);
 	/* Free all segment & region tables. */
-	list_for_each_entry_safe(page, next, &gmap->crst_list, lru)
+	list_for_each_entry_safe(page, next, &gmap->crst_list, lru) {
+		page->_pt_s390_gaddr = 0;
 		__free_pages(page, CRST_ALLOC_ORDER);
+	}
 	gmap_radix_tree_free(&gmap->guest_to_host);
 	gmap_radix_tree_free(&gmap->host_to_guest);
 
 	/* Free additional data for a shadow gmap */
 	if (gmap_is_shadow(gmap)) {
 		/* Free all page tables. */
-		list_for_each_entry_safe(page, next, &gmap->pt_list, lru)
+		list_for_each_entry_safe(page, next, &gmap->pt_list, lru) {
+			page->_pt_s390_gaddr = 0;
 			page_table_free_pgste(page);
+		}
 		gmap_rmap_radix_tree_free(&gmap->host_to_rmap);
 		/* Release reference to the parent */
 		gmap_put(gmap->parent);
@@ -318,12 +322,14 @@ static int gmap_alloc_table(struct gmap *gmap, unsigned long *table,
 		list_add(&page->lru, &gmap->crst_list);
 		*table = __pa(new) | _REGION_ENTRY_LENGTH |
 			(*table & _REGION_ENTRY_TYPE_MASK);
-		page->index = gaddr;
+		page->_pt_s390_gaddr = gaddr;
 		page = NULL;
 	}
 	spin_unlock(&gmap->guest_table_lock);
-	if (page)
+	if (page) {
+		page->_pt_s390_gaddr = 0;
 		__free_pages(page, CRST_ALLOC_ORDER);
+	}
 	return 0;
 }
 
@@ -336,12 +342,14 @@ static int gmap_alloc_table(struct gmap *gmap, unsigned long *table,
 static unsigned long __gmap_segment_gaddr(unsigned long *entry)
 {
 	struct page *page;
-	unsigned long offset;
+	unsigned long offset, mask;
 
 	offset = (unsigned long) entry / sizeof(unsigned long);
 	offset = (offset & (PTRS_PER_PMD - 1)) * PMD_SIZE;
-	page = pmd_pgtable_page((pmd_t *) entry);
-	return page->index + offset;
+	mask = ~(PTRS_PER_PMD * sizeof(pmd_t) - 1);
+	page = virt_to_page((void *)((unsigned long) entry & mask));
+
+	return page->_pt_s390_gaddr + offset;
 }
 
 /**
@@ -1351,6 +1359,7 @@ static void gmap_unshadow_pgt(struct gmap *sg, unsigned long raddr)
 	/* Free page table */
 	page = phys_to_page(pgt);
 	list_del(&page->lru);
+	page->_pt_s390_gaddr = 0;
 	page_table_free_pgste(page);
 }
 
@@ -1379,6 +1388,7 @@ static void __gmap_unshadow_sgt(struct gmap *sg, unsigned long raddr,
 		/* Free page table */
 		page = phys_to_page(pgt);
 		list_del(&page->lru);
+		page->_pt_s390_gaddr = 0;
 		page_table_free_pgste(page);
 	}
 }
@@ -1409,6 +1419,7 @@ static void gmap_unshadow_sgt(struct gmap *sg, unsigned long raddr)
 	/* Free segment table */
 	page = phys_to_page(sgt);
 	list_del(&page->lru);
+	page->_pt_s390_gaddr = 0;
 	__free_pages(page, CRST_ALLOC_ORDER);
 }
 
@@ -1437,6 +1448,7 @@ static void __gmap_unshadow_r3t(struct gmap *sg, unsigned long raddr,
 		/* Free segment table */
 		page = phys_to_page(sgt);
 		list_del(&page->lru);
+		page->_pt_s390_gaddr = 0;
 		__free_pages(page, CRST_ALLOC_ORDER);
 	}
 }
@@ -1467,6 +1479,7 @@ static void gmap_unshadow_r3t(struct gmap *sg, unsigned long raddr)
 	/* Free region 3 table */
 	page = phys_to_page(r3t);
 	list_del(&page->lru);
+	page->_pt_s390_gaddr = 0;
 	__free_pages(page, CRST_ALLOC_ORDER);
 }
 
@@ -1495,6 +1508,7 @@ static void __gmap_unshadow_r2t(struct gmap *sg, unsigned long raddr,
 		/* Free region 3 table */
 		page = phys_to_page(r3t);
 		list_del(&page->lru);
+		page->_pt_s390_gaddr = 0;
 		__free_pages(page, CRST_ALLOC_ORDER);
 	}
 }
@@ -1525,6 +1539,7 @@ static void gmap_unshadow_r2t(struct gmap *sg, unsigned long raddr)
 	/* Free region 2 table */
 	page = phys_to_page(r2t);
 	list_del(&page->lru);
+	page->_pt_s390_gaddr = 0;
 	__free_pages(page, CRST_ALLOC_ORDER);
 }
 
@@ -1557,6 +1572,7 @@ static void __gmap_unshadow_r1t(struct gmap *sg, unsigned long raddr,
 		/* Free region 2 table */
 		page = phys_to_page(r2t);
 		list_del(&page->lru);
+		page->_pt_s390_gaddr = 0;
 		__free_pages(page, CRST_ALLOC_ORDER);
 	}
 }
@@ -1762,9 +1778,9 @@ int gmap_shadow_r2t(struct gmap *sg, unsigned long saddr, unsigned long r2t,
 	page = alloc_pages(GFP_KERNEL_ACCOUNT, CRST_ALLOC_ORDER);
 	if (!page)
 		return -ENOMEM;
-	page->index = r2t & _REGION_ENTRY_ORIGIN;
+	page->_pt_s390_gaddr = r2t & _REGION_ENTRY_ORIGIN;
 	if (fake)
-		page->index |= GMAP_SHADOW_FAKE_TABLE;
+		page->_pt_s390_gaddr |= GMAP_SHADOW_FAKE_TABLE;
 	s_r2t = page_to_phys(page);
 	/* Install shadow region second table */
 	spin_lock(&sg->guest_table_lock);
@@ -1814,6 +1830,7 @@ int gmap_shadow_r2t(struct gmap *sg, unsigned long saddr, unsigned long r2t,
 	return rc;
 out_free:
 	spin_unlock(&sg->guest_table_lock);
+	page->_pt_s390_gaddr = 0;
 	__free_pages(page, CRST_ALLOC_ORDER);
 	return rc;
 }
@@ -1846,9 +1863,9 @@ int gmap_shadow_r3t(struct gmap *sg, unsigned long saddr, unsigned long r3t,
 	page = alloc_pages(GFP_KERNEL_ACCOUNT, CRST_ALLOC_ORDER);
 	if (!page)
 		return -ENOMEM;
-	page->index = r3t & _REGION_ENTRY_ORIGIN;
+	page->_pt_s390_gaddr = r3t & _REGION_ENTRY_ORIGIN;
 	if (fake)
-		page->index |= GMAP_SHADOW_FAKE_TABLE;
+		page->_pt_s390_gaddr |= GMAP_SHADOW_FAKE_TABLE;
 	s_r3t = page_to_phys(page);
 	/* Install shadow region second table */
 	spin_lock(&sg->guest_table_lock);
@@ -1898,6 +1915,7 @@ int gmap_shadow_r3t(struct gmap *sg, unsigned long saddr, unsigned long r3t,
 	return rc;
 out_free:
 	spin_unlock(&sg->guest_table_lock);
+	page->_pt_s390_gaddr = 0;
 	__free_pages(page, CRST_ALLOC_ORDER);
 	return rc;
 }
@@ -1930,9 +1948,9 @@ int gmap_shadow_sgt(struct gmap *sg, unsigned long saddr, unsigned long sgt,
 	page = alloc_pages(GFP_KERNEL_ACCOUNT, CRST_ALLOC_ORDER);
 	if (!page)
 		return -ENOMEM;
-	page->index = sgt & _REGION_ENTRY_ORIGIN;
+	page->_pt_s390_gaddr = sgt & _REGION_ENTRY_ORIGIN;
 	if (fake)
-		page->index |= GMAP_SHADOW_FAKE_TABLE;
+		page->_pt_s390_gaddr |= GMAP_SHADOW_FAKE_TABLE;
 	s_sgt = page_to_phys(page);
 	/* Install shadow region second table */
 	spin_lock(&sg->guest_table_lock);
@@ -1982,6 +2000,7 @@ int gmap_shadow_sgt(struct gmap *sg, unsigned long saddr, unsigned long sgt,
 	return rc;
 out_free:
 	spin_unlock(&sg->guest_table_lock);
+	page->_pt_s390_gaddr = 0;
 	__free_pages(page, CRST_ALLOC_ORDER);
 	return rc;
 }
@@ -2014,9 +2033,9 @@ int gmap_shadow_pgt_lookup(struct gmap *sg, unsigned long saddr,
 	if (table && !(*table & _SEGMENT_ENTRY_INVALID)) {
 		/* Shadow page tables are full pages (pte+pgste) */
 		page = pfn_to_page(*table >> PAGE_SHIFT);
-		*pgt = page->index & ~GMAP_SHADOW_FAKE_TABLE;
+		*pgt = page->_pt_s390_gaddr & ~GMAP_SHADOW_FAKE_TABLE;
 		*dat_protection = !!(*table & _SEGMENT_ENTRY_PROTECT);
-		*fake = !!(page->index & GMAP_SHADOW_FAKE_TABLE);
+		*fake = !!(page->_pt_s390_gaddr & GMAP_SHADOW_FAKE_TABLE);
 		rc = 0;
 	} else  {
 		rc = -EAGAIN;
@@ -2054,9 +2073,9 @@ int gmap_shadow_pgt(struct gmap *sg, unsigned long saddr, unsigned long pgt,
 	page = page_table_alloc_pgste(sg->mm);
 	if (!page)
 		return -ENOMEM;
-	page->index = pgt & _SEGMENT_ENTRY_ORIGIN;
+	page->_pt_s390_gaddr = pgt & _SEGMENT_ENTRY_ORIGIN;
 	if (fake)
-		page->index |= GMAP_SHADOW_FAKE_TABLE;
+		page->_pt_s390_gaddr |= GMAP_SHADOW_FAKE_TABLE;
 	s_pgt = page_to_phys(page);
 	/* Install shadow page table */
 	spin_lock(&sg->guest_table_lock);
@@ -2101,6 +2120,7 @@ int gmap_shadow_pgt(struct gmap *sg, unsigned long saddr, unsigned long pgt,
 	return rc;
 out_free:
 	spin_unlock(&sg->guest_table_lock);
+	page->_pt_s390_gaddr = 0;
 	page_table_free_pgste(page);
 	return rc;
 
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 306a3d1a0fa6..6161fe1ae5b8 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -144,7 +144,7 @@ struct page {
 		struct {	/* Page table pages */
 			unsigned long _pt_pad_1;	/* compound_head */
 			pgtable_t pmd_huge_pte; /* protected by page->ptl */
-			unsigned long _pt_pad_2;	/* mapping */
+			unsigned long _pt_s390_gaddr;	/* mapping */
 			union {
 				struct mm_struct *pt_mm; /* x86 pgds only */
 				atomic_t pt_frag_refcount; /* powerpc */
-- 
2.40.1

