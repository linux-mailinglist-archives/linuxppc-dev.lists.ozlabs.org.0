Return-Path: <linuxppc-dev+bounces-283-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CC6959842
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 12:48:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wpjjm0j14z2yhD;
	Wed, 21 Aug 2024 20:48:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42d"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=QB7qDML0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wphk66gBBz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 20:03:39 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-713dc00cf67so3680963b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 03:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724234617; x=1724839417; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hc9KXq9HiCmVA6sa8jp61udoxCJLWx+IYCHX8J3fcJQ=;
        b=QB7qDML0C5N89hHXq0JMmOx0C0yMMRdT0ppAnnV9NIoWpwnAm0H4Foq+R5NnDjCWcD
         6sc7FBPlnJHOJb/uAE7MLdqqZDFFBUq6rcJ/O/c/9ghN3BvPC09okWX0EYNn8f0nzBh5
         yHJNlrQILhctG2iuedBgVqiZMJvlkKQD7K95bATGrjPoEZaWP/WyEoNbxuelRsU8n4O2
         +j11QyOPlDl8fKfyoNG9ON58jGP/zC5EcR/Tp0TTxxmUIvpgJipGpZHgUbi13QzlZLWH
         amNJBN0ZtKwkh+0UOtroS6yCLAupX+Et0YMlnqcHGj5/1sCfWY5MFHRwc2tgK39B/HGP
         Y5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724234617; x=1724839417;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hc9KXq9HiCmVA6sa8jp61udoxCJLWx+IYCHX8J3fcJQ=;
        b=uZPC9TRhwqv2CJWITheNX2mY/2Cu2BBDI9/7/xjGQzMViSjvL1lK2mo/jDAchOa1F3
         LwPxrJ0O7/TRhpevmekCRvckWBfQ5qHGxRqsBk86nKKQso6TE1Jjudb/Ju0N+5tcXPVd
         XcDm51Rjf7gnAc4u6wYKpN0J9Ds3tbkHJGlzjU0X6PP9X8ysogvbA8j+0iGQQ9IfqCAq
         agVnJ5g15dV884y7FFjlgIi162rjxcZrHU+kF35swLddvZrNG5FW6sWlJBOHOCywjrIn
         r//ZI6DCZkjvUCefaU5bbGkO55Agzj/acnprdjd+LU5mXSthMHb4GR5UCnp2Gij/J1PP
         yL1Q==
X-Forwarded-Encrypted: i=1; AJvYcCURzWnNwzRqpL6UjSTSoj/t+W/VrTXfRndqBwVegzdxoTz+fHTSvDtVSDBB/fMMS8xNR+4Z9j4MBWgV9MI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyJwaDltVFJwdn0tJ00dUl9BCehaI4HJJE3saDewzhB0Tw64T8y
	bOrEOaHGR1JsuTZjDE5+7VLmjECkYoXz0EixibBR6GkeCVrbf6EQpdO3IYOnU0c=
X-Google-Smtp-Source: AGHT+IHzEyIAn5BZKdsgEF+tkgsjaGhBmdzJxEgxGtA7eOAAo7NB0TYXIZ9VX90RiBa6VatggNPMRg==
X-Received: by 2002:a05:6a20:9f4e:b0:1c4:a531:bafd with SMTP id adf61e73a8af0-1cad7f8b77dmr2391092637.18.1724234617078;
        Wed, 21 Aug 2024 03:03:37 -0700 (PDT)
Received: from [10.84.144.49] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127aef610esm9588632b3a.129.2024.08.21.03.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 03:03:36 -0700 (PDT)
Message-ID: <83142dc8-edcf-4e47-8215-8b359a2b7156@bytedance.com>
Date: Wed, 21 Aug 2024 18:03:30 +0800
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
To: David Hildenbrand <david@redhat.com>
Cc: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>,
 "hughd@google.com" <hughd@google.com>,
 "willy@infradead.org" <willy@infradead.org>,
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
 <b4bf605a-d31a-40ad-8cee-fe505e45dc64@bytedance.com>
 <4b867535-8481-4fa1-bed1-ad25a76682f0@redhat.com>
 <ef40c2ef-e4a4-4b02-85b8-a930285a3d0e@bytedance.com>
 <61c05197-0baa-4680-ad24-5965ba37dc35@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <61c05197-0baa-4680-ad24-5965ba37dc35@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/8/21 17:53, David Hildenbrand wrote:
> On 21.08.24 11:51, Qi Zheng wrote:
>>
>>
>> On 2024/8/21 17:41, David Hildenbrand wrote:
>>> On 21.08.24 11:24, Qi Zheng wrote:
>>>>
>>>>
>>>> On 2024/8/21 17:17, LEROY Christophe wrote:
>>>>>
>>>>>
>>>>> Le 21/08/2024 à 10:18, Qi Zheng a écrit :
>>>>>> In handle_pte_fault(), we may modify the vmf->pte after acquiring the
>>>>>> vmf->ptl, so convert it to using pte_offset_map_maywrite_nolock(). 
>>>>>> But
>>>>>> since we already do the pte_same() check, so there is no need to get
>>>>>> pmdval to do pmd_same() check, just pass NULL to pmdvalp parameter.
>>>>>>
>>>>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>>>>> ---
>>>>>>      mm/memory.c | 9 +++++++--
>>>>>>      1 file changed, 7 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/mm/memory.c b/mm/memory.c
>>>>>> index 93c0c25433d02..d3378e98faf13 100644
>>>>>> --- a/mm/memory.c
>>>>>> +++ b/mm/memory.c
>>>>>> @@ -5504,9 +5504,14 @@ static vm_fault_t handle_pte_fault(struct
>>>>>> vm_fault *vmf)
>>>>>>               * pmd by anon khugepaged, since that takes mmap_lock in
>>>>>> write
>>>>>>               * mode; but shmem or file collapse to THP could still
>>>>>> morph
>>>>>>               * it into a huge pmd: just retry later if so.
>>>>>> +         *
>>>>>> +         * Use the maywrite version to indicate that vmf->pte 
>>>>>> will be
>>>>>> +         * modified, but since we will use pte_same() to detect the
>>>>>> +         * change of the pte entry, there is no need to get pmdval.
>>>>>>               */
>>>>>> -        vmf->pte = pte_offset_map_nolock(vmf->vma->vm_mm, vmf->pmd,
>>>>>> -                         vmf->address, &vmf->ptl);
>>>>>> +        vmf->pte = pte_offset_map_maywrite_nolock(vmf->vma->vm_mm,
>>>>>> +                              vmf->pmd, vmf->address,
>>>>>> +                              NULL, &vmf->ptl);
>>>
>>> I think we discussed that passing NULL should be forbidden for that
>>> function.
>>
>> Yes, but for some maywrite case, there is no need to get pmdval to
>> do pmd_same() check. So I passed NULL and added a comment to
>> explain this.
> 
> I wonder if it's better to pass a dummy variable instead. One has to 
> think harder why that is required compared to blindly passing "NULL" :)

You are afraid that subsequent caller will abuse this function, right?
My initial concern was that this would add a useless local vaiable, but
perhaps that is not a big deal.

Both are fine for me. ;)

> 

