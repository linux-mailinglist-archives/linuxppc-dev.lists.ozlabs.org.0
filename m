Return-Path: <linuxppc-dev+bounces-792-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 734079657BC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 08:38:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww7kb2xTwz3041;
	Fri, 30 Aug 2024 16:37:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724999879;
	cv=none; b=I/gS0DmVdALIorKzu/JshG7yj6CDDGur1qjG5aNn/gmFX8mloIrUxvVVeCUP/zTZ0IZ0DMlip6T7vZJtRTmuHVxkWIlXFpeAY175JZYiDhyCTGA+43dln1c/BLCS7yfumSVe7oJuHlgTDdqEyKBdAwr6Krn6gL06s8tzphcc95MPcyJJbkwos1mnF2/RdeWiVeyHD5s0vqcBznsOS1T1a38CaLiPLE6iZQiGOEde9FUNlxx1dAiRVHb1ys/PTVh0UIJYreSN6e3VB3DVIf49gIVpCRLDSdUBkQ/mcGUEp5IwEd4OTW6QgJlhaaAUXOfdeuHW3PyGZR0l6MDBDRTw4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724999879; c=relaxed/relaxed;
	bh=3Bon54RF1R2NVypdRmo7ECOWifc7jarfkosYQe9jtxo=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding; b=gHdhbeo+Zh0gpFzp2Y3Fi+mgrkbjY1uD9BsC5qGjgZrfeYEF2mKPUyDiaS8AyFAgJhg3p+DTg6EkLdy3njDt2juTi2K0PXGEYxH6bd3aOKOeJ14vSDbtBa2DuSZ9MIdfkAtkxqbKg5pa1BxLz2ymOb64JeC2Oqp4BBKH4yr6Xm5IumfLCY9bp+couqrtDon/YfE5GBmuB4j8CsgW6G/nRBqwkY51QhzBJWHs7VfJRJRMVEMhH2F7Wdi+bojrs5YCjyU7ZkM+eb81o1dFn8x73pH0a8Ot8LGsGdPYyEueJas0PXAOsIRM55B6bWe69cS9y+9zmwB9l25ARrD3uZQsuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=T0zxbYxz; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=T0zxbYxz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww7kZ1Ycwz303K
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 16:37:56 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20223b5c1c0so13633305ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 23:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724999874; x=1725604674; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Bon54RF1R2NVypdRmo7ECOWifc7jarfkosYQe9jtxo=;
        b=T0zxbYxzV0aTepQG1wt75F44bfiAriskJCZjqSzvcfZlq51s6JiettW48fklU3efdB
         fkCQaGyrxTVvfCMyFHUjo5GUIyXMB80ourmUilUxbYifN59ptDYmw+IUPJY+4K84LnSq
         OGP0nE+x2MkHw3NLICE9jX1bk4s5AC0yKRRjtzu1w1pEul08SsgGld4cSx4imni1TcSa
         f1KbK8tkWPTD2S1xqWEir5zc7r54LeP3B7zHEBAGBKgwDPxsf2e7H19X8AfeLtu+eBJB
         lspS4f4lWwI6ljMMJcfnHu3k+epU0hYQ5e2U0YQXCj6hMpJbuVknxV6gwYK7vHIp9ACf
         6PfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724999874; x=1725604674;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Bon54RF1R2NVypdRmo7ECOWifc7jarfkosYQe9jtxo=;
        b=vBKLmNrQsEqQbkyyrqTzlUHCzNSeQqa4H1axlUuhxB5y1pn9Q+1cDAB/SrU3m13OPI
         mqHsKMNrZvLoOCFHD9P7I7Gu4+FyLygoxoj7Vfeotlw/gnEXSYqnEbqiQSrHAgVunnT+
         MjqnD6naRrml/Q2aJr0NgHGdQdZO77g9x/qFlsvPEjLx5F77p7zhPGtEp8gKK75cN6JA
         vdN23smUYpqTbQrdkdu/c0eElu0HcBFRWf/jZcx3Tj1A9hUvDzVdKMxsZvf2LxHAg9pn
         O6puKyo56R0KjpqP9Vf5lX4jDxB/3rMrkcnaataJnOQCgntkgDk0rOjyhYhQSzbddMGp
         jh+w==
X-Forwarded-Encrypted: i=1; AJvYcCXDNApLa++/nI54CpdKJvcLikfq0+tlTNx7wxF5dY1dWL6vN9Uvb8sxV/na2yuHG/68cVINk2mwJ2v6PfU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzrYG0RdS6Qvv8muDQcfEwGlNy2v60Qd73p6WENedjlB3M7Z5iY
	q+GYj1SLqw19ru+MjW291Twxp6vDNQofBG+e8Z2Qghny3koBfJ64m5wPGn3a+uI=
X-Google-Smtp-Source: AGHT+IHyOcbVEmEnId0vqSTOSgNPwIG0EVfd04p/S0G8sj3iEkziTAMfHoZozyVyNkJHSOdGOsiCTQ==
X-Received: by 2002:a17:902:fb86:b0:203:a0ea:62a3 with SMTP id d9443c01a7336-2050c219597mr35192155ad.1.1724999873833;
        Thu, 29 Aug 2024 23:37:53 -0700 (PDT)
Received: from [10.4.59.158] ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515533bd3sm20643165ad.140.2024.08.29.23.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 23:37:53 -0700 (PDT)
Message-ID: <a3986998-1f63-4e8c-94ed-c6d1004bf111@bytedance.com>
Date: Fri, 30 Aug 2024 14:37:44 +0800
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
Cc: muchun.song@linux.dev, hughd@google.com, willy@infradead.org,
 vbabka@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
 vishal.moola@gmail.com, peterx@redhat.com, ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <e866151ccd257ca14a9361ba59f8c3086aa76e4f.1724310149.git.zhengqi.arch@bytedance.com>
 <f318f65d-4198-481c-98a0-00415664614c@redhat.com>
 <4481a0e4-a7a5-4223-a8ab-d1215d7c6352@bytedance.com>
 <42aba316-2b01-4fdb-9aff-9e670aac4c6e@redhat.com>
 <63ef0611-50c2-49b5-ba3f-c6ea81f9fbce@bytedance.com>
 <8cbd44d9-f39b-4ee8-b1c1-ba89c12c0e23@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <8cbd44d9-f39b-4ee8-b1c1-ba89c12c0e23@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/8/29 23:31, David Hildenbrand wrote:
> On 29.08.24 12:59, Qi Zheng wrote:
>>
>>
>> On 2024/8/28 18:48, David Hildenbrand wrote:
>>> On 27.08.24 06:33, Qi Zheng wrote:
>>
>> [...]
>>
>>>> sufficient AFAIUK.
>>>
>>> Drop the "AFAIUK" :)
>>>
>>> "For R/O access this is sufficient."
>>>
>>>>
>>>> pte_offset_map_rw_nolock(mm, pmd, addr, pmdvalp, ptlp), above, is like
>>>> pte_offset_map_ro_nolock(); but when successful, it also outputs the
>>>> pdmval. For R/W access, the callers can not accept that the page table
>>>> it sees has been unmapped and is about to get freed. The pmdval can 
>>>> help
>>>> callers to recheck pmd_same() to identify this case once the 
>>>> spinlock is
>>>> taken. For some cases where exclusivity is already guaranteed, such as
>>>> holding the write lock of mmap_lock, or in cases where checking is
>>>> sufficient, such as a !pte_none() pte will be rechecked after the
>>>> spinlock is taken, there is no need to recheck pdmval.
>>>
>>> Right, using pte_same() one can achieve a similar result, assuming that
>>> the freed page table gets all ptes set to pte_none().
>>>
>>> page_table_check_pte_clear_range() before pte_free_defer() in
>>> retract_page_tables/collapse_pte_mapped_thp() sanity checks that I 
>>> think.
>>
>> Since commit 1d65b771bc08, retract_page_tables() only holds the
>> i_mmap_lock_read(mapping) but not mmap_lock, so it seems that
>> holding the write lock of mmap_lock cannot guarantee the stability
>> of the PTE page.
> 
> Guess it depends. khugepaged on anonymous memory will block any page 
> table walkers (like anon THP collapse does) -- per-VMA lock, mmap lock, 
> mapping lock/RMAP lock ... so it *should* be sufficient to hold any of 
> these, right?

retract_page_tables() itself is safe, but because it does not hold the
read lock of mmap_lock, other paths that only hold the write lock of
mmap_lock may be concurrent with it, such as the paths in
[PATCH v2 08/14] and [PATCH v2 09/14].

> 
> So at least for now, these (anonymous memory) cases would be ok. Likely 
> that will change when reclaiming empty page tables.

When reclaiming the empty page tables, I will hold the read lock of 
mmap_lock.

Therefore, either perform a pmd_same() check on the case where the
write lock of mmap_lock is held, or add the read lock of mmap_lock
to retract_page_tables() as well.

> 
>>
>> IIUC, I will also perform a pmd_same() check on the case where the
>> write lock of mmap_lock is held in v3. Or do I miss something?
> 
> Can you spell out the instances where you think it might be required.

For example, the paths in [PATCH v2 08/14] and [PATCH v2 09/14] need
to do pmd_same() check after holding the PTL.

> 

