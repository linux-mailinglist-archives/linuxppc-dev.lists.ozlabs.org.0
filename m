Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8639C721CCE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 06:06:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZKmq1NqFz3dyp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 14:06:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uxKGktXN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uxKGktXN;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZKlw05kjz3cCc
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jun 2023 14:06:03 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EA48E60C3D
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jun 2023 04:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E194C4339B
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jun 2023 04:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685937961;
	bh=WtI1jY3mnr9zb4/0mcezfP7YgsPqPtpWRWa72DAZTTg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uxKGktXNqn49bEfc54rxrLont7pLs83GyZuzAufBwsGBjuGMKdcRP/bEdwYmfXXxU
	 WvxTYj5OfeXmTt5HLnDLwPgr67Lkt70CP1EvdU2veiDINIXLIDAS+iKL+CqrOBDxNc
	 W/VQJXu20GHLghTy7G8UfIn1gM+F5ueXv0na8lU8CSN0FmokvQ65P4mX8K8i05YG/W
	 fPh72tKYwA3H59nPmnDH3bp9qH5k5y+9C+A7tg1dtcxIc9fAAEgtE2WRW9gNO+56RG
	 rnpEhaZc8TsRLxnuELVYU2NxAebO69dROiM74lzh42BNKszJ2YPFsTB9bCrjTQGdS0
	 SNLJmYWsBwYSA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b1b6865c7cso28305131fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Jun 2023 21:06:01 -0700 (PDT)
X-Gm-Message-State: AC+VfDy5FzrVg5siq9afnVNOl4F/Mz9pJ734P9YlY0AxR/BCi9TU9TD9
	F+lanURDiUc+XdOZ560j39xj9RKkBe8SkNTZ4QM=
X-Google-Smtp-Source: ACHHUZ5GrSEK3PQNTobRaaPR4GI9Q/dG/dH9vtDqov4NPtsLbAuvSoOBGIqnwRO1u3fwexaWyE5OrfsdUvjgUci7FZk=
X-Received: by 2002:a2e:2419:0:b0:2ad:d6cd:efdd with SMTP id
 k25-20020a2e2419000000b002add6cdefddmr3089294ljk.32.1685937959380; Sun, 04
 Jun 2023 21:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230601101257.530867-1-rppt@kernel.org> <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan> <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
 <CAPhsuW7Euczff_KB70nuH=Hhf2EYHAf=xiQR7mFqVfByhD34XA@mail.gmail.com>
 <ZHzRxE5V6YzGVsHy@moria.home.lan> <CAPhsuW7iEDa44jxc_7Cj4KnVhtct-UTO2JtVK-U7o2ynn2iX8Q@mail.gmail.com>
 <ZH0EseWI9F1n9yJx@moria.home.lan>
In-Reply-To: <ZH0EseWI9F1n9yJx@moria.home.lan>
From: Song Liu <song@kernel.org>
Date: Sun, 4 Jun 2023 21:05:47 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7S40xCz_e0fdimfC+ybO=kvMg3SSzTd1s4qiOcvmJJcA@mail.gmail.com>
Message-ID: <CAPhsuW7S40xCz_e0fdimfC+ybO=kvMg3SSzTd1s4qiOcvmJJcA@mail.gmail.com>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Puranjay Mohan <puranjay12@gmail.com>, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, bpf@vger.k
 ernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jun 4, 2023 at 2:40=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Sun, Jun 04, 2023 at 02:22:30PM -0700, Song Liu wrote:
> > On Sun, Jun 4, 2023 at 11:02=E2=80=AFAM Kent Overstreet
> > <kent.overstreet@linux.dev> wrote:
> > >
> > > On Fri, Jun 02, 2023 at 11:20:58AM -0700, Song Liu wrote:
> > > > IIUC, arm64 uses VMALLOC address space for BPF programs. The reason
> > > > is each BPF program uses at least 64kB (one page) out of the 128MB
> > > > address space. Puranjay Mohan (CC'ed) is working on enabling
> > > > bpf_prog_pack for arm64. Once this work is done, multiple BPF progr=
ams
> > > > will be able to share a page. Will this improvement remove the need=
 to
> > > > specify a different address range for BPF programs?
> > >
> > > Can we please stop working on BPF specific sub page allocation and fo=
cus
> > > on doing this in mm/? This never should have been in BPF in the first
> > > place.
> >
> > That work is mostly independent of the allocator work we are discussing=
 here.
> > The goal Puranjay's work is to enable the arm64 BPF JIT engine to use a
> > ROX allocator. The allocator could be the bpf_prog_pack allocator, or j=
italloc,
> > or module_alloc_type. Puranjay is using bpf_prog_alloc for now. But onc=
e
> > jitalloc or module_alloc_type (either one) is merged, we will migrate B=
PF
> > JIT engines (x86_64 and arm64) to the new allocator and then tear down
> > bpf_prog_pack.
> >
> > Does this make sense?
>
> Yeah, as long as that's the plan. Maybe one of you could tell us what
> issues were preventing prog_pack from being used in the first place, it
> might be relevant - this is the time to get the new allocator API right.

The JIT engine does a lot of writes. Instead of doing many text_poke(),
we are using a temporary RW write buffer, and then do text_poke_copy()
at the end. To make this work, we need the JIT engine to be able to
handle an RW temporary buffer and an RO final memory region. There
is nothing preventing prog_pack to work. It is just we need to do the
work.

Thanks,
Song
