Return-Path: <linuxppc-dev+bounces-9046-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E16DAC93DC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 18:46:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b88JR1nN5z2xHv;
	Sat, 31 May 2025 02:46:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748623573;
	cv=none; b=CBd2Ve3lXdY4YccJSoNb2WOBJTyCmMfgipb+DGftOEe7WBFWNDrPPMI053ef7Cv6/b/zWdZgr3t2wVZDxpTz/UhTvFDgBaGTfe8NbHGJCeeUwXWPINPNfLRnNdBzqBAM0a8Qrf51R5Ij/ZsNi9ocKlOcYl7vCo2pXd17Px9hggqD3qbpUujBSxNHlf4tM78iI5RYnKmiTkzJmMaLMroPEgp3amQP9LJiqBpaqW0IjtmohnkpMxz5nLvA5pQW3qDB9MeAfxVVhTnepvlj0dkHt92uKJK97Fx6wV0GT7lw6HUGu52NQ6QFCg1o71Rn6jnC2FF0jBBvXHiARGqhmQQV4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748623573; c=relaxed/relaxed;
	bh=kHajGx30uWF0TTRuggGVT6JTMMDrZNq6YUbQoVq8GPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Woh4L+ckelR9xHJPFKRlG+jW9HKTD+d2oEnSBQ8d+iR5Uux6TV8sVv0JgK0Fg3taLtlilASlAmzRoR/5yuSgZopYYp6epGYlcAoD4TDI8sFmI2cs0gxZ8hFHNAR9pon1H9gmbjNomsEHzobzzQcRAQXS5BgXiIwPdNaOa01q4aJa99U5fLr6ohY9gS8nO7GWGGSY3Ol/E55M7QiO3Mggy+PgORM7aam0Kq3KXLdM1ChtXq9HFOSGvjNoH49iqbbJ0AxDbV5TXElgnraoLhBX9Cb/JNXtfQ2Ybn0AG6iOw6f+orSs+zoobcZ8wYakY8VUZPxPw+Q711Cg+n2l0rE5Bw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b88JL6c92z2x9N
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 May 2025 02:46:10 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 366C71692;
	Fri, 30 May 2025 09:45:22 -0700 (PDT)
Received: from [10.57.95.14] (unknown [10.57.95.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC2B43F673;
	Fri, 30 May 2025 09:45:32 -0700 (PDT)
Message-ID: <d183b3ff-ab61-4dc4-98c8-7ab9c1f6a4aa@arm.com>
Date: Fri, 30 May 2025 17:45:31 +0100
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
Subject: Re: [RFC PATCH v1 1/6] fs/proc/task_mmu: Fix pte update and tlb
 maintenance ordering in pagemap_scan_pmd_entry()
Content-Language: en-GB
To: Jann Horn <jannh@google.com>
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
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, virtualization@lists.linux.dev,
 xen-devel@lists.xenproject.org, linux-mm@kvack.org,
 Andy Lutomirski <luto@kernel.org>
References: <20250530140446.2387131-1-ryan.roberts@arm.com>
 <20250530140446.2387131-2-ryan.roberts@arm.com>
 <CAG48ez2k6ZmM-335EQjXeL6OtKzuOjVPWQDuJ75ww9Z6NMeg5w@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAG48ez2k6ZmM-335EQjXeL6OtKzuOjVPWQDuJ75ww9Z6NMeg5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 30/05/2025 17:26, Jann Horn wrote:
> On Fri, May 30, 2025 at 4:04 PM Ryan Roberts <ryan.roberts@arm.com> wrote:
>> pagemap_scan_pmd_entry() was previously modifying ptes while in lazy mmu
>> mode, then performing tlb maintenance for the modified ptes, then
>> leaving lazy mmu mode. But any pte modifications during lazy mmu mode
>> may be deferred until arch_leave_lazy_mmu_mode(), inverting the required
>> ordering between pte modificaiton and tlb maintenance.
>>
>> Let's fix that by leaving mmu mode, forcing all the pte updates to be
>> actioned, before doing the tlb maintenance.
>>
>> This is a theorectical bug discovered during code review.
>>
>> Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs")
> 
> Hmm... isn't lazy mmu mode supposed to also delay TLB flushes, and
> preserve the ordering of PTE modifications and TLB flushes?
> 
> Looking at the existing implementations of lazy MMU:
> 
>  - In Xen PV implementation of lazy MMU, I see that TLB flush
> hypercalls are delayed as well (xen_flush_tlb(),
> xen_flush_tlb_one_user() and xen_flush_tlb_multi() all use
> xen_mc_issue(XEN_LAZY_MMU) which delays issuing if lazymmu is active).
>  - The sparc version also seems to delay TLB flushes, and sparc's
> arch_leave_lazy_mmu_mode() seems to do TLB flushes via
> flush_tlb_pending() if necessary.
>  - powerpc's arch_leave_lazy_mmu_mode() also seems to do TLB flushes.
> 
> Am I missing something?

I doubt it. I suspect this was just my misunderstanding then. I hadn't
appreciated that lazy mmu is also guarranteed to maintain flush ordering; it's
chronically under-documented. Sorry for the noise here. On that basis, I expect
the first 2 patches can definitely be dropped.

> 
> If arm64 requires different semantics compared to all existing
> implementations and doesn't delay TLB flushes for lazy mmu mode, I
> think the "Fixes" tag should point to your addition of lazy mmu
> support for arm64.

arm64 doesn't require different semantics. arm64 is using lazy mmu in a very
limited manner and it can already tolerate the current code.

I just spotted this during code review and was trying to be a good citizen.
Thanks for setting me straight!

Thanks,
Ryan

> 
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  fs/proc/task_mmu.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
>> index 994cde10e3f4..361f3ffd9a0c 100644
>> --- a/fs/proc/task_mmu.c
>> +++ b/fs/proc/task_mmu.c
>> @@ -2557,10 +2557,9 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
>>         }
>>
>>  flush_and_return:
>> +       arch_leave_lazy_mmu_mode();
>>         if (flush_end)
>>                 flush_tlb_range(vma, start, addr);
>> -
>> -       arch_leave_lazy_mmu_mode();
> 
> I think this ordering was probably intentional, because doing it this
> way around allows Xen PV to avoid one more hypercall, because the TLB
> flush can be batched together with the page table changes?
> 
> 
>>         pte_unmap_unlock(start_pte, ptl);
>>
>>         cond_resched();
>> --
>> 2.43.0
>>


