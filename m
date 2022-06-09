Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF7554657B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 13:25:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKJXW0rcHz3fL7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 21:24:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ck3AUkzb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ck3AUkzb;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJzBn3ZcSz30Dp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 08:23:29 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B852161F9C
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 22:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76BA4C36B00
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 22:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654813405;
	bh=z3Jhlwc3PQEgsjMohe71D/i53Eq6SNGSccBMpFOwt4k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ck3AUkzbsBZezflJocw9zOjL/O7W+Kv8m0QA0BWWxYDhG4pRCd/G2CjKMTq/fC9c1
	 YDNJYznqiEIRugQsJ37KCtmFgdeOGurtnYp3KcOlLoT/AuXQJ1xFQ01PLNaPuPrniX
	 o9DIY8DcqggM7iRQQv6RSEuWXTgHJ/U6NHDMrFYk/AsalPOGLOXKYsBHvI333WH8dN
	 ebZHsPO17DYhEkGqqmvhIjoY9hWt2nOdAWOzvaXbFIWq3dR/5HSlguDxAQP+21u1/1
	 VkLbgWA+pA+yM8yGgWFQASY92sYL1GnFC2OWBJ/5Yje+BH1mik8t3w0FK7H+HRgXch
	 6rK8u6pNFWjZQ==
Received: by mail-yb1-f172.google.com with SMTP id y188so14632661ybe.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jun 2022 15:23:25 -0700 (PDT)
X-Gm-Message-State: AOAM532YTFYlF5KbiZyQxtKEwKq3eFB2sm3f3zxSDX99ICbLLc4Ij+Q/
	fA1KuVqqrTL09PDC+t56LyVQvV17R8DVslthDto=
X-Google-Smtp-Source: ABdhPJzANLs6nyK/WG2Y1yCpx8YIaUD2OiJdlTAbvSByFB1d3SGWElQ7owoxfdbySFyAvjdjDfiWZ3ugKMwaWDz7IWk=
X-Received: by 2002:a0d:eb4d:0:b0:30c:9849:27a1 with SMTP id
 u74-20020a0deb4d000000b0030c984927a1mr44312236ywe.472.1654813393600; Thu, 09
 Jun 2022 15:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220608000014.3054333-1-jarkko@profian.com> <CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com>
 <YqAy0qjI4Lktk/uJ@iki.fi> <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org>
 <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com> <f7ff2a8d-4128-dac9-9768-1d98bfb06a06@csgroup.eu>
In-Reply-To: <f7ff2a8d-4128-dac9-9768-1d98bfb06a06@csgroup.eu>
From: Song Liu <song@kernel.org>
Date: Thu, 9 Jun 2022 15:23:02 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4C0KJT3osBSC9bpi1x7X0HWUE+as+wZi1h63LzHVsptg@mail.gmail.com>
Message-ID: <CAPhsuW4C0KJT3osBSC9bpi1x7X0HWUE+as+wZi1h63LzHVsptg@mail.gmail.com>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 10 Jun 2022 21:09:20 +1000
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
 nemo@mba.ocn.ne.jp>, Dave Hansen <dave.hansen@linux.intel.com>, Joey Gouly <joey.gouly@arm.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-s390 <linux-s390@vger.kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Helge Deller <deller@gmx.de>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Vasily Gorbik <gor@linux.ibm.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Dave Anglin <dave.anglin@bell.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Daniel Axtens <dja@axtens.net>, Nicolas Pitre <nico@fluxnic.net>, Jarkko Sakkinen <jarkko@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, Emil Renner Berthing <kernel@esmil.dk>, Jordan Niethe <jniethe5@gmail.com>, Atish Patra <atishp@atishpatr
 a.org>, Alexei Starovoitov <ast@kernel.org>, Will Dea

con <will@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Jarkko Sakkinen <jarkko@profian.com>, Sami Tolvanen <samitolvanen@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Alexander Egorenkov <egorenar@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Parisc List <linux-parisc@vger.kernel.org>, Nathaniel McCallum <nathaniel@profian.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Tobias Huschle <huschle@linux.ibm.com>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, Miroslav Benes <
 mbenes@suse.cz>, Chen Zhongjin <chenzhongjin@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, the arch/x86 maintainers <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-riscv <linux-riscv@lists.infradead.org>, Ingo Molnar <mingo@redhat.com>, Aaron Tomlin <atomlin@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Liao Chang <liaochang1@huawei.com>, Paul Walmsley <paul.walmsley@sifive.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Thomas Richter <tmricht@linux.ibm.com>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Changbin Du <changbin.du@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 9, 2022 at 1:34 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 08/06/2022 =C3=A0 18:12, Song Liu a =C3=A9crit :
> > On Wed, Jun 8, 2022 at 7:21 AM Masami Hiramatsu <mhiramat@kernel.org> w=
rote:
> >>
> >> Hi Jarkko,
> >>
> >> On Wed, 8 Jun 2022 08:25:38 +0300
> >> Jarkko Sakkinen <jarkko@kernel.org> wrote:
> >>
> >>> On Wed, Jun 08, 2022 at 10:35:42AM +0800, Guo Ren wrote:
> >>>> .
> >>>>
> >>>> On Wed, Jun 8, 2022 at 8:02 AM Jarkko Sakkinen <jarkko@profian.com> =
wrote:
> >>>>>
> >>>>> Tracing with kprobes while running a monolithic kernel is currently
> >>>>> impossible because CONFIG_KPROBES is dependent of CONFIG_MODULES.  =
This
> >>>>> dependency is a result of kprobes code using the module allocator f=
or the
> >>>>> trampoline code.
> >>>>>
> >>>>> Detaching kprobes from modules helps to squeeze down the user space=
,
> >>>>> e.g. when developing new core kernel features, while still having a=
ll
> >>>>> the nice tracing capabilities.
> >>>>>
> >>>>> For kernel/ and arch/*, move module_alloc() and module_memfree() to
> >>>>> module_alloc.c, and compile as part of vmlinux when either CONFIG_M=
ODULES
> >>>>> or CONFIG_KPROBES is enabled.  In addition, flag kernel module spec=
ific
> >>>>> code with CONFIG_MODULES.
> >>>>>
> >>>>> As the result, kprobes can be used with a monolithic kernel.
> >>>> It's strange when MODULES is n, but vmlinux still obtains module_all=
oc.
> >>>>
> >>>> Maybe we need a kprobe_alloc, right?
> >>>
> >>> Perhaps not the best name but at least it documents the fact that
> >>> they use the same allocator.
> >>>
> >>> Few years ago I carved up something "half-way there" for kprobes,
> >>> and I used the name text_alloc() [*].
> >>>
> >>> [*] https://lore.kernel.org/all/20200724050553.1724168-1-jarkko.sakki=
nen@linux.intel.com/
> >>
> >> Yeah, I remember that. Thank you for updating your patch!
> >> I think the idea (split module_alloc() from CONFIG_MODULE) is good to =
me.
> >> If module support maintainers think this name is not good, you may be
> >> able to rename it as text_alloc() and make the module_alloc() as a
> >> wrapper of it.
> >
> > IIUC, most users of module_alloc() use it to allocate memory for text, =
except
> > that module code uses it for both text and data. Therefore, I guess cal=
ling it
> > text_alloc() is not 100% accurate until we change the module code (to u=
se
> > a different API to allocate memory for data).
>
> When CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC, module code uses
> module_alloc() for text and vmalloc() for data, see function
> move_module() in kernel/module/main.c

Thanks for the pointer! I will play with it.

Song
