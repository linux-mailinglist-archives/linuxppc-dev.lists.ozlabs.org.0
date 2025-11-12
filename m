Return-Path: <linuxppc-dev+bounces-14119-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F51C51BD1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 11:43:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d60PV5pTNz2yvJ;
	Wed, 12 Nov 2025 21:43:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762944222;
	cv=none; b=la0O/X2U/DZz4rUy7sJwCi/uv9E/DEaSvZKZQtF7iPvUP/BtY4XGTBocp3SjNapb/wJ0gZqJqzpJn2VGEaXEqwsPTwaLrNbQPpOezR78kVtm88ZbqCYVrP0d8c6hnEqx4OEI02EBrUMDcavoIX34gioLaVdorKCLcta346mGNl+hIUCqOWtc2OKpWUBjIh1hDpvGwWS5m+K66As4gG/c/2xtro26vgL4F6cUKtFMS5Zr+wIxzY2Gqo9ye1J44dsuhNL9RFqiM75f/M8FIgdElARLAEMRK/4Re1/VQ2rSvA4QR0m53gk7VDLgHwQJVB2Y9rbOmFhZkQOVUJx9aLPI9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762944222; c=relaxed/relaxed;
	bh=9CszuyZCpIAkXuMjAUxx68LzymHvfkndaeApzQvLhEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eCAez7NcFvL/kw7RQOILs2k/czcyFYc60FdaMLR/dQ9ynM8y52hcsnCMVmRMLrVgBpwFy5fsyUGaQyjgQpkYB1aEQ+K7XSH5kIykQaOx3C61wx3/Z9ZMngNxr9SwwlPOq9a24xnesMKoQNE1Vup2bHFlEVAcXC78GNrkUwrb7WDpkU3Jix5E1QbD8Beo3pXjlUFwlJ2YnNFIGJrFzlYz2+1rmdfUPvA6/4qJy0/hcpPWYWuZkiJUQcGJ6dXHqc3FL836DMKBLNLaiePoAqNMYkyc6kUlDlTZRcjE0CecKMk1QrKSvZP9dIFawZKwHGMiI6pBFxZQxMAaueM264xhdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d60PT3f3Sz2xnk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 21:43:39 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7755A1515;
	Wed, 12 Nov 2025 02:42:59 -0800 (PST)
Received: from [10.57.41.24] (unknown [10.57.41.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A008F3F5A1;
	Wed, 12 Nov 2025 02:43:00 -0800 (PST)
Message-ID: <cdb4b97a-415b-4dba-877b-0cd570381a6d@arm.com>
Date: Wed, 12 Nov 2025 11:42:58 +0100
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
To: Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org,
 David Hildenbrand <david@redhat.com>
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
 <58fd1a6e-f2c4-421c-9b95-dea4b244a515@arm.com>
 <8f70692c-25a9-4bd0-94ab-43ab435e4b1b@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <8f70692c-25a9-4bd0-94ab-43ab435e4b1b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/11/2025 17:03, Ryan Roberts wrote:
> On 11/11/2025 15:56, Kevin Brodsky wrote:
>> On 11/11/2025 10:24, Ryan Roberts wrote:
>>> [...]
>>>
>>>>>> +		state->active = true;
>>>>>> +		arch_enter_lazy_mmu_mode();
>>>>>> +	}
>>>>>>  }
>>>>>>  
>>>>>>  static inline void lazy_mmu_mode_disable(void)
>>>>>>  {
>>>>>> -	arch_leave_lazy_mmu_mode();
>>>>>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>>>>> +
>>>>>> +	VM_WARN_ON_ONCE(state->nesting_level == 0);
>>>>>> +	VM_WARN_ON(!state->active);
>>>>>> +
>>>>>> +	if (--state->nesting_level == 0) {
>>>>>> +		state->active = false;
>>>>>> +		arch_leave_lazy_mmu_mode();
>>>>>> +	} else {
>>>>>> +		/* Exiting a nested section */
>>>>>> +		arch_flush_lazy_mmu_mode();
>>>>>> +	}
>>>>>>  }
>>>>>>  
>>>>>>  static inline void lazy_mmu_mode_pause(void)
>>>>>>  {
>>>>>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>>>>> +
>>>>>> +	VM_WARN_ON(state->nesting_level == 0 || !state->active);
>>>>> nit: do you need the first condition? I think when nesting_level==0, we expect
>>>>> to be !active?
>>>> I suppose this should never happen indeed - I was just being extra
>>>> defensive.
>>>>
>>>> Either way David suggested allowing pause()/resume() to be called
>>>> outside of any section so the next version will bail out on
>>>> nesting_level == 0.
>>> Ignoring my current opinion that we don't need pause/resume at all for now; Are
>>> you suggesting that pause/resume will be completely independent of
>>> enable/disable? I think that would be best. So enable/disable increment and
>>> decrement the nesting_level counter regardless of whether we are paused.
>>> nesting_level 0 => 1 enables if not paused. nesting_level 1 => 0 disables if not
>>> paused. pause disables nesting_level >= 1, resume enables if nesting_level >= 1.
>> This is something else. Currently the rules are:
>>
>> [A]
>>
>> // pausing forbidden
>> enable()
>>     pause()
>>     // pausing/enabling forbidden
>>     resume()
>> disable()
>>
>> David suggested allowing:
>>
>> [B]
>>
>> pause()
>> // pausing/enabling forbidden
>> resume()
>>
>> Your suggestion is also allowing:
>>
>> [C]
>>
>> pause()
>>     // pausing forbidden
>>     enable()
>>     disable()
>> resume()
> I think the current kasan kasan_depopulate_vmalloc_pte() path will require [C]
> if CONFIG_DEBUG_PAGEALLOC is enabled on arm64. It calls __free_page() while
> paused. I guess CONFIG_DEBUG_PAGEALLOC will cause __free_page() ->
> debug_pagealloc_unmap_pages() ->->-> update_range_prot() -> lazy_mmu_enable().

Well, I really should have tried booting with KASAN enabled before...
lazy_mmu_mode_enable() complains exactly as you predicted:

> [    1.047587] WARNING: CPU: 0 PID: 1 at include/linux/pgtable.h:273
> update_range_prot+0x2dc/0x50c
> [    1.048025] Modules linked in:
> [    1.048296] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 6.18.0-rc3-00012-ga901e7f479f1 #142 PREEMPT
> [    1.048706] Hardware name: FVP Base RevC (DT)
> [    1.048941] pstate: 11400009 (nzcV daif +PAN -UAO -TCO +DIT -SSBS
> BTYPE=--)
> [    1.049309] pc : update_range_prot+0x2dc/0x50c
> [    1.049631] lr : update_range_prot+0x80/0x50c
> [    1.049950] sp : ffff8000800e6f20
> [    1.050162] x29: ffff8000800e6fb0 x28: ffff700010014000 x27:
> ffff700010016000
> [    1.050747] x26: 0000000000000000 x25: 0000000000000001 x24:
> 00000000008800f7
> [    1.051308] x23: 0000000000000000 x22: fff00008000f7000 x21:
> fff00008003009f8
> [    1.051884] x20: fff00008000f8000 x19: 1ffff0001001cdea x18:
> ffff800080769000
> [    1.052469] x17: ffff95c63264ec00 x16: ffff8000800e7504 x15:
> 0000000000000003
> [    1.053045] x14: ffff95c63482f000 x13: 0000000000000000 x12:
> ffff783ffc0007bf
> [    1.053620] x11: 1ffff83ffc0007be x10: ffff783ffc0007be x9 :
> dfff800000000000
> [    1.054203] x8 : fffd80010001f000 x7 : ffffffffffffffff x6 :
> 0000000000000001
> [    1.054776] x5 : 0000000000000000 x4 : fff00008003009f9 x3 :
> 1ffe00010006013f
> [    1.055348] x2 : fff0000800300000 x1 : 0000000000000001 x0 :
> 0000000000000000
> [    1.055912] Call trace:
> [    1.056100]  update_range_prot+0x2dc/0x50c (P)
> [    1.056478]  set_memory_valid+0x44/0x70
> [    1.056850]  __kernel_map_pages+0x68/0xe4
> [    1.057226]  __free_frozen_pages+0x528/0x1180
> [    1.057601]  ___free_pages+0x11c/0x160
> [    1.057961]  __free_pages+0x14/0x20
> [    1.058307]  kasan_depopulate_vmalloc_pte+0xd4/0x184
> [    1.058748]  __apply_to_page_range+0x678/0xda8
> [    1.059149]  apply_to_existing_page_range+0x14/0x20
> [    1.059553]  kasan_release_vmalloc+0x138/0x200
> [    1.059982]  purge_vmap_node+0x1b4/0x8a0
> [    1.060371]  __purge_vmap_area_lazy+0x4f8/0x870
> [    1.060779]  _vm_unmap_aliases+0x488/0x6ec
> [    1.061176]  vm_unmap_aliases+0x1c/0x34
> [    1.061567]  change_memory_common+0x17c/0x380
> [    1.061949]  set_memory_ro+0x18/0x24
> [...]


> Arguably you could move the resume() to before the __free_page(). But it just
> illustrates that it's all a bit brittle at the moment...

Difficult to disagree. With things like DEBUG_PAGEALLOC it becomes very
hard to know what is guaranteed not to use lazy MMU.

>>> Perhaps we also need nested pause/resume? Then you just end up with 2 counters;
>>> enable_count and pause_count. Sorry if this has already been discussed.
>> And finally:
>>
>> [D]
>>
>> pause()
>>     pause()
>>         enable()
>>         disable()
>>     resume()
>> resume()
>>
>> I don't really mind either way, but I don't see an immediate use for [C]
>> and [D] - the idea is that the paused section is short and controlled,
>> not made up of arbitrary calls. 
> If my thinking above is correct, then I've already demonstrated that this is not
> the case. So I'd be inclined to go with [D] on the basis that it is the most robust.
>
> Keeping 2 nesting counts (enable and pause) feels pretty elegant to me and gives
> the fewest opportunities for surprises.

Agreed, if we're going to allow enable() within a paused section, then
we might as well allow paused sections to nest too. The use-case is
clear, so I'm happy to go ahead and make those changes.

David, any thoughts?

- Kevin

>
> Thanks,
> Ryan
>
>> A potential downside of allowing [C] and
>> [D] is that it makes it harder to detect unintended nesting (fewer
>> VM_WARN assertions). Happy to implement it if this proves useful though.
>>
>> OTOH the idea behind [B] is that it allows the caller of
>> pause()/resume() not to care about whether lazy MMU is actually enabled
>> or not - i.e. the kasan helpers would keep working even if
>> apply_to_page_range() didn't use lazy MMU any more.
>>
>>>>>> +
>>>>>> +	state->active = false;
>>>>>>  	arch_leave_lazy_mmu_mode();
>>>>>>  }
>>>>>>  
>>>>>> [...]

