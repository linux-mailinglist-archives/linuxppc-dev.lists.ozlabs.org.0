Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D92E6CA3E4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:21:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlX3N6XgYz3fbD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:21:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CPGniWUc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CPGniWUc;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlWwQ31GXz3fT3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:15:02 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C83ABB81158;
	Mon, 27 Mar 2023 12:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660FDC4331E;
	Mon, 27 Mar 2023 12:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679919298;
	bh=Y+wx0FiQgLjkqhPKxtczgrowoCTrPuzhrrVdIO/KSAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CPGniWUcV5VUAZiOWzIY5/EsUqYQgyEzxjQ8UMeF3Al20/Hh61j9pc8T9PS2mzH4N
	 RSYd/J7YHPH5Nmfk7XsUSK79nWPo+dGlRYvhxWqnqg+N+CIjbuT/Wb2iRTjyp1l0YE
	 q3AT+X8nNFF6xSpGl06sKKOZy0e/LCKNsDpUgC07vuwopI9ykgcvXa2bBFGYOjVaGl
	 X5PV9Eydwk0GTrNzStCQUtT6ovd3xxwDRfs6NRHuZY4OjKijI2Z6KdM95ztBnGcDwK
	 5HPw8DEJ4VDkMTWgdZ8nt+6QlnfKBn6oiVjPRF9H4yYTieJdfpVbSHx8IkThq5gzbA
	 lsa0aYW1Hchqw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 07/21] powerpc: dma-mapping: always clean cache in _for_device() op
Date: Mon, 27 Mar 2023 14:13:03 +0200
Message-Id: <20230327121317.4081816-8-arnd@kernel.org>
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

The powerpc implementation of arch_sync_dma_for_device() is unique in that
it sometimes performs a full flush for the arch_sync_dma_for_device(paddr,
size, DMA_FROM_DEVICE) operation when the address is unaligned, but
otherwise invalidates the caches.

Since the _for_cpu() counterpart has to invalidate the cache already
in order to avoid stale data from prefetching, this operation only really
needs to ensure that there are no dirty cache lines, which can be done
using either invalidation or cleaning the cache, but not necessarily
both.

Most architectures traditionally go for invalidation here, but as
Will Deacon points out, this can leak old data to user space if
a DMA is started but the device ends up not actually filling the
entire buffer, see the link below.

The same argument applies to DMA_BIDIRECTIONAL transfers. Using
a cache-clean operation is the safe choice here, followed by
invalidating the cache after the DMA to get rid of stale data
that was prefetched before the completion of the DMA.

Link: https://lore.kernel.org/all/20220606152150.GA31568@willie-the-truck/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/mm/dma-noncoherent.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-noncoherent.c
index e108cacf877f..00e59a4faa2b 100644
--- a/arch/powerpc/mm/dma-noncoherent.c
+++ b/arch/powerpc/mm/dma-noncoherent.c
@@ -104,26 +104,7 @@ static void __dma_phys_op(phys_addr_t paddr, size_t size, enum dma_cache_op op)
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	switch (direction) {
-	case DMA_NONE:
-		BUG();
-	case DMA_FROM_DEVICE:
-		/*
-		 * invalidate only when cache-line aligned otherwise there is
-		 * the potential for discarding uncommitted data from the cache
-		 */
-		if ((start | end) & (L1_CACHE_BYTES - 1))
-			__dma_phys_op(start, end, DMA_CACHE_FLUSH);
-		else
-			__dma_phys_op(start, end, DMA_CACHE_INVAL);
-		break;
-	case DMA_TO_DEVICE:		/* writeback only */
-		__dma_phys_op(start, end, DMA_CACHE_CLEAN);
-		break;
-	case DMA_BIDIRECTIONAL:	/* writeback and invalidate */
-		__dma_phys_op(start, end, DMA_CACHE_FLUSH);
-		break;
-	}
+	__dma_phys_op(start, end, DMA_CACHE_CLEAN);
 }
 
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
-- 
2.39.2

