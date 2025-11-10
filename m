Return-Path: <linuxppc-dev+bounces-14001-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FE8C460B2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 11:48:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4mc15YQ0z2xqh;
	Mon, 10 Nov 2025 21:48:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762771713;
	cv=none; b=LVGlCeJc8LkmA367J6YelpMLOISKJFxhMED2Y+cKgBk3chLLpRK3crCOaIDlHNDhfGzDlFS52JMU+Ca17gfW6xF6hEXrdVIM6bKFXzsooajSz+Szj6gseX1Ig6YGGzNcaYT33aeDiGywqp+OApIiNvcVN42imYwOX3upRi0RiZ80Y+VtJUn8YzJwGaTEJNp0hm1vqwsfbV+Gf8kgHnMi7xqWZa0ES+Jli3ItheVYsucK1TaI3I7KxUEKmB7yYbigPY0pG97viA5T+rdxshhUwFDnX+JGcixRidiZ2FtHj1e1CYuzMl+spgj8VKdYhQyHp73vQn4n6XX0HWVagU5C+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762771713; c=relaxed/relaxed;
	bh=sjXywmJ+WA0ld4wtuKRvw4DwT8rmylaCBEi/H93g6VA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lx8cpdKVqaoYS0WeoxOiTJRt4MfwDbPZcgk56PeIUnVYeH6JCMtqaplVflfzq5veT/X6YyqeEaiA4TYMO4ye38wFIhyflIeVMAUjxNE4a2D73yEgo5y0PuvqWgQBKFtTfcuiO2SipFTTx21ZebGczSXOvlwVLkEpWql3seNVB2bkd6WzmKnEE1VidrqXBlYJZYsXhc9OmjhO1oKI5fuEsk1Zx7oC3o3ZB5DA2WUTHmDsX1AqnuxZB2xOSyW3xp1wq5OEAlwZ1cbpdHkbo3/9UBAGMCRfoQFqzIX4bqoO+2zXrtW32VkzS7Z9fTRZ6OkhyCxZK2pylhpP37MMk8Magg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4mc06lhqz2xqM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 21:48:32 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CA95497;
	Mon, 10 Nov 2025 02:47:54 -0800 (PST)
Received: from [10.57.39.147] (unknown [10.57.39.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 183443F66E;
	Mon, 10 Nov 2025 02:47:53 -0800 (PST)
Message-ID: <cc9dc398-b9c5-4bb8-94ad-7e7f3ddd5b4f@arm.com>
Date: Mon, 10 Nov 2025 11:47:51 +0100
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
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
To: Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-8-kevin.brodsky@arm.com>
 <999feffa-5d1d-42e3-bd3a-d949f2a9de9d@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <999feffa-5d1d-42e3-bd3a-d949f2a9de9d@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 07/11/2025 14:59, Ryan Roberts wrote:
> On 29/10/2025 10:09, Kevin Brodsky wrote:
>> [...]
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index b5fdf32c437f..e6064e00b22d 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -228,27 +228,86 @@ static inline int pmd_dirty(pmd_t pmd)
>>   * of the lazy mode. So the implementation must assume preemption may be enabled
>>   * and cpu migration is possible; it must take steps to be robust against this.
>>   * (In practice, for user PTE updates, the appropriate page table lock(s) are
>> - * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
>> - * and the mode cannot be used in interrupt context.
>> + * held, but for kernel PTE updates, no lock is held). The mode cannot be used
>> + * in interrupt context.
> "The mode cannot be used in interrupt context"; except it is for arm64. KFENCE
> and/or DEBUG_PAGEALLOC will request the arch to change linear map permissions,
> which will enter lazy mmu (now using the new generic API). This can happen in
> softirq context.

Are you happy with the wording update in patch 12?

>> + *
>> + * The lazy MMU mode is enabled for a given block of code using:
>> + *
>> + *   lazy_mmu_mode_enable();
>> + *   <code>
>> + *   lazy_mmu_mode_disable();
>> + *
>> + * Nesting is permitted: <code> may itself use an enable()/disable() pair.
>> + * A nested call to enable() has no functional effect; however disable() causes
>> + * any batched architectural state to be flushed regardless of nesting. After a
>> + * call to disable(), the caller can therefore rely on all previous page table
>> + * modifications to have taken effect, but the lazy MMU mode may still be
>> + * enabled.
>> + *
>> + * In certain cases, it may be desirable to temporarily pause the lazy MMU mode.
>> + * This can be done using:
>> + *
>> + *   lazy_mmu_mode_pause();
>> + *   <code>
>> + *   lazy_mmu_mode_resume();
>> + *
>> + * This sequence must only be used if the lazy MMU mode is already enabled.
>> + * pause() ensures that the mode is exited regardless of the nesting level;
>> + * resume() re-enters the mode at the same nesting level. <code> must not modify
>> + * the lazy MMU state (i.e. it must not call any of the lazy_mmu_mode_*
>> + * helpers).
>> + *
>> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
>> + * currently enabled.
>>   */
> Nice documentation!

Thanks!

>>  #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>>  static inline void lazy_mmu_mode_enable(void)
>>  {
>> -	arch_enter_lazy_mmu_mode();
>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> +
>> +	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
>> +	/* enable() must not be called while paused */
>> +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
>> +
>> +	if (state->nesting_level++ == 0) {
> Hmm... for the arm64 case of calling this in an interrupt, Is it safe?
>
> If a task is calling this function and gets interrupted here, nesting_level==1
> but active==false. The interrupt then calls this function and increments from 1
> to 2 but arch_enter_lazy_mmu_mode() hasn't been called.
>
> More dangerously (I think), when the interrupt handler calls
> lazy_mmu_mode_disable(), it will end up calling arch_flush_lazy_mmu_mode() which
> could be an issue because as far as the arch is concerned, it's not in lazy mode.
>
> The current arm64 implementation works because setting and clearing the thread
> flags is atomic.
>
> Perhaps you need to disable preemption around the if block?

As you found out this is addressed in patch 12, but indeed I hadn't
realised that this patch leaves the generic API in an unsafe situation
w.r.t. interrupts. We at least need to have in_interrupt() checks in the
generic layer by the time we get to this patch.

>> +		state->active = true;
>> +		arch_enter_lazy_mmu_mode();
>> +	}
>>  }
>>  
>>  static inline void lazy_mmu_mode_disable(void)
>>  {
>> -	arch_leave_lazy_mmu_mode();
>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> +
>> +	VM_WARN_ON_ONCE(state->nesting_level == 0);
>> +	VM_WARN_ON(!state->active);
>> +
>> +	if (--state->nesting_level == 0) {
>> +		state->active = false;
>> +		arch_leave_lazy_mmu_mode();
>> +	} else {
>> +		/* Exiting a nested section */
>> +		arch_flush_lazy_mmu_mode();
>> +	}
>>  }
>>  
>>  static inline void lazy_mmu_mode_pause(void)
>>  {
>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> +
>> +	VM_WARN_ON(state->nesting_level == 0 || !state->active);
> nit: do you need the first condition? I think when nesting_level==0, we expect
> to be !active?

I suppose this should never happen indeed - I was just being extra
defensive.

Either way David suggested allowing pause()/resume() to be called
outside of any section so the next version will bail out on
nesting_level == 0.

>> +
>> +	state->active = false;
>>  	arch_leave_lazy_mmu_mode();
>>  }
>>  
>>  static inline void lazy_mmu_mode_resume(void)
>>  {
>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> +
>> +	VM_WARN_ON(state->nesting_level == 0 || state->active);
> Similar argument?
>
>> +
>> +	state->active = true;
>>  	arch_enter_lazy_mmu_mode();
>>  }
>>  #else
>> diff --git a/include/linux/sched.h b/include/linux/sched.h
>> index cbb7340c5866..11566d973f42 100644
>> --- a/include/linux/sched.h
>> +++ b/include/linux/sched.h
>> @@ -1441,6 +1441,10 @@ struct task_struct {
>>  
>>  	struct page_frag		task_frag;
>>  
>> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>> +	struct lazy_mmu_state		lazy_mmu_state;
>> +#endif
>> +
>>  #ifdef CONFIG_TASK_DELAY_ACCT
>>  	struct task_delay_info		*delays;
>>  #endif
>> @@ -1724,6 +1728,18 @@ static inline char task_state_to_char(struct task_struct *tsk)
>>  	return task_index_to_char(task_state_index(tsk));
>>  }
>>  
>> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>> +static inline bool in_lazy_mmu_mode(void)
>> +{
>> +	return current->lazy_mmu_state.active;
>> +}
>> +#else
>> +static inline bool in_lazy_mmu_mode(void)
>> +{
>> +	return false;
> Just pointing out that this isn't really a correct implementation:
>
> lazy_mmu_mode_enable()
> ASSERT(in_lazy_mmu_mode()) << triggers for arches without lazy mmu
> lazy_mmu_mode_disable()
>
> Although it probably doesn't matter in practice?

I'd say that the expectation is invalid - lazy MMU mode can only be
enabled if the architecture supports it. In fact as you pointed out
above the API may be called in interrupt context but it will have no
effect, so this sequence would always fail in interrupt context.

Worth nothing that in_lazy_mmu_mode() is only ever called from arch code
where lazy MMU is implemented. I added the fallback as a matter of
principle, but it isn't actually required.

- Kevin

