Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD4254407D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 02:20:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJPr64d2Hz3hGq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 10:20:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HtYdKOzL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HtYdKOzL;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJC1p60qnz3bk7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 02:13:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 79B2261856
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jun 2022 16:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA7D2C341DB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jun 2022 16:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654704777;
	bh=sPGKDjlNYa4MR2u/HdIgrLdEoGRguN2WqLZlFp878w8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HtYdKOzL60S50CSdu15Hbl7rcp8s7a6FjJd46ni2tBu8mgjYZBFmN4xRjvcLr+HFL
	 Ef33rVtviLf26nPeBg+8ngXYycCJZVH31+vQ+PjGpS3n03W2uZWanRjLXPuUu19R59
	 4NjYuGR/ZOwnmUzdzFIR6dIaXRSqDecj4Qr79IwtQ83bPX7GkHS3y8UBYbyVF6LP5m
	 KPvmHGMu6y+S2FQLvko6YR83CvA8guulti0JSYwj51T3MFxNJbsfzhr7dqzIGYogZa
	 5/y4Ww6Yv15hlg7oS7rujceQJumlZGZ/X8aPO9PQaITIFs0nB2Kl1sg3oVal5Fs1iw
	 eNzrw4LYXl9hw==
Received: by mail-ot1-f42.google.com with SMTP id w19-20020a9d6393000000b0060aeb359ca8so15442417otk.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jun 2022 09:12:57 -0700 (PDT)
X-Gm-Message-State: AOAM5323wxksA2A29U2i3A/ySOwo3vKbtXB7nX33XOgCUcLmZnar8Tuk
	QXDGbDGTYlx8O9I9KZLIWY+h0Yncxfa5StMo010=
X-Google-Smtp-Source: ABdhPJzo2KFde92icAvNQAhts5Ivj5Z3Zxtv6YtGuJhZFN0HTgsP9YMJk/IQIjq/wQ9d9NGuy7Qoa0yG3TY53Ynahlk=
X-Received: by 2002:a25:a242:0:b0:651:a78d:4636 with SMTP id
 b60-20020a25a242000000b00651a78d4636mr35602450ybi.9.1654704765774; Wed, 08
 Jun 2022 09:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220608000014.3054333-1-jarkko@profian.com> <CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com>
 <YqAy0qjI4Lktk/uJ@iki.fi> <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org>
In-Reply-To: <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 8 Jun 2022 09:12:34 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com>
Message-ID: <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
To: Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 09 Jun 2022 09:55:19 +1000
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
Cc: Dan Li <ashimida@linux.alibaba.com>, Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>, Guo Ren <guoren@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Javier Martinez Canillas <javierm@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, Michael Roth <michael.roth@amd.com>, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Andrey Konovalov <andreyknvl@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Sven Schnelle <svens@linux.ibm.com>, Wu Caize <zepan@sipeed.com>, Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Luis Machado <luis.machado@linaro.org>, Atsushi Nemoto <a
 nemo@mba.ocn.ne.jp>, Dave Hansen <dave.hansen@linux.intel.com>, Joey Gouly <joey.gouly@arm.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-s390 <linux-s390@vger.kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Helge Deller <deller@gmx.de>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, Vasily Gorbik <gor@linux.ibm.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Dave Anglin <dave.anglin@bell.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Daniel Axtens <dja@axtens.net>, Nicolas Pitre <nico@fluxnic.net>, Jarkko Sakkinen <jarkko@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, Emil Renner Berthing <kernel@esmil.dk>, Jordan Niethe <jniethe5@gmail.com>, Atish Patra <atishp@atishpatra.org>, Alexei Starovoitov <ast@kernel.o
 rg>, Will Deacon <will@kernel.org>, Masahiro Yamada <

masahiroy@kernel.org>, Jarkko Sakkinen <jarkko@profian.com>, Sami Tolvanen <samitolvanen@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Alexander Egorenkov <egorenar@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Parisc List <linux-parisc@vger.kernel.org>, Nathaniel McCallum <nathaniel@profian.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Tobias Huschle <huschle@linux.ibm.com>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, Miroslav Benes <mbenes@suse.cz>, Chen Zhongjin <chenzhon
 gjin@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, the arch/x86 maintainers <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-riscv <linux-riscv@lists.infradead.org>, Ingo Molnar <mingo@redhat.com>, Aaron Tomlin <atomlin@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Liao Chang <liaochang1@huawei.com>, Paul Walmsley <paul.walmsley@sifive.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Thomas Richter <tmricht@linux.ibm.com>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Changbin Du <changbin.du@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 8, 2022 at 7:21 AM Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
> Hi Jarkko,
>
> On Wed, 8 Jun 2022 08:25:38 +0300
> Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> > On Wed, Jun 08, 2022 at 10:35:42AM +0800, Guo Ren wrote:
> > > .
> > >
> > > On Wed, Jun 8, 2022 at 8:02 AM Jarkko Sakkinen <jarkko@profian.com> wrote:
> > > >
> > > > Tracing with kprobes while running a monolithic kernel is currently
> > > > impossible because CONFIG_KPROBES is dependent of CONFIG_MODULES.  This
> > > > dependency is a result of kprobes code using the module allocator for the
> > > > trampoline code.
> > > >
> > > > Detaching kprobes from modules helps to squeeze down the user space,
> > > > e.g. when developing new core kernel features, while still having all
> > > > the nice tracing capabilities.
> > > >
> > > > For kernel/ and arch/*, move module_alloc() and module_memfree() to
> > > > module_alloc.c, and compile as part of vmlinux when either CONFIG_MODULES
> > > > or CONFIG_KPROBES is enabled.  In addition, flag kernel module specific
> > > > code with CONFIG_MODULES.
> > > >
> > > > As the result, kprobes can be used with a monolithic kernel.
> > > It's strange when MODULES is n, but vmlinux still obtains module_alloc.
> > >
> > > Maybe we need a kprobe_alloc, right?
> >
> > Perhaps not the best name but at least it documents the fact that
> > they use the same allocator.
> >
> > Few years ago I carved up something "half-way there" for kprobes,
> > and I used the name text_alloc() [*].
> >
> > [*] https://lore.kernel.org/all/20200724050553.1724168-1-jarkko.sakkinen@linux.intel.com/
>
> Yeah, I remember that. Thank you for updating your patch!
> I think the idea (split module_alloc() from CONFIG_MODULE) is good to me.
> If module support maintainers think this name is not good, you may be
> able to rename it as text_alloc() and make the module_alloc() as a
> wrapper of it.

IIUC, most users of module_alloc() use it to allocate memory for text, except
that module code uses it for both text and data. Therefore, I guess calling it
text_alloc() is not 100% accurate until we change the module code (to use
a different API to allocate memory for data).

Thanks,
Song

>
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> for kprobe side.
>
> Thank you,
>
> --
> Masami Hiramatsu (Google) <mhiramat@kernel.org>
