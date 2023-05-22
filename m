Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E1E70B257
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 May 2023 02:09:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QPd9n2FRVz3cgx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 May 2023 10:09:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20221208.gappssmtp.com header.i=@ozlabs-ru.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=NUOb/jbo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20221208.gappssmtp.com header.i=@ozlabs-ru.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=NUOb/jbo;
	dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QPd8s5tQ4z3bxC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 May 2023 10:08:58 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so4797532a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 May 2023 17:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20221208.gappssmtp.com; s=20221208; t=1684714135; x=1687306135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Be/kRqRbthWu0MpU7LUMEhGb029dhwb9seRx1JjwSrQ=;
        b=NUOb/jboy/Gqc4zNKPYmV/iHYe9aD4uvgsGsBCTrJEvWq0Q0De5GPhGREC7GByTh4k
         jy9W4x32vccvZ/ixvxEGHi660svu4kDYnWHlbmC5477Gg5F5TIblCURzs5ySuHWAbKZt
         BPU5pzYblVsODBtF+dr5rhqvq7wgHVE9Ms2ULvapJYN+ktNE6WSB9kI17l7Nnm7RhJvK
         3pjiUuHSiq/ZCgf+Lg1uIvoUMCMyVzCBujEEeIMoleisrne8T94mHcVVtt3BRcMjDyWZ
         9N16SggDKbQmVZV3lrm22895vO9hKdcqmXQ+ZeobO87q9NpU45sOIPTJEWIFsrGgdESg
         5I1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684714135; x=1687306135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Be/kRqRbthWu0MpU7LUMEhGb029dhwb9seRx1JjwSrQ=;
        b=LdKr4q3LH4V/Pdfg7MspyOS+vLbVGnpNDly+0hRRMX5Ak/iNdmB2ZjUMc7Maqg1I6s
         z5ojK74EW/0wUXi9EVBUvI+mPc+waMnobNaO090/h5gmRgsZ5cc4zhG9/Puy5/bhmSTI
         RuKbNcLS4bVvnsezcWVqu+tqLQ3ISJxOaQob+1shnN3R9d0jogM8RF092YaoxKpLXOxG
         LHAYyVhpYIbvWTiq+xERAY0Mjf45iSYKWTPAF/TPfK65LSWB0TpkCw2UeZmNcf51jdJs
         QNIlcF9+ZCGgy7kOHD5rulvYDX//NK+3y8elqbJcVvXVGmjg1E16Nk3FtoQG7wa8hXrJ
         qrNg==
X-Gm-Message-State: AC+VfDxRkp7gRJ7FWRc/NCYX0T7CkaIo3MIGlQseMt4wmxsumLBXN+4X
	LsUcqUA1TuftEtx8K7ylluAAAkczzYxsfju8x/4=
X-Google-Smtp-Source: ACHHUZ7JPdSDbE5qNZlFsB0mFpzMRb4aApO3j4eLFHVeSyeoWe0BWYxNoUBZfb40TphoTUfnoK6jVg==
X-Received: by 2002:a17:902:e541:b0:1a6:6f3f:bc3 with SMTP id n1-20020a170902e54100b001a66f3f0bc3mr11675423plf.57.1684714134746;
        Sun, 21 May 2023 17:08:54 -0700 (PDT)
Received: from [192.168.10.153] (219-90-171-173.ip.adam.com.au. [219.90.171.173])
        by smtp.gmail.com with ESMTPSA id b11-20020a170903228b00b001a52974700dsm3462840plh.174.2023.05.21.17.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 May 2023 17:08:54 -0700 (PDT)
Message-ID: <cc4b7cd8-70c4-6dc8-6ed4-880d344e22fd@ozlabs.ru>
Date: Mon, 22 May 2023 10:08:48 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:108.0) Gecko/20100101
 Thunderbird/108.0
Subject: Re: [PATCH v2] powerpc/iommu: DMA address offset is incorrectly
 calculated with 2MB TCEs
To: Gaurav Batra <gbatra@linux.vnet.ibm.com>
References: <20230419152623.26439-1-gbatra@linux.vnet.ibm.com>
 <87leimfuk0.fsf@mail.concordia>
 <1ce16c05-b492-fed8-06af-0bbba9de9053@linux.vnet.ibm.com>
 <9b60469b-a8f4-bc69-ef1b-9b15d0836e25@linux.vnet.ibm.com>
Content-Language: en-US
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <9b60469b-a8f4-bc69-ef1b-9b15d0836e25@linux.vnet.ibm.com>
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
Cc: Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, Greg Joyce <gjoyce@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Gaurav,

Sorry I missed this. Please share the link to the your fix, I do not see 
it in my mail. In general, the problem can probably be solved by using 
huge pages (anything more than 64K) only for 1:1 mapping.


On 03/05/2023 13:25, Gaurav Batra wrote:
> Hello Alexey,
> 
> I recently joined IOMMU team. There was a bug reported by test team 
> where Mellanox driver was timing out during configuration. I proposed a 
> fix for the same, which is below in the email.
> 
> You suggested a fix for Srikar's reported problem. Basically, both these 
> fixes will resolve Srikar and Mellanox driver issues. The problem is 
> with 2MB DDW.
> 
> Since you have extensive knowledge of IOMMU design and code, in your 
> opinion, which patch should we adopt?
> 
> Thanks a lot
> 
> Gaurav
> 
> On 4/20/23 2:45 PM, Gaurav Batra wrote:
>> Hello Michael,
>>
>> I was looking into the Bug: 199106 
>> (https://bugzilla.linux.ibm.com/show_bug.cgi?id=199106).
>>
>> In the Bug, Mellanox driver was timing out when enabling SRIOV device.
>>
>> I tested, Alexey's patch and it fixes the issue with Mellanox driver. 
>> The down side
>>
>> to Alexey's fix is that even a small memory request by the driver will 
>> be aligned up
>>
>> to 2MB. In my test, the Mellanox driver is issuing multiple requests 
>> of 64K size.
>>
>> All these will get aligned up to 2MB, which is quite a waste of 
>> resources.
>>
>>
>> In any case, both the patches work. Let me know which approach you 
>> prefer. In case
>>
>> we decide to go with my patch, I just realized that I need to fix 
>> nio_pages in
>>
>> iommu_free_coherent() as well.
>>
>>
>> Thanks,
>>
>> Gaurav
>>
>> On 4/20/23 10:21 AM, Michael Ellerman wrote:
>>> Gaurav Batra <gbatra@linux.vnet.ibm.com> writes:
>>>> When DMA window is backed by 2MB TCEs, the DMA address for the mapped
>>>> page should be the offset of the page relative to the 2MB TCE. The code
>>>> was incorrectly setting the DMA address to the beginning of the TCE
>>>> range.
>>>>
>>>> Mellanox driver is reporting timeout trying to ENABLE_HCA for an SR-IOV
>>>> ethernet port, when DMA window is backed by 2MB TCEs.
>>> I assume this is similar or related to the bug Srikar reported?
>>>
>>> https://lore.kernel.org/linuxppc-dev/20230323095333.GI1005120@linux.vnet.ibm.com/
>>>
>>> In that thread Alexey suggested a patch, have you tried his patch? He
>>> suggested rounding up the allocation size, rather than adjusting the
>>> dma_handle.
>>>
>>>> Fixes: 3872731187141d5d0a5c4fb30007b8b9ec36a44d
>>> That's not the right syntax, it's described in the documentation how to
>>> generate it.
>>>
>>> It should be:
>>>
>>>    Fixes: 387273118714 ("powerps/pseries/dma: Add support for 2M 
>>> IOMMU page size")
>>>
>>> cheers
>>>
>>>> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
>>>> index ee95937bdaf1..ca57526ce47a 100644
>>>> --- a/arch/powerpc/kernel/iommu.c
>>>> +++ b/arch/powerpc/kernel/iommu.c
>>>> @@ -517,7 +517,7 @@ int ppc_iommu_map_sg(struct device *dev, struct 
>>>> iommu_table *tbl,
>>>>           /* Convert entry to a dma_addr_t */
>>>>           entry += tbl->it_offset;
>>>>           dma_addr = entry << tbl->it_page_shift;
>>>> -        dma_addr |= (s->offset & ~IOMMU_PAGE_MASK(tbl));
>>>> +        dma_addr |= (vaddr & ~IOMMU_PAGE_MASK(tbl));
>>>>             DBG("  - %lu pages, entry: %lx, dma_addr: %lx\n",
>>>>                   npages, entry, dma_addr);
>>>> @@ -904,6 +904,7 @@ void *iommu_alloc_coherent(struct device *dev, 
>>>> struct iommu_table *tbl,
>>>>       unsigned int order;
>>>>       unsigned int nio_pages, io_order;
>>>>       struct page *page;
>>>> +    int tcesize = (1 << tbl->it_page_shift);
>>>>         size = PAGE_ALIGN(size);
>>>>       order = get_order(size);
>>>> @@ -930,7 +931,8 @@ void *iommu_alloc_coherent(struct device *dev, 
>>>> struct iommu_table *tbl,
>>>>       memset(ret, 0, size);
>>>>         /* Set up tces to cover the allocated range */
>>>> -    nio_pages = size >> tbl->it_page_shift;
>>>> +    nio_pages = IOMMU_PAGE_ALIGN(size, tbl) >> tbl->it_page_shift;
>>>> +
>>>>       io_order = get_iommu_order(size, tbl);
>>>>       mapping = iommu_alloc(dev, tbl, ret, nio_pages, 
>>>> DMA_BIDIRECTIONAL,
>>>>                     mask >> tbl->it_page_shift, io_order, 0);
>>>> @@ -938,7 +940,8 @@ void *iommu_alloc_coherent(struct device *dev, 
>>>> struct iommu_table *tbl,
>>>>           free_pages((unsigned long)ret, order);
>>>>           return NULL;
>>>>       }
>>>> -    *dma_handle = mapping;
>>>> +
>>>> +    *dma_handle = mapping | ((u64)ret & (tcesize - 1));
>>>>       return ret;
>>>>   }
>>>>   --

-- 
Alexey
