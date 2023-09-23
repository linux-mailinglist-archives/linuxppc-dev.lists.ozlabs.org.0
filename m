Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B747AC5BA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Sep 2023 00:37:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HsXeC8Fz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RtPCD2Jzfz3cF4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Sep 2023 08:37:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HsXeC8Fz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RtPBG4hCtz2xmC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Sep 2023 08:36:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 908F7B80189
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Sep 2023 22:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02EE4C43142
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Sep 2023 22:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695508576;
	bh=p6KwkG6gIDCpi+5ECOWCYMC6fT/RtPXwryMv7tZb+xk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HsXeC8FzbnuL2HGBLJZiuCDBblJ3dC0CWJZAs7Ko9Pk0M9quq/h5gqiWTqvrdcgwk
	 itKojR8YTR5ZBLsDVT+aVMKIf/+4SYrOFwd/ZyLEbjm7omRRiWzviOumN9tiOOdnYJ
	 ALYv4PaFyHMzjV7o2XFeI8EdbI8lLpQm06kuLrCiYQ+VE7VxvnEjf9LyC4q/8eQo6l
	 nGIKccvQzYkcSBx7ujsOkNay4Ive+Liq+LoCw+rptMs27n07a/FqcH2Vg4DkRpHXHs
	 aw4RsjS5gQWL57hCW1ty8y+9xbRAkIK6sgZ3PssfBL/jcSH6zIeiLfRwU8+hpo+Vua
	 cFXFeedFkSJfg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-502e7d66c1eso6587569e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Sep 2023 15:36:15 -0700 (PDT)
X-Gm-Message-State: AOJu0YzbWHYy29Je1b1rdGf10HKkygZWxBSGcSB6Evw8Gmjs2ii6h8xh
	PjMqfeiqhspfL6E52YpgACLG/vU8kd2EKWJsjyA=
X-Google-Smtp-Source: AGHT+IHGEMyzPMP0PdtKXqSKknw0oXHfeYEIvmKQhWxGVhq9jrC3LZkcXvNIlQvBWHbanSZQKP0MnXe/fed+WldiSzw=
X-Received: by 2002:a05:6512:250d:b0:4fb:90c6:c31a with SMTP id
 be13-20020a056512250d00b004fb90c6c31amr2958776lfb.14.1695508573892; Sat, 23
 Sep 2023 15:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230918072955.2507221-1-rppt@kernel.org> <20230918072955.2507221-3-rppt@kernel.org>
 <CAPhsuW5-=H1V=VXUYxyGnUdJuNUpRt44QmpwjkDUD=9i0itjuw@mail.gmail.com> <20230923153808.GI3303@kernel.org>
In-Reply-To: <20230923153808.GI3303@kernel.org>
From: Song Liu <song@kernel.org>
Date: Sat, 23 Sep 2023 15:36:01 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6TxG87ZBwQ_027iiE+_UmXweZEPh8wKHkHo7wA+qXZUg@mail.gmail.com>
Message-ID: <CAPhsuW6TxG87ZBwQ_027iiE+_UmXweZEPh8wKHkHo7wA+qXZUg@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] mm: introduce execmem_text_alloc() and execmem_free()
To: Mike Rapoport <rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Luis Chamberlain <mcgrof@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?UTF-8?B?QmrDtnJuIF
 TDtnBlbA==?= <bjorn@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 23, 2023 at 8:39=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Thu, Sep 21, 2023 at 03:34:18PM -0700, Song Liu wrote:
> > On Mon, Sep 18, 2023 at 12:30=E2=80=AFAM Mike Rapoport <rppt@kernel.org=
> wrote:
> > >
> >
> > [...]
> >
> > > diff --git a/arch/s390/kernel/module.c b/arch/s390/kernel/module.c
> > > index 42215f9404af..db5561d0c233 100644
> > > --- a/arch/s390/kernel/module.c
> > > +++ b/arch/s390/kernel/module.c
> > > @@ -21,6 +21,7 @@
> > >  #include <linux/moduleloader.h>
> > >  #include <linux/bug.h>
> > >  #include <linux/memory.h>
> > > +#include <linux/execmem.h>
> > >  #include <asm/alternative.h>
> > >  #include <asm/nospec-branch.h>
> > >  #include <asm/facility.h>
> > > @@ -76,7 +77,7 @@ void *module_alloc(unsigned long size)
> > >  #ifdef CONFIG_FUNCTION_TRACER
> > >  void module_arch_cleanup(struct module *mod)
> > >  {
> > > -       module_memfree(mod->arch.trampolines_start);
> > > +       execmem_free(mod->arch.trampolines_start);
> > >  }
> > >  #endif
> > >
> > > @@ -510,7 +511,7 @@ static int module_alloc_ftrace_hotpatch_trampolin=
es(struct module *me,
> > >
> > >         size =3D FTRACE_HOTPATCH_TRAMPOLINES_SIZE(s->sh_size);
> > >         numpages =3D DIV_ROUND_UP(size, PAGE_SIZE);
> > > -       start =3D module_alloc(numpages * PAGE_SIZE);
> > > +       start =3D execmem_text_alloc(EXECMEM_FTRACE, numpages * PAGE_=
SIZE);
> >
> > This should be EXECMEM_MODULE_TEXT?
>
> This is an ftrace trampoline, so I think it should be FTRACE type of
> allocation.

Yeah, I was aware of the ftrace trampoline. My point was, ftrace trampoline
doesn't seem to have any special requirements. Therefore, it is probably no=
t
necessary to have a separate type just for it.

AFAICT, kprobe, ftrace, and BPF (JIT and trampoline) can share the same
execmem_type. We may need some work for some archs, but nothing is
fundamentally different among these.

Thanks,
Song
