Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40401853064
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 13:20:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YABso3tH;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YABso3tH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ0l918gbz3cGM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 23:20:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YABso3tH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YABso3tH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZ0kM03qLz3bsQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 23:19:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707826756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=S2bJxvylCqFLAmYxa8uZCedaT3+BHEK/hK5Mn/PFcjE=;
	b=YABso3tHfGLfT865Df946TxbKDOqDiCRbuPT1ZeesLGrOSTq/WFSjgGYw++G65RLknLoD5
	cpPS3BwSg0UdRPmeZhU/asGIniT2sPguLIShU+Wda89C2P5Ww2eOuszQAh3aT52Zjckylc
	MgkiHYYl2nNOvB72kNXFJ2qRF8WQee4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707826756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=S2bJxvylCqFLAmYxa8uZCedaT3+BHEK/hK5Mn/PFcjE=;
	b=YABso3tHfGLfT865Df946TxbKDOqDiCRbuPT1ZeesLGrOSTq/WFSjgGYw++G65RLknLoD5
	cpPS3BwSg0UdRPmeZhU/asGIniT2sPguLIShU+Wda89C2P5Ww2eOuszQAh3aT52Zjckylc
	MgkiHYYl2nNOvB72kNXFJ2qRF8WQee4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-HFiwXqlSN3KS-pUFHgGzlA-1; Tue, 13 Feb 2024 07:19:12 -0500
X-MC-Unique: HFiwXqlSN3KS-pUFHgGzlA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-33cd8db37bcso274639f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 04:19:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707826751; x=1708431551;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2bJxvylCqFLAmYxa8uZCedaT3+BHEK/hK5Mn/PFcjE=;
        b=MU1GV8VsO+PSJLk7Zn4EiFlbBV+g3H3o14V/Rfj25YoCPdn382Cmjfyv8hGRxf1vl5
         cBr3n4mbskmZbIAGnWNFwrClU/Od5EVppR795uQvuzPAUHpHF0DzzWMfTEGRRExZLvBc
         tjqTStI6F7XqE6WDZJpe5mL08VYFoA/U/osRp5iadgRR4mGeOXEHFAfVa8xikm5zYnID
         c+Esnt65TfCiu51OlIqPTQLT6XXAtu7uB0lmn6Omwr22tRCIe03bjhosNH67qy0UCuW3
         CmNUAnmGLXzIk5tyy0zVGrAdpcOQlvq0IsE/mBEPTE58mJK51PPfmGxlCMxajL9vsExa
         6EMQ==
X-Gm-Message-State: AOJu0Yww4WdpGWaalcm89Zz5/NwbP37rKi0yDy+UtwVsicmJHGI6SG3B
	t7i1wE/XGL+tEGTrf4CSWGXjNjYcelKx5L5nmEyWyBOaWz0qHTaqxqEVqrD8TAtcdRFE9o6RjyH
	lRKKPnl+CUv3JMZoI/I+3iWgYeDOIqL7uql6P07z9FgfFcez3ojgAgq73QLDsrBQ=
X-Received: by 2002:adf:f881:0:b0:337:68df:5426 with SMTP id u1-20020adff881000000b0033768df5426mr2352409wrp.34.1707826751303;
        Tue, 13 Feb 2024 04:19:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMW7lMTPrzppYNY+9ma/Q/ucAwRMUXtRlgPVtxq6qQrZR7FrcBiIMsLsZFPWm3gdIKZtl3UQ==
X-Received: by 2002:adf:f881:0:b0:337:68df:5426 with SMTP id u1-20020adff881000000b0033768df5426mr2352359wrp.34.1707826750892;
        Tue, 13 Feb 2024 04:19:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJflXme9CzrfC4cbaI3/EENg0gZ9owpcqLnJ0M86SwHQKSbujV6MdBZKTPvr5nFqTJVgJUSAPEEpHBR4Y+JJaDeoEZrVDfRwIDDbV1jYB6pWVF7tvtZtWUUCuMK3iSnGM88bythQgdG1AdBijJFUsnWKZgpjcBXa4uzBuaOFeVRgrZAzep3/trjCh8n05JlZLt6gKVe5B6KuUVfaUij/NMuaTF+RdumABiTjbK0NlYoenL3R0T79hJvZ2FbUxE7FGvMIMVgYP8hKy1u05shcVeB3QmasG1oAfzaLWHzzZv58NVc60g8siyvL9yClnYX3oUKABM9Jam+sC+nSecnZJbcaRDPtTy0j1w0Ehth4ss74xeNV3hRgtjRLr5HeXDmxm3WuSCAyuorihK2aOmTFYb9F6InNIaQ+qwVInG2v1e5Jm3vwPd/wMB4nWQFcij6GBiItaOQ6IU142vL2YWZGdztmaqaObLkE9To2Rv+oONfYmTMyHFPubv22HeXn37DprNkBw3xPfOszxKnqj1+EcA6XjQf7NkTGkHnnQoXyLUK8wh5IdsOh6PBQiGDA+GzabpRvZGAGR+zaT1/pBNtVM5PVCSkyrUiq0GxJrB+T0Yn6pIfu3JWIZBq6B+3b9kMZjoRivkFRqBEYBxn9so6WHpCbkNZp0MfQ7EMZUvWnHap43H5WMR7eeaveVsb5cuH9VdfVDwtbQbaVCnVxC4QOZPouN6dhjSdFDX4r9e6r1foJoeFqD4QfRj2JtR0p858TIKUIZQD4jKC/nB0jSItagGoFbKcI4857mKFlco+EIyTfypTKSaHuOZJW0z/4KpSC2cGftleTJJAgFi8ogsEeI/3Cs7PwTt3aj48S/plnUZTBnkSg2iN+qtml/5uA==
Received: from ?IPV6:2003:cb:c70a:4d00:b968:9e7a:af8b:adf7? (p200300cbc70a4d00b9689e7aaf8badf7.dip0.t-ipconnect.de. [2003:cb:c70a:4d00:b968:9e7a:af8b:adf7])
        by smtp.gmail.com with ESMTPSA id ay20-20020a5d6f14000000b0033b495b1d10sm9685528wrb.8.2024.02.13.04.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 04:19:10 -0800 (PST)
Message-ID: <41499621-482f-455b-9f68-b43ea8052557@redhat.com>
Date: Tue, 13 Feb 2024 13:19:08 +0100
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <d6ce951f-f83b-4a5a-a814-311f2d8b01e4@arm.com>
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

On 13.02.24 13:06, Ryan Roberts wrote:
> On 12/02/2024 20:38, Ryan Roberts wrote:
>> [...]
>>
>>>>>> +static inline bool mm_is_user(struct mm_struct *mm)
>>>>>> +{
>>>>>> +	/*
>>>>>> +	 * Don't attempt to apply the contig bit to kernel mappings, because
>>>>>> +	 * dynamically adding/removing the contig bit can cause page faults.
>>>>>> +	 * These racing faults are ok for user space, since they get serialized
>>>>>> +	 * on the PTL. But kernel mappings can't tolerate faults.
>>>>>> +	 */
>>>>>> +	return mm != &init_mm;
>>>>>> +}
>>>>>
>>>>> We also have the efi_mm as a non-user mm, though I don't think we manipulate
>>>>> that while it is live, and I'm not sure if that needs any special handling.
>>>>
>>>> Well we never need this function in the hot (order-0 folio) path, so I think I
>>>> could add a check for efi_mm here with performance implication. It's probably
>>>> safest to explicitly exclude it? What do you think?
>>>
>>> Oops: This should have read "I think I could add a check for efi_mm here
>>> *without* performance implication"
>>
>> It turns out that efi_mm is only defined when CONFIG_EFI is enabled. I can do this:
>>
>> return mm != &init_mm && (!IS_ENABLED(CONFIG_EFI) || mm != &efi_mm);
>>
>> Is that acceptable? This is my preference, but nothing else outside of efi
>> references this symbol currently.
>>
>> Or perhaps I can convince myself that its safe to treat efi_mm like userspace.
>> There are a couple of things that need to be garanteed for it to be safe:
>>
>>    - The PFNs of present ptes either need to have an associated struct page or
>>      need to have the PTE_SPECIAL bit set (either pte_mkspecial() or
>>      pte_mkdevmap())
>>
>>    - Live mappings must either be static (no changes that could cause fold/unfold
>>      while live) or the system must be able to tolerate a temporary fault
>>
>> Mark suggests efi_mm is not manipulated while live, so that meets the latter
>> requirement, but I'm not sure about the former?
> 
> I've gone through all the efi code, and conclude that, as Mark suggests, the
> mappings are indeed static. And additionally, the ptes are populated using only
> the _private_ ptep API, so there is no issue here. As just discussed with Mark,
> my prefereence is to not make any changes to code, and just add a comment
> describing why efi_mm is safe.
> 
> Details:
> 
> * Registered with ptdump
>      * ptep_get_lockless()
> * efi_create_mapping -> create_pgd_mapping … -> init_pte:
>      * __ptep_get()
>      * __set_pte()
> * efi_memattr_apply_permissions -> efi_set_mapping_permissions … -> set_permissions
>      * __ptep_get()
>      * __set_pte()

Sound good. We could add some VM_WARN_ON if we ever get the efi_mm via 
the "official" APIs.

-- 
Cheers,

David / dhildenb

