Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB7B57041A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 15:23:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhPhb3qmHz3cBq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 23:23:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=TiE4LrBM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=TiE4LrBM;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhPgv139Jz3by2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 23:22:32 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id g4so4750988pgc.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 06:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=u0wAr4upCVZRooXgOjKHGSTU5W+O4lveiB+3Eihyras=;
        b=TiE4LrBMx9ByHBvT8CyXTfPrjJdFTrnRe8+TqfdjQKx4fQbEvZFxBxRv/Igl/Ugxnn
         oeZHblw45Lk6MsKz1B3rg/bNf0Uv2tpgOsRGPsT5zHepUB45kKcO6DkTLeq50tV7CWnb
         q3ZDIll+5XzLEp8KxV2eiE0aue6kWVWz5MsSl6qUQThdaacR6dYYHJ3xGcOYocZA87yK
         PeB+rKUqy+OzG5tWpYC2rsdJIJ/hquhbfmEQw9X4iGlbJ4HQTts8K4Sb779UISqUTtgB
         90CNKcv//eEvsFQkHvEZv6/GEw2np3XE35KH6IVxNQLZ96gHn7DLNguTFvbQbgS1uIab
         i/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=u0wAr4upCVZRooXgOjKHGSTU5W+O4lveiB+3Eihyras=;
        b=QATK4KFUItu3rddAmgr2sLiabkFP+8sE28Hssay0CL106WA84pFfZuWrp8qpRIS8V0
         9RvxkCJUTihiUGeKD+cbE4gQxfp5DS+u8qxlBWnIl4KqmKTqoI/RnjLysImRkbLZ7xd1
         BHLho8TpKApDa3i05FmAtw3GOhuS1EFuNxgfA/aT49vh6dlQXqdNO8XJD8Z3RXFNUanG
         uB63e3IAu6zKtQfag1cW7b57GB1o6MNnFZOEKwe9EZKHaJT0nX5e5jvDLcy+LN9ATZ/z
         NERcA0klwlxs/nSLtl2+MJUUZCb2rEa+fyP0OQ54M0VJp0+oxc+V99Qp1vT6oydT2gyw
         pAgw==
X-Gm-Message-State: AJIora/27UMxm8G53TPREB6vgSiQsMj3SK0HPpOUzaQYW46dAvWrgRnr
	KvSgaW59ChsnDXvmCD1pu+JrGg==
X-Google-Smtp-Source: AGRyM1usYEtxcunKKGc+ooAdB/jHx3OTPzPK4KcYuAwwi41aLzREct1kVkBMf7cAMctP/YCZ+nEZRA==
X-Received: by 2002:a05:6a00:18a7:b0:51b:c63f:1989 with SMTP id x39-20020a056a0018a700b0051bc63f1989mr18229943pfh.49.1657545750304;
        Mon, 11 Jul 2022 06:22:30 -0700 (PDT)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
        by smtp.gmail.com with ESMTPSA id d10-20020a621d0a000000b005289f594326sm4716835pfd.69.2022.07.11.06.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 06:22:29 -0700 (PDT)
Message-ID: <64bc8c04-2162-2e4b-6556-03b9dde051e2@ozlabs.ru>
Date: Mon, 11 Jul 2022 23:24:32 +1000
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
 <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
 <20220708115522.GD1705032@nvidia.com>
 <8329c51a-601e-0d93-41b4-2eb8524c9bcb@ozlabs.ru>
 <Yspx307fxRXT67XG@nvidia.com>
 <861e8bd1-9f04-2323-9b39-d1b46bf99711@ozlabs.ru>
In-Reply-To: <861e8bd1-9f04-2323-9b39-d1b46bf99711@ozlabs.ru>
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
Cc: Joerg Roedel <jroedel@suse.de>, kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Daniel Henrique Barboza <danielhb413@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Oliver O'Halloran <oohall@gmail.com>, Joel Stanley <joel@jms.id.au>, Robin Murphy <robin.murphy@arm.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/07/2022 22:32, Alexey Kardashevskiy wrote:
> 
> 
> On 10/07/2022 16:29, Jason Gunthorpe wrote:
>> On Sat, Jul 09, 2022 at 12:58:00PM +1000, Alexey Kardashevskiy wrote:
>>> driver->ops->attach_group on POWER attaches a group so VFIO claims 
>>> ownership
>>> over a group, not devices. Underlying API 
>>> (pnv_ioda2_take_ownership()) does
>>> not need to keep track of the state, it is one group, one ownership
>>> transfer, easy.
>>
>> It should not change, I think you can just map the attach_dev to the 
>> group?
> 
> There are multiple devices in a group, cannot just map 1:1.
> 
> 
>>> What is exactly the reason why iommu_group_claim_dma_owner() cannot stay
>>> inside Type1 (sorry if it was explained, I could have missed)?
>>
>> It has nothing to do with type1 - the ownership system is designed to
>> exclude other in-kernel drivers from using the group at the same time
>> vfio is using the group. power still needs this protection regardless
>> of if is using the formal iommu api or not.
> 
> POWER deals with it in vfio_iommu_driver_ops::attach_group.


I really think that for 5.19 we should really move this blocked domain 
business to Type1 like this:

https://github.com/aik/linux/commit/96f80c8db03b181398ad355f6f90e574c3ada4bf

Thanks,


>>> Also, from another mail, you said iommu_alloc_default_domain() should 
>>> fail
>>> on power but at least IOMMU_DOMAIN_BLOCKED must be supported, or the 
>>> whole
>>> iommu_group_claim_dma_owner() thing falls apart.
>>
>> Yes
>>
>>> And iommu_ops::domain_alloc() is not told if it is asked to create a 
>>> default
>>> domain, it only takes a type.
>>
>> "default domain" refers to the default type pased to domain_alloc(),
>> it will never be blocking, so it will always fail on power.
>> "default domain" is better understood as the domain used by the DMA
>> API
> 
> The DMA API on POWER does not use iommu_ops, it is dma_iommu_ops from 
> arch/powerpc/kernel/dma-iommu.c from before 2005. so the default domain 
> is type == 0 where 0 == BLOCKED.
> 

-- 
Alexey
