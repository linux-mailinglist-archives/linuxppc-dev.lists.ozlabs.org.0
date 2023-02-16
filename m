Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CBF698C06
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:32:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHNr12XKcz3fW5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:32:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=S2sXkiCN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3p7ztywykdpwwyvirfksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=S2sXkiCN;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNWs6r7Cz3f3q
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:18:33 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id t127-20020a254685000000b00953ffdfbe1aso833722yba.23
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4tPY63bpwhpT+tcOBCZmVWQ4EsQSsAiOumfwemoUSR4=;
        b=S2sXkiCN7LWOjXaeaMYvz0qNJtP37xcl3aD2Yh+x1ZEOEg3KLdTaCbat1bdYvpjsne
         ssUpFmsgMZn2ZzaQIQ1nCUMhum1BKo1kVXXpN4w0/hSPSa2H/9hW6SiJ4urWGDrWEDIg
         /lDLOzKc/0bGJk2Y7O7P1pt9zjSY2dn9UPLftjGBDJCogvybLOdBJ/pVV0l/nLyc8nbd
         78hCVT3xeGJZ3GfClpuKXysNAZLItz5CqeYcRfuccmKUwUq5LhC6V5ar511CeqKShlzR
         g15CQtYg8YR8Te7+dSB+30LV6maBKvWp8iWZepEStLZa94uN9djYv3KGIMR2EUqABQ+Q
         /xVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4tPY63bpwhpT+tcOBCZmVWQ4EsQSsAiOumfwemoUSR4=;
        b=5RuQslZHfmtVpm52wDlRaX+NSPhMY+iY4A4htc7xCHZVxQIWEzUAEYIYRlL+UDmClY
         tFwVSsFtv8B26As1CTzu+dQVHGV+JMD4joYZi4AAH0Cd7eOjBlS8imaPNmVSDUn6MWLk
         /aINmc5HOZF9PqTvaErD2xge+TtKjGqkz9lTK9o5ClN9FFyuAbqy4L9Z5VoiqtfwXrbO
         frwFEN/cvtJq2K0AlanZVVMnuACupME/ZGjcTvn8eP3lIogfPfC4MtxebqjUYtekOps+
         D5OQZ8SaZu61cUq7h1s3MJ3P1OTybrMjlLYXlUk78SIjnarMHKFjZIa4vZfLVzjBisb6
         MP0w==
X-Gm-Message-State: AO0yUKXVNuV+CAny44+7Te1tI4Iyy/nNVXUd+iJ6wkjbfGpeo7KBC8Me
	QOu3YkAcIuuDbuV0VBtHCbqP7wex4vs=
X-Google-Smtp-Source: AK7set+CCkBNuKyDmku/7wwfF8A9hgf/5Gdg5m5aj/wzSHdI7lsc4GkupJYUuH2rfCym/bLqx0hNud/JqYI=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a05:6902:10f:b0:855:fa17:4f5f with SMTP id
 o15-20020a056902010f00b00855fa174f5fmr82ybh.1.1676524711465; Wed, 15 Feb 2023
 21:18:31 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:30 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-16-surenb@google.com>
Subject: [PATCH v3 15/35] mm/khugepaged: write-lock VMA while collapsing a
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org,
  hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
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
index 8dbc39896811..d9376acf1fbe 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1140,6 +1140,7 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 	if (result != SCAN_SUCCEED)
 		goto out_up_write;
 
+	vma_start_write(vma);
 	anon_vma_lock_write(vma->anon_vma);
 
 	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, address,
@@ -1607,6 +1608,9 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 		goto drop_hpage;
 	}
 
+	/* Lock the vma before taking i_mmap and page table locks */
+	vma_start_write(vma);
+
 	/*
 	 * We need to lock the mapping so that from here on, only GUP-fast and
 	 * hardware page walks can access the parts of the page tables that
@@ -1812,6 +1816,7 @@ static int retract_page_tables(struct address_space *mapping, pgoff_t pgoff,
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

