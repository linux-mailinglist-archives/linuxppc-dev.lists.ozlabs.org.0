Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8056CA3F4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:23:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlX6M25RKz3fVg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:23:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y2ffntjZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y2ffntjZ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlWwt3NKBz3fXC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:15:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A573B611CE;
	Mon, 27 Mar 2023 12:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A3DC433A4;
	Mon, 27 Mar 2023 12:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679919324;
	bh=X7ixDT/eME8zr2M/ikt5bC5rQoS3uASy2IlC1ftIdSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y2ffntjZwCcvJ7ZjcddqfIzivLJJTiZqbCBMhicCNOoftlZSKr8SZk1bt+v6QBdJ3
	 AqWhwmcTeaS96y4RUjpqI9FGKTqNfAOz/7RBt+ymuWQLCwljPJr+H8JgdNwFdqMXwE
	 J72tIuLXAnxcA7lDtjwg32UTtKQ0DkssHKQnBWYb3L+gXkApRayP0Mte6XTqD4QU75
	 zUBFdzaO9TiPGVooVFe2U07En2yoiRB9h1tj51608yH2BmWke6vfUVRIXO9jhZyAf0
	 Nifety/7HWh8t+jBWCaVsZT7PH2v1d96plBTbAk5HzBMivkiokDHTCIu3jr6mGkPTw
	 a3+V9R9fKm3ag==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 10/21] csky: dma-mapping: skip invalidating before DMA from device
Date: Mon, 27 Mar 2023 14:13:06 +0200
Message-Id: <20230327121317.4081816-11-arnd@kernel.org>
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

csky is the only architecture that does a full flush for the
dma_sync_*_for_device(..., DMA_FROM_DEVICE) operation. The requirement
is only make sure there are no dirty cache lines for the buffer,
which can be either done through an invalidate operation (as on most
architectures including arm32, mips and arc), or a writeback (as on
arm64 and riscv). The cache also has to be invalidated eventually but
csky already does that after the transfer.

Use a 'clean' operation here for consistency with arm64 and riscv.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/csky/mm/dma-mapping.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/csky/mm/dma-mapping.c b/arch/csky/mm/dma-mapping.c
index 82447029feb4..c90f912e2822 100644
--- a/arch/csky/mm/dma-mapping.c
+++ b/arch/csky/mm/dma-mapping.c
@@ -60,11 +60,9 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 {
 	switch (dir) {
 	case DMA_TO_DEVICE:
-		cache_op(paddr, size, dma_wb_range);
-		break;
 	case DMA_FROM_DEVICE:
 	case DMA_BIDIRECTIONAL:
-		cache_op(paddr, size, dma_wbinv_range);
+		cache_op(paddr, size, dma_wb_range);
 		break;
 	default:
 		BUG();
-- 
2.39.2

