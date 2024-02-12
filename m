Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A29851EC7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 21:40:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYbtY2SHKz3dW8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 07:40:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYbt56Z3qz3bwJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 07:39:39 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56446DA7;
	Mon, 12 Feb 2024 12:39:47 -0800 (PST)
Received: from [10.57.78.115] (unknown [10.57.78.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C95403F766;
	Mon, 12 Feb 2024 12:39:00 -0800 (PST)
Message-ID: <64395ae4-3a7d-45dd-8f1d-ea6b232829c5@arm.com>
Date: Mon, 12 Feb 2024 20:38:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/25] arm64/mm: Wire up PTE_CONT for user mappings
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
 <20240202080756.1453939-20-ryan.roberts@arm.com>
 <ZcoIVypNwOPIX30w@FVFF77S0Q05N>
 <c899f252-dbf3-4e7b-8342-b5a5180486cd@arm.com>
 <aa232591-e0c8-422d-a641-fa555914c5f0@arm.com>
In-Reply-To: <aa232591-e0c8-422d-a641-fa555914c5f0@arm.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[...]

>>>> +static inline bool mm_is_user(struct mm_struct *mm)
>>>> +{
>>>> +	/*
>>>> +	 * Don't attempt to apply the contig bit to kernel mappings, because
>>>> +	 * dynamically adding/removing the contig bit can cause page faults.
>>>> +	 * These racing faults are ok for user space, since they get serialized
>>>> +	 * on the PTL. But kernel mappings can't tolerate faults.
>>>> +	 */
>>>> +	return mm != &init_mm;
>>>> +}
>>>
>>> We also have the efi_mm as a non-user mm, though I don't think we manipulate
>>> that while it is live, and I'm not sure if that needs any special handling.
>>
>> Well we never need this function in the hot (order-0 folio) path, so I think I
>> could add a check for efi_mm here with performance implication. It's probably
>> safest to explicitly exclude it? What do you think?
> 
> Oops: This should have read "I think I could add a check for efi_mm here
> *without* performance implication"

It turns out that efi_mm is only defined when CONFIG_EFI is enabled. I can do this:

return mm != &init_mm && (!IS_ENABLED(CONFIG_EFI) || mm != &efi_mm);

Is that acceptable? This is my preference, but nothing else outside of efi
references this symbol currently.

Or perhaps I can convince myself that its safe to treat efi_mm like userspace.
There are a couple of things that need to be garanteed for it to be safe:

  - The PFNs of present ptes either need to have an associated struct page or
    need to have the PTE_SPECIAL bit set (either pte_mkspecial() or
    pte_mkdevmap())

  - Live mappings must either be static (no changes that could cause fold/unfold
    while live) or the system must be able to tolerate a temporary fault

Mark suggests efi_mm is not manipulated while live, so that meets the latter
requirement, but I'm not sure about the former?

Thanks,
Ryan

