Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5458083E23E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 20:12:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hkRALx7D;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fTRllhvt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TM6kz1tyMz3cTF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jan 2024 06:12:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hkRALx7D;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fTRllhvt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TM6kB4LjKz3cLl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jan 2024 06:11:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706296284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4g8K7l28tbM/mldWkR+pvjoSC5Y71b2XjVOt+98pFVU=;
	b=hkRALx7DRadyyFtZYHWweWw1ou80cjuK7z+H0EZFpEo40h7umGQK78zV2fgCv/D5n1XYFf
	AKHNbc2BMlg4I5marHix7kpmhdwpMlhFSCc4B5LWVBIJ13LM/oiQzUlyxokNzmRqtx65aI
	hN/1yxDmTWQcjt/FfTXqVKUVY0K4jE0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706296285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4g8K7l28tbM/mldWkR+pvjoSC5Y71b2XjVOt+98pFVU=;
	b=fTRllhvtAICqKcx7gKVqh60VxgkUCpTqzUBBIfD0/slmZlPcrm64rqDs2rn471+6R8/g6T
	KRm+vYXmKsEtp0QnCPugEyruZ8mi6QtVsgyFqDwtjoTOgQyR5WftutiuvJsmEsSBfUu9Mv
	SO869EZU5qjpATV2snLwW5sskq35N7w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-AKmtCL87MkyS8t3cuSqT2Q-1; Fri, 26 Jan 2024 14:11:22 -0500
X-MC-Unique: AKmtCL87MkyS8t3cuSqT2Q-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-337d2ccaab0so604463f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 11:11:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706296281; x=1706901081;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4g8K7l28tbM/mldWkR+pvjoSC5Y71b2XjVOt+98pFVU=;
        b=EbNl2VUkSGF2NqSfz3yaPjIbbcd1mnCLUZl1vY+TUHghxUI/zTJ4d52WttZeO/jssG
         +z38fIOfl6OnE+8efanVLnOfDFoy+5wJB7K6FPJPdbPaJf7A0YQ4BlWSf3XGhNvJQXwh
         Rcsr9yxsOWy3Y1YVjFHgCOMtkh2XBU5jdjxu4MF+kCQ7QixxZU341Rfn3E/gbqxxcKZU
         EO9JxeETE01Ku89s7IONUS9qyLiDwJUIuLCEpLmDNZ9rYqDcKozN7wp0MKIjIAqQg/Gj
         MyJeIoQ1a1f7RL8VrEqeicunsZjTqPL/f5t6f1jbYQt7VcnYcYpoCQWRJ3rQR0lDXSX8
         MA0Q==
X-Gm-Message-State: AOJu0YxFGBxWxEyU48EI66tqt3ti/T/puXXmG3VNEZtogGi4T5754LtN
	RC8ARSOs80Uo9MUStN2OaChk3RVb1hzR+5aq5rNVprTEp65L/eAxxmAWYQ/KVty6LGewPQnEyJY
	ZMAUKxyuw0lOg3QAGEsasrwvnOz0+vHHTq2SGP+eX9WVECLDE3d37GfKob/MYgiM=
X-Received: by 2002:adf:e34e:0:b0:337:a81a:a92 with SMTP id n14-20020adfe34e000000b00337a81a0a92mr93413wrj.16.1706296281742;
        Fri, 26 Jan 2024 11:11:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2W4KZitVtEWtyaZogLu/njgh6vBkydyWO+lquJ8xT0VP90E3HBBntnlOQm8GtijC18P28qA==
X-Received: by 2002:adf:e34e:0:b0:337:a81a:a92 with SMTP id n14-20020adfe34e000000b00337a81a0a92mr93386wrj.16.1706296281267;
        Fri, 26 Jan 2024 11:11:21 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:5100:7e95:22ff:3f9b:1e92? (p200300cbc70a51007e9522ff3f9b1e92.dip0.t-ipconnect.de. [2003:cb:c70a:5100:7e95:22ff:3f9b:1e92])
        by smtp.gmail.com with ESMTPSA id h5-20020adfe985000000b00337d67a85c1sm1811358wrm.62.2024.01.26.11.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 11:11:20 -0800 (PST)
Message-ID: <5b5b2ceb-9099-4acc-a995-d979ad414c6a@redhat.com>
Date: Fri, 26 Jan 2024 20:11:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] mm/memory: optimize fork() with PTE-mapped THP
To: linux-kernel@vger.kernel.org
References: <20240125193227.444072-1-david@redhat.com>
 <20240125193227.444072-14-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240125193227.444072-14-david@redhat.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 25.01.24 20:32, David Hildenbrand wrote:
> Let's implement PTE batching when consecutive (present) PTEs map
> consecutive pages of the same large folio, and all other PTE bits besides
> the PFNs are equal.
> 
> We will optimize folio_pte_batch() separately, to ignore selected
> PTE bits. This patch is based on work by Ryan Roberts.
> 
> Use __always_inline for __copy_present_ptes() and keep the handling for
> single PTEs completely separate from the multi-PTE case: we really want
> the compiler to optimize for the single-PTE case with small folios, to
> not degrade performance.
> 
> Note that PTE batching will never exceed a single page table and will
> always stay within VMA boundaries.
> 
> Further, processing PTE-mapped THP that maybe pinned and have
> PageAnonExclusive set on at least one subpage should work as expected,
> but there is room for improvement: We will repeatedly (1) detect a PTE
> batch (2) detect that we have to copy a page (3) fall back and allocate a
> single page to copy a single page. For now we won't care as pinned pages
> are a corner case, and we should rather look into maintaining only a
> single PageAnonExclusive bit for large folios.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   include/linux/pgtable.h |  31 +++++++++++
>   mm/memory.c             | 112 +++++++++++++++++++++++++++++++++-------
>   2 files changed, 124 insertions(+), 19 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 351cd9dc7194f..891ed246978a4 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -650,6 +650,37 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addres
>   }
>   #endif
>   
> +#ifndef wrprotect_ptes
> +/**
> + * wrprotect_ptes - Write-protect consecutive pages that are mapped to a
> + *		    contiguous range of addresses.
> + * @mm: Address space to map the pages into.
> + * @addr: Address the first page is mapped at.
> + * @ptep: Page table pointer for the first entry.
> + * @nr: Number of pages to write-protect.
> + *
> + * May be overridden by the architecture; otherwise, implemented as a simple
> + * loop over ptep_set_wrprotect().
> + *
> + * Note that PTE bits in the PTE range besides the PFN can differ. For example,
> + * some PTEs might already be write-protected.
> + *
> + * Context: The caller holds the page table lock.  The pages all belong
> + * to the same folio.  The PTEs are all in the same PMD.
> + */

After writing documentation for another two such functions, I'll change this to:

/**
  * wrprotect_ptes - Write-protect PTEs that map consecutive pages of the same
  *		    folio.
  * @mm: Address space the pages are mapped into.
  * @addr: Address the first page is mapped at.
  * @ptep: Page table pointer for the first entry.
  * @nr: Number of entries to write-protect.
  *
  * May be overridden by the architecture; otherwise, implemented as a simple
  * loop over ptep_set_wrprotect().
  *
  * Note that PTE bits in the PTE range besides the PFN can differ. For example,
  * some PTEs might be write-protected.
  *
  * Context: The caller holds the page table lock.  The PTEs map consecutive
  * pages that belong to the same folio.  The PTEs are all in the same PMD.
  */

-- 
Cheers,

David / dhildenb

