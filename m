Return-Path: <linuxppc-dev+bounces-715-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B519638CC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 05:28:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvRYt49N2z2yn9;
	Thu, 29 Aug 2024 13:28:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4860:4864:20::36"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724902082;
	cv=none; b=Scgq2PXUX7G0TZVDcDBgEA8YwOimWkpSCJTWLdzsZohqxSqKVVRnNEStjwIzkEp4lQJ2shP2DHSWJSytspH7tihl9338TZQhSl2EzGPqZwm426MN7ULcdOVvt+nV+RgHauR+eNKZVscKEa/03jsK9jyKSahwZepsYVhxf1AXmyPVSljSq3UexYRgfF8NM1q0KrD00n6RtJDU8iN1pCHo4q4uwbtCgrxgizVQaSumIP4n3fE3vU4YWDqrjluPXH05xcu0DcIWvmXXAwxcNtE/ryeTfGJHjghqVLn3SNJck8qXupZfWxQj91AYxwm5iTN2LMhmpKyhVR+L7I0fLDIMFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724902082; c=relaxed/relaxed;
	bh=KUSlIPY0I0p/J1gM+q6b9ZwgCjkUVZv6zdCV16DJSmE=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding; b=le1BlwwdxrI9teQIPiPXpzAhf9tbfcIM30zdCNwzMkaTiBLXXanbcNVpIp2iBuzERRezGN5m0h74JABRuZl/1bPhYo42CfIp+fAijSEEu6UnQxH/GisAN5w5s1MJE+tasRnoU9v0DIzfDOd5tdZYdu7zDbSXiBfkB1l8eg6AiIOOreyQNzGsfZXLUKZHWPkcVA2hY8AZlUZQzImF3fo7yajKB+vxezaCxuUlD+7MkC9E29zs+1Fcci4xomkdILS5wBHHqwNM3/iKPP5yk1dhopxenwe/wpBQQ1leNOM5U8pUsTlMF66Krk1ms7twRI5uFts1yYjcVbb7zoIYVgN5zA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=KuNZ+K7w; dkim-atps=neutral; spf=pass (client-ip=2001:4860:4864:20::36; helo=mail-oa1-x36.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=KuNZ+K7w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2001:4860:4864:20::36; helo=mail-oa1-x36.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvRYs3KK7z2y8d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 13:27:59 +1000 (AEST)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-27026393c12so119829fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 20:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724902076; x=1725506876; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KUSlIPY0I0p/J1gM+q6b9ZwgCjkUVZv6zdCV16DJSmE=;
        b=KuNZ+K7wF+VEkRtwBcUBAWk+KNe7KRSOSRndRTlQ3g+ltq+QrrekpNE1fIRsfLwinS
         3TyREReFOPL467HeY2k+jVxJciiok2N5dIhN2x1T1m/2YhCuJnMZlFtJF5NsD5XoqLMv
         fWj8ewoycWANxQTBx75VH/UwlInkpg7WfjpL/cvx/H/8+ozyAauZvrrg0++Nqsk0BVYp
         fhgqujVXJx3e43MEQft05vKbEGUCj5Oq02p+hC8iXs3xOMP7yVZsF7JfKseZI+/jJX+/
         a1myDMJ5RNqCSRh85RijTnLtuytGfvlTI4ZObd19B9NHweDmq/BAY6qUbudIx/nge1dd
         kaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724902076; x=1725506876;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUSlIPY0I0p/J1gM+q6b9ZwgCjkUVZv6zdCV16DJSmE=;
        b=fjDlzZsdXB2lejNotuhJtE+xwmWUlXUhmFswdOhCyt//u510gseMvNdbi2s3byzWW0
         Gaj7q07KxFlQQSlxncGUAthJMw5PbeVy6e0VfGCBRJBGYC3TPr/Os9FI/IQ6wjz9XQqN
         HG5irszazuQ6NCjZdJU/enOfLJr2hII3kht94o4ZKEkVQYKoK9IXnjtG6/k5GkN00yFU
         4EPzX3LI5Foe8Bf0MkXxeapMV9jz/HCYKeJZucT9hoA/EBT+cE8XWL2roOKzsAyXiAwH
         O75GlKrKSBdBpp5eXn66A2fWrrsngwAmfKtPSRbM6lHd/o6kzlStu+iZ7lGdKKl0FwIR
         182w==
X-Forwarded-Encrypted: i=1; AJvYcCWYs1CqzuXUTJH5fQghUzXqsDMIAXpfvpmVulU+GPpaEjRrYAG8cYSz49eVVlS6+KdUg40lcSIUdkrBFjw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw+0oDzjxBC2dZlKB8NAFgOmA7bFG0DmdFVCsBw6INZQSE91Bj8
	a+ENRz12iyttTeuA+Xa7ke7oRQioOm9NG2n9r2Vqhlp9BDhBET+8hUkfcxiTjvY=
X-Google-Smtp-Source: AGHT+IGZPCEcwowFRJHQOC2QH+v2+Ysm2wJ5TBLKGyXexoQWGql8ItSqdv/XlmWonkjQbasTqI0R6g==
X-Received: by 2002:a05:6870:2011:b0:25e:1c9d:f180 with SMTP id 586e51a60fabf-277903675a4mr1814959fac.50.1724902075836;
        Wed, 28 Aug 2024 20:27:55 -0700 (PDT)
Received: from [10.4.59.158] ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55a4548sm203799b3a.59.2024.08.28.20.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 20:27:55 -0700 (PDT)
Message-ID: <469e0ab5-af2c-4996-bfd4-fe7ab6a7bc8c@bytedance.com>
Date: Thu, 29 Aug 2024 11:27:46 +0800
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
To: David Hildenbrand <david@redhat.com>, muchun.song@linux.dev
Cc: hughd@google.com, willy@infradead.org, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <e866151ccd257ca14a9361ba59f8c3086aa76e4f.1724310149.git.zhengqi.arch@bytedance.com>
 <f318f65d-4198-481c-98a0-00415664614c@redhat.com>
 <4481a0e4-a7a5-4223-a8ab-d1215d7c6352@bytedance.com>
 <42aba316-2b01-4fdb-9aff-9e670aac4c6e@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <42aba316-2b01-4fdb-9aff-9e670aac4c6e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/8/28 18:48, David Hildenbrand wrote:
> On 27.08.24 06:33, Qi Zheng wrote:
>> Hi David,
>>
>> On 2024/8/26 23:21, David Hildenbrand wrote:
>>> On 22.08.24 09:13, Qi Zheng wrote:
>>>> Currently, the usage of pte_offset_map_nolock() can be divided into the
>>>> following two cases:
>>>>
>>>> 1) After acquiring PTL, only read-only operations are performed on the
>>>> PTE
>>>>      page. In this case, the RCU lock in pte_offset_map_nolock() will
>>>> ensure
>>>>      that the PTE page will not be freed, and there is no need to worry
>>>>      about whether the pmd entry is modified.
>>>
>>> There is also the usage where we don't grab the PTL at all, and only do
>>> a racy (read-only) lookup.
>>
>> IIUC, pte_offset_map() should be used instead of pte_offset_map_nolock()
>> in this case.
> 
> Yes, but the filemap.c thingy conditionally wants to lock later. But I 
> agree that pte_offset_map() is better when not even wanting to lock.
> 
> [...]
> 
>>>> accessor functions:
>>>>     - pte_offset_map_nolock()
>>>>        maps PTE, returns pointer to PTE with pointer to its PTE table
>>>>        lock (not taken), or returns NULL if no PTE table;
>>>
>>> What will happen to pte_offset_map_nolock() after this series? Does it
>>> still exist or will it become an internal helper?
>>
>> I choose to remove it completely in [PATCH v2 13/14].
>>
> 
> Ah, great.
> 
> [...]
> 
>>> If someone thinks not requiring a non-NULL pointer is better, please
>>> speak up, I'm not married to that idea :)
>>>
>>>> +    pte = __pte_offset_map(pmd, addr, &pmdval);
>>>> +    if (likely(pte))
>>>> +        *ptlp = pte_lockptr(mm, &pmdval);
>>>> +    *pmdvalp = pmdval;
>>>> +    return pte;
>>>> +}
>>>> +
>>>>    /*
>>>>     * pte_offset_map_lock(mm, pmd, addr, ptlp), and its internal
>>>> implementation
>>>>     * __pte_offset_map_lock() below, is usually called with the pmd
>>>> pointer for
>>>> @@ -356,6 +383,22 @@ pte_t *pte_offset_map_nolock(struct mm_struct
>>>> *mm, pmd_t *pmd,
>>>>     * recheck *pmd once the lock is taken; in practice, no callsite
>>>> needs that -
>>>>     * either the mmap_lock for write, or pte_same() check on contents,
>>>> is enough.
>>>>     *
>>>> + * pte_offset_map_ro_nolock(mm, pmd, addr, ptlp), above, is like
>>>> + * pte_offset_map(); but when successful, it also outputs a pointer
>>>> to the
>>>> + * spinlock in ptlp - as pte_offset_map_lock() does, but in this case
>>>> without
>>>> + * locking it.  This helps the caller to avoid a later
>>>> pte_lockptr(mm, *pmd),
>>>> + * which might by that time act on a changed *pmd:
>>>> pte_offset_map_ro_nolock()
>>>> + * provides the correct spinlock pointer for the page table that it
>>>> returns.
>>>> + * For readonly case, the caller does not need to recheck *pmd after
>>>> the lock is
>>>> + * taken, because the RCU lock will ensure that the PTE page will not
>>>> be freed. > + *
>>>> + * pte_offset_map_rw_nolock(mm, pmd, addr, pmdvalp, ptlp), above, is
>>>> like
>>>> + * pte_offset_map_ro_nolock(); but when successful, it also outputs 
>>>> the
>>>> + * pdmval. For cases where pte or pmd entries may be modified, that
>>>> is, maywrite
>>>> + * case, this can help the caller recheck *pmd once the lock is
>>>> taken. In some
>>>> + * cases, that is, either the mmap_lock for write, or pte_same()
>>>> check on
>>>> + * contents, is also enough to ensure that the pmd entry is stable.
>>>> + *
>>>>     * Note that free_pgtables(), used after unmapping detached vmas, or
>>>> when
>>>>     * exiting the whole mm, does not take page table lock before
>>>> freeing a page
>>>>     * table, and may not use RCU at all: "outsiders" like khugepaged
>>>> should avoid
>>>
>>> In general to me a step into the right direction. Likely the
>>> documentation could be further clarified in some aspects:
>>>
>>> Like that the use of pte_offset_map_ro_nolock() does not allow to easily
>>> identify if the page table was replaced in the meantime. Even after
>>> grabbing the PTL, we might be looking either at a page table that is
>>> still mapped or one that was unmapped and is about to get freed. But for
>>> R/O access this is usually sufficient AFAIUK.
>>>
>>> Or that "RO" / "RW" expresses the intended semantics, not that the
>>> *kmap* will be RO/RW protected.
>>
>> How about the following:
>>
>> pte_offset_map_ro_nolock(mm, pmd, addr, ptlp), above, is like
>> pte_offset_map(); but when successful, it also outputs a pointer to the
>> spinlock in ptlp - as pte_offset_map_lock() does, but in this case
>> without locking it.  This helps the caller to avoid a later
>> pte_lockptr(mm, *pmd), which might by that time act on a changed *pmd:
>> pte_offset_map_ro_nolock() provides the correct spinlock pointer for the
>> page table that it returns. Even after grabbing the spinlock, we might
>> be looking either at a page table that is still mapped or one that was
>> unmapped and is about to get freed. But for R/O access this is usually
>> sufficient AFAIUK.
> 
> Drop the "AFAIUK" :)
> 
> "For R/O access this is sufficient."

OK.

> 
>>
>> pte_offset_map_rw_nolock(mm, pmd, addr, pmdvalp, ptlp), above, is like
>> pte_offset_map_ro_nolock(); but when successful, it also outputs the
>> pdmval. For R/W access, the callers can not accept that the page table
>> it sees has been unmapped and is about to get freed. The pmdval can help
>> callers to recheck pmd_same() to identify this case once the spinlock is
>> taken. For some cases where exclusivity is already guaranteed, such as
>> holding the write lock of mmap_lock, or in cases where checking is
>> sufficient, such as a !pte_none() pte will be rechecked after the
>> spinlock is taken, there is no need to recheck pdmval.
> 
> Right, using pte_same() one can achieve a similar result, assuming that 
> the freed page table gets all ptes set to pte_none().
> 
> page_table_check_pte_clear_range() before pte_free_defer() in 
> retract_page_tables/collapse_pte_mapped_thp() sanity checks that I think.
> 
> In collapse_huge_page() that is not the case. But here, we also 
> currently grab all heavily locks, to prevent any concurrent page table 
> walker.

Yes.

> 
>>
>> Note: "RO" / "RW" expresses the intended semantics, not that the *kmap*
>> will be RO/RW protected.
> 
> 
> Good. Please also incorporate the feedback from Muchun.

OK, I will change it in v3 to the following:

pte_offset_map_ro_nolock(mm, pmd, addr, ptlp), above, is like
pte_offset_map(); but when successful, it also outputs a pointer to the
spinlock in ptlp - as pte_offset_map_lock() does, but in this case
without locking it.  This helps the caller to avoid a later
pte_lockptr(mm, *pmd), which might by that time act on a changed *pmd:
pte_offset_map_ro_nolock() provides the correct spinlock pointer for the
page table that it returns. Even after grabbing the spinlock, we might
be looking either at a page table that is still mapped or one that was 
unmapped and is about to get freed. But for R/O access this is
sufficient. So it is only applicable for read-only cases where any 
modification operations to the page table are not allowed even if
the corresponding spinlock is held afterwards.

pte_offset_map_rw_nolock(mm, pmd, addr, pmdvalp, ptlp), above, is like
pte_offset_map_ro_nolock(); but when successful, it also outputs the
pdmval. It is applicable for may-write cases where any modification
operations to the page table may happen after the corresponding spinlock
is held afterwards. But the users should make sure the page table is
stable like holding mmap_lock for write or checking pte_same() or
checking pmd_same() by using the output pmdval before performing the
write operations.

Note: "RO" / "RW" expresses the intended semantics, not that the *kmap*
will be read-only/read-write protected.


> 

