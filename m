Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 861184D7C2C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 08:41:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KH7ks38qZz3f2C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 18:41:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nd0IXyZY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+605a0c0c3369109790a8+6777+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=Nd0IXyZY; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KH7Xz0xkCz30Lq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 18:32:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=dDhiwgQcAwGiyM5bV6HjqpPSPw1ZYuR5pzBsTUAIu7w=; b=Nd0IXyZYwxrXgIDJ9Qm0/nnu/F
 Mt9TAfkB75N48Ae3Up+Y0uwyHDdKoDRxWDLLJLP3GGrVVF3u7f3+tRpuvub8FjFBNd4aw/6KW0vUV
 VPbPrxqDRNkIFNT8McAKXUWPxG6Z+heTadwCb9udXXC9KJL2FmOQRZ31FOYGmkipgixZstyzqL2GA
 UFyG9Yk/FMzwJigMzLreiBJg1ov91gQNkSLz1gD2xxpL7EUvQPuBBFK/whVl0jfD3c8tmg7g/mcFB
 79yNstFQ/NxJPPZSVTTKVF8QucE1PLouj0dsYSJktNDH0IbHUYXjYZJo9FuyvrefY6r8vr1wsZT/F
 ZCtU1P8A==;
Received: from [46.140.54.162] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfBg-0044uH-2E; Mon, 14 Mar 2022 07:32:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 14/15] swiotlb: remove swiotlb_init_with_tbl and
 swiotlb_init_late_with_tbl
Date: Mon, 14 Mar 2022 08:31:28 +0100
Message-Id: <20220314073129.1862284-15-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220314073129.1862284-1-hch@lst.de>
References: <20220314073129.1862284-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 tboot-devel@lists.sourceforge.net, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No users left.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/swiotlb.h |  2 -
 kernel/dma/swiotlb.c    | 85 +++++++++++++++--------------------------
 2 files changed, 30 insertions(+), 57 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 7b50c82f84ce9..7ed35dd3de6e7 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -34,13 +34,11 @@ struct scatterlist;
 /* default to 64MB */
 #define IO_TLB_DEFAULT_SIZE (64UL<<20)
 
-int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, unsigned int flags);
 unsigned long swiotlb_size_or_default(void);
 void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 	int (*remap)(void *tlb, unsigned long nslabs));
 int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 	int (*remap)(void *tlb, unsigned long nslabs));
-extern int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs);
 extern void __init swiotlb_update_mem_attributes(void);
 
 phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 88ea7b9bce6e9..d04bacdb0905b 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -225,33 +225,6 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 	return;
 }
 
-int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs,
-		unsigned int flags)
-{
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
-	size_t alloc_size;
-
-	if (swiotlb_force_disable)
-		return 0;
-
-	/* protect against double initialization */
-	if (WARN_ON_ONCE(mem->nslabs))
-		return -ENOMEM;
-
-	alloc_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), nslabs));
-	mem->slots = memblock_alloc(alloc_size, PAGE_SIZE);
-	if (!mem->slots)
-		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
-		      __func__, alloc_size, PAGE_SIZE);
-
-	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, false);
-	mem->force_bounce = flags & SWIOTLB_FORCE;
-
-	if (flags & SWIOTLB_VERBOSE)
-		swiotlb_print_info();
-	return 0;
-}
-
 /*
  * Statically reserve bounce buffer space and initialize bounce buffer data
  * structures for the software IO TLB used to implement the DMA API.
@@ -259,7 +232,9 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs,
 void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 		int (*remap)(void *tlb, unsigned long nslabs))
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long nslabs = default_nslabs;
+	size_t alloc_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), nslabs));
 	size_t bytes;
 	void *tlb;
 
@@ -280,7 +255,8 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 	else
 		tlb = memblock_alloc_low(bytes, PAGE_SIZE);
 	if (!tlb)
-		goto fail;
+		panic("%s: failed to allocate tlb structure\n", __func__);
+
 	if (remap && remap(tlb, nslabs) < 0) {
 		memblock_free(tlb, PAGE_ALIGN(bytes));
 
@@ -291,14 +267,17 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
 		goto retry;
 	}
-	if (swiotlb_init_with_tbl(tlb, default_nslabs, flags))
-		goto fail_free_mem;
-	return;
 
-fail_free_mem:
-	memblock_free(tlb, bytes);
-fail:
-	pr_warn("Cannot allocate buffer");
+	mem->slots = memblock_alloc(alloc_size, PAGE_SIZE);
+	if (!mem->slots)
+		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
+		      __func__, alloc_size, PAGE_SIZE);
+
+	swiotlb_init_io_tlb_mem(mem, __pa(tlb), default_nslabs, false);
+	mem->force_bounce = flags & SWIOTLB_FORCE;
+
+	if (flags & SWIOTLB_VERBOSE)
+		swiotlb_print_info();
 }
 
 void __init swiotlb_init(bool addressing_limit, unsigned int flags)
@@ -314,6 +293,7 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
 int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 		int (*remap)(void *tlb, unsigned long nslabs))
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
 	unsigned long bytes;
 	unsigned char *vstart = NULL;
@@ -355,33 +335,28 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 			(PAGE_SIZE << order) >> 20);
 		nslabs = SLABS_PER_PAGE << order;
 	}
-	rc = swiotlb_late_init_with_tbl(vstart, nslabs);
-	if (rc)
-		free_pages((unsigned long)vstart, order);
-
-	return rc;
-}
-
-int
-swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
-{
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
-	unsigned long bytes = nslabs << IO_TLB_SHIFT;
 
-	if (swiotlb_force_disable)
-		return 0;
+	if (remap)
+		rc = remap(vstart, nslabs);
+	if (rc) {
+		free_pages((unsigned long)vstart, order);
 
-	/* protect against double initialization */
-	if (WARN_ON_ONCE(mem->nslabs))
-		return -ENOMEM;
+		/* Min is 2MB */
+		if (nslabs <= 1024)
+			return rc;
+		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
+		goto retry;
+	}
 
 	mem->slots = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
 		get_order(array_size(sizeof(*mem->slots), nslabs)));
-	if (!mem->slots)
+	if (!mem->slots) {
+		free_pages((unsigned long)vstart, order);
 		return -ENOMEM;
+	}
 
-	set_memory_decrypted((unsigned long)tlb, bytes >> PAGE_SHIFT);
-	swiotlb_init_io_tlb_mem(mem, virt_to_phys(tlb), nslabs, true);
+	set_memory_decrypted((unsigned long)vstart, bytes >> PAGE_SHIFT);
+	swiotlb_init_io_tlb_mem(mem, virt_to_phys(vstart), nslabs, true);
 
 	swiotlb_print_info();
 	return 0;
-- 
2.30.2

