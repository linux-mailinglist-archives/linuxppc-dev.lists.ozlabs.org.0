Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D27380253
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 05:12:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhD8s0lPHz301t
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 13:12:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=D8RoOex7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.83;
 helo=conssluserg-04.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=D8RoOex7; 
 dkim-atps=neutral
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com
 [210.131.2.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhD8M07GKz2yXH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 13:11:46 +1000 (AEST)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id 14E3BSrd021814
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 12:11:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 14E3BSrd021814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1620961888;
 bh=pbbpGUR6yrf1GL48OQICvHJRZXOz0W4ICJk5HTCek/0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=D8RoOex7HXdNnqzlUi6SGs+AS81/YKPmxUEWjsheZ8sqRps0YxLVqvcClM3T5vC6S
 Qgf/7CEvSP9CQ5Tbj1iUYkaPgD6Sj2waGimagtqiyTCAnddIlD+8qnLm+S/2RCxmlI
 v1i6BAe6EEXVf2LAHXFf4y3YdIfVme6JotJA5VtYnXrLe7C12r+GpKfKjvP7TdaqS8
 egQkG7Kzkpv+aalnUFbaG7jh7nFk/Az/JIWjG+MVPam2gAt4soQbqYoqQBfF4ueZ89
 9hM7EJyunXDQZY4q2wReM0HtJz+5BPU3MD8hWeP4tMMkmaGrum4xZr8zl0yBiDIqSZ
 oJH1vHSTGxyzA==
X-Nifty-SrcIP: [209.85.216.43]
Received: by mail-pj1-f43.google.com with SMTP id gm21so373755pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 20:11:28 -0700 (PDT)
X-Gm-Message-State: AOAM530dyimmgbhqKmc8pCjml7KQ6N963DtoeLMF+xnpEujUe9cRBsAO
 izQD0UAJyQ4rtWuuzIVHTogreXw7bSVIcAJtuEE=
X-Google-Smtp-Source: ABdhPJxhAZAfrz1qW8hiBEhhGIJjcZw6SR9M/Z4p4EKvBxTiWaVJoBYtJidqCl9RopQQTFhtzLXYTJJPTw3KxDjZ3lI=
X-Received: by 2002:a17:902:bcc7:b029:ed:6f73:ffc4 with SMTP id
 o7-20020a170902bcc7b02900ed6f73ffc4mr42803945pls.1.1620961887766; Thu, 13 May
 2021 20:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210511044812.267965-1-aik@ozlabs.ru>
 <20210511112019.GK10366@gate.crashing.org>
 <1795b9efa40.27bb.1ca38dd7e845b990cd13d431eb58563d@ozlabs.ru>
 <20210511231635.GR10366@gate.crashing.org>
 <80ae1561-ed8d-cf3a-f3bb-d89cd07bfc24@ozlabs.ru>
 <20210512102640.GT10366@gate.crashing.org>
In-Reply-To: <20210512102640.GT10366@gate.crashing.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 14 May 2021 12:10:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQkDDVigJbPKsPEcqQNz0z0Hc0r8h22MGB=8vMxMiMuDg@mail.gmail.com>
Message-ID: <CAK7LNAQkDDVigJbPKsPEcqQNz0z0Hc0r8h22MGB=8vMxMiMuDg@mail.gmail.com>
Subject: Re: [PATCH kernel v2] powerpc/makefile: Do not redefine $(CPP) for
 preprocessor
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
Cc: Michal Marek <michal.lkml@markovi.net>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 12, 2021 at 7:29 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Wed, May 12, 2021 at 01:48:53PM +1000, Alexey Kardashevskiy wrote:
> > >Oh!  I completely missed those few lines.  Sorry for that :-(
> >
> > Well, I probably should have made it a separate patch anyway, I'll
> > repost separately.
>
> Thanks.
>
> > >To compensate a bit:
> > >
> > >>It still puzzles me why we need -C
> > >>(preserve comments in the preprocessor output) flag here.
> > >
> > >It is so that a human can look at the output and read it.  Comments are
> > >very significant to human readers :-)
> >
> > I seriously doubt anyone ever read those :)
>
> I am pretty sure whoever wrote it did!


Keeping comments in the pre-processed linker scripts
is troublesome.

That is why -C was removed from scripts/Makefile.build


commit 5cb0512c02ecd7e6214e912e4c150f4219ac78e0
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Nov 2 14:10:37 2017 -0700

    Kbuild: don't pass "-C" to preprocessor when processing linker scripts




You can entirely remove

 CPPFLAGS_vdso32.lds += -P -C -Upowerpc





-- 
Best Regards
Masahiro Yamada
