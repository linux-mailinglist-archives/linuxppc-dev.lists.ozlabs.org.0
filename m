Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 155055484D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 13:30:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LM8WN6jyjz3f4D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 21:30:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ihwcLZes;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ihwcLZes;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LLYvs54Qmz3bkR
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jun 2022 22:31:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 54BD260EC3;
	Sun, 12 Jun 2022 12:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D957FC34115;
	Sun, 12 Jun 2022 12:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655037062;
	bh=75vg2kGshxM5YQM0eTP5ZRYR8Fcv4/li4Jk7t1TdZ38=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ihwcLZes9inwOPuBDeaJye7gcke1UBLU+1VBGf4DvKCK8cnpB6u1SzgyKO4ftcfZG
	 ErQikmY7mpilG3tu8wVrlaHYSKH7Nu92Hyqnw97kzveTBBIVOS3uQ3Jqgu9GFW4w0/
	 jmS6W7bFFcvW2dOW/LuS2HXtqiKHxLtKSxRKUtWOPvP35PudVpnCQhmoWF/hc9228f
	 gVQ4oyLRAILBu9zA0K+lA3/gxYbMJXzy+bnGsqhl3RfaVq5/VfkBb87Ki9hv8Dkl4s
	 ONjTLXhsGE6D3ntAiXzcwMS2P7ueWXHWUvDCIewbY4eDMY//09jGQh9ejxWsMYhY9O
	 DS4tlNoS30DUQ==
Date: Sun, 12 Jun 2022 21:30:41 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Message-Id: <20220612213041.b1ec5d1ec3426e90e669c495@kernel.org>
In-Reply-To: <CAPhsuW7NZXepczZGyV2Ti4hNSupLBoKgA64K=zJN4uVBTxN37g@mail.gmail.com>
References: <20220608000014.3054333-1-jarkko@profian.com>
	<CAMj1kXFsdEq6XZ6eOuf8Ks-F4qgneVxFeLYNN_S4JaPy8koEyw@mail.gmail.com>
	<CAPhsuW7NZXepczZGyV2Ti4hNSupLBoKgA64K=zJN4uVBTxN37g@mail.gmail.com>
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
Cc: Dan Li <ashimida@linux.alibaba.com>, Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>, Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Javier Martinez Canillas <javierm@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>, =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, Michael Roth <michael.roth@amd.com>, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Andrey Konovalov <andreyknvl@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Wu Caize <zepan@sipeed.com>, Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Luis Machado <luis.machado@linaro.org>, Atsushi Nemoto <
 anemo@mba.ocn.ne.jp>, Dave Hansen <dave.hansen@linux.intel.com>, Joey Gouly <joey.gouly@arm.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-s390@vger.kernel.org, Ilya Leoshkevich <iii@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Helge Deller <deller@gmx.de>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Sven Schnelle <svens@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>, Vasily Gorbik <gor@linux.ibm.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Dave Anglin <dave.anglin@bell.net>, linux-arm-kernel@lists.infradead.org, Daniel Axtens <dja@axtens.net>, Nicolas Pitre <nico@fluxnic.net>, Jarkko Sakkinen <jarkko@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, Emil Renner Berthing <kernel@esmil.dk>, Jordan Niethe <jniethe5@gmail.com>, Atish Patra <atishp@atishpatra.org>, Alexei Starovoitov 
 <ast@kernel.org>, Will Deacon <will@kernel.org>, Masa

hiro Yamada <masahiroy@kernel.org>, Jarkko Sakkinen <jarkko@profian.com>, Sami Tolvanen <samitolvanen@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Alexander Egorenkov <egorenar@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Nathaniel McCallum <nathaniel@profian.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Tobias Huschle <huschle@linux.ibm.com>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Tiezhu Yang <yangtiezhu@loongson.cn>, Miroslav Benes <mbenes@suse.cz>, Chen Zhongjin <chenzhongjin@huawei.co
 m>, Ard Biesheuvel <ardb@kernel.org>, X86 ML <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-riscv@lists.infradead.org, Ingo Molnar <mingo@redhat.com>, Aaron Tomlin <atomlin@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Liao Chang <liaochang1@huawei.com>, Paul Walmsley <paul.walmsley@sifive.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Thomas Richter <tmricht@linux.ibm.com>, linux-mips@vger.kernel.org, Changbin Du <changbin.du@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 8 Jun 2022 11:19:19 -0700
Song Liu <song@kernel.org> wrote:

> On Wed, Jun 8, 2022 at 9:28 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > Hello Jarkko,
> >
> > On Wed, 8 Jun 2022 at 02:02, Jarkko Sakkinen <jarkko@profian.com> wrote:
> > >
> > > Tracing with kprobes while running a monolithic kernel is currently
> > > impossible because CONFIG_KPROBES is dependent of CONFIG_MODULES.  This
> > > dependency is a result of kprobes code using the module allocator for the
> > > trampoline code.
> > >
> > > Detaching kprobes from modules helps to squeeze down the user space,
> > > e.g. when developing new core kernel features, while still having all
> > > the nice tracing capabilities.
> > >
> > > For kernel/ and arch/*, move module_alloc() and module_memfree() to
> > > module_alloc.c, and compile as part of vmlinux when either CONFIG_MODULES
> > > or CONFIG_KPROBES is enabled.  In addition, flag kernel module specific
> > > code with CONFIG_MODULES.
> > >
> > > As the result, kprobes can be used with a monolithic kernel.
> >
> > I think I may have mentioned this the previous time as well, but I
> > don't think this is the right approach.
> >
> > Kprobes uses alloc_insn_page() to allocate executable memory, but the
> > requirements for this memory are radically different compared to
> > loadable modules, which need to be within an arch-specific distance of
> > the core kernel, need KASAN backing etc etc.
> 
> I think the distance of core kernel requirement is the same for kprobe
> alloc_insn_page and modules, no?

This strongly depends on how kprobes (software breakpoint and
single-step) is implemented on the arch. For example, x86 implements
the so-called "kprobe-booster" which jumps back from the single
stepping trampoline buffer. Then the buffer address must be within
the range where it can jump to the original address.
However, if the arch implements single-step as an instruction
emulation, it has no such limitation. As far as I know, arm64
will do emulation for the instructions which change PC register
and will do direct execution with another software breakpoint
for other instructions.

Why I'm using module_alloc() for a generic function, is that
can cover the limitation most widely.
Thus, if we have CONFIG_ARCH_HAVE_ALLOC_INSN_PAGE flag and
kprobes can check it instead of using __weak function, the
kprobes may not need to depend on module_alloc() in general.

Thank you,

> 
> Thanks,
> Song
> 
> >
> > This is why arm64, for instance, does not implement alloc_insn_page()
> > in terms of module_alloc() [and likely does not belong in this patch
> > for that reason]
> 
> 
> 
> >
> > Is there any reason kprobes cannot simply use vmalloc()?
> >


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
