Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EFF94E655
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 08:00:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZPwI/Crg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wj3l21Nn5z2yGq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 15:59:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZPwI/Crg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=ptesarik@suse.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wj3dF5bDMz2yJ5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 15:54:57 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a7ac469e4c4so632344166b.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Aug 2024 22:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723442094; x=1724046894; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYo1INLOq156Qw62vGRe5A8jAlkKQVGuSnU9/QE+v7o=;
        b=ZPwI/CrgPBIe3PY5zSxYKy2aqxFAJIkj/hOSugkBmjAkQWfDdUqzktslqB69tA3Cn7
         z67Gr4ps4DQV0x+gtbl59QlYnll6Y5xNeDAL74hMqGui4RNq7L/mJAocHSNWgffN337r
         u2IGxm3GlcRzxnvHbjzCAJg/bSbg0r7TBAKgH6BdQ+oVTKlMaaHxhtsUQr6LNf1cLkYY
         fqo+9yZmCL4aWxHjqXgjVFu4WSHHFoO5eKOws//t/oaskQQM92lXM+uKyjiEQRjEmYkT
         I98E8N5k+8RlbUbUPtKytSfqx5YGg6Lw6E0sd7KqOAojxmm+4phPk/AE3z7IUD3C8mWq
         7gaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723442094; x=1724046894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYo1INLOq156Qw62vGRe5A8jAlkKQVGuSnU9/QE+v7o=;
        b=M+1X9XjhMkSj4dU+DCTf/ou2t1CxTK9Vj6MJSFvYfowyc0/vQVfW76+oB24qJKncmH
         /axAak1Z2q7mPETBM380Sw0k3nijm3HByDj5YVXxBad6d/WX6MchmBdhzCH9BC39FX+s
         faPWLmq8qqv2fZL1C0i7dnN1xjVwxXrUR3jIOk7Em+9iAFGotaWXtoaMf8WVLwMFBmXy
         PDzUJ+gTGbBDe88R3FXpBdNI1NQAWBkZNXXvR3BnjRJPynSzwnKkTOeAJXaSKGxX5rjO
         XNiaPuYZLcPJYe5mDTBTAZKil4U38OJWXVBDHtcuLm+oZS5xV4RHYwPi8rsccIN1LMzC
         gzWA==
X-Forwarded-Encrypted: i=1; AJvYcCV6vgKcNCvxgdy5VuKY4weSu9/0EjEpx6DI26s1O1rkO2cKDPZaNvPYhitDiQplGmrxdDSanHDhvaFTzSpoOvq2cNwrEvzwbmkJFLQ/pA==
X-Gm-Message-State: AOJu0YyUkGeG287pH+cNpQazhpcwE2q/WAmBsdn4Qrc4wyfnq/dqRbJU
	CDfheskH0jUBvudbAgrA5Z5NDeUrW6Ml1e+k4RxY5GPWfM+m7vNK+v+akqp6dDA=
X-Google-Smtp-Source: AGHT+IEWJlWulwINR2mvPDA0F+GzST96BiyVI1VBUqXaw2VqDuwlnso7Bu+sdLf7W/E58YfrQZmfvQ==
X-Received: by 2002:a17:906:478a:b0:a73:9037:fdf5 with SMTP id a640c23a62f3a-a80ab75a8d2mr689304566b.6.1723442094028;
        Sun, 11 Aug 2024 22:54:54 -0700 (PDT)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb243d78sm198422366b.224.2024.08.11.22.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 22:54:53 -0700 (PDT)
Date: Mon, 12 Aug 2024 07:54:52 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v6 RESED 2/2] arm64: support DMA zone above 4GB
Message-ID: <20240812075452.4ef3eef5@mordecai.tesarici.cz>
In-Reply-To: <70d2c447b6dbf472b8e7fec5804deddc12692aab.1723359916.git.baruch@tkos.co.il>
References: <cover.1723359916.git.baruch@tkos.co.il>
	<70d2c447b6dbf472b8e7fec5804deddc12692aab.1723359916.git.baruch@tkos.co.il>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 12 Aug 2024 15:58:03 +1000
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
Cc: linux-s390@vger.kernel.org, Ramon Fried <ramon@neureality.ai>, Will Deacon <will@kernel.org>, Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 11 Aug 2024 10:09:36 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> From: Catalin Marinas <catalin.marinas@arm.com>
> 
> Commit 791ab8b2e3db ("arm64: Ignore any DMA offsets in the
> max_zone_phys() calculation") made arm64 DMA/DMA32 zones span the entire
> RAM when RAM starts above 32-bits. This breaks hardware with DMA area
> that start above 32-bits. But the commit log says that "we haven't
> noticed any such hardware". It turns out that such hardware does exist.
> 
> One such platform has RAM starting at 32GB with an internal bus that has
> the following DMA limits:
> 
>   #address-cells = <2>;
>   #size-cells = <2>;
>   dma-ranges = <0x00 0xc0000000 0x08 0x00000000 0x00 0x40000000>;
> 
> That is, devices under this bus see 1GB of DMA range between 3GB-4GB in
> their address space. This range is mapped to CPU memory at 32GB-33GB.
> With current code DMA allocations for devices under this bus are not
> limited to DMA area, leading to run-time allocation failure.
> 
> This commit reinstates DMA zone at the bottom of RAM. The result is DMA
> zone that properly reflects the hardware constraints as follows:
> 
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000800000000-0x000000083fffffff]
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   [mem 0x0000000840000000-0x0000000bffffffff]
> 
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> [baruch: split off the original patch]
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Note that I'm not an Arm64 maintainer, so the value of my review is
limited, but AFAICS this change should work as intended.

Reviewed-by: Petr Tesarik <ptesarik@suse.com>

Petr T

> ---
>  arch/arm64/mm/init.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index c45e2152ca9e..bfb10969cbf0 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -114,20 +114,8 @@ static void __init arch_reserve_crashkernel(void)
>  				    low_size, high);
>  }
>  
> -/*
> - * Return the maximum physical address for a zone given its limit.
> - * If DRAM starts above 32-bit, expand the zone to the maximum
> - * available memory, otherwise cap it at 32-bit.
> - */
>  static phys_addr_t __init max_zone_phys(phys_addr_t zone_limit)
>  {
> -	phys_addr_t phys_start = memblock_start_of_DRAM();
> -
> -	if (phys_start > U32_MAX)
> -		zone_limit = PHYS_ADDR_MAX;
> -	else if (phys_start > zone_limit)
> -		zone_limit = U32_MAX;
> -
>  	return min(zone_limit, memblock_end_of_DRAM() - 1) + 1;
>  }
>  

