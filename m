Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9213924BD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 04:14:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrBG93KcZz307g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 12:14:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=VBMpOiLd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=VBMpOiLd; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrBFh3GnRz2xtt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 12:13:56 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 ep16-20020a17090ae650b029015d00f578a8so1453970pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 19:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8DzSXa3BxV37xyZhMXMorYQ7hZGYcdEnPnM/u1LXWyc=;
 b=VBMpOiLduzv1wbyiUP8TSmOiff62EOhy4z+4W87wfkMxg54Tz7Jx//6cgmTJezgzMU
 Es0uZrlhNH5pkg2FuQu5WqpVkQh0GXUxGPQ9D0ohJ8Gs2w1AZdKx5asPHm+uDObw8jgV
 HKMjMH6RZssXyS31e8cXPrDVuMSoBR9JrWUf2BShZhRkMjgT1bpKcFb8YnpN9AF5NtsB
 0HSyexVEhRS6tkCddwzT9tCjvGquWHLY3cjdL/P+7dr0Gly55a8VHX/KsgGQ1wfAJyiq
 fyIF+nneOLewz9uw6ZtsCA7ba+k2wqgeMhEVTOE5tYoB2PxOOGJXPN59YQoLPF9jxXZU
 VUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8DzSXa3BxV37xyZhMXMorYQ7hZGYcdEnPnM/u1LXWyc=;
 b=qL3JlBuEQIswPziGMdCnSofh5X1E0atSiDLDiOFDhqwSwGnvO0o9A4jtxSrPtH/ra0
 rpruAT1GANGVxJWb053PIiJE33RenWmqBKtfcKVeNqtNukNIRM+69T3BIAK1xLLU4o2i
 tpk4J8JDAbrFn0Y7tExHOG7PcQWkyF6oMtfidRIZd+LBYaDBvYhkcK/4WK+r30ejsrqU
 M1u8rPz+nHztQL7e3a9n/y0xd91Pf4q9Q81EiC2kAGUJZzvAcYMFNo3WGgkTgEtwKAMs
 T7AmClziX4Rh3RLmCrwxnWgAl82CjvK/RQ4PEjREBcZ4wX1YTIV3uTHeWvAEHXSy4xox
 G09g==
X-Gm-Message-State: AOAM530WV+PdcxgbiCdzSkRFvcZA/iuT4nkGDjKr2h/4Apj0n2J77zNJ
 Tfkn7AkCBreiBFMA3014Pa4YsQ==
X-Google-Smtp-Source: ABdhPJyNrbM40DH4zBYqIE/+kvgt0lUX/Hs6kovF09NkwApk3CrrNRmS7wibsIVsCv8kDrBX+FacXw==
X-Received: by 2002:a17:90b:14d7:: with SMTP id
 jz23mr1229172pjb.105.1622081634781; 
 Wed, 26 May 2021 19:13:54 -0700 (PDT)
Received: from [192.168.10.23]
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id h13sm410635pfr.216.2021.05.26.19.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 19:13:54 -0700 (PDT)
Message-ID: <82c308d5-7ef4-b756-35dc-eeb029b79601@ozlabs.ru>
Date: Thu, 27 May 2021 12:13:50 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [PATCH] Revert "powerpc/kernel/iommu: Align size for
 IOMMU_PAGE_SIZE() to save TCEs"
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210526144540.117795-1-fbarrat@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210526144540.117795-1-fbarrat@linux.ibm.com>
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
Cc: zdai@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 27/05/2021 00:45, Frederic Barrat wrote:
> This reverts commit 3c0468d4451eb6b4f6604370639f163f9637a479.
> 
> That commit was breaking alignment guarantees for the DMA address when
> allocating coherent mappings, as described in
> Documentation/core-api/dma-api-howto.rst
> 
> It was also noticed by Mellanox' driver:
> [ 1515.763621] mlx5_core c002:01:00.0: mlx5_frag_buf_alloc_node:146:(pid 13402): unexpected map alignment: 0x0800000000c61000, page_shift=16
> [ 1515.763635] mlx5_core c002:01:00.0: mlx5_cqwq_create:181:(pid
> 13402): mlx5_frag_buf_alloc_node() failed, -12
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>

Should it be

Fixes: 3c0468d4451e ("powerpc/kernel/iommu: Align size for 
IOMMU_PAGE_SIZE() to save TCEs")

?

Anyway,

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>

I should have known better in the first place, sorry :-/ Thanks,


> ---
>   arch/powerpc/kernel/iommu.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index 57d6b85e9b96..2af89a5e379f 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -898,7 +898,6 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
>   	unsigned int order;
>   	unsigned int nio_pages, io_order;
>   	struct page *page;
> -	size_t size_io = size;
>   
>   	size = PAGE_ALIGN(size);
>   	order = get_order(size);
> @@ -925,9 +924,8 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
>   	memset(ret, 0, size);
>   
>   	/* Set up tces to cover the allocated range */
> -	size_io = IOMMU_PAGE_ALIGN(size_io, tbl);
> -	nio_pages = size_io >> tbl->it_page_shift;
> -	io_order = get_iommu_order(size_io, tbl);
> +	nio_pages = size >> tbl->it_page_shift;
> +	io_order = get_iommu_order(size, tbl);
>   	mapping = iommu_alloc(dev, tbl, ret, nio_pages, DMA_BIDIRECTIONAL,
>   			      mask >> tbl->it_page_shift, io_order, 0);
>   	if (mapping == DMA_MAPPING_ERROR) {
> @@ -942,9 +940,10 @@ void iommu_free_coherent(struct iommu_table *tbl, size_t size,
>   			 void *vaddr, dma_addr_t dma_handle)
>   {
>   	if (tbl) {
> -		size_t size_io = IOMMU_PAGE_ALIGN(size, tbl);
> -		unsigned int nio_pages = size_io >> tbl->it_page_shift;
> +		unsigned int nio_pages;
>   
> +		size = PAGE_ALIGN(size);
> +		nio_pages = size >> tbl->it_page_shift;
>   		iommu_free(tbl, dma_handle, nio_pages);
>   		size = PAGE_ALIGN(size);
>   		free_pages((unsigned long)vaddr, get_order(size));
> 

-- 
Alexey
