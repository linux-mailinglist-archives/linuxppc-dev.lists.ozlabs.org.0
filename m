Return-Path: <linuxppc-dev+bounces-11600-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC73B3F0B0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 23:48:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cG2Yd0FHvz2yqq;
	Tue,  2 Sep 2025 07:48:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756763300;
	cv=none; b=cth2x+JQNsZ9UUR3zzykdDOU2GT8Q5ph91foBU1oHWeiHuxP20LBX3Y3vVyJLORax9O05/7HWNapA0Ne4C6vUGUNRa0i+IfcNc29BcidzABBgAOYv5uwhhlOcibxdrLbmnsRSkOXd6xpdNitBhLEj2+aZ7+3ZHu159QjZxSBl2ZJHi4ydF80mHPBTjiBXRP8z94FZPcX3eihqmYNQ7QBh30RF6GZgL1Y+LnodEQiUH0CdoPT6ZoczPyK8seg7IwvtWkuZ4OApyKZYVgFQqbDC2IxTSwL9a8i2jr3nVOZsqv304lNWbFxCngFJC0uONKK25juRgPs4fvpOOkTJKuFag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756763300; c=relaxed/relaxed;
	bh=nDcHitW6y2xbmXlK2jIcbndjdtco2y22djXFkarI+Kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=YsW8N5/5WQjQWg8uCZHSpPR2sIeyOqo+FC8WpERiwLRCMxJYIiyfj6nD0+NjttTPkWBliEUuOX6JLB0tGTzZrdAH7zIAnUja6K4aoYNL3jkR5pvO1G3eLLSOITr3refHI2vJXo17E/qjjRR4j8T/y8uAyJxDYzGiyOqOk/GM7LzpS5Gf7vFhsEoVCKY+MLltnuTA0vlEnuZQH5vuZmwkN/nBQ0Ns4B8rsUsNzIkiEfFWQDHXBbB+WOlmCQl3LM1yVO8Pvzam8jbLFhSOdA8tHxLNEFV34qxcrkg736KmDDVau0rGR/OSzgZs7EztvYRSCGYrTcaOTSwZk1oGaMjDzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com; dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=FxjRf7+C; dkim-atps=neutral; spf=pass (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org) smtp.mailfrom=samsung.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=FxjRf7+C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cG2YX1bbcz2yqh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 07:48:15 +1000 (AEST)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250901214803euoutp02d79d0cf4cda6546a5817575ed420314a~hRuYkNP0O2070420704euoutp02b;
	Mon,  1 Sep 2025 21:48:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250901214803euoutp02d79d0cf4cda6546a5817575ed420314a~hRuYkNP0O2070420704euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756763283;
	bh=nDcHitW6y2xbmXlK2jIcbndjdtco2y22djXFkarI+Kk=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=FxjRf7+Ccpl7snsYCn9LacCiGJXvASl2Bcyshcc3MWcU7wbky050oQOcx4xKJlMqc
	 EH1xZePjtKif6niNm/ZZNmDVZoJ/hrllrH2T7muDX2gjk12tpAmaQkZRCflGuSDB6/
	 tvmSX006Ss83xwBwmshU6YU5Q3rwG2epCzq8Yjqg=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250901214802eucas1p2e3b4b360d054bc640a8654e364047c28~hRuXfQpr52428424284eucas1p2C;
	Mon,  1 Sep 2025 21:48:02 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250901214759eusmtip26af756ba90f133971e3a66f9c5275b48~hRuUiYUac1463914639eusmtip2j;
	Mon,  1 Sep 2025 21:47:59 +0000 (GMT)
Message-ID: <26bd901a-0812-492d-9736-4a7bb2e6d6b4@samsung.com>
Date: Mon, 1 Sep 2025 23:47:59 +0200
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
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 00/16] dma-mapping: migrate to physical address-based
 API
To: Leon Romanovsky <leon@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Abdiel Janulgue
	<abdiel.janulgue@gmail.com>, Alexander Potapenko <glider@google.com>, Alex
	Gaynor <alex.gaynor@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>, Jens Axboe
	<axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>, Jonathan Corbet
	<corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Michael
	Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>, Miguel
	Ojeda <ojeda@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	rust-for-linux@vger.kernel.org, Sagi Grimberg <sagi@grimberg.me>, Stefano
	Stabellini <sstabellini@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250828115729.GA10073@unreal>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250901214802eucas1p2e3b4b360d054bc640a8654e364047c28
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250828115738eucas1p24f3c17326b318c95a5569a2c9651ff92
X-EPHeader: CA
X-CMS-RootMailID: 20250828115738eucas1p24f3c17326b318c95a5569a2c9651ff92
References: <cover.1755624249.git.leon@kernel.org>
	<CGME20250828115738eucas1p24f3c17326b318c95a5569a2c9651ff92@eucas1p2.samsung.com>
	<20250828115729.GA10073@unreal>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 28.08.2025 13:57, Leon Romanovsky wrote:
> On Tue, Aug 19, 2025 at 08:36:44PM +0300, Leon Romanovsky wrote:
>> Changelog:
>> v4:
>>   * Fixed kbuild error with mismatch in kmsan function declaration due to
>>     rebase error.
>> v3: https://lore.kernel.org/all/cover.1755193625.git.leon@kernel.org
>>   * Fixed typo in "cacheable" word
>>   * Simplified kmsan patch a lot to be simple argument refactoring
>> v2: https://lore.kernel.org/all/cover.1755153054.git.leon@kernel.org
>>   * Used commit messages and cover letter from Jason
>>   * Moved setting IOMMU_MMIO flag to dma_info_to_prot function
>>   * Micro-optimized the code
>>   * Rebased code on v6.17-rc1
>> v1: https://lore.kernel.org/all/cover.1754292567.git.leon@kernel.org
>>   * Added new DMA_ATTR_MMIO attribute to indicate
>>     PCI_P2PDMA_MAP_THRU_HOST_BRIDGE path.
>>   * Rewrote dma_map_* functions to use thus new attribute
>> v0: https://lore.kernel.org/all/cover.1750854543.git.leon@kernel.org/
>> ------------------------------------------------------------------------
>>
>> This series refactors the DMA mapping to use physical addresses
>> as the primary interface instead of page+offset parameters. This
>> change aligns the DMA API with the underlying hardware reality where
>> DMA operations work with physical addresses, not page structures.
>>
>> The series maintains export symbol backward compatibility by keeping
>> the old page-based API as wrapper functions around the new physical
>> address-based implementations.
>>
>> This series refactors the DMA mapping API to provide a phys_addr_t
>> based, and struct-page free, external API that can handle all the
>> mapping cases we want in modern systems:
>>
>>   - struct page based cachable DRAM
>>   - struct page MEMORY_DEVICE_PCI_P2PDMA PCI peer to peer non-cachable
>>     MMIO
>>   - struct page-less PCI peer to peer non-cachable MMIO
>>   - struct page-less "resource" MMIO
>>
>> Overall this gets much closer to Matthew's long term wish for
>> struct-pageless IO to cachable DRAM. The remaining primary work would
>> be in the mm side to allow kmap_local_pfn()/phys_to_virt() to work on
>> phys_addr_t without a struct page.
>>
>> The general design is to remove struct page usage entirely from the
>> DMA API inner layers. For flows that need to have a KVA for the
>> physical address they can use kmap_local_pfn() or phys_to_virt(). This
>> isolates the struct page requirements to MM code only. Long term all
>> removals of struct page usage are supporting Matthew's memdesc
>> project which seeks to substantially transform how struct page works.
>>
>> Instead make the DMA API internals work on phys_addr_t. Internally
>> there are still dedicated 'page' and 'resource' flows, except they are
>> now distinguished by a new DMA_ATTR_MMIO instead of by callchain. Both
>> flows use the same phys_addr_t.
>>
>> When DMA_ATTR_MMIO is specified things work similar to the existing
>> 'resource' flow. kmap_local_pfn(), phys_to_virt(), phys_to_page(),
>> pfn_valid(), etc are never called on the phys_addr_t. This requires
>> rejecting any configuration that would need swiotlb. CPU cache
>> flushing is not required, and avoided, as ATTR_MMIO also indicates the
>> address have no cachable mappings. This effectively removes any
>> DMA API side requirement to have struct page when DMA_ATTR_MMIO is
>> used.
>>
>> In the !DMA_ATTR_MMIO mode things work similarly to the 'page' flow,
>> except on the common path of no cache flush, no swiotlb it never
>> touches a struct page. When cache flushing or swiotlb copying
>> kmap_local_pfn()/phys_to_virt() are used to get a KVA for CPU
>> usage. This was already the case on the unmap side, now the map side
>> is symmetric.
>>
>> Callers are adjusted to set DMA_ATTR_MMIO. Existing 'resource' users
>> must set it. The existing struct page based MEMORY_DEVICE_PCI_P2PDMA
>> path must also set it. This corrects some existing bugs where iommu
>> mappings for P2P MMIO were improperly marked IOMMU_CACHE.
>>
>> Since ATTR_MMIO is made to work with all the existing DMA map entry
>> points, particularly dma_iova_link(), this finally allows a way to use
>> the new DMA API to map PCI P2P MMIO without creating struct page. The
>> VFIO DMABUF series demonstrates how this works. This is intended to
>> replace the incorrect driver use of dma_map_resource() on PCI BAR
>> addresses.
>>
>> This series does the core code and modern flows. A followup series
>> will give the same treatment to the legacy dma_ops implementation.
>>
>> Thanks
>>
>> Leon Romanovsky (16):
>>    dma-mapping: introduce new DMA attribute to indicate MMIO memory
>>    iommu/dma: implement DMA_ATTR_MMIO for dma_iova_link().
>>    dma-debug: refactor to use physical addresses for page mapping
>>    dma-mapping: rename trace_dma_*map_page to trace_dma_*map_phys
>>    iommu/dma: rename iommu_dma_*map_page to iommu_dma_*map_phys
>>    iommu/dma: extend iommu_dma_*map_phys API to handle MMIO memory
>>    dma-mapping: convert dma_direct_*map_page to be phys_addr_t based
>>    kmsan: convert kmsan_handle_dma to use physical addresses
>>    dma-mapping: handle MMIO flow in dma_map|unmap_page
>>    xen: swiotlb: Open code map_resource callback
>>    dma-mapping: export new dma_*map_phys() interface
>>    mm/hmm: migrate to physical address-based DMA mapping API
>>    mm/hmm: properly take MMIO path
>>    block-dma: migrate to dma_map_phys instead of map_page
>>    block-dma: properly take MMIO path
>>    nvme-pci: unmap MMIO pages with appropriate interface
>>
>>   Documentation/core-api/dma-api.rst        |   4 +-
>>   Documentation/core-api/dma-attributes.rst |  18 ++++
>>   arch/powerpc/kernel/dma-iommu.c           |   4 +-
>>   block/blk-mq-dma.c                        |  15 ++-
>>   drivers/iommu/dma-iommu.c                 |  61 +++++------
>>   drivers/nvme/host/pci.c                   |  18 +++-
>>   drivers/virtio/virtio_ring.c              |   4 +-
>>   drivers/xen/swiotlb-xen.c                 |  21 +++-
>>   include/linux/blk-mq-dma.h                |   6 +-
>>   include/linux/blk_types.h                 |   2 +
>>   include/linux/dma-direct.h                |   2 -
>>   include/linux/dma-map-ops.h               |   8 +-
>>   include/linux/dma-mapping.h               |  33 ++++++
>>   include/linux/iommu-dma.h                 |  11 +-
>>   include/linux/kmsan.h                     |   9 +-
>>   include/trace/events/dma.h                |   9 +-
>>   kernel/dma/debug.c                        |  71 ++++---------
>>   kernel/dma/debug.h                        |  37 ++-----
>>   kernel/dma/direct.c                       |  22 +---
>>   kernel/dma/direct.h                       |  52 ++++++----
>>   kernel/dma/mapping.c                      | 117 +++++++++++++---------
>>   kernel/dma/ops_helpers.c                  |   6 +-
>>   mm/hmm.c                                  |  19 ++--
>>   mm/kmsan/hooks.c                          |   5 +-
>>   rust/kernel/dma.rs                        |   3 +
>>   tools/virtio/linux/kmsan.h                |   2 +-
>>   26 files changed, 305 insertions(+), 254 deletions(-)
> Marek,
>
> So what are the next steps here? This series is pre-requirement for the
> VFIO MMIO patches.

I waited a bit with a hope to get a comment from Robin. It looks that 
there is no other alternative for the phys addr in the struct page 
removal process.

I would like to give those patches a try in linux-next, but in meantime 
I tested it on my test farm and found a regression in dma_map_resource() 
handling. Namely the dma_map_resource() is no longer possible with size 
not aligned to kmalloc()'ed buffer, as dma_direct_map_phys() calls 
dma_kmalloc_needs_bounce(), which in turn calls 
dma_kmalloc_size_aligned(). It looks that the check for !(attrs & 
DMA_ATTR_MMIO) should be moved one level up in dma_direct_map_phys(). 
Here is the log:

------------[ cut here ]------------
dma-pl330 fe550000.dma-controller: DMA addr 0x00000000fe410024+4 
overflow (mask ffffffff, bus limit 0).
WARNING: kernel/dma/direct.h:116 at dma_map_phys+0x3a4/0x3ec, CPU#1: 
speaker-test/405
Modules linked in: ...
CPU: 1 UID: 0 PID: 405 Comm: speaker-test Not tainted 
6.17.0-rc4-next-20250901+ #10958 PREEMPT
Hardware name: Hardkernel ODROID-M1 (DT)
pstate: 604000c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : dma_map_phys+0x3a4/0x3ec
lr : dma_map_phys+0x3a4/0x3ec
...
Call trace:
  dma_map_phys+0x3a4/0x3ec (P)
  dma_map_resource+0x14/0x20
  pl330_prep_slave_fifo+0x78/0xd0
  pl330_prep_dma_cyclic+0x70/0x2b0
  snd_dmaengine_pcm_trigger+0xec/0x8bc [snd_pcm_dmaengine]
  dmaengine_pcm_trigger+0x18/0x24 [snd_soc_core]
  snd_soc_pcm_component_trigger+0x164/0x208 [snd_soc_core]
  soc_pcm_trigger+0xe4/0x1ec [snd_soc_core]
  snd_pcm_do_start+0x44/0x70 [snd_pcm]
  snd_pcm_action_single+0x48/0xa4 [snd_pcm]
  snd_pcm_action+0x7c/0x98 [snd_pcm]
  snd_pcm_action_lock_irq+0x48/0xb4 [snd_pcm]
  snd_pcm_common_ioctl+0xf00/0x1f1c [snd_pcm]
  snd_pcm_ioctl+0x30/0x48 [snd_pcm]
  __arm64_sys_ioctl+0xac/0x104
  invoke_syscall+0x48/0x110
  el0_svc_common.constprop.0+0x40/0xe8
  do_el0_svc+0x20/0x2c
  el0_svc+0x4c/0x160
  el0t_64_sync_handler+0xa0/0xe4
  el0t_64_sync+0x198/0x19c
irq event stamp: 6596
hardirqs last  enabled at (6595): [<ffff800081344624>] 
_raw_spin_unlock_irqrestore+0x74/0x78
hardirqs last disabled at (6596): [<ffff8000813439b0>] 
_raw_spin_lock_irq+0x78/0x7c
softirqs last  enabled at (6076): [<ffff8000800c2294>] 
handle_softirqs+0x4c4/0x4dc
softirqs last disabled at (6071): [<ffff800080010690>] 
__do_softirq+0x14/0x20
---[ end trace 0000000000000000 ]---
rockchip-i2s-tdm fe410000.i2s: ASoC error (-12): at 
soc_component_trigger() on fe410000.i2s

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


