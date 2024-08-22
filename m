Return-Path: <linuxppc-dev+bounces-349-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CF795B4DB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 14:19:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqMh15hfvz2yV8;
	Thu, 22 Aug 2024 22:19:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hWyZfSpB;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P6VyhNBQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqMh124jMz2yR3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 22:19:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724329146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TkmBKasCieEXjo2TVqkYnfAxfMqsNMhdyVXpm9rsAmM=;
	b=hWyZfSpBzNBhtjd/zKEhWjmTvdMaYnL20AWuKNVraFdJRDekZQdr8oUfLTjWazw8Je3ywE
	rtkEKWYP27rOqpyseqqzhHDdBLWJteAoVlpLpCUhJ7IPENfAlfJIH5TTQWBO5kesNxmTkO
	AHdts5dTdqyc5b2z9Kn5QnSWBtDGD7E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724329147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TkmBKasCieEXjo2TVqkYnfAxfMqsNMhdyVXpm9rsAmM=;
	b=P6VyhNBQ8oHGJiFTSyx1qBvUqWUhKCxdVcezIWoocU2o3d2jtNDy/brf2Oi2/AwHg3sxVW
	+SHsheih+Befk2/0dqzaN60PiFZwFSwjSRlZgDtKLfY/phlnvafC0biY72EQ9UcZeu5ENe
	GhFz/reoSnxaCCPHoX1wdrOQT4XQodQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-d-aAs30rP9eupFWZw9EoAg-1; Thu, 22 Aug 2024 08:19:05 -0400
X-MC-Unique: d-aAs30rP9eupFWZw9EoAg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3719559c51dso370108f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 05:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724329144; x=1724933944;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TkmBKasCieEXjo2TVqkYnfAxfMqsNMhdyVXpm9rsAmM=;
        b=LSS0OuoWE1rXO/v/m7GHQDK/svsLf0cTNvJguxQeyDBOLgQ0C4V4t/Qwt1uKPRD5sH
         NM/9WFqqEgAijnuSqFBFdDCUhafSl/BTtA6cVRiAc3DHjzOxIVUt332+BS5vjwLcZxdR
         khg3kngu6K6HHCW2Z6O+zZsPfshB3qhnQuz4fyUJCXYqfEAsLe4/xKr31TiRdd1rAsgK
         9TXYSxAgMMW/DCLkh9VO7TDgPCDSlzM8avxf65PnNWIkJo8XM9WCgYmiSv5CrEUfPT4w
         gRlXtooZQHGKSd+pQKM4yJJYMtaf0butUDgLY/P16x1Ajr+qgG/1GTPV4AMJIXScOgR5
         siKg==
X-Forwarded-Encrypted: i=1; AJvYcCWG6/5zUMEWo66d/QyTJZOUMbl+l89gqyGaI/ZoEYIZQoV5RZ5PDcIID78q7QmyG8uY3VyFK2usgYjetug=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx6bPManHKmXH5kb10HrEXQqlWmAST9GQc3H5H3nIjdEFJfdn/T
	8X8ToDucrwDIHOJQyCJxgLXMP88TYY8ipuRYiQ8i6tzbrdbP6ElPv9GoNj0wLPKi6fJQ3xsXT3h
	OacG/bdXoO3YWXMqVrkFETJm9whObQ7j5O2DfD2R/U4vwWOPFDFxyQD36yh0MzUA=
X-Received: by 2002:adf:f60d:0:b0:367:9621:6fa with SMTP id ffacd0b85a97d-372fd5ca8damr3645441f8f.37.1724329143943;
        Thu, 22 Aug 2024 05:19:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUx+YDDxgqRcDJR/2ELwCGRMB9JIiGMlHuOPJmREuQ076olN3nXdv+XbVkjm1FNBbf+TOJ2g==
X-Received: by 2002:adf:f60d:0:b0:367:9621:6fa with SMTP id ffacd0b85a97d-372fd5ca8damr3645400f8f.37.1724329142983;
        Thu, 22 Aug 2024 05:19:02 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70f:2b00:f928:47d8:c9be:9d87? (p200300cbc70f2b00f92847d8c9be9d87.dip0.t-ipconnect.de. [2003:cb:c70f:2b00:f928:47d8:c9be:9d87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac515a2a5sm23144385e9.20.2024.08.22.05.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 05:19:02 -0700 (PDT)
Message-ID: <38d6caeb-1aba-43d2-8daf-12b9aaba77bd@redhat.com>
Date: Thu, 22 Aug 2024 14:19:01 +0200
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
 <04dccff9-87dd-4e97-a712-b62fa51b32f7@redhat.com>
 <da7aa8d2-098c-431b-86d0-b817981a9a5f@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <da7aa8d2-098c-431b-86d0-b817981a9a5f@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22.08.24 14:17, Qi Zheng wrote:
> Hi David,
> 
> On 2024/8/22 17:29, David Hildenbrand wrote:
>> On 21.08.24 12:03, Qi Zheng wrote:
>>>
>>>
> 
> [...]
> 
>>>>>>>>> -        vmf->pte = pte_offset_map_nolock(vmf->vma->vm_mm,
>>>>>>>>> vmf->pmd,
>>>>>>>>> -                         vmf->address, &vmf->ptl);
>>>>>>>>> +        vmf->pte = pte_offset_map_maywrite_nolock(vmf->vma->vm_mm,
>>>>>>>>> +                              vmf->pmd, vmf->address,
>>>>>>>>> +                              NULL, &vmf->ptl);
>>>>>>
>>>>>> I think we discussed that passing NULL should be forbidden for that
>>>>>> function.
>>>>>
>>>>> Yes, but for some maywrite case, there is no need to get pmdval to
>>>>> do pmd_same() check. So I passed NULL and added a comment to
>>>>> explain this.
>>>>
>>>> I wonder if it's better to pass a dummy variable instead. One has to
>>>> think harder why that is required compared to blindly passing "NULL" :)
>>>
>>> You are afraid that subsequent caller will abuse this function, right?
>>
>> Yes! "oh, I don't need a pmdval, why would I? let's just pass NULL,
>> easy" :)
>>
>>> My initial concern was that this would add a useless local vaiable, but
>>> perhaps that is not a big deal.
>>
>> How many of these "special" instances do we have?
> 
> We have 5 such special instances.
> 
>>
>>>
>>> Both are fine for me. ;)
>>
>> Also no strong opinion, but having to pass a variable makes you think
>> what you are supposed to do with it and why it is not optional.
> 
> Yeah, I added 'BUG_ON(!pmdvalp);' in pte_offset_map_ro_nolock(), and
> have updated the v2 version [1].

No BUG_ON please :) VM_WARN_ON_ONCE() is good enough.

-- 
Cheers,

David / dhildenb


