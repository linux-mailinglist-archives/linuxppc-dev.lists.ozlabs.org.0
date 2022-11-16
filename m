Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 583BE62CDF7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 23:44:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCJ4t22lRz3cd2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 09:44:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=D2amVl9V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=D2amVl9V;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCJ3s1qHRz3bm9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 09:43:18 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id b11so14375pjp.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 14:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wf2gFJO0eZI55pjXm8OYjMYkGLte7QuRao7+IuvSaqE=;
        b=D2amVl9V9KQfzLW2zaIS23IBouuPji7hB+OAx+ZhW9BBCDB5OKBikMdNxb0VPTDxJj
         csClJ0YRCWBC/mBx5CM8cmRfxBeg4UGIi36VQSyP9C8PzSygpHTtXYMcx806fNdiiKsi
         DAssScFkYAwJ1pFNUcIn3ZWqN1hBHz6LpWnys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wf2gFJO0eZI55pjXm8OYjMYkGLte7QuRao7+IuvSaqE=;
        b=gLDoN4nXWHml+unQPk92+65EoezJF7Eg5a9z/numGQ8h9gdZaSMUxRuntryFS2owZ3
         0y7b24wUOOwQcoji0jMXuXmC6blpDJq1KQ9rRAY+1MEc1QgwadEiUdmT0Iinl6FD1ODe
         y7pFwJ6VSbopHre1JRJRgGpUIUU11VqI02Yx9hjnqiiYd07wxMvRHpBZXkPgyG9rXXRg
         b6+660fWiX3Eir86rNhFzJHeatMIZE7MAWbJq6cgH/b1FksHDN/Sbhs4XweplS+1RHXU
         rAMIkeXX5RmxdKAu/Pa8LAizMZ77wSoMMdtoVFEpNupW1GfUj6rcp5tPtTh7SQ0OzrTx
         TVTA==
X-Gm-Message-State: ANoB5pm6xmwmfhRjbICD9HEtVHPY1G+LAiXEvwqdVqbgx5HG0DHtsmgB
	E81BUv3dU3ivxntP7xMfWpV0ig==
X-Google-Smtp-Source: AA0mqf5VxV4Cbn3MvfOzCKh9TKzLZskissYVmNmiO/kVOhEqnlwi5i8J4bomSjPXRjnnkIIEn4wz5w==
X-Received: by 2002:a17:90b:3c42:b0:213:1ce7:d962 with SMTP id pm2-20020a17090b3c4200b002131ce7d962mr6007688pjb.63.1668638594628;
        Wed, 16 Nov 2022 14:43:14 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a9-20020a170902710900b00183c6784704sm12680746pll.291.2022.11.16.14.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 14:43:14 -0800 (PST)
Date: Wed, 16 Nov 2022 14:43:13 -0800
From: Kees Cook <keescook@chromium.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2 3/3] treewide: use get_random_u32_between() when
 possible
Message-ID: <202211161436.A45AD719A@keescook>
References: <20221114164558.1180362-1-Jason@zx2c4.com>
 <20221114164558.1180362-4-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114164558.1180362-4-Jason@zx2c4.com>
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, patches@lists.linux.dev, netdev@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, Jakub Kicinski <kuba@kernel.org>, linux-mips@vger.kernel.org, linux-media@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org, SeongJae Park <sj@kernel.org>, loongarch@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Chr
 istoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 14, 2022 at 05:45:58PM +0100, Jason A. Donenfeld wrote:
> -				(get_random_u32_below(1024) + 1) * PAGE_SIZE;
> +				get_random_u32_between(1, 1024 + 1) * PAGE_SIZE;

I really don't like "between". Can't this be named "inclusive" (and
avoid adding 1 everywhere, which seems ugly), or at least named
something less ambiguous?

> -		n = get_random_u32_below(100) + 1;
> +		n = get_random_u32_between(1, 101);

Because I find this much less readable. "Below 100" is clear: 0-99
inclusive, plus 1, so 1-100 inclusive. "Between 1 and 101" is not obvious
to me to mean: 1-100 inclusive.

These seem so much nicer:
	get_random_u32_inclusive(1, 1024)
	get_random_u32_inclusive(1, 100)

-- 
Kees Cook
