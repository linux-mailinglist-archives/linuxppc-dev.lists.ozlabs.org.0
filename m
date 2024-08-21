Return-Path: <linuxppc-dev+bounces-280-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC9B95982D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 12:47:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpjhD3MLyz2yZB;
	Wed, 21 Aug 2024 20:47:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102c"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LOCADCFZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WphS50X2Tz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 19:51:32 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2d5f5d8cc01so167047a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 02:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724233890; x=1724838690; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QrfsoI7+/y7gPIc6zH2vT6eGjRus/vFY8lyFc42bTUs=;
        b=LOCADCFZ+XeqBNNEKGOJNisEEvkGkiCWIglCXvoKLlPNScLv5OD1C7BmJ8M8Gg6XrT
         BdkKCbbFeubWTf2EnQYZL0NtEkqhl+T4nbHzEJXFMqWpK2iAl74+MA5+6aihmY1pzEe9
         zPoV/KdaymTFC88SRwzCkVdSI2tsTULbMH3VX9/GaLLi6cL6FEEzbNaeWmrdHeGZAouV
         obMm5fBAVu5HYvYVgxny9b8q/W0uP1D5PRPMnXJSfYZIg0TYOLSuNMGPM4WIm9GkzbBp
         EWboCCs7RQoZVkqp4MjVkXsJy8E25oKGa53lBTS51Pk1tZYVPJPPwwXw9mWl27YLgM85
         YMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724233890; x=1724838690;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrfsoI7+/y7gPIc6zH2vT6eGjRus/vFY8lyFc42bTUs=;
        b=ZwwzViufTjzo+uehH9hck5qq8rXkqq4OvRXYm9Gc0w4q2QS+vcLbazLr1492rHLvgd
         32zpckgGetG8xybXjxNPOCVckWea2KUUg+qA3RXcNIZdXXHLhMNy13gsXNpC7a3FFYfS
         zrMWUgF/PFRNDzzQsbmVuBdl+5GeXzAQFNmqweuEs+QjgHMnHuOKbcRHJcbKeB89mErk
         krNzW0QJL4GYhPKJVMNx7Iz0XYvLgRTkVVQPRKHn/F6RXUs32RqfrQLGOdLUuYqDZi82
         GotZiCQzAFTQBxMYk5p0Q/ENlppuxRD7GlB+zIxETI4vOfdiSw/mylxnfd/xx1RLjfoY
         EU3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWm23oWPC3NfTVryX8zsZPGMA58GKf0BqJgm/NnkiAE68FXAYATbXXcShrNEixVuW5NRf5LFjJSS/i50Hw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy0yoekyKHmFKljjXaMZ9zO1fY3q2tVTIUou0n78InoB8R4OL2V
	aOij+8zjgtGkEZ9aspv7hazADwvrHajGyBmlVTUx6BhY6IJmx8/eoHP00H9KM3c=
X-Google-Smtp-Source: AGHT+IH39FxZGyvulFfIBDs9fMR7pRrcFkJNeekEukWGwpJYqyx+HQvEFVfN+uyRXPCwbuMHV6p+iw==
X-Received: by 2002:a17:90a:ca04:b0:2cb:56bd:5d7 with SMTP id 98e67ed59e1d1-2d5e995be3emr3063558a91.5.1724233890327;
        Wed, 21 Aug 2024 02:51:30 -0700 (PDT)
Received: from [10.84.144.49] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5ebbb0b27sm1297201a91.45.2024.08.21.02.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 02:51:29 -0700 (PDT)
Message-ID: <ef40c2ef-e4a4-4b02-85b8-a930285a3d0e@bytedance.com>
Date: Wed, 21 Aug 2024 17:51:21 +0800
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
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <4b867535-8481-4fa1-bed1-ad25a76682f0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/8/21 17:41, David Hildenbrand wrote:
> On 21.08.24 11:24, Qi Zheng wrote:
>>
>>
>> On 2024/8/21 17:17, LEROY Christophe wrote:
>>>
>>>
>>> Le 21/08/2024 à 10:18, Qi Zheng a écrit :
>>>> In handle_pte_fault(), we may modify the vmf->pte after acquiring the
>>>> vmf->ptl, so convert it to using pte_offset_map_maywrite_nolock(). But
>>>> since we already do the pte_same() check, so there is no need to get
>>>> pmdval to do pmd_same() check, just pass NULL to pmdvalp parameter.
>>>>
>>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>>> ---
>>>>     mm/memory.c | 9 +++++++--
>>>>     1 file changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/mm/memory.c b/mm/memory.c
>>>> index 93c0c25433d02..d3378e98faf13 100644
>>>> --- a/mm/memory.c
>>>> +++ b/mm/memory.c
>>>> @@ -5504,9 +5504,14 @@ static vm_fault_t handle_pte_fault(struct 
>>>> vm_fault *vmf)
>>>>              * pmd by anon khugepaged, since that takes mmap_lock in 
>>>> write
>>>>              * mode; but shmem or file collapse to THP could still 
>>>> morph
>>>>              * it into a huge pmd: just retry later if so.
>>>> +         *
>>>> +         * Use the maywrite version to indicate that vmf->pte will be
>>>> +         * modified, but since we will use pte_same() to detect the
>>>> +         * change of the pte entry, there is no need to get pmdval.
>>>>              */
>>>> -        vmf->pte = pte_offset_map_nolock(vmf->vma->vm_mm, vmf->pmd,
>>>> -                         vmf->address, &vmf->ptl);
>>>> +        vmf->pte = pte_offset_map_maywrite_nolock(vmf->vma->vm_mm,
>>>> +                              vmf->pmd, vmf->address,
>>>> +                              NULL, &vmf->ptl);
> 
> I think we discussed that passing NULL should be forbidden for that 
> function.

Yes, but for some maywrite case, there is no need to get pmdval to
do pmd_same() check. So I passed NULL and added a comment to
explain this.

> 
>>>
>>> This might be the demonstration that the function name is becoming 
>>> too long.
>>>
>>> Can you find shorter names ?
>>
>> Maybe use abbreviations?
>>
>> pte_offset_map_ro_nolock()
>> pte_offset_map_rw_nolock()
> 
> At least the "ro" is better, but "rw" does not express the "maywrite" -- 
> because without taking the lock we are not allowed to write. But maybe 
> "rw" is good enough for that if we document it properly.

OK, will change to it in the next version.

> 
> And you can use up to 100 characters, if it helps readability

Got it.

> 

