Return-Path: <linuxppc-dev+bounces-794-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E1F9657D8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 08:54:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww85f745cz2xHF;
	Fri, 30 Aug 2024 16:54:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725000870;
	cv=none; b=fDlpZtTKDQd0au9mVrmfori5s0uc3p6/bxWjJVBPAoBxjSLSr8Z0M0+M5B1muXmPy4OgWImvJZNEtRcfEsXdDVWx1GESrtPdJ7oMAqB2CK5pSEiwucfB0AXSOYEOR+Bu9geYA+IhAeDAq4kq0Tvzm1/kXLhIPtP4p4ptUo7CXayxN/SSTqM0jrsVO4aByESfCuw/LQFrqCugvktkcwHiZfyNO8ZqJkeNUkMxl1PpbItsjdI9qJl3rjNFlwLiMc/JhaPeumpyNQMLhCNv+j8f5tEK3Ty8G2bH0aSRvlqHixMvxH9F4ZlpSJA1Y+2Njqeybu6ilnMwGg/lg/nxIvQcvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725000870; c=relaxed/relaxed;
	bh=JXsfI13QxQMuq1bhCiFBSW4jYSMwXLCeILFvF2AASUw=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding; b=buZgY3XTzYG9BQLpUtL2n462YN2eyUxlcNh5TxuqaNyaJQgg74TTjibwdoUtsLZ1IOu5+sA8VuQ1et2/HE33zHTD3c2PMwbQ5sFqizfctD64zROLtSXQ6FslYALBmJhOP9fIlSYnV0XwCT375knE2OfPwfk9ghznTHofynaO0hv0tZbwv/Wtdv0jDsx/Smr2V1RAOaRS/jIl6sVVnaWIxnmQ2d8qDQGJ1n8pGvT98UdkiBNeMtijzyliTDf3jua32NRF9traOEB8IlKQ+1oHxQx1WHheYIQYuNBl53awZ1Vk1ttTjj7GzYwNjS0agizNj5iF0mRhZRv47tYQGV+PNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=X5ZzN6qV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=X5ZzN6qV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww85d6p6Kz2xDD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 16:54:28 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-201fbd0d7c2so13912095ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 23:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1725000867; x=1725605667; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JXsfI13QxQMuq1bhCiFBSW4jYSMwXLCeILFvF2AASUw=;
        b=X5ZzN6qVJNjXXKGm21+DTcOQC44L7NzxzWjxsjpO0T4RduQZkws5IXYn0ag4m3r9zI
         dBRE7WhLKolrJU+8KYlAeM5FbtZWZGmv0NjIPv4UsLgDqvwT/jLMx6sl1YSEWSxwk77b
         CB2HKeZ5OBcd3MqM58MoI4ghyu9buO5HzQr0Hfffc7+Qg01cVBfb9n3u7DU/WWK2cm+K
         aq2JOpnqUsWuvsgWb6SF3eoGlqVSU/FX/ZNlnsxkYfAaaJ9uKg2FYzj/IlK8nx3qkXDh
         8kO6RtXsfj29Tt1yfZsUcG4H0S/k6ddNS7+GSIMDeff8mZg7/+1T1LlkXlovX+N9CLC7
         BYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725000867; x=1725605667;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JXsfI13QxQMuq1bhCiFBSW4jYSMwXLCeILFvF2AASUw=;
        b=eoilRdKtz/cK3a4GVCTCShnxVll+w3LbMaf5kpyc1ccsIeyiKFXZQguwvArLy6d/Lb
         JdzTWc0wqk3xyop4MzLsp+pmhUHFLlZlwSQ2mr0pzRZ0N2v6okabz/j5/lAw0U8fe4Yt
         1q2+r9KH6Zd97YVehUrGhqTNrdYuYwlmVHp7nFfqmmgk+zU20HZWnjTDLpHpXDP+GXvG
         WlkBMP0gRzOpS0ADLs298sUVAq3bArUQgk5t9GVprWI6DXw9DlQ8khew+gOjIiKZ5ktF
         aNS35O5PFN4kbXmeZUeq1xtW80gW4hvQabkYjK0j58rKHWQhBtdySMz8K2tZElS/gEQF
         psBg==
X-Forwarded-Encrypted: i=1; AJvYcCWkN4WLh/iY32ssYKFsU8k8GLHE67OiarVPF4vnVvDqQMrHAssTBpevvP+ZF8V1QyCtYy5z+KF3/nmDmTY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyBEVN/AuNELclXdp/MzTHWNisFrQ3b7j8es+MEJqN4ZjE3ORWR
	C8NqyXb3r2gMGswlC6vV91dvWLjWWaU2okwf5cUygML11ZPjQz0yQ+R8UgDLu4A=
X-Google-Smtp-Source: AGHT+IHQyky+Kk9qEKi7IWE1UWr/UmQJSB+2gVrWMjTiY9kash16TX5475rtXBjRZ94+FApWIS8qXA==
X-Received: by 2002:a17:902:e5c3:b0:202:35cb:b0c6 with SMTP id d9443c01a7336-2050c3bf6e5mr52764945ad.34.1725000866519;
        Thu, 29 Aug 2024 23:54:26 -0700 (PDT)
Received: from [10.4.59.158] ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205155452ecsm20825575ad.219.2024.08.29.23.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 23:54:26 -0700 (PDT)
Message-ID: <cd137540-ae01-46a1-93d2-062bc21b827c@bytedance.com>
Date: Fri, 30 Aug 2024 14:54:16 +0800
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
Cc: david@redhat.com, hughd@google.com, willy@infradead.org,
 vbabka@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
 vishal.moola@gmail.com, peterx@redhat.com, ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <c377dab2bf55950e6155ea051aba3887ed5a2773.1724310149.git.zhengqi.arch@bytedance.com>
 <24be821f-a95f-47f1-879a-c392a79072cc@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <24be821f-a95f-47f1-879a-c392a79072cc@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/8/29 16:10, Muchun Song wrote:
> 
> 
> On 2024/8/22 15:13, Qi Zheng wrote:
>> In collapse_pte_mapped_thp(), we may modify the pte and pmd entry after
>> acquring the ptl, so convert it to using pte_offset_map_rw_nolock(). At
>> this time, the write lock of mmap_lock is not held, and the pte_same()
>> check is not performed after the PTL held. So we should get pgt_pmd 
>> and do
>> pmd_same() check after the ptl held.
>>
>> For the case where the ptl is released first and then the pml is 
>> acquired,
>> the PTE page may have been freed, so we must do pmd_same() check before
>> reacquiring the ptl.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>   mm/khugepaged.c | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 53bfa7f4b7f82..15d3f7f3c65f2 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -1604,7 +1604,7 @@ int collapse_pte_mapped_thp(struct mm_struct 
>> *mm, unsigned long addr,
>>       if (userfaultfd_armed(vma) && !(vma->vm_flags & VM_SHARED))
>>           pml = pmd_lock(mm, pmd);
>> -    start_pte = pte_offset_map_nolock(mm, pmd, haddr, &ptl);
>> +    start_pte = pte_offset_map_rw_nolock(mm, pmd, haddr, &pgt_pmd, 
>> &ptl);
>>       if (!start_pte)        /* mmap_lock + page lock should prevent 
>> this */
>>           goto abort;
>>       if (!pml)
>> @@ -1612,6 +1612,9 @@ int collapse_pte_mapped_thp(struct mm_struct 
>> *mm, unsigned long addr,
>>       else if (ptl != pml)
>>           spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>> +    if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd))))
>> +        goto abort;
>> +
>>       /* step 2: clear page table and adjust rmap */
>>       for (i = 0, addr = haddr, pte = start_pte;
>>            i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
>> @@ -1657,6 +1660,16 @@ int collapse_pte_mapped_thp(struct mm_struct 
>> *mm, unsigned long addr,
>>       /* step 4: remove empty page table */
>>       if (!pml) {
>>           pml = pmd_lock(mm, pmd);
>> +        /*
>> +         * We called pte_unmap() and release the ptl before acquiring
>> +         * the pml, which means we left the RCU critical section, so the
>> +         * PTE page may have been freed, so we must do pmd_same() check
>> +         * before reacquiring the ptl.
>> +         */
>> +        if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd)))) {
>> +            spin_unlock(pml);
>> +            goto pmd_change;
> 
> Seems we forget to flush TLB since we've cleared some pte entry?

See comment above the ptep_clear():

/*
  * Must clear entry, or a racing truncate may re-remove it.
  * TLB flush can be left until pmdp_collapse_flush() does it.
  * PTE dirty? Shmem page is already dirty; file is read-only.
  */

The TLB flush was handed over to pmdp_collapse_flush(). If a
concurrent thread free the PTE page at this time, the TLB will
also be flushed after pmd_clear().

> 
>> +        }
>>           if (ptl != pml)
>>               spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>>       }
>> @@ -1688,6 +1701,7 @@ int collapse_pte_mapped_thp(struct mm_struct 
>> *mm, unsigned long addr,
>>           pte_unmap_unlock(start_pte, ptl);
>>       if (pml && pml != ptl)
>>           spin_unlock(pml);
>> +pmd_change:
>>       if (notified)
>>           mmu_notifier_invalidate_range_end(&range);
>>   drop_folio:
> 

