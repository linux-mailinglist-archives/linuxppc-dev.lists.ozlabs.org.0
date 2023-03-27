Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 651D46CA41B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:29:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlXFd1cB8z3g66
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:29:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LeIWTWJl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LeIWTWJl;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlWy46c94z3fR8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:16:28 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 77DF7B81186;
	Mon, 27 Mar 2023 12:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13EE3C433AC;
	Mon, 27 Mar 2023 12:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679919385;
	bh=z4o74QJO2HbXUwmw9wKbmWzDWd6hXoo60uihfOQ+9AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LeIWTWJl7na8lr1HDpXLEID7w40kD3jUGlqyEdLIjp28/W62Bg2Q01Di95UzrKvRG
	 HJPQ86ajlp3iCoZ3CJayJ9d+7TXVGDKXmF4H9pFJrUDGFmaBQ1sxvyiJllRmrJgLiW
	 kC23F7Igb+UcfCgn+A3+gD/4+YvQeXUupIIuvr0FfATyUyZ8zELrbCiAvyv4ru8qIH
	 aoWdr4S3g5t8VzyZGuK2ajzBYoNZaX0/7e8Xyof9vCg5r1OYOOAEwSmcelSSXNNM+u
	 9342trVskeAxtOQIo4GHu8vegYfBrfg6AvF+3aPu6K84TrrA9KjWBg30daulsN+rpN
	 khfEwXxa706kA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 17/21] ARM: dma-mapping: use arch_sync_dma_for_{device,cpu}() internally
Date: Mon, 27 Mar 2023 14:13:13 +0200
Message-Id: <20230327121317.4081816-18-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327121317.4081816-1-arnd@kernel.org>
References: <20230327121317.4081816-1-arnd@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Michal Sime
 k <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, linux-oxnas@groups.io, Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

The arm specific iommu code in dma-mapping.c uses the page+offset based
__dma_page_cpu_to_dev()/__dma_page_dev_to_cpu() helpers in place of the
phys_addr_t based arch_sync_dma_for_device()/arch_sync_dma_for_cpu()
wrappers around the.

In order to be able to move the latter part set of functions into
common code, change the iommu implementation to use them directly
and remove the internal ones as a separate interface.

As page+offset and phys_address are equivalent, but are used in
different parts of the code here, this allows removing some of
the conversion but adds them elsewhere.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mm/dma-mapping.c | 93 ++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 60 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 8bc01071474a..ce4b74f34a58 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -622,16 +622,14 @@ static void __arm_dma_free(struct device *dev, size_t size, void *cpu_addr,
 	kfree(buf);
 }
 
-static void dma_cache_maint_page(struct page *page, unsigned long offset,
+static void dma_cache_maint(phys_addr_t paddr,
 	size_t size, enum dma_data_direction dir,
 	void (*op)(const void *, size_t, int))
 {
-	unsigned long pfn;
+	unsigned long pfn = PFN_DOWN(paddr);
+	unsigned long offset = paddr % PAGE_SIZE;
 	size_t left = size;
 
-	pfn = page_to_pfn(page) + offset / PAGE_SIZE;
-	offset %= PAGE_SIZE;
-
 	/*
 	 * A single sg entry may refer to multiple physically contiguous
 	 * pages.  But we still need to process highmem pages individually.
@@ -641,8 +639,7 @@ static void dma_cache_maint_page(struct page *page, unsigned long offset,
 	do {
 		size_t len = left;
 		void *vaddr;
-
-		page = pfn_to_page(pfn);
+		struct page *page = pfn_to_page(pfn);
 
 		if (PageHighMem(page)) {
 			if (len + offset > PAGE_SIZE)
@@ -674,14 +671,11 @@ static void dma_cache_maint_page(struct page *page, unsigned long offset,
  * Note: Drivers should NOT use this function directly.
  * Use the driver DMA support - see dma-mapping.h (dma_sync_*)
  */
-static void __dma_page_cpu_to_dev(struct page *page, unsigned long off,
-	size_t size, enum dma_data_direction dir)
+void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
+		enum dma_data_direction dir)
 {
-	phys_addr_t paddr;
+	dma_cache_maint(paddr, size, dir, dmac_map_area);
 
-	dma_cache_maint_page(page, off, size, dir, dmac_map_area);
-
-	paddr = page_to_phys(page) + off;
 	if (dir == DMA_FROM_DEVICE) {
 		outer_inv_range(paddr, paddr + size);
 	} else {
@@ -690,34 +684,30 @@ static void __dma_page_cpu_to_dev(struct page *page, unsigned long off,
 	/* FIXME: non-speculating: flush on bidirectional mappings? */
 }
 
-static void __dma_page_dev_to_cpu(struct page *page, unsigned long off,
-	size_t size, enum dma_data_direction dir)
+void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
+		enum dma_data_direction dir)
 {
-	phys_addr_t paddr = page_to_phys(page) + off;
-
 	/* FIXME: non-speculating: not required */
 	/* in any case, don't bother invalidating if DMA to device */
 	if (dir != DMA_TO_DEVICE) {
 		outer_inv_range(paddr, paddr + size);
 
-		dma_cache_maint_page(page, off, size, dir, dmac_unmap_area);
+		dma_cache_maint(paddr, size, dir, dmac_unmap_area);
 	}
 
 	/*
 	 * Mark the D-cache clean for these pages to avoid extra flushing.
 	 */
 	if (dir != DMA_TO_DEVICE && size >= PAGE_SIZE) {
-		unsigned long pfn;
+		unsigned long pfn = PFN_UP(paddr);
+		unsigned long off = paddr & (PAGE_SIZE - 1);
 		size_t left = size;
 
-		pfn = page_to_pfn(page) + off / PAGE_SIZE;
-		off %= PAGE_SIZE;
-		if (off) {
-			pfn++;
+		if (off)
 			left -= PAGE_SIZE - off;
-		}
+
 		while (left >= PAGE_SIZE) {
-			page = pfn_to_page(pfn++);
+			struct page *page = pfn_to_page(pfn++);
 			set_bit(PG_dcache_clean, &page->flags);
 			left -= PAGE_SIZE;
 		}
@@ -1204,7 +1194,7 @@ static int __map_sg_chunk(struct device *dev, struct scatterlist *sg,
 		unsigned int len = PAGE_ALIGN(s->offset + s->length);
 
 		if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-			__dma_page_cpu_to_dev(sg_page(s), s->offset, s->length, dir);
+			arch_sync_dma_for_device(phys + s->offset, s->length, dir);
 
 		prot = __dma_info_to_prot(dir, attrs);
 
@@ -1306,8 +1296,7 @@ static void arm_iommu_unmap_sg(struct device *dev,
 			__iommu_remove_mapping(dev, sg_dma_address(s),
 					       sg_dma_len(s));
 		if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-			__dma_page_dev_to_cpu(sg_page(s), s->offset,
-					      s->length, dir);
+			arch_sync_dma_for_cpu(sg_phys(s), s->length, dir);
 	}
 }
 
@@ -1329,7 +1318,7 @@ static void arm_iommu_sync_sg_for_cpu(struct device *dev,
 		return;
 
 	for_each_sg(sg, s, nents, i)
-		__dma_page_dev_to_cpu(sg_page(s), s->offset, s->length, dir);
+		arch_sync_dma_for_cpu(sg_phys(s), s->length, dir);
 
 }
 
@@ -1351,7 +1340,8 @@ static void arm_iommu_sync_sg_for_device(struct device *dev,
 		return;
 
 	for_each_sg(sg, s, nents, i)
-		__dma_page_cpu_to_dev(sg_page(s), s->offset, s->length, dir);
+		arch_sync_dma_for_device(page_to_phys(sg_page(s)) + s->offset,
+					 s->length, dir);
 }
 
 /**
@@ -1373,7 +1363,8 @@ static dma_addr_t arm_iommu_map_page(struct device *dev, struct page *page,
 	int ret, prot, len = PAGE_ALIGN(size + offset);
 
 	if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		__dma_page_cpu_to_dev(page, offset, size, dir);
+		arch_sync_dma_for_device(page_to_phys(page) + offset,
+					 size, dir);
 
 	dma_addr = __alloc_iova(mapping, len);
 	if (dma_addr == DMA_MAPPING_ERROR)
@@ -1406,7 +1397,7 @@ static void arm_iommu_unmap_page(struct device *dev, dma_addr_t handle,
 {
 	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
 	dma_addr_t iova = handle & PAGE_MASK;
-	struct page *page;
+	phys_addr_t phys;
 	int offset = handle & ~PAGE_MASK;
 	int len = PAGE_ALIGN(size + offset);
 
@@ -1414,8 +1405,8 @@ static void arm_iommu_unmap_page(struct device *dev, dma_addr_t handle,
 		return;
 
 	if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
-		page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
-		__dma_page_dev_to_cpu(page, offset, size, dir);
+		phys = iommu_iova_to_phys(mapping->domain, handle);
+		arch_sync_dma_for_cpu(phys, size, dir);
 	}
 
 	iommu_unmap(mapping->domain, iova, len);
@@ -1483,30 +1474,26 @@ static void arm_iommu_sync_single_for_cpu(struct device *dev,
 		dma_addr_t handle, size_t size, enum dma_data_direction dir)
 {
 	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
-	dma_addr_t iova = handle & PAGE_MASK;
-	struct page *page;
-	unsigned int offset = handle & ~PAGE_MASK;
+	phys_addr_t phys;
 
-	if (dev->dma_coherent || !iova)
+	if (dev->dma_coherent || !(handle & PAGE_MASK))
 		return;
 
-	page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
-	__dma_page_dev_to_cpu(page, offset, size, dir);
+	phys = iommu_iova_to_phys(mapping->domain, handle);
+	arch_sync_dma_for_cpu(phys, size, dir);
 }
 
 static void arm_iommu_sync_single_for_device(struct device *dev,
 		dma_addr_t handle, size_t size, enum dma_data_direction dir)
 {
 	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
-	dma_addr_t iova = handle & PAGE_MASK;
-	struct page *page;
-	unsigned int offset = handle & ~PAGE_MASK;
+	phys_addr_t phys;
 
-	if (dev->dma_coherent || !iova)
+	if (dev->dma_coherent || !(handle & PAGE_MASK))
 		return;
 
-	page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
-	__dma_page_cpu_to_dev(page, offset, size, dir);
+	phys = iommu_iova_to_phys(mapping->domain, handle);
+	arch_sync_dma_for_device(phys, size, dir);
 }
 
 static const struct dma_map_ops iommu_ops = {
@@ -1789,20 +1776,6 @@ void arch_teardown_dma_ops(struct device *dev)
 	set_dma_ops(dev, NULL);
 }
 
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
-{
-	__dma_page_cpu_to_dev(phys_to_page(paddr), paddr & (PAGE_SIZE - 1),
-			      size, dir);
-}
-
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
-{
-	__dma_page_dev_to_cpu(phys_to_page(paddr), paddr & (PAGE_SIZE - 1),
-			      size, dir);
-}
-
 void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 		gfp_t gfp, unsigned long attrs)
 {
-- 
2.39.2

