Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8478442B0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 16:10:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQ57D5y7Lz3cXW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 02:10:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQ56m2mz0z30YR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Feb 2024 02:09:35 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D20E11FB;
	Wed, 31 Jan 2024 07:09:47 -0800 (PST)
Received: from [10.57.79.60] (unknown [10.57.79.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2251E3F762;
	Wed, 31 Jan 2024 07:09:00 -0800 (PST)
Message-ID: <eeafba09-058f-47da-bbb9-19ded5ad05da@arm.com>
Date: Wed, 31 Jan 2024 15:08:58 +0000
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
 <a0cdeb7c-dec8-4971-8b54-e6f65ea48ade@arm.com>
 <74333154-a99b-4bad-81f4-bee02ba05e91@redhat.com>
 <a34eee7e-3970-4cdd-8c09-bca51132db50@arm.com>
 <cee2c0ed-661d-4948-8bc9-77c87c486c86@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <cee2c0ed-661d-4948-8bc9-77c87c486c86@redhat.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 31/01/2024 15:05, David Hildenbrand wrote:
> On 31.01.24 16:02, Ryan Roberts wrote:
>> On 31/01/2024 14:29, David Hildenbrand wrote:
>>>>> Note that regarding NUMA effects, I mean when some memory access within the
>>>>> same
>>>>> socket is faster/slower even with only a single node. On AMD EPYC that's
>>>>> possible, depending on which core you are running and on which memory
>>>>> controller
>>>>> the memory you want to access is located. If both are in different quadrants
>>>>> IIUC, the access latency will be different.
>>>>
>>>> I've configured the NUMA to only bring the RAM and CPUs for a single socket
>>>> online, so I shouldn't be seeing any of these effects. Anyway, I've been using
>>>> the Altra as a secondary because its so much slower than the M2. Let me move
>>>> over to it and see if everything looks more straightforward there.
>>>
>>> Better use a system where people will actually run Linux production workloads
>>> on, even if it is slower :)
>>>
>>> [...]
>>>
>>>>>>
>>>>>> I'll continue to mess around with it until the end of the day. But I'm not
>>>>>> making any headway, then I'll change tack; I'll just measure the
>>>>>> performance of
>>>>>> my contpte changes using your fork/zap stuff as the baseline and post
>>>>>> based on
>>>>>> that.
>>>>>
>>>>> You should likely not focus on M2 results. Just pick a representative bare
>>>>> metal
>>>>> machine where you get consistent, explainable results.
>>>>>
>>>>> Nothing in the code is fine-tuned for a particular architecture so far, only
>>>>> order-0 handling is kept separate.
>>>>>
>>>>> BTW: I see the exact same speedups for dontneed that I see for munmap. For
>>>>> example, for order-9, it goes from 0.023412s -> 0.009785, so -58%. So I'm
>>>>> curious why you see a speedup for munmap but not for dontneed.
>>>>
>>>> Ugh... ok, coming up.
>>>
>>> Hopefully you were just staring at the wrong numbers (e.g., only with fork
>>> patches). Because both (munmap/pte-dontneed) are using the exact same code path.
>>>
>>
>> Ahh... I'm doing pte-dontneed, which is the only option in your original
>> benchmark - it does MADV_DONTNEED one page at a time. It looks like your new
>> benchmark has an additional "dontneed" option that does it in one shot. Which
>> option are you running? Assuming the latter, I think that explains it.
> 
> I temporarily removed that option and then re-added it. Guess you got a wrong
> snapshot of the benchmark :D
> 
> pte-dontneed not observing any change is great (no batching possible).

indeed.

> 
> dontneed should hopefully/likely see a speedup.

Yes, but that's almost exactly the same path as munmap, so I'm sure it really
adds much for this particular series. Anyway, on Altra at least, I'm seeing no
regressions, so:

Tested-by: Ryan Roberts <ryan.roberts@arm.com>

> 
> Great!
> 

