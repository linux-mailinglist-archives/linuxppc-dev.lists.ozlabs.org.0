Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A06EE54BD51
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 00:09:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LN2f93n2Wz3f8h
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 08:09:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=me5b3Hfl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=me5b3Hfl;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMnrS1Smcz3bm7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 22:32:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8CCDD61323;
	Tue, 14 Jun 2022 12:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006F7C3411E;
	Tue, 14 Jun 2022 12:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655209940;
	bh=W2sdPNt5QO+c07eblDbvqWaVVydbhsc88fMjavxRvLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=me5b3HflgfNPbzThidZLk/NpjxYMr1MIV58YPR12wvSBdHzsLaMlV/NtSyN3Mvxzy
	 q/GQ27TdyekMRI85J0EPo25NyzBYG/7DXsgJqqx53V0yZLugeCXbvHchBgy+aWmDgJ
	 zq3bm685/JwRx2pfzDZjuQbP0P2UMWZgEu7IQTpQLmc55Rpow6KKCSosEaWb9Q2lt4
	 VAevK8pEYMsSMSej4B6ggZ6VDFKyabVWyDrAE2n+hj2Y7uPJitwqbNTfs2uxIM/kJ1
	 dI9UAk45zfY7wpqElhs1CMY3pn+itMY3aqhl+K0F9W8r6YJeEeRsD9vrexqZwsnBnl
	 cllYjiYrXM3UA==
Date: Tue, 14 Jun 2022 15:30:14 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Message-ID: <Yqh/Vp7d0/kqfJGc@iki.fi>
References: <20220608000014.3054333-1-jarkko@profian.com>
 <CAMj1kXFsdEq6XZ6eOuf8Ks-F4qgneVxFeLYNN_S4JaPy8koEyw@mail.gmail.com>
 <CAPhsuW7NZXepczZGyV2Ti4hNSupLBoKgA64K=zJN4uVBTxN37g@mail.gmail.com>
 <20220612213041.b1ec5d1ec3426e90e669c495@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220612213041.b1ec5d1ec3426e90e669c495@kernel.org>
X-Mailman-Approved-At: Wed, 15 Jun 2022 08:01:46 +1000
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
Cc: Dan Li <ashimida@linux.alibaba.com>, Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>, Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Javier Martinez Canillas <javierm@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>, =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>, Michael Roth <michael.roth@amd.com>, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Andrey Konovalov <andreyknvl@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Sven Schnelle <svens@linux.ibm.com>, Wu Caize <zepan@sipeed.com>, Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Luis Machado <luis.machado@linaro.org>, Atsushi Nemoto 
 <anemo@mba.ocn.ne.jp>, Dave Hansen <dave.hansen@linux.intel.com>, Joey Gouly <joey.gouly@arm.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Song Liu <song@kernel.org>, linux-s390@vger.kernel.org, Ilya Leoshkevich <iii@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Helge Deller <deller@gmx.de>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, Vasily Gorbik <gor@linux.ibm.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Dave Anglin <dave.anglin@bell.net>, linux-arm-kernel@lists.infradead.org, Daniel Axtens <dja@axtens.net>, Nicolas Pitre <nico@fluxnic.net>, "Eric W. Biederman" <ebiederm@xmission.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, Emil Renner Berthing <kernel@esmil.dk>, Jordan Niethe <jniethe5@gmail.com>, Atish Patra <atishp@atishpatra.org>, Alexei Starovoitov <ast@kernel.org>, Will Deacon <will@kernel.or
 g>, Masahiro Yamada <masahiroy@kernel.org>, Jarkko Sa

kkinen <jarkko@profian.com>, Sami Tolvanen <samitolvanen@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Alexander Egorenkov <egorenar@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Nathaniel McCallum <nathaniel@profian.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Tobias Huschle <huschle@linux.ibm.com>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Tiezhu Yang <yangtiezhu@loongson.cn>, Miroslav Benes <mbenes@suse.cz>, Chen Zhongjin <chenzhongjin@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, X86 ML 
 <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-riscv@lists.infradead.org, Ingo Molnar <mingo@redhat.com>, Aaron Tomlin <atomlin@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Liao Chang <liaochang1@huawei.com>, Paul Walmsley <paul.walmsley@sifive.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Thomas Richter <tmricht@linux.ibm.com>, linux-mips@vger.kernel.org, Changbin Du <changbin.du@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jun 12, 2022 at 09:30:41PM +0900, Masami Hiramatsu wrote:
> On Wed, 8 Jun 2022 11:19:19 -0700
> Song Liu <song@kernel.org> wrote:
> 
> > On Wed, Jun 8, 2022 at 9:28 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > Hello Jarkko,
> > >
> > > On Wed, 8 Jun 2022 at 02:02, Jarkko Sakkinen <jarkko@profian.com> wrote:
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
> > >
> > > I think I may have mentioned this the previous time as well, but I
> > > don't think this is the right approach.
> > >
> > > Kprobes uses alloc_insn_page() to allocate executable memory, but the
> > > requirements for this memory are radically different compared to
> > > loadable modules, which need to be within an arch-specific distance of
> > > the core kernel, need KASAN backing etc etc.
> > 
> > I think the distance of core kernel requirement is the same for kprobe
> > alloc_insn_page and modules, no?
> 
> This strongly depends on how kprobes (software breakpoint and
> single-step) is implemented on the arch. For example, x86 implements
> the so-called "kprobe-booster" which jumps back from the single
> stepping trampoline buffer. Then the buffer address must be within
> the range where it can jump to the original address.
> However, if the arch implements single-step as an instruction
> emulation, it has no such limitation. As far as I know, arm64
> will do emulation for the instructions which change PC register
> and will do direct execution with another software breakpoint
> for other instructions.
> 
> Why I'm using module_alloc() for a generic function, is that
> can cover the limitation most widely.
> Thus, if we have CONFIG_ARCH_HAVE_ALLOC_INSN_PAGE flag and
> kprobes can check it instead of using __weak function, the
> kprobes may not need to depend on module_alloc() in general.

OK, I guess this is what Luis meant. 

I'll try to carve up something based on this.

BR, Jarkko
