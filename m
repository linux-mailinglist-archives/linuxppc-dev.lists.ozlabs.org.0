Return-Path: <linuxppc-dev+bounces-15246-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19709CF3007
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 11:35:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl9ft2T5cz2yCL;
	Mon, 05 Jan 2026 21:35:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767609318;
	cv=none; b=WjWPHXiEctSx3YIjRPMTa5s8SVdpcRXCe9whH0p9UEhWVZ6Z6JrrAagDTCABYzwft9/djtRhSZoSRP/+qayD31aIaLu9AWtsT8prNdxA0AtX3lj1IRnUUAHJE/t9i0wCZS4yXyOAn1qi8m8Rc5eC0XqSGKNtJOcCK2CzaSSwXCVFfMQo7Tp2xtOBQB13jQhUwNqrNa9+IKzYStb8LkGOtmdtA5FryXQUazmna3FWj7Zkh1UhNCrfy/hqtYZF/Qkbq1lIdxApsMekYjs6Qe1I+HxMPyndZMtpqeM3J1V7svpPxT1tsO4Q6MQa+9L8b43ELw+nWft0S9g/fO4In9lERg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767609318; c=relaxed/relaxed;
	bh=YEK8YLKA2JBq8NjwO2GPf8YTOu7n2L9Plr8/+v8u1Tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c9n0nRlG0xWxlVgwmQB2/PZ5V7h3EU2hltcbC7KlJztbF/J8E6fxB9PvAB+7/b0gn+MG4C7rECXusnAhtL9TU6Pfdf9QDf8YIzhIZjbwx86l9ZXZichqtUy2bCx3v4QlugRx4tv8AQuuhQUZgEXCkpgD8nyMX7CGfltdVAPkomTwg7djng7KncJc7wBRmPIBcS6SqTGwNmBuSTKeNuzD6PQ9Kv+yCFjm2YSwXvd+WbdHas9rOzKmqo4kRKDk9sgD5Nq91i5Swo1Vtkp8c67nGjJcXJItoftWqrwHrthIs8cz0RRZbt6vQ493RQezgxnuupUH5JwfuFKuubILw4Unnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl9fs1h0yz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 21:35:17 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E915497;
	Mon,  5 Jan 2026 02:34:39 -0800 (PST)
Received: from [10.1.38.150] (XHFQ2J9959.cambridge.arm.com [10.1.38.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A24513F6A8;
	Mon,  5 Jan 2026 02:34:42 -0800 (PST)
Message-ID: <76a21b45-31f4-462d-a51f-9ae72004ffc7@arm.com>
Date: Mon, 5 Jan 2026 10:34:41 +0000
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
Subject: Re: [PATCH v3 2/3] prandom: Convert prandom_u32_state() to
 __always_inline
Content-Language: en-GB
To: David Laight <david.laight.linux@gmail.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
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
 Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
 <20260102131156.3265118-3-ryan.roberts@arm.com>
 <CAHmME9qHiVZwf4TAringRHSZ-yqHuPwmP=Wnx98n09jv7Vu_Rg@mail.gmail.com>
 <719b7b99-3615-46cd-84d9-8b8fc21e3ce9@arm.com>
 <20260103104627.2f385d20@pumpkin>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260103104627.2f385d20@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 03/01/2026 10:46, David Laight wrote:
> On Fri, 2 Jan 2026 14:09:26 +0000
> Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
>> On 02/01/2026 13:39, Jason A. Donenfeld wrote:
>>> Hi Ryan,
>>>
>>> On Fri, Jan 2, 2026 at 2:12 PM Ryan Roberts <ryan.roberts@arm.com> wrote:  
>>>> context. Given the function is just a handful of operations and doesn't  
>>>
>>> How many? What's this looking like in terms of assembly?   
>>
>> 25 instructions on arm64:
>>
>> 0000000000000000 <prandom_u32_state>:
>>    0:	29401403 	ldp	w3, w5, [x0]
>>    4:	aa0003e1 	mov	x1, x0
>>    8:	29410002 	ldp	w2, w0, [x0, #8]
>>    c:	531e74a4 	lsl	w4, w5, #2
>>   10:	530e3468 	lsl	w8, w3, #18
>>   14:	4a0400a5 	eor	w5, w5, w4
>>   18:	4a031863 	eor	w3, w3, w3, lsl #6
>>   1c:	53196047 	lsl	w7, w2, #7
>>   20:	53134806 	lsl	w6, w0, #13
>>   24:	4a023442 	eor	w2, w2, w2, lsl #13
>>   28:	4a000c00 	eor	w0, w0, w0, lsl #3
>>   2c:	121b6884 	and	w4, w4, #0xffffffe0
>>   30:	120d3108 	and	w8, w8, #0xfff80000
>>   34:	121550e7 	and	w7, w7, #0xfffff800
>>   38:	120c2cc6 	and	w6, w6, #0xfff00000
>>   3c:	2a456c85 	orr	w5, w4, w5, lsr #27
>>   40:	2a433504 	orr	w4, w8, w3, lsr #13
>>   44:	2a4254e3 	orr	w3, w7, w2, lsr #21
>>   48:	2a4030c2 	orr	w2, w6, w0, lsr #12
>>   4c:	4a020066 	eor	w6, w3, w2
>>   50:	4a050080 	eor	w0, w4, w5
>>   54:	4a0000c0 	eor	w0, w6, w0
>>   58:	29001424 	stp	w4, w5, [x1]
>>   5c:	29010823 	stp	w3, w2, [x1, #8]
>>   60:	d65f03c0 	ret
> 
> That is gcc, clang seems to generate something horrid (from godbolt).
> I'm not sure what it has tried to do (and maybe it can't in kernel)
> but it clearly doesn't help!
> .LCPI0_0:
>         .word   18
>         .word   2
>         .word   7
>         .word   13
> .LCPI0_1:
>         .word   6
>         .word   2
>         .word   13
>         .word   3
> .LCPI0_2:
>         .word   4294443008
>         .word   4294967264
>         .word   4294965248
>         .word   4293918720
> .LCPI0_3:
>         .word   4294967283
>         .word   4294967269
>         .word   4294967275
>         .word   4294967284
> prandom_u32_state:
>         adrp    x9, .LCPI0_1
>         ldr     q0, [x0]
>         adrp    x10, .LCPI0_3
>         ldr     q1, [x9, :lo12:.LCPI0_1]
>         adrp    x9, .LCPI0_0
>         ldr     q3, [x10, :lo12:.LCPI0_3]
>         ldr     q2, [x9, :lo12:.LCPI0_0]
>         adrp    x9, .LCPI0_2
>         mov     x8, x0
>         ushl    v1.4s, v0.4s, v1.4s
>         ushl    v2.4s, v0.4s, v2.4s
>         eor     v0.16b, v1.16b, v0.16b
>         ldr     q1, [x9, :lo12:.LCPI0_2]
>         and     v1.16b, v2.16b, v1.16b
>         ushl    v0.4s, v0.4s, v3.4s
>         orr     v0.16b, v0.16b, v1.16b
>         ext     v1.16b, v0.16b, v0.16b, #8
>         str     q0, [x8]
>         eor     v1.8b, v0.8b, v1.8b
>         fmov    x9, d1
>         lsr     x10, x9, #32
>         eor     w0, w9, w10
>         ret
> 
> The x86 versions are a little longer (arm's barrel shifter helps a lot).
> 
>>
>>> It'd also be
>>> nice to have some brief analysis of other call sites to have
>>> confirmation this isn't blowing up other users.  
>>
>> I compiled defconfig before and after this patch on arm64 and compared the text
>> sizes:
>>
>> $ ./scripts/bloat-o-meter -t vmlinux.before vmlinux.after
>> add/remove: 3/4 grow/shrink: 4/1 up/down: 836/-128 (708)
>> Function                                     old     new   delta
>> prandom_seed_full_state                      364     932    +568
>> pick_next_task_fair                         1940    2036     +96
>> bpf_user_rnd_u32                             104     196     +92
>> prandom_bytes_state                          204     260     +56
>> e843419@0f2b_00012d69_e34                      -       8      +8
>> e843419@0db7_00010ec3_23ec                     -       8      +8
>> e843419@02cb_00003767_25c                      -       8      +8
>> bpf_prog_select_runtime                      448     444      -4
>> e843419@0aa3_0000cfd1_1580                     8       -      -8
>> e843419@0aa2_0000cfba_147c                     8       -      -8
>> e843419@075f_00008d8c_184                      8       -      -8
>> prandom_u32_state                            100       -    -100
>> Total: Before=19078072, After=19078780, chg +0.00%
>>
>> So 708 bytes more after inlining.
> 
> Doesn't look like there are many calls.
> 
>> The main cost is prandom_seed_full_state(),
>> which calls prandom_u32_state() 10 times (via prandom_warmup()). I expect we
>> could turn that into a loop to reduce ~450 bytes overall.
> 
> That would always have helped the code size.
> And I suspect the other costs of that code make unrolling the loop pointless.
> 
>>
>> I'm not really sure if 708 is good or bad...
>>
>>>   
>>>> +static __always_inline u32 prandom_u32_state(struct rnd_state *state)  
>>>
>>> Why not just normal `inline`? Is gcc disagreeing with the inlinability
>>> of this function?  
>>
>> Given this needs to be called from a noinstr function, I didn't want to give the
>> compiler the opportunity to decide not to inline it, since in that case, some
>> instrumentation might end up being applied to the function body which would blow
>> up when called in the noinstr context.
>>
>> I think the other 2 options are to keep prandom_u32_state() in the c file but
>> mark it noinstr or rearrange all the users so that thay don't call it until
>> instrumentation is allowable. The latter is something I was trying to avoid.
>>
>> There is some previous discussion of this at [1].
>>
>> [1] https://lore.kernel.org/all/aS65LFUfdgRPKv1l@J2N7QTR9R3/
>>
>> Perhaps keeping prandom_u32_state() in the c file and making it noinstr is the
>> best compromise?
> 
> Or define prandom_u32_state_inline() as always_inline and have the
> real function:
> u32 prandom_u32_state(struct rnd_state *state)
> {
> 	return prandom_u32_state_inline(state);
> }
> 
> So that the callers can pick the inline version if it really matters.

Ahh yes, that sounds like the simplest/best idea to me. I'll take this approach
for the next version assuming Jason is ok with it?

Thanks,
Ryan

> 
> 	David
> 
>>
>> Thanks,
>> Ryan
>>
>>>
>>> Jason  
>>
>>
> 


