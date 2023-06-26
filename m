Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF0073D7A9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 08:14:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qNNMb3Ck;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QqHck257gz3bVw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 16:14:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qNNMb3Ck;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqHbk3HzGz30Ln
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 16:13:54 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AD34D60C89
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 06:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211E4C433CA
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 06:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687760031;
	bh=tIDPiX4oZCQnSjoJrRmXYm4/HW+kneyQ9COWSK2/0ZY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qNNMb3Ckj8gq1/QInski5wG5ArtOatt87cA047HzRtNFHppOc4It0+VWaIsfzHFsB
	 WrN6jVIMHi0yRI04fG3OD7jssfPGtprz/v9IYEgH6gp9MEZgvhvc5Pm8AbW408S8Jb
	 jBqQ+VH0JZbJ65jkY6m7XFQN7sFo3emIBDMTBuTMfAZt3UCk0Nk1/8DByLbh+o20x+
	 vSROUMnPAlxNdKTNbMxF4h9KnaTKmh7iRYJddPjAUTkQ+m6E6ExTuuNs+cFmMEMFWI
	 27i1QApMD/eATfQHzHsZWM5hBexPtkxEcZpNrWbWUCiWrnTcNpgcd+hZVkdhTHUN5k
	 kva9bmksiqB6g==
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-313e714342cso1834012f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jun 2023 23:13:51 -0700 (PDT)
X-Gm-Message-State: AC+VfDwvqvKZP284V0dCpNWHgQ4Ovp/SuR5BvF6RTgoqN0YRhcurWacj
	Msu6LmeLgHj+Yed2ixZ+tVOG7fW8iuJ+EKE8Giw=
X-Google-Smtp-Source: ACHHUZ7Z1BsryLRBJgwSdFpXVYEgN5RfTaOqmCtmT2+wVlbf2QTe+Yf05nZb1BtwYAaKvRHJWuEELQy+6WhHrJTYCe0=
X-Received: by 2002:a05:6512:705:b0:4f9:ec5e:d624 with SMTP id
 b5-20020a056512070500b004f9ec5ed624mr1614382lfs.38.1687760008514; Sun, 25 Jun
 2023 23:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-3-rppt@kernel.org>
 <f9a7eebe-d36e-4587-b99d-35d4edefdd14@app.fastmail.com> <20230618080027.GA52412@kernel.org>
 <a17c65c6-863f-4026-9c6f-a04b659e9ab4@app.fastmail.com> <20230625161417.GK52412@kernel.org>
 <90161ac9-3ca0-4c72-b1c4-ab1293e55445@app.fastmail.com> <20230625174257.GL52412@kernel.org>
 <20230625180741.jrrtkq55c4jrqh3t@moria.home.lan>
In-Reply-To: <20230625180741.jrrtkq55c4jrqh3t@moria.home.lan>
From: Song Liu <song@kernel.org>
Date: Sun, 25 Jun 2023 23:13:15 -0700
X-Gmail-Original-Message-ID: <CAPhsuW45gmtCVgA0mg6X87x5EOzSmVqq3SCMSR6agyiukiJvEQ@mail.gmail.com>
Message-ID: <CAPhsuW45gmtCVgA0mg6X87x5EOzSmVqq3SCMSR6agyiukiJvEQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] mm: introduce execmem_text_alloc() and jit_text_alloc()
To: Kent Overstreet <kent.overstreet@linux.dev>
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
Cc: Mark Rutland <mark.rutland@arm.com>, the arch/x86 maintainers <x86@kernel.org>, loongarch@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, torvalds@linux-foundation.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, pjt@google.com, linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, Linux Kerne
 l Mailing List <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jun 25, 2023 at 11:07=E2=80=AFAM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Sun, Jun 25, 2023 at 08:42:57PM +0300, Mike Rapoport wrote:
> > On Sun, Jun 25, 2023 at 09:59:34AM -0700, Andy Lutomirski wrote:
> > >
> > >
> > > On Sun, Jun 25, 2023, at 9:14 AM, Mike Rapoport wrote:
> > > > On Mon, Jun 19, 2023 at 10:09:02AM -0700, Andy Lutomirski wrote:
> > > >>
> > > >> On Sun, Jun 18, 2023, at 1:00 AM, Mike Rapoport wrote:
> > > >> > On Sat, Jun 17, 2023 at 01:38:29PM -0700, Andy Lutomirski wrote:
> > > >> >> On Fri, Jun 16, 2023, at 1:50 AM, Mike Rapoport wrote:
> > > >> >> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > > >> >> >
> > > >> >> > module_alloc() is used everywhere as a mean to allocate memor=
y for code.
> > > >> >> >
> > > >> >> > Beside being semantically wrong, this unnecessarily ties all =
subsystems
> > > >> >> > that need to allocate code, such as ftrace, kprobes and BPF t=
o modules
> > > >> >> > and puts the burden of code allocation to the modules code.
> > > >> >> >
> > > >> >> > Several architectures override module_alloc() because of vari=
ous
> > > >> >> > constraints where the executable memory can be located and th=
is causes
> > > >> >> > additional obstacles for improvements of code allocation.
> > > >> >> >
> > > >> >> > Start splitting code allocation from modules by introducing
> > > >> >> > execmem_text_alloc(), execmem_free(), jit_text_alloc(), jit_f=
ree() APIs.
> > > >> >> >
> > > >> >> > Initially, execmem_text_alloc() and jit_text_alloc() are wrap=
pers for
> > > >> >> > module_alloc() and execmem_free() and jit_free() are replacem=
ents of
> > > >> >> > module_memfree() to allow updating all call sites to use the =
new APIs.
> > > >> >> >
> > > >> >> > The intention semantics for new allocation APIs:
> > > >> >> >
> > > >> >> > * execmem_text_alloc() should be used to allocate memory that=
 must reside
> > > >> >> >   close to the kernel image, like loadable kernel modules and=
 generated
> > > >> >> >   code that is restricted by relative addressing.
> > > >> >> >
> > > >> >> > * jit_text_alloc() should be used to allocate memory for gene=
rated code
> > > >> >> >   when there are no restrictions for the code placement. For
> > > >> >> >   architectures that require that any code is within certain =
distance
> > > >> >> >   from the kernel image, jit_text_alloc() will be essentially=
 aliased to
> > > >> >> >   execmem_text_alloc().
> > > >> >> >
> > > >> >>
> > > >> >> Is there anything in this series to help users do the appropria=
te
> > > >> >> synchronization when the actually populate the allocated memory=
 with
> > > >> >> code?  See here, for example:
> > > >> >
> > > >> > This series only factors out the executable allocations from mod=
ules and
> > > >> > puts them in a central place.
> > > >> > Anything else would go on top after this lands.
> > > >>
> > > >> Hmm.
> > > >>
> > > >> On the one hand, there's nothing wrong with factoring out common c=
ode. On
> > > >> the other hand, this is probably the right time to at least start
> > > >> thinking about synchronization, at least to the extent that it mig=
ht make
> > > >> us want to change this API.  (I'm not at all saying that this seri=
es
> > > >> should require changes -- I'm just saying that this is a good time=
 to
> > > >> think about how this should work.)
> > > >>
> > > >> The current APIs, *and* the proposed jit_text_alloc() API, don't a=
ctually
> > > >> look like the one think in the Linux ecosystem that actually
> > > >> intelligently and efficiently maps new text into an address space:
> > > >> mmap().
> > > >>
> > > >> On x86, you can mmap() an existing file full of executable code PR=
OT_EXEC
> > > >> and jump to it with minimal synchronization (just the standard imp=
licit
> > > >> ordering in the kernel that populates the pages before setting up =
the
> > > >> PTEs and whatever user synchronization is needed to avoid jumping =
into
> > > >> the mapping before mmap() finishes).  It works across CPUs, and th=
e only
> > > >> possible way userspace can screw it up (for a read-only mapping of
> > > >> read-only text, anyway) is to jump to the mapping too early, in wh=
ich
> > > >> case userspace gets a page fault.  Incoherence is impossible, and =
no one
> > > >> needs to "serialize" (in the SDM sense).
> > > >>
> > > >> I think the same sequence (from userspace's perspective) works on =
other
> > > >> architectures, too, although I think more cache management is need=
ed on
> > > >> the kernel's end.  As far as I know, no Linux SMP architecture nee=
ds an
> > > >> IPI to map executable text into usermode, but I could easily be wr=
ong.
> > > >> (IIRC RISC-V has very developer-unfriendly icache management, but =
I don't
> > > >> remember the details.)
> > > >>
> > > >> Of course, using ptrace or any other FOLL_FORCE to modify text on =
x86 is
> > > >> rather fraught, and I bet many things do it wrong when userspace i=
s
> > > >> multithreaded.  But not in production because it's mostly not used=
 in
> > > >> production.)
> > > >>
> > > >> But jit_text_alloc() can't do this, because the order of operation=
s
> > > >> doesn't match.  With jit_text_alloc(), the executable mapping show=
s up
> > > >> before the text is populated, so there is no atomic change from no=
t-there
> > > >> to populated-and-executable.  Which means that there is an opportu=
nity
> > > >> for CPUs, speculatively or otherwise, to start filling various cac=
hes
> > > >> with intermediate states of the text, which means that various
> > > >> architectures (even x86!) may need serialization.
> > > >>
> > > >> For eBPF- and module- like use cases, where JITting/code gen is qu=
ite
> > > >> coarse-grained, perhaps something vaguely like:
> > > >>
> > > >> jit_text_alloc() -> returns a handle and an executable virtual add=
ress,
> > > >> but does *not* map it there
> > > >> jit_text_write() -> write to that handle
> > > >> jit_text_map() -> map it and synchronize if needed (no sync needed=
 on
> > > >> x86, I think)
> > > >>
> > > >> could be more efficient and/or safer.
> > > >>
> > > >> (Modules could use this too.  Getting alternatives right might tak=
e some
> > > >> fiddling, because off the top of my head, this doesn't match how i=
t works
> > > >> now.)
> > > >>
> > > >> To make alternatives easier, this could work, maybe (haven't fully
> > > >> thought it through):
> > > >>
> > > >> jit_text_alloc()
> > > >> jit_text_map_rw_inplace() -> map at the target address, but RW, !X
> > > >>
> > > >> write the text and apply alternatives
> > > >>
> > > >> jit_text_finalize() -> change from RW to RX *and synchronize*
> > > >>
> > > >> jit_text_finalize() would either need to wait for RCU (possibly ex=
tra
> > > >> heavy weight RCU to get "serialization") or send an IPI.
> > > >
> > > > This essentially how modules work now. The memory is allocated RW, =
written
> > > > and updated with alternatives and then made ROX in the end with set=
_memory
> > > > APIs.
> > > >
> > > > The issue with not having the memory mapped X when it's written is =
that we
> > > > cannot use large pages to map it. One of the goals is to have execu=
table
> > > > memory mapped with large pages and make code allocator able to divi=
de that
> > > > page among several callers.
> > > >
> > > > So the idea was that jit_text_alloc() will have a cache of large pa=
ges
> > > > mapped ROX, will allocate memory from those caches and there will b=
e
> > > > jit_update() that uses text poking for writing to that memory.
> > > >
> > > > Upon allocation of a large page to increase the cache, that large p=
age will
> > > > be "invalidated" by filling it with breakpoint instructions (e.g in=
t3 on
> > > > x86)
> > >
> > > Is this actually valid?  In between int3 and real code, there=E2=80=
=99s a
> > > potential torn read of real code mixed up with 0xcc.
> >
> > You mean while doing text poking?
>
> I think we've been getting distracted by text_poke(). text_poke() does
> updates via a different virtual address which introduce new
> synchroniation wrinkles, but it's not the main issue.
>
> As _think_ I understand it, the root of the issue is that speculative
> execution - and that per Andy, speculative execution doesn't obey memory
> barriers.
>
> I have _not_ dug into the details of how retpolines work and all the
> spectre stuff that was going on, but - retpoline uses lfence, doesn't
> it? And if speculative execution is the issue here, isn't retpoline what
> we need?
>
> For this particular issue, I'm not sure "invalidate by filling with
> illegal instructions" makes sense. For that to work, would the processor
> have to execute a serialize operation and a retry on hitting an illegal
> instruction - or perhaps we do in the interrupt handler?
>
> But if filling with illegal instructions does act as a speculation
> barrier, then the issue is that a torn read could generate a legal but
> incorrect instruction.

What is a "torn read" here? I assume it is an instruction read that
goes at the wrong instruction boundary (CISC). If this is correct, do
we need to handle torn read caused by software bug, or hardware
bit flip, or both?

Thanks,
Song
