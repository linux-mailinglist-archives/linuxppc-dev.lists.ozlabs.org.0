Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A785327891
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 08:50:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DpsrH3JFYz3f2N
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 18:50:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=HUTc/sQJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+bce9324c41c3486454c7+6399+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=HUTc/sQJ; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dpslj0qprz3dDY
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Mar 2021 18:46:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=81M6EJPI3vkCtYnpFa0x4gniskFZXPw81KUK+OV+b2E=; b=HUTc/sQJH9VIyxfTKlMOFXA8mh
 1hx2sw1uXE8i9EXaUGwspaQ5tiNwyZayIKCm2EBLLamUOrDVgrR3x+jzSCV3A7+ZFClygClxqJAzI
 WCQhx1P7IBp93xu0Wgqj7bGXMiIXAn8dFlUDsD7EAJpwF0+Dz6PHM09tCTxcW1dWXCUh+DS7uvJwB
 9hX5wP43qtWNKxLup518cW2MhEFWy/79IxhX4iyy7Q6AFNPKH7GMLk+phrlo/VE/z5hb0yoUDmTLa
 HcZl+u4kGVipTyyV83ID7PcJLANbYevmwLYwvy9Bi0U+4ByqmfrTM/34J9nribzAetC+Ba/2MNiSS
 dyY8up2g==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGdG1-00FRFO-Qp; Mon, 01 Mar 2021 07:46:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 12/14] swiotlb: move global variables into a new io_tlb_mem
 structure
Date: Mon,  1 Mar 2021 08:44:34 +0100
Message-Id: <20210301074436.919889-13-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301074436.919889-1-hch@lst.de>
References: <20210301074436.919889-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 Claire Chang <tientzu@chromium.org>, linuxppc-dev@lists.ozlabs.org,
 Dongli Zhang <dongli.zhang@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Claire Chang <tientzu@chromium.org>

Added a new struct, io_tlb_mem, as the IO TLB memory pool descriptor and
moved relevant global variables into that struct.
This will be useful later to allow for restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
[hch: rebased]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/xen/swiotlb-xen.c |   2 +-
 include/linux/swiotlb.h   |  43 ++++-
 kernel/dma/swiotlb.c      | 354 +++++++++++++++++---------------------
 3 files changed, 203 insertions(+), 196 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 4ecfce2c6f7263..5329ad54a5f34e 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -548,7 +548,7 @@ xen_swiotlb_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
 static int
 xen_swiotlb_dma_supported(struct device *hwdev, u64 mask)
 {
-	return xen_phys_to_dma(hwdev, io_tlb_end - 1) <= mask;
+	return xen_phys_to_dma(hwdev, io_tlb_default_mem.end - 1) <= mask;
 }
 
 const struct dma_map_ops xen_swiotlb_dma_ops = {
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 0696bdc8072e97..5ec5378b17c333 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -6,6 +6,7 @@
 #include <linux/init.h>
 #include <linux/types.h>
 #include <linux/limits.h>
+#include <linux/spinlock.h>
 
 struct device;
 struct page;
@@ -61,11 +62,49 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t phys,
 
 #ifdef CONFIG_SWIOTLB
 extern enum swiotlb_force swiotlb_force;
-extern phys_addr_t io_tlb_start, io_tlb_end;
+
+/**
+ * struct io_tlb_mem - IO TLB Memory Pool Descriptor
+ *
+ * @start:	The start address of the swiotlb memory pool. Used to do a quick
+ *		range check to see if the memory was in fact allocated by this
+ *		API.
+ * @end:	The end address of the swiotlb memory pool. Used to do a quick
+ *		range check to see if the memory was in fact allocated by this
+ *		API.
+ * @nslabs:	The number of IO TLB blocks (in groups of 64) between @start and
+ *		@end. This is command line adjustable via setup_io_tlb_npages.
+ * @used:	The number of used IO TLB block.
+ * @list:	The free list describing the number of free entries available
+ *		from each index.
+ * @index:	The index to start searching in the next round.
+ * @orig_addr:	The original address corresponding to a mapped entry.
+ * @alloc_size:	Size of the allocated buffer.
+ * @lock:	The lock to protect the above data structures in the map and
+ *		unmap calls.
+ * @debugfs:	The dentry to debugfs.
+ * @late_alloc:	%true if allocated using the page allocator
+ */
+struct io_tlb_mem {
+	phys_addr_t start;
+	phys_addr_t end;
+	unsigned long nslabs;
+	unsigned long used;
+	unsigned int *list;
+	unsigned int index;
+	phys_addr_t *orig_addr;
+	size_t *alloc_size;
+	spinlock_t lock;
+	struct dentry *debugfs;
+	bool late_alloc;
+};
+extern struct io_tlb_mem io_tlb_default_mem;
 
 static inline bool is_swiotlb_buffer(phys_addr_t paddr)
 {
-	return paddr >= io_tlb_start && paddr < io_tlb_end;
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
+
+	return paddr >= mem->start && paddr < mem->end;
 }
 
 void __init swiotlb_exit(void);
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index ebe7c123e27e52..6aa84fa3b1467e 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -59,32 +59,11 @@
  */
 #define IO_TLB_MIN_SLABS ((1<<20) >> IO_TLB_SHIFT)
 
-enum swiotlb_force swiotlb_force;
-
-/*
- * Used to do a quick range check in swiotlb_tbl_unmap_single and
- * swiotlb_tbl_sync_single_*, to see if the memory was in fact allocated by this
- * API.
- */
-phys_addr_t io_tlb_start, io_tlb_end;
-
-/*
- * The number of IO TLB blocks (in groups of 64) between io_tlb_start and
- * io_tlb_end.  This is command line adjustable via setup_io_tlb_npages.
- */
-static unsigned long io_tlb_nslabs;
+#define INVALID_PHYS_ADDR (~(phys_addr_t)0)
 
-/*
- * The number of used IO TLB block
- */
-static unsigned long io_tlb_used;
+enum swiotlb_force swiotlb_force;
 
-/*
- * This is a free list describing the number of free entries available from
- * each index
- */
-static unsigned int *io_tlb_list;
-static unsigned int io_tlb_index;
+struct io_tlb_mem io_tlb_default_mem;
 
 /*
  * Max segment that we can provide which (if pages are contingous) will
@@ -92,32 +71,15 @@ static unsigned int io_tlb_index;
  */
 static unsigned int max_segment;
 
-/*
- * We need to save away the original address corresponding to a mapped entry
- * for the sync operations.
- */
-#define INVALID_PHYS_ADDR (~(phys_addr_t)0)
-static phys_addr_t *io_tlb_orig_addr;
-
-/*
- * The mapped buffer's size should be validated during a sync operation.
- */
-static size_t *io_tlb_alloc_size;
-
-/*
- * Protect the above data structures in the map and unmap calls
- */
-static DEFINE_SPINLOCK(io_tlb_lock);
-
-static int late_alloc;
-
 static int __init
 setup_io_tlb_npages(char *str)
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
+
 	if (isdigit(*str)) {
-		io_tlb_nslabs = simple_strtoul(str, &str, 0);
+		mem->nslabs = simple_strtoul(str, &str, 0);
 		/* avoid tail segment of size < IO_TLB_SEGSIZE */
-		io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
+		mem->nslabs = ALIGN(mem->nslabs, IO_TLB_SEGSIZE);
 	}
 	if (*str == ',')
 		++str;
@@ -125,7 +87,7 @@ setup_io_tlb_npages(char *str)
 		swiotlb_force = SWIOTLB_FORCE;
 	} else if (!strcmp(str, "noforce")) {
 		swiotlb_force = SWIOTLB_NO_FORCE;
-		io_tlb_nslabs = 1;
+		mem->nslabs = 1;
 	}
 
 	return 0;
@@ -136,7 +98,7 @@ static bool no_iotlb_memory;
 
 unsigned long swiotlb_nr_tbl(void)
 {
-	return unlikely(no_iotlb_memory) ? 0 : io_tlb_nslabs;
+	return unlikely(no_iotlb_memory) ? 0 : io_tlb_default_mem.nslabs;
 }
 EXPORT_SYMBOL_GPL(swiotlb_nr_tbl);
 
@@ -158,13 +120,14 @@ unsigned long swiotlb_size_or_default(void)
 {
 	unsigned long size;
 
-	size = io_tlb_nslabs << IO_TLB_SHIFT;
+	size = io_tlb_default_mem.nslabs << IO_TLB_SHIFT;
 
 	return size ? size : (IO_TLB_DEFAULT_SIZE);
 }
 
 void __init swiotlb_adjust_size(unsigned long new_size)
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long size;
 
 	/*
@@ -172,10 +135,10 @@ void __init swiotlb_adjust_size(unsigned long new_size)
 	 * architectures such as those supporting memory encryption to
 	 * adjust/expand SWIOTLB size for their use.
 	 */
-	if (!io_tlb_nslabs) {
+	if (!mem->nslabs) {
 		size = ALIGN(new_size, IO_TLB_SIZE);
-		io_tlb_nslabs = size >> IO_TLB_SHIFT;
-		io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
+		mem->nslabs = size >> IO_TLB_SHIFT;
+		mem->nslabs = ALIGN(mem->nslabs, IO_TLB_SEGSIZE);
 
 		pr_info("SWIOTLB bounce buffer size adjusted to %luMB", size >> 20);
 	}
@@ -183,14 +146,15 @@ void __init swiotlb_adjust_size(unsigned long new_size)
 
 void swiotlb_print_info(void)
 {
-	unsigned long bytes = io_tlb_nslabs << IO_TLB_SHIFT;
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	unsigned long bytes = mem->nslabs << IO_TLB_SHIFT;
 
 	if (no_iotlb_memory) {
 		pr_warn("No low mem\n");
 		return;
 	}
 
-	pr_info("mapped [mem %pa-%pa] (%luMB)\n", &io_tlb_start, &io_tlb_end,
+	pr_info("mapped [mem %pa-%pa] (%luMB)\n", &mem->start, &mem->end,
 	       bytes >> 20);
 }
 
@@ -212,68 +176,65 @@ static inline unsigned long nr_slots(u64 val)
  */
 void __init swiotlb_update_mem_attributes(void)
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	void *vaddr;
 	unsigned long bytes;
 
-	if (no_iotlb_memory || late_alloc)
+	if (no_iotlb_memory || mem->late_alloc)
 		return;
 
-	vaddr = phys_to_virt(io_tlb_start);
-	bytes = PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT);
+	vaddr = phys_to_virt(mem->start);
+	bytes = PAGE_ALIGN(mem->nslabs << IO_TLB_SHIFT);
 	set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT);
 	memset(vaddr, 0, bytes);
 }
 
 int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long i, bytes;
 	size_t alloc_size;
 
 	/* protect against double initialization */
-	if (WARN_ON_ONCE(io_tlb_start))
+	if (WARN_ON_ONCE(mem->start))
 		return -ENOMEM;
 
 	bytes = nslabs << IO_TLB_SHIFT;
 
-	io_tlb_nslabs = nslabs;
-	io_tlb_start = __pa(tlb);
-	io_tlb_end = io_tlb_start + bytes;
+	mem->nslabs = nslabs;
+	mem->start = __pa(tlb);
+	mem->end = mem->start + bytes;
+	mem->index = 0;
+	spin_lock_init(&mem->lock);
 
 	/*
 	 * Allocate and initialize the free list array.  This array is used
 	 * to find contiguous free memory regions of size up to IO_TLB_SEGSIZE
-	 * between io_tlb_start and io_tlb_end.
+	 * between mem->start and mem->end.
 	 */
-	alloc_size = PAGE_ALIGN(io_tlb_nslabs * sizeof(int));
-	io_tlb_list = memblock_alloc(alloc_size, PAGE_SIZE);
-	if (!io_tlb_list)
+	alloc_size = PAGE_ALIGN(mem->nslabs * sizeof(int));
+	mem->list = memblock_alloc(alloc_size, PAGE_SIZE);
+	if (!mem->list)
 		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
 		      __func__, alloc_size, PAGE_SIZE);
 
-	alloc_size = PAGE_ALIGN(io_tlb_nslabs * sizeof(phys_addr_t));
-	io_tlb_orig_addr = memblock_alloc(alloc_size, PAGE_SIZE);
-	if (!io_tlb_orig_addr)
+	alloc_size = PAGE_ALIGN(mem->nslabs * sizeof(phys_addr_t));
+	mem->orig_addr = memblock_alloc(alloc_size, PAGE_SIZE);
+	if (!mem->orig_addr)
 		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
 		      __func__, alloc_size, PAGE_SIZE);
 
-	alloc_size = PAGE_ALIGN(io_tlb_nslabs * sizeof(size_t));
-	io_tlb_alloc_size = memblock_alloc(alloc_size, PAGE_SIZE);
-	if (!io_tlb_alloc_size)
-		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
-		      __func__, alloc_size, PAGE_SIZE);
-
-	for (i = 0; i < io_tlb_nslabs; i++) {
-		io_tlb_list[i] = IO_TLB_SEGSIZE - io_tlb_offset(i);
-		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
-		io_tlb_alloc_size[i] = 0;
+	for (i = 0; i < mem->nslabs; i++) {
+		mem->list[i] = IO_TLB_SEGSIZE - io_tlb_offset(i);
+		mem->orig_addr[i] = INVALID_PHYS_ADDR;
+		mem->alloc_size[i] = 0;
 	}
-	io_tlb_index = 0;
 	no_iotlb_memory = false;
 
 	if (verbose)
 		swiotlb_print_info();
 
-	swiotlb_set_max_segment(io_tlb_nslabs << IO_TLB_SHIFT);
+	swiotlb_set_max_segment(mem->nslabs << IO_TLB_SHIFT);
 	return 0;
 }
 
@@ -284,26 +245,27 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 void  __init
 swiotlb_init(int verbose)
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	size_t default_size = IO_TLB_DEFAULT_SIZE;
 	unsigned char *vstart;
 	unsigned long bytes;
 
-	if (!io_tlb_nslabs) {
-		io_tlb_nslabs = (default_size >> IO_TLB_SHIFT);
-		io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
+	if (!mem->nslabs) {
+		mem->nslabs = (default_size >> IO_TLB_SHIFT);
+		mem->nslabs = ALIGN(mem->nslabs, IO_TLB_SEGSIZE);
 	}
 
-	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
+	bytes = mem->nslabs << IO_TLB_SHIFT;
 
 	/* Get IO TLB memory from the low pages */
 	vstart = memblock_alloc_low(PAGE_ALIGN(bytes), PAGE_SIZE);
-	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, verbose))
+	if (vstart && !swiotlb_init_with_tbl(vstart, mem->nslabs, verbose))
 		return;
 
-	if (io_tlb_start) {
-		memblock_free_early(io_tlb_start,
-				    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
-		io_tlb_start = 0;
+	if (mem->start) {
+		memblock_free_early(mem->start,
+				    PAGE_ALIGN(mem->nslabs << IO_TLB_SHIFT));
+		mem->start = 0;
 	}
 	pr_warn("Cannot allocate buffer");
 	no_iotlb_memory = true;
@@ -317,22 +279,23 @@ swiotlb_init(int verbose)
 int
 swiotlb_late_init_with_default_size(size_t default_size)
 {
-	unsigned long bytes, req_nslabs = io_tlb_nslabs;
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	unsigned long bytes, req_nslabs = mem->nslabs;
 	unsigned char *vstart = NULL;
 	unsigned int order;
 	int rc = 0;
 
-	if (!io_tlb_nslabs) {
-		io_tlb_nslabs = (default_size >> IO_TLB_SHIFT);
-		io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
+	if (!mem->nslabs) {
+		mem->nslabs = (default_size >> IO_TLB_SHIFT);
+		mem->nslabs = ALIGN(mem->nslabs, IO_TLB_SEGSIZE);
 	}
 
 	/*
 	 * Get IO TLB memory from the low pages
 	 */
-	order = get_order(io_tlb_nslabs << IO_TLB_SHIFT);
-	io_tlb_nslabs = SLABS_PER_PAGE << order;
-	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
+	order = get_order(mem->nslabs << IO_TLB_SHIFT);
+	mem->nslabs = SLABS_PER_PAGE << order;
+	bytes = mem->nslabs << IO_TLB_SHIFT;
 
 	while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
 		vstart = (void *)__get_free_pages(GFP_DMA | __GFP_NOWARN,
@@ -343,15 +306,15 @@ swiotlb_late_init_with_default_size(size_t default_size)
 	}
 
 	if (!vstart) {
-		io_tlb_nslabs = req_nslabs;
+		mem->nslabs = req_nslabs;
 		return -ENOMEM;
 	}
 	if (order != get_order(bytes)) {
 		pr_warn("only able to allocate %ld MB\n",
 			(PAGE_SIZE << order) >> 20);
-		io_tlb_nslabs = SLABS_PER_PAGE << order;
+		mem->nslabs = SLABS_PER_PAGE << order;
 	}
-	rc = swiotlb_late_init_with_tbl(vstart, io_tlb_nslabs);
+	rc = swiotlb_late_init_with_tbl(vstart, mem->nslabs);
 	if (rc)
 		free_pages((unsigned long)vstart, order);
 
@@ -360,26 +323,32 @@ swiotlb_late_init_with_default_size(size_t default_size)
 
 static void swiotlb_cleanup(void)
 {
-	io_tlb_end = 0;
-	io_tlb_start = 0;
-	io_tlb_nslabs = 0;
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
+
+	mem->end = 0;
+	mem->start = 0;
+	mem->nslabs = 0;
 	max_segment = 0;
 }
 
 int
 swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long i, bytes;
 
 	/* protect against double initialization */
-	if (WARN_ON_ONCE(io_tlb_start))
+	if (WARN_ON_ONCE(mem->start))
 		return -ENOMEM;
 
 	bytes = nslabs << IO_TLB_SHIFT;
 
-	io_tlb_nslabs = nslabs;
-	io_tlb_start = virt_to_phys(tlb);
-	io_tlb_end = io_tlb_start + bytes;
+	mem->nslabs = nslabs;
+	mem->start = virt_to_phys(tlb);
+	mem->end = mem->start + bytes;
+	mem->index = 0;
+	mem->late_alloc = 1;
+	spin_lock_init(&mem->lock);
 
 	set_memory_decrypted((unsigned long)tlb, bytes >> PAGE_SHIFT);
 	memset(tlb, 0, bytes);
@@ -387,52 +356,45 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 	/*
 	 * Allocate and initialize the free list array.  This array is used
 	 * to find contiguous free memory regions of size up to IO_TLB_SEGSIZE
-	 * between io_tlb_start and io_tlb_end.
+	 * between mem->start and mem->end.
 	 */
-	io_tlb_list = (unsigned int *)__get_free_pages(GFP_KERNEL,
-				      get_order(io_tlb_nslabs * sizeof(int)));
-	if (!io_tlb_list)
+	mem->list = (unsigned int *)__get_free_pages(GFP_KERNEL,
+	                              get_order(mem->nslabs * sizeof(int)));
+	if (!mem->list)
 		goto cleanup3;
 
-	io_tlb_orig_addr = (phys_addr_t *)
+	mem->orig_addr = (phys_addr_t *)
 		__get_free_pages(GFP_KERNEL,
-				 get_order(io_tlb_nslabs *
+				 get_order(mem->nslabs *
 					   sizeof(phys_addr_t)));
-	if (!io_tlb_orig_addr)
+	if (!mem->orig_addr)
 		goto cleanup4;
 
-	io_tlb_alloc_size = (size_t *)
+	mem->alloc_size = (size_t *)
 		__get_free_pages(GFP_KERNEL,
-				 get_order(io_tlb_nslabs *
+				 get_order(mem->nslabs *
 					   sizeof(size_t)));
-	if (!io_tlb_alloc_size)
+	if (!mem->alloc_size)
 		goto cleanup5;
 
-
-	for (i = 0; i < io_tlb_nslabs; i++) {
-		io_tlb_list[i] = IO_TLB_SEGSIZE - io_tlb_offset(i);
-		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
-		io_tlb_alloc_size[i] = 0;
+	for (i = 0; i < mem->nslabs; i++) {
+		mem->list[i] = IO_TLB_SEGSIZE - io_tlb_offset(i);
+		mem->orig_addr[i] = INVALID_PHYS_ADDR;
+		mem->alloc_size[i] = 0;
 	}
-	io_tlb_index = 0;
 	no_iotlb_memory = false;
 
 	swiotlb_print_info();
-
-	late_alloc = 1;
-
-	swiotlb_set_max_segment(io_tlb_nslabs << IO_TLB_SHIFT);
-
+	swiotlb_set_max_segment(mem->nslabs << IO_TLB_SHIFT);
 	return 0;
 
 cleanup5:
-	free_pages((unsigned long)io_tlb_orig_addr, get_order(io_tlb_nslabs *
-							      sizeof(phys_addr_t)));
-
+	free_pages((unsigned long)mem->orig_addr,
+		   get_order(mem->nslabs * sizeof(phys_addr_t)));
 cleanup4:
-	free_pages((unsigned long)io_tlb_list, get_order(io_tlb_nslabs *
-	                                                 sizeof(int)));
-	io_tlb_list = NULL;
+	free_pages((unsigned long)mem->list,
+		   get_order(mem->nslabs * sizeof(int)));
+	mem->list = NULL;
 cleanup3:
 	swiotlb_cleanup();
 	return -ENOMEM;
@@ -440,27 +402,29 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 
 void __init swiotlb_exit(void)
 {
-	if (!io_tlb_orig_addr)
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
+
+	if (!mem->orig_addr)
 		return;
 
-	if (late_alloc) {
-		free_pages((unsigned long)io_tlb_alloc_size,
-			   get_order(io_tlb_nslabs * sizeof(size_t)));
-		free_pages((unsigned long)io_tlb_orig_addr,
-			   get_order(io_tlb_nslabs * sizeof(phys_addr_t)));
-		free_pages((unsigned long)io_tlb_list, get_order(io_tlb_nslabs *
-								 sizeof(int)));
-		free_pages((unsigned long)phys_to_virt(io_tlb_start),
-			   get_order(io_tlb_nslabs << IO_TLB_SHIFT));
+	if (mem->late_alloc) {
+		free_pages((unsigned long)mem->alloc_size,
+			   get_order(mem->nslabs * sizeof(size_t)));
+		free_pages((unsigned long)mem->orig_addr,
+			   get_order(mem->nslabs * sizeof(phys_addr_t)));
+		free_pages((unsigned long)mem->list,
+			   get_order(mem->nslabs * sizeof(int)));
+		free_pages((unsigned long)phys_to_virt(mem->start),
+			   get_order(mem->nslabs << IO_TLB_SHIFT));
 	} else {
-		memblock_free_late(__pa(io_tlb_orig_addr),
-				   PAGE_ALIGN(io_tlb_nslabs * sizeof(phys_addr_t)));
-		memblock_free_late(__pa(io_tlb_alloc_size),
-				   PAGE_ALIGN(io_tlb_nslabs * sizeof(size_t)));
-		memblock_free_late(__pa(io_tlb_list),
-				   PAGE_ALIGN(io_tlb_nslabs * sizeof(int)));
-		memblock_free_late(io_tlb_start,
-				   PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
+		memblock_free_late(__pa(mem->alloc_size),
+				   PAGE_ALIGN(mem->nslabs * sizeof(size_t)));
+		memblock_free_late(__pa(mem->orig_addr),
+				   PAGE_ALIGN(mem->nslabs * sizeof(phys_addr_t)));
+		memblock_free_late(__pa(mem->list),
+				   PAGE_ALIGN(mem->nslabs * sizeof(int)));
+		memblock_free_late(mem->start,
+				   PAGE_ALIGN(mem->nslabs << IO_TLB_SHIFT));
 	}
 	swiotlb_cleanup();
 }
@@ -471,9 +435,10 @@ void __init swiotlb_exit(void)
 static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size,
 		enum dma_data_direction dir)
 {
-	int index = (tlb_addr - io_tlb_start) >> IO_TLB_SHIFT;
-	size_t alloc_size = io_tlb_alloc_size[index];
-	phys_addr_t orig_addr = io_tlb_orig_addr[index];
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	int index = (tlb_addr - mem->start) >> IO_TLB_SHIFT;
+	phys_addr_t orig_addr = mem->orig_addr[index];
+	size_t alloc_size = mem->alloc_size[index];
 	unsigned long pfn = PFN_DOWN(orig_addr);
 	unsigned char *vaddr = phys_to_virt(tlb_addr);
 
@@ -538,9 +503,9 @@ static inline unsigned long get_max_slots(unsigned long boundary_mask)
 	return nr_slots(boundary_mask + 1);
 }
 
-static unsigned int wrap_index(unsigned int index)
+static unsigned int wrap_index(struct io_tlb_mem *mem, unsigned int index)
 {
-	if (index >= io_tlb_nslabs)
+	if (index >= mem->nslabs)
 		return 0;
 	return index;
 }
@@ -552,9 +517,10 @@ static unsigned int wrap_index(unsigned int index)
 static int find_slots(struct device *dev, phys_addr_t orig_addr,
 		size_t alloc_size)
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long boundary_mask = dma_get_seg_boundary(dev);
 	dma_addr_t tbl_dma_addr =
-		phys_to_dma_unencrypted(dev, io_tlb_start) & boundary_mask;
+		phys_to_dma_unencrypted(dev, mem->start) & boundary_mask;
 	unsigned long max_slots = get_max_slots(boundary_mask);
 	unsigned int iotlb_align_mask =
 		dma_get_min_align_mask(dev) & ~(IO_TLB_SIZE - 1);
@@ -573,15 +539,15 @@ static int find_slots(struct device *dev, phys_addr_t orig_addr,
 	if (alloc_size >= PAGE_SIZE)
 		stride = max(stride, stride << (PAGE_SHIFT - IO_TLB_SHIFT));
 
-	spin_lock_irqsave(&io_tlb_lock, flags);
-	if (unlikely(nslots > io_tlb_nslabs - io_tlb_used))
+	spin_lock_irqsave(&mem->lock, flags);
+	if (unlikely(nslots > mem->nslabs - mem->used))
 		goto not_found;
 
-	index = wrap = wrap_index(ALIGN(io_tlb_index, stride));
+	index = wrap = wrap_index(mem, ALIGN(mem->index, stride));
 	do {
 		if ((slot_addr(tbl_dma_addr, index) & iotlb_align_mask) !=
 		    (orig_addr & iotlb_align_mask)) {
-			index = wrap_index(index + 1);
+			index = wrap_index(mem, index + 1);
 			continue;
 		}
 
@@ -593,34 +559,34 @@ static int find_slots(struct device *dev, phys_addr_t orig_addr,
 		if (!iommu_is_span_boundary(index, nslots,
 					    nr_slots(tbl_dma_addr),
 					    max_slots)) {
-			if (io_tlb_list[index] >= nslots)
+			if (mem->list[index] >= nslots)
 				goto found;
 		}
-		index = wrap_index(index + stride);
+		index = wrap_index(mem, index + stride);
 	} while (index != wrap);
 
 not_found:
-	spin_unlock_irqrestore(&io_tlb_lock, flags);
+	spin_unlock_irqrestore(&mem->lock, flags);
 	return -1;
 
 found:
 	for (i = index; i < index + nslots; i++)
-		io_tlb_list[i] = 0;
+		mem->list[i] = 0;
 	for (i = index - 1;
 	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 &&
-	     io_tlb_list[i]; i--)
-		io_tlb_list[i] = ++count;
+	     mem->list[i]; i--)
+		mem->list[i] = ++count;
 
 	/*
 	 * Update the indices to avoid searching in the next round.
 	 */
-	if (index + nslots < io_tlb_nslabs)
-		io_tlb_index = index + nslots;
+	if (index + nslots < mem->nslabs)
+		mem->index = index + nslots;
 	else
-		io_tlb_index = 0;
-	io_tlb_used += nslots;
+		mem->index = 0;
+	mem->used += nslots;
 
-	spin_unlock_irqrestore(&io_tlb_lock, flags);
+	spin_unlock_irqrestore(&mem->lock, flags);
 	return index;
 }
 
@@ -628,6 +594,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 		size_t mapping_size, size_t alloc_size,
 		enum dma_data_direction dir, unsigned long attrs)
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned int offset = swiotlb_align_offset(dev, orig_addr);
 	unsigned int index, i;
 	phys_addr_t tlb_addr;
@@ -649,7 +616,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 		if (!(attrs & DMA_ATTR_NO_WARN))
 			dev_warn_ratelimited(dev,
 	"swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (slots)\n",
-				 alloc_size, io_tlb_nslabs, io_tlb_used);
+				 alloc_size, mem->nslabs, mem->used);
 		return (phys_addr_t)DMA_MAPPING_ERROR;
 	}
 
@@ -659,10 +626,10 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 	 * needed.
 	 */
 	for (i = 0; i < nr_slots(alloc_size + offset); i++) {
-		io_tlb_orig_addr[index + i] = slot_addr(orig_addr, i);
-		io_tlb_alloc_size[index+i] = alloc_size - (i << IO_TLB_SHIFT);
+		mem->orig_addr[index + i] = slot_addr(orig_addr, i);
+		mem->alloc_size[index + i] = alloc_size - (i << IO_TLB_SHIFT);
 	}
-	tlb_addr = slot_addr(io_tlb_start, index) + offset;
+	tlb_addr = slot_addr(mem->start, index) + offset;
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL))
 		swiotlb_bounce(dev, tlb_addr, mapping_size, DMA_TO_DEVICE);
@@ -676,10 +643,11 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 			      size_t mapping_size, enum dma_data_direction dir,
 			      unsigned long attrs)
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long flags;
 	unsigned int offset = swiotlb_align_offset(hwdev, tlb_addr);
-	int index = (tlb_addr - offset - io_tlb_start) >> IO_TLB_SHIFT;
-	int nslots = nr_slots(io_tlb_alloc_size[index] + offset);
+	int index = (tlb_addr - offset - mem->start) >> IO_TLB_SHIFT;
+	int nslots = nr_slots(mem->alloc_size[index] + offset);
 	int count, i;
 
 	/*
@@ -695,9 +663,9 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 	 * While returning the entries to the free list, we merge the entries
 	 * with slots below and above the pool being returned.
 	 */
-	spin_lock_irqsave(&io_tlb_lock, flags);
+	spin_lock_irqsave(&mem->lock, flags);
 	if (index + nslots < ALIGN(index + 1, IO_TLB_SEGSIZE))
-		count = io_tlb_list[index + nslots];
+		count = mem->list[index + nslots];
 	else
 		count = 0;
 
@@ -706,9 +674,9 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 	 * superceeding slots
 	 */
 	for (i = index + nslots - 1; i >= index; i--) {
-		io_tlb_list[i] = ++count;
-		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
-		io_tlb_alloc_size[i] = 0;
+		mem->list[i] = ++count;
+		mem->orig_addr[i] = INVALID_PHYS_ADDR;
+		mem->alloc_size[i] = 0;
 	}
 
 	/*
@@ -716,11 +684,11 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 	 * available (non zero)
 	 */
 	for (i = index - 1;
-	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 && io_tlb_list[i];
+	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 && mem->list[i];
 	     i--)
-		io_tlb_list[i] = ++count;
-	io_tlb_used -= nslots;
-	spin_unlock_irqrestore(&io_tlb_lock, flags);
+		mem->list[i] = ++count;
+	mem->used -= nslots;
+	spin_unlock_irqrestore(&mem->lock, flags);
 }
 
 void swiotlb_sync_single_for_device(struct device *dev, phys_addr_t tlb_addr,
@@ -783,21 +751,21 @@ size_t swiotlb_max_mapping_size(struct device *dev)
 bool is_swiotlb_active(void)
 {
 	/*
-	 * When SWIOTLB is initialized, even if io_tlb_start points to physical
-	 * address zero, io_tlb_end surely doesn't.
+	 * When SWIOTLB is initialized, even if mem->start points to physical
+	 * address zero, mem->end surely doesn't.
 	 */
-	return io_tlb_end != 0;
+	return io_tlb_default_mem.end != 0;
 }
 
 #ifdef CONFIG_DEBUG_FS
 
 static int __init swiotlb_create_debugfs(void)
 {
-	struct dentry *root;
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 
-	root = debugfs_create_dir("swiotlb", NULL);
-	debugfs_create_ulong("io_tlb_nslabs", 0400, root, &io_tlb_nslabs);
-	debugfs_create_ulong("io_tlb_used", 0400, root, &io_tlb_used);
+	mem->debugfs = debugfs_create_dir("swiotlb", NULL);
+	debugfs_create_ulong("io_tlb_nslabs", 0400, mem->debugfs, &mem->nslabs);
+	debugfs_create_ulong("io_tlb_used", 0400, mem->debugfs, &mem->used);
 	return 0;
 }
 
-- 
2.29.2

