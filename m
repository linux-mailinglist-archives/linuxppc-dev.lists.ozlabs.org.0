Return-Path: <linuxppc-dev+bounces-12898-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B29ABDDA27
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 11:13:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmlk66bkfz3d2B;
	Wed, 15 Oct 2025 20:13:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760519598;
	cv=none; b=LlF0FIWdBrgQRKE9PN0/hx4teydleOaUYEr+babX0+/5+3O95e1Nt+lTiIJcD8SPBSR1tHziowXIamwKVEVP52zQloFl0a5/52krqrg7emH6XniRtiTpVvKIjqHIT65oIAqa5ngc3uez4w9EsjePa1iZDethVAXIIdhObZaAyQeXiWRTb1hjOzw2ngiVxIgj+2Js12a5Yn9JcCHClZB+H4ue1kHvUODOmewnV45xAHxcsL/m5jq35QCv8TWuK44jKIQez1fyhA8gfUB0uOz9VJykfHMkmd2ahYcdmocIjiEF1rZzyTiMLU42CDOWEXr2uR1V+58UJ/iZnPHiFBaR0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760519598; c=relaxed/relaxed;
	bh=hKwEkCXXPBhGWp9pQlBLVaD0gEElKNKMaLPB7yCkgDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IIycMxwldEG69CeBnkSYoX2ue+sTzotNicoh6kzVosR1taqOlxPWnZE7lkp4dNTpW4h1DHwAANE8mO9v7bayNoLfX/000YcuSsw4Me/Ny8BbM8slDAudEj8XObgWdW76vHiz5sGsKb+5K2qQPa7xXB/mWFZEV2DlIk5RmMbCx4A8rT81hAIsKf3phgnOwDVmm5fVo7E1SMXlA3Gd6t+86K8XlLAeOKzsb979BneUkojTRSAkrt0N0arkiD6wypZnsSb9QBwcn7qaTSpextP3IuGne6rV+kC8vdCsMxz42kV+nG+UJENniua3JmDzzpVjok4dzUBNIx6azzZ8MDJ08A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GfGSWwPL; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GfGSWwPL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmlk616Zjz3d26
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 20:13:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CDBA04A2EB;
	Wed, 15 Oct 2025 09:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1D2C116B1;
	Wed, 15 Oct 2025 09:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519595;
	bh=5CRzqWoVfMbqVNKIxqeoLG2c9tvgUeIFTheShsK3Bpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GfGSWwPLGtufj1swQ+n7QEGSAHQU77k7sZmwzSh3gwKsGKxwUSyhBd87hWhNEvtrl
	 buUMXV+6O8Xu+JxlDnDhIv9r0IAD1Z0RfPmMTvm1RhyHnAh54jr/kk/B9gEmZKEBfq
	 dyxPWuZk9aaW/5ysGOs3Lh2Xkuvkf8W36g0+yC8l1lZWgZR6XZvww3OdFVbQSeWbZ3
	 DBSlpFZzMALBmjKmlRreacKzyXlQmKcW4asQus02qvoKR7vSSnohS8I3XGMqS/YvX5
	 rvbOkMGDjGPOblMmmEof5eGSRnxj8+iqK6wr/OfWoF9xmDM6qaQh/HQoZtd5IhimPH
	 5sCcW9rpImS9g==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v5 03/14] ARM: dma-mapping: Reduce struct page exposure in arch_sync_dma*()
Date: Wed, 15 Oct 2025 12:12:49 +0300
Message-ID: <20251015-remove-map-page-v5-3-3bbfe3a25cdf@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Leon Romanovsky <leonro@nvidia.com>

As a preparation to changing from .map_page to use .map_phys DMA
callbacks, convert arch_sync_dma*() functions to use physical addresses
instead of struct page.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/arm/mm/dma-mapping.c | 82 ++++++++++++++++++-----------------------------
 1 file changed, 31 insertions(+), 51 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 08641a936394..b0310d6762d5 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -624,16 +624,14 @@ static void __arm_dma_free(struct device *dev, size_t size, void *cpu_addr,
 	kfree(buf);
 }
 
-static void dma_cache_maint_page(struct page *page, unsigned long offset,
-	size_t size, enum dma_data_direction dir,
+static void dma_cache_maint_page(phys_addr_t phys, size_t size,
+	enum dma_data_direction dir,
 	void (*op)(const void *, size_t, int))
 {
-	unsigned long pfn;
+	unsigned long offset = offset_in_page(phys);
+	unsigned long pfn = __phys_to_pfn(phys);
 	size_t left = size;
 
-	pfn = page_to_pfn(page) + offset / PAGE_SIZE;
-	offset %= PAGE_SIZE;
-
 	/*
 	 * A single sg entry may refer to multiple physically contiguous
 	 * pages.  But we still need to process highmem pages individually.
@@ -644,17 +642,18 @@ static void dma_cache_maint_page(struct page *page, unsigned long offset,
 		size_t len = left;
 		void *vaddr;
 
-		page = pfn_to_page(pfn);
-
-		if (PageHighMem(page)) {
+		phys = __pfn_to_phys(pfn);
+		if (PhysHighMem(phys)) {
 			if (len + offset > PAGE_SIZE)
 				len = PAGE_SIZE - offset;
 
 			if (cache_is_vipt_nonaliasing()) {
-				vaddr = kmap_atomic(page);
+				vaddr = kmap_atomic_pfn(pfn);
 				op(vaddr + offset, len, dir);
 				kunmap_atomic(vaddr);
 			} else {
+				struct page *page = phys_to_page(phys);
+
 				vaddr = kmap_high_get(page);
 				if (vaddr) {
 					op(vaddr + offset, len, dir);
@@ -662,7 +661,8 @@ static void dma_cache_maint_page(struct page *page, unsigned long offset,
 				}
 			}
 		} else {
-			vaddr = page_address(page) + offset;
+			phys += offset;
+			vaddr = phys_to_virt(phys);
 			op(vaddr, len, dir);
 		}
 		offset = 0;
@@ -676,14 +676,11 @@ static void dma_cache_maint_page(struct page *page, unsigned long offset,
  * Note: Drivers should NOT use this function directly.
  * Use the driver DMA support - see dma-mapping.h (dma_sync_*)
  */
-static void __dma_page_cpu_to_dev(struct page *page, unsigned long off,
-	size_t size, enum dma_data_direction dir)
+void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
+			      enum dma_data_direction dir)
 {
-	phys_addr_t paddr;
-
-	dma_cache_maint_page(page, off, size, dir, dmac_map_area);
+	dma_cache_maint_page(paddr, size, dir, dmac_map_area);
 
-	paddr = page_to_phys(page) + off;
 	if (dir == DMA_FROM_DEVICE) {
 		outer_inv_range(paddr, paddr + size);
 	} else {
@@ -692,17 +689,15 @@ static void __dma_page_cpu_to_dev(struct page *page, unsigned long off,
 	/* FIXME: non-speculating: flush on bidirectional mappings? */
 }
 
-static void __dma_page_dev_to_cpu(struct page *page, unsigned long off,
-	size_t size, enum dma_data_direction dir)
+void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
+			   enum dma_data_direction dir)
 {
-	phys_addr_t paddr = page_to_phys(page) + off;
-
 	/* FIXME: non-speculating: not required */
 	/* in any case, don't bother invalidating if DMA to device */
 	if (dir != DMA_TO_DEVICE) {
 		outer_inv_range(paddr, paddr + size);
 
-		dma_cache_maint_page(page, off, size, dir, dmac_unmap_area);
+		dma_cache_maint_page(paddr, size, dir, dmac_unmap_area);
 	}
 
 	/*
@@ -1205,7 +1200,7 @@ static int __map_sg_chunk(struct device *dev, struct scatterlist *sg,
 		unsigned int len = PAGE_ALIGN(s->offset + s->length);
 
 		if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-			__dma_page_cpu_to_dev(sg_page(s), s->offset, s->length, dir);
+			arch_sync_dma_for_device(sg_phys(s), s->length, dir);
 
 		prot = __dma_info_to_prot(dir, attrs);
 
@@ -1307,8 +1302,7 @@ static void arm_iommu_unmap_sg(struct device *dev,
 			__iommu_remove_mapping(dev, sg_dma_address(s),
 					       sg_dma_len(s));
 		if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-			__dma_page_dev_to_cpu(sg_page(s), s->offset,
-					      s->length, dir);
+			arch_sync_dma_for_cpu(sg_phys(s), s->length, dir);
 	}
 }
 
@@ -1330,7 +1324,7 @@ static void arm_iommu_sync_sg_for_cpu(struct device *dev,
 		return;
 
 	for_each_sg(sg, s, nents, i)
-		__dma_page_dev_to_cpu(sg_page(s), s->offset, s->length, dir);
+		arch_sync_dma_for_cpu(sg_phys(s), s->length, dir);
 
 }
 
@@ -1352,7 +1346,7 @@ static void arm_iommu_sync_sg_for_device(struct device *dev,
 		return;
 
 	for_each_sg(sg, s, nents, i)
-		__dma_page_cpu_to_dev(sg_page(s), s->offset, s->length, dir);
+		arch_sync_dma_for_device(sg_phys(s), s->length, dir);
 }
 
 /**
@@ -1374,7 +1368,7 @@ static dma_addr_t arm_iommu_map_page(struct device *dev, struct page *page,
 	int ret, prot, len = PAGE_ALIGN(size + offset);
 
 	if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		__dma_page_cpu_to_dev(page, offset, size, dir);
+		arch_sync_dma_for_device(page_to_phys(page), offset, size, dir);
 
 	dma_addr = __alloc_iova(mapping, len);
 	if (dma_addr == DMA_MAPPING_ERROR)
@@ -1407,7 +1401,6 @@ static void arm_iommu_unmap_page(struct device *dev, dma_addr_t handle,
 {
 	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
 	dma_addr_t iova = handle & PAGE_MASK;
-	struct page *page;
 	int offset = handle & ~PAGE_MASK;
 	int len = PAGE_ALIGN(size + offset);
 
@@ -1415,8 +1408,9 @@ static void arm_iommu_unmap_page(struct device *dev, dma_addr_t handle,
 		return;
 
 	if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
-		page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
-		__dma_page_dev_to_cpu(page, offset, size, dir);
+		phys_addr_t phys = iommu_iova_to_phys(mapping->domain, iova);
+
+		arch_sync_dma_for_cpu(phys + offset, size, dir);
 	}
 
 	iommu_unmap(mapping->domain, iova, len);
@@ -1485,14 +1479,14 @@ static void arm_iommu_sync_single_for_cpu(struct device *dev,
 {
 	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
 	dma_addr_t iova = handle & PAGE_MASK;
-	struct page *page;
 	unsigned int offset = handle & ~PAGE_MASK;
+	phys_addr_t phys;
 
 	if (dev->dma_coherent || !iova)
 		return;
 
-	page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
-	__dma_page_dev_to_cpu(page, offset, size, dir);
+	phys = iommu_iova_to_phys(mapping->domain, iova);
+	arch_sync_dma_for_cpu(phys + offset, size, dir);
 }
 
 static void arm_iommu_sync_single_for_device(struct device *dev,
@@ -1500,14 +1494,14 @@ static void arm_iommu_sync_single_for_device(struct device *dev,
 {
 	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
 	dma_addr_t iova = handle & PAGE_MASK;
-	struct page *page;
 	unsigned int offset = handle & ~PAGE_MASK;
+	phys_addr_t phys;
 
 	if (dev->dma_coherent || !iova)
 		return;
 
-	page = phys_to_page(iommu_iova_to_phys(mapping->domain, iova));
-	__dma_page_cpu_to_dev(page, offset, size, dir);
+	phys = iommu_iova_to_phys(mapping->domain, iova);
+	arch_sync_dma_for_device(phys + offset, size, dir);
 }
 
 static const struct dma_map_ops iommu_ops = {
@@ -1794,20 +1788,6 @@ void arch_teardown_dma_ops(struct device *dev)
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
2.51.0


