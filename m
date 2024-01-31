Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D624A8440C5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 14:38:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X6tSeLvm;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X6tSeLvm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQ3685nC1z3cLk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 00:38:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X6tSeLvm;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X6tSeLvm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQ35Q1DPxz2ykC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Feb 2024 00:38:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706708294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vNnp/Z0S7DqUPASGq4M26R4kayT9Cyd518Jol1/4wN4=;
	b=X6tSeLvm3XP7FqKyxSMn5DXLdP9ZF/5kCckjXO20h3UwwZg/m550T+abphBbzsag+Ff/r/
	xWfOUfVnh1x4YVf12VvQNblxyCWrGAIGiRkRk/QIus5VZqtMRD9jifIkNlpN87ST17JikU
	ZpmPKyYOroo2csYiLnVn2UH4nrDX0r4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706708294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vNnp/Z0S7DqUPASGq4M26R4kayT9Cyd518Jol1/4wN4=;
	b=X6tSeLvm3XP7FqKyxSMn5DXLdP9ZF/5kCckjXO20h3UwwZg/m550T+abphBbzsag+Ff/r/
	xWfOUfVnh1x4YVf12VvQNblxyCWrGAIGiRkRk/QIus5VZqtMRD9jifIkNlpN87ST17JikU
	ZpmPKyYOroo2csYiLnVn2UH4nrDX0r4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-Eg59ONT7N7S_RQMDReuv1w-1; Wed, 31 Jan 2024 08:38:12 -0500
X-MC-Unique: Eg59ONT7N7S_RQMDReuv1w-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40fb64f802dso1590465e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 05:38:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706708291; x=1707313091;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNnp/Z0S7DqUPASGq4M26R4kayT9Cyd518Jol1/4wN4=;
        b=IVo9jG09b5bA2f4pP81J+LUQyZBz9TyE54keMPCLW090EcqusBP4a5yJKhjBy9wewe
         SQ+m03oaTPlZ1l5E6LMqdSDX2JZTLT8OPmr5nJdBufqI5Iaw4/UinW+kDslDErN/CCuN
         uJuCq7VHxo3lMcXU9qNDUEuwJkZ6YqTqwsvHCPN2yEJJDuJbinUVq6adFEVhtP8EEn7F
         sP0jMmLGAtJqFzpsiAnaRQvxZfbnYMizn7Zacquf7qnr/FzwkYrgAyt+qtR84a5J6JWa
         IAvqR1V5g60tTbYDmCVejOeoCEBo+zUxh45+OqxXLg7jbGFtsqEA0gI4OGCGOufM3xya
         mXNA==
X-Gm-Message-State: AOJu0YyDlhftHIxzmICk3mseV+kya8GbXfkrIXFe8OwezxUErP5KgggZ
	M2HyDyKz9cKA1fZl9CnSGMGAgMOw7y1Q2FfzAC5KhU+yaIfKEycNz1ZRs6v2jRD5ETHoZJ2YN2u
	m2mB6wzY4IFFaOU9FmDCXw87dT8PkvelMfEE2dfzhmtv7Qhea+jqblj07dtMHhGQ=
X-Received: by 2002:a05:600c:6551:b0:40e:b93e:4a0f with SMTP id dn17-20020a05600c655100b0040eb93e4a0fmr1406569wmb.19.1706708291163;
        Wed, 31 Jan 2024 05:38:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoAHxE3D/zHX4Njds0uFxoI5Tm9039gsOQ1jUjIaqjF15lPY9fb5u6xV8tefJ0lfUgXMicvQ==
X-Received: by 2002:a05:600c:6551:b0:40e:b93e:4a0f with SMTP id dn17-20020a05600c655100b0040eb93e4a0fmr1406543wmb.19.1706708290739;
        Wed, 31 Jan 2024 05:38:10 -0800 (PST)
Received: from [10.32.64.237] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600016c900b0033aedb71269sm8183465wrf.88.2024.01.31.05.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 05:38:10 -0800 (PST)
Message-ID: <c63870b0-690a-4051-b4f5-296cf3b73be2@redhat.com>
Date: Wed, 31 Jan 2024 14:38:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] mm/memory: optimize fork() with PTE-mapped THP
To: Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
References: <20240129124649.189745-1-david@redhat.com>
 <a335a9d2-9b8f-4eb8-ba22-23a223b59b06@arm.com>
 <a1a0e9b3-dae2-418f-bd63-50e65f471728@redhat.com>
 <57eb82c7-4816-42a2-b5ab-cc221e289b21@arm.com>
 <e6eaba5b-f290-4d1f-990b-a47d89f56ee4@redhat.com>
 <714d0930-2202-48b6-9728-d248f820325e@arm.com>
 <dcaa20c4-bd1f-4f15-bb0a-3a790808937d@arm.com>
 <30718fc8-15cf-41e4-922c-5cdbf00a0840@redhat.com>
 <de975655-8f8f-40dc-b281-75c40dd1e2c1@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <de975655-8f8f-40dc-b281-75c40dd1e2c1@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>>> Nope: looks the same. I've taken my test harness out of the picture and done
>>> everything manually from the ground up, with the old tests and the new. Headline
>>> is that I see similar numbers from both.
>>
>> I took me a while to get really reproducible numbers on Intel. Most importantly:
>> * Set a fixed CPU frequency, disabling any boost and avoiding any
>>    thermal throttling.
>> * Pin the test to CPUs and set a nice level.
> 
> I'm already pinning the test to cpu 0. But for M2, at least, I'm running in a VM
> on top of macos, and I don't have a mechanism to pin the QEMU threads to the
> physical CPUs. Anyway, I don't think these are problems because for a given
> kernel build I can accurately repro numbers.

Oh, you do have a layer of virtualization in there. I *suspect* that 
might amplify some odd things regarding code layout, caching effects, etc.

I guess especially the fork() benchmark is too sensible (fast) for 
things like that, so I would just focus on bare metal results where you 
can control the environment completely.

Note that regarding NUMA effects, I mean when some memory access within 
the same socket is faster/slower even with only a single node. On AMD 
EPYC that's possible, depending on which core you are running and on 
which memory controller the memory you want to access is located. If 
both are in different quadrants IIUC, the access latency will be different.

>> But yes: I was observing something similar on AMD EPYC, where you get
>> consecutive pages from the buddy, but once you allocate from the PCP it might no
>> longer be consecutive.
>>
>>>    - test is 5-10% slower when output is printed to terminal vs when redirected to
>>>      file. I've always effectively been redirecting. Not sure if this overhead
>>>      could start to dominate the regression and that's why you don't see it?
>>
>> That's weird, because we don't print while measuring? Anyhow, 5/10% variance on
>> some system is not the end of the world.
> 
> I imagine its cache effects? More work to do to print the output could be
> evicting some code that's in the benchmark path?

Maybe. Do you also see these oddities on the bare metal system?

> 
>>
>>>
>>> I'm inclined to run this test for the last N kernel releases and if the number
>>> moves around significantly, conclude that these tests don't really matter.
>>> Otherwise its an exercise in randomly refactoring code until it works well, but
>>> that's just overfitting to the compiler and hw. What do you think?
>>
>> Personally, I wouldn't lose sleep if you see weird, unexplainable behavior on
>> some system (not even architecture!). Trying to optimize for that would indeed
>> be random refactorings.
>>
>> But I would not be so fast to say that "these tests don't really matter" and
>> then go wild and degrade them as much as you want. There are use cases that care
>> about fork performance especially with order-0 pages -- such as Redis.
> 
> Indeed. But also remember that my fork baseline time is ~2.5ms, and I think you
> said yours was 14ms :)

Yes, no idea why M2 is that fast (BTW, which page size? 4k or 16k? ) :)

> 
> I'll continue to mess around with it until the end of the day. But I'm not
> making any headway, then I'll change tack; I'll just measure the performance of
> my contpte changes using your fork/zap stuff as the baseline and post based on that.

You should likely not focus on M2 results. Just pick a representative 
bare metal machine where you get consistent, explainable results.

Nothing in the code is fine-tuned for a particular architecture so far, 
only order-0 handling is kept separate.

BTW: I see the exact same speedups for dontneed that I see for munmap. 
For example, for order-9, it goes from 0.023412s -> 0.009785, so -58%. 
So I'm curious why you see a speedup for munmap but not for dontneed.

-- 
Cheers,

David / dhildenb

