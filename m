Return-Path: <linuxppc-dev+bounces-1281-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA3A976588
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 11:28:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4Bvs0VJDz2xtN;
	Thu, 12 Sep 2024 19:28:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726133337;
	cv=none; b=DbOc0Vk+K7rPgmRFqgMPGG3OJ8zWaKau6zxOxHVyhMwr6oIqJAaN+/M49i3ZRI4CEZzT+BpJEpfzKRKh49y/cJ4mgWXxyGd7/+toDg5C02ogneGjxbx3QqNQuPt8oB1eSnYNcfu72xwgDRHFHBUq1AhvpW0VxbO+PkWFgb/6PntYqerTFp/Q81KiPqRXjHu77LHfD4iPpnF8RRViGyRGU74EeVIbafM2cgMA+GFA6QvRhP663dtjhiTcFmGft2hxoBRrCuWa5kYhER+ULS/mDY0GblS4h0u8TJ/dhadS7zW/HRsvmWTBmasyT5EBgw3GKyQc0bsuyd5ZKaH7XUz0OA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726133337; c=relaxed/relaxed;
	bh=AT65D6caxyi8O3IqF5sxmWB5t+zqhreFVtKjeFFurB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kzOBquc5px2q3HX6l6y57xhUx94kgUft4EaRMY9zHpJ2Lp/RflTzAsZ0qYRQC9gMxUcl7ecxiNL5CAKFH+EQhsBd49qat+bBmnqJnMhPqmSmtRi0ivFTav4W8SnBvF0jPQI3OIWzH1uoSQnJIUE/64tNciyvdoqkl1WqxERQiOxmQjTq1dFBGotgfTttI8jaPmAKHGo09ibnLUZBQ4u140ktloQgeWClThcouwPPdOwN+2gLliAMF3M5wftNg4GlOIN2UOsly/aWOvODJsIveuZS8wsaNiN5jhPjQTNjNnWK7HXbUFN3R5DK1hNAG167V0x3ajaRqPwutBw9sOrUiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=fdEMmkFC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=fdEMmkFC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4Bvr04xGz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 19:28:54 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2d8a7c50607so502260a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1726133330; x=1726738130; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AT65D6caxyi8O3IqF5sxmWB5t+zqhreFVtKjeFFurB0=;
        b=fdEMmkFCVaG8eGva0OhClRYz+m+pTvbZ5l4IvbcpVbq/uqVosXu+/UIWRDMheD//Qm
         8/F3gmIxehT4/s8ZQIQx5VB9VJq4UVG8E72TP7beOtfcXNSuKQOhLz4Fi9/qdL6TFJ8U
         QCIJX2cmVAFnuQ8F9NimTo8zWKeziKup2jat5El3Z2JbpUKnQlfrvq7La8spW9mHyhK+
         xwdB0p/fiPWphBNcQiz3XdoKzM+T4P+df7VxgSovoc1GtKO3rtjW9n7ebSkNxCZTqKFa
         V6GRxtVvMsdLt/ZK/p775/BL8l05Az+XlSbsA6+CPtH+HK/IyHWHLXi5J350IjGpHthF
         E24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726133330; x=1726738130;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AT65D6caxyi8O3IqF5sxmWB5t+zqhreFVtKjeFFurB0=;
        b=OgiQiq6nfQShbN5ucaTL00xscpb2PhL3BE/jqj0t3LI+9bVVOkDK0lTte0FR4QYIm3
         WyUM9UHsl64W6K3xUwI1qWQrS6JuuMuytL/nzdwEaZk+0flPJLV33zWUxc0uc3tcy4fp
         G50GP+n/5zKL9vJ3+sxIVY3aNIwamngqBcmZUMTpZG6fgabr9t+E9tZowy5Y3stbcfyZ
         eyln/MD6XtX3k8GSP4Swi43AE42PYhKZBs96MNC5+BLSZy0n9xKQsdjiRqYjkUAsU+ZP
         BCBlvI98BDsnEASK8iQKaw24vX9uyse3o8MYTjdtDjA0A6xZ48+tmO3uibtahdaJYHI8
         XBjA==
X-Forwarded-Encrypted: i=1; AJvYcCWvWYRzV7xm4FKYurcorY6sg2Qs6POB1BoRhJUIGqQnnezIwGnrZXA2N6jXRWQStM87jQxu8hql+uL9Rsc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwUloh3SAbz4o2BVUxoNazVrd68MWF/DuIXk3FkuSsJAXl1xwir
	RywixctJ+Jy3XIPRdEAUuKgjh8SAQQX1fVtErRj5khSDPNLSFYA/1pEAxR904/c=
X-Google-Smtp-Source: AGHT+IHMs1K6hiu4sOIMjo3eAvDnYqfsQOfMfhz6f9zTLJFmGbbptxphUXzZIvkiw21YhPx9o9GhKg==
X-Received: by 2002:a17:90a:684c:b0:2d3:d414:4511 with SMTP id 98e67ed59e1d1-2db9ffefa37mr2370711a91.24.1726133330037;
        Thu, 12 Sep 2024 02:28:50 -0700 (PDT)
Received: from [10.4.59.158] ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db043c0672sm9995203a91.22.2024.09.12.02.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 02:28:49 -0700 (PDT)
Message-ID: <da59b028-b472-4ac1-b893-2f17496fb384@bytedance.com>
Date: Thu, 12 Sep 2024 17:28:39 +0800
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
Subject: Re: [PATCH v3 01/14] mm: pgtable: introduce
 pte_offset_map_{ro|rw}_nolock()
To: Muchun Song <muchun.song@linux.dev>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 David Hildenbrand <david@redhat.com>, hughd@google.com, willy@infradead.org,
 vbabka@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
 vishal.moola@gmail.com, peterx@redhat.com, ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com
References: <20240904084022.32728-1-zhengqi.arch@bytedance.com>
 <20240904084022.32728-2-zhengqi.arch@bytedance.com>
 <d02fe02d-a6c7-4157-bb7d-3fe235f21237@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
Content-Language: en-US
In-Reply-To: <d02fe02d-a6c7-4157-bb7d-3fe235f21237@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Muchun,

On 2024/9/6 15:20, Muchun Song wrote:
> 
> 
> On 2024/9/4 16:40, Qi Zheng wrote:
>> Currently, the usage of pte_offset_map_nolock() can be divided into the
>> following two cases:
>>
>> 1) After acquiring PTL, only read-only operations are performed on the 
>> PTE
>>     page. In this case, the RCU lock in pte_offset_map_nolock() will 
>> ensure
>>     that the PTE page will not be freed, and there is no need to worry
>>     about whether the pmd entry is modified.
>>
>> 2) After acquiring PTL, the pte or pmd entries may be modified. At this
>>     time, we need to ensure that the pmd entry has not been modified
>>     concurrently.
>>
>> To more clearing distinguish between these two cases, this commit
>> introduces two new helper functions to replace pte_offset_map_nolock().
>> For 1), just rename it to pte_offset_map_ro_nolock(). For 2), in addition
>> to changing the name to pte_offset_map_rw_nolock(), it also outputs the
>> pmdval when successful. It is applicable for may-write cases where any
>> modification operations to the page table may happen after the
>> corresponding spinlock is held afterwards. But the users should make sure
>> the page table is stable like checking pte_same() or checking pmd_same()
>> by using the output pmdval before performing the write operations.
>>
>> Note: "RO" / "RW" expresses the intended semantics, not that the *kmap*
>> will be read-only/read-write protected.
>>
>> Subsequent commits will convert pte_offset_map_nolock() into the above
>> two functions one by one, and finally completely delete it.
>>
>> Signed-off-by: Qi Zheng<zhengqi.arch@bytedance.com>
>> ---
>>   Documentation/mm/split_page_table_lock.rst |  7 +++
>>   include/linux/mm.h                         |  5 +++
>>   mm/pgtable-generic.c                       | 50 ++++++++++++++++++++++
>>   3 files changed, 62 insertions(+)
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
>> + - pte_offset_map_ro_nolock()
>> +    maps PTE, returns pointer to PTE with pointer to its PTE table
>> +    lock (not taken), or returns NULL if no PTE table;
>> + - pte_offset_map_rw_nolock()
>> +    maps PTE, returns pointer to PTE with pointer to its PTE table
>> +    lock (not taken) and the value of its pmd entry, or returns NULL
>> +    if no PTE table;
>>    - pte_offset_map()
>>       maps PTE, returns pointer to PTE, or returns NULL if no PTE table;
>>    - pte_unmap()
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index a7c74a840249a..1fde9242231c9 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -3006,6 +3006,11 @@ static inline pte_t *pte_offset_map_lock(struct 
>> mm_struct *mm, pmd_t *pmd,
>>   pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
>>               unsigned long addr, spinlock_t **ptlp);
>> +pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
>> +                unsigned long addr, spinlock_t **ptlp);
>> +pte_t *pte_offset_map_rw_nolock(struct mm_struct *mm, pmd_t *pmd,
>> +                unsigned long addr, pmd_t *pmdvalp,
>> +                spinlock_t **ptlp);
>>   #define pte_unmap_unlock(pte, ptl)    do {        \
>>       spin_unlock(ptl);                \
>> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
>> index a78a4adf711ac..262b7065a5a2e 100644
>> --- a/mm/pgtable-generic.c
>> +++ b/mm/pgtable-generic.c
>> @@ -317,6 +317,33 @@ pte_t *pte_offset_map_nolock(struct mm_struct 
>> *mm, pmd_t *pmd,
>>       return pte;
>>   }
>> +pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
>> +                unsigned long addr, spinlock_t **ptlp)
>> +{
>> +    pmd_t pmdval;
>> +    pte_t *pte;
>> +
>> +    pte = __pte_offset_map(pmd, addr, &pmdval);
>> +    if (likely(pte))
>> +        *ptlp = pte_lockptr(mm, &pmdval);
>> +    return pte;
>> +}
>> +
>> +pte_t *pte_offset_map_rw_nolock(struct mm_struct *mm, pmd_t *pmd,
>> +                unsigned long addr, pmd_t *pmdvalp,
>> +                spinlock_t **ptlp)
>> +{
>> +    pmd_t pmdval;
>> +    pte_t *pte;
>> +
>> +    VM_WARN_ON_ONCE(!pmdvalp);
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
>> @@ -356,6 +383,29 @@ pte_t *pte_offset_map_nolock(struct mm_struct 
>> *mm, pmd_t *pmd,
>>    * recheck *pmd once the lock is taken; in practice, no callsite 
>> needs that -
>>    * either the mmap_lock for write, or pte_same() check on contents, 
>> is enough.
>>    *
>> + * pte_offset_map_ro_nolock(mm, pmd, addr, ptlp), above, is like 
>> pte_offset_map();
>> + * but when successful, it also outputs a pointer to the spinlock in 
>> ptlp - as
>> + * pte_offset_map_lock() does, but in this case without locking it.  
>> This helps
>> + * the caller to avoid a later pte_lockptr(mm, *pmd), which might by 
>> that time
>> + * act on a changed *pmd: pte_offset_map_ro_nolock() provides the 
>> correct spinlock
>> + * pointer for the page table that it returns. Even after grabbing 
>> the spinlock,
>> + * we might be looking either at a page table that is still mapped or 
>> one that
>> + * was unmapped and is about to get freed. But for R/O access this is 
>> sufficient.
>> + * So it is only applicable for read-only cases where any 
>> modification operations
>> + * to the page table are not allowed even if the corresponding 
>> spinlock is held
>> + * afterwards.
>> + *
>> + * pte_offset_map_rw_nolock(mm, pmd, addr, pmdvalp, ptlp), above, is 
>> like
>> + * pte_offset_map_ro_nolock(); but when successful, it also outputs 
>> the pdmval.
>> + * It is applicable for may-write cases where any modification 
>> operations to the
>> + * page table may happen after the corresponding spinlock is held 
>> afterwards.
>> + * But the users should make sure the page table is stable like 
>> checking pte_same()
>> + * or checking pmd_same() by using the output pmdval before 
>> performing the write
>> + * operations.
> 
> Now, we have two options to make sure the stability of PTE for users
> of pte_offset_map_rw_nolock(), in order to ease this operation, how
> about proposing a new helper (or two, one for pmd_same, another for
> pte_same) like pte_lock_stability (I am not good at naming, maybe
> you can) which helps users 1) hold the PTL and 2) check if the PTE is
> stable and 3) return true if the PTE stable, otherwise return false.

I've been trying to do this these days, but I found it was not very
convenient.

I introduced the following helpers:

#define __PTE_STABILITY(lock)						\
bool __pte_stability_##lock(pmd_t *pmd, pmd_t *orig_pmd, pte_t *pte,	\
			    pte_t *orig_pte, spinlock_t *ptlp)		\
{									\
	pte_spin_##lock(ptlp);						\
	if (orig_pte) {							\
		VM_WARN_ON_ONCE(pte_none(*orig_pte));			\
		return pte_same(*orig_pte, ptep_get(pte));		\
	}								\
	if (orig_pmd) {							\
		VM_WARN_ON_ONCE(pmd_none(*orig_pmd));			\
		return pmd_same(*orig_pmd, pmdp_get_lockless(pmd));	\
	}								\
	VM_WARN_ON_ONCE(1);						\
	return false;							\
}
__PTE_STABILITY(lock)
__PTE_STABILITY(lock_nested)

static inline bool pte_stability_lock(pmd_t *pmd, pmd_t *orig_pmd, pte_t 
*pte,
				      pte_t *orig_pte, spinlock_t *ptlp)
	__acquires(ptlp)
{
	return __pte_stability_lock(pmd, orig_pmd, pte, orig_pte, ptlp);
}

#ifdef CONFIG_SPLIT_PTE_PTLOCKS
static inline bool pte_stability_lock_nested(pmd_t *pmd, pmd_t *orig_pmd,
                                              pte_t *pte, pte_t *orig_pte,
                                              spinlock_t *ptlp)
         __acquires(ptlp)
{
         return __pte_stability_lock_nested(pmd, orig_pmd, pte, 
orig_pte, ptlp);
}

static inline void pte_stability_unlock_nested(spinlock_t *ptlp)
	__releases(ptlp)
{
	spin_unlock(ptlp);
}
#else
static inline bool pte_stability_lock_nested(pmd_t *pmd, pmd_t *orig_pmd,
                                              pte_t *pte, pte_t *orig_pte,
                                              spinlock_t *ptlp)
{
         return true;
}
static inline void pte_stability_unlock_nested(spinlock_t *ptlp)
{
}
#endif /* CONFIG_SPLIT_PTE_PTLOCKS */

and try to use them with pte_offset_map_rw_nolock() in the following
functions:

1. collapse_pte_mapped_thp
2. handle_pte_fault
3. map_pte
4. move_pages_pte
5. walk_pte_range

For 1, 2 and 3, the conversion is relatively simple, but 2 actually
already does a pte_same() check, so it does not reduce the amount of
code much.

For 4, the pte_same() checks have already been done, and it is not
easy to convert double_pt_lock() to use pte_stability_lock{_nested}().

For 5, it calls spin_trylock(), we should introduce another
pte_stability_trylock() helper for it, but it feels unnecessary.

There are not many places where pte_offset_map_rw_nolock() is called,
and some places have already done pte_same() checks, so maybe open
code is enough and there is no need to introduce more helper function.

Thanks,
Qi

> 
> Muchun,
> Thanks.
> 
>> + *
>> + * Note: "RO" / "RW" expresses the intended semantics, not that the 
>> *kmap* will
>> + * be read-only/read-write protected.
>> + *
>>    * Note that free_pgtables(), used after unmapping detached vmas, or 
>> when
>>    * exiting the whole mm, does not take page table lock before 
>> freeing a page
>>    * table, and may not use RCU at all: "outsiders" like khugepaged 
>> should avoid
> 

