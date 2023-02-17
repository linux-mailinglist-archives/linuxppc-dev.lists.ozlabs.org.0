Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA7269A4D5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 05:22:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHzDq0NLjz3fRd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 15:22:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=XNUXq0PT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--yuzhao.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3u_7uywykdjosotb4iaiiaf8.6igfchorjj6-78pfcmnm.itf45m.ila@flex--yuzhao.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=XNUXq0PT;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHz1R6rPyz3cM7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 15:12:43 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id r17-20020a258291000000b008ee1c76c25dso4285176ybk.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 20:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XhFwXntjEszX2NR0BL+FH//vn03ADgHeMtjzY93nmt4=;
        b=XNUXq0PTcl/8yQwac6rGM5O74+vQWyUh1AwA7ePVJdgeiAUlD4NgM/8W79T6ThAX5d
         8L+r3mqqpTd4bu5CNG4e4L2wx/8D5VXPDgeOyArsY1MkkauDIfO/A0RFt6d2vg5l2vmu
         hweIMbdWE0pJDts0aaAJhLSeQ2dvv4nx27ec6MfgxyUQn4go1b3A0P5I5YZe4zrvSmNQ
         QnjYpb9gyiRRAI7GOUcY7YneWU1+n/bWWipo6U9kb/M9PTR3QYPIaLf6KsnEUGCzyhdx
         EHGSfZ7eFdzHKHHjVuXrZx5KuVV/Ov5OwMCJJ/HnyOkrnjd7f6Knvbnn1fuBDRf5kRV+
         zuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XhFwXntjEszX2NR0BL+FH//vn03ADgHeMtjzY93nmt4=;
        b=w8T0kqMW28rTov+yjEmiUp0D9sSoixA4/k8oSyR2qt55UWFEkBMBCBh+W39hMO4ntn
         U9RGbjnmQW71L8yBNCHWxSTR2lLvJEJGF4PhWNo21wFn2ssVWzVGisBt3MrYl6ihwJbU
         LFu0CqbTb62dvcHIiTrQGBSamK6H6bZH5KDUbVsLYOoNBFcVAx2NKSY1mXl4RSu+n0IA
         JnrpeB7lJbuWcbkXePByqRErI6dCskFUbM4tmpc2fBevYvnfHror+dhfi+8NvksbrHae
         ygT+a0VP8mddJj/3NOgrE+AF8KU/YzrVoGnLq0nzfBled35djHw+6M/G6XqIslYx9szR
         Hq7A==
X-Gm-Message-State: AO0yUKUMttYbUSo60WCVSKVUojjz3IN6EvYf1IhJfwnPVjqvpcGlEpAk
	wKcHiqTriQN1CIXrHbLEUsXSqS01q94=
X-Google-Smtp-Source: AK7set9xe5nXschn8sCJ042xv+lkLsKlliPh3pvCt+D2t2Ej6DUaOZa2DrrSs5Y7E7xe7n5GA4zAjxW8lz0=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:6fb3:61e:d31f:1ad3])
 (user=yuzhao job=sendgmr) by 2002:a05:6902:308:b0:8dd:78cc:e52e with SMTP id
 b8-20020a056902030800b008dd78cce52emr65241ybs.13.1676607163481; Thu, 16 Feb
 2023 20:12:43 -0800 (PST)
Date: Thu, 16 Feb 2023 21:12:30 -0700
In-Reply-To: <20230217041230.2417228-1-yuzhao@google.com>
Message-Id: <20230217041230.2417228-6-yuzhao@google.com>
Mime-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Subject: [PATCH mm-unstable v1 5/5] mm: multi-gen LRU: use mmu_notifier_test_clear_young()
From: Yu Zhao <yuzhao@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 17 Feb 2023 15:18:13 +1100
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
Cc: linux-mm@google.com, Yu Zhao <yuzhao@google.com>, kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michael Larabel <michael@michaellarabel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

An existing selftest can quickly demonstrate the effectiveness of this
patch. On a generic workstation equipped with 128 CPUs and 256GB DRAM:

  $ sudo max_guest_memory_test -c 64 -m 250 -s 250

  MGLRU      run2
  ---------------
  Before    ~600s
  After      ~50s
  Off       ~250s

  kswapd (MGLRU before)
    100.00%  balance_pgdat
      100.00%  shrink_node
        100.00%  shrink_one
          99.97%  try_to_shrink_lruvec
            99.06%  evict_folios
              97.41%  shrink_folio_list
                31.33%  folio_referenced
                  31.06%  rmap_walk_file
                    30.89%  folio_referenced_one
                      20.83%  __mmu_notifier_clear_flush_young
                        20.54%  kvm_mmu_notifier_clear_flush_young
  =>                      19.34%  _raw_write_lock

  kswapd (MGLRU after)
    100.00%  balance_pgdat
      100.00%  shrink_node
        100.00%  shrink_one
          99.97%  try_to_shrink_lruvec
            99.51%  evict_folios
              71.70%  shrink_folio_list
                7.08%  folio_referenced
                  6.78%  rmap_walk_file
                    6.72%  folio_referenced_one
                      5.60%  lru_gen_look_around
  =>                    1.53%  __mmu_notifier_test_clear_young

  kswapd (MGLRU off)
    100.00%  balance_pgdat
      100.00%  shrink_node
        99.92%  shrink_lruvec
          69.95%  shrink_folio_list
            19.35%  folio_referenced
              18.37%  rmap_walk_file
                17.88%  folio_referenced_one
                  13.20%  __mmu_notifier_clear_flush_young
                    11.64%  kvm_mmu_notifier_clear_flush_young
  =>                  9.93%  _raw_write_lock
          26.23%  shrink_active_list
            25.50%  folio_referenced
              25.35%  rmap_walk_file
                25.28%  folio_referenced_one
                  23.87%  __mmu_notifier_clear_flush_young
                    23.69%  kvm_mmu_notifier_clear_flush_young
  =>                  18.98%  _raw_write_lock

Signed-off-by: Yu Zhao <yuzhao@google.com>
---
 include/linux/mmzone.h |   6 +-
 mm/rmap.c              |   8 +--
 mm/vmscan.c            | 127 ++++++++++++++++++++++++++++++++++++-----
 3 files changed, 121 insertions(+), 20 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 9fb1b03b83b2..ce34b7ea8e4c 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -379,6 +379,7 @@ enum {
 	LRU_GEN_CORE,
 	LRU_GEN_MM_WALK,
 	LRU_GEN_NONLEAF_YOUNG,
+	LRU_GEN_SPTE_WALK,
 	NR_LRU_GEN_CAPS
 };
 
@@ -485,7 +486,7 @@ struct lru_gen_mm_walk {
 };
 
 void lru_gen_init_lruvec(struct lruvec *lruvec);
-void lru_gen_look_around(struct page_vma_mapped_walk *pvmw);
+bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw);
 
 #ifdef CONFIG_MEMCG
 
@@ -573,8 +574,9 @@ static inline void lru_gen_init_lruvec(struct lruvec *lruvec)
 {
 }
 
-static inline void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
+static inline bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 {
+	return false;
 }
 
 #ifdef CONFIG_MEMCG
diff --git a/mm/rmap.c b/mm/rmap.c
index 15ae24585fc4..eb0089f8f112 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -823,12 +823,10 @@ static bool folio_referenced_one(struct folio *folio,
 			return false; /* To break the loop */
 		}
 
-		if (pvmw.pte) {
-			if (lru_gen_enabled() && pte_young(*pvmw.pte)) {
-				lru_gen_look_around(&pvmw);
+		if (lru_gen_enabled() && pvmw.pte) {
+			if (lru_gen_look_around(&pvmw))
 				referenced++;
-			}
-
+		} else if (pvmw.pte) {
 			if (ptep_clear_flush_young_notify(vma, address,
 						pvmw.pte))
 				referenced++;
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 9c1c5e8b24b8..d6d69f0baabf 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -57,6 +57,8 @@
 #include <linux/khugepaged.h>
 #include <linux/rculist_nulls.h>
 #include <linux/random.h>
+#include <linux/mmu_notifier.h>
+#include <linux/kvm_host.h>
 
 #include <asm/tlbflush.h>
 #include <asm/div64.h>
@@ -3923,6 +3925,55 @@ static struct folio *get_pfn_folio(unsigned long pfn, struct mem_cgroup *memcg,
 	return folio;
 }
 
+static bool test_spte_young(struct mm_struct *mm, unsigned long addr, unsigned long end,
+			    unsigned long *bitmap, unsigned long *last)
+{
+	if (!kvm_arch_has_test_clear_young() || !get_cap(LRU_GEN_SPTE_WALK))
+		return false;
+
+	if (*last > addr)
+		goto done;
+
+	*last = end - addr > MIN_LRU_BATCH * PAGE_SIZE ?
+		addr + MIN_LRU_BATCH * PAGE_SIZE - 1 : end - 1;
+	bitmap_zero(bitmap, MIN_LRU_BATCH);
+
+	mmu_notifier_test_clear_young(mm, addr, *last + 1, false, bitmap);
+done:
+	return test_bit((*last - addr) / PAGE_SIZE, bitmap);
+}
+
+static void clear_spte_young(struct mm_struct *mm, unsigned long addr,
+			     unsigned long *bitmap, unsigned long *last)
+{
+	int i;
+	unsigned long start, end = *last + 1;
+
+	if (addr + PAGE_SIZE != end)
+		return;
+
+	i = find_last_bit(bitmap, MIN_LRU_BATCH);
+	if (i == MIN_LRU_BATCH)
+		return;
+
+	start = end - (i + 1) * PAGE_SIZE;
+
+	i = find_first_bit(bitmap, MIN_LRU_BATCH);
+
+	end -= i * PAGE_SIZE;
+
+	mmu_notifier_test_clear_young(mm, start, end, false, bitmap);
+}
+
+static void skip_spte_young(struct mm_struct *mm, unsigned long addr,
+			    unsigned long *bitmap, unsigned long *last)
+{
+	if (*last > addr)
+		__clear_bit((*last - addr) / PAGE_SIZE, bitmap);
+
+	clear_spte_young(mm, addr, bitmap, last);
+}
+
 static bool suitable_to_scan(int total, int young)
 {
 	int n = clamp_t(int, cache_line_size() / sizeof(pte_t), 2, 8);
@@ -3938,6 +3989,8 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 	pte_t *pte;
 	spinlock_t *ptl;
 	unsigned long addr;
+	unsigned long bitmap[BITS_TO_LONGS(MIN_LRU_BATCH)];
+	unsigned long last = 0;
 	int total = 0;
 	int young = 0;
 	struct lru_gen_mm_walk *walk = args->private;
@@ -3956,6 +4009,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 	pte = pte_offset_map(pmd, start & PMD_MASK);
 restart:
 	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
+		bool success;
 		unsigned long pfn;
 		struct folio *folio;
 
@@ -3963,20 +4017,27 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 		walk->mm_stats[MM_LEAF_TOTAL]++;
 
 		pfn = get_pte_pfn(pte[i], args->vma, addr);
-		if (pfn == -1)
+		if (pfn == -1) {
+			skip_spte_young(args->vma->vm_mm, addr, bitmap, &last);
 			continue;
+		}
 
-		if (!pte_young(pte[i])) {
+		success = test_spte_young(args->vma->vm_mm, addr, end, bitmap, &last);
+		if (!success && !pte_young(pte[i])) {
+			skip_spte_young(args->vma->vm_mm, addr, bitmap, &last);
 			walk->mm_stats[MM_LEAF_OLD]++;
 			continue;
 		}
 
 		folio = get_pfn_folio(pfn, memcg, pgdat, walk->can_swap);
-		if (!folio)
+		if (!folio) {
+			skip_spte_young(args->vma->vm_mm, addr, bitmap, &last);
 			continue;
+		}
 
-		if (!ptep_test_and_clear_young(args->vma, addr, pte + i))
-			VM_WARN_ON_ONCE(true);
+		clear_spte_young(args->vma->vm_mm, addr, bitmap, &last);
+		if (pte_young(pte[i]))
+			ptep_test_and_clear_young(args->vma, addr, pte + i);
 
 		young++;
 		walk->mm_stats[MM_LEAF_YOUNG]++;
@@ -4581,6 +4642,24 @@ static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_control *sc)
  *                          rmap/PT walk feedback
  ******************************************************************************/
 
+static bool should_look_around(struct vm_area_struct *vma, unsigned long addr,
+			       pte_t *pte, int *young)
+{
+	unsigned long old = true;
+
+	*young = mmu_notifier_test_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE, true, &old);
+	if (!old)
+		*young = true;
+
+	if (pte_young(*pte)) {
+		ptep_test_and_clear_young(vma, addr, pte);
+		*young = true;
+		return true;
+	}
+
+	return !old && get_cap(LRU_GEN_SPTE_WALK);
+}
+
 /*
  * This function exploits spatial locality when shrink_folio_list() walks the
  * rmap. It scans the adjacent PTEs of a young PTE and promotes hot pages. If
@@ -4588,12 +4667,14 @@ static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_control *sc)
  * the PTE table to the Bloom filter. This forms a feedback loop between the
  * eviction and the aging.
  */
-void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
+bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 {
 	int i;
 	unsigned long start;
 	unsigned long end;
 	struct lru_gen_mm_walk *walk;
+	unsigned long bitmap[BITS_TO_LONGS(MIN_LRU_BATCH)];
+	unsigned long last = 0;
 	int young = 0;
 	pte_t *pte = pvmw->pte;
 	unsigned long addr = pvmw->address;
@@ -4607,8 +4688,11 @@ void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 	lockdep_assert_held(pvmw->ptl);
 	VM_WARN_ON_ONCE_FOLIO(folio_test_lru(folio), folio);
 
+	if (!should_look_around(pvmw->vma, addr, pte, &young))
+		return young;
+
 	if (spin_is_contended(pvmw->ptl))
-		return;
+		return young;
 
 	/* avoid taking the LRU lock under the PTL when possible */
 	walk = current->reclaim_state ? current->reclaim_state->mm_walk : NULL;
@@ -4616,6 +4700,9 @@ void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 	start = max(addr & PMD_MASK, pvmw->vma->vm_start);
 	end = min(addr | ~PMD_MASK, pvmw->vma->vm_end - 1) + 1;
 
+	if (end - start == PAGE_SIZE)
+		return young;
+
 	if (end - start > MIN_LRU_BATCH * PAGE_SIZE) {
 		if (addr - start < MIN_LRU_BATCH * PAGE_SIZE / 2)
 			end = start + MIN_LRU_BATCH * PAGE_SIZE;
@@ -4629,28 +4716,37 @@ void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 
 	/* folio_update_gen() requires stable folio_memcg() */
 	if (!mem_cgroup_trylock_pages(memcg))
-		return;
+		return young;
 
 	arch_enter_lazy_mmu_mode();
 
 	pte -= (addr - start) / PAGE_SIZE;
 
 	for (i = 0, addr = start; addr != end; i++, addr += PAGE_SIZE) {
+		bool success;
 		unsigned long pfn;
 
 		pfn = get_pte_pfn(pte[i], pvmw->vma, addr);
-		if (pfn == -1)
+		if (pfn == -1) {
+			skip_spte_young(pvmw->vma->vm_mm, addr, bitmap, &last);
 			continue;
+		}
 
-		if (!pte_young(pte[i]))
+		success = test_spte_young(pvmw->vma->vm_mm, addr, end, bitmap, &last);
+		if (!success && !pte_young(pte[i])) {
+			skip_spte_young(pvmw->vma->vm_mm, addr, bitmap, &last);
 			continue;
+		}
 
 		folio = get_pfn_folio(pfn, memcg, pgdat, !walk || walk->can_swap);
-		if (!folio)
+		if (!folio) {
+			skip_spte_young(pvmw->vma->vm_mm, addr, bitmap, &last);
 			continue;
+		}
 
-		if (!ptep_test_and_clear_young(pvmw->vma, addr, pte + i))
-			VM_WARN_ON_ONCE(true);
+		clear_spte_young(pvmw->vma->vm_mm, addr, bitmap, &last);
+		if (pte_young(pte[i]))
+			ptep_test_and_clear_young(pvmw->vma, addr, pte + i);
 
 		young++;
 
@@ -4680,6 +4776,8 @@ void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 	/* feedback from rmap walkers to page table walkers */
 	if (suitable_to_scan(i, young))
 		update_bloom_filter(lruvec, max_seq, pvmw->pmd);
+
+	return young;
 }
 
 /******************************************************************************
@@ -5699,6 +5797,9 @@ static ssize_t show_enabled(struct kobject *kobj, struct kobj_attribute *attr, c
 	if (arch_has_hw_nonleaf_pmd_young() && get_cap(LRU_GEN_NONLEAF_YOUNG))
 		caps |= BIT(LRU_GEN_NONLEAF_YOUNG);
 
+	if (kvm_arch_has_test_clear_young() && get_cap(LRU_GEN_SPTE_WALK))
+		caps |= BIT(LRU_GEN_SPTE_WALK);
+
 	return sysfs_emit(buf, "0x%04x\n", caps);
 }
 
-- 
2.39.2.637.g21b0678d19-goog

