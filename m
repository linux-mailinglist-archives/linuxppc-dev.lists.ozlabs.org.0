Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BF020EB53
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 04:11:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wnsK4cNnzDqWG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 12:11:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.83;
 helo=conssluserg-04.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=l6KYDX7G; 
 dkim-atps=neutral
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com
 [210.131.2.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wnq21CgXzDqQl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 12:09:17 +1000 (AEST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id 05U28if7005911
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 11:08:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 05U28if7005911
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1593482924;
 bh=8N9eJ+P9q8UjGmkozh+JC0/G8Gi+VtjTGyH41GDG7qQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=l6KYDX7G5ObLLfZj346w6gRgrZASvzN9gF1kXQ7tuLqs/E6GqGGa543lO5Zz1ihTr
 WAEsJuTasumlWfr8l25KCf+0QqeLzmY2Z9ozZYiApvo6gf5GN1V9tqyfgSAyidLrLk
 vcJM5dgy9vpP739goBqxXVID4T3ruz6OZ9xe6PhU2xAxsPHBO3avZGXg/LTpqdiJdU
 qn7VlIYfnGe0uTzHptFEuU5OT8A0oHwpDETFuO2hCWfaoyrE0sX/n/Rm5hP9rLk213
 5GUS3XQpe20HhqW5rcGQ9acsqnRMKYjNxXHcqwD9dqXT1g3cRZTpCsehy4Kdm1RFES
 qN6eHzJbi9Htw==
X-Nifty-SrcIP: [209.85.222.42]
Received: by mail-ua1-f42.google.com with SMTP id l12so1251434uak.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 19:08:44 -0700 (PDT)
X-Gm-Message-State: AOAM533zeWfXH1iy3Zvsrev0RkQaSu6UGbVyJxsI8+Cm4QCaiPvvzbRq
 USjpQ6y6eY2t8BPovuFRoSWraz11P+qFCG72+XI=
X-Google-Smtp-Source: ABdhPJzcTgvLU2AmkLENvHvRyD/efC2ONPJPB6N+NNMxQ+AWnRagsj4cZe5ewXyAh5Ardq+OWABinNwy06jhD+SST0c=
X-Received: by 2002:a9f:2204:: with SMTP id 4mr13210692uad.40.1593482923565;
 Mon, 29 Jun 2020 19:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200628015041.1000002-1-masahiroy@kernel.org>
 <87imfa8le0.fsf@mpe.ellerman.id.au>
In-Reply-To: <87imfa8le0.fsf@mpe.ellerman.id.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 30 Jun 2020 11:08:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNATusciypBJ4dYZcyrugdi_rXEV_s=zxAehDxsX+Sd5z4g@mail.gmail.com>
Message-ID: <CAK7LNATusciypBJ4dYZcyrugdi_rXEV_s=zxAehDxsX+Sd5z4g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: introduce ccflags-remove-y and asflags-remove-y
To: Michael Ellerman <mpe@ellerman.id.au>
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
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Russell King <linux@armlinux.org.uk>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Sami Tolvanen <samitolvanen@google.com>,
 Rich Felker <dalias@libc.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 29, 2020 at 2:55 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Masahiro Yamada <masahiroy@kernel.org> writes:
> > CFLAGS_REMOVE_<file>.o works per object, that is, there is no
> > convenient way to filter out flags for every object in a directory.
> >
> > Add ccflags-remove-y and asflags-remove-y to make it easily.
> >
> > Use ccflags-remove-y to clean up some Makefiles.
> >
> > Suggested-by: Sami Tolvanen <samitolvanen@google.com>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  arch/arm/boot/compressed/Makefile | 6 +-----
> >  arch/powerpc/xmon/Makefile        | 3 +--
> >  arch/sh/boot/compressed/Makefile  | 5 +----
> >  kernel/trace/Makefile             | 4 ++--
> >  lib/Makefile                      | 5 +----
> >  scripts/Makefile.lib              | 4 ++--
> >  6 files changed, 8 insertions(+), 19 deletions(-)
> >
> > diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
> > index 89c76ca35640..55cbcdd88ac0 100644
> > --- a/arch/powerpc/xmon/Makefile
> > +++ b/arch/powerpc/xmon/Makefile
> > @@ -7,8 +7,7 @@ UBSAN_SANITIZE := n
> >  KASAN_SANITIZE := n
> >
> >  # Disable ftrace for the entire directory
> > -ORIG_CFLAGS := $(KBUILD_CFLAGS)
> > -KBUILD_CFLAGS = $(subst $(CC_FLAGS_FTRACE),,$(ORIG_CFLAGS))
> > +ccflags-remove-y += $(CC_FLAGS_FTRACE)
>
> This could be:
>
> ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
>
> Similar to kernel/trace/Makefile below.


I fixed it up, and applied to linux-kbuild.
Thanks.


> I don't mind though.
>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>
> cheers
>
> > diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
> > index 6575bb0a0434..7492844a8b1b 100644
> > --- a/kernel/trace/Makefile
> > +++ b/kernel/trace/Makefile
> > @@ -2,9 +2,9 @@
> >
> >  # Do not instrument the tracer itself:
> >
> > +ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
> > +
> >  ifdef CONFIG_FUNCTION_TRACER
> > -ORIG_CFLAGS := $(KBUILD_CFLAGS)
> > -KBUILD_CFLAGS = $(subst $(CC_FLAGS_FTRACE),,$(ORIG_CFLAGS))
> >
> >  # Avoid recursion due to instrumentation.
> >  KCSAN_SANITIZE := n



-- 
Best Regards
Masahiro Yamada
