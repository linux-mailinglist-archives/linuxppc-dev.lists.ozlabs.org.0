Return-Path: <linuxppc-dev+bounces-14107-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 083E8C4EE21
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 16:57:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5WQ04Fv8z2yvM;
	Wed, 12 Nov 2025 02:57:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762876648;
	cv=none; b=Q09YvnDs1TCW6Mj9dV0nsTiJ5idauNPzOl/WaIvBYdVN3yTotfR7yb52ta/RB4W9EFmDRfWjHWVughvYOiVbJDmMZubYXgIG4Zz8mpsBUhCtj6YEftUN4Hwaut9aSzTibj6jX5UdYzZrQE0LQOEjS3kCye3rQs65hzaKylBASY1fm8TI//tkYEjIDWKT6kt3NKo0ripVrcJcR2mZbZUZ4elSSF3HNYK0UgnLUmSnGaFOgoR98IQr5of4OQZWhgXKZuZ3qw6PeV+gigpKQz3h4sqtKmN5HPQy5SB59F4IcxsUHd7Sve2eJSuQBh8G+Eh4H4wowzqjiEZniSVOvbA9OA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762876648; c=relaxed/relaxed;
	bh=+wOVHCwjCTKp66R7ucfYg0ohu+W1Y4sPrlqnEcbYBKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTFfGoYlcfUGvMWdCnqAa2ZbLjr9N99lav7EZac0LTSGlZVE47GZnRf+6JZk2dnKhhvHk+edyNar0vN6/50YkGX++PXMonZiBd/kTNjHu6Okf4D8T+u5LsdY9BXot8yYgofmUgQUlVyi+BTBXC4Nw2AxMRDeJPOyLuoClwDred7L8BGg5PLPlUqOjPW5WK32DRPDGQoXOmBTI9cVvFmrt6cf0ZMxL9/obdCnYotZy5T+PkR//HalRO4jg9+jzPdsCBwo/8gCj+UK9enR6Ik+ShhYMjPVJ+JgvekCo2yq7LsdRZ71hn+sbawpQV9umL/no5jwAHaUtqnmhK1NtkVV2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5WPz2Q6Dz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 02:57:25 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5ECCC2F;
	Tue, 11 Nov 2025 07:56:45 -0800 (PST)
Received: from [10.57.38.153] (unknown [10.57.38.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 489953F63F;
	Tue, 11 Nov 2025 07:56:47 -0800 (PST)
Message-ID: <58fd1a6e-f2c4-421c-9b95-dea4b244a515@arm.com>
Date: Tue, 11 Nov 2025 16:56:44 +0100
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
 <cc9dc398-b9c5-4bb8-94ad-7e7f3ddd5b4f@arm.com>
 <824bf705-e9d6-4eeb-9532-9059fa56427f@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <824bf705-e9d6-4eeb-9532-9059fa56427f@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/11/2025 10:24, Ryan Roberts wrote:
> [...]
>
>>>> +		state->active = true;
>>>> +		arch_enter_lazy_mmu_mode();
>>>> +	}
>>>>  }
>>>>  
>>>>  static inline void lazy_mmu_mode_disable(void)
>>>>  {
>>>> -	arch_leave_lazy_mmu_mode();
>>>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>>> +
>>>> +	VM_WARN_ON_ONCE(state->nesting_level == 0);
>>>> +	VM_WARN_ON(!state->active);
>>>> +
>>>> +	if (--state->nesting_level == 0) {
>>>> +		state->active = false;
>>>> +		arch_leave_lazy_mmu_mode();
>>>> +	} else {
>>>> +		/* Exiting a nested section */
>>>> +		arch_flush_lazy_mmu_mode();
>>>> +	}
>>>>  }
>>>>  
>>>>  static inline void lazy_mmu_mode_pause(void)
>>>>  {
>>>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>>> +
>>>> +	VM_WARN_ON(state->nesting_level == 0 || !state->active);
>>> nit: do you need the first condition? I think when nesting_level==0, we expect
>>> to be !active?
>> I suppose this should never happen indeed - I was just being extra
>> defensive.
>>
>> Either way David suggested allowing pause()/resume() to be called
>> outside of any section so the next version will bail out on
>> nesting_level == 0.
> Ignoring my current opinion that we don't need pause/resume at all for now; Are
> you suggesting that pause/resume will be completely independent of
> enable/disable? I think that would be best. So enable/disable increment and
> decrement the nesting_level counter regardless of whether we are paused.
> nesting_level 0 => 1 enables if not paused. nesting_level 1 => 0 disables if not
> paused. pause disables nesting_level >= 1, resume enables if nesting_level >= 1.

This is something else. Currently the rules are:

[A]

// pausing forbidden
enable()
    pause()
    // pausing/enabling forbidden
    resume()
disable()

David suggested allowing:

[B]

pause()
// pausing/enabling forbidden
resume()

Your suggestion is also allowing:

[C]

pause()
    // pausing forbidden
    enable()
    disable()
resume()

> Perhaps we also need nested pause/resume? Then you just end up with 2 counters;
> enable_count and pause_count. Sorry if this has already been discussed.

And finally:

[D]

pause()
    pause()
        enable()
        disable()
    resume()
resume()

I don't really mind either way, but I don't see an immediate use for [C]
and [D] - the idea is that the paused section is short and controlled,
not made up of arbitrary calls. A potential downside of allowing [C] and
[D] is that it makes it harder to detect unintended nesting (fewer
VM_WARN assertions). Happy to implement it if this proves useful though.

OTOH the idea behind [B] is that it allows the caller of
pause()/resume() not to care about whether lazy MMU is actually enabled
or not - i.e. the kasan helpers would keep working even if
apply_to_page_range() didn't use lazy MMU any more.

>>>> +
>>>> +	state->active = false;
>>>>  	arch_leave_lazy_mmu_mode();
>>>>  }
>>>>  
>>>>  static inline void lazy_mmu_mode_resume(void)
>>>>  {
>>>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>>> +
>>>> +	VM_WARN_ON(state->nesting_level == 0 || state->active);
>>> Similar argument?
>>>
>>>> +
>>>> +	state->active = true;
>>>>  	arch_enter_lazy_mmu_mode();
>>>>  }
>>>>  #else
>>>> diff --git a/include/linux/sched.h b/include/linux/sched.h
>>>> index cbb7340c5866..11566d973f42 100644
>>>> --- a/include/linux/sched.h
>>>> +++ b/include/linux/sched.h
>>>> @@ -1441,6 +1441,10 @@ struct task_struct {
>>>>  
>>>>  	struct page_frag		task_frag;
>>>>  
>>>> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>>>> +	struct lazy_mmu_state		lazy_mmu_state;
>>>> +#endif
>>>> +
>>>>  #ifdef CONFIG_TASK_DELAY_ACCT
>>>>  	struct task_delay_info		*delays;
>>>>  #endif
>>>> @@ -1724,6 +1728,18 @@ static inline char task_state_to_char(struct task_struct *tsk)
>>>>  	return task_index_to_char(task_state_index(tsk));
>>>>  }
>>>>  
>>>> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>>>> +static inline bool in_lazy_mmu_mode(void)
>>>> +{
>>>> +	return current->lazy_mmu_state.active;
>>>> +}
>>>> +#else
>>>> +static inline bool in_lazy_mmu_mode(void)
>>>> +{
>>>> +	return false;
>>> Just pointing out that this isn't really a correct implementation:
>>>
>>> lazy_mmu_mode_enable()
>>> ASSERT(in_lazy_mmu_mode()) << triggers for arches without lazy mmu
>>> lazy_mmu_mode_disable()
>>>
>>> Although it probably doesn't matter in practice?
>> I'd say that the expectation is invalid - lazy MMU mode can only be
>> enabled if the architecture supports it. In fact as you pointed out
>> above the API may be called in interrupt context but it will have no
>> effect, so this sequence would always fail in interrupt context.
> Yep, but previously there was no way to query the current state so it didn't
> matter. Now you have a query API so it might matter if/when people come along
> and use it in unexpected ways.

I suppose the best we can do is document it alongside those helpers
(David has already suggested some documentation, see patch 11).

>> Worth nothing that in_lazy_mmu_mode() is only ever called from arch code
>> where lazy MMU is implemented. I added the fallback as a matter of
>> principle, but it isn't actually required.
> Yes, I agree that's the intent. I'm just wondering if it's possible to enforce
> that only arch code uses this. Perhaps add some docs to explain that it's only
> intended for arches that implement lazy_mmu, and don't define it for arches that
> don't, which would catch any generic users?

Yep sounds like the best option - a lot less risk of misuse if it can't
be called from generic code :) The build would still succeed on arch's
that implement it, but the kernel CI should catch such calls sooner or
later.

- Kevin

