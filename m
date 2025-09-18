Return-Path: <linuxppc-dev+bounces-12387-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94147B86737
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 20:45:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSPhx3c90z3c2k;
	Fri, 19 Sep 2025 04:45:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758221137;
	cv=none; b=YAxptc7/6gXa3/5WnNhDDzLgQjYDM+zvzZN0J5H6ZebH7fgawf0vwQNe47EIfPs5nFGCorI+d2KzCnh4ysMszvopimbJ0q58w5xeiiNLE1QVdZXfvP9tcSGbX+chM0qXfpl1OFzHzYpPYjv8mmeZZFA3EsBb2Gz/c4XCL6HdLuWqCfxNC//ecrMs08Fms70KrSNy8ENNOIRZxyUG3drrAU1yXIwNRkp0QKjGWCvr8YBNBoLfIwKp21guN6kwyNin5a8L1T9olLkDqhhnC1e0LCqOkpHQSUaobvRGqmeRYkCB290/PAHNfQo6gX//o7q2UfFoZLC9107KuXX6YtK8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758221137; c=relaxed/relaxed;
	bh=zCbDND8go0s/KkEU4CQW94exBhKvdwNWVoYsvSZLjvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aV6vXs01NpcHWS0sxcnI/nLb1v/DYMs++n4wfkufjETfKX9mpzN8DThtSMF1my6rYl/7ITWGWhMZBURSWPlfLyMAOWq5FkZJj3ZHnjq4AF8gdmIuF2SdcLOspqzyEvN2OfYWyfJr/NC5TrZYrHYkFZFvDw7Z9VHCqRFUD5ydRfxrHE9l9Uc8PqMiFcDlSSfYOa4Aze8xA4XIK2qBZ/Is9NBM0BV/H70pib8UabjELeFMfwgMG1GhYz+xC/izSL05wo7Vl78C2soZnichEpETDyMQukX7Pvv3Gx1wTb5bD/+sU/yvFMr3bmq5y5jvqnh4MRV5V+l276ah38A4JKZ43A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BrezbUs7; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BrezbUs7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSPhw5SfRz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 04:45:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D69A660234;
	Thu, 18 Sep 2025 18:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C21C4CEF0;
	Thu, 18 Sep 2025 18:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758221134;
	bh=mRrCuK2cRKam5wDdOYPzkMc4IzLVg72Ycd5tZAIZOwA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BrezbUs7YQQoFiEnq4O37fij9yQqGwhFFKxGtk7W85Qc/47lo4WDrX08x8pBhOMBl
	 x3C+EqTXn/J9a/3WVpKBvLTRlkB+do/ZfwaAE2Mb7IopCTXi7LrOLKMJkkNTJfvDUp
	 YqF2kAB3MxM4nlAlg21f/GeFvZw8zg11jBWISdL9T8Q0n5qtbkyadIU6XtD1/orTr1
	 7w2ouYNTNdHOHzAOrJP4usoDUr3cv4AUvmi2rODsSOE2yxEfZKK0CI1huASdVmWoDj
	 bBSTZ3whPx0z/NsNtq26Y7bbhfgNlmo/ggZU7pwAyS1i89RmTF6XqFtx+J2G8mxe/e
	 /R99gASdkRTZg==
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
Subject: [PATCH 1/9] alpha: Convert mapping routine to rely on  physical address
Date: Thu, 18 Sep 2025 21:45:01 +0300
Message-ID: <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
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

Alpha doesn't need struct *page and can perform mapping based on
physical addresses. So convert it to implement new .map_phys callback.

As part of this change, remove useless BUG_ON() as DMA mapping layer
ensures that right direction is provided.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/alpha/kernel/pci_iommu.c | 47 +++++++++++++++--------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index dc91de50f906d..b62d9937d1d3a 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -224,28 +224,25 @@ static int pci_dac_dma_supported(struct pci_dev *dev, u64 mask)
    until either pci_unmap_single or pci_dma_sync_single is performed.  */
 
 static dma_addr_t
-pci_map_single_1(struct pci_dev *pdev, void *cpu_addr, size_t size,
+pci_map_single_1(struct pci_dev *pdev, phys_addr_t paddr, size_t size,
 		 int dac_allowed)
 {
 	struct pci_controller *hose = pdev ? pdev->sysdata : pci_isa_hose;
 	dma_addr_t max_dma = pdev ? pdev->dma_mask : ISA_DMA_MASK;
 	struct pci_iommu_arena *arena;
 	long npages, dma_ofs, i;
-	unsigned long paddr;
 	dma_addr_t ret;
 	unsigned int align = 0;
 	struct device *dev = pdev ? &pdev->dev : NULL;
 
-	paddr = __pa(cpu_addr);
-
 #if !DEBUG_NODIRECT
 	/* First check to see if we can use the direct map window.  */
 	if (paddr + size + __direct_map_base - 1 <= max_dma
 	    && paddr + size <= __direct_map_size) {
 		ret = paddr + __direct_map_base;
 
-		DBGA2("pci_map_single: [%p,%zx] -> direct %llx from %ps\n",
-		      cpu_addr, size, ret, __builtin_return_address(0));
+		DBGA2("pci_map_single: [%pa,%zx] -> direct %llx from %ps\n",
+		      &paddr, size, ret, __builtin_return_address(0));
 
 		return ret;
 	}
@@ -255,8 +252,8 @@ pci_map_single_1(struct pci_dev *pdev, void *cpu_addr, size_t size,
 	if (dac_allowed) {
 		ret = paddr + alpha_mv.pci_dac_offset;
 
-		DBGA2("pci_map_single: [%p,%zx] -> DAC %llx from %ps\n",
-		      cpu_addr, size, ret, __builtin_return_address(0));
+		DBGA2("pci_map_single: [%pa,%zx] -> DAC %llx from %ps\n",
+		      &paddr, size, ret, __builtin_return_address(0));
 
 		return ret;
 	}
@@ -290,10 +287,10 @@ pci_map_single_1(struct pci_dev *pdev, void *cpu_addr, size_t size,
 		arena->ptes[i + dma_ofs] = mk_iommu_pte(paddr);
 
 	ret = arena->dma_base + dma_ofs * PAGE_SIZE;
-	ret += (unsigned long)cpu_addr & ~PAGE_MASK;
+	ret += offset_in_page(paddr);
 
-	DBGA2("pci_map_single: [%p,%zx] np %ld -> sg %llx from %ps\n",
-	      cpu_addr, size, npages, ret, __builtin_return_address(0));
+	DBGA2("pci_map_single: [%pa,%zx] np %ld -> sg %llx from %ps\n",
+	      &paddr, size, npages, ret, __builtin_return_address(0));
 
 	return ret;
 }
@@ -322,19 +319,18 @@ static struct pci_dev *alpha_gendev_to_pci(struct device *dev)
 	return NULL;
 }
 
-static dma_addr_t alpha_pci_map_page(struct device *dev, struct page *page,
-				     unsigned long offset, size_t size,
-				     enum dma_data_direction dir,
+static dma_addr_t alpha_pci_map_phys(struct device *dev, phys_addr_t phys,
+				     size_t size, enum dma_data_direction dir,
 				     unsigned long attrs)
 {
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
 	int dac_allowed;
 
-	BUG_ON(dir == DMA_NONE);
+	if (attrs & DMA_ATTR_MMIO)
+		return DMA_MAPPING_ERROR;
 
-	dac_allowed = pdev ? pci_dac_dma_supported(pdev, pdev->dma_mask) : 0; 
-	return pci_map_single_1(pdev, (char *)page_address(page) + offset, 
-				size, dac_allowed);
+	dac_allowed = pdev ? pci_dac_dma_supported(pdev, pdev->dma_mask) : 0;
+	return pci_map_single_1(pdev, phys, size, dac_allowed);
 }
 
 /* Unmap a single streaming mode DMA translation.  The DMA_ADDR and
@@ -343,7 +339,7 @@ static dma_addr_t alpha_pci_map_page(struct device *dev, struct page *page,
    the cpu to the buffer are guaranteed to see whatever the device
    wrote there.  */
 
-static void alpha_pci_unmap_page(struct device *dev, dma_addr_t dma_addr,
+static void alpha_pci_unmap_phys(struct device *dev, dma_addr_t dma_addr,
 				 size_t size, enum dma_data_direction dir,
 				 unsigned long attrs)
 {
@@ -353,8 +349,6 @@ static void alpha_pci_unmap_page(struct device *dev, dma_addr_t dma_addr,
 	struct pci_iommu_arena *arena;
 	long dma_ofs, npages;
 
-	BUG_ON(dir == DMA_NONE);
-
 	if (dma_addr >= __direct_map_base
 	    && dma_addr < __direct_map_base + __direct_map_size) {
 		/* Nothing to do.  */
@@ -429,7 +423,7 @@ static void *alpha_pci_alloc_coherent(struct device *dev, size_t size,
 	}
 	memset(cpu_addr, 0, size);
 
-	*dma_addrp = pci_map_single_1(pdev, cpu_addr, size, 0);
+	*dma_addrp = pci_map_single_1(pdev, virt_to_phys(cpu_addr), size, 0);
 	if (*dma_addrp == DMA_MAPPING_ERROR) {
 		free_pages((unsigned long)cpu_addr, order);
 		if (alpha_mv.mv_pci_tbi || (gfp & GFP_DMA))
@@ -643,9 +637,8 @@ static int alpha_pci_map_sg(struct device *dev, struct scatterlist *sg,
 	/* Fast path single entry scatterlists.  */
 	if (nents == 1) {
 		sg->dma_length = sg->length;
-		sg->dma_address
-		  = pci_map_single_1(pdev, SG_ENT_VIRT_ADDRESS(sg),
-				     sg->length, dac_allowed);
+		sg->dma_address = pci_map_single_1(pdev, sg_phys(sg),
+						   sg->length, dac_allowed);
 		if (sg->dma_address == DMA_MAPPING_ERROR)
 			return -EIO;
 		return 1;
@@ -917,8 +910,8 @@ iommu_unbind(struct pci_iommu_arena *arena, long pg_start, long pg_count)
 const struct dma_map_ops alpha_pci_ops = {
 	.alloc			= alpha_pci_alloc_coherent,
 	.free			= alpha_pci_free_coherent,
-	.map_page		= alpha_pci_map_page,
-	.unmap_page		= alpha_pci_unmap_page,
+	.map_phys		= alpha_pci_map_phys,
+	.unmap_phys		= alpha_pci_unmap_phys,
 	.map_sg			= alpha_pci_map_sg,
 	.unmap_sg		= alpha_pci_unmap_sg,
 	.dma_supported		= alpha_pci_supported,
-- 
2.51.0


