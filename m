Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE6F7B7125
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 20:38:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0RQp0P93z3w2F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 05:38:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.222.180; helo=mail-qk1-f180.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0Phv4cpsz2ysB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 04:20:13 +1100 (AEDT)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-773ac11de71so85076085a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Oct 2023 10:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696353610; x=1696958410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDlx4Wu9l39McbXAmxr/aQafR9CqgRAFRsdqHoaziys=;
        b=eZ6qrvJ7C1UpBmd2mLY9pzijF0NCuXzEp+TF49G6T0e+01Fl2/HUgSg431uUja55zF
         c6FelYExHGL5Kjnq0VVp2bjazX7J2omzURUkmSvLEfcpIOkcnjVWMGME/iFmQY6vUvCV
         8zEEPhS3pVDLrf32OoGsPzcv0JnDXLwO0FXSURpNoXcKA8lTWaXSM/fIICEgfTGKUzaG
         835gPCXOU2Qs1wufiUvlhIBbMqrosEI2gxh9lmYaKSsb/bxm1Kh2CPT8hJSTv2zp1n2S
         4cwQtmWn+ZcUROTaGUeSq7gvqMiY57Bxqpw1sRddtS6lwgpdezhPD1ZwqiXOJzIQgAcT
         3Kng==
X-Gm-Message-State: AOJu0YxbnYNz2taxFv9Y3mDJBcbOo2Fm5hGALPlKQ8vl5Lykumsq45S1
	9nfJEm3+tjK1UaYVoynAUnZXyLpI7uHzoA==
X-Google-Smtp-Source: AGHT+IFLdISeJG3vqDOnN7YKB6DHvajbNbCVF+Ix4sHYdtC8Suw+turr4qFvQg9+qMaLVSCENdoaXA==
X-Received: by 2002:a05:620a:468b:b0:774:2a0e:1166 with SMTP id bq11-20020a05620a468b00b007742a0e1166mr229741qkb.17.1696353610542;
        Tue, 03 Oct 2023 10:20:10 -0700 (PDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id g4-20020ae9e104000000b007743360b3fasm621003qkm.34.2023.10.03.10.20.09
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 10:20:10 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-65af7e20f39so7606156d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Oct 2023 10:20:09 -0700 (PDT)
X-Received: by 2002:a81:a14b:0:b0:583:6db3:a007 with SMTP id
 y72-20020a81a14b000000b005836db3a007mr272837ywg.17.1696353588829; Tue, 03 Oct
 2023 10:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230914185804.2000497-1-sohil.mehta@intel.com>
In-Reply-To: <20230914185804.2000497-1-sohil.mehta@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Oct 2023 19:19:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDho+vRAnQ3_AWjLcGgrNKNhWGmpdpjipq53QjvRrUJw@mail.gmail.com>
Message-ID: <CAMuHMdWDho+vRAnQ3_AWjLcGgrNKNhWGmpdpjipq53QjvRrUJw@mail.gmail.com>
Subject: Re: [PATCH v2] arch: Reserve map_shadow_stack() syscall number for
 all architectures
To: Sohil Mehta <sohil.mehta@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 04 Oct 2023 05:32:24 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, "Eric W . Biederman" <ebiederm@xmission.com>, Arnd Bergmann <arnd@arndb.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Matt Turner 
 <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sergei Trofimovich <slyich@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>, Brian Gerst <brgerst@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, Mark Brown <broonie@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Arnaldo Carvalho de Melo <acme@kernel.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Deepak Gupta <debug@rivosinc.com>, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-api@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Adrian Hunter <adrian.hu
 nter@intel.com>, linux-perf-users@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 14, 2023 at 8:59=E2=80=AFPM Sohil Mehta <sohil.mehta@intel.com>=
 wrote:
> commit c35559f94ebc ("x86/shstk: Introduce map_shadow_stack syscall")
> recently added support for map_shadow_stack() but it is limited to x86
> only for now. There is a possibility that other architectures (namely,
> arm64 and RISC-V), that are implementing equivalent support for shadow
> stacks, might need to add support for it.
>
> Independent of that, reserving arch-specific syscall numbers in the
> syscall tables of all architectures is good practice and would help
> avoid future conflicts. map_shadow_stack() is marked as a conditional
> syscall in sys_ni.c. Adding it to the syscall tables of other
> architectures is harmless and would return ENOSYS when exercised.
>
> Note, map_shadow_stack() was assigned #453 during the merge process
> since #452 was taken by fchmodat2().
>
> For Powerpc, map it to sys_ni_syscall() as is the norm for Powerpc
> syscall tables.
>
> For Alpha, map_shadow_stack() takes up #563 as Alpha still diverges from
> the common syscall numbering system in the other architectures.
>
> Link: https://lore.kernel.org/lkml/20230515212255.GA562920@debug.ba.rivos=
inc.com/
> Link: https://lore.kernel.org/lkml/b402b80b-a7c6-4ef0-b977-c0f5f582b78a@s=
irena.org.uk/
>
> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>

>  arch/m68k/kernel/syscalls/syscall.tbl       | 1 +

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
