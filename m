Return-Path: <linuxppc-dev+bounces-12606-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B30ABA733D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Sep 2025 17:03:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cZSHj5f9Wz3clx;
	Mon, 29 Sep 2025 01:03:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759071793;
	cv=none; b=jm+HMiRwmGU2q//FKBuSUe0BsgHiACLTzo42/yE7OlOGar7TihH0NP7YPtq6gCxUPWL39PYZL6BXUHRppU58kEKcCPC0OxBDj0s48Z7UiaiFIfxMGX3ORk5FZNic4P7sBurkfCBA6OcZdA1w3Ou2MDC48BiSDOVHTOJ/udg3xN/1txkz3piGre6fHjx3STi3xjdHBJCcviN65a+k904I7Io9OSU8sgOV16FEK8+Jzz+hpNWH7Rv7+IdPMvEYuVdmriaZs1xqBp87Gg1aY82ewoYUfTdWWwC0FPonyJ4eYocDlfUpC5XzYrnm80gdc/3nkjV9rWTnmI5Y2LFma3IXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759071793; c=relaxed/relaxed;
	bh=DE1Wz+STcYwD9DRkiNgH2T6wXyb2yTJdgByyqa46faE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=czVGEdeHoDMoibFBX+AB7thS07vokjwAUfR95cIY/OztBy99LzSg/miAnOMyLkShIJieb4PoYXNhbFeR8VT/9m2haX3QMDKGRQpL5nWEhH0WoDAKXuwBQY5broNxjsx7QvnyD6bkEoklLWXy8t3z9uAQIux4oipcm4UrcsqUNn2jfNUTVdFwJF1ZFgg3LwWaXNohD+cWrJ4VY/fHYXflP10bG01ng2PxgAQkM0A9yjk/Lckptx2B8vbbANsKphgN9RkRUxiiAJg3RWoRgGnE3hpuIlK22dNHsaP9hjsiyMc99+HfcfJof45gXpMYcuEFnGOnWdzgplhg/VGHb1gV6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BZGDDUcP; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BZGDDUcP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cZSHh6tzkz3cZN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Sep 2025 01:03:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 12C966219A;
	Sun, 28 Sep 2025 15:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01657C4CEF0;
	Sun, 28 Sep 2025 15:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759071790;
	bh=WDOUet2h6wKH1CUP8FV6nMSpLTCbpgYokkGnWTBO1ug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BZGDDUcPv5ei5QmxE/Cb/GBl9Is3jwf+abjfL/T6FlKKDgd7o0SAAJ3DrLeOOxbT2
	 o0ouvmXHTBwdK2d3X69VTKxsccD2N+rDKl2rOOIbofTG0j98oZmecLqLOsDrfi9I1H
	 +jxiGxFnis3M3/StOQO14SMGRRjYxShVKHrZ+0ivygrgODGeAceIKhswn247oAoqzi
	 oGq1ezgkaJlcv65W0NAA1z/YU0H+tvfjhFduVH/BnAlPtpVXNs+BneD71FIxKPdJ+6
	 6XlbC7ZHDc2DVm8WhA5XUVOgjfQFhKz/s+S4IObV34WfPpto4itSg4V0zn2We7HBNA
	 +tD2qMpibdTNQ==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>,
	Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>,
	iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Jason Wang <jasowang@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v1 5/9] sparc64: Use physical address DMA mapping
Date: Sun, 28 Sep 2025 18:02:25 +0300
Message-ID: <bac909dab3c82fc6a7a4f5a31f22bac9a69f7f07.1759071169.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1759071169.git.leon@kernel.org>
References: <cover.1759071169.git.leon@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Leon Romanovsky <leonro@nvidia.com>

Convert sparc architecture DMA code to use .map_phys callback.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/sparc/kernel/iommu.c     | 16 ++++++------
 arch/sparc/kernel/pci_sun4v.c | 16 ++++++------
 arch/sparc/mm/io-unit.c       | 13 +++++-----
 arch/sparc/mm/iommu.c         | 46 ++++++++++++++++++-----------------
 4 files changed, 48 insertions(+), 43 deletions(-)

diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
index da0363692528..288301d2398a 100644
--- a/arch/sparc/kernel/iommu.c
+++ b/arch/sparc/kernel/iommu.c
@@ -260,9 +260,8 @@ static void dma_4u_free_coherent(struct device *dev, size_t size,
 		free_pages((unsigned long)cpu, order);
 }
 
-static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
-				  unsigned long offset, size_t sz,
-				  enum dma_data_direction direction,
+static dma_addr_t dma_4u_map_phys(struct device *dev, phys_addr_t phys,
+				  size_t sz, enum dma_data_direction direction,
 				  unsigned long attrs)
 {
 	struct iommu *iommu;
@@ -273,13 +272,16 @@ static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
 	u32 bus_addr, ret;
 	unsigned long iopte_protection;
 
+	if (attrs & DMA_ATTR_MMIO)
+		goto bad_no_ctx;
+
 	iommu = dev->archdata.iommu;
 	strbuf = dev->archdata.stc;
 
 	if (unlikely(direction == DMA_NONE))
 		goto bad_no_ctx;
 
-	oaddr = (unsigned long)(page_address(page) + offset);
+	oaddr = (unsigned long)(phys_to_virt(phys));
 	npages = IO_PAGE_ALIGN(oaddr + sz) - (oaddr & IO_PAGE_MASK);
 	npages >>= IO_PAGE_SHIFT;
 
@@ -383,7 +385,7 @@ static void strbuf_flush(struct strbuf *strbuf, struct iommu *iommu,
 		       vaddr, ctx, npages);
 }
 
-static void dma_4u_unmap_page(struct device *dev, dma_addr_t bus_addr,
+static void dma_4u_unmap_phys(struct device *dev, dma_addr_t bus_addr,
 			      size_t sz, enum dma_data_direction direction,
 			      unsigned long attrs)
 {
@@ -753,8 +755,8 @@ static int dma_4u_supported(struct device *dev, u64 device_mask)
 static const struct dma_map_ops sun4u_dma_ops = {
 	.alloc			= dma_4u_alloc_coherent,
 	.free			= dma_4u_free_coherent,
-	.map_page		= dma_4u_map_page,
-	.unmap_page		= dma_4u_unmap_page,
+	.map_phys		= dma_4u_map_phys,
+	.unmap_phys		= dma_4u_unmap_phys,
 	.map_sg			= dma_4u_map_sg,
 	.unmap_sg		= dma_4u_unmap_sg,
 	.sync_single_for_cpu	= dma_4u_sync_single_for_cpu,
diff --git a/arch/sparc/kernel/pci_sun4v.c b/arch/sparc/kernel/pci_sun4v.c
index b720b21ccfbd..d9d2464a948c 100644
--- a/arch/sparc/kernel/pci_sun4v.c
+++ b/arch/sparc/kernel/pci_sun4v.c
@@ -352,9 +352,8 @@ static void dma_4v_free_coherent(struct device *dev, size_t size, void *cpu,
 		free_pages((unsigned long)cpu, order);
 }
 
-static dma_addr_t dma_4v_map_page(struct device *dev, struct page *page,
-				  unsigned long offset, size_t sz,
-				  enum dma_data_direction direction,
+static dma_addr_t dma_4v_map_phys(struct device *dev, phys_addr_t phys,
+				  size_t sz, enum dma_data_direction direction,
 				  unsigned long attrs)
 {
 	struct iommu *iommu;
@@ -367,13 +366,16 @@ static dma_addr_t dma_4v_map_page(struct device *dev, struct page *page,
 	dma_addr_t bus_addr, ret;
 	long entry;
 
+	if (attrs & DMA_ATTR_MMIO)
+		goto bad;
+
 	iommu = dev->archdata.iommu;
 	atu = iommu->atu;
 
 	if (unlikely(direction == DMA_NONE))
 		goto bad;
 
-	oaddr = (unsigned long)(page_address(page) + offset);
+	oaddr = (unsigned long)(phys_to_virt(phys));
 	npages = IO_PAGE_ALIGN(oaddr + sz) - (oaddr & IO_PAGE_MASK);
 	npages >>= IO_PAGE_SHIFT;
 
@@ -426,7 +428,7 @@ static dma_addr_t dma_4v_map_page(struct device *dev, struct page *page,
 	return DMA_MAPPING_ERROR;
 }
 
-static void dma_4v_unmap_page(struct device *dev, dma_addr_t bus_addr,
+static void dma_4v_unmap_phys(struct device *dev, dma_addr_t bus_addr,
 			      size_t sz, enum dma_data_direction direction,
 			      unsigned long attrs)
 {
@@ -686,8 +688,8 @@ static int dma_4v_supported(struct device *dev, u64 device_mask)
 static const struct dma_map_ops sun4v_dma_ops = {
 	.alloc				= dma_4v_alloc_coherent,
 	.free				= dma_4v_free_coherent,
-	.map_page			= dma_4v_map_page,
-	.unmap_page			= dma_4v_unmap_page,
+	.map_phys			= dma_4v_map_phys,
+	.unmap_phys			= dma_4v_unmap_phys,
 	.map_sg				= dma_4v_map_sg,
 	.unmap_sg			= dma_4v_unmap_sg,
 	.dma_supported			= dma_4v_supported,
diff --git a/arch/sparc/mm/io-unit.c b/arch/sparc/mm/io-unit.c
index d8376f61b4d0..fab303cc3370 100644
--- a/arch/sparc/mm/io-unit.c
+++ b/arch/sparc/mm/io-unit.c
@@ -142,11 +142,10 @@ nexti:	scan = find_next_zero_bit(iounit->bmap, limit, scan);
 	return vaddr;
 }
 
-static dma_addr_t iounit_map_page(struct device *dev, struct page *page,
-		unsigned long offset, size_t len, enum dma_data_direction dir,
-		unsigned long attrs)
+static dma_addr_t iounit_map_phys(struct device *dev, phys_addr_t phys,
+		size_t len, enum dma_data_direction dir, unsigned long attrs)
 {
-	void *vaddr = page_address(page) + offset;
+	void *vaddr = phys_to_virt(phys);
 	struct iounit_struct *iounit = dev->archdata.iommu;
 	unsigned long ret, flags;
 	
@@ -178,7 +177,7 @@ static int iounit_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 	return nents;
 }
 
-static void iounit_unmap_page(struct device *dev, dma_addr_t vaddr, size_t len,
+static void iounit_unmap_phys(struct device *dev, dma_addr_t vaddr, size_t len,
 		enum dma_data_direction dir, unsigned long attrs)
 {
 	struct iounit_struct *iounit = dev->archdata.iommu;
@@ -279,8 +278,8 @@ static const struct dma_map_ops iounit_dma_ops = {
 	.alloc			= iounit_alloc,
 	.free			= iounit_free,
 #endif
-	.map_page		= iounit_map_page,
-	.unmap_page		= iounit_unmap_page,
+	.map_phys		= iounit_map_phys,
+	.unmap_phys		= iounit_unmap_phys,
 	.map_sg			= iounit_map_sg,
 	.unmap_sg		= iounit_unmap_sg,
 };
diff --git a/arch/sparc/mm/iommu.c b/arch/sparc/mm/iommu.c
index 5a5080db800f..dfcd981fa7ef 100644
--- a/arch/sparc/mm/iommu.c
+++ b/arch/sparc/mm/iommu.c
@@ -181,18 +181,20 @@ static void iommu_flush_iotlb(iopte_t *iopte, unsigned int niopte)
 	}
 }
 
-static dma_addr_t __sbus_iommu_map_page(struct device *dev, struct page *page,
-		unsigned long offset, size_t len, bool per_page_flush)
+static dma_addr_t __sbus_iommu_map_phys(struct device *dev, phys_addr_t paddr,
+		size_t len, bool per_page_flush, unsigned long attrs)
 {
 	struct iommu_struct *iommu = dev->archdata.iommu;
-	phys_addr_t paddr = page_to_phys(page) + offset;
-	unsigned long off = paddr & ~PAGE_MASK;
+	unsigned long off = offset_in_page(paddr);
 	unsigned long npages = (off + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
 	unsigned long pfn = __phys_to_pfn(paddr);
 	unsigned int busa, busa0;
 	iopte_t *iopte, *iopte0;
 	int ioptex, i;
 
+	if (attrs & DMA_ATTR_MMIO)
+		return DMA_MAPPING_ERROR;
+
 	/* XXX So what is maxphys for us and how do drivers know it? */
 	if (!len || len > 256 * 1024)
 		return DMA_MAPPING_ERROR;
@@ -202,10 +204,10 @@ static dma_addr_t __sbus_iommu_map_page(struct device *dev, struct page *page,
 	 * XXX Is this a good assumption?
 	 * XXX What if someone else unmaps it here and races us?
 	 */
-	if (per_page_flush && !PageHighMem(page)) {
+	if (per_page_flush && !PhysHighMem(paddr)) {
 		unsigned long vaddr, p;
 
-		vaddr = (unsigned long)page_address(page) + offset;
+		vaddr = (unsigned long)phys_to_virt(paddr);
 		for (p = vaddr & PAGE_MASK; p < vaddr + len; p += PAGE_SIZE)
 			flush_page_for_dma(p);
 	}
@@ -231,19 +233,19 @@ static dma_addr_t __sbus_iommu_map_page(struct device *dev, struct page *page,
 	return busa0 + off;
 }
 
-static dma_addr_t sbus_iommu_map_page_gflush(struct device *dev,
-		struct page *page, unsigned long offset, size_t len,
-		enum dma_data_direction dir, unsigned long attrs)
+static dma_addr_t sbus_iommu_map_phys_gflush(struct device *dev,
+		phys_addr_t phys, size_t len, enum dma_data_direction dir,
+		unsigned long attrs)
 {
 	flush_page_for_dma(0);
-	return __sbus_iommu_map_page(dev, page, offset, len, false);
+	return __sbus_iommu_map_phys(dev, phys, len, false, attrs);
 }
 
-static dma_addr_t sbus_iommu_map_page_pflush(struct device *dev,
-		struct page *page, unsigned long offset, size_t len,
-		enum dma_data_direction dir, unsigned long attrs)
+static dma_addr_t sbus_iommu_map_phys_pflush(struct device *dev,
+		phys_addr_t phys, size_t len, enum dma_data_direction dir,
+		unsigned long attrs)
 {
-	return __sbus_iommu_map_page(dev, page, offset, len, true);
+	return __sbus_iommu_map_phys(dev, phys, len, true, attrs);
 }
 
 static int __sbus_iommu_map_sg(struct device *dev, struct scatterlist *sgl,
@@ -254,8 +256,8 @@ static int __sbus_iommu_map_sg(struct device *dev, struct scatterlist *sgl,
 	int j;
 
 	for_each_sg(sgl, sg, nents, j) {
-		sg->dma_address =__sbus_iommu_map_page(dev, sg_page(sg),
-				sg->offset, sg->length, per_page_flush);
+		sg->dma_address = __sbus_iommu_map_phys(dev, sg_phys(sg),
+				sg->length, per_page_flush, attrs);
 		if (sg->dma_address == DMA_MAPPING_ERROR)
 			return -EIO;
 		sg->dma_length = sg->length;
@@ -277,7 +279,7 @@ static int sbus_iommu_map_sg_pflush(struct device *dev, struct scatterlist *sgl,
 	return __sbus_iommu_map_sg(dev, sgl, nents, dir, attrs, true);
 }
 
-static void sbus_iommu_unmap_page(struct device *dev, dma_addr_t dma_addr,
+static void sbus_iommu_unmap_phys(struct device *dev, dma_addr_t dma_addr,
 		size_t len, enum dma_data_direction dir, unsigned long attrs)
 {
 	struct iommu_struct *iommu = dev->archdata.iommu;
@@ -303,7 +305,7 @@ static void sbus_iommu_unmap_sg(struct device *dev, struct scatterlist *sgl,
 	int i;
 
 	for_each_sg(sgl, sg, nents, i) {
-		sbus_iommu_unmap_page(dev, sg->dma_address, sg->length, dir,
+		sbus_iommu_unmap_phys(dev, sg->dma_address, sg->length, dir,
 				attrs);
 		sg->dma_address = 0x21212121;
 	}
@@ -426,8 +428,8 @@ static const struct dma_map_ops sbus_iommu_dma_gflush_ops = {
 	.alloc			= sbus_iommu_alloc,
 	.free			= sbus_iommu_free,
 #endif
-	.map_page		= sbus_iommu_map_page_gflush,
-	.unmap_page		= sbus_iommu_unmap_page,
+	.map_phys		= sbus_iommu_map_phys_gflush,
+	.unmap_phys		= sbus_iommu_unmap_phys,
 	.map_sg			= sbus_iommu_map_sg_gflush,
 	.unmap_sg		= sbus_iommu_unmap_sg,
 };
@@ -437,8 +439,8 @@ static const struct dma_map_ops sbus_iommu_dma_pflush_ops = {
 	.alloc			= sbus_iommu_alloc,
 	.free			= sbus_iommu_free,
 #endif
-	.map_page		= sbus_iommu_map_page_pflush,
-	.unmap_page		= sbus_iommu_unmap_page,
+	.map_phys		= sbus_iommu_map_phys_pflush,
+	.unmap_phys		= sbus_iommu_unmap_phys,
 	.map_sg			= sbus_iommu_map_sg_pflush,
 	.unmap_sg		= sbus_iommu_unmap_sg,
 };
-- 
2.51.0


