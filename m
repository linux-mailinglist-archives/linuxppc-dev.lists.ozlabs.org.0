Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1852F9457EE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 08:06:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lists.ozlabs.org;
	s=201707; t=1722578804;
	bh=gV36URVWmw7CY7+M/fDSEbV9mGD1fUadgkI2OS2csFg=;
	h=To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=WYYeeSMbFNiZ+o8xWVBFDhMehIZVYNC1m3cx1+zkO69vP1jww5ThdO/Z0rDREw3EC
	 A3WrTtzrae2rGcnIFsSrx0nNPY9u6xXYIjLlnq+oq/mQnULigsSxoExffIloNnQA5r
	 cdhi1H/iBe54RjRixEUACBMc92ZJ4GG7rouYbxsNqpWGi4q/o3MHVEVEBLSMhKVLWP
	 EAH/x5g3ahubuZBl1YEZNCmwQtR6eIVHvBGxnL0CEKtM7OvuNTOHsohg5NB8Cn3yBo
	 tdoO//Ncd8V0dN1qk+Sq8Rs0obQLz7APCGxWim8kcKps0KkgnkUDs/VB8FxFenCtCO
	 zlukT8UZEI3jw==
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZwMS03Jtz3dTM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 16:06:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=laksWbYU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tkos.co.il (client-ip=84.110.109.230; helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=lists.ozlabs.org)
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZwJR0zY4z3cSd
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 16:04:07 +1000 (AEST)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id 9BC03440478;
	Fri,  2 Aug 2024 09:02:39 +0300 (IDT)
To: Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v5 0/3] dma: support DMA zone starting above 4GB
Date: Fri,  2 Aug 2024 09:03:45 +0300
Message-ID: <cover.1722578375.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
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
From: Baruch Siach via Linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: linux-s390@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Ramon Fried <ramon@neureality.ai>, =?UTF-8?q?Petr=20Tesa=C5=99=C3=ADk?= <petr@tesarici.cz>, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DMA zones code assumes that DMA lower limit is zero. When there is no RAM 
below 4GB, arm64 platform code sets DMA/DMA32 zone limits to cover the entire 
RAM[0].

My target platform has RAM starting at 32GB. Devices with 30-bit DMA mask are 
mapped to 1GB at the bottom of RAM, between 32GB - 33GB. DMA zone over the 
entire RAM breaks DMA allocation for these devices.

In response to a previous RFC hack[1] Catalin Marinas suggested to add a
separate offset value as base address for the DMA zone, and then refined the 
suggestion to use start of RAM[3]. This series attempts to implement that 
suggestion.

With this series applied, the DMA zone covers the right RAM range for my 
platform.

v5:

  * Test the correct kernel

  * Add missing patch that actually makes DMA zone work

  * Extend the treatment of zone_dma_limit > DMA_BIT_MASK(32)

  * Use max() to make the code somewhat more readable

  * Change zone_dma_limit type to u64 to match DMA_BIT_MASK()

v4:

  * Drop last patch. zone_dma_limit includes RAM base address.

  * Adjust DMA zone selection in swiotlb as well.

  * Don't change max_zone_phys() behaviour

  * Update code to fallback to DMA zone when zone_dma_limit > DMA_BIT_MASK(32)

v3:

  * Rebase on v6.11-rc1.

  * Drop zone_dma_base. Use memblock_start_of_DRAM() instead.

  * Drop DT patches. Low DMA range limit no longer needed.

  * Add patch to improve dma_direct_optimal_gfp_mask() heuristics as Catalin 
    suggested.

RFC v2:

  * Add patch from Catalin[2] changing zone_dma_bits to zone_dma_limit to 
    simplify subsequent patches

  * Test on real hardware

RFC v1: https://lore.kernel.org/all/cover.1703683642.git.baruch@tkos.co.il/

[0] See commit 791ab8b2e3db ("arm64: Ignore any DMA offsets in the 
    max_zone_phys() calculation")

[1] https://lore.kernel.org/all/9af8a19c3398e7dc09cfc1fbafed98d795d9f83e.1699464622.git.baruch@tkos.co.il/

[2] https://lore.kernel.org/all/ZZ2HnHJV3gdzu1Aj@arm.com/

[3] https://lore.kernel.org/all/ZnH-VU2iz9Q2KLbr@arm.com/

Baruch Siach (1):
  dma: improve DMA zone selection

Catalin Marinas (2):
  dma: replace zone_dma_bits by zone_dma_limit
  arm64: support DMA zone above 4GB

 arch/arm64/mm/init.c       | 32 ++++++++++----------------------
 arch/powerpc/mm/mem.c      |  9 ++++-----
 arch/s390/mm/init.c        |  2 +-
 include/linux/dma-direct.h |  2 +-
 kernel/dma/direct.c        | 10 +++++-----
 kernel/dma/pool.c          |  4 ++--
 kernel/dma/swiotlb.c       |  8 ++++----
 7 files changed, 27 insertions(+), 40 deletions(-)


base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
-- 
2.43.0

