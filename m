Return-Path: <linuxppc-dev+bounces-1048-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD3596D675
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 12:55:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzx8x4vQGz2xpn;
	Thu,  5 Sep 2024 20:55:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1032"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725533729;
	cv=none; b=ZMtRo1IHaIxBYkj/lEsSXSm84QbDLeNYmIGOQ7DZLqpppFWM08nOSblDoxrj9AJ6TrsCF2SQpQQluedstryFa6E5+kSal0fQvbvQkCrFq5kWDk86fIckVc0w84gqZfU1Z222zG+wv3W0LIPiQNsuvjlma3fRdaPjq9g/ws9G/ZuOIDnleJiBQInzLeXnqsKqnVrKTPnLFOr8G0JAb03r4Ys8lUuBva5yLRx8PVMzAUjLh8APJ/bH4FojmBXRGEvO1pXjDBwW5Rr4ijPfu4Cnz/gfrG1uZEY4PLjnQYrJJmUoCpDFIJh09rCyJPCZ4PUP9a9P/HdQESSp5mwVHOw79g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725533729; c=relaxed/relaxed;
	bh=cXAtAu/pzenP53Rc519mW1EiWpptEkcfZ6dVtHtfUqo=;
	h=DKIM-Signature:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type; b=Ozrwiok4pYnJZxf9kUzg5dCIc+zLO1zdVsJ2RjHSp/UzJHq1+8w0/uV8oA1P6UHNyk75s9g8CRGPFEwfjYP/2iT4vebF8psEq5Sk+XjeNK1Sc8YbLVJT45GTGsxwmU0SjiGQAU737ezaPrlYz9dg0dXoXOXYL4soA/smP2hAhqfguMk4NOLKIOilGRAt9m91dlt6ivFutzov35oUz3TiDIuECf2j1xCmrdlx+tLULq54zPchQ9P0vv4SAWOElr/6kcS4we1+BLrsX2XDpEujSwIhnlXbJxG5bUp+tsXWdBPk2uCpad4ZhRTI+l4vT4t4iJnDtnsPoLZVC000aU+G6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=KAobGopq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=KAobGopq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wzx8w3qyPz2xY6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 20:55:26 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2d88c0f8e79so447577a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Sep 2024 03:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1725533721; x=1726138521; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cXAtAu/pzenP53Rc519mW1EiWpptEkcfZ6dVtHtfUqo=;
        b=KAobGopq6iFAuy1AR8OWe4s5/C+4QxLqU/lde9pMXre/tN/9k2VOAV7mwYS3BU7ju+
         wBaJb44jp3v4ALBXHgK7vhcGOwiAWlqB+6k99vz6y+hrdLu7qjsn/MswIItZL20aZwLC
         p4RAM6cZiRy57GBNWVf+qM9NAm++URIncMEb8nHA9Q1ihKSwaoZ2EIPtUefCEum6Iwvd
         XX20XQQxsCzDSvT5+27O5UypwhEv5GF9y5qdCLrdl2nKKn3iqL2QoG/O2OxMgXfmk+Bt
         zA4BWc2IghiSO0R0AymkWqut75deq/9CLjZAv0Hekzn9zl2eP/N2aOaN4oQ1g4wQGtHt
         N4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725533721; x=1726138521;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cXAtAu/pzenP53Rc519mW1EiWpptEkcfZ6dVtHtfUqo=;
        b=pZHPaDw+thXMgrdlq2u0q6aoiDTvEXaHwBIz7TPn+kYFx+m02Ku9VCoytuNGjmw1Jf
         69HgBVJxbjpP5r0d+3uQC0rJl1MjCKy0S2FcReG7ajDQySqAhxZQYpF+s7YiheHxTygS
         kxV3IIoOeyj+9TNbra03nnj9PdRlVVxPtkNzEUb7sGv4w5r+ID0OKx+XyBLQePOZ7lpA
         kBqlpEPtpGBQ3lPCGR6CXKvcfbDmR3piRHhGteo66RgCYF0axRMInXbb0eMXEdL+PYSK
         ZDWQCp4c9WANdqktRWV02WLkalPHc3/B4/0aEWPaBhXv4BUWKdANDz6vXUD3Ex5XXGN+
         STXw==
X-Forwarded-Encrypted: i=1; AJvYcCWnAPjulHm/FNAVbB7p9pJOVDmFxWBRkL3Ycfsl0hNxyehLp669JM5SLxJIRgZ10R5kj8Y5HDFEmfFkL4M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw64Am0hhc/zS/2AGkNGGJbJ3NAnz8fDXrbweg0xiBi7UASexg8
	z1dZZ4a/I7u6NJLMENY7bXHkClPSOqaBm/sQGPp82Q8MPgOBwus4uu6LRGsOcrHx4fVuY6SBgz6
	T
X-Google-Smtp-Source: AGHT+IEWI9EEiau/fdkKJLT8cSCi5xdgACnD/Y6KuBmHJCn7wH50I5yB/XRIbn+3AgAGKvj46vvmDA==
X-Received: by 2002:a17:90a:780b:b0:2d8:bb95:56f6 with SMTP id 98e67ed59e1d1-2da74cfc83dmr8851317a91.30.1725533721492;
        Thu, 05 Sep 2024 03:55:21 -0700 (PDT)
Received: from [10.4.59.158] ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8b8fe1f68sm9312094a91.31.2024.09.05.03.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 03:55:21 -0700 (PDT)
Message-ID: <03ebc281-c8e1-461b-a716-be6162947d31@bytedance.com>
Date: Thu, 5 Sep 2024 18:55:11 +0800
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
Subject: Re: [PATCH v3 08/14] mm: copy_pte_range() use
 pte_offset_map_rw_nolock()
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 david@redhat.com, hughd@google.com, willy@infradead.org, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com, christophe.leroy2@cs-soprasteria.com
References: <20240904084022.32728-1-zhengqi.arch@bytedance.com>
 <20240904084022.32728-9-zhengqi.arch@bytedance.com>
 <d8e2ef66-c345-43f0-9989-f20f16df34d3@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <d8e2ef66-c345-43f0-9989-f20f16df34d3@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/9/5 16:57, Muchun Song wrote:
> 
> 
> On 2024/9/4 16:40, Qi Zheng wrote:
>> In copy_pte_range(), we may modify the src_pte entry after holding the
>> src_ptl, so convert it to using pte_offset_map_rw_nolock(). Since we may
>> free the PTE page in retract_page_tables() without holding the read lock
>> of mmap_lock, so we still need to get pmdval and do pmd_same() check 
>> after
>> the ptl is held.
> 
> See commit 3db82b9374ca92, copy_pte_range and retract_page_tables
> are using vma->anon_vma to be exclusive.
> 
> retract_page_tables()                    copy_page_range()
>      vma_interval_tree_foreach()              if (!vma_needs_copy())
>          if (READ_ONCE(vma->anon_vma))            return 0;
>              continue;                        copy_pte_range()
> 
> So I think mmap write lock here is also used for keeping ->anon_vma stable.
> And we do not need pmd_same().

Indeed, will change it in v4. Thanks!

> 
> Muchun,
> Thanks.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>> Hi Muchun, since the code has changed, I dropped your Reviewed-by tag 
>> here.
>>
>>   mm/memory.c | 18 +++++++++++++++++-
>>   1 file changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 06674f94b7a4e..47974cc4bd7f2 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -1082,6 +1082,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, 
>> struct vm_area_struct *src_vma,
>>       struct mm_struct *src_mm = src_vma->vm_mm;
>>       pte_t *orig_src_pte, *orig_dst_pte;
>>       pte_t *src_pte, *dst_pte;
>> +    pmd_t pmdval;
>>       pte_t ptent;
>>       spinlock_t *src_ptl, *dst_ptl;
>>       int progress, max_nr, ret = 0;
>> @@ -1107,13 +1108,28 @@ copy_pte_range(struct vm_area_struct *dst_vma, 
>> struct vm_area_struct *src_vma,
>>           ret = -ENOMEM;
>>           goto out;
>>       }
>> -    src_pte = pte_offset_map_nolock(src_mm, src_pmd, addr, &src_ptl);
>> +
>> +    /*
>> +     * Since we may free the PTE page in retract_page_tables() without
>> +     * holding the read lock of mmap_lock, so we still need to do a
>> +     * pmd_same() check after holding the PTL.
>> +     */
>> +    src_pte = pte_offset_map_rw_nolock(src_mm, src_pmd, addr, &pmdval,
>> +                       &src_ptl);
>>       if (!src_pte) {
>>           pte_unmap_unlock(dst_pte, dst_ptl);
>>           /* ret == 0 */
>>           goto out;
>>       }
>>       spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
>> +
>> +    if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(src_pmd)))) {
>> +        pte_unmap_unlock(src_pte, src_ptl);
>> +        pte_unmap_unlock(dst_pte, dst_ptl);
>> +        /* ret == 0 */
>> +        goto out;
>> +    }
>> +
>>       orig_src_pte = src_pte;
>>       orig_dst_pte = dst_pte;
>>       arch_enter_lazy_mmu_mode();
> 

