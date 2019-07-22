Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62351706B3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 19:23:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45spNQ5P1TzDqVp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2019 03:23:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="FaSizBSw"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45spLM3KJXzDqCw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 03:21:23 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id i18so17977107pgl.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 10:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QHj3tGcPiL8tws64cl/tkaZMAUCPhqkGn8EZKKJS20U=;
 b=FaSizBSw0Ge/cwRKXU0Ppjjo9bhTwKBEw5TZxsXz/qyJe93qVcTDFBQL860oDXR/BS
 2yCBfUFAWqV5wvyZTfJZZoUn5Ys51mNlj/T6SFGtok+DlMTaBIJzt2vfJukK18N0u7Yg
 EWMaRgSQan0ISn0pOywEWJsaeleKB9VEnWEsfOnq3hpILohpzayPuyCjumJdxjOVyi7S
 1QBehw+gqWqQPWz0t6Q6F78N1WpYFEvCHS/jSCq1efGBW51eTXr5zXsWE8Yi4xQDWAA5
 tRrCMy+WjzBInGbRi79tESK3/mw3BvoHv7E2T3z+FAPjgOy5IHx0f5pVJAhv+e+Gz60U
 D9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QHj3tGcPiL8tws64cl/tkaZMAUCPhqkGn8EZKKJS20U=;
 b=dOBVZvXo+NUhoMKHEVsaJaHEGLLhRFjxZ/hoeTaQe2Zbm1Ldx2DVZOlXA6Qdc6MreD
 AgcTPWwcCHEXijAainHJrlKr9OaZesEgl+wxJBqO4+DkZzjq2C1h/UiVLIGbhyHOgDjs
 z/m/UMBUuV80H89ftYDHxJM9p9hd8TFJVBbbcdULtiadj2nlII0+JfhDQM/oFJoC1efP
 DNaujHhrjYTqb3Ip3hC+npH78JGXtx3abONOUp8haGR2/I1aeJ/T+EMyX9/ffrhKA4si
 P0kdiBMHxU8zTm2oNceSK1GFElMbiOAfUToQF2y/9U4zYq934BsQNIBtbpw+pV6xTKbX
 ksKg==
X-Gm-Message-State: APjAAAU+Wzd2ypidZF+XRiqfCI0J87i5Q/agi3gjVbgX2QqwtrrA3C0K
 vUWE4CqWHrxL3ZR0HxlmSGDWgMJymhoRMZgE6vExrA==
X-Google-Smtp-Source: APXvYqwbkDS2DsMH58QOzoQO4Ra4BdOdByCJsymA/G/i1/7Y8LyFyDHySG7VLchNuRBlUiPPtG+v2aT0pFaSXxgJyA0=
X-Received: by 2002:a63:2cd1:: with SMTP id s200mr68567574pgs.10.1563816079099; 
 Mon, 22 Jul 2019 10:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <45hnfp6SlLz9sP0@ozlabs.org>
 <20190708191416.GA21442@archlinux-threadripper>
 <a5864549-40c3-badd-8c41-d5b7bf3c4f3c@c-s.fr>
 <20190709064952.GA40851@archlinux-threadripper>
 <20190719032456.GA14108@archlinux-threadripper>
 <20190719152303.GA20882@gate.crashing.org>
 <20190719160455.GA12420@archlinux-threadripper>
 <20190721075846.GA97701@archlinux-threadripper>
 <20190721180150.GN20882@gate.crashing.org>
 <20190722024140.GA55142@archlinux-threadripper>
 <20190722061940.GZ20882@gate.crashing.org>
In-Reply-To: <20190722061940.GZ20882@gate.crashing.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 22 Jul 2019 10:21:07 -0700
Message-ID: <CAKwvOd=KRVsFkT8dLFoitky9OF8tKmbn00-OPi6kBygyx4QwHg@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc: slightly improve cache helpers
To: Segher Boessenkool <segher@kernel.crashing.org>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jul 21, 2019 at 11:19 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Sun, Jul 21, 2019 at 07:41:40PM -0700, Nathan Chancellor wrote:
> > Hi Segher,
> >
> > On Sun, Jul 21, 2019 at 01:01:50PM -0500, Segher Boessenkool wrote:
> > > On Sun, Jul 21, 2019 at 12:58:46AM -0700, Nathan Chancellor wrote:
> > > > 0000017c clear_user_page:
> > > >      17c: 94 21 ff f0                     stwu 1, -16(1)
> > > >      180: 38 80 00 80                     li 4, 128
> > > >      184: 38 63 ff e0                     addi 3, 3, -32
> > > >      188: 7c 89 03 a6                     mtctr 4
> > > >      18c: 38 81 00 0f                     addi 4, 1, 15
> > > >      190: 8c c3 00 20                     lbzu 6, 32(3)
> > > >      194: 98 c1 00 0f                     stb 6, 15(1)
> > > >      198: 7c 00 27 ec                     dcbz 0, 4
> > > >      19c: 42 00 ff f4                     bdnz .+65524
> > >
> > > Uh, yeah, well, I have no idea what clang tried here, but that won't
> > > work.  It's copying a byte from each target cache line to the stack,
> > > and then does clears the cache line containing that byte on the stack.
> > >
> > > I *guess* this is about "Z" and not about "%y", but you'll have to ask
> > > the clang people.
> > >
> > > Or it may be that they do not treat inline asm operands as lvalues
> > > properly?  That rings some bells.  Yeah that looks like it.
>
> The code is
>   __asm__ __volatile__ ("dcbz %y0" : : "Z"(*(u8 *)addr) : "memory");
>
> so yeah it looks like clang took that  *(u8 *)addr  as rvalue, and
> stored that in stack, and then used *that* as memory.

What's the %y modifier supposed to mean here?  addr is in the list of
inputs, so what's wrong with using it as an rvalue?

>
> Maybe clang simply does not not to treat "Z" the same as "m"?  (And "Y"
> and "Q" and "es" and a whole bunch of "w*", what about those?)

-- 
Thanks,
~Nick Desaulniers
