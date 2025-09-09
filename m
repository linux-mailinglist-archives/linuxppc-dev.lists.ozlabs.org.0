Return-Path: <linuxppc-dev+bounces-11967-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DE1B4FE92
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 16:02:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLlrl2TL0z3cc0;
	Wed, 10 Sep 2025 00:02:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757426567;
	cv=none; b=XS1XWV2iVStah6F7oKCHcPZA1cTTDKoQ9S8nUA9Cxix0OUUw9dvcEiKaNgrP7sFmJyvEqJqPIAWZV9e1bjyfjkvdwXIKw4C1OIwSkAYJnSe92w4ShEXqu6Y/6KM/rOHcAUMFKnAZbNR1oeJVKdCXCRkOO6CUu1yEBYpGlD+wp0KARZfOck6fY6P+00cnJdvZNAYhpNJS93DI7Eb8th5eolZ5GGO7/fTayzkGP6sK7RRdj9UVbz80w8upktXAoslhz7ifw10f6X0AdmAVjJQN6/hRtiuDFfNTbtcURZIwMM7sJh+d0fEweUAzmm1SvJ+56ASR52PtH3mMEmvYyi83oA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757426567; c=relaxed/relaxed;
	bh=4Pm1oH3Z6YWtUDcCjbOjmwYAPf58GDgib8EzmVbHOO8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RGVFpMlwcdPPYFGAtN7tm4b8xW72LAuTSr7MbRTqw3/PXX3igOv3+VQLkzlcIqX9ywsTefH+loWp4T+tNLd+HATIkCh1dRAL8Ia7l1poyBPQMgSmyr53SJ5mwXXWyz2FleVEpbl6tiMyEaCGSG4RzDOE6o/ZpcKWeQ65lc08cEXS5n/y13QDOq9xG7Q52McbMyManpwaeCrAWZUwvjxEovhpA3l061S8fABBk0+0wtaAxA013ke+5DMp19GOpRrjrNBg9LNi1fpYe2voNGL0Bfcy8OPgpOikMi07UzNiagn2qJHGupTZin0eurA+nYo53AD6DkzJMM9t9jJRuFh9gA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLlrk0KGHz3cZt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 00:02:45 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06A861424;
	Tue,  9 Sep 2025 07:02:06 -0700 (PDT)
Received: from [10.44.160.77] (e126510-lin.lund.arm.com [10.44.160.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAB473F66E;
	Tue,  9 Sep 2025 07:02:06 -0700 (PDT)
Message-ID: <5681b377-baa7-4cd4-8e23-7314d58a7b5b@arm.com>
Date: Tue, 9 Sep 2025 16:02:04 +0200
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
From: Kevin Brodsky <kevin.brodsky@arm.com>
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
 <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
 <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
 <2fecfae7-1140-4a23-a352-9fd339fcbae5-agordeev@linux.ibm.com>
 <e521b1f4-3f2b-48cd-9568-b9a4cf4c4830@redhat.com>
 <47ee1df7-1602-4200-af94-475f84ca8d80@arm.com>
Content-Language: en-GB
In-Reply-To: <47ee1df7-1602-4200-af94-475f84ca8d80@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 09/09/2025 15:49, Kevin Brodsky wrote:
> On 09/09/2025 13:54, David Hildenbrand wrote:
>> On 09.09.25 13:45, Alexander Gordeev wrote:
>>> On Tue, Sep 09, 2025 at 12:09:48PM +0200, David Hildenbrand wrote:
>>>> On 09.09.25 11:40, Alexander Gordeev wrote:
>>>>> On Tue, Sep 09, 2025 at 11:07:36AM +0200, David Hildenbrand wrote:
>>>>>> On 08.09.25 09:39, Kevin Brodsky wrote:
>>>>>>> arch_{enter,leave}_lazy_mmu_mode() currently have a stateless API
>>>>>>> (taking and returning no value). This is proving problematic in
>>>>>>> situations where leave() needs to restore some context back to its
>>>>>>> original state (before enter() was called). In particular, this
>>>>>>> makes it difficult to support the nesting of lazy_mmu sections -
>>>>>>> leave() does not know whether the matching enter() call occurred
>>>>>>> while lazy_mmu was already enabled, and whether to disable it or
>>>>>>> not.
>>>>>>>
>>>>>>> This patch gives all architectures the chance to store local state
>>>>>>> while inside a lazy_mmu section by making enter() return some value,
>>>>>>> storing it in a local variable, and having leave() take that value.
>>>>>>> That value is typed lazy_mmu_state_t - each architecture defining
>>>>>>> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is free to define it as it sees fit.
>>>>>>> For now we define it as int everywhere, which is sufficient to
>>>>>>> support nesting.
>>>>> ...
>>>>>>> {
>>>>>>> + lazy_mmu_state_t lazy_mmu_state;
>>>>>>> ...
>>>>>>> - arch_enter_lazy_mmu_mode();
>>>>>>> + lazy_mmu_state = arch_enter_lazy_mmu_mode();
>>>>>>> ...
>>>>>>> - arch_leave_lazy_mmu_mode();
>>>>>>> + arch_leave_lazy_mmu_mode(lazy_mmu_state);
>>>>>>> ...
>>>>>>> }
>>>>>>>
>>>>>>> * In a few cases (e.g. xen_flush_lazy_mmu()), a function knows that
>>>>>>>      lazy_mmu is already enabled, and it temporarily disables it by
>>>>>>>      calling leave() and then enter() again. Here we want to ensure
>>>>>>>      that any operation between the leave() and enter() calls is
>>>>>>>      completed immediately; for that reason we pass
>>>>>>> LAZY_MMU_DEFAULT to
>>>>>>>      leave() to fully disable lazy_mmu. enter() will then
>>>>>>> re-enable it
>>>>>>>      - this achieves the expected behaviour, whether nesting
>>>>>>> occurred
>>>>>>>      before that function was called or not.
>>>>>>>
>>>>>>> Note: it is difficult to provide a default definition of
>>>>>>> lazy_mmu_state_t for architectures implementing lazy_mmu, because
>>>>>>> that definition would need to be available in
>>>>>>> arch/x86/include/asm/paravirt_types.h and adding a new generic
>>>>>>>     #include there is very tricky due to the existing header soup.
>>>>>> Yeah, I was wondering about exactly that.
>>>>>>
>>>>>> In particular because LAZY_MMU_DEFAULT etc resides somewehere
>>>>>> compeltely
>>>>>> different.
>>>>>>
>>>>>> Which raises the question: is using a new type really of any
>>>>>> benefit here?
>>>>>>
>>>>>> Can't we just use an "enum lazy_mmu_state" and call it a day?
>>>>> I could envision something completely different for this type on s390,
>>>>> e.g. a pointer to a per-cpu structure. So I would really ask to stick
>>>>> with the current approach.
> This is indeed the motivation - let every arch do whatever it sees fit.
> lazy_mmu_state_t is basically an opaque type as far as generic code is
> concerned, which also means that this API change is the first and last
> one we need (famous last words, I know). 
>
> I mentioned in the cover letter that the pkeys-based page table
> protection series [1] would have an immediate use for lazy_mmu_state_t.
> In that proposal, any helper writing to pgtables needs to modify the
> pkey register and then restore it. To reduce the overhead, lazy_mmu is
> used to set the pkey register only once in enter(), and then restore it
> in leave() [2]. This currently relies on storing the original pkey
> register value in thread_struct, which is suboptimal and most
> importantly doesn't work if lazy_mmu sections nest. With this series, we
> could instead store the pkey register value in lazy_mmu_state_t
> (enlarging it to 64 bits or more).

Forgot the references, sorry...

[1]
https://lore.kernel.org/linux-hardening/20250815085512.2182322-1-kevin.brodsky@arm.com/
[2]
https://lore.kernel.org/linux-hardening/20250815085512.2182322-19-kevin.brodsky@arm.com/

> I also considered going further and making lazy_mmu_state_t a pointer as
> Alexander suggested - more complex to manage, but also a lot more flexible.
>
>>>> Would that integrate well with LAZY_MMU_DEFAULT etc?
>>> Hmm... I though the idea is to use LAZY_MMU_* by architectures that
>>> want to use it - at least that is how I read the description above.
>>>
>>> It is only kasan_populate|depopulate_vmalloc_pte() in generic code
>>> that do not follow this pattern, and it looks as a problem to me.
> This discussion also made me realise that this is problematic, as the
> LAZY_MMU_{DEFAULT,NESTED} macros were meant only for architectures'
> convenience, not for generic code (where lazy_mmu_state_t should ideally
> be an opaque type as mentioned above). It almost feels like the kasan
> case deserves a different API, because this is not how enter() and
> leave() are meant to be used. This would mean quite a bit of churn
> though, so maybe just introduce another arch-defined value to pass to
> leave() for such a situation - for instance,
> arch_leave_lazy_mmu_mode(LAZY_MMU_FLUSH)?
>
>> Yes, that's why I am asking.
>>
>> What kind of information (pointer to a per-cpu structure) would you
>> want to return, and would handling it similar to how
>> pagefault_disable()/pagefault_enable() e.g., using a variable in
>> "current" to track the nesting level avoid having s390x to do that?
> The pagefault_disabled approach works fine for simple use-cases, but it
> doesn't scale well. The space allocated in task_struct/thread_struct to
> track that state is wasted (unused) most of the time. Worse, it does not
> truly enable states to be nested: it allows the outermost section to
> store some state, but nested sections cannot allocate extra space. This
> is really what the stack is for.
>
> - Kevin

