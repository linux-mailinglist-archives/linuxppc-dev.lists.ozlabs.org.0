Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27876544080
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 02:22:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJPsz00bTz3f8q
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 10:21:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ivA4OAsW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ivA4OAsW;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJFr30DyZz3blX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 04:19:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1A15261BF3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jun 2022 18:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14774C341C8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jun 2022 18:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654712382;
	bh=BrMt+22N41uzooUnzPUoRXnpI1kF+bmp+ST9j+9wk1U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ivA4OAsW++8ZjxCbAwaoJ4Ocmy2TO84fUgcc0eOwQ9vYXwb7n8+Jq0xRwRWkWNi7m
	 2mQKJfAbLxccKBQFu8niWLiJU96zAPpyqwrQxX9EcN88eoNKLPGJeANYb1Znd4y9hz
	 bAf7wgePUqsrEBUO6emkpmOnfpaMfDJdTM5qtmuk5Ijn5mgQ8ilrPW8fSRwcgqMc6y
	 YGs6H6mPqrzoKjoZXIrcahMFQeQFREusERs4S+7IqrWPqwoTFrn4eRORAAXTG1vJRa
	 qkxvMJUm1Ox+d4+km9NwSPsMtD1wJ8Mh/S1tL34v9XjYShxa+CAnhoFREDXQ91d4Vm
	 JCAM7//qgFtDg==
Received: by mail-yb1-f174.google.com with SMTP id r82so37827757ybc.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jun 2022 11:19:42 -0700 (PDT)
X-Gm-Message-State: AOAM533VXkZcZ9YBvNZKkVgxZIvcH4VwQhfPzYsfBrlCo/sza9yF7h8I
	ojCl7IELIzfvys0TyAzNhmbZBLvs67kubhZt1t8=
X-Google-Smtp-Source: ABdhPJzriHyGLGwDai2rVcky87dr5my3t8HULhAS0zE1LEI+/L1Wv0eduSFTK2BSoTXq6GOLOf6KiMiv8mt8c35aPAU=
X-Received: by 2002:a81:4a82:0:b0:2ff:94b4:b4d1 with SMTP id
 x124-20020a814a82000000b002ff94b4b4d1mr38668766ywa.130.1654712370883; Wed, 08
 Jun 2022 11:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220608000014.3054333-1-jarkko@profian.com> <CAMj1kXFsdEq6XZ6eOuf8Ks-F4qgneVxFeLYNN_S4JaPy8koEyw@mail.gmail.com>
In-Reply-To: <CAMj1kXFsdEq6XZ6eOuf8Ks-F4qgneVxFeLYNN_S4JaPy8koEyw@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Wed, 8 Jun 2022 11:19:19 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7NZXepczZGyV2Ti4hNSupLBoKgA64K=zJN4uVBTxN37g@mail.gmail.com>
Message-ID: <CAPhsuW7NZXepczZGyV2Ti4hNSupLBoKgA64K=zJN4uVBTxN37g@mail.gmail.com>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
To: Ard Biesheuvel <ardb@kernel.org>
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
Cc: Dan Li <ashimida@linux.alibaba.com>, Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>, Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Javier Martinez Canillas <javierm@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, Michael Roth <michael.roth@amd.com>, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Andrey Konovalov <andreyknvl@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Wu Caize <zepan@sipeed.com>, Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Luis Machado <luis.machado@linaro.org>, Atsushi Nemoto
  <anemo@mba.ocn.ne.jp>, Dave Hansen <dave.hansen@linux.intel.com>, Joey Gouly <joey.gouly@arm.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-s390@vger.kernel.org, Ilya Leoshkevich <iii@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Helge Deller <deller@gmx.de>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Sven Schnelle <svens@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>, Vasily Gorbik <gor@linux.ibm.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Dave Anglin <dave.anglin@bell.net>, linux-arm-kernel@lists.infradead.org, Daniel Axtens <dja@axtens.net>, Nicolas Pitre <nico@fluxnic.net>, Jarkko Sakkinen <jarkko@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, Emil Renner Berthing <kernel@esmil.dk>, Jordan Niethe <jniethe5@gmail.com>, Atish Patra <atishp@atishpatra.org>, Alexei Starovoito
 v <ast@kernel.org>, Will Deacon <will@kernel.org>, Ma

sahiro Yamada <masahiroy@kernel.org>, Jarkko Sakkinen <jarkko@profian.com>, Sami Tolvanen <samitolvanen@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Alexander Egorenkov <egorenar@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Nathaniel McCallum <nathaniel@profian.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Tobias Huschle <huschle@linux.ibm.com>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Tiezhu Yang <yangtiezhu@loongson.cn>, Miroslav Benes <mbenes@suse.cz>, Chen Zhongjin <chenzhongjin@huawei.
 com>, linux-riscv@lists.infradead.org, X86 ML <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Aaron Tomlin <atomlin@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Liao Chang <liaochang1@huawei.com>, Paul Walmsley <paul.walmsley@sifive.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Thomas Richter <tmricht@linux.ibm.com>, linux-mips@vger.kernel.org, Changbin Du <changbin.du@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 8, 2022 at 9:28 AM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> Hello Jarkko,
>
> On Wed, 8 Jun 2022 at 02:02, Jarkko Sakkinen <jarkko@profian.com> wrote:
> >
> > Tracing with kprobes while running a monolithic kernel is currently
> > impossible because CONFIG_KPROBES is dependent of CONFIG_MODULES.  This
> > dependency is a result of kprobes code using the module allocator for the
> > trampoline code.
> >
> > Detaching kprobes from modules helps to squeeze down the user space,
> > e.g. when developing new core kernel features, while still having all
> > the nice tracing capabilities.
> >
> > For kernel/ and arch/*, move module_alloc() and module_memfree() to
> > module_alloc.c, and compile as part of vmlinux when either CONFIG_MODULES
> > or CONFIG_KPROBES is enabled.  In addition, flag kernel module specific
> > code with CONFIG_MODULES.
> >
> > As the result, kprobes can be used with a monolithic kernel.
>
> I think I may have mentioned this the previous time as well, but I
> don't think this is the right approach.
>
> Kprobes uses alloc_insn_page() to allocate executable memory, but the
> requirements for this memory are radically different compared to
> loadable modules, which need to be within an arch-specific distance of
> the core kernel, need KASAN backing etc etc.

I think the distance of core kernel requirement is the same for kprobe
alloc_insn_page and modules, no?

Thanks,
Song

>
> This is why arm64, for instance, does not implement alloc_insn_page()
> in terms of module_alloc() [and likely does not belong in this patch
> for that reason]



>
> Is there any reason kprobes cannot simply use vmalloc()?
>
