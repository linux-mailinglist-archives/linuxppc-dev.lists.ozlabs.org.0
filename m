Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A64A743F6E6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 07:58:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgWtv3k75z3c7Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 16:58:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=4esLcT6e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=4esLcT6e; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgWtB3tlKz2xZL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 16:57:34 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id oa4so6475881pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 22:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=wU9Wh30nFzjpzSHHHUZl7PLoISlwQu0iWze8HfOwvb4=;
 b=4esLcT6eHQkHBkZjL0J1Py/82DlIOkee7etf4K6FnZtPg3dkw7YQ/5M7bzCZg8rwB8
 aOX7WVyP/Vlgx9656NBbwq9wEtpFa8y7RyZznbq3NXKBjsS0+fmOq5PgP8Ls4Uy2kreW
 GYyS5/IfwM4S9igcrlZEqU+utsPOLEQH1mGJdtWZGN0DLgsQr3YUOKJSRJXX6UVzcKky
 kEORqiCpSoNnbuLf24I+hs0ziUkB7CdyzSFPFtFvbZfgiraJYyKjVRwDazgfl3hE3HV4
 HqOu3UoPhTz2uD+5t95jdjF7tqUobcTRTe5DMgGBSWI1lD64rS6Db5iLBECtgY0Snv16
 bPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wU9Wh30nFzjpzSHHHUZl7PLoISlwQu0iWze8HfOwvb4=;
 b=bOwmZquIG1rb8lrEsK1PRETdQKcSA8QQWl0Oj9IxuF6h3qettvxKbjIoDx3rFLiLL1
 0QOj9S0QukwJWwBP/9GBxSEW5K2KPoEnuAIuELf0dRhU0Ds80ww6lKC/ie2DvBJ5fIt0
 TgvEQp3SCr75HKlG0W0by3eCynQsjV+CGausnHKdxbfCleu9gKofRrF+kSiyHh99t+wu
 F6cdslmkvx3ajHYDPtrNkO1nqdDfIUioZxDqfI06bvbjX5QtONYyxayTew1jLjE7Cp2l
 /3mCRPUdndS9qPfAfWTyMtRB2tsCG/HKWDpZym7jVHqs9gOzo2ZaPOgYXe591tJTEZKX
 fTng==
X-Gm-Message-State: AOAM5320y1/waXHSajX3A5ZAMxPhwQUQglCHD4xZYDh/4JRtboWTfQkY
 nqDmtNtclmiaasImADk/Wsrh8a/hz+E0oQ==
X-Google-Smtp-Source: ABdhPJykL95loW8/0kTFk8LWQmkejExxkf7aeh/XT12KL8s2NS1O4LoxUMjMieUrdhEHTIqmeZhrww==
X-Received: by 2002:a17:902:a983:b0:141:9407:1fb3 with SMTP id
 bh3-20020a170902a98300b0014194071fb3mr6317350plb.35.1635487051703; 
 Thu, 28 Oct 2021 22:57:31 -0700 (PDT)
Received: from [192.168.10.153] (124-171-108-209.dyn.iinet.net.au.
 [124.171.108.209])
 by smtp.gmail.com with ESMTPSA id x2sm4683698pjd.50.2021.10.28.22.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 22:57:31 -0700 (PDT)
Message-ID: <a4ac5625-d0b4-c862-2e40-d7fbb7b1a702@ozlabs.ru>
Date: Fri, 29 Oct 2021 16:57:27 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0
Subject: Re: [PATCH] powerpc: Enhance pmem DMA bypass handling
Content-Language: en-US
To: Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20211021174449.120875-1-brking@linux.vnet.ibm.com>
 <84b82d2b-1263-39bb-d966-b432af530ca8@ozlabs.ru>
 <e4120ddc-8cac-c722-2379-ecc44bd9ef89@linux.vnet.ibm.com>
 <3d1dcfa3-23a7-cb7f-8671-2198861987e6@ozlabs.ru>
 <f9af9834-797f-cd69-bbcf-3663ce375c72@linux.vnet.ibm.com>
 <a2537ac0-cee3-31d3-73da-7d9de860f602@ozlabs.ru>
 <2075ad89-09d5-6906-f8fe-83a2347bbe9d@linux.vnet.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <2075ad89-09d5-6906-f8fe-83a2347bbe9d@linux.vnet.ibm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 28/10/2021 08:30, Brian King wrote:
> On 10/26/21 12:39 AM, Alexey Kardashevskiy wrote:
>>
>>
>> On 10/26/21 01:40, Brian King wrote:
>>> On 10/23/21 7:18 AM, Alexey Kardashevskiy wrote:
>>>>
>>>>
>>>> On 23/10/2021 07:18, Brian King wrote:
>>>>> On 10/22/21 7:24 AM, Alexey Kardashevskiy wrote:
>>>>>>
>>>>>>
>>>>>> On 22/10/2021 04:44, Brian King wrote:
>>>>>>> If ibm,pmemory is installed in the system, it can appear anywhere
>>>>>>> in the address space. This patch enhances how we handle DMA for devices when
>>>>>>> ibm,pmemory is present. In the case where we have enough DMA space to
>>>>>>> direct map all of RAM, but not ibm,pmemory, we use direct DMA for
>>>>>>> I/O to RAM and use the default window to dynamically map ibm,pmemory.
>>>>>>> In the case where we only have a single DMA window, this won't work, > so if the window is not big enough to map the entire address range,
>>>>>>> we cannot direct map.
>>>>>>
>>>>>> but we want the pmem range to be mapped into the huge DMA window too if we can, why skip it?
>>>>>
>>>>> This patch should simply do what the comment in this commit mentioned below suggests, which says that
>>>>> ibm,pmemory can appear anywhere in the address space. If the DMA window is large enough
>>>>> to map all of MAX_PHYSMEM_BITS, we will indeed simply do direct DMA for everything,
>>>>> including the pmem. If we do not have a big enough window to do that, we will do
>>>>> direct DMA for DRAM and dynamic mapping for pmem.
>>>>
>>>>
>>>> Right, and this is what we do already, do not we? I missing something here.
>>>
>>> The upstream code does not work correctly that I can see. If I boot an upstream kernel
>>> with an nvme device and vpmem assigned to the LPAR, and enable dev_dbg in arch/powerpc/platforms/pseries/iommu.c,
>>> I see the following in the logs:
>>>
>>> [    2.157549] nvme 0121:50:00.0: ibm,query-pe-dma-windows(53) 500000 8000000 20000121 returned 0
>>> [    2.157561] nvme 0121:50:00.0: Skipping ibm,pmemory
>>> [    2.157567] nvme 0121:50:00.0: can't map partition max 0x8000000000000 with 16777216 65536-sized pages
>>> [    2.170150] nvme 0121:50:00.0: ibm,create-pe-dma-window(54) 500000 8000000 20000121 10 28 returned 0 (liobn = 0x70000121 starting addr = 8000000 0)
>>> [    2.170170] nvme 0121:50:00.0: created tce table LIOBN 0x70000121 for /pci@800000020000121/pci1014,683@0
>>> [    2.356260] nvme 0121:50:00.0: node is /pci@800000020000121/pci1014,683@0
>>>
>>> This means we are heading down the leg in enable_ddw where we do not set direct_mapping to true. We use
>>> create the DDW window, but don't do any direct DMA. This is because the window is not large enough to
>>> map 2PB of memory, which is what ddw_memory_hotplug_max returns without my patch.
>>>
>>> With my patch applied, I get this in the logs:
>>>
>>> [    2.204866] nvme 0121:50:00.0: ibm,query-pe-dma-windows(53) 500000 8000000 20000121 returned 0
>>> [    2.204875] nvme 0121:50:00.0: Skipping ibm,pmemory
>>> [    2.205058] nvme 0121:50:00.0: ibm,create-pe-dma-window(54) 500000 8000000 20000121 10 21 returned 0 (liobn = 0x70000121 starting addr = 8000000 0)
>>> [    2.205068] nvme 0121:50:00.0: created tce table LIOBN 0x70000121 for /pci@800000020000121/pci1014,683@0
>>> [    2.215898] nvme 0121:50:00.0: iommu: 64-bit OK but direct DMA is limited by 800000200000000
>>>
>>
>>
>> ah I see. then...
>>
>>
>>>
>>> Thanks,
>>>
>>> Brian
>>>
>>>
>>>>
>>>>>
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/powerpc/platforms/pseries/iommu.c?id=bf6e2d562bbc4d115cf322b0bca57fe5bbd26f48
>>>>>
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Brian
>>>>>
>>>>>
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
>>>>>>> ---
>>>>>>>     arch/powerpc/platforms/pseries/iommu.c | 19 ++++++++++---------
>>>>>>>     1 file changed, 10 insertions(+), 9 deletions(-)
>>>>>>>
>>>>>>> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
>>>>>>> index 269f61d519c2..d9ae985d10a4 100644
>>>>>>> --- a/arch/powerpc/platforms/pseries/iommu.c
>>>>>>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>>>>>>> @@ -1092,15 +1092,6 @@ static phys_addr_t ddw_memory_hotplug_max(void)
>>>>>>>         phys_addr_t max_addr = memory_hotplug_max();
>>>>>>>         struct device_node *memory;
>>>>>>>     -    /*
>>>>>>> -     * The "ibm,pmemory" can appear anywhere in the address space.
>>>>>>> -     * Assuming it is still backed by page structs, set the upper limit
>>>>>>> -     * for the huge DMA window as MAX_PHYSMEM_BITS.
>>>>>>> -     */
>>>>>>> -    if (of_find_node_by_type(NULL, "ibm,pmemory"))
>>>>>>> -        return (sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ?
>>>>>>> -            (phys_addr_t) -1 : (1ULL << MAX_PHYSMEM_BITS);
>>>>>>> -
>>>>>>>         for_each_node_by_type(memory, "memory") {
>>>>>>>             unsigned long start, size;
>>>>>>>             int n_mem_addr_cells, n_mem_size_cells, len;
>>>>>>> @@ -1341,6 +1332,16 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>>>>>>>          */
>>>>>>>         len = max_ram_len;
>>>>>>>         if (pmem_present) {
>>>>>>> +        if (default_win_removed) {
>>>>>>> +            /*
>>>>>>> +             * If we only have one DMA window and have pmem present,
>>>>>>> +             * then we need to be able to map the entire address
>>>>>>> +             * range in order to be able to do direct DMA to RAM.
>>>>>>> +             */
>>>>>>> +            len = order_base_2((sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ?
>>>>>>> +                    (phys_addr_t) -1 : (1ULL << MAX_PHYSMEM_BITS));


Sorry I am still not following. If pmem is present, this new chunk will 
extend @len to MAX_PHYSMEM_BITS but the same will do the code right 
after this new chunk. How does removing the default window alters any of 
this?

If the only window is removed and we can only have one window which does 
not cover MAX_PHYSMEM_BITS, then we do not try 1:1 at all. Reverting
54fc3c681ded9437e4548e250 (which added pmem to phys_addr_t 
ddw_memory_hotplug_max(void) should be enough, no?


>>
>>
>> ... len = (sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ? 31 :
>> MAX_PHYSMEM_BITS  ?
>>
>> Or actually simply drop this hunk and only leave the first one and add
>> this instead:
>>
>>
>> diff --git a/arch/powerpc/platforms/pseries/iommu.c
>> b/arch/powerpc/platforms/pseries/iommu.c
>> index 591ec9e94edb..68bfcd2227d9 100644
>> --- a/arch/powerpc/platforms/pseries/iommu.c
>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>> @@ -1518,7 +1518,7 @@ static bool enable_ddw(struct pci_dev *dev, struct
>> device_node *pdn)
>>           * as RAM, then we failed to create a window to cover persistent
>>           * memory and need to set the DMA limit.
>>           */
>> -       if (pmem_present && ddw_enabled && direct_mapping && len ==
>> max_ram_len)
>> +       if (pmem_present && ddw_enabled && direct_mapping)
>>
>> ?
> 
> 
> So, this would change the handling of devices that have a single window when pmem
> is present. 

Yeah, that was not right, never mind.

> With your proposed change, we would then direct map for DRAM
> and attempt to use whatever TCE space is left to do the dynamic mapping
> when DMA'ing to the pmem, all from a single window. We don't account for this
> in the code from what I can see, so we could get into the scenario where we have
> a DMA window just large enough to map all of DRAM, we direct map that, and then
> have nothing left over for the pmem.
> 
> I would actually like to get this working, as it would be helpful for the performance
> of SR-IOV devices when pmem is present. However, I think we'd need to ensure we
> have at least a certain amount of reserved DMA space for the dynamic mapping
> before we do. There might be other things to consider as well...
> 
> Should we handle that as a further enhancement in a future patch, and move forward with this
> as a bug fix?

I am still struggling to see what the second hunk fixes exactly. Thanks,


> 
> Thanks,
> 
> Brian
> 
>>
>> Thanks,
>>
>>
>>
>>>>>>> +        }
>>>>>>> +
>>>>>>>             if (query.largest_available_block >=
>>>>>>>                 (1ULL << (MAX_PHYSMEM_BITS - page_shift)))
>>>>>>>                 len = MAX_PHYSMEM_BITS;
>>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>
>>>
>>>
>>
> 
> 

-- 
Alexey
