Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A117232D893
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 18:26:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DryT04NKkz3d9S
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 04:26:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=mZ9ESMDy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32d;
 helo=mail-wm1-x32d.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=mZ9ESMDy; dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrySZ5bVPz30Nx
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 04:25:47 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id i9so8800205wml.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar 2021 09:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rF5Y4qiLYG77iew1mU5Rkg3muHLgwxb+EueWczzk7UQ=;
 b=mZ9ESMDypfYC8jF7LeueBhm2UiIAIN/v6i6QXG6sJvo6vTlym2d/pOVora2yQsMHYx
 2eApf3R5G7JrLv4USsVgoEl2yFrP083oeblz/IsBWcPVqzFDaHC2Ix+SoE4MTxgCCw0G
 gUM+DMdlIqdBM1t5801TPfJMrwTEUXqAgp/A42//Mymhi5Tnuz4Fr5HpWN52HVtRMALP
 EV5ywj6fcy7GSYJAOqNO2rUKimjOewgB/U9ahmQz7ewEOBkxzO0mYeFiq1MJn9MSElaF
 wUF9qR+lAvKtsJ6G8C5AiRbNU5A9M5XHYwVuuJ75yXsKiKvPmU2uAhPbn1fGHsYAe4wi
 sVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rF5Y4qiLYG77iew1mU5Rkg3muHLgwxb+EueWczzk7UQ=;
 b=WBjCBcY+jXwguHWxpTix7crPjLsm+ZIhWvqjxNPsvZ8jvJuqgWuRF2zJVlG0nNM9du
 +rzC47xLD45not2a4vRQZtpzahtFLLvY8VUJ01ZBN6k/1o0u+ZSTcFt79PdnUTiGlMqo
 t5hvYDCKu0xW35wh9+OklqaF6wXglUmkcA1DjRusS6A9dv344/bElVPbS7Bq/gHuJ81m
 c/u13t3XdRmZThMofqdzOXes6X9Hh4mGk0RVzyHhbABwO4W/rMGV1sfpT9cwGW52cCHZ
 tCZe4YBuVOa1tUgqu1kFam0qDPjhzhlViLvN8O8RYajrRDQe75VwY8Dmn5moDGQ5tXNX
 njmA==
X-Gm-Message-State: AOAM532mHo9xOUQsKvWWWxWeQ4wMUUcSqi39uVEHRCDwcc4D1kfsDpW8
 B3lXaaEAseYhVDJy+lLk/wrHyA==
X-Google-Smtp-Source: ABdhPJyX2yKDzjHRQw3J2Mhvj3s3SocK42iygrNVPhkkAuthUyR6ukmqTE9xK7Mc5FUtVlYXSIWG2g==
X-Received: by 2002:a1c:c244:: with SMTP id s65mr5000395wmf.96.1614878739431; 
 Thu, 04 Mar 2021 09:25:39 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:15:13:adef:40fb:49ed:5ab6])
 by smtp.gmail.com with ESMTPSA id f17sm36439007wru.31.2021.03.04.09.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 09:25:38 -0800 (PST)
Date: Thu, 4 Mar 2021 18:25:33 +0100
From: Marco Elver <elver@google.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v1] powerpc: Include running function as first entry in
 save_stack_trace() and friends
Message-ID: <YEEYDSJeLPvqRAHZ@elver.google.com>
References: <e2e8728c4c4553bbac75a64b148e402183699c0c.1614780567.git.christophe.leroy@csgroup.eu>
 <CANpmjNOvgbUCf0QBs1J-mO0yEPuzcTMm7aS1JpPB-17_LabNHw@mail.gmail.com>
 <1802be3e-dc1a-52e0-1754-a40f0ea39658@csgroup.eu>
 <YD+o5QkCZN97mH8/@elver.google.com>
 <20210304145730.GC54534@C02TD0UTHF1T.local>
 <CANpmjNOSpFbbDaH9hNucXrpzG=HpsoQpk5w-24x8sU_G-6cz0Q@mail.gmail.com>
 <20210304165923.GA60457@C02TD0UTHF1T.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304165923.GA60457@C02TD0UTHF1T.local>
User-Agent: Mutt/2.0.5 (2021-01-21)
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, broonie@kernel.org,
 Paul Mackerras <paulus@samba.org>, kasan-dev <kasan-dev@googlegroups.com>,
 linux-toolchains@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 04, 2021 at 04:59PM +0000, Mark Rutland wrote:
> On Thu, Mar 04, 2021 at 04:30:34PM +0100, Marco Elver wrote:
> > On Thu, 4 Mar 2021 at 15:57, Mark Rutland <mark.rutland@arm.com> wrote:
> > > [adding Mark Brown]
> > >
> > > The bigger problem here is that skipping is dodgy to begin with, and
> > > this is still liable to break in some cases. One big concern is that
> > > (especially with LTO) we cannot guarantee the compiler will not inline
> > > or outline functions, causing the skipp value to be too large or too
> > > small. That's liable to happen to callers, and in theory (though
> > > unlikely in practice), portions of arch_stack_walk() or
> > > stack_trace_save() could get outlined too.
> > >
> > > Unless we can get some strong guarantees from compiler folk such that we
> > > can guarantee a specific function acts boundary for unwinding (and
> > > doesn't itself get split, etc), the only reliable way I can think to
> > > solve this requires an assembly trampoline. Whatever we do is liable to
> > > need some invasive rework.
> > 
> > Will LTO and friends respect 'noinline'?
> 
> I hope so (and suspect we'd have more problems otherwise), but I don't
> know whether they actually so.
> 
> I suspect even with 'noinline' the compiler is permitted to outline
> portions of a function if it wanted to (and IIUC it could still make
> specialized copies in the absence of 'noclone').
> 
> > One thing I also noticed is that tail calls would also cause the stack
> > trace to appear somewhat incomplete (for some of my tests I've
> > disabled tail call optimizations).
> 
> I assume you mean for a chain A->B->C where B tail-calls C, you get a
> trace A->C? ... or is A going missing too?

Correct, it's just the A->C outcome.

> > Is there a way to also mark a function non-tail-callable?
> 
> I think this can be bodged using __attribute__((optimize("$OPTIONS")))
> on a caller to inhibit TCO (though IIRC GCC doesn't reliably support
> function-local optimization options), but I don't expect there's any way
> to mark a callee as not being tail-callable.

I don't think this is reliable. It'd be
__attribute__((optimize("-fno-optimize-sibling-calls"))), but doesn't
work if applied to the function we do not want to tail-call-optimize,
but would have to be applied to the function that does the tail-calling.
So it's a bit backwards, even if it worked.

> Accoding to the GCC documentation, GCC won't TCO noreturn functions, but
> obviously that's not something we can use generally.
> 
> https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#Common-Function-Attributes

Perhaps we can ask the toolchain folks to help add such an attribute. Or
maybe the feature already exists somewhere, but hidden.

+Cc linux-toolchains@vger.kernel.org

> > But I'm also not sure if with all that we'd be guaranteed the code we
> > want, even though in practice it might.
> 
> True! I'd just like to be on the least dodgy ground we can be.

It's been dodgy for a while, and I'd welcome any low-cost fixes to make
it less dodgy in the short-term at least. :-)

Thanks,
-- Marco
