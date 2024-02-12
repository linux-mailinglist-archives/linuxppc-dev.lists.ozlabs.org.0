Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2298516AF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 15:12:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYRGk1sHKz3ddR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 01:11:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYRGJ4zf8z2y1Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 01:11:34 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16DF8DA7;
	Mon, 12 Feb 2024 06:11:43 -0800 (PST)
Received: from [10.57.78.115] (unknown [10.57.78.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A1673F7BD;
	Mon, 12 Feb 2024 06:10:57 -0800 (PST)
Message-ID: <cdf4e537-5b0d-45ba-8094-527127c791a6@arm.com>
Date: Mon, 12 Feb 2024 14:10:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/25] mm: Make pte_next_pfn() a wrapper around
 pte_advance_pfn()
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
 <20240202080756.1453939-4-ryan.roberts@arm.com>
 <c269c2e0-afca-4ff0-8ffd-9049fb52c905@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <c269c2e0-afca-4ff0-8ffd-9049fb52c905@redhat.com>
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

On 12/02/2024 12:14, David Hildenbrand wrote:
> On 02.02.24 09:07, Ryan Roberts wrote:
>> The goal is to be able to advance a PTE by an arbitrary number of PFNs.
>> So introduce a new API that takes a nr param.
>>
>> We are going to remove pte_next_pfn() and replace it with
>> pte_advance_pfn(). As a first step, implement pte_next_pfn() as a
>> wrapper around pte_advance_pfn() so that we can incrementally switch the
>> architectures over. Once all arches are moved over, we will change all
>> the core-mm callers to call pte_advance_pfn() directly and remove the
>> wrapper.
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>   include/linux/pgtable.h | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index 5e7eaf8f2b97..815d92dcb96b 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -214,9 +214,15 @@ static inline int pmd_dirty(pmd_t pmd)
>>       #ifndef pte_next_pfn
>> +#ifndef pte_advance_pfn
>> +static inline pte_t pte_advance_pfn(pte_t pte, unsigned long nr)
>> +{
>> +    return __pte(pte_val(pte) + (nr << PFN_PTE_SHIFT));
>> +}
>> +#endif
>>   static inline pte_t pte_next_pfn(pte_t pte)
>>   {
>> -    return __pte(pte_val(pte) + (1UL << PFN_PTE_SHIFT));
>> +    return pte_advance_pfn(pte, 1);
>>   }
>>   #endif
>>   
> 
> I do wonder if we simply want to leave pte_next_pfn() around? Especially patch
> #4, #6 don't really benefit from the change? So are the other set_ptes()
> implementations.
> 
> That is, only convert all pte_next_pfn()->pte_advance_pfn(), and leave a
> pte_next_pfn() macro in place.
> 
> Any downsides to that? 

The downside is just having multiple functions that effectively do the same
thing. Personally I think its cleaner and easier to understand the code with
just one generic function which we pass 1 to it where we only want to advance by
1. In the end, there are only a couple of places where pte_advance_pfn(1) is
used, so doesn't really seem valuable to me to maintain a specialization.

Unless you feel strongly that we need to keep pte_next_pfn() then I'd prefer to
leave it as I've done in this series.

> This patch here would become:
> 
> #ifndef pte_advance_pfn
> static inline pte_t pte_advance_pfn(pte_t pte, unsigned long nr)
> {
>     return __pte(pte_val(pte) + (nr << PFN_PTE_SHIFT));
> }
> #endif
> 
> #ifndef pte_next_pfn
> #define pte_next_pfn(pte) pte_advance_pfn(pte, 1)
> #endif
> 
> As you convert the three arches, make them define pte_advance_pfn and udnefine
> pte_next_pfn. in the end, you can drop the #ifdef around pte_next_pfn here.
> 

