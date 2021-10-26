Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 724B143ABCB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 07:42:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hdgh52TqLz3clj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 16:42:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=BWiNUEJM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=BWiNUEJM; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdgfH5cgtz2yNK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 16:40:54 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id r28so8682943pga.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 22:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=qbtIRUBbrJd6ccFoPjJAUe4VM/2QlqIjYix88j3InF0=;
 b=BWiNUEJMjUDggWfdETRWMv+NIT2acWqPK82SWgcCSDq8ImN0DjtAxnnOV1EeNTFkGq
 dxcenTksWWeXt/7A+eN7gZPFlZ09E6+17Rn8kKpsVQN4FlPn88xYqqzR3dM58eN75RgT
 ekW2nBmum/Nok44qM1sN1+g1mixhGyWGVc5ZPW5lUnDIV9JFjrYtYMvWSwxnhqNE/y+F
 21rAMCycXiu7G5n4JyWCYMqt3XPqDRtDyE8AVpzvuhYz9utiuVNn7S+BnzE+bby7pP0Z
 BWGC118kekIiETOd6NtQVkr43Yp3XQgMwLZIaCiLE+yBA5DuAA4kjjcxNo5yG3wvX9Xd
 tQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qbtIRUBbrJd6ccFoPjJAUe4VM/2QlqIjYix88j3InF0=;
 b=7YlQoI5s+a7YxrfgR3edYsC3gy2av2bhMGVqAC9h1Wh0iGkRxbM1QUV/jtDyYxAA44
 nE+mW4k5pZcdrbDt7dXYU+aSHJXYND+dkpFj90DSV0ButjwiIP2k2kdhGWc0b4yHNURk
 95K0hcYvBhJAyjS5vInAZoQEAsHWuqTD4/3VxX695DQ6Oi+MLbSstLR5UAv/VBow3OOr
 ngcnzCC3/wiZcdMfGpqT0R6iP7mZajfNC1a0yF578WmiPWAYFaQo6VnOD+g9Kcn3Ixv3
 6FnZPTpMEF/RvOWiFlrxa1iSZBBZechwo2C01eEMohg2c8QByHJDe3ZXbejaDakcefxi
 YzWg==
X-Gm-Message-State: AOAM532j6X/Z3wl7nAatUYCmVmLy25ZYWgQ/YFmOb0Nx6sk1eq1JnfT/
 aA/efGmTgaI7ftHxTHBCfL9p9w==
X-Google-Smtp-Source: ABdhPJzAx5O05uEZxCVkovW32qCc8HRiVkGUYvEML6bGMgExrkILOeojh72kj5VURHYXsX/H06JGKA==
X-Received: by 2002:a63:1d7:: with SMTP id 206mr17414991pgb.387.1635226849813; 
 Mon, 25 Oct 2021 22:40:49 -0700 (PDT)
Received: from [192.168.10.24] (124-171-108-209.dyn.iinet.net.au.
 [124.171.108.209])
 by smtp.gmail.com with ESMTPSA id z2sm18396845pfe.119.2021.10.25.22.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 22:40:48 -0700 (PDT)
Message-ID: <a2537ac0-cee3-31d3-73da-7d9de860f602@ozlabs.ru>
Date: Tue, 26 Oct 2021 16:39:46 +1100
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
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <f9af9834-797f-cd69-bbcf-3663ce375c72@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
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



On 10/26/21 01:40, Brian King wrote:
> On 10/23/21 7:18 AM, Alexey Kardashevskiy wrote:
>>
>>
>> On 23/10/2021 07:18, Brian King wrote:
>>> On 10/22/21 7:24 AM, Alexey Kardashevskiy wrote:
>>>>
>>>>
>>>> On 22/10/2021 04:44, Brian King wrote:
>>>>> If ibm,pmemory is installed in the system, it can appear anywhere
>>>>> in the address space. This patch enhances how we handle DMA for devices when
>>>>> ibm,pmemory is present. In the case where we have enough DMA space to
>>>>> direct map all of RAM, but not ibm,pmemory, we use direct DMA for
>>>>> I/O to RAM and use the default window to dynamically map ibm,pmemory.
>>>>> In the case where we only have a single DMA window, this won't work, > so if the window is not big enough to map the entire address range,
>>>>> we cannot direct map.
>>>>
>>>> but we want the pmem range to be mapped into the huge DMA window too if we can, why skip it?
>>>
>>> This patch should simply do what the comment in this commit mentioned below suggests, which says that
>>> ibm,pmemory can appear anywhere in the address space. If the DMA window is large enough
>>> to map all of MAX_PHYSMEM_BITS, we will indeed simply do direct DMA for everything,
>>> including the pmem. If we do not have a big enough window to do that, we will do
>>> direct DMA for DRAM and dynamic mapping for pmem.
>>
>>
>> Right, and this is what we do already, do not we? I missing something here.
> 
> The upstream code does not work correctly that I can see. If I boot an upstream kernel
> with an nvme device and vpmem assigned to the LPAR, and enable dev_dbg in arch/powerpc/platforms/pseries/iommu.c,
> I see the following in the logs:
> 
> [    2.157549] nvme 0121:50:00.0: ibm,query-pe-dma-windows(53) 500000 8000000 20000121 returned 0
> [    2.157561] nvme 0121:50:00.0: Skipping ibm,pmemory
> [    2.157567] nvme 0121:50:00.0: can't map partition max 0x8000000000000 with 16777216 65536-sized pages
> [    2.170150] nvme 0121:50:00.0: ibm,create-pe-dma-window(54) 500000 8000000 20000121 10 28 returned 0 (liobn = 0x70000121 starting addr = 8000000 0)
> [    2.170170] nvme 0121:50:00.0: created tce table LIOBN 0x70000121 for /pci@800000020000121/pci1014,683@0
> [    2.356260] nvme 0121:50:00.0: node is /pci@800000020000121/pci1014,683@0
> 
> This means we are heading down the leg in enable_ddw where we do not set direct_mapping to true. We use
> create the DDW window, but don't do any direct DMA. This is because the window is not large enough to
> map 2PB of memory, which is what ddw_memory_hotplug_max returns without my patch. 
> 
> With my patch applied, I get this in the logs:
> 
> [    2.204866] nvme 0121:50:00.0: ibm,query-pe-dma-windows(53) 500000 8000000 20000121 returned 0
> [    2.204875] nvme 0121:50:00.0: Skipping ibm,pmemory
> [    2.205058] nvme 0121:50:00.0: ibm,create-pe-dma-window(54) 500000 8000000 20000121 10 21 returned 0 (liobn = 0x70000121 starting addr = 8000000 0)
> [    2.205068] nvme 0121:50:00.0: created tce table LIOBN 0x70000121 for /pci@800000020000121/pci1014,683@0
> [    2.215898] nvme 0121:50:00.0: iommu: 64-bit OK but direct DMA is limited by 800000200000000
> 


ah I see. then...


> 
> Thanks,
> 
> Brian
> 
> 
>>
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/powerpc/platforms/pseries/iommu.c?id=bf6e2d562bbc4d115cf322b0bca57fe5bbd26f48
>>>
>>>
>>> Thanks,
>>>
>>> Brian
>>>
>>>
>>>>
>>>>
>>>>>
>>>>> Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
>>>>> ---
>>>>>    arch/powerpc/platforms/pseries/iommu.c | 19 ++++++++++---------
>>>>>    1 file changed, 10 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
>>>>> index 269f61d519c2..d9ae985d10a4 100644
>>>>> --- a/arch/powerpc/platforms/pseries/iommu.c
>>>>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>>>>> @@ -1092,15 +1092,6 @@ static phys_addr_t ddw_memory_hotplug_max(void)
>>>>>        phys_addr_t max_addr = memory_hotplug_max();
>>>>>        struct device_node *memory;
>>>>>    -    /*
>>>>> -     * The "ibm,pmemory" can appear anywhere in the address space.
>>>>> -     * Assuming it is still backed by page structs, set the upper limit
>>>>> -     * for the huge DMA window as MAX_PHYSMEM_BITS.
>>>>> -     */
>>>>> -    if (of_find_node_by_type(NULL, "ibm,pmemory"))
>>>>> -        return (sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ?
>>>>> -            (phys_addr_t) -1 : (1ULL << MAX_PHYSMEM_BITS);
>>>>> -
>>>>>        for_each_node_by_type(memory, "memory") {
>>>>>            unsigned long start, size;
>>>>>            int n_mem_addr_cells, n_mem_size_cells, len;
>>>>> @@ -1341,6 +1332,16 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>>>>>         */
>>>>>        len = max_ram_len;
>>>>>        if (pmem_present) {
>>>>> +        if (default_win_removed) {
>>>>> +            /*
>>>>> +             * If we only have one DMA window and have pmem present,
>>>>> +             * then we need to be able to map the entire address
>>>>> +             * range in order to be able to do direct DMA to RAM.
>>>>> +             */
>>>>> +            len = order_base_2((sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ?
>>>>> +                    (phys_addr_t) -1 : (1ULL << MAX_PHYSMEM_BITS));


... len = (sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ? 31 :
MAX_PHYSMEM_BITS  ?

Or actually simply drop this hunk and only leave the first one and add
this instead:


diff --git a/arch/powerpc/platforms/pseries/iommu.c
b/arch/powerpc/platforms/pseries/iommu.c
index 591ec9e94edb..68bfcd2227d9 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1518,7 +1518,7 @@ static bool enable_ddw(struct pci_dev *dev, struct
device_node *pdn)
         * as RAM, then we failed to create a window to cover persistent
         * memory and need to set the DMA limit.
         */
-       if (pmem_present && ddw_enabled && direct_mapping && len ==
max_ram_len)
+       if (pmem_present && ddw_enabled && direct_mapping)

?

Thanks,



>>>>> +        }
>>>>> +
>>>>>            if (query.largest_available_block >=
>>>>>                (1ULL << (MAX_PHYSMEM_BITS - page_shift)))
>>>>>                len = MAX_PHYSMEM_BITS;
>>>>>
>>>>
>>>
>>>
>>
> 
> 

-- 
Alexey
