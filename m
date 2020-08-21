Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F9724CD0F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 07:00:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXq8332rZzDr31
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 15:00:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PFtCvBOp; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXppx60RKzDr2c
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 14:45:13 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id q93so413003pjq.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 21:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iuDHQZszaxv26oMYybK0woCMEyfh52YQ1qNYQNbjimQ=;
 b=PFtCvBOpAVTxKrvI+7LF7kCZhLnG2oMHV6Cpt+q4V1tv7QOEe3FVFVfJoHiWQm8hOA
 mhTgJlzC7bb+tZgU7AJRuWBguuZhjErvqK8la8rnX8je8QWTNK3lDKz81K06TYrZVCvU
 gNYu8WoCiegio26F1JJAnkbzcqkRZ3ES21AnuWed6jMM1yBeWXENUNO+KbfzpFx21sGw
 O9R7y3HU/GsqcP+cKMH5d88hytDKpavFeJCgaYoQtAtuNFX0aw0RjoaX/+tVP+cLvq3G
 Iiu0XlubsSczTAkPfSIqkmPMusGi+0PXTphPjK4sIMwV5akjME/lRpk5S8gvSP5knlAo
 x+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iuDHQZszaxv26oMYybK0woCMEyfh52YQ1qNYQNbjimQ=;
 b=Ojv07nA+u5JjLvP0R6iBZsAqfokeY1IJIJMxYL0XE+eNda5d9aX+jCiDOEUM4tOdBp
 iWgXO17UhYqwe9AN0FeQ0iaYdWEbmEH9RmdIQHZGsK6I6Y5Lg2g8+P70cmBNt51pngRf
 n7MgRE8Hl4eHlYuU7aRQsEgUWpBntXVJk+S1HDiXzIgTJ6BcL1Jq/5B/f5sP5ID3ZZdQ
 oO/9MoXCBrDQC1wGyZ8nKzuRYoPYtN4vqZFtmzXkk2SfestYNgmDnnLC0fhSL3whLpJY
 m3h527sIxix65JQU/lUjj8D4cthVL7WF8SnaFVTSx3aCkw6FgynhucsFsYZXnyzr7oh1
 9B7g==
X-Gm-Message-State: AOAM531nYNQdFpf0JAYVwuSERP822WR2V5UwFSWukb/gdpYT83f921WT
 QjxA/FBz475i0XF6vrwMCK8=
X-Google-Smtp-Source: ABdhPJzfaW8yoy/FewICM2kFJ610QPZPrBku6G5biJPSXZPLRqO1ckFBmS60jmYdOV+dwjr24h4STQ==
X-Received: by 2002:a17:902:d90e:: with SMTP id
 c14mr935987plz.37.1597985110039; 
 Thu, 20 Aug 2020 21:45:10 -0700 (PDT)
Received: from bobo.ibm.com (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id l9sm683374pgg.29.2020.08.20.21.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 21:45:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 8/8] mm/vmalloc: Hugepage vmalloc mappings
Date: Fri, 21 Aug 2020 14:44:27 +1000
Message-Id: <20200821044427.736424-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200821044427.736424-1-npiggin@gmail.com>
References: <20200821044427.736424-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Zefan Li <lizefan@huawei.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On platforms that define HAVE_ARCH_HUGE_VMAP and support PMD vmaps,
vmalloc will attempt to allocate PMD-sized pages first, before falling
back to small pages.

Allocations which use something other than PAGE_KERNEL protections are
not permitted to use huge pages yet, not all callers expect this (e.g.,
module allocations vs strict module rwx).

This reduces TLB misses by nearly 30x on a `git diff` workload on a
2-node POWER9 (59,800 -> 2,100) and reduces CPU cycles by 0.54%.

This can result in more internal fragmentation and memory overhead for a
given allocation, an option nohugevmalloc is added to disable at boot.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         |   2 +
 arch/Kconfig                                  |   4 +
 arch/powerpc/Kconfig                          |   1 +
 include/linux/vmalloc.h                       |   1 +
 mm/page_alloc.c                               |   4 +-
 mm/vmalloc.c                                  | 188 +++++++++++++-----
 6 files changed, 152 insertions(+), 48 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index bdc1f33fd3d1..6f0b41289a90 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3190,6 +3190,8 @@
 
 	nohugeiomap	[KNL,X86,PPC] Disable kernel huge I/O mappings.
 
+	nohugevmalloc	[PPC] Disable kernel huge vmalloc mappings.
+
 	nosmt		[KNL,S390] Disable symmetric multithreading (SMT).
 			Equivalent to smt=1.
 
diff --git a/arch/Kconfig b/arch/Kconfig
index af14a567b493..b2b89d629317 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -616,6 +616,10 @@ config HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 config HAVE_ARCH_HUGE_VMAP
 	bool
 
+config HAVE_ARCH_HUGE_VMALLOC
+	depends on HAVE_ARCH_HUGE_VMAP
+	bool
+
 config ARCH_WANT_HUGE_PMD_SHARE
 	bool
 
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 95dfd8ef3d4b..044e5a94967a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -175,6 +175,7 @@ config PPC
 	select GENERIC_TIME_VSYSCALL
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
+	select HAVE_ARCH_HUGE_VMALLOC		if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
 	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <= 14
diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index e3590e93bfff..8f25dbaca0a1 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -58,6 +58,7 @@ struct vm_struct {
 	unsigned long		size;
 	unsigned long		flags;
 	struct page		**pages;
+	unsigned int		page_order;
 	unsigned int		nr_pages;
 	phys_addr_t		phys_addr;
 	const void		*caller;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 0e2bab486fea..d785e5335529 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -8102,6 +8102,7 @@ void *__init alloc_large_system_hash(const char *tablename,
 	void *table = NULL;
 	gfp_t gfp_flags;
 	bool virt;
+	bool huge;
 
 	/* allow the kernel cmdline to have a say */
 	if (!numentries) {
@@ -8169,6 +8170,7 @@ void *__init alloc_large_system_hash(const char *tablename,
 		} else if (get_order(size) >= MAX_ORDER || hashdist) {
 			table = __vmalloc(size, gfp_flags);
 			virt = true;
+			huge = (find_vm_area(table)->page_order > 0);
 		} else {
 			/*
 			 * If bucketsize is not a power-of-two, we may free
@@ -8185,7 +8187,7 @@ void *__init alloc_large_system_hash(const char *tablename,
 
 	pr_info("%s hash table entries: %ld (order: %d, %lu bytes, %s)\n",
 		tablename, 1UL << log2qty, ilog2(size) - PAGE_SHIFT, size,
-		virt ? "vmalloc" : "linear");
+		virt ? (huge ? "vmalloc hugepage" : "vmalloc") : "linear");
 
 	if (_hash_shift)
 		*_hash_shift = log2qty;
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 4e5cb7c7f780..564d7497e551 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -45,6 +45,19 @@
 #include "internal.h"
 #include "pgalloc-track.h"
 
+#ifdef CONFIG_HAVE_ARCH_HUGE_VMALLOC
+static bool __ro_after_init vmap_allow_huge = true;
+
+static int __init set_nohugevmalloc(char *str)
+{
+	vmap_allow_huge = false;
+	return 0;
+}
+early_param("nohugevmalloc", set_nohugevmalloc);
+#else /* CONFIG_HAVE_ARCH_HUGE_VMALLOC */
+static const bool vmap_allow_huge = false;
+#endif	/* CONFIG_HAVE_ARCH_HUGE_VMALLOC */
+
 bool is_vmalloc_addr(const void *x)
 {
 	unsigned long addr = (unsigned long)x;
@@ -468,31 +481,12 @@ static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long en
 	return 0;
 }
 
-/**
- * map_kernel_range_noflush - map kernel VM area with the specified pages
- * @addr: start of the VM area to map
- * @size: size of the VM area to map
- * @prot: page protection flags to use
- * @pages: pages to map
- *
- * Map PFN_UP(@size) pages at @addr.  The VM area @addr and @size specify should
- * have been allocated using get_vm_area() and its friends.
- *
- * NOTE:
- * This function does NOT do any cache flushing.  The caller is responsible for
- * calling flush_cache_vmap() on to-be-mapped areas before calling this
- * function.
- *
- * RETURNS:
- * 0 on success, -errno on failure.
- */
-int map_kernel_range_noflush(unsigned long addr, unsigned long size,
-			     pgprot_t prot, struct page **pages)
+static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages)
 {
 	unsigned long start = addr;
-	unsigned long end = addr + size;
-	unsigned long next;
 	pgd_t *pgd;
+	unsigned long next;
 	int err = 0;
 	int nr = 0;
 	pgtbl_mod_mask mask = 0;
@@ -514,6 +508,65 @@ int map_kernel_range_noflush(unsigned long addr, unsigned long size,
 	return 0;
 }
 
+static int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages, unsigned int page_shift)
+{
+	WARN_ON(page_shift < PAGE_SHIFT);
+
+	if (page_shift == PAGE_SHIFT) {
+		return vmap_small_pages_range_noflush(addr, end, prot, pages);
+	} else {
+		unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
+
+		for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
+			int err;
+
+			err = vmap_range_noflush(addr, addr + (1UL << page_shift),
+						__pa(page_address(pages[i])), prot, page_shift);
+			if (err)
+				return err;
+
+			addr += 1UL << page_shift;
+		}
+
+		return 0;
+	}
+}
+
+static int vmap_pages_range(unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages, unsigned int page_shift)
+{
+	int err;
+
+	err = vmap_pages_range_noflush(addr, end, prot, pages, page_shift);
+	flush_cache_vmap(addr, end);
+	return err;
+}
+
+/**
+ * map_kernel_range_noflush - map kernel VM area with the specified pages
+ * @addr: start of the VM area to map
+ * @size: size of the VM area to map
+ * @prot: page protection flags to use
+ * @pages: pages to map
+ *
+ * Map PFN_UP(@size) pages at @addr.  The VM area @addr and @size specify should
+ * have been allocated using get_vm_area() and its friends.
+ *
+ * NOTE:
+ * This function does NOT do any cache flushing.  The caller is responsible for
+ * calling flush_cache_vmap() on to-be-mapped areas before calling this
+ * function.
+ *
+ * RETURNS:
+ * 0 on success, -errno on failure.
+ */
+int map_kernel_range_noflush(unsigned long addr, unsigned long size,
+			     pgprot_t prot, struct page **pages)
+{
+	return vmap_pages_range_noflush(addr, addr + size, prot, pages, PAGE_SHIFT);
+}
+
 int map_kernel_range(unsigned long start, unsigned long size, pgprot_t prot,
 		struct page **pages)
 {
@@ -2274,9 +2327,11 @@ static struct vm_struct *__get_vm_area_node(unsigned long size,
 	if (unlikely(!size))
 		return NULL;
 
-	if (flags & VM_IOREMAP)
-		align = 1ul << clamp_t(int, get_count_order_long(size),
-				       PAGE_SHIFT, IOREMAP_MAX_ORDER);
+	if (flags & VM_IOREMAP) {
+		align = max(align,
+			    1ul << clamp_t(int, get_count_order_long(size),
+					   PAGE_SHIFT, IOREMAP_MAX_ORDER));
+	}
 
 	area = kzalloc_node(sizeof(*area), gfp_mask & GFP_RECLAIM_MASK, node);
 	if (unlikely(!area))
@@ -2391,6 +2446,7 @@ static inline void set_area_direct_map(const struct vm_struct *area,
 {
 	int i;
 
+	/* HUGE_VMALLOC passes small pages to set_direct_map */
 	for (i = 0; i < area->nr_pages; i++)
 		if (page_address(area->pages[i]))
 			set_direct_map(area->pages[i]);
@@ -2424,11 +2480,12 @@ static void vm_remove_mappings(struct vm_struct *area, int deallocate_pages)
 	 * map. Find the start and end range of the direct mappings to make sure
 	 * the vm_unmap_aliases() flush includes the direct map.
 	 */
-	for (i = 0; i < area->nr_pages; i++) {
+	for (i = 0; i < area->nr_pages; i += 1U << area->page_order) {
 		unsigned long addr = (unsigned long)page_address(area->pages[i]);
 		if (addr) {
+			unsigned long page_size = PAGE_SIZE << area->page_order;
 			start = min(addr, start);
-			end = max(addr + PAGE_SIZE, end);
+			end = max(addr + page_size, end);
 			flush_dmap = 1;
 		}
 	}
@@ -2471,11 +2528,11 @@ static void __vunmap(const void *addr, int deallocate_pages)
 	if (deallocate_pages) {
 		int i;
 
-		for (i = 0; i < area->nr_pages; i++) {
+		for (i = 0; i < area->nr_pages; i += 1U << area->page_order) {
 			struct page *page = area->pages[i];
 
 			BUG_ON(!page);
-			__free_pages(page, 0);
+			__free_pages(page, area->page_order);
 		}
 		atomic_long_sub(area->nr_pages, &nr_vmalloc_pages);
 
@@ -2614,9 +2671,12 @@ void *vmap(struct page **pages, unsigned int count,
 EXPORT_SYMBOL(vmap);
 
 static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
-				 pgprot_t prot, int node)
+				 pgprot_t prot, unsigned int page_shift, int node)
 {
 	struct page **pages;
+	unsigned long addr = (unsigned long)area->addr;
+	unsigned long size = get_vm_area_size(area);
+	unsigned int page_order = page_shift - PAGE_SHIFT;
 	unsigned int nr_pages, array_size, i;
 	const gfp_t nested_gfp = (gfp_mask & GFP_RECLAIM_MASK) | __GFP_ZERO;
 	const gfp_t alloc_mask = gfp_mask | __GFP_NOWARN;
@@ -2624,7 +2684,7 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 					0 :
 					__GFP_HIGHMEM;
 
-	nr_pages = get_vm_area_size(area) >> PAGE_SHIFT;
+	nr_pages = size >> PAGE_SHIFT;
 	array_size = (nr_pages * sizeof(struct page *));
 
 	/* Please note that the recursion is strictly bounded. */
@@ -2643,29 +2703,29 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 
 	area->pages = pages;
 	area->nr_pages = nr_pages;
+	area->page_order = page_order;
 
-	for (i = 0; i < area->nr_pages; i++) {
+	for (i = 0; i < area->nr_pages; i += 1U << page_order) {
 		struct page *page;
+		int p;
 
-		if (node == NUMA_NO_NODE)
-			page = alloc_page(alloc_mask|highmem_mask);
-		else
-			page = alloc_pages_node(node, alloc_mask|highmem_mask, 0);
-
+		page = alloc_pages_node(node, alloc_mask|highmem_mask, page_order);
 		if (unlikely(!page)) {
 			/* Successfully allocated i pages, free them in __vunmap() */
 			area->nr_pages = i;
 			atomic_long_add(area->nr_pages, &nr_vmalloc_pages);
 			goto fail;
 		}
-		area->pages[i] = page;
+
+		for (p = 0; p < (1U << page_order); p++)
+			area->pages[i + p] = page + p;
+
 		if (gfpflags_allow_blocking(gfp_mask))
 			cond_resched();
 	}
 	atomic_long_add(area->nr_pages, &nr_vmalloc_pages);
 
-	if (map_kernel_range((unsigned long)area->addr, get_vm_area_size(area),
-			prot, pages) < 0)
+	if (vmap_pages_range(addr, addr + size, prot, pages, page_shift) < 0)
 		goto fail;
 
 	return area->addr;
@@ -2673,7 +2733,7 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 fail:
 	warn_alloc(gfp_mask, NULL,
 			  "vmalloc: allocation failure, allocated %ld of %ld bytes",
-			  (area->nr_pages*PAGE_SIZE), area->size);
+			  (area->nr_pages*PAGE_SIZE), size);
 	__vfree(area->addr);
 	return NULL;
 }
@@ -2704,19 +2764,42 @@ void *__vmalloc_node_range(unsigned long size, unsigned long align,
 	struct vm_struct *area;
 	void *addr;
 	unsigned long real_size = size;
+	unsigned long real_align = align;
+	unsigned int shift = PAGE_SHIFT;
 
-	size = PAGE_ALIGN(size);
 	if (!size || (size >> PAGE_SHIFT) > totalram_pages())
 		goto fail;
 
-	area = __get_vm_area_node(real_size, align, VM_ALLOC | VM_UNINITIALIZED |
+	if (vmap_allow_huge && (pgprot_val(prot) == pgprot_val(PAGE_KERNEL))) {
+		unsigned long size_per_node;
+
+		/*
+		 * Try huge pages. Only try for PAGE_KERNEL allocations,
+		 * others like modules don't yet expect huge pages in
+		 * their allocations due to apply_to_page_range not
+		 * supporting them.
+		 */
+
+		size_per_node = size;
+		if (node == NUMA_NO_NODE)
+			size_per_node /= num_online_nodes();
+		if (size_per_node >= PMD_SIZE) {
+			shift = PMD_SHIFT;
+			align = max(real_align, 1UL << shift);
+			size = ALIGN(real_size, 1UL << shift);
+		}
+	}
+
+again:
+	size = PAGE_ALIGN(size);
+	area = __get_vm_area_node(size, align, VM_ALLOC | VM_UNINITIALIZED |
 				vm_flags, start, end, node, gfp_mask, caller);
 	if (!area)
 		goto fail;
 
-	addr = __vmalloc_area_node(area, gfp_mask, prot, node);
+	addr = __vmalloc_area_node(area, gfp_mask, prot, shift, node);
 	if (!addr)
-		return NULL;
+		goto fail;
 
 	/*
 	 * In this function, newly allocated vm_struct has VM_UNINITIALIZED
@@ -2730,8 +2813,19 @@ void *__vmalloc_node_range(unsigned long size, unsigned long align,
 	return addr;
 
 fail:
-	warn_alloc(gfp_mask, NULL,
+	if (shift > PAGE_SHIFT) {
+		free_vm_area(area);
+		shift = PAGE_SHIFT;
+		align = real_align;
+		size = real_size;
+		goto again;
+	}
+
+	if (!area) {
+		/* Warn for area allocation, page allocations already warn */
+		warn_alloc(gfp_mask, NULL,
 			  "vmalloc: allocation failure: %lu bytes", real_size);
+	}
 	return NULL;
 }
 
@@ -3730,7 +3824,7 @@ static int s_show(struct seq_file *m, void *p)
 		seq_printf(m, " %pS", v->caller);
 
 	if (v->nr_pages)
-		seq_printf(m, " pages=%d", v->nr_pages);
+		seq_printf(m, " pages=%d order=%d", v->nr_pages, v->page_order);
 
 	if (v->phys_addr)
 		seq_printf(m, " phys=%pa", &v->phys_addr);
-- 
2.23.0

