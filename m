Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF8E852D1E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 10:55:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K1fxxaZG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BB+AuFEE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYxXY48jCz3dWK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 20:55:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K1fxxaZG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BB+AuFEE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYxWp6vqjz30NP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 20:55:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707818098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TrWRtDTQ5jYztXig15wwvcdMCUjYPa0G3g3GugipXcY=;
	b=K1fxxaZGJ9vrzVyMqSWEkGc67kp1HtnxEWhU52qmAiFSL12lQO/Hl1iWenMYPlTzq5eRwi
	T2Q8O+hj5M0Ft/ycITQrydhHEHZs1aUNxK/rIyz8YQkLuhDlGjvSUYqMElQ3PGDKqLgggR
	Tf3jITu8nJixN0cUNEtbdp+fhLUEB3E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707818099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TrWRtDTQ5jYztXig15wwvcdMCUjYPa0G3g3GugipXcY=;
	b=BB+AuFEEAfqZbmNv4paIz2ORfFiPvZMPdYz6CnF17RTwtc0W09gYVt7RYXcCUG6qflhwL5
	6P0vIdcyhncVdHM7UEK04/LKKTSkQFbtuk6axEGGVww3MSfwQRBn+8e803+4ienPeJtZDU
	V5IN7RT88TP37ELU8ZjNsVOOutqOOC4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-LhO9UTbVNvuBR_Tu49c4Zg-1; Tue, 13 Feb 2024 04:54:56 -0500
X-MC-Unique: LhO9UTbVNvuBR_Tu49c4Zg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-41082621642so19013505e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 01:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707818095; x=1708422895;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrWRtDTQ5jYztXig15wwvcdMCUjYPa0G3g3GugipXcY=;
        b=Aey1EAyjI+tSc4QIwXGJQaBcHKy3JVXb0XuEeZcXrlp2RyNRfnFsRpNkACFQ7TVi2u
         6jZlkQ3x06ByGZ9wq/AoscCUqonTlAIAaOrRzj0D+zMBqRdFTNN1Xl/fdcnKwkSPREeJ
         Ckry0yRGMC+0OxJVzu7dwqUIznm9RpG1FgvH2DVwbJCzFNeZrmu7Bji86C1INB4JwxCP
         nzAGu4fOE05ufsSt3Ds0U9OXLG6v5UhmIACSl8Ou4+AKDjhMP0ZX80u/EGegmWoSmfrg
         PQIWWe9qpox8gvH0KJ9YMaf8g9uFbnWPgBUNYI/t85Z4UNVEHvuVIHCjDLa2+R2VjBLD
         7YoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpU8BYfxW6lQJkBW4jmp5re6lWTTB6GjpVq9Xn8ic+VW/Tmiqbnk7JtkT0kQ9dKE28BqztHIy/RvT0fW2QwWvpGTqHMfGIufINyqe9/g==
X-Gm-Message-State: AOJu0Yy4cmLC4jgL01FqPLhqv4ZhodTFIm3/MXq2gNdvq2gmMZ/0Xuql
	hXx1abyc2i4qElh8he0OVlgRhyiEthRX8SXTs16Lw6FH6T6KlKHqBdAm5GG8KN51j7D4Lifpx6y
	ZSOSEA9Sk/2WB2PUS1+EhXq+ZwEUPTFPHhvd09agLBJuZM6i9+3x2S0UwbdTg0bs=
X-Received: by 2002:a05:600c:1c89:b0:410:d7e5:5e88 with SMTP id k9-20020a05600c1c8900b00410d7e55e88mr4269956wms.30.1707818095019;
        Tue, 13 Feb 2024 01:54:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9KBX6A0ibCIi/wvKYQpCvkiqIt7kH703x7Z+hUUhS2+IQ+5vQAmWSOf+KmcR+fSY7mVmpcA==
X-Received: by 2002:a05:600c:1c89:b0:410:d7e5:5e88 with SMTP id k9-20020a05600c1c8900b00410d7e55e88mr4269943wms.30.1707818094585;
        Tue, 13 Feb 2024 01:54:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUaRvNPuVqv0E6oc4XU+WkXptU9XXqbaHh5JTi90s/t9P6xbWxOPwS4CskYrAKewUhQW5lJNyQmSwNxVJ1xKqkVqqmsJH2v7L3V2BGM/QH1zdecsa1fOQJ/y+vKY8u7O2D4ukFTjc53zizCxP6ZGfMVjTTmJQbjX3+9rKYZq8Irzac1+iaYgMu+8l6PH61tpzhnPp/UZeh9Y1kUEPZMEQwPSqE30/vIfoDeegYraoRVZ/A4fzWb2TNDM4cgXpukFKBlaDez+dpcWDeZIZb8oIhfqjN79PGsEFMp2A7BGs9N/KJnPd88zg+7DRHGsjwEoF3R89Kkhw2INMA8Z4abcmzjvz4sxmIsdRmk28H8aqMdtVF0L82mjxko5cS7eoJ51dGN8nMRIBtP4Q24nPLP4Wqpvo1+RoMCxDg9vvg6/WS2AFi1JQKHrLgyFjD64QfAHCkz1SVrj4IzEGuKZyBk5dztLGMIzDCPCxUPVAe+7dCpuGct5S9i57PW/s6MYfJUKTmvEJW5YXlSA1n430h3x4ZkGqYMU9yyCDZL83Ddu9GoPSzdN1fiZYHda+1fB76BIUgENUZTjxpL1sbbt9kiFUn2okrchc1/69JtI7tGuS+1u9f0S6q0FWmRr0+TdqvZG8xP8PKfJwJ5DAIFYbkEVaAKXzFgR4pslugMdpu/iT0KgRcLc+Yaj7raHNjI6ZUkHdJkWBZmZcT0bDkfYbYaOpSYz2RsV6anuYRIcrW9BRFjnw5LYOudLIIGLqzbouXRz0gqgUGk/8NsCMgZzqTJBKdyvsQWWq5qrHiZtluGImPxw5gsLcfO9hys34S9cwtNF7Cyoh4dNJkd+rfw7UNbJxNfRuaSMQRinTJjj7sGQWNO
Received: from ?IPV6:2003:cb:c70a:4d00:b968:9e7a:af8b:adf7? (p200300cbc70a4d00b9689e7aaf8badf7.dip0.t-ipconnect.de. [2003:cb:c70a:4d00:b968:9e7a:af8b:adf7])
        by smtp.gmail.com with ESMTPSA id t24-20020adfa2d8000000b0033b86b38611sm3796789wra.10.2024.02.13.01.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 01:54:54 -0800 (PST)
Message-ID: <940939b2-e36c-4d11-b48f-49f633f0c4fa@redhat.com>
Date: Tue, 13 Feb 2024 10:54:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/25] mm: Make pte_next_pfn() a wrapper around
 pte_advance_pfn()
To: Ryan Roberts <ryan.roberts@arm.com>,
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
 <cdf4e537-5b0d-45ba-8094-527127c791a6@arm.com>
 <828d2573-b5fe-43b3-b955-944c05bcdb60@redhat.com>
 <3bc05163-2671-4239-ae5a-b9207fdca459@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <3bc05163-2671-4239-ae5a-b9207fdca459@arm.com>
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
Cc: linux-mm@kvack.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12.02.24 22:34, Ryan Roberts wrote:
> On 12/02/2024 14:29, David Hildenbrand wrote:
>> On 12.02.24 15:10, Ryan Roberts wrote:
>>> On 12/02/2024 12:14, David Hildenbrand wrote:
>>>> On 02.02.24 09:07, Ryan Roberts wrote:
>>>>> The goal is to be able to advance a PTE by an arbitrary number of PFNs.
>>>>> So introduce a new API that takes a nr param.
>>>>>
>>>>> We are going to remove pte_next_pfn() and replace it with
>>>>> pte_advance_pfn(). As a first step, implement pte_next_pfn() as a
>>>>> wrapper around pte_advance_pfn() so that we can incrementally switch the
>>>>> architectures over. Once all arches are moved over, we will change all
>>>>> the core-mm callers to call pte_advance_pfn() directly and remove the
>>>>> wrapper.
>>>>>
>>>>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>>>>> ---
>>>>>     include/linux/pgtable.h | 8 +++++++-
>>>>>     1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>>>> index 5e7eaf8f2b97..815d92dcb96b 100644
>>>>> --- a/include/linux/pgtable.h
>>>>> +++ b/include/linux/pgtable.h
>>>>> @@ -214,9 +214,15 @@ static inline int pmd_dirty(pmd_t pmd)
>>>>>         #ifndef pte_next_pfn
>>>>> +#ifndef pte_advance_pfn
>>>>> +static inline pte_t pte_advance_pfn(pte_t pte, unsigned long nr)
>>>>> +{
>>>>> +    return __pte(pte_val(pte) + (nr << PFN_PTE_SHIFT));
>>>>> +}
>>>>> +#endif
>>>>>     static inline pte_t pte_next_pfn(pte_t pte)
>>>>>     {
>>>>> -    return __pte(pte_val(pte) + (1UL << PFN_PTE_SHIFT));
>>>>> +    return pte_advance_pfn(pte, 1);
>>>>>     }
>>>>>     #endif
>>>>>     
>>>>
>>>> I do wonder if we simply want to leave pte_next_pfn() around? Especially patch
>>>> #4, #6 don't really benefit from the change? So are the other set_ptes()
>>>> implementations.
>>>>
>>>> That is, only convert all pte_next_pfn()->pte_advance_pfn(), and leave a
>>>> pte_next_pfn() macro in place.
>>>>
>>>> Any downsides to that?
>>>
>>> The downside is just having multiple functions that effectively do the same
>>> thing. Personally I think its cleaner and easier to understand the code with
>>> just one generic function which we pass 1 to it where we only want to advance by
>>> 1. In the end, there are only a couple of places where pte_advance_pfn(1) is
>>> used, so doesn't really seem valuable to me to maintain a specialization.
>>
>> Well, not really functions, just a macro. Like we have set_pte_at() translating
>> to set_ptes().
>>
>> Arguably, we have more callers of set_pte_at().
>>
>> "Easier to understand", I don't know. :)
>>
>>>
>>> Unless you feel strongly that we need to keep pte_next_pfn() then I'd prefer to
>>> leave it as I've done in this series.
>>
>> Well, it makes you patch set shorter and there is less code churn.
>>
>> So personally, I'd just leave pte_next_pfn() in there. But whatever you prefer,
>> not the end of the world.
> 
> I thought about this a bit more and remembered that I'm the apprentice so I've
> changed it as you suggested.

Oh, I say stupid things all the time. Please push back if you disagree. :)

[shrinking a patch set if possible and reasonable is often a good idea]

-- 
Cheers,

David / dhildenb

