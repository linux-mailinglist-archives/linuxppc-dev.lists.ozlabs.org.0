Return-Path: <linuxppc-dev+bounces-13927-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 399BBC3FAB9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 12:14:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2xJt6kYDz3054;
	Fri,  7 Nov 2025 22:14:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762514046;
	cv=none; b=i58MP39TYCSw35lhGoEiIOG2YrTKh7nVGFuDyq+W9B5nlfFNWNwJxgE+3POvKaD3XTlVz0JmaHE2lXGzeypN/Wh2CvwTge/25nMCQ8Gwcd9IKgcwKXpXXI0LhXkz6rwvCN8ISmGnIKWXAyJy7NGfV/5Fx1edyXkuJ/NkF757MI24vWJQO18n5/PrdLlQbCSqAR6Cj8zjU+bQ52w9cZIb7C3m9Bo3ZYJKzSZyMv77EG8zFIs0kNy/cmhqLFviWoZFIhWnDj3M0v9WeF/aj6w5GGSGfJbAthDhh0sTdR4QSllT/A0G82/u7dH+oyDbDq8wxAxeTE0klqKhxwVpoxPfRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762514046; c=relaxed/relaxed;
	bh=eCjmppFrEkfW27at5Tw7hdbaaeCwkxbhpSbepynfi98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0D7Xkun8MOskOAXWO8YR9Cyv/oso3eyft/oMiS0g43uEZtIPRzl02mOCkNuM2KfMgPYimFgUto2bkJDiio2jUdnYpvu6HL6QFBtmkMrT0Espi+VAmRTajJuimK5cTBe7NxsqaR7L7CfzmU8QYQLblN6iBktB5L3XU/LeSNv/yw3CZ/t7wWXvqhFu6RWupWBT7j4aLKa9biJQk1ZZtndnRpfcXyzPeHotm9hFFtLYaBbQQ/d8kCYBuowbjwC9iTieb1C2Zlp5m5VSydYMUy/U6XMud+6E+n0HTFnZnBEkBdk+riQbA+nPsSL87PhOdL1nME0lCvU1xminBEMriw3Mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2xJs4Fj6z2yjm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 22:14:03 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 802C51477;
	Fri,  7 Nov 2025 03:13:24 -0800 (PST)
Received: from [10.1.36.52] (unknown [10.1.36.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21B713F63F;
	Fri,  7 Nov 2025 03:13:28 -0800 (PST)
Message-ID: <84dab8b1-ea28-4dcc-9721-9aaa6fcd12ba@arm.com>
Date: Fri, 7 Nov 2025 11:13:15 +0000
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
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
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
 <87ikfn3yvs.ritesh.list@gmail.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <87ikfn3yvs.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 06/11/2025 16:32, Ritesh Harjani (IBM) wrote:
> Alexander Gordeev <agordeev@linux.ibm.com> writes:
>
>> On Wed, Nov 05, 2025 at 02:19:03PM +0530, Ritesh Harjani wrote:
>>>> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
>>>> + * currently enabled.
>>>>   */
>>>>  #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>>>>  static inline void lazy_mmu_mode_enable(void)
>>>>  {
>>>> -	arch_enter_lazy_mmu_mode();
>>>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>>> +
>>>> +	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
>>>> +	/* enable() must not be called while paused */
>>>> +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
>>>> +
>>>> +	if (state->nesting_level++ == 0) {
>>>> +		state->active = true;
>>>> +		arch_enter_lazy_mmu_mode();
>>>> +	}
>>>>  }
>>> Some architectures disables preemption in their
>>> arch_enter_lazy_mmu_mode(). So shouldn't the state->active = true should
>>> happen after arch_enter_lazy_mmu_mode() has disabled preemption()? i.e.
>> Do you have some scenario in mind that could cause an issue?
>>
> No not really. But that's a deviation from what previous arch hooks were
> expecting. Although thinking this through - I don't have any usecase
> where this can be a problem.

Which arch hook expectations are you referring to?

> But let me re-visit some of the code paths on ppc64 lazy mmu... 
>
> Looking at the arch specific usecase I see we always do get_cpu_var()
> for accessing the per-cpu batch array which disables preemption before
> accessing the per-cpu structure.. This per-cpu structure is where we
> batch pte updates...

arch_enter() disables preemption so accesses to per-CPU variables
anywhere in the section shouldn't be an issue either way.

The bigger picture (regarding patch 9) is that what in_lazy_mmu_state()
returns is based on the current task's state (not a per-CPU variable),
and always false while in interrupt. As a result whether preemption is
disabled or not should make no difference, only program order matters.

- Kevin

> For e.g... 
>   
>     arch_enter_lazy_mmu_mode()
>         hpte_need_flush()
>             get_cpu_var()   // this takes care of preempt_disable() 
>             adds vpns to per-cpu batch[i]
>             put_cpu_var()   // 
>     arch_leave_lazy_mmu_mode()
>
>> IOW, what could go wrong if the process is scheduled to another
>> CPU before preempt_disable() is called?
> So from above - I don't think your sequence to update
>    state->active = true 
> before calling arch_enter hook should be a problem.
> Based on above this looks mostly ok to me.
>
> -ritesh

