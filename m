Return-Path: <linuxppc-dev+bounces-542-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA5895F510
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 17:29:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsvjc2HY4z2yGL;
	Tue, 27 Aug 2024 01:29:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724686164;
	cv=none; b=OwKx+7m/DkdIsk34hwuWlWjm175e5e88Dj2IMdj/9fZeEZBnn463rsNTvVdzuKk4L1wDAUB6nSl5vl8l5puDRr/MqmYuTmWoaJOvakQ6dOfa6w1Faq0kaoftpAbRccugftOwyztRSAVC15sqoaoFgjF7/WBANyg4W6d9p0/lWAVXurq0lK2yoU1aGVxNExhjwpsWUp80wJFlRIlgR4ceOdOvJcfmZgfNeefGn92jYqv6MPU7nHa6r91ULx56mLWRaUFOLTn6LQJKfHz/mSxj8sdHaTcnsYJLV+VhYtqLvrm7bDc58iPxrgWPpH+D7T/rIuqD+FqVQ71K9gCT47twhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724686164; c=relaxed/relaxed;
	bh=3yeyrur9JchRS4G+E40jDxueZEFy5Y+L0lctOP/TD28=;
	h=DKIM-Signature:DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:X-Google-Smtp-Source:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Autocrypt:Organization:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-Originator:Content-Language:Content-Type:
	 Content-Transfer-Encoding; b=a8/ns9qc2DtD0lMNveWwg0drcsPHgAfHW1MEHeNyn03R9RISinF3ACxpjMg1zsh6FXpjUSHbp74rBWr3oGPFTT5FLMjz2f5sbHZ8hnc4ezrMuY1bUtdwnXZ0nFfE3xcuKaARjwlXuX57KWVxjsIoX3FVZVwaQ3RgXRdlZkNtkw5l4ZUKLqdrqbzkbW+ZLHHWwvIGzln2TLPeXb8Had7Yr8wuKwXryk1ADLVLD89Dk5iDGwekLQTZXbFILrQ1JwfB+EdvrzXjUvpQnOsebmEzx97SsT+/bMjTq0zf9JFzswNjJSVtrcVeieKSd+mdx0ZJZVNenA/gGhIoUU8k2Ra28Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T6uNE0H2; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T6uNE0H2; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T6uNE0H2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T6uNE0H2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsvjb5q3Gz2y7M
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 01:29:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724686160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3yeyrur9JchRS4G+E40jDxueZEFy5Y+L0lctOP/TD28=;
	b=T6uNE0H2b73nUt+9mquqlvkTBEcTvp2yUThG2CFOkmpNTv4BXyVAE6gkpCOUWFJKqsW0Kf
	GySUTHll+qmx3eeJWconIr2GUwMpchux7RHf/aUGyDGpMZFK/0S2f6fy4HDxU7Ibtm8n2U
	HWkAManNw8dK3z/ZmjxeL9avIPfFgjQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724686160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3yeyrur9JchRS4G+E40jDxueZEFy5Y+L0lctOP/TD28=;
	b=T6uNE0H2b73nUt+9mquqlvkTBEcTvp2yUThG2CFOkmpNTv4BXyVAE6gkpCOUWFJKqsW0Kf
	GySUTHll+qmx3eeJWconIr2GUwMpchux7RHf/aUGyDGpMZFK/0S2f6fy4HDxU7Ibtm8n2U
	HWkAManNw8dK3z/ZmjxeL9avIPfFgjQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-sIerJX8TMpGu2EoPc6gj2Q-1; Mon, 26 Aug 2024 11:29:18 -0400
X-MC-Unique: sIerJX8TMpGu2EoPc6gj2Q-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4280b119a74so38051905e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 08:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724686158; x=1725290958;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3yeyrur9JchRS4G+E40jDxueZEFy5Y+L0lctOP/TD28=;
        b=nMTCbAtvQlK7lZYCfMgHCR7olbjtumiMMJkjlx/KLmpRqZIkot11z0dY1TdPVqUW0g
         dHO51wDnvkNL3ocm6/2U/PUv2iR81KXymbvLR/oCh4HP4wDCiMBIv2dNnBZ2gYwomT8A
         qMBmZPJM0M9CpBwpN256kWvjk6kHR2SMbE4flOzECu/3gi5+9PvSwDyeBDtefVhBRhaR
         Hd0ArTiIGWT7C36HrBaKJpCM19Yvtuho1Mf5Loc3nzbKgSG2NLf+tXt1gWrOMbxGHubS
         gEILJrCTYmAauAAEfKxHC7n9RSaj7Pp/Jb6yyNkiKPX6R2g+dxUGvR9GKUR934Umj5ol
         GZrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSvw1Ti68Q9shJGkDa35zzK2rLsfLzyqjtpkZixQoLUU6zu8jYiRhBH0r2vG09+lwTmV3Zms8pLpj1Fnw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxbMgyCyhAyfLpuFPp+t1yBT8+Xpjbd+wpsoPTmoeA3t7GWK5aR
	lduDHjeg8k803GaSbtE6kzZoTjV1jMFdRIn7t505kDIXxjL7c0lNYtyZseH77DLr4D2OURWd45I
	ltzN5agQ909+KrzJnipipdkSpX3xTfidWswXCW7yL1KLn/qiccAPSrk5kyAtKDsI=
X-Received: by 2002:a05:600c:5008:b0:426:6326:4cec with SMTP id 5b1f17b1804b1-42acd5d9eb4mr79002655e9.29.1724686157679;
        Mon, 26 Aug 2024 08:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTKCP0p2qioREnhkg5F6czIUKGVk/jVDXVVBB+cR6pmwpQ5yr8ooT3Ysi1Ih5xbzSoM5g55w==
X-Received: by 2002:a05:600c:5008:b0:426:6326:4cec with SMTP id 5b1f17b1804b1-42acd5d9eb4mr79002145e9.29.1724686156681;
        Mon, 26 Aug 2024 08:29:16 -0700 (PDT)
Received: from ?IPV6:2003:cb:c737:1900:16b0:8dc:77e:31af? (p200300cbc737190016b008dc077e31af.dip0.t-ipconnect.de. [2003:cb:c737:1900:16b0:8dc:77e:31af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abef81a5esm192721155e9.28.2024.08.26.08.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 08:29:15 -0700 (PDT)
Message-ID: <2f7ce228-0b7d-4b59-82b0-5d14e884bba5@redhat.com>
Date: Mon, 26 Aug 2024 17:29:14 +0200
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
Subject: Re: [PATCH v2 04/14] mm: filemap: filemap_fault_recheck_pte_none()
 use pte_offset_map_ro_nolock()
To: Qi Zheng <zhengqi.arch@bytedance.com>, hughd@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com, christophe.leroy2@cs-soprasteria.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <d5d4744c87c759a53b5e115a0d59326232696f61.1724310149.git.zhengqi.arch@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <d5d4744c87c759a53b5e115a0d59326232696f61.1724310149.git.zhengqi.arch@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.08.24 09:13, Qi Zheng wrote:
> In filemap_fault_recheck_pte_none(), we just do pte_none() check, so
> convert it to using pte_offset_map_ro_nolock().
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>   mm/filemap.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 0f13126b43b08..c98da9af6b9bd 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3234,8 +3234,8 @@ static vm_fault_t filemap_fault_recheck_pte_none(struct vm_fault *vmf)
>   	if (!(vmf->flags & FAULT_FLAG_ORIG_PTE_VALID))
>   		return 0;
>   
> -	ptep = pte_offset_map_nolock(vma->vm_mm, vmf->pmd, vmf->address,
> -				     &vmf->ptl);
> +	ptep = pte_offset_map_ro_nolock(vma->vm_mm, vmf->pmd, vmf->address,
> +					&vmf->ptl);
>   	if (unlikely(!ptep))
>   		return VM_FAULT_NOPAGE;
>   

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


