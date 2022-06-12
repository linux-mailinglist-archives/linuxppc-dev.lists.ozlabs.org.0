Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 220675484CF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 13:29:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LM8Vm6mh0z3f1K
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 21:29:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hJVwSxcZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hJVwSxcZ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LLYdM2DtHz3blW
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jun 2022 22:18:31 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0E1560DF6;
	Sun, 12 Jun 2022 12:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C2CC34115;
	Sun, 12 Jun 2022 12:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655036305;
	bh=WgqWCXOvSOyYM9CA6unsEF9x7497RtdMdOYMhEwuXNA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hJVwSxcZhwtzLwx3w1QhqIA1+qrWZ1YGyKj5qHKKPQ++Yqa816Xz6ppZ1R/IDxtM8
	 0mGodfwO2v8xthNHRtUQ7dsU9T6KZrnnSnwkX2Km4qoMD4VxgmypasgeO574/wxfWh
	 iPI0tb5tr49puQN4NIA3CqGVLyVln/zbm8lBPZ8hG8qBmrK2oCj41WK75ev21hQO/v
	 iwYspOZKGjKe7g7QShHcxe1rR10SCFSjyNkmdYBtuEMKE90L7FAENwgzstDNcN3N7s
	 6bz8ns5CJW9GDL1c/9Wzb9AS47ccvnKE6Mk6uAYpYzfOmoKzOnrDABFX7VAQu5vWRi
	 lMYiDZBwwPCeQ==
Date: Sun, 12 Jun 2022 21:18:02 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Message-Id: <20220612211802.30a16623e8b0a55122b02386@kernel.org>
In-Reply-To: <CAMj1kXGGyO-DL9hjKYKR2sp87s4KExiQybES8pp4JgqJcHkfLA@mail.gmail.com>
References: <20220608000014.3054333-1-jarkko@profian.com>
	<CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com>
	<YqAy0qjI4Lktk/uJ@iki.fi>
	<20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org>
	<CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com>
	<YqHx1d+MwRLLzGQe@iki.fi>
	<CAMj1kXGGyO-DL9hjKYKR2sp87s4KExiQybES8pp4JgqJcHkfLA@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 13 Jun 2022 21:27:22 +1000
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
Cc: Dan Li <ashimida@linux.alibaba.com>, Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>, Guo Ren <guoren@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Javier Martinez Canillas <javierm@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>, =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, Michael Roth <michael.roth@amd.com>, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Andrey Konovalov <andreyknvl@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Sven Schnelle <svens@linux.ibm.com>, Wu Caize <zepan@sipeed.com>, Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Luis Machado <luis.machado@linaro.org>, Atsushi Nemoto <ane
 mo@mba.ocn.ne.jp>, Dave Hansen <dave.hansen@linux.intel.com>, Joey Gouly <joey.gouly@arm.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Song Liu <song@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Helge Deller <deller@gmx.de>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Vasily Gorbik <gor@linux.ibm.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Dave Anglin <dave.anglin@bell.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Daniel Axtens <dja@axtens.net>, Nicolas Pitre <nico@fluxnic.net>, Jarkko Sakkinen <jarkko@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, Emil Renner Berthing <kernel@esmil.dk>, Jordan Niethe <jniethe5@gmail.com>, Ati
 sh Patra <atishp@atishpatra.org>, Alexei Starovoitov 

<ast@kernel.org>, Will Deacon <will@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Jarkko Sakkinen <jarkko@profian.com>, Sami Tolvanen <samitolvanen@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Alexander Egorenkov <egorenar@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Parisc List <linux-parisc@vger.kernel.org>, Nathaniel McCallum <nathaniel@profian.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Tobias Huschle <huschle@linux.ibm.com>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>, Tiezhu Yang <yangtiezhu@loon
 gson.cn>, Miroslav Benes <mbenes@suse.cz>, Chen Zhongjin <chenzhongjin@huawei.com>, linux-riscv <linux-riscv@lists.infradead.org>, the arch/x86 maintainers <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Aaron Tomlin <atomlin@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Liao Chang <liaochang1@huawei.com>, Paul Walmsley <paul.walmsley@sifive.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Thomas Richter <tmricht@linux.ibm.com>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Changbin Du <changbin.du@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 9 Jun 2022 15:23:16 +0200
Ard Biesheuvel <ardb@kernel.org> wrote:

> On Thu, 9 Jun 2022 at 15:14, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> >
> > On Wed, Jun 08, 2022 at 09:12:34AM -0700, Song Liu wrote:
> > > On Wed, Jun 8, 2022 at 7:21 AM Masami Hiramatsu <mhiramat@kernel.org> wrote:
> > > >
> > > > Hi Jarkko,
> > > >
> > > > On Wed, 8 Jun 2022 08:25:38 +0300
> > > > Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > > >
> > > > > On Wed, Jun 08, 2022 at 10:35:42AM +0800, Guo Ren wrote:
> > > > > > .
> > > > > >
> > > > > > On Wed, Jun 8, 2022 at 8:02 AM Jarkko Sakkinen <jarkko@profian.com> wrote:
> > > > > > >
> > > > > > > Tracing with kprobes while running a monolithic kernel is currently
> > > > > > > impossible because CONFIG_KPROBES is dependent of CONFIG_MODULES.  This
> > > > > > > dependency is a result of kprobes code using the module allocator for the
> > > > > > > trampoline code.
> > > > > > >
> > > > > > > Detaching kprobes from modules helps to squeeze down the user space,
> > > > > > > e.g. when developing new core kernel features, while still having all
> > > > > > > the nice tracing capabilities.
> > > > > > >
> > > > > > > For kernel/ and arch/*, move module_alloc() and module_memfree() to
> > > > > > > module_alloc.c, and compile as part of vmlinux when either CONFIG_MODULES
> > > > > > > or CONFIG_KPROBES is enabled.  In addition, flag kernel module specific
> > > > > > > code with CONFIG_MODULES.
> > > > > > >
> > > > > > > As the result, kprobes can be used with a monolithic kernel.
> > > > > > It's strange when MODULES is n, but vmlinux still obtains module_alloc.
> > > > > >
> > > > > > Maybe we need a kprobe_alloc, right?
> > > > >
> > > > > Perhaps not the best name but at least it documents the fact that
> > > > > they use the same allocator.
> > > > >
> > > > > Few years ago I carved up something "half-way there" for kprobes,
> > > > > and I used the name text_alloc() [*].
> > > > >
> > > > > [*] https://lore.kernel.org/all/20200724050553.1724168-1-jarkko.sakkinen@linux.intel.com/
> > > >
> > > > Yeah, I remember that. Thank you for updating your patch!
> > > > I think the idea (split module_alloc() from CONFIG_MODULE) is good to me.
> > > > If module support maintainers think this name is not good, you may be
> > > > able to rename it as text_alloc() and make the module_alloc() as a
> > > > wrapper of it.
> > >
> > > IIUC, most users of module_alloc() use it to allocate memory for text, except
> > > that module code uses it for both text and data. Therefore, I guess calling it
> > > text_alloc() is not 100% accurate until we change the module code (to use
> > > a different API to allocate memory for data).
> >
> > After reading the feedback, I'd stay on using module_alloc() because
> > it has arch-specific quirks baked in. Easier to deal with them in one
> > place.
> >
> 
> In that case, please ensure that you enable this only on architectures
> where it is needed. arm64 implements alloc_insn_page() without relying
> on module_alloc() so I would not expect to see any changes there.

Hmm, what about adding CONFIG_ARCH_HAVE_ALLOC_INSN_PAGE and check it?
If it is defined, kprobes will not define the __weak function, but
if not, it will use module_alloc()?

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
