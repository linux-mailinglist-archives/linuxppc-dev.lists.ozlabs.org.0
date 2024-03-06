Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8394873769
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 14:12:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TNCh7SRz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqXrx4kxXz3vX3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 00:12:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TNCh7SRz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqXrF1tx3z3bsP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 00:11:23 +1100 (AEDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-6098b9ed2a3so43957537b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Mar 2024 05:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709730680; x=1710335480; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=roOaXgRVJ2UD+hzpU1VpjqNtNVV/0xa+8QzgjG/otYQ=;
        b=TNCh7SRzs+JqeQDt3uW4vaQgE0IwX4rk5VqxZOOCK+hoIWq11qku0VWhWBjjx3iY/f
         V4hEFWYPwW3NWXhPbm+H9u+VmFnfjmRZLq8GGqTZVYC0/S79GjQn18JvBT0NzaKT6ueU
         rw4YLy6xGM/NPsvXz1p7s35Do3LadCcpWMY65FBEQEHHuTZ7WXKh1ZA3ATJafEXp/1Gi
         lIfF9eKHQRZBoYe+heZ7r4RRsnZuTu+9i9PuMseXWf46ZZtpYospVA6kpzU6wjBYvh0m
         3cb6eMEV4XMHSXV9U03KGMPq1rdLLASRDAM/zaqVA5y4SfXKgk/Wbsz0F5d81Z6zl1fj
         rcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709730680; x=1710335480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roOaXgRVJ2UD+hzpU1VpjqNtNVV/0xa+8QzgjG/otYQ=;
        b=VndgGuVkQ3l/2YohbZm6O09Jo5DAezsbk8CfsaR5ZXd8uP17klogogSNljx24hwzJq
         2WbQAT6SIR2N7A0qyPYl3RQx+mLUlIhNb9XsXslgb+LpF5hcarfiyOQ0TynSRJALmk3l
         UHnA2Vp84+/KaeIHi/JO5sJnWYqYgB9UQq9LfkJRaLthPUJqCqmCuBNpuhNQwTvtrfsn
         s4oj4W8RDk1T0kkICFUfvhAKLJOs8BoUTa59UHiwE125D5vvCbhRCU0e3vVerq+iID3y
         Xghr8ywZZHCCTtmwkcC8fkVHMc4oMfiORVoqY0f+DKz1uHeXc/0V6rBSjfx/mbAAl9IT
         HGdg==
X-Forwarded-Encrypted: i=1; AJvYcCUUZIke4OHDVwrKRNdU/ECe14R6Ux4Gmo1jeL58GLB6fnnGkHAbeLCJciHu5y4ZqgbpethuIHjZVrzdSHU0rBsoCunV1kwgMTrWua1nVw==
X-Gm-Message-State: AOJu0YwVphgoLnFxuLCq1V9H553gaxNGJDDhHN8u1USgXCJs8o3zAnkR
	VsElvP1kmOdOc695nHavJFGwdbEGcckYv0gCxBsCv4HflHrb0DzC
X-Google-Smtp-Source: AGHT+IEOJMfd2VqHMJoD/p66gxEjQrJ2mrzfAgDuets3O0GNPreXnXlTKkPtVEu04LRe8elaDBPJdA==
X-Received: by 2002:a0d:c245:0:b0:608:b7d6:753f with SMTP id e66-20020a0dc245000000b00608b7d6753fmr15139269ywd.33.1709730680473;
        Wed, 06 Mar 2024 05:11:20 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:a708:4ac5:2d2f:c5bb])
        by smtp.gmail.com with ESMTPSA id j9-20020a81c409000000b00608aeba302dsm3670884ywi.14.2024.03.06.05.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 05:11:20 -0800 (PST)
Date: Wed, 6 Mar 2024 05:11:19 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v6 3/5] lib/bitmap: Introduce bitmap_scatter() and
 bitmap_gather() helpers
Message-ID: <Zehrd/VgW5AnfJEu@yury-ThinkPad>
References: <20240306080726.167338-1-herve.codina@bootlin.com>
 <20240306080726.167338-4-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306080726.167338-4-herve.codina@bootlin.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 06, 2024 at 09:07:19AM +0100, Herve Codina wrote:
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> These helpers scatters or gathers a bitmap with the help of the mask
> position bits parameter.
> 
> bitmap_scatter() does the following:
>   src:  0000000001011010
>                   ||||||
>            +------+|||||
>            |  +----+||||
>            |  |+----+|||
>            |  ||   +-+||
>            |  ||   |  ||
>   mask: ...v..vv...v..vv
>         ...0..11...0..10
>   dst:  0000001100000010
> 
> and bitmap_gather() performs this one:
>    mask: ...v..vv...v..vv
>    src:  0000001100000010
>             ^  ^^   ^   0
>             |  ||   |  10
>             |  ||   > 010
>             |  |+--> 1010
>             |  +--> 11010
>             +----> 011010
>    dst:  0000000000011010
> 
> bitmap_gather() can the seen as the reverse bitmap_scatter() operation.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Link: https://lore.kernel.org/lkml/20230926052007.3917389-3-andriy.shevchenko@linux.intel.com/
> Co-developed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Signed-off-by: Yury Norov <yury.norov@gmail.com>

Would you like to move this with the rest of the series? If so please
pull my Sof-by, otherwise I can move it with bitmap-for-next.

> ---
>  include/linux/bitmap.h | 101 +++++++++++++++++++++++++++++++++++++++++
>  lib/test_bitmap.c      |  42 +++++++++++++++++
>  2 files changed, 143 insertions(+)
> 
> diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> index 99451431e4d6..049ba20911c5 100644
> --- a/include/linux/bitmap.h
> +++ b/include/linux/bitmap.h
> @@ -62,6 +62,8 @@ struct device;
>   *  bitmap_shift_left(dst, src, n, nbits)       *dst = *src << n
>   *  bitmap_cut(dst, src, first, n, nbits)       Cut n bits from first, copy rest
>   *  bitmap_replace(dst, old, new, mask, nbits)  *dst = (*old & ~(*mask)) | (*new & *mask)
> + *  bitmap_scatter(dst, src, mask, nbits)	*dst = map(dense, sparse)(src)
> + *  bitmap_gather(dst, src, mask, nbits)	*dst = map(sparse, dense)(src)
>   *  bitmap_remap(dst, src, old, new, nbits)     *dst = map(old, new)(src)
>   *  bitmap_bitremap(oldbit, old, new, nbits)    newbit = map(old, new)(oldbit)
>   *  bitmap_onto(dst, orig, relmap, nbits)       *dst = orig relative to relmap
> @@ -487,6 +489,105 @@ static inline void bitmap_replace(unsigned long *dst,
>  		__bitmap_replace(dst, old, new, mask, nbits);
>  }
>  
> +/**
> + * bitmap_scatter - Scatter a bitmap according to the given mask
> + * @dst: scattered bitmap
> + * @src: gathered bitmap
> + * @mask: mask representing bits to assign to in the scattered bitmap
> + * @nbits: number of bits in each of these bitmaps
> + *
> + * Scatters bitmap with sequential bits according to the given @mask.
> + *
> + * Example:
> + * If @src bitmap = 0x005a, with @mask = 0x1313, @dst will be 0x0302.
> + *
> + * Or in binary form
> + * @src			@mask			@dst
> + * 0000000001011010	0001001100010011	0000001100000010
> + *
> + * (Bits 0, 1, 2, 3, 4, 5 are copied to the bits 0, 1, 4, 8, 9, 12)
> + *
> + * A more 'visual' description of the operation:
> + * src:  0000000001011010
> + *                 ||||||
> + *          +------+|||||
> + *          |  +----+||||
> + *          |  |+----+|||
> + *          |  ||   +-+||
> + *          |  ||   |  ||
> + * mask: ...v..vv...v..vv
> + *       ...0..11...0..10
> + * dst:  0000001100000010
> + *
> + * A relationship exists between bitmap_scatter() and bitmap_gather().
> + * bitmap_gather() can be seen as the 'reverse' bitmap_scatter() operation.
> + * See bitmap_scatter() for details related to this relationship.
> + */
> +static inline void bitmap_scatter(unsigned long *dst, const unsigned long *src,
> +				  const unsigned long *mask, unsigned int nbits)
> +{
> +	unsigned int n = 0;
> +	unsigned int bit;
> +
> +	bitmap_zero(dst, nbits);
> +
> +	for_each_set_bit(bit, mask, nbits)
> +		__assign_bit(bit, dst, test_bit(n++, src));
> +}
> +
> +/**
> + * bitmap_gather - Gather a bitmap according to given mask
> + * @dst: gathered bitmap
> + * @src: scattered bitmap
> + * @mask: mask representing bits to extract from in the scattered bitmap
> + * @nbits: number of bits in each of these bitmaps
> + *
> + * Gathers bitmap with sparse bits according to the given @mask.
> + *
> + * Example:
> + * If @src bitmap = 0x0302, with @mask = 0x1313, @dst will be 0x001a.
> + *
> + * Or in binary form
> + * @src			@mask			@dst
> + * 0000001100000010	0001001100010011	0000000000011010
> + *
> + * (Bits 0, 1, 4, 8, 9, 12 are copied to the bits 0, 1, 2, 3, 4, 5)
> + *
> + * A more 'visual' description of the operation:
> + * mask: ...v..vv...v..vv
> + * src:  0000001100000010
> + *          ^  ^^   ^   0
> + *          |  ||   |  10
> + *          |  ||   > 010
> + *          |  |+--> 1010
> + *          |  +--> 11010
> + *          +----> 011010
> + * dst:  0000000000011010
> + *
> + * A relationship exists between bitmap_gather() and bitmap_scatter(). See
> + * bitmap_scatter() for the bitmap scatter detailed operations.
> + * Suppose scattered computed using bitmap_scatter(scattered, src, mask, n).
> + * The operation bitmap_gather(result, scattered, mask, n) leads to a result
> + * equal or equivalent to src.
> + *
> + * The result can be 'equivalent' because bitmap_scatter() and bitmap_gather()
> + * are not bijective.
> + * The result and src values are equivalent in that sense that a call to
> + * bitmap_scatter(res, src, mask, n) and a call to
> + * bitmap_scatter(res, result, mask, n) will lead to the same res value.
> + */
> +static inline void bitmap_gather(unsigned long *dst, const unsigned long *src,
> +				 const unsigned long *mask, unsigned int nbits)
> +{
> +	unsigned int n = 0;
> +	unsigned int bit;
> +
> +	bitmap_zero(dst, nbits);
> +
> +	for_each_set_bit(bit, mask, nbits)
> +		__assign_bit(n++, dst, test_bit(bit, src));
> +}
> +
>  static inline void bitmap_next_set_region(unsigned long *bitmap,
>  					  unsigned int *rs, unsigned int *re,
>  					  unsigned int end)
> diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
> index 65f22c2578b0..6b2b33579f56 100644
> --- a/lib/test_bitmap.c
> +++ b/lib/test_bitmap.c
> @@ -380,6 +380,47 @@ static void __init test_replace(void)
>  	expect_eq_bitmap(bmap, exp3_1_0, nbits);
>  }
>  
> +static const unsigned long sg_mask[] __initconst = {
> +	BITMAP_FROM_U64(0x000000000000035aULL),
> +};
> +
> +static const unsigned long sg_src[] __initconst = {
> +	BITMAP_FROM_U64(0x0000000000000667ULL),
> +};
> +
> +static const unsigned long sg_gather_exp[] __initconst = {
> +	BITMAP_FROM_U64(0x0000000000000029ULL),
> +};
> +
> +static const unsigned long sg_scatter_exp[] __initconst = {
> +	BITMAP_FROM_U64(0x000000000000021aULL),
> +};
> +
> +static void __init test_bitmap_sg(void)
> +{
> +	unsigned int nbits = 64;
> +	DECLARE_BITMAP(bmap_gather, 100);
> +	DECLARE_BITMAP(bmap_scatter, 100);
> +	DECLARE_BITMAP(bmap_tmp, 100);
> +	DECLARE_BITMAP(bmap_res, 100);
> +
> +	/* Simple gather call */
> +	bitmap_zero(bmap_gather, 100);
> +	bitmap_gather(bmap_gather, sg_src, sg_mask, nbits);
> +	expect_eq_bitmap(sg_gather_exp, bmap_gather, nbits);
> +
> +	/* Simple scatter call */
> +	bitmap_zero(bmap_scatter, 100);
> +	bitmap_scatter(bmap_scatter, sg_src, sg_mask, nbits);
> +	expect_eq_bitmap(sg_scatter_exp, bmap_scatter, nbits);
> +
> +	/* Scatter/gather relationship */
> +	bitmap_zero(bmap_tmp, 100);
> +	bitmap_gather(bmap_tmp, bmap_scatter, sg_mask, nbits);
> +	bitmap_scatter(bmap_res, bmap_tmp, sg_mask, nbits);
> +	expect_eq_bitmap(bmap_scatter, bmap_res, nbits);
> +}
> +
>  #define PARSE_TIME	0x1
>  #define NO_LEN		0x2
>  
> @@ -1252,6 +1293,7 @@ static void __init selftest(void)
>  	test_copy();
>  	test_bitmap_region();
>  	test_replace();
> +	test_bitmap_sg();
>  	test_bitmap_arr32();
>  	test_bitmap_arr64();
>  	test_bitmap_parse();
> -- 
> 2.43.0
