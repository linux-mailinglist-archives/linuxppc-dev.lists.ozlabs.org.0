Return-Path: <linuxppc-dev+bounces-13733-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7248C30BC8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 12:29:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d15nz44pmz3bfM;
	Tue,  4 Nov 2025 22:29:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762255767;
	cv=none; b=O0KjXHFPagFZS7PeQejCGcKZG/Ub4zbGx7r+sBhrKsoanoUegHg83JjKuJs0Rz27bgTCHOynn8BqUy/pHxIYlOGx/CtvT1sdUDrtbUh0j8n1txVEWOZlylRdoShCwS1ZfrqEep4Rf979hE5mldhAh1T+LVJa4CLHUHxyF5BM7xgpcrP2olJEFeZWhUSdMtUxkW7fLWb4UydreoOIGkcbMOEjpGiUaYark9QegBORcTYYd6Adijc1vU+8n+j4LOwfOF97s5zewLS3NCnghDdyBFLc3UuhHDQXWXz/F2f8X0uhl781c5E55adoXcBOmANjazLDwCj9wKhxsfUuAp6/qw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762255767; c=relaxed/relaxed;
	bh=Q8S8W8Ce89aAd6Lp63iqNC1/ehzjUmA4uJIWdv2wfyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSVJShseI7Q6XRYO6Ri55U6NjKyhyUCPurTAHpA8bL8FacLEvGmdZvT8DoquZzmQJp+TesmA7A+as2Ttz4t7/3cS9dxaQbkvtCTTojacIANqZ7sbTgKo0vLyf+KF1Khto8nmspXkqBltBmymKOE4zocp4C+K8Y91Acx0ubuDUAfHseR3lYfqtptYhxgxfuxzcm4sxkZU09/fRxahWN2m0BumBXgwiuGd3NR/CSjZC1ZL68P1yn9a3v+N8238qwp2zJl6AMVkVwVZ8AlPizuWsWWbHvugcZq5ZOkB2aeitbkOKjmA0l4rSiipc+ORiEEQvMrRc0wduAeY3Xbp3F2Xrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d15ny3MLbz304H
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 22:29:24 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D54651C2B;
	Tue,  4 Nov 2025 03:28:44 -0800 (PST)
Received: from [10.1.38.100] (e126510-lin.cambridge.arm.com [10.1.38.100])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15B213F63F;
	Tue,  4 Nov 2025 03:28:44 -0800 (PST)
Message-ID: <216d54f1-334f-4600-9ecb-f7788b1abd7d@arm.com>
Date: Tue, 4 Nov 2025 11:28:42 +0000
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
Subject: Re: [PATCH v4 11/12] x86/xen: use lazy_mmu_state when
 context-switching
To: "David Hildenbrand (Red Hat)" <david@kernel.org>, linux-mm@kvack.org
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
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-12-kevin.brodsky@arm.com>
 <c7c8a233-2103-4b48-b65e-ec81666d20e4@kernel.org>
 <285faae4-dab6-4819-847a-889bdf87d5d7@arm.com>
 <a326d1eb-62f1-4add-8dc9-cea7d7e4ed3c@kernel.org>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <a326d1eb-62f1-4add-8dc9-cea7d7e4ed3c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 03/11/2025 19:23, David Hildenbrand (Red Hat) wrote:
> On 03.11.25 19:29, Kevin Brodsky wrote:
>> On 03/11/2025 16:15, David Hildenbrand (Red Hat) wrote:
>>> On 29.10.25 11:09, Kevin Brodsky wrote:
>>>> [...]
>>>>
>>>> @@ -437,7 +436,7 @@ static void xen_end_context_switch(struct
>>>> task_struct *next)
>>>>          xen_mc_flush();
>>>>        leave_lazy(XEN_LAZY_CPU);
>>>> -    if (test_and_clear_ti_thread_flag(task_thread_info(next),
>>>> TIF_LAZY_MMU_UPDATES))
>>>> +    if (next->lazy_mmu_state.active)
>>>
>>> This is nasty. If in_lazy_mmu_mode() is not sufficient, we will want
>>> to have a separate helper that makes it clear what the difference
>>> between both variants is.
>>
>> in_lazy_mmu_mode() operates on current, but here we're operating on a
>> different task. The difference is more fundamental than just passing a
>> task_struct * or not: in_lazy_mmu_mode() is about whether we're
>> currently in lazy MMU mode, i.e. not paused and not in interrupt
>> context. A task that isn't scheduled is never in lazy MMU mode -
>> lazy_mmu_state.active is just the saved state to be restored when
>> scheduled again.
>>
>> My point here is that we could have a helper for this use-case, but it
>> should not be used in other situations (at least not on current). Maybe
>> __task_lazy_mmu_active(task)? I do wonder if accessing lazy_mmu_state
>> directly isn't expressing the intention well enough though (checking the
>> saved state).
>
>
> Likely there should be a
>
> /**
>  * task_lazy_mmu_active - test whether the lazy-mmu mode is active for a
>  *              task
>  * @task: ...
>  *
>  * The lazy-mmu mode is active if a task has lazy-mmu mode enabled and
>  * currently not paused.
>  */
> static inline bool task_lazy_mmu_active(struct task_struct *task)
> {
>     return task->lazy_mmu_state.active;
> }
>
> /**
>  * in_lazy_mmu_mode() - test whether current is in lazy-mmu mode
>  *
>  * Test whether the current task is in lazy-mmu mode: whether the
>  * interrupts are enabled and the lazy-mmu mode is active for the
>  * current task.
>  */
>  static inline bool in_lazy_mmu_mode(void)
>  {
> +    if (in_interrupt())
> +        return false;
> +
>      return task_lazy_mmu_active(current);
>  }
>
>
> Something like that. Maybe we can find better terminology.

That's probably the clearest yes, will make the change. I can't think of
more self-documenting names, spelling out the difference in the comments
is likely the best we can do.

- Kevin

