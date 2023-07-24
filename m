Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A83F75FBF2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 18:25:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PK7/yzPp;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PK7/yzPp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8lqv3J4Fz2ytc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 02:24:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PK7/yzPp;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PK7/yzPp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8lq0503Dz2y1n
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 02:24:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690215848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ug85PaAC7KA1yX0CxNMRE7rjsGHUiw/OFWL3G9SVx48=;
	b=PK7/yzPpG7KpNLh85dRLc4rhxw8j2fOUkeGe1R7k0hYj8A185O3JKu3ekkWxNyFjoFk0Ts
	Vyiyzl4+Aw03itiiCDboiTUNaiDORpIF7SDcIti18v+IRHWWB1hiPyeY4YVuTZi2XCM1RC
	vGFgY+nLDObL5RjDnxOS0cOpOlvwarM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690215848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ug85PaAC7KA1yX0CxNMRE7rjsGHUiw/OFWL3G9SVx48=;
	b=PK7/yzPpG7KpNLh85dRLc4rhxw8j2fOUkeGe1R7k0hYj8A185O3JKu3ekkWxNyFjoFk0Ts
	Vyiyzl4+Aw03itiiCDboiTUNaiDORpIF7SDcIti18v+IRHWWB1hiPyeY4YVuTZi2XCM1RC
	vGFgY+nLDObL5RjDnxOS0cOpOlvwarM=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-S8k4YoT4O0OTZtBo1Vhftg-1; Mon, 24 Jul 2023 12:24:05 -0400
X-MC-Unique: S8k4YoT4O0OTZtBo1Vhftg-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-4fb9087a677so3877039e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 09:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690215844; x=1690820644;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ug85PaAC7KA1yX0CxNMRE7rjsGHUiw/OFWL3G9SVx48=;
        b=cKa6AuSImRW05QKVrr+bcLTqPbxHjnr8qP3n7NtZ+0ceB81KUPC37JOQkEoXWUp3iv
         jTl0/BtLvlPUQ+oMvr0tMLDm3XLM9MPNhVAd1KHEu+xlOpDG+jBYAkk4ipng4d/CfBlY
         KU2Zc2NbbUjQOCcAKoXCShESn0BXW56HoO0Mopp7SbG5OeSBUNcZpR4zef36Wu19XNRv
         QCTyQTCS+YNzJrTGQvhAtneIVLLPbBls74Y6y5W0zEDqCfN/+GNnvkwM8nYob9FHXg7s
         IywiNuK+SFEmQ4IER/YnmGojmxp+R/9eVWm57asWiSvpjNbdq9Rh9SlYEBBV/TrB6ptk
         WIqQ==
X-Gm-Message-State: ABy/qLb2Hd85kc4SVE/mR8Ozh0hXtQ/Z0fcwpfLZ5xlrZxcogNODhGPj
	wigJ9pcgDKPLbbaVF0MoIM9/bjkv0cTJR3UaWXubZBMazUBWoFSxL2GVdlYkxXV0lLbws7SGuBK
	wgDa0eYwrOe4VWenWRfoO9SfydQ==
X-Received: by 2002:ac2:5dee:0:b0:4f8:651f:9bbe with SMTP id z14-20020ac25dee000000b004f8651f9bbemr5788080lfq.54.1690215843895;
        Mon, 24 Jul 2023 09:24:03 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHEekmXC2iJCPsbTrDc/44MKabM5a2iDYfkPkSxlTotpMKjXHabhuT78kKa0siW8UsfPUSzgg==
X-Received: by 2002:ac2:5dee:0:b0:4f8:651f:9bbe with SMTP id z14-20020ac25dee000000b004f8651f9bbemr5788062lfq.54.1690215843479;
        Mon, 24 Jul 2023 09:24:03 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73d:bb00:91a5:d1c:3a7e:4c77? (p200300cbc73dbb0091a50d1c3a7e4c77.dip0.t-ipconnect.de. [2003:cb:c73d:bb00:91a5:d1c:3a7e:4c77])
        by smtp.gmail.com with ESMTPSA id q16-20020a5d5750000000b003112f836d4esm13475831wrw.85.2023.07.24.09.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 09:24:02 -0700 (PDT)
Message-ID: <5ee3550d-5bbe-4223-722b-9a388f86fc21@redhat.com>
Date: Mon, 24 Jul 2023 18:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230718024409.95742-1-aneesh.kumar@linux.ibm.com>
 <20230718024409.95742-5-aneesh.kumar@linux.ibm.com>
 <f9597236-866d-17cd-d549-938ea80eacbe@redhat.com>
 <bbd774bb-10b9-30b1-c82b-27d01d304f8d@linux.ibm.com>
 <29eb32f0-fb0b-c8f9-ba23-8295147808ea@redhat.com>
 <3f22b23a-701a-548b-9d84-8ecad695c313@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v4 4/6] mm/hotplug: Allow pageblock alignment via altmap
 reservation
In-Reply-To: <3f22b23a-701a-548b-9d84-8ecad695c313@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24.07.23 18:02, Aneesh Kumar K V wrote:
> On 7/24/23 9:11 PM, David Hildenbrand wrote:
>> On 24.07.23 17:16, Aneesh Kumar K V wrote:
>>
>>>>
>>>> /*
>>>>    * In "forced" memmap_on_memory mode, we always align the vmemmap size up to cover
>>>>    * full pageblocks. That way, we can add memory even if the vmemmap size is not properly
>>>>    * aligned, however, we might waste memory.
>>>>    */
>>>
>>> I am finding that confusing. We do want things to be pageblock_nr_pages aligned both ways.
>>> With MEMMAP_ON_MEMORY_FORCE, we do that by allocating more space for memmap and
>>> in the default case we do that by making sure only memory blocks of specific size supporting
>>> that alignment can use MEMMAP_ON_MEMORY feature.
>>
>> See the usage inm hp_supports_memmap_on_memory(), I guess that makes sense then.
>>
>> But if you have any ideas on how to clarify that (terminology), I'm all ears!
>>
> 
> 
> I updated the commit message
> 
> mm/hotplug: Support memmap_on_memory when memmap is not aligned to pageblocks
> 
> Currently, memmap_on_memory feature is only supported with memory block
> sizes that result in vmemmap pages covering full page blocks. This is
> because memory onlining/offlining code requires applicable ranges to be
> pageblock-aligned, for example, to set the migratetypes properly.
> 
> This patch helps to lift that restriction by reserving more pages than
> required for vmemmap space. This helps to align the start addr to be
> page block aligned with different memory block sizes. This implies the
> kernel will be reserving some pages for every memoryblock. This also
> allows the memmap on memory feature to be widely useful with different
> memory block size values.
> 
> For ex: with 64K page size and 256MiB memory block size, we require 4
> pages to map vmemmap pages, To align things correctly we end up adding a
> reserve of 28 pages. ie, for every 4096 pages 28 pages get reserved.
> 
> 

Much better.

> Also while implementing your  suggestion to use memory_block_memmap_on_memory_size()
> I am finding it not really useful because in mhp_supports_memmap_on_memory() we are checking
> if remaining_size is pageblock_nr_pages aligned (dax_kmem may want to use that helper
> later).

Let's focus on this patchset here first.

Factoring out how manye memmap pages we actually need vs. how many pages 
we need when aligning up sound very reasonable to me.


Can you elaborate what the problem is?

> Also I still think altmap.reserve is easier because of the start_pfn calculation.
> (more on this below)

Can you elaborate? Do you mean the try_remove_memory() change?

> 
> 
>> [...]
>>
>>>>> +    return arch_supports_memmap_on_memory(size);
>>>>>     }
>>>>>       /*
>>>>> @@ -1311,7 +1391,11 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>>>>>     {
>>>>>         struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
>>>>>         enum memblock_flags memblock_flags = MEMBLOCK_NONE;
>>>>> -    struct vmem_altmap mhp_altmap = {};
>>>>> +    struct vmem_altmap mhp_altmap = {
>>>>> +        .base_pfn =  PHYS_PFN(res->start),
>>>>> +        .end_pfn  =  PHYS_PFN(res->end),
>>>>> +        .reserve  = memory_block_align_base(resource_size(res)),
>>>>
>>>> Can you remind me why we have to set reserve here at all?
>>>>
>>>> IOW, can't we simply set
>>>>
>>>> .free = memory_block_memmap_on_memory_size();
>>>>
>>>> end then pass
>>>>
>>>> mhp_altmap.alloc + mhp_altmap.free
>>>>
>>>> to create_memory_block_devices() instead?
>>>>
>>>
>>> But with the dax usage of altmap, altmap->reserve is what we use to reserve things to get
>>> the required alignment. One difference is where we allocate the struct page at. For this specific
>>> case it should not matter.
>>>
>>> static unsigned long __meminit vmem_altmap_next_pfn(struct vmem_altmap *altmap)
>>> {
>>>      return altmap->base_pfn + altmap->reserve + altmap->alloc
>>>          + altmap->align;
>>> }
>>>
>>> And other is where we online a memory block
>>>
>>> We find the start pfn using mem->altmap->alloc + mem->altmap->reserve;
>>>
>>> Considering altmap->reserve is what dax pfn_dev use, is there a reason you want to use altmap->free for this?
>>
>> "Reserve" is all about "reserving that much memory for driver usage".
>>
>> We don't care about that. We simply want vmemmap allocations coming from the pageblock(s) we set aside. Where exactly, we don't care.
>>
>>> I find it confusing to update free when we haven't allocated any altmap blocks yet.
>>
>> "
>> @reserve: pages mapped, but reserved for driver use (relative to @base)"
>> @free: free pages set aside in the mapping for memmap storage
>> @alloc: track pages consumed, private to vmemmap_populate()
>> "
>>
>> To me, that implies that we can ignore "reserve". We set @free to the aligned value and let the vmemmap get allocated from anything in there.
>>
>> free + alloc should always sum up to our set-aside pageblock(s), no?
>>
>>
> 
> The difference is
> 
>   mhp_altmap.free = PHYS_PFN(size) - reserved blocks;
> 
> ie, with 256MiB memory block size with 64K pages, we need 4 memmap pages and we reserve 28 pages for aligment.
> 
> mhp_altmap.free = PHYS_PFN(size) - 28.
> 
> So that 4 pages from which we are allocating the memmap pages are still counted in free page.
> 
> We could all make it work by doing
> 
> mhp_altmap.free = PHYS_PFN(size) -  (memory_block_memmap_on_memory_size() - memory_block_memmap_size())
> 
> But is that any better than what we have now? I understand the term "reserved for driver use" is confusing for this use case.
> But it is really reserving things for required alignment.


Let's take a step back.

altmap->alloc tells us how much was already allocated.

altmap->free tells us how much memory we can allocate at max (confusing, 
but see vmem_altmap_nr_free()).

altmap->free should actually have been called differently.


I think it's currently even *wrong* to set free = PHYS_PFN(size). We 
don't want to allocate beyond the first pageblock(s) we selected.


Can't we set:

1) add_memory_resource():

	.base_pfn = PHYS_PFN(start);
	.free = PHYS_PFN(memory_block_memmap_on_memory_size());

2) try_remove_memory():
	.base_pfn = PHYS_PFN(start);
	.alloc = PHYS_PFN(memory_block_memmap_on_memory_size());

Faking that all was allocated and avoiding any reservation terminology?

-- 
Cheers,

David / dhildenb

