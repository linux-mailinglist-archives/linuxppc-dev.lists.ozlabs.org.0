Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 940F93C8067
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jul 2021 10:39:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPrX543j1z3bXY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jul 2021 18:39:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=RO352VVz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=RO352VVz; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GPrWd2gdBz2yYJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jul 2021 18:38:51 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id a2so1667530pgi.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jul 2021 01:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HFrRhhgQUlQDZh0yHXOiycYYyYLd4062Ek8OIeXpOrM=;
 b=RO352VVzPbSDM/JI76yadFVuZGZkwYwHsK5vcVGyXnP8+6p4X6Kn5ibs0DvNjcJSGb
 bJQ0oWW0DBykIckKZsX7Xub/Vp3vkKVlEKoCjhB3r6Fj15HZal4c60B4IoSxCWaMPEEi
 pbeuwK0fUezmjhnrfQtEApH9CfP98+D786qSd4L7K+RBDDxp6OK8tAUljXgKZMoJ6cjR
 RoFsOGtgUzZvGRDEBfrE6SX2m4+FmoyQVNnL+rAIAGUl40pwWsRaYr9bc6ICbS1xJ2vC
 ZcckRUHS80C5e60WArs1UtJxvbOy6p6Hf+c27ge8mUy5jcYbcAi6eYj5jZSazGExWIUQ
 rJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HFrRhhgQUlQDZh0yHXOiycYYyYLd4062Ek8OIeXpOrM=;
 b=O+efbJKQlaV69KkqEWclVKdFM4ZZcPlSuuQm7hVRa0gt2XFEKd/BNtQhDMWngbjlYc
 gKgnshAf7tG2ILG/DYFo5khmkkRiLbrJdzY3ScuvCjtIqZg0QEo5KDiPJX+mPJ6E62nJ
 ebX6OVYQ5TbmgCdOjsMihYNONCjlOfPCGFjqoodkVD9R0sKTRGVSvWkBeB1DsuIj8Hl6
 epKUVQRvID4ggBD65EKfcQAtOiKizSVqt4p7I/+W2rUQZ/vx91R7f6KGC7T7CJK9odik
 hXqT7r5NYMvtVBtysULpYOF+0ckflpW234D0uJzz9y3PTI/stHdXTTX0DPX3a9kKd/4X
 zutg==
X-Gm-Message-State: AOAM531ECI3i0PCiJwRdZDQynet/p1WfmUROGs5C9u4CeCRTS8FynkSJ
 MP90s3R64uFf0dozEeQ8O56d4g==
X-Google-Smtp-Source: ABdhPJyTaSwqJc1HMI+B7NE3x9KD1Tm35K7fFYdJHi2PBXKPJavU4huJ7qAO+zk6/JDJuDk4T4oB3Q==
X-Received: by 2002:a63:4a43:: with SMTP id j3mr2764928pgl.367.1626251927999; 
 Wed, 14 Jul 2021 01:38:47 -0700 (PDT)
Received: from [192.168.10.23] (219-90-184-65.ip.adam.com.au. [219.90.184.65])
 by smtp.gmail.com with UTF8SMTPSA id
 11sm1698762pfl.41.2021.07.14.01.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 01:38:47 -0700 (PDT)
Message-ID: <2e88a275-3379-6f14-3c93-d2919bee2142@ozlabs.ru>
Date: Wed, 14 Jul 2021 18:38:41 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:90.0) Gecko/20100101
 Thunderbird/90.0
Subject: Re: [PATCH v4 10/11] powerpc/pseries/iommu: Make use of DDW for
 indirect mapping
Content-Language: en-US
To: =?UTF-8?Q?Leonardo_Br=c3=a1s?= <leobras.c@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>
References: <20210430163145.146984-1-leobras.c@gmail.com>
 <20210430163145.146984-11-leobras.c@gmail.com>
 <95ac11e9-a709-e0a2-9690-ef13c4a2cd43@ozlabs.ru>
 <5b8676140f495dbbe3e28ce261e449b885dbae66.camel@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <5b8676140f495dbbe3e28ce261e449b885dbae66.camel@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 13/07/2021 14:36, Leonardo Brás wrote:
> On Tue, 2021-05-11 at 17:57 +1000, Alexey Kardashevskiy wrote:
>>
>>
>> On 01/05/2021 02:31, Leonardo Bras wrote:
>>> [...]
>>>        pmem_present = dn != NULL;
>>> @@ -1218,8 +1224,12 @@ static bool enable_ddw(struct pci_dev *dev,
>>> struct device_node *pdn)
>>>    
>>>          mutex_lock(&direct_window_init_mutex);
>>>    
>>> -       if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset,
>>> &len))
>>> -               goto out_unlock;
>>> +       if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset,
>>> &len)) {
>>> +               direct_mapping = (len >= max_ram_len);
>>> +
>>> +               mutex_unlock(&direct_window_init_mutex);
>>> +               return direct_mapping;
>>
>> Does not this break the existing case when direct_mapping==true by
>> skipping setting dev->dev.bus_dma_limit before returning?
>>
> 
> Yes, it does. Good catch!
> I changed it to use a flag instead of win64 for return, and now I can
> use the same success exit path for both the new config and the config
> found in list. (out_unlock)
> 
>>
>>
>>> +       }
>>>    
>>>          /*
>>>           * If we already went through this for a previous function of
>>> @@ -1298,7 +1308,6 @@ static bool enable_ddw(struct pci_dev *dev,
>>> struct device_node *pdn)
>>>                  goto out_failed;
>>>          }
>>>          /* verify the window * number of ptes will map the partition
>>> */
>>> -       /* check largest block * page size > max memory hotplug addr
>>> */
>>>          /*
>>>           * The "ibm,pmemory" can appear anywhere in the address
>>> space.
>>>           * Assuming it is still backed by page structs, try
>>> MAX_PHYSMEM_BITS
>>> @@ -1320,6 +1329,17 @@ static bool enable_ddw(struct pci_dev *dev,
>>> struct device_node *pdn)
>>>                          1ULL << len,
>>>                          query.largest_available_block,
>>>                          1ULL << page_shift);
>>> +
>>> +               len = order_base_2(query.largest_available_block <<
>>> page_shift);
>>> +               win_name = DMA64_PROPNAME;
>>
>> [1] ....
>>
>>
>>> +       } else {
>>> +               direct_mapping = true;
>>> +               win_name = DIRECT64_PROPNAME;
>>> +       }
>>> +
>>> +       /* DDW + IOMMU on single window may fail if there is any
>>> allocation */
>>> +       if (default_win_removed && !direct_mapping &&
>>> iommu_table_in_use(tbl)) {
>>> +               dev_dbg(&dev->dev, "current IOMMU table in use, can't
>>> be replaced.\n");
>>
>>
>> ... remove !direct_mapping and move to [1]?
> 
> 
> sure, done!
> 
>>
>>
>>>                  goto out_failed;
>>>          }
>>>    
>>> @@ -1331,8 +1351,7 @@ static bool enable_ddw(struct pci_dev *dev,
>>> struct device_node *pdn)
>>>                    create.liobn, dn);
>>>    
>>>          win_addr = ((u64)create.addr_hi << 32) | create.addr_lo;
>>> -       win64 = ddw_property_create(DIRECT64_PROPNAME, create.liobn,
>>> win_addr,
>>> -                                   page_shift, len);
>>> +       win64 = ddw_property_create(win_name, create.liobn, win_addr,
>>> page_shift, len);
>>>          if (!win64) {
>>>                  dev_info(&dev->dev,
>>>                           "couldn't allocate property, property name,
>>> or value\n");
>>> @@ -1350,12 +1369,47 @@ static bool enable_ddw(struct pci_dev *dev,
>>> struct device_node *pdn)
>>>          if (!window)
>>>                  goto out_del_prop;
>>>    
>>> -       ret = walk_system_ram_range(0, memblock_end_of_DRAM() >>
>>> PAGE_SHIFT,
>>> -                       win64->value,
>>> tce_setrange_multi_pSeriesLP_walk);
>>> -       if (ret) {
>>> -               dev_info(&dev->dev, "failed to map direct window for
>>> %pOF: %d\n",
>>> -                        dn, ret);
>>> -               goto out_del_list;
>>> +       if (direct_mapping) {
>>> +               /* DDW maps the whole partition, so enable direct DMA
>>> mapping */
>>> +               ret = walk_system_ram_range(0, memblock_end_of_DRAM()
>>>>> PAGE_SHIFT,
>>> +                                           win64->value,
>>> tce_setrange_multi_pSeriesLP_walk);
>>> +               if (ret) {
>>> +                       dev_info(&dev->dev, "failed to map direct
>>> window for %pOF: %d\n",
>>> +                                dn, ret);
>>> +                       goto out_del_list;
>>> +               }
>>> +       } else {
>>> +               struct iommu_table *newtbl;
>>> +               int i;
>>> +
>>> +               /* New table for using DDW instead of the default DMA
>>> window */
>>> +               newtbl = iommu_pseries_alloc_table(pci->phb->node);
>>> +               if (!newtbl) {
>>> +                       dev_dbg(&dev->dev, "couldn't create new IOMMU
>>> table\n");
>>> +                       goto out_del_list;
>>> +               }
>>> +
>>> +               for (i = 0; i < ARRAY_SIZE(pci->phb->mem_resources);
>>> i++) {
>>> +                       const unsigned long mask = IORESOURCE_MEM_64
>>> | IORESOURCE_MEM;
>>> +
>>> +                       /* Look for MMIO32 */
>>> +                       if ((pci->phb->mem_resources[i].flags & mask)
>>> == IORESOURCE_MEM)
>>> +                               break;
>>
>> What if there is no IORESOURCE_MEM? pci->phb->mem_resources[i].start
>> below will have garbage.
> 
> 
> 
> Yeah, that makes sense. I will add this lines after 'for':
> 
> if (i == ARRAY_SIZE(pci->phb->mem_resources)) {
>   iommu_tce_table_put(newtbl);
>   goto out_del_list;
> }
> 
> What do you think?


Move this and that "for" before iommu_pseries_alloc_table() so you won't 
need to free if there is no IORESOURCE_MEM.


> 
> 
>>
>>
>>> +               }
>>> +
>>> +               _iommu_table_setparms(newtbl, pci->phb->bus->number,
>>> create.liobn, win_addr,
>>> +                                     1UL << len, page_shift, 0,
>>> &iommu_table_lpar_multi_ops);
>>> +               iommu_init_table(newtbl, pci->phb->node, pci->phb-
>>>> mem_resources[i].start,
>>> +                                pci->phb->mem_resources[i].end);
>>> +
>>> +               if (default_win_removed)
>>> +                       iommu_tce_table_put(tbl);
>>
>>
>> iommu_tce_table_put() should have been called when the window was
>> removed.
>>
>> Also after some thinking - what happens if there were 2 devices in the
>> PE and one requested 64bit DMA? This will only update
>> set_iommu_table_base() for the 64bit one but not for the other.
>>
>> I think the right thing to do is:
>>
>> 1. check if table[0] is in use, if yes => fail (which this does
>> already)
>>
>> 2. remove default dma window but keep the iommu_table struct with one
>> change - set it_size to 0 (and free it_map) so the 32bit device won't
>> look at a stale structure and think there is some window (imaginery
>> situation for phyp but easy to recreate in qemu).
>>
>> 3. use table[1] for newly created indirect DDW window.
>>
>> 4. change get_iommu_table_base() to return a usable table (or may be
>> not
>> needed?).
>>
>> If this sounds reasonable (does it?),
> 
> Looks ok, I will try your suggestion.
> I was not aware of how pci->table_group->tables[] worked, so I replaced
> pci->table_group->tables[0] with the new tbl, while moving the older in
> pci->table_group->tables[1].


pci->table_group->tables[0] is window#0 at @0.
pci->table_group->tables[1] is window#1 at 0x0800.0000.0000.0000. That 
is all :)

pseries does not use tables[1] but powernv does (by VFIO only though).


> (4) get_iommu_table_base() does not seem to need update, as it returns
> the tlb set by set_iommu_table_base() which is already called in the
> !direct_mapping path in current patch.

Sounds right.

> 
>>   the question is now if you have
>> time to do that and the hardware to test that, or I'll have to finish
>> the work :)
> 
> Sorry, for some reason part of this got lost in Evolution mail client.
> 
> If possible, I do want to finish this work, and I am talking to IBM
> Virt people in order to get testing HW.


Even I struggle to find a powervm machine :)

>>
>>
>>> +               else
>>> +                       pci->table_group->tables[1] = tbl;
>>
>>
>> What is this for?
> 
> I was thinking of adding the older table to pci->table_group->tables[1]
> while keeping the newer table on pci->table_group->tables[0].
> This did work, but I think your suggestion may work better.
> 
> Best regards,
> Leonardo Bras
> 
> 

-- 
Alexey
