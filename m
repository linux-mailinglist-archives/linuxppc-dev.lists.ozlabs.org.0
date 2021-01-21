Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2AD2FDE88
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 02:12:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLkrg0K5tzDqpH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 12:12:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DLkp952dPzDqLW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 12:10:07 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2B7B14FF;
 Wed, 20 Jan 2021 17:10:04 -0800 (PST)
Received: from [10.57.39.58] (unknown [10.57.39.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A93E3F68F;
 Wed, 20 Jan 2021 17:09:58 -0800 (PST)
Subject: Re: [RFC PATCH v3 5/6] dt-bindings: of: Add restricted DMA pool
To: Rob Herring <robh@kernel.org>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-6-tientzu@chromium.org>
 <20210120165348.GA220770@robh.at.kernel.org>
 <313f8052-a591-75de-c4c2-ee9ea8f02e7f@arm.com>
 <CAL_JsqKjTqcCbCLksRbCh7=f-A3Y09A3jNqtUApaA+p=RKd_Eg@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <c0d631de-8840-4f6e-aebf-41bb8449f78c@arm.com>
Date: Thu, 21 Jan 2021 01:09:56 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKjTqcCbCLksRbCh7=f-A3Y09A3jNqtUApaA+p=RKd_Eg@mail.gmail.com>
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

On 2021-01-20 21:31, Rob Herring wrote:
> On Wed, Jan 20, 2021 at 11:30 AM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 2021-01-20 16:53, Rob Herring wrote:
>>> On Wed, Jan 06, 2021 at 11:41:23AM +0800, Claire Chang wrote:
>>>> Introduce the new compatible string, restricted-dma-pool, for restricted
>>>> DMA. One can specify the address and length of the restricted DMA memory
>>>> region by restricted-dma-pool in the device tree.
>>>
>>> If this goes into DT, I think we should be able to use dma-ranges for
>>> this purpose instead. Normally, 'dma-ranges' is for physical bus
>>> restrictions, but there's no reason it can't be used for policy or to
>>> express restrictions the firmware has enabled.
>>
>> There would still need to be some way to tell SWIOTLB to pick up the
>> corresponding chunk of memory and to prevent the kernel from using it
>> for anything else, though.
> 
> Don't we already have that problem if dma-ranges had a very small
> range? We just get lucky because the restriction is generally much
> more RAM than needed.

Not really - if a device has a naturally tiny addressing capability that 
doesn't even cover ZONE_DMA32 where the regular SWIOTLB buffer will be 
allocated then it's unlikely to work well, but that's just crap system 
design. Yes, memory pressure in ZONE_DMA{32} is particularly problematic 
for such limited devices, but it's irrelevant to the issue at hand here.

What we have here is a device that's not allowed to see *kernel* memory 
at all. It's been artificially constrained to a particular region by a 
TZASC or similar, and the only data which should ever be placed in that 
region is data intended for that device to see. That way if it tries to 
go rogue it physically can't start slurping data intended for other 
devices or not mapped for DMA at all. The bouncing is an important part 
of this - I forget the title off-hand but there was an interesting paper 
a few years ago which demonstrated that even with an IOMMU, streaming 
DMA of in-place buffers could reveal enough adjacent data from the same 
page to mount an attack on the system. Memory pressure should be 
immaterial since the size of each bounce pool carveout will presumably 
be tuned for the needs of the given device.

> In any case, wouldn't finding all the dma-ranges do this? We're
> already walking the tree to find the max DMA address now.

If all you can see are two "dma-ranges" properties, how do you propose 
to tell that one means "this is the extent of what I can address, please 
set my masks and dma-range-map accordingly and try to allocate things 
where I can reach them" while the other means "take this output range 
away from the page allocator and hook it up as my dedicated bounce pool, 
because it is Serious Security Time"? Especially since getting that 
choice wrong either way would be a Bad Thing.

Robin.

>>>> Signed-off-by: Claire Chang <tientzu@chromium.org>
>>>> ---
>>>>    .../reserved-memory/reserved-memory.txt       | 24 +++++++++++++++++++
>>>>    1 file changed, 24 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>>> index e8d3096d922c..44975e2a1fd2 100644
>>>> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>>> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>>> @@ -51,6 +51,20 @@ compatible (optional) - standard definition
>>>>              used as a shared pool of DMA buffers for a set of devices. It can
>>>>              be used by an operating system to instantiate the necessary pool
>>>>              management subsystem if necessary.
>>>> +        - restricted-dma-pool: This indicates a region of memory meant to be
>>>> +          used as a pool of restricted DMA buffers for a set of devices. The
>>>> +          memory region would be the only region accessible to those devices.
>>>> +          When using this, the no-map and reusable properties must not be set,
>>>> +          so the operating system can create a virtual mapping that will be used
>>>> +          for synchronization. The main purpose for restricted DMA is to
>>>> +          mitigate the lack of DMA access control on systems without an IOMMU,
>>>> +          which could result in the DMA accessing the system memory at
>>>> +          unexpected times and/or unexpected addresses, possibly leading to data
>>>> +          leakage or corruption. The feature on its own provides a basic level
>>>> +          of protection against the DMA overwriting buffer contents at
>>>> +          unexpected times. However, to protect against general data leakage and
>>>> +          system memory corruption, the system needs to provide way to restrict
>>>> +          the DMA to a predefined memory region.
>>>>            - vendor specific string in the form <vendor>,[<device>-]<usage>
>>>>    no-map (optional) - empty property
>>>>        - Indicates the operating system must not create a virtual mapping
>>>> @@ -120,6 +134,11 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
>>>>                       compatible = "acme,multimedia-memory";
>>>>                       reg = <0x77000000 0x4000000>;
>>>>               };
>>>> +
>>>> +            restricted_dma_mem_reserved: restricted_dma_mem_reserved {
>>>> +                    compatible = "restricted-dma-pool";
>>>> +                    reg = <0x50000000 0x400000>;
>>>> +            };
>>>>       };
>>>>
>>>>       /* ... */
>>>> @@ -138,4 +157,9 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
>>>>               memory-region = <&multimedia_reserved>;
>>>>               /* ... */
>>>>       };
>>>> +
>>>> +    pcie_device: pcie_device@0,0 {
>>>> +            memory-region = <&restricted_dma_mem_reserved>;
>>>
>>> PCI hosts often have inbound window configurations that limit the
>>> address range and translate PCI to bus addresses. Those windows happen
>>> to be configured by dma-ranges. In any case, wouldn't you want to put
>>> the configuration in the PCI host node? Is there a usecase of
>>> restricting one PCIe device and not another?
>>
>> The general design seems to accommodate devices having their own pools
>> such that they can't even snoop on each others' transient DMA data. If
>> the interconnect had a way of wiring up, say, PCI RIDs to AMBA NSAIDs,
>> then in principle you could certainly apply that to PCI endpoints too
>> (presumably you'd also disallow them from peer-to-peer transactions at
>> the PCI level too).
> 
> At least for PCI, I think we can handle this. We have the BDF in the
> 3rd address cell in dma-ranges. The Openfirmware spec says those are 0
> in the case of ranges. It doesn't talk about dma-ranges though. But I
> think we could extend it to allow for BDF. Though typically with PCIe
> every device is behind its own bridge and each bridge node can have a
> dma-ranges.
> 
> Rob
> 
