Return-Path: <linuxppc-dev+bounces-1554-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8445983F12
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 09:29:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCWhS5KGPz2yNf;
	Tue, 24 Sep 2024 17:29:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727162968;
	cv=none; b=kBfLGdBgeIncXVTdQ2ov5tYKluZWjskE4WCHsDTDrayGV29pXlsYH1Fxubp9WbZkcNsWpJN366VG6WApRMvY5zcIgUnQolhLD9ilObTuq4lYAr8eodRzsxmuuNnFyR+TsfWOqSKjeXMq3pwuad4936+HyeBilH1w1jZdtl3cWfnaGACTVJUkrEwA3Gpzq1M4Hfpap6niVbldA/j4/89pRDXs7I2i2sXf94VNpee+5j+xhOpFDalEoXdz69iUuNPJ2g3cDZT1zBBpbbmGe83Fepmh5T94z4AJPKMVsxoO8JhVeAQcEJGJwlADazND57D+K/QoRRyC7kYWbuPdbjwN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727162968; c=relaxed/relaxed;
	bh=d2PX+4bvLDBXLZ7VO01vqg1hyq+vLyU3jjzE13L5vTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RCACAUeN5jSOErdFgDNRcvW5FN03k5Z9t4A/2LgXZAPKGRq93Mvbovsb6n0NPQlId+3v210k0ukQpnNaierNTh2kyDDsFc+pZKW0XwxOU32GlG3YdVjLF0YELLaFBnw2qwYKfYq8vpOF++MjgQkFpcAtyV7O5JeVHH7mUzAuccy/jqqBRHOG5zWrhnF2OaJhgsGF5L+FQ+jCkiOVg/lzaXbm1X6lA3z9232NMrUHm87geDnvXptozh2mVO1GpBZAubM6llfZij0wCsTs9QWKeWyqfju67N32DceLqHn7xDADEa5z+UnfO7utxWN9NLEUaVlq/sDU6IoAoaeCB+JRDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Hp9uTTZX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Hp9uTTZX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCWhR3k8Pz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 17:29:25 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71970655611so4603955b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 00:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727162962; x=1727767762; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2PX+4bvLDBXLZ7VO01vqg1hyq+vLyU3jjzE13L5vTo=;
        b=Hp9uTTZXm/tWqAbE9th12EFMydhaeUG+37oOem4Lg+6wkJB+kji4t7IqvFfkmiiQqk
         anQjY6291f9SyfL5CNQbj8Os5ulNH+Rh20yJjyZ7CCUWAKmNoWV5myDrv741UgEkYswl
         E1guUSz9Zt7WlgVgTU8C30cK7YSI/dUacODSe/GwA4Oj5E+8wBuH3Zy5ubvBYiD7lwOY
         jOyscmO+hG9141svMKuiRI8h1BWANXdx6gzzvbPyIzaeb4BYtMeBoQYdcmgdqPBn3ld4
         sFjt7Rm9CsCfvxTSj4+K5m5fEeHjTEJWfgsRQK6FdYPqvjnAsl+5licRlDLpwnovVeMU
         wQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727162962; x=1727767762;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2PX+4bvLDBXLZ7VO01vqg1hyq+vLyU3jjzE13L5vTo=;
        b=cfIc8AlTjRyU8+X3gErxTCT+/B+J6Lqg8fmAZEPnzgynEIu0YkawZOdvjEf5Nrw82x
         PNichDLefdwXeqHtm9jPcifhw+TEQingHjU437fF1gTOzg0yTkDnKV5IcCDhrZN07RBg
         o4xPu3QImAqiBhfCaLzNwBamX1ozYVPegUH9UpYfKHh5RjGt43IIsyD1dNyjO6ETNVTt
         MeKO/fyH1zWlFnyJxiUPKvBb4VYcVfESnzGKJfGtLH0YlWX6J7lnatp3eOUuzuZDzbvo
         qHd+nsLHsJAYHimUCr55PsmKqonh6hSagpsX6tSXQfmq+e3yOgTR756M1/pb19mCMDJn
         F55Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyAZ4uuJagOMNUK9v4G2p8/kwwDomJXU9Umxn7crZ7xXWMLJpbxvGpHXveCVN2Fs7GvrmT4ez/EW5zZjw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxvEOuLZBlaSA8/HP9QzzyPibwHbjbiQT51KmulgJYuoevf7cGx
	ko0mFj7q24WCPuNxVTKVWtZoihj58y6DSmBSxqGrJW9klxwejTh71uTJKkFOzVg=
X-Google-Smtp-Source: AGHT+IGKRBBYcFOAYtGkDsa6YaiDH1UmP5mz9dhjFWfJvV6oCsckH+MIyF++jOSsJbB5DKwqj/mXKA==
X-Received: by 2002:a05:6a00:1701:b0:70d:2892:402b with SMTP id d2e1a72fcca58-7199cd6ad79mr23305104b3a.7.1727162962602;
        Tue, 24 Sep 2024 00:29:22 -0700 (PDT)
Received: from [10.68.125.128] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc9390cfsm665902b3a.118.2024.09.24.00.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 00:29:22 -0700 (PDT)
Message-ID: <2343da2e-f91f-4861-bb22-28f77db98c52@bytedance.com>
Date: Tue, 24 Sep 2024 15:29:14 +0800
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
To: Muchun Song <muchun.song@linux.dev>
Cc: david@redhat.com, hughd@google.com, willy@infradead.org,
 vbabka@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
 vishal.moola@gmail.com, peterx@redhat.com, ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
References: <07d975c50fe09c246e087303b39998430b1a66bd.1727148662.git.zhengqi.arch@bytedance.com>
 <79699B24-0D99-4051-91F3-5695D32D62AC@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
Content-Language: en-US
In-Reply-To: <79699B24-0D99-4051-91F3-5695D32D62AC@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/9/24 15:14, Muchun Song wrote:
> 
> 
>> On Sep 24, 2024, at 14:11, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>> ﻿In collapse_pte_mapped_thp(), we may modify the pte and pmd entry after
>> acquring the ptl, so convert it to using pte_offset_map_rw_nolock(). At
>> this time, the pte_same() check is not performed after the PTL held. So we
>> should get pgt_pmd and do pmd_same() check after the ptl held.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>> mm/khugepaged.c | 14 +++++++++++---
>> 1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 6498721d4783a..8ab79c13d077f 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -1605,7 +1605,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>     if (userfaultfd_armed(vma) && !(vma->vm_flags & VM_SHARED))
>>         pml = pmd_lock(mm, pmd);
>>
>> -    start_pte = pte_offset_map_nolock(mm, pmd, haddr, &ptl);
>> +    start_pte = pte_offset_map_rw_nolock(mm, pmd, haddr, &pgt_pmd, &ptl);
>>     if (!start_pte)        /* mmap_lock + page lock should prevent this */
>>         goto abort;
>>     if (!pml)
>> @@ -1613,6 +1613,9 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>     else if (ptl != pml)
>>         spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>>
>> +    if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd))))
>> +        goto abort;
>> +
>>     /* step 2: clear page table and adjust rmap */
>>     for (i = 0, addr = haddr, pte = start_pte;
>>          i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
>> @@ -1645,7 +1648,6 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>         nr_ptes++;
>>     }
>>
>> -    pte_unmap(start_pte);
>>     if (!pml)
>>         spin_unlock(ptl);
>>
>> @@ -1658,13 +1660,19 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>     /* step 4: remove empty page table */
>>     if (!pml) {
>>         pml = pmd_lock(mm, pmd);
>> -        if (ptl != pml)
>> +        if (ptl != pml) {
>>             spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>> +            if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd)))) {
>> +                spin_unlock(pml);
>> +                goto abort;
> 
> Drop the reference of folio and the mm counter twice at the label of abort and the step 3.

My bad, should set nr_ptes to 0 and call flush_tlb_mm() here, right?

> 
>> +            }
>> +        }
>>     }
>>     pgt_pmd = pmdp_collapse_flush(vma, haddr, pmd);
>>     pmdp_get_lockless_sync();
>>     if (ptl != pml)
>>         spin_unlock(ptl);
>> +    pte_unmap(start_pte);
>>     spin_unlock(pml);
> 
> Why not?
> 
> pte_unmap_unlock(start_pte, ptl);
> if (pml != ptl)
>          spin_unlock(pml);

Both are fine, will do.

Thanks,
Qi

> 
>>
>>     mmu_notifier_invalidate_range_end(&range);
>> --
>> 2.20.1

