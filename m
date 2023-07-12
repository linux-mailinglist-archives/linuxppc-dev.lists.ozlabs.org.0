Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3659B74FE5C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 06:40:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=XYfimDGo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R14mq0lv1z3cV9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 14:40:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=XYfimDGo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R14lx1MwFz304l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 14:39:56 +1000 (AEST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5703d12ab9aso76389327b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 21:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689136793; x=1691728793;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2t2oc+yeedMzdUFXYKBxRHbKcZMzrhHMUkscNN4bTko=;
        b=XYfimDGolFEty51TCKUyAZmm69LKogtUNWLIyMCuw81Si1ZjaboZJMyonyZe8BlA1H
         4dw7ywAuqviGzR+cqYGZtxV+ytY3jiQkgFAvjXIkhqrYEAwOpEMsZRaoOyR5rEd3GDD+
         6LnUt02lOICM7P8CDg5UfhiUAjvip1TQsKWkNZqXUfOXl95Q2+l607lxyvF7WfoMEkup
         n8srQ8rKA7PHkhNMQEN57jpX0Q3gk0ZBR2Liws8TUdU4okAi97PytXAsy84/ZZk7I96p
         LrZbc0ZAQKs4VNt1L3qD7duolPC2jOZozxLhx0DiCnOdCct9HdR1WwipR08docsFv3CN
         0s6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689136793; x=1691728793;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2t2oc+yeedMzdUFXYKBxRHbKcZMzrhHMUkscNN4bTko=;
        b=QCTl3m1ZwCxuQHRCdH6PAiOoqDqENa1i1kR/600e3l3cDcdCs0M5KqEV4rRlsQrGCU
         v5g7peRq14JwmjfLq04Qez0V4ZZHxm1Gt0r11HlhwLw56j4ZHfzDsM+XGg1c5MaCl1RC
         4S5oh6wph70HgzMQsUNP8qn7V+YxbOdPlygP82TuOq8xpgD0im8bKHQQ+8PQQj9Atj2e
         AcqDhybjHMrIeovovAvqdomynWGPvg++84VKIOsJzhrvjhq4TC++nExPc5p2kboptM1n
         BqBz7HPhg0KWRZymOvUx3loDcHoQJJbTV3XMXbp4dbVMRbk2bSEZvDLFOWp2R7CFFLIv
         Hj1A==
X-Gm-Message-State: ABy/qLaUOEVKCc7+0pJ1NoZsX9gYJA6vDmnkewyTUjDUkc4tjurDecd4
	ilyCPRoDk8hz2+wuvepN9tgUOw==
X-Google-Smtp-Source: APBJJlH7ohd7+cM8rUQREK94h0qZle8YpJFolayyIig71Hbg47eK0cJuvgfSIYJvI0oB6MYKn3tkcQ==
X-Received: by 2002:a81:a187:0:b0:579:efb4:7d08 with SMTP id y129-20020a81a187000000b00579efb47d08mr15922621ywg.27.1689136793558;
        Tue, 11 Jul 2023 21:39:53 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id f130-20020a816a88000000b005702bfb19bfsm974843ywc.130.2023.07.11.21.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 21:39:53 -0700 (PDT)
Date: Tue, 11 Jul 2023 21:39:48 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 08/13] mm/pgtable: add pte_free_defer() for pgtable as
 page
In-Reply-To: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com>
Message-ID: <78e921b0-b681-a1b0-dc20-44c9efa4ef3c@google.com>
References: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
  Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
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
index de10fc797c8e..17a7868f00bd 100644
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
 				struct mm_struct *pt_mm; /* x86 pgds only */
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 7f2db400f653..9fa34be65159 100644
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
index b9a0c2137cc1..fa9d4d084291 100644
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

