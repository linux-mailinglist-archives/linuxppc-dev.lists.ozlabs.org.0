Return-Path: <linuxppc-dev+bounces-15258-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F985CF3231
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 12:05:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlBLC4hGCz2xHt;
	Mon, 05 Jan 2026 22:05:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767611155;
	cv=none; b=Wh0mBAhUmVx3uZW73KlvmDq/cD2V6SBbH1vMgFgZ5VLpP7oyGJIl4yCtbbOYaJZrZHXF8O9XtDoTYrnC5QFlKdPAk2PMZ99/FQMFLRZWhnWAZpddzCtAf5mrvHAu4wLn5FsywxGrZP307LtR6VB6JWOM7JDgfjuwiurNPJhkm9SRZVpqvCvkLtyaxAHuovXFlPRNGbBA8qKeeSej8AKJw3eyvynn6ZlW1DMP0pIRhjrZgnapU9e1vAjPsZHm+Ka+3ngxGqOwkkN2traJL9ukH/MpuE+7URG2qEB53/1JheQpos8XGP7Egk8haCsIJSuTYOXagAfWrLVZVqWSjMPMBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767611155; c=relaxed/relaxed;
	bh=MJYHkYuydpY2/DvHn3CvEN2xXedIpu0NCd5blmdiT8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPn9NQN6iCRuKJXCqWAs7YuBUaUBcLIBo6ywRA7RfBL0WlKl8XE1XxDG4HS8qqdriXmYhKbDMmC5cLfzl+7Dq0gBOzglkaLbZHqKuQ6vHipe9EhjkvtCy7NTa0dQw9QFpqSiq6z/a1O0kjiKcv3f1kyV3lB2qOuX/lgqXbUJCMsBGs9ucgcOCmhu8cEJHYDFenMHyZV7xcGBjQsui6kD3lr34W8uNnOTuHkt1zq1tn0stEl9mzAyi6mXq8G8mMf4WnWDkp+MlGI39VRbnytplNJM6KL57Nd5LCuXB+xopjCA54d6IubHvHT/k+rbTnbHoVB2phD2OMWr0nPG3jA9EQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlBLB4YFYz2x9W
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 22:05:53 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6BC5497;
	Mon,  5 Jan 2026 03:05:15 -0800 (PST)
Received: from [10.1.38.150] (XHFQ2J9959.cambridge.arm.com [10.1.38.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 652C93F5A1;
	Mon,  5 Jan 2026 03:05:19 -0800 (PST)
Message-ID: <60c5d7b1-1ab7-490c-8cb8-dfd50cf23856@arm.com>
Date: Mon, 5 Jan 2026 11:05:18 +0000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] randomize_kstack: Unify random source across
 arches
Content-Language: en-GB
To: David Laight <david.laight.linux@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
 <20260102131156.3265118-4-ryan.roberts@arm.com>
 <20260104230136.7aaf8886@pumpkin>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260104230136.7aaf8886@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 04/01/2026 23:01, David Laight wrote:
> On Fri,  2 Jan 2026 13:11:54 +0000
> Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
>> Previously different architectures were using random sources of
>> differing strength and cost to decide the random kstack offset. A number
>> of architectures (loongarch, powerpc, s390, x86) were using their
>> timestamp counter, at whatever the frequency happened to be. Other
>> arches (arm64, riscv) were using entropy from the crng via
>> get_random_u16().
>>
>> There have been concerns that in some cases the timestamp counters may
>> be too weak, because they can be easily guessed or influenced by user
>> space. And get_random_u16() has been shown to be too costly for the
>> level of protection kstack offset randomization provides.
>>
>> So let's use a common, architecture-agnostic source of entropy; a
>> per-cpu prng, seeded at boot-time from the crng. This has a few
>> benefits:
>>
>>   - We can remove choose_random_kstack_offset(); That was only there to
>>     try to make the timestamp counter value a bit harder to influence
>>     from user space.
>>
>>   - The architecture code is simplified. All it has to do now is call
>>     add_random_kstack_offset() in the syscall path.
>>
>>   - The strength of the randomness can be reasoned about independently
>>     of the architecture.
>>
>>   - Arches previously using get_random_u16() now have much faster
>>     syscall paths, see below results.
>>
>> There have been some claims that a prng may be less strong than the
>> timestamp counter if not regularly reseeded. But the prng has a period
>> of about 2^113. So as long as the prng state remains secret, it should
>> not be possible to guess. If the prng state can be accessed, we have
>> bigger problems.
> 
> If you have 128 bits of output from consecutive outputs I think you
> can trivially determine the full state using (almost) 'school boy' maths
> that could be done on pencil and paper.
> (Most of the work only has to be done once.)
> 
> The underlying problem is that the TAUSWORTHE() transformation is 'linear'
> So that TAUSWORTHE(x ^ y) == TAUSWORTHE(x) ^ TAUSWORTHE(y).
> (This is true of a LFSR/CRC and TOUSWORTH() is doing some subset of CRCs.)
> This means that each output bit is the 'xor' of some of the input bits.
> The four new 'state' values are just xor of the the bits of the old ones.
> The final xor of the four states gives a 32bit value with each bit just
> an xor of some of the 128 state bits.
> Get four consecutive 32 bit values and you can solve the 128 simultaneous
> equations (by trivial substitution) and get the initial state.
> The solution gives you the 128 128bit constants for:
> 	u128 state = 0;
> 	u128 val = 'value returned from 4 calls';
> 	for (int i = 0; i < 128; i++)
> 		state |= parity(const128[i] ^ val) << i;

What is const128[] here?

> You done need all 32bits, just accumulate 128 bits.  
> So if you can get the 5bit stack offset from 26 system calls you know the
> value that will be used for all the subsequent calls.

It's not immediately obvious to me how user space would do this, but I'll take
it on faith that it may be possible.

> 
> Simply changing the final line to use + not ^ makes the output non-linear
> and solving the equations a lot harder.

There has been pushback on introducing new primitives [1] but I don't think
that's a reason not to considder it.

[1] https://lore.kernel.org/all/aRyppb8PCxFKVphr@zx2c4.com/

> 
> I might sit down tomorrow and see if I can actually code it...

Thanks for the analysis! I look forward to seeing your conclusion... although
I'm not sure I'll be qualified to evaluate it mathematically.

FWIW, I previously had a go at various schemes using siphash to calculate some
random bits. I found it to be significantly slower than this prng. I've so far
taken the view that 6 bits of randomness is not much of a defence against brute
force so we really shouldn't be spending too many cycles to generate the bits.
If we can get to approach to work, I think that's best.

Thanks,
Ryan

> 
> 	David
> 
>  


