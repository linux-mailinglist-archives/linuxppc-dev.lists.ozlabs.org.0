Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCBD580288
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 18:20:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls4yq16wqz3c52
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 02:20:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OAhRwqf4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com; envelope-from=yury.norov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OAhRwqf4;
	dkim-atps=neutral
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls4yC1wYrz2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 02:20:01 +1000 (AEST)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-10dc1b16c12so10160517fac.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 09:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hQLvXyUca7YvppsQ/RG7x1mMXVBl9JH0uYVjO129EoI=;
        b=OAhRwqf49aOSneQbfVf4I4qLvceeO8M/evD/LZwSLYqvW7B8dQbWJuIW0uN1KnpNSv
         YI65tmA6muuzZBc1yyFTBAEBnQEmgV8HPXaBQLJENARqrkKEB2MwVDXOpSb1TLlK0dxt
         Sd5wV95AtNOPyeaWSD/x/gI+KkdHGSwUJo6fJ1b5D758/4ImHz0V/2q2ABuMnVxvLbSB
         3jIJcflF6sHkNRLCJ4RkITNR2Nmlq7edFEgMTDx0ho6wFQiEYNXdKOtdkmFw8R6wjF6N
         Q1ZrEO+0WXjfYTfs0iy8D607f994GEMYE6iPUrKJV8Nr6ije8cWuNBAFDk/ZF8Gq2fiH
         GTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hQLvXyUca7YvppsQ/RG7x1mMXVBl9JH0uYVjO129EoI=;
        b=lEsdTBWViHFSUf1AW03N5u0PkRplOVH4GVZuI2CeEvf4hCPwxgTEgawCrra2NwOp2K
         UzAsNdEXvTuqEweJ14xct8AIVr1KB71CkCxvCacA9Fnw8ZEM5Xl1hfNEAFZG3GWiBAcP
         /0zq2VB6IumdvmdBsjZaATlUOmSzumLGsQ9RLcqQp3jb2tE0OD5aJFs294uYAg6ryShN
         /D7/8ADJwImg456OQ2fL5fjZ9laTWLSRm0OlH74eukuP1+X5SakZ8H5MVKda2bWsvMYw
         kon8vjwD6k2eo2UIHlVFmVjDtvE8yw31XfpbXLVrRisJTw01CyqbqBt7YVZo682yGPEh
         c16Q==
X-Gm-Message-State: AJIora/FXP7hGg7ILdClVRgJfAiedX/DkkM2ZLurGoeG0bESsIFqTuU2
	N1B+KYH1Dc/vTWVp+xygu8w=
X-Google-Smtp-Source: AGRyM1tGqTo6breYBO+En54ubKvhgYAREFdPuBVzxVyJ2WucLxqD42sP2P5+1LvQ0LVDquW+hG+ccQ==
X-Received: by 2002:a05:6870:5aa:b0:10d:7d87:25b5 with SMTP id m42-20020a05687005aa00b0010d7d8725b5mr6679486oap.268.1658765994625;
        Mon, 25 Jul 2022 09:19:54 -0700 (PDT)
Received: from localhost ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id b20-20020a056870471400b001048f70e03dsm6264385oaq.15.2022.07.25.09.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 09:19:54 -0700 (PDT)
Date: Mon, 25 Jul 2022 09:17:42 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] powerpc: drop dependency on <asm/machdep.h> in
 archrandom.h
Message-ID: <Yt7CJj8r3eo05pKd@yury-laptop>
References: <20220723214537.2054208-1-yury.norov@gmail.com>
 <20220723214537.2054208-2-yury.norov@gmail.com>
 <CAHp75VfOmN=cTEs7gbwxZ7W3hXjBo67N4AmHHiDfcVfFzHkMLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfOmN=cTEs7gbwxZ7W3hXjBo67N4AmHHiDfcVfFzHkMLA@mail.gmail.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 25, 2022 at 09:28:12AM +0200, Andy Shevchenko wrote:
> On Sun, Jul 24, 2022 at 12:19 AM Yury Norov <yury.norov@gmail.com> wrote:
> >
> > archrandom.h includes <asm/machdep.h> to refer ppc_md. This causes
> > circular header dependency, if generic nodemask.h  includes random.h:
> >
> > In file included from include/linux/cred.h:16,
> >                  from include/linux/seq_file.h:13,
> >                  from arch/powerpc/include/asm/machdep.h:6,
> >                  from arch/powerpc/include/asm/archrandom.h:5,
> >                  from include/linux/random.h:109,
> >                  from include/linux/nodemask.h:97,
> >                  from include/linux/list_lru.h:12,
> >                  from include/linux/fs.h:13,
> >                  from include/linux/compat.h:17,
> >                  from arch/powerpc/kernel/asm-offsets.c:12:
> > include/linux/sched.h:1203:9: error: unknown type name 'nodemask_t'
> >  1203 |         nodemask_t                      mems_allowed;
> >       |         ^~~~~~~~~~
> >
> > Fix it by removing <asm/machdep.h> dependency from archrandom.h
> 
> ...
> 
> >  EXPORT_SYMBOL_GPL(pm_power_off);
> 
> ^^^ (Note this and read below)
> 
> ...
> 
> > +EXPORT_SYMBOL(arch_get_random_seed_long);
> 
> It can't be like this. Brief browsing of the callees shows that.

Is my understanding correct that you're suggesting to make it GPL?

ppc_md is exported with EXPORT_SYMBOL(), and the function is in header,
so it's available for non-GPL code now. I don't want to change it.
