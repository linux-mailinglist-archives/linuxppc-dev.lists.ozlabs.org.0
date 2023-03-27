Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4086CA40F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:26:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlX9V0VNFz3g18
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:26:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gF/2rqKM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gF/2rqKM;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlWxQ0xQLz3fT1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:15:54 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C6BE7B80D0C;
	Mon, 27 Mar 2023 12:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C656C4339B;
	Mon, 27 Mar 2023 12:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679919350;
	bh=WcyJUuclgspkZHSwVclV5Jksx+zy3hY89ahpztaj0hM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gF/2rqKM1LHnyfHfzF1g693XZNfrbHBqd2oKlgoQ2jGFc8xTOws4qsH2njENSW1Si
	 OGeqBCL1Lt3BSCm5fmGZhO1H6HKEoKzetUEYMk3Soh/1yhM8nZtCol16EHntqcT8Er
	 pM+o9uzAgZL1iYBAWUy3z6yGzIeoUU0K+TXymgHYz7EqbCIvcrn8MMo6RRjBuEtKTx
	 6l+8vcM3FOZ1WkoHQ1Wlf6+gyjrHJP0Ci4xI/sPZptxVi/W3OXZggPcMTH3OeaOXte
	 UVzqZh+or7dDyFm/ogv6Vz88DYJfSiZ34SmQ2duChP+VAO1veqEJjztWBBm3dd9c41
	 y9Yt0CcmM/sAw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 13/21] arc: dma-mapping: skip invalidating before bidirectional DMA
Date: Mon, 27 Mar 2023 14:13:09 +0200
Message-Id: <20230327121317.4081816-14-arnd@kernel.org>
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

Some architectures that need to invalidate buffers after bidirectional
DMA because of speculative prefetching only do a simpler writeback
before that DMA, while architectures that don't need to do the second
invalidate tend to have a combined writeback+invalidate before the
DMA.

arc is one of the architectures that does both, which seems unnecessary.

Change it to behave like arm/arm64/xtensa instead, and use just a
writeback before the DMA when we do the invalidate afterwards.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arc/mm/dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
index 2a7fbbb83b70..ddb96786f765 100644
--- a/arch/arc/mm/dma.c
+++ b/arch/arc/mm/dma.c
@@ -40,7 +40,7 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
  *          |----------------------------------------------------------------
  * TO_DEV   |   writeback        writeback      |   none          none
  * FROM_DEV |   invalidate       invalidate     |   invalidate*   invalidate*
- * BIDIR    |   writeback+inv    writeback+inv  |   invalidate    invalidate
+ * BIDIR    |   writeback        writeback      |   invalidate    invalidate
  *
  *     [*] needed for CPU speculative prefetches
  *
@@ -61,7 +61,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		break;
 
 	case DMA_BIDIRECTIONAL:
-		dma_cache_wback_inv(paddr, size);
+		dma_cache_wback(paddr, size);
 		break;
 
 	default:
-- 
2.39.2

