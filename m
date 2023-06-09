Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0395972A0D8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 19:03:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qd6q06wgQz3fbX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 03:03:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q+dI+cmw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q+dI+cmw;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qd6p50lwFz3dx1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 03:02:36 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0F3FA65A3B
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 17:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE4D6C433B3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 17:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686330152;
	bh=vxAb82+vAl+BH98Z/zX2UFkfYunrykLKznTO4Bf32/o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q+dI+cmwHEvIObOXxBsxyLekwmm76nF9mGs/vdLlr9pWiFEOIysNhWUdd8PCPTZ60
	 LGGzk92gX0XuOyi4c26mYX3WPE87Sa8gWWUHUcQn3brBzeJWQThR6bQGMoW8J4LXj2
	 /rRDcmDl6AO9YE0mvQ8g/y0o2DWJ6lY1sgodoPu5UtSM0BhSA/NrKC725qSlwzaMbW
	 LIHQKoajXtYBZmHeGyhSCo2catvq01eWOqhjFyA0VEGDaMp7xHaZwMDzYeTK06Q/xY
	 rwzqQP0Yl8UvtbdxwWkN+eVpQSLM8A1ii33t60UlF5wAwY777uNuFBnLsUA8TSvepk
	 QZiKMOywmlWog==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f644dffd71so2619962e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 10:02:31 -0700 (PDT)
X-Gm-Message-State: AC+VfDzuJlCYLjwifYwUIQY9hm++ig0bum+SjxF02yunxWn0ceLQRCvB
	Nhqj7qTfzHImz6s3slarzkwdwAraTKsF20fsA3s=
X-Google-Smtp-Source: ACHHUZ4u3y79XyQLMHF4er59h6QhhYai8KonYYOOA8YDDos4NgFbnLZdqPfEIRGQCpyydTzD04kcj6u0lkxU6y+OWW4=
X-Received: by 2002:a2e:9891:0:b0:2b1:e5d8:d008 with SMTP id
 b17-20020a2e9891000000b002b1e5d8d008mr1338098ljj.37.1686330149805; Fri, 09
 Jun 2023 10:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230601101257.530867-1-rppt@kernel.org> <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan> <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
 <20230605092040.GB3460@kernel.org> <ZH20XkD74prrdN4u@FVFF77S0Q05N>
 <CAPhsuW7ntn_HpVWdGK_hYVd3zsPEFToBNfmtt0m6K8SwfxJ66Q@mail.gmail.com> <20230608184116.GJ52412@kernel.org>
In-Reply-To: <20230608184116.GJ52412@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 9 Jun 2023 10:02:16 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5YYa6nQhO2=zor75XkdKpFysZD42DgDRkKZvQT6aMqcA@mail.gmail.com>
Message-ID: <CAPhsuW5YYa6nQhO2=zor75XkdKpFysZD42DgDRkKZvQT6aMqcA@mail.gmail.com>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, bpf@vger.kernel.org, linuxppc-dev@l
 ists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 8, 2023 at 11:41=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Tue, Jun 06, 2023 at 11:21:59AM -0700, Song Liu wrote:
> > On Mon, Jun 5, 2023 at 3:09=E2=80=AFAM Mark Rutland <mark.rutland@arm.c=
om> wrote:
> >
> > [...]
> >
> > > > > > Can you give more detail on what parameters you need? If the on=
ly extra
> > > > > > parameter is just "does this allocation need to live close to k=
ernel
> > > > > > text", that's not that big of a deal.
> > > > >
> > > > > My thinking was that we at least need the start + end for each ca=
ller. That
> > > > > might be it, tbh.
> > > >
> > > > Do you mean that modules will have something like
> > > >
> > > >       jit_text_alloc(size, MODULES_START, MODULES_END);
> > > >
> > > > and kprobes will have
> > > >
> > > >       jit_text_alloc(size, KPROBES_START, KPROBES_END);
> > > > ?
> > >
> > > Yes.
> >
> > How about we start with two APIs:
> >      jit_text_alloc(size);
> >      jit_text_alloc_range(size, start, end);
> >
> > AFAICT, arm64 is the only arch that requires the latter API. And TBH, I=
 am
> > not quite convinced it is needed.
>
> Right now arm64 and riscv override bpf and kprobes allocations to use the
> entire vmalloc address space, but having the ability to allocate generate=
d
> code outside of modules area may be useful for other architectures.
>
> Still the start + end for the callers feels backwards to me because the
> callers do not define the ranges, but rather the architectures, so we sti=
ll
> need a way for architectures to define how they want allocate memory for
> the generated code.

Yeah, this makes sense.

>
> > > > It sill can be achieved with a single jit_alloc_arch_params(), just=
 by
> > > > adding enum jit_type parameter to jit_text_alloc().
> > >
> > > That feels backwards to me; it centralizes a bunch of information abo=
ut
> > > distinct users to be able to shove that into a static array, when the=
 callsites
> > > can pass that information.
> >
> > I think we only two type of users: module and everything else (ftrace, =
kprobe,
> > bpf stuff). The key differences are:
> >
> >   1. module uses text and data; while everything else only uses text.
> >   2. module code is generated by the compiler, and thus has stronger
> >   requirements in address ranges; everything else are generated via som=
e
> >   JIT or manual written assembly, so they are more flexible with addres=
s
> >   ranges (in JIT, we can avoid using instructions that requires a speci=
fic
> >   address range).
> >
> > The next question is, can we have the two types of users share the same
> > address ranges? If not, we can reserve the preferred range for modules,
> > and let everything else use the other range. I don't see reasons to fur=
ther
> > separate users in the "everything else" group.
>
> I agree that we can define only two types: modules and everything else an=
d
> let the architectures define if they need different ranges for these two
> types, or want the same range for everything.
>
> With only two types we can have two API calls for alloc, and a single
> structure that defines the ranges etc from the architecture side rather
> than spread all over.
>
> Like something along these lines:
>
>         struct execmem_range {
>                 unsigned long   start;
>                 unsigned long   end;
>                 unsigned long   fallback_start;
>                 unsigned long   fallback_end;
>                 pgprot_t        pgprot;
>                 unsigned int    alignment;
>         };
>
>         struct execmem_modules_range {
>                 enum execmem_module_flags flags;
>                 struct execmem_range text;
>                 struct execmem_range data;
>         };
>
>         struct execmem_jit_range {
>                 struct execmem_range text;
>         };
>
>         struct execmem_params {
>                 struct execmem_modules_range    modules;
>                 struct execmem_jit_range        jit;
>         };
>
>         struct execmem_params *execmem_arch_params(void);
>
>         void *execmem_text_alloc(size_t size);
>         void *execmem_data_alloc(size_t size);
>         void execmem_free(void *ptr);

With the jit variation, maybe we can just call these
module_[text|data]_alloc()?

btw: Depending on the implementation of the allocator, we may also
need separate free()s for text and data.

>
>         void *jit_text_alloc(size_t size);
>         void jit_free(void *ptr);
>

[...]

How should we move ahead from here?

AFAICT, all these changes can be easily extended and refactored
in the future, so we don't have to make it perfect the first time.
OTOH, having the interface committed (either this set or my
module_alloc_type version) can unblock works in the binpack
allocator and the users side. Therefore, I think we can move
relatively fast here?

Thanks,
Song
