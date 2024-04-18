Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFA88A9FCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 18:14:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QKWF8JTq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VL2sw3WnXz3dHM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 02:14:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QKWF8JTq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VL2s852HDz3cWp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 02:14:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AFF1ACE185D
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Apr 2024 16:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7322C3277B
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Apr 2024 16:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713456841;
	bh=q/TFlw8SQh+Cko4nU/ng2SJ+spicGdHxGtHPBf/Abnk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QKWF8JTqm58INLwGllp0FpCdKA+4HVthmQGojPwlLwz/CzvDupBln2tDa0JxxVT3h
	 9I7DpSmJ8lOrojowdqSiCh2qcPLKXHcJWahr/LsRKoimlCRLEGzrENrG3o9kFH+usO
	 i5Uoall6+ng5DIWhZcIBvHqNjg1V9YxU/O3gqnfaquqVpvjeUa1Ln7x3DimeC08fFd
	 hg+ro7zsoce8fMGXC9TZUX4AVwsN42ulovUJae+4eeUwyJYlzcMgZJLHMlMif6hKb8
	 XAy19kJzQAz55LYLEJJVfb5Ee/I081i7hdGhY0gcdzrCOy2SjjHFiLjMG16M8+ZMXw
	 edLWR6CS/8U/g==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d717603aa5so14117291fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Apr 2024 09:14:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUYo3JplVE5R6jo/MBOI5eWiLbBs2lqUFHISdoubJ5j8ReyW/R7t1wHykXi+TN5NlKATA2sMx5XPgxJsVfJQW8mNM0ApqIRN3Ka/NQBA==
X-Gm-Message-State: AOJu0YwTlh9ilsY0I9f3mWFcWQPDOlRCMMBdcGsPLuoVXM3m6VpBjkXh
	gvs5/qIrUcVMJWzy3V5Czl53oZyxnucQHP9Bwrw3HbPiA4VNHhXGOlv1MjXkqalHBbuZiqBm1QO
	EhSzPaXXc+zLy9l7UGjV39TpDGzc=
X-Google-Smtp-Source: AGHT+IHLiDWbpJNv5cpg7tSucX1RJbILlT9QE6EE0zaOt0RsDuLJ8JfO9fqfVmmivnqe0091gRHYHRJJ+tsSYBR5kLA=
X-Received: by 2002:ac2:5fad:0:b0:519:569b:361b with SMTP id
 s13-20020ac25fad000000b00519569b361bmr1973077lfe.63.1713456819439; Thu, 18
 Apr 2024 09:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240411160051.2093261-1-rppt@kernel.org> <20240411160051.2093261-6-rppt@kernel.org>
 <20240415075241.GF40213@noisy.programming.kicks-ass.net> <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
 <Zh4nJp8rv1qRBs8m@kernel.org> <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
 <ZiE91CJcNw7gBj9g@kernel.org>
In-Reply-To: <ZiE91CJcNw7gBj9g@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 18 Apr 2024 09:13:27 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
Message-ID: <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
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

On Thu, Apr 18, 2024 at 8:37=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
[...]
> >
> > Is +/- 2G enough for all realistic use cases? If so, I guess we don't
> > really need
> > EXECMEM_ANYWHERE below?
> >
> > > >
> > > > * I'm not sure about BPF's requirements; it seems happy doing the s=
ame as
> > > >   modules.
> > >
> > > BPF are happy with vmalloc().
> > >
> > > > So if we *must* use a common execmem allocator, what we'd reall wan=
t is our own
> > > > types, e.g.
> > > >
> > > >       EXECMEM_ANYWHERE
> > > >       EXECMEM_NOPLT
> > > >       EXECMEM_PREL32
> > > >
> > > > ... and then we use those in arch code to implement module_alloc() =
and friends.
> > >
> > > I'm looking at execmem_types more as definition of the consumers, may=
be I
> > > should have named the enum execmem_consumer at the first place.
> >
> > I think looking at execmem_type from consumers' point of view adds
> > unnecessary complexity. IIUC, for most (if not all) archs, ftrace, kpro=
be,
> > and bpf (and maybe also module text) all have the same requirements.
> > Did I miss something?
>
> It's enough to have one architecture with different constrains for kprobe=
s
> and bpf to warrant a type for each.
>

AFAICT, some of these constraints can be changed without too much work.

> Where do you see unnecessary complexity?
>
> > IOW, we have
> >
> > enum execmem_type {
> >         EXECMEM_DEFAULT,
> >         EXECMEM_TEXT,
> >         EXECMEM_KPROBES =3D EXECMEM_TEXT,
> >         EXECMEM_FTRACE =3D EXECMEM_TEXT,
> >         EXECMEM_BPF =3D EXECMEM_TEXT,      /* we may end up without
> > _KPROBE, _FTRACE, _BPF */
> >         EXECMEM_DATA,  /* rw */
> >         EXECMEM_RO_DATA,
> >         EXECMEM_RO_AFTER_INIT,
> >         EXECMEM_TYPE_MAX,
> > };
> >
> > Does this make sense?
>
> How do you suggest to deal with e.g. riscv that has separate address spac=
es
> for modules, kprobes and bpf?

IIUC, modules and bpf use the same address space on riscv, while kprobes us=
e
vmalloc address. I haven't tried this yet, but I think we can let
kprobes use the
same space as modules and bpf, which is:

ffffffff00000000 |  -4     GB | ffffffff7fffffff |    2 GB | modules, BPF

Did I get this right?

Thanks,
Song
