Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CB27AF5BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 23:30:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=jannau.net header.i=@jannau.net header.a=rsa-sha1 header.s=fm1 header.b=kKw7XbpC;
	dkim=permerror header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha1 header.s=i47b949f6.fm2 header.b=KUzo3ljM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwCZK4VPtz3cdt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 07:30:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=kKw7XbpC;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=i47b949f6.fm2 header.b=KUzo3ljM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=jannau.net (client-ip=64.147.123.18; helo=wnew4-smtp.messagingengine.com; envelope-from=janne@jannau.net; receiver=lists.ozlabs.org)
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com [64.147.123.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rw8Q40Y6Rz3c2X
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 05:07:40 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.west.internal (Postfix) with ESMTP id CAFE22B00139;
	Tue, 26 Sep 2023 15:07:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 26 Sep 2023 15:07:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1695755256; x=1695758856; bh=YD
	o6eC1pWX0Zqv0pmi3rbnqY8yGcQr0MnMkqXd/VPtI=; b=kKw7XbpCvCn0lQQ+1a
	PIuZkUm0Zdt8RikObUsnEVPxGANMOMKYIcn7A4evrXGmPtBi5yFlMGB9ScK0Jkoq
	BRZA9vF9eqcPTEZxKErOVLU66Cj9BN0b5NyblhYD2shc5Hy05sik2UvpPFVRffO/
	G1BmJY6lw1/mTwABgCa742MSY4NwAAb0l1IMBZG+n6SxrF7G5xY0xo1SylltEhYr
	1jd0j88tpIB6rWzEUniTN61hsdCH/0qt5Q6bImSI6YJfYIJqRIQRNT/CqsD97yiQ
	2gAYnr86NIw4srks3xINBNTRopFDUKslwzDNUbSpG8hBX/xdvqRTn6AG63Wt25SZ
	0dnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=i47b949f6.fm2; t=1695755256; x=1695758856; bh=YDo
	6eC1pWX0Zqv0pmi3rbnqY8yGcQr0MnMkqXd/VPtI=; b=KUzo3ljMHtKyWqfmbfD
	jEd0ZKci1dVDcAiE+X9HFaV+fgIxuM/+98NOUwqh6cevLfKap7z6rqYblgrArXZn
	0lX7ZSD6c3mUDkt7If+fhdqmsaYv1c6Qg/tdLXKQVMblRg0ZvXjQtL11gXNaJft9
	6T9OSDdvqsiUpucn1jqQiVVd19MN0IBX0rM1/YvWelPskVIXVsfl0/BSxECr/grv
	uj9b0Y2jfyoOS72nL+t4Y95/1p6Q58H9AYOMfNLo1qMDPmyP5Et4Az9JZCCJ1GWB
	tVs40pj9/Y5Bx0SHHKgi/2D5MRIkc7Se9mEA7x7zxo9dQyfMJvtyfe8+fiRTUyk7
	HMA==
X-ME-Sender: <xms:9isTZbzzlr4WTTr5f1w19zE5_0GM08wF6QcGsaUrhh6DiMZyDLPBpg>
    <xme:9isTZTTLhsZj74fNnAPOCriAIeVkBLrON_5rx5afVk0nyKTfua86LPyVmOZQUq0kj
    3eFN_G3W43hZZJ2GVg>
X-ME-Received: <xmr:9isTZVWVRQVzn_Rr87HULypiW1tzs5fQdTECk3T6wC-REOUQDFq7CFQMzg2skK7Fwvn8haesbhLb4bAfjBwxR4reKu72JGDurw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvjedrtddtgddutdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhn
    vgcuifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpe
    fgvdffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjrghnnhgvse
    hjrghnnhgruhdrnhgvth
X-ME-Proxy: <xmx:9isTZVhfCmg2lkKqKMcbtqKHdUbKP7HQ1HoGwvLcKXoVO5dgzwbrAA>
    <xmx:9isTZdBsdw97CdD73Jk_YyTJYMvqBKubBULSbJIWjcICj8L87vjpnQ>
    <xmx:9isTZeLQQhJiA2aIdTk6NLOD8-Flrs-g_wUp2McpDzRyttPL8u2lKw>
    <xmx:-CsTZXR0BDwR-7loYryqP26ZjBMxC1haNwEXKM4xg9Y7HXrc9ph8FlOnEaQ>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Sep 2023 15:07:34 -0400 (EDT)
Date: Tue, 26 Sep 2023 21:07:33 +0200
From: Janne Grunau <j@jannau.net>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 8/8] iommu/dart: Call apple_dart_finalize_domain() as
 part of alloc_paging()
Message-ID: <ZRMr9SK3F85WGXE7@robin>
References: <0-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
 <8-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
X-Mailman-Approved-At: Wed, 27 Sep 2023 07:27:38 +1000
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
Cc: linux-arm-kernel@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>, Will Deacon <will@kernel.org>, Sven Peter <sven@svenpeter.dev>, linuxppc-dev@lists.ozlabs.org, Joerg Roedel <joro@8bytes.org>, Hector Martin <marcan@marcan.st>, Nicholas Piggin <npiggin@gmail.com>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, asahi@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 22, 2023 at 02:07:59PM -0300, Jason Gunthorpe wrote:
> In many cases the dev argument will now be !NULL so we should use it to
> finalize the domain at allocation.
> 
> Make apple_dart_finalize_domain() accept the correct type.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/apple-dart.c | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> index 62efe0aa056f60..2c1832e357c7c6 100644
> --- a/drivers/iommu/apple-dart.c
> +++ b/drivers/iommu/apple-dart.c
> @@ -568,10 +568,9 @@ apple_dart_setup_translation(struct apple_dart_domain *domain,
>  	stream_map->dart->hw->invalidate_tlb(stream_map);
>  }
>  
> -static int apple_dart_finalize_domain(struct iommu_domain *domain,
> +static int apple_dart_finalize_domain(struct apple_dart_domain *dart_domain,
>  				      struct apple_dart_master_cfg *cfg)
>  {
> -	struct apple_dart_domain *dart_domain = to_dart_domain(domain);
>  	struct apple_dart *dart = cfg->stream_maps[0].dart;
>  	struct io_pgtable_cfg pgtbl_cfg;
>  	int ret = 0;
> @@ -597,16 +596,17 @@ static int apple_dart_finalize_domain(struct iommu_domain *domain,
>  		.iommu_dev = dart->dev,
>  	};
>  
> -	dart_domain->pgtbl_ops =
> -		alloc_io_pgtable_ops(dart->hw->fmt, &pgtbl_cfg, domain);
> +	dart_domain->pgtbl_ops = alloc_io_pgtable_ops(dart->hw->fmt, &pgtbl_cfg,
> +						      &dart_domain->domain);
>  	if (!dart_domain->pgtbl_ops) {
>  		ret = -ENOMEM;
>  		goto done;
>  	}
>  
> -	domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
> -	domain->geometry.aperture_start = 0;
> -	domain->geometry.aperture_end = (dma_addr_t)DMA_BIT_MASK(dart->ias);
> +	dart_domain->domain.pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
> +	dart_domain->domain.geometry.aperture_start = 0;
> +	dart_domain->domain.geometry.aperture_end =
> +		(dma_addr_t)DMA_BIT_MASK(dart->ias);
>  
>  	dart_domain->finalized = true;
>  
> @@ -661,7 +661,7 @@ static int apple_dart_attach_dev_paging(struct iommu_domain *domain,
>  	if (cfg->stream_maps[0].dart->force_bypass)
>  		return -EINVAL;
>  
> -	ret = apple_dart_finalize_domain(domain, cfg);
> +	ret = apple_dart_finalize_domain(dart_domain, cfg);
>  	if (ret)
>  		return ret;
>  
> @@ -757,6 +757,16 @@ static struct iommu_domain *apple_dart_domain_alloc_paging(struct device *dev)
>  
>  	mutex_init(&dart_domain->init_lock);
>  
> +	if (dev) {
> +		struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
> +		int ret;
> +
> +		ret = apple_dart_finalize_domain(dart_domain, cfg);
> +		if (ret) {
> +			kfree(dart_domain);
> +			return ERR_PTR(ret);
> +		}
> +	}
>  	return &dart_domain->domain;
>  }
>  
> -- 
> 2.42.0

Reviewed-by: Janne Grunau <j@jannau.net>

best regards

Janne
