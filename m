Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C93DAF79DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 18:25:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Bd7j3vzWzF3T9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 04:25:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="X/LzmRNI";
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Bd4c48W0zF0fh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 04:23:12 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id p24so11116159pfn.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 09:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yAajaC8HCWYzucX9F7lpdzKRK9O4DP5SS69z8MpuzC8=;
 b=X/LzmRNI+PAfGCx7iOXc7jITwTbPHloj6W9cE45iZE62pceyrxHDPEHiavfj9tEFm4
 3ssTDoHViE0PIaYRTxiES+N/vQ0V6XBCRSxJLkNHA5EmXVvGMUKq6TH0JVEbtbv7eJIs
 og7HVJoMSxXZSuRdEpfAiyzG2OcgsCx2ssepg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yAajaC8HCWYzucX9F7lpdzKRK9O4DP5SS69z8MpuzC8=;
 b=gN3MnWJmiln+4NsgDmhZ4gcDzzQ+zB2J90zJdLsmOvqpMHJXmZxyc8CGlJMOn/sHlP
 xJkDrQQnTeaF57Cof7lBpg6NarqOgoBMixdobbMPXkBd4S88bB706vVW13cxvUy8pxeq
 jgkzkwslzElZ75C8wfdfpOrBvQ0niwzl3Ha53SYuCnM9tzKZWi0OrIJbO7W/+iDKS4nj
 tFnO7iTIuUpGFLPIdd6Vgz/pjV3RM7QhopPOyyJd3mJrzhe8Fi+mIgRGpamDJeCmkaDr
 rdqzHRaKIjna3F+9eUc1NSqQQhLmrK1OmyJktgrqhG2hYCwOmBWUqDSzWPiXYzRUsX4+
 SiNg==
X-Gm-Message-State: APjAAAWain69tolaNpsM9ZOI9V6lSWoiEzHnHNqJChZ/5XybAPWvgTO4
 1kUuXPbY520J7XPbd5NnN/hffQ==
X-Google-Smtp-Source: APXvYqyYRSzpwUPLuEiDxWQRl2mmu7HM3K81RSwKffyFA1Sp64Zbaq8qhH85VUnK4TNVxH3gOyo1gQ==
X-Received: by 2002:a17:90a:5d0e:: with SMTP id s14mr85161pji.55.1573492985697; 
 Mon, 11 Nov 2019 09:23:05 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id o15sm22800000pgn.49.2019.11.11.09.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 09:23:04 -0800 (PST)
Date: Mon, 11 Nov 2019 09:23:03 -0800
From: Kees Cook <keescook@chromium.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 11/29] vmlinux.lds.h: Replace RODATA with RO_DATA
Message-ID: <201911110922.17A2112B0@keescook>
References: <20191011000609.29728-1-keescook@chromium.org>
 <20191011000609.29728-12-keescook@chromium.org>
 <CAMuHMdXfPyti1wFBb0hhf3CeDSQ=zVv7cV-taeYCmDswMQkXPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXfPyti1wFBb0hhf3CeDSQ=zVv7cV-taeYCmDswMQkXPQ@mail.gmail.com>
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Michal Simek <monstr@monstr.eu>,
 the arch/x86 maintainers <x86@kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 linux-c6x-dev@linux-c6x.org, Arnd Bergmann <arnd@arndb.de>,
 linux-xtensa@linux-xtensa.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Borislav Petkov <bp@alien8.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 11, 2019 at 05:58:06PM +0100, Geert Uytterhoeven wrote:
> Hi Kees,
> 
> On Fri, Oct 11, 2019 at 2:07 AM Kees Cook <keescook@chromium.org> wrote:
> > There's no reason to keep the RODATA macro: replace the callers with
> > the expected RO_DATA macro.
> >
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  arch/alpha/kernel/vmlinux.lds.S      | 2 +-
> >  arch/ia64/kernel/vmlinux.lds.S       | 2 +-
> >  arch/microblaze/kernel/vmlinux.lds.S | 2 +-
> >  arch/mips/kernel/vmlinux.lds.S       | 2 +-
> >  arch/um/include/asm/common.lds.S     | 2 +-
> >  arch/xtensa/kernel/vmlinux.lds.S     | 2 +-
> >  include/asm-generic/vmlinux.lds.h    | 4 +---
> >  7 files changed, 7 insertions(+), 9 deletions(-)
> 
> Somehow you missed:
> 
>     arch/m68k/kernel/vmlinux-std.lds:  RODATA
>     arch/m68k/kernel/vmlinux-sun3.lds:      RODATA

Argh. I've sent a patch; sorry and thanks for catching this. For my own
cross-build testing, which defconfig targets will hit these two linker
scripts?

-Kees

> 
> Leading to build failures in next-20191111:
> 
>     /opt/cross/kisskb/gcc-4.6.3-nolibc/m68k-linux/bin/m68k-linux-ld:./arch/m68k/kernel/vmlinux.lds:29:
> syntax error
>     make[1]: *** [/kisskb/src/Makefile:1075: vmlinux] Error 1
> 
> Reported-by: noreply@ellerman.id.au
> http://kisskb.ellerman.id.au/kisskb/buildresult/14022846/
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kees Cook
