Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 376FE1F58E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 15:27:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453wM55BJwzDqTZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 23:26:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fLMePcIC"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453wDj3YsSzDqS9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 23:21:25 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id g3so1371395pfi.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 06:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ip56oQp/MiPwbfoD/lJd9v+rKbeF28/RCtEcjd99m7M=;
 b=fLMePcICUHw6bk34/HXTSNEnZQbib95S4xjsXp2eaJHwSjzUE84qBl+TWgWMe/Pdor
 y0sz+OT/XjfRQrRYK3LAU1EZGMMqgZ4M/T2tMhbmreGnDXtxAWDLvgVWQbwvl3fswdf4
 FCfcJqKFs624EhoATPsqTNVdwsNi+qhQ7tVFXSK/2548PgibNFqugO77ElNnmfr+OE4j
 6G51bHLaSHvAox0YBnbspdV1V7icCN96rCQj25rhHVbPzmBMw9VOxtIMtSyjDGJHAipB
 x2lWSS7PMTp0MRVljrUt+p+MIlstq8t7yr4XahdjehAreJ3+NNiGkE4UuAGqil3hN1SC
 3HVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ip56oQp/MiPwbfoD/lJd9v+rKbeF28/RCtEcjd99m7M=;
 b=sfX0kxG1geLLpFvKqNkzLynRADFbJEQjCxPantS7RFhYxPTCAaOwfMyXlhmr82FH1f
 CfNf/o+23iMavKRnLRHinjkJd/UnAS68MJ1DCutq2wkgxf6KkLl17xlA60rp7JeDMYp5
 rNJ8T++SH9gmIahQxMBojOARO94HR9uisKxqE0z8xhCZ8dJzD3H0xxehTwVgYJeZN3a3
 siSWNh0RZNRMSLUjjcB0TQOinPrOGi3/aU7BaXDsF1GnAioIewZUpCaynJWcOJKJypOO
 YQePayjpwmAjrs3BHHiFhP3GRUTmfTmQtcpDNslvbChTkFLVSph9p9W+x+IwauYmxQB7
 Klew==
X-Gm-Message-State: APjAAAWMgFv+53l76YxE+WmchfJbnx7O22t8h9uSdc8gQykNGy2lqPlX
 4e9ojs88FQ4uf5dyNkoH7waYP4Js
X-Google-Smtp-Source: APXvYqw0njhCj9KpkSNJkxMjl1+53gGa9zdHsWSP7PpJ5b02y8wyAiMtjyVWx7Mmq1iIEDkXr0Zt5Q==
X-Received: by 2002:aa7:8a87:: with SMTP id a7mr9083441pfc.53.1557926482683;
 Wed, 15 May 2019 06:21:22 -0700 (PDT)
Received: from bobo.local0.net (115-64-240-98.tpgi.com.au. [115.64.240.98])
 by smtp.gmail.com with ESMTPSA id a19sm2784459pgm.46.2019.05.15.06.21.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 06:21:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 3/5] mm/vmalloc: Hugepage vmalloc mappings
Date: Wed, 15 May 2019 23:19:42 +1000
Message-Id: <20190515131944.12489-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190515131944.12489-1-npiggin@gmail.com>
References: <20190515131944.12489-1-npiggin@gmail.com>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This appears to help cached git diff performance by about 5% on a
POWER9 (with 32MB dentry cache hash).

  Profiling git diff dTLB misses with a vanilla kernel:

  81.75%  git      [kernel.vmlinux]    [k] __d_lookup_rcu
   7.21%  git      [kernel.vmlinux]    [k] strncpy_from_user
   1.77%  git      [kernel.vmlinux]    [k] find_get_entry
   1.59%  git      [kernel.vmlinux]    [k] kmem_cache_free

            40,168      dTLB-miss
       0.100342754 seconds time elapsed

After this patch (and the subsequent powerpc HUGE_VMAP patches), the
dentry cache hash gets mapped with 2MB pages:

             2,987      dTLB-miss
       0.095933138 seconds time elapsed

elapsed time improvement isn't too scientific but seems consistent,
TLB misses certainly improves an order of magnitude. My laptop
takes a lot of misses here too, so x86 would be interesting to test,
I think it should just work there.

---
 include/linux/vmalloc.h |  1 +
 mm/vmalloc.c            | 87 +++++++++++++++++++++++++++--------------
 2 files changed, 59 insertions(+), 29 deletions(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index c6eebb839552..029635560306 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -42,6 +42,7 @@ struct vm_struct {
 	unsigned long		size;
 	unsigned long		flags;
 	struct page		**pages;
+	unsigned int		page_shift;
 	unsigned int		nr_pages;
 	phys_addr_t		phys_addr;
 	const void		*caller;
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index e5e9e1fcac01..c9ba88768bca 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -216,32 +216,34 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr,
  * Ie. pte at addr+N*PAGE_SIZE shall point to pfn corresponding to pages[N]
  */
 static int vmap_page_range_noflush(unsigned long start, unsigned long end,
-				   pgprot_t prot, struct page **pages)
+				   pgprot_t prot, struct page **pages,
+				   unsigned int page_shift)
 {
-	pgd_t *pgd;
-	unsigned long next;
 	unsigned long addr = start;
-	int err = 0;
-	int nr = 0;
+	unsigned int i, nr = (end - start) >> (PAGE_SHIFT + page_shift);
 
-	BUG_ON(addr >= end);
-	pgd = pgd_offset_k(addr);
-	do {
-		next = pgd_addr_end(addr, end);
-		err = vmap_p4d_range(pgd, addr, next, prot, pages, &nr);
+	for (i = 0; i < nr; i++) {
+		int err;
+
+		err = ioremap_page_range(addr,
+					addr + (PAGE_SIZE << page_shift),
+					__pa(page_address(pages[i])), prot);
 		if (err)
 			return err;
-	} while (pgd++, addr = next, addr != end);
+
+		addr += PAGE_SIZE << page_shift;
+	}
 
 	return nr;
 }
 
 static int vmap_page_range(unsigned long start, unsigned long end,
-			   pgprot_t prot, struct page **pages)
+			   pgprot_t prot, struct page **pages,
+			   unsigned int page_shift)
 {
 	int ret;
 
-	ret = vmap_page_range_noflush(start, end, prot, pages);
+	ret = vmap_page_range_noflush(start, end, prot, pages, page_shift);
 	flush_cache_vmap(start, end);
 	return ret;
 }
@@ -1189,7 +1191,7 @@ void *vm_map_ram(struct page **pages, unsigned int count, int node, pgprot_t pro
 		addr = va->va_start;
 		mem = (void *)addr;
 	}
-	if (vmap_page_range(addr, addr + size, prot, pages) < 0) {
+	if (vmap_page_range(addr, addr + size, prot, pages, 0) < 0) {
 		vm_unmap_ram(mem, count);
 		return NULL;
 	}
@@ -1305,7 +1307,7 @@ void __init vmalloc_init(void)
 int map_kernel_range_noflush(unsigned long addr, unsigned long size,
 			     pgprot_t prot, struct page **pages)
 {
-	return vmap_page_range_noflush(addr, addr + size, prot, pages);
+	return vmap_page_range_noflush(addr, addr + size, prot, pages, 0);
 }
 
 /**
@@ -1352,7 +1354,7 @@ int map_vm_area(struct vm_struct *area, pgprot_t prot, struct page **pages)
 	unsigned long end = addr + get_vm_area_size(area);
 	int err;
 
-	err = vmap_page_range(addr, end, prot, pages);
+	err = vmap_page_range(addr, end, prot, pages, 0);
 
 	return err > 0 ? 0 : err;
 }
@@ -1395,8 +1397,9 @@ static struct vm_struct *__get_vm_area_node(unsigned long size,
 		return NULL;
 
 	if (flags & VM_IOREMAP)
-		align = 1ul << clamp_t(int, get_count_order_long(size),
-				       PAGE_SHIFT, IOREMAP_MAX_ORDER);
+		align = max(align,
+				1ul << clamp_t(int, get_count_order_long(size),
+				       PAGE_SHIFT, IOREMAP_MAX_ORDER));
 
 	area = kzalloc_node(sizeof(*area), gfp_mask & GFP_RECLAIM_MASK, node);
 	if (unlikely(!area))
@@ -1608,7 +1611,7 @@ static void __vunmap(const void *addr, int deallocate_pages)
 			struct page *page = area->pages[i];
 
 			BUG_ON(!page);
-			__free_pages(page, 0);
+			__free_pages(page, area->page_shift);
 		}
 
 		kvfree(area->pages);
@@ -1751,14 +1754,17 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 				 pgprot_t prot, int node)
 {
 	struct page **pages;
+	unsigned long addr = (unsigned long)area->addr;
+	unsigned long size = get_vm_area_size(area);
+	unsigned int page_shift = area->page_shift;
+	unsigned int shift = page_shift + PAGE_SHIFT;
 	unsigned int nr_pages, array_size, i;
 	const gfp_t nested_gfp = (gfp_mask & GFP_RECLAIM_MASK) | __GFP_ZERO;
 	const gfp_t alloc_mask = gfp_mask | __GFP_NOWARN;
 	const gfp_t highmem_mask = (gfp_mask & (GFP_DMA | GFP_DMA32)) ?
-					0 :
-					__GFP_HIGHMEM;
+					0 : __GFP_HIGHMEM;
 
-	nr_pages = get_vm_area_size(area) >> PAGE_SHIFT;
+	nr_pages = size >> shift;
 	array_size = (nr_pages * sizeof(struct page *));
 
 	area->nr_pages = nr_pages;
@@ -1779,10 +1785,8 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 	for (i = 0; i < area->nr_pages; i++) {
 		struct page *page;
 
-		if (node == NUMA_NO_NODE)
-			page = alloc_page(alloc_mask|highmem_mask);
-		else
-			page = alloc_pages_node(node, alloc_mask|highmem_mask, 0);
+		page = alloc_pages_node(node,
+				alloc_mask|highmem_mask, page_shift);
 
 		if (unlikely(!page)) {
 			/* Successfully allocated i pages, free them in __vunmap() */
@@ -1794,8 +1798,9 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 			cond_resched();
 	}
 
-	if (map_vm_area(area, prot, pages))
+	if (vmap_page_range(addr, addr + size, prot, pages, page_shift) < 0)
 		goto fail;
+
 	return area->addr;
 
 fail:
@@ -1832,19 +1837,35 @@ void *__vmalloc_node_range(unsigned long size, unsigned long align,
 	struct vm_struct *area;
 	void *addr;
 	unsigned long real_size = size;
+	unsigned long real_align = align;
+	unsigned long size_per_node;
+	unsigned int shift;
 
 	size = PAGE_ALIGN(size);
 	if (!size || (size >> PAGE_SHIFT) > totalram_pages())
 		goto fail;
 
+	size_per_node = size;
+	if (node == NUMA_NO_NODE)
+		size_per_node /= num_online_nodes();
+	if (size_per_node >= PMD_SIZE)
+		shift = PMD_SHIFT;
+	else
+		shift = PAGE_SHIFT;
+again:
+	align = max(real_align, 1UL << shift);
+	size = ALIGN(real_size, align);
+
 	area = __get_vm_area_node(size, align, VM_ALLOC | VM_UNINITIALIZED |
 				vm_flags, start, end, node, gfp_mask, caller);
 	if (!area)
 		goto fail;
 
+	area->page_shift = shift - PAGE_SHIFT;
+
 	addr = __vmalloc_area_node(area, gfp_mask, prot, node);
 	if (!addr)
-		return NULL;
+		goto fail;
 
 	/*
 	 * In this function, newly allocated vm_struct has VM_UNINITIALIZED
@@ -1858,8 +1879,16 @@ void *__vmalloc_node_range(unsigned long size, unsigned long align,
 	return addr;
 
 fail:
-	warn_alloc(gfp_mask, NULL,
+	if (shift == PMD_SHIFT) {
+		shift = PAGE_SHIFT;
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
 
-- 
2.20.1

