Return-Path: <linuxppc-dev+bounces-752-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF2A964A13
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 17:31:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wvlcj4jd8z2y6G;
	Fri, 30 Aug 2024 01:31:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724945493;
	cv=none; b=NL4373vGM1l6P+xrdyZzbK2ju55I3t/9pv/BKDkNxSsm0x8ptsD1znPYX2sYCW5KLwzYrQ3ZcQvBJm35AKKOwjMIOIw+vgfwjbcPmxXya5+z7SCLz26wu+3oHOE4HL8clXLzvOC0VyZakIbaZn3fBcwvYwQSbl/wAeyDQP8zpek/NRzcWJRHjInocjrHnGc4h4KV0ujuB0tcDjUNXo2a47DTn5CzvY2/ESkr8hgw3qrIUxUAB9OJRrakAxfa4phgIniz/Hi01IzKOyH26DUI0/Xz7BVDBve5TVmnFiBO5WRO3upB4sFGY+qYVU7Qvf0bS6LEIFE7lLfWItzyOZQpQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724945493; c=relaxed/relaxed;
	bh=epLatErq7RnsoRlJogD/6fJvq1FzT3yYoV4FsbhdLv0=;
	h=DKIM-Signature:DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:X-Google-Smtp-Source:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Autocrypt:Organization:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-Originator:Content-Language:Content-Type:
	 Content-Transfer-Encoding; b=cvsIwl4PtAJDvZWCG1YV+TmBwXCtvZPozBEOr/cpqAtC+qNkt/NAiHUCk3/67dpj259FYPHzRzzuvUG8aQUm/Ve7kRm5EawCPaqMjpU96W/LL6ifUhvOvmnycXR+mqs1tt1XiXh6hRDg0ZlfghSYxDSHkdKM9zpByN2TpLcvEeVLnwH451UHl+eodAmKkX5jQpuYTetkZHH+lvA5FGwnadeD7iKJZ6cjoR/gohxdWQrG0imLOzIsZLfdNCmPeiEjmPeUP4/2svRRswKf94hB0o3Yr3Fl3UY7W6IA7bhcG5Q/QJc1bVtup0DaWEeaMLXj7QOVT8hOwXXV87EUp1W/ew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EI/9Xath; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z4iywDu+; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EI/9Xath;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z4iywDu+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wvlch5xvFz2y1b
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 01:31:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724945486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=epLatErq7RnsoRlJogD/6fJvq1FzT3yYoV4FsbhdLv0=;
	b=EI/9XathdQ2y6HRsKNft9VF4r+jEcPZ5xGI5j2ZXJnInb2IDdhnncrRcDZLjziBZyqwaU0
	B9LLxfXC6MtV31xz3UwZt+iFPYNBjEmn1MyOdrU31HQtHgYpm4VqyLpj0a4jgbUtLzQ3PD
	hj9NUFYZ/NuNqXgJvLIfxMXcAlb4a0c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724945487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=epLatErq7RnsoRlJogD/6fJvq1FzT3yYoV4FsbhdLv0=;
	b=Z4iywDu+6TbpeQyBdwL9os0iSQuBrhPzub2ukkK9SbQnbmeZKcqbe6gXxGNd1TZoPZm4GG
	jrWauA2REfdLwQ5tawCRPxC2FX1wjv82I+K16fUkBMt1AbhiW7ZnDMgihJyOTuJP5P+Efn
	1/TyeRIoYAn/mBBCdK+UTQu3hjaK6VY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-YMTrEhmnNnanR05NLf5rFA-1; Thu, 29 Aug 2024 11:31:25 -0400
X-MC-Unique: YMTrEhmnNnanR05NLf5rFA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-429e937ed39so7900815e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 08:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724945484; x=1725550284;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=epLatErq7RnsoRlJogD/6fJvq1FzT3yYoV4FsbhdLv0=;
        b=cAZjyuN5k59k8ovB5liyjuZKC754NqaB9kd+4/q5UN8jUPF+w43w2M/8nWwB4+MZl8
         lEukE2Bbtn0OtRUSjffARp9xcdNpzhTzJF1BPrlP9tZSgombF8i15bpnU6IH4RQYSLrs
         8QK7VIEvRyPGPVBtN+k7PmARz1ey8ymbA3f6G6fPlWgyMTUyKfZu9Qd5y617lW1EsuOJ
         xB+1Wi5KcZ0ry05shIIylpyiKjEsK6cNXFMRvxuz2bX/C4FPqn+yHyIj1w3GZtaCmpuS
         JKQ5ua5dHgFyGEtm+L2FIWPW6kQBGyfwCIJZ6nhXI64Y5ZxJd7CEkdjL1kPd6Tl9IJkT
         D7CQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4oF1j6GJ2cy121rO4H5SDNLV94S188kIWG7DJyORJt21jzW2W2XOhvltqnR5l6ssqEa5uHDfG+lnIj5w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx/hkhwcQqJmppZ/M41YLxi2Ilv5588DwWm6l4nUXQK9G8z9551
	vaIgiTWKwGn0dhBklSEo5XR5HacPZU/QGaJ66lApmx8iO2aItPWr0U049maT+Go+YhrWia/IrHS
	OTMVKAxuLStF5hQ1S6f35AgZ/3Lc6fjX6AHdxJnjEzUZ7b8n8bJhPTIFPALL9qB8=
X-Received: by 2002:a05:600c:444c:b0:427:ff3b:7a20 with SMTP id 5b1f17b1804b1-42bb27a9c9dmr29478605e9.27.1724945483833;
        Thu, 29 Aug 2024 08:31:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLTK54eVzNoYCNwKYKcvrIneqtTSSQc75cXolHrX6MU5Ak00YY4exkuGLZtDUSz5MhPsg/bA==
X-Received: by 2002:a05:600c:444c:b0:427:ff3b:7a20 with SMTP id 5b1f17b1804b1-42bb27a9c9dmr29477355e9.27.1724945482947;
        Thu, 29 Aug 2024 08:31:22 -0700 (PDT)
Received: from ?IPV6:2003:cb:c711:c600:c1d6:7158:f946:f083? (p200300cbc711c600c1d67158f946f083.dip0.t-ipconnect.de. [2003:cb:c711:c600:c1d6:7158:f946:f083])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749efb37efsm1695666f8f.109.2024.08.29.08.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 08:31:22 -0700 (PDT)
Message-ID: <8cbd44d9-f39b-4ee8-b1c1-ba89c12c0e23@redhat.com>
Date: Thu, 29 Aug 2024 17:31:21 +0200
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
Subject: Re: [PATCH v2 01/14] mm: pgtable: introduce
 pte_offset_map_{ro|rw}_nolock()
To: Qi Zheng <zhengqi.arch@bytedance.com>, muchun.song@linux.dev
Cc: hughd@google.com, willy@infradead.org, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <e866151ccd257ca14a9361ba59f8c3086aa76e4f.1724310149.git.zhengqi.arch@bytedance.com>
 <f318f65d-4198-481c-98a0-00415664614c@redhat.com>
 <4481a0e4-a7a5-4223-a8ab-d1215d7c6352@bytedance.com>
 <42aba316-2b01-4fdb-9aff-9e670aac4c6e@redhat.com>
 <63ef0611-50c2-49b5-ba3f-c6ea81f9fbce@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <63ef0611-50c2-49b5-ba3f-c6ea81f9fbce@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.08.24 12:59, Qi Zheng wrote:
> 
> 
> On 2024/8/28 18:48, David Hildenbrand wrote:
>> On 27.08.24 06:33, Qi Zheng wrote:
> 
> [...]
> 
>>> sufficient AFAIUK.
>>
>> Drop the "AFAIUK" :)
>>
>> "For R/O access this is sufficient."
>>
>>>
>>> pte_offset_map_rw_nolock(mm, pmd, addr, pmdvalp, ptlp), above, is like
>>> pte_offset_map_ro_nolock(); but when successful, it also outputs the
>>> pdmval. For R/W access, the callers can not accept that the page table
>>> it sees has been unmapped and is about to get freed. The pmdval can help
>>> callers to recheck pmd_same() to identify this case once the spinlock is
>>> taken. For some cases where exclusivity is already guaranteed, such as
>>> holding the write lock of mmap_lock, or in cases where checking is
>>> sufficient, such as a !pte_none() pte will be rechecked after the
>>> spinlock is taken, there is no need to recheck pdmval.
>>
>> Right, using pte_same() one can achieve a similar result, assuming that
>> the freed page table gets all ptes set to pte_none().
>>
>> page_table_check_pte_clear_range() before pte_free_defer() in
>> retract_page_tables/collapse_pte_mapped_thp() sanity checks that I think.
> 
> Since commit 1d65b771bc08, retract_page_tables() only holds the
> i_mmap_lock_read(mapping) but not mmap_lock, so it seems that
> holding the write lock of mmap_lock cannot guarantee the stability
> of the PTE page.

Guess it depends. khugepaged on anonymous memory will block any page 
table walkers (like anon THP collapse does) -- per-VMA lock, mmap lock, 
mapping lock/RMAP lock ... so it *should* be sufficient to hold any of 
these, right?

So at least for now, these (anonymous memory) cases would be ok. Likely 
that will change when reclaiming empty page tables.

> 
> IIUC, I will also perform a pmd_same() check on the case where the
> write lock of mmap_lock is held in v3. Or do I miss something?

Can you spell out the instances where you think it might be required.

-- 
Cheers,

David / dhildenb


