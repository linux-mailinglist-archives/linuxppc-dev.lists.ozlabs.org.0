Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B012D6CA403
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:25:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlX8V3fmZz3fZw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:25:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hBanRUO4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hBanRUO4;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlWxF30F7z3fYB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:15:45 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 19650B81184;
	Mon, 27 Mar 2023 12:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97FBDC433A0;
	Mon, 27 Mar 2023 12:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679919341;
	bh=uohG58os+YPGsAoIvHYZEyGIjYTpK/zcJikKrAX9FPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hBanRUO40otZWpiIlwJ2ahlYI2/SU8zPpLT3Qw57jJE40woaJrRwcvRFQpLc/CmtF
	 0htU6ckgOgXVZH2DE+dJDcgxfjuUFxw2l8Pn5C7OdFGFsmKKCazqxQQraKNSB0q9Xu
	 8oHDYMJBaw55+tzbreH4Ndmiz3clXO5/H+FcYDQe1iQ34jySEQMALNvOHQCQFHA7Lk
	 5/v6eq8R2opwH5aOlgYkRDsOvBF62H+KLqxeGyv9U6ps8rklWRlmbETlf8xD0OymSe
	 8y75Z9XzlD5evRjJOnI7bZLIIgFEQA8+P2HCk/nt22ZXSqKgj7kPcjr6CG0psnqbOe
	 EFkVwSkNAqLQw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 12/21] mips: dma-mapping: split out cache operation logic
Date: Mon, 27 Mar 2023 14:13:08 +0200
Message-Id: <20230327121317.4081816-13-arnd@kernel.org>
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

The mips arch_sync_dma_for_device()/arch_sync_dma_for_cpu() functions
behave the same way as on other architectures, but in order to unify
the implementations, the code needs to be rearranged to pick the type
of cache operation in the outermost function.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/mm/dma-noncoherent.c | 75 ++++++++++++++--------------------
 1 file changed, 30 insertions(+), 45 deletions(-)

diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index b4350faf4f1e..b9d68bcc5d53 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -54,50 +54,13 @@ void *arch_dma_set_uncached(void *addr, size_t size)
 	return (void *)(__pa(addr) + UNCAC_BASE);
 }
 
-static inline void dma_sync_virt_for_device(void *addr, size_t size,
-		enum dma_data_direction dir)
-{
-	switch (dir) {
-	case DMA_TO_DEVICE:
-		dma_cache_wback((unsigned long)addr, size);
-		break;
-	case DMA_FROM_DEVICE:
-		dma_cache_inv((unsigned long)addr, size);
-		break;
-	case DMA_BIDIRECTIONAL:
-		if (IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) &&
-		    cpu_needs_post_dma_flush())
-			dma_cache_wback((unsigned long)addr, size);
-		else
-			dma_cache_wback_inv((unsigned long)addr, size);
-		break;
-	default:
-		BUG();
-	}
-}
-
-static inline void dma_sync_virt_for_cpu(void *addr, size_t size,
-		enum dma_data_direction dir)
-{
-	switch (dir) {
-	case DMA_TO_DEVICE:
-		break;
-	case DMA_FROM_DEVICE:
-	case DMA_BIDIRECTIONAL:
-		dma_cache_inv((unsigned long)addr, size);
-		break;
-	default:
-		BUG();
-	}
-}
-
 /*
  * A single sg entry may refer to multiple physically contiguous pages.  But
  * we still need to process highmem pages individually.  If highmem is not
  * configured then the bulk of this loop gets optimized out.
  */
 static inline void dma_sync_phys(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir, bool for_device)
+		void(*cache_op)(unsigned long start, unsigned long size))
 {
 	struct page *page = pfn_to_page(paddr >> PAGE_SHIFT);
 	unsigned long offset = paddr & ~PAGE_MASK;
@@ -113,10 +76,7 @@ static inline void dma_sync_phys(phys_addr_t paddr, size_t size,
 		}
 
 		addr = kmap_atomic(page);
-		if (for_device)
-			dma_sync_virt_for_device(addr + offset, len, dir);
-		else
-			dma_sync_virt_for_cpu(addr + offset, len, dir);
+		cache_op((unsigned long)addr + offset, len);
 		kunmap_atomic(addr);
 
 		offset = 0;
@@ -128,15 +88,40 @@ static inline void dma_sync_phys(phys_addr_t paddr, size_t size,
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	dma_sync_phys(paddr, size, dir, true);
+	switch (dir) {
+	case DMA_TO_DEVICE:
+		dma_sync_phys(paddr, size, _dma_cache_wback);
+		break;
+	case DMA_FROM_DEVICE:
+		dma_sync_phys(paddr, size, _dma_cache_inv);
+		break;
+	case DMA_BIDIRECTIONAL:
+		if (IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) &&
+		    cpu_needs_post_dma_flush())
+			dma_sync_phys(paddr, size, _dma_cache_wback);
+		else
+			dma_sync_phys(paddr, size, _dma_cache_wback_inv);
+		break;
+	default:
+		break;
+	}
 }
 
 #ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	if (cpu_needs_post_dma_flush())
-		dma_sync_phys(paddr, size, dir, false);
+	switch (dir) {
+	case DMA_TO_DEVICE:
+		break;
+	case DMA_FROM_DEVICE:
+	case DMA_BIDIRECTIONAL:
+		if (cpu_needs_post_dma_flush())
+			dma_sync_phys(paddr, size, _dma_cache_inv);
+		break;
+	default:
+		break;
+	}
 }
 #endif
 
-- 
2.39.2

