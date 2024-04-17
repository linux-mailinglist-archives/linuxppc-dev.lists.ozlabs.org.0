Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 309188A8F68
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 01:34:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ctJEl6Ox;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKcgN6ql7z3cc7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 09:34:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ctJEl6Ox;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKcfZ3nyqz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Apr 2024 09:33:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC8CB61616
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 23:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251BEC32781
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 23:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713396803;
	bh=UVEJ59zmDjoboUO24xHkWUbtsfOaV4nMW96i+du0QWo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ctJEl6OxbGN0Xa/zKZdRG4cmrNUa++7Za0jkJ76ZtS4yvfvZKwVdaTK6WvFe8qq4C
	 3ubstYMLecmqUf7Ha1ZgPPuqdQCxKklwq+lyjmMnjegcfFrb3zYZZ8krQoi+g2yTe3
	 1vkOF62ScCXzORqJTdBDsldzwZZCh3zMfKFWBWNgiEhQia++pLQr+3c9KsBx6W/8us
	 IgbFDf2xdbJbGhNFpf1JmYC0vs8MUefllz7TMoEY7laoJOdYwDEFsi99WbLhKzvKWl
	 5yYEVDRugTnRDaLu4cR88b/98Fy3f0gn/lzUqzLNogkEZMT9UHZdN790vLRHsHK2EP
	 N1ddMLXRw9eYw==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56e47843cc7so236743a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 16:33:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUlJsUVAlqaa6duEdt1g+ZGj+tMe7pLuSdPMMbJozPanlb/82zrLz9vz+ZEBNyuvfu5+oklhCSua3LHm746JL40zOak4B1vpAwvDSPsw==
X-Gm-Message-State: AOJu0YxXa+T7fJtgxbjItHMaARl6uXSKGVQw6EQgSixtt2JfPyQkMsfd
	hBIAJF4lMOBX2UjVEDzG7qKzi4ITcJNY3yINhAEwQ0cWY/9FzR3pdNdD9e1e9iJj4c5FMJYOSyn
	15yFnY2Sge2NJgXVnlkUaptGFIfA=
X-Google-Smtp-Source: AGHT+IEHuhOgcI3i5xgKWDt/RXWKyZ/pV78ei3ikSzZKT8X4nbojHe59GGn0FqOU5qFFQVvC8y10X+N0SPB8sxHbE0Q=
X-Received: by 2002:a05:6512:3184:b0:519:b95:22b5 with SMTP id
 i4-20020a056512318400b005190b9522b5mr446945lfe.51.1713396780753; Wed, 17 Apr
 2024 16:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240411160051.2093261-1-rppt@kernel.org> <20240411160051.2093261-6-rppt@kernel.org>
 <20240415075241.GF40213@noisy.programming.kicks-ass.net> <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
 <Zh4nJp8rv1qRBs8m@kernel.org>
In-Reply-To: <Zh4nJp8rv1qRBs8m@kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 17 Apr 2024 16:32:49 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
Message-ID: <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
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

On Tue, Apr 16, 2024 at 12:23=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
> On Mon, Apr 15, 2024 at 06:36:39PM +0100, Mark Rutland wrote:
> > On Mon, Apr 15, 2024 at 09:52:41AM +0200, Peter Zijlstra wrote:
> > > On Thu, Apr 11, 2024 at 07:00:41PM +0300, Mike Rapoport wrote:
> > > > +/**
> > > > + * enum execmem_type - types of executable memory ranges
> > > > + *
> > > > + * There are several subsystems that allocate executable memory.
> > > > + * Architectures define different restrictions on placement,
> > > > + * permissions, alignment and other parameters for memory that can=
 be used
> > > > + * by these subsystems.
> > > > + * Types in this enum identify subsystems that allocate executable=
 memory
> > > > + * and let architectures define parameters for ranges suitable for
> > > > + * allocations by each subsystem.
> > > > + *
> > > > + * @EXECMEM_DEFAULT: default parameters that would be used for typ=
es that
> > > > + * are not explcitly defined.
> > > > + * @EXECMEM_MODULE_TEXT: parameters for module text sections
> > > > + * @EXECMEM_KPROBES: parameters for kprobes
> > > > + * @EXECMEM_FTRACE: parameters for ftrace
> > > > + * @EXECMEM_BPF: parameters for BPF
> > > > + * @EXECMEM_TYPE_MAX:
> > > > + */
> > > > +enum execmem_type {
> > > > + EXECMEM_DEFAULT,
> > > > + EXECMEM_MODULE_TEXT =3D EXECMEM_DEFAULT,
> > > > + EXECMEM_KPROBES,
> > > > + EXECMEM_FTRACE,
> > > > + EXECMEM_BPF,
> > > > + EXECMEM_TYPE_MAX,
> > > > +};
> > >
> > > Can we please get a break-down of how all these types are actually
> > > different from one another?
> > >
> > > I'm thinking some platforms have a tiny immediate space (arm64 comes =
to
> > > mind) and has less strict placement constraints for some of them?
> >
> > Yeah, and really I'd *much* rather deal with that in arch code, as I ha=
ve said
> > several times.
> >
> > For arm64 we have two bsaic restrictions:
> >
> > 1) Direct branches can go +/-128M
> >    We can expand this range by having direct branches go to PLTs, at a
> >    performance cost.
> >
> > 2) PREL32 relocations can go +/-2G
> >    We cannot expand this further.
> >
> > * We don't need to allocate memory for ftrace. We do not use trampoline=
s.
> >
> > * Kprobes XOL areas don't care about either of those; we don't place an=
y
> >   PC-relative instructions in those. Maybe we want to in future.
> >
> > * Modules care about both; we'd *prefer* to place them within +/-128M o=
f all
> >   other kernel/module code, but if there's no space we can use PLTs and=
 expand
> >   that to +/-2G. Since modules can refreence other modules, that ends u=
p
> >   actually being halved, and modules have to fit within some 2G window =
that
> >   also covers the kernel.

Is +/- 2G enough for all realistic use cases? If so, I guess we don't
really need
EXECMEM_ANYWHERE below?

> >
> > * I'm not sure about BPF's requirements; it seems happy doing the same =
as
> >   modules.
>
> BPF are happy with vmalloc().
>
> > So if we *must* use a common execmem allocator, what we'd reall want is=
 our own
> > types, e.g.
> >
> >       EXECMEM_ANYWHERE
> >       EXECMEM_NOPLT
> >       EXECMEM_PREL32
> >
> > ... and then we use those in arch code to implement module_alloc() and =
friends.
>
> I'm looking at execmem_types more as definition of the consumers, maybe I
> should have named the enum execmem_consumer at the first place.

I think looking at execmem_type from consumers' point of view adds
unnecessary complexity. IIUC, for most (if not all) archs, ftrace, kprobe,
and bpf (and maybe also module text) all have the same requirements.
Did I miss something?

IOW, we have

enum execmem_type {
        EXECMEM_DEFAULT,
        EXECMEM_TEXT,
        EXECMEM_KPROBES =3D EXECMEM_TEXT,
        EXECMEM_FTRACE =3D EXECMEM_TEXT,
        EXECMEM_BPF =3D EXECMEM_TEXT,      /* we may end up without
_KPROBE, _FTRACE, _BPF */
        EXECMEM_DATA,  /* rw */
        EXECMEM_RO_DATA,
        EXECMEM_RO_AFTER_INIT,
        EXECMEM_TYPE_MAX,
};

Does this make sense?

Thanks,
Song
