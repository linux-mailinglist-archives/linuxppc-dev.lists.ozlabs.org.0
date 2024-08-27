Return-Path: <linuxppc-dev+bounces-558-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F8D960056
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 06:34:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtF725Lz5z2xvF;
	Tue, 27 Aug 2024 14:34:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724733246;
	cv=none; b=F+FQk0wzL4oFFZyNVBUip2V01tn4EQvqoW9vdmOMVkeulguG0cb3d5sM1MjrGrDcorJtcJIjIfPhB+QkujnAOS8x4Kf/EMSR9LVtGlB8CG5BCtt76iZQhsOAGD7G/EGCfVCxbIMTeEAIFfgLUO7kDGS1ZfXcvupNODn0W8l28O9lfPTV3DqM8L2dl5QblMG4SRh2GgDzWLAIJh41OVb0fZp2Ff5o/Bq9PaD1UuWsagOsaoCUWNlhLEy7xWfijWrnDFA6sqSB2dsempipRYVqOE7Hlb88UMZD/fiXBa7VrhdLIWKT1pwNJ/H+aE8cVnCVJkWvaL82wdKP7vvBJVM0eA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724733246; c=relaxed/relaxed;
	bh=Bq87ZON6ZNMLSUnrDlDs3pHFeMkFR+bTi97+RCtdjic=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding; b=Roaqi4UDEQiOJ9YKgBcSQxDQR3fyv4a2hVsQc4CI5cDzDNye5Jf6SeF6gn0KM9A1L0piEj22Bj/NuVo74dyVHtk1AerI99/q/xi7ZalJPp+8F+Hbmm5z2EIKUmQBoVKZkf6zypduAh8RMCJ7yJZJD14SMcFZEcSL0129zqFiMC3vVKvLBK1iFKlG9nk/NtGUcd3O7FVDTeIL2AoM6+YpReiQWO+HfQgGm7lVJW4HjqozV+UTct4sGgSmo9kmqJxMTB7BLFUDGFGbQ+OGQBLYx8SXOYNXsOFmaOFRVVqBKJL/A/dOF4WChlLfLpykC/MbfDCScrzBx2eQra64gbz6Kw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=RZoDAQhM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=RZoDAQhM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtF714kXfz2xCC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 14:34:04 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1fee6435a34so33200645ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 21:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724733241; x=1725338041; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bq87ZON6ZNMLSUnrDlDs3pHFeMkFR+bTi97+RCtdjic=;
        b=RZoDAQhMjWtae1361JP9ROxBsj2ogUEFJaryyEfQGwQFIqNRFK+u//QNcEPZrFwfj3
         eQ75gL/QTxf7sys2FlzdDmLA8+KTb7jl9dIX94BLmuvhFRbX1N6lPkk4O274cAPrIguE
         4FVIsSk6O0DrOXK/ObqOHmA8lKUvyHhIgdqZvwYf8TVABqezX4da24PQ+II3OYMhAAPD
         XZf3ntPwv642+zLLSAbQIZB2g7M0S4qMPvTQoNG51rNk/PYo/c2ad78gK1n5oVfteUNB
         dljLSR7yQDc3eiYTsYoK9jdMoMKAdwWGmFAP3uLTaZSUfmmvv5u/SoQxOuUaOGkyN5hy
         ouAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724733241; x=1725338041;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bq87ZON6ZNMLSUnrDlDs3pHFeMkFR+bTi97+RCtdjic=;
        b=YZSb4x5zpbC+4dkgS3MVKZs6uLkNbi+VGRzC9ae3EMkPBHCYLfPoXkn4ZNkNcYvG6H
         /EoHZ2XLS7FLQwPWHZ3F51aUCGZNnqOxz2ddJu76/jAkxrT3CDWBzkZOXzhfXHaDPSfF
         0pTy0WpPkUsaGV7PcIbbBAzLZGuaDTa/rdzNcIYRUs5In3qKD3R6VRqgeADw50rdrUDR
         bgjAuuvlxlcVJiWf6/1jMFrChgsSodARwEHwITaz3EvnhDLRW+8ZpKlZlqgrR/V98LI0
         ho1kyZnO1wFCkDUHN9hPuDkutTGIpu4hnhxGEQGoYYNWTeZRfvoUtdA+ZFxB+jRxvLTW
         ytjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqOvvw29CQILvVQ9jx2lUksBaqPeJ3tQMGUZxouUJO8K07cPJW4D4ha6fuJn1UWs2XR/8SLIF6XcLHmpU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz/A8MSIA59HphE8Uxin7CX/yj6kGkOcDOH1TDd45eQ7t92VIN0
	rShoD18eqx6eNtNvW6OFZqRoGotAuMiZl1fpT3oIlVG5P7vFbSD4hYtHd7KZDSo=
X-Google-Smtp-Source: AGHT+IGrjg/3DusjsTQ/CyMwBnOzZDq+gba6Du2dXt4+TdxTJQagehvc1DJvTP0xEmtvYDB7oJxjZw==
X-Received: by 2002:a17:902:db0d:b0:201:df0b:2b5d with SMTP id d9443c01a7336-2039e52da6cmr106666295ad.64.1724733241304;
        Mon, 26 Aug 2024 21:34:01 -0700 (PDT)
Received: from [10.4.59.158] ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df793sm75232815ad.155.2024.08.26.21.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 21:34:00 -0700 (PDT)
Message-ID: <4481a0e4-a7a5-4223-a8ab-d1215d7c6352@bytedance.com>
Date: Tue, 27 Aug 2024 12:33:53 +0800
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
Subject: Re: [PATCH v2 01/14] mm: pgtable: introduce
 pte_offset_map_{ro|rw}_nolock()
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: hughd@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
 vishal.moola@gmail.com, peterx@redhat.com, ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <e866151ccd257ca14a9361ba59f8c3086aa76e4f.1724310149.git.zhengqi.arch@bytedance.com>
 <f318f65d-4198-481c-98a0-00415664614c@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <f318f65d-4198-481c-98a0-00415664614c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi David,

On 2024/8/26 23:21, David Hildenbrand wrote:
> On 22.08.24 09:13, Qi Zheng wrote:
>> Currently, the usage of pte_offset_map_nolock() can be divided into the
>> following two cases:
>>
>> 1) After acquiring PTL, only read-only operations are performed on the 
>> PTE
>>     page. In this case, the RCU lock in pte_offset_map_nolock() will 
>> ensure
>>     that the PTE page will not be freed, and there is no need to worry
>>     about whether the pmd entry is modified.
> 
> There is also the usage where we don't grab the PTL at all, and only do 
> a racy (read-only) lookup.

IIUC, pte_offset_map() should be used instead of pte_offset_map_nolock()
in this case.

> 
>>
>> 2) After acquiring PTL, the pte or pmd entries may be modified. At this
>>     time, we need to ensure that the pmd entry has not been modified
>>     concurrently.
>>
>> To more clearing distinguish between these two cases, this commit
>> introduces two new helper functions to replace pte_offset_map_nolock().
>> For 1), just rename it to pte_offset_map_ro_nolock(). For 2), in addition
>> to changing the name to pte_offset_map_rw_nolock(), it also outputs the
>> pmdval when successful. This can help the caller recheck *pmd once the 
>> PTL
>> is taken. In some cases, that is, either the mmap_lock for write, or
>> pte_same() check on contents, is also enough to ensure that the pmd entry
>> is stable. But in order to prevent the interface from being abused, we
>> choose to pass in a dummy local variable instead of NULL.
>>
>> Subsequent commits will convert pte_offset_map_nolock() into the above
>> two functions one by one, and finally completely delete it.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>   Documentation/mm/split_page_table_lock.rst |  7 ++++
>>   include/linux/mm.h                         |  5 +++
>>   mm/pgtable-generic.c                       | 43 ++++++++++++++++++++++
>>   3 files changed, 55 insertions(+)
>>
>> diff --git a/Documentation/mm/split_page_table_lock.rst 
>> b/Documentation/mm/split_page_table_lock.rst
>> index e4f6972eb6c04..08d0e706a32db 100644
>> --- a/Documentation/mm/split_page_table_lock.rst
>> +++ b/Documentation/mm/split_page_table_lock.rst
>> @@ -19,6 +19,13 @@ There are helpers to lock/unlock a table and other 
>> accessor functions:
>>    - pte_offset_map_nolock()
>>       maps PTE, returns pointer to PTE with pointer to its PTE table
>>       lock (not taken), or returns NULL if no PTE table;
> 
> What will happen to pte_offset_map_nolock() after this series? Does it 
> still exist or will it become an internal helper?

I choose to remove it completely in [PATCH v2 13/14].

> 
>> + - pte_offset_map_ro_nolock()
>> +    maps PTE, returns pointer to PTE with pointer to its PTE table
>> +    lock (not taken), or returns NULL if no PTE table;
>> + - pte_offset_map_rw_nolock()
>> +    maps PTE, returns pointer to PTE with pointer to its PTE table
>> +    lock (not taken) and the value of its pmd entry, or returns NULL
>> +    if no PTE table;
> 
> [...]
> 
>> +pte_t *pte_offset_map_rw_nolock(struct mm_struct *mm, pmd_t *pmd,
>> +                unsigned long addr, pmd_t *pmdvalp,
>> +                spinlock_t **ptlp)
>> +{
>> +    pmd_t pmdval;
>> +    pte_t *pte;
>> +
>> +    BUG_ON(!pmdvalp);
> 
> As raised, no BUG_ON please. VM_WARN_ON_ONCE() is helpful during early 
> testing and should catch these kind of things.

OK, this patch was sent before you pointed out this, will use
VM_WARN_ON_ONCE() instead of BUG_ON() in v3.

> 
> If someone thinks not requiring a non-NULL pointer is better, please 
> speak up, I'm not married to that idea :)
> 
>> +    pte = __pte_offset_map(pmd, addr, &pmdval);
>> +    if (likely(pte))
>> +        *ptlp = pte_lockptr(mm, &pmdval);
>> +    *pmdvalp = pmdval;
>> +    return pte;
>> +}
>> +
>>   /*
>>    * pte_offset_map_lock(mm, pmd, addr, ptlp), and its internal 
>> implementation
>>    * __pte_offset_map_lock() below, is usually called with the pmd 
>> pointer for
>> @@ -356,6 +383,22 @@ pte_t *pte_offset_map_nolock(struct mm_struct 
>> *mm, pmd_t *pmd,
>>    * recheck *pmd once the lock is taken; in practice, no callsite 
>> needs that -
>>    * either the mmap_lock for write, or pte_same() check on contents, 
>> is enough.
>>    *
>> + * pte_offset_map_ro_nolock(mm, pmd, addr, ptlp), above, is like
>> + * pte_offset_map(); but when successful, it also outputs a pointer 
>> to the
>> + * spinlock in ptlp - as pte_offset_map_lock() does, but in this case 
>> without
>> + * locking it.  This helps the caller to avoid a later 
>> pte_lockptr(mm, *pmd),
>> + * which might by that time act on a changed *pmd: 
>> pte_offset_map_ro_nolock()
>> + * provides the correct spinlock pointer for the page table that it 
>> returns.
>> + * For readonly case, the caller does not need to recheck *pmd after 
>> the lock is
>> + * taken, because the RCU lock will ensure that the PTE page will not 
>> be freed. > + *
>> + * pte_offset_map_rw_nolock(mm, pmd, addr, pmdvalp, ptlp), above, is 
>> like
>> + * pte_offset_map_ro_nolock(); but when successful, it also outputs the
>> + * pdmval. For cases where pte or pmd entries may be modified, that 
>> is, maywrite
>> + * case, this can help the caller recheck *pmd once the lock is 
>> taken. In some
>> + * cases, that is, either the mmap_lock for write, or pte_same() 
>> check on
>> + * contents, is also enough to ensure that the pmd entry is stable.
>> + *
>>    * Note that free_pgtables(), used after unmapping detached vmas, or 
>> when
>>    * exiting the whole mm, does not take page table lock before 
>> freeing a page
>>    * table, and may not use RCU at all: "outsiders" like khugepaged 
>> should avoid
> 
> In general to me a step into the right direction. Likely the 
> documentation could be further clarified in some aspects:
> 
> Like that the use of pte_offset_map_ro_nolock() does not allow to easily 
> identify if the page table was replaced in the meantime. Even after 
> grabbing the PTL, we might be looking either at a page table that is 
> still mapped or one that was unmapped and is about to get freed. But for 
> R/O access this is usually sufficient AFAIUK.
> 
> Or that "RO" / "RW" expresses the intended semantics, not that the 
> *kmap* will be RO/RW protected.

How about the following:

pte_offset_map_ro_nolock(mm, pmd, addr, ptlp), above, is like
pte_offset_map(); but when successful, it also outputs a pointer to the
spinlock in ptlp - as pte_offset_map_lock() does, but in this case
without locking it.  This helps the caller to avoid a later
pte_lockptr(mm, *pmd), which might by that time act on a changed *pmd:
pte_offset_map_ro_nolock() provides the correct spinlock pointer for the
page table that it returns. Even after grabbing the spinlock, we might
be looking either at a page table that is still mapped or one that was 
unmapped and is about to get freed. But for R/O access this is usually
sufficient AFAIUK.

pte_offset_map_rw_nolock(mm, pmd, addr, pmdvalp, ptlp), above, is like
pte_offset_map_ro_nolock(); but when successful, it also outputs the
pdmval. For R/W access, the callers can not accept that the page table
it sees has been unmapped and is about to get freed. The pmdval can help
callers to recheck pmd_same() to identify this case once the spinlock is
taken. For some cases where exclusivity is already guaranteed, such as
holding the write lock of mmap_lock, or in cases where checking is
sufficient, such as a !pte_none() pte will be rechecked after the
spinlock is taken, there is no need to recheck pdmval.

Note: "RO" / "RW" expresses the intended semantics, not that the *kmap*
will be RO/RW protected.

Thanks,
Qi

> 

