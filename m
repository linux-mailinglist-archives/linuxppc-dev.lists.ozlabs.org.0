Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A34842BBAB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 11:32:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTnPl128Yz3cKM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 20:32:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.51; helo=mail-ua1-f51.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTk0k4VjNz2ypB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 17:59:18 +1100 (AEDT)
Received: by mail-ua1-f51.google.com with SMTP id 64so2466070uab.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 23:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vLmWoWym/1fKiJu7c9gpS1cDGT+57poTvw7kTscrC00=;
 b=ROGi7CHlpNQPdG7jNmoEXJLxQ+6gOsqAeLhDEVczvsNiO8fG0gB8K9hp++Mc0SQaSl
 GAOp5T5lHXHIXsS2OR+vJgYrfCyWqhibOsiJ7iG9mcSUF81OJpuA4qrwYPrx+1jLfnge
 axgv2LL4qbacswA5Ea2KmBgvLtEmVI4NXwhGTQXaSqa7pSSAMiGxgKC0rHAp43+L7kpt
 9dDhi3hQFL1ghwuTRWJ6olfyogsLbp0DLecsvl0Ng2F65Chvm5Jp6/SJ2cUYwmrxZkPo
 bnFQxJyq5Clp62Xo+hKVD1IOuq8QphxlAlJlZ3P/Ph1PLTJeR6TPrEK1TgDHyHdRpDHE
 ebPg==
X-Gm-Message-State: AOAM530N7gvfsEtSGLB0YsoldV/jjC0eKl+U+moTPsje5GlZ/LhHdlo5
 iqM7ck5x2Xt2/a3LeVagNcGv2jrbJ8ufbRLWKZU=
X-Google-Smtp-Source: ABdhPJzwsQvQy07KzSSKF36slqOOCBmzhi7G4XFKh+MxO1aqVfgv6UylAsUlKqrZrwFEymqmWaysD4XtAMh8gSFAJlY=
X-Received: by 2002:a67:d583:: with SMTP id m3mr36353545vsj.41.1634108355035; 
 Tue, 12 Oct 2021 23:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211013063622.548590-1-masahiroy@kernel.org>
 <20211013063622.548590-2-masahiroy@kernel.org>
In-Reply-To: <20211013063622.548590-2-masahiroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Oct 2021 08:59:03 +0200
Message-ID: <CAMuHMdUQVpvvq=ZqjL97gV6AxS5eGm4mRS=gL4PPwWiBS-v5AA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: use more subdir- for visiting subdirectories
 while cleaning
To: Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 13 Oct 2021 20:30:31 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Rich Felker <dalias@libc.org>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Paul Mackerras <paulus@samba.org>,
 Jonas Bonn <jonas@southpole.se>, Rob Herring <robh@kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Matt Turner <mattst88@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Robert Richter <rric@kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild <linux-kbuild@vger.kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Nathan Chancellor <nathan@kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, William Cohen <wcohen@redhat.com>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Michal Marek <michal.lkml@markovi.net>, Julien Thierry <jthierry@redhat.com>,
 Nick Hu <nickhu@andestech.com>, linux-s390 <linux-s390@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Borislav Petkov <bp@alien8.de>, Vineet Gupta <vgupta@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>, x86@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 13, 2021 at 8:43 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> Documentation/kbuild/makefiles.rst suggests to use "archclean" for
> cleaning arch/$(SRCARCH)/boot/.
>
> Since commit d92cc4d51643 ("kbuild: require all architectures to have
> arch/$(SRCARCH)/Kbuild"), we can use the "subdir- += boot" trick for
> all architectures. This can take advantage of the parallel option (-j)
> for "make clean".
>
> I also cleaned up the comments. The "archdep" target does not exist.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

>  arch/m68k/Makefile                 |  4 +---

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
