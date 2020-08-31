Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45520258167
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 20:55:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgKCH1R0dzDqBS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 04:55:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LfUQ1dgd; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgK4Y456HzDqSj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 04:49:33 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id f142so2724507qke.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 11:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=61d0s3m/7uhWpyK922jU6WTG9ZOZ9bbaAAqwI/W1VXQ=;
 b=LfUQ1dgds44N0PJvtsqcs69rlQ1Ce5s8f1QS+ZjR4NIQdkKdTv+06zPYR5XNeaeZTL
 b1zu9zroFtdVf0vJvnxlnqALyzIOfypUiyI4cz6Ad9IPoelx5JkUnqbCQ3HtdjzDPYRk
 6zHyuGraJU8xv6RATkEKdksG42jJfoYHNxToTsisfnWzg0NPfGZQdHuRVyRksWOe7hWH
 vbg+V9NVafKSoAGW+O6pPu3gsg2nfRbnwDvKS2yDxgS3g3KNp7l2IPDqb7F0+xQqkTL6
 1NvBfu+eECOIwPgDM4+4yIo+ALaln3Opa9z72j+L55tnveXvVjlQmekLrBd881+JC2Db
 Z9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=61d0s3m/7uhWpyK922jU6WTG9ZOZ9bbaAAqwI/W1VXQ=;
 b=M6hGquWYgblo2eZVKr4pA5tNiNSG4kn28bCIz6vaZmb3KjTM9KKOgTGznUdkYPypnD
 boOHgXGJp30368I6Qfe4IeeYGJda779LeZNPVilOknvfug+VnQyrWdOVEkD/ZjwLjiUk
 4oc8I+7SNxTTVk437lbh+cwf7OInqi4b+mV14BZIY+DOVdM2BGGGWmr4xy/bCzBtUft7
 8+mCENETfV/riSjmY2Ej42ifvP1lie3PHbcD7pJhvpeR0DnKV7z6hm7LHACqadgTTzEO
 8zf9Dyb3a6LGWEZWcpv5JYmPVnIeTHRKmLr5zowVZch3tREtyFCjaGxfI3MM6q57EURk
 J4oA==
X-Gm-Message-State: AOAM533vsnit0jAgWtvpXzK1vdPojZLI4B0AC2lFkK0qDdzY44mROF7H
 ZeLd3PfVGOpN0VTW9W0Hk0A=
X-Google-Smtp-Source: ABdhPJxp5Fmk9Hc7/egXgWZgQfEhoE/fi77NKEXiGSfYcKqF0edTUHVzDBFPfgxaSbYj0yWqvYEgbg==
X-Received: by 2002:a37:414f:: with SMTP id o76mr2729415qka.162.1598899771334; 
 Mon, 31 Aug 2020 11:49:31 -0700 (PDT)
Received: from LeoBras.ibmuc.com ([2804:14d:8084:8e41:9b0d:571e:a65:b5d8])
 by smtp.gmail.com with ESMTPSA id s17sm11779070qte.50.2020.08.31.11.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 11:49:30 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Nayna Jain <nayna@linux.ibm.com>, Eric Richter <erichte@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>, Matthew Wilcox <willy@infradead.org>
Subject: [RFC PATCH 2/2] powerpc/kernel/iommu: Introduce IOMMU DMA pagecache
Date: Mon, 31 Aug 2020 15:48:59 -0300
Message-Id: <20200831184859.110660-3-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200831184859.110660-1-leobras.c@gmail.com>
References: <20200831184859.110660-1-leobras.c@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In pseries, mapping a DMA page for a cpu memory range requires a
H_PUT_TCE* hypercall, and unmapping requires a H_STUFF_TCE hypercall.
When doing a lot of I/O, a thread can spend a lot of time doing such
hcalls, specially when a DMA mapping don't get reused.

The purpose of this change is to introduce a mechanism similar to
a pagecache, but for reusing DMA mappings, improving performance and
avoiding multiple DMA mappings of the same cpupage.

This works based in a few current behaviors:
- Page reuse:
    It's common for userspace process to reuse the same page for several
    allocations This is probably caused by page buffering behavior that
    come from libc, so getting pages from the kernel is less expensive.

- A lot of small allocations are used:
    Some workloads do a lot of allocations that do not fill a whole page
    causing multiple DMA mappings for a single page.

How it work:
- When a DMA mapping is required for given allocation, it first searches
  the DMA pagecache for a matching mapping. When found, increment refcount,
  when not found, a new mapping is created.
- Every time a new mapping is created, it's added to the DMA pagecache,
  with refcount = 1;
- When the mapping is not needed anymore (iommu_free()), it looks in the
  DMA pagecache for the entry, and the decrements it's refcount.
- When there are more than IOMMU_MAP_LIST_MAX entries in the
   DMA pagecache, it removes the older ones.

What is inside:
- 1 XArray which indexes the DMA page addresses, used for removing
  mappings and decreasing refcounts.
- 1 XArray which indexes CPU page addresses, for finding matching mappings.
  - As there can be multiple mappings (directions) for the same cpupage,
   this one keeps a llist for looking into the entries.
- Every entry points (page) in the XArray points to the mapping struct.

- The mapping struct have:
  - DMA & CPU page addresses, size (pages) , direction and refcount.
  - 1 llist used for multiple mappings at the same cpupage
  - 1 llist used for the FIFO (removing old unused entries)

- The cache struct, added to iommu_table, have:
  - Both XArrays,
  - 2 llist for entry/removal point on FIFO,
  - 1 Atomic Cachesize, to manage the FIFO.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/include/asm/iommu-cache.h |  31 ++++
 arch/powerpc/include/asm/iommu.h       |   4 +
 arch/powerpc/kernel/Makefile           |   2 +-
 arch/powerpc/kernel/iommu-cache.c      | 247 +++++++++++++++++++++++++
 arch/powerpc/kernel/iommu.c            |  15 +-
 5 files changed, 293 insertions(+), 6 deletions(-)
 create mode 100644 arch/powerpc/include/asm/iommu-cache.h
 create mode 100644 arch/powerpc/kernel/iommu-cache.c

diff --git a/arch/powerpc/include/asm/iommu-cache.h b/arch/powerpc/include/asm/iommu-cache.h
new file mode 100644
index 000000000000..ad298a4cd9c9
--- /dev/null
+++ b/arch/powerpc/include/asm/iommu-cache.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _IOMMU_CACHE_H
+#define _IOMMU_CACHE_H
+#ifdef __KERNEL__
+
+#include <linux/llist.h>
+#include <linux/xarray.h>
+#include <linux/atomic.h>
+
+struct dmacache {
+	struct llist_head fifo_add;
+	struct llist_head fifo_del;
+	struct xarray cpupages;
+	struct xarray dmapages;
+	atomic64_t cachesize;
+};
+
+#include <asm/iommu.h>
+
+void iommu_cache_init(struct iommu_table *tbl);
+void iommu_dmacache_add(struct iommu_table *tbl, void *page, unsigned int npages, dma_addr_t addr,
+			enum dma_data_direction direction);
+dma_addr_t iommu_dmacache_use(struct iommu_table *tbl, void *page, unsigned int npages,
+			      enum dma_data_direction direction);
+void iommu_dmacache_free(struct iommu_table *tbl, dma_addr_t dma_handle, unsigned int npages);
+
+#define IOMMU_MAP_LIST_MAX	8192
+#define IOMMU_MAP_LIST_THRES	128
+
+#endif /* __KERNEL__ */
+#endif /* _IOMMU_CACHE_H */
diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index 2913e5c8b1f8..51a2f5503f8e 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -18,6 +18,7 @@
 #include <asm/types.h>
 #include <asm/pci-bridge.h>
 #include <asm/asm-const.h>
+#include <asm/iommu-cache.h>
 
 #define IOMMU_PAGE_SHIFT_4K      12
 #define IOMMU_PAGE_SIZE_4K       (ASM_CONST(1) << IOMMU_PAGE_SHIFT_4K)
@@ -114,6 +115,7 @@ struct iommu_table {
 	int it_nid;
 	unsigned long it_reserved_start; /* Start of not-DMA-able (MMIO) area */
 	unsigned long it_reserved_end;
+	struct dmacache cache;
 };
 
 #define IOMMU_TABLE_USERSPACE_ENTRY_RO(tbl, entry) \
@@ -317,6 +319,8 @@ extern void iommu_release_ownership(struct iommu_table *tbl);
 extern enum dma_data_direction iommu_tce_direction(unsigned long tce);
 extern unsigned long iommu_direction_to_tce_perm(enum dma_data_direction dir);
 
+void __iommu_free(struct iommu_table *tbl, dma_addr_t dma_addr, unsigned int npages);
+
 #ifdef CONFIG_PPC_CELL_NATIVE
 extern bool iommu_fixed_is_weak;
 #else
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index cbf41fb4ee89..62f6c90076d9 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -104,7 +104,7 @@ extra-y				+= vmlinux.lds
 obj-$(CONFIG_RELOCATABLE)	+= reloc_$(BITS).o
 
 obj-$(CONFIG_PPC32)		+= entry_32.o setup_32.o early_32.o
-obj-$(CONFIG_PPC64)		+= dma-iommu.o iommu.o
+obj-$(CONFIG_PPC64)		+= dma-iommu.o iommu.o iommu-cache.o
 obj-$(CONFIG_KGDB)		+= kgdb.o
 obj-$(CONFIG_BOOTX_TEXT)	+= btext.o
 obj-$(CONFIG_SMP)		+= smp.o
diff --git a/arch/powerpc/kernel/iommu-cache.c b/arch/powerpc/kernel/iommu-cache.c
new file mode 100644
index 000000000000..3a5b2725ab51
--- /dev/null
+++ b/arch/powerpc/kernel/iommu-cache.c
@@ -0,0 +1,247 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <asm/iommu-cache.h>
+
+struct dma_mapping {
+	struct llist_node mapping;
+	struct llist_node fifo;
+	unsigned long dmapage;
+	unsigned long cpupage;
+	unsigned long size;
+	refcount_t count;
+	enum dma_data_direction direction;
+
+};
+
+struct cpupage_entry {
+	struct llist_node node;
+	struct dma_mapping *data;
+};
+
+/**
+ * iommu_dmacache_use() - Looks for a DMA mapping in cache
+ * @tbl: Device's iommu_table.
+ * @page: Address for which a DMA mapping is desired.
+ * @npages: Page count needed from that address
+ * @direction: DMA direction needed for the mapping
+ *
+ * Looks into the DMA cache for a page/range that is already mapped with given direction.
+ *
+ * Return: DMA mapping for range/direction present in cache
+ *	   DMA_MAPPING_ERROR if not found.
+ */
+dma_addr_t iommu_dmacache_use(struct iommu_table *tbl, void *page, unsigned int npages,
+			      enum dma_data_direction direction)
+{
+	struct cpupage_entry *e;
+	struct dma_mapping *d;
+	const unsigned long start = (unsigned long)page >> tbl->it_page_shift;
+	const unsigned long end = start + npages;
+
+	e = xa_load(&tbl->cache.cpupages, start);
+	if (!e)
+		return DMA_MAPPING_ERROR;
+
+	llist_for_each_entry(e, &e->node, node) {
+		d = e->data;
+		if (start < d->cpupage || end > (d->cpupage + d->size) ||
+		    !DMA_DIR_COMPAT(d->direction, direction))
+			continue;
+
+		refcount_inc(&d->count);
+		return (d->dmapage + start - d->cpupage) << tbl->it_page_shift;
+	}
+
+	return DMA_MAPPING_ERROR;
+}
+
+/**
+ * iommu_dmacache_entry_remove() - Remove a dma mapping from cpupage & dmapage XArrays
+ * @cache: Device's dmacache.
+ * @d: dma_mapping to be removed
+ */
+static void iommu_dmacache_entry_remove(struct dmacache *cache, struct dma_mapping *d)
+{
+	struct cpupage_entry *e, *tmp;
+	dma_addr_t dp = d->dmapage;
+	dma_addr_t end = dp + d->size;
+	unsigned long cp = d->cpupage;
+
+	for (; dp < end; dp++, cp++) {
+		e = xa_erase(&cache->cpupages, cp);
+		if (e && e->node.next) {
+			tmp = llist_entry(e->node.next, struct cpupage_entry, node);
+			xa_store(&cache->cpupages, cp, tmp, GFP_KERNEL);
+		}
+		xa_erase(&cache->dmapages, dp);
+		kfree(e);
+	}
+}
+
+/**
+ * iommu_dmacache_clean() - Clean count mappings from dmacache fifo
+ * @tbl: Device's iommu_table.
+ * @count: number of entries to be removed.
+ */
+static void iommu_dmacache_clean(struct iommu_table *tbl, const long count)
+{
+	struct dma_mapping *d, *tmp;
+	struct llist_node *n;
+	struct dmacache *cache = &tbl->cache;
+	unsigned long removed = 0;
+
+	n = llist_del_all(&cache->fifo_del);
+
+	if (!n)
+		return;
+
+	llist_for_each_entry_safe(d, tmp, n, fifo) {
+		switch (refcount_read(&d->count)) {
+		case 0:
+			/* Fully remove entry */
+			iommu_dmacache_entry_remove(cache, d);
+			__iommu_free(tbl, d->dmapage << tbl->it_page_shift, d->size);
+			kfree(d);
+			removed++;
+			break;
+		case 1:
+			/* Remove entry but don't undo mapping */
+			iommu_dmacache_entry_remove(cache, d);
+			kfree(d);
+			removed++;
+			break;
+		default:
+			/* In use. Re-add it to list. */
+			n = xchg(&tbl->cache.fifo_add.first, &d->fifo);
+			if (!n)
+				n->next = &d->fifo;
+
+			break;
+		}
+
+		if (removed >= count)
+			break;
+	}
+
+	atomic64_sub(removed, &tbl->cache.cachesize);
+
+	xchg(&tbl->cache.fifo_del.first, &tmp->fifo);
+}
+
+/**
+ * iommu_dmacache_free() - Decrement a mapping usage from dmacache and clean when full
+ * @tbl: Device's iommu_table.
+ * @dma_handle: DMA address from the mapping.
+ * @npages: Page count from that address
+ *
+ * Decrements a refcount for a mapping in this dma_handle + npages, and remove
+ * some unused dma mappings from dmacache fifo.
+ */
+void iommu_dmacache_free(struct iommu_table *tbl, dma_addr_t dma_handle,	unsigned int npages)
+{
+	struct dma_mapping *d;
+	long exceeding;
+
+	d = xa_load(&tbl->cache.dmapages, dma_handle >> tbl->it_page_shift);
+	if (!d) {
+		/* Not in list, just free */
+		__iommu_free(tbl, dma_handle, npages);
+		return;
+	}
+
+	refcount_dec(&d->count);
+
+	exceeding = atomic64_read(&tbl->cache.cachesize) - IOMMU_MAP_LIST_MAX;
+
+	if (exceeding > 0)
+		iommu_dmacache_clean(tbl, exceeding + IOMMU_MAP_LIST_THRES);
+}
+
+/**
+ * iommu_dmacache_add() - Create and add a new dma mapping into cache.
+ * @tbl: Device's iommu_table.
+ * @page: Address for which a DMA mapping was created.
+ * @npages: Page count mapped from that address
+ * @addr: DMA address created for that mapping
+ * @direction: DMA direction for the mapping created
+ *
+ * Create a dma_mapping and add it to dmapages and cpupages XArray, then add it to fifo.
+ * On both cpupages and dmapages, an entry will be created for each page in the mapping.
+ * On cpupages, as there may exist many mappings for a single cpupage, each entry has a llist
+ * that starts at the last mapped entry.
+ *
+ */
+void iommu_dmacache_add(struct iommu_table *tbl, void *page, unsigned int npages, dma_addr_t addr,
+			enum dma_data_direction direction)
+{
+	struct dma_mapping *d, *tmp;
+	struct cpupage_entry *e, *old;
+	struct llist_node *n;
+	unsigned long p = (unsigned long)page;
+	unsigned int i;
+
+	d = kmalloc(sizeof(*d), GFP_KERNEL);
+	if (!d)
+		return;
+
+	d->cpupage = (unsigned long)p >> tbl->it_page_shift;
+	d->dmapage = (unsigned long)addr >> tbl->it_page_shift;
+	d->size = npages;
+	d->direction = direction;
+	d->fifo.next = NULL;
+	refcount_set(&d->count, 1);
+
+	p = d->cpupage;
+	addr = d->dmapage;
+
+	for (i = 0; i < npages ; i++) {
+		/* Only one mapping may exist for a DMA address*/
+		tmp = xa_store(&tbl->cache.dmapages, addr++, d, GFP_KERNEL);
+		if (xa_is_err(tmp))
+			break;
+
+		/* Multiple mappings may exist for a page, get them in a list*/
+		e = kmalloc(sizeof(*e), GFP_KERNEL);
+		if (!d)
+			break;
+
+		e->data = d;
+		old = xa_store(&tbl->cache.cpupages, p++, e, GFP_KERNEL);
+		e->node.next = &old->node;
+
+		if (xa_is_err(old)) {
+			kfree(e);
+			break;
+		}
+	}
+
+	n = xchg(&tbl->cache.fifo_add.first, &d->fifo);
+	if (!n)
+		n->next = &d->fifo;
+
+	atomic64_inc(&tbl->cache.cachesize);
+}
+
+void iommu_cache_init(struct iommu_table *tbl)
+{
+	struct dma_mapping *d;
+
+	init_llist_head(&tbl->cache.fifo_add);
+	init_llist_head(&tbl->cache.fifo_del);
+
+	/* First entry for linking both llist_heads */
+	d = kmalloc(sizeof(*d), GFP_KERNEL);
+	if (!d)
+		panic("%s: Can't allocate %ld bytes\n", __func__, sizeof(*d));
+
+	d->cpupage = -1UL;
+	d->dmapage = -1UL;
+	refcount_set(&d->count, 1);
+	llist_add(&d->fifo, &tbl->cache.fifo_add);
+	llist_add(&d->fifo, &tbl->cache.fifo_del);
+
+	xa_init(&tbl->cache.cpupages);
+	xa_init(&tbl->cache.dmapages);
+
+	atomic64_set(&tbl->cache.cachesize, 0);
+}
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index c5d5d36ab65e..60703af172ad 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -40,8 +40,6 @@
 
 static int novmerge;
 
-static void __iommu_free(struct iommu_table *, dma_addr_t, unsigned int);
-
 static int __init setup_iommu(char *str)
 {
 	if (!strcmp(str, "novmerge"))
@@ -308,6 +306,10 @@ static dma_addr_t iommu_alloc(struct device *dev, struct iommu_table *tbl,
 	dma_addr_t ret = DMA_MAPPING_ERROR;
 	int build_fail;
 
+	ret = iommu_dmacache_use(tbl, page, npages, direction);
+	if (ret != DMA_MAPPING_ERROR)
+		return ret;
+
 	entry = iommu_range_alloc(dev, tbl, npages, NULL, mask, align_order);
 
 	if (unlikely(entry == DMA_MAPPING_ERROR))
@@ -338,6 +340,8 @@ static dma_addr_t iommu_alloc(struct device *dev, struct iommu_table *tbl,
 	/* Make sure updates are seen by hardware */
 	mb();
 
+	iommu_dmacache_add(tbl, page, npages, ret, direction);
+
 	return ret;
 }
 
@@ -388,8 +392,7 @@ static struct iommu_pool *get_pool(struct iommu_table *tbl,
 	return p;
 }
 
-static void __iommu_free(struct iommu_table *tbl, dma_addr_t dma_addr,
-			 unsigned int npages)
+void __iommu_free(struct iommu_table *tbl, dma_addr_t dma_addr, unsigned int npages)
 {
 	unsigned long entry, free_entry;
 	unsigned long flags;
@@ -413,7 +416,7 @@ static void __iommu_free(struct iommu_table *tbl, dma_addr_t dma_addr,
 static void iommu_free(struct iommu_table *tbl, dma_addr_t dma_addr,
 		unsigned int npages)
 {
-	__iommu_free(tbl, dma_addr, npages);
+	iommu_dmacache_free(tbl, dma_addr, npages);
 
 	/* Make sure TLB cache is flushed if the HW needs it. We do
 	 * not do an mb() here on purpose, it is not needed on any of
@@ -719,6 +722,8 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
 
 	iommu_table_clear(tbl);
 
+	iommu_cache_init(tbl);
+
 	if (!welcomed) {
 		printk(KERN_INFO "IOMMU table initialized, virtual merging %s\n",
 		       novmerge ? "disabled" : "enabled");
-- 
2.25.4

