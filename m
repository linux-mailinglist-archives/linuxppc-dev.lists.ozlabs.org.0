Return-Path: <linuxppc-dev+bounces-11036-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA92B26F9E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 21:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2w7T3kh0z3bTf;
	Fri, 15 Aug 2025 05:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755199237;
	cv=none; b=gQezbtaarJdGYM2PO4FP/HNHJ+tdyF5wVNrIAxEiYpd9iR19j/WKB1+jomJy/VcZL7hh3KgXwisupF5eOD/GpYJVHFWFNsnfInvJBOE/cil6pW+oGwM2nu0MTYBCeRPnrLSPiRXZJU0mT472tVVuFmYGYDgfNiiifTKPWJw5SoG7O5WQ14VoKYgtu8z04gKpfgjYu21YZmzZatzrKaLjuHpCHvioQPc101jq0GP//coHK01lVr9dzD9llsfHOSvPu4011M2Sg71SpApIUnTlgSKlCaR6/nc3BRu6N+fTvZQ8FLBfRKcRRJWioZmOmpzb8fzk8W6aJZ4ZDVeHfmKgqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755199237; c=relaxed/relaxed;
	bh=YHyGC2tklvgN0REkQ0ldTWNmLFHcFMgQsr/26aDn6pU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xwwidmj47knMA1obVSIt/kGo4Cjui49ufnVo7QNoET1zNL00P+yL9QBuYpgOA1DwSLnsx+gGw0vtt34xOrcdnPiyI5TB6QqpsX6ZP6InFuONGXjdptiRU5XywnZEZefoDljtrUmIBQEP4cGpTPbXTBE4+yIU2lW7zGF6hP1/j9eppzfwBR9GyIg407r1KnrsKHZfiiYjLb/mdWytTAqo3xGOx+PaQoEsnZ+qcWk6IuEvVq1h1fdpg+3ZdP464EgLP2au59714b8QJBeTRNeFJZf+p1kOLC8/VfRjQfnztXPX/MXf5oAbhCSLMFa8ca/IImbNtrCDPuSXKJoXs5S5zQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2w7S40kZz30Yb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 05:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c2vpK65M9z9sSH;
	Thu, 14 Aug 2025 21:05:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZPu83EvDtL2B; Thu, 14 Aug 2025 21:05:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c2vpK3P9dz9sSC;
	Thu, 14 Aug 2025 21:05:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 16AD08B764;
	Thu, 14 Aug 2025 21:05:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id v81OkG88qzZ0; Thu, 14 Aug 2025 21:05:44 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 592BF8B763;
	Thu, 14 Aug 2025 21:05:43 +0200 (CEST)
Message-ID: <ccc8eeba-757a-440d-80d3-9158e80c19fe@csgroup.eu>
Date: Thu, 14 Aug 2025 21:05:42 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/16] dma-mapping: migrate to physical address-based
 API
To: Leon Romanovsky <leon@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Alexander Potapenko <glider@google.com>, Alex Gaynor
 <alex.gaynor@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
 iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
 Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
 Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
 kasan-dev@googlegroups.com, Keith Busch <kbusch@kernel.org>,
 linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-trace-kernel@vger.kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin"
 <mst@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
 Sagi Grimberg <sagi@grimberg.me>, Stefano Stabellini
 <sstabellini@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1755193625.git.leon@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <cover.1755193625.git.leon@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 14/08/2025 à 19:53, Leon Romanovsky a écrit :
> Changelog:
> v3:
>   * Fixed typo in "cacheable" word
>   * Simplified kmsan patch a lot to be simple argument refactoring

v2 sent today at 12:13, v3 sent today at 19:53 .... for only that ?

Have you read 
https://docs.kernel.org//process/submitting-patches.html#don-t-get-discouraged-or-impatient 
?

Thanks
Christophe

> v2: https://lore.kernel.org/all/cover.1755153054.git.leon@kernel.org
>   * Used commit messages and cover letter from Jason
>   * Moved setting IOMMU_MMIO flag to dma_info_to_prot function
>   * Micro-optimized the code
>   * Rebased code on v6.17-rc1
> v1: https://lore.kernel.org/all/cover.1754292567.git.leon@kernel.org
>   * Added new DMA_ATTR_MMIO attribute to indicate
>     PCI_P2PDMA_MAP_THRU_HOST_BRIDGE path.
>   * Rewrote dma_map_* functions to use thus new attribute
> v0: https://lore.kernel.org/all/cover.1750854543.git.leon@kernel.org/
> ------------------------------------------------------------------------
> 
> This series refactors the DMA mapping to use physical addresses
> as the primary interface instead of page+offset parameters. This
> change aligns the DMA API with the underlying hardware reality where
> DMA operations work with physical addresses, not page structures.
> 
> The series maintains export symbol backward compatibility by keeping
> the old page-based API as wrapper functions around the new physical
> address-based implementations.
> 
> This series refactors the DMA mapping API to provide a phys_addr_t
> based, and struct-page free, external API that can handle all the
> mapping cases we want in modern systems:
> 
>   - struct page based cachable DRAM
>   - struct page MEMORY_DEVICE_PCI_P2PDMA PCI peer to peer non-cachable
>     MMIO
>   - struct page-less PCI peer to peer non-cachable MMIO
>   - struct page-less "resource" MMIO
> 
> Overall this gets much closer to Matthew's long term wish for
> struct-pageless IO to cachable DRAM. The remaining primary work would
> be in the mm side to allow kmap_local_pfn()/phys_to_virt() to work on
> phys_addr_t without a struct page.
> 
> The general design is to remove struct page usage entirely from the
> DMA API inner layers. For flows that need to have a KVA for the
> physical address they can use kmap_local_pfn() or phys_to_virt(). This
> isolates the struct page requirements to MM code only. Long term all
> removals of struct page usage are supporting Matthew's memdesc
> project which seeks to substantially transform how struct page works.
> 
> Instead make the DMA API internals work on phys_addr_t. Internally
> there are still dedicated 'page' and 'resource' flows, except they are
> now distinguished by a new DMA_ATTR_MMIO instead of by callchain. Both
> flows use the same phys_addr_t.
> 
> When DMA_ATTR_MMIO is specified things work similar to the existing
> 'resource' flow. kmap_local_pfn(), phys_to_virt(), phys_to_page(),
> pfn_valid(), etc are never called on the phys_addr_t. This requires
> rejecting any configuration that would need swiotlb. CPU cache
> flushing is not required, and avoided, as ATTR_MMIO also indicates the
> address have no cachable mappings. This effectively removes any
> DMA API side requirement to have struct page when DMA_ATTR_MMIO is
> used.
> 
> In the !DMA_ATTR_MMIO mode things work similarly to the 'page' flow,
> except on the common path of no cache flush, no swiotlb it never
> touches a struct page. When cache flushing or swiotlb copying
> kmap_local_pfn()/phys_to_virt() are used to get a KVA for CPU
> usage. This was already the case on the unmap side, now the map side
> is symmetric.
> 
> Callers are adjusted to set DMA_ATTR_MMIO. Existing 'resource' users
> must set it. The existing struct page based MEMORY_DEVICE_PCI_P2PDMA
> path must also set it. This corrects some existing bugs where iommu
> mappings for P2P MMIO were improperly marked IOMMU_CACHE.
> 
> Since ATTR_MMIO is made to work with all the existing DMA map entry
> points, particularly dma_iova_link(), this finally allows a way to use
> the new DMA API to map PCI P2P MMIO without creating struct page. The
> VFIO DMABUF series demonstrates how this works. This is intended to
> replace the incorrect driver use of dma_map_resource() on PCI BAR
> addresses.
> 
> This series does the core code and modern flows. A followup series
> will give the same treatment to the legacy dma_ops implementation.
> 
> Thanks
> 
> Leon Romanovsky (16):
>    dma-mapping: introduce new DMA attribute to indicate MMIO memory
>    iommu/dma: implement DMA_ATTR_MMIO for dma_iova_link().
>    dma-debug: refactor to use physical addresses for page mapping
>    dma-mapping: rename trace_dma_*map_page to trace_dma_*map_phys
>    iommu/dma: rename iommu_dma_*map_page to iommu_dma_*map_phys
>    iommu/dma: extend iommu_dma_*map_phys API to handle MMIO memory
>    dma-mapping: convert dma_direct_*map_page to be phys_addr_t based
>    kmsan: convert kmsan_handle_dma to use physical addresses
>    dma-mapping: handle MMIO flow in dma_map|unmap_page
>    xen: swiotlb: Open code map_resource callback
>    dma-mapping: export new dma_*map_phys() interface
>    mm/hmm: migrate to physical address-based DMA mapping API
>    mm/hmm: properly take MMIO path
>    block-dma: migrate to dma_map_phys instead of map_page
>    block-dma: properly take MMIO path
>    nvme-pci: unmap MMIO pages with appropriate interface
> 
>   Documentation/core-api/dma-api.rst        |   4 +-
>   Documentation/core-api/dma-attributes.rst |  18 ++++
>   arch/powerpc/kernel/dma-iommu.c           |   4 +-
>   block/blk-mq-dma.c                        |  15 ++-
>   drivers/iommu/dma-iommu.c                 |  61 +++++------
>   drivers/nvme/host/pci.c                   |  18 +++-
>   drivers/virtio/virtio_ring.c              |   4 +-
>   drivers/xen/swiotlb-xen.c                 |  21 +++-
>   include/linux/blk-mq-dma.h                |   6 +-
>   include/linux/blk_types.h                 |   2 +
>   include/linux/dma-direct.h                |   2 -
>   include/linux/dma-map-ops.h               |   8 +-
>   include/linux/dma-mapping.h               |  33 ++++++
>   include/linux/iommu-dma.h                 |  11 +-
>   include/linux/kmsan.h                     |   9 +-
>   include/trace/events/dma.h                |   9 +-
>   kernel/dma/debug.c                        |  71 ++++---------
>   kernel/dma/debug.h                        |  37 ++-----
>   kernel/dma/direct.c                       |  22 +---
>   kernel/dma/direct.h                       |  52 ++++++----
>   kernel/dma/mapping.c                      | 117 +++++++++++++---------
>   kernel/dma/ops_helpers.c                  |   6 +-
>   mm/hmm.c                                  |  19 ++--
>   mm/kmsan/hooks.c                          |   7 +-
>   rust/kernel/dma.rs                        |   3 +
>   tools/virtio/linux/kmsan.h                |   2 +-
>   26 files changed, 306 insertions(+), 255 deletions(-)
> 


