Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBE96CA37E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:16:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlWyH4sHbz3fWX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:16:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fI64KM8c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fI64KM8c;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlWvZ3ZSXz3chq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:14:18 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E406F611E4;
	Mon, 27 Mar 2023 12:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22CE2C433A0;
	Mon, 27 Mar 2023 12:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679919255;
	bh=5/cbd11rgdZqe98FqIk/+syngKp9Hy8AwsMD312+wVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fI64KM8c/Ekdiv2ZKC9IycZF7Z2nU1AzPzgqokBHDE9VzldOQyySG0AudPk5QPofj
	 KAKyhzuHamSmO3zl8PCYGHrnv/203MoC5ecW0OjEqVJXXqlBlkvMLUmkWssApHxxv2
	 Nle0M09VxMvwHkFtDoEoZZpkFdiqCr9l1gU8/Flrgm0ruvonqEUiwE55/I56ExeNoX
	 WEmup8vMT0HfEzIuq/Zd5NckCFP+2d9Yrt6tk6M/3Yd774PQBapWJuZm2ObMbJ+u0A
	 XjUj222I9wl7wwTdyN+au9fLk6dq48OfUVC/8hF0sIbpcUutGH1P8vbg+6qI4iIj1V
	 LMbvRTLfiHWVg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 02/21] xtensa: dma-mapping: use normal cache invalidation rules
Date: Mon, 27 Mar 2023 14:12:58 +0200
Message-Id: <20230327121317.4081816-3-arnd@kernel.org>
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

xtensa is one of the platforms that has both write-back and write-through
caches, and needs to account for both in its DMA mapping operations.

It does this through a set of operations that is different from any
architecture. This is not a problem by itself, but it makes it rather
hard to figure out whether this is correct or not, and to unify this
implementation with the others.

Change the semantics to the usual ones for non-speculating CPUs:

 - On DMA_TO_DEVICE, call __flush_dcache_range() to perform the
   writeback even on writethrough caches, where this is a nop.

 - On DMA_FROM_DEVICE, invalidate the mapping before the DMA rather
   than afterwards.

 - On DMA_BIDIRECTIONAL, combine the pre-writeback with the
   post-invalidate into a call to __flush_invalidate_dcache_range()
   that turns into a simple invalidate on writeback caches.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/xtensa/Kconfig                  |  1 -
 arch/xtensa/include/asm/cacheflush.h |  6 +++---
 arch/xtensa/kernel/pci-dma.c         | 29 +++++-----------------------
 3 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index bcb0c5d2abc2..b938bacbb9af 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -8,7 +8,6 @@ config XTENSA
 	select ARCH_HAS_DMA_PREP_COHERENT if MMU
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_KCOV
-	select ARCH_HAS_SYNC_DMA_FOR_CPU if MMU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if MMU
 	select ARCH_HAS_DMA_SET_UNCACHED if MMU
 	select ARCH_HAS_STRNCPY_FROM_USER if !KASAN
diff --git a/arch/xtensa/include/asm/cacheflush.h b/arch/xtensa/include/asm/cacheflush.h
index 7b4359312c25..2f645d25565a 100644
--- a/arch/xtensa/include/asm/cacheflush.h
+++ b/arch/xtensa/include/asm/cacheflush.h
@@ -61,9 +61,9 @@ static inline void __flush_dcache_page(unsigned long va)
 static inline void __flush_dcache_range(unsigned long va, unsigned long sz)
 {
 }
-# define __flush_invalidate_dcache_all()	__invalidate_dcache_all()
-# define __flush_invalidate_dcache_page(p)	__invalidate_dcache_page(p)
-# define __flush_invalidate_dcache_range(p,s)	__invalidate_dcache_range(p,s)
+# define __flush_invalidate_dcache_all		__invalidate_dcache_all
+# define __flush_invalidate_dcache_page		__invalidate_dcache_page
+# define __flush_invalidate_dcache_range	__invalidate_dcache_range
 #endif
 
 #if defined(CONFIG_MMU) && (DCACHE_WAY_SIZE > PAGE_SIZE)
diff --git a/arch/xtensa/kernel/pci-dma.c b/arch/xtensa/kernel/pci-dma.c
index 94955caa4488..ff3bf015eca4 100644
--- a/arch/xtensa/kernel/pci-dma.c
+++ b/arch/xtensa/kernel/pci-dma.c
@@ -43,38 +43,19 @@ static void do_cache_op(phys_addr_t paddr, size_t size,
 		}
 }
 
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
+void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
 	switch (dir) {
-	case DMA_BIDIRECTIONAL:
+	case DMA_TO_DEVICE:
+		do_cache_op(paddr, size, __flush_dcache_range);
+		break;
 	case DMA_FROM_DEVICE:
 		do_cache_op(paddr, size, __invalidate_dcache_range);
 		break;
-
-	case DMA_NONE:
-		BUG();
-		break;
-
-	default:
-		break;
-	}
-}
-
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
-{
-	switch (dir) {
 	case DMA_BIDIRECTIONAL:
-	case DMA_TO_DEVICE:
-		if (XCHAL_DCACHE_IS_WRITEBACK)
-			do_cache_op(paddr, size, __flush_dcache_range);
+		do_cache_op(paddr, size, __flush_invalidate_dcache_range);
 		break;
-
-	case DMA_NONE:
-		BUG();
-		break;
-
 	default:
 		break;
 	}
-- 
2.39.2

