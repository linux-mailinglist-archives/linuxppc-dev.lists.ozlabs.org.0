Return-Path: <linuxppc-dev+bounces-12598-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4734FBA72C2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Sep 2025 17:02:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cZSH644JZz3cYy;
	Mon, 29 Sep 2025 01:02:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759071762;
	cv=none; b=CdK26zO808ezbCtlwx/+i7edXWoB+I8EeUBr+ztoCoAxSadNXfdJ0Yoy9J3dbOybr3adn9jaRlFMaWnZKjEJ+4TjOAnJCFnQva4iJc9x0IxafE3pz/y70H0FRE8pY3xyLIZGyZ7S3tEqSRZLvFbwE7xkN52CKJCWrrvPXRNHIEDopkKgGg74czzJDKKFUJgWiE+AIB8YY86KlzYsI986SA64Q9j5fK4SZYrqIXZm6X/pETylYGMPWvDHyUkkk2K0CopX/WLZvJjtz+vJz5MbvAPHqHrDJ8P6xkLi+ZFv6UsC3FPSl1d/mTdu6oklZHefGBdMJ9lI9eFk9E60P24Eiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759071762; c=relaxed/relaxed;
	bh=qYNclzTUuy7Lk5f93H5fc2Ac9Wg3CbR/t063jtYx/2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=go82pTm2NArq2QveWyI5cKFGaKf/9cwlLgji/niBvY6fPquqFwsq9+MhEm5LSZ4nrKr6WR/629yAOc2VA9LVRNpXvTAo113ttjXY7ShJYk9IkJ718CaBkK1xsME9b4z58UAVy/KTLsiDBjsVe/wvWE5NqSS/OzGUql8aQL8qUqwLFghf8KUnzoN7zhuv5utFldfHMijMBgtOnnDIBkhrYiBJsP3d8/WJuim9OxNrltR0nyZZJyz2NLQRMzqwPeLrnTsLDp6/5kO2O0jI1ZFpBAl2XqKq3TPJlQhWjm0DV7M+YiO1omb+GVJMVpgPToAdsJCWlDjanLD+dqGRTcwRpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TnkMQdRq; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TnkMQdRq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cZSH54x8vz30V1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Sep 2025 01:02:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 60CC46218F;
	Sun, 28 Sep 2025 15:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E12C4CEF0;
	Sun, 28 Sep 2025 15:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759071759;
	bh=Akj3CON6IBsq+OP9A9OkC5SszLfqcLnpZRG8DGaLpwM=;
	h=From:To:Cc:Subject:Date:From;
	b=TnkMQdRqI3QZ3YV/GCpp5pqPe146ZT+yd8f0yZi5dqhffQqkLDkFNg275CdcBt57r
	 P46/Q8MJggBoVrUATbN4yQz/1RNVzEr4qRwDBK1qefHMrZA7rRP2hz2qDSVWQ0iS7S
	 DGy5cZpbTLZ4famPhxfNn0tm+T9zHJU/CGhwJumTvkSrrah3nVMcJlpks0e7mhTc4w
	 j8HKF/6RRxHmpIgigj7NLyGRrG0vXEG8EvTBOOsy4JlJy5mBhEoqFp+dHa3/mFRG69
	 4FazbdhYoc7M4C8CocEkOrWVODSNfM2PMKHWaItVyJziGeyDxLU2xd+NY5jkkGqhpC
	 h/JiXqu+FTGaw==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>,
	Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>,
	iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Jason Wang <jasowang@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v1 0/9] Remove DMA .map_page and .unmap_page callbacks
Date: Sun, 28 Sep 2025 18:02:20 +0300
Message-ID: <cover.1759071169.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Changelog:
v1:
 * Fixed wrong offset in alpha conversion patch.
v0: https://lore.kernel.org/all/cover.1758219786.git.leon@kernel.org

Hi,

This series continues following two series:
1. "dma-mapping: migrate to physical address-based API"
https://lore.kernel.org/all/cover.1757423202.git.leonro@nvidia.com
2. "Preparation to .map_page and .unmap_page removal"
Preparation to .map_page and .unmap_page removal

In this series, the DMA .map_page/.unmap_page callbacks are converted to newly
introduced .map_phys/.unmap_phys interfaces. This conversion allows us to reduce
or eliminate (for certain ARCHs) use of struct pages in DMA path.

Thanks

Leon Romanovsky (9):
  alpha: Convert mapping routine to rely on physical address
  MIPS/jazzdma: Provide physical address directly
  parisc: Convert DMA map_page to map_phys interface
  powerpc: Convert to physical address DMA mapping
  sparc64: Use physical address DMA mapping
  x86: Use physical address for DMA mapping
  vdpa: Convert to physical address DMA mapping
  xen: swiotlb: Convert mapping routine to rely on physical address
  dma-mapping: remove unused map_page callback

 arch/alpha/kernel/pci_iommu.c            | 48 +++++++++++-------------
 arch/mips/jazz/jazzdma.c                 | 20 ++++++----
 arch/powerpc/include/asm/iommu.h         |  8 ++--
 arch/powerpc/kernel/dma-iommu.c          | 22 +++++------
 arch/powerpc/kernel/iommu.c              | 14 +++----
 arch/powerpc/platforms/ps3/system-bus.c  | 33 +++++++++-------
 arch/powerpc/platforms/pseries/ibmebus.c | 15 ++++----
 arch/powerpc/platforms/pseries/vio.c     | 21 ++++++-----
 arch/sparc/kernel/iommu.c                | 16 ++++----
 arch/sparc/kernel/pci_sun4v.c            | 16 ++++----
 arch/sparc/mm/io-unit.c                  | 13 +++----
 arch/sparc/mm/iommu.c                    | 46 ++++++++++++-----------
 arch/x86/kernel/amd_gart_64.c            | 19 +++++-----
 drivers/parisc/ccio-dma.c                | 25 ++++++------
 drivers/parisc/sba_iommu.c               | 23 ++++++------
 drivers/vdpa/vdpa_user/iova_domain.c     | 11 +++---
 drivers/vdpa/vdpa_user/iova_domain.h     |  8 ++--
 drivers/vdpa/vdpa_user/vduse_dev.c       | 18 +++++----
 drivers/xen/grant-dma-ops.c              | 20 ++++++----
 include/linux/dma-map-ops.h              |  7 ----
 kernel/dma/mapping.c                     | 12 ------
 kernel/dma/ops_helpers.c                 |  8 +---
 22 files changed, 209 insertions(+), 214 deletions(-)

-- 
2.51.0


