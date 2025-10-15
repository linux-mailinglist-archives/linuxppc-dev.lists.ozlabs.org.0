Return-Path: <linuxppc-dev+bounces-12902-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F27BDDA69
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 11:13:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmlkN37BLz3cmV;
	Wed, 15 Oct 2025 20:13:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760519612;
	cv=none; b=j2LKchqAVgF93doAqPGHeZcGCAL2FnaEJbu0wrBZGptW51H6QSDFTYvu1l//gPT9Sm9p4ixS0Vzywa9jigwrw87vn0x2vAcZavOz/2zpNC0pBLszZKuAZLuQmlJasm1LQdli8IOosa8KeP+Fh3W8wP91iV88WlztPUxx6XPBC69a2SUMT0Y3EOjzlIFYCEoaqTA+Shih4WrEFfGFfk8kGaBRutzGu7E/Vjk3jOOMYGwSGhl769YNnHev+wojR+dtNtYmRLOj0UGncPoY5RYzSpzxVTWWK9G2ssi/ap0swi7AP6KqKBj1ZgP+6tDp8/VAo9RSQW02WxbLSIcU9YTiLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760519612; c=relaxed/relaxed;
	bh=Li9Haq3lbAYcxxghlSIeDYQcPLVs1DBkFkgoEN9vaKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bmq9yNB+OogNNG5hzE/WyYiyNJ4Vi9nSWbml+p10bl0BPY+5JhIV7Gqa3lS1jpz6+tNHia0qTy+ewmLmQWSVTVs/uXkIRrM5iILRegtpbX4FpH4/k67AaQKmmCUYFuFa+PxtYxZ8Jb6DmcqbEGAlhEmMQ/aNaUYEXYxGi1X4oS4rCkhRHEvmUyq9N5w1AnmaFxUfDnFCq5iuQKF7CZzamj/tuc8n9jMNo97SE9dfpOKjfYqXH3zdv7pMgBpP/uaFXajeQAosNrjepRN6J1bziyLBq/lg/MFRlENpM6tW9byrERhcc77V/HLXsef72XbhJl0MTN1RaoEmxd1pHHMv8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y3t7ehyI; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y3t7ehyI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmlkM4ptPz3dDT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 20:13:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D72F4A2FA;
	Wed, 15 Oct 2025 09:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C208C4CEF9;
	Wed, 15 Oct 2025 09:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519610;
	bh=xkVzkIBhQQs+OFyzgah2MFOlPHbQvEAh/4FzKyJVicY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y3t7ehyIT/NlN8L+dYpzHFfN6zyIupuwB48mHivuKnfeqHj7ieKKf/bKb6e2wzQBl
	 7ep3Q/Q/LIf3dDbwHkIrMphHnObT+41DC3Fgo+k6dOyDbYYAqaRSopAsvbRnb0uLv4
	 x9cwbhpeKvt4yMX+XCUS0GECEIsJhCSROjiaMhxZibw5n/bN1y2vqjYxP6QGJ6qQoY
	 HZMrZaZkEXlEew59wpjWmAIe/yjEXCWQ0v29XoSJVrAGVba0fAszuLOkckEj4cwcxI
	 1+dTAwC+hwwf6RaxFXwlpbl+D/N1WB8kMJEYPn1gfu7ootqy1mDJHdBDoepcpmUq8W
	 t1N0Td+msND+g==
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
	Magnus Lindholm <linmag7@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v5 07/14] alpha: Convert mapping routine to rely on physical address
Date: Wed, 15 Oct 2025 12:12:53 +0300
Message-ID: <20251015-remove-map-page-v5-7-3bbfe3a25cdf@kernel.org>
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

Alpha doesn't need struct *page and can perform mapping based on
physical addresses. So convert it to implement new .map_phys callback.

As part of this change, remove useless BUG_ON() as DMA mapping layer
ensures that right direction is provided.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/alpha/kernel/pci_iommu.c | 48 +++++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index dc91de50f906..955b6ca61627 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -224,28 +224,26 @@ static int pci_dac_dma_supported(struct pci_dev *dev, u64 mask)
    until either pci_unmap_single or pci_dma_sync_single is performed.  */
 
 static dma_addr_t
-pci_map_single_1(struct pci_dev *pdev, void *cpu_addr, size_t size,
+pci_map_single_1(struct pci_dev *pdev, phys_addr_t paddr, size_t size,
 		 int dac_allowed)
 {
 	struct pci_controller *hose = pdev ? pdev->sysdata : pci_isa_hose;
 	dma_addr_t max_dma = pdev ? pdev->dma_mask : ISA_DMA_MASK;
+	unsigned long offset = offset_in_page(paddr);
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
@@ -255,8 +253,8 @@ pci_map_single_1(struct pci_dev *pdev, void *cpu_addr, size_t size,
 	if (dac_allowed) {
 		ret = paddr + alpha_mv.pci_dac_offset;
 
-		DBGA2("pci_map_single: [%p,%zx] -> DAC %llx from %ps\n",
-		      cpu_addr, size, ret, __builtin_return_address(0));
+		DBGA2("pci_map_single: [%pa,%zx] -> DAC %llx from %ps\n",
+		      &paddr, size, ret, __builtin_return_address(0));
 
 		return ret;
 	}
@@ -290,10 +288,10 @@ pci_map_single_1(struct pci_dev *pdev, void *cpu_addr, size_t size,
 		arena->ptes[i + dma_ofs] = mk_iommu_pte(paddr);
 
 	ret = arena->dma_base + dma_ofs * PAGE_SIZE;
-	ret += (unsigned long)cpu_addr & ~PAGE_MASK;
+	ret += offset;
 
-	DBGA2("pci_map_single: [%p,%zx] np %ld -> sg %llx from %ps\n",
-	      cpu_addr, size, npages, ret, __builtin_return_address(0));
+	DBGA2("pci_map_single: [%pa,%zx] np %ld -> sg %llx from %ps\n",
+	      &paddr, size, npages, ret, __builtin_return_address(0));
 
 	return ret;
 }
@@ -322,19 +320,18 @@ static struct pci_dev *alpha_gendev_to_pci(struct device *dev)
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
+	if (unlikely(attrs & DMA_ATTR_MMIO))
+		return DMA_MAPPING_ERROR;
 
-	dac_allowed = pdev ? pci_dac_dma_supported(pdev, pdev->dma_mask) : 0; 
-	return pci_map_single_1(pdev, (char *)page_address(page) + offset, 
-				size, dac_allowed);
+	dac_allowed = pdev ? pci_dac_dma_supported(pdev, pdev->dma_mask) : 0;
+	return pci_map_single_1(pdev, phys, size, dac_allowed);
 }
 
 /* Unmap a single streaming mode DMA translation.  The DMA_ADDR and
@@ -343,7 +340,7 @@ static dma_addr_t alpha_pci_map_page(struct device *dev, struct page *page,
    the cpu to the buffer are guaranteed to see whatever the device
    wrote there.  */
 
-static void alpha_pci_unmap_page(struct device *dev, dma_addr_t dma_addr,
+static void alpha_pci_unmap_phys(struct device *dev, dma_addr_t dma_addr,
 				 size_t size, enum dma_data_direction dir,
 				 unsigned long attrs)
 {
@@ -353,8 +350,6 @@ static void alpha_pci_unmap_page(struct device *dev, dma_addr_t dma_addr,
 	struct pci_iommu_arena *arena;
 	long dma_ofs, npages;
 
-	BUG_ON(dir == DMA_NONE);
-
 	if (dma_addr >= __direct_map_base
 	    && dma_addr < __direct_map_base + __direct_map_size) {
 		/* Nothing to do.  */
@@ -429,7 +424,7 @@ static void *alpha_pci_alloc_coherent(struct device *dev, size_t size,
 	}
 	memset(cpu_addr, 0, size);
 
-	*dma_addrp = pci_map_single_1(pdev, cpu_addr, size, 0);
+	*dma_addrp = pci_map_single_1(pdev, virt_to_phys(cpu_addr), size, 0);
 	if (*dma_addrp == DMA_MAPPING_ERROR) {
 		free_pages((unsigned long)cpu_addr, order);
 		if (alpha_mv.mv_pci_tbi || (gfp & GFP_DMA))
@@ -643,9 +638,8 @@ static int alpha_pci_map_sg(struct device *dev, struct scatterlist *sg,
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
@@ -917,8 +911,8 @@ iommu_unbind(struct pci_iommu_arena *arena, long pg_start, long pg_count)
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


