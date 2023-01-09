Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4C96632DE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:29:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRsQ2vVHz3fLY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:29:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dIxUWUkr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3nh-8ywykdek352pymrzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dIxUWUkr;
	dkim-atps=neutral
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR6G5X9Tz3cC1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:55:18 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 31-20020a17090a0fa200b00226e43409c2so3543183pjz.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iUx/OB3iQQFsS6Pcn0sWsw86mSb+m9wyFp0pF/RbXSk=;
        b=dIxUWUkrPawF5nCoP+HUjvA+1vmI2x8utDxJKsWUDKbZyEnrEFBNIhzaM8Fi8ju0R6
         eFijpcCpNnzwFYn4qQcfR/+HsKpxnsThGu7XxjIktqkOlh8pbTgjPjgxlF3er9jtpiFK
         3GSfGJF3spx9qr3lx0Xbz1tHEn1iO2FRbitd8mVM168Ji21A6WJbwvjHXFAHlbmszk/z
         PHIXCswYcUFMYiFzIipRXQxj+Lq9k2DTCyxkIwApZosMOj5/aAMGnoES19O/qzXO1kO2
         XId6gaep+ySgAUv8E1eSLybQz1XP2tMRZPlcvFIYudobcMhpLFz5bkGWnIsnoWm/3FYR
         M9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iUx/OB3iQQFsS6Pcn0sWsw86mSb+m9wyFp0pF/RbXSk=;
        b=J0zbySlhiS6vH8iN5HgcY+wUsEw2M9K3FQmKrZT51lmyRw02OPGdUkbFgtukYMq4e6
         Ehs7lumEqtFG5UFYe301Vm5TSW0z1eLYJPT9o3HlJeejcemt+e+oQJkXSbJ+cDS+az2u
         Tin/FYNSX1yowaPA1tGsfmCj4j2GWL9l49hqTBj6XknV5VrFh+wi5COMhg3xesTN1j8s
         JEP5wUgxf9AlDZMEVq5m2bz0nhyERRyd1Tt/fj2YEuAzPKADb1mmg+zzaEuglMCwVYss
         KF6W+WuZ7u1dJyC44UpWF8IoHyjyE54+kcbDkCuY57MPBMYe7aWa5vD2xB+iyYar+hVX
         jilA==
X-Gm-Message-State: AFqh2krtrbgFrdXvGXo0Vm86UtmaDr+tSfnWFswYlJhNBJ4/9r/lqghS
	zdE0yhwpWASnbOl32YuvL5FJEm+Jg2Q=
X-Google-Smtp-Source: AMrXdXtKEO5NZ0LV26PgvCCbCCrX8iN+m+pnC68agl9KzwVT0TYKaTzsINmDv+j62IKmNfwju5kMUEnv/YA=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a17:90b:370a:b0:226:f53b:d370 with SMTP id
 mg10-20020a17090b370a00b00226f53bd370mr875190pjb.75.1673297716576; Mon, 09
 Jan 2023 12:55:16 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:33 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-39-surenb@google.com>
Subject: [PATCH 38/41] mm: avoid assertion in untrack_pfn
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingu
 larity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

untrack_pfn can be called after VMA was isolated and mmap_lock downgraded.
An attempt to lock affected VMA would cause an assertion, therefore
use mod_vm_flags_nolock in such situations.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 arch/x86/mm/pat/memtype.c | 10 +++++++---
 include/linux/mm.h        |  2 +-
 include/linux/pgtable.h   |  5 +++--
 mm/memory.c               | 15 ++++++++-------
 mm/memremap.c             |  4 ++--
 mm/mmap.c                 |  4 ++--
 6 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index 9e490a372896..f71c8381430b 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -1045,7 +1045,7 @@ void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot, pfn_t pfn)
  * can be for the entire vma (in which case pfn, size are zero).
  */
 void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
-		 unsigned long size)
+		 unsigned long size, bool lock_vma)
 {
 	resource_size_t paddr;
 	unsigned long prot;
@@ -1064,8 +1064,12 @@ void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
 		size = vma->vm_end - vma->vm_start;
 	}
 	free_pfn_range(paddr, size);
-	if (vma)
-		clear_vm_flags(vma, VM_PAT);
+	if (vma) {
+		if (lock_vma)
+			clear_vm_flags(vma, VM_PAT);
+		else
+			mod_vm_flags_nolock(vma, 0, VM_PAT);
+	}
 }
 
 /*
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7d436a5027cc..3158f33e268c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2135,7 +2135,7 @@ void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
 			   unsigned long size, struct zap_details *details);
 void unmap_vmas(struct mmu_gather *tlb, struct maple_tree *mt,
 		struct vm_area_struct *start_vma, unsigned long start,
-		unsigned long end);
+		unsigned long end, bool lock_vma);
 
 struct mmu_notifier_range;
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 1159b25b0542..eaa831bd675d 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1214,7 +1214,8 @@ static inline int track_pfn_copy(struct vm_area_struct *vma)
  * can be for the entire vma (in which case pfn, size are zero).
  */
 static inline void untrack_pfn(struct vm_area_struct *vma,
-			       unsigned long pfn, unsigned long size)
+			       unsigned long pfn, unsigned long size,
+			       bool lock_vma)
 {
 }
 
@@ -1232,7 +1233,7 @@ extern void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
 			     pfn_t pfn);
 extern int track_pfn_copy(struct vm_area_struct *vma);
 extern void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
-			unsigned long size);
+			unsigned long size, bool lock_vma);
 extern void untrack_pfn_moved(struct vm_area_struct *vma);
 #endif
 
diff --git a/mm/memory.c b/mm/memory.c
index 12508f4d845a..5c7d5eaa60d8 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1610,7 +1610,7 @@ void unmap_page_range(struct mmu_gather *tlb,
 static void unmap_single_vma(struct mmu_gather *tlb,
 		struct vm_area_struct *vma, unsigned long start_addr,
 		unsigned long end_addr,
-		struct zap_details *details)
+		struct zap_details *details, bool lock_vma)
 {
 	unsigned long start = max(vma->vm_start, start_addr);
 	unsigned long end;
@@ -1625,7 +1625,7 @@ static void unmap_single_vma(struct mmu_gather *tlb,
 		uprobe_munmap(vma, start, end);
 
 	if (unlikely(vma->vm_flags & VM_PFNMAP))
-		untrack_pfn(vma, 0, 0);
+		untrack_pfn(vma, 0, 0, lock_vma);
 
 	if (start != end) {
 		if (unlikely(is_vm_hugetlb_page(vma))) {
@@ -1672,7 +1672,7 @@ static void unmap_single_vma(struct mmu_gather *tlb,
  */
 void unmap_vmas(struct mmu_gather *tlb, struct maple_tree *mt,
 		struct vm_area_struct *vma, unsigned long start_addr,
-		unsigned long end_addr)
+		unsigned long end_addr, bool lock_vma)
 {
 	struct mmu_notifier_range range;
 	struct zap_details details = {
@@ -1686,7 +1686,8 @@ void unmap_vmas(struct mmu_gather *tlb, struct maple_tree *mt,
 				start_addr, end_addr);
 	mmu_notifier_invalidate_range_start(&range);
 	do {
-		unmap_single_vma(tlb, vma, start_addr, end_addr, &details);
+		unmap_single_vma(tlb, vma, start_addr, end_addr, &details,
+				 lock_vma);
 	} while ((vma = mas_find(&mas, end_addr - 1)) != NULL);
 	mmu_notifier_invalidate_range_end(&range);
 }
@@ -1715,7 +1716,7 @@ void zap_page_range(struct vm_area_struct *vma, unsigned long start,
 	update_hiwater_rss(vma->vm_mm);
 	mmu_notifier_invalidate_range_start(&range);
 	do {
-		unmap_single_vma(&tlb, vma, start, range.end, NULL);
+		unmap_single_vma(&tlb, vma, start, range.end, NULL, false);
 	} while ((vma = mas_find(&mas, end - 1)) != NULL);
 	mmu_notifier_invalidate_range_end(&range);
 	tlb_finish_mmu(&tlb);
@@ -1750,7 +1751,7 @@ void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
 	 * unmap 'address-end' not 'range.start-range.end' as range
 	 * could have been expanded for hugetlb pmd sharing.
 	 */
-	unmap_single_vma(&tlb, vma, address, end, details);
+	unmap_single_vma(&tlb, vma, address, end, details, false);
 	mmu_notifier_invalidate_range_end(&range);
 	tlb_finish_mmu(&tlb);
 }
@@ -2519,7 +2520,7 @@ int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
 
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
index a256deca0bc0..332af383f7cd 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2209,7 +2209,7 @@ static void unmap_region(struct mm_struct *mm, struct maple_tree *mt,
 	lru_add_drain();
 	tlb_gather_mmu(&tlb, mm);
 	update_hiwater_rss(mm);
-	unmap_vmas(&tlb, mt, vma, start, end);
+	unmap_vmas(&tlb, mt, vma, start, end, lock_vma);
 	free_pgtables(&tlb, mt, vma, prev ? prev->vm_end : FIRST_USER_ADDRESS,
 				 next ? next->vm_start : USER_PGTABLES_CEILING,
 				 lock_vma);
@@ -3127,7 +3127,7 @@ void exit_mmap(struct mm_struct *mm)
 	tlb_gather_mmu_fullmm(&tlb, mm);
 	/* update_hiwater_rss(mm) here? but nobody should be looking */
 	/* Use ULONG_MAX here to ensure all VMAs in the mm are unmapped */
-	unmap_vmas(&tlb, &mm->mm_mt, vma, 0, ULONG_MAX);
+	unmap_vmas(&tlb, &mm->mm_mt, vma, 0, ULONG_MAX, false);
 	mmap_read_unlock(mm);
 
 	/*
-- 
2.39.0

