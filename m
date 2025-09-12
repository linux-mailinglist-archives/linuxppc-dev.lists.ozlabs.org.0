Return-Path: <linuxppc-dev+bounces-12064-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EB5B543D5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 09:27:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNQwl2PzRz3clH;
	Fri, 12 Sep 2025 17:27:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757662023;
	cv=none; b=aOBGnSCXOIfZWFKprtmgDjwAxyM47pbkxgvVbFuil8hcrD/LQ6Xvv1aXLU0HXqGZ+6HDvwfo+fqRRBi1dXncIK71i/ENoM5wodYgaMy4O26JTj/uxa1RJIFKdhrOYtVAUCvQYuPOTYW/9HXNrytmJexUViZN461x+8lp3B1FY4yzR/IkENWYBrIqSnO5K/FeZr88JwKtIp74f/36IoW5Dm8YhC3AXnuE2HhOy780xbqeTpaiUxl946Lt+wqCjisaN/Q/pMEzRROb2PyrnvlzVldip9NaUQpRB9ITOB+QvzCBPHMKH+rw3WznDBv6V1sjdeMQWVzto/TgQZGkR0uqyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757662023; c=relaxed/relaxed;
	bh=jHtH5ew5HJ7wpnudtpflMQ+7ZEEIn9+nbCJ8h1BOfgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KH3aRFIC3TcbAnXr2ZDnnJ9G6J5XWDilAQ5idH9h6MASerffftTTfh2Om9FcywoCRz3m0MFXe7jr+maqQLv0rp5NBoSROpmtSw2AX+9zV0IfGm9Hz3uo6fOC0LXg3+H8vNqZvobVFHpIVdXe563rADyqy+YErJTPT2EQ9pr0hn8KMQJG0ZXIcUbXZSBy0VF2uaRoaBnyyorBfloCNMjmR/pjjEc8/LDQD1OJLH/Z9HhxNROb0lv6e0Uzx2SA0QYEeI6UDMRx5Y7Bj7utl2su5q1mrSt+3/VnfSQp/BS25KEeWkDXCPqB8RXizIQlaGiI543tDX0IPSyyjL2B/vEXxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNQwk0JHMz2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 17:27:00 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD76F16A3;
	Fri, 12 Sep 2025 00:26:19 -0700 (PDT)
Received: from [10.57.66.147] (unknown [10.57.66.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD1E03F63F;
	Fri, 12 Sep 2025 00:26:20 -0700 (PDT)
Message-ID: <15d01c8b-5475-442e-9df5-ca37b0d5dc04@arm.com>
Date: Fri, 12 Sep 2025 09:26:18 +0200
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
 <4b4971fd-0445-4d86-8f3a-6ba3d68d15b7@arm.com>
 <4aa28016-5678-4c66-8104-8dcc3fa2f5ce@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <4aa28016-5678-4c66-8104-8dcc3fa2f5ce@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/09/2025 20:14, David Hildenbrand wrote:
>>>> On the other hand, with a pagefault_disabled-like approach, there
>>>> is no
>>>> way to instruct call {3} to fully exit lazy_mmu regardless of the
>>>> nesting level.
>>>
>>> Sure there is, with a better API. See below. :)
>>
>> I meant while keeping the existing shape of the API but yes fair enough!
>
> Time to do it properly I guess :)

Yes, I think the discussions on that series have shown that we might as
well refactor it completely. Once and for all™!

>
> [...]
>
>>> Assume we store in the task_struct
>>>
>>> uint8_t lazy_mmu_enabled_count;
>>> bool lazy_mmu_paused;
>>
>> I didn't think of that approach! I can't immediately see any problem
>> with it, assuming we're fine with storing arch-specific context in
>> thread_struct (which seems to be the case as things stand).
>
> Right, just to complete the picture:
>
> a) We will have some CONFIG_ARCH_LAZY_MMU
>
> b) Without that config, all lazy_mmu_*() functions are a nop and no
> lazy_mmu_state is stored in task_struct 

Agreed on both counts (replacing __HAVE_ARCH_ENTER_LAZY_MMU_MODE).

>
> struct lazy_mmu_state {
>     uint8_t enabled_count;
>     bool paused;

Looking at the arm64 implementation, I'm thinking: instead of the paused
member, how about a PF_LAZY_MMU task flag? It would be set when lazy_mmu
is actually enabled (i.e. inside an enter()/leave() section, and not
inside a pause()/resume() section). This way, architectures could use
that flag directly to tell if lazy_mmu is enabled instead of reinventing
the wheel, all in slightly different ways. Namely:

* arm64 uses a thread flag (TIF_LAZY_MMU) - this is trivially replaced
with PF_LAZY_MMU
* powerpc and sparc use batch->active where batch is a per-CPU variable;
I expect this can also be replaced with PF_LAZY_MMU
* x86/xen is more complex as it has xen_lazy_mode which tracks both
LAZY_MMU and LAZY_CPU modes. I'd probably leave that one alone, unless a
Xen expert is motivated to refactor it.

With that approach, the implementation of arch_enter() and arch_leave()
becomes very simple (no tracking of lazy_mmu status) on arm64, powerpc
and sparc.

(Of course we could also have an "enabled" member in lazy_mmu_state
instead of PF_LAZY_MMU, there is no functional difference.)

> }
>
> c) With that config, common-code lazy_mmu_*() functions implement the
> updating of the lazy_mmu_state in task_struct and call into arch code
> on the transition from 0->1, 1->0 etc.

Indeed, this is how I thought about it. There is actually quite a lot
that can be moved to the generic functions:
* Updating lazy_mmu_state
* Sanity checks on lazy_mmu_state (e.g. underflow/overflow)
* Bailing out if in_interrupt() (not done consistently across arch's at
the moment)

>
> Maybe that can be done through exiting
> arch_enter_lazy_mmu_mode()/arch_leave_lazy_mmu_mode() callbacks, maybe
> we need more. I feel like
> we might be able to implement that through the existing helpers.

We might want to rename them to align with the new generic helpers, but
yes otherwise the principle should remain unchanged.

In fact, we will also need to revive arch_flush_lazy_mmu_mode(). Indeed,
in the nested situation, we need the following arch calls:

enter() -> arch_enter()
    enter() -> [nothing]
    leave() -> arch_flush()
leave() -> arch_leave()

leave() must always flush whatever arch state was batched, as may be
expected by the caller.

How does all that sound?

>
> [...]
>
>>
>> Overall what you're proposing seems sensible to me, the additional
>> fields in task_struct don't take much space and we can keep the API
>> unchanged in most cases. It is also good to have the option to check
>> that the API is used correctly. I'll reply to the cover letter to let
>> anyone who didn't follow this thread chip in, before I go ahead and try
>> out that new approach.
>
> And on top of the proposal above we will have some
>
> struct arch_lazy_mmu_state;
>
> define by the architecture (could be an empty struct on most).
>
> We can store that inside "struct lazy_mmu_state;" or if we ever have
> to, start returning only that from the enable/disable etc. functions.

I'm not sure we'd want to mix those styles (task_struct member + local
variable), that's adding complexity without much upside... Also having a
local variable at every nesting level only makes sense if we have an
arch callback regardless of nesting level, which is unnecessary in this
proposed API.

>
> For now, I'd say just store it in the task struct in the
> lazy_mmu_state. But we can always adjust later if required.
>
> In the first (this) series we probably don't even have to introduce
> arch_lazy_mmu_state. 

I suppose this could improve the overall struct layout - but otherwise I
don't really see the need compared to adding members to thread_struct
(which is fully arch-specific).

- Kevin

