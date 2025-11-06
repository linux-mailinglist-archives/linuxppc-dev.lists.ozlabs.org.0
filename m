Return-Path: <linuxppc-dev+bounces-13875-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D74CDC3A5F6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:52:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2JtK49C1z2xdg;
	Thu,  6 Nov 2025 21:52:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762426345;
	cv=none; b=DWWANaLgdsRYuKjEfLLWW1RRnQ0NkgoHekq3wGBQJvg+5/z0+sNLx4UGDY1MdSZI+Q4E4bAPfJeFEEjQFJ+AwhmH1uujRJ0RFFx0/Y9CmMLEbDwWD6BCGhWT5JIeMaxNyZT3NmUANcdR/v2UOwq7b7X0snblbrdrvWE3m707Cgox9O01R4kkBqbDQTg3DB/5tUZRT4iQSa8h7MidVkRX0YNMW3hoz624U4ONiyYP8fZ/uOQ9QoqP8zd35KuzMwdL9FPfRpigltnxZt87bj0mQdEwXOq8XxWAKnRtj8MeUvXNHIzv2lZnQMqudhtv0Xkc7DBA0/FJa42JuV752JaABA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762426345; c=relaxed/relaxed;
	bh=9BUIVBWzSEg5HnaNi8EEWsgRtlWmX6rseREfNx4QEYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GbZ/74ZpchUHHFKMI4O4g+HAsRbutGuTUPVhaPQzvUKCFoyPo+00cJ0pYznhmIJZaZCSe8EgCKaMuqS3CdK9B5TGNXldXELxkWYwhVgMnor7XU1RllMjOonkhr2NPiB4rziKFOOzmLyLClpPCJV7217b2ych5jF2OCayw8XlQBlrQSRCW18naFOg2spY6vD2zH0aklqY+95+PfCKJjXUJhjYG+lzGbPQLb5JtWMJaBZo4fw9aPKitQv1LSwRm4QeIsmYaTqMzYuIHNPbGVQKg7Pcbxx5Dir34rZAe1WQHXXWDAD+iEhwvFiV+4GOgR0mlDUp2na4L6VB/K70AcaD6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2JtJ4SWYz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:52:23 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20A081596;
	Thu,  6 Nov 2025 02:51:45 -0800 (PST)
Received: from [10.1.34.75] (unknown [10.1.34.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6866A3F63F;
	Thu,  6 Nov 2025 02:51:46 -0800 (PST)
Message-ID: <48a4ecb5-3412-4d3f-9e43-535f8bee505f@arm.com>
Date: Thu, 6 Nov 2025 10:51:43 +0000
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
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 Ritesh Harjani <ritesh.list@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
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
 <20251029100909.3381140-8-kevin.brodsky@arm.com>
 <87ms5050g0.ritesh.list@gmail.com>
 <50d1b63a-88d7-4484-82c0-3bde96e3207d-agordeev@linux.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <50d1b63a-88d7-4484-82c0-3bde96e3207d-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 05/11/2025 16:12, Alexander Gordeev wrote:
> On Wed, Nov 05, 2025 at 02:19:03PM +0530, Ritesh Harjani wrote:
>>> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
>>> + * currently enabled.
>>>   */
>>>  #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>>>  static inline void lazy_mmu_mode_enable(void)
>>>  {
>>> -	arch_enter_lazy_mmu_mode();
>>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>> +
>>> +	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
>>> +	/* enable() must not be called while paused */
>>> +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
>>> +
>>> +	if (state->nesting_level++ == 0) {
>>> +		state->active = true;
>>> +		arch_enter_lazy_mmu_mode();
>>> +	}
>>>  }
>> Some architectures disables preemption in their
>> arch_enter_lazy_mmu_mode(). So shouldn't the state->active = true should
>> happen after arch_enter_lazy_mmu_mode() has disabled preemption()? i.e.
> Do you have some scenario in mind that could cause an issue?
> IOW, what could go wrong if the process is scheduled to another
> CPU before preempt_disable() is called?

I'm not sure I understand the issue either.

>>   static inline void lazy_mmu_mode_enable(void)
>>   {
>>  -	arch_enter_lazy_mmu_mode();
>>  +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>  +
>>  +	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
>>  +	/* enable() must not be called while paused */
>>  +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
>>  +
>>  +	if (state->nesting_level++ == 0) {
>>  +		arch_enter_lazy_mmu_mode();
>>  +		state->active = true;
>>  +	}
>>   }
>>
>> ... I think it make more sense to enable the state after the arch_**
>> call right.
> But then in_lazy_mmu_mode() would return false if called from
> arch_enter_lazy_mmu_mode(). Not big problem, but still..

The ordering of nesting_level/active was the way you expected in v3, but
the conclusion of the discussion with David H [1] is that it doesn't
really matter so I simplified the ordering in v4 - the arch hooks
shouldn't call in_lazy_mmu_mode() or inspect lazy_mmu_state.
arch_enter()/arch_leave() shouldn't need it anyway since they're called
once per outer section (not in nested sections). arch_flush() could
potentially do something different when nested, but that seems unlikely.

- Kevin

[1]
https://lore.kernel.org/all/af4414b6-617c-4dc8-bddc-3ea00d1f6f3b@redhat.com/


