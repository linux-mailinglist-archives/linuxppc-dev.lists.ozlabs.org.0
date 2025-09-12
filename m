Return-Path: <linuxppc-dev+bounces-12095-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3078FB55348
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 17:26:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNdYY4dkKz3dLB;
	Sat, 13 Sep 2025 01:26:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757690769;
	cv=none; b=DlCl186jMFbYg03Uj6AnnPdqTJtzKLyDOprB+A/Gx0UMLNKXxpaxQWkBSYeGwrNXzmM/pnmzuVg/e4u2eP9jVeT9MTqxjAhUfhjFvJDy9xmkOJ7W7xvo0TvZUB/l1qS0cLTWByu8ZpnznDz/gRyv1pE454dpU9drQ+Gds6nBAbseoey5UZ/eIgkdDdXOS4ajIArDFAHe9Spf+AUucVOPXYRmMSls3Hz1BQO/KU/EOascNpxn1qNUNDL8F7yTY6TDN2cni6RZY/nYtGleAlGdVi0NmiHT2u8bpfzNoLY4PUKYb2nTszOh36j7jgTzQg2XOB+YdABa0ZGGfyCYQF1SaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757690769; c=relaxed/relaxed;
	bh=YaVFVuWtyKgp7Y3tlzPDyRgfcQER5D3c+vZ1/BrwHVY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=f1PZ8ZjXmvYEM+CQFncDXxJRvmTRrQnbt+fGeIwPTRm7WLr2P1Tz7Ntux3v150DBBtqsbR0jKpcuZKkG/wmryUA9Gybep4mwU1LqjZjoGgCf2cHBOvRmmkSOyj71FPeTYgdJsPpix3IQU45QZZykWdsRxwg10gaTj/1P9GkBadW7nic/ytlqjbhF1JRV6zQN03BKSigTD/JlwbxiK4ngXrcz+Tfj/Yq4KovFJtmCEu0xGUvv0r9GA5EdeBGeZcKYsqOQu8dnTLQ+nE1wOFzosYVh+Ym9hgL+zEoGI68n3YHOFldTov06rYNp7a+qXQjA6yJpPrd6EIk/tDGp7LTzAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNdYX4HsSz3dK5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 01:26:07 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E94328AC;
	Fri, 12 Sep 2025 08:25:28 -0700 (PDT)
Received: from [10.57.66.147] (unknown [10.57.66.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 301DA3F694;
	Fri, 12 Sep 2025 08:25:29 -0700 (PDT)
Message-ID: <338ef811-1dab-4c4e-bc5f-8ebd8cb68435@arm.com>
Date: Fri, 12 Sep 2025 17:25:27 +0200
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
From: Kevin Brodsky <kevin.brodsky@arm.com>
Subject: Re: [PATCH v2 0/7] Nesting support for lazy MMU mode
To: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
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
 <20250908191602.61160a7990b9ea418de758c7@linux-foundation.org>
 <d1b4ff2a-052f-4556-91ae-273962edbed0@redhat.com>
Content-Language: en-GB
In-Reply-To: <d1b4ff2a-052f-4556-91ae-273962edbed0@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 09/09/2025 11:21, David Hildenbrand wrote:
> On 09.09.25 04:16, Andrew Morton wrote:
>> On Mon,  8 Sep 2025 08:39:24 +0100 Kevin Brodsky
>> <kevin.brodsky@arm.com> wrote:
>>
>>> The main change enabling nesting is patch 2, following the approach
>>> suggested by Catalin Marinas [4]: have enter() return some state and
>>> the matching leave() take that state.
>>
>> This is so totally the correct way.  Thanks.
>
> Staring at this, I wonder if we could alternatively handle it like
> pagefault_disable()/pagefault_enable(), having something like
> current->lazy_mmu_enabled.
>
> We wouldn't have to worry about preemption in that case I guess
> (unless the arch has special requirements).
>
> Not sure if that was already discussed, just a thought. 

Based on the outcome of the discussion with David on patch 2 [1p], there
is indeed an alternative approach that we should seriously consider. In
summary:

* Keep the API stateless, handle nesting with a counter in task_struct
* Introduce new functions to temporarily disable lazy_mmu without
impacting nesting, track that with a bool in task_struct (addresses the
situation in mm/kasan/shadow.c and possibly some x86 cases too)
* Move as much handling from arch_* to generic functions

What the new generic infrastructure would look like:

struct task_struct {
    ...
#ifdef CONFIG_ARCH_LAZY_MMU
    struct {
        uint8_t count;
        bool enabled; /* or paused, see below */
    } lazy_mmu_state;
#endif
}

* lazy_mmu_mode_enable():
    if (!lazy_mmu_state.count) {
        arch_enter_lazy_mmu_mode();
        lazy_mmu_state.enabled = true;
    }
    lazy_mmu_state.count++;

* lazy_mmu_mode_disable():
    lazy_mmu_count--;
    if (!lazy_mmu_state.count) {
        lazy_mmu_state.enabled = false;
        arch_leave_lazy_mmu_mode();
    } else {
        arch_flush_lazy_mmu_mode();
    }

* lazy_mmu_mode_pause():
    lazy_mmu_state.enabled = false;
    arch_leave_lazy_mmu_mode();

* lazy_mmu_mode_resume();
    arch_enter_lazy_mmu_mode();
    lazy_mmu_state.enabled = true;

The generic enable()/disable() helpers are able to handle most of the
logic, leaving only truly arch-specific code to the arch callbacks:
* Updating lazy_mmu_state
* Sanity checks on lazy_mmu_state (e.g. count underflow/overflow,
pause()/resume() only called when count > 0, etc.)
* Bailing out if in_interrupt() (not done consistently across arch's at
the moment)

A further improvement is to make arch code check lazy_mmu_state.enabled
to determine whether lazy_mmu is enabled at any given point. At the
moment every arch uses a different mechanism, and this is an occasion to
make them converge.

The arch callback interface remains unchanged, and we are resurrecting
arch_flush_lazy_mmu_mode() to handle the nested disable() case (flushing
must happen when exiting a section regardless of nesting):

enable() -> arch_enter()
    enable() -> [nothing]
    disable() -> arch_flush()
disable() -> arch_leave()

Note: lazy_mmu_state.enabled (set whenever lazy_mmu is actually enabled)
could be replaced with lazy_mmu_state.paused (set inside a
pause()/resume() section). I believe this is equivalent but the former
is slightly more convenient for arch code - to be confirmed in practice.

Any thoughts on this? Unless there are concerns, I will move towards
that approach in v3.

- Kevin

[1p]
https://lore.kernel.org/all/4aa28016-5678-4c66-8104-8dcc3fa2f5ce@redhat.com/t/#u


