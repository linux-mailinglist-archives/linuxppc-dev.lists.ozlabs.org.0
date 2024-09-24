Return-Path: <linuxppc-dev+bounces-1563-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C080898414A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 10:59:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCYhG59cjz2ydG;
	Tue, 24 Sep 2024 18:59:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727168366;
	cv=none; b=dTwFrWEiA96tcRjd1B7BrXV4oN4Vkh12JATTbWBD4g4GNovN7p/cemdiiVMDSp0UlAsOU8RHc/4IGt8v5wrKY57MWHU7uVBbwsrgbhPDyvzfWyiixsfA7OA0wvgu3xlKvhR2tQBY8UWKyF0366p0PKrzMJB/cGcsXgeg4azmkP3oWDEHgrM9bYReia75yL+AyY2CXJIjzHzv4sB8QRccMClu2m97jiJsBFVlylUzDDmc09MdVRAMgwgcnX/qYNb87lyawLNJaYHdl1clQ30FTM5YUwDyY3u5eEljEIZ/yg9RHkrs332hd5z8RT6dvqrTwa9qCfKk1QakjOt0k65daw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727168366; c=relaxed/relaxed;
	bh=QSXX1w262DUfqPKLFb36PgSphjvIhfOKOam/+YmTh4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8EXyn5YHpe9SRCB6VfJLBwPEtgrT+wehNTzgVWc0LxnsMupLAe+0x2/N8v1QMbrb7ET/RETu0e7QDEAV3qMiJET9hk/i1WiyXs4KvV/iP2XhPOYvfCSaoU3WNbOLQ6trjxQfpLwFK+R5IoVsHfKXPUsV3kQ1VQdYay/78vUzOwE+6hzSYtzGrO0dMY/rZm0O1V+GYqFBHGmzGKaLOXY0pDotRR/jMAiVN6ByGgoXXLTnA+OtVfqKJWPlYP5L9lPDMDbCSio2qZTpJdrqobAqv8Ts7RSE/2MUNQT8bnyBWIDQxCWeLrAcGs9vHz51M3iNosn97+ZSyX1HqCrcEXCZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=UuH9WikL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=UuH9WikL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCYhF3pzPz2yZd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 18:59:23 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2068a7c9286so52490925ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 01:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727168362; x=1727773162; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QSXX1w262DUfqPKLFb36PgSphjvIhfOKOam/+YmTh4c=;
        b=UuH9WikL10VWxZvMXiqh/n94l34uTrzUjZDw60d9rBowsIxKJ/M3GZro19slJ9BU3X
         JEc2Wk2nHnDz9GJViAuIAbwltykHhFmmlOoPEhmhfIJ4MISWb6yfnjvaFyPr+kxY9q6w
         SEOz1TbuXCVVJKsDu9QARIVwwI/fp9SgnbUSjKfjvb7jCQCsKUy4gD2H4dO56lw+xfwT
         xt5u4WUOuusLmJHEkZaavPfaQNMw3rIh3qXFuSCC64Yr83/qZ4m698RvnLnqPEEmejH5
         Mw8sKoL0MRT85KR0l6fPro3XVPA0ZFaGfw2JiY8BJTtS2XHUod833ggSwdcbiaQ1wZpr
         fIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727168362; x=1727773162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QSXX1w262DUfqPKLFb36PgSphjvIhfOKOam/+YmTh4c=;
        b=iOXE2j0NWQWN5atqtcnJAvPXbkjCtD3AipUfZhF6pdN4YDRXnV3LnUG/JeiSrFYWaO
         JNlq2DPDuPCvxZ1djJ+aMkS46ZzEEl3B2MHUIl99hy/QjQlF3rS1P1yPEn8kNuvTLOFo
         HiWVxv2AmGPSEbb2zQCmGOnDbnGsV6t4UIDmcrT5C2vLJxphRZ4oHTdxIvpXYjVoiS6V
         M2mPPN0S+RsT+O+zEGPxCtorqpphJ95ddG2qZGcLZ3VfVahM+g6ibQFvMFHb3BpgnwZa
         xLajk+UjuLnI+wrZfzoFMhOTymizrfqfpaUiVwl1KdcS20Ge4x300m+gO6N2oLG7wvhV
         ooOA==
X-Forwarded-Encrypted: i=1; AJvYcCUBWTKnaqJ7/d1qAYxAwZpCyMDrJTPXaCXnCiT5LThcvkBOVNGwHzfm9S0I+LEl106Tc4wODQI2/wK/Myc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyENKuubVvooo83sLQotfe5NNEmKaEIU+nPIF6G0pFfZRH74mB1
	/TL2Mroif+bRNdfV4dpsEObKIyo+TB9Zgk75VXyReRNGH96wE2eUAjaCsKdljxHV2HgFnehcsUa
	h
X-Google-Smtp-Source: AGHT+IE1grLlneC8F5bJqbHdrkAu/J8WVd5DCX3PtLGmQq2Cc85O00adu9GjKeXTn1BT6ShPfval7Q==
X-Received: by 2002:a17:90a:1f84:b0:2d8:8695:353 with SMTP id 98e67ed59e1d1-2dd7f75890amr15792593a91.41.1727168361821;
        Tue, 24 Sep 2024 01:59:21 -0700 (PDT)
Received: from [10.68.125.128] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e058ee3cd8sm1007596a91.2.2024.09.24.01.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 01:59:21 -0700 (PDT)
Message-ID: <e9b08c12-8212-412f-9dbe-261b06367f6e@bytedance.com>
Date: Tue, 24 Sep 2024 16:57:59 +0800
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
Subject: Re: [PATCH v4 07/13] mm: khugepaged: collapse_pte_mapped_thp() use
 pte_offset_map_rw_nolock()
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
Cc: david@redhat.com, hughd@google.com, willy@infradead.org,
 vbabka@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
 vishal.moola@gmail.com, peterx@redhat.com, ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
References: <07d975c50fe09c246e087303b39998430b1a66bd.1727148662.git.zhengqi.arch@bytedance.com>
 <79699B24-0D99-4051-91F3-5695D32D62AC@linux.dev>
 <2343da2e-f91f-4861-bb22-28f77db98c52@bytedance.com>
 <1D1872F1-7280-4F43-8213-A720C56B0646@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <1D1872F1-7280-4F43-8213-A720C56B0646@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/9/24 16:52, Muchun Song wrote:
> 
> 
>> On Sep 24, 2024, at 15:29, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>>
>>
>> On 2024/9/24 15:14, Muchun Song wrote:
>>>> On Sep 24, 2024, at 14:11, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>>> ﻿In collapse_pte_mapped_thp(), we may modify the pte and pmd entry after
>>>> acquring the ptl, so convert it to using pte_offset_map_rw_nolock(). At
>>>> this time, the pte_same() check is not performed after the PTL held. So we
>>>> should get pgt_pmd and do pmd_same() check after the ptl held.
>>>>
>>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>>> ---
>>>> mm/khugepaged.c | 14 +++++++++++---
>>>> 1 file changed, 11 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>>> index 6498721d4783a..8ab79c13d077f 100644
>>>> --- a/mm/khugepaged.c
>>>> +++ b/mm/khugepaged.c
>>>> @@ -1605,7 +1605,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>>>     if (userfaultfd_armed(vma) && !(vma->vm_flags & VM_SHARED))
>>>>         pml = pmd_lock(mm, pmd);
>>>>
>>>> -    start_pte = pte_offset_map_nolock(mm, pmd, haddr, &ptl);
>>>> +    start_pte = pte_offset_map_rw_nolock(mm, pmd, haddr, &pgt_pmd, &ptl);
>>>>     if (!start_pte)        /* mmap_lock + page lock should prevent this */
>>>>         goto abort;
>>>>     if (!pml)
>>>> @@ -1613,6 +1613,9 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>>>     else if (ptl != pml)
>>>>         spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>>>>
>>>> +    if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd))))
>>>> +        goto abort;
>>>> +
>>>>     /* step 2: clear page table and adjust rmap */
>>>>     for (i = 0, addr = haddr, pte = start_pte;
>>>>          i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
>>>> @@ -1645,7 +1648,6 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>>>         nr_ptes++;
>>>>     }
>>>>
>>>> -    pte_unmap(start_pte);
>>>>     if (!pml)
>>>>         spin_unlock(ptl);
>>>>
>>>> @@ -1658,13 +1660,19 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>>>     /* step 4: remove empty page table */
>>>>     if (!pml) {
>>>>         pml = pmd_lock(mm, pmd);
>>>> -        if (ptl != pml)
>>>> +        if (ptl != pml) {
>>>>             spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>>>> +            if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd)))) {
>>>> +                spin_unlock(pml);
>>>> +                goto abort;
>>> Drop the reference of folio and the mm counter twice at the label of abort and the step 3.
>>
>> My bad, should set nr_ptes to 0 and call flush_tlb_mm() here, right?
> 
> Or add a new label "out" just below the "abort". Then go to out.

For this way, we also need to call flush_tlb_mm() first, like the
following:

if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd)))) {
	spin_unlock(pml);
	flush_tlb_mm(mm);
	goto out;
}

> 
>>
>>>> +            }
>>>> +        }
>>>>     }
>>>>     pgt_pmd = pmdp_collapse_flush(vma, haddr, pmd);
>>>>     pmdp_get_lockless_sync();
>>>>     if (ptl != pml)
>>>>         spin_unlock(ptl);
>>>> +    pte_unmap(start_pte);
>>>>     spin_unlock(pml);
>>> Why not?
>>> pte_unmap_unlock(start_pte, ptl);
>>> if (pml != ptl)
>>>          spin_unlock(pml);
>>
>> Both are fine, will do.
>>
>> Thanks,
>> Qi
>>
>>>>
>>>>     mmu_notifier_invalidate_range_end(&range);
>>>> --
>>>> 2.20.1
> 
> 

