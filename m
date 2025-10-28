Return-Path: <linuxppc-dev+bounces-13428-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 458EBC141EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 11:35:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwmwn6Ybkz3dng;
	Tue, 28 Oct 2025 21:35:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761647721;
	cv=none; b=gw6uQJTyw4zbffnChx5ki4sFcIADbKpmBi0cnV/vCQgNguNpY173tR7OXtbepmpndS0GxJ7MmDVgoJBCwldICBrcvPgSZVNpAJ6mkv14MhykvO3+VCLt7ZmjNDhqObE1AfgWnDKWPqX8fSYt5Ih9wxhQ7AyMlc2D+iavhWZ84Jb/00RRX9l6gJZIb3QvIgrV3fwbKjoIpbqK5f5HGPtdC2C6wegHv3AUwUVHoMpE4AGvLJQijSjl2AZq/csC59rlBupillS1S8PTT798PL8sum0DIMrHIHWkiaMUnGKMpIJY8MUpKv1L57zxWwUS9uX79lfXour/9imPRneViTZdng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761647721; c=relaxed/relaxed;
	bh=5HaFRhf1AjitWDNq9/FJXcfd6yha35h050b//Tq74Pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPfEEJM+EUjwt4xW9G8lG18mAQsXDY6OUjidRuN70kJ6dh1Kbt0zM2Pnwfu4M98rjNlu/fvfTxqLSj0OJqAkQApEiRgyUwlMN8T3lorMBhlygKpAa+hxmLyvqhU/t3LcOq5/vZkiCRA7Kz7RGyZX2lYjpeBu/evOl5Xnnhyzxq7nnxLxcpO+sqzaW/j1t8t/rRY8Wg8Q2Q+WxzKlJQ/27/OA3BtYJLFile5Hy1+GomBCQtkGoGxzY4G1yTR6IFU6gIZR51j/26ad1IkhetKMuk29AygHdcMtbCbOwH3IZrzARUZmq17ktCFNsfjBO91Csvq540bDwGiW6HgRAX0nQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwmwm5gHXz3dhY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 21:35:19 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07A50106F;
	Tue, 28 Oct 2025 03:34:39 -0700 (PDT)
Received: from [10.44.160.74] (unknown [10.44.160.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3597D3F63F;
	Tue, 28 Oct 2025 03:34:39 -0700 (PDT)
Message-ID: <f3b8a71c-7698-4918-99d1-36e97bded97c@arm.com>
Date: Tue, 28 Oct 2025 11:34:34 +0100
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
Subject: Re: [PATCH v3 06/13] mm: introduce generic lazy_mmu helpers
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
 <20251015082727.2395128-7-kevin.brodsky@arm.com>
 <73b274b7-f419-4e2e-8620-d557bac30dc2@redhat.com>
 <390e41ae-4b66-40c1-935f-7a1794ba0b71@arm.com>
 <f8d22ae0-4e36-4537-903f-28164c850fdb@redhat.com>
 <28bf77c0-3aa9-4c41-aa2b-368321355dbb@arm.com>
 <14030818-52e7-41eb-8ad7-602f3476d448@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <14030818-52e7-41eb-8ad7-602f3476d448@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 27/10/2025 17:24, David Hildenbrand wrote:
> On 24.10.25 16:32, Kevin Brodsky wrote:
>> On 24/10/2025 15:27, David Hildenbrand wrote:
>>> On 24.10.25 14:13, Kevin Brodsky wrote:
>>>> On 23/10/2025 21:52, David Hildenbrand wrote:
>>>>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>>>>> [...]
>>>>>>
>>>>>> * madvise_*_pte_range() call arch_leave() in multiple paths, some
>>>>>>      followed by an immediate exit/rescheduling and some followed
>>>>>> by a
>>>>>>      conditional exit. These functions assume that they are called
>>>>>>      with lazy MMU disabled and we cannot simply use
>>>>>> pause()/resume()
>>>>>>      to address that. This patch leaves the situation unchanged by
>>>>>>      calling enable()/disable() in all cases.
>>>>>
>>>>> I'm confused, the function simply does
>>>>>
>>>>> (a) enables lazy mmu
>>>>> (b) does something on the page table
>>>>> (c) disables lazy mmu
>>>>> (d) does something expensive (split folio -> take sleepable locks,
>>>>>       flushes tlb)
>>>>> (e) go to (a)
>>>>
>>>> That step is conditional: we exit right away if pte_offset_map_lock()
>>>> fails. The fundamental issue is that pause() must always be matched
>>>> with
>>>> resume(), but as those functions look today there is no situation
>>>> where
>>>> a pause() would always be matched with a resume().
>>>
>>> We have matches enable/disable, so my question is rather "why" you are
>>> even thinking about using pause/resume?
>>>
>>> What would be the benefit of that? If there is no benefit then just
>>> drop this from the patch description as it's more confusing than just
>>> ... doing what the existing code does :)
>>
>> Ah sorry I misunderstood, I guess you originally meant: why would we use
>> pause()/resume()?
>>
>> The issue is the one I mentioned in the commit message: using
>> enable()/disable(), we assume that the functions are called with lazy
>> MMU mode is disabled. Consider:
>>
>>    lazy_mmu_mode_enable()
>>    madvise_cold_or_pageout_pte_range():
>>      lazy_mmu_mode_enable()
>>      ...
>>      if (need_resched()) {
>>        lazy_mmu_mode_disable()
>>        cond_resched() // lazy MMU still enabled
>>      }
>>
>> This will explode on architectures that do not allow sleeping while in
>> lazy MMU mode. I'm not saying this is an actual problem - I don't see
>> why those functions would be called with lazy MMU mode enabled. But it
>> does go against the notion that nesting works everywhere.
>
> I would tackle it from a different direction: if code calls with lazy
> MMU enabled into random other code that might sleep, that caller would
> be wrong.
>
> It's not about changing functions like this to use pause/resume.
>
> Maybe the rule is simple: if you enable the lazy MMU, don't call any
> functions that might sleep.

You're right, this is a requirement for lazy MMU. Calling enable() then
disable() means returning to the original state, and if the function
sleeps at that point then the caller must not itself enable lazy MMU.

I mixed up that case with the original motivation for pause()/resume(),
which is to temporarily pause any batching. This is considered an
implementation detail and the caller isn't expected to be aware of it,
hence the need for that use-case to work regardless of nesting.

> Maybe we could support that later by handling it before/after
> sleeping, if ever required?

Indeed, pause()/resume() could be used to allow functions that sleep to
be called with lazy MMU enabled. But that's only a hypothetical use-case
for now.

> Or am I missing something regarding your point on pause()/resume()?

Doesn't sound like it :) I'll remove that paragraph from the (already
long) commit message. Thanks!

- Kevin

