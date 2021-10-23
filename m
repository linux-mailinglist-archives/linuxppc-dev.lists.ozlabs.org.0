Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2824383A4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Oct 2021 14:20:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hc0fM1bHdz2ywm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Oct 2021 23:20:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=bkv/35zd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=bkv/35zd; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hc0dj1vMgz2xDJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Oct 2021 23:19:33 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id q187so5923725pgq.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Oct 2021 05:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=uUj/UmbqffvACL7tOtdMDB3X8UAvhuf3C7F1Bn0Mt+4=;
 b=bkv/35zdaEXHCWNhvhzAQTP/NH/y6tVP5dbeZ44VU/gllpSD9PXB7GjBPCIl3dMMFP
 uCuMkgP3kxXL59D3cx4jEbZZ2+4kE3OjyHrABeNhF8jh7JSJP39evw+Y30fE0+sOxYzi
 CO0paMeuSiO/Z3aJrq/tF9/vUUYDOTB1v8aGf3gGt5ejOrG7KMVdvHbxLsnrGcuBQxNT
 RXJ1MeGIumiACF3VsCHn8RWINfhv/NxtGBB31f3q1PZ6zMbvHwFECVErXimo5cqcrK5e
 6hXmOTuGFkCutz+Dqn/hB7bJCw4r7+mL8Xl1GtEPQSXtUuvj+02tUiYqLbOVYJuXLbCd
 ALVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uUj/UmbqffvACL7tOtdMDB3X8UAvhuf3C7F1Bn0Mt+4=;
 b=2cxZUXa/RS+YiMIEZF15HBfiqyYqLvJLESDFhn/eVEWbmfTIv/2yIBX9rAzTO3Hh3L
 p0v5C8uuvY+6vwNrKChXif8DUla+cZQmYCsXVq/zWtt5WWJFglAsPNOnc2Bvi1G5s2Ky
 eEbzM5jDDJb044ZIKZWYtLLkMDPUS2J849EB08XMXu4w53c31UHVC88qBnnIb/tU5Trv
 e+fKN9e9+nBrBotsJWcaarn7oWcgxeEdWUFjqI3weeikvaJcDi6LDIJiQyL3SpiXGvdq
 a8w1zHAhiFE0RjO5RCdLvZ/RK7jKfFjQavFUr+GNXzl09KGRY/ORlqYJloCnjWvQ8wV1
 deuQ==
X-Gm-Message-State: AOAM5303ZzMYInQoSzNAHnHuAlhKzdLi7CXr9Ade2Y0CBupg7iUb/nQ3
 J/djQopYwdHEhzoZ8dma3cK2cA==
X-Google-Smtp-Source: ABdhPJzk0ZrMmBTWkGnRF+EguttGjUodKvlG9OnXkRfkML/SruVALPXU+eaRKk7+Z7XNxSapxupL5A==
X-Received: by 2002:a05:6a00:80c:b0:44d:90ef:e90c with SMTP id
 m12-20020a056a00080c00b0044d90efe90cmr6108141pfk.33.1634991567172; 
 Sat, 23 Oct 2021 05:19:27 -0700 (PDT)
Received: from [192.168.10.153] (124-171-108-209.dyn.iinet.net.au.
 [124.171.108.209])
 by smtp.gmail.com with ESMTPSA id t11sm14170177pfj.173.2021.10.23.05.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 05:19:26 -0700 (PDT)
Message-ID: <3d1dcfa3-23a7-cb7f-8671-2198861987e6@ozlabs.ru>
Date: Sat, 23 Oct 2021 23:18:23 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0
Subject: Re: [PATCH] powerpc: Enhance pmem DMA bypass handling
Content-Language: en-US
To: Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20211021174449.120875-1-brking@linux.vnet.ibm.com>
 <84b82d2b-1263-39bb-d966-b432af530ca8@ozlabs.ru>
 <e4120ddc-8cac-c722-2379-ecc44bd9ef89@linux.vnet.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <e4120ddc-8cac-c722-2379-ecc44bd9ef89@linux.vnet.ibm.com>
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



On 23/10/2021 07:18, Brian King wrote:
> On 10/22/21 7:24 AM, Alexey Kardashevskiy wrote:
>>
>>
>> On 22/10/2021 04:44, Brian King wrote:
>>> If ibm,pmemory is installed in the system, it can appear anywhere
>>> in the address space. This patch enhances how we handle DMA for devices when
>>> ibm,pmemory is present. In the case where we have enough DMA space to
>>> direct map all of RAM, but not ibm,pmemory, we use direct DMA for
>>> I/O to RAM and use the default window to dynamically map ibm,pmemory.
>>> In the case where we only have a single DMA window, this won't work, > so if the window is not big enough to map the entire address range,
>>> we cannot direct map.
>>
>> but we want the pmem range to be mapped into the huge DMA window too if we can, why skip it?
> 
> This patch should simply do what the comment in this commit mentioned below suggests, which says that
> ibm,pmemory can appear anywhere in the address space. If the DMA window is large enough
> to map all of MAX_PHYSMEM_BITS, we will indeed simply do direct DMA for everything,
> including the pmem. If we do not have a big enough window to do that, we will do
> direct DMA for DRAM and dynamic mapping for pmem.


Right, and this is what we do already, do not we? I missing something here.

> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/powerpc/platforms/pseries/iommu.c?id=bf6e2d562bbc4d115cf322b0bca57fe5bbd26f48
> 
> 
> Thanks,
> 
> Brian
> 
> 
>>
>>
>>>
>>> Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
>>> ---
>>>    arch/powerpc/platforms/pseries/iommu.c | 19 ++++++++++---------
>>>    1 file changed, 10 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
>>> index 269f61d519c2..d9ae985d10a4 100644
>>> --- a/arch/powerpc/platforms/pseries/iommu.c
>>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>>> @@ -1092,15 +1092,6 @@ static phys_addr_t ddw_memory_hotplug_max(void)
>>>        phys_addr_t max_addr = memory_hotplug_max();
>>>        struct device_node *memory;
>>>    -    /*
>>> -     * The "ibm,pmemory" can appear anywhere in the address space.
>>> -     * Assuming it is still backed by page structs, set the upper limit
>>> -     * for the huge DMA window as MAX_PHYSMEM_BITS.
>>> -     */
>>> -    if (of_find_node_by_type(NULL, "ibm,pmemory"))
>>> -        return (sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ?
>>> -            (phys_addr_t) -1 : (1ULL << MAX_PHYSMEM_BITS);
>>> -
>>>        for_each_node_by_type(memory, "memory") {
>>>            unsigned long start, size;
>>>            int n_mem_addr_cells, n_mem_size_cells, len;
>>> @@ -1341,6 +1332,16 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>>>         */
>>>        len = max_ram_len;
>>>        if (pmem_present) {
>>> +        if (default_win_removed) {
>>> +            /*
>>> +             * If we only have one DMA window and have pmem present,
>>> +             * then we need to be able to map the entire address
>>> +             * range in order to be able to do direct DMA to RAM.
>>> +             */
>>> +            len = order_base_2((sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ?
>>> +                    (phys_addr_t) -1 : (1ULL << MAX_PHYSMEM_BITS));
>>> +        }
>>> +
>>>            if (query.largest_available_block >=
>>>                (1ULL << (MAX_PHYSMEM_BITS - page_shift)))
>>>                len = MAX_PHYSMEM_BITS;
>>>
>>
> 
> 

-- 
Alexey
