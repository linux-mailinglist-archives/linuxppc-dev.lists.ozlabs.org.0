Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 457EE851830
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 16:35:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYT7L1gMKz3dTr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 02:35:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYT6y0pDsz2xgw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 02:35:21 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 600FDDA7;
	Mon, 12 Feb 2024 07:35:31 -0800 (PST)
Received: from [10.57.78.115] (unknown [10.57.78.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D37C3F766;
	Mon, 12 Feb 2024 07:34:45 -0800 (PST)
Message-ID: <abe814c9-71f3-4d7d-bdc8-9dd930d6f0b2@arm.com>
Date: Mon, 12 Feb 2024 15:34:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/25] arm64/mm: Wire up PTE_CONT for user mappings
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, Mark Rutland <mark.rutland@arm.com>
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
 <20240202080756.1453939-20-ryan.roberts@arm.com>
 <ZcoIVypNwOPIX30w@FVFF77S0Q05N>
 <c899f252-dbf3-4e7b-8342-b5a5180486cd@arm.com>
 <a91cfe1c-289e-4828-8cfc-be34eb69a71b@redhat.com>
 <502a3ea7-fd86-4314-8292-c7999eda92eb@arm.com>
 <427ba87a-7dd0-4f3e-861f-fe6946b7cd97@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <427ba87a-7dd0-4f3e-861f-fe6946b7cd97@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/02/2024 15:26, David Hildenbrand wrote:
> On 12.02.24 15:45, Ryan Roberts wrote:
>> On 12/02/2024 13:54, David Hildenbrand wrote:
>>>>> If so, I wonder if we could instead do that comparison modulo the access/dirty
>>>>> bits,
>>>>
>>>> I think that would work - but will need to think a bit more on it.
>>>>
>>>>> and leave ptep_get_lockless() only reading a single entry?
>>>>
>>>> I think we will need to do something a bit less fragile. ptep_get() does
>>>> collect
>>>> the access/dirty bits so its confusing if ptep_get_lockless() doesn't IMHO. So
>>>> we will likely want to rename the function and make its documentation explicit
>>>> that it does not return those bits.
>>>>
>>>> ptep_get_lockless_noyoungdirty()? yuk... Any ideas?
>>>>
>>>> Of course if I could convince you the current implementation is safe, I
>>>> might be
>>>> able to sidestep this optimization until a later date?
>>>
>>> As discussed (and pointed out abive), there might be quite some callsites where
>>> we don't really care about uptodate accessed/dirty bits -- where ptep_get() is
>>> used nowadays.
>>>
>>> One way to approach that I had in mind was having an explicit interface:
>>>
>>> ptep_get()
>>> ptep_get_uptodate()
>>> ptep_get_lockless()
>>> ptep_get_lockless_uptodate()
>>
>> Yes, I like the direction of this. I guess we anticipate that call sites
>> requiring the "_uptodate" variant will be the minority so it makes sense to use
>> the current names for the "_not_uptodate" variants? But to do a slow migration,
>> it might be better/safer to have the weaker variant use the new name - that
>> would allow us to downgrade one at a time?
> 
> Yes, I was primarily struggling with names. Likely it makes sense to either have
> two completely new function names, or use the new name only for the "faster but
> less precise" variant.
> 
>>
>>>
>>> Especially the last one might not be needed.
>> I've done a scan through the code and agree with Mark's original conclusions.
>> Additionally, huge_pte_alloc() (which isn't used for arm64) doesn't rely on
>> access/dirty info. So I think I could migrate everything to the weaker variant
>> fairly easily.
>>
>>>
>>> Futher, "uptodate" might not be the best choice because of PageUptodate() and
>>> friends. But it's better than "youngdirty"/"noyoungdirty" IMHO.
>>
>> Certainly agree with "noyoungdirty" being a horrible name. How about "_sync" /
>> "_nosync"?
> 
> I could live with
> 
> ptep_get_sync()
> ptep_get_nosync()
> 
> with proper documentation :)

but could you live with:

ptep_get()
ptep_get_nosync()
ptep_get_lockless_nosync()

?

So leave the "slower, more precise" version with the existing name.

> 
> I don't think we use "_sync" / "_nosync" in the context of pte operations yet.
> 
> Well, there seems to be "__arm_v7s_pte_sync" in iommu code, bit at least in core
> code nothing jumped at me.
> 

