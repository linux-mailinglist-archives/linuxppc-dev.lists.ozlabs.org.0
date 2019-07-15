Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA57A6888C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 14:07:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nMj11NklzDqZ9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 22:07:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.90; helo=conssluserg-05.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="w00yTOzI"; 
 dkim-atps=neutral
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com
 [210.131.2.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nMf13FtkzDqTX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 22:04:39 +1000 (AEST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id x6FC4NRL010678
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 21:04:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x6FC4NRL010678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1563192264;
 bh=7Onnwj4Aol7vBEfdqH7wYkCIRDkp83Cer5+EmKQdOFE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=w00yTOzIaj5vl2FtI+QcSJXcMye06NqSFvXFLwxK6Xa5KcQPEG/PP3Kqv0UoFuuX+
 y12fzYi1JP/P8qGSihacuSJ6KEvFmiIp76xAtOUCxidESiXiqWy1MHGbchMGlZVciU
 hdfOOz/NSNlV/Uh7QxM8iROXSzRF8uMWxEJTGx0BO1LCR7G1AENoJx4Pv1c3fZYgpf
 UQKK8Mp52j3xI+Xer660ENag//H+hmP/BNbAPaosbDTgL6epk8+OK44rt7KE7/t/6y
 WFLXdA51u/LWT8zTQnGVh8fPD6v/FgmcwQ7TBuG7Okv4pNMYYnAjgMMVoJKHIML2EU
 A/1mh4sdcHKnQ==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id m23so11169591vso.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 05:04:23 -0700 (PDT)
X-Gm-Message-State: APjAAAUHlUVJQbA/ZWmdaABvuoBjrmK9CGzrIn2eNOqTVOveuu+t9uIY
 s3g0hBkIrdsQlIoTrApm18ZlA4AjNF2iHMypzi8=
X-Google-Smtp-Source: APXvYqyfxSL5TnyJM5fr7O8sQTCclOIa1SfvEyoOE8HnRW8P/3ts/cp1Og/3hK/v5vJ9PY5O3OefkCqQJGfEon2W6l8=
X-Received: by 2002:a67:fc45:: with SMTP id p5mr15874928vsq.179.1563192262732; 
 Mon, 15 Jul 2019 05:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190713032106.8509-1-yamada.masahiro@socionext.com>
 <20190713124744.GS14074@gate.crashing.org>
 <20190713131642.GU14074@gate.crashing.org>
 <CAK7LNASBmZxX+U=LS+dgvet96cA3T6Tf_tiAa2vduUV81DEnBw@mail.gmail.com>
 <20190713235430.GZ14074@gate.crashing.org>
 <87v9w393r5.fsf@concordia.ellerman.id.au>
 <20190715072959.GB20882@gate.crashing.org>
In-Reply-To: <20190715072959.GB20882@gate.crashing.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 15 Jul 2019 21:03:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNATGEK9wxz87J3sTNOYPdtAFXaegQU9EctEBGULQL-ZC4w@mail.gmail.com>
Message-ID: <CAK7LNATGEK9wxz87J3sTNOYPdtAFXaegQU9EctEBGULQL-ZC4w@mail.gmail.com>
Subject: Re: [PATCH] powerpc: remove meaningless KBUILD_ARFLAGS addition
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 15, 2019 at 4:30 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Mon, Jul 15, 2019 at 05:05:34PM +1000, Michael Ellerman wrote:
> > Segher Boessenkool <segher@kernel.crashing.org> writes:
> > > Yes, that is why I used the environment variable, all binutils work
> > > with that.  There was no --target option in GNU ar before 2.22.

I use binutils 2.30
It does not understand --target option.

$ powerpc-linux-ar --version
GNU ar (GNU Binutils) 2.30
Copyright (C) 2018 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License version 3 or (at your option) any later version.
This program has absolutely no warranty.

If I give --target=elf$(BITS)-$(GNUTARGET) option, I see this:
powerpc-linux-ar: -t: No such file or directory



> > Yeah, we're not very good at testing with really old binutils, so I
> > guess we broke that.
> >
> > I'm inclined to merge this, it doesn't seem to break anything, and it
> > fixes using --target on old binutils that don't have it.
>
> But we don't set the target any other way either.  I don't think this
> will work with a 32-bit toolchain (default target 32 bit) and a 64-bit
> kernel, or the other way around.
>
> Then again, does that work at *all* nowadays?  Do we even consider that
> important, *should* it work?


Let me confirm if I understood this discussion.


[1] KBUILD_ARFLAGS += --target=elf$(BITS)-$(GNUTARGET)
    is pointless since it is always overridden by another
    KBUILD_ARFLAGS assignment.

[2] If we stop overriding it, it would cause build errors.
    So, --target is not only useless, but it is rather harmful.


So, we all agreed with this patch, right?


We are discussing whether or not to revive
GNUTARGET=elf$(BITS)-$(GNUTARGET)
in a *separate* patch, correct?


-- 
Best Regards
Masahiro Yamada
