Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D08F6A8027
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 11:45:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PS76G0N6qz3f3d
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 21:45:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.173; helo=mail-qt1-f173.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PS75g723hz2yPY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 21:44:38 +1100 (AEDT)
Received: by mail-qt1-f173.google.com with SMTP id d7so17423205qtr.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Mar 2023 02:44:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHoXp6+7/Ivp8TZOu6tqpc5Wq/dN7ibmjBTE7vH9gt0=;
        b=0OioFWxaL4X8VudhssDP5XVRPJ8K6YqRU4nrNYsqheUlgh4mnIAAZUpG+D2x9+O1DI
         u9WgMoP8VdmaiRo7VZpZLmY0vZSOeyHG//ExnpyxIV+OFoF6scddnYYLRm6lXwvycpNe
         1YKenE2Efqw/AeXlNxpQOdsaR7f0OA65oYUNuZiGEUp60Wqgw0hjoYcC45uMSbNRaB6u
         ExW3bEDDak+1qoE8ykd+05XQFWOoKh0DL7YSWRlhGPiNI4asfSZoOIfb7DffNoC96wum
         yRNayQGCtL8foPfUTK8XPnwLogD2qJbrER3lY2p8VE7curB3P9pQ1HyXiEU4QTd8QEnY
         9DnQ==
X-Gm-Message-State: AO0yUKUHB/TX1bAlDxnkRXUI2t+N740csjAfv8SQFuOtdhwA8YQK2uZu
	e5CNmvjxr4GFtzHDKLhkxdMMiTCP6sUY8Q==
X-Google-Smtp-Source: AK7set+UAVnJMncW/p2cU3CjKjQth6ygL7SBlptyndsT0ppg4C1iEb3wDnUPebw14g5Hn878Pvl32Q==
X-Received: by 2002:a05:622a:cf:b0:3bf:be7d:b3e5 with SMTP id p15-20020a05622a00cf00b003bfbe7db3e5mr16851468qtw.41.1677753875325;
        Thu, 02 Mar 2023 02:44:35 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id b3-20020ac86783000000b003bfb845497dsm9858874qtp.97.2023.03.02.02.44.34
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 02:44:34 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-536bbef1c5eso419116957b3.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Mar 2023 02:44:34 -0800 (PST)
X-Received: by 2002:a5b:1cf:0:b0:a43:52fe:c36f with SMTP id
 f15-20020a5b01cf000000b00a4352fec36fmr4318975ybp.7.1677753853997; Thu, 02 Mar
 2023 02:44:13 -0800 (PST)
MIME-Version: 1.0
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
 <CAMuHMdVC99kFpS9vL+HEqbXdDRMKVSW_t21X1p37d0oQufxKLw@mail.gmail.com> <c0dd1a6e-8e8e-5cdb-bc92-755462704edf@ghiti.fr>
In-Reply-To: <c0dd1a6e-8e8e-5cdb-bc92-755462704edf@ghiti.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Mar 2023 11:44:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSJADwTSkOD2mG2yU0XeFd0QAUjojQDz5phWhkRcLGOg@mail.gmail.com>
Message-ID: <CAMuHMdVSJADwTSkOD2mG2yU0XeFd0QAUjojQDz5phWhkRcLGOg@mail.gmail.com>
Subject: Re: [PATCH v4 00/24] Remove COMMAND_LINE_SIZE from uapi
To: Alexandre Ghiti <alex@ghiti.fr>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-xtensa@linux-xt
 ensa.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alex,

On Thu, Mar 2, 2023 at 11:09=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wro=
te:
> On 3/2/23 10:47, Geert Uytterhoeven wrote:
> > On Thu, Mar 2, 2023 at 10:35=E2=80=AFAM Alexandre Ghiti <alexghiti@rivo=
sinc.com> wrote:
> >> This all came up in the context of increasing COMMAND_LINE_SIZE in the
> >> RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE is t=
he
> >> maximum length of /proc/cmdline and userspace could staticly rely on
> >> that to be correct.
> >>
> >> Usually I wouldn't mess around with changing this sort of thing, but
> >> PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SI=
ZE
> >> to 2048").  There are also a handful of examples of COMMAND_LINE_SIZE
> >> increasing, but they're from before the UAPI split so I'm not quite su=
re
> >> what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE from
> >> asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to kernel
> >> boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE"),
> >> and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
> >> asm-generic/setup.h.").
> >>
> >> It seems to me like COMMAND_LINE_SIZE really just shouldn't have been
> >> part of the uapi to begin with, and userspace should be able to handle
> >> /proc/cmdline of whatever length it turns out to be.  I don't see any
> >> references to COMMAND_LINE_SIZE anywhere but Linux via a quick Google
> >> search, but that's not really enough to consider it unused on my end.
> >>
> >> This issue was already considered in s390 and they reached the same
> >> conclusion in commit 622021cd6c56 ("s390: make command line
> >> configurable").
> >>
> >> The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE reall=
y
> >> shouldn't be part of uapi, so this now touches all the ports.  I've
> >> tried to split this all out and leave it bisectable, but I haven't
> >> tested it all that aggressively.
> >>
> >> Changes since v3 <https://lore.kernel.org/all/20230214074925.228106-1-=
alexghiti@rivosinc.com/>:
> >> * Added RB/AB
> >> * Added a mention to commit 622021cd6c56 ("s390: make command line
> >>    configurable") in the cover letter
> > Thanks for the update!
> >
> >   Apparently you forgot to add your own SoB?
>
> I do not know, should I? Palmer did all the work, I only fixed 3 minor
> things

If you are picking up patches, and submitting them to someone else
for upstream inclusion, you should add your own SoB.
https://elixir.bootlin.com/linux/latest/source/Documentation/process/submit=
ting-patches.rst#L419

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
