Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE13856B2D5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 08:35:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfNnr67ybz3cFp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 16:35:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=LmHID1iz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=LmHID1iz;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfNnB0fr8z3bvc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 16:35:06 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d10so8974123pfd.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Jul 2022 23:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=gY/WY/NVKCXOu6IsOXqZ4V8kCkANgdErGrKVqN4xLIY=;
        b=LmHID1izLwtzvfbbz7eANTDO37cRJOPydwa9yZoNZ6EeckM0C90F02enTkTRfht+y7
         BILa6LuN+dKLM9Cs/jlOe8KzCVuHgAd5UdXWdVRkM4Zz0o2WHeXCuCOlGUjslSCdxwXU
         qF1CbOS5TXAPHMAE48Wp1ypDsQmblp6zy+yc2gDuqljYckk5kZhynYXYA69bNnprXmda
         h2E/B5/TPJu4H3On03EoO+RBF0WixAHi8sRMclFc6woOCG+lHlCS4zQf7+z3hsQc9Z7X
         UqDA1ob8GzPHKZsGpUzvt1zH20jIh1rFiMZ7YLxy0UP9BeywKw0I5caVkINi/cywm58u
         mlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=gY/WY/NVKCXOu6IsOXqZ4V8kCkANgdErGrKVqN4xLIY=;
        b=EJ4X/CDN1x0p1CwfqoxhUkYWbCl92et/tPJMoiuNy/22Lo20b81QPDbDzZymPw0Vvz
         v+gwCnVQsipJ2kiFVjq9iGIuKqW7ktFj8OLfBD50FXC8F6QwLjLaRQ5NYMR04bOwghHI
         6ANygsMQudpUJrhv7ieBlFcKGk6Nn18iClZHm8JM/iTxLvcJu1Sdjn4eetamXCXMMULr
         d6ObONs9lt+GmCWRoTRQeoMwkKcQEbk8gGFT8ENie/59r56N7Hx9KFWqoXl3X3YHBhwL
         OUxIXSqnHetDCYx5FgU71VJfqlaMSBcjFMivS1Js7UNnavVW0hV3b62Wr90D+UWYKWvq
         x5Ug==
X-Gm-Message-State: AJIora/1oOl+X0UBa0U7EgjIhrKEt/2q3oUpqa7dRzJRR349KXEKQAjn
	ZxJBHioeEF+i//T7HW20hUQISg==
X-Google-Smtp-Source: AGRyM1uwU7B45elD/3q6EPQXDaN3rUZhLzC+sSvdWQuOcs72Cuw/Gu7NQ593Vc+mkViRPcdw0/T8VQ==
X-Received: by 2002:a63:2254:0:b0:40d:d291:7710 with SMTP id t20-20020a632254000000b0040dd2917710mr1876256pgm.269.1657262102241;
        Thu, 07 Jul 2022 23:35:02 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.gmail.com with ESMTPSA id r20-20020a170902be1400b0016b68cf6ae5sm24429709pls.226.2022.07.07.23.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 23:35:01 -0700 (PDT)
Message-ID: <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
Date: Fri, 8 Jul 2022 16:34:55 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Content-Language: en-US
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20220707135552.3688927-1-aik@ozlabs.ru>
 <20220707151002.GB1705032@nvidia.com>
 <bb8f4c93-6cbc-0106-d4c1-1f3c0751fbba@ozlabs.ru>
In-Reply-To: <bb8f4c93-6cbc-0106-d4c1-1f3c0751fbba@ozlabs.ru>
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
Cc: Joerg Roedel <jroedel@suse.de>, kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Daniel Henrique Barboza <danielhb413@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Oliver O'Halloran <oohall@gmail.com>, Joel Stanley <joel@jms.id.au>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/8/22 15:00, Alexey Kardashevskiy wrote:
> 
> 
> On 7/8/22 01:10, Jason Gunthorpe wrote:
>> On Thu, Jul 07, 2022 at 11:55:52PM +1000, Alexey Kardashevskiy wrote:
>>> Historically PPC64 managed to avoid using iommu_ops. The VFIO driver
>>> uses a SPAPR TCE sub-driver and all iommu_ops uses were kept in
>>> the Type1 VFIO driver. Recent development though has added a coherency
>>> capability check to the generic part of VFIO and essentially disabled
>>> VFIO on PPC64; the similar story about iommu_group_dma_owner_claimed().
>>>
>>> This adds an iommu_ops stub which reports support for cache
>>> coherency. Because bus_set_iommu() triggers IOMMU probing of PCI 
>>> devices,
>>> this provides minimum code for the probing to not crash.
>>>
>>> Because now we have to set iommu_ops to the system (bus_set_iommu() or
>>> iommu_device_register()), this requires the POWERNV PCI setup to happen
>>> after bus_register(&pci_bus_type) which is postcore_initcall
>>> TODO: check if it still works, read sha1, for more details:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5537fcb319d016ce387
>>>
>>> Because setting the ops triggers probing, this does not work well with
>>> iommu_group_add_device(), hence the move to iommu_probe_device().
>>>
>>> Because iommu_probe_device() does not take the group (which is why
>>> we had the helper in the first place), this adds
>>> pci_controller_ops::device_group.
>>>
>>> So, basically there is one iommu_device per PHB and devices are added to
>>> groups indirectly via series of calls inside the IOMMU code.
>>>
>>> pSeries is out of scope here (a minor fix needed for barely supported
>>> platform in regard to VFIO).
>>>
>>> The previous discussion is here:
>>> https://patchwork.ozlabs.org/project/kvm-ppc/patch/20220701061751.1955857-1-aik@ozlabs.ru/
>>
>> I think this is basically OK, for what it is. It looks like there is
>> more some-day opportunity to make use of the core infrastructure though.
>>
>>> does it make sense to have this many callbacks, or
>>> the generic IOMMU code can safely operate without some
>>> (given I add some more checks for !NULL)? thanks,
>>
>> I wouldn't worry about it..
>>
>>> @@ -1156,7 +1158,10 @@ int iommu_add_device(struct iommu_table_group 
>>> *table_group, struct device *dev)
>>>       pr_debug("%s: Adding %s to iommu group %d\n",
>>>            __func__, dev_name(dev),  
>>> iommu_group_id(table_group->group));
>>> -    return iommu_group_add_device(table_group->group, dev);
>>> +    ret = iommu_probe_device(dev);
>>> +    dev_info(dev, "probed with %d\n", ret);
>>
>> For another day, but it seems a bit strange to call 
>> iommu_probe_device() like this?
>> Shouldn't one of the existing call sites cover this? The one in
>> of_iommu.c perhaps?
> 
> 
> It looks to me that of_iommu.c expects the iommu setup to happen before 
> linux starts as linux looks for #iommu-cells or iommu-map properties in 
> the device tree. The powernv firmware (aka skiboot) does not do this and 
> it is linux which manages iommu groups.
> 
> 
>>> +static bool spapr_tce_iommu_is_attach_deferred(struct device *dev)
>>> +{
>>> +       return false;
>>> +}
>>
>> I think you can NULL this op:
>>
>> static bool iommu_is_attach_deferred(struct device *dev)
>> {
>>     const struct iommu_ops *ops = dev_iommu_ops(dev);
>>
>>     if (ops->is_attach_deferred)
>>         return ops->is_attach_deferred(dev);
>>
>>     return false;
>> }
>>
>>> +static struct iommu_group *spapr_tce_iommu_device_group(struct 
>>> device *dev)
>>> +{
>>> +    struct pci_controller *hose;
>>> +    struct pci_dev *pdev;
>>> +
>>> +    /* Weirdly iommu_device_register() assigns the same ops to all 
>>> buses */
>>> +    if (!dev_is_pci(dev))
>>> +        return ERR_PTR(-EPERM);
>>> +
>>> +    pdev = to_pci_dev(dev);
>>> +    hose = pdev->bus->sysdata;
>>> +
>>> +    if (!hose->controller_ops.device_group)
>>> +        return ERR_PTR(-ENOENT);
>>> +
>>> +    return hose->controller_ops.device_group(hose, pdev);
>>> +}
>>
>> Is this missing a refcount get on the group?
>>
>>> +
>>> +static int spapr_tce_iommu_attach_dev(struct iommu_domain *dom,
>>> +                      struct device *dev)
>>> +{
>>> +    return 0;
>>> +}
>>
>> It is important when this returns that the iommu translation is all
>> emptied. There should be no left over translations from the DMA API at
>> this point. I have no idea how power works in this regard, but it
>> should be explained why this is safe in a comment at a minimum.
>>
>  > It will turn into a security problem to allow kernel mappings to leak
>  > past this point.
>  >
> 
> I've added for v2 checking for no valid mappings for a device (or, more 
> precisely, in the associated iommu_group), this domain does not need 
> checking, right?


Uff, not that simple. Looks like once a device is in a group, its 
dma_ops is set to iommu_dma_ops and IOMMU code owns DMA. I guess then 
there is a way to set those to NULL or do something similar to let
dma_map_direct() from kernel/dma/mapping.c return "true", is not there?

For now I'll add a comment in spapr_tce_iommu_attach_dev() that it is 
fine to do nothing as tce_iommu_take_ownership() and 
tce_iommu_take_ownership_ddw() take care of not having active DMA 
mappings. Thanks,


> 
> In general, is "domain" something from hardware or it is a software 
> concept? Thanks,
> 
> 
>> Jason
> 

-- 
Alexey
