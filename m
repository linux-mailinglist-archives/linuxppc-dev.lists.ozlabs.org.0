Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 667FD3148D4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 07:29:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZXzq0bcdzDsby
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 17:29:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=D8UmSO/E; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZXqN5B57zDsdT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 17:22:08 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id b8so9148988plh.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 22:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XD+CQBaV23BDlNnO+PpvLMFfqVc2yOMxmH+MUGKPs6w=;
 b=D8UmSO/ERP7kOKUSbGuHANSz9VFDE05biNMmXqRTUbET3+rkQ5LLNdZr4BHcWQ7G7g
 mYSYnczi/RbEbwT/nkTNlbF/EFD+y/rGOnS3U4Dd+yM4HqpkpAWccFAu6G2OdcYUfka0
 rFGRq0QsZwzAp4bjrdVueBqqe1LrrbcHvK6uA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XD+CQBaV23BDlNnO+PpvLMFfqVc2yOMxmH+MUGKPs6w=;
 b=clPdI9nPdFFcDeCe5hE47+NC2st5zvPzzCzKktdctMRQ43I4Zo6dtHR9UyCWL5SEcN
 KU3ySc3ppXaipz9SW1hkBKWdJzqNi8hvt9b9U18SBebdMdGxZ3MJ6hEGw7IU+nfxG/sW
 DjBWqWGKGhETTjJEKdGMcwefyh0ibahI/uMUdBibaBiavhXkWfbXsE0faZ7f4qM4sw7d
 2MtJexMBSCBzZ/zfaeqYwvToDWFodoO2KnLSeffsqcNnaPtH4xoXxvuwlGo98iVN7UZK
 4M19k6aGbDZe7C0mvRdeJr4H8SeCVOwC+/EfQYk0XzH5CFHT3rB3XdFfTQLItLMZ4SKH
 Tvbw==
X-Gm-Message-State: AOAM532Xa6vgPEFWMIivq1KrMHJLxq2C36IZ1a2fQRfl3seMy1k3d2lH
 Sj2tSVRGwuQdZzTSHEmdAFGAPg==
X-Google-Smtp-Source: ABdhPJwiCoGV2Q0lgiH5vbozu5JoZAEHZGIKhYvfLKOhwI17DJRAwojDGzNQdyAdFGBmg/ai3bJumQ==
X-Received: by 2002:a17:90a:3d42:: with SMTP id
 o2mr2498572pjf.173.1612851725714; 
 Mon, 08 Feb 2021 22:22:05 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a106:46e1:a999:81df])
 by smtp.gmail.com with UTF8SMTPSA id b25sm13766245pfp.26.2021.02.08.22.21.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:22:04 -0800 (PST)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 03/14] swiotlb: Add struct swiotlb
Date: Tue,  9 Feb 2021 14:21:20 +0800
Message-Id: <20210209062131.2300005-4-tientzu@chromium.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
In-Reply-To: <20210209062131.2300005-1-tientzu@chromium.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org, grant.likely@arm.com,
 paulus@samba.org, mingo@kernel.org, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Nicolas Boichat <drinkcat@chromium.org>, Claire Chang <tientzu@chromium.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Added a new struct, swiotlb, as the IO TLB memory pool descriptor and
moved relevant global variables into that struct.
This will be useful later to allow for restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/swiotlb.c | 327 +++++++++++++++++++++++--------------------
 1 file changed, 172 insertions(+), 155 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 678490d39e55..28b7bfe7a2a8 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -61,33 +61,43 @@
  * allocate a contiguous 1MB, we're probably in trouble anyway.
  */
 #define IO_TLB_MIN_SLABS ((1<<20) >> IO_TLB_SHIFT)
+#define INVALID_PHYS_ADDR (~(phys_addr_t)0)
 
 enum swiotlb_force swiotlb_force;
 
 /*
- * Used to do a quick range check in swiotlb_tbl_unmap_single and
- * swiotlb_tbl_sync_single_*, to see if the memory was in fact allocated by this
- * API.
- */
-static phys_addr_t io_tlb_start, io_tlb_end;
-
-/*
- * The number of IO TLB blocks (in groups of 64) between io_tlb_start and
- * io_tlb_end.  This is command line adjustable via setup_io_tlb_npages.
- */
-static unsigned long io_tlb_nslabs;
-
-/*
- * The number of used IO TLB block
- */
-static unsigned long io_tlb_used;
-
-/*
- * This is a free list describing the number of free entries available from
- * each index
+ * struct swiotlb - Software IO TLB Memory Pool Descriptor
+ *
+ * @start:      The start address of the swiotlb memory pool. Used to do a quick
+ *              range check to see if the memory was in fact allocated by this
+ *              API.
+ * @end:        The end address of the swiotlb memory pool. Used to do a quick
+ *              range check to see if the memory was in fact allocated by this
+ *              API.
+ * @nslabs:     The number of IO TLB blocks (in groups of 64) between @start and
+ *              @end. This is command line adjustable via setup_io_tlb_npages.
+ * @used:       The number of used IO TLB block.
+ * @list:       The free list describing the number of free entries available
+ *              from each index.
+ * @index:      The index to start searching in the next round.
+ * @orig_addr:  The original address corresponding to a mapped entry for the
+ *              sync operations.
+ * @lock:       The lock to protect the above data structures in the map and
+ *              unmap calls.
+ * @debugfs:    The dentry to debugfs.
  */
-static unsigned int *io_tlb_list;
-static unsigned int io_tlb_index;
+struct swiotlb {
+	phys_addr_t start;
+	phys_addr_t end;
+	unsigned long nslabs;
+	unsigned long used;
+	unsigned int *list;
+	unsigned int index;
+	phys_addr_t *orig_addr;
+	spinlock_t lock;
+	struct dentry *debugfs;
+};
+static struct swiotlb default_swiotlb;
 
 /*
  * Max segment that we can provide which (if pages are contingous) will
@@ -95,27 +105,17 @@ static unsigned int io_tlb_index;
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
- * Protect the above data structures in the map and unmap calls
- */
-static DEFINE_SPINLOCK(io_tlb_lock);
-
 static int late_alloc;
 
 static int __init
 setup_io_tlb_npages(char *str)
 {
+	struct swiotlb *swiotlb = &default_swiotlb;
+
 	if (isdigit(*str)) {
-		io_tlb_nslabs = simple_strtoul(str, &str, 0);
+		swiotlb->nslabs = simple_strtoul(str, &str, 0);
 		/* avoid tail segment of size < IO_TLB_SEGSIZE */
-		io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
+		swiotlb->nslabs = ALIGN(swiotlb->nslabs, IO_TLB_SEGSIZE);
 	}
 	if (*str == ',')
 		++str;
@@ -123,7 +123,7 @@ setup_io_tlb_npages(char *str)
 		swiotlb_force = SWIOTLB_FORCE;
 	} else if (!strcmp(str, "noforce")) {
 		swiotlb_force = SWIOTLB_NO_FORCE;
-		io_tlb_nslabs = 1;
+		swiotlb->nslabs = 1;
 	}
 
 	return 0;
@@ -134,7 +134,7 @@ static bool no_iotlb_memory;
 
 unsigned long swiotlb_nr_tbl(void)
 {
-	return unlikely(no_iotlb_memory) ? 0 : io_tlb_nslabs;
+	return unlikely(no_iotlb_memory) ? 0 : default_swiotlb.nslabs;
 }
 EXPORT_SYMBOL_GPL(swiotlb_nr_tbl);
 
@@ -156,13 +156,14 @@ unsigned long swiotlb_size_or_default(void)
 {
 	unsigned long size;
 
-	size = io_tlb_nslabs << IO_TLB_SHIFT;
+	size = default_swiotlb.nslabs << IO_TLB_SHIFT;
 
 	return size ? size : (IO_TLB_DEFAULT_SIZE);
 }
 
 void __init swiotlb_adjust_size(unsigned long new_size)
 {
+	struct swiotlb *swiotlb = &default_swiotlb;
 	unsigned long size;
 
 	/*
@@ -170,10 +171,10 @@ void __init swiotlb_adjust_size(unsigned long new_size)
 	 * architectures such as those supporting memory encryption to
 	 * adjust/expand SWIOTLB size for their use.
 	 */
-	if (!io_tlb_nslabs) {
+	if (!swiotlb->nslabs) {
 		size = ALIGN(new_size, 1 << IO_TLB_SHIFT);
-		io_tlb_nslabs = size >> IO_TLB_SHIFT;
-		io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
+		swiotlb->nslabs = size >> IO_TLB_SHIFT;
+		swiotlb->nslabs = ALIGN(swiotlb->nslabs, IO_TLB_SEGSIZE);
 
 		pr_info("SWIOTLB bounce buffer size adjusted to %luMB", size >> 20);
 	}
@@ -181,14 +182,15 @@ void __init swiotlb_adjust_size(unsigned long new_size)
 
 void swiotlb_print_info(void)
 {
-	unsigned long bytes = io_tlb_nslabs << IO_TLB_SHIFT;
+	struct swiotlb *swiotlb = &default_swiotlb;
+	unsigned long bytes = swiotlb->nslabs << IO_TLB_SHIFT;
 
 	if (no_iotlb_memory) {
 		pr_warn("No low mem\n");
 		return;
 	}
 
-	pr_info("mapped [mem %pa-%pa] (%luMB)\n", &io_tlb_start, &io_tlb_end,
+	pr_info("mapped [mem %pa-%pa] (%luMB)\n", &swiotlb->start, &swiotlb->end,
 	       bytes >> 20);
 }
 
@@ -200,57 +202,61 @@ void swiotlb_print_info(void)
  */
 void __init swiotlb_update_mem_attributes(void)
 {
+	struct swiotlb *swiotlb = &default_swiotlb;
 	void *vaddr;
 	unsigned long bytes;
 
 	if (no_iotlb_memory || late_alloc)
 		return;
 
-	vaddr = phys_to_virt(io_tlb_start);
-	bytes = PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT);
+	vaddr = phys_to_virt(swiotlb->start);
+	bytes = PAGE_ALIGN(swiotlb->nslabs << IO_TLB_SHIFT);
 	set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT);
 	memset(vaddr, 0, bytes);
 }
 
 int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 {
+	struct swiotlb *swiotlb = &default_swiotlb;
 	unsigned long i, bytes;
 	size_t alloc_size;
 
 	bytes = nslabs << IO_TLB_SHIFT;
 
-	io_tlb_nslabs = nslabs;
-	io_tlb_start = __pa(tlb);
-	io_tlb_end = io_tlb_start + bytes;
+	swiotlb->nslabs = nslabs;
+	swiotlb->start = __pa(tlb);
+	swiotlb->end = swiotlb->start + bytes;
 
 	/*
 	 * Allocate and initialize the free list array.  This array is used
 	 * to find contiguous free memory regions of size up to IO_TLB_SEGSIZE
-	 * between io_tlb_start and io_tlb_end.
+	 * between swiotlb->start and swiotlb->end.
 	 */
-	alloc_size = PAGE_ALIGN(io_tlb_nslabs * sizeof(int));
-	io_tlb_list = memblock_alloc(alloc_size, PAGE_SIZE);
-	if (!io_tlb_list)
+	alloc_size = PAGE_ALIGN(swiotlb->nslabs * sizeof(int));
+	swiotlb->list = memblock_alloc(alloc_size, PAGE_SIZE);
+	if (!swiotlb->list)
 		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
 		      __func__, alloc_size, PAGE_SIZE);
 
-	alloc_size = PAGE_ALIGN(io_tlb_nslabs * sizeof(phys_addr_t));
-	io_tlb_orig_addr = memblock_alloc(alloc_size, PAGE_SIZE);
-	if (!io_tlb_orig_addr)
+	alloc_size = PAGE_ALIGN(swiotlb->nslabs * sizeof(phys_addr_t));
+	swiotlb->orig_addr = memblock_alloc(alloc_size, PAGE_SIZE);
+	if (!swiotlb->orig_addr)
 		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
 		      __func__, alloc_size, PAGE_SIZE);
 
-	for (i = 0; i < io_tlb_nslabs; i++) {
-		io_tlb_list[i] = IO_TLB_SEGSIZE - OFFSET(i, IO_TLB_SEGSIZE);
-		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
+	for (i = 0; i < swiotlb->nslabs; i++) {
+		swiotlb->list[i] = IO_TLB_SEGSIZE - OFFSET(i, IO_TLB_SEGSIZE);
+		swiotlb->orig_addr[i] = INVALID_PHYS_ADDR;
 	}
-	io_tlb_index = 0;
+	swiotlb->index = 0;
 	no_iotlb_memory = false;
 
 	if (verbose)
 		swiotlb_print_info();
 
-	swiotlb_set_max_segment(io_tlb_nslabs << IO_TLB_SHIFT);
+	swiotlb_set_max_segment(swiotlb->nslabs << IO_TLB_SHIFT);
+	spin_lock_init(&swiotlb->lock);
+
 	return 0;
 }
 
@@ -261,26 +267,27 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 void  __init
 swiotlb_init(int verbose)
 {
+	struct swiotlb *swiotlb = &default_swiotlb;
 	size_t default_size = IO_TLB_DEFAULT_SIZE;
 	unsigned char *vstart;
 	unsigned long bytes;
 
-	if (!io_tlb_nslabs) {
-		io_tlb_nslabs = (default_size >> IO_TLB_SHIFT);
-		io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
+	if (!swiotlb->nslabs) {
+		swiotlb->nslabs = (default_size >> IO_TLB_SHIFT);
+		swiotlb->nslabs = ALIGN(swiotlb->nslabs, IO_TLB_SEGSIZE);
 	}
 
-	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
+	bytes = swiotlb->nslabs << IO_TLB_SHIFT;
 
 	/* Get IO TLB memory from the low pages */
 	vstart = memblock_alloc_low(PAGE_ALIGN(bytes), PAGE_SIZE);
-	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, verbose))
+	if (vstart && !swiotlb_init_with_tbl(vstart, swiotlb->nslabs, verbose))
 		return;
 
-	if (io_tlb_start) {
-		memblock_free_early(io_tlb_start,
-				    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
-		io_tlb_start = 0;
+	if (swiotlb->start) {
+		memblock_free_early(swiotlb->start,
+				    PAGE_ALIGN(swiotlb->nslabs << IO_TLB_SHIFT));
+		swiotlb->start = 0;
 	}
 	pr_warn("Cannot allocate buffer");
 	no_iotlb_memory = true;
@@ -294,22 +301,23 @@ swiotlb_init(int verbose)
 int
 swiotlb_late_init_with_default_size(size_t default_size)
 {
-	unsigned long bytes, req_nslabs = io_tlb_nslabs;
+	struct swiotlb *swiotlb = &default_swiotlb;
+	unsigned long bytes, req_nslabs = swiotlb->nslabs;
 	unsigned char *vstart = NULL;
 	unsigned int order;
 	int rc = 0;
 
-	if (!io_tlb_nslabs) {
-		io_tlb_nslabs = (default_size >> IO_TLB_SHIFT);
-		io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
+	if (!swiotlb->nslabs) {
+		swiotlb->nslabs = (default_size >> IO_TLB_SHIFT);
+		swiotlb->nslabs = ALIGN(swiotlb->nslabs, IO_TLB_SEGSIZE);
 	}
 
 	/*
 	 * Get IO TLB memory from the low pages
 	 */
-	order = get_order(io_tlb_nslabs << IO_TLB_SHIFT);
-	io_tlb_nslabs = SLABS_PER_PAGE << order;
-	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
+	order = get_order(swiotlb->nslabs << IO_TLB_SHIFT);
+	swiotlb->nslabs = SLABS_PER_PAGE << order;
+	bytes = swiotlb->nslabs << IO_TLB_SHIFT;
 
 	while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
 		vstart = (void *)__get_free_pages(GFP_DMA | __GFP_NOWARN,
@@ -320,15 +328,15 @@ swiotlb_late_init_with_default_size(size_t default_size)
 	}
 
 	if (!vstart) {
-		io_tlb_nslabs = req_nslabs;
+		swiotlb->nslabs = req_nslabs;
 		return -ENOMEM;
 	}
 	if (order != get_order(bytes)) {
 		pr_warn("only able to allocate %ld MB\n",
 			(PAGE_SIZE << order) >> 20);
-		io_tlb_nslabs = SLABS_PER_PAGE << order;
+		swiotlb->nslabs = SLABS_PER_PAGE << order;
 	}
-	rc = swiotlb_late_init_with_tbl(vstart, io_tlb_nslabs);
+	rc = swiotlb_late_init_with_tbl(vstart, swiotlb->nslabs);
 	if (rc)
 		free_pages((unsigned long)vstart, order);
 
@@ -337,22 +345,25 @@ swiotlb_late_init_with_default_size(size_t default_size)
 
 static void swiotlb_cleanup(void)
 {
-	io_tlb_end = 0;
-	io_tlb_start = 0;
-	io_tlb_nslabs = 0;
+	struct swiotlb *swiotlb = &default_swiotlb;
+
+	swiotlb->end = 0;
+	swiotlb->start = 0;
+	swiotlb->nslabs = 0;
 	max_segment = 0;
 }
 
 int
 swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 {
+	struct swiotlb *swiotlb = &default_swiotlb;
 	unsigned long i, bytes;
 
 	bytes = nslabs << IO_TLB_SHIFT;
 
-	io_tlb_nslabs = nslabs;
-	io_tlb_start = virt_to_phys(tlb);
-	io_tlb_end = io_tlb_start + bytes;
+	swiotlb->nslabs = nslabs;
+	swiotlb->start = virt_to_phys(tlb);
+	swiotlb->end = swiotlb->start + bytes;
 
 	set_memory_decrypted((unsigned long)tlb, bytes >> PAGE_SHIFT);
 	memset(tlb, 0, bytes);
@@ -360,39 +371,40 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 	/*
 	 * Allocate and initialize the free list array.  This array is used
 	 * to find contiguous free memory regions of size up to IO_TLB_SEGSIZE
-	 * between io_tlb_start and io_tlb_end.
+	 * between swiotlb->start and swiotlb->end.
 	 */
-	io_tlb_list = (unsigned int *)__get_free_pages(GFP_KERNEL,
-	                              get_order(io_tlb_nslabs * sizeof(int)));
-	if (!io_tlb_list)
+	swiotlb->list = (unsigned int *)__get_free_pages(GFP_KERNEL,
+	                              get_order(swiotlb->nslabs * sizeof(int)));
+	if (!swiotlb->list)
 		goto cleanup3;
 
-	io_tlb_orig_addr = (phys_addr_t *)
+	swiotlb->orig_addr = (phys_addr_t *)
 		__get_free_pages(GFP_KERNEL,
-				 get_order(io_tlb_nslabs *
+				 get_order(swiotlb->nslabs *
 					   sizeof(phys_addr_t)));
-	if (!io_tlb_orig_addr)
+	if (!swiotlb->orig_addr)
 		goto cleanup4;
 
-	for (i = 0; i < io_tlb_nslabs; i++) {
-		io_tlb_list[i] = IO_TLB_SEGSIZE - OFFSET(i, IO_TLB_SEGSIZE);
-		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
+	for (i = 0; i < swiotlb->nslabs; i++) {
+		swiotlb->list[i] = IO_TLB_SEGSIZE - OFFSET(i, IO_TLB_SEGSIZE);
+		swiotlb->orig_addr[i] = INVALID_PHYS_ADDR;
 	}
-	io_tlb_index = 0;
+	swiotlb->index = 0;
 	no_iotlb_memory = false;
 
 	swiotlb_print_info();
 
 	late_alloc = 1;
 
-	swiotlb_set_max_segment(io_tlb_nslabs << IO_TLB_SHIFT);
+	swiotlb_set_max_segment(swiotlb->nslabs << IO_TLB_SHIFT);
+	spin_lock_init(&swiotlb->lock);
 
 	return 0;
 
 cleanup4:
-	free_pages((unsigned long)io_tlb_list, get_order(io_tlb_nslabs *
-	                                                 sizeof(int)));
-	io_tlb_list = NULL;
+	free_pages((unsigned long)swiotlb->list,
+		   get_order(swiotlb->nslabs * sizeof(int)));
+	swiotlb->list = NULL;
 cleanup3:
 	swiotlb_cleanup();
 	return -ENOMEM;
@@ -400,23 +412,25 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 
 void __init swiotlb_exit(void)
 {
-	if (!io_tlb_orig_addr)
+	struct swiotlb *swiotlb = &default_swiotlb;
+
+	if (!swiotlb->orig_addr)
 		return;
 
 	if (late_alloc) {
-		free_pages((unsigned long)io_tlb_orig_addr,
-			   get_order(io_tlb_nslabs * sizeof(phys_addr_t)));
-		free_pages((unsigned long)io_tlb_list, get_order(io_tlb_nslabs *
-								 sizeof(int)));
-		free_pages((unsigned long)phys_to_virt(io_tlb_start),
-			   get_order(io_tlb_nslabs << IO_TLB_SHIFT));
+		free_pages((unsigned long)swiotlb->orig_addr,
+			   get_order(swiotlb->nslabs * sizeof(phys_addr_t)));
+		free_pages((unsigned long)swiotlb->list,
+			   get_order(swiotlb->nslabs * sizeof(int)));
+		free_pages((unsigned long)phys_to_virt(swiotlb->start),
+			   get_order(swiotlb->nslabs << IO_TLB_SHIFT));
 	} else {
-		memblock_free_late(__pa(io_tlb_orig_addr),
-				   PAGE_ALIGN(io_tlb_nslabs * sizeof(phys_addr_t)));
-		memblock_free_late(__pa(io_tlb_list),
-				   PAGE_ALIGN(io_tlb_nslabs * sizeof(int)));
-		memblock_free_late(io_tlb_start,
-				   PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
+		memblock_free_late(__pa(swiotlb->orig_addr),
+				   PAGE_ALIGN(swiotlb->nslabs * sizeof(phys_addr_t)));
+		memblock_free_late(__pa(swiotlb->list),
+				   PAGE_ALIGN(swiotlb->nslabs * sizeof(int)));
+		memblock_free_late(swiotlb->start,
+				   PAGE_ALIGN(swiotlb->nslabs << IO_TLB_SHIFT));
 	}
 	swiotlb_cleanup();
 }
@@ -465,7 +479,8 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 		size_t mapping_size, size_t alloc_size,
 		enum dma_data_direction dir, unsigned long attrs)
 {
-	dma_addr_t tbl_dma_addr = phys_to_dma_unencrypted(hwdev, io_tlb_start);
+	struct swiotlb *swiotlb = &default_swiotlb;
+	dma_addr_t tbl_dma_addr = phys_to_dma_unencrypted(hwdev, swiotlb->start);
 	unsigned long flags;
 	phys_addr_t tlb_addr;
 	unsigned int nslots, stride, index, wrap;
@@ -516,13 +531,13 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 	 * Find suitable number of IO TLB entries size that will fit this
 	 * request and allocate a buffer from that IO TLB pool.
 	 */
-	spin_lock_irqsave(&io_tlb_lock, flags);
+	spin_lock_irqsave(&swiotlb->lock, flags);
 
-	if (unlikely(nslots > io_tlb_nslabs - io_tlb_used))
+	if (unlikely(nslots > swiotlb->nslabs - swiotlb->used))
 		goto not_found;
 
-	index = ALIGN(io_tlb_index, stride);
-	if (index >= io_tlb_nslabs)
+	index = ALIGN(swiotlb->index, stride);
+	if (index >= swiotlb->nslabs)
 		index = 0;
 	wrap = index;
 
@@ -530,7 +545,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 		while (iommu_is_span_boundary(index, nslots, offset_slots,
 					      max_slots)) {
 			index += stride;
-			if (index >= io_tlb_nslabs)
+			if (index >= swiotlb->nslabs)
 				index = 0;
 			if (index == wrap)
 				goto not_found;
@@ -541,40 +556,40 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 		 * contiguous buffers, we allocate the buffers from that slot
 		 * and mark the entries as '0' indicating unavailable.
 		 */
-		if (io_tlb_list[index] >= nslots) {
+		if (swiotlb->list[index] >= nslots) {
 			int count = 0;
 
 			for (i = index; i < (int) (index + nslots); i++)
-				io_tlb_list[i] = 0;
-			for (i = index - 1; (OFFSET(i, IO_TLB_SEGSIZE) != IO_TLB_SEGSIZE - 1) && io_tlb_list[i]; i--)
-				io_tlb_list[i] = ++count;
-			tlb_addr = io_tlb_start + (index << IO_TLB_SHIFT);
+				swiotlb->list[i] = 0;
+			for (i = index - 1; (OFFSET(i, IO_TLB_SEGSIZE) != IO_TLB_SEGSIZE - 1) && swiotlb->list[i]; i--)
+				swiotlb->list[i] = ++count;
+			tlb_addr = swiotlb->start + (index << IO_TLB_SHIFT);
 
 			/*
 			 * Update the indices to avoid searching in the next
 			 * round.
 			 */
-			io_tlb_index = ((index + nslots) < io_tlb_nslabs
-					? (index + nslots) : 0);
+			swiotlb->index = ((index + nslots) < swiotlb->nslabs
+				      ? (index + nslots) : 0);
 
 			goto found;
 		}
 		index += stride;
-		if (index >= io_tlb_nslabs)
+		if (index >= swiotlb->nslabs)
 			index = 0;
 	} while (index != wrap);
 
 not_found:
-	tmp_io_tlb_used = io_tlb_used;
+	tmp_io_tlb_used = swiotlb->used;
 
-	spin_unlock_irqrestore(&io_tlb_lock, flags);
+	spin_unlock_irqrestore(&swiotlb->lock, flags);
 	if (!(attrs & DMA_ATTR_NO_WARN) && printk_ratelimit())
 		dev_warn(hwdev, "swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (slots)\n",
-			 alloc_size, io_tlb_nslabs, tmp_io_tlb_used);
+			 alloc_size, swiotlb->nslabs, tmp_io_tlb_used);
 	return (phys_addr_t)DMA_MAPPING_ERROR;
 found:
-	io_tlb_used += nslots;
-	spin_unlock_irqrestore(&io_tlb_lock, flags);
+	swiotlb->used += nslots;
+	spin_unlock_irqrestore(&swiotlb->lock, flags);
 
 	/*
 	 * Save away the mapping from the original address to the DMA address.
@@ -582,7 +597,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 	 * needed.
 	 */
 	for (i = 0; i < nslots; i++)
-		io_tlb_orig_addr[index+i] = orig_addr + (i << IO_TLB_SHIFT);
+		swiotlb->orig_addr[index+i] = orig_addr + (i << IO_TLB_SHIFT);
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL))
 		swiotlb_bounce(orig_addr, tlb_addr, mapping_size, DMA_TO_DEVICE);
@@ -597,10 +612,11 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 			      size_t mapping_size, size_t alloc_size,
 			      enum dma_data_direction dir, unsigned long attrs)
 {
+	struct swiotlb *swiotlb = &default_swiotlb;
 	unsigned long flags;
 	int i, count, nslots = ALIGN(alloc_size, 1 << IO_TLB_SHIFT) >> IO_TLB_SHIFT;
-	int index = (tlb_addr - io_tlb_start) >> IO_TLB_SHIFT;
-	phys_addr_t orig_addr = io_tlb_orig_addr[index];
+	int index = (tlb_addr - swiotlb->start) >> IO_TLB_SHIFT;
+	phys_addr_t orig_addr = swiotlb->orig_addr[index];
 
 	/*
 	 * First, sync the memory before unmapping the entry
@@ -616,36 +632,37 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 	 * While returning the entries to the free list, we merge the entries
 	 * with slots below and above the pool being returned.
 	 */
-	spin_lock_irqsave(&io_tlb_lock, flags);
+	spin_lock_irqsave(&swiotlb->lock, flags);
 	{
 		count = ((index + nslots) < ALIGN(index + 1, IO_TLB_SEGSIZE) ?
-			 io_tlb_list[index + nslots] : 0);
+			 swiotlb->list[index + nslots] : 0);
 		/*
 		 * Step 1: return the slots to the free list, merging the
 		 * slots with superceeding slots
 		 */
 		for (i = index + nslots - 1; i >= index; i--) {
-			io_tlb_list[i] = ++count;
-			io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
+			swiotlb->list[i] = ++count;
+			swiotlb->orig_addr[i] = INVALID_PHYS_ADDR;
 		}
 		/*
 		 * Step 2: merge the returned slots with the preceding slots,
 		 * if available (non zero)
 		 */
-		for (i = index - 1; (OFFSET(i, IO_TLB_SEGSIZE) != IO_TLB_SEGSIZE -1) && io_tlb_list[i]; i--)
-			io_tlb_list[i] = ++count;
+		for (i = index - 1; (OFFSET(i, IO_TLB_SEGSIZE) != IO_TLB_SEGSIZE -1) && swiotlb->list[i]; i--)
+			swiotlb->list[i] = ++count;
 
-		io_tlb_used -= nslots;
+		swiotlb->used -= nslots;
 	}
-	spin_unlock_irqrestore(&io_tlb_lock, flags);
+	spin_unlock_irqrestore(&swiotlb->lock, flags);
 }
 
 void swiotlb_tbl_sync_single(struct device *hwdev, phys_addr_t tlb_addr,
 			     size_t size, enum dma_data_direction dir,
 			     enum dma_sync_target target)
 {
-	int index = (tlb_addr - io_tlb_start) >> IO_TLB_SHIFT;
-	phys_addr_t orig_addr = io_tlb_orig_addr[index];
+	struct swiotlb *swiotlb = &default_swiotlb;
+	int index = (tlb_addr - swiotlb->start) >> IO_TLB_SHIFT;
+	phys_addr_t orig_addr = swiotlb->orig_addr[index];
 
 	if (orig_addr == INVALID_PHYS_ADDR)
 		return;
@@ -713,31 +730,31 @@ size_t swiotlb_max_mapping_size(struct device *dev)
 bool is_swiotlb_active(void)
 {
 	/*
-	 * When SWIOTLB is initialized, even if io_tlb_start points to physical
-	 * address zero, io_tlb_end surely doesn't.
+	 * When SWIOTLB is initialized, even if swiotlb->start points to
+	 * physical address zero, swiotlb->end surely doesn't.
 	 */
-	return io_tlb_end != 0;
+	return default_swiotlb.end != 0;
 }
 
 bool is_swiotlb_buffer(phys_addr_t paddr)
 {
-	return paddr >= io_tlb_start && paddr < io_tlb_end;
+	return paddr >= default_swiotlb.start && paddr < default_swiotlb.end;
 }
 
 phys_addr_t get_swiotlb_start(void)
 {
-	return io_tlb_start;
+	return default_swiotlb.start;
 }
 
 #ifdef CONFIG_DEBUG_FS
 
 static int __init swiotlb_create_debugfs(void)
 {
-	struct dentry *root;
+	struct swiotlb *swiotlb = &default_swiotlb;
 
-	root = debugfs_create_dir("swiotlb", NULL);
-	debugfs_create_ulong("io_tlb_nslabs", 0400, root, &io_tlb_nslabs);
-	debugfs_create_ulong("io_tlb_used", 0400, root, &io_tlb_used);
+	swiotlb->debugfs = debugfs_create_dir("swiotlb", NULL);
+	debugfs_create_ulong("io_tlb_nslabs", 0400, swiotlb->debugfs, &swiotlb->nslabs);
+	debugfs_create_ulong("io_tlb_used", 0400, swiotlb->debugfs, &swiotlb->used);
 	return 0;
 }
 
-- 
2.30.0.478.g8a0d178c01-goog

