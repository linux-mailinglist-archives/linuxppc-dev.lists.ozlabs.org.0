Return-Path: <linuxppc-dev+bounces-684-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5227F96253C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 12:49:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv1PG02SVz2ydG;
	Wed, 28 Aug 2024 20:49:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724842145;
	cv=none; b=ZR1v/mViuZcJnCBF/jc1sQnMj30aN/Qb8rSwliik96TEd6z95dgeuCxBNp5ikehtoxxPv40LYTAq3ofFOad4Y3O6Q3p3xS6hVI3OqOgdo9BVo4eqIuEzRQNAMn9BowgOqssnnz8xB1eo4d8UhmPT3aFnzmopKJbVpN5UXLSqwbkBXed1zB9fR2XRb80GnaJrDDp/Bpg/IY2T4uXVl0ateAq+IzOZiPXiZsn/p3A3whjJc1QGjBoJeo/ABvzgx6E/w2EvIAkiTWvgaQig6Y7+Ppn0k7O4hX+5CAQIwZ5HAtsQjhxb+g07rf+eKtAKyYqE8wYfVCq6UnVWb2P9hna1Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724842145; c=relaxed/relaxed;
	bh=wvYsNaL9w1gkGPGglv5zQzpSgbJlfB/etLX3d1fPOrc=;
	h=DKIM-Signature:DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:X-Google-Smtp-Source:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Autocrypt:Organization:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-Originator:Content-Language:Content-Type:
	 Content-Transfer-Encoding; b=NUJDRnBfan+YUhrxtFiCq8bYaSrtPLOliyeoMwgQPjB8Uat4QQRZdoL+DBlComcIooL+IqVSGg+nfd8HYSOYyThx3vXCc/2i1qf/AeIG2WmLhkzHleIksijERhEWsiTdBiMMVQrQ7r7xUPp98npQ3MvxJzjH4ZayqkQt4xQOWy14/1wT5U+9Eq2f6qkqWrHsWXQD7QjsQvowPlBCN4bH1pqBdWrf8QzNeAaa5HboQjZhcuUxAvoa32FMZCxdj1Ix4sVTSD0xYtGUG+X3HWzKHr/PcCyDMiqr7laCTg00ajt06SVfQTthrVmDBRsGEbKCGYLT2e9gkrt7xy6RG8SEDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ES2Uth4R; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ES2Uth4R; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ES2Uth4R;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ES2Uth4R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv1PF1tX0z2yYy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 20:49:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724842140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wvYsNaL9w1gkGPGglv5zQzpSgbJlfB/etLX3d1fPOrc=;
	b=ES2Uth4Rs8NuVA8cMsBXkZglBgiPIZ1VGOPvExWTdw0O77dhSZxXNNKWAR8PSSgZXZ4gWJ
	g0EcZGkbweUsPhwN5PpZ5GSc9L/KkJwBdJsC/usVSgUeIWukBeKJbuz/QwJhhEb4B6yUnH
	ASxzzWUmP+sBP5xlghB5QyxoJtKl/Ww=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724842140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wvYsNaL9w1gkGPGglv5zQzpSgbJlfB/etLX3d1fPOrc=;
	b=ES2Uth4Rs8NuVA8cMsBXkZglBgiPIZ1VGOPvExWTdw0O77dhSZxXNNKWAR8PSSgZXZ4gWJ
	g0EcZGkbweUsPhwN5PpZ5GSc9L/KkJwBdJsC/usVSgUeIWukBeKJbuz/QwJhhEb4B6yUnH
	ASxzzWUmP+sBP5xlghB5QyxoJtKl/Ww=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-agahcTqxM7WQUwFYZUGTJw-1; Wed, 28 Aug 2024 06:48:59 -0400
X-MC-Unique: agahcTqxM7WQUwFYZUGTJw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3718c1637caso4001989f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 03:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724842138; x=1725446938;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wvYsNaL9w1gkGPGglv5zQzpSgbJlfB/etLX3d1fPOrc=;
        b=HCMg1U8Xs5rp5UIvLk2fn0ZuSlYIPkTSaT0LxnDVXCokBDLjUwL9lA2MJY+EGImfjV
         3qpzMDfeKf/BZ27CObr7rojuUe+gQivPczQ0xYHyStynDYhiBgHyKG37DxfrW8RxVWt9
         3srLlyh4pdcy9fjo6S9o4609KKrPHqKqHMxOUKHMOcxYxpyUqg+sQC/3tXs2ej8br9Vf
         P/YlYil55aG+metHYyrS89oV+8xoisVWDY3ipoja5iIMjtIQOeFc32CXeN4r9xVq56Wm
         UQA+T9whGHGDuOo16yLe7cIwRjizD7h9iJCb9XpdhzJPGhbQuoOVuG2FzRw2ZFG1FkW2
         H9/g==
X-Forwarded-Encrypted: i=1; AJvYcCXgmthV3Zq1NS/Na7xIwfLG1jQocNnS5W1opQI4yNhuHcAKYNja3CLJ3ppnPt8crefUpDYiTpqGEB6kz4U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx5qbpj7xbOEOlYKSDc4QzGs58Vz185S9DO6PFDNRJwErTvnawg
	agnQJhrCBdvXoaDrzhgdKWKERH2Sd8hfIlBRCGsLPshJWbnVgN7dFcwvGTz2LHmyRMvEvsJ6Xm0
	s0EftUIwTa5vXAfMWfRpa5fGYRKZcYnI25Hevre0nfwyyCMUO1tUq9Zlj3RZhKic=
X-Received: by 2002:a5d:63c8:0:b0:371:86bc:6c05 with SMTP id ffacd0b85a97d-37311840242mr10099966f8f.10.1724842137591;
        Wed, 28 Aug 2024 03:48:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7EFzajU9R0cIfi0WpVWAwu9xU6E8957dEvkMylSwWZUSBfj7al0N2kiYw185R28Bx93YG8g==
X-Received: by 2002:a5d:63c8:0:b0:371:86bc:6c05 with SMTP id ffacd0b85a97d-37311840242mr10099930f8f.10.1724842136774;
        Wed, 28 Aug 2024 03:48:56 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:1700:6b81:27cb:c9e2:a09a? (p200300cbc70617006b8127cbc9e2a09a.dip0.t-ipconnect.de. [2003:cb:c706:1700:6b81:27cb:c9e2:a09a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba61c0666sm18312685e9.0.2024.08.28.03.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 03:48:56 -0700 (PDT)
Message-ID: <42aba316-2b01-4fdb-9aff-9e670aac4c6e@redhat.com>
Date: Wed, 28 Aug 2024 12:48:55 +0200
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
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: hughd@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
 vishal.moola@gmail.com, peterx@redhat.com, ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <e866151ccd257ca14a9361ba59f8c3086aa76e4f.1724310149.git.zhengqi.arch@bytedance.com>
 <f318f65d-4198-481c-98a0-00415664614c@redhat.com>
 <4481a0e4-a7a5-4223-a8ab-d1215d7c6352@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <4481a0e4-a7a5-4223-a8ab-d1215d7c6352@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27.08.24 06:33, Qi Zheng wrote:
> Hi David,
> 
> On 2024/8/26 23:21, David Hildenbrand wrote:
>> On 22.08.24 09:13, Qi Zheng wrote:
>>> Currently, the usage of pte_offset_map_nolock() can be divided into the
>>> following two cases:
>>>
>>> 1) After acquiring PTL, only read-only operations are performed on the
>>> PTE
>>>      page. In this case, the RCU lock in pte_offset_map_nolock() will
>>> ensure
>>>      that the PTE page will not be freed, and there is no need to worry
>>>      about whether the pmd entry is modified.
>>
>> There is also the usage where we don't grab the PTL at all, and only do
>> a racy (read-only) lookup.
> 
> IIUC, pte_offset_map() should be used instead of pte_offset_map_nolock()
> in this case.

Yes, but the filemap.c thingy conditionally wants to lock later. But I 
agree that pte_offset_map() is better when not even wanting to lock.

[...]

>>> accessor functions:
>>>     - pte_offset_map_nolock()
>>>        maps PTE, returns pointer to PTE with pointer to its PTE table
>>>        lock (not taken), or returns NULL if no PTE table;
>>
>> What will happen to pte_offset_map_nolock() after this series? Does it
>> still exist or will it become an internal helper?
> 
> I choose to remove it completely in [PATCH v2 13/14].
> 

Ah, great.

[...]

>> If someone thinks not requiring a non-NULL pointer is better, please
>> speak up, I'm not married to that idea :)
>>
>>> +    pte = __pte_offset_map(pmd, addr, &pmdval);
>>> +    if (likely(pte))
>>> +        *ptlp = pte_lockptr(mm, &pmdval);
>>> +    *pmdvalp = pmdval;
>>> +    return pte;
>>> +}
>>> +
>>>    /*
>>>     * pte_offset_map_lock(mm, pmd, addr, ptlp), and its internal
>>> implementation
>>>     * __pte_offset_map_lock() below, is usually called with the pmd
>>> pointer for
>>> @@ -356,6 +383,22 @@ pte_t *pte_offset_map_nolock(struct mm_struct
>>> *mm, pmd_t *pmd,
>>>     * recheck *pmd once the lock is taken; in practice, no callsite
>>> needs that -
>>>     * either the mmap_lock for write, or pte_same() check on contents,
>>> is enough.
>>>     *
>>> + * pte_offset_map_ro_nolock(mm, pmd, addr, ptlp), above, is like
>>> + * pte_offset_map(); but when successful, it also outputs a pointer
>>> to the
>>> + * spinlock in ptlp - as pte_offset_map_lock() does, but in this case
>>> without
>>> + * locking it.  This helps the caller to avoid a later
>>> pte_lockptr(mm, *pmd),
>>> + * which might by that time act on a changed *pmd:
>>> pte_offset_map_ro_nolock()
>>> + * provides the correct spinlock pointer for the page table that it
>>> returns.
>>> + * For readonly case, the caller does not need to recheck *pmd after
>>> the lock is
>>> + * taken, because the RCU lock will ensure that the PTE page will not
>>> be freed. > + *
>>> + * pte_offset_map_rw_nolock(mm, pmd, addr, pmdvalp, ptlp), above, is
>>> like
>>> + * pte_offset_map_ro_nolock(); but when successful, it also outputs the
>>> + * pdmval. For cases where pte or pmd entries may be modified, that
>>> is, maywrite
>>> + * case, this can help the caller recheck *pmd once the lock is
>>> taken. In some
>>> + * cases, that is, either the mmap_lock for write, or pte_same()
>>> check on
>>> + * contents, is also enough to ensure that the pmd entry is stable.
>>> + *
>>>     * Note that free_pgtables(), used after unmapping detached vmas, or
>>> when
>>>     * exiting the whole mm, does not take page table lock before
>>> freeing a page
>>>     * table, and may not use RCU at all: "outsiders" like khugepaged
>>> should avoid
>>
>> In general to me a step into the right direction. Likely the
>> documentation could be further clarified in some aspects:
>>
>> Like that the use of pte_offset_map_ro_nolock() does not allow to easily
>> identify if the page table was replaced in the meantime. Even after
>> grabbing the PTL, we might be looking either at a page table that is
>> still mapped or one that was unmapped and is about to get freed. But for
>> R/O access this is usually sufficient AFAIUK.
>>
>> Or that "RO" / "RW" expresses the intended semantics, not that the
>> *kmap* will be RO/RW protected.
> 
> How about the following:
> 
> pte_offset_map_ro_nolock(mm, pmd, addr, ptlp), above, is like
> pte_offset_map(); but when successful, it also outputs a pointer to the
> spinlock in ptlp - as pte_offset_map_lock() does, but in this case
> without locking it.  This helps the caller to avoid a later
> pte_lockptr(mm, *pmd), which might by that time act on a changed *pmd:
> pte_offset_map_ro_nolock() provides the correct spinlock pointer for the
> page table that it returns. Even after grabbing the spinlock, we might
> be looking either at a page table that is still mapped or one that was
> unmapped and is about to get freed. But for R/O access this is usually
> sufficient AFAIUK.

Drop the "AFAIUK" :)

"For R/O access this is sufficient."

> 
> pte_offset_map_rw_nolock(mm, pmd, addr, pmdvalp, ptlp), above, is like
> pte_offset_map_ro_nolock(); but when successful, it also outputs the
> pdmval. For R/W access, the callers can not accept that the page table
> it sees has been unmapped and is about to get freed. The pmdval can help
> callers to recheck pmd_same() to identify this case once the spinlock is
> taken. For some cases where exclusivity is already guaranteed, such as
> holding the write lock of mmap_lock, or in cases where checking is
> sufficient, such as a !pte_none() pte will be rechecked after the
> spinlock is taken, there is no need to recheck pdmval.

Right, using pte_same() one can achieve a similar result, assuming that 
the freed page table gets all ptes set to pte_none().

page_table_check_pte_clear_range() before pte_free_defer() in 
retract_page_tables/collapse_pte_mapped_thp() sanity checks that I think.

In collapse_huge_page() that is not the case. But here, we also 
currently grab all heavily locks, to prevent any concurrent page table 
walker.

> 
> Note: "RO" / "RW" expresses the intended semantics, not that the *kmap*
> will be RO/RW protected.


Good. Please also incorporate the feedback from Muchun.

-- 
Cheers,

David / dhildenb


