Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF5F580AFD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 08:14:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsRTY4fSrz3c5B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 16:14:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RpDIX/K5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RpDIX/K5;
	dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsRSs3SXJz2xjm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 16:14:19 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id p5so5497423edi.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 23:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GZbiLt6v06YsvfiDARoxK3cxvf7NmvFXziCgf+/LbTk=;
        b=RpDIX/K5q/Bl7BEGyBwELYytBgXuUGBOrA4Awf+Oe6r3Yc3oR4VHx26WYehcpeQpDZ
         t+2QevKmkXHCb/uqf1iXzZLxFWr6k1AirceB4FEsvpmsWbaeDtpbqiyk52R35dKLz2zR
         qz7UTMmRoCEv57SlBTAc+/5rUGiQGIhrDlBOA1Z+q9QEBoPpPrVAs3Fn04dabwCTLxTC
         FuNa9brZRbapRlPxWaLrSvwkns9nekcOIKR2ilIAGIDc6ElHZgTgGE2dG4F8KJV/MfEb
         AWv6mGn2+TBFRMzLQZls2LXxkOeRk3IpFj8bbpPWrc6VSuo/fYapaOOxs6Y8nBIpEqE6
         2P4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GZbiLt6v06YsvfiDARoxK3cxvf7NmvFXziCgf+/LbTk=;
        b=gNohI/OZApwL4OyP99r98UeZ+dVDHZ3zcM/JrvheG73uW0HAhVuUklmV1sFsuQMBkd
         WQ9qNy+d4WQc8KexMlMLdB+YT5KgooEyafBYuIIJGlSTOAhjSbkeC6byV8y0tU0UMHvV
         lNVqGgtzJeKYVoBlRNRBuZ+QQ+xMby7NzchMP5bkh7vdsUyAFfdVUJEjGDOx+A0LBJ60
         8wk1Ubrit98gbmAv3gJvnhpBZg1qX40WRU31+6DebmUKqbgXnKlH4/O+4X0JXCs4zR0G
         AVqi1u5uGn2Dp1SDuwFy04EjecoDDezzooNLrHLDzxDhsh418sWoaMptYsTLBTSrkf+N
         dgwQ==
X-Gm-Message-State: AJIora+C2gOaH13uHltDtc9C0P4MBOvtogltKTUgSCRR6SIOxuqgEffr
	/1flPJxR7aNgbCALDCM3gXsD9Zp+YR1Z+wiLFXQ=
X-Google-Smtp-Source: AGRyM1ulCzLFsef2K56zhTx/LQiZQ8imQKpRFEj5eB0Ji8EAHbSqFNJJK5gwMJ/Z6zyXqEt1tbNoG2FEKWeeRNKDc4E=
X-Received: by 2002:a05:6402:d53:b0:43b:a0cf:d970 with SMTP id
 ec19-20020a0564020d5300b0043ba0cfd970mr16197233edb.277.1658816053464; Mon, 25
 Jul 2022 23:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220723214537.2054208-1-yury.norov@gmail.com>
 <20220723214537.2054208-2-yury.norov@gmail.com> <CAHp75VfOmN=cTEs7gbwxZ7W3hXjBo67N4AmHHiDfcVfFzHkMLA@mail.gmail.com>
 <Yt7CJj8r3eo05pKd@yury-laptop> <CAHp75VcGPQkY9ApsX2fi6sK5=3U=0vKbrHZZ3x___wUtgrFRSA@mail.gmail.com>
 <Yt8oK1gUojEbO0WI@yury-laptop>
In-Reply-To: <Yt8oK1gUojEbO0WI@yury-laptop>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 26 Jul 2022 08:13:37 +0200
Message-ID: <CAHp75VdJ=FVy6TXTEOci0b2kMrG3z8scDwWTjx8M6+8Y35iSXA@mail.gmail.com>
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

On Tue, Jul 26, 2022 at 1:35 AM Yury Norov <yury.norov@gmail.com> wrote:
> On Mon, Jul 25, 2022 at 11:39:39PM +0200, Andy Shevchenko wrote:
> > On Mon, Jul 25, 2022 at 6:19 PM Yury Norov <yury.norov@gmail.com> wrote:
> > > On Mon, Jul 25, 2022 at 09:28:12AM +0200, Andy Shevchenko wrote:
> > > > On Sun, Jul 24, 2022 at 12:19 AM Yury Norov <yury.norov@gmail.com> wrote:

...

> > > > >  EXPORT_SYMBOL_GPL(pm_power_off);
> > > >
> > > > ^^^ (Note this and read below)
> > > >
> > > > ...
> > > >
> > > > > +EXPORT_SYMBOL(arch_get_random_seed_long);
> > > >
> > > > It can't be like this. Brief browsing of the callees shows that.
> > >
> > > Is my understanding correct that you're suggesting to make it GPL?
> > >
> > > ppc_md is exported with EXPORT_SYMBOL(), and the function is in header,
> > > so it's available for non-GPL code now. I don't want to change it.
> >
> > The symbols your function calls are GPL. As far as I understand (not a
> > lawyer!) it logically one may not call GPL and pretend to be non-GPL.
>
> Can you explain what you mean in details?
>
> The function is:
>         static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
>         {
>                if (ppc_md.get_random_seed)
>                        return ppc_md.get_random_seed(v);
>
>                return false;
>         }
>
> ppc_md is non-GPL:
>  77 /* The main machine-dep calls structure
>  78  */
>  79 struct machdep_calls ppc_md;
>  80 EXPORT_SYMBOL(ppc_md);

What a mess...

> And get_random_seed is initialized in in arch/powerpc/platforms/powernv/rng.c
> with different functions that are static and not exported at all.
>
> I don't understand where arch_get_random_seed_long calls GPL...

The ->get_random_seed() (aka "callees" in my previous mail) are all
GPL (maybe I missed one out of five which is non-GPL, but then it's
even more of a mess).

-- 
With Best Regards,
Andy Shevchenko
