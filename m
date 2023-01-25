Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFA167C10D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 00:42:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2L3g2MLfz3fJQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 10:42:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=J8+WJJhO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=367zrywykdnaegd09x2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=J8+WJJhO;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2KwY6BZfz3chB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 10:36:13 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5066df312d7so2032427b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 15:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=12V9eNw/BHvKrDUbcOiIzhGySNxYs9W6d56STu3zUWU=;
        b=J8+WJJhOgp9FSHU3QNyFk4zjsgoJfZ8t9lKSuapLLPQ9Tw0UDBL5Gs70N1xS2YmiQZ
         v8pDCjLGFlYjJtjY8rrGHCSWuauCwnjnBSYThnx17muXt82864mhazCfqe3RFgt5Fus+
         c8K3+7SL5ZyS3WdGdtN41DyI98OB3Fv7kopTlvEXnrfoQx1jJBRf8CAVQ0pBXGclWKbd
         kLc4aNHii9gQWHS0xX8pAgY3rz5xSkolEM1e1C5PM1Ki8RqiLOCV1bYsxjti/8qR3Pfc
         xwOwgh2G0i9suJsZ49l4I2jpqe5md3Ui9JHCYv3X+Erch/epY1xtSmrEnfKHWeSMnFYz
         mg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=12V9eNw/BHvKrDUbcOiIzhGySNxYs9W6d56STu3zUWU=;
        b=v4AYhl19BoiSSssBU6pwRCWbLYeIebYHzJjIsRfqy3dFdIq0JOHnhA8DC2Lo1X/i32
         /rpfQ6CC2kSX27vx+5ckimaCgipb50qfXM03moaIf8muLMxGQ9bir/5rcvuusmHeoCC5
         K2wwB1zmJ7F06j9MQ9WtTmu7JjRvJHPjt/XfJNmijvH0dNQ1vUzvDKDBVwMR0RnmhLVx
         4HVSPa9wqaxclImy3KcawbV4TK4a5ysQBBVoy5CZ/ze2os+Fx+1zyXMEQc+e1nuerN+0
         xh7MEcarQnd8YYgwdpmuS2K+qannD6S/inYiCzGrYiDUeiCi0BPY14jzQhOXXd0BCr5j
         MDVQ==
X-Gm-Message-State: AFqh2krHi4CxvehItrtVBn6fSIXLyqE5HL7NWYI1OVde883qZjS2/Nb9
	X5Fqynqea0SlhTjruNyDtLmUVPP9ORU=
X-Google-Smtp-Source: AMrXdXv2a4Ge4znFDb/RURUXRUuYxKH4VBbtyCpQnA77B9Re9QKz84k3H7fnKLhCtcuy8hNfeBLZdvwzq5I=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f7b0:20e8:ce66:f98])
 (user=surenb job=sendgmr) by 2002:a25:9d85:0:b0:7b6:c2e5:364e with SMTP id
 v5-20020a259d85000000b007b6c2e5364emr3276396ybp.201.1674689771597; Wed, 25
 Jan 2023 15:36:11 -0800 (PST)
Date: Wed, 25 Jan 2023 15:35:53 -0800
In-Reply-To: <20230125233554.153109-1-surenb@google.com>
Mime-Version: 1.0
References: <20230125233554.153109-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230125233554.153109-7-surenb@google.com>
Subject: [PATCH v3 6/7] mm: introduce mod_vm_flags_nolock and use it in untrack_pfn
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@t
 echsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In cases when VMA flags are modified after VMA was isolated and mmap_lock
was downgraded, flags modifications would result in an assertion because
mmap write lock is not held.
Introduce mod_vm_flags_nolock to be used in such situation, when VMA is
not part of VMA tree and locking it is not required.
Pass a hint to untrack_pfn to conditionally use mod_vm_flags_nolock for
flags modification and to avoid assertion.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 arch/x86/mm/pat/memtype.c | 10 +++++++---
 include/linux/mm.h        | 16 +++++++++++++---
 include/linux/pgtable.h   |  5 +++--
 mm/memory.c               | 13 +++++++------
 mm/memremap.c             |  4 ++--
 mm/mmap.c                 | 16 ++++++++++------
 6 files changed, 42 insertions(+), 22 deletions(-)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index ae9645c900fa..d8adc0b42cf2 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -1046,7 +1046,7 @@ void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot, pfn_t pfn)
  * can be for the entire vma (in which case pfn, size are zero).
  */
 void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
-		 unsigned long size)
+		 unsigned long size, bool mm_wr_locked)
 {
 	resource_size_t paddr;
 	unsigned long prot;
@@ -1065,8 +1065,12 @@ void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
 		size = vma->vm_end - vma->vm_start;
 	}
 	free_pfn_range(paddr, size);
-	if (vma)
-		clear_vm_flags(vma, VM_PAT);
+	if (vma) {
+		if (mm_wr_locked)
+			clear_vm_flags(vma, VM_PAT);
+		else
+			mod_vm_flags_nolock(vma, 0, VM_PAT);
+	}
 }
 
 /*
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1ab5f73360f2..86bf043136f3 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -656,12 +656,22 @@ static inline void clear_vm_flags(struct vm_area_struct *vma,
 	ACCESS_PRIVATE(vma, __vm_flags) &= ~flags;
 }
 
+/*
+ * Use only if VMA has been previously isolated, is not part of the VMA tree
+ * and therefore needs no locking.
+ */
+static inline void mod_vm_flags_nolock(struct vm_area_struct *vma,
+				       vm_flags_t set, vm_flags_t clear)
+{
+	ACCESS_PRIVATE(vma, __vm_flags) |= set;
+	ACCESS_PRIVATE(vma, __vm_flags) &= ~clear;
+}
+
 static inline void mod_vm_flags(struct vm_area_struct *vma,
 				vm_flags_t set, vm_flags_t clear)
 {
 	mmap_assert_write_locked(vma->vm_mm);
-	ACCESS_PRIVATE(vma, __vm_flags) |= set;
-	ACCESS_PRIVATE(vma, __vm_flags) &= ~clear;
+	mod_vm_flags_nolock(vma, set, clear);
 }
 
 static inline void vma_set_anonymous(struct vm_area_struct *vma)
@@ -2087,7 +2097,7 @@ static inline void zap_vma_pages(struct vm_area_struct *vma)
 }
 void unmap_vmas(struct mmu_gather *tlb, struct maple_tree *mt,
 		struct vm_area_struct *start_vma, unsigned long start,
-		unsigned long end);
+		unsigned long end, bool mm_wr_locked);
 
 struct mmu_notifier_range;
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 5fd45454c073..c63cd44777ec 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1185,7 +1185,8 @@ static inline int track_pfn_copy(struct vm_area_struct *vma)
  * can be for the entire vma (in which case pfn, size are zero).
  */
 static inline void untrack_pfn(struct vm_area_struct *vma,
-			       unsigned long pfn, unsigned long size)
+			       unsigned long pfn, unsigned long size,
+			       bool mm_wr_locked)
 {
 }
 
@@ -1203,7 +1204,7 @@ extern void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
 			     pfn_t pfn);
 extern int track_pfn_copy(struct vm_area_struct *vma);
 extern void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
-			unsigned long size);
+			unsigned long size, bool mm_wr_locked);
 extern void untrack_pfn_moved(struct vm_area_struct *vma);
 #endif
 
diff --git a/mm/memory.c b/mm/memory.c
index d6902065e558..5b11b50e2c4a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1613,7 +1613,7 @@ void unmap_page_range(struct mmu_gather *tlb,
 static void unmap_single_vma(struct mmu_gather *tlb,
 		struct vm_area_struct *vma, unsigned long start_addr,
 		unsigned long end_addr,
-		struct zap_details *details)
+		struct zap_details *details, bool mm_wr_locked)
 {
 	unsigned long start = max(vma->vm_start, start_addr);
 	unsigned long end;
@@ -1628,7 +1628,7 @@ static void unmap_single_vma(struct mmu_gather *tlb,
 		uprobe_munmap(vma, start, end);
 
 	if (unlikely(vma->vm_flags & VM_PFNMAP))
-		untrack_pfn(vma, 0, 0);
+		untrack_pfn(vma, 0, 0, mm_wr_locked);
 
 	if (start != end) {
 		if (unlikely(is_vm_hugetlb_page(vma))) {
@@ -1675,7 +1675,7 @@ static void unmap_single_vma(struct mmu_gather *tlb,
  */
 void unmap_vmas(struct mmu_gather *tlb, struct maple_tree *mt,
 		struct vm_area_struct *vma, unsigned long start_addr,
-		unsigned long end_addr)
+		unsigned long end_addr, bool mm_wr_locked)
 {
 	struct mmu_notifier_range range;
 	struct zap_details details = {
@@ -1689,7 +1689,8 @@ void unmap_vmas(struct mmu_gather *tlb, struct maple_tree *mt,
 				start_addr, end_addr);
 	mmu_notifier_invalidate_range_start(&range);
 	do {
-		unmap_single_vma(tlb, vma, start_addr, end_addr, &details);
+		unmap_single_vma(tlb, vma, start_addr, end_addr, &details,
+				 mm_wr_locked);
 	} while ((vma = mas_find(&mas, end_addr - 1)) != NULL);
 	mmu_notifier_invalidate_range_end(&range);
 }
@@ -1723,7 +1724,7 @@ void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
 	 * unmap 'address-end' not 'range.start-range.end' as range
 	 * could have been expanded for hugetlb pmd sharing.
 	 */
-	unmap_single_vma(&tlb, vma, address, end, details);
+	unmap_single_vma(&tlb, vma, address, end, details, false);
 	mmu_notifier_invalidate_range_end(&range);
 	tlb_finish_mmu(&tlb);
 }
@@ -2492,7 +2493,7 @@ int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
 
 	err = remap_pfn_range_notrack(vma, addr, pfn, size, prot);
 	if (err)
-		untrack_pfn(vma, pfn, PAGE_ALIGN(size));
+		untrack_pfn(vma, pfn, PAGE_ALIGN(size), true);
 	return err;
 }
 EXPORT_SYMBOL(remap_pfn_range);
diff --git a/mm/memremap.c b/mm/memremap.c
index 08cbf54fe037..2f88f43d4a01 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -129,7 +129,7 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
 	}
 	mem_hotplug_done();
 
-	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range));
+	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
 	pgmap_array_delete(range);
 }
 
@@ -276,7 +276,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 	if (!is_private)
 		kasan_remove_zero_shadow(__va(range->start), range_len(range));
 err_kasan:
-	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range));
+	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
 err_pfn_remap:
 	pgmap_array_delete(range);
 	return error;
diff --git a/mm/mmap.c b/mm/mmap.c
index 2c6e9072e6a8..69d440997648 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -78,7 +78,7 @@ core_param(ignore_rlimit_data, ignore_rlimit_data, bool, 0644);
 static void unmap_region(struct mm_struct *mm, struct maple_tree *mt,
 		struct vm_area_struct *vma, struct vm_area_struct *prev,
 		struct vm_area_struct *next, unsigned long start,
-		unsigned long end);
+		unsigned long end, bool mm_wr_locked);
 
 static pgprot_t vm_pgprot_modify(pgprot_t oldprot, unsigned long vm_flags)
 {
@@ -2136,14 +2136,14 @@ static inline void remove_mt(struct mm_struct *mm, struct ma_state *mas)
 static void unmap_region(struct mm_struct *mm, struct maple_tree *mt,
 		struct vm_area_struct *vma, struct vm_area_struct *prev,
 		struct vm_area_struct *next,
-		unsigned long start, unsigned long end)
+		unsigned long start, unsigned long end, bool mm_wr_locked)
 {
 	struct mmu_gather tlb;
 
 	lru_add_drain();
 	tlb_gather_mmu(&tlb, mm);
 	update_hiwater_rss(mm);
-	unmap_vmas(&tlb, mt, vma, start, end);
+	unmap_vmas(&tlb, mt, vma, start, end, mm_wr_locked);
 	free_pgtables(&tlb, mt, vma, prev ? prev->vm_end : FIRST_USER_ADDRESS,
 				 next ? next->vm_start : USER_PGTABLES_CEILING);
 	tlb_finish_mmu(&tlb);
@@ -2391,7 +2391,11 @@ do_vmi_align_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
 			mmap_write_downgrade(mm);
 	}
 
-	unmap_region(mm, &mt_detach, vma, prev, next, start, end);
+	/*
+	 * We can free page tables without write-locking mmap_lock because VMAs
+	 * were isolated before we downgraded mmap_lock.
+	 */
+	unmap_region(mm, &mt_detach, vma, prev, next, start, end, !downgrade);
 	/* Statistics and freeing VMAs */
 	mas_set(&mas_detach, start);
 	remove_mt(mm, &mas_detach);
@@ -2704,7 +2708,7 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 
 		/* Undo any partial mapping done by a device driver. */
 		unmap_region(mm, &mm->mm_mt, vma, prev, next, vma->vm_start,
-			     vma->vm_end);
+			     vma->vm_end, true);
 	}
 	if (file && (vm_flags & VM_SHARED))
 		mapping_unmap_writable(file->f_mapping);
@@ -3031,7 +3035,7 @@ void exit_mmap(struct mm_struct *mm)
 	tlb_gather_mmu_fullmm(&tlb, mm);
 	/* update_hiwater_rss(mm) here? but nobody should be looking */
 	/* Use ULONG_MAX here to ensure all VMAs in the mm are unmapped */
-	unmap_vmas(&tlb, &mm->mm_mt, vma, 0, ULONG_MAX);
+	unmap_vmas(&tlb, &mm->mm_mt, vma, 0, ULONG_MAX, false);
 	mmap_read_unlock(mm);
 
 	/*
-- 
2.39.1

