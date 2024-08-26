Return-Path: <linuxppc-dev+bounces-539-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D34E95F4E1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 17:21:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsvXl71nLz2xwc;
	Tue, 27 Aug 2024 01:21:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724685703;
	cv=none; b=jfkGzq61+xhlHbz+tW157Rgn6aIrea5jZ8haaftZosPNEtAHVi9VsP+lTE99r6SZVwGvQW8mgF6DQYm+W3OwztdiqQlcGqg7SGULLNOEuZiQq2XCE0s9GdLEkyA34Q974bE+c4869iz71Tziygvt4H3qkznaYZr08nnWDBUQR7idpg0/9CuYUrjJBkCc6J2/rvejLl5absdkhyS7qwQHEDLRm1hZ1jgwA0V6fQkK9spRsK2WsJRksX19xwo7Efjz2qFzOPocv6AdZkowwb2GO3cEHfx0Iqi7mXMvTU+XRYihVdi2JQiDfXYrEcKXgEaBkDqU3g3ALb++a1vO+WdumA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724685703; c=relaxed/relaxed;
	bh=xVfhKRaKDm7iJJwFGB1UlcUKzw1fwN0vnWpe4TV7n4c=;
	h=DKIM-Signature:DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:X-Google-Smtp-Source:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Autocrypt:Organization:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-Originator:Content-Language:Content-Type:
	 Content-Transfer-Encoding; b=MPVn23idX6eABWqm0OMOhdSt3elwLCwZ3nR0G1RjPTZD8QTQViLiWEUGz5eiNXeP5Wwr+UEC5auwHEbEYm/wzCQ9fK6Hq2J5U9qVZmKTm0W20MiobaEMVhvIhwK1bJdPPW1ExnQcsd7bTVDtxfTWnFXY6Q8BJsuqe8wiuXcV+TtMrri1nfpSLx6xWL/BkRaYMc9psDi47VeuXapt1x5ywdaW4ujFLKxGwJGFH+wwrYd/ZS8g9sWmZWO/G0XpFwg4UkU3gBEn9+oDnjBcyELwXM6/tWI3P2hsQ3HNzTg2uo6khNhcU25NTuNQsGeTE/gpPSp2NgFyc3K2aXPMRGbIQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OUeVifWh; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OUeVifWh; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OUeVifWh;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OUeVifWh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsvXl3fcwz2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 01:21:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724685699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xVfhKRaKDm7iJJwFGB1UlcUKzw1fwN0vnWpe4TV7n4c=;
	b=OUeVifWhxorJ9KXrDH8ObPCYLCUr6GStC0NibWeZkEqTn1itmawvfAH2cJkMqQ6mWm1ydS
	P7TMGmqNp1PFOpv7v0hjSefa8wXm32FaGhS54AXAu3qRNDE1125P51PSJgytUt+mEv7OQM
	xXI4wdbTSxri5T9VaM/cTYaUNCRlEpc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724685699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xVfhKRaKDm7iJJwFGB1UlcUKzw1fwN0vnWpe4TV7n4c=;
	b=OUeVifWhxorJ9KXrDH8ObPCYLCUr6GStC0NibWeZkEqTn1itmawvfAH2cJkMqQ6mWm1ydS
	P7TMGmqNp1PFOpv7v0hjSefa8wXm32FaGhS54AXAu3qRNDE1125P51PSJgytUt+mEv7OQM
	xXI4wdbTSxri5T9VaM/cTYaUNCRlEpc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-hYL57ELPMU2q2HIe-XdYHg-1; Mon, 26 Aug 2024 11:21:38 -0400
X-MC-Unique: hYL57ELPMU2q2HIe-XdYHg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-371881b6de3so2763250f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 08:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724685697; x=1725290497;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xVfhKRaKDm7iJJwFGB1UlcUKzw1fwN0vnWpe4TV7n4c=;
        b=Ca/yQO1DsqEDC7uJkALer96+HaJKFvT3LBLElHm1vj9oAfX+3P65qL33SFyTsWrx/X
         nphefbZCpb9W/VuhPTUA2H8ooNLz3EamwJ2oDPAAfhV/heK19oE9mm04LIyCMEiC9aBh
         dyBFQf3S9nSV/d1bKVqg1/pzni0pHRVxTQVO232MGAsT1ESVjAqRuffCDdIv0lX2F7X4
         +Ybai6iuDPX/oIjaGSM2y+UfLX1KcSmbJNhgwtWKNaQEXafi8qnrPLw0OAu6HyRFjqZB
         w9AuizbCYJLyKib3AAqH6hGOWaUmAKRD2qeAm/gnLO0RG2Hy13iE+XtgMk65fhbNvgcm
         FOGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGqA4rvX8cJ/W/fmR/0ca6gPIZsjV3+ToBWjfED5Ed2oHFA8xhEaLexdhOelkSUsjfHEXFMtA0MQNNOtM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwUHF/PnlilsWqD/2s7aY82YS/TKersf5zTfkLz3oLxh/3AGuer
	lHXgvsVDjZ2L2xGt8jsdYnFrKvwMWjpT+MI/aa9+mcr6OMpThDxumy3wL9JqUO+unYz6ip/SpsE
	csau+0AGoNDUsi+4KepL7MCde4Ls75fa/tinR5avmZT2K3If1sgs2SjcGCDjHb9c=
X-Received: by 2002:adf:a419:0:b0:371:8a8e:bf34 with SMTP id ffacd0b85a97d-373118fbbe1mr5277983f8f.62.1724685696619;
        Mon, 26 Aug 2024 08:21:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqu679kC3Scr/Ra6Rb2UAlKN2NPsv8B8ucTOfLynfazsHuojuRcC2LVUpZliNcZRCUyAXJew==
X-Received: by 2002:adf:a419:0:b0:371:8a8e:bf34 with SMTP id ffacd0b85a97d-373118fbbe1mr5277934f8f.62.1724685695655;
        Mon, 26 Aug 2024 08:21:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c737:1900:16b0:8dc:77e:31af? (p200300cbc737190016b008dc077e31af.dip0.t-ipconnect.de. [2003:cb:c737:1900:16b0:8dc:77e:31af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730815b7e3sm10986513f8f.53.2024.08.26.08.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 08:21:34 -0700 (PDT)
Message-ID: <f318f65d-4198-481c-98a0-00415664614c@redhat.com>
Date: Mon, 26 Aug 2024 17:21:32 +0200
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
To: Qi Zheng <zhengqi.arch@bytedance.com>, hughd@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com, christophe.leroy2@cs-soprasteria.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <e866151ccd257ca14a9361ba59f8c3086aa76e4f.1724310149.git.zhengqi.arch@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <e866151ccd257ca14a9361ba59f8c3086aa76e4f.1724310149.git.zhengqi.arch@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.08.24 09:13, Qi Zheng wrote:
> Currently, the usage of pte_offset_map_nolock() can be divided into the
> following two cases:
> 
> 1) After acquiring PTL, only read-only operations are performed on the PTE
>     page. In this case, the RCU lock in pte_offset_map_nolock() will ensure
>     that the PTE page will not be freed, and there is no need to worry
>     about whether the pmd entry is modified.

There is also the usage where we don't grab the PTL at all, and only do 
a racy (read-only) lookup.

> 
> 2) After acquiring PTL, the pte or pmd entries may be modified. At this
>     time, we need to ensure that the pmd entry has not been modified
>     concurrently.
> 
> To more clearing distinguish between these two cases, this commit
> introduces two new helper functions to replace pte_offset_map_nolock().
> For 1), just rename it to pte_offset_map_ro_nolock(). For 2), in addition
> to changing the name to pte_offset_map_rw_nolock(), it also outputs the
> pmdval when successful. This can help the caller recheck *pmd once the PTL
> is taken. In some cases, that is, either the mmap_lock for write, or
> pte_same() check on contents, is also enough to ensure that the pmd entry
> is stable. But in order to prevent the interface from being abused, we
> choose to pass in a dummy local variable instead of NULL.
> 
> Subsequent commits will convert pte_offset_map_nolock() into the above
> two functions one by one, and finally completely delete it.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>   Documentation/mm/split_page_table_lock.rst |  7 ++++
>   include/linux/mm.h                         |  5 +++
>   mm/pgtable-generic.c                       | 43 ++++++++++++++++++++++
>   3 files changed, 55 insertions(+)
> 
> diff --git a/Documentation/mm/split_page_table_lock.rst b/Documentation/mm/split_page_table_lock.rst
> index e4f6972eb6c04..08d0e706a32db 100644
> --- a/Documentation/mm/split_page_table_lock.rst
> +++ b/Documentation/mm/split_page_table_lock.rst
> @@ -19,6 +19,13 @@ There are helpers to lock/unlock a table and other accessor functions:
>    - pte_offset_map_nolock()
>   	maps PTE, returns pointer to PTE with pointer to its PTE table
>   	lock (not taken), or returns NULL if no PTE table;

What will happen to pte_offset_map_nolock() after this series? Does it 
still exist or will it become an internal helper?

> + - pte_offset_map_ro_nolock()
> +	maps PTE, returns pointer to PTE with pointer to its PTE table
> +	lock (not taken), or returns NULL if no PTE table;
> + - pte_offset_map_rw_nolock()
> +	maps PTE, returns pointer to PTE with pointer to its PTE table
> +	lock (not taken) and the value of its pmd entry, or returns NULL
> +	if no PTE table;

[...]

> +pte_t *pte_offset_map_rw_nolock(struct mm_struct *mm, pmd_t *pmd,
> +				unsigned long addr, pmd_t *pmdvalp,
> +				spinlock_t **ptlp)
> +{
> +	pmd_t pmdval;
> +	pte_t *pte;
> +
> +	BUG_ON(!pmdvalp);

As raised, no BUG_ON please. VM_WARN_ON_ONCE() is helpful during early 
testing and should catch these kind of things.

If someone thinks not requiring a non-NULL pointer is better, please 
speak up, I'm not married to that idea :)

> +	pte = __pte_offset_map(pmd, addr, &pmdval);
> +	if (likely(pte))
> +		*ptlp = pte_lockptr(mm, &pmdval);
> +	*pmdvalp = pmdval;
> +	return pte;
> +}
> +
>   /*
>    * pte_offset_map_lock(mm, pmd, addr, ptlp), and its internal implementation
>    * __pte_offset_map_lock() below, is usually called with the pmd pointer for
> @@ -356,6 +383,22 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
>    * recheck *pmd once the lock is taken; in practice, no callsite needs that -
>    * either the mmap_lock for write, or pte_same() check on contents, is enough.
>    *
> + * pte_offset_map_ro_nolock(mm, pmd, addr, ptlp), above, is like
> + * pte_offset_map(); but when successful, it also outputs a pointer to the
> + * spinlock in ptlp - as pte_offset_map_lock() does, but in this case without
> + * locking it.  This helps the caller to avoid a later pte_lockptr(mm, *pmd),
> + * which might by that time act on a changed *pmd: pte_offset_map_ro_nolock()
> + * provides the correct spinlock pointer for the page table that it returns.
> + * For readonly case, the caller does not need to recheck *pmd after the lock is
> + * taken, because the RCU lock will ensure that the PTE page will not be freed. > + *
> + * pte_offset_map_rw_nolock(mm, pmd, addr, pmdvalp, ptlp), above, is like
> + * pte_offset_map_ro_nolock(); but when successful, it also outputs the
> + * pdmval. For cases where pte or pmd entries may be modified, that is, maywrite
> + * case, this can help the caller recheck *pmd once the lock is taken. In some
> + * cases, that is, either the mmap_lock for write, or pte_same() check on
> + * contents, is also enough to ensure that the pmd entry is stable.
> + *
>    * Note that free_pgtables(), used after unmapping detached vmas, or when
>    * exiting the whole mm, does not take page table lock before freeing a page
>    * table, and may not use RCU at all: "outsiders" like khugepaged should avoid

In general to me a step into the right direction. Likely the 
documentation could be further clarified in some aspects:

Like that the use of pte_offset_map_ro_nolock() does not allow to easily 
identify if the page table was replaced in the meantime. Even after 
grabbing the PTL, we might be looking either at a page table that is 
still mapped or one that was unmapped and is about to get freed. But for 
R/O access this is usually sufficient AFAIUK.

Or that "RO" / "RW" expresses the intended semantics, not that the 
*kmap* will be RO/RW protected.

-- 
Cheers,

David / dhildenb


