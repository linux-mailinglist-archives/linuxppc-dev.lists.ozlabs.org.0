Return-Path: <linuxppc-dev+bounces-14907-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A59CD0CCA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Dec 2025 17:16:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXt2v0cS5z2yG2;
	Sat, 20 Dec 2025 03:16:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766161014;
	cv=none; b=e+24Yp3nbxogpnDM3mDPq8VVBBfSwFUbmlfr9C0Y5edm7rU3lTTqb0BcjTq88rh+dlaGl3uRnZ8U2lheoBzYd/L7V+qJUabpR/bp8by+tpam1ez3xSbKsrRcskM1n5SVPu9U9pu2bvOJ7AthJh2faOuEspZDasbfVjvjG17J5GI/Rq2m3yIbBv7AakK0xy4wtwt9LNTTGTQZtO8CSFe5ZGgdRbbVw/joXRxCd6cizPvY99yQRj9EIehO3uV2XHGKCjp+orah6n72UsJlh/J/eeSxPZmi8YDbAgxencj6bgS5LoS5IOo4BeLJ2wHzig1tuQdiRKtsJqeNnHHSF6eErw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766161014; c=relaxed/relaxed;
	bh=KgJjJXiTV17BhBdBs5ApeNOoNrgTIbF5yg2BLm3kDUk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HzXRZQsES+Ena65aUqBrSZlt5MF4sRiWfDtfxta9OVoDOK5zOxknJNKfXvwaZLhnU9M2CH3TGF5CGJ8LQSu+2qD5nn4YSVqpdj1zgVZadXT0Wt9Aa9Olb25XFAPwipEWmAfRBTiVJYkRCF27XxPb+vb7Vxg8k84Qvx90+fMaow8WGCu1q/v3ylFKsQllw1M9GszqbDhibJP/aENz7Rt5K+A0HsmBOaVoO4WVwij16Ps/crLNvCgvpdb1B2JNeC+cObeGDlNGeyTusMcHqooSuD6ckw3HwTq00Lx5zOYKryOg4cj1IXFtC+fGX/1zghkwrDCP8upisSdYlU7EOZzMYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tWFoP8Zs; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tWFoP8Zs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXt2t14N7z2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Dec 2025 03:16:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A8F1E60165;
	Fri, 19 Dec 2025 16:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5340DC116D0;
	Fri, 19 Dec 2025 16:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766161011;
	bh=n8EL94QbXkjpZrKNco8jY54zTJbVUAiuP3D8k2SB3mU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tWFoP8ZsYkLEYCvizSOtfAaPNjhLJqzsaF7tHY3aqA7oUXtgJO3ERCYDqUD2Js3e+
	 5R5GQI33x+FNwMdA3E8CZJRT4GQ969i4oVXw80U8LK3ks+idDCR+70rd4jVj2rwHCu
	 kssBP+UXAx1ooEXkfFjs0SmM6fYabVLEw6M6l6N0xvkWoXGdt/rIfFA2d216ZHS3cB
	 FIZAc5TXF6+EHaLenImHZnM9YLo5PcMNwpzayFQHJhxsfFSftTUlPHdETPa3CUsJPF
	 iGSBq0GmTIUzJkVMbAliGgGFOFRDBxBcKxHux2RePNHcYTYv3akMLZY0VVzM6zGNv8
	 fCH3UMvStvSpg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthew Wilcox <willy@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 3/4] ARM: remove support for highmem on VIVT
Date: Fri, 19 Dec 2025 17:15:58 +0100
Message-Id: <20251219161559.556737-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251219161559.556737-1-arnd@kernel.org>
References: <20251219161559.556737-1-arnd@kernel.org>
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

From: Arnd Bergmann <arnd@arndb.de>

As Jason Gunthorpe noticed, supporting VIVT caches adds some complications
to highmem that can be avoided these days:

While all ARMv4 and ARMv5 CPUs use virtually indexed caches, they no
longer really need highmem because we have practically discontinued
support for large-memory configurations already.  The only machines I
could find anywhere for memory on ARMv5 are:

 - The Intel IOP platform was used on relatively large memory
   configurations but we dropped kernel support in 2019 and 2022,
   respectively.

 - The Marvell mv78xx0 platform was the initial user of Arm highmem,
   with the DB-78x00-BP supporting 2GB of memory. While the platform
   is still around, the only remaining board file is for
   Buffalo WLX (Terastation Duo), which has only 512MB.

 - The Kirkwood platform supports 2GB, and there are actually boards
   with that configuration that can still work. However, there are
   no known users of the OpenBlocks A7, and the Freebox V6 is already
   using CONFIG_VMSPLIT_2G to avoid enabling highmem.

Remove the Arm specific portions here, making CONFIG_HIGHMEM conditional
on modern caches.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig                    |  1 +
 arch/arm/configs/gemini_defconfig   |  1 -
 arch/arm/configs/multi_v5_defconfig |  1 -
 arch/arm/configs/mvebu_v5_defconfig |  1 -
 arch/arm/include/asm/highmem.h      | 56 ++---------------------------
 arch/arm/mm/cache-feroceon-l2.c     | 31 ++--------------
 arch/arm/mm/cache-xsc3l2.c          | 47 +++---------------------
 arch/arm/mm/dma-mapping.c           | 12 ++-----
 arch/arm/mm/flush.c                 | 19 +++-------
 9 files changed, 16 insertions(+), 153 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 921ea61aa96e..790897a457d4 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1204,6 +1204,7 @@ config ARCH_SPARSEMEM_ENABLE
 config HIGHMEM
 	bool "High Memory Support"
 	depends on MMU
+	depends on !CPU_CACHE_VIVT
 	select KMAP_LOCAL
 	select KMAP_LOCAL_NON_LINEAR_PTE_ARRAY
 	help
diff --git a/arch/arm/configs/gemini_defconfig b/arch/arm/configs/gemini_defconfig
index 7b1daec630cb..1bb4f47ea3c8 100644
--- a/arch/arm/configs/gemini_defconfig
+++ b/arch/arm/configs/gemini_defconfig
@@ -12,7 +12,6 @@ CONFIG_ARCH_MULTI_V4=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_GEMINI=y
 CONFIG_AEABI=y
-CONFIG_HIGHMEM=y
 CONFIG_CMDLINE="console=ttyS0,115200n8"
 CONFIG_PM=y
 CONFIG_PARTITION_ADVANCED=y
diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index 59b020e66a0b..5106fc2d2a00 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -37,7 +37,6 @@ CONFIG_MACH_MSS2_DT=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_VERSATILE=y
 CONFIG_AEABI=y
-CONFIG_HIGHMEM=y
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
 CONFIG_CPU_FREQ=y
diff --git a/arch/arm/configs/mvebu_v5_defconfig b/arch/arm/configs/mvebu_v5_defconfig
index d1742a7cae6a..ba17bd3237fb 100644
--- a/arch/arm/configs/mvebu_v5_defconfig
+++ b/arch/arm/configs/mvebu_v5_defconfig
@@ -24,7 +24,6 @@ CONFIG_MACH_D2NET_DT=y
 CONFIG_MACH_NET2BIG=y
 CONFIG_MACH_MSS2_DT=y
 CONFIG_AEABI=y
-CONFIG_HIGHMEM=y
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
 CONFIG_CPU_FREQ=y
diff --git a/arch/arm/include/asm/highmem.h b/arch/arm/include/asm/highmem.h
index bdb209e002a4..67ed46d1922b 100644
--- a/arch/arm/include/asm/highmem.h
+++ b/arch/arm/include/asm/highmem.h
@@ -11,66 +11,14 @@
 #define PKMAP_NR(virt)		(((virt) - PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)		(PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-#define flush_cache_kmaps() \
-	do { \
-		if (cache_is_vivt()) \
-			flush_cache_all(); \
-	} while (0)
+#define flush_cache_kmaps() do { } while (0)
 
 extern pte_t *pkmap_page_table;
 
-/*
- * The reason for kmap_high_get() is to ensure that the currently kmap'd
- * page usage count does not decrease to zero while we're using its
- * existing virtual mapping in an atomic context.  With a VIVT cache this
- * is essential to do, but with a VIPT cache this is only an optimization
- * so not to pay the price of establishing a second mapping if an existing
- * one can be used.  However, on platforms without hardware TLB maintenance
- * broadcast, we simply cannot use ARCH_NEEDS_KMAP_HIGH_GET at all since
- * the locking involved must also disable IRQs which is incompatible with
- * the IPI mechanism used by global TLB operations.
- */
-#define ARCH_NEEDS_KMAP_HIGH_GET
-#if defined(CONFIG_SMP) && defined(CONFIG_CPU_TLB_V6)
-#undef ARCH_NEEDS_KMAP_HIGH_GET
-#if defined(CONFIG_HIGHMEM) && defined(CONFIG_CPU_CACHE_VIVT)
-#error "The sum of features in your kernel config cannot be supported together"
-#endif
-#endif
-
-/*
- * Needed to be able to broadcast the TLB invalidation for kmap.
- */
-#ifdef CONFIG_ARM_ERRATA_798181
-#undef ARCH_NEEDS_KMAP_HIGH_GET
-#endif
-
-#ifdef ARCH_NEEDS_KMAP_HIGH_GET
-extern void *kmap_high_get(const struct page *page);
-
-static inline void *arch_kmap_local_high_get(const struct page *page)
-{
-	if (IS_ENABLED(CONFIG_DEBUG_HIGHMEM) && !cache_is_vivt())
-		return NULL;
-	return kmap_high_get(page);
-}
-#define arch_kmap_local_high_get arch_kmap_local_high_get
-
-#else /* ARCH_NEEDS_KMAP_HIGH_GET */
-static inline void *kmap_high_get(const struct page *page)
-{
-	return NULL;
-}
-#endif /* !ARCH_NEEDS_KMAP_HIGH_GET */
-
 #define arch_kmap_local_post_map(vaddr, pteval)				\
 	local_flush_tlb_kernel_page(vaddr)
 
-#define arch_kmap_local_pre_unmap(vaddr)				\
-do {									\
-	if (cache_is_vivt())						\
-		__cpuc_flush_dcache_area((void *)vaddr, PAGE_SIZE);	\
-} while (0)
+#define arch_kmap_local_pre_unmap(vaddr) do { } while (0)
 
 #define arch_kmap_local_post_unmap(vaddr)				\
 	local_flush_tlb_kernel_page(vaddr)
diff --git a/arch/arm/mm/cache-feroceon-l2.c b/arch/arm/mm/cache-feroceon-l2.c
index 2bfefb252ffd..1316b6ab295a 100644
--- a/arch/arm/mm/cache-feroceon-l2.c
+++ b/arch/arm/mm/cache-feroceon-l2.c
@@ -12,7 +12,6 @@
 #include <linux/init.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/highmem.h>
 #include <linux/io.h>
 #include <asm/cacheflush.h>
 #include <asm/cp15.h>
@@ -38,30 +37,6 @@
  * between which we don't want to be preempted.
  */
 
-static inline unsigned long l2_get_va(unsigned long paddr)
-{
-#ifdef CONFIG_HIGHMEM
-	/*
-	 * Because range ops can't be done on physical addresses,
-	 * we simply install a virtual mapping for it only for the
-	 * TLB lookup to occur, hence no need to flush the untouched
-	 * memory mapping afterwards (note: a cache flush may happen
-	 * in some circumstances depending on the path taken in kunmap_atomic).
-	 */
-	void *vaddr = kmap_atomic_pfn(paddr >> PAGE_SHIFT);
-	return (unsigned long)vaddr + (paddr & ~PAGE_MASK);
-#else
-	return __phys_to_virt(paddr);
-#endif
-}
-
-static inline void l2_put_va(unsigned long vaddr)
-{
-#ifdef CONFIG_HIGHMEM
-	kunmap_atomic((void *)vaddr);
-#endif
-}
-
 static inline void l2_clean_pa(unsigned long addr)
 {
 	__asm__("mcr p15, 1, %0, c15, c9, 3" : : "r" (addr));
@@ -78,14 +53,13 @@ static inline void l2_clean_pa_range(unsigned long start, unsigned long end)
 	 */
 	BUG_ON((start ^ end) >> PAGE_SHIFT);
 
-	va_start = l2_get_va(start);
+	va_start = __phys_to_virt(start);
 	va_end = va_start + (end - start);
 	raw_local_irq_save(flags);
 	__asm__("mcr p15, 1, %0, c15, c9, 4\n\t"
 		"mcr p15, 1, %1, c15, c9, 5"
 		: : "r" (va_start), "r" (va_end));
 	raw_local_irq_restore(flags);
-	l2_put_va(va_start);
 }
 
 static inline void l2_clean_inv_pa(unsigned long addr)
@@ -109,14 +83,13 @@ static inline void l2_inv_pa_range(unsigned long start, unsigned long end)
 	 */
 	BUG_ON((start ^ end) >> PAGE_SHIFT);
 
-	va_start = l2_get_va(start);
+	va_start = __phys_to_virt(start);
 	va_end = va_start + (end - start);
 	raw_local_irq_save(flags);
 	__asm__("mcr p15, 1, %0, c15, c11, 4\n\t"
 		"mcr p15, 1, %1, c15, c11, 5"
 		: : "r" (va_start), "r" (va_end));
 	raw_local_irq_restore(flags);
-	l2_put_va(va_start);
 }
 
 static inline void l2_inv_all(void)
diff --git a/arch/arm/mm/cache-xsc3l2.c b/arch/arm/mm/cache-xsc3l2.c
index d20d7af02d10..477077387039 100644
--- a/arch/arm/mm/cache-xsc3l2.c
+++ b/arch/arm/mm/cache-xsc3l2.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2007 ARM Limited
  */
 #include <linux/init.h>
-#include <linux/highmem.h>
 #include <asm/cp15.h>
 #include <asm/cputype.h>
 #include <asm/cacheflush.h>
@@ -55,34 +54,6 @@ static inline void xsc3_l2_inv_all(void)
 	dsb();
 }
 
-static inline void l2_unmap_va(unsigned long va)
-{
-#ifdef CONFIG_HIGHMEM
-	if (va != -1)
-		kunmap_atomic((void *)va);
-#endif
-}
-
-static inline unsigned long l2_map_va(unsigned long pa, unsigned long prev_va)
-{
-#ifdef CONFIG_HIGHMEM
-	unsigned long va = prev_va & PAGE_MASK;
-	unsigned long pa_offset = pa << (32 - PAGE_SHIFT);
-	if (unlikely(pa_offset < (prev_va << (32 - PAGE_SHIFT)))) {
-		/*
-		 * Switching to a new page.  Because cache ops are
-		 * using virtual addresses only, we must put a mapping
-		 * in place for it.
-		 */
-		l2_unmap_va(prev_va);
-		va = (unsigned long)kmap_atomic_pfn(pa >> PAGE_SHIFT);
-	}
-	return va + (pa_offset >> (32 - PAGE_SHIFT));
-#else
-	return __phys_to_virt(pa);
-#endif
-}
-
 static void xsc3_l2_inv_range(unsigned long start, unsigned long end)
 {
 	unsigned long vaddr;
@@ -92,13 +63,11 @@ static void xsc3_l2_inv_range(unsigned long start, unsigned long end)
 		return;
 	}
 
-	vaddr = -1;  /* to force the first mapping */
-
 	/*
 	 * Clean and invalidate partial first cache line.
 	 */
 	if (start & (CACHE_LINE_SIZE - 1)) {
-		vaddr = l2_map_va(start & ~(CACHE_LINE_SIZE - 1), vaddr);
+		vaddr = __phys_to_virt(start & ~(CACHE_LINE_SIZE - 1));
 		xsc3_l2_clean_mva(vaddr);
 		xsc3_l2_inv_mva(vaddr);
 		start = (start | (CACHE_LINE_SIZE - 1)) + 1;
@@ -108,7 +77,7 @@ static void xsc3_l2_inv_range(unsigned long start, unsigned long end)
 	 * Invalidate all full cache lines between 'start' and 'end'.
 	 */
 	while (start < (end & ~(CACHE_LINE_SIZE - 1))) {
-		vaddr = l2_map_va(start, vaddr);
+		vaddr = __phys_to_virt(start);
 		xsc3_l2_inv_mva(vaddr);
 		start += CACHE_LINE_SIZE;
 	}
@@ -117,13 +86,11 @@ static void xsc3_l2_inv_range(unsigned long start, unsigned long end)
 	 * Clean and invalidate partial last cache line.
 	 */
 	if (start < end) {
-		vaddr = l2_map_va(start, vaddr);
+		vaddr = __phys_to_virt(start);
 		xsc3_l2_clean_mva(vaddr);
 		xsc3_l2_inv_mva(vaddr);
 	}
 
-	l2_unmap_va(vaddr);
-
 	dsb();
 }
 
@@ -135,13 +102,11 @@ static void xsc3_l2_clean_range(unsigned long start, unsigned long end)
 
 	start &= ~(CACHE_LINE_SIZE - 1);
 	while (start < end) {
-		vaddr = l2_map_va(start, vaddr);
+		vaddr = __phys_to_virt(start);
 		xsc3_l2_clean_mva(vaddr);
 		start += CACHE_LINE_SIZE;
 	}
 
-	l2_unmap_va(vaddr);
-
 	dsb();
 }
 
@@ -178,14 +143,12 @@ static void xsc3_l2_flush_range(unsigned long start, unsigned long end)
 
 	start &= ~(CACHE_LINE_SIZE - 1);
 	while (start < end) {
-		vaddr = l2_map_va(start, vaddr);
+		vaddr = __phys_to_virt(start);
 		xsc3_l2_clean_mva(vaddr);
 		xsc3_l2_inv_mva(vaddr);
 		start += CACHE_LINE_SIZE;
 	}
 
-	l2_unmap_va(vaddr);
-
 	dsb();
 }
 
diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index a4c765d24692..696f6f1f259e 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -647,18 +647,10 @@ static void dma_cache_maint_page(phys_addr_t phys, size_t size,
 			if (len + offset > PAGE_SIZE)
 				len = PAGE_SIZE - offset;
 
-			if (cache_is_vipt_nonaliasing()) {
-				vaddr = kmap_atomic_pfn(pfn);
+			vaddr = kmap_atomic(phys_to_page(phys));
+			if (vaddr) {
 				op(vaddr + offset, len, dir);
 				kunmap_atomic(vaddr);
-			} else {
-				struct page *page = phys_to_page(phys);
-
-				vaddr = kmap_high_get(page);
-				if (vaddr) {
-					op(vaddr + offset, len, dir);
-					kunmap_high(page);
-				}
 			}
 		} else {
 			phys += offset;
diff --git a/arch/arm/mm/flush.c b/arch/arm/mm/flush.c
index 19470d938b23..998b75f77364 100644
--- a/arch/arm/mm/flush.c
+++ b/arch/arm/mm/flush.c
@@ -208,21 +208,10 @@ void __flush_dcache_folio(struct address_space *mapping, struct folio *folio)
 					folio_size(folio));
 	} else {
 		unsigned long i;
-		if (cache_is_vipt_nonaliasing()) {
-			for (i = 0; i < folio_nr_pages(folio); i++) {
-				void *addr = kmap_local_folio(folio,
-								i * PAGE_SIZE);
-				__cpuc_flush_dcache_area(addr, PAGE_SIZE);
-				kunmap_local(addr);
-			}
-		} else {
-			for (i = 0; i < folio_nr_pages(folio); i++) {
-				void *addr = kmap_high_get(folio_page(folio, i));
-				if (addr) {
-					__cpuc_flush_dcache_area(addr, PAGE_SIZE);
-					kunmap_high(folio_page(folio, i));
-				}
-			}
+		for (i = 0; i < folio_nr_pages(folio); i++) {
+			void *addr = kmap_local_folio(folio, i * PAGE_SIZE);
+			__cpuc_flush_dcache_area(addr, PAGE_SIZE);
+			kunmap_local(addr);
 		}
 	}
 
-- 
2.39.5


