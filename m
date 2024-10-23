Return-Path: <linuxppc-dev+bounces-2501-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E279AC6A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 11:31:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYP2J1ZhJz2xl6;
	Wed, 23 Oct 2024 20:31:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729675912;
	cv=none; b=nEKcVE3dHT70lJ2Jn8ouRSDRijK1ZJH84oiWXrA5B3ZxgxA+Re+Sng04liqGZzSVy1HnZ95BggwWoY+6U3F+0UFg0VWaF14hHJxCJpTx5c/JczfJ+ZhbhrtNp2fr/dkGOWdUcq+wcT/CmIMzwL2p9T3fwEZqXJtqQXXBy7MMu+8hv2+wFFmBYqY4CwO23Zawde7D/+Oa6+YcsG5Pgbu9pxd1lLuXaX4cnDS3kCQ2WK3NA4OqHdUHjzWjrLOy7vwqEy6Jun2ptnKg3Ev2PntgXPRckU8e8izqeJl0/LG5wdvgDlS1+FbERxsNpIob6Tgx5iolVlc9AOUxc+6AYtFLlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729675912; c=relaxed/relaxed;
	bh=/8EGBedsGvmz0PvjGsC5fKtjKG6Hbn3Efyh+d6NyfXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Bjz5crghopzsF0tX85gFwBIdI/XnLP69C0aBDz6P7X5oUa4/4+ITWXcuWFx0EMBmtwhNduQy1f1cFLIoJQpSBeCIJi+y5wRjLJAKYqI88P61NsOtQ5DMbIgLbz8XgGX40rJeXBkt75mogXswM1lRQMjSSBa/Rl6qA+s8dhg52LEqrK6fZqZWquukv8pqsXJ7X3MGWklSDf47q4BCy3I57LQP1WxtuJWsbHD1wSmOjsXoUMrCqPyHTnfMAamlDocNRJ8M+BJGJDsgIwkJT7z3NdkzYfLFL7Dv4coBfOMx2O22q/xqwCpIACE4tCrq1E9ZyeUzuUKCopGs3TdLsG+6Jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=steven.price@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=steven.price@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYP2G3jBRz2xWZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 20:31:48 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FB5B339;
	Wed, 23 Oct 2024 02:31:45 -0700 (PDT)
Received: from [10.57.23.17] (unknown [10.57.23.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 199163F73B;
	Wed, 23 Oct 2024 02:31:05 -0700 (PDT)
Message-ID: <07c5e292-5218-43ee-a167-da09d108a663@arm.com>
Date: Wed, 23 Oct 2024 10:31:03 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/4] mm: Introduce MAP_BELOW_HINT
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Charlie Jenkins <charlie@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
 <yu7um2tcxg2apoz372rmzpkrfgbb42ndvabvrsp4usb2e3bkrf@huaucjsp5vlj>
 <Ztnp3OAIRz/daj7s@ghost>
 <pbotlphw77fkfacldtpxfjcs2w5nhb2uvxszv5rmlrhjm42akd@4pvcqb7ojq4v>
 <b6ca55b7-4de2-4085-97bd-619f91d9fcb8@arm.com>
 <5u7xntjdye5ejjmkgpp7m3ogpzblxcztrwngulejdft63fzuwf@xcxfcbaccqtw>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <5u7xntjdye5ejjmkgpp7m3ogpzblxcztrwngulejdft63fzuwf@xcxfcbaccqtw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Liam,

On 21/10/2024 20:48, Liam R. Howlett wrote:
> * Steven Price <steven.price@arm.com> [241021 09:23]:
>> On 09/09/2024 10:46, Kirill A. Shutemov wrote:
>>> On Thu, Sep 05, 2024 at 10:26:52AM -0700, Charlie Jenkins wrote:
>>>> On Thu, Sep 05, 2024 at 09:47:47AM +0300, Kirill A. Shutemov wrote:
>>>>> On Thu, Aug 29, 2024 at 12:15:57AM -0700, Charlie Jenkins wrote:
>>>>>> Some applications rely on placing data in free bits addresses allocated
>>>>>> by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
>>>>>> address returned by mmap to be less than the 48-bit address space,
>>>>>> unless the hint address uses more than 47 bits (the 48th bit is reserved
>>>>>> for the kernel address space).
>>>>>>
>>>>>> The riscv architecture needs a way to similarly restrict the virtual
>>>>>> address space. On the riscv port of OpenJDK an error is thrown if
>>>>>> attempted to run on the 57-bit address space, called sv57 [1].  golang
>>>>>> has a comment that sv57 support is not complete, but there are some
>>>>>> workarounds to get it to mostly work [2].
>>>
>>> I also saw libmozjs crashing with 57-bit address space on x86.
>>>
>>>>>> These applications work on x86 because x86 does an implicit 47-bit
>>>>>> restriction of mmap() address that contain a hint address that is less
>>>>>> than 48 bits.
>>>>>>
>>>>>> Instead of implicitly restricting the address space on riscv (or any
>>>>>> current/future architecture), a flag would allow users to opt-in to this
>>>>>> behavior rather than opt-out as is done on other architectures. This is
>>>>>> desirable because it is a small class of applications that do pointer
>>>>>> masking.
>>>
>>> You reiterate the argument about "small class of applications". But it
>>> makes no sense to me.
>>
>> Sorry to chime in late on this - I had been considering implementing
>> something like MAP_BELOW_HINT and found this thread.
>>
>> While the examples of applications that want to use high VA bits and get
>> bitten by future upgrades is not very persuasive. It's worth pointing
>> out that there are a variety of somewhat horrid hacks out there to work
>> around this feature not existing.
>>
>> E.g. from my brief research into other code:
>>
>>   * Box64 seems to have a custom allocator based on reading 
>>     /proc/self/maps to allocate a block of VA space with a low enough 
>>     address [1]
>>
>>   * PHP has code reading /proc/self/maps - I think this is to find a 
>>     segment which is close enough to the text segment [2]
>>
>>   * FEX-Emu mmap()s the upper 128TB of VA on Arm to avoid full 48 bit
>>     addresses [3][4]
> 
> Can't the limited number of applications that need to restrict the upper
> bound use an LD_PRELOAD compatible library to do this?

I'm not entirely sure what point you are making here. Yes an LD_PRELOAD
approach could be used instead of a personality type as a 'hack' to
preallocate the upper address space. The obvious disadvantage is that
you can't (easily) layer LD_PRELOAD so it won't work in the general case.

>>
>>   * pmdk has some funky code to find the lowest address that meets 
>>     certain requirements - this does look like an ALSR alternative and 
>>     probably couldn't directly use MAP_BELOW_HINT, although maybe this 
>>     suggests we need a mechanism to map without a VA-range? [5]
>>
>>   * MIT-Scheme parses /proc/self/maps to find the lowest mapping within 
>>     a range [6]
>>
>>   * LuaJIT uses an approach to 'probe' to find a suitable low address 
>>     for allocation [7]
>>
> 
> Although I did not take a deep dive into each example above, there are
> some very odd things being done, we will never cover all the use cases
> with an exact API match.  What we have today can be made to work for
> these users as they have figured ways to do it.
> 
> Are they pretty? no.  Are they common? no.  I'm not sure it's worth
> plumbing in new MM code in for these users.

My issue with the existing 'solutions' is that they all seem to be fragile:

 * Using /proc/self/maps is inherently racy if there could be any other
code running in the process at the same time.

 * Attempting to map the upper part of the address space only works if
done early enough - once an allocation arrives there, there's very
little you can robustly do (because the stray allocation might be freed).

 * LuaJIT's probing mechanism is probably robust, but it's inefficient -
LuaJIT has a fallback of linear probing, following by no hint (ASLR),
followed by pseudo-random probing. I don't know the history of the code
but it looks like it's probably been tweaked to try to avoid performance
issues.

>> The biggest benefit I see of MAP_BELOW_HINT is that it would allow a
>> library to get low addresses without causing any problems for the rest
>> of the application. The use case I'm looking at is in a library and 
>> therefore a personality mode wouldn't be appropriate (because I don't 
>> want to affect the rest of the application). Reading /proc/self/maps
>> is also problematic because other threads could be allocating/freeing
>> at the same time.
> 
> As long as you don't exhaust the lower limit you are trying to allocate
> within - which is exactly the issue riscv is hitting.

Obviously if you actually exhaust the lower limit then any
MAP_BELOW_HINT API would also fail - there's really not much that can be
done in that case.

> I understand that you are providing examples to prove that this is
> needed, but I feel like you are better demonstrating the flexibility
> exists to implement solutions in different ways using todays API.

My intention is to show that today's API doesn't provide a robust way of
doing this. Although I'm quite happy if you can point me at a robust way
with the current API. As I mentioned my goal is to be able to map memory
in a (multithreaded) library with a (ideally configurable) number of VA
bits. I don't particularly want to restrict the whole process, just
specific allocations.

I had typed up a series similar to this one as a MAP_BELOW flag would
fit my use-case well.

> I think it would be best to use the existing methods and work around the
> issue that was created in riscv while future changes could mirror amd64
> and arm64.

The riscv issue is a different issue to the one I'm trying to solve. I
agree MAP_BELOW_HINT isn't a great fix for that because we already have
differences between amd64 and arm64 and obviously no software currently
out there uses this new flag.

However, if we had introduced this flag in the past (e.g. if MAP_32BIT
had been implemented more generically, across architectures and with a
hint value, like this new flag) then we probably wouldn't be in this
situation. Applications that want to restrict the VA space would be able
to opt-in and be portable across architectures.

Another potential option is a mmap3() which actually allows the caller
to place constraints on the VA space (e.g. minimum, maximum and
alignment). There's plenty of code out there that has to over-allocate
and munmap() the unneeded part for alignment reasons. But I don't have a
specific need for that, and I'm guessing you wouldn't be in favour.

Thanks,
Steve

> ...
>>
>>
>> [1] https://sources.debian.org/src/box64/0.3.0+dfsg-1/src/custommem.c/
>> [2] https://sources.debian.org/src/php8.2/8.2.24-1/ext/opcache/shared_alloc_mmap.c/#L62
>> [3] https://github.com/FEX-Emu/FEX/blob/main/FEXCore/Source/Utils/Allocator.cpp
>> [4] https://github.com/FEX-Emu/FEX/commit/df2f1ad074e5cdfb19a0bd4639b7604f777fb05c
>> [5] https://sources.debian.org/src/pmdk/1.13.1-1.1/src/common/mmap_posix.c/?hl=29#L29
>> [6] https://sources.debian.org/src/mit-scheme/12.1-3/src/microcode/ux.c/#L826
>> [7] https://sources.debian.org/src/luajit/2.1.0+openresty20240815-1/src/lj_alloc.c/
>>
> ...
> 
> Thanks,
> Liam


