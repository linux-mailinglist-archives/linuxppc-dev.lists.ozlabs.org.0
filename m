Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B4D6CA3E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:19:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlX1G1gkNz3cd6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:19:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mfm6R/WQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mfm6R/WQ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlWw43h0fz3f5j
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:14:44 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0689611CA;
	Mon, 27 Mar 2023 12:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C784C433A4;
	Mon, 27 Mar 2023 12:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679919281;
	bh=hpHzcJ3T0vShL1lzlkbvi7pqgHNybQdWukxJR0vOP3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mfm6R/WQZMh61DGU+9uuCWkv0/tyJ6gJGGUPX4zG+Mk/WG5WkNGo0dAhhcwKvkeNZ
	 Z7uItq3PdOnRh7TPukjXUvNYAGRmmdeX8JS3mT3qo9kJY6F3XOZKksXOchdcM4Ox8m
	 YIgytC8vdHgG83EpJ1D/64cYqPwsTsUhPZ6rhpeC62QxfG4lJkjHaP4sM0VmU9aHOb
	 tvmNcya7wRhmDLi1iqOu44WhuiEB0TW0zubz6bYucmFVCHU+7L/S2wlSb9kE6kLicK
	 5hCctagI4UhCeLS7HyFjmcfLaXiJY5HRdWEL6v0y+dDF92dndyAz6eMDrhb79Jejef
	 K08wGLvDTfBVg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 05/21] powerpc: dma-mapping: split out cache operation logic
Date: Mon, 27 Mar 2023 14:13:01 +0200
Message-Id: <20230327121317.4081816-6-arnd@kernel.org>
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

The powerpc arch_sync_dma_for_device()/arch_sync_dma_for_cpu() functions
behave differently from all other architectures, at least for some of
the operations.

As a preparation for making the behavior more consistent, reorder the
logic in which they decide whether to flush, invalidate or clean the.
No change in behavior is intended.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/mm/dma-noncoherent.c | 91 +++++++++++++++++++++----------
 1 file changed, 63 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-noncoherent.c
index 30260b5d146d..f10869d27de5 100644
--- a/arch/powerpc/mm/dma-noncoherent.c
+++ b/arch/powerpc/mm/dma-noncoherent.c
@@ -16,31 +16,28 @@
 #include <asm/tlbflush.h>
 #include <asm/dma.h>
 
+enum dma_cache_op {
+	DMA_CACHE_CLEAN,
+	DMA_CACHE_INVAL,
+	DMA_CACHE_FLUSH,
+};
+
 /*
  * make an area consistent.
  */
-static void __dma_sync(void *vaddr, size_t size, int direction)
+static void __dma_op(void *vaddr, size_t size, enum dma_cache_op op)
 {
 	unsigned long start = (unsigned long)vaddr;
 	unsigned long end   = start + size;
 
-	switch (direction) {
-	case DMA_NONE:
-		BUG();
-	case DMA_FROM_DEVICE:
-		/*
-		 * invalidate only when cache-line aligned otherwise there is
-		 * the potential for discarding uncommitted data from the cache
-		 */
-		if ((start | end) & (L1_CACHE_BYTES - 1))
-			flush_dcache_range(start, end);
-		else
-			invalidate_dcache_range(start, end);
-		break;
-	case DMA_TO_DEVICE:		/* writeback only */
+	switch (op) {
+	case DMA_CACHE_CLEAN:
 		clean_dcache_range(start, end);
 		break;
-	case DMA_BIDIRECTIONAL:	/* writeback and invalidate */
+	case DMA_CACHE_INVAL:
+		invalidate_dcache_range(start, end);
+		break;
+	case DMA_CACHE_FLUSH:
 		flush_dcache_range(start, end);
 		break;
 	}
@@ -48,16 +45,16 @@ static void __dma_sync(void *vaddr, size_t size, int direction)
 
 #ifdef CONFIG_HIGHMEM
 /*
- * __dma_sync_page() implementation for systems using highmem.
+ * __dma_highmem_op() implementation for systems using highmem.
  * In this case, each page of a buffer must be kmapped/kunmapped
- * in order to have a virtual address for __dma_sync(). This must
+ * in order to have a virtual address for __dma_op(). This must
  * not sleep so kmap_atomic()/kunmap_atomic() are used.
  *
  * Note: yes, it is possible and correct to have a buffer extend
  * beyond the first page.
  */
-static inline void __dma_sync_page_highmem(struct page *page,
-		unsigned long offset, size_t size, int direction)
+static inline void __dma_highmem_op(struct page *page,
+		unsigned long offset, size_t size, enum dma_cache_op op)
 {
 	size_t seg_size = min((size_t)(PAGE_SIZE - offset), size);
 	size_t cur_size = seg_size;
@@ -71,7 +68,7 @@ static inline void __dma_sync_page_highmem(struct page *page,
 		start = (unsigned long)kmap_atomic(page + seg_nr) + seg_offset;
 
 		/* Sync this buffer segment */
-		__dma_sync((void *)start, seg_size, direction);
+		__dma_op((void *)start, seg_size, op);
 		kunmap_atomic((void *)start);
 		seg_nr++;
 
@@ -88,32 +85,70 @@ static inline void __dma_sync_page_highmem(struct page *page,
 #endif /* CONFIG_HIGHMEM */
 
 /*
- * __dma_sync_page makes memory consistent. identical to __dma_sync, but
- * takes a struct page instead of a virtual address
+ * __dma_phys_op makes memory consistent. identical to __dma_op, but
+ * takes a phys_addr_t instead of a virtual address
  */
-static void __dma_sync_page(phys_addr_t paddr, size_t size, int dir)
+static void __dma_phys_op(phys_addr_t paddr, size_t size, enum dma_cache_op op)
 {
 	struct page *page = pfn_to_page(paddr >> PAGE_SHIFT);
 	unsigned offset = paddr & ~PAGE_MASK;
 
 #ifdef CONFIG_HIGHMEM
-	__dma_sync_page_highmem(page, offset, size, dir);
+	__dma_highmem_op(page, offset, size, op);
 #else
 	unsigned long start = (unsigned long)page_address(page) + offset;
-	__dma_sync((void *)start, size, dir);
+	__dma_op((void *)start, size, op);
 #endif
 }
 
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	__dma_sync_page(paddr, size, dir);
+	switch (direction) {
+	case DMA_NONE:
+		BUG();
+	case DMA_FROM_DEVICE:
+		/*
+		 * invalidate only when cache-line aligned otherwise there is
+		 * the potential for discarding uncommitted data from the cache
+		 */
+		if ((start | end) & (L1_CACHE_BYTES - 1))
+			__dma_phys_op(start, end, DMA_CACHE_FLUSH);
+		else
+			__dma_phys_op(start, end, DMA_CACHE_INVAL);
+		break;
+	case DMA_TO_DEVICE:		/* writeback only */
+		__dma_phys_op(start, end, DMA_CACHE_CLEAN);
+		break;
+	case DMA_BIDIRECTIONAL:	/* writeback and invalidate */
+		__dma_phys_op(start, end, DMA_CACHE_FLUSH);
+		break;
+	}
 }
 
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	__dma_sync_page(paddr, size, dir);
+	switch (direction) {
+	case DMA_NONE:
+		BUG();
+	case DMA_FROM_DEVICE:
+		/*
+		 * invalidate only when cache-line aligned otherwise there is
+		 * the potential for discarding uncommitted data from the cache
+		 */
+		if ((start | end) & (L1_CACHE_BYTES - 1))
+			__dma_phys_op(start, end, DMA_CACHE_FLUSH);
+		else
+			__dma_phys_op(start, end, DMA_CACHE_INVAL);
+		break;
+	case DMA_TO_DEVICE:		/* writeback only */
+		__dma_phys_op(start, end, DMA_CACHE_CLEAN);
+		break;
+	case DMA_BIDIRECTIONAL:	/* writeback and invalidate */
+		__dma_phys_op(start, end, DMA_CACHE_FLUSH);
+		break;
+	}
 }
 
 void arch_dma_prep_coherent(struct page *page, size_t size)
-- 
2.39.2

