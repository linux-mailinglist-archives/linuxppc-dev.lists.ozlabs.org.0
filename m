Return-Path: <linuxppc-dev+bounces-348-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC1D95B4D7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 14:18:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqMfd1T6qz2yRG;
	Thu, 22 Aug 2024 22:18:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DmjPema2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqMfc1Fbfz2yR3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 22:17:57 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20230059241so6235245ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 05:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724329073; x=1724933873; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yx+C2U4iF94VXeDjm9C7FkXz5nA7V9VNqSYF9OlMlok=;
        b=DmjPema2IOl5OAzd6ghZforhReksIVtWftOh5RtRBK/tL7jIwxAQ7Kvpmqn6cB5P8q
         2+VFoJ8sXMk4e7aQ2Fn69Fy/1rTN6sdmsWwaYPePOb4/qgRepqBOkpRyMthjwy18Rsae
         JgOiA7cpIZveq34oDfpwU2BjjTJRYfnc5QAd0PxOU7eGnasU9UENlZH0IRDcgiJZF1PI
         ssBWYDoyTc6e+QCxm0c+YTEwy37a8vfaTnNnXXkFwsuBg2Vi6Rzxi6B49W1gMAN7ZBZR
         QFxC1ycfjcff8BaKqutNdEWDSHWu+AX1zqFGgUcRvK3mxPcmrv/UQY30eLUUgzGF5HI4
         ZQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724329073; x=1724933873;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yx+C2U4iF94VXeDjm9C7FkXz5nA7V9VNqSYF9OlMlok=;
        b=BgwIbD5Z5ffFA9q3RutJSPYylBE/eJkbHWtcTxjWccPfnaGEv/3aqvNPnFz7y6lvBw
         ZxDUS5zgqa+qeNHI8S1A+w8fO6y2sxtJI3d7+t/Q7eZQFdM5PMFX2td57UKpHjG1WAo4
         HefRR1Si523S9cDbsnRmKRM0+bOy7fsMs2ythNwe9ias7u/bLu3RPex0Pze3Z2bCEMTx
         TiQLtv5XNqTUDBFpWfzoVfUxSX6r45PvuzVkZ9BhcY6XUd0GML2jB4rUdMPZ7fIN5taw
         +ab+/xBjFRfSVfEOW76RT+8uMvpxLhqN6gZAWKUkn4E33IupwtdXyFap2nb+Z43PsOZO
         Smuw==
X-Forwarded-Encrypted: i=1; AJvYcCXDAsTtD6ZugrMfhOM6n2ezbi0idOW8I+kPP2wZ03GCqGkp8SORm/vHaAnuPVjsgRbtEuPCpBR5RCLBkzE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxcTRlujEgo+5BFQCf5tB9pkSJ0SMdxwcqAZApwo8qlr/NUgXb4
	oOShLIqec34vytQ6sQMO76Lg76SCMSKTKbo90jtVXfHU1yMd71bScNqNUlPs9ug=
X-Google-Smtp-Source: AGHT+IGQCmIxIo4n5wGGT5nxKPt1EKhdUohcyrEN/h8veL+3fxj79HNkDhzIeZh/LJSzH8gYmwu90A==
X-Received: by 2002:a17:902:e745:b0:1fb:93d6:9fef with SMTP id d9443c01a7336-2038890f96fmr17992995ad.38.1724329073509;
        Thu, 22 Aug 2024 05:17:53 -0700 (PDT)
Received: from [10.255.182.243] ([139.177.225.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855dbed6sm11386985ad.172.2024.08.22.05.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 05:17:52 -0700 (PDT)
Message-ID: <da7aa8d2-098c-431b-86d0-b817981a9a5f@bytedance.com>
Date: Thu, 22 Aug 2024 20:17:45 +0800
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
Cc: Qi Zheng <zhengqi.arch@bytedance.com>,
 LEROY Christophe <christophe.leroy2@cs-soprasteria.com>,
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
 <83142dc8-edcf-4e47-8215-8b359a2b7156@bytedance.com>
 <04dccff9-87dd-4e97-a712-b62fa51b32f7@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <04dccff9-87dd-4e97-a712-b62fa51b32f7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi David,

On 2024/8/22 17:29, David Hildenbrand wrote:
> On 21.08.24 12:03, Qi Zheng wrote:
>>
>>

[...]

>>>>>>>> -        vmf->pte = pte_offset_map_nolock(vmf->vma->vm_mm, 
>>>>>>>> vmf->pmd,
>>>>>>>> -                         vmf->address, &vmf->ptl);
>>>>>>>> +        vmf->pte = pte_offset_map_maywrite_nolock(vmf->vma->vm_mm,
>>>>>>>> +                              vmf->pmd, vmf->address,
>>>>>>>> +                              NULL, &vmf->ptl);
>>>>>
>>>>> I think we discussed that passing NULL should be forbidden for that
>>>>> function.
>>>>
>>>> Yes, but for some maywrite case, there is no need to get pmdval to
>>>> do pmd_same() check. So I passed NULL and added a comment to
>>>> explain this.
>>>
>>> I wonder if it's better to pass a dummy variable instead. One has to
>>> think harder why that is required compared to blindly passing "NULL" :)
>>
>> You are afraid that subsequent caller will abuse this function, right?
> 
> Yes! "oh, I don't need a pmdval, why would I? let's just pass NULL, 
> easy" :)
> 
>> My initial concern was that this would add a useless local vaiable, but
>> perhaps that is not a big deal.
> 
> How many of these "special" instances do we have?

We have 5 such special instances.

> 
>>
>> Both are fine for me. ;)
> 
> Also no strong opinion, but having to pass a variable makes you think 
> what you are supposed to do with it and why it is not optional.

Yeah, I added 'BUG_ON(!pmdvalp);' in pte_offset_map_ro_nolock(), and
have updated the v2 version [1].

[1]. 
https://lore.kernel.org/lkml/cover.1724310149.git.zhengqi.arch@bytedance.com/

Thanks,
Qi

> 

