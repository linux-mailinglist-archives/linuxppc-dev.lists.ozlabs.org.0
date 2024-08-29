Return-Path: <linuxppc-dev+bounces-754-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A250E964A2A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 17:36:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wvlk84ZG5z2yMF;
	Fri, 30 Aug 2024 01:36:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724945776;
	cv=none; b=MzDsdT6rgdznWzGFQAVi7k+C2Uue+IrOV8ZZqEk1cUx3yZZu7iZ5PJmD28rpdroQOviHmSpUcRrnVxryuqCbqMU/2CVBtGs5pL2FOwRU3mtLKuAinBkJIK/9nAh9dm5CKgToW3PuJ6g4YBhdQ2g3IEpLcT1maq6ISR2Nh5fTKrqYX6uSTMU0WSTO3qtVhgtiiqX4ZNpCzjGogssRak2h3TQ2KHxI8kOwd/4cOoZONijPUI9jMq4/L4P33d38q8yyUT8kUToym2jopkha+BCOIHP9RrgErOK8MmIc+JjTq6IM0+1x5eOPZUKcPhrYYNn8vn4P8WTliKb3NEiXUQeldA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724945776; c=relaxed/relaxed;
	bh=8zAti2qz+0k1lhYOsLfeFTZua1Zf8/+2sAr4VjTzhJI=;
	h=DKIM-Signature:DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:X-Google-Smtp-Source:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Autocrypt:Organization:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-Originator:Content-Language:Content-Type:
	 Content-Transfer-Encoding; b=bRKRGXhhRBTsn3RDWMd7MZ5y7CtCSU6WnmvGF8Jd5TwU8EJjGufdBcHN68DdHz/bqmKI0AejeEXYfbEcOLIYe+EW9XNt5LDcPjNxbV26mO857EM+YekGMh50LyTYHRwkIMNCRfLyVR6mHjoctnC+d0pOmJlumKqbDMB14tY6Fm+kWe+UEXwlNN5DhMIkLL4DTKDHK2IdJR6xfOQxNSqyHuDu/a6he1+I4VjBjvpnt48zm+keyX3NnTaLFv4dmN5MJUL76vZga5F4qDrLdQpR2MSHUiOr+st7wQtshco1yVCRB74KAsiTjkhzx21Uzf3ZXlQCX3/faSLqctZE48XZIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MVg1RYRs; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Thaq9eff; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MVg1RYRs;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Thaq9eff;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wvlk817njz2yDT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 01:36:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724945772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8zAti2qz+0k1lhYOsLfeFTZua1Zf8/+2sAr4VjTzhJI=;
	b=MVg1RYRsjlugBf331WIWCg8ISAFVT8i/e05WuFqfGerZqFKjsAFnpIpqkyxdTf169PwWW+
	Sjr+lnbAszWoJcoj5GXDEB8govN0PCwKvroakzSdZZ4U0n4WlhY7M/2cjX0fikgqF1KDf8
	pDX/P5HzJEigmvmY81xl0qLlm3/mLPY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724945773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8zAti2qz+0k1lhYOsLfeFTZua1Zf8/+2sAr4VjTzhJI=;
	b=Thaq9effGR22HjT2V+ZA61O0Gva9x073QsM6AU5nO7t5YT1uNBmA6Os/brwQ5WRZnu0USW
	otyp7KtiTeZbEkgUSUi+3jGdb+3zeQRdRoABNW/wNOiPDy+4I7ODBOE5iCzV6aZqB/b8PB
	qMWirMzUaDtNBUwYr++rF8hpnPZDkHk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-RmjdBhYoMBC203L_7z6Jew-1; Thu, 29 Aug 2024 11:36:11 -0400
X-MC-Unique: RmjdBhYoMBC203L_7z6Jew-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a869ee1755fso72287966b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 08:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724945770; x=1725550570;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zAti2qz+0k1lhYOsLfeFTZua1Zf8/+2sAr4VjTzhJI=;
        b=EgdHLrdRSSi1AIz8CBRXK4/9eCf9US7nsSSrSjgULmxH9AydESaMg+clgVQZ75egne
         lnAwwhjUL9pZK1AczEe4UwYk3vx0Kck2VX9W8OOwS1z37LMKSdog7LbG6iDWauk0tJkw
         EEAkZwrVL2HViaKtEnGwDp/dDPKKzq6o8RHRILd5CQsm5UIIsgId7DAtIFukbx3Q8Qpt
         CBcqgwoXn4cal6aYHwC+ah+LAx3MRXAUvBOW4zP3hRyGy/V5AOPtg7DAm+WF9xWtFOch
         biPt4kIBC+7aUQIANHUj8TMIVIjE2Sp0YwCrxUmJdFSUF0V12CkJYqI//DP4je9l2xHD
         xlfg==
X-Forwarded-Encrypted: i=1; AJvYcCXSruJgMug4IVdZ5xrMay+dU4XjCTX0THmZUz2mxtOI5rYNCdJ/phgA3G6YTIvB4HjY6G20I0v9EKpdtKI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxGckoeE96sqEsk/MMRHb6DEDNEuCCDmz8ezupt3EJqDdvz6asK
	P1XqutSYwOdk4TXIknpM8mxXLiaiRdgbNbvRnqMBDGAzBlAOnwk6cs+woOGC1poCWV9s5xQ8V8+
	NvC4FkFegGe46tbuvAmpak7bGTLYSo5EsjJQw08AwSyW9OH1IpCSG3wb9eBgRV2c=
X-Received: by 2002:a17:907:60d0:b0:a86:7514:e649 with SMTP id a640c23a62f3a-a897fa6d0f3mr236855366b.52.1724945770001;
        Thu, 29 Aug 2024 08:36:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRh7kxMKGH3RW+v6veLdn0nUjIMttWSviG3ZApPoC9Y2dx6cYhzNQjZfKXAtz5Tnr/1cUlgg==
X-Received: by 2002:a17:907:60d0:b0:a86:7514:e649 with SMTP id a640c23a62f3a-a897fa6d0f3mr236849066b.52.1724945769083;
        Thu, 29 Aug 2024 08:36:09 -0700 (PDT)
Received: from ?IPV6:2003:cb:c711:c600:c1d6:7158:f946:f083? (p200300cbc711c600c1d67158f946f083.dip0.t-ipconnect.de. [2003:cb:c711:c600:c1d6:7158:f946:f083])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891dacb2sm91262266b.183.2024.08.29.08.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 08:36:08 -0700 (PDT)
Message-ID: <4101a941-6286-4128-a16c-29c7cffcbe8c@redhat.com>
Date: Thu, 29 Aug 2024 17:36:07 +0200
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
Subject: Re: [PATCH v2 08/14] mm: copy_pte_range() use
 pte_offset_map_rw_nolock()
To: Qi Zheng <zhengqi.arch@bytedance.com>, hughd@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com, christophe.leroy2@cs-soprasteria.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <71100c3867c4cf6f5f429ce9f2db8432066d0e99.1724310149.git.zhengqi.arch@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <71100c3867c4cf6f5f429ce9f2db8432066d0e99.1724310149.git.zhengqi.arch@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.08.24 09:13, Qi Zheng wrote:
> In copy_pte_range(), we may modify the src_pte entry after holding the
> src_ptl, so convert it to using pte_offset_map_rw_nolock(). But since we
> already hold the write lock of mmap_lock, there is no need to get pmdval
> to do pmd_same() check, just pass a dummy variable to it.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>   mm/memory.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 7b6071a0e21e2..30d98025b2a40 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1083,6 +1083,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>   	struct mm_struct *src_mm = src_vma->vm_mm;
>   	pte_t *orig_src_pte, *orig_dst_pte;
>   	pte_t *src_pte, *dst_pte;
> +	pmd_t dummy_pmdval;
>   	pte_t ptent;
>   	spinlock_t *src_ptl, *dst_ptl;
>   	int progress, max_nr, ret = 0;
> @@ -1108,7 +1109,15 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>   		ret = -ENOMEM;
>   		goto out;
>   	}
> -	src_pte = pte_offset_map_nolock(src_mm, src_pmd, addr, &src_ptl);
> +
> +	/*
> +	 * Use the maywrite version to indicate that dst_pte will be modified,
> +	 * but since we already hold the write lock of mmap_lock, there is no
> +	 * need to get pmdval to do pmd_same() check, just pass a dummy variable
> +	 * to it.

As we hold the mmap lock write lock, I assume it will prevent any page 
table removal, because they need *at least* the mmap lock in read mode, 
right?

We should probably document the rules for removing a page table -- which 
locks must be held in which mode (if not already done).

-- 
Cheers,

David / dhildenb


