Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8AB327894
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 08:51:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dpsrv32FVz3dF1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 18:51:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=duV9FY07;
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
 header.s=casper.20170209 header.b=duV9FY07; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dpsls42Tlz3cRD
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Mar 2021 18:46:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=IRx+Pi1pD2z501lxg6zw7GkdxsvxCqbOuoP9Ueee5qA=; b=duV9FY07kMgTOlwKmQNCqAWEUf
 HjMyR8HaEfGmccKEKenMvn/1dBX50Ok55KK5MtUOkSpqafeHtQNadPiMrKGb3QbBwegZbFGao8obV
 mY5aLxa4tn+8dC3UpfhNc7lQs2fv48Mp3fvXx+Qa3Vqk8W4a51I32NP0SxrbjdhsyOZb2HlKshJSQ
 CAe/Ix/J5ywCjLm/dpsBpRfxR+7jf6rLLA7/mey+AAV1WC0Y/jSVRYwHrtBDRp1rTsPZDqweuy4xd
 Kt7hacQU3L56juNbddmIoZa0LvXOBR+1MjpQVBgh4IuuzLlpBcV+l3J3wTJGR26wUi2xv3tNdm3xB
 wvRgJZpw==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGdG9-00FRGI-DD; Mon, 01 Mar 2021 07:46:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 13/14] swiotlb: dynamically allocate io_tlb_default_mem
Date: Mon,  1 Mar 2021 08:44:35 +0100
Message-Id: <20210301074436.919889-14-hch@lst.de>
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

Instead of allocating ->list and ->orig_addr separately just do one
dynamic allocation for the actual io_tlb_mem structure.  This simplifies
a lot of the initialization code, and also allows to just check
io_tlb_default_mem to see if swiotlb is in use.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/xen/swiotlb-xen.c |  22 +--
 include/linux/swiotlb.h   |  18 ++-
 kernel/dma/swiotlb.c      | 300 +++++++++++++-------------------------
 3 files changed, 117 insertions(+), 223 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 5329ad54a5f34e..4c89afc0df6289 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -158,17 +158,14 @@ static const char *xen_swiotlb_error(enum xen_swiotlb_err err)
 int __ref xen_swiotlb_init(void)
 {
 	enum xen_swiotlb_err m_ret = XEN_SWIOTLB_UNKNOWN;
-	unsigned long nslabs, bytes, order;
-	unsigned int repeat = 3;
+	unsigned long bytes = swiotlb_size_or_default();
+	unsigned long nslabs = bytes >> IO_TLB_SHIFT;
+	unsigned int order, repeat = 3;
 	int rc = -ENOMEM;
 	char *start;
 
-	nslabs = swiotlb_nr_tbl();
-	if (!nslabs)
-		nslabs = DEFAULT_NSLABS;
 retry:
 	m_ret = XEN_SWIOTLB_ENOMEM;
-	bytes = nslabs << IO_TLB_SHIFT;
 	order = get_order(bytes);
 
 	/*
@@ -221,19 +218,16 @@ int __ref xen_swiotlb_init(void)
 #ifdef CONFIG_X86
 void __init xen_swiotlb_init_early(void)
 {
-	unsigned long nslabs, bytes;
+	unsigned long bytes = swiotlb_size_or_default();
+	unsigned long nslabs = bytes >> IO_TLB_SHIFT;
 	unsigned int repeat = 3;
 	char *start;
 	int rc;
 
-	nslabs = swiotlb_nr_tbl();
-	if (!nslabs)
-		nslabs = DEFAULT_NSLABS;
 retry:
 	/*
 	 * Get IO TLB memory from any location.
 	 */
-	bytes = nslabs << IO_TLB_SHIFT;
 	start = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
 	if (!start)
 		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
@@ -248,8 +242,8 @@ void __init xen_swiotlb_init_early(void)
 		if (repeat--) {
 			/* Min is 2MB */
 			nslabs = max(1024UL, (nslabs >> 1));
-			pr_info("Lowering to %luMB\n",
-				(nslabs << IO_TLB_SHIFT) >> 20);
+			bytes = nslabs << IO_TLB_SHIFT;
+			pr_info("Lowering to %luMB\n", bytes >> 20);
 			goto retry;
 		}
 		panic("%s (rc:%d)", xen_swiotlb_error(XEN_SWIOTLB_EFIXUP), rc);
@@ -548,7 +542,7 @@ xen_swiotlb_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
 static int
 xen_swiotlb_dma_supported(struct device *hwdev, u64 mask)
 {
-	return xen_phys_to_dma(hwdev, io_tlb_default_mem.end - 1) <= mask;
+	return xen_phys_to_dma(hwdev, io_tlb_default_mem->end - 1) <= mask;
 }
 
 const struct dma_map_ops xen_swiotlb_dma_ops = {
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 5ec5378b17c333..63f7a63f61d098 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -90,28 +90,30 @@ struct io_tlb_mem {
 	phys_addr_t end;
 	unsigned long nslabs;
 	unsigned long used;
-	unsigned int *list;
 	unsigned int index;
-	phys_addr_t *orig_addr;
-	size_t *alloc_size;
 	spinlock_t lock;
 	struct dentry *debugfs;
 	bool late_alloc;
+	struct io_tlb_slot {
+		phys_addr_t orig_addr;
+		size_t alloc_size;
+		unsigned int list;
+	} slots[];
 };
-extern struct io_tlb_mem io_tlb_default_mem;
+extern struct io_tlb_mem *io_tlb_default_mem;
 
 static inline bool is_swiotlb_buffer(phys_addr_t paddr)
 {
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	struct io_tlb_mem *mem = io_tlb_default_mem;
 
-	return paddr >= mem->start && paddr < mem->end;
+	return mem && paddr >= mem->start && paddr < mem->end;
 }
 
 void __init swiotlb_exit(void);
 unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
 bool is_swiotlb_active(void);
-void __init swiotlb_adjust_size(unsigned long new_size);
+void __init swiotlb_adjust_size(unsigned long size);
 #else
 #define swiotlb_force SWIOTLB_NO_FORCE
 static inline bool is_swiotlb_buffer(phys_addr_t paddr)
@@ -135,7 +137,7 @@ static inline bool is_swiotlb_active(void)
 	return false;
 }
 
-static inline void swiotlb_adjust_size(unsigned long new_size)
+static inline void swiotlb_adjust_size(unsigned long size)
 {
 }
 #endif /* CONFIG_SWIOTLB */
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 6aa84fa3b1467e..b7bcd7b804bfe8 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -63,7 +63,7 @@
 
 enum swiotlb_force swiotlb_force;
 
-struct io_tlb_mem io_tlb_default_mem;
+struct io_tlb_mem *io_tlb_default_mem;
 
 /*
  * Max segment that we can provide which (if pages are contingous) will
@@ -71,15 +71,15 @@ struct io_tlb_mem io_tlb_default_mem;
  */
 static unsigned int max_segment;
 
+static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
+
 static int __init
 setup_io_tlb_npages(char *str)
 {
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
-
 	if (isdigit(*str)) {
-		mem->nslabs = simple_strtoul(str, &str, 0);
 		/* avoid tail segment of size < IO_TLB_SEGSIZE */
-		mem->nslabs = ALIGN(mem->nslabs, IO_TLB_SEGSIZE);
+		default_nslabs =
+			ALIGN(simple_strtoul(str, &str, 0), IO_TLB_SEGSIZE);
 	}
 	if (*str == ',')
 		++str;
@@ -87,24 +87,22 @@ setup_io_tlb_npages(char *str)
 		swiotlb_force = SWIOTLB_FORCE;
 	} else if (!strcmp(str, "noforce")) {
 		swiotlb_force = SWIOTLB_NO_FORCE;
-		mem->nslabs = 1;
+		default_nslabs = 1;
 	}
 
 	return 0;
 }
 early_param("swiotlb", setup_io_tlb_npages);
 
-static bool no_iotlb_memory;
-
 unsigned long swiotlb_nr_tbl(void)
 {
-	return unlikely(no_iotlb_memory) ? 0 : io_tlb_default_mem.nslabs;
+	return io_tlb_default_mem ? io_tlb_default_mem->nslabs : 0;
 }
 EXPORT_SYMBOL_GPL(swiotlb_nr_tbl);
 
 unsigned int swiotlb_max_segment(void)
 {
-	return unlikely(no_iotlb_memory) ? 0 : max_segment;
+	return io_tlb_default_mem ? max_segment : 0;
 }
 EXPORT_SYMBOL_GPL(swiotlb_max_segment);
 
@@ -118,44 +116,32 @@ void swiotlb_set_max_segment(unsigned int val)
 
 unsigned long swiotlb_size_or_default(void)
 {
-	unsigned long size;
-
-	size = io_tlb_default_mem.nslabs << IO_TLB_SHIFT;
-
-	return size ? size : (IO_TLB_DEFAULT_SIZE);
+	return default_nslabs << IO_TLB_SHIFT;
 }
 
-void __init swiotlb_adjust_size(unsigned long new_size)
+void __init swiotlb_adjust_size(unsigned long size)
 {
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
-	unsigned long size;
-
 	/*
 	 * If swiotlb parameter has not been specified, give a chance to
 	 * architectures such as those supporting memory encryption to
 	 * adjust/expand SWIOTLB size for their use.
 	 */
-	if (!mem->nslabs) {
-		size = ALIGN(new_size, IO_TLB_SIZE);
-		mem->nslabs = size >> IO_TLB_SHIFT;
-		mem->nslabs = ALIGN(mem->nslabs, IO_TLB_SEGSIZE);
-
-		pr_info("SWIOTLB bounce buffer size adjusted to %luMB", size >> 20);
-	}
+	size = ALIGN(size, IO_TLB_SIZE);
+	default_nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
+	pr_info("SWIOTLB bounce buffer size adjusted to %luMB", size >> 20);
 }
 
 void swiotlb_print_info(void)
 {
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
-	unsigned long bytes = mem->nslabs << IO_TLB_SHIFT;
+	struct io_tlb_mem *mem = io_tlb_default_mem;
 
-	if (no_iotlb_memory) {
+	if (!mem) {
 		pr_warn("No low mem\n");
 		return;
 	}
 
 	pr_info("mapped [mem %pa-%pa] (%luMB)\n", &mem->start, &mem->end,
-	       bytes >> 20);
+	       (mem->nslabs << IO_TLB_SHIFT) >> 20);
 }
 
 static inline unsigned long io_tlb_offset(unsigned long val)
@@ -176,13 +162,12 @@ static inline unsigned long nr_slots(u64 val)
  */
 void __init swiotlb_update_mem_attributes(void)
 {
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	struct io_tlb_mem *mem = io_tlb_default_mem;
 	void *vaddr;
 	unsigned long bytes;
 
-	if (no_iotlb_memory || mem->late_alloc)
+	if (!mem || mem->late_alloc)
 		return;
-
 	vaddr = phys_to_virt(mem->start);
 	bytes = PAGE_ALIGN(mem->nslabs << IO_TLB_SHIFT);
 	set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT);
@@ -191,49 +176,33 @@ void __init swiotlb_update_mem_attributes(void)
 
 int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 {
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
-	unsigned long i, bytes;
+	unsigned long bytes = nslabs << IO_TLB_SHIFT, i;
+	struct io_tlb_mem *mem;
 	size_t alloc_size;
 
 	/* protect against double initialization */
-	if (WARN_ON_ONCE(mem->start))
+	if (WARN_ON_ONCE(io_tlb_default_mem))
 		return -ENOMEM;
 
-	bytes = nslabs << IO_TLB_SHIFT;
-
+	alloc_size = PAGE_ALIGN(struct_size(mem, slots, nslabs));
+	mem = memblock_alloc(alloc_size, PAGE_SIZE);
+	if (!mem)
+		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
+		      __func__, alloc_size, PAGE_SIZE);
 	mem->nslabs = nslabs;
 	mem->start = __pa(tlb);
 	mem->end = mem->start + bytes;
 	mem->index = 0;
 	spin_lock_init(&mem->lock);
-
-	/*
-	 * Allocate and initialize the free list array.  This array is used
-	 * to find contiguous free memory regions of size up to IO_TLB_SEGSIZE
-	 * between mem->start and mem->end.
-	 */
-	alloc_size = PAGE_ALIGN(mem->nslabs * sizeof(int));
-	mem->list = memblock_alloc(alloc_size, PAGE_SIZE);
-	if (!mem->list)
-		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
-		      __func__, alloc_size, PAGE_SIZE);
-
-	alloc_size = PAGE_ALIGN(mem->nslabs * sizeof(phys_addr_t));
-	mem->orig_addr = memblock_alloc(alloc_size, PAGE_SIZE);
-	if (!mem->orig_addr)
-		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
-		      __func__, alloc_size, PAGE_SIZE);
-
 	for (i = 0; i < mem->nslabs; i++) {
-		mem->list[i] = IO_TLB_SEGSIZE - io_tlb_offset(i);
-		mem->orig_addr[i] = INVALID_PHYS_ADDR;
-		mem->alloc_size[i] = 0;
+		mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
+		mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
+		mem->slots[i].alloc_size = 0;
 	}
-	no_iotlb_memory = false;
 
+	io_tlb_default_mem = mem;
 	if (verbose)
 		swiotlb_print_info();
-
 	swiotlb_set_max_segment(mem->nslabs << IO_TLB_SHIFT);
 	return 0;
 }
@@ -245,30 +214,21 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 void  __init
 swiotlb_init(int verbose)
 {
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
-	size_t default_size = IO_TLB_DEFAULT_SIZE;
-	unsigned char *vstart;
-	unsigned long bytes;
-
-	if (!mem->nslabs) {
-		mem->nslabs = (default_size >> IO_TLB_SHIFT);
-		mem->nslabs = ALIGN(mem->nslabs, IO_TLB_SEGSIZE);
-	}
-
-	bytes = mem->nslabs << IO_TLB_SHIFT;
+	size_t bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
+	void *tlb;
 
 	/* Get IO TLB memory from the low pages */
-	vstart = memblock_alloc_low(PAGE_ALIGN(bytes), PAGE_SIZE);
-	if (vstart && !swiotlb_init_with_tbl(vstart, mem->nslabs, verbose))
-		return;
-
-	if (mem->start) {
-		memblock_free_early(mem->start,
-				    PAGE_ALIGN(mem->nslabs << IO_TLB_SHIFT));
-		mem->start = 0;
-	}
+	tlb = memblock_alloc_low(bytes, PAGE_SIZE);
+	if (!tlb)
+		goto fail;
+	if (swiotlb_init_with_tbl(tlb, default_nslabs, verbose))
+		goto fail_free_mem;
+	return;
+
+fail_free_mem:
+	memblock_free_early(__pa(tlb), bytes);
+fail:
 	pr_warn("Cannot allocate buffer");
-	no_iotlb_memory = true;
 }
 
 /*
@@ -279,23 +239,19 @@ swiotlb_init(int verbose)
 int
 swiotlb_late_init_with_default_size(size_t default_size)
 {
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
-	unsigned long bytes, req_nslabs = mem->nslabs;
+	unsigned long nslabs =
+		ALIGN(default_size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
+	unsigned long bytes;
 	unsigned char *vstart = NULL;
 	unsigned int order;
 	int rc = 0;
 
-	if (!mem->nslabs) {
-		mem->nslabs = (default_size >> IO_TLB_SHIFT);
-		mem->nslabs = ALIGN(mem->nslabs, IO_TLB_SEGSIZE);
-	}
-
 	/*
 	 * Get IO TLB memory from the low pages
 	 */
-	order = get_order(mem->nslabs << IO_TLB_SHIFT);
-	mem->nslabs = SLABS_PER_PAGE << order;
-	bytes = mem->nslabs << IO_TLB_SHIFT;
+	order = get_order(nslabs << IO_TLB_SHIFT);
+	nslabs = SLABS_PER_PAGE << order;
+	bytes = nslabs << IO_TLB_SHIFT;
 
 	while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
 		vstart = (void *)__get_free_pages(GFP_DMA | __GFP_NOWARN,
@@ -305,43 +261,35 @@ swiotlb_late_init_with_default_size(size_t default_size)
 		order--;
 	}
 
-	if (!vstart) {
-		mem->nslabs = req_nslabs;
+	if (!vstart)
 		return -ENOMEM;
-	}
+
 	if (order != get_order(bytes)) {
 		pr_warn("only able to allocate %ld MB\n",
 			(PAGE_SIZE << order) >> 20);
-		mem->nslabs = SLABS_PER_PAGE << order;
+		nslabs = SLABS_PER_PAGE << order;
 	}
-	rc = swiotlb_late_init_with_tbl(vstart, mem->nslabs);
+	rc = swiotlb_late_init_with_tbl(vstart, nslabs);
 	if (rc)
 		free_pages((unsigned long)vstart, order);
 
 	return rc;
 }
 
-static void swiotlb_cleanup(void)
-{
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
-
-	mem->end = 0;
-	mem->start = 0;
-	mem->nslabs = 0;
-	max_segment = 0;
-}
-
 int
 swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 {
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
-	unsigned long i, bytes;
+	unsigned long bytes = nslabs << IO_TLB_SHIFT, i;
+	struct io_tlb_mem *mem;
 
 	/* protect against double initialization */
-	if (WARN_ON_ONCE(mem->start))
+	if (WARN_ON_ONCE(io_tlb_default_mem))
 		return -ENOMEM;
 
-	bytes = nslabs << IO_TLB_SHIFT;
+	mem = (void *)__get_free_pages(GFP_KERNEL,
+		get_order(struct_size(mem, slots, nslabs)));
+	if (!mem)
+		return -ENOMEM;
 
 	mem->nslabs = nslabs;
 	mem->start = virt_to_phys(tlb);
@@ -349,84 +297,35 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 	mem->index = 0;
 	mem->late_alloc = 1;
 	spin_lock_init(&mem->lock);
+	for (i = 0; i < mem->nslabs; i++) {
+		mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
+		mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
+		mem->slots[i].alloc_size = 0;
+	}
 
 	set_memory_decrypted((unsigned long)tlb, bytes >> PAGE_SHIFT);
 	memset(tlb, 0, bytes);
 
-	/*
-	 * Allocate and initialize the free list array.  This array is used
-	 * to find contiguous free memory regions of size up to IO_TLB_SEGSIZE
-	 * between mem->start and mem->end.
-	 */
-	mem->list = (unsigned int *)__get_free_pages(GFP_KERNEL,
-	                              get_order(mem->nslabs * sizeof(int)));
-	if (!mem->list)
-		goto cleanup3;
-
-	mem->orig_addr = (phys_addr_t *)
-		__get_free_pages(GFP_KERNEL,
-				 get_order(mem->nslabs *
-					   sizeof(phys_addr_t)));
-	if (!mem->orig_addr)
-		goto cleanup4;
-
-	mem->alloc_size = (size_t *)
-		__get_free_pages(GFP_KERNEL,
-				 get_order(mem->nslabs *
-					   sizeof(size_t)));
-	if (!mem->alloc_size)
-		goto cleanup5;
-
-	for (i = 0; i < mem->nslabs; i++) {
-		mem->list[i] = IO_TLB_SEGSIZE - io_tlb_offset(i);
-		mem->orig_addr[i] = INVALID_PHYS_ADDR;
-		mem->alloc_size[i] = 0;
-	}
-	no_iotlb_memory = false;
-
+	io_tlb_default_mem = mem;
 	swiotlb_print_info();
 	swiotlb_set_max_segment(mem->nslabs << IO_TLB_SHIFT);
 	return 0;
-
-cleanup5:
-	free_pages((unsigned long)mem->orig_addr,
-		   get_order(mem->nslabs * sizeof(phys_addr_t)));
-cleanup4:
-	free_pages((unsigned long)mem->list,
-		   get_order(mem->nslabs * sizeof(int)));
-	mem->list = NULL;
-cleanup3:
-	swiotlb_cleanup();
-	return -ENOMEM;
 }
 
 void __init swiotlb_exit(void)
 {
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	struct io_tlb_mem *mem = io_tlb_default_mem;
+	size_t size;
 
-	if (!mem->orig_addr)
+	if (!mem)
 		return;
 
-	if (mem->late_alloc) {
-		free_pages((unsigned long)mem->alloc_size,
-			   get_order(mem->nslabs * sizeof(size_t)));
-		free_pages((unsigned long)mem->orig_addr,
-			   get_order(mem->nslabs * sizeof(phys_addr_t)));
-		free_pages((unsigned long)mem->list,
-			   get_order(mem->nslabs * sizeof(int)));
-		free_pages((unsigned long)phys_to_virt(mem->start),
-			   get_order(mem->nslabs << IO_TLB_SHIFT));
-	} else {
-		memblock_free_late(__pa(mem->alloc_size),
-				   PAGE_ALIGN(mem->nslabs * sizeof(size_t)));
-		memblock_free_late(__pa(mem->orig_addr),
-				   PAGE_ALIGN(mem->nslabs * sizeof(phys_addr_t)));
-		memblock_free_late(__pa(mem->list),
-				   PAGE_ALIGN(mem->nslabs * sizeof(int)));
-		memblock_free_late(mem->start,
-				   PAGE_ALIGN(mem->nslabs << IO_TLB_SHIFT));
-	}
-	swiotlb_cleanup();
+	size = struct_size(mem, slots, mem->nslabs);
+	if (mem->late_alloc)
+		free_pages((unsigned long)mem, get_order(size));
+	else
+		memblock_free_late(__pa(mem), PAGE_ALIGN(size));
+	io_tlb_default_mem = NULL;
 }
 
 /*
@@ -435,10 +334,10 @@ void __init swiotlb_exit(void)
 static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size,
 		enum dma_data_direction dir)
 {
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	struct io_tlb_mem *mem = io_tlb_default_mem;
 	int index = (tlb_addr - mem->start) >> IO_TLB_SHIFT;
-	phys_addr_t orig_addr = mem->orig_addr[index];
-	size_t alloc_size = mem->alloc_size[index];
+	phys_addr_t orig_addr = mem->slots[index].orig_addr;
+	size_t alloc_size = mem->slots[index].alloc_size;
 	unsigned long pfn = PFN_DOWN(orig_addr);
 	unsigned char *vaddr = phys_to_virt(tlb_addr);
 
@@ -517,7 +416,7 @@ static unsigned int wrap_index(struct io_tlb_mem *mem, unsigned int index)
 static int find_slots(struct device *dev, phys_addr_t orig_addr,
 		size_t alloc_size)
 {
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	struct io_tlb_mem *mem = io_tlb_default_mem;
 	unsigned long boundary_mask = dma_get_seg_boundary(dev);
 	dma_addr_t tbl_dma_addr =
 		phys_to_dma_unencrypted(dev, mem->start) & boundary_mask;
@@ -559,7 +458,7 @@ static int find_slots(struct device *dev, phys_addr_t orig_addr,
 		if (!iommu_is_span_boundary(index, nslots,
 					    nr_slots(tbl_dma_addr),
 					    max_slots)) {
-			if (mem->list[index] >= nslots)
+			if (mem->slots[index].list >= nslots)
 				goto found;
 		}
 		index = wrap_index(mem, index + stride);
@@ -571,11 +470,11 @@ static int find_slots(struct device *dev, phys_addr_t orig_addr,
 
 found:
 	for (i = index; i < index + nslots; i++)
-		mem->list[i] = 0;
+		mem->slots[i].list = 0;
 	for (i = index - 1;
 	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 &&
-	     mem->list[i]; i--)
-		mem->list[i] = ++count;
+	     mem->slots[i].list; i--)
+		mem->slots[i].list = ++count;
 
 	/*
 	 * Update the indices to avoid searching in the next round.
@@ -594,12 +493,12 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 		size_t mapping_size, size_t alloc_size,
 		enum dma_data_direction dir, unsigned long attrs)
 {
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	struct io_tlb_mem *mem = io_tlb_default_mem;
 	unsigned int offset = swiotlb_align_offset(dev, orig_addr);
 	unsigned int index, i;
 	phys_addr_t tlb_addr;
 
-	if (no_iotlb_memory)
+	if (!mem)
 		panic("Can not allocate SWIOTLB buffer earlier and can't now provide you with the DMA bounce buffer");
 
 	if (mem_encrypt_active())
@@ -626,8 +525,9 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 	 * needed.
 	 */
 	for (i = 0; i < nr_slots(alloc_size + offset); i++) {
-		mem->orig_addr[index + i] = slot_addr(orig_addr, i);
-		mem->alloc_size[index + i] = alloc_size - (i << IO_TLB_SHIFT);
+		mem->slots[index + i].orig_addr = slot_addr(orig_addr, i);
+		mem->slots[index + i].alloc_size =
+			alloc_size - (i << IO_TLB_SHIFT);
 	}
 	tlb_addr = slot_addr(mem->start, index) + offset;
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
@@ -643,11 +543,11 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 			      size_t mapping_size, enum dma_data_direction dir,
 			      unsigned long attrs)
 {
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	struct io_tlb_mem *mem = io_tlb_default_mem;
 	unsigned long flags;
 	unsigned int offset = swiotlb_align_offset(hwdev, tlb_addr);
 	int index = (tlb_addr - offset - mem->start) >> IO_TLB_SHIFT;
-	int nslots = nr_slots(mem->alloc_size[index] + offset);
+	int nslots = nr_slots(mem->slots[index].alloc_size + offset);
 	int count, i;
 
 	/*
@@ -665,7 +565,7 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 	 */
 	spin_lock_irqsave(&mem->lock, flags);
 	if (index + nslots < ALIGN(index + 1, IO_TLB_SEGSIZE))
-		count = mem->list[index + nslots];
+		count = mem->slots[index + nslots].list;
 	else
 		count = 0;
 
@@ -674,9 +574,9 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 	 * superceeding slots
 	 */
 	for (i = index + nslots - 1; i >= index; i--) {
-		mem->list[i] = ++count;
-		mem->orig_addr[i] = INVALID_PHYS_ADDR;
-		mem->alloc_size[i] = 0;
+		mem->slots[i].list = ++count;
+		mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
+		mem->slots[i].alloc_size = 0;
 	}
 
 	/*
@@ -684,9 +584,9 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 	 * available (non zero)
 	 */
 	for (i = index - 1;
-	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 && mem->list[i];
+	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 && mem->slots[i].list;
 	     i--)
-		mem->list[i] = ++count;
+		mem->slots[i].list = ++count;
 	mem->used -= nslots;
 	spin_unlock_irqrestore(&mem->lock, flags);
 }
@@ -750,19 +650,17 @@ size_t swiotlb_max_mapping_size(struct device *dev)
 
 bool is_swiotlb_active(void)
 {
-	/*
-	 * When SWIOTLB is initialized, even if mem->start points to physical
-	 * address zero, mem->end surely doesn't.
-	 */
-	return io_tlb_default_mem.end != 0;
+	return io_tlb_default_mem != NULL;
 }
 
 #ifdef CONFIG_DEBUG_FS
 
 static int __init swiotlb_create_debugfs(void)
 {
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	struct io_tlb_mem *mem = io_tlb_default_mem;
 
+	if (!mem)
+		return 0;
 	mem->debugfs = debugfs_create_dir("swiotlb", NULL);
 	debugfs_create_ulong("io_tlb_nslabs", 0400, mem->debugfs, &mem->nslabs);
 	debugfs_create_ulong("io_tlb_used", 0400, mem->debugfs, &mem->used);
-- 
2.29.2

