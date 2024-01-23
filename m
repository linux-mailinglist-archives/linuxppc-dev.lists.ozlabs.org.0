Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ECE838D84
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 12:34:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SOUQ6Y1N;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SOUQ6Y1N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK4kF74ZQz3dS9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 22:34:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SOUQ6Y1N;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SOUQ6Y1N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TK4jT37P1z3cXq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 22:33:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706009626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uYc245fmLpfbj4/lgjLqWN/cr5PYPrgDXzu14mAh+7Q=;
	b=SOUQ6Y1NEAv8LkBx82IkYy7m2yR910N5mgdeD2kECAvYJPc4/mVezrB8/AUX5ajy2YlMeq
	HuoIxNlmn4R7IThPTyj2CYeZYeGxRLGE3Q6HJUEQ8iVVW2kx/l/9dqPpHroxSxOZBUGLKY
	V5YLh+ZUqlgQc/mdEkAlS9dpHp9uPvw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706009626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uYc245fmLpfbj4/lgjLqWN/cr5PYPrgDXzu14mAh+7Q=;
	b=SOUQ6Y1NEAv8LkBx82IkYy7m2yR910N5mgdeD2kECAvYJPc4/mVezrB8/AUX5ajy2YlMeq
	HuoIxNlmn4R7IThPTyj2CYeZYeGxRLGE3Q6HJUEQ8iVVW2kx/l/9dqPpHroxSxOZBUGLKY
	V5YLh+ZUqlgQc/mdEkAlS9dpHp9uPvw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-S9GKwGdeNAiUh6dDwYh7CQ-1; Tue, 23 Jan 2024 06:33:44 -0500
X-MC-Unique: S9GKwGdeNAiUh6dDwYh7CQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-40eb6ce1ddaso5588305e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 03:33:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706009623; x=1706614423;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYc245fmLpfbj4/lgjLqWN/cr5PYPrgDXzu14mAh+7Q=;
        b=D45SWLbIkSEbPctvSMC09sjOOtLoe4Sa5LW+aV3qplLVMTfcgk5ENChZ19AquU/fQm
         EZrtQAi+bKz1ND0vTYx2eNTF/51ydWcmXSPUGgV/CUDeozzvWWiNRf9BeHOnHVpunDx5
         XO3niZN7YkU9ijTpuCO9gqy/2rrIf1r5AuMyneDT+wv3Hy6lLleMZCjKUMhrGJjidW0t
         bWc7BYz1EDwO/RnWOInG66nH7GCxuIFp/RedTYhLREekROK1Z/RNzeeg9dTaNTFaad4z
         1L8/mb8VzTpaz+ufBwq0ybB9mbwzCQNz99tqPmXTW6vHNxFpiypvUGCDsI8GLfU8xrwd
         Jv0Q==
X-Gm-Message-State: AOJu0YyNWSi3Ffk9kUViOGwh1kfIzeLN5o91rhevJIZ9mqT2xodxhFqY
	yKYyYCa5gRMMV3zXvP+mqNs1ZeaqWzT/i88cuvba2SyKJELx/z3cyYIrC2m+w7hoRMa/vGIXvnU
	+HxLZuaX8jzCCZvlKSKRhapQAUPTzj2eQCWnQzUFmD0dQm9JxUM2ATEQU/0w/ZnY=
X-Received: by 2002:a05:600c:18a6:b0:40e:4806:7f9b with SMTP id x38-20020a05600c18a600b0040e48067f9bmr227457wmp.307.1706009623416;
        Tue, 23 Jan 2024 03:33:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFJvXfwJB2xAbV09x8KiTq4J32uzT4FvDsoae6ebynNFGjmyUFY1Tg60erzHgnrvVXUOqPHw==
X-Received: by 2002:a05:600c:18a6:b0:40e:4806:7f9b with SMTP id x38-20020a05600c18a600b0040e48067f9bmr227451wmp.307.1706009622974;
        Tue, 23 Jan 2024 03:33:42 -0800 (PST)
Received: from ?IPV6:2003:cb:c741:de00:bf0f:cd46:dc1c:2de9? (p200300cbc741de00bf0fcd46dc1c2de9.dip0.t-ipconnect.de. [2003:cb:c741:de00:bf0f:cd46:dc1c:2de9])
        by smtp.gmail.com with ESMTPSA id e7-20020a5d4e87000000b00337d56264d4sm13181557wru.8.2024.01.23.03.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 03:33:42 -0800 (PST)
Message-ID: <08607590-3115-46e6-8f1f-bcc60c33cc20@redhat.com>
Date: Tue, 23 Jan 2024 12:33:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] arm/pgtable: define PFN_PTE_SHIFT on arm and
 arm64
To: Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-2-david@redhat.com>
 <fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com>
 <46080ac1-7789-499b-b7f3-0231d7bd6de7@redhat.com>
 <02d42161-a867-424d-bef8-efd67d592cbc@redhat.com>
 <75e99c49-734a-47f4-b7a5-7e346bd2487b@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <75e99c49-734a-47f4-b7a5-7e346bd2487b@arm.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23.01.24 12:17, Ryan Roberts wrote:
> On 23/01/2024 11:02, David Hildenbrand wrote:
>> On 23.01.24 11:48, David Hildenbrand wrote:
>>> On 23.01.24 11:34, Ryan Roberts wrote:
>>>> On 22/01/2024 19:41, David Hildenbrand wrote:
>>>>> We want to make use of pte_next_pfn() outside of set_ptes(). Let's
>>>>> simpliy define PFN_PTE_SHIFT, required by pte_next_pfn().
>>>>>
>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>> ---
>>>>>     arch/arm/include/asm/pgtable.h   | 2 ++
>>>>>     arch/arm64/include/asm/pgtable.h | 2 ++
>>>>>     2 files changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
>>>>> index d657b84b6bf70..be91e376df79e 100644
>>>>> --- a/arch/arm/include/asm/pgtable.h
>>>>> +++ b/arch/arm/include/asm/pgtable.h
>>>>> @@ -209,6 +209,8 @@ static inline void __sync_icache_dcache(pte_t pteval)
>>>>>     extern void __sync_icache_dcache(pte_t pteval);
>>>>>     #endif
>>>>>     +#define PFN_PTE_SHIFT        PAGE_SHIFT
>>>>> +
>>>>>     void set_ptes(struct mm_struct *mm, unsigned long addr,
>>>>>                   pte_t *ptep, pte_t pteval, unsigned int nr);
>>>>>     #define set_ptes set_ptes
>>>>> diff --git a/arch/arm64/include/asm/pgtable.h
>>>>> b/arch/arm64/include/asm/pgtable.h
>>>>> index 79ce70fbb751c..d4b3bd96e3304 100644
>>>>> --- a/arch/arm64/include/asm/pgtable.h
>>>>> +++ b/arch/arm64/include/asm/pgtable.h
>>>>> @@ -341,6 +341,8 @@ static inline void __sync_cache_and_tags(pte_t pte,
>>>>> unsigned int nr_pages)
>>>>>             mte_sync_tags(pte, nr_pages);
>>>>>     }
>>>>>     +#define PFN_PTE_SHIFT        PAGE_SHIFT
>>>>
>>>> I think this is buggy. And so is the arm64 implementation of set_ptes(). It
>>>> works fine for 48-bit output address, but for 52-bit OAs, the high bits are not
>>>> kept contigously, so if you happen to be setting a mapping for which the
>>>> physical memory block straddles bit 48, this won't work.
>>>
>>> Right, as soon as the PTE bits are not contiguous, this stops working,
>>> just like set_ptes() would, which I used as orientation.
>>>
>>>>
>>>> Today, only the 64K base page config can support 52 bits, and for this,
>>>> OA[51:48] are stored in PTE[15:12]. But 52 bits for 4K and 16K base pages is
>>>> coming (hopefully v6.9) and in this case OA[51:50] are stored in PTE[9:8].
>>>> Fortunately we already have helpers in arm64 to abstract this.
>>>>
>>>> So I think arm64 will want to define its own pte_next_pfn():
>>>>
>>>> #define pte_next_pfn pte_next_pfn
>>>> static inline pte_t pte_next_pfn(pte_t pte)
>>>> {
>>>>      return pfn_pte(pte_pfn(pte) + 1, pte_pgprot(pte));
>>>> }
>>>>
>>
>> Digging into the details, on arm64 we have:
>>
>> #define pte_pfn(pte)           (__pte_to_phys(pte) >> PAGE_SHIFT)
>>
>> and
>>
>> #define __pte_to_phys(pte)     (pte_val(pte) & PTE_ADDR_MASK)
>>
>> But that implies, that upstream the PFN is always contiguous, no?
>>
> 
> 
> But __pte_to_phys() and __phys_to_pte_val() depend on a Kconfig. If PA bits is
> 52, the bits are not all contiguous:
> 
> #ifdef CONFIG_ARM64_PA_BITS_52
> static inline phys_addr_t __pte_to_phys(pte_t pte)
> {
> 	return (pte_val(pte) & PTE_ADDR_LOW) |
> 		((pte_val(pte) & PTE_ADDR_HIGH) << PTE_ADDR_HIGH_SHIFT);
> }
> static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
> {
> 	return (phys | (phys >> PTE_ADDR_HIGH_SHIFT)) & PTE_ADDR_MASK;
> }
> #else
> #define __pte_to_phys(pte)	(pte_val(pte) & PTE_ADDR_MASK)
> #define __phys_to_pte_val(phys)	(phys)
> #endif
> 

Ah, how could I've missed that. Agreed, set_ptes() and this patch are 
broken.

Do you want to send a patch to implement pte_next_pfn() on arm64, and 
then use pte_next_pfn() in set_ptes()? Then I can drop this patch here 
completely from this series.

-- 
Cheers,

David / dhildenb

