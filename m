Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4A8580B0D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 08:16:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsRWK37vqz3bmW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 16:16:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JJPXnIiM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JJPXnIiM;
	dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsRVk0jnhz2xjm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 16:15:57 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id o13so1556894edc.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 23:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yxA3xPJ54KVdQddJAH2cnhPV0N5Cpc7WAM9tFNGyhi4=;
        b=JJPXnIiM4jclKt9lrN7IrlLXt2sEbnZAhTslILWhwIUJpiDD6dF5bt4u8izKRrvvLf
         iezYZ+An6AaEorWrpP/C0f9t7v9MtBXFCd85xR8oTZtUIFQKkqI7fiDqYsS9839Tt8/B
         IcH00db7MWng1iwjgR5WrPQCFriuywi1/k1IU5mIeL9GWQ/hUrkQmHDNuFXuqWByPo9C
         jHKdnSGXCZScto544zcowiPv+7hDk/uG75EqzIHeihNDPicXK/yCAe0+IlTGH0Pik0xb
         A189BB1mqb0R/ETTe1nq6iLuqyQzUfUMvf0USD11M3FMUsAnSJNC45igZKWL4R/RCqxT
         IvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yxA3xPJ54KVdQddJAH2cnhPV0N5Cpc7WAM9tFNGyhi4=;
        b=tLJwEZ4Ur6Xp5yZwdeE8gagFMvm1snIlbd0SPKH6pnIPHh70gs0nLp5ZY0FkrUjsKL
         BewthBWCfblgImVKmJgMMyomZYzWiTSe/9gYCefvI/rz9I+egGmz2Wi4I7k24n1lnsRS
         gC6IWijoNMM8Ei5FGN+4AJaEg1tGKk40Tf8DNrRYUciqU3rRtIZF7Qg703rAE+23BAZS
         MqK8gPqq1ka6mGHEd5j83kE/4W172rvPD+P9n27TEZZdsabWhQg1osK5LtbfAnseVKgT
         MdvCLU7A+45Sgf3Ki3wMWn0IMlbjIRThXso9UPdth5v1FADA7SxHaA0zKjeCyk6LdPQG
         Jj1Q==
X-Gm-Message-State: AJIora9YYtEe2K0TrVtaQaDyHuDUoNVUCJfxRjtwQsLDyWM55rNOtjxO
	5tGMlKfVwgcAXI1YkohVlGfGSQxtumEmS052H6A=
X-Google-Smtp-Source: AGRyM1tCExlQ1iBz/nxdMY5g3ApU82Tinlh8nw9EH0DeQ90YSSAnNoTfG4lBiQ7Hf9fYqxWokeYNlYQoCpLkbFJgY5A=
X-Received: by 2002:a05:6402:254b:b0:43b:d6c3:dd96 with SMTP id
 l11-20020a056402254b00b0043bd6c3dd96mr16199608edb.406.1658816154666; Mon, 25
 Jul 2022 23:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220723214537.2054208-1-yury.norov@gmail.com>
 <20220723214537.2054208-2-yury.norov@gmail.com> <CAHp75VfOmN=cTEs7gbwxZ7W3hXjBo67N4AmHHiDfcVfFzHkMLA@mail.gmail.com>
 <Yt7CJj8r3eo05pKd@yury-laptop> <CAHp75VcGPQkY9ApsX2fi6sK5=3U=0vKbrHZZ3x___wUtgrFRSA@mail.gmail.com>
 <Yt8oK1gUojEbO0WI@yury-laptop> <CAHp75VdJ=FVy6TXTEOci0b2kMrG3z8scDwWTjx8M6+8Y35iSXA@mail.gmail.com>
In-Reply-To: <CAHp75VdJ=FVy6TXTEOci0b2kMrG3z8scDwWTjx8M6+8Y35iSXA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 26 Jul 2022 08:15:18 +0200
Message-ID: <CAHp75Vee+RB5QHKZ6DJgH-M1C9o2wJ155m4gFAK0XUERdCffQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] powerpc: drop dependency on <asm/machdep.h> in archrandom.h
To: Yury Norov <yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Jul 26, 2022 at 8:13 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Jul 26, 2022 at 1:35 AM Yury Norov <yury.norov@gmail.com> wrote:
> > On Mon, Jul 25, 2022 at 11:39:39PM +0200, Andy Shevchenko wrote:
> > > On Mon, Jul 25, 2022 at 6:19 PM Yury Norov <yury.norov@gmail.com> wrote:
> > > > On Mon, Jul 25, 2022 at 09:28:12AM +0200, Andy Shevchenko wrote:
> > > > > On Sun, Jul 24, 2022 at 12:19 AM Yury Norov <yury.norov@gmail.com> wrote:
>
> ...
>
> > > > > >  EXPORT_SYMBOL_GPL(pm_power_off);
> > > > >
> > > > > ^^^ (Note this and read below)
> > > > >
> > > > > ...
> > > > >
> > > > > > +EXPORT_SYMBOL(arch_get_random_seed_long);
> > > > >
> > > > > It can't be like this. Brief browsing of the callees shows that.
> > > >
> > > > Is my understanding correct that you're suggesting to make it GPL?
> > > >
> > > > ppc_md is exported with EXPORT_SYMBOL(), and the function is in header,
> > > > so it's available for non-GPL code now. I don't want to change it.
> > >
> > > The symbols your function calls are GPL. As far as I understand (not a
> > > lawyer!) it logically one may not call GPL and pretend to be non-GPL.
> >
> > Can you explain what you mean in details?
> >
> > The function is:
> >         static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
> >         {
> >                if (ppc_md.get_random_seed)
> >                        return ppc_md.get_random_seed(v);
> >
> >                return false;
> >         }
> >
> > ppc_md is non-GPL:
> >  77 /* The main machine-dep calls structure
> >  78  */
> >  79 struct machdep_calls ppc_md;
> >  80 EXPORT_SYMBOL(ppc_md);
>
> What a mess...
>
> > And get_random_seed is initialized in in arch/powerpc/platforms/powernv/rng.c
> > with different functions that are static and not exported at all.

To be clear, their license is defined in the file: "GPL-2.0-or-later".
But again, not a lawyer, just using my common sense.

> > I don't understand where arch_get_random_seed_long calls GPL...
>
> The ->get_random_seed() (aka "callees" in my previous mail) are all
> GPL (maybe I missed one out of five which is non-GPL, but then it's
> even more of a mess).


-- 
With Best Regards,
Andy Shevchenko
