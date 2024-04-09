Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3266C89D263
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 08:26:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=a4c9OXqG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDGF96sg2z3dHK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 16:26:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=a4c9OXqG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tkos.co.il (client-ip=84.110.109.230; helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=lists.ozlabs.org)
X-Greylist: delayed 444 seconds by postgrey-1.37 at boromir; Tue, 09 Apr 2024 16:25:40 AEST
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDGDN2vT2z2yst
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 16:25:40 +1000 (AEST)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id 5C128440209;
	Tue,  9 Apr 2024 09:17:42 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1712643462;
	bh=bnuGCfoRD/GHBH5oPlzJgRbdryYdtuyyryw5PvMST3k=;
	h=From:To:Cc:Subject:Date:From;
	b=a4c9OXqGbWvMqcGamtbGvNOylokFOW+P/K6pK1HJUkwAsoEkr11JAJ94N9DueCzUL
	 Sh9pTDCYg72vzxXwwgo7aoVROdIbGvzuaSAzdizDy/f66CdkraK47/FHVX0aLnAylz
	 bgZYDCW9qIt0nfbBWhnvW9LIjltl/WjI8PVkpsVa1LcktqpmDJo4MwsQO93eEn4bkp
	 pD3oGKocfvAQF8y7xcMH/10bUZEagZl00KRqDBhV8dfGmtr7MUP90ka7K3D46nD30L
	 t9hnstbzUOSxvqVeJL72Jv475/gjlo0tBTgGxCv2+6SrIF50HZzI/hnozSsPuc56BP
	 1euAVmAgJnV3w==
From: Baruch Siach <baruch@tkos.co.il>
To: Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH RFC v2 0/5] arm64: support DMA zone starting above 4GB
Date: Tue,  9 Apr 2024 09:17:53 +0300
Message-ID: <cover.1712642324.git.baruch@tkos.co.il>
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
Cc: devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Ramon Fried <ramon@neureality.ai>, linux-s390@vger.kernel.org, =?UTF-8?q?Petr=20Tesa=C5=99=C3=ADk?= <petr@tesarici.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DMA zones code assumes that DMA lower limit is zero. When there is no RAM 
below 4GB, arm64 platform code sets DMA/DMA32 zone limits to cover the entire 
RAM[0].

The platform I have has RAM starting at 32GB. Devices with 30-bit DMA mask are 
mapped to 1GB at the bottom of RAM, between 32GB - 33GB. A DMA zone over the 
entire RAM breaks DMA allocation for these devices.

In response to a previous RFC hack[1] Catalin Marinas suggested to add a
separate offset value as base address for the DMA zone. This RFC series 
attempts to implement that suggestion.

With this series applied, the DMA zone covers the right RAM range for my 
platform.

RFC v2:

  * Add patch from Catalin[2] changing zone_dma_bits to zone_dma_limit to 
    simplify subsequent patches

  * Test on real hardware

RFC v1: https://lore.kernel.org/all/cover.1703683642.git.baruch@tkos.co.il/

[0] See commit 791ab8b2e3db ("arm64: Ignore any DMA offsets in the 
    max_zone_phys() calculation")

[1] https://lore.kernel.org/all/9af8a19c3398e7dc09cfc1fbafed98d795d9f83e.1699464622.git.baruch@tkos.co.il/

[2] https://lore.kernel.org/all/ZZ2HnHJV3gdzu1Aj@arm.com/

Baruch Siach (4):
  of: get dma area lower limit
  of: unittest: add test for of_dma_get_cpu_limits() 'min' param
  dma-direct: add base offset to zone_dma_bits
  arm64: mm: take DMA zone offset into account

Catalin Marinas (1):
  dma-mapping: replace zone_dma_bits by zone_dma_limit

 arch/arm64/mm/init.c       | 34 ++++++++++++----------------------
 arch/powerpc/mm/mem.c      |  9 ++++-----
 arch/s390/mm/init.c        |  2 +-
 drivers/of/address.c       | 38 +++++++++++++++++++++++++++-----------
 drivers/of/unittest.c      | 17 ++++++++++-------
 include/linux/dma-direct.h |  3 ++-
 include/linux/of.h         | 11 ++++++++---
 kernel/dma/direct.c        | 11 ++++++-----
 kernel/dma/pool.c          |  2 +-
 kernel/dma/swiotlb.c       |  4 ++--
 10 files changed, 73 insertions(+), 58 deletions(-)

-- 
2.43.0

