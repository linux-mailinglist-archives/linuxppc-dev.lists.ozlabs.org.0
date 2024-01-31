Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7FE84412F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 14:59:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQ3YR1Yspz3cTN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 00:59:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQ3Y10ZQ5z2yVb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Feb 2024 00:58:42 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8591DA7;
	Wed, 31 Jan 2024 05:58:54 -0800 (PST)
Received: from [10.57.79.60] (unknown [10.57.79.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 724A83F738;
	Wed, 31 Jan 2024 05:58:06 -0800 (PST)
Message-ID: <a0cdeb7c-dec8-4971-8b54-e6f65ea48ade@arm.com>
Date: Wed, 31 Jan 2024 13:58:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] mm/memory: optimize fork() with PTE-mapped THP
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20240129124649.189745-1-david@redhat.com>
 <a335a9d2-9b8f-4eb8-ba22-23a223b59b06@arm.com>
 <a1a0e9b3-dae2-418f-bd63-50e65f471728@redhat.com>
 <57eb82c7-4816-42a2-b5ab-cc221e289b21@arm.com>
 <e6eaba5b-f290-4d1f-990b-a47d89f56ee4@redhat.com>
 <714d0930-2202-48b6-9728-d248f820325e@arm.com>
 <dcaa20c4-bd1f-4f15-bb0a-3a790808937d@arm.com>
 <30718fc8-15cf-41e4-922c-5cdbf00a0840@redhat.com>
 <de975655-8f8f-40dc-b281-75c40dd1e2c1@arm.com>
 <c63870b0-690a-4051-b4f5-296cf3b73be2@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <c63870b0-690a-4051-b4f5-296cf3b73be2@redhat.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 31/01/2024 13:38, David Hildenbrand wrote:
>>>> Nope: looks the same. I've taken my test harness out of the picture and done
>>>> everything manually from the ground up, with the old tests and the new.
>>>> Headline
>>>> is that I see similar numbers from both.
>>>
>>> I took me a while to get really reproducible numbers on Intel. Most importantly:
>>> * Set a fixed CPU frequency, disabling any boost and avoiding any
>>>    thermal throttling.
>>> * Pin the test to CPUs and set a nice level.
>>
>> I'm already pinning the test to cpu 0. But for M2, at least, I'm running in a VM
>> on top of macos, and I don't have a mechanism to pin the QEMU threads to the
>> physical CPUs. Anyway, I don't think these are problems because for a given
>> kernel build I can accurately repro numbers.
> 
> Oh, you do have a layer of virtualization in there. I *suspect* that might
> amplify some odd things regarding code layout, caching effects, etc.
> 
> I guess especially the fork() benchmark is too sensible (fast) for things like
> that, so I would just focus on bare metal results where you can control the
> environment completely.

Yeah, maybe. OK I'll park M2 for now.

> 
> Note that regarding NUMA effects, I mean when some memory access within the same
> socket is faster/slower even with only a single node. On AMD EPYC that's
> possible, depending on which core you are running and on which memory controller
> the memory you want to access is located. If both are in different quadrants
> IIUC, the access latency will be different.

I've configured the NUMA to only bring the RAM and CPUs for a single socket
online, so I shouldn't be seeing any of these effects. Anyway, I've been using
the Altra as a secondary because its so much slower than the M2. Let me move
over to it and see if everything looks more straightforward there.

> 
>>> But yes: I was observing something similar on AMD EPYC, where you get
>>> consecutive pages from the buddy, but once you allocate from the PCP it might no
>>> longer be consecutive.
>>>
>>>>    - test is 5-10% slower when output is printed to terminal vs when
>>>> redirected to
>>>>      file. I've always effectively been redirecting. Not sure if this overhead
>>>>      could start to dominate the regression and that's why you don't see it?
>>>
>>> That's weird, because we don't print while measuring? Anyhow, 5/10% variance on
>>> some system is not the end of the world.
>>
>> I imagine its cache effects? More work to do to print the output could be
>> evicting some code that's in the benchmark path?
> 
> Maybe. Do you also see these oddities on the bare metal system?
> 
>>
>>>
>>>>
>>>> I'm inclined to run this test for the last N kernel releases and if the number
>>>> moves around significantly, conclude that these tests don't really matter.
>>>> Otherwise its an exercise in randomly refactoring code until it works well, but
>>>> that's just overfitting to the compiler and hw. What do you think?
>>>
>>> Personally, I wouldn't lose sleep if you see weird, unexplainable behavior on
>>> some system (not even architecture!). Trying to optimize for that would indeed
>>> be random refactorings.
>>>
>>> But I would not be so fast to say that "these tests don't really matter" and
>>> then go wild and degrade them as much as you want. There are use cases that care
>>> about fork performance especially with order-0 pages -- such as Redis.
>>
>> Indeed. But also remember that my fork baseline time is ~2.5ms, and I think you
>> said yours was 14ms :)
> 
> Yes, no idea why M2 is that fast (BTW, which page size? 4k or 16k? ) :)

The guest kernel is using 4K pages. I'm not quite sure what is happening at
stage2; QEMU doesn't expose any options to explicitly request huge pages for
macos AFAICT.

> 
>>
>> I'll continue to mess around with it until the end of the day. But I'm not
>> making any headway, then I'll change tack; I'll just measure the performance of
>> my contpte changes using your fork/zap stuff as the baseline and post based on
>> that.
> 
> You should likely not focus on M2 results. Just pick a representative bare metal
> machine where you get consistent, explainable results.
> 
> Nothing in the code is fine-tuned for a particular architecture so far, only
> order-0 handling is kept separate.
> 
> BTW: I see the exact same speedups for dontneed that I see for munmap. For
> example, for order-9, it goes from 0.023412s -> 0.009785, so -58%. So I'm
> curious why you see a speedup for munmap but not for dontneed.

Ugh... ok, coming up.

