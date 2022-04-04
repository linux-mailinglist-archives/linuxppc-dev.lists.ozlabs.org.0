Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E964F0F02
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 07:14:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KWzTz6qkWz3f1f
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 15:14:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FBiz0wC3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+8f3f264ef3f87e17849e+6798+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=FBiz0wC3; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KWzKT5CJyz3bYl
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Apr 2022 15:07:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=aq2ni6Lf0CpK3df5eW6dRpDmxtP8L4VBzIRLdPcEzSo=; b=FBiz0wC3YdrPGDM0rdnH/qoGXA
 VYkDtbQpvt2fI8ej400Q1jc2XmYfkdsJ5sE/ZOz4pKo2/9MdZM9x9UHa3H5PMeDKeY/LcdX4E+KDO
 TOzPsd2Euc9j1OdgmqwiGDrKzCCtMxHdYTKsyUCOMAAMqNNycXBgqAHiPNMb4ONOT9i1diZ/+B09o
 M3/pusVbyC+/w8inru8UWPzaVJOWCq3Q5YnUtzqnCsGkRRX8gHCRyEiI5lE6Ssa64NZBLBEtSPKlD
 QVo7JR+VeYC5vuM6HijKXTbzEPEucQfhkqCMgL0AlxsrHY7gO/+OUWB8pxQq6WhaYYOWAzLYgtVhj
 s35TimYQ==;
Received: from 089144211060.atnat0020.highway.a1.net ([89.144.211.60]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbEvW-00D9L3-0A; Mon, 04 Apr 2022 05:06:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 12/15] swiotlb: provide swiotlb_init variants that remap the
 buffer
Date: Mon,  4 Apr 2022 07:05:56 +0200
Message-Id: <20220404050559.132378-13-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220404050559.132378-1-hch@lst.de>
References: <20220404050559.132378-1-hch@lst.de>
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

To shared more code between swiotlb and xen-swiotlb, offer a
swiotlb_init_remap interface and add a remap callback to
swiotlb_init_late that will allow Xen to remap the buffer the
buffer without duplicating much of the logic.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/pci/sta2x11-fixup.c |  2 +-
 include/linux/swiotlb.h      |  5 ++++-
 kernel/dma/swiotlb.c         | 36 +++++++++++++++++++++++++++++++++---
 3 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/arch/x86/pci/sta2x11-fixup.c b/arch/x86/pci/sta2x11-fixup.c
index c7e6faf59a861..7368afc039987 100644
--- a/arch/x86/pci/sta2x11-fixup.c
+++ b/arch/x86/pci/sta2x11-fixup.c
@@ -57,7 +57,7 @@ static void sta2x11_new_instance(struct pci_dev *pdev)
 		int size = STA2X11_SWIOTLB_SIZE;
 		/* First instance: register your own swiotlb area */
 		dev_info(&pdev->dev, "Using SWIOTLB (size %i)\n", size);
-		if (swiotlb_init_late(size, GFP_DMA))
+		if (swiotlb_init_late(size, GFP_DMA, NULL))
 			dev_emerg(&pdev->dev, "init swiotlb failed\n");
 	}
 	list_add(&instance->list, &sta2x11_instance_list);
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index ee655f2e4d28b..7b50c82f84ce9 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -36,8 +36,11 @@ struct scatterlist;
 
 int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, unsigned int flags);
 unsigned long swiotlb_size_or_default(void);
+void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
+	int (*remap)(void *tlb, unsigned long nslabs));
+int swiotlb_init_late(size_t size, gfp_t gfp_mask,
+	int (*remap)(void *tlb, unsigned long nslabs));
 extern int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs);
-int swiotlb_init_late(size_t size, gfp_t gfp_mask);
 extern void __init swiotlb_update_mem_attributes(void);
 
 phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 119187afc65ec..d5fe8f5e08300 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -256,9 +256,11 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs,
  * Statically reserve bounce buffer space and initialize bounce buffer data
  * structures for the software IO TLB used to implement the DMA API.
  */
-void __init swiotlb_init(bool addressing_limit, unsigned int flags)
+void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
+		int (*remap)(void *tlb, unsigned long nslabs))
 {
-	size_t bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
+	unsigned long nslabs = default_nslabs;
+	size_t bytes;
 	void *tlb;
 
 	if (!addressing_limit && !swiotlb_force_bounce)
@@ -271,12 +273,23 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
 	 * allow to pick a location everywhere for hypervisors with guest
 	 * memory encryption.
 	 */
+retry:
+	bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
 	if (flags & SWIOTLB_ANY)
 		tlb = memblock_alloc(bytes, PAGE_SIZE);
 	else
 		tlb = memblock_alloc_low(bytes, PAGE_SIZE);
 	if (!tlb)
 		goto fail;
+	if (remap && remap(tlb, nslabs) < 0) {
+		memblock_free(tlb, PAGE_ALIGN(bytes));
+
+		nslabs = ALIGN(nslabs >> 1, IO_TLB_SEGSIZE);
+		if (nslabs < IO_TLB_MIN_SLABS)
+			panic("%s: Failed to remap %zu bytes\n",
+			      __func__, bytes);
+		goto retry;
+	}
 	if (swiotlb_init_with_tbl(tlb, default_nslabs, flags))
 		goto fail_free_mem;
 	return;
@@ -287,12 +300,18 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
 	pr_warn("Cannot allocate buffer");
 }
 
+void __init swiotlb_init(bool addressing_limit, unsigned int flags)
+{
+	return swiotlb_init_remap(addressing_limit, flags, NULL);
+}
+
 /*
  * Systems with larger DMA zones (those that don't support ISA) can
  * initialize the swiotlb later using the slab allocator if needed.
  * This should be just like above, but with some error catching.
  */
-int swiotlb_init_late(size_t size, gfp_t gfp_mask)
+int swiotlb_init_late(size_t size, gfp_t gfp_mask,
+		int (*remap)(void *tlb, unsigned long nslabs))
 {
 	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
 	unsigned long bytes;
@@ -303,6 +322,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask)
 	if (swiotlb_force_disable)
 		return 0;
 
+retry:
 	order = get_order(nslabs << IO_TLB_SHIFT);
 	nslabs = SLABS_PER_PAGE << order;
 	bytes = nslabs << IO_TLB_SHIFT;
@@ -323,6 +343,16 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask)
 			(PAGE_SIZE << order) >> 20);
 		nslabs = SLABS_PER_PAGE << order;
 	}
+	if (remap)
+		rc = remap(vstart, nslabs);
+	if (rc) {
+		free_pages((unsigned long)vstart, order);
+ 
+		nslabs = ALIGN(nslabs >> 1, IO_TLB_SEGSIZE);
+		if (nslabs < IO_TLB_MIN_SLABS)
+			return rc;
+		goto retry;
+	}
 	rc = swiotlb_late_init_with_tbl(vstart, nslabs);
 	if (rc)
 		free_pages((unsigned long)vstart, order);
-- 
2.30.2

