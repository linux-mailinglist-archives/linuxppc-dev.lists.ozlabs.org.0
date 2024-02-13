Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE02853234
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 14:46:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X2ONDviW;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G6SSpx1p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ2fl2XJBz3dSg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 00:46:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X2ONDviW;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G6SSpx1p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZ2dz2wkhz3bbW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 00:45:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707831939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=D4ddi6PLoydVUj+J6fEQGnNDi4Hh51sbcvCrDZ1MHEk=;
	b=X2ONDviWZd8Ab1h8T/ZBTaZdXehoPuHBf0zLnDOVOjzTewn++IauqcEgPhv+N6pA0F3Hg2
	wLbRaSU5QhUkpa2FpfcVzANSUDvGslJP3CQXnViTqZv1HpT4uJHyMl7MscEyFTLboFamNS
	OKphmTAIQiOffSmXQx3+LYByhFUSVgY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707831940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=D4ddi6PLoydVUj+J6fEQGnNDi4Hh51sbcvCrDZ1MHEk=;
	b=G6SSpx1p4diFKOCOwusxIO0XBWAgLDbGrs4vWv2wW5U+sY3Zb1dZZoNR24Scxo6b8HlE4j
	ei2F4QrJfEiCHONvQNvsDnxJMBKqEm+QRqGmVciU9W9daKytJ2ugk1NaORNZSrZd3qVG41
	7i2/gafj0bqxbM5yiZFQZu9H8F1AelQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-8LKWEI2UP2uYBeW8307Yng-1; Tue, 13 Feb 2024 08:45:36 -0500
X-MC-Unique: 8LKWEI2UP2uYBeW8307Yng-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-33b14a51901so2039345f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 05:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707831935; x=1708436735;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4ddi6PLoydVUj+J6fEQGnNDi4Hh51sbcvCrDZ1MHEk=;
        b=rtC4j9sJNqaBY8KYFLLi5QadD8yQhO2qS2ZS7TyCXgmXhRik0Qf5VUhQQvlGbvYsKN
         YJIKGw5n4XrB+duoq1ysd8XAi6MvAgiYvhe2vS5zQ+YfMgnID7+7QXtpW2UqcoDxIiq5
         O2LVWs1XV4ixTKXhrqURYyPkGlW00hBspfAJQ+JD6CWjHASvU20MLhATG0Lwod585hbc
         7gLyx8191stcbp6srqgCSiTSsivp/17nywK3b4B3CqiT9BZvPDLkobEPFkENoj5IeGCC
         xBNepKftcn3/tbNAxOIWXb9Lu6bNXyYf0X3/0+SnNRQNtWb3qL9Ygb5YNzJoVyAoGjEI
         uK+Q==
X-Gm-Message-State: AOJu0YzTSep3BrykHja5kYOY0JoHDt26rPHx4EnX0H4lCUUmh5aQJMM+
	69lR5A4mg8sm0tfzf/++yO35Fl49yQqnCuH5utxdebtlr6/20vIUtA5sIZXHQSNjZTzlEDg0TK3
	0UEZj5Zxi/hr4uH+E+BRKaJpLIRkHnEG8Y9004eBe7WAmtF05a4J2DvcRlueFxLU=
X-Received: by 2002:a5d:6d82:0:b0:33a:e526:3a49 with SMTP id l2-20020a5d6d82000000b0033ae5263a49mr7593738wrs.23.1707831935418;
        Tue, 13 Feb 2024 05:45:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7JB4curvSCLU3cRcgaDwjv66lW48hoEAVuy6s7BG0EdIGUDN/5vLAG9wmp7a/MQlmzYyYQQ==
X-Received: by 2002:a5d:6d82:0:b0:33a:e526:3a49 with SMTP id l2-20020a5d6d82000000b0033ae5263a49mr7593708wrs.23.1707831934925;
        Tue, 13 Feb 2024 05:45:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+K2KYssKzO2DIzOMByPEqLT8GBc/BLo2Ossd3hDvVKGfVNUebehlk4IClFDxM2GUBTigH+Cgr2VDMsWxDyTT1IdLSO2XtbT6eZunZ2sS9DSgy9AZphI4bRAxG0TEjY0sMyJmLE8YSNWy+ALglvKR3jpb1Tj8ezLNTXq3zNmUn/Wu97QIPf/TE1VZOKYUfe0iOrXf6ojAZ3PN2RjkTzBQgupOriF/9QezkFOwzVgflnUCp+AWs0nf3b/vTkc5mxX6w7HEyn44XEGHRCsQpfIfM1UyXqCNJYulBWk0AV5D4LHWTNrev7y1hxZ07MXKwETIYvOuYVIktbdnNyFCMOBl64srNIyifHld5TBnDBSSZeeWej28nN3tFPa6IMhLAeQo11uwKw/Cmgd3F5t0m3ca3nbDM0TUx5tz3od062O1NOB7t3/xorEA1jeePVA9ViVSO7Wje3YItccIYGQ+kVnMUWmzBFM/+MuvO9a2tCDr4BG6pbl7lcStR9vn8mg9qXDjSgM6wh7wY1UvlJQOE5ip5ytw3Kkho5UUd9hNvctPFB1sIlHMMRpQtINFloNRu9tX99ujht1SzS6ads+S7755GnfPQG9CBpkNrQ0I7ETBcyCiCgKDUrsOLgZSGTAmm3FX8ayphtWrr2+4jSaUPRqIKCOkQVc/Dl4WBhYB5a/g7HMEs4pDgoZpgse2tdSm+kY0JM0yPBMsmOreHo2NeUVaCPObj7jE+3WIr6+zBVSt7Q8/b/e3XQITL4SIoRmy3P/55aPxE9DFel0sMCEKrAmleuI8h1liy5nULFP6B07oq4bAo8F54bl9yrqwIpY+1Rvix7/jRp+gdE2ZI9UsR5X5qABDwC9Z7DmcO67qg0rjYsGs7hspuMPnFcbfipNFEEnmlJ2v9
Received: from ?IPV6:2003:cb:c70a:4d00:b968:9e7a:af8b:adf7? (p200300cbc70a4d00b9689e7aaf8badf7.dip0.t-ipconnect.de. [2003:cb:c70a:4d00:b968:9e7a:af8b:adf7])
        by smtp.gmail.com with ESMTPSA id i14-20020a5d558e000000b0033929310ae4sm9616628wrv.73.2024.02.13.05.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 05:45:34 -0800 (PST)
Message-ID: <64b872bd-4b12-4dbd-b043-1ad11aeaa19a@redhat.com>
Date: Tue, 13 Feb 2024 14:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/25] arm64/mm: Wire up PTE_CONT for user mappings
To: Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAMj1kXEVf1m4hVXORc6t9ytAOb75KZLcW-OJ6999VaKbkVdQ3A@mail.gmail.com>
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

On 13.02.24 14:33, Ard Biesheuvel wrote:
> On Tue, 13 Feb 2024 at 14:21, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>> On 13/02/2024 13:13, David Hildenbrand wrote:
>>> On 13.02.24 14:06, Ryan Roberts wrote:
>>>> On 13/02/2024 12:19, David Hildenbrand wrote:
>>>>> On 13.02.24 13:06, Ryan Roberts wrote:
>>>>>> On 12/02/2024 20:38, Ryan Roberts wrote:
>>>>>>> [...]
>>>>>>>
>>>>>>>>>>> +static inline bool mm_is_user(struct mm_struct *mm)
>>>>>>>>>>> +{
>>>>>>>>>>> +    /*
>>>>>>>>>>> +     * Don't attempt to apply the contig bit to kernel mappings, because
>>>>>>>>>>> +     * dynamically adding/removing the contig bit can cause page faults.
>>>>>>>>>>> +     * These racing faults are ok for user space, since they get
>>>>>>>>>>> serialized
>>>>>>>>>>> +     * on the PTL. But kernel mappings can't tolerate faults.
>>>>>>>>>>> +     */
>>>>>>>>>>> +    return mm != &init_mm;
>>>>>>>>>>> +}
>>>>>>>>>>
>>>>>>>>>> We also have the efi_mm as a non-user mm, though I don't think we
>>>>>>>>>> manipulate
>>>>>>>>>> that while it is live, and I'm not sure if that needs any special handling.
>>>>>>>>>
>>>>>>>>> Well we never need this function in the hot (order-0 folio) path, so I
>>>>>>>>> think I
>>>>>>>>> could add a check for efi_mm here with performance implication. It's
>>>>>>>>> probably
>>>>>>>>> safest to explicitly exclude it? What do you think?
>>>>>>>>
>>>>>>>> Oops: This should have read "I think I could add a check for efi_mm here
>>>>>>>> *without* performance implication"
>>>>>>>
>>>>>>> It turns out that efi_mm is only defined when CONFIG_EFI is enabled I can do
>>>>>>> this:
>>>>>>>
>>>>>>> return mm != &init_mm && (!IS_ENABLED(CONFIG_EFI) || mm != &efi_mm);
>>>>>>>
>>>>>>> Is that acceptable? This is my preference, but nothing else outside of efi
>>>>>>> references this symbol currently.
>>>>>>>
>>>>>>> Or perhaps I can convince myself that its safe to treat efi_mm like userspace.
>>>>>>> There are a couple of things that need to be garanteed for it to be safe:
>>>>>>>
>>>>>>>      - The PFNs of present ptes either need to have an associated struct
>>>>>>> page or
>>>>>>>        need to have the PTE_SPECIAL bit set (either pte_mkspecial() or
>>>>>>>        pte_mkdevmap())
>>>>>>>
>>>>>>>      - Live mappings must either be static (no changes that could cause
>>>>>>> fold/unfold
>>>>>>>        while live) or the system must be able to tolerate a temporary fault
>>>>>>>
>>>>>>> Mark suggests efi_mm is not manipulated while live, so that meets the latter
>>>>>>> requirement, but I'm not sure about the former?
>>>>>>
>>>>>> I've gone through all the efi code, and conclude that, as Mark suggests, the
>>>>>> mappings are indeed static. And additionally, the ptes are populated using only
>>>>>> the _private_ ptep API, so there is no issue here. As just discussed with Mark,
>>>>>> my prefereence is to not make any changes to code, and just add a comment
>>>>>> describing why efi_mm is safe.
>>>>>>
>>>>>> Details:
>>>>>>
>>>>>> * Registered with ptdump
>>>>>>        * ptep_get_lockless()
>>>>>> * efi_create_mapping -> create_pgd_mapping … -> init_pte:
>>>>>>        * __ptep_get()
>>>>>>        * __set_pte()
>>>>>> * efi_memattr_apply_permissions -> efi_set_mapping_permissions … ->
>>>>>> set_permissions
>>>>>>        * __ptep_get()
>>>>>>        * __set_pte()
>>>>>
>>>>> Sound good. We could add some VM_WARN_ON if we ever get the efi_mm via the
>>>>> "official" APIs.
>>>>
>>>> We could, but that would lead to the same linkage issue, which I'm trying to
>>>> avoid in the first place:
>>>>
>>>> VM_WARN_ON(IS_ENABLED(CONFIG_EFI) && mm == efi_mm);
>>>>
>>>> This creates new source code dependencies, which I would rather avoid if
>>>> possible.
>>>
>>> Just a thought, you could have a is_efi_mm() function that abstracts all that.
>>>
>>> diff --git a/include/linux/efi.h b/include/linux/efi.h
>>> index c74f47711f0b..152f5fa66a2a 100644
>>> --- a/include/linux/efi.h
>>> +++ b/include/linux/efi.h
>>> @@ -692,6 +692,15 @@ extern struct efi {
>>>
>>>   extern struct mm_struct efi_mm;
>>>
>>> +static inline void is_efi_mm(struct mm_struct *mm)
>>> +{
>>> +#ifdef CONFIG_EFI
>>> +       return mm == &efi_mm;
>>> +#else
>>> +       return false;
>>> +#endif
>>> +}
>>> +
>>>   static inline int
>>>   efi_guidcmp (efi_guid_t left, efi_guid_t right)
>>>   {
>>>
>>>
>>
>> That would definitely work, but in that case, I might as well just check for it
>> in mm_is_user() (and personally I would change the name to mm_is_efi()):
>>
>>
>> static inline bool mm_is_user(struct mm_struct *mm)
>> {
>>          return mm != &init_mm && !mm_is_efi(mm);
>> }
>>
>> Any objections?
>>
> 
> Any reason not to use IS_ENABLED(CONFIG_EFI) in the above? The extern
> declaration is visible to the compiler, and any references should
> disappear before the linker could notice that efi_mm does not exist.
> 

Sure, as long as the linker is happy why not. I'll let Ryan mess with 
that :)

> In any case, feel free to add
> 
> Acked-by: Ard Biesheuvel <ardb@kernel.org>

Thanks for the review.

-- 
Cheers,

David / dhildenb

