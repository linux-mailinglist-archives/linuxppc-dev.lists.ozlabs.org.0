Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A42D6CA363
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:15:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlWxJ2qHqz3fTJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:15:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W6MicPQL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W6MicPQL;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlWvR35H1z3cfY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:14:11 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F0738B81157;
	Mon, 27 Mar 2023 12:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F17DC433A1;
	Mon, 27 Mar 2023 12:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679919246;
	bh=iOskfAliyJ2EhiqigbZrQ+9sb9TAldUUyoYPaRwEDOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W6MicPQL1BPAw1q2u16+yvNoyGVAcN9kWWP2q0yJFA8WaLlF3xLFP4qqYt27HzGvZ
	 mYxFUqLxZu9g0vfRk0OkwpqBme7YFBXsTkGRImpamVFKboMg1ei5YSkU3H42SVCWJG
	 H4nHFGqZZLZUxa/aPn/txUIU1mCwKXrPAyD3x4VQDrGJVJD55nysVZn54+BS+ffi/N
	 ZJubl/TUz3/2ub3bBwZP3NXIhkqVNUL1hsEZh4C64w43FHfNUjNUNIpLrpsry8bakr
	 G1L0PvdkaTbdJCAriKbg/QJs9DMAkZ6JBhr2hpVO04DL/gLRI07Z7LrzaJ0P3TgcaW
	 D3F+FJCQte2dA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 01/21] openrisc: dma-mapping: flush bidirectional mappings
Date: Mon, 27 Mar 2023 14:12:57 +0200
Message-Id: <20230327121317.4081816-2-arnd@kernel.org>
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

The cache management operations on DMA are different from the
other architectures:

 - on DMA_TO_DEVICE, Openrisc currently invalidates the cache
   after the writeback, where a simple writeback without
   invalidation should be sufficient.

 - on DMA_BIDIRECTIONAL, Openrisc does nothing, while most
   architectures either flush before DMA, or writeback before
   and invalidate after DMA. The separate invalidation for
   DMA_BIDIRECTIONAL/DMA_FROM_DEVICE is only required on CPUs
   that can do speculative prefetches.

Change both to have the normal set of operations.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/openrisc/kernel/dma.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/openrisc/kernel/dma.c b/arch/openrisc/kernel/dma.c
index b3edbb33b621..91a00d09ffad 100644
--- a/arch/openrisc/kernel/dma.c
+++ b/arch/openrisc/kernel/dma.c
@@ -103,10 +103,10 @@ void arch_sync_dma_for_device(phys_addr_t addr, size_t size,
 
 	switch (dir) {
 	case DMA_TO_DEVICE:
-		/* Flush the dcache for the requested range */
+		/* Write back the dcache for the requested range */
 		for (cl = addr; cl < addr + size;
 		     cl += cpuinfo->dcache_block_size)
-			mtspr(SPR_DCBFR, cl);
+			mtspr(SPR_DCBWR, cl);
 		break;
 	case DMA_FROM_DEVICE:
 		/* Invalidate the dcache for the requested range */
@@ -114,12 +114,13 @@ void arch_sync_dma_for_device(phys_addr_t addr, size_t size,
 		     cl += cpuinfo->dcache_block_size)
 			mtspr(SPR_DCBIR, cl);
 		break;
+	case DMA_BIDIRECTIONAL:
+		/* Flush the dcache for the requested range */
+		for (cl = addr; cl < addr + size;
+		     cl += cpuinfo->dcache_block_size)
+			mtspr(SPR_DCBFR, cl);
+		break;
 	default:
-		/*
-		 * NOTE: If dir == DMA_BIDIRECTIONAL then there's no need to
-		 * flush nor invalidate the cache here as the area will need
-		 * to be manually synced anyway.
-		 */
 		break;
 	}
 }
-- 
2.39.2

