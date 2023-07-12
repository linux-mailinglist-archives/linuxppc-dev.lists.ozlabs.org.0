Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C64C74FE7A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 06:47:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=J1OyC/Pz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R14wt2K2hz3cRH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 14:47:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=J1OyC/Pz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R14vW59pCz3cF2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 14:46:31 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-c4dd264359cso6107429276.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 21:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689137189; x=1691729189;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4LOZtvGEF5g0eQvRdR0fiwT6tMgm62bdW0dz/Hhyqlk=;
        b=J1OyC/PzRxAcAnxReOGyZoimdKHV4sne6EV+ZF5GnSzIGkj49DIxf8CJZXSiYaLo8O
         rQDVnXnu0y21FRcOCZP0OeEhb8w1Ae51u8RxjVwTlnPwlHyRZu5pHWxjcdG3sLbNOkgm
         l9DRu2V+r91JT6sg8uxZ0xdueMEWKHVeYHw/ucTn/rvDkwQeKDUMIXdd66/4pn+ZPDqc
         bbexzf/2xXArSFmFzEjH5dtsWbOgASWzeyhuG3Z+bgzkYYJreHWjygSN0MaZVhpwfXUc
         /vz1Ww9YOcG9dsJAekHocNmUdgaeY/Jq/K6dI5tFUgzSXd3eubGhE9SWhC2zJPkylOJH
         UPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689137189; x=1691729189;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4LOZtvGEF5g0eQvRdR0fiwT6tMgm62bdW0dz/Hhyqlk=;
        b=YREYTa00i6qoJrCs8t9ulRSFsr27kJBLSI5Tn/4EUxdVouKbz5JNSU+5aFXEGAx5qL
         mCGjPnIiqLjzxGq9k3uYrVsYb/JGBv43wgVbupNAiuDzIA2/tum5uUW/7XvV1woUwUrd
         /MynZ8efSFUEMMvoqQfoJtbVBlVKotW8U6BLUsjcQ03bs40+BUIVfI4e2tLR/PmiiP04
         rvaddn+cjzS+h3zYh4dO0TBvPC6adhf+Vpbd9GVECpz4k+Zw0NSwjd8lJHL3cnA/GF4I
         O/OZbbVTaqRUdcDo7sK2sD/PqufTbmSOEwT089O/7ZSeKx/wZz4MShlSBpphGDOs0dhK
         R8NA==
X-Gm-Message-State: ABy/qLZ6vC8FsL7hUg8VMrbdRd72/vkBbnb5vKJKib7Nvezprw3cTpzr
	886Wmk00+Xl5Dl3T286HX1dpbA==
X-Google-Smtp-Source: APBJJlGajCIPfwdsjGp7sM9eUSR1neGCrgzZWT479LGOvJujy6hRuJqugeEnCaM3mBFakTQjRwJQ+w==
X-Received: by 2002:a81:5dd6:0:b0:562:16d7:e6eb with SMTP id r205-20020a815dd6000000b0056216d7e6ebmr17894738ywb.40.1689137189022;
        Tue, 11 Jul 2023 21:46:29 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id j126-20020a0df984000000b005772e9388cdsm969335ywf.62.2023.07.11.21.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 21:46:28 -0700 (PDT)
Date: Tue, 11 Jul 2023 21:46:23 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 13/13] mm/pgtable: notes on pte_offset_map[_lock]()
In-Reply-To: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com>
Message-ID: <b791c3b0-25c6-a263-d785-d564344eb644@google.com>
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

Add a block of comments on pte_offset_map_lock(), pte_offset_map() and
pte_offset_map_nolock() to mm/pgtable-generic.c, to help explain them.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 mm/pgtable-generic.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index fa9d4d084291..4fcd959dcc4d 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -315,6 +315,50 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
 	return pte;
 }
 
+/*
+ * pte_offset_map_lock(mm, pmd, addr, ptlp), and its internal implementation
+ * __pte_offset_map_lock() below, is usually called with the pmd pointer for
+ * addr, reached by walking down the mm's pgd, p4d, pud for addr: either while
+ * holding mmap_lock or vma lock for read or for write; or in truncate or rmap
+ * context, while holding file's i_mmap_lock or anon_vma lock for read (or for
+ * write). In a few cases, it may be used with pmd pointing to a pmd_t already
+ * copied to or constructed on the stack.
+ *
+ * When successful, it returns the pte pointer for addr, with its page table
+ * kmapped if necessary (when CONFIG_HIGHPTE), and locked against concurrent
+ * modification by software, with a pointer to that spinlock in ptlp (in some
+ * configs mm->page_table_lock, in SPLIT_PTLOCK configs a spinlock in table's
+ * struct page).  pte_unmap_unlock(pte, ptl) to unlock and unmap afterwards.
+ *
+ * But it is unsuccessful, returning NULL with *ptlp unchanged, if there is no
+ * page table at *pmd: if, for example, the page table has just been removed,
+ * or replaced by the huge pmd of a THP.  (When successful, *pmd is rechecked
+ * after acquiring the ptlock, and retried internally if it changed: so that a
+ * page table can be safely removed or replaced by THP while holding its lock.)
+ *
+ * pte_offset_map(pmd, addr), and its internal helper __pte_offset_map() above,
+ * just returns the pte pointer for addr, its page table kmapped if necessary;
+ * or NULL if there is no page table at *pmd.  It does not attempt to lock the
+ * page table, so cannot normally be used when the page table is to be updated,
+ * or when entries read must be stable.  But it does take rcu_read_lock(): so
+ * that even when page table is racily removed, it remains a valid though empty
+ * and disconnected table.  Until pte_unmap(pte) unmaps and rcu_read_unlock()s
+ * afterwards.
+ *
+ * pte_offset_map_nolock(mm, pmd, addr, ptlp), above, is like pte_offset_map();
+ * but when successful, it also outputs a pointer to the spinlock in ptlp - as
+ * pte_offset_map_lock() does, but in this case without locking it.  This helps
+ * the caller to avoid a later pte_lockptr(mm, *pmd), which might by that time
+ * act on a changed *pmd: pte_offset_map_nolock() provides the correct spinlock
+ * pointer for the page table that it returns.  In principle, the caller should
+ * recheck *pmd once the lock is taken; in practice, no callsite needs that -
+ * either the mmap_lock for write, or pte_same() check on contents, is enough.
+ *
+ * Note that free_pgtables(), used after unmapping detached vmas, or when
+ * exiting the whole mm, does not take page table lock before freeing a page
+ * table, and may not use RCU at all: "outsiders" like khugepaged should avoid
+ * pte_offset_map() and co once the vma is detached from mm or mm_users is zero.
+ */
 pte_t *__pte_offset_map_lock(struct mm_struct *mm, pmd_t *pmd,
 			     unsigned long addr, spinlock_t **ptlp)
 {
-- 
2.35.3

