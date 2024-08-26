Return-Path: <linuxppc-dev+bounces-543-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F8095F535
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 17:33:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsvpY0y0Dz2yN1;
	Tue, 27 Aug 2024 01:33:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724686421;
	cv=none; b=UZyRIrhXk/T54ysGpvJcbf20fbFJPWEeROu84HZcMkfCzFojSLExoG+EFdPIJ0CzfvUQ1xcJa/DPpCAqy24lnYKaLi+Gic4zzYYplBshEqHfc/qhPhmMwCp9u2mLDT1XGw90KvfSTC4PdCgh+ITfanmOvWJb7291nEVjmJazrcvzd4rA6X895YjohBgzdYlKEtw2wEjVk74ISCOYdf0dMQgS9mYsfRB01FC/HP9+novlvtaGz7yUMtbV5feAS5rouV2SGqXe44oSOCwtiMPWh9rk1+nO069EXHLXJAEQtXT4Qw/je4LSX7wkVsMgIDvhj/IUpIEifOXVeME2j2vd4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724686421; c=relaxed/relaxed;
	bh=fLHVmwuLAYPsFURDKjEb+NeYe5prtzLVT02SsD4UDUM=;
	h=DKIM-Signature:DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:X-Google-Smtp-Source:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Autocrypt:Organization:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-Originator:Content-Language:Content-Type:
	 Content-Transfer-Encoding; b=bFrHuaGCyV6VQIl5s//n5TDubMB8p0Pw42Vs+DgzGgXgPSjqkURHHmUU6LwO5J4s2aBazAjjOXFoo5H5R4RnytBO46lwDzixj9B5eRqj9nFMSfzACOgrsn1jndAfAUiVVGCkjgNd3zQFnc+g19LKxmmNpx15FaZTRKKxem/ZOfcoyJDRWajlDcbqyY1ucPDGxvO+1RJkNvexTzpObVwImlzwH9VAG6Lzxo0GSF0jifjnxrRVdtPx2V5W5Zw6YAixGqXEgchQjuajgTO80JKWdkHeO5oQwNpPLk7rb7VFAqL/kpOdngTL7KY8BbYYQpULL08L9NPNMZn7R3rHqgLoVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iIpaVVW1; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cH1i0d7V; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iIpaVVW1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cH1i0d7V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsvpX4ZsRz2yGY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 01:33:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724686416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fLHVmwuLAYPsFURDKjEb+NeYe5prtzLVT02SsD4UDUM=;
	b=iIpaVVW1QoRRejYaoGzUEmMFv+1wSzE3S3nVR1EqrNm2vEIN40y+ohu7IzvP5AM1i8Nv/Z
	NYs3Ao0FqgaGBhxAb7DT/g/owddF8V/XO5kYMWP9m2ruurcMewwO3VjV8m3/CFkT946psX
	yBRJz2rbW0GwWhRcDVlxYG2hb1mAVF8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724686417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fLHVmwuLAYPsFURDKjEb+NeYe5prtzLVT02SsD4UDUM=;
	b=cH1i0d7Vsl6ePGvGVramWTlG0rCHcS6RwPDv+MOceklieeAk/2zP95EzqtHTLTUweDaJrY
	2Ek/5jKvVQ8zueGx1AFSkRuaCYjKocL06AVGfhxP03hZQ/+j6P78/La6q1/kpiDoe2tWOF
	6wWypMrwQk8pp2i3Hluy9YI1kzH7MYo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-m-oe7nTeOSOOeIStcntCBw-1; Mon, 26 Aug 2024 11:33:36 -0400
X-MC-Unique: m-oe7nTeOSOOeIStcntCBw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-371afcaab22so2946911f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 08:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724686415; x=1725291215;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fLHVmwuLAYPsFURDKjEb+NeYe5prtzLVT02SsD4UDUM=;
        b=Yzw5bZneifCxGlkf1NLZEr1v9qn0ZgnDOVYo0Y+1GRCXr5a32RVoOifJ5h3674Vauu
         NKm9mqNVP9IMe6djRCZUPabG7lpjEPbKivVX6BTulPHSf1e13ev0z1xNMbBTdF/FvxdU
         6ki8ayKYTgWQG/Lk+GcKnSYqxIgR7hlyA+nCGqK5toLVBZuPkAOTvoW3aCWk3s1EnbpS
         0R+UHMd5UxJKGZwgmCBtk3WLQrLV2ibWQNQbzHoEUZ19M7mnESwBrozGVsPGDQQXoorR
         so/j8suK4kymPAzNg8zDldnJXgYNd8CrSkjKIuzkPaJsGJDasty1aQIwYRK5HPiP5U8B
         mPpA==
X-Forwarded-Encrypted: i=1; AJvYcCV1ellCAQnhkxoixDQdb//QPI0sLzftsSozluElrkTtqNTyp0ITbsJMGkKcg8l2vDtdqYLj8MdbpmoTxAo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwIQPjJd8HpyZZMAS7TsFYuUTImn5x6QT9LxVX2fv4fZT0YLIW5
	8/KxYbpV+L1kbN0IuN3Iwr3JZXI+FitDwd3ItedYuGV75Pun11N1KEgo5n2EZfyCNx3UHKT9M4S
	wY3IgrCHbJal7geX/xkhZN1JweIus5I8cW8huCaxB1YTCSnlV0rsEz/wUKjAsCWsvjcJOQUUj0w
	==
X-Received: by 2002:a5d:58fb:0:b0:371:7dda:d7d9 with SMTP id ffacd0b85a97d-373118400c7mr7060076f8f.9.1724686414513;
        Mon, 26 Aug 2024 08:33:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHytmu9SRRnL82xMRuRcaexgdIVoLY9mV2pWJmUW8w6VZNMmeRxH8CESB56unxuK81kkNwCqA==
X-Received: by 2002:a5d:58fb:0:b0:371:7dda:d7d9 with SMTP id ffacd0b85a97d-373118400c7mr7060032f8f.9.1724686413712;
        Mon, 26 Aug 2024 08:33:33 -0700 (PDT)
Received: from [192.168.3.141] (p4ff23ced.dip0.t-ipconnect.de. [79.242.60.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308110436sm11025885f8f.11.2024.08.26.08.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 08:33:33 -0700 (PDT)
Message-ID: <0b7ca0c2-7a64-4d0e-aa18-2fc4257c199e@redhat.com>
Date: Mon, 26 Aug 2024 17:33:23 +0200
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
Subject: Re: [PATCH v2 05/14] mm: khugepaged: __collapse_huge_page_swapin()
 use pte_offset_map_ro_nolock()
To: Qi Zheng <zhengqi.arch@bytedance.com>, hughd@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com, christophe.leroy2@cs-soprasteria.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <2b7dceaa12da273c6decf92e3bf2ebc4f4e85ec5.1724310149.git.zhengqi.arch@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <2b7dceaa12da273c6decf92e3bf2ebc4f4e85ec5.1724310149.git.zhengqi.arch@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.08.24 09:13, Qi Zheng wrote:
> In __collapse_huge_page_swapin(), we just use the ptl for pte_same() check
> in do_swap_page(). In other places, we directly use pte_offset_map_lock(),
> so convert it to using pte_offset_map_ro_nolock().
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>   mm/khugepaged.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 4a83c40d90538..53bfa7f4b7f82 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1011,7 +1011,11 @@ static int __collapse_huge_page_swapin(struct mm_struct *mm,
>   		};
>   
>   		if (!pte++) {
> -			pte = pte_offset_map_nolock(mm, pmd, address, &ptl);
> +			/*
> +			 * Here the ptl is only used to check pte_same() in
> +			 * do_swap_page(), so readonly version is enough.
> +			 */
> +			pte = pte_offset_map_ro_nolock(mm, pmd, address, &ptl);
>   			if (!pte) {
>   				mmap_read_unlock(mm);
>   				result = SCAN_PMD_NULL;

Suboptimal that the pteval comparison + unmap is buried in 
do_swap_page(). Moving that to the caller is also not significantly 
better ...

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


