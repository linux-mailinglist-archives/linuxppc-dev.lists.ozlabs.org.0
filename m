Return-Path: <linuxppc-dev+bounces-1282-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0204397658F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 11:30:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4BxR5fhwz2yPD;
	Thu, 12 Sep 2024 19:30:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726133419;
	cv=none; b=AQe3Xf+aBYBNetmudG8Xz0Ep5ZYEgVtunnkA2YBW7FNEeb6td24y+qHSVczFfu/iRg4+LhJhdrgnXSLQ+akNvzx3T2oWFWZuHWA6ov8ABT3V3Dka2tDm3Aj7Ux7BW8xW4WI0DNW4TdDZzL3wRsl3Mh0iRY8xtAar4SN+Nnh8AZHIp2EIRT1+r1VoEJdC00j3+iTg2nUtwJ1XRTe/UmxFueDtDM5piFHSKJSv3kxQx0pdhyTUL8mVT15kLbFlNwDK/L4j/EYnjXio0TvDEAIEJU/NHoP/Iqr7FGBir8Od5VjwtvNdR5y8/zWwgBu+NF/NSJ1dTOFXuJAu/L7a+2JNBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726133419; c=relaxed/relaxed;
	bh=ae1rrTLdcInpIDAaqOOlwPE8rza0PubUwEN95o/QYrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lw/MN78UhTIv5i71gK9QwV8OIZt9mX5TEN0rbiol49VmNFgHRkBYgcYm7ubnmqNXwGBG88N/PG55QrzNheDax0Kxe+Ft6gJ5p1qWd1hZSzQ7SgoykcqVkB64gkfJRBXu1hoIv+P4K0jX+++MMp+Ts+wc7DmjEbqT3pppcUGKMaGL+S17dnxLXZbRRdVDgNW02ONCdNwfz8PL+138QgSJJKusfNwQFH5t6HM1hMhrldrg8IN0qat1dECkznR1lzETPw/w2IBL8ykaXBSvpzXXXvvLwp2Djmyk6dI+JgFSygXscyA6KoUkt+KYHdtMU8vBQrS1ZwmNoTaq/gJ1POHAgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=bV+1m7it; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=bV+1m7it;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4BxR42wLz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 19:30:19 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7d4fa972cbeso596899a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 02:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1726133417; x=1726738217; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ae1rrTLdcInpIDAaqOOlwPE8rza0PubUwEN95o/QYrw=;
        b=bV+1m7itNdMMmMBB+FmxGWFKwKKCbV1Dzbnv50UPKmv0dSVNnJBzIxIwV99MSNMcNo
         ZNvJ9PjQ/evBeZAtx7AxfCpmCPLfRHC153QJAFG7nnkZ5zo7KJESAs+62GITs3BknR/G
         cvpdLocExGCD+IbMbdvTHRv9I+2owawoW+ujKuHypnryI1QM0sO8n4qeJVfXluP1Z+5k
         zGaJB4BtTa8lbYwg0C0LvWUr6Jyj74Gijs1NaeBzyx8OoPeRyleU1teY7JOaC8hsCND/
         Ih0dbjR43qVVW7IJ/rzMqL0WXCB4QgwRBSHXnmolB/+Cy6d7nHcQG9RKvYiJjPzu4eHZ
         F8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726133417; x=1726738217;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ae1rrTLdcInpIDAaqOOlwPE8rza0PubUwEN95o/QYrw=;
        b=LEpQIoU1OYasLYMN12o7zUNLKvzCOpLui8PmGrjBBEqFNO4jgzgrZ3Jp5KL6mPrP78
         4ada7BRjGztT5Q0D3r0g1I8v4613xAeUrDDDW6yjS8dfve3G7BJZU34OJx/a07sbyy92
         aKDg9M7GqTeuBJzEE26H0QCu/HwOONY9c/GUw83JYqroTpKKZsgD9teJPL1Q9KQtTOfi
         YWwXVawrYAQQ/3pZ/eHMkYVz5tUQkwO3DyNcAa0eGiGQ8im9kXmzdwYrKDhujPyVCAah
         ya0svIUXsOwlwUFDRJ8+KYYdAbcRl6x1kU1TcvtDk6Vrkc+zuqCaMIzCKPTS8Lg0bAJK
         Vi7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdNsQB026avyjcda2oDQzlsOYwBJK9kV7s8jOqSnWQpfqHmjn4pCb84uq4GvIm8eBbJ9lPBZVcD4vJVDs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyf+TkMu50Wrd/fWOYVOJljlQrbQkVpE6Hm7QjCezm5D/faY10b
	Ei5EKdKr37ruwqxd36nyyusUUIlRg2R9OeQvJX39Q5Ltdou2oW21yS86qhfjURY=
X-Google-Smtp-Source: AGHT+IFJCCHYcScGtt9lkjkAEywijnfIDFZg65ZPBIHqm1dzEPdlJO7/znVrMR8ooIQDztKe568nrw==
X-Received: by 2002:a05:6a21:6b0a:b0:1cf:509c:496b with SMTP id adf61e73a8af0-1cf761e553bmr3124497637.38.1726133417121;
        Thu, 12 Sep 2024 02:30:17 -0700 (PDT)
Received: from [10.4.59.158] ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db043c0672sm9995203a91.22.2024.09.12.02.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 02:30:16 -0700 (PDT)
Message-ID: <7782bc62-a09f-465a-aa43-8179542ecc02@bytedance.com>
Date: Thu, 12 Sep 2024 17:30:10 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/14] mm: page_vma_mapped_walk: map_pte() use
 pte_offset_map_rw_nolock()
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 david@redhat.com, hughd@google.com, willy@infradead.org, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com, christophe.leroy2@cs-soprasteria.com
References: <20240904084022.32728-1-zhengqi.arch@bytedance.com>
 <20240904084022.32728-11-zhengqi.arch@bytedance.com>
 <d373689b-a3f2-4c45-b291-85c58289f044@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <d373689b-a3f2-4c45-b291-85c58289f044@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/9/5 20:07, Muchun Song wrote:
> 
> 
> On 2024/9/4 16:40, Qi Zheng wrote:
>> In the caller of map_pte(), we may modify the pvmw->pte after acquiring
>> the pvmw->ptl, so convert it to using pte_offset_map_rw_nolock(). At
>> this time, the pte_same() check is not performed after the pvmw->ptl 
>> held,
>> so we should get pmdval and do pmd_same() check to ensure the 
>> stability of
>> pvmw->pmd.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>   mm/page_vma_mapped.c | 24 ++++++++++++++++++++----
>>   1 file changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>> index ae5cc42aa2087..f1d73fd448708 100644
>> --- a/mm/page_vma_mapped.c
>> +++ b/mm/page_vma_mapped.c
>> @@ -13,9 +13,11 @@ static inline bool not_found(struct 
>> page_vma_mapped_walk *pvmw)
>>       return false;
>>   }
>> -static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t 
>> **ptlp)
>> +static bool map_pte(struct page_vma_mapped_walk *pvmw, pmd_t *pmdvalp,
>> +            spinlock_t **ptlp)
>>   {
>>       pte_t ptent;
>> +    pmd_t pmdval;
>>       if (pvmw->flags & PVMW_SYNC) {
>>           /* Use the stricter lookup */
>> @@ -25,6 +27,7 @@ static bool map_pte(struct page_vma_mapped_walk 
>> *pvmw, spinlock_t **ptlp)
>>           return !!pvmw->pte;
>>       }
>> +again:
>>       /*
>>        * It is important to return the ptl corresponding to pte,
>>        * in case *pvmw->pmd changes underneath us; so we need to
>> @@ -32,10 +35,11 @@ static bool map_pte(struct page_vma_mapped_walk 
>> *pvmw, spinlock_t **ptlp)
>>        * proceeds to loop over next ptes, and finds a match later.
>>        * Though, in most cases, page lock already protects this.
>>        */
>> -    pvmw->pte = pte_offset_map_nolock(pvmw->vma->vm_mm, pvmw->pmd,
>> -                      pvmw->address, ptlp);
>> +    pvmw->pte = pte_offset_map_rw_nolock(pvmw->vma->vm_mm, pvmw->pmd,
>> +                         pvmw->address, &pmdval, ptlp);
>>       if (!pvmw->pte)
>>           return false;
>> +    *pmdvalp = pmdval;
>>       ptent = ptep_get(pvmw->pte);
>> @@ -69,6 +73,12 @@ static bool map_pte(struct page_vma_mapped_walk 
>> *pvmw, spinlock_t **ptlp)
>>       }
>>       pvmw->ptl = *ptlp;
>>       spin_lock(pvmw->ptl);
>> +
>> +    if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pvmw->pmd)))) {
>> +        spin_unlock(pvmw->ptl);
> 
> Forgot to clear pvmw->ptl? Or how about moving the assignment for it
> to the place where the pmd_same check is successful?
> 
>> +        goto again;
>> +    }
>> +
> 
> Maybe here is the right place to assign pvmw->ptl.

Right, will do in the v4.

> 
> Muchun,
> Thanks.
> 
>>       return true;
>>   }
>> @@ -278,7 +288,7 @@ bool page_vma_mapped_walk(struct 
>> page_vma_mapped_walk *pvmw)
>>               step_forward(pvmw, PMD_SIZE);
>>               continue;
>>           }
>> -        if (!map_pte(pvmw, &ptl)) {
>> +        if (!map_pte(pvmw, &pmde, &ptl)) {
>>               if (!pvmw->pte)
>>                   goto restart;
>>               goto next_pte;
>> @@ -307,6 +317,12 @@ bool page_vma_mapped_walk(struct 
>> page_vma_mapped_walk *pvmw)
>>           if (!pvmw->ptl) {
>>               pvmw->ptl = ptl;
>>               spin_lock(pvmw->ptl);
>> +            if (unlikely(!pmd_same(pmde, 
>> pmdp_get_lockless(pvmw->pmd)))) {
>> +                pte_unmap_unlock(pvmw->pte, pvmw->ptl);
>> +                pvmw->ptl = NULL;
>> +                pvmw->pte = NULL;
>> +                goto restart;
>> +            }
>>           }
>>           goto this_pte;
>>       } while (pvmw->address < end);
> 

