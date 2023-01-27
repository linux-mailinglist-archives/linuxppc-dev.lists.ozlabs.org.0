Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEAC67EED5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 20:54:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3SwD49htz3fYm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 06:54:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=MwDUDcWN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3-yjuywykdmi02zmvjowwotm.kwutqv25xxk-lm3tq010.w7tij0.wzo@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=MwDUDcWN;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3SdB2jBSz3fL2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:41:50 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5065604854eso65762277b3.16
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Tx+qt9ZwCfzeziH+AxLsfIEHPwRgvIaxjFEfdwiAVs=;
        b=MwDUDcWNdtFYfmhAuC43tEYj+bx0/7zv78dJ0hpiWDqIAfrnPySCh31pwGtES+llPo
         g9aJ1BaJcPmj6QIFKuJtNB4+OKnKX4w74YBlWwFtrSbaxVsErI4QpqtlUvrQKvku3x0Y
         fv8bSpOOjUv/1+/JuPfz5M6ciXa9EK4OZHTaoyyN5QHozfr1J0btP+Cb6s+q8s6DTvgx
         Eb/YBgAB71iKrit1/2Z+f0K+0VaK6nNNkqEz24OPAMCTiIMwYOn1N+e1hh+02mLm2qhR
         X0SB7IZ09+W7stQU0DgYwMtwYdWCgN82KCjbLOZQQ4WgzpAt4BTc4SEqK+AY1F70NhR7
         prsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Tx+qt9ZwCfzeziH+AxLsfIEHPwRgvIaxjFEfdwiAVs=;
        b=P4rgQ3niYZQ4lCG+V7J+FDthy/yk7Y1+sExETXPptxs+pYjfic1dNJdeVvmuehRZRe
         ofUj4YnVf6aUet4e0xRqO/U7v3wRVbyY2wsuC6JD6d8533/NRyIrskgaW242hra3J+CU
         peaq52SLXR2MkQV50lXbmuR7OiGpC8XgR9boAA5693E6Ae1aeQYVi7noh8vl4wYlNdvR
         H733up/PjYsKjsTXCvGOoLpBrAnux2D8iEWUX5faOrh+9/63/qPCiCTebmSs8zLURJw5
         KMzvbfl2g8BFIjZQ7Y511hYzEfKpRhRyKVLRVxGz2JnxZUOzsBGcFgaWTMO8SmcMwOpb
         KxFg==
X-Gm-Message-State: AO0yUKURa5xhAMRRAgQGyt2Q/ElMjT16OK3S4bDqzEwL0NCpJKJHp+e9
	mGOSb9bsB50kk0ete27nZ1h2+C7txSQ=
X-Google-Smtp-Source: AK7set+eTaGDRvBxQnOso6u8cp6LCvB6g6dz+di36ExTAmlNkOKvBeltyp9kLCTqVY9tlqnocHmCi479DpA=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a81:6008:0:b0:506:833a:c32e with SMTP id
 u8-20020a816008000000b00506833ac32emr1175163ywb.50.1674848507730; Fri, 27 Jan
 2023 11:41:47 -0800 (PST)
Date: Fri, 27 Jan 2023 11:40:51 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-15-surenb@google.com>
Subject: [PATCH v2 14/33] mm/khugepaged: write-lock VMA while collapsing a
 huge page
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rp
 pt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Protect VMA from concurrent page fault handler while collapsing a huge
page. Page fault handler needs a stable PMD to use PTL and relies on
per-VMA lock to prevent concurrent PMD changes. pmdp_collapse_flush(),
set_huge_pmd() and collapse_and_free_pmd() can modify a PMD, which will
not be detected by a page fault handler without proper locking.

Before this patch, page tables can be walked under any one of the
mmap_lock, the mapping lock, and the anon_vma lock; so when khugepaged
unlinks and frees page tables, it must ensure that all of those either
are locked or don't exist. This patch adds a fourth lock under which
page tables can be traversed, and so khugepaged must also lock out that
one.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/khugepaged.c |  5 +++++
 mm/rmap.c       | 31 ++++++++++++++++---------------
 2 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index eb38bd1b1b2f..b938b286cdc3 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1134,6 +1134,7 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 	if (result != SCAN_SUCCEED)
 		goto out_up_write;
 
+	vma_start_write(vma);
 	anon_vma_lock_write(vma->anon_vma);
 
 	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, address,
@@ -1601,6 +1602,9 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 		goto drop_hpage;
 	}
 
+	/* Lock the vma before taking i_mmap and page table locks */
+	vma_start_write(vma);
+
 	/*
 	 * We need to lock the mapping so that from here on, only GUP-fast and
 	 * hardware page walks can access the parts of the page tables that
@@ -1806,6 +1810,7 @@ static int retract_page_tables(struct address_space *mapping, pgoff_t pgoff,
 				result = SCAN_PTE_UFFD_WP;
 				goto unlock_next;
 			}
+			vma_start_write(vma);
 			collapse_and_free_pmd(mm, vma, addr, pmd);
 			if (!cc->is_khugepaged && is_target)
 				result = set_huge_pmd(vma, addr, pmd, hpage);
diff --git a/mm/rmap.c b/mm/rmap.c
index 15ae24585fc4..8e1a2ad9ca53 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -25,21 +25,22 @@
  *     mapping->invalidate_lock (in filemap_fault)
  *       page->flags PG_locked (lock_page)
  *         hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share, see hugetlbfs below)
- *           mapping->i_mmap_rwsem
- *             anon_vma->rwsem
- *               mm->page_table_lock or pte_lock
- *                 swap_lock (in swap_duplicate, swap_info_get)
- *                   mmlist_lock (in mmput, drain_mmlist and others)
- *                   mapping->private_lock (in block_dirty_folio)
- *                     folio_lock_memcg move_lock (in block_dirty_folio)
- *                       i_pages lock (widely used)
- *                         lruvec->lru_lock (in folio_lruvec_lock_irq)
- *                   inode->i_lock (in set_page_dirty's __mark_inode_dirty)
- *                   bdi.wb->list_lock (in set_page_dirty's __mark_inode_dirty)
- *                     sb_lock (within inode_lock in fs/fs-writeback.c)
- *                     i_pages lock (widely used, in set_page_dirty,
- *                               in arch-dependent flush_dcache_mmap_lock,
- *                               within bdi.wb->list_lock in __sync_single_inode)
+ *           vma_start_write
+ *             mapping->i_mmap_rwsem
+ *               anon_vma->rwsem
+ *                 mm->page_table_lock or pte_lock
+ *                   swap_lock (in swap_duplicate, swap_info_get)
+ *                     mmlist_lock (in mmput, drain_mmlist and others)
+ *                     mapping->private_lock (in block_dirty_folio)
+ *                       folio_lock_memcg move_lock (in block_dirty_folio)
+ *                         i_pages lock (widely used)
+ *                           lruvec->lru_lock (in folio_lruvec_lock_irq)
+ *                     inode->i_lock (in set_page_dirty's __mark_inode_dirty)
+ *                     bdi.wb->list_lock (in set_page_dirty's __mark_inode_dirty)
+ *                       sb_lock (within inode_lock in fs/fs-writeback.c)
+ *                       i_pages lock (widely used, in set_page_dirty,
+ *                                 in arch-dependent flush_dcache_mmap_lock,
+ *                                 within bdi.wb->list_lock in __sync_single_inode)
  *
  * anon_vma->rwsem,mapping->i_mmap_rwsem   (memory_failure, collect_procs_anon)
  *   ->tasklist_lock
-- 
2.39.1

