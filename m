Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DED354D7AF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 03:59:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNljh2nL7z3dwn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 11:59:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rcYBdB9v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rcYBdB9v;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNdf33cpYz3bl2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 07:26:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E13AEB8217C;
	Wed, 15 Jun 2022 21:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0651C3411A;
	Wed, 15 Jun 2022 21:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655328373;
	bh=C7SBMi7ghKBLQo7MHmIHsy7eWtSdXq8eTAqAwVvVPfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rcYBdB9v2iJolM6fd27OAYzgDAh4Cy36Z7LWBpda/a/SgPCwn9xHu/xsTl0o0PoAY
	 SDWwvGa6oWW820UDU6Jc02SuNLbRnkJFOQVwHgARir+e+zZY2YYmSygPZks1a6y3Ds
	 URcIAW8dSzvf2PvwOefgZcSyVjUseugdFY03G/WaZrjHpsue9BMdMgV/6QSVfrrb8T
	 HBYs8Z1/kOPfZU6aIUJtdFd1gH4nSJbil/mnEhsnjRnWKGFlJqJnnCZ5QjEvuHpB9f
	 WFwZw2bJeWIQ2/RB+5zvSIptEsCuVnGlMNxUSbksXDmUo/nUflwAwou4zwqCvuobWa
	 8/YxoqDiXQD1Q==
Date: Thu, 16 Jun 2022 00:24:04 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Message-ID: <YqpN9NAkAKhgiunQ@iki.fi>
References: <20220608000014.3054333-1-jarkko@profian.com>
 <YqGlmpbx8HTrWmpF@shell.armlinux.org.uk>
 <YqH5TfN9w35kHFLU@bombadil.infradead.org>
 <Yqh+k7Udth0IOBrd@iki.fi>
 <144b7e90-5d75-7e2c-4e54-8a73f914dfdf@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <144b7e90-5d75-7e2c-4e54-8a73f914dfdf@csgroup.eu>
X-Mailman-Approved-At: Thu, 16 Jun 2022 11:54:30 +1000
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
Cc: Dan Li <ashimida@linux.alibaba.com>, Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>, Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Javier Martinez Canillas <javierm@redhat.com>, Christoph Hellwig <hch@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>, =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>, Michael Roth <michael.roth@amd.com>, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Andrey Konovalov <andreyknvl@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Wu Caize <zepan@sipeed.com>, Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Luis Mac
 hado <luis.machado@linaro.org>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Dave Hansen <dave.hansen@linux.intel.com>, Joey Gouly <joey.gouly@arm.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Song Liu <song@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Helge Deller <deller@gmx.de>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Sven Schnelle <svens@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>, Vasily Gorbik <gor@linux.ibm.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Dave Anglin <dave.anglin@bell.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Daniel Axtens <dja@axtens.net>, Nicolas Pitre <nico@fluxnic.net>, "Eric W. Biederman" <ebiederm@xmission.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, Kefeng Wang <
 wangkefeng.wang@huawei.com>, Emil Renner Berthing <ke

rnel@esmil.dk>, Jordan Niethe <jniethe5@gmail.com>, Atish Patra <atishp@atishpatra.org>, Alexei Starovoitov <ast@kernel.org>, Will Deacon <will@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Jarkko Sakkinen <jarkko@profian.com>, Sami Tolvanen <samitolvanen@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Alexander Egorenkov <egorenar@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Nathaniel McCallum <nathaniel@profian.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Tobias Huschle <huschle@linux.ibm.com>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>
 , "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, Miroslav Benes <mbenes@suse.cz>, Chen Zhongjin <chenzhongjin@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, "x86@kernel.org" <x86@kernel.org>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Ingo Molnar <mingo@redhat.com>, Aaron Tomlin <atomlin@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Liao Chang <liaochang1@huawei.com>, Paul Walmsley <paul.walmsley@sifive.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Thomas Richter <tmricht@linux.ibm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Changbin Du <changbin.du@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 14, 2022 at 12:36:25PM +0000, Christophe Leroy wrote:
> 
> 
> Le 14/06/2022 à 14:26, Jarkko Sakkinen a écrit :
> > On Thu, Jun 09, 2022 at 06:44:45AM -0700, Luis Chamberlain wrote:
> >> On Thu, Jun 09, 2022 at 08:47:38AM +0100, Russell King (Oracle) wrote:
> >>> On Wed, Jun 08, 2022 at 02:59:27AM +0300, Jarkko Sakkinen wrote:
> >>>> diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
> >>>> index 553866751e1a..d2bb954cd54f 100644
> >>>> --- a/arch/arm/kernel/Makefile
> >>>> +++ b/arch/arm/kernel/Makefile
> >>>> @@ -44,6 +44,11 @@ obj-$(CONFIG_CPU_IDLE)		+= cpuidle.o
> >>>>   obj-$(CONFIG_ISA_DMA_API)	+= dma.o
> >>>>   obj-$(CONFIG_FIQ)		+= fiq.o fiqasm.o
> >>>>   obj-$(CONFIG_MODULES)		+= armksyms.o module.o
> >>>> +ifeq ($(CONFIG_MODULES),y)
> >>>> +obj-y				+= module_alloc.o
> >>>> +else
> >>>> +obj-$(CONFIG_KPROBES)		+= module_alloc.o
> >>>> +endif
> >>>
> >>> Doesn't:
> >>>
> >>> obj-$(CONFIG_MODULES)		+= module_alloc.o
> >>> obj-$(CONFIG_KPROBES)		+= module_alloc.o
> >>
> >> That just begs for a new kconfig symbol for the object, and for
> >> the object then to be built with it.
> >>
> >> The archs which override the default can use ARCH_HAS_VM_ALLOC_EXEC.
> >> Please note that the respective free is important as well and its
> >> not clear if we need an another define for the free. Someone has
> >> to do that work. We want to ensure to noexec the code on free and
> >> this can vary on each arch.
> > 
> > Let me check if I understand this (not 100% sure).
> > 
> > So if arch define ARCH_HAS_VMALLOC_EXEC, then this would set
> > config flag CONFIG_VMALLOC_EXEC, which would be used to include
> > the compilation unit?
> > 
> 
> I guess you have two possible approaches.
> 
> Either architectures select CONFIG_ARCH_HAS_VMALLOC_EXEC at all time and 
> then you add a CONFIG_VMALLOC_EXEC which depends on 
> CONFIG_ARCH_HAS_VMALLOC_EXEC and CONFIG_MODULES or CONFIG_KPROBES,
> 
> Or architectures select CONFIG_ARCH_HAS_VMALLOC_EXEC only when either 
> CONFIG_MODULES or CONFIG_KPROBES is selected, in that case there is no 
> need for a CONFIG_VMALLOC_EXEC.

Right, got it now. Thanks for the elaboration.

> Christophe

BR, Jarkko
