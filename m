Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 495A0839097
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 14:56:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=asDsAfLj;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=asDsAfLj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK7sW00W3z3dK3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 00:55:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=asDsAfLj;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=asDsAfLj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TK7rg4Nz6z3c3l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jan 2024 00:55:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706018112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WbJQ58Ljpuy8Vw/B7ZBTw3hv4ANT/jjJ7tp8ylORPFw=;
	b=asDsAfLjOMmV6XyLHJ3luV+vhSVP37HMPDmgq/625X5Qn/WPzA1lDPwwRuf0GZ1yM5keRp
	tLToJ352mN9Qq9d7qXvn6forUMJ1Q0z0Wem29U4qf7oqLcyrQtzZ8yUddOqgfLnJqZRxmD
	ylQni1S2kuNad4LRO98U9YPqXs7OBUE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706018112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WbJQ58Ljpuy8Vw/B7ZBTw3hv4ANT/jjJ7tp8ylORPFw=;
	b=asDsAfLjOMmV6XyLHJ3luV+vhSVP37HMPDmgq/625X5Qn/WPzA1lDPwwRuf0GZ1yM5keRp
	tLToJ352mN9Qq9d7qXvn6forUMJ1Q0z0Wem29U4qf7oqLcyrQtzZ8yUddOqgfLnJqZRxmD
	ylQni1S2kuNad4LRO98U9YPqXs7OBUE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-gmAGYvXKPhOPHbDY35qFXQ-1; Tue, 23 Jan 2024 08:55:10 -0500
X-MC-Unique: gmAGYvXKPhOPHbDY35qFXQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-337d589ef4dso2964032f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 05:55:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706018110; x=1706622910;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbJQ58Ljpuy8Vw/B7ZBTw3hv4ANT/jjJ7tp8ylORPFw=;
        b=cpe0VKftNshWJZ+AMWEeO+f35kYaiEhCFhDyiqbrRnRDYM59ZOoIMzx7tA9DIpKKMx
         zma0ADlBcshWLmqmQJ5LZWnsQwhpqE7KRXiDhsiGkRNti60QftRplE98D6HyLDrdQmU/
         1HPwzG+ajvH92QVIiMU3lpS/2rw6JJu6fX5KwwBTZVqJRy2f6/EzxtOpMmCkKsNiFMfa
         U5OijeOtuw4l+hQBw3KyatGiYd2q+4lgPLdHGIdcWTJJo7eF7KXVpAcXUlK0oJeG/QTa
         Z1O38S9GiAwjycCdFdA1ioOnrHiSlK8lDbCZvd2bgiHu3G+N6DUs5pxSnc/sFauCjeZP
         8Z/Q==
X-Gm-Message-State: AOJu0YwfFIrRawJwX6Cm9+eD6oQ/ZfhUmylTAp7ZM6vGy5YuM4MEvZNK
	wytCsZ7Fch97xe5S/4gSsJGJn7aL5DQpy5a2VbduDUeE+P8kbw2reyxdydCP20AqpHj+K1G0O0c
	oEJJpDPpXL6OvKZAen3jQFn5fEkX+HRyWqWwDswBeFUujDYO3IGwZzBg7cluwdGg=
X-Received: by 2002:adf:e501:0:b0:337:b53e:6065 with SMTP id j1-20020adfe501000000b00337b53e6065mr3769054wrm.41.1706018109550;
        Tue, 23 Jan 2024 05:55:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0w0V/ld9eCbEjxciaXWhGg6pUEgVKCYMwUZNd7z5oyfWTKYjjYNbrxMD5nf1aExtZi4ADgA==
X-Received: by 2002:adf:e501:0:b0:337:b53e:6065 with SMTP id j1-20020adfe501000000b00337b53e6065mr3769019wrm.41.1706018109107;
        Tue, 23 Jan 2024 05:55:09 -0800 (PST)
Received: from ?IPV6:2003:cb:c741:de00:bf0f:cd46:dc1c:2de9? (p200300cbc741de00bf0fcd46dc1c2de9.dip0.t-ipconnect.de. [2003:cb:c741:de00:bf0f:cd46:dc1c:2de9])
        by smtp.gmail.com with ESMTPSA id l11-20020a5d674b000000b003392c727cadsm7565717wrw.27.2024.01.23.05.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 05:55:08 -0800 (PST)
Message-ID: <c92c2460-c66a-46c7-b84f-0732965dcf73@redhat.com>
Date: Tue, 23 Jan 2024 14:55:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/11] mm/memory: ignore dirty/accessed/soft-dirty bits
 in folio_pte_batch()
To: Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-11-david@redhat.com>
 <59592b50-fe89-4b32-8490-2e6c296f972f@arm.com>
 <76740e33-9b52-4e23-b407-8ae38bac15ec@redhat.com>
 <94d33a07-c59a-4315-9c64-8b4d959ca1f4@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <94d33a07-c59a-4315-9c64-8b4d959ca1f4@arm.com>
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

On 23.01.24 14:42, Ryan Roberts wrote:
> On 23/01/2024 13:06, David Hildenbrand wrote:
>> On 23.01.24 13:25, Ryan Roberts wrote:
>>> On 22/01/2024 19:41, David Hildenbrand wrote:
>>>> Let's ignore these bits: they are irrelevant for fork, and will likely
>>>> be irrelevant for upcoming users such as page unmapping.
>>>>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>>    mm/memory.c | 10 ++++++++--
>>>>    1 file changed, 8 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/mm/memory.c b/mm/memory.c
>>>> index f563aec85b2a8..341b2be845b6e 100644
>>>> --- a/mm/memory.c
>>>> +++ b/mm/memory.c
>>>> @@ -953,24 +953,30 @@ static __always_inline void __copy_present_ptes(struct
>>>> vm_area_struct *dst_vma,
>>>>        set_ptes(dst_vma->vm_mm, addr, dst_pte, pte, nr);
>>>>    }
>>>>    +static inline pte_t __pte_batch_clear_ignored(pte_t pte)
>>>> +{
>>>> +    return pte_clear_soft_dirty(pte_mkclean(pte_mkold(pte)));
>>>> +}
>>>> +
>>>>    /*
>>>>     * Detect a PTE batch: consecutive (present) PTEs that map consecutive
>>>>     * pages of the same folio.
>>>>     *
>>>>     * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN.
>>>
>>> nit: last char should be a comma (,) not a full stop (.)
>>>
>>>> + * the accessed bit, dirty bit and soft-dirty bit.
>>>>     */
>>>>    static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
>>>>            pte_t *start_ptep, pte_t pte, int max_nr)
>>>>    {
>>>>        unsigned long folio_end_pfn = folio_pfn(folio) + folio_nr_pages(folio);
>>>>        const pte_t *end_ptep = start_ptep + max_nr;
>>>> -    pte_t expected_pte = pte_next_pfn(pte);
>>>> +    pte_t expected_pte = __pte_batch_clear_ignored(pte_next_pfn(pte));
>>>>        pte_t *ptep = start_ptep + 1;
>>>>          VM_WARN_ON_FOLIO(!pte_present(pte), folio);
>>>>          while (ptep != end_ptep) {
>>>> -        pte = ptep_get(ptep);
>>>> +        pte = __pte_batch_clear_ignored(ptep_get(ptep));
>>>>              if (!pte_same(pte, expected_pte))
>>>>                break;
>>>
>>> I think you'll lose dirty information in the child for private mappings? If the
>>> first pte in a batch is clean, but a subsequent page is dirty, you will end up
>>> setting all the pages in the batch as clean in the child. Previous behavior
>>> would preserve dirty bit for private mappings.
>>>
>>> In my version (v3) that did arbitrary batching, I had some fun and games
>>> tracking dirty, write and uffd_wp:
>>> https://lore.kernel.org/linux-arm-kernel/20231204105440.61448-2-ryan.roberts@arm.com/
>>>
>>> Also, I think you will currently either set soft dirty on all or none of the
>>> pages in the batch, depending on the value of the first. I previously convinced
>>> myself that the state was unimportant so always cleared it in the child to
>>> provide consistency.
>>
>> Good points regarding dirty and soft-dirty. I wanted to avoid passing flags to
>> folio_pte_batch(), but maybe that's just what we need to not change behavior.
> 
> I think you could not bother with the enforce_uffd_wp - just always enforce
> uffd-wp. So that's one simplification vs mine. Then you just need an any_dirty

I think I'll just leave uffd-wp alone for now, corner case with 
fork/munmap that can be optimized later on top if really needed.

Regarding soft-dirty (which is set automatically much more often), I can 
certainly ignore the bit if !vma_soft_dirty_enabled(vma) [which is true 
in most of the cases]. So that's easy to handle. But likely, soft-dirty 
for the child is completely unexpressive and should always be cleared. 
Have to double check what the vmflag will be for the child process.

> flag following the same pattern as your any_writable. Then just set dirty on the
> whole batch in the child if any were dirty in the parent.

Regarding dirtying, I'm not 100% sure yet if we should just always dirty 
all ptes if any is dirty, or if we should preserve the state for private 
VMAs for now.

> 
> Although now I'm wondering if there is a race here... What happens if a page in
> the parent becomes dirty after you have checked it but before you write protect
> it? Isn't that already a problem with the current non-batched version? Why do we
> even to preserve dirty in the child for private mappings?

I suspect, because the parent could zap the anon folio. If the folio is 
clean, but the PTE dirty, I suspect that we could lose data of the child 
if we were to evict that clean folio (swapout).

So I assume we simply copy the dirty PTE bit, so the system knows that 
that folio is actually dirty, because one PTE is dirty.

Touching only PTEs avoids having to mess with folio flags.

But that's just pure speculation. E.g., fs/proc/task_mmu.c does some 
slightly different accounting if a PTE is dirty. But usually, it checks 
if either the PTE or the folios is dirty.

I'll have to do some more digging.

-- 
Cheers,

David / dhildenb

