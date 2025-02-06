Return-Path: <linuxppc-dev+bounces-5917-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1354A2B3BB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 22:06:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpqR11q1xz2xfR;
	Fri,  7 Feb 2025 08:06:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738875997;
	cv=none; b=FiLUoWe1FgrSQI+XY29wXD4YO+WjRs7M3HLzM291SVazXasjQqWv1L9NLr6oTdpiynPsM6IlrEa26H2CsRJ+AinqfW6LB5tWQ6iAeAGzGYno8dc2QqUWO+OAWDuUUYLVT8BIfHj3NeXhXUmlJvfq14vxDUN+RPIwYwaZ8/KsDY4QyawUNvYtI1OcoMi3j3pJQiCq1AQytPJKLlnXyxqcIFspgqhqaVu033G51T8SPOIq4HqqiTphvTqwtbxs5fbfDJzFazd4AFdcKcPFQq3LJEjWK5z73nphfArKcvVNIskbWkCUjfuNMFr0LZTzfbsIGwRf/dmSlu0UWNC0dqQZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738875997; c=relaxed/relaxed;
	bh=BjMZZDjHtCceqfzd+zK9UkArZCmEsWhxxeyu2AQZCbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=caoJJYrlwInQT+yQoS0BykKlod40UYP7Sv/DmjXS0t0jR6jgypN2pHWLMJ0KH0CcZAjIgwvWxG2nQWyy4FZYdOpvfsi4/2Jmtcu1okwnPwWGIH01tiILhZcDZrd19kwtQJCXhqLTqspMtpAi/b0d23Sj7Z1mxO7AiuWYL0fih9SH4NAPhgvQ3kItiRhzeWElOlyhQbk1teaiOSNWlVJkBvcgKJTtd2DT93jYN5HayqHy63Gc6Ssc4Z7EgfmDSorILHkB/ypPzbbivWFdqcBmnZDQmzWzMS9Hcspt2mJ4x0leNthItWhks7YRC7yuizXOzI8aDr6mjGEOCwVZn4x6fA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OAW2cd9l; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OAW2cd9l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YpqQz4Nnjz2xQ8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 08:06:34 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2fa1e25e337so847325a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Feb 2025 13:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738875992; x=1739480792; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BjMZZDjHtCceqfzd+zK9UkArZCmEsWhxxeyu2AQZCbw=;
        b=OAW2cd9lLMkSkVyFoKOEzlJhCWKAMx60DxDWE7bDv/EeFSN5688T8V5JHxikJLBMKE
         oUVMIahoScXwdbDRIp7/J/w+3gJ64RJpCBWobOoz05rvgrWyrat6yXKRsQvKAvBCAQoJ
         8y4BBR4AAq0PlO5LIQgiES3+Jyk3NJ2Wn9FU377wPVCDyfyhuYdv3Cyx1JFC+oqIH0u4
         +Jnc8dkuqxu6nY4dAU7hYiJmzwIbiYsqXOnEsqJVJvFHY1OJcs3R8pmmJSKkgDGBjfq1
         ejLRGc8mNAF7r1xEvRBBZPUxXGe3Z0mRxB30euGHmZMG1mQ6+A5Sa2wJTyZ+r2nYvV6+
         CHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738875992; x=1739480792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjMZZDjHtCceqfzd+zK9UkArZCmEsWhxxeyu2AQZCbw=;
        b=aGLd1ixuqEQc/LaHC6TZrN3mPEMJn/JTP2rPJJbvQeIeiWeCBB2UU6958Rgl6Xmmkq
         tbjo597/r34FulhAVoZWihu4FdJppf14Zd9NFwstWaN0H3Ilts+2liuN0c/MgZzb8NRZ
         uWgaRW6f0EZXku3hMtZ0Qfp6UxzD7SvdUx8jiJS1nCEhQKUnDCMkYJdjb03c/z22PQcy
         5vOSBqJk5IZ5pujzx8ijXPdeheQ/P1Mg4I6uoRl8lViHieCCe4Bud++k66cJG6fne7L1
         7bGi85nXbpfM8QA1M2JCXAy4/60HeSfFttI1vw7ChiSgCLi37BwzZPvr5yGXrK6m0u9l
         oatw==
X-Forwarded-Encrypted: i=1; AJvYcCVnl5GPIVIct20WPc66ncAfaw79bK+KKZbQ46MYX/4R8uoSjh7SJo29Dczuo0Y7h/1pqmtbhCKAW8iEROw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywv8ZUxajSqJXznAqEk8E+Y9pSHeU8rULE5FaDWI6YxC2to3eUG
	iVkPs1MV+4tXOQpzTaMUHdsSK7FsLnu3AczexXn9nw2MR51WnG9o
X-Gm-Gg: ASbGncvY9hkX2SpYiK6WRFTnnLScczbZx90vWHY6aFmFsIrzeuSV4egT7PucqyfMypW
	ha/j9l3//IFA/18jPeH0dmkaIt0YVjA4Nz4KdlohuU1aDGQThIkOqbKgK5JFWYVRolkoeVPAj9M
	JJtnPKy7mAtC3pXS/cTM7LHoI9JakPe73Of6UzSTSfV6pyRwu7tAEooDhfTVzU0ahusvTr1nzpX
	cTbNk/Tu3DrKYy+BvDhIXnYDG2oQU45lOe39Ig9GfhnwGiLF3LTy9y5aL+MtAflDhYB7dLIrYyJ
	OSkKsdk7KgX/pgDgN2y7TferhH3A
X-Google-Smtp-Source: AGHT+IH78/uCL9JiB7gG2UlgfTf9jp7yPy30ClKcc0/9tpp9zOrpumyNaOrCnZmQL5OMHTgXCvjCaA==
X-Received: by 2002:a17:90b:4b8c:b0:2fa:f8d:65e7 with SMTP id 98e67ed59e1d1-2fa23f43a0emr821750a91.2.1738875992197;
        Thu, 06 Feb 2025 13:06:32 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa17618064sm1089562a91.41.2025.02.06.13.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 13:06:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 6 Feb 2025 13:06:30 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Alistair Popple <apopple@nvidia.com>
Cc: akpm@linux-foundation.org, dan.j.williams@intel.com, linux-mm@kvack.org,
	Alison Schofield <alison.schofield@intel.com>, lina@asahilina.net,
	zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
	bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca,
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v7 19/20] fs/dax: Properly refcount fs dax pages
Message-ID: <f5e487d8-6466-442b-ae97-a7c294dc531e@roeck-us.net>
References: <cover.472dfc700f28c65ecad7591096a1dc7878ff6172.1738709036.git-series.apopple@nvidia.com>
 <b5c33b201b9dc0131d8bb33b31661645c68bf398.1738709036.git-series.apopple@nvidia.com>
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
In-Reply-To: <b5c33b201b9dc0131d8bb33b31661645c68bf398.1738709036.git-series.apopple@nvidia.com>
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Feb 05, 2025 at 09:48:16AM +1100, Alistair Popple wrote:
> Currently fs dax pages are considered free when the refcount drops to
> one and their refcounts are not increased when mapped via PTEs or
> decreased when unmapped. This requires special logic in mm paths to
> detect that these pages should not be properly refcounted, and to
> detect when the refcount drops to one instead of zero.
> 
> On the other hand get_user_pages(), etc. will properly refcount fs dax
> pages by taking a reference and dropping it when the page is
> unpinned.
> 
> Tracking this special behaviour requires extra PTE bits
> (eg. pte_devmap) and introduces rules that are potentially confusing
> and specific to FS DAX pages. To fix this, and to possibly allow
> removal of the special PTE bits in future, convert the fs dax page
> refcounts to be zero based and instead take a reference on the page
> each time it is mapped as is currently the case for normal pages.
> 
> This may also allow a future clean-up to remove the pgmap refcounting
> that is currently done in mm/gup.c.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> 
> ---
...
> -static inline unsigned long dax_page_share_put(struct page *page)
> +static inline unsigned long dax_folio_put(struct folio *folio)
>  {
> -	WARN_ON_ONCE(!page->share);
> -	return --page->share;
> +	unsigned long ref;
> +
> +	if (!dax_folio_is_shared(folio))
> +		ref = 0;
> +	else
> +		ref = --folio->share;
> +
> +	WARN_ON_ONCE(ref < 0);

Kind of unlikely for an unsigned long to ever be < 0.

[ thanks to coverity for noticing ]

Guenter

