Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AB1853299
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 15:06:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MQRsAknM;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MQRsAknM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ35R2l8Lz3dXZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 01:06:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MQRsAknM;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MQRsAknM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZ34h1n5Sz3c4V
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 01:05:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707833120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LeZDdyhURL2Mwa6h0r62LQwvQd54o++ieHpD9U2+Gyw=;
	b=MQRsAknMD2RE2oHQIMOzKVOFmrBeRQDpnc8aQhYtTmtMuznIOrRHdX4PIv392ajG5A9z0u
	RGaTXPXeCUG7X4GqLFydsiHtqMvQ5SMIjlsMDDMnd8xLhBNNgwZ9G08f6zguumJW7VPGR0
	WPPvzjfXQK0oPglG2w4/Mu6KPs/6PQQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707833120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LeZDdyhURL2Mwa6h0r62LQwvQd54o++ieHpD9U2+Gyw=;
	b=MQRsAknMD2RE2oHQIMOzKVOFmrBeRQDpnc8aQhYtTmtMuznIOrRHdX4PIv392ajG5A9z0u
	RGaTXPXeCUG7X4GqLFydsiHtqMvQ5SMIjlsMDDMnd8xLhBNNgwZ9G08f6zguumJW7VPGR0
	WPPvzjfXQK0oPglG2w4/Mu6KPs/6PQQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-x-loQ3jsNgyb-lF1UsjOPQ-1; Tue, 13 Feb 2024 09:05:18 -0500
X-MC-Unique: x-loQ3jsNgyb-lF1UsjOPQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-410422e8cd1so25653855e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 06:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707833117; x=1708437917;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeZDdyhURL2Mwa6h0r62LQwvQd54o++ieHpD9U2+Gyw=;
        b=dZ+hfxkpVKeWIID0i7Zv4t6MasA5ZMJnFXNR0wzwZfkRa4GekHBM2lW0YIg8pTK9AL
         Ict8FUCGZrh2Ow/+WXYMgXbmnjXSiTfKUaOWA/A9WA62kCmJN3YA7MangN/oqgH53y0+
         Jse3xIlMIE5b9wDnPXJjmjP3+3pBfCAUd3Jr4qQnzrWPXuw+fg8bFcAxQjwswfkV+TpY
         qYQMhOWSk+Eo8i11UFxzA3H2Sk5ZB06YyX8/9Jov/N+m+826S95tTIIXVxGMCn/xKnvE
         D1Ifn0hy3soC9mxEyddCKqz7J9FzR0CwwSZbPUxA25l4eaJfPUJaVh+X9ki+g3bU18cF
         nfhw==
X-Gm-Message-State: AOJu0YzlTrPZQXeYqnVpgaJheZzhIFwatFnhhUwdgWba2pSEA+Wari1y
	VaBlHP8M7mLMA1Vq3jzkRrL7NbptlZehKpjpFCX26Q67mHL2Jz9caBZ03x02ln524WSkdh9ck0/
	yYQXWfGDs2lKAAnh0am4sjx+8UdSpl7kVZ8WfaDidnH9c0MG2tIefUuTnGBdEUrI=
X-Received: by 2002:a05:600c:4f4f:b0:411:c713:fe95 with SMTP id m15-20020a05600c4f4f00b00411c713fe95mr1001349wmq.34.1707833117038;
        Tue, 13 Feb 2024 06:05:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHG0g0gloXaNlAfhYey1E1Vi//J6vLpOEiIAV7q+Fwk5C+rMKFz7BQB5lkYwYh4NP7/nlS3Vg==
X-Received: by 2002:a05:600c:4f4f:b0:411:c713:fe95 with SMTP id m15-20020a05600c4f4f00b00411c713fe95mr1001306wmq.34.1707833116596;
        Tue, 13 Feb 2024 06:05:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXDnHWHbn7N9IrcijXsfF3GbTPJqNeNob5qN6156xA6910AcWeEviLBPtWiahlXZU4NX7wo9BJQD2IaAN+poYV9cJQy6JTNkmnQwgCmKegudzXGLeOQqvypxuew9EitQCsbWL1619N0aw6fqRabS7WpsqwhLwGs5klAqcZwvOkKNKR7nqLDQ/XqZwCyyh9Gr0Nct2uU1kJRUPTd7wOip86iCMo7t6eywGaboETtiSurIYf8uWX/hHQseeJwIEBvJ6aSV+vuAoKZyut7qDiNdkp9ZEvf1d9jBWANXCwDzxT32aut6Y1cFWL3WwjCKq9fNkGdkHaluBPOeScM4emOJ86uwd6ZbZkbMHPF9WUMul3T8T1/sD8cUN46RCO+f1uQvulpUN9q9qdcIb/M9x8P1kRj7eU94UrI3ep1WG65+EWw9LxuwcMt6d/FTrZSEx0h6oILXqBYSded6o02LaL/rJJe6ET7vIovRcJ836NAY7yda7Hqsq45dST0E9uCyqaBi4usVtsyth01Zx+xGrBpq5ovSF35/OD6FWj6rN7yLGIRSKw05SZ3wzyUSpqUu0UQrAIPNhpLIeE78QeapNzhYfeRkj7my6mUN99BqJBpIyTJFZo6n5B1fPQ0bYsKvcgU/gp3bFaQkkZ9x0+lpUt5Z4za3anlOAORl2G8YLRbkTLDWXZJPnavnOHIVfWe3p/OPCQJC3j/CaevE9NTAOBcneDjDMMZVi8RKP7kNsdfdRuLV+al8SYjO8ssNwbd7YN9RslJHiHN5MxRB4CoXmM0jmTZL8NUK6keGcx4oyMekZg/PHOjL2DNGqCPG5EUm+XRSgVlR+a9DOIRfH8BabngNtn1WK6RAz8r5k55WpHjYFLSOWHV59WwHGILm9p4Ok8A9Q==
Received: from ?IPV6:2003:cb:c70a:4d00:b968:9e7a:af8b:adf7? (p200300cbc70a4d00b9689e7aaf8badf7.dip0.t-ipconnect.de. [2003:cb:c70a:4d00:b968:9e7a:af8b:adf7])
        by smtp.gmail.com with ESMTPSA id g7-20020a5d5407000000b003392206c808sm9629533wrv.105.2024.02.13.06.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 06:05:15 -0800 (PST)
Message-ID: <f93e5552-5e46-4f49-918a-21b63156eb32@redhat.com>
Date: Tue, 13 Feb 2024 15:05:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/25] arm64/mm: Wire up PTE_CONT for user mappings
To: Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <3de2130b-9f0f-4a11-ac06-7bf814de641c@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13.02.24 15:02, Ryan Roberts wrote:
> On 13/02/2024 13:45, David Hildenbrand wrote:
>> On 13.02.24 14:33, Ard Biesheuvel wrote:
>>> On Tue, 13 Feb 2024 at 14:21, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>>
>>>> On 13/02/2024 13:13, David Hildenbrand wrote:
>>>>> On 13.02.24 14:06, Ryan Roberts wrote:
>>>>>> On 13/02/2024 12:19, David Hildenbrand wrote:
>>>>>>> On 13.02.24 13:06, Ryan Roberts wrote:
>>>>>>>> On 12/02/2024 20:38, Ryan Roberts wrote:
>>>>>>>>> [...]
>>>>>>>>>
>>>>>>>>>>>>> +static inline bool mm_is_user(struct mm_struct *mm)
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +    /*
>>>>>>>>>>>>> +     * Don't attempt to apply the contig bit to kernel mappings,
>>>>>>>>>>>>> because
>>>>>>>>>>>>> +     * dynamically adding/removing the contig bit can cause page
>>>>>>>>>>>>> faults.
>>>>>>>>>>>>> +     * These racing faults are ok for user space, since they get
>>>>>>>>>>>>> serialized
>>>>>>>>>>>>> +     * on the PTL. But kernel mappings can't tolerate faults.
>>>>>>>>>>>>> +     */
>>>>>>>>>>>>> +    return mm != &init_mm;
>>>>>>>>>>>>> +}
>>>>>>>>>>>>
>>>>>>>>>>>> We also have the efi_mm as a non-user mm, though I don't think we
>>>>>>>>>>>> manipulate
>>>>>>>>>>>> that while it is live, and I'm not sure if that needs any special
>>>>>>>>>>>> handling.
>>>>>>>>>>>
>>>>>>>>>>> Well we never need this function in the hot (order-0 folio) path, so I
>>>>>>>>>>> think I
>>>>>>>>>>> could add a check for efi_mm here with performance implication. It's
>>>>>>>>>>> probably
>>>>>>>>>>> safest to explicitly exclude it? What do you think?
>>>>>>>>>>
>>>>>>>>>> Oops: This should have read "I think I could add a check for efi_mm here
>>>>>>>>>> *without* performance implication"
>>>>>>>>>
>>>>>>>>> It turns out that efi_mm is only defined when CONFIG_EFI is enabled I
>>>>>>>>> can do
>>>>>>>>> this:
>>>>>>>>>
>>>>>>>>> return mm != &init_mm && (!IS_ENABLED(CONFIG_EFI) || mm != &efi_mm);
>>>>>>>>>
>>>>>>>>> Is that acceptable? This is my preference, but nothing else outside of efi
>>>>>>>>> references this symbol currently.
>>>>>>>>>
>>>>>>>>> Or perhaps I can convince myself that its safe to treat efi_mm like
>>>>>>>>> userspace.
>>>>>>>>> There are a couple of things that need to be garanteed for it to be safe:
>>>>>>>>>
>>>>>>>>>       - The PFNs of present ptes either need to have an associated struct
>>>>>>>>> page or
>>>>>>>>>         need to have the PTE_SPECIAL bit set (either pte_mkspecial() or
>>>>>>>>>         pte_mkdevmap())
>>>>>>>>>
>>>>>>>>>       - Live mappings must either be static (no changes that could cause
>>>>>>>>> fold/unfold
>>>>>>>>>         while live) or the system must be able to tolerate a temporary fault
>>>>>>>>>
>>>>>>>>> Mark suggests efi_mm is not manipulated while live, so that meets the
>>>>>>>>> latter
>>>>>>>>> requirement, but I'm not sure about the former?
>>>>>>>>
>>>>>>>> I've gone through all the efi code, and conclude that, as Mark suggests, the
>>>>>>>> mappings are indeed static. And additionally, the ptes are populated
>>>>>>>> using only
>>>>>>>> the _private_ ptep API, so there is no issue here. As just discussed with
>>>>>>>> Mark,
>>>>>>>> my prefereence is to not make any changes to code, and just add a comment
>>>>>>>> describing why efi_mm is safe.
>>>>>>>>
>>>>>>>> Details:
>>>>>>>>
>>>>>>>> * Registered with ptdump
>>>>>>>>         * ptep_get_lockless()
>>>>>>>> * efi_create_mapping -> create_pgd_mapping … -> init_pte:
>>>>>>>>         * __ptep_get()
>>>>>>>>         * __set_pte()
>>>>>>>> * efi_memattr_apply_permissions -> efi_set_mapping_permissions … ->
>>>>>>>> set_permissions
>>>>>>>>         * __ptep_get()
>>>>>>>>         * __set_pte()
>>>>>>>
>>>>>>> Sound good. We could add some VM_WARN_ON if we ever get the efi_mm via the
>>>>>>> "official" APIs.
>>>>>>
>>>>>> We could, but that would lead to the same linkage issue, which I'm trying to
>>>>>> avoid in the first place:
>>>>>>
>>>>>> VM_WARN_ON(IS_ENABLED(CONFIG_EFI) && mm == efi_mm);
>>>>>>
>>>>>> This creates new source code dependencies, which I would rather avoid if
>>>>>> possible.
>>>>>
>>>>> Just a thought, you could have a is_efi_mm() function that abstracts all that.
>>>>>
>>>>> diff --git a/include/linux/efi.h b/include/linux/efi.h
>>>>> index c74f47711f0b..152f5fa66a2a 100644
>>>>> --- a/include/linux/efi.h
>>>>> +++ b/include/linux/efi.h
>>>>> @@ -692,6 +692,15 @@ extern struct efi {
>>>>>
>>>>>    extern struct mm_struct efi_mm;
>>>>>
>>>>> +static inline void is_efi_mm(struct mm_struct *mm)
>>>>> +{
>>>>> +#ifdef CONFIG_EFI
>>>>> +       return mm == &efi_mm;
>>>>> +#else
>>>>> +       return false;
>>>>> +#endif
>>>>> +}
>>>>> +
>>>>>    static inline int
>>>>>    efi_guidcmp (efi_guid_t left, efi_guid_t right)
>>>>>    {
>>>>>
>>>>>
>>>>
>>>> That would definitely work, but in that case, I might as well just check for it
>>>> in mm_is_user() (and personally I would change the name to mm_is_efi()):
>>>>
>>>>
>>>> static inline bool mm_is_user(struct mm_struct *mm)
>>>> {
>>>>           return mm != &init_mm && !mm_is_efi(mm);
>>>> }
>>>>
>>>> Any objections?
>>>>
>>>
>>> Any reason not to use IS_ENABLED(CONFIG_EFI) in the above? The extern
>>> declaration is visible to the compiler, and any references should
>>> disappear before the linker could notice that efi_mm does not exist.
>>>
>>
>> Sure, as long as the linker is happy why not. I'll let Ryan mess with that :)
> 
> I'm not sure if you are suggesting dropping the mm_is_efi() helper and just use
> IS_ENABLED(CONFIG_EFI) in mm_is_user() to guard efi_mm, or if you are suggesting
> using IS_ENABLED(CONFIG_EFI) in mm_is_efi() instead of the ifdefery?
> 
> The former was what I did initially; It works great, but I didn't like that I
> was introducing a new code dependecy between efi and arm64 (nothing else outside
> of efi references efi_mm).
> 
> So then concluded that it is safe to not worry about efi_mm (thanks for your
> confirmation). But then David wanted a VM_WARN check, which reintroduces the
> code dependency. So he suggested the mm_is_efi() helper to hide that... This is
> all starting to feel circular...

I think Ard meant that inside mm_is_efi(), we could avoid the #ifdef and 
simply use IS_ENABLED().

-- 
Cheers,

David / dhildenb

