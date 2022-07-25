Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB911580850
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 01:35:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsGcz4qP8z3cf7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 09:35:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CuxM3sWs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com; envelope-from=yury.norov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CuxM3sWs;
	dkim-atps=neutral
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsGcN686Nz30Qc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 09:35:14 +1000 (AEST)
Received: by mail-ot1-x332.google.com with SMTP id o16-20020a9d4110000000b0061cac66bd6dso9770937ote.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 16:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DeZ0i71m7lXsgqJ3r02BqYK+cq3KZTMlnLHmvKXbYxU=;
        b=CuxM3sWsBSTPgEOjZsRT4+4fjCKRp1DD+h+q+tZsJRmUqGgttEcydVnl3HwtZDIHer
         zxXhs/Vjw76o3wJC5EHOUZ6QyEMyToO4FSwgjULATEJOuaKcPo2Yu3N0q/uewVDZD369
         YIKPwTVKdqvc2Sz8CbHeesLVfi4Ka1YUdHmIi8XTW8plTbruiqXKUMqM+8De8VVnVWJ+
         0/X1uPuvJcI8rqqJlVL9KSYPTSEyEyipCPPXvfCwwXgUwUdpMfTig+A4aZQy5s3XpeEa
         X7lgFDZHvvnS/yLDdjjKsdMVMzeeDMdKDA2q5aIH6LiG9807L2flrLQ32a1Gc5SSkaIf
         NFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DeZ0i71m7lXsgqJ3r02BqYK+cq3KZTMlnLHmvKXbYxU=;
        b=JttC1gp2ITXbqApvP/NP3LcYG+axQnTP9M6nns7m9hr20Hl6oq/BvaKJFHAbcnAbm4
         6Sk0IggTioUZm5zhBm2+oAp/zHQnMAy3VwjQAOZ5UzmHF4gpbhs5EknHSk/l2EfNcYNr
         M8Tg+1X6JH6q5QRS4CBBWqb8BvLsglc/h7Yj96hqlPjim+WfWrw8obxMCp8QvKKe21bU
         KhoVvNM2DkewBh5AkjBM6M9PsAOkF+9y/JZIzX3n/Q6ZBf+F+zVIjuYXFK2LRPgc4ZgC
         qNcB90lcg9vQ2zZTsWGhNhWe1TgfvtshI26osF0JR4UzanzgwdV4mXuxXFwZHkzlk6Cm
         b2Rg==
X-Gm-Message-State: AJIora9FMcmvyvdzI7ZBtdsMa/ng+gyyhLq7CUvkaqRfWGPLdeXfhkMB
	fyDsRG0euHAByJZvDAJ2X/fV2Gxw9oE=
X-Google-Smtp-Source: AGRyM1vy8C5iqLabeXFffOkfvK810psuEvspeFasjH3OSccwMohmjm9n6GHknf3IO6BpuRysXhKSzQ==
X-Received: by 2002:a05:6830:1f3b:b0:61c:8421:6dbb with SMTP id e27-20020a0568301f3b00b0061c84216dbbmr5437090oth.263.1658792111438;
        Mon, 25 Jul 2022 16:35:11 -0700 (PDT)
Received: from localhost ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id l11-20020a9d550b000000b0061ca92ae442sm5450341oth.72.2022.07.25.16.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 16:35:11 -0700 (PDT)
Date: Mon, 25 Jul 2022 16:32:59 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] powerpc: drop dependency on <asm/machdep.h> in
 archrandom.h
Message-ID: <Yt8oK1gUojEbO0WI@yury-laptop>
References: <20220723214537.2054208-1-yury.norov@gmail.com>
 <20220723214537.2054208-2-yury.norov@gmail.com>
 <CAHp75VfOmN=cTEs7gbwxZ7W3hXjBo67N4AmHHiDfcVfFzHkMLA@mail.gmail.com>
 <Yt7CJj8r3eo05pKd@yury-laptop>
 <CAHp75VcGPQkY9ApsX2fi6sK5=3U=0vKbrHZZ3x___wUtgrFRSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcGPQkY9ApsX2fi6sK5=3U=0vKbrHZZ3x___wUtgrFRSA@mail.gmail.com>
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

On Mon, Jul 25, 2022 at 11:39:39PM +0200, Andy Shevchenko wrote:
> On Mon, Jul 25, 2022 at 6:19 PM Yury Norov <yury.norov@gmail.com> wrote:
> > On Mon, Jul 25, 2022 at 09:28:12AM +0200, Andy Shevchenko wrote:
> > > On Sun, Jul 24, 2022 at 12:19 AM Yury Norov <yury.norov@gmail.com> wrote:
> 
> ...
> 
> > > >  EXPORT_SYMBOL_GPL(pm_power_off);
> > >
> > > ^^^ (Note this and read below)
> > >
> > > ...
> > >
> > > > +EXPORT_SYMBOL(arch_get_random_seed_long);
> > >
> > > It can't be like this. Brief browsing of the callees shows that.
> >
> > Is my understanding correct that you're suggesting to make it GPL?
> >
> > ppc_md is exported with EXPORT_SYMBOL(), and the function is in header,
> > so it's available for non-GPL code now. I don't want to change it.
> 
> The symbols your function calls are GPL. As far as I understand (not a
> lawyer!) it logically one may not call GPL and pretend to be non-GPL.

Can you explain what you mean in details?

The function is:
        static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
        {
               if (ppc_md.get_random_seed)
                       return ppc_md.get_random_seed(v);

               return false;
        }

ppc_md is non-GPL:
 77 /* The main machine-dep calls structure
 78  */
 79 struct machdep_calls ppc_md;
 80 EXPORT_SYMBOL(ppc_md);

And get_random_seed is initialized in in arch/powerpc/platforms/powernv/rng.c
with different functions that are static and not exported at all. 

I don't understand where arch_get_random_seed_long calls GPL...
