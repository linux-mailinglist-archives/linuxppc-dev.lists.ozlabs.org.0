Return-Path: <linuxppc-dev+bounces-1559-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA87A98408E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 10:34:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCY733xYWz2yZ6;
	Tue, 24 Sep 2024 18:34:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727166847;
	cv=none; b=fburP+OS0SF29WT+qWDsF3oyb8z3GO7cILQMUyFTSxdmBfacu0npCoUtkNkYz6iQ3S9bSijQlPWTRWyzka5+YKeKw+VtepNjX/FfGxtbfZMtwnFkWLmYEjbl/4MGOuVwyXElZCIWi5RZZu3ulmIQe2qx8TPpdhfiqUpXzx4Lmh+065veHYO4ej55dq2k8ZE17FmDgo0KZI0CQH9I3taKJ1bwNWViLE8oQw5lKMs4XpOIBqM4uA6PhIKqUaierwl3o5iblSNehe9oNAYApxX50Z3A8WbtKOeEU9oMsVkfV2KKE/6+u6RCREl/QOK2vL73AmaOmZPKXVohV42vrAqjQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727166847; c=relaxed/relaxed;
	bh=XBUNOy5kKW7QWknxeNIjK0yZwggERJ1vSRDkc0sCRPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R+4g4RfoV+e9qLwZ00AeK4mSXN2T02aq2SGX440bjaYTWYMQBJ2cJTVzmTzMazd6K0ZABwxkB4OZ0cEOKXTtjiN9PcX33BBdkd8QXbTuj5II3uKb0B62AhNdXjd2vIXgDIoD+QzYJty3QRo7mZcWHG1CI9KIt2V8swmcfaWihbdT/+y8JEnx2XhkMjDi3nzEEFSFV28vjBy6vhILLrXbatXDD84a7uhy9WK0hESYFiaI/P6xmVcsLAEKhcJdnNv9grybxITXvwt3uo2KBgI8MNRNDBtQVTK2uJDmmZBSaG94EUtWAyJmitKalSZ9SxA5Yc1C6WuoEb3Te5FwAvOkBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=GCyejbR2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=GCyejbR2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCY724Rshz2yZ4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 18:34:03 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2da4e84c198so3659719a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 01:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727166840; x=1727771640; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XBUNOy5kKW7QWknxeNIjK0yZwggERJ1vSRDkc0sCRPc=;
        b=GCyejbR2/wsS++5xjGTiRmz6ZgjPHY9jk4+WwQYhVpC+Q+rTShxCaK/qPwwUSGzJJW
         KhEIOCZp3zPX2e6Q8T/1sOB8UvNBVbm/S4VH/eX5DVNEWtFqWd+3BsLLUppS8qR/wI3D
         zR2juTurMeUlDfGenTpsPBL5FmMp0N1+vKwdi54kX6XM8bStDdQ7CeKY1rEAasaeKlrw
         HaAiAoYFCcrZSAkP8o+xtChPlTlHbixktd3KaZbTSjNCi06QP6gfr9Rc19LuGx9nug4V
         QjsWrKIz+C6N4sqUwvFbGlsdfW1dkesO6Z+0baT4cKAGEd8E6iHY9gGehr6SPVet4foJ
         24sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727166840; x=1727771640;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XBUNOy5kKW7QWknxeNIjK0yZwggERJ1vSRDkc0sCRPc=;
        b=aCH9d3fhu1zf6JimXaAH/agW11Fv1kizRyTz6tu1tjIFNZoWorGSMUyG3XgmdF96IW
         vMDxZkQxqSJ6H1Q4HMJ0woCaM95YEdMzSH1W8C4LHWGTvmc9VQBvtXnGeMye+4NrE7Oq
         Nit6T7g1xbRTqZuodr1i9e8hwkvRvi+y4OE4DIUpG8GoFmdBrhN5vliXTG0iSrgj4zcC
         0VvxyRxQanNc2qMgbR8unpCcTN1dK0rSktMayDNsmGUXy09TPQkPLnEWpDvM1XW8+x3L
         9/al9xtp8Upnzj6RSwR7v7QlrPgD7RDvOj6IDbTUsDpQdry6eX6a4l0aCwTPEfhL5/85
         dPmg==
X-Forwarded-Encrypted: i=1; AJvYcCWXNKHiy5LzWulVxkhJPOr9BWP+wchkUn+bgBGJGwjia1u71ugLV32zHfR011KdLY3Ff4PIbc0/2g5jAu4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz2y8+oCEWT49vAnr91fFQLE34fmzHxw1DgYPipP0O/f3+9yFZ+
	2StF8hET2jjseoN4M2ekr24v7I2tkDKFH7FOSeUAsr6xxWWS5tURrezr+cmJ32w=
X-Google-Smtp-Source: AGHT+IGA58OvjKH0J4J2cIX3fLSuJFJn0gN/GxxZsycyrte2t3fRU9GFiUDq/Yj/11t+E+u1iwSoVA==
X-Received: by 2002:a17:90a:744d:b0:2d8:b075:7862 with SMTP id 98e67ed59e1d1-2dd7f380806mr18925374a91.5.1727166840378;
        Tue, 24 Sep 2024 01:34:00 -0700 (PDT)
Received: from [10.68.125.128] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e058f2e2f5sm953563a91.24.2024.09.24.01.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 01:33:59 -0700 (PDT)
Message-ID: <cccc53fc-29c2-43c0-83d4-d330bade70c7@bytedance.com>
Date: Tue, 24 Sep 2024 16:33:52 +0800
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
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <E2AAD3DA-4C73-4785-939C-13164FA8543D@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/9/24 16:25, Muchun Song wrote:
> 
> 
>> On Sep 24, 2024, at 14:11, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>> ﻿In the caller of map_pte(), we may modify the pvmw->pte after acquiring
>> the pvmw->ptl, so convert it to using pte_offset_map_rw_nolock(). At
>> this time, the pte_same() check is not performed after the pvmw->ptl held,
>> so we should get pmdval and do pmd_same() check to ensure the stability of
>> pvmw->pmd.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>> mm/page_vma_mapped.c | 25 ++++++++++++++++++++-----
>> 1 file changed, 20 insertions(+), 5 deletions(-)
>>
>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>> index ae5cc42aa2087..6410f29b37c1b 100644
>> --- a/mm/page_vma_mapped.c
>> +++ b/mm/page_vma_mapped.c
>> @@ -13,9 +13,11 @@ static inline bool not_found(struct page_vma_mapped_walk *pvmw)
>>     return false;
>> }
>>
>> -static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)
>> +static bool map_pte(struct page_vma_mapped_walk *pvmw, pmd_t *pmdvalp,
>> +            spinlock_t **ptlp)
>> {
>>     pte_t ptent;
>> +    pmd_t pmdval;
> 
> Why declare a new variable? Can’t we use *pmdvalp instead?

It's just a coding habit, both are fine for me.

> 
>>
>>     if (pvmw->flags & PVMW_SYNC) {
>>         /* Use the stricter lookup */
>> @@ -25,6 +27,7 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)
>>         return !!pvmw->pte;
>>     }
>>
>> +again:
>>     /*
>>      * It is important to return the ptl corresponding to pte,
>>      * in case *pvmw->pmd changes underneath us; so we need to
>> @@ -32,10 +35,11 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)
>>      * proceeds to loop over next ptes, and finds a match later.
>>      * Though, in most cases, page lock already protects this.
>>      */
>> -    pvmw->pte = pte_offset_map_nolock(pvmw->vma->vm_mm, pvmw->pmd,
>> -                      pvmw->address, ptlp);
>> +    pvmw->pte = pte_offset_map_rw_nolock(pvmw->vma->vm_mm, pvmw->pmd,
>> +                         pvmw->address, &pmdval, ptlp);
>>     if (!pvmw->pte)
>>         return false;
>> +    *pmdvalp = pmdval;
>>
>>     ptent = ptep_get(pvmw->pte);
>>
>> @@ -67,8 +71,13 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)
>>     } else if (!pte_present(ptent)) {
>>         return false;
>>     }
>> +    spin_lock(*ptlp);
>> +    if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pvmw->pmd)))) {
>> +        pte_unmap_unlock(pvmw->pte, *ptlp);
>> +        goto again;
>> +    }
>>     pvmw->ptl = *ptlp;
>> -    spin_lock(pvmw->ptl);
>> +
>>     return true;
>> }
>>
>> @@ -278,7 +287,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>             step_forward(pvmw, PMD_SIZE);
>>             continue;
>>         }
>> -        if (!map_pte(pvmw, &ptl)) {
>> +        if (!map_pte(pvmw, &pmde, &ptl)) {
>>             if (!pvmw->pte)
>>                 goto restart;
>>             goto next_pte;
>> @@ -307,6 +316,12 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>         if (!pvmw->ptl) {
>>             pvmw->ptl = ptl;
>>             spin_lock(pvmw->ptl);
>> +            if (unlikely(!pmd_same(pmde, pmdp_get_lockless(pvmw->pmd)))) {
>> +                pte_unmap_unlock(pvmw->pte, pvmw->ptl);
>> +                pvmw->ptl = NULL;
>> +                pvmw->pte = NULL;
>> +                goto restart;
>> +            }
>>         }
>>         goto this_pte;
>>     } while (pvmw->address < end);
>> --
>> 2.20.1
>>

