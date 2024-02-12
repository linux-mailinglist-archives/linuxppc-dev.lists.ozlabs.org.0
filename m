Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C8D8516E8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 15:20:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NtgigO3U;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NtgigO3U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYRS43FLhz3dVW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 01:20:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NtgigO3U;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NtgigO3U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYRRG5fZSz3c2C
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 01:19:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707747559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KdQyq15dmu/vW742NSYA7eol+qHrc++m5aFpTBakKcc=;
	b=NtgigO3URYfpYO+aT8yboDoyKVDqhk+rGQKp1UUmkv6h0BueUkAYl5fJMSPJbC3RiS7Ftr
	5g0vd2/NMGQ6lbyJRwQp5O7ZbDw0ODYCKHThZsK0riSnPVumxFn/tl15g2c4pwO2w12Zux
	XhiJ+RIBRVq+rJcfPft4NFRZpu9xSl4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707747559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KdQyq15dmu/vW742NSYA7eol+qHrc++m5aFpTBakKcc=;
	b=NtgigO3URYfpYO+aT8yboDoyKVDqhk+rGQKp1UUmkv6h0BueUkAYl5fJMSPJbC3RiS7Ftr
	5g0vd2/NMGQ6lbyJRwQp5O7ZbDw0ODYCKHThZsK0riSnPVumxFn/tl15g2c4pwO2w12Zux
	XhiJ+RIBRVq+rJcfPft4NFRZpu9xSl4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-KoyM-bnANtW3xLLFGtm5qA-1; Mon, 12 Feb 2024 09:19:17 -0500
X-MC-Unique: KoyM-bnANtW3xLLFGtm5qA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-40e53200380so20779085e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 06:19:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707747556; x=1708352356;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdQyq15dmu/vW742NSYA7eol+qHrc++m5aFpTBakKcc=;
        b=SP1sLnNt4y2xkRs03GuuONDeSaoPHB50gSZG7C5xxKN30STMTR2D4n/hOWIstEyTwk
         zUG/WPPGSSM/tDN+NKBihFitMyCrxpDkrwJTnNMnOFxc0IVq6A/aX7vXnzsKEtAMO6Fy
         TN3tSjstiNa23LM0XlxhStVJdtCu7Rh2kGOSUb1Y3pZk93Mfn0iKuesFlGVtIELTLeRm
         4vLfWCcIoN6j+1kUJRy0e4Lc7LA2QP3S8yXC59frOGSNz4zQ4tpXaKRQHitOO6zIJQ4Z
         4lt75TyXxjB4++ojPmKV/306T/Nga+7IKTwiDyQBIua7WdmHUX/raQaBlbGEupL2M+6g
         t4Og==
X-Gm-Message-State: AOJu0YwFbOV8bkuSiS1bUeKrdNIR2CwcFG3BgWuNA+F+I2ZQVZnk4ekh
	WT/QDDXyOSLO2N8nVSWUYoL5vcvCPPs86ffSEbNlBtSEH0Qr5gWTPlp2fVB8oEpSGa7Sxwz6BMZ
	Z1yZUR4NHhR8Kf7Jn0J16FyPsg38onF/xQcsucVKmh/s7egEtYrX3xJ8ixtMJqZs=
X-Received: by 2002:a5d:69cd:0:b0:33b:4ac7:224c with SMTP id s13-20020a5d69cd000000b0033b4ac7224cmr4637493wrw.13.1707747556144;
        Mon, 12 Feb 2024 06:19:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDVRzBzkFQ83bEbY+lChHQ7exeRhG46Lx2P594IWjJkzAXyhqGvCydJzGmcxdEyNo3ehdTmQ==
X-Received: by 2002:a5d:69cd:0:b0:33b:4ac7:224c with SMTP id s13-20020a5d69cd000000b0033b4ac7224cmr4637479wrw.13.1707747555785;
        Mon, 12 Feb 2024 06:19:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9Trjf3o0USZ05XJLpdaUPsAbut+JeqrWqUdZRtiQDFi17Otuah6pvaV0j01E+tXRzFzghY2xWPwBF1ynjFzshvStCGJzEqOhjMKoUXQXPA3sxOLGXPE6mfQg/QiWEuhw3qNb2qstFvAsdMqsdKO5+5ba60JhcZGEFHEWpk3rPXxxMLlS3clcME2jVLqlmX7mQHfOHQjVg8GCra9eqgp64Nzt3UBwGiKGWkh+nsWqhgJ7PUcOCvg1gdeOWS0/4eI8DoRCdh/XxIgbHzN6jAJX1TKF31TTdYtZRVE7x7w==
Received: from ?IPV6:2003:cb:c730:2200:7229:83b1:524e:283a? (p200300cbc7302200722983b1524e283a.dip0.t-ipconnect.de. [2003:cb:c730:2200:7229:83b1:524e:283a])
        by smtp.gmail.com with ESMTPSA id n14-20020a056000170e00b0033b5b5033b9sm7047109wrc.18.2024.02.12.06.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 06:19:15 -0800 (PST)
Message-ID: <b73948f3-560c-4b5e-b638-6f3055dee758@redhat.com>
Date: Mon, 12 Feb 2024 15:19:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: Move page order check inside
 hugetlb_cma_reserve()
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <20240209054221.1403364-1-anshuman.khandual@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240209054221.1403364-1-anshuman.khandual@arm.com>
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
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09.02.24 06:42, Anshuman Khandual wrote:
> All platforms could benefit from page order check against MAX_PAGE_ORDER
> before allocating a CMA area for gigantic hugetlb pages. Let's move this
> check from individual platforms to generic hugetlb.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This applies on v6.8-rc3
>   
>   arch/arm64/mm/hugetlbpage.c   | 7 -------
>   arch/powerpc/mm/hugetlbpage.c | 4 +---
>   mm/hugetlb.c                  | 7 +++++++
>   3 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 8116ac599f80..6720ec8d50e7 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -45,13 +45,6 @@ void __init arm64_hugetlb_cma_reserve(void)
>   	else
>   		order = CONT_PMD_SHIFT - PAGE_SHIFT;
>   
> -	/*
> -	 * HugeTLB CMA reservation is required for gigantic
> -	 * huge pages which could not be allocated via the
> -	 * page allocator. Just warn if there is any change
> -	 * breaking this assumption.
> -	 */
> -	WARN_ON(order <= MAX_PAGE_ORDER);
>   	hugetlb_cma_reserve(order);
>   }
>   #endif /* CONFIG_CMA */
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> index 0a540b37aab6..16557d008eef 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -614,8 +614,6 @@ void __init gigantic_hugetlb_cma_reserve(void)
>   		 */
>   		order = mmu_psize_to_shift(MMU_PAGE_16G) - PAGE_SHIFT;
>   
> -	if (order) {
> -		VM_WARN_ON(order <= MAX_PAGE_ORDER);
> +	if (order)
>   		hugetlb_cma_reserve(order);
> -	}
>   }
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index cf9c9b2906ea..345b3524df35 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -7699,6 +7699,13 @@ void __init hugetlb_cma_reserve(int order)
>   	bool node_specific_cma_alloc = false;
>   	int nid;
>   
> +	/*
> +	 * HugeTLB CMA reservation is required for gigantic
> +	 * huge pages which could not be allocated via the
> +	 * page allocator. Just warn if there is any change
> +	 * breaking this assumption.
> +	 */
> +	VM_WARN_ON(order <= MAX_PAGE_ORDER);
>   	cma_reserve_called = true;
>   
>   	if (!hugetlb_cma_size)

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

