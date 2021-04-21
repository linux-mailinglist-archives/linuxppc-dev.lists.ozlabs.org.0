Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CE53668E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 12:10:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQGWm3nHyz30Dk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 20:10:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=lPIoiLzS;
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
 header.s=dec2015msa header.b=lPIoiLzS; 
 dkim-atps=neutral
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQGWD4jHrz2yRD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 20:09:44 +1000 (AEST)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 13LA9Axu031287
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 19:09:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 13LA9Axu031287
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1618999751;
 bh=jhq+x3zjBvV6IAAGAyQZXvcnjJO//NC8m8/bq1kaUxI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lPIoiLzS1IF35q+hUUwlRey2ueTP5jaXUnrJrhAHuBQWPaS4VEwqvF3gjkPiLWkRe
 4uhFq5iWnkS9bQMKHF7tcR1bPzthJQqS/Xlg9HEHQyCc9YwMsCVnyjB682+1/USTFT
 SobIuVxyrmP1a+KKlDCthlTAHQJ357DitVzhB3jUhOAo8jIETZQcbz1rCxDA1KPufz
 qoU4Mc70/euZC3boqz0ecLTu3zF4vtpNKIvipQMKRvCtoR9hkvdi/BehPkwUxpsEPK
 0DCWuIjB7DBe5lRSQvZLkXVmF9dk3fyxxRvWoKPzW4/H4LaztRuu/JYFe+ileZlihR
 tH8SoAL437XPQ==
X-Nifty-SrcIP: [209.85.215.169]
Received: by mail-pg1-f169.google.com with SMTP id z16so29308926pga.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 03:09:10 -0700 (PDT)
X-Gm-Message-State: AOAM531UIRIJCQoCndFjTl53VfkODgg7XFUbvHMy8/BMK4E43tmsGFUt
 pTwdFQOLHFxgGYcgiKQssGzFfLnXiVbnpSwMai0=
X-Google-Smtp-Source: ABdhPJxMZ6D4N7IoEqjuGhVQs4Qv87hZqLvpPdYED1G/OXxMw/60fIsER4DTpQrlhVw+IwSK8FYvzz5pGVrFdmH04Js=
X-Received: by 2002:a63:e044:: with SMTP id n4mr21340657pgj.47.1618999750211; 
 Wed, 21 Apr 2021 03:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <45afab41-cc5f-dffa-712a-d5fb1a9d0a23@infradead.org>
 <87tuo0az16.fsf@mpe.ellerman.id.au>
In-Reply-To: <87tuo0az16.fsf@mpe.ellerman.id.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 21 Apr 2021 19:08:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNATUZuDigADB8JP+wO=hvk+guM-DU=XYpaFxcYG6ErWo9Q@mail.gmail.com>
Message-ID: <CAK7LNATUZuDigADB8JP+wO=hvk+guM-DU=XYpaFxcYG6ErWo9Q@mail.gmail.com>
Subject: Re: powerpc{32,64} randconfigs
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 21, 2021 at 4:15 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Randy Dunlap <rdunlap@infradead.org> writes:
> > Hi,
> >
> > Is there a way to do this?
> >
> > $ make ARCH=powerpc randconfig # and force PPC32
>
> Sort of:
>
> $ KCONFIG_ALLCONFIG=arch/powerpc/configs/book3s_32.config make randconfig
>
> But that also forces BOOK3S.
>
> > and separately
> > $ make ARCH=powerpc randconfig # and force PPC64
>
> No.
>
> ...
> > OK, I have a patch that seems for work as far as setting
> > PPC32=y or PPC64=y... but it has a problem during linking
> > of vmlinux:
> >
> > crosstool/gcc-9.3.0-nolibc/powerpc-linux/bin/powerpc-linux-ld:./arch/powerpc/kernel/vmlinux.lds:6: syntax error
> >
> > and the (bad) generated vmlinux.lds file says (at line 6):
> >
> > OUTPUT_ARCH(1:common)
> >
> > while it should say:
> >
> > OUTPUT_ARCH(powerpc:common)
> >
> > Does anyone have any ideas about this problem?
>
> I guess your patch broke something? :D
> Not sure sorry.
>
> What about something like this?
>
> cheers
>
>
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 3212d076ac6a..712c5e8768ce 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -376,6 +376,16 @@ PHONY += ppc64_book3e_allmodconfig
>         $(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/85xx-64bit.config \
>                 -f $(srctree)/Makefile allmodconfig
>
> +PHONY += ppc32_randconfig
> +ppc32_randconfig:
> +       $(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/32-bit.config \
> +               -f $(srctree)/Makefile randconfig
> +
> +PHONY += ppc64_randconfig
> +ppc64_randconfig:
> +       $(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/64-bit.config \
> +               -f $(srctree)/Makefile randconfig
> +
>  define archhelp
>    @echo '* zImage          - Build default images selected by kernel config'
>    @echo '  zImage.*        - Compressed kernel image (arch/$(ARCH)/boot/zImage.*)'
> diff --git a/arch/powerpc/configs/32-bit.config b/arch/powerpc/configs/32-bit.config
> new file mode 100644
> index 000000000000..bdf833009006
> --- /dev/null
> +++ b/arch/powerpc/configs/32-bit.config
> @@ -0,0 +1 @@
> +CONFIG_PPC64=n

Please do:

# CONFIG_PPC64 is not set





> diff --git a/arch/powerpc/configs/64-bit.config b/arch/powerpc/configs/64-bit.config
> new file mode 100644
> index 000000000000..0fe6406929e2
> --- /dev/null
> +++ b/arch/powerpc/configs/64-bit.config
> @@ -0,0 +1 @@
> +CONFIG_PPC64=y
>


-- 
Best Regards
Masahiro Yamada
