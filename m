Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A9474B091
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 14:18:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UEJqs0l5;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UEJqs0l5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QyC9g6M0lz3c5Z
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 22:18:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UEJqs0l5;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UEJqs0l5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QyC8q1dSNz30P0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 22:18:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688732277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3PKweTvYl5LiGyKuKPuX7PKGhw8DHWGK7bc17UzyC90=;
	b=UEJqs0l5Nc2/xNMEIToJP488YCDZPb5hEPV7U37nbeynjY1b8FOO3z/GZd5ZdmjPHvppKk
	w53SoGXiYwUFq+1nbtqGTWKkYhFvBey8MbXom42KlZOibldCsY2uX1oT0j7Wf8IDJtTpsp
	PhQ162TeEEaEx+V7yredUsx0GW2UZTc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688732277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3PKweTvYl5LiGyKuKPuX7PKGhw8DHWGK7bc17UzyC90=;
	b=UEJqs0l5Nc2/xNMEIToJP488YCDZPb5hEPV7U37nbeynjY1b8FOO3z/GZd5ZdmjPHvppKk
	w53SoGXiYwUFq+1nbtqGTWKkYhFvBey8MbXom42KlZOibldCsY2uX1oT0j7Wf8IDJtTpsp
	PhQ162TeEEaEx+V7yredUsx0GW2UZTc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-KpgJMIESPoqgl6huhuR6EQ-1; Fri, 07 Jul 2023 08:17:54 -0400
X-MC-Unique: KpgJMIESPoqgl6huhuR6EQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3fbdf34184eso10982005e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Jul 2023 05:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688732273; x=1691324273;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3PKweTvYl5LiGyKuKPuX7PKGhw8DHWGK7bc17UzyC90=;
        b=DWplEvxBFpvmmAOMzwuRFuiy+w45ezk2bAgNf8wQCX/WJoOPkd9Z/H2J06pZmNhXxh
         sTJtM9h47+isowvt3cJBlkNgTLWxlYrlMMJMP5gBn59nmhMgx+H/aF4OzB3P+90eZ+aY
         GAKNfKQNYch/sQmMvubTuha3J9cMJdoGF6z8khEVUY1h2krjiOiP/4UcTjo/hFltCKoX
         tfA+TVNKSpSNUGTp2ZTtVcGv1Y/FnaXuzAy26qlokbzNypb3xLcnvPGddinryfXzwDVN
         23o5bFekSEaopckcAeYKBjeN+shXio7z8a/iTHMdT4boE07nXAq4OE8sjEReg0Y+yEed
         dKCw==
X-Gm-Message-State: ABy/qLa3u7G26UXtAeXimZ6O0l+XQ57/BkIWN6DyvfEGuR3DDVA3NFSS
	CHRlEbQK0E7urQFqocy2A4wjWA95gh8u4SPTDVE6u3aX3POdwQYqk7VMpp7V61r2PWkEZcFcAgd
	N1ZP1N6fFgm2j5V/Q+tMWnHpxYA==
X-Received: by 2002:a7b:ce0f:0:b0:3f9:b87c:10db with SMTP id m15-20020a7bce0f000000b003f9b87c10dbmr3690958wmc.3.1688732272809;
        Fri, 07 Jul 2023 05:17:52 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHkVxtlC56TbBBzJDTyYz9QgBl2sPl89eMkHaXchfxXCDoV9DdYAzH3zqFfKdeoqyDcP7djkg==
X-Received: by 2002:a7b:ce0f:0:b0:3f9:b87c:10db with SMTP id m15-20020a7bce0f000000b003f9b87c10dbmr3690937wmc.3.1688732272381;
        Fri, 07 Jul 2023 05:17:52 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f04:3c00:248f:bf5b:b03e:aac7? (p200300d82f043c00248fbf5bb03eaac7.dip0.t-ipconnect.de. [2003:d8:2f04:3c00:248f:bf5b:b03e:aac7])
        by smtp.gmail.com with ESMTPSA id 24-20020a05600c021800b003fbd597bccesm2272010wmi.41.2023.07.07.05.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 05:17:51 -0700 (PDT)
Message-ID: <87f1854d-5e91-2aaa-6c22-23be61529200@redhat.com>
Date: Fri, 7 Jul 2023 14:17:50 +0200
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
 <256bd2f0-1b77-26dc-6393-b26dd363912f@redhat.com>
 <1a35cb1c-5be5-3fba-d59f-132b36863312@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 1/5] mm/hotplug: Embed vmem_altmap details in memory
 block
In-Reply-To: <1a35cb1c-5be5-3fba-d59f-132b36863312@linux.ibm.com>
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

On 06.07.23 18:06, Aneesh Kumar K V wrote:
> On 7/6/23 6:29 PM, David Hildenbrand wrote:
>> On 06.07.23 14:32, Aneesh Kumar K V wrote:
>>> On 7/6/23 4:44 PM, David Hildenbrand wrote:
>>>> On 06.07.23 11:36, Aneesh Kumar K V wrote:
>>>>> On 7/6/23 2:48 PM, David Hildenbrand wrote:
>>>>>> On 06.07.23 10:50, Aneesh Kumar K.V wrote:
>>>>>>> With memmap on memory, some architecture needs more details w.r.t altmap
>>>>>>> such as base_pfn, end_pfn, etc to unmap vmemmap memory.
>>>>>>
>>>>>> Can you elaborate why ppc64 needs that and x86-64 + aarch64 don't?
>>>>>>
>>>>>> IOW, why can't ppc64 simply allocate the vmemmap from the start of the memblock (-> base_pfn) and use the stored number of vmemmap pages to calculate the end_pfn?
>>>>>>
>>>>>> To rephrase: if the vmemmap is not at the beginning and doesn't cover full apgeblocks, memory onlining/offlining would be broken.
>>>>>>
>>>>>> [...]
>>>>>
>>>>>
>>>>> With ppc64 and 64K pagesize and different memory block sizes, we can end up allocating vmemmap backing memory from outside altmap because
>>>>> a single page vmemmap can cover 1024 pages (64 *1024/sizeof(struct page)). and that can point to pages outside the dev_pagemap range.
>>>>> So on free we  check
>>>>
>>>> So you end up with a mixture of altmap and ordinarily-allocated vmemmap pages? That sound wrong (and is counter-intuitive to the feature in general, where we *don't* want to allocate the vmemmap from outside the altmap).
>>>>
>>>> (64 * 1024) / sizeof(struct page) -> 1024 pages
>>>>
>>>> 1024 pages * 64k = 64 MiB.
>>>>
>>>> What's the memory block size on these systems? If it's >= 64 MiB the vmemmap of a single memory block fits into a single page and we should be fine.
>>>>
>>>> Smells like you want to disable the feature on a 64k system.
>>>>
>>>
>>> But that part of vmemmap_free is common for both dax,dax kmem and the new memmap on memory feature. ie, ppc64 vmemmap_free have checks which require
>>> a full altmap structure with all the details in. So for memmap on memmory to work on ppc64 we do require similar altmap struct. Hence the idea
>>> of adding vmemmap_altmap to  struct memory_block
>>
>> I'd suggest making sure that for the memmap_on_memory case your really *always* allocate from the altmap (that's what the feature is about after all), and otherwise block the feature (i.e., arch_mhp_supports_... should reject it).
>>
> 
> Sure. How about?
> 
> bool mhp_supports_memmap_on_memory(unsigned long size)
> {
> 
> 	unsigned long nr_pages = size >> PAGE_SHIFT;
> 	unsigned long vmemmap_size = nr_pages * sizeof(struct page);
> 
> 	if (!radix_enabled())
> 		return false;
> 	/*
> 	 * memmap on memory only supported with memory block size add/remove
> 	 */
> 	if (size != memory_block_size_bytes())
> 		return false;
> 	/*
> 	 * Also make sure the vmemmap allocation is fully contianed
> 	 * so that we always allocate vmemmap memory from altmap area.
> 	 */
> 	if (!IS_ALIGNED(vmemmap_size,  PAGE_SIZE))
> 		return false;
> 	/*
> 	 * The pageblock alignment requirement is met by using
> 	 * reserve blocks in altmap.
> 	 */
> 	return true;
> }

Better, but the PAGE_SIZE that could be added to common code as well.

... but, the pageblock check in common code implies a PAGE_SIZE check, 
so why do we need any other check besides the radix_enabled() check for 
arm64 and just keep all the other checks in common code as they are?

If your vmemmap does not cover full pageblocks (which implies full 
pages), the feature cannot be used *unless* we'd waste altmap space in 
the vmemmap to cover one pageblock.

Wasting hotplugged memory certainly sounds wrong?


So I appreciate if you could explain why the pageblock check should not 
be had for ppc64?

> 
> 
> 
>   
>> Then, you can reconstruct the altmap layout trivially
>>
>> base_pfn: start of the range to unplug
>> end_pfn: base_pfn + nr_vmemmap_pages
>>
>> and pass that to the removal code, which will do the right thing, no?
>>
>>
>> Sure, remembering the altmap might be a potential cleanup (eventually?), but the basic reasoning why this is required as patch #1 IMHO is wrong: if you say you support memmap_on_memory for a configuration, then you should also properly support it (allocate from the hotplugged memory), not silently fall back to something else.
> 
> I guess you want to keep the altmap introduction as a later patch in the series and not the preparatory patch? Or are you ok with just adding the additional check I mentioned above w.r.t size value and keep this patch as patch 1  as a generic cleanup (avoiding
> the recomputation of altmap->alloc/base_pfn/end_pfn?

Yes, if it's not required better remove it completely from this 
patchset. We can alter discuss if keeping the altmap around is actually 
a cleanup or rather unnecessary.

-- 
Cheers,

David / dhildenb

