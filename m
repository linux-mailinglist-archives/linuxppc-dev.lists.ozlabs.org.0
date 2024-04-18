Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 635058A9E96
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 17:37:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aeWcQxDn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VL23M1TVkz3dK7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 01:37:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aeWcQxDn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VL22d5HDdz3cVM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 01:37:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2418A6189A;
	Thu, 18 Apr 2024 15:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B5DC113CC;
	Thu, 18 Apr 2024 15:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713454626;
	bh=/6e7koqBjxGvjgcyfyqozsKjWrzhFa989KlG6h+G83A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aeWcQxDnlnHobtWl/wSsLjnz0sXveyb3C9ZWUzhRio2isgl/ECkWL5MfHpcmEMTW7
	 /3gTsH9zle5F7iUK2MtYGoEYVXSVNBMbfrRBJdAbuLXT5C4Rci/tim3vMb2/HkXNT3
	 0BdaT4fZ5qEwRw4j04psUJzOpDE+rRKi3VjZ9pFXSPLklZtfjmSfaFH4UR8286lGH5
	 60/sHoFS02dtG3EW7cMEMNkjH3P1jYGW/oaOVey/LIzfE2ojr8NLFIf5bqbQCitx7d
	 hsc5w5cHL6aJI5zSA/0oAAIzFKyYOhtBXIDwcp4O2/SqIU/0gLgXdRamRK8O7d7lre
	 JIoqk7vYwCgbA==
Date: Thu, 18 Apr 2024 18:35:48 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
Message-ID: <ZiE91CJcNw7gBj9g@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-6-rppt@kernel.org>
 <20240415075241.GF40213@noisy.programming.kicks-ass.net>
 <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
 <Zh4nJp8rv1qRBs8m@kernel.org>
 <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
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

On Wed, Apr 17, 2024 at 04:32:49PM -0700, Song Liu wrote:
> On Tue, Apr 16, 2024 at 12:23 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > On Mon, Apr 15, 2024 at 06:36:39PM +0100, Mark Rutland wrote:
> > > On Mon, Apr 15, 2024 at 09:52:41AM +0200, Peter Zijlstra wrote:
> > > > On Thu, Apr 11, 2024 at 07:00:41PM +0300, Mike Rapoport wrote:
> > > > > +/**
> > > > > + * enum execmem_type - types of executable memory ranges
> > > > > + *
> > > > > + * There are several subsystems that allocate executable memory.
> > > > > + * Architectures define different restrictions on placement,
> > > > > + * permissions, alignment and other parameters for memory that can be used
> > > > > + * by these subsystems.
> > > > > + * Types in this enum identify subsystems that allocate executable memory
> > > > > + * and let architectures define parameters for ranges suitable for
> > > > > + * allocations by each subsystem.
> > > > > + *
> > > > > + * @EXECMEM_DEFAULT: default parameters that would be used for types that
> > > > > + * are not explcitly defined.
> > > > > + * @EXECMEM_MODULE_TEXT: parameters for module text sections
> > > > > + * @EXECMEM_KPROBES: parameters for kprobes
> > > > > + * @EXECMEM_FTRACE: parameters for ftrace
> > > > > + * @EXECMEM_BPF: parameters for BPF
> > > > > + * @EXECMEM_TYPE_MAX:
> > > > > + */
> > > > > +enum execmem_type {
> > > > > + EXECMEM_DEFAULT,
> > > > > + EXECMEM_MODULE_TEXT = EXECMEM_DEFAULT,
> > > > > + EXECMEM_KPROBES,
> > > > > + EXECMEM_FTRACE,
> > > > > + EXECMEM_BPF,
> > > > > + EXECMEM_TYPE_MAX,
> > > > > +};
> > > >
> > > > Can we please get a break-down of how all these types are actually
> > > > different from one another?
> > > >
> > > > I'm thinking some platforms have a tiny immediate space (arm64 comes to
> > > > mind) and has less strict placement constraints for some of them?
> > >
> > > Yeah, and really I'd *much* rather deal with that in arch code, as I have said
> > > several times.
> > >
> > > For arm64 we have two bsaic restrictions:
> > >
> > > 1) Direct branches can go +/-128M
> > >    We can expand this range by having direct branches go to PLTs, at a
> > >    performance cost.
> > >
> > > 2) PREL32 relocations can go +/-2G
> > >    We cannot expand this further.
> > >
> > > * We don't need to allocate memory for ftrace. We do not use trampolines.
> > >
> > > * Kprobes XOL areas don't care about either of those; we don't place any
> > >   PC-relative instructions in those. Maybe we want to in future.
> > >
> > > * Modules care about both; we'd *prefer* to place them within +/-128M of all
> > >   other kernel/module code, but if there's no space we can use PLTs and expand
> > >   that to +/-2G. Since modules can refreence other modules, that ends up
> > >   actually being halved, and modules have to fit within some 2G window that
> > >   also covers the kernel.
> 
> Is +/- 2G enough for all realistic use cases? If so, I guess we don't
> really need
> EXECMEM_ANYWHERE below?
> 
> > >
> > > * I'm not sure about BPF's requirements; it seems happy doing the same as
> > >   modules.
> >
> > BPF are happy with vmalloc().
> >
> > > So if we *must* use a common execmem allocator, what we'd reall want is our own
> > > types, e.g.
> > >
> > >       EXECMEM_ANYWHERE
> > >       EXECMEM_NOPLT
> > >       EXECMEM_PREL32
> > >
> > > ... and then we use those in arch code to implement module_alloc() and friends.
> >
> > I'm looking at execmem_types more as definition of the consumers, maybe I
> > should have named the enum execmem_consumer at the first place.
> 
> I think looking at execmem_type from consumers' point of view adds
> unnecessary complexity. IIUC, for most (if not all) archs, ftrace, kprobe,
> and bpf (and maybe also module text) all have the same requirements.
> Did I miss something?

It's enough to have one architecture with different constrains for kprobes
and bpf to warrant a type for each.

Where do you see unnecessary complexity?
 
> IOW, we have
> 
> enum execmem_type {
>         EXECMEM_DEFAULT,
>         EXECMEM_TEXT,
>         EXECMEM_KPROBES = EXECMEM_TEXT,
>         EXECMEM_FTRACE = EXECMEM_TEXT,
>         EXECMEM_BPF = EXECMEM_TEXT,      /* we may end up without
> _KPROBE, _FTRACE, _BPF */
>         EXECMEM_DATA,  /* rw */
>         EXECMEM_RO_DATA,
>         EXECMEM_RO_AFTER_INIT,
>         EXECMEM_TYPE_MAX,
> };
> 
> Does this make sense?
 
How do you suggest to deal with e.g. riscv that has separate address spaces
for modules, kprobes and bpf?

> Thanks,
> Song

-- 
Sincerely yours,
Mike.
