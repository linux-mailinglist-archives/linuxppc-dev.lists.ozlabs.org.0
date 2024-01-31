Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F68843E1D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 12:17:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPzyy1v4Bz3c3g
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 22:17:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPzyX2KgLz30gC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 22:17:06 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1741CDA7;
	Wed, 31 Jan 2024 03:17:18 -0800 (PST)
Received: from [10.57.79.60] (unknown [10.57.79.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCBC23F762;
	Wed, 31 Jan 2024 03:16:28 -0800 (PST)
Message-ID: <57eb82c7-4816-42a2-b5ab-cc221e289b21@arm.com>
Date: Wed, 31 Jan 2024 11:16:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] mm/memory: optimize fork() with PTE-mapped THP
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20240129124649.189745-1-david@redhat.com>
 <a335a9d2-9b8f-4eb8-ba22-23a223b59b06@arm.com>
 <a1a0e9b3-dae2-418f-bd63-50e65f471728@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <a1a0e9b3-dae2-418f-bd63-50e65f471728@redhat.com>
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

On 31/01/2024 11:06, David Hildenbrand wrote:
> On 31.01.24 11:43, Ryan Roberts wrote:
>> On 29/01/2024 12:46, David Hildenbrand wrote:
>>> Now that the rmap overhaul[1] is upstream that provides a clean interface
>>> for rmap batching, let's implement PTE batching during fork when processing
>>> PTE-mapped THPs.
>>>
>>> This series is partially based on Ryan's previous work[2] to implement
>>> cont-pte support on arm64, but its a complete rewrite based on [1] to
>>> optimize all architectures independent of any such PTE bits, and to
>>> use the new rmap batching functions that simplify the code and prepare
>>> for further rmap accounting changes.
>>>
>>> We collect consecutive PTEs that map consecutive pages of the same large
>>> folio, making sure that the other PTE bits are compatible, and (a) adjust
>>> the refcount only once per batch, (b) call rmap handling functions only
>>> once per batch and (c) perform batch PTE setting/updates.
>>>
>>> While this series should be beneficial for adding cont-pte support on
>>> ARM64[2], it's one of the requirements for maintaining a total mapcount[3]
>>> for large folios with minimal added overhead and further changes[4] that
>>> build up on top of the total mapcount.
>>>
>>> Independent of all that, this series results in a speedup during fork with
>>> PTE-mapped THP, which is the default with THPs that are smaller than a PMD
>>> (for example, 16KiB to 1024KiB mTHPs for anonymous memory[5]).
>>>
>>> On an Intel Xeon Silver 4210R CPU, fork'ing with 1GiB of PTE-mapped folios
>>> of the same size (stddev < 1%) results in the following runtimes
>>> for fork() (shorter is better):
>>>
>>> Folio Size | v6.8-rc1 |      New | Change
>>> ------------------------------------------
>>>        4KiB | 0.014328 | 0.014035 |   - 2%
>>>       16KiB | 0.014263 | 0.01196  |   -16%
>>>       32KiB | 0.014334 | 0.01094  |   -24%
>>>       64KiB | 0.014046 | 0.010444 |   -26%
>>>      128KiB | 0.014011 | 0.010063 |   -28%
>>>      256KiB | 0.013993 | 0.009938 |   -29%
>>>      512KiB | 0.013983 | 0.00985  |   -30%
>>>     1024KiB | 0.013986 | 0.00982  |   -30%
>>>     2048KiB | 0.014305 | 0.010076 |   -30%
>>
>> Just a heads up that I'm seeing some strange results on Apple M2. Fork for
>> order-0 is seemingly costing ~17% more. I'm using GCC 13.2 and was pretty sure I
>> didn't see this problem with version 1; although that was on a different
>> baseline and I've thrown the numbers away so will rerun and try to debug this.
>>
> 
> So far, on my x86 tests (Intel, AMD EPYC), I was not able to observe this.
> fork() for order-0 was consistently effectively unchanged. Do you observe that
> on other ARM systems as well?

Nope; running the exact same kernel binary and user space on Altra, I see
sensible numbers;

fork order-0: -1.3%
fork order-9: -7.6%
dontneed order-0: -0.5%
dontneed order-9: 0.1%
munmap order-0: 0.0%
munmap order-9: -67.9%

So I guess some pipelining issue that causes the M2 to stall more?

> 
> 
>> | kernel      |   mean_rel |   std_rel |
>> |:------------|-----------:|----------:|
>> | mm-unstable |       0.0% |      1.1% |
>> | patch 1     |      -2.3% |      1.3% |
>> | patch 10    |      -2.9% |      2.7% |
>> | patch 11    |      13.5% |      0.5% |
>> | patch 12    |      15.2% |      1.2% |
>> | patch 13    |      18.2% |      0.7% |
>> | patch 14    |      20.5% |      1.0% |
>> | patch 15    |      17.1% |      1.6% |
>> | patch 15    |      16.7% |      0.8% |
>>
>> fork for order-9 is looking good (-20%), and for the zap series, munmap is
>> looking good, but dontneed is looking poor for both order-0 and 9. But one thing
>> at a time... let's concentrate on fork order-0 first.
> 
> munmap and dontneed end up calling the exact same call paths. So a big
> performance difference is rather surprising and might indicate something else.
> 
> (I think I told you that I was running in some kind of VMA merging problem where
> one would suddenly get with my benchmark 1 VMA per page. The new benchmark below
> works around that, but I am not sure if that was fixed in the meantime)
> 
> VMA merging can of course explain a big difference in fork and munmap vs.
> dontneed times, especially when comparing different code base where that VMA
> merging behavior was different.
> 
>>
>> Note that I'm still using the "old" benchmark code. Could you resend me the link
>> to the new code? Although I don't think there should be any effect for order-0
>> anyway, if I understood your changes correctly?
> 
> This is the combined one (small and large PTEs):
> 
> https://gitlab.com/davidhildenbrand/scratchspace/-/raw/main/pte-mapped-folio-benchmarks.c?inline=false

I'll have a go with this.

> 

