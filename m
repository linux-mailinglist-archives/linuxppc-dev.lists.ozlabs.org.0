Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E2E75FEF9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 20:23:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VN6gcdVe;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VN6gcdVe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8pSt1dnwz2yFK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 04:23:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VN6gcdVe;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VN6gcdVe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8pRz0Lkbz2xq8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 04:22:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690222971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n03DoKf3sne6Lym66VWMSw0yGUv0R8ynhFohiTQxQ/E=;
	b=VN6gcdVeRSvJReW51/L+SZsjNGdXG8lZqWW/VgsxSsUQkmUTpG81gJAqTBtAcp3XpbMkrm
	v9T0ZVwyziGzb/5/X9LWRR4Lm38aFws0yb1JmCfq9E0bF5yP0nEV+s4eY5906UcdU3Q7Ax
	k7mxySxo3XudGZYSbO4FfxPoOTpiuEs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690222971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n03DoKf3sne6Lym66VWMSw0yGUv0R8ynhFohiTQxQ/E=;
	b=VN6gcdVeRSvJReW51/L+SZsjNGdXG8lZqWW/VgsxSsUQkmUTpG81gJAqTBtAcp3XpbMkrm
	v9T0ZVwyziGzb/5/X9LWRR4Lm38aFws0yb1JmCfq9E0bF5yP0nEV+s4eY5906UcdU3Q7Ax
	k7mxySxo3XudGZYSbO4FfxPoOTpiuEs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-h2BmAAdXOqmx-A-qp0-Tpg-1; Mon, 24 Jul 2023 14:22:50 -0400
X-MC-Unique: h2BmAAdXOqmx-A-qp0-Tpg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3fa8f8fb7b3so27554505e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 11:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690222969; x=1690827769;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n03DoKf3sne6Lym66VWMSw0yGUv0R8ynhFohiTQxQ/E=;
        b=h66SrRmJbZ5SA6zaghQzdo9shlt6lmGwsl/dLz3Nk7MgvE8thbdxyTnQoTg01wgn1J
         eT5k2JxNuFLBVmznkQq6oZEg3g7Xf8KB8ue6E0Niin5XdZxJQFhhMw4bCM1K6TyPaw7q
         E70FMkbMS5rRSoruH6Eo4vvCQuLReoYjOS0oQTXv4IBHzOymKFMhgZhwkH7eBoCbQOrF
         /yeottSRMh2Tca4fFhnrLfY9eAFvDuNwgoDuhr8mnZLlKfb0eZDEU0pkuEbnvgtd7ss+
         CP4hcy1zRphUcimw7Fbs8PUuIO1A5+4knLBgKvCXW9dP2NH/Ept63VRP45mBw0WOHw9G
         Ak8g==
X-Gm-Message-State: ABy/qLZJiCzNuMbWKsykqYp87JBXr9TY9KMx5xq5e10PgVGGqZ4xBRXk
	4hozL624zWv3MjRoRkogYzj9UiiBnXLWyMGTknUGcTtmMLDBoLbemFneFtrsUxiE4LwZka8so8h
	GuSp71ukVWKpDJ+UYgdzd2HXZQQ==
X-Received: by 2002:adf:edc2:0:b0:314:101c:42ba with SMTP id v2-20020adfedc2000000b00314101c42bamr9544317wro.54.1690222968762;
        Mon, 24 Jul 2023 11:22:48 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHBo6wFPot3hU8VsBTZbBUYNo4Wx5StOrgAjD+MQ1VrkKQFxD5kOjI5qD9KoV1SdV8ts4sq6w==
X-Received: by 2002:adf:edc2:0:b0:314:101c:42ba with SMTP id v2-20020adfedc2000000b00314101c42bamr9544303wro.54.1690222968378;
        Mon, 24 Jul 2023 11:22:48 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73d:bb00:91a5:d1c:3a7e:4c77? (p200300cbc73dbb0091a50d1c3a7e4c77.dip0.t-ipconnect.de. [2003:cb:c73d:bb00:91a5:d1c:3a7e:4c77])
        by smtp.gmail.com with ESMTPSA id j6-20020adfff86000000b0031274a184d5sm13753059wrr.109.2023.07.24.11.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 11:22:47 -0700 (PDT)
Message-ID: <12e3f722-e6e5-cba4-23c5-546dcf7f6f2b@redhat.com>
Date: Mon, 24 Jul 2023 20:22:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] powerpc/mm/altmap: Fix altmap boundary check
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu
References: <20230724181320.471386-1-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230724181320.471386-1-aneesh.kumar@linux.ibm.com>
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
Cc: Dan Williams <dan.j.williams@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24.07.23 20:13, Aneesh Kumar K.V wrote:
> altmap->free includes the entire free space from which altmap blocks
> can be allocated. So when checking whether the kernel is doing altmap
> block free, compute the boundary correctly.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Fixes: 9ef34630a461 ("powerpc/mm: Fallback to RAM if the altmap is unusable")
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   arch/powerpc/mm/init_64.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
> index fe1b83020e0d..0ec5b45b1e86 100644
> --- a/arch/powerpc/mm/init_64.c
> +++ b/arch/powerpc/mm/init_64.c
> @@ -314,8 +314,7 @@ void __ref vmemmap_free(unsigned long start, unsigned long end,
>   	start = ALIGN_DOWN(start, page_size);
>   	if (altmap) {
>   		alt_start = altmap->base_pfn;
> -		alt_end = altmap->base_pfn + altmap->reserve +
> -			  altmap->free + altmap->alloc + altmap->align;
> +		alt_end = altmap->base_pfn + altmap->reserve + altmap->free;


Right, align is treated like allocated and align+alloc cannot exceed free.

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

