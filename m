Return-Path: <linuxppc-dev+bounces-14640-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D06CCA7A3E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 13:51:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNB8B2gdWz2xs1;
	Fri, 05 Dec 2025 23:51:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764939082;
	cv=none; b=ZQevvnmWGCo5YlASGAmt5muA2sNPeKUFHmftxG6NBFUZWwsj99ut3EBKPSTpKxv9p9a9ULeZSkJyOTWAcvV4sLo5//w5qHYxW8Z3K19jRgJSPJR3eZ0sF3egF05582/U0ds1yke8IZESa0Jw0LqpMK8D69XTU3ii4suaYvQnJjdmAJ53LKcU4T3s2fv76GFquyGgQk9D60Wc2li/E1itFAZQVQKl1YaBpHEfvAI5NMviiMIlSRD6kWF6RgJ+NgmGi1nOJUiYiZUm3rlTTMpwW2b43i7pbWzcnVEI1DLwOkEtiwGEhaKmAu74qek317sZkintWk1uWnaD6/X4Te4M7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764939082; c=relaxed/relaxed;
	bh=j4UjFMdcuPchwkA3lmeDso5ij/iOMhTFMDd348T6uyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lvtu+JneW/R65oCGYJpNrdrzL1slfj0I8B3VxLJKTLQ4F1r+PQ0E1FnjzFrM639aaMjfiKc/zfV8UcLkQWZrh3fFzFkUEWyKipN0BPidjXoW7d8M6VxOPPZZlUg9w+wHYmOsagAKlutgkcupLmGBTq4mAXJe7JmxIUGS9oYNcEnrVa0pxeonXgjfAfIDzpMw129GW5CdhENDeQ1CyDlAosmGlcQqQGzaQiYboy9jz9imq38EfHfkTziW61lHNVbT83ke1qPtc7rLVYvg0YR7mxGJjtlip9EB0lxFk2qv6oEMzMc0LdYSDRoVXOTCVxxoN+bn8vHvMY7Rrtz52M9QvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNB893Yr3z2xPT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 23:51:21 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02DB31063;
	Fri,  5 Dec 2025 04:50:43 -0800 (PST)
Received: from [10.44.160.68] (e126510-lin.lund.arm.com [10.44.160.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02CD63F86F;
	Fri,  5 Dec 2025 04:50:42 -0800 (PST)
Message-ID: <093f814e-ce49-43c9-951b-b0d0ef583cea@arm.com>
Date: Fri, 5 Dec 2025 13:50:40 +0100
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
Subject: Re: [PATCH v5 08/12] mm: enable lazy_mmu sections to nest
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-9-kevin.brodsky@arm.com>
 <2dfd54d7-fe2a-4921-85ff-a581392a777a@arm.com>
 <93d04ef8-0364-4013-8839-ba599d930cb2@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <93d04ef8-0364-4013-8839-ba599d930cb2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 04/12/2025 12:52, David Hildenbrand (Red Hat) wrote:
> Some comments from my side:
>
>
>>>   static inline void arch_enter_lazy_mmu_mode(void)
>>>   {
>>> -    /*
>>> -     * lazy_mmu_mode is not supposed to permit nesting. But in
>>> practice this
>>> -     * does happen with CONFIG_DEBUG_PAGEALLOC, where a page
>>> allocation
>>> -     * inside a lazy_mmu_mode section (such as zap_pte_range())
>>> will change
>>> -     * permissions on the linear map with apply_to_page_range(), which
>>> -     * re-enters lazy_mmu_mode. So we tolerate nesting in our
>>> -     * implementation. The first call to arch_leave_lazy_mmu_mode()
>>> will
>>> -     * flush and clear the flag such that the remainder of the work
>>> in the
>>> -     * outer nest behaves as if outside of lazy mmu mode. This is
>>> safe and
>>> -     * keeps tracking simple.
>>> -     */
>>> -
>>>       set_thread_flag(TIF_LAZY_MMU);>  }
>>
>> Should not platform specific changes be deferred to subsequent
>> patches until
>> nesting is completely enabled in generic first ? Although no problem
>> as such
>> but would be bit cleaner.
>
> This could indeed be done in a separate patch. But I also don't see a
> problem with updating the doc in this patch.

I think it is consistent to remove that comment in this patch, since
nesting is fully supported from this patch onwards. Subsequent patches
are cleanups/optimisations that aren't functionally required.

Patch 7 takes the same approach: add handling in the generic layer,
remove anything now superfluous from arm64.

>
>>
>>>   diff --git a/include/linux/mm_types_task.h
>>> b/include/linux/mm_types_task.h
>>> index a82aa80c0ba4..11bf319d78ec 100644
>>> --- a/include/linux/mm_types_task.h
>>> +++ b/include/linux/mm_types_task.h
>>> @@ -88,4 +88,9 @@ struct tlbflush_unmap_batch {
>>>   #endif
>>>   };
>>>   +struct lazy_mmu_state {
>>> +    u8 enable_count;
>>> +    u8 pause_count;
>>> +};
>>> +
>>
>> Should not this be wrapped with CONFIG_ARCH_HAS_LAZY_MMU_MODE as the
>> task_struct
>> element 'lazy_mmu_state' is only available with the feature.
>
> No strong opinion; the compiler will ignore it either way. And less
> ifdef is good, right? :)
>
> ... and there is nothing magical in there that would result in other
> dependencies. 

Agreed, #ifdef'ing types should only be done if necessary.

>
>> Besides, is a depth
>> of 256 really expected here ? 4 bits for each element would not be
>> sufficient for
>> a depth of 16 ?
>
>
> We could indeed use something like
>
> struct lazy_mmu_state {
>     u8 enable_count : 4;
>     u8 pause_count : 4;
> };
>
> but then, the individual operations on enable_count/pause_count need
> more instructions.

Indeed.

>
> Further, as discussed, this 1 additional byte barely matters given the
> existing size of the task struct.

In fact it would almost certainly make no difference (depending on
randomized_struct) since almost all members in task_struct have an
alignment of at least 2.

>
> [...]
>
>>> +/**
>>> + * lazy_mmu_mode_pause() - Resume the lazy MMU mode.
>>> + *
>>> + * Resumes the lazy MMU mode; if it was active at the point where
>>> the matching
>>> + * call to lazy_mmu_mode_pause() was made, re-enables it and calls
>>> + * arch_enter_lazy_mmu_mode().
>>> + *
>>> + * Must match a call to lazy_mmu_mode_pause().
>>> + *
>>> + * Has no effect if called:
>>> + * - While paused (inside another pause()/resume() pair)
>>> + * - In interrupt context
>>> + */
>>>   static inline void lazy_mmu_mode_resume(void)
>>>   {
>>> +    struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>> +
>>>       if (in_interrupt())
>>>           return;
>>>   -    arch_enter_lazy_mmu_mode();
>>> +    VM_WARN_ON_ONCE(state->pause_count == 0);
>>> +
>>> +    if (--state->pause_count == 0 && state->enable_count > 0)
>>> +        arch_enter_lazy_mmu_mode();
>>>   }
>>
>> Should not state->pause/enable_count tests and increment/decrement be
>> handled
>> inside include/linux/sched via helpers like in_lazy_mmu_mode() ? This
>> is will
>> ensure cleaner abstraction with respect to task_struct.
>
> I don't think this is required given that this code here implements
> CONFIG_ARCH_HAS_LAZY_MMU_MODE support.

Agreed, in fact I'd rather not expose helpers that should only be used
in the lazy_mmu implementation itself.

- Kevin

