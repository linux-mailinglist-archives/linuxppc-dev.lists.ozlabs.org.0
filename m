Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB04785191D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 17:28:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z/C7+Pk5;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NGFkvIK1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYVJZ66Ymz3dRV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 03:28:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z/C7+Pk5;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NGFkvIK1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYVHs51nDz2xFt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 03:28:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707755286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=u9+rwPAvqYLW6lsheKf2xHocBNG2KMyghJEaP/POFlg=;
	b=Z/C7+Pk5jpaRm6vBc2QsyWrt81POKyi5rLK4lhnIHOdG2GBMiQ7H9luxeWR0NNsOe0h/kt
	pDyWzadsc3UioDUK2L7glj2yOVsVIYxJyqPBK+Wvqje1uG1oVZpRjsO4auv6q7+Yit4Ew7
	Hznj3dI5lET72RfH4Y6/PkjlMgFcCU4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707755287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=u9+rwPAvqYLW6lsheKf2xHocBNG2KMyghJEaP/POFlg=;
	b=NGFkvIK1isIqWJiWuk4gi6s81eEC3W4dUzUOvdbU84RKuqF65KYOQ6jKU8VCa40Jws/llu
	CtKn/sJDRhTbk8dewqJYovtl9eZP3VncJHpF2OLMbZaqyDhx+InFRUbUB5Y16eig1EdAQu
	s1ulStmS8KC+J4Erxl0HfbD8B6motX0=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-g8Cl0z_aNA2GxHVi2rmnkQ-1; Mon, 12 Feb 2024 11:28:03 -0500
X-MC-Unique: g8Cl0z_aNA2GxHVi2rmnkQ-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-51156c3208cso3070499e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 08:28:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707755282; x=1708360082;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9+rwPAvqYLW6lsheKf2xHocBNG2KMyghJEaP/POFlg=;
        b=FOYBjoTfbMc/5jvOEU2vRiGkZY2V/VjKloJtn+zovvdivugLWD376vPvc4/r9MaqQx
         3uXtF5DzsJJSpeHbGPJNtatCo6iuhz8jU2OJHYLfl+ssFEQxVnz7lUlpA0jlrZNS/ONr
         19McGYm+EV09RVkYAcbvMAlTSImiT9OlmZych014iYQVnk5zaYScaL0mB10EuNXQRymT
         WbXa5QW4Bv+oV/aS+KknVivuOIu14gF30pSymcs8K6rN0hIdrudeAYUzNbb+EkD5bX9G
         o6tvn3zLWe+6e0s+yKnHFBmnczgCCvzRByXl4Ro5S/twayYg1QlQl/GK60CBxmMdKszY
         k8Sw==
X-Gm-Message-State: AOJu0YzGVNxA8cDTK3Kc47adol1LVlq0e8pvDnig9Hmjafh5bh91XzNd
	ppMW4/uu1Fi+E4j+9JS6ynao0I7Ir87FduckwRjk1Au11XbypTVDhc0cyZggxr7z1lVu5kH4qRq
	64ccxFO3w1OlOfOv9eZqBxl7pt+7BUr5l25USCLplGd2Wbe+B9JLWeDTr7mwWdaA=
X-Received: by 2002:a05:6512:2821:b0:511:80b2:ed55 with SMTP id cf33-20020a056512282100b0051180b2ed55mr4831652lfb.59.1707755281908;
        Mon, 12 Feb 2024 08:28:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuYVuTYBC14h4sDYzW/aLl/U8JwyGrVD3/cs/GfW/IzGs0rP7kN9naIVg2GjA3q6fMPds/aw==
X-Received: by 2002:a05:6512:2821:b0:511:80b2:ed55 with SMTP id cf33-20020a056512282100b0051180b2ed55mr4831623lfb.59.1707755281417;
        Mon, 12 Feb 2024 08:28:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW6NOXchB0acazCLbctM1UoRBCugQgjPPJhRRiC1g5Sbj6NKcFNuDaUj46wAre8TPuXrzks6w4FihqKW86lCAl+IMM7iAcXNSDuxwYOmBSFODdmdW43kAeymJ6feUUTBvGVxUsHWjQGEpkz5Vk/hFieQBKjzP0Js5DoYkopIRCOOf/HXlnfDpqumPB5S+NKyOENV18FmEdzBLDrWKca50cH4hWVoV9NXILE4UMZzqMBmaSs9hH/AST9Iixynm4tJeXHL71wGZLBNWkUuRJBEsQC74+noXFcEW1wJaQvp6gMkzaNKupU/Bn24Oj16MDggifZsJ68YKKeSvyS2bzMisj3SWgBBY7DbruPR0+48l2CIebzf9l9YjS8v/X31bZkOYgEzZv4YNyMFOHbnLMVUqSJTLDEIuWG0x5qCsyMrMUSsXZCTJbAe5hYjZUuqassyP6DRW8OCjoKJqiad/j/UMmIdjUs1xK845kB1phH9V+z49gEOHNlusnksQ7kYyK5cHDgAFWZeJWJMaY/UJYWN5t0RQMtbpaCOsxe7A/gFrGYVHsQaToqOS9VImv7ttR92359l2iiYwMvIh40PfBGu1cajiBrPDxPwZVcEMbUyHX9PsJDK3Rq1vYqFNYGH3aRArVEcuvLaJPu7M+2SUFTFLRfA5Dfsi+VXrbdIdR9xDyPsvmEyWZtdc18ca/J4lgiw3Te3fcKNGA5NIFGGpp/27plke07gcpWZXKUZGmK2gfc420fWKOqYbwDvAjLjefs8jZGjbvLj3nXQteA/DospYVTO2YhqTukcAmRlDSjdMK36BaL13avvU2+pzyuxb18o9/qMOAafoJrlsSYONRvgEPrlbqwahY0Q7rd0FH1UNRm
Received: from ?IPV6:2003:cb:c730:2200:7229:83b1:524e:283a? (p200300cbc7302200722983b1524e283a.dip0.t-ipconnect.de. [2003:cb:c730:2200:7229:83b1:524e:283a])
        by smtp.gmail.com with ESMTPSA id jj19-20020a05600c6a1300b0040fccf7e8easm9024482wmb.36.2024.02.12.08.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 08:28:00 -0800 (PST)
Message-ID: <cc6cd016-0d91-428d-8041-329d5400978e@redhat.com>
Date: Mon, 12 Feb 2024 17:27:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 22/25] mm: Add pte_batch_hint() to reduce scanning in
 folio_pte_batch()
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
 <20240202080756.1453939-23-ryan.roberts@arm.com>
 <6d452a1a-1edc-4e97-8b39-99dc48315bb8@redhat.com>
 <82c59a7f-328e-4521-8855-ccacc3dc4ce5@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <82c59a7f-328e-4521-8855-ccacc3dc4ce5@arm.com>
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

On 12.02.24 16:47, Ryan Roberts wrote:
> On 12/02/2024 13:43, David Hildenbrand wrote:
>> On 02.02.24 09:07, Ryan Roberts wrote:
>>> Some architectures (e.g. arm64) can tell from looking at a pte, if some
>>> follow-on ptes also map contiguous physical memory with the same pgprot.
>>> (for arm64, these are contpte mappings).
>>>
>>> Take advantage of this knowledge to optimize folio_pte_batch() so that
>>> it can skip these ptes when scanning to create a batch. By default, if
>>> an arch does not opt-in, folio_pte_batch() returns a compile-time 1, so
>>> the changes are optimized out and the behaviour is as before.
>>>
>>> arm64 will opt-in to providing this hint in the next patch, which will
>>> greatly reduce the cost of ptep_get() when scanning a range of contptes.
>>>
>>> Tested-by: John Hubbard <jhubbard@nvidia.com>
>>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>>> ---
>>>    include/linux/pgtable.h | 18 ++++++++++++++++++
>>>    mm/memory.c             | 20 +++++++++++++-------
>>>    2 files changed, 31 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>> index 50f32cccbd92..cba31f177d27 100644
>>> --- a/include/linux/pgtable.h
>>> +++ b/include/linux/pgtable.h
>>> @@ -212,6 +212,24 @@ static inline int pmd_dirty(pmd_t pmd)
>>>    #define arch_flush_lazy_mmu_mode()    do {} while (0)
>>>    #endif
>>>    +#ifndef pte_batch_hint
>>> +/**
>>> + * pte_batch_hint - Number of pages that can be added to batch without scanning.
>>> + * @ptep: Page table pointer for the entry.
>>> + * @pte: Page table entry.
>>> + *
>>> + * Some architectures know that a set of contiguous ptes all map the same
>>> + * contiguous memory with the same permissions. In this case, it can provide a
>>> + * hint to aid pte batching without the core code needing to scan every pte.
>>
>> I think we might want to document here the expectation regarding
>> dirty/accessed bits. folio_pte_batch() will ignore dirty bits only with
>> FPB_IGNORE_DIRTY. But especially for arm64, it makes sense to ignore them
>> always when batching, because the dirty bit may target any pte part of the
>> cont-pte group either way.
>>
>> Maybe something like:
>>
>> "
>> An architecture implementation may only ignore the PTE accessed and dirty bits.
>> Further, it may only ignore the dirty bit if that bit is already not
>> maintained with precision per PTE inside the hinted batch, and ptep_get()
>> would already have to collect it from various PTEs.
>> "
> 
> I'm proposing to simplify this to:
> 
> "
> An architecture implementation may ignore the PTE accessed state. Further, the
> dirty state must apply atomically to all the PTEs described by the hint.
> "
> 
> Which I think more accurately describes the requirement. Shout if you disagree.

I'm not 100% sure if the "must apply atomically" is clear without all of 
the cont-pte details and ptep_get(). But I fail to describe it in a 
better way.

It's all better compared to what we had before, so LGTM :)

-- 
Cheers,

David / dhildenb

