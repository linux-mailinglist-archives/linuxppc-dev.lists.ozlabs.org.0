Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 811A474B7D2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 22:27:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hYUajuzM;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hYUajuzM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QyQ182tYmz3c8Y
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 06:27:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hYUajuzM;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hYUajuzM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QyQ0F0cqPz3bwd
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jul 2023 06:26:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688761576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gjK86c2dQGM+f2eMUtVsNWlEynMU4fwtCvD1yNsFzNY=;
	b=hYUajuzMaGF4Ug6foPOOJWV7vTp3KiGSwlHijEJBuD4oU7Px7zmTcI9uOgeA9U4hvRM6vY
	LbhKI3Ek7IVhSIiFDHgOzDB1gRbzMXju5XszIWQ5yYVbWnPN9piF8q1QmU9gZRaWQ/RJ1i
	53JS1EfkQ3l9HeYcyVDml4San15LZGY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688761576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gjK86c2dQGM+f2eMUtVsNWlEynMU4fwtCvD1yNsFzNY=;
	b=hYUajuzMaGF4Ug6foPOOJWV7vTp3KiGSwlHijEJBuD4oU7Px7zmTcI9uOgeA9U4hvRM6vY
	LbhKI3Ek7IVhSIiFDHgOzDB1gRbzMXju5XszIWQ5yYVbWnPN9piF8q1QmU9gZRaWQ/RJ1i
	53JS1EfkQ3l9HeYcyVDml4San15LZGY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-tyNJEfQGMPCjdOAkqM-wUA-1; Fri, 07 Jul 2023 16:26:15 -0400
X-MC-Unique: tyNJEfQGMPCjdOAkqM-wUA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3fbb0c01e71so12714045e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Jul 2023 13:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688761574; x=1691353574;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjK86c2dQGM+f2eMUtVsNWlEynMU4fwtCvD1yNsFzNY=;
        b=cCAzs/XnXH/Xa2qBKKTTDwrDpu7SFyWwS99tA+/luQlfTokYn/UK0q4oy8OLHr16gL
         MEvd0pVkMJV+7J0DntDON7jC/HkLH4mYvzDVybq/RkVqqDKJD3txAwHBkbR3QyVDF2LD
         +IvLHf5UCJn8cyanGjGyPdGd4IHjhfgqPXg2c0kJjn2tW5wHPK8svTU6xNicH3qMntPx
         IEYRooh6Uo+Jf6hBQGtKlnh5HrgS8TuKfZvF7YvNpQFsrioOykQDcHIy2u25gZl2kQTv
         /QIazUSh4ugyIg+R2Gygd0wxCCAL4ywJK0YNmrYzPUypxfavp0gB5jKrNlJLa/VPKxjC
         Jo1Q==
X-Gm-Message-State: ABy/qLYJdFI0UTleSE0wODyWhBawMUJyBqvet8mXn+KrQjHJUtpvM6W8
	fj6WY3z0cotT+F4haywN1W6B2VMUgjtGb39g2bKZrtYdjp/knG2eSzHDfu+rXztEvPVUSOwAaWw
	i4gV0WI0lDcTBczo2d7Vn+q0bcg==
X-Received: by 2002:a1c:6a0c:0:b0:3fb:ab56:a66c with SMTP id f12-20020a1c6a0c000000b003fbab56a66cmr4401274wmc.10.1688761573687;
        Fri, 07 Jul 2023 13:26:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGjvzcVGxaABbOkMpEOQGpHUUwk1LnPSbUo777cHsKQ3LbHYa5jr8f+rIihZ1cM/7CUp6uWhg==
X-Received: by 2002:a1c:6a0c:0:b0:3fb:ab56:a66c with SMTP id f12-20020a1c6a0c000000b003fbab56a66cmr4401253wmc.10.1688761573195;
        Fri, 07 Jul 2023 13:26:13 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f04:3c00:248f:bf5b:b03e:aac7? (p200300d82f043c00248fbf5bb03eaac7.dip0.t-ipconnect.de. [2003:d8:2f04:3c00:248f:bf5b:b03e:aac7])
        by smtp.gmail.com with ESMTPSA id h5-20020adffd45000000b00313f07ccca4sm5236241wrs.117.2023.07.07.13.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 13:26:12 -0700 (PDT)
Message-ID: <8ac69ee5-4b1f-6da5-1e9c-d5153ba68898@redhat.com>
Date: Fri, 7 Jul 2023 22:26:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/5] mm/hotplug: Embed vmem_altmap details in memory
 block
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230706085041.826340-1-aneesh.kumar@linux.ibm.com>
 <20230706085041.826340-2-aneesh.kumar@linux.ibm.com>
 <72488b8a-8f1e-c652-ab48-47e38290441f@redhat.com>
 <996e226a-2835-5b53-2255-2005c6335f98@linux.ibm.com>
 <e975f02b-1d35-8f22-9f3a-dfe0209306a1@redhat.com>
 <9ca978e7-5c09-6d92-7983-03a731549b25@linux.ibm.com>
 <256bd2f0-1b77-26dc-6393-b26dd363912f@redhat.com>
 <1a35cb1c-5be5-3fba-d59f-132b36863312@linux.ibm.com>
 <87f1854d-5e91-2aaa-6c22-23be61529200@redhat.com>
 <eaeb0b15-0efb-039c-27d4-2ca84b5a2b5d@linux.ibm.com>
 <26e9bd4b-965a-4aaa-6ae9-b1600c7ef52d@redhat.com>
 <fd6e3506-ab92-c0ae-69f6-ffb7cd3cf0bb@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <fd6e3506-ab92-c0ae-69f6-ffb7cd3cf0bb@linux.ibm.com>
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

On 07.07.23 18:25, Aneesh Kumar K V wrote:
> On 7/7/23 9:12 PM, David Hildenbrand wrote:
>> On 07.07.23 15:30, Aneesh Kumar K V wrote:
>>> On 7/7/23 5:47 PM, David Hildenbrand wrote:
>>>> On 06.07.23 18:06, Aneesh Kumar K V wrote:
>>>>> On 7/6/23 6:29 PM, David Hildenbrand wrote:
>>>>>> On 06.07.23 14:32, Aneesh Kumar K V wrote:
>>>>>>> On 7/6/23 4:44 PM, David Hildenbrand wrote:
>>>>>>>> On 06.07.23 11:36, Aneesh Kumar K V wrote:
>>>>>>>>> On 7/6/23 2:48 PM, David Hildenbrand wrote:
>>>>>>>>>> On 06.07.23 10:50, Aneesh Kumar K.V wrote:
>>>>>>>>>>> With memmap on memory, some architecture needs more details w.r.t altmap
>>>>>>>>>>> such as base_pfn, end_pfn, etc to unmap vmemmap memory.
>>>>>>>>>>
>>>>>>>>>> Can you elaborate why ppc64 needs that and x86-64 + aarch64 don't?
>>>>>>>>>>
>>>>>>>>>> IOW, why can't ppc64 simply allocate the vmemmap from the start of the memblock (-> base_pfn) and use the stored number of vmemmap pages to calculate the end_pfn?
>>>>>>>>>>
>>>>>>>>>> To rephrase: if the vmemmap is not at the beginning and doesn't cover full apgeblocks, memory onlining/offlining would be broken.
>>>>>>>>>>
>>>>>>>>>> [...]
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> With ppc64 and 64K pagesize and different memory block sizes, we can end up allocating vmemmap backing memory from outside altmap because
>>>>>>>>> a single page vmemmap can cover 1024 pages (64 *1024/sizeof(struct page)). and that can point to pages outside the dev_pagemap range.
>>>>>>>>> So on free we  check
>>>>>>>>
>>>>>>>> So you end up with a mixture of altmap and ordinarily-allocated vmemmap pages? That sound wrong (and is counter-intuitive to the feature in general, where we *don't* want to allocate the vmemmap from outside the altmap).
>>>>>>>>
>>>>>>>> (64 * 1024) / sizeof(struct page) -> 1024 pages
>>>>>>>>
>>>>>>>> 1024 pages * 64k = 64 MiB.
>>>>>>>>
>>>>>>>> What's the memory block size on these systems? If it's >= 64 MiB the vmemmap of a single memory block fits into a single page and we should be fine.
>>>>>>>>
>>>>>>>> Smells like you want to disable the feature on a 64k system.
>>>>>>>>
>>>>>>>
>>>>>>> But that part of vmemmap_free is common for both dax,dax kmem and the new memmap on memory feature. ie, ppc64 vmemmap_free have checks which require
>>>>>>> a full altmap structure with all the details in. So for memmap on memmory to work on ppc64 we do require similar altmap struct. Hence the idea
>>>>>>> of adding vmemmap_altmap to  struct memory_block
>>>>>>
>>>>>> I'd suggest making sure that for the memmap_on_memory case your really *always* allocate from the altmap (that's what the feature is about after all), and otherwise block the feature (i.e., arch_mhp_supports_... should reject it).
>>>>>>
>>>>>
>>>>> Sure. How about?
>>>>>
>>>>> bool mhp_supports_memmap_on_memory(unsigned long size)
>>>>> {
>>>>>
>>>>>       unsigned long nr_pages = size >> PAGE_SHIFT;
>>>>>       unsigned long vmemmap_size = nr_pages * sizeof(struct page);
>>>>>
>>>>>       if (!radix_enabled())
>>>>>           return false;
>>>>>       /*
>>>>>        * memmap on memory only supported with memory block size add/remove
>>>>>        */
>>>>>       if (size != memory_block_size_bytes())
>>>>>           return false;
>>>>>       /*
>>>>>        * Also make sure the vmemmap allocation is fully contianed
>>>>>        * so that we always allocate vmemmap memory from altmap area.
>>>>>        */
>>>>>       if (!IS_ALIGNED(vmemmap_size,  PAGE_SIZE))
>>>>>           return false;
>>>>>       /*
>>>>>        * The pageblock alignment requirement is met by using
>>>>>        * reserve blocks in altmap.
>>>>>        */
>>>>>       return true;
>>>>> }
>>>>
>>>> Better, but the PAGE_SIZE that could be added to common code as well.
>>>>
>>>> ... but, the pageblock check in common code implies a PAGE_SIZE check, so why do we need any other check besides the radix_enabled() check for arm64 and just keep all the other checks in common code as they are?
>>>>
>>>> If your vmemmap does not cover full pageblocks (which implies full pages), the feature cannot be used *unless* we'd waste altmap space in the vmemmap to cover one pageblock.
>>>>
>>>> Wasting hotplugged memory certainly sounds wrong?
>>>>
>>>>
>>>> So I appreciate if you could explain why the pageblock check should not be had for ppc64?
>>>>
>>>
>>> If we want things to be aligned to pageblock (2M) we will have to use 2M vmemmap space and that implies a memory block of 2G with 64K page size. That requirements makes the feature not useful at all
>>> on power. The compromise i came to was what i mentioned in the commit message for enabling the feature on ppc64.
>>
>> As we'll always handle a 2M pageblock, you'll end up wasting memory.
>>
>> Assume a 64MiB memory block:
>>
>> With 64k: 1024 pages -> 64k vmemmap, almost 2 MiB wasted. ~3.1 %
>> With 4k: 16384 pages -> 1 MiB vmemmap, 1 MiB wasted. ~1.5%
>>
>> It gets worse with smaller memory block sizes.
>>
>>
>>>
>>> We  use altmap.reserve feature to align things correctly at pageblock granularity. We can end up loosing some pages in memory with this. For ex: with 256MB memory block
>>> size, we require 4 pages to map vmemmap pages, In order to align things correctly we end up adding a reserve of 28 pages. ie, for every 4096 pages
>>> 28 pages get reserved.
>>
>>
>> You can simply align-up the nr_vmemmap_pages up to pageblocks in the memory hotplug code (e.g., depending on a config/arch knob whether wasting memory is supported).
>>
>> Because the pageblock granularity is a memory onlining/offlining limitation and should be checked+handled exactly there.
> 
> That is what the changes in the patches are doing. A rewritten patch showing this exact details is below. If arch want's to avoid
> wasting pages due to this aligment they can add the page aligment restrictions in
> 
> static inline bool arch_supports_memmap_on_memory(unsigned long size)
> {
> 	unsigned long nr_vmemmap_pages = size / PAGE_SIZE;
> 	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
> 	unsigned long remaining_size = size - vmemmap_size;
> 
> 	return IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
> 		IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT));
> }

I tend towards that this should be a config option (something that 
expresses that wasting memory is acceptable), then we can move it to 
common code.

There, we simply allow aligning the vmemmap size up to the next 
pageblock (if the config allows for it).

Further, we have to make sure that our single memblock is not a single 
pageblock (and adding memory would imply only consuming memmap and not 
providing any memory).


-- 
Cheers,

David / dhildenb

