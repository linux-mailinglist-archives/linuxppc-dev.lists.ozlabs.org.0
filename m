Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 983F7851CE9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 19:38:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BAFMoZ1L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYY9f3n1kz3dW4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 05:37:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BAFMoZ1L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYY8x2RGMz3cCb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 05:37:21 +1100 (AEDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-603fd31f5c2so37882427b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 10:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707763038; x=1708367838; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Urk/xvX+UKbKGSqpVvdQe9PJXR++Pgpk6nNhD2JHitg=;
        b=BAFMoZ1LdOljZLMXM5rcHLVurThW454OxEeopsL1xFaaAl55dpO2rvJWMxtnSSa6Yd
         kGj5JhRvoEUULQNWQMS5bnmpQ34tNoHy+eS91BUIMeG8W1bty2vNMk+PLsIEEwubp9IY
         lts73mcdHL3k8PaeNcPKFpktC9v4b7jzBgON3/xjYA0i3HMRz+iUUFD0tbIhgXjUKdP1
         SfoHhQ/q7Dsk9cLVWSiyIEZAYiq33AgfRhG27t2tCxm4t97UxPHwYE5gpzBu2Mrtu1Q1
         /9eKFbIIJu4HjfB8s+MXICg+jn/FldBHMbUVWSk0XlT1AtfDMTezZqbBiq7DF4VP6hJh
         qPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707763038; x=1708367838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Urk/xvX+UKbKGSqpVvdQe9PJXR++Pgpk6nNhD2JHitg=;
        b=TslqkGckNbGsRipodZIauG5zmXxOjA1QK8PqhmZznKHPY2eDlpQRYfdf9WZCDH4X/B
         JFYPnCy8aF+FEmOMNvtlCn32l9CQyljqE0bXxTWnkSY/Cv7JInRkOY0JwwjgV6Hk+qdm
         ftXYwisUtYq9KlbruqLbVaNVtxSKOGYY67LT6h86gcNW5LV9YA0t62wo6Yh245RaTc0+
         Z080mcC0zWQwN4yzPS6eqFZj16Ip15YnVJeaj3ew5K9C4Ot2Im4ChqK8U5/qtpcBB83Z
         CiVREk11/9FtB7X/BrFlLfmdGrBOVaJUMt5Sr+c7lwYbbjU3foANyH5Utma9wpIW00ZN
         Vxpg==
X-Gm-Message-State: AOJu0YzktYr4Jho0Uqn3aU5atTqWbHNlAPlkNRmqH9qIUvNtmbFZmPan
	bzZMpXJjpKL0nhVhmK4YQqeUI6oYm7xWjKAVGwwjIqbh5g1gPM1e
X-Google-Smtp-Source: AGHT+IEpd+QbpXDB2ycV1t5rD40xn6kwWMLP7zDSBdWBR9zSWASGH0Ugsa2ib4yux5Jw29DdKmxVfQ==
X-Received: by 2002:a0d:e845:0:b0:604:7bab:dac1 with SMTP id r66-20020a0de845000000b006047babdac1mr280436ywe.15.1707763037858;
        Mon, 12 Feb 2024 10:37:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX3NpMjINqr6ODt3JXMsBQ2F7ZuSuRpJICxX/qJB2m9t0QalgdEtK0ncdpG0yVeSPZ/yP3zUrMapSAKaZj9rpBe2GZNRkETsKAD5rS+mENVDa89pdt9a4n7q5aiKdA8qolC3e31vAcyVX+cuf8qFx4B15M9rwRVbFa5hxEXSqiCUoIrFiCHBnlTsobXFzfu5JZqOvpN8C/IOL4rfQQvyXw2sC9ehwfFsMfM16UF7E4q50Le0Cff2D1q0R9DCqAt5O9uG1NvIaijR34dj+/roSDDzr3rRkVM6ODiyZ4WRI2+VHGFBJ5y/6mQUfeO2lvlCZ3yAWWjPGXPFXngsUduXc6DFtsriqURsX64W2MlhIGwJuy1fN8J45LYDAOj+QWczUN4sskDZF6ZglcGuUXogIWlE8WHANXvkL2c3kfA9+do50Z2EksJwGCMvEy3Q1EsivNvnIIVTjLsHGND3764tAOf/861BfL4wn/iJrO6QQ==
Received: from localhost ([2601:344:8301:57f0:85b5:dd54:cd99:b])
        by smtp.gmail.com with ESMTPSA id n133-20020a81728b000000b006041221d0ccsm1275634ywc.68.2024.02.12.10.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 10:37:17 -0800 (PST)
Date: Mon, 12 Feb 2024 10:37:15 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 RESEND 4/6] bitmap: Introduce bitmap_off()
Message-ID: <ZcplW2mXObOZUtR7@yury-ThinkPad>
References: <20240212075646.19114-1-herve.codina@bootlin.com>
 <20240212075646.19114-5-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212075646.19114-5-herve.codina@bootlin.com>
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

On Mon, Feb 12, 2024 at 08:56:32AM +0100, Herve Codina wrote:
> The bitmap_onto() function translates one bitmap relative to another but
> no function are present to perform the reverse translation.
> 
> Introduce bitmap_off() to fill this hole.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  include/linux/bitmap.h |  3 +++
>  lib/bitmap.c           | 42 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> index 99451431e4d6..5ecfcbbc91f4 100644
> --- a/include/linux/bitmap.h
> +++ b/include/linux/bitmap.h
> @@ -65,6 +65,7 @@ struct device;
>   *  bitmap_remap(dst, src, old, new, nbits)     *dst = map(old, new)(src)
>   *  bitmap_bitremap(oldbit, old, new, nbits)    newbit = map(old, new)(oldbit)
>   *  bitmap_onto(dst, orig, relmap, nbits)       *dst = orig relative to relmap
> + *  bitmap_off(dst, orig, relmap, nbits)        *dst = bitmap_onto() reverse operation
>   *  bitmap_fold(dst, orig, sz, nbits)           dst bits = orig bits mod sz
>   *  bitmap_parse(buf, buflen, dst, nbits)       Parse bitmap dst from kernel buf
>   *  bitmap_parse_user(ubuf, ulen, dst, nbits)   Parse bitmap dst from user buf
> @@ -208,6 +209,8 @@ int bitmap_bitremap(int oldbit,
>  		const unsigned long *old, const unsigned long *new, int bits);
>  void bitmap_onto(unsigned long *dst, const unsigned long *orig,
>  		const unsigned long *relmap, unsigned int bits);
> +void bitmap_off(unsigned long *dst, const unsigned long *orig,
> +		const unsigned long *relmap, unsigned int bits);
>  void bitmap_fold(unsigned long *dst, const unsigned long *orig,
>  		unsigned int sz, unsigned int nbits);
>  
> diff --git a/lib/bitmap.c b/lib/bitmap.c
> index 2feccb5047dc..71343967335e 100644
> --- a/lib/bitmap.c
> +++ b/lib/bitmap.c
> @@ -682,6 +682,48 @@ void bitmap_onto(unsigned long *dst, const unsigned long *orig,
>  }
>  EXPORT_SYMBOL(bitmap_onto);
>  
> +/**
> + * bitmap_off - revert operation done by bitmap_onto()

This is definitely a bad name. I've no a better idea, but even
bitmap_onto_revert() would be better.

> + *     @dst: resulting translated bitmap
> + *     @orig: original untranslated bitmap
> + *     @relmap: bitmap relative to which translated
> + *     @bits: number of bits in each of these bitmaps
> + *
> + * Suppose onto computed using bitmap_onto(onto, src, relmap, n)
> + * The operation bitmap_off(result, onto, relmap, n) leads to a
> + * result equal or equivalent to src.

Agree with Rasmus. This should be well tested.

> + * The result can be 'equivalent' because bitmap_onto() and
> + * bitmap_off() are not bijective.
> + * The result and src values are equivalent in that sense that a
> + * call to bitmap_onto(onto, src, relmap, n) and a call to
> + * bitmap_onto(onto, result, relmap, n) will lead to the same onto
> + * value.

Did you mean "a call to bitmap_onto(onto, src, relmap, n) and a
call to bitmap_off(onto, result, relmap, n)"? 

I think the whole paragraph adds more confusion than explanations.
If a new function is supposed to revert the result of some other
function, I'd better focus on testing that it actually reverts as
advertised, and keep description as brief as possible.

> + * If either of @orig or @relmap is empty (no set bits), then @dst
> + * will be returned empty.

Is this an exception from the 'revert' policy? Doesn't look like that.
So, what for mentioning this specific case?

> + * All bits in @dst not set by the above rule are cleared.

The above rule is about empty @orig and @relmap, not about setting
bits. What did you mean here?

> + */
> +void bitmap_off(unsigned long *dst, const unsigned long *orig,
> +		const unsigned long *relmap, unsigned int bits)
> +{
> +	unsigned int n, m;      /* same meaning as in above comment */

In the above comment, n means the size of bitmaps, and m is not
mentioned at all.

> +	if (dst == orig)        /* following doesn't handle inplace mappings */
> +		return;
> +	bitmap_zero(dst, bits);

Can you add an empty line after 'return'.

> +	m = 0;
> +	for_each_set_bit(n, relmap, bits) {
> +		/* m == bitmap_pos_to_ord(relmap, n, bits) */

Don't think we need this comment here. If you want to underline that
m tracks bit order, can you just give it a more explanatory name. For
example, 'bit_order'.

> +		if (test_bit(n, orig))
> +			set_bit(m, dst);
> +		m++;
> +	}
> +}
> +EXPORT_SYMBOL(bitmap_off);
> +
>  #ifdef CONFIG_NUMA
>  /**
>   * bitmap_fold - fold larger bitmap into smaller, modulo specified size
> -- 
> 2.43.0
