Return-Path: <linuxppc-dev+bounces-12909-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A971BDDAAB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 11:14:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmlks1v2Qz3dVX;
	Wed, 15 Oct 2025 20:13:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760519637;
	cv=none; b=Y2sWz8RjgbilWXWBv0AmkyAnabsLUeL9g3wGNWaoV6+aBTkDQwLVJ9nAVsSc6Xn77O7zytjLD79blOTPDu0JDRS03KCNoXM8nSslJH5IiKoTVU1ZPXIeHdNDc6LaEzYqmKMVR0EFgb4iYfsTUglM+rmOv4LPJ83j5Ym4hVVWj8gMVsl0i5goAHGdvDu3h4WVIMRFHsqYNiClXOKAjjk5/JUuypSK6SRA3Q1cqRMufDR7hz7TeH8PBngGIPuFhEyObhwogCWVFZo5Dn+Cw8iBKuEr8bRwNqpBgrvUJE0PJs3CY8vqgsGVRFevZ/dhJnuO7CN02DS/rL9VCkNSHAZ70w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760519637; c=relaxed/relaxed;
	bh=/sMLccLPuipTIQIq+QGkG1/Qfpgp7OHUnhyOy5PjXZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mw8udEIuDS5wXymQ+RKu6Y5KoPpVL2Ii31nVro4Q4MabIil7OuR4WU4KYFzZrsA81dvQoz/ZIenhmpmebMS/W+pMS6T8p4/boixOlMnJxAW8J8q2l5hjl3qpWwIDqkXB8kzISP2TaJIVRGT4otzwfvdmhaqvTdeuB8xZIhM9i4b/bvMAllei3nw79tjg5wmmgcVvGHlEhMQBB3x+sNON80qACS709SIY4fObwQ4EVD6pCVpSkP4UyXMe1XL+pwz95AI6w2T0OllaDAd7wxhYOwOdKVJgcnMjV0447EbDk5/ajovdAbFqtCHrAzqrMo9DYZCV2LiYMtg7CofdmPzxkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VjKEdt2m; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VjKEdt2m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmlkr38Knz3dVS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 20:13:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D02CE417E5;
	Wed, 15 Oct 2025 09:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE55C19424;
	Wed, 15 Oct 2025 09:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519634;
	bh=SfEJhe+EnkJnefkh97fPmSPXkeIOd3xlETD9YgBQ46Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VjKEdt2mxlWT6w6IHTqoZRpMLcMuI77UbOT5L24qqSlM5/DRGv3AcjxM4yMGcf+EA
	 z3mSEYZ6gFFWrxSO7HRPPBIgkFJ2KK8npgJULFQ3REwzcltzHG0visRTUD4RkVR8p2
	 iVTzUpaitF9orJXdg7vwdxwmxOVT299ieYtlvyB/8fvGgyB/AQShYv0rnCdNMAXe9R
	 ZB3OwN86eHCPctYuE8Jsplg/jEev2Xxs2kFERH9JQ4NIoTovdwTglFTYtRMQcmdBAV
	 BE5Q3ZMOHIBzXlABIk4k32PRk815Smbd9I+JsegH2figO4R/XC82Wkl31Ze4zN26de
	 GcSuYHdBLk/jA==
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
Subject: [PATCH v5 09/14] parisc: Convert DMA map_page to map_phys interface
Date: Wed, 15 Oct 2025 12:12:55 +0300
Message-ID: <20251015-remove-map-page-v5-9-3bbfe3a25cdf@kernel.org>
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

Perform mechanical conversion from .map_page to .map_phys callback.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/parisc/ccio-dma.c      | 54 ++++++++++++++++++++++--------------------
 drivers/parisc/iommu-helpers.h | 10 ++++----
 drivers/parisc/sba_iommu.c     | 54 ++++++++++++++++++++----------------------
 3 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index feef537257d0..4e7071714356 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -517,10 +517,10 @@ static u32 hint_lookup[] = {
  * ccio_io_pdir_entry - Initialize an I/O Pdir.
  * @pdir_ptr: A pointer into I/O Pdir.
  * @sid: The Space Identifier.
- * @vba: The virtual address.
+ * @pba: The physical address.
  * @hints: The DMA Hint.
  *
- * Given a virtual address (vba, arg2) and space id, (sid, arg1),
+ * Given a physical address (pba, arg2) and space id, (sid, arg1),
  * load the I/O PDIR entry pointed to by pdir_ptr (arg0). Each IO Pdir
  * entry consists of 8 bytes as shown below (MSB == bit 0):
  *
@@ -543,7 +543,7 @@ static u32 hint_lookup[] = {
  * index are bits 12:19 of the value returned by LCI.
  */ 
 static void
-ccio_io_pdir_entry(__le64 *pdir_ptr, space_t sid, unsigned long vba,
+ccio_io_pdir_entry(__le64 *pdir_ptr, space_t sid, phys_addr_t pba,
 		   unsigned long hints)
 {
 	register unsigned long pa;
@@ -557,7 +557,7 @@ ccio_io_pdir_entry(__le64 *pdir_ptr, space_t sid, unsigned long vba,
 	** "hints" parm includes the VALID bit!
 	** "dep" clobbers the physical address offset bits as well.
 	*/
-	pa = lpa(vba);
+	pa = pba;
 	asm volatile("depw  %1,31,12,%0" : "+r" (pa) : "r" (hints));
 	((u32 *)pdir_ptr)[1] = (u32) pa;
 
@@ -582,7 +582,7 @@ ccio_io_pdir_entry(__le64 *pdir_ptr, space_t sid, unsigned long vba,
 	** Grab virtual index [0:11]
 	** Deposit virt_idx bits into I/O PDIR word
 	*/
-	asm volatile ("lci %%r0(%1), %0" : "=r" (ci) : "r" (vba));
+	asm volatile ("lci %%r0(%1), %0" : "=r" (ci) : "r" (phys_to_virt(pba)));
 	asm volatile ("extru %1,19,12,%0" : "+r" (ci) : "r" (ci));
 	asm volatile ("depw  %1,15,12,%0" : "+r" (pa) : "r" (ci));
 
@@ -704,14 +704,14 @@ ccio_dma_supported(struct device *dev, u64 mask)
 /**
  * ccio_map_single - Map an address range into the IOMMU.
  * @dev: The PCI device.
- * @addr: The start address of the DMA region.
+ * @addr: The physical address of the DMA region.
  * @size: The length of the DMA region.
  * @direction: The direction of the DMA transaction (to/from device).
  *
  * This function implements the pci_map_single function.
  */
 static dma_addr_t 
-ccio_map_single(struct device *dev, void *addr, size_t size,
+ccio_map_single(struct device *dev, phys_addr_t addr, size_t size,
 		enum dma_data_direction direction)
 {
 	int idx;
@@ -730,7 +730,7 @@ ccio_map_single(struct device *dev, void *addr, size_t size,
 	BUG_ON(size <= 0);
 
 	/* save offset bits */
-	offset = ((unsigned long) addr) & ~IOVP_MASK;
+	offset = offset_in_page(addr);
 
 	/* round up to nearest IOVP_SIZE */
 	size = ALIGN(size + offset, IOVP_SIZE);
@@ -746,15 +746,15 @@ ccio_map_single(struct device *dev, void *addr, size_t size,
 
 	pdir_start = &(ioc->pdir_base[idx]);
 
-	DBG_RUN("%s() %px -> %#lx size: %zu\n",
-		__func__, addr, (long)(iovp | offset), size);
+	DBG_RUN("%s() %pa -> %#lx size: %zu\n",
+		__func__, &addr, (long)(iovp | offset), size);
 
 	/* If not cacheline aligned, force SAFE_DMA on the whole mess */
-	if((size % L1_CACHE_BYTES) || ((unsigned long)addr % L1_CACHE_BYTES))
+	if ((size % L1_CACHE_BYTES) || (addr % L1_CACHE_BYTES))
 		hint |= HINT_SAFE_DMA;
 
 	while(size > 0) {
-		ccio_io_pdir_entry(pdir_start, KERNEL_SPACE, (unsigned long)addr, hint);
+		ccio_io_pdir_entry(pdir_start, KERNEL_SPACE, addr, hint);
 
 		DBG_RUN(" pdir %p %08x%08x\n",
 			pdir_start,
@@ -773,17 +773,18 @@ ccio_map_single(struct device *dev, void *addr, size_t size,
 
 
 static dma_addr_t
-ccio_map_page(struct device *dev, struct page *page, unsigned long offset,
-		size_t size, enum dma_data_direction direction,
-		unsigned long attrs)
+ccio_map_phys(struct device *dev, phys_addr_t phys, size_t size,
+	      enum dma_data_direction direction, unsigned long attrs)
 {
-	return ccio_map_single(dev, page_address(page) + offset, size,
-			direction);
+	if (unlikely(attrs & DMA_ATTR_MMIO))
+		return DMA_MAPPING_ERROR;
+
+	return ccio_map_single(dev, phys, size, direction);
 }
 
 
 /**
- * ccio_unmap_page - Unmap an address range from the IOMMU.
+ * ccio_unmap_phys - Unmap an address range from the IOMMU.
  * @dev: The PCI device.
  * @iova: The start address of the DMA region.
  * @size: The length of the DMA region.
@@ -791,7 +792,7 @@ ccio_map_page(struct device *dev, struct page *page, unsigned long offset,
  * @attrs: attributes
  */
 static void 
-ccio_unmap_page(struct device *dev, dma_addr_t iova, size_t size,
+ccio_unmap_phys(struct device *dev, dma_addr_t iova, size_t size,
 		enum dma_data_direction direction, unsigned long attrs)
 {
 	struct ioc *ioc;
@@ -853,7 +854,8 @@ ccio_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle, gfp_t flag,
 
 	if (ret) {
 		memset(ret, 0, size);
-		*dma_handle = ccio_map_single(dev, ret, size, DMA_BIDIRECTIONAL);
+		*dma_handle = ccio_map_single(dev, virt_to_phys(ret), size,
+					      DMA_BIDIRECTIONAL);
 	}
 
 	return ret;
@@ -873,7 +875,7 @@ static void
 ccio_free(struct device *dev, size_t size, void *cpu_addr,
 		dma_addr_t dma_handle, unsigned long attrs)
 {
-	ccio_unmap_page(dev, dma_handle, size, 0, 0);
+	ccio_unmap_phys(dev, dma_handle, size, 0, 0);
 	free_pages((unsigned long)cpu_addr, get_order(size));
 }
 
@@ -920,7 +922,7 @@ ccio_map_sg(struct device *dev, struct scatterlist *sglist, int nents,
 	/* Fast path single entry scatterlists. */
 	if (nents == 1) {
 		sg_dma_address(sglist) = ccio_map_single(dev,
-				sg_virt(sglist), sglist->length,
+				sg_phys(sglist), sglist->length,
 				direction);
 		sg_dma_len(sglist) = sglist->length;
 		return 1;
@@ -1004,7 +1006,7 @@ ccio_unmap_sg(struct device *dev, struct scatterlist *sglist, int nents,
 #ifdef CCIO_COLLECT_STATS
 		ioc->usg_pages += sg_dma_len(sglist) >> PAGE_SHIFT;
 #endif
-		ccio_unmap_page(dev, sg_dma_address(sglist),
+		ccio_unmap_phys(dev, sg_dma_address(sglist),
 				  sg_dma_len(sglist), direction, 0);
 		++sglist;
 		nents--;
@@ -1017,8 +1019,8 @@ static const struct dma_map_ops ccio_ops = {
 	.dma_supported =	ccio_dma_supported,
 	.alloc =		ccio_alloc,
 	.free =			ccio_free,
-	.map_page =		ccio_map_page,
-	.unmap_page =		ccio_unmap_page,
+	.map_phys =		ccio_map_phys,
+	.unmap_phys =		ccio_unmap_phys,
 	.map_sg =		ccio_map_sg,
 	.unmap_sg =		ccio_unmap_sg,
 	.get_sgtable =		dma_common_get_sgtable,
@@ -1072,7 +1074,7 @@ static int ccio_proc_info(struct seq_file *m, void *p)
 			   ioc->msingle_calls, ioc->msingle_pages,
 			   (int)((ioc->msingle_pages * 1000)/ioc->msingle_calls));
 
-		/* KLUGE - unmap_sg calls unmap_page for each mapped page */
+		/* KLUGE - unmap_sg calls unmap_phys for each mapped page */
 		min = ioc->usingle_calls - ioc->usg_calls;
 		max = ioc->usingle_pages - ioc->usg_pages;
 		seq_printf(m, "pci_unmap_single: %8ld calls  %8ld pages (avg %d/1000)\n",
diff --git a/drivers/parisc/iommu-helpers.h b/drivers/parisc/iommu-helpers.h
index c43f1a212a5c..0691884f5095 100644
--- a/drivers/parisc/iommu-helpers.h
+++ b/drivers/parisc/iommu-helpers.h
@@ -14,7 +14,7 @@
 static inline unsigned int
 iommu_fill_pdir(struct ioc *ioc, struct scatterlist *startsg, int nents, 
 		unsigned long hint,
-		void (*iommu_io_pdir_entry)(__le64 *, space_t, unsigned long,
+		void (*iommu_io_pdir_entry)(__le64 *, space_t, phys_addr_t,
 					    unsigned long))
 {
 	struct scatterlist *dma_sg = startsg;	/* pointer to current DMA */
@@ -28,7 +28,7 @@ iommu_fill_pdir(struct ioc *ioc, struct scatterlist *startsg, int nents,
 	 dma_sg--;
 
 	while (nents-- > 0) {
-		unsigned long vaddr;
+		phys_addr_t paddr;
 		long size;
 
 		DBG_RUN_SG(" %d : %08lx %p/%05x\n", nents,
@@ -67,7 +67,7 @@ iommu_fill_pdir(struct ioc *ioc, struct scatterlist *startsg, int nents,
 		
 		BUG_ON(pdirp == NULL);
 		
-		vaddr = (unsigned long)sg_virt(startsg);
+		paddr = sg_phys(startsg);
 		sg_dma_len(dma_sg) += startsg->length;
 		size = startsg->length + dma_offset;
 		dma_offset = 0;
@@ -76,8 +76,8 @@ iommu_fill_pdir(struct ioc *ioc, struct scatterlist *startsg, int nents,
 #endif
 		do {
 			iommu_io_pdir_entry(pdirp, KERNEL_SPACE, 
-					    vaddr, hint);
-			vaddr += IOVP_SIZE;
+					    paddr, hint);
+			paddr += IOVP_SIZE;
 			size -= IOVP_SIZE;
 			pdirp++;
 		} while(unlikely(size > 0));
diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index fc3863c09f83..a6eb6bffa5ea 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -532,7 +532,7 @@ typedef unsigned long space_t;
  * sba_io_pdir_entry - fill in one IO PDIR entry
  * @pdir_ptr:  pointer to IO PDIR entry
  * @sid: process Space ID - currently only support KERNEL_SPACE
- * @vba: Virtual CPU address of buffer to map
+ * @pba: Physical address of buffer to map
  * @hint: DMA hint set to use for this mapping
  *
  * SBA Mapping Routine
@@ -569,20 +569,17 @@ typedef unsigned long space_t;
  */
 
 static void
-sba_io_pdir_entry(__le64 *pdir_ptr, space_t sid, unsigned long vba,
+sba_io_pdir_entry(__le64 *pdir_ptr, space_t sid, phys_addr_t pba,
 		  unsigned long hint)
 {
-	u64 pa; /* physical address */
 	register unsigned ci; /* coherent index */
 
-	pa = lpa(vba);
-	pa &= IOVP_MASK;
+	asm("lci 0(%1), %0" : "=r" (ci) : "r" (phys_to_virt(pba)));
+	pba &= IOVP_MASK;
+	pba |= (ci >> PAGE_SHIFT) & 0xff;  /* move CI (8 bits) into lowest byte */
 
-	asm("lci 0(%1), %0" : "=r" (ci) : "r" (vba));
-	pa |= (ci >> PAGE_SHIFT) & 0xff;  /* move CI (8 bits) into lowest byte */
-
-	pa |= SBA_PDIR_VALID_BIT;	/* set "valid" bit */
-	*pdir_ptr = cpu_to_le64(pa);	/* swap and store into I/O Pdir */
+	pba |= SBA_PDIR_VALID_BIT;	/* set "valid" bit */
+	*pdir_ptr = cpu_to_le64(pba);	/* swap and store into I/O Pdir */
 
 	/*
 	 * If the PDC_MODEL capabilities has Non-coherent IO-PDIR bit set
@@ -707,7 +704,7 @@ static int sba_dma_supported( struct device *dev, u64 mask)
  * See Documentation/core-api/dma-api-howto.rst
  */
 static dma_addr_t
-sba_map_single(struct device *dev, void *addr, size_t size,
+sba_map_single(struct device *dev, phys_addr_t addr, size_t size,
 	       enum dma_data_direction direction)
 {
 	struct ioc *ioc;
@@ -722,7 +719,7 @@ sba_map_single(struct device *dev, void *addr, size_t size,
 		return DMA_MAPPING_ERROR;
 
 	/* save offset bits */
-	offset = ((dma_addr_t) (long) addr) & ~IOVP_MASK;
+	offset = offset_in_page(addr);
 
 	/* round up to nearest IOVP_SIZE */
 	size = (size + offset + ~IOVP_MASK) & IOVP_MASK;
@@ -739,13 +736,13 @@ sba_map_single(struct device *dev, void *addr, size_t size,
 	pide = sba_alloc_range(ioc, dev, size);
 	iovp = (dma_addr_t) pide << IOVP_SHIFT;
 
-	DBG_RUN("%s() 0x%p -> 0x%lx\n",
-		__func__, addr, (long) iovp | offset);
+	DBG_RUN("%s() 0x%pa -> 0x%lx\n",
+		__func__, &addr, (long) iovp | offset);
 
 	pdir_start = &(ioc->pdir_base[pide]);
 
 	while (size > 0) {
-		sba_io_pdir_entry(pdir_start, KERNEL_SPACE, (unsigned long) addr, 0);
+		sba_io_pdir_entry(pdir_start, KERNEL_SPACE, addr, 0);
 
 		DBG_RUN("	pdir 0x%p %02x%02x%02x%02x%02x%02x%02x%02x\n",
 			pdir_start,
@@ -778,17 +775,18 @@ sba_map_single(struct device *dev, void *addr, size_t size,
 
 
 static dma_addr_t
-sba_map_page(struct device *dev, struct page *page, unsigned long offset,
-		size_t size, enum dma_data_direction direction,
-		unsigned long attrs)
+sba_map_phys(struct device *dev, phys_addr_t phys, size_t size,
+		enum dma_data_direction direction, unsigned long attrs)
 {
-	return sba_map_single(dev, page_address(page) + offset, size,
-			direction);
+	if (unlikely(attrs & DMA_ATTR_MMIO))
+		return DMA_MAPPING_ERROR;
+
+	return sba_map_single(dev, phys, size, direction);
 }
 
 
 /**
- * sba_unmap_page - unmap one IOVA and free resources
+ * sba_unmap_phys - unmap one IOVA and free resources
  * @dev: instance of PCI owned by the driver that's asking.
  * @iova:  IOVA of driver buffer previously mapped.
  * @size:  number of bytes mapped in driver buffer.
@@ -798,7 +796,7 @@ sba_map_page(struct device *dev, struct page *page, unsigned long offset,
  * See Documentation/core-api/dma-api-howto.rst
  */
 static void
-sba_unmap_page(struct device *dev, dma_addr_t iova, size_t size,
+sba_unmap_phys(struct device *dev, dma_addr_t iova, size_t size,
 		enum dma_data_direction direction, unsigned long attrs)
 {
 	struct ioc *ioc;
@@ -893,7 +891,7 @@ static void *sba_alloc(struct device *hwdev, size_t size, dma_addr_t *dma_handle
 
 	if (ret) {
 		memset(ret, 0, size);
-		*dma_handle = sba_map_single(hwdev, ret, size, 0);
+		*dma_handle = sba_map_single(hwdev, virt_to_phys(ret), size, 0);
 	}
 
 	return ret;
@@ -914,7 +912,7 @@ static void
 sba_free(struct device *hwdev, size_t size, void *vaddr,
 		    dma_addr_t dma_handle, unsigned long attrs)
 {
-	sba_unmap_page(hwdev, dma_handle, size, 0, 0);
+	sba_unmap_phys(hwdev, dma_handle, size, 0, 0);
 	free_pages((unsigned long) vaddr, get_order(size));
 }
 
@@ -962,7 +960,7 @@ sba_map_sg(struct device *dev, struct scatterlist *sglist, int nents,
 
 	/* Fast path single entry scatterlists. */
 	if (nents == 1) {
-		sg_dma_address(sglist) = sba_map_single(dev, sg_virt(sglist),
+		sg_dma_address(sglist) = sba_map_single(dev, sg_phys(sglist),
 						sglist->length, direction);
 		sg_dma_len(sglist)     = sglist->length;
 		return 1;
@@ -1061,7 +1059,7 @@ sba_unmap_sg(struct device *dev, struct scatterlist *sglist, int nents,
 
 	while (nents && sg_dma_len(sglist)) {
 
-		sba_unmap_page(dev, sg_dma_address(sglist), sg_dma_len(sglist),
+		sba_unmap_phys(dev, sg_dma_address(sglist), sg_dma_len(sglist),
 				direction, 0);
 #ifdef SBA_COLLECT_STATS
 		ioc->usg_pages += ((sg_dma_address(sglist) & ~IOVP_MASK) + sg_dma_len(sglist) + IOVP_SIZE - 1) >> PAGE_SHIFT;
@@ -1085,8 +1083,8 @@ static const struct dma_map_ops sba_ops = {
 	.dma_supported =	sba_dma_supported,
 	.alloc =		sba_alloc,
 	.free =			sba_free,
-	.map_page =		sba_map_page,
-	.unmap_page =		sba_unmap_page,
+	.map_phys =		sba_map_phys,
+	.unmap_phys =		sba_unmap_phys,
 	.map_sg =		sba_map_sg,
 	.unmap_sg =		sba_unmap_sg,
 	.get_sgtable =		dma_common_get_sgtable,

-- 
2.51.0


