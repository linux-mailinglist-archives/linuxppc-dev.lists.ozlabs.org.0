Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F8593F34F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 12:54:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=oxb6c/Eu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXZxN4BbWz3cXL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 20:54:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=oxb6c/Eu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tkos.co.il (client-ip=84.110.109.230; helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=lists.ozlabs.org)
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXZtL3BG4z3cH2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2024 20:51:54 +1000 (AEST)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id 5C85044077F;
	Mon, 29 Jul 2024 13:50:32 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1722250232;
	bh=fW3seKu3qSWQ63GvanpzjS9o30g/c8HO+hDOTWVeunY=;
	h=From:To:Cc:Subject:Date:From;
	b=oxb6c/Eu6R3lnFbBk1ATcjrT04NEVWB9QlcbuP6HUW8mgWd+gF1a/nKIokODTXVEa
	 OPq8XiyDhAxh7nRm91I3O5m+7MK740rLnMhBRvbhasdMcwGkbi26eNM/wG5j4zx6kg
	 RUo7n483hb7jswtzULahoaXd3+3arO6GytgHs/6b3Sr7Pv5lBZptycGtoF2RzPY+oR
	 hnpqgsVLqN8b3fvK4wTH0IzCg5Srw5G0QnQdFHmIbO7LBBDAHHpSTMe/xSTfjVKt/A
	 ouC0R5aURB3/Sn2fLU2NJut7AYOriSMaeAYYf4ywM42DhNjkBh6oEknuwRbvGmBvjo
	 30+SvOeUXew4A==
From: Baruch Siach <baruch@tkos.co.il>
To: Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 0/3] dma: support DMA zone starting above 4GB
Date: Mon, 29 Jul 2024 13:51:23 +0300
Message-ID: <cover.1722249878.git.baruch@tkos.co.il>
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
suggestion to use start of RAM[3]. This RFC series attempts to implement that 
suggestion.

With this series applied, the DMA zone covers the right RAM range for my 
platform.

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

Baruch Siach (2):
  dma-mapping: improve DMA zone selection
  dma-direct: use RAM start to offset zone_dma_limit

Catalin Marinas (1):
  dma-mapping: replace zone_dma_bits by zone_dma_limit

 arch/arm64/mm/init.c       | 34 +++++++++++++---------------------
 arch/powerpc/mm/mem.c      |  9 ++++-----
 arch/s390/mm/init.c        |  2 +-
 include/linux/dma-direct.h |  2 +-
 kernel/dma/direct.c        | 15 ++++++++-------
 kernel/dma/pool.c          |  3 ++-
 kernel/dma/swiotlb.c       |  4 ++--
 7 files changed, 31 insertions(+), 38 deletions(-)

-- 
2.43.0

