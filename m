Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B399521667
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 15:05:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyJDy1YrFz3by9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 23:05:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=nLq/5ipH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.81;
 helo=conssluserg-02.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=nLq/5ipH; 
 dkim-atps=neutral
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyJDG4QZlz3bjG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 23:05:02 +1000 (AEST)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 24AD4gfw011236
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 22:04:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 24AD4gfw011236
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1652187883;
 bh=qBEayftl5ZwYSJPRCuQSWMNdT3wNrCO/ZLylUnM9Pos=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nLq/5ipHudJNOcGUJsWwdYUfl6xYm9Kx/LfCF2DY/yWhpE2Mctf32CiOyfNIQ2gBC
 bGdfW9kjNaCML706UPRh8nLD1Lny1Azy1bLZ2h1RpS3RhbdZZDMMkc5uqHLDsQXABC
 envI7kUNL04QM+8N4XW1CfSxf0scjWNceOPOA2a/dAh+pxD7eITqXbziVw5bIEp4xH
 2WKVeNfb8PcpdVWBZW4CJg29uml36zc9AIKtqgWMVaQO517fRQOnyxwr53ndEVRIVV
 5STEVG0h72KmyM63AeINzu91D9azv4AP8JWDJmYj1EIjvtwg4wchFlg47xQzbS9eVJ
 p5TsaotGJk1Pg==
X-Nifty-SrcIP: [209.85.214.174]
Received: by mail-pl1-f174.google.com with SMTP id c9so15986272plh.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 06:04:43 -0700 (PDT)
X-Gm-Message-State: AOAM530oFD2yarD79YddKjsNDMtZDSzICktCJ5XVI0S9zALsrBWMr1yf
 rnK1jNcLZEOD5CKuWD7LyVszieS03zvl7cDrOJ4=
X-Google-Smtp-Source: ABdhPJyavnWgf46gRQwW/3BEwUehZ9JzWKuqbx9T+L5WacD6flQsWB/O7++u6qzJBiUbBulyt3k71693TE6NXQEFYOk=
X-Received: by 2002:a17:903:1205:b0:15e:8cbc:fd2b with SMTP id
 l5-20020a170903120500b0015e8cbcfd2bmr20893636plh.99.1652187882421; Tue, 10
 May 2022 06:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org>
 <20220508190631.2386038-7-masahiroy@kernel.org>
 <CAKwvOdm_oSLHddWWSzF5UuYrLCsAwF8AwbUGotUnPvV+6JkSkg@mail.gmail.com>
In-Reply-To: <CAKwvOdm_oSLHddWWSzF5UuYrLCsAwF8AwbUGotUnPvV+6JkSkg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 10 May 2022 22:03:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNASb40kWgvOM42WyS82p42HQ7Mqhwo3GDffg4yHcKgJk0w@mail.gmail.com>
Message-ID: <CAK7LNASb40kWgvOM42WyS82p42HQ7Mqhwo3GDffg4yHcKgJk0w@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] kbuild: link symbol CRCs at final link,
 removing CONFIG_MODULE_REL_CRCS
To: Nick Desaulniers <ndesaulniers@google.com>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 clang-built-linux <llvm@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-modules <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 10, 2022 at 2:51 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
>  On Sun, May 8, 2022 at 12:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > diff --git a/include/asm-generic/export.h b/include/asm-generic/export.h
> > index 07a36a874dca..51ce72ce80fa 100644
> > --- a/include/asm-generic/export.h
> > +++ b/include/asm-generic/export.h
> > @@ -2,6 +2,14 @@
> >  #ifndef __ASM_GENERIC_EXPORT_H
> >  #define __ASM_GENERIC_EXPORT_H
> >
> > +/*
> > + * This comment block is used by fixdep. Please do not remove.
>
> I don't know much about fixdep. How does that work, if you could summarize?


You can find detailed explanation in scripts/basic/fixdep.c


In short, it works like this:

fixdep parses every source (including headers).
If it finds "CONFIG_MODVERSIONS", it adds a dependency
on $(wildcard include/config/MODVERSIONS)
to the .cmd files.

If CONFIG_MODVERSIONS is toggled in Kconfig,
it touches include/config/MODVERSIONS.    [1]

In the next run of Make, all the sources depending on
CONFIG_MODVERSIONS will be re-compiled because the
timestamp of include/config/MODVERSIONS is up-to-date.


[1]: https://github.com/torvalds/linux/blob/v5.17/scripts/kconfig/confdata.c#L141





> > + *
> > + * When CONFIG_MODVERSIONS is changed from n to y, all source files having
> > + * EXPORT_SYMBOL variants must be re-compiled because genksyms is run as a
> > + * side effect of the .o build rule.
> > + */
> > +
> >  #ifndef KSYM_FUNC
> >  #define KSYM_FUNC(x) x
> >  #endif
> > @@ -12,9 +20,6 @@
> >  #else
> >  #define KSYM_ALIGN 4
> >  #endif
> > -#ifndef KCRC_ALIGN
> > -#define KCRC_ALIGN 4
> > -#endif
>
> The #ifndef is there because arch/m68k/include/asm/export.h:1 defines
> KCRC_ALIGN. You should delete that, too.

Nice catch! I will clean it up too.




>
> > diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
> > index 4827c5abe5b7..6e6933ae7911 100644
> > --- a/scripts/genksyms/genksyms.c
> > +++ b/scripts/genksyms/genksyms.c
> > @@ -33,7 +33,7 @@ char *cur_filename;
> >  int in_source_file;
> >
> >  static int flag_debug, flag_dump_defs, flag_reference, flag_dump_types,
> > -          flag_preserve, flag_warnings, flag_rel_crcs;
> > +          flag_preserve, flag_warnings;
> >
> >  static int errors;
> >  static int nsyms;
> > @@ -681,10 +681,7 @@ void export_symbol(const char *name)
> >                         fputs(">\n", debugfile);
> >
> >                 /* Used as a linker script. */
>
> ^ Does this comment still apply?

No.  From this commit going forward,
the genksyms output will not be used as a linker script.

08/14 will delete this comment anyway, but
it is possible to remove it in this commit.








>
> > -               printf(!flag_rel_crcs ? "__crc_%s = 0x%08lx;\n" :
> > -                      "SECTIONS { .rodata : ALIGN(4) { "
> > -                      "__crc_%s = .; LONG(0x%08lx); } }\n",
> > -                      name, crc);
> > +               printf("__crc_%s = 0x%08lx;\n", name, crc);
> >         }
> >  }
> >
> > diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> > index eceb3ee7ec06..6aee2401f3ad 100755
> > --- a/scripts/link-vmlinux.sh
> > +++ b/scripts/link-vmlinux.sh
> > @@ -88,11 +88,6 @@ modpost_link()
> >                 gen_initcalls
> >                 lds="-T .tmp_initcalls.lds"
> >
> > -               if is_enabled CONFIG_MODVERSIONS; then
> > -                       gen_symversions
>
> ^ this is the only caller of gen_symversions, right? Then
> gen_symversions can be cleaned up, too?


We can keep it in this commit.

The follow-up cleaning is done in 07/14.

To avoid too big commit,
I separated the build flow change and
trivial cleanups.



>
> > -                       lds="${lds} -T .tmp_symversions.lds"
> > -               fi
> > -
> >                 # This might take a while, so indicate that we're doing
> >                 # an LTO link
> >                 info LTO ${1}
> > @@ -183,6 +178,10 @@ vmlinux_link()
> >                 libs="${KBUILD_VMLINUX_LIBS}"
> >         fi
> >
> > +       if is_enabled CONFIG_MODULES; then
> > +               objs="${objs} .vmlinux.export.o"
> > +       fi
> > +
> >         if [ "${SRCARCH}" = "um" ]; then
> >                 wl=-Wl,
> >                 ld="${CC}"
> > @@ -312,6 +311,7 @@ cleanup()
> >         rm -f vmlinux.o
> >         rm -f .vmlinux.d
> >         rm -f .vmlinux.objs
> > +       rm -f .vmlinux.export.c
>
> Probably can drop the `rm -f .tmp_symversions.lds` here, too?

It will be cleaned up by 07/14.







> --
> Thanks,
> ~Nick Desaulniers



--
Best Regards
Masahiro Yamada
