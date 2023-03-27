Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B92966CA422
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:31:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlXHc3sBkz3fyq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:31:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j2km9ZzY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j2km9ZzY;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlWyP0kHQz3fbl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:16:45 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 64B50611EA;
	Mon, 27 Mar 2023 12:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A199BC433A4;
	Mon, 27 Mar 2023 12:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679919402;
	bh=5fk8QyC/KB/jrsvrHp6V4LA83bUbandj0Wfn0eu1ajs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j2km9ZzYuNDulQLsscEoaytNZ1gOapGTux+/qnSpRR7kgHRFAwDWDmiH52U7YUwS2
	 l25ig62lChXkRW9dVZHw0u6u831HBjAVfoB4gwIhsDu9Oly0WFytQgzyZsIKEt4ZjO
	 ebigDsT9ROl6sWYKYTUDMLRjvwmuklMuOt84flr18xR/2kTbMG38tS/UXspKPu2ixh
	 EuScV8pm+I4HHjlAfxf0LfOpZq853V+LM4kxrKbWNcmBeEWw/4N5QI2a8DvVG5mYHv
	 K6lh//J1Yh7TkacN4sV4vOvpMMmOkrqnjch6bIyUT4KqwtxFWozh9BZ59rFdrnUb0v
	 pxs4A/jmHxEIw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 19/21] ARM: dma-mapping: use generic form of arch_sync_dma_* helpers
Date: Mon, 27 Mar 2023 14:13:15 +0200
Message-Id: <20230327121317.4081816-20-arnd@kernel.org>
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

As the final step of the conversion to generic arch_sync_dma_*
helpers, change the Arm implementation to look the same as the
new generic version, by calling the dmac_{clean,inv,flush}_area
low-level functions instead of the abstracted dmac_{map,unmap}_area
version.

On ARMv6/v7, this invalidates the caches after a DMA transfer from
a device because of speculative prefetching, while on earlier versions
it only needs to do this before the transfer.

This should not change any of the current behavior.

FIXME: address CONFIG_DMA_CACHE_RWFO properly.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mm/dma-mapping-nommu.c | 11 +++----
 arch/arm/mm/dma-mapping.c       | 53 +++++++++++++++++++++++----------
 2 files changed, 43 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mm/dma-mapping-nommu.c b/arch/arm/mm/dma-mapping-nommu.c
index cfd9c933d2f0..12b5c6ae93fc 100644
--- a/arch/arm/mm/dma-mapping-nommu.c
+++ b/arch/arm/mm/dma-mapping-nommu.c
@@ -16,12 +16,13 @@
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	dmac_map_area(__va(paddr), size, dir);
-
-	if (dir == DMA_FROM_DEVICE)
+	if (dir == DMA_FROM_DEVICE) {
+		dmac_inv_range(__va(paddr), __va(paddr + size));
 		outer_inv_range(paddr, paddr + size);
-	else
+	} else {
+		dmac_clean_range(__va(paddr), __va(paddr + size));
 		outer_clean_range(paddr, paddr + size);
+	}
 }
 
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
@@ -29,7 +30,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 {
 	if (dir != DMA_TO_DEVICE) {
 		outer_inv_range(paddr, paddr + size);
-		dmac_unmap_area(__va(paddr), size, dir);
+		dmac_inv_range(__va(paddr), __va(paddr));
 	}
 }
 
diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index ce4b74f34a58..cc702cb27ae7 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -623,8 +623,7 @@ static void __arm_dma_free(struct device *dev, size_t size, void *cpu_addr,
 }
 
 static void dma_cache_maint(phys_addr_t paddr,
-	size_t size, enum dma_data_direction dir,
-	void (*op)(const void *, size_t, int))
+	size_t size, void (*op)(const void *, const void *))
 {
 	unsigned long pfn = PFN_DOWN(paddr);
 	unsigned long offset = paddr % PAGE_SIZE;
@@ -647,18 +646,18 @@ static void dma_cache_maint(phys_addr_t paddr,
 
 			if (cache_is_vipt_nonaliasing()) {
 				vaddr = kmap_atomic(page);
-				op(vaddr + offset, len, dir);
+				op(vaddr + offset, vaddr + offset + len);
 				kunmap_atomic(vaddr);
 			} else {
 				vaddr = kmap_high_get(page);
 				if (vaddr) {
-					op(vaddr + offset, len, dir);
+					op(vaddr + offset, vaddr + offset + len);
 					kunmap_high(page);
 				}
 			}
 		} else {
 			vaddr = page_address(page) + offset;
-			op(vaddr, len, dir);
+			op(vaddr, vaddr + len);
 		}
 		offset = 0;
 		pfn++;
@@ -666,6 +665,18 @@ static void dma_cache_maint(phys_addr_t paddr,
 	} while (left);
 }
 
+static bool arch_sync_dma_cpu_needs_post_dma_flush(void)
+{
+	if (IS_ENABLED(CONFIG_CPU_V6) ||
+	    IS_ENABLED(CONFIG_CPU_V6K) ||
+	    IS_ENABLED(CONFIG_CPU_V7) ||
+	    IS_ENABLED(CONFIG_CPU_V7M))
+		return true;
+
+	/* FIXME: runtime detection */
+	return false;
+}
+
 /*
  * Make an area consistent for devices.
  * Note: Drivers should NOT use this function directly.
@@ -674,25 +685,35 @@ static void dma_cache_maint(phys_addr_t paddr,
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	dma_cache_maint(paddr, size, dir, dmac_map_area);
-
-	if (dir == DMA_FROM_DEVICE) {
-		outer_inv_range(paddr, paddr + size);
-	} else {
+	switch (dir) {
+	case DMA_TO_DEVICE:
+		dma_cache_maint(paddr, size, dmac_clean_range);
 		outer_clean_range(paddr, paddr + size);
+		break;
+	case DMA_FROM_DEVICE:
+		dma_cache_maint(paddr, size, dmac_inv_range);
+		outer_inv_range(paddr, paddr + size);
+		break;
+	case DMA_BIDIRECTIONAL:
+		if (arch_sync_dma_cpu_needs_post_dma_flush()) {
+			dma_cache_maint(paddr, size, dmac_clean_range);
+			outer_clean_range(paddr, paddr + size);
+		} else {
+			dma_cache_maint(paddr, size, dmac_flush_range);
+			outer_flush_range(paddr, paddr + size);
+		}
+		break;
+	default:
+		break;
 	}
-	/* FIXME: non-speculating: flush on bidirectional mappings? */
 }
 
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	/* FIXME: non-speculating: not required */
-	/* in any case, don't bother invalidating if DMA to device */
-	if (dir != DMA_TO_DEVICE) {
+	if (dir != DMA_TO_DEVICE && arch_sync_dma_cpu_needs_post_dma_flush()) {
 		outer_inv_range(paddr, paddr + size);
-
-		dma_cache_maint(paddr, size, dir, dmac_unmap_area);
+		dma_cache_maint(paddr, size, dmac_inv_range);
 	}
 
 	/*
-- 
2.39.2

