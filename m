Return-Path: <linuxppc-dev+bounces-13874-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8391C3A483
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:34:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2JT96Bpkz3bvd;
	Thu,  6 Nov 2025 21:34:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762425245;
	cv=none; b=lDr4enI7GTz6AvsVMsmgfhm2IBtYnMYJayb75wOXlBQaKdV8SgDxdb3z4RoOjD4gHfJjdL0pIEo86J2dIqyq+Lvm4aAyDdbDCdpAiMN/fgXdaTa7lkV3be8xnyCb6CarI8Noqw67H3OU7ZTU6mFBg9YOX4TUylUH3RFxBLN9P9WSuwLAvtX+YSIlIkeWUKjFgcdRxcONhzziI96lIUEPVJouEYl88X/q37g1BNnnHCEyurviZ5yBjQY3klSwe9lKLc8JcsTc4Ldxst8CUc08u7jV0067CmMIqBSVzOx33fpewvII/dGHTPqpHNg55g3oHcqc51ToF4oKSOkwimsoyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762425245; c=relaxed/relaxed;
	bh=fkZnWIFMTgMlEtlbQgLD0HsGvOLtVXBjP58onLTqVkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TSSAa8rjrgGv1UI6kgIffcF0Qs9BKm1squ1AlgcFA2HN0dBfuWtRQ4PhCmJmMUk0iRMDVYjXqkuaqxHPseqI/OCmgzO+INm/TmWuo5RpMgKJM6BX/olhhzMPsF+HKDJoUleOpi61yr2y9t318NUycbGASplN1eL3gyb4QBwbuj2BKFtETEDXfBNsQk4ws1eN469jVODawGffvR72CDyVS03dRe6N79PBaurS8ZkZepTavE66ucYetfA/sO1eR+rns9db5udW9z9VyrrcW/ZiYMhQvoxkHEjozbODt/4y4ycwf/Rfd2vFNNT8JlJBc0+/UbQcw9f53BsdFcqkwhVUxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2JT9044Xz3bfQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:34:04 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 260141596;
	Thu,  6 Nov 2025 02:33:26 -0800 (PST)
Received: from [10.1.34.75] (unknown [10.1.34.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9451F3F66E;
	Thu,  6 Nov 2025 02:33:26 -0800 (PST)
Message-ID: <1ac5be9f-fc05-463f-9512-74922acf8980@arm.com>
Date: Thu, 6 Nov 2025 10:33:24 +0000
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
Subject: Re: [PATCH v4 05/12] mm: introduce CONFIG_ARCH_HAS_LAZY_MMU_MODE
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
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
 <20251029100909.3381140-6-kevin.brodsky@arm.com>
 <87o6ph3xdq.ritesh.list@gmail.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <87o6ph3xdq.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 05/11/2025 04:40, Ritesh Harjani (IBM) wrote:
> Kevin Brodsky <kevin.brodsky@arm.com> writes:
>
>> Architectures currently opt in for implementing lazy_mmu helpers by
>> defining __HAVE_ARCH_ENTER_LAZY_MMU_MODE.
>>
>> In preparation for introducing a generic lazy_mmu layer that will
>> require storage in task_struct, let's switch to a cleaner approach:
>> instead of defining a macro, select a CONFIG option.
>>
>> This patch introduces CONFIG_ARCH_HAS_LAZY_MMU_MODE and has each
>> arch select it when it implements lazy_mmu helpers.
>> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is removed and <linux/pgtable.h>
>> relies on the new CONFIG instead.
>>
>> On x86, lazy_mmu helpers are only implemented if PARAVIRT_XXL is
>> selected. This creates some complications in arch/x86/boot/, because
>> a few files manually undefine PARAVIRT* options. As a result
>> <asm/paravirt.h> does not define the lazy_mmu helpers, but this
>> breaks the build as <linux/pgtable.h> only defines them if
>> !CONFIG_ARCH_HAS_LAZY_MMU_MODE. There does not seem to be a clean
>> way out of this - let's just undefine that new CONFIG too.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>  arch/arm64/Kconfig                                 | 1 +
>>  arch/arm64/include/asm/pgtable.h                   | 1 -
>>  arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 2 --
>>  arch/powerpc/platforms/Kconfig.cputype             | 1 +
>>  arch/sparc/Kconfig                                 | 1 +
>>  arch/sparc/include/asm/tlbflush_64.h               | 2 --
>>  arch/x86/Kconfig                                   | 1 +
>>  arch/x86/boot/compressed/misc.h                    | 1 +
>>  arch/x86/boot/startup/sme.c                        | 1 +
>>  arch/x86/include/asm/paravirt.h                    | 1 -
>>  include/linux/pgtable.h                            | 2 +-
>>  mm/Kconfig                                         | 3 +++
>>  12 files changed, 10 insertions(+), 7 deletions(-)
> Maybe we can add this to ... ?
>
> Documentation/features/vm/lazy_mmu/arch-support.txt
>
> #
> # Feature name:          lazy_mmu mode
> #         Kconfig:       ARCH_HAS_LAZY_MMU_MODE
> #         description:   arch supports arch_{enter|flush|leave}_lazy_mmu_mode()
> #
>     -----------------------
>     |         arch |status|
>     -----------------------
>     |       arm64: |  ok  |
>     |     powerpc: |  ok  |
>     |       sparc: |  ok  |
>     |         x86: |  ok  |
>     -----------------------

That's an interesting idea but I'm not sure it really makes sense for
lazy MMU? AFAIU these arch-support.txt files are meant to help identify
which generic features an arch has support for. Lazy MMU isn't really a
feature though, in the sense that what it does is entirely defined by
the arch. This patch does introduce a generic layer, but ultimately it
remains a collection of arch hooks.

> As for this patch, the changes are mostly straight forward around the
> configs part. This looks good to me. Please feel free to add: 
>
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Thanks for the review!

- Kevin

