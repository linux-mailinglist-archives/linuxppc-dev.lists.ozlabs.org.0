Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E3A838F58
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 14:07:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XqsY4bt5;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GtRTe2X+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK6nJ5KDYz3vhm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 00:07:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XqsY4bt5;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GtRTe2X+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TK6mS1kRtz3cjS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jan 2024 00:06:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706015184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9ZO5/S+WkNilMPFC8u75P1EqsJQAK0BAvGyC/8CmXAo=;
	b=XqsY4bt5b/vhvohnyKUAyX+7thyxf3SnJcgH34ESp+XOuXiTLWknC2d2RXJHUb1V4EnkdL
	ariumai7K60j+zN2Cj5Um0uHiQgRs5YKhn/hTKt5OTQxAJXhMRJWLmDXzXLmcRm4Xiv2Pb
	u8m+kWKS6/9dMS/iictVZyHoOvW4PWQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706015185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9ZO5/S+WkNilMPFC8u75P1EqsJQAK0BAvGyC/8CmXAo=;
	b=GtRTe2X+bJDcTPOK2ASu5lJD3vsp6PheiYejXTMiq71NgnFZvCg45wWecf2wQs/4dZ1niF
	ktqqmPiWiXUkML54v/UXsUN+jPYZJ+kuy+uiyazfepytVf1774HWonCaWsgob0+d2nGPcD
	87Bc9wyJqnYqh5C1B1IRTqWaMby8BaQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-MH4dHdCEOGmqathGFl64kA-1; Tue, 23 Jan 2024 08:06:21 -0500
X-MC-Unique: MH4dHdCEOGmqathGFl64kA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-339221f285eso2340363f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 05:06:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706015180; x=1706619980;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZO5/S+WkNilMPFC8u75P1EqsJQAK0BAvGyC/8CmXAo=;
        b=NM5cFtDjk4U+OGaBXgQ/pUj2/Y1FQKrO/kOnqstggZPklzOZfDX4ZgxTJyXbyNlaVa
         DDJ/asJ3D33DB4OB3dBaqH42iXMik1KpCPBm22W6Fq7uUpQySpGjODaIURtrJ57P5w94
         xITCynd8N4ga+HHa3AOHFu9f9rIfJZRhKGy/HLgsXdKN22MejdcPSc2NDtVvNurrXHL6
         +oIMWJMDVMj3CdlkAuHw47/qTeQ6C1vywb1pm6/sebALV6wvmjTa+nj3isIp3pgffEot
         MJP/Pjg002nQM2Xo97WfZJRnyhzvWcXBwD1iQDZuImDDIVR1nVxUOCyrRT6i221RTiMB
         YH3Q==
X-Gm-Message-State: AOJu0YyjC8ZHz15R86R8XU0hJHiRZJatcsc+HK7R5o+XkErdtH4o44rR
	6cICkseFwYT+4+UxWOeCBd6haS+irlgQR8sOxcoLBt+zIIXoTsWeWGflmjwUBj0a8kg2AHYPqrK
	1O1G3UczuP7/O5veFLQmnAV0cs2xY/0C8LZecDhh61h+BTvpuK8sRW9bg06CeDvs=
X-Received: by 2002:a05:6000:1012:b0:336:6dd3:bfcf with SMTP id a18-20020a056000101200b003366dd3bfcfmr3242295wrx.121.1706015180234;
        Tue, 23 Jan 2024 05:06:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxwabGnuZ5662MibBSnjCQiIAfXFlXMdO5ToPcXe4cQUWhf8E4e/TKd7vjqnqy/svNYk3hvg==
X-Received: by 2002:a05:6000:1012:b0:336:6dd3:bfcf with SMTP id a18-20020a056000101200b003366dd3bfcfmr3242259wrx.121.1706015179841;
        Tue, 23 Jan 2024 05:06:19 -0800 (PST)
Received: from ?IPV6:2003:cb:c741:de00:bf0f:cd46:dc1c:2de9? (p200300cbc741de00bf0fcd46dc1c2de9.dip0.t-ipconnect.de. [2003:cb:c741:de00:bf0f:cd46:dc1c:2de9])
        by smtp.gmail.com with ESMTPSA id e7-20020a5d4e87000000b00337d56264d4sm13371802wru.8.2024.01.23.05.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 05:06:19 -0800 (PST)
Message-ID: <76740e33-9b52-4e23-b407-8ae38bac15ec@redhat.com>
Date: Tue, 23 Jan 2024 14:06:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/11] mm/memory: ignore dirty/accessed/soft-dirty bits
 in folio_pte_batch()
To: Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-11-david@redhat.com>
 <59592b50-fe89-4b32-8490-2e6c296f972f@arm.com>
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
In-Reply-To: <59592b50-fe89-4b32-8490-2e6c296f972f@arm.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23.01.24 13:25, Ryan Roberts wrote:
> On 22/01/2024 19:41, David Hildenbrand wrote:
>> Let's ignore these bits: they are irrelevant for fork, and will likely
>> be irrelevant for upcoming users such as page unmapping.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   mm/memory.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index f563aec85b2a8..341b2be845b6e 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -953,24 +953,30 @@ static __always_inline void __copy_present_ptes(struct vm_area_struct *dst_vma,
>>   	set_ptes(dst_vma->vm_mm, addr, dst_pte, pte, nr);
>>   }
>>   
>> +static inline pte_t __pte_batch_clear_ignored(pte_t pte)
>> +{
>> +	return pte_clear_soft_dirty(pte_mkclean(pte_mkold(pte)));
>> +}
>> +
>>   /*
>>    * Detect a PTE batch: consecutive (present) PTEs that map consecutive
>>    * pages of the same folio.
>>    *
>>    * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN.
> 
> nit: last char should be a comma (,) not a full stop (.)
> 
>> + * the accessed bit, dirty bit and soft-dirty bit.
>>    */
>>   static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
>>   		pte_t *start_ptep, pte_t pte, int max_nr)
>>   {
>>   	unsigned long folio_end_pfn = folio_pfn(folio) + folio_nr_pages(folio);
>>   	const pte_t *end_ptep = start_ptep + max_nr;
>> -	pte_t expected_pte = pte_next_pfn(pte);
>> +	pte_t expected_pte = __pte_batch_clear_ignored(pte_next_pfn(pte));
>>   	pte_t *ptep = start_ptep + 1;
>>   
>>   	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
>>   
>>   	while (ptep != end_ptep) {
>> -		pte = ptep_get(ptep);
>> +		pte = __pte_batch_clear_ignored(ptep_get(ptep));
>>   
>>   		if (!pte_same(pte, expected_pte))
>>   			break;
> 
> I think you'll lose dirty information in the child for private mappings? If the
> first pte in a batch is clean, but a subsequent page is dirty, you will end up
> setting all the pages in the batch as clean in the child. Previous behavior
> would preserve dirty bit for private mappings.
> 
> In my version (v3) that did arbitrary batching, I had some fun and games
> tracking dirty, write and uffd_wp:
> https://lore.kernel.org/linux-arm-kernel/20231204105440.61448-2-ryan.roberts@arm.com/
> 
> Also, I think you will currently either set soft dirty on all or none of the
> pages in the batch, depending on the value of the first. I previously convinced
> myself that the state was unimportant so always cleared it in the child to
> provide consistency.

Good points regarding dirty and soft-dirty. I wanted to avoid passing 
flags to folio_pte_batch(), but maybe that's just what we need to not 
change behavior.

-- 
Cheers,

David / dhildenb

