Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1138D70F6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 17:38:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vb5cteSE;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wcv9M/WD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vs3zK4cmfz3bTt
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jun 2024 01:38:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vb5cteSE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wcv9M/WD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vs3yL34xbz30WJ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jun 2024 01:37:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717256228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jh2GJuW9QbJ96XxMyegQnI4EqW1e76u3PBYm+bYYEnM=;
	b=Vb5cteSEMiMwWBq9NlF0J0iimFGUCgp8J/loUcCi1t6YgliN4SjjlDC5KQxWnwDWVLJoS7
	mhpZJI3N4hj1Nt5k9a3qY22S2depVBlv7dx5xStHjcsyotIx477zfAhDSZn1sIM7L4wId1
	bFcx0g1WYjEFzgKAFo+BLlpiN4sPp3I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717256229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jh2GJuW9QbJ96XxMyegQnI4EqW1e76u3PBYm+bYYEnM=;
	b=Wcv9M/WD+RcwFtB7XuNG5MJ/8Gce7nsE1uuyIcaq1lcoOUMDlpDACcGDy9JCV7WF7s0872
	FP0lKcUo+fFojZTM4mqMcFDGnkwJ6QVKJ/hbhBadCSxteMYxCZe669WF7WveMvlLutTjin
	Y6VWVtmiQDyBLeLkW7aju3ainNvKoaY=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-YHiNkftDPu6UmMkTo7thNA-1; Sat, 01 Jun 2024 11:37:06 -0400
X-MC-Unique: YHiNkftDPu6UmMkTo7thNA-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2ea95b8aa6aso12676701fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Jun 2024 08:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717256225; x=1717861025;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jh2GJuW9QbJ96XxMyegQnI4EqW1e76u3PBYm+bYYEnM=;
        b=s11qdExJDaLSiuEaco+zYFocBtlCbLbGpGCQlJchz8bVfyyDkUDnFJrMI+EC6uurNY
         tvypGdS4yy4yMLYBGjhsq5Sy9Z/lSKKQMMVJpaynkVq33O6s97TfNNvOEoxw5WeLpWSI
         s6k3FqN8Msdp9kmUpaLAHZ8guVT165XNc7Zhjpnxkya/vEVwpWNVpytzFXAmFN/3gAB2
         D/sXSTYoED6exEWTMHrpcM9yKNmMiaG0WdlSrGQI/Vh0ZJmCMRFSlsox5yJFJmuC7Mlv
         Wq5MDU2OM5lDFvaoAdRaurh3X+oua6wB9yInGnSo8Kdl9tO3kF3f8AyZetQD7wvE7Bqc
         nt/w==
X-Forwarded-Encrypted: i=1; AJvYcCWKCXRo7KsR8vgef/qDdC7mPB/CDNnPb1Zr9yaDQFmr59W+JqXLA5tGHJgXKvJdbn3FX/sfK08dOalbkgkBmSIDHjzZg/NfrjeTOnRXQw==
X-Gm-Message-State: AOJu0YzJK8XBq77tl4i1b7zMNM3DIAE+Tg7M74dr8mqSuK6zGkp4gMLJ
	Bk21Il4rCNL3YgqC9qTBBlWm8EEVTkkkKAKwPshpBLEz6oshA7CrMJIU9/WV5lGlrNUVjXEjPpX
	Z/e2KGqVWxerUHU1DfvIU/kAhOGFE3S5wMbB0DuCbQqoN1kWtpDAMRLB87tq51rg=
X-Received: by 2002:a2e:994b:0:b0:2ea:7e5b:98db with SMTP id 38308e7fff4ca-2ea951f9657mr30714101fa.51.1717256224585;
        Sat, 01 Jun 2024 08:37:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeK+tu4fARQX37OAk+v9I2CX1pQ/GTWXSyLPXuxro93D7mX97VjpHMCgKUjK7wJgyFpheApA==
X-Received: by 2002:a2e:994b:0:b0:2ea:7e5b:98db with SMTP id 38308e7fff4ca-2ea951f9657mr30713901fa.51.1717256223896;
        Sat, 01 Jun 2024 08:37:03 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71f:b300:1d59:157a:ba27:f7e0? (p200300cbc71fb3001d59157aba27f7e0.dip0.t-ipconnect.de. [2003:cb:c71f:b300:1d59:157a:ba27:f7e0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd062eda6sm4278829f8f.86.2024.06.01.08.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jun 2024 08:37:03 -0700 (PDT)
Message-ID: <45fc081c-ee8d-4774-a597-708d2924f812@redhat.com>
Date: Sat, 1 Jun 2024 17:37:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kswapd0: page allocation failure: order:0,
 mode:0x820(GFP_ATOMIC), nodemask=(null),cpuset=/,mems_allowed=0 (Kernel
 v6.5.9, 32bit ppc)
To: Yu Zhao <yuzhao@google.com>, Erhard Furtner <erhard_f@mailbox.org>
References: <20240508202111.768b7a4d@yea> <20240515224524.1c8befbe@yea>
 <CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
 <CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
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
In-Reply-To: <CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01.06.24 08:01, Yu Zhao wrote:
> On Wed, May 15, 2024 at 4:06 PM Yu Zhao <yuzhao@google.com> wrote:
>>
>> On Wed, May 15, 2024 at 2:45 PM Erhard Furtner <erhard_f@mailbox.org> wrote:
>>>
>>> On Wed, 8 May 2024 20:21:11 +0200
>>> Erhard Furtner <erhard_f@mailbox.org> wrote:
>>>
>>>> Greetings!
>>>>
>>>> Got that on my dual CPU PowerMac G4 DP shortly after boot. This does not happen every time at bootup though:
>>>>
>>>> [...]
>>>> kswapd0: page allocation failure: order:0, mode:0x820(GFP_ATOMIC), nodemask=(null),cpuset=/,mems_allowed=0
>>>> CPU: 1 PID: 40 Comm: kswapd0 Not tainted 6.8.9-gentoo-PMacG4 #1
>>>> Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
>>>
>>> Very similar page allocation failure on the same machine on kernel 6.9.0 too. Seems it can easily be provoked by running a memory stressor, e.g. "stress-ng --vm 2 --vm-bytes 1930M --verify -v":
>>>
>>> [...]
>>> kswapd0: page allocation failure: order:0, mode:0xcc0(GFP_KERNEL), nodemask=(null),cpuset=/,mems_allowed=0
>>> CPU: 0 PID: 41 Comm: kswapd0 Not tainted 6.9.0-gentoo-PMacG4 #1
>>> Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
>>> Call Trace:
>>> [c1c65940] [c07926d4] dump_stack_lvl+0x80/0xac (unreliable)
>>> [c1c65960] [c01b6234] warn_alloc+0x100/0x178
>>> [c1c659c0] [c01b661c] __alloc_pages+0x370/0x8d0
>>> [c1c65a80] [c01c4854] __read_swap_cache_async+0xc0/0x1cc
>>> [c1c65ad0] [c01cb580] zswap_writeback_entry+0x50/0x154
>>> [c1c65be0] [c01cb6f4] shrink_memcg_cb+0x70/0xec
>>> [c1c65c10] [c019518c] __list_lru_walk_one+0xa0/0x154
>>> [c1c65c70] [c01952a4] list_lru_walk_one+0x64/0x7c
>>> [c1c65ca0] [c01cad00] zswap_shrinker_scan+0xac/0xc4
>>> [c1c65cd0] [c018052c] do_shrink_slab+0x18c/0x304
>>> [c1c65d20] [c0180a40] shrink_slab+0x174/0x260
>>> [c1c65da0] [c017cb0c] shrink_one+0xbc/0x134
>>> [c1c65dd0] [c017e3e4] shrink_node+0x238/0x84c
>>> [c1c65e50] [c017ed38] balance_pgdat+0x340/0x650
>>> [c1c65f50] [c017f270] kswapd+0x228/0x25c
>>> [c1c65fc0] [c006bbac] kthread+0xe4/0xe8
>>> [c1c65ff0] [c0015304] start_kernel_thread+0x10/0x14
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: skbuff_small_head, object size: 480, buffer size: 544, default order: 1, min order: 0
>>>    node 0: slabs: 15, objs: 225, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: skbuff_small_head, object size: 480, buffer size: 544, default order: 1, min order: 0
>>>    node 0: slabs: 15, objs: 225, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: skbuff_small_head, object size: 480, buffer size: 544, default order: 1, min order: 0
>>>    node 0: slabs: 15, objs: 225, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: skbuff_small_head, object size: 480, buffer size: 544, default order: 1, min order: 0
>>>    node 0: slabs: 15, objs: 225, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: skbuff_small_head, object size: 480, buffer size: 544, default order: 1, min order: 0
>>>    node 0: slabs: 15, objs: 225, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, default order: 3, min order: 1
>>>    kmalloc-rnd-15-2k debugging increased min order, use slab_debug=O to disable.
>>>    node 0: slabs: 33, objs: 165, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: skbuff_small_head, object size: 480, buffer size: 544, default order: 1, min order: 0
>>>    node 0: slabs: 15, objs: 225, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, default order: 3, min order: 1
>>>    kmalloc-rnd-15-2k debugging increased min order, use slab_debug=O to disable.
>>>    node 0: slabs: 33, objs: 165, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: skbuff_small_head, object size: 480, buffer size: 544, default order: 1, min order: 0
>>>    node 0: slabs: 15, objs: 225, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, default order: 3, min order: 1
>>>    kmalloc-rnd-15-2k debugging increased min order, use slab_debug=O to disable.
>>>    node 0: slabs: 33, objs: 165, free: 0
>>> Mem-Info:
>>> active_anon:340071 inactive_anon:139179 isolated_anon:0
>>>   active_file:8297 inactive_file:2506 isolated_file:0
>>>   unevictable:4 dirty:1 writeback:18
>>>   slab_reclaimable:1377 slab_unreclaimable:7426
>>>   mapped:6804 shmem:112 pagetables:946
>>>   sec_pagetables:0 bounce:0
>>>   kernel_misc_reclaimable:0
>>>   free:1141 free_pcp:7 free_cma:0
>>> Node 0 active_anon:1360284kB inactive_anon:556716kB active_file:33188kB inactive_file:10024kB unevictable:16kB isolated(anon):0kB isolated(file):0kB mapped:27216kB dirty:4kB writeback:72kB shmem:448kB writeback_tmp:0kB kernel_stack:1560kB pagetables:3784kB sec_pagetables:0kB all_unreclaimable? no
>>> DMA free:56kB boost:7756kB min:11208kB low:12068kB high:12928kB reserved_highatomic:0KB active_anon:635128kB inactive_anon:58260kB active_file:268kB inactive_file:3000kB unevictable:0kB writepending:324kB present:786432kB managed:746644kB mlocked:0kB bounce:0kB free_pcp:28kB local_pcp:28kB free_cma:0kB
>>> lowmem_reserve[]: 0 0 1280 1280
>>> DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 0kB
>>> 63943 total pagecache pages
>>> 53024 pages in swap cache
>>> Free swap  = 8057248kB
>>> Total swap = 8388604kB
>>> 524288 pages RAM
>>> 327680 pages HighMem/MovableOnly
>>> 9947 pages reserved
>>> warn_alloc: 396 callbacks suppressed
>>> kswapd0: page allocation failure: order:0, mode:0xcc0(GFP_KERNEL), nodemask=(null),cpuset=/,mems_allowed=0
>>> CPU: 1 PID: 41 Comm: kswapd0 Not tainted 6.9.0-gentoo-PMacG4 #1
>>> Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
>>> Call Trace:
>>> [c1c65940] [c07926d4] dump_stack_lvl+0x80/0xac (unreliable)
>>> [c1c65960] [c01b6234] warn_alloc+0x100/0x178
>>> [c1c659c0] [c01b661c] __alloc_pages+0x370/0x8d0
>>> [c1c65a80] [c01c4854] __read_swap_cache_async+0xc0/0x1cc
>>> [c1c65ad0] [c01cb580] zswap_writeback_entry+0x50/0x154
>>> [c1c65be0] [c01cb6f4] shrink_memcg_cb+0x70/0xec
>>> [c1c65c10] [c019518c] __list_lru_walk_one+0xa0/0x154
>>> [c1c65c70] [c01952a4] list_lru_walk_one+0x64/0x7c
>>> [c1c65ca0] [c01cad00] zswap_shrinker_scan+0xac/0xc4
>>> [c1c65cd0] [c018052c] do_shrink_slab+0x18c/0x304
>>> [c1c65d20] [c0180a40] shrink_slab+0x174/0x260
>>> [c1c65da0] [c017cb0c] shrink_one+0xbc/0x134
>>> [c1c65dd0] [c017e3e4] shrink_node+0x238/0x84c
>>> [c1c65e50] [c017ed38] balance_pgdat+0x340/0x650
>>> [c1c65f50] [c017f270] kswapd+0x228/0x25c
>>> slab_out_of_memory: 53 callbacks suppressed
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: skbuff_small_head, object size: 480, buffer size: 544, default order: 1, min order: 0
>>>    node 0: slabs: 18, objs: 270, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: skbuff_small_head, object size: 480, buffer size: 544, default order: 1, min order: 0
>>>    node 0: slabs: 18, objs: 270, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: skbuff_small_head, object size: 480, buffer size: 544, default order: 1, min order: 0
>>>    node 0: slabs: 18, objs: 270, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: skbuff_small_head, object size: 480, buffer size: 544, default order: 1, min order: 0
>>>    node 0: slabs: 18, objs: 270, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: skbuff_small_head, object size: 480, buffer size: 544, default order: 1, min order: 0
>>>    node 0: slabs: 18, objs: 270, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, default order: 3, min order: 1
>>>    kmalloc-rnd-15-2k debugging increased min order, use slab_debug=O to disable.
>>>    node 0: slabs: 33, objs: 165, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: skbuff_small_head, object size: 480, buffer size: 544, default order: 1, min order: 0
>>>    node 0: slabs: 18, objs: 270, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, default order: 3, min order: 1
>>>    kmalloc-rnd-15-2k debugging increased min order, use slab_debug=O to disable.
>>>    node 0: slabs: 33, objs: 165, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: skbuff_small_head, object size: 480, buffer size: 544, default order: 1, min order: 0
>>>    node 0: slabs: 18, objs: 270, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, default order: 3, min order: 1
>>>    kmalloc-rnd-15-2k debugging increased min order, use slab_debug=O to disable.
>>>    node 0: slabs: 33, objs: 165, free: 0
>>> [c1c65fc0] [c006bbac] kthread+0xe4/0xe8
>>> [c1c65ff0] [c0015304] start_kernel_thread+0x10/0x14
>>> Mem-Info:
>>> active_anon:351976 inactive_anon:123514 isolated_anon:0
>>>   active_file:4648 inactive_file:2081 isolated_file:0
>>>   unevictable:4 dirty:1 writeback:39
>>>   slab_reclaimable:918 slab_unreclaimable:7222
>>>   mapped:5359 shmem:21 pagetables:940
>>>   sec_pagetables:0 bounce:0
>>>   kernel_misc_reclaimable:0
>>>   free:2563 free_pcp:142 free_cma:0
>>> Node 0 active_anon:1407904kB inactive_anon:494056kB active_file:18592kB inactive_file:8324kB unevictable:16kB isolated(anon):0kB isolated(file):0kB mapped:21436kB dirty:4kB writeback:156kB shmem:84kB writeback_tmp:0kB kernel_stack:1552kB pagetables:3760kB sec_pagetables:0kB all_unreclaimable? no
>>> DMA free:0kB boost:7756kB min:11208kB low:12068kB high:12928kB reserved_highatomic:0KB active_anon:199336kB inactive_anon:491432kB active_file:4612kB inactive_file:5980kB unevictable:0kB writepending:660kB present:786432kB managed:746644kB mlocked:0kB bounce:0kB free_pcp:568kB local_pcp:20kB free_cma:0kB
>>> lowmem_reserve[]: 0 0 1280 1280
>>> DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 0kB
>>> 45961 total pagecache pages
>>> 39207 pages in swap cache
>>> Free swap  = 8093096kB
>>> Total swap = 8388604kB
>>> 524288 pages RAM
>>> 327680 pages HighMem/MovableOnly
>>> 9947 pages reserved
>>> warn_alloc: 343 callbacks suppressed
>>> kswapd0: page allocation failure: order:0, mode:0xcc0(GFP_KERNEL), nodemask=(null),cpuset=/,mems_allowed=0
>>> CPU: 0 PID: 41 Comm: kswapd0 Not tainted 6.9.0-gentoo-PMacG4 #1
>>> Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
>>> Call Trace:
>>> [c1c65940] [c07926d4] dump_stack_lvl+0x80/0xac (unreliable)
>>> [c1c65960] [c01b6234] warn_alloc+0x100/0x178
>>> [c1c659c0] [c01b661c] __alloc_pages+0x370/0x8d0
>>> [c1c65a80] [c01c4854] __read_swap_cache_async+0xc0/0x1cc
>>> [c1c65ad0] [c01cb580] zswap_writeback_entry+0x50/0x154
>>> [c1c65be0] [c01cb6f4] shrink_memcg_cb+0x70/0xec
>>> [c1c65c10] [c019518c] __list_lru_walk_one+0xa0/0x154
>>> slab_out_of_memory: 59 callbacks suppressed
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: skbuff_small_head, object size: 480, buffer size: 544, default order: 1, min order: 0
>>>    node 0: slabs: 18, objs: 270, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: skbuff_small_head, object size: 480, buffer size: 544, default order: 1, min order: 0
>>>    node 0: slabs: 18, objs: 270, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: skbuff_small_head, object size: 480, buffer size: 544, default order: 1, min order: 0
>>>    node 0: slabs: 18, objs: 270, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: skbuff_small_head, object size: 480, buffer size: 544, default order: 1, min order: 0
>>>    node 0: slabs: 18, objs: 270, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: skbuff_small_head, object size: 480, buffer size: 544, default order: 1, min order: 0
>>>    node 0: slabs: 18, objs: 270, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, default order: 3, min order: 1
>>>    kmalloc-rnd-15-2k debugging increased min order, use slab_debug=O to disable.
>>>    node 0: slabs: 33, objs: 165, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: skbuff_small_head, object size: 480, buffer size: 544, default order: 1, min order: 0
>>>    node 0: slabs: 18, objs: 270, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, default order: 3, min order: 1
>>>    kmalloc-rnd-15-2k debugging increased min order, use slab_debug=O to disable.
>>>    node 0: slabs: 33, objs: 165, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: skbuff_small_head, object size: 480, buffer size: 544, default order: 1, min order: 0
>>>    node 0: slabs: 18, objs: 270, free: 0
>>> SLUB: Unable to allocate memory on node -1, gfp=0x820(GFP_ATOMIC)
>>>    cache: kmalloc-rnd-15-2k, object size: 2048, buffer size: 6144, default order: 3, min order: 1
>>>    kmalloc-rnd-15-2k debugging increased min order, use slab_debug=O to disable.
>>>    node 0: slabs: 33, objs: 165, free: 0
>>> [c1c65c70] [c01952a4] list_lru_walk_one+0x64/0x7c
>>> [c1c65ca0] [c01cad00] zswap_shrinker_scan+0xac/0xc4
>>> [c1c65cd0] [c018052c] do_shrink_slab+0x18c/0x304
>>> [c1c65d20] [c0180a40] shrink_slab+0x174/0x260
>>> [c1c65da0] [c017cb0c] shrink_one+0xbc/0x134
>>> [c1c65dd0] [c017e3e4] shrink_node+0x238/0x84c
>>> [c1c65e50] [c017ed38] balance_pgdat+0x340/0x650
>>> [c1c65f50] [c017f270] kswapd+0x228/0x25c
>>> [c1c65fc0] [c006bbac] kthread+0xe4/0xe8
>>> [c1c65ff0] [c0015304] start_kernel_thread+0x10/0x14
>>> Mem-Info:
>>> active_anon:235002 inactive_anon:240975 isolated_anon:0
>>>   active_file:4356 inactive_file:2551 isolated_file:0
>>>   unevictable:4 dirty:7 writeback:19
>>>   slab_reclaimable:1008 slab_unreclaimable:7218
>>>   mapped:5601 shmem:21 pagetables:939
>>>   sec_pagetables:0 bounce:0
>>>   kernel_misc_reclaimable:0
>>>   free:1340 free_pcp:23 free_cma:0
>>> Node 0 active_anon:940008kB inactive_anon:963900kB active_file:17424kB inactive_file:10204kB unevictable:16kB isolated(anon):0kB isolated(file):0kB mapped:22404kB dirty:28kB writeback:76kB shmem:84kB writeback_tmp:0kB kernel_stack:1552kB pagetables:3756kB sec_pagetables:0kB all_unreclaimable? no
>>> DMA free:0kB boost:7756kB min:11208kB low:12068kB high:12928kB reserved_highatomic:0KB active_anon:644060kB inactive_anon:36332kB active_file:5276kB inactive_file:5516kB unevictable:0kB writepending:348kB present:786432kB managed:746644kB mlocked:0kB bounce:0kB free_pcp:92kB local_pcp:92kB free_cma:0kB
>>> lowmem_reserve[]: 0 0 1280 1280
>>> DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 0kB
>>> 116345 total pagecache pages
>>> 109413 pages in swap cache
>>> Free swap  = 7819300kB
>>> Total swap = 8388604kB
>>> 524288 pages RAM
>>> 327680 pages HighMem/MovableOnly
>>> 9947 pages reserved
>>>
>>>
>>> I switched from zstd to lzo as zswap default compressor so zstd does not show up on the dmesg. But the rest looks pretty similar.
>>>
>>> Full dmesg and kernel .config attached.
>>>
>>> Regards,
>>> Erhard
>>
>> Hi Erhard,
>>
>> Thanks for the reports. I'll take a look at them and get back to you
>> in a few days.
> 
> Hi Erhard,
> 
> The OOM kills on both kernel versions seem to be reasonable to me.
> 
> Your system has 2GB memory and it uses zswap with zsmalloc (which is
> good since it can allocate from the highmem zone) and zstd/lzo (which
> doesn't matter much). Somehow -- I couldn't figure out why -- it
> splits the 2GB into a 0.25GB DMA zone and a 1.75GB highmem zone:
> 
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000000000000-0x000000002fffffff]
> [    0.000000]   Normal   empty
> [    0.000000]   HighMem  [mem 0x0000000030000000-0x000000007fffffff]

That's really odd. But we are messing with "PowerMac3,6", so I don't 
really know what's right or wrong ...

-- 
Cheers,

David / dhildenb

