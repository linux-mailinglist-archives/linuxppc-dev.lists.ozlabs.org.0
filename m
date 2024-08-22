Return-Path: <linuxppc-dev+bounces-341-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7677A95B1AA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 11:30:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqHwq2k3hz2y66;
	Thu, 22 Aug 2024 19:30:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S5BWhijI;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S5BWhijI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqHwp6NkLz2xcw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 19:30:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724318999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rckR+03GOPidUvWdVLzYuUBCEa/+rge7auagNSGBFUE=;
	b=S5BWhijIgOGTyIH9RtCLT6XEpeRXlNM+Z+U1PMX8QDpYJNHfhRi9KWLRb8PK309GONYQ40
	Gwh4a05c8qJJHE/N82an4nKj+7Chqm954Qbnzy52xtFxF/hoB4TW27A2njbF8i+sOtUkhB
	NQQd9PcJVlty2suJkRpwq7+TYzVAZ5o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724318999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rckR+03GOPidUvWdVLzYuUBCEa/+rge7auagNSGBFUE=;
	b=S5BWhijIgOGTyIH9RtCLT6XEpeRXlNM+Z+U1PMX8QDpYJNHfhRi9KWLRb8PK309GONYQ40
	Gwh4a05c8qJJHE/N82an4nKj+7Chqm954Qbnzy52xtFxF/hoB4TW27A2njbF8i+sOtUkhB
	NQQd9PcJVlty2suJkRpwq7+TYzVAZ5o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-4ta-Lz58M66Ohm6-PUte_A-1; Thu, 22 Aug 2024 05:29:55 -0400
X-MC-Unique: 4ta-Lz58M66Ohm6-PUte_A-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-37189fc2977so265106f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 02:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724318994; x=1724923794;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rckR+03GOPidUvWdVLzYuUBCEa/+rge7auagNSGBFUE=;
        b=ExJ3hcCsqANJCPkKQchrvFfTaqJn+E5Tls/SqRkuhZeFUI/4ERuzj554g/TQlWeduq
         k19Sdz9q+yIenmN7615F9KhpjRvZyt7Uab2c8HpqevuZSKgviQaI1Ien17hVeuakHD+t
         sO9twBI26upMR4vbTLN+VEThnzp7NvVWyncR94+rLjr4YmV6PaaysL/I3y5lR3Dm9fmD
         R/xUaqZ7bh2T+qPETfsRmzdtx2j4YgH3gQ0HxlihudIV4VWLXWA4bPOOsOMX3LFa+f8Q
         mLKYYjh7UaPNbMFBB0RjayV03DfuEbIHcQbGvW7BH5via6eX3j37ad7dnhnL/VPylkgM
         tLcw==
X-Forwarded-Encrypted: i=1; AJvYcCWIphQE8JGCKxUpyQly03Qbk1R1QV/yKhsucltZxheLy6gRSMIQ50gFrHW+ZkqOebFqMLiGcCjtq+ODdc8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzTrrYcoiReDHxkq1S+ma5PYS5EtPYpwuBq1XUog6QmhAr08rIn
	Ydn6IdvCnI6Ku8Am791o3Vg2xVO+oCAdbayJFNNgxzs2YVrYdExQl0ZeCSaCQ/kC/4rzIj7Kf5p
	hwSJrj7UhL9chdMs2se1MN2dm3ByOpf+K7e3lyV/To/iQ8fXE7JvGnHHKyG9FhNU=
X-Received: by 2002:a05:6000:1087:b0:368:5a8c:580b with SMTP id ffacd0b85a97d-37308c1809emr759120f8f.19.1724318994344;
        Thu, 22 Aug 2024 02:29:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRL1asb4fkUIRlvYCxbeS4/54SGG6zLoj2ClzR13hizO1ERnMINVZf/UUlkGmHlZiXeJ6q0w==
X-Received: by 2002:a05:6000:1087:b0:368:5a8c:580b with SMTP id ffacd0b85a97d-37308c1809emr759077f8f.19.1724318993511;
        Thu, 22 Aug 2024 02:29:53 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70f:2b00:f928:47d8:c9be:9d87? (p200300cbc70f2b00f92847d8c9be9d87.dip0.t-ipconnect.de. [2003:cb:c70f:2b00:f928:47d8:c9be:9d87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac517a65dsm17825185e9.34.2024.08.22.02.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 02:29:53 -0700 (PDT)
Message-ID: <04dccff9-87dd-4e97-a712-b62fa51b32f7@redhat.com>
Date: Thu, 22 Aug 2024 11:29:51 +0200
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
To: Qi Zheng <zhengqi.arch@bytedance.com>
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <83142dc8-edcf-4e47-8215-8b359a2b7156@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21.08.24 12:03, Qi Zheng wrote:
> 
> 
> On 2024/8/21 17:53, David Hildenbrand wrote:
>> On 21.08.24 11:51, Qi Zheng wrote:
>>>
>>>
>>> On 2024/8/21 17:41, David Hildenbrand wrote:
>>>> On 21.08.24 11:24, Qi Zheng wrote:
>>>>>
>>>>>
>>>>> On 2024/8/21 17:17, LEROY Christophe wrote:
>>>>>>
>>>>>>
>>>>>> Le 21/08/2024 à 10:18, Qi Zheng a écrit :
>>>>>>> In handle_pte_fault(), we may modify the vmf->pte after acquiring the
>>>>>>> vmf->ptl, so convert it to using pte_offset_map_maywrite_nolock().
>>>>>>> But
>>>>>>> since we already do the pte_same() check, so there is no need to get
>>>>>>> pmdval to do pmd_same() check, just pass NULL to pmdvalp parameter.
>>>>>>>
>>>>>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>>>>>> ---
>>>>>>>       mm/memory.c | 9 +++++++--
>>>>>>>       1 file changed, 7 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/mm/memory.c b/mm/memory.c
>>>>>>> index 93c0c25433d02..d3378e98faf13 100644
>>>>>>> --- a/mm/memory.c
>>>>>>> +++ b/mm/memory.c
>>>>>>> @@ -5504,9 +5504,14 @@ static vm_fault_t handle_pte_fault(struct
>>>>>>> vm_fault *vmf)
>>>>>>>                * pmd by anon khugepaged, since that takes mmap_lock in
>>>>>>> write
>>>>>>>                * mode; but shmem or file collapse to THP could still
>>>>>>> morph
>>>>>>>                * it into a huge pmd: just retry later if so.
>>>>>>> +         *
>>>>>>> +         * Use the maywrite version to indicate that vmf->pte
>>>>>>> will be
>>>>>>> +         * modified, but since we will use pte_same() to detect the
>>>>>>> +         * change of the pte entry, there is no need to get pmdval.
>>>>>>>                */
>>>>>>> -        vmf->pte = pte_offset_map_nolock(vmf->vma->vm_mm, vmf->pmd,
>>>>>>> -                         vmf->address, &vmf->ptl);
>>>>>>> +        vmf->pte = pte_offset_map_maywrite_nolock(vmf->vma->vm_mm,
>>>>>>> +                              vmf->pmd, vmf->address,
>>>>>>> +                              NULL, &vmf->ptl);
>>>>
>>>> I think we discussed that passing NULL should be forbidden for that
>>>> function.
>>>
>>> Yes, but for some maywrite case, there is no need to get pmdval to
>>> do pmd_same() check. So I passed NULL and added a comment to
>>> explain this.
>>
>> I wonder if it's better to pass a dummy variable instead. One has to
>> think harder why that is required compared to blindly passing "NULL" :)
> 
> You are afraid that subsequent caller will abuse this function, right?

Yes! "oh, I don't need a pmdval, why would I? let's just pass NULL, easy" :)

> My initial concern was that this would add a useless local vaiable, but
> perhaps that is not a big deal.

How many of these "special" instances do we have?

> 
> Both are fine for me. ;)

Also no strong opinion, but having to pass a variable makes you think 
what you are supposed to do with it and why it is not optional.

-- 
Cheers,

David / dhildenb


