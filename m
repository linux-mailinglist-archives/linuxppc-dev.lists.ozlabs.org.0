Return-Path: <linuxppc-dev+bounces-9042-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6753EAC92C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 17:56:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b87Bq677fz2xrL;
	Sat, 31 May 2025 01:56:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748620579;
	cv=none; b=JS3xNWs5kWxnc/rHASUZU5eQUJJrNdTZ3BdHcovC54LFYucOFz5vNsWjlPLKmdm1hdeMd7mUCBWgjq7/3SmkD1f3lDs4Clm33t5JCjHMYJ1yCA9RsBNYGu/kD5nTl0clXn9yhgnyjkaQZZmyPUOJozcKs1xy16zAfD0QKlqlGbDA/tYo80b0dp9aPt6f6jC35bRzfil/p1KnODHZ4DdfjZnG6hIb/Vk7h4a78T5jISlu5EUK9CVAfce3AddAywNf+9YAlvruuzOGeS1f8ow1gpdzYLFRL47yl3cezB3S3iGu2tPomNhmVmhIcqFGf/4gqdwpkenpkfF/5w0/fwOr9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748620579; c=relaxed/relaxed;
	bh=0eEDstHrNFu0qoS8kVeUD7NVAjoXrB5Nm7IQpXJUUqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MAEzaXieYKq0kqaCc3nnthPllKsB03hPpNN2tK5CW8Z+8A+cDiRkTbUVSCkkxt9RpX4dm1JjPgOG11pMBnBMN5UBYbzO3qPof4KrCZWMQMuprDyaz+haGEHThkJWb7Hu0gMpWSSUX/iD+HnuzLaacq82gSEW+bwhBXmtPjGsZXN7HHi40DoTHw3ILWBypGqJKxKGUuRsRQ1dlURwuyY1RDe+7+n1FcDTtPIsxz587tL4tCDTerOCX9/U7qKQ4FnSfWEu8W4G1F6sKk/CNMO+KLx3V0hJo1bQt8naDpu9ezybUlGVFE7ISp7izVE1hVSkNcqqBtdDazmiReOGUe+6cw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b87Bn3Jmbz2xpl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 May 2025 01:56:15 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09446169C;
	Fri, 30 May 2025 08:55:27 -0700 (PDT)
Received: from [10.57.95.14] (unknown [10.57.95.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF2053F673;
	Fri, 30 May 2025 08:55:37 -0700 (PDT)
Message-ID: <af9a96e1-064b-4627-bd34-e7e7e8a05452@arm.com>
Date: Fri, 30 May 2025 16:55:36 +0100
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
Subject: Re: [RFC PATCH v1 0/6] Lazy mmu mode fixes and improvements
Content-Language: en-GB
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Juergen Gross <jgross@suse.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 David Hildenbrand <david@redhat.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, virtualization@lists.linux.dev,
 xen-devel@lists.xenproject.org, linux-mm@kvack.org,
 Jann Horn <jannh@google.com>
References: <20250530140446.2387131-1-ryan.roberts@arm.com>
 <5b5d6352-9018-4658-b8fe-6eadaad46881@lucifer.local>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <5b5d6352-9018-4658-b8fe-6eadaad46881@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 30/05/2025 15:47, Lorenzo Stoakes wrote:
> +cc Jann who is a specialist in all things page table-y and especially scary
> edge cases :)
> 
> On Fri, May 30, 2025 at 03:04:38PM +0100, Ryan Roberts wrote:
>> Hi All,
>>
>> I recently added support for lazy mmu mode on arm64. The series is now in
>> Linus's tree so should be in v6.16-rc1. But during testing in linux-next we
>> found some ugly corners (unexpected nesting). I was able to fix those issues by
>> making the arm64 implementation more permissive (like the other arches). But
>> this is quite fragile IMHO. So I'd rather fix the root cause and ensure that
>> lazy mmu mode never nests, and more importantly, that code never makes pgtable
>> modifications expecting them to be immediate, not knowing that it's actually in
>> lazy mmu mode so the changes get deferred.
> 
> When you say fragile, are you confident it _works_ but perhaps not quite as well
> as you want? Or are you concerned this might be broken upstream in any way?

I'm confident that it _works_ for arm64 as it is, upstream. But if Dev's series
were to go in _without_ the lazy_mmu bracketting in some manner, then it would
be broken if the config includes CONFIG_DEBUG_PAGEALLOC.

There's a lot more explanation in the later patches as to how it can be broken,
but for arm64, the situation is currently like this, because our implementation
of __change_memory_common() uses apply_to_page_range() which implicitly starts
an inner lazy_mmu_mode. We enter multiple times, but we exit one the first call
to exit. Everything works correctly but it's not optimal because C is no longer
deferred:

arch_enter_lazy_mmu_mode()                        << outer lazy mmu region
  <do some pte changes (A)>
  alloc_pages()
    debug_pagealloc_map_pages()
      __kernel_map_pages()
        __change_memory_common()
          arch_enter_lazy_mmu_mode()              << inner lazy mmu region
            <change kernel pte to make valid (B)>
          arch_leave_lazy_mmu_mode()              << exit; complete A + B
    clear_page()
  <do some more pte changes (C)>                  << no longer in lazy mode
arch_leave_lazy_mmu_mode()                        << nop

An alternative implementation would not add the nested lazy mmu mode, so we end
up with this:

arch_enter_lazy_mmu_mode()                        << outer lazy mmu region
  <do some pte changes (A)>
  alloc_pages()
    debug_pagealloc_map_pages()
      __kernel_map_pages()
        __change_memory_common()
            <change kernel pte to make valid (B)> << deferred due to lazy mmu
    clear_page()                                  << BANG! B has not be actioned
  <do some more pte changes (C)>
arch_leave_lazy_mmu_mode()

This is clearly a much worse outcome. It's not happening today but it could in
future. That's why I'm claiming it's fragile. It's much better (IMHO) to
disallow calling the page allocator when in lazy mmu mode.

I won't speak for other arches; there may be more or less potential impact for them.

> 
> I am thinking specifically about the proposed use in Dev's new series [0] and
> obviously hoping (and assuming in fact) that it's the former :)

Dev's changes aren't directly related to this, but if a version was accepted
that didn't include the lazy mmu mode, that would cause non-obvious issues.

Hope that helps?

Thanks,
Ryan

> 
> [0]: https://lore.kernel.org/linux-mm/20250530090407.19237-1-dev.jain@arm.com/
> 
>>
>> The first 2 patches are unrelated, very obvious bug fixes. They don't affect
>> arm64 because arm64 only uses lazy mmu for kernel mappings. But I noticed them
>> during code review and think they should be fixed.
>>
>> The next 3 patches are aimed at solving the nesting issue.
>>
>> And the final patch is reverting the "permissive" fix I did for arm64, which is
>> no longer needed after the previous 3 patches.
>>
>> I've labelled this RFC for now because it depends on the arm64 lazy mmu patches
>> in Linus's master, so it won't apply to mm-unstable. But I'm keen to get review
>> and siince I'm touching various arches and modifying some core mm stuff, I
>> thought that might take a while so thought I'd beat the rush and get a first
>> version out early.
>>
>> I've build-tested all the affected arches. And I've run mm selftests for the
>> arm64 build, with no issues (with DEBUG_PAGEALLOC and KFENCE enabled).
>>
>> Applies against Linus's master branch (f66bc387efbe).
>>
>> Thanks,
>> Ryan
>>
>>
>> Ryan Roberts (6):
>>   fs/proc/task_mmu: Fix pte update and tlb maintenance ordering in
>>     pagemap_scan_pmd_entry()
>>   mm: Fix pte update and tlb maintenance ordering in
>>     migrate_vma_collect_pmd()
>>   mm: Avoid calling page allocator from apply_to_page_range()
>>   mm: Introduce arch_in_lazy_mmu_mode()
>>   mm: Avoid calling page allocator while in lazy mmu mode
>>   Revert "arm64/mm: Permit lazy_mmu_mode to be nested"
>>
>>  arch/arm64/include/asm/pgtable.h              | 22 ++++----
>>  .../include/asm/book3s/64/tlbflush-hash.h     | 15 ++++++
>>  arch/sparc/include/asm/tlbflush_64.h          |  1 +
>>  arch/sparc/mm/tlb.c                           | 12 +++++
>>  arch/x86/include/asm/paravirt.h               |  5 ++
>>  arch/x86/include/asm/paravirt_types.h         |  1 +
>>  arch/x86/kernel/paravirt.c                    |  6 +++
>>  arch/x86/xen/mmu_pv.c                         |  6 +++
>>  fs/proc/task_mmu.c                            |  3 +-
>>  include/asm-generic/tlb.h                     |  2 +
>>  include/linux/mm.h                            |  6 +++
>>  include/linux/pgtable.h                       |  1 +
>>  kernel/bpf/arena.c                            |  6 +--
>>  mm/kasan/shadow.c                             |  2 +-
>>  mm/memory.c                                   | 54 ++++++++++++++-----
>>  mm/migrate_device.c                           |  3 +-
>>  mm/mmu_gather.c                               | 15 ++++++
>>  17 files changed, 128 insertions(+), 32 deletions(-)
>>
>> --
>> 2.43.0
>>


