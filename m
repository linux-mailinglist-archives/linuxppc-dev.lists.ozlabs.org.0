Return-Path: <linuxppc-dev+bounces-13267-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A32C06337
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 14:17:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctMND2yZRz3btf;
	Fri, 24 Oct 2025 23:17:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761308236;
	cv=none; b=g9MENFC0k/2N9bu6Xc2yLrCaHl4xyoUaMZi2KzTLcjzVEqgRQeQuNWUEDFFPUPpBI4jFb0KgUWOp1CX6uWesjvncr978k9IWFU0KXHeh7zl4fR4L8N49lijSAy9y87KBxQ1Picfq+x4E7RSu0EETNtfpPFQy5NBEhFZriNVYu/wRasCNTym7deVXReiy/Fq9fs+npEt17iD608k8AzjBY2kAUn8rHKhkH8RB8kfgy/dZmZPgnL5ddPoOrLcc/NUvBp75e1Abp7VevX6Uto1z93kjGb5urE/mG1/bGvC02Dt/c0keHt4PcgCAipQMJRRXD3MYxIPr/Xz/4g5v8+Gmxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761308236; c=relaxed/relaxed;
	bh=uP/rxN2bRwMLh2GALLbrzV+vL7uIUOOM5XeCDOOe+d0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J4YQhvlAtWot7oIds7DTKVsaEZfZBaYxQv+VwsMMjcpAIE6CEULEnpICvcyn0EkK7FKpgHNGG6cPTZMSWC2LuBoDcCHH7NSHfvCm2GoM5k6BkvdyNRJLF6rXZ+ufNdmsLimUrOwHEiD6tmL+PyXYQ71pZ/bE0xrNIu3J64LOWnEE0LFMp6PFMuNKGHgXXERDi0693Jevf+8zo01vw1AfVII6Uv8jxV5pWfnFaNUPgyTCvNsMk0MISLP6iKKev1BeMDYghD1mRgTpAC0PKws3KCqKZULrLTFumRfSidJEc5hXvJFMLZNKITnB5aVKuhCLSWSGuT8zntsAjb8sxCIBCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctMNC4YwBz2xQ0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 23:17:15 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73CC91515;
	Fri, 24 Oct 2025 05:16:36 -0700 (PDT)
Received: from [10.44.160.74] (e126510-lin.lund.arm.com [10.44.160.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E88963F66E;
	Fri, 24 Oct 2025 05:16:36 -0700 (PDT)
Message-ID: <7a4e136b-66a5-4244-ab07-f0bcc3a26a83@arm.com>
Date: Fri, 24 Oct 2025 14:16:34 +0200
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
Subject: Re: [PATCH v3 07/13] mm: enable lazy_mmu sections to nest
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-8-kevin.brodsky@arm.com>
 <2073294c-8003-451a-93e0-9aab81de4d22@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <2073294c-8003-451a-93e0-9aab81de4d22@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 23/10/2025 22:00, David Hildenbrand wrote:
> [...]
>
>
>>
>> In summary (count/enabled represent the values *after* the call):
>>
>> lazy_mmu_mode_enable()        -> arch_enter()        count=1 enabled=1
>>      lazy_mmu_mode_enable()    -> ø            count=2 enabled=1
>>     lazy_mmu_mode_pause()    -> arch_leave()     count=2 enabled=0
>
> The arch_leave..() is expected to do a flush itself, correct?

Correct, that's unchanged.

>
>>     lazy_mmu_mode_resume()    -> arch_enter()     count=2 enabled=1
>>      lazy_mmu_mode_disable()    -> arch_flush()     count=1 enabled=1
>> lazy_mmu_mode_disable()        -> arch_leave()     count=0 enabled=0
>>
>> Note: in_lazy_mmu_mode() is added to <linux/sched.h> to allow arch
>> headers included by <linux/pgtable.h> to use it.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>> Alexander Gordeev suggested that a future optimisation may need
>> lazy_mmu_mode_{pause,resume}() to call distinct arch callbacks [1]. For
>> now arch_{leave,enter}() are called directly, but introducing new arch
>> callbacks should be straightforward.
>>
>> [1]
>> https://lore.kernel.org/all/5a0818bb-75d4-47df-925c-0102f7d598f4-agordeev@linux.ibm.com/
>> ---
>
> [...]
>
>>   +struct lazy_mmu_state {
>> +    u8 count;
>
> I would have called this "enabled_count" or "nesting_level".

Might as well be explicit and say nesting_level, yes :)

>
>> +    bool enabled;
>
> "enabled" is a bit confusing when we have lazy_mmu_mode_enable().

Agreed, hadn't realised that.

> I'd have called this "active".

Sounds good, that also matches batch->active on powerpc/sparc.

>
>> +};
>> +
>>   #endif /* _LINUX_MM_TYPES_TASK_H */
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index 194b2c3e7576..269225a733de 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -228,28 +228,89 @@ static inline int pmd_dirty(pmd_t pmd)
>>    * of the lazy mode. So the implementation must assume preemption
>> may be enabled
>>    * and cpu migration is possible; it must take steps to be robust
>> against this.
>>    * (In practice, for user PTE updates, the appropriate page table
>> lock(s) are
>> - * held, but for kernel PTE updates, no lock is held). Nesting is
>> not permitted
>> - * and the mode cannot be used in interrupt context.
>> + * held, but for kernel PTE updates, no lock is held). The mode
>> cannot be used
>> + * in interrupt context.
>> + *
>> + * The lazy MMU mode is enabled for a given block of code using:
>> + *
>> + *   lazy_mmu_mode_enable();
>> + *   <code>
>> + *   lazy_mmu_mode_disable();
>> + *
>> + * Nesting is permitted: <code> may itself use an enable()/disable()
>> pair.
>> + * A nested call to enable() has no functional effect; however
>> disable() causes
>> + * any batched architectural state to be flushed regardless of
>> nesting. After a
>> + * call to disable(), the caller can therefore rely on all previous
>> page table
>> + * modifications to have taken effect, but the lazy MMU mode may
>> still be
>> + * enabled.
>> + *
>> + * In certain cases, it may be desirable to temporarily pause the
>> lazy MMU mode.
>> + * This can be done using:
>> + *
>> + *   lazy_mmu_mode_pause();
>> + *   <code>
>> + *   lazy_mmu_mode_resume();
>> + *
>> + * This sequence must only be used if the lazy MMU mode is already
>> enabled.
>> + * pause() ensures that the mode is exited regardless of the nesting
>> level;
>> + * resume() re-enters the mode at the same nesting level. <code>
>> must not modify
>> + * the lazy MMU state (i.e. it must not call any of the lazy_mmu_mode_*
>> + * helpers).
>> + *
>> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
>> + * currently enabled.
>>    */
>>   #ifdef CONFIG_ARCH_LAZY_MMU
>>   static inline void lazy_mmu_mode_enable(void)
>>   {
>> -    arch_enter_lazy_mmu_mode();
>> +    struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> +
>> +    VM_BUG_ON(state->count == U8_MAX);
>
> No VM_BUG_ON() please.

I did wonder if this would be acceptable!

What should we do in case of underflow/overflow then? Saturate or just
let it wrap around? If an overflow occurs we're probably in some
infinite recursion and we'll crash anyway, but an underflow is likely
due to a double disable() and saturating would probably allow to recover.

>
>> +    /* enable() must not be called while paused */
>> +    VM_WARN_ON(state->count > 0 && !state->enabled);
>> +
>> +    if (state->count == 0) {
>> +        arch_enter_lazy_mmu_mode();
>> +        state->enabled = true;
>> +    }
>> +    ++state->count;
>
> Can do
>
> if (state->count++ == 0) {

My idea here was to have exactly the reverse order between enable() and
disable(), so that arch_enter() is called before lazy_mmu_state is
updated, and arch_leave() afterwards. arch_* probably shouldn't rely on
this (or care), but I liked the symmetry.

>
>>   }
>>     static inline void lazy_mmu_mode_disable(void)
>>   {
>> -    arch_leave_lazy_mmu_mode();
>> +    struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> +
>> +    VM_BUG_ON(state->count == 0);
>
> Dito.
>
>> +    VM_WARN_ON(!state->enabled);
>> +
>> +    --state->count;
>> +    if (state->count == 0) {
>
> Can do
>
> if (--state->count == 0) {
>
>> +        state->enabled = false;
>> +        arch_leave_lazy_mmu_mode();
>> +    } else {
>> +        /* Exiting a nested section */
>> +        arch_flush_lazy_mmu_mode();
>> +    }
>>   }
>>     static inline void lazy_mmu_mode_pause(void)
>>   {
>> +    struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> +
>> +    VM_WARN_ON(state->count == 0 || !state->enabled);
>> +
>> +    state->enabled = false;
>>       arch_leave_lazy_mmu_mode();
>>   }
>>     static inline void lazy_mmu_mode_resume(void)
>>   {
>> +    struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> +
>> +    VM_WARN_ON(state->count == 0 || state->enabled);
>> +
>>       arch_enter_lazy_mmu_mode();
>> +    state->enabled = true;
>>   }
>>   #else
>>   static inline void lazy_mmu_mode_enable(void) {}
>> diff --git a/include/linux/sched.h b/include/linux/sched.h
>> index cbb7340c5866..2862d8bf2160 100644
>> --- a/include/linux/sched.h
>> +++ b/include/linux/sched.h
>> @@ -1441,6 +1441,10 @@ struct task_struct {
>>         struct page_frag        task_frag;
>>   +#ifdef CONFIG_ARCH_LAZY_MMU
>> +    struct lazy_mmu_state        lazy_mmu_state;
>> +#endif
>> +
>>   #ifdef CONFIG_TASK_DELAY_ACCT
>>       struct task_delay_info        *delays;
>>   #endif
>> @@ -1724,6 +1728,18 @@ static inline char task_state_to_char(struct
>> task_struct *tsk)
>>       return task_index_to_char(task_state_index(tsk));
>>   }
>>   +#ifdef CONFIG_ARCH_LAZY_MMU
>> +static inline bool in_lazy_mmu_mode(void)
>
> So these functions will reveal the actual arch state, not whether
> _enabled() was called.
>
> As I can see in later patches, in interrupt context they are also
> return "not in lazy mmu mode". 

Yes - the idea is that a task is in lazy MMU mode if it enabled it and
is in process context. The mode is never enabled in interrupt context.
This has always been the intention, but it wasn't formalised until patch
12 (except on arm64).

- Kevin

