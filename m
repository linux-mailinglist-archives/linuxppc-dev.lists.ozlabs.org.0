Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC745763CC6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 18:44:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IvzgcL/C;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IvzgcL/C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RB09h5l7Kz3c3C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 02:44:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IvzgcL/C;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IvzgcL/C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RB08l411Nz2yGs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 02:43:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690389829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eYyLIb3cAz+pfX2bhGfoxws54fDawRj2oU07jpEMHJk=;
	b=IvzgcL/CsAFr5dqlHc8AOCGM3TFQaoo8XbuUazDP/74egE5WdUP03bwr/pnlut8WKEIgnv
	XgDPkGJ8qDuQoAokcAaZTeffApa2wKMocnOQb0sLs8R48rAii2TC14SyP1LG5Pc4N6KgCu
	zjSNAybsO9GyZzFSgmtm3QJ2VvfQAkQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690389829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eYyLIb3cAz+pfX2bhGfoxws54fDawRj2oU07jpEMHJk=;
	b=IvzgcL/CsAFr5dqlHc8AOCGM3TFQaoo8XbuUazDP/74egE5WdUP03bwr/pnlut8WKEIgnv
	XgDPkGJ8qDuQoAokcAaZTeffApa2wKMocnOQb0sLs8R48rAii2TC14SyP1LG5Pc4N6KgCu
	zjSNAybsO9GyZzFSgmtm3QJ2VvfQAkQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-rrBWZ3J0MAiGk0IvJDW6pg-1; Wed, 26 Jul 2023 12:43:47 -0400
X-MC-Unique: rrBWZ3J0MAiGk0IvJDW6pg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3fbdd5d09b8so43106725e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 09:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690389826; x=1690994626;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eYyLIb3cAz+pfX2bhGfoxws54fDawRj2oU07jpEMHJk=;
        b=e/OsvlBu6g4EhTXfHoNy7lVqLohrl9QDwOvjI1q/+21a2TsDIF3FvN+F8/7+Imlsu+
         58wYMV5MYzfdhHsdkLd0cPkozpn90U/ei1YOpGixygz0DlOwxCGfB8kVqgkE025Wuc3c
         eqc2f58zF8gEt7/IHmsf37masEpoT/pDK5UJZmSC6voelBNNL5SmcC9EYZZiDwtjAO6I
         eMYyXpcHYBwyb7g465PWJQlRAzF1q53YmIyhKbiL6Tpuel1VmOWjlN2oS1vKsNOHabM1
         212pzIEWgbuS4DGraUSUe3rFMB04ZelGAreDZcjXVXnKS6VPQtdQZHmm764ymBZqBCii
         HDVw==
X-Gm-Message-State: ABy/qLaRc2PDve2VpCW8nWvsipbKYM0lSjA0gy46Xlz0v3C7gjD0N/T7
	Pd8RkV3Xi5M8GD709Ds8gNQZ1lgpowA4YXeLKKwaf8FVuU2cxnG4X1otwSoSE4Dqu3VDb5ax53I
	T/soDx2tt2F6nNeOuOaTupR3ECQ==
X-Received: by 2002:a05:600c:234a:b0:3fb:a937:6024 with SMTP id 10-20020a05600c234a00b003fba9376024mr1856850wmq.29.1690389825917;
        Wed, 26 Jul 2023 09:43:45 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHTWQ0vXQsl72sdiZMvhOQa/+Rk0rY3XwcgMajaulp8YNtfY27UWEaCR+WRZNqpblW/Z9FbwA==
X-Received: by 2002:a05:600c:234a:b0:3fb:a937:6024 with SMTP id 10-20020a05600c234a00b003fba9376024mr1856823wmq.29.1690389825430;
        Wed, 26 Jul 2023 09:43:45 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:f600:a519:c50:799b:f1e3? (p200300cbc705f600a5190c50799bf1e3.dip0.t-ipconnect.de. [2003:cb:c705:f600:a519:c50:799b:f1e3])
        by smtp.gmail.com with ESMTPSA id f9-20020a7bc8c9000000b003fa96fe2bd9sm2493280wml.22.2023.07.26.09.43.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 09:43:45 -0700 (PDT)
Message-ID: <65d2143d-ef76-cbe5-6d49-08953caa3b3b@redhat.com>
Date: Wed, 26 Jul 2023 18:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 6/7] mm/hotplug: Embed vmem_altmap details in memory
 block
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230725100212.531277-1-aneesh.kumar@linux.ibm.com>
 <20230725100212.531277-7-aneesh.kumar@linux.ibm.com>
 <aa27b96e-5296-0324-d9d3-07ab1ee969d0@redhat.com>
 <87wmynvu9k.fsf@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <87wmynvu9k.fsf@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 26.07.23 12:31, Aneesh Kumar K.V wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> On 25.07.23 12:02, Aneesh Kumar K.V wrote:
>>> With memmap on memory, some architecture needs more details w.r.t altmap
>>> such as base_pfn, end_pfn, etc to unmap vmemmap memory. Instead of
>>> computing them again when we remove a memory block, embed vmem_altmap
>>> details in struct memory_block if we are using memmap on memory block
>>> feature.
>>>
>>> No functional change in this patch
>>>
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ---
>>
>> [...]
>>
>>>    
>>>    static int add_memory_block(unsigned long block_id, unsigned long state,
>>> -			    unsigned long nr_vmemmap_pages,
>>> +			    struct vmem_altmap *altmap,
>>>    			    struct memory_group *group)
>>>    {
>>>    	struct memory_block *mem;
>>> @@ -744,7 +751,14 @@ static int add_memory_block(unsigned long block_id, unsigned long state,
>>>    	mem->start_section_nr = block_id * sections_per_block;
>>>    	mem->state = state;
>>>    	mem->nid = NUMA_NO_NODE;
>>> -	mem->nr_vmemmap_pages = nr_vmemmap_pages;
>>> +	if (altmap) {
>>> +		mem->altmap = kmalloc(sizeof(struct vmem_altmap), GFP_KERNEL);
>>> +		if (!mem->altmap) {
>>> +			kfree(mem);
>>> +			return -ENOMEM;
>>> +		}
>>> +		memcpy(mem->altmap, altmap, sizeof(*altmap));
>>> +	}
>>
>> I'm wondering if we should instead let the caller do the alloc/free. So we would alloc
>> int the caller and would only store the pointer.
>>
>> Before removing the memory block, we would clear the pointer and free it in the caller.
>>
>> IOW, when removing a memory block and we still have an altmap set, something would be wrong.
>>
>> See below on try_remove_memory() handling.
>>
>> [...]
>>
>>> -static int get_nr_vmemmap_pages_cb(struct memory_block *mem, void *arg)
>>> +static int get_vmemmap_altmap_cb(struct memory_block *mem, void *arg)
>>>    {
>>> +	struct vmem_altmap *altmap = (struct vmem_altmap *)arg;
>>>    	/*
>>> -	 * If not set, continue with the next block.
>>> +	 * If we have any pages allocated from altmap
>>> +	 * return the altmap details and break callback.
>>>    	 */
>>> -	return mem->nr_vmemmap_pages;
>>> +	if (mem->altmap) {
>>> +		memcpy(altmap, mem->altmap, sizeof(struct vmem_altmap));
>>> +		return 1;
>>> +	}
>>> +	return 0;
>>>    }
>>>    
>>>    static int check_cpu_on_node(int nid)
>>> @@ -2146,9 +2152,8 @@ EXPORT_SYMBOL(try_offline_node);
>>>    
>>>    static int __ref try_remove_memory(u64 start, u64 size)
>>>    {
>>> -	struct vmem_altmap mhp_altmap = {};
>>> -	struct vmem_altmap *altmap = NULL;
>>> -	unsigned long nr_vmemmap_pages;
>>> +	int ret;
>>> +	struct vmem_altmap mhp_altmap, *altmap = NULL;
>>>    	int rc = 0, nid = NUMA_NO_NODE;
>>>    
>>>    	BUG_ON(check_hotplug_memory_range(start, size));
>>> @@ -2171,24 +2176,15 @@ static int __ref try_remove_memory(u64 start, u64 size)
>>>    	 * the same granularity it was added - a single memory block.
>>>    	 */
>>>    	if (mhp_memmap_on_memory()) {
>>> -		nr_vmemmap_pages = walk_memory_blocks(start, size, NULL,
>>> -						      get_nr_vmemmap_pages_cb);
>>> -		if (nr_vmemmap_pages) {
>>> +		ret = walk_memory_blocks(start, size, &mhp_altmap,
>>> +					 get_vmemmap_altmap_cb);
>>> +		if (ret) {
>>>    			if (size != memory_block_size_bytes()) {
>>>    				pr_warn("Refuse to remove %#llx - %#llx,"
>>>    					"wrong granularity\n",
>>>    					start, start + size);
>>>    				return -EINVAL;
>>>    			}
>>> -
>>> -			/*
>>> -			 * Let remove_pmd_table->free_hugepage_table do the
>>> -			 * right thing if we used vmem_altmap when hot-adding
>>> -			 * the range.
>>> -			 */
>>> -			mhp_altmap.base_pfn = PHYS_PFN(start);
>>> -			mhp_altmap.free = nr_vmemmap_pages;
>>> -			mhp_altmap.alloc = nr_vmemmap_pages;
>>>    			altmap = &mhp_altmap;
>>>    		}
>>
>>
>> Instead of that, I suggest (whitespace damage expected):
>>
>> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>> index 3f231cf1b410..f6860df64549 100644
>> --- a/mm/memory_hotplug.c
>> +++ b/mm/memory_hotplug.c
>> @@ -1956,12 +1956,19 @@ static int check_memblock_offlined_cb(struct memory_block *mem, void *arg)
>>           return 0;
>>    }
>>    
>> -static int get_nr_vmemmap_pages_cb(struct memory_block *mem, void *arg)
>> +static int test_has_altmap_cb(struct memory_block *mem, void *arg)
>>    {
>> -       /*
>> -        * If not set, continue with the next block.
>> -        */
>> -       return mem->nr_vmemmap_pages;
>> +       struct memory_block **mem_ptr = (struct memory_block **)arg;
>> +
>> +       if (mem->altmap) {
>> +               /*
>> +                * We're not taking a reference on the memory block; it
>> +                * it cannot vanish while we're about to that memory ourselves.
>> +                */
>> +               *mem_ptr = mem;
>> +               return 1;
>> +       }
>> +       return 0;
>>    }
>>    
>>    static int check_cpu_on_node(int nid)
>> @@ -2036,9 +2043,7 @@ EXPORT_SYMBOL(try_offline_node);
>>    
>>    static int __ref try_remove_memory(u64 start, u64 size)
>>    {
>> -       struct vmem_altmap mhp_altmap = {};
>>           struct vmem_altmap *altmap = NULL;
>> -       unsigned long nr_vmemmap_pages;
>>           int rc = 0, nid = NUMA_NO_NODE;
>>    
>>           BUG_ON(check_hotplug_memory_range(start, size));
>> @@ -2061,9 +2066,9 @@ static int __ref try_remove_memory(u64 start, u64 size)
>>            * the same granularity it was added - a single memory block.
>>            */
>>           if (mhp_memmap_on_memory()) {
>> -               nr_vmemmap_pages = walk_memory_blocks(start, size, NULL,
>> -                                                     get_nr_vmemmap_pages_cb);
>> -               if (nr_vmemmap_pages) {
>> +               struct memory_block *mem;
>> +
>> +               if (walk_memory_blocks(start, size, &mem, test_has_altmap_cb)) {
>>                           if (size != memory_block_size_bytes()) {
>>                                   pr_warn("Refuse to remove %#llx - %#llx,"
>>                                           "wrong granularity\n",
>> @@ -2072,12 +2077,11 @@ static int __ref try_remove_memory(u64 start, u64 size)
>>                           }
>>    
>>                           /*
>> -                        * Let remove_pmd_table->free_hugepage_table do the
>> -                        * right thing if we used vmem_altmap when hot-adding
>> -                        * the range.
>> +                        * Clear the altmap from the memory block before we
>> +                        * remove it; we'll take care of freeing the altmap.
>>                            */
>> -                       mhp_altmap.alloc = nr_vmemmap_pages;
>> -                       altmap = &mhp_altmap;
>> +                       altmap = mem->altmap;
>> +                       mem->altmap = NULL;
>>                   }
>>           }
>>    
>> @@ -2094,6 +2098,9 @@ static int __ref try_remove_memory(u64 start, u64 size)
>>    
>>           arch_remove_memory(start, size, altmap);
>>    
>> +       if (altmap)
>> +               kfree(altmap);
>> +
>>           if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK)) {
>>                   memblock_phys_free(start, size);
>>                   memblock_remove(start, size);
>>
> 
> Is this any better. Any specific reason we want the alloc and free in
> the caller?


IMHO if you only have a single instance you don't have to worry about 
any inconsistencies. At least to me it looks cleaner than this copying 
back and forth.

Below is better, but as you pointed out, your get_vmemmap_altmap_cb() 
change is problematic/insufficient.

-- 
Cheers,

David / dhildenb

