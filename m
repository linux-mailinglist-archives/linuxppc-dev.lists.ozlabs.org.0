Return-Path: <linuxppc-dev+bounces-10452-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA52B15F20
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 13:12:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsV0t68yHz30Vq;
	Wed, 30 Jul 2025 21:12:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753873934;
	cv=none; b=GxXsKMbO7xha0ZrTe13OT88p+rOtBGQJr3GvzoLltEenNpmBtOMiTbDW0eJbQ0gIMVnlq9etXt48JKf6qHDJ0YijMWEYjdqas7TvrTyzHqTvGXJMo8D4Sw/zQ15qg5DXfTce3u1vatErTj7fbfB/PbcflVal81onJKLSBwKiMpyJ61+FKsIy6SZ/S9eaLTvM/NgvLCYK+2eHFA64USnmI+2d5PiFcblWmBRsSsTwTw0hh42v362InggjblEQK/DDfWr5M+nVNPz7b0ISY4rh9I5ExgSRiJKWvVNgjRwlG8l8+DzDOnd/57UDcQ9cIpD2hcNg2jEKFNw2SiTu2EZNow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753873934; c=relaxed/relaxed;
	bh=tTgLyvTZgN5Rt8Z+AwFysB1xxPIwzHY5WQRBxQh+D0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQ8JKGUOk2ka8vhNZadDY8xQTV55oYW3JqfVFVh2TyfcjOgfys5ONZjVMl7A06+wq+uPNPpHHXpbT/YS7iSHRTf/3yKu/Yvzw0lqYWRjpPOIgS33P45GYWuUX9ddKjR0s0w+uRbWQxcRvsM9QuSirXNyz5KWtOvP6Kl47RuA7b5lkhtmBNR6hckWtt34CkN2A3FF0ek3ZhqH2PifkG/q/kF7X3jiOwZcC/Q8CQaTlU8HN0QZT1gSW0HHz9EK8RbHOMIAd9kLl1szaZNlPVKmNYkrYLqf6jm5mmyUG6GSEB8LERmEzzUc4ouATtHDIydwTd5GW/cPFQYfBMnPtAHqDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsV0s51q1z3091
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 21:12:11 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E047C1E5E;
	Wed, 30 Jul 2025 04:11:30 -0700 (PDT)
Received: from [10.57.3.116] (unknown [10.57.3.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E3A73F673;
	Wed, 30 Jul 2025 04:11:34 -0700 (PDT)
Message-ID: <f912c446-1ae9-4390-9c11-00dce7bf0fd3@arm.com>
Date: Wed, 30 Jul 2025 12:11:32 +0100
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
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leon@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
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
 linux-mm@kvack.org, Jason Gunthorpe <jgg@ziepe.ca>
References: <CGME20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf@eucas1p2.samsung.com>
 <cover.1750854543.git.leon@kernel.org>
 <35df6f2a-0010-41fe-b490-f52693fe4778@samsung.com>
 <20250627170213.GL17401@unreal> <20250630133839.GA26981@lst.de>
 <69b177dc-c149-40d3-bbde-3f6bad0efd0e@samsung.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <69b177dc-c149-40d3-bbde-3f6bad0efd0e@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-07-08 11:27 am, Marek Szyprowski wrote:
> On 30.06.2025 15:38, Christoph Hellwig wrote:
>> On Fri, Jun 27, 2025 at 08:02:13PM +0300, Leon Romanovsky wrote:
>>>> Thanks for this rework! I assume that the next step is to add map_phys
>>>> callback also to the dma_map_ops and teach various dma-mapping providers
>>>> to use it to avoid more phys-to-page-to-phys conversions.
>>> Probably Christoph will say yes, however I personally don't see any
>>> benefit in this. Maybe I wrong here, but all existing .map_page()
>>> implementation platforms don't support p2p anyway. They won't benefit
>>> from this such conversion.
>> I think that conversion should eventually happen, and rather sooner than
>> later.
> 
> Agreed.
> 
> Applied patches 1-7 to my dma-mapping-next branch. Let me know if one
> needs a stable branch with it.

As the maintainer of iommu-dma, please drop the iommu-dma patch because 
it is broken. It does not in any way remove the struct page dependency 
from iommu-dma, it merely hides it so things can crash more easily in 
circumstances that clearly nobody's bothered to test.

> Leon, it would be great if You could also prepare an incremental patch
> adding map_phys callback to the dma_maps_ops, so the individual
> arch-specific dma-mapping providers can be then converted (or simplified
> in many cases) too.

Marek, I'm surprised that even you aren't seeing why that would at best 
be pointless churn. The fundamental design of dma_map_page() operating 
on struct page is that it sits in between alloc_pages() at the caller 
and kmap_atomic() deep down in the DMA API implementation (which also 
subsumes any dependencies on having a kernel virtual address at the 
implementation end). The natural working unit for whatever replaces 
dma_map_page() will be whatever the replacement for alloc_pages() 
returns, and the replacement for kmap_atomic() operates on. Until that 
exists (and I simply cannot believe it would be an unadorned physical 
address) there cannot be any *meaningful* progress made towards removing 
the struct page dependency from the DMA API. If there is also a goal to 
kill off highmem before then, then logically we should just wait for 
that to land, then revert back to dma_map_single() being the first-class 
interface, and dma_map_page() can turn into a trivial page_to_virt() 
wrapper for the long tail of caller conversions.

Simply obfuscating the struct page dependency today by dressing it up as 
a phys_addr_t with implicit baggage is not not in any way helpful. It 
only makes the code harder to understand and more bug-prone. Despite the 
disingenuous claims, it is quite blatantly the opposite of "efficient" 
for callers to do extra work to throw away useful information with 
page_to_phys(), and the implementation then have to re-derive that 
information with pfn_valid()/phys_to_page().

And by "bug-prone" I also include greater distractions like this 
misguided idea that the same API could somehow work for non-memory 
addresses too, so then everyone can move on bikeshedding VFIO while 
overlooking the fundamental flaws in the whole premise. I mean, besides 
all the issues I've already pointed out in that regard, not least the 
glaring fact that it's literally just a worse version of *an API we 
already have*, as DMA API maintainer do you *really* approve of a design 
that depends on callers abusing DMA_ATTR_SKIP_CPU_SYNC, yet will still 
readily blow up if they did then call a dma_sync op?

Thanks,
Robin.

