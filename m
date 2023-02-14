Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7637695DC7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 09:59:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGFWl5Hbpz3cRW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 19:59:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.41; helo=mail-ej1-f41.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGFVy6cGLz3cMT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 19:58:50 +1100 (AEDT)
Received: by mail-ej1-f41.google.com with SMTP id gn39so4213ejc.8
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 00:58:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXpQWLOfRB0cj7wBmiF/GaVLxY5OIU6uD4JxDn3mdPQ=;
        b=yIN/xdDCQ9y58e6UQ1H/swnPlUOgi3nc4CruprZ/0E3QskN0TLmawbI5gQ9fLf9G2M
         uBkSch+g/2W8eP2ynn4qH3UPGVjVHM0xWV5MZK02FwVnRGrLPFhZRO/+Ku86J3nm6IWQ
         Z57bwyiXYWQwCtM5kg/C2hWmznk4TPz95vQgB+gKXHoAxEr1CkrmPkpozelPN4aavpxx
         JtrQ2gapmp+/JnDfxRqWgsv+6aqSJs0sdnOjf0z4q2Q7ttN8ymkmNzt+OqEQ32JWxCr8
         KIpht/PAOIZRWW1Q3Ob7+dCpBj763MybYFxSbj7qsJtHSisZ+vjM7jPJjYIHUhHXeruT
         P19w==
X-Gm-Message-State: AO0yUKXDCOEIyUL/NeATVIeyO5ccCvTtSWQ215hLncoprShh11mSIXKo
	BLk4vrGhlI66b/7U9ibNWw1Q7o1ldaS52A6H
X-Google-Smtp-Source: AK7set+52vptqBTnfLDPwL7XgoRxFhsWlgovA4+7pfVD3HsI+Ctg9NoN/+JtO0MTirnXSUX8SHuxSw==
X-Received: by 2002:a17:907:7245:b0:8a5:8620:575 with SMTP id ds5-20020a170907724500b008a586200575mr2761245ejc.3.1676365125554;
        Tue, 14 Feb 2023 00:58:45 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id e13-20020a170906044d00b0088eb55ed9cbsm7947966eja.187.2023.02.14.00.58.43
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 00:58:45 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id gn39so3681ejc.8
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 00:58:43 -0800 (PST)
X-Received: by 2002:a05:651c:4ca:b0:28e:54f:b187 with SMTP id
 e10-20020a05651c04ca00b0028e054fb187mr203743lji.5.1676365112291; Tue, 14 Feb
 2023 00:58:32 -0800 (PST)
MIME-Version: 1.0
References: <20230214074925.228106-1-alexghiti@rivosinc.com> <Y+tIl07KOOrGZ2Et@osiris>
In-Reply-To: <Y+tIl07KOOrGZ2Et@osiris>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Feb 2023 09:58:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVG4=UmKDa17dys9e3iGM75u4+13nQVyjMHK--aD6WKfw@mail.gmail.com>
Message-ID: <CAMuHMdVG4=UmKDa17dys9e3iGM75u4+13nQVyjMHK--aD6WKfw@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] Remove COMMAND_LINE_SIZE from uapi
To: Heiko Carstens <hca@linux.ibm.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-xtensa@linux-xt
 ensa.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Vasily Gorbik <gor@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Heiko,

On Tue, Feb 14, 2023 at 9:39 AM Heiko Carstens <hca@linux.ibm.com> wrote:
> On Tue, Feb 14, 2023 at 08:49:01AM +0100, Alexandre Ghiti wrote:
> > This all came up in the context of increasing COMMAND_LINE_SIZE in the
> > RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE is the
> > maximum length of /proc/cmdline and userspace could staticly rely on
> > that to be correct.
> >
> > Usually I wouldn't mess around with changing this sort of thing, but
> > PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SIZE
> > to 2048").  There are also a handful of examples of COMMAND_LINE_SIZE
> > increasing, but they're from before the UAPI split so I'm not quite sure
> > what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE from
> > asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to kernel
> > boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE"),
> > and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
> > asm-generic/setup.h.").
> >
> > It seems to me like COMMAND_LINE_SIZE really just shouldn't have been
> > part of the uapi to begin with, and userspace should be able to handle
> > /proc/cmdline of whatever length it turns out to be.  I don't see any
> > references to COMMAND_LINE_SIZE anywhere but Linux via a quick Google
> > search, but that's not really enough to consider it unused on my end.
> >
> > The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE really
> > shouldn't be part of uapi, so this now touches all the ports.  I've
> > tried to split this all out and leave it bisectable, but I haven't
> > tested it all that aggressively.
>
> Just to confirm this assumption a bit more: that's actually the same
> conclusion that we ended up with when commit 3da0243f906a ("s390: make
> command line configurable") went upstream.

Commit 622021cd6c560ce7 ("s390: make command line configurable"),
I assume?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
