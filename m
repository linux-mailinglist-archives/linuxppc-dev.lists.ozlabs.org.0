Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F601A7EE3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 15:53:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491n5c3FPmzDq6y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 23:53:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+4a22011dcb1da0b09bf4+6078+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=Gr3oT3Mb; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491mDG2q9szDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 23:14:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ShK5Me996gVFjNoA46gSO+1ycU7xfG9bvtmEJ4mSn6s=; b=Gr3oT3MbHE1JOk/VPGzX5p9T2C
 pTRrcuDzDM0N9/oba/OZkbq5svnWZVBlH/6k5PMc0AqFZzCkj/PMuazbQoCsdggoTOPpPMTN+Jdw2
 1vmgS5AmZsgc6NwRBlVqa4RUyo3fHcLRPDbEtgEsdcEkc3l2NwGMcLHeME4MekGImgf7hBX8yy4Ew
 Oe95oE5TymCplZ9T3ksxsI0AVAMkqZkZV0r2tIOfpkOySKtGKKkdx++daKuS2Vo9G7jTv6BgK5hJ5
 Mk4L0fksjwF4nsmuYh+vyOfrO+Rb8kVGGsUGg7IByh/BRa5VeZFFEMAjQ3y4O828yMhlGVVEbn/0g
 n++3f03w==;
Received: from [2001:4bb8:180:384b:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOLOC-0006Q5-O2; Tue, 14 Apr 2020 13:14:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 x86@kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Laura Abbott <labbott@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>
Subject: [PATCH 05/29] dma-mapping: use vmap insted of reimplementing it
Date: Tue, 14 Apr 2020 15:13:24 +0200
Message-Id: <20200414131348.444715-6-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414131348.444715-1-hch@lst.de>
References: <20200414131348.444715-1-hch@lst.de>
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
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-s390@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org, bpf@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace the open coded instance of vmap with the actual function.  In
the non-contiguous (IOMMU) case this requires an extra find_vm_area,
but given that this isn't a fast path function that is a small price
to pay.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/dma/remap.c | 48 ++++++++++++----------------------------------
 1 file changed, 12 insertions(+), 36 deletions(-)

diff --git a/kernel/dma/remap.c b/kernel/dma/remap.c
index d14cbc83986a..914ff5a58dd5 100644
--- a/kernel/dma/remap.c
+++ b/kernel/dma/remap.c
@@ -20,23 +20,6 @@ struct page **dma_common_find_pages(void *cpu_addr)
 	return area->pages;
 }
 
-static struct vm_struct *__dma_common_pages_remap(struct page **pages,
-			size_t size, pgprot_t prot, const void *caller)
-{
-	struct vm_struct *area;
-
-	area = get_vm_area_caller(size, VM_DMA_COHERENT, caller);
-	if (!area)
-		return NULL;
-
-	if (map_vm_area(area, prot, pages)) {
-		vunmap(area->addr);
-		return NULL;
-	}
-
-	return area;
-}
-
 /*
  * Remaps an array of PAGE_SIZE pages into another vm_area.
  * Cannot be used in non-sleeping contexts
@@ -44,15 +27,12 @@ static struct vm_struct *__dma_common_pages_remap(struct page **pages,
 void *dma_common_pages_remap(struct page **pages, size_t size,
 			 pgprot_t prot, const void *caller)
 {
-	struct vm_struct *area;
+	void *vaddr;
 
-	area = __dma_common_pages_remap(pages, size, prot, caller);
-	if (!area)
-		return NULL;
-
-	area->pages = pages;
-
-	return area->addr;
+	vaddr = vmap(pages, size >> PAGE_SHIFT, VM_DMA_COHERENT, prot);
+	if (vaddr)
+		find_vm_area(vaddr)->pages = pages;
+	return vaddr;
 }
 
 /*
@@ -62,24 +42,20 @@ void *dma_common_pages_remap(struct page **pages, size_t size,
 void *dma_common_contiguous_remap(struct page *page, size_t size,
 			pgprot_t prot, const void *caller)
 {
-	int i;
+	int count = size >> PAGE_SHIFT;
 	struct page **pages;
-	struct vm_struct *area;
+	void *vaddr;
+	int i;
 
-	pages = kmalloc(sizeof(struct page *) << get_order(size), GFP_KERNEL);
+	pages = kmalloc_array(count, sizeof(struct page *), GFP_KERNEL);
 	if (!pages)
 		return NULL;
-
-	for (i = 0; i < (size >> PAGE_SHIFT); i++)
+	for (i = 0; i < count; i++)
 		pages[i] = nth_page(page, i);
-
-	area = __dma_common_pages_remap(pages, size, prot, caller);
-
+	vaddr = vmap(pages, count, VM_DMA_COHERENT, prot);
 	kfree(pages);
 
-	if (!area)
-		return NULL;
-	return area->addr;
+	return vaddr;
 }
 
 /*
-- 
2.25.1

