Return-Path: <linuxppc-dev+bounces-4694-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCAAA02391
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 11:56:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRWMB2yDGz2y8P;
	Mon,  6 Jan 2025 21:56:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736160982;
	cv=none; b=VEB2d0fRXgymj8sSvXpwI6eNet4NMtZ9lsyVV0oHHMM8h5WKuYU505lH6RDaTUGSg7MOnR4u2luTaelo0UAuduUf3JSsf8CMMxJzoZeD3mX14Z5f9tNYw7mKIEtRhGGnVmg/2otkrvBN/E659UaBShpmnt6O01IfMK6Oc2gLWPfwLGKkkvDq6oe8qBzuIpbzbWU1tW9XYnemEOSP5zZi40a7CZbq8wNW8EmrNqVMAGvwB6GDy2jrPQxcAL6L6KQb8EMVrR+YNZSjB3hnbijsJZl0pTzOA0b/+BZyedhFF5XyVetgGQZU3EdE/YwcKfOkP83uXvJsLZmsH9j47QKgWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736160982; c=relaxed/relaxed;
	bh=AZLWPPKublXNhPBg34EaNBNy6TKJ9wneFJV35MDnpZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QEJTxJ4AARcm54JbreDKnFoatKzwLKtlpXww8Ui6WhZsM0OcHm15mrbUw2o80ITisIySxCj8R9V1Gbuh27Qb/uYquRvmdQc1LWO4TbD6RQR0+3ofxsTbIHKRpdcALOZMaDRXDkqxipOujKQF9H/x0jDyU1YTNXQpBVL/11+YT5jYBrp3Wx90m30TdIyGP6xactEWbau4uaAJhgc2tTKYkHyummLptGEOL7FLQm20CgPEqkTpBIfhFwXYrtQLEubXn10IBhGHsfkQBKtO6PYM3IwxwI7Orb8k4fHSCCQWjyf7tbaQsLE3wwiuzmpyXS5YFE+RlfBz56Jz2MNZ616upQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=e0foX5TL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=e0foX5TL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRWM80C3Yz2xtK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 21:56:18 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2f43da61ba9so16472791a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jan 2025 02:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736160974; x=1736765774; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AZLWPPKublXNhPBg34EaNBNy6TKJ9wneFJV35MDnpZc=;
        b=e0foX5TLnHyqECQjz/iUeVJxlnD6fXgYouDl+VeGOvMO1DXjyo0PK7KC639cLcQLgJ
         wXnN8o41nWTSsqIX+VlRlakIlciC68g4V/9As10xOF+erk921kS9LnsfoptQgOr6NkaL
         xVYEWU9KqSMfbgaaj3D2mjpwJPCIn9VKZnxkuSpPeGqF6zI1U60Ef3ck6G5nwEitO+dI
         uFO9MmdbSxV3bckH+4917ZstHHn3f+blSkqJCVkdTG5s1dsR2yFZ9uRbuv4DwRrw68MV
         bWu1pt/0ffLAsjhjPd895/nyksHFYyyHvNBGWqb8xyrSWHnExilG1wzrmJIWKwAF0Y8H
         bt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736160974; x=1736765774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZLWPPKublXNhPBg34EaNBNy6TKJ9wneFJV35MDnpZc=;
        b=hcQksdwac+VkWnZA9Y6AZo+fbw9G0XqCgIR6BGPz6nPY5ue55Fjk+Q4r5Lv8JZTfV3
         3ALBi0MT2kwrnmhjO0oNZZz1lPZ2krB10jShLNsoPmsy65oFCBgKmJpDFiEgYLi9e9Uj
         0dWPMSZEG2Ne1N+fhYEWl1Cs5Qw2hDy7wypM/2xsrBJMWelhEm91WFAHOSqsFvFJQoaJ
         nFKR8xwFZU7ZCyCuHRwCSKApYKQTkVHE6wNvG1tITsPwQIAqR2jpFTDhtfIjF2gwB2HN
         B8l8BQ1qMhTTS0UpvdrJjDCEAHlC5Gpom1ZSRABMBCbDGePn7kQbLAVvOTGsXYEMfsEY
         Q3CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQtcPTNOsjzg+UNS/X4gszudy5cXq4FbabCwxZ7w7FyHPSzyyDaEwiYu2VBmfS2VBC3NWOmXIU1NEPSKQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyhijIJmVu9ffq/bLshfcYKO+/T60QiAopkvJGhRA0o23pedyju
	vSL12G2TTNmBeQ/wBUywHq91xhgqMwwYiM0+7MevKm/dFLqwx/y/eroCp3BcWjs=
X-Gm-Gg: ASbGncvFjeIXfz1eKZtOsVahcLj4CpHdEDyHSFulJBguZj/6jG+Pmcc9OqV6GBzquXh
	nrb7HXJ8pY05yv/gw7rzUPHUnv9dYPLcnVGUDSpo62mtL5wq/EGrBh2h/RPZvXqMZuY/qjLmZ+C
	4BboghgVYwxeUhQfKx8wTuY1QtfUFHmCXz4B8j7e5+sHlVE/ahOI2ZvbNNtVzdzyZ6HHMd5aFpu
	AX+gStMXhyK2IB718lUE74U6m0nFmjvY0WPystzZko6cxg5FA4dTIK4VKkFHlj0e4fNWiguLrZ6
	5DHtSg==
X-Google-Smtp-Source: AGHT+IHHEGVNBdeeeMKsfSrtRayn5rgDW+sVv93AHdkC2kua4+TBudPLJJX1AZ3o0AE+Wq0oFkgydg==
X-Received: by 2002:a17:90b:5347:b0:2ee:3fa7:ef4d with SMTP id 98e67ed59e1d1-2f452ec37bamr85837306a91.24.1736160973647;
        Mon, 06 Jan 2025 02:56:13 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96ead1sm290125115ad.91.2025.01.06.02.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 02:56:13 -0800 (PST)
Message-ID: <e1de887c-6193-48ee-a9b3-04c8a0cdda45@bytedance.com>
Date: Mon, 6 Jan 2025 18:55:58 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/15] mm: pgtable: introduce pagetable_dtor()
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <8ada95453180c71b7fca92b9a9f11fa0f92d45a6.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uxwiEhYHDqdTh3@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3uxwiEhYHDqdTh3@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2025/1/6 18:34, Alexander Gordeev wrote:
> On Mon, Dec 30, 2024 at 05:07:42PM +0800, Qi Zheng wrote:
>> The pagetable_p*_dtor() are exactly the same except for the handling of
>> ptlock. If we make ptlock_free() handle the case where ptdesc->ptl is
>> NULL and remove VM_BUG_ON_PAGE() from pmd_ptlock_free(), we can unify
>> pagetable_p*_dtor() into one function. Let's introduce pagetable_dtor()
>> to do this.
>>
>> Later, pagetable_dtor() will be moved to tlb_remove_ptdesc(), so that
>> ptlock and page table pages can be freed together (regardless of whether
>> RCU is used). This prevents the use-after-free problem where the ptlock
>> is freed immediately but the page table pages is freed later via RCU.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ...
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 5d82f42ddd5cc..cad11fa10c192 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -2992,6 +2992,15 @@ static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
>>   static inline void ptlock_free(struct ptdesc *ptdesc) {}
>>   #endif /* defined(CONFIG_SPLIT_PTE_PTLOCKS) */
>>   
>> +static inline void pagetable_dtor(struct ptdesc *ptdesc)
>> +{
>> +	struct folio *folio = ptdesc_folio(ptdesc);
>> +
>> +	ptlock_free(ptdesc);
>> +	__folio_clear_pgtable(folio);
>> +	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
>> +}
>> +
> 
> If I am not mistaken, it is just pagetable_pte_dtor() rename.
> What is the point in moving the code around?

No, this is to unify pagetable_p*_dtor() into pagetable_dtor(), so
that we can move pagetable_dtor() to __tlb_remove_table(), and then
ptlock and PTE page can be freed together through RCU, which is
also the main purpose of this patch series.

Thanks!

> 
>>   static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
>>   {
>>   	struct folio *folio = ptdesc_folio(ptdesc);
>> @@ -3003,15 +3012,6 @@ static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
>>   	return true;
>>   }
>>   
>> -static inline void pagetable_pte_dtor(struct ptdesc *ptdesc)
>> -{
>> -	struct folio *folio = ptdesc_folio(ptdesc);
>> -
>> -	ptlock_free(ptdesc);
>> -	__folio_clear_pgtable(folio);
>> -	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
>> -}
>> -
>>   pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp);
>>   static inline pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr,
>>   			pmd_t *pmdvalp)

