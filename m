Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 171D7F7A9F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 19:18:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BfJY5YbDzF1g3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 05:18:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Bf5Z5FZFzDrQj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 05:09:06 +1100 (AEDT)
Received: by mail-ot1-f66.google.com with SMTP id n23so11986152otr.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 10:09:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pB6c4pFOe94ggxtiHB2kKLTOBOYOEpvnXnv9wnKmZAU=;
 b=RhJNoefqlwD6TcBhnOLSZQRNJ92MyOTTTpSO31Zq6OWSCAma16oNNGov2iYCzyeO4w
 grCkEOiTE91hfGE0aHjA4Ny0WqpiCdFSU+Dwo4ixSJ++1JMfQCW2huUqXED14CBCQwy2
 IL6T318gxSthYJjQ8HGO/YQz7eDSrjPXJqi2LiAK+qvRCmERtYL0RmY4Kyfns6JpJNEA
 Z7lb6axLjL3lu3PuYwaIma/LfflYrAJzWh+gToug3E2kikEmUGbDHd7uVKIIVvMYAoyn
 rGet+3/NkGF28rq80qRj8EDQZkjgCdwqani4lAQPJlKiQYkVpBaXfViUSfFf9fRh3gzf
 sTjA==
X-Gm-Message-State: APjAAAXCZeGjgv7HYPi+loOg3Bju4u2y/C12kIKcd6nXGvwd4NOw/M9Y
 EA99ap5xg6RupgSIbIQfvzVro/1HRoEkL0CGDAk=
X-Google-Smtp-Source: APXvYqwz3yURFWyrc4txNYG5Aijjty7ogMGADNC5Z1wYd4gVa5brKlAgJqkxDayccnlPhvVhacX5bel06VJjIpOaGlc=
X-Received: by 2002:a05:6830:2363:: with SMTP id
 r3mr22934879oth.39.1573495742542; 
 Mon, 11 Nov 2019 10:09:02 -0800 (PST)
MIME-Version: 1.0
References: <20191011000609.29728-1-keescook@chromium.org>
 <20191011000609.29728-12-keescook@chromium.org>
 <CAMuHMdXfPyti1wFBb0hhf3CeDSQ=zVv7cV-taeYCmDswMQkXPQ@mail.gmail.com>
 <201911110922.17A2112B0@keescook>
In-Reply-To: <201911110922.17A2112B0@keescook>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Nov 2019 19:08:51 +0100
Message-ID: <CAMuHMdUJ8QPvqf51nVmOg1Zm20SNT7pXR72z=qmco=ecwawZ7A@mail.gmail.com>
Subject: Re: [PATCH v2 11/29] vmlinux.lds.h: Replace RODATA with RO_DATA
To: Kees Cook <keescook@chromium.org>
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

Hi Kees,

On Mon, Nov 11, 2019 at 6:23 PM Kees Cook <keescook@chromium.org> wrote:
> On Mon, Nov 11, 2019 at 05:58:06PM +0100, Geert Uytterhoeven wrote:
> > On Fri, Oct 11, 2019 at 2:07 AM Kees Cook <keescook@chromium.org> wrote:
> > > There's no reason to keep the RODATA macro: replace the callers with
> > > the expected RO_DATA macro.
> > >
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > ---
> > >  arch/alpha/kernel/vmlinux.lds.S      | 2 +-
> > >  arch/ia64/kernel/vmlinux.lds.S       | 2 +-
> > >  arch/microblaze/kernel/vmlinux.lds.S | 2 +-
> > >  arch/mips/kernel/vmlinux.lds.S       | 2 +-
> > >  arch/um/include/asm/common.lds.S     | 2 +-
> > >  arch/xtensa/kernel/vmlinux.lds.S     | 2 +-
> > >  include/asm-generic/vmlinux.lds.h    | 4 +---
> > >  7 files changed, 7 insertions(+), 9 deletions(-)
> >
> > Somehow you missed:
> >
> >     arch/m68k/kernel/vmlinux-std.lds:  RODATA
> >     arch/m68k/kernel/vmlinux-sun3.lds:      RODATA
>
> Argh. I've sent a patch; sorry and thanks for catching this. For my own
> cross-build testing, which defconfig targets will hit these two linker
> scripts?

vmlinux-sun3.lds: sun3_defconfig
vmlinux-std.lds: All other classic 680x0 targets with an MMU, e.g. plain
                 defconfig aka multi_defconfig.

> > Leading to build failures in next-20191111:
> >
> >     /opt/cross/kisskb/gcc-4.6.3-nolibc/m68k-linux/bin/m68k-linux-ld:./arch/m68k/kernel/vmlinux.lds:29:
> > syntax error
> >     make[1]: *** [/kisskb/src/Makefile:1075: vmlinux] Error 1
> >
> > Reported-by: noreply@ellerman.id.au
> > http://kisskb.ellerman.id.au/kisskb/buildresult/14022846/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
