Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 315DB94468C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 10:26:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=ssxJC2sJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZMVp0zSsz3dFH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 18:26:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=ssxJC2sJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tkos.co.il (client-ip=84.110.109.230; helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=lists.ozlabs.org)
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZMV44j6Vz3cnS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 18:25:32 +1000 (AEST)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id 3A250440C81;
	Thu,  1 Aug 2024 11:24:08 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1722500648;
	bh=VYVg6dcZoMgPVC5tuSCiZfCedBjhw7Yn+Yo8u4T9MuM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ssxJC2sJd1ijT27i1CV2M9jYOwBkr6JiQYHHngELXwKyu5I9JhzfU99bTyh06TtFO
	 Srdqp5si6rY/clGAqYHZT1D29gf6+NM+pQitik8pY4S+v6OPowHT/08oLa1wMU/XAe
	 JtwZLyQhv1GWdlo+ekjGN2D4tiC7FbN6BZVOXHzEYeL439+1Om6k7NJ0Mh+PqKpZ0M
	 yLHdXOMxPUx+VLOiKTDLBsYyjx/5R+TE4s+U/ZGExJ8LEd9dHI5/8HK3NENUWGjhgu
	 quovkSb1C42G3Ihaqs0FtgNmEwfw5QKO65Q7WPPaaK0Gz95ng8M2HQEqwbJV8FSWWh
	 2iglGBoKd9B9Q==
From: Baruch Siach <baruch@tkos.co.il>
To: Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 2/2] dma: replace zone_dma_bits by zone_dma_limit
Date: Thu,  1 Aug 2024 11:25:07 +0300
Message-ID: <f05178048096908a13379a61ca56f0035a5cdb2d.1722499975.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1722499975.git.baruch@tkos.co.il>
References: <cover.1722499975.git.baruch@tkos.co.il>
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
Cc: linux-s390@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Ramon Fried <ramon@neureality.ai>, =?UTF-8?q?Petr=20Tesa=C5=99=C3=ADk?= <petr@tesarici.cz>, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Catalin Marinas <catalin.marinas@arm.com>

Hardware DMA limit might not be power of 2. When RAM range starts above
0, say 4GB, DMA limit of 30 bits should end at 5GB. A single high bit
can not encode this limit.

Use direct phys_addr_t limit address for DMA zone limit.

Current code using zone_dma_bits assume that all address range below
limit is suitable for DMA. For some existing platforms this assumption
is not correct. DMA range might have non zero lower limit.

Commit 791ab8b2e3db ("arm64: Ignore any DMA offsets in the
max_zone_phys() calculation") made arm64 DMA/DMA32 zones span the entire
RAM when RAM starts above 32-bits. This breaks hardware with DMA area
that start above 32-bits. But the commit log says that "we haven't
noticed any such hardware". It turns out that such hardware does exist.

One such platform has RAM starting at 32GB with an internal bus that has
the following DMA limits:

  #address-cells = <2>;
  #size-cells = <2>;
  dma-ranges = <0x00 0xc0000000 0x08 0x00000000 0x00 0x40000000>;

That is, devices under this bus see 1GB of DMA range between 3GB-4GB in
their address space. This range is mapped to CPU memory at 32GB-33GB.
With current code DMA allocations for devices under this bus are not
limited to DMA area, leading to run-time allocation failure.

With the move to zone_dma_limit DMA allocation for constrained devices
becomes possible.

The result is DMA zone that properly reflects the hardware constraints
as follows:

[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000800000000-0x000000083fffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000840000000-0x0000000bffffffff]

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Co-developed-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 arch/arm64/mm/init.c       | 30 +++++++++++++++---------------
 arch/powerpc/mm/mem.c      |  9 ++++-----
 arch/s390/mm/init.c        |  2 +-
 include/linux/dma-direct.h |  2 +-
 kernel/dma/direct.c        |  4 ++--
 kernel/dma/pool.c          |  5 +++--
 kernel/dma/swiotlb.c       |  2 +-
 7 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 9b5ab6818f7f..c45e2152ca9e 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -115,35 +115,35 @@ static void __init arch_reserve_crashkernel(void)
 }
 
 /*
- * Return the maximum physical address for a zone accessible by the given bits
- * limit. If DRAM starts above 32-bit, expand the zone to the maximum
+ * Return the maximum physical address for a zone given its limit.
+ * If DRAM starts above 32-bit, expand the zone to the maximum
  * available memory, otherwise cap it at 32-bit.
  */
-static phys_addr_t __init max_zone_phys(unsigned int zone_bits)
+static phys_addr_t __init max_zone_phys(phys_addr_t zone_limit)
 {
-	phys_addr_t zone_mask = DMA_BIT_MASK(zone_bits);
 	phys_addr_t phys_start = memblock_start_of_DRAM();
 
 	if (phys_start > U32_MAX)
-		zone_mask = PHYS_ADDR_MAX;
-	else if (phys_start > zone_mask)
-		zone_mask = U32_MAX;
+		zone_limit = PHYS_ADDR_MAX;
+	else if (phys_start > zone_limit)
+		zone_limit = U32_MAX;
 
-	return min(zone_mask, memblock_end_of_DRAM() - 1) + 1;
+	return min(zone_limit, memblock_end_of_DRAM() - 1) + 1;
 }
 
 static void __init zone_sizes_init(void)
 {
 	unsigned long max_zone_pfns[MAX_NR_ZONES]  = {0};
-	unsigned int __maybe_unused acpi_zone_dma_bits;
-	unsigned int __maybe_unused dt_zone_dma_bits;
-	phys_addr_t __maybe_unused dma32_phys_limit = max_zone_phys(32);
+	phys_addr_t __maybe_unused acpi_zone_dma_limit;
+	phys_addr_t __maybe_unused dt_zone_dma_limit;
+	phys_addr_t __maybe_unused dma32_phys_limit =
+		max_zone_phys(DMA_BIT_MASK(32));
 
 #ifdef CONFIG_ZONE_DMA
-	acpi_zone_dma_bits = fls64(acpi_iort_dma_get_max_cpu_address());
-	dt_zone_dma_bits = fls64(of_dma_get_max_cpu_address(NULL));
-	zone_dma_bits = min3(32U, dt_zone_dma_bits, acpi_zone_dma_bits);
-	arm64_dma_phys_limit = max_zone_phys(zone_dma_bits);
+	acpi_zone_dma_limit = acpi_iort_dma_get_max_cpu_address();
+	dt_zone_dma_limit = of_dma_get_max_cpu_address(NULL);
+	zone_dma_limit = min(dt_zone_dma_limit, acpi_zone_dma_limit);
+	arm64_dma_phys_limit = max_zone_phys(zone_dma_limit);
 	max_zone_pfns[ZONE_DMA] = PFN_DOWN(arm64_dma_phys_limit);
 #endif
 #ifdef CONFIG_ZONE_DMA32
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index d325217ab201..342c006cc1b8 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -216,7 +216,7 @@ static int __init mark_nonram_nosave(void)
  * everything else. GFP_DMA32 page allocations automatically fall back to
  * ZONE_DMA.
  *
- * By using 31-bit unconditionally, we can exploit zone_dma_bits to inform the
+ * By using 31-bit unconditionally, we can exploit zone_dma_limit to inform the
  * generic DMA mapping code.  32-bit only devices (if not handled by an IOMMU
  * anyway) will take a first dip into ZONE_NORMAL and get otherwise served by
  * ZONE_DMA.
@@ -252,13 +252,12 @@ void __init paging_init(void)
 	 * powerbooks.
 	 */
 	if (IS_ENABLED(CONFIG_PPC32))
-		zone_dma_bits = 30;
+		zone_dma_limit = DMA_BIT_MASK(30);
 	else
-		zone_dma_bits = 31;
+		zone_dma_limit = DMA_BIT_MASK(31);
 
 #ifdef CONFIG_ZONE_DMA
-	max_zone_pfns[ZONE_DMA]	= min(max_low_pfn,
-				      1UL << (zone_dma_bits - PAGE_SHIFT));
+	max_zone_pfns[ZONE_DMA]	= min(max_low_pfn, zone_dma_limit >> PAGE_SHIFT);
 #endif
 	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
 #ifdef CONFIG_HIGHMEM
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index ddcd39ef4346..91fc2b91adfc 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -97,7 +97,7 @@ void __init paging_init(void)
 
 	vmem_map_init();
 	sparse_init();
-	zone_dma_bits = 31;
+	zone_dma_limit = DMA_BIT_MASK(31);
 	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
 	max_zone_pfns[ZONE_DMA] = virt_to_pfn(MAX_DMA_ADDRESS);
 	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index edbe13d00776..98b7d8015043 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -12,7 +12,7 @@
 #include <linux/mem_encrypt.h>
 #include <linux/swiotlb.h>
 
-extern unsigned int zone_dma_bits;
+extern phys_addr_t zone_dma_limit;
 
 /*
  * Record the mapping of CPU physical to DMA addresses for a given region.
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 3b4be4ca3b08..3dbc0b89d6fb 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -20,7 +20,7 @@
  * it for entirely different regions. In that case the arch code needs to
  * override the variable below for dma-direct to work properly.
  */
-unsigned int zone_dma_bits __ro_after_init = 24;
+phys_addr_t zone_dma_limit __ro_after_init = DMA_BIT_MASK(24);
 
 static inline dma_addr_t phys_to_dma_direct(struct device *dev,
 		phys_addr_t phys)
@@ -580,7 +580,7 @@ int dma_direct_supported(struct device *dev, u64 mask)
 	 * part of the check.
 	 */
 	if (IS_ENABLED(CONFIG_ZONE_DMA))
-		min_mask = min_t(u64, min_mask, DMA_BIT_MASK(zone_dma_bits));
+		min_mask = min_t(u64, min_mask, zone_dma_limit);
 	return mask >= phys_to_dma_unencrypted(dev, min_mask);
 }
 
diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
index d10613eb0f63..a6e15db9d1e7 100644
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -70,9 +70,10 @@ static bool cma_in_zone(gfp_t gfp)
 	/* CMA can't cross zone boundaries, see cma_activate_area() */
 	end = cma_get_base(cma) + size - 1;
 	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp & GFP_DMA))
-		return end <= DMA_BIT_MASK(zone_dma_bits);
+		return end <= zone_dma_limit;
+	/* Account for possible zone_dma_limit > DMA_BIT_MASK(32) */
 	if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp & GFP_DMA32))
-		return end <= DMA_BIT_MASK(32);
+		return end <= DMA_BIT_MASK(32) || end <= zone_dma_limit;
 	return true;
 }
 
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 043b0ecd3e8d..53595eb41922 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -450,7 +450,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 	if (!remap)
 		io_tlb_default_mem.can_grow = true;
 	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp_mask & __GFP_DMA))
-		io_tlb_default_mem.phys_limit = DMA_BIT_MASK(zone_dma_bits);
+		io_tlb_default_mem.phys_limit = zone_dma_limit;
 	else if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp_mask & __GFP_DMA32))
 		io_tlb_default_mem.phys_limit = DMA_BIT_MASK(32);
 	else
-- 
2.43.0

