Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 867045849B1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 04:23:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvBBc3SPYz2xkT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 12:23:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=eae2cICr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=eae2cICr;
	dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvB9P17zMz2yj3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 12:21:58 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id r186so2958657pgr.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 19:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yL6IUYgPwNHI0oBre6USbbEJkgU31+NcKUw2BdyBE+k=;
        b=eae2cICrCe2DgCX9GLFxTBoteiX4MJieAZaKj/FXNBqqz+kA0xbDQcfLyg2/L4nHSi
         GXqHA7bdjUh4pkjMAYqmthaac6V2RLFoI3Cb+GcNJUXMdiUJ+cI3vrsW94gt8pZfl+CB
         ae/l8S0Vy/hAaH65jA1y7eFyMZm4wOomontpwLkGmWRSercl7oVyxK1CAnu7lZBd1oQr
         miLqBni30Wy0l+0UDEoUYM21qkgfiLz9D8fjJNxQOyCDUKyiwP+wFyXka41X2X9at+rX
         imxyd3XpBaseiIBZX965xQaeA6VrkrPD/B2CJOwW2O/BdkZhvJW6qG2eCHHgKsRAkeDw
         Edgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yL6IUYgPwNHI0oBre6USbbEJkgU31+NcKUw2BdyBE+k=;
        b=tBmsHrDcFZRypBcohu56MX8riASyeW5u8mJW1zvsxoGw93Ux6xsjnfnFjRqKjLGqoy
         e0kLtAZtvIhCx+A1yVR4VkToGJ6QcBePpfXEMERXq50ocJpeWOVYG4XiZkFgyHH2u+CJ
         DV6j/4gC1SJroJrknk49d1BOHv+i9GcD3Faj7cvTGyBxpvRnLN+hKgrSzNwZdJ1hV0CJ
         NidtTXIrnQrasndKHrYRTKvRdqp4aFCcALq8oH/TINxtywX8ZqSKSLuJ8J0Nt/DshQZJ
         teBW0ffYwxs8+AWKmDBGVWGWlxq3eT2sQ6Tj6G6f8gUm7vkFIIQngtdlCJrYBRPG1o9v
         bR7A==
X-Gm-Message-State: ACgBeo1GrNtuA8QFzy65wyu16SlSpYiYhxo/dzJTHmtm5+TGtorBrasF
	Spo/hBJL5A9eH3MrWGn9OfgW1g==
X-Google-Smtp-Source: AGRyM1vhohbLpRcd05Kr+trC+ZuYAaJC08xuSgp+1X8NvEUQTHTDYL63DHsK5CMUWvyhk7tt2yKF8g==
X-Received: by 2002:a05:6a00:3388:b0:52a:c018:6cdf with SMTP id cm8-20020a056a00338800b0052ac0186cdfmr1305849pfb.55.1659061314580;
        Thu, 28 Jul 2022 19:21:54 -0700 (PDT)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
        by smtp.gmail.com with ESMTPSA id s15-20020aa78bcf000000b0052bae7b2af8sm1437727pfd.201.2022.07.28.19.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 19:21:54 -0700 (PDT)
Message-ID: <300aa0fe-31c5-4ed2-d0a2-597c2c305f91@ozlabs.ru>
Date: Fri, 29 Jul 2022 12:21:46 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:103.0) Gecko/20100101
 Thunderbird/103.0
Subject: Re: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20220707135552.3688927-1-aik@ozlabs.ru>
 <20220707151002.GB1705032@nvidia.com>
 <bb8f4c93-6cbc-0106-d4c1-1f3c0751fbba@ozlabs.ru>
 <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
 <BN9PR11MB527690152FE449D26576D2FE8C829@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <BN9PR11MB527690152FE449D26576D2FE8C829@BN9PR11MB5276.namprd11.prod.outlook.com>
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
Cc: "Rodel, Jorg" <jroedel@suse.de>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Fabiano Rosas <farosas@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Daniel Henrique Barboza <danielhb413@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>, Alex Williamson <alex.williamson@redhat.com>, Oliver O'Halloran <oohall@gmail.com>, Joel Stanley <joel@jms.id.au>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/07/2022 17:32, Tian, Kevin wrote:
>> From: Alexey Kardashevskiy <aik@ozlabs.ru>
>> Sent: Friday, July 8, 2022 2:35 PM
>> On 7/8/22 15:00, Alexey Kardashevskiy wrote:
>>>
>>>
>>> On 7/8/22 01:10, Jason Gunthorpe wrote:
>>>> On Thu, Jul 07, 2022 at 11:55:52PM +1000, Alexey Kardashevskiy wrote:
>>>>> Historically PPC64 managed to avoid using iommu_ops. The VFIO driver
>>>>> uses a SPAPR TCE sub-driver and all iommu_ops uses were kept in
>>>>> the Type1 VFIO driver. Recent development though has added a
>> coherency
>>>>> capability check to the generic part of VFIO and essentially disabled
>>>>> VFIO on PPC64; the similar story about
>> iommu_group_dma_owner_claimed().
>>>>>
>>>>> This adds an iommu_ops stub which reports support for cache
>>>>> coherency. Because bus_set_iommu() triggers IOMMU probing of PCI
>>>>> devices,
>>>>> this provides minimum code for the probing to not crash.
> 
> stale comment since this patch doesn't use bus_set_iommu() now.
> 
>>>>> +
>>>>> +static int spapr_tce_iommu_attach_dev(struct iommu_domain *dom,
>>>>> +                      struct device *dev)
>>>>> +{
>>>>> +    return 0;
>>>>> +}
>>>>
>>>> It is important when this returns that the iommu translation is all
>>>> emptied. There should be no left over translations from the DMA API at
>>>> this point. I have no idea how power works in this regard, but it
>>>> should be explained why this is safe in a comment at a minimum.
>>>>
>>>   > It will turn into a security problem to allow kernel mappings to leak
>>>   > past this point.
>>>   >
>>>
>>> I've added for v2 checking for no valid mappings for a device (or, more
>>> precisely, in the associated iommu_group), this domain does not need
>>> checking, right?
>>
>>
>> Uff, not that simple. Looks like once a device is in a group, its
>> dma_ops is set to iommu_dma_ops and IOMMU code owns DMA. I guess
>> then
>> there is a way to set those to NULL or do something similar to let
>> dma_map_direct() from kernel/dma/mapping.c return "true", is not there?
> 
> dev->dma_ops is NULL as long as you don't handle DMA domain type
> here and don't call iommu_setup_dma_ops().
> 
> Given this only supports blocking domain then above should be irrelevant.
> 
>>
>> For now I'll add a comment in spapr_tce_iommu_attach_dev() that it is
>> fine to do nothing as tce_iommu_take_ownership() and
>> tce_iommu_take_ownership_ddw() take care of not having active DMA
>> mappings. Thanks,
>>
>>
>>>
>>> In general, is "domain" something from hardware or it is a software
>>> concept? Thanks,
>>>
> 
> 'domain' is a software concept to represent the hardware I/O page
> table. 


About this. If a platform has a concept of explicit DMA windows (2 or 
more), is it one domain with 2 windows or 2 domains with one window each?

If it is 2 windows, iommu_domain_ops misses windows manipulation 
callbacks (I vaguely remember it being there for embedded PPC64 but 
cannot find it quickly).

If it is 1 window per a domain, then can a device be attached to 2 
domains at least in theory (I suspect not)?

On server POWER CPUs, each DMA window is backed by an independent IOMMU 
page table. (reminder) A window is a bus address range where devices are 
allowed to DMA to/from ;)

Thanks,


> A blocking domain means all DMAs from a device attached to
> this domain are blocked/rejected (equivalent to an empty I/O page
> table), usually enforced in the .attach_dev() callback.
> 
> Yes, a comment for why having a NULL .attach_dev() is OK is welcomed.
> 
> Thanks
> Kevin

-- 
Alexey
