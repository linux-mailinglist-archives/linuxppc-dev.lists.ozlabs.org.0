Return-Path: <linuxppc-dev+bounces-13275-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1214EC06B48
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 16:33:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctQPK1hjnz3bjb;
	Sat, 25 Oct 2025 01:33:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761316405;
	cv=none; b=ashYuhAVDZXQWtx14lgirrGkvzrfSI5+KIY1+1geN+ji93aNUwdjUt+Q+vxBvbWBw8XYcS96NnzwDrMtiXQbpBxaNaQOSuR5KDbGVtAmeCkmFi3O9mIc1y3SwGRgof3hzM/Y6qqEmR8pSLhYOwbE2s0hZ7QXJZjMvhLJskHPnUnUAIY4kCHfELTkF8HSVFHa+ZxAhDgSWIHilBPRqh2W6ZFOgtnxWoZbxp7lN40X/cD9tfRK2nZp2QFkRiRMKCSSjYk/t/pk0oLCXpahdld9WCFQX8eDivBy3V7rcohC4K/vv2LjQkr8wH4nMLEl8iNFJzsKs3a2MXULxRx+ApdTIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761316405; c=relaxed/relaxed;
	bh=fj3ap4gb/dH/jt4Kw1Iocq3iQjPpRmaLvXvbN2t9MVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TTd6WnaigVCCMoHxieGHhsrZghYGYeaHhBtORosv6mLsqL5qtAqenyZdAxdOcxV/Shwf4Z2ooX0fomOJCyQELitKjWjJ6Aw+2o4jLfMt/uIENfpzomUqXLwnx8G8YMsOM///nV4x7ZtcwDFK3vqrZQ0/mtTYWqYKFUp6MI2thZg/gpGhHoVSA70Vnfaz+TyGs6Ty/+aS1YhQyT5reYXC69G0KYq8PS55zaGsUvVXog0xQe3DRKmBgVwDR8au8iwaJxftcMBotqAtMVvXvJLkyh177VY5odOXQCeGxhqQNctX9wUKUuCKh7DjJvVQ64wQl9X5kxZ1jCBeFyJbbs1e1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctQPH6wPVz30N8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 01:33:22 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDD53175A;
	Fri, 24 Oct 2025 07:32:41 -0700 (PDT)
Received: from [10.44.160.74] (e126510-lin.lund.arm.com [10.44.160.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F9233F66E;
	Fri, 24 Oct 2025 07:32:42 -0700 (PDT)
Message-ID: <28bf77c0-3aa9-4c41-aa2b-368321355dbb@arm.com>
Date: Fri, 24 Oct 2025 16:32:39 +0200
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
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <f8d22ae0-4e36-4537-903f-28164c850fdb@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 24/10/2025 15:27, David Hildenbrand wrote:
> On 24.10.25 14:13, Kevin Brodsky wrote:
>> On 23/10/2025 21:52, David Hildenbrand wrote:
>>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>>> [...]
>>>>
>>>> * madvise_*_pte_range() call arch_leave() in multiple paths, some
>>>>     followed by an immediate exit/rescheduling and some followed by a
>>>>     conditional exit. These functions assume that they are called
>>>>     with lazy MMU disabled and we cannot simply use pause()/resume()
>>>>     to address that. This patch leaves the situation unchanged by
>>>>     calling enable()/disable() in all cases.
>>>
>>> I'm confused, the function simply does
>>>
>>> (a) enables lazy mmu
>>> (b) does something on the page table
>>> (c) disables lazy mmu
>>> (d) does something expensive (split folio -> take sleepable locks,
>>>      flushes tlb)
>>> (e) go to (a)
>>
>> That step is conditional: we exit right away if pte_offset_map_lock()
>> fails. The fundamental issue is that pause() must always be matched with
>> resume(), but as those functions look today there is no situation where
>> a pause() would always be matched with a resume().
>
> We have matches enable/disable, so my question is rather "why" you are
> even thinking about using pause/resume?
>
> What would be the benefit of that? If there is no benefit then just
> drop this from the patch description as it's more confusing than just
> ... doing what the existing code does :)

Ah sorry I misunderstood, I guess you originally meant: why would we use
pause()/resume()?

The issue is the one I mentioned in the commit message: using
enable()/disable(), we assume that the functions are called with lazy
MMU mode is disabled. Consider:

  lazy_mmu_mode_enable()
  madvise_cold_or_pageout_pte_range():
    lazy_mmu_mode_enable()
    ...
    if (need_resched()) {
      lazy_mmu_mode_disable()
      cond_resched() // lazy MMU still enabled
    }

This will explode on architectures that do not allow sleeping while in
lazy MMU mode. I'm not saying this is an actual problem - I don't see
why those functions would be called with lazy MMU mode enabled. But it
does go against the notion that nesting works everywhere.

>
>>>
>>> Why would we use enable/disable instead?
>>>
>>>>
>>>> * x86/Xen is currently the only case where explicit handling is
>>>>     required for lazy MMU when context-switching. This is purely an
>>>>     implementation detail and using the generic lazy_mmu_mode_*
>>>>     functions would cause trouble when nesting support is introduced,
>>>>     because the generic functions must be called from the current
>>>> task.
>>>>     For that reason we still use arch_leave() and arch_enter() there.
>>>
>>> How does this interact with patch #11?
>>
>> It is a requirement for patch 11, in fact. If we called disable() when
>> switching out a task, then lazy_mmu_state.enabled would (most likely) be
>> false when scheduling it again.
>>
>> By calling the arch_* helpers when context-switching, we ensure
>> lazy_mmu_state remains unchanged. This is consistent with what happens
>> on all other architectures (which don't do anything about lazy_mmu when
>> context-switching). lazy_mmu_state is the lazy MMU status *when the task
>> is scheduled*, and should be preserved on a context-switch.
>
> Okay, thanks for clarifying. That whole XEN stuff here is rather horrible.

Can't say I disagree... I tried to simplify it further, but the
Xen-specific "LAZY_CPU" mode makes it just too difficult.

>
>>
>>>
>>>>
>>>> Note: x86 calls arch_flush_lazy_mmu_mode() unconditionally in a few
>>>> places, but only defines it if PARAVIRT_XXL is selected, and we are
>>>> removing the fallback in <linux/pgtable.h>. Add a new fallback
>>>> definition to <asm/pgtable.h> to keep things building.
>>>
>>> I can see a call in __kernel_map_pages() and
>>> arch_kmap_local_post_map()/arch_kmap_local_post_unmap().
>>>
>>> I guess that is ... harmless/irrelevant in the context of this series?
>>
>> It should be. arch_flush_lazy_mmu_mode() was only used by x86 before
>> this series; we're adding new calls to it from the generic layer, but
>> existing x86 calls shouldn't be affected.
>
> Okay, I'd like to understand the rules when arch_flush_lazy_mmu_mode()
> would actually be required in such arch code, but that's outside of
> the scope of your patch series. 

Not too sure either. A little archaeology shows that the calls were
added by [1][2]. Chances are [1] is no longer relevant since lazy_mmu
isn't directly used in copy_page_range(). 

I think [2] is still required - __kernel_map_pages() can be called while
lazy MMU is already enabled, and AIUI the mapping changes should take
effect by the time __kernel_map_pages() returns. On arm64 we shouldn't
have this problem by virtue of __kernel_map_pages() using lazy_mmu
itself, meaning that the nested call to disable() will trigger a flush.
(This case is in fact the original motivation for supporting nesting.)

- Kevin

[1]
https://lore.kernel.org/all/1319573279-13867-2-git-send-email-konrad.wilk@oracle.com/
[2]
https://lore.kernel.org/all/1365703192-2089-1-git-send-email-boris.ostrovsky@oracle.com/


