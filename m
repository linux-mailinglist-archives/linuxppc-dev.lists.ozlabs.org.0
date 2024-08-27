Return-Path: <linuxppc-dev+bounces-559-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E614C96008D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 06:53:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtFYr2xtRz2y89;
	Tue, 27 Aug 2024 14:53:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b35"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724734432;
	cv=none; b=oNW1xWobvbj7N6OApOuQurUClrg0jVoQUU0pqbTn8D+GgT9ol2fGAuJB1cXYjRD7+PLkRWivSUXO1maGiFOk6nusnuTPHPm+qpZNsY9RoFttS7cl2x39vrtyYt4iV2DaOhE8+9xNxX+jnkZZeugNthILBFL6Yefzu/1n/bCzHPZwek7n/uqg9ICmkMcw6a38SWllc4MEKQTzldTpLLGX94EUlWp/J/sz+GGFDqwj9dlv3hvwY4ZAL+/44gHl55NgpNM8T/O5MUm5kOwimckH/HQMUAV8BFeRH6l54mvq5i7slyMBPOP5ClE59B6+b+/GEyEjsqxESqWD+RPfO3pjjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724734432; c=relaxed/relaxed;
	bh=gL0CtwyQELiqJJaIVlxrXuLFauzAqYM0sY701FPxABY=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding; b=RJDUdUfE5GYx9GkgaSxuH0wE2tKkkofNLmB+aZh7WRhxPi+XwGa55PByNJdQkh/Kr/loyfGAGEPqf92VIdNQRZrjBc4ahxDUVoM5rFfioB+2+/ZC51fvDw2bM0POZFj6nQIesDYjKiYOX263Zv4jw0p6JD9lNnhxaYs7pN0Lmp4eQPs4oIgDXOozdsAXW7B41PJn3djxNiBW5PSlfHb1u5sn8lRA3XL4MoUSgLsniDsI90y0xBoEZ5j9+liSUQwDANqOGntr4TNm/zN5dgQOusx2XBx4bP7pJahUHtjnXaUCYXpTqtG+2Exb+QIB8gLVYcS1nJuhc+t/wA84UwFnrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ggk7gyc0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ggk7gyc0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtFYq2KYcz2xpv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 14:53:49 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e13cda45037so5469276276.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 21:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724734426; x=1725339226; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gL0CtwyQELiqJJaIVlxrXuLFauzAqYM0sY701FPxABY=;
        b=ggk7gyc0/2hLQH72Gln3/SAuQneUJjs0ZZV3hDo65ZunWULHL6wopj/K1tkCoTjtwm
         989UdDTCai/jPeKnv2apz0iFeMaFrUxOAJCzNPw0YB1MWi+4C8UOgbmoWOIl30dXxWpQ
         84sQlfivmOSa1DZ6V7gnUBKgwxNrIVNATEYmfVgUSDaHyhKb5unrIKYjmJpoH+P1aN1W
         AP96sct3/zlmI+ZYTvVv8AZ7tiURzINHUSJLGlZ87zEaBoSo0cKA8cs71gl1sDTVREvq
         E/LAco3iUZ7mfho8tKzw3CxziEKu7jSEWjzKwYkBSIdZLsQme2NLVtD7Syr9QkHXRrS3
         ASNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724734426; x=1725339226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gL0CtwyQELiqJJaIVlxrXuLFauzAqYM0sY701FPxABY=;
        b=oc0zvrq0O1VZn2Ck4MyVfE9Qv/QseHBhkIWsIxTRkAy69RMYlhKIFDUfn3u9NBfVo/
         uW6QZVHU79QsXQ2w+CSVi017tDIYR6RvbvwNPYI5Bw6m0DlhuOhqSsX4NW+P1REIAczM
         BUNy4J7iIfzetpigMCJtgvI6IA/Yl2ckNTBIB5VwB5wrljKDCJtLfCSqM20M2rAfGG87
         dBmq96+je4n+C/rU2wJi3QalCcf/9iTV9KBbVPqYdQ2PttsqNzWiCc36LRaaO+xEWwX6
         gL5eE6qxnznusoD7Tel8xRwrISgc3qJm31xU2NMgGDYLXJ/ymJIECPXxYJhiC46zPg+u
         LvuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlUNLoPyP9qFjslSmAQHaXajF9MIvSTASPUVcAkMt7oXtq+QjP1+g8febp8x675aLBVnBolncqfE9LRmE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw4ynU+ikKZXvR+sFSz3xu64sEGpDPjQFL+CLnzmkRwKkWOz5nO
	O8at1ZaRz5cKuS4zNQO3VNhtDjPGF51oKA3SrnmVQN14olaHXs4eSHmjbf5t49M=
X-Google-Smtp-Source: AGHT+IHvJKgGgS8F6PA+OGYeR1MSS8jBA76sh6PwAVPa/wEnz55WlDC55HealKCjGZuy9Cax5P2SIA==
X-Received: by 2002:a05:6902:849:b0:e13:e6c1:ce3d with SMTP id 3f1490d57ef6-e1a2a978a80mr2069360276.43.1724734426374;
        Mon, 26 Aug 2024 21:53:46 -0700 (PDT)
Received: from [10.4.59.158] ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d21700a48csm359552a12.85.2024.08.26.21.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 21:53:46 -0700 (PDT)
Message-ID: <581a7d44-25c6-4498-b11a-9c0029bb9d78@bytedance.com>
Date: Tue, 27 Aug 2024 12:53:37 +0800
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
Subject: Re: [PATCH v2 06/14] mm: handle_pte_fault() use
 pte_offset_map_rw_nolock()
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: hughd@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
 vishal.moola@gmail.com, peterx@redhat.com, ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <5acabedfae7ded01b075960b4a91f2e15b4d76b5.1724310149.git.zhengqi.arch@bytedance.com>
 <ea518cf0-890d-4292-b775-dd3880c85bc6@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ea518cf0-890d-4292-b775-dd3880c85bc6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/8/26 23:36, David Hildenbrand wrote:
> On 22.08.24 09:13, Qi Zheng wrote:
>> In handle_pte_fault(), we may modify the vmf->pte after acquiring the
>> vmf->ptl, so convert it to using pte_offset_map_rw_nolock(). But since we
>> will do the pte_same() check, so there is no need to get pmdval to do
>> pmd_same() check, just pass a dummy variable to it.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>   mm/memory.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 93c0c25433d02..7b6071a0e21e2 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -5499,14 +5499,22 @@ static vm_fault_t handle_pte_fault(struct 
>> vm_fault *vmf)
>>           vmf->pte = NULL;
>>           vmf->flags &= ~FAULT_FLAG_ORIG_PTE_VALID;
>>       } else {
>> +        pmd_t dummy_pmdval;
>> +
>>           /*
>>            * A regular pmd is established and it can't morph into a huge
>>            * pmd by anon khugepaged, since that takes mmap_lock in write
>>            * mode; but shmem or file collapse to THP could still morph
>>            * it into a huge pmd: just retry later if so.
>> +         *
>> +         * Use the maywrite version to indicate that vmf->pte will be
>> +         * modified, but since we will use pte_same() to detect the
>> +         * change of the pte entry, there is no need to get pmdval, so
>> +         * just pass a dummy variable to it.
>>            */
>> -        vmf->pte = pte_offset_map_nolock(vmf->vma->vm_mm, vmf->pmd,
>> -                         vmf->address, &vmf->ptl);
>> +        vmf->pte = pte_offset_map_rw_nolock(vmf->vma->vm_mm, vmf->pmd,
>> +                            vmf->address, &dummy_pmdval,
>> +                            &vmf->ptl);
>>           if (unlikely(!vmf->pte))
>>               return 0;
>>           vmf->orig_pte = ptep_get_lockless(vmf->pte);
> 
> No I understand why we don't need the PMD val in these cases ... the PTE 
> would also be pte_none() at the point the page table is freed, so we 
> would detect the change as well.

Yes.

> 
> I do enjoy documenting why we use a dummy value, though. Likely without 
> that, new users will just pass NULL and call it a day.

OK, how about the following:

Use the maywrite version to indicate that vmf->pte will be
modified, but since we will use pte_same() to detect the
change of the !pte_none() entry, there is no need to recheck
the pmdval. Here we chooes to pass a dummy variable instead
of NULL, which helps new user think about why this place is
special.

> 
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks!

> 

