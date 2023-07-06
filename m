Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F9C749A5C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 13:15:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CJJRBVdL;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CI2WFAqd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxYpg2X9fz3brb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 21:15:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CJJRBVdL;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CI2WFAqd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxYnp04cqz2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 21:14:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688642057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H8Pt2EKetP/aheWWVzGc8UrAuWjlf8RIxXM/qMLtVAo=;
	b=CJJRBVdLxQgWcYAnYtxB3O+/LAUTh6MYBaARYg03yO/QdMGDlnV2NU4+T85Y2OI644YyHn
	Q6k8XvGeiejWEGL9C9y7LUs5Qdi65E5bbOi6TJfe2CqR/CnRFzT9JbSSXUWqEGV443HSkK
	UMa8Cdq7luGx8g881FTgj1pp7JTLw7c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688642058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H8Pt2EKetP/aheWWVzGc8UrAuWjlf8RIxXM/qMLtVAo=;
	b=CI2WFAqdVXj6KD2Jg1pMyN/Pd/5V6n4N7FyuXDFSwGlVoS2reNAbgoIpQQoNMwZpuUSorv
	wvl1/jZYnoc1M1z+/uQXx6jLPlxn4OoS+b4zBa1rsV0ZulYo5zfrW9n2u9l+rC6XL5n/it
	cS6mm2MgPamikfqmRTmrBOl78hAssQo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-2gMM7aZNMKKqsM_ob5kk-g-1; Thu, 06 Jul 2023 07:14:16 -0400
X-MC-Unique: 2gMM7aZNMKKqsM_ob5kk-g-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3fa8db49267so3507035e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 04:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688642055; x=1691234055;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8Pt2EKetP/aheWWVzGc8UrAuWjlf8RIxXM/qMLtVAo=;
        b=LV92oQZWTgDxj+VL/7GqUdn5iJmGKfb8f6Lby59WQ9dwsQDWKfIGTtiQygPVCXaYef
         azIrCvnLnILABIXbJ7I9OHhqvAE3PxSghOgdbl1VD7EwtDmjQCIUMHPyw792m9m7kwI2
         7jTsc2P5pMm/19TCUhNzQBbGxvO8U99eJNPKD3z9Z99DmaGzYiZz4V7juMWdIzDcT+q2
         jMWFYiK/auZrr1A2oAqqp5imzmPTlyeKsr8PaXqmj2H8nv40SVtbAMdzAI+J3xSiLZTy
         DIe8+iDeG8v1za75M883V4jp6KnyvOxlfjWfi8XUPfet+uZRvdoPMdphp0pJmVyuEq1s
         qKtQ==
X-Gm-Message-State: ABy/qLZjKAc8ky7RMLm5EG3rWgJO+NBCeerQQ5EnOs2MEcXNc9JVVOA5
	L7JcWwyf8LjFwt4kIvEBwVHiLi9Jp7736CiHUaEtyNVn3H6WcUhRimC8w6rYYVWV1USF3QO9j39
	mGoWfojhBumQBjM16KSaDkia00w==
X-Received: by 2002:a1c:e909:0:b0:3fa:993f:acc1 with SMTP id q9-20020a1ce909000000b003fa993facc1mr1118489wmc.2.1688642055551;
        Thu, 06 Jul 2023 04:14:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGVkHXGSeygh/G74BlvHOFNUx/DGIjm7xiAThEmiefEKNUvieIKgTiYIC/FTuqx5jlT4FxgTQ==
X-Received: by 2002:a1c:e909:0:b0:3fa:993f:acc1 with SMTP id q9-20020a1ce909000000b003fa993facc1mr1118467wmc.2.1688642055143;
        Thu, 06 Jul 2023 04:14:15 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id f21-20020a7bcd15000000b003fa95890484sm1783225wmj.20.2023.07.06.04.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 04:14:14 -0700 (PDT)
Message-ID: <e975f02b-1d35-8f22-9f3a-dfe0209306a1@redhat.com>
Date: Thu, 6 Jul 2023 13:14:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230706085041.826340-1-aneesh.kumar@linux.ibm.com>
 <20230706085041.826340-2-aneesh.kumar@linux.ibm.com>
 <72488b8a-8f1e-c652-ab48-47e38290441f@redhat.com>
 <996e226a-2835-5b53-2255-2005c6335f98@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 1/5] mm/hotplug: Embed vmem_altmap details in memory
 block
In-Reply-To: <996e226a-2835-5b53-2255-2005c6335f98@linux.ibm.com>
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

On 06.07.23 11:36, Aneesh Kumar K V wrote:
> On 7/6/23 2:48 PM, David Hildenbrand wrote:
>> On 06.07.23 10:50, Aneesh Kumar K.V wrote:
>>> With memmap on memory, some architecture needs more details w.r.t altmap
>>> such as base_pfn, end_pfn, etc to unmap vmemmap memory.
>>
>> Can you elaborate why ppc64 needs that and x86-64 + aarch64 don't?
>>
>> IOW, why can't ppc64 simply allocate the vmemmap from the start of the memblock (-> base_pfn) and use the stored number of vmemmap pages to calculate the end_pfn?
>>
>> To rephrase: if the vmemmap is not at the beginning and doesn't cover full apgeblocks, memory onlining/offlining would be broken.
>>
>> [...]
> 
> 
> With ppc64 and 64K pagesize and different memory block sizes, we can end up allocating vmemmap backing memory from outside altmap because
> a single page vmemmap can cover 1024 pages (64 *1024/sizeof(struct page)). and that can point to pages outside the dev_pagemap range.
> So on free we  check

So you end up with a mixture of altmap and ordinarily-allocated vmemmap 
pages? That sound wrong (and is counter-intuitive to the feature in 
general, where we *don't* want to allocate the vmemmap from outside the 
altmap).

(64 * 1024) / sizeof(struct page) -> 1024 pages

1024 pages * 64k = 64 MiB.

What's the memory block size on these systems? If it's >= 64 MiB the 
vmemmap of a single memory block fits into a single page and we should 
be fine.

Smells like you want to disable the feature on a 64k system.

> 
> vmemmap_free() {
> ...
> 	if (altmap) {
> 		alt_start = altmap->base_pfn;
> 		alt_end = altmap->base_pfn + altmap->reserve +
> 			  altmap->free + altmap->alloc + altmap->align;
> 	}
> 
> ...
> 		if (base_pfn >= alt_start && base_pfn < alt_end) {
> 			vmem_altmap_free(altmap, nr_pages);
> 
> to see whether we did use altmap for the vmemmap allocation.
> 
>>
>>>    +/**
>>> + * struct vmem_altmap - pre-allocated storage for vmemmap_populate
>>> + * @base_pfn: base of the entire dev_pagemap mapping
>>> + * @reserve: pages mapped, but reserved for driver use (relative to @base)
>>> + * @free: free pages set aside in the mapping for memmap storage
>>> + * @align: pages reserved to meet allocation alignments
>>> + * @alloc: track pages consumed, private to vmemmap_populate()
>>> + */
>>> +struct vmem_altmap {
>>> +    unsigned long base_pfn;
>>> +    const unsigned long end_pfn;
>>> +    const unsigned long reserve;
>>> +    unsigned long free;
>>> +    unsigned long align;
>>> +    unsigned long alloc;
>>> +};
>>
>> Instead of embedding that, what about conditionally allocating it and store a pointer to it in the "struct memory_block"?
>>
>> In the general case as of today, we don't have an altmap.
>>
> 
> Sure but with memmap on memory option it is essentially adding that right?.

At least on x86_64 and aarch64 only for 128 MiB DIMMs (and especially, 
not memory added by hv-balloon, virtio-mem, xen-balloon).

So in the general case it's not that frequently used. Maybe on ppc64 
once wired up.

Is the concern related to the increase in the size of
> struct memory_block  ?

Partially. It looks cleaner to have !mem->altmap if there is no altmap.

-- 
Cheers,

David / dhildenb

