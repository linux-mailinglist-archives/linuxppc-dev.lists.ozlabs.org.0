Return-Path: <linuxppc-dev+bounces-11948-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE971B4FCC3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 15:28:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLl516wMNz30Lt;
	Tue,  9 Sep 2025 23:28:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757424501;
	cv=none; b=VuukYZrf+rywYyLkJhEbBinwDf8tQ9Gbt3TnDsFycnB/WLC/kBJehaNSfV0BlU+bLsudq168ZAjHbmWUNhOiGvAA/DVQlWABk6YLRVfdn8XbktTBL0mTOrXnHNXjkUbK8CyDcyRFJJzTjJ781aY22VZ+jjYBcNqq1Fa2Qz/+TmQP7v/AuPNDuKrDJ9bpa9ll24yLTpVNuf74GWJ9/EtY4/dRowateF6DL8/RCQ2m/j+fdZkjWUQopTS8d5/SE1bYi4wRjZbgvqkqaTMzhJzBR5h354DHNEjOHo6EGfHOHD8/qIUTyIz77Z1c0TpctSVjZ4QI9tg1q3mv7YtjaGJaiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757424501; c=relaxed/relaxed;
	bh=jF2Z86mm30me7y7MFS3s7L7Ykf5ztwV2i6zaG00nN3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qh+lQ9vVyRWhd4zaX5fh0P4jb4WETKI92vF4bm3mdMNY5wXQwrLFM9Z9VAn5WltY9Ssjf5EJWeyoPQG5y0Mb4T22Kp29c0xbuX8677wCFLSjD3nKVnRWUTgu24R6PkYLItg1b6fwH2FtjgGtAjF3ClMxHVH5Oeepaz5Oa7FkqRyg8hVqBXOIXW7aNw63HeDNXg0mMfY2SHY6UWQ1Zp3bCNbHSUiqDdZnP6ojrxPv8Fz4hNm8UIwMTS3TVQdN3QsJe6COmpk8FgCQcSv9dY3ZsIt8fk/RE9/78amvGW6n3iSv22rcs9tslY0DlkHdzUVLQoIJDzeYF7noO3V2G+9pXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fdb2HzRe; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fdb2HzRe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLl4y6vjTz2yxN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 23:28:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CBC5340951;
	Tue,  9 Sep 2025 13:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06301C4CEF4;
	Tue,  9 Sep 2025 13:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757424495;
	bh=4Kp6x0JSqX0slJB3ko5gRb1MmNBDdg5wnGscFkyjE2Y=;
	h=From:To:Cc:Subject:Date:From;
	b=fdb2HzReI50PZxO4MtzTlQzMUmIPNsId/eyqchj5xq6lrQ+njXuothnH6ox2KFWeg
	 Pig6E0g5m+KtNmnqkOJsk5hVZD5EzndXl5JM5PtfJqxvRhWT2nxJ8qOPZHQ2Zk5vSm
	 hjiXORu2mJvDfOxyK0zhuwFVDHho9JsG9Y1F0WD/fRg3CSXDPAUlijyJFrxE3LLi2j
	 SOfVx4izw+hJqGavvnWRCV6fQbNYft+6mURTgKfF7e8OEjs7s7bEqYTlYKR3y6ZD5D
	 USU+zYf9+5pw17PdePh0uV6Xx55Pd1LZB6owTlIpMPrDjk4SjIlxeQea0fHRhF/4jF
	 qN1Cp9bFLJoqA==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>,
	Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@redhat.com>,
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
Subject: [PATCH v6 00/16] dma-mapping: migrate to physical address-based API
Date: Tue,  9 Sep 2025 16:27:28 +0300
Message-ID: <cover.1757423202.git.leonro@nvidia.com>
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

From: Leon Romanovsky <leonro@nvidia.com>

Changelog:
v6:
 * Based on "dma-debug: don't enforce dma mapping check on noncoherent
   allocations" patch.
 * Removed some unused variables from kmsan conversion.
 * Fixed missed ! in dma check.
v5: https://lore.kernel.org/all/cover.1756822782.git.leon@kernel.org
 * Added Jason's and Keith's Reviewed-by tags
 * Fixed DMA_ATTR_MMIO check in dma_direct_map_phys
 * Jason's cleanup suggestions
v4: https://lore.kernel.org/all/cover.1755624249.git.leon@kernel.org/
 * Fixed kbuild error with mismatch in kmsan function declaration due to
   rebase error.
v3: https://lore.kernel.org/all/cover.1755193625.git.leon@kernel.org
 * Fixed typo in "cacheable" word
 * Simplified kmsan patch a lot to be simple argument refactoring
v2: https://lore.kernel.org/all/cover.1755153054.git.leon@kernel.org
 * Used commit messages and cover letter from Jason
 * Moved setting IOMMU_MMIO flag to dma_info_to_prot function
 * Micro-optimized the code
 * Rebased code on v6.17-rc1
v1: https://lore.kernel.org/all/cover.1754292567.git.leon@kernel.org
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

This series refactors the DMA mapping API to provide a phys_addr_t
based, and struct-page free, external API that can handle all the
mapping cases we want in modern systems:

 - struct page based cacheable DRAM
 - struct page MEMORY_DEVICE_PCI_P2PDMA PCI peer to peer non-cacheable
   MMIO
 - struct page-less PCI peer to peer non-cacheable MMIO
 - struct page-less "resource" MMIO

Overall this gets much closer to Matthew's long term wish for
struct-pageless IO to cacheable DRAM. The remaining primary work would
be in the mm side to allow kmap_local_pfn()/phys_to_virt() to work on
phys_addr_t without a struct page.

The general design is to remove struct page usage entirely from the
DMA API inner layers. For flows that need to have a KVA for the
physical address they can use kmap_local_pfn() or phys_to_virt(). This
isolates the struct page requirements to MM code only. Long term all
removals of struct page usage are supporting Matthew's memdesc
project which seeks to substantially transform how struct page works.

Instead make the DMA API internals work on phys_addr_t. Internally
there are still dedicated 'page' and 'resource' flows, except they are
now distinguished by a new DMA_ATTR_MMIO instead of by callchain. Both
flows use the same phys_addr_t.

When DMA_ATTR_MMIO is specified things work similar to the existing
'resource' flow. kmap_local_pfn(), phys_to_virt(), phys_to_page(),
pfn_valid(), etc are never called on the phys_addr_t. This requires
rejecting any configuration that would need swiotlb. CPU cache
flushing is not required, and avoided, as ATTR_MMIO also indicates the
address have no cacheable mappings. This effectively removes any
DMA API side requirement to have struct page when DMA_ATTR_MMIO is
used.

In the !DMA_ATTR_MMIO mode things work similarly to the 'page' flow,
except on the common path of no cache flush, no swiotlb it never
touches a struct page. When cache flushing or swiotlb copying
kmap_local_pfn()/phys_to_virt() are used to get a KVA for CPU
usage. This was already the case on the unmap side, now the map side
is symmetric.

Callers are adjusted to set DMA_ATTR_MMIO. Existing 'resource' users
must set it. The existing struct page based MEMORY_DEVICE_PCI_P2PDMA
path must also set it. This corrects some existing bugs where iommu
mappings for P2P MMIO were improperly marked IOMMU_CACHE.

Since ATTR_MMIO is made to work with all the existing DMA map entry
points, particularly dma_iova_link(), this finally allows a way to use
the new DMA API to map PCI P2P MMIO without creating struct page. The
VFIO DMABUF series demonstrates how this works. This is intended to
replace the incorrect driver use of dma_map_resource() on PCI BAR
addresses.

This series does the core code and modern flows. A followup series
will give the same treatment to the legacy dma_ops implementation.

Thanks

Leon Romanovsky (16):
  dma-mapping: introduce new DMA attribute to indicate MMIO memory
  iommu/dma: implement DMA_ATTR_MMIO for dma_iova_link().
  dma-debug: refactor to use physical addresses for page mapping
  dma-mapping: rename trace_dma_*map_page to trace_dma_*map_phys
  iommu/dma: rename iommu_dma_*map_page to iommu_dma_*map_phys
  iommu/dma: implement DMA_ATTR_MMIO for iommu_dma_(un)map_phys()
  dma-mapping: convert dma_direct_*map_page to be phys_addr_t based
  kmsan: convert kmsan_handle_dma to use physical addresses
  dma-mapping: implement DMA_ATTR_MMIO for dma_(un)map_page_attrs()
  xen: swiotlb: Open code map_resource callback
  dma-mapping: export new dma_*map_phys() interface
  mm/hmm: migrate to physical address-based DMA mapping API
  mm/hmm: properly take MMIO path
  block-dma: migrate to dma_map_phys instead of map_page
  block-dma: properly take MMIO path
  nvme-pci: unmap MMIO pages with appropriate interface

 Documentation/core-api/dma-api.rst        |   4 +-
 Documentation/core-api/dma-attributes.rst |  18 ++++
 arch/powerpc/kernel/dma-iommu.c           |   4 +-
 block/blk-mq-dma.c                        |  15 ++-
 drivers/iommu/dma-iommu.c                 |  61 ++++++------
 drivers/nvme/host/pci.c                   |  18 +++-
 drivers/virtio/virtio_ring.c              |   4 +-
 drivers/xen/swiotlb-xen.c                 |  21 +++-
 include/linux/blk-mq-dma.h                |   6 +-
 include/linux/blk_types.h                 |   2 +
 include/linux/dma-direct.h                |   2 -
 include/linux/dma-map-ops.h               |   8 +-
 include/linux/dma-mapping.h               |  33 +++++++
 include/linux/iommu-dma.h                 |  11 +--
 include/linux/kmsan.h                     |   9 +-
 include/linux/page-flags.h                |   1 +
 include/trace/events/dma.h                |   9 +-
 kernel/dma/debug.c                        |  82 ++++------------
 kernel/dma/debug.h                        |  37 ++-----
 kernel/dma/direct.c                       |  22 +----
 kernel/dma/direct.h                       |  57 +++++++----
 kernel/dma/mapping.c                      | 112 +++++++++++++---------
 kernel/dma/ops_helpers.c                  |   6 +-
 mm/hmm.c                                  |  19 ++--
 mm/kmsan/hooks.c                          |  10 +-
 rust/kernel/dma.rs                        |   3 +
 tools/virtio/linux/kmsan.h                |   2 +-
 27 files changed, 312 insertions(+), 264 deletions(-)

-- 
2.51.0


