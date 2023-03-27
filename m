Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6C56CA42C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:33:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlXKm0XT0z3gFJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:33:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=syMJ7nxN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=syMJ7nxN;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlWym0Vq6z3fYJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:17:04 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 78483B81183;
	Mon, 27 Mar 2023 12:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100F9C433D2;
	Mon, 27 Mar 2023 12:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679919420;
	bh=Ml5ZUxLRBcXZxDX8ISyxdZtftACTwtt/RJRGQgyDcA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=syMJ7nxN1404wL8MSmBDBzMbmZHCdTm1Ngp/hp0OZKrTQv6VukcslNqnocgIYm0Pg
	 z2nDiDT5g3WGM7PQyOsYmBSR9OWBLcuCQsrbgKlcQhgarGx+B1WnHMbIAicdtUX90I
	 rv7MkL1vIAzNzi9mV+9HYRQdyax0NNIb8SsxYgbEwbxZ3T+9s7FySsaLMrv38UOthy
	 rsnkD0oaYSIFFeNAIxmAdoDDC6b+8rN89kcPfR/lqO8SVhG1dbQNBMihp0dKI9sDYi
	 S4OY7F19HPM4r+W9fx9IRFRNFVh1DnIy9BLSjbmduw1o6ookXnZJF7dHfVeo3epEYb
	 LMkF5xk0Gxohg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 21/21] dma-mapping: replace custom code with generic implementation
Date: Mon, 27 Mar 2023 14:13:17 +0200
Message-Id: <20230327121317.4081816-22-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327121317.4081816-1-arnd@kernel.org>
References: <20230327121317.4081816-1-arnd@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Michal Sime
 k <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, linux-oxnas@groups.io, Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

Now that all of these have consistent behavior, replace them with
a single shared implementation of arch_sync_dma_for_device() and
arch_sync_dma_for_cpu() and three parameters to pick how they should
operate:

 - If the CPU has speculative prefetching, then the cache
   has to be invalidated after a transfer from the device.
   On the rarer CPUs without prefetching, this can be skipped,
   with all cache management happening before the transfer.
   This flag can be runtime detected, but is usually fixed
   per architecture.

 - Some architectures currently clean the caches before DMA
   from a device, while others invalidate it. There has not
   been a conclusion regarding whether we should change all
   architectures to use clean instead, so this adds an
   architecture specific flag that we can change later on.

 - On 32-bit Arm, the arch_sync_dma_for_cpu() function keeps
   track pages that are marked clean in the page cache, to
   avoid flushing them again. The implementation for this is
   generic enough to work on all architectures that use the
   PG_dcache_clean page flag, but a Kconfig symbol is used
   to only enable it on Arm to preserve the existing behavior.

For the function naming, I picked 'wback' over 'clean', and 'wback_inv'
over 'flush', to avoid any ambiguity of what the helper functions are
supposed to do.

Moving the global functions into a header file is usually a bad idea
as it prevents the header from being included more than once, but it
helps keep the behavior as close as possible to the previous state,
including the possibility of inlining most of it into these functions
where that was done before. This also helps keep the global namespace
clean, by hiding the new arch_dma_cache{_wback,_inv,_wback_inv} from
device drivers that might use them incorrectly.

It would be possible to do this one architecture at a time, but
as the change is the same everywhere, the combined patch helps
explain it better once.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arc/mm/dma.c                 |  66 +++++-------------
 arch/arm/Kconfig                  |   3 +
 arch/arm/mm/dma-mapping-nommu.c   |  39 ++++++-----
 arch/arm/mm/dma-mapping.c         |  64 +++++++-----------
 arch/arm64/mm/dma-mapping.c       |  28 +++++---
 arch/csky/mm/dma-mapping.c        |  44 ++++++------
 arch/hexagon/kernel/dma.c         |  44 ++++++------
 arch/m68k/kernel/dma.c            |  43 +++++++-----
 arch/microblaze/kernel/dma.c      |  48 +++++++-------
 arch/mips/mm/dma-noncoherent.c    |  60 +++++++----------
 arch/nios2/mm/dma-mapping.c       |  57 +++++++---------
 arch/openrisc/kernel/dma.c        |  63 +++++++++++-------
 arch/parisc/kernel/pci-dma.c      |  46 ++++++-------
 arch/powerpc/mm/dma-noncoherent.c |  34 ++++++----
 arch/riscv/mm/dma-noncoherent.c   |  51 +++++++-------
 arch/sh/kernel/dma-coherent.c     |  43 +++++++-----
 arch/sparc/kernel/ioport.c        |  38 ++++++++---
 arch/xtensa/kernel/pci-dma.c      |  40 ++++++-----
 include/linux/dma-sync.h          | 107 ++++++++++++++++++++++++++++++
 19 files changed, 527 insertions(+), 391 deletions(-)
 create mode 100644 include/linux/dma-sync.h

diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
index ddb96786f765..61cd01646222 100644
--- a/arch/arc/mm/dma.c
+++ b/arch/arc/mm/dma.c
@@ -30,63 +30,33 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
 	dma_cache_wback_inv(page_to_phys(page), size);
 }
 
-/*
- * Cache operations depending on function and direction argument, inspired by
- * https://lore.kernel.org/lkml/20180518175004.GF17671@n2100.armlinux.org.uk
- * "dma_sync_*_for_cpu and direction=TO_DEVICE (was Re: [PATCH 02/20]
- * dma-mapping: provide a generic dma-noncoherent implementation)"
- *
- *          |   map          ==  for_device     |   unmap     ==  for_cpu
- *          |----------------------------------------------------------------
- * TO_DEV   |   writeback        writeback      |   none          none
- * FROM_DEV |   invalidate       invalidate     |   invalidate*   invalidate*
- * BIDIR    |   writeback        writeback      |   invalidate    invalidate
- *
- *     [*] needed for CPU speculative prefetches
- *
- * NOTE: we don't check the validity of direction argument as it is done in
- * upper layer functions (in include/linux/dma-mapping.h)
- */
-
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
-	switch (dir) {
-	case DMA_TO_DEVICE:
-		dma_cache_wback(paddr, size);
-		break;
-
-	case DMA_FROM_DEVICE:
-		dma_cache_inv(paddr, size);
-		break;
-
-	case DMA_BIDIRECTIONAL:
-		dma_cache_wback(paddr, size);
-		break;
+	dma_cache_wback(paddr, size);
+}
 
-	default:
-		break;
-	}
+static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
+{
+	dma_cache_inv(paddr, size);
 }
 
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
 {
-	switch (dir) {
-	case DMA_TO_DEVICE:
-		break;
+	dma_cache_wback_inv(paddr, size);
+}
 
-	/* FROM_DEVICE invalidate needed if speculative CPU prefetch only */
-	case DMA_FROM_DEVICE:
-	case DMA_BIDIRECTIONAL:
-		dma_cache_inv(paddr, size);
-		break;
+static inline bool arch_sync_dma_clean_before_fromdevice(void)
+{
+	return false;
+}
 
-	default:
-		break;
-	}
+static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
+{
+	return true;
 }
 
+#include <linux/dma-sync.h>
+
 /*
  * Plug in direct dma map ops.
  */
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 125d58c54ab1..0de84e861027 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -212,6 +212,9 @@ config LOCKDEP_SUPPORT
 	bool
 	default y
 
+config ARCH_DMA_MARK_DCACHE_CLEAN
+	def_bool y
+
 config ARCH_HAS_ILOG2_U32
 	bool
 
diff --git a/arch/arm/mm/dma-mapping-nommu.c b/arch/arm/mm/dma-mapping-nommu.c
index 12b5c6ae93fc..0817274aed15 100644
--- a/arch/arm/mm/dma-mapping-nommu.c
+++ b/arch/arm/mm/dma-mapping-nommu.c
@@ -13,27 +13,36 @@
 
 #include "dma.h"
 
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
-	if (dir == DMA_FROM_DEVICE) {
-		dmac_inv_range(__va(paddr), __va(paddr + size));
-		outer_inv_range(paddr, paddr + size);
-	} else {
-		dmac_clean_range(__va(paddr), __va(paddr + size));
-		outer_clean_range(paddr, paddr + size);
-	}
+	dmac_clean_range(__va(paddr), __va(paddr + size));
+	outer_clean_range(paddr, paddr + size);
 }
 
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
 {
-	if (dir != DMA_TO_DEVICE) {
-		outer_inv_range(paddr, paddr + size);
-		dmac_inv_range(__va(paddr), __va(paddr));
-	}
+	dmac_inv_range(__va(paddr), __va(paddr + size));
+	outer_inv_range(paddr, paddr + size);
 }
 
+static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
+{
+	dmac_flush_range(__va(paddr), __va(paddr + size));
+	outer_flush_range(paddr, paddr + size);
+}
+
+static inline bool arch_sync_dma_clean_before_fromdevice(void)
+{
+	return false;
+}
+
+static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
+{
+	return true;
+}
+
+#include <linux/dma-sync.h>
+
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 			const struct iommu_ops *iommu, bool coherent)
 {
diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index b703cb83d27e..aa6ee820a0ab 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -687,6 +687,30 @@ void arch_dma_mark_clean(phys_addr_t paddr, size_t size)
 	}
 }
 
+static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
+{
+	dma_cache_maint(paddr, size, dmac_clean_range);
+	outer_clean_range(paddr, paddr + size);
+}
+
+
+static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
+{
+	dma_cache_maint(paddr, size, dmac_inv_range);
+	outer_inv_range(paddr, paddr + size);
+}
+
+static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
+{
+	dma_cache_maint(paddr, size, dmac_flush_range);
+	outer_flush_range(paddr, paddr + size);
+}
+
+static inline bool arch_sync_dma_clean_before_fromdevice(void)
+{
+	return false;
+}
+
 static bool arch_sync_dma_cpu_needs_post_dma_flush(void)
 {
 	if (IS_ENABLED(CONFIG_CPU_V6) ||
@@ -699,45 +723,7 @@ static bool arch_sync_dma_cpu_needs_post_dma_flush(void)
 	return false;
 }
 
-/*
- * Make an area consistent for devices.
- * Note: Drivers should NOT use this function directly.
- * Use the driver DMA support - see dma-mapping.h (dma_sync_*)
- */
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
-{
-	switch (dir) {
-	case DMA_TO_DEVICE:
-		dma_cache_maint(paddr, size, dmac_clean_range);
-		outer_clean_range(paddr, paddr + size);
-		break;
-	case DMA_FROM_DEVICE:
-		dma_cache_maint(paddr, size, dmac_inv_range);
-		outer_inv_range(paddr, paddr + size);
-		break;
-	case DMA_BIDIRECTIONAL:
-		if (arch_sync_dma_cpu_needs_post_dma_flush()) {
-			dma_cache_maint(paddr, size, dmac_clean_range);
-			outer_clean_range(paddr, paddr + size);
-		} else {
-			dma_cache_maint(paddr, size, dmac_flush_range);
-			outer_flush_range(paddr, paddr + size);
-		}
-		break;
-	default:
-		break;
-	}
-}
-
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
-{
-	if (dir != DMA_TO_DEVICE && arch_sync_dma_cpu_needs_post_dma_flush()) {
-		outer_inv_range(paddr, paddr + size);
-		dma_cache_maint(paddr, size, dmac_inv_range);
-	}
-}
+#include <linux/dma-sync.h>
 
 #ifdef CONFIG_ARM_DMA_USE_IOMMU
 
diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 5240f6acad64..bae741aa65e9 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -13,25 +13,33 @@
 #include <asm/cacheflush.h>
 #include <asm/xen/xen-ops.h>
 
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-			      enum dma_data_direction dir)
+static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
-	unsigned long start = (unsigned long)phys_to_virt(paddr);
+	dcache_clean_poc(paddr, paddr + size);
+}
 
-	dcache_clean_poc(start, start + size);
+static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
+{
+	dcache_inval_poc(paddr, paddr + size);
 }
 
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
-			   enum dma_data_direction dir)
+static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
 {
-	unsigned long start = (unsigned long)phys_to_virt(paddr);
+	dcache_clean_inval_poc(paddr, paddr + size);
+}
 
-	if (dir == DMA_TO_DEVICE)
-		return;
+static inline bool arch_sync_dma_clean_before_fromdevice(void)
+{
+	return true;
+}
 
-	dcache_inval_poc(start, start + size);
+static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
+{
+	return true;
 }
 
+#include <linux/dma-sync.h>
+
 void arch_dma_prep_coherent(struct page *page, size_t size)
 {
 	unsigned long start = (unsigned long)page_address(page);
diff --git a/arch/csky/mm/dma-mapping.c b/arch/csky/mm/dma-mapping.c
index c90f912e2822..9402e101b363 100644
--- a/arch/csky/mm/dma-mapping.c
+++ b/arch/csky/mm/dma-mapping.c
@@ -55,31 +55,29 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
 	cache_op(page_to_phys(page), size, dma_wbinv_set_zero_range);
 }
 
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
-	switch (dir) {
-	case DMA_TO_DEVICE:
-	case DMA_FROM_DEVICE:
-	case DMA_BIDIRECTIONAL:
-		cache_op(paddr, size, dma_wb_range);
-		break;
-	default:
-		BUG();
-	}
+	cache_op(paddr, size, dma_wb_range);
 }
 
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
 {
-	switch (dir) {
-	case DMA_TO_DEVICE:
-		return;
-	case DMA_FROM_DEVICE:
-	case DMA_BIDIRECTIONAL:
-		cache_op(paddr, size, dma_inv_range);
-		break;
-	default:
-		BUG();
-	}
+	cache_op(paddr, size, dma_inv_range);
 }
+
+static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
+{
+	cache_op(paddr, size, dma_wbinv_range);
+}
+
+static inline bool arch_sync_dma_clean_before_fromdevice(void)
+{
+	return true;
+}
+
+static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
+{
+	return true;
+}
+
+#include <linux/dma-sync.h>
diff --git a/arch/hexagon/kernel/dma.c b/arch/hexagon/kernel/dma.c
index 882680e81a30..e6538128a75b 100644
--- a/arch/hexagon/kernel/dma.c
+++ b/arch/hexagon/kernel/dma.c
@@ -9,29 +9,33 @@
 #include <linux/memblock.h>
 #include <asm/page.h>
 
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
-	void *addr = phys_to_virt(paddr);
-
-	switch (dir) {
-	case DMA_TO_DEVICE:
-		hexagon_clean_dcache_range((unsigned long) addr,
-		(unsigned long) addr + size);
-		break;
-	case DMA_FROM_DEVICE:
-		hexagon_inv_dcache_range((unsigned long) addr,
-		(unsigned long) addr + size);
-		break;
-	case DMA_BIDIRECTIONAL:
-		flush_dcache_range((unsigned long) addr,
-		(unsigned long) addr + size);
-		break;
-	default:
-		BUG();
-	}
+	hexagon_clean_dcache_range(paddr, paddr + size);
 }
 
+static inline void arch_dma_cache_inv(phys_addr_t start, size_t size)
+{
+	hexagon_inv_dcache_range(paddr, paddr + size);
+}
+
+static inline void arch_dma_cache_wback_inv(phys_addr_t start, size_t size)
+{
+	hexagon_flush_dcache_range(paddr, paddr + size);
+}
+
+static inline bool arch_sync_dma_clean_before_fromdevice(void)
+{
+	return false;
+}
+
+static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
+{
+	return false;
+}
+
+#include <linux/dma-sync.h>
+
 /*
  * Our max_low_pfn should have been backed off by 16MB in mm/init.c to create
  * DMA coherent space.  Use that for the pool.
diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
index 2e192a5df949..aa9b434e6df8 100644
--- a/arch/m68k/kernel/dma.c
+++ b/arch/m68k/kernel/dma.c
@@ -58,20 +58,33 @@ void arch_dma_free(struct device *dev, size_t size, void *vaddr,
 
 #endif /* CONFIG_MMU && !CONFIG_COLDFIRE */
 
-void arch_sync_dma_for_device(phys_addr_t handle, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
-	switch (dir) {
-	case DMA_BIDIRECTIONAL:
-	case DMA_TO_DEVICE:
-		cache_push(handle, size);
-		break;
-	case DMA_FROM_DEVICE:
-		cache_clear(handle, size);
-		break;
-	default:
-		pr_err_ratelimited("dma_sync_single_for_device: unsupported dir %u\n",
-				   dir);
-		break;
-	}
+	/*
+	 * cache_push() always invalidates in addition to cleaning
+	 * write-back caches.
+	 */
+	cache_push(paddr, size);
+}
+
+static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
+{
+	cache_clear(paddr, size);
+}
+
+static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
+{
+	cache_push(paddr, size);
 }
+
+static inline bool arch_sync_dma_clean_before_fromdevice(void)
+{
+	return false;
+}
+
+static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
+{
+	return false;
+}
+
+#include <linux/dma-sync.h>
diff --git a/arch/microblaze/kernel/dma.c b/arch/microblaze/kernel/dma.c
index b4c4e45fd45e..01110d4aa5b0 100644
--- a/arch/microblaze/kernel/dma.c
+++ b/arch/microblaze/kernel/dma.c
@@ -14,32 +14,30 @@
 #include <linux/bug.h>
 #include <asm/cacheflush.h>
 
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
-	switch (direction) {
-	case DMA_TO_DEVICE:
-	case DMA_BIDIRECTIONAL:
-		flush_dcache_range(paddr, paddr + size);
-		break;
-	case DMA_FROM_DEVICE:
-		invalidate_dcache_range(paddr, paddr + size);
-		break;
-	default:
-		BUG();
-	}
+	/* writeback plus invalidate, could be a nop on WT caches */
+	flush_dcache_range(paddr, paddr + size);
 }
 
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
 {
-	switch (direction) {
-	case DMA_TO_DEVICE:
-		break;
-	case DMA_BIDIRECTIONAL:
-	case DMA_FROM_DEVICE:
-		invalidate_dcache_range(paddr, paddr + size);
-		break;
-	default:
-		BUG();
-	}}
+	invalidate_dcache_range(paddr, paddr + size);
+}
+
+static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
+{
+	flush_dcache_range(paddr, paddr + size);
+}
+
+static inline bool arch_sync_dma_clean_before_fromdevice(void)
+{
+	return false;
+}
+
+static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
+{
+	return true;
+}
+
+#include <linux/dma-sync.h>
diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index b9d68bcc5d53..902d4b7c1f85 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -85,50 +85,38 @@ static inline void dma_sync_phys(phys_addr_t paddr, size_t size,
 	} while (left);
 }
 
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
-	switch (dir) {
-	case DMA_TO_DEVICE:
-		dma_sync_phys(paddr, size, _dma_cache_wback);
-		break;
-	case DMA_FROM_DEVICE:
-		dma_sync_phys(paddr, size, _dma_cache_inv);
-		break;
-	case DMA_BIDIRECTIONAL:
-		if (IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) &&
-		    cpu_needs_post_dma_flush())
-			dma_sync_phys(paddr, size, _dma_cache_wback);
-		else
-			dma_sync_phys(paddr, size, _dma_cache_wback_inv);
-		break;
-	default:
-		break;
-	}
+	dma_sync_phys(paddr, size, _dma_cache_wback);
 }
 
-#ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
 {
-	switch (dir) {
-	case DMA_TO_DEVICE:
-		break;
-	case DMA_FROM_DEVICE:
-	case DMA_BIDIRECTIONAL:
-		if (cpu_needs_post_dma_flush())
-			dma_sync_phys(paddr, size, _dma_cache_inv);
-		break;
-	default:
-		break;
-	}
+	dma_sync_phys(paddr, size, _dma_cache_inv);
 }
-#endif
+
+static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
+{
+	dma_sync_phys(paddr, size, _dma_cache_wback_inv);
+}
+
+static inline bool arch_sync_dma_clean_before_fromdevice(void)
+{
+	return false;
+}
+
+static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
+{
+	return IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) &&
+                    cpu_needs_post_dma_flush();
+}
+
+#include <linux/dma-sync.h>
 
 #ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
-		const struct iommu_ops *iommu, bool coherent)
+               const struct iommu_ops *iommu, bool coherent)
 {
-	dev->dma_coherent = coherent;
+       dev->dma_coherent = coherent;
 }
 #endif
diff --git a/arch/nios2/mm/dma-mapping.c b/arch/nios2/mm/dma-mapping.c
index fd887d5f3f9a..29978970955e 100644
--- a/arch/nios2/mm/dma-mapping.c
+++ b/arch/nios2/mm/dma-mapping.c
@@ -13,53 +13,46 @@
 #include <linux/types.h>
 #include <linux/mm.h>
 #include <linux/string.h>
+#include <linux/dma-map-ops.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/cache.h>
 #include <asm/cacheflush.h>
 
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
+	/*
+	 * We just need to write back the caches here, but Nios2 flush
+	 * instruction will do both writeback and invalidate.
+	 */
 	void *vaddr = phys_to_virt(paddr);
+	flush_dcache_range((unsigned long)vaddr, (unsigned long)(vaddr + size));
+}
 
-	switch (dir) {
-	case DMA_FROM_DEVICE:
-		invalidate_dcache_range((unsigned long)vaddr,
-			(unsigned long)(vaddr + size));
-		break;
-	case DMA_TO_DEVICE:
-		/*
-		 * We just need to flush the caches here , but Nios2 flush
-		 * instruction will do both writeback and invalidate.
-		 */
-	case DMA_BIDIRECTIONAL: /* flush and invalidate */
-		flush_dcache_range((unsigned long)vaddr,
-			(unsigned long)(vaddr + size));
-		break;
-	default:
-		BUG();
-	}
+static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
+{
+	unsigned long vaddr = (unsigned long)phys_to_virt(paddr);
+	invalidate_dcache_range(vaddr, (unsigned long)(vaddr + size));
 }
 
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
 {
 	void *vaddr = phys_to_virt(paddr);
+	flush_dcache_range((unsigned long)vaddr, (unsigned long)(vaddr + size));
+}
+
+static inline bool arch_sync_dma_clean_before_fromdevice(void)
+{
+	return false;
+}
 
-	switch (dir) {
-	case DMA_BIDIRECTIONAL:
-	case DMA_FROM_DEVICE:
-		invalidate_dcache_range((unsigned long)vaddr,
-			(unsigned long)(vaddr + size));
-		break;
-	case DMA_TO_DEVICE:
-		break;
-	default:
-		BUG();
-	}
+static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
+{
+	return true;
 }
 
+#include <linux/dma-sync.h>
+
 void arch_dma_prep_coherent(struct page *page, size_t size)
 {
 	unsigned long start = (unsigned long)page_address(page);
diff --git a/arch/openrisc/kernel/dma.c b/arch/openrisc/kernel/dma.c
index 91a00d09ffad..aba2258e62eb 100644
--- a/arch/openrisc/kernel/dma.c
+++ b/arch/openrisc/kernel/dma.c
@@ -95,32 +95,47 @@ void arch_dma_clear_uncached(void *cpu_addr, size_t size)
 	mmap_write_unlock(&init_mm);
 }
 
-void arch_sync_dma_for_device(phys_addr_t addr, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
 	unsigned long cl;
 	struct cpuinfo_or1k *cpuinfo = &cpuinfo_or1k[smp_processor_id()];
 
-	switch (dir) {
-	case DMA_TO_DEVICE:
-		/* Write back the dcache for the requested range */
-		for (cl = addr; cl < addr + size;
-		     cl += cpuinfo->dcache_block_size)
-			mtspr(SPR_DCBWR, cl);
-		break;
-	case DMA_FROM_DEVICE:
-		/* Invalidate the dcache for the requested range */
-		for (cl = addr; cl < addr + size;
-		     cl += cpuinfo->dcache_block_size)
-			mtspr(SPR_DCBIR, cl);
-		break;
-	case DMA_BIDIRECTIONAL:
-		/* Flush the dcache for the requested range */
-		for (cl = addr; cl < addr + size;
-		     cl += cpuinfo->dcache_block_size)
-			mtspr(SPR_DCBFR, cl);
-		break;
-	default:
-		break;
-	}
+	/* Write back the dcache for the requested range */
+	for (cl = paddr; cl < paddr + size;
+	     cl += cpuinfo->dcache_block_size)
+		mtspr(SPR_DCBWR, cl);
 }
+
+static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
+{
+	unsigned long cl;
+	struct cpuinfo_or1k *cpuinfo = &cpuinfo_or1k[smp_processor_id()];
+
+	/* Invalidate the dcache for the requested range */
+	for (cl = paddr; cl < paddr + size;
+	     cl += cpuinfo->dcache_block_size)
+		mtspr(SPR_DCBIR, cl);
+}
+
+static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
+{
+	unsigned long cl;
+	struct cpuinfo_or1k *cpuinfo = &cpuinfo_or1k[smp_processor_id()];
+
+	/* Flush the dcache for the requested range */
+	for (cl = paddr; cl < paddr + size;
+	     cl += cpuinfo->dcache_block_size)
+		mtspr(SPR_DCBFR, cl);
+}
+
+static inline bool arch_sync_dma_clean_before_fromdevice(void)
+{
+	return false;
+}
+
+static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
+{
+	return false;
+}
+
+#include <linux/dma-sync.h>
diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index 6d3d3cffb316..a7955aab8ce2 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -443,35 +443,35 @@ void arch_dma_free(struct device *dev, size_t size, void *vaddr,
 	free_pages((unsigned long)__va(dma_handle), order);
 }
 
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
 	unsigned long virt = (unsigned long)phys_to_virt(paddr);
 
-	switch (dir) {
-	case DMA_TO_DEVICE:
-		clean_kernel_dcache_range(virt, size);
-		break;
-	case DMA_FROM_DEVICE:
-		clean_kernel_dcache_range(virt, size);
-		break;
-	case DMA_BIDIRECTIONAL:
-		flush_kernel_dcache_range(virt, size);
-		break;
-	}
+	clean_kernel_dcache_range(virt, size);
 }
 
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
 {
 	unsigned long virt = (unsigned long)phys_to_virt(paddr);
 
-	switch (dir) {
-	case DMA_TO_DEVICE:
-		break;
-	case DMA_FROM_DEVICE:
-	case DMA_BIDIRECTIONAL:
-		purge_kernel_dcache_range(virt, size);
-		break;
-	}
+	purge_kernel_dcache_range(virt, size);
+}
+
+static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
+{
+	unsigned long virt = (unsigned long)phys_to_virt(paddr);
+
+	flush_kernel_dcache_range(virt, size);
 }
+
+static inline bool arch_sync_dma_clean_before_fromdevice(void)
+{
+	return true;
+}
+
+static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
+{
+	return true;
+}
+
+#include <linux/dma-sync.h>
diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-noncoherent.c
index 00e59a4faa2b..268510c71156 100644
--- a/arch/powerpc/mm/dma-noncoherent.c
+++ b/arch/powerpc/mm/dma-noncoherent.c
@@ -101,27 +101,33 @@ static void __dma_phys_op(phys_addr_t paddr, size_t size, enum dma_cache_op op)
 #endif
 }
 
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
 	__dma_phys_op(start, end, DMA_CACHE_CLEAN);
 }
 
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
 {
-	switch (direction) {
-	case DMA_NONE:
-		BUG();
-	case DMA_TO_DEVICE:
-		break;
-	case DMA_FROM_DEVICE:
-	case DMA_BIDIRECTIONAL:
-		__dma_phys_op(start, end, DMA_CACHE_INVAL);
-		break;
-	}
+	__dma_phys_op(start, end, DMA_CACHE_INVAL);
 }
 
+static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
+{
+	__dma_phys_op(start, end, DMA_CACHE_FLUSH);
+}
+
+static inline bool arch_sync_dma_clean_before_fromdevice(void)
+{
+	return true;
+}
+
+static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
+{
+	return true;
+}
+
+#include <linux/dma-sync.h>
+
 void arch_dma_prep_coherent(struct page *page, size_t size)
 {
 	unsigned long kaddr = (unsigned long)page_address(page);
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index 69c80b2155a1..b9a9f57e02be 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -12,43 +12,40 @@
 
 static bool noncoherent_supported;
 
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-			      enum dma_data_direction dir)
+static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
 	void *vaddr = phys_to_virt(paddr);
 
-	switch (dir) {
-	case DMA_TO_DEVICE:
-		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
-		break;
-	case DMA_FROM_DEVICE:
-		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
-		break;
-	case DMA_BIDIRECTIONAL:
-		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
-		break;
-	default:
-		break;
-	}
+	ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
 }
 
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
-			   enum dma_data_direction dir)
+static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
 {
 	void *vaddr = phys_to_virt(paddr);
 
-	switch (dir) {
-	case DMA_TO_DEVICE:
-		break;
-	case DMA_FROM_DEVICE:
-	case DMA_BIDIRECTIONAL:
-		ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
-		break;
-	default:
-		break;
-	}
+	ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
 }
 
+static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
+{
+	void *vaddr = phys_to_virt(paddr);
+
+	ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
+}
+
+static inline bool arch_sync_dma_clean_before_fromdevice(void)
+{
+	return true;
+}
+
+static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
+{
+	return true;
+}
+
+#include <linux/dma-sync.h>
+
+
 void arch_dma_prep_coherent(struct page *page, size_t size)
 {
 	void *flush_addr = page_address(page);
diff --git a/arch/sh/kernel/dma-coherent.c b/arch/sh/kernel/dma-coherent.c
index 6a44c0e7ba40..41f031ae7609 100644
--- a/arch/sh/kernel/dma-coherent.c
+++ b/arch/sh/kernel/dma-coherent.c
@@ -12,22 +12,35 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
 	__flush_purge_region(page_address(page), size);
 }
 
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
 	void *addr = sh_cacheop_vaddr(phys_to_virt(paddr));
 
-	switch (dir) {
-	case DMA_FROM_DEVICE:		/* invalidate only */
-		__flush_invalidate_region(addr, size);
-		break;
-	case DMA_TO_DEVICE:		/* writeback only */
-		__flush_wback_region(addr, size);
-		break;
-	case DMA_BIDIRECTIONAL:		/* writeback and invalidate */
-		__flush_purge_region(addr, size);
-		break;
-	default:
-		BUG();
-	}
+	__flush_wback_region(addr, size);
 }
+
+static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
+{
+	void *addr = sh_cacheop_vaddr(phys_to_virt(paddr));
+
+	__flush_invalidate_region(addr, size);
+}
+
+static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
+{
+	void *addr = sh_cacheop_vaddr(phys_to_virt(paddr));
+
+	__flush_purge_region(addr, size);
+}
+
+static inline bool arch_sync_dma_clean_before_fromdevice(void)
+{
+	return false;
+}
+
+static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
+{
+	return false;
+}
+
+#include <linux/dma-sync.h>
diff --git a/arch/sparc/kernel/ioport.c b/arch/sparc/kernel/ioport.c
index 4f3d26066ec2..6926ead2f208 100644
--- a/arch/sparc/kernel/ioport.c
+++ b/arch/sparc/kernel/ioport.c
@@ -300,21 +300,39 @@ arch_initcall(sparc_register_ioport);
 
 #endif /* CONFIG_SBUS */
 
-/*
- * IIep is write-through, not flushing on cpu to device transfer.
- *
- * On LEON systems without cache snooping, the entire D-CACHE must be flushed to
- * make DMA to cacheable memory coherent.
- */
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
-	if (dir != DMA_TO_DEVICE &&
-	    sparc_cpu_model == sparc_leon &&
+	/* IIep is write-through, not flushing on cpu to device transfer. */
+}
+
+static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
+{
+	/*
+	 * On LEON systems without cache snooping, the entire D-CACHE must be
+	 * flushed to make DMA to cacheable memory coherent.
+	 */
+	if (sparc_cpu_model == sparc_leon &&
 	    !sparc_leon3_snooping_enabled())
 		leon_flush_dcache_all();
 }
 
+static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
+{
+	arch_dma_cache_inv(paddr, size);
+}
+
+static inline bool arch_sync_dma_clean_before_fromdevice(void)
+{
+	return true;
+}
+
+static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
+{
+	return false;
+}
+
+#include <linux/dma-sync.h>
+
 #ifdef CONFIG_PROC_FS
 
 static int sparc_io_proc_show(struct seq_file *m, void *v)
diff --git a/arch/xtensa/kernel/pci-dma.c b/arch/xtensa/kernel/pci-dma.c
index ff3bf015eca4..d4ff96585545 100644
--- a/arch/xtensa/kernel/pci-dma.c
+++ b/arch/xtensa/kernel/pci-dma.c
@@ -43,24 +43,34 @@ static void do_cache_op(phys_addr_t paddr, size_t size,
 		}
 }
 
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
-	switch (dir) {
-	case DMA_TO_DEVICE:
-		do_cache_op(paddr, size, __flush_dcache_range);
-		break;
-	case DMA_FROM_DEVICE:
-		do_cache_op(paddr, size, __invalidate_dcache_range);
-		break;
-	case DMA_BIDIRECTIONAL:
-		do_cache_op(paddr, size, __flush_invalidate_dcache_range);
-		break;
-	default:
-		break;
-	}
+	do_cache_op(paddr, size, __flush_dcache_range);
 }
 
+static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
+{
+	do_cache_op(paddr, size, __invalidate_dcache_range);
+}
+
+static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
+{
+	do_cache_op(paddr, size, __flush_invalidate_dcache_range);
+}
+
+static inline bool arch_sync_dma_clean_before_fromdevice(void)
+{
+	return false;
+}
+
+static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
+{
+	return false;
+}
+
+#include <linux/dma-sync.h>
+
+
 void arch_dma_prep_coherent(struct page *page, size_t size)
 {
 	__invalidate_dcache_range((unsigned long)page_address(page), size);
diff --git a/include/linux/dma-sync.h b/include/linux/dma-sync.h
new file mode 100644
index 000000000000..18e33d5e8eaf
--- /dev/null
+++ b/include/linux/dma-sync.h
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cache operations depending on function and direction argument, inspired by
+ * https://lore.kernel.org/lkml/20180518175004.GF17671@n2100.armlinux.org.uk
+ * "dma_sync_*_for_cpu and direction=TO_DEVICE (was Re: [PATCH 02/20]
+ * dma-mapping: provide a generic dma-noncoherent implementation)"
+ *
+ *          |   map          ==  for_device     |   unmap     ==  for_cpu
+ *          |----------------------------------------------------------------
+ * TO_DEV   |   writeback        writeback      |   none          none
+ * FROM_DEV |   invalidate       invalidate     |   invalidate*   invalidate*
+ * BIDIR    |   writeback        writeback      |   invalidate    invalidate
+ *
+ *     [*] needed for CPU speculative prefetches
+ *
+ * NOTE: we don't check the validity of direction argument as it is done in
+ * upper layer functions (in include/linux/dma-mapping.h)
+ *
+ * This file can be included by arch/.../kernel/dma-noncoherent.c to provide
+ * the respective high-level operations without having to expose the
+ * cache management ops to drivers.
+ */
+
+void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
+		enum dma_data_direction dir)
+{
+	switch (dir) {
+	case DMA_TO_DEVICE:
+		/*
+		 * This may be an empty function on write-through caches,
+		 * and it might invalidate the cache if an architecture has
+		 * a write-back cache but no way to write it back without
+		 * invalidating
+		 */
+		arch_dma_cache_wback(paddr, size);
+		break;
+
+	case DMA_FROM_DEVICE:
+		/*
+		 * FIXME: this should be handled the same across all
+		 * architectures, see
+		 * https://lore.kernel.org/all/20220606152150.GA31568@willie-the-truck/
+		 */
+		if (!arch_sync_dma_clean_before_fromdevice()) {
+			arch_dma_cache_inv(paddr, size);
+			break;
+		}
+		fallthrough;
+
+	case DMA_BIDIRECTIONAL:
+		/* Skip the invalidate here if it's done later */
+		if (IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) &&
+		    arch_sync_dma_cpu_needs_post_dma_flush())
+			arch_dma_cache_wback(paddr, size);
+		else
+			arch_dma_cache_wback_inv(paddr, size);
+		break;
+
+	default:
+		break;
+	}
+}
+
+#ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU
+/*
+ * Mark the D-cache clean for these pages to avoid extra flushing.
+ */
+static void arch_dma_mark_dcache_clean(phys_addr_t paddr, size_t size)
+{
+#ifdef CONFIG_ARCH_DMA_MARK_DCACHE_CLEAN
+	unsigned long pfn = PFN_UP(paddr);
+	unsigned long off = paddr & (PAGE_SIZE - 1);
+	size_t left = size;
+
+	if (off)
+		left -= PAGE_SIZE - off;
+
+	while (left >= PAGE_SIZE) {
+		struct page *page = pfn_to_page(pfn++);
+		set_bit(PG_dcache_clean, &page->flags);
+		left -= PAGE_SIZE;
+	}
+#endif
+}
+
+void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
+		enum dma_data_direction dir)
+{
+	switch (dir) {
+	case DMA_TO_DEVICE:
+		break;
+
+	case DMA_FROM_DEVICE:
+	case DMA_BIDIRECTIONAL:
+		/* FROM_DEVICE invalidate needed if speculative CPU prefetch only */
+		if (arch_sync_dma_cpu_needs_post_dma_flush())
+			arch_dma_cache_inv(paddr, size);
+
+		if (size > PAGE_SIZE)
+			arch_dma_mark_dcache_clean(paddr, size);
+		break;
+
+	default:
+		break;
+	}
+}
+#endif
-- 
2.39.2

