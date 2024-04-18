Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B928AA48A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 23:02:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LKsu6wgw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VL9G50DHfz3vY6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 07:02:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LKsu6wgw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VL9FM1LSxz3cnv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 07:01:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 12ECC618FB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Apr 2024 21:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74FCC32781
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Apr 2024 21:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713474116;
	bh=Q9xFEu3Y5LoeO0EqCkhUGHL0dsvPtZI4/AmKYvf5MnY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LKsu6wgwztewDd1Kf4NCYPGtYXsdZ+ofFTa2d1MI2zHPuKQq+mmWhhJ/cfOoO74/D
	 CmcZP1gphR1rk0/C2WrZMmDohWk9TLfoE/BVlmPcx4Ya9rM6Nh6AU0ABzg9gD2wvws
	 H60UGmuK3KY+NjPIGsNka51Re3XwprsD1pbbtq74ctVkAghiYQUsQoRN8cLIcXPPsL
	 rXx3eFrMppxOnjZtTYcB0+vT04YNLcaQFvbo1fn264bSOiuX8e1yptQTDfZHVYZ58/
	 0oeaQEoE1JgibuYG0nL+yludx9odg4AlyJea9d8FGku7Y1tGZRmj1BnxpJESiJFknk
	 jlSY0S/C8n1Cg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d6ff0422a2so18657921fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Apr 2024 14:01:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWsmKZ57Fp0tKV3jMPL0yIdRxG5rwhU//RCkpAQlFU+OxCeUlfJCQJ/DYQScZoKOyvL5Obuso4srs/dTaHVcYHodNYyBAprJ/lyve/xBw==
X-Gm-Message-State: AOJu0YxwD+PJ7+7MsirrondJPocRo9xHz3AUAsZmws+EriwdLCp4YQIM
	XJHfm3napm/J2Jj35QX5+YhWkr1N0ZxgwdgTDUNNx66l+GPzZCTTFNBN8t7D4wYO7WguhIiB144
	IhZutRLxB++jFxMMBfwixOmgyBnQ=
X-Google-Smtp-Source: AGHT+IHNxy9sJsnZs3KQVfU0+czeg8tBpsYhbjwNsSaDNt4tlgSyRo9Mz2ssjEN7kjA5vVRJEg5DihQkgyMA2Jl/jC4=
X-Received: by 2002:a05:6512:1251:b0:516:cec0:1fc0 with SMTP id
 fb17-20020a056512125100b00516cec01fc0mr104453lfb.63.1713474094462; Thu, 18
 Apr 2024 14:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240411160051.2093261-1-rppt@kernel.org> <20240411160051.2093261-6-rppt@kernel.org>
 <20240415075241.GF40213@noisy.programming.kicks-ass.net> <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
 <Zh4nJp8rv1qRBs8m@kernel.org> <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
 <ZiE91CJcNw7gBj9g@kernel.org> <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
 <ZiFd567L4Zzm2okO@kernel.org>
In-Reply-To: <ZiFd567L4Zzm2okO@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 18 Apr 2024 14:01:22 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
Message-ID: <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, linux-mm@kvack.org, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, linux-mips@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, Kent Overstreet <kent.overstree
 t@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Bjorn Topel <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 18, 2024 at 10:54=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
> On Thu, Apr 18, 2024 at 09:13:27AM -0700, Song Liu wrote:
> > On Thu, Apr 18, 2024 at 8:37=E2=80=AFAM Mike Rapoport <rppt@kernel.org>=
 wrote:
> > > > >
> > > > > I'm looking at execmem_types more as definition of the consumers,=
 maybe I
> > > > > should have named the enum execmem_consumer at the first place.
> > > >
> > > > I think looking at execmem_type from consumers' point of view adds
> > > > unnecessary complexity. IIUC, for most (if not all) archs, ftrace, =
kprobe,
> > > > and bpf (and maybe also module text) all have the same requirements=
.
> > > > Did I miss something?
> > >
> > > It's enough to have one architecture with different constrains for kp=
robes
> > > and bpf to warrant a type for each.
> >
> > AFAICT, some of these constraints can be changed without too much work.
>
> But why?
> I honestly don't understand what are you trying to optimize here. A few
> lines of initialization in execmem_info?

IIUC, having separate EXECMEM_BPF and EXECMEM_KPROBE makes it
harder for bpf and kprobe to share the same ROX page. In many use cases,
a 2MiB page (assuming x86_64) is enough for all BPF, kprobe, ftrace, and
module text. It is not efficient if we have to allocate separate pages for =
each
of these use cases. If this is not a problem, the current approach works.

Thanks,
Song
