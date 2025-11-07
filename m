Return-Path: <linuxppc-dev+bounces-13926-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9445FC3F5F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 11:17:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2w351zFGz3054;
	Fri,  7 Nov 2025 21:17:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762510625;
	cv=none; b=HawO/RolZzmvfoK7US2ih+RDq/uLMZe2MmuAnrCeAF7+q4+PmVxtoNUrCSIVTuaJV2CNLYs4niWxXypL0caiGck0a7D0LY5xUc9mn2Gm0kSlDyN3PjULHIah3OhWnDYQtBzBDT+obU2ILwbfpPWgVqXS3w8Ghs3kbZjiBbHde9jP/UEZBmUo3MQ7ersQMis6CG8HIqVa7uw7U6yIxIAb7AN7v8tWYCS/ldaSZs0ByEC2LyXEBUmyd4Hb41Pcf3Bt5bJNlpjGDvLpYHeMgaY6J9LjrS6u746v8hhwcIQQiyZ5zpHs1sv+qhRFS3rckYmQmHsdf9Vq0WqIP5PAT7nZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762510625; c=relaxed/relaxed;
	bh=WiC9ywZ2pGQE+sxxwQfRLPFc3pThbZLAIj2W54RHOeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K082j2At+EldszyYoTQzvVFAG1jcXORl/by45camDDbwdAIBt+cMfJGAbdXXzpqGu8DbLmPdlp8JccUmazINrQx98pJHGjmrDeSmllw08u02c5qLWo0h0oERECdvkUg/M2hh3UBByQgFXlhlY/gqfMYHYdAsx9oEb40v+CSnnNS84u1mwyGHlNVQ3IY3X0V8FWQOfyLngz6uv9Jcsos/mnqrNbtcEmeohHdT73w770kXCxIaaCTKOwGX5pd95x0tmvnl0eH30FaeTVO//N3ZBc9Tryr1ceQeOXIFTXiqEPAcFKy9WdsDJ0VJzEinddXoyWYRWps61eWV03u5aRdFRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2w340vhMz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 21:17:02 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B30531515;
	Fri,  7 Nov 2025 02:16:22 -0800 (PST)
Received: from [10.57.40.58] (unknown [10.57.40.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9F5E3F66E;
	Fri,  7 Nov 2025 02:16:17 -0800 (PST)
Message-ID: <9f749c3e-4f93-40c1-b5c6-74d2ead92d00@arm.com>
Date: Fri, 7 Nov 2025 10:16:12 +0000
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
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
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
 <48a4ecb5-3412-4d3f-9e43-535f8bee505f@arm.com>
 <d5435e75-036b-44a5-a989-722e13f94b3e-agordeev@linux.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <d5435e75-036b-44a5-a989-722e13f94b3e-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 06/11/2025 15:33, Alexander Gordeev wrote:
>> [...]
>>>>   static inline void lazy_mmu_mode_enable(void)
>>>>   {
>>>>  -	arch_enter_lazy_mmu_mode();
>>>>  +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>>>  +
>>>>  +	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
>>>>  +	/* enable() must not be called while paused */
>>>>  +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
>>>>  +
>>>>  +	if (state->nesting_level++ == 0) {
>>>>  +		arch_enter_lazy_mmu_mode();
>>>>  +		state->active = true;
>>>>  +	}
>>>>   }
>>>>
>>>> ... I think it make more sense to enable the state after the arch_**
>>>> call right.
>>> But then in_lazy_mmu_mode() would return false if called from
>>> arch_enter_lazy_mmu_mode(). Not big problem, but still..
>> The ordering of nesting_level/active was the way you expected in v3, but
>> the conclusion of the discussion with David H [1] is that it doesn't
>> really matter so I simplified the ordering in v4 - the arch hooks
>> shouldn't call in_lazy_mmu_mode() or inspect lazy_mmu_state.
>> arch_enter()/arch_leave() shouldn't need it anyway since they're called
>> once per outer section (not in nested sections). arch_flush() could
>> potentially do something different when nested, but that seems unlikely.
>>
>> - Kevin
>>
>> [1]
>> https://lore.kernel.org/all/af4414b6-617c-4dc8-bddc-3ea00d1f6f3b@redhat.com/
> I might be misunderstand this conversation, but it looked to me as a discussion
> about lazy_mmu_state::nesting_level value, not lazy_mmu_state::active.
>
> I do use in_lazy_mmu_mode() (lazy_mmu_state::active) check from the arch-
> callbacks. Here is the example (and likely the only case so far) where it hits:

Sorry I didn't mean arch callbacks in general, I meant the ones called
from lazy_mmu_mode_*, that is arch_*_lazy_mmu_mode.

Patch 8 also makes use of in_lazy_mmu_mode() in set_pte() et al. on arm64.

- Kevin

> static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
> 				      void *_data)
> {
> 	lazy_mmu_mode_pause();
> 	...
> 	if (likely(pte_none(ptep_get(ptep)))) {
>
> 		/* Here set_pte() checks whether we are in lazy_mmu mode */
> 		set_pte_at(&init_mm, addr, ptep, pte);	<--- calls set_pte()
> 		data->pages[index] = NULL;
> 	}
> 	...
> 	lazy_mmu_mode_resume();
> 	...
> }
>
> So without in_lazy_mmu_mode() check above the arch-specific set_pte()
> implementation enters a wrong branch, which ends up in:
>
> [  394.503134] Call Trace:
> [  394.503137]  [<00007fffe01333f4>] dump_stack_lvl+0xbc/0xf0 FWIW 
> [  394.503143]  [<00007fffe010298c>] vpanic+0x1cc/0x418 
> [  394.503149]  [<00007fffe0102c7a>] panic+0xa2/0xa8 
> [  394.503154]  [<00007fffe01e7a8a>] check_panic_on_warn+0x8a/0xb0 
> [  394.503160]  [<00007fffe082d122>] end_report+0x72/0x110 
> [  394.503166]  [<00007fffe082d3e6>] kasan_report+0xc6/0x100 
> [  394.503171]  [<00007fffe01b9556>] ipte_batch_ptep_get+0x146/0x150 
> [  394.503176]  [<00007fffe0830096>] kasan_populate_vmalloc_pte+0xe6/0x1e0 
> [  394.503183]  [<00007fffe0718050>] apply_to_pte_range+0x1a0/0x570 
> [  394.503189]  [<00007fffe07260fa>] __apply_to_page_range+0x3ca/0x8f0 
> [  394.503195]  [<00007fffe0726648>] apply_to_page_range+0x28/0x40 
> [  394.503201]  [<00007fffe082fe34>] __kasan_populate_vmalloc+0x324/0x340 
> [  394.503207]  [<00007fffe076954e>] alloc_vmap_area+0x31e/0xbf0 
> [  394.503213]  [<00007fffe0770106>] __get_vm_area_node+0x1a6/0x2d0 
> [  394.503218]  [<00007fffe07716fa>] __vmalloc_node_range_noprof+0xba/0x260 
> [  394.503224]  [<00007fffe0771970>] __vmalloc_node_noprof+0xd0/0x110 
> [  394.503229]  [<00007fffe0771a22>] vmalloc_noprof+0x32/0x40 
> [  394.503234]  [<00007fff604eaa42>] full_fit_alloc_test+0xb2/0x3e0 [test_vmalloc] 
> [  394.503241]  [<00007fff604eb478>] test_func+0x488/0x760 [test_vmalloc] 
> [  394.503247]  [<00007fffe025ad68>] kthread+0x368/0x630 
> [  394.503253]  [<00007fffe01391e0>] __ret_from_fork+0xd0/0x490 
> [  394.503259]  [<00007fffe24e468a>] ret_from_fork+0xa/0x30 
>
> I could have cached lazy_mmu_state::active as arch-specific data
> and check it, but then what is the point to have it generalized?
>
> Thanks!

