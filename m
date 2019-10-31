Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 713E3EB40E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 16:37:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473qFp0L60zF4w2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 02:37:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de;
 envelope-from=nsaenzjulienne@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473qBz4hjDzF5w0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 02:35:06 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C6713B24D;
 Thu, 31 Oct 2019 15:35:00 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] dma/direct: turn ARCH_ZONE_DMA_BITS into a variable
Date: Thu, 31 Oct 2019 16:28:37 +0100
Message-Id: <20191031152837.15253-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.23.0
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, Paul Mackerras <paulus@samba.org>,
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some architectures, notably ARM, are interested in tweaking this
depending on their runtime DMA addressing limitations.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---

Changes since RFC:
 - Rebased to v5.4-rc6, fixed arm64 code.

NOTE: This will only apply to linux-next, where 
 arch/arm64/mm/init.c            |  5 +++++
 arch/powerpc/include/asm/page.h |  9 ---------
 arch/powerpc/mm/mem.c           | 20 +++++++++++++++-----
 arch/s390/include/asm/page.h    |  2 --
 arch/s390/mm/init.c             |  1 +
 include/linux/dma-direct.h      |  2 ++
 kernel/dma/direct.c             | 13 ++++++-------
 7 files changed, 29 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 45c00a54909c..f716ea634804 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -20,6 +20,7 @@
 #include <linux/sort.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
+#include <linux/dma-direct.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma-contiguous.h>
 #include <linux/efi.h>
@@ -41,6 +42,8 @@
 #include <asm/tlb.h>
 #include <asm/alternative.h>
 
+#define ARM64_ZONE_DMA_BITS	30
+
 /*
  * We need to be able to catch inadvertent references to memstart_addr
  * that occur (potentially in generic code) before arm64_memblock_init()
@@ -424,6 +427,8 @@ void __init arm64_memblock_init(void)
 	else
 		arm64_dma_phys_limit = PHYS_MASK + 1;
 
+	zone_dma_bits = ARM64_ZONE_DMA_BITS;
+
 	reserve_crashkernel();
 
 	reserve_elfcorehdr();
diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index c8bb14ff4713..f6c562acc3f8 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -329,13 +329,4 @@ struct vm_area_struct;
 #endif /* __ASSEMBLY__ */
 #include <asm/slice.h>
 
-/*
- * Allow 30-bit DMA for very limited Broadcom wifi chips on many powerbooks.
- */
-#ifdef CONFIG_PPC32
-#define ARCH_ZONE_DMA_BITS 30
-#else
-#define ARCH_ZONE_DMA_BITS 31
-#endif
-
 #endif /* _ASM_POWERPC_PAGE_H */
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index be941d382c8d..c95b7fe9f298 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -31,6 +31,7 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include <linux/memremap.h>
+#include <linux/dma-direct.h>
 
 #include <asm/pgalloc.h>
 #include <asm/prom.h>
@@ -201,10 +202,10 @@ static int __init mark_nonram_nosave(void)
  * everything else. GFP_DMA32 page allocations automatically fall back to
  * ZONE_DMA.
  *
- * By using 31-bit unconditionally, we can exploit ARCH_ZONE_DMA_BITS to
- * inform the generic DMA mapping code.  32-bit only devices (if not handled
- * by an IOMMU anyway) will take a first dip into ZONE_NORMAL and get
- * otherwise served by ZONE_DMA.
+ * By using 31-bit unconditionally, we can exploit zone_dma_bits to inform the
+ * generic DMA mapping code.  32-bit only devices (if not handled by an IOMMU
+ * anyway) will take a first dip into ZONE_NORMAL and get otherwise served by
+ * ZONE_DMA.
  */
 static unsigned long max_zone_pfns[MAX_NR_ZONES];
 
@@ -237,9 +238,18 @@ void __init paging_init(void)
 	printk(KERN_DEBUG "Memory hole size: %ldMB\n",
 	       (long int)((top_of_ram - total_ram) >> 20));
 
+	/*
+	 * Allow 30-bit DMA for very limited Broadcom wifi chips on many
+	 * powerbooks.
+	 */
+	if (IS_ENABLED(CONFIG_PPC32))
+		zone_dma_bits = 30;
+	else
+		zone_dma_bits = 31;
+
 #ifdef CONFIG_ZONE_DMA
 	max_zone_pfns[ZONE_DMA]	= min(max_low_pfn,
-				      1UL << (ARCH_ZONE_DMA_BITS - PAGE_SHIFT));
+				      1UL << (zone_dma_bits - PAGE_SHIFT));
 #endif
 	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
 #ifdef CONFIG_HIGHMEM
diff --git a/arch/s390/include/asm/page.h b/arch/s390/include/asm/page.h
index 823578c6b9e2..a4d38092530a 100644
--- a/arch/s390/include/asm/page.h
+++ b/arch/s390/include/asm/page.h
@@ -177,8 +177,6 @@ static inline int devmem_is_allowed(unsigned long pfn)
 #define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | \
 				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
 
-#define ARCH_ZONE_DMA_BITS	31
-
 #include <asm-generic/memory_model.h>
 #include <asm-generic/getorder.h>
 
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index a124f19f7b3c..f0ce22220565 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -118,6 +118,7 @@ void __init paging_init(void)
 
 	sparse_memory_present_with_active_regions(MAX_NUMNODES);
 	sparse_init();
+	zone_dma_bits = 31;
 	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
 	max_zone_pfns[ZONE_DMA] = PFN_DOWN(MAX_DMA_ADDRESS);
 	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index adf993a3bd58..d03af3605460 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -5,6 +5,8 @@
 #include <linux/dma-mapping.h>
 #include <linux/mem_encrypt.h>
 
+extern unsigned int zone_dma_bits;
+
 #ifdef CONFIG_ARCH_HAS_PHYS_TO_DMA
 #include <asm/dma-direct.h>
 #else
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 8402b29c280f..0b67c04e531b 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -16,12 +16,11 @@
 #include <linux/swiotlb.h>
 
 /*
- * Most architectures use ZONE_DMA for the first 16 Megabytes, but
- * some use it for entirely different regions:
+ * Most architectures use ZONE_DMA for the first 16 Megabytes, but some use it
+ * it for entirely different regions. In that case the arch code needs to
+ * override the variable below for dma-direct to work properly.
  */
-#ifndef ARCH_ZONE_DMA_BITS
-#define ARCH_ZONE_DMA_BITS 24
-#endif
+unsigned int zone_dma_bits __ro_after_init = 24;
 
 static void report_addr(struct device *dev, dma_addr_t dma_addr, size_t size)
 {
@@ -69,7 +68,7 @@ static gfp_t __dma_direct_optimal_gfp_mask(struct device *dev, u64 dma_mask,
 	 * Note that GFP_DMA32 and GFP_DMA are no ops without the corresponding
 	 * zones.
 	 */
-	if (*phys_mask <= DMA_BIT_MASK(ARCH_ZONE_DMA_BITS))
+	if (*phys_mask <= DMA_BIT_MASK(zone_dma_bits))
 		return GFP_DMA;
 	if (*phys_mask <= DMA_BIT_MASK(32))
 		return GFP_DMA32;
@@ -395,7 +394,7 @@ int dma_direct_supported(struct device *dev, u64 mask)
 	u64 min_mask;
 
 	if (IS_ENABLED(CONFIG_ZONE_DMA))
-		min_mask = DMA_BIT_MASK(ARCH_ZONE_DMA_BITS);
+		min_mask = DMA_BIT_MASK(zone_dma_bits);
 	else
 		min_mask = DMA_BIT_MASK(32);
 
-- 
2.23.0

