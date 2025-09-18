Return-Path: <linuxppc-dev+bounces-12388-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 059A5B86740
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 20:45:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSPj2139Cz3cZ1;
	Fri, 19 Sep 2025 04:45:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758221142;
	cv=none; b=jr9PFQaKN1XsMXY83h43AOdVJn31oNGDIZq1sKlLRKsab6UhVeUbN2jrBoetjMf7jMqRmGSM2AIPoygTCwF8CjFEVo4OgPzFhPSUB2DpyBY/OA5A6JqwDhiGuQyitmX0kN9eyR7JYcMtfga+CXSJcFuy1RIHosjnn4wyj8cJsNAEVbVUzUWGgs4be/APF1ka07Fcr5dGxZz4SwxNSL9TMtne5RoV5ZXmd9aHWnzBJzLbC3SyWKsNqOkmSzOOmPZXdZltXFdBy3o9kWCxKFHzePgRcb54cAJu13pzNqHOiIGwUdK7T0690utABPrWYDJeJr6M4DF7DdiR2S8qnrIsbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758221142; c=relaxed/relaxed;
	bh=zuA2/EbjAjP+IDiVRg8tCpvb0l3w5/9bBHRhhMxW4Wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TjuyFDA4P8QgNGrCrz4Jpq1oDttLiphxRRbhXYtFeZqQyxLWYAS1Uc/V9j8jkfoEsrx03PPGe1HqO48A4xXQ8wSWUG6dj+U2AQcbyQuMxtr7c3ZgAkCbv4f0BWF261H0+55GbB1G7+jK/asWUJxwjfHxmP1dTSwyhQfCq2FFMiQCW04Br3PaOo9DGOmINZYChZbWxpozlZIKpSI5vXZ53Af1E0iklsxsZdTbv3zFzGBC6qZJLvHdiFHHQO6DoBem/RCzvRKcTkX6ngKtX9qY+kLM/MdmZdVKIlNmGRz5W7RQtJXaebWTJbOlX5zgnari7mFlqM0tIFGm4lcsjPfSzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nmeOm+sq; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nmeOm+sq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSPj126jcz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 04:45:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D84660211;
	Thu, 18 Sep 2025 18:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3E1C4CEE7;
	Thu, 18 Sep 2025 18:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758221139;
	bh=lYina26sWVeUcMXQiYVzGEsG3s2F3WRjYogRL1Hc1Kg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nmeOm+sqpgOPQj79lggvc1K6wpDOki3X4yJuxCb2vpWB7Yrit2zqRh0RiDIvOfhbE
	 evc12i0uWXAtIGkWhu78jwz295HLWPOAaZO6IZ/cviymzjBAJS/z9YITfLbhvXtCFj
	 ky8D8HIF4+CT3b196kV7uzpo4mZHe5HQ3Dm4EG7bvT2H0SCDQYzaGQ0o23uNJgkbi+
	 6aZi+d9itiPvwVg22aSegOmezzgMa5H8zXDrUjIenHJYjuH2xplO3ZAhthDLRLlTV2
	 U0DeJS9SxdDkBapfGs1dH8YVifrYc3iq4bbDeAIVs7BBOR9OCRgcGcxYPk4A43PYIU
	 SJ9lnFSV8Evzw==
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
	xen-devel@lists.xenproject.org
Subject: [PATCH 3/9] parisc: Convert DMA map_page to map_phys  interface
Date: Thu, 18 Sep 2025 21:45:03 +0300
Message-ID: <56c4c3b14f46c0a785f196315b673b0b1bcfb3b1.1758219787.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758219786.git.leon@kernel.org>
References: <cover.1758219786.git.leon@kernel.org>
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

Perform mechanical conversion from .map_page to .map_phys callback.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/parisc/ccio-dma.c  | 25 +++++++++++++------------
 drivers/parisc/sba_iommu.c | 23 ++++++++++++-----------
 2 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index feef537257d05..d45f3634f8270 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
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
+	if (attrs & DMA_ATTR_MMIO)
+		return DMA_MAPPING_ERROR;
+
+	return ccio_map_single(dev, phys_to_virt(phys), size, direction);
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
@@ -873,7 +874,7 @@ static void
 ccio_free(struct device *dev, size_t size, void *cpu_addr,
 		dma_addr_t dma_handle, unsigned long attrs)
 {
-	ccio_unmap_page(dev, dma_handle, size, 0, 0);
+	ccio_unmap_phys(dev, dma_handle, size, 0, 0);
 	free_pages((unsigned long)cpu_addr, get_order(size));
 }
 
@@ -1004,7 +1005,7 @@ ccio_unmap_sg(struct device *dev, struct scatterlist *sglist, int nents,
 #ifdef CCIO_COLLECT_STATS
 		ioc->usg_pages += sg_dma_len(sglist) >> PAGE_SHIFT;
 #endif
-		ccio_unmap_page(dev, sg_dma_address(sglist),
+		ccio_unmap_phys(dev, sg_dma_address(sglist),
 				  sg_dma_len(sglist), direction, 0);
 		++sglist;
 		nents--;
@@ -1017,8 +1018,8 @@ static const struct dma_map_ops ccio_ops = {
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
@@ -1072,7 +1073,7 @@ static int ccio_proc_info(struct seq_file *m, void *p)
 			   ioc->msingle_calls, ioc->msingle_pages,
 			   (int)((ioc->msingle_pages * 1000)/ioc->msingle_calls));
 
-		/* KLUGE - unmap_sg calls unmap_page for each mapped page */
+		/* KLUGE - unmap_sg calls unmap_phys for each mapped page */
 		min = ioc->usingle_calls - ioc->usg_calls;
 		max = ioc->usingle_pages - ioc->usg_pages;
 		seq_printf(m, "pci_unmap_single: %8ld calls  %8ld pages (avg %d/1000)\n",
diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index fc3863c09f83d..8040aa4e6ff42 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -778,17 +778,18 @@ sba_map_single(struct device *dev, void *addr, size_t size,
 
 
 static dma_addr_t
-sba_map_page(struct device *dev, struct page *page, unsigned long offset,
-		size_t size, enum dma_data_direction direction,
-		unsigned long attrs)
+sba_map_phys(struct device *dev, phys_addr_t phys, size_t size,
+		enum dma_data_direction direction, unsigned long attrs)
 {
-	return sba_map_single(dev, page_address(page) + offset, size,
-			direction);
+	if (attrs & DMA_ATTR_MMIO)
+		return DMA_MAPPING_ERROR;
+
+	return sba_map_single(dev, phys_to_virt(phys), size, direction);
 }
 
 
 /**
- * sba_unmap_page - unmap one IOVA and free resources
+ * sba_unmap_phys - unmap one IOVA and free resources
  * @dev: instance of PCI owned by the driver that's asking.
  * @iova:  IOVA of driver buffer previously mapped.
  * @size:  number of bytes mapped in driver buffer.
@@ -798,7 +799,7 @@ sba_map_page(struct device *dev, struct page *page, unsigned long offset,
  * See Documentation/core-api/dma-api-howto.rst
  */
 static void
-sba_unmap_page(struct device *dev, dma_addr_t iova, size_t size,
+sba_unmap_phys(struct device *dev, dma_addr_t iova, size_t size,
 		enum dma_data_direction direction, unsigned long attrs)
 {
 	struct ioc *ioc;
@@ -914,7 +915,7 @@ static void
 sba_free(struct device *hwdev, size_t size, void *vaddr,
 		    dma_addr_t dma_handle, unsigned long attrs)
 {
-	sba_unmap_page(hwdev, dma_handle, size, 0, 0);
+	sba_unmap_phys(hwdev, dma_handle, size, 0, 0);
 	free_pages((unsigned long) vaddr, get_order(size));
 }
 
@@ -1061,7 +1062,7 @@ sba_unmap_sg(struct device *dev, struct scatterlist *sglist, int nents,
 
 	while (nents && sg_dma_len(sglist)) {
 
-		sba_unmap_page(dev, sg_dma_address(sglist), sg_dma_len(sglist),
+		sba_unmap_phys(dev, sg_dma_address(sglist), sg_dma_len(sglist),
 				direction, 0);
 #ifdef SBA_COLLECT_STATS
 		ioc->usg_pages += ((sg_dma_address(sglist) & ~IOVP_MASK) + sg_dma_len(sglist) + IOVP_SIZE - 1) >> PAGE_SHIFT;
@@ -1085,8 +1086,8 @@ static const struct dma_map_ops sba_ops = {
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


