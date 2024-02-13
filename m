Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F178531B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 14:23:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=buZCaCnc;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R9XwGejG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ28Q5b2mz3dX4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 00:23:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=buZCaCnc;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R9XwGejG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZ27h20cCz2ydW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 00:22:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707830572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VEC2sf7LFQqJw89DqYMmjZDJRFTDZsCnAL9w8HwRw84=;
	b=buZCaCncE1nWQqrCYuGoDXErTsRc3eU8kJBTcv7fH7AmtQGNqNrBfH5jXxjekVRqr/Ac+q
	Dkiqi6ED7vv15swNDdNALp84kwq+2rMsevnuazxEFDgw4BC0dOQeT0jLfDhJXL5OzUhhGb
	l/flfYZAXA97S2DpEvZyIjX7cEvzZC8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707830573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VEC2sf7LFQqJw89DqYMmjZDJRFTDZsCnAL9w8HwRw84=;
	b=R9XwGejGWx0aABOlnrK+FcHVHw8IGJ4VczIRcKTmmExWEsDOSP6uTWcJXxieG3N/XY/StB
	F2ur68pZiSTphVK5xFBc54cDYRHiACKjNZH8asLj6hLoqDs1QP07/NV4zQo84Ppkfj8ud6
	Of+dFOdUroKeaKUgG+djL7WAi1FozSQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-V2srJDbGPfKCpuTGK6DpNQ-1; Tue, 13 Feb 2024 08:22:50 -0500
X-MC-Unique: V2srJDbGPfKCpuTGK6DpNQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-33b1799e433so2120345f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 05:22:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707830569; x=1708435369;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEC2sf7LFQqJw89DqYMmjZDJRFTDZsCnAL9w8HwRw84=;
        b=iVnvin4Zp6tXUaYZzsFIziZuU/NQcqgjy2T0Y6zpWXJSiPLIgDfw89gnXb9zjVwd9y
         uDSd0XL5xu4zC8lWzKTaZA1PkF3Y1jilauyi/w8SpBXkcS4cV5IAmaY0SXZFj9QOaFM+
         YMNYAjH7/zxffHqOESwKJlZg4Q3I7fp+IAHcrtGFutRp6KASEpOk5DEv/PhXeGQZ/ll5
         0h85o/ne/tKt4QKvJaEHd+leAbgDwrduRdFR2uTUx3nCqDeLlMlGnVqg8ys0PyMr71Bu
         otMZGUdceWp+Y2u/ySOliASpozqm0DiLzzcqn1Ej4+c6xneba1+qWMY9CHaF+Ie7xtry
         Bp3A==
X-Forwarded-Encrypted: i=1; AJvYcCWgEKkVG7k9wRG+kGi8S/zvPzKzrM0gTdBoxMaagvunfZQL2LtJpHRGGMCJCXRiHCpEbBXaRJGX2TdT/YR3MoG5VJ/xQIHRiVkfV4+ijw==
X-Gm-Message-State: AOJu0YytjKwWIued3dTam1JQ1zEQ2UWExRTqkCiD1fm5/tyQDTL5uBeN
	5MJg+GLizkbym36ExUHG2ARI7i3OT1NUmjV3u3rKOz7XL79FPxb6eBEhFrRrkhD6aQ2e7+2yDrp
	8/fUW8lje0pAOKa292zI+AFrAhEDjGTGiktvB/ohrTtmez2dWnv76a++BsRir60w=
X-Received: by 2002:a05:6000:10c6:b0:33b:66c2:9735 with SMTP id b6-20020a05600010c600b0033b66c29735mr8069209wrx.18.1707830569485;
        Tue, 13 Feb 2024 05:22:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGL/PyU78LN2pLyFDTojnXty/hEr//ZGxzu7Mnoxcl1sF1xcoNhwzPxA9NHcxk55spVgHsUig==
X-Received: by 2002:a05:6000:10c6:b0:33b:66c2:9735 with SMTP id b6-20020a05600010c600b0033b66c29735mr8069187wrx.18.1707830569065;
        Tue, 13 Feb 2024 05:22:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVVeZ9h8nv6/OwEjoggk7L+A4Z0reCUM5BwOoklO/9ky8eJtX03ERJlcbY0SDIr2cJthD5btZ+2yPFe+bqYwnOE+LbIdSOyRhCpo8Q3DBox9hw0GSNMBfWtCXyPagg5EpJ+JSvQS2R7C8BcfnHnlwvZucfM+ri0TbHFsFed8CY3PIzpCUkFeSmOBsq2wGI/7/I+qkixT2Vrn0BNhxZLqr7yBr/leKWqEHUKgpLQwo7iegHifJmqUPkwckPRgibWlK/qYLIiAaFqY09WiYSsHIrtDgZLHHinwjAwj8Rp566AF8Asg8+h5tJJzYdodWJcK0UQW/Fqw2M4k3lsPZ40MzqsJhzQ2FaVh0OmfY7YlJ0K/peNhilDq9OKRs8108kt26xoGkADZ0dmMROgwYxQ2eCDa4l70Xdx1bu9gFOso+wEf85tkj7kqZPcxQcnVZLfN58X6u7Hic6Zm3cHEq9DmtAWJSW0tb+w9PI5dFsJg2zJmNiXiBC4rhASuR1z1HR+WHKdXKj7+rClMigcWhBNRBoVGdjl+CDPfh++fAYvE8cJLlXMACwdxsll6Dri2JLm29PjFyl0HU6Jp5B+8YylLF0CBIRDfFkyKb/2etsgxoRurL/jo+dHA92yCWiRX6tX+beOr1Rbk/Y2qHiH/N4UnIxm7qI2HmXncYgiHvXx3Sae+6vVph4UKgLekJVxPBAMyJIiWva8zTBOKkOn9XqZ0urnXgg72/Flh7+qMFjq9sW2NMa96Rm1YUaSPkWHTJtpnj+h9oIocdJ/W/vJeIWaG1VsK7P688hVMHmi2z2lZhZw9C0U4Be6dW5foxU/rvHjIe3XD37jFCpY9iI3v7qjGVE93C99vOF3AZm3R8Z85ZvVLEMf0I/c06K+umRcw==
Received: from ?IPV6:2003:cb:c70a:4d00:b968:9e7a:af8b:adf7? (p200300cbc70a4d00b9689e7aaf8badf7.dip0.t-ipconnect.de. [2003:cb:c70a:4d00:b968:9e7a:af8b:adf7])
        by smtp.gmail.com with ESMTPSA id m18-20020a5d56d2000000b0033b60bad2fcsm9482744wrw.113.2024.02.13.05.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 05:22:48 -0800 (PST)
Message-ID: <e89a3d11-fe73-4717-b0d6-55cc4fbe16cf@redhat.com>
Date: Tue, 13 Feb 2024 14:22:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/25] arm64/mm: Wire up PTE_CONT for user mappings
To: Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <dce5f80d-942f-439c-a549-5290666464ca@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 13.02.24 14:20, Ryan Roberts wrote:
> On 13/02/2024 13:13, David Hildenbrand wrote:
>> On 13.02.24 14:06, Ryan Roberts wrote:
>>> On 13/02/2024 12:19, David Hildenbrand wrote:
>>>> On 13.02.24 13:06, Ryan Roberts wrote:
>>>>> On 12/02/2024 20:38, Ryan Roberts wrote:
>>>>>> [...]
>>>>>>
>>>>>>>>>> +static inline bool mm_is_user(struct mm_struct *mm)
>>>>>>>>>> +{
>>>>>>>>>> +    /*
>>>>>>>>>> +     * Don't attempt to apply the contig bit to kernel mappings, because
>>>>>>>>>> +     * dynamically adding/removing the contig bit can cause page faults.
>>>>>>>>>> +     * These racing faults are ok for user space, since they get
>>>>>>>>>> serialized
>>>>>>>>>> +     * on the PTL. But kernel mappings can't tolerate faults.
>>>>>>>>>> +     */
>>>>>>>>>> +    return mm != &init_mm;
>>>>>>>>>> +}
>>>>>>>>>
>>>>>>>>> We also have the efi_mm as a non-user mm, though I don't think we
>>>>>>>>> manipulate
>>>>>>>>> that while it is live, and I'm not sure if that needs any special handling.
>>>>>>>>
>>>>>>>> Well we never need this function in the hot (order-0 folio) path, so I
>>>>>>>> think I
>>>>>>>> could add a check for efi_mm here with performance implication. It's
>>>>>>>> probably
>>>>>>>> safest to explicitly exclude it? What do you think?
>>>>>>>
>>>>>>> Oops: This should have read "I think I could add a check for efi_mm here
>>>>>>> *without* performance implication"
>>>>>>
>>>>>> It turns out that efi_mm is only defined when CONFIG_EFI is enabled. I can do
>>>>>> this:
>>>>>>
>>>>>> return mm != &init_mm && (!IS_ENABLED(CONFIG_EFI) || mm != &efi_mm);
>>>>>>
>>>>>> Is that acceptable? This is my preference, but nothing else outside of efi
>>>>>> references this symbol currently.
>>>>>>
>>>>>> Or perhaps I can convince myself that its safe to treat efi_mm like userspace.
>>>>>> There are a couple of things that need to be garanteed for it to be safe:
>>>>>>
>>>>>>      - The PFNs of present ptes either need to have an associated struct
>>>>>> page or
>>>>>>        need to have the PTE_SPECIAL bit set (either pte_mkspecial() or
>>>>>>        pte_mkdevmap())
>>>>>>
>>>>>>      - Live mappings must either be static (no changes that could cause
>>>>>> fold/unfold
>>>>>>        while live) or the system must be able to tolerate a temporary fault
>>>>>>
>>>>>> Mark suggests efi_mm is not manipulated while live, so that meets the latter
>>>>>> requirement, but I'm not sure about the former?
>>>>>
>>>>> I've gone through all the efi code, and conclude that, as Mark suggests, the
>>>>> mappings are indeed static. And additionally, the ptes are populated using only
>>>>> the _private_ ptep API, so there is no issue here. As just discussed with Mark,
>>>>> my prefereence is to not make any changes to code, and just add a comment
>>>>> describing why efi_mm is safe.
>>>>>
>>>>> Details:
>>>>>
>>>>> * Registered with ptdump
>>>>>        * ptep_get_lockless()
>>>>> * efi_create_mapping -> create_pgd_mapping … -> init_pte:
>>>>>        * __ptep_get()
>>>>>        * __set_pte()
>>>>> * efi_memattr_apply_permissions -> efi_set_mapping_permissions … ->
>>>>> set_permissions
>>>>>        * __ptep_get()
>>>>>        * __set_pte()
>>>>
>>>> Sound good. We could add some VM_WARN_ON if we ever get the efi_mm via the
>>>> "official" APIs.
>>>
>>> We could, but that would lead to the same linkage issue, which I'm trying to
>>> avoid in the first place:
>>>
>>> VM_WARN_ON(IS_ENABLED(CONFIG_EFI) && mm == efi_mm);
>>>
>>> This creates new source code dependencies, which I would rather avoid if
>>> possible.
>>
>> Just a thought, you could have a is_efi_mm() function that abstracts all that.
>>
>> diff --git a/include/linux/efi.h b/include/linux/efi.h
>> index c74f47711f0b..152f5fa66a2a 100644
>> --- a/include/linux/efi.h
>> +++ b/include/linux/efi.h
>> @@ -692,6 +692,15 @@ extern struct efi {
>>   
>>   extern struct mm_struct efi_mm;
>>   
>> +static inline void is_efi_mm(struct mm_struct *mm)
>> +{
>> +#ifdef CONFIG_EFI
>> +       return mm == &efi_mm;
>> +#else
>> +       return false;
>> +#endif
>> +}
>> +
>>   static inline int
>>   efi_guidcmp (efi_guid_t left, efi_guid_t right)
>>   {
>>
>>
> 
> That would definitely work, but in that case, I might as well just check for it
> in mm_is_user() (and personally I would change the name to mm_is_efi()):
> 
> 
> static inline bool mm_is_user(struct mm_struct *mm)
> {
> 	return mm != &init_mm && !mm_is_efi(mm);
> }
> 
> Any objections?
> 

Nope :) Maybe slap in an "unlikely()", because efi_mm *is* unlikely to 
show up.

-- 
Cheers,

David / dhildenb

