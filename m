Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADA754656C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 13:21:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKJSF0gHvz3fkm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 21:21:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ffcnOp0O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ffcnOp0O;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJl1s1Dlrz3bmc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 23:14:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 44F4F61CE4;
	Thu,  9 Jun 2022 13:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3517EC34114;
	Thu,  9 Jun 2022 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654780492;
	bh=TcM+Ki5Zga/EOuE6ofYMb4YgryOcOqwzJXtoUiKSBIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ffcnOp0OgPDZpo0pVooP32fBsyasJseFTr596OEn/QKoOYa7UwheZd8Wlwg3TUB46
	 oq7do8KEPEoufXbxLWjhLecayI8hxwn3UCQ+T33OyReWdVdmCbawUCQmybe7JZ7oTb
	 HhVz+zHSnU4gwpIH3WqZlB7pfVvvf+NJxHqdLt1nGho6w/ePbJClUUp2hIKgYUvMEJ
	 58uIbmSIVwSI/KQZOVAORBbGQ857H+aFYiijClWCdQYg9CycDQLitNHJO9gte1OHYP
	 iRX18EyLjytRtN3c0g2ThGzeCHo6Rnqv0/GLJWOrzTCoWWPuP4yUV39SPEQTEXiJ5l
	 oLqhHM/r2BPWw==
Date: Thu, 9 Jun 2022 16:12:53 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Message-ID: <YqHx1d+MwRLLzGQe@iki.fi>
References: <20220608000014.3054333-1-jarkko@profian.com>
 <CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com>
 <YqAy0qjI4Lktk/uJ@iki.fi>
 <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org>
 <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com>
X-Mailman-Approved-At: Fri, 10 Jun 2022 21:09:21 +1000
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
Cc: Dan Li <ashimida@linux.alibaba.com>, Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>, Guo Ren <guoren@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Javier Martinez Canillas <javierm@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>, =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>, Michael Roth <michael.roth@amd.com>, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Andrey Konovalov <andreyknvl@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Sven Schnelle <svens@linux.ibm.com>, Wu Caize <zepan@sipeed.com>, Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Luis Machado <luis.machado@linaro.org>, Atsushi Nemoto 
 <anemo@mba.ocn.ne.jp>, Dave Hansen <dave.hansen@linux.intel.com>, Joey Gouly <joey.gouly@arm.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-s390 <linux-s390@vger.kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Helge Deller <deller@gmx.de>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Vasily Gorbik <gor@linux.ibm.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Dave Anglin <dave.anglin@bell.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Daniel Axtens <dja@axtens.net>, Nicolas Pitre <nico@fluxnic.net>, "Eric W. Biederman" <ebiederm@xmission.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, Emil Renner Berthing <kernel@esmil.dk>, Jordan Niethe <jniethe5@gmail.com>, Atish Patra <atishp@atishpatra.org>, Alexei Starovoitov <ast@ker
 nel.org>, Will Deacon <will@kernel.org>, Masahiro Yam

ada <masahiroy@kernel.org>, Jarkko Sakkinen <jarkko@profian.com>, Sami Tolvanen <samitolvanen@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Alexander Egorenkov <egorenar@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Parisc List <linux-parisc@vger.kernel.org>, Nathaniel McCallum <nathaniel@profian.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Tobias Huschle <huschle@linux.ibm.com>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, Miroslav Benes <mbenes@suse.cz>, Chen Zhongjin <che
 nzhongjin@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, the arch/x86 maintainers <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-riscv <linux-riscv@lists.infradead.org>, Ingo Molnar <mingo@redhat.com>, Aaron Tomlin <atomlin@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Liao Chang <liaochang1@huawei.com>, Paul Walmsley <paul.walmsley@sifive.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Thomas Richter <tmricht@linux.ibm.com>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Changbin Du <changbin.du@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 08, 2022 at 09:12:34AM -0700, Song Liu wrote:
> On Wed, Jun 8, 2022 at 7:21 AM Masami Hiramatsu <mhiramat@kernel.org> wrote:
> >
> > Hi Jarkko,
> >
> > On Wed, 8 Jun 2022 08:25:38 +0300
> > Jarkko Sakkinen <jarkko@kernel.org> wrote:
> >
> > > On Wed, Jun 08, 2022 at 10:35:42AM +0800, Guo Ren wrote:
> > > > .
> > > >
> > > > On Wed, Jun 8, 2022 at 8:02 AM Jarkko Sakkinen <jarkko@profian.com> wrote:
> > > > >
> > > > > Tracing with kprobes while running a monolithic kernel is currently
> > > > > impossible because CONFIG_KPROBES is dependent of CONFIG_MODULES.  This
> > > > > dependency is a result of kprobes code using the module allocator for the
> > > > > trampoline code.
> > > > >
> > > > > Detaching kprobes from modules helps to squeeze down the user space,
> > > > > e.g. when developing new core kernel features, while still having all
> > > > > the nice tracing capabilities.
> > > > >
> > > > > For kernel/ and arch/*, move module_alloc() and module_memfree() to
> > > > > module_alloc.c, and compile as part of vmlinux when either CONFIG_MODULES
> > > > > or CONFIG_KPROBES is enabled.  In addition, flag kernel module specific
> > > > > code with CONFIG_MODULES.
> > > > >
> > > > > As the result, kprobes can be used with a monolithic kernel.
> > > > It's strange when MODULES is n, but vmlinux still obtains module_alloc.
> > > >
> > > > Maybe we need a kprobe_alloc, right?
> > >
> > > Perhaps not the best name but at least it documents the fact that
> > > they use the same allocator.
> > >
> > > Few years ago I carved up something "half-way there" for kprobes,
> > > and I used the name text_alloc() [*].
> > >
> > > [*] https://lore.kernel.org/all/20200724050553.1724168-1-jarkko.sakkinen@linux.intel.com/
> >
> > Yeah, I remember that. Thank you for updating your patch!
> > I think the idea (split module_alloc() from CONFIG_MODULE) is good to me.
> > If module support maintainers think this name is not good, you may be
> > able to rename it as text_alloc() and make the module_alloc() as a
> > wrapper of it.
> 
> IIUC, most users of module_alloc() use it to allocate memory for text, except
> that module code uses it for both text and data. Therefore, I guess calling it
> text_alloc() is not 100% accurate until we change the module code (to use
> a different API to allocate memory for data).

After reading the feedback, I'd stay on using module_alloc() because
it has arch-specific quirks baked in. Easier to deal with them in one
place.

> Thanks,
> Song

BR, Jarkko
