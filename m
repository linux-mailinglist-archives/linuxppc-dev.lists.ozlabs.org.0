Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3DA851D01
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 19:42:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RLUt8zC8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYYGn2vXVz3dWZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 05:42:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RLUt8zC8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYYG447jYz3cCb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 05:41:47 +1100 (AEDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-6047a616bfeso31048907b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 10:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707763304; x=1708368104; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q/xVSDZYaBQvoJYVHKQOA1UWqFuvlWGZY8Hn0s/4Hjc=;
        b=RLUt8zC8jfMcqGDi4KH8yDtg0kX09TWFRzPP7IvBN0mPppPnKoIf0Ah4nxHMCGUDbv
         kVYdAUaUCfGt7IbpwzNn2ZTVWFhGg9DYZC78J5CtxgOMg3n+uRjleeCxXdBvtR7YsmZs
         LeI0B39tOP7Z7uIvpAqLoMohrCtznOz/rzGzwj0prLN2JSVLra/9b1Qwj8IDzrHBHViE
         BikFbdaD4BatMbe2e2xlEfuOIzI8i5SVahT4fkwzkD2Sdq2fPuVeIpViacnBwGEZp0yd
         0LsiLVYR0VcnVuhx8oOlBTNdsNnZRnAnlUj/PzajhCeFLvoEXoNYKhyQed8ZcUvZwplp
         K/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707763304; x=1708368104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/xVSDZYaBQvoJYVHKQOA1UWqFuvlWGZY8Hn0s/4Hjc=;
        b=nMYw+jHG7/aY7ED+o57OY+6IgrkWijR4T0X8PNLWsTEAkpaOUJZvBt8WpDkzxB4xZ0
         hV8C56faz+szuGjctYJ54idpIV41e/ZXeDtzmihWuUrYhLi4Q6wR327OCuJ9OZDfEMl4
         BaD04Dao6albgqekECiJJ+Hp+7GLV2h83D8pORS1geWwKSIiICg+AcoNb9GSWq1OM16m
         VKtnjesPeouS15NCNLBGEbSnHWLskPo59+CQ/R254MQsCg3w94qJ2pv2Fg9DsaDhibMt
         6NFWFOu1qdYYpX8ZVcGkpL1e0qNODkw5Vi++xUnrKNDfqYMAHCfD/3aqJ1Q3s/qpQIxG
         pOKA==
X-Gm-Message-State: AOJu0YwkeIF3nVenkQYe10Fj0HajQlmBrpEz1puPDLFwSU1iP0ZOjzka
	G/z8iYpNLZ3Q/snxdKxOpKQB1oqn+1pTBDkHl8pozg1YjvOYUXRw
X-Google-Smtp-Source: AGHT+IE4kEey/v26XmyZnftxIjL7x0I737WxMrnoVxzH/S5xEtgVM/RkCDoIclSFu6yTe+ozzw+42A==
X-Received: by 2002:a05:690c:2884:b0:607:776e:57ca with SMTP id ee4-20020a05690c288400b00607776e57camr1204447ywb.21.1707763303849;
        Mon, 12 Feb 2024 10:41:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUuuzxM51dvMxII/HjtZa/eTstnf+CqE9iMkwt0BDmoRYajZd5C8HSJs3J5N0LP5QFm/7vdiQDiqyHkXGN9k4vYDo69uiLSJ/cmK2+VlE3q1cTCLpG0Pz8fzZn2SxVpeNQ0r2au55xgFSQZH4hklwKs/L2yfpCPchxpsOP9GHzEAmoRaODFZSg825b9/JxA5ZdYKmBY5TlXZUVGq0DutlCcq+sAlfdqpawazDnL/ol/s0DSTeWNdugCAUI8bMCrNrWQa5rA14VcLQwm7gJEoZksNW7YuMPssrEsui2yljM9Xli4eyaInRLWcx+ff4HbcNCANRrxh8cTn9uwHW66lIcrKwaNpmMt7U1uRN9fi0So6QB4kDTC8E/WaNr0s9DMK9xnQNCMf7dRROGL739EOCXo5sk13dFZloOvefb01OTTuKWSvzG3t9gLzeeashNatnd18I1avbfL9hpUCOD6MsIhMVLsJHP2iIJF6yitA==
Received: from localhost ([2601:344:8301:57f0:85b5:dd54:cd99:b])
        by smtp.gmail.com with ESMTPSA id eo3-20020a05690c2c0300b0060764876b24sm411700ywb.123.2024.02.12.10.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 10:41:43 -0800 (PST)
Date: Mon, 12 Feb 2024 10:41:42 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 RESEND 4/6] bitmap: Introduce bitmap_off()
Message-ID: <ZcpmZh8td8DNFzin@yury-ThinkPad>
References: <20240212075646.19114-1-herve.codina@bootlin.com>
 <20240212075646.19114-5-herve.codina@bootlin.com>
 <ZcplW2mXObOZUtR7@yury-ThinkPad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZcplW2mXObOZUtR7@yury-ThinkPad>
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

On Mon, Feb 12, 2024 at 10:37:18AM -0800, Yury Norov wrote:
> On Mon, Feb 12, 2024 at 08:56:32AM +0100, Herve Codina wrote:
> > The bitmap_onto() function translates one bitmap relative to another but
> > no function are present to perform the reverse translation.
> > 
> > Introduce bitmap_off() to fill this hole.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  include/linux/bitmap.h |  3 +++
> >  lib/bitmap.c           | 42 ++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 45 insertions(+)
> > 
> > diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> > index 99451431e4d6..5ecfcbbc91f4 100644
> > --- a/include/linux/bitmap.h
> > +++ b/include/linux/bitmap.h
> > @@ -65,6 +65,7 @@ struct device;
> >   *  bitmap_remap(dst, src, old, new, nbits)     *dst = map(old, new)(src)
> >   *  bitmap_bitremap(oldbit, old, new, nbits)    newbit = map(old, new)(oldbit)
> >   *  bitmap_onto(dst, orig, relmap, nbits)       *dst = orig relative to relmap
> > + *  bitmap_off(dst, orig, relmap, nbits)        *dst = bitmap_onto() reverse operation
> >   *  bitmap_fold(dst, orig, sz, nbits)           dst bits = orig bits mod sz
> >   *  bitmap_parse(buf, buflen, dst, nbits)       Parse bitmap dst from kernel buf
> >   *  bitmap_parse_user(ubuf, ulen, dst, nbits)   Parse bitmap dst from user buf
> > @@ -208,6 +209,8 @@ int bitmap_bitremap(int oldbit,
> >  		const unsigned long *old, const unsigned long *new, int bits);
> >  void bitmap_onto(unsigned long *dst, const unsigned long *orig,
> >  		const unsigned long *relmap, unsigned int bits);
> > +void bitmap_off(unsigned long *dst, const unsigned long *orig,
> > +		const unsigned long *relmap, unsigned int bits);
> >  void bitmap_fold(unsigned long *dst, const unsigned long *orig,
> >  		unsigned int sz, unsigned int nbits);
> >  
> > diff --git a/lib/bitmap.c b/lib/bitmap.c
> > index 2feccb5047dc..71343967335e 100644
> > --- a/lib/bitmap.c
> > +++ b/lib/bitmap.c
> > @@ -682,6 +682,48 @@ void bitmap_onto(unsigned long *dst, const unsigned long *orig,
> >  }
> >  EXPORT_SYMBOL(bitmap_onto);
> >  
> > +/**
> > + * bitmap_off - revert operation done by bitmap_onto()
> 
> This is definitely a bad name. I've no a better idea, but even
> bitmap_onto_revert() would be better.
> 
> > + *     @dst: resulting translated bitmap
> > + *     @orig: original untranslated bitmap
> > + *     @relmap: bitmap relative to which translated
> > + *     @bits: number of bits in each of these bitmaps
> > + *
> > + * Suppose onto computed using bitmap_onto(onto, src, relmap, n)
> > + * The operation bitmap_off(result, onto, relmap, n) leads to a
> > + * result equal or equivalent to src.
> 
> Agree with Rasmus. This should be well tested.
> 
> > + * The result can be 'equivalent' because bitmap_onto() and
> > + * bitmap_off() are not bijective.
> > + * The result and src values are equivalent in that sense that a
> > + * call to bitmap_onto(onto, src, relmap, n) and a call to
> > + * bitmap_onto(onto, result, relmap, n) will lead to the same onto
> > + * value.
> 
> Did you mean "a call to bitmap_onto(onto, src, relmap, n) and a
> call to bitmap_off(onto, result, relmap, n)"? 
> 
> I think the whole paragraph adds more confusion than explanations.
> If a new function is supposed to revert the result of some other
> function, I'd better focus on testing that it actually reverts as
> advertised, and keep description as brief as possible.
> 
> > + * If either of @orig or @relmap is empty (no set bits), then @dst
> > + * will be returned empty.
> 
> Is this an exception from the 'revert' policy? Doesn't look like that.
> So, what for mentioning this specific case?
> 
> > + * All bits in @dst not set by the above rule are cleared.
> 
> The above rule is about empty @orig and @relmap, not about setting
> bits. What did you mean here?
> 
> > + */
> > +void bitmap_off(unsigned long *dst, const unsigned long *orig,
> > +		const unsigned long *relmap, unsigned int bits)
> > +{
> > +	unsigned int n, m;      /* same meaning as in above comment */
> 
> In the above comment, n means the size of bitmaps, and m is not
> mentioned at all.
> 
> > +	if (dst == orig)        /* following doesn't handle inplace mappings */
> > +		return;
> > +	bitmap_zero(dst, bits);
> 
> Can you add an empty line after 'return'.
> 
> > +	m = 0;
> > +	for_each_set_bit(n, relmap, bits) {
> > +		/* m == bitmap_pos_to_ord(relmap, n, bits) */
> 
> Don't think we need this comment here. If you want to underline that
> m tracks bit order, can you just give it a more explanatory name. For
> example, 'bit_order'.
> 
> > +		if (test_bit(n, orig))
> > +			set_bit(m, dst);
> > +		m++;

Forgot to mention - we need a __set_bit() and __test_bit(), because the
whole function is not atomic. This applies to the bitmap_onto() as
well. Can you please send a patch fixing it for bitmap_onto() in the
next iteration?

> > +	}
> > +}
> > +EXPORT_SYMBOL(bitmap_off);
> > +
> >  #ifdef CONFIG_NUMA
> >  /**
> >   * bitmap_fold - fold larger bitmap into smaller, modulo specified size
> > -- 
> > 2.43.0
