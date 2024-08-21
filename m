Return-Path: <linuxppc-dev+bounces-278-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F3295981C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 12:46:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wpjg86flqz2yY1;
	Wed, 21 Aug 2024 20:46:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1033"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=iUumjJX7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpgrZ2t3cz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 19:24:12 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2d3c071d276so4512556a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 02:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724232249; x=1724837049; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wSX2UW/W8B7Ffz8kkQMnXKOYBxRf7RK7/SpflK+Hcb8=;
        b=iUumjJX71CVRCao48j33SmxHyXrUJ6zIQ8CVv/E0wS6l6LsBravdOWt4wwp2cLzsKG
         G6jVVATJeIML47elax5I4YwtJEBVj2Ez73c83d1+QH95RSs4PO6bggv0sEPmqog/FMcT
         dfPLpaljtzTfKLq8eETSxy77hZrwuBSDh47EqrJ/O5hDLsU9VdBfsH/86rMS1U8q0tBp
         mVhA9nKcvc6164G/SU2soVFr26rye+8m/LoD+vymWQ2vTCPysyewIRFYVWez7sAB7v2M
         91SljThc0BF2EDJzmCSnaFy2UL34p/uwH89eVlo70IgeBUpkw99y9OiyVV4sH2Jz3LAK
         L1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724232249; x=1724837049;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wSX2UW/W8B7Ffz8kkQMnXKOYBxRf7RK7/SpflK+Hcb8=;
        b=oFHW9sjKhtOpJqd9ulW6jeaUeaVly8QG+Z7WVE/rENWyxS4YBUC/LyW/tZDbmNHRNX
         B8YXBBewqv/x2gQ1TSYCAQi5c+e1UZ6RDlIniNTsUtQ1SlxfN3JHmHLdGWSB9vBiHx1G
         cOYidaKpesfd4dUmIrXAodNGJTqpKBDz0e8xa0WzoHFK5bziXXIcYDtaACKlnvlo9uZe
         /+MeKsd9yiuzqQ50LQWwLR95jxQ2Dr6lYAGUsy6Lzk6bdQwl+2UPwwQt6CR80TGV05xT
         3fdL9WbaJNdnufgDBdnLNupqmMZ6kHFECMQ5plq78kuhfD3NxIZ132ykdcEBhLNypUt3
         n/wg==
X-Forwarded-Encrypted: i=1; AJvYcCUilXOLM0LAu5uFjEWvDeKWJOTkN+coNK0/aQfCJo2JCg0Q++wAKUbqvjK3JiwLF8s4o76e2CCCMAUkki4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx20mLHby9aHaWBq1ZbbtgKtZX2U57/g3gbzTcHzjdE/vp0kqqa
	xRHQKf0uLr2PO9w5Gq6sbRjI08z1PePvYPoybOF+hfcefayuoM3gFu89c5utCqs=
X-Google-Smtp-Source: AGHT+IEgVXX8+VxDvZcoW1SKZwBL11MhagLS8dAsfWdFenURBSvzCDIeLTwfbkrSYGW7mFvGjU6V4w==
X-Received: by 2002:a17:90a:7893:b0:2c9:635b:7271 with SMTP id 98e67ed59e1d1-2d5e9a24ea2mr1735850a91.21.1724232249566;
        Wed, 21 Aug 2024 02:24:09 -0700 (PDT)
Received: from [10.84.144.49] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5ebb69487sm1232288a91.45.2024.08.21.02.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 02:24:09 -0700 (PDT)
Message-ID: <b4bf605a-d31a-40ad-8cee-fe505e45dc64@bytedance.com>
Date: Wed, 21 Aug 2024 17:24:01 +0800
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
Subject: Re: [PATCH 06/14] mm: handle_pte_fault() use
 pte_offset_map_maywrite_nolock()
Content-Language: en-US
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: "david@redhat.com" <david@redhat.com>, "hughd@google.com"
 <hughd@google.com>, "willy@infradead.org" <willy@infradead.org>,
 "muchun.song@linux.dev" <muchun.song@linux.dev>,
 "vbabka@kernel.org" <vbabka@kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "rppt@kernel.org" <rppt@kernel.org>,
 "vishal.moola@gmail.com" <vishal.moola@gmail.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <cover.1724226076.git.zhengqi.arch@bytedance.com>
 <239432a0bc56464e58a6baf3622fdc72526c8d57.1724226076.git.zhengqi.arch@bytedance.com>
 <6a586524-5116-4eaf-b4f3-c1aea290d7c1@cs-soprasteria.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <6a586524-5116-4eaf-b4f3-c1aea290d7c1@cs-soprasteria.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/8/21 17:17, LEROY Christophe wrote:
> 
> 
> Le 21/08/2024 à 10:18, Qi Zheng a écrit :
>> In handle_pte_fault(), we may modify the vmf->pte after acquiring the
>> vmf->ptl, so convert it to using pte_offset_map_maywrite_nolock(). But
>> since we already do the pte_same() check, so there is no need to get
>> pmdval to do pmd_same() check, just pass NULL to pmdvalp parameter.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>    mm/memory.c | 9 +++++++--
>>    1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 93c0c25433d02..d3378e98faf13 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -5504,9 +5504,14 @@ static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
>>    		 * pmd by anon khugepaged, since that takes mmap_lock in write
>>    		 * mode; but shmem or file collapse to THP could still morph
>>    		 * it into a huge pmd: just retry later if so.
>> +		 *
>> +		 * Use the maywrite version to indicate that vmf->pte will be
>> +		 * modified, but since we will use pte_same() to detect the
>> +		 * change of the pte entry, there is no need to get pmdval.
>>    		 */
>> -		vmf->pte = pte_offset_map_nolock(vmf->vma->vm_mm, vmf->pmd,
>> -						 vmf->address, &vmf->ptl);
>> +		vmf->pte = pte_offset_map_maywrite_nolock(vmf->vma->vm_mm,
>> +							  vmf->pmd, vmf->address,
>> +							  NULL, &vmf->ptl);
> 
> This might be the demonstration that the function name is becoming too long.
> 
> Can you find shorter names ?

Maybe use abbreviations?

pte_offset_map_ro_nolock()
pte_offset_map_rw_nolock()

> 
>>    		if (unlikely(!vmf->pte))
>>    			return 0;
>>    		vmf->orig_pte = ptep_get_lockless(vmf->pte);

