Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F40851413
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 14:06:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYPqj06fKz3dfr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 00:06:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYPqF4VLzz3byl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 00:06:31 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B36FFDA7;
	Mon, 12 Feb 2024 05:06:38 -0800 (PST)
Received: from [10.57.78.115] (unknown [10.57.78.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B2263F7BD;
	Mon, 12 Feb 2024 05:05:53 -0800 (PST)
Message-ID: <1ef4c737-0926-424c-9698-794c23370b74@arm.com>
Date: Mon, 12 Feb 2024 13:05:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/25] arm64/mm: Split __flush_tlb_range() to elide
 trailing DSB
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, John Hubbard
 <jhubbard@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Barry Song <21cnbao@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Yang Shi <shy828301@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
 <20240202080756.1453939-19-ryan.roberts@arm.com>
 <9e1d793a-02c9-4dbb-a6d4-1e1c0c42638c@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <9e1d793a-02c9-4dbb-a6d4-1e1c0c42638c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-mm@kvack.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/02/2024 12:44, David Hildenbrand wrote:
> On 02.02.24 09:07, Ryan Roberts wrote:
>> Split __flush_tlb_range() into __flush_tlb_range_nosync() +
>> __flush_tlb_range(), in the same way as the existing flush_tlb_page()
>> arrangement. This allows calling __flush_tlb_range_nosync() to elide the
>> trailing DSB. Forthcoming "contpte" code will take advantage of this
>> when clearing the young bit from a contiguous range of ptes.
>>
>> Tested-by: John Hubbard <jhubbard@nvidia.com>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>   arch/arm64/include/asm/tlbflush.h | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/tlbflush.h
>> b/arch/arm64/include/asm/tlbflush.h
>> index 79e932a1bdf8..50a765917327 100644
>> --- a/arch/arm64/include/asm/tlbflush.h
>> +++ b/arch/arm64/include/asm/tlbflush.h
>> @@ -422,7 +422,7 @@ do {                                    \
>>   #define __flush_s2_tlb_range_op(op, start, pages, stride, tlb_level) \
>>       __flush_tlb_range_op(op, start, pages, stride, 0, tlb_level, false,
>> kvm_lpa2_is_enabled());
>>   -static inline void __flush_tlb_range(struct vm_area_struct *vma,
>> +static inline void __flush_tlb_range_nosync(struct vm_area_struct *vma,
>>                        unsigned long start, unsigned long end,
>>                        unsigned long stride, bool last_level,
>>                        int tlb_level)
>> @@ -456,10 +456,19 @@ static inline void __flush_tlb_range(struct
>> vm_area_struct *vma,
>>           __flush_tlb_range_op(vae1is, start, pages, stride, asid,
>>                        tlb_level, true, lpa2_is_enabled());
>>   -    dsb(ish);
>>       mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, start, end);
>>   }
>>   +static inline void __flush_tlb_range(struct vm_area_struct *vma,
>> +                     unsigned long start, unsigned long end,
>> +                     unsigned long stride, bool last_level,
>> +                     int tlb_level)
>> +{
>> +    __flush_tlb_range_nosync(vma, start, end, stride,
>> +                 last_level, tlb_level);
>> +    dsb(ish);
>> +}
>> +
>>   static inline void flush_tlb_range(struct vm_area_struct *vma,
>>                      unsigned long start, unsigned long end)
>>   {
> 
> You're now calling dsb() after mmu_notifier_arch_invalidate_secondary_tlbs().
> 
> 
> In flush_tlb_mm(), we have the order
> 
>     dsb(ish);   
>     mmu_notifier_arch_invalidate_secondary_tlbs()
> 
> In flush_tlb_page(), we have the effective order:
> 
>     mmu_notifier_arch_invalidate_secondary_tlbs()
>     dsb(ish);
> 
> In flush_tlb_range(), we used to have the order:
> 
>     dsb(ish);
>     mmu_notifier_arch_invalidate_secondary_tlbs();
> 
> 
> So I *suspect* having that DSB before
> mmu_notifier_arch_invalidate_secondary_tlbs() is fine. Hopefully, nothing in
> there relies on that placement.

Will spotted this against v3. My argument was that I was following the existing
pattern in flush_tlb_page(). Apparently that is not correct and needs changing,
but the conclusion was to leave my change as is for now, since it is consistent
and change them at a later date together.

https://lore.kernel.org/linux-arm-kernel/123a58b0-2ea6-4da3-9719-98ca55c8095e@arm.com/



> 
> Maybe wort spelling out in the patch description
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> 

Thanks!


