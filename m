Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5DD868E88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 12:13:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkZbm4FTPz3vZJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 22:13:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.50; helo=mail-io1-f50.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkZbM1lK6z30hQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 22:13:02 +1100 (AEDT)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7bed9fb159fso203537739f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 03:13:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709032379; x=1709637179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4Tv6sdcFEpWvZL/hYJEF+Ju7qt4AFqMkWFUs5NrLKU=;
        b=uNZKkTKaqLEOxQg2v4njJr6LK0c21HhkjMeX4UDvXESd3wMiTQwnk49vDqGrh14Ot2
         /Clt1KO3lazgTv9XDcumFmcO64fL6zjLfg8VHNo+1oPEH7a5i7+L6Ds43OvdAi1iUr0I
         9gRRM5S4X1i7TLXiyQSdDRmCToQF85FVpoSq6vj4p9Tm2nxyUfPHueHif+NdnAcp8JPR
         +GkZImbFKCRUJGQZaRLgijM1jBZC1z2ai9BM4W0i8aC3CPOBm3uZgUY139wMMJpS4mGt
         t5kXFwKdhQS7GFjNpZXTs7ngSrAKW4eK8RiQCShxJQHBbNuzciNJkGjWDDhzp8x4RVwE
         /uPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW4ftxX/MD+bEqQHiPThpWh1yelKOX++GDshC24uqGlGI1+9ekBmZ40g8IE1W4A+KCDOMWPfLctG8aTR6w5+RuBihqL/b0tLeSB3oZoQ==
X-Gm-Message-State: AOJu0YzP7e/55dPOg5wjoZo9YyDKK9KwIXOVPnx6PO0Tt3OQXO/VQxVb
	4DHblPWGYFHOvevEws0ai3Dkvggxu32UTMFq31oXQSwXHL9Pu0VbA2USqUHEga3phQ==
X-Google-Smtp-Source: AGHT+IEhxWABuR6+ISm3buRxhp8ND8A4dn1IZGCJiZFO58e0U8eJlt25agxxMqNtQAXmFJf1KwoMSg==
X-Received: by 2002:a6b:6b11:0:b0:7c5:2021:3fe with SMTP id g17-20020a6b6b11000000b007c5202103femr11185572ioc.16.1709032378855;
        Tue, 27 Feb 2024 03:12:58 -0800 (PST)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com. [209.85.166.43])
        by smtp.gmail.com with ESMTPSA id eh3-20020a056638298300b0047466fd3b1dsm1695404jab.22.2024.02.27.03.12.58
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 03:12:58 -0800 (PST)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7bed9fb159fso203536939f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 03:12:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWIoDdY0wCr3Yp1zMg1JYNW8zoX4UkD9XI0fVaPGdsL8UA7YKhsUIpDkYJ2u7kO3pzEEqGhbczkprr9qB3fHoAag7C+PXiBeY0DZhQrNA==
X-Received: by 2002:a5b:ecc:0:b0:dc6:c32f:6126 with SMTP id
 a12-20020a5b0ecc000000b00dc6c32f6126mr1607871ybs.22.1709032357452; Tue, 27
 Feb 2024 03:12:37 -0800 (PST)
MIME-Version: 1.0
References: <20240226161414.2316610-1-arnd@kernel.org> <20240226161414.2316610-4-arnd@kernel.org>
 <CAMuHMdWRBQF95fJ+NkPUdvpu5VfRm2WyTnvdqB1Xe7d4vsvY2g@mail.gmail.com> <164616c2-94f6-40e8-86e0-850dc8da212e@app.fastmail.com>
In-Reply-To: <164616c2-94f6-40e8-86e0-850dc8da212e@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 12:12:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQYPtL0J4Phm81S1qWpi7no=1r4uStbLd8zbjn7fcWQw@mail.gmail.com>
Message-ID: <CAMuHMdXQYPtL0J4Phm81S1qWpi7no=1r4uStbLd8zbjn7fcWQw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arch: define CONFIG_PAGE_SIZE_*KB on all architectures
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>, Greg Ungerer <gerg@linux-m68k.org>, Jan Kiszka <jan.kiszka@siemens.com>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-alpha@vger.kernel.org, Kees Cook <keescook@chromium.org>, Brian Cain <bcain@quicinc.com>, Kieran Bingham <kbingham@kernel.org>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Andy Lutom
 irski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Gleixner <anna-maria@linutronix.de>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

CC Greg

On Tue, Feb 27, 2024 at 11:59=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> On Tue, Feb 27, 2024, at 09:54, Geert Uytterhoeven wrote:
> >> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> >> index 9dcf245c9cbf..c777a129768a 100644
> >> --- a/arch/m68k/Kconfig.cpu
> >> +++ b/arch/m68k/Kconfig.cpu
> >> @@ -30,6 +30,7 @@ config COLDFIRE
> >>         select GENERIC_CSUM
> >>         select GPIOLIB
> >>         select HAVE_LEGACY_CLK
> >> +       select HAVE_PAGE_SIZE_8KB if !MMU
> >
> > .... if you would drop the !MMU-dependency here.
> >
> >>
> >>  endchoice
> >>
> >> @@ -45,6 +46,7 @@ config M68000
> >>         select GENERIC_CSUM
> >>         select CPU_NO_EFFICIENT_FFS
> >>         select HAVE_ARCH_HASH
> >> +       select HAVE_PAGE_SIZE_4KB
> >
> > Perhaps replace this by
> >
> >     config M68KCLASSIC
> >             bool "Classic M68K CPU family support"
> >             select HAVE_ARCH_PFN_VALID
> >   +         select HAVE_PAGE_SIZE_4KB if !MMU
> >
> > so it covers all 680x0 CPUs without MMU?
>
> I was a bit unsure about how to best do this since there
> is not really a need for a fixed page size on nommu kernels,
> whereas the three MMU configs clearly tie the page size to
> the MMU rather than the platform.
>
> There should be no reason for coldfire to have a different
> page size from dragonball if neither of them actually uses
> hardware pages, so one of them could be changed later.

Indeed, in theory, PAGE_SIZE doesn't matter for nommu, but the concept
of pages is used all over the place in Linux.

I'm mostly worried about some Coldfire code relying on the actual value
of PAGE_SIZE in some other context. e.g. for configuring non-cacheable
regions.

And does this impact running nommu binaries on a system with MMU?
I.e. if nommu binaries were built with a 4 KiB PAGE_SIZE, do they
still run on MMU systems with an 8 KiB PAGE_SIZE (coldfire and sun3),
or are there some subtleties to take into account?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
