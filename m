Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C212724B3B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 20:23:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbJkJ2KZwz3f0W
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 04:23:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZWPc2Ay9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZWPc2Ay9;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbJjQ08g4z2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 04:22:17 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E3E26636A6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 18:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278B9C43321
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 18:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686075734;
	bh=08bgDTu6K2r14VqmkEIMfCPJQ/ZZrnAx7Zh60inB9tQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZWPc2Ay9qV+46W5EIl1Hat/oWhCmkf2atoI7Djyx7M9K8nTcPWM51zO0JgXQR/xJA
	 t6kkVflNQu8aEchQ0gWokejvbn0lD4N+mkDVLz/vpv4NfXuw4Ue4w5/ggGi9dBfKiZ
	 FbyGdgANCc28tlTGlHG3sjNhVLTPxaSnMiPYhxWksxnkaN6w7Z8t8XpDCqJBTwrewz
	 7miB72dJ8VC2moDFlWb2Dg+2pHaD8TB88qpU65gh5ZEErvyTm+QOEYn4FI4IN5NnX+
	 vSaQ/C5uDNk1W0XxM90aSXxJjvBdgk4T++XB8N2/4BPrh3DvP9IK4m5Qlazjdmj/3m
	 EHdGa+FT3FpmQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b1a4250b07so75710931fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 11:22:14 -0700 (PDT)
X-Gm-Message-State: AC+VfDxg9qRj/HOyLl3qwJdCWVqYWS+Rh1Lg9dmVcvVPLozSQ+K4k+Nr
	tjHnrH2UeXNPgqjC7Vg09p0kOE2K6imbnl2yaA4=
X-Google-Smtp-Source: ACHHUZ5bLSr3tA3IB8xCjeC0rEYdnEDeq7vmc1y/QuS5oHjyhnnuqZDpSw2PwmODz4CMTnRxT8zG59Qp1zLSa+hdG70=
X-Received: by 2002:a2e:82d0:0:b0:2b0:297c:cbdf with SMTP id
 n16-20020a2e82d0000000b002b0297ccbdfmr1546782ljh.1.1686075731505; Tue, 06 Jun
 2023 11:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230601101257.530867-1-rppt@kernel.org> <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan> <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
 <20230605092040.GB3460@kernel.org> <ZH20XkD74prrdN4u@FVFF77S0Q05N>
In-Reply-To: <ZH20XkD74prrdN4u@FVFF77S0Q05N>
From: Song Liu <song@kernel.org>
Date: Tue, 6 Jun 2023 11:21:59 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7ntn_HpVWdGK_hYVd3zsPEFToBNfmtt0m6K8SwfxJ66Q@mail.gmail.com>
Message-ID: <CAPhsuW7ntn_HpVWdGK_hYVd3zsPEFToBNfmtt0m6K8SwfxJ66Q@mail.gmail.com>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
To: Mark Rutland <mark.rutland@arm.com>
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
Cc: x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.o
 zlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 5, 2023 at 3:09=E2=80=AFAM Mark Rutland <mark.rutland@arm.com> =
wrote:

[...]

> > > > Can you give more detail on what parameters you need? If the only e=
xtra
> > > > parameter is just "does this allocation need to live close to kerne=
l
> > > > text", that's not that big of a deal.
> > >
> > > My thinking was that we at least need the start + end for each caller=
. That
> > > might be it, tbh.
> >
> > Do you mean that modules will have something like
> >
> >       jit_text_alloc(size, MODULES_START, MODULES_END);
> >
> > and kprobes will have
> >
> >       jit_text_alloc(size, KPROBES_START, KPROBES_END);
> > ?
>
> Yes.

How about we start with two APIs:
     jit_text_alloc(size);
     jit_text_alloc_range(size, start, end);

AFAICT, arm64 is the only arch that requires the latter API. And TBH, I am
not quite convinced it is needed.

>
> > It sill can be achieved with a single jit_alloc_arch_params(), just by
> > adding enum jit_type parameter to jit_text_alloc().
>
> That feels backwards to me; it centralizes a bunch of information about
> distinct users to be able to shove that into a static array, when the cal=
lsites
> can pass that information.

I think we only two type of users: module and everything else (ftrace, kpro=
be,
bpf stuff). The key differences are:

  1. module uses text and data; while everything else only uses text.
  2. module code is generated by the compiler, and thus has stronger
  requirements in address ranges; everything else are generated via some
  JIT or manual written assembly, so they are more flexible with address
  ranges (in JIT, we can avoid using instructions that requires a specific
  address range).

The next question is, can we have the two types of users share the same
address ranges? If not, we can reserve the preferred range for modules,
and let everything else use the other range. I don't see reasons to further
separate users in the "everything else" group.

>
> What's *actually* common after separating out the ranges? Is it just the
> permissions?

I believe permission is the key, as we need the hardware to enforce
permission.

>
> If we want this to be able to share allocations and so on, why can't we d=
o this
> like a kmem_cache, and have the callsite pass a pointer to the allocator =
data?
> That would make it easy for callsites to share an allocator or use a dist=
inct
> one.

Sharing among different call sites will give us more benefit (in TLB
misses rate,
etc.). For example, a 2MB page may host text of two kernel modules, 4 kprob=
es,
6 ftrace trampolines, and 10 BPF programs. All of these only require one en=
try
in the iTLB.

Thanks,
Song
