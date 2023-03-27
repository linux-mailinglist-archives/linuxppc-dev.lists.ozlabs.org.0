Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B08856CA3C1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:18:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlX0G4J5Mz3fbM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:18:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PBdwMSfV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PBdwMSfV;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlWvt41xkz3chQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:14:34 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CD90D611ED;
	Mon, 27 Mar 2023 12:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9C0C433EF;
	Mon, 27 Mar 2023 12:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679919272;
	bh=ZhYG8JNUwjljPv9OKiF3eMGP7VJHxmj1d7o6guSf4No=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PBdwMSfV6WhGkWO4GD6yfcHOXcUpefrDC/+txqBn1K1TXjh6vtxTQLHjgNJ0FEkt0
	 8kEYArEe0oN6TTz55A/ouqhYMm5G10akCJmXzW/muCfT8GBSGN5Uni+3VEARUH4Auc
	 H3B65ricYeSXsGj53UrQTCcr95NZtYK/45G5qbsvcFbKhYxNglRYB3Jv/RHrFzHtks
	 DVdr6HivllSdF2l5dgd1hATA9JZvKqwXHc1koDjA6e60zts4nydXjlN/RqoC6otSSa
	 Tq0Qb2MNzDbHG7RwE+Edr/TKARawLeFdDNo+IyVrlawBJzvWe5xP0tuqDo6AiiQKTk
	 Trtj2/d6VSosQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 04/21] microblaze: dma-mapping: skip extra DMA flushes
Date: Mon, 27 Mar 2023 14:13:00 +0200
Message-Id: <20230327121317.4081816-5-arnd@kernel.org>
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

The microblaze dma_sync_* implementation uses the same function
for both _for_cpu() and _for_device(), which is inconsistent
with other architectures and slightly more expensive.

Split it up into separate functions and skip the parts that
are not needed:

 - on dma_sync_*_for_cpu(..., DMA_TO_DEVICE), skip the second
   writeback, which does nothing.

 - on dma_sync_*_for_cpu(..., DMA_BIDIRECTIONAL), only invalidate
   the cache to clear out cache lines that got loaded speculatively,
   but skip the extraneous writeback.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/microblaze/kernel/dma.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/microblaze/kernel/dma.c b/arch/microblaze/kernel/dma.c
index 04d091ade417..b4c4e45fd45e 100644
--- a/arch/microblaze/kernel/dma.c
+++ b/arch/microblaze/kernel/dma.c
@@ -14,8 +14,8 @@
 #include <linux/bug.h>
 #include <asm/cacheflush.h>
 
-static void __dma_sync(phys_addr_t paddr, size_t size,
-		enum dma_data_direction direction)
+void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
+		enum dma_data_direction dir)
 {
 	switch (direction) {
 	case DMA_TO_DEVICE:
@@ -30,14 +30,16 @@ static void __dma_sync(phys_addr_t paddr, size_t size,
 	}
 }
 
-void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
-{
-	__dma_sync(paddr, size, dir);
-}
-
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	__dma_sync(paddr, size, dir);
-}
+	switch (direction) {
+	case DMA_TO_DEVICE:
+		break;
+	case DMA_BIDIRECTIONAL:
+	case DMA_FROM_DEVICE:
+		invalidate_dcache_range(paddr, paddr + size);
+		break;
+	default:
+		BUG();
+	}}
-- 
2.39.2

