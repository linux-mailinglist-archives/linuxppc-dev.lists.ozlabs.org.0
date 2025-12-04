Return-Path: <linuxppc-dev+bounces-14600-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EEDCA37CE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 12:52:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMXv51l2Dz2xHG;
	Thu, 04 Dec 2025 22:52:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764849169;
	cv=none; b=jj1vyWVbp7hJzJ0McM//sRCjWohta9DMJPPy9+lQVVE4E8pl/Z5+z2mKrzZHcmqeQbM0Wvkdkt7A8cSKuGwiXGxspHe8pI55RFPX6Db9XAj7dD5W/ir6FpYC75seRQIZe8axfRoGp1aJHQLeSYLQSpRPluX3JMU5sMji2TTlp6ZtV0CLEB8tnqg4n67vfjJlXv0AV3PAl+ttALQ++qzgsRxz3SUUSjTKDWdPIn9TZLMZW3BI+jyllcekU2R0KSc1v2bmhblYMrIUJLqxbtBLfYNnuQvBYYnRRl1sYZe0kDdAFlxPCOGnvdXCZj2/s3DmkEQNeCYJouxA5Qsob+Zm9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764849169; c=relaxed/relaxed;
	bh=/D90w5HbPCz2bt7xnv+mJ1PnVxBYxNP9wTE7H670eFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BOvzXAEjbq5X/Pa+kuroXzRzzbbGDrYnrY7YnQZ6vyAVsXDXsv9TXLAIHfmrXdPc0cB312DIotsM4/fapx1V1/+aMl0mq1G9GzfuD8cRAcKJAgbJF/cUzHXRlvlVz98ImtgN5kaeYUmG+w2SBK8bxqNbJ/02qZVhz8FZNd3OIiIzT7e1j/H+NqOTkFGiizYi5ZvYFu8DzAcB7xcJpyAUmpH3Q5NbIiiOys9WiDDjCa0VYqm6khqIamg11ODCHh2BhfSGO3/kuKxhFaanqh/e2Kq+H6ZyIpSsod/P17pfx5SVlny6LwA0zw633tolK3wcTKn93SvTdIZDCLnbAPIUtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ISfT7eeA; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ISfT7eeA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMXv40mwgz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Dec 2025 22:52:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE65D404ED;
	Thu,  4 Dec 2025 11:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68460C4CEFB;
	Thu,  4 Dec 2025 11:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764849165;
	bh=u1Zp6G/Tnzzf/H5X3ENLn84JA+wr9i7r3UFkx+PY1cA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ISfT7eeAMaUkykWFftAF34p60f1XrKRSCDcOgF5EQ7sjgQQQ6kR+ZfcxZf3nREGvz
	 3ImEd584csKzW2sprI2y59/eBKWA2YlWw7s0K9vR4XEpOPMmlPP8wvttqFfXSE4zN6
	 oekU1nlMo+H/Bg6n4zYp/bTOGvrxv/gOpiDiNlxCA9Y4OE+4DDcmSt+S8/kIsT/ev5
	 Uux8ESGp7F4HLNoZUmXHGJYu5mcFtULBpaUzDu9+oyUtKeFcenBNNa96Vy0OfGm27t
	 Z0EcKxK9WF0aNa8nPuC5BwJT+8bBhjdQ74Oz3kptWtnS35Y+COG+101Ok84TWX356P
	 FasrAKF5f+8MA==
Message-ID: <93d04ef8-0364-4013-8839-ba599d930cb2@kernel.org>
Date: Thu, 4 Dec 2025 12:52:32 +0100
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
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
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
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <2dfd54d7-fe2a-4921-85ff-a581392a777a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Some comments from my side:


>>   static inline void arch_enter_lazy_mmu_mode(void)
>>   {
>> -	/*
>> -	 * lazy_mmu_mode is not supposed to permit nesting. But in practice this
>> -	 * does happen with CONFIG_DEBUG_PAGEALLOC, where a page allocation
>> -	 * inside a lazy_mmu_mode section (such as zap_pte_range()) will change
>> -	 * permissions on the linear map with apply_to_page_range(), which
>> -	 * re-enters lazy_mmu_mode. So we tolerate nesting in our
>> -	 * implementation. The first call to arch_leave_lazy_mmu_mode() will
>> -	 * flush and clear the flag such that the remainder of the work in the
>> -	 * outer nest behaves as if outside of lazy mmu mode. This is safe and
>> -	 * keeps tracking simple.
>> -	 */
>> -
>>   	set_thread_flag(TIF_LAZY_MMU);>  }
> 
> Should not platform specific changes be deferred to subsequent patches until
> nesting is completely enabled in generic first ? Although no problem as such
> but would be bit cleaner.

This could indeed be done in a separate patch. But I also don't see a 
problem with updating the doc in this patch.

> 
>>   
>> diff --git a/include/linux/mm_types_task.h b/include/linux/mm_types_task.h
>> index a82aa80c0ba4..11bf319d78ec 100644
>> --- a/include/linux/mm_types_task.h
>> +++ b/include/linux/mm_types_task.h
>> @@ -88,4 +88,9 @@ struct tlbflush_unmap_batch {
>>   #endif
>>   };
>>   
>> +struct lazy_mmu_state {
>> +	u8 enable_count;
>> +	u8 pause_count;
>> +};
>> +
> 
> Should not this be wrapped with CONFIG_ARCH_HAS_LAZY_MMU_MODE as the task_struct
> element 'lazy_mmu_state' is only available with the feature.

No strong opinion; the compiler will ignore it either way. And less 
ifdef is good, right? :)

... and there is nothing magical in there that would result in other 
dependencies.

> Besides, is a depth
> of 256 really expected here ? 4 bits for each element would not be sufficient for
> a depth of 16 ?


We could indeed use something like

struct lazy_mmu_state {
	u8 enable_count : 4;
	u8 pause_count : 4;
};

but then, the individual operations on enable_count/pause_count need 
more instructions.

Further, as discussed, this 1 additional byte barely matters given the 
existing size of the task struct.

No strong opinion.

> 
>>    */
>>   #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>> +/**
>> + * lazy_mmu_mode_enable() - Enable the lazy MMU mode.
>> + *
>> + * Enters a new lazy MMU mode section; if the mode was not already enabled,
>> + * enables it and calls arch_enter_lazy_mmu_mode().
>> + *
>> + * Must be paired with a call to lazy_mmu_mode_disable().
>> + *
>> + * Has no effect if called:
>> + * - While paused - see lazy_mmu_mode_pause()
>> + * - In interrupt context
>> + */
>>   static inline void lazy_mmu_mode_enable(void)
>>   {
>> -	if (in_interrupt())
>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> +
>> +	if (in_interrupt() || state->pause_count > 0)
>>   		return;
>>   
>> -	arch_enter_lazy_mmu_mode();
>> +	VM_WARN_ON_ONCE(state->enable_count == U8_MAX);
>> +
>> +	if (state->enable_count++ == 0)
>> +		arch_enter_lazy_mmu_mode();
> 
> When lazy_mmu_mode_enable() gets called for the first time with state->enable_count as 0,
> then arch_enter_lazy_mmu_mode() will not get called ? Bit confused.


state->enable_count++ returns the old value (0). Are you thinking of
++state->enable_count?

But maybe I misudnerstood your concern.

[...]

>> +/**
>> + * lazy_mmu_mode_pause() - Resume the lazy MMU mode.
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
>>   static inline void lazy_mmu_mode_resume(void)
>>   {
>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> +
>>   	if (in_interrupt())
>>   		return;
>>   
>> -	arch_enter_lazy_mmu_mode();
>> +	VM_WARN_ON_ONCE(state->pause_count == 0);
>> +
>> +	if (--state->pause_count == 0 && state->enable_count > 0)
>> +		arch_enter_lazy_mmu_mode();
>>   }
> 
> Should not state->pause/enable_count tests and increment/decrement be handled
> inside include/linux/sched via helpers like in_lazy_mmu_mode() ? This is will
> ensure cleaner abstraction with respect to task_struct.

I don't think this is required given that this code here implements
CONFIG_ARCH_HAS_LAZY_MMU_MODE support.

-- 
Cheers

David

