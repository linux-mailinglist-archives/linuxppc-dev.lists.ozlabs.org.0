Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 495F21ED98D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 01:40:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cll11rBpzDqf1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 09:40:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=JmlTRC4P; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49clj85c11zDqdX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 09:38:36 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id p30so2646350pgl.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jun 2020 16:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=261RUT31PuSmoranObguIYWCcctoAaPL9LPaG28MbCU=;
 b=JmlTRC4P+LHl2wjuekNmYIKEnD04fMoCLlZ0I/bKxc3s+wrPgOMkQpUa8tCRZWYVNQ
 RQk3XFYW9ggapHPcpi7C+gFEFykC6RpngWkj5aT8DTc3UV5kh++XlU2i9BHpur85EIrw
 qn2qk8wLyFnfBMQK0k7qez5Jl+psaL0sRQYXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=261RUT31PuSmoranObguIYWCcctoAaPL9LPaG28MbCU=;
 b=LiuYQb3JKfHePT8V1C7bMbUco6STe505M0SrZXkIaqPV7vl07+tpOQXtIsG3HQ8NUt
 fLVxwlKcJu9zx60UGZ6eKIQZDGlPuigdREMaehbbnGvhDZD0R/cENjme0gv3L22tZXWB
 z5VEbuWng1R0TDmZUfu0WHiGczynCGx9yFeRHRlrdsm9cCmKsweqZMPKlhYI+r1Q1I4g
 SXUYaB9MXkQUbp/qBmN55mr8Eu1k588B5zLY++Mjuu8kGSVpuWlHqr/5csHIkwgec1ox
 V1CSNxdxbZ7ogqk0INClqJtVudMX4x462rpUpfUWvRNbdbY9F+oOYpu+P78CnYr7ufx0
 /CuA==
X-Gm-Message-State: AOAM533mDr2tyLOrDNN8jCR4MxB11KaM0uzInZPfdOxjqOpFvfS8wSYW
 sw0QrTSWahcxQRbuvZg8xZXVPQ==
X-Google-Smtp-Source: ABdhPJwu4vjgHI/sr/02FzeDWVOfrsTIi4ohngcW7RRLaBTVoASPovhFX0qIFpsYzUJ7p8kB3zlO7Q==
X-Received: by 2002:a62:1a0f:: with SMTP id a15mr1545975pfa.177.1591227514055; 
 Wed, 03 Jun 2020 16:38:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id g17sm2431622pgg.43.2020.06.03.16.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 16:38:33 -0700 (PDT)
Date: Wed, 3 Jun 2020 16:38:32 -0700
From: Kees Cook <keescook@chromium.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] pwm: Add missing "CONFIG_" prefix
Message-ID: <202006031634.477F65AC53@keescook>
References: <202006031539.4198EA6@keescook>
 <b08611018fdb6d88757c6008a5c02fa0e07b32fb.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b08611018fdb6d88757c6008a5c02fa0e07b32fb.camel@perches.com>
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
Cc: linux-pwm@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 03, 2020 at 04:04:31PM -0700, Joe Perches wrote:
> more odd uses (mostly in comments)
> 
> $ git grep -P -oh '\bIS_ENABLED\s*\(\s*\w+\s*\)'| \
>   sed -r 's/\s+//g'| \
>   grep -v '(CONFIG_' | \
>   sort | uniq -c | sort -rn

I think a missed a bunch because my grep was messy. :) This is much
easier to scan.

>       7 IS_ENABLED(DEBUG)
>       4 IS_ENABLED(cfg)
>       2 IS_ENABLED(opt_name)
>       2 IS_ENABLED(DEBUG_PRINT_TRIE_GRAPHVIZ)
>       2 IS_ENABLED(config)
>       2 IS_ENABLED(cond)
>       2 IS_ENABLED(__BIG_ENDIAN)
>       1 IS_ENABLED(x)
>       1 IS_ENABLED(PWM_DEBUG)
>       1 IS_ENABLED(option)
>       1 IS_ENABLED(DEBUG_RANDOM_TRIE)
>       1 IS_ENABLED(DEBUG_CHACHA20POLY1305_SLOW_CHUNK_TEST)

These seem to be "as expected".

>       4 IS_ENABLED(DRM_I915_SELFTEST)
>       1 IS_ENABLED(STRICT_KERNEL_RWX)
>       1 IS_ENABLED(ETHTOOL_NETLINK)

But these are not.

> 
> STRICT_KERNEL_RWX is misused here in ppc
> 
> ---
> 
> Fix pr_warn without newline too.
> 
>  arch/powerpc/mm/book3s64/hash_utils.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 51e3c15f7aff..dd60c5f2b991 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -660,11 +660,10 @@ static void __init htab_init_page_sizes(void)
>  		 * Pick a size for the linear mapping. Currently, we only
>  		 * support 16M, 1M and 4K which is the default
>  		 */
> -		if (IS_ENABLED(STRICT_KERNEL_RWX) &&
> +		if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) &&
>  		    (unsigned long)_stext % 0x1000000) {
>  			if (mmu_psize_defs[MMU_PAGE_16M].shift)
> -				pr_warn("Kernel not 16M aligned, "
> -					"disabling 16M linear map alignment");
> +				pr_warn("Kernel not 16M aligned, disabling 16M linear map alignment\n");
>  			aligned = false;
>  		}

Reviewed-by: Kees Cook <keescook@chromium.org>


-- 
Kees Cook
