Return-Path: <linuxppc-dev+bounces-7927-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDFCA97524
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 21:09:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhsHF19S6z3bps;
	Wed, 23 Apr 2025 05:09:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::731"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745348969;
	cv=none; b=cKof5BUjO3Ccw9CVa1gZPzFzVuleTHW6gHaKySysIbDrvjWxG0NEaFtlihJvEzIDf98vwEAM+csinvSd6evgQlrMgpHLYOsUGEu23sFdnGR9Nig9R5YZuEybgM8ZT1wwWrD4Z+XNWZPSf+GJ6ADVrgfLWZOkPQjjVW5GPQO9m3fL7V/8CrIuOpplHQAYoomlY/9LSIHVby226VgkMKYfVFDCj04OUib6mISQxSrcFbKLxPsw1JnFataDpWYh5KSkU0zs+UqEadn2FliUCLSUrMA7tYR67juqXFeKetHRJlhgAXpwfTDMpJ12cmaNYsNPvQjySzxWg+RQ0aSfpEVJVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745348969; c=relaxed/relaxed;
	bh=l5KwgOa0BGBtglnb/EmAwT1KJYw0ByggohSX6F5Qhzg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNrt4JEIkOGV+xS06/4UExDJZCqntcJJ7j9ef9HcgtiROeYBi7wxXlc6r1p3cfJ9mZSBDjBYwuPIV9CY0IeKUl/zo9iGYahTstrYjuvuBd5IzbqTXFZwrirC6ZxHw5GhSeV3RRzrLlAYTlokgPO8OqOLe7IGuE/WtvSb5O0HpbEz9NJJnBL/jYG5LHDFhtqjHWRGjiRY17ZIamjQaJNaWhhlJ2FokWrHxTe1Xrtw3txdUyQk0O6SMSSaFxlmZqXn5ZeDr4mnod/QlG4qVxbYtzc4di4bX139y/xUIUqJMZ6/OREf81WfYs662D9cSssr6gZ35jvQ50CCWELPqdeMqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=KIkuDiix; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=KIkuDiix;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhsHB2NNWz2yys
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 05:09:24 +1000 (AEST)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7c54b651310so762062985a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 12:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745348962; x=1745953762; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l5KwgOa0BGBtglnb/EmAwT1KJYw0ByggohSX6F5Qhzg=;
        b=KIkuDiixD82GKrOfynWTThTrK6cY3d3BGb3AUDLFyOJKZkkcI2nN5g/ZP3zI0bGOph
         IqmVl7TmJy367lmRGMmcdflfx5u0YLCFhEN30N6KxvtyTKKPWip3xUnc4iFWZYxK9ioj
         /gvghOeM85y69wqVS0IpbPhOTqziBrpGKJO41Q0vI5qMgku6iLekJ3QzaRR/JWTNP+d9
         K0iuT4csri9nzB26E4t9FMeB1OqzsKzMl+Xbti5UZG71Lc4sGGQtylkgucnU3kPKa9fm
         4mDafbSjVs7MqbbzMmx9Hrt1rx7L9a3FB10Y/Nq76ZfnEypkNpCge9s2YM1euCUHEfDi
         w3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745348962; x=1745953762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5KwgOa0BGBtglnb/EmAwT1KJYw0ByggohSX6F5Qhzg=;
        b=uBk0dPSo9UpwWSdQEWZAV0nbtdlDusC7ZOC5C4duE3PRKFRXLQ+Q8/0I77HEEJYmZh
         HisjYFIOwT9zwrQXYaa3YG99L2tM9n6nIKIK2dWbaaCumF5O+H1lBfS1oGq3X2Eee7Pt
         5/Rxj69CPIYg8wPOctfjZzOIqaPHjPFwuwYrVMtRZoYCtlKNd9npdgMPoIj+83v28/l5
         /GWag9GAWwji6yC+xupe7rzDc23EdbV8QyDfpzYiG3XAioQtVzrLuSFEqUwMZ8ltTom9
         OM7FuZYd8OR6FX04a4NPGzTp2OsaoWxQxngDUxraxHm7Xj7yKU2O06nPgO0X7tdnkR6Y
         Va8w==
X-Forwarded-Encrypted: i=1; AJvYcCVtJ5Y0lxEH7V6vJQw+sbdk7D3OWO2aDRYgCJmI0XMcLyIeqhqzstA3/72xZgex4nRTKA4/Ea/gwGIcAXg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxI7SANsrw26qiwpGE4jXirgHuqmk/grmgizWSXOTPaYfgG/5UF
	KG4ZL7tDh6U95FvXkjxDkBXLTb7OtbRxCwnLBBZzLgSTwmri6qWGq6Ilt2OUtTc=
X-Gm-Gg: ASbGncvmlylUlMirWh+7XZLMzAXl1FOAwXHs0l2kMTSLgp2nr+mGwGBpmZ8l+hP6ST9
	CG22QyWVKTzt/1+gr48S5uVm+tlxJB8LnUWFn9ONJ9B65QR8Vi5tnHWHYsjSkm4Z+a6HORSOETw
	73KeBUlg0C7RtXSDsR7ULEnEOQWeUvS8SW/0jbapG2eDkBCJSPVWc2u20Ur26E5Pe+mV5ZnvLKG
	IPm/w0oVNIA48FXO041wkOWKWqcEp+XcUGJaTOHYONJ7wGw5vCI0mkU9TBi15ml/s/6fDjoCpEb
	x4JQgsQrhGG9lUU4gjj10AJDW6D6VwTcyWBB7puw9tHJ27dpQnjABq+qFOO2kvJaiPpEeo21jyz
	6Hs+7P8Q0Ek3TSfcPAKs=
X-Google-Smtp-Source: AGHT+IFhAGFfyv8bohe/pDvVL8xD9tiUQcnS5dS4QxAQwB4x0kumkU1YhBjNi9x7Uz+SvdcDBwQGFA==
X-Received: by 2002:a05:620a:4627:b0:7c5:4a3a:bc12 with SMTP id af79cd13be357-7c927fa8740mr3038817285a.32.1745348962481;
        Tue, 22 Apr 2025 12:09:22 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b4e01dsm592265185a.75.2025.04.22.12.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:09:22 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7Izh-00000006vaw-26Wh;
	Tue, 22 Apr 2025 16:09:21 -0300
Date: Tue, 22 Apr 2025 16:09:21 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] fsl_pamu: Use 40-bits for addressing where appropriate
Message-ID: <20250422190921.GB1213339@ziepe.ca>
References: <2025042122-prudent-dogfish-eac6bf@boujee-and-buff>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025042122-prudent-dogfish-eac6bf@boujee-and-buff>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Apr 21, 2025 at 10:46:19PM -0400, Ben Collins wrote:
> diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
> index 30be786bff11e..a4bc6482a00f7 100644
> --- a/drivers/iommu/fsl_pamu_domain.c
> +++ b/drivers/iommu/fsl_pamu_domain.c
> @@ -214,9 +214,10 @@ static struct iommu_domain *fsl_pamu_domain_alloc(unsigned type)
>  	INIT_LIST_HEAD(&dma_domain->devices);
>  	spin_lock_init(&dma_domain->domain_lock);
>  
> -	/* default geometry 64 GB i.e. maximum system address */
> +	/* Set default geometry based on physical address limit. */
>  	dma_domain->iommu_domain. geometry.aperture_start = 0;
> -	dma_domain->iommu_domain.geometry.aperture_end = (1ULL << 36) - 1;
> +	dma_domain->iommu_domain.geometry.aperture_end =
> +		(1ULL << PAMU_MAX_PHYS_BITS) - 1;
>  	dma_domain->iommu_domain.geometry.force_aperture = true;

What on earth does this even do? There is no map_range() callback in
this driver, so nothing should be reading geometry..

Jason

