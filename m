Return-Path: <linuxppc-dev+bounces-772-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A87409652E3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 00:28:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wvwsk342wz2yZ6;
	Fri, 30 Aug 2024 08:28:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724947122;
	cv=none; b=U1tMXqxHYiv8NFaE0X8eC+4ldvig/B0PUiv22PwJfE3bBd8EM6SjavMcNEKV/jYWNYWoXOB/CI4U+DC9mNTURv5mzWHvUkVuYazR0lnlkHBjkRfI16is57IN9ogJO1RP52AFzudNfnsSgTixGDvQeGFCJoYWKN4Uw2yf8nBZC2bKf27PT7zeZ0COvXGnkZIcPj6AIgoU7zVv0Z64AOZxnPU/rc9TuNFXoZm0/Aeo1kLLdb0LrqNMs/EBdcb5aZeorXyVooWShWJkfjRLxsGNl3Z0rscP8QdOf/uFkMGVglNHgIYCgi9s6iEXHgk8iDjaliXzwAzoiBzM7EgOQQBVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724947122; c=relaxed/relaxed;
	bh=lhPD/kfMojMsiZuoWrSaNbTJbgUBxkxmEH5S95zw+WE=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=SXwroWtNJ8zVfV1cviG7+RABzs4f2eUl0s59Pc4V43czHXPHu/2+mY7a6AL6IUbDzcanb5q8E+KlZYRy8viu0BoziVXXX6Tf6aSOW1cyMwUU/Sf+PSr+2SFtby5Q76sU/85316MMGstUmEebP70VhKQ0Sl7MCExMH7oCtGZoM/BU53fUwrl9OONqk5KgdHWAk5D8hDywhxOB+tFNyXXQwPOO2z6y0fQvuf6Lsp1ftbWJXY4xPpbl0p0Fcz4vgJ4YXNmKnmETbQ4eO43qgW6Gx2hMY78RFJ4Q/wo8/YA8Dwtf2XcrcXrppAUAj+lPg4SDM4rDUuTJtbjDNUywNYD7oQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fQn/dhZm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=five231003@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fQn/dhZm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=five231003@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvmD204Jlz2ypj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 01:58:41 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20223b5c1c0so7501725ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 08:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724947118; x=1725551918; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lhPD/kfMojMsiZuoWrSaNbTJbgUBxkxmEH5S95zw+WE=;
        b=fQn/dhZmcF839ubCBQ9ynmKdFWopEnNxYs2xBh9aXksi3MrPFLHFKYD4y7z4ddnpG1
         QuXT+G0xjddmWZaSzpoh21uGUlwR3DqVHjuS/7JGA8in5CnIeXMnpqoa/Gq3vDmMwHg/
         UXyur2KO17XRuy+ZD9juRYya+p20tRokMX3Gcl8Jn4ocJ5sK6pw4CiJZbJ9L8GoQgdTS
         0avxv9XjVxsaNxqzx32cY0rnQTKKeNwfSphQDzvxjGTvWN0XkfgGS+kHQhFup1WPaSDz
         SfRzL/NtWNLvGHsXoScCGvIVHDzl91jFiZi5O9O6eGSF6NWrUqDn0mXhzkD/O1MPE544
         oghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724947118; x=1725551918;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhPD/kfMojMsiZuoWrSaNbTJbgUBxkxmEH5S95zw+WE=;
        b=cePS2HLv6yEshomPNk5WnOSfTbA+40arqY+iiZstt1rg/h4vC622vaZ19dz2yi4LkR
         fkJfYB4nYA7+Mq53+TBLFwHdizwtU8li3My8PyiTPrm/gaWUisbFWC/c2PQJNADFkj9B
         rzB1rAk25LDNAe0UmpUxfvow1Set7FLjUb/zET4Ph8aPuZvhWBJIhduTCYPmcWLaWa3k
         7ZOA3N+XDBzqVi2x67xJsuGOwHHVdVirKrhuPR6Yie3ernZ2FwFjZlIi5BmcCm048O9P
         ly6Kt85Smd7rLvG3qSY9lT/xAWQPEwIMovdWEGzS8FMeYex/Jn9y5oImnaJzFrDlBRXh
         E/iw==
X-Forwarded-Encrypted: i=1; AJvYcCVuKtQX8S/7XIPQp+5bGruji1pnc0NUxMLOgE/df6r9GhPFSzY3vrQgddaIyQKEIOMpaQHOTmrRnKyElAY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzKKkaAgF3cUAOG1N+wwwdAWEL40mt++iVoBQICJOkDsBbUuHsG
	hnLczsv51ifcgvM7oHDLYzTeodU+0rQRIBJ4IKWLPaJsmeaHkJ5f
X-Google-Smtp-Source: AGHT+IG1iOySf3RBBJ3oZsxcckYR+heTF1O3pcq0NqbDD6cG8BqQV54k0HoaRzIYQMYUSXNS5l1OAA==
X-Received: by 2002:a17:902:d2ce:b0:202:4b65:65c0 with SMTP id d9443c01a7336-2050c3a9497mr33986965ad.32.1724947118265;
        Thu, 29 Aug 2024 08:58:38 -0700 (PDT)
Received: from five231003 ([2405:201:c006:3236:1c28:fa2a:bb62:6e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b3546sm13110165ad.17.2024.08.29.08.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 08:58:37 -0700 (PDT)
Date: Thu, 29 Aug 2024 21:28:28 +0530
From: Kousik Sanagavarapu <five231003@gmail.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: andrew@lunn.ch, sebastian.hesselbarth@gmail.com,
	gregory.clement@bootlin.com, herve.codina@bootlin.com,
	qiang.zhao@nxp.com, christophe.leroy@csgroup.eu,
	thierry.reding@gmail.com, jonathanh@nvidia.com, nm@ti.com,
	ssantosh@kernel.org, petlozup@nvidia.com, pshete@nvidia.com,
	ruanjinjie@huawei.com, christophe.jaillet@wanadoo.fr,
	ulf.hansson@linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-tegra@vger.kernel.org, krzk@kernel.org, jic23@kernel.org
Subject: Re: [PATCH -next 8/8] soc: ti: knav_qmss_queue: Simplify with scoped
 for each OF child loop
Message-ID: <ZtCapIwWZolY7oMH@five231003>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240827114607.4019972-9-ruanjinjie@huawei.com>

Jinjie Ruan <ruanjinjie@huawei.com> writes:
> @@ -1080,17 +1080,13 @@ static int knav_queue_setup_regions(struct knav_device *kdev,
>  {
>  	struct device *dev = kdev->dev;
>  	struct knav_region *region;
> -	struct device_node *child;
>  	u32 temp[2];
>  	int ret;
>  
> -	for_each_child_of_node(regions, child) {
> +	for_each_child_of_node_scoped(regions, child) {

Are you sure using *_scoped() is better here?  Since it seems that we
need the memory pointed to by "child" in cases where we don't go into an
error path.

>  		region = devm_kzalloc(dev, sizeof(*region), GFP_KERNEL);
> -		if (!region) {
> -			of_node_put(child);
> -			dev_err(dev, "out of memory allocating region\n");
> -			return -ENOMEM;
> -		}
> +		if (!region)
> +			return dev_err_probe(dev, -ENOMEM, "out of memory allocating region\n");
>  
>  		region->name = knav_queue_find_name(child);
>  		of_property_read_u32(child, "id", &region->id);

Similarly in most of the other cases in this series where a similar
change is done.

Also FYI, as for dev_err_probe(), I think I covered all of them in this
file and a patch for it is currently sitting in ti-drivers-soc-next.

Thanks

