Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 333D97D063
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 23:58:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zS4B6Y6JzDqpL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 07:58:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de;
 envelope-from=nsaenzjulienne@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zHrl4H0ZzDqmK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2019 01:48:16 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B8A38AFFB;
 Wed, 31 Jul 2019 15:48:08 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: catalin.marinas@arm.com, hch@lst.de, wahrenst@gmx.net,
 marc.zyngier@arm.com, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-mm@kvack.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 6/8] dma-direct: turn ARCH_ZONE_DMA_BITS into a variable
Date: Wed, 31 Jul 2019 17:47:49 +0200
Message-Id: <20190731154752.16557-7-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731154752.16557-1-nsaenzjulienne@suse.de>
References: <20190731154752.16557-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 01 Aug 2019 07:55:07 +1000
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
Cc: phill@raspberryi.org, linux-s390@vger.kernel.org, f.fainelli@gmail.com,
 Vasily Gorbik <gor@linux.ibm.com>, mbrugger@suse.com, frowand.list@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-kernel@vger.kernel.org, eric@anholt.net, robh+dt@kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-rpi-kernel@lists.infradead.org,
 akpm@linux-foundation.org, will@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, nsaenzjulienne@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some architectures, notably arm64, are interested in tweaking this
depending on their runtime dma addressing limitations.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---

 arch/powerpc/include/asm/page.h |  9 ---------
 arch/powerpc/mm/mem.c           | 14 ++++++++++++--
 arch/s390/include/asm/page.h    |  2 --
 arch/s390/mm/init.c             |  1 +
 include/linux/dma-direct.h      |  2 ++
 kernel/dma/direct.c             |  8 +++-----
 6 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index 0d52f57fca04..73668a21ae78 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -319,13 +319,4 @@ struct vm_area_struct;
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
index 9191a66b3bc5..3792a998ca02 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -31,6 +31,7 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include <linux/memremap.h>
+#include <linux/dma-direct.h>
 
 #include <asm/pgalloc.h>
 #include <asm/prom.h>
@@ -201,7 +202,7 @@ static int __init mark_nonram_nosave(void)
  * everything else. GFP_DMA32 page allocations automatically fall back to
  * ZONE_DMA.
  *
- * By using 31-bit unconditionally, we can exploit ARCH_ZONE_DMA_BITS to
+ * By using 31-bit unconditionally, we can exploit arch_zone_dma_bits to
  * inform the generic DMA mapping code.  32-bit only devices (if not handled
  * by an IOMMU anyway) will take a first dip into ZONE_NORMAL and get
  * otherwise served by ZONE_DMA.
@@ -237,9 +238,18 @@ void __init paging_init(void)
 	printk(KERN_DEBUG "Memory hole size: %ldMB\n",
 	       (long int)((top_of_ram - total_ram) >> 20));
 
+	/*
+	 * Allow 30-bit DMA for very limited Broadcom wifi chips on many
+	 * powerbooks.
+	 */
+	if (IS_ENABLED(CONFIG_PPC32))
+		arch_zone_dma_bits = 30;
+	else
+		arch_zone_dma_bits = 31;
+
 #ifdef CONFIG_ZONE_DMA
 	max_zone_pfns[ZONE_DMA]	= min(max_low_pfn,
-				      1UL << (ARCH_ZONE_DMA_BITS - PAGE_SHIFT));
+				      1UL << (arch_zone_dma_bits - PAGE_SHIFT));
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
index 20340a03ad90..07d93955d3e4 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -118,6 +118,7 @@ void __init paging_init(void)
 
 	sparse_memory_present_with_active_regions(MAX_NUMNODES);
 	sparse_init();
+	arch_zone_dma_bits = 31;
 	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
 	max_zone_pfns[ZONE_DMA] = PFN_DOWN(MAX_DMA_ADDRESS);
 	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index adf993a3bd58..a1b353b77858 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -5,6 +5,8 @@
 #include <linux/dma-mapping.h>
 #include <linux/mem_encrypt.h>
 
+extern unsigned int arch_zone_dma_bits;
+
 #ifdef CONFIG_ARCH_HAS_PHYS_TO_DMA
 #include <asm/dma-direct.h>
 #else
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 59bdceea3737..40dfc9b4ee4c 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -19,9 +19,7 @@
  * Most architectures use ZONE_DMA for the first 16 Megabytes, but
  * some use it for entirely different regions:
  */
-#ifndef ARCH_ZONE_DMA_BITS
-#define ARCH_ZONE_DMA_BITS 24
-#endif
+unsigned int arch_zone_dma_bits __ro_after_init = 24;
 
 static void report_addr(struct device *dev, dma_addr_t dma_addr, size_t size)
 {
@@ -72,7 +70,7 @@ static gfp_t __dma_direct_optimal_gfp_mask(struct device *dev, u64 dma_mask,
 	 * Note that GFP_DMA32 and GFP_DMA are no ops without the corresponding
 	 * zones.
 	 */
-	if (*phys_mask <= DMA_BIT_MASK(ARCH_ZONE_DMA_BITS))
+	if (*phys_mask <= DMA_BIT_MASK(arch_zone_dma_bits))
 		return GFP_DMA;
 	if (*phys_mask <= DMA_BIT_MASK(32))
 		return GFP_DMA32;
@@ -387,7 +385,7 @@ int dma_direct_supported(struct device *dev, u64 mask)
 	u64 min_mask;
 
 	if (IS_ENABLED(CONFIG_ZONE_DMA))
-		min_mask = DMA_BIT_MASK(ARCH_ZONE_DMA_BITS);
+		min_mask = DMA_BIT_MASK(arch_zone_dma_bits);
 	else
 		min_mask = DMA_BIT_MASK(32);
 
-- 
2.22.0

