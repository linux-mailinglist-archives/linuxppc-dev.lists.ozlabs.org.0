Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F66D736564
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:54:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=2GY6tb59;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qlf5z00xZz2xvh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 17:53:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=2GY6tb59;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qlf543KfNz2yyc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 17:53:11 +1000 (AEST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5707b429540so53753377b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 00:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687247588; x=1689839588;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5R0zcB6mybnkU9NBbTtghvpq67JAa0crCVDjZ9SpHk=;
        b=2GY6tb59UZYGOHu8Jpard49Ijl8S41fZ8HDgfi6a4gvFJ5750jQeYrmu9nVrvi1jW2
         tp8ypG/banZ4ws6Js9iQQN9cGknEmtht9BWd32J2yMcrVqteXUvW9YR9uMMhKiTOhwCj
         DlNulmZyq+f8KzKXIgNcUSNUMmKGW1CGHEEgbEp/J7IxewrE//XtQewkerpcgsbwL40t
         WfRaz/SdO8RzSMtTrw2rYV18y0/dvvOSll1UA2/d8Zuh32W7Pnj2B4fhDdSSvEN+0aoF
         9f1IZjfj8naj8IynmrWiGUnfEPBGZdaKRscDXhw1Sy1gWU3iNWnHKGQGUPwpRy5JQoX9
         lMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687247588; x=1689839588;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5R0zcB6mybnkU9NBbTtghvpq67JAa0crCVDjZ9SpHk=;
        b=LphCZU410+gq6F7ympLMAsyKB4g7KREzlswzHuQQxJ+2daz+IMezhpx4QwzUUx3hZS
         TZYNhjcWjN29j2gdftvodM7ePaKhZLdrNvCD9HUVM4ENqSZN7lF4qluxLmtCaxIidPVM
         5lhfXngugZtxuyQziZt3d35oJHHZkiv+gMk42mK4kKTRJKi6+XsSW/oWeSXRmL1qjKFi
         lMccHgI3J65st8ubgQCJ4/ybBCreBhQzb8fp683ZeGH3yUOGrq9SwZif2JL3ggxAwlZG
         hHT3UhXrQEPzeVl9G5PskT7XyK8AfL8qtn9NEMxaHTBkqjwYExxuh81e0iCQVcFb8IQr
         qLPQ==
X-Gm-Message-State: AC+VfDyTyFECI+sAdFbySKbNvQgsYv4XfqrqV0arAdQcGsyFU4sXW3yq
	4kKZfIVJWKV5sDtRjBbquTMONw==
X-Google-Smtp-Source: ACHHUZ5uDhFE53584OsFJztx7V9NmKNE+1aQZMwUHlsEN2oJtZCLrBIKo4HQBYW6kI7RzecFkIc3yA==
X-Received: by 2002:a81:6c11:0:b0:56f:f83f:618 with SMTP id h17-20020a816c11000000b0056ff83f0618mr10840742ywc.19.1687247587950;
        Tue, 20 Jun 2023 00:53:07 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id x11-20020a81630b000000b0056ffca5fb01sm370775ywb.117.2023.06.20.00.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 00:53:07 -0700 (PDT)
Date: Tue, 20 Jun 2023 00:53:03 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 08/12] mm/pgtable: add pte_free_defer() for pgtable as
 page
In-Reply-To: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
Message-ID: <3e5961a2-26e5-d1ab-5c4c-527e273e3cc5@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add the generic pte_free_defer(), to call pte_free() via call_rcu().
pte_free_defer() will be called inside khugepaged's retract_page_tables()
loop, where allocating extra memory cannot be relied upon.  This version
suits all those architectures which use an unfragmented page for one page
table (none of whose pte_free()s use the mm arg which was passed to it).

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 include/linux/mm_types.h |  4 ++++
 include/linux/pgtable.h  |  2 ++
 mm/pgtable-generic.c     | 20 ++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 1667a1bdb8a8..09335fa28c41 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -144,6 +144,10 @@ struct page {
 		struct {	/* Page table pages */
 			unsigned long _pt_pad_1;	/* compound_head */
 			pgtable_t pmd_huge_pte; /* protected by page->ptl */
+			/*
+			 * A PTE page table page might be freed by use of
+			 * rcu_head: which overlays those two fields above.
+			 */
 			unsigned long _pt_pad_2;	/* mapping */
 			union {
 				struct mm_struct *pt_mm; /* x86 pgd, s390 */
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 525f1782b466..d18d3e963967 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -112,6 +112,8 @@ static inline void pte_unmap(pte_t *pte)
 }
 #endif
 
+void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
+
 /* Find an entry in the second-level page table.. */
 #ifndef pmd_offset
 static inline pmd_t *pmd_offset(pud_t *pud, unsigned long address)
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 5e85a625ab30..ab3741064bb8 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -13,6 +13,7 @@
 #include <linux/swap.h>
 #include <linux/swapops.h>
 #include <linux/mm_inline.h>
+#include <asm/pgalloc.h>
 #include <asm/tlb.h>
 
 /*
@@ -230,6 +231,25 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long address,
 	return pmd;
 }
 #endif
+
+/* arch define pte_free_defer in asm/pgalloc.h for its own implementation */
+#ifndef pte_free_defer
+static void pte_free_now(struct rcu_head *head)
+{
+	struct page *page;
+
+	page = container_of(head, struct page, rcu_head);
+	pte_free(NULL /* mm not passed and not used */, (pgtable_t)page);
+}
+
+void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
+{
+	struct page *page;
+
+	page = pgtable;
+	call_rcu(&page->rcu_head, pte_free_now);
+}
+#endif /* pte_free_defer */
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 #if defined(CONFIG_GUP_GET_PXX_LOW_HIGH) && \
-- 
2.35.3

