Return-Path: <linuxppc-dev+bounces-16006-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B06AFD3B263
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 17:52:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvxML3TfLz2yql;
	Tue, 20 Jan 2026 03:52:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768841534;
	cv=none; b=UmaaI7s46wkitM+DYH5OrXAvuyvPxPzViI5XcQF+jets5ibL5RepHmHyqTZ0Q5+FRspfio/AJqqvvlC+ukxPWz35YBVDe9SA1Y6SG+LSi628fDGaJWgf5PA3BBWSKvP4UbTJWskqIth1S4VYmWB58lU1qFzAqfFss3DsKR72aTPerJbtImmVGDSzPH15qudav1RZlopP+u2WIr8a++DFIFjKv+K84prOJwHe0mOOq1RMh7SrLh3QbO+W9QZJhBzp5XwvEw71fvGzJWlbFbtQt6XX9sbQ7lSO6S07oxEAiAR1dRx1B9/TVktsoEZLkx4jZ1cGR9R/ynAks+bR3YrMvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768841534; c=relaxed/relaxed;
	bh=YPJV4ZT80g36/R8dj478UVP7QfT7LV1drr0hq4nmf8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n/sEP4NydCHeeY7X8GRShHVCPgVXCB/HCRqSZUwEFO4zwRt67+KrhIrB+fKK7t/2NxTr3iFj//sUaDYfHt7IfyiLxPyMPtyUNEOMyqq57ukXcYdG7VzZXr1O2CBAZ5YqirgJxzIhZAr/Wyn0y+hLwI9V8wePxllS1UVeX3/N1kCIaRybSu3AnXvVQThTCE34FoMU8qRvPOMchX3jXuIEFkFyXpZKTmeFmKVaH7oqSnXg53WGwyGCvQYoLwkVaUEFV6nFeqeG9+6n3OQRBc60Xq9N4/53Pn0IVEK83d4WokHbVjZdHM1CH2Tb6Pke47KfpTwA8nwnKP+0gOK/lPBZ/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvxMK1sqFz2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 03:52:11 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7A4B497;
	Mon, 19 Jan 2026 08:51:32 -0800 (PST)
Received: from [10.57.93.204] (unknown [10.57.93.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAE0C3F632;
	Mon, 19 Jan 2026 08:51:33 -0800 (PST)
Message-ID: <31187502-2a11-4ef3-82b4-927a271d8b44@arm.com>
Date: Mon, 19 Jan 2026 16:51:32 +0000
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
Subject: Re: [PATCH v4 1/3] randomize_kstack: Maintain kstack_offset per task
Content-Language: en-GB
To: Dave Hansen <dave.hansen@intel.com>,
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
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>,
 David Laight <david.laight.linux@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hardening@vger.kernel.org, stable@vger.kernel.org
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
 <20260119130122.1283821-2-ryan.roberts@arm.com>
 <85d0d013-eca2-4b9f-bee3-d583d0eeb99e@intel.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <85d0d013-eca2-4b9f-bee3-d583d0eeb99e@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Thanks for the review!

On 19/01/2026 16:10, Dave Hansen wrote:
> On 1/19/26 05:01, Ryan Roberts wrote:
> ...
>> Cc: stable@vger.kernel.org
> 
> Since this doesn't fix any known functional issues, if it were me, I'd
> leave stable@ alone. It isn't clear that this is stable material.

I listed 2 issues in the commit log; I agree that issue 1 falls into the
category of "don't really care", but issue 2 means that kstack randomization is
currently trivial to defeat. That's the reason I thought it would valuable in
stable.

But if you're saying don't bother and others agree, then this whole patch can be
dropped; this is just intended to be the backportable fix. Patch 3 reimplements
this entirely for upstream.

I'll wait and see if others have opinions if that's ok?

> 
>> --- a/include/linux/sched.h
>> +++ b/include/linux/sched.h
>> @@ -1591,6 +1591,10 @@ struct task_struct {
>>  	unsigned long			prev_lowest_stack;
>>  #endif
>>  
>> +#ifdef CONFIG_RANDOMIZE_KSTACK_OFFSET
>> +	u32				kstack_offset;
>> +#endif
>> +
>>  #ifdef CONFIG_X86_MCE
>>  	void __user			*mce_vaddr;
> 
> Nit: This seems to be throwing a u32 potentially in between a couple of
> void*/ulong sized objects.

Yeah, I spent a bit of time with pahole but eventually concluded that it was
difficult to find somewhere to nestle it that would work reliably cross arch.
Eventually I just decided to group it with other stack meta data.

> 
> It probably doesn't matter with struct randomization and it's really
> hard to get right among the web of task_struct #ifdefs. But, it would be
> nice to at _least_ nestle this next to another int-sized thing.
> 
> Does it really even need to be 32 bits? x86 has this comment:
> 
>>         /*
>>          * This value will get limited by KSTACK_OFFSET_MAX(), which is 10
>>          * bits. The actual entropy will be further reduced by the compiler
>>          * when applying stack alignment constraints (see cc_stack_align4/8 in
>>          * arch/x86/Makefile), which will remove the 3 (x86_64) or 2 (ia32)
>>          * low bits from any entropy chosen here.
>>          *
>>          * Therefore, final stack offset entropy will be 7 (x86_64) or
>>          * 8 (ia32) bits.
>>          */

For more recent kernels it's 6 bits shifted by 4 for 64-bit kernels or 8 bits
shifted by 2 for 32-bit kernels regardless of arch. So could probably make it
work with 8 bits of storage. Although I was deliberately trying to keep the
change simple, since it was intended for backporting. Patch 3 rips it out.

Overall I'd prefer to leave it all as is. But if people don't think we should
backport, then let's just drop the whole patch.

Thanks,
Ryan



