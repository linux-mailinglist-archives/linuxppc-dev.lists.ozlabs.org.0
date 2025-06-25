Return-Path: <linuxppc-dev+bounces-9746-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B74AAE8453
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 15:20:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS2VF6cn5z30Vb;
	Wed, 25 Jun 2025 23:19:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750857589;
	cv=none; b=aGUJLlMqxNi/FLSgk8IfDIB/ulS2xlVfA70AEFfqnJmVvQjTIuWOTDNvg/g9ikeYR6ZfZuH2qoILVDLYudq1o+LFkEHpxPsak7Dsan6l1n5m6hNNUyKUArSm2Chc8Decjl5m0cBeiGax+1CF6yUzbAwAlAAau9OfOr1GSWAMa8kp1MhOyU+KqGp4nc326QVNZzWrwr7wE9lUHsAWEDR76L/LVAPG1s+D14oEGlKMYpHnQspBbjmUkKE/Mhb+jqZlIez1uvadD7AgXhRDntJZVfWzdTrA4GOy2zh4SRQpH0KpsstRiuVxL25cs4ktDOCMM+J5o8ygYDm8dWnrpJ4Vnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750857589; c=relaxed/relaxed;
	bh=BJ1Wn2SVnMm/REOeG/rD6ahVGk6b5fUJAT/ifYboang=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OK4/nClyImIihAaJ+pxS0YKwNP7wWcxplHXGyKpsURqUx9WDp0zmhgJbbJBMZk7GaST3iAX3QBJZxydp/JBgGCxhC3m5e8jqA/Jr+Kj4hsApKRU70kW1B8+rUG3IylKI/hrrv4suCMEHjG6SqB9bAfnJaOZtQMY993c0teYmrrlngAV3OSvZ3bA7eE/BVEmoFILejxUHCmPD/SMxRQalYb2zajlqpoam5Imm0zq6mc7KXcGmGDSO75Mb4RD4TIdbZrDpYxTjlOPbYywRc9PtQG7KsRZTn2tDX6aLb8QajkIvF95ZX5K87tMiJoMGF1QLNZDeK1oCltplecYqa22/Aw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cnTVV8FS; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cnTVV8FS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bS2VF1KhBz30LS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 23:19:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E7A366135E;
	Wed, 25 Jun 2025 13:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592E4C4CEEE;
	Wed, 25 Jun 2025 13:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750857586;
	bh=s3ricX6F0gnoDUjq0E8NJAWhkL9Tw8iVfIdzfwt4kfE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cnTVV8FSWRgTINDsBkK+iotwyFKWOB54N/KKiBJwLkRN14YJAdgWdogyeUVp7oYnS
	 JQF5cLFJZPI6gXGVsijnU1DUn6cDooA9QKF0JLQlCux/vHk8s/QC9qvVG2ato2Jy9Z
	 /MJsSnpP1evmTTc5iPOEKZtQRZLSiF2QWSP0sWS1zQnw07TNmRSMsyfbaQIy79hYVS
	 3E2bNHn79TeUYQSZ+MekASQWX0u51qZPgs+5KBB7c/JI61L5WzuQJ2XY8AUNyXt0eY
	 Fo41SZbgHn68WZRUMguZ35VM+86zZejCu/SQgHrRC4PKYvU90HLDEllnWVq8lFzC/8
	 jwx/UnEJ4Xgzg==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Christoph Hellwig <hch@lst.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux.dev,
	virtualization@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 4/8] dma-mapping: convert dma_direct_*map_page to be phys_addr_t based
Date: Wed, 25 Jun 2025 16:19:01 +0300
Message-ID: <1165abafc7d4bd2eed2cc89480b68111fe6fd13d.1750854543.git.leon@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750854543.git.leon@kernel.org>
References: <cover.1750854543.git.leon@kernel.org>
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Leon Romanovsky <leonro@nvidia.com>

Convert the DMA direct mapping functions to accept physical addresses
directly instead of page+offset parameters. The functions were already
operating on physical addresses internally, so this change eliminates
the redundant page-to-physical conversion at the API boundary.

The functions dma_direct_map_page() and dma_direct_unmap_page() are
renamed to dma_direct_map_phys() and dma_direct_unmap_phys() respectively,
with their calling convention changed from (struct page *page,
unsigned long offset) to (phys_addr_t phys).

Architecture-specific functions arch_dma_map_page_direct() and
arch_dma_unmap_page_direct() are similarly renamed to
arch_dma_map_phys_direct() and arch_dma_unmap_phys_direct().

The is_pci_p2pdma_page() checks are replaced with pfn_valid() checks
using PHYS_PFN(phys). This provides more accurate validation for non-page
backed memory regions without need to have "faked" struct page.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/powerpc/kernel/dma-iommu.c |  4 ++--
 include/linux/dma-map-ops.h     |  8 ++++----
 kernel/dma/direct.c             |  6 +++---
 kernel/dma/direct.h             | 13 ++++++-------
 kernel/dma/mapping.c            |  8 ++++----
 5 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index 4d64a5db50f3..0359ab72cd3b 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -14,7 +14,7 @@
 #define can_map_direct(dev, addr) \
 	((dev)->bus_dma_limit >= phys_to_dma((dev), (addr)))
 
-bool arch_dma_map_page_direct(struct device *dev, phys_addr_t addr)
+bool arch_dma_map_phys_direct(struct device *dev, phys_addr_t addr)
 {
 	if (likely(!dev->bus_dma_limit))
 		return false;
@@ -24,7 +24,7 @@ bool arch_dma_map_page_direct(struct device *dev, phys_addr_t addr)
 
 #define is_direct_handle(dev, h) ((h) >= (dev)->archdata.dma_offset)
 
-bool arch_dma_unmap_page_direct(struct device *dev, dma_addr_t dma_handle)
+bool arch_dma_unmap_phys_direct(struct device *dev, dma_addr_t dma_handle)
 {
 	if (likely(!dev->bus_dma_limit))
 		return false;
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index f48e5fb88bd5..71f5b3025415 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -392,15 +392,15 @@ void *arch_dma_set_uncached(void *addr, size_t size);
 void arch_dma_clear_uncached(void *addr, size_t size);
 
 #ifdef CONFIG_ARCH_HAS_DMA_MAP_DIRECT
-bool arch_dma_map_page_direct(struct device *dev, phys_addr_t addr);
-bool arch_dma_unmap_page_direct(struct device *dev, dma_addr_t dma_handle);
+bool arch_dma_map_phys_direct(struct device *dev, phys_addr_t addr);
+bool arch_dma_unmap_phys_direct(struct device *dev, dma_addr_t dma_handle);
 bool arch_dma_map_sg_direct(struct device *dev, struct scatterlist *sg,
 		int nents);
 bool arch_dma_unmap_sg_direct(struct device *dev, struct scatterlist *sg,
 		int nents);
 #else
-#define arch_dma_map_page_direct(d, a)		(false)
-#define arch_dma_unmap_page_direct(d, a)	(false)
+#define arch_dma_map_phys_direct(d, a)		(false)
+#define arch_dma_unmap_phys_direct(d, a)	(false)
 #define arch_dma_map_sg_direct(d, s, n)		(false)
 #define arch_dma_unmap_sg_direct(d, s, n)	(false)
 #endif
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 24c359d9c879..fa75e3070073 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -453,7 +453,7 @@ void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
 		if (sg_dma_is_bus_address(sg))
 			sg_dma_unmark_bus_address(sg);
 		else
-			dma_direct_unmap_page(dev, sg->dma_address,
+			dma_direct_unmap_phys(dev, sg->dma_address,
 					      sg_dma_len(sg), dir, attrs);
 	}
 }
@@ -476,8 +476,8 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 			 */
 			break;
 		case PCI_P2PDMA_MAP_NONE:
-			sg->dma_address = dma_direct_map_page(dev, sg_page(sg),
-					sg->offset, sg->length, dir, attrs);
+			sg->dma_address = dma_direct_map_phys(dev, sg_phys(sg),
+					sg->length, dir, attrs);
 			if (sg->dma_address == DMA_MAPPING_ERROR) {
 				ret = -EIO;
 				goto out_unmap;
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index d2c0b7e632fc..10c1ba73c482 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -80,22 +80,21 @@ static inline void dma_direct_sync_single_for_cpu(struct device *dev,
 		arch_dma_mark_clean(paddr, size);
 }
 
-static inline dma_addr_t dma_direct_map_page(struct device *dev,
-		struct page *page, unsigned long offset, size_t size,
-		enum dma_data_direction dir, unsigned long attrs)
+static inline dma_addr_t dma_direct_map_phys(struct device *dev,
+		phys_addr_t phys, size_t size, enum dma_data_direction dir,
+		unsigned long attrs)
 {
-	phys_addr_t phys = page_to_phys(page) + offset;
 	dma_addr_t dma_addr = phys_to_dma(dev, phys);
 
 	if (is_swiotlb_force_bounce(dev)) {
-		if (is_pci_p2pdma_page(page))
+		if (!pfn_valid(PHYS_PFN(phys)))
 			return DMA_MAPPING_ERROR;
 		return swiotlb_map(dev, phys, size, dir, attrs);
 	}
 
 	if (unlikely(!dma_capable(dev, dma_addr, size, true)) ||
 	    dma_kmalloc_needs_bounce(dev, size, dir)) {
-		if (is_pci_p2pdma_page(page))
+		if (!pfn_valid(PHYS_PFN(phys)))
 			return DMA_MAPPING_ERROR;
 		if (is_swiotlb_active(dev))
 			return swiotlb_map(dev, phys, size, dir, attrs);
@@ -111,7 +110,7 @@ static inline dma_addr_t dma_direct_map_page(struct device *dev,
 	return dma_addr;
 }
 
-static inline void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
+static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	phys_addr_t phys = dma_to_phys(dev, addr);
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 58482536db9b..80481a873340 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -166,8 +166,8 @@ dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
 		return DMA_MAPPING_ERROR;
 
 	if (dma_map_direct(dev, ops) ||
-	    arch_dma_map_page_direct(dev, phys + size))
-		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
+	    arch_dma_map_phys_direct(dev, phys + size))
+		addr = dma_direct_map_phys(dev, phys, size, dir, attrs);
 	else if (use_dma_iommu(dev))
 		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
 	else
@@ -187,8 +187,8 @@ void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr, size_t size,
 
 	BUG_ON(!valid_dma_direction(dir));
 	if (dma_map_direct(dev, ops) ||
-	    arch_dma_unmap_page_direct(dev, addr + size))
-		dma_direct_unmap_page(dev, addr, size, dir, attrs);
+	    arch_dma_unmap_phys_direct(dev, addr + size))
+		dma_direct_unmap_phys(dev, addr, size, dir, attrs);
 	else if (use_dma_iommu(dev))
 		iommu_dma_unmap_phys(dev, addr, size, dir, attrs);
 	else
-- 
2.49.0


