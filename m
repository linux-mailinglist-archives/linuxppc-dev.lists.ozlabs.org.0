Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3A0841DF9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 09:38:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PM9YwMNQ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PM9YwMNQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPJTP5F7Tz3bWQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 19:38:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PM9YwMNQ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PM9YwMNQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPJSd32kMz3bYx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 19:37:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706603838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=U45Fxm/MtG50A3gtC61QWpZLcXQoY54GjgFxR/yi5IE=;
	b=PM9YwMNQhf5dk7vcHL845sgzDtcwU8D5WEhclZwPtprhoXdQpXIdlwI4E4mPA+P4VgBTLD
	eh8s/Odhz8RSiDaPduDZrvDDKe7/MqI2YogJLISSNQgVw5TgPJtoznDGwQ6eHfKf9YTXDe
	BLTdXihfroB85PBSvWwIcaytjGYjMIk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706603838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=U45Fxm/MtG50A3gtC61QWpZLcXQoY54GjgFxR/yi5IE=;
	b=PM9YwMNQhf5dk7vcHL845sgzDtcwU8D5WEhclZwPtprhoXdQpXIdlwI4E4mPA+P4VgBTLD
	eh8s/Odhz8RSiDaPduDZrvDDKe7/MqI2YogJLISSNQgVw5TgPJtoznDGwQ6eHfKf9YTXDe
	BLTdXihfroB85PBSvWwIcaytjGYjMIk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-L87rE4ZnPD23u6eVfpKNQw-1; Tue, 30 Jan 2024 03:37:16 -0500
X-MC-Unique: L87rE4ZnPD23u6eVfpKNQw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-40e40126031so32047105e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 00:37:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706603834; x=1707208634;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U45Fxm/MtG50A3gtC61QWpZLcXQoY54GjgFxR/yi5IE=;
        b=MQTLVNDoxvaqXsMHh5af5UhQ/VXhgpRtJHKZUffmOiDeH/tEcp908pNpo79f0xJopV
         vxAKh4UUu9gDmfTxsY5MTQTFP63wNSvZwbYu276TXMFJkkQdsttBTr+gEDAOvDkMDaRT
         wh5EMCNHGVDPdR7ZH704EsmUnmoDECZ/VcH8hp3xe71WGJZw5A/sERuZWrlmWXDYSB66
         i77lYVngBlbYuzNNj35XcfeYfZE9IwgdlA/Fqm2Klf6woLcAHWPAMH3wNbjR3rdQQhpu
         hjvyrmorsboAf4HulSDgLPTHO5d2BT6t+TyNa5ATWRWPEK7SMeZvtE1YlRqRvpITNs5t
         cKcg==
X-Gm-Message-State: AOJu0YyqJTw3FHj85GV+tQaIyFr4m7OA83jJl+GJbz14bJQPm4EtKJkf
	t7e7J4BVac1w+36F4N44R/larvvrxx+EkbOJBovacUsK4v6R89MUx7sYpGMjQWNYg6o0y3HZZug
	2cpqPoEW0dvHDUUYW8um9ha8E/6cE33TNBImvi8oCLo3zxj6Fq0UaKyrBffbpIKU=
X-Received: by 2002:a05:600c:190f:b0:40e:b93e:4a0f with SMTP id j15-20020a05600c190f00b0040eb93e4a0fmr7482824wmq.19.1706603834527;
        Tue, 30 Jan 2024 00:37:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwkrtXtDO2gDcswLvVnF7XXvZ9DZQ0hnWmecx9yh3ExpmlwLhlL6D50z4cHWyxah3UEzsYlQ==
X-Received: by 2002:a05:600c:190f:b0:40e:b93e:4a0f with SMTP id j15-20020a05600c190f00b0040eb93e4a0fmr7482804wmq.19.1706603834118;
        Tue, 30 Jan 2024 00:37:14 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:2700:bdf6:739b:9f9d:862f? (p200300cbc7082700bdf6739b9f9d862f.dip0.t-ipconnect.de. [2003:cb:c708:2700:bdf6:739b:9f9d:862f])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c350900b0040fa661ee82sm262267wmq.44.2024.01.30.00.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 00:37:13 -0800 (PST)
Message-ID: <c783e71c-2fc0-4752-be6b-7ea316758243@redhat.com>
Date: Tue, 30 Jan 2024 09:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/9] mm/memory: further separate anon and pagecache
 folio handling in zap_present_pte()
To: Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
References: <20240129143221.263763-1-david@redhat.com>
 <20240129143221.263763-4-david@redhat.com>
 <40cfb242-ceb0-44c6-afe7-c1744825dc62@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <40cfb242-ceb0-44c6-afe7-c1744825dc62@arm.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Vasily Gorbik <gor@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Nick Piggin <npiggin@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 30.01.24 09:31, Ryan Roberts wrote:
> On 29/01/2024 14:32, David Hildenbrand wrote:
>> We don't need up-to-date accessed-dirty information for anon folios and can
>> simply work with the ptent we already have. Also, we know the RSS counter
>> we want to update.
>>
>> We can safely move arch_check_zapped_pte() + tlb_remove_tlb_entry() +
>> zap_install_uffd_wp_if_needed() after updating the folio and RSS.
>>
>> While at it, only call zap_install_uffd_wp_if_needed() if there is even
>> any chance that pte_install_uffd_wp_if_needed() would do *something*.
>> That is, just don't bother if uffd-wp does not apply.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   mm/memory.c | 16 +++++++++++-----
>>   1 file changed, 11 insertions(+), 5 deletions(-)
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 69502cdc0a7d..20bc13ab8db2 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -1552,12 +1552,9 @@ static inline void zap_present_pte(struct mmu_gather *tlb,
>>   	folio = page_folio(page);
>>   	if (unlikely(!should_zap_folio(details, folio)))
>>   		return;
>> -	ptent = ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
>> -	arch_check_zapped_pte(vma, ptent);
>> -	tlb_remove_tlb_entry(tlb, pte, addr);
>> -	zap_install_uffd_wp_if_needed(vma, addr, pte, details, ptent);
>>   
>>   	if (!folio_test_anon(folio)) {
>> +		ptent = ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
>>   		if (pte_dirty(ptent)) {
>>   			folio_mark_dirty(folio);
>>   			if (tlb_delay_rmap(tlb)) {
>> @@ -1567,8 +1564,17 @@ static inline void zap_present_pte(struct mmu_gather *tlb,
>>   		}
>>   		if (pte_young(ptent) && likely(vma_has_recency(vma)))
>>   			folio_mark_accessed(folio);
>> +		rss[mm_counter(folio)]--;
>> +	} else {
>> +		/* We don't need up-to-date accessed/dirty bits. */
>> +		ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
>> +		rss[MM_ANONPAGES]--;
>>   	}
>> -	rss[mm_counter(folio)]--;
>> +	arch_check_zapped_pte(vma, ptent);
> 
> Isn't the x86 (only) implementation of this relying on the dirty bit? So doesn't
> that imply you still need get_and_clear for anon? (And in hindsight I think that
> logic would apply to the previous patch too?)

x86 uses the encoding !writable && dirty to indicate special shadow 
stacks. That is, the hw dirty bit is set by software (to create that 
combination), not by hardware.

So you don't have to sync against any hw changes of the hw dirty bit. 
What you had in the original PTE you read is sufficient.

-- 
Cheers,

David / dhildenb

