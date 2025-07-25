Return-Path: <linuxppc-dev+bounces-10409-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4E2B12527
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jul 2025 22:06:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bpf5Z0Rr9z3bTf;
	Sat, 26 Jul 2025 06:06:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753473986;
	cv=none; b=WDPD2/wW+4XkLa0B02FuT+2qJlyPVG/LrT7mVxmXl8z2eCSo11hyEcOpUDtAX+uJ25VpWIztwAi/vyByhTceWtAGR7d1BNTQ7echsafyE+OYK+aEmkR5WNOP/n+lmFRcz1IwyMMxxjHG1u/fNor8NWi3QctSrmz5BMvTgFOHsew1Fvy5Z1rj/pvx9hQXqlwVrF/vFzEONSeZaUXD3RkdUccpD2HliqnngpiOeA14xtwn/mirGNnWALLKCAoSPLEn/KD04DEvlXI+58m4tzQTcRFuPHqprLbNURXBJY5TfRw1VIUWUR8/o6jLkAuE8mYArGCMiPcLEkq+HxUd+sr85Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753473986; c=relaxed/relaxed;
	bh=7KxOmurkyhSp/5ecauaZ/zErl9WiG9PB8RxRwEHPPjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WjZ6LxzVN5xjBvopVvOwILMI2Vck190kcAyE9M0/Co5NtWbL60A3Exv3Wc7yFRtEFrpBQvq7WFeOf6cMFq+b3SoOaqem31YpilmqYwUzuLwRAb1tm/DCRTHHQpLPh6b55rInx3Gk1dhqhDYxqKxgB6s2l0VY/6Y7RdjJob/+XLpDGuXPtjLCCQV6AebnZGP7lqo0LlUhQHQuWY3bxA5cslHTAwhcKDHkVEN/FSpoJBzDl5oybRlIntDmnA5+yoIU5SHwvAsMSR2MIp/qQ3rA/DgOiw578o65rWMDV/nidnsxeHgxDJ3JqPpz8yyYefJdPhDqnIMTBt/HDsxl5efq0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bpf5Y25nVz30Qk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jul 2025 06:06:25 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BFC91A00;
	Fri, 25 Jul 2025 13:05:47 -0700 (PDT)
Received: from [10.57.4.83] (unknown [10.57.4.83])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A7893F6A8;
	Fri, 25 Jul 2025 13:05:48 -0700 (PDT)
Message-ID: <751e7ece-8640-4653-b308-96da6731b8e7@arm.com>
Date: Fri, 25 Jul 2025 21:05:46 +0100
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
Subject: Re: [PATCH 0/8] dma-mapping: migrate to physical address-based API
To: Leon Romanovsky <leon@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 iommu@lists.linux.dev, virtualization@lists.linux.dev,
 kasan-dev@googlegroups.com, linux-trace-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <cover.1750854543.git.leon@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <cover.1750854543.git.leon@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-06-25 2:18 pm, Leon Romanovsky wrote:
> This series refactors the DMA mapping to use physical addresses
> as the primary interface instead of page+offset parameters. This
> change aligns the DMA API with the underlying hardware reality where
> DMA operations work with physical addresses, not page structures.

That is obvious nonsense - the DMA *API* does not exist in "hardware 
reality"; the DMA API abstracts *software* operations that must be 
performed before and after the actual hardware DMA operation in order to 
preserve memory coherency etc.

Streaming DMA API callers get their buffers from alloc_pages() or 
kmalloc(); they do not have physical addresses, they have a page or 
virtual address. The internal operations of pretty much every DMA API 
implementation that isn't a no-op also require a page and/or virtual 
address. It is 100% logical for the DMA API interfaces to take a page or 
virtual address (and since virt_to_page() is pretty trivial, we already 
consolidated the two interfaces ages ago).

Yes, once you get right down to the low-level arch_sync_dma_*() 
interfaces that passes a physical address, but that's mostly an artefact 
of them being factored out of old dma_sync_single_*() implementations 
that took a (physical) DMA address. Nearly all of them then use __va() 
or phys_to_virt() to actually consume it. Even though it's a 
phys_addr_t, the implicit guarantee that it represents page-backed 
memory is absolutely vital.

Take a step back; what do you imagine that a DMA API call on a 
non-page-backed physical address could actually *do*?

- Cache maintenance? No, it would be illogical for a P2P address to be 
cached in a CPU cache, and anyway it would almost always crash because 
it requires page-backed memory with a virtual address.

- Bounce buffering? Again no, that would be illogical, defeat the entire 
point of a P2P operation, and anyway would definitely crash because it 
requires page-backed memory with a virtual address.

- IOMMU mappings? Oh hey look that's exactly what dma_map_resource() has 
been doing for 9 years. Not to mention your new IOMMU API if callers 
want to be IOMMU-aware (although without the same guarantee of not also 
doing the crashy things.)

- Debug tracking? Again, already taken care of by dma_map_resource().

- Some entirely new concept? Well, I'm eager to be enlightened if so!

But given what we do already know of from decades of experience, obvious 
question: For the tiny minority of users who know full well when they're 
dealing with a non-page-backed physical address, what's wrong with using 
dma_map_resource?

Does it make sense to try to consolidate our p2p infrastructure so 
dma_map_resource() could return bus addresses where appropriate? Yes, 
almost certainly, if it makes it more convenient to use. And with only 
about 20 users it's not too impractical to add some extra arguments or 
even rejig the whole interface if need be. Indeed an overhaul might even 
help solve the current grey area as to when it should take dma_range_map 
into account or not for platform devices.

> The series consists of 8 patches that progressively convert the DMA
> mapping infrastructure from page-based to physical address-based APIs:

And as a result ends up making said DMA mapping infrastructure slightly 
more complicated and slightly less efficient for all its legitimate 
users, all so one or two highly specialised users can then pretend to 
call it in situations where it must be a no-op anyway? Please explain 
convincingly why that is not a giant waste of time.

Are we trying to remove struct page from the kernel altogether? If yes, 
then for goodness' sake lead with that, but even then I'd still prefer 
to see the replacements for critical related infrastructure like 
pfn_valid() in place before we start trying to reshape the DMA API to fit.

Thanks,
Robin.

> The series maintains backward compatibility by keeping the old
> page-based API as wrapper functions around the new physical
> address-based implementations.
> 
> Thanks
> 
> Leon Romanovsky (8):
>    dma-debug: refactor to use physical addresses for page mapping
>    dma-mapping: rename trace_dma_*map_page to trace_dma_*map_phys
>    iommu/dma: rename iommu_dma_*map_page to iommu_dma_*map_phys
>    dma-mapping: convert dma_direct_*map_page to be phys_addr_t based
>    kmsan: convert kmsan_handle_dma to use physical addresses
>    dma-mapping: fail early if physical address is mapped through platform
>      callback
>    dma-mapping: export new dma_*map_phys() interface
>    mm/hmm: migrate to physical address-based DMA mapping API
> 
>   Documentation/core-api/dma-api.rst |  4 +-
>   arch/powerpc/kernel/dma-iommu.c    |  4 +-
>   drivers/iommu/dma-iommu.c          | 14 +++----
>   drivers/virtio/virtio_ring.c       |  4 +-
>   include/linux/dma-map-ops.h        |  8 ++--
>   include/linux/dma-mapping.h        | 13 ++++++
>   include/linux/iommu-dma.h          |  7 ++--
>   include/linux/kmsan.h              | 12 +++---
>   include/trace/events/dma.h         |  4 +-
>   kernel/dma/debug.c                 | 28 ++++++++-----
>   kernel/dma/debug.h                 | 16 ++++---
>   kernel/dma/direct.c                |  6 +--
>   kernel/dma/direct.h                | 13 +++---
>   kernel/dma/mapping.c               | 67 +++++++++++++++++++++---------
>   kernel/dma/ops_helpers.c           |  6 +--
>   mm/hmm.c                           |  8 ++--
>   mm/kmsan/hooks.c                   | 36 ++++++++++++----
>   tools/virtio/linux/kmsan.h         |  2 +-
>   18 files changed, 159 insertions(+), 93 deletions(-)
> 


