Return-Path: <linuxppc-dev+bounces-12068-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C576B545DD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 10:49:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNSlW0PJQz3cmk;
	Fri, 12 Sep 2025 18:49:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757666950;
	cv=none; b=eBdIN3otX9OIGxa7dhezk7OPDoWMIkncOPBL4BO7NnhD1FrtD2/ye7crffzO80aZP9e4rA7sYknrLbxoKfFIsJjn6YvkwFawsBDC89bdof2jRcaGPiApGBRqdXI3QSeuOObvWw0KvjuTUotJQFKF64ouiikvPfLvqkOJWPBcmfN1tMJhqhh8lOr+NUMDLLzrGk0EqrJ+bQlznJLU28ON6ZgHz0na4xB/8H946WzWQp91cX50hI16qEpt0/8Hzna6FxwflLWG96SpZ8ppwRgKWHTW7HC6Kwa2hDCmzCgY3yH0qK42lUAOV6rA9uXmgoeaMHWvv7tD+J95YzJWQLwuVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757666950; c=relaxed/relaxed;
	bh=x/O37A+Sj5/ENSKE8ye7ob3Qbk26KdsluByV9/ixxKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iqoMMHIY3p/afUOdJyxi3wd5j8l2xawIWzrQFGT4Sx02XIKC7pssxgNU3KpmXMgNlb+sJbkLPmRvYWKpKFoH2CEMIVjVM2eGrymibz3+MvdglZ2VXBq/Cb6lhPHDzdJdLT9u8wLonyjXDzsCrhSgHTclkrG0AQuP/8iGJUU4XFyIEuw6vECkkDqUKJ3FdU0yvifLH/MdebQ/w3wSaoc2CyrX1CyeCzeg3XXzVbfN5X6xjlH/dY9vRn5WnlenBh5C0ZmXaU5snPbfZifBjiwuavQoXuaDR8HMqowtovo28NLcbkXr7mGPmD97PS6dzKD1D+o5sGv16ips1XuGYc7gNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNSlT6RF7z3clb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 18:49:08 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4134416A3;
	Fri, 12 Sep 2025 01:48:28 -0700 (PDT)
Received: from [10.57.66.147] (unknown [10.57.66.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63FC83F66E;
	Fri, 12 Sep 2025 01:48:29 -0700 (PDT)
Message-ID: <781a6450-1c0b-4603-91cf-49f16cd78c28@arm.com>
Date: Fri, 12 Sep 2025 10:48:26 +0200
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
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: David Hildenbrand <david@redhat.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mark Rutland <Mark.Rutland@arm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
 <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
 <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
 <2fecfae7-1140-4a23-a352-9fd339fcbae5-agordeev@linux.ibm.com>
 <e521b1f4-3f2b-48cd-9568-b9a4cf4c4830@redhat.com>
 <47ee1df7-1602-4200-af94-475f84ca8d80@arm.com>
 <29383ee2-d6d6-4435-9052-d75a263a5c45@redhat.com>
 <9de08024-adfc-421b-8799-62653468cf63@arm.com>
 <ef343405-c394-4763-a79f-21381f217b6c@redhat.com>
 <4b4971fd-0445-4d86-8f3a-6ba3d68d15b7@arm.com>
 <4aa28016-5678-4c66-8104-8dcc3fa2f5ce@redhat.com>
 <15d01c8b-5475-442e-9df5-ca37b0d5dc04@arm.com>
 <7953a735-6129-4d22-be65-ce736630d539@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <7953a735-6129-4d22-be65-ce736630d539@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/09/2025 10:04, David Hildenbrand wrote:
>>>
>>> struct lazy_mmu_state {
>>>      uint8_t enabled_count;
>>>      bool paused;
>>
>> Looking at the arm64 implementation, I'm thinking: instead of the paused
>> member, how about a PF_LAZY_MMU task flag? It would be set when lazy_mmu
>> is actually enabled (i.e. inside an enter()/leave() section, and not
>> inside a pause()/resume() section). This way, architectures could use
>> that flag directly to tell if lazy_mmu is enabled instead of reinventing
>> the wheel, all in slightly different ways. Namely:
>>
>> * arm64 uses a thread flag (TIF_LAZY_MMU) - this is trivially replaced
>> with PF_LAZY_MMU
>> * powerpc and sparc use batch->active where batch is a per-CPU variable;
>> I expect this can also be replaced with PF_LAZY_MMU
>> * x86/xen is more complex as it has xen_lazy_mode which tracks both
>> LAZY_MMU and LAZY_CPU modes. I'd probably leave that one alone, unless a
>> Xen expert is motivated to refactor it.
>>
>> With that approach, the implementation of arch_enter() and arch_leave()
>> becomes very simple (no tracking of lazy_mmu status) on arm64, powerpc
>> and sparc.
>>
>> (Of course we could also have an "enabled" member in lazy_mmu_state
>> instead of PF_LAZY_MMU, there is no functional difference.)
>>
>
> No strong opinion, but to me it feels like PF_LAZY_MMU is rather "the
> effective state when combining nested+paused", and might complicate
> the code + sanity checks?
>
> So we could maintain that in addition fairly easily of course from the
> core instead of letting archs do that manually.
>
> I would probably have to see the end result to judge whether removing
> the "paused" bool makes things look more complicated or not.

Agreed, it is a little difficult to consider all the cases ahead of
time. What is clear to me though is that [paused] can be inferred from
[count + enabled], and conversely [enabled] from [count + paused]. As a
result I really wouldn't store both paused and enabled in task_struct -
duplicating information is how you create inconsistent states.

We can very easily introduce helpers to get the enabled/paused status
regardless of how they're stored. Since "enabled" is what we need to
know in most cases (arch checking the status), I would rather store
"enabled" than "paused". But indeed, let's see how it turns out in practice.

>
>>> }
>>>
>>> c) With that config, common-code lazy_mmu_*() functions implement the
>>> updating of the lazy_mmu_state in task_struct and call into arch code
>>> on the transition from 0->1, 1->0 etc.
>>
>> Indeed, this is how I thought about it. There is actually quite a lot
>> that can be moved to the generic functions:
>> * Updating lazy_mmu_state
>> * Sanity checks on lazy_mmu_state (e.g. underflow/overflow)
>> * Bailing out if in_interrupt() (not done consistently across arch's at
>> the moment)
>>
>>>
>>> Maybe that can be done through exiting
>>> arch_enter_lazy_mmu_mode()/arch_leave_lazy_mmu_mode() callbacks, maybe
>>> we need more. I feel like
>>> we might be able to implement that through the existing helpers.
>>
>> We might want to rename them to align with the new generic helpers, but
>> yes otherwise the principle should remain unchanged.
>>
>> In fact, we will also need to revive arch_flush_lazy_mmu_mode().
>
> That's okay if it's all hidden behaind a sane core API.
>
>> Indeed,
>> in the nested situation, we need the following arch calls:
>>
>> enter() -> arch_enter()
>>      enter() -> [nothing]
>>      leave() -> arch_flush()
>> leave() -> arch_leave()
>>
>> leave() must always flush whatever arch state was batched, as may be
>> expected by the caller.
>>
>> How does all that sound?
>
> I am no expert on the "always flush when leaving", but it sounds
> reasonable to me.

This is a core expectation for lazy_mmu: when leave() is called, any
batched state is flushed. The fact it currently happens unconditionally
when calling leave() is in fact what stops nesting from exploding on
arm64 with DEBUG_PAGEALLOC [1].

[1] https://lore.kernel.org/all/aEhKSq0zVaUJkomX@arm.com/

>
> Which arch operations would you call from
>
> pause()
> continue()

I also wondered about that. I think the safest is to make them
respectively arch_leave() and arch_enter() - the flushing entailed by
arch_leave() might not be required, but it is safer. Additionally,
powerpc/sparc disable preemption while in lazy_mmu, so it seems like a
good idea to re-enable it while paused (by calling arch_leave()).

- Kevin

