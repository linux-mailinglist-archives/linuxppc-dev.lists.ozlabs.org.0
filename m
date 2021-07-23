Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C13DD3D3422
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 07:35:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWJ1R4crMz303L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 15:35:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=shYdbYpK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=shYdbYpK; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWJ0v0sDJz2xgP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jul 2021 15:34:36 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so2307050pjh.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jul 2021 22:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=R31IBsRAfuuPKWQktgrPBsM8qqZTNdn0VUlW4YQ6CmU=;
 b=shYdbYpKnnZqm3nw+0kpBihqH8f7KJROTlNmKF6YN4j4mx9oxE9amV1mosmOA6XqFB
 MVjyzhtn+B+ahOWqplFIYkLSU+nMzE6N0JSo+x9HY2zsO60MQfzTIzwgg3AhDYqimSRh
 6eu3wJ5bfyiCjKf6iRfpZ6d4Jg5azuCRs9nxkVvmhtu2Rd8yMNQb1ekVMChSypNwNlXs
 6g9SbsBaiRoWq4MfOTVh7QP4eU0iNr9hbYlLRSY3nVX5f/8wWbNux4QWD8B5f7XDPD0m
 WUsIdOtdX1g8NK05c0UHfuBF42+/UItgWfFng0ZZJ0q/BRt1URVN1jPQzVX26cA+NuqH
 X8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R31IBsRAfuuPKWQktgrPBsM8qqZTNdn0VUlW4YQ6CmU=;
 b=bi/5wQTQf77BwQzRZHeyWrP/ChXk4IvswXoYk9zVGr8/C1390YPqSvAUjwTQxQeSO8
 jn3WwR1SffQjY1fx+AlgTrNhP02t67BqPX9gLEugmKlrlT1azr8v+nkL5pJG6kfO7thx
 3S1tDRHXm1otKTjyZVLOhSBPLgWV0ZOctju7JBt3CQ2YOv7j9sb14vtyyI4Nkj2PW/bz
 K91EuwUfwLqh0pelos9Xm6A2tM7QaI7oz+vQLLaVVlQquc7nw+BY8Bn8eGd/yHuqnczw
 +bnWBHdP5jlux9P4O6TdRKr1WWuLoHKhsoCK15P2ZxK7pRt81BiU+ksRK/mdwiQJo5xK
 OKvQ==
X-Gm-Message-State: AOAM531WiI9g3zKWPMlGliQP09fe7o7pEtePl7GmG5z70XjHdKRDeTz4
 nd7Zu8Ra0/p1r0aCmywoDJDOIQ==
X-Google-Smtp-Source: ABdhPJx3Ec2rarEh2fRASsiuYDsAF/2MRAJnhHTqu5M1OIbZbAHGF9soOBmIOC9+kPoM1DowUbhUPg==
X-Received: by 2002:a17:90a:420c:: with SMTP id
 o12mr3076303pjg.101.1627018472138; 
 Thu, 22 Jul 2021 22:34:32 -0700 (PDT)
Received: from [192.168.10.23] (219-90-184-65.ip.adam.com.au. [219.90.184.65])
 by smtp.gmail.com with UTF8SMTPSA id
 n22sm31926155pfo.125.2021.07.22.22.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 22:34:31 -0700 (PDT)
Message-ID: <75c84c0b-46b3-2600-c186-257aec05c645@ozlabs.ru>
Date: Fri, 23 Jul 2021 15:34:25 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0
Subject: Re: [PATCH v5 10/11] powerpc/pseries/iommu: Make use of DDW for
 indirect mapping
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>,
 Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, David Gibson
 <david@gibson.dropbear.id.au>, kernel test robot <lkp@intel.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
 <20210716082755.428187-11-leobras.c@gmail.com>
 <b98f696a-ed64-4c9e-ccb6-549ae8bc7fd6@linux.ibm.com>
 <8dfb28d5-b654-746c-03d8-aeee3d438240@ozlabs.ru>
 <994051df-73b3-4dad-76aa-1a03d9afaf6d@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <994051df-73b3-4dad-76aa-1a03d9afaf6d@linux.ibm.com>
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



On 22/07/2021 01:04, Frederic Barrat wrote:
> 
> 
> On 21/07/2021 05:32, Alexey Kardashevskiy wrote:
>>>> +        struct iommu_table *newtbl;
>>>> +        int i;
>>>> +
>>>> +        for (i = 0; i < ARRAY_SIZE(pci->phb->mem_resources); i++) {
>>>> +            const unsigned long mask = IORESOURCE_MEM_64 | 
>>>> IORESOURCE_MEM;
>>>> +
>>>> +            /* Look for MMIO32 */
>>>> +            if ((pci->phb->mem_resources[i].flags & mask) == 
>>>> IORESOURCE_MEM)
>>>> +                break;
>>>> +        }
>>>> +
>>>> +        if (i == ARRAY_SIZE(pci->phb->mem_resources))
>>>> +            goto out_del_list;
>>>
>>>
>>> So we exit and do nothing if there's no MMIO32 bar?
>>> Isn't the intent just to figure out the MMIO32 area to reserve it 
>>> when init'ing the table? In which case we could default to 0,0
>>>
>>> I'm actually not clear why we are reserving this area on pseries.
>>
>>
>>
>> If we do not reserve it, then the iommu code will allocate DMA pages 
>> from there and these addresses are MMIO32 from the kernel pov at 
>> least. I saw crashes when (I think) a device tried DMAing to the top 
>> 2GB of the bus space which happened to be a some other device's BAR.
> 
> 
> hmmm... then figuring out the correct range needs more work. We could 
> have more than one MMIO32 bar. And they don't have to be adjacent. 

They all have to be within the MMIO32 window of a PHB and we reserve the 
entire window here.

> I 
> don't see that we are reserving any range on the initial table though 
> (on pseries).
True, we did not need to, as the hypervisor always took care of DMA and 
MMIO32 regions to not overlap.

And in this series we do not (strictly speaking) need this either as 
phyp never allocates more than one window dynamically and that only 
window is always the second one starting from 0x800.0000.0000.0000. It 
is probably my mistake that KVM allows a new window to start from 0 - 
PAPR did not prohibit this explicitly.

And for the KVM case, we do not need to remove the default window as KVM 
can pretty much always allocate as many TCE as the VM wants. But we 
still allow removing the default window and creating a huge one instead 
at 0x0 as this way we can allow 1:1 for every single PCI device even if 
it only allows 48 (or similar but less than 64bit) DMA. Hope this makes 
sense. Thanks,


-- 
Alexey
