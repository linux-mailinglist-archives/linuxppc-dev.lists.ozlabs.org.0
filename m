Return-Path: <linuxppc-dev+bounces-15539-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1B7D128B1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 13:27:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqWpg4QfKz30Ng;
	Mon, 12 Jan 2026 23:27:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768220827;
	cv=none; b=aGhp0YmSAuq4S9gW4q6Gfv2d0U0UDA4V9liiJfAUH22FuO0ovOMeVcw2B19DPOKOTZJOpWIGJZjh4zZTA/775XItZ1p87hRQzIgKUvVtP19UQC7OUTAz3DU3oLZAfip6v8iZXwdhRjQVZq3uxbJGCkCnFaJcowxGncsuchLjeQES6aIO/Hs+J5Kg4VouKASA7OBSFZS9C94zUIy+slsvbHOULlrC8KTSPSRVXGt0ksLJCgxVqAiRFBDm9XTIfIhs03Fg8XfyfEX4xkOs9Htax/9C8W6RjbJGBDVJ80ej+5M13H2GOBVCfsHBbBk7eXu/2s5H4gK1zxe8wWKInt58pA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768220827; c=relaxed/relaxed;
	bh=1NByF4KBwn5Wl03L5TAReJyDFw2mFLa47LsnRyfC4To=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cS4AKrYKA22Y+xfzbfHpgBk9JIvOkwhBieplVYGoJSFAjYv2dbcbrIMRKMsUcCFHETkRcafyYNlHgThjuqYU1uJmRhDgWuOj3P4LpHrlvMuNjCxufKRJE1DkwC7t8JeY3ctZQwL/njZscbUmNbbslmpyCSKFPXJvw5fcdV7NA8lnFVOOmpnMGJBaLws5hIZk121Awo6HJVQJLYB4lt55ON+egelIhfdw0UJm58OkFqvbqkKacOAqvr/P21DIacEiakWKjG6lDHe058pIkyFCLEoTSH3U2/15M239Wd0UrOg351bRmgqjRMEKJKJoJRIvLT5djMsza9qmjwqLOMOrlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqWpf2H8sz30HQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 23:27:04 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D88E497;
	Mon, 12 Jan 2026 04:26:25 -0800 (PST)
Received: from [10.57.95.123] (unknown [10.57.95.123])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6C913F59E;
	Mon, 12 Jan 2026 04:26:27 -0800 (PST)
Message-ID: <09de87bc-d952-41e7-9657-852c2924aaa7@arm.com>
Date: Mon, 12 Jan 2026 12:26:26 +0000
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
 <20260104230136.7aaf8886@pumpkin> <20260107140533.2b3c46a1@pumpkin>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260107140533.2b3c46a1@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 07/01/2026 14:05, David Laight wrote:
> On Sun, 4 Jan 2026 23:01:36 +0000
> David Laight <david.laight.linux@gmail.com> wrote:
> 
>> On Fri,  2 Jan 2026 13:11:54 +0000
>> Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>>> Previously different architectures were using random sources of
>>> differing strength and cost to decide the random kstack offset. A number
>>> of architectures (loongarch, powerpc, s390, x86) were using their
>>> timestamp counter, at whatever the frequency happened to be. Other
>>> arches (arm64, riscv) were using entropy from the crng via
>>> get_random_u16().
>>>
>>> There have been concerns that in some cases the timestamp counters may
>>> be too weak, because they can be easily guessed or influenced by user
>>> space. And get_random_u16() has been shown to be too costly for the
>>> level of protection kstack offset randomization provides.
>>>
>>> So let's use a common, architecture-agnostic source of entropy; a
>>> per-cpu prng, seeded at boot-time from the crng. This has a few
>>> benefits:
>>>
>>>   - We can remove choose_random_kstack_offset(); That was only there to
>>>     try to make the timestamp counter value a bit harder to influence
>>>     from user space.
>>>
>>>   - The architecture code is simplified. All it has to do now is call
>>>     add_random_kstack_offset() in the syscall path.
>>>
>>>   - The strength of the randomness can be reasoned about independently
>>>     of the architecture.
>>>
>>>   - Arches previously using get_random_u16() now have much faster
>>>     syscall paths, see below results.
>>>
>>> There have been some claims that a prng may be less strong than the
>>> timestamp counter if not regularly reseeded. But the prng has a period
>>> of about 2^113. So as long as the prng state remains secret, it should
>>> not be possible to guess. If the prng state can be accessed, we have
>>> bigger problems.  
>>
>> If you have 128 bits of output from consecutive outputs I think you
>> can trivially determine the full state using (almost) 'school boy' maths
>> that could be done on pencil and paper.
>> (Most of the work only has to be done once.)
>>
>> The underlying problem is that the TAUSWORTHE() transformation is 'linear'
>> So that TAUSWORTHE(x ^ y) == TAUSWORTHE(x) ^ TAUSWORTHE(y).
>> (This is true of a LFSR/CRC and TOUSWORTH() is doing some subset of CRCs.)
>> This means that each output bit is the 'xor' of some of the input bits.
>> The four new 'state' values are just xor of the the bits of the old ones.
>> The final xor of the four states gives a 32bit value with each bit just
>> an xor of some of the 128 state bits.
>> Get four consecutive 32 bit values and you can solve the 128 simultaneous
>> equations (by trivial substitution) and get the initial state.
>> The solution gives you the 128 128bit constants for:
>> 	u128 state = 0;
>> 	u128 val = 'value returned from 4 calls';
>> 	for (int i = 0; i < 128; i++)
>> 		state |= parity(const128[i] ^ val) << i;
>> You don't need all 32bits, just accumulate 128 bits.  
>> So if you can get the 5bit stack offset from 26 system calls you know the
>> value that will be used for all the subsequent calls.
> 
> Some of the state bits don't get used, so you only need 123 bits.
> The stack offset is 6 bits - so you need the values from 19 calls.
> 
>> Simply changing the final line to use + not ^ makes the output non-linear
>> and solving the equations a lot harder.
>>
>> I might sit down tomorrow and see if I can actually code it...
> 
> Finally done:
> 
> #include <stdio.h>
> #include <unistd.h>
> #include <fcntl.h>
> 
> typedef unsigned int u32;
> typedef unsigned long long u64;
> typedef unsigned __int128 u128;
> 
> struct rnd_state { u32 s1; u32 s2; u32 s3; u32 s4; };
> u32 prandom_u32_state(struct rnd_state *state)
> {
> #define TAUSWORTHE(s, a, b, c, d) ((s & c) << d) ^ (((s << a) ^ s) >> b)
>         state->s1 = TAUSWORTHE(state->s1,  6U, 13U, 4294967294U, 18U);
>         state->s2 = TAUSWORTHE(state->s2,  2U, 27U, 4294967288U,  2U);
>         state->s3 = TAUSWORTHE(state->s3, 13U, 21U, 4294967280U,  7U);
>         state->s4 = TAUSWORTHE(state->s4,  3U, 12U, 4294967168U, 13U);
> 
>         return (state->s1 ^ state->s2 ^ state->s3 ^ state->s4);
> }
> 
> #define X(n, hi, lo) [n] = (u128)0x##hi << 64 | 0x##lo
> u128 map[128] = {
>         X(  1, 23acb122e4a76, e206c3f6fe435cb6),
> 	...
>         X(127, 00d3276d8a76a, e560d1975675be24) };
> 
> u128 parity_128(u128 v)                 
> {                               
>         return __builtin_parityll(v) ^ __builtin_parityll(v >> 64);
> }
> 
> int main(int argc, char **argv)
> {
>         struct rnd_state s = {};
>         u128 s0, v, r = 0;
> 
>         read(open("/dev/urandom", O_RDONLY), &s, sizeof s);
>         // Remove low bits that get masked by the (s & c) term.
>         s.s1 &= ~1; s.s2 &= ~7; s.s3 &= ~15; s.s4 &= ~127;
>         s0 = (((u128)s.s4 << 32 | s.s3) << 32 | s.s2) << 32 | s.s1;
>         v = prandom_u32_state(&s);
>         v |= (u128)prandom_u32_state(&s) << 32;
>         v |= (u128)prandom_u32_state(&s) << 64;
>         v |= (u128)prandom_u32_state(&s) << 96;
> 
>         for (int n = 0; n < 128; n++)
>                 r |= parity_128(v & map[n]) << n;
> 
>         printf("%016llx%016llx\n", (u64)(s0 >> 64), (u64)s0);
>         printf("values%s match\n", r == s0 ? "" : " do not");
> 
>         return r != s0;
> }
> 
> I've trimmed the initialiser - it is very boring.
> The code to create the initialiser is actually slightly smaller than it is.
> Doable by hand provided you can do 128bit shift and xor without making
> any mistakes.
> 
> I've just done a quick search through the kernel sources and haven't found
> many uses of prandom_u32_state() outside of test code.
> There is sched_rng() which uses a per-cpu rng to throw a 1024 sized die.
> bpf also has a per-cpu one for 'unprivileged user space'.
> net/sched/sch_netem.c seems to use one - mostly for packet loss generation.
> 
> Since the randomize_kstack code is now using a per-task rng (initialised
> by clone?) that could be used instead of all the others provided they
> are run when 'current' is valid.
> 
> But the existing prandom_u32_state() needs a big health warning that
> four outputs leak the entire state.
> That is fixable by changing the last line to:
>         return state->s1 + state->s2 + state->s3 + state->s4;
> That only affects the output value, the period is unchanged.

Hi David,

This all seems interesting, but I'm not clear that it is a blocker for this
series. As I keep saying, we only use 6 bits for offset randmization so it is
trival to brute force, regardless of how easy it is to recover the prng state.

Perhaps we can decouple these 2 things and make them independent:

 - this series, which is motivated by speeding up syscalls on arm64; given 6
   bits is not hard to brute force, spending a lot of cycles calculating those
   bits is unjustified.

 - Your observation that that the current prng could be improved to make
   recoving it's state harder.

What do you think?

Thanks,
Ryan


> 
> 	David
> 
> 


