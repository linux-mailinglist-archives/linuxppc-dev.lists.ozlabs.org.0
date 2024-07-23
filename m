Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E986939C77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 10:19:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SY+vCyBi;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SY+vCyBi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSqn92zC6z3cj7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 18:19:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SY+vCyBi;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SY+vCyBi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSqmS1Sd5z3cZ4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 18:18:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721722723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=e7cAW2e9eTq2PNCKhGWDYhlkj3Xk8nGIpFjirqjv88A=;
	b=SY+vCyBih68++XuOfZuju/LUfNt2eutuAzy/Zlp4wihmtXW+0uz5mX2czAgIiaoc4tV1Vn
	9d0bJj6luD3qRjcinecFYR9AvM6GPNMigmkky/ApOqqQQlYfEWT64TKUlDxXA0I+dCL9My
	exBp0QOwP+dbUeVtdZnxI2ov90UbZa0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721722723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=e7cAW2e9eTq2PNCKhGWDYhlkj3Xk8nGIpFjirqjv88A=;
	b=SY+vCyBih68++XuOfZuju/LUfNt2eutuAzy/Zlp4wihmtXW+0uz5mX2czAgIiaoc4tV1Vn
	9d0bJj6luD3qRjcinecFYR9AvM6GPNMigmkky/ApOqqQQlYfEWT64TKUlDxXA0I+dCL9My
	exBp0QOwP+dbUeVtdZnxI2ov90UbZa0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-nrgFGWE1PJmxcMn6lAyHfw-1; Tue, 23 Jul 2024 04:18:41 -0400
X-MC-Unique: nrgFGWE1PJmxcMn6lAyHfw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4265d3bf59dso37360655e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 01:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721722720; x=1722327520;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e7cAW2e9eTq2PNCKhGWDYhlkj3Xk8nGIpFjirqjv88A=;
        b=D4QvzaiGRZlCB2BcjtgD/ZGSDFd5bzf4WNlD1rJOb04qdA6gtEdQzDZNtn67er/VC9
         +tLxotjv9fTq0HASii/kSGDYTWoiijfWZJbxN5RAYhY2tfMSqHmWfjkvTYls/sYSyd+d
         ITUn6xAHAobBrYgAvIjrI2CTLr3NZc0tU6mOwudU+tPmlN1Fwg2TctZgjpEGKAY4UZZs
         /e/mk52Op/w5Bf3cPd8Ei/OJvz22qOAjCAMgoeRIx3k8jStGS6SylR6kqGf9+Mb2u/bk
         ii06polQyxEaPG5QJbT563g147JwHAqSOzbsH39D6YhKmdVbf3tEV+49sSoLIJtJpoc6
         9O4w==
X-Forwarded-Encrypted: i=1; AJvYcCXAWmSDVxwdv6vADiXSou9CExzh3EDAmlusmOKy1Mjx9AtiC2CTIR/nCMcLGBPTe+Y/tTFIWKnfV+W4b7KUG9IvABdifyqDVZqFShAAkA==
X-Gm-Message-State: AOJu0Yxbk+MPNmMFiLmfHyFhKnROQZsp9Kk/KEGXIO/2lVxbXZWYv15P
	60tX9WKBZizyeZR6eL98UkqM1ok/PDiv9ohGOVozHtInSil3mc4OB0WEHlMYnS0wK/tsu8ncxbO
	1C+RHvvDuuqCW0AYn7ojzudi8EUYlJDBaenWfVXE9WSXt/ZHgshj7fXFMIeaHFkY=
X-Received: by 2002:a05:600c:500f:b0:426:6326:4cec with SMTP id 5b1f17b1804b1-427df7a7828mr59109995e9.29.1721722720305;
        Tue, 23 Jul 2024 01:18:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUWHnl+IF1Uo0ddKTvKJTZa1BJHPgCl9dGzav/h00NQB9OiTQfs5h5kD6cvqR3xzQXjLrG9w==
X-Received: by 2002:a05:600c:500f:b0:426:6326:4cec with SMTP id 5b1f17b1804b1-427df7a7828mr59109795e9.29.1721722719834;
        Tue, 23 Jul 2024 01:18:39 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:ed00:9dc2:1adb:d133:4434? (p200300cbc72fed009dc21adbd1334434.dip0.t-ipconnect.de. [2003:cb:c72f:ed00:9dc2:1adb:d133:4434])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6929827sm160330615e9.34.2024.07.23.01.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 01:18:39 -0700 (PDT)
Message-ID: <cfe94481-233a-421c-b607-08517588de6c@redhat.com>
Date: Tue, 23 Jul 2024 10:18:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/6] mm: THP-agnostic refactor on huge mappings
To: Peter Xu <peterx@redhat.com>
References: <20240717220219.3743374-1-peterx@redhat.com>
 <cf36725d-c197-4c07-8998-d34711335fdb@redhat.com> <Zp57ZLk2IQoHOI7u@x1n>
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
In-Reply-To: <Zp57ZLk2IQoHOI7u@x1n>
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
Cc: linux-s390@vger.kernel.org, Alistair Popple <apopple@nvidia.com>, Ryan Roberts <ryan.roberts@arm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, Alex Williamson <alex.williamson@redhat.com>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22.07.24 17:31, Peter Xu wrote:
> On Mon, Jul 22, 2024 at 03:29:43PM +0200, David Hildenbrand wrote:
>> On 18.07.24 00:02, Peter Xu wrote:
>>> This is an RFC series, so not yet for merging.  Please don't be scared by
>>> the code changes: most of them are code movements only.
>>>
>>> This series is based on the dax mprotect fix series here (while that one is
>>> based on mm-unstable):
>>>
>>>     [PATCH v3 0/8] mm/mprotect: Fix dax puds
>>>     https://lore.kernel.org/r/20240715192142.3241557-1-peterx@redhat.com
>>>
>>> Overview
>>> ========
>>>
>>> This series doesn't provide any feature change.  The only goal of this
>>> series is to start decoupling two ideas: "THP" and "huge mapping".  We
>>> already started with having PGTABLE_HAS_HUGE_LEAVES config option, and this
>>> one extends that idea into the code.
>>>
>>> The issue is that we have so many functions that only compile with
>>> CONFIG_THP=on, even though they're about huge mappings, and huge mapping is
>>> a pretty common concept, which can apply to many things besides THPs
>>> nowadays.  The major THP file is mm/huge_memory.c as of now.
>>>
>>> The first example of such huge mapping users will be hugetlb.  We lived
>>> until now with no problem simply because Linux almost duplicated all the
>>> logics there in the "THP" files into hugetlb APIs.  If we want to get rid
>>> of hugetlb specific APIs and paths, this _might_ be the first thing we want
>>> to do, because we want to be able to e.g., zapping a hugetlb pmd entry even
>>> if !CONFIG_THP.
>>>
>>> Then consider other things like dax / pfnmaps.  Dax can depend on THP, then
>>> it'll naturally be able to use pmd/pud helpers, that's okay.  However is it
>>> a must?  Do we also want to have every new pmd/pud mappings in the future
>>> to depend on THP (like PFNMAP)?  My answer is no, but I'm open to opinions.
>>>
>>> If anyone agrees with me that "huge mapping" (aka, PMD/PUD mappings that
>>> are larger than PAGE_SIZE) is a more generic concept than THP, then I think
>>> at some point we need to move the generic code out of THP code into a
>>> common code base.
>>>
>>> This is what this series does as a start.
>>
>> Hi Peter!
>>
>>  From a quick glimpse, patch #1-#4 do make sense independent of patch #5.
>>
>> I am not so sure about all of the code movement in patch #5. If large folios
>> are the future, then likely huge_memory.c should simply be the home for all
>> that logic.
>>
>> Maybe the goal should better be to compile huge_memory.c not only for THP,
>> but also for other use cases that require that logic, and fence off all THP
>> specific stuff using #ifdef?
>>
>> Not sure, though. But a lot of this code movements/churn might be avoidable.
> 
> I'm fine using ifdefs in the current fine, but IMHO it's a matter of
> whether we want to keep huge_memory.c growing into even larger file, and
> keep all large folio logics only in that file.  Currently it's ~4000 LOCs.

Depends on "how much" for sure. huge_memory.c is currently on place 12 
of the biggest files in mm/. So there might not be immediate cause for 
action ... just yet :) [guess which file is on #2 :) ]

> 
> Nornally I don't see this as much of a "code churn" category, because it
> doesn't changes the code itself but only move things.  I personally also
> prefer without code churns, but only in the case where there'll be tiny
> little functional changes here and there without real benefit.
> 
> It's pretty unavoidable to me when one file grows too large and we'll need
> to split, and in this case git doesn't have a good way to track such
> movement..

Yes, that's what I mean.

I've been recently thinking if we should pursue a different direction:

Just as we recently relocated most follow_huge_* stuff into gup.c, 
likely we should rather look into moving copy_huge_pmd, change_huge_pmd, 
copy_huge_pmd ... into the files where they logically belong to.

In madvise.c, we've been doing that in some places already: For 
madvise_cold_or_pageout_pte_range() we inline the code, but not for 
madvise_free_huge_pmd().

pmd_trans_huge() would already compile to a NOP without 
CONFIG_TRANSPARENT_HUGEPAGE, but to make that code avoid most 
CONFIG_TRANSPARENT_HUGEPAGE, we'd need a couple more function stubs to 
make the compiler happy while still being able to compile that code out 
when not required.

The idea would be that e.g., pmd_leaf() would return "false" at compile 
time if no active configuration (THP, HUGETLB, ...) would be active. So 
we could just use pmd_leaf() similar to pmd_trans_huge() in relevant 
code and have the compiler optimize it all out without putting it into 
separate files.

That means, large folios and PMD/PUD mappings will become "more common" 
and better integrated, without the need to jump between files.

Just some thought about an alternative that would make sense to me.

> 
> Irrelevant of this, just to mention I think there's still one option that I
> at least can make the huge pfnmap depends on THP again which shouldn't be a
> huge deal (I don't have any use case that needs huge pfnmap but disable
> THP, anyway..), so this series isn't an immediate concern to me for that
> route.  But for a hugetlb rework this might be something we need to do,
> because we simplly can't make CONFIG_HUGETLB rely on CONFIG_THP..

Yes, likely. FSDAX went a similar direction and called that FSDAX thing 
a "THP" whereby it really doesn't have anything in common with a THP, 
besides being partially mappable -- IMHO.

-- 
Cheers,

David / dhildenb

