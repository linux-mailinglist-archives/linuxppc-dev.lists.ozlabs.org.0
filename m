Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 157802FF1F5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 18:31:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DM8Zb4qyXzDrSg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 04:31:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DM8X53mc9zDrBB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 04:29:23 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B74E611B3;
 Thu, 21 Jan 2021 09:29:20 -0800 (PST)
Received: from [10.57.39.58] (unknown [10.57.39.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13E233F66E;
 Thu, 21 Jan 2021 09:29:14 -0800 (PST)
Subject: Re: [RFC PATCH v3 5/6] dt-bindings: of: Add restricted DMA pool
To: Rob Herring <robh@kernel.org>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-6-tientzu@chromium.org>
 <20210120165348.GA220770@robh.at.kernel.org>
 <313f8052-a591-75de-c4c2-ee9ea8f02e7f@arm.com>
 <CAL_JsqKjTqcCbCLksRbCh7=f-A3Y09A3jNqtUApaA+p=RKd_Eg@mail.gmail.com>
 <c0d631de-8840-4f6e-aebf-41bb8449f78c@arm.com>
 <CAL_JsqLv-FaiY_k+wS=iXG5AtccsXSBtvTfEGHvsN-VNqXdwpA@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <1a570c5c-e0da-7d86-4384-4a4c50193c94@arm.com>
Date: Thu, 21 Jan 2021 17:29:13 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLv-FaiY_k+wS=iXG5AtccsXSBtvTfEGHvsN-VNqXdwpA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Grant Likely <grant.likely@arm.com>,
 Paul Mackerras <paulus@samba.org>, Frank Rowand <frowand.list@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Joerg Roedel <joro@8bytes.org>,
 "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Claire Chang <tientzu@chromium.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Juergen Gross <jgross@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-01-21 15:48, Rob Herring wrote:
> On Wed, Jan 20, 2021 at 7:10 PM Robin Murphy <robin.murphy@arm.com>
> wrote:
>> 
>> On 2021-01-20 21:31, Rob Herring wrote:
>>> On Wed, Jan 20, 2021 at 11:30 AM Robin Murphy
>>> <robin.murphy@arm.com> wrote:
>>>> 
>>>> On 2021-01-20 16:53, Rob Herring wrote:
>>>>> On Wed, Jan 06, 2021 at 11:41:23AM +0800, Claire Chang
>>>>> wrote:
>>>>>> Introduce the new compatible string, restricted-dma-pool,
>>>>>> for restricted DMA. One can specify the address and length
>>>>>> of the restricted DMA memory region by restricted-dma-pool
>>>>>> in the device tree.
>>>>> 
>>>>> If this goes into DT, I think we should be able to use
>>>>> dma-ranges for this purpose instead. Normally, 'dma-ranges'
>>>>> is for physical bus restrictions, but there's no reason it
>>>>> can't be used for policy or to express restrictions the
>>>>> firmware has enabled.
>>>> 
>>>> There would still need to be some way to tell SWIOTLB to pick
>>>> up the corresponding chunk of memory and to prevent the kernel
>>>> from using it for anything else, though.
>>> 
>>> Don't we already have that problem if dma-ranges had a very
>>> small range? We just get lucky because the restriction is
>>> generally much more RAM than needed.
>> 
>> Not really - if a device has a naturally tiny addressing capability
>> that doesn't even cover ZONE_DMA32 where the regular SWIOTLB buffer
>> will be allocated then it's unlikely to work well, but that's just
>> crap system design. Yes, memory pressure in ZONE_DMA{32} is
>> particularly problematic for such limited devices, but it's
>> irrelevant to the issue at hand here.
> 
> Yesterday's crap system design is today's security feature. Couldn't 
> this feature make crap system design work better?

Indeed! Say you bring out your shiny new "Strawberry Flan 4" machine
with all the latest connectivity, but tragically its PCIe can only
address 25% of the RAM. So you decide to support deploying it in two
configurations: one where it runs normally for best performance, and
another "secure" one where it dedicates that quarter of RAM as a 
restricted DMA pool for any PCIe devices - that way, even if that hotel 
projector you plug in turns out to be a rogue Thunderbolt endpoint, it 
can never snarf your private keys off your eMMC out of the page cache.

(Yes, is is the thinnest of strawmen, but it sets the scene for the 
point you raised...)

...which is that in both cases the dma-ranges will still be identical. 
So how is the kernel going to know whether to steal that whole area from 
memblock before anything else can allocate from it, or not?

I don't disagree that even in Claire's original intended case it would 
be semantically correct to describe the hardware-firewalled region with 
dma-ranges. It just turns out not to be necessary, and you're already 
arguing for not adding anything in DT that doesn't need to be.

>> What we have here is a device that's not allowed to see *kernel*
>> memory at all. It's been artificially constrained to a particular
>> region by a TZASC or similar, and the only data which should ever
>> be placed in that
> 
> May have been constrained, but that's entirely optional.
> 
> In the optional case where the setup is entirely up to the OS, I
> don't think this belongs in the DT at all. Perhaps that should be
> solved first.

Yes! Let's definitely consider that case! Say you don't have any 
security or physical limitations but want to use a bounce pool for some 
device anyway because reasons (perhaps copying streaming DMA data to a 
better guaranteed alignment gives an overall performance win). Now the 
*only* relevant thing to communicate to the kernel is to, ahem, reserve 
a large chunk of memory, and use it for this special purpose. Isn't that 
literally what reserved-memory bindings are for?

>> region is data intended for that device to see. That way if it
>> tries to go rogue it physically can't start slurping data intended
>> for other devices or not mapped for DMA at all. The bouncing is an
>> important part of this - I forget the title off-hand but there was
>> an interesting paper a few years ago which demonstrated that even
>> with an IOMMU, streaming DMA of in-place buffers could reveal
>> enough adjacent data from the same page to mount an attack on the
>> system. Memory pressure should be immaterial since the size of each
>> bounce pool carveout will presumably be tuned for the needs of the
>> given device.
>> 
>>> In any case, wouldn't finding all the dma-ranges do this? We're 
>>> already walking the tree to find the max DMA address now.
>> 
>> If all you can see are two "dma-ranges" properties, how do you
>> propose to tell that one means "this is the extent of what I can
>> address, please set my masks and dma-range-map accordingly and try
>> to allocate things where I can reach them" while the other means
>> "take this output range away from the page allocator and hook it up
>> as my dedicated bounce pool, because it is Serious Security Time"?
>> Especially since getting that choice wrong either way would be a
>> Bad Thing.
> 
> Either we have some heuristic based on the size or we add some hint. 
> The point is let's build on what we already have for defining DMA 
> accessible memory in DT rather than some parallel mechanism.

The point I'm trying to bang home is that it's really not about the DMA 
accessibility, it's about the purpose of the memory itself. Even when 
DMA accessibility *is* relevant it's already implied by that purpose, 
from the point of view of the implementation. The only difference it 
might make is to the end user if they want to ascertain whether the 
presence of such a pool represents protection against an untrusted 
device or just some DMA optimisation tweak.

Robin.
