Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E45B74B47C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 17:43:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SQpAPmZh;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SQpAPmZh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QyHkL40Ybz3btJ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 01:43:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SQpAPmZh;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SQpAPmZh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QyHjQ1s9hz3btJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jul 2023 01:43:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688744582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wml8vcGohPzmThqzK5ez5tpXkc4mwz7Yay2uzk8gCUw=;
	b=SQpAPmZhnbsqJPi67p+QDNdhtJG9APj6KEZRWeLnZD7PEjCFkUjlHc6mPCYYqv/PHHdN11
	CkzoBmRco0q3JTLn7cS0GDLEX8CrwzSoyHyPgkwdDHbdtxdQguUfQXTADKWkImnXFuMn9i
	CeG9XN842Gyv9QsaIhADBz6Xc9LTgTQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688744582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wml8vcGohPzmThqzK5ez5tpXkc4mwz7Yay2uzk8gCUw=;
	b=SQpAPmZhnbsqJPi67p+QDNdhtJG9APj6KEZRWeLnZD7PEjCFkUjlHc6mPCYYqv/PHHdN11
	CkzoBmRco0q3JTLn7cS0GDLEX8CrwzSoyHyPgkwdDHbdtxdQguUfQXTADKWkImnXFuMn9i
	CeG9XN842Gyv9QsaIhADBz6Xc9LTgTQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-wa2Mz08gMzeNXL2_cJGmJw-1; Fri, 07 Jul 2023 11:42:58 -0400
X-MC-Unique: wa2Mz08gMzeNXL2_cJGmJw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-313ec030acbso1573251f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Jul 2023 08:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688744577; x=1691336577;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wml8vcGohPzmThqzK5ez5tpXkc4mwz7Yay2uzk8gCUw=;
        b=A08KA1EewoIPw5vyp1nr/CLxciian2dGe+0WXtEWG80P4g6m20PfSd7XiJohjmazAN
         WUUA3Y4vYe98EXeIA+dKVxRYYwJ07wNjRvNRHi1JTBA7Di9i/sKEjN3IwHf//H15UJV7
         ol544/Fsp0H9Q9jxl5mJaedQqbQr4VqkK15S0fn9lKgaqN6Js9Pxj5t1xfcReow0oG/F
         pTlxwpuqpgxGP7MJazxrgoAKbVr5FQuGThNK3zYE0cl3g5Bn4MYCY62j+DVLNICDjJWK
         9ZYnpmrCoUJHkpMi7xemfkN0EjzCDhf/d4R/ZngjMbzX7DrHa+p5PmWCaRTxHd0kz+Fc
         ySBg==
X-Gm-Message-State: ABy/qLb5iP3YZipSi7OtilVYIbwEgUuugQZJpOtbhtGTmGXg/j8/Oiao
	tz8FfOodFwd2ACWezlfv4rsn8fcz8CkRdZSXgaDb2+PyqoejUYT+931nL8tgdb1j026+3/MLrup
	dZcC9rPmJS7e1WGr3JijWbmBVfQ==
X-Received: by 2002:a5d:6a8a:0:b0:314:ebc:1471 with SMTP id s10-20020a5d6a8a000000b003140ebc1471mr8011503wru.27.1688744577672;
        Fri, 07 Jul 2023 08:42:57 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEpLBuLY461eo/LAx1knSmXhhMk2XnzKuV51i86cCVkRKtnb4GjSmM9rGcBUp0TVefqiXI56g==
X-Received: by 2002:a5d:6a8a:0:b0:314:ebc:1471 with SMTP id s10-20020a5d6a8a000000b003140ebc1471mr8011482wru.27.1688744577273;
        Fri, 07 Jul 2023 08:42:57 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f04:3c00:248f:bf5b:b03e:aac7? (p200300d82f043c00248fbf5bb03eaac7.dip0.t-ipconnect.de. [2003:d8:2f04:3c00:248f:bf5b:b03e:aac7])
        by smtp.gmail.com with ESMTPSA id v12-20020adfe4cc000000b003143cb109d5sm4724018wrm.14.2023.07.07.08.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 08:42:56 -0700 (PDT)
Message-ID: <26e9bd4b-965a-4aaa-6ae9-b1600c7ef52d@redhat.com>
Date: Fri, 7 Jul 2023 17:42:55 +0200
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
 <87f1854d-5e91-2aaa-6c22-23be61529200@redhat.com>
 <eaeb0b15-0efb-039c-27d4-2ca84b5a2b5d@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 1/5] mm/hotplug: Embed vmem_altmap details in memory
 block
In-Reply-To: <eaeb0b15-0efb-039c-27d4-2ca84b5a2b5d@linux.ibm.com>
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

On 07.07.23 15:30, Aneesh Kumar K V wrote:
> On 7/7/23 5:47 PM, David Hildenbrand wrote:
>> On 06.07.23 18:06, Aneesh Kumar K V wrote:
>>> On 7/6/23 6:29 PM, David Hildenbrand wrote:
>>>> On 06.07.23 14:32, Aneesh Kumar K V wrote:
>>>>> On 7/6/23 4:44 PM, David Hildenbrand wrote:
>>>>>> On 06.07.23 11:36, Aneesh Kumar K V wrote:
>>>>>>> On 7/6/23 2:48 PM, David Hildenbrand wrote:
>>>>>>>> On 06.07.23 10:50, Aneesh Kumar K.V wrote:
>>>>>>>>> With memmap on memory, some architecture needs more details w.r.t altmap
>>>>>>>>> such as base_pfn, end_pfn, etc to unmap vmemmap memory.
>>>>>>>>
>>>>>>>> Can you elaborate why ppc64 needs that and x86-64 + aarch64 don't?
>>>>>>>>
>>>>>>>> IOW, why can't ppc64 simply allocate the vmemmap from the start of the memblock (-> base_pfn) and use the stored number of vmemmap pages to calculate the end_pfn?
>>>>>>>>
>>>>>>>> To rephrase: if the vmemmap is not at the beginning and doesn't cover full apgeblocks, memory onlining/offlining would be broken.
>>>>>>>>
>>>>>>>> [...]
>>>>>>>
>>>>>>>
>>>>>>> With ppc64 and 64K pagesize and different memory block sizes, we can end up allocating vmemmap backing memory from outside altmap because
>>>>>>> a single page vmemmap can cover 1024 pages (64 *1024/sizeof(struct page)). and that can point to pages outside the dev_pagemap range.
>>>>>>> So on free we  check
>>>>>>
>>>>>> So you end up with a mixture of altmap and ordinarily-allocated vmemmap pages? That sound wrong (and is counter-intuitive to the feature in general, where we *don't* want to allocate the vmemmap from outside the altmap).
>>>>>>
>>>>>> (64 * 1024) / sizeof(struct page) -> 1024 pages
>>>>>>
>>>>>> 1024 pages * 64k = 64 MiB.
>>>>>>
>>>>>> What's the memory block size on these systems? If it's >= 64 MiB the vmemmap of a single memory block fits into a single page and we should be fine.
>>>>>>
>>>>>> Smells like you want to disable the feature on a 64k system.
>>>>>>
>>>>>
>>>>> But that part of vmemmap_free is common for both dax,dax kmem and the new memmap on memory feature. ie, ppc64 vmemmap_free have checks which require
>>>>> a full altmap structure with all the details in. So for memmap on memmory to work on ppc64 we do require similar altmap struct. Hence the idea
>>>>> of adding vmemmap_altmap to  struct memory_block
>>>>
>>>> I'd suggest making sure that for the memmap_on_memory case your really *always* allocate from the altmap (that's what the feature is about after all), and otherwise block the feature (i.e., arch_mhp_supports_... should reject it).
>>>>
>>>
>>> Sure. How about?
>>>
>>> bool mhp_supports_memmap_on_memory(unsigned long size)
>>> {
>>>
>>>      unsigned long nr_pages = size >> PAGE_SHIFT;
>>>      unsigned long vmemmap_size = nr_pages * sizeof(struct page);
>>>
>>>      if (!radix_enabled())
>>>          return false;
>>>      /*
>>>       * memmap on memory only supported with memory block size add/remove
>>>       */
>>>      if (size != memory_block_size_bytes())
>>>          return false;
>>>      /*
>>>       * Also make sure the vmemmap allocation is fully contianed
>>>       * so that we always allocate vmemmap memory from altmap area.
>>>       */
>>>      if (!IS_ALIGNED(vmemmap_size,  PAGE_SIZE))
>>>          return false;
>>>      /*
>>>       * The pageblock alignment requirement is met by using
>>>       * reserve blocks in altmap.
>>>       */
>>>      return true;
>>> }
>>
>> Better, but the PAGE_SIZE that could be added to common code as well.
>>
>> ... but, the pageblock check in common code implies a PAGE_SIZE check, so why do we need any other check besides the radix_enabled() check for arm64 and just keep all the other checks in common code as they are?
>>
>> If your vmemmap does not cover full pageblocks (which implies full pages), the feature cannot be used *unless* we'd waste altmap space in the vmemmap to cover one pageblock.
>>
>> Wasting hotplugged memory certainly sounds wrong?
>>
>>
>> So I appreciate if you could explain why the pageblock check should not be had for ppc64?
>>
> 
> If we want things to be aligned to pageblock (2M) we will have to use 2M vmemmap space and that implies a memory block of 2G with 64K page size. That requirements makes the feature not useful at all
> on power. The compromise i came to was what i mentioned in the commit message for enabling the feature on ppc64.

As we'll always handle a 2M pageblock, you'll end up wasting memory.

Assume a 64MiB memory block:

With 64k: 1024 pages -> 64k vmemmap, almost 2 MiB wasted. ~3.1 %
With 4k: 16384 pages -> 1 MiB vmemmap, 1 MiB wasted. ~1.5%

It gets worse with smaller memory block sizes.


> 
> We  use altmap.reserve feature to align things correctly at pageblock granularity. We can end up loosing some pages in memory with this. For ex: with 256MB memory block
> size, we require 4 pages to map vmemmap pages, In order to align things correctly we end up adding a reserve of 28 pages. ie, for every 4096 pages
> 28 pages get reserved.


You can simply align-up the nr_vmemmap_pages up to pageblocks in the 
memory hotplug code (e.g., depending on a config/arch knob whether 
wasting memory is supported).

Because the pageblock granularity is a memory onlining/offlining 
limitation and should be checked+handled exactly there.

-- 
Cheers,

David / dhildenb

