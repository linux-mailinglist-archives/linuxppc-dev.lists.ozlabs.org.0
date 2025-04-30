Return-Path: <linuxppc-dev+bounces-8205-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC18AA57F7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 May 2025 00:33:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnsRH0NRTz2yZ8;
	Thu,  1 May 2025 08:33:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746042988;
	cv=none; b=kB3QwWsflzvpSlgrgg6M38Y3Yk+CVl9l/TH2qLpK9BLuZyfF9MRt0Euf4rFaLrArXQF0iMruRc39kUAvZNGnjSWArMVhgKdZcuTXPywph5JU6kmv+gs2/mfVN3+7j1w7JCK26O/QMsIbdV9N43g9jV/0reOSq8KbnTGHPvqOwcY2QUujAu7aJRgmOUfI0Dwdhs8brhchxgvhBNSjVk/MiKCcXPhSqDKj3+95wJ8gJs6z0zmcyyr4FvhfBbTvgU6IP1ZO0c2vMW8A7jLyLmGBbmeek8Pu3Td2SD2OlabirNN4s2+zXhsB8kkYirIF36eqPXvA/hvPBtxKnF7YXaFqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746042988; c=relaxed/relaxed;
	bh=fl3ZSe7H35q1B+EOiZUwtSQdGXkhze1P/MPuzRRU2ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNRA+jRR6+cx2Mog6Qq9Lnsfm/n+sXMg0bWDbKd5b5EuBdV69NlrMUp/K6CYcFrwUht6B31ixzdVweD22R/HDCDsghTr/972X7HlHU9JJYA10S5vcUMelJtO74tKP4ehV0bAIaovq9JCXOZYUSPToN2j/v7h8XBUxOSEGhXV0bnEeZoreGvuWq5UJK++SLWBBhmZ0hlagjB660/11hQadKQiiKkTsJ57zGWIwoDIoyYkcOIi0GpXn5hFbOo/BvV1IlTvScJN8CWgrNBkIQnzaCfKN4u4RRv6H8iQM3grtUCUEtRXvUXs50L8l6uIB2d1E0p/y055rmuXWdkFopz4TA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=P9/JrjzP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=willmcvicker@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=P9/JrjzP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=willmcvicker@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Znnxk5GvYz2yYy
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 May 2025 05:56:26 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-227a8cdd241so3205995ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 12:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746042983; x=1746647783; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fl3ZSe7H35q1B+EOiZUwtSQdGXkhze1P/MPuzRRU2ao=;
        b=P9/JrjzPjk0bC3BFcBd6+VHk7LXJXcJ3yaKPlDGFA3sh8WRUdtvw2DRXlJZBSSgB2n
         4G9eRCzU4iDoOz2L/Fg3nW+x7XILX50+/EEpTK07GjKtng/P/9MwQ6w/z/7NEAjKzEhu
         dBGsmftOXqVQZcjZpETzTrYti6m8QaaVQKgf72VO9Gtm0eZH8qMYi3hDxaUBPc4vCWYM
         +mmCkGUZErfRiu4Ao+ks6jF1cnmwMS2UlmOhggj+69xjuVK8UUSXLt7K4NuA4rF7O6ba
         PN4TqU2x5BTWX158P2XTpjQrh2W2CWxz5Po2y2HVMrz0l4kUmEy+nzjkie1XNuac/YH8
         RSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746042983; x=1746647783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fl3ZSe7H35q1B+EOiZUwtSQdGXkhze1P/MPuzRRU2ao=;
        b=c/Gvlg+O9nxc4iovBDaLvo3s7txXiHIy333khLKETHiExKRiQkVuWjCTp4gjWtzyex
         0EzYpwrCUaGjl+ZP3l66fphY0UFUzHnnGZqA/WPAQ6i6enQSbO6aqFntqrG/wp240sJH
         UFiO5qFNKmVZie9TGSsUla7WpgEXYpWa+T/fiJXiAMTRVqRLO2oJHJBCHrZcC0I6wm3y
         9oor1flaP073jipMmq6/CnA6154ktMmksQLUB2MDI1sG8BkjzaxTfcOuvS2Kd9Xc6eA/
         bGlYknPYELBB1x4xQBJYc5HpU+dIzvGlEe7p2IW471jCtIeWd3ShlUm85BEcptEvGpAr
         kTbg==
X-Forwarded-Encrypted: i=1; AJvYcCXMvaB0nvqGsWnd3VQRWSA0je6oQnJOjMpISkkInBZ3m1tj3C6YlriK8mpKvHJXrGFIO1jFuRlE9H040Nk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxCdN0966YW7AEwKXwDiKn1tl6VhMtBOJP1h9IqbNfiU2LmT7OW
	75KmjYlI9yeHnP1INK+buIu5GMdrR0v07kt/vk6p6/0HAv4RzU9m3IobaevKAQ==
X-Gm-Gg: ASbGncuKpVfZrhqp3uBuSB0et0VZc3lgcJKKIYcuEGbPuyNOMWf5TBySLmJDheiNNpc
	WRsaDyhOmsNUZOFjLcVQOJPQGe6lP+JwAeNxEPdfsapN8QJ3My3LtS55F8dINdxqg5Sl6OwuSRa
	1kPe7wXANy9fiHbtsDSfyAmtAmc2VCS135kruLJL5CoajTuRfBH3czOrRHbTYOS9TAsz2w+L+YF
	WLKV8t25fFQNhBJPCLnJdSTyhcHFDqhYxdT2993HPXCvX4LLfbqDva4y1WoyPGDJq6BylFU/Bdq
	Qj2NW886uwKw4o1xYNajdnQIBG8C7bR/2hVPaWAGnnQscTZVGw9JeODzNG8NfyPsfJCi7NphJtk
	e1XKsAg==
X-Google-Smtp-Source: AGHT+IEfvBtw6ZDkXGIV92ANTqElq200z1gKvtBKSpmArntOiAskzPFgnv57q18obGXP2jeZOb7RVA==
X-Received: by 2002:a17:902:f785:b0:223:6744:bfb9 with SMTP id d9443c01a7336-22e041084e8mr4719445ad.41.1746042983190;
        Wed, 30 Apr 2025 12:56:23 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbb1a0sm126748995ad.58.2025.04.30.12.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 12:56:22 -0700 (PDT)
Date: Wed, 30 Apr 2025 12:56:18 -0700
From: William McVicker <willmcvicker@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, will@kernel.org, Ioana Ciornei <ioana.ciornei@nxp.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] bus: fsl_mc: Fix driver_managed_dma check
Message-ID: <aBKAYnP0u9ZlK12y@google.com>
References: <20250425133929.646493-3-robin.murphy@arm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425133929.646493-3-robin.murphy@arm.com>
X-Spam-Status: No, score=-14.7 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	HK_RANDOM_ENVFROM,HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 04/25/2025, Robin Murphy wrote:
> Since it's not currently safe to take device_lock() in the IOMMU probe
> path, that can race against really_probe() setting dev->driver before
> attempting to bind. The race itself isn't so bad, since we're only
> concerned with dereferencing dev->driver itself anyway, but sadly my
> attempt to implement the check with minimal churn leads to a kind of
> TOCTOU issue, where dev->driver becomes valid after to_fsl_mc_driver(NULL)
> is already computed, and thus the check fails to work as intended.
> 
> Will and I both hit this with the platform bus, but the pattern here is
> the same, so fix it for correctness too.

Thanks!

Reviewed-by: Will McVicker <willmcvicker@google.com>

> 
> Reported-by: Will McVicker <willmcvicker@google.com>
> Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe path")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/bus/fsl-mc/fsl-mc-bus.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
> index a8be8cf246fb..67031136ef66 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> @@ -139,9 +139,9 @@ static int fsl_mc_bus_uevent(const struct device *dev, struct kobj_uevent_env *e
>  
>  static int fsl_mc_dma_configure(struct device *dev)
>  {
> +	const struct device_driver *drv = READ_ONCE(dev->driver);
>  	struct device *dma_dev = dev;
>  	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
> -	struct fsl_mc_driver *mc_drv = to_fsl_mc_driver(dev->driver);
>  	u32 input_id = mc_dev->icid;
>  	int ret;
>  
> @@ -153,8 +153,8 @@ static int fsl_mc_dma_configure(struct device *dev)
>  	else
>  		ret = acpi_dma_configure_id(dev, DEV_DMA_COHERENT, &input_id);
>  
> -	/* @mc_drv may not be valid when we're called from the IOMMU layer */
> -	if (!ret && dev->driver && !mc_drv->driver_managed_dma) {
> +	/* @drv may not be valid when we're called from the IOMMU layer */
> +	if (!ret && drv && !to_fsl_mc_driver(drv)->driver_managed_dma) {
>  		ret = iommu_device_use_default_domain(dev);
>  		if (ret)
>  			arch_teardown_dma_ops(dev);
> -- 
> 2.39.2.101.g768bb238c484.dirty
> 

