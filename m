Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17197366CF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 23:25:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45K1zJ3PTtzDqZm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 07:25:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com;
 envelope-from=richard.weiyang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eLDsRwOh"; 
 dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45K1wY36ZczDqg8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 07:22:53 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id p26so31640edr.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2019 14:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XYR0qJWfd1D1ufm9G1S7XwxRI+/pUaRAjNUa1IxBLC8=;
 b=eLDsRwOhaZ0avYP5JbU/qyfKGB5DOL//jHeF0QIsj1xnkLpW3HfER5+1gHsFmyizdC
 TuPwJNXIJpeJwU2upcFzFr2gEM64wh1+94uumBqpRcHFkWQutwdt26Yv9sREHRvruvlk
 znKdHE2O7dSxq57NCvmgeA8foqkPAvf6tdKk+a+LkY6ICiZeCziK45J+jM2lAsYvL8tU
 +Q8RJK0GedIjFeQ+8FmqES5ccIjWGHSdcUNJ5Cq529NwrtvIRUY0YNg79G4IDKPEHmSd
 H8/CXuU0qTWRFEgsEUaYHo7abpCchUSLqryQVVOJdl4FKhHRIozaUGG29SyMvtoYQjn2
 iqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=XYR0qJWfd1D1ufm9G1S7XwxRI+/pUaRAjNUa1IxBLC8=;
 b=WBS0ewjvOljl5/SsZ4pvAUGtd7SbhTM7tBjArPalEI1tp45vj0PhFRPe2z+VPzvavx
 NOXWmQQXIlICDhBNDn/GC0YmknHJPXH1Zf72wm1UU6CIgxZuZ07qnKlF6FyH6NFt54JC
 XcRYxAYcsuC+IuAOWOPwLohVeanXYdenWcSSx+4dedvmvtsN3rK/P3wC1oyO5wEwU5B7
 FK9TdasdKKj78gt+QWQSllXf0l4ilLRUzd6CxLmXM1aIhmpYBsrRsehBkqXpjvAcoGC4
 xwsP4FVF0hZM2CjNkgrqSx0EtnYZhR10wqDspdD1ZEMj17II5uVq/p5PyW3v4XOh59bm
 HiBg==
X-Gm-Message-State: APjAAAWLwmUUwHDXk0O530Jwe9p8clYTCt7kIMk3hYuydHsg8hFyxtZ2
 4AnnqqAMPd1C93AUrdLXZ7w=
X-Google-Smtp-Source: APXvYqzyKS0phZCywdwPXToHaq30FkGf9zmLn9+DGARhqy7Cp0rjLbRZrzlUzgkPZspLLdcqpnQe5Q==
X-Received: by 2002:a50:927d:: with SMTP id j58mr11330969eda.230.1559769770516; 
 Wed, 05 Jun 2019 14:22:50 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id c7sm3853751ejz.71.2019.06.05.14.22.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 14:22:49 -0700 (PDT)
Date: Wed, 5 Jun 2019 21:22:49 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 07/11] mm/memory_hotplug: Create memory block devices
 after arch_add_memory()
Message-ID: <20190605212249.s7knac6vimealdmx@master>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-8-david@redhat.com>
 <20190604214234.ltwtkcdoju2gxisx@master>
 <f6523d67-cac9-1189-884a-67b6829320ba@redhat.com>
 <9a1d282f-8dd9-a48b-cc96-f9afaa435c62@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a1d282f-8dd9-a48b-cc96-f9afaa435c62@redhat.com>
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
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
 linux-mm@kvack.org, Arun KS <arunks@codeaurora.org>,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 "mike.travis@hpe.com" <mike.travis@hpe.com>, Qian Cai <cai@lca.pw>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>, Andrew Banman <andrew.banman@hpe.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Igor Mammedov <imammedo@redhat.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 05, 2019 at 12:58:46PM +0200, David Hildenbrand wrote:
>On 05.06.19 10:58, David Hildenbrand wrote:
>>>> /*
>>>>  * For now, we have a linear search to go find the appropriate
>>>>  * memory_block corresponding to a particular phys_index. If
>>>> @@ -658,6 +670,11 @@ static int init_memory_block(struct memory_block **memory, int block_id,
>>>> 	unsigned long start_pfn;
>>>> 	int ret = 0;
>>>>
>>>> +	mem = find_memory_block_by_id(block_id, NULL);
>>>> +	if (mem) {
>>>> +		put_device(&mem->dev);
>>>> +		return -EEXIST;
>>>> +	}
>>>
>>> find_memory_block_by_id() is not that close to the main idea in this patch.
>>> Would it be better to split this part?
>> 
>> I played with that but didn't like the temporary results (e.g. having to
>> export find_memory_block_by_id()). I'll stick to this for now.
>> 
>>>
>>>> 	mem = kzalloc(sizeof(*mem), GFP_KERNEL);
>>>> 	if (!mem)
>>>> 		return -ENOMEM;
>>>> @@ -699,44 +716,53 @@ static int add_memory_block(int base_section_nr)
>>>> 	return 0;
>>>> }
>>>>
>>>> +static void unregister_memory(struct memory_block *memory)
>>>> +{
>>>> +	if (WARN_ON_ONCE(memory->dev.bus != &memory_subsys))
>>>> +		return;
>>>> +
>>>> +	/* drop the ref. we got via find_memory_block() */
>>>> +	put_device(&memory->dev);
>>>> +	device_unregister(&memory->dev);
>>>> +}
>>>> +
>>>> /*
>>>> - * need an interface for the VM to add new memory regions,
>>>> - * but without onlining it.
>>>> + * Create memory block devices for the given memory area. Start and size
>>>> + * have to be aligned to memory block granularity. Memory block devices
>>>> + * will be initialized as offline.
>>>>  */
>>>> -int hotplug_memory_register(int nid, struct mem_section *section)
>>>> +int create_memory_block_devices(unsigned long start, unsigned long size)
>>>> {
>>>> -	int block_id = base_memory_block_id(__section_nr(section));
>>>> -	int ret = 0;
>>>> +	const int start_block_id = pfn_to_block_id(PFN_DOWN(start));
>>>> +	int end_block_id = pfn_to_block_id(PFN_DOWN(start + size));
>>>> 	struct memory_block *mem;
>>>> +	unsigned long block_id;
>>>> +	int ret = 0;
>>>>
>>>> -	mutex_lock(&mem_sysfs_mutex);
>>>> +	if (WARN_ON_ONCE(!IS_ALIGNED(start, memory_block_size_bytes()) ||
>>>> +			 !IS_ALIGNED(size, memory_block_size_bytes())))
>>>> +		return -EINVAL;
>>>>
>>>> -	mem = find_memory_block(section);
>>>> -	if (mem) {
>>>> -		mem->section_count++;
>>>> -		put_device(&mem->dev);
>>>> -	} else {
>>>> +	mutex_lock(&mem_sysfs_mutex);
>>>> +	for (block_id = start_block_id; block_id != end_block_id; block_id++) {
>>>> 		ret = init_memory_block(&mem, block_id, MEM_OFFLINE);
>>>> 		if (ret)
>>>> -			goto out;
>>>> -		mem->section_count++;
>>>> +			break;
>>>> +		mem->section_count = sections_per_block;
>>>> +	}
>>>> +	if (ret) {
>>>> +		end_block_id = block_id;
>>>> +		for (block_id = start_block_id; block_id != end_block_id;
>>>> +		     block_id++) {
>>>> +			mem = find_memory_block_by_id(block_id, NULL);
>>>> +			mem->section_count = 0;
>>>> +			unregister_memory(mem);
>>>> +		}
>>>> 	}
>>>
>>> Would it be better to do this in reverse order?
>>>
>>> And unregister_memory() would free mem, so it is still necessary to set
>>> section_count to 0?
>> 
>> 1. I kept the existing behavior (setting it to 0) for now. I am planning
>> to eventually remove the section count completely (it could be
>> beneficial to detect removing of partially populated memory blocks).
>
>Correction: We already use it to block offlining of partially populated
>memory blocks \o/

Would you mind letting me know where we leverage this?

>
>> 
>> 2. Reverse order: We would have to start with "block_id - 1", I don't
>> like that better.
>> 
>> Thanks for having a look!
>> 
>
>
>-- 
>
>Thanks,
>
>David / dhildenb

-- 
Wei Yang
Help you, Help me
