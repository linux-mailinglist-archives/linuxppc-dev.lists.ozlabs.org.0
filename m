Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 515F4838E64
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 13:20:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ETZtzkPd;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ETZtzkPd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK5lJ0q8xz3vhq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 23:20:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ETZtzkPd;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ETZtzkPd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TK5kT0kr3z3bhr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 23:19:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706012380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=X/GElDPRN0NBVzcYw+fvqfvfgtwx2bhjdwkQ5wKWbFM=;
	b=ETZtzkPd2D3FgUbhZdgswhu2pnC/gD2mVA5NSaQSisYPPLJcspW7d2wC+t5zJaSZKgaC6M
	+pSH05WewvnNFUgX+pPfEOPgUBOswY20qZPu+/RRObziEW7OG9/Znv2PWOF0YMdREwe/vs
	LhUA7oCi5U5NCZdQr5fEFrbh7gvbB+8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706012380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=X/GElDPRN0NBVzcYw+fvqfvfgtwx2bhjdwkQ5wKWbFM=;
	b=ETZtzkPd2D3FgUbhZdgswhu2pnC/gD2mVA5NSaQSisYPPLJcspW7d2wC+t5zJaSZKgaC6M
	+pSH05WewvnNFUgX+pPfEOPgUBOswY20qZPu+/RRObziEW7OG9/Znv2PWOF0YMdREwe/vs
	LhUA7oCi5U5NCZdQr5fEFrbh7gvbB+8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-zkxPsW5wPQSgCOJoDDtFfA-1; Tue, 23 Jan 2024 07:19:38 -0500
X-MC-Unique: zkxPsW5wPQSgCOJoDDtFfA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-40e89a9a76fso32296745e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 04:19:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706012377; x=1706617177;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/GElDPRN0NBVzcYw+fvqfvfgtwx2bhjdwkQ5wKWbFM=;
        b=QBxz++XBoPepY+KYDDSSOUHSpHRL9zJBar72xLMDECGxdJyPpJK5W3nDzMD4lHnTe4
         Wqb/Q+5SCIAaHSZWmtAUV9AA7iGJafJS40tZEA6ICf97WR1cXYQqSXG/3ApA2JwH68ro
         GPUc0z+lZ45gwGAota5H9pp4byAYgLzUJVdlU7ZqhfAzP0nstklV84QFdUsAShMlL7C3
         M4oQ2PworJ3RtVBBPxqYch/SjqpUUpmZzwocZ9UI2vkp7TXxw9YXPwWfp99PfQOuS2MR
         tcF2U3ZGUYTNquJ6Z7Esy9bFiy8oYqzm3/Dop0tMntLwolkQntEN4gyw5UYP8Q+Axx+k
         lIiA==
X-Gm-Message-State: AOJu0YyJrtt6hDIBYMFxnS5AalPohg1aUWCvV7aB/ZcUikmOVIXaNUKS
	AZxePzZm8bjYpxQcsYTX573QiExLPH5wY/OorrLoXMmadoJEht/VO1txhRRJtePIm39bnFPqm5w
	EYt5YD53DcivEYk8FFdlou7VoC0Vhl9h3Ksy2d1WEw+jDmGnyNYCh1eLS9Wkm7Lc=
X-Received: by 2002:a05:600c:2252:b0:40e:6cf9:506e with SMTP id a18-20020a05600c225200b0040e6cf9506emr568000wmm.96.1706012377616;
        Tue, 23 Jan 2024 04:19:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiO1TgrMoQCs5Jr/juHQivfPPHAMW0rIO6fj55v7fOTl2Rf6O3NzPt6TOAltNzV3LQyRp3GA==
X-Received: by 2002:a05:600c:2252:b0:40e:6cf9:506e with SMTP id a18-20020a05600c225200b0040e6cf9506emr567992wmm.96.1706012377224;
        Tue, 23 Jan 2024 04:19:37 -0800 (PST)
Received: from ?IPV6:2003:cb:c741:de00:bf0f:cd46:dc1c:2de9? (p200300cbc741de00bf0fcd46dc1c2de9.dip0.t-ipconnect.de. [2003:cb:c741:de00:bf0f:cd46:dc1c:2de9])
        by smtp.gmail.com with ESMTPSA id s8-20020a05600c45c800b0040e527602c8sm46523956wmo.9.2024.01.23.04.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 04:19:36 -0800 (PST)
Message-ID: <31a0661e-fa69-419c-9936-98bfe168d5a7@redhat.com>
Date: Tue, 23 Jan 2024 13:19:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/11] mm/memory: optimize fork() with PTE-mapped THP
To: Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-10-david@redhat.com>
 <63be0c3c-bf34-4cbb-b47b-7c9be0e65058@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <63be0c3c-bf34-4cbb-b47b-7c9be0e65058@arm.com>
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

[...]

> 
> I wrote some documentation for this (based on Matthew's docs for set_ptes() in
> my version. Perhaps it makes sense to add it here, given this is overridable by
> the arch.
> 
> /**
>   * wrprotect_ptes - Write protect a consecutive set of pages.
>   * @mm: Address space that the pages are mapped into.
>   * @addr: Address of first page to write protect.
>   * @ptep: Page table pointer for the first entry.
>   * @nr: Number of pages to write protect.
>   *
>   * May be overridden by the architecture, else implemented as a loop over
>   * ptep_set_wrprotect().
>   *
>   * Context: The caller holds the page table lock. The PTEs are all in the same
>   * PMD.
>   */
> 

I could have sworn I had a documentation at some point. Let me add some, 
thanks.

[...]

>> +
>> +	/*
>> +	 * If we likely have to copy, just don't bother with batching. Make
>> +	 * sure that the common "small folio" case stays as fast as possible
>> +	 * by keeping the batching logic separate.
>> +	 */
>> +	if (unlikely(!*prealloc && folio_test_large(folio) && max_nr != 1)) {
>> +		nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr);
>> +		if (folio_test_anon(folio)) {
>> +			folio_ref_add(folio, nr);
>> +			if (unlikely(folio_try_dup_anon_rmap_ptes(folio, page,
>> +								  nr, src_vma))) {
> 
> What happens if its not the first page of the batch that fails here? Aren't you
> signalling that you need a prealloc'ed page for the wrong pte? Shouldn't you
> still batch copy all the way up to the failing page first? Perhaps it all comes
> out in the wash and these events are so infrequent that we don't care about the
> lost batching opportunity?

I assume you mean the weird corner case that some folio pages in the 
range have PAE set, others don't -- and the folio maybe pinned.

In that case, we fallback to individual pages, and might have 
preallocated a page although we wouldn't have to preallocate one for 
processing the next page (that doesn't have PAE set).

It should all work, although not optimized to the extreme, and as it's a 
corner case, we don't particularly care. Hopefully, in the future we'll 
only have a single PAE flag per folio.

Or am I missing something?

> 
>> +				folio_ref_sub(folio, nr);
>> +				return -EAGAIN;
>> +			}
>> +			rss[MM_ANONPAGES] += nr;
>> +			VM_WARN_ON_FOLIO(PageAnonExclusive(page), folio);
>> +		} else {
>> +			folio_ref_add(folio, nr);
> 
> Perhaps hoist this out to immediately after folio_pte_batch() since you're
> calling it on both branches?

Makes sense, thanks.

-- 
Cheers,

David / dhildenb

