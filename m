Return-Path: <linuxppc-dev+bounces-350-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8460C95B4E7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 14:22:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqMm82Y3lz2yVG;
	Thu, 22 Aug 2024 22:22:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Jdh5t5Gj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqMm80PjHz2yR3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 22:22:47 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71423273c62so619133b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 05:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724329366; x=1724934166; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kIwgebdH51yKuSjq8P43yv3p3Sz45IN9GInZ+H0UIGw=;
        b=Jdh5t5GjyY3MhW2NzaPxPHhr7EubM6SGkFApIBhma9B7LNELvY+ruwHBKucYN9XEAC
         jIxQv+hQTevCFgYTDtUR7Olms9dUPp3Y4/QS2iM3Hn2CBmP4ixYPvQs4/E4VN3/y6o3k
         8bYPMrqCIRjWZJoEkv4X/JRwwChFnoBCnD+Z87Nrgggf39M5dDS8vnSBd5Xtvh0JWac9
         cRWF9ggLd1ZdrqOJFUcMgjsA9LNliWtdM6ooh32tcIiVQIE8VNitP8q6tcWFoyCJH7HS
         XNj96wzs11NbpbeENp5poqaO+NibYcF7ijdcSsP3p+3wuPGLAHkdEUY4JkXJnXDcAamW
         Evlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724329366; x=1724934166;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kIwgebdH51yKuSjq8P43yv3p3Sz45IN9GInZ+H0UIGw=;
        b=BoY+yW3ykE+40SpaT3iFHFFOeEtRecwYFqCpcCa4uib0LILnoQ/9sIzvS5IF+2ds9j
         f2IWbSDA7Ih2FCu9Xw2+hKNAvqMa9LFG7OOsgaIErJkNdcFPR5o3gIu3M3t1Q8RhGRHC
         Jb4GCgFQu//lxRuw4ropTo7zYlNtRlbbo+l/WMM6pHO79l+1QRcbjYVgkLhsNXrCx7CY
         nM3L8Z9qMXR7f30vDCClsTTkYWyBwuKLtW0wMmEdn25Edw8Zh+W83NNuPY9nopOZwoDJ
         cNkLGPcruU6y8RzOpvx0z6ozLFgx+VRcUMsgd1g45ScqLCokXosYpKQ0j70/bkrfi0hK
         hGxw==
X-Forwarded-Encrypted: i=1; AJvYcCWpuZcy6ZnCWuMz+U6a3gBkiaN/+u8eXWbyFo00G5wnNy1gJgu4aYdPFuSwkfRfjRl+WMRg6VBg3y9tfIw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzEwO7PMORRJNqiNQyW6+LZj/c5XkfHkqARXMt13wvxY5Pp4wl4
	Eu77g1X3AGmGWd8WheyzRyIWWEJn9XtFDWK2s4K1CaD2b/GSySlqtQwDybjXSXU=
X-Google-Smtp-Source: AGHT+IEHSce2yik5ch9+ibHBlKnOikhH85uimhD6rYu5vvuVwwprOpDF1vUeRBo9cEYE2Tjb138rnA==
X-Received: by 2002:a05:6a21:a4c1:b0:1c8:95c9:307c with SMTP id adf61e73a8af0-1caeb250138mr1625404637.28.1724329365986;
        Thu, 22 Aug 2024 05:22:45 -0700 (PDT)
Received: from [10.255.182.243] ([139.177.225.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143422eda4sm1259383b3a.35.2024.08.22.05.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 05:22:45 -0700 (PDT)
Message-ID: <7e83f87b-703b-4f7c-9d42-78845acb41c6@bytedance.com>
Date: Thu, 22 Aug 2024 20:22:37 +0800
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
 <83142dc8-edcf-4e47-8215-8b359a2b7156@bytedance.com>
 <04dccff9-87dd-4e97-a712-b62fa51b32f7@redhat.com>
 <da7aa8d2-098c-431b-86d0-b817981a9a5f@bytedance.com>
 <38d6caeb-1aba-43d2-8daf-12b9aaba77bd@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <38d6caeb-1aba-43d2-8daf-12b9aaba77bd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/8/22 20:19, David Hildenbrand wrote:
> On 22.08.24 14:17, Qi Zheng wrote:
>> Hi David,
>>
>> On 2024/8/22 17:29, David Hildenbrand wrote:
>>> On 21.08.24 12:03, Qi Zheng wrote:
>>>>
>>>>
>>
>> [...]
>>
>>>>>>>>>> -        vmf->pte = pte_offset_map_nolock(vmf->vma->vm_mm,
>>>>>>>>>> vmf->pmd,
>>>>>>>>>> -                         vmf->address, &vmf->ptl);
>>>>>>>>>> +        vmf->pte = 
>>>>>>>>>> pte_offset_map_maywrite_nolock(vmf->vma->vm_mm,
>>>>>>>>>> +                              vmf->pmd, vmf->address,
>>>>>>>>>> +                              NULL, &vmf->ptl);
>>>>>>>
>>>>>>> I think we discussed that passing NULL should be forbidden for that
>>>>>>> function.
>>>>>>
>>>>>> Yes, but for some maywrite case, there is no need to get pmdval to
>>>>>> do pmd_same() check. So I passed NULL and added a comment to
>>>>>> explain this.
>>>>>
>>>>> I wonder if it's better to pass a dummy variable instead. One has to
>>>>> think harder why that is required compared to blindly passing 
>>>>> "NULL" :)
>>>>
>>>> You are afraid that subsequent caller will abuse this function, right?
>>>
>>> Yes! "oh, I don't need a pmdval, why would I? let's just pass NULL,
>>> easy" :)
>>>
>>>> My initial concern was that this would add a useless local vaiable, but
>>>> perhaps that is not a big deal.
>>>
>>> How many of these "special" instances do we have?
>>
>> We have 5 such special instances.
>>
>>>
>>>>
>>>> Both are fine for me. ;)
>>>
>>> Also no strong opinion, but having to pass a variable makes you think
>>> what you are supposed to do with it and why it is not optional.
>>
>> Yeah, I added 'BUG_ON(!pmdvalp);' in pte_offset_map_ro_nolock(), and
>> have updated the v2 version [1].
> 
> No BUG_ON please :) VM_WARN_ON_ONCE() is good enough.

Got it. Will do in the next version.

> 

