Return-Path: <linuxppc-dev+bounces-12386-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D40B86728
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 20:45:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSPhr6Lflz2yTK;
	Fri, 19 Sep 2025 04:45:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758221132;
	cv=none; b=ALZuLiyean5zAH5TDizRGHZoyXBjLuj88Up6h+yQxKpyqgerQaFaOVIglvn8Aoi86gfG8lsgfqxQSlvXrI0hPJvBue+ltIBBo1iLjigbalZibjaL17AcJLET20ob6P5zbx5t0rIYGA6VlBn139O6ySK80pGBMnBXmz+1Zd6mRuB7eUNIcgxT35lt6T+UpMWDHv8+5qvhoFGjgtynq7tv75YorE+2KpUZQASDKMwGhT2UMUskyr8OkUhmjKCVDrV7E/vwvNEXadK/WweLa7V1jR4xvk8CqMoDhtEb5ZqVEr9Ik+g9W0Mktt+rRGB4auTLLtdjoXuc8AVzFjQp+5Ia9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758221132; c=relaxed/relaxed;
	bh=ztsaU8wxrg9tNenym8pkApKXhJNw/czZZgTcR0Wk7NA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iI74afZmDLQ72BeaHxshVodXjkPAkH2AryFzz+HYUM/AtRlc1esXezyG2/7xzr9H5lRujEVl9ee8RIdzPK35w9cetNAJl3cehlfj14TOfZ09OcVwOJXlqsq8dbO0IvTUwtDMixn7KC2mexsa2vLUrP4W18ecwkpbeSiy/PPZNg81ojirJK4vtzOyMgrAhjh70YZWqvqXdtrzksF9HXkquPJkWyW89GeXLNIH6RTmGrDbmSuntuNuezKK4XWPhoGQsD6KRGDEhHTlQELNWH+NPtDukojew9A4+vQfip7ZupXokxqNkQSzCDpJY6ZvQOS0wFy5bGoCvkZhvvKU+1j+6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z28vS7zX; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z28vS7zX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSPhq6d8jz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 04:45:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A3B96021D;
	Thu, 18 Sep 2025 18:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340C7C4CEE7;
	Thu, 18 Sep 2025 18:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758221129;
	bh=u6NaIt2RygsBlCtYn4hZiQqQdifJG8iCHYQXwiLX65E=;
	h=From:To:Cc:Subject:Date:From;
	b=Z28vS7zXihUdX9isz4tKX5bJfG+N6wgA49ZsUL9MzWkxVOZIaB9CEoaGCeOdF5Wlc
	 irtxfrEkcx12CNmXSpOaxnrWSE3uyQ9BLUGMgdMwz3ZkzTrB7vIU5S+RDvQ6dKM5ki
	 RxUJdVCwUhpNByj1sxF0SK4ASPa55TnwfCGcGHPBq14Ogh8/QuEEAY6ulYXQRiCrc/
	 gKhn/kbZmmAWPpdmUgqtKeJS0PBEgSw0hZoyR9kwDh1THqWJDw1i1JuxwJQDO1Fvaa
	 tjs8Xsk56/6qq7xSDRAZoHUF6JGB7I+NLrajHOGD2OUILv6g7xC1NJVMJM9wXp6cE/
	 8ldLVQITFO98w==
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
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/9] Remove DMA .map_page and .unmap_page callbacks
Date: Thu, 18 Sep 2025 21:45:00 +0300
Message-ID: <cover.1758219786.git.leon@kernel.org>
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

 arch/alpha/kernel/pci_iommu.c            | 47 ++++++++++--------------
 arch/mips/jazz/jazzdma.c                 | 20 ++++++----
 arch/powerpc/include/asm/iommu.h         |  8 ++--
 arch/powerpc/kernel/dma-iommu.c          | 22 +++++------
 arch/powerpc/kernel/iommu.c              | 14 +++----
 arch/powerpc/platforms/ps3/system-bus.c  | 33 ++++++++++-------
 arch/powerpc/platforms/pseries/ibmebus.c | 15 ++++----
 arch/powerpc/platforms/pseries/vio.c     | 21 ++++++-----
 arch/sparc/kernel/iommu.c                | 16 ++++----
 arch/sparc/kernel/pci_sun4v.c            | 16 ++++----
 arch/sparc/mm/io-unit.c                  | 13 +++----
 arch/sparc/mm/iommu.c                    | 46 ++++++++++++-----------
 arch/x86/kernel/amd_gart_64.c            | 19 +++++-----
 drivers/parisc/ccio-dma.c                | 25 +++++++------
 drivers/parisc/sba_iommu.c               | 23 ++++++------
 drivers/vdpa/vdpa_user/iova_domain.c     | 11 +++---
 drivers/vdpa/vdpa_user/iova_domain.h     |  8 ++--
 drivers/vdpa/vdpa_user/vduse_dev.c       | 18 +++++----
 drivers/xen/grant-dma-ops.c              | 20 ++++++----
 include/linux/dma-map-ops.h              |  7 ----
 kernel/dma/mapping.c                     | 12 ------
 kernel/dma/ops_helpers.c                 |  8 +---
 22 files changed, 208 insertions(+), 214 deletions(-)

-- 
2.51.0


