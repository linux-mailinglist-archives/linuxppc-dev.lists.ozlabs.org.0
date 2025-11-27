Return-Path: <linuxppc-dev+bounces-14525-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4AEC8E4E1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Nov 2025 13:46:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHGQ34kGSz2xQq;
	Thu, 27 Nov 2025 23:46:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764247579;
	cv=none; b=KnU+OtU0pJl+RwixufKoOu6F7xHvxqhyOwD3s0lcrWrOOJNivG3XV+73YrdMblyb1cD00xl0/h148CEuXhw6zmqTv9Z35ClDLb8koygPtvMpgl7B4ZxXq3Krnxx/sENlypIvdIkKulRX+Y6VOk045E+uNXyGkp1CrkY6OkDa546XGIniDssO7wKMiGmSJCIKyo61Cr+hJDunjU5kjci5XWdx6BaavIIS2qpULqoySk3eH2lKhzqM0A4TDcqLmFZnoApFh75GoJDuXkepWpRNrakUelWjgFwD7WusZ6+GRnoCIBBZo0esf/bzCBA9NHcRPFxJYcQxKXoS8R1NQ7BINQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764247579; c=relaxed/relaxed;
	bh=n5j7xH8fTEoSKbVxXFkE4YpsGUIr1lBxjhNUPeg+DYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B9jiGNnUUXdyhI5lRsOda99uj//secJQgkzJ8t6k0pu60sa3KueBEjIGO8V2MQvoKyfg0+bh2rFrm2JVGduL84cvt8rC/LyFGfdWo+b+asu01sr3SbsNwRgZbwcJ33djAHssVCfcJa+8/f/XjHSi1uWI6wjt0KPgLlxdVrCHxBTcp45RMo2uVprR6A/XzBx/jIkLSCg7fTjnf4c+nttIYJsxsvuKgluDmCY5p1H1EBz5DujHteZHmb0KbMvxWqmX1B+8UcXOPyTnkmvan1+J55ouVUOWxvKlfuEc2xuA/96e4+VKmEdZKab5gAvbuC5jFPRQAOif6wNWhwfWS7X3oQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHGQ20HLCz2xP8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 23:46:16 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11C781477;
	Thu, 27 Nov 2025 04:45:36 -0800 (PST)
Received: from [10.57.43.59] (unknown [10.57.43.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC00D3F73B;
	Thu, 27 Nov 2025 04:45:35 -0800 (PST)
Message-ID: <0cb512ba-de15-4ba6-a85a-8287ab67fb53@arm.com>
Date: Thu, 27 Nov 2025 13:45:33 +0100
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
To: Alexander Gordeev <agordeev@linux.ibm.com>
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
 <4d0eab1a-e1dc-49cf-8640-727c9734233d-agordeev@linux.ibm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <4d0eab1a-e1dc-49cf-8640-727c9734233d-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 27/11/2025 13:33, Alexander Gordeev wrote:
> On Mon, Nov 24, 2025 at 01:22:24PM +0000, Kevin Brodsky wrote:
>
> Hi Kevin,
>
> ...
>> +/**
>> + * lazy_mmu_mode_pause() - Pause the lazy MMU mode.
>> + *
>> + * Pauses the lazy MMU mode; if it is currently active, disables it and calls
>> + * arch_leave_lazy_mmu_mode().
>> + *
>> + * Must be paired with a call to lazy_mmu_mode_resume(). Calls to the
>> + * lazy_mmu_mode_* API have no effect until the matching resume() call.
> Sorry if it was discussed already - if yes, I somehow missed it. If I read
> the whole thing correctly enter()/pause() interleaving is not forbidden?

Correct, any call inside pause()/resume() is now allowed (but
effectively ignored). See discussion with Ryan in v4 [1].

[1]
https://lore.kernel.org/all/824bf705-e9d6-4eeb-9532-9059fa56427f@arm.com/

> lazy_mmu_mode_enable()
> 	lazy_mmu_mode_pause()
> 		lazy_mmu_mode_enable()
> 		...
> 		lazy_mmu_mode_disable()
> 	lazy_mmu_mode_resume()
> lazy_mmu_mode_disable()
>
>> + *
>> + * Has no effect if called:
>> + * - While paused (inside another pause()/resume() pair)
>> + * - In interrupt context
>> + */
>>  static inline void lazy_mmu_mode_pause(void)
>>  {
>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> +
>>  	if (in_interrupt())
>>  		return;
>>  
>> -	arch_leave_lazy_mmu_mode();
>> +	VM_WARN_ON_ONCE(state->pause_count == U8_MAX);
>> +
>> +	if (state->pause_count++ == 0 && state->enable_count > 0)
>> +		arch_leave_lazy_mmu_mode();
>>  }
>>  
>> +/**
>> + * lazy_mmu_mode_pause() - Resume the lazy MMU mode.
>                     resume() ?

Good catch! One copy-paste too many...

- Kevin

>> + *
>> + * Resumes the lazy MMU mode; if it was active at the point where the matching
>> + * call to lazy_mmu_mode_pause() was made, re-enables it and calls
>> + * arch_enter_lazy_mmu_mode().
>> + *
>> + * Must match a call to lazy_mmu_mode_pause().
>> + *
>> + * Has no effect if called:
>> + * - While paused (inside another pause()/resume() pair)
>> + * - In interrupt context
>> + */
>>  static inline void lazy_mmu_mode_resume(void)
>>  {
>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> +
>>  	if (in_interrupt())
>>  		return;
>>  
>> -	arch_enter_lazy_mmu_mode();
>> +	VM_WARN_ON_ONCE(state->pause_count == 0);
>> +
>> +	if (--state->pause_count == 0 && state->enable_count > 0)
>> +		arch_enter_lazy_mmu_mode();
>>  }
> ...
> Thanks!

