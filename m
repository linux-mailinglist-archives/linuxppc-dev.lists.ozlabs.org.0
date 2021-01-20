Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 081FD2FCA1B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 05:51:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLCmH5bwDzDqWK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 15:51:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=oDfge6ip; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLCk66KGGzDqBV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 15:49:44 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id c132so14416949pga.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 20:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UM5Eq+hgcY554C0hHTfiTgfYA4Ye42Qf2avruc/G2sY=;
 b=oDfge6ipF7PNxqKR5SfQBGAI9VHWqsznffMLlKdpeM8QCGmHjuKeWVl53N8FxnUqOU
 f5Q/uKSM7qbu+psiA9guao7YqSeoyTRn1slqRxhrxU6Vb1z29vTzSAOuPkY+CRvrhWIN
 XwKe25pe6It8xPMMiy20zPR52lkH8CvnRe+HkRMPxOecxslKcoYhjfIudbi7aefWDuEk
 aYGA0Xq5igvMOdPHb1+aEMoDQKlnZWe68sNGaJ9tn9Fj9rB4nsvgNuEsrrFiiV761HXJ
 WF92qbsuT5Xy6EItWSXxlz4SugsLPOb+eRBQBWja7r8BlObQ5QjQQiYPsrBT9UGQW1vv
 lpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UM5Eq+hgcY554C0hHTfiTgfYA4Ye42Qf2avruc/G2sY=;
 b=MLDfMkQ7bnfj6IV9SonNBpqzEdI0PXGdN4+fvTB9RBAm5RqjFaMsD+eDuvVlKjWO3W
 3JYsbcfLUhE/RAYxWzyi1Zg7DmfKTAPzrVspzQhtX5KTAcAwt7QctMtKzfAdZa/KS72P
 7DAHWeLA4EgV8dJHf4RCNcxL7WOFHECOfXVtm4JnIscHhl2AfzPv92DzpcBAT8oaRJwA
 BYmBwPUjkrtI5+zZaTqz1Mm5l+r4DeMZSMejma7y1ZRrLoGtktPZptv/E1zHequj/XVW
 LKjuac95HcVCsWqeN1ONarDP1KcLtl8NURYSEKgoJhdPfandjMWNjVVIYJY+3shjkgxJ
 QJBQ==
X-Gm-Message-State: AOAM531/qfRP9M6/ctY6EqlOCrpTgUqUq48IZDZzcUpiiCB1rqIG84S/
 vFsXB8TnC1B9gxxooNvutitjGA==
X-Google-Smtp-Source: ABdhPJxguu5y/xALy2yBddJYyThGYUqKFNxNtX84orIv0NtDA44N0m7cxYrHqOCfV8ujWWN9hDXkOw==
X-Received: by 2002:a63:fc42:: with SMTP id r2mr7659075pgk.234.1611118179924; 
 Tue, 19 Jan 2021 20:49:39 -0800 (PST)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id o32sm687811pgm.10.2021.01.19.20.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 20:49:39 -0800 (PST)
Subject: Re: [PATCH 6/6] powerpc/rtas: constrain user region allocation to RMA
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-7-nathanl@linux.ibm.com>
 <5276937f-b72a-89ba-d0d8-19e4be55ae35@ozlabs.ru>
 <87czy6xlap.fsf@linux.ibm.com>
 <3c5141d5-ee78-3771-3410-37635d423945@ozlabs.ru>
 <871regxwzh.fsf@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <6c3770a3-173d-8409-b65b-16083100ddbf@ozlabs.ru>
Date: Wed, 20 Jan 2021 15:49:33 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <871regxwzh.fsf@linux.ibm.com>
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



On 20/01/2021 11:39, Nathan Lynch wrote:
> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>> On 16/01/2021 02:38, Nathan Lynch wrote:
>>> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>>>> On 15/01/2021 09:00, Nathan Lynch wrote:
>>>>> Memory locations passed as arguments from the OS to RTAS usually need
>>>>> to be addressable in 32-bit mode and must reside in the Real Mode
>>>>> Area. On PAPR guests, the RMA starts at logical address 0 and is the
>>>>> first logical memory block reported in the LPAR’s device tree.
>>>>>
>>>>> On powerpc targets with RTAS, Linux makes available to user space a
>>>>> region of memory suitable for arguments to be passed to RTAS via
>>>>> sys_rtas(). This region (rtas_rmo_buf) is allocated via the memblock
>>>>> API during boot in order to ensure that it satisfies the requirements
>>>>> described above.
>>>>>
>>>>> With radix MMU, the upper limit supplied to the memblock allocation
>>>>> can exceed the bounds of the first logical memory block, since
>>>>> ppc64_rma_size is ULONG_MAX and RTAS_INSTANTIATE_MAX is 1GB. (512MB is
>>>>> a common size of the first memory block according to a small sample of
>>>>> LPARs I have checked.) This leads to failures when user space invokes
>>>>> an RTAS function that uses a work area, such as
>>>>> ibm,configure-connector.
>>>>>
>>>>> Alter the determination of the upper limit for rtas_rmo_buf's
>>>>> allocation to consult the device tree directly, ensuring placement
>>>>> within the RMA regardless of the MMU in use.
>>>>
>>>> Can we tie this with RTAS (which also needs to be in RMA) and simply add
>>>> extra 64K in prom_instantiate_rtas() and advertise this address
>>>> (ALIGH_UP(rtas-base + rtas-size, PAGE_SIZE)) to the user space? We do
>>>> not need this RMO area before that point.
>>>
>>> Can you explain more about what advantage that would bring? I'm not
>>> seeing it. It's a more significant change than what I've written
>>> here.
>>
>>
>> We already allocate space for RTAS and (like RMO) it needs to be in RMA,
>> and RMO is useless without RTAS. We can reuse RTAS allocation code for
>> RMO like this:
> 
> When you say RMO I assume you are referring to rtas_rmo_buf? (I don't
> think it is well-named.)
> 
> 
>> ===
>> diff --git a/arch/powerpc/kernel/prom_init.c
>> b/arch/powerpc/kernel/prom_init.c
>> index e9d4eb6144e1..d9527d3e01d2 100644
>> --- a/arch/powerpc/kernel/prom_init.c
>> +++ b/arch/powerpc/kernel/prom_init.c
>> @@ -1821,7 +1821,8 @@ static void __init prom_instantiate_rtas(void)
>>           if (size == 0)
>>                   return;
>>
>> -       base = alloc_down(size, PAGE_SIZE, 0);
>> +       /* One page for RTAS, one for RMO */
> 
> One page for RTAS? RTAS is ~20MB on LPARs I've checked:
> 
> # lsprop /proc/device-tree/rtas/{rtas-size,linux,rtas-base}
> /proc/device-tree/rtas/rtas-size
> 		 01370000 (20381696)

You are right, I did not sleep well when replied, sorry about that :) I 
tried it with KVM where RTAS is just a few KBs (20 constant bytes + MCE 
log, depends on cpu number) so it worked for me.


> 
>> +       base = alloc_down(size, PAGE_SIZE + PAGE_SIZE, 0);
> 
> This changes the alignment but not the size of the allocation.


Should be:

base = alloc_down(ALIGN_UP(size, PAGE_SIZE) + PAGE_SIZE, PAGE_SIZE, 0);

> 
> 
>>           if (base == 0)
>>                   prom_panic("Could not allocate memory for RTAS\n");
>>
>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>> index d126d71ea5bd..885d95cf4ed3 100644
>> --- a/arch/powerpc/kernel/rtas.c
>> +++ b/arch/powerpc/kernel/rtas.c
>> @@ -1186,6 +1186,7 @@ void __init rtas_initialize(void)
>>           rtas.size = size;
>>           no_entry = of_property_read_u32(rtas.dev, "linux,rtas-entry",
>> &entry);
>>           rtas.entry = no_entry ? rtas.base : entry;
>> +       rtas_rmo_buf = rtas.base + PAGE_SIZE;
> 
> I think this would overlay the user region on top of the RTAS private
> data area, allowing user space to corrupt it.


Right, my bad. Should be:

rtas_rmo_buf = ALIGN_UP(rtas.base + rtas.size, PAGE_SIZE);


> 
>>
>>           /* If RTAS was found, allocate the RMO buffer for it and look for
>>            * the stop-self token if any
>> @@ -1196,11 +1197,6 @@ void __init rtas_initialize(void)
>>                   ibm_suspend_me_token = rtas_token("ibm,suspend-me");
>>           }
>>    #endif
>> -       rtas_rmo_buf = memblock_phys_alloc_range(RTAS_RMOBUF_MAX, PAGE_SIZE,
>> -                                                0, rtas_region);
>> -       if (!rtas_rmo_buf)
>> -               panic("ERROR: RTAS: Failed to allocate %lx bytes below
>> %pa\n",
>> -                     PAGE_SIZE, &rtas_region);
>> ===
>>
>> May be store in the FDT as "linux,rmo-base" next to "linux,rtas-base",
>> for clarity, as sharing symbols between prom and main kernel is a bit
>> tricky.
>>
>> The benefit is that we do not do the same thing   (== find 64K in RMA)
>> in 2 different ways and if the RMO allocated my way is broken - we'll
>> know it much sooner as RTAS itself will break too.
> 
> Implementation details aside... I'll grant that combining the
> allocations into one in prom_init reduces some duplication in the sense
> that both are subject to the same constraints (mostly - the RTAS data
> area must not cross a 256MB boundary, while the user region may). But
> they really are distinct concerns. The RTAS private data area is
> specified in the platform architecture, the OS is obligated to allocate
> it and pass it to instantiate-rtas, etc etc. However the user region
> (rtas_rmo_buf) is purely a Linux construct which is there to support
> sys_rtas.

Not purely - it should be an address which RTAS accepts. Cannot argue 
with the rest though, it all sounds correct.

> Now, there are multiple sites in the kernel proper that must allocate
> memory suitable for passing to RTAS. Obviously there is value in
> consolidating the logic for that purpose in one place, so I'll work on
> adding that in v2. OK?

Sure.


-- 
Alexey
