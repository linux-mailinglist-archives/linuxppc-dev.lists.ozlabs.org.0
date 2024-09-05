Return-Path: <linuxppc-dev+bounces-1050-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBBE96D67E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 12:56:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzx9z3QJLz2ytN;
	Thu,  5 Sep 2024 20:56:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725533783;
	cv=none; b=dN4tuXII/RE2uIIRD6lfItI+xdC5R/a+ecOG1n8M+kTTFQuPvvn/nYyin+s+b+gcZfZA2rh7VBUCSXy3KbolCG2Ou7l0/y1d7shM5CCQa5ixXZj/SUYB3R4q+Fkubr4Yx6QRju4NzyR2YpzqNU4lMGhVmR471Ok89HmuQdhSkv1U2N0qMUYHmqQNj6yw80nQWzEulgtAQVe5JD0rlCEsBucP+pSLIxbfK1smHZJWPKEZVf/j3x0a2sbBgXXt0EsnNgPok/AsNaN/jGj2x53y22wwu4K9t+CHStUiL1mP94RoBuaVzdvGu+B4J6HTqWdKODTDiE+8P6B0VSq1L1xTkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725533783; c=relaxed/relaxed;
	bh=4DJPppfvsq3bVrU8OAZnr57xaqKDJESryIS8WamVFSc=;
	h=DKIM-Signature:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type; b=nXStJxxm66FIGQ/PuRotp+3bR8Nzq2dlrCXLJ/OBpEQrAueLS/PED23qwMTl38KWo6oJG9TnkzhTwnrw94ks5RhF5cHJL7P0+ewXLkm+l84NjvePTel7G9HpXqX0Iimf+ZRp1y0h3m6azjRs5t4ounK62CbYWLHNyyY2M3cvKnrs7AGno9cTpc0pDhdsr5XNiv8jhkNEznnwht+OPHXYRO1sAArpj2NVXk6yOgFiff1ws6U0o18NfRRZMUH1whUavVlGC4P1Kw7Hv/gOFby/6270RF7N55+3rFlwlk5ccQ3APuFvSTL2nIl0EZcyt9BnLCQ1iI3VAiqhYWakwUzONA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=SVRoeHBF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=SVRoeHBF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wzx9z1r3dz2yN8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 20:56:23 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7c6b4222fe3so514417a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Sep 2024 03:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1725533780; x=1726138580; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4DJPppfvsq3bVrU8OAZnr57xaqKDJESryIS8WamVFSc=;
        b=SVRoeHBFyAqDmBIhEqUCCjJJ/7Oyl/GNsAL+YuPZNnb/VCCzPrpDflfKQuRtMMP36+
         eF5cY+o9rG3w3i8MuZmsuHFr7+Zfaelk3uy1hdmj/TIgqRUWePINempS1QMk2+EgcO00
         U9QzypSfuJo8eNLr6DaW+HmOHNXaA32eO9qyOuAGz8GtitzpGmH1e3rdfmuHIbbV3CXN
         jI14Jcg73pzw7Af+31LeuWno142i2q82rdzU7wV6l6/j0AFttHjTv29TFn8clEVIXYe6
         8hSsZSGFHfrisKh0C9wsLQHNOOPHOfkgVX4Y73wr5+1oQoaD2FgOkm6Z2uLqgy3lIyk2
         Hs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725533780; x=1726138580;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4DJPppfvsq3bVrU8OAZnr57xaqKDJESryIS8WamVFSc=;
        b=OXCFqkb4PdKT6wk7pNGkdc5mnfqv0+srVgrf1DEbBY/7TDTVGla1wxKNhSFLIjvTDd
         6FzCPrO9JUmNWjl9GM3tu/pCrhIPzqufVF93f19xwVozkYG6CAHBpzTwwOk4yCDexM8I
         TPsNjifvTjzmQjRy9gSl+rxLdFPS596E+Od3i7GazYlPbZcj9+QJv50m18kklvzaUSwn
         S8mVPuF49kgyGWbH3U5nYBbvTy56wk/Ow2+SC1u5061xcVfEk5NN3FLkNjTxlOXJpqit
         kcFGmdZJ2owB+r+hMGxnzF59FD8vX3k/jkGIS5HfvXL+uElLpKKIf5MWtMOuiWx4Aoxo
         TRxw==
X-Forwarded-Encrypted: i=1; AJvYcCU00Nl6qmNRT9EtGRId05ksWTXlgxZt5BiaglaK1MvjEoZ7hP2OkR7nTCLybmbdOs+lG/r0Wh/fx0Qathg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyQc72HQF4gVXGgjx2DubchvnIFW3EZOjOK9hDZZeP7JyAOFSrT
	hyMLo8ybTy6pkQNV1cr3eCPicW6PwU7FNs3vZz2BpcyZid7Z7Oh9M2Eu1WA87BE=
X-Google-Smtp-Source: AGHT+IHilYsBgfadCapwrPljiidrpCa41K0Hyb98p/0x3xNpGLLwKBsqtfV83jJC0DRLwz+P6VWrRQ==
X-Received: by 2002:a17:90a:de8c:b0:2d8:7307:3f73 with SMTP id 98e67ed59e1d1-2d8906204f6mr17130275a91.39.1725533780409;
        Thu, 05 Sep 2024 03:56:20 -0700 (PDT)
Received: from [10.4.59.158] ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8b8fe1f68sm9312094a91.31.2024.09.05.03.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 03:56:20 -0700 (PDT)
Message-ID: <cccc16ad-21fb-4c99-8c49-91ee15c202cc@bytedance.com>
Date: Thu, 5 Sep 2024 18:56:14 +0800
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
Subject: Re: [PATCH v3 09/14] mm: mremap: move_ptes() use
 pte_offset_map_rw_nolock()
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 david@redhat.com, hughd@google.com, willy@infradead.org, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com, christophe.leroy2@cs-soprasteria.com
References: <20240904084022.32728-1-zhengqi.arch@bytedance.com>
 <20240904084022.32728-10-zhengqi.arch@bytedance.com>
 <1b03a7de-1278-4e36-8068-885dd1c29742@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <1b03a7de-1278-4e36-8068-885dd1c29742@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/9/5 17:25, Muchun Song wrote:
> 
> 
> On 2024/9/4 16:40, Qi Zheng wrote:
>> In move_ptes(), we may modify the new_pte after acquiring the new_ptl, so
>> convert it to using pte_offset_map_rw_nolock(). Since we may free the PTE
>> page in retract_page_tables() without holding the read lock of mmap_lock,
>> so we still need to do a pmd_same() check after holding the PTL.
> 
> retract_page_tables() and move_ptes() are synchronized with
> i_mmap_lock, right?

Right, will remove the pmd_same() check in v4. Thanks!

> 
> Muchun,
> Thanks.
> 
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>   mm/mremap.c | 20 ++++++++++++++++++--
>>   1 file changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/mremap.c b/mm/mremap.c
>> index 24712f8dbb6b5..16e54151395ad 100644
>> --- a/mm/mremap.c
>> +++ b/mm/mremap.c
>> @@ -143,6 +143,7 @@ static int move_ptes(struct vm_area_struct *vma, 
>> pmd_t *old_pmd,
>>       spinlock_t *old_ptl, *new_ptl;
>>       bool force_flush = false;
>>       unsigned long len = old_end - old_addr;
>> +    pmd_t pmdval;
>>       int err = 0;
>>       /*
>> @@ -175,14 +176,29 @@ static int move_ptes(struct vm_area_struct *vma, 
>> pmd_t *old_pmd,
>>           err = -EAGAIN;
>>           goto out;
>>       }
>> -    new_pte = pte_offset_map_nolock(mm, new_pmd, new_addr, &new_ptl);
>> +    /*
>> +     * Since we may free the PTE page in retract_page_tables() without
>> +     * holding the read lock of mmap_lock, so we still need to do a
>> +     * pmd_same() check after holding the PTL.
>> +     */
>> +    new_pte = pte_offset_map_rw_nolock(mm, new_pmd, new_addr, &pmdval,
>> +                       &new_ptl);
>>       if (!new_pte) {
>>           pte_unmap_unlock(old_pte, old_ptl);
>>           err = -EAGAIN;
>>           goto out;
>>       }
>> -    if (new_ptl != old_ptl)
>> +    if (new_ptl != old_ptl) {
>>           spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
>> +
>> +        if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(new_pmd)))) {
>> +            pte_unmap_unlock(new_pte, new_ptl);
>> +            pte_unmap_unlock(old_pte, old_ptl);
>> +            err = -EAGAIN;
>> +            goto out;
>> +        }
>> +    }
>> +
>>       flush_tlb_batched_pending(vma->vm_mm);
>>       arch_enter_lazy_mmu_mode();
> 

