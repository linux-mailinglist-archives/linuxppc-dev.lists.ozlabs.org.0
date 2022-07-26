Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0FA58164A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 17:19:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsgZL4hmZz3cgh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 01:19:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G3K1g/yF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com; envelope-from=yury.norov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G3K1g/yF;
	dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsgYh75Qhz3bmY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 01:19:18 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id m7so11171216qkk.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 08:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oU/PFM076uQxVNOZcY0Zccr8pXxC8l8aoZK0KtggnV0=;
        b=G3K1g/yFwuaU8qm6hN080k/NOsnbTDalKmxaoQZxHy0uwGW3EO23D/QO5vfWXNOBSY
         2Ua82Lrys/l3itci7BrIm9y1Ktc3VjTcJ2fTsb3kX583UaTYzRFMgyYygJLK14l1hjId
         bzwjsLqS9piEuDFTyeeORGOJJk2aHASWXLqGHBawC77mdo+c3AueS1dxDvicH6Jnor0a
         DSJOtjsV9kS3hq092jpDTNmQlAVa7BNUgog8EGhe9j+5L3a4VnlHBwszgdsI9is7pEa7
         wDOpzy9LDFFAc6O45S2vDMJIIi4oHcEFn48pBBWBvhEoB142+tkzftYuAWUQieYMBfss
         qh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oU/PFM076uQxVNOZcY0Zccr8pXxC8l8aoZK0KtggnV0=;
        b=5um+vv17+vWwYlgMXokw3LFI7zNcPHyZE9eY81bBo8SzJ8jwxIoVYpwM2JFiKLXsgg
         EgihSd8vcfVzJHTOS+1GO7kX6ArN8bgVyjM4ozWA7gXGmhepNOxNt+v7wlB8SgsjeUqi
         3BMAKIYkIn3AOAR444UwnKjEPHPJ0WWmFKdjnHSisndcYJwIq0fUczheBXWxHYWuv+te
         bxvEAc0IqG+5x+yKuyaH2suG3J2RjRmHc362kxuJcn6tD31kvt/t6iHgSncVfYQEl8a2
         esBhu5MHmcVFkfZK3ohLHIVPzeS2IxMVzZ1pAnuttuMJjB5LZNXP7JJx7V5ugqQUR4P3
         qiJw==
X-Gm-Message-State: AJIora+48jAQbDQ7bRkboJXCE29DTqmR8g7kSKQrSD/22o+uu1acRuXb
	MYnhrRwXmIaruNTrdSI5nTs=
X-Google-Smtp-Source: AGRyM1u3LM6n0ZHE1JaFrgS+gI2RKjPyiDakaF7wBubPavR1Lo9pw7bdraLDdnmDkZ/HgCUX95FYHA==
X-Received: by 2002:a05:620a:370b:b0:6b6:d59:fcab with SMTP id de11-20020a05620a370b00b006b60d59fcabmr13593141qkb.564.1658848755222;
        Tue, 26 Jul 2022 08:19:15 -0700 (PDT)
Received: from localhost (c-69-254-185-160.hsd1.fl.comcast.net. [69.254.185.160])
        by smtp.gmail.com with ESMTPSA id w5-20020ac86b05000000b00304bc2acc25sm9223681qts.6.2022.07.26.08.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 08:19:12 -0700 (PDT)
Date: Tue, 26 Jul 2022 08:19:09 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc: drop dependency on <asm/machdep.h> in
 archrandom.h
Message-ID: <YuAF7ahr58HjMqXs@yury-laptop>
References: <20220723214537.2054208-1-yury.norov@gmail.com>
 <20220723214537.2054208-2-yury.norov@gmail.com>
 <CAHp75VfOmN=cTEs7gbwxZ7W3hXjBo67N4AmHHiDfcVfFzHkMLA@mail.gmail.com>
 <Yt7CJj8r3eo05pKd@yury-laptop>
 <87edy8bbtp.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87edy8bbtp.fsf@mpe.ellerman.id.au>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Paul Mackerras <paulus@samba.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 26, 2022 at 04:57:38PM +1000, Michael Ellerman wrote:
> Yury Norov <yury.norov@gmail.com> writes:
> > On Mon, Jul 25, 2022 at 09:28:12AM +0200, Andy Shevchenko wrote:
> >> On Sun, Jul 24, 2022 at 12:19 AM Yury Norov <yury.norov@gmail.com> wrote:
> >> >
> >> > archrandom.h includes <asm/machdep.h> to refer ppc_md. This causes
> >> > circular header dependency, if generic nodemask.h  includes random.h:
> >> >
> >> > In file included from include/linux/cred.h:16,
> >> >                  from include/linux/seq_file.h:13,
> >> >                  from arch/powerpc/include/asm/machdep.h:6,
> >> >                  from arch/powerpc/include/asm/archrandom.h:5,
> >> >                  from include/linux/random.h:109,
> >> >                  from include/linux/nodemask.h:97,
> >> >                  from include/linux/list_lru.h:12,
> >> >                  from include/linux/fs.h:13,
> >> >                  from include/linux/compat.h:17,
> >> >                  from arch/powerpc/kernel/asm-offsets.c:12:
> >> > include/linux/sched.h:1203:9: error: unknown type name 'nodemask_t'
> >> >  1203 |         nodemask_t                      mems_allowed;
> >> >       |         ^~~~~~~~~~
> >> >
> >> > Fix it by removing <asm/machdep.h> dependency from archrandom.h
> >> 
> >> ...
> >> 
> >> >  EXPORT_SYMBOL_GPL(pm_power_off);
> >> 
> >> ^^^ (Note this and read below)
> >> 
> >> ...
> >> 
> >> > +EXPORT_SYMBOL(arch_get_random_seed_long);
> >> 
> >> It can't be like this. Brief browsing of the callees shows that.
> >
> > Is my understanding correct that you're suggesting to make it GPL?
> >
> > ppc_md is exported with EXPORT_SYMBOL(), and the function is in header,
> > so it's available for non-GPL code now. I don't want to change it.
> 
> That's true, your change maintains the status quo.
> 
> But I think we actually don't need it exported to modules, I think it's
> a private detail of the RNG <-> architecture interface, not something
> that modules should be calling.
> 
> So I think it's OK to drop the EXPORT_SYMBOL, either in this patch or a
> subsequent one if you don't want to rebase.

OK, changed.
