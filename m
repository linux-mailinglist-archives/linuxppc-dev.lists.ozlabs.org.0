Return-Path: <linuxppc-dev+bounces-1031-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5318D96CF88
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 08:41:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzqXN0DH6z2yks;
	Thu,  5 Sep 2024 16:41:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725518515;
	cv=none; b=GBJ7i5TT9LhX7undxSUR3zxBDcANUlWJh6ZI+KG8Kdvuvd2A/lTdE1mV82t6fJiz73SAjmULbrm1fdNkdzWoxQbuYd4qzDM+7Y5VPxAwOoUQ/HSRqRUCZTZVe01fdKdDn7bFzfcSQXTD3P3e/qD0OA9mEcTRbQKNhiFQg4Depzgr8dTEn66TjhhkIatesVx8QdVoFPFonr7cQzlgR5IW0mZ+OPjIbekd3/6iBIpMghxFQ8WoN70y10KlSeL29tP0DYf2s14apiY56FIzSyWIu8g1bSO4P/vpOy2r5pU2T90RpySgEfaVvg6CEXzmGABkRZo0kjgRVmGkENM1xyeqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725518515; c=relaxed/relaxed;
	bh=WamOeSbvE69odMjKoDapuHUBM0CdYmc1m7bY1qxzMEU=;
	h=DKIM-Signature:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type; b=S0/S4qyfKKx+yqVRg+9pAs9EnumVAUnCDqtyLUsAMhALCW2iQL+lJL1fPY7NjHXLdwGNP80EsBurEJrtxnmCTg2tCW8ietWw0fxZfU49+CBBat+XQXZm6nR59nw/5TSII2NUc0bCq0OBIJw6QGGJcak6gaFpuriOv0GY0I2ST+I3ad93yFflKqVAZTkPqu+ELMV8RnwKituxhhKYPNy0e1HWDNnLiiZ1LF8QSdLl4BRxBH2ypbOc1wmh1IeSwqrkj7DfJCexgDfYwdLahpjVJ4KPvimWbmy1m2kS6tR8x4c9caiEJpTZ7oqnghj/wuBl/2r8dnOCNsQpG6MZD8imfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=FtUaBXdK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=FtUaBXdK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzqXM1bWFz2xst
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 16:41:54 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20573eb852aso10882745ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 23:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1725518513; x=1726123313; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WamOeSbvE69odMjKoDapuHUBM0CdYmc1m7bY1qxzMEU=;
        b=FtUaBXdK4pDqjjWIYgjCK3tPxuLbc+mNSaU16XlLz8/ThuZnUy29/qhBjgnZLkr7qR
         Mz7d2ti49arF0C1EEvGCiHYuEEZCh/K8xZstEMNk+rk0TaxNvynw5UB0ZR1RukYD3gE7
         FSQJZ7IsdOkHYze6nWpSJf4fyJX/+kFOY9N7alPlfpNvKvPtCjwF0DItutP4b/DYOoqi
         aAANtnlGqxLiq60btW1cXAlpA2fKfnP9w6WeIJvy2P38ghOeIh/NRhTpMVRj9BcPGWvq
         YipIbUvzS57JvfCJe5Y5YDHfez3JeiXnmRZAbhR9+dcCQkywwS2z8WVeYfWoDETvxtcO
         jWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725518513; x=1726123313;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WamOeSbvE69odMjKoDapuHUBM0CdYmc1m7bY1qxzMEU=;
        b=ixFpmVYeAySAOuKzfp/2R91Iec0irelhIhBn41VeCgpbaOt5QRC58sIMidcj/epNek
         ae1U8jOgqSmZtBclfkw7efnoTc96tTvds6p4raO/QDsC2ksYj0DzdbNlONtwBrGbd5tO
         Y2Ymc1lmLYLLBihHgi1nv426UW/if70R74FaVQMns+7EfWW0rZSHsoDMNv/KbsWR3aM2
         86v6fDuc3dMlusICzcvwq88MLNC56a6FAO9ZLjZ+yVXB208yCehCjGpaJi8LCqM6i/zK
         YqYcKT0Auo1bQlkVzfAtMbEjnY26Ptu/pg7lF+1HIXtAIjXfA7guA8h1xcbt8RfSb+8B
         xkJA==
X-Forwarded-Encrypted: i=1; AJvYcCUwEm3AUOqNtLKj0HoyPZsS+HynlmLLptMqNkUamcNyJ7xSJIpyNf4MvS3nWTa6naYFr+6kbLnlIWGRUnw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwebHNib/ZgzwnGA2G/cVAzWkAhwIeTeMcvB7+XV5IcI/4aGK2v
	j4u9OjZfX1cahpkxtkbLNS/hf7fEwG/+6IGLAU+pfgcaNZyRK0MkkScBbOcbT28=
X-Google-Smtp-Source: AGHT+IHktKrTh8PvuJAL8kCtov7hkYGbJWjTkWNvKOOeXCvnLHj3NgWJCdo2tCrZ/l2NqbI1yVxHFQ==
X-Received: by 2002:a17:903:41ca:b0:205:9112:6c2d with SMTP id d9443c01a7336-206b7d0021cmr84941475ad.5.1725518512930;
        Wed, 04 Sep 2024 23:41:52 -0700 (PDT)
Received: from [10.4.59.158] ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea37cc2sm22663425ad.160.2024.09.04.23.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 23:41:52 -0700 (PDT)
Message-ID: <7f22c46c-2119-4de6-9d58-efcab05b5751@bytedance.com>
Date: Thu, 5 Sep 2024 14:41:43 +0800
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
Subject: Re: [PATCH v2 07/14] mm: khugepaged: collapse_pte_mapped_thp() use
 pte_offset_map_rw_nolock()
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
Cc: David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Vishal Moola <vishal.moola@gmail.com>, Peter Xu <peterx@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, christophe.leroy2@cs-soprasteria.com,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <c377dab2bf55950e6155ea051aba3887ed5a2773.1724310149.git.zhengqi.arch@bytedance.com>
 <24be821f-a95f-47f1-879a-c392a79072cc@linux.dev>
 <cd137540-ae01-46a1-93d2-062bc21b827c@bytedance.com>
 <05955456-8743-448A-B7A4-BC45FABEA628@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <05955456-8743-448A-B7A4-BC45FABEA628@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/9/5 14:32, Muchun Song wrote:
> 
> 
>> On Aug 30, 2024, at 14:54, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>>
>>
>> On 2024/8/29 16:10, Muchun Song wrote:
>>> On 2024/8/22 15:13, Qi Zheng wrote:
>>>> In collapse_pte_mapped_thp(), we may modify the pte and pmd entry after
>>>> acquring the ptl, so convert it to using pte_offset_map_rw_nolock(). At
>>>> this time, the write lock of mmap_lock is not held, and the pte_same()
>>>> check is not performed after the PTL held. So we should get pgt_pmd and do
>>>> pmd_same() check after the ptl held.
>>>>
>>>> For the case where the ptl is released first and then the pml is acquired,
>>>> the PTE page may have been freed, so we must do pmd_same() check before
>>>> reacquiring the ptl.
>>>>
>>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>>> ---
>>>>   mm/khugepaged.c | 16 +++++++++++++++-
>>>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>>> index 53bfa7f4b7f82..15d3f7f3c65f2 100644
>>>> --- a/mm/khugepaged.c
>>>> +++ b/mm/khugepaged.c
>>>> @@ -1604,7 +1604,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>>>       if (userfaultfd_armed(vma) && !(vma->vm_flags & VM_SHARED))
>>>>           pml = pmd_lock(mm, pmd);
>>>> -    start_pte = pte_offset_map_nolock(mm, pmd, haddr, &ptl);
>>>> +    start_pte = pte_offset_map_rw_nolock(mm, pmd, haddr, &pgt_pmd, &ptl);
>>>>       if (!start_pte)        /* mmap_lock + page lock should prevent this */
>>>>           goto abort;
>>>>       if (!pml)
>>>> @@ -1612,6 +1612,9 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>>>       else if (ptl != pml)
>>>>           spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>>>> +    if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd))))
>>>> +        goto abort;
>>>> +
>>>>       /* step 2: clear page table and adjust rmap */
>>>>       for (i = 0, addr = haddr, pte = start_pte;
>>>>            i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
>>>> @@ -1657,6 +1660,16 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>>>       /* step 4: remove empty page table */
>>>>       if (!pml) {
>>>>           pml = pmd_lock(mm, pmd);
>>>> +        /*
>>>> +         * We called pte_unmap() and release the ptl before acquiring
>>>> +         * the pml, which means we left the RCU critical section, so the
>>>> +         * PTE page may have been freed, so we must do pmd_same() check
>>>> +         * before reacquiring the ptl.
>>>> +         */
>>>> +        if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd)))) {
>>>> +            spin_unlock(pml);
>>>> +            goto pmd_change;
>>> Seems we forget to flush TLB since we've cleared some pte entry?
>>
>> See comment above the ptep_clear():
>>
>> /*
>> * Must clear entry, or a racing truncate may re-remove it.
>> * TLB flush can be left until pmdp_collapse_flush() does it.
>> * PTE dirty? Shmem page is already dirty; file is read-only.
>> */
>>
>> The TLB flush was handed over to pmdp_collapse_flush(). If a
> 
> But you skipped pmdp_collapse_flush().

I skip it only in !pmd_same() case, at which time it must be cleared
by other thread, which will be responsible for flushing TLB:

CPU 0				CPU 1
				pmd_clear
				spin_unlock
				flushing tlb
spin_lock
if (!pmd_same)	
	goto pmd_change;
pmdp_collapse_flush

Did I miss something?

> 
>> concurrent thread free the PTE page at this time, the TLB will
>> also be flushed after pmd_clear().
>>
>>>> +        }
>>>>           if (ptl != pml)
>>>>               spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>>>>       }
>>>> @@ -1688,6 +1701,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>>>           pte_unmap_unlock(start_pte, ptl);
>>>>       if (pml && pml != ptl)
>>>>           spin_unlock(pml);
>>>> +pmd_change:
>>>>       if (notified)
>>>>           mmu_notifier_invalidate_range_end(&range);
>>>>   drop_folio:
> 

