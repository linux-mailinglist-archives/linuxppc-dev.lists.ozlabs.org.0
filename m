Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5DC327880
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 08:46:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dpslw14Dhz3dGC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 18:46:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Woztf5Kl;
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
 header.s=casper.20170209 header.b=Woztf5Kl; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DpskB6v9Yz30Q7
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Mar 2021 18:45:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Ds/ACDNRu58btmZG/NqJ4lBgbf4+MYCDj5+pQ+XVzpM=; b=Woztf5KlRadzF1qDJdsaN2b6jM
 F8qWgj/k/tKZ4TYWm/AYmy26ne94IWhyXBXotmr6ZMC2165WaVQ0HTcxuOZlbeVPRgeaDbU9tPbk6
 b1+viMTPj3CMaTXoXiKCSmZ7osK63GGeshw5QNx/sYvqsaDd+dXbdEpaqbUF7xUXVaqz1aTIQ+sXB
 NgnUGMgUWy//zxAqn8O6EvVL4sb4zQrrgB8TYz0XC/mJGicpRKi4j6KyFM7g0lV1wMwCAPkPNUjoK
 59SY3DMBp5chNynkNLgir+OXDa4hEDqhRh8xvDXl/lPGZGPo5vMoG0sUo/Zfva4X8S0ufaB4hAII9
 2/ISnCMw==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGdEq-00FRBJ-Uh; Mon, 01 Mar 2021 07:45:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 03/14] swiotlb: move orig addr and size validation into
 swiotlb_bounce
Date: Mon,  1 Mar 2021 08:44:25 +0100
Message-Id: <20210301074436.919889-4-hch@lst.de>
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

Move the code to find and validate the original buffer address and size
from the callers into swiotlb_bounce.  This means a tiny bit of extra
work in the swiotlb_map path, but avoids code duplication and a leads to
a better code structure.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 59 +++++++++++++++++---------------------------
 1 file changed, 23 insertions(+), 36 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 03aa614565e417..a9063092f6f566 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -460,12 +460,25 @@ void __init swiotlb_exit(void)
 /*
  * Bounce: copy the swiotlb buffer from or back to the original dma location
  */
-static void swiotlb_bounce(phys_addr_t orig_addr, phys_addr_t tlb_addr,
-			   size_t size, enum dma_data_direction dir)
+static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size,
+		enum dma_data_direction dir)
 {
+	int index = (tlb_addr - io_tlb_start) >> IO_TLB_SHIFT;
+	size_t alloc_size = io_tlb_alloc_size[index];
+	phys_addr_t orig_addr = io_tlb_orig_addr[index];
 	unsigned long pfn = PFN_DOWN(orig_addr);
 	unsigned char *vaddr = phys_to_virt(tlb_addr);
 
+	if (orig_addr == INVALID_PHYS_ADDR)
+		return;
+
+	if (size > alloc_size) {
+		dev_WARN_ONCE(dev, 1,
+			"Buffer overflow detected. Allocation size: %zu. Mapping size: %zu.\n",
+			alloc_size, size);
+		size = alloc_size;
+	}
+
 	if (PageHighMem(pfn_to_page(pfn))) {
 		/* The buffer does not have a mapping.  Map it in and copy */
 		unsigned int offset = orig_addr & ~PAGE_MASK;
@@ -644,21 +657,10 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 	tlb_addr = slot_addr(io_tlb_start, index) + offset;
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL))
-		swiotlb_bounce(orig_addr, tlb_addr, mapping_size, DMA_TO_DEVICE);
+		swiotlb_bounce(dev, tlb_addr, mapping_size, DMA_TO_DEVICE);
 	return tlb_addr;
 }
 
-static void validate_sync_size_and_truncate(struct device *hwdev, size_t alloc_size, size_t *size)
-{
-	if (*size > alloc_size) {
-		/* Warn and truncate mapping_size */
-		dev_WARN_ONCE(hwdev, 1,
-			"Attempt for buffer overflow. Original size: %zu. Mapping size: %zu.\n",
-			alloc_size, *size);
-		*size = alloc_size;
-	}
-}
-
 /*
  * tlb_addr is the physical address of the bounce buffer to unmap.
  */
@@ -669,19 +671,15 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 	unsigned long flags;
 	unsigned int offset = swiotlb_align_offset(hwdev, tlb_addr);
 	int index = (tlb_addr - offset - io_tlb_start) >> IO_TLB_SHIFT;
-	phys_addr_t orig_addr = io_tlb_orig_addr[index];
-	size_t alloc_size = io_tlb_alloc_size[index];
-	int i, count, nslots = nr_slots(alloc_size + offset);
-
-	validate_sync_size_and_truncate(hwdev, alloc_size, &mapping_size);
+	int nslots = nr_slots(io_tlb_alloc_size[index] + offset);
+	int count, i;
 
 	/*
 	 * First, sync the memory before unmapping the entry
 	 */
-	if (orig_addr != INVALID_PHYS_ADDR &&
-	    !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
-	    ((dir == DMA_FROM_DEVICE) || (dir == DMA_BIDIRECTIONAL)))
-		swiotlb_bounce(orig_addr, tlb_addr, mapping_size, DMA_FROM_DEVICE);
+	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
+	    (dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL))
+		swiotlb_bounce(hwdev, tlb_addr, mapping_size, DMA_FROM_DEVICE);
 
 	/*
 	 * Return the buffer to the free list by setting the corresponding
@@ -721,27 +719,16 @@ void swiotlb_tbl_sync_single(struct device *hwdev, phys_addr_t tlb_addr,
 			     size_t size, enum dma_data_direction dir,
 			     enum dma_sync_target target)
 {
-	int index = (tlb_addr - io_tlb_start) >> IO_TLB_SHIFT;
-	size_t alloc_size = io_tlb_alloc_size[index];
-	phys_addr_t orig_addr = io_tlb_orig_addr[index];
-
-	if (orig_addr == INVALID_PHYS_ADDR)
-		return;
-
-	validate_sync_size_and_truncate(hwdev, alloc_size, &size);
-
 	switch (target) {
 	case SYNC_FOR_CPU:
 		if (likely(dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL))
-			swiotlb_bounce(orig_addr, tlb_addr,
-				       size, DMA_FROM_DEVICE);
+			swiotlb_bounce(hwdev, tlb_addr, size, DMA_FROM_DEVICE);
 		else
 			BUG_ON(dir != DMA_TO_DEVICE);
 		break;
 	case SYNC_FOR_DEVICE:
 		if (likely(dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL))
-			swiotlb_bounce(orig_addr, tlb_addr,
-				       size, DMA_TO_DEVICE);
+			swiotlb_bounce(hwdev, tlb_addr, size, DMA_TO_DEVICE);
 		else
 			BUG_ON(dir != DMA_FROM_DEVICE);
 		break;
-- 
2.29.2

