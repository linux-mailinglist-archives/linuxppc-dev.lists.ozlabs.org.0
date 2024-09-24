Return-Path: <linuxppc-dev+bounces-1561-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B34F89840DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 10:45:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCYMw3T4yz2yZZ;
	Tue, 24 Sep 2024 18:45:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727167516;
	cv=none; b=I5Wi/8pRYr6CskSqosvBZ3xlb1KetI3+oavuMLdvvs+3hYC//HLPxR7uuDY8rX7cbDuPzqH3M+enx6oZv3GkUoPg1eMiete07EAXCQ2iflYj8Y1NFBNO8Vbr8aVLhjlKC5KKYPxMJmPRYMMa4LQa8mB7A0Jg1SleQN+z45U4T5so7sLJqYCCU/lOcY1X3fPsrISFoYs8C7Mm6QZI5dflN1iSdVH39CE20BxPCrgsydrqEmfjW7Sc5ePyhzRku16FCHktPETRljoLI0wgye0Py1iLvKQk+CIeEnFqZpsXlZatbVDScXZ4nM7usjU7VCje72eXxCU6f6epTVmCEe2xSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727167516; c=relaxed/relaxed;
	bh=y2nQE9aToLO8F86J/y/Pv+vvJWva/3rLYd5MS5wex68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Duck7oPM7zDKRhB0G0bw4bDm5bRFZAnnOHg+srDyIicOUjSKR0WWa5xgnd4qiLMz2s3NCKGAkdXUcLfZ/AI4Iy81obTWu000tSwkyDlH80eQ4TG21RtvUWSHK5qJaO/mh9FWhMYqAswAio+jbbwvrX67XY8GZVFvMWQqxC8vV/rd8WtWEFyaPoXWn6xntetTEAbWflwlTZ51jZRF1Sdj6sYlzQp1XLKgKBz5FAq4EGfj8LoygJTZyOPSzOScCobLBaMj9HJbDXPNg7IkVDQLWNemH0XUBbeyBq+ouvlrfsphe+p3OKGEM3FvIMkXJdBPmp88ZcZAI9xYR/AHP+Jx7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=YvNyJlEb; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=YvNyJlEb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCYMv2scTz2yZN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 18:45:13 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-206aee40676so42246535ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 01:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727167511; x=1727772311; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y2nQE9aToLO8F86J/y/Pv+vvJWva/3rLYd5MS5wex68=;
        b=YvNyJlEbjwRNCMPJXeylZyMgWin/GPPJepizIx4BoeTxN9jxDEzIu0wPu1qGpH6QEg
         HiE4UVpOSjt8Q8tSd7ye24qoDFWdidAAp7pbLJ1gPqVG67uzkzXVKhUauYPjYkcWOtI2
         JQYHypGwahMtyrOzQoPZLNA95qGi8l0BgCiSpc+7yfziskq01kAwsiS+pxtuqwfvLjVg
         Ygfe2xhj2gO0x6DqX4ZfzBZO228B11wswzKrvipt3GppB+vxwyNHCdCT5KMZYOfcVzgn
         LdjTorkjfOVNDQWxHYoA+KjyUaTIKMkjeW5qpoaai8wKwsLYx61x0DWgkJs4c5FMMF0w
         47ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727167511; x=1727772311;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y2nQE9aToLO8F86J/y/Pv+vvJWva/3rLYd5MS5wex68=;
        b=PBtNhlmHIjOeh6FhdkQRY/YLzBp0G0CbmJPc1zgxPVQPBL615FTD2wJ6oYAEDWAkSn
         AjkU2V0XSBVXelp/WGC6fZZ6DVEARszbCvfXqfDcoX2qdhPoXqopyIM5U7NzA/8cQgbf
         jvQMLEnxuNgEoaFqUwM5ca0JbqjfUBnVSPKViH2TjF3sw1tOaPV986wkr/MpcMHVN4OF
         OsDMwRAU5LffIRSPQM5WW0HMWg8/Qy4aLFczsix6Ri5iH6/qls6b5Zsvfylz1Ux6/egb
         YdfGQJJVxwjnU25rleVt/GCCXFJ2GAZBi8b849yb54WyobzwK5+3RVHnFE3Tops+sble
         zMSw==
X-Forwarded-Encrypted: i=1; AJvYcCWVsMHvNl7gLsXwqekM+mGX4e0qtUOsafEvHDJZfntUqql2COILsoEPfbSTumB0Sme+XhUhW9RIlTtq6Y8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwTLL1RWfGq3mECT08zlKz5aQjG/G4Fm7GgbZ3pB/LgMdZneS84
	eixAie6si7EbdtkZck9NHALZcezxSropl9AZL4tLZjAJ2oVJ0vQRdiXYe3Z/5Tk=
X-Google-Smtp-Source: AGHT+IHo2ftEdEocasBZgbxVxDZL2Zt2IqqMpv0cagmh9vhh6c4h0pR5iAzOHA5lidbuQIZfPE+d7A==
X-Received: by 2002:a17:902:e543:b0:206:a574:b4fd with SMTP id d9443c01a7336-208d832a9bbmr214723865ad.9.1727167511212;
        Tue, 24 Sep 2024 01:45:11 -0700 (PDT)
Received: from [10.68.125.128] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af17e3272sm6659695ad.179.2024.09.24.01.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 01:45:10 -0700 (PDT)
Message-ID: <ddc6a307-9520-4f5e-bc41-ef380b0d826a@bytedance.com>
Date: Tue, 24 Sep 2024 16:45:03 +0800
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
Subject: Re: [PATCH v4 10/13] mm: page_vma_mapped_walk: map_pte() use
 pte_offset_map_rw_nolock()
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
Cc: david@redhat.com, hughd@google.com, willy@infradead.org,
 vbabka@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
 vishal.moola@gmail.com, peterx@redhat.com, ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
References: <ecffb7d71363fa79048c0a929780215e0fa93491.1727148662.git.zhengqi.arch@bytedance.com>
 <E2AAD3DA-4C73-4785-939C-13164FA8543D@linux.dev>
 <cccc53fc-29c2-43c0-83d4-d330bade70c7@bytedance.com>
 <2CBAEE27-9C4E-4902-B6BB-B6029FD42E8D@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <2CBAEE27-9C4E-4902-B6BB-B6029FD42E8D@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/9/24 16:39, Muchun Song wrote:
> 
> 
>> On Sep 24, 2024, at 16:33, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>>
>>
>> On 2024/9/24 16:25, Muchun Song wrote:
>>>> On Sep 24, 2024, at 14:11, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>>>
>>>> ﻿In the caller of map_pte(), we may modify the pvmw->pte after acquiring
>>>> the pvmw->ptl, so convert it to using pte_offset_map_rw_nolock(). At
>>>> this time, the pte_same() check is not performed after the pvmw->ptl held,
>>>> so we should get pmdval and do pmd_same() check to ensure the stability of
>>>> pvmw->pmd.
>>>>
>>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>>> ---
>>>> mm/page_vma_mapped.c | 25 ++++++++++++++++++++-----
>>>> 1 file changed, 20 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>>>> index ae5cc42aa2087..6410f29b37c1b 100644
>>>> --- a/mm/page_vma_mapped.c
>>>> +++ b/mm/page_vma_mapped.c
>>>> @@ -13,9 +13,11 @@ static inline bool not_found(struct page_vma_mapped_walk *pvmw)
>>>>     return false;
>>>> }
>>>>
>>>> -static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)
>>>> +static bool map_pte(struct page_vma_mapped_walk *pvmw, pmd_t *pmdvalp,
>>>> +            spinlock_t **ptlp)
>>>> {
>>>>     pte_t ptent;
>>>> +    pmd_t pmdval;
>>> Why declare a new variable? Can’t we use *pmdvalp instead?
>>
>> It's just a coding habit, both are fine for me.
> 
> Agree. But sometime it could make code look a little simpler.
> 
>>
>>>>
>>>>     if (pvmw->flags & PVMW_SYNC) {
>>>>         /* Use the stricter lookup */
>>>> @@ -25,6 +27,7 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)
>>>>         return !!pvmw->pte;
>>>>     }
>>>>
>>>> +again:
>>>>     /*
>>>>      * It is important to return the ptl corresponding to pte,
>>>>      * in case *pvmw->pmd changes underneath us; so we need to
>>>> @@ -32,10 +35,11 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)
>>>>      * proceeds to loop over next ptes, and finds a match later.
>>>>      * Though, in most cases, page lock already protects this.
>>>>      */
>>>> -    pvmw->pte = pte_offset_map_nolock(pvmw->vma->vm_mm, pvmw->pmd,
>>>> -                      pvmw->address, ptlp);
>>>> +    pvmw->pte = pte_offset_map_rw_nolock(pvmw->vma->vm_mm, pvmw->pmd,
>>>> +                         pvmw->address, &pmdval, ptlp);
>>>>     if (!pvmw->pte)
>>>>         return false;
>>>> +    *pmdvalp = pmdval;
> 
> For instance, here, it is unnecessary if pmdvalp is passed directly to
> pte_offset_map_rw_nolock.

OK, will use pmdvalp directly. ;)

> 
>>>>
>>>>     ptent = ptep_get(pvmw->pte);
>>>>
>>>> @@ -67,8 +71,13 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)
>>>>     } else if (!pte_present(ptent)) {
>>>>         return false;
>>>>     }
>>>> +    spin_lock(*ptlp);
>>>> +    if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pvmw->pmd)))) {
>>>> +        pte_unmap_unlock(pvmw->pte, *ptlp);
>>>> +        goto again;
>>>> +    }
>>>>     pvmw->ptl = *ptlp;
>>>> -    spin_lock(pvmw->ptl);
>>>> +
>>>>     return true;
>>>> }
>>>>
>>>> @@ -278,7 +287,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>>>             step_forward(pvmw, PMD_SIZE);
>>>>             continue;
>>>>         }
>>>> -        if (!map_pte(pvmw, &ptl)) {
>>>> +        if (!map_pte(pvmw, &pmde, &ptl)) {
>>>>             if (!pvmw->pte)
>>>>                 goto restart;
>>>>             goto next_pte;
>>>> @@ -307,6 +316,12 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>>>         if (!pvmw->ptl) {
>>>>             pvmw->ptl = ptl;
>>>>             spin_lock(pvmw->ptl);
>>>> +            if (unlikely(!pmd_same(pmde, pmdp_get_lockless(pvmw->pmd)))) {
>>>> +                pte_unmap_unlock(pvmw->pte, pvmw->ptl);
>>>> +                pvmw->ptl = NULL;
>>>> +                pvmw->pte = NULL;
>>>> +                goto restart;
>>>> +            }
>>>>         }
>>>>         goto this_pte;
>>>>     } while (pvmw->address < end);
>>>> --
>>>> 2.20.1
> 
> 

