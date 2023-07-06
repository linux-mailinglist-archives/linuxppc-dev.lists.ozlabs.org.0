Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A57749CDB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 15:00:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A2jNE7QT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nilc+KBP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qxc7x4Xzvz3bwk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 23:00:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A2jNE7QT;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nilc+KBP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qxc716hCMz3bpK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 22:59:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688648361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wlvbOLsD2Ke5G2QGVtKNYNTugeQY+Twg0zjBwi69P3g=;
	b=A2jNE7QTOajGuBelvC9P/ZoFdKrewNpSXYWGYZ2a1+lXuIR1wlWk10CYoHMaa0E9x7V5OI
	vGpQDDFqn9CQGDbVQrZ9v761kDIyAOr2A5ga+RPlLZkMoXr5sHOCYhA/i65Vu+aeH7VIJS
	4MgS2d7qzAvhtZHyMdGZujJquevBNJo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688648362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wlvbOLsD2Ke5G2QGVtKNYNTugeQY+Twg0zjBwi69P3g=;
	b=Nilc+KBP76ahEG4+MDUHEpCOlC9+7pu8EeipRx3LvG2ymJ9+6EWZootnAYiWqhS8+zOTjz
	0MmqCOcc7dbY/0fKAYQjljvsXr64qLZGcxabsIR3VK4P5f/fl+PH2ecUaB+uH3Yecn7eZB
	aCeuvazZkjP/jm0M02qXoxSPejCiK/0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-Gd6wSTHoNPu_2MulNtmvyg-1; Thu, 06 Jul 2023 08:59:18 -0400
X-MC-Unique: Gd6wSTHoNPu_2MulNtmvyg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3fbdf34184eso4135735e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 05:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688648357; x=1691240357;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlvbOLsD2Ke5G2QGVtKNYNTugeQY+Twg0zjBwi69P3g=;
        b=Mm67Y9657i8n0AXkXlV3Si5XoXWSQycXIOh3pMY3hoAAjMPQSFdn4iRMUrnIi1kAk1
         Nk2N9cNLR9Yj2knhsJUKF5XBTZKw6LJMvKPZQ6KwIa/Djq7Upo663oL42MEj3QzqWjm9
         3BlfP4w2I+RTt8yMdFNV+6K8nEIqdEyMj/U+2KEoVbndZmz70ZV9kc06TRc0D8ySvt2H
         QHoBRRWRCxnRD/KxfGuBoM0/dwZlXcDcOHeQAneULcO5ppC2qUnMzYZS5iZUaw2z/B9X
         xDP1o3TjqHGeeVZOBPpdokJ6YyWVH06WOs1x5VfH7pLCxkppr9C7lzP8b4UBl27ChMt9
         PUbQ==
X-Gm-Message-State: ABy/qLY4KfPaKIBNP7Ye/+oOoWrNRbCEhTs3FJIp//adWOOFo0FWdmrW
	LuhuMKVseQG2QobGx3LcNHZYo/p05EkK2ez+Jp8pzkUEc06yqtoN8VDktUTnZA4TefsyIap3bIQ
	c6ORN8+wojTIjK3rmNDCTokgJTg==
X-Received: by 2002:a1c:7410:0:b0:3f7:3699:c294 with SMTP id p16-20020a1c7410000000b003f73699c294mr1356194wmc.29.1688648357428;
        Thu, 06 Jul 2023 05:59:17 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEyKu727UsEqrmzpqu0iRg6TTkG6pBIpaeV4FZ5WWoAR+u1BpyUeV3Y7MLcJrozliOYt23XfA==
X-Received: by 2002:a1c:7410:0:b0:3f7:3699:c294 with SMTP id p16-20020a1c7410000000b003f73699c294mr1356179wmc.29.1688648356999;
        Thu, 06 Jul 2023 05:59:16 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id v19-20020a1cf713000000b003fbb00599e4sm5114363wmh.2.2023.07.06.05.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 05:59:16 -0700 (PDT)
Message-ID: <256bd2f0-1b77-26dc-6393-b26dd363912f@redhat.com>
Date: Thu, 6 Jul 2023 14:59:15 +0200
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
 <e975f02b-1d35-8f22-9f3a-dfe0209306a1@redhat.com>
 <9ca978e7-5c09-6d92-7983-03a731549b25@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 1/5] mm/hotplug: Embed vmem_altmap details in memory
 block
In-Reply-To: <9ca978e7-5c09-6d92-7983-03a731549b25@linux.ibm.com>
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

On 06.07.23 14:32, Aneesh Kumar K V wrote:
> On 7/6/23 4:44 PM, David Hildenbrand wrote:
>> On 06.07.23 11:36, Aneesh Kumar K V wrote:
>>> On 7/6/23 2:48 PM, David Hildenbrand wrote:
>>>> On 06.07.23 10:50, Aneesh Kumar K.V wrote:
>>>>> With memmap on memory, some architecture needs more details w.r.t altmap
>>>>> such as base_pfn, end_pfn, etc to unmap vmemmap memory.
>>>>
>>>> Can you elaborate why ppc64 needs that and x86-64 + aarch64 don't?
>>>>
>>>> IOW, why can't ppc64 simply allocate the vmemmap from the start of the memblock (-> base_pfn) and use the stored number of vmemmap pages to calculate the end_pfn?
>>>>
>>>> To rephrase: if the vmemmap is not at the beginning and doesn't cover full apgeblocks, memory onlining/offlining would be broken.
>>>>
>>>> [...]
>>>
>>>
>>> With ppc64 and 64K pagesize and different memory block sizes, we can end up allocating vmemmap backing memory from outside altmap because
>>> a single page vmemmap can cover 1024 pages (64 *1024/sizeof(struct page)). and that can point to pages outside the dev_pagemap range.
>>> So on free we  check
>>
>> So you end up with a mixture of altmap and ordinarily-allocated vmemmap pages? That sound wrong (and is counter-intuitive to the feature in general, where we *don't* want to allocate the vmemmap from outside the altmap).
>>
>> (64 * 1024) / sizeof(struct page) -> 1024 pages
>>
>> 1024 pages * 64k = 64 MiB.
>>
>> What's the memory block size on these systems? If it's >= 64 MiB the vmemmap of a single memory block fits into a single page and we should be fine.
>>
>> Smells like you want to disable the feature on a 64k system.
>>
> 
> But that part of vmemmap_free is common for both dax,dax kmem and the new memmap on memory feature. ie, ppc64 vmemmap_free have checks which require
> a full altmap structure with all the details in. So for memmap on memmory to work on ppc64 we do require similar altmap struct. Hence the idea
> of adding vmemmap_altmap to  struct memory_block

I'd suggest making sure that for the memmap_on_memory case your really 
*always* allocate from the altmap (that's what the feature is about 
after all), and otherwise block the feature (i.e., arch_mhp_supports_... 
should reject it).

Then, you can reconstruct the altmap layout trivially

base_pfn: start of the range to unplug
end_pfn: base_pfn + nr_vmemmap_pages

and pass that to the removal code, which will do the right thing, no?


Sure, remembering the altmap might be a potential cleanup (eventually?), 
but the basic reasoning why this is required as patch #1 IMHO is wrong: 
if you say you support memmap_on_memory for a configuration, then you 
should also properly support it (allocate from the hotplugged memory), 
not silently fall back to something else.


-- 
Cheers,

David / dhildenb

