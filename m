Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CED194F2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 23:51:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450RrW1STxzDqRy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 07:51:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=richard.weiyang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NGl7wg2c"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450Rq51xvCzDqQY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 07:50:40 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id n17so3378059edb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2019 14:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BMlSqCqK74ztHAZfTWbqmYSf5DVD6ofjZO6Gjzp7WWI=;
 b=NGl7wg2cGVpKyD9cpJHljZftn+LLkSh0SgfYuUD7pOjyCs9Ci6mgnsJnI/5YX2u2sA
 N00ub+BHjZPR67iWK7zGrSKdc2FIKgprC22Vnd+8DssY7k0hLeRClyrdM+litkTcYs5z
 wn30Qa8o0THNaD/XsPLrjqCpWhF62kj/AuENHYy+QRCEAH6uviiC55pbVSOOb7LbHdGw
 b43TyiAMIlgHR0fXTDmkpRK1aekheRqQsoO5nwvkE4LFcuDJ1jZjKz5V1h8l0HDavI8L
 LGaLQ402+MxxhMuG/j6qecZBHC9qJ7cHkd3zoNCrkpuydFRs/uCvLnQVkbwD/RSUNA0G
 Zriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=BMlSqCqK74ztHAZfTWbqmYSf5DVD6ofjZO6Gjzp7WWI=;
 b=CaKQzFlNBwJZabNjuZAy/U3HyKFtJKLPSHEwCQuiyr0jaFxsUVjTr41JJslWodbiYx
 DF8BHAP5hzmSx9yA/HhEBlCI1drtVp9y/qtPHulNROBPfGVxTDSDi8TFhiOsIy6eo3SA
 9Mj4z5U/J4++7SpoYYxtlTnnU/I6Y5Po3rE26SLbugCl+tHZpDobCQDrBxmz0ybHrPzt
 0d4jqG+OlgouJZPkZDnqxGUp/+XgiHJbcYnIb3VMY+H/E7vue5qARxOE2kFxZyrm15Vv
 19CZhTKJHF0oUI96UMi8ZZDxqiU+fAHJtMYM4yhUr1VcNlHKAncMTTeVzMNcbA5MMMir
 4s0g==
X-Gm-Message-State: APjAAAVoBBiLbrAsOQIx+3eBfVN8g6SinvPYd2qpDc+mNBWR0ImD7nw8
 KSsiO6f8/3Tj3pJ/+vbneTU=
X-Google-Smtp-Source: APXvYqymBHLkj8Y+oaiwW9YuwNj6GLPLzc74NUHJXE/g8FqI3LUNlHjOkXv2ihOrqJ30gkhHPU8rNA==
X-Received: by 2002:a17:906:45c3:: with SMTP id
 z3mr5444210ejq.134.1557438636558; 
 Thu, 09 May 2019 14:50:36 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id v35sm890246edc.4.2019.05.09.14.50.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 May 2019 14:50:35 -0700 (PDT)
Date: Thu, 9 May 2019 21:50:34 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 4/8] mm/memory_hotplug: Create memory block devices
 after arch_add_memory()
Message-ID: <20190509215034.jl2qejw3pzqtbu5d@master>
References: <20190507183804.5512-1-david@redhat.com>
 <20190507183804.5512-5-david@redhat.com>
 <20190509143151.zexjmwu3ikkmye7i@master>
 <28071389-372c-14eb-1209-02464726b4f0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28071389-372c-14eb-1209-02464726b4f0@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 Pavel Tatashin <pasha.tatashin@soleen.com>, linux-sh@vger.kernel.org,
 "mike.travis@hpe.com" <mike.travis@hpe.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Mathieu Malaterre <malat@debian.org>,
 linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
 linux-mm@kvack.org, Andrew Banman <andrew.banman@hpe.com>,
 Qian Cai <cai@lca.pw>, Arun KS <arunks@codeaurora.org>,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 09, 2019 at 04:58:56PM +0200, David Hildenbrand wrote:
>On 09.05.19 16:31, Wei Yang wrote:
>> On Tue, May 07, 2019 at 08:38:00PM +0200, David Hildenbrand wrote:
>>> Only memory to be added to the buddy and to be onlined/offlined by
>>> user space using memory block devices needs (and should have!) memory
>>> block devices.
>>>
>>> Factor out creation of memory block devices Create all devices after
>>> arch_add_memory() succeeded. We can later drop the want_memblock parameter,
>>> because it is now effectively stale.
>>>
>>> Only after memory block devices have been added, memory can be onlined
>>> by user space. This implies, that memory is not visible to user space at
>>> all before arch_add_memory() succeeded.
>>>
>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Cc: "mike.travis@hpe.com" <mike.travis@hpe.com>
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: Ingo Molnar <mingo@kernel.org>
>>> Cc: Andrew Banman <andrew.banman@hpe.com>
>>> Cc: Oscar Salvador <osalvador@suse.de>
>>> Cc: Michal Hocko <mhocko@suse.com>
>>> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
>>> Cc: Qian Cai <cai@lca.pw>
>>> Cc: Wei Yang <richard.weiyang@gmail.com>
>>> Cc: Arun KS <arunks@codeaurora.org>
>>> Cc: Mathieu Malaterre <malat@debian.org>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>> drivers/base/memory.c  | 70 ++++++++++++++++++++++++++----------------
>>> include/linux/memory.h |  2 +-
>>> mm/memory_hotplug.c    | 15 ++++-----
>>> 3 files changed, 53 insertions(+), 34 deletions(-)
>>>
>>> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
>>> index 6e0cb4fda179..862c202a18ca 100644
>>> --- a/drivers/base/memory.c
>>> +++ b/drivers/base/memory.c
>>> @@ -701,44 +701,62 @@ static int add_memory_block(int base_section_nr)
>>> 	return 0;
>>> }
>>>
>>> +static void unregister_memory(struct memory_block *memory)
>>> +{
>>> +	BUG_ON(memory->dev.bus != &memory_subsys);
>>> +
>>> +	/* drop the ref. we got via find_memory_block() */
>>> +	put_device(&memory->dev);
>>> +	device_unregister(&memory->dev);
>>> +}
>>> +
>>> /*
>>> - * need an interface for the VM to add new memory regions,
>>> - * but without onlining it.
>>> + * Create memory block devices for the given memory area. Start and size
>>> + * have to be aligned to memory block granularity. Memory block devices
>>> + * will be initialized as offline.
>>>  */
>>> -int hotplug_memory_register(int nid, struct mem_section *section)
>>> +int hotplug_memory_register(unsigned long start, unsigned long size)
>> 
>> One trivial suggestion about the function name.
>> 
>> For memory_block device, sometimes we use the full name
>> 
>>     find_memory_block
>>     init_memory_block
>>     add_memory_block
>> 
>> But sometimes we use *nick* name
>> 
>>     hotplug_memory_register
>>     register_memory
>>     unregister_memory
>> 
>> This is a little bit confusion.
>> 
>> Can we use one name convention here?
>
>We can just go for
>
>crate_memory_blocks() and free_memory_blocks(). Or do
>you have better suggestions?

s/crate/create/

Looks good to me.

>
>(I would actually even prefer "memory_block_devices", because memory
>blocks have different meanins)
>

Agree with you, this comes to my mind sometime ago :-)

>> 
>> [...]
>> 
>>> /*
>>> @@ -1106,6 +1100,13 @@ int __ref add_memory_resource(int nid, struct resource *res)
>>> 	if (ret < 0)
>>> 		goto error;
>>>
>>> +	/* create memory block devices after memory was added */
>>> +	ret = hotplug_memory_register(start, size);
>>> +	if (ret) {
>>> +		arch_remove_memory(nid, start, size, NULL);
>> 
>> Functionally, it works I think.
>> 
>> But arch_remove_memory() would remove pages from zone. At this point, we just
>> allocate section/mmap for pages, the zones are empty and pages are not
>> connected to zone.
>> 
>> Function  zone = page_zone(page); always gets zone #0, since pages->flags is 0
>> at  this point. This is not exact.
>> 
>> Would we add some comment to mention this? Or we need to clean up
>> arch_remove_memory() to take out __remove_zone()?
>
>That is precisely what is on my list next (see cover letter).This is
>already broken when memory that was never onlined is removed again.
>So I am planning to fix that independently.
>

Sounds great :-)

Hope you would cc me in the following series.

>
>-- 
>
>Thanks,
>
>David / dhildenb

-- 
Wei Yang
Help you, Help me
