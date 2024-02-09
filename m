Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C26B2850019
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 23:37:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZC7DZSOr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aC6rX+DZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWpd44yNPz3cVM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 09:37:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZC7DZSOr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aC6rX+DZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWpcD5v7Wz30Ql
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Feb 2024 09:36:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707518184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZsuwvNcy7srG22SEiNvqp25+3IIw8oPhoxlAvIGHUo0=;
	b=ZC7DZSOrCNGjvHiYJmqdQiI6s0ENvLYlG/oi1GA4IXG8ir7812kcz7391TVWGyUDrPmXOR
	h4LwmR3KZO5EV6FFCBU/gxKm7xSr7jDUn2eQ84RHxhTGWduTKQT94Vf+ICKlEUWuvOUozc
	5nWCtI3GkKWN9QulaKW3jyAvY64fNo8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707518185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZsuwvNcy7srG22SEiNvqp25+3IIw8oPhoxlAvIGHUo0=;
	b=aC6rX+DZeTXEGi4c2ITuwRC4nx6TM3unHVXNODN2mPL3ze270ngmeyizzogUvWpXx+dpLy
	TQI9Jqi0Nlsk0DswG+Oco2HpUEpuNVue3UXSLrhcgknGYmI/JO1Y8aFGLrxQAxhiMrWCcm
	rQbIBOI3NvkIhywUI1iCkmzUOF0SLZs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-WuzkPeNyOUiEWVn8eUWdxA-1; Fri, 09 Feb 2024 17:36:21 -0500
X-MC-Unique: WuzkPeNyOUiEWVn8eUWdxA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-33b16845d12so548165f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Feb 2024 14:36:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707518180; x=1708122980;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsuwvNcy7srG22SEiNvqp25+3IIw8oPhoxlAvIGHUo0=;
        b=tmurjTFfOTMqgm67y4fb+Z8H50XQ6TcOLD0Eu/RmyURK2zedJjTcQNoIqKjKcCqFmd
         uXbwYYi2uCSyRy7/eRFsPSTeBNjC7NtYVcQthE4jIdGrkqbJGBySZZl1exLJ1QufBJIA
         4rj3PvCmkOZHLTI5jQFH5PeIYcKHbwLDVtZPqbsTZIDgyem9B1ezuS0b6i6P4P3gKkDe
         fT+y190erTBFOL8pGGSW02rTK/a8/OmfAImYu9VtQeKDv6OiQp4f/6zWmguBoaveiCge
         F9udtGellwYKETzDruCw2S8TeHNHsmKzdryLE4bTSe9rTR/Su5M9RJ0fTRJuvLp9g561
         Mi2A==
X-Forwarded-Encrypted: i=1; AJvYcCUO5ZsZpNHMKyMl0dXi9kfY7tGxLVT3e4f+Ef2Q0Vwmd5qU/1aDmighDRxfdM+WhJaZ3+eHGPQebmAISp+EXEHMYoLirEEpnW7vaw/y/A==
X-Gm-Message-State: AOJu0Yy+T2crihQy61sAgARTPDF3UM5K9FhC+0fE5aky5LT8R+VSnNL/
	EwYHSjv9b7odp3QHpCSkFBflsvA6Lud10vDqGN28Is9FjeFS37vQwATibU0+USHODw4NdBHi7Y7
	ugNpKLH4QteyFrzln5sODN6u4mHywOF8GZMszc4x31bV6AfvkTEYLvvigrVT6akQ=
X-Received: by 2002:a5d:6292:0:b0:33b:63a5:feaf with SMTP id k18-20020a5d6292000000b0033b63a5feafmr257853wru.20.1707518180236;
        Fri, 09 Feb 2024 14:36:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGy4CLCviUyK1OodnIQ1mSMGsomV26G3hTfhyNyhH+GDYkVLAS41fsfIsBxx2rncVdrBGU2iQ==
X-Received: by 2002:a5d:6292:0:b0:33b:63a5:feaf with SMTP id k18-20020a5d6292000000b0033b63a5feafmr257824wru.20.1707518179877;
        Fri, 09 Feb 2024 14:36:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+S/n/bVOO58PUK1OwN7/Y+dBJ5Acz/W4v5CpS3WjHnlBwf5/kpFz/wL+kjiKDWoYAbMbmz+gfFu3wnLXtBbxCWkITbHaCVUcGP7u+50RgLdzNW8tvTduDZYlK7MB1HQYRoJZinm8OkVnP8sJoPvVGz4wv+D0Eg2VgbZ7AXAwCuG3nMyDoSZuYSEQadSv9xdO/Fa6KTh1AkNjK94KUMkSDjzjPeBstwXOO6fe1+4//EXnxjeSQdYFt9cf1MrZj0tTGeQsXrFc8zY29xujzIzXIkv/sz7qQmw3J/oEyQULKRgSRj9dGr2hSQb6mMBn29bG9uZTzst7HlmvlOUeQMP3oO5aO9Qre9eufCQmP/scsKKHrMNn5C7brXfc/bnaV30nPWgCtCJj8DyNi6RVhcsICK0xzM3FLq+WtyxQXzxq3Q1mVv3ekPFV6vZDI9sRV0ZsOkcSnQr8Io1TS5UjvK5HhDSbVQSmc4Wh+hLJHHpfKcTOQ2+MxMY6N0Xxk9tPmR33BDXQythmIKROkQxoSG5pWrYSc6vt+la3dIZdPZKiOiKA8o1Qrw5HbI/KNeeMbhK0M6MWb8dov8n6VBAOblsB0fAZkWbv0dZBwcyGKAGdXYVftcthpd9cl8+TK+ztAgquDjBBYUdw9VWZ0hJbKnBMen/iCJVBWYDK18Kgh4t0wtTIgAL+hHoNIIwXxio66kkRQIbxB08XzsuYcI3oqq99Swsc1pwPtECz1LF3UJHq0YNgR131OhFS537vvvFq6oc08Ih4zOua0Y1XMcyyQAQPYLWoJSRDH6zWQYAyTkP5q6Is5nmPJhGU+1TZavOAw4aKVmIgceFdaNR9anFUa5bThPfvB3vEqMH60Pbru0a+AMRtmtj4XIDGO6hFgsPnuxl/y/ofxT5dIt4a28pdauobL4VRBGYmtKLzxoD6qzBcccu4oIX/98ViWmXZ9d0y+Cr0u5B
 2vz249Brar3w0=
Received: from ?IPV6:2003:cb:c718:6800:9d15:2b60:4f57:7998? (p200300cbc71868009d152b604f577998.dip0.t-ipconnect.de. [2003:cb:c718:6800:9d15:2b60:4f57:7998])
        by smtp.gmail.com with ESMTPSA id bv4-20020a0560001f0400b0033b670b0a6asm302786wrb.74.2024.02.09.14.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 14:36:19 -0800 (PST)
Message-ID: <6b0d2c43-90cd-4429-baa9-078dd37fe207@redhat.com>
Date: Fri, 9 Feb 2024 23:36:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/15] arm64/mm: Make set_ptes() robust when OAs cross
 48-bit boundary
To: Mike Rapoport <rppt@kernel.org>
References: <20240129124649.189745-1-david@redhat.com>
 <20240129124649.189745-2-david@redhat.com> <ZcRwc2mEDHIXxgGa@kernel.org>
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
In-Reply-To: <ZcRwc2mEDHIXxgGa@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@d
 avemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08.02.24 07:10, Mike Rapoport wrote:
> On Mon, Jan 29, 2024 at 01:46:35PM +0100, David Hildenbrand wrote:
>> From: Ryan Roberts <ryan.roberts@arm.com>
>>
>> Since the high bits [51:48] of an OA are not stored contiguously in the
>> PTE, there is a theoretical bug in set_ptes(), which just adds PAGE_SIZE
>> to the pte to get the pte with the next pfn. This works until the pfn
>> crosses the 48-bit boundary, at which point we overflow into the upper
>> attributes.
>>
>> Of course one could argue (and Matthew Wilcox has :) that we will never
>> see a folio cross this boundary because we only allow naturally aligned
>> power-of-2 allocation, so this would require a half-petabyte folio. So
>> its only a theoretical bug. But its better that the code is robust
>> regardless.
>>
>> I've implemented pte_next_pfn() as part of the fix, which is an opt-in
>> core-mm interface. So that is now available to the core-mm, which will
>> be needed shortly to support forthcoming fork()-batching optimizations.
>>
>> Link: https://lkml.kernel.org/r/20240125173534.1659317-1-ryan.roberts@arm.com
>> Fixes: 4a169d61c2ed ("arm64: implement the new page table range API")
>> Closes: https://lore.kernel.org/linux-mm/fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com/
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>> Reviewed-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

Thanks for the review Mike, appreciated!

-- 
Cheers,

David / dhildenb

