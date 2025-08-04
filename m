Return-Path: <linuxppc-dev+bounces-10571-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56934B1A19C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 14:43:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwbnd6Yfsz3069;
	Mon,  4 Aug 2025 22:43:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754311397;
	cv=none; b=HD+31sXqtAHmf9rd9kEHjX7V7fpHNdgM8QxN6fY+RzmwK+kzg2+mz52or7NL61CkzT9KwGj9CLYzyT3gjhxob2Owhg7Bj7gXb+pJR4flKShpZFDm3ePEdMZJwW8aqm8uGQ6l2nYX4c6jmpi2JPubGY3zBl1qkFVaUniW5IGps9ShTNnHWjBNdC6c75WTyHzU83Qs1zZwsuHJrmRyM+fsN7RaylJLSP/x2ZwAADPrcb3zmzgGaTsjD1yspp+pX3qmeKWspnWkCXqQ0IEuA4i3M4p6nGc9PdtgvAmhkokcRtWSnUni/5mXN0fBF53PdO/M4u6uCjl57TzazxBE6/eMXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754311397; c=relaxed/relaxed;
	bh=9mBSq747xnxKM4OSX34hdNxsM5vfVfa6L4EsHB97MsM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CwsdeJY1dHBfYMVOLqHwh3e0lFhXY7PxD5vNN7q8i8sVOhQUFJF20+aO0qGWCZuX6BgCT6sfQdKvBNqk3JM+wOs0d75lHMJkNt6qM2j6Ng/HICj+iHdjT9JwF8NC3L11X1guoz1AB+wT5G0y/Oq1E7/xmkFWZldFZ6VaLxnY/4DlvwY7wYMGjCWcNHGzzZ5j665dcmFuGAx7cLo6H/TqU8Rqm9fcfigoAJ4Dgid0XVMeB5qO7ckFnCdDKyOOGbAFRy8+DxnDjkxmO45YQiI7mEfbTPgQUHQukuJ30GMr7KgAUQP8xTF3ZMADlk/4hOXaUrP7TZX0E6tam6IS/ZziSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ea6NngjA; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ea6NngjA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwbnc5BnHz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 22:43:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 030FAA55811;
	Mon,  4 Aug 2025 12:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73ED3C4CEE7;
	Mon,  4 Aug 2025 12:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754311393;
	bh=5JNlmVmGVDRpHLFMyx/IqEG6PVqYnGg8cLXnDHx1P9k=;
	h=From:To:Cc:Subject:Date:From;
	b=Ea6NngjAGEvyrXvmgnjdDyM3mXPSC8QQfT+nOKbotr6HcSnhW9BlM6zfns9p9k3kL
	 aHN1p5RrLF18qj2RnxxdzX8nS9REiqaWtNTzVJNCM1ShLOSb5FfV99ZaNORp06pQRf
	 K3R1pWS9saoxzj1xXJAIiMxruqRredF2Zi+OmY/oC+bQ4mzzuhWorXTUyup4qpTeuv
	 RrIC3bsvwJsKhiLKd060hGDOvjUq+dNjvySky2bOV6npAhY9wBNf0nitks6Cij982L
	 fFaJuAYxFYDUX0NP4XT5/rJMF9kRy2ZpZIT9BlCY9GVEvgTb44GAyAGaBkqZ5aGmE4
	 Sus5Is+qyLnxQ==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>,
	Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev,
	Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com,
	Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v1 00/16] dma-mapping: migrate to physical address-based API
Date: Mon,  4 Aug 2025 15:42:34 +0300
Message-ID: <cover.1754292567.git.leon@kernel.org>
X-Mailer: git-send-email 2.50.1
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Changelog:
v1:
 * Added new DMA_ATTR_MMIO attribute to indicate
   PCI_P2PDMA_MAP_THRU_HOST_BRIDGE path.
 * Rewrote dma_map_* functions to use thus new attribute
v0: https://lore.kernel.org/all/cover.1750854543.git.leon@kernel.org/
------------------------------------------------------------------------

This series refactors the DMA mapping to use physical addresses
as the primary interface instead of page+offset parameters. This
change aligns the DMA API with the underlying hardware reality where
DMA operations work with physical addresses, not page structures.

The series maintains export symbol backward compatibility by keeping
the old page-based API as wrapper functions around the new physical
address-based implementations.

Thanks

Leon Romanovsky (16):
  dma-mapping: introduce new DMA attribute to indicate MMIO memory
  iommu/dma: handle MMIO path in dma_iova_link
  dma-debug: refactor to use physical addresses for page mapping
  dma-mapping: rename trace_dma_*map_page to trace_dma_*map_phys
  iommu/dma: rename iommu_dma_*map_page to iommu_dma_*map_phys
  iommu/dma: extend iommu_dma_*map_phys API to handle MMIO memory
  dma-mapping: convert dma_direct_*map_page to be phys_addr_t based
  kmsan: convert kmsan_handle_dma to use physical addresses
  dma-mapping: handle MMIO flow in dma_map|unmap_page
  xen: swiotlb: Open code map_resource callback
  dma-mapping: export new dma_*map_phys() interface
  mm/hmm: migrate to physical address-based DMA mapping API
  mm/hmm: properly take MMIO path
  block-dma: migrate to dma_map_phys instead of map_page
  block-dma: properly take MMIO path
  nvme-pci: unmap MMIO pages with appropriate interface

 Documentation/core-api/dma-api.rst        |   4 +-
 Documentation/core-api/dma-attributes.rst |   7 ++
 arch/powerpc/kernel/dma-iommu.c           |   4 +-
 block/blk-mq-dma.c                        |  15 ++-
 drivers/iommu/dma-iommu.c                 |  69 +++++++------
 drivers/nvme/host/pci.c                   |  18 +++-
 drivers/virtio/virtio_ring.c              |   4 +-
 drivers/xen/swiotlb-xen.c                 |  21 +++-
 include/linux/blk-mq-dma.h                |   6 +-
 include/linux/blk_types.h                 |   2 +
 include/linux/dma-direct.h                |   2 -
 include/linux/dma-map-ops.h               |   8 +-
 include/linux/dma-mapping.h               |  27 +++++
 include/linux/iommu-dma.h                 |  11 +--
 include/linux/kmsan.h                     |  12 ++-
 include/trace/events/dma.h                |   9 +-
 kernel/dma/debug.c                        |  71 ++++---------
 kernel/dma/debug.h                        |  37 ++-----
 kernel/dma/direct.c                       |  22 +----
 kernel/dma/direct.h                       |  50 ++++++----
 kernel/dma/mapping.c                      | 115 +++++++++++++---------
 kernel/dma/ops_helpers.c                  |   6 +-
 mm/hmm.c                                  |  19 ++--
 mm/kmsan/hooks.c                          |  36 +++++--
 rust/kernel/dma.rs                        |   3 +
 tools/virtio/linux/kmsan.h                |   2 +-
 26 files changed, 320 insertions(+), 260 deletions(-)

-- 
2.50.1


