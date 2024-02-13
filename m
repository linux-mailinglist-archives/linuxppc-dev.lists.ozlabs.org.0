Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BFE853153
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 14:07:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ1nw0T0pz3vX1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 00:07:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ1nW3fRNz2xQL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 00:07:10 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 652A7DA7;
	Tue, 13 Feb 2024 05:07:20 -0800 (PST)
Received: from [10.1.36.184] (XHFQ2J9959.cambridge.arm.com [10.1.36.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93AE23F762;
	Tue, 13 Feb 2024 05:06:35 -0800 (PST)
Message-ID: <1d302d7a-50ab-4ab4-b049-75ed4a71a87d@arm.com>
Date: Tue, 13 Feb 2024 13:06:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/25] arm64/mm: Wire up PTE_CONT for user mappings
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, Mark Rutland <mark.rutland@arm.com>
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
 <20240202080756.1453939-20-ryan.roberts@arm.com>
 <ZcoIVypNwOPIX30w@FVFF77S0Q05N>
 <c899f252-dbf3-4e7b-8342-b5a5180486cd@arm.com>
 <aa232591-e0c8-422d-a641-fa555914c5f0@arm.com>
 <64395ae4-3a7d-45dd-8f1d-ea6b232829c5@arm.com>
 <d6ce951f-f83b-4a5a-a814-311f2d8b01e4@arm.com>
 <41499621-482f-455b-9f68-b43ea8052557@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <41499621-482f-455b-9f68-b43ea8052557@redhat.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13/02/2024 12:19, David Hildenbrand wrote:
> On 13.02.24 13:06, Ryan Roberts wrote:
>> On 12/02/2024 20:38, Ryan Roberts wrote:
>>> [...]
>>>
>>>>>>> +static inline bool mm_is_user(struct mm_struct *mm)
>>>>>>> +{
>>>>>>> +    /*
>>>>>>> +     * Don't attempt to apply the contig bit to kernel mappings, because
>>>>>>> +     * dynamically adding/removing the contig bit can cause page faults.
>>>>>>> +     * These racing faults are ok for user space, since they get serialized
>>>>>>> +     * on the PTL. But kernel mappings can't tolerate faults.
>>>>>>> +     */
>>>>>>> +    return mm != &init_mm;
>>>>>>> +}
>>>>>>
>>>>>> We also have the efi_mm as a non-user mm, though I don't think we manipulate
>>>>>> that while it is live, and I'm not sure if that needs any special handling.
>>>>>
>>>>> Well we never need this function in the hot (order-0 folio) path, so I think I
>>>>> could add a check for efi_mm here with performance implication. It's probably
>>>>> safest to explicitly exclude it? What do you think?
>>>>
>>>> Oops: This should have read "I think I could add a check for efi_mm here
>>>> *without* performance implication"
>>>
>>> It turns out that efi_mm is only defined when CONFIG_EFI is enabled. I can do
>>> this:
>>>
>>> return mm != &init_mm && (!IS_ENABLED(CONFIG_EFI) || mm != &efi_mm);
>>>
>>> Is that acceptable? This is my preference, but nothing else outside of efi
>>> references this symbol currently.
>>>
>>> Or perhaps I can convince myself that its safe to treat efi_mm like userspace.
>>> There are a couple of things that need to be garanteed for it to be safe:
>>>
>>>    - The PFNs of present ptes either need to have an associated struct page or
>>>      need to have the PTE_SPECIAL bit set (either pte_mkspecial() or
>>>      pte_mkdevmap())
>>>
>>>    - Live mappings must either be static (no changes that could cause
>>> fold/unfold
>>>      while live) or the system must be able to tolerate a temporary fault
>>>
>>> Mark suggests efi_mm is not manipulated while live, so that meets the latter
>>> requirement, but I'm not sure about the former?
>>
>> I've gone through all the efi code, and conclude that, as Mark suggests, the
>> mappings are indeed static. And additionally, the ptes are populated using only
>> the _private_ ptep API, so there is no issue here. As just discussed with Mark,
>> my prefereence is to not make any changes to code, and just add a comment
>> describing why efi_mm is safe.
>>
>> Details:
>>
>> * Registered with ptdump
>>      * ptep_get_lockless()
>> * efi_create_mapping -> create_pgd_mapping … -> init_pte:
>>      * __ptep_get()
>>      * __set_pte()
>> * efi_memattr_apply_permissions -> efi_set_mapping_permissions … ->
>> set_permissions
>>      * __ptep_get()
>>      * __set_pte()
> 
> Sound good. We could add some VM_WARN_ON if we ever get the efi_mm via the
> "official" APIs.

We could, but that would lead to the same linkage issue, which I'm trying to
avoid in the first place:

VM_WARN_ON(IS_ENABLED(CONFIG_EFI) && mm == efi_mm);

This creates new source code dependencies, which I would rather avoid if possible.

