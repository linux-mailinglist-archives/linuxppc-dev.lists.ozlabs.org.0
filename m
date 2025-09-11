Return-Path: <linuxppc-dev+bounces-12036-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD51FB538F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 18:20:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cN2pq4rDlz2yGx;
	Fri, 12 Sep 2025 02:20:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757607635;
	cv=none; b=hu7fZQ0JPljvqAg5CIuBiErkbwi5GWEMKWUttBuuN2TnUimMFOcmtCCYpkvk79TlA+B67RqmYiowo9kTrMe50TF9ALUek7fY52s44JeY36PIGlaFNtLFQjO0jLsiDDll7XvdFQHeinBU4FA3QPgpsFRit1Vu6OcRfYsQMlgHP6ZkZdstR7Bcj8goB+GaI/eCZfpdz6TRxSFGzBiyofkSd+qAFyyxAeFYHI/ez0Zx1hf9XA9R7Y7WYUoL9m5zBt2xXt+yTTrjx57Z4lJIqDKsfOd027MefC96809wfqVuaCWoZ16e0Cs9Y7fB68m38qj7eGXZ9QFiME7/+dcAo2IS6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757607635; c=relaxed/relaxed;
	bh=6qqjTYTrD/QqdRv64e17c4F7ZvmzcQ8jL1KviIELsb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hy4ITc+uFK217PNiu/+BBkfkplcCU/tplIqIi00EFMJMQdMFARBu4f4/4oK1G/JUFpNbQRBe0pXEcN/vYiws3mYYWPLEwRXSA0+Pwf3qUGHzxgCYmCZFK7QvOyEr5nKbxuwlyMyqH0j9tHpe87sewgRlGxwu2UUFUaI2hNPX/9DYZUSZWwkGvFcAWAhe9uihvps8yhFT2N2o0rPTUZd/BoBPrQ81k5C0O8VjtVlNrkBisyCs1YP8KuQ4+ysilbJvw64B5iUpzR69xVG3+E4cJixO06RT2+bdPkL5KO9PK+dih34noeO9eQePLV+7OpSsNUCLQHx+yvftkZ2EBptwsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cN2pp48vlz2xnn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 02:20:32 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DC0B153B;
	Thu, 11 Sep 2025 09:19:52 -0700 (PDT)
Received: from [10.57.70.14] (unknown [10.57.70.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9403F3F694;
	Thu, 11 Sep 2025 09:19:53 -0700 (PDT)
Message-ID: <4b4971fd-0445-4d86-8f3a-6ba3d68d15b7@arm.com>
Date: Thu, 11 Sep 2025 18:19:51 +0200
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
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: David Hildenbrand <david@redhat.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mark Rutland <Mark.Rutland@arm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
 <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
 <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
 <2fecfae7-1140-4a23-a352-9fd339fcbae5-agordeev@linux.ibm.com>
 <e521b1f4-3f2b-48cd-9568-b9a4cf4c4830@redhat.com>
 <47ee1df7-1602-4200-af94-475f84ca8d80@arm.com>
 <29383ee2-d6d6-4435-9052-d75a263a5c45@redhat.com>
 <9de08024-adfc-421b-8799-62653468cf63@arm.com>
 <ef343405-c394-4763-a79f-21381f217b6c@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <ef343405-c394-4763-a79f-21381f217b6c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 10/09/2025 17:37, David Hildenbrand wrote:
>>
>> Somewhat, but in the regular case where enter() is called followed by
>> leave() there is really no complexity for the caller, just an extra
>> local variable.
>>
>> There are complications where we want to exit lazy_mmu temporarily, as
>> in mm/kasan/shadow.c [1k], but this is in fact unavoidable. Chatting
>> with Mark Rutland, I realised that to truly support nested sections,
>> this must be handled in a special way in any case. To be clear, I am
>> referring to this situation:
>>
>> __kasan_populate_vmalloc:
>>      apply_to_page_range:
>>          arch_enter_lazy_mmu_mode() {1}
>>
>>          kasan_populate_vmalloc_pte:
>>              arch_leave_lazy_mmu_mode() {2}
>>              arch_enter_lazy_mmu_mode() {3}
>>
>>          arch_leave_lazy_mmu_mode() {4}
>>
>> With the approach this series takes, call {2} is made safe by passing a
>> special parameter (say LAZY_MMU_FLUSH) that forces lazy_mmu to be fully
>> exited - and call {3} will then re-enter lazy_mmu. This works regardless
>> of whether __kasan_populate_vmalloc() has been called with lazy_mmu
>> already enabled (i.e. calls {1} and {4} can be nested).
>>
>> On the other hand, with a pagefault_disabled-like approach, there is no
>> way to instruct call {3} to fully exit lazy_mmu regardless of the
>> nesting level.
>
> Sure there is, with a better API. See below. :) 

I meant while keeping the existing shape of the API but yes fair enough!

>
>>
>> It would be possible to make both approaches work by introducing a new
>> API, along the lines of:
>> - int arch_disable_save_lazy_mmu_mode() (the return value indicates the
>> nesting level)
>> - void arch_restore_lazy_mmu_mode(int state) (re-enter lazy_mmu at the
>> given nesting level)
>
> Yes, I think we really need a proper API.
>
>>
>> This is arguably more self-documenting than passing LAZY_MMU_FLUSH in
>> call {2}. This API is however no simpler when using a
>> pagefault_disabled-like approach (and less consistent than when always
>> saving state on the stack).
>
> Yes, a proper API is warranted. In particular, thinking about the
> following:
>
> arch_enter_lazy_mmu_mode() {1}
>     arch_enter_lazy_mmu_mode() {2}
>
>     kasan_populate_vmalloc_pte:
>         arch_leave_lazy_mmu_mode() {3}
>         arch_enter_lazy_mmu_mode() {4}
>
>     arch_leave_lazy_mmu_mode() {5}
> arch_leave_lazy_mmu_mode() {6}
>
>
> Imagine if we have the following API instead:
>
> lazy_mmu_enable() {1}
>     lazy_mmu_enable() {2}
>
>     kasan_populate_vmalloc_pte:
>         lazy_mmu_pause() {3}
>         lazy_mmu_continue() {4}
>
>     lazy_mmu_disable() {5}
> lazy_mmu_disable() {6}
>
>
> I think it is crucial that after lazy_mmu_save/lazy_mmu_restore, no
> more nesting must happen.

That makes sense to me - lazy_mmu should only be paused in very specific
situations and I don't see a justification for supporting nesting while
paused.

>
> Assume we store in the task_struct
>
> uint8_t lazy_mmu_enabled_count;
> bool lazy_mmu_paused;

I didn't think of that approach! I can't immediately see any problem
with it, assuming we're fine with storing arch-specific context in
thread_struct (which seems to be the case as things stand).

>
> We can do things like
>
> a) Sanity check that while we are paused that we get no more
> enable/disable requests
> b) Sanity check that while we are paused that we get no more pause
> requests.

These are good points - and this is only possible with such global
state. (Similarly we can check that the counter never underflows.)

>
> [...]
>
>>>
>>> If LAZY_MMU_DEFAULT etc. are not for common code, then please
>>> maintain them for the individual archs as well, just like you do
>>> with the
>>> opaque type.
>>
>> I see your point - having them defined in <linux/mm_types.h> could be
>> misleading. I just wanted to avoid all 4 architectures defining the same
>> macros. Maybe call them __LAZY_MMU_* to suggest they're not supposed to
>> be used in generic code?
>
> Maybe look into avoiding them completely :) Let's agree on the API
> first and then figure out how to pass the information we need to pass.
>
> [...]
>
>>> Worse, it does not
>>>> truly enable states to be nested: it allows the outermost section to
>>>> store some state, but nested sections cannot allocate extra space.
>>>> This
>>>> is really what the stack is for.
>>>
>>> If it's really just 8 bytes I don't really see the problem. So likely
>>> there is
>>> more to it?
>>
>> I suppose 8 extra bytes per task is acceptable, but some architectures
>> may want to add more state there.
>
> Just for reference: we currently perform an order-2 allocation,
> effectively leaving ~4KiB "unused".
>
> If there are any real such case on the horizon where we need to store
> significantly more (in which case storing it on the stack might
> probably also bad), please let me know.
>
>>
>> The one case that is truly problematic (though not required at this
>> point) is where each (nested) section needs to store its own state. With
>> this series it works just fine as there is a lazy_mmu_state_t for each
>> section, however if we use task_struct/thread_struct there can be only
>> one member shared by all nested sections.
>
> Do we have a use case for that on the horizon? If so, I fully agree,
> we have to store information per level. How/what information we have
> to store would be another question.

Not that I'm aware of, and all things considered it may not be so
likely: once lazy_mmu is enabled, entering nested sections isn't really
supposed to change any state.


Overall what you're proposing seems sensible to me, the additional
fields in task_struct don't take much space and we can keep the API
unchanged in most cases. It is also good to have the option to check
that the API is used correctly. I'll reply to the cover letter to let
anyone who didn't follow this thread chip in, before I go ahead and try
out that new approach.

- Kevin

