Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EB6301223
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jan 2021 02:56:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMzkZ1NKczDsP0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jan 2021 12:56:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=0Upr4ZoT; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMzhd3RvvzDrpp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Jan 2021 12:54:34 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id lw17so7179191pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 17:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XI9vKXk5EP/Dm/QXrNVsBKjyEoziM3g5R/yMYQpWHKM=;
 b=0Upr4ZoTE7r/8g2HExNWkSBJVhaUtoDAMVjxnGpvazeX6Hd6TlGJ3JKRd0Ubi2koEy
 No25AXMh7HTcWSS8tRJrcQEf8ndWMrsCwZNqIa+9jOecJmFPO/WEuOZ81OwBIgI28R/t
 NniuPDVBeeK1t/oYr2pR8ezlACOLzsWruhn+d8fLeA3LBifZgJzJ1fp72kEhB90P/Z4a
 O2r3cs6L9QFY63qSSoiY8aT1tPBlNmm6rddcV8+OFp3I1gkmSnLNB1DYOkSz9tGP2uo9
 /DOFmDPiejQiQ2/04u7GwBm7ZIDkyxx1MXMg89p1ysAmeWwMQvCEnkytmoJbKZ4XHDnh
 Cpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XI9vKXk5EP/Dm/QXrNVsBKjyEoziM3g5R/yMYQpWHKM=;
 b=D2tbBtXHZZqaiKAs2+mBKOUzgopXIuKFQY8WnMqxjoreWV15EtNTNGWZEQ0sokx7fm
 MnwEjcXf/cwoFnQrDoK1iyZBREBGG/ks/6HZ5O0jt4nruK7siyQVCAXWqeANP2qcfHk6
 o4rPzK69uPVi6eDtAh7uZ/usEfrucjqA8Hnn7n/ZukpPAPCIl8HPccv1aemrvIjaQWri
 rf6N3997CWdRTbEGeMAG/W3miECBVvMiIQqNYqQzNbRSlAyR0HvxCi5yBZr3ka8E860J
 ZbwPZOmGhLgMBS1O9zLrhG6xhEf/pxrz2XhtJhP3FZ0z7WWERbxjKKJsNQ1eEcKx/kgo
 /e5w==
X-Gm-Message-State: AOAM532TenYMuszKeFY7m88SCM1DVuYoaNMIMfDfXhjqKjdiUqeWGVd0
 5FkClYOdsuH13Ju6Vrc3+s0J2w==
X-Google-Smtp-Source: ABdhPJzq+IxWW4M/7deU1y4vkxphfXKjaH23F/USnGhw6gktux6pFiAZu2ogOEpt7JMkekfT5TPcvA==
X-Received: by 2002:a17:902:fe08:b029:de:36a1:9f12 with SMTP id
 g8-20020a170902fe08b02900de36a19f12mr7962570plj.30.1611366871054; 
 Fri, 22 Jan 2021 17:54:31 -0800 (PST)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id a25sm9734046pgv.40.2021.01.22.17.54.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 17:54:30 -0800 (PST)
Subject: Re: [PATCH 6/6] powerpc/rtas: constrain user region allocation to RMA
To: Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-7-nathanl@linux.ibm.com>
 <5276937f-b72a-89ba-d0d8-19e4be55ae35@ozlabs.ru>
 <87czy6xlap.fsf@linux.ibm.com>
 <3c5141d5-ee78-3771-3410-37635d423945@ozlabs.ru>
 <871regxwzh.fsf@linux.ibm.com> <87ft2vrew6.fsf@mpe.ellerman.id.au>
 <87pn1ywbs9.fsf@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <a3193f7b-dc34-5252-217f-bea80829c2bc@ozlabs.ru>
Date: Sat, 23 Jan 2021 12:54:24 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <87pn1ywbs9.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
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
Cc: tyreld@linux.ibm.com, brking@linux.ibm.com, ajd@linux.ibm.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 22/01/2021 02:27, Nathan Lynch wrote:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>>>> On 16/01/2021 02:38, Nathan Lynch wrote:
>>>>> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>>>>>> On 15/01/2021 09:00, Nathan Lynch wrote:
>>>>>>> Memory locations passed as arguments from the OS to RTAS usually need
>>>>>>> to be addressable in 32-bit mode and must reside in the Real Mode
>>>>>>> Area. On PAPR guests, the RMA starts at logical address 0 and is the
>>>>>>> first logical memory block reported in the LPAR’s device tree.
>>>>>>>
>>>>>>> On powerpc targets with RTAS, Linux makes available to user space a
>>>>>>> region of memory suitable for arguments to be passed to RTAS via
>>>>>>> sys_rtas(). This region (rtas_rmo_buf) is allocated via the memblock
>>>>>>> API during boot in order to ensure that it satisfies the requirements
>>>>>>> described above.
>>>>>>>
>>>>>>> With radix MMU, the upper limit supplied to the memblock allocation
>>>>>>> can exceed the bounds of the first logical memory block, since
>>>>>>> ppc64_rma_size is ULONG_MAX and RTAS_INSTANTIATE_MAX is 1GB. (512MB is
>>>>>>> a common size of the first memory block according to a small sample of
>>>>>>> LPARs I have checked.) This leads to failures when user space invokes
>>>>>>> an RTAS function that uses a work area, such as
>>>>>>> ibm,configure-connector.
>>>>>>>
>>>>>>> Alter the determination of the upper limit for rtas_rmo_buf's
>>>>>>> allocation to consult the device tree directly, ensuring placement
>>>>>>> within the RMA regardless of the MMU in use.
>>>>>>
>>>>>> Can we tie this with RTAS (which also needs to be in RMA) and simply add
>>>>>> extra 64K in prom_instantiate_rtas() and advertise this address
>>>>>> (ALIGH_UP(rtas-base + rtas-size, PAGE_SIZE)) to the user space? We do
>>>>>> not need this RMO area before that point.
>>>>>
>>>>> Can you explain more about what advantage that would bring? I'm not
>>>>> seeing it. It's a more significant change than what I've written
>>>>> here.
>>>>
>>>>
>>>> We already allocate space for RTAS and (like RMO) it needs to be in RMA,
>>>> and RMO is useless without RTAS. We can reuse RTAS allocation code for
>>>> RMO like this:
>>>
>>> When you say RMO I assume you are referring to rtas_rmo_buf? (I don't
>>> think it is well-named.)
>> ...
>>
>> RMO (Real mode offset) is the old term we used to use to refer to what
>> is now called the RMA (Real mode area). There are still many references
>> to RMO in Linux, but they almost certainly all refer to what we now call
>> the RMA.
> 
> Yes... but I think in this discussion Alexey was using RMO to stand in
> for rtas_rmo_buf, which was what I was trying to clarify.


Correct. Thanks for the clarification, appreciated.

> 
>>>> May be store in the FDT as "linux,rmo-base" next to "linux,rtas-base",
>>>> for clarity, as sharing symbols between prom and main kernel is a bit
>>>> tricky.
>>>>
>>>> The benefit is that we do not do the same thing   (== find 64K in RMA)
>>>> in 2 different ways and if the RMO allocated my way is broken - we'll
>>>> know it much sooner as RTAS itself will break too.
>>>
>>> Implementation details aside... I'll grant that combining the
>>> allocations into one in prom_init reduces some duplication in the sense
>>> that both are subject to the same constraints (mostly - the RTAS data
>>> area must not cross a 256MB boundary, while the user region may). But
>>> they really are distinct concerns. The RTAS private data area is
>>> specified in the platform architecture, the OS is obligated to allocate
>>> it and pass it to instantiate-rtas, etc etc. However the user region
>>> (rtas_rmo_buf) is purely a Linux construct which is there to support
>>> sys_rtas.
>>>
>>> Now, there are multiple sites in the kernel proper that must allocate
>>> memory suitable for passing to RTAS. Obviously there is value in
>>> consolidating the logic for that purpose in one place, so I'll work on
>>> adding that in v2. OK?
>>
>> I don't think we want to move any allocations into prom_init.c unless we
>> have to.
>>
>> It's best thought of as a trampoline, that runs before the kernel
>> proper, to transition from live OF to a flat DT environment. One thing
>> that must be done as part of that is instantiating RTAS, because it's
>> basically a runtime copy of the live OF. But any other allocs are for
>> Linux to handle later, IMHO.
> 
> Agreed.

Then the only comment I have left is may be use of_address_to_resource() 
+ resource_size() instead of of_n_addr_cells()/of_n_size_cells() (like 
pseries_memory_block_size()). And now I shut up :) Thanks,


-- 
Alexey
