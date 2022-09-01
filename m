Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6055A9E57
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:43:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJT1S4JN4z3cfl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:43:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ObA20LIT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3e-0qywykdlgqspclzemmejc.amkjglsvnna-bctjgqrq.mxjyzq.mpe@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ObA20LIT;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSrF6BN8z3bxt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:35:57 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-335420c7bfeso234906847b3.16
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=r773C9YRjCBNvMT4CzLpPbmrmyQxRNwpck2TtfCck1k=;
        b=ObA20LITrip87VziaHHJxhsQdt90Sartw38u0QjInvigVBBYp9UQt6FfSRSeXBXEZU
         PLrSrOLMVOwI3/sz3dUO/NCHhkXbIW3GF8M34MWk3xttvYsGitw637zJhtS5J3KbjVTq
         FLk9jwJNLpWEznbWA1xdOdydu+93KP79dvrPgyK7xujYPxVhRBYXk7sgB7YC6n2PoUnC
         kIiWKC2Oq5VXot4jMCKtmju4UEkl0k8b2etD7U9K2bdu4kKMwZb5udL9M4YbR2lJrZYA
         TRfi2Vr1zk+DfsN0D7bvgFUbxdpPUkljp0W3vF7qidlJ9uVGD7Pq+2IeCcnvt21qYUIk
         bD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=r773C9YRjCBNvMT4CzLpPbmrmyQxRNwpck2TtfCck1k=;
        b=pgkWD/fEXkbXqxxOIfUZT2FaXWR8WonYyFrIxHlowFUfYEUUNPKoIQ/DjGhJG8CzRJ
         f5uTKPQkO2hi+u+gY4cmMSSITtBPk+FolORjYc1vJkPfsFwaxX9LieomH8cCQp5v4jOg
         dT03UQs0wqXkEGHtm7E7sVBvwTOStV4uvGAa5JPZwKgUcZIdSMsT2vw1GBaxioW6IT0D
         3H9R+gG94DDcpYdsL5VLVx6EIfycybg6S1e5J6RdGEcEyGyyaOFpVoMzjZuDop9pyxv9
         GIFkN0vG49s5xe3nXGFC1fY/xQO/eJWVfEFxJ+2RHWujP94iYM/bseWMsi+DYWwdTTEW
         Rz4w==
X-Gm-Message-State: ACgBeo2Jqa6NDER5afWMfU7MrBP8O4A2yqtw/lZC5r2VEwHbyf6SilWS
	o0Bxx4cS6UV7XpNUpdB8dU3R/yzIpD8=
X-Google-Smtp-Source: AA6agR5CArj0XA3uZUba700jvv45FjGtdD6CkgMKCuV3RkIgq+Sm8gt1hyIVkRx9I0S41UWPyjD3FlSg3pw=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a25:dd05:0:b0:69c:97aa:f08e with SMTP id
 u5-20020a25dd05000000b0069c97aaf08emr9069882ybg.583.1662053755821; Thu, 01
 Sep 2022 10:35:55 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:35:01 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-14-surenb@google.com>
Subject: [RFC PATCH RESEND 13/28] mm: conditionally mark VMA as locked in
 free_pgtables and unmap_page_range
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

free_pgtables and unmap_page_range functions can be called with mmap_lock
held for write (e.g. in mmap_region), held for read (e.g in
madvise_pageout) or not held at all (e.g in madvise_remove might
drop mmap_lock before calling vfs_fallocate, which ends up calling
unmap_page_range).
Provide free_pgtables and unmap_page_range with additional argument
indicating whether to mark the VMA as locked or not based on the usage.
The parameter is set based on whether mmap_lock is held in write mode
during the call. This ensures no change in behavior between mmap_lock
and per-vma locks.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h |  2 +-
 mm/internal.h      |  4 ++--
 mm/memory.c        | 32 +++++++++++++++++++++-----------
 mm/mmap.c          | 17 +++++++++--------
 mm/oom_kill.c      |  3 ++-
 5 files changed, 35 insertions(+), 23 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 476bf936c5f0..dc72be923e5b 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1874,7 +1874,7 @@ void zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
 void zap_page_range(struct vm_area_struct *vma, unsigned long address,
 		    unsigned long size);
 void unmap_vmas(struct mmu_gather *tlb, struct vm_area_struct *start_vma,
-		unsigned long start, unsigned long end);
+		unsigned long start, unsigned long end, bool lock_vma);
 
 struct mmu_notifier_range;
 
diff --git a/mm/internal.h b/mm/internal.h
index 785409805ed7..e6c0f999e0cb 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -85,14 +85,14 @@ bool __folio_end_writeback(struct folio *folio);
 void deactivate_file_folio(struct folio *folio);
 
 void free_pgtables(struct mmu_gather *tlb, struct vm_area_struct *start_vma,
-		unsigned long floor, unsigned long ceiling);
+		unsigned long floor, unsigned long ceiling, bool lock_vma);
 void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte);
 
 struct zap_details;
 void unmap_page_range(struct mmu_gather *tlb,
 			     struct vm_area_struct *vma,
 			     unsigned long addr, unsigned long end,
-			     struct zap_details *details);
+			     struct zap_details *details, bool lock_vma);
 
 void page_cache_ra_order(struct readahead_control *, struct file_ra_state *,
 		unsigned int order);
diff --git a/mm/memory.c b/mm/memory.c
index 4ba73f5aa8bb..9ac9944e8c62 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -403,7 +403,7 @@ void free_pgd_range(struct mmu_gather *tlb,
 }
 
 void free_pgtables(struct mmu_gather *tlb, struct vm_area_struct *vma,
-		unsigned long floor, unsigned long ceiling)
+		unsigned long floor, unsigned long ceiling, bool lock_vma)
 {
 	while (vma) {
 		struct vm_area_struct *next = vma->vm_next;
@@ -413,6 +413,8 @@ void free_pgtables(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		 * Hide vma from rmap and truncate_pagecache before freeing
 		 * pgtables
 		 */
+		if (lock_vma)
+			vma_mark_locked(vma);
 		unlink_anon_vmas(vma);
 		unlink_file_vma(vma);
 
@@ -427,6 +429,8 @@ void free_pgtables(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			       && !is_vm_hugetlb_page(next)) {
 				vma = next;
 				next = vma->vm_next;
+				if (lock_vma)
+					vma_mark_locked(vma);
 				unlink_anon_vmas(vma);
 				unlink_file_vma(vma);
 			}
@@ -1631,12 +1635,16 @@ static inline unsigned long zap_p4d_range(struct mmu_gather *tlb,
 void unmap_page_range(struct mmu_gather *tlb,
 			     struct vm_area_struct *vma,
 			     unsigned long addr, unsigned long end,
-			     struct zap_details *details)
+			     struct zap_details *details,
+			     bool lock_vma)
 {
 	pgd_t *pgd;
 	unsigned long next;
 
 	BUG_ON(addr >= end);
+	if (lock_vma)
+		vma_mark_locked(vma);
+
 	tlb_start_vma(tlb, vma);
 	pgd = pgd_offset(vma->vm_mm, addr);
 	do {
@@ -1652,7 +1660,7 @@ void unmap_page_range(struct mmu_gather *tlb,
 static void unmap_single_vma(struct mmu_gather *tlb,
 		struct vm_area_struct *vma, unsigned long start_addr,
 		unsigned long end_addr,
-		struct zap_details *details)
+		struct zap_details *details, bool lock_vma)
 {
 	unsigned long start = max(vma->vm_start, start_addr);
 	unsigned long end;
@@ -1691,7 +1699,7 @@ static void unmap_single_vma(struct mmu_gather *tlb,
 				i_mmap_unlock_write(vma->vm_file->f_mapping);
 			}
 		} else
-			unmap_page_range(tlb, vma, start, end, details);
+			unmap_page_range(tlb, vma, start, end, details, lock_vma);
 	}
 }
 
@@ -1715,7 +1723,7 @@ static void unmap_single_vma(struct mmu_gather *tlb,
  */
 void unmap_vmas(struct mmu_gather *tlb,
 		struct vm_area_struct *vma, unsigned long start_addr,
-		unsigned long end_addr)
+		unsigned long end_addr, bool lock_vma)
 {
 	struct mmu_notifier_range range;
 	struct zap_details details = {
@@ -1728,7 +1736,8 @@ void unmap_vmas(struct mmu_gather *tlb,
 				start_addr, end_addr);
 	mmu_notifier_invalidate_range_start(&range);
 	for ( ; vma && vma->vm_start < end_addr; vma = vma->vm_next)
-		unmap_single_vma(tlb, vma, start_addr, end_addr, &details);
+		unmap_single_vma(tlb, vma, start_addr, end_addr, &details,
+				 lock_vma);
 	mmu_notifier_invalidate_range_end(&range);
 }
 
@@ -1753,7 +1762,7 @@ void zap_page_range(struct vm_area_struct *vma, unsigned long start,
 	update_hiwater_rss(vma->vm_mm);
 	mmu_notifier_invalidate_range_start(&range);
 	for ( ; vma && vma->vm_start < range.end; vma = vma->vm_next)
-		unmap_single_vma(&tlb, vma, start, range.end, NULL);
+		unmap_single_vma(&tlb, vma, start, range.end, NULL, false);
 	mmu_notifier_invalidate_range_end(&range);
 	tlb_finish_mmu(&tlb);
 }
@@ -1768,7 +1777,7 @@ void zap_page_range(struct vm_area_struct *vma, unsigned long start,
  * The range must fit into one VMA.
  */
 static void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
-		unsigned long size, struct zap_details *details)
+		unsigned long size, struct zap_details *details, bool lock_vma)
 {
 	struct mmu_notifier_range range;
 	struct mmu_gather tlb;
@@ -1779,7 +1788,7 @@ static void zap_page_range_single(struct vm_area_struct *vma, unsigned long addr
 	tlb_gather_mmu(&tlb, vma->vm_mm);
 	update_hiwater_rss(vma->vm_mm);
 	mmu_notifier_invalidate_range_start(&range);
-	unmap_single_vma(&tlb, vma, address, range.end, details);
+	unmap_single_vma(&tlb, vma, address, range.end, details, lock_vma);
 	mmu_notifier_invalidate_range_end(&range);
 	tlb_finish_mmu(&tlb);
 }
@@ -1802,7 +1811,7 @@ void zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
 	    		!(vma->vm_flags & VM_PFNMAP))
 		return;
 
-	zap_page_range_single(vma, address, size, NULL);
+	zap_page_range_single(vma, address, size, NULL, true);
 }
 EXPORT_SYMBOL_GPL(zap_vma_ptes);
 
@@ -3483,7 +3492,8 @@ static void unmap_mapping_range_vma(struct vm_area_struct *vma,
 		unsigned long start_addr, unsigned long end_addr,
 		struct zap_details *details)
 {
-	zap_page_range_single(vma, start_addr, end_addr - start_addr, details);
+	zap_page_range_single(vma, start_addr, end_addr - start_addr, details,
+			      false);
 }
 
 static inline void unmap_mapping_range_tree(struct rb_root_cached *root,
diff --git a/mm/mmap.c b/mm/mmap.c
index 121544fd90de..094678b4434b 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -79,7 +79,7 @@ core_param(ignore_rlimit_data, ignore_rlimit_data, bool, 0644);
 
 static void unmap_region(struct mm_struct *mm,
 		struct vm_area_struct *vma, struct vm_area_struct *prev,
-		unsigned long start, unsigned long end);
+		unsigned long start, unsigned long end, bool lock_vma);
 
 static pgprot_t vm_pgprot_modify(pgprot_t oldprot, unsigned long vm_flags)
 {
@@ -1866,7 +1866,7 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 	vma->vm_file = NULL;
 
 	/* Undo any partial mapping done by a device driver. */
-	unmap_region(mm, vma, prev, vma->vm_start, vma->vm_end);
+	unmap_region(mm, vma, prev, vma->vm_start, vma->vm_end, true);
 	if (vm_flags & VM_SHARED)
 		mapping_unmap_writable(file->f_mapping);
 free_vma:
@@ -2626,7 +2626,7 @@ static void remove_vma_list(struct mm_struct *mm, struct vm_area_struct *vma)
  */
 static void unmap_region(struct mm_struct *mm,
 		struct vm_area_struct *vma, struct vm_area_struct *prev,
-		unsigned long start, unsigned long end)
+		unsigned long start, unsigned long end, bool lock_vma)
 {
 	struct vm_area_struct *next = vma_next(mm, prev);
 	struct mmu_gather tlb;
@@ -2634,9 +2634,10 @@ static void unmap_region(struct mm_struct *mm,
 	lru_add_drain();
 	tlb_gather_mmu(&tlb, mm);
 	update_hiwater_rss(mm);
-	unmap_vmas(&tlb, vma, start, end);
+	unmap_vmas(&tlb, vma, start, end, lock_vma);
 	free_pgtables(&tlb, vma, prev ? prev->vm_end : FIRST_USER_ADDRESS,
-				 next ? next->vm_start : USER_PGTABLES_CEILING);
+				 next ? next->vm_start : USER_PGTABLES_CEILING,
+				 lock_vma);
 	tlb_finish_mmu(&tlb);
 }
 
@@ -2849,7 +2850,7 @@ int __do_munmap(struct mm_struct *mm, unsigned long start, size_t len,
 	if (downgrade)
 		mmap_write_downgrade(mm);
 
-	unmap_region(mm, vma, prev, start, end);
+	unmap_region(mm, vma, prev, start, end, !downgrade);
 
 	/* Fix up all other VM information */
 	remove_vma_list(mm, vma);
@@ -3129,8 +3130,8 @@ void exit_mmap(struct mm_struct *mm)
 	tlb_gather_mmu_fullmm(&tlb, mm);
 	/* update_hiwater_rss(mm) here? but nobody should be looking */
 	/* Use -1 here to ensure all VMAs in the mm are unmapped */
-	unmap_vmas(&tlb, vma, 0, -1);
-	free_pgtables(&tlb, vma, FIRST_USER_ADDRESS, USER_PGTABLES_CEILING);
+	unmap_vmas(&tlb, vma, 0, -1, true);
+	free_pgtables(&tlb, vma, FIRST_USER_ADDRESS, USER_PGTABLES_CEILING, true);
 	tlb_finish_mmu(&tlb);
 
 	/* Walk the list again, actually closing and freeing it. */
diff --git a/mm/oom_kill.c b/mm/oom_kill.c
index 3c6cf9e3cd66..6ffa7c511aa3 100644
--- a/mm/oom_kill.c
+++ b/mm/oom_kill.c
@@ -549,7 +549,8 @@ bool __oom_reap_task_mm(struct mm_struct *mm)
 				ret = false;
 				continue;
 			}
-			unmap_page_range(&tlb, vma, range.start, range.end, NULL);
+			unmap_page_range(&tlb, vma, range.start, range.end,
+					 NULL, false);
 			mmu_notifier_invalidate_range_end(&range);
 			tlb_finish_mmu(&tlb);
 		}
-- 
2.37.2.789.g6183377224-goog

