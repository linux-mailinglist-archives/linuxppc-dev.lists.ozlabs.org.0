Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F1A8532F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 15:22:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ3S44j27z3vXs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 01:22:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ3Rb3Gqnz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 01:21:44 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 355E0DA7;
	Tue, 13 Feb 2024 06:21:53 -0800 (PST)
Received: from [10.1.36.184] (XHFQ2J9959.cambridge.arm.com [10.1.36.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BF583F762;
	Tue, 13 Feb 2024 06:21:08 -0800 (PST)
Message-ID: <ed91f6c5-1ed2-4fb3-b5a4-0a720721e3f6@arm.com>
Date: Tue, 13 Feb 2024 14:21:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/25] arm64/mm: Wire up PTE_CONT for user mappings
Content-Language: en-GB
To: Ard Biesheuvel <ardb@kernel.org>, David Hildenbrand <david@redhat.com>
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
 <20240202080756.1453939-20-ryan.roberts@arm.com>
 <ZcoIVypNwOPIX30w@FVFF77S0Q05N>
 <c899f252-dbf3-4e7b-8342-b5a5180486cd@arm.com>
 <aa232591-e0c8-422d-a641-fa555914c5f0@arm.com>
 <64395ae4-3a7d-45dd-8f1d-ea6b232829c5@arm.com>
 <d6ce951f-f83b-4a5a-a814-311f2d8b01e4@arm.com>
 <41499621-482f-455b-9f68-b43ea8052557@redhat.com>
 <1d302d7a-50ab-4ab4-b049-75ed4a71a87d@arm.com>
 <99e2a92c-f2a2-4e1e-8ce2-08caae2cb7e4@redhat.com>
 <dce5f80d-942f-439c-a549-5290666464ca@arm.com>
 <CAMj1kXEVf1m4hVXORc6t9ytAOb75KZLcW-OJ6999VaKbkVdQ3A@mail.gmail.com>
 <64b872bd-4b12-4dbd-b043-1ad11aeaa19a@redhat.com>
 <3de2130b-9f0f-4a11-ac06-7bf814de641c@arm.com>
 <f93e5552-5e46-4f49-918a-21b63156eb32@redhat.com>
 <CAMj1kXEK6wiHkO9sJ5h6D3L88dR=2UndEqGeQjv=TftZ3PnN9w@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAMj1kXEK6wiHkO9sJ5h6D3L88dR=2UndEqGeQjv=TftZ3PnN9w@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13/02/2024 14:08, Ard Biesheuvel wrote:
> On Tue, 13 Feb 2024 at 15:05, David Hildenbrand <david@redhat.com> wrote:
>>
>> On 13.02.24 15:02, Ryan Roberts wrote:
>>> On 13/02/2024 13:45, David Hildenbrand wrote:
>>>> On 13.02.24 14:33, Ard Biesheuvel wrote:
>>>>> On Tue, 13 Feb 2024 at 14:21, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>>>>
>>>>>> On 13/02/2024 13:13, David Hildenbrand wrote:
> ...
>>>>>>> Just a thought, you could have a is_efi_mm() function that abstracts all that.
>>>>>>>
>>>>>>> diff --git a/include/linux/efi.h b/include/linux/efi.h
>>>>>>> index c74f47711f0b..152f5fa66a2a 100644
>>>>>>> --- a/include/linux/efi.h
>>>>>>> +++ b/include/linux/efi.h
>>>>>>> @@ -692,6 +692,15 @@ extern struct efi {
>>>>>>>
>>>>>>>    extern struct mm_struct efi_mm;
>>>>>>>
>>>>>>> +static inline void is_efi_mm(struct mm_struct *mm)
>>>>>>> +{
>>>>>>> +#ifdef CONFIG_EFI
>>>>>>> +       return mm == &efi_mm;
>>>>>>> +#else
>>>>>>> +       return false;
>>>>>>> +#endif
>>>>>>> +}
>>>>>>> +
>>>>>>>    static inline int
>>>>>>>    efi_guidcmp (efi_guid_t left, efi_guid_t right)
>>>>>>>    {
>>>>>>>
>>>>>>>
>>>>>>
>>>>>> That would definitely work, but in that case, I might as well just check for it
>>>>>> in mm_is_user() (and personally I would change the name to mm_is_efi()):
>>>>>>
>>>>>>
>>>>>> static inline bool mm_is_user(struct mm_struct *mm)
>>>>>> {
>>>>>>           return mm != &init_mm && !mm_is_efi(mm);
>>>>>> }
>>>>>>
>>>>>> Any objections?
>>>>>>
>>>>>
>>>>> Any reason not to use IS_ENABLED(CONFIG_EFI) in the above? The extern
>>>>> declaration is visible to the compiler, and any references should
>>>>> disappear before the linker could notice that efi_mm does not exist.
>>>>>
>>>>
>>>> Sure, as long as the linker is happy why not. I'll let Ryan mess with that :)
>>>
>>> I'm not sure if you are suggesting dropping the mm_is_efi() helper and just use
>>> IS_ENABLED(CONFIG_EFI) in mm_is_user() to guard efi_mm, or if you are suggesting
>>> using IS_ENABLED(CONFIG_EFI) in mm_is_efi() instead of the ifdefery?
>>>
>>> The former was what I did initially; It works great, but I didn't like that I
>>> was introducing a new code dependecy between efi and arm64 (nothing else outside
>>> of efi references efi_mm).
>>>
>>> So then concluded that it is safe to not worry about efi_mm (thanks for your
>>> confirmation). But then David wanted a VM_WARN check, which reintroduces the
>>> code dependency. So he suggested the mm_is_efi() helper to hide that... This is
>>> all starting to feel circular...
>>
>> I think Ard meant that inside mm_is_efi(), we could avoid the #ifdef and
>> simply use IS_ENABLED().
>>
> 
> Yes.
> 
> static inline void mm_is_efi(struct mm_struct *mm)
> {
>     return IS_ENABLED(CONFIG_EFI) && mm == &efi_mm;
> }

Ahh, got it. Yes, I'll do it like this. Thanks!

