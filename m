Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BC2843E51
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 12:29:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c65srvWL;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c65srvWL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQ0DG22p8z3cVB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 22:29:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c65srvWL;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c65srvWL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQ0CS3gvJz3bqC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 22:28:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706700496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QEgFZrM0WK1zcolOs9UzEgOHw8WztsvnyJnbA5iRSvg=;
	b=c65srvWLLbYIJAwjUZrB80uh9hNEE3yK5hJTgekTgP4ZwH4kWY2xg0L4dYHoq6ocvo1b2k
	8lcI/K0OM4vUvKqxtbWAItEN+QQAeKYQTcOQBCIbvZiiNr9slSI4GscmHen0jWqhJK1QgA
	jhxfW9H1EL1BXKXynhlLqjTZb8XeQhU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706700496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QEgFZrM0WK1zcolOs9UzEgOHw8WztsvnyJnbA5iRSvg=;
	b=c65srvWLLbYIJAwjUZrB80uh9hNEE3yK5hJTgekTgP4ZwH4kWY2xg0L4dYHoq6ocvo1b2k
	8lcI/K0OM4vUvKqxtbWAItEN+QQAeKYQTcOQBCIbvZiiNr9slSI4GscmHen0jWqhJK1QgA
	jhxfW9H1EL1BXKXynhlLqjTZb8XeQhU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-oJgRR8E4MPWMx8GG4XMW6w-1; Wed, 31 Jan 2024 06:28:12 -0500
X-MC-Unique: oJgRR8E4MPWMx8GG4XMW6w-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6800a9505ddso88597676d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 03:28:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706700492; x=1707305292;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEgFZrM0WK1zcolOs9UzEgOHw8WztsvnyJnbA5iRSvg=;
        b=fOTucfkv+H5HWT3VuZniGLqTyZCuoQUhjeZg9k9+hegr8tyJ393PT3549p91US3e7/
         ptwzayaVoO2kQNMnkiLRWJJBS1Rbm2Q5G8y1zyEu2UBcGS3z0Rrz/h7466HSfX0UTg+b
         I2HN9+hYtcs6LjHTU7jSqDaIoC+FhosJOYjsGOphioEGGTai0m+yjwlKk3OaBdvyjlvu
         WkbMryoR+9iZBoYwpPRH96kTKbVVPCMc8nzvXmOdqahRyC4Za8V1CrWSp4y+pOPYTycw
         JS7ut7ew7wHUTrYQm6+qo3T3bIh/Hd+i2VEvX+RnXkqBITS66sdxCOiRyy82K48UHmtr
         UC/w==
X-Gm-Message-State: AOJu0Yx6QHxoatmiz57Dgp3EfEOxgzpTZiQt7yY1rTXS4zGOIbc4fYPU
	J8EW4fEuwysOJZISnMx891RfylLVRLC6vu0wSXTt19j0xClyE6Pgaxhd+zRg7d9xug3LEKaVHou
	RayqujKo9z7hhDtxYW/0+52JHeOJTXGrovbPJO2hPt+3vgobJgEOHiu3UsuLG75A=
X-Received: by 2002:ad4:596f:0:b0:68c:5cd3:7657 with SMTP id eq15-20020ad4596f000000b0068c5cd37657mr1161419qvb.50.1706700491815;
        Wed, 31 Jan 2024 03:28:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnMRI1kY3UTBQ/tm4+uOS8wrOMJMpp0UBTiS3ZHTfv2MyVvtZoSJ5dluKxqhKuk0iXvDsuZw==
X-Received: by 2002:ad4:596f:0:b0:68c:5cd3:7657 with SMTP id eq15-20020ad4596f000000b0068c5cd37657mr1161383qvb.50.1706700491415;
        Wed, 31 Jan 2024 03:28:11 -0800 (PST)
Received: from [10.32.64.237] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id dz11-20020ad4588b000000b0068c493426edsm3433632qvb.104.2024.01.31.03.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 03:28:11 -0800 (PST)
Message-ID: <e6eaba5b-f290-4d1f-990b-a47d89f56ee4@redhat.com>
Date: Wed, 31 Jan 2024 12:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] mm/memory: optimize fork() with PTE-mapped THP
To: Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
References: <20240129124649.189745-1-david@redhat.com>
 <a335a9d2-9b8f-4eb8-ba22-23a223b59b06@arm.com>
 <a1a0e9b3-dae2-418f-bd63-50e65f471728@redhat.com>
 <57eb82c7-4816-42a2-b5ab-cc221e289b21@arm.com>
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
In-Reply-To: <57eb82c7-4816-42a2-b5ab-cc221e289b21@arm.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 31.01.24 12:16, Ryan Roberts wrote:
> On 31/01/2024 11:06, David Hildenbrand wrote:
>> On 31.01.24 11:43, Ryan Roberts wrote:
>>> On 29/01/2024 12:46, David Hildenbrand wrote:
>>>> Now that the rmap overhaul[1] is upstream that provides a clean interface
>>>> for rmap batching, let's implement PTE batching during fork when processing
>>>> PTE-mapped THPs.
>>>>
>>>> This series is partially based on Ryan's previous work[2] to implement
>>>> cont-pte support on arm64, but its a complete rewrite based on [1] to
>>>> optimize all architectures independent of any such PTE bits, and to
>>>> use the new rmap batching functions that simplify the code and prepare
>>>> for further rmap accounting changes.
>>>>
>>>> We collect consecutive PTEs that map consecutive pages of the same large
>>>> folio, making sure that the other PTE bits are compatible, and (a) adjust
>>>> the refcount only once per batch, (b) call rmap handling functions only
>>>> once per batch and (c) perform batch PTE setting/updates.
>>>>
>>>> While this series should be beneficial for adding cont-pte support on
>>>> ARM64[2], it's one of the requirements for maintaining a total mapcount[3]
>>>> for large folios with minimal added overhead and further changes[4] that
>>>> build up on top of the total mapcount.
>>>>
>>>> Independent of all that, this series results in a speedup during fork with
>>>> PTE-mapped THP, which is the default with THPs that are smaller than a PMD
>>>> (for example, 16KiB to 1024KiB mTHPs for anonymous memory[5]).
>>>>
>>>> On an Intel Xeon Silver 4210R CPU, fork'ing with 1GiB of PTE-mapped folios
>>>> of the same size (stddev < 1%) results in the following runtimes
>>>> for fork() (shorter is better):
>>>>
>>>> Folio Size | v6.8-rc1 |      New | Change
>>>> ------------------------------------------
>>>>         4KiB | 0.014328 | 0.014035 |   - 2%
>>>>        16KiB | 0.014263 | 0.01196  |   -16%
>>>>        32KiB | 0.014334 | 0.01094  |   -24%
>>>>        64KiB | 0.014046 | 0.010444 |   -26%
>>>>       128KiB | 0.014011 | 0.010063 |   -28%
>>>>       256KiB | 0.013993 | 0.009938 |   -29%
>>>>       512KiB | 0.013983 | 0.00985  |   -30%
>>>>      1024KiB | 0.013986 | 0.00982  |   -30%
>>>>      2048KiB | 0.014305 | 0.010076 |   -30%
>>>
>>> Just a heads up that I'm seeing some strange results on Apple M2. Fork for
>>> order-0 is seemingly costing ~17% more. I'm using GCC 13.2 and was pretty sure I
>>> didn't see this problem with version 1; although that was on a different
>>> baseline and I've thrown the numbers away so will rerun and try to debug this.
>>>
>>
>> So far, on my x86 tests (Intel, AMD EPYC), I was not able to observe this.
>> fork() for order-0 was consistently effectively unchanged. Do you observe that
>> on other ARM systems as well?
> 
> Nope; running the exact same kernel binary and user space on Altra, I see
> sensible numbers;
> 
> fork order-0: -1.3%
> fork order-9: -7.6%
> dontneed order-0: -0.5%
> dontneed order-9: 0.1%
> munmap order-0: 0.0%
> munmap order-9: -67.9%
> 
> So I guess some pipelining issue that causes the M2 to stall more?

With one effective added folio_test_large(), it could only be a code 
layout problem? Or the compiler does something stupid, but you say that 
you run the exact same kernel binary, so that doesn't make sense.

I'm also surprised about the dontneed vs. munmap numbers. Doesn't make 
any sense (again, there was this VMA merging problem but it would still 
allow for batching within a single VMA that spans exactly one large folio).

What are you using as baseline? Really just mm-unstable vs. 
mm-unstable+patches?

Let's see if the new test changes the numbers you measure.

-- 
Cheers,

David / dhildenb

